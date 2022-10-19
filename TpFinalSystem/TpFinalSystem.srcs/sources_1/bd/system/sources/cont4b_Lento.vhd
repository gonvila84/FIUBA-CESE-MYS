library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity incDecCounter is
    generic (
        N   :   natural := 3;
        DELAY:  natural := 10
    );

	port(
		clk_i             :        in  std_logic;
		rst_i             :        in  std_logic;
		ena_i             :        in  std_logic;
		incDec_i          :        in  std_logic;
		counter_o         :        out std_logic_vector(N-1 downto 0)
		--counter_reg_o     :        out std_logic_vector(N-1 downto 0)
	);
end entity incDecCounter;

architecture incDecCounterArchitecture of incDecCounter is
    signal tempCounter      :  signed  ( N-1 downto 0 );
    signal counterDirection :  integer range -1 to 1;
    signal nextCount        :  integer range  0 to 100000000;
begin

    counterDirection <= 1 when incDec_i = '1' else -1;

    counterInstance: process (clk_i) is
    begin    
        if rising_edge(clk_i) then
            if rst_i='1' then
                tempCounter <= ( others => '0' );
            elsif ena_i='1' then
                if nextCount = DELAY then
                    tempCounter <= tempCounter + counterDirection;
                    nextCount <= 0;
                else
                    nextCount <= nextCount + 1;
                end if;              
            end if;
        end if;
        
    end process counterInstance;

    counter_o       <= std_logic_vector(tempCounter);
    --counter_reg_o   <= std_logic_vector(tempCounter);

end architecture incDecCounterArchitecture;