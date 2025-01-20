@interface PLBBMavHwRfTDSLogMsg
+ (id)entryEventBackwardDefinitionBBMavHwRfTDS;
- (NSArray)rxdStateCnt;
- (NSArray)srvcTypeCnt;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)logDuration;
- (NSString)error;
- (PLBBMavHwRfTDSLogMsg)init;
- (id)logEventBackwardBBMavHwRfTDS;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)populateEntry:(id)a3;
- (void)refreshRequest;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setCommonInfo:(id)a3;
- (void)setError:(id)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setLogDuration:(id)a3;
- (void)setRxdStateCnt:(id)a3;
- (void)setSrvcTypeCnt:(id)a3;
@end

@implementation PLBBMavHwRfTDSLogMsg

- (PLBBMavHwRfTDSLogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__PLBBMavHwRfTDSLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD59EB8 != -1) {
      dispatch_once(&qword_1EBD59EB8, block);
    }
    if (_MergedGlobals_1_45)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfTDSLogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfTDSLogMsg init]"];
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
  v16.super_class = (Class)PLBBMavHwRfTDSLogMsg;
  v10 = [(PLBBMavHwRfTDSLogMsg *)&v16 init];
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

uint64_t __28__PLBBMavHwRfTDSLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_45 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F929C0];
  id v11 = a3;
  if ([v10 debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PLBBMavHwRfTDSLogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1EBD59EC0 != -1) {
      dispatch_once(&qword_1EBD59EC0, block);
    }
    if (byte_1EBD59EB1)
    {
      id v35 = v8;
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfTDSLogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m"];
      objc_super v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"-[PLBBMavHwRfTDSLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:58];

      v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v8 = v35;
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __60__PLBBMavHwRfTDSLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v19;
    if (qword_1EBD59EC8 != -1) {
      dispatch_once(&qword_1EBD59EC8, v36);
    }
    if (byte_1EBD59EB2)
    {
      id v20 = v9;
      id v34 = v9;
      id v21 = v8;
      v22 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v8, v34];
      v23 = (void *)MEMORY[0x1E4F929B8];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"-[PLBBMavHwRfTDSLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:59];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v22;
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

  v31 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  v32 = [v31 convertFromBasebandToMonotonic];
  [v11 setEntryDate:v32];

  v33 = [(PLBasebandMessage *)self agent];
  [v33 logEntry:v11];
}

uint64_t __60__PLBBMavHwRfTDSLogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EB1 = result;
  return result;
}

uint64_t __60__PLBBMavHwRfTDSLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EB2 = result;
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
    block[2] = __63__PLBBMavHwRfTDSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD59ED0 != -1) {
      dispatch_once(&qword_1EBD59ED0, block);
    }
    if (byte_1EBD59EB3)
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:76];

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
    v25[2] = __63__PLBBMavHwRfTDSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_378;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD59ED8 != -1) {
      dispatch_once(&qword_1EBD59ED8, v25);
    }
    if (byte_1EBD59EB4)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      id v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m"];
      v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v20 logMessage:v18 fromFile:v22 fromFunction:v23 fromLineNumber:78];

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

uint64_t __63__PLBBMavHwRfTDSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EB3 = result;
  return result;
}

uint64_t __63__PLBBMavHwRfTDSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_378(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EB4 = result;
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
    block[2] = __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD59EE0 != -1) {
      dispatch_once(&qword_1EBD59EE0, block);
    }
    if (byte_1EBD59EB5)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfTDSLogMsg addPairWithKey:andWithVal:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m"];
      uint64_t v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLBBMavHwRfTDSLogMsg addPairWithKey:andWithVal:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:94];

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
      v30[2] = __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke_391;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD59EF0 != -1) {
        dispatch_once(&qword_1EBD59EF0, v30);
      }
      if (byte_1EBD59EB7)
      {
        v17 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m"];
        id v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLBBMavHwRfTDSLogMsg addPairWithKey:andWithVal:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:100];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v23 = [(PLBBMavHwRfTDSLogMsg *)self kvPairs];
    [v23 setObject:v7 forKey:v6];
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke_385;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD59EE8 != -1) {
      dispatch_once(&qword_1EBD59EE8, v31);
    }
    if (byte_1EBD59EB6)
    {
      v23 = [NSString stringWithFormat:@"Error: nil key for kvPair not expected, return"];
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMavHwRfTDSLogMsg addPairWithKey:andWithVal:]"];
      [v25 logMessage:v23 fromFile:v27 fromFunction:v28 fromLineNumber:97];

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

uint64_t __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EB5 = result;
  return result;
}

uint64_t __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke_385(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EB6 = result;
  return result;
}

uint64_t __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EB7 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMavHwRfTDS
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v26[0] = *MEMORY[0x1E4F92CD0];
  v26[1] = v2;
  v27[0] = &unk_1F29F0EC0;
  v27[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v26[2] = *MEMORY[0x1E4F92CB0];
  v26[3] = v3;
  v27[2] = @"refreshRequestHandler";
  v27[3] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29[0] = v18;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"SeqNum";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v25[0] = v16;
  v24[1] = @"BBDate";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v15, "commonTypeDict_DateFormat");
  v25[1] = v4;
  v24[2] = @"LogDuration";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v25[2] = v6;
  v24[3] = @"SrvcType";
  uint64_t v8 = *MEMORY[0x1E4F92D00];
  v21[0] = *MEMORY[0x1E4F92D10];
  uint64_t v7 = v21[0];
  v21[1] = v8;
  v23[0] = &unk_1F29E6EE0;
  v23[1] = &unk_1F29E6EF8;
  uint64_t v22 = *MEMORY[0x1E4F92D08];
  uint64_t v9 = v22;
  v23[2] = &unk_1F29E6F10;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v21 count:3];
  v25[3] = v10;
  v24[4] = @"RxDState";
  v19[0] = v7;
  v19[1] = v8;
  v20[0] = &unk_1F29E6EE0;
  v20[1] = &unk_1F29E6F28;
  v19[2] = v9;
  v20[2] = &unk_1F29E6F10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v25[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];
  v29[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v13;
}

- (void)refreshRequest
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMavHwRfTDS
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavHwRfTDS"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  [(PLBBMavHwRfTDSLogMsg *)self populateEntry:v4];
  v7[0] = @"entry";
  v7[1] = @"entryKey";
  v8[0] = v4;
  v8[1] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)populateEntry:(id)a3
{
  commonInfo = self->_commonInfo;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)commonInfo objectForKey:@"BBDate"];
  uint64_t v7 = [v6 convertFromBasebandToMonotonic];
  [v5 setEntryDate:v7];

  uint64_t v8 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v5 setObject:v8 forKeyedSubscript:@"BBDate"];

  uint64_t v9 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v5 setObject:v9 forKeyedSubscript:@"SeqNum"];

  uint64_t v10 = [(PLBBMavHwRfTDSLogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  id v11 = [(PLBBMavHwRfTDSLogMsg *)self srvcTypeCnt];
  [v5 setObject:v11 forKeyedSubscript:@"SrvcType"];

  id v12 = [(PLBBMavHwRfTDSLogMsg *)self rxdStateCnt];
  [v5 setObject:v12 forKeyedSubscript:@"RxDState"];
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

- (NSArray)srvcTypeCnt
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSrvcTypeCnt:(id)a3
{
}

- (NSArray)rxdStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRxdStateCnt:(id)a3
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
  objc_storeStrong((id *)&self->_rxdStateCnt, 0);
  objc_storeStrong((id *)&self->_srvcTypeCnt, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end