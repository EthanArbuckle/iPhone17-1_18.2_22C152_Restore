@interface PLBasebandHardwareMessage
- (BOOL)parseData:(id)a3;
- (PLBasebandHardwareMessage)initWithData:(id)a3;
- (_PLBasebandHWOnOffComponentStats)adm;
- (_PLBasebandHWOnOffComponentStats)gps;
- (_PLBasebandHWOnOffComponentStats)mdm;
- (_PLBasebandHWOnOffComponentStats)spi;
- (_PLBasebandHWOnOffComponentStats)usb;
- (_PLBasebandHWStatsADSP)adsp;
- (_PLBasebandHWStatsARMPerf)armPerf;
- (_PLBasebandHWStatsHeader)header;
- (_PLBasebandHWStatsMDSP)mdsp;
- (_PLBasebandHWStatsRXRSSI)rx;
- (_PLBasebandHWStatsSystem)system;
- (_PLBasebandHWStatsTXPower)tx;
- (_PLBasebandHWStatsUART)uart;
- (id)convertToObjectArray:(unsigned int *)a3 ofSize:(unsigned int)a4;
- (id)convertToObjectArrayPercentage:(unsigned int *)a3 ofSize:(unsigned int)a4;
- (id)convertUint16ArrayToNSArray:(unsigned __int16 *)a3 ofSize:(unsigned int)a4;
- (id)convertUint32ArrayToNSArray:(unsigned int *)a3 ofSize:(unsigned int)a4;
- (id)convertUint32ArrayToNSArray:(unsigned int *)a3 ofSize:(unsigned int)a4 andFill:(unsigned int)a5;
- (id)convertUint64ArrayToNSArray:(unint64_t *)a3 ofSize:(unsigned int)a4;
- (id)convertUint8ArrayToNSArray:(char *)a3 ofSize:(unsigned int)a4;
- (unsigned)level;
- (unsigned)logDuration;
- (unsigned)revision;
- (unsigned)sumHardwareStat:(unsigned int *)a3 ofSize:(unsigned int)a4;
- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 inString:(id)a5;
- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 inString:(id)a5 inReverse:(BOOL)a6;
- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 withMultiplier:(float)a5 inString:(id)a6;
- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 withMultiplier:(float)a5 inString:(id)a6 inReverse:(BOOL)a7;
- (void)formatOnOffStates:(_PLBasebandHWOnOffComponentStats *)a3 inString:(id)a4;
- (void)logHeaderWithLogger:(id)a3;
- (void)logModemAppWithLogger:(id)a3;
- (void)logPeripheralsWithLogger:(id)a3;
- (void)logProcessorWithLogger:(id)a3;
- (void)logRFWithLogger2:(id)a3;
- (void)logRawWithLogger:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setAdm:(_PLBasebandHWOnOffComponentStats *)a3;
- (void)setAdsp:(_PLBasebandHWStatsADSP *)a3;
- (void)setArmPerf:(_PLBasebandHWStatsARMPerf *)a3;
- (void)setGps:(_PLBasebandHWOnOffComponentStats *)a3;
- (void)setHeader:(_PLBasebandHWStatsHeader *)a3;
- (void)setLogDuration:(unsigned int)a3;
- (void)setMdm:(_PLBasebandHWOnOffComponentStats *)a3;
- (void)setMdsp:(_PLBasebandHWStatsMDSP *)a3;
- (void)setRx:(_PLBasebandHWStatsRXRSSI *)a3;
- (void)setSpi:(_PLBasebandHWOnOffComponentStats *)a3;
- (void)setSystem:(_PLBasebandHWStatsSystem *)a3;
- (void)setTx:(_PLBasebandHWStatsTXPower *)a3;
- (void)setUart:(_PLBasebandHWStatsUART *)a3;
- (void)setUsb:(_PLBasebandHWOnOffComponentStats *)a3;
@end

@implementation PLBasebandHardwareMessage

- (PLBasebandHardwareMessage)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLBasebandHardwareMessage;
  v5 = [(PLBasebandMessage *)&v9 initWithData:v4];
  v6 = v5;
  if (!v5) {
    goto LABEL_3;
  }
  [(PLBasebandHardwareMessage *)v5 setHeader:0];
  [(PLBasebandHardwareMessage *)v6 setSystem:0];
  [(PLBasebandHardwareMessage *)v6 setArmPerf:0];
  [(PLBasebandHardwareMessage *)v6 setMdsp:0];
  [(PLBasebandHardwareMessage *)v6 setMdm:0];
  [(PLBasebandHardwareMessage *)v6 setAdsp:0];
  [(PLBasebandHardwareMessage *)v6 setAdm:0];
  [(PLBasebandHardwareMessage *)v6 setGps:0];
  [(PLBasebandHardwareMessage *)v6 setUsb:0];
  [(PLBasebandHardwareMessage *)v6 setUart:0];
  [(PLBasebandHardwareMessage *)v6 setSpi:0];
  [(PLBasebandHardwareMessage *)v6 setRx:0];
  [(PLBasebandHardwareMessage *)v6 setTx:0];
  v7 = 0;
  if ([(PLBasebandHardwareMessage *)v6 parseData:v4]) {
LABEL_3:
  }
    v7 = v6;

  return v7;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  [(PLBasebandHardwareMessage *)self setHeader:v5 + 13];
  if ([(PLBasebandHardwareMessage *)self revision] <= 2)
  {
    uint64_t v6 = v5 + 29;
    [(PLBasebandHardwareMessage *)self setLogDuration:([(PLBasebandHardwareMessage *)self header][12]- [(PLBasebandHardwareMessage *)self header][8])];
    if ([(PLBasebandHardwareMessage *)self level])
    {
      [(PLBasebandHardwareMessage *)self setSystem:v5 + 29];
      uint64_t v6 = v5 + 49;
    }
    if ([(PLBasebandHardwareMessage *)self level] >= 4)
    {
      [(PLBasebandHardwareMessage *)self setArmPerf:v6];
      v6 += 40;
    }
    if ([(PLBasebandHardwareMessage *)self level] >= 3)
    {
      [(PLBasebandHardwareMessage *)self setMdsp:v6];
      [(PLBasebandHardwareMessage *)self setMdm:v6 + 60];
      [(PLBasebandHardwareMessage *)self setAdsp:v6 + 76];
      [(PLBasebandHardwareMessage *)self setAdm:v6 + 136];
      [(PLBasebandHardwareMessage *)self setGps:v6 + 152];
      [(PLBasebandHardwareMessage *)self setUsb:v6 + 168];
      [(PLBasebandHardwareMessage *)self setUart:v6 + 184];
      [(PLBasebandHardwareMessage *)self setSpi:v6 + 216];
      v6 += 232;
    }
    if ([(PLBasebandHardwareMessage *)self level] >= 6)
    {
      [(PLBasebandHardwareMessage *)self setRx:v6];
      [(PLBasebandHardwareMessage *)self setTx:v6 + 120];
      v6 += 168;
    }
    id v7 = v4;
    unint64_t v8 = v6 - [v7 bytes];
    if (v8 <= [v7 length])
    {
      BOOL v10 = 1;
      goto LABEL_16;
    }
    objc_super v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v12 = v7;
      int v13 = 134218498;
      uint64_t v14 = v6 - [v12 bytes];
      __int16 v15 = 2048;
      uint64_t v16 = [v12 length];
      __int16 v17 = 2080;
      v18 = "-[PLBasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1D2690000, v9, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", (uint8_t *)&v13, 0x20u);
    }
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(PLBasebandHardwareMessage *)self logRawWithLogger:0];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLBasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD5C5B0 != -1) {
      dispatch_once(&qword_1EBD5C5B0, block);
    }
    if (_MergedGlobals_109)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandHardwareMessage logWithLogger:]");
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      unint64_t v8 = [v7 lastPathComponent];
      objc_super v9 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logWithLogger:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:154];

      BOOL v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v11 = objc_alloc_init(PLBBMavLogMsg);
  id v12 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v11 setAgent:v12];

  [(PLBBMavLogMsg *)v11 setError:&stru_1F294E108];
  int v13 = [(PLBasebandMessage *)self seqNum];
  uint64_t v14 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v11, "setHeaderWithSeqNum:andDate:andTimeCal:", v13, v14);

  [(PLBasebandHardwareMessage *)self logHeaderWithLogger:v11];
  [(PLBasebandHardwareMessage *)self logProcessorWithLogger:v11];
  [(PLBasebandHardwareMessage *)self logModemAppWithLogger:v11];
  [(PLBasebandHardwareMessage *)self logPeripheralsWithLogger:v11];
  [(PLBBMavLogMsg *)v11 addToGroupPLBBMav1HwOther];
  [(PLBasebandHardwareMessage *)self logRFWithLogger2:v11];
  [(PLBBMavLogMsg *)v11 logEventBackwardGrpEntriesBBMavHw];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __43__PLBasebandHardwareMessage_logWithLogger___block_invoke_375;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = v15;
    if (qword_1EBD5C5B8 != -1) {
      dispatch_once(&qword_1EBD5C5B8, v22);
    }
    if (byte_1EBD5C599)
    {
      uint64_t v16 = [NSString stringWithFormat:@"Decoding BB HW RF completed"];
      __int16 v17 = (void *)MEMORY[0x1E4F929B8];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      uint64_t v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logWithLogger:]"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:175];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __43__PLBasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_109 = result;
  return result;
}

uint64_t __43__PLBasebandHardwareMessage_logWithLogger___block_invoke_375(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C599 = result;
  return result;
}

- (void)logRawWithLogger:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PLBasebandHardwareMessage;
  [(PLBasebandMessage *)&v3 logWithLogger:a3];
}

- (void)logHeaderWithLogger:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __49__PLBasebandHardwareMessage_logHeaderWithLogger___block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v5;
    if (qword_1EBD5C5C0 != -1) {
      dispatch_once(&qword_1EBD5C5C0, &block);
    }
    if (byte_1EBD5C59A)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandHardwareMessage logHeaderWithLogger:]", block, v18, v19, v20, v21);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      BOOL v10 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logHeaderWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:186];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = NSNumber;
  id v13 = v4;
  uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInt:", -[PLBasebandHardwareMessage logDuration](self, "logDuration"));
  [v13 setBbHwLogDurationInTicks:v14];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBasebandHardwareMessage level](self, "level"));
  [v13 setBbHwStatsLevel:v15];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBasebandHardwareMessage revision](self, "revision"));
  [v13 setBbHwRev:v16];
}

uint64_t __49__PLBasebandHardwareMessage_logHeaderWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C59A = result;
  return result;
}

- (void)logProcessorWithLogger:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C5C8 != -1) {
      dispatch_once(&qword_1EBD5C5C8, block);
    }
    if (byte_1EBD5C59B)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandHardwareMessage logProcessorWithLogger:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      BOOL v10 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logProcessorWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:197];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBasebandHardwareMessage *)self system])
  {
    self->super.ticksInGoodState = [(PLBasebandHardwareMessage *)self system][16];
    id v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self system] + 8 ofSize:3];
    [v12 setBbHwProcSystemState:v13];
LABEL_10:

    goto LABEL_18;
  }
  [v12 appendToError:@"System_State=<unknown>"];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke_387;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v14;
    if (qword_1EBD5C5D0 != -1) {
      dispatch_once(&qword_1EBD5C5D0, v28);
    }
    if (byte_1EBD5C59C)
    {
      id v13 = [NSString stringWithFormat:@"System_State=<unknown>"];
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      __int16 v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logProcessorWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:214];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v13;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_10;
    }
  }
LABEL_18:
  if ([(PLBasebandHardwareMessage *)self armPerf])
  {
    v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self armPerf] + 12 ofSize:7];
    [v12 setBbHwProcArmPerfState:v20];
LABEL_20:

    goto LABEL_28;
  }
  [v12 appendToError:@"ARM_Perf_Level=<unknown>"];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke_393;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = v21;
    if (qword_1EBD5C5D8 != -1) {
      dispatch_once(&qword_1EBD5C5D8, v27);
    }
    if (byte_1EBD5C59D)
    {
      v20 = [NSString stringWithFormat:@"ARM_Perf_Level=<unknown>"];
      v22 = (void *)MEMORY[0x1E4F929B8];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      uint64_t v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logProcessorWithLogger:]"];
      [v22 logMessage:v20 fromFile:v24 fromFunction:v25 fromLineNumber:233];

      uint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_20;
    }
  }
LABEL_28:
  [v12 setType:@"BB HW Log"];
}

uint64_t __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C59B = result;
  return result;
}

uint64_t __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke_387(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C59C = result;
  return result;
}

uint64_t __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke_393(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C59D = result;
  return result;
}

- (void)logModemAppWithLogger:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __51__PLBasebandHardwareMessage_logModemAppWithLogger___block_invoke;
    uint64_t v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v25 = v5;
    if (qword_1EBD5C5E0 != -1) {
      dispatch_once(&qword_1EBD5C5E0, &block);
    }
    if (byte_1EBD5C59E)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandHardwareMessage logModemAppWithLogger:]", block, v22, v23, v24, v25);
      id v7 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      BOOL v10 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logModemAppWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:242];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBasebandHardwareMessage *)self mdsp])
  {
    id v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self mdsp] + 8 ofSize:2];
    [v12 setBbHwModemAppMdspState:v13];

    uint64_t v14 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self mdsp] + 24 ofSize:2];
    [v12 setBbHwModemAppMdspClockState:v14];

    uint64_t v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self mdsp] + 40 ofSize:5];
    [v12 setBbHwModemAppMdspSpeed:v15];
  }
  else
  {
    [v12 appendToError:@"MDSP=<unknown>"];
  }
  if ([(PLBasebandHardwareMessage *)self mdm])
  {
    uint64_t v16 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self mdm] + 8 ofSize:2];
    [v12 setBbHwModemAppMdmState:v16];
  }
  else
  {
    [v12 appendToError:@"MDM=<unknown>"];
  }
  if ([(PLBasebandHardwareMessage *)self adsp])
  {
    __int16 v17 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self adsp] + 8 ofSize:2];
    [v12 setBbHwModemAppAdspState:v17];

    uint64_t v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self adsp] + 24 ofSize:2];
    [v12 setBbHwModemAppAdspClockState:v18];

    uint64_t v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self adsp] + 8 ofSize:2];
    [v12 setBbHwModemAppAdspSpeed:v19];
  }
  else
  {
    [v12 appendToError:@"ADSP_Speed=<unknown>"];
  }
  if ([(PLBasebandHardwareMessage *)self adm])
  {
    v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self adm] + 8 ofSize:2];
    [v12 setBbHwModemAppAdmState:v20];
  }
  else
  {
    [v12 appendToError:@"ADM=<unknown>"];
  }
  [v12 setType:@"BB HW Modem/App"];
}

uint64_t __51__PLBasebandHardwareMessage_logModemAppWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C59E = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PLBasebandHardwareMessage_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C5E8 != -1) {
      dispatch_once(&qword_1EBD5C5E8, block);
    }
    if (byte_1EBD5C59F)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandHardwareMessage logPeripheralsWithLogger:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      BOOL v10 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:334];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBasebandHardwareMessage *)self gps])
  {
    id v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self gps] + 8 ofSize:2];
    [v12 setBbHwPeripheralGPSState:v13];
  }
  else
  {
    [v12 appendToError:@"GPS=<unknown>"];
  }
  if ([(PLBasebandHardwareMessage *)self usb])
  {
    uint64_t v14 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self usb] + 8 ofSize:2];
    [v12 setBbHwPeripheralUSBState:v14];
  }
  else
  {
    [v12 appendToError:@"USB=<unknown>"];
  }
  if ([(PLBasebandHardwareMessage *)self spi])
  {
    uint64_t v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self spi] + 8 ofSize:2];
    [v12 setBbHwPeripheralSPIState:v15];
  }
  else
  {
    [v12 appendToError:@"SPI=<unknown>"];
  }
  if ([(PLBasebandHardwareMessage *)self uart])
  {
    uint64_t v16 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self uart] + 24 ofSize:2];
    [v12 setBbHwPeripheralUARTState:v16];
  }
  else
  {
    [v12 appendToError:@"UART_Clock=<unknown>"];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__PLBasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_426;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = v17;
    if (qword_1EBD5C5F0 != -1) {
      dispatch_once(&qword_1EBD5C5F0, v24);
    }
    if (byte_1EBD5C5A0)
    {
      uint64_t v18 = [NSString stringWithFormat:@"Decoded BB HW Peripheral"];
      uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      uint64_t v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:404];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __54__PLBasebandHardwareMessage_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C59F = result;
  return result;
}

uint64_t __54__PLBasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_426(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A0 = result;
  return result;
}

- (void)logRFWithLogger2:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C5F8 != -1) {
      dispatch_once(&qword_1EBD5C5F8, block);
    }
    if (byte_1EBD5C5A1)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandHardwareMessage logRFWithLogger2:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      BOOL v10 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logRFWithLogger2:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:409];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf[0]) = 138412290;
        *(void *)((char *)buf + 4) = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  id v13 = objc_alloc_init(PLBBMavLogMsg);
  uint64_t v14 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v13 setAgent:v14];

  [(PLBBMavLogMsg *)v13 setError:&stru_1F294E108];
  uint64_t v15 = [(PLBasebandMessage *)self seqNum];
  uint64_t v16 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  if ([(PLBasebandHardwareMessage *)self rx] && [(PLBasebandHardwareMessage *)self tx])
  {
    buf[0] = *(_OWORD *)[(PLBasebandHardwareMessage *)self rx];
    uint64_t v17 = [(PLBasebandHardwareMessage *)self sumHardwareStat:buf ofSize:4];
    uint64_t v18 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v17];
    [(PLBBMavLogMsg *)v13 setRxTicks:v18];

    uint64_t v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self rx] ofSize:4];
    [(PLBBMavLogMsg *)v13 setRssiModeCount:v19];

    v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self rx] + 16 ofSize:13];
    [(PLBBMavLogMsg *)v13 setRx0RssiPowerHist:v20];

    uint64_t v21 = [(PLBasebandHardwareMessage *)self tx];
    long long v23 = *(_OWORD *)&v21->var0[4];
    long long v22 = *(_OWORD *)&v21->var0[8];
    buf[0] = *(_OWORD *)v21->var0;
    buf[1] = v23;
    buf[2] = v22;
    uint64_t v24 = [(PLBasebandHardwareMessage *)self sumHardwareStat:buf ofSize:12];
    uint64_t v25 = [NSNumber numberWithUnsignedInt:v24];
    [(PLBBMavLogMsg *)v13 setTxTicks:v25];

    uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBasebandHardwareMessage logDuration](self, "logDuration"));
    [(PLBBMavLogMsg *)v13 setBbHwLogDurationInTicks:v26];

    v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self tx] ofSize:12];
    [(PLBBMavLogMsg *)v13 setTxPowerHist1x:v27];

    uint64_t v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBasebandHardwareMessage *)self rx] + 68 ofSize:12];
    [(PLBBMavLogMsg *)v13 setTxPowerHistEVDO:v28];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v29 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke_438;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v29;
      if (qword_1EBD5C608 != -1) {
        dispatch_once(&qword_1EBD5C608, v46);
      }
      if (byte_1EBD5C5A3)
      {
        v30 = [NSString stringWithFormat:@"Decoded Mav BB HW RF"];
        v31 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
        v33 = [v32 lastPathComponent];
        v34 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logRFWithLogger2:]"];
        [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:463];

        v35 = PLLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v49 = 138412290;
          v50 = v30;
          _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", v49, 0xCu);
        }
      }
    }
    v36 = [(PLBBMavLogMsg *)v13 logEventBackwardGrpEntriesBBMav1HwOtherPerRAT];
    v37 = [v36 objectForKey:@"entry"];
    v38 = [v36 objectForKey:@"name"];
    [v12 addToGroupPLBBMavHwEntry:v37 withEntryKey:v38];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v39 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke_432;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v39;
      if (qword_1EBD5C600 != -1) {
        dispatch_once(&qword_1EBD5C600, v47);
      }
      if (byte_1EBD5C5A2)
      {
        v40 = [NSString stringWithFormat:@"Error: BB HW RF <RAT> is expected but not present"];
        v41 = (void *)MEMORY[0x1E4F929B8];
        v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
        v43 = [v42 lastPathComponent];
        v44 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage logRFWithLogger2:]"];
        [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:432];

        v45 = PLLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf[0]) = 138412290;
          *(void *)((char *)buf + 4) = v40;
          _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);
        }
      }
    }
    [(PLBBMavLogMsg *)v13 appendToError:@"Error: BB HW RF <RAT> is expected but not present"];
    [(PLBBMavLogMsg *)v13 logEventBackwardMavBBHwOtherPerRAT];
  }
}

uint64_t __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A1 = result;
  return result;
}

uint64_t __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke_432(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A2 = result;
  return result;
}

uint64_t __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke_438(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A3 = result;
  return result;
}

- (unsigned)revision
{
  return *(_DWORD *)[(PLBasebandHardwareMessage *)self header];
}

- (unsigned)level
{
  return [(PLBasebandHardwareMessage *)self header][4];
}

- (void)formatOnOffStates:(_PLBasebandHWOnOffComponentStats *)a3 inString:(id)a4
{
}

- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 inString:(id)a5
{
}

- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 inString:(id)a5 inReverse:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  id v11 = a5;
  *(float *)&double v10 = 100.0 / (float)[(PLBasebandHardwareMessage *)self logDuration];
  [(PLBasebandHardwareMessage *)self formatArray:a3 ofSize:v7 withMultiplier:v11 inString:v6 inReverse:v10];
}

- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 withMultiplier:(float)a5 inString:(id)a6
{
}

- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 withMultiplier:(float)a5 inString:(id)a6 inReverse:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a4;
  id v23 = a6;
  float v12 = fabsf(a5);
  BOOL v13 = v12 < INFINITY;
  BOOL v14 = v12 <= INFINITY;
  double v15 = 0.0;
  if (v13) {
    *(float *)&double v15 = a5;
  }
  if (v14) {
    a5 = *(float *)&v15;
  }
  uint64_t v16 = -[PLBasebandHardwareMessage convertToObjectArray:ofSize:](self, "convertToObjectArray:ofSize:", a3, v9, v15);
  if (v16)
  {
    [v23 appendString:@"["];
    if ([v16 count])
    {
      unint64_t v17 = 0;
      uint64_t v18 = @"%];";
      do
      {
        if (v17) {
          [v23 appendString:@","];
        }
        uint64_t v19 = v17;
        if (v7) {
          uint64_t v19 = objc_msgSend(v16, "count", v17) + ~v17;
        }
        v20 = [v16 objectAtIndexedSubscript:v19];
        [v20 floatValue];
        float v22 = a5 * v21;

        if (v22 >= 0.01) {
          objc_msgSend(v23, "appendFormat:", @"%.02f", v22);
        }
        else {
          objc_msgSend(v23, "appendString:", @"0", v22);
        }
        ++v17;
      }
      while (v17 < [v16 count]);
    }
    else
    {
      uint64_t v18 = @"%];";
    }
  }
  else
  {
    uint64_t v18 = @"[Array Length > FORMAT_ARRAY_MAX_LENGTH]";
  }
  [v23 appendString:v18];
}

- (id)convertUint8ArrayToNSArray:(char *)a3 ofSize:(unsigned int)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PLBasebandHardwareMessage_convertUint8ArrayToNSArray_ofSize___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD5C610 != -1) {
      dispatch_once(&qword_1EBD5C610, block);
    }
    if (byte_1EBD5C5A4)
    {
      BOOL v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:]");
      unint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
      double v10 = [v9 lastPathComponent];
      id v11 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:668];

      float v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 && a4)
  {
    uint64_t v14 = a4;
    do
    {
      unsigned int v15 = *a3++;
      uint64_t v16 = [NSNumber numberWithUnsignedChar:v15];
      [v13 addObject:v16];

      --v14;
    }
    while (v14);
    id v17 = v13;
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v18 = objc_opt_class();
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __63__PLBasebandHardwareMessage_convertUint8ArrayToNSArray_ofSize___block_invoke_469;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v18;
      if (qword_1EBD5C618 != -1) {
        dispatch_once(&qword_1EBD5C618, v26);
      }
      if (byte_1EBD5C5A5)
      {
        uint64_t v19 = [NSString stringWithFormat:@"bad input"];
        v20 = (void *)MEMORY[0x1E4F929B8];
        float v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
        float v22 = [v21 lastPathComponent];
        id v23 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:]"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:672];

        uint64_t v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v19;
          _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

uint64_t __63__PLBasebandHardwareMessage_convertUint8ArrayToNSArray_ofSize___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A4 = result;
  return result;
}

uint64_t __63__PLBasebandHardwareMessage_convertUint8ArrayToNSArray_ofSize___block_invoke_469(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A5 = result;
  return result;
}

- (id)convertUint16ArrayToNSArray:(unsigned __int16 *)a3 ofSize:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 && a4)
  {
    uint64_t v7 = a4;
    do
    {
      unsigned int v8 = *a3++;
      uint64_t v9 = [NSNumber numberWithUnsignedShort:v8];
      [v6 addObject:v9];

      --v7;
    }
    while (v7);
    id v10 = v6;
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__PLBasebandHardwareMessage_convertUint16ArrayToNSArray_ofSize___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v11;
      if (qword_1EBD5C620 != -1) {
        dispatch_once(&qword_1EBD5C620, block);
      }
      if (byte_1EBD5C5A6)
      {
        float v12 = [NSString stringWithFormat:@"bad input"];
        id v13 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
        unsigned int v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:]"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:689];

        id v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          float v21 = v12;
          _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

uint64_t __64__PLBasebandHardwareMessage_convertUint16ArrayToNSArray_ofSize___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A6 = result;
  return result;
}

- (id)convertUint32ArrayToNSArray:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 && a4)
  {
    uint64_t v7 = a4;
    do
    {
      unsigned int v8 = *a3++;
      uint64_t v9 = [NSNumber numberWithUnsignedInt:v8];
      [v6 addObject:v9];

      --v7;
    }
    while (v7);
    id v10 = v6;
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__PLBasebandHardwareMessage_convertUint32ArrayToNSArray_ofSize___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v11;
      if (qword_1EBD5C628 != -1) {
        dispatch_once(&qword_1EBD5C628, block);
      }
      if (byte_1EBD5C5A7)
      {
        float v12 = [NSString stringWithFormat:@"bad input"];
        id v13 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
        unsigned int v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:]"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:706];

        id v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          float v21 = v12;
          _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

uint64_t __64__PLBasebandHardwareMessage_convertUint32ArrayToNSArray_ofSize___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A7 = result;
  return result;
}

- (id)convertUint64ArrayToNSArray:(unint64_t *)a3 ofSize:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 && a4)
  {
    uint64_t v7 = a4;
    do
    {
      uint64_t v8 = *a3++;
      uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v8];
      [v6 addObject:v9];

      --v7;
    }
    while (v7);
    id v10 = v6;
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v11 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__PLBasebandHardwareMessage_convertUint64ArrayToNSArray_ofSize___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v11;
      if (qword_1EBD5C630 != -1) {
        dispatch_once(&qword_1EBD5C630, block);
      }
      if (byte_1EBD5C5A8)
      {
        float v12 = [NSString stringWithFormat:@"bad input"];
        id v13 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m"];
        unsigned int v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PLBasebandHardwareMessage convertUint64ArrayToNSArray:ofSize:]"];
        [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:723];

        id v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          float v21 = v12;
          _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

uint64_t __64__PLBasebandHardwareMessage_convertUint64ArrayToNSArray_ofSize___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C5A8 = result;
  return result;
}

- (id)convertUint32ArrayToNSArray:(unsigned int *)a3 ofSize:(unsigned int)a4 andFill:(unsigned int)a5
{
  id v6 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:a3 ofSize:*(void *)&a4];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if (a5)
  {
    uint64_t v8 = a5;
    do
    {
      [v7 addObject:&unk_1F29E7C18];
      --v8;
    }
    while (v8);
  }
  return v7;
}

- (id)convertToObjectArrayPercentage:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [(PLBasebandHardwareMessage *)self convertToObjectArray:a3 ofSize:v4];
  unsigned int v9 = [(PLBasebandHardwareMessage *)self logDuration];
  if ((float)(100.0 / (float)v9) == INFINITY) {
    float v10 = 0.0;
  }
  else {
    float v10 = 100.0 / (float)v9;
  }
  if ([v8 count])
  {
    unint64_t v11 = 0;
    do
    {
      float v12 = [v8 objectAtIndexedSubscript:v11];
      [v12 floatValue];
      float v14 = v10 * v13;

      *(float *)&double v15 = v14;
      uint64_t v16 = [NSNumber numberWithFloat:v15];
      [v7 addObject:v16];

      ++v11;
    }
    while (v11 < [v8 count]);
  }

  return v7;
}

- (id)convertToObjectArray:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a4 <= 0x18)
  {
    __memcpy_chk();
    if (a4)
    {
      uint64_t v7 = a4;
      uint64_t v8 = (unsigned int *)&v12;
      do
      {
        unsigned int v9 = *v8++;
        float v10 = [NSNumber numberWithUnsignedInt:v9];
        [v5 addObject:v10];

        --v7;
      }
      while (v7);
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unsigned)sumHardwareStat:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  unsigned int result = 0;
  if (a4)
  {
    uint64_t v5 = a4;
    do
    {
      int v6 = *a3++;
      result += v6;
      --v5;
    }
    while (v5);
  }
  return result;
}

- (unsigned)logDuration
{
  return self->_duration;
}

- (void)setLogDuration:(unsigned int)a3
{
  self->_duration = a3;
}

- (_PLBasebandHWStatsHeader)header
{
  return self->_header;
}

- (void)setHeader:(_PLBasebandHWStatsHeader *)a3
{
  self->_header = a3;
}

- (_PLBasebandHWStatsSystem)system
{
  return self->_system;
}

- (void)setSystem:(_PLBasebandHWStatsSystem *)a3
{
  self->_system = a3;
}

- (_PLBasebandHWStatsARMPerf)armPerf
{
  return self->_armPerf;
}

- (void)setArmPerf:(_PLBasebandHWStatsARMPerf *)a3
{
  self->_armPerf = a3;
}

- (_PLBasebandHWStatsMDSP)mdsp
{
  return self->_mdsp;
}

- (void)setMdsp:(_PLBasebandHWStatsMDSP *)a3
{
  self->_mdsp = a3;
}

- (_PLBasebandHWOnOffComponentStats)mdm
{
  return self->_mdm;
}

- (void)setMdm:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_mdm = a3;
}

- (_PLBasebandHWStatsADSP)adsp
{
  return self->_adsp;
}

- (void)setAdsp:(_PLBasebandHWStatsADSP *)a3
{
  self->_adsp = a3;
}

- (_PLBasebandHWOnOffComponentStats)adm
{
  return self->_adm;
}

- (void)setAdm:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_adm = a3;
}

- (_PLBasebandHWOnOffComponentStats)gps
{
  return self->_gps;
}

- (void)setGps:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_gps = a3;
}

- (_PLBasebandHWOnOffComponentStats)usb
{
  return self->_usb;
}

- (void)setUsb:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_usb = a3;
}

- (_PLBasebandHWStatsUART)uart
{
  return self->_uart;
}

- (void)setUart:(_PLBasebandHWStatsUART *)a3
{
  self->_uart = a3;
}

- (_PLBasebandHWOnOffComponentStats)spi
{
  return self->_spi;
}

- (void)setSpi:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_spi = a3;
}

- (_PLBasebandHWStatsRXRSSI)rx
{
  return self->_rx;
}

- (void)setRx:(_PLBasebandHWStatsRXRSSI *)a3
{
  self->_rx = a3;
}

- (_PLBasebandHWStatsTXPower)tx
{
  return self->_tx;
}

- (void)setTx:(_PLBasebandHWStatsTXPower *)a3
{
  self->_tx = a3;
}

@end