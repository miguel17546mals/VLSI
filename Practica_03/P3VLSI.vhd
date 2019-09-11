---------------------------------------------------------------------- 
-- Practica 3. Generación de Frecuencia, Relojes y Temporizadores. 
-- Module Name:    divisor - Behavioral  
-- Project Name: Temporización. 
-- Description:  
--  Divisor de frecuencia clk/2^(n+1) 
--                                                               * RPM 
---------------------------------------------------------------------- 
 
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity P3VLSI is    
Port ( clk     : in std_logic;
		div_clk : out std_logic); 
end P3VLSI; 
 
architecture Behavioral of P3VLSI is 
begin    
	process (clk)
		constant fclk : integer := 50_000_000;
		constant f : integer := 1;
		constant CT : integer:= 30;
		
		variable cuenta:  := 0;   
		
		begin 
      
		 if rising_edge (clk) then          
			 if cuenta < (fclk/f -1) then             
				 cuenta := cuenta + 1;
				 if cuenta < (fclk/f -1) * (CT/100) then
					div_clk <= '1';
				 else 
				   div_clk <= '0';
				 end if;
			 else           
				  cuenta := 0;      
			 end if;       
		 end if; 
	end process; 
end Behavioral; 
