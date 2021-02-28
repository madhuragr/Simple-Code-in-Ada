with Ada.Containers.Indefinite_Ordered_Maps;
with Ada.Text_IO; use Ada.Text_IO;

procedure result is
    
    -- Input array (line no 43) along with the array size are hardcoded in this code.    
    type My_Int is range 0 .. 1000;
    type My_Int_Array is array (1 .. 5) of My_Int;
    
    function findAns(Arr: in My_Int_Array) return My_Int is
    
        package Integer_Ordered_Maps is new
         Ada.Containers.Indefinite_Ordered_Maps
           (Key_Type        => My_Int,
            Element_Type    => Integer);
    
        use Integer_Ordered_Maps;
        
        M : Map;
        ans : My_Int := 1000 ; -- initialized the answer with 1000

    begin
    -- Size of array hardcoded
        for I in 1 .. 5 loop
            if M.Contains(Arr (I)) then
                M.Replace(Arr (I), 2);
            else
                M.Include(Arr (I), 1);
            end if;
        end loop;
    
    -- Size of array hardcoded
        for I in 1 .. 5 loop
            if M(Arr(I))>1 then 
                ans := Arr(I);
                exit;
            end if;
        end loop;
        return ans;
    end findAns ;
    
-- Input array along with the array size (line no 8) are hardcoded in this code.    
Arr : My_Int_Array := (2, 3, 3, 7, 22);
begin
    Put_Line(My_Int'Image(findAns(Arr)));
end result;
