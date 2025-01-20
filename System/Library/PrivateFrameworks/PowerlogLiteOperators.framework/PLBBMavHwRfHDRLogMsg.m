@interface PLBBMavHwRfHDRLogMsg
+ (id)entryEventBackwardDefinitionBBMavHwRfHDR;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)lDTXOffFrame;
- (NSNumber)lDTXOnFrame;
- (NSNumber)logDuration;
- (NSNumber)sDTXOffFrame;
- (NSNumber)sDTXOnFrame;
- (NSNumber)tDTXOffFrame;
- (NSNumber)tDTXOnFrame;
- (NSString)error;
- (PLBBMavHwRfHDRLogMsg)init;
- (id)logEventBackwardBBMavHwRfHDR;
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
- (void)setLDTXOffFrame:(id)a3;
- (void)setLDTXOnFrame:(id)a3;
- (void)setLogDuration:(id)a3;
- (void)setSDTXOffFrame:(id)a3;
- (void)setSDTXOnFrame:(id)a3;
- (void)setTDTXOffFrame:(id)a3;
- (void)setTDTXOnFrame:(id)a3;
@end

@implementation PLBBMavHwRfHDRLogMsg

- (PLBBMavHwRfHDRLogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__PLBBMavHwRfHDRLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD59F60 != -1) {
      dispatch_once(&qword_1EBD59F60, block);
    }
    if (_MergedGlobals_1_47)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfHDRLogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfHDRLogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMavHwRfHDRLogMsg init]"];
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
  v16.super_class = (Class)PLBBMavHwRfHDRLogMsg;
  v10 = [(PLBBMavHwRfHDRLogMsg *)&v16 init];
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

uint64_t __28__PLBBMavHwRfHDRLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_47 = result;
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
    block[2] = __60__PLBBMavHwRfHDRLogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1EBD59F68 != -1) {
      dispatch_once(&qword_1EBD59F68, block);
    }
    if (byte_1EBD59F59)
    {
      id v35 = v8;
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfHDRLogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfHDRLogMsg.m"];
      objc_super v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"-[PLBBMavHwRfHDRLogMsg sendAndLogPLEntry:withName:withType:]"];
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
    v36[2] = __60__PLBBMavHwRfHDRLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v19;
    if (qword_1EBD59F70 != -1) {
      dispatch_once(&qword_1EBD59F70, v36);
    }
    if (byte_1EBD59F5A)
    {
      id v20 = v9;
      id v34 = v9;
      id v21 = v8;
      v22 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v8, v34];
      v23 = (void *)MEMORY[0x1E4F929B8];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfHDRLogMsg.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"-[PLBBMavHwRfHDRLogMsg sendAndLogPLEntry:withName:withType:]"];
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

uint64_t __60__PLBBMavHwRfHDRLogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59F59 = result;
  return result;
}

uint64_t __60__PLBBMavHwRfHDRLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_372(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59F5A = result;
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
    block[2] = __63__PLBBMavHwRfHDRLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD59F78 != -1) {
      dispatch_once(&qword_1EBD59F78, block);
    }
    if (byte_1EBD59F5B)
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfHDRLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfHDRLogMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBMavHwRfHDRLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
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
    v25[2] = __63__PLBBMavHwRfHDRLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_378;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1EBD59F80 != -1) {
      dispatch_once(&qword_1EBD59F80, v25);
    }
    if (byte_1EBD59F5C)
    {
      v18 = [NSString stringWithFormat:@"unable to set seqNum, date, timeCal"];
      id v20 = (void *)MEMORY[0x1E4F929B8];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfHDRLogMsg.m"];
      v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLBBMavHwRfHDRLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
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

uint64_t __63__PLBBMavHwRfHDRLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59F5B = result;
  return result;
}

uint64_t __63__PLBBMavHwRfHDRLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_378(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59F5C = result;
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
    block[2] = __50__PLBBMavHwRfHDRLogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD59F88 != -1) {
      dispatch_once(&qword_1EBD59F88, block);
    }
    if (byte_1EBD59F5D)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMavHwRfHDRLogMsg addPairWithKey:andWithVal:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfHDRLogMsg.m"];
      uint64_t v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLBBMavHwRfHDRLogMsg addPairWithKey:andWithVal:]"];
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
      v30[2] = __50__PLBBMavHwRfHDRLogMsg_addPairWithKey_andWithVal___block_invoke_391;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1EBD59F98 != -1) {
        dispatch_once(&qword_1EBD59F98, v30);
      }
      if (byte_1EBD59F5F)
      {
        v17 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfHDRLogMsg.m"];
        id v20 = [v19 lastPathComponent];
        id v21 = [NSString stringWithUTF8String:"-[PLBBMavHwRfHDRLogMsg addPairWithKey:andWithVal:]"];
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
    v23 = [(PLBBMavHwRfHDRLogMsg *)self kvPairs];
    [v23 setObject:v7 forKey:v6];
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__PLBBMavHwRfHDRLogMsg_addPairWithKey_andWithVal___block_invoke_385;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD59F90 != -1) {
      dispatch_once(&qword_1EBD59F90, v31);
    }
    if (byte_1EBD59F5E)
    {
      v23 = [NSString stringWithFormat:@"Error: nil key for kvPair not expected, return"];
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfHDRLogMsg.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMavHwRfHDRLogMsg addPairWithKey:andWithVal:]"];
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

uint64_t __50__PLBBMavHwRfHDRLogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59F5D = result;
  return result;
}

uint64_t __50__PLBBMavHwRfHDRLogMsg_addPairWithKey_andWithVal___block_invoke_385(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59F5E = result;
  return result;
}

uint64_t __50__PLBBMavHwRfHDRLogMsg_addPairWithKey_andWithVal___block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59F5F = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMavHwRfHDR
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F0F00;
  v29[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v28[2] = *MEMORY[0x1E4F92CB0];
  v28[3] = v3;
  v29[2] = @"refreshRequestHandler";
  v29[3] = MEMORY[0x1E4F1CC38];
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"SeqNum";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v27[0] = v23;
  v26[1] = @"BBDate";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v21 = objc_msgSend(v22, "commonTypeDict_DateFormat");
  v27[1] = v21;
  v26[2] = @"LogDuration";
  id v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
  v27[2] = v19;
  v26[3] = @"SDTXOnFrames";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
  v27[3] = v17;
  v26[4] = @"SDTXOffFrames";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
  v27[4] = v15;
  v26[5] = @"LTXOnFrames";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
  v27[5] = v5;
  v26[6] = @"LDTXOffFrames";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
  v27[6] = v7;
  v26[7] = @"TTXOnFrames";
  uint64_t v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
  v27[7] = v9;
  v26[8] = @"TDTXOffFrames";
  uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
  v27[8] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
  v31[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v13;
}

- (void)refreshRequest
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (id)logEventBackwardBBMavHwRfHDR
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BBMavHwRfHDR"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  [(PLBBMavHwRfHDRLogMsg *)self populateEntry:v4];
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

  uint64_t v10 = [(PLBBMavHwRfHDRLogMsg *)self logDuration];
  [v5 setObject:v10 forKeyedSubscript:@"LogDuration"];

  id v11 = [(PLBBMavHwRfHDRLogMsg *)self sDTXOnFrame];
  [v5 setObject:v11 forKeyedSubscript:@"SDTXOnFrames"];

  uint64_t v12 = [(PLBBMavHwRfHDRLogMsg *)self sDTXOffFrame];
  [v5 setObject:v12 forKeyedSubscript:@"SDTXOffFrames"];

  v13 = [(PLBBMavHwRfHDRLogMsg *)self lDTXOnFrame];
  [v5 setObject:v13 forKeyedSubscript:@"LTXOnFrames"];

  v14 = [(PLBBMavHwRfHDRLogMsg *)self lDTXOffFrame];
  [v5 setObject:v14 forKeyedSubscript:@"LDTXOffFrames"];

  int v15 = [(PLBBMavHwRfHDRLogMsg *)self tDTXOnFrame];
  [v5 setObject:v15 forKeyedSubscript:@"TTXOnFrames"];

  id v16 = [(PLBBMavHwRfHDRLogMsg *)self tDTXOffFrame];
  [v5 setObject:v16 forKeyedSubscript:@"TDTXOffFrames"];
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

- (NSNumber)sDTXOnFrame
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSDTXOnFrame:(id)a3
{
}

- (NSNumber)sDTXOffFrame
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSDTXOffFrame:(id)a3
{
}

- (NSNumber)lDTXOnFrame
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLDTXOnFrame:(id)a3
{
}

- (NSNumber)lDTXOffFrame
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLDTXOffFrame:(id)a3
{
}

- (NSNumber)tDTXOnFrame
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTDTXOnFrame:(id)a3
{
}

- (NSNumber)tDTXOffFrame
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTDTXOffFrame:(id)a3
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
  objc_storeStrong((id *)&self->_tDTXOffFrame, 0);
  objc_storeStrong((id *)&self->_tDTXOnFrame, 0);
  objc_storeStrong((id *)&self->_lDTXOffFrame, 0);
  objc_storeStrong((id *)&self->_lDTXOnFrame, 0);
  objc_storeStrong((id *)&self->_sDTXOffFrame, 0);
  objc_storeStrong((id *)&self->_sDTXOnFrame, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end