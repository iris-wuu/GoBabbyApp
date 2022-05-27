import java.sql.* ;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import java.util.Scanner;
import java.util.Date;

class GoBabbyApp
{
    public static void main ( String [ ] args ) throws SQLException {
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode = 0;      // Variable to hold SQLCODE
        String sqlState = "00000";  // Variable to hold SQLSTATE

        if (args.length > 0)
            tableName += args[0];
        else
            tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try {
            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
        } catch (Exception cnfe) {
            System.out.println("Class not found");
        }
//
        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "";
        String your_password = "";
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if (your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if (your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection(url, your_userid, your_password);
        Statement statement = con.createStatement();





        //midwife enter practitioner id
        String pracid = enterpracid(statement, con);

        //midwife enter appointment date
        try {
            String apptdate = enterdate(pracid, statement, con);

            displayappt(pracid, apptdate, statement, con);

            //display appt list for midwife to choose
            String apptnum = enterapptnum(pracid, statement, con);

            //midwife choose functionality
            enterchoice(pracid, apptnum, statement, con);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }



    //helperfunc1: check practitioner id
    public static String enterpracid (Statement statement, Connection con) throws SQLException {
        Scanner read_pracid = new Scanner(System.in);
        System.out.println("\n" + "Please enter your practitioner id [E] to exit: ");
        if (read_pracid.hasNext("E")) {
            System.out.println("Exit successfully.");
            statement.close();
            con.close();
            System.exit(0);
        }
        String pracid = read_pracid.nextLine();
        ResultSet rs_pracid = statement.executeQuery("SELECT practitionerid FROM Midwife WHERE practitionerid = '" + pracid + "';");

        while (!rs_pracid.next()) {
                System.out.println("\n" + "msg: practitionerid not valid.");
                System.out.println("Please enter your practitioner id [E] to exit:");
                if (read_pracid.hasNext("E")) {
                    System.out.println("Exit successfully.");
                    statement.close();
                    con.close();
                    System.exit(0);
                }
                pracid = read_pracid.nextLine();
                rs_pracid = statement.executeQuery("SELECT practitionerid FROM Midwife WHERE practitionerid = '" + pracid + "';");
        }
        return pracid;
    }



    //helperfunc2: check date
    public static String enterdate(String pracid, Statement statement, Connection con) throws SQLException, ParseException {
        Scanner read_apptdate = new Scanner(System.in);
        System.out.println("\n" + "Please enter the date (YYYY-MM-DD) for appointment list [E] to exit:");
        if (read_apptdate.hasNext("E")) {
            System.out.println("Exit successfully.");
            statement.close();
            con.close();
            System.exit(0);
        }
        String apptdate = read_apptdate.nextLine();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate sdf_apptdate = LocalDate.parse(apptdate, formatter);

        ResultSet rs_appt = statement.executeQuery("SELECT apptid, appttime, mname, Mother.mcardid, primary_pracid, backup_pracid FROM Midwife, Appointment, Pregnancy, RegParent, Mother" +
                " WHERE Appointment.pregid = Pregnancy.pregid AND Appointment.practitionerid = Midwife.practitionerid AND Pregnancy.parentid = RegParent.parentid AND RegParent.mcardid = Mother.mcardid" +
                " AND Midwife.practitionerid ='" + pracid + "' AND apptdate ='" + sdf_apptdate + "' ORDER BY appttime;");

        while (!rs_appt.next()) {
            System.out.println("\n" + "msg: no appointments for the date entered.");
            System.out.println("Please enter the date (YYYY-MM-DD) for appointment list [E] to exit:");

            if (read_apptdate.hasNext("E")) {
                System.out.println("Exit successfully.");
                statement.close();
                con.close();
                System.exit(0);
            }
            apptdate = read_apptdate.nextLine();
            formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            sdf_apptdate = LocalDate.parse(apptdate, formatter);

            rs_appt = statement.executeQuery("SELECT apptid, appttime, mname, Mother.mcardid, primary_pracid, backup_pracid FROM Midwife, Appointment, Pregnancy, RegParent, Mother" +
                    " WHERE Appointment.pregid = Pregnancy.pregid AND Appointment.practitionerid = Midwife.practitionerid AND Pregnancy.parentid = RegParent.parentid AND RegParent.mcardid = Mother.mcardid" +
                    " AND Midwife.practitionerid ='" + pracid + "' AND apptdate ='" + sdf_apptdate + "' ORDER BY appttime;");
        }
        return apptdate;
    }


    //helperfunc3: display appt list for the date entered
    public static void displayappt(String pracid, String apptdate, Statement statement, Connection con) throws SQLException{
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate sdf_apptdate = LocalDate.parse(apptdate, formatter);

        ResultSet rs_appt = statement.executeQuery("SELECT apptid, appttime, mname, Mother.mcardid, primary_pracid, backup_pracid FROM Midwife, Appointment, Pregnancy, RegParent, Mother" +
                " WHERE Appointment.pregid = Pregnancy.pregid AND Appointment.practitionerid = Midwife.practitionerid AND Pregnancy.parentid = RegParent.parentid AND RegParent.mcardid = Mother.mcardid" +
                " AND Midwife.practitionerid ='" + pracid + "' AND apptdate ='" + sdf_apptdate + "' ORDER BY appttime;");

        while (rs_appt.next()) {
            String appt_id = rs_appt.getString("apptid");
            String mother_name = rs_appt.getString("mname");
            String mother_cardid = rs_appt.getString("mcardid");
            String primary_pracid = rs_appt.getString("primary_pracid");
            String backup_pracid = rs_appt.getString("backup_pracid");
            if (pracid.equals(primary_pracid)) {
                System.out.println(appt_id + ":"+ "\t" + rs_appt.getTime("appttime") + " " + "P" + " " + mother_name + " " + mother_cardid);
            } else if (pracid.equals(backup_pracid)) {
                System.out.println(appt_id + ":"+ "\t" + rs_appt.getTime("appttime") + " " + "B" + " " + mother_name + " " + mother_cardid);
            }
        }
        System.out.println("\n" + "Enter the appointment number (apptid) that you would like to work on. " + "\n" + "\t\t" +
                "[E] to exit [D] to go back to another date :");
    }



    //helperfunc4 check appt num
    public static String enterapptnum(String pracid, Statement statement, Connection con) throws SQLException {
        Scanner read_apptnum = new Scanner(System.in);
        if (read_apptnum.hasNext("E")) {
            System.out.println("Exit successfully.");
            statement.close();
            con.close();
            System.exit(0);
        }
        String apptnum = read_apptnum.nextLine();

        while (apptnum.equals("D")) {
            try {
                String apptdate = enterdate(pracid, statement, con);
                displayappt(pracid, apptdate, statement, con);
            }catch(ParseException e) {e.printStackTrace();}
        //    System.out.println("Enter the appointment number (appt_id) that you would like to work on.[E] to exit [D] to go back to another date :");
            if (read_apptnum.hasNext("E")) {
                System.out.println("Exit successfully.");
                statement.close();
                con.close();
                System.exit(0);
            }
            apptnum = read_apptnum.nextLine();
        }
        return apptnum;
    }



    //helperfunc5: choice functionality
    public static void enterchoice (String pracid, String apptnum, Statement statement, Connection con) throws SQLException {
        ResultSet rs_mother = statement.executeQuery("SELECT Appointment.apptdate, Pregnancy.pregid, mname, Mother.mcardid FROM Appointment, Pregnancy, RegParent, Mother" +
                " WHERE Appointment.pregid = Pregnancy.pregid AND Pregnancy.parentid = RegParent.parentid AND RegParent.mcardid = Mother.mcardid" +
                " AND apptid = '" + apptnum + "' ;");

        rs_mother.next();
        String cur_pregid = rs_mother.getString("pregid");
        String cur_mname = rs_mother.getString("mname");
        String cur_mcardid = rs_mother.getString("mcardid");

        Scanner read_choice = new Scanner(System.in);
        System.out.println("\n" + "For" + " " + cur_mname + " " + cur_mcardid + "\n" + "\n" + "1. Review notes" + "\n" + "2. Review tests" + "\n" + "3. Add a note" + "\n" + "4. Prescribe a test" + "\n" + "5. Go back to the appointments." + "\n" + "\n" + "Enter your choice:" );
        String func_choice = read_choice.nextLine();

        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String str_apptdate = formatter.format(rs_mother.getDate("apptdate"));

        //functionality specs
        while (!func_choice.isEmpty()) {

            while (func_choice.equals("5")){                // 5. go back to the appointments

                displayappt(pracid, str_apptdate , statement, con);
                apptnum = enterapptnum(pracid, statement, con);
                rs_mother = statement.executeQuery("SELECT Pregnancy.pregid, mname, Mother.mcardid FROM Appointment, Pregnancy, RegParent, Mother" +
                        " WHERE Appointment.pregid = Pregnancy.pregid AND Pregnancy.parentid = RegParent.parentid AND RegParent.mcardid = Mother.mcardid" +
                        " AND apptid = '" + apptnum + "' ;");

                rs_mother.next();
                cur_pregid = rs_mother.getString("pregid");
                cur_mname = rs_mother.getString("mname");
                cur_mcardid = rs_mother.getString("mcardid");

                System.out.println("\n" + "For" + " " + cur_mname + " " + cur_mcardid + "\n" + "1. Review notes" + "\n" + "2. Review tests" + "\n" + "3. Add a note" + "\n" + "4. Prescribe a test" + "\n" + "5. Go back to the appointments." + "\n" + "\n" + "Enter your choice:");
                func_choice = read_choice.nextLine();
            }


            if (func_choice.equals("1")) {       //1. review notes
                ResultSet rs_notes = statement.executeQuery("SELECT timestmp, content FROM Notes, Appointment, Pregnancy" +
                        " WHERE Appointment.pregid = Pregnancy.pregid AND Appointment.apptid = Notes.Apptid AND Pregnancy.pregid = '" + cur_pregid + "' ORDER BY timestmp DESC;");
                while (rs_notes.next()) {
                    String note_content = rs_notes.getString("content");
                    System.out.println(rs_notes.getTimestamp("timestmp") + "\t" + note_content);
                }
                System.out.println("\n" + "For" + " " + cur_mname + " " + cur_mcardid + "\n" + "1. Review notes" + "\n" + "2. Review tests" + "\n" + "3. Add a note" + "\n" + "4. Prescribe a test" + "\n" + "5. Go back to the appointments." + "\n" + "\n" + "Enter your choice:");
                func_choice = read_choice.nextLine();


            } else if (func_choice.equals("2")) {        //2. review tests
                ResultSet rs_tests = statement.executeQuery("SELECT prescrdate, testtype, result FROM MedActions, Appointment, Pregnancy " +
                        "WHERE Appointment.pregid = Pregnancy.pregid AND Appointment.apptid = MedActions.Apptid AND Pregnancy.pregid = '" + cur_pregid + "' ORDER BY prescrdate DESC;");
                while (rs_tests.next()) {
                    String test_type = rs_tests.getString("testtype");
                    String test_result = rs_tests.getString("result");
                   // System.out.println(test_result);
                    if (test_result != null) {
                        System.out.println(rs_tests.getDate("prescrdate") + "\t[" + test_type + "]\t" + test_result);
                    } else {
                        System.out.println(rs_tests.getDate("prescrdate") + "\t[" + test_type + "]\t" + "PENDING");
                    }
                }
                System.out.println("\n" + "For" + " " + cur_mname + " " + cur_mcardid + "\n" + "1. Review notes" + "\n" + "2. Review tests" + "\n" + "3. Add a note" + "\n" + "4. Prescribe a test" + "\n" + "5. Go back to the appointments." + "\n" + "\n" + "Enter your choice:");
                func_choice = read_choice.nextLine();


            } else if (func_choice.equals("3")) {        //3. add a note
                System.out.println("\n" + "Please type your observation: ");
                String new_obs = read_choice.nextLine();

                Long cur_datetime = System.currentTimeMillis();
                Timestamp cur_timestmp = new Timestamp(cur_datetime);

                statement.executeUpdate("INSERT INTO Notes VALUES ( '" + apptnum + "' , '" + cur_timestmp + "' , '" + new_obs + "' );");

                System.out.println("\n" + "For" + " " + cur_mname + " " + cur_mcardid + "\n" + "1. Review notes" + "\n" + "2. Review tests" + "\n" + "3. Add a note" + "\n" + "4. Prescribe a test" + "\n" + "5. Go back to the appointments." + "\n" + "\n" + "Enter your choice:");
                func_choice = read_choice.nextLine();


            } else if (func_choice.equals("4")) {        //4. prescribe a test
                System.out.println("\n" + "Please enter the type of test: ");
                String new_test = read_choice.nextLine();

                ResultSet rs_appointment = statement.executeQuery("SELECT apptdate FROM Appointment WHERE Appointment.apptid = '" + apptnum + "' ;");
                rs_appointment.next();
                Date prescription_date = rs_appointment.getDate("apptdate");

                ResultSet rs_alltests = statement.executeQuery("SELECT COUNT(testid) FROM MedActions;");
                rs_alltests.next();
                int total_test = rs_alltests.getInt(1);
                Random ran_num = new Random(System.currentTimeMillis());
                int serial_num = (1 + ran_num.nextInt(9)) * 1000 + ran_num.nextInt(1000);
                String test_id = "tst" + Integer.toString(total_test+1) + "-" + Integer.toString(serial_num);

                statement.executeUpdate("INSERT INTO MedActions VALUES ( '" + test_id + "' , '" + apptnum + "' , '" + new_test + "' , '" + prescription_date + "' , '" + prescription_date + "' , " + null + " , " + null + "," +  null + ");");
                System.out.println("\n" + "For" + " " + cur_mname + " " + cur_mcardid + "\n" + "1. Review notes" + "\n" + "2. Review tests" + "\n" + "3. Add a note" + "\n" + "4. Prescribe a test" + "\n" + "5. Go back to the appointments." + "\n" + "\n" + "Enter your choice:");
                func_choice = read_choice.nextLine();
            }
        }
    }
}

