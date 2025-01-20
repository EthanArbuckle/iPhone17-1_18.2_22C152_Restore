@interface PLBBEurekaLogMsg
+ (id)bbEuLogMsgNameLTESleepMgrStats;
- (NSDate)bbDate;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSMutableString)sdAct;
- (NSMutableString)sdEvent;
- (NSMutableString)sdState;
- (NSNumber)bbSeqNum;
- (PLBBEurekaLogMsg)init;
- (double)bbTimeCal;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)logEventBackwardLTESleepMgrStatsWithVer:(id)a3 andML1State:(id)a4 andSES:(id)a5 andSDS:(id)a6 andStDur:(id)a7 andDSlpDur:(id)a8 andLSlpDur:(id)a9;
- (void)refreshLTESleepMgrStats;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setBbDate:(id)a3;
- (void)setBbSeqNum:(id)a3;
- (void)setBbTimeCal:(double *)a3;
- (void)setCommonInfo:(id)a3;
- (void)setError:(id)a3;
- (void)setEventCode:(unsigned int)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSdAct:(id)a3;
- (void)setSdEvent:(id)a3;
- (void)setSdState:(id)a3;
@end

@implementation PLBBEurekaLogMsg

- (PLBBEurekaLogMsg)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__PLBBEurekaLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AE50 != -1) {
      dispatch_once(&qword_1EBD5AE50, block);
    }
    if (_MergedGlobals_1_65)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg init]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:40];

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
  v16.super_class = (Class)PLBBEurekaLogMsg;
  v10 = [(PLBBEurekaLogMsg *)&v16 init];
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

uint64_t __24__PLBBEurekaLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_65 = result;
  return result;
}

- (void)setEventCode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLBBEurekaLogMsg_setEventCode___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5AE58 != -1) {
      dispatch_once(&qword_1EBD5AE58, block);
    }
    if (byte_1EBD5AE41)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg setEventCode:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg setEventCode:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:69];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v3)
  {
    v12 = [NSNumber numberWithInt:v3];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __33__PLBBEurekaLogMsg_setEventCode___block_invoke_19;
      v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v20[4] = v13;
      if (qword_1EBD5AE60 != -1) {
        dispatch_once(&qword_1EBD5AE60, v20);
      }
      if (byte_1EBD5AE42)
      {
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"set event code with %d", v3);
        v15 = (void *)MEMORY[0x1E4F929B8];
        objc_super v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg setEventCode:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:77];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v14;
          _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(NSMutableDictionary *)self->_commonInfo setValue:v12 forKey:@"EventCode"];
  }
}

uint64_t __33__PLBBEurekaLogMsg_setEventCode___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE41 = result;
  return result;
}

uint64_t __33__PLBBEurekaLogMsg_setEventCode___block_invoke_19(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE42 = result;
  return result;
}

- (void)setPayload:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__PLBBEurekaLogMsg_setPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5AE68 != -1) {
      dispatch_once(&qword_1EBD5AE68, block);
    }
    if (byte_1EBD5AE43)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg setPayload:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg setPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:87];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v4)
  {
    [(NSMutableDictionary *)self->_commonInfo setValue:v4 forKey:@"Payload"];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __31__PLBBEurekaLogMsg_setPayload___block_invoke_28;
    v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v19[4] = v12;
    if (qword_1EBD5AE70 != -1) {
      dispatch_once(&qword_1EBD5AE70, v19);
    }
    if (byte_1EBD5AE44)
    {
      uint64_t v13 = [NSString stringWithFormat:@"bad payload"];
      v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      objc_super v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg setPayload:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:89];

      v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __31__PLBBEurekaLogMsg_setPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE43 = result;
  return result;
}

uint64_t __31__PLBBEurekaLogMsg_setPayload___block_invoke_28(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE44 = result;
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
    v14 = __29__PLBBEurekaLogMsg_setError___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5AE78 != -1) {
      dispatch_once(&qword_1EBD5AE78, &block);
    }
    if (byte_1EBD5AE45)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg setError:]", block, v13, v14, v15, v16);
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg setError:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:100];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v4) {
    [(NSMutableDictionary *)self->_commonInfo setValue:v4 forKey:@"Error"];
  }
}

uint64_t __29__PLBBEurekaLogMsg_setError___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE45 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLBBEurekaLogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD5AE80 != -1) {
      dispatch_once(&qword_1EBD5AE80, block);
    }
    if (byte_1EBD5AE46)
    {
      id v12 = v10;
      id v13 = v9;
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg sendAndLogPLEntry:withName:withType:]");
      v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:117];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v13;
      id v10 = v12;
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v20 = objc_opt_class();
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __56__PLBBEurekaLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_40;
    v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v50[4] = v20;
    if (qword_1EBD5AE88 != -1) {
      dispatch_once(&qword_1EBD5AE88, v50);
    }
    if (byte_1EBD5AE47)
    {
      id v21 = v10;
      id v47 = v10;
      id v22 = v9;
      uint64_t v23 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v9, v47];
      uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:118];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v22;
      id v10 = v21;
    }
  }
  v29 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v8 setObject:v29 forKeyedSubscript:@"EventCode"];

  v30 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v8 setObject:v30 forKeyedSubscript:@"Payload"];

  v31 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v8 setObject:v31 forKeyedSubscript:@"Error"];

  v32 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v8 setObject:v32 forKeyedSubscript:@"SeqNum"];

  v33 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v8 setObject:v33 forKeyedSubscript:@"BBDate"];

  v34 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"TimeCal"];
  [v8 setObject:v34 forKeyedSubscript:@"TimeCal"];

  v35 = [(PLBasebandMessage *)self agent];

  if (!v35 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v36 = objc_opt_class();
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __56__PLBBEurekaLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_46;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v36;
    if (qword_1EBD5AE90 != -1) {
      dispatch_once(&qword_1EBD5AE90, v49);
    }
    if (byte_1EBD5AE48)
    {
      id v48 = v10;
      id v37 = v9;
      v38 = [NSString stringWithFormat:@"Bad agent"];
      v39 = (void *)MEMORY[0x1E4F929B8];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      v41 = [v40 lastPathComponent];
      v42 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg sendAndLogPLEntry:withName:withType:]"];
      [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:129];

      v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v38;
        _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v37;
      id v10 = v48;
    }
  }
  v44 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  v45 = [v44 convertFromBasebandToMonotonic];
  [v8 setEntryDate:v45];

  v46 = [(PLBasebandMessage *)self agent];
  [v46 logEntry:v8];
}

uint64_t __56__PLBBEurekaLogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE46 = result;
  return result;
}

uint64_t __56__PLBBEurekaLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_40(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE47 = result;
  return result;
}

uint64_t __56__PLBBEurekaLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_46(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE48 = result;
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
    block[2] = __59__PLBBEurekaLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD5AE98 != -1) {
      dispatch_once(&qword_1EBD5AE98, block);
    }
    if (byte_1EBD5AE49)
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      id v13 = (void *)MEMORY[0x1E4F929B8];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:144];

      v17 = PLLogCommon();
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
      v28[2] = __59__PLBBEurekaLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_52;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v19;
      if (qword_1EBD5AEA0 != -1) {
        dispatch_once(&qword_1EBD5AEA0, v28);
      }
      if (byte_1EBD5AE4A)
      {
        uint64_t v20 = [NSString stringWithFormat:@"Unable to set seqNum(%@), zero it", 0];
        id v21 = (void *)MEMORY[0x1E4F929B8];
        id v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
        uint64_t v23 = [v22 lastPathComponent];
        uint64_t v24 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:146];

        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v20;
          _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v18 = &unk_1F29E8068;
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v18 forKey:@"SeqNum"];
  [(NSMutableDictionary *)self->_commonInfo setValue:v10 forKey:@"BBDate"];

  commonInfo = self->_commonInfo;
  v27 = [NSNumber numberWithDouble:a5];
  [(NSMutableDictionary *)commonInfo setValue:v27 forKey:@"TimeCal"];
}

uint64_t __59__PLBBEurekaLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE49 = result;
  return result;
}

uint64_t __59__PLBBEurekaLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_52(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE4A = result;
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
    block[2] = __46__PLBBEurekaLogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD5AEA8 != -1) {
      dispatch_once(&qword_1EBD5AEA8, block);
    }
    if (byte_1EBD5AE4B)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg addPairWithKey:andWithVal:]");
      id v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg addPairWithKey:andWithVal:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:161];

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
      v25 = __46__PLBBEurekaLogMsg_addPairWithKey_andWithVal___block_invoke_59;
      v26 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v27 = v15;
      if (qword_1EBD5AEB0 != -1) {
        dispatch_once(&qword_1EBD5AEB0, &v23);
      }
      if (byte_1EBD5AE4C)
      {
        uint64_t v16 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7, v23, v24, v25, v26, v27];
        v17 = (void *)MEMORY[0x1E4F929B8];
        v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
        uint64_t v19 = [v18 lastPathComponent];
        uint64_t v20 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg addPairWithKey:andWithVal:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:163];

        id v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v16;
          _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v22 = [(PLBBEurekaLogMsg *)self kvPairs];
    [v22 setObject:v7 forKey:v6];
  }
}

uint64_t __46__PLBBEurekaLogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE4B = result;
  return result;
}

uint64_t __46__PLBBEurekaLogMsg_addPairWithKey_andWithVal___block_invoke_59(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE4C = result;
  return result;
}

- (void)refreshLTESleepMgrStats
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __43__PLBBEurekaLogMsg_refreshLTESleepMgrStats__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5AEB8 != -1) {
      dispatch_once(&qword_1EBD5AEB8, &block);
    }
    if (byte_1EBD5AE4D)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg refreshLTESleepMgrStats]", block, v15, v16, v17, v18);
      id v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      uint64_t v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg refreshLTESleepMgrStats]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:183];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"LTESleepMgrStats"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  id v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __43__PLBBEurekaLogMsg_refreshLTESleepMgrStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE4D = result;
  return result;
}

+ (id)bbEuLogMsgNameLTESleepMgrStats
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v34[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v32[0] = *MEMORY[0x1E4F92CD0];
  v32[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F92CB0];
  v32[2] = *MEMORY[0x1E4F92C70];
  v32[3] = v3;
  v33[0] = &unk_1F29F1480;
  v33[1] = MEMORY[0x1E4F1CC28];
  v33[2] = MEMORY[0x1E4F1CC28];
  v33[3] = @"refreshRequestHandler";
  v32[4] = *MEMORY[0x1E4F92CC0];
  v33[4] = MEMORY[0x1E4F1CC38];
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:5];
  v35[0] = v29;
  v34[1] = *MEMORY[0x1E4F92CA8];
  v30[0] = @"EventCode";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v31[0] = v27;
  v30[1] = @"Payload";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_StringFormat");
  v31[1] = v25;
  v30[2] = @"Error";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_BoolFormat");
  v31[2] = v23;
  v30[3] = @"Version";
  id v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v31[3] = v21;
  v30[4] = @"ML1State";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v31[4] = v19;
  v30[5] = @"SleepEnableSclk";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v31[5] = v17;
  v30[6] = @"SleepDisabledSclk";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v31[6] = v15;
  v30[7] = @"StateDuration";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v31[7] = v5;
  v30[8] = @"DeepSleepDuration";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v31[8] = v7;
  v30[9] = @"LightSleepDuration";
  uint64_t v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v31[9] = v9;
  v30[10] = @"BBDate";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_DateFormat");
  v31[10] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:11];
  v35[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  return v13;
}

- (void)logEventBackwardLTESleepMgrStatsWithVer:(id)a3 andML1State:(id)a4 andSES:(id)a5 andSDS:(id)a6 andStDur:(id)a7 andDSlpDur:(id)a8 andLSlpDur:(id)a9
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = (void *)MEMORY[0x1E4F929C0];
  id v37 = a9;
  id v36 = a8;
  id v35 = a7;
  id v34 = a6;
  id v33 = a5;
  id v17 = a4;
  id v18 = a3;
  if ([v16 debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__PLBBEurekaLogMsg_logEventBackwardLTESleepMgrStatsWithVer_andML1State_andSES_andSDS_andStDur_andDSlpDur_andLSlpDur___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v19;
    if (qword_1EBD5AEC0 != -1) {
      dispatch_once(&qword_1EBD5AEC0, block);
    }
    if (byte_1EBD5AE4E)
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaLogMsg logEventBackwardLTESleepMgrStatsWithVer:andML1State:andSES:andSDS:andStDur:andDSlpDur:andLSlpDur:]");
      uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
      id v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaLogMsg.m"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = [NSString stringWithUTF8String:"-[PLBBEurekaLogMsg logEventBackwardLTESleepMgrStatsWithVer:andML1State:andSES:andSDS:andStDur:andDSlpDur:andLSlpDur:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:234];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v20;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v26 = *MEMORY[0x1E4F92D28];
  uint64_t v27 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"LTESleepMgrStats"];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v27];
  v29 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v28 setObject:v29 forKeyedSubscript:@"EventCode"];

  v30 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v28 setObject:v30 forKeyedSubscript:@"Payload"];

  uint64_t v31 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v28 setObject:v31 forKeyedSubscript:@"Error"];

  [v28 setObject:v18 forKeyedSubscript:@"Version"];
  [v28 setObject:v17 forKeyedSubscript:@"ML1State"];

  [v28 setObject:v33 forKeyedSubscript:@"SleepEnableSclk"];
  [v28 setObject:v34 forKeyedSubscript:@"SleepDisabledSclk"];

  [v28 setObject:v35 forKeyedSubscript:@"StateDuration"];
  [v28 setObject:v36 forKeyedSubscript:@"DeepSleepDuration"];

  [v28 setObject:v37 forKeyedSubscript:@"LightSleepDuration"];
  [(PLBBEurekaLogMsg *)self sendAndLogPLEntry:v28 withName:@"LTESleepMgrStats" withType:v26];
  uint64_t v32 = [(PLBasebandMessage *)self agent];
  [v32 modelLTESLEEPMGRPower:v28];
}

uint64_t __117__PLBBEurekaLogMsg_logEventBackwardLTESleepMgrStatsWithVer_andML1State_andSES_andSDS_andStDur_andDSlpDur_andLSlpDur___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AE4E = result;
  return result;
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

- (NSNumber)bbSeqNum
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBbSeqNum:(id)a3
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

- (NSMutableString)sdEvent
{
  return self->_sdEvent;
}

- (void)setSdEvent:(id)a3
{
}

- (NSMutableString)sdAct
{
  return self->_sdAct;
}

- (void)setSdAct:(id)a3
{
}

- (NSMutableString)sdState
{
  return self->_sdState;
}

- (void)setSdState:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvPairs, 0);
  objc_storeStrong((id *)&self->_commonInfo, 0);
  objc_storeStrong((id *)&self->_sdState, 0);
  objc_storeStrong((id *)&self->_sdAct, 0);
  objc_storeStrong((id *)&self->_sdEvent, 0);
  objc_storeStrong((id *)&self->_bbSeqNum, 0);
  objc_storeStrong((id *)&self->_bbDate, 0);
}

@end