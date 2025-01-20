@interface PLBBEurekaEventMsg
+ (id)bbEuEvMsgEventNotProcessed;
+ (id)bbEuEvMsgNameBBEurekaMsgLite;
+ (id)bbEuEvMsgNameCMCDMAExit;
+ (id)bbEuEvMsgNameCMCallEventConn;
+ (id)bbEuEvMsgNameCMCallEventConnV2;
+ (id)bbEuEvMsgNameCMCallEventEnd;
+ (id)bbEuEvMsgNameCMCallEventEndV2;
+ (id)bbEuEvMsgNameCMCallEventIncom;
+ (id)bbEuEvMsgNameCMCallEventOrig;
+ (id)bbEuEvMsgNameCMCallEventOrigV2;
+ (id)bbEuEvMsgNameGSML1State;
+ (id)bbEuEvMsgNameLTERRCState;
+ (id)bbEuEvMsgNameSDEventActionCode;
+ (id)bbEuEvMsgNameWCDMARRCState;
+ (id)bbEuEvMsgUTRANRRCState;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSMutableString)sdAct;
- (NSMutableString)sdEvent;
- (NSMutableString)sdState;
- (PLBBEurekaEventMsg)init;
- (unsigned)inited;
- (void)addPairWithKey:(id)a3 andWithVal:(id)a4;
- (void)appendToError:(id)a3;
- (void)logEventCMCallEventConnWithId:(id)a3 andCallType:(id)a4 andSysMode:(id)a5;
- (void)logEventCMCallEventConnWithId:(id)a3 andCallType:(id)a4 andSysMode:(id)a5 andClientId:(id)a6;
- (void)logEventCMCallEventEndWithId:(id)a3 andNumCalls:(id)a4;
- (void)logEventCMCallEventEndWithId:(id)a3 andNumCalls:(id)a4 andClientId:(id)a5;
- (void)logEventCMCallEventOrigWithId:(id)a3 andCallType:(id)a4 andSrvType:(id)a5;
- (void)logEventCMCallEventOrigWithId:(id)a3 andCallType:(id)a4 andSrvType:(id)a5 andClientId:(id)a6;
- (void)logEventForwardBBEurekaEventMsgLite;
- (void)logEventForwardGSML1StateWith:(id)a3;
- (void)logEventForwardLTERRCStateAs:(id)a3;
- (void)logEventForwardSDEventActionCode;
- (void)logEventForwardUTRANRRCNextStateAs:(id)a3 andCurrStateAs:(id)a4 andRateAs:(id)a5;
- (void)logEventForwardWCDMARRCPrevStateAs:(id)a3 andCurrState:(id)a4 andRate:(id)a5;
- (void)logEventNoneEventNotProcessed;
- (void)logEventPointCMExitCodeWithState:(id)a3;
- (void)refreshBBEurekaEventMsgLite;
- (void)refreshEventNotProcessed;
- (void)refreshLTERRCState;
- (void)refreshSDEventActionCode;
- (void)refreshUTRANRRCState;
- (void)refreshWCDMARRCState;
- (void)sendAndLogPLEntry:(id)a3;
- (void)setCommonInfo:(id)a3;
- (void)setError:(id)a3;
- (void)setEventCode:(unsigned int)a3;
- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5;
- (void)setInited:(unsigned __int8)a3;
- (void)setKvPairs:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSDEventActionCodeWith:(id)a3 andSDAction:(id)a4 andSDState:(id)a5;
- (void)setSdAct:(id)a3;
- (void)setSdEvent:(id)a3;
- (void)setSdState:(id)a3;
@end

@implementation PLBBEurekaEventMsg

- (PLBBEurekaEventMsg)init
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PLBBEurekaEventMsg;
  v2 = [(PLBBEurekaEventMsg *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v11[0] = @"Validity";
    v11[1] = @"EventCode";
    v11[2] = @"Payload";
    v11[3] = @"Error";
    v11[4] = @"SeqNum";
    v11[5] = @"BBDate";
    v11[6] = @"TimeCal";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];
    uint64_t v5 = [v3 initWithObjects:&unk_1F29EEDF8 forKeys:v4];
    commonInfo = v2->_commonInfo;
    v2->_commonInfo = (NSMutableDictionary *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    kvPairs = v2->_kvPairs;
    v2->_kvPairs = v7;

    v2->_inited = 1;
  }
  return v2;
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
    block[2] = __35__PLBBEurekaEventMsg_setEventCode___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5A070 != -1) {
      dispatch_once(&qword_1EBD5A070, block);
    }
    if (_MergedGlobals_1_49)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg setEventCode:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      v9 = [v8 lastPathComponent];
      objc_super v10 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg setEventCode:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:85];

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
      v20[2] = __35__PLBBEurekaEventMsg_setEventCode___block_invoke_47;
      v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v20[4] = v13;
      if (qword_1EBD5A078 != -1) {
        dispatch_once(&qword_1EBD5A078, v20);
      }
      if (byte_1EBD5A049)
      {
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"set event code with %d", v3);
        v15 = (void *)MEMORY[0x1E4F929B8];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg setEventCode:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:93];

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

uint64_t __35__PLBBEurekaEventMsg_setEventCode___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_49 = result;
  return result;
}

uint64_t __35__PLBBEurekaEventMsg_setEventCode___block_invoke_47(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A049 = result;
  return result;
}

- (void)setPayload:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLBBEurekaEventMsg_setPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5A080 != -1) {
      dispatch_once(&qword_1EBD5A080, block);
    }
    if (byte_1EBD5A04A)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg setPayload:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      v9 = [v8 lastPathComponent];
      objc_super v10 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg setPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:102];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v12 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v4)
  {
    if (v12)
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __33__PLBBEurekaEventMsg_setPayload___block_invoke_59;
      v30 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v31 = v13;
      if (qword_1EBD5A090 != -1) {
        dispatch_once(&qword_1EBD5A090, &v27);
      }
      if (byte_1EBD5A04C)
      {
        v14 = [NSString stringWithFormat:@"set payload with with %@", v4, v27, v28, v29, v30, v31];
        v15 = (void *)MEMORY[0x1E4F929B8];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg setPayload:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:107];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(NSMutableDictionary *)self->_commonInfo setValue:v4 forKey:@"Payload"];
  }
  else if (v12)
  {
    uint64_t v20 = objc_opt_class();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __33__PLBBEurekaEventMsg_setPayload___block_invoke_53;
    v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v32[4] = v20;
    if (qword_1EBD5A088 != -1) {
      dispatch_once(&qword_1EBD5A088, v32);
    }
    if (byte_1EBD5A04B)
    {
      v21 = [NSString stringWithFormat:@"bad payload"];
      v22 = (void *)MEMORY[0x1E4F929B8];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg setPayload:]"];
      [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:104];

      v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v21;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __33__PLBBEurekaEventMsg_setPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A04A = result;
  return result;
}

uint64_t __33__PLBBEurekaEventMsg_setPayload___block_invoke_53(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A04B = result;
  return result;
}

uint64_t __33__PLBBEurekaEventMsg_setPayload___block_invoke_59(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A04C = result;
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
    v14 = __31__PLBBEurekaEventMsg_setError___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5A098 != -1) {
      dispatch_once(&qword_1EBD5A098, &block);
    }
    if (byte_1EBD5A04D)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg setError:]", block, v13, v14, v15, v16);
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      v9 = [v8 lastPathComponent];
      objc_super v10 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg setError:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:117];

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

uint64_t __31__PLBBEurekaEventMsg_setError___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A04D = result;
  return result;
}

- (void)appendToError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __36__PLBBEurekaEventMsg_appendToError___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5A0A0 != -1) {
      dispatch_once(&qword_1EBD5A0A0, &block);
    }
    if (byte_1EBD5A04E)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg appendToError:]", block, v13, v14, v15, v16);
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      v9 = [v8 lastPathComponent];
      objc_super v10 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg appendToError:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:125];

      v11 = PLLogCommon();
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

uint64_t __36__PLBBEurekaEventMsg_appendToError___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A04E = result;
  return result;
}

- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void *)MEMORY[0x1E4F929C0];
  id v10 = a4;
  if ([v9 debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PLBBEurekaEventMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD5A0A8 != -1) {
      dispatch_once(&qword_1EBD5A0A8, block);
    }
    if (byte_1EBD5A04F)
    {
      int v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:134];

      v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v12;
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
      v28[2] = __61__PLBBEurekaEventMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_65;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v19;
      if (qword_1EBD5A0B0 != -1) {
        dispatch_once(&qword_1EBD5A0B0, v28);
      }
      if (byte_1EBD5A050)
      {
        uint64_t v20 = [NSString stringWithFormat:@"unable to set seqNum(%@)", 0];
        v21 = (void *)MEMORY[0x1E4F929B8];
        v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
        v23 = [v22 lastPathComponent];
        uint64_t v24 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:136];

        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v20;
          _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v18 = &unk_1F29E7378;
  }
  [(NSMutableDictionary *)self->_commonInfo setObject:v18 forKey:@"SeqNum"];
  [(NSMutableDictionary *)self->_commonInfo setValue:v10 forKey:@"BBDate"];

  commonInfo = self->_commonInfo;
  uint64_t v27 = [NSNumber numberWithDouble:a5];
  [(NSMutableDictionary *)commonInfo setValue:v27 forKey:@"TimeCal"];
}

uint64_t __61__PLBBEurekaEventMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A04F = result;
  return result;
}

uint64_t __61__PLBBEurekaEventMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_65(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A050 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLBBEurekaEventMsg_sendAndLogPLEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5A0B8 != -1) {
      dispatch_once(&qword_1EBD5A0B8, block);
    }
    if (byte_1EBD5A051)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg sendAndLogPLEntry:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg sendAndLogPLEntry:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:157];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v12 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v4 setObject:v12 forKeyedSubscript:@"EventCode"];

  uint64_t v13 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v4 setObject:v13 forKeyedSubscript:@"Payload"];

  v14 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v4 setObject:v14 forKeyedSubscript:@"Error"];

  v15 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"SeqNum"];
  [v4 setObject:v15 forKeyedSubscript:@"SeqNum"];

  uint64_t v16 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  [v4 setObject:v16 forKeyedSubscript:@"BBDate"];

  v17 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"TimeCal"];
  [v4 setObject:v17 forKeyedSubscript:@"TimeCal"];

  v18 = [(PLBasebandMessage *)self agent];

  if (!v18 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __40__PLBBEurekaEventMsg_sendAndLogPLEntry___block_invoke_72;
    v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v29[4] = v19;
    if (qword_1EBD5A0C0 != -1) {
      dispatch_once(&qword_1EBD5A0C0, v29);
    }
    if (byte_1EBD5A052)
    {
      uint64_t v20 = [NSString stringWithFormat:@"Bad agent"];
      v21 = (void *)MEMORY[0x1E4F929B8];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      v23 = [v22 lastPathComponent];
      uint64_t v24 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg sendAndLogPLEntry:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:168];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v20;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v26 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"BBDate"];
  uint64_t v27 = [v26 convertFromBasebandToMonotonic];
  [v4 setEntryDate:v27];

  uint64_t v28 = [(PLBasebandMessage *)self agent];
  [v28 logEntry:v4];
}

uint64_t __40__PLBBEurekaEventMsg_sendAndLogPLEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A051 = result;
  return result;
}

uint64_t __40__PLBBEurekaEventMsg_sendAndLogPLEntry___block_invoke_72(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A052 = result;
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
    block[2] = __48__PLBBEurekaEventMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD5A0C8 != -1) {
      dispatch_once(&qword_1EBD5A0C8, block);
    }
    if (byte_1EBD5A053)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg addPairWithKey:andWithVal:]");
      id v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      int v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg addPairWithKey:andWithVal:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:205];

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
      v25 = __48__PLBBEurekaEventMsg_addPairWithKey_andWithVal___block_invoke_78;
      v26 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v27 = v15;
      if (qword_1EBD5A0D0 != -1) {
        dispatch_once(&qword_1EBD5A0D0, &v23);
      }
      if (byte_1EBD5A054)
      {
        uint64_t v16 = [NSString stringWithFormat:@"Add KVPair [%@,%@]", v6, v7, v23, v24, v25, v26, v27];
        v17 = (void *)MEMORY[0x1E4F929B8];
        v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
        uint64_t v19 = [v18 lastPathComponent];
        uint64_t v20 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg addPairWithKey:andWithVal:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:207];

        v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v16;
          _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v22 = [(PLBBEurekaEventMsg *)self kvPairs];
    [v22 setObject:v7 forKey:v6];
  }
}

uint64_t __48__PLBBEurekaEventMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A053 = result;
  return result;
}

uint64_t __48__PLBBEurekaEventMsg_addPairWithKey_andWithVal___block_invoke_78(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A054 = result;
  return result;
}

- (void)refreshBBEurekaEventMsgLite
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __49__PLBBEurekaEventMsg_refreshBBEurekaEventMsgLite__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5A0D8 != -1) {
      dispatch_once(&qword_1EBD5A0D8, &block);
    }
    if (byte_1EBD5A055)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg refreshBBEurekaEventMsgLite]", block, v15, v16, v17, v18);
      id v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg refreshBBEurekaEventMsgLite]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:246];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"BBEurekaEventMsgLite"];
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  uint64_t v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __49__PLBBEurekaEventMsg_refreshBBEurekaEventMsgLite__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A055 = result;
  return result;
}

+ (id)bbEuEvMsgNameBBEurekaMsgLite
{
  v32[3] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v29[0] = *MEMORY[0x1E4F92CD0];
  v29[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F92CB0];
  v29[2] = *MEMORY[0x1E4F92C70];
  v29[3] = v3;
  v30[2] = MEMORY[0x1E4F1CC28];
  v30[3] = @"refreshRequestHandler";
  v30[0] = &unk_1F29F0F30;
  v30[1] = MEMORY[0x1E4F1CC38];
  v29[4] = *MEMORY[0x1E4F92CC0];
  v30[4] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];
  v32[0] = v24;
  v31[1] = *MEMORY[0x1E4F92CA8];
  v27[0] = @"EventCode";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v28[0] = v22;
  v27[1] = @"Payload";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v28[1] = v20;
  v27[2] = @"Error";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v28[2] = v18;
  v27[3] = @"SeqNum";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v28[3] = v16;
  v27[4] = @"BBDate";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v15, "commonTypeDict_DateFormat");
  v28[4] = v4;
  v27[5] = @"TimeCal";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v28[5] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];
  v32[1] = v7;
  v31[2] = *MEMORY[0x1E4F92C68];
  v25[0] = @"value";
  uint64_t v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v25[1] = @"unit";
  v26[0] = v9;
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v26[1] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v32[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

  return v13;
}

- (void)logEventForwardBBEurekaEventMsgLite
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PLBBEurekaEventMsg_logEventForwardBBEurekaEventMsgLite__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5A0E0 != -1) {
      dispatch_once(&qword_1EBD5A0E0, block);
    }
    if (byte_1EBD5A056)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventForwardBBEurekaEventMsgLite]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventForwardBBEurekaEventMsgLite]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:295];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"BBEurekaEventMsgLite"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v12 = [(PLBBEurekaEventMsg *)self kvPairs];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v18 = [(PLBBEurekaEventMsg *)self kvPairs];
        uint64_t v19 = [v18 objectForKey:v17];
        [v11 setObject:v19 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v14);
  }

  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v11];
}

uint64_t __57__PLBBEurekaEventMsg_logEventForwardBBEurekaEventMsgLite__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A056 = result;
  return result;
}

- (void)refreshSDEventActionCode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __46__PLBBEurekaEventMsg_refreshSDEventActionCode__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5A0E8 != -1) {
      dispatch_once(&qword_1EBD5A0E8, &block);
    }
    if (byte_1EBD5A057)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg refreshSDEventActionCode]", block, v15, v16, v17, v18);
      id v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg refreshSDEventActionCode]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:319];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SDEventActionCode"];
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  uint64_t v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __46__PLBBEurekaEventMsg_refreshSDEventActionCode__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A057 = result;
  return result;
}

+ (id)bbEuEvMsgNameSDEventActionCode
{
  v38[3] = *MEMORY[0x1E4F143B8];
  v37[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v35[0] = *MEMORY[0x1E4F92CD0];
  v35[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F92CB0];
  v35[2] = *MEMORY[0x1E4F92C70];
  v35[3] = v3;
  v36[2] = MEMORY[0x1E4F1CC28];
  v36[3] = @"refreshRequestHandler";
  v36[0] = &unk_1F29F0F30;
  v36[1] = MEMORY[0x1E4F1CC38];
  v35[4] = *MEMORY[0x1E4F92CC0];
  v36[4] = MEMORY[0x1E4F1CC38];
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:5];
  v38[0] = v30;
  v37[1] = *MEMORY[0x1E4F92CA8];
  v33[0] = @"EventCode";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v34[0] = v28;
  v33[1] = @"Payload";
  uint64_t v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat");
  v34[1] = v26;
  v33[2] = @"Error";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v24 = objc_msgSend(v25, "commonTypeDict_BoolFormat");
  v34[2] = v24;
  v33[3] = @"SeqNum";
  long long v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v34[3] = v22;
  v33[4] = @"BBDate";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v20 = objc_msgSend(v21, "commonTypeDict_DateFormat");
  v34[4] = v20;
  v33[5] = @"TimeCal";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v34[5] = v18;
  v33[6] = @"Event";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v34[6] = v16;
  v33[7] = @"Action";
  uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v34[7] = v4;
  v33[8] = @"State";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v34[8] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:9];
  v38[1] = v7;
  v37[2] = *MEMORY[0x1E4F92C68];
  v31[0] = @"value";
  uint64_t v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v31[1] = @"unit";
  v32[0] = v9;
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v32[1] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v38[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

  return v13;
}

- (void)setSDEventActionCodeWith:(id)a3 andSDAction:(id)a4 andSDState:(id)a5
{
  commonInfo = self->_commonInfo;
  id v10 = a5;
  id v9 = a4;
  [(NSMutableDictionary *)commonInfo setObject:a3 forKey:@"Event"];
  [(NSMutableDictionary *)self->_commonInfo setObject:v9 forKey:@"Action"];

  [(NSMutableDictionary *)self->_commonInfo setObject:v10 forKey:@"State"];
}

- (void)logEventForwardSDEventActionCode
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PLBBEurekaEventMsg_logEventForwardSDEventActionCode__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5A0F0 != -1) {
      dispatch_once(&qword_1EBD5A0F0, block);
    }
    if (byte_1EBD5A058)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventForwardSDEventActionCode]");
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventForwardSDEventActionCode]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:385];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SDEventActionCode"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  int v12 = [(PLBBEurekaEventMsg *)self commonInfo];
  uint64_t v13 = [v12 objectForKey:@"Event"];
  [v11 setObject:v13 forKeyedSubscript:@"Event"];

  uint64_t v14 = [(PLBBEurekaEventMsg *)self commonInfo];
  uint64_t v15 = [v14 objectForKey:@"Action"];
  [v11 setObject:v15 forKeyedSubscript:@"Action"];

  uint64_t v16 = [(PLBBEurekaEventMsg *)self commonInfo];
  uint64_t v17 = [v16 objectForKey:@"State"];
  [v11 setObject:v17 forKeyedSubscript:@"State"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v18 = [(PLBBEurekaEventMsg *)self kvPairs];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v24 = [(PLBBEurekaEventMsg *)self kvPairs];
        v25 = [v24 objectForKey:v23];
        [v11 setObject:v25 forKeyedSubscript:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v11];
  v26 = [(PLBasebandMessage *)self agent];
  [v26 modelOOSPower:v11];
}

uint64_t __54__PLBBEurekaEventMsg_logEventForwardSDEventActionCode__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A058 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventConn
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F0F40;
  v29[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v28[2] = *MEMORY[0x1E4F92CB0];
  v28[3] = v3;
  v29[2] = @"refreshRequestHandler";
  v29[3] = MEMORY[0x1E4F1CC38];
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"EventCode";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v27[0] = v23;
  v26[1] = @"Payload";
  long long v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v27[1] = v21;
  void v26[2] = @"Error";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v27[2] = v19;
  v26[3] = @"SeqNum";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v27[3] = v17;
  v26[4] = @"BBDate";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  v27[4] = v15;
  v26[5] = @"TimeCal";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v27[5] = v5;
  v26[6] = @"callId";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v27[6] = v7;
  v26[7] = @"callType";
  uint64_t v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v27[7] = v9;
  v26[8] = @"systemMode";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v27[8] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
  v31[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v13;
}

- (void)logEventCMCallEventConnWithId:(id)a3 andCallType:(id)a4 andSysMode:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F929C0];
  id v10 = a4;
  id v11 = a3;
  if ([v9 debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    uint64_t v35 = __75__PLBBEurekaEventMsg_logEventCMCallEventConnWithId_andCallType_andSysMode___block_invoke;
    uint64_t v36 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v37 = v12;
    if (qword_1EBD5A0F8 != -1) {
      dispatch_once(&qword_1EBD5A0F8, &block);
    }
    if (byte_1EBD5A059)
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:]", block, v34, v35, v36, v37);
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:465];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v19 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"CMCallEventConnCode"];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19];
  uint64_t v21 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v20 setObject:v21 forKeyedSubscript:@"EventCode"];

  long long v22 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v20 setObject:v22 forKeyedSubscript:@"Payload"];

  uint64_t v23 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v20 setObject:v23 forKeyedSubscript:@"Error"];

  [v20 setObject:v11 forKeyedSubscript:@"callId"];
  [v20 setObject:v10 forKeyedSubscript:@"callType"];
  [v20 setObject:v8 forKeyedSubscript:@"systemMode"];
  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v20];
  int v24 = [v10 isEqualToString:@"VOICE"];

  if (v24)
  {
    if ([v8 isEqualToString:@"CDMA"])
    {
      v25 = [(PLBasebandMessage *)self agent];
      v26 = v25;
      long long v27 = @"CDMA2K";
      long long v28 = v20;
    }
    else
    {
      uint64_t v32 = @"GSM";
      if (![v8 isEqualToString:@"GSM"])
      {
        uint64_t v32 = @"WCDMA";
        if (![v8 isEqualToString:@"WCDMA"])
        {
          uint64_t v32 = @"UTRAN";
          if (![v8 isEqualToString:@"UTRAN"]) {
            goto LABEL_18;
          }
        }
      }
      v25 = [(PLBasebandMessage *)self agent];
      v26 = v25;
      long long v28 = v20;
      long long v27 = v32;
    }
    [v25 modelStateTransitionPower:v28 rat:v27 state:@"Voice"];

LABEL_18:
    long long v30 = [(PLBasebandMessage *)self agent];
    [v30 accountVoicePower:v20 state:@"voice_start"];
LABEL_22:

    goto LABEL_23;
  }
  if ([v8 isEqualToString:@"HDR"])
  {
    long long v29 = [(PLBasebandMessage *)self agent];
    long long v30 = v29;
    uint64_t v31 = @"1xEVDO";
LABEL_21:
    [v29 modelStateTransitionPower:v20 rat:v31 state:@"Connected"];
    goto LABEL_22;
  }
  if ([v8 isEqualToString:@"CDMA"])
  {
    long long v29 = [(PLBasebandMessage *)self agent];
    long long v30 = v29;
    uint64_t v31 = @"CDMA2K";
    goto LABEL_21;
  }
LABEL_23:
}

uint64_t __75__PLBBEurekaEventMsg_logEventCMCallEventConnWithId_andCallType_andSysMode___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A059 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventEnd
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v26[0] = *MEMORY[0x1E4F92CD0];
  v26[1] = v2;
  v27[0] = &unk_1F29F0F40;
  v27[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  void v26[2] = *MEMORY[0x1E4F92CB0];
  v26[3] = v3;
  v27[2] = @"refreshRequestHandler";
  v27[3] = MEMORY[0x1E4F1CC38];
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"EventCode";
  long long v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v25[0] = v21;
  v24[1] = @"Payload";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_StringFormat");
  v25[1] = v19;
  v24[2] = @"Error";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_BoolFormat");
  void v25[2] = v17;
  v24[3] = @"SeqNum";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v25[3] = v15;
  v24[4] = @"BBDate";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v25[4] = v5;
  v24[5] = @"TimeCal";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v25[5] = v7;
  v24[6] = @"numberOfCalls";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v25[6] = v9;
  v24[7] = @"callId";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v25[7] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];
  v29[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v13;
}

- (void)logEventCMCallEventEndWithId:(id)a3 andNumCalls:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F929C0];
  id v7 = a4;
  id v8 = a3;
  if ([v6 debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __63__PLBBEurekaEventMsg_logEventCMCallEventEndWithId_andNumCalls___block_invoke;
    long long v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v28 = v9;
    if (qword_1EBD5A100 != -1) {
      dispatch_once(&qword_1EBD5A100, &block);
    }
    if (byte_1EBD5A05A)
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:]", block, v25, v26, v27, v28);
      id v11 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:543];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v30 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v16 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CMCallEventEndCode"];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16];
  uint64_t v18 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v17 setObject:v18 forKeyedSubscript:@"EventCode"];

  uint64_t v19 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v17 setObject:v19 forKeyedSubscript:@"Payload"];

  uint64_t v20 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v17 setObject:v20 forKeyedSubscript:@"Error"];

  [v17 setObject:v8 forKeyedSubscript:@"callId"];
  [v17 setObject:v7 forKeyedSubscript:@"numberOfCalls"];

  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v17];
  uint64_t v21 = [(PLBasebandMessage *)self agent];
  [v21 modelStateTransitionPower:v17 rat:@"CDMA2K" state:@"Inactive"];

  long long v22 = [(PLBasebandMessage *)self agent];
  [v22 modelStateTransitionPower:v17 rat:@"1xEVDO" state:@"Inactive"];

  uint64_t v23 = [(PLBasebandMessage *)self agent];
  [v23 accountVoicePower:v17 state:@"voice_end"];
}

uint64_t __63__PLBBEurekaEventMsg_logEventCMCallEventEndWithId_andNumCalls___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A05A = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventOrig
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F0F40;
  v29[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  void v28[2] = *MEMORY[0x1E4F92CB0];
  v28[3] = v3;
  v29[2] = @"refreshRequestHandler";
  v29[3] = MEMORY[0x1E4F1CC38];
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"EventCode";
  int v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v27[0] = v23;
  v26[1] = @"Payload";
  long long v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v27[1] = v21;
  void v26[2] = @"Error";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v27[2] = v19;
  v26[3] = @"SeqNum";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v27[3] = v17;
  void v26[4] = @"BBDate";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  void v27[4] = v15;
  v26[5] = @"TimeCal";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v27[5] = v5;
  v26[6] = @"callId";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v27[6] = v7;
  v26[7] = @"callType";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v27[7] = v9;
  v26[8] = @"serviceType";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v27[8] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
  v31[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v13;
}

- (void)logEventCMCallEventOrigWithId:(id)a3 andCallType:(id)a4 andSrvType:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F929C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if ([v8 debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __75__PLBBEurekaEventMsg_logEventCMCallEventOrigWithId_andCallType_andSrvType___block_invoke;
    long long v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v28 = v12;
    if (qword_1EBD5A108 != -1) {
      dispatch_once(&qword_1EBD5A108, &block);
    }
    if (byte_1EBD5A05B)
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:]", block, v25, v26, v27, v28);
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:602];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v30 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v19 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"CMCallEventOrigCode"];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19];
  uint64_t v21 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v20 setObject:v21 forKeyedSubscript:@"EventCode"];

  long long v22 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v20 setObject:v22 forKeyedSubscript:@"Payload"];

  uint64_t v23 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v20 setObject:v23 forKeyedSubscript:@"Error"];

  [v20 setObject:v11 forKeyedSubscript:@"callId"];
  [v20 setObject:v10 forKeyedSubscript:@"callType"];

  [v20 setObject:v9 forKeyedSubscript:@"serviceType"];
  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v20];
}

uint64_t __75__PLBBEurekaEventMsg_logEventCMCallEventOrigWithId_andCallType_andSrvType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A05B = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventConnV2
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v32[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v30[0] = *MEMORY[0x1E4F92CD0];
  v30[1] = v2;
  v31[0] = &unk_1F29F0F40;
  v31[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  void v30[2] = *MEMORY[0x1E4F92CB0];
  v30[3] = v3;
  void v31[2] = @"refreshRequestHandler";
  void v31[3] = MEMORY[0x1E4F1CC38];
  long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E4F92CA8];
  v28[0] = @"EventCode";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v29[0] = v25;
  v28[1] = @"Payload";
  int v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_StringFormat");
  v29[1] = v23;
  void v28[2] = @"Error";
  long long v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_BoolFormat");
  v29[2] = v21;
  v28[3] = @"SeqNum";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v29[3] = v19;
  void v28[4] = @"BBDate";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  void v29[4] = v17;
  void v28[5] = @"TimeCal";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  void v29[5] = v15;
  void v28[6] = @"callId";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v29[6] = v5;
  v28[7] = @"callType";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v29[7] = v7;
  v28[8] = @"systemMode";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v29[8] = v9;
  v28[9] = @"clientId";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v29[9] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:10];
  v33[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  return v13;
}

- (void)logEventCMCallEventConnWithId:(id)a3 andCallType:(id)a4 andSysMode:(id)a5 andClientId:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F929C0];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  if ([v11 debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PLBBEurekaEventMsg_logEventCMCallEventConnWithId_andCallType_andSysMode_andClientId___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v15;
    if (qword_1EBD5A110 != -1) {
      dispatch_once(&qword_1EBD5A110, block);
    }
    if (byte_1EBD5A05C)
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:andClientId:]");
      uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:andClientId:]"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:658];

      uint64_t v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v16;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  long long v22 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"CMCallEventConnCode"];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v22];
  int v24 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v23 setObject:v24 forKeyedSubscript:@"EventCode"];

  uint64_t v25 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v23 setObject:v25 forKeyedSubscript:@"Payload"];

  v26 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v23 setObject:v26 forKeyedSubscript:@"Error"];

  [v23 setObject:v14 forKeyedSubscript:@"callId"];
  [v23 setObject:v13 forKeyedSubscript:@"callType"];
  [v23 setObject:v10 forKeyedSubscript:@"systemMode"];
  [v23 setObject:v12 forKeyedSubscript:@"clientId"];

  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v23];
  int v27 = [v13 isEqualToString:@"VOICE"];

  if (v27)
  {
    if ([v10 isEqualToString:@"CDMA"])
    {
      uint64_t v28 = [(PLBasebandMessage *)self agent];
      long long v29 = v28;
      long long v30 = @"CDMA2K";
    }
    else if ([v10 isEqualToString:@"GSM"])
    {
      uint64_t v28 = [(PLBasebandMessage *)self agent];
      long long v29 = v28;
      long long v30 = @"GSM";
    }
    else if ([v10 isEqualToString:@"WCDMA"])
    {
      uint64_t v28 = [(PLBasebandMessage *)self agent];
      long long v29 = v28;
      long long v30 = @"WCDMA";
    }
    else
    {
      if (![v10 isEqualToString:@"UTRAN"])
      {
LABEL_23:
        uint64_t v32 = [(PLBasebandMessage *)self agent];
        [v32 accountVoicePower:v23 state:@"voice_start"];
        goto LABEL_24;
      }
      uint64_t v28 = [(PLBasebandMessage *)self agent];
      long long v29 = v28;
      long long v30 = @"UTRAN";
    }
    [v28 modelStateTransitionPower:v23 rat:v30 state:@"Voice"];

    goto LABEL_23;
  }
  if ([v10 isEqualToString:@"HDR"])
  {
    uint64_t v31 = [(PLBasebandMessage *)self agent];
    uint64_t v32 = v31;
    uint64_t v33 = @"1xEVDO";
LABEL_17:
    [v31 modelStateTransitionPower:v23 rat:v33 state:@"Connected"];
LABEL_24:

    goto LABEL_25;
  }
  if ([v10 isEqualToString:@"CDMA"])
  {
    uint64_t v31 = [(PLBasebandMessage *)self agent];
    uint64_t v32 = v31;
    uint64_t v33 = @"CDMA2K";
    goto LABEL_17;
  }
LABEL_25:
}

uint64_t __87__PLBBEurekaEventMsg_logEventCMCallEventConnWithId_andCallType_andSysMode_andClientId___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A05C = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventEndV2
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F0F40;
  v29[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  void v28[2] = *MEMORY[0x1E4F92CB0];
  v28[3] = v3;
  v29[2] = @"refreshRequestHandler";
  v29[3] = MEMORY[0x1E4F1CC38];
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"EventCode";
  int v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v27[0] = v23;
  v26[1] = @"Payload";
  long long v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v27[1] = v21;
  void v26[2] = @"Error";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v27[2] = v19;
  v26[3] = @"SeqNum";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v27[3] = v17;
  void v26[4] = @"BBDate";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  void v27[4] = v15;
  v26[5] = @"TimeCal";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v27[5] = v5;
  v26[6] = @"numberOfCalls";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v27[6] = v7;
  v26[7] = @"callId";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v27[7] = v9;
  v26[8] = @"clientId";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v27[8] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
  v31[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v13;
}

- (void)logEventCMCallEventEndWithId:(id)a3 andNumCalls:(id)a4 andClientId:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F929C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if ([v8 debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    long long v29 = __75__PLBBEurekaEventMsg_logEventCMCallEventEndWithId_andNumCalls_andClientId___block_invoke;
    long long v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v12;
    if (qword_1EBD5A118 != -1) {
      dispatch_once(&qword_1EBD5A118, &block);
    }
    if (byte_1EBD5A05D)
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:andClientId:]", block, v28, v29, v30, v31);
      id v14 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:andClientId:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:740];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v19 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CMCallEventEndCode"];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19];
  uint64_t v21 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v20 setObject:v21 forKeyedSubscript:@"EventCode"];

  long long v22 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v20 setObject:v22 forKeyedSubscript:@"Payload"];

  uint64_t v23 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v20 setObject:v23 forKeyedSubscript:@"Error"];

  [v20 setObject:v11 forKeyedSubscript:@"callId"];
  [v20 setObject:v10 forKeyedSubscript:@"numberOfCalls"];

  [v20 setObject:v9 forKeyedSubscript:@"clientId"];
  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v20];
  int v24 = [(PLBasebandMessage *)self agent];
  [v24 modelStateTransitionPower:v20 rat:@"CDMA2K" state:@"Inactive"];

  uint64_t v25 = [(PLBasebandMessage *)self agent];
  [v25 modelStateTransitionPower:v20 rat:@"1xEVDO" state:@"Inactive"];

  v26 = [(PLBasebandMessage *)self agent];
  [v26 accountVoicePower:v20 state:@"voice_end"];
}

uint64_t __75__PLBBEurekaEventMsg_logEventCMCallEventEndWithId_andNumCalls_andClientId___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A05D = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventOrigV2
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v32[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v30[0] = *MEMORY[0x1E4F92CD0];
  v30[1] = v2;
  v31[0] = &unk_1F29F0F40;
  v31[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  void v30[2] = *MEMORY[0x1E4F92CB0];
  v30[3] = v3;
  void v31[2] = @"refreshRequestHandler";
  void v31[3] = MEMORY[0x1E4F1CC38];
  int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E4F92CA8];
  v28[0] = @"EventCode";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v29[0] = v25;
  v28[1] = @"Payload";
  int v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_StringFormat");
  v29[1] = v23;
  void v28[2] = @"Error";
  long long v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_BoolFormat");
  v29[2] = v21;
  v28[3] = @"SeqNum";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v29[3] = v19;
  void v28[4] = @"BBDate";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  void v29[4] = v17;
  void v28[5] = @"TimeCal";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  void v29[5] = v15;
  void v28[6] = @"callId";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v29[6] = v5;
  v28[7] = @"callType";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v29[7] = v7;
  v28[8] = @"serviceType";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v29[8] = v9;
  v28[9] = @"clientId";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v29[9] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:10];
  v33[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  return v13;
}

- (void)logEventCMCallEventOrigWithId:(id)a3 andCallType:(id)a4 andSrvType:(id)a5 andClientId:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = (void *)MEMORY[0x1E4F929C0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  if ([v10 debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    long long v29 = __87__PLBBEurekaEventMsg_logEventCMCallEventOrigWithId_andCallType_andSrvType_andClientId___block_invoke;
    long long v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v15;
    if (qword_1EBD5A120 != -1) {
      dispatch_once(&qword_1EBD5A120, &block);
    }
    if (byte_1EBD5A05E)
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:andClientId:]", block, v28, v29, v30, v31);
      uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:andClientId:]"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:803];

      uint64_t v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v16;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  long long v22 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"CMCallEventOrigCode"];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v22];
  int v24 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v23 setObject:v24 forKeyedSubscript:@"EventCode"];

  uint64_t v25 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v23 setObject:v25 forKeyedSubscript:@"Payload"];

  v26 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v23 setObject:v26 forKeyedSubscript:@"Error"];

  [v23 setObject:v14 forKeyedSubscript:@"callId"];
  [v23 setObject:v13 forKeyedSubscript:@"callType"];

  [v23 setObject:v12 forKeyedSubscript:@"serviceType"];
  [v23 setObject:v11 forKeyedSubscript:@"clientId"];

  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v23];
}

uint64_t __87__PLBBEurekaEventMsg_logEventCMCallEventOrigWithId_andCallType_andSrvType_andClientId___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A05E = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventIncom
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F0F30;
  v29[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  void v28[2] = *MEMORY[0x1E4F92CB0];
  v28[3] = v3;
  v29[2] = @"refreshRequestHandler";
  v29[3] = MEMORY[0x1E4F1CC38];
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"EventCode";
  int v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v27[0] = v23;
  v26[1] = @"Payload";
  long long v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v27[1] = v21;
  void v26[2] = @"Error";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v27[2] = v19;
  v26[3] = @"SeqNum";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v27[3] = v17;
  void v26[4] = @"BBDate";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  void v27[4] = v15;
  v26[5] = @"TimeCal";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v27[5] = v5;
  v26[6] = @"callId";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v27[6] = v7;
  v26[7] = @"callType";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v27[7] = v9;
  v26[8] = @"serviceType";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v27[8] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
  v31[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v13;
}

+ (id)bbEuEvMsgNameCMCDMAExit
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F29F0F30;
  v25[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v24[2] = *MEMORY[0x1E4F92CB0];
  v24[3] = v3;
  void v25[2] = @"refreshRequestHandler";
  v25[3] = MEMORY[0x1E4F1CC38];
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"EventCode";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v23[0] = v19;
  v22[1] = @"Payload";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v23[1] = v17;
  v22[2] = @"Error";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v23[2] = v15;
  v22[3] = @"SeqNum";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v23[3] = v5;
  v22[4] = @"BBDate";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_DateFormat");
  v23[4] = v7;
  v22[5] = @"TimeCal";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v23[5] = v9;
  v22[6] = @"cdmaExitCode";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v23[6] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  v27[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v13;
}

- (void)logEventPointCMExitCodeWithState:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F929C0];
  id v5 = a3;
  if ([v4 debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __55__PLBBEurekaEventMsg_logEventPointCMExitCodeWithState___block_invoke;
    uint64_t v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v6;
    if (qword_1EBD5A128 != -1) {
      dispatch_once(&qword_1EBD5A128, &block);
    }
    if (byte_1EBD5A05F)
    {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventPointCMExitCodeWithState:]", block, v19, v20, v21, v22);
      id v8 = (void *)MEMORY[0x1E4F929B8];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v10 = [v9 lastPathComponent];
      id v11 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventPointCMExitCodeWithState:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:890];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int v24 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"CMCDMAExitCode"];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13];
  uint64_t v15 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v14 setObject:v15 forKeyedSubscript:@"EventCode"];

  uint64_t v16 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v14 setObject:v16 forKeyedSubscript:@"Payload"];

  uint64_t v17 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v14 setObject:v17 forKeyedSubscript:@"Error"];

  [v14 setObject:v5 forKeyedSubscript:@"cdmaExitCode"];
  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v14];
}

uint64_t __55__PLBBEurekaEventMsg_logEventPointCMExitCodeWithState___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A05F = result;
  return result;
}

+ (id)bbEuEvMsgNameGSML1State
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F29F0F30;
  v25[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v24[2] = *MEMORY[0x1E4F92CB0];
  v24[3] = v3;
  void v25[2] = @"refreshRequestHandler";
  v25[3] = MEMORY[0x1E4F1CC38];
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"EventCode";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v23[0] = v19;
  v22[1] = @"Payload";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v23[1] = v17;
  v22[2] = @"Error";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v23[2] = v15;
  v22[3] = @"SeqNum";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v23[3] = v5;
  v22[4] = @"BBDate";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_DateFormat");
  v23[4] = v7;
  v22[5] = @"TimeCal";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v23[5] = v9;
  v22[6] = @"State";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v23[6] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  v27[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v13;
}

- (void)logEventForwardGSML1StateWith:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F929C0];
  id v5 = a3;
  if ([v4 debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __52__PLBBEurekaEventMsg_logEventForwardGSML1StateWith___block_invoke;
    uint64_t v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v6;
    if (qword_1EBD5A130 != -1) {
      dispatch_once(&qword_1EBD5A130, &block);
    }
    if (byte_1EBD5A060)
    {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventForwardGSML1StateWith:]", block, v17, v18, v19, v20);
      id v8 = (void *)MEMORY[0x1E4F929B8];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v10 = [v9 lastPathComponent];
      id v11 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventForwardGSML1StateWith:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:943];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"GSML1State"];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13];
  [v14 setObject:v5 forKeyedSubscript:@"State"];
  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v14];
  uint64_t v15 = [(PLBasebandMessage *)self agent];
  [v15 modelStateTransitionPower:v14 rat:@"GSM" state:v5];
}

uint64_t __52__PLBBEurekaEventMsg_logEventForwardGSML1StateWith___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A060 = result;
  return result;
}

- (void)refreshWCDMARRCState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __42__PLBBEurekaEventMsg_refreshWCDMARRCState__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5A138 != -1) {
      dispatch_once(&qword_1EBD5A138, &block);
    }
    if (byte_1EBD5A061)
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg refreshWCDMARRCState]", block, v15, v16, v17, v18);
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg refreshWCDMARRCState]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:968];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"WCDMARRCState"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  id v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __42__PLBBEurekaEventMsg_refreshWCDMARRCState__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A061 = result;
  return result;
}

+ (id)bbEuEvMsgNameWCDMARRCState
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F0F40;
  v29[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  void v28[2] = *MEMORY[0x1E4F92CB0];
  v28[3] = v3;
  v29[2] = @"refreshRequestHandler";
  v29[3] = MEMORY[0x1E4F1CC38];
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"EventCode";
  int v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v27[0] = v23;
  v26[1] = @"Payload";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v27[1] = v21;
  void v26[2] = @"Error";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v27[2] = v19;
  v26[3] = @"SeqNum";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v27[3] = v17;
  void v26[4] = @"BBDate";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  void v27[4] = v15;
  v26[5] = @"TimeCal";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v27[5] = v5;
  v26[6] = @"PrevState";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v27[6] = v7;
  v26[7] = @"CurrState";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v27[7] = v9;
  v26[8] = @"Rate";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v27[8] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
  v31[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v13;
}

- (void)logEventForwardWCDMARRCPrevStateAs:(id)a3 andCurrState:(id)a4 andRate:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F929C0];
  id v8 = a4;
  id v9 = a3;
  if ([v7 debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __78__PLBBEurekaEventMsg_logEventForwardWCDMARRCPrevStateAs_andCurrState_andRate___block_invoke;
    uint64_t v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v24 = v10;
    if (qword_1EBD5A140 != -1) {
      dispatch_once(&qword_1EBD5A140, &block);
    }
    if (byte_1EBD5A062)
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventForwardWCDMARRCPrevStateAs:andCurrState:andRate:]", block, v21, v22, v23, v24);
      id v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventForwardWCDMARRCPrevStateAs:andCurrState:andRate:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1012];

      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v17 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"WCDMARRCState"];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v17];
  [v18 setObject:v9 forKeyedSubscript:@"PrevState"];

  [v18 setObject:v8 forKeyedSubscript:@"CurrState"];
  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v18];
  uint64_t v19 = [(PLBasebandMessage *)self agent];
  [v19 modelStateTransitionPower:v18 rat:@"WCDMA" state:v8];
}

uint64_t __78__PLBBEurekaEventMsg_logEventForwardWCDMARRCPrevStateAs_andCurrState_andRate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A062 = result;
  return result;
}

- (void)refreshLTERRCState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __40__PLBBEurekaEventMsg_refreshLTERRCState__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5A148 != -1) {
      dispatch_once(&qword_1EBD5A148, &block);
    }
    if (byte_1EBD5A063)
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg refreshLTERRCState]", block, v15, v16, v17, v18);
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg refreshLTERRCState]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1052];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LTERRCState"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  id v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __40__PLBBEurekaEventMsg_refreshLTERRCState__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A063 = result;
  return result;
}

+ (id)bbEuEvMsgNameLTERRCState
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F29F0F30;
  v25[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v24[2] = *MEMORY[0x1E4F92CB0];
  v24[3] = v3;
  void v25[2] = @"refreshRequestHandler";
  v25[3] = MEMORY[0x1E4F1CC38];
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"EventCode";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v23[0] = v19;
  v22[1] = @"Payload";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v23[1] = v17;
  v22[2] = @"Error";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v23[2] = v15;
  v22[3] = @"SeqNum";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v23[3] = v5;
  v22[4] = @"BBDate";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_DateFormat");
  v23[4] = v7;
  v22[5] = @"TimeCal";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v23[5] = v9;
  v22[6] = @"State";
  uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v23[6] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  v27[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v13;
}

- (void)logEventForwardLTERRCStateAs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F929C0];
  id v5 = a3;
  if ([v4 debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __51__PLBBEurekaEventMsg_logEventForwardLTERRCStateAs___block_invoke;
    uint64_t v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v23 = v6;
    if (qword_1EBD5A150 != -1) {
      dispatch_once(&qword_1EBD5A150, &block);
    }
    if (byte_1EBD5A064)
    {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventForwardLTERRCStateAs:]", block, v20, v21, v22, v23);
      id v8 = (void *)MEMORY[0x1E4F929B8];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v10 = [v9 lastPathComponent];
      id v11 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventForwardLTERRCStateAs:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:1092];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LTERRCState"];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13];
  uint64_t v15 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v14 setObject:v15 forKeyedSubscript:@"EventCode"];

  uint64_t v16 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v14 setObject:v16 forKeyedSubscript:@"Payload"];

  uint64_t v17 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v14 setObject:v17 forKeyedSubscript:@"Error"];

  [v14 setObject:v5 forKeyedSubscript:@"State"];
  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v14];
  uint64_t v18 = [(PLBasebandMessage *)self agent];
  [v18 modelStateTransitionPower:v14 rat:@"LTE" state:v5];
}

uint64_t __51__PLBBEurekaEventMsg_logEventForwardLTERRCStateAs___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A064 = result;
  return result;
}

- (void)refreshUTRANRRCState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __42__PLBBEurekaEventMsg_refreshUTRANRRCState__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5A158 != -1) {
      dispatch_once(&qword_1EBD5A158, &block);
    }
    if (byte_1EBD5A065)
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg refreshUTRANRRCState]", block, v15, v16, v17, v18);
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg refreshUTRANRRCState]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1133];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"UTRANRRCState"];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  id v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __42__PLBBEurekaEventMsg_refreshUTRANRRCState__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A065 = result;
  return result;
}

+ (id)bbEuEvMsgUTRANRRCState
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F0F30;
  v29[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  void v28[2] = *MEMORY[0x1E4F92CB0];
  v28[3] = v3;
  v29[2] = @"refreshRequestHandler";
  v29[3] = MEMORY[0x1E4F1CC38];
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"EventCode";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v27[0] = v23;
  v26[1] = @"Payload";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v27[1] = v21;
  void v26[2] = @"Error";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v27[2] = v19;
  v26[3] = @"SeqNum";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v27[3] = v17;
  void v26[4] = @"BBDate";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  void v27[4] = v15;
  v26[5] = @"TimeCal";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v27[5] = v5;
  v26[6] = @"NextState";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  void v27[6] = v7;
  v26[7] = @"CurrState";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v27[7] = v9;
  v26[8] = @"Rate";
  uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_StringFormat");
  v27[8] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
  v31[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v13;
}

- (void)logEventForwardUTRANRRCNextStateAs:(id)a3 andCurrStateAs:(id)a4 andRateAs:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F929C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if ([v8 debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __82__PLBBEurekaEventMsg_logEventForwardUTRANRRCNextStateAs_andCurrStateAs_andRateAs___block_invoke;
    uint64_t v28 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v29 = v12;
    if (qword_1EBD5A160 != -1) {
      dispatch_once(&qword_1EBD5A160, &block);
    }
    if (byte_1EBD5A066)
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventForwardUTRANRRCNextStateAs:andCurrStateAs:andRateAs:]", block, v26, v27, v28, v29);
      id v14 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventForwardUTRANRRCNextStateAs:andCurrStateAs:andRateAs:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:1177];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v19 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"UTRANRRCState"];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19];
  uint64_t v21 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v20 setObject:v21 forKeyedSubscript:@"EventCode"];

  uint64_t v22 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v20 setObject:v22 forKeyedSubscript:@"Payload"];

  uint64_t v23 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v20 setObject:v23 forKeyedSubscript:@"Error"];

  [v20 setObject:v11 forKeyedSubscript:@"NextState"];
  [v20 setObject:v10 forKeyedSubscript:@"CurrState"];
  [v20 setObject:v9 forKeyedSubscript:@"Rate"];

  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v20];
  uint64_t v24 = [(PLBasebandMessage *)self agent];
  [v24 modelStateTransitionPower:v20 rat:@"UTRAN" state:v10];
}

uint64_t __82__PLBBEurekaEventMsg_logEventForwardUTRANRRCNextStateAs_andCurrStateAs_andRateAs___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A066 = result;
  return result;
}

- (void)refreshEventNotProcessed
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __46__PLBBEurekaEventMsg_refreshEventNotProcessed__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v4;
    if (qword_1EBD5A168 != -1) {
      dispatch_once(&qword_1EBD5A168, &block);
    }
    if (byte_1EBD5A067)
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg refreshEventNotProcessed]", block, v15, v16, v17, v18);
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg refreshEventNotProcessed]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1211];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"EventNotProcessed"];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setIsErrorEntry:1];
  id v13 = [(PLBasebandMessage *)self agent];
  [v13 logEntry:v12];
}

uint64_t __46__PLBBEurekaEventMsg_refreshEventNotProcessed__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A067 = result;
  return result;
}

+ (id)bbEuEvMsgEventNotProcessed
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v20[0] = *MEMORY[0x1E4F92CD0];
  v20[1] = v2;
  v21[0] = &unk_1F29F0F30;
  v21[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v20[2] = *MEMORY[0x1E4F92CB0];
  v20[3] = v3;
  v21[2] = @"refreshRequestHandler";
  v21[3] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"EventCode";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v19[0] = v15;
  v18[1] = @"Payload";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = v5;
  v18[2] = @"Error";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v19[2] = v7;
  v18[3] = @"SeqNum";
  id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v19[3] = v9;
  v18[4] = @"BBDate";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_DateFormat");
  v19[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  v23[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v13;
}

- (void)logEventNoneEventNotProcessed
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __51__PLBBEurekaEventMsg_logEventNoneEventNotProcessed__block_invoke;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v3;
    if (qword_1EBD5A170 != -1) {
      dispatch_once(&qword_1EBD5A170, &block);
    }
    if (byte_1EBD5A068)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBEurekaEventMsg logEventNoneEventNotProcessed]", block, v16, v17, v18, v19);
      id v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBEurekaEventMsg logEventNoneEventNotProcessed]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1247];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"EventNotProcessed"];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  uint64_t v12 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"EventCode"];
  [v11 setObject:v12 forKeyedSubscript:@"EventCode"];

  id v13 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Payload"];
  [v11 setObject:v13 forKeyedSubscript:@"Payload"];

  id v14 = [(NSMutableDictionary *)self->_commonInfo objectForKey:@"Error"];
  [v11 setObject:v14 forKeyedSubscript:@"Error"];

  [(PLBBEurekaEventMsg *)self sendAndLogPLEntry:v11];
}

uint64_t __51__PLBBEurekaEventMsg_logEventNoneEventNotProcessed__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A068 = result;
  return result;
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
}

@end