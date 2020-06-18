import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;

import org.aspectj.lang.JoinPoint;

public aspect Logger {
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut transaccion() : call(* money*(..) );
    after() : transaccion() {
    	
    	try {
    		if (!file.exists()) {
                file.createNewFile();
            }
    		FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write("Tipo de transaccion: "+thisJoinPoint.toShortString()+
            		" Hora"+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE));
            bw.close();
    	}catch(Exception e){
    		e.printStackTrace();
    		
    	}
    	
    	System.out.println("****Transaccion realizada****");
    }
    
}