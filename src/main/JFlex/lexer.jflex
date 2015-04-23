import java.io.FileReader;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;
%%
%public
%class Lexer
%standalone

%{
    private List<String> tokens= new ArrayList<>();
%}

%{
    public List<String> analizar(String archivo){
        FileReader in = null;
        try{
            in = new FileReader(archivo);
            Lexer lexer = new Lexer(in);
            while(!lexer.zzAtEOF){
                lexer.yylex();
        }
        }catch(Exception ex){
            System.out.println("Error al analizar el archivo");
        }finally{
            try{
                in.close();
                }catch(Exception ex){
                    System.out.println("Error al cerrar el archivo");
                }
        }
        return tokens;
    }
%}

%%


":"  {tokens.add(":"); System.out.println("DOS PUNTOS");}
";"  {tokens.add(";"); System.out.println("PUNTO Y COMA");}
"<"  {tokens.add("<"); System.out.println("Menor Que");}
">"  {tokens.add(">"); System.out.println("Mayor Que");}
"=="  {tokens.add("=="); System.out.println("Asignacion");}
"%%"  {tokens.add("%%"); System.out.println("Division");}
[_ A-z a-z]+  {tokens.add("id"); System.out.println("IDENTIFICADOR");}
[0-9]+  {tokens.add("NUM"); System.out.println("NUM");}