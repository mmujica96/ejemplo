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
    		
    		FileWriter fw = new FileWriter(file,true);
            fw.write("Tipo de transaccion: "+thisJoinPoint.toShortString()+
            		" Hora"+cal.getTime());
            fw.close();
    	}catch(Exception e){
    		e.getMessage();
    		
    	}
    	
    	System.out.println("****Transaccion realizada****");
    }
    
}