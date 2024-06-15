library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity single_bit_shift_reg is
    generic( l  :   integer := 8);  -- Register length
    port (
        clk, nrst   :   in  std_logic;
        data_in     :   in  std_logic;
        data_out    :   out std_logic;
        data        :   out std_logic_vector(0 to l - 1)
    );
end entity single_bit_shift_reg;

architecture behavioral of single_bit_shift_reg is

    signal  data_reg    :   std_logic_vector(0 to l - 1);
    
begin

    shift_proc: process(clk, nrst)
    begin
        if nrst = '0' then
            data_reg <= (others => '0');
        elsif rising_edge(clk) then
            data_reg(0) <= data_in;
            for i in 1 to l - 1 loop
                data_reg(i) <= data_reg(i - 1);                
            end loop;
        end if;
    end process shift_proc;
    
    data_out <= data_reg(l - 1);
    data <= data_reg;    
    
end architecture behavioral;