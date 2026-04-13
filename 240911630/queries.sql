CREATE TABLE StudentTable (
    RollNo NUMBER PRIMARY KEY,
    GPA NUMBER(3,1)
);

INSERT INTO StudentTable VALUES (1, 5.8);
INSERT INTO StudentTable VALUES (2, 6.5);
INSERT INTO StudentTable VALUES (3, 3.4);
INSERT INTO StudentTable VALUES (4, 7.8);
INSERT INTO StudentTable VALUES (5, 9.5);

COMMIT;

SET SERVEROUTPUT ON;
 
DECLARE 
 r Number:=4;
 gpa_val NUMBER;
 
 BEGIN
 SELECT GPA INTO gpa_val
 FROM StudentTable
 Where RollNo =r;
 
 dbms_output.put_line('GPA =' || gpa_val);
 END;
 /


DECLARE
r NUMBER :=4;
gpa_val NUMBER;
grade Varchar(2);

BEGIN
SELECT GPA into gpa_val from StudentTable where RollNo=r;

IF gpa_val < 4 then grade:='F';
ELSIF gpa_val <5 then grade :='E';
ELSIF gpa_val<6 then grade :='D';
ELSIF gpa_val<7 then grade:='C';
ELSIF gpa_val<8 then grade:='B';
ELSIF gpa_val<9 then grade:='A';
ELSE grade:='A+';
END IF;
 dbms_output.put_line('Grade = ' || grade);
END;  
/
 
-- DECLARE
  --issue_date Date:=TO_DATE('&issue', 'DD-MM-YYYY');
  --return_date Date:=TO_DATE('&return','DD-MM-YYYY');
 -- days NUMBER;
 -- fine NUMBER:=0;
--BEGIN
 --days:= 5;
-- IF days <= 7 then fine :=0;
-- ELSIF days <=15 THEN fine :=(days-7)*1;
 --ELSIF days <=30 THEN fine:= (days-7)*2;
 --ELSE fine:=(days-7)*5;
 --END IF;
-- dbms_output.put_line('Fine= ' ||fine);
-- END;
-- /
 
 
 
 

 
 
 DECLARE
  i NUMBER :=1;
  gpa_val NUMBER;
  BEGIN
    LOOP
      EXIT WHEN i > 5;
      SELECT GPA INTO gpa_val
      FROM StudentTable
      where RollNo=i;
      dbms_output.put_line('RollNo:' || i || ' gpa_val :' || gpa_val );
      i:=i+1; 
    END LOOP;
  END;
  /
      
    
    
    
    
    
    Alter table StudentTable add LetterGrade Varchar(2);
    
    
    Declare 
      i Number :=1;
      gpa_val Number;
      grade Varchar(2);
    BEGIN
       While i<=5 LOOP
            select GPA into gpa_val from StudentTable where RollNo=i;
            
            if gpa_val < 4 then grade := 'F';
            elsif gpa_val < 5 then grade :='E';
            elsif gpa_val < 6 then grade :='D';
            elsif gpa_val <7 then grade :='C';
            elsif gpa_val < 8 then grade :='B';
            elsif gpa_val < 9 then grade:='A';
            else grade := 'A+';
            End if;
            
            
        Update StudentTable 
        Set LetterGrade  = grade 
        where RollNo=i;
        
        i:=i+1;
        
      END LOOP;
      
      COMMIT;
      
   end;
   /
   
   Declare 
     max_gpa Number :=0;
     top_roll Number;
     gpa_val Number;
     
    Begin
      For i in 1..5 LOOP
         Select gpa into gpa_val from StudentTable  Where Rollno=i;
         
         if gpa_val > max_gpa then
            max_gpa :=gpa_val;
            top_roll :=i;
          End if;
        end loop;
        
        Dbms_output.put_line('Top Student Roll = ' || top_roll);
        
      END;
      /
        
        
    
    
    
    
  Declare
     i Number := 1;
     gpa_val Number;
  Begin
 <<loop_start>>
     if i > 5 then
       GOTO end_loop;
    End if;
    
    Select gpa into gpa_val from StudentTable Where Rollno =i;
    Dbms_output.put_line('Roll'||i||'GPA= '|| gpa_val);
     i:=i+1;
      Goto loop_start;
    <<end_loop>>
       NULL;
    END;
    /
       
  
  Declare
    name_in Varchar(20):='&name';
    rec_counter Number;
  Begin
   select count(*) into rec_count
   from instructor
   where name= name_in;
   
   if rec_count = 0 then 
     dbms_output.put_line('No instructor found');
   elsif rec_count > 1 then
     dbms_output.put_line('Multiple instructor found');
    else
      for rec IN( select * from instructor where name = name_in)
      LOOP 
         dbms_output.put_line(rec.ID || ' ' || rec.dept_name || ' '|| rec.salary);
      End loop;
    End if;
  END;
  /
        
    
     
