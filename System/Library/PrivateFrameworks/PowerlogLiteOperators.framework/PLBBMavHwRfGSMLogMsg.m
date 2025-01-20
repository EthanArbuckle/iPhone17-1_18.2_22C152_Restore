@interface PLBBMavHwRfGSMLogMsg
+ (id)entryEventBackwardDefinitionBBMavHwRfGSM;
- (NSArray)connState;
- (NSMutableArray)groupArrEntries;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)logDuration;
- (NSString)error;
- (NSString)groupEntryKey;
- (NSString)groupID;
- (PLBBMavHwRfGSMLogMsg)init;
- (id)logEventBackwardBBMavHwRfGSM;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)logEventBackwardGroupEntriesMav10BBHwRfWcdma;
- (void)populateEntry:(id)a3;
- (void)refreshRequest;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setCommonInfo:(id)a3;
- (void)setConnState:(id)a3;
- (void)setError:(id)a3;
- (void)setGroupArrEntries:(id)a3;
- (void)setGroupEntryKey:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setLogDuration:(id)a3;
@end

@implementation PLBBMavHwRfGSMLogMsg

- (PLBBMavHwRfGSMLogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__PLBBMavHwRfGSMLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD59E08 != -1) {
      dispatch_once(&qword_1EBD59E08, block);
    }
    if (_MergedGlobals_1_43)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfGSMLogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg init]"];
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
  v16.super_class = (Class)PLBBMavHwRfGSMLogMsg;
  v10 = [(PLBBMavHwRfGSMLogMsg *)&v16 init];
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

uint64_t __28__PLBBMavHwRfGSMLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_43 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F929C0];
  id v11 = a3;
  if ([v10 debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PLBBMavHwRfGSMLogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1EBD59E10 != -1) {
      dispatch_once(&qword_1EBD59E10, block);
    }
    if (byte_1EBD59DF9)
    {
      id v35 = v9;
      id v36 = v8;
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfGSMLogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      objc_super v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:62];

      v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v35;
      id v8 = v36;
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __60__PLBBMavHwRfGSMLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v19;
    if (qword_1EBD59E18 != -1) {
      dispatch_once(&qword_1EBD59E18, v37);
    }
    if (byte_1EBD59DFA)
    {
      id v20 = v9;
      id v21 = v8;
      v22 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v8, v9];
      v23 = (void *)MEMORY[0x1E4F929B8];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:63];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v22;
        _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v8 = v21;
      id v9 = v20;
    }
  }
  v28 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v11 setObject:v28 forKeyedSubscript:@"SeqNum"];

  v29 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v11 setObject:v29 forKeyedSubscript:@"BBDate"];

  v30 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"TimeCal"];
  [v11 setObject:v30 forKeyedSubscript:@"TimeCal"];

  v31 = [(PLBBMavHwRfGSMLogMsg *)self connState];
  [v11 setObject:v31 forKeyedSubscript:@"ConnStates"];

  v32 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  v33 = [v32 convertFromBasebandToMonotonic];
  [v11 setEntryDate:v33];

  v34 = [(PLBasebandMessage *)self agent];
  [v34 logEntry:v11];
}

uint64_t __60__PLBBMavHwRfGSMLogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59DF9 = result;
  return result;
}

uint64_t __60__PLBBMavHwRfGSMLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59DFA = result;
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
    block[2] = __63__PLBBMavHwRfGSMLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD59E20 != -1) {
      dispatch_once(&qword_1EBD59E20, block);
    }
    if (byte_1EBD59DFB)
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfGSMLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:81];

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
    v25[2] = __63__PLBBMavHwRfGSMLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_381;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD59E28 != -1) {
      dispatch_once(&qword_1EBD59E28, v25);
    }
    if (byte_1EBD59DFC)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      id v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v20 logMessage:v18 fromFile:v22 fromFunction:v23 fromLineNumber:83];

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

uint64_t __63__PLBBMavHwRfGSMLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59DFB = result;
  return result;
}

uint64_t __63__PLBBMavHwRfGSMLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_381(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59DFC = result;
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
    block[2] = __50__PLBBMavHwRfGSMLogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD59E30 != -1) {
      dispatch_once(&qword_1EBD59E30, block);
    }
    if (byte_1EBD59DFD)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfGSMLogMsg addPairWithKey:andWithVal:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      uint64_t v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg addPairWithKey:andWithVal:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:99];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v9;
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
      v30[2] = __50__PLBBMavHwRfGSMLogMsg_addPairWithKey_andWithVal___block_invoke_394;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD59E40 != -1) {
        dispatch_once(&qword_1EBD59E40, v30);
      }
      if (byte_1EBD59DFF)
      {
        v17 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
        id v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg addPairWithKey:andWithVal:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:105];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v23 = [(PLBBMavHwRfGSMLogMsg *)self kvPairs];
    [v23 setObject:v7 forKey:v6];
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__PLBBMavHwRfGSMLogMsg_addPairWithKey_andWithVal___block_invoke_388;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD59E38 != -1) {
      dispatch_once(&qword_1EBD59E38, v31);
    }
    if (byte_1EBD59DFE)
    {
      v23 = [NSString stringWithFormat:@"Error: nil key for kvPair not expected, return"];
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg addPairWithKey:andWithVal:]"];
      [v25 logMessage:v23 fromFile:v27 fromFunction:v28 fromLineNumber:102];

      uint64_t v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v23;
        _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_17;
    }
  }
LABEL_25:
}

uint64_t __50__PLBBMavHwRfGSMLogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59DFD = result;
  return result;
}

uint64_t __50__PLBBMavHwRfGSMLogMsg_addPairWithKey_andWithVal___block_invoke_388(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59DFE = result;
  return result;
}

uint64_t __50__PLBBMavHwRfGSMLogMsg_addPairWithKey_andWithVal___block_invoke_394(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59DFF = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMavHwRfGSM
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v20[0] = *MEMORY[0x1E4F92CD0];
  v20[1] = v2;
  v21[0] = &unk_1F29F0D50;
  v21[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v20[2] = *MEMORY[0x1E4F92CB0];
  v20[3] = v3;
  v21[2] = @"refreshRequestHandler";
  v21[3] = MEMORY[0x1E4F1CC38];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v23[0] = v4;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"SeqNum";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v19[0] = v6;
  v18[1] = @"BBDate";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_DateFormat");
  v19[1] = v8;
  v18[2] = @"LogDuration";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v19[2] = v10;
  v18[3] = @"ConnStates";
  uint64_t v11 = *MEMORY[0x1E4F92D00];
  v16[0] = *MEMORY[0x1E4F92D10];
  v16[1] = v11;
  v17[0] = &unk_1F29E6778;
  v17[1] = &unk_1F29E6790;
  v16[2] = *MEMORY[0x1E4F92D08];
  v17[2] = &unk_1F29E67A8;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v19[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v23[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v14;
}

- (void)refreshRequest
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMavHwRfGSM
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavHwRfGSM"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  [(PLBBMavHwRfGSMLogMsg *)self populateEntry:v4];
  v7[0] = @"entry";
  v7[1] = @"entryKey";
  v8[0] = v4;
  v8[1] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)logEventBackwardGroupEntriesMav10BBHwRfWcdma
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PLBBMavHwRfGSMLogMsg_logEventBackwardGroupEntriesMav10BBHwRfWcdma__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD59E48 != -1) {
      dispatch_once(&qword_1EBD59E48, block);
    }
    if (byte_1EBD59E00)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfGSMLogMsg logEventBackwardGroupEntriesMav10BBHwRfWcdma]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg logEventBackwardGroupEntriesMav10BBHwRfWcdma]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:163];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v4;
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
    v23[2] = __68__PLBBMavHwRfGSMLogMsg_logEventBackwardGroupEntriesMav10BBHwRfWcdma__block_invoke_418;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v23[4] = v11;
    if (qword_1EBD59E50 != -1) {
      dispatch_once(&qword_1EBD59E50, v23);
    }
    if (byte_1EBD59E01)
    {
      uint64_t v12 = [NSString stringWithFormat:@"Bad agent"];
      v13 = (void *)MEMORY[0x1E4F929B8];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfGSMLogMsg.m"];
      int v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLBBMavHwRfGSMLogMsg logEventBackwardGroupEntriesMav10BBHwRfWcdma]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:165];

      v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v18 = [(PLBasebandMessage *)self agent];
  uint64_t v19 = [(PLBBMavHwRfGSMLogMsg *)self groupEntryKey];
  v25 = v19;
  id v20 = [(PLBBMavHwRfGSMLogMsg *)self groupArrEntries];
  v26 = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v22 = [(PLBBMavHwRfGSMLogMsg *)self groupEntryKey];
  [v18 logEntries:v21 withGroupID:v22];
}

uint64_t __68__PLBBMavHwRfGSMLogMsg_logEventBackwardGroupEntriesMav10BBHwRfWcdma__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E00 = result;
  return result;
}

uint64_t __68__PLBBMavHwRfGSMLogMsg_logEventBackwardGroupEntriesMav10BBHwRfWcdma__block_invoke_418(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E01 = result;
  return result;
}

- (void)populateEntry:(id)a3
{
  commonInfo = self->_commonInfo;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)commonInfo objectForKey:@"BBDate"];
  id v7 = [v6 convertFromBasebandToMonotonic];
  [v5 setEntryDate:v7];

  uint64_t v8 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v5 setObject:v8 forKeyedSubscript:@"SeqNum"];

  id v9 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v5 setObject:v9 forKeyedSubscript:@"BBDate"];

  uint64_t v10 = [(PLBBMavHwRfGSMLogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  id v11 = [(PLBBMavHwRfGSMLogMsg *)self connState];
  [v5 setObject:v11 forKeyedSubscript:@"ConnStates"];
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

- (NSArray)connState
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setConnState:(id)a3
{
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setGroupEntryKey:(id)a3
{
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
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
  objc_storeStrong((id *)&self->_connState, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end