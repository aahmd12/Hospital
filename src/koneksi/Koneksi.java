/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package koneksi;

/**
 *
 * @author Aldi
 */
import java.sql.*;
public class Koneksi {
    private Connection koneksi;
    public Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Berhasil Konek");
        }
        catch(ClassNotFoundException ex) {
            System.out.println("Gagal Koneksi " + ex);
        }
        String url = "jdbc:mysql://localhost/rumahsakit";
        try {
            koneksi = DriverManager.getConnection(url,"root", "");
            System.out.println("berhasil koneksi database");
        }
        catch(SQLException ex) {
            System.out.println("gagal koneksi database " + ex);
        }
        return koneksi;
    }
}