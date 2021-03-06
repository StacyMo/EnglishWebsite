package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class db {
    private String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String sConnStr = "jdbc:sqlserver://localhost:1433;DatabaseName=EnglishLearning";
    public Connection connect = null;
    public ResultSet rs = null;

    public db() {
	try {
	    Class.forName(dbDriver).newInstance();
	    connect = DriverManager.getConnection(sConnStr, "sa", "sa");
	} catch (Exception ex) {
	    System.out.println("12121");
	}
    }

    public ResultSet executeQuery(String sql) {
	try {
	    connect = DriverManager.getConnection(sConnStr, "sa", "sa");
	    Statement stmt = connect.createStatement();
	    rs = stmt.executeQuery(sql);
	} catch (SQLException ex) {
	    System.err.println(ex.getMessage());
	}
	return rs;
    }

    public void executeUpdate(String sql) {

	Statement stmt = null;
	rs = null;
	try {
	    connect = DriverManager.getConnection(sConnStr, "sa", "sa");
	    stmt = connect.createStatement();
	    stmt.executeUpdate(sql);
	    stmt.close();
	    connect.close();
	} catch (SQLException ex) {
	    System.err.println(ex.getMessage());
	}
    }
}
