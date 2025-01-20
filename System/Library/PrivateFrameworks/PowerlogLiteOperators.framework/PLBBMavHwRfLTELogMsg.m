@interface PLBBMavHwRfLTELogMsg
+ (id)entryEventBackwardDefinitionBBMav10HwRfLTE;
+ (id)entryEventBackwardDefinitionBBMav13HwRfLTE;
- (NSArray)actRxTxCnt;
- (NSArray)actRxTxPriCCCnt;
- (NSArray)actRxTxPriSecCCCnt;
- (NSArray)actRxTxSecCCCnt;
- (NSArray)arxStateCnt;
- (NSArray)bpeStats;
- (NSArray)caFreqInfo;
- (NSArray)caPriCCCnt;
- (NSArray)caPriSecCCCnt;
- (NSArray)caSCCCnt;
- (NSArray)caSecCCCnt;
- (NSArray)dlC0TBSzCnt;
- (NSArray)dlC1TBSzCnt;
- (NSArray)nlicStateCnt;
- (NSArray)rsrpConnCnt;
- (NSArray)rsrpIdleCnt;
- (NSArray)sinrConnCnt;
- (NSArray)sinrIdleCnt;
- (NSArray)sleepStateCnt;
- (NSArray)sleepStateConnCnt;
- (NSArray)sleepStateIdleCnt;
- (NSArray)txPwrCnt;
- (NSMutableArray)groupArrEntries;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)dupMode;
- (NSNumber)logDuration;
- (NSString)error;
- (NSString)groupEntryKey;
- (NSString)groupID;
- (PLBBMavHwRfLTELogMsg)init;
- (id)logEventBackwardBBMav10HwRfLTE;
- (id)logEventBackwardBBMav13HwRfLTE;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)populateEntry:(id)a3;
- (void)populateMav13Entry:(id)a3;
- (void)refreshMav10BBRfAllRats;
- (void)refreshMav13BBRfLTE;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setActRxTxCnt:(id)a3;
- (void)setActRxTxPriCCCnt:(id)a3;
- (void)setActRxTxPriSecCCCnt:(id)a3;
- (void)setActRxTxSecCCCnt:(id)a3;
- (void)setArxStateCnt:(id)a3;
- (void)setBpeStats:(id)a3;
- (void)setCaFreqInfo:(id)a3;
- (void)setCaPriCCCnt:(id)a3;
- (void)setCaPriSecCCCnt:(id)a3;
- (void)setCaSCCCnt:(id)a3;
- (void)setCaSecCCCnt:(id)a3;
- (void)setCommonInfo:(id)a3;
- (void)setDlC0TBSzCnt:(id)a3;
- (void)setDlC1TBSzCnt:(id)a3;
- (void)setDupMode:(id)a3;
- (void)setError:(id)a3;
- (void)setGroupArrEntries:(id)a3;
- (void)setGroupEntryKey:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setLogDuration:(id)a3;
- (void)setNlicStateCnt:(id)a3;
- (void)setRsrpConnCnt:(id)a3;
- (void)setRsrpIdleCnt:(id)a3;
- (void)setSinrConnCnt:(id)a3;
- (void)setSinrIdleCnt:(id)a3;
- (void)setSleepStateCnt:(id)a3;
- (void)setSleepStateConnCnt:(id)a3;
- (void)setSleepStateIdleCnt:(id)a3;
- (void)setTxPwrCnt:(id)a3;
@end

@implementation PLBBMavHwRfLTELogMsg

- (PLBBMavHwRfLTELogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__PLBBMavHwRfLTELogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5ADE8 != -1) {
      dispatch_once(&qword_1EBD5ADE8, block);
    }
    if (_MergedGlobals_1_64)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfLTELogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg init]"];
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
  v16.super_class = (Class)PLBBMavHwRfLTELogMsg;
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

uint64_t __28__PLBBMavHwRfLTELogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_64 = result;
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
    block[2] = __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD5ADF0 != -1) {
      dispatch_once(&qword_1EBD5ADF0, block);
    }
    if (byte_1EBD5ADD9)
    {
      id v12 = v10;
      id v13 = v9;
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v15 = (void *)MEMORY[0x1E4F929B8];
      objc_super v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
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
    v47[2] = __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v20;
    if (qword_1EBD5ADF8 != -1) {
      dispatch_once(&qword_1EBD5ADF8, v47);
    }
    if (byte_1EBD5ADDA)
    {
      id v21 = v10;
      id v44 = v10;
      id v22 = v9;
      v23 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v9, v44];
      v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
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
    v46[2] = __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_378;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v33;
    if (qword_1EBD5AE00 != -1) {
      dispatch_once(&qword_1EBD5AE00, v46);
    }
    if (byte_1EBD5ADDB)
    {
      id v45 = v10;
      id v34 = v9;
      v35 = [NSString stringWithFormat:@"Bad agent"];
      v36 = (void *)MEMORY[0x1E4F929B8];
      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]"];
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

uint64_t __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADD9 = result;
  return result;
}

uint64_t __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADDA = result;
  return result;
}

uint64_t __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_378(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADDB = result;
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
    block[2] = __63__PLBBMavHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD5AE08 != -1) {
      dispatch_once(&qword_1EBD5AE08, block);
    }
    if (byte_1EBD5ADDC)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      id v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
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
    v25[2] = __63__PLBBMavHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_384;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD5AE10 != -1) {
      dispatch_once(&qword_1EBD5AE10, v25);
    }
    if (byte_1EBD5ADDD)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      id v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
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

uint64_t __63__PLBBMavHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADDC = result;
  return result;
}

uint64_t __63__PLBBMavHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_384(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADDD = result;
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
    block[2] = __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD5AE18 != -1) {
      dispatch_once(&qword_1EBD5AE18, block);
    }
    if (byte_1EBD5ADDE)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfLTELogMsg addPairWithKey:andWithVal:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg addPairWithKey:andWithVal:]"];
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
      v30[2] = __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_397;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD5AE28 != -1) {
        dispatch_once(&qword_1EBD5AE28, v30);
      }
      if (byte_1EBD5ADE0)
      {
        v17 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
        uint64_t v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg addPairWithKey:andWithVal:]"];
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
    v23 = [(PLBBMavHwRfLTELogMsg *)self kvPairs];
    [v23 setObject:v7 forKey:v6];
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_391;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD5AE20 != -1) {
      dispatch_once(&qword_1EBD5AE20, v31);
    }
    if (byte_1EBD5ADDF)
    {
      v23 = [NSString stringWithFormat:@"Error: nil key for kvPair not expected, return"];
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg addPairWithKey:andWithVal:]"];
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

uint64_t __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADDE = result;
  return result;
}

uint64_t __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADDF = result;
  return result;
}

uint64_t __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_397(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADE0 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMav10HwRfLTE
{
  v46[2] = *MEMORY[0x1E4F143B8];
  v45[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v43[0] = *MEMORY[0x1E4F92CD0];
  v43[1] = v2;
  v44[0] = &unk_1F29F1460;
  v44[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v43[2] = *MEMORY[0x1E4F92CB0];
  v43[3] = v3;
  v44[2] = @"refreshRequestHandler";
  v44[3] = MEMORY[0x1E4F1CC38];
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:4];
  v46[0] = v25;
  v45[1] = *MEMORY[0x1E4F92CA8];
  v41[0] = @"SeqNum";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v42[0] = v23;
  v41[1] = @"BBDate";
  id v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v21 = objc_msgSend(v22, "commonTypeDict_DateFormat");
  v42[1] = v21;
  v41[2] = @"LogDuration";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
  v42[2] = v19;
  v41[3] = @"DupMode";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v42[3] = v17;
  v41[4] = @"CAFreqInfo";
  uint64_t v5 = *MEMORY[0x1E4F92D00];
  v38[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v38[0];
  v38[1] = v5;
  v40[0] = &unk_1F29E7F60;
  v40[1] = &unk_1F29E7F78;
  uint64_t v39 = *MEMORY[0x1E4F92D08];
  uint64_t v6 = v39;
  v40[2] = &unk_1F29E7F90;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v38 count:3];
  v42[4] = v16;
  v41[5] = @"C0TBSzArr";
  v36[0] = v4;
  v36[1] = v5;
  v37[0] = &unk_1F29E7F60;
  v37[1] = &unk_1F29E7FA8;
  v36[2] = v6;
  v37[2] = &unk_1F29E7F90;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
  v42[5] = v15;
  v41[6] = @"C1TBSzArr";
  v34[0] = v4;
  v34[1] = v5;
  v35[0] = &unk_1F29E7F60;
  v35[1] = &unk_1F29E7FA8;
  v34[2] = v6;
  v35[2] = &unk_1F29E7F90;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
  v42[6] = v14;
  v41[7] = @"TxPwrBktArr";
  v32[0] = v4;
  v32[1] = v5;
  v33[0] = &unk_1F29E7F60;
  v33[1] = &unk_1F29E7FC0;
  v32[2] = v6;
  v33[2] = &unk_1F29E7F90;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  v42[7] = v7;
  v41[8] = @"CASCCStateArr";
  v30[0] = v4;
  v30[1] = v5;
  v31[0] = &unk_1F29E7F60;
  v31[1] = &unk_1F29E7F78;
  v30[2] = v6;
  v31[2] = &unk_1F29E7F90;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  v42[8] = v8;
  v41[9] = @"kRfActRxTxArr";
  v28[0] = v4;
  v28[1] = v5;
  v29[0] = &unk_1F29E7F60;
  v29[1] = &unk_1F29E7FD8;
  v28[2] = v6;
  v29[2] = &unk_1F29E7F90;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  v42[9] = v9;
  v41[10] = @"SleepStateArr";
  v26[0] = v4;
  v26[1] = v5;
  v27[0] = &unk_1F29E7F60;
  v27[1] = &unk_1F29E7FD8;
  v26[2] = v6;
  v27[2] = &unk_1F29E7F90;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  v42[10] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:11];
  v46[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];

  return v12;
}

- (void)refreshMav10BBRfAllRats
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMav10HwRfLTE
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __54__PLBBMavHwRfLTELogMsg_logEventBackwardBBMav10HwRfLTE__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v3;
    if (qword_1EBD5AE30 != -1) {
      dispatch_once(&qword_1EBD5AE30, &block);
    }
    if (byte_1EBD5ADE1)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfLTELogMsg logEventBackwardBBMav10HwRfLTE]", block, v15, v16, v17, v18);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg logEventBackwardBBMav10HwRfLTE]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:196];

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
  [(PLBBMavHwRfLTELogMsg *)self populateEntry:v11];
  v19[0] = @"entry";
  v19[1] = @"entryKey";
  v20[0] = v11;
  v20[1] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

uint64_t __54__PLBBMavHwRfLTELogMsg_logEventBackwardBBMav10HwRfLTE__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADE1 = result;
  return result;
}

- (void)populateEntry:(id)a3
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

  uint64_t v10 = [(PLBBMavHwRfLTELogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  uint64_t v11 = [(PLBBMavHwRfLTELogMsg *)self dupMode];
  [v5 setObject:v11 forKeyedSubscript:@"DupMode"];

  id v12 = [(PLBBMavHwRfLTELogMsg *)self caFreqInfo];
  [v5 setObject:v12 forKeyedSubscript:@"CAFreqInfo"];

  id v13 = [(PLBBMavHwRfLTELogMsg *)self dlC0TBSzCnt];
  [v5 setObject:v13 forKeyedSubscript:@"C0TBSzArr"];

  v14 = [(PLBBMavHwRfLTELogMsg *)self dlC1TBSzCnt];
  [v5 setObject:v14 forKeyedSubscript:@"C1TBSzArr"];

  uint64_t v15 = [(PLBBMavHwRfLTELogMsg *)self txPwrCnt];
  [v5 setObject:v15 forKeyedSubscript:@"TxPwrBktArr"];

  uint64_t v16 = [(PLBBMavHwRfLTELogMsg *)self caSCCCnt];
  [v5 setObject:v16 forKeyedSubscript:@"CASCCStateArr"];

  v17 = [(PLBBMavHwRfLTELogMsg *)self actRxTxCnt];
  [v5 setObject:v17 forKeyedSubscript:@"kRfActRxTxArr"];

  id v18 = [(PLBBMavHwRfLTELogMsg *)self sleepStateCnt];
  [v5 setObject:v18 forKeyedSubscript:@"SleepStateArr"];
}

+ (id)entryEventBackwardDefinitionBBMav13HwRfLTE
{
  v76[2] = *MEMORY[0x1E4F143B8];
  v75[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v73[0] = *MEMORY[0x1E4F92CD0];
  v73[1] = v2;
  v74[0] = &unk_1F29F1470;
  v74[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v73[2] = *MEMORY[0x1E4F92CB0];
  v73[3] = v3;
  v74[2] = @"refreshMav13BBRfLTE";
  v74[3] = MEMORY[0x1E4F1CC38];
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:4];
  v76[0] = v35;
  v75[1] = *MEMORY[0x1E4F92CA8];
  v71[0] = @"SeqNum";
  id v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v72[0] = v33;
  v71[1] = @"BBDate";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_DateFormat");
  v72[1] = v31;
  v71[2] = @"LogDuration";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
  v72[2] = v29;
  v71[3] = @"DupMode";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v72[3] = v27;
  v71[4] = @"CAFreqInfo";
  uint64_t v5 = *MEMORY[0x1E4F92D00];
  v68[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v68[0];
  v68[1] = v5;
  v70[0] = &unk_1F29E7F60;
  v70[1] = &unk_1F29E7F78;
  uint64_t v69 = *MEMORY[0x1E4F92D08];
  uint64_t v6 = v69;
  v70[2] = &unk_1F29E7F90;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v68 count:3];
  v72[4] = v26;
  v71[5] = @"C0TBSzArr";
  v66[0] = v4;
  v66[1] = v5;
  v67[0] = &unk_1F29E7F60;
  v67[1] = &unk_1F29E7FF0;
  v66[2] = v6;
  v67[2] = &unk_1F29E7F90;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
  v72[5] = v25;
  v71[6] = @"C1TBSzArr";
  v64[0] = v4;
  v64[1] = v5;
  v65[0] = &unk_1F29E7F60;
  v65[1] = &unk_1F29E7FF0;
  v64[2] = v6;
  v65[2] = &unk_1F29E7F90;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
  v72[6] = v24;
  v71[7] = @"TxPwrBktArr";
  v62[0] = v4;
  v62[1] = v5;
  v63[0] = &unk_1F29E7F60;
  v63[1] = &unk_1F29E7FC0;
  v62[2] = v6;
  v63[2] = &unk_1F29E7F90;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
  v72[7] = v23;
  v71[8] = @"CASCCStateArr";
  v60[0] = v4;
  v60[1] = v5;
  v61[0] = &unk_1F29E7F60;
  v61[1] = &unk_1F29E7F78;
  v60[2] = v6;
  v61[2] = &unk_1F29E7F90;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
  v72[8] = v22;
  v71[9] = @"RfActRxTxPCCArr";
  v58[0] = v4;
  v58[1] = v5;
  v59[0] = &unk_1F29E7F60;
  v59[1] = &unk_1F29E8008;
  v58[2] = v6;
  v59[2] = &unk_1F29E7F90;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
  v72[9] = v21;
  v71[10] = @"RfActRxTxSCCArr";
  v56[0] = v4;
  v56[1] = v5;
  v57[0] = &unk_1F29E7F60;
  v57[1] = &unk_1F29E8008;
  v56[2] = v6;
  v57[2] = &unk_1F29E7F90;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
  v72[10] = v20;
  v71[11] = @"RfActRxTxPCCSCCArr";
  v54[0] = v4;
  v54[1] = v5;
  v55[0] = &unk_1F29E7F60;
  v55[1] = &unk_1F29E8008;
  v54[2] = v6;
  v55[2] = &unk_1F29E7F90;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
  v72[11] = v19;
  v71[12] = @"SleepStateIdleArr";
  v52[0] = v4;
  v52[1] = v5;
  v53[0] = &unk_1F29E7F60;
  v53[1] = &unk_1F29E8020;
  v52[2] = v6;
  v53[2] = &unk_1F29E7F90;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  v72[12] = v18;
  v71[13] = @"SleepStateConnArr";
  v50[0] = v4;
  v50[1] = v5;
  v51[0] = &unk_1F29E7F60;
  v51[1] = &unk_1F29E8020;
  v50[2] = v6;
  v51[2] = &unk_1F29E7F90;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
  v72[13] = v17;
  v71[14] = @"RfRSRPIdleArr";
  v48[0] = v4;
  v48[1] = v5;
  v49[0] = &unk_1F29E7F60;
  v49[1] = &unk_1F29E7FD8;
  v48[2] = v6;
  v49[2] = &unk_1F29E7F90;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
  v72[14] = v16;
  v71[15] = @"RfRSRPConnArr";
  v46[0] = v4;
  v46[1] = v5;
  v47[0] = &unk_1F29E7F60;
  v47[1] = &unk_1F29E7FD8;
  v46[2] = v6;
  v47[2] = &unk_1F29E7F90;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
  v72[15] = v15;
  v71[16] = @"RfSINRIdleArr";
  v44[0] = v4;
  v44[1] = v5;
  v45[0] = &unk_1F29E7F60;
  v45[1] = &unk_1F29E7FD8;
  v44[2] = v6;
  void v45[2] = &unk_1F29E7F90;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];
  v72[16] = v7;
  v71[17] = @"RfSINRConnArr";
  v42[0] = v4;
  v42[1] = v5;
  v43[0] = &unk_1F29E7F60;
  v43[1] = &unk_1F29E7FD8;
  v42[2] = v6;
  v43[2] = &unk_1F29E7F90;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
  v72[17] = v8;
  v71[18] = @"RfARXArr";
  v40[0] = v4;
  v40[1] = v5;
  v41[0] = &unk_1F29E7F60;
  v41[1] = &unk_1F29E8038;
  v40[2] = v6;
  v41[2] = &unk_1F29E7F90;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
  v72[18] = v9;
  v71[19] = @"RfNLICArr";
  v38[0] = v4;
  v38[1] = v5;
  v39[0] = &unk_1F29E7F60;
  v39[1] = &unk_1F29E8050;
  void v38[2] = v6;
  v39[2] = &unk_1F29E7F90;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
  v72[19] = v10;
  v71[20] = @"RfBPEArr";
  v36[0] = v4;
  v36[1] = v5;
  v37[0] = &unk_1F29E7F60;
  v37[1] = &unk_1F29E8008;
  v36[2] = v6;
  v37[2] = &unk_1F29E7F90;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
  v72[20] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:21];
  v76[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];

  return v13;
}

- (void)refreshMav13BBRfLTE
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMav13HwRfLTE
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __54__PLBBMavHwRfLTELogMsg_logEventBackwardBBMav13HwRfLTE__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v3;
    if (qword_1EBD5AE38 != -1) {
      dispatch_once(&qword_1EBD5AE38, &block);
    }
    if (byte_1EBD5ADE2)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfLTELogMsg logEventBackwardBBMav13HwRfLTE]", block, v15, v16, v17, v18);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfLTELogMsg logEventBackwardBBMav13HwRfLTE]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:349];

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
  [(PLBBMavHwRfLTELogMsg *)self populateMav13Entry:v11];
  v19[0] = @"entry";
  v19[1] = @"entryKey";
  v20[0] = v11;
  v20[1] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

uint64_t __54__PLBBMavHwRfLTELogMsg_logEventBackwardBBMav13HwRfLTE__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5ADE2 = result;
  return result;
}

- (void)populateMav13Entry:(id)a3
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

  uint64_t v10 = [(PLBBMavHwRfLTELogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  uint64_t v11 = [(PLBBMavHwRfLTELogMsg *)self dupMode];
  [v5 setObject:v11 forKeyedSubscript:@"DupMode"];

  id v12 = [(PLBBMavHwRfLTELogMsg *)self caFreqInfo];
  [v5 setObject:v12 forKeyedSubscript:@"CAFreqInfo"];

  id v13 = [(PLBBMavHwRfLTELogMsg *)self dlC0TBSzCnt];
  [v5 setObject:v13 forKeyedSubscript:@"C0TBSzArr"];

  v14 = [(PLBBMavHwRfLTELogMsg *)self dlC1TBSzCnt];
  [v5 setObject:v14 forKeyedSubscript:@"C1TBSzArr"];

  uint64_t v15 = [(PLBBMavHwRfLTELogMsg *)self txPwrCnt];
  [v5 setObject:v15 forKeyedSubscript:@"TxPwrBktArr"];

  uint64_t v16 = [(PLBBMavHwRfLTELogMsg *)self caSCCCnt];
  [v5 setObject:v16 forKeyedSubscript:@"CASCCStateArr"];

  v17 = [(PLBBMavHwRfLTELogMsg *)self actRxTxPriCCCnt];
  [v5 setObject:v17 forKeyedSubscript:@"RfActRxTxPCCArr"];

  uint64_t v18 = [(PLBBMavHwRfLTELogMsg *)self actRxTxSecCCCnt];
  [v5 setObject:v18 forKeyedSubscript:@"RfActRxTxSCCArr"];

  uint64_t v19 = [(PLBBMavHwRfLTELogMsg *)self actRxTxPriSecCCCnt];
  [v5 setObject:v19 forKeyedSubscript:@"RfActRxTxPCCSCCArr"];

  uint64_t v20 = [(PLBBMavHwRfLTELogMsg *)self sleepStateIdleCnt];
  [v5 setObject:v20 forKeyedSubscript:@"SleepStateIdleArr"];

  id v21 = [(PLBBMavHwRfLTELogMsg *)self sleepStateConnCnt];
  [v5 setObject:v21 forKeyedSubscript:@"SleepStateConnArr"];

  id v22 = [(PLBBMavHwRfLTELogMsg *)self rsrpIdleCnt];
  [v5 setObject:v22 forKeyedSubscript:@"RfRSRPIdleArr"];

  uint64_t v23 = [(PLBBMavHwRfLTELogMsg *)self rsrpConnCnt];
  [v5 setObject:v23 forKeyedSubscript:@"RfRSRPConnArr"];

  uint64_t v24 = [(PLBBMavHwRfLTELogMsg *)self sinrIdleCnt];
  [v5 setObject:v24 forKeyedSubscript:@"RfSINRIdleArr"];

  v25 = [(PLBBMavHwRfLTELogMsg *)self sinrConnCnt];
  [v5 setObject:v25 forKeyedSubscript:@"RfSINRConnArr"];

  v26 = [(PLBBMavHwRfLTELogMsg *)self arxStateCnt];
  [v5 setObject:v26 forKeyedSubscript:@"RfARXArr"];

  v27 = [(PLBBMavHwRfLTELogMsg *)self nlicStateCnt];
  [v5 setObject:v27 forKeyedSubscript:@"RfNLICArr"];

  id v28 = [(PLBBMavHwRfLTELogMsg *)self bpeStats];
  [v5 setObject:v28 forKeyedSubscript:@"RfBPEArr"];
}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setError:(id)a3
{
}

- (NSArray)dlC0TBSzCnt
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDlC0TBSzCnt:(id)a3
{
}

- (NSArray)dlC1TBSzCnt
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDlC1TBSzCnt:(id)a3
{
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLogDuration:(id)a3
{
}

- (NSNumber)dupMode
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDupMode:(id)a3
{
}

- (NSArray)caFreqInfo
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCaFreqInfo:(id)a3
{
}

- (NSArray)txPwrCnt
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTxPwrCnt:(id)a3
{
}

- (NSArray)caSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCaSCCCnt:(id)a3
{
}

- (NSArray)actRxTxCnt
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setActRxTxCnt:(id)a3
{
}

- (NSArray)sleepStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSleepStateCnt:(id)a3
{
}

- (NSArray)caPriCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCaPriCCCnt:(id)a3
{
}

- (NSArray)caSecCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCaSecCCCnt:(id)a3
{
}

- (NSArray)caPriSecCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCaPriSecCCCnt:(id)a3
{
}

- (NSArray)actRxTxPriCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setActRxTxPriCCCnt:(id)a3
{
}

- (NSArray)actRxTxSecCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setActRxTxSecCCCnt:(id)a3
{
}

- (NSArray)actRxTxPriSecCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setActRxTxPriSecCCCnt:(id)a3
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

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setGroupEntryKey:(id)a3
{
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 296, 1);
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
  objc_storeStrong((id *)&self->_bpeStats, 0);
  objc_storeStrong((id *)&self->_nlicStateCnt, 0);
  objc_storeStrong((id *)&self->_arxStateCnt, 0);
  objc_storeStrong((id *)&self->_sinrConnCnt, 0);
  objc_storeStrong((id *)&self->_sinrIdleCnt, 0);
  objc_storeStrong((id *)&self->_rsrpConnCnt, 0);
  objc_storeStrong((id *)&self->_rsrpIdleCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateConnCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateIdleCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxPriSecCCCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxSecCCCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxPriCCCnt, 0);
  objc_storeStrong((id *)&self->_caPriSecCCCnt, 0);
  objc_storeStrong((id *)&self->_caSecCCCnt, 0);
  objc_storeStrong((id *)&self->_caPriCCCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxCnt, 0);
  objc_storeStrong((id *)&self->_caSCCCnt, 0);
  objc_storeStrong((id *)&self->_txPwrCnt, 0);
  objc_storeStrong((id *)&self->_caFreqInfo, 0);
  objc_storeStrong((id *)&self->_dupMode, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_dlC1TBSzCnt, 0);
  objc_storeStrong((id *)&self->_dlC0TBSzCnt, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end