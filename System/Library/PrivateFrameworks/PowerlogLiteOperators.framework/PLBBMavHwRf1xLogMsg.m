@interface PLBBMavHwRf1xLogMsg
+ (id)entryEventBackwardDefinitionBBMavHwRf1x;
- (NSArray)callTypeDur;
- (NSDate)bbDate;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)bbSeqnum;
- (NSNumber)dtxOff;
- (NSNumber)dtxOn;
- (NSNumber)logDuration;
- (NSString)error;
- (PLBBMavHwRf1xLogMsg)init;
- (double)bbTimeCal;
- (id)logEventBackwardBBMavHwRf1x;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)populateEntry:(id)a3;
- (void)refreshRequest;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setBbDate:(id)a3;
- (void)setBbSeqnum:(id)a3;
- (void)setBbTimeCal:(double *)a3;
- (void)setCallTypeDur:(id)a3;
- (void)setCommonInfo:(id)a3;
- (void)setDtxOff:(id)a3;
- (void)setDtxOn:(id)a3;
- (void)setError:(id)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setLogDuration:(id)a3;
@end

@implementation PLBBMavHwRf1xLogMsg

- (PLBBMavHwRf1xLogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__PLBBMavHwRf1xLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD587D8 != -1) {
      dispatch_once(&qword_1EBD587D8, block);
    }
    if (_MergedGlobals_1_29)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRf1xLogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRf1xLogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRf1xLogMsg init]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:35];

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
  v16.super_class = (Class)PLBBMavHwRf1xLogMsg;
  v10 = [(PLBBMavHwRf1xLogMsg *)&v16 init];
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

uint64_t __27__PLBBMavHwRf1xLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_29 = result;
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
    block[2] = __59__PLBBMavHwRf1xLogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1EBD587E0 != -1) {
      dispatch_once(&qword_1EBD587E0, block);
    }
    if (byte_1EBD587D1)
    {
      id v35 = v8;
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRf1xLogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRf1xLogMsg.m"];
      objc_super v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"-[PLBBMavHwRf1xLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:54];

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
    v36[2] = __59__PLBBMavHwRf1xLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v19;
    if (qword_1EBD587E8 != -1) {
      dispatch_once(&qword_1EBD587E8, v36);
    }
    if (byte_1EBD587D2)
    {
      id v20 = v9;
      id v34 = v9;
      id v21 = v8;
      v22 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v8, v34];
      v23 = (void *)MEMORY[0x1E4F929B8];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRf1xLogMsg.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"-[PLBBMavHwRf1xLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:55];

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

uint64_t __59__PLBBMavHwRf1xLogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD587D1 = result;
  return result;
}

uint64_t __59__PLBBMavHwRf1xLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD587D2 = result;
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
    block[2] = __62__PLBBMavHwRf1xLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD587F0 != -1) {
      dispatch_once(&qword_1EBD587F0, block);
    }
    if (byte_1EBD587D3)
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRf1xLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRf1xLogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMavHwRf1xLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:72];

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
    v25[2] = __62__PLBBMavHwRf1xLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_378;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD587F8 != -1) {
      dispatch_once(&qword_1EBD587F8, v25);
    }
    if (byte_1EBD587D4)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      id v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRf1xLogMsg.m"];
      v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMavHwRf1xLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v20 logMessage:v18 fromFile:v22 fromFunction:v23 fromLineNumber:74];

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

uint64_t __62__PLBBMavHwRf1xLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD587D3 = result;
  return result;
}

uint64_t __62__PLBBMavHwRf1xLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_378(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD587D4 = result;
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
    block[2] = __49__PLBBMavHwRf1xLogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD58800 != -1) {
      dispatch_once(&qword_1EBD58800, block);
    }
    if (byte_1EBD587D5)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRf1xLogMsg addPairWithKey:andWithVal:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRf1xLogMsg.m"];
      uint64_t v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLBBMavHwRf1xLogMsg addPairWithKey:andWithVal:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:90];

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
      v30[2] = __49__PLBBMavHwRf1xLogMsg_addPairWithKey_andWithVal___block_invoke_391;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD58810 != -1) {
        dispatch_once(&qword_1EBD58810, v30);
      }
      if (byte_1EBD587D7)
      {
        v17 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRf1xLogMsg.m"];
        id v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLBBMavHwRf1xLogMsg addPairWithKey:andWithVal:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:96];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v23 = [(PLBBMavHwRf1xLogMsg *)self kvPairs];
    [v23 setObject:v7 forKey:v6];
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __49__PLBBMavHwRf1xLogMsg_addPairWithKey_andWithVal___block_invoke_385;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD58808 != -1) {
      dispatch_once(&qword_1EBD58808, v31);
    }
    if (byte_1EBD587D6)
    {
      v23 = [NSString stringWithFormat:@"Error: nil key for kvPair not expected, return"];
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRf1xLogMsg.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMavHwRf1xLogMsg addPairWithKey:andWithVal:]"];
      [v25 logMessage:v23 fromFile:v27 fromFunction:v28 fromLineNumber:93];

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

uint64_t __49__PLBBMavHwRf1xLogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD587D5 = result;
  return result;
}

uint64_t __49__PLBBMavHwRf1xLogMsg_addPairWithKey_andWithVal___block_invoke_385(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD587D6 = result;
  return result;
}

uint64_t __49__PLBBMavHwRf1xLogMsg_addPairWithKey_andWithVal___block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD587D7 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMavHwRf1x
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F29F0A00;
  v25[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v24[2] = *MEMORY[0x1E4F92CB0];
  v24[3] = v3;
  v25[2] = @"refreshRequestHandler";
  v25[3] = MEMORY[0x1E4F1CC38];
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v19;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"SeqNum";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v23[0] = v17;
  v22[1] = @"BBDate";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  v23[1] = v4;
  v22[2] = @"LogDuration";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v23[2] = v6;
  v22[3] = @"DTxOn";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v23[3] = v8;
  v22[4] = @"DTxOff";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v23[4] = v10;
  v22[5] = @"DurationInCallType";
  uint64_t v11 = *MEMORY[0x1E4F92D00];
  v20[0] = *MEMORY[0x1E4F92D10];
  v20[1] = v11;
  v21[0] = &unk_1F29E6118;
  v21[1] = &unk_1F29E6130;
  v20[2] = *MEMORY[0x1E4F92D08];
  v21[2] = &unk_1F29E6148;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v23[5] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];
  v27[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v14;
}

- (void)refreshRequest
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMavHwRf1x
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavHwRf1x"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  [(PLBBMavHwRf1xLogMsg *)self populateEntry:v4];
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
  id v7 = [v6 convertFromBasebandToMonotonic];
  [v5 setEntryDate:v7];

  uint64_t v8 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v5 setObject:v8 forKeyedSubscript:@"BBDate"];

  id v9 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v5 setObject:v9 forKeyedSubscript:@"SeqNum"];

  uint64_t v10 = [(PLBBMavHwRf1xLogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  uint64_t v11 = [(PLBBMavHwRf1xLogMsg *)self dtxOff];
  [v5 setObject:v11 forKeyedSubscript:@"DTxOn"];

  uint64_t v12 = [(PLBBMavHwRf1xLogMsg *)self dtxOn];
  [v5 setObject:v12 forKeyedSubscript:@"DTxOff"];

  id v13 = [(PLBBMavHwRf1xLogMsg *)self callTypeDur];
  [v5 setObject:v13 forKeyedSubscript:@"DurationInCallType"];
}

- (NSDate)bbDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBbDate:(id)a3
{
}

- (double)bbTimeCal
{
  return self->_bbTimeCal;
}

- (void)setBbTimeCal:(double *)a3
{
  self->_bbTimeCal = a3;
}

- (NSNumber)bbSeqnum
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBbSeqnum:(id)a3
{
}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setError:(id)a3
{
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLogDuration:(id)a3
{
}

- (NSNumber)dtxOn
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDtxOn:(id)a3
{
}

- (NSNumber)dtxOff
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDtxOff:(id)a3
{
}

- (NSArray)callTypeDur
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCallTypeDur:(id)a3
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
  objc_storeStrong((id *)&self->_callTypeDur, 0);
  objc_storeStrong((id *)&self->_dtxOff, 0);
  objc_storeStrong((id *)&self->_dtxOn, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bbSeqnum, 0);
  objc_storeStrong((id *)&self->_bbDate, 0);
}

@end