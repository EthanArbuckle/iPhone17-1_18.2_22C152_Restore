@interface PLBasebandMessage
+ (id)messageWithData:(id)a3;
- (BOOL)isCalibratedDateGood;
- (BOOL)isTimestampValid:(char *)a3;
- (NSData)rawData;
- (NSDate)apTimestamp;
- (NSDate)calibratedTimestamp;
- (NSDate)date;
- (NSDate)timestamp;
- (NSNumber)msgType;
- (NSNumber)seqNum;
- (NSString)pload;
- (PLAgent)agent;
- (PLBBMsg)logger;
- (PLBasebandMessage)initWithData:(id)a3;
- (double)timeCal;
- (double)timeCalibration;
- (unsigned)ticksInGPSONState;
- (unsigned)ticksInGoodState;
- (void)dealloc;
- (void)logEntry:(id)a3 withBody:(id)a4;
- (void)logMsgAll;
- (void)logWithLogger:(id)a3;
- (void)setAgent:(id)a3;
- (void)setDate:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMsgType:(id)a3;
- (void)setPload:(id)a3;
- (void)setSeqNum:(id)a3;
- (void)setTimeCal:(double)a3;
- (void)setTimeCalibration:(double)a3;
@end

@implementation PLBasebandMessage

+ (id)messageWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (unsigned __int8 *)[v3 bytes];
  v5 = &v4[2 * (*v4 == 129)];
  unsigned int v6 = *v5;
  if (v6 > 3)
  {
    if (v6 == 4)
    {
      int v7 = *(unsigned __int16 *)(v5 + 3);
      if ((v7 - 33) >= 5)
      {
        if (v7 == 1)
        {
          switch(*(_WORD *)(v5 + 15))
          {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 7:
            case 8:
              break;
            default:
              MGIsDeviceOneOfType();
              break;
          }
        }
      }
      else if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v8 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __37__PLBasebandMessage_messageWithData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v8;
        if (qword_1EBD5C330 != -1) {
          dispatch_once(&qword_1EBD5C330, block);
        }
        if (_MergedGlobals_100)
        {
          v9 = [NSString stringWithFormat:@"Mav health mon msgs"];
          v10 = (void *)MEMORY[0x1E4F929B8];
          v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m"];
          v12 = [v11 lastPathComponent];
          v13 = [NSString stringWithUTF8String:"+[PLBasebandMessage messageWithData:]"];
          [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:150];

          v14 = PLLogCommon();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v9;
            _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    else if (v6 == 255 && *(_WORD *)(v5 + 3) != 3)
    {
      v15 = 0;
      goto LABEL_19;
    }
  }
  v15 = (objc_class *)objc_opt_class();
LABEL_19:
  v16 = (void *)[[v15 alloc] initWithData:v3];

  return v16;
}

uint64_t __37__PLBasebandMessage_messageWithData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_100 = result;
  return result;
}

- (PLBasebandMessage)initWithData:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLBasebandMessage;
  unsigned int v6 = [(PLBasebandMessage *)&v11 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->rawData, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    apTimestamp = v7->_apTimestamp;
    v7->_apTimestamp = (NSDate *)v8;
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PLBasebandMessage;
  [(PLBasebandMessage *)&v2 dealloc];
}

- (BOOL)isTimestampValid:(char *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __38__PLBasebandMessage_isTimestampValid___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v4;
    if (qword_1EBD5C338 != -1) {
      dispatch_once(&qword_1EBD5C338, &block);
    }
    if (byte_1EBD5C329)
    {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMessage isTimestampValid:]", block, v13, v14, v15, v16);
      unsigned int v6 = (void *)MEMORY[0x1E4F929B8];
      int v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m"];
      uint64_t v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBasebandMessage isTimestampValid:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:206];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return bswap64(*(void *)a3) != 0;
}

uint64_t __38__PLBasebandMessage_isTimestampValid___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C329 = result;
  return result;
}

- (NSDate)timestamp
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__PLBasebandMessage_timestamp__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5C340 != -1) {
      dispatch_once(&qword_1EBD5C340, block);
    }
    if (byte_1EBD5C32A)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMessage timestamp]");
      id v5 = (void *)MEMORY[0x1E4F929B8];
      unsigned int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m"];
      int v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBasebandMessage timestamp]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:254];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = [(NSData *)self->rawData bytes];
  objc_super v11 = &v10[2 * (*v10 == 129)];
  switch(*v11)
  {
    case 1u:
    case 2u:
    case 4u:
    case 8u:
      *(void *)buf = *(void *)(v11 + 5);
      if (![(PLBasebandMessage *)self isTimestampValid:buf]) {
        goto LABEL_18;
      }
      unint64_t v12 = 5 * (*(void *)buf >> 16) + *(_WORD *)buf / 0x2667u + 2;
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(int)(1000 * ((v12 >> 2) - 1000 * (((v12 >> 2) * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64)))/ 1000000.0+ (double)(uint64_t)(((v12 * (unsigned __int128)0x10624DD2F1A9FCuLL) >> 64) + 315964800)];
      break;
    default:
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v14 = objc_opt_class();
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __30__PLBasebandMessage_timestamp__block_invoke_391;
        v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v22[4] = v14;
        if (qword_1EBD5C348 != -1) {
          dispatch_once(&qword_1EBD5C348, v22);
        }
        if (byte_1EBD5C32B)
        {
          v15 = [NSString stringWithFormat:@"unknown BB msg type, ret current date"];
          uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
          v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m"];
          v18 = [v17 lastPathComponent];
          uint64_t v19 = [NSString stringWithUTF8String:"-[PLBasebandMessage timestamp]"];
          [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:281];

          v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v15;
            _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
LABEL_18:
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      break;
  }
  return (NSDate *)v13;
}

uint64_t __30__PLBasebandMessage_timestamp__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C32A = result;
  return result;
}

uint64_t __30__PLBasebandMessage_timestamp__block_invoke_391(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C32B = result;
  return result;
}

- (NSDate)calibratedTimestamp
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __40__PLBasebandMessage_calibratedTimestamp__block_invoke;
    uint64_t v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v3;
    if (qword_1EBD5C350 != -1) {
      dispatch_once(&qword_1EBD5C350, &block);
    }
    if (byte_1EBD5C32C)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMessage calibratedTimestamp]", block, v17, v18, v19, v20);
      id v5 = (void *)MEMORY[0x1E4F929B8];
      unsigned int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m"];
      int v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBasebandMessage calibratedTimestamp]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:295];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  [(PLBasebandMessage *)self timeCalibration];
  double v12 = v11;
  uint64_t v13 = [(PLBasebandMessage *)self timestamp];
  uint64_t v14 = [v10 dateWithTimeInterval:v13 sinceDate:v12];

  return (NSDate *)v14;
}

uint64_t __40__PLBasebandMessage_calibratedTimestamp__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C32C = result;
  return result;
}

- (BOOL)isCalibratedDateGood
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __41__PLBasebandMessage_isCalibratedDateGood__block_invoke;
    uint64_t v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v3;
    if (qword_1EBD5C358 != -1) {
      dispatch_once(&qword_1EBD5C358, &block);
    }
    if (byte_1EBD5C32D)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMessage isCalibratedDateGood]", block, v17, v18, v19, v20);
      id v5 = (void *)MEMORY[0x1E4F929B8];
      unsigned int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m"];
      int v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLBasebandMessage isCalibratedDateGood]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:304];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = [(PLBasebandMessage *)self calibratedTimestamp];
  double v11 = [(PLBasebandMessage *)self apTimestamp];
  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  if (v13 >= 0.0 && v13 <= 60.0) {
    return 1;
  }
  if (v13 < 0.0) {
    return v13 > -86400.0;
  }
  return 0;
}

uint64_t __41__PLBasebandMessage_isCalibratedDateGood__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C32D = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v4 = [(NSData *)self->rawData bytes];
  if (*v4 == 129)
  {
    id v5 = v4;
    unsigned int v6 = (NSNumber *)[objc_alloc(NSNumber) initWithUnsignedChar:v4[1]];
    seqNum = self->_seqNum;
    self->_seqNum = v6;

    uint64_t v8 = [NSNumber numberWithUnsignedChar:v5[2]];
    msgType = self->_msgType;
    self->_msgType = v8;
  }
  v10 = [(NSData *)self->rawData description];
  pload = self->_pload;
  self->_pload = v10;

  [(PLBasebandMessage *)self logEntry:@"Baseband Log" withBody:0];
}

- (void)logEntry:(id)a3 withBody:(id)a4
{
  if (![(PLBasebandMessage *)self isCalibratedDateGood])
  {
    id v5 = [(PLBasebandMessage *)self apTimestamp];
    unsigned int v6 = [(PLBasebandMessage *)self timestamp];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    [(PLBasebandMessage *)self setTimeCalibration:v8];
  }
  v9 = [(PLBasebandMessage *)self timestamp];
  date = self->_date;
  self->_date = v9;

  [(PLBasebandMessage *)self timeCalibration];
  self->_timeCal = v11;
  uint64_t v12 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PLBasebandMessage_logEntry_withBody___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v12;
  if (qword_1EBD5C360 != -1) {
    dispatch_once(&qword_1EBD5C360, block);
  }
  if (byte_1EBD5C32E) {
    [(PLBasebandMessage *)self logMsgAll];
  }
}

uint64_t __39__PLBasebandMessage_logEntry_withBody___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C32E = result;
  return result;
}

- (void)logMsgAll
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __30__PLBasebandMessage_logMsgAll__block_invoke;
    uint64_t v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v3;
    if (qword_1EBD5C368 != -1) {
      dispatch_once(&qword_1EBD5C368, &block);
    }
    if (byte_1EBD5C32F)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandMessage logMsgAll]", block, v17, v18, v19, v20);
      id v5 = (void *)MEMORY[0x1E4F929B8];
      unsigned int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m"];
      double v7 = [v6 lastPathComponent];
      double v8 = [NSString stringWithUTF8String:"-[PLBasebandMessage logMsgAll]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:420];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = objc_alloc_init(PLBBMsgAll);
  double v11 = [(PLBasebandMessage *)self agent];
  [(PLBBMsgRoot *)v10 setAgent:v11];

  uint64_t v12 = [(PLBasebandMessage *)self pload];
  [(PLBBMsgAll *)v10 setPayload:v12];

  double v13 = [(PLBasebandMessage *)self seqNum];
  [(PLBBMsgAll *)v10 setSeqNum:v13];

  uint64_t v14 = [(PLBasebandMessage *)self date];
  [(PLBBMsgAll *)v10 setBbDate:v14];

  [(PLBBMsgAll *)v10 setError:@"no error"];
  v15 = [(PLBasebandMessage *)self msgType];
  [(PLBBMsgRoot *)v10 setMsgType:v15];

  [(PLBBMsgAll *)v10 logEventNoneBBMsgAll];
}

uint64_t __30__PLBasebandMessage_logMsgAll__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C32F = result;
  return result;
}

- (NSData)rawData
{
  return self->rawData;
}

- (unsigned)ticksInGoodState
{
  return self->ticksInGoodState;
}

- (unsigned)ticksInGPSONState
{
  return self->ticksInGPSONState;
}

- (double)timeCalibration
{
  return self->timeCalibration;
}

- (void)setTimeCalibration:(double)a3
{
  self->timeCalibration = a3;
}

- (NSDate)apTimestamp
{
  return self->_apTimestamp;
}

- (PLBBMsg)logger
{
  return (PLBBMsg *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogger:(id)a3
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

- (double)timeCal
{
  return self->_timeCal;
}

- (void)setTimeCal:(double)a3
{
  self->_timeCal = a3;
}

- (NSString)pload
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPload:(id)a3
{
}

- (NSNumber)msgType
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMsgType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgType, 0);
  objc_storeStrong((id *)&self->_pload, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_seqNum, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_apTimestamp, 0);
  objc_storeStrong((id *)&self->rawData, 0);
}

@end