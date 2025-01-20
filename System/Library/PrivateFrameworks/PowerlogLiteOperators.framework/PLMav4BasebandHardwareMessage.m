@interface PLMav4BasebandHardwareMessage
- (BOOL)parseData:(id)a3;
- (PLMav4BasebandHardwareMessage)initWithData:(id)a3;
- (_PLMav4BasebandHWOnOffComponentStats)adm;
- (_PLMav4BasebandHWOnOffComponentStats)gps;
- (_PLMav4BasebandHWOnOffComponentStats)mdm;
- (_PLMav4BasebandHWOnOffComponentStats)spi;
- (_PLMav4BasebandHWOnOffComponentStats)uart;
- (_PLMav4BasebandHWOnOffComponentStats)usb;
- (_PLMav4BasebandHWSleepVeto)sleep_arm;
- (_PLMav4BasebandHWSleepVeto)sleep_qdsp;
- (_PLMav4BasebandHWStatsARMPerf)armPerf;
- (_PLMav4BasebandHWStatsHeader)header;
- (_PLMav4BasebandHWStatsMDSP)mdsp;
- (_PLMav4BasebandHWStatsQDSP)qdsp;
- (_PLMav4BasebandHWStatsRX)rx;
- (_PLMav4BasebandHWStatsSystem)system;
- (_PLMav4BasebandHWStatsTX)tx;
- (id)indexToRAT:(unint64_t)a3;
- (unsigned)hw_rev;
- (unsigned)level;
- (unsigned)logDuration;
- (unsigned)sw_rev;
- (void)logHeaderWithLogger:(id)a3;
- (void)logModemAppWithLogger:(id)a3;
- (void)logPeripheralsWithLogger:(id)a3;
- (void)logProcessorWithLogger:(id)a3;
- (void)logRFWithLogger2:(id)a3;
- (void)logSleepWithLogger:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setAdm:(_PLMav4BasebandHWOnOffComponentStats *)a3;
- (void)setArmPerf:(_PLMav4BasebandHWStatsARMPerf *)a3;
- (void)setGps:(_PLMav4BasebandHWOnOffComponentStats *)a3;
- (void)setHeader:(_PLMav4BasebandHWStatsHeader *)a3;
- (void)setLogDuration:(unsigned int)a3;
- (void)setMdm:(_PLMav4BasebandHWOnOffComponentStats *)a3;
- (void)setMdsp:(_PLMav4BasebandHWStatsMDSP *)a3;
- (void)setQdsp:(_PLMav4BasebandHWStatsQDSP *)a3;
- (void)setRx:(_PLMav4BasebandHWStatsRX *)a3;
- (void)setSleep_arm:(_PLMav4BasebandHWSleepVeto *)a3;
- (void)setSleep_qdsp:(_PLMav4BasebandHWSleepVeto *)a3;
- (void)setSpi:(_PLMav4BasebandHWOnOffComponentStats *)a3;
- (void)setSystem:(_PLMav4BasebandHWStatsSystem *)a3;
- (void)setTx:(_PLMav4BasebandHWStatsTX *)a3;
- (void)setUart:(_PLMav4BasebandHWOnOffComponentStats *)a3;
- (void)setUsb:(_PLMav4BasebandHWOnOffComponentStats *)a3;
@end

@implementation PLMav4BasebandHardwareMessage

- (PLMav4BasebandHardwareMessage)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMav4BasebandHardwareMessage;
  v5 = [(PLBasebandHardwareMessage *)&v9 initWithData:v4];
  v6 = v5;
  if (!v5) {
    goto LABEL_3;
  }
  [(PLMav4BasebandHardwareMessage *)v5 setHeader:0];
  [(PLMav4BasebandHardwareMessage *)v6 setSystem:0];
  [(PLMav4BasebandHardwareMessage *)v6 setArmPerf:0];
  [(PLMav4BasebandHardwareMessage *)v6 setMdsp:0];
  [(PLMav4BasebandHardwareMessage *)v6 setMdm:0];
  [(PLMav4BasebandHardwareMessage *)v6 setQdsp:0];
  [(PLMav4BasebandHardwareMessage *)v6 setAdm:0];
  [(PLMav4BasebandHardwareMessage *)v6 setGps:0];
  [(PLMav4BasebandHardwareMessage *)v6 setUsb:0];
  [(PLMav4BasebandHardwareMessage *)v6 setUart:0];
  [(PLMav4BasebandHardwareMessage *)v6 setSpi:0];
  [(PLMav4BasebandHardwareMessage *)v6 setRx:0];
  [(PLMav4BasebandHardwareMessage *)v6 setTx:0];
  [(PLMav4BasebandHardwareMessage *)v6 setSleep_qdsp:0];
  [(PLMav4BasebandHardwareMessage *)v6 setSleep_arm:0];
  v7 = 0;
  if ([(PLMav4BasebandHardwareMessage *)v6 parseData:v4]) {
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
  [(PLMav4BasebandHardwareMessage *)self setHeader:v5 + 13];
  uint64_t v6 = v5 + 33;
  [(PLMav4BasebandHardwareMessage *)self setLogDuration:([(PLMav4BasebandHardwareMessage *)self header][16]- [(PLMav4BasebandHardwareMessage *)self header][12])];
  if ([(PLMav4BasebandHardwareMessage *)self level])
  {
    [(PLMav4BasebandHardwareMessage *)self setSystem:v5 + 33];
    uint64_t v6 = v5 + 45;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 4)
  {
    [(PLMav4BasebandHardwareMessage *)self setArmPerf:v6];
    v6 += 32;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 3)
  {
    [(PLMav4BasebandHardwareMessage *)self setMdsp:v6];
    [(PLMav4BasebandHardwareMessage *)self setMdm:v6 + 20];
    [(PLMav4BasebandHardwareMessage *)self setQdsp:v6 + 28];
    [(PLMav4BasebandHardwareMessage *)self setAdm:v6 + 48];
    [(PLMav4BasebandHardwareMessage *)self setGps:v6 + 56];
    [(PLMav4BasebandHardwareMessage *)self setUsb:v6 + 64];
    [(PLMav4BasebandHardwareMessage *)self setUart:v6 + 72];
    [(PLMav4BasebandHardwareMessage *)self setSpi:v6 + 80];
    v6 += 88;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 6)
  {
    [(PLMav4BasebandHardwareMessage *)self setRx:v6];
    [(PLMav4BasebandHardwareMessage *)self setTx:v6 + 600];
    [(PLMav4BasebandHardwareMessage *)self setSleep_qdsp:v6 + 840];
    [(PLMav4BasebandHardwareMessage *)self setSleep_arm:v6 + 892];
    v6 += 944;
  }
  id v7 = v4;
  unint64_t v8 = v6 - [v7 bytes];
  unint64_t v9 = [v7 length];
  if (v8 > v9)
  {
    v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = v7;
      int v13 = 134218498;
      uint64_t v14 = v6 - [v12 bytes];
      __int16 v15 = 2048;
      uint64_t v16 = [v12 length];
      __int16 v17 = 2080;
      v18 = "-[PLMav4BasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1D2690000, v10, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", (uint8_t *)&v13, 0x20u);
    }
  }
  return v8 <= v9;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PLMav4BasebandHardwareMessage;
  [(PLBasebandHardwareMessage *)&v25 logRawWithLogger:v4];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLMav4BasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C3E8 != -1) {
      dispatch_once(&qword_1EBD5C3E8, block);
    }
    if (_MergedGlobals_104)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav4BasebandHardwareMessage logWithLogger:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
      unint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:151];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = objc_alloc_init(PLBBMavLogMsg);
  int v13 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v12 setAgent:v13];

  [(PLBBMavLogMsg *)v12 setError:@"not set"];
  uint64_t v14 = [(PLBasebandMessage *)self seqNum];
  __int16 v15 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  [(PLMav4BasebandHardwareMessage *)self logHeaderWithLogger:v12];
  [(PLMav4BasebandHardwareMessage *)self logProcessorWithLogger:v12];
  [(PLMav4BasebandHardwareMessage *)self logModemAppWithLogger:v12];
  [(PLMav4BasebandHardwareMessage *)self logPeripheralsWithLogger:v12];
  if ([MEMORY[0x1E4F929C0] fullMode]) {
    [(PLMav4BasebandHardwareMessage *)self logSleepWithLogger:v4];
  }
  [(PLBBMavLogMsg *)v12 addToGroupPLBBMav4HwOther];
  [(PLMav4BasebandHardwareMessage *)self logRFWithLogger2:v12];
  [(PLBBMavLogMsg *)v12 logEventBackwardGrpEntriesBBMavHw];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__PLMav4BasebandHardwareMessage_logWithLogger___block_invoke_377;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v16;
    if (qword_1EBD5C3F0 != -1) {
      dispatch_once(&qword_1EBD5C3F0, v23);
    }
    if (byte_1EBD5C3D9)
    {
      __int16 v17 = [NSString stringWithFormat:@"Decoding Mav4 BB HW RF completed"];
      v18 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
      v20 = [v19 lastPathComponent];
      v21 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logWithLogger:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:177];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v17;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __47__PLMav4BasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_104 = result;
  return result;
}

uint64_t __47__PLMav4BasebandHardwareMessage_logWithLogger___block_invoke_377(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3D9 = result;
  return result;
}

- (void)logHeaderWithLogger:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C3F8 != -1) {
      dispatch_once(&qword_1EBD5C3F8, block);
    }
    if (byte_1EBD5C3DA)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav4BasebandHardwareMessage logHeaderWithLogger:]");
      id v7 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
      unint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logHeaderWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:182];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLMav4BasebandHardwareMessage *)self header])
  {
    int v13 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"));
    [v12 setBbSwRev:v13];

    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[PLMav4BasebandHardwareMessage hw_rev](self, "hw_rev"));
    [v12 setBbHwRev:v14];

    __int16 v15 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", (unsigned __int16)-[PLMav4BasebandHardwareMessage header](self, "header")[4]);
    [v12 setBbHwStatsType:v15];

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", (unsigned __int16)-[PLMav4BasebandHardwareMessage header](self, "header")[6]);
    [v12 setBbHwStatsLength:v16];

    __int16 v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage header](self, "header")[8]);
    [v12 setBbHwStatsLevel:v17];

    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage header](self, "header")[16]);
    [v12 setBbHwCurrTimeStamp:v18];

    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage header](self, "header")[12]);
    [v12 setBbHwLastTimeStamp:v19];

    v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", (-[PLMav4BasebandHardwareMessage header](self, "header")[16]- -[PLMav4BasebandHardwareMessage header](self, "header")[12]));
    [v12 setBbHwLogDurationInTicks:v20];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke_384;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v21;
      if (qword_1EBD5C400 != -1) {
        dispatch_once(&qword_1EBD5C400, v36);
      }
      if (byte_1EBD5C3DB)
      {
        v22 = [NSString stringWithFormat:@"BB HW: bad header"];
        v23 = (void *)MEMORY[0x1E4F929B8];
        v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
        objc_super v25 = [v24 lastPathComponent];
        v26 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logHeaderWithLogger:]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:199];

        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v22;
          _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v12 appendToError:@"Bad Header"];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v28 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke_393;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v28;
    if (qword_1EBD5C408 != -1) {
      dispatch_once(&qword_1EBD5C408, v35);
    }
    if (byte_1EBD5C3DC)
    {
      v29 = [NSString stringWithFormat:@"Decoded BB HW Log"];
      v30 = (void *)MEMORY[0x1E4F929B8];
      v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
      v32 = [v31 lastPathComponent];
      v33 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logHeaderWithLogger:]"];
      [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:203];

      v34 = PLLogCommon();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v29;
        _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3DA = result;
  return result;
}

uint64_t __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke_384(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3DB = result;
  return result;
}

uint64_t __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke_393(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3DC = result;
  return result;
}

- (void)logProcessorWithLogger:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLMav4BasebandHardwareMessage *)self system])
  {
    self->super.super.ticksInGoodState = [(PLMav4BasebandHardwareMessage *)self system][8];
    uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self system] ofSize:3];
    [v4 setBbHwProcSystemState:v5];
  }
  else
  {
    [v4 appendToError:@"System_State=<unknown>"];
  }
  if ([(PLMav4BasebandHardwareMessage *)self armPerf])
  {
    uint64_t v6 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self armPerf] ofSize:8];
    [v4 setBbHwProcArmPerfState:v6];
  }
  else
  {
    [v4 appendToError:@"ARM_Perf_Level=<unknown>"];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLMav4BasebandHardwareMessage_logProcessorWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1EBD5C410 != -1) {
      dispatch_once(&qword_1EBD5C410, block);
    }
    if (byte_1EBD5C3DD)
    {
      unint64_t v8 = [NSString stringWithFormat:@"Decoded BB HW Processor"];
      unint64_t v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
      v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logProcessorWithLogger:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:232];

      int v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __56__PLMav4BasebandHardwareMessage_logProcessorWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3DD = result;
  return result;
}

- (void)logModemAppWithLogger:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLMav4BasebandHardwareMessage *)self mdsp])
  {
    uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self mdsp] ofSize:5];
    [v4 setBbHwModemAppMdspSpeed:v5];
  }
  else
  {
    [v4 appendToError:@"Q6FW_Speed=<unknown>"];
  }
  if ([(PLMav4BasebandHardwareMessage *)self mdm])
  {
    uint64_t v6 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self mdm] ofSize:2];
    [v4 setBbHwModemAppMdmState:v6];
  }
  else
  {
    [v4 appendToError:@"MDM=<unknown>"];
  }
  if ([(PLMav4BasebandHardwareMessage *)self qdsp])
  {
    uint64_t v7 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self qdsp] ofSize:5];
    [v4 setBbHwModemAppQdspSpeed:v7];
  }
  else
  {
    [v4 appendToError:@"Q6SW_Speed=<unknown>"];
  }
  if ([(PLMav4BasebandHardwareMessage *)self adm])
  {
    unint64_t v8 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self adm] ofSize:2];
    [v4 setBbHwModemAppAdmState:v8];
  }
  else
  {
    [v4 appendToError:@"ADM=<unknown>"];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLMav4BasebandHardwareMessage_logModemAppWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5C418 != -1) {
      dispatch_once(&qword_1EBD5C418, block);
    }
    if (byte_1EBD5C3DE)
    {
      v10 = [NSString stringWithFormat:@"Decoded BB HW Modem/App"];
      v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
      int v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logModemAppWithLogger:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:278];

      __int16 v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __55__PLMav4BasebandHardwareMessage_logModemAppWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3DE = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLMav4BasebandHardwareMessage *)self gps])
  {
    uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self gps] ofSize:2];
    [v4 setBbHwPeripheralGPSState:v5];
  }
  else
  {
    [v4 appendToError:@"GPS=<unknown>"];
  }
  if ([(PLMav4BasebandHardwareMessage *)self usb])
  {
    uint64_t v6 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self usb] ofSize:2];
    [v4 setBbHwPeripheralUSBState:v6];
  }
  else
  {
    [v4 appendToError:@"USB=<unknown>"];
  }
  if ([(PLMav4BasebandHardwareMessage *)self spi])
  {
    uint64_t v7 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self spi] ofSize:2];
    [v4 setBbHwPeripheralSPIState:v7];
  }
  else
  {
    [v4 appendToError:@"SPI_Clock=<unknown>"];
  }
  if ([(PLMav4BasebandHardwareMessage *)self uart])
  {
    unint64_t v8 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self uart] ofSize:2];
    [v4 setBbHwPeripheralUARTState:v8];
  }
  else
  {
    [v4 appendToError:@"UART_Clock=<unknown>"];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLMav4BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5C420 != -1) {
      dispatch_once(&qword_1EBD5C420, block);
    }
    if (byte_1EBD5C3DF)
    {
      v10 = [NSString stringWithFormat:@"Decoded BB HW Peripherals"];
      v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
      int v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:325];

      __int16 v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __58__PLMav4BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3DF = result;
  return result;
}

- (void)logRFWithLogger2:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke;
    v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v61[4] = v5;
    if (qword_1EBD5C428 != -1) {
      dispatch_once(&qword_1EBD5C428, v61);
    }
    if (byte_1EBD5C3E0)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav4BasebandHardwareMessage logRFWithLogger2:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
      uint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logRFWithLogger2:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:330];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v55 = v4;
  id v12 = objc_alloc_init(PLBBMavLogMsg);
  int v13 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v12 setAgent:v13];

  [(PLBBMavLogMsg *)v12 setError:&stru_1F294E108];
  uint64_t v14 = [(PLBasebandMessage *)self seqNum];
  __int16 v15 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  v54 = self;
  if (![(PLMav4BasebandHardwareMessage *)self rx] || ![(PLMav4BasebandHardwareMessage *)self tx])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_441;
      v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v60[4] = v16;
      if (qword_1EBD5C430 != -1) {
        dispatch_once(&qword_1EBD5C430, v60);
      }
      if (byte_1EBD5C3E1)
      {
        uint64_t v17 = [NSString stringWithFormat:@"Error: BB HW RF <RAT> is expected but not present"];
        v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
        v20 = [v19 lastPathComponent];
        uint64_t v21 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logRFWithLogger2:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:343];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        self = v54;
      }
    }
    [(PLBBMavLogMsg *)v12 appendToError:@"Error: BB HW RF <RAT> is expected but not present"];
    [(PLBBMavLogMsg *)v12 logEventBackwardMavBBHwOtherPerRAT];
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  for (uint64_t i = 340; i != 600; i += 52)
  {
    v27 = [(PLMav4BasebandHardwareMessage *)self indexToRAT:v25];
    if ([v27 length])
    {
      [(PLBBMavLogMsg *)v12 setRat:v27];
      uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
      [(PLBBMavLogMsg *)v12 setLogDuration:v28];

      v29 = [NSNumber numberWithInt:v25];
      [(PLBBMavLogMsg *)v12 setRadioTech:v29];

      v30 = NSNumber;
      v56 = v27;
      int v31 = (int)[(PLMav4BasebandHardwareMessage *)self header][16];
      uint64_t v32 = (v31 - [(PLMav4BasebandHardwareMessage *)self header][12]);
      v27 = v56;
      v33 = [v30 numberWithUnsignedInt:v32];
      [(PLBBMavLogMsg *)v12 setBbHwLogDurationInTicks:v33];

      v34 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self rx] + v23 ofSize:4];
      [(PLBBMavLogMsg *)v12 setRssiModeCount:v34];

      v35 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self rx] + i - 260 ofSize:13];
      [(PLBBMavLogMsg *)v12 setRx0RssiPowerHist:v35];

      v36 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self rx] + i ofSize:13];
      [(PLBBMavLogMsg *)v12 setRx1RssiPowerHist:v36];

      v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
      [(PLBBMavLogMsg *)v12 setLogDuration:v37];

      [(PLBBMavLogMsg *)v12 setRat:v56];
      if (i == 548) {
        objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, &unk_1F29E6F40, 0);
      }
      else {
      v45 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self tx] + v24 ofSize:12];
      }
      [(PLBBMavLogMsg *)v12 setTxPowerHist:v45];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v46 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_455;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v46;
        if (qword_1EBD5C440 != -1) {
          dispatch_once(&qword_1EBD5C440, block);
        }
        if (byte_1EBD5C3E3)
        {
          v47 = [NSString stringWithFormat:@"Decoded Mav4 BB HW RF %@", v56];
          v48 = (void *)MEMORY[0x1E4F929B8];
          v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
          v50 = [v49 lastPathComponent];
          v51 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logRFWithLogger2:]"];
          [v48 logMessage:v47 fromFile:v50 fromFunction:v51 fromLineNumber:399];

          v52 = PLLogCommon();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v47;
            _os_log_debug_impl(&dword_1D2690000, v52, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          self = v54;
          v27 = v56;
        }
      }
      v39 = [(PLBBMavLogMsg *)v12 logEventBackwardGrpEntriesBBMavHwOtherPerRAT];
      v44 = [v39 objectForKey:@"entry"];
      v53 = [v39 objectForKey:@"name"];
      [v55 addToGroupPLBBMavHwEntry:v44 withEntryKey:v53];

LABEL_38:
      goto LABEL_39;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v38 = objc_opt_class();
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_447;
      v59[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v59[4] = v38;
      if (qword_1EBD5C438 != -1) {
        dispatch_once(&qword_1EBD5C438, v59);
      }
      if (byte_1EBD5C3E2)
      {
        v57 = v27;
        v39 = [NSString stringWithFormat:@"Error: RAT unknown, cannot record"];
        uint64_t v40 = (void *)MEMORY[0x1E4F929B8];
        v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m"];
        v42 = [v41 lastPathComponent];
        v43 = [NSString stringWithUTF8String:"-[PLMav4BasebandHardwareMessage logRFWithLogger2:]"];
        [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:356];

        v44 = PLLogCommon();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v39;
          _os_log_debug_impl(&dword_1D2690000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        self = v54;
        v27 = v57;
        goto LABEL_38;
      }
    }
LABEL_39:

    ++v25;
    v24 += 48;
    v23 += 16;
  }
}

uint64_t __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3E0 = result;
  return result;
}

uint64_t __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_441(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3E1 = result;
  return result;
}

uint64_t __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_447(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3E2 = result;
  return result;
}

uint64_t __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_455(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3E3 = result;
  return result;
}

- (void)logSleepWithLogger:(id)a3
{
  id v8 = a3;
  if ([(PLMav4BasebandHardwareMessage *)self sleep_qdsp])
  {
    for (uint64_t i = 0; i != 52; i += 13)
    {
      if ([(PLMav4BasebandHardwareMessage *)self sleep_qdsp])
      {
        uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint8ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self sleep_qdsp] + i ofSize:13];
        [v8 setBbHwSleepVetoClientListQdsp:v5];
      }
    }
  }
  [v8 setType:@"BB HW Sleep Veto QDSP"];
  if ([(PLMav4BasebandHardwareMessage *)self sleep_arm])
  {
    for (uint64_t j = 0; j != 52; j += 13)
    {
      uint64_t v7 = [(PLBasebandHardwareMessage *)self convertUint8ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self sleep_arm] + j ofSize:13];
      [v8 setBbHwSleepVetoClientListQdsp:v7];
    }
  }
  [v8 setType:@"BB HW Sleep Veto ARM"];
}

- (unsigned)hw_rev
{
  return (unsigned __int16)[(PLMav4BasebandHardwareMessage *)self header][2];
}

- (unsigned)sw_rev
{
  return *(_WORD *)[(PLMav4BasebandHardwareMessage *)self header];
}

- (unsigned)level
{
  return [(PLMav4BasebandHardwareMessage *)self header][8];
}

- (id)indexToRAT:(unint64_t)a3
{
  if (a3 > 4)
  {
    id v4 = &stru_1F294E108;
  }
  else
  {
    id v4 = *off_1E6930870[a3];
  }
  return v4;
}

- (unsigned)logDuration
{
  return self->_mav4_duration;
}

- (void)setLogDuration:(unsigned int)a3
{
  self->_mav4_duration = a3;
}

- (_PLMav4BasebandHWStatsHeader)header
{
  return self->_mav4_header;
}

- (void)setHeader:(_PLMav4BasebandHWStatsHeader *)a3
{
  self->_mav4_header = a3;
}

- (_PLMav4BasebandHWStatsSystem)system
{
  return self->_mav4_system;
}

- (void)setSystem:(_PLMav4BasebandHWStatsSystem *)a3
{
  self->_mav4_system = a3;
}

- (_PLMav4BasebandHWStatsARMPerf)armPerf
{
  return self->_mav4_armPerf;
}

- (void)setArmPerf:(_PLMav4BasebandHWStatsARMPerf *)a3
{
  self->_mav4_armPerf = a3;
}

- (_PLMav4BasebandHWStatsMDSP)mdsp
{
  return self->_mav4_mdsp;
}

- (void)setMdsp:(_PLMav4BasebandHWStatsMDSP *)a3
{
  self->_mav4_mdsp = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)mdm
{
  return self->_mav4_mdm;
}

- (void)setMdm:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_mdm = a3;
}

- (_PLMav4BasebandHWStatsQDSP)qdsp
{
  return self->_mav4_qdsp;
}

- (void)setQdsp:(_PLMav4BasebandHWStatsQDSP *)a3
{
  self->_mav4_qdsp = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)adm
{
  return self->_mav4_adm;
}

- (void)setAdm:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_adm = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)gps
{
  return self->_mav4_gps;
}

- (void)setGps:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_gps = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)usb
{
  return self->_mav4_usb;
}

- (void)setUsb:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_usb = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)uart
{
  return self->_mav4_uart;
}

- (void)setUart:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_uart = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)spi
{
  return self->_mav4_spi;
}

- (void)setSpi:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_spuint64_t i = a3;
}

- (_PLMav4BasebandHWStatsRX)rx
{
  return self->_mav4_rx;
}

- (void)setRx:(_PLMav4BasebandHWStatsRX *)a3
{
  self->_mav4_rx = a3;
}

- (_PLMav4BasebandHWStatsTX)tx
{
  return self->_mav4_tx;
}

- (void)setTx:(_PLMav4BasebandHWStatsTX *)a3
{
  self->_mav4_tx = a3;
}

- (_PLMav4BasebandHWSleepVeto)sleep_qdsp
{
  return self->_mav4_sleep_qdsp;
}

- (void)setSleep_qdsp:(_PLMav4BasebandHWSleepVeto *)a3
{
  self->_mav4_sleep_qdsp = a3;
}

- (_PLMav4BasebandHWSleepVeto)sleep_arm
{
  return self->_mav4_sleep_arm;
}

- (void)setSleep_arm:(_PLMav4BasebandHWSleepVeto *)a3
{
  self->_mav4_sleep_arm = a3;
}

@end