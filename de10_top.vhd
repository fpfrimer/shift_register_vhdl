library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity de10_top is
    port (
        LEDR    :   out     std_logic_vector(0 to 9);
        SW      :   in      std_logic_vector(0 to 9)

    );
end entity de10_top;

architecture rtl of de10_top is
    
begin
    
    u1: entity work.single_bit_shift_reg
        generic map(8)
        port map(SW(0), SW(1), SW(9), LEDR(9), LEDR(0 to 7));
    
end architecture rtl;