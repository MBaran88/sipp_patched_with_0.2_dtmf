#################################################
# This script is dedicated to stress test  Peakone with following procedure:
# 1. register caller - number 101
# 2. simultaenously -register 1 number each second, make 10 calls each seconds(to stub ivr used only to establish call)
#################################################
cd /sipp-3.5.1
# requires number 101 (caller) and working ivr 99100 (callee, test ivr)
## REGISTER
#./sipp -i 10.10.10.190 10.10.10.149 -p 5063 -sf sada/dtmf_test_register.xml -inf sada/dtmf_test.csv -m 1 -r 1 -l 1 -trace_msg -trace_shortmsg -trace_err
sleep 1
# ./sipp -i 10.10.10.190 10.10.10.149 -p 5064 -sf sada/dtmf_test_register.xml -inf sada/reg.csv -m 14 -r 1 -l 14 -trace_msg -trace_shortmsg -trace_err
## wait a few seconds, make a call with out-of-band DTMF-s (compliant with RFC 2833)
sleep 2
./sipp -i 10.10.10.190 10.10.10.149 -s 800 -sf sada/outband_dtmf_test_2_single.xml -inf sada/dtmf_test.csv -l 1 -m 1 -r 1 -p 5077 -trace_err -trace_msg
# sleep 7
# ./sipp -i 10.10.10.149 -s 99100  10.10.10.148 -sf dtmf_tests/inband_dtmf_test.xml -inf dtmf_tests/dtmf_test.csv -l 1 -m 1 -r 1 -p 5061 -trace_err -trace_shortmsg -trace_msg