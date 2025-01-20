@interface PLMav7BasebandHardwareMessage
- (BOOL)parseData:(id)a3;
- (NSMutableString)apps_clock_duration;
- (NSMutableString)mpss_clock_duration;
- (PLMav7BasebandHardwareMessage)initWithData:(id)a3;
- (_PLMav7BasebandGPSDPOBin)gps_dpo_bins;
- (_PLMav7BasebandHWStatsClockStateMask)apps_clock_count_mask;
- (_PLMav7BasebandHWStatsClockStateMask)apps_clock_duration_mask;
- (_PLMav7BasebandHWStatsClockStateMask)mpss_clock_count_mask;
- (_PLMav7BasebandHWStatsClockStateMask)mpss_clock_duration_mask;
- (_PLMav7BasebandHWStatsHSICState)hsic;
- (_PLMav7BasebandHWStatsMCPMVeto)mcpm_sleep_veto;
- (_PLMav7BasebandHWStatsNPAVeto)npa_sleep_veto;
- (_PLMav7BasebandHWStatsProtocol)protocol;
- (_PLMav7BasebandHWStatsRFTech)rf;
- (id)indexToRAT:(unint64_t)a3;
- (int)GetClockCount:(_PLMav7BasebandHWStatsClockStateMask *)a3;
- (void)SetClocks:(_PLMav7BasebandHWStatsClockStateMask *)a3 oftype:(int)a4 withData:(char *)a5;
- (void)logAPPSWithLogger:(id)a3;
- (void)logClockWithLogger:(id)a3;
- (void)logHSICWithLogger:(id)a3;
- (void)logMPSSWithLogger:(id)a3;
- (void)logPeripheralsWithLogger:(id)a3;
- (void)logProtocolActiveWithLogger:(id)a3;
- (void)logRFWithLogger2:(id)a3;
- (void)logSleepVetoWithLogger:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setApps_clock_count_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3;
- (void)setApps_clock_duration:(id)a3;
- (void)setApps_clock_duration_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3;
- (void)setGps_dpo_bins:(_PLMav7BasebandGPSDPOBin *)a3;
- (void)setHsic:(_PLMav7BasebandHWStatsHSICState *)a3;
- (void)setMcpm_sleep_veto:(_PLMav7BasebandHWStatsMCPMVeto *)a3;
- (void)setMpss_clock_count_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3;
- (void)setMpss_clock_duration:(id)a3;
- (void)setMpss_clock_duration_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3;
- (void)setNpa_sleep_veto:(_PLMav7BasebandHWStatsNPAVeto *)a3;
- (void)setProtocol:(_PLMav7BasebandHWStatsProtocol *)a3;
- (void)setRf:(_PLMav7BasebandHWStatsRFTech *)a3;
@end

@implementation PLMav7BasebandHardwareMessage

- (PLMav7BasebandHardwareMessage)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMav7BasebandHardwareMessage;
  v5 = [(PLMav5BasebandHardwareMessage *)&v9 initWithData:v4];
  v6 = v5;
  if (v5 && ![(PLMav7BasebandHardwareMessage *)v5 parseData:v4]) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (unsigned __int8 *)[v4 bytes];
  v6 = &v5[2 * (*v5 == 129)];
  [(PLMav4BasebandHardwareMessage *)self setHeader:v6 + 13];
  v7 = v6 + 33;
  [(PLMav4BasebandHardwareMessage *)self setLogDuration:([(PLMav4BasebandHardwareMessage *)self header][16]- [(PLMav4BasebandHardwareMessage *)self header][12])];
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
    [(PLMav7BasebandHardwareMessage *)self setGps_dpo_bins:v7 + 112];
    [(PLMav5BasebandHardwareMessage *)self setMpss_sleep:v7 + 136];
    v7 += 144;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 6)
  {
    [(PLMav7BasebandHardwareMessage *)self setRf:v7];
    [(PLMav7BasebandHardwareMessage *)self setProtocol:v7 + 1536];
    [(PLMav7BasebandHardwareMessage *)self setMcpm_sleep_veto:v7 + 1944];
    [(PLMav7BasebandHardwareMessage *)self setNpa_sleep_veto:v7 + 1968];
    v7 += 2068;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration_mask:v7];
    v8 = v7 + 16;
    int v9 = [(PLMav7BasebandHardwareMessage *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask]];
    v10 = [MEMORY[0x1E4F28E78] string];
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration:v10];

    [(PLMav7BasebandHardwareMessage *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask] oftype:0 withData:v8];
    uint64_t v11 = (uint64_t)&v8[4 * v9];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration_mask:v11];
    v11 += 16;
    int v12 = [(PLMav7BasebandHardwareMessage *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask]];
    v13 = [MEMORY[0x1E4F28E78] string];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration:v13];

    [(PLMav7BasebandHardwareMessage *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask] oftype:1 withData:v11];
    v7 = (unsigned __int8 *)(v11 + 4 * v12);
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 8)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_count_mask:v7];
    uint64_t v14 = (uint64_t)&v7[4
                     * [(PLMav7BasebandHardwareMessage *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_count_mask]]+ 16];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_count_mask:v14];
    uint64_t v15 = v14
        + 4
        * [(PLMav7BasebandHardwareMessage *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_count_mask]];
    [(PLMav7BasebandHardwareMessage *)self setHsic:v15 + 16];
    v7 = (unsigned __int8 *)(v15 + 48);
  }
  id v16 = v4;
  unint64_t v17 = (unint64_t)&v7[-[v16 bytes]];
  unint64_t v18 = [v16 length];
  if (v17 > v18)
  {
    v19 = PLLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v21 = v16;
      int v22 = 134218498;
      v23 = &v7[-[v21 bytes]];
      __int16 v24 = 2048;
      uint64_t v25 = [v21 length];
      __int16 v26 = 2080;
      v27 = "-[PLMav7BasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1D2690000, v19, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", (uint8_t *)&v22, 0x20u);
    }
  }
  return v17 <= v18;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)PLMav7BasebandHardwareMessage;
  [(PLBasebandHardwareMessage *)&v25 logRawWithLogger:a3];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLMav7BasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD59D00 != -1) {
      dispatch_once(&qword_1EBD59D00, block);
    }
    if (_MergedGlobals_1_42)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav7BasebandHardwareMessage logWithLogger:]");
      v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v8 = [v7 lastPathComponent];
      int v9 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logWithLogger:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:210];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = objc_alloc_init(PLBBMavLogMsg);
  int v12 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v11 setAgent:v12];

  [(PLBBMavLogMsg *)v11 setError:&stru_1F294E108];
  v13 = [(PLBasebandMessage *)self seqNum];
  uint64_t v14 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v11, "setHeaderWithSeqNum:andDate:andTimeCal:", v13, v14);

  if ([(PLMav4BasebandHardwareMessage *)self sw_rev] == 3)
  {
    [(PLMav4BasebandHardwareMessage *)self logHeaderWithLogger:v11];
    [(PLMav5BasebandHardwareMessage *)self logRPMWithLogger:v11];
    [(PLMav7BasebandHardwareMessage *)self logAPPSWithLogger:v11];
    [(PLMav7BasebandHardwareMessage *)self logMPSSWithLogger:v11];
    [(PLMav5BasebandHardwareMessage *)self logLPASSWithLogger:v11];
    [(PLMav7BasebandHardwareMessage *)self logPeripheralsWithLogger:v11];
    [(PLMav5BasebandHardwareMessage *)self logProtocolWithLogger:v11 withCount:6];
    [(PLMav7BasebandHardwareMessage *)self logProtocolActiveWithLogger:v11];
    if ([MEMORY[0x1E4F929C0] fullMode]) {
      [(PLMav7BasebandHardwareMessage *)self logSleepVetoWithLogger:v11];
    }
    if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
    {
      [(PLMav7BasebandHardwareMessage *)self logClockWithLogger:v11];
      [(PLMav7BasebandHardwareMessage *)self logHSICWithLogger:v11];
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __47__PLMav7BasebandHardwareMessage_logWithLogger___block_invoke_384;
      v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v23[4] = v15;
      if (qword_1EBD59D08 != -1) {
        dispatch_once(&qword_1EBD59D08, v23);
      }
      if (byte_1EBD59CE1)
      {
        id v16 = [NSString stringWithFormat:@"Decoded BB HW Other"];
        unint64_t v17 = (void *)MEMORY[0x1E4F929B8];
        unint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        v19 = [v18 lastPathComponent];
        v20 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logWithLogger:]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:245];

        id v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v16;
          _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMavLogMsg *)v11 addToGroupPLBBMavHwOther];
    [(PLMav7BasebandHardwareMessage *)self logRFWithLogger2:v11];
    [(PLBBMavLogMsg *)v11 logEventBackwardGrpEntriesBBMavHw];
  }
  else
  {
    int v22 = [MEMORY[0x1E4F28E78] string];
    objc_msgSend(v22, "appendFormat:", @"Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3);
    [(PLBBMavLogMsg *)v11 setError:v22];
    [(PLBBMavLogMsg *)v11 setType:@"BB HW Error"];
    [(PLBBMavLogMsg *)v11 logEventBackwardMavBBHwOther];
  }
}

uint64_t __47__PLMav7BasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_42 = result;
  return result;
}

uint64_t __47__PLMav7BasebandHardwareMessage_logWithLogger___block_invoke_384(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE1 = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PLMav7BasebandHardwareMessage;
  [(PLMav5BasebandHardwareMessage *)&v31 logPeripheralsWithLogger:v4];
  v5 = &off_1D2B02000;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD59D10 != -1) {
      dispatch_once(&qword_1EBD59D10, block);
    }
    if (byte_1EBD59CE2)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:]");
      v8 = (void *)MEMORY[0x1E4F929B8];
      int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:259];

      int v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = &off_1D2B02000;
    }
  }
  id v13 = v4;
  if ([(PLMav7BasebandHardwareMessage *)self gps_dpo_bins])
  {
    uint64_t v14 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self gps_dpo_bins] ofSize:6];
    [v13 setGpsDPOBin:v14];
LABEL_10:

    goto LABEL_18;
  }
  [v13 appendToError:@"GPS_DPO_BINS=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_395;
    v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v29[4] = v15;
    if (qword_1EBD59D18 != -1) {
      dispatch_once(&qword_1EBD59D18, v29);
    }
    if (byte_1EBD59CE3)
    {
      uint64_t v14 = [NSString stringWithFormat:@"GPS_DPO_BINS=<unknown>"];
      id v16 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      unint64_t v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v16 logMessage:v14 fromFile:v18 fromFunction:v19 fromLineNumber:271];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v14;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = &off_1D2B02000;
      goto LABEL_10;
    }
  }
LABEL_18:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = *((void *)v5 + 347);
    v28[2] = __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_401;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v21;
    if (qword_1EBD59D20 != -1) {
      dispatch_once(&qword_1EBD59D20, v28);
    }
    if (byte_1EBD59CE4)
    {
      int v22 = [NSString stringWithFormat:@"Decoded BB HW Peripherals GPS DPO BINS"];
      v23 = (void *)MEMORY[0x1E4F929B8];
      __int16 v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      objc_super v25 = [v24 lastPathComponent];
      __int16 v26 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:]"];
      [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:274];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v22;
        _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE2 = result;
  return result;
}

uint64_t __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_395(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE3 = result;
  return result;
}

uint64_t __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_401(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE4 = result;
  return result;
}

- (void)logAPPSWithLogger:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD59D28 != -1) {
      dispatch_once(&qword_1EBD59D28, block);
    }
    if (byte_1EBD59CE5)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      int v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:279];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLMav5BasebandHardwareMessage *)self apps])
  {
    id v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self apps] ofSize:6];
    [v12 setAppsPerfStateCountHist:v13];
LABEL_10:

    goto LABEL_18;
  }
  [v12 appendToError:@"Perf_Level=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_410;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v14;
    if (qword_1EBD59D30 != -1) {
      dispatch_once(&qword_1EBD59D30, v47);
    }
    if (byte_1EBD59CE6)
    {
      id v13 = [NSString stringWithFormat:@"Perf_Level=<unknown>"];
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      unint64_t v17 = [v16 lastPathComponent];
      unint64_t v18 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:296];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v13;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_10;
    }
  }
LABEL_18:
  if ([(PLMav5BasebandHardwareMessage *)self apps_sleep])
  {
    v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep"));
    [v12 setCxoShutDownDuration:v20];

    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep")[4]);
    [v12 setCxoShutDownCount:v21];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_417;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v22;
      if (qword_1EBD59D38 != -1) {
        dispatch_once(&qword_1EBD59D38, v46);
      }
      if (byte_1EBD59CE7)
      {
        v23 = [NSString stringWithFormat:@"Sleep_Stats=<unknown>"];
        __int16 v24 = (void *)MEMORY[0x1E4F929B8];
        objc_super v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        __int16 v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:316];

        uint64_t v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v23;
          _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v12 appendToError:@"Sleep_Stats=<unknown> "];
  }
  if ([(PLMav5BasebandHardwareMessage *)self apps_sleep_veto])
  {
    v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self apps_sleep_veto] ofSize:1];
    [v12 setAppsSleepVeto:v29];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v30 = objc_opt_class();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_426;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v30;
      if (qword_1EBD59D40 != -1) {
        dispatch_once(&qword_1EBD59D40, v45);
      }
      if (byte_1EBD59CE8)
      {
        objc_super v31 = [NSString stringWithFormat:@"Sleep_Veto_Duration=<unknown>"];
        v32 = (void *)MEMORY[0x1E4F929B8];
        v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        uint64_t v34 = [v33 lastPathComponent];
        v35 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]"];
        [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:337];

        v36 = PLLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v31;
          _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v12 appendToError:@"Sleep_Veto_Duration=<unknown> "];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v37 = objc_opt_class();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_435;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v37;
    if (qword_1EBD59D48 != -1) {
      dispatch_once(&qword_1EBD59D48, v44);
    }
    if (byte_1EBD59CE9)
    {
      v38 = [NSString stringWithFormat:@"Decoded BB HW APPS"];
      v39 = (void *)MEMORY[0x1E4F929B8];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v41 = [v40 lastPathComponent];
      v42 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]"];
      [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:341];

      v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v38;
        _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE5 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_410(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE6 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_417(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE7 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_426(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE8 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_435(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CE9 = result;
  return result;
}

- (void)logMPSSWithLogger:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD59D50 != -1) {
      dispatch_once(&qword_1EBD59D50, block);
    }
    if (byte_1EBD59CEA)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]");
      v8 = (void *)MEMORY[0x1E4F929B8];
      int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:348];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v5 = 0x1E4F92000uLL;
    }
  }
  id v13 = v4;
  if ([(PLMav5BasebandHardwareMessage *)self mpss_sleep])
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep"));
    [v13 setMpssCxoShutDownDuration:v14];

    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep")[4]);
    [v13 setMpssCxoShutDownCount:v15];
  }
  if ([(PLMav5BasebandHardwareMessage *)self mpss_sleep_veto])
  {
    id v16 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self mpss_sleep_veto] ofSize:3];
    [v13 setMpssSleepVeto:v16];
LABEL_12:

    goto LABEL_20;
  }
  [v13 appendToError:@"Sleep_Veto=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_444;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v17;
    if (qword_1EBD59D58 != -1) {
      dispatch_once(&qword_1EBD59D58, v55);
    }
    if (byte_1EBD59CEB)
    {
      id v16 = [NSString stringWithFormat:@"Sleep_Veto=<unknown>"];
      unint64_t v18 = (void *)MEMORY[0x1E4F929B8];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v20 = [v19 lastPathComponent];
      uint64_t v21 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]"];
      [v18 logMessage:v16 fromFile:v20 fromFunction:v21 fromLineNumber:383];

      uint64_t v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v16;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v5 = 0x1E4F92000;
      goto LABEL_12;
    }
  }
LABEL_20:
  if ([(PLMav5BasebandHardwareMessage *)self mdsp])
  {
    v23 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self mdsp] ofSize:10];
    [v13 setMdspConfigCount:v23];
LABEL_22:

    goto LABEL_30;
  }
  [v13 appendToError:@"Q6FW_Perf=<unknown> "];
  if ([*(id *)(v5 + 2496) debugEnabled])
  {
    uint64_t v24 = objc_opt_class();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_453;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v24;
    if (qword_1EBD59D60 != -1) {
      dispatch_once(&qword_1EBD59D60, v54);
    }
    if (byte_1EBD59CEC)
    {
      v23 = [NSString stringWithFormat:@"Q6FW_Perf=<unknown>"];
      objc_super v25 = (void *)MEMORY[0x1E4F929B8];
      __int16 v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v27 = [v26 lastPathComponent];
      uint64_t v28 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]"];
      [v25 logMessage:v23 fromFile:v27 fromFunction:v28 fromLineNumber:404];

      v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v23;
        _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v5 = 0x1E4F92000;
      goto LABEL_22;
    }
  }
LABEL_30:
  if ([(PLMav5BasebandHardwareMessage *)self qdsp])
  {
    uint64_t v30 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self qdsp] ofSize:10];
    [v13 setQdspConfigCount:v30];
LABEL_32:

    goto LABEL_40;
  }
  [v13 appendToError:@"Q6SW_Perf=<unknown> "];
  if ([*(id *)(v5 + 2496) debugEnabled])
  {
    uint64_t v31 = objc_opt_class();
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_462;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v31;
    if (qword_1EBD59D68 != -1) {
      dispatch_once(&qword_1EBD59D68, v53);
    }
    if (byte_1EBD59CED)
    {
      uint64_t v30 = [NSString stringWithFormat:@"Q6SW_Perf=<unknown>"];
      v32 = (void *)MEMORY[0x1E4F929B8];
      v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      uint64_t v34 = [v33 lastPathComponent];
      v35 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]"];
      [v32 logMessage:v30 fromFile:v34 fromFunction:v35 fromLineNumber:423];

      v36 = PLLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v30;
        _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v5 = 0x1E4F92000;
      goto LABEL_32;
    }
  }
LABEL_40:
  if ([(PLMav4BasebandHardwareMessage *)self adm])
  {
    uint64_t v37 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self adm] ofSize:2];
    [v13 setAdmOnOffState:v37];
LABEL_42:

    goto LABEL_50;
  }
  [v13 appendToError:@"ADM=<unknown> "];
  if ([*(id *)(v5 + 2496) debugEnabled])
  {
    uint64_t v38 = objc_opt_class();
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_471;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v38;
    if (qword_1EBD59D70 != -1) {
      dispatch_once(&qword_1EBD59D70, v52);
    }
    if (byte_1EBD59CEE)
    {
      uint64_t v37 = [NSString stringWithFormat:@"ADM=<unknown>"];
      v39 = (void *)MEMORY[0x1E4F929B8];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v41 = [v40 lastPathComponent];
      v42 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]"];
      [v39 logMessage:v37 fromFile:v41 fromFunction:v42 fromLineNumber:443];

      v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v37;
        _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_42;
    }
  }
LABEL_50:
  if ([*(id *)(v5 + 2496) debugEnabled])
  {
    uint64_t v44 = objc_opt_class();
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_477;
    v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v51[4] = v44;
    if (qword_1EBD59D78 != -1) {
      dispatch_once(&qword_1EBD59D78, v51);
    }
    if (byte_1EBD59CEF)
    {
      v45 = [NSString stringWithFormat:@"Decoded BB HW MPSS"];
      v46 = (void *)MEMORY[0x1E4F929B8];
      v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v48 = [v47 lastPathComponent];
      v49 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]"];
      [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:449];

      v50 = PLLogCommon();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v45;
        _os_log_debug_impl(&dword_1D2690000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CEA = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_444(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CEB = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_453(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CEC = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_462(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CED = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_471(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CEE = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_477(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CEF = result;
  return result;
}

- (void)logRFWithLogger2:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke;
    v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v67[4] = v5;
    if (qword_1EBD59D80 != -1) {
      dispatch_once(&qword_1EBD59D80, v67);
    }
    if (byte_1EBD59CF0)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav7BasebandHardwareMessage logRFWithLogger2:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      int v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logRFWithLogger2:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:626];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v60 = v4;
  id v12 = objc_alloc_init(PLBBMavLogMsg);
  id v13 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v12 setAgent:v13];

  [(PLBBMavLogMsg *)v12 setError:&stru_1F294E108];
  uint64_t v14 = [(PLBasebandMessage *)self seqNum];
  uint64_t v15 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  v61 = v12;
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  if (![(PLMav7BasebandHardwareMessage *)self rf])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_483;
      v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v66[4] = v16;
      if (qword_1EBD59D88 != -1) {
        dispatch_once(&qword_1EBD59D88, v66);
      }
      if (byte_1EBD59CF1)
      {
        uint64_t v17 = [NSString stringWithFormat:@"Error: BB HW RF <RAT> is expected but not present"];
        unint64_t v18 = (void *)MEMORY[0x1E4F929B8];
        v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        v20 = [v19 lastPathComponent];
        uint64_t v21 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logRFWithLogger2:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:639];

        uint64_t v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMavLogMsg *)v12 appendToError:@"Error: BB HW RF <RAT> is expected but not present"];
    [(PLBBMavLogMsg *)v12 logEventBackwardMavBBHwOtherPerRAT];
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 1272;
  uint64_t v26 = 408;
  uint64_t v27 = 720;
  unint64_t v28 = 0x1E4F92000uLL;
  do
  {
    v29 = [(PLMav7BasebandHardwareMessage *)self indexToRAT:v24];
    if ([v29 length])
    {
      [(PLBBMavLogMsg *)v61 setRat:v29];
      uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
      [(PLBBMavLogMsg *)v61 setLogDuration:v30];

      uint64_t v31 = [NSNumber numberWithInt:v24];
      [(PLBBMavLogMsg *)v61 setRadioTech:v31];

      v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", (-[PLMav4BasebandHardwareMessage header](self, "header")[16]- -[PLMav4BasebandHardwareMessage header](self, "header")[12]));
      [(PLBBMavLogMsg *)v61 setBbHwLogDurationInTicks:v32];

      uint64_t v62 = v23;
      v33 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self rf] + v23 ofSize:4];
      [(PLBBMavLogMsg *)v61 setRssiModeCount:v33];

      uint64_t v34 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self rf] + v26 - 312 ofSize:13];
      [(PLBBMavLogMsg *)v61 setRx0RssiPowerHist:v34];

      v35 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self rf] + v26 ofSize:13];
      [(PLBBMavLogMsg *)v61 setRx1RssiPowerHist:v35];

      v36 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self rf] + v25 - 264 ofSize:11];
      [(PLBBMavLogMsg *)v61 setRx0SQAPowerHist:v36];

      uint64_t v37 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self rf] + v25 ofSize:11];
      [(PLBBMavLogMsg *)v61 setRx1SQAPowerHist:v37];

      uint64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
      [(PLBBMavLogMsg *)v61 setLogDuration:v38];

      v63 = v29;
      unint64_t v28 = 0x1E4F92000uLL;
      [(PLBBMavLogMsg *)v61 setRat:v29];
      v39 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self rf] + v27 ofSize:12];
      [(PLBBMavLogMsg *)v61 setTxPowerHist:v39];

      v40 = [v60 protocolStateHistDict];
      v41 = [NSNumber numberWithInt:v24];
      v42 = [v40 objectForKey:v41];
      [(PLBBMavLogMsg *)v61 setProtocolStateHist:v42];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v43 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_495;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v43;
        if (qword_1EBD59D98 != -1) {
          dispatch_once(&qword_1EBD59D98, block);
        }
        if (byte_1EBD59CF3)
        {
          uint64_t v44 = v27;
          v45 = [NSString stringWithFormat:@"Decoded BB HW RF %@", v63];
          v46 = (void *)MEMORY[0x1E4F929B8];
          v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
          v48 = [v47 lastPathComponent];
          v49 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logRFWithLogger2:]"];
          [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:695];

          v50 = PLLogCommon();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v45;
            _os_log_debug_impl(&dword_1D2690000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v28 = 0x1E4F92000;
          uint64_t v27 = v44;
        }
      }
      uint64_t v51 = v27;
      v52 = [(PLBBMavLogMsg *)v61 logEventBackwardGrpEntriesBBMavHwOtherPerRAT];
      v53 = [v52 objectForKey:@"entry"];
      v54 = [v52 objectForKey:@"name"];
      [v60 addToGroupPLBBMavHwEntry:v53 withEntryKey:v54];

LABEL_27:
      uint64_t v23 = v62;
      v29 = v63;

      uint64_t v27 = v51;
      goto LABEL_35;
    }
    if ([*(id *)(v28 + 2496) debugEnabled])
    {
      uint64_t v55 = objc_opt_class();
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_489;
      v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v65[4] = v55;
      if (qword_1EBD59D90 != -1) {
        dispatch_once(&qword_1EBD59D90, v65);
      }
      if (byte_1EBD59CF2)
      {
        uint64_t v62 = v23;
        v63 = v29;
        uint64_t v51 = v27;
        v52 = [NSString stringWithFormat:@"Error: RAT unknown, cannot record"];
        v56 = (void *)MEMORY[0x1E4F929B8];
        v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        v58 = [v57 lastPathComponent];
        uint64_t v59 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logRFWithLogger2:]"];
        [v56 logMessage:v52 fromFile:v58 fromFunction:v59 fromLineNumber:651];

        v53 = PLLogCommon();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v52;
          _os_log_debug_impl(&dword_1D2690000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        unint64_t v28 = 0x1E4F92000;
        goto LABEL_27;
      }
    }
LABEL_35:

    ++v24;
    v25 += 44;
    v27 += 48;
    v26 += 52;
    v23 += 16;
  }
  while (v25 != 1536);
}

uint64_t __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF0 = result;
  return result;
}

uint64_t __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_483(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF1 = result;
  return result;
}

uint64_t __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_489(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF2 = result;
  return result;
}

uint64_t __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_495(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF3 = result;
  return result;
}

- (void)logProtocolActiveWithLogger:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD59DA0 != -1) {
      dispatch_once(&qword_1EBD59DA0, block);
    }
    if (byte_1EBD59CF4)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      int v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:709];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLMav7BasebandHardwareMessage *)self protocol])
  {
    id v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self protocol] + 384 ofSize:6];
    [v12 setBbActive:v13];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke_513;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v14;
      if (qword_1EBD59DB0 != -1) {
        dispatch_once(&qword_1EBD59DB0, v28);
      }
      if (byte_1EBD59CF6)
      {
        uint64_t v15 = [NSString stringWithFormat:@"Decoded BB HW Protocol Active"];
        uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        unint64_t v18 = [v17 lastPathComponent];
        v19 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:721];

        v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v15;
          _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke_507;
      v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v29[4] = v21;
      if (qword_1EBD59DA8 != -1) {
        dispatch_once(&qword_1EBD59DA8, v29);
      }
      if (byte_1EBD59CF5)
      {
        uint64_t v22 = [NSString stringWithFormat:@"Error: BB HW Protocol is expected but not present"];
        uint64_t v23 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        uint64_t v25 = [v24 lastPathComponent];
        uint64_t v26 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:712];

        uint64_t v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v22;
          _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v12 setError:@"Error: BB HW Protocol is expected but not present"];
  }
}

uint64_t __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF4 = result;
  return result;
}

uint64_t __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke_507(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF5 = result;
  return result;
}

uint64_t __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke_513(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF6 = result;
  return result;
}

- (void)logSleepVetoWithLogger:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD59DB8 != -1) {
      dispatch_once(&qword_1EBD59DB8, block);
    }
    if (byte_1EBD59CF7)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      int v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:728];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if (![(PLMav7BasebandHardwareMessage *)self mcpm_sleep_veto])
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_29;
    }
    uint64_t v23 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_519;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v23;
    if (qword_1EBD59DC0 != -1) {
      dispatch_once(&qword_1EBD59DC0, v37);
    }
    if (!byte_1EBD59CF8) {
      goto LABEL_29;
    }
    uint64_t v24 = [NSString stringWithFormat:@"Error: BB HW Sleep Veto is expected but not present"];
    uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
    uint64_t v27 = [v26 lastPathComponent];
    unint64_t v28 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]"];
    [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:745];

    v29 = PLLogCommon();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 138412290;
    v40 = v24;
    goto LABEL_32;
  }
  id v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self mcpm_sleep_veto] ofSize:6];
  [v12 setMcpmVetoNumHistogram:v13];

  if (![(PLMav7BasebandHardwareMessage *)self npa_sleep_veto])
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_29;
    }
    uint64_t v30 = objc_opt_class();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_528;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v30;
    if (qword_1EBD59DC8 != -1) {
      dispatch_once(&qword_1EBD59DC8, v36);
    }
    if (!byte_1EBD59CF9) {
      goto LABEL_29;
    }
    uint64_t v24 = [NSString stringWithFormat:@"Error: BB HW Sleep Veto is expected but not present"];
    uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
    v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
    uint64_t v33 = [v32 lastPathComponent];
    uint64_t v34 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]"];
    [v31 logMessage:v24 fromFile:v33 fromFunction:v34 fromLineNumber:765];

    v29 = PLLogCommon();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
LABEL_28:

LABEL_29:
      [v12 appendToError:@"Error: BB HW Sleep Veto is expected but not present. "];
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138412290;
    v40 = v24;
LABEL_32:
    _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_28;
  }
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto"));
  [v12 setNpaVetoMask:v14];

  uint64_t v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self npa_sleep_veto] + 4 ofSize:24];
  [v12 setNpaVetoClientNumHistogram:v15];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_531;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v16;
    if (qword_1EBD59DD0 != -1) {
      dispatch_once(&qword_1EBD59DD0, v35);
    }
    if (byte_1EBD59CFA)
    {
      uint64_t v17 = [NSString stringWithFormat:@"Decoded BB HW Sleep Veto"];
      unint64_t v18 = (void *)MEMORY[0x1E4F929B8];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      v20 = [v19 lastPathComponent];
      uint64_t v21 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:773];

      uint64_t v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v17;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
LABEL_30:
}

uint64_t __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF7 = result;
  return result;
}

uint64_t __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_519(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF8 = result;
  return result;
}

uint64_t __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_528(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CF9 = result;
  return result;
}

uint64_t __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_531(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CFA = result;
  return result;
}

- (int)GetClockCount:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  uint64_t v3 = 0;
  int result = 0;
  do
  {
    unsigned int v5 = a3->var0[v3];
    if (v5)
    {
      do
      {
        result += v5 & 1;
        BOOL v6 = v5 >= 2;
        v5 >>= 1;
      }
      while (v6);
    }
    ++v3;
  }
  while (v3 != 4);
  return result;
}

- (void)SetClocks:(_PLMav7BasebandHWStatsClockStateMask *)a3 oftype:(int)a4 withData:(char *)a5
{
  id v21 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = 0;
  int v9 = apps_clock_names_1;
  do
  {
    unsigned int v10 = a3->var0[v8];
    uint64_t v11 = v9;
    if (v10)
    {
      do
      {
        if (v10)
        {
          unsigned int v12 = *(_DWORD *)a5;
          if ([(PLMav4BasebandHardwareMessage *)self logDuration])
          {
            if ([(PLMav4BasebandHardwareMessage *)self logDuration])
            {
              float v13 = (float)v12 * 100.0 / (double)[(PLMav4BasebandHardwareMessage *)self logDuration];
              double v14 = v13;
              if (v14 > 0.01) {
                [v21 appendFormat:@" %@=[%.02f%%];", *v11, *(void *)&v14];
              }
            }
          }
          a5 += 4;
        }
        ++v11;
        BOOL v15 = v10 >= 2;
        v10 >>= 1;
      }
      while (v15);
    }
    ++v8;
    ++v9;
  }
  while (v8 != 4);
  if (a4
    || ([(PLMav7BasebandHardwareMessage *)self apps_clock_duration],
        unint64_t v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v18))
  {
    uint64_t v16 = [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration];

    if (!v16) {
      goto LABEL_17;
    }
    uint64_t v17 = [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration];
  }
  else
  {
    uint64_t v17 = [(PLMav7BasebandHardwareMessage *)self apps_clock_duration];
  }
  v19 = v17;
  [v17 appendString:v21];

LABEL_17:
}

- (void)logClockWithLogger:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLMav7BasebandHardwareMessage *)self apps_clock_duration];
  if (v5
    && (BOOL v6 = (void *)v5,
        [(PLMav7BasebandHardwareMessage *)self apps_clock_duration],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    int v9 = [(PLMav7BasebandHardwareMessage *)self apps_clock_duration];
    [v4 setAppsClockStateDurationStr:v9];
  }
  else if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __52__PLMav7BasebandHardwareMessage_logClockWithLogger___block_invoke;
      uint64_t v37 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v38 = v10;
      if (qword_1EBD59DD8 != -1) {
        dispatch_once(&qword_1EBD59DD8, &block);
      }
      if (byte_1EBD59CFB)
      {
        uint64_t v11 = [NSString stringWithFormat:@"Error: BB HW APPS Clocks is expected but not present"];
        unsigned int v12 = (void *)MEMORY[0x1E4F929B8];
        float v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        double v14 = [v13 lastPathComponent];
        BOOL v15 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logClockWithLogger:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:848];

        uint64_t v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v4 appendToError:@"Error: BB HW APPS Clocks is expected but not present. "];
  }
  uint64_t v17 = [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration];
  if (v17
    && (unint64_t v18 = (void *)v17,
        [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration],
        v19 = objc_claimAutoreleasedReturnValue(),
        uint64_t v20 = [v19 length],
        v19,
        v18,
        v20))
  {
    id v21 = [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration];
    [v4 setMpssClockStateDurationStr:v21];
  }
  else if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      uint64_t v31 = __52__PLMav7BasebandHardwareMessage_logClockWithLogger___block_invoke_546;
      v32 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v33 = v22;
      if (qword_1EBD59DE0 != -1) {
        dispatch_once(&qword_1EBD59DE0, &v29);
      }
      if (byte_1EBD59CFC)
      {
        uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Error: BB HW MPSS Clock is expected but not present", v29, v30, v31, v32, v33);
        uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        uint64_t v26 = [v25 lastPathComponent];
        uint64_t v27 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logClockWithLogger:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:876];

        unint64_t v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v23;
          _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    objc_msgSend(v4, "appendToError:", @"Error: BB HW MPSS Clock is expected but not present. ", v29, v30, v31, v32, v33, block, v35, v36, v37, v38);
  }
}

uint64_t __52__PLMav7BasebandHardwareMessage_logClockWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CFB = result;
  return result;
}

uint64_t __52__PLMav7BasebandHardwareMessage_logClockWithLogger___block_invoke_546(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CFC = result;
  return result;
}

- (void)logHSICWithLogger:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLMav7BasebandHardwareMessage *)self hsic])
  {
    uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self hsic] ofSize:8];
    [v4 setHsicStateSleepVetoNum:v5];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PLMav7BasebandHardwareMessage_logHSICWithLogger___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (qword_1EBD59DE8 != -1) {
        dispatch_once(&qword_1EBD59DE8, block);
      }
      if (byte_1EBD59CFD)
      {
        v7 = [NSString stringWithFormat:@"Error: HSIC is expected but not present"];
        uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
        int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
        uint64_t v10 = [v9 lastPathComponent];
        uint64_t v11 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logHSICWithLogger:]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:907];

        unsigned int v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v7;
          _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v4 appendToError:@"State=<unknown>;"];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __51__PLMav7BasebandHardwareMessage_logHSICWithLogger___block_invoke_561;
    uint64_t v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v24 = v13;
    if (qword_1EBD59DF0 != -1) {
      dispatch_once(&qword_1EBD59DF0, &v20);
    }
    if (byte_1EBD59CFE)
    {
      double v14 = objc_msgSend(NSString, "stringWithFormat:", @"Decoded BB HW HSIC", v20, v21, v22, v23, v24);
      BOOL v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m"];
      uint64_t v17 = [v16 lastPathComponent];
      unint64_t v18 = [NSString stringWithUTF8String:"-[PLMav7BasebandHardwareMessage logHSICWithLogger:]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:914];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__PLMav7BasebandHardwareMessage_logHSICWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CFD = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logHSICWithLogger___block_invoke_561(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59CFE = result;
  return result;
}

- (id)indexToRAT:(unint64_t)a3
{
  if (a3 > 5)
  {
    id v4 = &stru_1F294E108;
  }
  else
  {
    id v4 = *off_1E692F4C0[a3];
  }
  return v4;
}

- (_PLMav7BasebandHWStatsRFTech)rf
{
  return self->_rf;
}

- (void)setRf:(_PLMav7BasebandHWStatsRFTech *)a3
{
  self->_rf = a3;
}

- (_PLMav7BasebandHWStatsProtocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(_PLMav7BasebandHWStatsProtocol *)a3
{
  self->_protocol = a3;
}

- (_PLMav7BasebandHWStatsMCPMVeto)mcpm_sleep_veto
{
  return self->_mcpm_sleep_veto;
}

- (void)setMcpm_sleep_veto:(_PLMav7BasebandHWStatsMCPMVeto *)a3
{
  self->_mcpm_sleep_veto = a3;
}

- (_PLMav7BasebandHWStatsNPAVeto)npa_sleep_veto
{
  return self->_npa_sleep_veto;
}

- (void)setNpa_sleep_veto:(_PLMav7BasebandHWStatsNPAVeto *)a3
{
  self->_npa_sleep_veto = a3;
}

- (_PLMav7BasebandHWStatsClockStateMask)apps_clock_duration_mask
{
  return self->_apps_clock_duration_mask;
}

- (void)setApps_clock_duration_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  self->_apps_clock_duration_mask = a3;
}

- (_PLMav7BasebandHWStatsClockStateMask)mpss_clock_duration_mask
{
  return self->_mpss_clock_duration_mask;
}

- (void)setMpss_clock_duration_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  self->_mpss_clock_duration_mask = a3;
}

- (NSMutableString)apps_clock_duration
{
  return self->_apps_clock_duration;
}

- (void)setApps_clock_duration:(id)a3
{
}

- (NSMutableString)mpss_clock_duration
{
  return self->_mpss_clock_duration;
}

- (void)setMpss_clock_duration:(id)a3
{
}

- (_PLMav7BasebandHWStatsClockStateMask)apps_clock_count_mask
{
  return self->_apps_clock_count_mask;
}

- (void)setApps_clock_count_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  self->_apps_clock_count_mask = a3;
}

- (_PLMav7BasebandHWStatsClockStateMask)mpss_clock_count_mask
{
  return self->_mpss_clock_count_mask;
}

- (void)setMpss_clock_count_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  self->_mpss_clock_count_mask = a3;
}

- (_PLMav7BasebandHWStatsHSICState)hsic
{
  return self->_hsic;
}

- (void)setHsic:(_PLMav7BasebandHWStatsHSICState *)a3
{
  self->_hsic = a3;
}

- (_PLMav7BasebandGPSDPOBin)gps_dpo_bins
{
  return self->_gps_dpo_bins;
}

- (void)setGps_dpo_bins:(_PLMav7BasebandGPSDPOBin *)a3
{
  self->_gps_dpo_bins = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpss_clock_duration, 0);
  objc_storeStrong((id *)&self->_apps_clock_duration, 0);
}

@end