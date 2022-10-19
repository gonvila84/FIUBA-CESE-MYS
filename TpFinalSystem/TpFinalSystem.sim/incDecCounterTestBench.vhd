library IEEE;
use IEEE.std_logic_1164.all;

entity incDecCounter_tb is
end entity incDecCounter_tb;

architecture incDecCounterTest of incDecCounter_tb is

    component incDecCounter is
        generic( N : positive := 3 );
        port (
            
                clk_i  : in  std_logic;
                rst_i         : in  std_logic;
                ena_i        : in  std_logic;
                incDec_i        : in  std_logic;
                counter_o       : out std_logic_vector( N-1 downto 0 )       
        );
    end component incDecCounter;
    
    signal  clock_t      : std_logic := '0';
    signal  reset_t      : std_logic := '1';
    signal  enable_t     : std_logic := '1';
    signal  incDec_t     : std_logic := '1';
    signal  counter_t    : std_logic_vector(2 downto 0);


begin

    reset_t  <=  '0' after 51 ns;
    
    enable_t <=  '1';

    clock_t  <=  not clock_t  after 50 ns;
    
    
    incDec_t <=  not incDec_t after 3000 ns;

    
    
    
    

    dut: incDecCounter generic map (N => 3)
                        port map (
                            clk_i          => clock_t,
                            rst_i          => reset_t,
                            ena_i          => enable_t,
                            incDec_i       => incDec_t,
                            counter_o      => counter_t
                        );

    
end architecture incDecCounterTest;


