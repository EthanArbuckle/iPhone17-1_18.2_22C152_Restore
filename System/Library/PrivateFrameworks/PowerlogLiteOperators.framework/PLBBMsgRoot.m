@interface PLBBMsgRoot
- (NSDate)msgDate;
- (NSDictionary)msgEntry;
- (NSDictionary)msgKVPairs;
- (NSNumber)msgType;
- (NSString)msgName;
- (NSString)msgPayload;
- (NSString)msgProcErr;
- (PLAgent)agent;
- (PLBBMsgRoot)init;
- (void)appendToMsgProcError:(id)a3;
- (void)sendAndLogPLEntry:(id)a3 andOverride:(id)a4;
- (void)setAgent:(id)a3;
- (void)setMsgDate:(id)a3;
- (void)setMsgEntry:(id)a3;
- (void)setMsgKVPairs:(id)a3;
- (void)setMsgName:(id)a3;
- (void)setMsgPayload:(id)a3;
- (void)setMsgProcErr:(id)a3;
- (void)setMsgType:(id)a3;
@end

@implementation PLBBMsgRoot

- (PLBBMsgRoot)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __19__PLBBMsgRoot_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5C650 != -1) {
      dispatch_once(&qword_1EBD5C650, block);
    }
    if (_MergedGlobals_111)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgRoot init]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMsgRoot init]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:17];

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
  v16.super_class = (Class)PLBBMsgRoot;
  v10 = [(PLBBMsgRoot *)&v16 init];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    msgEntry = v10->_msgEntry;
    v10->_msgEntry = (NSDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    msgKVPairs = v10->_msgKVPairs;
    v10->_msgKVPairs = (NSDictionary *)v13;
  }
  return v10;
}

uint64_t __19__PLBBMsgRoot_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_111 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 andOverride:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1EBD5C658 != -1) {
      dispatch_once(&qword_1EBD5C658, block);
    }
    if (byte_1EBD5C649)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgRoot sendAndLogPLEntry:andOverride:]");
      v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m"];
      uint64_t v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLBBMsgRoot sendAndLogPLEntry:andOverride:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:34];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke_18;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v14;
    if (qword_1EBD5C660 != -1) {
      dispatch_once(&qword_1EBD5C660, v35);
    }
    if (byte_1EBD5C64A)
    {
      v15 = NSString;
      objc_super v16 = [v6 entryKey];
      v17 = [v15 stringWithFormat:@"Sending PLEntry: key=%@", v16];

      v18 = (void *)MEMORY[0x1E4F929B8];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m"];
      uint64_t v20 = [v19 lastPathComponent];
      v21 = [NSString stringWithUTF8String:"-[PLBBMsgRoot sendAndLogPLEntry:andOverride:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:35];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v17;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v23 = [(PLBBMsgRoot *)self agent];

  if (!v23 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v24 = objc_opt_class();
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke_24;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = v24;
    if (qword_1EBD5C668 != -1) {
      dispatch_once(&qword_1EBD5C668, v34);
    }
    if (byte_1EBD5C64B)
    {
      v25 = [NSString stringWithFormat:@"Bad agent"];
      v26 = (void *)MEMORY[0x1E4F929B8];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m"];
      v28 = [v27 lastPathComponent];
      v29 = [NSString stringWithUTF8String:"-[PLBBMsgRoot sendAndLogPLEntry:andOverride:]"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:38];

      v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v25;
        _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (!a4)
  {
    v31 = [0 objectForKey:@"Date"];
    if (!v31)
    {
      v32 = [0 convertFromBasebandToMonotonic];
      [v6 setEntryDate:v32];
    }
  }
  v33 = [(PLBBMsgRoot *)self agent];
  [v33 logEntry:v6];
}

uint64_t __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C649 = result;
  return result;
}

uint64_t __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke_18(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C64A = result;
  return result;
}

uint64_t __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke_24(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C64B = result;
  return result;
}

- (void)appendToMsgProcError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    objc_super v16 = __36__PLBBMsgRoot_appendToMsgProcError___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v5;
    if (qword_1EBD5C670 != -1) {
      dispatch_once(&qword_1EBD5C670, &block);
    }
    if (byte_1EBD5C64C)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgRoot appendToMsgProcError:]", block, v15, v16, v17, v18);
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMsgRoot appendToMsgProcError:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:52];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v4)
  {
    v12 = [(PLBBMsgRoot *)self msgProcErr];
    uint64_t v13 = (void *)[v12 mutableCopy];

    [v13 appendString:v4];
  }
}

uint64_t __36__PLBBMsgRoot_appendToMsgProcError___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C64C = result;
  return result;
}

- (NSString)msgName
{
  return self->_msgName;
}

- (void)setMsgName:(id)a3
{
}

- (NSNumber)msgType
{
  return self->_msgType;
}

- (void)setMsgType:(id)a3
{
}

- (NSString)msgPayload
{
  return self->_msgPayload;
}

- (void)setMsgPayload:(id)a3
{
}

- (NSString)msgProcErr
{
  return self->_msgProcErr;
}

- (void)setMsgProcErr:(id)a3
{
}

- (NSDate)msgDate
{
  return self->_msgDate;
}

- (void)setMsgDate:(id)a3
{
}

- (NSDictionary)msgEntry
{
  return self->_msgEntry;
}

- (void)setMsgEntry:(id)a3
{
}

- (NSDictionary)msgKVPairs
{
  return self->_msgKVPairs;
}

- (void)setMsgKVPairs:(id)a3
{
}

- (PLAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_msgKVPairs, 0);
  objc_storeStrong((id *)&self->_msgEntry, 0);
  objc_storeStrong((id *)&self->_msgDate, 0);
  objc_storeStrong((id *)&self->_msgProcErr, 0);
  objc_storeStrong((id *)&self->_msgPayload, 0);
  objc_storeStrong((id *)&self->_msgType, 0);
  objc_storeStrong((id *)&self->_msgName, 0);
}

@end