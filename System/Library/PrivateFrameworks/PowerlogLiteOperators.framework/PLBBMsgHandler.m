@interface PLBBMsgHandler
+ (id)getMsgHandler;
- (NSData)rawData;
- (NSDate)apTimestamp;
- (NSDate)calibratedTimestamp;
- (NSDate)date;
- (NSDate)timestamp;
- (NSNumber)seqNum;
- (PLAgent)agent;
- (PLBBMsgHandler)init;
- (double)timeCalibration;
- (id)decodeMsgHeader;
- (unsigned)ticksInGPSONState;
- (unsigned)ticksInGoodState;
- (void)handleMsg:(id)a3 forAgent:(id)a4;
- (void)registerWithHandlerAs:(id)a3 forType:(unint64_t)a4;
- (void)setAgent:(id)a3;
- (void)setDate:(id)a3;
- (void)setRawData:(id)a3;
- (void)setSeqNum:(id)a3;
- (void)setTimeCalibration:(double)a3;
@end

@implementation PLBBMsgHandler

- (PLBBMsgHandler)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __22__PLBBMsgHandler_init__block_invoke;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v3;
    if (qword_1EBD5C300 != -1) {
      dispatch_once(&qword_1EBD5C300, &block);
    }
    if (_MergedGlobals_99)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgHandler init]", block, v12, v13, v14, v15);
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBMsgHandler init]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:55];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }

  return 0;
}

uint64_t __22__PLBBMsgHandler_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_99 = result;
  return result;
}

+ (id)getMsgHandler
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __31__PLBBMsgHandler_getMsgHandler__block_invoke;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v2;
    if (qword_1EBD5C308 != -1) {
      dispatch_once(&qword_1EBD5C308, &block);
    }
    if (byte_1EBD5C2E9)
    {
      uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "+[PLBBMsgHandler getMsgHandler]", block, v16, v17, v18, v19);
      v4 = (void *)MEMORY[0x1E4F929B8];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"+[PLBBMsgHandler getMsgHandler]"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:61];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v9 = (void *)qword_1EBD5C2F0;
  if (!qword_1EBD5C2F0)
  {
    v10 = objc_alloc_init(PLBBMsgHandler);
    v11 = (void *)qword_1EBD5C2F0;
    qword_1EBD5C2F0 = (uint64_t)v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13 = (void *)qword_1EBD5C2F8;
    qword_1EBD5C2F8 = (uint64_t)v12;

    v9 = (void *)qword_1EBD5C2F0;
  }
  return v9;
}

uint64_t __31__PLBBMsgHandler_getMsgHandler__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C2E9 = result;
  return result;
}

- (void)registerWithHandlerAs:(id)a3 forType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F929C0];
  id v6 = a3;
  if ([v5 debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __48__PLBBMsgHandler_registerWithHandlerAs_forType___block_invoke;
    uint64_t v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v7;
    if (qword_1EBD5C310 != -1) {
      dispatch_once(&qword_1EBD5C310, &block);
    }
    if (byte_1EBD5C2EA)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgHandler registerWithHandlerAs:forType:]", block, v17, v18, v19, v20);
      v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m"];
      v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLBBMsgHandler registerWithHandlerAs:forType:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:88];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v14 = (void *)qword_1EBD5C2F8;
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
  [v14 setObject:v6 forKey:v15];
}

uint64_t __48__PLBBMsgHandler_registerWithHandlerAs_forType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C2EA = result;
  return result;
}

- (void)handleMsg:(id)a3 forAgent:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", a3, a4))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __37__PLBBMsgHandler_handleMsg_forAgent___block_invoke;
    uint64_t v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v5;
    if (qword_1EBD5C318 != -1) {
      dispatch_once(&qword_1EBD5C318, &block);
    }
    if (byte_1EBD5C2EB)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgHandler handleMsg:forAgent:]", block, v16, v17, v18, v19);
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMsgHandler handleMsg:forAgent:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:97];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = [(PLBBMsgHandler *)self decodeMsgHeader];
  int v13 = [v12 unsignedCharValue];

  switch(v13)
  {
    case 1:
      v14 = &unk_1F29E63E8;
      break;
    case 2:
      v14 = &unk_1F29E63B8;
      break;
    case 4:
      v14 = &unk_1F29E63D0;
      break;
    default:
      return;
  }
  [(id)qword_1EBD5C2F8 objectForKey:v14];
}

uint64_t __37__PLBBMsgHandler_handleMsg_forAgent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C2EB = result;
  return result;
}

- (id)decodeMsgHeader
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __33__PLBBMsgHandler_decodeMsgHeader__block_invoke;
    int v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v2;
    if (qword_1EBD5C320 != -1) {
      dispatch_once(&qword_1EBD5C320, &block);
    }
    if (byte_1EBD5C2EC)
    {
      uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMsgHandler decodeMsgHeader]", block, v11, v12, v13, v14);
      v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m"];
      id v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PLBBMsgHandler decodeMsgHeader]"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:132];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return &unk_1F29E6400;
}

uint64_t __33__PLBBMsgHandler_decodeMsgHeader__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C2EC = result;
  return result;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
}

- (PLAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (NSNumber)seqNum
{
  return self->_seqNum;
}

- (void)setSeqNum:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unsigned)ticksInGoodState
{
  return self->_ticksInGoodState;
}

- (unsigned)ticksInGPSONState
{
  return self->_ticksInGPSONState;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDate)apTimestamp
{
  return self->_apTimestamp;
}

- (NSDate)calibratedTimestamp
{
  return self->_calibratedTimestamp;
}

- (double)timeCalibration
{
  return self->_timeCalibration;
}

- (void)setTimeCalibration:(double)a3
{
  self->_timeCalibration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibratedTimestamp, 0);
  objc_storeStrong((id *)&self->_apTimestamp, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_seqNum, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end