/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tugas.akhir3;

/**
 *
 * @author Aldi
 */
import javax.swing.SwingUtilities;
import tampilan.loginFrame;
public class TugasAkhir3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
          SwingUtilities.invokeLater(() -> {
            new loginFrame().setVisible(true);
        });
    }
    
}
