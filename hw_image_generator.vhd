--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
	GENERIC(
		pixels_y :	INTEGER := 100;    --row that first color will persist until
		pixels_x	:	INTEGER := 100   --column that first color will persist until
		
		);
	PORT(
		disp_ena		:	IN		STD_LOGIC;	--display enable ('1' = display time, '0' = blanking time)
		p11,p12,p13,p14,p15,p16,p17,p18,p19,p21,p22,p23,p24,p25,p26,p27,p28,p29				:	IN		STD_LOGIC;
		
		row			:	IN		INTEGER;		--row pixel coordinate
		column		:	IN		INTEGER;		--column pixel coordinate
		red			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
		green			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
		blue			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')); --blue magnitude output to DAC
		
		
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
signal y1	:	STD_LOGIC	:='0';
signal y2	:	STD_LOGIC	:='0';
signal y3	:	STD_LOGIC	:='0';
signal y4	:	STD_LOGIC	:='0';
signal y5	:	STD_LOGIC	:='0';
signal y6	:	STD_LOGIC	:='0';
signal y7	:	STD_LOGIC	:='0';
signal y8	:	STD_LOGIC	:='0';
signal y9	:	STD_LOGIC	:='0';
signal g1	:	STD_LOGIC	:='0';
signal g2	:	STD_LOGIC	:='0';
signal g3	:	STD_LOGIC	:='0';
signal g4	:	STD_LOGIC	:='0';
signal g5	:	STD_LOGIC	:='0';
signal g6	:	STD_LOGIC	:='0';
signal g7	:	STD_LOGIC	:='0';
signal g8	:	STD_LOGIC	:='0';
signal g9	:	STD_LOGIC	:='0';
BEGIN
		
	PROCESS(disp_ena, row, column, p11,p12,p13,p14,p15,p16,p17,p18,p19,p21,p22,p23,p24,p25,p26,p27,p28,p29,y1,y2,y3,y4,y5,y6,y7,y8,y9,g1,g2,g3,g4,g5,g6,g7,g8,g9)
	BEGIN
		
		IF(y1='1' AND g1='1') THEN
				y1<='0';
				g1<='0';
			END IF;	
			IF(y2='1' AND g2='1') THEN
				y2<='0';
				g2<='0';
			END IF;	
			IF(y3='1' AND g3='1') THEN
				y3<='0';
				g3<='0';
			END IF;	
			IF(y4='1' AND g4='1') THEN
				y4<='0';
				g4<='0';
			END IF;	
			IF(y5='1' AND g5='1') THEN
				y5<='0';
				g5<='0';
			END IF;	
			IF(y6='1' AND g6='1') THEN
				y6<='0';
				g6<='0';
			END IF;	
			IF(y7='1' AND g7='1') THEN
				y7<='0';
				g7<='0';
			END IF;	
			IF(y8='1' AND g8='1') THEN
				y8<='0';
				g8<='0';
			END IF;	
			IF(y9='1' AND g9='1') THEN
				y9<='0';
				g9<='0';
			END IF;	
		IF(disp_ena = '1') THEN		--display time
			
--			
			--IF(row < 458 AND column <38) THEN
			--	red <= (OTHERS => '1');
			--	green	<= (OTHERS => '1');
			--	blue <= (OTHERS => '1');
				
				
			IF(row>0 AND column>0 AND((p11='1' AND p12='1' AND p13='1') OR (p14='1' AND p15='1' AND p16='1') OR (p17='1' AND p18='1' AND p19='1') OR (p11='1' AND p14='1' AND p17='1') OR (p12='1' AND p15='1' AND p18='1') OR (p13='1' AND p16='1' AND p19='1') OR (p11='1' AND p15='1' AND p19='1') OR (p13='1' AND p15='1' AND p17='1'))) THEN
			red <= (OTHERS => '1');
			green <= (OTHERS => '1');
			blue <= (OTHERS => '0');	
			ELSIF(row>0 AND column>0 AND((p21='1' AND p22='1' AND p23='1') OR (p24='1' AND p25='1' AND p26='1') OR (p27='1' AND p28='1' AND p29='1') OR (p21='1' AND p24='1' AND p27='1') OR (p22='1' AND p25='1' AND p28='1') OR (p23='1' AND p26='1' AND p29='1') OR (p21='1' AND p25='1' AND p29='1') OR (p23='1' AND p25='1' AND p27='1'))) THEN
			red <= (OTHERS => '0');
			green <= (OTHERS => '1');
			blue <= (OTHERS => '0');	
			
				
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x)  and row > 457 AND column > 37 AND p11='0' AND p21 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y1<='0';
				g1<='0';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x)  and row > 457 AND column > 37 AND p11='1' AND p21='0' AND g1='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y1<='1';
				g1<='0';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x)  and row > 457 AND column > 37 AND p21='1' AND p11='0' AND y1='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y1<='0';
				g1<='1';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x)  and row > 457 AND column > 37 AND p21='1' AND p11='1' AND g1='0' AND y1='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x)  and row > 457 AND column > 37 AND p21='1' AND p11='1' AND g1='1' AND y1='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');	
				
			
			
			
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x)  and (row > 457 + 2 + pixels_y) and column >37 AND p12='0' AND p22 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y2<='0';
				g2<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x)  and (row > 457 + 2 + pixels_y) and column >37 AND p12='1' AND p22='0' AND g2='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y2<='1';
				g2<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x)  and (row > 457 + 2 + pixels_y) and column >37 AND p22='1' AND p12='0' AND y2='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y2<='0';	
				g2<='1';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x)  and (row > 457 + 2 + pixels_y) and column >37 AND p22='1' AND p12='1' AND g2='0' AND y2='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x)  and (row > 457 + 2 + pixels_y) and column >37 AND p22='1' AND p12='1' AND g2='1' AND y2='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				
				
				
				
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 AND p13= '0' AND p23 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y3<='0';
				g3<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 AND p13= '1' AND p23 = '0' AND g3='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y3<='1';
				g3<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 AND p23= '1' AND p13= '0' AND y3='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y3<='0';
				g3<='1';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 AND p23= '1' AND p13= '1' AND g3='0' AND y3='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 AND p23= '1' AND p13= '1' AND g3='1' AND y3='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			
		
		
				
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x AND p14 = '0' AND p24 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y4<='0';
				g4<='0';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x AND p14 = '1' AND p24='0' AND g4='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y4<='1';	
				g4<='0';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x AND p24 = '1' AND p14='0' AND y4='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y4<='0';
				g4<='1';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x AND p24 = '1' AND p14='1' AND g4='0' AND y4='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x AND p24 = '1' AND p14='1' AND g4='1' AND y4='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			
		
		
				
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x AND p15 = '0' AND p25 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y5<='0';
				g5<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x AND p15 = '1' AND p25='0' AND g5='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			   y5<='1';	
				g5<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x AND p25 = '1' AND p15='0' AND y5='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');	
				y5<='0';
				g5<='1';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x AND p25 = '1' AND p15='1' AND g5='0' AND y5='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x AND p25 = '1' AND p15='1' AND g5='1' AND y5='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			
		
		
				
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x AND p16 = '0' AND p26 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y6<='0';
				g6<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x AND p16 = '1' AND p26='0' AND g6='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');	
				y6<='1';
				g6<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x AND p26 = '1' AND p16='0' AND y6='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y6<='0';
				g6<='1';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x AND p26 = '1' AND p16='1' AND g6='0' AND y6='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x AND p26 = '1' AND p16='1' AND g6='1' AND y6='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				
				
				
				
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x + 2 + pixels_x AND p17 = '0' AND p27 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y7<='0';
				g7<='0';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x + 2 + pixels_x AND p17 = '1' AND p27='0' AND g7='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');	 
				y7<='1';
				g7<='0';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x + 2 + pixels_x AND p27 = '1' AND p17='0' AND y7='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
				y7<='0';
				g7<='1';
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x + 2 + pixels_x AND p27 = '1' AND p17='1' AND g7='0' AND y7='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and row > 457 AND column > 37 + 2 + pixels_x + 2 + pixels_x AND p27 = '1' AND p17='1' AND g7='1' AND y7='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			
		
		
				
				
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p18 = '0' AND p28 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y8<='0';
				g8<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p18 = '1' AND p28='0' AND g8='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');	
				y8<='1';
				g8<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p28 = '1' AND p18='0' AND y8='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');		
				y8<='0';
				g8<='1';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p28 = '1' AND p18='1'AND g8='0' AND y8='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x)  and (row > 457 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p28 = '1' AND p18='1'AND g8='1' AND y8='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			
		
		
				
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p19 = '0' AND p29 = '0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
				y9<='0';
				g9<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p19 = '1' AND p29='0' AND g9='0') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');	
				y9<='1';
				g9<='0';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p29 = '1' AND p19='0' AND y9='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');	
				y9<='0';
				g9<='1';
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p29 = '1' AND p19='1' AND g9='0' AND y9='1') THEN
				red <= (OTHERS => '1');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			ELSIF(row < (458 + pixels_y + 2 + pixels_y + 2 + pixels_y) and column< (38 + pixels_x + 2 + pixels_x + 2 + pixels_x) and (row > 457 + pixels_y + 2 + pixels_y + 2) and column >37 + 2 + pixels_x + 2 + pixels_x AND p29 = '1' AND p19='1' AND g9='1' AND y9='0') THEN
				red <= (OTHERS => '0');
				green	<= (OTHERS => '1');
				blue <= (OTHERS => '0');
			
		
		
				
			Else
				red <= (OTHERS => '1');
				green <= (OTHERS => '1');
				blue <= (OTHERS => '1');
			
			END IF;
			ELSE								--blanking time
	      red <= (OTHERS => '0');
			green <= (OTHERS => '0');
			blue <= (OTHERS => '0');
		END IF;
		
		
		
		
	END PROCESS;
	
END behavior;