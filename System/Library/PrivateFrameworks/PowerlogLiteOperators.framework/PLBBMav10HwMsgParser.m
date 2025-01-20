@interface PLBBMav10HwMsgParser
- ($02140193D122F4399F556265180A383D)rfLTE;
- ($4B3C126EB6F1D3E89E2CF41D7D563E2C)rf1x;
- ($615E96CE89CC24DAA6A822A8D29B2798)rfHDR;
- ($6247608A9E858CB8A0F4CC99D4816BFE)apps_sleepNew;
- ($6247608A9E858CB8A0F4CC99D4816BFE)mpss_sleepNew;
- ($6988F191A2E699FD2FDBF2169EACE1F4)appsNew;
- ($6A53C83E73901DD0C34CF18301855816)rpmNew;
- ($791438B4249E1CB1D0E4FA5B19D8959E)qdspNew;
- ($81F89CDC83781E2F8C3B7C08B1FDA3B1)rfTDS;
- ($977EFEC0392D0530E6EA6884BB0BB487)rfWCDMA;
- ($A3D0985796EC959AD12099E5C8C6CD30)rfOOS;
- ($D38AB55F17507DDEA729FCED855170D9)rfGSM;
- ($E07DBFA35793E6ACBF53B370E2AAA817)mcpm_sleep_vetoNew;
- (BOOL)parseData:(id)a3;
- (PLBBMav10HwMsgParser)initWithData:(id)a3;
- (int)GetClockCount:(_PLMav7BasebandHWStatsClockStateMask *)a3;
- (void)SetClocks:(_PLMav7BasebandHWStatsClockStateMask *)a3 oftype:(int)a4 withData:(char *)a5;
- (void)logAPPSWithLogger:(id)a3;
- (void)logHwRF1xWithLogger:(id)a3;
- (void)logHwRFGSMWithLogger:(id)a3;
- (void)logHwRFHDRWithLogger:(id)a3;
- (void)logHwRFLTEWithLogger:(id)a3;
- (void)logHwRFOOSWithLogger:(id)a3;
- (void)logHwRFTDSWithLogger:(id)a3;
- (void)logHwRFWCDMAWithLogger:(id)a3;
- (void)logMPSSWithLogger:(id)a3;
- (void)logRPMWithLogger:(id)a3;
- (void)logSleepVetoWithLogger:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setAppsNew:(id *)a3;
- (void)setApps_sleepNew:(id *)a3;
- (void)setMcpm_sleep_vetoNew:(id *)a3;
- (void)setMpss_sleepNew:(id *)a3;
- (void)setQdspNew:(id *)a3;
- (void)setRf1x:(id *)a3;
- (void)setRfGSM:(id *)a3;
- (void)setRfHDR:(id *)a3;
- (void)setRfLTE:(id *)a3;
- (void)setRfOOS:(id *)a3;
- (void)setRfTDS:(id *)a3;
- (void)setRfWCDMA:(id *)a3;
- (void)setRpmNew:(id *)a3;
@end

@implementation PLBBMav10HwMsgParser

- (PLBBMav10HwMsgParser)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLBBMav10HwMsgParser;
  v5 = [(PLMav7BasebandHardwareMessage *)&v9 initWithData:v4];
  v6 = v5;
  if (v5 && ![(PLBBMav10HwMsgParser *)v5 parseData:v4]) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  id v235 = a3;
  id v4 = (unsigned __int8 *)[v235 bytes];
  v5 = [MEMORY[0x1E4F28E78] string];
  v6 = v5;
  if (*v4 == 129)
  {
    objc_msgSend(v5, "appendFormat:", @"SeqInd[%x] ", 129);
    v4 += 2;
  }
  [(PLMav4BasebandHardwareMessage *)self setHeader:v4 + 13];
  objc_msgSend(v6, "appendFormat:", @"Sw Rev[%0x %0x] ", v4[13], v4[14]);
  v236 = v6;
  objc_msgSend(v6, "appendFormat:", @"Hw Rev[%0x %0x] ", v4[15], v4[16]);
  v7 = v4 + 33;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v262[0] = MEMORY[0x1E4F143A8];
    v262[1] = 3221225472;
    v262[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke;
    v262[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v262[4] = v8;
    objc_super v9 = v262;
    if (qword_1EBD5BEE0 != -1) {
      dispatch_once(&qword_1EBD5BEE0, v9);
    }

    if (_MergedGlobals_94)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"RPM starts at offset %llu", 20);
      v10 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:70];

      v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLMav4BasebandHardwareMessage *)self setLogDuration:([(PLMav4BasebandHardwareMessage *)self header][16]- [(PLMav4BasebandHardwareMessage *)self header][12])];
  if ([(PLMav4BasebandHardwareMessage *)self level])
  {
    [(PLBBMav10HwMsgParser *)self setRpmNew:v4 + 33];
    v7 = v4 + 57;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      v261[0] = MEMORY[0x1E4F143A8];
      v261[1] = 3221225472;
      v261[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_381;
      v261[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v261[4] = v16;
      v17 = v261;
      if (qword_1EBD5BEE8 != -1) {
        dispatch_once(&qword_1EBD5BEE8, v17);
      }

      if (byte_1EBD5BE99)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"HW stats starts at offset %llu", 44);
        v18 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E4F929B8];
        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:84];

        v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v18;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v24 = 44;
  }
  else
  {
    uint64_t v24 = 20;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 2)
  {
    [(PLBBMav10HwMsgParser *)self setAppsNew:v7];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v25 = objc_opt_class();
      v260[0] = MEMORY[0x1E4F143A8];
      v260[1] = 3221225472;
      v260[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_387;
      v260[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v260[4] = v25;
      v26 = v260;
      if (qword_1EBD5BEF0 != -1) {
        dispatch_once(&qword_1EBD5BEF0, v26);
      }

      if (byte_1EBD5BE9A)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"HW stats Sleep starts at offset %llu", v24 + 20);
        v27 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E4F929B8];
        v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v30 = [v29 lastPathComponent];
        v31 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:97];

        v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v27;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav10HwMsgParser *)self setApps_sleepNew:v7 + 20];
    v7 += 32;
    v24 += 32;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v33 = objc_opt_class();
      v259[0] = MEMORY[0x1E4F143A8];
      v259[1] = 3221225472;
      v259[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_393;
      v259[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v259[4] = v33;
      v34 = v259;
      if (qword_1EBD5BEF8 != -1) {
        dispatch_once(&qword_1EBD5BEF8, v34);
      }

      if (byte_1EBD5BE9B)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"USB stats starts at offset %llu", v24);
        v35 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E4F929B8];
        v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v38 = [v37 lastPathComponent];
        v39 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:106];

        v40 = PLLogCommon();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v35;
          _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 3)
  {
    [(PLMav5BasebandHardwareMessage *)self setUsb:v7];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v41 = objc_opt_class();
      v258[0] = MEMORY[0x1E4F143A8];
      v258[1] = 3221225472;
      v258[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_399;
      v258[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v258[4] = v41;
      v42 = v258;
      if (qword_1EBD5BF00 != -1) {
        dispatch_once(&qword_1EBD5BF00, v42);
      }

      if (byte_1EBD5BE9C)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UART stats starts at offset %llu", v24 + 12);
        v43 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x1E4F929B8];
        v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v46 = [v45 lastPathComponent];
        v47 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:118];

        v48 = PLLogCommon();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v43;
          _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLMav4BasebandHardwareMessage *)self setUart:v7 + 12];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v49 = objc_opt_class();
      v257[0] = MEMORY[0x1E4F143A8];
      v257[1] = 3221225472;
      v257[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_405;
      v257[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v257[4] = v49;
      v50 = v257;
      if (qword_1EBD5BF08 != -1) {
        dispatch_once(&qword_1EBD5BF08, v50);
      }

      if (byte_1EBD5BE9D)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"SPI stats starts at offset %llu", v24 + 20);
        v51 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x1E4F929B8];
        v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v54 = [v53 lastPathComponent];
        v55 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:126];

        v56 = PLLogCommon();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v51;
          _os_log_debug_impl(&dword_1D2690000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLMav4BasebandHardwareMessage *)self setSpi:v7 + 20];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v57 = objc_opt_class();
      v256[0] = MEMORY[0x1E4F143A8];
      v256[1] = 3221225472;
      v256[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_411;
      v256[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v256[4] = v57;
      v58 = v256;
      if (qword_1EBD5BF10 != -1) {
        dispatch_once(&qword_1EBD5BF10, v58);
      }

      if (byte_1EBD5BE9E)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"ABAM stats starts at offset %llu", v24 + 28);
        v59 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)MEMORY[0x1E4F929B8];
        v61 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v62 = [v61 lastPathComponent];
        v63 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v60 logMessage:v59 fromFile:v62 fromFunction:v63 fromLineNumber:134];

        v64 = PLLogCommon();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v59;
          _os_log_debug_impl(&dword_1D2690000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLMav4BasebandHardwareMessage *)self setAdm:v7 + 28];
    v7 += 36;
    v24 += 36;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v65 = objc_opt_class();
      v255[0] = MEMORY[0x1E4F143A8];
      v255[1] = 3221225472;
      v255[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_417;
      v255[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v255[4] = v65;
      v66 = v255;
      if (qword_1EBD5BF18 != -1) {
        dispatch_once(&qword_1EBD5BF18, v66);
      }

      if (byte_1EBD5BE9F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"LPASS stats starts at offset %llu", v24);
        v67 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)MEMORY[0x1E4F929B8];
        v69 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v70 = [v69 lastPathComponent];
        v71 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:143];

        v72 = PLLogCommon();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v67;
          _os_log_debug_impl(&dword_1D2690000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 4)
  {
    [(PLMav5BasebandHardwareMessage *)self setLpass:v7];
    v7 += 8;
    v24 += 8;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v73 = objc_opt_class();
      v254[0] = MEMORY[0x1E4F143A8];
      v254[1] = 3221225472;
      v254[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_423;
      v254[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v254[4] = v73;
      v74 = v254;
      if (qword_1EBD5BF20 != -1) {
        dispatch_once(&qword_1EBD5BF20, v74);
      }

      if (byte_1EBD5BEA0)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Apps Sleep veto stats starts at offset %llu", v24);
        v75 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x1E4F929B8];
        v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v78 = [v77 lastPathComponent];
        v79 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v76 logMessage:v75 fromFile:v78 fromFunction:v79 fromLineNumber:155];

        v80 = PLLogCommon();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v75;
          _os_log_debug_impl(&dword_1D2690000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 5)
  {
    [(PLMav5BasebandHardwareMessage *)self setApps_sleep_veto:v7];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v81 = objc_opt_class();
      v253[0] = MEMORY[0x1E4F143A8];
      v253[1] = 3221225472;
      v253[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_429;
      v253[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v253[4] = v81;
      v82 = v253;
      if (qword_1EBD5BF28 != -1) {
        dispatch_once(&qword_1EBD5BF28, v82);
      }

      if (byte_1EBD5BEA1)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"MPSS Sleep veto stats starts at offset %llu", v24 + 4);
        v83 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)MEMORY[0x1E4F929B8];
        v85 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v86 = [v85 lastPathComponent];
        v87 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v84 logMessage:v83 fromFile:v86 fromFunction:v87 fromLineNumber:169];

        v88 = PLLogCommon();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v83;
          _os_log_debug_impl(&dword_1D2690000, v88, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLMav5BasebandHardwareMessage *)self setMpss_sleep_veto:v7 + 4];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v89 = objc_opt_class();
      v252[0] = MEMORY[0x1E4F143A8];
      v252[1] = 3221225472;
      v252[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_435;
      v252[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v252[4] = v89;
      v90 = v252;
      if (qword_1EBD5BF30 != -1) {
        dispatch_once(&qword_1EBD5BF30, v90);
      }

      if (byte_1EBD5BEA2)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"QDSP Sleep veto stats starts at offset %llu", v24 + 16);
        v91 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)MEMORY[0x1E4F929B8];
        v93 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v94 = [v93 lastPathComponent];
        v95 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v92 logMessage:v91 fromFile:v94 fromFunction:v95 fromLineNumber:177];

        v96 = PLLogCommon();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v91;
          _os_log_debug_impl(&dword_1D2690000, v96, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav10HwMsgParser *)self setQdspNew:v7 + 16];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v97 = objc_opt_class();
      v251[0] = MEMORY[0x1E4F143A8];
      v251[1] = 3221225472;
      v251[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_441;
      v251[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v251[4] = v97;
      v98 = v251;
      if (qword_1EBD5BF38 != -1) {
        dispatch_once(&qword_1EBD5BF38, v98);
      }

      if (byte_1EBD5BEA3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"GPS Sleep veto stats starts at offset %llu", v24 + 52);
        v99 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v100 = (void *)MEMORY[0x1E4F929B8];
        v101 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v102 = [v101 lastPathComponent];
        v103 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v100 logMessage:v99 fromFile:v102 fromFunction:v103 fromLineNumber:191];

        v104 = PLLogCommon();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v99;
          _os_log_debug_impl(&dword_1D2690000, v104, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLMav4BasebandHardwareMessage *)self setGps:v7 + 52];
    uint64_t v105 = v24 + 60;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v106 = objc_opt_class();
      v250[0] = MEMORY[0x1E4F143A8];
      v250[1] = 3221225472;
      v250[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_447;
      v250[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v250[4] = v106;
      v107 = v250;
      if (qword_1EBD5BF40 != -1) {
        dispatch_once(&qword_1EBD5BF40, v107);
      }

      if (byte_1EBD5BEA4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"GPS DPO stats starts at offset %llu", v24 + 60);
        v108 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v109 = (void *)MEMORY[0x1E4F929B8];
        v110 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v111 = [v110 lastPathComponent];
        v112 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v109 logMessage:v108 fromFile:v111 fromFunction:v112 fromLineNumber:199];

        v113 = PLLogCommon();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v108;
          _os_log_debug_impl(&dword_1D2690000, v113, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLMav5BasebandHardwareMessage *)self setGps_dpo:v7 + 60];
    uint64_t v114 = objc_opt_class();
    v249[0] = MEMORY[0x1E4F143A8];
    v249[1] = 3221225472;
    v249[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_453;
    v249[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v249[4] = v114;
    v115 = v249;
    if (qword_1EBD5BF48 != -1) {
      dispatch_once(&qword_1EBD5BF48, v115);
    }

    if (byte_1EBD5BEA5)
    {
      uint64_t v105 = v24 + 68;
      objc_msgSend(NSString, "stringWithFormat:", @"GPS DPO bin stats starts at offset %llu", v24 + 68);
      v116 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v117 = (void *)MEMORY[0x1E4F929B8];
      v118 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v119 = [v118 lastPathComponent];
      v120 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v117 logMessage:v116 fromFile:v119 fromFunction:v120 fromLineNumber:209];

      v121 = PLLogCommon();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v116;
        _os_log_debug_impl(&dword_1D2690000, v121, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLMav7BasebandHardwareMessage *)self setGps_dpo_bins:v7 + 68];
    uint64_t v122 = objc_opt_class();
    v248[0] = MEMORY[0x1E4F143A8];
    v248[1] = 3221225472;
    v248[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_459;
    v248[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v248[4] = v122;
    v123 = v248;
    if (qword_1EBD5BF50 != -1) {
      dispatch_once(&qword_1EBD5BF50, v123);
    }

    if (byte_1EBD5BEA6)
    {
      v105 += 24;
      objc_msgSend(NSString, "stringWithFormat:", @"MPSS sleep stats starts at offset %llu", v105);
      v124 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v125 = (void *)MEMORY[0x1E4F929B8];
      v126 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v127 = [v126 lastPathComponent];
      v128 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v125 logMessage:v124 fromFile:v127 fromFunction:v128 fromLineNumber:220];

      v129 = PLLogCommon();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v124;
        _os_log_debug_impl(&dword_1D2690000, v129, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLBBMav10HwMsgParser *)self setMpss_sleepNew:v7 + 92];
    v7 += 104;
    uint64_t v130 = objc_opt_class();
    v247[0] = MEMORY[0x1E4F143A8];
    v247[1] = 3221225472;
    v247[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_465;
    v247[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v247[4] = v130;
    v131 = v247;
    if (qword_1EBD5BF58 != -1) {
      dispatch_once(&qword_1EBD5BF58, v131);
    }

    if (byte_1EBD5BEA7)
    {
      uint64_t v24 = v105 + 12;
      objc_msgSend(NSString, "stringWithFormat:", @"Hw RF tech stats starts at offset %llu", v105 + 12);
      v132 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v133 = (void *)MEMORY[0x1E4F929B8];
      v134 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v135 = [v134 lastPathComponent];
      v136 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v133 logMessage:v132 fromFile:v135 fromFunction:v136 fromLineNumber:232];

      v137 = PLLogCommon();
      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v132;
        _os_log_debug_impl(&dword_1D2690000, v137, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v24 = v105;
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 6)
  {
    [(PLMav7BasebandHardwareMessage *)self setRf:v7];
    uint64_t v138 = objc_opt_class();
    v246[0] = MEMORY[0x1E4F143A8];
    v246[1] = 3221225472;
    v246[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_471;
    v246[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v246[4] = v138;
    v139 = v246;
    if (qword_1EBD5BF60 != -1) {
      dispatch_once(&qword_1EBD5BF60, v139);
    }

    if (byte_1EBD5BEA8)
    {
      v24 += 1536;
      objc_msgSend(NSString, "stringWithFormat:", @"Hw protocol starts at offset %llu", v24);
      v140 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v141 = (void *)MEMORY[0x1E4F929B8];
      v142 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v143 = [v142 lastPathComponent];
      v144 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v141 logMessage:v140 fromFile:v143 fromFunction:v144 fromLineNumber:247];

      v145 = PLLogCommon();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v140;
        _os_log_debug_impl(&dword_1D2690000, v145, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLMav7BasebandHardwareMessage *)self setProtocol:v7 + 1536];
    uint64_t v146 = v24 + 408;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v147 = objc_opt_class();
      v245[0] = MEMORY[0x1E4F143A8];
      v245[1] = 3221225472;
      v245[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_477;
      v245[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v245[4] = v147;
      v148 = v245;
      if (qword_1EBD5BF68 != -1) {
        dispatch_once(&qword_1EBD5BF68, v148);
      }

      if (byte_1EBD5BEA9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"New LTE stats starts at offset %llu", v24 + 408);
        v149 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v150 = (void *)MEMORY[0x1E4F929B8];
        v151 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v152 = [v151 lastPathComponent];
        v153 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
        [v150 logMessage:v149 fromFile:v152 fromFunction:v153 fromLineNumber:256];

        v154 = PLLogCommon();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v264 = v149;
          _os_log_debug_impl(&dword_1D2690000, v154, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav10HwMsgParser *)self setRfLTE:v7 + 1944];
    uint64_t v155 = objc_opt_class();
    v244[0] = MEMORY[0x1E4F143A8];
    v244[1] = 3221225472;
    v244[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_483;
    v244[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v244[4] = v155;
    v156 = v244;
    if (qword_1EBD5BF70 != -1) {
      dispatch_once(&qword_1EBD5BF70, v156);
    }

    if (byte_1EBD5BEAA)
    {
      uint64_t v146 = v24 + 668;
      objc_msgSend(NSString, "stringWithFormat:", @"WCDMA new stats starts at offset %llu", v24 + 668);
      v157 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v158 = (void *)MEMORY[0x1E4F929B8];
      v159 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v160 = [v159 lastPathComponent];
      v161 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v158 logMessage:v157 fromFile:v160 fromFunction:v161 fromLineNumber:271];

      v162 = PLLogCommon();
      if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v157;
        _os_log_debug_impl(&dword_1D2690000, v162, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLBBMav10HwMsgParser *)self setRfWCDMA:v7 + 2204];
    uint64_t v163 = objc_opt_class();
    v243[0] = MEMORY[0x1E4F143A8];
    v243[1] = 3221225472;
    v243[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_489;
    v243[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v243[4] = v163;
    v164 = v243;
    if (qword_1EBD5BF78 != -1) {
      dispatch_once(&qword_1EBD5BF78, v164);
    }

    if (byte_1EBD5BEAB)
    {
      v146 += 176;
      objc_msgSend(NSString, "stringWithFormat:", @"GSM new stats starts at offset %llu", v146);
      v165 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v166 = (void *)MEMORY[0x1E4F929B8];
      v167 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v168 = [v167 lastPathComponent];
      v169 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v166 logMessage:v165 fromFile:v168 fromFunction:v169 fromLineNumber:282];

      v170 = PLLogCommon();
      if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v165;
        _os_log_debug_impl(&dword_1D2690000, v170, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLBBMav10HwMsgParser *)self setRfGSM:v7 + 2380];
    uint64_t v171 = objc_opt_class();
    v242[0] = MEMORY[0x1E4F143A8];
    v242[1] = 3221225472;
    v242[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_495;
    v242[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v242[4] = v171;
    v172 = v242;
    if (qword_1EBD5BF80 != -1) {
      dispatch_once(&qword_1EBD5BF80, v172);
    }

    if (byte_1EBD5BEAC)
    {
      v146 += 20;
      objc_msgSend(NSString, "stringWithFormat:", @"TDS stats starts at offset %llu", v146);
      v173 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v174 = (void *)MEMORY[0x1E4F929B8];
      v175 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v176 = [v175 lastPathComponent];
      v177 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v174 logMessage:v173 fromFile:v176 fromFunction:v177 fromLineNumber:293];

      v178 = PLLogCommon();
      if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v173;
        _os_log_debug_impl(&dword_1D2690000, v178, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLBBMav10HwMsgParser *)self setRfTDS:v7 + 2400];
    uint64_t v179 = objc_opt_class();
    v241[0] = MEMORY[0x1E4F143A8];
    v241[1] = 3221225472;
    v241[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_501;
    v241[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v241[4] = v179;
    v180 = v241;
    if (qword_1EBD5BF88 != -1) {
      dispatch_once(&qword_1EBD5BF88, v180);
    }

    if (byte_1EBD5BEAD)
    {
      v146 += 48;
      objc_msgSend(NSString, "stringWithFormat:", @"1x stats starts at offset %llu", v146);
      v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v182 = (void *)MEMORY[0x1E4F929B8];
      v183 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v184 = [v183 lastPathComponent];
      v185 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v182 logMessage:v181 fromFile:v184 fromFunction:v185 fromLineNumber:304];

      v186 = PLLogCommon();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v181;
        _os_log_debug_impl(&dword_1D2690000, v186, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLBBMav10HwMsgParser *)self setRf1x:v7 + 2448];
    uint64_t v187 = objc_opt_class();
    v240[0] = MEMORY[0x1E4F143A8];
    v240[1] = 3221225472;
    v240[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_507;
    v240[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v240[4] = v187;
    v188 = v240;
    if (qword_1EBD5BF90 != -1) {
      dispatch_once(&qword_1EBD5BF90, v188);
    }

    if (byte_1EBD5BEAE)
    {
      v146 += 40;
      objc_msgSend(NSString, "stringWithFormat:", @"HDR stats starts at offset %llu", v146);
      v189 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v190 = (void *)MEMORY[0x1E4F929B8];
      v191 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v192 = [v191 lastPathComponent];
      v193 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v190 logMessage:v189 fromFile:v192 fromFunction:v193 fromLineNumber:315];

      v194 = PLLogCommon();
      if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v189;
        _os_log_debug_impl(&dword_1D2690000, v194, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLBBMav10HwMsgParser *)self setRfHDR:v7 + 2488];
    uint64_t v195 = objc_opt_class();
    v239[0] = MEMORY[0x1E4F143A8];
    v239[1] = 3221225472;
    v239[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_513;
    v239[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v239[4] = v195;
    v196 = v239;
    if (qword_1EBD5BF98 != -1) {
      dispatch_once(&qword_1EBD5BF98, v196);
    }

    if (byte_1EBD5BEAF)
    {
      v146 += 32;
      objc_msgSend(NSString, "stringWithFormat:", @"OOS stats starts at offset %llu", v146);
      v197 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v198 = (void *)MEMORY[0x1E4F929B8];
      v199 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v200 = [v199 lastPathComponent];
      v201 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v198 logMessage:v197 fromFile:v200 fromFunction:v201 fromLineNumber:326];

      v202 = PLLogCommon();
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v197;
        _os_log_debug_impl(&dword_1D2690000, v202, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLBBMav10HwMsgParser *)self setRfOOS:v7 + 2520];
    uint64_t v203 = objc_opt_class();
    v238[0] = MEMORY[0x1E4F143A8];
    v238[1] = 3221225472;
    v238[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_519;
    v238[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v238[4] = v203;
    v204 = v238;
    if (qword_1EBD5BFA0 != -1) {
      dispatch_once(&qword_1EBD5BFA0, v204);
    }

    if (byte_1EBD5BEB0)
    {
      v146 += 155;
      objc_msgSend(NSString, "stringWithFormat:", @"MCPM stats starts at offset %llu", v146);
      v205 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v206 = (void *)MEMORY[0x1E4F929B8];
      v207 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v208 = [v207 lastPathComponent];
      v209 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v206 logMessage:v205 fromFile:v208 fromFunction:v209 fromLineNumber:337];

      v210 = PLLogCommon();
      if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v205;
        _os_log_debug_impl(&dword_1D2690000, v210, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLBBMav10HwMsgParser *)self setMcpm_sleep_vetoNew:v7 + 2675];
    uint64_t v211 = objc_opt_class();
    v237[0] = MEMORY[0x1E4F143A8];
    v237[1] = 3221225472;
    v237[2] = __34__PLBBMav10HwMsgParser_parseData___block_invoke_525;
    v237[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v237[4] = v211;
    v212 = v237;
    if (qword_1EBD5BFA8 != -1) {
      dispatch_once(&qword_1EBD5BFA8, v212);
    }

    if (byte_1EBD5BEB1)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"NPA stats starts at offset %llu", v146 + 48);
      v213 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v214 = (void *)MEMORY[0x1E4F929B8];
      v215 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v216 = [v215 lastPathComponent];
      v217 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser parseData:]"];
      [v214 logMessage:v213 fromFile:v216 fromFunction:v217 fromLineNumber:348];

      v218 = PLLogCommon();
      if (os_log_type_enabled(v218, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v264 = v213;
        _os_log_debug_impl(&dword_1D2690000, v218, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(PLMav7BasebandHardwareMessage *)self setNpa_sleep_veto:v7 + 2723];
    v7 += 2823;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration_mask:v7];
    v219 = v7 + 16;
    int v220 = [(PLBBMav10HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask]];
    v221 = [MEMORY[0x1E4F28E78] string];
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration:v221];

    [(PLBBMav10HwMsgParser *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask] oftype:0 withData:v219];
    v222 = &v219[4 * v220];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration_mask:v222];
    v222 += 16;
    int v223 = [(PLBBMav10HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask]];
    v224 = [MEMORY[0x1E4F28E78] string];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration:v224];

    [(PLBBMav10HwMsgParser *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask] oftype:1 withData:v222];
    v7 = &v222[4 * v223];
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 8)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_count_mask:v7];
    uint64_t v225 = (uint64_t)&v7[4
                      * [(PLBBMav10HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_count_mask]]+ 16];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_count_mask:v225];
    uint64_t v226 = v225
         + 4
         * [(PLBBMav10HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_count_mask]];
    [(PLMav7BasebandHardwareMessage *)self setHsic:v226 + 16];
    v7 = (unsigned __int8 *)(v226 + 48);
  }
  id v227 = v235;
  unint64_t v228 = (unint64_t)&v7[-[v227 bytes]];
  unint64_t v229 = [v227 length];
  if (v228 > v229)
  {
    v230 = PLLogCommon();
    if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
    {
      id v232 = v227;
      v233 = &v7[-[v232 bytes]];
      uint64_t v234 = [v232 length];
      *(_DWORD *)buf = 134218498;
      v264 = v233;
      __int16 v265 = 2048;
      uint64_t v266 = v234;
      __int16 v267 = 2080;
      v268 = "-[PLBBMav10HwMsgParser parseData:]";
      _os_log_error_impl(&dword_1D2690000, v230, OS_LOG_TYPE_ERROR, "Expected data length %lu but recieved %lu in %s", buf, 0x20u);
    }
  }
  return v228 <= v229;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_94 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_381(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE99 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_387(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE9A = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_393(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE9B = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_399(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE9C = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_405(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE9D = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_411(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE9E = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_417(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE9F = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_423(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA0 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_429(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA1 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_435(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA2 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_441(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA3 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_447(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA4 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_453(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA5 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_459(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA6 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_465(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA7 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_471(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA8 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_477(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEA9 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_483(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEAA = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_489(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEAB = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_495(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEAC = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_501(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEAD = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_507(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEAE = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_513(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEAF = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_519(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB0 = result;
  return result;
}

uint64_t __34__PLBBMav10HwMsgParser_parseData___block_invoke_525(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB1 = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLBBMav10HwMsgParser_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5BFB0 != -1) {
      dispatch_once(&qword_1EBD5BFB0, block);
    }
    if (byte_1EBD5BEB2)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:402];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)PLBBMav10HwMsgParser;
  [(PLBasebandHardwareMessage *)&v25 logRawWithLogger:v4];
  v12 = objc_alloc_init(PLBBMavLogMsg);
  v13 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v12 setAgent:v13];

  [(PLBBMavLogMsg *)v12 setError:&stru_1F294E108];
  v14 = [(PLBasebandMessage *)self seqNum];
  v15 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  if ([(PLMav4BasebandHardwareMessage *)self sw_rev] == 6)
  {
    [(PLMav4BasebandHardwareMessage *)self logHeaderWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logRPMWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logAPPSWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logMPSSWithLogger:v12];
    [(PLMav5BasebandHardwareMessage *)self logLPASSWithLogger:v12];
    [(PLMav7BasebandHardwareMessage *)self logPeripheralsWithLogger:v12];
    [(PLMav5BasebandHardwareMessage *)self logProtocolWithLogger:v12 withCount:6];
    [(PLMav7BasebandHardwareMessage *)self logProtocolActiveWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logSleepVetoWithLogger:v12];
    if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
    {
      [(PLMav7BasebandHardwareMessage *)self logClockWithLogger:v12];
      [(PLMav7BasebandHardwareMessage *)self logHSICWithLogger:v12];
    }
    [(PLBBMavLogMsg *)v12 addToGroupPLBBMav10HwOther];
    [(PLMav7BasebandHardwareMessage *)self logRFWithLogger2:v12];
    [(PLBBMav10HwMsgParser *)self logHwRFLTEWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logHwRFWCDMAWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logHwRFGSMWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logHwRFTDSWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logHwRF1xWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logHwRFHDRWithLogger:v12];
    [(PLBBMav10HwMsgParser *)self logHwRFOOSWithLogger:v12];
    [(PLBBMavLogMsg *)v12 logEventBackwardGrpEntriesBBMav10Hw];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28E78] string];
    objc_msgSend(v16, "appendFormat:", @"Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 6);
    [(PLBBMavLogMsg *)v12 setError:v16];
    [(PLBBMavLogMsg *)v12 setType:@"BB HW Error"];
    [(PLBBMavLogMsg *)v12 logEventBackwardMavBBHwOther];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __38__PLBBMav10HwMsgParser_logWithLogger___block_invoke_546;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = v17;
      if (qword_1EBD5BFB8 != -1) {
        dispatch_once(&qword_1EBD5BFB8, v24);
      }
      if (byte_1EBD5BEB3)
      {
        v18 = [NSString stringWithFormat:@"SW version mismatch, cannot process, returning"];
        v19 = (void *)MEMORY[0x1E4F929B8];
        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logWithLogger:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:420];

        v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v18;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __38__PLBBMav10HwMsgParser_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB2 = result;
  return result;
}

uint64_t __38__PLBBMav10HwMsgParser_logWithLogger___block_invoke_546(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB3 = result;
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
    block[2] = __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5BFC0 != -1) {
      dispatch_once(&qword_1EBD5BFC0, block);
    }
    if (byte_1EBD5BEB4)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:468];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if (![(PLBBMav10HwMsgParser *)self mcpm_sleep_vetoNew])
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_29;
    }
    uint64_t v23 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_552;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v23;
    if (qword_1EBD5BFC8 != -1) {
      dispatch_once(&qword_1EBD5BFC8, v37);
    }
    if (!byte_1EBD5BEB5) {
      goto LABEL_29;
    }
    uint64_t v24 = [NSString stringWithFormat:@"Error: BB HW Sleep Veto is expected but not present"];
    objc_super v25 = (void *)MEMORY[0x1E4F929B8];
    v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
    v27 = [v26 lastPathComponent];
    v28 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]"];
    [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:477];

    uint64_t v29 = PLLogCommon();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 138412290;
    v40 = v24;
    goto LABEL_32;
  }
  v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self mcpm_sleep_vetoNew] ofSize:12];
  [v12 setMcpmVetoNumHistogram:v13];

  if (![(PLMav7BasebandHardwareMessage *)self npa_sleep_veto])
  {
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_29;
    }
    uint64_t v30 = objc_opt_class();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_562;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v30;
    if (qword_1EBD5BFD0 != -1) {
      dispatch_once(&qword_1EBD5BFD0, v36);
    }
    if (!byte_1EBD5BEB6) {
      goto LABEL_29;
    }
    uint64_t v24 = [NSString stringWithFormat:@"Error: BB HW Sleep Veto is expected but not present"];
    v31 = (void *)MEMORY[0x1E4F929B8];
    v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
    uint64_t v33 = [v32 lastPathComponent];
    v34 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]"];
    [v31 logMessage:v24 fromFile:v33 fromFunction:v34 fromLineNumber:490];

    uint64_t v29 = PLLogCommon();
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
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto"));
  [v12 setNpaVetoMask:v14];

  v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self npa_sleep_veto] + 4 ofSize:24];
  [v12 setNpaVetoClientNumHistogram:v15];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_565;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v16;
    if (qword_1EBD5BFD8 != -1) {
      dispatch_once(&qword_1EBD5BFD8, v35);
    }
    if (byte_1EBD5BEB7)
    {
      uint64_t v17 = [NSString stringWithFormat:@"Decoded BB HW Sleep Veto"];
      v18 = (void *)MEMORY[0x1E4F929B8];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v20 = [v19 lastPathComponent];
      v21 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logSleepVetoWithLogger:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:495];

      v22 = PLLogCommon();
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

uint64_t __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB4 = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_552(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB5 = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_562(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB6 = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logSleepVetoWithLogger___block_invoke_565(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB7 = result;
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
    block[2] = __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5BFE0 != -1) {
      dispatch_once(&qword_1EBD5BFE0, block);
    }
    if (byte_1EBD5BEB8)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logRPMWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logRPMWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:502];

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
  if ([(PLBBMav10HwMsgParser *)self rpmNew])
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav10HwMsgParser rpmNew](self, "rpmNew")[8]);
    [v12 setRpmXOShutDuration:v13];

    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav10HwMsgParser rpmNew](self, "rpmNew"));
    [v12 setRpmXOShutCnt:v14];

    v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav10HwMsgParser rpmNew](self, "rpmNew")[16]);
    [v12 setRpmVDDMinDuration:v15];

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rpmNew](self, "rpmNew")[4]);
    [v12 setRpmVDDMinEnterCnt:v16];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke_571;
      v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v17;
      if (qword_1EBD5BFE8 != -1) {
        dispatch_once(&qword_1EBD5BFE8, v32);
      }
      if (byte_1EBD5BEB9)
      {
        v18 = [NSString stringWithFormat:@"RPM=<unknown>"];
        v19 = (void *)MEMORY[0x1E4F929B8];
        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logRPMWithLogger:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:533];

        uint64_t v23 = PLLogCommon();
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
    v31[2] = __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke_580;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD5BFF0 != -1) {
      dispatch_once(&qword_1EBD5BFF0, v31);
    }
    if (byte_1EBD5BEBA)
    {
      objc_super v25 = [NSString stringWithFormat:@"Decoded BB HW RPM"];
      v26 = (void *)MEMORY[0x1E4F929B8];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v28 = [v27 lastPathComponent];
      uint64_t v29 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logRPMWithLogger:]"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:537];

      uint64_t v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v25;
        _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB8 = result;
  return result;
}

uint64_t __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke_571(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEB9 = result;
  return result;
}

uint64_t __41__PLBBMav10HwMsgParser_logRPMWithLogger___block_invoke_580(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEBA = result;
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
    block[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5BFF8 != -1) {
      dispatch_once(&qword_1EBD5BFF8, block);
    }
    if (byte_1EBD5BEBB)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logAPPSWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logAPPSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:543];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBBMav10HwMsgParser *)self appsNew])
  {
    v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self appsNew] ofSize:5];
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
    v47[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_589;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v14;
    if (qword_1EBD5C000 != -1) {
      dispatch_once(&qword_1EBD5C000, v47);
    }
    if (byte_1EBD5BEBC)
    {
      v13 = [NSString stringWithFormat:@"Perf_Level=<unknown>"];
      v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logAPPSWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:561];

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
  if ([(PLBBMav10HwMsgParser *)self apps_sleepNew])
  {
    v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav10HwMsgParser apps_sleepNew](self, "apps_sleepNew")[4]);
    [v12 setCxoShutDownDuration:v20];

    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav10HwMsgParser apps_sleepNew](self, "apps_sleepNew"));
    [v12 setCxoShutDownCount:v21];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_595;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v22;
      if (qword_1EBD5C008 != -1) {
        dispatch_once(&qword_1EBD5C008, v46);
      }
      if (byte_1EBD5BEBD)
      {
        uint64_t v23 = [NSString stringWithFormat:@"Sleep_Stats=<unknown>"];
        uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
        objc_super v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logAPPSWithLogger:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:580];

        v28 = PLLogCommon();
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
    uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self apps_sleep_veto] ofSize:1];
    [v12 setAppsSleepVeto:v29];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v30 = objc_opt_class();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_604;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v30;
      if (qword_1EBD5C010 != -1) {
        dispatch_once(&qword_1EBD5C010, v45);
      }
      if (byte_1EBD5BEBE)
      {
        v31 = [NSString stringWithFormat:@"Sleep_Veto_Duration=<unknown>"];
        v32 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v34 = [v33 lastPathComponent];
        v35 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logAPPSWithLogger:]"];
        [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:600];

        uint64_t v36 = PLLogCommon();
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
    v44[2] = __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_613;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v37;
    if (qword_1EBD5C018 != -1) {
      dispatch_once(&qword_1EBD5C018, v44);
    }
    if (byte_1EBD5BEBF)
    {
      v38 = [NSString stringWithFormat:@"Decoded BB HW APPS"];
      v39 = (void *)MEMORY[0x1E4F929B8];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v41 = [v40 lastPathComponent];
      v42 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logAPPSWithLogger:]"];
      [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:604];

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

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEBB = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_589(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEBC = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_595(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEBD = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_604(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEBE = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logAPPSWithLogger___block_invoke_613(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEBF = result;
  return result;
}

- (void)logMPSSWithLogger:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C020 != -1) {
      dispatch_once(&qword_1EBD5C020, block);
    }
    if (byte_1EBD5BEC0)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logMPSSWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logMPSSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:611];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBBMav10HwMsgParser *)self mpss_sleepNew])
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav10HwMsgParser mpss_sleepNew](self, "mpss_sleepNew")[4]);
    [v12 setMpssCxoShutDownDuration:v13];

    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav10HwMsgParser mpss_sleepNew](self, "mpss_sleepNew"));
    [v12 setMpssCxoShutDownCount:v14];
  }
  if ([(PLMav5BasebandHardwareMessage *)self mpss_sleep_veto])
  {
    v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav5BasebandHardwareMessage *)self mpss_sleep_veto] ofSize:3];
    [v12 setMpssSleepVeto:v15];
LABEL_12:

    goto LABEL_20;
  }
  [v12 appendToError:@"Sleep_Veto=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_622;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v16;
    if (qword_1EBD5C028 != -1) {
      dispatch_once(&qword_1EBD5C028, v46);
    }
    if (byte_1EBD5BEC1)
    {
      v15 = [NSString stringWithFormat:@"Sleep_Veto=<unknown>"];
      uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logMPSSWithLogger:]"];
      [v17 logMessage:v15 fromFile:v19 fromFunction:v20 fromLineNumber:644];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v15;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_12;
    }
  }
LABEL_20:
  if ([(PLBBMav10HwMsgParser *)self qdspNew])
  {
    uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self qdspNew] ofSize:9];
    [v12 setQdspConfigCount:v22];
LABEL_22:

    goto LABEL_30;
  }
  [v12 appendToError:@"Q6SW_Perf=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_631;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v23;
    if (qword_1EBD5C030 != -1) {
      dispatch_once(&qword_1EBD5C030, v45);
    }
    if (byte_1EBD5BEC2)
    {
      uint64_t v22 = [NSString stringWithFormat:@"Q6SW_Perf=<unknown>"];
      uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
      objc_super v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logMPSSWithLogger:]"];
      [v24 logMessage:v22 fromFile:v26 fromFunction:v27 fromLineNumber:657];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v22;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_22;
    }
  }
LABEL_30:
  if ([(PLMav4BasebandHardwareMessage *)self adm])
  {
    uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav4BasebandHardwareMessage *)self adm] ofSize:2];
    [v12 setAdmOnOffState:v29];
LABEL_32:

    goto LABEL_40;
  }
  [v12 appendToError:@"ADM=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v30 = objc_opt_class();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_640;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v30;
    if (qword_1EBD5C038 != -1) {
      dispatch_once(&qword_1EBD5C038, v44);
    }
    if (byte_1EBD5BEC3)
    {
      uint64_t v29 = [NSString stringWithFormat:@"ADM=<unknown>"];
      v31 = (void *)MEMORY[0x1E4F929B8];
      v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v33 = [v32 lastPathComponent];
      v34 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logMPSSWithLogger:]"];
      [v31 logMessage:v29 fromFile:v33 fromFunction:v34 fromLineNumber:669];

      v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v29;
        _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_32;
    }
  }
LABEL_40:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v36 = objc_opt_class();
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_646;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v36;
    if (qword_1EBD5C040 != -1) {
      dispatch_once(&qword_1EBD5C040, v43);
    }
    if (byte_1EBD5BEC4)
    {
      uint64_t v37 = [NSString stringWithFormat:@"Decoded BB HW MPSS"];
      v38 = (void *)MEMORY[0x1E4F929B8];
      v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v40 = [v39 lastPathComponent];
      uint64_t v41 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logMPSSWithLogger:]"];
      [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:673];

      v42 = PLLogCommon();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v37;
        _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC0 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_622(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC1 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_631(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC2 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_640(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC3 = result;
  return result;
}

uint64_t __42__PLBBMav10HwMsgParser_logMPSSWithLogger___block_invoke_646(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC4 = result;
  return result;
}

- (void)logHwRFLTEWithLogger:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C048 != -1) {
      dispatch_once(&qword_1EBD5C048, block);
    }
    if (byte_1EBD5BEC5)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:678];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfLTELogMsg);
  if (v13)
  {
    uint64_t v14 = [(PLBasebandMessage *)self agent];
    [(PLBBMsgRoot *)v13 setAgent:v14];

    [(PLBBMavHwRfLTELogMsg *)v13 setError:@"not set"];
    v15 = [(PLBasebandMessage *)self seqNum];
    uint64_t v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if ([(PLBBMav10HwMsgParser *)self rfLTE])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rfLTE](self, "rfLTE")- -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE")[4]));
      [(PLBBMavHwRfLTELogMsg *)v13 setLogDuration:v17];

      v18 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav10HwMsgParser rfLTE](self, "rfLTE")[12]);
      [(PLBBMavHwRfLTELogMsg *)v13 setDupMode:v18];

      v19 = [(PLBasebandHardwareMessage *)self convertUint8ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfLTE] + 16 ofSize:4];
      [(PLBBMavHwRfLTELogMsg *)v13 setCaFreqInfo:v19];

      v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfLTE] + 20 ofSize:16];
      [(PLBBMavHwRfLTELogMsg *)v13 setDlC0TBSzCnt:v20];

      v21 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfLTE] + 84 ofSize:16];
      [(PLBBMavHwRfLTELogMsg *)v13 setDlC1TBSzCnt:v21];

      uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfLTE] + 148 ofSize:12];
      [(PLBBMavHwRfLTELogMsg *)v13 setTxPwrCnt:v22];

      uint64_t v23 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfLTE] + 196 ofSize:4];
      [(PLBBMavHwRfLTELogMsg *)v13 setCaSCCCnt:v23];

      uint64_t v24 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfLTE] + 212 ofSize:6];
      [(PLBBMavHwRfLTELogMsg *)v13 setActRxTxCnt:v24];

      objc_super v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfLTE] + 236 ofSize:6];
      [(PLBBMavHwRfLTELogMsg *)v13 setSleepStateCnt:v25];

      v26 = [(PLBBMavHwRfLTELogMsg *)v13 logEventBackwardBBMav10HwRfLTE];
      v27 = [v26 objectForKey:@"entry"];
      v28 = [v26 objectForKey:@"entryKey"];
      [v12 addToGroupPLBBMavHwEntry:v27 withEntryKey:v28];

      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_29;
      }
      uint64_t v29 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_674;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v29;
      if (qword_1EBD5C060 != -1) {
        dispatch_once(&qword_1EBD5C060, v46);
      }
      if (!byte_1EBD5BEC8) {
        goto LABEL_29;
      }
      uint64_t v30 = [NSString stringWithFormat:@"Decoded enh Mav HW RF LTE"];
      v31 = (void *)MEMORY[0x1E4F929B8];
      v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v33 = [v32 lastPathComponent];
      v34 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]"];
      [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:740];

      v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = v30;
        _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v41 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_662;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v41;
      if (qword_1EBD5C058 != -1) {
        dispatch_once(&qword_1EBD5C058, v47);
      }
      if (byte_1EBD5BEC7)
      {
        v26 = [NSString stringWithFormat:@"rfLTE is not valid, return"];
        v42 = (void *)MEMORY[0x1E4F929B8];
        v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v44 = [v43 lastPathComponent];
        v45 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]"];
        [v42 logMessage:v26 fromFile:v44 fromFunction:v45 fromLineNumber:692];

        uint64_t v30 = PLLogCommon();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = v26;
        goto LABEL_32;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v36 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_653;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v36;
    if (qword_1EBD5C050 != -1) {
      dispatch_once(&qword_1EBD5C050, v48);
    }
    if (byte_1EBD5BEC6)
    {
      v26 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfLTE failed"];
      uint64_t v37 = (void *)MEMORY[0x1E4F929B8];
      v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v39 = [v38 lastPathComponent];
      v40 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFLTEWithLogger:]"];
      [v37 logMessage:v26 fromFile:v39 fromFunction:v40 fromLineNumber:682];

      uint64_t v30 = PLLogCommon();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v26;
LABEL_32:
      _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC5 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_653(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC6 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_662(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC7 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFLTEWithLogger___block_invoke_674(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC8 = result;
  return result;
}

- (void)logHwRFWCDMAWithLogger:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C068 != -1) {
      dispatch_once(&qword_1EBD5C068, block);
    }
    if (byte_1EBD5BEC9)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:745];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfWCDMALogMsg);
  if (v13)
  {
    uint64_t v14 = [(PLBasebandMessage *)self agent];
    [(PLBasebandMessage *)v13 setAgent:v14];

    [(PLBBMavHwRfWCDMALogMsg *)v13 setError:@"not set"];
    v15 = [(PLBasebandMessage *)self seqNum];
    uint64_t v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if ([(PLBBMav10HwMsgParser *)self rfWCDMA])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (-[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[4]- -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[8]));
      [(PLBBMavHwRfWCDMALogMsg *)v13 setLogDuration:v17];

      v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfWCDMA] + 12 ofSize:3];
      [(PLBBMavHwRfWCDMALogMsg *)v13 setSCEqStatCnt:v18];

      v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfWCDMA] + 24 ofSize:3];
      [(PLBBMavHwRfWCDMALogMsg *)v13 setDCEqStatCnt:v19];

      v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfWCDMA] + 36 ofSize:4];
      [(PLBBMavHwRfWCDMALogMsg *)v13 setSCQsetEqStatCnt:v20];

      v21 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfWCDMA] + 52 ofSize:4];
      [(PLBBMavHwRfWCDMALogMsg *)v13 setDCQsetEqStatCnt:v21];

      uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfWCDMA] + 68 ofSize:2];
      [(PLBBMavHwRfWCDMALogMsg *)v13 setDurInCarrierMode:v22];

      uint64_t v23 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfWCDMA] + 76 ofSize:4];
      [(PLBBMavHwRfWCDMALogMsg *)v13 setRABModeCnt:v23];

      uint64_t v24 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfWCDMA] + 92 ofSize:4];
      [(PLBBMavHwRfWCDMALogMsg *)v13 setRABTypeCnt:v24];

      objc_super v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfWCDMA] + 108 ofSize:12];
      [(PLBBMavHwRfWCDMALogMsg *)v13 setTxPwrBucket:v25];

      v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[156]);
      [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcRxOnCnt:v26];

      v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[160]);
      [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcRxTxOffCnt:v27];

      v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[164]);
      [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcTimeCnt:v28];

      uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav10HwMsgParser rfWCDMA](self, "rfWCDMA")[168]);
      [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcEnergy:v29];

      uint64_t v30 = [(PLBBMavHwRfWCDMALogMsg *)v13 logEventBackwardBBMavHwRfWCDMA];
      v31 = [v30 objectForKey:@"entry"];
      v32 = [v30 objectForKey:@"entryKey"];
      [v12 addToGroupPLBBMavHwEntry:v31 withEntryKey:v32];

      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_29;
      }
      uint64_t v33 = objc_opt_class();
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_693;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v33;
      if (qword_1EBD5C080 != -1) {
        dispatch_once(&qword_1EBD5C080, v50);
      }
      if (!byte_1EBD5BECC) {
        goto LABEL_29;
      }
      v34 = [NSString stringWithFormat:@"Decoded enh BB HW RF WCDMA"];
      v35 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]"];
      [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:814];

      v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v34;
        _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v45 = objc_opt_class();
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_687;
      v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = v45;
      if (qword_1EBD5C078 != -1) {
        dispatch_once(&qword_1EBD5C078, v51);
      }
      if (byte_1EBD5BECB)
      {
        uint64_t v30 = [NSString stringWithFormat:@"rfWCDMA is not valid, return"];
        v46 = (void *)MEMORY[0x1E4F929B8];
        v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v48 = [v47 lastPathComponent];
        uint64_t v49 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]"];
        [v46 logMessage:v30 fromFile:v48 fromFunction:v49 fromLineNumber:759];

        v34 = PLLogCommon();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 138412290;
        v55 = v30;
        goto LABEL_32;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v40 = objc_opt_class();
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_681;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v40;
    if (qword_1EBD5C070 != -1) {
      dispatch_once(&qword_1EBD5C070, v52);
    }
    if (byte_1EBD5BECA)
    {
      uint64_t v30 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfWCDMA failed"];
      uint64_t v41 = (void *)MEMORY[0x1E4F929B8];
      v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v43 = [v42 lastPathComponent];
      v44 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFWCDMAWithLogger:]"];
      [v41 logMessage:v30 fromFile:v43 fromFunction:v44 fromLineNumber:749];

      v34 = PLLogCommon();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      v55 = v30;
LABEL_32:
      _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:
}

uint64_t __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEC9 = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_681(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BECA = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_687(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BECB = result;
  return result;
}

uint64_t __47__PLBBMav10HwMsgParser_logHwRFWCDMAWithLogger___block_invoke_693(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BECC = result;
  return result;
}

- (void)logHwRFGSMWithLogger:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C088 != -1) {
      dispatch_once(&qword_1EBD5C088, block);
    }
    if (byte_1EBD5BECD)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:820];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfGSMLogMsg);
  if (!v13)
  {
    v19 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfGSM failed"];
    uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
    v31 = [v30 lastPathComponent];
    v32 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]"];
    [v29 logMessage:v19 fromFile:v31 fromFunction:v32 fromLineNumber:824];

    uint64_t v23 = PLLogCommon();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    v42 = v19;
LABEL_28:
    _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_18;
  }
  uint64_t v14 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v13 setAgent:v14];

  [(PLBBMavHwRfGSMLogMsg *)v13 setError:@"not set"];
  v15 = [(PLBasebandMessage *)self seqNum];
  uint64_t v16 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavHwRfGSMLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  if ([(PLBBMav10HwMsgParser *)self rfGSM])
  {
    uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rfGSM](self, "rfGSM")- -[PLBBMav10HwMsgParser rfGSM](self, "rfGSM")[4]));
    [(PLBBMavHwRfGSMLogMsg *)v13 setLogDuration:v17];

    v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfGSM] + 8 ofSize:3];
    [(PLBBMavHwRfGSMLogMsg *)v13 setConnState:v18];

    v19 = [(PLBBMavHwRfGSMLogMsg *)v13 logEventBackwardBBMavHwRfGSM];
    v20 = [v19 objectForKey:@"entry"];
    v21 = [v19 objectForKey:@"entryKey"];
    [v12 addToGroupPLBBMavHwEntry:v20 withEntryKey:v21];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_19;
    }
    uint64_t v22 = objc_opt_class();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke_709;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v22;
    if (qword_1EBD5C098 != -1) {
      dispatch_once(&qword_1EBD5C098, v38);
    }
    if (!byte_1EBD5BECF) {
      goto LABEL_19;
    }
    uint64_t v23 = [NSString stringWithFormat:@"Decoded enh BB HW RF GSM"];
    uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
    objc_super v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
    v26 = [v25 lastPathComponent];
    v27 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]"];
    [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:848];

    v28 = PLLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v23;
      _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_18:
LABEL_19:

    goto LABEL_20;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v33 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke_703;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v33;
    if (qword_1EBD5C090 != -1) {
      dispatch_once(&qword_1EBD5C090, v39);
    }
    if (byte_1EBD5BECE)
    {
      v19 = [NSString stringWithFormat:@"rfGSM is not valid, return"];
      v34 = (void *)MEMORY[0x1E4F929B8];
      v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v36 = [v35 lastPathComponent];
      uint64_t v37 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFGSMWithLogger:]"];
      [v34 logMessage:v19 fromFile:v36 fromFunction:v37 fromLineNumber:833];

      uint64_t v23 = PLLogCommon();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 138412290;
      v42 = v19;
      goto LABEL_28;
    }
  }
LABEL_20:
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BECD = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke_703(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BECE = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFGSMWithLogger___block_invoke_709(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BECF = result;
  return result;
}

- (void)logHwRFTDSWithLogger:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C0A0 != -1) {
      dispatch_once(&qword_1EBD5C0A0, block);
    }
    if (byte_1EBD5BED0)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:853];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfTDSLogMsg);
  if (v13)
  {
    uint64_t v14 = [(PLBasebandMessage *)self agent];
    [(PLBasebandMessage *)v13 setAgent:v14];

    [(PLBBMavHwRfTDSLogMsg *)v13 setError:@"not set"];
    v15 = [(PLBasebandMessage *)self seqNum];
    uint64_t v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if ([(PLBBMav10HwMsgParser *)self rfTDS])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rfTDS](self, "rfTDS")- -[PLBBMav10HwMsgParser rfTDS](self, "rfTDS")[4]));
      [(PLBBMavHwRfTDSLogMsg *)v13 setLogDuration:v17];

      v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfTDS] + 8 ofSize:7];
      [(PLBBMavHwRfTDSLogMsg *)v13 setSrvcTypeCnt:v18];

      v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfTDS] + 36 ofSize:3];
      [(PLBBMavHwRfTDSLogMsg *)v13 setRxdStateCnt:v19];

      v20 = [(PLBBMavHwRfTDSLogMsg *)v13 logEventBackwardBBMavHwRfTDS];
      v21 = [v20 objectForKey:@"entry"];
      uint64_t v22 = [v20 objectForKey:@"entryKey"];
      [v12 addToGroupPLBBMavHwEntry:v21 withEntryKey:v22];

      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_29;
      }
      uint64_t v23 = objc_opt_class();
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_725;
      v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v40[4] = v23;
      if (qword_1EBD5C0B8 != -1) {
        dispatch_once(&qword_1EBD5C0B8, v40);
      }
      if (!byte_1EBD5BED3) {
        goto LABEL_29;
      }
      uint64_t v24 = [NSString stringWithFormat:@"Decoded enh BB HW RF TDS"];
      objc_super v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]"];
      [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:883];

      uint64_t v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v24;
        _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v35 = objc_opt_class();
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_719;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v35;
      if (qword_1EBD5C0B0 != -1) {
        dispatch_once(&qword_1EBD5C0B0, v41);
      }
      if (byte_1EBD5BED2)
      {
        v20 = [NSString stringWithFormat:@"rfTDS is not valid, return"];
        uint64_t v36 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v38 = [v37 lastPathComponent];
        v39 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]"];
        [v36 logMessage:v20 fromFile:v38 fromFunction:v39 fromLineNumber:867];

        uint64_t v24 = PLLogCommon();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v20;
        goto LABEL_32;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v30 = objc_opt_class();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_716;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v30;
    if (qword_1EBD5C0A8 != -1) {
      dispatch_once(&qword_1EBD5C0A8, v42);
    }
    if (byte_1EBD5BED1)
    {
      v20 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfGSM failed"];
      v31 = (void *)MEMORY[0x1E4F929B8];
      v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v33 = [v32 lastPathComponent];
      v34 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFTDSWithLogger:]"];
      [v31 logMessage:v20 fromFile:v33 fromFunction:v34 fromLineNumber:857];

      uint64_t v24 = PLLogCommon();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = v20;
LABEL_32:
      _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED0 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_716(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED1 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_719(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED2 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFTDSWithLogger___block_invoke_725(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED3 = result;
  return result;
}

- (void)logHwRF1xWithLogger:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C0C0 != -1) {
      dispatch_once(&qword_1EBD5C0C0, block);
    }
    if (byte_1EBD5BED4)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:888];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRf1xLogMsg);
  if (v13)
  {
    uint64_t v14 = [(PLBasebandMessage *)self agent];
    [(PLBasebandMessage *)v13 setAgent:v14];

    [(PLBBMavHwRf1xLogMsg *)v13 setError:@"not set"];
    v15 = [(PLBasebandMessage *)self seqNum];
    uint64_t v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRf1xLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if ([(PLBBMav10HwMsgParser *)self rf1x])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rf1x](self, "rf1x")- -[PLBBMav10HwMsgParser rf1x](self, "rf1x")[4]));
      [(PLBBMavHwRf1xLogMsg *)v13 setLogDuration:v17];

      v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rf1x](self, "rf1x")[8]);
      [(PLBBMavHwRf1xLogMsg *)v13 setDtxOn:v18];

      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rf1x](self, "rf1x")[12]);
      [(PLBBMavHwRf1xLogMsg *)v13 setDtxOff:v19];

      v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rf1x] + 16 ofSize:6];
      [(PLBBMavHwRf1xLogMsg *)v13 setCallTypeDur:v20];

      v21 = [(PLBBMavHwRf1xLogMsg *)v13 logEventBackwardBBMavHwRf1x];
      uint64_t v22 = [v21 objectForKey:@"entry"];
      uint64_t v23 = [v21 objectForKey:@"entryKey"];
      [v12 addToGroupPLBBMavHwEntry:v22 withEntryKey:v23];

      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_29;
      }
      uint64_t v24 = objc_opt_class();
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_744;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v24;
      if (qword_1EBD5C0D8 != -1) {
        dispatch_once(&qword_1EBD5C0D8, v41);
      }
      if (!byte_1EBD5BED7) {
        goto LABEL_29;
      }
      objc_super v25 = [NSString stringWithFormat:@"Decoded enh BB HW RF 1x"];
      v26 = (void *)MEMORY[0x1E4F929B8];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v28 = [v27 lastPathComponent];
      uint64_t v29 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:950];

      uint64_t v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v25;
        _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v36 = objc_opt_class();
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_738;
      v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v42[4] = v36;
      if (qword_1EBD5C0D0 != -1) {
        dispatch_once(&qword_1EBD5C0D0, v42);
      }
      if (byte_1EBD5BED6)
      {
        v21 = [NSString stringWithFormat:@"rf1x is not valid, return"];
        uint64_t v37 = (void *)MEMORY[0x1E4F929B8];
        v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v39 = [v38 lastPathComponent];
        uint64_t v40 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]"];
        [v37 logMessage:v21 fromFile:v39 fromFunction:v40 fromLineNumber:901];

        objc_super v25 = PLLogCommon();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v21;
        goto LABEL_32;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v31 = objc_opt_class();
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_732;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v31;
    if (qword_1EBD5C0C8 != -1) {
      dispatch_once(&qword_1EBD5C0C8, v43);
    }
    if (byte_1EBD5BED5)
    {
      v21 = [NSString stringWithFormat:@"Error: mem alloc for logHwRf1x failed"];
      v32 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      v34 = [v33 lastPathComponent];
      uint64_t v35 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRF1xWithLogger:]"];
      [v32 logMessage:v21 fromFile:v34 fromFunction:v35 fromLineNumber:892];

      objc_super v25 = PLLogCommon();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = v21;
LABEL_32:
      _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:
}

uint64_t __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED4 = result;
  return result;
}

uint64_t __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_732(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED5 = result;
  return result;
}

uint64_t __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_738(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED6 = result;
  return result;
}

uint64_t __44__PLBBMav10HwMsgParser_logHwRF1xWithLogger___block_invoke_744(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED7 = result;
  return result;
}

- (void)logHwRFHDRWithLogger:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C0E0 != -1) {
      dispatch_once(&qword_1EBD5C0E0, block);
    }
    if (byte_1EBD5BED8)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:955];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_alloc_init(PLBBMavHwRfHDRLogMsg);
  if (v13)
  {
    uint64_t v14 = [(PLBasebandMessage *)self agent];
    [(PLBasebandMessage *)v13 setAgent:v14];

    [(PLBBMavHwRfHDRLogMsg *)v13 setError:@"not set"];
    v15 = [(PLBasebandMessage *)self seqNum];
    uint64_t v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfHDRLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if ([(PLBBMav10HwMsgParser *)self rf1x])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav10HwMsgParser rf1x](self, "rf1x")- -[PLBBMav10HwMsgParser rf1x](self, "rf1x")[4]));
      [(PLBBMavHwRfHDRLogMsg *)v13 setLogDuration:v17];

      v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[8]);
      [(PLBBMavHwRfHDRLogMsg *)v13 setSDTXOnFrame:v18];

      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[12]);
      [(PLBBMavHwRfHDRLogMsg *)v13 setSDTXOffFrame:v19];

      v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[16]);
      [(PLBBMavHwRfHDRLogMsg *)v13 setLDTXOnFrame:v20];

      v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[20]);
      [(PLBBMavHwRfHDRLogMsg *)v13 setLDTXOffFrame:v21];

      uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[24]);
      [(PLBBMavHwRfHDRLogMsg *)v13 setTDTXOnFrame:v22];

      uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfHDR](self, "rfHDR")[28]);
      [(PLBBMavHwRfHDRLogMsg *)v13 setTDTXOffFrame:v23];

      uint64_t v24 = [(PLBBMavHwRfHDRLogMsg *)v13 logEventBackwardBBMavHwRfHDR];
      objc_super v25 = [v24 objectForKey:@"entry"];
      v26 = [v24 objectForKey:@"entryKey"];
      [v12 addToGroupPLBBMavHwEntry:v25 withEntryKey:v26];

      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_29;
      }
      uint64_t v27 = objc_opt_class();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_760;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v27;
      if (qword_1EBD5C0F8 != -1) {
        dispatch_once(&qword_1EBD5C0F8, v44);
      }
      if (!byte_1EBD5BEDB) {
        goto LABEL_29;
      }
      v28 = [NSString stringWithFormat:@"Decoded enh BB HW RF HDR"];
      uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v31 = [v30 lastPathComponent];
      v32 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]"];
      [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:989];

      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v28;
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_28:
LABEL_29:

      goto LABEL_30;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v39 = objc_opt_class();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_757;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v39;
      if (qword_1EBD5C0F0 != -1) {
        dispatch_once(&qword_1EBD5C0F0, v45);
      }
      if (byte_1EBD5BEDA)
      {
        uint64_t v24 = [NSString stringWithFormat:@"rf1x is not valid, return"];
        uint64_t v40 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        v42 = [v41 lastPathComponent];
        uint64_t v43 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]"];
        [v40 logMessage:v24 fromFile:v42 fromFunction:v43 fromLineNumber:968];

        v28 = PLLogCommon();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v24;
        goto LABEL_32;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_751;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v34;
    if (qword_1EBD5C0E8 != -1) {
      dispatch_once(&qword_1EBD5C0E8, v46);
    }
    if (byte_1EBD5BED9)
    {
      uint64_t v24 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfHDR failed"];
      uint64_t v35 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      uint64_t v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFHDRWithLogger:]"];
      [v35 logMessage:v24 fromFile:v37 fromFunction:v38 fromLineNumber:959];

      v28 = PLLogCommon();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = v24;
LABEL_32:
      _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_28;
    }
  }
LABEL_30:
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED8 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_751(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BED9 = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_757(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEDA = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFHDRWithLogger___block_invoke_760(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEDB = result;
  return result;
}

- (void)logHwRFOOSWithLogger:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C100 != -1) {
      dispatch_once(&qword_1EBD5C100, block);
    }
    if (byte_1EBD5BEDC)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav10HwMsgParser logHwRFOOSWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFOOSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:994];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_opt_new();
  uint64_t v14 = [(PLBasebandMessage *)self agent];
  [v13 setAgent:v14];

  [v13 setError:&stru_1F294E108];
  v15 = [(PLBasebandMessage *)self seqNum];
  uint64_t v16 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  objc_msgSend(v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  if ([(PLBBMav10HwMsgParser *)self rfOOS])
  {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
    [v13 setLogDuration:v17];

    objc_msgSend(v13, "setOosInProgress:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS")[10]);
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS")[2]);
    [v13 setOosTicks:v18];

    v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)-[PLBBMav10HwMsgParser rfOOS](self, "rfOOS"));
    [v13 setOosTimes:v19];

    v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav10HwMsgParser rfOOS](self, "rfOOS")[6]);
    [v13 setPssiTicks:v20];

    v21 = [(PLBasebandHardwareMessage *)self convertUint16ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfOOS] + 11 ofSize:6];
    [v13 setOosGsmPssiTimes:v21];

    uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfOOS] + 59 ofSize:6];
    [v13 setOosGsmPssiStatTicks:v22];

    uint64_t v23 = [(PLBasebandHardwareMessage *)self convertUint16ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfOOS] + 23 ofSize:6];
    [v13 setOosWcdmaPssiTimes:v23];

    uint64_t v24 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfOOS] + 83 ofSize:6];
    [v13 setOosWcdmaPssiStatTicks:v24];

    objc_super v25 = [(PLBasebandHardwareMessage *)self convertUint16ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfOOS] + 35 ofSize:6];
    [v13 setOosLtePssiTimes:v25];

    v26 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfOOS] + 107 ofSize:6];
    [v13 setOosLtePssiStatTicks:v26];

    uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint16ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfOOS] + 47 ofSize:6];
    [v13 setOosTdsPssiTimes:v27];

    v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav10HwMsgParser *)self rfOOS] + 131 ofSize:6];
    [v13 setOosTdsPssiStatTicks:v28];

    uint64_t v29 = [v13 logEventBackwardBBMavHwRfOos];
    uint64_t v30 = [v29 objectForKey:@"entry"];
    uint64_t v31 = [v29 objectForKey:@"entryKey"];
    [v12 addToGroupPLBBMavHwEntry:v30 withEntryKey:v31];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v32 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke_773;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v32;
      if (qword_1EBD5C110 != -1) {
        dispatch_once(&qword_1EBD5C110, v46);
      }
      if (byte_1EBD5BEDE)
      {
        uint64_t v33 = [NSString stringWithFormat:@"Decoded enh BB HW RF OOS"];
        uint64_t v34 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        uint64_t v36 = [v35 lastPathComponent];
        uint64_t v37 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFOOSWithLogger:]"];
        [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:1049];

        v38 = PLLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v33;
          _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v39 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke_767;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v39;
      if (qword_1EBD5C108 != -1) {
        dispatch_once(&qword_1EBD5C108, v47);
      }
      if (byte_1EBD5BEDD)
      {
        uint64_t v40 = [NSString stringWithFormat:@"rfOOS is not valid, return"];
        uint64_t v41 = (void *)MEMORY[0x1E4F929B8];
        v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav10HwMsgParser.m"];
        uint64_t v43 = [v42 lastPathComponent];
        v44 = [NSString stringWithUTF8String:"-[PLBBMav10HwMsgParser logHwRFOOSWithLogger:]"];
        [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:1004];

        uint64_t v45 = PLLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v40;
          _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v13 setError:@"rfOOS is not valid, return"];
  }
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEDC = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke_767(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEDD = result;
  return result;
}

uint64_t __45__PLBBMav10HwMsgParser_logHwRFOOSWithLogger___block_invoke_773(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BEDE = result;
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
  id v20 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = 0;
  objc_super v9 = apps_clock_names;
  do
  {
    unsigned int v10 = a3->var0[v8];
    v11 = v9;
    if (v10)
    {
      do
      {
        if (v10)
        {
          uint64_t v12 = *(unsigned int *)a5;
          if ([(PLMav4BasebandHardwareMessage *)self logDuration])
          {
            if ([(PLMav4BasebandHardwareMessage *)self logDuration])
            {
              float v13 = (float)v12
                  * 100.0
                  / (double)[(PLMav4BasebandHardwareMessage *)self logDuration];
              if (v13 > 0.01) {
                [v20 appendFormat:@" %@=[%d];", *v11, v12];
              }
            }
          }
          a5 += 4;
        }
        ++v11;
        BOOL v14 = v10 >= 2;
        v10 >>= 1;
      }
      while (v14);
    }
    ++v8;
    ++v9;
  }
  while (v8 != 4);
  if (a4
    || ([(PLMav7BasebandHardwareMessage *)self apps_clock_duration],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        !v17))
  {
    v15 = [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration];

    if (!v15) {
      goto LABEL_17;
    }
    uint64_t v16 = [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration];
  }
  else
  {
    uint64_t v16 = [(PLMav7BasebandHardwareMessage *)self apps_clock_duration];
  }
  v18 = v16;
  [v16 appendString:v20];

LABEL_17:
}

- ($02140193D122F4399F556265180A383D)rfLTE
{
  return self->_rfLTE;
}

- (void)setRfLTE:(id *)a3
{
  self->_rfLTE = a3;
}

- ($977EFEC0392D0530E6EA6884BB0BB487)rfWCDMA
{
  return self->_rfWCDMA;
}

- (void)setRfWCDMA:(id *)a3
{
  self->_rfWCDMA = a3;
}

- ($D38AB55F17507DDEA729FCED855170D9)rfGSM
{
  return self->_rfGSM;
}

- (void)setRfGSM:(id *)a3
{
  self->_rfGSM = a3;
}

- ($81F89CDC83781E2F8C3B7C08B1FDA3B1)rfTDS
{
  return self->_rfTDS;
}

- (void)setRfTDS:(id *)a3
{
  self->_rfTDS = a3;
}

- ($4B3C126EB6F1D3E89E2CF41D7D563E2C)rf1x
{
  return self->_rf1x;
}

- (void)setRf1x:(id *)a3
{
  self->_rf1x = a3;
}

- ($615E96CE89CC24DAA6A822A8D29B2798)rfHDR
{
  return self->_rfHDR;
}

- (void)setRfHDR:(id *)a3
{
  self->_rfHDR = a3;
}

- ($A3D0985796EC959AD12099E5C8C6CD30)rfOOS
{
  return self->_rfOOS;
}

- (void)setRfOOS:(id *)a3
{
  self->_rfOOS = a3;
}

- ($6A53C83E73901DD0C34CF18301855816)rpmNew
{
  return self->_rpmNew;
}

- (void)setRpmNew:(id *)a3
{
  self->_rpmNew = a3;
}

- ($6247608A9E858CB8A0F4CC99D4816BFE)apps_sleepNew
{
  return self->_apps_sleepNew;
}

- (void)setApps_sleepNew:(id *)a3
{
  self->_apps_sleepNew = a3;
}

- ($6247608A9E858CB8A0F4CC99D4816BFE)mpss_sleepNew
{
  return self->_mpss_sleepNew;
}

- (void)setMpss_sleepNew:(id *)a3
{
  self->_mpss_sleepNew = a3;
}

- ($6988F191A2E699FD2FDBF2169EACE1F4)appsNew
{
  return self->_appsNew;
}

- (void)setAppsNew:(id *)a3
{
  self->_appsNew = a3;
}

- ($791438B4249E1CB1D0E4FA5B19D8959E)qdspNew
{
  return self->_qdspNew;
}

- (void)setQdspNew:(id *)a3
{
  self->_qdspNew = a3;
}

- ($E07DBFA35793E6ACBF53B370E2AAA817)mcpm_sleep_vetoNew
{
  return self->_mcpm_sleep_vetoNew;
}

- (void)setMcpm_sleep_vetoNew:(id *)a3
{
  self->_mcpm_sleep_vetoNew = a3;
}

@end