#################################################
# This script is dedicated to stress test Peakone DTMF feature with following procedure:
# 1. register caller - number 101
# 2. Call line number 800 (Peakone 149) -> dial plan transfers the call to IVR on 71 -> while on IVR menu, each script sends different DTMF, which results in transfer to another line number -> transfer from 71 comes back to Peakone 149 and gets forwarded, through Peakone 136, to IVR on 139 -> IVR 139 locks the call with prompt block 
#################################################
cd /sipp-3.5.1
SERVICE=800
RATE=1
COUNT=1
LIMIT=1
LOCAL_IP=10.10.10.190
REMOTE_IP=10.10.10.149
# requires number 101 (caller) and working ivr 99100 (callee, test ivr)
## REGISTER
# ./sipp -i $LOCAL_IP $REMOTE_IP -p 5063 -sf sada/dtmf_test_register.xml -inf sada/dtmf_test.csv -m 1 -r 1 -l 1 -trace_msg -trace_shortmsg -trace_err
# sleep 1
# ./sipp -i $LOCAL_IP $REMOTE_IP -p 5064 -sf sada/dtmf_test_register.xml -inf sada/reg.csv -m 14 -r 1 -l 14 -trace_msg -trace_shortmsg -trace_err
## wait a few seconds, make a call with out-of-band DTMF-s (compliant with RFC 2833)
 # sleep 2
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_1.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5077 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_2.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5078 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_3.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5079 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_4.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5080 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_5.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5081 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_6.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5082 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_7.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5083 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_8.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5084 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_9.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5085 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_0.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5086 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_star.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5087 -trace_err -trace_msg -trace_screen
 ./sipp -i $LOCAL_IP $REMOTE_IP -s $SERVICE -sf sada/outband_dtmf_hash.xml -inf sada/dtmf_test.csv -l $LIMIT -m $COUNT -r $RATE -p 5088 -trace_err -trace_msg -trace_screen

 # sleep 7
# ./sipp -i 10.10.10.149 -s 99100  10.10.10.148 -sf dtmf_tests/inband_dtmf_test.xml -inf dtmf_tests/dtmf_test.csv -l 1 -m 1 -r 1 -p 5061 -trace_err -trace_shortmsg -trace_msg