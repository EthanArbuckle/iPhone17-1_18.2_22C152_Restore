@interface PLBBMavLogMsg
+ (id)entryEventBackwardMav1BBHwOtherPerRAT;
+ (id)entryEventBackwardMavBBHwOther;
+ (id)entryEventBackwardMavBBHwOtherPerRAT;
+ (id)entryEventMavBBMav10HwOther;
+ (id)entryEventMavBBMav13HwOther;
+ (id)entryEventMavBBMav16BHwOther;
+ (id)entryEventMavBBMav16HwOther;
+ (id)entryEventMavBBMav1HwOther;
+ (id)entryEventMavBBMav2HwOther;
+ (id)entryEventMavBBMav4HwOther;
+ (id)getNameBBMavHwOther;
- (NSArray)ProtocolActivityHistogram;
- (NSArray)admOnOffState;
- (NSArray)appsPerfStateCountHist;
- (NSArray)appsSleepVeto;
- (NSArray)bbActive;
- (NSArray)bbHwModemAppAdmState;
- (NSArray)bbHwModemAppAdspClockState;
- (NSArray)bbHwModemAppAdspSpeed;
- (NSArray)bbHwModemAppAdspState;
- (NSArray)bbHwModemAppMdmSpeed;
- (NSArray)bbHwModemAppMdmState;
- (NSArray)bbHwModemAppMdspClockState;
- (NSArray)bbHwModemAppMdspSpeed;
- (NSArray)bbHwModemAppMdspState;
- (NSArray)bbHwModemAppQ6FwSpeed;
- (NSArray)bbHwModemAppQ6SwSpeed;
- (NSArray)bbHwModemAppQdspSpeed;
- (NSArray)bbHwPeripheralGPSState;
- (NSArray)bbHwPeripheralSPIState;
- (NSArray)bbHwPeripheralUARTState;
- (NSArray)bbHwPeripheralUSBState;
- (NSArray)bbHwProcArmPerfState;
- (NSArray)bbHwProcSystemState;
- (NSArray)bbHwSleepVetoClientListArm;
- (NSArray)bbHwSleepVetoClientListQdsp;
- (NSArray)gpsDPOBin;
- (NSArray)gpsDPOOnOff;
- (NSArray)gpsOnOff;
- (NSArray)hsicStateSleepVetoNum;
- (NSArray)lpassOnOffState;
- (NSArray)mcpmVetoNumHistogram;
- (NSArray)mdspConfigCount;
- (NSArray)mpssSleepVeto;
- (NSArray)npaVetoClientNumHistogram;
- (NSArray)pcieStateHistogram;
- (NSArray)protocolStateHist;
- (NSArray)qdspConfigCount;
- (NSArray)rssiModeCount;
- (NSArray)rx0RssiPowerHist;
- (NSArray)rx0SQAPowerHist;
- (NSArray)rx1RssiPowerHist;
- (NSArray)rx1SQAPowerHist;
- (NSArray)spiOnOffState;
- (NSArray)txPowerHist;
- (NSArray)txPowerHist1x;
- (NSArray)txPowerHistEVDO;
- (NSArray)uartOnOffState;
- (NSArray)usbStateCountHist;
- (NSDate)bbDate;
- (NSDictionary)protocolStateHistDict;
- (NSMutableArray)groupArrEntries;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)groupDict;
- (NSMutableDictionary)kvPairs;
- (NSNumber)bbHwCurrTimeStamp;
- (NSNumber)bbHwLastTimeStamp;
- (NSNumber)bbHwLogDurationInTicks;
- (NSNumber)bbHwMsgType;
- (NSNumber)bbHwRev;
- (NSNumber)bbHwStatsLength;
- (NSNumber)bbHwStatsLevel;
- (NSNumber)bbHwStatsType;
- (NSNumber)bbSeqNum;
- (NSNumber)bbSwRev;
- (NSNumber)bbTimeCal;
- (NSNumber)cxoShutDownCount;
- (NSNumber)cxoShutDownDuration;
- (NSNumber)mpssCxoShutDownCount;
- (NSNumber)mpssCxoShutDownDuration;
- (NSNumber)npaVetoMask;
- (NSNumber)radioTech;
- (NSNumber)rpmVDDMinDuration;
- (NSNumber)rpmVDDMinEnterCnt;
- (NSNumber)rpmXOShutCnt;
- (NSNumber)rpmXOShutDuration;
- (NSNumber)rxTicks;
- (NSNumber)txTicks;
- (NSString)appsClockStateDurationStr;
- (NSString)groupEntryKey;
- (NSString)groupID;
- (NSString)mpssClockStateDurationStr;
- (PLBBMavLogMsg)init;
- (id)internaLogEventBackwardBBMav1HwOtherPerRAT;
- (id)internaLogEventBackwardBBMavHwOtherPerRAT;
- (id)logEventBackwardGrpEntriesBBMav1HwOtherPerRAT;
- (id)logEventBackwardGrpEntriesBBMavHwOtherPerRAT;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)addToGroupPLBBMav10HwOther;
- (void)addToGroupPLBBMav13HwOther;
- (void)addToGroupPLBBMav16BHwOther;
- (void)addToGroupPLBBMav16HwOther;
- (void)addToGroupPLBBMav2HwOther;
- (void)addToGroupPLBBMav4HwOther;
- (void)addToGroupPLBBMavHwEntry:(id)a3 withEntryKey:(id)a4;
- (void)addToGroupPLBBMavHwOther;
- (void)appendToError:(id)a3;
- (void)logEventBackwardGrpEntriesBBMavHw;
- (void)logEventBackwardMav10BBHwOther;
- (void)logEventBackwardMav13BBHwOther;
- (void)logEventBackwardMav16BBBHwOther;
- (void)logEventBackwardMav16BBHwOther;
- (void)logEventBackwardMav1BBHwOtherPerRAT;
- (void)logEventBackwardMavBBHwOther;
- (void)logEventBackwardMavBBHwOtherPerRAT;
- (void)logGrpEntriesMavBBHwOtherPerRat;
- (void)populateEntryBBMav10HwOther:(id)a3;
- (void)populateEntryBBMav13HwOther:(id)a3;
- (void)populateEntryBBMav16BHwOther:(id)a3;
- (void)populateEntryBBMav16HwOther:(id)a3;
- (void)populateEntryBBMav1HwOtherPerRAT:(id)a3;
- (void)populateEntryBBMav2HwOther:(id)a3;
- (void)populateEntryBBMav4HwOther:(id)a3;
- (void)populateEntryBBMavHwOther:(id)a3;
- (void)populateEntryBBMavHwOtherPerRAT:(id)a3;
- (void)refreshBBMav10HwOther;
- (void)refreshBBMav13HwOther;
- (void)refreshBBMav16BHwOther;
- (void)refreshBBMav16HwOther;
- (void)refreshBBMav2HwOther;
- (void)refreshBBMav4HwOther;
- (void)refreshMav1BBHwOtherPerRAT;
- (void)refreshMavBBHwOther;
- (void)refreshMavBBHwOtherPerRAT;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setAdmOnOffState:(id)a3;
- (void)setAppsClockStateDurationStr:(id)a3;
- (void)setAppsPerfStateCountHist:(id)a3;
- (void)setAppsSleepVeto:(id)a3;
- (void)setBbActive:(id)a3;
- (void)setBbDate:(id)a3;
- (void)setBbHwCurrTimeStamp:(id)a3;
- (void)setBbHwLastTimeStamp:(id)a3;
- (void)setBbHwLogDurationInTicks:(id)a3;
- (void)setBbHwModemAppAdmState:(id)a3;
- (void)setBbHwModemAppAdspClockState:(id)a3;
- (void)setBbHwModemAppAdspSpeed:(id)a3;
- (void)setBbHwModemAppAdspState:(id)a3;
- (void)setBbHwModemAppMdmSpeed:(id)a3;
- (void)setBbHwModemAppMdmState:(id)a3;
- (void)setBbHwModemAppMdspClockState:(id)a3;
- (void)setBbHwModemAppMdspSpeed:(id)a3;
- (void)setBbHwModemAppMdspState:(id)a3;
- (void)setBbHwModemAppQ6FwSpeed:(id)a3;
- (void)setBbHwModemAppQ6SwSpeed:(id)a3;
- (void)setBbHwModemAppQdspSpeed:(id)a3;
- (void)setBbHwMsgType:(id)a3;
- (void)setBbHwPeripheralGPSState:(id)a3;
- (void)setBbHwPeripheralSPIState:(id)a3;
- (void)setBbHwPeripheralUARTState:(id)a3;
- (void)setBbHwPeripheralUSBState:(id)a3;
- (void)setBbHwProcArmPerfState:(id)a3;
- (void)setBbHwProcSystemState:(id)a3;
- (void)setBbHwRev:(id)a3;
- (void)setBbHwSleepVetoClientListArm:(id)a3;
- (void)setBbHwSleepVetoClientListQdsp:(id)a3;
- (void)setBbHwStatsLength:(id)a3;
- (void)setBbHwStatsLevel:(id)a3;
- (void)setBbHwStatsType:(id)a3;
- (void)setBbSeqNum:(id)a3;
- (void)setBbSwRev:(id)a3;
- (void)setBbTimeCal:(id)a3;
- (void)setCommonInfo:(id)a3;
- (void)setCxoShutDownCount:(id)a3;
- (void)setCxoShutDownDuration:(id)a3;
- (void)setDate:(id)a3;
- (void)setError:(id)a3;
- (void)setGpsDPOBin:(id)a3;
- (void)setGpsDPOOnOff:(id)a3;
- (void)setGpsOnOff:(id)a3;
- (void)setGroupArrEntries:(id)a3;
- (void)setGroupDict:(id)a3;
- (void)setGroupEntryKey:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setHsicStateSleepVetoNum:(id)a3;
- (void)setKvPairs:(id)a3;
- (void)setLogDuration:(id)a3;
- (void)setLpassOnOffState:(id)a3;
- (void)setMavBBHwValue:(id)a3 forKey:(id)a4;
- (void)setMcpmVetoNumHistogram:(id)a3;
- (void)setMdspConfigCount:(id)a3;
- (void)setMpssClockStateDurationStr:(id)a3;
- (void)setMpssCxoShutDownCount:(id)a3;
- (void)setMpssCxoShutDownDuration:(id)a3;
- (void)setMpssSleepVeto:(id)a3;
- (void)setNpaVetoClientNumHistogram:(id)a3;
- (void)setNpaVetoMask:(id)a3;
- (void)setPcieStateHistogram:(id)a3;
- (void)setProtocolActivityHistogram:(id)a3;
- (void)setProtocolStateHist:(id)a3;
- (void)setProtocolStateHistDict:(id)a3;
- (void)setQdspConfigCount:(id)a3;
- (void)setRadioTech:(id)a3;
- (void)setRat:(id)a3;
- (void)setRpmVDDMinDuration:(id)a3;
- (void)setRpmVDDMinEnterCnt:(id)a3;
- (void)setRpmXOShutCnt:(id)a3;
- (void)setRpmXOShutDuration:(id)a3;
- (void)setRssiModeCount:(id)a3;
- (void)setRx0RssiPowerHist:(id)a3;
- (void)setRx0SQAPowerHist:(id)a3;
- (void)setRx1RssiPowerHist:(id)a3;
- (void)setRx1SQAPowerHist:(id)a3;
- (void)setRxTicks:(id)a3;
- (void)setSpiOnOffState:(id)a3;
- (void)setTxPowerHist1x:(id)a3;
- (void)setTxPowerHist:(id)a3;
- (void)setTxPowerHistEVDO:(id)a3;
- (void)setTxPwr:(id)a3;
- (void)setTxPwrArray:(id)a3;
- (void)setTxTicks:(id)a3;
- (void)setType:(id)a3;
- (void)setUartOnOffState:(id)a3;
- (void)setUsbStateCountHist:(id)a3;
@end

@implementation PLBBMavLogMsg

- (PLBBMavLogMsg)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __21__PLBBMavLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AA88 != -1) {
      dispatch_once(&qword_1EBD5AA88, block);
    }
    if (_MergedGlobals_1_62)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg init]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:46];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)PLBBMavLogMsg;
  v10 = [(PLBBMavLogMsg *)&v20 init];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    commonInfo = v10->_commonInfo;
    v10->_commonInfo = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    kvPairs = v10->_kvPairs;
    v10->_kvPairs = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    groupArrEntries = v10->_groupArrEntries;
    v10->_groupArrEntries = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    groupDict = v10->_groupDict;
    v10->_groupDict = (NSMutableDictionary *)v17;
  }
  return v10;
}

uint64_t __21__PLBBMavLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_62 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD5AA90 != -1) {
      dispatch_once(&qword_1EBD5AA90, block);
    }
    if (byte_1EBD5AA51)
    {
      id v12 = v10;
      id v13 = v9;
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:]");
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:66];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v13;
      id v10 = v12;
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v20 = objc_opt_class();
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_373;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v20;
    if (qword_1EBD5AA98 != -1) {
      dispatch_once(&qword_1EBD5AA98, v53);
    }
    if (byte_1EBD5AA52)
    {
      id v21 = v10;
      id v50 = v10;
      id v22 = v9;
      v23 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v9, v50];
      uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:67];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v22;
      id v10 = v21;
    }
  }
  v29 = [(PLBBMavLogMsg *)self commonInfo];
  v30 = [v29 objectForKey:@"SeqNum"];
  [v8 setObject:v30 forKeyedSubscript:@"SeqNum"];

  v31 = [(PLBBMavLogMsg *)self commonInfo];
  v32 = [v31 objectForKey:@"BBDate"];
  [v8 setObject:v32 forKeyedSubscript:@"BBDate"];

  v33 = [(PLBBMavLogMsg *)self commonInfo];
  v34 = [v33 objectForKey:@"TimeCal"];
  [v8 setObject:v34 forKeyedSubscript:@"TimeCal"];

  v35 = [(PLBBMavLogMsg *)self commonInfo];
  v36 = [v35 objectForKey:@"Error"];
  [v8 setObject:v36 forKeyedSubscript:@"Error"];

  v37 = [(PLBasebandMessage *)self agent];

  if (!v37 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v38 = objc_opt_class();
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_382;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v38;
    if (qword_1EBD5AAA0 != -1) {
      dispatch_once(&qword_1EBD5AAA0, v52);
    }
    if (byte_1EBD5AA53)
    {
      id v51 = v10;
      id v39 = v9;
      v40 = [NSString stringWithFormat:@"Bad agent"];
      v41 = (void *)MEMORY[0x1E4F929B8];
      v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      v43 = [v42 lastPathComponent];
      v44 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:75];

      v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v40;
        _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v39;
      id v10 = v51;
    }
  }
  v46 = [(PLBBMavLogMsg *)self commonInfo];
  v47 = [v46 objectForKey:@"BBDate"];
  v48 = [v47 convertFromBasebandToMonotonic];
  [v8 setEntryDate:v48];

  v49 = [(PLBasebandMessage *)self agent];
  [v49 logEntry:v8];
}

uint64_t __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA51 = result;
  return result;
}

uint64_t __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_373(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA52 = result;
  return result;
}

uint64_t __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_382(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA53 = result;
  return result;
}

- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F929C0];
  id v10 = a4;
  if ([v9 debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLBBMavLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD5AAA8 != -1) {
      dispatch_once(&qword_1EBD5AAA8, block);
    }
    if (byte_1EBD5AA54)
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      id v13 = (void *)MEMORY[0x1E4F929B8];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v15 = [v14 lastPathComponent];
      v16 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:86];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v18 = v8;
  if (!v8)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __56__PLBBMavLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_388;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v19;
      if (qword_1EBD5AAB0 != -1) {
        dispatch_once(&qword_1EBD5AAB0, v28);
      }
      if (byte_1EBD5AA55)
      {
        uint64_t v20 = [NSString stringWithFormat:@"unable to set seqNum(%@)", 0];
        id v21 = (void *)MEMORY[0x1E4F929B8];
        id v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
        v23 = [v22 lastPathComponent];
        uint64_t v24 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:88];

        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v20;
          _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v18 = &unk_1F29E7C30;
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v18 forKey:@"SeqNum"];
  [(NSMutableDictionary *)self->_commonInfo setObject:v10 forKey:@"BBDate"];

  commonInfo = self->_commonInfo;
  v27 = [NSNumber numberWithDouble:a5];
  [(NSMutableDictionary *)commonInfo setValue:v27 forKey:@"TimeCal"];

  [(PLBBMavLogMsg *)self setGroupID:@"MavLogMsg"];
}

uint64_t __56__PLBBMavLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA54 = result;
  return result;
}

uint64_t __56__PLBBMavLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_388(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA55 = result;
  return result;
}

- (void)addPairWithKey:(id)a3 andWithVal:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLBBMavLogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD5AAB8 != -1) {
      dispatch_once(&qword_1EBD5AAB8, block);
    }
    if (byte_1EBD5AA56)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg addPairWithKey:andWithVal:]");
      id v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addPairWithKey:andWithVal:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:107];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v6)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __43__PLBBMavLogMsg_addPairWithKey_andWithVal___block_invoke_399;
      v26 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v27 = v15;
      if (qword_1EBD5AAC0 != -1) {
        dispatch_once(&qword_1EBD5AAC0, &v23);
      }
      if (byte_1EBD5AA57)
      {
        v16 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7, v23, v24, v25, v26, v27];
        uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
        v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
        uint64_t v19 = [v18 lastPathComponent];
        uint64_t v20 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addPairWithKey:andWithVal:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:109];

        id v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v16;
          _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v22 = [(PLBBMavLogMsg *)self kvPairs];
    [v22 setObject:v7 forKey:v6];
  }
}

uint64_t __43__PLBBMavLogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA56 = result;
  return result;
}

uint64_t __43__PLBBMavLogMsg_addPairWithKey_andWithVal___block_invoke_399(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA57 = result;
  return result;
}

- (void)setTxPwr:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __26__PLBBMavLogMsg_setTxPwr___block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5AAC8 != -1) {
      dispatch_once(&qword_1EBD5AAC8, &block);
    }
    if (byte_1EBD5AA58)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg setTxPwr:]", block, v13, v14, v15, v16);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setTxPwr:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:116];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v4 forKey:@"TxPwr"];
}

uint64_t __26__PLBBMavLogMsg_setTxPwr___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA58 = result;
  return result;
}

- (void)setTxPwrArray:(id)a3
{
}

- (void)setDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __25__PLBBMavLogMsg_setDate___block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5AAD0 != -1) {
      dispatch_once(&qword_1EBD5AAD0, &block);
    }
    if (byte_1EBD5AA59)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg setDate:]", block, v13, v14, v15, v16);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setDate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:137];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v4 forKey:@"BBDate"];
}

uint64_t __25__PLBBMavLogMsg_setDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA59 = result;
  return result;
}

- (void)setError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __26__PLBBMavLogMsg_setError___block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5AAD8 != -1) {
      dispatch_once(&qword_1EBD5AAD8, &block);
    }
    if (byte_1EBD5AA5A)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg setError:]", block, v13, v14, v15, v16);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setError:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:143];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v4 forKey:@"Error"];
}

uint64_t __26__PLBBMavLogMsg_setError___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA5A = result;
  return result;
}

- (void)appendToError:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __31__PLBBMavLogMsg_appendToError___block_invoke;
    uint64_t v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v5;
    if (qword_1EBD5AAE0 != -1) {
      dispatch_once(&qword_1EBD5AAE0, &block);
    }
    if (byte_1EBD5AA5B)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg appendToError:]", block, v17, v18, v19, v20);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg appendToError:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:148];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (v13)
  {
    [v13 appendString:v4];
    commonInfo = self->_commonInfo;
    id v15 = v13;
  }
  else
  {
    commonInfo = self->_commonInfo;
    id v15 = v4;
  }
  [(NSMutableDictionary *)commonInfo setObject:v15 forKey:@"Error"];
}

uint64_t __31__PLBBMavLogMsg_appendToError___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA5B = result;
  return result;
}

- (void)setLogDuration:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PLBBMavLogMsg_setLogDuration___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5AAE8 != -1) {
      dispatch_once(&qword_1EBD5AAE8, block);
    }
    if (byte_1EBD5AA5C)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg setLogDuration:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setLogDuration:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:163];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = NSNumber;
  *(float *)&double v13 = (float)(int)[v4 intValue] * 0.000030518;
  v14 = [v12 numberWithFloat:v13];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __32__PLBBMavLogMsg_setLogDuration___block_invoke_408;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = v15;
    if (qword_1EBD5AAF0 != -1) {
      dispatch_once(&qword_1EBD5AAF0, v24);
    }
    if (byte_1EBD5AA5D)
    {
      uint64_t v16 = NSString;
      [v14 floatValue];
      v18 = objc_msgSend(v16, "stringWithFormat:", @"Hw log duration inserted as %f", v17);
      uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v21 = [v20 lastPathComponent];
      id v22 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setLogDuration:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:165];

      uint64_t v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v14 forKey:@"LogDuration"];
}

uint64_t __32__PLBBMavLogMsg_setLogDuration___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA5C = result;
  return result;
}

uint64_t __32__PLBBMavLogMsg_setLogDuration___block_invoke_408(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA5D = result;
  return result;
}

- (void)setRat:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __24__PLBBMavLogMsg_setRat___block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5AAF8 != -1) {
      dispatch_once(&qword_1EBD5AAF8, &block);
    }
    if (byte_1EBD5AA5E)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg setRat:]", block, v13, v14, v15, v16);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setRat:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:170];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v4 forKey:@"Rat"];
}

uint64_t __24__PLBBMavLogMsg_setRat___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA5E = result;
  return result;
}

- (void)refreshMavBBHwOther
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __36__PLBBMavLogMsg_refreshMavBBHwOther__block_invoke;
    float v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5AB00 != -1) {
      dispatch_once(&qword_1EBD5AB00, &block);
    }
    if (byte_1EBD5AA5F)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshMavBBHwOther]", block, v15, v16, v17, v18);
      id v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshMavBBHwOther]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:179];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  uint64_t v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __36__PLBBMavLogMsg_refreshMavBBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA5F = result;
  return result;
}

+ (id)entryEventBackwardMavBBHwOther
{
  v110[2] = *MEMORY[0x1E4F143B8];
  v109[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v107[0] = *MEMORY[0x1E4F92CD0];
  v107[1] = v2;
  v108[0] = &unk_1F29F13B0;
  v108[1] = @"refreshRequestHandler";
  v107[2] = *MEMORY[0x1E4F92CC0];
  v108[2] = MEMORY[0x1E4F1CC38];
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];
  v110[0] = v71;
  v109[1] = *MEMORY[0x1E4F92CA8];
  v105[0] = @"Error";
  v70 = [MEMORY[0x1E4F929D8] sharedInstance];
  v69 = objc_msgSend(v70, "commonTypeDict_BoolFormat");
  v106[0] = v69;
  v105[1] = @"SeqNum";
  v68 = [MEMORY[0x1E4F929D8] sharedInstance];
  v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v106[1] = v67;
  v105[2] = @"BBDate";
  v66 = [MEMORY[0x1E4F929D8] sharedInstance];
  v65 = objc_msgSend(v66, "commonTypeDict_DateFormat");
  v106[2] = v65;
  v105[3] = @"TimeCal";
  v64 = [MEMORY[0x1E4F929D8] sharedInstance];
  v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
  v106[3] = v63;
  v105[4] = @"SWRevision";
  v62 = [MEMORY[0x1E4F929D8] sharedInstance];
  v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v106[4] = v61;
  v105[5] = @"HWRevision";
  v60 = [MEMORY[0x1E4F929D8] sharedInstance];
  v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
  v106[5] = v59;
  v105[6] = @"HWStatsType";
  v58 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
  v106[6] = v57;
  v105[7] = @"HwStatsLength";
  v56 = [MEMORY[0x1E4F929D8] sharedInstance];
  v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
  v106[7] = v55;
  v105[8] = @"HwStatsLevel";
  v54 = [MEMORY[0x1E4F929D8] sharedInstance];
  v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
  v106[8] = v53;
  v105[9] = @"LastTimestamp";
  v52 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v106[9] = v51;
  v105[10] = @"CurrentTimestamp";
  id v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v106[10] = v49;
  v105[11] = @"LogDuration";
  v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v106[11] = v47;
  v105[12] = @"RPMXOShutdownDuration";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v106[12] = v45;
  v105[13] = @"RPMXOShutdownCount";
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v106[13] = v43;
  v105[14] = @"RPMVDDMinDuration";
  v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v106[14] = v41;
  v105[15] = @"RPMVDDMinEnterCount";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v106[15] = v39;
  v105[16] = @"AppsPerfStateCountHistogram";
  uint64_t v4 = *MEMORY[0x1E4F92D00];
  v102[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v102[0];
  v102[1] = v4;
  v104[0] = &unk_1F29E7C48;
  v104[1] = &unk_1F29E7C60;
  uint64_t v103 = *MEMORY[0x1E4F92D08];
  uint64_t v5 = v103;
  v104[2] = &unk_1F29E7C78;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v102 count:3];
  v106[16] = v38;
  v105[17] = @"CXOShutdownDuration";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v106[17] = v36;
  v105[18] = @"CXOShutdownCount";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v106[18] = v34;
  v105[19] = @"USBStateCountHistogram";
  v100[0] = v3;
  v100[1] = v4;
  v101[0] = &unk_1F29E7C48;
  v101[1] = &unk_1F29E7C90;
  v100[2] = v5;
  v101[2] = &unk_1F29E7C78;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:3];
  v106[19] = v33;
  v105[20] = @"UARTOnOffStateHistogram";
  v98[0] = v3;
  v98[1] = v4;
  v99[0] = &unk_1F29E7C48;
  v99[1] = &unk_1F29E7CA8;
  v98[2] = v5;
  v99[2] = &unk_1F29E7C78;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:3];
  v106[20] = v32;
  v105[21] = @"SPIOnOffStateHistogram";
  v96[0] = v3;
  v96[1] = v4;
  v97[0] = &unk_1F29E7C48;
  v97[1] = &unk_1F29E7CA8;
  v96[2] = v5;
  v97[2] = &unk_1F29E7C78;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:3];
  v106[21] = v31;
  v105[22] = @"ADMOnOffStateHistogram";
  v94[0] = v3;
  v94[1] = v4;
  v95[0] = &unk_1F29E7C48;
  v95[1] = &unk_1F29E7CA8;
  v94[2] = v5;
  v95[2] = &unk_1F29E7C78;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:3];
  v106[22] = v30;
  v105[23] = @"LPASSOnOffStateHistogram";
  v92[0] = v3;
  v92[1] = v4;
  v93[0] = &unk_1F29E7C48;
  v93[1] = &unk_1F29E7CA8;
  v92[2] = v5;
  v93[2] = &unk_1F29E7C78;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:3];
  v106[23] = v29;
  v105[24] = @"APPSSleepVetoState";
  v90[0] = v3;
  v90[1] = v4;
  v91[0] = &unk_1F29E7C48;
  v91[1] = &unk_1F29E7CC0;
  v90[2] = v5;
  v91[2] = &unk_1F29E7C78;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:3];
  v106[24] = v28;
  v105[25] = @"MPSSSleepVetoHistogram";
  v88[0] = v3;
  v88[1] = v4;
  v89[0] = &unk_1F29E7C48;
  v89[1] = &unk_1F29E7C90;
  v88[2] = v5;
  v89[2] = &unk_1F29E7C78;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:3];
  v106[25] = v27;
  v105[26] = @"MDSPConfigCountHistogram";
  v86[0] = v3;
  v86[1] = v4;
  v87[0] = &unk_1F29E7C48;
  v87[1] = &unk_1F29E7CD8;
  v86[2] = v5;
  v87[2] = &unk_1F29E7C78;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:3];
  v106[26] = v26;
  v105[27] = @"QDSPConfigCountHistogram";
  v84[0] = v3;
  v84[1] = v4;
  v85[0] = &unk_1F29E7C48;
  v85[1] = &unk_1F29E7CD8;
  v84[2] = v5;
  v85[2] = &unk_1F29E7C78;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:3];
  v106[27] = v25;
  v105[28] = @"GPSOnOffStateHistogram";
  v82[0] = v3;
  v82[1] = v4;
  v83[0] = &unk_1F29E7C48;
  v83[1] = &unk_1F29E7CA8;
  v82[2] = v5;
  v83[2] = &unk_1F29E7C78;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:3];
  v106[28] = v24;
  v105[29] = @"GPSDPOOnOffStateHistogram";
  v80[0] = v3;
  v80[1] = v4;
  v81[0] = &unk_1F29E7C48;
  v81[1] = &unk_1F29E7CA8;
  v80[2] = v5;
  v81[2] = &unk_1F29E7C78;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];
  v106[29] = v23;
  v105[30] = @"GPSDPOBins";
  v78[0] = v3;
  v78[1] = v4;
  v79[0] = &unk_1F29E7C48;
  v79[1] = &unk_1F29E7C60;
  v78[2] = v5;
  v79[2] = &unk_1F29E7C78;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:3];
  v106[30] = v22;
  v105[31] = @"MPSSCXOShutdownDuration";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v106[31] = v20;
  v105[32] = @"MPSSCXOShutdownCount";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v106[32] = v18;
  v105[33] = @"MCPMVetoNumHistogram";
  v76[0] = v3;
  v76[1] = v4;
  v77[0] = &unk_1F29E7C48;
  v77[1] = &unk_1F29E7C60;
  v76[2] = v5;
  v77[2] = &unk_1F29E7C78;
  float v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:3];
  v106[33] = v17;
  v105[34] = @"NPAVetoMask";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v106[34] = v15;
  v105[35] = @"NPAVetoClientNumHistogram";
  v74[0] = v3;
  v74[1] = v4;
  v75[0] = &unk_1F29E7C48;
  v75[1] = &unk_1F29E7CF0;
  v74[2] = v5;
  v75[2] = &unk_1F29E7C78;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];
  v106[35] = v6;
  v105[36] = @"AppsClockStateDurationStr";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v106[36] = v8;
  v105[37] = @"MpssClockStateDurationStr";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v106[37] = v10;
  v105[38] = @"HsicStateSleepVetoNum";
  v72[0] = v3;
  v72[1] = v4;
  v73[0] = &unk_1F29E7C48;
  v73[1] = &unk_1F29E7D08;
  v72[2] = v5;
  v73[2] = &unk_1F29E7C78;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:3];
  v106[38] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:39];
  v110[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];

  return v13;
}

- (void)logEventBackwardMavBBHwOther
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMavLogMsg_logEventBackwardMavBBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AB08 != -1) {
      dispatch_once(&qword_1EBD5AB08, block);
    }
    if (byte_1EBD5AA60)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardMavBBHwOther]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMavBBHwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:290];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D28];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMavLogMsg *)self populateEntryBBMavHwOther:v12];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__PLBBMavLogMsg_logEventBackwardMavBBHwOther__block_invoke_514;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v13;
    if (qword_1EBD5AB10 != -1) {
      dispatch_once(&qword_1EBD5AB10, v20);
    }
    if (byte_1EBD5AA61)
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"About to send to log at %s", "-[PLBBMavLogMsg logEventBackwardMavBBHwOther]");
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      float v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMavBBHwOther]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:296];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBMavLogMsg *)self sendAndLogPLEntry:v12 withName:@"MavBBHwOther" withType:v10];
}

uint64_t __45__PLBBMavLogMsg_logEventBackwardMavBBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA60 = result;
  return result;
}

uint64_t __45__PLBBMavLogMsg_logEventBackwardMavBBHwOther__block_invoke_514(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA61 = result;
  return result;
}

+ (id)getNameBBMavHwOther
{
  return @"BBMavHwOther";
}

- (void)logEventBackwardGrpEntriesBBMavHw
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHw__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AB18 != -1) {
      dispatch_once(&qword_1EBD5AB18, block);
    }
    if (byte_1EBD5AA62)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:331];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLBasebandMessage *)self agent];

  if (!v10 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHw__block_invoke_523;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v11;
    if (qword_1EBD5AB20 != -1) {
      dispatch_once(&qword_1EBD5AB20, v21);
    }
    if (byte_1EBD5AA63)
    {
      id v12 = [NSString stringWithFormat:@"Bad agent"];
      uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:333];

      float v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v18 = [(PLBasebandMessage *)self agent];
  uint64_t v19 = [(PLBBMavLogMsg *)self groupDict];
  uint64_t v20 = [(PLBBMavLogMsg *)self groupEntryKey];
  [v18 logEntries:v19 withGroupID:v20];
}

uint64_t __50__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHw__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA62 = result;
  return result;
}

uint64_t __50__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHw__block_invoke_523(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA63 = result;
  return result;
}

- (void)addToGroupPLBBMavHwEntry:(id)a3 withEntryKey:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  id v7 = [(PLBBMavLogMsg *)self groupDict];
  uint64_t v8 = [v7 objectForKeyedSubscript:v13];

  if (!v8)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = [(PLBBMavLogMsg *)self groupDict];
    [v10 setObject:v9 forKeyedSubscript:v13];
  }
  uint64_t v11 = [(PLBBMavLogMsg *)self groupDict];
  id v12 = [v11 objectForKeyedSubscript:v13];
  [v12 addObject:v6];
}

- (void)addToGroupPLBBMavHwOther
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __41__PLBBMavLogMsg_addToGroupPLBBMavHwOther__block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5AB28 != -1) {
      dispatch_once(&qword_1EBD5AB28, &block);
    }
    if (byte_1EBD5AA64)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg addToGroupPLBBMavHwOther]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addToGroupPLBBMavHwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:352];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [(PLBBMavLogMsg *)self setGroupEntryKey:v10];
  [(PLBBMavLogMsg *)self populateEntryBBMavHwOther:v11];
  [(PLBBMavLogMsg *)self addToGroupPLBBMavHwEntry:v11 withEntryKey:v10];
}

uint64_t __41__PLBBMavLogMsg_addToGroupPLBBMavHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA64 = result;
  return result;
}

- (void)populateEntryBBMavHwOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBMavLogMsg *)self bbSwRev];
  [v4 setObject:v5 forKeyedSubscript:@"SWRevision"];

  id v6 = [(PLBBMavLogMsg *)self bbHwRev];
  [v4 setObject:v6 forKeyedSubscript:@"HWRevision"];

  id v7 = [(PLBBMavLogMsg *)self bbHwStatsType];
  [v4 setObject:v7 forKeyedSubscript:@"HWStatsType"];

  uint64_t v8 = [(PLBBMavLogMsg *)self bbHwStatsLength];
  [v4 setObject:v8 forKeyedSubscript:@"HwStatsLength"];

  id v9 = [(PLBBMavLogMsg *)self bbHwStatsLevel];
  [v4 setObject:v9 forKeyedSubscript:@"HwStatsLevel"];

  uint64_t v10 = [(PLBBMavLogMsg *)self bbHwCurrTimeStamp];
  [v4 setObject:v10 forKeyedSubscript:@"CurrentTimestamp"];

  uint64_t v11 = [(PLBBMavLogMsg *)self bbHwLastTimeStamp];
  [v4 setObject:v11 forKeyedSubscript:@"LastTimestamp"];

  id v12 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v4 setObject:v12 forKeyedSubscript:@"LogDuration"];

  uint64_t v13 = [(PLBBMavLogMsg *)self commonInfo];
  v14 = [v13 objectForKey:@"BBDate"];
  [v4 setObject:v14 forKeyedSubscript:@"BBDate"];

  uint64_t v15 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v16 = [v15 objectForKey:@"BBDate"];
  float v17 = [v16 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v17];

  uint64_t v18 = [(PLBBMavLogMsg *)self rpmXOShutDuration];
  [v4 setObject:v18 forKeyedSubscript:@"RPMXOShutdownDuration"];

  uint64_t v19 = [(PLBBMavLogMsg *)self rpmXOShutCnt];
  [v4 setObject:v19 forKeyedSubscript:@"RPMXOShutdownCount"];

  uint64_t v20 = [(PLBBMavLogMsg *)self rpmVDDMinDuration];
  [v4 setObject:v20 forKeyedSubscript:@"RPMVDDMinDuration"];

  uint64_t v21 = [(PLBBMavLogMsg *)self rpmVDDMinEnterCnt];
  [v4 setObject:v21 forKeyedSubscript:@"RPMVDDMinEnterCount"];

  id v22 = [(PLBBMavLogMsg *)self appsPerfStateCountHist];
  [v4 setObject:v22 forKeyedSubscript:@"AppsPerfStateCountHistogram"];

  uint64_t v23 = [(PLBBMavLogMsg *)self cxoShutDownDuration];
  [v4 setObject:v23 forKeyedSubscript:@"CXOShutdownDuration"];

  uint64_t v24 = [(PLBBMavLogMsg *)self cxoShutDownCount];
  [v4 setObject:v24 forKeyedSubscript:@"CXOShutdownCount"];

  uint64_t v25 = [(PLBBMavLogMsg *)self usbStateCountHist];
  [v4 setObject:v25 forKeyedSubscript:@"USBStateCountHistogram"];

  v26 = [(PLBBMavLogMsg *)self uartOnOffState];
  [v4 setObject:v26 forKeyedSubscript:@"UARTOnOffStateHistogram"];

  uint64_t v27 = [(PLBBMavLogMsg *)self spiOnOffState];
  [v4 setObject:v27 forKeyedSubscript:@"SPIOnOffStateHistogram"];

  uint64_t v28 = [(PLBBMavLogMsg *)self admOnOffState];
  [v4 setObject:v28 forKeyedSubscript:@"ADMOnOffStateHistogram"];

  v29 = [(PLBBMavLogMsg *)self lpassOnOffState];
  [v4 setObject:v29 forKeyedSubscript:@"LPASSOnOffStateHistogram"];

  v30 = [(PLBBMavLogMsg *)self appsSleepVeto];
  [v4 setObject:v30 forKeyedSubscript:@"APPSSleepVetoState"];

  uint64_t v31 = [(PLBBMavLogMsg *)self mpssSleepVeto];
  [v4 setObject:v31 forKeyedSubscript:@"MPSSSleepVetoHistogram"];

  uint64_t v32 = [(PLBBMavLogMsg *)self mdspConfigCount];
  [v4 setObject:v32 forKeyedSubscript:@"MDSPConfigCountHistogram"];

  v33 = [(PLBBMavLogMsg *)self qdspConfigCount];
  [v4 setObject:v33 forKeyedSubscript:@"QDSPConfigCountHistogram"];

  v34 = [(PLBBMavLogMsg *)self gpsOnOff];
  [v4 setObject:v34 forKeyedSubscript:@"GPSOnOffStateHistogram"];

  v35 = [(PLBBMavLogMsg *)self gpsDPOOnOff];
  [v4 setObject:v35 forKeyedSubscript:@"GPSDPOOnOffStateHistogram"];

  v36 = [(PLBBMavLogMsg *)self gpsDPOBin];
  [v4 setObject:v36 forKeyedSubscript:@"GPSDPOBins"];

  v37 = [(PLBBMavLogMsg *)self mpssCxoShutDownDuration];
  [v4 setObject:v37 forKeyedSubscript:@"MPSSCXOShutdownDuration"];

  uint64_t v38 = [(PLBBMavLogMsg *)self mpssCxoShutDownCount];
  [v4 setObject:v38 forKeyedSubscript:@"MPSSCXOShutdownCount"];

  id v39 = [(PLBBMavLogMsg *)self mcpmVetoNumHistogram];
  [v4 setObject:v39 forKeyedSubscript:@"MCPMVetoNumHistogram"];

  v40 = [(PLBBMavLogMsg *)self npaVetoMask];
  [v4 setObject:v40 forKeyedSubscript:@"NPAVetoMask"];

  v41 = [(PLBBMavLogMsg *)self npaVetoClientNumHistogram];
  [v4 setObject:v41 forKeyedSubscript:@"NPAVetoClientNumHistogram"];

  v42 = [(PLBBMavLogMsg *)self appsClockStateDurationStr];
  [v4 setObject:v42 forKeyedSubscript:@"AppsClockStateDurationStr"];

  v43 = [(PLBBMavLogMsg *)self mpssClockStateDurationStr];
  [v4 setObject:v43 forKeyedSubscript:@"MpssClockStateDurationStr"];

  id v44 = [(PLBBMavLogMsg *)self hsicStateSleepVetoNum];
  [v4 setObject:v44 forKeyedSubscript:@"HsicStateSleepVetoNum"];
}

- (void)refreshMavBBHwOtherPerRAT
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __42__PLBBMavLogMsg_refreshMavBBHwOtherPerRAT__block_invoke;
    float v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5AB30 != -1) {
      dispatch_once(&qword_1EBD5AB30, &block);
    }
    if (byte_1EBD5AA65)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshMavBBHwOtherPerRAT]", block, v15, v16, v17, v18);
      id v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshMavBBHwOtherPerRAT]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:436];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOtherPerRAT"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  uint64_t v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __42__PLBBMavLogMsg_refreshMavBBHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA65 = result;
  return result;
}

+ (id)entryEventBackwardMavBBHwOtherPerRAT
{
  v49[2] = *MEMORY[0x1E4F143B8];
  v48[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v46[0] = *MEMORY[0x1E4F92CD0];
  v46[1] = v2;
  v47[0] = &unk_1F29F13B0;
  v47[1] = @"refreshRequestHandler";
  v46[2] = *MEMORY[0x1E4F92CC0];
  v47[2] = MEMORY[0x1E4F1CC38];
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
  v49[0] = v28;
  v48[1] = *MEMORY[0x1E4F92CA8];
  v44[0] = @"Error";
  uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_BoolFormat");
  v45[0] = v26;
  v44[1] = @"SeqNum";
  uint64_t v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v45[1] = v24;
  v44[2] = @"BBDate";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v22 = objc_msgSend(v23, "commonTypeDict_DateFormat");
  v45[2] = v22;
  v44[3] = @"TimeCal";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v45[3] = v20;
  v44[4] = @"LogDuration";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v45[4] = v18;
  v44[5] = @"RadioTech";
  float v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v45[5] = v16;
  v44[6] = @"RSSIModeCount";
  uint64_t v4 = *MEMORY[0x1E4F92D00];
  v41[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v41[0];
  v41[1] = v4;
  v43[0] = &unk_1F29E7C48;
  v43[1] = &unk_1F29E7D20;
  uint64_t v42 = *MEMORY[0x1E4F92D08];
  uint64_t v5 = v42;
  v43[2] = &unk_1F29E7C78;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v41 count:3];
  v45[6] = v15;
  v44[7] = @"Rx0RSSIPowerHist";
  v39[0] = v3;
  v39[1] = v4;
  v40[0] = &unk_1F29E7C48;
  v40[1] = &unk_1F29E7D38;
  v39[2] = v5;
  v40[2] = &unk_1F29E7C78;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  v45[7] = v14;
  v44[8] = @"Rx1RSSIPowerHist";
  v37[0] = v3;
  v37[1] = v4;
  v38[0] = &unk_1F29E7C48;
  v38[1] = &unk_1F29E7D38;
  v37[2] = v5;
  v38[2] = &unk_1F29E7C78;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  v45[8] = v6;
  v44[9] = @"Rx0SQAPowerHist";
  v35[0] = v3;
  v35[1] = v4;
  v36[0] = &unk_1F29E7C48;
  v36[1] = &unk_1F29E7D50;
  v35[2] = v5;
  v36[2] = &unk_1F29E7C78;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v45[9] = v7;
  v44[10] = @"Rx1SQAPowerHist";
  v33[0] = v3;
  v33[1] = v4;
  v34[0] = &unk_1F29E7C48;
  v34[1] = &unk_1F29E7D50;
  v33[2] = v5;
  v34[2] = &unk_1F29E7C78;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  v45[10] = v8;
  v44[11] = @"TxPowerHist";
  v31[0] = v3;
  v31[1] = v4;
  v32[0] = &unk_1F29E7C48;
  v32[1] = &unk_1F29E7D68;
  v31[2] = v5;
  v32[2] = &unk_1F29E7C78;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  v45[11] = v9;
  v44[12] = @"ProtocolStateHist";
  v29[0] = v3;
  v29[1] = v4;
  v30[0] = &unk_1F29E7C48;
  v30[1] = &unk_1F29E7D80;
  v29[2] = v5;
  v30[2] = &unk_1F29E7C78;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  v45[12] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:13];
  v49[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];

  return v12;
}

- (id)internaLogEventBackwardBBMavHwOtherPerRAT
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    float v17 = __58__PLBBMavLogMsg_internaLogEventBackwardBBMavHwOtherPerRAT__block_invoke;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v3;
    if (qword_1EBD5AB38 != -1) {
      dispatch_once(&qword_1EBD5AB38, &block);
    }
    if (byte_1EBD5AA66)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg internaLogEventBackwardBBMavHwOtherPerRAT]", block, v16, v17, v18, v19);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg internaLogEventBackwardBBMavHwOtherPerRAT]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:484];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D28];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOtherPerRAT"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMavLogMsg *)self populateEntryBBMavHwOtherPerRAT:v12];
  v20[0] = @"entry";
  v20[1] = @"name";
  v21[0] = v12;
  v21[1] = v11;
  v20[2] = @"type";
  v21[2] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v13;
}

uint64_t __58__PLBBMavLogMsg_internaLogEventBackwardBBMavHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA66 = result;
  return result;
}

- (void)logEventBackwardMavBBHwOtherPerRAT
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __51__PLBBMavLogMsg_logEventBackwardMavBBHwOtherPerRAT__block_invoke;
    float v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v3;
    if (qword_1EBD5AB40 != -1) {
      dispatch_once(&qword_1EBD5AB40, &block);
    }
    if (byte_1EBD5AA67)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardMavBBHwOtherPerRAT]", block, v15, v16, v17, v18);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMavBBHwOtherPerRAT]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:498];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLBBMavLogMsg *)self internaLogEventBackwardBBMavHwOtherPerRAT];
  uint64_t v11 = [v10 objectForKey:@"entry"];
  id v12 = [v10 objectForKey:@"name"];
  uint64_t v13 = [v10 objectForKey:@"type"];
  [(PLBBMavLogMsg *)self sendAndLogPLEntry:v11 withName:v12 withType:v13];
}

uint64_t __51__PLBBMavLogMsg_logEventBackwardMavBBHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA67 = result;
  return result;
}

- (id)logEventBackwardGrpEntriesBBMavHwOtherPerRAT
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    float v17 = __61__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHwOtherPerRAT__block_invoke;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v3;
    if (qword_1EBD5AB48 != -1) {
      dispatch_once(&qword_1EBD5AB48, &block);
    }
    if (byte_1EBD5AA68)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT]", block, v16, v17, v18, v19);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:509];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLBBMavLogMsg *)self internaLogEventBackwardBBMavHwOtherPerRAT];
  v20[0] = @"entry";
  uint64_t v11 = objc_msgSend(v10, "objectForKey:");
  v20[1] = @"name";
  v21[0] = v11;
  id v12 = objc_msgSend(v10, "objectForKey:");
  v21[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v13;
}

uint64_t __61__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA68 = result;
  return result;
}

- (void)populateEntryBBMavHwOtherPerRAT:(id)a3
{
  id v38 = a3;
  uint64_t v4 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v5 = [v4 objectForKey:@"SeqNum"];
  [v38 setObject:v5 forKeyedSubscript:@"SeqNum"];

  id v6 = [(PLBBMavLogMsg *)self commonInfo];
  id v7 = [v6 objectForKey:@"BBDate"];
  [v38 setObject:v7 forKeyedSubscript:@"BBDate"];

  uint64_t v8 = [(PLBBMavLogMsg *)self commonInfo];
  id v9 = [v8 objectForKey:@"TimeCal"];
  [v38 setObject:v9 forKeyedSubscript:@"TimeCal"];

  uint64_t v10 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v11 = [v10 objectForKey:@"Error"];
  [v38 setObject:v11 forKeyedSubscript:@"Error"];

  id v12 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v13 = [v12 objectForKey:@"BBDate"];
  v14 = [v13 convertFromBasebandToMonotonic];
  [v38 setEntryDate:v14];

  uint64_t v15 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v38 setObject:v15 forKeyedSubscript:@"LogDuration"];

  uint64_t v16 = [(PLBBMavLogMsg *)self radioTech];
  [v38 setObject:v16 forKeyedSubscript:@"RadioTech"];

  float v17 = [(PLBBMavLogMsg *)self rssiModeCount];
  [v38 setObject:v17 forKeyedSubscript:@"RSSIModeCount"];

  uint64_t v18 = [(PLBBMavLogMsg *)self rx0RssiPowerHist];
  [v38 setObject:v18 forKeyedSubscript:@"Rx0RSSIPowerHist"];

  uint64_t v19 = [(PLBBMavLogMsg *)self rx1RssiPowerHist];
  [v38 setObject:v19 forKeyedSubscript:@"Rx1RSSIPowerHist"];

  uint64_t v20 = [(PLBBMavLogMsg *)self rx0SQAPowerHist];
  [v38 setObject:v20 forKeyedSubscript:@"Rx0SQAPowerHist"];

  uint64_t v21 = [(PLBBMavLogMsg *)self rx1SQAPowerHist];
  [v38 setObject:v21 forKeyedSubscript:@"Rx1SQAPowerHist"];

  id v22 = [(PLBBMavLogMsg *)self txPowerHist];
  [v38 setObject:v22 forKeyedSubscript:@"TxPowerHist"];

  uint64_t v23 = [(PLBBMavLogMsg *)self protocolStateHist];
  [v38 setObject:v23 forKeyedSubscript:@"ProtocolStateHist"];

  uint64_t v24 = [(PLBBMavLogMsg *)self txPowerHist];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    unint64_t v26 = 0;
    int v27 = 0;
    do
    {
      uint64_t v28 = [(PLBBMavLogMsg *)self txPowerHist];
      v29 = [v28 objectAtIndexedSubscript:v26];
      v27 += [v29 intValue];

      ++v26;
      v30 = [(PLBBMavLogMsg *)self txPowerHist];
      unint64_t v31 = [v30 count];
    }
    while (v31 > v26);
    BOOL v32 = v27 == 0;
  }
  else
  {
    BOOL v32 = 1;
  }
  v33 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  int v34 = [v33 intValue];
  v35 = [(PLBBMavLogMsg *)self protocolStateHist];
  v36 = [v35 objectAtIndexedSubscript:0];
  int v37 = [v36 intValue];

  if (v34 == v37 && v32) {
    [v38 setWriteToDB:0];
  }
}

- (void)logGrpEntriesMavBBHwOtherPerRat
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLBBMavLogMsg_logGrpEntriesMavBBHwOtherPerRat__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AB50 != -1) {
      dispatch_once(&qword_1EBD5AB50, block);
    }
    if (byte_1EBD5AA69)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logGrpEntriesMavBBHwOtherPerRat]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logGrpEntriesMavBBHwOtherPerRat]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:552];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLBasebandMessage *)self agent];

  if (!v10 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __48__PLBBMavLogMsg_logGrpEntriesMavBBHwOtherPerRat__block_invoke_545;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v11;
    if (qword_1EBD5AB58 != -1) {
      dispatch_once(&qword_1EBD5AB58, v23);
    }
    if (byte_1EBD5AA6A)
    {
      id v12 = [NSString stringWithFormat:@"Bad agent"];
      uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logGrpEntriesMavBBHwOtherPerRat]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:554];

      float v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v18 = [(PLBasebandMessage *)self agent];
  uint64_t v19 = [(PLBBMavLogMsg *)self groupEntryKey];
  uint64_t v25 = v19;
  uint64_t v20 = [(PLBBMavLogMsg *)self groupArrEntries];
  unint64_t v26 = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v22 = [(PLBBMavLogMsg *)self groupEntryKey];
  [v18 logEntries:v21 withGroupID:v22];
}

uint64_t __48__PLBBMavLogMsg_logGrpEntriesMavBBHwOtherPerRat__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA69 = result;
  return result;
}

uint64_t __48__PLBBMavLogMsg_logGrpEntriesMavBBHwOtherPerRat__block_invoke_545(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA6A = result;
  return result;
}

- (void)setType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __25__PLBBMavLogMsg_setType___block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5AB60 != -1) {
      dispatch_once(&qword_1EBD5AB60, &block);
    }
    if (byte_1EBD5AA6B)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg setType:]", block, v13, v14, v15, v16);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg setType:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:561];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v4 forKey:@"Type"];
}

uint64_t __25__PLBBMavLogMsg_setType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA6B = result;
  return result;
}

- (void)setMavBBHwValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLBBMavLogMsg *)self kvPairs];
  [v8 setObject:v7 forKey:v6];
}

+ (id)entryEventMavBBMav1HwOther
{
  return +[PLBBMavLogMsg entryEventMavBBMav2HwOther];
}

- (void)logEventBackwardMav1BBHwOtherPerRAT
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __52__PLBBMavLogMsg_logEventBackwardMav1BBHwOtherPerRAT__block_invoke;
    uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v3;
    if (qword_1EBD5AB68 != -1) {
      dispatch_once(&qword_1EBD5AB68, &block);
    }
    if (byte_1EBD5AA6C)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardMav1BBHwOtherPerRAT]", block, v14, v15, v16, v17);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav1BBHwOtherPerRAT]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:590];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D28];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOtherPerRAT"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMavLogMsg *)self sendAndLogPLEntry:v12 withName:@"MavBBHwOtherPerRAT" withType:v10];
}

uint64_t __52__PLBBMavLogMsg_logEventBackwardMav1BBHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA6C = result;
  return result;
}

+ (id)entryEventBackwardMav1BBHwOtherPerRAT
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v38[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v36[0] = *MEMORY[0x1E4F92CD0];
  v36[1] = v2;
  v37[0] = &unk_1F29F13C0;
  v37[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v36[2] = *MEMORY[0x1E4F92CB0];
  void v36[3] = v3;
  v37[2] = @"refreshRequestHandler";
  void v37[3] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];
  v39[0] = v24;
  v38[1] = *MEMORY[0x1E4F92CA8];
  v34[0] = @"BBDate";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v22 = objc_msgSend(v23, "commonTypeDict_DateFormat");
  v35[0] = v22;
  v34[1] = @"Error";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v35[1] = v20;
  v34[2] = @"RxTicks";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v35[2] = v18;
  void v34[3] = @"TxTicks";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  void v35[3] = v16;
  v34[4] = @"LogDuration";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v35[4] = v14;
  v34[5] = @"RSSIModeCount";
  uint64_t v5 = *MEMORY[0x1E4F92D00];
  v31[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v31[0];
  v31[1] = v5;
  v33[0] = &unk_1F29E7C48;
  v33[1] = &unk_1F29E7D20;
  uint64_t v32 = *MEMORY[0x1E4F92D08];
  uint64_t v6 = v32;
  v33[2] = &unk_1F29E7C78;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v31 count:3];
  v35[5] = v7;
  v34[6] = @"Rx0RSSIPowerHist";
  v29[0] = v4;
  v29[1] = v5;
  v30[0] = &unk_1F29E7C48;
  v30[1] = &unk_1F29E7D38;
  v29[2] = v6;
  v30[2] = &unk_1F29E7C78;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  v35[6] = v8;
  v34[7] = @"TxPowerHist1x";
  v27[0] = v4;
  v27[1] = v5;
  v28[0] = &unk_1F29E7C48;
  v28[1] = &unk_1F29E7D68;
  v27[2] = v6;
  v28[2] = &unk_1F29E7C78;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v35[7] = v9;
  v34[8] = @"TxPowerHistEVDO";
  v25[0] = v4;
  v25[1] = v5;
  v26[0] = &unk_1F29E7C48;
  v26[1] = &unk_1F29E7D68;
  v25[2] = v6;
  v26[2] = &unk_1F29E7C78;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v35[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:9];
  v39[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

  return v12;
}

- (void)refreshMav1BBHwOtherPerRAT
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __43__PLBBMavLogMsg_refreshMav1BBHwOtherPerRAT__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5AB70 != -1) {
      dispatch_once(&qword_1EBD5AB70, &block);
    }
    if (byte_1EBD5AA6D)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshMav1BBHwOtherPerRAT]", block, v15, v16, v17, v18);
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshMav1BBHwOtherPerRAT]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:640];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOtherPerRAT"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  uint64_t v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __43__PLBBMavLogMsg_refreshMav1BBHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA6D = result;
  return result;
}

- (void)populateEntryBBMav1HwOtherPerRAT:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v6 = [v5 objectForKey:@"SeqNum"];
  [v4 setObject:v6 forKeyedSubscript:@"SeqNum"];

  id v7 = [(PLBBMavLogMsg *)self commonInfo];
  id v8 = [v7 objectForKey:@"BBDate"];
  [v4 setObject:v8 forKeyedSubscript:@"BBDate"];

  id v9 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v10 = [v9 objectForKey:@"TimeCal"];
  [v4 setObject:v10 forKeyedSubscript:@"TimeCal"];

  uint64_t v11 = [(PLBBMavLogMsg *)self commonInfo];
  id v12 = [v11 objectForKey:@"Error"];
  [v4 setObject:v12 forKeyedSubscript:@"Error"];

  uint64_t v13 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v14 = [v13 objectForKey:@"BBDate"];
  uint64_t v15 = [v14 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v15];

  uint64_t v16 = [(PLBBMavLogMsg *)self rxTicks];
  [v4 setObject:v16 forKeyedSubscript:@"RxTicks"];

  uint64_t v17 = [(PLBBMavLogMsg *)self txTicks];
  [v4 setObject:v17 forKeyedSubscript:@"TxTicks"];

  uint64_t v18 = [(PLBBMavLogMsg *)self rx0RssiPowerHist];
  [v4 setObject:v18 forKeyedSubscript:@"Rx0RSSIPowerHist"];

  uint64_t v19 = [(PLBBMavLogMsg *)self rssiModeCount];
  [v4 setObject:v19 forKeyedSubscript:@"RSSIModeCount"];

  uint64_t v20 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v4 setObject:v20 forKeyedSubscript:@"LogDuration"];

  uint64_t v21 = [(PLBBMavLogMsg *)self txPowerHist1x];
  [v4 setObject:v21 forKeyedSubscript:@"TxPowerHist1x"];

  id v22 = [(PLBBMavLogMsg *)self txPowerHistEVDO];
  [v4 setObject:v22 forKeyedSubscript:@"TxPowerHistEVDO"];
}

- (id)logEventBackwardGrpEntriesBBMav1HwOtherPerRAT
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __62__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMav1HwOtherPerRAT__block_invoke;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v3;
    if (qword_1EBD5AB78 != -1) {
      dispatch_once(&qword_1EBD5AB78, &block);
    }
    if (byte_1EBD5AA6E)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav1HwOtherPerRAT]", block, v16, v17, v18, v19);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav1HwOtherPerRAT]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:672];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [(PLBBMavLogMsg *)self internaLogEventBackwardBBMav1HwOtherPerRAT];
  v20[0] = @"entry";
  uint64_t v11 = objc_msgSend(v10, "objectForKey:");
  v20[1] = @"name";
  v21[0] = v11;
  id v12 = objc_msgSend(v10, "objectForKey:");
  v21[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v13;
}

uint64_t __62__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMav1HwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA6E = result;
  return result;
}

- (id)internaLogEventBackwardBBMav1HwOtherPerRAT
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __59__PLBBMavLogMsg_internaLogEventBackwardBBMav1HwOtherPerRAT__block_invoke;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v3;
    if (qword_1EBD5AB80 != -1) {
      dispatch_once(&qword_1EBD5AB80, &block);
    }
    if (byte_1EBD5AA6F)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg internaLogEventBackwardBBMav1HwOtherPerRAT]", block, v16, v17, v18, v19);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg internaLogEventBackwardBBMav1HwOtherPerRAT]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:680];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D28];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOtherPerRAT"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMavLogMsg *)self populateEntryBBMav1HwOtherPerRAT:v12];
  v20[0] = @"entry";
  v20[1] = @"name";
  v21[0] = v12;
  v21[1] = v11;
  void v20[2] = @"type";
  void v21[2] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v13;
}

uint64_t __59__PLBBMavLogMsg_internaLogEventBackwardBBMav1HwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA6F = result;
  return result;
}

- (void)refreshBBMav2HwOther
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __37__PLBBMavLogMsg_refreshBBMav2HwOther__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5AB88 != -1) {
      dispatch_once(&qword_1EBD5AB88, &block);
    }
    if (byte_1EBD5AA70)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshBBMav2HwOther]", block, v15, v16, v17, v18);
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshBBMav2HwOther]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:697];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  uint64_t v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __37__PLBBMavLogMsg_refreshBBMav2HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA70 = result;
  return result;
}

+ (id)entryEventMavBBMav2HwOther
{
  v84[2] = *MEMORY[0x1E4F143B8];
  v83[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v81[0] = *MEMORY[0x1E4F92CD0];
  v81[1] = v2;
  v82[0] = &unk_1F29F13D0;
  v82[1] = @"refreshRequestHandler";
  v81[2] = *MEMORY[0x1E4F92CC0];
  v82[2] = MEMORY[0x1E4F1CC38];
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  v84[0] = v49;
  v83[1] = *MEMORY[0x1E4F92CA8];
  v79[0] = @"Error";
  v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  v47 = objc_msgSend(v48, "commonTypeDict_BoolFormat");
  v80[0] = v47;
  v79[1] = @"Type";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v80[1] = v45;
  v79[2] = @"SeqNum";
  id v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v80[2] = v43;
  void v79[3] = @"BBDate";
  uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_DateFormat");
  void v80[3] = v41;
  v79[4] = @"TimeCal";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v80[4] = v39;
  v79[5] = @"SWRevision";
  id v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v80[5] = v37;
  v79[6] = @"HWRevision";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v80[6] = v35;
  v79[7] = @"HWStatsType";
  int v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v80[7] = v33;
  v79[8] = @"HwStatsLength";
  uint64_t v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v80[8] = v31;
  v79[9] = @"HwStatsLevel";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v80[9] = v29;
  v79[10] = @"LastTimestamp";
  uint64_t v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v80[10] = v27;
  v79[11] = @"CurrentTimestamp";
  unint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v80[11] = v25;
  v79[12] = @"LogDuration";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v80[12] = v23;
  v79[13] = @"ProcSystemState";
  uint64_t v4 = *MEMORY[0x1E4F92D00];
  v76[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v76[0];
  v76[1] = v4;
  v78[0] = &unk_1F29E7C48;
  v78[1] = &unk_1F29E7C90;
  uint64_t v77 = *MEMORY[0x1E4F92D08];
  uint64_t v5 = v77;
  v78[2] = &unk_1F29E7C78;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v76 count:3];
  v80[13] = v22;
  v79[14] = @"ProcArmPerfState";
  v74[0] = v3;
  v74[1] = v4;
  v75[0] = &unk_1F29E7C48;
  v75[1] = &unk_1F29E7D98;
  v74[2] = v5;
  v75[2] = &unk_1F29E7C78;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];
  v80[14] = v21;
  v79[15] = @"ModemAppMdspState";
  v72[0] = v3;
  v72[1] = v4;
  v73[0] = &unk_1F29E7C48;
  v73[1] = &unk_1F29E7CA8;
  v72[2] = v5;
  v73[2] = &unk_1F29E7C78;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:3];
  v80[15] = v20;
  v79[16] = @"ModemAppMdspClockState";
  v70[0] = v3;
  v70[1] = v4;
  v71[0] = &unk_1F29E7C48;
  v71[1] = &unk_1F29E7CA8;
  v70[2] = v5;
  v71[2] = &unk_1F29E7C78;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:3];
  v80[16] = v19;
  v79[17] = @"ModemAppMdspSpeed";
  v68[0] = v3;
  v68[1] = v4;
  v69[0] = &unk_1F29E7C48;
  v69[1] = &unk_1F29E7DB0;
  v68[2] = v5;
  v69[2] = &unk_1F29E7C78;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
  v80[17] = v18;
  v79[18] = @"ModemAppMdmState";
  v66[0] = v3;
  v66[1] = v4;
  v67[0] = &unk_1F29E7C48;
  v67[1] = &unk_1F29E7CA8;
  v66[2] = v5;
  v67[2] = &unk_1F29E7C78;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
  v80[18] = v17;
  v79[19] = @"ModemAppAdspState";
  v64[0] = v3;
  v64[1] = v4;
  v65[0] = &unk_1F29E7C48;
  v65[1] = &unk_1F29E7CA8;
  v64[2] = v5;
  v65[2] = &unk_1F29E7C78;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
  v80[19] = v16;
  v79[20] = @"ModemAppAdspClockState";
  v62[0] = v3;
  v62[1] = v4;
  v63[0] = &unk_1F29E7C48;
  v63[1] = &unk_1F29E7CA8;
  v62[2] = v5;
  v63[2] = &unk_1F29E7C78;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
  v80[20] = v15;
  v79[21] = @"ModemAppAdspSpeed";
  v60[0] = v3;
  v60[1] = v4;
  v61[0] = &unk_1F29E7C48;
  v61[1] = &unk_1F29E7DB0;
  v60[2] = v5;
  v61[2] = &unk_1F29E7C78;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
  v80[21] = v14;
  v79[22] = @"ModemAppAdmState";
  v58[0] = v3;
  v58[1] = v4;
  v59[0] = &unk_1F29E7C48;
  v59[1] = &unk_1F29E7CA8;
  v58[2] = v5;
  v59[2] = &unk_1F29E7C78;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
  v80[22] = v13;
  v79[23] = @"PeripheralUSBState";
  v56[0] = v3;
  v56[1] = v4;
  v57[0] = &unk_1F29E7C48;
  v57[1] = &unk_1F29E7CA8;
  v56[2] = v5;
  v57[2] = &unk_1F29E7C78;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
  v80[23] = v6;
  v79[24] = @"PeripheralSPIState";
  v54[0] = v3;
  v54[1] = v4;
  v55[0] = &unk_1F29E7C48;
  v55[1] = &unk_1F29E7CA8;
  v54[2] = v5;
  v55[2] = &unk_1F29E7C78;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
  v80[24] = v7;
  v79[25] = @"PeripheralGPSState";
  v52[0] = v3;
  v52[1] = v4;
  v53[0] = &unk_1F29E7C48;
  v53[1] = &unk_1F29E7CA8;
  v52[2] = v5;
  v53[2] = &unk_1F29E7C78;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  v80[25] = v8;
  v79[26] = @"PeripheralUARTState";
  v50[0] = v3;
  v50[1] = v4;
  v51[0] = &unk_1F29E7C48;
  v51[1] = &unk_1F29E7CA8;
  v50[2] = v5;
  v51[2] = &unk_1F29E7C78;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
  v80[26] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:27];
  v84[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];

  return v11;
}

- (void)populateEntryBBMav2HwOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBMavLogMsg *)self bbSwRev];
  [v4 setObject:v5 forKeyedSubscript:@"SWRevision"];

  uint64_t v6 = [(PLBBMavLogMsg *)self bbHwRev];
  [v4 setObject:v6 forKeyedSubscript:@"HWRevision"];

  id v7 = [(PLBBMavLogMsg *)self commonInfo];
  id v8 = [v7 objectForKey:@"BBDate"];
  [v4 setObject:v8 forKeyedSubscript:@"BBDate"];

  id v9 = [(PLBBMavLogMsg *)self bbHwStatsType];
  [v4 setObject:v9 forKeyedSubscript:@"HWStatsType"];

  uint64_t v10 = [(PLBBMavLogMsg *)self bbHwStatsLength];
  [v4 setObject:v10 forKeyedSubscript:@"HwStatsLength"];

  uint64_t v11 = [(PLBBMavLogMsg *)self bbHwStatsLevel];
  [v4 setObject:v11 forKeyedSubscript:@"HwStatsLevel"];

  id v12 = [(PLBBMavLogMsg *)self bbHwCurrTimeStamp];
  [v4 setObject:v12 forKeyedSubscript:@"CurrentTimestamp"];

  uint64_t v13 = [(PLBBMavLogMsg *)self bbHwLastTimeStamp];
  [v4 setObject:v13 forKeyedSubscript:@"LastTimestamp"];

  uint64_t v14 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v4 setObject:v14 forKeyedSubscript:@"LogDuration"];

  uint64_t v15 = [(PLBBMavLogMsg *)self bbHwMsgType];
  [v4 setObject:v15 forKeyedSubscript:@"Type"];

  uint64_t v16 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v17 = [v16 objectForKey:@"BBDate"];
  uint64_t v18 = [v17 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v18];

  uint64_t v19 = [(PLBBMavLogMsg *)self bbHwProcSystemState];
  [v4 setObject:v19 forKeyedSubscript:@"ProcSystemState"];

  uint64_t v20 = [(PLBBMavLogMsg *)self bbHwProcArmPerfState];
  [v4 setObject:v20 forKeyedSubscript:@"ProcArmPerfState"];

  uint64_t v21 = [(PLBBMavLogMsg *)self bbHwModemAppMdspState];
  [v4 setObject:v21 forKeyedSubscript:@"ModemAppMdspState"];

  id v22 = [(PLBBMavLogMsg *)self bbHwModemAppMdspClockState];
  [v4 setObject:v22 forKeyedSubscript:@"ModemAppMdspClockState"];

  uint64_t v23 = [(PLBBMavLogMsg *)self bbHwModemAppMdspSpeed];
  [v4 setObject:v23 forKeyedSubscript:@"ModemAppMdspSpeed"];

  uint64_t v24 = [(PLBBMavLogMsg *)self bbHwModemAppMdmState];
  [v4 setObject:v24 forKeyedSubscript:@"ModemAppMdmState"];

  uint64_t v25 = [(PLBBMavLogMsg *)self bbHwModemAppAdspState];
  [v4 setObject:v25 forKeyedSubscript:@"ModemAppAdspState"];

  unint64_t v26 = [(PLBBMavLogMsg *)self bbHwModemAppAdspClockState];
  [v4 setObject:v26 forKeyedSubscript:@"ModemAppAdspClockState"];

  int v27 = [(PLBBMavLogMsg *)self bbHwModemAppAdspSpeed];
  [v4 setObject:v27 forKeyedSubscript:@"ModemAppAdspSpeed"];

  uint64_t v28 = [(PLBBMavLogMsg *)self bbHwModemAppAdmState];
  [v4 setObject:v28 forKeyedSubscript:@"ModemAppAdmState"];

  uint64_t v29 = [(PLBBMavLogMsg *)self bbHwPeripheralUSBState];
  [v4 setObject:v29 forKeyedSubscript:@"PeripheralUSBState"];

  v30 = [(PLBBMavLogMsg *)self bbHwPeripheralSPIState];
  [v4 setObject:v30 forKeyedSubscript:@"PeripheralSPIState"];

  unint64_t v31 = [(PLBBMavLogMsg *)self bbHwPeripheralGPSState];
  [v4 setObject:v31 forKeyedSubscript:@"PeripheralGPSState"];

  id v32 = [(PLBBMavLogMsg *)self bbHwPeripheralUARTState];
  [v4 setObject:v32 forKeyedSubscript:@"PeripheralUARTState"];
}

- (void)addToGroupPLBBMav2HwOther
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __42__PLBBMavLogMsg_addToGroupPLBBMav2HwOther__block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5AB90 != -1) {
      dispatch_once(&qword_1EBD5AB90, &block);
    }
    if (byte_1EBD5AA71)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg addToGroupPLBBMav2HwOther]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addToGroupPLBBMav2HwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:830];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [(PLBBMavLogMsg *)self setGroupEntryKey:v10];
  [(PLBBMavLogMsg *)self populateEntryBBMav2HwOther:v11];
  [(PLBBMavLogMsg *)self addToGroupPLBBMavHwEntry:v11 withEntryKey:v10];
}

uint64_t __42__PLBBMavLogMsg_addToGroupPLBBMav2HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA71 = result;
  return result;
}

- (void)refreshBBMav4HwOther
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __37__PLBBMavLogMsg_refreshBBMav4HwOther__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5AB98 != -1) {
      dispatch_once(&qword_1EBD5AB98, &block);
    }
    if (byte_1EBD5AA72)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshBBMav4HwOther]", block, v15, v16, v17, v18);
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshBBMav4HwOther]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:848];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  uint64_t v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __37__PLBBMavLogMsg_refreshBBMav4HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA72 = result;
  return result;
}

+ (id)entryEventMavBBMav4HwOther
{
  v78[2] = *MEMORY[0x1E4F143B8];
  v77[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v75[0] = *MEMORY[0x1E4F92CD0];
  v75[1] = v2;
  v76[0] = &unk_1F29F13E0;
  v76[1] = @"refreshRequestHandler";
  v75[2] = *MEMORY[0x1E4F92CC0];
  void v76[2] = MEMORY[0x1E4F1CC38];
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  v78[0] = v47;
  v77[1] = *MEMORY[0x1E4F92CA8];
  v73[0] = @"Error";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_BoolFormat");
  v74[0] = v45;
  v73[1] = @"Type";
  id v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v74[1] = v43;
  v73[2] = @"SeqNum";
  uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v74[2] = v41;
  void v73[3] = @"BBDate";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v39 = objc_msgSend(v40, "commonTypeDict_DateFormat");
  void v74[3] = v39;
  v73[4] = @"TimeCal";
  id v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v74[4] = v37;
  v73[5] = @"SWRevision";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v74[5] = v35;
  v73[6] = @"HWRevision";
  int v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v74[6] = v33;
  v73[7] = @"HWStatsType";
  id v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v74[7] = v31;
  v73[8] = @"HwStatsLength";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v74[8] = v29;
  v73[9] = @"HwStatsLevel";
  uint64_t v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v74[9] = v27;
  v73[10] = @"LastTimestamp";
  unint64_t v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v74[10] = v25;
  v73[11] = @"CurrentTimestamp";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v74[11] = v23;
  v73[12] = @"LogDuration";
  id v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v74[12] = v21;
  v73[13] = @"ProcSystemState";
  uint64_t v4 = *MEMORY[0x1E4F92D00];
  v70[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v70[0];
  v70[1] = v4;
  v72[0] = &unk_1F29E7C48;
  v72[1] = &unk_1F29E7C90;
  uint64_t v71 = *MEMORY[0x1E4F92D08];
  uint64_t v5 = v71;
  v72[2] = &unk_1F29E7C78;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v70 count:3];
  v74[13] = v20;
  v73[14] = @"ProcArmPerfState";
  v68[0] = v3;
  v68[1] = v4;
  v69[0] = &unk_1F29E7C48;
  v69[1] = &unk_1F29E7D08;
  v68[2] = v5;
  v69[2] = &unk_1F29E7C78;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
  v74[14] = v19;
  v73[15] = @"ModemAppMdspSpeed";
  v66[0] = v3;
  v66[1] = v4;
  v67[0] = &unk_1F29E7C48;
  v67[1] = &unk_1F29E7DB0;
  v66[2] = v5;
  v67[2] = &unk_1F29E7C78;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
  v74[15] = v18;
  v73[16] = @"ModemAppMdmState";
  v64[0] = v3;
  v64[1] = v4;
  v65[0] = &unk_1F29E7C48;
  v65[1] = &unk_1F29E7CA8;
  v64[2] = v5;
  v65[2] = &unk_1F29E7C78;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
  v74[16] = v17;
  v73[17] = @"ModemAppQdspSpeed";
  v62[0] = v3;
  v62[1] = v4;
  v63[0] = &unk_1F29E7C48;
  v63[1] = &unk_1F29E7DB0;
  v62[2] = v5;
  v63[2] = &unk_1F29E7C78;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
  v74[17] = v16;
  v73[18] = @"ModemAppAdmState";
  v60[0] = v3;
  v60[1] = v4;
  v61[0] = &unk_1F29E7C48;
  v61[1] = &unk_1F29E7CA8;
  v60[2] = v5;
  v61[2] = &unk_1F29E7C78;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
  v74[18] = v15;
  v73[19] = @"PeripheralUSBState";
  v58[0] = v3;
  v58[1] = v4;
  v59[0] = &unk_1F29E7C48;
  v59[1] = &unk_1F29E7CA8;
  v58[2] = v5;
  v59[2] = &unk_1F29E7C78;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
  v74[19] = v14;
  v73[20] = @"PeripheralSPIState";
  v56[0] = v3;
  v56[1] = v4;
  v57[0] = &unk_1F29E7C48;
  v57[1] = &unk_1F29E7CA8;
  v56[2] = v5;
  v57[2] = &unk_1F29E7C78;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
  v74[20] = v13;
  v73[21] = @"PeripheralGPSState";
  v54[0] = v3;
  v54[1] = v4;
  v55[0] = &unk_1F29E7C48;
  v55[1] = &unk_1F29E7CA8;
  v54[2] = v5;
  v55[2] = &unk_1F29E7C78;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
  v74[21] = v6;
  v73[22] = @"PeripheralUARTState";
  v52[0] = v3;
  v52[1] = v4;
  v53[0] = &unk_1F29E7C48;
  v53[1] = &unk_1F29E7CA8;
  v52[2] = v5;
  v53[2] = &unk_1F29E7C78;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  v74[22] = v7;
  v73[23] = @"SleepVetoClientListQdsp";
  v50[0] = v3;
  v50[1] = v4;
  v51[0] = &unk_1F29E7C48;
  v51[1] = &unk_1F29E7D20;
  v50[2] = v5;
  v51[2] = &unk_1F29E7C78;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
  v74[23] = v8;
  v73[24] = @"SleepVetoClientListArm";
  v48[0] = v3;
  v48[1] = v4;
  v49[0] = &unk_1F29E7C48;
  v49[1] = &unk_1F29E7D20;
  void v48[2] = v5;
  v49[2] = &unk_1F29E7C78;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
  v74[24] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:25];
  v78[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:2];

  return v11;
}

- (void)populateEntryBBMav4HwOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBMavLogMsg *)self bbSwRev];
  [v4 setObject:v5 forKeyedSubscript:@"SWRevision"];

  uint64_t v6 = [(PLBBMavLogMsg *)self bbHwRev];
  [v4 setObject:v6 forKeyedSubscript:@"HWRevision"];

  id v7 = [(PLBBMavLogMsg *)self commonInfo];
  id v8 = [v7 objectForKey:@"BBDate"];
  [v4 setObject:v8 forKeyedSubscript:@"BBDate"];

  id v9 = [(PLBBMavLogMsg *)self bbHwStatsType];
  [v4 setObject:v9 forKeyedSubscript:@"HWStatsType"];

  uint64_t v10 = [(PLBBMavLogMsg *)self bbHwStatsLength];
  [v4 setObject:v10 forKeyedSubscript:@"HwStatsLength"];

  uint64_t v11 = [(PLBBMavLogMsg *)self bbHwStatsLevel];
  [v4 setObject:v11 forKeyedSubscript:@"HwStatsLevel"];

  id v12 = [(PLBBMavLogMsg *)self bbHwCurrTimeStamp];
  [v4 setObject:v12 forKeyedSubscript:@"CurrentTimestamp"];

  uint64_t v13 = [(PLBBMavLogMsg *)self bbHwLastTimeStamp];
  [v4 setObject:v13 forKeyedSubscript:@"LastTimestamp"];

  uint64_t v14 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v4 setObject:v14 forKeyedSubscript:@"LogDuration"];

  uint64_t v15 = [(PLBBMavLogMsg *)self bbHwMsgType];
  [v4 setObject:v15 forKeyedSubscript:@"Type"];

  uint64_t v16 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v17 = [v16 objectForKey:@"BBDate"];
  uint64_t v18 = [v17 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v18];

  uint64_t v19 = [(PLBBMavLogMsg *)self bbHwProcSystemState];
  [v4 setObject:v19 forKeyedSubscript:@"ProcSystemState"];

  uint64_t v20 = [(PLBBMavLogMsg *)self bbHwProcArmPerfState];
  [v4 setObject:v20 forKeyedSubscript:@"ProcArmPerfState"];

  uint64_t v21 = [(PLBBMavLogMsg *)self bbHwModemAppMdspSpeed];
  [v4 setObject:v21 forKeyedSubscript:@"ModemAppMdspSpeed"];

  id v22 = [(PLBBMavLogMsg *)self bbHwModemAppMdmState];
  [v4 setObject:v22 forKeyedSubscript:@"ModemAppMdmState"];

  uint64_t v23 = [(PLBBMavLogMsg *)self bbHwModemAppQdspSpeed];
  [v4 setObject:v23 forKeyedSubscript:@"ModemAppQdspSpeed"];

  uint64_t v24 = [(PLBBMavLogMsg *)self bbHwModemAppAdmState];
  [v4 setObject:v24 forKeyedSubscript:@"ModemAppAdmState"];

  uint64_t v25 = [(PLBBMavLogMsg *)self bbHwPeripheralGPSState];
  [v4 setObject:v25 forKeyedSubscript:@"PeripheralGPSState"];

  unint64_t v26 = [(PLBBMavLogMsg *)self bbHwPeripheralUSBState];
  [v4 setObject:v26 forKeyedSubscript:@"PeripheralUSBState"];

  int v27 = [(PLBBMavLogMsg *)self bbHwPeripheralUARTState];
  [v4 setObject:v27 forKeyedSubscript:@"PeripheralUARTState"];

  uint64_t v28 = [(PLBBMavLogMsg *)self bbHwPeripheralSPIState];
  [v4 setObject:v28 forKeyedSubscript:@"PeripheralSPIState"];

  uint64_t v29 = [(PLBBMavLogMsg *)self bbHwSleepVetoClientListQdsp];
  [v4 setObject:v29 forKeyedSubscript:@"SleepVetoClientListQdsp"];

  id v30 = [(PLBBMavLogMsg *)self bbHwSleepVetoClientListArm];
  [v4 setObject:v30 forKeyedSubscript:@"SleepVetoClientListArm"];
}

- (void)addToGroupPLBBMav4HwOther
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __42__PLBBMavLogMsg_addToGroupPLBBMav4HwOther__block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5ABA0 != -1) {
      dispatch_once(&qword_1EBD5ABA0, &block);
    }
    if (byte_1EBD5AA73)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg addToGroupPLBBMav4HwOther]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addToGroupPLBBMav4HwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:965];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [(PLBBMavLogMsg *)self setGroupEntryKey:v10];
  [(PLBBMavLogMsg *)self populateEntryBBMav4HwOther:v11];
  [(PLBBMavLogMsg *)self addToGroupPLBBMavHwEntry:v11 withEntryKey:v10];
}

uint64_t __42__PLBBMavLogMsg_addToGroupPLBBMav4HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA73 = result;
  return result;
}

- (void)refreshBBMav10HwOther
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __38__PLBBMavLogMsg_refreshBBMav10HwOther__block_invoke;
    uint64_t v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (qword_1EBD5ABA8 != -1) {
      dispatch_once(&qword_1EBD5ABA8, &block);
    }
    if (byte_1EBD5AA74)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshBBMav10HwOther]", block, v11, v12, v13, v14);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshBBMav10HwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:982];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __38__PLBBMavLogMsg_refreshBBMav10HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA74 = result;
  return result;
}

+ (id)entryEventMavBBMav10HwOther
{
  v107[2] = *MEMORY[0x1E4F143B8];
  v106[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v104[0] = *MEMORY[0x1E4F92CD0];
  v104[1] = v2;
  v105[0] = &unk_1F29F13F0;
  v105[1] = @"refreshMavBBHwOther";
  v104[2] = *MEMORY[0x1E4F92CC0];
  v105[2] = MEMORY[0x1E4F1CC38];
  v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:3];
  v107[0] = v70;
  v106[1] = *MEMORY[0x1E4F92CA8];
  v102[0] = @"Error";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_BoolFormat");
  v103[0] = v68;
  v102[1] = @"SeqNum";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v103[1] = v66;
  void v102[2] = @"BBDate";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_DateFormat");
  v103[2] = v64;
  v102[3] = @"TimeCal";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v103[3] = v62;
  v102[4] = @"SWRevision";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v103[4] = v60;
  v102[5] = @"HWRevision";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v103[5] = v58;
  v102[6] = @"HWStatsType";
  uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v103[6] = v56;
  v102[7] = @"HwStatsLength";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v103[7] = v54;
  v102[8] = @"HwStatsLevel";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v103[8] = v52;
  v102[9] = @"LastTimestamp";
  id v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v103[9] = v50;
  v102[10] = @"CurrentTimestamp";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v103[10] = v48;
  v102[11] = @"LogDuration";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v103[11] = v46;
  v102[12] = @"RPMXOShutdownDuration";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v103[12] = v44;
  v102[13] = @"RPMXOShutdownCount";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v103[13] = v42;
  v102[14] = @"RPMVDDMinDuration";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v103[14] = v40;
  v102[15] = @"RPMVDDMinEnterCount";
  id v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v103[15] = v38;
  v102[16] = @"AppsPerfStateCountHistogram";
  uint64_t v4 = *MEMORY[0x1E4F92D00];
  v99[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v99[0];
  v99[1] = v4;
  v101[0] = &unk_1F29E7C48;
  v101[1] = &unk_1F29E7DB0;
  uint64_t v100 = *MEMORY[0x1E4F92D08];
  uint64_t v5 = v100;
  v101[2] = &unk_1F29E7C78;
  int v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v99 count:3];
  v103[16] = v37;
  v102[17] = @"CXOShutdownDuration";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v103[17] = v35;
  v102[18] = @"CXOShutdownCount";
  int v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v103[18] = v33;
  v102[19] = @"USBStateCountHistogram";
  v97[0] = v3;
  v97[1] = v4;
  v98[0] = &unk_1F29E7C48;
  v98[1] = &unk_1F29E7C90;
  v97[2] = v5;
  v98[2] = &unk_1F29E7C78;
  id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:3];
  v103[19] = v32;
  v102[20] = @"UARTOnOffStateHistogram";
  v95[0] = v3;
  v95[1] = v4;
  v96[0] = &unk_1F29E7C48;
  v96[1] = &unk_1F29E7CA8;
  v95[2] = v5;
  v96[2] = &unk_1F29E7C78;
  unint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:3];
  v103[20] = v31;
  v102[21] = @"SPIOnOffStateHistogram";
  v93[0] = v3;
  v93[1] = v4;
  v94[0] = &unk_1F29E7C48;
  v94[1] = &unk_1F29E7CA8;
  v93[2] = v5;
  v94[2] = &unk_1F29E7C78;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:3];
  v103[21] = v30;
  v102[22] = @"ADMOnOffStateHistogram";
  v91[0] = v3;
  v91[1] = v4;
  v92[0] = &unk_1F29E7C48;
  v92[1] = &unk_1F29E7CA8;
  v91[2] = v5;
  v92[2] = &unk_1F29E7C78;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:3];
  v103[22] = v29;
  v102[23] = @"LPASSOnOffStateHistogram";
  v89[0] = v3;
  v89[1] = v4;
  v90[0] = &unk_1F29E7C48;
  v90[1] = &unk_1F29E7CA8;
  v89[2] = v5;
  v90[2] = &unk_1F29E7C78;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:3];
  v103[23] = v28;
  v102[24] = @"APPSSleepVetoState";
  v87[0] = v3;
  v87[1] = v4;
  v88[0] = &unk_1F29E7C48;
  v88[1] = &unk_1F29E7CC0;
  v87[2] = v5;
  v88[2] = &unk_1F29E7C78;
  int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:3];
  v103[24] = v27;
  v102[25] = @"MPSSSleepVetoHistogram";
  v85[0] = v3;
  v85[1] = v4;
  v86[0] = &unk_1F29E7C48;
  v86[1] = &unk_1F29E7C90;
  v85[2] = v5;
  v86[2] = &unk_1F29E7C78;
  unint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:3];
  v103[25] = v26;
  v102[26] = @"QDSPConfigCountHistogram";
  v83[0] = v3;
  v83[1] = v4;
  v84[0] = &unk_1F29E7C48;
  v84[1] = &unk_1F29E7DC8;
  void v83[2] = v5;
  v84[2] = &unk_1F29E7C78;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
  v103[26] = v25;
  v102[27] = @"GPSOnOffStateHistogram";
  v81[0] = v3;
  v81[1] = v4;
  v82[0] = &unk_1F29E7C48;
  v82[1] = &unk_1F29E7CA8;
  v81[2] = v5;
  v82[2] = &unk_1F29E7C78;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  v103[27] = v24;
  v102[28] = @"GPSDPOOnOffStateHistogram";
  v79[0] = v3;
  v79[1] = v4;
  v80[0] = &unk_1F29E7C48;
  v80[1] = &unk_1F29E7CA8;
  v79[2] = v5;
  v80[2] = &unk_1F29E7C78;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v103[28] = v23;
  v102[29] = @"GPSDPOBins";
  v77[0] = v3;
  v77[1] = v4;
  v78[0] = &unk_1F29E7C48;
  v78[1] = &unk_1F29E7C60;
  void v77[2] = v5;
  v78[2] = &unk_1F29E7C78;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];
  v103[29] = v22;
  v102[30] = @"MPSSCXOShutdownDuration";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v103[30] = v20;
  v102[31] = @"MPSSCXOShutdownCount";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v103[31] = v18;
  v102[32] = @"MCPMVetoNumHistogram";
  v75[0] = v3;
  v75[1] = v4;
  v76[0] = &unk_1F29E7C48;
  v76[1] = &unk_1F29E7D68;
  v75[2] = v5;
  void v76[2] = &unk_1F29E7C78;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  v103[32] = v17;
  v102[33] = @"NPAVetoMask";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v103[33] = v15;
  v102[34] = @"NPAVetoClientNumHistogram";
  v73[0] = v3;
  v73[1] = v4;
  v74[0] = &unk_1F29E7C48;
  v74[1] = &unk_1F29E7CF0;
  v73[2] = v5;
  v74[2] = &unk_1F29E7C78;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
  v103[34] = v6;
  v102[35] = @"AppsClockStateDurationStr";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v103[35] = v8;
  v102[36] = @"MpssClockStateDurationStr";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v103[36] = v10;
  v102[37] = @"HsicStateSleepVetoNum";
  v71[0] = v3;
  v71[1] = v4;
  v72[0] = &unk_1F29E7C48;
  v72[1] = &unk_1F29E7D08;
  v71[2] = v5;
  v72[2] = &unk_1F29E7C78;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
  v103[37] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:38];
  v107[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:2];

  return v13;
}

- (void)logEventBackwardMav10BBHwOther
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBMavLogMsg_logEventBackwardMav10BBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5ABB0 != -1) {
      dispatch_once(&qword_1EBD5ABB0, block);
    }
    if (byte_1EBD5AA75)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardMav10BBHwOther]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav10BBHwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1081];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D28];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMavLogMsg *)self populateEntryBBMav10HwOther:v12];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __47__PLBBMavLogMsg_logEventBackwardMav10BBHwOther__block_invoke_569;
    void v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v13;
    if (qword_1EBD5ABB8 != -1) {
      dispatch_once(&qword_1EBD5ABB8, v20);
    }
    if (byte_1EBD5AA76)
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"About to send to log at %s", "-[PLBBMavLogMsg logEventBackwardMav10BBHwOther]");
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav10BBHwOther]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:1087];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBMavLogMsg *)self sendAndLogPLEntry:v12 withName:@"MavBBHwOther" withType:v10];
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav10BBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA75 = result;
  return result;
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav10BBHwOther__block_invoke_569(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA76 = result;
  return result;
}

- (void)addToGroupPLBBMav10HwOther
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __43__PLBBMavLogMsg_addToGroupPLBBMav10HwOther__block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5ABC0 != -1) {
      dispatch_once(&qword_1EBD5ABC0, &block);
    }
    if (byte_1EBD5AA77)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg addToGroupPLBBMav10HwOther]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addToGroupPLBBMav10HwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1096];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [(PLBBMavLogMsg *)self setGroupEntryKey:v10];
  [(PLBBMavLogMsg *)self populateEntryBBMav10HwOther:v11];
  [(PLBBMavLogMsg *)self addToGroupPLBBMavHwEntry:v11 withEntryKey:v10];
}

uint64_t __43__PLBBMavLogMsg_addToGroupPLBBMav10HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA77 = result;
  return result;
}

- (void)populateEntryBBMav10HwOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v6 = [v5 objectForKey:@"BBDate"];
  [v4 setObject:v6 forKeyedSubscript:@"BBDate"];

  id v7 = [(PLBBMavLogMsg *)self commonInfo];
  id v8 = [v7 objectForKey:@"BBDate"];
  id v9 = [v8 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v9];

  uint64_t v10 = [(PLBBMavLogMsg *)self bbSwRev];
  [v4 setObject:v10 forKeyedSubscript:@"SWRevision"];

  uint64_t v11 = [(PLBBMavLogMsg *)self bbHwRev];
  [v4 setObject:v11 forKeyedSubscript:@"HWRevision"];

  id v12 = [(PLBBMavLogMsg *)self bbHwStatsType];
  [v4 setObject:v12 forKeyedSubscript:@"HWStatsType"];

  uint64_t v13 = [(PLBBMavLogMsg *)self bbHwStatsLength];
  [v4 setObject:v13 forKeyedSubscript:@"HwStatsLength"];

  uint64_t v14 = [(PLBBMavLogMsg *)self bbHwStatsLevel];
  [v4 setObject:v14 forKeyedSubscript:@"HwStatsLevel"];

  uint64_t v15 = [(PLBBMavLogMsg *)self bbHwCurrTimeStamp];
  [v4 setObject:v15 forKeyedSubscript:@"CurrentTimestamp"];

  uint64_t v16 = [(PLBBMavLogMsg *)self bbHwLastTimeStamp];
  [v4 setObject:v16 forKeyedSubscript:@"LastTimestamp"];

  uint64_t v17 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v4 setObject:v17 forKeyedSubscript:@"LogDuration"];

  uint64_t v18 = [(PLBBMavLogMsg *)self rpmXOShutDuration];
  [v4 setObject:v18 forKeyedSubscript:@"RPMXOShutdownDuration"];

  uint64_t v19 = [(PLBBMavLogMsg *)self rpmXOShutCnt];
  [v4 setObject:v19 forKeyedSubscript:@"RPMXOShutdownCount"];

  uint64_t v20 = [(PLBBMavLogMsg *)self rpmVDDMinDuration];
  [v4 setObject:v20 forKeyedSubscript:@"RPMVDDMinDuration"];

  uint64_t v21 = [(PLBBMavLogMsg *)self rpmVDDMinEnterCnt];
  [v4 setObject:v21 forKeyedSubscript:@"RPMVDDMinEnterCount"];

  id v22 = [(PLBBMavLogMsg *)self appsPerfStateCountHist];
  [v4 setObject:v22 forKeyedSubscript:@"AppsPerfStateCountHistogram"];

  uint64_t v23 = [(PLBBMavLogMsg *)self cxoShutDownDuration];
  [v4 setObject:v23 forKeyedSubscript:@"CXOShutdownDuration"];

  uint64_t v24 = [(PLBBMavLogMsg *)self cxoShutDownCount];
  [v4 setObject:v24 forKeyedSubscript:@"CXOShutdownCount"];

  uint64_t v25 = [(PLBBMavLogMsg *)self usbStateCountHist];
  [v4 setObject:v25 forKeyedSubscript:@"USBStateCountHistogram"];

  unint64_t v26 = [(PLBBMavLogMsg *)self uartOnOffState];
  [v4 setObject:v26 forKeyedSubscript:@"UARTOnOffStateHistogram"];

  int v27 = [(PLBBMavLogMsg *)self spiOnOffState];
  [v4 setObject:v27 forKeyedSubscript:@"SPIOnOffStateHistogram"];

  uint64_t v28 = [(PLBBMavLogMsg *)self admOnOffState];
  [v4 setObject:v28 forKeyedSubscript:@"ADMOnOffStateHistogram"];

  uint64_t v29 = [(PLBBMavLogMsg *)self lpassOnOffState];
  [v4 setObject:v29 forKeyedSubscript:@"LPASSOnOffStateHistogram"];

  id v30 = [(PLBBMavLogMsg *)self appsSleepVeto];
  [v4 setObject:v30 forKeyedSubscript:@"APPSSleepVetoState"];

  unint64_t v31 = [(PLBBMavLogMsg *)self mpssSleepVeto];
  [v4 setObject:v31 forKeyedSubscript:@"MPSSSleepVetoHistogram"];

  id v32 = [(PLBBMavLogMsg *)self qdspConfigCount];
  [v4 setObject:v32 forKeyedSubscript:@"QDSPConfigCountHistogram"];

  v33 = [(PLBBMavLogMsg *)self gpsOnOff];
  [v4 setObject:v33 forKeyedSubscript:@"GPSOnOffStateHistogram"];

  int v34 = [(PLBBMavLogMsg *)self gpsDPOOnOff];
  [v4 setObject:v34 forKeyedSubscript:@"GPSDPOOnOffStateHistogram"];

  v35 = [(PLBBMavLogMsg *)self gpsDPOBin];
  [v4 setObject:v35 forKeyedSubscript:@"GPSDPOBins"];

  v36 = [(PLBBMavLogMsg *)self mpssCxoShutDownDuration];
  [v4 setObject:v36 forKeyedSubscript:@"MPSSCXOShutdownDuration"];

  int v37 = [(PLBBMavLogMsg *)self mpssCxoShutDownCount];
  [v4 setObject:v37 forKeyedSubscript:@"MPSSCXOShutdownCount"];

  id v38 = [(PLBBMavLogMsg *)self mcpmVetoNumHistogram];
  [v4 setObject:v38 forKeyedSubscript:@"MCPMVetoNumHistogram"];

  id v39 = [(PLBBMavLogMsg *)self npaVetoMask];
  [v4 setObject:v39 forKeyedSubscript:@"NPAVetoMask"];

  v40 = [(PLBBMavLogMsg *)self npaVetoClientNumHistogram];
  [v4 setObject:v40 forKeyedSubscript:@"NPAVetoClientNumHistogram"];

  v41 = [(PLBBMavLogMsg *)self appsClockStateDurationStr];
  [v4 setObject:v41 forKeyedSubscript:@"AppsClockStateDurationStr"];

  uint64_t v42 = [(PLBBMavLogMsg *)self mpssClockStateDurationStr];
  [v4 setObject:v42 forKeyedSubscript:@"MpssClockStateDurationStr"];

  id v43 = [(PLBBMavLogMsg *)self hsicStateSleepVetoNum];
  [v4 setObject:v43 forKeyedSubscript:@"HsicStateSleepVetoNum"];
}

- (void)refreshBBMav13HwOther
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __38__PLBBMavLogMsg_refreshBBMav13HwOther__block_invoke;
    uint64_t v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (qword_1EBD5ABC8 != -1) {
      dispatch_once(&qword_1EBD5ABC8, &block);
    }
    if (byte_1EBD5AA78)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshBBMav13HwOther]", block, v11, v12, v13, v14);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshBBMav13HwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1172];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __38__PLBBMavLogMsg_refreshBBMav13HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA78 = result;
  return result;
}

+ (id)entryEventMavBBMav13HwOther
{
  v95[2] = *MEMORY[0x1E4F143B8];
  v94[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v92[0] = *MEMORY[0x1E4F92CD0];
  v92[1] = v2;
  v93[0] = &unk_1F29F1400;
  v93[1] = @"refreshMavBBHwOther";
  v92[2] = *MEMORY[0x1E4F92CC0];
  v93[2] = MEMORY[0x1E4F1CC38];
  v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:3];
  v95[0] = v66;
  v94[1] = *MEMORY[0x1E4F92CA8];
  v90[0] = @"Error";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_BoolFormat");
  v91[0] = v64;
  v90[1] = @"SeqNum";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v91[1] = v62;
  v90[2] = @"BBDate";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_DateFormat");
  v91[2] = v60;
  void v90[3] = @"TimeCal";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  void v91[3] = v58;
  v90[4] = @"SWRevision";
  uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v91[4] = v56;
  v90[5] = @"HWRevision";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v91[5] = v54;
  v90[6] = @"HWStatsType";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v91[6] = v52;
  v90[7] = @"HwStatsLength";
  id v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v91[7] = v50;
  v90[8] = @"HwStatsLevel";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v91[8] = v48;
  v90[9] = @"LastTimestamp";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v91[9] = v46;
  v90[10] = @"CurrentTimestamp";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v91[10] = v44;
  v90[11] = @"LogDuration";
  id v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v91[11] = v42;
  v90[12] = @"RPMXOShutdownDuration";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v91[12] = v40;
  v90[13] = @"RPMXOShutdownCount";
  id v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v91[13] = v38;
  v90[14] = @"RPMVDDMinDuration";
  int v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v91[14] = v36;
  v90[15] = @"RPMVDDMinEnterCount";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v91[15] = v34;
  v90[16] = @"AppsPerfStateCountHistogram";
  uint64_t v4 = *MEMORY[0x1E4F92D00];
  v87[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v87[0];
  v87[1] = v4;
  v89[0] = &unk_1F29E7C48;
  v89[1] = &unk_1F29E7C60;
  uint64_t v88 = *MEMORY[0x1E4F92D08];
  uint64_t v5 = v88;
  v89[2] = &unk_1F29E7C78;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v87 count:3];
  v91[16] = v33;
  v90[17] = @"CXOShutdownDuration";
  id v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v91[17] = v31;
  v90[18] = @"CXOShutdownCount";
  id v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v91[18] = v29;
  v90[19] = @"LPASSOnOffStateHistogram";
  v85[0] = v3;
  v85[1] = v4;
  v86[0] = &unk_1F29E7C48;
  v86[1] = &unk_1F29E7CA8;
  v85[2] = v5;
  v86[2] = &unk_1F29E7C78;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:3];
  v91[19] = v28;
  v90[20] = @"APPSSleepVetoState";
  v83[0] = v3;
  v83[1] = v4;
  v84[0] = &unk_1F29E7C48;
  v84[1] = &unk_1F29E7DB0;
  void v83[2] = v5;
  v84[2] = &unk_1F29E7C78;
  int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
  v91[20] = v27;
  v90[21] = @"MPSSSleepVetoHistogram";
  v81[0] = v3;
  v81[1] = v4;
  v82[0] = &unk_1F29E7C48;
  v82[1] = &unk_1F29E7DE0;
  v81[2] = v5;
  v82[2] = &unk_1F29E7C78;
  unint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  v91[21] = v26;
  v90[22] = @"QDSPConfigCountHistogram";
  v79[0] = v3;
  v79[1] = v4;
  v80[0] = &unk_1F29E7C48;
  v80[1] = &unk_1F29E7D68;
  v79[2] = v5;
  v80[2] = &unk_1F29E7C78;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v91[22] = v25;
  v90[23] = @"GPSOnOffStateHistogram";
  v77[0] = v3;
  v77[1] = v4;
  v78[0] = &unk_1F29E7C48;
  v78[1] = &unk_1F29E7CA8;
  void v77[2] = v5;
  v78[2] = &unk_1F29E7C78;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];
  v91[23] = v24;
  v90[24] = @"GPSDPOOnOffStateHistogram";
  v75[0] = v3;
  v75[1] = v4;
  v76[0] = &unk_1F29E7C48;
  v76[1] = &unk_1F29E7CA8;
  v75[2] = v5;
  void v76[2] = &unk_1F29E7C78;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  v91[24] = v23;
  v90[25] = @"GPSDPOBins";
  v73[0] = v3;
  v73[1] = v4;
  v74[0] = &unk_1F29E7C48;
  v74[1] = &unk_1F29E7C60;
  v73[2] = v5;
  v74[2] = &unk_1F29E7C78;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
  v91[25] = v22;
  v90[26] = @"MPSSCXOShutdownDuration";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v91[26] = v20;
  v90[27] = @"MPSSCXOShutdownCount";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v91[27] = v18;
  v90[28] = @"MCPMVetoNumHistogram";
  v71[0] = v3;
  v71[1] = v4;
  v72[0] = &unk_1F29E7C48;
  v72[1] = &unk_1F29E7D68;
  v71[2] = v5;
  v72[2] = &unk_1F29E7C78;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
  v91[28] = v17;
  v90[29] = @"NPAVetoMask";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v91[29] = v15;
  v90[30] = @"NPAVetoClientNumHistogram";
  v69[0] = v3;
  v69[1] = v4;
  v70[0] = &unk_1F29E7C48;
  v70[1] = &unk_1F29E7CF0;
  v69[2] = v5;
  void v70[2] = &unk_1F29E7C78;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:3];
  v91[30] = v6;
  v90[31] = @"AppsClockStateDurationStr";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v91[31] = v8;
  v90[32] = @"MpssClockStateDurationStr";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v91[32] = v10;
  v90[33] = @"PCIEStateHistogram";
  v67[0] = v3;
  v67[1] = v4;
  v68[0] = &unk_1F29E7C48;
  v68[1] = &unk_1F29E7C90;
  v67[2] = v5;
  v68[2] = &unk_1F29E7C78;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
  v91[33] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:34];
  v95[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];

  return v13;
}

- (void)logEventBackwardMav13BBHwOther
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBMavLogMsg_logEventBackwardMav13BBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5ABD0 != -1) {
      dispatch_once(&qword_1EBD5ABD0, block);
    }
    if (byte_1EBD5AA79)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardMav13BBHwOther]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav13BBHwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1247];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D28];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMavLogMsg *)self populateEntryBBMav13HwOther:v12];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __47__PLBBMavLogMsg_logEventBackwardMav13BBHwOther__block_invoke_576;
    void v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v13;
    if (qword_1EBD5ABD8 != -1) {
      dispatch_once(&qword_1EBD5ABD8, v20);
    }
    if (byte_1EBD5AA7A)
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"About to send to log at %s", "-[PLBBMavLogMsg logEventBackwardMav13BBHwOther]");
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav13BBHwOther]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:1253];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBMavLogMsg *)self sendAndLogPLEntry:v12 withName:@"MavBBHwOther" withType:v10];
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav13BBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA79 = result;
  return result;
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav13BBHwOther__block_invoke_576(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA7A = result;
  return result;
}

- (void)addToGroupPLBBMav13HwOther
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __43__PLBBMavLogMsg_addToGroupPLBBMav13HwOther__block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5ABE0 != -1) {
      dispatch_once(&qword_1EBD5ABE0, &block);
    }
    if (byte_1EBD5AA7B)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg addToGroupPLBBMav13HwOther]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addToGroupPLBBMav13HwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1262];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [(PLBBMavLogMsg *)self setGroupEntryKey:v10];
  [(PLBBMavLogMsg *)self populateEntryBBMav13HwOther:v11];
  [(PLBBMavLogMsg *)self addToGroupPLBBMavHwEntry:v11 withEntryKey:v10];
}

uint64_t __43__PLBBMavLogMsg_addToGroupPLBBMav13HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA7B = result;
  return result;
}

- (void)populateEntryBBMav13HwOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v6 = [v5 objectForKey:@"BBDate"];
  [v4 setObject:v6 forKeyedSubscript:@"BBDate"];

  id v7 = [(PLBBMavLogMsg *)self commonInfo];
  id v8 = [v7 objectForKey:@"BBDate"];
  id v9 = [v8 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v9];

  uint64_t v10 = [(PLBBMavLogMsg *)self bbSwRev];
  [v4 setObject:v10 forKeyedSubscript:@"SWRevision"];

  uint64_t v11 = [(PLBBMavLogMsg *)self bbHwRev];
  [v4 setObject:v11 forKeyedSubscript:@"HWRevision"];

  id v12 = [(PLBBMavLogMsg *)self bbHwStatsType];
  [v4 setObject:v12 forKeyedSubscript:@"HWStatsType"];

  uint64_t v13 = [(PLBBMavLogMsg *)self bbHwStatsLength];
  [v4 setObject:v13 forKeyedSubscript:@"HwStatsLength"];

  uint64_t v14 = [(PLBBMavLogMsg *)self bbHwStatsLevel];
  [v4 setObject:v14 forKeyedSubscript:@"HwStatsLevel"];

  uint64_t v15 = [(PLBBMavLogMsg *)self bbHwCurrTimeStamp];
  [v4 setObject:v15 forKeyedSubscript:@"CurrentTimestamp"];

  uint64_t v16 = [(PLBBMavLogMsg *)self bbHwLastTimeStamp];
  [v4 setObject:v16 forKeyedSubscript:@"LastTimestamp"];

  uint64_t v17 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v4 setObject:v17 forKeyedSubscript:@"LogDuration"];

  uint64_t v18 = [(PLBBMavLogMsg *)self rpmXOShutDuration];
  [v4 setObject:v18 forKeyedSubscript:@"RPMXOShutdownDuration"];

  uint64_t v19 = [(PLBBMavLogMsg *)self rpmXOShutCnt];
  [v4 setObject:v19 forKeyedSubscript:@"RPMXOShutdownCount"];

  uint64_t v20 = [(PLBBMavLogMsg *)self rpmVDDMinDuration];
  [v4 setObject:v20 forKeyedSubscript:@"RPMVDDMinDuration"];

  uint64_t v21 = [(PLBBMavLogMsg *)self rpmVDDMinEnterCnt];
  [v4 setObject:v21 forKeyedSubscript:@"RPMVDDMinEnterCount"];

  id v22 = [(PLBBMavLogMsg *)self appsPerfStateCountHist];
  [v4 setObject:v22 forKeyedSubscript:@"AppsPerfStateCountHistogram"];

  uint64_t v23 = [(PLBBMavLogMsg *)self cxoShutDownDuration];
  [v4 setObject:v23 forKeyedSubscript:@"CXOShutdownDuration"];

  uint64_t v24 = [(PLBBMavLogMsg *)self cxoShutDownCount];
  [v4 setObject:v24 forKeyedSubscript:@"CXOShutdownCount"];

  uint64_t v25 = [(PLBBMavLogMsg *)self lpassOnOffState];
  [v4 setObject:v25 forKeyedSubscript:@"LPASSOnOffStateHistogram"];

  unint64_t v26 = [(PLBBMavLogMsg *)self appsSleepVeto];
  [v4 setObject:v26 forKeyedSubscript:@"APPSSleepVetoState"];

  int v27 = [(PLBBMavLogMsg *)self mpssSleepVeto];
  [v4 setObject:v27 forKeyedSubscript:@"MPSSSleepVetoHistogram"];

  uint64_t v28 = [(PLBBMavLogMsg *)self qdspConfigCount];
  [v4 setObject:v28 forKeyedSubscript:@"QDSPConfigCountHistogram"];

  uint64_t v29 = [(PLBBMavLogMsg *)self gpsOnOff];
  [v4 setObject:v29 forKeyedSubscript:@"GPSOnOffStateHistogram"];

  id v30 = [(PLBBMavLogMsg *)self gpsDPOOnOff];
  [v4 setObject:v30 forKeyedSubscript:@"GPSDPOOnOffStateHistogram"];

  unint64_t v31 = [(PLBBMavLogMsg *)self gpsDPOBin];
  [v4 setObject:v31 forKeyedSubscript:@"GPSDPOBins"];

  id v32 = [(PLBBMavLogMsg *)self mpssCxoShutDownDuration];
  [v4 setObject:v32 forKeyedSubscript:@"MPSSCXOShutdownDuration"];

  v33 = [(PLBBMavLogMsg *)self mpssCxoShutDownCount];
  [v4 setObject:v33 forKeyedSubscript:@"MPSSCXOShutdownCount"];

  int v34 = [(PLBBMavLogMsg *)self mcpmVetoNumHistogram];
  [v4 setObject:v34 forKeyedSubscript:@"MCPMVetoNumHistogram"];

  id v35 = [(PLBBMavLogMsg *)self pcieStateHistogram];
  [v4 setObject:v35 forKeyedSubscript:@"PCIEStateHistogram"];
}

- (void)refreshBBMav16HwOther
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __38__PLBBMavLogMsg_refreshBBMav16HwOther__block_invoke;
    uint64_t v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (qword_1EBD5ABE8 != -1) {
      dispatch_once(&qword_1EBD5ABE8, &block);
    }
    if (byte_1EBD5AA7C)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshBBMav16HwOther]", block, v11, v12, v13, v14);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshBBMav16HwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1329];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __38__PLBBMavLogMsg_refreshBBMav16HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA7C = result;
  return result;
}

+ (id)entryEventMavBBMav16HwOther
{
  v95[2] = *MEMORY[0x1E4F143B8];
  v94[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v92[0] = *MEMORY[0x1E4F92CD0];
  v92[1] = v2;
  v93[0] = &unk_1F29E7D68;
  v93[1] = @"refreshMavBBHwOther";
  v92[2] = *MEMORY[0x1E4F92CC0];
  v93[2] = MEMORY[0x1E4F1CC38];
  v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:3];
  v95[0] = v66;
  v94[1] = *MEMORY[0x1E4F92CA8];
  v90[0] = @"Error";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_BoolFormat");
  v91[0] = v64;
  v90[1] = @"SeqNum";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v91[1] = v62;
  v90[2] = @"BBDate";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_DateFormat");
  v91[2] = v60;
  void v90[3] = @"TimeCal";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  void v91[3] = v58;
  v90[4] = @"SWRevision";
  uint64_t v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v91[4] = v56;
  v90[5] = @"HWRevision";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v91[5] = v54;
  v90[6] = @"HWStatsType";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v91[6] = v52;
  v90[7] = @"HwStatsLength";
  id v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v91[7] = v50;
  v90[8] = @"HwStatsLevel";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v91[8] = v48;
  v90[9] = @"LastTimestamp";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v91[9] = v46;
  v90[10] = @"CurrentTimestamp";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v91[10] = v44;
  v90[11] = @"LogDuration";
  id v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v91[11] = v42;
  v90[12] = @"RPMXOShutdownDuration";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v91[12] = v40;
  v90[13] = @"RPMXOShutdownCount";
  id v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v91[13] = v38;
  v90[14] = @"RPMVDDMinDuration";
  int v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v91[14] = v36;
  v90[15] = @"RPMVDDMinEnterCount";
  id v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v91[15] = v34;
  v90[16] = @"AppsPerfStateCountHistogram";
  uint64_t v4 = *MEMORY[0x1E4F92D00];
  v87[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v87[0];
  v87[1] = v4;
  v89[0] = &unk_1F29E7C48;
  v89[1] = &unk_1F29E7D98;
  uint64_t v88 = *MEMORY[0x1E4F92D08];
  uint64_t v5 = v88;
  v89[2] = &unk_1F29E7C78;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v87 count:3];
  v91[16] = v33;
  v90[17] = @"CXOShutdownDuration";
  id v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v91[17] = v31;
  v90[18] = @"CXOShutdownCount";
  id v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v91[18] = v29;
  v90[19] = @"LPASSOnOffStateHistogram";
  v85[0] = v3;
  v85[1] = v4;
  v86[0] = &unk_1F29E7C48;
  v86[1] = &unk_1F29E7CA8;
  v85[2] = v5;
  v86[2] = &unk_1F29E7C78;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:3];
  v91[19] = v28;
  v90[20] = @"APPSSleepVetoState";
  v83[0] = v3;
  v83[1] = v4;
  v84[0] = &unk_1F29E7C48;
  v84[1] = &unk_1F29E7D20;
  void v83[2] = v5;
  v84[2] = &unk_1F29E7C78;
  int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
  v91[20] = v27;
  v90[21] = @"MPSSSleepVetoHistogram";
  v81[0] = v3;
  v81[1] = v4;
  v82[0] = &unk_1F29E7C48;
  v82[1] = &unk_1F29E7DF8;
  v81[2] = v5;
  v82[2] = &unk_1F29E7C78;
  unint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  v91[21] = v26;
  v90[22] = @"QDSPConfigCountHistogram";
  v79[0] = v3;
  v79[1] = v4;
  v80[0] = &unk_1F29E7C48;
  v80[1] = &unk_1F29E7D80;
  v79[2] = v5;
  v80[2] = &unk_1F29E7C78;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v91[22] = v25;
  v90[23] = @"GPSOnOffStateHistogram";
  v77[0] = v3;
  v77[1] = v4;
  v78[0] = &unk_1F29E7C48;
  v78[1] = &unk_1F29E7CA8;
  void v77[2] = v5;
  v78[2] = &unk_1F29E7C78;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];
  v91[23] = v24;
  v90[24] = @"GPSDPOOnOffStateHistogram";
  v75[0] = v3;
  v75[1] = v4;
  v76[0] = &unk_1F29E7C48;
  v76[1] = &unk_1F29E7CA8;
  v75[2] = v5;
  void v76[2] = &unk_1F29E7C78;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  v91[24] = v23;
  v90[25] = @"GPSDPOBins";
  v73[0] = v3;
  v73[1] = v4;
  v74[0] = &unk_1F29E7C48;
  v74[1] = &unk_1F29E7C60;
  v73[2] = v5;
  v74[2] = &unk_1F29E7C78;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
  v91[25] = v22;
  v90[26] = @"MPSSCXOShutdownDuration";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v91[26] = v20;
  v90[27] = @"MPSSCXOShutdownCount";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v91[27] = v18;
  v90[28] = @"MCPMVetoNumHistogram";
  v71[0] = v3;
  v71[1] = v4;
  v72[0] = &unk_1F29E7C48;
  v72[1] = &unk_1F29E7D38;
  v71[2] = v5;
  v72[2] = &unk_1F29E7C78;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
  v91[28] = v17;
  v90[29] = @"NPAVetoMask";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v91[29] = v15;
  v90[30] = @"NPAVetoClientNumHistogram";
  v69[0] = v3;
  v69[1] = v4;
  v70[0] = &unk_1F29E7C48;
  v70[1] = &unk_1F29E7CF0;
  v69[2] = v5;
  void v70[2] = &unk_1F29E7C78;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:3];
  v91[30] = v6;
  v90[31] = @"AppsClockStateDurationStr";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v91[31] = v8;
  v90[32] = @"MpssClockStateDurationStr";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v91[32] = v10;
  v90[33] = @"PCIEStateHistogram";
  v67[0] = v3;
  v67[1] = v4;
  v68[0] = &unk_1F29E7C48;
  v68[1] = &unk_1F29E7C90;
  v67[2] = v5;
  v68[2] = &unk_1F29E7C78;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
  v91[33] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:34];
  v95[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];

  return v13;
}

- (void)logEventBackwardMav16BBHwOther
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBMavLogMsg_logEventBackwardMav16BBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5ABF0 != -1) {
      dispatch_once(&qword_1EBD5ABF0, block);
    }
    if (byte_1EBD5AA7D)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardMav16BBHwOther]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav16BBHwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1405];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D28];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMavLogMsg *)self populateEntryBBMav16HwOther:v12];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __47__PLBBMavLogMsg_logEventBackwardMav16BBHwOther__block_invoke_581;
    void v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v13;
    if (qword_1EBD5ABF8 != -1) {
      dispatch_once(&qword_1EBD5ABF8, v20);
    }
    if (byte_1EBD5AA7E)
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"About to send to log at %s", "-[PLBBMavLogMsg logEventBackwardMav16BBHwOther]");
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav16BBHwOther]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:1411];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBMavLogMsg *)self sendAndLogPLEntry:v12 withName:@"MavBBHwOther" withType:v10];
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav16BBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA7D = result;
  return result;
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav16BBHwOther__block_invoke_581(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA7E = result;
  return result;
}

- (void)addToGroupPLBBMav16HwOther
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __43__PLBBMavLogMsg_addToGroupPLBBMav16HwOther__block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5AC00 != -1) {
      dispatch_once(&qword_1EBD5AC00, &block);
    }
    if (byte_1EBD5AA7F)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg addToGroupPLBBMav16HwOther]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addToGroupPLBBMav16HwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1420];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [(PLBBMavLogMsg *)self setGroupEntryKey:v10];
  [(PLBBMavLogMsg *)self populateEntryBBMav16HwOther:v11];
  [(PLBBMavLogMsg *)self addToGroupPLBBMavHwEntry:v11 withEntryKey:v10];
}

uint64_t __43__PLBBMavLogMsg_addToGroupPLBBMav16HwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA7F = result;
  return result;
}

- (void)populateEntryBBMav16HwOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v6 = [v5 objectForKey:@"BBDate"];
  [v4 setObject:v6 forKeyedSubscript:@"BBDate"];

  id v7 = [(PLBBMavLogMsg *)self commonInfo];
  id v8 = [v7 objectForKey:@"BBDate"];
  id v9 = [v8 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v9];

  uint64_t v10 = [(PLBBMavLogMsg *)self bbSwRev];
  [v4 setObject:v10 forKeyedSubscript:@"SWRevision"];

  uint64_t v11 = [(PLBBMavLogMsg *)self bbHwRev];
  [v4 setObject:v11 forKeyedSubscript:@"HWRevision"];

  id v12 = [(PLBBMavLogMsg *)self bbHwStatsType];
  [v4 setObject:v12 forKeyedSubscript:@"HWStatsType"];

  uint64_t v13 = [(PLBBMavLogMsg *)self bbHwStatsLength];
  [v4 setObject:v13 forKeyedSubscript:@"HwStatsLength"];

  uint64_t v14 = [(PLBBMavLogMsg *)self bbHwStatsLevel];
  [v4 setObject:v14 forKeyedSubscript:@"HwStatsLevel"];

  uint64_t v15 = [(PLBBMavLogMsg *)self bbHwCurrTimeStamp];
  [v4 setObject:v15 forKeyedSubscript:@"CurrentTimestamp"];

  uint64_t v16 = [(PLBBMavLogMsg *)self bbHwLastTimeStamp];
  [v4 setObject:v16 forKeyedSubscript:@"LastTimestamp"];

  uint64_t v17 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v4 setObject:v17 forKeyedSubscript:@"LogDuration"];

  uint64_t v18 = [(PLBBMavLogMsg *)self rpmXOShutDuration];
  [v4 setObject:v18 forKeyedSubscript:@"RPMXOShutdownDuration"];

  uint64_t v19 = [(PLBBMavLogMsg *)self rpmXOShutCnt];
  [v4 setObject:v19 forKeyedSubscript:@"RPMXOShutdownCount"];

  uint64_t v20 = [(PLBBMavLogMsg *)self rpmVDDMinDuration];
  [v4 setObject:v20 forKeyedSubscript:@"RPMVDDMinDuration"];

  uint64_t v21 = [(PLBBMavLogMsg *)self rpmVDDMinEnterCnt];
  [v4 setObject:v21 forKeyedSubscript:@"RPMVDDMinEnterCount"];

  id v22 = [(PLBBMavLogMsg *)self appsPerfStateCountHist];
  [v4 setObject:v22 forKeyedSubscript:@"AppsPerfStateCountHistogram"];

  uint64_t v23 = [(PLBBMavLogMsg *)self cxoShutDownDuration];
  [v4 setObject:v23 forKeyedSubscript:@"CXOShutdownDuration"];

  uint64_t v24 = [(PLBBMavLogMsg *)self cxoShutDownCount];
  [v4 setObject:v24 forKeyedSubscript:@"CXOShutdownCount"];

  uint64_t v25 = [(PLBBMavLogMsg *)self lpassOnOffState];
  [v4 setObject:v25 forKeyedSubscript:@"LPASSOnOffStateHistogram"];

  unint64_t v26 = [(PLBBMavLogMsg *)self appsSleepVeto];
  [v4 setObject:v26 forKeyedSubscript:@"APPSSleepVetoState"];

  int v27 = [(PLBBMavLogMsg *)self mpssSleepVeto];
  [v4 setObject:v27 forKeyedSubscript:@"MPSSSleepVetoHistogram"];

  uint64_t v28 = [(PLBBMavLogMsg *)self qdspConfigCount];
  [v4 setObject:v28 forKeyedSubscript:@"QDSPConfigCountHistogram"];

  uint64_t v29 = [(PLBBMavLogMsg *)self gpsOnOff];
  [v4 setObject:v29 forKeyedSubscript:@"GPSOnOffStateHistogram"];

  id v30 = [(PLBBMavLogMsg *)self gpsDPOOnOff];
  [v4 setObject:v30 forKeyedSubscript:@"GPSDPOOnOffStateHistogram"];

  unint64_t v31 = [(PLBBMavLogMsg *)self gpsDPOBin];
  [v4 setObject:v31 forKeyedSubscript:@"GPSDPOBins"];

  id v32 = [(PLBBMavLogMsg *)self mpssCxoShutDownDuration];
  [v4 setObject:v32 forKeyedSubscript:@"MPSSCXOShutdownDuration"];

  v33 = [(PLBBMavLogMsg *)self mpssCxoShutDownCount];
  [v4 setObject:v33 forKeyedSubscript:@"MPSSCXOShutdownCount"];

  int v34 = [(PLBBMavLogMsg *)self mcpmVetoNumHistogram];
  [v4 setObject:v34 forKeyedSubscript:@"MCPMVetoNumHistogram"];

  id v35 = [(PLBBMavLogMsg *)self pcieStateHistogram];
  [v4 setObject:v35 forKeyedSubscript:@"PCIEStateHistogram"];
}

- (void)refreshBBMav16BHwOther
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __39__PLBBMavLogMsg_refreshBBMav16BHwOther__block_invoke;
    uint64_t v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (qword_1EBD5AC08 != -1) {
      dispatch_once(&qword_1EBD5AC08, &block);
    }
    if (byte_1EBD5AA80)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg refreshBBMav16BHwOther]", block, v11, v12, v13, v14);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg refreshBBMav16BHwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1487];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __39__PLBBMavLogMsg_refreshBBMav16BHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA80 = result;
  return result;
}

+ (id)entryEventMavBBMav16BHwOther
{
  v98[2] = *MEMORY[0x1E4F143B8];
  v97[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v95[0] = *MEMORY[0x1E4F92CD0];
  v95[1] = v2;
  v96[0] = &unk_1F29E7D38;
  v96[1] = @"refreshMavBBHwOther";
  v95[2] = *MEMORY[0x1E4F92CC0];
  v96[2] = MEMORY[0x1E4F1CC38];
  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:3];
  v98[0] = v67;
  v97[1] = *MEMORY[0x1E4F92CA8];
  v93[0] = @"Error";
  v66 = [MEMORY[0x1E4F929D8] sharedInstance];
  v65 = objc_msgSend(v66, "commonTypeDict_BoolFormat");
  v94[0] = v65;
  v93[1] = @"SeqNum";
  v64 = [MEMORY[0x1E4F929D8] sharedInstance];
  v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
  v94[1] = v63;
  v93[2] = @"BBDate";
  v62 = [MEMORY[0x1E4F929D8] sharedInstance];
  v61 = objc_msgSend(v62, "commonTypeDict_DateFormat");
  void v94[2] = v61;
  void v93[3] = @"TimeCal";
  v60 = [MEMORY[0x1E4F929D8] sharedInstance];
  v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
  void v94[3] = v59;
  v93[4] = @"SWRevision";
  v58 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
  v94[4] = v57;
  v93[5] = @"HWRevision";
  v56 = [MEMORY[0x1E4F929D8] sharedInstance];
  v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
  v94[5] = v55;
  v93[6] = @"HWStatsType";
  v54 = [MEMORY[0x1E4F929D8] sharedInstance];
  v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
  v94[6] = v53;
  v93[7] = @"HwStatsLength";
  v52 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v94[7] = v51;
  v93[8] = @"HwStatsLevel";
  id v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v94[8] = v49;
  v93[9] = @"LastTimestamp";
  v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v94[9] = v47;
  v93[10] = @"CurrentTimestamp";
  v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v94[10] = v45;
  v93[11] = @"LogDuration";
  id v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v94[11] = v43;
  v93[12] = @"RPMXOShutdownDuration";
  uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v94[12] = v41;
  v93[13] = @"RPMXOShutdownCount";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v94[13] = v39;
  v93[14] = @"RPMVDDMinDuration";
  id v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v94[14] = v37;
  v93[15] = @"RPMVDDMinEnterCount";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v94[15] = v35;
  v93[16] = @"AppsPerfStateCountHistogram";
  uint64_t v4 = *MEMORY[0x1E4F92D00];
  v90[0] = *MEMORY[0x1E4F92D10];
  uint64_t v3 = v90[0];
  v90[1] = v4;
  v92[0] = &unk_1F29E7C48;
  v92[1] = &unk_1F29E7D08;
  uint64_t v91 = *MEMORY[0x1E4F92D08];
  uint64_t v5 = v91;
  v92[2] = &unk_1F29E7C78;
  int v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v90 count:3];
  v94[16] = v34;
  v93[17] = @"CXOShutdownDuration";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v94[17] = v32;
  v93[18] = @"CXOShutdownCount";
  unint64_t v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v94[18] = v30;
  v93[19] = @"LPASSOnOffStateHistogram";
  v88[0] = v3;
  v88[1] = v4;
  v89[0] = &unk_1F29E7C48;
  v89[1] = &unk_1F29E7CA8;
  v88[2] = v5;
  v89[2] = &unk_1F29E7C78;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:3];
  v94[19] = v29;
  v93[20] = @"APPSSleepVetoState";
  v86[0] = v3;
  v86[1] = v4;
  v87[0] = &unk_1F29E7C48;
  v87[1] = &unk_1F29E7D20;
  v86[2] = v5;
  void v87[2] = &unk_1F29E7C78;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:3];
  v94[20] = v28;
  v93[21] = @"MPSSSleepVetoHistogram";
  v84[0] = v3;
  v84[1] = v4;
  v85[0] = &unk_1F29E7C48;
  v85[1] = &unk_1F29E7DF8;
  v84[2] = v5;
  v85[2] = &unk_1F29E7C78;
  int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:3];
  v94[21] = v27;
  v93[22] = @"QDSPConfigCountHistogram";
  v82[0] = v3;
  v82[1] = v4;
  v83[0] = &unk_1F29E7C48;
  v83[1] = &unk_1F29E7D80;
  v82[2] = v5;
  void v83[2] = &unk_1F29E7C78;
  unint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:3];
  v94[22] = v26;
  v93[23] = @"GPSOnOffStateHistogram";
  v80[0] = v3;
  v80[1] = v4;
  v81[0] = &unk_1F29E7C48;
  v81[1] = &unk_1F29E7CA8;
  v80[2] = v5;
  v81[2] = &unk_1F29E7C78;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];
  v94[23] = v25;
  v93[24] = @"GPSDPOOnOffStateHistogram";
  v78[0] = v3;
  v78[1] = v4;
  v79[0] = &unk_1F29E7C48;
  v79[1] = &unk_1F29E7CA8;
  v78[2] = v5;
  v79[2] = &unk_1F29E7C78;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:3];
  v94[24] = v24;
  v93[25] = @"GPSDPOBins";
  v76[0] = v3;
  v76[1] = v4;
  v77[0] = &unk_1F29E7C48;
  v77[1] = &unk_1F29E7C60;
  void v76[2] = v5;
  void v77[2] = &unk_1F29E7C78;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:3];
  v94[25] = v23;
  v93[26] = @"MPSSCXOShutdownDuration";
  id v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v94[26] = v21;
  v93[27] = @"MPSSCXOShutdownCount";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v94[27] = v19;
  v93[28] = @"MCPMVetoNumHistogram";
  v74[0] = v3;
  v74[1] = v4;
  v75[0] = &unk_1F29E7C48;
  v75[1] = &unk_1F29E7E10;
  v74[2] = v5;
  v75[2] = &unk_1F29E7C78;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];
  v94[28] = v18;
  v93[29] = @"ProtocolActivityHistogram";
  v72[0] = v3;
  v72[1] = v4;
  v73[0] = &unk_1F29E7C48;
  v73[1] = &unk_1F29E7C60;
  v72[2] = v5;
  v73[2] = &unk_1F29E7C78;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:3];
  v94[29] = v17;
  v93[30] = @"NPAVetoMask";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v94[30] = v15;
  v93[31] = @"NPAVetoClientNumHistogram";
  v70[0] = v3;
  v70[1] = v4;
  v71[0] = &unk_1F29E7C48;
  v71[1] = &unk_1F29E7CF0;
  void v70[2] = v5;
  v71[2] = &unk_1F29E7C78;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:3];
  v94[31] = v6;
  v93[32] = @"AppsClockStateDurationStr";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v94[32] = v8;
  v93[33] = @"MpssClockStateDurationStr";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v94[33] = v10;
  v93[34] = @"PCIEStateHistogram";
  v68[0] = v3;
  v68[1] = v4;
  v69[0] = &unk_1F29E7C48;
  v69[1] = &unk_1F29E7C90;
  v68[2] = v5;
  v69[2] = &unk_1F29E7C78;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
  v94[34] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:35];
  v98[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];

  return v13;
}

- (void)logEventBackwardMav16BBBHwOther
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLBBMavLogMsg_logEventBackwardMav16BBBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AC10 != -1) {
      dispatch_once(&qword_1EBD5AC10, block);
    }
    if (byte_1EBD5AA81)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg logEventBackwardMav16BBBHwOther]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav16BBBHwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1566];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D28];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMavLogMsg *)self populateEntryBBMav16BHwOther:v12];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __48__PLBBMavLogMsg_logEventBackwardMav16BBBHwOther__block_invoke_589;
    void v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v13;
    if (qword_1EBD5AC18 != -1) {
      dispatch_once(&qword_1EBD5AC18, v20);
    }
    if (byte_1EBD5AA82)
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"About to send to log at %s", "-[PLBBMavLogMsg logEventBackwardMav16BBBHwOther]");
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg logEventBackwardMav16BBBHwOther]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:1572];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBMavLogMsg *)self sendAndLogPLEntry:v12 withName:@"MavBBHwOther" withType:v10];
}

uint64_t __48__PLBBMavLogMsg_logEventBackwardMav16BBBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA81 = result;
  return result;
}

uint64_t __48__PLBBMavLogMsg_logEventBackwardMav16BBBHwOther__block_invoke_589(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA82 = result;
  return result;
}

- (void)addToGroupPLBBMav16BHwOther
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __44__PLBBMavLogMsg_addToGroupPLBBMav16BHwOther__block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5AC20 != -1) {
      dispatch_once(&qword_1EBD5AC20, &block);
    }
    if (byte_1EBD5AA83)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavLogMsg addToGroupPLBBMav16BHwOther]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBMavLogMsg addToGroupPLBBMav16BHwOther]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1581];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MavBBHwOther"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [(PLBBMavLogMsg *)self setGroupEntryKey:v10];
  [(PLBBMavLogMsg *)self populateEntryBBMav16BHwOther:v11];
  [(PLBBMavLogMsg *)self addToGroupPLBBMavHwEntry:v11 withEntryKey:v10];
}

uint64_t __44__PLBBMavLogMsg_addToGroupPLBBMav16BHwOther__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA83 = result;
  return result;
}

- (void)populateEntryBBMav16BHwOther:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBMavLogMsg *)self commonInfo];
  uint64_t v6 = [v5 objectForKey:@"BBDate"];
  [v4 setObject:v6 forKeyedSubscript:@"BBDate"];

  id v7 = [(PLBBMavLogMsg *)self commonInfo];
  id v8 = [v7 objectForKey:@"BBDate"];
  id v9 = [v8 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v9];

  uint64_t v10 = [(PLBBMavLogMsg *)self bbSwRev];
  [v4 setObject:v10 forKeyedSubscript:@"SWRevision"];

  uint64_t v11 = [(PLBBMavLogMsg *)self bbHwRev];
  [v4 setObject:v11 forKeyedSubscript:@"HWRevision"];

  id v12 = [(PLBBMavLogMsg *)self bbHwStatsType];
  [v4 setObject:v12 forKeyedSubscript:@"HWStatsType"];

  uint64_t v13 = [(PLBBMavLogMsg *)self bbHwStatsLength];
  [v4 setObject:v13 forKeyedSubscript:@"HwStatsLength"];

  uint64_t v14 = [(PLBBMavLogMsg *)self bbHwStatsLevel];
  [v4 setObject:v14 forKeyedSubscript:@"HwStatsLevel"];

  uint64_t v15 = [(PLBBMavLogMsg *)self bbHwCurrTimeStamp];
  [v4 setObject:v15 forKeyedSubscript:@"CurrentTimestamp"];

  uint64_t v16 = [(PLBBMavLogMsg *)self bbHwLastTimeStamp];
  [v4 setObject:v16 forKeyedSubscript:@"LastTimestamp"];

  uint64_t v17 = [(PLBBMavLogMsg *)self bbHwLogDurationInTicks];
  [v4 setObject:v17 forKeyedSubscript:@"LogDuration"];

  uint64_t v18 = [(PLBBMavLogMsg *)self rpmXOShutDuration];
  [v4 setObject:v18 forKeyedSubscript:@"RPMXOShutdownDuration"];

  uint64_t v19 = [(PLBBMavLogMsg *)self rpmXOShutCnt];
  [v4 setObject:v19 forKeyedSubscript:@"RPMXOShutdownCount"];

  uint64_t v20 = [(PLBBMavLogMsg *)self rpmVDDMinDuration];
  [v4 setObject:v20 forKeyedSubscript:@"RPMVDDMinDuration"];

  uint64_t v21 = [(PLBBMavLogMsg *)self rpmVDDMinEnterCnt];
  [v4 setObject:v21 forKeyedSubscript:@"RPMVDDMinEnterCount"];

  id v22 = [(PLBBMavLogMsg *)self appsPerfStateCountHist];
  [v4 setObject:v22 forKeyedSubscript:@"AppsPerfStateCountHistogram"];

  uint64_t v23 = [(PLBBMavLogMsg *)self cxoShutDownDuration];
  [v4 setObject:v23 forKeyedSubscript:@"CXOShutdownDuration"];

  uint64_t v24 = [(PLBBMavLogMsg *)self cxoShutDownCount];
  [v4 setObject:v24 forKeyedSubscript:@"CXOShutdownCount"];

  uint64_t v25 = [(PLBBMavLogMsg *)self lpassOnOffState];
  [v4 setObject:v25 forKeyedSubscript:@"LPASSOnOffStateHistogram"];

  unint64_t v26 = [(PLBBMavLogMsg *)self appsSleepVeto];
  [v4 setObject:v26 forKeyedSubscript:@"APPSSleepVetoState"];

  int v27 = [(PLBBMavLogMsg *)self mpssSleepVeto];
  [v4 setObject:v27 forKeyedSubscript:@"MPSSSleepVetoHistogram"];

  uint64_t v28 = [(PLBBMavLogMsg *)self qdspConfigCount];
  [v4 setObject:v28 forKeyedSubscript:@"QDSPConfigCountHistogram"];

  uint64_t v29 = [(PLBBMavLogMsg *)self gpsOnOff];
  [v4 setObject:v29 forKeyedSubscript:@"GPSOnOffStateHistogram"];

  id v30 = [(PLBBMavLogMsg *)self gpsDPOOnOff];
  [v4 setObject:v30 forKeyedSubscript:@"GPSDPOOnOffStateHistogram"];

  unint64_t v31 = [(PLBBMavLogMsg *)self gpsDPOBin];
  [v4 setObject:v31 forKeyedSubscript:@"GPSDPOBins"];

  id v32 = [(PLBBMavLogMsg *)self mpssCxoShutDownDuration];
  [v4 setObject:v32 forKeyedSubscript:@"MPSSCXOShutdownDuration"];

  v33 = [(PLBBMavLogMsg *)self mpssCxoShutDownCount];
  [v4 setObject:v33 forKeyedSubscript:@"MPSSCXOShutdownCount"];

  int v34 = [(PLBBMavLogMsg *)self mcpmVetoNumHistogram];
  [v4 setObject:v34 forKeyedSubscript:@"MCPMVetoNumHistogram"];

  id v35 = [(PLBBMavLogMsg *)self ProtocolActivityHistogram];
  [v4 setObject:v35 forKeyedSubscript:@"ProtocolActivityHistogram"];

  id v36 = [(PLBBMavLogMsg *)self pcieStateHistogram];
  [v4 setObject:v36 forKeyedSubscript:@"PCIEStateHistogram"];
}

- (NSDate)bbDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBbDate:(id)a3
{
}

- (NSNumber)bbTimeCal
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBbTimeCal:(id)a3
{
}

- (NSNumber)bbSeqNum
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBbSeqNum:(id)a3
{
}

- (NSNumber)bbHwMsgType
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBbHwMsgType:(id)a3
{
}

- (NSNumber)bbSwRev
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBbSwRev:(id)a3
{
}

- (NSNumber)bbHwRev
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBbHwRev:(id)a3
{
}

- (NSNumber)bbHwStatsType
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBbHwStatsType:(id)a3
{
}

- (NSNumber)bbHwStatsLength
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBbHwStatsLength:(id)a3
{
}

- (NSNumber)bbHwStatsLevel
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBbHwStatsLevel:(id)a3
{
}

- (NSNumber)bbHwCurrTimeStamp
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setBbHwCurrTimeStamp:(id)a3
{
}

- (NSNumber)bbHwLastTimeStamp
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBbHwLastTimeStamp:(id)a3
{
}

- (NSNumber)bbHwLogDurationInTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setBbHwLogDurationInTicks:(id)a3
{
}

- (NSArray)bbHwProcSystemState
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBbHwProcSystemState:(id)a3
{
}

- (NSArray)bbHwProcArmPerfState
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setBbHwProcArmPerfState:(id)a3
{
}

- (NSArray)bbHwModemAppMdspState
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setBbHwModemAppMdspState:(id)a3
{
}

- (NSArray)bbHwModemAppMdspClockState
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBbHwModemAppMdspClockState:(id)a3
{
}

- (NSArray)bbHwModemAppMdmState
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBbHwModemAppMdmState:(id)a3
{
}

- (NSArray)bbHwModemAppMdmSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBbHwModemAppMdmSpeed:(id)a3
{
}

- (NSArray)bbHwModemAppQ6FwSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBbHwModemAppQ6FwSpeed:(id)a3
{
}

- (NSArray)bbHwModemAppQ6SwSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setBbHwModemAppQ6SwSpeed:(id)a3
{
}

- (NSArray)bbHwModemAppMdspSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setBbHwModemAppMdspSpeed:(id)a3
{
}

- (NSArray)bbHwModemAppQdspSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setBbHwModemAppQdspSpeed:(id)a3
{
}

- (NSArray)bbHwModemAppAdspState
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setBbHwModemAppAdspState:(id)a3
{
}

- (NSArray)bbHwModemAppAdspClockState
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)setBbHwModemAppAdspClockState:(id)a3
{
}

- (NSArray)bbHwModemAppAdspSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 288, 1);
}

- (void)setBbHwModemAppAdspSpeed:(id)a3
{
}

- (NSArray)bbHwModemAppAdmState
{
  return (NSArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setBbHwModemAppAdmState:(id)a3
{
}

- (NSArray)bbHwPeripheralUSBState
{
  return (NSArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setBbHwPeripheralUSBState:(id)a3
{
}

- (NSArray)bbHwPeripheralSPIState
{
  return (NSArray *)objc_getProperty(self, a2, 312, 1);
}

- (void)setBbHwPeripheralSPIState:(id)a3
{
}

- (NSArray)bbHwPeripheralGPSState
{
  return (NSArray *)objc_getProperty(self, a2, 320, 1);
}

- (void)setBbHwPeripheralGPSState:(id)a3
{
}

- (NSArray)bbHwPeripheralUARTState
{
  return (NSArray *)objc_getProperty(self, a2, 328, 1);
}

- (void)setBbHwPeripheralUARTState:(id)a3
{
}

- (NSArray)bbHwSleepVetoClientListQdsp
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setBbHwSleepVetoClientListQdsp:(id)a3
{
}

- (NSArray)bbHwSleepVetoClientListArm
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (void)setBbHwSleepVetoClientListArm:(id)a3
{
}

- (NSNumber)rpmXOShutDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRpmXOShutDuration:(id)a3
{
}

- (NSNumber)rpmXOShutCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setRpmXOShutCnt:(id)a3
{
}

- (NSNumber)rpmVDDMinEnterCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setRpmVDDMinEnterCnt:(id)a3
{
}

- (NSNumber)rpmVDDMinDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setRpmVDDMinDuration:(id)a3
{
}

- (NSArray)appsPerfStateCountHist
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAppsPerfStateCountHist:(id)a3
{
}

- (NSNumber)cxoShutDownDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setCxoShutDownDuration:(id)a3
{
}

- (NSNumber)cxoShutDownCount
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setCxoShutDownCount:(id)a3
{
}

- (NSArray)usbStateCountHist
{
  return (NSArray *)objc_getProperty(self, a2, 408, 1);
}

- (void)setUsbStateCountHist:(id)a3
{
}

- (NSArray)uartOnOffState
{
  return (NSArray *)objc_getProperty(self, a2, 416, 1);
}

- (void)setUartOnOffState:(id)a3
{
}

- (NSArray)spiOnOffState
{
  return (NSArray *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSpiOnOffState:(id)a3
{
}

- (NSArray)admOnOffState
{
  return (NSArray *)objc_getProperty(self, a2, 432, 1);
}

- (void)setAdmOnOffState:(id)a3
{
}

- (NSArray)lpassOnOffState
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLpassOnOffState:(id)a3
{
}

- (NSArray)appsSleepVeto
{
  return (NSArray *)objc_getProperty(self, a2, 448, 1);
}

- (void)setAppsSleepVeto:(id)a3
{
}

- (NSArray)mpssSleepVeto
{
  return (NSArray *)objc_getProperty(self, a2, 456, 1);
}

- (void)setMpssSleepVeto:(id)a3
{
}

- (NSArray)mdspConfigCount
{
  return (NSArray *)objc_getProperty(self, a2, 464, 1);
}

- (void)setMdspConfigCount:(id)a3
{
}

- (NSArray)qdspConfigCount
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setQdspConfigCount:(id)a3
{
}

- (NSArray)gpsOnOff
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (void)setGpsOnOff:(id)a3
{
}

- (NSArray)gpsDPOOnOff
{
  return (NSArray *)objc_getProperty(self, a2, 488, 1);
}

- (void)setGpsDPOOnOff:(id)a3
{
}

- (NSArray)gpsDPOBin
{
  return (NSArray *)objc_getProperty(self, a2, 496, 1);
}

- (void)setGpsDPOBin:(id)a3
{
}

- (NSNumber)mpssCxoShutDownDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setMpssCxoShutDownDuration:(id)a3
{
}

- (NSNumber)mpssCxoShutDownCount
{
  return (NSNumber *)objc_getProperty(self, a2, 512, 1);
}

- (void)setMpssCxoShutDownCount:(id)a3
{
}

- (NSArray)mcpmVetoNumHistogram
{
  return (NSArray *)objc_getProperty(self, a2, 520, 1);
}

- (void)setMcpmVetoNumHistogram:(id)a3
{
}

- (NSArray)ProtocolActivityHistogram
{
  return (NSArray *)objc_getProperty(self, a2, 528, 1);
}

- (void)setProtocolActivityHistogram:(id)a3
{
}

- (NSArray)pcieStateHistogram
{
  return (NSArray *)objc_getProperty(self, a2, 536, 1);
}

- (void)setPcieStateHistogram:(id)a3
{
}

- (NSNumber)npaVetoMask
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setNpaVetoMask:(id)a3
{
}

- (NSArray)npaVetoClientNumHistogram
{
  return (NSArray *)objc_getProperty(self, a2, 552, 1);
}

- (void)setNpaVetoClientNumHistogram:(id)a3
{
}

- (NSString)appsClockStateDurationStr
{
  return (NSString *)objc_getProperty(self, a2, 560, 1);
}

- (void)setAppsClockStateDurationStr:(id)a3
{
}

- (NSString)mpssClockStateDurationStr
{
  return (NSString *)objc_getProperty(self, a2, 568, 1);
}

- (void)setMpssClockStateDurationStr:(id)a3
{
}

- (NSArray)hsicStateSleepVetoNum
{
  return (NSArray *)objc_getProperty(self, a2, 576, 1);
}

- (void)setHsicStateSleepVetoNum:(id)a3
{
}

- (NSNumber)radioTech
{
  return (NSNumber *)objc_getProperty(self, a2, 584, 1);
}

- (void)setRadioTech:(id)a3
{
}

- (NSArray)rssiModeCount
{
  return (NSArray *)objc_getProperty(self, a2, 592, 1);
}

- (void)setRssiModeCount:(id)a3
{
}

- (NSArray)rx0RssiPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 600, 1);
}

- (void)setRx0RssiPowerHist:(id)a3
{
}

- (NSArray)rx1RssiPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 608, 1);
}

- (void)setRx1RssiPowerHist:(id)a3
{
}

- (NSArray)rx0SQAPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 616, 1);
}

- (void)setRx0SQAPowerHist:(id)a3
{
}

- (NSArray)rx1SQAPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 624, 1);
}

- (void)setRx1SQAPowerHist:(id)a3
{
}

- (NSArray)txPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 632, 1);
}

- (void)setTxPowerHist:(id)a3
{
}

- (NSArray)protocolStateHist
{
  return (NSArray *)objc_getProperty(self, a2, 640, 1);
}

- (void)setProtocolStateHist:(id)a3
{
}

- (NSDictionary)protocolStateHistDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 648, 1);
}

- (void)setProtocolStateHistDict:(id)a3
{
}

- (NSArray)bbActive
{
  return (NSArray *)objc_getProperty(self, a2, 656, 1);
}

- (void)setBbActive:(id)a3
{
}

- (NSArray)txPowerHist1x
{
  return (NSArray *)objc_getProperty(self, a2, 664, 1);
}

- (void)setTxPowerHist1x:(id)a3
{
}

- (NSArray)txPowerHistEVDO
{
  return (NSArray *)objc_getProperty(self, a2, 672, 1);
}

- (void)setTxPowerHistEVDO:(id)a3
{
}

- (NSNumber)txTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 680, 1);
}

- (void)setTxTicks:(id)a3
{
}

- (NSNumber)rxTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 688, 1);
}

- (void)setRxTicks:(id)a3
{
}

- (NSMutableDictionary)commonInfo
{
  return self->_commonInfo;
}

- (void)setCommonInfo:(id)a3
{
}

- (NSMutableDictionary)kvPairs
{
  return self->_kvPairs;
}

- (void)setKvPairs:(id)a3
{
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 712, 1);
}

- (void)setGroupEntryKey:(id)a3
{
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 720, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 728, 1);
}

- (void)setGroupArrEntries:(id)a3
{
}

- (NSMutableDictionary)groupDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 736, 1);
}

- (void)setGroupDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupDict, 0);
  objc_storeStrong((id *)&self->_groupArrEntries, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_groupEntryKey, 0);
  objc_storeStrong((id *)&self->_kvPairs, 0);
  objc_storeStrong((id *)&self->_commonInfo, 0);
  objc_storeStrong((id *)&self->_rxTicks, 0);
  objc_storeStrong((id *)&self->_txTicks, 0);
  objc_storeStrong((id *)&self->_txPowerHistEVDO, 0);
  objc_storeStrong((id *)&self->_txPowerHist1x, 0);
  objc_storeStrong((id *)&self->_bbActive, 0);
  objc_storeStrong((id *)&self->_protocolStateHistDict, 0);
  objc_storeStrong((id *)&self->_protocolStateHist, 0);
  objc_storeStrong((id *)&self->_txPowerHist, 0);
  objc_storeStrong((id *)&self->_rx1SQAPowerHist, 0);
  objc_storeStrong((id *)&self->_rx0SQAPowerHist, 0);
  objc_storeStrong((id *)&self->_rx1RssiPowerHist, 0);
  objc_storeStrong((id *)&self->_rx0RssiPowerHist, 0);
  objc_storeStrong((id *)&self->_rssiModeCount, 0);
  objc_storeStrong((id *)&self->_radioTech, 0);
  objc_storeStrong((id *)&self->_hsicStateSleepVetoNum, 0);
  objc_storeStrong((id *)&self->_mpssClockStateDurationStr, 0);
  objc_storeStrong((id *)&self->_appsClockStateDurationStr, 0);
  objc_storeStrong((id *)&self->_npaVetoClientNumHistogram, 0);
  objc_storeStrong((id *)&self->_npaVetoMask, 0);
  objc_storeStrong((id *)&self->_pcieStateHistogram, 0);
  objc_storeStrong((id *)&self->_ProtocolActivityHistogram, 0);
  objc_storeStrong((id *)&self->_mcpmVetoNumHistogram, 0);
  objc_storeStrong((id *)&self->_mpssCxoShutDownCount, 0);
  objc_storeStrong((id *)&self->_mpssCxoShutDownDuration, 0);
  objc_storeStrong((id *)&self->_gpsDPOBin, 0);
  objc_storeStrong((id *)&self->_gpsDPOOnOff, 0);
  objc_storeStrong((id *)&self->_gpsOnOff, 0);
  objc_storeStrong((id *)&self->_qdspConfigCount, 0);
  objc_storeStrong((id *)&self->_mdspConfigCount, 0);
  objc_storeStrong((id *)&self->_mpssSleepVeto, 0);
  objc_storeStrong((id *)&self->_appsSleepVeto, 0);
  objc_storeStrong((id *)&self->_lpassOnOffState, 0);
  objc_storeStrong((id *)&self->_admOnOffState, 0);
  objc_storeStrong((id *)&self->_spiOnOffState, 0);
  objc_storeStrong((id *)&self->_uartOnOffState, 0);
  objc_storeStrong((id *)&self->_usbStateCountHist, 0);
  objc_storeStrong((id *)&self->_cxoShutDownCount, 0);
  objc_storeStrong((id *)&self->_cxoShutDownDuration, 0);
  objc_storeStrong((id *)&self->_appsPerfStateCountHist, 0);
  objc_storeStrong((id *)&self->_rpmVDDMinDuration, 0);
  objc_storeStrong((id *)&self->_rpmVDDMinEnterCnt, 0);
  objc_storeStrong((id *)&self->_rpmXOShutCnt, 0);
  objc_storeStrong((id *)&self->_rpmXOShutDuration, 0);
  objc_storeStrong((id *)&self->_bbHwSleepVetoClientListArm, 0);
  objc_storeStrong((id *)&self->_bbHwSleepVetoClientListQdsp, 0);
  objc_storeStrong((id *)&self->_bbHwPeripheralUARTState, 0);
  objc_storeStrong((id *)&self->_bbHwPeripheralGPSState, 0);
  objc_storeStrong((id *)&self->_bbHwPeripheralSPIState, 0);
  objc_storeStrong((id *)&self->_bbHwPeripheralUSBState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppAdmState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppAdspSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppAdspClockState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppAdspState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppQdspSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdspSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppQ6SwSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppQ6FwSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdmSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdmState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdspClockState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdspState, 0);
  objc_storeStrong((id *)&self->_bbHwProcArmPerfState, 0);
  objc_storeStrong((id *)&self->_bbHwProcSystemState, 0);
  objc_storeStrong((id *)&self->_bbHwLogDurationInTicks, 0);
  objc_storeStrong((id *)&self->_bbHwLastTimeStamp, 0);
  objc_storeStrong((id *)&self->_bbHwCurrTimeStamp, 0);
  objc_storeStrong((id *)&self->_bbHwStatsLevel, 0);
  objc_storeStrong((id *)&self->_bbHwStatsLength, 0);
  objc_storeStrong((id *)&self->_bbHwStatsType, 0);
  objc_storeStrong((id *)&self->_bbHwRev, 0);
  objc_storeStrong((id *)&self->_bbSwRev, 0);
  objc_storeStrong((id *)&self->_bbHwMsgType, 0);
  objc_storeStrong((id *)&self->_bbSeqNum, 0);
  objc_storeStrong((id *)&self->_bbTimeCal, 0);
  objc_storeStrong((id *)&self->_bbDate, 0);
}

@end