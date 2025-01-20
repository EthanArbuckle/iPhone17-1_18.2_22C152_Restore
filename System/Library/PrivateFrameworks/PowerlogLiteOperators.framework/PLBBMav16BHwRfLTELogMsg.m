@interface PLBBMav16BHwRfLTELogMsg
+ (id)entryEventBackwardDefinitionBBMav16BHwRfLTE;
- (NSArray)actRxTxCnt;
- (NSArray)arxStateCnt;
- (NSArray)bpeStats;
- (NSArray)caSCCCnt;
- (NSArray)dlTBSzCnt;
- (NSArray)hsicPCC;
- (NSArray)hsicSCC1;
- (NSArray)hsicSCC2;
- (NSArray)hsicSCC3;
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
- (NSNumber)SCC3Bw;
- (NSNumber)SCC3Freq;
- (NSNumber)ardRxDOff;
- (NSNumber)arxBaselinePCC;
- (NSNumber)arxBaselineSCC1;
- (NSNumber)arxBaselineSCC2;
- (NSNumber)arxBaselineSCC3;
- (NSNumber)arxOffPCC;
- (NSNumber)arxOffSCC1;
- (NSNumber)arxOffSCC2;
- (NSNumber)arxOffSCC3;
- (NSNumber)arxQicePCC;
- (NSNumber)arxQiceSCC1;
- (NSNumber)arxQiceSCC2;
- (NSNumber)arxQiceSCC3;
- (NSNumber)dupMode;
- (NSNumber)logDuration;
- (NSNumber)uSleepPCCCnt;
- (NSNumber)uSleepSCC1Cnt;
- (NSNumber)uSleepSCC2Cnt;
- (NSNumber)uSleepSCC3Cnt;
- (NSString)error;
- (NSString)groupEntryKey;
- (NSString)groupID;
- (PLBBMav16BHwRfLTELogMsg)init;
- (id)logEventBackwardBBMav16BHwRfLTE;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)populateMav16BEntry:(id)a3;
- (void)refreshMav16BBBRfLTE;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setActRxTxCnt:(id)a3;
- (void)setArdRxDOff:(id)a3;
- (void)setArxBaselinePCC:(id)a3;
- (void)setArxBaselineSCC1:(id)a3;
- (void)setArxBaselineSCC2:(id)a3;
- (void)setArxBaselineSCC3:(id)a3;
- (void)setArxOffPCC:(id)a3;
- (void)setArxOffSCC1:(id)a3;
- (void)setArxOffSCC2:(id)a3;
- (void)setArxOffSCC3:(id)a3;
- (void)setArxQicePCC:(id)a3;
- (void)setArxQiceSCC1:(id)a3;
- (void)setArxQiceSCC2:(id)a3;
- (void)setArxQiceSCC3:(id)a3;
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
- (void)setHsicSCC3:(id)a3;
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
- (void)setSCC3Bw:(id)a3;
- (void)setSCC3Freq:(id)a3;
- (void)setSinrConnCnt:(id)a3;
- (void)setSinrIdleCnt:(id)a3;
- (void)setSleepStateConnCnt:(id)a3;
- (void)setSleepStateIdleCnt:(id)a3;
- (void)setTxPwrCnt:(id)a3;
- (void)setUSleepPCCCnt:(id)a3;
- (void)setUSleepSCC1Cnt:(id)a3;
- (void)setUSleepSCC2Cnt:(id)a3;
- (void)setUSleepSCC3Cnt:(id)a3;
- (void)setUlCaSCCCnt:(id)a3;
@end

@implementation PLBBMav16BHwRfLTELogMsg

- (PLBBMav16BHwRfLTELogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__PLBBMav16BHwRfLTELogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD57C98 != -1) {
      dispatch_once(&qword_1EBD57C98, block);
    }
    if (_MergedGlobals_1_15)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwRfLTELogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg init]"];
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
  v16.super_class = (Class)PLBBMav16BHwRfLTELogMsg;
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

uint64_t __31__PLBBMav16BHwRfLTELogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_15 = result;
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
    block[2] = __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD57CA0 != -1) {
      dispatch_once(&qword_1EBD57CA0, block);
    }
    if (byte_1EBD57C89)
    {
      id v12 = v10;
      id v13 = v9;
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v15 = (void *)MEMORY[0x1E4F929B8];
      objc_super v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
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
    v47[2] = __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v20;
    if (qword_1EBD57CA8 != -1) {
      dispatch_once(&qword_1EBD57CA8, v47);
    }
    if (byte_1EBD57C8A)
    {
      id v21 = v10;
      id v44 = v10;
      id v22 = v9;
      v23 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v9, v44];
      v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
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
    v46[2] = __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_378;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v33;
    if (qword_1EBD57CB0 != -1) {
      dispatch_once(&qword_1EBD57CB0, v46);
    }
    if (byte_1EBD57C8B)
    {
      id v45 = v10;
      id v34 = v9;
      v35 = [NSString stringWithFormat:@"Bad agent"];
      v36 = (void *)MEMORY[0x1E4F929B8];
      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
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

uint64_t __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C89 = result;
  return result;
}

uint64_t __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C8A = result;
  return result;
}

uint64_t __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_378(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C8B = result;
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
    block[2] = __66__PLBBMav16BHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD57CB8 != -1) {
      dispatch_once(&qword_1EBD57CB8, block);
    }
    if (byte_1EBD57C8C)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      id v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
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
    v25[2] = __66__PLBBMav16BHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_384;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD57CC0 != -1) {
      dispatch_once(&qword_1EBD57CC0, v25);
    }
    if (byte_1EBD57C8D)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      id v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
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

uint64_t __66__PLBBMav16BHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C8C = result;
  return result;
}

uint64_t __66__PLBBMav16BHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_384(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C8D = result;
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
    block[2] = __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD57CC8 != -1) {
      dispatch_once(&qword_1EBD57CC8, block);
    }
    if (byte_1EBD57C8E)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwRfLTELogMsg addPairWithKey:andWithVal:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg addPairWithKey:andWithVal:]"];
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
      v30[2] = __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_397;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD57CD8 != -1) {
        dispatch_once(&qword_1EBD57CD8, v30);
      }
      if (byte_1EBD57C90)
      {
        v17 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
        uint64_t v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg addPairWithKey:andWithVal:]"];
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
    v23 = [(PLBBMav16BHwRfLTELogMsg *)self kvPairs];
    [v23 setObject:v7 forKey:v6];
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_391;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD57CD0 != -1) {
      dispatch_once(&qword_1EBD57CD0, v31);
    }
    if (byte_1EBD57C8F)
    {
      v23 = [NSString stringWithFormat:@"Error: nil key for kvPair not expected, return"];
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg addPairWithKey:andWithVal:]"];
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

uint64_t __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C8E = result;
  return result;
}

uint64_t __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C8F = result;
  return result;
}

uint64_t __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_397(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C90 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMav16BHwRfLTE
{
  v123[2] = *MEMORY[0x1E4F143B8];
  v122[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v120[0] = *MEMORY[0x1E4F92CD0];
  v120[1] = v2;
  v121[0] = &unk_1F29F04D0;
  v121[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v120[2] = *MEMORY[0x1E4F92CB0];
  v120[3] = v3;
  v121[2] = @"refreshMav16BBBRfLTE";
  v121[3] = MEMORY[0x1E4F1CC38];
  v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:4];
  v123[0] = v84;
  v122[1] = *MEMORY[0x1E4F92CA8];
  v118[0] = @"SeqNum";
  v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
  v119[0] = v82;
  v118[1] = @"BBDate";
  v81 = [MEMORY[0x1E4F929D8] sharedInstance];
  v80 = objc_msgSend(v81, "commonTypeDict_DateFormat");
  v119[1] = v80;
  v118[2] = @"LogDuration";
  v79 = [MEMORY[0x1E4F929D8] sharedInstance];
  v78 = objc_msgSend(v79, "commonTypeDict_RealFormat");
  v119[2] = v78;
  v118[3] = @"DupMode";
  v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_IntegerFormat");
  v119[3] = v76;
  v118[4] = @"PCC_Band";
  v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  v74 = objc_msgSend(v75, "commonTypeDict_IntegerFormat");
  v119[4] = v74;
  v118[5] = @"PCC_BW";
  v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_IntegerFormat");
  v119[5] = v72;
  v118[6] = @"SCC1_Band";
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v119[6] = v70;
  v118[7] = @"SCC1_BW";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v119[7] = v68;
  v118[8] = @"SCC2_Band";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v119[8] = v66;
  v118[9] = @"SCC2_BW";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v119[9] = v64;
  v118[10] = @"SCC3_Band";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v119[10] = v62;
  v118[11] = @"SCC3_BW";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v119[11] = v60;
  v118[12] = @"DLTBSzArr";
  uint64_t v5 = *MEMORY[0x1E4F92D00];
  v115[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v115[0];
  v115[1] = v5;
  v117[0] = &unk_1F29E4EB8;
  v117[1] = &unk_1F29E4ED0;
  uint64_t v116 = *MEMORY[0x1E4F92D08];
  uint64_t v6 = v116;
  v117[2] = &unk_1F29E4EE8;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v115 count:3];
  v119[12] = v59;
  v118[13] = @"TxPwrBktArr";
  v113[0] = v4;
  v113[1] = v5;
  v114[0] = &unk_1F29E4EB8;
  v114[1] = &unk_1F29E4F00;
  v113[2] = v6;
  v114[2] = &unk_1F29E4EE8;
  v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:3];
  v119[13] = v58;
  v118[14] = @"CASCCStateArr";
  v111[0] = v4;
  v111[1] = v5;
  v112[0] = &unk_1F29E4EB8;
  v112[1] = &unk_1F29E4F18;
  v111[2] = v6;
  v112[2] = &unk_1F29E4EE8;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:3];
  v119[14] = v57;
  v118[15] = @"ULCACStateArr";
  v109[0] = v4;
  v109[1] = v5;
  v110[0] = &unk_1F29E4EB8;
  v110[1] = &unk_1F29E4F30;
  v109[2] = v6;
  v110[2] = &unk_1F29E4EE8;
  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:3];
  v119[15] = v56;
  v118[16] = @"kRfActRxTxArr";
  v107[0] = v4;
  v107[1] = v5;
  v108[0] = &unk_1F29E4EB8;
  v108[1] = &unk_1F29E4F48;
  v107[2] = v6;
  v108[2] = &unk_1F29E4EE8;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];
  v119[16] = v55;
  v118[17] = @"SleepStateIdleArr";
  v105[0] = v4;
  v105[1] = v5;
  v106[0] = &unk_1F29E4EB8;
  v106[1] = &unk_1F29E4F60;
  v105[2] = v6;
  v106[2] = &unk_1F29E4EE8;
  v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:3];
  v119[17] = v54;
  v118[18] = @"SleepStateConnArr";
  v103[0] = v4;
  v103[1] = v5;
  v104[0] = &unk_1F29E4EB8;
  v104[1] = &unk_1F29E4F60;
  v103[2] = v6;
  v104[2] = &unk_1F29E4EE8;
  v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:3];
  v119[18] = v53;
  v118[19] = @"RfRSRPIdleArr";
  v101[0] = v4;
  v101[1] = v5;
  v102[0] = &unk_1F29E4EB8;
  v102[1] = &unk_1F29E4F48;
  v101[2] = v6;
  v102[2] = &unk_1F29E4EE8;
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:3];
  v119[19] = v52;
  v118[20] = @"RfRSRPConnArr";
  v99[0] = v4;
  v99[1] = v5;
  v100[0] = &unk_1F29E4EB8;
  v100[1] = &unk_1F29E4F48;
  v99[2] = v6;
  v100[2] = &unk_1F29E4EE8;
  uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];
  v119[20] = v51;
  v118[21] = @"RfSINRIdleArr";
  v97[0] = v4;
  v97[1] = v5;
  v98[0] = &unk_1F29E4EB8;
  v98[1] = &unk_1F29E4F48;
  v97[2] = v6;
  v98[2] = &unk_1F29E4EE8;
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:3];
  v119[21] = v50;
  v118[22] = @"RfSINRConnArr";
  v95[0] = v4;
  v95[1] = v5;
  v96[0] = &unk_1F29E4EB8;
  v96[1] = &unk_1F29E4F48;
  v95[2] = v6;
  v96[2] = &unk_1F29E4EE8;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:3];
  v119[22] = v49;
  v118[23] = @"RfNLICArr";
  v93[0] = v4;
  v93[1] = v5;
  v94[0] = &unk_1F29E4EB8;
  v94[1] = &unk_1F29E4F30;
  v93[2] = v6;
  v94[2] = &unk_1F29E4EE8;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:3];
  v119[23] = v48;
  v118[24] = @"ARD_RxD_Off_Duration";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v119[24] = v46;
  v118[25] = @"uSleep_PCC";
  id v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v119[25] = v44;
  v118[26] = @"uSleep_SCC1";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v119[26] = v42;
  v118[27] = @"uSleep_SCC2";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v119[27] = v40;
  v118[28] = @"uSleep_SCC3";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v119[28] = v38;
  v118[29] = @"HSIC_PCC_OffOn";
  v91[0] = v4;
  v91[1] = v5;
  v92[0] = &unk_1F29E4EB8;
  v92[1] = &unk_1F29E4F78;
  v91[2] = v6;
  v92[2] = &unk_1F29E4EE8;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:3];
  v119[29] = v37;
  v118[30] = @"HSIC_SCC1_OffOn";
  v89[0] = v4;
  v89[1] = v5;
  v90[0] = &unk_1F29E4EB8;
  v90[1] = &unk_1F29E4F78;
  v89[2] = v6;
  v90[2] = &unk_1F29E4EE8;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:3];
  v119[30] = v36;
  v118[31] = @"HSIC_SCC2_OffOn";
  v87[0] = v4;
  v87[1] = v5;
  v88[0] = &unk_1F29E4EB8;
  v88[1] = &unk_1F29E4F78;
  v87[2] = v6;
  v88[2] = &unk_1F29E4EE8;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:3];
  v119[31] = v35;
  v118[32] = @"HSIC_SCC3_OffOn";
  v85[0] = v4;
  v85[1] = v5;
  v86[0] = &unk_1F29E4EB8;
  v86[1] = &unk_1F29E4F78;
  v85[2] = v6;
  v86[2] = &unk_1F29E4EE8;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:3];
  v119[32] = v34;
  v118[33] = @"PCC_ARX_Off";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v119[33] = v32;
  v118[34] = @"SCC1_ARX_Off";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v119[34] = v30;
  v118[35] = @"SCC2_ARX_Off";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v119[35] = v28;
  v118[36] = @"SCC3_ARX_Off";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v119[36] = v26;
  v118[37] = @"PCC_ARX_Baseline";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v119[37] = v24;
  v118[38] = @"SCC1_ARX_Baseline";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v119[38] = v22;
  v118[39] = @"SCC2_ARX_Baseline";
  id v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v119[39] = v20;
  v118[40] = @"SCC3_ARX_Baseline";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v119[40] = v18;
  v118[41] = @"PCC_ARX_QICE";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v119[41] = v8;
  v118[42] = @"SCC1_ARX_QICE";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v119[42] = v10;
  v118[43] = @"SCC2_ARX_QICE";
  uint64_t v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v119[43] = v12;
  v118[44] = @"SCC3_ARX_QICE";
  id v13 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v119[44] = v14;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:45];
  v123[1] = v15;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:2];

  return v17;
}

- (void)refreshMav16BBBRfLTE
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMav16BHwRfLTE
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __58__PLBBMav16BHwRfLTELogMsg_logEventBackwardBBMav16BHwRfLTE__block_invoke;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v3;
    if (qword_1EBD57CE0 != -1) {
      dispatch_once(&qword_1EBD57CE0, &block);
    }
    if (byte_1EBD57C91)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwRfLTELogMsg logEventBackwardBBMav16BHwRfLTE]", block, v15, v16, v17, v18);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMav16BHwRfLTELogMsg logEventBackwardBBMav16BHwRfLTE]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:264];

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
  [(PLBBMav16BHwRfLTELogMsg *)self populateMav16BEntry:v11];
  v19[0] = @"entry";
  v19[1] = @"entryKey";
  v20[0] = v11;
  v20[1] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

uint64_t __58__PLBBMav16BHwRfLTELogMsg_logEventBackwardBBMav16BHwRfLTE__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57C91 = result;
  return result;
}

- (void)populateMav16BEntry:(id)a3
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

  uint64_t v10 = [(PLBBMav16BHwRfLTELogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  uint64_t v11 = [(PLBBMav16BHwRfLTELogMsg *)self dupMode];
  [v5 setObject:v11 forKeyedSubscript:@"DupMode"];

  id v12 = [(PLBBMav16BHwRfLTELogMsg *)self PCCFreq];
  [v5 setObject:v12 forKeyedSubscript:@"PCC_Band"];

  id v13 = [(PLBBMav16BHwRfLTELogMsg *)self PCCBw];
  [v5 setObject:v13 forKeyedSubscript:@"PCC_BW"];

  v14 = [(PLBBMav16BHwRfLTELogMsg *)self SCC1Freq];
  [v5 setObject:v14 forKeyedSubscript:@"SCC1_Band"];

  uint64_t v15 = [(PLBBMav16BHwRfLTELogMsg *)self SCC1Bw];
  [v5 setObject:v15 forKeyedSubscript:@"SCC1_BW"];

  uint64_t v16 = [(PLBBMav16BHwRfLTELogMsg *)self SCC2Freq];
  [v5 setObject:v16 forKeyedSubscript:@"SCC2_Band"];

  id v17 = [(PLBBMav16BHwRfLTELogMsg *)self SCC2Bw];
  [v5 setObject:v17 forKeyedSubscript:@"SCC2_BW"];

  uint64_t v18 = [(PLBBMav16BHwRfLTELogMsg *)self SCC3Freq];
  [v5 setObject:v18 forKeyedSubscript:@"SCC3_Band"];

  uint64_t v19 = [(PLBBMav16BHwRfLTELogMsg *)self SCC3Bw];
  [v5 setObject:v19 forKeyedSubscript:@"SCC3_BW"];

  uint64_t v20 = [(PLBBMav16BHwRfLTELogMsg *)self dlTBSzCnt];
  [v5 setObject:v20 forKeyedSubscript:@"DLTBSzArr"];

  id v21 = [(PLBBMav16BHwRfLTELogMsg *)self txPwrCnt];
  [v5 setObject:v21 forKeyedSubscript:@"TxPwrBktArr"];

  id v22 = [(PLBBMav16BHwRfLTELogMsg *)self caSCCCnt];
  [v5 setObject:v22 forKeyedSubscript:@"CASCCStateArr"];

  uint64_t v23 = [(PLBBMav16BHwRfLTELogMsg *)self ulCaSCCCnt];
  [v5 setObject:v23 forKeyedSubscript:@"ULCACStateArr"];

  uint64_t v24 = [(PLBBMav16BHwRfLTELogMsg *)self actRxTxCnt];
  [v5 setObject:v24 forKeyedSubscript:@"kRfActRxTxArr"];

  v25 = [(PLBBMav16BHwRfLTELogMsg *)self sleepStateIdleCnt];
  [v5 setObject:v25 forKeyedSubscript:@"SleepStateIdleArr"];

  v26 = [(PLBBMav16BHwRfLTELogMsg *)self sleepStateConnCnt];
  [v5 setObject:v26 forKeyedSubscript:@"SleepStateConnArr"];

  v27 = [(PLBBMav16BHwRfLTELogMsg *)self rsrpIdleCnt];
  [v5 setObject:v27 forKeyedSubscript:@"RfRSRPIdleArr"];

  v28 = [(PLBBMav16BHwRfLTELogMsg *)self rsrpConnCnt];
  [v5 setObject:v28 forKeyedSubscript:@"RfRSRPConnArr"];

  uint64_t v29 = [(PLBBMav16BHwRfLTELogMsg *)self sinrIdleCnt];
  [v5 setObject:v29 forKeyedSubscript:@"RfSINRIdleArr"];

  v30 = [(PLBBMav16BHwRfLTELogMsg *)self sinrConnCnt];
  [v5 setObject:v30 forKeyedSubscript:@"RfSINRConnArr"];

  v31 = [(PLBBMav16BHwRfLTELogMsg *)self arxStateCnt];
  [v5 setObject:v31 forKeyedSubscript:@"RfARXArr"];

  v32 = [(PLBBMav16BHwRfLTELogMsg *)self nlicStateCnt];
  [v5 setObject:v32 forKeyedSubscript:@"RfNLICArr"];

  uint64_t v33 = [(PLBBMav16BHwRfLTELogMsg *)self bpeStats];
  [v5 setObject:v33 forKeyedSubscript:@"RfBPEArr"];

  id v34 = [(PLBBMav16BHwRfLTELogMsg *)self ardRxDOff];
  [v5 setObject:v34 forKeyedSubscript:@"ARD_RxD_Off_Duration"];

  uint64_t v35 = [(PLBBMav16BHwRfLTELogMsg *)self uSleepPCCCnt];
  [v5 setObject:v35 forKeyedSubscript:@"uSleep_PCC"];

  v36 = [(PLBBMav16BHwRfLTELogMsg *)self uSleepSCC1Cnt];
  [v5 setObject:v36 forKeyedSubscript:@"uSleep_SCC1"];

  v37 = [(PLBBMav16BHwRfLTELogMsg *)self uSleepSCC2Cnt];
  [v5 setObject:v37 forKeyedSubscript:@"uSleep_SCC2"];

  v38 = [(PLBBMav16BHwRfLTELogMsg *)self uSleepSCC3Cnt];
  [v5 setObject:v38 forKeyedSubscript:@"uSleep_SCC3"];

  v39 = [(PLBBMav16BHwRfLTELogMsg *)self hsicPCC];
  [v5 setObject:v39 forKeyedSubscript:@"HSIC_PCC_OffOn"];

  v40 = [(PLBBMav16BHwRfLTELogMsg *)self hsicSCC1];
  [v5 setObject:v40 forKeyedSubscript:@"HSIC_SCC1_OffOn"];

  v41 = [(PLBBMav16BHwRfLTELogMsg *)self hsicSCC2];
  [v5 setObject:v41 forKeyedSubscript:@"HSIC_SCC2_OffOn"];

  v42 = [(PLBBMav16BHwRfLTELogMsg *)self hsicSCC3];
  [v5 setObject:v42 forKeyedSubscript:@"HSIC_SCC3_OffOn"];

  v43 = [(PLBBMav16BHwRfLTELogMsg *)self arxOffPCC];
  [v5 setObject:v43 forKeyedSubscript:@"PCC_ARX_Off"];

  id v44 = [(PLBBMav16BHwRfLTELogMsg *)self arxOffSCC1];
  [v5 setObject:v44 forKeyedSubscript:@"SCC1_ARX_Off"];

  id v45 = [(PLBBMav16BHwRfLTELogMsg *)self arxOffSCC2];
  [v5 setObject:v45 forKeyedSubscript:@"SCC2_ARX_Off"];

  v46 = [(PLBBMav16BHwRfLTELogMsg *)self arxOffSCC3];
  [v5 setObject:v46 forKeyedSubscript:@"SCC3_ARX_Off"];

  v47 = [(PLBBMav16BHwRfLTELogMsg *)self arxBaselinePCC];
  [v5 setObject:v47 forKeyedSubscript:@"PCC_ARX_Baseline"];

  v48 = [(PLBBMav16BHwRfLTELogMsg *)self arxBaselineSCC1];
  [v5 setObject:v48 forKeyedSubscript:@"SCC1_ARX_Baseline"];

  v49 = [(PLBBMav16BHwRfLTELogMsg *)self arxBaselineSCC2];
  [v5 setObject:v49 forKeyedSubscript:@"SCC2_ARX_Baseline"];

  v50 = [(PLBBMav16BHwRfLTELogMsg *)self arxBaselineSCC3];
  [v5 setObject:v50 forKeyedSubscript:@"SCC3_ARX_Baseline"];

  uint64_t v51 = [(PLBBMav16BHwRfLTELogMsg *)self arxQicePCC];
  [v5 setObject:v51 forKeyedSubscript:@"PCC_ARX_QICE"];

  v52 = [(PLBBMav16BHwRfLTELogMsg *)self arxQiceSCC1];
  [v5 setObject:v52 forKeyedSubscript:@"SCC1_ARX_QICE"];

  v53 = [(PLBBMav16BHwRfLTELogMsg *)self arxQiceSCC2];
  [v5 setObject:v53 forKeyedSubscript:@"SCC2_ARX_QICE"];

  id v54 = [(PLBBMav16BHwRfLTELogMsg *)self arxQiceSCC3];
  [v5 setObject:v54 forKeyedSubscript:@"SCC3_ARX_QICE"];
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

- (NSNumber)SCC3Freq
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSCC3Freq:(id)a3
{
}

- (NSNumber)SCC3Bw
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSCC3Bw:(id)a3
{
}

- (NSArray)txPwrCnt
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTxPwrCnt:(id)a3
{
}

- (NSArray)caSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCaSCCCnt:(id)a3
{
}

- (NSArray)ulCaSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setUlCaSCCCnt:(id)a3
{
}

- (NSArray)actRxTxCnt
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setActRxTxCnt:(id)a3
{
}

- (NSArray)sleepStateIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSleepStateIdleCnt:(id)a3
{
}

- (NSArray)sleepStateConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSleepStateConnCnt:(id)a3
{
}

- (NSArray)rsrpIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRsrpIdleCnt:(id)a3
{
}

- (NSArray)rsrpConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRsrpConnCnt:(id)a3
{
}

- (NSArray)sinrIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSinrIdleCnt:(id)a3
{
}

- (NSArray)sinrConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSinrConnCnt:(id)a3
{
}

- (NSArray)arxStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setArxStateCnt:(id)a3
{
}

- (NSArray)nlicStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setNlicStateCnt:(id)a3
{
}

- (NSArray)bpeStats
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setBpeStats:(id)a3
{
}

- (NSNumber)ardRxDOff
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setArdRxDOff:(id)a3
{
}

- (NSNumber)uSleepPCCCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setUSleepPCCCnt:(id)a3
{
}

- (NSNumber)uSleepSCC1Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 296, 1);
}

- (void)setUSleepSCC1Cnt:(id)a3
{
}

- (NSNumber)uSleepSCC2Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setUSleepSCC2Cnt:(id)a3
{
}

- (NSNumber)uSleepSCC3Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setUSleepSCC3Cnt:(id)a3
{
}

- (NSArray)hsicPCC
{
  return (NSArray *)objc_getProperty(self, a2, 320, 1);
}

- (void)setHsicPCC:(id)a3
{
}

- (NSArray)hsicSCC1
{
  return (NSArray *)objc_getProperty(self, a2, 328, 1);
}

- (void)setHsicSCC1:(id)a3
{
}

- (NSArray)hsicSCC2
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setHsicSCC2:(id)a3
{
}

- (NSArray)hsicSCC3
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (void)setHsicSCC3:(id)a3
{
}

- (NSNumber)arxOffPCC
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setArxOffPCC:(id)a3
{
}

- (NSNumber)arxOffSCC1
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setArxOffSCC1:(id)a3
{
}

- (NSNumber)arxOffSCC2
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setArxOffSCC2:(id)a3
{
}

- (NSNumber)arxOffSCC3
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setArxOffSCC3:(id)a3
{
}

- (NSNumber)arxBaselinePCC
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setArxBaselinePCC:(id)a3
{
}

- (NSNumber)arxBaselineSCC1
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setArxBaselineSCC1:(id)a3
{
}

- (NSNumber)arxBaselineSCC2
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setArxBaselineSCC2:(id)a3
{
}

- (NSNumber)arxBaselineSCC3
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setArxBaselineSCC3:(id)a3
{
}

- (NSNumber)arxQicePCC
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setArxQicePCC:(id)a3
{
}

- (NSNumber)arxQiceSCC1
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setArxQiceSCC1:(id)a3
{
}

- (NSNumber)arxQiceSCC2
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setArxQiceSCC2:(id)a3
{
}

- (NSNumber)arxQiceSCC3
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setArxQiceSCC3:(id)a3
{
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setGroupEntryKey:(id)a3
{
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 456, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 464, 1);
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
  objc_storeStrong((id *)&self->_arxQiceSCC3, 0);
  objc_storeStrong((id *)&self->_arxQiceSCC2, 0);
  objc_storeStrong((id *)&self->_arxQiceSCC1, 0);
  objc_storeStrong((id *)&self->_arxQicePCC, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC3, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC2, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC1, 0);
  objc_storeStrong((id *)&self->_arxBaselinePCC, 0);
  objc_storeStrong((id *)&self->_arxOffSCC3, 0);
  objc_storeStrong((id *)&self->_arxOffSCC2, 0);
  objc_storeStrong((id *)&self->_arxOffSCC1, 0);
  objc_storeStrong((id *)&self->_arxOffPCC, 0);
  objc_storeStrong((id *)&self->_hsicSCC3, 0);
  objc_storeStrong((id *)&self->_hsicSCC2, 0);
  objc_storeStrong((id *)&self->_hsicSCC1, 0);
  objc_storeStrong((id *)&self->_hsicPCC, 0);
  objc_storeStrong((id *)&self->_uSleepSCC3Cnt, 0);
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
  objc_storeStrong((id *)&self->_SCC3Bw, 0);
  objc_storeStrong((id *)&self->_SCC3Freq, 0);
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