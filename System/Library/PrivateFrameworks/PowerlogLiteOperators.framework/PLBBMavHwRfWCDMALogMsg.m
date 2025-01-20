@interface PLBBMavHwRfWCDMALogMsg
+ (id)entryEventBackwardDefinitionBBMav16BHwRfWCDMA;
+ (id)entryEventBackwardDefinitionBBMav16HwRfWCDMA;
+ (id)entryEventBackwardDefinitionBBMavHwRfWCDMA;
- (NSArray)DCEqStatCnt;
- (NSArray)DCQsetEqStatCnt;
- (NSArray)DurInCarrierMode;
- (NSArray)RABModeCnt;
- (NSArray)RABTypeCnt;
- (NSArray)SCEqStatCnt;
- (NSArray)SCQsetEqStatCnt;
- (NSArray)TxPwrBucket;
- (NSMutableArray)groupArrEntries;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)cpcEnergy;
- (NSNumber)cpcRxOnCnt;
- (NSNumber)cpcRxTxOffCnt;
- (NSNumber)cpcTimeCnt;
- (NSNumber)fetCnt;
- (NSNumber)logDuration;
- (NSString)error;
- (NSString)groupEntryKey;
- (NSString)groupID;
- (PLBBMavHwRfWCDMALogMsg)init;
- (id)logEventBackwardBBMavHwRfWCDMA;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)populateEntry:(id)a3;
- (void)refreshRequest;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setCommonInfo:(id)a3;
- (void)setCpcEnergy:(id)a3;
- (void)setCpcRxOnCnt:(id)a3;
- (void)setCpcRxTxOffCnt:(id)a3;
- (void)setCpcTimeCnt:(id)a3;
- (void)setDCEqStatCnt:(id)a3;
- (void)setDCQsetEqStatCnt:(id)a3;
- (void)setDurInCarrierMode:(id)a3;
- (void)setError:(id)a3;
- (void)setFetCnt:(id)a3;
- (void)setGroupArrEntries:(id)a3;
- (void)setGroupEntryKey:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setLogDuration:(id)a3;
- (void)setRABModeCnt:(id)a3;
- (void)setRABTypeCnt:(id)a3;
- (void)setSCEqStatCnt:(id)a3;
- (void)setSCQsetEqStatCnt:(id)a3;
- (void)setTxPwrBucket:(id)a3;
@end

@implementation PLBBMavHwRfWCDMALogMsg

- (PLBBMavHwRfWCDMALogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__PLBBMavHwRfWCDMALogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5A218 != -1) {
      dispatch_once(&qword_1EBD5A218, block);
    }
    if (_MergedGlobals_1_53)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfWCDMALogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg init]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:39];

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
  v16.super_class = (Class)PLBBMavHwRfWCDMALogMsg;
  v10 = [(PLBBMavHwRfWCDMALogMsg *)&v16 init];
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

uint64_t __30__PLBBMavHwRfWCDMALogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_53 = result;
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
    block[2] = __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD5A220 != -1) {
      dispatch_once(&qword_1EBD5A220, block);
    }
    if (byte_1EBD5A209)
    {
      id v12 = v10;
      id v13 = v9;
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfWCDMALogMsg sendAndLogPLEntry:withName:withType:]");
      v15 = (void *)MEMORY[0x1E4F929B8];
      objc_super v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
      v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg sendAndLogPLEntry:withName:withType:]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:58];

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
    v47[2] = __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v20;
    if (qword_1EBD5A228 != -1) {
      dispatch_once(&qword_1EBD5A228, v47);
    }
    if (byte_1EBD5A20A)
    {
      id v21 = v10;
      id v44 = v10;
      id v22 = v9;
      v23 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v9, v44];
      v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg sendAndLogPLEntry:withName:withType:]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:59];

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

  v32 = [(PLBasebandMessage *)self agent];

  if (!v32 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v33 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke_378;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v33;
    if (qword_1EBD5A230 != -1) {
      dispatch_once(&qword_1EBD5A230, v46);
    }
    if (byte_1EBD5A20B)
    {
      id v45 = v10;
      id v34 = v9;
      v35 = [NSString stringWithFormat:@"Bad agent"];
      v36 = (void *)MEMORY[0x1E4F929B8];
      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg sendAndLogPLEntry:withName:withType:]"];
      [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:66];

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

  v43 = [(PLBasebandMessage *)self agent];
  [v43 logEntry:v8];
}

uint64_t __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A209 = result;
  return result;
}

uint64_t __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A20A = result;
  return result;
}

uint64_t __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke_378(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A20B = result;
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
    block[2] = __65__PLBBMavHwRfWCDMALogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD5A238 != -1) {
      dispatch_once(&qword_1EBD5A238, block);
    }
    if (byte_1EBD5A20C)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      id v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:78];

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
    v25[2] = __65__PLBBMavHwRfWCDMALogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_384;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD5A240 != -1) {
      dispatch_once(&qword_1EBD5A240, v25);
    }
    if (byte_1EBD5A20D)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
      id v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v20 logMessage:v18 fromFile:v22 fromFunction:v23 fromLineNumber:80];

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

uint64_t __65__PLBBMavHwRfWCDMALogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A20C = result;
  return result;
}

uint64_t __65__PLBBMavHwRfWCDMALogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_384(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A20D = result;
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
    block[2] = __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD5A248 != -1) {
      dispatch_once(&qword_1EBD5A248, block);
    }
    if (byte_1EBD5A20E)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfWCDMALogMsg addPairWithKey:andWithVal:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg addPairWithKey:andWithVal:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:96];

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
      v30[2] = __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke_397;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD5A258 != -1) {
        dispatch_once(&qword_1EBD5A258, v30);
      }
      if (byte_1EBD5A210)
      {
        v17 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
        uint64_t v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg addPairWithKey:andWithVal:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:102];

        id v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v23 = [(PLBBMavHwRfWCDMALogMsg *)self kvPairs];
    [v23 setObject:v7 forKey:v6];
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke_391;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD5A250 != -1) {
      dispatch_once(&qword_1EBD5A250, v31);
    }
    if (byte_1EBD5A20F)
    {
      v23 = [NSString stringWithFormat:@"Error: nil key for kvPair not expected, return"];
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMavHwRfWCDMALogMsg addPairWithKey:andWithVal:]"];
      [v25 logMessage:v23 fromFile:v27 fromFunction:v28 fromLineNumber:99];

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

uint64_t __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A20E = result;
  return result;
}

uint64_t __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A20F = result;
  return result;
}

uint64_t __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke_397(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A210 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMavHwRfWCDMA
{
  v57[2] = *MEMORY[0x1E4F143B8];
  v56[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v54[0] = *MEMORY[0x1E4F92CD0];
  v54[1] = v2;
  v55[0] = &unk_1F29F1020;
  v55[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v54[2] = *MEMORY[0x1E4F92CB0];
  v54[3] = v3;
  v55[2] = @"refreshRequestHandler";
  v55[3] = MEMORY[0x1E4F1CC38];
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
  v57[0] = v34;
  v56[1] = *MEMORY[0x1E4F92CA8];
  v52[0] = @"SeqNum";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v53[0] = v32;
  v52[1] = @"BBDate";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_DateFormat");
  v53[1] = v30;
  v52[2] = @"LogDuration";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v53[2] = v28;
  v52[3] = @"SCEqTypeDuration";
  uint64_t v5 = *MEMORY[0x1E4F92D00];
  v49[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v49[0];
  v49[1] = v5;
  v51[0] = &unk_1F29E7468;
  v51[1] = &unk_1F29E7480;
  uint64_t v50 = *MEMORY[0x1E4F92D08];
  uint64_t v6 = v50;
  v51[2] = &unk_1F29E7498;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v49 count:3];
  v53[3] = v27;
  v52[4] = @"DCEqTypeDuration";
  v47[0] = v4;
  v47[1] = v5;
  v48[0] = &unk_1F29E7468;
  v48[1] = &unk_1F29E7480;
  v47[2] = v6;
  v48[2] = &unk_1F29E7498;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
  v53[4] = v26;
  v52[5] = @"SCQSetNumCell";
  v45[0] = v4;
  v45[1] = v5;
  v46[0] = &unk_1F29E7468;
  v46[1] = &unk_1F29E74B0;
  v45[2] = v6;
  v46[2] = &unk_1F29E7498;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
  v53[5] = v25;
  v52[6] = @"DCQSetNumCell";
  v43[0] = v4;
  v43[1] = v5;
  v44[0] = &unk_1F29E7468;
  v44[1] = &unk_1F29E74B0;
  v43[2] = v6;
  v44[2] = &unk_1F29E7498;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
  v53[6] = v24;
  v52[7] = @"TimeInCarrierMode";
  v41[0] = v4;
  v41[1] = v5;
  v42[0] = &unk_1F29E7468;
  v42[1] = &unk_1F29E74C8;
  v41[2] = v6;
  v42[2] = &unk_1F29E7498;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
  v53[7] = v23;
  v52[8] = @"DurationInRabMode";
  v39[0] = v4;
  v39[1] = v5;
  v40[0] = &unk_1F29E7468;
  v40[1] = &unk_1F29E74B0;
  v39[2] = v6;
  v40[2] = &unk_1F29E7498;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  v53[8] = v22;
  v52[9] = @"DurationInPsRabType";
  v37[0] = v4;
  v37[1] = v5;
  v38[0] = &unk_1F29E7468;
  v38[1] = &unk_1F29E74B0;
  v37[2] = v6;
  v38[2] = &unk_1F29E7498;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  v53[9] = v21;
  v52[10] = @"TxPwrBktArr";
  v35[0] = v4;
  v35[1] = v5;
  v36[0] = &unk_1F29E7468;
  v36[1] = &unk_1F29E74E0;
  v35[2] = v6;
  v36[2] = &unk_1F29E7498;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v53[10] = v20;
  v52[11] = @"CPCRxOnCnt";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v53[11] = v18;
  v52[12] = @"CPCRxTxOffCnt";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v53[12] = v8;
  v52[13] = @"CPCTimeCnt";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v53[13] = v10;
  v52[14] = @"CPCEnergy";
  uint64_t v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v53[14] = v12;
  v52[15] = @"FetCnt";
  id v13 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v53[15] = v14;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:16];
  v57[1] = v15;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

  return v17;
}

+ (id)entryEventBackwardDefinitionBBMav16HwRfWCDMA
{
  v57[2] = *MEMORY[0x1E4F143B8];
  v56[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v54[0] = *MEMORY[0x1E4F92CD0];
  v54[1] = v2;
  v55[0] = &unk_1F29F1020;
  v55[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v54[2] = *MEMORY[0x1E4F92CB0];
  v54[3] = v3;
  v55[2] = @"refreshRequestHandler";
  v55[3] = MEMORY[0x1E4F1CC38];
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
  v57[0] = v34;
  v56[1] = *MEMORY[0x1E4F92CA8];
  v52[0] = @"SeqNum";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v53[0] = v32;
  v52[1] = @"BBDate";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_DateFormat");
  v53[1] = v30;
  v52[2] = @"LogDuration";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v53[2] = v28;
  v52[3] = @"SCEqTypeDuration";
  uint64_t v5 = *MEMORY[0x1E4F92D00];
  v49[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v49[0];
  v49[1] = v5;
  v51[0] = &unk_1F29E7468;
  v51[1] = &unk_1F29E7480;
  uint64_t v50 = *MEMORY[0x1E4F92D08];
  uint64_t v6 = v50;
  v51[2] = &unk_1F29E7498;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v49 count:3];
  v53[3] = v27;
  v52[4] = @"DCEqTypeDuration";
  v47[0] = v4;
  v47[1] = v5;
  v48[0] = &unk_1F29E7468;
  v48[1] = &unk_1F29E7480;
  v47[2] = v6;
  v48[2] = &unk_1F29E7498;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
  v53[4] = v26;
  v52[5] = @"SCQSetNumCell";
  v45[0] = v4;
  v45[1] = v5;
  v46[0] = &unk_1F29E7468;
  v46[1] = &unk_1F29E74B0;
  v45[2] = v6;
  v46[2] = &unk_1F29E7498;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
  v53[5] = v25;
  v52[6] = @"DCQSetNumCell";
  v43[0] = v4;
  v43[1] = v5;
  v44[0] = &unk_1F29E7468;
  v44[1] = &unk_1F29E74B0;
  v43[2] = v6;
  v44[2] = &unk_1F29E7498;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
  v53[6] = v24;
  v52[7] = @"TimeInCarrierMode";
  v41[0] = v4;
  v41[1] = v5;
  v42[0] = &unk_1F29E7468;
  v42[1] = &unk_1F29E74C8;
  v41[2] = v6;
  v42[2] = &unk_1F29E7498;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
  v53[7] = v23;
  v52[8] = @"DurationInRabMode";
  v39[0] = v4;
  v39[1] = v5;
  v40[0] = &unk_1F29E7468;
  v40[1] = &unk_1F29E74B0;
  v39[2] = v6;
  v40[2] = &unk_1F29E7498;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  v53[8] = v22;
  v52[9] = @"DurationInPsRabType";
  v37[0] = v4;
  v37[1] = v5;
  v38[0] = &unk_1F29E7468;
  v38[1] = &unk_1F29E74B0;
  v37[2] = v6;
  v38[2] = &unk_1F29E7498;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  v53[9] = v21;
  v52[10] = @"TxPwrBktArr";
  v35[0] = v4;
  v35[1] = v5;
  v36[0] = &unk_1F29E7468;
  v36[1] = &unk_1F29E74F8;
  v35[2] = v6;
  v36[2] = &unk_1F29E7498;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v53[10] = v20;
  v52[11] = @"CPCRxOnCnt";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v53[11] = v18;
  v52[12] = @"CPCRxTxOffCnt";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v53[12] = v8;
  v52[13] = @"CPCTimeCnt";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v53[13] = v10;
  v52[14] = @"CPCEnergy";
  uint64_t v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v53[14] = v12;
  v52[15] = @"FetCnt";
  id v13 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v53[15] = v14;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:16];
  v57[1] = v15;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

  return v17;
}

+ (id)entryEventBackwardDefinitionBBMav16BHwRfWCDMA
{
  v57[2] = *MEMORY[0x1E4F143B8];
  v56[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v54[0] = *MEMORY[0x1E4F92CD0];
  v54[1] = v2;
  v55[0] = &unk_1F29F1020;
  v55[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v54[2] = *MEMORY[0x1E4F92CB0];
  v54[3] = v3;
  v55[2] = @"refreshRequestHandler";
  v55[3] = MEMORY[0x1E4F1CC38];
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
  v57[0] = v34;
  v56[1] = *MEMORY[0x1E4F92CA8];
  v52[0] = @"SeqNum";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v53[0] = v32;
  v52[1] = @"BBDate";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_DateFormat");
  v53[1] = v30;
  v52[2] = @"LogDuration";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v53[2] = v28;
  v52[3] = @"SCEqTypeDuration";
  uint64_t v5 = *MEMORY[0x1E4F92D00];
  v49[0] = *MEMORY[0x1E4F92D10];
  uint64_t v4 = v49[0];
  v49[1] = v5;
  v51[0] = &unk_1F29E7468;
  v51[1] = &unk_1F29E7480;
  uint64_t v50 = *MEMORY[0x1E4F92D08];
  uint64_t v6 = v50;
  v51[2] = &unk_1F29E7498;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v49 count:3];
  v53[3] = v27;
  v52[4] = @"DCEqTypeDuration";
  v47[0] = v4;
  v47[1] = v5;
  v48[0] = &unk_1F29E7468;
  v48[1] = &unk_1F29E7480;
  v47[2] = v6;
  v48[2] = &unk_1F29E7498;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
  v53[4] = v26;
  v52[5] = @"SCQSetNumCell";
  v45[0] = v4;
  v45[1] = v5;
  v46[0] = &unk_1F29E7468;
  v46[1] = &unk_1F29E74B0;
  v45[2] = v6;
  v46[2] = &unk_1F29E7498;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
  v53[5] = v25;
  v52[6] = @"DCQSetNumCell";
  v43[0] = v4;
  v43[1] = v5;
  v44[0] = &unk_1F29E7468;
  v44[1] = &unk_1F29E74B0;
  v43[2] = v6;
  v44[2] = &unk_1F29E7498;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
  v53[6] = v24;
  v52[7] = @"TimeInCarrierMode";
  v41[0] = v4;
  v41[1] = v5;
  v42[0] = &unk_1F29E7468;
  v42[1] = &unk_1F29E74C8;
  v41[2] = v6;
  v42[2] = &unk_1F29E7498;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
  v53[7] = v23;
  v52[8] = @"DurationInRabMode";
  v39[0] = v4;
  v39[1] = v5;
  v40[0] = &unk_1F29E7468;
  v40[1] = &unk_1F29E74B0;
  v39[2] = v6;
  v40[2] = &unk_1F29E7498;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  v53[8] = v22;
  v52[9] = @"DurationInPsRabType";
  v37[0] = v4;
  v37[1] = v5;
  v38[0] = &unk_1F29E7468;
  v38[1] = &unk_1F29E74B0;
  v37[2] = v6;
  v38[2] = &unk_1F29E7498;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  v53[9] = v21;
  v52[10] = @"TxPwrBktArr";
  v35[0] = v4;
  v35[1] = v5;
  v36[0] = &unk_1F29E7468;
  v36[1] = &unk_1F29E74E0;
  v35[2] = v6;
  v36[2] = &unk_1F29E7498;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v53[10] = v20;
  v52[11] = @"CPCRxOnCnt";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v53[11] = v18;
  v52[12] = @"CPCRxTxOffCnt";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v53[12] = v8;
  v52[13] = @"CPCTimeCnt";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v53[13] = v10;
  v52[14] = @"CPCEnergy";
  uint64_t v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v53[14] = v12;
  v52[15] = @"FetCnt";
  id v13 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v53[15] = v14;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:16];
  v57[1] = v15;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

  return v17;
}

- (void)refreshRequest
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMavHwRfWCDMA
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavHwRfWCDMA"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  [(PLBBMavHwRfWCDMALogMsg *)self populateEntry:v4];
  v7[0] = @"entry";
  v7[1] = @"entryKey";
  v8[0] = v4;
  v8[1] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
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

  uint64_t v10 = [(PLBBMavHwRfWCDMALogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  uint64_t v11 = [(PLBBMavHwRfWCDMALogMsg *)self SCEqStatCnt];
  [v5 setObject:v11 forKeyedSubscript:@"SCEqTypeDuration"];

  id v12 = [(PLBBMavHwRfWCDMALogMsg *)self DCEqStatCnt];
  [v5 setObject:v12 forKeyedSubscript:@"DCEqTypeDuration"];

  id v13 = [(PLBBMavHwRfWCDMALogMsg *)self SCQsetEqStatCnt];
  [v5 setObject:v13 forKeyedSubscript:@"SCQSetNumCell"];

  v14 = [(PLBBMavHwRfWCDMALogMsg *)self DCQsetEqStatCnt];
  [v5 setObject:v14 forKeyedSubscript:@"DCQSetNumCell"];

  int v15 = [(PLBBMavHwRfWCDMALogMsg *)self DurInCarrierMode];
  [v5 setObject:v15 forKeyedSubscript:@"TimeInCarrierMode"];

  uint64_t v16 = [(PLBBMavHwRfWCDMALogMsg *)self RABModeCnt];
  [v5 setObject:v16 forKeyedSubscript:@"DurationInRabMode"];

  id v17 = [(PLBBMavHwRfWCDMALogMsg *)self TxPwrBucket];
  [v5 setObject:v17 forKeyedSubscript:@"TxPwrBktArr"];

  v18 = [(PLBBMavHwRfWCDMALogMsg *)self RABTypeCnt];
  [v5 setObject:v18 forKeyedSubscript:@"DurationInPsRabType"];

  uint64_t v19 = [(PLBBMavHwRfWCDMALogMsg *)self fetCnt];
  [v5 setObject:v19 forKeyedSubscript:@"FetCnt"];

  uint64_t v20 = [(PLBBMavHwRfWCDMALogMsg *)self cpcRxOnCnt];
  [v5 setObject:v20 forKeyedSubscript:@"CPCRxOnCnt"];

  id v21 = [(PLBBMavHwRfWCDMALogMsg *)self cpcRxTxOffCnt];
  [v5 setObject:v21 forKeyedSubscript:@"CPCRxTxOffCnt"];

  id v22 = [(PLBBMavHwRfWCDMALogMsg *)self cpcTimeCnt];
  [v5 setObject:v22 forKeyedSubscript:@"CPCTimeCnt"];

  id v23 = [(PLBBMavHwRfWCDMALogMsg *)self cpcEnergy];
  [v5 setObject:v23 forKeyedSubscript:@"CPCEnergy"];
}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setError:(id)a3
{
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLogDuration:(id)a3
{
}

- (NSArray)SCEqStatCnt
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSCEqStatCnt:(id)a3
{
}

- (NSArray)DCEqStatCnt
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDCEqStatCnt:(id)a3
{
}

- (NSArray)SCQsetEqStatCnt
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSCQsetEqStatCnt:(id)a3
{
}

- (NSArray)DCQsetEqStatCnt
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDCQsetEqStatCnt:(id)a3
{
}

- (NSArray)DurInCarrierMode
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDurInCarrierMode:(id)a3
{
}

- (NSArray)RABModeCnt
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRABModeCnt:(id)a3
{
}

- (NSArray)RABTypeCnt
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRABTypeCnt:(id)a3
{
}

- (NSArray)TxPwrBucket
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTxPwrBucket:(id)a3
{
}

- (NSNumber)fetCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFetCnt:(id)a3
{
}

- (NSNumber)cpcRxOnCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCpcRxOnCnt:(id)a3
{
}

- (NSNumber)cpcRxTxOffCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCpcRxTxOffCnt:(id)a3
{
}

- (NSNumber)cpcTimeCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCpcTimeCnt:(id)a3
{
}

- (NSNumber)cpcEnergy
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCpcEnergy:(id)a3
{
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setGroupEntryKey:(id)a3
{
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 240, 1);
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
  objc_storeStrong((id *)&self->_cpcEnergy, 0);
  objc_storeStrong((id *)&self->_cpcTimeCnt, 0);
  objc_storeStrong((id *)&self->_cpcRxTxOffCnt, 0);
  objc_storeStrong((id *)&self->_cpcRxOnCnt, 0);
  objc_storeStrong((id *)&self->_fetCnt, 0);
  objc_storeStrong((id *)&self->_TxPwrBucket, 0);
  objc_storeStrong((id *)&self->_RABTypeCnt, 0);
  objc_storeStrong((id *)&self->_RABModeCnt, 0);
  objc_storeStrong((id *)&self->_DurInCarrierMode, 0);
  objc_storeStrong((id *)&self->_DCQsetEqStatCnt, 0);
  objc_storeStrong((id *)&self->_SCQsetEqStatCnt, 0);
  objc_storeStrong((id *)&self->_DCEqStatCnt, 0);
  objc_storeStrong((id *)&self->_SCEqStatCnt, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end