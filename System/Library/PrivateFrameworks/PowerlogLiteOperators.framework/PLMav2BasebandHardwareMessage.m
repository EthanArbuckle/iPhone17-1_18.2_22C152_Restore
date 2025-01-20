@interface PLMav2BasebandHardwareMessage
- (BOOL)parseData:(id)a3;
- (PLMav2BasebandHardwareMessage)initWithData:(id)a3;
- (_PLMav2BasebandHWStatsRX)rx;
- (_PLMav2BasebandHWStatsTX)tx;
- (id)indexToRAT:(unint64_t)a3;
- (void)logHeaderWithLogger:(id)a3;
- (void)logRFWithLogger2:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setRx:(_PLMav2BasebandHWStatsRX *)a3;
- (void)setTx:(_PLMav2BasebandHWStatsTX *)a3;
@end

@implementation PLMav2BasebandHardwareMessage

- (PLMav2BasebandHardwareMessage)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMav2BasebandHardwareMessage;
  v5 = [(PLBasebandHardwareMessage *)&v9 initWithData:v4];
  v6 = v5;
  if (!v5
    || ([(PLMav2BasebandHardwareMessage *)v5 setRx:0],
        [(PLMav2BasebandHardwareMessage *)v6 setTx:0],
        v7 = 0,
        [(PLMav2BasebandHardwareMessage *)v6 parseData:v4]))
  {
    v7 = v6;
  }

  return v7;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  self->super._header = (_PLBasebandHWStatsHeader *)(v5 + 13);
  if ([(PLBasebandHardwareMessage *)self revision] <= 2)
  {
    uint64_t v6 = v5 + 29;
    [(PLBasebandHardwareMessage *)self setLogDuration:self->super._header->var3 - self->super._header->var2];
    if (self->super._header->var1)
    {
      self->super._system = (_PLBasebandHWStatsSystem *)v6;
      uint64_t v6 = v5 + 49;
      unsigned int var1 = self->super._header->var1;
      if (var1 >= 4)
      {
        self->super._armPerf = (_PLBasebandHWStatsARMPerf *)v6;
        uint64_t v6 = v5 + 89;
        unsigned int var1 = self->super._header->var1;
      }
      if (var1 >= 3)
      {
        self->super._mdsp = (_PLBasebandHWStatsMDSP *)v6;
        self->super._mdm = (_PLBasebandHWOnOffComponentStats *)(v6 + 60);
        self->super._adsp = (_PLBasebandHWStatsADSP *)(v6 + 76);
        self->super._adm = (_PLBasebandHWOnOffComponentStats *)(v6 + 136);
        self->super._gps = (_PLBasebandHWOnOffComponentStats *)(v6 + 152);
        self->super._usb = (_PLBasebandHWOnOffComponentStats *)(v6 + 168);
        self->super._uart = (_PLBasebandHWStatsUART *)(v6 + 184);
        self->super._spi = (_PLBasebandHWOnOffComponentStats *)(v6 + 216);
        if (self->super._header->var1 < 6)
        {
          v6 += 232;
        }
        else
        {
          [(PLMav2BasebandHardwareMessage *)self setRx:v6 + 232];
          [(PLMav2BasebandHardwareMessage *)self setTx:v6 + 832];
          v6 += 1072;
        }
      }
    }
    id v8 = v4;
    unint64_t v9 = v6 - [v8 bytes];
    if (v9 <= [v8 length])
    {
      BOOL v11 = 1;
      goto LABEL_15;
    }
    v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = v8;
      int v14 = 134218498;
      uint64_t v15 = v6 - [v13 bytes];
      __int16 v16 = 2048;
      uint64_t v17 = [v13 length];
      __int16 v18 = 2080;
      v19 = "-[PLMav2BasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1D2690000, v10, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", (uint8_t *)&v14, 0x20u);
    }
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PLMav2BasebandHardwareMessage;
  [(PLBasebandHardwareMessage *)&v24 logRawWithLogger:a3];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLMav2BasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD5BC20 != -1) {
      dispatch_once(&qword_1EBD5BC20, block);
    }
    if (_MergedGlobals_82)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav2BasebandHardwareMessage logWithLogger:]");
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m"];
      id v8 = [v7 lastPathComponent];
      unint64_t v9 = [NSString stringWithUTF8String:"-[PLMav2BasebandHardwareMessage logWithLogger:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:114];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  BOOL v11 = objc_alloc_init(PLBBMavLogMsg);
  v12 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v11 setAgent:v12];

  [(PLBBMavLogMsg *)v11 setError:&stru_1F294E108];
  id v13 = [(PLBasebandMessage *)self seqNum];
  int v14 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v11, "setHeaderWithSeqNum:andDate:andTimeCal:", v13, v14);

  [(PLMav2BasebandHardwareMessage *)self logHeaderWithLogger:v11];
  [(PLBasebandHardwareMessage *)self logProcessorWithLogger:v11];
  [(PLBasebandHardwareMessage *)self logModemAppWithLogger:v11];
  [(PLBasebandHardwareMessage *)self logPeripheralsWithLogger:v11];
  [(PLBBMavLogMsg *)v11 addToGroupPLBBMav2HwOther];
  [(PLMav2BasebandHardwareMessage *)self logRFWithLogger2:v11];
  [(PLBBMavLogMsg *)v11 logEventBackwardGrpEntriesBBMavHw];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__PLMav2BasebandHardwareMessage_logWithLogger___block_invoke_377;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = v15;
    if (qword_1EBD5BC28 != -1) {
      dispatch_once(&qword_1EBD5BC28, v22);
    }
    if (byte_1EBD5BC19)
    {
      __int16 v16 = [NSString stringWithFormat:@"Decoding BB HW RF completed"];
      uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
      __int16 v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m"];
      v19 = [v18 lastPathComponent];
      uint64_t v20 = [NSString stringWithUTF8String:"-[PLMav2BasebandHardwareMessage logWithLogger:]"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:136];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __47__PLMav2BasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_82 = result;
  return result;
}

uint64_t __47__PLMav2BasebandHardwareMessage_logWithLogger___block_invoke_377(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC19 = result;
  return result;
}

- (void)logHeaderWithLogger:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLMav2BasebandHardwareMessage;
  [(PLBasebandHardwareMessage *)&v22 logHeaderWithLogger:v4];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __53__PLMav2BasebandHardwareMessage_logHeaderWithLogger___block_invoke;
    uint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v5;
    if (qword_1EBD5BC30 != -1) {
      dispatch_once(&qword_1EBD5BC30, &block);
    }
    if (byte_1EBD5BC1A)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav2BasebandHardwareMessage logHeaderWithLogger:]", block, v18, v19, v20, v21);
      v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m"];
      unint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav2BasebandHardwareMessage logHeaderWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:143];

      BOOL v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v24 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  header = self->super._header;
  if (header)
  {
    int v14 = [NSNumber numberWithUnsignedInt:header->var3];
    [v12 setBbHwCurrTimeStamp:v14];

    uint64_t v15 = [NSNumber numberWithUnsignedInt:self->super._header->var2];
    [v12 setBbHwLastTimeStamp:v15];

    __int16 v16 = [NSNumber numberWithUnsignedInt:self->super._header->var3 - self->super._header->var2];
    [v12 setBbHwLogDurationInTicks:v16];
  }
}

uint64_t __53__PLMav2BasebandHardwareMessage_logHeaderWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC1A = result;
  return result;
}

- (void)logRFWithLogger2:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v5;
    if (qword_1EBD5BC38 != -1) {
      dispatch_once(&qword_1EBD5BC38, v48);
    }
    if (byte_1EBD5BC1B)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav2BasebandHardwareMessage logRFWithLogger2:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m"];
      unint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav2BasebandHardwareMessage logRFWithLogger2:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:155];

      BOOL v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  id v13 = objc_opt_new();
  int v14 = [(PLBasebandMessage *)self agent];
  [v13 setAgent:v14];

  [v13 setError:&stru_1F294E108];
  uint64_t v15 = [(PLBasebandMessage *)self seqNum];
  __int16 v16 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  v45 = v13;
  objc_msgSend(v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  if ([(PLMav2BasebandHardwareMessage *)self rx] && [(PLMav2BasebandHardwareMessage *)self tx])
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 80;
    id v43 = v12;
    while (1)
    {
      uint64_t v21 = [(PLMav2BasebandHardwareMessage *)self indexToRAT:v19];
      if ([v21 length])
      {
        [v45 setRat:v21];
        objc_super v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBasebandHardwareMessage logDuration](self, "logDuration"));
        [v45 setLogDuration:v22];

        v23 = [NSNumber numberWithInt:v19];
        [v45 setRadioTech:v23];

        objc_super v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBasebandHardwareMessage logDuration](self, "logDuration"));
        [v45 setBbHwLogDurationInTicks:v24];

        uint64_t v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav2BasebandHardwareMessage *)self rx] + v17 ofSize:4];
        [v45 setRssiModeCount:v25];

        v26 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav2BasebandHardwareMessage *)self rx] + v20 ofSize:13];
        [v45 setRx0RssiPowerHist:v26];

        uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav2BasebandHardwareMessage *)self rx] + v20 + 260 ofSize:13];
        [v45 setRx1RssiPowerHist:v27];

        v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav2BasebandHardwareMessage *)self tx] + v18 ofSize:12];
        [v45 setTxPowerHist:v28];

        v29 = [v45 logEventBackwardGrpEntriesBBMavHwOtherPerRAT];
        v30 = [v29 objectForKey:@"entry"];
        v31 = [v29 objectForKey:@"name"];
        [v12 addToGroupPLBBMavHwEntry:v30 withEntryKey:v31];
      }
      else
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_21;
        }
        uint64_t v32 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke_392;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v32;
        if (qword_1EBD5BC48 != -1) {
          dispatch_once(&qword_1EBD5BC48, block);
        }
        if (!byte_1EBD5BC1D) {
          goto LABEL_21;
        }
        v29 = [NSString stringWithFormat:@"Error: RAT unknown, cannot record"];
        v44 = (void *)MEMORY[0x1E4F929B8];
        v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m"];
        v34 = [v33 lastPathComponent];
        v35 = [NSString stringWithUTF8String:"-[PLMav2BasebandHardwareMessage logRFWithLogger2:]"];
        [v44 logMessage:v29 fromFile:v34 fromFunction:v35 fromLineNumber:179];

        v30 = PLLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v29;
          _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        id v12 = v43;
      }

LABEL_21:
      ++v19;
      v20 += 52;
      v18 += 48;
      v17 += 16;
      if (v20 == 340) {
        goto LABEL_31;
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v36 = objc_opt_class();
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke_386;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v36;
    if (qword_1EBD5BC40 != -1) {
      dispatch_once(&qword_1EBD5BC40, v47);
    }
    if (byte_1EBD5BC1C)
    {
      v37 = [NSString stringWithFormat:@"Error: BB HW RF <RAT> is expected but not present"];
      v38 = (void *)MEMORY[0x1E4F929B8];
      v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m"];
      v40 = [v39 lastPathComponent];
      v41 = [NSString stringWithUTF8String:"-[PLMav2BasebandHardwareMessage logRFWithLogger2:]"];
      [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:168];

      v42 = PLLogCommon();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v37;
        _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [v13 appendToError:@"Error: BB HW RF <RAT> is expected but not present"];
  [v13 logEventBackwardMavBBHwOtherPerRAT];
LABEL_31:
}

uint64_t __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC1B = result;
  return result;
}

uint64_t __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke_386(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC1C = result;
  return result;
}

uint64_t __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke_392(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BC1D = result;
  return result;
}

- (id)indexToRAT:(unint64_t)a3
{
  v3 = @"NONE";
  switch(a3)
  {
    case 0uLL:
      id v4 = kPLGSM;
      goto LABEL_7;
    case 1uLL:
      id v4 = kPLCDMA2K;
      goto LABEL_7;
    case 2uLL:
      id v4 = kPL1xEVDO;
      goto LABEL_7;
    case 3uLL:
      id v4 = kPLWCDMA;
LABEL_7:
      v3 = *v4;
      break;
    case 4uLL:
      break;
    default:
      v3 = @"Unknown";
      break;
  }
  return v3;
}

- (_PLMav2BasebandHWStatsRX)rx
{
  return self->_mav2_rx;
}

- (void)setRx:(_PLMav2BasebandHWStatsRX *)a3
{
  self->_mav2_rx = a3;
}

- (_PLMav2BasebandHWStatsTX)tx
{
  return self->_mav2_tx;
}

- (void)setTx:(_PLMav2BasebandHWStatsTX *)a3
{
  self->_mav2_tx = a3;
}

@end