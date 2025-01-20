@interface PLBBMav16BHwMsgParser
- ($092601FE6E8A40A76BE67D22268BABC6)mav16BAppsSleepVeto;
- ($115C4C562B26FF47E01F9F4EA65B5887)mav16BAppsPerf;
- ($2AB8F159037074AE77C0B0674ED46DA0)rfEnhLTEMav16B;
- ($4D5A38CE05C84672617F6ACDBB187D60)mcpmSleepVetoMav16B;
- ($C9B0E9DB1B0C68408F3136D0BD3A897E)mav16BQdspSpeed;
- ($E0EEEB5BA8699BABA569A46DBC0146B0)rfEnhWCDMAMav16B;
- ($FB43E548459D050BA5797B0FF6452E7F)mav16BMpssSleepVeto;
- (BOOL)parseData:(id)a3;
- (void)logMav16BAppsPerfWithLogger:(id)a3;
- (void)logMav16BHwRFEnhLTEWithLogger:(id)a3;
- (void)logMav16BMPSSWithLogger:(id)a3;
- (void)logMav16HwRFEnhWCDMAWithLogger:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setMav16BAppsPerf:(id *)a3;
- (void)setMav16BAppsSleepVeto:(id *)a3;
- (void)setMav16BMpssSleepVeto:(id *)a3;
- (void)setMav16BQdspSpeed:(id *)a3;
- (void)setMcpmSleepVetoMav16B:(id *)a3;
- (void)setRfEnhLTEMav16B:(id *)a3;
- (void)setRfEnhWCDMAMav16B:(id *)a3;
@end

@implementation PLBBMav16BHwMsgParser

- (BOOL)parseData:(id)a3
{
  uint64_t v524 = *MEMORY[0x1E4F143B8];
  id v439 = a3;
  v4 = (unsigned __int8 *)[v439 bytes];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v517[0] = MEMORY[0x1E4F143A8];
    v517[1] = 3221225472;
    v517[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke;
    v517[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v517[4] = v5;
    v6 = v517;
    if (qword_1EBD5B978 != -1) {
      dispatch_once(&qword_1EBD5B978, v6);
    }

    if (_MergedGlobals_81)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Received data of length %lu", objc_msgSend(v439, "length"));
      v7 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:34];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v519 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v13 = [MEMORY[0x1E4F28E78] string];
  v440 = v13;
  if (*v4 == 129)
  {
    objc_msgSend(v13, "appendFormat:", @"SeqInd[%x] ", 129);
    v4 += 2;
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v516[0] = MEMORY[0x1E4F143A8];
    v516[1] = 3221225472;
    v516[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_375;
    v516[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v516[4] = v15;
    v16 = v516;
    if (qword_1EBD5B980 != -1) {
      dispatch_once(&qword_1EBD5B980, v16);
    }

    if (byte_1EBD5B921)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Log header starts at offset %llu", v14);
      v17 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E4F929B8];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v20 = [v19 lastPathComponent];
      v21 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:46];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v519 = v17;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v515[0] = MEMORY[0x1E4F143A8];
    v515[1] = 3221225472;
    v515[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_381;
    v515[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v515[4] = v23;
    v24 = v515;
    if (qword_1EBD5B988 != -1) {
      dispatch_once(&qword_1EBD5B988, v24);
    }

    if (byte_1EBD5B922)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Stats header starts at offset %llu", v14 | 0xD);
      v25 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E4F929B8];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v28 = [v27 lastPathComponent];
      v29 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:50];

      v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v519 = v25;
        _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLMav4BasebandHardwareMessage *)self setHeader:v4 + 13];
  objc_msgSend(v440, "appendFormat:", @"Sw Rev[%0x %0x] ", v4[13], v4[14]);
  objc_msgSend(v440, "appendFormat:", @"Hw Rev[%0x %0x] ", v4[15], v4[16]);
  unint64_t v31 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    v514[0] = MEMORY[0x1E4F143A8];
    v514[1] = 3221225472;
    v514[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_393;
    v514[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v514[4] = v32;
    v33 = v514;
    if (qword_1EBD5B990 != -1) {
      dispatch_once(&qword_1EBD5B990, v33);
    }

    unint64_t v31 = 0x1E4F92000;
    if (byte_1EBD5B923)
    {
      v34 = [NSString stringWithFormat:@"Header Info: %@", v440];
      v35 = (void *)MEMORY[0x1E4F929B8];
      v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
      [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:56];

      v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v519 = v34;
        _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  v40 = v4 + 33;
  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v41 = objc_opt_class();
    v513[0] = MEMORY[0x1E4F143A8];
    v513[1] = 3221225472;
    v513[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_399;
    v513[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v513[4] = v41;
    v42 = v513;
    if (qword_1EBD5B998 != -1) {
      dispatch_once(&qword_1EBD5B998, v42);
    }

    if (byte_1EBD5B924)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Size after Seq and Statsheader %lu", objc_msgSend(v439, "length") - 22);
      v43 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E4F929B8];
      v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v46 = [v45 lastPathComponent];
      v47 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
      [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:61];

      v48 = PLLogCommon();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v519 = v43;
        _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v40 = v4 + 33;
    }
  }
  uint64_t v49 = v14 | 0x21;
  [(PLMav4BasebandHardwareMessage *)self setLogDuration:([(PLMav4BasebandHardwareMessage *)self header][16]- [(PLMav4BasebandHardwareMessage *)self header][12])];
  unint64_t v50 = 0x1E4F92000uLL;
  if ([(PLMav4BasebandHardwareMessage *)self level])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v51 = objc_opt_class();
      v512[0] = MEMORY[0x1E4F143A8];
      v512[1] = 3221225472;
      v512[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_405;
      v512[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v512[4] = v51;
      v52 = v512;
      if (qword_1EBD5B9A0 != -1) {
        dispatch_once(&qword_1EBD5B9A0, v52);
      }

      if (byte_1EBD5B925)
      {
        uint64_t v53 = v14;
        v54 = v40;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 1: RPM starts at offset %llu", v49);
        v55 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E4F929B8];
        v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v58 = [v57 lastPathComponent];
        v59 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:68];

        v60 = PLLogCommon();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v55;
          _os_log_debug_impl(&dword_1D2690000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v50 = 0x1E4F92000uLL;
        v40 = v54;
        uint64_t v14 = v53;
      }
    }
    [(PLBBMav13HwMsgParser *)self setRpmData:v40];
    v40 = v4 + 57;
    uint64_t v49 = v14 | 0x39;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 2)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v61 = objc_opt_class();
      v511[0] = MEMORY[0x1E4F143A8];
      v511[1] = 3221225472;
      v511[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_411;
      v511[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v511[4] = v61;
      v62 = v511;
      if (qword_1EBD5B9A8 != -1) {
        dispatch_once(&qword_1EBD5B9A8, v62);
      }

      if (byte_1EBD5B926)
      {
        v63 = v40;
        uint64_t v64 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 2: Apps Perf starts at offset %llu", v49);
        v65 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)MEMORY[0x1E4F929B8];
        v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v68 = [v67 lastPathComponent];
        v69 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v66 logMessage:v65 fromFile:v68 fromFunction:v69 fromLineNumber:77];

        v70 = PLLogCommon();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v65;
          _os_log_debug_impl(&dword_1D2690000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v63;
        uint64_t v49 = v64;
      }
    }
    [(PLBBMav16BHwMsgParser *)self setMav16BAppsPerf:v40];
    v71 = v40 + 32;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v72 = objc_opt_class();
      v510[0] = MEMORY[0x1E4F143A8];
      v510[1] = 3221225472;
      v510[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_417;
      v510[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v510[4] = v72;
      v73 = v510;
      if (qword_1EBD5B9B0 != -1) {
        dispatch_once(&qword_1EBD5B9B0, v73);
      }

      if (byte_1EBD5B927)
      {
        v74 = v40;
        uint64_t v441 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 2: Apps Sleep starts at offset %llu", v49 + 32);
        v75 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x1E4F929B8];
        v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v78 = [v77 lastPathComponent];
        v79 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v76 logMessage:v75 fromFile:v78 fromFunction:v79 fromLineNumber:82];

        v80 = PLLogCommon();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v75;
          _os_log_debug_impl(&dword_1D2690000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v74;
        uint64_t v49 = v441;
      }
    }
    [(PLBBMav13HwMsgParser *)self setAppsSleep:v71];
    v40 += 44;
    v49 += 44;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 3)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v81 = objc_opt_class();
      v509[0] = MEMORY[0x1E4F143A8];
      v509[1] = 3221225472;
      v509[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_423;
      v509[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v509[4] = v81;
      v82 = v509;
      if (qword_1EBD5B9B8 != -1) {
        dispatch_once(&qword_1EBD5B9B8, v82);
      }

      if (byte_1EBD5B928)
      {
        v83 = v40;
        uint64_t v84 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 3: PCIE stats starts at offset %llu", v49);
        v85 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v86 = (void *)MEMORY[0x1E4F929B8];
        v87 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v88 = [v87 lastPathComponent];
        v89 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v86 logMessage:v85 fromFile:v88 fromFunction:v89 fromLineNumber:91];

        v90 = PLLogCommon();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v85;
          _os_log_debug_impl(&dword_1D2690000, v90, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v83;
        uint64_t v49 = v84;
      }
    }
    [(PLBBMav13HwMsgParser *)self setPcieState:v40];
    v40 += 12;
    v49 += 12;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 4)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v91 = objc_opt_class();
      v508[0] = MEMORY[0x1E4F143A8];
      v508[1] = 3221225472;
      v508[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_429;
      v508[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v508[4] = v91;
      v92 = v508;
      if (qword_1EBD5B9C0 != -1) {
        dispatch_once(&qword_1EBD5B9C0, v92);
      }

      if (byte_1EBD5B929)
      {
        v93 = v40;
        uint64_t v94 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 4: LPASS stats starts at offset %llu", v49);
        v95 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v96 = (void *)MEMORY[0x1E4F929B8];
        v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v98 = [v97 lastPathComponent];
        v99 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v96 logMessage:v95 fromFile:v98 fromFunction:v99 fromLineNumber:100];

        v100 = PLLogCommon();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v95;
          _os_log_debug_impl(&dword_1D2690000, v100, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v93;
        uint64_t v49 = v94;
      }
    }
    [(PLBBMav13HwMsgParser *)self setLpassState:v40];
    v40 += 8;
    v49 += 8;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 5)
  {
    v101 = v40;
    uint64_t v442 = v49;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v102 = objc_opt_class();
      v507[0] = MEMORY[0x1E4F143A8];
      v507[1] = 3221225472;
      v507[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_435;
      v507[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v507[4] = v102;
      v103 = v507;
      if (qword_1EBD5B9C8 != -1) {
        dispatch_once(&qword_1EBD5B9C8, v103);
      }

      if (byte_1EBD5B92A)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: Apps Sleep veto stats starts at offset %llu", v49);
        v104 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v105 = (void *)MEMORY[0x1E4F929B8];
        v106 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v107 = [v106 lastPathComponent];
        v108 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v105 logMessage:v104 fromFile:v107 fromFunction:v108 fromLineNumber:109];

        v109 = PLLogCommon();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v104;
          _os_log_debug_impl(&dword_1D2690000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v442;
      }
    }
    [(PLBBMav16BHwMsgParser *)self setMav16BAppsSleepVeto:v40];
    v110 = v40 + 16;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v111 = objc_opt_class();
      v506[0] = MEMORY[0x1E4F143A8];
      v506[1] = 3221225472;
      v506[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_441;
      v506[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v506[4] = v111;
      v112 = v506;
      if (qword_1EBD5B9D0 != -1) {
        dispatch_once(&qword_1EBD5B9D0, v112);
      }

      if (byte_1EBD5B92B)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: MPSS Sleep veto stats starts at offset %llu", v49 + 16);
        v113 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v114 = (void *)MEMORY[0x1E4F929B8];
        v115 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v116 = [v115 lastPathComponent];
        v117 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v114 logMessage:v113 fromFile:v116 fromFunction:v117 fromLineNumber:114];

        v118 = PLLogCommon();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v113;
          _os_log_debug_impl(&dword_1D2690000, v118, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v442;
      }
    }
    [(PLBBMav16BHwMsgParser *)self setMav16BMpssSleepVeto:v110];
    v119 = v40 + 100;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v120 = objc_opt_class();
      v505[0] = MEMORY[0x1E4F143A8];
      v505[1] = 3221225472;
      v505[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_447;
      v505[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v505[4] = v120;
      v121 = v505;
      if (qword_1EBD5B9D8 != -1) {
        dispatch_once(&qword_1EBD5B9D8, v121);
      }

      if (byte_1EBD5B92C)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: QDSP Sleep veto stats starts at offset %llu", v49 + 100);
        v122 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v123 = (void *)MEMORY[0x1E4F929B8];
        v124 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v125 = [v124 lastPathComponent];
        v126 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v123 logMessage:v122 fromFile:v125 fromFunction:v126 fromLineNumber:119];

        v127 = PLLogCommon();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v122;
          _os_log_debug_impl(&dword_1D2690000, v127, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v442;
      }
    }
    [(PLBBMav16BHwMsgParser *)self setMav16BQdspSpeed:v119];
    v128 = v40 + 144;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v129 = objc_opt_class();
      v504[0] = MEMORY[0x1E4F143A8];
      v504[1] = 3221225472;
      v504[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_453;
      v504[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v504[4] = v129;
      v130 = v504;
      if (qword_1EBD5B9E0 != -1) {
        dispatch_once(&qword_1EBD5B9E0, v130);
      }

      if (byte_1EBD5B92D)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: MPSS Sleep stats starts at offset %llu", v49 + 144);
        v131 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v132 = (void *)MEMORY[0x1E4F929B8];
        v133 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v134 = [v133 lastPathComponent];
        v135 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v132 logMessage:v131 fromFile:v134 fromFunction:v135 fromLineNumber:124];

        v136 = PLLogCommon();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v131;
          _os_log_debug_impl(&dword_1D2690000, v136, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v442;
      }
    }
    [(PLBBMav13HwMsgParser *)self setMpssSleep:v128];
    v137 = v40 + 156;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v138 = objc_opt_class();
      v503[0] = MEMORY[0x1E4F143A8];
      v503[1] = 3221225472;
      v503[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_459;
      v503[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v503[4] = v138;
      v139 = v503;
      if (qword_1EBD5B9E8 != -1) {
        dispatch_once(&qword_1EBD5B9E8, v139);
      }

      if (byte_1EBD5B92E)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS stats starts at offset %llu", v49 + 156);
        v140 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v141 = (void *)MEMORY[0x1E4F929B8];
        v142 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v143 = [v142 lastPathComponent];
        v144 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v141 logMessage:v140 fromFile:v143 fromFunction:v144 fromLineNumber:129];

        v145 = PLLogCommon();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v140;
          _os_log_debug_impl(&dword_1D2690000, v145, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v442;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsState:v137];
    v146 = v40 + 164;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v147 = objc_opt_class();
      v502[0] = MEMORY[0x1E4F143A8];
      v502[1] = 3221225472;
      v502[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_465;
      v502[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v502[4] = v147;
      v148 = v502;
      if (qword_1EBD5B9F0 != -1) {
        dispatch_once(&qword_1EBD5B9F0, v148);
      }

      if (byte_1EBD5B92F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS DPO stats starts at offset %llu", v49 + 164);
        v149 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v150 = (void *)MEMORY[0x1E4F929B8];
        v151 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v152 = [v151 lastPathComponent];
        v153 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v150 logMessage:v149 fromFile:v152 fromFunction:v153 fromLineNumber:134];

        v154 = PLLogCommon();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v149;
          _os_log_debug_impl(&dword_1D2690000, v154, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v442;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsDpoState:v146];
    v155 = v40 + 172;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v156 = objc_opt_class();
      v501[0] = MEMORY[0x1E4F143A8];
      v501[1] = 3221225472;
      v501[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_471;
      v501[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v501[4] = v156;
      v157 = v501;
      if (qword_1EBD5B9F8 != -1) {
        dispatch_once(&qword_1EBD5B9F8, v157);
      }

      if (byte_1EBD5B930)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS DPO bin stats starts at offset %llu", v49 + 172);
        v158 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v159 = (void *)MEMORY[0x1E4F929B8];
        v160 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v161 = [v160 lastPathComponent];
        v162 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v159 logMessage:v158 fromFile:v161 fromFunction:v162 fromLineNumber:139];

        v163 = PLLogCommon();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v158;
          _os_log_debug_impl(&dword_1D2690000, v163, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v442;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsDpoBins:v155];
    v40 += 196;
    v49 += 196;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 6)
  {
    v447 = v40;
    uint64_t v443 = v49;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v164 = objc_opt_class();
      v500[0] = MEMORY[0x1E4F143A8];
      v500[1] = 3221225472;
      v500[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_477;
      v500[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v500[4] = v164;
      v165 = v500;
      if (qword_1EBD5BA00 != -1) {
        dispatch_once(&qword_1EBD5BA00, v165);
      }

      if (byte_1EBD5B931)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: MCPM Sleep veto starts at offset %llu", v49);
        v166 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v167 = (void *)MEMORY[0x1E4F929B8];
        v168 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v169 = [v168 lastPathComponent];
        v170 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v167 logMessage:v166 fromFile:v169 fromFunction:v170 fromLineNumber:148];

        v171 = PLLogCommon();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v166;
          _os_log_debug_impl(&dword_1D2690000, v171, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v447;
        uint64_t v49 = v443;
      }
    }
    [(PLBBMav16BHwMsgParser *)self setMcpmSleepVetoMav16B:v40];
    v172 = v40 + 56;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v173 = objc_opt_class();
      v499[0] = MEMORY[0x1E4F143A8];
      v499[1] = 3221225472;
      v499[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_483;
      v499[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v499[4] = v173;
      v174 = v499;
      if (qword_1EBD5BA08 != -1) {
        dispatch_once(&qword_1EBD5BA08, v174);
      }

      if (byte_1EBD5B932)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Protocol Active starts at offset %llu", v49 + 56);
        v175 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v176 = (void *)MEMORY[0x1E4F929B8];
        v177 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v178 = [v177 lastPathComponent];
        v179 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v176 logMessage:v175 fromFile:v178 fromFunction:v179 fromLineNumber:153];

        v180 = PLLogCommon();
        if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v175;
          _os_log_debug_impl(&dword_1D2690000, v180, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v447;
        uint64_t v49 = v443;
      }
    }
    [(PLBBMav13HwMsgParser *)self setProtocolActive:v172];
    v181 = v40 + 80;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v182 = objc_opt_class();
      v498[0] = MEMORY[0x1E4F143A8];
      v498[1] = 3221225472;
      v498[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_489;
      v498[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v498[4] = v182;
      v183 = v498;
      if (qword_1EBD5BA10 != -1) {
        dispatch_once(&qword_1EBD5BA10, v183);
      }

      if (byte_1EBD5B933)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Optim mask starts at offset %llu", v49 + 80);
        v184 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v185 = (void *)MEMORY[0x1E4F929B8];
        v186 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v187 = [v186 lastPathComponent];
        v188 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v185 logMessage:v184 fromFile:v187 fromFunction:v188 fromLineNumber:158];

        v189 = PLLogCommon();
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v184;
          _os_log_debug_impl(&dword_1D2690000, v189, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v447;
        uint64_t v49 = v443;
      }
    }
    [(PLBBMav13HwMsgParser *)self setOptimMaskArray:v181];
    if ([(PLBBMav13HwMsgParser *)self optimMaskArray]) {
      NSLog(&cfstr_NotNull.isa);
    }
    if ([MEMORY[0x1E4F929C0] isClassDebugEnabled:objc_opt_class()])
    {
      uint64_t v190 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", *(unsigned __int8 *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
      v191 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1]);
      v192 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2]);
      v193 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[3]);
      v446 = (void *)v190;
      v194 = [NSString stringWithFormat:@"Optim Mask [%@ %@ %@ %@]", v190, v191, v192, v193];
      v195 = (void *)MEMORY[0x1E4F929B8];
      v196 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v197 = [v196 lastPathComponent];
      v198 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
      [v195 logMessage:v194 fromFile:v197 fromFunction:v198 fromLineNumber:169];

      v199 = PLLogCommon();
      if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v519 = v194;
        _os_log_debug_impl(&dword_1D2690000, v199, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v50 = 0x1E4F92000uLL;
      v40 = v447;
      uint64_t v49 = v443;
    }
    v49 += 84;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v200 = objc_opt_class();
      v497[0] = MEMORY[0x1E4F143A8];
      v497[1] = 3221225472;
      v497[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_504;
      v497[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v497[4] = v200;
      v201 = v497;
      if (qword_1EBD5BA18 != -1) {
        dispatch_once(&qword_1EBD5BA18, v201);
      }

      if (byte_1EBD5B934)
      {
        uint64_t v202 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Protocol State starts at offset %llu", v49);
        v203 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v204 = (void *)MEMORY[0x1E4F929B8];
        v205 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v206 = [v205 lastPathComponent];
        v207 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v204 logMessage:v203 fromFile:v206 fromFunction:v207 fromLineNumber:173];

        v208 = PLLogCommon();
        if (os_log_type_enabled(v208, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v203;
          _os_log_debug_impl(&dword_1D2690000, v208, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v50 = 0x1E4F92000uLL;
        uint64_t v49 = v202;
      }
    }
    v40 += 84;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v209 = objc_opt_class();
      v496[0] = MEMORY[0x1E4F143A8];
      v496[1] = 3221225472;
      v496[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_510;
      v496[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v496[4] = v209;
      v210 = v496;
      if (qword_1EBD5BA20 != -1) {
        dispatch_once(&qword_1EBD5BA20, v210);
      }

      if (byte_1EBD5B935)
      {
        uint64_t v211 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Optim mask value [0x%x]", *(unsigned int *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
        v212 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v213 = (void *)MEMORY[0x1E4F929B8];
        v214 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v215 = [v214 lastPathComponent];
        v216 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v213 logMessage:v212 fromFile:v215 fromFunction:v216 fromLineNumber:178];

        v217 = PLLogCommon();
        if (os_log_type_enabled(v217, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v212;
          _os_log_debug_impl(&dword_1D2690000, v217, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v50 = 0x1E4F92000uLL;
        uint64_t v49 = v211;
      }
    }
    +[PLBBMav13HwMsgParser optimMaskMappings];
    v445 = uint64_t v218 = 0;
    v417 = v452;
    v437 = v462;
    v438 = v454;
    v435 = v458;
    v436 = v460;
    v433 = v464;
    v434 = v456;
    v431 = v468;
    v432 = v466;
    v429 = v472;
    v430 = v470;
    v428 = v474;
    v426 = v478;
    v427 = v476;
    v424 = v482;
    v425 = v480;
    v422 = v486;
    v423 = v484;
    v420 = v490;
    v421 = v488;
    v418 = v494;
    v419 = v492;
    v448 = self;
    do
    {
      if ((*(_DWORD *)[(PLBBMav13HwMsgParser *)self optimMaskArray] >> v218))
      {
        if ([*(id *)(v50 + 2496) debugEnabled])
        {
          uint64_t v219 = objc_opt_class();
          v495[0] = MEMORY[0x1E4F143A8];
          v495[1] = 3221225472;
          v495[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_517;
          v495[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v495[4] = v219;
          v220 = v495;
          if (qword_1EBD5BA28 != -1) {
            dispatch_once(&qword_1EBD5BA28, v220);
          }

          if (byte_1EBD5B936)
          {
            v221 = NSString;
            v222 = [NSNumber numberWithUnsignedInt:v218];
            v223 = [v445 objectForKeyedSubscript:v222];
            v224 = v40;
            uint64_t v225 = v49;
            v226 = [v221 stringWithFormat:@"Payload %@ is present at offset %llu, pointer %ld", v223, v49, v40];

            v227 = (void *)MEMORY[0x1E4F929B8];
            v228 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v229 = [v228 lastPathComponent];
            v230 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v227 logMessage:v226 fromFile:v229 fromFunction:v230 fromLineNumber:184];

            v231 = PLLogCommon();
            if (os_log_type_enabled(v231, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v519 = v226;
              _os_log_debug_impl(&dword_1D2690000, v231, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v40 = v224;
            uint64_t v49 = v225;
            self = v448;
          }
        }
        switch((int)v218)
        {
          case 0:
            [(PLBBMav13HwMsgParser *)self setProtoStateC2K:v40];
            v49 += 64;
            v40 += 64;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v232 = objc_opt_class();
            v493[0] = MEMORY[0x1E4F143A8];
            v493[1] = 3221225472;
            v494[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_524;
            v494[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v494[2] = v232;
            v233 = v493;
            if (qword_1EBD5BA30 != -1) {
              dispatch_once(&qword_1EBD5BA30, v233);
            }

            if (!byte_1EBD5B937) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v238 = (void *)MEMORY[0x1E4F929B8];
            v239 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v240 = [v239 lastPathComponent];
            v241 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v238 logMessage:v237 fromFile:v240 fromFunction:v241 fromLineNumber:191];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 1:
            [(PLBBMav13HwMsgParser *)self setProtoStateHDR:v40];
            v49 += 64;
            v40 += 64;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v243 = objc_opt_class();
            v491[0] = MEMORY[0x1E4F143A8];
            v491[1] = 3221225472;
            v492[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_530;
            v492[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v492[2] = v243;
            v244 = v491;
            if (qword_1EBD5BA38 != -1) {
              dispatch_once(&qword_1EBD5BA38, v244);
            }

            if (!byte_1EBD5B938) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v245 = (void *)MEMORY[0x1E4F929B8];
            v246 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v247 = [v246 lastPathComponent];
            v248 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v245 logMessage:v237 fromFile:v247 fromFunction:v248 fromLineNumber:197];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 2:
            [(PLBBMav13HwMsgParser *)self setProtoStateGSM:v40];
            v49 += 64;
            v40 += 64;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v249 = objc_opt_class();
            v489[0] = MEMORY[0x1E4F143A8];
            v489[1] = 3221225472;
            v490[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_533;
            v490[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v490[2] = v249;
            v250 = v489;
            if (qword_1EBD5BA40 != -1) {
              dispatch_once(&qword_1EBD5BA40, v250);
            }

            if (!byte_1EBD5B939) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v251 = (void *)MEMORY[0x1E4F929B8];
            v252 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v253 = [v252 lastPathComponent];
            v254 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v251 logMessage:v237 fromFile:v253 fromFunction:v254 fromLineNumber:203];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 3:
            [(PLBBMav13HwMsgParser *)self setProtoStateWCDMA:v40];
            v49 += 64;
            v40 += 64;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v255 = objc_opt_class();
            v487[0] = MEMORY[0x1E4F143A8];
            v487[1] = 3221225472;
            v488[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_536;
            v488[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v488[2] = v255;
            v256 = v487;
            if (qword_1EBD5BA48 != -1) {
              dispatch_once(&qword_1EBD5BA48, v256);
            }

            if (!byte_1EBD5B93A) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v257 = (void *)MEMORY[0x1E4F929B8];
            v258 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v259 = [v258 lastPathComponent];
            v260 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v257 logMessage:v237 fromFile:v259 fromFunction:v260 fromLineNumber:209];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 4:
            [(PLBBMav13HwMsgParser *)self setProtoStateLTE:v40];
            v49 += 64;
            v40 += 64;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v261 = objc_opt_class();
            v485[0] = MEMORY[0x1E4F143A8];
            v485[1] = 3221225472;
            v486[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_539;
            v486[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v486[2] = v261;
            v262 = v485;
            if (qword_1EBD5BA50 != -1) {
              dispatch_once(&qword_1EBD5BA50, v262);
            }

            if (!byte_1EBD5B93B) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v263 = (void *)MEMORY[0x1E4F929B8];
            v264 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v265 = [v264 lastPathComponent];
            v266 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v263 logMessage:v237 fromFile:v265 fromFunction:v266 fromLineNumber:215];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 5:
            [(PLBBMav13HwMsgParser *)self setProtoStateTDS:v40];
            v49 += 64;
            v40 += 64;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v267 = objc_opt_class();
            v483[0] = MEMORY[0x1E4F143A8];
            v483[1] = 3221225472;
            v484[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_542;
            v484[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v484[2] = v267;
            v268 = v483;
            if (qword_1EBD5BA58 != -1) {
              dispatch_once(&qword_1EBD5BA58, v268);
            }

            if (!byte_1EBD5B93C) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v269 = (void *)MEMORY[0x1E4F929B8];
            v270 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v271 = [v270 lastPathComponent];
            v272 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v269 logMessage:v237 fromFile:v271 fromFunction:v272 fromLineNumber:221];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 6:
            [(PLBBMav13HwMsgParser *)self setRfDataC2K:v40];
            v49 += 256;
            v40 += 256;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v273 = objc_opt_class();
            v481[0] = MEMORY[0x1E4F143A8];
            v481[1] = 3221225472;
            v482[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_545;
            v482[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v482[2] = v273;
            v274 = v481;
            if (qword_1EBD5BA60 != -1) {
              dispatch_once(&qword_1EBD5BA60, v274);
            }

            if (!byte_1EBD5B93D) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v275 = (void *)MEMORY[0x1E4F929B8];
            v276 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v277 = [v276 lastPathComponent];
            v278 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v275 logMessage:v237 fromFile:v277 fromFunction:v278 fromLineNumber:227];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 7:
            [(PLBBMav13HwMsgParser *)self setRfData1xEVDO:v40];
            v49 += 256;
            v40 += 256;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v279 = objc_opt_class();
            v479[0] = MEMORY[0x1E4F143A8];
            v479[1] = 3221225472;
            v480[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_548;
            v480[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v480[2] = v279;
            v280 = v479;
            if (qword_1EBD5BA68 != -1) {
              dispatch_once(&qword_1EBD5BA68, v280);
            }

            if (!byte_1EBD5B93E) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v281 = (void *)MEMORY[0x1E4F929B8];
            v282 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v283 = [v282 lastPathComponent];
            v284 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v281 logMessage:v237 fromFile:v283 fromFunction:v284 fromLineNumber:233];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 8:
            [(PLBBMav13HwMsgParser *)self setRfDataGSM:v40];
            v49 += 256;
            v40 += 256;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v285 = objc_opt_class();
            v477[0] = MEMORY[0x1E4F143A8];
            v477[1] = 3221225472;
            v478[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_551;
            v478[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v478[2] = v285;
            v286 = v477;
            if (qword_1EBD5BA70 != -1) {
              dispatch_once(&qword_1EBD5BA70, v286);
            }

            if (!byte_1EBD5B93F) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v287 = (void *)MEMORY[0x1E4F929B8];
            v288 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v289 = [v288 lastPathComponent];
            v290 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v287 logMessage:v237 fromFile:v289 fromFunction:v290 fromLineNumber:239];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 9:
            [(PLBBMav13HwMsgParser *)self setRfDataWCDMA:v40];
            v49 += 208;
            v40 += 208;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v291 = objc_opt_class();
            v475[0] = MEMORY[0x1E4F143A8];
            v475[1] = 3221225472;
            v476[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_554;
            v476[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v476[2] = v291;
            v292 = v475;
            if (qword_1EBD5BA78 != -1) {
              dispatch_once(&qword_1EBD5BA78, v292);
            }

            if (!byte_1EBD5B940) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 208);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v293 = (void *)MEMORY[0x1E4F929B8];
            v294 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v295 = [v294 lastPathComponent];
            v296 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v293 logMessage:v237 fromFile:v295 fromFunction:v296 fromLineNumber:245];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 10:
            [(PLBBMav13HwMsgParser *)self setRfDataLTE:v40];
            v49 += 256;
            v40 += 256;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v297 = objc_opt_class();
            v473[0] = MEMORY[0x1E4F143A8];
            v473[1] = 3221225472;
            v474[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_557;
            v474[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v474[2] = v297;
            v298 = v473;
            if (qword_1EBD5BA80 != -1) {
              dispatch_once(&qword_1EBD5BA80, v298);
            }

            if (!byte_1EBD5B941) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v299 = (void *)MEMORY[0x1E4F929B8];
            v300 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v301 = [v300 lastPathComponent];
            v302 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v299 logMessage:v237 fromFile:v301 fromFunction:v302 fromLineNumber:251];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 11:
            [(PLBBMav13HwMsgParser *)self setRfDataTDS:v40];
            v49 += 256;
            v40 += 256;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v303 = objc_opt_class();
            v471[0] = MEMORY[0x1E4F143A8];
            v471[1] = 3221225472;
            v472[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_560;
            v472[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v472[2] = v303;
            v304 = v471;
            if (qword_1EBD5BA88 != -1) {
              dispatch_once(&qword_1EBD5BA88, v304);
            }

            if (!byte_1EBD5B942) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v305 = (void *)MEMORY[0x1E4F929B8];
            v306 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v307 = [v306 lastPathComponent];
            v308 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v305 logMessage:v237 fromFile:v307 fromFunction:v308 fromLineNumber:257];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 12:
            [(PLBBMav16BHwMsgParser *)self setRfEnhLTEMav16B:v40];
            if ([*(id *)(v50 + 2496) debugEnabled])
            {
              uint64_t v309 = objc_opt_class();
              v461[0] = MEMORY[0x1E4F143A8];
              v461[1] = 3221225472;
              v462[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_575;
              v462[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v462[2] = v309;
              v310 = v461;
              if (qword_1EBD5BAB0 != -1) {
                dispatch_once(&qword_1EBD5BAB0, v310);
              }

              if (byte_1EBD5B947)
              {
                uint64_t v311 = v49;
                v312 = v40;
                objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 492);
                v313 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v314 = (void *)MEMORY[0x1E4F929B8];
                v315 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
                v316 = [v315 lastPathComponent];
                v317 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
                [v314 logMessage:v313 fromFile:v316 fromFunction:v317 fromLineNumber:287];

                v318 = PLLogCommon();
                if (os_log_type_enabled(v318, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v519 = v313;
                  _os_log_debug_impl(&dword_1D2690000, v318, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v312;
                uint64_t v49 = v311;
                self = v448;
              }
            }
            if ([*(id *)(v50 + 2496) debugEnabled])
            {
              uint64_t v319 = objc_opt_class();
              v459[0] = MEMORY[0x1E4F143A8];
              v459[1] = 3221225472;
              v460[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_578;
              v460[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v460[2] = v319;
              v320 = v459;
              if (qword_1EBD5BAB8 != -1) {
                dispatch_once(&qword_1EBD5BAB8, v320);
              }

              if (byte_1EBD5B948)
              {
                uint64_t v444 = v49;
                v321 = v40;
                objc_msgSend(NSString, "stringWithFormat:", @"received PCC bw/band in struct %d,%d. SCC1 bw/band in struct %d,%d", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[485], -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[484], -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[489], -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[486], v417, v418, v419, v420, v421, v422, v423, v424, v425, v426, v427, v428,
                  v429,
                  v430,
                  v431,
                  v432,
                  v433,
                  v434,
                  v435,
                  v436,
                  v437,
                  v438);
                v322 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v323 = (void *)MEMORY[0x1E4F929B8];
                v324 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
                v325 = [v324 lastPathComponent];
                v326 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
                [v323 logMessage:v322 fromFile:v325 fromFunction:v326 fromLineNumber:290];

                v327 = PLLogCommon();
                if (os_log_type_enabled(v327, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v519 = v322;
                  _os_log_debug_impl(&dword_1D2690000, v327, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v50 = 0x1E4F92000uLL;
                v40 = v321;
                uint64_t v49 = v444;
              }
            }
            if ([*(id *)(v50 + 2496) debugEnabled])
            {
              uint64_t v328 = objc_opt_class();
              v457[0] = MEMORY[0x1E4F143A8];
              v457[1] = 3221225472;
              v458[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_584;
              v458[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v458[2] = v328;
              v329 = v457;
              if (qword_1EBD5BAC0 != -1) {
                dispatch_once(&qword_1EBD5BAC0, v329);
              }

              if (byte_1EBD5B949)
              {
                uint64_t v330 = v49;
                v331 = v40;
                objc_msgSend(NSString, "stringWithFormat:", @"Received ARD stats %u", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[368]);
                v332 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v333 = (void *)MEMORY[0x1E4F929B8];
                v334 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
                v335 = [v334 lastPathComponent];
                v336 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
                [v333 logMessage:v332 fromFile:v335 fromFunction:v336 fromLineNumber:291];

                v337 = PLLogCommon();
                if (os_log_type_enabled(v337, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v519 = v332;
                  _os_log_debug_impl(&dword_1D2690000, v337, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v331;
                uint64_t v49 = v330;
                self = v448;
              }
            }
            v49 += 494;
            v40 += 494;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v338 = objc_opt_class();
            v455[0] = MEMORY[0x1E4F143A8];
            v455[1] = 3221225472;
            v456[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_590;
            v456[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v456[2] = v338;
            v339 = v455;
            if (qword_1EBD5BAC8 != -1) {
              dispatch_once(&qword_1EBD5BAC8, v339);
            }

            if (!byte_1EBD5B94A) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Padding size for padding before LTE struct [%lu]", 2);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v340 = (void *)MEMORY[0x1E4F929B8];
            v341 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v342 = [v341 lastPathComponent];
            v343 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v340 logMessage:v237 fromFile:v342 fromFunction:v343 fromLineNumber:292];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 13:
            [(PLBBMav16BHwMsgParser *)self setRfEnhWCDMAMav16B:v40];
            v49 += 176;
            v40 += 176;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v344 = objc_opt_class();
            v463[0] = MEMORY[0x1E4F143A8];
            v463[1] = 3221225472;
            v464[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_572;
            v464[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v464[2] = v344;
            v345 = v463;
            if (qword_1EBD5BAA8 != -1) {
              dispatch_once(&qword_1EBD5BAA8, v345);
            }

            if (!byte_1EBD5B946) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 176);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v346 = (void *)MEMORY[0x1E4F929B8];
            v347 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v348 = [v347 lastPathComponent];
            v349 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v346 logMessage:v237 fromFile:v348 fromFunction:v349 fromLineNumber:281];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 14:
            [(PLBBMav13HwMsgParser *)self setRfEnhGSM:v40];
            v49 += 20;
            v40 += 20;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v350 = objc_opt_class();
            v465[0] = MEMORY[0x1E4F143A8];
            v465[1] = 3221225472;
            v466[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_569;
            v466[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v466[2] = v350;
            v351 = v465;
            if (qword_1EBD5BAA0 != -1) {
              dispatch_once(&qword_1EBD5BAA0, v351);
            }

            if (!byte_1EBD5B945) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 20);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v352 = (void *)MEMORY[0x1E4F929B8];
            v353 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v354 = [v353 lastPathComponent];
            v355 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v352 logMessage:v237 fromFile:v354 fromFunction:v355 fromLineNumber:275];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 15:
            [(PLBBMav13HwMsgParser *)self setRfEnhTDS:v40];
            v49 += 48;
            v40 += 48;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v356 = objc_opt_class();
            v453[0] = MEMORY[0x1E4F143A8];
            v453[1] = 3221225472;
            v454[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_596;
            v454[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v454[2] = v356;
            v357 = v453;
            if (qword_1EBD5BAD0 != -1) {
              dispatch_once(&qword_1EBD5BAD0, v357);
            }

            if (!byte_1EBD5B94B) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 48);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v358 = (void *)MEMORY[0x1E4F929B8];
            v359 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v360 = [v359 lastPathComponent];
            v361 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v358 logMessage:v237 fromFile:v360 fromFunction:v361 fromLineNumber:298];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 16:
            [(PLBBMav13HwMsgParser *)self setRfEnhC2K:v40];
            v49 += 40;
            v40 += 40;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v362 = objc_opt_class();
            v469[0] = MEMORY[0x1E4F143A8];
            v469[1] = 3221225472;
            v470[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_563;
            v470[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v470[2] = v362;
            v363 = v469;
            if (qword_1EBD5BA90 != -1) {
              dispatch_once(&qword_1EBD5BA90, v363);
            }

            if (!byte_1EBD5B943) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 40);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v364 = (void *)MEMORY[0x1E4F929B8];
            v365 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v366 = [v365 lastPathComponent];
            v367 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v364 logMessage:v237 fromFile:v366 fromFunction:v367 fromLineNumber:263];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 17:
            [(PLBBMav13HwMsgParser *)self setRfEnh1xEVDO:v40];
            v49 += 32;
            v40 += 32;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v368 = objc_opt_class();
            v467[0] = MEMORY[0x1E4F143A8];
            v467[1] = 3221225472;
            v468[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_566;
            v468[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v468[2] = v368;
            v369 = v467;
            if (qword_1EBD5BA98 != -1) {
              dispatch_once(&qword_1EBD5BA98, v369);
            }

            if (!byte_1EBD5B944) {
              break;
            }
            unint64_t v234 = v50;
            uint64_t v235 = v49;
            v236 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 32);
            v237 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v370 = (void *)MEMORY[0x1E4F929B8];
            v371 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
            v372 = [v371 lastPathComponent];
            v373 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
            [v370 logMessage:v237 fromFile:v372 fromFunction:v373 fromLineNumber:269];

            v242 = PLLogCommon();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
            {
LABEL_313:
              *(_DWORD *)buf = 138412290;
              v519 = v237;
              _os_log_debug_impl(&dword_1D2690000, v242, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_314:
            v40 = v236;
            uint64_t v49 = v235;
            unint64_t v50 = v234;

            self = v448;
            break;
          case 18:
            [(PLBBMav13HwMsgParser *)self setRfEnhOOS:v40];
            v49 += 156;
            v40 += 156;
            if ([*(id *)(v50 + 2496) debugEnabled])
            {
              uint64_t v374 = objc_opt_class();
              v451[0] = MEMORY[0x1E4F143A8];
              v451[1] = 3221225472;
              v452[0] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_599;
              v452[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v452[2] = v374;
              v375 = v451;
              if (qword_1EBD5BAD8 != -1) {
                dispatch_once(&qword_1EBD5BAD8, v375);
              }

              if (byte_1EBD5B94C)
              {
                uint64_t v376 = v49;
                v377 = v40;
                objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 156);
                v378 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v379 = (void *)MEMORY[0x1E4F929B8];
                v380 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
                v381 = [v380 lastPathComponent];
                v382 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
                [v379 logMessage:v378 fromFile:v381 fromFunction:v382 fromLineNumber:304];

                v383 = PLLogCommon();
                if (os_log_type_enabled(v383, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v519 = v378;
                  _os_log_debug_impl(&dword_1D2690000, v383, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v377;
                uint64_t v49 = v376;
              }
            }
            goto LABEL_324;
          default:
            break;
        }
      }
      uint64_t v218 = (v218 + 1);
    }
    while (v218 != 19);
LABEL_324:
    if ([*(id *)(v50 + 2496) debugEnabled])
    {
      uint64_t v384 = objc_opt_class();
      v450[0] = MEMORY[0x1E4F143A8];
      v450[1] = 3221225472;
      v450[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_602;
      v450[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v450[4] = v384;
      v385 = v450;
      if (qword_1EBD5BAE0 != -1) {
        dispatch_once(&qword_1EBD5BAE0, v385);
      }

      if (byte_1EBD5B94D)
      {
        v386 = v40;
        uint64_t v387 = v49;
        v388 = [NSString stringWithFormat:@"End of Proto, Rf, Enh data at offset %llu", v49];
        v389 = (void *)MEMORY[0x1E4F929B8];
        v390 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v391 = [v390 lastPathComponent];
        v392 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v389 logMessage:v388 fromFile:v391 fromFunction:v392 fromLineNumber:310];

        v393 = PLLogCommon();
        if (os_log_type_enabled(v393, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v388;
          _os_log_debug_impl(&dword_1D2690000, v393, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v386;
        uint64_t v49 = v387;
        self = v448;
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration_mask:v40];
    int v394 = [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask]];
    [MEMORY[0x1E4F28E78] string];
    v396 = unint64_t v395 = v50;
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration:v396];

    [(PLBBMav13HwMsgParser *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask] oftype:0 withData:v40 + 16];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration_mask:&v40[4 * v394 + 16]];
    int v397 = [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask]];
    v398 = [MEMORY[0x1E4F28E78] string];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration:v398];

    [(PLBBMav13HwMsgParser *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask] oftype:1 withData:&v40[4 * v394 + 32]];
    v40 += 4 * v394 + 4 * v397 + 32;
    if ([*(id *)(v395 + 2496) debugEnabled])
    {
      uint64_t v399 = objc_opt_class();
      v449[0] = MEMORY[0x1E4F143A8];
      v449[1] = 3221225472;
      v449[2] = __35__PLBBMav16BHwMsgParser_parseData___block_invoke_608;
      v449[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v449[4] = v399;
      v400 = v449;
      if (qword_1EBD5BAE8 != -1) {
        dispatch_once(&qword_1EBD5BAE8, v400);
      }

      if (byte_1EBD5B94E)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"End of level 6 at offset %llu", v49 + 4 * v394 + 4 * v397 + 32);
        v401 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v402 = (void *)MEMORY[0x1E4F929B8];
        v403 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v404 = [v403 lastPathComponent];
        v405 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser parseData:]"];
        [v402 logMessage:v401 fromFile:v404 fromFunction:v405 fromLineNumber:334];

        v406 = PLLogCommon();
        if (os_log_type_enabled(v406, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v519 = v401;
          _os_log_debug_impl(&dword_1D2690000, v406, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 8)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_count_mask:v40];
    uint64_t v407 = (uint64_t)&v40[4
                       * [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_count_mask]]+ 16];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_count_mask:v407];
    uint64_t v408 = v407
         + 4
         * [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_count_mask]];
    [(PLMav7BasebandHardwareMessage *)self setHsic:v408 + 16];
    v40 = (unsigned __int8 *)(v408 + 48);
  }
  id v409 = v439;
  unint64_t v410 = (unint64_t)&v40[-[v409 bytes]];
  unint64_t v411 = [v409 length];
  if (v410 > v411)
  {
    v412 = PLLogCommon();
    if (os_log_type_enabled(v412, OS_LOG_TYPE_ERROR))
    {
      id v414 = v409;
      v415 = &v40[-[v414 bytes]];
      uint64_t v416 = [v414 length];
      *(_DWORD *)buf = 134218498;
      v519 = v415;
      __int16 v520 = 2048;
      uint64_t v521 = v416;
      __int16 v522 = 2080;
      v523 = "-[PLBBMav16BHwMsgParser parseData:]";
      _os_log_error_impl(&dword_1D2690000, v412, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
  }
  return v410 <= v411;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_81 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_375(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B921 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_381(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B922 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_393(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B923 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_399(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B924 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_405(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B925 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_411(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B926 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_417(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B927 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_423(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B928 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_429(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B929 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_435(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B92A = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_441(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B92B = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_447(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B92C = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_453(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B92D = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_459(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B92E = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_465(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B92F = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_471(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B930 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_477(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B931 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_483(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B932 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_489(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B933 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_504(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B934 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_510(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B935 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_517(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B936 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_524(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B937 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_530(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B938 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_533(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B939 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_536(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B93A = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_539(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B93B = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_542(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B93C = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_545(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B93D = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_548(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B93E = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_551(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B93F = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_554(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B940 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_557(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B941 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_560(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B942 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_563(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B943 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_566(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B944 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_569(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B945 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_572(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B946 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_575(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B947 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_578(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B948 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_584(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B949 = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_590(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B94A = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_596(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B94B = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_599(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B94C = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_602(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B94D = result;
  return result;
}

uint64_t __35__PLBBMav16BHwMsgParser_parseData___block_invoke_608(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B94E = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v209[0] = MEMORY[0x1E4F143A8];
    v209[1] = 3221225472;
    v209[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke;
    v209[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v209[4] = v6;
    v7 = v209;
    if (qword_1EBD5BAF0 != -1) {
      dispatch_once(&qword_1EBD5BAF0, v7);
    }

    if (byte_1EBD5B94F)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwMsgParser logWithLogger:]");
      v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:363];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v211 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v208.receiver = self;
  v208.super_class = (Class)PLBBMav16BHwMsgParser;
  [(PLBasebandHardwareMessage *)&v208 logRawWithLogger:v4];
  uint64_t v14 = objc_alloc_init(PLBBMavLogMsg);
  uint64_t v15 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v14 setAgent:v15];

  [(PLBBMavLogMsg *)v14 setError:&stru_1F294E108];
  v16 = [(PLBasebandMessage *)self seqNum];
  v17 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v14, "setHeaderWithSeqNum:andDate:andTimeCal:", v16, v17);

  if ([(PLMav4BasebandHardwareMessage *)self sw_rev] == 3)
  {
    uint64_t v18 = 6;
    v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self protocolActive] ofSize:6];
    [(PLBBMavLogMsg *)v14 setProtocolActivityHistogram:v19];

    [(PLMav4BasebandHardwareMessage *)self logHeaderWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logRPMWithLogger:v14];
    [(PLBBMav16BHwMsgParser *)self logMav16BAppsPerfWithLogger:v14];
    [(PLBBMav16BHwMsgParser *)self logMav16BMPSSWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logLPASSWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logPeripheralsWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logPcieWithLogger:v14];
    v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self mcpmSleepVetoMav16B] ofSize:14];
    [(PLBBMavLogMsg *)v14 setMcpmVetoNumHistogram:v20];

    v21 = objc_opt_new();
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 1) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateC2K])
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v22 = objc_opt_class();
        v206[0] = MEMORY[0x1E4F143A8];
        v206[1] = 3221225472;
        v206[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_634;
        v206[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v206[4] = v22;
        uint64_t v23 = v206;
        if (qword_1EBD5BB00 != -1) {
          dispatch_once(&qword_1EBD5BB00, v23);
        }

        if (byte_1EBD5B951)
        {
          v24 = [NSString stringWithFormat:@"protoStateC2K is valid"];
          v25 = (void *)MEMORY[0x1E4F929B8];
          v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v27 = [v26 lastPathComponent];
          v28 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:405];

          v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v24;
            _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000;
        }
      }
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v21 state:[(PLBBMav13HwMsgParser *)self protoStateC2K] forRAT:0];
      uint64_t v18 = 0;
      int v30 = 1;
    }
    else
    {
      int v30 = 0;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 2) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateHDR])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v38 = objc_opt_class();
        v205[0] = MEMORY[0x1E4F143A8];
        v205[1] = 3221225472;
        v205[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_640;
        v205[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v205[4] = v38;
        v39 = v205;
        if (qword_1EBD5BB08 != -1) {
          dispatch_once(&qword_1EBD5BB08, v39);
        }

        if (byte_1EBD5B952)
        {
          v40 = [NSString stringWithFormat:@"protoStateHDR is valid"];
          uint64_t v41 = (void *)MEMORY[0x1E4F929B8];
          v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v43 = [v42 lastPathComponent];
          v44 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:416];

          v45 = PLLogCommon();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v40;
            _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      int v30 = 1;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v21 state:[(PLBBMav13HwMsgParser *)self protoStateHDR] forRAT:1];
      uint64_t v18 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 4) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateGSM])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v46 = objc_opt_class();
        v204[0] = MEMORY[0x1E4F143A8];
        v204[1] = 3221225472;
        v204[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_646;
        v204[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v204[4] = v46;
        v47 = v204;
        if (qword_1EBD5BB10 != -1) {
          dispatch_once(&qword_1EBD5BB10, v47);
        }

        if (byte_1EBD5B953)
        {
          v48 = [NSString stringWithFormat:@"protoStateGSM is valid"];
          uint64_t v49 = (void *)MEMORY[0x1E4F929B8];
          unint64_t v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          uint64_t v51 = [v50 lastPathComponent];
          v52 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v49 logMessage:v48 fromFile:v51 fromFunction:v52 fromLineNumber:427];

          uint64_t v53 = PLLogCommon();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v48;
            _os_log_debug_impl(&dword_1D2690000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      uint64_t v18 = 2;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v21 state:[(PLBBMav13HwMsgParser *)self protoStateGSM] forRAT:2];
      int v30 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 8) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateWCDMA])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v54 = objc_opt_class();
        v203[0] = MEMORY[0x1E4F143A8];
        v203[1] = 3221225472;
        v203[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_652;
        v203[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v203[4] = v54;
        v55 = v203;
        if (qword_1EBD5BB18 != -1) {
          dispatch_once(&qword_1EBD5BB18, v55);
        }

        if (byte_1EBD5B954)
        {
          v56 = [NSString stringWithFormat:@"protoStateWCDMA is valid"];
          v57 = (void *)MEMORY[0x1E4F929B8];
          v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v59 = [v58 lastPathComponent];
          v60 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v57 logMessage:v56 fromFile:v59 fromFunction:v60 fromLineNumber:438];

          uint64_t v61 = PLLogCommon();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v56;
            _os_log_debug_impl(&dword_1D2690000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      uint64_t v18 = 3;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v21 state:[(PLBBMav13HwMsgParser *)self protoStateWCDMA] forRAT:3];
      int v30 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 0x10) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateLTE])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v62 = objc_opt_class();
        v202[0] = MEMORY[0x1E4F143A8];
        v202[1] = 3221225472;
        v202[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_658;
        v202[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v202[4] = v62;
        v63 = v202;
        if (qword_1EBD5BB20 != -1) {
          dispatch_once(&qword_1EBD5BB20, v63);
        }

        if (byte_1EBD5B955)
        {
          uint64_t v64 = [NSString stringWithFormat:@"protoStateLTE is valid"];
          v65 = (void *)MEMORY[0x1E4F929B8];
          v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v67 = [v66 lastPathComponent];
          v68 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:449];

          v69 = PLLogCommon();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v64;
            _os_log_debug_impl(&dword_1D2690000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      uint64_t v18 = 4;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v21 state:[(PLBBMav13HwMsgParser *)self protoStateLTE] forRAT:4];
      int v30 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 0x20) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateTDS])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v70 = objc_opt_class();
        v201[0] = MEMORY[0x1E4F143A8];
        v201[1] = 3221225472;
        v201[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_664;
        v201[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v201[4] = v70;
        v71 = v201;
        if (qword_1EBD5BB28 != -1) {
          dispatch_once(&qword_1EBD5BB28, v71);
        }

        if (byte_1EBD5B956)
        {
          uint64_t v72 = [NSString stringWithFormat:@"protoStateTDS is valid"];
          v73 = (void *)MEMORY[0x1E4F929B8];
          v74 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v75 = [v74 lastPathComponent];
          v76 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v73 logMessage:v72 fromFile:v75 fromFunction:v76 fromLineNumber:460];

          v77 = PLLogCommon();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v72;
            _os_log_debug_impl(&dword_1D2690000, v77, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      uint64_t v18 = 5;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v21 state:[(PLBBMav13HwMsgParser *)self protoStateTDS] forRAT:5];
      int v30 = 1;
    }
    [(PLBBMavLogMsg *)v14 setProtocolStateHistDict:v21];
    [(PLMav7BasebandHardwareMessage *)self logProtocolActiveWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logSleepVetoWithLogger:v14];
    if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
    {
      [(PLMav7BasebandHardwareMessage *)self logClockWithLogger:v14];
      [(PLMav7BasebandHardwareMessage *)self logHSICWithLogger:v14];
    }
    [(PLBBMavLogMsg *)v14 addToGroupPLBBMav16BHwOther];
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 4) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataLTE])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v78 = objc_opt_class();
        v200[0] = MEMORY[0x1E4F143A8];
        v200[1] = 3221225472;
        v200[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_670;
        v200[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v200[4] = v78;
        v79 = v200;
        if (qword_1EBD5BB30 != -1) {
          dispatch_once(&qword_1EBD5BB30, v79);
        }

        if (byte_1EBD5B957)
        {
          id v183 = v4;
          v80 = [NSString stringWithFormat:@"rfDataLTE is valid"];
          uint64_t v81 = (void *)MEMORY[0x1E4F929B8];
          v82 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v83 = [v82 lastPathComponent];
          uint64_t v84 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v81 logMessage:v80 fromFile:v83 fromFunction:v84 fromLineNumber:485];

          v85 = PLLogCommon();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v80;
            _os_log_debug_impl(&dword_1D2690000, v85, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v183;
          unint64_t v5 = 0x1E4F92000;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataLTE] forRAT:4];
      int v86 = 1;
    }
    else
    {
      int v86 = 0;
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 2) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataWCDMA])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v87 = objc_opt_class();
        v199[0] = MEMORY[0x1E4F143A8];
        v199[1] = 3221225472;
        v199[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_676;
        v199[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v199[4] = v87;
        v88 = v199;
        if (qword_1EBD5BB38 != -1) {
          dispatch_once(&qword_1EBD5BB38, v88);
        }

        if (byte_1EBD5B958)
        {
          id v184 = v4;
          v89 = [NSString stringWithFormat:@"rfDataWCDMA is valid"];
          v90 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v91 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v92 = [v91 lastPathComponent];
          v93 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v90 logMessage:v89 fromFile:v92 fromFunction:v93 fromLineNumber:494];

          uint64_t v94 = PLLogCommon();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v89;
            _os_log_debug_impl(&dword_1D2690000, v94, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v184;
          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataWCDMA] forRAT:3];
      int v86 = 1;
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 1) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataGSM])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v95 = objc_opt_class();
        v198[0] = MEMORY[0x1E4F143A8];
        v198[1] = 3221225472;
        v198[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_682;
        v198[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v198[4] = v95;
        v96 = v198;
        if (qword_1EBD5BB40 != -1) {
          dispatch_once(&qword_1EBD5BB40, v96);
        }

        if (byte_1EBD5B959)
        {
          id v185 = v4;
          v97 = [NSString stringWithFormat:@"rfDataGSM is valid"];
          v98 = (void *)MEMORY[0x1E4F929B8];
          v99 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v100 = [v99 lastPathComponent];
          v101 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v98 logMessage:v97 fromFile:v100 fromFunction:v101 fromLineNumber:503];

          uint64_t v102 = PLLogCommon();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v97;
            _os_log_debug_impl(&dword_1D2690000, v102, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v185;
          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataGSM] forRAT:2];
      int v86 = 1;
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 8) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataTDS])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v103 = objc_opt_class();
        v197[0] = MEMORY[0x1E4F143A8];
        v197[1] = 3221225472;
        v197[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_688;
        v197[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v197[4] = v103;
        v104 = v197;
        if (qword_1EBD5BB48 != -1) {
          dispatch_once(&qword_1EBD5BB48, v104);
        }

        if (byte_1EBD5B95A)
        {
          id v186 = v4;
          v105 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          v106 = (void *)MEMORY[0x1E4F929B8];
          v107 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v108 = [v107 lastPathComponent];
          v109 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v106 logMessage:v105 fromFile:v108 fromFunction:v109 fromLineNumber:512];

          v110 = PLLogCommon();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v105;
            _os_log_debug_impl(&dword_1D2690000, v110, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v186;
          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataTDS] forRAT:5];
      int v86 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 0x40) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataC2K])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v111 = objc_opt_class();
        v196[0] = MEMORY[0x1E4F143A8];
        v196[1] = 3221225472;
        v196[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_694;
        v196[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v196[4] = v111;
        v112 = v196;
        if (qword_1EBD5BB50 != -1) {
          dispatch_once(&qword_1EBD5BB50, v112);
        }

        if (byte_1EBD5B95B)
        {
          id v187 = v4;
          v113 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          v114 = (void *)MEMORY[0x1E4F929B8];
          v115 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v116 = [v115 lastPathComponent];
          v117 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v114 logMessage:v113 fromFile:v116 fromFunction:v117 fromLineNumber:521];

          v118 = PLLogCommon();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v113;
            _os_log_debug_impl(&dword_1D2690000, v118, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v187;
          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataC2K] forRAT:0];
      int v86 = 1;
    }
    if (*[(PLBBMav13HwMsgParser *)self optimMaskArray] < 0
      && [(PLBBMav13HwMsgParser *)self rfData1xEVDO])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v119 = objc_opt_class();
        v195[0] = MEMORY[0x1E4F143A8];
        v195[1] = 3221225472;
        v195[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_697;
        v195[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v195[4] = v119;
        uint64_t v120 = v195;
        if (qword_1EBD5BB58 != -1) {
          dispatch_once(&qword_1EBD5BB58, v120);
        }

        if (byte_1EBD5B95C)
        {
          v121 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          v122 = (void *)MEMORY[0x1E4F929B8];
          v123 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v124 = [v123 lastPathComponent];
          v125 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v122 logMessage:v121 fromFile:v124 fromFunction:v125 fromLineNumber:530];

          v126 = PLLogCommon();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v121;
            _os_log_debug_impl(&dword_1D2690000, v126, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfData1xEVDO] forRAT:1];
    }
    else if (((v86 | v30 ^ 1) & 1) == 0)
    {
      [(PLBBMav13HwMsgParser *)self logProtocolOnlyWithLogger:v14 forRAT:v18];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x10) != 0
      && [(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v127 = objc_opt_class();
        v194[0] = MEMORY[0x1E4F143A8];
        v194[1] = 3221225472;
        v194[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_700;
        v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v194[4] = v127;
        v128 = v194;
        if (qword_1EBD5BB60 != -1) {
          dispatch_once(&qword_1EBD5BB60, v128);
        }

        if (byte_1EBD5B95D)
        {
          uint64_t v129 = [NSString stringWithFormat:@"rfEnhLTE is valid"];
          v130 = (void *)MEMORY[0x1E4F929B8];
          v131 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v132 = [v131 lastPathComponent];
          v133 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v130 logMessage:v129 fromFile:v132 fromFunction:v133 fromLineNumber:545];

          v134 = PLLogCommon();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v129;
            _os_log_debug_impl(&dword_1D2690000, v134, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav16BHwMsgParser *)self logMav16BHwRFEnhLTEWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x20) != 0
      && [(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v135 = objc_opt_class();
        v193[0] = MEMORY[0x1E4F143A8];
        v193[1] = 3221225472;
        v193[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_706;
        v193[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v193[4] = v135;
        v136 = v193;
        if (qword_1EBD5BB68 != -1) {
          dispatch_once(&qword_1EBD5BB68, v136);
        }

        if (byte_1EBD5B95E)
        {
          v137 = [NSString stringWithFormat:@"rfEnhWCDMA is valid"];
          uint64_t v138 = (void *)MEMORY[0x1E4F929B8];
          v139 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v140 = [v139 lastPathComponent];
          v141 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v138 logMessage:v137 fromFile:v140 fromFunction:v141 fromLineNumber:551];

          v142 = PLLogCommon();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v137;
            _os_log_debug_impl(&dword_1D2690000, v142, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav16BHwMsgParser *)self logMav16HwRFEnhWCDMAWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x40) != 0
      && [(PLBBMav13HwMsgParser *)self rfEnhGSM])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v143 = objc_opt_class();
        v192[0] = MEMORY[0x1E4F143A8];
        v192[1] = 3221225472;
        v192[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_712;
        v192[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v192[4] = v143;
        v144 = v192;
        if (qword_1EBD5BB70 != -1) {
          dispatch_once(&qword_1EBD5BB70, v144);
        }

        if (byte_1EBD5B95F)
        {
          v145 = [NSString stringWithFormat:@"rfEnhGSM is valid"];
          v146 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v147 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v148 = [v147 lastPathComponent];
          v149 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v146 logMessage:v145 fromFile:v148 fromFunction:v149 fromLineNumber:557];

          v150 = PLLogCommon();
          if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v145;
            _os_log_debug_impl(&dword_1D2690000, v150, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logHwRFGSMWithLogger:v14];
    }
    if ([(PLBBMav13HwMsgParser *)self optimMaskArray][1] < 0
      && [(PLBBMav13HwMsgParser *)self rfEnhTDS])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v151 = objc_opt_class();
        v191[0] = MEMORY[0x1E4F143A8];
        v191[1] = 3221225472;
        v191[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_718;
        v191[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v191[4] = v151;
        v152 = v191;
        if (qword_1EBD5BB78 != -1) {
          dispatch_once(&qword_1EBD5BB78, v152);
        }

        if (byte_1EBD5B960)
        {
          v153 = [NSString stringWithFormat:@"rfEnhTDS is valid"];
          v154 = (void *)MEMORY[0x1E4F929B8];
          v155 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          uint64_t v156 = [v155 lastPathComponent];
          v157 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v154 logMessage:v153 fromFile:v156 fromFunction:v157 fromLineNumber:563];

          v158 = PLLogCommon();
          if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v153;
            _os_log_debug_impl(&dword_1D2690000, v158, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logHwRFTDSWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][2] & 1) != 0
      && [(PLBBMav13HwMsgParser *)self rfEnhC2K])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v159 = objc_opt_class();
        v190[0] = MEMORY[0x1E4F143A8];
        v190[1] = 3221225472;
        v190[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_724;
        v190[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v190[4] = v159;
        v160 = v190;
        if (qword_1EBD5BB80 != -1) {
          dispatch_once(&qword_1EBD5BB80, v160);
        }

        if (byte_1EBD5B961)
        {
          v161 = [NSString stringWithFormat:@"rfEnh1x is valid"];
          v162 = (void *)MEMORY[0x1E4F929B8];
          v163 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          uint64_t v164 = [v163 lastPathComponent];
          v165 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v162 logMessage:v161 fromFile:v164 fromFunction:v165 fromLineNumber:569];

          v166 = PLLogCommon();
          if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v161;
            _os_log_debug_impl(&dword_1D2690000, v166, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logHwRF1xWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][2] & 2) != 0
      && [(PLBBMav13HwMsgParser *)self rfEnh1xEVDO])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v167 = objc_opt_class();
        v189[0] = MEMORY[0x1E4F143A8];
        v189[1] = 3221225472;
        v189[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_730;
        v189[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v189[4] = v167;
        v168 = v189;
        if (qword_1EBD5BB88 != -1) {
          dispatch_once(&qword_1EBD5BB88, v168);
        }

        if (byte_1EBD5B962)
        {
          v169 = [NSString stringWithFormat:@"rfEnhHDR is valid"];
          v170 = (void *)MEMORY[0x1E4F929B8];
          v171 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v172 = [v171 lastPathComponent];
          uint64_t v173 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v170 logMessage:v169 fromFile:v172 fromFunction:v173 fromLineNumber:575];

          v174 = PLLogCommon();
          if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v169;
            _os_log_debug_impl(&dword_1D2690000, v174, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logHwRFHDRWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][2] & 4) != 0
      && [(PLBBMav13HwMsgParser *)self rfEnhOOS])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v175 = objc_opt_class();
        v188[0] = MEMORY[0x1E4F143A8];
        v188[1] = 3221225472;
        v188[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_736;
        v188[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v188[4] = v175;
        v176 = v188;
        if (qword_1EBD5BB90 != -1) {
          dispatch_once(&qword_1EBD5BB90, v176);
        }

        if (byte_1EBD5B963)
        {
          v177 = [NSString stringWithFormat:@"rfEnhOOS is valid"];
          v178 = (void *)MEMORY[0x1E4F929B8];
          v179 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
          v180 = [v179 lastPathComponent];
          v181 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
          [v178 logMessage:v177 fromFile:v180 fromFunction:v181 fromLineNumber:581];

          uint64_t v182 = PLLogCommon();
          if (os_log_type_enabled(v182, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v211 = v177;
            _os_log_debug_impl(&dword_1D2690000, v182, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      [(PLBBMav13HwMsgParser *)self logHwRFOOSWithLogger:v14];
    }
    [(PLBBMavLogMsg *)v14 logEventBackwardGrpEntriesBBMav16Hw];
  }
  else
  {
    v21 = [MEMORY[0x1E4F28E78] string];
    objc_msgSend(v21, "appendFormat:", @"Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3);
    [(PLBBMavLogMsg *)v14 setError:v21];
    [(PLBBMavLogMsg *)v14 setType:@"BB HW Error"];
    [(PLBBMavLogMsg *)v14 logEventBackwardMavBBHwOther];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v31 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_627;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v31;
      if (qword_1EBD5BAF8 != -1) {
        dispatch_once(&qword_1EBD5BAF8, block);
      }
      if (byte_1EBD5B950)
      {
        uint64_t v32 = [NSString stringWithFormat:@"SW version mismatch. Received %d, expected %d cannot process, returning", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3];
        v33 = (void *)MEMORY[0x1E4F929B8];
        v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v35 = [v34 lastPathComponent];
        v36 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logWithLogger:]"];
        [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:381];

        v37 = PLLogCommon();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v211 = v32;
          _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B94F = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_627(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B950 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_634(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B951 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_640(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B952 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_646(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B953 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_652(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B954 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_658(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B955 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_664(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B956 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_670(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B957 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_676(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B958 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_682(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B959 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_688(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B95A = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_694(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B95B = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_697(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B95C = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_700(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B95D = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_706(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B95E = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_712(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B95F = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_718(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B960 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_724(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B961 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_730(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B962 = result;
  return result;
}

uint64_t __39__PLBBMav16BHwMsgParser_logWithLogger___block_invoke_736(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B963 = result;
  return result;
}

- (void)logMav16BAppsPerfWithLogger:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5BB98 != -1) {
      dispatch_once(&qword_1EBD5BB98, block);
    }
    if (byte_1EBD5B964)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:592];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v50 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBBMav16BHwMsgParser *)self mav16BAppsPerf])
  {
    v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self mav16BAppsPerf] ofSize:8];
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
    v47[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_745;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v14;
    if (qword_1EBD5BBA0 != -1) {
      dispatch_once(&qword_1EBD5BBA0, v47);
    }
    if (byte_1EBD5B965)
    {
      v13 = [NSString stringWithFormat:@"Perf_Level=<unknown>"];
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:604];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v50 = v13;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_10;
    }
  }
LABEL_18:
  if ([(PLBBMav13HwMsgParser *)self appsSleep])
  {
    v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav13HwMsgParser appsSleep](self, "appsSleep")[4]);
    [v12 setCxoShutDownDuration:v20];

    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav13HwMsgParser appsSleep](self, "appsSleep"));
    [v12 setCxoShutDownCount:v21];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_751;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v22;
      if (qword_1EBD5BBA8 != -1) {
        dispatch_once(&qword_1EBD5BBA8, v46);
      }
      if (byte_1EBD5B966)
      {
        uint64_t v23 = [NSString stringWithFormat:@"Sleep_Stats=<unknown>"];
        v24 = (void *)MEMORY[0x1E4F929B8];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:615];

        v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v50 = v23;
          _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v12 appendToError:@"Sleep_Stats=<unknown> "];
  }
  if ([(PLBBMav16BHwMsgParser *)self mav16BAppsSleepVeto])
  {
    v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self mav16BAppsSleepVeto] ofSize:4];
    [v12 setAppsSleepVeto:v29];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v30 = objc_opt_class();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_760;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v30;
      if (qword_1EBD5BBB0 != -1) {
        dispatch_once(&qword_1EBD5BBB0, v45);
      }
      if (byte_1EBD5B967)
      {
        uint64_t v31 = [NSString stringWithFormat:@"Sleep_Veto_Duration=<unknown>"];
        uint64_t v32 = (void *)MEMORY[0x1E4F929B8];
        v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        v34 = [v33 lastPathComponent];
        v35 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]"];
        [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:629];

        v36 = PLLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v50 = v31;
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
    v44[2] = __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_769;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v37;
    if (qword_1EBD5BBB8 != -1) {
      dispatch_once(&qword_1EBD5BBB8, v44);
    }
    if (byte_1EBD5B968)
    {
      uint64_t v38 = [NSString stringWithFormat:@"Decoded BB HW APPS"];
      v39 = (void *)MEMORY[0x1E4F929B8];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      uint64_t v41 = [v40 lastPathComponent];
      v42 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BAppsPerfWithLogger:]"];
      [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:633];

      v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v50 = v38;
        _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B964 = result;
  return result;
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_745(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B965 = result;
  return result;
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_751(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B966 = result;
  return result;
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_760(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B967 = result;
  return result;
}

uint64_t __53__PLBBMav16BHwMsgParser_logMav16BAppsPerfWithLogger___block_invoke_769(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B968 = result;
  return result;
}

- (void)logMav16BMPSSWithLogger:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5BBC0 != -1) {
      dispatch_once(&qword_1EBD5BBC0, block);
    }
    if (byte_1EBD5B969)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:638];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBBMav13HwMsgParser *)self mpssSleep])
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav13HwMsgParser mpssSleep](self, "mpssSleep")[4]);
    [v12 setMpssCxoShutDownDuration:v13];

    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav13HwMsgParser mpssSleep](self, "mpssSleep"));
    [v12 setMpssCxoShutDownCount:v14];
  }
  if ([(PLBBMav16BHwMsgParser *)self mav16BMpssSleepVeto])
  {
    uint64_t v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self mav16BMpssSleepVeto] ofSize:21];
    [v12 setMpssSleepVeto:v15];
LABEL_12:

    goto LABEL_20;
  }
  [v12 appendToError:@"Sleep_Veto=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_778;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v16;
    if (qword_1EBD5BBC8 != -1) {
      dispatch_once(&qword_1EBD5BBC8, v38);
    }
    if (byte_1EBD5B96A)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Sleep_Veto=<unknown>"];
      v17 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]"];
      [v17 logMessage:v15 fromFile:v19 fromFunction:v20 fromLineNumber:655];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v15;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_12;
    }
  }
LABEL_20:
  if ([(PLBBMav16BHwMsgParser *)self mav16BQdspSpeed])
  {
    uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self mav16BQdspSpeed] ofSize:11];
    [v12 setQdspConfigCount:v22];
LABEL_22:

    goto LABEL_30;
  }
  [v12 appendToError:@"Q6SW_Perf=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_787;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v23;
    if (qword_1EBD5BBD0 != -1) {
      dispatch_once(&qword_1EBD5BBD0, v37);
    }
    if (byte_1EBD5B96B)
    {
      uint64_t v22 = [NSString stringWithFormat:@"Q6SW_Perf=<unknown>"];
      v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]"];
      [v24 logMessage:v22 fromFile:v26 fromFunction:v27 fromLineNumber:668];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v22;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_22;
    }
  }
LABEL_30:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v29 = objc_opt_class();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_793;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v29;
    if (qword_1EBD5BBD8 != -1) {
      dispatch_once(&qword_1EBD5BBD8, v36);
    }
    if (byte_1EBD5B96C)
    {
      uint64_t v30 = [NSString stringWithFormat:@"Decoded BB HW MPSS"];
      uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v33 = [v32 lastPathComponent];
      v34 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BMPSSWithLogger:]"];
      [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:671];

      v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v30;
        _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B969 = result;
  return result;
}

uint64_t __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_778(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B96A = result;
  return result;
}

uint64_t __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_787(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B96B = result;
  return result;
}

uint64_t __49__PLBBMav16BHwMsgParser_logMav16BMPSSWithLogger___block_invoke_793(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B96C = result;
  return result;
}

- (void)logMav16BHwRFEnhLTEWithLogger:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5BBE0 != -1) {
      dispatch_once(&qword_1EBD5BBE0, block);
    }
    if (byte_1EBD5B96D)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:676];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_alloc_init(PLBBMav16BHwRfLTELogMsg);
  if (v13)
  {
    uint64_t v14 = [(PLBasebandMessage *)self agent];
    [(PLBBMsgRoot *)v13 setAgent:v14];

    [(PLBBMav16BHwRfLTELogMsg *)v13 setError:@"not set"];
    uint64_t v15 = [(PLBasebandMessage *)self seqNum];
    uint64_t v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMav16BHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x10) == 0
      || [(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B])
    {
      v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")- -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[4]));
      [(PLBBMav16BHwRfLTELogMsg *)v13 setLogDuration:v17];

      uint64_t v18 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[8]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setDupMode:v18];

      v19 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[484]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setPCCFreq:v19];

      v20 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[485]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setPCCBw:v20];

      v21 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[486]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSCC1Freq:v21];

      uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[489]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSCC1Bw:v22];

      uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[487]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSCC2Freq:v23];

      v24 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[490]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSCC2Bw:v24];

      v25 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[488]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSCC3Freq:v25];

      v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[491]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSCC3Bw:v26];

      v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 12 ofSize:17];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setDlTBSzCnt:v27];

      v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 80 ofSize:12];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setTxPwrCnt:v28];

      uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 128 ofSize:10];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setCaSCCCnt:v29];

      uint64_t v30 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 168 ofSize:3];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setUlCaSCCCnt:v30];

      uint64_t v31 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 180 ofSize:6];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setActRxTxCnt:v31];

      uint64_t v32 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 204 ofSize:7];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSleepStateIdleCnt:v32];

      v33 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 232 ofSize:7];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSleepStateConnCnt:v33];

      v34 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 260 ofSize:6];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setRsrpIdleCnt:v34];

      v35 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 284 ofSize:6];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setRsrpConnCnt:v35];

      v36 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 308 ofSize:6];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSinrIdleCnt:v36];

      uint64_t v37 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 332 ofSize:6];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setSinrConnCnt:v37];

      uint64_t v38 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 356 ofSize:3];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setNlicStateCnt:v38];

      v39 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[368]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArdRxDOff:v39];

      v40 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[372]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArdRxDOff:v40];

      uint64_t v41 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[376]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArdRxDOff:v41];

      uint64_t v42 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[380]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArdRxDOff:v42];

      v43 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[468]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setUSleepPCCCnt:v43];

      v44 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[472]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setUSleepSCC1Cnt:v44];

      v45 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[476]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setUSleepSCC2Cnt:v45];

      uint64_t v46 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[480]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setUSleepSCC3Cnt:v46];

      v47 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 384 ofSize:2];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setHsicPCC:v47];

      v48 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 392 ofSize:2];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setHsicSCC1:v48];

      uint64_t v49 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 400 ofSize:2];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setHsicSCC2:v49];

      unint64_t v50 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhLTEMav16B] + 408 ofSize:2];
      [(PLBBMav16BHwRfLTELogMsg *)v13 setHsicSCC2:v50];

      uint64_t v51 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[416]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxOffPCC:v51];

      v52 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[428]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxOffSCC1:v52];

      uint64_t v53 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[440]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxOffSCC2:v53];

      uint64_t v54 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[452]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxOffSCC3:v54];

      v55 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[420]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxBaselinePCC:v55];

      v56 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[432]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxBaselineSCC1:v56];

      v57 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[444]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxBaselineSCC2:v57];

      v58 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[456]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxBaselineSCC3:v58];

      v59 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[424]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxQicePCC:v59];

      v60 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[436]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxQiceSCC1:v60];

      uint64_t v61 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[448]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxQiceSCC2:v61];

      uint64_t v62 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16BHwMsgParser rfEnhLTEMav16B](self, "rfEnhLTEMav16B")[460]);
      [(PLBBMav16BHwRfLTELogMsg *)v13 setArxQiceSCC3:v62];

      v63 = [(PLBBMav16BHwRfLTELogMsg *)v13 logEventBackwardBBMav16BHwRfLTE];
      uint64_t v64 = [v63 objectForKey:@"entry"];
      v65 = [v63 objectForKey:@"entryKey"];
      [v12 addToGroupPLBBMavHwEntry:v64 withEntryKey:v65];

      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_32;
      }
      uint64_t v66 = objc_opt_class();
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_821;
      v83[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v83[4] = v66;
      if (qword_1EBD5BBF8 != -1) {
        dispatch_once(&qword_1EBD5BBF8, v83);
      }
      if (!byte_1EBD5B970) {
        goto LABEL_32;
      }
      v67 = [NSString stringWithFormat:@"Decoded enh Mav16 HW RF ENH LTE"];
      v68 = (void *)MEMORY[0x1E4F929B8];
      v69 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      uint64_t v70 = [v69 lastPathComponent];
      v71 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]"];
      [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:813];

      uint64_t v72 = PLLogCommon();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v67;
        _os_log_debug_impl(&dword_1D2690000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v78 = objc_opt_class();
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_809;
      v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v84[4] = v78;
      if (qword_1EBD5BBF0 != -1) {
        dispatch_once(&qword_1EBD5BBF0, v84);
      }
      if (byte_1EBD5B96F)
      {
        v63 = [NSString stringWithFormat:@"rfEnhLTE is not valid, return"];
        v79 = (void *)MEMORY[0x1E4F929B8];
        v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
        uint64_t v81 = [v80 lastPathComponent];
        v82 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]"];
        [v79 logMessage:v63 fromFile:v81 fromFunction:v82 fromLineNumber:691];

        v67 = PLLogCommon();
        if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 138412290;
        v88 = v63;
        goto LABEL_30;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v73 = objc_opt_class();
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_800;
    v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v85[4] = v73;
    if (qword_1EBD5BBE8 != -1) {
      dispatch_once(&qword_1EBD5BBE8, v85);
    }
    if (byte_1EBD5B96E)
    {
      v63 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfLTE failed"];
      v74 = (void *)MEMORY[0x1E4F929B8];
      v75 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v76 = [v75 lastPathComponent];
      v77 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16BHwRFEnhLTEWithLogger:]"];
      [v74 logMessage:v63 fromFile:v76 fromFunction:v77 fromLineNumber:680];

      v67 = PLLogCommon();
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412290;
      v88 = v63;
LABEL_30:
      _os_log_debug_impl(&dword_1D2690000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_31;
    }
  }
LABEL_33:
}

uint64_t __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B96D = result;
  return result;
}

uint64_t __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_800(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B96E = result;
  return result;
}

uint64_t __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_809(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B96F = result;
  return result;
}

uint64_t __55__PLBBMav16BHwMsgParser_logMav16BHwRFEnhLTEWithLogger___block_invoke_821(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B970 = result;
  return result;
}

- (void)logMav16HwRFEnhWCDMAWithLogger:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5BC00 != -1) {
      dispatch_once(&qword_1EBD5BC00, block);
    }
    if (byte_1EBD5B971)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:818];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v50 = v6;
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
    uint64_t v15 = [(PLBasebandMessage *)self seqNum];
    uint64_t v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")- -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[4]));
    [(PLBBMavHwRfWCDMALogMsg *)v13 setLogDuration:v17];

    uint64_t v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B] + 8 ofSize:3];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setSCEqStatCnt:v18];

    v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B] + 20 ofSize:3];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDCEqStatCnt:v19];

    v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B] + 32 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setSCQsetEqStatCnt:v20];

    v21 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B] + 48 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDCQsetEqStatCnt:v21];

    uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B] + 64 ofSize:2];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDurInCarrierMode:v22];

    uint64_t v23 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B] + 72 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setRABModeCnt:v23];

    v24 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B] + 88 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setRABTypeCnt:v24];

    v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16BHwMsgParser *)self rfEnhWCDMAMav16B] + 104 ofSize:12];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setTxPwrBucket:v25];

    v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[152]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setFetCnt:v26];

    v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[156]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcRxOnCnt:v27];

    v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[160]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcRxTxOffCnt:v28];

    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[164]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcTimeCnt:v29];

    uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav16BHwMsgParser rfEnhWCDMAMav16B](self, "rfEnhWCDMAMav16B")[168]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcEnergy:v30];

    uint64_t v31 = [(PLBBMavHwRfWCDMALogMsg *)v13 logEventBackwardBBMavHwRfWCDMA];
    uint64_t v32 = [v31 objectForKey:@"entry"];
    v33 = [v31 objectForKey:@"entryKey"];
    [v12 addToGroupPLBBMavHwEntry:v32 withEntryKey:v33];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v34 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_834;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v34;
    if (qword_1EBD5BC10 != -1) {
      dispatch_once(&qword_1EBD5BC10, v46);
    }
    if (!byte_1EBD5B973) {
      goto LABEL_23;
    }
    v35 = [NSString stringWithFormat:@"Decoded enh Mav 16 BB HW RF WCDMA"];
    v36 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
    uint64_t v38 = [v37 lastPathComponent];
    v39 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:]"];
    [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:879];

    v40 = PLLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v50 = v35;
      _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v41 = objc_opt_class();
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_828;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v41;
    if (qword_1EBD5BC08 != -1) {
      dispatch_once(&qword_1EBD5BC08, v47);
    }
    if (byte_1EBD5B972)
    {
      uint64_t v31 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfWCDMA failed"];
      uint64_t v42 = (void *)MEMORY[0x1E4F929B8];
      v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwMsgParser.m"];
      v44 = [v43 lastPathComponent];
      v45 = [NSString stringWithUTF8String:"-[PLBBMav16BHwMsgParser logMav16HwRFEnhWCDMAWithLogger:]"];
      [v42 logMessage:v31 fromFile:v44 fromFunction:v45 fromLineNumber:822];

      v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v50 = v31;
        _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:
}

uint64_t __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B971 = result;
  return result;
}

uint64_t __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_828(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B972 = result;
  return result;
}

uint64_t __56__PLBBMav16BHwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_834(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B973 = result;
  return result;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)mav16BAppsPerf
{
  return self->_mav16BAppsPerf;
}

- (void)setMav16BAppsPerf:(id *)a3
{
  self->_mav16BAppsPerf = a3;
}

- ($E0EEEB5BA8699BABA569A46DBC0146B0)rfEnhWCDMAMav16B
{
  return self->_rfEnhWCDMAMav16B;
}

- (void)setRfEnhWCDMAMav16B:(id *)a3
{
  self->_rfEnhWCDMAMav16B = a3;
}

- ($2AB8F159037074AE77C0B0674ED46DA0)rfEnhLTEMav16B
{
  return self->_rfEnhLTEMav16B;
}

- (void)setRfEnhLTEMav16B:(id *)a3
{
  self->_rfEnhLTEMav16B = a3;
}

- ($092601FE6E8A40A76BE67D22268BABC6)mav16BAppsSleepVeto
{
  return self->_mav16BAppsSleepVeto;
}

- (void)setMav16BAppsSleepVeto:(id *)a3
{
  self->_mav16BAppsSleepVeto = a3;
}

- ($FB43E548459D050BA5797B0FF6452E7F)mav16BMpssSleepVeto
{
  return self->_mav16BMpssSleepVeto;
}

- (void)setMav16BMpssSleepVeto:(id *)a3
{
  self->_mav16BMpssSleepVeto = a3;
}

- ($C9B0E9DB1B0C68408F3136D0BD3A897E)mav16BQdspSpeed
{
  return self->_mav16BQdspSpeed;
}

- (void)setMav16BQdspSpeed:(id *)a3
{
  self->_mav16BQdspSpeed = a3;
}

- ($4D5A38CE05C84672617F6ACDBB187D60)mcpmSleepVetoMav16B
{
  return self->_mcpmSleepVetoMav16B;
}

- (void)setMcpmSleepVetoMav16B:(id *)a3
{
  self->_mcpmSleepVetoMav16B = a3;
}

@end