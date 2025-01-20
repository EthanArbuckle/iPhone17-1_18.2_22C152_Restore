@interface PLBasebandMavLogMessage
- (BOOL)parseData:(id)a3;
- (NSData)payload;
- (NSString)eventCodeString;
- (PLBasebandMavLogMessage)initWithData:(id)a3;
- (_PLBasebandLogHeader)header;
- (id)stringForUnknownBytes:(unsigned int)a3;
- (id)tooShortErrorString;
- (unsigned)eventCode;
- (void)logWithLogger:(id)a3;
- (void)setHeader:(_PLBasebandLogHeader *)a3;
- (void)setPayload:(id)a3;
@end

@implementation PLBasebandMavLogMessage

- (PLBasebandMavLogMessage)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLBasebandMavLogMessage_initWithData___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C2C0 != -1) {
      dispatch_once(&qword_1EBD5C2C0, block);
    }
    if (_MergedGlobals_98)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMavLogMessage initWithData:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBasebandMavLogMessage initWithData:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:22];

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
  v17.super_class = (Class)PLBasebandMavLogMessage;
  v12 = [(PLBasebandMessage *)&v17 initWithData:v4];
  v13 = v12;
  if (!v12
    || (v12->_header = 0,
        payload = v12->_payload,
        v12->_payload = 0,
        payload,
        v15 = 0,
        [(PLBasebandMavLogMessage *)v13 parseData:v4]))
  {
    v15 = v13;
  }

  return v15;
}

uint64_t __40__PLBasebandMavLogMessage_initWithData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_98 = result;
  return result;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __37__PLBasebandMavLogMessage_parseData___block_invoke;
    v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v30 = v5;
    if (qword_1EBD5C2C8 != -1) {
      dispatch_once(&qword_1EBD5C2C8, &block);
    }
    if (byte_1EBD5C2B9)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMavLogMessage parseData:]", block, v27, v28, v29, v30);
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBasebandMavLogMessage parseData:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:35];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = (unsigned __int8 *)[v12 bytes];
  v14 = &v13[2 * (*v13 == 129)];
  [(PLBasebandMavLogMessage *)self setHeader:v14];
  v15 = v14 + 13;
  unint64_t v16 = (unsigned __int16)[(PLBasebandMavLogMessage *)self header][1];
  unint64_t v17 = v16 - 12;
  if (v16 >= 0xD
    && (id v18 = v12,
        unint64_t v19 = (unint64_t)&v15[v17 - [v18 bytes]],
        v19 <= [v18 length]))
  {
    v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:v17];
    [(PLBasebandMavLogMessage *)self setPayload:v20];
    BOOL v21 = 1;
  }
  else
  {
    v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v23 = v12;
      uint64_t v24 = (uint64_t)&v15[v17 - [v23 bytes]];
      uint64_t v25 = [v23 length];
      *(_DWORD *)buf = 134218498;
      uint64_t v32 = v24;
      __int16 v33 = 2048;
      uint64_t v34 = v25;
      __int16 v35 = 2080;
      v36 = "-[PLBasebandMavLogMessage parseData:]";
      _os_log_error_impl(&dword_1D2690000, v20, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
    BOOL v21 = 0;
  }

  return v21;
}

uint64_t __37__PLBasebandMavLogMessage_parseData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C2B9 = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLBasebandMavLogMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C2D0 != -1) {
      dispatch_once(&qword_1EBD5C2D0, block);
    }
    if (byte_1EBD5C2BA)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMavLogMessage logWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBasebandMavLogMessage logWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:67];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PLBasebandMavLogMessage;
  [(PLBasebandMessage *)&v12 logWithLogger:v4];
  [(PLBasebandMavLogMessage *)self header];
}

uint64_t __41__PLBasebandMavLogMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C2BA = result;
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
    block[2] = __49__PLBasebandMavLogMessage_stringForUnknownBytes___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD5C2D8 != -1) {
      dispatch_once(&qword_1EBD5C2D8, block);
    }
    if (byte_1EBD5C2BB)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMavLogMessage stringForUnknownBytes:]");
      v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBasebandMavLogMessage stringForUnknownBytes:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:120];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"?-(0x%x/%u)", v3, v3);
  return v11;
}

uint64_t __49__PLBasebandMavLogMessage_stringForUnknownBytes___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C2BB = result;
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
    v14 = __46__PLBasebandMavLogMessage_tooShortErrorString__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v3;
    if (qword_1EBD5C2E0 != -1) {
      dispatch_once(&qword_1EBD5C2E0, &block);
    }
    if (byte_1EBD5C2BC)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMavLogMessage tooShortErrorString]", block, v13, v14, v15, v16);
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBasebandMavLogMessage tooShortErrorString]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:125];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"short_length!(%d)", (unsigned __int16)-[PLBasebandMavLogMessage header](self, "header")[1]);
  return v10;
}

uint64_t __46__PLBasebandMavLogMessage_tooShortErrorString__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C2BC = result;
  return result;
}

- (NSString)eventCodeString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (unsigned)eventCode
{
  return self->_eventCode;
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
  objc_storeStrong((id *)&self->_eventCodeString, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end