@interface PLBBMav16HwRfLTELogMsg
+ (id)entryEventBackwardDefinitionBBMav16HwRfLTE;
- (NSArray)actRxTxCnt;
- (NSArray)arxBaselinePCC;
- (NSArray)arxBaselineSCC1;
- (NSArray)arxBaselineSCC2;
- (NSArray)arxQicePCC;
- (NSArray)arxQiceSCC1;
- (NSArray)arxQiceSCC2;
- (NSArray)arxStateCnt;
- (NSArray)bpeStats;
- (NSArray)caSCCCnt;
- (NSArray)dlTBSzCnt;
- (NSArray)hsicPCC;
- (NSArray)hsicSCC1;
- (NSArray)hsicSCC2;
- (NSArray)nlicStateCnt;
- (NSArray)rsrpConnCnt;
- (NSArray)rsrpIdleCnt;
- (NSArray)sinrConnCnt;
- (NSArray)sinrIdleCnt;
- (NSArray)sleepStateConnCnt;
- (NSArray)sleepStateIdleCnt;
- (NSArray)txPwrCnt;
- (NSArray)ulCaSCCCnt;
- (NSMutableArray)groupArrEntries;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)PCCBw;
- (NSNumber)PCCFreq;
- (NSNumber)SCC1Bw;
- (NSNumber)SCC1Freq;
- (NSNumber)SCC2Bw;
- (NSNumber)SCC2Freq;
- (NSNumber)ardRxDOff;
- (NSNumber)arxOffPCC;
- (NSNumber)arxOffSCC1;
- (NSNumber)arxOffSCC2;
- (NSNumber)dupMode;
- (NSNumber)logDuration;
- (NSNumber)uSleepPCCCnt;
- (NSNumber)uSleepSCC1Cnt;
- (NSNumber)uSleepSCC2Cnt;
- (NSString)error;
- (NSString)groupEntryKey;
- (NSString)groupID;
- (PLBBMav16HwRfLTELogMsg)init;
- (id)logEventBackwardBBMav16HwRfLTE;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)populateMav16Entry:(id)a3;
- (void)refreshMav16BBRfLTE;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setActRxTxCnt:(id)a3;
- (void)setArdRxDOff:(id)a3;
- (void)setArxBaselinePCC:(id)a3;
- (void)setArxBaselineSCC1:(id)a3;
- (void)setArxBaselineSCC2:(id)a3;
- (void)setArxOffPCC:(id)a3;
- (void)setArxOffSCC1:(id)a3;
- (void)setArxOffSCC2:(id)a3;
- (void)setArxQicePCC:(id)a3;
- (void)setArxQiceSCC1:(id)a3;
- (void)setArxQiceSCC2:(id)a3;
- (void)setArxStateCnt:(id)a3;
- (void)setBpeStats:(id)a3;
- (void)setCaSCCCnt:(id)a3;
- (void)setCommonInfo:(id)a3;
- (void)setDlTBSzCnt:(id)a3;
- (void)setDupMode:(id)a3;
- (void)setError:(id)a3;
- (void)setGroupArrEntries:(id)a3;
- (void)setGroupEntryKey:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setHsicPCC:(id)a3;
- (void)setHsicSCC1:(id)a3;
- (void)setHsicSCC2:(id)a3;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setLogDuration:(id)a3;
- (void)setNlicStateCnt:(id)a3;
- (void)setPCCBw:(id)a3;
- (void)setPCCFreq:(id)a3;
- (void)setRsrpConnCnt:(id)a3;
- (void)setRsrpIdleCnt:(id)a3;
- (void)setSCC1Bw:(id)a3;
- (void)setSCC1Freq:(id)a3;
- (void)setSCC2Bw:(id)a3;
- (void)setSCC2Freq:(id)a3;
- (void)setSinrConnCnt:(id)a3;
- (void)setSinrIdleCnt:(id)a3;
- (void)setSleepStateConnCnt:(id)a3;
- (void)setSleepStateIdleCnt:(id)a3;
- (void)setTxPwrCnt:(id)a3;
- (void)setUSleepPCCCnt:(id)a3;
- (void)setUSleepSCC1Cnt:(id)a3;
- (void)setUSleepSCC2Cnt:(id)a3;
- (void)setUlCaSCCCnt:(id)a3;
@end

@implementation PLBBMav16HwRfLTELogMsg

- (PLBBMav16HwRfLTELogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__PLBBMav16HwRfLTELogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD585B8 != -1) {
      dispatch_once(&qword_1EBD585B8, block);
    }
    if (_MergedGlobals_1_27)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwRfLTELogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg init]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:43];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)PLBBMav16HwRfLTELogMsg;
  v10 = [(PLBBMsgRoot *)&v16 init];
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    commonInfo = v10->_commonInfo;
    v10->_commonInfo = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    kvPairs = v10->_kvPairs;
    v10->_kvPairs = v13;

    v10->_inited = 1;
  }
  return v10;
}

uint64_t __30__PLBBMav16HwRfLTELogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_27 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD585C0 != -1) {
      dispatch_once(&qword_1EBD585C0, block);
    }
    if (byte_1EBD585A9)
    {
      id v12 = v10;
      id v13 = v9;
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v15 = (void *)MEMORY[0x1E4F929B8];
      objc_super v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:62];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v13;
      id v10 = v12;
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v20 = objc_opt_class();
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v20;
    if (qword_1EBD585C8 != -1) {
      dispatch_once(&qword_1EBD585C8, v47);
    }
    if (byte_1EBD585AA)
    {
      id v21 = v10;
      id v44 = v10;
      id v22 = v9;
      v23 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v9, v44];
      v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:63];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v22;
      id v10 = v21;
    }
  }
  v29 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v8 setObject:v29 forKeyedSubscript:@"SeqNum"];

  v30 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v8 setObject:v30 forKeyedSubscript:@"BBDate"];

  v31 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"TimeCal"];
  [v8 setObject:v31 forKeyedSubscript:@"TimeCal"];

  v32 = [(PLBBMsgRoot *)self agent];

  if (!v32 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v33 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_378;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v33;
    if (qword_1EBD585D0 != -1) {
      dispatch_once(&qword_1EBD585D0, v46);
    }
    if (byte_1EBD585AB)
    {
      id v45 = v10;
      id v34 = v9;
      v35 = [NSString stringWithFormat:@"Bad agent"];
      v36 = (void *)MEMORY[0x1E4F929B8];
      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
      [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:70];

      v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v35;
        _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v34;
      id v10 = v45;
    }
  }
  v41 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  v42 = [v41 convertFromBasebandToMonotonic];
  [v8 setEntryDate:v42];

  v43 = [(PLBBMsgRoot *)self agent];
  [v43 logEntry:v8];
}

uint64_t __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585A9 = result;
  return result;
}

uint64_t __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585AA = result;
  return result;
}

uint64_t __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_378(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585AB = result;
  return result;
}

- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PLBBMav16HwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD585D8 != -1) {
      dispatch_once(&qword_1EBD585D8, block);
    }
    if (byte_1EBD585AC)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      id v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:83];

      objc_super v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v8 && v9)
  {
    [(NSMutableDictionary *)self->_commonInfo setObject:v8 forKey:@"SeqNum"];
    [(NSMutableDictionary *)self->_commonInfo setObject:v9 forKey:@"BBDate"];
    commonInfo = self->_commonInfo;
    v18 = [NSNumber numberWithDouble:a5];
    [(NSMutableDictionary *)commonInfo setValue:v18 forKey:@"TimeCal"];
LABEL_18:

    goto LABEL_19;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__PLBBMav16HwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_384;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD585E0 != -1) {
      dispatch_once(&qword_1EBD585E0, v25);
    }
    if (byte_1EBD585AD)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      id v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v20 logMessage:v18 fromFile:v22 fromFunction:v23 fromLineNumber:85];

      v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_18;
    }
  }
LABEL_19:
}

uint64_t __65__PLBBMav16HwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585AC = result;
  return result;
}

uint64_t __65__PLBBMav16HwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_384(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585AD = result;
  return result;
}

- (void)addPairWithKey:(id)a3 andWithVal:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD585E8 != -1) {
      dispatch_once(&qword_1EBD585E8, block);
    }
    if (byte_1EBD585AE)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwRfLTELogMsg addPairWithKey:andWithVal:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg addPairWithKey:andWithVal:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:101];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v15 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v6)
  {
    if (v15)
    {
      uint64_t v16 = objc_opt_class();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_397;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD585F8 != -1) {
        dispatch_once(&qword_1EBD585F8, v30);
      }
      if (byte_1EBD585B0)
      {
        v17 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
        uint64_t v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg addPairWithKey:andWithVal:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:107];

        id v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v23 = [(PLBBMav16HwRfLTELogMsg *)self kvPairs];
    [v23 setObject:v7 forKey:v6];
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_391;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD585F0 != -1) {
      dispatch_once(&qword_1EBD585F0, v31);
    }
    if (byte_1EBD585AF)
    {
      v23 = [NSString stringWithFormat:@"Error: nil key for kvPair not expected, return"];
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg addPairWithKey:andWithVal:]"];
      [v25 logMessage:v23 fromFile:v27 fromFunction:v28 fromLineNumber:104];

      uint64_t v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v23;
        _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_17;
    }
  }
LABEL_25:
}

uint64_t __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585AE = result;
  return result;
}

uint64_t __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585AF = result;
  return result;
}

uint64_t __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_397(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585B0 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMav16HwRfLTE
{
  v117[2] = *MEMORY[0x1E4F143B8];
  v116[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v114[0] = *MEMORY[0x1E4F92CD0];
  v114[1] = v2;
  v115[0] = &unk_1F29F0820;
  v115[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v114[2] = *MEMORY[0x1E4F92CB0];
  v114[3] = v3;
  v115[2] = @"refreshMav16BBRfLTE";
  v115[3] = MEMORY[0x1E4F1CC38];
  v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:4];
  v117[0] = v66;
  v116[1] = *MEMORY[0x1E4F92CA8];
  v112[0] = @"SeqNum";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v113[0] = v64;
  v112[1] = @"BBDate";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_DateFormat");
  v113[1] = v62;
  v112[2] = @"LogDuration";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
  v113[2] = v60;
  v112[3] = @"DupMode";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v113[3] = v58;
  v112[4] = @"PCC_Band";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v113[4] = v56;
  v112[5] = @"PCC_BW";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v113[5] = v54;
  v112[6] = @"SCC1_Band";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v113[6] = v52;
  v112[7] = @"SCC1_BW";
  uint64_t v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v113[7] = v50;
  v112[8] = @"SCC2_Band";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v113[8] = v48;
  v112[9] = @"SCC2_BW";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v113[9] = v46;
  v112[10] = @"DLTBSzArr";
  uint64_t v5 = *MEMORY[0x1E4F92D00];
  v109[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v109[0];
  v109[1] = v5;
  v111[0] = &unk_1F29E5E48;
  v111[1] = &unk_1F29E5E60;
  uint64_t v110 = *MEMORY[0x1E4F92D08];
  uint64_t v6 = v110;
  v111[2] = &unk_1F29E5E78;
  id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v109 count:3];
  v113[10] = v45;
  v112[11] = @"TxPwrBktArr";
  v107[0] = v4;
  v107[1] = v5;
  v108[0] = &unk_1F29E5E48;
  v108[1] = &unk_1F29E5E90;
  v107[2] = v6;
  v108[2] = &unk_1F29E5E78;
  id v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];
  v113[11] = v44;
  v112[12] = @"CASCCStateArr";
  v105[0] = v4;
  v105[1] = v5;
  v106[0] = &unk_1F29E5E48;
  v106[1] = &unk_1F29E5EA8;
  v105[2] = v6;
  v106[2] = &unk_1F29E5E78;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:3];
  v113[12] = v43;
  v112[13] = @"ULCACStateArr";
  v103[0] = v4;
  v103[1] = v5;
  v104[0] = &unk_1F29E5E48;
  v104[1] = &unk_1F29E5EC0;
  v103[2] = v6;
  v104[2] = &unk_1F29E5E78;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:3];
  v113[13] = v42;
  v112[14] = @"kRfActRxTxArr";
  v101[0] = v4;
  v101[1] = v5;
  v102[0] = &unk_1F29E5E48;
  v102[1] = &unk_1F29E5EA8;
  v101[2] = v6;
  v102[2] = &unk_1F29E5E78;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:3];
  v113[14] = v41;
  v112[15] = @"SleepStateIdleArr";
  v99[0] = v4;
  v99[1] = v5;
  v100[0] = &unk_1F29E5E48;
  v100[1] = &unk_1F29E5ED8;
  v99[2] = v6;
  v100[2] = &unk_1F29E5E78;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];
  v113[15] = v40;
  v112[16] = @"SleepStateConnArr";
  v97[0] = v4;
  v97[1] = v5;
  v98[0] = &unk_1F29E5E48;
  v98[1] = &unk_1F29E5ED8;
  v97[2] = v6;
  v98[2] = &unk_1F29E5E78;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:3];
  v113[16] = v39;
  v112[17] = @"RfRSRPIdleArr";
  v95[0] = v4;
  v95[1] = v5;
  v96[0] = &unk_1F29E5E48;
  v96[1] = &unk_1F29E5EA8;
  v95[2] = v6;
  v96[2] = &unk_1F29E5E78;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:3];
  v113[17] = v38;
  v112[18] = @"RfRSRPConnArr";
  v93[0] = v4;
  v93[1] = v5;
  v94[0] = &unk_1F29E5E48;
  v94[1] = &unk_1F29E5EA8;
  v93[2] = v6;
  v94[2] = &unk_1F29E5E78;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:3];
  v113[18] = v37;
  v112[19] = @"RfSINRIdleArr";
  v91[0] = v4;
  v91[1] = v5;
  v92[0] = &unk_1F29E5E48;
  v92[1] = &unk_1F29E5EA8;
  v91[2] = v6;
  v92[2] = &unk_1F29E5E78;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:3];
  v113[19] = v36;
  v112[20] = @"RfSINRConnArr";
  v89[0] = v4;
  v89[1] = v5;
  v90[0] = &unk_1F29E5E48;
  v90[1] = &unk_1F29E5EA8;
  v89[2] = v6;
  v90[2] = &unk_1F29E5E78;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:3];
  v113[20] = v35;
  v112[21] = @"RfNLICArr";
  v87[0] = v4;
  v87[1] = v5;
  v88[0] = &unk_1F29E5E48;
  v88[1] = &unk_1F29E5EC0;
  v87[2] = v6;
  v88[2] = &unk_1F29E5E78;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:3];
  v113[21] = v34;
  v112[22] = @"RfBPEArr";
  v85[0] = v4;
  v85[1] = v5;
  v86[0] = &unk_1F29E5E48;
  v86[1] = &unk_1F29E5EF0;
  v85[2] = v6;
  v86[2] = &unk_1F29E5E78;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:3];
  v113[22] = v33;
  v112[23] = @"ARD_RxD_Off_Duration";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v113[23] = v31;
  v112[24] = @"uSleep_PCC";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v113[24] = v29;
  v112[25] = @"uSleep_SCC1";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v113[25] = v27;
  v112[26] = @"uSleep_SCC2";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v113[26] = v25;
  v112[27] = @"HSIC_PCC_OffOn";
  v83[0] = v4;
  v83[1] = v5;
  v84[0] = &unk_1F29E5E48;
  v84[1] = &unk_1F29E5F08;
  v83[2] = v6;
  v84[2] = &unk_1F29E5E78;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
  v113[27] = v24;
  v112[28] = @"HSIC_SCC1_OffOn";
  v81[0] = v4;
  v81[1] = v5;
  v82[0] = &unk_1F29E5E48;
  v82[1] = &unk_1F29E5F08;
  v81[2] = v6;
  v82[2] = &unk_1F29E5E78;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  v113[28] = v23;
  v112[29] = @"HSIC_SCC2_OffOn";
  v79[0] = v4;
  v79[1] = v5;
  v80[0] = &unk_1F29E5E48;
  v80[1] = &unk_1F29E5F08;
  v79[2] = v6;
  v80[2] = &unk_1F29E5E78;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v113[29] = v22;
  v112[30] = @"PCC_ARX_Off";
  id v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v113[30] = v20;
  v112[31] = @"SCC1_ARX_Off";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v113[31] = v18;
  v112[32] = @"SCC2_ARX_Off";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v113[32] = v16;
  v112[33] = @"PCC_ARX_Baseline";
  v77[0] = v4;
  v77[1] = v5;
  v78[0] = &unk_1F29E5E48;
  v78[1] = &unk_1F29E5EC0;
  v77[2] = v6;
  v78[2] = &unk_1F29E5E78;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];
  v113[33] = v15;
  v112[34] = @"SCC1_ARX_Baseline";
  v75[0] = v4;
  v75[1] = v5;
  v76[0] = &unk_1F29E5E48;
  v76[1] = &unk_1F29E5EC0;
  v75[2] = v6;
  v76[2] = &unk_1F29E5E78;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  v113[34] = v14;
  v112[35] = @"SCC2_ARX_Baseline";
  v73[0] = v4;
  v73[1] = v5;
  v74[0] = &unk_1F29E5E48;
  v74[1] = &unk_1F29E5EC0;
  v73[2] = v6;
  v74[2] = &unk_1F29E5E78;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
  v113[35] = v7;
  v112[36] = @"PCC_ARX_QICE";
  v71[0] = v4;
  v71[1] = v5;
  v72[0] = &unk_1F29E5E48;
  v72[1] = &unk_1F29E5EC0;
  v71[2] = v6;
  v72[2] = &unk_1F29E5E78;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:3];
  v113[36] = v8;
  v112[37] = @"SCC1_ARX_QICE";
  v69[0] = v4;
  v69[1] = v5;
  v70[0] = &unk_1F29E5E48;
  v70[1] = &unk_1F29E5EC0;
  v69[2] = v6;
  v70[2] = &unk_1F29E5E78;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:3];
  v113[37] = v9;
  v112[38] = @"SCC2_ARX_QICE";
  v67[0] = v4;
  v67[1] = v5;
  v68[0] = &unk_1F29E5E48;
  v68[1] = &unk_1F29E5EC0;
  v67[2] = v6;
  v68[2] = &unk_1F29E5E78;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
  v113[38] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:39];
  v117[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:2];

  return v12;
}

- (void)refreshMav16BBRfLTE
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMav16HwRfLTE
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __56__PLBBMav16HwRfLTELogMsg_logEventBackwardBBMav16HwRfLTE__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v3;
    if (qword_1EBD58600 != -1) {
      dispatch_once(&qword_1EBD58600, &block);
    }
    if (byte_1EBD585B1)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwRfLTELogMsg logEventBackwardBBMav16HwRfLTE]", block, v15, v16, v17, v18);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMav16HwRfLTELogMsg logEventBackwardBBMav16HwRfLTE]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:265];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavHwRfLTE"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  [(PLBBMav16HwRfLTELogMsg *)self populateMav16Entry:v11];
  v19[0] = @"entry";
  v19[1] = @"entryKey";
  v20[0] = v11;
  v20[1] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

uint64_t __56__PLBBMav16HwRfLTELogMsg_logEventBackwardBBMav16HwRfLTE__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD585B1 = result;
  return result;
}

- (void)populateMav16Entry:(id)a3
{
  commonInfo = self->_commonInfo;
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)commonInfo objectForKey:@"BBDate"];
  id v7 = [v6 convertFromBasebandToMonotonic];
  [v5 setEntryDate:v7];

  uint64_t v8 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v5 setObject:v8 forKeyedSubscript:@"SeqNum"];

  id v9 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v5 setObject:v9 forKeyedSubscript:@"BBDate"];

  uint64_t v10 = [(PLBBMav16HwRfLTELogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  uint64_t v11 = [(PLBBMav16HwRfLTELogMsg *)self dupMode];
  [v5 setObject:v11 forKeyedSubscript:@"DupMode"];

  id v12 = [(PLBBMav16HwRfLTELogMsg *)self PCCFreq];
  [v5 setObject:v12 forKeyedSubscript:@"PCC_Band"];

  id v13 = [(PLBBMav16HwRfLTELogMsg *)self PCCBw];
  [v5 setObject:v13 forKeyedSubscript:@"PCC_BW"];

  v14 = [(PLBBMav16HwRfLTELogMsg *)self SCC1Freq];
  [v5 setObject:v14 forKeyedSubscript:@"SCC1_Band"];

  uint64_t v15 = [(PLBBMav16HwRfLTELogMsg *)self SCC1Bw];
  [v5 setObject:v15 forKeyedSubscript:@"SCC1_BW"];

  uint64_t v16 = [(PLBBMav16HwRfLTELogMsg *)self SCC2Freq];
  [v5 setObject:v16 forKeyedSubscript:@"SCC2_Band"];

  v17 = [(PLBBMav16HwRfLTELogMsg *)self SCC2Bw];
  [v5 setObject:v17 forKeyedSubscript:@"SCC2_BW"];

  uint64_t v18 = [(PLBBMav16HwRfLTELogMsg *)self dlTBSzCnt];
  [v5 setObject:v18 forKeyedSubscript:@"DLTBSzArr"];

  uint64_t v19 = [(PLBBMav16HwRfLTELogMsg *)self txPwrCnt];
  [v5 setObject:v19 forKeyedSubscript:@"TxPwrBktArr"];

  uint64_t v20 = [(PLBBMav16HwRfLTELogMsg *)self caSCCCnt];
  [v5 setObject:v20 forKeyedSubscript:@"CASCCStateArr"];

  id v21 = [(PLBBMav16HwRfLTELogMsg *)self ulCaSCCCnt];
  [v5 setObject:v21 forKeyedSubscript:@"ULCACStateArr"];

  id v22 = [(PLBBMav16HwRfLTELogMsg *)self actRxTxCnt];
  [v5 setObject:v22 forKeyedSubscript:@"kRfActRxTxArr"];

  uint64_t v23 = [(PLBBMav16HwRfLTELogMsg *)self sleepStateIdleCnt];
  [v5 setObject:v23 forKeyedSubscript:@"SleepStateIdleArr"];

  uint64_t v24 = [(PLBBMav16HwRfLTELogMsg *)self sleepStateConnCnt];
  [v5 setObject:v24 forKeyedSubscript:@"SleepStateConnArr"];

  v25 = [(PLBBMav16HwRfLTELogMsg *)self rsrpIdleCnt];
  [v5 setObject:v25 forKeyedSubscript:@"RfRSRPIdleArr"];

  v26 = [(PLBBMav16HwRfLTELogMsg *)self rsrpConnCnt];
  [v5 setObject:v26 forKeyedSubscript:@"RfRSRPConnArr"];

  v27 = [(PLBBMav16HwRfLTELogMsg *)self sinrIdleCnt];
  [v5 setObject:v27 forKeyedSubscript:@"RfSINRIdleArr"];

  v28 = [(PLBBMav16HwRfLTELogMsg *)self sinrConnCnt];
  [v5 setObject:v28 forKeyedSubscript:@"RfSINRConnArr"];

  uint64_t v29 = [(PLBBMav16HwRfLTELogMsg *)self arxStateCnt];
  [v5 setObject:v29 forKeyedSubscript:@"RfARXArr"];

  v30 = [(PLBBMav16HwRfLTELogMsg *)self nlicStateCnt];
  [v5 setObject:v30 forKeyedSubscript:@"RfNLICArr"];

  v31 = [(PLBBMav16HwRfLTELogMsg *)self bpeStats];
  [v5 setObject:v31 forKeyedSubscript:@"RfBPEArr"];

  v32 = [(PLBBMav16HwRfLTELogMsg *)self ardRxDOff];
  [v5 setObject:v32 forKeyedSubscript:@"ARD_RxD_Off_Duration"];

  uint64_t v33 = [(PLBBMav16HwRfLTELogMsg *)self uSleepPCCCnt];
  [v5 setObject:v33 forKeyedSubscript:@"uSleep_PCC"];

  id v34 = [(PLBBMav16HwRfLTELogMsg *)self uSleepSCC1Cnt];
  [v5 setObject:v34 forKeyedSubscript:@"uSleep_SCC1"];

  uint64_t v35 = [(PLBBMav16HwRfLTELogMsg *)self uSleepSCC2Cnt];
  [v5 setObject:v35 forKeyedSubscript:@"uSleep_SCC2"];

  v36 = [(PLBBMav16HwRfLTELogMsg *)self hsicPCC];
  [v5 setObject:v36 forKeyedSubscript:@"HSIC_PCC_OffOn"];

  v37 = [(PLBBMav16HwRfLTELogMsg *)self hsicSCC1];
  [v5 setObject:v37 forKeyedSubscript:@"HSIC_SCC1_OffOn"];

  v38 = [(PLBBMav16HwRfLTELogMsg *)self hsicSCC2];
  [v5 setObject:v38 forKeyedSubscript:@"HSIC_SCC2_OffOn"];

  v39 = [(PLBBMav16HwRfLTELogMsg *)self arxOffPCC];
  [v5 setObject:v39 forKeyedSubscript:@"PCC_ARX_Off"];

  v40 = [(PLBBMav16HwRfLTELogMsg *)self arxOffSCC1];
  [v5 setObject:v40 forKeyedSubscript:@"SCC1_ARX_Off"];

  v41 = [(PLBBMav16HwRfLTELogMsg *)self arxOffSCC2];
  [v5 setObject:v41 forKeyedSubscript:@"SCC2_ARX_Off"];

  v42 = [(PLBBMav16HwRfLTELogMsg *)self arxBaselinePCC];
  [v5 setObject:v42 forKeyedSubscript:@"PCC_ARX_Baseline"];

  v43 = [(PLBBMav16HwRfLTELogMsg *)self arxBaselineSCC1];
  [v5 setObject:v43 forKeyedSubscript:@"SCC1_ARX_Baseline"];

  id v44 = [(PLBBMav16HwRfLTELogMsg *)self arxBaselineSCC2];
  [v5 setObject:v44 forKeyedSubscript:@"SCC2_ARX_Baseline"];

  id v45 = [(PLBBMav16HwRfLTELogMsg *)self arxQicePCC];
  [v5 setObject:v45 forKeyedSubscript:@"PCC_ARX_QICE"];

  v46 = [(PLBBMav16HwRfLTELogMsg *)self arxQiceSCC1];
  [v5 setObject:v46 forKeyedSubscript:@"SCC1_ARX_QICE"];

  id v47 = [(PLBBMav16HwRfLTELogMsg *)self arxQiceSCC2];
  [v5 setObject:v47 forKeyedSubscript:@"SCC2_ARX_QICE"];
}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setError:(id)a3
{
}

- (NSArray)dlTBSzCnt
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDlTBSzCnt:(id)a3
{
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLogDuration:(id)a3
{
}

- (NSNumber)dupMode
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDupMode:(id)a3
{
}

- (NSNumber)PCCFreq
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPCCFreq:(id)a3
{
}

- (NSNumber)PCCBw
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPCCBw:(id)a3
{
}

- (NSNumber)SCC1Freq
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSCC1Freq:(id)a3
{
}

- (NSNumber)SCC1Bw
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSCC1Bw:(id)a3
{
}

- (NSNumber)SCC2Freq
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSCC2Freq:(id)a3
{
}

- (NSNumber)SCC2Bw
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSCC2Bw:(id)a3
{
}

- (NSArray)txPwrCnt
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTxPwrCnt:(id)a3
{
}

- (NSArray)caSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCaSCCCnt:(id)a3
{
}

- (NSArray)ulCaSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUlCaSCCCnt:(id)a3
{
}

- (NSArray)actRxTxCnt
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setActRxTxCnt:(id)a3
{
}

- (NSArray)sleepStateIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSleepStateIdleCnt:(id)a3
{
}

- (NSArray)sleepStateConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSleepStateConnCnt:(id)a3
{
}

- (NSArray)rsrpIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRsrpIdleCnt:(id)a3
{
}

- (NSArray)rsrpConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setRsrpConnCnt:(id)a3
{
}

- (NSArray)sinrIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSinrIdleCnt:(id)a3
{
}

- (NSArray)sinrConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSinrConnCnt:(id)a3
{
}

- (NSArray)arxStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setArxStateCnt:(id)a3
{
}

- (NSArray)nlicStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setNlicStateCnt:(id)a3
{
}

- (NSArray)bpeStats
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setBpeStats:(id)a3
{
}

- (NSNumber)ardRxDOff
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setArdRxDOff:(id)a3
{
}

- (NSNumber)uSleepPCCCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setUSleepPCCCnt:(id)a3
{
}

- (NSNumber)uSleepSCC1Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setUSleepSCC1Cnt:(id)a3
{
}

- (NSNumber)uSleepSCC2Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setUSleepSCC2Cnt:(id)a3
{
}

- (NSArray)hsicPCC
{
  return (NSArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setHsicPCC:(id)a3
{
}

- (NSArray)hsicSCC1
{
  return (NSArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setHsicSCC1:(id)a3
{
}

- (NSArray)hsicSCC2
{
  return (NSArray *)objc_getProperty(self, a2, 312, 1);
}

- (void)setHsicSCC2:(id)a3
{
}

- (NSNumber)arxOffPCC
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setArxOffPCC:(id)a3
{
}

- (NSNumber)arxOffSCC1
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setArxOffSCC1:(id)a3
{
}

- (NSNumber)arxOffSCC2
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setArxOffSCC2:(id)a3
{
}

- (NSArray)arxBaselinePCC
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (void)setArxBaselinePCC:(id)a3
{
}

- (NSArray)arxBaselineSCC1
{
  return (NSArray *)objc_getProperty(self, a2, 352, 1);
}

- (void)setArxBaselineSCC1:(id)a3
{
}

- (NSArray)arxBaselineSCC2
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setArxBaselineSCC2:(id)a3
{
}

- (NSArray)arxQicePCC
{
  return (NSArray *)objc_getProperty(self, a2, 368, 1);
}

- (void)setArxQicePCC:(id)a3
{
}

- (NSArray)arxQiceSCC1
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (void)setArxQiceSCC1:(id)a3
{
}

- (NSArray)arxQiceSCC2
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setArxQiceSCC2:(id)a3
{
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setGroupEntryKey:(id)a3
{
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 408, 1);
}

- (void)setGroupArrEntries:(id)a3
{
}

- (unsigned)inited
{
  return self->_inited;
}

- (void)setInited:(unsigned __int8)a3
{
  self->_inited = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvPairs, 0);
  objc_storeStrong((id *)&self->_commonInfo, 0);
  objc_storeStrong((id *)&self->_groupArrEntries, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_groupEntryKey, 0);
  objc_storeStrong((id *)&self->_arxQiceSCC2, 0);
  objc_storeStrong((id *)&self->_arxQiceSCC1, 0);
  objc_storeStrong((id *)&self->_arxQicePCC, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC2, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC1, 0);
  objc_storeStrong((id *)&self->_arxBaselinePCC, 0);
  objc_storeStrong((id *)&self->_arxOffSCC2, 0);
  objc_storeStrong((id *)&self->_arxOffSCC1, 0);
  objc_storeStrong((id *)&self->_arxOffPCC, 0);
  objc_storeStrong((id *)&self->_hsicSCC2, 0);
  objc_storeStrong((id *)&self->_hsicSCC1, 0);
  objc_storeStrong((id *)&self->_hsicPCC, 0);
  objc_storeStrong((id *)&self->_uSleepSCC2Cnt, 0);
  objc_storeStrong((id *)&self->_uSleepSCC1Cnt, 0);
  objc_storeStrong((id *)&self->_uSleepPCCCnt, 0);
  objc_storeStrong((id *)&self->_ardRxDOff, 0);
  objc_storeStrong((id *)&self->_bpeStats, 0);
  objc_storeStrong((id *)&self->_nlicStateCnt, 0);
  objc_storeStrong((id *)&self->_arxStateCnt, 0);
  objc_storeStrong((id *)&self->_sinrConnCnt, 0);
  objc_storeStrong((id *)&self->_sinrIdleCnt, 0);
  objc_storeStrong((id *)&self->_rsrpConnCnt, 0);
  objc_storeStrong((id *)&self->_rsrpIdleCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateConnCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateIdleCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxCnt, 0);
  objc_storeStrong((id *)&self->_ulCaSCCCnt, 0);
  objc_storeStrong((id *)&self->_caSCCCnt, 0);
  objc_storeStrong((id *)&self->_txPwrCnt, 0);
  objc_storeStrong((id *)&self->_SCC2Bw, 0);
  objc_storeStrong((id *)&self->_SCC2Freq, 0);
  objc_storeStrong((id *)&self->_SCC1Bw, 0);
  objc_storeStrong((id *)&self->_SCC1Freq, 0);
  objc_storeStrong((id *)&self->_PCCBw, 0);
  objc_storeStrong((id *)&self->_PCCFreq, 0);
  objc_storeStrong((id *)&self->_dupMode, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_dlTBSzCnt, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end