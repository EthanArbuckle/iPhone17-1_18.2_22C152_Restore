@interface PLBBMsgAll
+ (id)entryEventNoneBBMsgAll;
- (NSDate)bbDate;
- (NSDate)ibbDate;
- (NSMutableDictionary)info;
- (NSNumber)iseqNum;
- (NSNumber)seqNum;
- (NSString)error;
- (NSString)ierror;
- (NSString)ieventCode;
- (NSString)ipayload;
- (NSString)payload;
- (void)logEventNoneBBMsgAll;
- (void)refreshBBMsgAll;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setBbDate:(id)a3;
- (void)setError:(id)a3;
- (void)setISeqNum:(id)a3;
- (void)setIbbDate:(id)a3;
- (void)setIerror:(id)a3;
- (void)setIeventCode:(id)a3;
- (void)setInfo:(id)a3;
- (void)setIpayload:(id)a3;
- (void)setIseqNum:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSeqNum:(id)a3;
@end

@implementation PLBBMsgAll

- (void)setISeqNum:(id)a3
{
}

+ (id)entryEventNoneBBMsgAll
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v20[0] = *MEMORY[0x1E4F92CD0];
  v20[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F92CB0];
  v20[2] = *MEMORY[0x1E4F92C70];
  v20[3] = v3;
  v21[0] = &unk_1F29F0420;
  v21[1] = MEMORY[0x1E4F1CC28];
  v21[2] = MEMORY[0x1E4F1CC28];
  v21[3] = @"refreshRequestHandler";
  v20[4] = *MEMORY[0x1E4F92CC0];
  v21[4] = MEMORY[0x1E4F1CC38];
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"Payload";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v19[0] = v15;
  v18[1] = @"Error";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = v5;
  v18[2] = @"Type";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v19[2] = v7;
  v18[3] = @"SeqNum";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v19[3] = v9;
  v18[4] = @"BBDate";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_DateFormat");
  v19[4] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  v23[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v13;
}

- (void)refreshBBMsgAll
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __29__PLBBMsgAll_refreshBBMsgAll__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (qword_1EBD57A88 != -1) {
      dispatch_once(&qword_1EBD57A88, &block);
    }
    if (_MergedGlobals_1_10)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgAll refreshBBMsgAll]", block, v11, v12, v13, v14);
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgAll.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMsgAll refreshBBMsgAll]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:58];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __29__PLBBMsgAll_refreshBBMsgAll__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_10 = result;
  return result;
}

- (void)logEventNoneBBMsgAll
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __34__PLBBMsgAll_logEventNoneBBMsgAll__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v3;
    if (qword_1EBD57A90 != -1) {
      dispatch_once(&qword_1EBD57A90, &block);
    }
    if (byte_1EBD57A81)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgAll logEventNoneBBMsgAll]", block, v14, v15, v16, v17);
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgAll.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMsgAll logEventNoneBBMsgAll]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:65];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D40];
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"BBMsgAll"];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [(PLBBMsgAll *)self sendAndLogPLEntry:v12 withName:@"BBMsgAll" withType:v10];
}

uint64_t __34__PLBBMsgAll_logEventNoneBBMsgAll__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A81 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLBBMsgAll_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD57A98 != -1) {
      dispatch_once(&qword_1EBD57A98, block);
    }
    if (byte_1EBD57A82)
    {
      id v36 = v10;
      id v37 = v9;
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgAll sendAndLogPLEntry:withName:withType:]");
      v13 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgAll.m"];
      v15 = [v14 lastPathComponent];
      v16 = [NSString stringWithUTF8String:"-[PLBBMsgAll sendAndLogPLEntry:withName:withType:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:81];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v10 = v36;
      id v9 = v37;
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __50__PLBBMsgAll_sendAndLogPLEntry_withName_withType___block_invoke_32;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v18;
    if (qword_1EBD57AA0 != -1) {
      dispatch_once(&qword_1EBD57AA0, v38);
    }
    if (byte_1EBD57A83)
    {
      id v19 = v10;
      id v20 = v9;
      v21 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v9, v10];
      v22 = (void *)MEMORY[0x1E4F929B8];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgAll.m"];
      v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLBBMsgAll sendAndLogPLEntry:withName:withType:]"];
      [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:82];

      v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v21;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v20;
      id v10 = v19;
    }
  }
  v27 = [(PLBBMsgAll *)self payload];
  [v8 setObject:v27 forKeyedSubscript:@"Payload"];

  v28 = [(PLBBMsgRoot *)self msgType];
  [v8 setObject:v28 forKeyedSubscript:@"Type"];

  v29 = [(PLBBMsgAll *)self seqNum];
  [v8 setObject:v29 forKeyedSubscript:@"SeqNum"];

  v30 = [(PLBBMsgAll *)self bbDate];
  [v8 setObject:v30 forKeyedSubscript:@"BBDate"];

  v31 = [(PLBBMsgAll *)self error];
  [v8 setObject:v31 forKeyedSubscript:@"Error"];

  v32 = [(PLBBMsgAll *)self bbDate];

  if (v32)
  {
    v33 = [(PLBBMsgAll *)self bbDate];
    v34 = [v33 convertFromBasebandToMonotonic];
    [v8 setEntryDate:v34];
  }
  v35 = [(PLBBMsgRoot *)self agent];
  [v35 logEntry:v8];
}

uint64_t __50__PLBBMsgAll_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A82 = result;
  return result;
}

uint64_t __50__PLBBMsgAll_sendAndLogPLEntry_withName_withType___block_invoke_32(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A83 = result;
  return result;
}

- (NSNumber)seqNum
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSeqNum:(id)a3
{
}

- (NSDate)bbDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbDate:(id)a3
{
}

- (NSString)payload
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPayload:(id)a3
{
}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setError:(id)a3
{
}

- (NSMutableDictionary)info
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInfo:(id)a3
{
}

- (NSNumber)iseqNum
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIseqNum:(id)a3
{
}

- (NSDate)ibbDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIbbDate:(id)a3
{
}

- (NSString)ieventCode
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIeventCode:(id)a3
{
}

- (NSString)ipayload
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIpayload:(id)a3
{
}

- (NSString)ierror
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setIerror:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ierror, 0);
  objc_storeStrong((id *)&self->_ipayload, 0);
  objc_storeStrong((id *)&self->_ieventCode, 0);
  objc_storeStrong((id *)&self->_ibbDate, 0);
  objc_storeStrong((id *)&self->_iseqNum, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_bbDate, 0);
  objc_storeStrong((id *)&self->_seqNum, 0);
}

@end