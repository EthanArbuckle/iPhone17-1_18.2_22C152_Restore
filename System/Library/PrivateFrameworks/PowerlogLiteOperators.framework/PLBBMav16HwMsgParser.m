@interface PLBBMav16HwMsgParser
- ($092601FE6E8A40A76BE67D22268BABC6)mav16AppsSleepVeto;
- ($40C1CFFA044C2C5D117935F53EF88510)mav16AppsPerf;
- ($80284B42353DA8FC8AFCB3E0B8FFAC12)rfEnhLTEMav16;
- ($B928AC1575A032845EE481A0CA20E437)rfEnhWCDMAMav16;
- ($DD746A1FB08B04E88D15572321826CC5)mav16QdspSpeed;
- ($FB43E548459D050BA5797B0FF6452E7F)mav16MpssSleepVeto;
- (BOOL)parseData:(id)a3;
- (void)logMav16AppsPerfWithLogger:(id)a3;
- (void)logMav16HwRFEnhLTEWithLogger:(id)a3;
- (void)logMav16HwRFEnhWCDMAWithLogger:(id)a3;
- (void)logMav16MPSSWithLogger:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setMav16AppsPerf:(id *)a3;
- (void)setMav16AppsSleepVeto:(id *)a3;
- (void)setMav16MpssSleepVeto:(id *)a3;
- (void)setMav16QdspSpeed:(id *)a3;
- (void)setRfEnhLTEMav16:(id *)a3;
- (void)setRfEnhWCDMAMav16:(id *)a3;
@end

@implementation PLBBMav16HwMsgParser

- (BOOL)parseData:(id)a3
{
  uint64_t v527 = *MEMORY[0x1E4F143B8];
  id v441 = a3;
  v4 = (unsigned __int8 *)[v441 bytes];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v520[0] = MEMORY[0x1E4F143A8];
    v520[1] = 3221225472;
    v520[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke;
    v520[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v520[4] = v5;
    v6 = v520;
    if (qword_1EBD5B668 != -1) {
      dispatch_once(&qword_1EBD5B668, v6);
    }

    if (_MergedGlobals_79)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Received data of length %lu", objc_msgSend(v441, "length"));
      v7 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:34];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v522 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v13 = [MEMORY[0x1E4F28E78] string];
  v442 = v13;
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
    v519[0] = MEMORY[0x1E4F143A8];
    v519[1] = 3221225472;
    v519[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_375;
    v519[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v519[4] = v15;
    v16 = v519;
    if (qword_1EBD5B670 != -1) {
      dispatch_once(&qword_1EBD5B670, v16);
    }

    if (byte_1EBD5B611)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Log header starts at offset %llu", v14);
      v17 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E4F929B8];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v20 = [v19 lastPathComponent];
      v21 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:47];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v522 = v17;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v518[0] = MEMORY[0x1E4F143A8];
    v518[1] = 3221225472;
    v518[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_381;
    v518[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v518[4] = v23;
    v24 = v518;
    if (qword_1EBD5B678 != -1) {
      dispatch_once(&qword_1EBD5B678, v24);
    }

    if (byte_1EBD5B612)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Stats header starts at offset %llu", v14 | 0xD);
      v25 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E4F929B8];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v28 = [v27 lastPathComponent];
      v29 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:51];

      v30 = PLLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v522 = v25;
        _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLMav4BasebandHardwareMessage *)self setHeader:v4 + 13];
  objc_msgSend(v442, "appendFormat:", @"Sw Rev[%0x %0x] ", v4[13], v4[14]);
  objc_msgSend(v442, "appendFormat:", @"Hw Rev[%0x %0x] ", v4[15], v4[16]);
  unint64_t v31 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    v517[0] = MEMORY[0x1E4F143A8];
    v517[1] = 3221225472;
    v517[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_393;
    v517[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v517[4] = v32;
    v33 = v517;
    if (qword_1EBD5B680 != -1) {
      dispatch_once(&qword_1EBD5B680, v33);
    }

    unint64_t v31 = 0x1E4F92000;
    if (byte_1EBD5B613)
    {
      v34 = [NSString stringWithFormat:@"Header Info: %@", v442];
      v35 = (void *)MEMORY[0x1E4F929B8];
      v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
      [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:57];

      v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v522 = v34;
        _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v31 = 0x1E4F92000uLL;
    }
  }
  v40 = v4 + 33;
  if ([*(id *)(v31 + 2496) debugEnabled])
  {
    uint64_t v41 = objc_opt_class();
    v516[0] = MEMORY[0x1E4F143A8];
    v516[1] = 3221225472;
    v516[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_399;
    v516[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v516[4] = v41;
    v42 = v516;
    if (qword_1EBD5B688 != -1) {
      dispatch_once(&qword_1EBD5B688, v42);
    }

    if (byte_1EBD5B614)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Size after Seq and Statsheader %lu", objc_msgSend(v441, "length") - 22);
      v43 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E4F929B8];
      v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v46 = [v45 lastPathComponent];
      v47 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
      [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:62];

      v48 = PLLogCommon();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v522 = v43;
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
      v515[0] = MEMORY[0x1E4F143A8];
      v515[1] = 3221225472;
      v515[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_405;
      v515[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v515[4] = v51;
      v52 = v515;
      if (qword_1EBD5B690 != -1) {
        dispatch_once(&qword_1EBD5B690, v52);
      }

      if (byte_1EBD5B615)
      {
        uint64_t v53 = v14;
        v54 = v40;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 1: RPM starts at offset %llu", v49);
        v55 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E4F929B8];
        v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v58 = [v57 lastPathComponent];
        v59 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:69];

        v60 = PLLogCommon();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v55;
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
      v514[0] = MEMORY[0x1E4F143A8];
      v514[1] = 3221225472;
      v514[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_411;
      v514[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v514[4] = v61;
      v62 = v514;
      if (qword_1EBD5B698 != -1) {
        dispatch_once(&qword_1EBD5B698, v62);
      }

      if (byte_1EBD5B616)
      {
        v63 = v40;
        uint64_t v64 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 2: Apps Perf starts at offset %llu", v49);
        v65 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)MEMORY[0x1E4F929B8];
        v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v68 = [v67 lastPathComponent];
        v69 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v66 logMessage:v65 fromFile:v68 fromFunction:v69 fromLineNumber:78];

        v70 = PLLogCommon();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v65;
          _os_log_debug_impl(&dword_1D2690000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v63;
        uint64_t v49 = v64;
      }
    }
    [(PLBBMav16HwMsgParser *)self setMav16AppsPerf:v40];
    v71 = v40 + 28;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v72 = objc_opt_class();
      v513[0] = MEMORY[0x1E4F143A8];
      v513[1] = 3221225472;
      v513[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_417;
      v513[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v513[4] = v72;
      v73 = v513;
      if (qword_1EBD5B6A0 != -1) {
        dispatch_once(&qword_1EBD5B6A0, v73);
      }

      if (byte_1EBD5B617)
      {
        v74 = v40;
        uint64_t v443 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 2: Apps Sleep starts at offset %llu", v49 + 28);
        v75 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x1E4F929B8];
        v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v78 = [v77 lastPathComponent];
        v79 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v76 logMessage:v75 fromFile:v78 fromFunction:v79 fromLineNumber:83];

        v80 = PLLogCommon();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v75;
          _os_log_debug_impl(&dword_1D2690000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v74;
        uint64_t v49 = v443;
      }
    }
    [(PLBBMav13HwMsgParser *)self setAppsSleep:v71];
    v40 += 40;
    v49 += 40;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 3)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v81 = objc_opt_class();
      v512[0] = MEMORY[0x1E4F143A8];
      v512[1] = 3221225472;
      v512[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_423;
      v512[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v512[4] = v81;
      v82 = v512;
      if (qword_1EBD5B6A8 != -1) {
        dispatch_once(&qword_1EBD5B6A8, v82);
      }

      if (byte_1EBD5B618)
      {
        v83 = v40;
        uint64_t v84 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 3: PCIE stats starts at offset %llu", v49);
        v85 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v86 = (void *)MEMORY[0x1E4F929B8];
        v87 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v88 = [v87 lastPathComponent];
        v89 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v86 logMessage:v85 fromFile:v88 fromFunction:v89 fromLineNumber:92];

        v90 = PLLogCommon();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v85;
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
      v511[0] = MEMORY[0x1E4F143A8];
      v511[1] = 3221225472;
      v511[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_429;
      v511[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v511[4] = v91;
      v92 = v511;
      if (qword_1EBD5B6B0 != -1) {
        dispatch_once(&qword_1EBD5B6B0, v92);
      }

      if (byte_1EBD5B619)
      {
        v93 = v40;
        uint64_t v94 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 4: LPASS stats starts at offset %llu", v49);
        v95 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v96 = (void *)MEMORY[0x1E4F929B8];
        v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v98 = [v97 lastPathComponent];
        v99 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v96 logMessage:v95 fromFile:v98 fromFunction:v99 fromLineNumber:101];

        v100 = PLLogCommon();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v95;
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
    uint64_t v444 = v49;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v102 = objc_opt_class();
      v510[0] = MEMORY[0x1E4F143A8];
      v510[1] = 3221225472;
      v510[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_435;
      v510[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v510[4] = v102;
      v103 = v510;
      if (qword_1EBD5B6B8 != -1) {
        dispatch_once(&qword_1EBD5B6B8, v103);
      }

      if (byte_1EBD5B61A)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: Apps Sleep veto stats starts at offset %llu", v49);
        v104 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v105 = (void *)MEMORY[0x1E4F929B8];
        v106 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v107 = [v106 lastPathComponent];
        v108 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v105 logMessage:v104 fromFile:v107 fromFunction:v108 fromLineNumber:110];

        v109 = PLLogCommon();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v104;
          _os_log_debug_impl(&dword_1D2690000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v444;
      }
    }
    [(PLBBMav16HwMsgParser *)self setMav16AppsSleepVeto:v40];
    v110 = v40 + 16;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v111 = objc_opt_class();
      v509[0] = MEMORY[0x1E4F143A8];
      v509[1] = 3221225472;
      v509[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_441;
      v509[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v509[4] = v111;
      v112 = v509;
      if (qword_1EBD5B6C0 != -1) {
        dispatch_once(&qword_1EBD5B6C0, v112);
      }

      if (byte_1EBD5B61B)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: MPSS Sleep veto stats starts at offset %llu", v49 + 16);
        v113 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v114 = (void *)MEMORY[0x1E4F929B8];
        v115 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v116 = [v115 lastPathComponent];
        v117 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v114 logMessage:v113 fromFile:v116 fromFunction:v117 fromLineNumber:115];

        v118 = PLLogCommon();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v113;
          _os_log_debug_impl(&dword_1D2690000, v118, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v444;
      }
    }
    [(PLBBMav16HwMsgParser *)self setMav16MpssSleepVeto:v110];
    v119 = v40 + 100;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v120 = objc_opt_class();
      v508[0] = MEMORY[0x1E4F143A8];
      v508[1] = 3221225472;
      v508[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_447;
      v508[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v508[4] = v120;
      v121 = v508;
      if (qword_1EBD5B6C8 != -1) {
        dispatch_once(&qword_1EBD5B6C8, v121);
      }

      if (byte_1EBD5B61C)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: QDSP Sleep veto stats starts at offset %llu", v49 + 100);
        v122 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v123 = (void *)MEMORY[0x1E4F929B8];
        v124 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v125 = [v124 lastPathComponent];
        v126 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v123 logMessage:v122 fromFile:v125 fromFunction:v126 fromLineNumber:120];

        v127 = PLLogCommon();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v122;
          _os_log_debug_impl(&dword_1D2690000, v127, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v444;
      }
    }
    [(PLBBMav16HwMsgParser *)self setMav16QdspSpeed:v119];
    v128 = v40 + 164;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v129 = objc_opt_class();
      v507[0] = MEMORY[0x1E4F143A8];
      v507[1] = 3221225472;
      v507[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_453;
      v507[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v507[4] = v129;
      v130 = v507;
      if (qword_1EBD5B6D0 != -1) {
        dispatch_once(&qword_1EBD5B6D0, v130);
      }

      if (byte_1EBD5B61D)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: MPSS Sleep stats starts at offset %llu", v49 + 164);
        v131 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v132 = (void *)MEMORY[0x1E4F929B8];
        v133 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v134 = [v133 lastPathComponent];
        v135 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v132 logMessage:v131 fromFile:v134 fromFunction:v135 fromLineNumber:125];

        v136 = PLLogCommon();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v131;
          _os_log_debug_impl(&dword_1D2690000, v136, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v444;
      }
    }
    [(PLBBMav13HwMsgParser *)self setMpssSleep:v128];
    v137 = v40 + 176;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v138 = objc_opt_class();
      v506[0] = MEMORY[0x1E4F143A8];
      v506[1] = 3221225472;
      v506[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_459;
      v506[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v506[4] = v138;
      v139 = v506;
      if (qword_1EBD5B6D8 != -1) {
        dispatch_once(&qword_1EBD5B6D8, v139);
      }

      if (byte_1EBD5B61E)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS stats starts at offset %llu", v49 + 176);
        v140 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v141 = (void *)MEMORY[0x1E4F929B8];
        v142 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v143 = [v142 lastPathComponent];
        v144 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v141 logMessage:v140 fromFile:v143 fromFunction:v144 fromLineNumber:130];

        v145 = PLLogCommon();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v140;
          _os_log_debug_impl(&dword_1D2690000, v145, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v444;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsState:v137];
    v146 = v40 + 184;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v147 = objc_opt_class();
      v505[0] = MEMORY[0x1E4F143A8];
      v505[1] = 3221225472;
      v505[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_465;
      v505[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v505[4] = v147;
      v148 = v505;
      if (qword_1EBD5B6E0 != -1) {
        dispatch_once(&qword_1EBD5B6E0, v148);
      }

      if (byte_1EBD5B61F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS DPO stats starts at offset %llu", v49 + 184);
        v149 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v150 = (void *)MEMORY[0x1E4F929B8];
        v151 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v152 = [v151 lastPathComponent];
        v153 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v150 logMessage:v149 fromFile:v152 fromFunction:v153 fromLineNumber:135];

        v154 = PLLogCommon();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v149;
          _os_log_debug_impl(&dword_1D2690000, v154, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v444;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsDpoState:v146];
    v155 = v40 + 192;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v156 = objc_opt_class();
      v504[0] = MEMORY[0x1E4F143A8];
      v504[1] = 3221225472;
      v504[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_471;
      v504[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v504[4] = v156;
      v157 = v504;
      if (qword_1EBD5B6E8 != -1) {
        dispatch_once(&qword_1EBD5B6E8, v157);
      }

      if (byte_1EBD5B620)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS DPO bin stats starts at offset %llu", v49 + 192);
        v158 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v159 = (void *)MEMORY[0x1E4F929B8];
        v160 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v161 = [v160 lastPathComponent];
        v162 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v159 logMessage:v158 fromFile:v161 fromFunction:v162 fromLineNumber:140];

        v163 = PLLogCommon();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v158;
          _os_log_debug_impl(&dword_1D2690000, v163, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v101;
        uint64_t v49 = v444;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsDpoBins:v155];
    v40 += 216;
    v49 += 216;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 6)
  {
    v449 = v40;
    uint64_t v445 = v49;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v164 = objc_opt_class();
      v503[0] = MEMORY[0x1E4F143A8];
      v503[1] = 3221225472;
      v503[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_477;
      v503[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v503[4] = v164;
      v165 = v503;
      if (qword_1EBD5B6F0 != -1) {
        dispatch_once(&qword_1EBD5B6F0, v165);
      }

      if (byte_1EBD5B621)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: MCPM Sleep veto starts at offset %llu", v49);
        v166 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v167 = (void *)MEMORY[0x1E4F929B8];
        v168 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v169 = [v168 lastPathComponent];
        v170 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v167 logMessage:v166 fromFile:v169 fromFunction:v170 fromLineNumber:149];

        v171 = PLLogCommon();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v166;
          _os_log_debug_impl(&dword_1D2690000, v171, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v449;
        uint64_t v49 = v445;
      }
    }
    [(PLBBMav13HwMsgParser *)self setMcpmSleepVeto:v40];
    v172 = v40 + 52;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v173 = objc_opt_class();
      v502[0] = MEMORY[0x1E4F143A8];
      v502[1] = 3221225472;
      v502[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_483;
      v502[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v502[4] = v173;
      v174 = v502;
      if (qword_1EBD5B6F8 != -1) {
        dispatch_once(&qword_1EBD5B6F8, v174);
      }

      if (byte_1EBD5B622)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Protocol Active starts at offset %llu", v49 + 52);
        v175 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v176 = (void *)MEMORY[0x1E4F929B8];
        v177 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v178 = [v177 lastPathComponent];
        v179 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v176 logMessage:v175 fromFile:v178 fromFunction:v179 fromLineNumber:154];

        v180 = PLLogCommon();
        if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v175;
          _os_log_debug_impl(&dword_1D2690000, v180, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v449;
        uint64_t v49 = v445;
      }
    }
    [(PLBBMav13HwMsgParser *)self setProtocolActive:v172];
    v181 = v40 + 76;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v182 = objc_opt_class();
      v501[0] = MEMORY[0x1E4F143A8];
      v501[1] = 3221225472;
      v501[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_489;
      v501[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v501[4] = v182;
      v183 = v501;
      if (qword_1EBD5B700 != -1) {
        dispatch_once(&qword_1EBD5B700, v183);
      }

      if (byte_1EBD5B623)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Optim mask starts at offset %llu", v49 + 76);
        v184 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v185 = (void *)MEMORY[0x1E4F929B8];
        v186 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v187 = [v186 lastPathComponent];
        v188 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v185 logMessage:v184 fromFile:v187 fromFunction:v188 fromLineNumber:159];

        v189 = PLLogCommon();
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v184;
          _os_log_debug_impl(&dword_1D2690000, v189, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v49 = v445;
      }
    }
    [(PLBBMav13HwMsgParser *)self setOptimMaskArray:v181];
    uint64_t v190 = objc_opt_class();
    v500[0] = MEMORY[0x1E4F143A8];
    v500[1] = 3221225472;
    v500[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_495;
    v500[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v500[4] = v190;
    v191 = v500;
    if (qword_1EBD5B708 != -1) {
      dispatch_once(&qword_1EBD5B708, v191);
    }

    if (byte_1EBD5B624)
    {
      uint64_t v192 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", *(unsigned __int8 *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
      v193 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1]);
      v194 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2]);
      v195 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[3]);
      v448 = (void *)v192;
      v196 = [NSString stringWithFormat:@"Optim Mask [%@ %@ %@ %@]", v192, v193, v194, v195];
      v197 = (void *)MEMORY[0x1E4F929B8];
      v198 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v199 = [v198 lastPathComponent];
      v200 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
      [v197 logMessage:v196 fromFile:v199 fromFunction:v200 fromLineNumber:167];

      v201 = PLLogCommon();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v522 = v196;
        _os_log_debug_impl(&dword_1D2690000, v201, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v50 = 0x1E4F92000uLL;
      uint64_t v49 = v445;
    }
    v49 += 80;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v202 = objc_opt_class();
      v499[0] = MEMORY[0x1E4F143A8];
      v499[1] = 3221225472;
      v499[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_504;
      v499[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v499[4] = v202;
      v203 = v499;
      if (qword_1EBD5B710 != -1) {
        dispatch_once(&qword_1EBD5B710, v203);
      }

      if (byte_1EBD5B625)
      {
        uint64_t v204 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Protocol State starts at offset %llu", v49);
        v205 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v206 = (void *)MEMORY[0x1E4F929B8];
        v207 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v208 = [v207 lastPathComponent];
        v209 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v206 logMessage:v205 fromFile:v208 fromFunction:v209 fromLineNumber:171];

        v210 = PLLogCommon();
        if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v205;
          _os_log_debug_impl(&dword_1D2690000, v210, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v50 = 0x1E4F92000uLL;
        uint64_t v49 = v204;
      }
    }
    v40 = v449 + 80;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v211 = objc_opt_class();
      v498[0] = MEMORY[0x1E4F143A8];
      v498[1] = 3221225472;
      v498[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_510;
      v498[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v498[4] = v211;
      v212 = v498;
      if (qword_1EBD5B718 != -1) {
        dispatch_once(&qword_1EBD5B718, v212);
      }

      if (byte_1EBD5B626)
      {
        uint64_t v213 = v49;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Optim mask value [0x%x]", *(unsigned int *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
        v214 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v215 = (void *)MEMORY[0x1E4F929B8];
        v216 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v217 = [v216 lastPathComponent];
        v218 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v215 logMessage:v214 fromFile:v217 fromFunction:v218 fromLineNumber:176];

        v219 = PLLogCommon();
        if (os_log_type_enabled(v219, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v214;
          _os_log_debug_impl(&dword_1D2690000, v219, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v50 = 0x1E4F92000uLL;
        uint64_t v49 = v213;
      }
    }
    +[PLBBMav13HwMsgParser optimMaskMappings];
    v447 = uint64_t v220 = 0;
    v419 = v454;
    v439 = v464;
    v440 = v456;
    v437 = v460;
    v438 = v462;
    v435 = v466;
    v436 = v458;
    v433 = v470;
    v434 = v468;
    v431 = v474;
    v432 = v472;
    v430 = v476;
    v428 = v480;
    v429 = v478;
    v426 = v484;
    v427 = v482;
    v424 = v488;
    v425 = v486;
    v422 = v492;
    v423 = v490;
    v420 = v496;
    v421 = v494;
    v450 = self;
    do
    {
      if ((*(_DWORD *)[(PLBBMav13HwMsgParser *)self optimMaskArray] >> v220))
      {
        if ([*(id *)(v50 + 2496) debugEnabled])
        {
          uint64_t v221 = objc_opt_class();
          v497[0] = MEMORY[0x1E4F143A8];
          v497[1] = 3221225472;
          v497[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_517;
          v497[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v497[4] = v221;
          v222 = v497;
          if (qword_1EBD5B720 != -1) {
            dispatch_once(&qword_1EBD5B720, v222);
          }

          if (byte_1EBD5B627)
          {
            v223 = NSString;
            v224 = [NSNumber numberWithUnsignedInt:v220];
            v225 = [v447 objectForKeyedSubscript:v224];
            v226 = v40;
            uint64_t v227 = v49;
            v228 = [v223 stringWithFormat:@"Payload %@ is present at offset %llu, pointer %ld", v225, v49, v40];

            v229 = (void *)MEMORY[0x1E4F929B8];
            v230 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v231 = [v230 lastPathComponent];
            v232 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v229 logMessage:v228 fromFile:v231 fromFunction:v232 fromLineNumber:182];

            v233 = PLLogCommon();
            if (os_log_type_enabled(v233, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v522 = v228;
              _os_log_debug_impl(&dword_1D2690000, v233, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v40 = v226;
            uint64_t v49 = v227;
            self = v450;
          }
        }
        switch((int)v220)
        {
          case 0:
            [(PLBBMav13HwMsgParser *)self setProtoStateC2K:v40];
            v49 += 64;
            v40 += 64;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v234 = objc_opt_class();
            v495[0] = MEMORY[0x1E4F143A8];
            v495[1] = 3221225472;
            v496[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_524;
            v496[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v496[2] = v234;
            v235 = v495;
            if (qword_1EBD5B728 != -1) {
              dispatch_once(&qword_1EBD5B728, v235);
            }

            if (!byte_1EBD5B628) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v240 = (void *)MEMORY[0x1E4F929B8];
            v241 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v242 = [v241 lastPathComponent];
            v243 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v240 logMessage:v239 fromFile:v242 fromFunction:v243 fromLineNumber:189];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v245 = objc_opt_class();
            v493[0] = MEMORY[0x1E4F143A8];
            v493[1] = 3221225472;
            v494[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_530;
            v494[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v494[2] = v245;
            v246 = v493;
            if (qword_1EBD5B730 != -1) {
              dispatch_once(&qword_1EBD5B730, v246);
            }

            if (!byte_1EBD5B629) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v247 = (void *)MEMORY[0x1E4F929B8];
            v248 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v249 = [v248 lastPathComponent];
            v250 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v247 logMessage:v239 fromFile:v249 fromFunction:v250 fromLineNumber:195];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v251 = objc_opt_class();
            v491[0] = MEMORY[0x1E4F143A8];
            v491[1] = 3221225472;
            v492[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_533;
            v492[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v492[2] = v251;
            v252 = v491;
            if (qword_1EBD5B738 != -1) {
              dispatch_once(&qword_1EBD5B738, v252);
            }

            if (!byte_1EBD5B62A) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v253 = (void *)MEMORY[0x1E4F929B8];
            v254 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v255 = [v254 lastPathComponent];
            v256 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v253 logMessage:v239 fromFile:v255 fromFunction:v256 fromLineNumber:201];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v257 = objc_opt_class();
            v489[0] = MEMORY[0x1E4F143A8];
            v489[1] = 3221225472;
            v490[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_536;
            v490[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v490[2] = v257;
            v258 = v489;
            if (qword_1EBD5B740 != -1) {
              dispatch_once(&qword_1EBD5B740, v258);
            }

            if (!byte_1EBD5B62B) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v259 = (void *)MEMORY[0x1E4F929B8];
            v260 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v261 = [v260 lastPathComponent];
            v262 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v259 logMessage:v239 fromFile:v261 fromFunction:v262 fromLineNumber:207];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v263 = objc_opt_class();
            v487[0] = MEMORY[0x1E4F143A8];
            v487[1] = 3221225472;
            v488[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_539;
            v488[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v488[2] = v263;
            v264 = v487;
            if (qword_1EBD5B748 != -1) {
              dispatch_once(&qword_1EBD5B748, v264);
            }

            if (!byte_1EBD5B62C) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v265 = (void *)MEMORY[0x1E4F929B8];
            v266 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v267 = [v266 lastPathComponent];
            v268 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v265 logMessage:v239 fromFile:v267 fromFunction:v268 fromLineNumber:213];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v269 = objc_opt_class();
            v485[0] = MEMORY[0x1E4F143A8];
            v485[1] = 3221225472;
            v486[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_542;
            v486[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v486[2] = v269;
            v270 = v485;
            if (qword_1EBD5B750 != -1) {
              dispatch_once(&qword_1EBD5B750, v270);
            }

            if (!byte_1EBD5B62D) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v271 = (void *)MEMORY[0x1E4F929B8];
            v272 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v273 = [v272 lastPathComponent];
            v274 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v271 logMessage:v239 fromFile:v273 fromFunction:v274 fromLineNumber:219];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v275 = objc_opt_class();
            v483[0] = MEMORY[0x1E4F143A8];
            v483[1] = 3221225472;
            v484[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_545;
            v484[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v484[2] = v275;
            v276 = v483;
            if (qword_1EBD5B758 != -1) {
              dispatch_once(&qword_1EBD5B758, v276);
            }

            if (!byte_1EBD5B62E) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v277 = (void *)MEMORY[0x1E4F929B8];
            v278 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v279 = [v278 lastPathComponent];
            v280 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v277 logMessage:v239 fromFile:v279 fromFunction:v280 fromLineNumber:225];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v281 = objc_opt_class();
            v481[0] = MEMORY[0x1E4F143A8];
            v481[1] = 3221225472;
            v482[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_548;
            v482[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v482[2] = v281;
            v282 = v481;
            if (qword_1EBD5B760 != -1) {
              dispatch_once(&qword_1EBD5B760, v282);
            }

            if (!byte_1EBD5B62F) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v283 = (void *)MEMORY[0x1E4F929B8];
            v284 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v285 = [v284 lastPathComponent];
            v286 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v283 logMessage:v239 fromFile:v285 fromFunction:v286 fromLineNumber:231];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v287 = objc_opt_class();
            v479[0] = MEMORY[0x1E4F143A8];
            v479[1] = 3221225472;
            v480[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_551;
            v480[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v480[2] = v287;
            v288 = v479;
            if (qword_1EBD5B768 != -1) {
              dispatch_once(&qword_1EBD5B768, v288);
            }

            if (!byte_1EBD5B630) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v289 = (void *)MEMORY[0x1E4F929B8];
            v290 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v291 = [v290 lastPathComponent];
            v292 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v289 logMessage:v239 fromFile:v291 fromFunction:v292 fromLineNumber:237];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v293 = objc_opt_class();
            v477[0] = MEMORY[0x1E4F143A8];
            v477[1] = 3221225472;
            v478[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_554;
            v478[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v478[2] = v293;
            v294 = v477;
            if (qword_1EBD5B770 != -1) {
              dispatch_once(&qword_1EBD5B770, v294);
            }

            if (!byte_1EBD5B631) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 208);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v295 = (void *)MEMORY[0x1E4F929B8];
            v296 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v297 = [v296 lastPathComponent];
            v298 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v295 logMessage:v239 fromFile:v297 fromFunction:v298 fromLineNumber:243];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v299 = objc_opt_class();
            v475[0] = MEMORY[0x1E4F143A8];
            v475[1] = 3221225472;
            v476[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_557;
            v476[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v476[2] = v299;
            v300 = v475;
            if (qword_1EBD5B778 != -1) {
              dispatch_once(&qword_1EBD5B778, v300);
            }

            if (!byte_1EBD5B632) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v301 = (void *)MEMORY[0x1E4F929B8];
            v302 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v303 = [v302 lastPathComponent];
            v304 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v301 logMessage:v239 fromFile:v303 fromFunction:v304 fromLineNumber:249];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v305 = objc_opt_class();
            v473[0] = MEMORY[0x1E4F143A8];
            v473[1] = 3221225472;
            v474[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_560;
            v474[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v474[2] = v305;
            v306 = v473;
            if (qword_1EBD5B780 != -1) {
              dispatch_once(&qword_1EBD5B780, v306);
            }

            if (!byte_1EBD5B633) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v307 = (void *)MEMORY[0x1E4F929B8];
            v308 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v309 = [v308 lastPathComponent];
            v310 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v307 logMessage:v239 fromFile:v309 fromFunction:v310 fromLineNumber:255];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 12:
            [(PLBBMav16HwMsgParser *)self setRfEnhLTEMav16:v40];
            if ([*(id *)(v50 + 2496) debugEnabled])
            {
              uint64_t v311 = objc_opt_class();
              v463[0] = MEMORY[0x1E4F143A8];
              v463[1] = 3221225472;
              v464[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_575;
              v464[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v464[2] = v311;
              v312 = v463;
              if (qword_1EBD5B7A8 != -1) {
                dispatch_once(&qword_1EBD5B7A8, v312);
              }

              if (byte_1EBD5B638)
              {
                uint64_t v313 = v49;
                v314 = v40;
                objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 574);
                v315 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v316 = (void *)MEMORY[0x1E4F929B8];
                v317 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
                v318 = [v317 lastPathComponent];
                v319 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
                [v316 logMessage:v315 fromFile:v318 fromFunction:v319 fromLineNumber:285];

                v320 = PLLogCommon();
                if (os_log_type_enabled(v320, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v522 = v315;
                  _os_log_debug_impl(&dword_1D2690000, v320, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v314;
                uint64_t v49 = v313;
                self = v450;
              }
            }
            if ([*(id *)(v50 + 2496) debugEnabled])
            {
              uint64_t v321 = objc_opt_class();
              v461[0] = MEMORY[0x1E4F143A8];
              v461[1] = 3221225472;
              v462[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_578;
              v462[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v462[2] = v321;
              v322 = v461;
              if (qword_1EBD5B7B0 != -1) {
                dispatch_once(&qword_1EBD5B7B0, v322);
              }

              if (byte_1EBD5B639)
              {
                uint64_t v446 = v49;
                v323 = v40;
                objc_msgSend(NSString, "stringWithFormat:", @"received PCC bw/band in struct %d,%d. SCC1 bw/band in struct %d,%d", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[569], -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[568], -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[572], -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[570], v419, v420, v421, v422, v423, v424, v425, v426, v427, v428, v429, v430,
                  v431,
                  v432,
                  v433,
                  v434,
                  v435,
                  v436,
                  v437,
                  v438,
                  v439,
                  v440);
                v324 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v325 = (void *)MEMORY[0x1E4F929B8];
                v326 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
                v327 = [v326 lastPathComponent];
                v328 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
                [v325 logMessage:v324 fromFile:v327 fromFunction:v328 fromLineNumber:288];

                v329 = PLLogCommon();
                if (os_log_type_enabled(v329, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v522 = v324;
                  _os_log_debug_impl(&dword_1D2690000, v329, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v50 = 0x1E4F92000uLL;
                v40 = v323;
                uint64_t v49 = v446;
              }
            }
            if ([*(id *)(v50 + 2496) debugEnabled])
            {
              uint64_t v330 = objc_opt_class();
              v459[0] = MEMORY[0x1E4F143A8];
              v459[1] = 3221225472;
              v460[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_584;
              v460[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v460[2] = v330;
              v331 = v459;
              if (qword_1EBD5B7B8 != -1) {
                dispatch_once(&qword_1EBD5B7B8, v331);
              }

              if (byte_1EBD5B63A)
              {
                uint64_t v332 = v49;
                v333 = v40;
                objc_msgSend(NSString, "stringWithFormat:", @"Received ARD stats %u", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[352]);
                v334 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v335 = (void *)MEMORY[0x1E4F929B8];
                v336 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
                v337 = [v336 lastPathComponent];
                v338 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
                [v335 logMessage:v334 fromFile:v337 fromFunction:v338 fromLineNumber:289];

                v339 = PLLogCommon();
                if (os_log_type_enabled(v339, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v522 = v334;
                  _os_log_debug_impl(&dword_1D2690000, v339, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v333;
                uint64_t v49 = v332;
                self = v450;
              }
            }
            v49 += 576;
            v40 += 576;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v340 = objc_opt_class();
            v457[0] = MEMORY[0x1E4F143A8];
            v457[1] = 3221225472;
            v458[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_590;
            v458[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v458[2] = v340;
            v341 = v457;
            if (qword_1EBD5B7C0 != -1) {
              dispatch_once(&qword_1EBD5B7C0, v341);
            }

            if (!byte_1EBD5B63B) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Padding size for padding before LTE struct [%lu]", 2);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v342 = (void *)MEMORY[0x1E4F929B8];
            v343 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v344 = [v343 lastPathComponent];
            v345 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v342 logMessage:v239 fromFile:v344 fromFunction:v345 fromLineNumber:290];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_313;
            }
            goto LABEL_314;
          case 13:
            [(PLBBMav16HwMsgParser *)self setRfEnhWCDMAMav16:v40];
            v49 += 192;
            v40 += 192;
            if (![*(id *)(v50 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v346 = objc_opt_class();
            v465[0] = MEMORY[0x1E4F143A8];
            v465[1] = 3221225472;
            v466[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_572;
            v466[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v466[2] = v346;
            v347 = v465;
            if (qword_1EBD5B7A0 != -1) {
              dispatch_once(&qword_1EBD5B7A0, v347);
            }

            if (!byte_1EBD5B637) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 192);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v348 = (void *)MEMORY[0x1E4F929B8];
            v349 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v350 = [v349 lastPathComponent];
            v351 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v348 logMessage:v239 fromFile:v350 fromFunction:v351 fromLineNumber:279];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v352 = objc_opt_class();
            v467[0] = MEMORY[0x1E4F143A8];
            v467[1] = 3221225472;
            v468[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_569;
            v468[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v468[2] = v352;
            v353 = v467;
            if (qword_1EBD5B798 != -1) {
              dispatch_once(&qword_1EBD5B798, v353);
            }

            if (!byte_1EBD5B636) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 20);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v354 = (void *)MEMORY[0x1E4F929B8];
            v355 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v356 = [v355 lastPathComponent];
            v357 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v354 logMessage:v239 fromFile:v356 fromFunction:v357 fromLineNumber:273];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v358 = objc_opt_class();
            v455[0] = MEMORY[0x1E4F143A8];
            v455[1] = 3221225472;
            v456[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_596;
            v456[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v456[2] = v358;
            v359 = v455;
            if (qword_1EBD5B7C8 != -1) {
              dispatch_once(&qword_1EBD5B7C8, v359);
            }

            if (!byte_1EBD5B63C) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 48);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v360 = (void *)MEMORY[0x1E4F929B8];
            v361 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v362 = [v361 lastPathComponent];
            v363 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v360 logMessage:v239 fromFile:v362 fromFunction:v363 fromLineNumber:296];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v364 = objc_opt_class();
            v471[0] = MEMORY[0x1E4F143A8];
            v471[1] = 3221225472;
            v472[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_563;
            v472[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v472[2] = v364;
            v365 = v471;
            if (qword_1EBD5B788 != -1) {
              dispatch_once(&qword_1EBD5B788, v365);
            }

            if (!byte_1EBD5B634) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 40);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v366 = (void *)MEMORY[0x1E4F929B8];
            v367 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v368 = [v367 lastPathComponent];
            v369 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v366 logMessage:v239 fromFile:v368 fromFunction:v369 fromLineNumber:261];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG)) {
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
            uint64_t v370 = objc_opt_class();
            v469[0] = MEMORY[0x1E4F143A8];
            v469[1] = 3221225472;
            v470[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_566;
            v470[1] = &__block_descriptor_40_e5_v8__0lu32l8;
            v470[2] = v370;
            v371 = v469;
            if (qword_1EBD5B790 != -1) {
              dispatch_once(&qword_1EBD5B790, v371);
            }

            if (!byte_1EBD5B635) {
              break;
            }
            unint64_t v236 = v50;
            uint64_t v237 = v49;
            v238 = v40;
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 32);
            v239 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v372 = (void *)MEMORY[0x1E4F929B8];
            v373 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
            v374 = [v373 lastPathComponent];
            v375 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
            [v372 logMessage:v239 fromFile:v374 fromFunction:v375 fromLineNumber:267];

            v244 = PLLogCommon();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
            {
LABEL_313:
              *(_DWORD *)buf = 138412290;
              v522 = v239;
              _os_log_debug_impl(&dword_1D2690000, v244, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_314:
            v40 = v238;
            uint64_t v49 = v237;
            unint64_t v50 = v236;

            self = v450;
            break;
          case 18:
            [(PLBBMav13HwMsgParser *)self setRfEnhOOS:v40];
            v49 += 156;
            v40 += 156;
            if ([*(id *)(v50 + 2496) debugEnabled])
            {
              uint64_t v376 = objc_opt_class();
              v453[0] = MEMORY[0x1E4F143A8];
              v453[1] = 3221225472;
              v454[0] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_599;
              v454[1] = &__block_descriptor_40_e5_v8__0lu32l8;
              v454[2] = v376;
              v377 = v453;
              if (qword_1EBD5B7D0 != -1) {
                dispatch_once(&qword_1EBD5B7D0, v377);
              }

              if (byte_1EBD5B63D)
              {
                uint64_t v378 = v49;
                v379 = v40;
                objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 156);
                v380 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v381 = (void *)MEMORY[0x1E4F929B8];
                v382 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
                v383 = [v382 lastPathComponent];
                v384 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
                [v381 logMessage:v380 fromFile:v383 fromFunction:v384 fromLineNumber:302];

                v385 = PLLogCommon();
                if (os_log_type_enabled(v385, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v522 = v380;
                  _os_log_debug_impl(&dword_1D2690000, v385, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v40 = v379;
                uint64_t v49 = v378;
              }
            }
            goto LABEL_324;
          default:
            break;
        }
      }
      uint64_t v220 = (v220 + 1);
    }
    while (v220 != 19);
LABEL_324:
    if ([*(id *)(v50 + 2496) debugEnabled])
    {
      uint64_t v386 = objc_opt_class();
      v452[0] = MEMORY[0x1E4F143A8];
      v452[1] = 3221225472;
      v452[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_602;
      v452[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v452[4] = v386;
      v387 = v452;
      if (qword_1EBD5B7D8 != -1) {
        dispatch_once(&qword_1EBD5B7D8, v387);
      }

      if (byte_1EBD5B63E)
      {
        v388 = v40;
        uint64_t v389 = v49;
        v390 = [NSString stringWithFormat:@"End of Proto, Rf, Enh data at offset %llu", v49];
        v391 = (void *)MEMORY[0x1E4F929B8];
        v392 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v393 = [v392 lastPathComponent];
        v394 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v391 logMessage:v390 fromFile:v393 fromFunction:v394 fromLineNumber:308];

        v395 = PLLogCommon();
        if (os_log_type_enabled(v395, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v390;
          _os_log_debug_impl(&dword_1D2690000, v395, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v40 = v388;
        uint64_t v49 = v389;
        self = v450;
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration_mask:v40];
    int v396 = [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask]];
    [MEMORY[0x1E4F28E78] string];
    v398 = unint64_t v397 = v50;
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration:v398];

    [(PLBBMav13HwMsgParser *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask] oftype:0 withData:v40 + 16];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration_mask:&v40[4 * v396 + 16]];
    int v399 = [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask]];
    v400 = [MEMORY[0x1E4F28E78] string];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration:v400];

    [(PLBBMav13HwMsgParser *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask] oftype:1 withData:&v40[4 * v396 + 32]];
    v40 += 4 * v396 + 4 * v399 + 32;
    if ([*(id *)(v397 + 2496) debugEnabled])
    {
      uint64_t v401 = objc_opt_class();
      v451[0] = MEMORY[0x1E4F143A8];
      v451[1] = 3221225472;
      v451[2] = __34__PLBBMav16HwMsgParser_parseData___block_invoke_608;
      v451[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v451[4] = v401;
      v402 = v451;
      if (qword_1EBD5B7E0 != -1) {
        dispatch_once(&qword_1EBD5B7E0, v402);
      }

      if (byte_1EBD5B63F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"End of level 6 at offset %llu", v49 + 4 * v396 + 4 * v399 + 32);
        v403 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v404 = (void *)MEMORY[0x1E4F929B8];
        v405 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v406 = [v405 lastPathComponent];
        v407 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser parseData:]"];
        [v404 logMessage:v403 fromFile:v406 fromFunction:v407 fromLineNumber:332];

        v408 = PLLogCommon();
        if (os_log_type_enabled(v408, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v522 = v403;
          _os_log_debug_impl(&dword_1D2690000, v408, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 8)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_count_mask:v40];
    uint64_t v409 = (uint64_t)&v40[4
                       * [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_count_mask]]+ 16];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_count_mask:v409];
    uint64_t v410 = v409
         + 4
         * [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_count_mask]];
    [(PLMav7BasebandHardwareMessage *)self setHsic:v410 + 16];
    v40 = (unsigned __int8 *)(v410 + 48);
  }
  id v411 = v441;
  unint64_t v412 = (unint64_t)&v40[-[v411 bytes]];
  unint64_t v413 = [v411 length];
  if (v412 > v413)
  {
    v414 = PLLogCommon();
    if (os_log_type_enabled(v414, OS_LOG_TYPE_ERROR))
    {
      id v416 = v411;
      v417 = &v40[-[v416 bytes]];
      uint64_t v418 = [v416 length];
      *(_DWORD *)buf = 134218498;
      v522 = v417;
      __int16 v523 = 2048;
      uint64_t v524 = v418;
      __int16 v525 = 2080;
      v526 = "-[PLBBMav16HwMsgParser parseData:]";
      _os_log_error_impl(&dword_1D2690000, v414, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
  }
  return v412 <= v413;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_79 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_375(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B611 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_381(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B612 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_393(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B613 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_399(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B614 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_405(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B615 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_411(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B616 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_417(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B617 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_423(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B618 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_429(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B619 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_435(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B61A = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_441(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B61B = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_447(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B61C = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_453(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B61D = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_459(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B61E = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_465(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B61F = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_471(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B620 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_477(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B621 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_483(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B622 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_489(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B623 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_495(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B624 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_504(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B625 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_510(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B626 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_517(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B627 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_524(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B628 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_530(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B629 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_533(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B62A = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_536(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B62B = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_539(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B62C = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_542(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B62D = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_545(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B62E = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_548(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B62F = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_551(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B630 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_554(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B631 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_557(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B632 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_560(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B633 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_563(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B634 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_566(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B635 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_569(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B636 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_572(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B637 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_575(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B638 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_578(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B639 = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_584(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B63A = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_590(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B63B = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_596(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B63C = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_599(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B63D = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_602(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B63E = result;
  return result;
}

uint64_t __34__PLBBMav16HwMsgParser_parseData___block_invoke_608(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B63F = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v210 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v207[0] = MEMORY[0x1E4F143A8];
    v207[1] = 3221225472;
    v207[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke;
    v207[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v207[4] = v6;
    v7 = v207;
    if (qword_1EBD5B7E8 != -1) {
      dispatch_once(&qword_1EBD5B7E8, v7);
    }

    if (byte_1EBD5B640)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwMsgParser logWithLogger:]");
      v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:362];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v209 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v206.receiver = self;
  v206.super_class = (Class)PLBBMav16HwMsgParser;
  [(PLBasebandHardwareMessage *)&v206 logRawWithLogger:v4];
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
    [(PLMav4BasebandHardwareMessage *)self logHeaderWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logRPMWithLogger:v14];
    [(PLBBMav16HwMsgParser *)self logMav16AppsPerfWithLogger:v14];
    [(PLBBMav16HwMsgParser *)self logMav16MPSSWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logLPASSWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logPeripheralsWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logPcieWithLogger:v14];
    v18 = objc_opt_new();
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 1) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateC2K])
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v19 = objc_opt_class();
        v204[0] = MEMORY[0x1E4F143A8];
        v204[1] = 3221225472;
        v204[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_634;
        v204[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v204[4] = v19;
        v20 = v204;
        if (qword_1EBD5B7F8 != -1) {
          dispatch_once(&qword_1EBD5B7F8, v20);
        }

        if (byte_1EBD5B642)
        {
          v21 = [NSString stringWithFormat:@"protoStateC2K is valid"];
          v22 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v24 = [v23 lastPathComponent];
          v25 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:400];

          v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v21;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000;
        }
      }
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v18 state:[(PLBBMav13HwMsgParser *)self protoStateC2K] forRAT:0];
      uint64_t v27 = 0;
      int v28 = 1;
    }
    else
    {
      int v28 = 0;
      uint64_t v27 = 6;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 2) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateHDR])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v36 = objc_opt_class();
        v203[0] = MEMORY[0x1E4F143A8];
        v203[1] = 3221225472;
        v203[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_640;
        v203[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v203[4] = v36;
        v37 = v203;
        if (qword_1EBD5B800 != -1) {
          dispatch_once(&qword_1EBD5B800, v37);
        }

        if (byte_1EBD5B643)
        {
          v38 = [NSString stringWithFormat:@"protoStateHDR is valid"];
          v39 = (void *)MEMORY[0x1E4F929B8];
          v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          uint64_t v41 = [v40 lastPathComponent];
          v42 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:411];

          v43 = PLLogCommon();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v38;
            _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      int v28 = 1;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v18 state:[(PLBBMav13HwMsgParser *)self protoStateHDR] forRAT:1];
      uint64_t v27 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 4) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateGSM])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v44 = objc_opt_class();
        v202[0] = MEMORY[0x1E4F143A8];
        v202[1] = 3221225472;
        v202[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_646;
        v202[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v202[4] = v44;
        v45 = v202;
        if (qword_1EBD5B808 != -1) {
          dispatch_once(&qword_1EBD5B808, v45);
        }

        if (byte_1EBD5B644)
        {
          v46 = [NSString stringWithFormat:@"protoStateGSM is valid"];
          v47 = (void *)MEMORY[0x1E4F929B8];
          v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          uint64_t v49 = [v48 lastPathComponent];
          unint64_t v50 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:422];

          uint64_t v51 = PLLogCommon();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v46;
            _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      uint64_t v27 = 2;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v18 state:[(PLBBMav13HwMsgParser *)self protoStateGSM] forRAT:2];
      int v28 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 8) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateWCDMA])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v52 = objc_opt_class();
        v201[0] = MEMORY[0x1E4F143A8];
        v201[1] = 3221225472;
        v201[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_652;
        v201[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v201[4] = v52;
        uint64_t v53 = v201;
        if (qword_1EBD5B810 != -1) {
          dispatch_once(&qword_1EBD5B810, v53);
        }

        if (byte_1EBD5B645)
        {
          v54 = [NSString stringWithFormat:@"protoStateWCDMA is valid"];
          v55 = (void *)MEMORY[0x1E4F929B8];
          v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v57 = [v56 lastPathComponent];
          v58 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:433];

          v59 = PLLogCommon();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v54;
            _os_log_debug_impl(&dword_1D2690000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      uint64_t v27 = 3;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v18 state:[(PLBBMav13HwMsgParser *)self protoStateWCDMA] forRAT:3];
      int v28 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 0x10) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateLTE])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v60 = objc_opt_class();
        v200[0] = MEMORY[0x1E4F143A8];
        v200[1] = 3221225472;
        v200[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_658;
        v200[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v200[4] = v60;
        uint64_t v61 = v200;
        if (qword_1EBD5B818 != -1) {
          dispatch_once(&qword_1EBD5B818, v61);
        }

        if (byte_1EBD5B646)
        {
          v62 = [NSString stringWithFormat:@"protoStateLTE is valid"];
          v63 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v64 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v65 = [v64 lastPathComponent];
          v66 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v63 logMessage:v62 fromFile:v65 fromFunction:v66 fromLineNumber:444];

          v67 = PLLogCommon();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v62;
            _os_log_debug_impl(&dword_1D2690000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      uint64_t v27 = 4;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v18 state:[(PLBBMav13HwMsgParser *)self protoStateLTE] forRAT:4];
      int v28 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 0x20) != 0
      && [(PLBBMav13HwMsgParser *)self protoStateTDS])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v68 = objc_opt_class();
        v199[0] = MEMORY[0x1E4F143A8];
        v199[1] = 3221225472;
        v199[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_664;
        v199[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v199[4] = v68;
        v69 = v199;
        if (qword_1EBD5B820 != -1) {
          dispatch_once(&qword_1EBD5B820, v69);
        }

        if (byte_1EBD5B647)
        {
          v70 = [NSString stringWithFormat:@"protoStateTDS is valid"];
          v71 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v72 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v73 = [v72 lastPathComponent];
          v74 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v71 logMessage:v70 fromFile:v73 fromFunction:v74 fromLineNumber:455];

          v75 = PLLogCommon();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v70;
            _os_log_debug_impl(&dword_1D2690000, v75, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      uint64_t v27 = 5;
      [(PLBBMav13HwMsgParser *)self logProtocolWithLogger:v14 container:v18 state:[(PLBBMav13HwMsgParser *)self protoStateTDS] forRAT:5];
      int v28 = 1;
    }
    [(PLBBMavLogMsg *)v14 setProtocolStateHistDict:v18];
    [(PLMav7BasebandHardwareMessage *)self logProtocolActiveWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logSleepVetoWithLogger:v14];
    if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
    {
      [(PLMav7BasebandHardwareMessage *)self logClockWithLogger:v14];
      [(PLMav7BasebandHardwareMessage *)self logHSICWithLogger:v14];
    }
    [(PLBBMavLogMsg *)v14 addToGroupPLBBMav16HwOther];
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 4) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataLTE])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v76 = objc_opt_class();
        v198[0] = MEMORY[0x1E4F143A8];
        v198[1] = 3221225472;
        v198[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_670;
        v198[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v198[4] = v76;
        v77 = v198;
        if (qword_1EBD5B828 != -1) {
          dispatch_once(&qword_1EBD5B828, v77);
        }

        if (byte_1EBD5B648)
        {
          id v181 = v4;
          v78 = [NSString stringWithFormat:@"rfDataLTE is valid"];
          v79 = (void *)MEMORY[0x1E4F929B8];
          v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          uint64_t v81 = [v80 lastPathComponent];
          v82 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v79 logMessage:v78 fromFile:v81 fromFunction:v82 fromLineNumber:480];

          v83 = PLLogCommon();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v78;
            _os_log_debug_impl(&dword_1D2690000, v83, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v181;
          unint64_t v5 = 0x1E4F92000;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataLTE] forRAT:4];
      int v84 = 1;
    }
    else
    {
      int v84 = 0;
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 2) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataWCDMA])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v85 = objc_opt_class();
        v197[0] = MEMORY[0x1E4F143A8];
        v197[1] = 3221225472;
        v197[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_676;
        v197[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v197[4] = v85;
        v86 = v197;
        if (qword_1EBD5B830 != -1) {
          dispatch_once(&qword_1EBD5B830, v86);
        }

        if (byte_1EBD5B649)
        {
          id v182 = v4;
          v87 = [NSString stringWithFormat:@"rfDataWCDMA is valid"];
          v88 = (void *)MEMORY[0x1E4F929B8];
          v89 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v90 = [v89 lastPathComponent];
          uint64_t v91 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v88 logMessage:v87 fromFile:v90 fromFunction:v91 fromLineNumber:489];

          v92 = PLLogCommon();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v87;
            _os_log_debug_impl(&dword_1D2690000, v92, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v182;
          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataWCDMA] forRAT:3];
      int v84 = 1;
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 1) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataGSM])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v93 = objc_opt_class();
        v196[0] = MEMORY[0x1E4F143A8];
        v196[1] = 3221225472;
        v196[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_682;
        v196[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v196[4] = v93;
        uint64_t v94 = v196;
        if (qword_1EBD5B838 != -1) {
          dispatch_once(&qword_1EBD5B838, v94);
        }

        if (byte_1EBD5B64A)
        {
          id v183 = v4;
          v95 = [NSString stringWithFormat:@"rfDataGSM is valid"];
          v96 = (void *)MEMORY[0x1E4F929B8];
          v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v98 = [v97 lastPathComponent];
          v99 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v96 logMessage:v95 fromFile:v98 fromFunction:v99 fromLineNumber:498];

          v100 = PLLogCommon();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v95;
            _os_log_debug_impl(&dword_1D2690000, v100, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v183;
          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataGSM] forRAT:2];
      int v84 = 1;
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 8) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataTDS])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v101 = objc_opt_class();
        v195[0] = MEMORY[0x1E4F143A8];
        v195[1] = 3221225472;
        v195[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_688;
        v195[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v195[4] = v101;
        uint64_t v102 = v195;
        if (qword_1EBD5B840 != -1) {
          dispatch_once(&qword_1EBD5B840, v102);
        }

        if (byte_1EBD5B64B)
        {
          id v184 = v4;
          v103 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          v104 = (void *)MEMORY[0x1E4F929B8];
          v105 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v106 = [v105 lastPathComponent];
          v107 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v104 logMessage:v103 fromFile:v106 fromFunction:v107 fromLineNumber:507];

          v108 = PLLogCommon();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v103;
            _os_log_debug_impl(&dword_1D2690000, v108, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v184;
          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataTDS] forRAT:5];
      int v84 = 1;
    }
    if ((*[(PLBBMav13HwMsgParser *)self optimMaskArray] & 0x40) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataC2K])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v109 = objc_opt_class();
        v194[0] = MEMORY[0x1E4F143A8];
        v194[1] = 3221225472;
        v194[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_694;
        v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v194[4] = v109;
        v110 = v194;
        if (qword_1EBD5B848 != -1) {
          dispatch_once(&qword_1EBD5B848, v110);
        }

        if (byte_1EBD5B64C)
        {
          id v185 = v4;
          uint64_t v111 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          v112 = (void *)MEMORY[0x1E4F929B8];
          v113 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v114 = [v113 lastPathComponent];
          v115 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v112 logMessage:v111 fromFile:v114 fromFunction:v115 fromLineNumber:516];

          v116 = PLLogCommon();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v111;
            _os_log_debug_impl(&dword_1D2690000, v116, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v4 = v185;
          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfDataC2K] forRAT:0];
      int v84 = 1;
    }
    if (*[(PLBBMav13HwMsgParser *)self optimMaskArray] < 0
      && [(PLBBMav13HwMsgParser *)self rfData1xEVDO])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v117 = objc_opt_class();
        v193[0] = MEMORY[0x1E4F143A8];
        v193[1] = 3221225472;
        v193[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_697;
        v193[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v193[4] = v117;
        v118 = v193;
        if (qword_1EBD5B850 != -1) {
          dispatch_once(&qword_1EBD5B850, v118);
        }

        if (byte_1EBD5B64D)
        {
          v119 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          uint64_t v120 = (void *)MEMORY[0x1E4F929B8];
          v121 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v122 = [v121 lastPathComponent];
          v123 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v120 logMessage:v119 fromFile:v122 fromFunction:v123 fromLineNumber:525];

          v124 = PLLogCommon();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v119;
            _os_log_debug_impl(&dword_1D2690000, v124, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000;
        }
      }
      [(PLBBMav13HwMsgParser *)self logLegacyRFWithLogger:v14 usingData:[(PLBBMav13HwMsgParser *)self rfData1xEVDO] forRAT:1];
    }
    else if (((v84 | v28 ^ 1) & 1) == 0)
    {
      [(PLBBMav13HwMsgParser *)self logProtocolOnlyWithLogger:v14 forRAT:v27];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x10) != 0
      && [(PLBBMav16HwMsgParser *)self rfEnhLTEMav16])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v125 = objc_opt_class();
        v192[0] = MEMORY[0x1E4F143A8];
        v192[1] = 3221225472;
        v192[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_700;
        v192[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v192[4] = v125;
        v126 = v192;
        if (qword_1EBD5B858 != -1) {
          dispatch_once(&qword_1EBD5B858, v126);
        }

        if (byte_1EBD5B64E)
        {
          v127 = [NSString stringWithFormat:@"rfEnhLTEMav16 is valid"];
          v128 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v129 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v130 = [v129 lastPathComponent];
          v131 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v128 logMessage:v127 fromFile:v130 fromFunction:v131 fromLineNumber:540];

          v132 = PLLogCommon();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v127;
            _os_log_debug_impl(&dword_1D2690000, v132, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav16HwMsgParser *)self logMav16HwRFEnhLTEWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x20) != 0
      && [(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v133 = objc_opt_class();
        v191[0] = MEMORY[0x1E4F143A8];
        v191[1] = 3221225472;
        v191[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_706;
        v191[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v191[4] = v133;
        v134 = v191;
        if (qword_1EBD5B860 != -1) {
          dispatch_once(&qword_1EBD5B860, v134);
        }

        if (byte_1EBD5B64F)
        {
          v135 = [NSString stringWithFormat:@"rfEnhWCDMAMav16 is valid"];
          v136 = (void *)MEMORY[0x1E4F929B8];
          v137 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          uint64_t v138 = [v137 lastPathComponent];
          v139 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v136 logMessage:v135 fromFile:v138 fromFunction:v139 fromLineNumber:546];

          v140 = PLLogCommon();
          if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v135;
            _os_log_debug_impl(&dword_1D2690000, v140, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav16HwMsgParser *)self logMav16HwRFEnhWCDMAWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x40) != 0
      && [(PLBBMav13HwMsgParser *)self rfEnhGSM])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v141 = objc_opt_class();
        v190[0] = MEMORY[0x1E4F143A8];
        v190[1] = 3221225472;
        v190[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_712;
        v190[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v190[4] = v141;
        v142 = v190;
        if (qword_1EBD5B868 != -1) {
          dispatch_once(&qword_1EBD5B868, v142);
        }

        if (byte_1EBD5B650)
        {
          v143 = [NSString stringWithFormat:@"rfEnhGSM is valid"];
          v144 = (void *)MEMORY[0x1E4F929B8];
          v145 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v146 = [v145 lastPathComponent];
          uint64_t v147 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v144 logMessage:v143 fromFile:v146 fromFunction:v147 fromLineNumber:552];

          v148 = PLLogCommon();
          if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v143;
            _os_log_debug_impl(&dword_1D2690000, v148, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
        uint64_t v149 = objc_opt_class();
        v189[0] = MEMORY[0x1E4F143A8];
        v189[1] = 3221225472;
        v189[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_718;
        v189[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v189[4] = v149;
        v150 = v189;
        if (qword_1EBD5B870 != -1) {
          dispatch_once(&qword_1EBD5B870, v150);
        }

        if (byte_1EBD5B651)
        {
          v151 = [NSString stringWithFormat:@"rfEnhTDS is valid"];
          v152 = (void *)MEMORY[0x1E4F929B8];
          v153 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v154 = [v153 lastPathComponent];
          v155 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v152 logMessage:v151 fromFile:v154 fromFunction:v155 fromLineNumber:558];

          uint64_t v156 = PLLogCommon();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v151;
            _os_log_debug_impl(&dword_1D2690000, v156, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
        uint64_t v157 = objc_opt_class();
        v188[0] = MEMORY[0x1E4F143A8];
        v188[1] = 3221225472;
        v188[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_724;
        v188[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v188[4] = v157;
        v158 = v188;
        if (qword_1EBD5B878 != -1) {
          dispatch_once(&qword_1EBD5B878, v158);
        }

        if (byte_1EBD5B652)
        {
          v159 = [NSString stringWithFormat:@"rfEnh1x is valid"];
          v160 = (void *)MEMORY[0x1E4F929B8];
          v161 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v162 = [v161 lastPathComponent];
          v163 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v160 logMessage:v159 fromFile:v162 fromFunction:v163 fromLineNumber:564];

          uint64_t v164 = PLLogCommon();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v159;
            _os_log_debug_impl(&dword_1D2690000, v164, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
        uint64_t v165 = objc_opt_class();
        v187[0] = MEMORY[0x1E4F143A8];
        v187[1] = 3221225472;
        v187[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_730;
        v187[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v187[4] = v165;
        v166 = v187;
        if (qword_1EBD5B880 != -1) {
          dispatch_once(&qword_1EBD5B880, v166);
        }

        if (byte_1EBD5B653)
        {
          v167 = [NSString stringWithFormat:@"rfEnhHDR is valid"];
          v168 = (void *)MEMORY[0x1E4F929B8];
          v169 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v170 = [v169 lastPathComponent];
          v171 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v168 logMessage:v167 fromFile:v170 fromFunction:v171 fromLineNumber:570];

          v172 = PLLogCommon();
          if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v167;
            _os_log_debug_impl(&dword_1D2690000, v172, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
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
        uint64_t v173 = objc_opt_class();
        v186[0] = MEMORY[0x1E4F143A8];
        v186[1] = 3221225472;
        v186[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_736;
        v186[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v186[4] = v173;
        v174 = v186;
        if (qword_1EBD5B888 != -1) {
          dispatch_once(&qword_1EBD5B888, v174);
        }

        if (byte_1EBD5B654)
        {
          v175 = [NSString stringWithFormat:@"rfEnhOOS is valid"];
          v176 = (void *)MEMORY[0x1E4F929B8];
          v177 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
          v178 = [v177 lastPathComponent];
          v179 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
          [v176 logMessage:v175 fromFile:v178 fromFunction:v179 fromLineNumber:576];

          v180 = PLLogCommon();
          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v175;
            _os_log_debug_impl(&dword_1D2690000, v180, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      [(PLBBMav13HwMsgParser *)self logHwRFOOSWithLogger:v14];
    }
    [(PLBBMavLogMsg *)v14 logEventBackwardGrpEntriesBBMav16Hw];
  }
  else
  {
    v18 = [MEMORY[0x1E4F28E78] string];
    objc_msgSend(v18, "appendFormat:", @"Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3);
    [(PLBBMavLogMsg *)v14 setError:v18];
    [(PLBBMavLogMsg *)v14 setType:@"BB HW Error"];
    [(PLBBMavLogMsg *)v14 logEventBackwardMavBBHwOther];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v29 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_627;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v29;
      if (qword_1EBD5B7F0 != -1) {
        dispatch_once(&qword_1EBD5B7F0, block);
      }
      if (byte_1EBD5B641)
      {
        v30 = [NSString stringWithFormat:@"SW version mismatch. Received %d, expected %d cannot process, returning", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3];
        unint64_t v31 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v33 = [v32 lastPathComponent];
        v34 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logWithLogger:]"];
        [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:380];

        v35 = PLLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v209 = v30;
          _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B640 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_627(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B641 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_634(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B642 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_640(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B643 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_646(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B644 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_652(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B645 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_658(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B646 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_664(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B647 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_670(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B648 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_676(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B649 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_682(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B64A = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_688(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B64B = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_694(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B64C = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_697(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B64D = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_700(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B64E = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_706(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B64F = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_712(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B650 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_718(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B651 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_724(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B652 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_730(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B653 = result;
  return result;
}

uint64_t __38__PLBBMav16HwMsgParser_logWithLogger___block_invoke_736(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B654 = result;
  return result;
}

- (void)logMav16AppsPerfWithLogger:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5B890 != -1) {
      dispatch_once(&qword_1EBD5B890, block);
    }
    if (byte_1EBD5B655)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:587];

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
  if ([(PLBBMav16HwMsgParser *)self mav16AppsPerf])
  {
    v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self mav16AppsPerf] ofSize:7];
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
    v47[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_745;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v14;
    if (qword_1EBD5B898 != -1) {
      dispatch_once(&qword_1EBD5B898, v47);
    }
    if (byte_1EBD5B656)
    {
      v13 = [NSString stringWithFormat:@"Perf_Level=<unknown>"];
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:599];

      uint64_t v19 = PLLogCommon();
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
      v46[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_751;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v22;
      if (qword_1EBD5B8A0 != -1) {
        dispatch_once(&qword_1EBD5B8A0, v46);
      }
      if (byte_1EBD5B657)
      {
        uint64_t v23 = [NSString stringWithFormat:@"Sleep_Stats=<unknown>"];
        v24 = (void *)MEMORY[0x1E4F929B8];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v26 = [v25 lastPathComponent];
        uint64_t v27 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:610];

        int v28 = PLLogCommon();
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
  if ([(PLBBMav16HwMsgParser *)self mav16AppsSleepVeto])
  {
    uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self mav16AppsSleepVeto] ofSize:4];
    [v12 setAppsSleepVeto:v29];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v30 = objc_opt_class();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_760;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v30;
      if (qword_1EBD5B8A8 != -1) {
        dispatch_once(&qword_1EBD5B8A8, v45);
      }
      if (byte_1EBD5B658)
      {
        unint64_t v31 = [NSString stringWithFormat:@"Sleep_Veto_Duration=<unknown>"];
        uint64_t v32 = (void *)MEMORY[0x1E4F929B8];
        v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        v34 = [v33 lastPathComponent];
        v35 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]"];
        [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:622];

        uint64_t v36 = PLLogCommon();
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
    v44[2] = __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_769;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v37;
    if (qword_1EBD5B8B0 != -1) {
      dispatch_once(&qword_1EBD5B8B0, v44);
    }
    if (byte_1EBD5B659)
    {
      v38 = [NSString stringWithFormat:@"Decoded BB HW APPS"];
      v39 = (void *)MEMORY[0x1E4F929B8];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      uint64_t v41 = [v40 lastPathComponent];
      v42 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16AppsPerfWithLogger:]"];
      [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:626];

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

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B655 = result;
  return result;
}

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_745(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B656 = result;
  return result;
}

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_751(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B657 = result;
  return result;
}

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_760(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B658 = result;
  return result;
}

uint64_t __51__PLBBMav16HwMsgParser_logMav16AppsPerfWithLogger___block_invoke_769(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B659 = result;
  return result;
}

- (void)logMav16MPSSWithLogger:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5B8B8 != -1) {
      dispatch_once(&qword_1EBD5B8B8, block);
    }
    if (byte_1EBD5B65A)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:631];

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
  if ([(PLBBMav16HwMsgParser *)self mav16MpssSleepVeto])
  {
    uint64_t v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self mav16MpssSleepVeto] ofSize:21];
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
    v38[2] = __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_778;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v16;
    if (qword_1EBD5B8C0 != -1) {
      dispatch_once(&qword_1EBD5B8C0, v38);
    }
    if (byte_1EBD5B65B)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Sleep_Veto=<unknown>"];
      v17 = (void *)MEMORY[0x1E4F929B8];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      uint64_t v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]"];
      [v17 logMessage:v15 fromFile:v19 fromFunction:v20 fromLineNumber:648];

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
  if ([(PLBBMav16HwMsgParser *)self mav16QdspSpeed])
  {
    uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self mav16QdspSpeed] ofSize:16];
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
    v37[2] = __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_787;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v23;
    if (qword_1EBD5B8C8 != -1) {
      dispatch_once(&qword_1EBD5B8C8, v37);
    }
    if (byte_1EBD5B65C)
    {
      uint64_t v22 = [NSString stringWithFormat:@"Q6SW_Perf=<unknown>"];
      v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v26 = [v25 lastPathComponent];
      uint64_t v27 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]"];
      [v24 logMessage:v22 fromFile:v26 fromFunction:v27 fromLineNumber:661];

      int v28 = PLLogCommon();
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
    v36[2] = __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_793;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v29;
    if (qword_1EBD5B8D0 != -1) {
      dispatch_once(&qword_1EBD5B8D0, v36);
    }
    if (byte_1EBD5B65D)
    {
      uint64_t v30 = [NSString stringWithFormat:@"Decoded BB HW MPSS"];
      unint64_t v31 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v33 = [v32 lastPathComponent];
      v34 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16MPSSWithLogger:]"];
      [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:664];

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

uint64_t __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B65A = result;
  return result;
}

uint64_t __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_778(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B65B = result;
  return result;
}

uint64_t __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_787(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B65C = result;
  return result;
}

uint64_t __47__PLBBMav16HwMsgParser_logMav16MPSSWithLogger___block_invoke_793(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B65D = result;
  return result;
}

- (void)logMav16HwRFEnhLTEWithLogger:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5B8D8 != -1) {
      dispatch_once(&qword_1EBD5B8D8, block);
    }
    if (byte_1EBD5B65E)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:669];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  v13 = objc_alloc_init(PLBBMav16HwRfLTELogMsg);
  if (v13)
  {
    uint64_t v14 = [(PLBasebandMessage *)self agent];
    [(PLBBMsgRoot *)v13 setAgent:v14];

    [(PLBBMav16HwRfLTELogMsg *)v13 setError:@"not set"];
    uint64_t v15 = [(PLBasebandMessage *)self seqNum];
    uint64_t v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMav16HwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x10) == 0
      || [(PLBBMav16HwMsgParser *)self rfEnhLTEMav16])
    {
      v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")- -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[4]));
      [(PLBBMav16HwRfLTELogMsg *)v13 setLogDuration:v17];

      v18 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[8]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setDupMode:v18];

      uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[568]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setPCCFreq:v19];

      v20 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[569]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setPCCBw:v20];

      v21 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[570]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setSCC1Freq:v21];

      uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[572]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setSCC1Bw:v22];

      uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[571]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setSCC2Freq:v23];

      v24 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[573]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setSCC2Bw:v24];

      v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 12 ofSize:17];
      [(PLBBMav16HwRfLTELogMsg *)v13 setDlTBSzCnt:v25];

      v26 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 80 ofSize:12];
      [(PLBBMav16HwRfLTELogMsg *)v13 setTxPwrCnt:v26];

      uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 128 ofSize:6];
      [(PLBBMav16HwRfLTELogMsg *)v13 setCaSCCCnt:v27];

      int v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 152 ofSize:3];
      [(PLBBMav16HwRfLTELogMsg *)v13 setUlCaSCCCnt:v28];

      uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 164 ofSize:6];
      [(PLBBMav16HwRfLTELogMsg *)v13 setActRxTxCnt:v29];

      uint64_t v30 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 188 ofSize:7];
      [(PLBBMav16HwRfLTELogMsg *)v13 setSleepStateIdleCnt:v30];

      unint64_t v31 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 216 ofSize:7];
      [(PLBBMav16HwRfLTELogMsg *)v13 setSleepStateConnCnt:v31];

      uint64_t v32 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 244 ofSize:6];
      [(PLBBMav16HwRfLTELogMsg *)v13 setRsrpIdleCnt:v32];

      v33 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 268 ofSize:6];
      [(PLBBMav16HwRfLTELogMsg *)v13 setRsrpConnCnt:v33];

      v34 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 292 ofSize:6];
      [(PLBBMav16HwRfLTELogMsg *)v13 setSinrIdleCnt:v34];

      v35 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 316 ofSize:6];
      [(PLBBMav16HwRfLTELogMsg *)v13 setSinrConnCnt:v35];

      uint64_t v36 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 340 ofSize:3];
      [(PLBBMav16HwRfLTELogMsg *)v13 setNlicStateCnt:v36];

      uint64_t v37 = [(PLBasebandHardwareMessage *)self convertUint64ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 504 ofSize:8];
      [(PLBBMav16HwRfLTELogMsg *)v13 setBpeStats:v37];

      v38 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[352]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setArdRxDOff:v38];

      v39 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[492]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setUSleepPCCCnt:v39];

      v40 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[496]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setUSleepSCC1Cnt:v40];

      uint64_t v41 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[500]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setUSleepSCC2Cnt:v41];

      uint64_t v42 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 356 ofSize:2];
      [(PLBBMav16HwRfLTELogMsg *)v13 setHsicPCC:v42];

      v43 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 364 ofSize:2];
      [(PLBBMav16HwRfLTELogMsg *)v13 setHsicSCC1:v43];

      uint64_t v44 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 372 ofSize:2];
      [(PLBBMav16HwRfLTELogMsg *)v13 setHsicSCC2:v44];

      v45 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[380]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxOffPCC:v45];

      v46 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[416]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxOffSCC1:v46];

      v47 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav16HwMsgParser rfEnhLTEMav16](self, "rfEnhLTEMav16")[452]);
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxOffSCC2:v47];

      v48 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 392 ofSize:3];
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxBaselinePCC:v48];

      uint64_t v49 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 428 ofSize:3];
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxBaselineSCC1:v49];

      unint64_t v50 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 464 ofSize:3];
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxBaselineSCC2:v50];

      uint64_t v51 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 404 ofSize:3];
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxQicePCC:v51];

      uint64_t v52 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 440 ofSize:3];
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxQiceSCC1:v52];

      uint64_t v53 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhLTEMav16] + 476 ofSize:3];
      [(PLBBMav16HwRfLTELogMsg *)v13 setArxQiceSCC2:v53];

      v54 = [(PLBBMav16HwRfLTELogMsg *)v13 logEventBackwardBBMav16HwRfLTE];
      v55 = [v54 objectForKey:@"entry"];
      v56 = [v54 objectForKey:@"entryKey"];
      [v12 addToGroupPLBBMavHwEntry:v55 withEntryKey:v56];

      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_32;
      }
      uint64_t v57 = objc_opt_class();
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_821;
      v74[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v74[4] = v57;
      if (qword_1EBD5B8F0 != -1) {
        dispatch_once(&qword_1EBD5B8F0, v74);
      }
      if (!byte_1EBD5B661) {
        goto LABEL_32;
      }
      v58 = [NSString stringWithFormat:@"Decoded enh Mav16 HW RF ENH LTE"];
      v59 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      uint64_t v61 = [v60 lastPathComponent];
      v62 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]"];
      [v59 logMessage:v58 fromFile:v61 fromFunction:v62 fromLineNumber:807];

      v63 = PLLogCommon();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v58;
        _os_log_debug_impl(&dword_1D2690000, v63, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v69 = objc_opt_class();
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_809;
      v75[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v75[4] = v69;
      if (qword_1EBD5B8E8 != -1) {
        dispatch_once(&qword_1EBD5B8E8, v75);
      }
      if (byte_1EBD5B660)
      {
        v54 = [NSString stringWithFormat:@"rfEnhLTEMav16 is not valid, return"];
        v70 = (void *)MEMORY[0x1E4F929B8];
        v71 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
        uint64_t v72 = [v71 lastPathComponent];
        v73 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]"];
        [v70 logMessage:v54 fromFile:v72 fromFunction:v73 fromLineNumber:684];

        v58 = PLLogCommon();
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 138412290;
        v79 = v54;
        goto LABEL_30;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v64 = objc_opt_class();
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_800;
    v76[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v76[4] = v64;
    if (qword_1EBD5B8E0 != -1) {
      dispatch_once(&qword_1EBD5B8E0, v76);
    }
    if (byte_1EBD5B65F)
    {
      v54 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfLTE failed"];
      v65 = (void *)MEMORY[0x1E4F929B8];
      v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v67 = [v66 lastPathComponent];
      uint64_t v68 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16HwRFEnhLTEWithLogger:]"];
      [v65 logMessage:v54 fromFile:v67 fromFunction:v68 fromLineNumber:673];

      v58 = PLLogCommon();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412290;
      v79 = v54;
LABEL_30:
      _os_log_debug_impl(&dword_1D2690000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_31;
    }
  }
LABEL_33:
}

uint64_t __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B65E = result;
  return result;
}

uint64_t __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_800(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B65F = result;
  return result;
}

uint64_t __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_809(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B660 = result;
  return result;
}

uint64_t __53__PLBBMav16HwMsgParser_logMav16HwRFEnhLTEWithLogger___block_invoke_821(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B661 = result;
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
    block[2] = __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5B8F8 != -1) {
      dispatch_once(&qword_1EBD5B8F8, block);
    }
    if (byte_1EBD5B662)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:]");
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:812];

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

    v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")- -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[4]));
    [(PLBBMavHwRfWCDMALogMsg *)v13 setLogDuration:v17];

    v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16] + 8 ofSize:3];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setSCEqStatCnt:v18];

    uint64_t v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16] + 20 ofSize:3];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDCEqStatCnt:v19];

    v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16] + 32 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setSCQsetEqStatCnt:v20];

    v21 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16] + 48 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDCQsetEqStatCnt:v21];

    uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16] + 64 ofSize:2];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDurInCarrierMode:v22];

    uint64_t v23 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16] + 72 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setRABModeCnt:v23];

    v24 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16] + 88 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setRABTypeCnt:v24];

    v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav16HwMsgParser *)self rfEnhWCDMAMav16] + 104 ofSize:16];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setTxPwrBucket:v25];

    v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[168]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setFetCnt:v26];

    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[172]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcRxOnCnt:v27];

    int v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[176]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcRxTxOffCnt:v28];

    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[180]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcTimeCnt:v29];

    uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav16HwMsgParser rfEnhWCDMAMav16](self, "rfEnhWCDMAMav16")[184]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcEnergy:v30];

    unint64_t v31 = [(PLBBMavHwRfWCDMALogMsg *)v13 logEventBackwardBBMavHwRfWCDMA];
    uint64_t v32 = [v31 objectForKey:@"entry"];
    v33 = [v31 objectForKey:@"entryKey"];
    [v12 addToGroupPLBBMavHwEntry:v32 withEntryKey:v33];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v34 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_834;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v34;
    if (qword_1EBD5B908 != -1) {
      dispatch_once(&qword_1EBD5B908, v46);
    }
    if (!byte_1EBD5B664) {
      goto LABEL_23;
    }
    v35 = [NSString stringWithFormat:@"Decoded enh Mav 16 BB HW RF WCDMA"];
    uint64_t v36 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
    v38 = [v37 lastPathComponent];
    v39 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:]"];
    [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:873];

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
    v47[2] = __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_828;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v41;
    if (qword_1EBD5B900 != -1) {
      dispatch_once(&qword_1EBD5B900, v47);
    }
    if (byte_1EBD5B663)
    {
      unint64_t v31 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfWCDMA failed"];
      uint64_t v42 = (void *)MEMORY[0x1E4F929B8];
      v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwMsgParser.m"];
      uint64_t v44 = [v43 lastPathComponent];
      v45 = [NSString stringWithUTF8String:"-[PLBBMav16HwMsgParser logMav16HwRFEnhWCDMAWithLogger:]"];
      [v42 logMessage:v31 fromFile:v44 fromFunction:v45 fromLineNumber:816];

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

uint64_t __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B662 = result;
  return result;
}

uint64_t __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_828(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B663 = result;
  return result;
}

uint64_t __55__PLBBMav16HwMsgParser_logMav16HwRFEnhWCDMAWithLogger___block_invoke_834(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B664 = result;
  return result;
}

- ($40C1CFFA044C2C5D117935F53EF88510)mav16AppsPerf
{
  return self->_mav16AppsPerf;
}

- (void)setMav16AppsPerf:(id *)a3
{
  self->_mav16AppsPerf = a3;
}

- ($B928AC1575A032845EE481A0CA20E437)rfEnhWCDMAMav16
{
  return self->_rfEnhWCDMAMav16;
}

- (void)setRfEnhWCDMAMav16:(id *)a3
{
  self->_rfEnhWCDMAMauint64_t v16 = a3;
}

- ($80284B42353DA8FC8AFCB3E0B8FFAC12)rfEnhLTEMav16
{
  return self->_rfEnhLTEMav16;
}

- (void)setRfEnhLTEMav16:(id *)a3
{
  self->_rfEnhLTEMauint64_t v16 = a3;
}

- ($092601FE6E8A40A76BE67D22268BABC6)mav16AppsSleepVeto
{
  return self->_mav16AppsSleepVeto;
}

- (void)setMav16AppsSleepVeto:(id *)a3
{
  self->_mav16AppsSleepVeto = a3;
}

- ($FB43E548459D050BA5797B0FF6452E7F)mav16MpssSleepVeto
{
  return self->_mav16MpssSleepVeto;
}

- (void)setMav16MpssSleepVeto:(id *)a3
{
  self->_mav16MpssSleepVeto = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)mav16QdspSpeed
{
  return self->_mav16QdspSpeed;
}

- (void)setMav16QdspSpeed:(id *)a3
{
  self->_mav16QdspSpeed = a3;
}

@end