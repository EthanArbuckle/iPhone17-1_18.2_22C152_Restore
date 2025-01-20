@interface PLMav5BasebandHardwareMessage
- (BOOL)parseData:(id)a3;
- (PLMav5BasebandHardwareMessage)initWithData:(id)a3;
- (_PLMav4BasebandHWOnOffComponentStats)gps_dpo;
- (_PLMav4BasebandHWOnOffComponentStats)lpass;
- (_PLMav5BasebandHWAPPSSleepVeto)apps_sleep_veto;
- (_PLMav5BasebandHWClocksDuration)clock;
- (_PLMav5BasebandHWMPSSSleepVeto)mpss_sleep_veto;
- (_PLMav5BasebandHWStatsAPPSPerf)apps;
- (_PLMav5BasebandHWStatsMDSP)mdsp;
- (_PLMav5BasebandHWStatsProtocol)protocol;
- (_PLMav5BasebandHWStatsQDSP)qdsp;
- (_PLMav5BasebandHWStatsRPM)rpm;
- (_PLMav5BasebandHWStatsRX)rx;
- (_PLMav5BasebandHWStatsRXSQA)rx_sqa;
- (_PLMav5BasebandHWStatsSleep)apps_sleep;
- (_PLMav5BasebandHWStatsSleep)mpss_sleep;
- (_PLMav5BasebandHWStatsTX)tx;
- (_PLMav5BasebandHWStatsUSB)usb;
- (id)indexToRAT:(unint64_t)a3;
- (void)formatDurationandCount:(unsigned int)a3 withCount:(unsigned int)a4 inString:(id)a5;
- (void)logAPPSWithLogger:(id)a3;
- (void)logClockWithLogger:(id)a3;
- (void)logLPASSWithLogger:(id)a3;
- (void)logModemAppWithLogger:(id)a3;
- (void)logPeripheralsWithLogger:(id)a3;
- (void)logProtocolWithLogger:(id)a3 withCount:(unsigned int)a4;
- (void)logRFWithLogger2:(id)a3;
- (void)logRPMWithLogger:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setApps:(_PLMav5BasebandHWStatsAPPSPerf *)a3;
- (void)setApps_sleep:(_PLMav5BasebandHWStatsSleep *)a3;
- (void)setApps_sleep_veto:(_PLMav5BasebandHWAPPSSleepVeto *)a3;
- (void)setClock:(_PLMav5BasebandHWClocksDuration *)a3;
- (void)setGps_dpo:(_PLMav4BasebandHWOnOffComponentStats *)a3;
- (void)setLpass:(_PLMav4BasebandHWOnOffComponentStats *)a3;
- (void)setMdsp:(_PLMav5BasebandHWStatsMDSP *)a3;
- (void)setMpss_sleep:(_PLMav5BasebandHWStatsSleep *)a3;
- (void)setMpss_sleep_veto:(_PLMav5BasebandHWMPSSSleepVeto *)a3;
- (void)setProtocol:(_PLMav5BasebandHWStatsProtocol *)a3;
- (void)setQdsp:(_PLMav5BasebandHWStatsQDSP *)a3;
- (void)setRpm:(_PLMav5BasebandHWStatsRPM *)a3;
- (void)setRx:(_PLMav5BasebandHWStatsRX *)a3;
- (void)setRx_sqa:(_PLMav5BasebandHWStatsRXSQA *)a3;
- (void)setTx:(_PLMav5BasebandHWStatsTX *)a3;
- (void)setUsb:(_PLMav5BasebandHWStatsUSB *)a3;
@end

@implementation PLMav5BasebandHardwareMessage

- (PLMav5BasebandHardwareMessage)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMav5BasebandHardwareMessage;
  v5 = [(PLMav4BasebandHardwareMessage *)&v9 initWithData:v4];
  v6 = v5;
  if (!v5) {
    goto LABEL_3;
  }
  [(PLMav5BasebandHardwareMessage *)v5 setRpm:0];
  [(PLMav5BasebandHardwareMessage *)v6 setApps:0];
  [(PLMav5BasebandHardwareMessage *)v6 setApps_sleep:0];
  [(PLMav5BasebandHardwareMessage *)v6 setApps_sleep_veto:0];
  [(PLMav5BasebandHardwareMessage *)v6 setLpass:0];
  [(PLMav5BasebandHardwareMessage *)v6 setMdsp:0];
  [(PLMav5BasebandHardwareMessage *)v6 setQdsp:0];
  [(PLMav5BasebandHardwareMessage *)v6 setMpss_sleep:0];
  [(PLMav5BasebandHardwareMessage *)v6 setMpss_sleep_veto:0];
  [(PLMav5BasebandHardwareMessage *)v6 setUsb:0];
  [(PLMav5BasebandHardwareMessage *)v6 setGps_dpo:0];
  [(PLMav5BasebandHardwareMessage *)v6 setRx:0];
  [(PLMav5BasebandHardwareMessage *)v6 setRx_sqa:0];
  [(PLMav5BasebandHardwareMessage *)v6 setTx:0];
  [(PLMav5BasebandHardwareMessage *)v6 setProtocol:0];
  [(PLMav5BasebandHardwareMessage *)v6 setClock:0];
  v7 = 0;
  if ([(PLMav5BasebandHardwareMessage *)v6 parseData:v4]) {
LABEL_3:
  }
    v7 = v6;

  return v7;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (unsigned __int8 *)[v4 bytes];
  v6 = &v5[2 * (*v5 == 129)];
  [(PLMav4BasebandHardwareMessage *)self setHeader:v6 + 13];
  v7 = v6 + 33;
  [(PLMav4BasebandHardwareMessage *)self setLogDuration:([(PLMav4BasebandHardwareMessage *)self header][16]- [(PLMav4BasebandHardwareMessage *)self header][12])];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __43__PLMav5BasebandHardwareMessage_parseData___block_invoke;
    v28 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v29 = v8;
    if (qword_1EBD5C178 != -1) {
      dispatch_once(&qword_1EBD5C178, &block);
    }
    if (_MergedGlobals_96)
    {
      objc_super v9 = NSString;
      uint64_t v10 = [(PLMav4BasebandHardwareMessage *)self logDuration];
      objc_msgSend(v9, "stringWithFormat:", @"Mav5 hw log duration set as %u", v10, block, v26, v27, v28, v29);
      v11 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage parseData:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:98];

      v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level])
  {
    [(PLMav5BasebandHardwareMessage *)self setRpm:v6 + 33];
    v7 = v6 + 49;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 2)
  {
    [(PLMav5BasebandHardwareMessage *)self setApps:v7];
    [(PLMav5BasebandHardwareMessage *)self setApps_sleep:v7 + 24];
    v7 += 32;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 3)
  {
    [(PLMav5BasebandHardwareMessage *)self setUsb:v7];
    [(PLMav4BasebandHardwareMessage *)self setUart:v7 + 12];
    [(PLMav4BasebandHardwareMessage *)self setSpi:v7 + 20];
    [(PLMav4BasebandHardwareMessage *)self setAdm:v7 + 28];
    v7 += 36;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 4)
  {
    [(PLMav5BasebandHardwareMessage *)self setLpass:v7];
    v7 += 8;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 5)
  {
    [(PLMav5BasebandHardwareMessage *)self setApps_sleep_veto:v7];
    [(PLMav5BasebandHardwareMessage *)self setMpss_sleep_veto:v7 + 4];
    [(PLMav5BasebandHardwareMessage *)self setMdsp:v7 + 16];
    [(PLMav5BasebandHardwareMessage *)self setQdsp:v7 + 56];
    [(PLMav4BasebandHardwareMessage *)self setGps:v7 + 96];
    [(PLMav5BasebandHardwareMessage *)self setGps_dpo:v7 + 104];
    [(PLMav5BasebandHardwareMessage *)self setMpss_sleep:v7 + 112];
    v7 += 120;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 6)
  {
    [(PLMav5BasebandHardwareMessage *)self setRx:v7];
    [(PLMav5BasebandHardwareMessage *)self setTx:v7 + 600];
    [(PLMav5BasebandHardwareMessage *)self setRx_sqa:v7 + 840];
    [(PLMav5BasebandHardwareMessage *)self setProtocol:v7 + 1280];
    v7 += 1600;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
  {
    [(PLMav5BasebandHardwareMessage *)self setClock:v7];
    v7 += 836;
  }
  id v17 = v4;
  unint64_t v18 = (unint64_t)&v7[-[v17 bytes]];
  unint64_t v19 = [v17 length];
  if (v18 > v19)
  {
    v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v22 = v17;
      v23 = &v7[-[v22 bytes]];
      uint64_t v24 = [v22 length];
      *(_DWORD *)buf = 134218498;
      v31 = v23;
      __int16 v32 = 2048;
      uint64_t v33 = v24;
      __int16 v34 = 2080;
      v35 = "-[PLMav5BasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1D2690000, v20, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
  }
  return v18 <= v19;
}

uint64_t __43__PLMav5BasebandHardwareMessage_parseData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_96 = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PLMav5BasebandHardwareMessage;
  [(PLBasebandHardwareMessage *)&v25 logRawWithLogger:v4];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLMav5BasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C180 != -1) {
      dispatch_once(&qword_1EBD5C180, block);
    }
    if (byte_1EBD5C151)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav5BasebandHardwareMessage logWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:205];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v12 = objc_alloc_init(PLBBMavLogMsg);
  v13 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v12 setAgent:v13];

  [(PLBBMavLogMsg *)v12 setError:@"not set"];
  v14 = [(PLBasebandMessage *)self seqNum];
  v15 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  if ([(PLMav4BasebandHardwareMessage *)self sw_rev] != 4)
  {
    id v17 = [MEMORY[0x1E4F28E78] string];
    objc_msgSend(v17, "appendFormat:", @" Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 4);
    [(PLBBMavLogMsg *)v12 setError:v17];
    [(PLBBMavLogMsg *)v12 setType:@"BB HW Error"];
    [(PLBBMavLogMsg *)v12 logEventBackwardMavBBHwOther];
LABEL_19:

    goto LABEL_20;
  }
  [(PLMav4BasebandHardwareMessage *)self logHeaderWithLogger:v12];
  [(PLMav5BasebandHardwareMessage *)self logRPMWithLogger:v12];
  [(PLMav5BasebandHardwareMessage *)self logAPPSWithLogger:v12];
  [(PLMav5BasebandHardwareMessage *)self logLPASSWithLogger:v12];
  [(PLMav5BasebandHardwareMessage *)self logModemAppWithLogger:v4];
  [(PLMav5BasebandHardwareMessage *)self logPeripheralsWithLogger:v12];
  [(PLMav5BasebandHardwareMessage *)self logProtocolWithLogger:v12 withCount:5];
  if ([MEMORY[0x1E4F929C0] fullMode]) {
    [(PLMav5BasebandHardwareMessage *)self logClockWithLogger:v4];
  }
  [(PLBBMavLogMsg *)v12 addToGroupPLBBMavHwOther];
  [(PLMav5BasebandHardwareMessage *)self logRFWithLogger2:v12];
  [(PLBBMavLogMsg *)v12 logEventBackwardGrpEntriesBBMavHw];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__PLMav5BasebandHardwareMessage_logWithLogger___block_invoke_387;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v16;
    if (qword_1EBD5C188 != -1) {
      dispatch_once(&qword_1EBD5C188, v23);
    }
    if (byte_1EBD5C152)
    {
      id v17 = [NSString stringWithFormat:@"Decoding BB HW RF completed"];
      unint64_t v18 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      v20 = [v19 lastPathComponent];
      v21 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logWithLogger:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:250];

      id v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v17;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_19;
    }
  }
LABEL_20:
}

uint64_t __47__PLMav5BasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C151 = result;
  return result;
}

uint64_t __47__PLMav5BasebandHardwareMessage_logWithLogger___block_invoke_387(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C152 = result;
  return result;
}

- (void)logRPMWithLogger:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C190 != -1) {
      dispatch_once(&qword_1EBD5C190, block);
    }
    if (byte_1EBD5C153)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav5BasebandHardwareMessage logRPMWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logRPMWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:255];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLMav5BasebandHardwareMessage *)self rpm])
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage rpm](self, "rpm"));
    [v12 setRpmXOShutDuration:v13];

    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage rpm](self, "rpm")[4]);
    [v12 setRpmXOShutCnt:v14];

    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage rpm](self, "rpm")[8]);
    [v12 setRpmVDDMinDuration:v15];

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage rpm](self, "rpm")[12]);
    [v12 setRpmVDDMinEnterCnt:v16];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke_394;
      v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v17;
      if (qword_1EBD5C198 != -1) {
        dispatch_once(&qword_1EBD5C198, v32);
      }
      if (byte_1EBD5C154)
      {
        unint64_t v18 = [NSString stringWithFormat:@"RPM=<unknown>"];
        unint64_t v19 = (void *)MEMORY[0x1E4F929B8];
        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
        v21 = [v20 lastPathComponent];
        id v22 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logRPMWithLogger:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:285];

        v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v18;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v12 appendToError:@"RPM=<unknown> "];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke_403;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD5C1A0 != -1) {
      dispatch_once(&qword_1EBD5C1A0, v31);
    }
    if (byte_1EBD5C155)
    {
      objc_super v25 = [NSString stringWithFormat:@"Decoded BB HW RPM"];
      uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v28 = [v27 lastPathComponent];
      uint64_t v29 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logRPMWithLogger:]"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:289];

      v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v25;
        _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C153 = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke_394(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C154 = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke_403(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C155 = result;
  return result;
}

- (void)logAPPSWithLogger:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLMav5BasebandHardwareMessage *)self apps])
  {
    uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self apps] ofSize:6];
    [v4 setAppsPerfStateCountHist:v5];
LABEL_3:

    goto LABEL_11;
  }
  [v4 appendToError:@"Perf_Level=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD5C1A8 != -1) {
      dispatch_once(&qword_1EBD5C1A8, block);
    }
    if (byte_1EBD5C156)
    {
      uint64_t v5 = [NSString stringWithFormat:@"Perf_Level=<unknown>"];
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logAPPSWithLogger:]"];
      [v7 logMessage:v5 fromFile:v9 fromFunction:v10 fromLineNumber:313];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v5;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if ([(PLMav5BasebandHardwareMessage *)self apps_sleep])
  {
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep"));
    [v4 setCxoShutDownDuration:v12];

    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep")[4]);
    [v4 setCxoShutDownCount:v13];
LABEL_13:

    goto LABEL_21;
  }
  [v4 appendToError:@"Sleep_Stats=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_418;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v14;
    if (qword_1EBD5C1B0 != -1) {
      dispatch_once(&qword_1EBD5C1B0, v40);
    }
    if (byte_1EBD5C157)
    {
      v13 = [NSString stringWithFormat:@"Sleep_Stats=<unknown>"];
      v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v17 = [v16 lastPathComponent];
      unint64_t v18 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logAPPSWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:332];

      unint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v13;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
LABEL_21:
  if ([(PLMav5BasebandHardwareMessage *)self apps_sleep_veto])
  {
    v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self apps_sleep_veto] ofSize:1];
    [v4 setAppsSleepVeto:v20];
LABEL_23:

    goto LABEL_31;
  }
  [v4 appendToError:@"Sleep_Veto_Duration=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_427;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v21;
    if (qword_1EBD5C1B8 != -1) {
      dispatch_once(&qword_1EBD5C1B8, v39);
    }
    if (byte_1EBD5C158)
    {
      v20 = [NSString stringWithFormat:@"Sleep_Veto_Duration=<unknown>"];
      id v22 = (void *)MEMORY[0x1E4F929B8];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v24 = [v23 lastPathComponent];
      objc_super v25 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logAPPSWithLogger:]"];
      [v22 logMessage:v20 fromFile:v24 fromFunction:v25 fromLineNumber:353];

      uint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v20;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
LABEL_31:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v27 = objc_opt_class();
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    uint64_t v36 = __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_433;
    v37 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v38 = v27;
    if (qword_1EBD5C1C0 != -1) {
      dispatch_once(&qword_1EBD5C1C0, &v34);
    }
    if (byte_1EBD5C159)
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Decoded BB HW APPS", v34, v35, v36, v37, v38);
      uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
      v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      v31 = [v30 lastPathComponent];
      __int16 v32 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logAPPSWithLogger:]"];
      [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:357];

      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v28;
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C156 = result;
  return result;
}

uint64_t __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_418(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C157 = result;
  return result;
}

uint64_t __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_427(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C158 = result;
  return result;
}

uint64_t __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_433(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C159 = result;
  return result;
}

- (void)logLPASSWithLogger:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLMav5BasebandHardwareMessage *)self lpass])
  {
    uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self lpass] ofSize:2];
    [v4 setLpassOnOffState:v5];
LABEL_3:

    goto LABEL_11;
  }
  [v4 appendToError:@"LPASS State=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLMav5BasebandHardwareMessage_logLPASSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD5C1C8 != -1) {
      dispatch_once(&qword_1EBD5C1C8, block);
    }
    if (byte_1EBD5C15A)
    {
      uint64_t v5 = [NSString stringWithFormat:@"LPASS State=<unknown>"];
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logLPASSWithLogger:]"];
      [v7 logMessage:v5 fromFile:v9 fromFunction:v10 fromLineNumber:374];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v5;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __52__PLMav5BasebandHardwareMessage_logLPASSWithLogger___block_invoke_445;
    id v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v23 = v12;
    if (qword_1EBD5C1D0 != -1) {
      dispatch_once(&qword_1EBD5C1D0, &v19);
    }
    if (byte_1EBD5C15B)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Decoded BB HW LPASS", v19, v20, v21, v22, v23);
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logLPASSWithLogger:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:377];

      unint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __52__PLMav5BasebandHardwareMessage_logLPASSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C15A = result;
  return result;
}

uint64_t __52__PLMav5BasebandHardwareMessage_logLPASSWithLogger___block_invoke_445(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C15B = result;
  return result;
}

- (void)logModemAppWithLogger:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLMav5BasebandHardwareMessage *)self mpss_sleep])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep"));
    [v4 setMpssCxoShutDownDuration:v5];

    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep")[4]);
    [v4 setMpssCxoShutDownCount:v6];
LABEL_3:

    goto LABEL_11;
  }
  [v4 appendToError:@"MPSS CXO_Shutdown=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1EBD5C1D8 != -1) {
      dispatch_once(&qword_1EBD5C1D8, block);
    }
    if (byte_1EBD5C15C)
    {
      uint64_t v6 = [NSString stringWithFormat:@"MPSS CXO_Shutdown=<unknown>"];
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      objc_super v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]"];
      [v8 logMessage:v6 fromFile:v10 fromFunction:v11 fromLineNumber:399];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v6;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if ([(PLMav5BasebandHardwareMessage *)self mpss_sleep_veto])
  {
    v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self mpss_sleep_veto] ofSize:3];
    [v4 setMpssSleepVeto:v13];
LABEL_13:

    goto LABEL_21;
  }
  [v4 appendToError:@"MPSS_Sleep_Veto_Duration=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_460;
    v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v56[4] = v14;
    if (qword_1EBD5C1E0 != -1) {
      dispatch_once(&qword_1EBD5C1E0, v56);
    }
    if (byte_1EBD5C15D)
    {
      v13 = [NSString stringWithFormat:@"MPSS_Sleep_Veto_Duration=<unknown>"];
      v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v17 = [v16 lastPathComponent];
      unint64_t v18 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:415];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v13;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
LABEL_21:
  if ([(PLMav5BasebandHardwareMessage *)self mdsp])
  {
    uint64_t v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self mdsp] ofSize:10];
    [v4 setMpssSleepVeto:v20];
LABEL_23:

    goto LABEL_31;
  }
  [v4 appendToError:@"MDSP=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_469;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v21;
    if (qword_1EBD5C1E8 != -1) {
      dispatch_once(&qword_1EBD5C1E8, v55);
    }
    if (byte_1EBD5C15E)
    {
      uint64_t v20 = [NSString stringWithFormat:@"MPSS_Sleep_Veto_Duration=<unknown>"];
      id v22 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v24 = [v23 lastPathComponent];
      objc_super v25 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]"];
      [v22 logMessage:v20 fromFile:v24 fromFunction:v25 fromLineNumber:434];

      uint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v20;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
LABEL_31:
  if ([(PLMav5BasebandHardwareMessage *)self qdsp])
  {
    uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self qdsp] ofSize:10];
    [v4 setMpssSleepVeto:v27];
LABEL_33:

    goto LABEL_41;
  }
  [v4 appendToError:@"QDSP=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v28 = objc_opt_class();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_475;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v28;
    if (qword_1EBD5C1F0 != -1) {
      dispatch_once(&qword_1EBD5C1F0, v54);
    }
    if (byte_1EBD5C15F)
    {
      uint64_t v27 = [NSString stringWithFormat:@"QDSP=<unknown>"];
      uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
      v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      v31 = [v30 lastPathComponent];
      __int16 v32 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]"];
      [v29 logMessage:v27 fromFile:v31 fromFunction:v32 fromLineNumber:453];

      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v27;
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_33;
    }
  }
LABEL_41:
  if ([(PLMav4BasebandHardwareMessage *)self adm])
  {
    uint64_t v34 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self adm] ofSize:2];
    [v4 setMpssSleepVeto:v34];
LABEL_43:

    goto LABEL_51;
  }
  [v4 appendToError:@"ADM=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v35 = objc_opt_class();
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_484;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v35;
    if (qword_1EBD5C1F8 != -1) {
      dispatch_once(&qword_1EBD5C1F8, v53);
    }
    if (byte_1EBD5C160)
    {
      uint64_t v34 = [NSString stringWithFormat:@"ADM=<unknown>"];
      uint64_t v36 = (void *)MEMORY[0x1E4F929B8];
      v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]"];
      [v36 logMessage:v34 fromFile:v38 fromFunction:v39 fromLineNumber:470];

      v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v34;
        _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_43;
    }
  }
LABEL_51:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v41 = objc_opt_class();
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    v50 = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_490;
    v51 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v52 = v41;
    if (qword_1EBD5C200 != -1) {
      dispatch_once(&qword_1EBD5C200, &v48);
    }
    if (byte_1EBD5C161)
    {
      v42 = objc_msgSend(NSString, "stringWithFormat:", @"Decoded BB HW MPSS", v48, v49, v50, v51, v52);
      v43 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      v45 = [v44 lastPathComponent];
      v46 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]"];
      [v43 logMessage:v42 fromFile:v45 fromFunction:v46 fromLineNumber:476];

      v47 = PLLogCommon();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v42;
        _os_log_debug_impl(&dword_1D2690000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C15C = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_460(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C15D = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_469(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C15E = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_475(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C15F = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_484(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C160 = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_490(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C161 = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLMav5BasebandHardwareMessage *)self usb])
  {
    uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self usb] ofSize:3];
    [v4 setUsbStateCountHist:v5];
LABEL_3:

    goto LABEL_11;
  }
  [v4 appendToError:@"USB=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD5C208 != -1) {
      dispatch_once(&qword_1EBD5C208, block);
    }
    if (byte_1EBD5C162)
    {
      uint64_t v5 = [NSString stringWithFormat:@"USB=<unknown>"];
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v7 logMessage:v5 fromFile:v9 fromFunction:v10 fromLineNumber:498];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v5;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if ([(PLMav4BasebandHardwareMessage *)self spi])
  {
    uint64_t v12 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self spi] ofSize:2];
    [v4 setSpiOnOffState:v12];
LABEL_13:

    goto LABEL_21;
  }
  [v4 appendToError:@"SPI=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_505;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v13;
    if (qword_1EBD5C210 != -1) {
      dispatch_once(&qword_1EBD5C210, v55);
    }
    if (byte_1EBD5C163)
    {
      uint64_t v12 = [NSString stringWithFormat:@"USB=<unknown>"];
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v14 logMessage:v12 fromFile:v16 fromFunction:v17 fromLineNumber:516];

      unint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v12;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
LABEL_21:
  if ([(PLMav4BasebandHardwareMessage *)self uart])
  {
    uint64_t v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self uart] ofSize:2];
    [v4 setUartOnOffState:v19];
LABEL_23:

    goto LABEL_31;
  }
  [v4 appendToError:@"UART=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v20 = objc_opt_class();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_511;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v20;
    if (qword_1EBD5C218 != -1) {
      dispatch_once(&qword_1EBD5C218, v54);
    }
    if (byte_1EBD5C164)
    {
      uint64_t v19 = [NSString stringWithFormat:@"UART=<unknown>"];
      uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
      id v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v21 logMessage:v19 fromFile:v23 fromFunction:v24 fromLineNumber:535];

      objc_super v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v19;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
LABEL_31:
  if ([(PLMav4BasebandHardwareMessage *)self gps])
  {
    uint64_t v26 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self gps] ofSize:2];
    [v4 setGpsOnOff:v26];
LABEL_33:

    goto LABEL_41;
  }
  [v4 appendToError:@"GPS=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v27 = objc_opt_class();
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_520;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v27;
    if (qword_1EBD5C220 != -1) {
      dispatch_once(&qword_1EBD5C220, v53);
    }
    if (byte_1EBD5C165)
    {
      uint64_t v26 = [NSString stringWithFormat:@"GPS=<unknown>"];
      uint64_t v28 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      v30 = [v29 lastPathComponent];
      v31 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v28 logMessage:v26 fromFile:v30 fromFunction:v31 fromLineNumber:554];

      __int16 v32 = PLLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v26;
        _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_33;
    }
  }
LABEL_41:
  if ([(PLMav5BasebandHardwareMessage *)self gps_dpo])
  {
    uint64_t v33 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self gps_dpo] ofSize:2];
    [v4 setGpsDPOOnOff:v33];
LABEL_43:

    goto LABEL_51;
  }
  [v4 appendToError:@"GPS_DPO=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_529;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v34;
    if (qword_1EBD5C228 != -1) {
      dispatch_once(&qword_1EBD5C228, v52);
    }
    if (byte_1EBD5C166)
    {
      uint64_t v33 = [NSString stringWithFormat:@"GPS_DPO=<unknown>"];
      uint64_t v35 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      v37 = [v36 lastPathComponent];
      uint64_t v38 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v35 logMessage:v33 fromFile:v37 fromFunction:v38 fromLineNumber:572];

      v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v33;
        _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_43;
    }
  }
LABEL_51:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v40 = objc_opt_class();
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    uint64_t v49 = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_535;
    v50 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v51 = v40;
    if (qword_1EBD5C230 != -1) {
      dispatch_once(&qword_1EBD5C230, &v47);
    }
    if (byte_1EBD5C167)
    {
      uint64_t v41 = objc_msgSend(NSString, "stringWithFormat:", @"Decoded BB HW Peripherals", v47, v48, v49, v50, v51);
      v42 = (void *)MEMORY[0x1E4F929B8];
      v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v44 = [v43 lastPathComponent];
      v45 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:578];

      v46 = PLLogCommon();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v41;
        _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C162 = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_505(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C163 = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_511(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C164 = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_520(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C165 = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_529(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C166 = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_535(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C167 = result;
  return result;
}

- (void)logRFWithLogger2:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke;
    v68[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v68[4] = v5;
    if (qword_1EBD5C238 != -1) {
      dispatch_once(&qword_1EBD5C238, v68);
    }
    if (byte_1EBD5C168)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav5BasebandHardwareMessage logRFWithLogger2:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logRFWithLogger2:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:584];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v70 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v61 = v4;
  uint64_t v12 = objc_alloc_init(PLBBMavLogMsg);
  uint64_t v13 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v12 setAgent:v13];

  [(PLBBMavLogMsg *)v12 setError:&stru_1F294E108];
  uint64_t v14 = [(PLBasebandMessage *)self seqNum];
  v15 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  if ([(PLMav5BasebandHardwareMessage *)self rx]
    && [(PLMav5BasebandHardwareMessage *)self rx_sqa]
    && [(PLMav5BasebandHardwareMessage *)self tx])
  {
    uint64_t v16 = 0;
    uint64_t v64 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 80;
    uint64_t v19 = 220;
    unint64_t v20 = 0x1E4F92000uLL;
    while (1)
    {
      uint64_t v21 = [(PLMav5BasebandHardwareMessage *)self indexToRAT:v17];
      if ([v21 length])
      {
        [(PLBBMavLogMsg *)v12 setRat:v21];
        id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
        [(PLBBMavLogMsg *)v12 setLogDuration:v22];

        uint64_t v23 = [NSNumber numberWithInt:v17];
        [(PLBBMavLogMsg *)v12 setRadioTech:v23];

        uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", (-[PLMav4BasebandHardwareMessage header](self, "header")[16]- -[PLMav4BasebandHardwareMessage header](self, "header")[12]));
        [(PLBBMavLogMsg *)v12 setBbHwLogDurationInTicks:v24];

        uint64_t v58 = v16;
        objc_super v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self rx] + v16 ofSize:4];
        [(PLBBMavLogMsg *)v12 setRssiModeCount:v25];

        uint64_t v26 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self rx] + v18 ofSize:13];
        [(PLBBMavLogMsg *)v12 setRx0RssiPowerHist:v26];

        uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self rx] + v18 + 260 ofSize:13];
        [(PLBBMavLogMsg *)v12 setRx1RssiPowerHist:v27];

        uint64_t v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self rx_sqa] + v19 - 220 ofSize:11];
        [(PLBBMavLogMsg *)v12 setRx0SQAPowerHist:v28];

        uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self rx_sqa] + v19 ofSize:11];
        [(PLBBMavLogMsg *)v12 setRx1SQAPowerHist:v29];

        v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
        [(PLBBMavLogMsg *)v12 setLogDuration:v30];

        v62 = v21;
        [(PLBBMavLogMsg *)v12 setRat:v21];
        v31 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self tx] + v64 ofSize:12];
        [(PLBBMavLogMsg *)v12 setTxPowerHist:v31];

        __int16 v32 = [v61 protocolStateHistDict];
        uint64_t v33 = [NSNumber numberWithInt:v17];
        uint64_t v34 = [v32 objectForKey:v33];

        if (v34) {
          [(PLBBMavLogMsg *)v12 setProtocolStateHist:v34];
        }
        uint64_t v60 = (void *)v34;
        unint64_t v20 = 0x1E4F92000uLL;
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v35 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_556;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v35;
          if (qword_1EBD5C250 != -1) {
            dispatch_once(&qword_1EBD5C250, block);
          }
          if (byte_1EBD5C16B)
          {
            uint64_t v36 = [NSString stringWithFormat:@"Decoded BB HW RF %@", v21];
            v37 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
            v39 = [v38 lastPathComponent];
            uint64_t v40 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logRFWithLogger2:]"];
            [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:654];

            uint64_t v41 = PLLogCommon();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v70 = (uint64_t)v36;
              _os_log_debug_impl(&dword_1D2690000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v20 = 0x1E4F92000;
            uint64_t v21 = v62;
          }
        }
        v42 = [(PLBBMavLogMsg *)v12 logEventBackwardGrpEntriesBBMavHwOtherPerRAT];
        v43 = [v42 objectForKey:@"entry"];
        uint64_t v44 = [v42 objectForKey:@"name"];
        [v61 addToGroupPLBBMavHwEntry:v43 withEntryKey:v44];

        uint64_t v16 = v58;
      }
      else
      {
        if (![*(id *)(v20 + 2496) debugEnabled]) {
          goto LABEL_31;
        }
        uint64_t v45 = objc_opt_class();
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_550;
        v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v66[4] = v45;
        if (qword_1EBD5C248 != -1) {
          dispatch_once(&qword_1EBD5C248, v66);
        }
        if (!byte_1EBD5C16A) {
          goto LABEL_31;
        }
        v63 = v21;
        uint64_t v59 = v16;
        uint64_t v46 = [NSString stringWithFormat:@"Error: RAT unknown, cannot record"];
        uint64_t v47 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
        uint64_t v49 = [v48 lastPathComponent];
        v50 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logRFWithLogger2:]"];
        uint64_t v60 = (void *)v46;
        [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:609];

        v42 = PLLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v70 = v46;
          _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        unint64_t v20 = 0x1E4F92000;
        uint64_t v16 = v59;
        uint64_t v21 = v63;
      }

LABEL_31:
      ++v17;
      v18 += 52;
      v64 += 48;
      v19 += 44;
      v16 += 16;
      if (v18 == 340) {
        goto LABEL_41;
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v51 = objc_opt_class();
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_544;
    v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v67[4] = v51;
    if (qword_1EBD5C240 != -1) {
      dispatch_once(&qword_1EBD5C240, v67);
    }
    if (byte_1EBD5C169)
    {
      uint64_t v52 = [NSString stringWithFormat:@"Error: BB HW RF <RAT> is expected but not present"];
      v53 = (void *)MEMORY[0x1E4F929B8];
      v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      v55 = [v54 lastPathComponent];
      v56 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logRFWithLogger2:]"];
      [v53 logMessage:v52 fromFile:v55 fromFunction:v56 fromLineNumber:598];

      v57 = PLLogCommon();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v70 = (uint64_t)v52;
        _os_log_debug_impl(&dword_1D2690000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBMavLogMsg *)v12 appendToError:@"Error: BB HW RF <RAT> is expected but not present"];
  [(PLBBMavLogMsg *)v12 logEventBackwardMavBBHwOtherPerRAT];
LABEL_41:
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C168 = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_544(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C169 = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_550(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C16A = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_556(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C16B = result;
  return result;
}

- (void)logProtocolWithLogger:(id)a3 withCount:(unsigned int)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke;
    v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v56[4] = v8;
    if (qword_1EBD5C258 != -1) {
      dispatch_once(&qword_1EBD5C258, v56);
    }
    if (byte_1EBD5C16C)
    {
      objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]");
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:819];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v58 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v50 = v6;
  uint64_t v49 = objc_opt_new();
  if ([(PLMav5BasebandHardwareMessage *)self protocol])
  {
    if (a4)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v48 = a4;
      unint64_t v18 = 0x1E4F28000uLL;
      do
      {
        uint64_t v19 = v17;
        uint64_t v51 = v16;
        uint64_t v52 = [(PLMav5BasebandHardwareMessage *)self indexToRAT:v16];
        unint64_t v20 = [MEMORY[0x1E4F28E78] string];
        uint64_t v17 = objc_opt_new();

        if ([(PLMav5BasebandHardwareMessage *)self protocol])
        {
          for (uint64_t i = 0; i != 16; ++i)
          {
            if (([(PLMav5BasebandHardwareMessage *)self protocol] + v15)[4 * i])
            {
              unsigned int v22 = ([(PLMav5BasebandHardwareMessage *)self protocol] + v15)[4 * i];
              unsigned int v23 = [(PLMav4BasebandHardwareMessage *)self logDuration];
              if (i <= 0xE) {
                [v20 appendString:off_1E692E150[i]];
              }
              if ([*(id *)(v7 + 2496) debugEnabled])
              {
                uint64_t v24 = objc_opt_class();
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_615;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v24;
                if (qword_1EBD5C260 != -1) {
                  dispatch_once(&qword_1EBD5C260, block);
                }
                if (byte_1EBD5C16D)
                {
                  objc_super v25 = [NSString stringWithFormat:@"Protocol State: RAT [%@], Log [%@], percent [%f]= ", v52, v20, (float)((float)((float)v22 * 100.0) / (float)v23)];
                  uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
                  uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
                  uint64_t v28 = [v27 lastPathComponent];
                  uint64_t v29 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]"];
                  [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:859];

                  v30 = PLLogCommon();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v58 = v25;
                    _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  unint64_t v7 = 0x1E4F92000;
                  unint64_t v18 = 0x1E4F28000uLL;
                }
              }
              v31 = objc_msgSend(*(id *)(v18 + 3792), "numberWithUnsignedInt:", (-[PLMav5BasebandHardwareMessage protocol](self, "protocol") + v15)[4 * i]);
              [v17 addObject:v31];
            }
            else
            {
              [v17 addObject:&unk_1F29E62E0];
            }
          }
        }
        __int16 v32 = [*(id *)(v18 + 3792) numberWithInt:v51];
        [v50 setRadioTech:v32];

        uint64_t v33 = [*(id *)(v18 + 3792) numberWithInt:v51];
        [v49 setObject:v17 forKey:v33];

        if ([*(id *)(v7 + 2496) debugEnabled])
        {
          uint64_t v34 = objc_opt_class();
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_622;
          v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v54[4] = v34;
          if (qword_1EBD5C268 != -1) {
            dispatch_once(&qword_1EBD5C268, v54);
          }
          if (byte_1EBD5C16E)
          {
            uint64_t v35 = [NSString stringWithFormat:@"Decoded BB HW Protocol %@", v52];
            uint64_t v36 = (void *)MEMORY[0x1E4F929B8];
            v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
            uint64_t v38 = [v37 lastPathComponent];
            v39 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]"];
            [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:873];

            uint64_t v40 = PLLogCommon();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v58 = v35;
              _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v7 = 0x1E4F92000;
            unint64_t v18 = 0x1E4F28000;
          }
        }

        uint64_t v16 = v51 + 1;
        v15 += 64;
      }
      while (v51 + 1 != v48);
    }
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v41 = objc_opt_class();
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_628;
      v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v53[4] = v41;
      if (qword_1EBD5C270 != -1) {
        dispatch_once(&qword_1EBD5C270, v53);
      }
      if (byte_1EBD5C16F)
      {
        v42 = [NSString stringWithFormat:@"Error: BB HW Protocol is expected but not present"];
        v43 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
        uint64_t v45 = [v44 lastPathComponent];
        uint64_t v46 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]"];
        [v43 logMessage:v42 fromFile:v45 fromFunction:v46 fromLineNumber:879];

        uint64_t v47 = PLLogCommon();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v58 = v42;
          _os_log_debug_impl(&dword_1D2690000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v50 appendToError:@"Error: BB HW Protocol is expected but not present. "];
    [v50 logEventBackwardMavBBHwOtherPerRAT];
  }
  [v50 setProtocolStateHistDict:v49];
}

uint64_t __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C16C = result;
  return result;
}

uint64_t __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_615(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C16D = result;
  return result;
}

uint64_t __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_622(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C16E = result;
  return result;
}

uint64_t __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_628(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C16F = result;
  return result;
}

- (void)logClockWithLogger:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C278 != -1) {
      dispatch_once(&qword_1EBD5C278, block);
    }
    if (byte_1EBD5C170)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav5BasebandHardwareMessage logClockWithLogger:]");
      unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
      objc_super v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logClockWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:889];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLMav5BasebandHardwareMessage *)self clock])
  {
    for (uint64_t i = 0; i != 114; ++i)
    {
      if ([(PLMav5BasebandHardwareMessage *)self clock][4 * i])
      {
        double v14 = (float)[(PLMav5BasebandHardwareMessage *)self clock][4 * i] * 100.0;
        float v15 = v14 / (double)[(PLMav4BasebandHardwareMessage *)self logDuration];
        double v16 = v15;
        if (v16 > 0.01)
        {
          uint64_t v17 = apps_clock_names_0[i];
          unint64_t v18 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%.02f%%", *(void *)&v16);
          [v12 addPairWithKey:v17 andWithVal:v18];
        }
      }
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke_640;
      v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v40[4] = v19;
      if (qword_1EBD5C280 != -1) {
        dispatch_once(&qword_1EBD5C280, v40);
      }
      if (byte_1EBD5C171)
      {
        unint64_t v20 = [NSString stringWithFormat:@"Decoded BB HW APPS Clock"];
        uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
        unsigned int v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
        unsigned int v23 = [v22 lastPathComponent];
        uint64_t v24 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logClockWithLogger:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:912];

        objc_super v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v20;
          _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    for (uint64_t j = 0; j != 95; ++j)
    {
      if (([(PLMav5BasebandHardwareMessage *)self clock] + 4 * j)[456])
      {
        double v27 = (float)([(PLMav5BasebandHardwareMessage *)self clock] + 4 * j)[456] * 100.0;
        float v28 = v27 / (double)[(PLMav4BasebandHardwareMessage *)self logDuration];
        double v29 = v28;
        if (v29 > 0.01)
        {
          v30 = mpss_clock_names[j];
          v31 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%.02f%%", *(void *)&v29);
          [v12 addPairWithKey:v30 andWithVal:v31];
        }
      }
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v32 = objc_opt_class();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke_646;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v32;
      if (qword_1EBD5C288 != -1) {
        dispatch_once(&qword_1EBD5C288, v39);
      }
      if (byte_1EBD5C172)
      {
        uint64_t v33 = [NSString stringWithFormat:@"Decoded BB HW MPSS Clock"];
        uint64_t v34 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m"];
        uint64_t v36 = [v35 lastPathComponent];
        v37 = [NSString stringWithUTF8String:"-[PLMav5BasebandHardwareMessage logClockWithLogger:]"];
        [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:932];

        uint64_t v38 = PLLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v33;
          _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v12 setType:@"BB HW APPS Clock"];
  }
}

uint64_t __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C170 = result;
  return result;
}

uint64_t __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke_640(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C171 = result;
  return result;
}

uint64_t __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke_646(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C172 = result;
  return result;
}

- (void)formatDurationandCount:(unsigned int)a3 withCount:(unsigned int)a4 inString:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  float v7 = (float)a3 * 100.0;
  id v13 = a5;
  float v8 = v7 / (float)[(PLMav4BasebandHardwareMessage *)self logDuration];
  double v9 = v8;
  BOOL v10 = v8 < INFINITY;
  BOOL v11 = v8 <= INFINITY;
  double v12 = 0.0;
  if (v10) {
    double v12 = v9;
  }
  if (!v11) {
    double v12 = v9;
  }
  objc_msgSend(v13, "appendFormat:", @"[%.02f%%,%d];", *(void *)&v12, v5);
}

- (id)indexToRAT:(unint64_t)a3
{
  if (a3 > 4)
  {
    id v4 = &stru_1F294E108;
  }
  else
  {
    id v4 = *off_1E692E1C8[a3];
  }
  return v4;
}

- (_PLMav5BasebandHWStatsRPM)rpm
{
  return self->_mav5_rpm;
}

- (void)setRpm:(_PLMav5BasebandHWStatsRPM *)a3
{
  self->_mav5_rpm = a3;
}

- (_PLMav5BasebandHWStatsAPPSPerf)apps
{
  return self->_mav5_apps;
}

- (void)setApps:(_PLMav5BasebandHWStatsAPPSPerf *)a3
{
  self->_mav5_apps = a3;
}

- (_PLMav5BasebandHWStatsSleep)apps_sleep
{
  return self->_mav5_apps_sleep;
}

- (void)setApps_sleep:(_PLMav5BasebandHWStatsSleep *)a3
{
  self->_mav5_apps_sleep = a3;
}

- (_PLMav5BasebandHWAPPSSleepVeto)apps_sleep_veto
{
  return self->_mav5_apps_sleep_veto;
}

- (void)setApps_sleep_veto:(_PLMav5BasebandHWAPPSSleepVeto *)a3
{
  self->_mav5_apps_sleep_veto = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)lpass
{
  return self->_mav5_lpass;
}

- (void)setLpass:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav5_lpass = a3;
}

- (_PLMav5BasebandHWStatsMDSP)mdsp
{
  return self->_mav5_mdsp;
}

- (void)setMdsp:(_PLMav5BasebandHWStatsMDSP *)a3
{
  self->_mav5_mdsp = a3;
}

- (_PLMav5BasebandHWStatsQDSP)qdsp
{
  return self->_mav5_qdsp;
}

- (void)setQdsp:(_PLMav5BasebandHWStatsQDSP *)a3
{
  self->_mav5_qdsp = a3;
}

- (_PLMav5BasebandHWStatsSleep)mpss_sleep
{
  return self->_mav4_mpss_sleep;
}

- (void)setMpss_sleep:(_PLMav5BasebandHWStatsSleep *)a3
{
  self->_mav4_mpss_sleep = a3;
}

- (_PLMav5BasebandHWMPSSSleepVeto)mpss_sleep_veto
{
  return self->_mav4_mpss_sleep_veto;
}

- (void)setMpss_sleep_veto:(_PLMav5BasebandHWMPSSSleepVeto *)a3
{
  self->_mav4_mpss_sleep_veto = a3;
}

- (_PLMav5BasebandHWStatsUSB)usb
{
  return self->_mav5_usb;
}

- (void)setUsb:(_PLMav5BasebandHWStatsUSB *)a3
{
  self->_mav5_usb = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)gps_dpo
{
  return self->_mav5_gps_dpo;
}

- (void)setGps_dpo:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav5_gps_dpo = a3;
}

- (_PLMav5BasebandHWStatsRX)rx
{
  return self->_mav5_rx;
}

- (void)setRx:(_PLMav5BasebandHWStatsRX *)a3
{
  self->_mav5_rx = a3;
}

- (_PLMav5BasebandHWStatsRXSQA)rx_sqa
{
  return self->_mav5_rx_sqa;
}

- (void)setRx_sqa:(_PLMav5BasebandHWStatsRXSQA *)a3
{
  self->_mav5_rx_sqa = a3;
}

- (_PLMav5BasebandHWStatsTX)tx
{
  return self->_mav5_tx;
}

- (void)setTx:(_PLMav5BasebandHWStatsTX *)a3
{
  self->_mav5_tx = a3;
}

- (_PLMav5BasebandHWStatsProtocol)protocol
{
  return self->_mav5_protocol;
}

- (void)setProtocol:(_PLMav5BasebandHWStatsProtocol *)a3
{
  self->_mav5_protocol = a3;
}

- (_PLMav5BasebandHWClocksDuration)clock
{
  return self->_mav5_clock;
}

- (void)setClock:(_PLMav5BasebandHWClocksDuration *)a3
{
  self->_mav5_clock = a3;
}

@end