@interface PLBasebandEurekaLogMessage
- (BOOL)parseData:(id)a3;
- (NSData)payload;
- (PLBasebandEurekaLogMessage)initWithData:(id)a3;
- (_PLBasebandLogHeader)header;
- (id)payloadString;
- (id)stringForUnknownBytes:(unsigned int)a3;
- (id)tooShortErrorString;
- (unsigned)eventCode;
- (void)logWithLogger:(id)a3;
- (void)setHeader:(_PLBasebandLogHeader *)a3;
- (void)setPayload:(id)a3;
@end

@implementation PLBasebandEurekaLogMessage

- (PLBasebandEurekaLogMessage)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLBasebandEurekaLogMessage_initWithData___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C450 != -1) {
      dispatch_once(&qword_1EBD5C450, block);
    }
    if (_MergedGlobals_105)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaLogMessage initWithData:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBasebandEurekaLogMessage initWithData:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:23];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PLBasebandEurekaLogMessage;
  v12 = [(PLBasebandMessage *)&v17 initWithData:v4];
  v13 = v12;
  if (!v12
    || (v12->_header = 0,
        payload = v12->_payload,
        v12->_payload = 0,
        payload,
        v15 = 0,
        [(PLBasebandEurekaLogMessage *)v13 parseData:v4]))
  {
    v15 = v13;
  }

  return v15;
}

uint64_t __43__PLBasebandEurekaLogMessage_initWithData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_105 = result;
  return result;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __40__PLBasebandEurekaLogMessage_parseData___block_invoke;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v31 = v5;
    if (qword_1EBD5C458 != -1) {
      dispatch_once(&qword_1EBD5C458, &block);
    }
    if (byte_1EBD5C449)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaLogMessage parseData:]", block, v28, v29, v30, v31);
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBasebandEurekaLogMessage parseData:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:36];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = (unsigned __int8 *)[v12 bytes];
  v14 = (_PLBasebandLogHeader *)&v13[2 * (*v13 == 129)];
  self->_header = v14;
  v15 = &v14->var3[7];
  unint64_t v16 = (unsigned __int16)[(PLBasebandEurekaLogMessage *)self header][1];
  unint64_t v17 = v16 - 12;
  if (v16 >= 0xD
    && (id v18 = v12,
        unint64_t v19 = (unint64_t)&v15[v17 - [v18 bytes]],
        v19 <= [v18 length]))
  {
    v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:v17];
    p_super = &self->_payload->super;
    self->_payload = v22;
    BOOL v21 = 1;
  }
  else
  {
    p_super = PLLogCommon();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      id v24 = v12;
      uint64_t v25 = (uint64_t)&v15[v17 - [v24 bytes]];
      uint64_t v26 = [v24 length];
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v25;
      __int16 v34 = 2048;
      uint64_t v35 = v26;
      __int16 v36 = 2080;
      v37 = "-[PLBasebandEurekaLogMessage parseData:]";
      _os_log_error_impl(&dword_1D2690000, p_super, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
    BOOL v21 = 0;
  }

  return v21;
}

uint64_t __40__PLBasebandEurekaLogMessage_parseData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C449 = result;
  return result;
}

- (id)payloadString
{
  v3 = [(PLBasebandEurekaLogMessage *)self payload];

  if (v3)
  {
    id v4 = NSString;
    uint64_t v5 = [(PLBasebandEurekaLogMessage *)self payload];
    v6 = [v4 stringWithFormat:@"%@", v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLBasebandEurekaLogMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C460 != -1) {
      dispatch_once(&qword_1EBD5C460, block);
    }
    if (byte_1EBD5C44A)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaLogMessage logWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBasebandEurekaLogMessage logWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:93];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)PLBasebandEurekaLogMessage;
  [(PLBasebandMessage *)&v40 logWithLogger:v4];
  id v12 = objc_opt_new();
  v13 = objc_alloc_init(PLBBEurekaLogMsg);
  v14 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v13 setAgent:v14];

  [(PLBBEurekaLogMsg *)v13 setEventCode:[(PLBasebandEurekaLogMessage *)self eventCode]];
  [(PLBBEurekaLogMsg *)v13 setError:@"notSet"];
  v15 = [(PLBasebandMessage *)self seqNum];
  unint64_t v16 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBEurekaLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  unint64_t v17 = [(PLBasebandEurekaLogMessage *)self payload];

  if (v17)
  {
    id v18 = [NSString alloc];
    unint64_t v19 = [(PLBasebandEurekaLogMessage *)self payloadString];
    v20 = (void *)[v18 initWithString:v19];
    [(PLBBEurekaLogMsg *)v13 setPayload:v20];
  }
  if ((unsigned __int16)[(PLBasebandEurekaLogMessage *)self header][3] == 45452)
  {
    if ((unsigned __int16)[(PLBasebandEurekaLogMessage *)self header][1] > 0x27u)
    {
      id v39 = v4;
      id v22 = [(PLBasebandEurekaLogMessage *)self payload];
      v23 = (unsigned __int8 *)[v22 bytes];

      uint64_t v24 = *((unsigned int *)v23 + 4);
      if (([MEMORY[0x1E4F92A38] isBasebandClass:1003001] & 1) != 0
        || [MEMORY[0x1E4F92A38] isBasebandClass:1003002])
      {
        uint64_t v25 = *((unsigned int *)v23 + 5);
        unsigned int v37 = *((_DWORD *)v23 + 6);
        BOOL v21 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*v23];
        uint64_t v26 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v23[4]];
        v27 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v23 + 2)];
        uint64_t v28 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:(*((_DWORD *)v23 + 2) + 1)];
        v29 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v24];
        v30 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v25];
        uint64_t v31 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v37];
        [(PLBBEurekaLogMsg *)v13 logEventBackwardLTESleepMgrStatsWithVer:v21 andML1State:v26 andSES:v27 andSDS:v28 andStDur:v29 andDSlpDur:v30 andLSlpDur:v31];
      }
      else
      {
        unsigned int v38 = *((_DWORD *)v23 + 6) + *((_DWORD *)v23 + 7) + *((_DWORD *)v23 + 8);
        BOOL v21 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*v23];
        uint64_t v26 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v23[4]];
        v32 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v23 + 2)];
        uint64_t v33 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v23 + 3)];
        __int16 v34 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v23 + 4)];
        uint64_t v35 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v23 + 5)];
        __int16 v36 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v38];
        [(PLBBEurekaLogMsg *)v13 logEventBackwardLTESleepMgrStatsWithVer:v21 andML1State:v26 andSES:v32 andSDS:v33 andStDur:v34 andDSlpDur:v35 andLSlpDur:v36];
      }
      id v4 = v39;
    }
    else
    {
      BOOL v21 = [(PLBasebandEurekaLogMessage *)self tooShortErrorString];
      [(PLBBEurekaLogMsg *)v13 setError:v21];
    }
  }
  [(PLBasebandMessage *)self logEntry:@"BB Event" withBody:v12];
}

uint64_t __44__PLBasebandEurekaLogMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C44A = result;
  return result;
}

- (unsigned)eventCode
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __39__PLBasebandEurekaLogMessage_eventCode__block_invoke;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v3;
    if (qword_1EBD5C468 != -1) {
      dispatch_once(&qword_1EBD5C468, &block);
    }
    if (byte_1EBD5C44B)
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaLogMessage eventCode]", block, v12, v13, v14, v15);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBasebandEurekaLogMessage eventCode]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:175];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v17 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return (unsigned __int16)[(PLBasebandEurekaLogMessage *)self header][3];
}

uint64_t __39__PLBasebandEurekaLogMessage_eventCode__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C44B = result;
  return result;
}

- (id)stringForUnknownBytes:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLBasebandEurekaLogMessage_stringForUnknownBytes___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD5C470 != -1) {
      dispatch_once(&qword_1EBD5C470, block);
    }
    if (byte_1EBD5C44C)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaLogMessage stringForUnknownBytes:]");
      v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBasebandEurekaLogMessage stringForUnknownBytes:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:203];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"?-(0x%x/%u)", v3, v3);
  return v11;
}

uint64_t __52__PLBasebandEurekaLogMessage_stringForUnknownBytes___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C44C = result;
  return result;
}

- (id)tooShortErrorString
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __49__PLBasebandEurekaLogMessage_tooShortErrorString__block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5C478 != -1) {
      dispatch_once(&qword_1EBD5C478, &block);
    }
    if (byte_1EBD5C44D)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandEurekaLogMessage tooShortErrorString]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBasebandEurekaLogMessage tooShortErrorString]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:208];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"short_length!(%d)", (unsigned __int16)-[PLBasebandEurekaLogMessage header](self, "header")[1]);
  return v10;
}

uint64_t __49__PLBasebandEurekaLogMessage_tooShortErrorString__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C44D = result;
  return result;
}

- (_PLBasebandLogHeader)header
{
  return self->_header;
}

- (void)setHeader:(_PLBasebandLogHeader *)a3
{
  self->_header = a3;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end