import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeReader;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class BarcodeScanner {

    public static String decodeBarcode(File barcodeImageFile) throws IOException, NotFoundException {
        BufferedImage bufferedImage = ImageIO.read(barcodeImageFile);
        LuminanceSource source = new BufferedImageLuminanceSource(bufferedImage);
        BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
        
        Reader reader = new MultiFormatReader();
        Result result = reader.decode(bitmap);
        
        return result.getText();
    }

    public static void main(String[] args) {
        try {
            File barcodeFile = new File("path_to_barcode_image.jpg");
            String barcodeText = decodeBarcode(barcodeFile);
            System.out.println("Decoded text from barcode: " + barcodeText);
            // Proceed to search for student information using the decoded text (NIC)
        } catch (IOException | NotFoundException e) {
            e.printStackTrace();
        }
    }
}
