@interface PLBBMav13HwMsgParser
+ (id)optimMaskMappings;
- ($02140193D122F4399F556265180A383D)rfLTE;
- ($0C0A99A7A001DBC942837B17909EADCE)rfEnhLTE;
- ($13802F9730B8C46AAB76E09031085152)appsPerf;
- ($13802F9730B8C46AAB76E09031085152)gpsDpoBins;
- ($13802F9730B8C46AAB76E09031085152)protocolActive;
- ($4B3C126EB6F1D3E89E2CF41D7D563E2C)rfEnhC2K;
- ($4B43A875349FDE5438E0A7464BB34732)rfData;
- ($615E96CE89CC24DAA6A822A8D29B2798)rfEnh1xEVDO;
- ($6247608A9E858CB8A0F4CC99D4816BFE)appsSleep;
- ($6247608A9E858CB8A0F4CC99D4816BFE)mpssSleep;
- ($6259AD99E0296D9E5FB04EEC1BEE6709)mcpmSleepVeto;
- ($6988F191A2E699FD2FDBF2169EACE1F4)appsSleepVeto;
- ($6A53C83E73901DD0C34CF18301855816)rpmData;
- ($6A788595DF0CE5F229CF8C0E99A1983A)mpssSleepVeto;
- ($75CBB50FA0EA21D6D12C68A4AD2E7930)rfEnhOOS;
- ($81F89CDC83781E2F8C3B7C08B1FDA3B1)rfEnhTDS;
- ($C1957A8FD3E0093B731E920E3B161E9A)pcieState;
- ($D38AB55F17507DDEA729FCED855170D9)rfEnhGSM;
- ($D6D8E5E4F24C290D662940195489C6C4)rfDataWCDMA;
- ($DD746A1FB08B04E88D15572321826CC5)protoStateC2K;
- ($DD746A1FB08B04E88D15572321826CC5)protoStateGSM;
- ($DD746A1FB08B04E88D15572321826CC5)protoStateHDR;
- ($DD746A1FB08B04E88D15572321826CC5)protoStateLTE;
- ($DD746A1FB08B04E88D15572321826CC5)protoStateTDS;
- ($DD746A1FB08B04E88D15572321826CC5)protoStateWCDMA;
- ($DD746A1FB08B04E88D15572321826CC5)protocolState;
- ($E07DBFA35793E6ACBF53B370E2AAA817)qdspSpeed;
- ($E087ED438533671735DC466A2DECADBB)rfData1xEVDO;
- ($E087ED438533671735DC466A2DECADBB)rfDataC2K;
- ($E087ED438533671735DC466A2DECADBB)rfDataGSM;
- ($E087ED438533671735DC466A2DECADBB)rfDataLTE;
- ($E087ED438533671735DC466A2DECADBB)rfDataTDS;
- ($E0EEEB5BA8699BABA569A46DBC0146B0)rfEnhWCDMA;
- ($FC730E2F24BB0828101253C3B52D6220)gpsDpoState;
- ($FC730E2F24BB0828101253C3B52D6220)gpsState;
- ($FC730E2F24BB0828101253C3B52D6220)lpassState;
- (BOOL)parseData:(id)a3;
- (PLBBMav13HwMsgParser)initWithData:(id)a3;
- (char)optimMaskArray;
- (int)GetClockCount:(_PLMav7BasebandHWStatsClockStateMask *)a3;
- (void)SetClocks:(_PLMav7BasebandHWStatsClockStateMask *)a3 oftype:(int)a4 withData:(char *)a5;
- (void)logAppsPerfWithLogger:(id)a3;
- (void)logHwRF1xWithLogger:(id)a3;
- (void)logHwRFEnhLTEWithLogger:(id)a3;
- (void)logHwRFEnhWCDMAWithLogger:(id)a3;
- (void)logHwRFGSMWithLogger:(id)a3;
- (void)logHwRFHDRWithLogger:(id)a3;
- (void)logHwRFOOSWithLogger:(id)a3;
- (void)logHwRFTDSWithLogger:(id)a3;
- (void)logLPASSWithLogger:(id)a3;
- (void)logLegacyRFWithLogger:(id)a3 usingData:(id *)a4 forRAT:(unsigned int)a5;
- (void)logMPSSWithLogger:(id)a3;
- (void)logPcieWithLogger:(id)a3;
- (void)logPeripheralsWithLogger:(id)a3;
- (void)logProtocolOnlyWithLogger:(id)a3 forRAT:(unsigned int)a4;
- (void)logProtocolWithLogger:(id)a3 container:(id)a4 state:(id *)a5 forRAT:(unsigned int)a6;
- (void)logRPMWithLogger:(id)a3;
- (void)logSleepVetoWithLogger:(id)a3;
- (void)logWithLogger:(id)a3;
- (void)setAppsPerf:(id *)a3;
- (void)setAppsSleep:(id *)a3;
- (void)setAppsSleepVeto:(id *)a3;
- (void)setGpsDpoBins:(id *)a3;
- (void)setGpsDpoState:(id *)a3;
- (void)setGpsState:(id *)a3;
- (void)setLpassState:(id *)a3;
- (void)setMcpmSleepVeto:(id *)a3;
- (void)setMpssSleep:(id *)a3;
- (void)setMpssSleepVeto:(id *)a3;
- (void)setOptimMaskArray:(char *)a3;
- (void)setPcieState:(id *)a3;
- (void)setProtoStateC2K:(id *)a3;
- (void)setProtoStateGSM:(id *)a3;
- (void)setProtoStateHDR:(id *)a3;
- (void)setProtoStateLTE:(id *)a3;
- (void)setProtoStateTDS:(id *)a3;
- (void)setProtoStateWCDMA:(id *)a3;
- (void)setProtocolActive:(id *)a3;
- (void)setProtocolState:(id *)a3;
- (void)setQdspSpeed:(id *)a3;
- (void)setRfData1xEVDO:(id *)a3;
- (void)setRfData:(id *)a3;
- (void)setRfDataC2K:(id *)a3;
- (void)setRfDataGSM:(id *)a3;
- (void)setRfDataLTE:(id *)a3;
- (void)setRfDataTDS:(id *)a3;
- (void)setRfDataWCDMA:(id *)a3;
- (void)setRfEnh1xEVDO:(id *)a3;
- (void)setRfEnhC2K:(id *)a3;
- (void)setRfEnhGSM:(id *)a3;
- (void)setRfEnhLTE:(id *)a3;
- (void)setRfEnhOOS:(id *)a3;
- (void)setRfEnhTDS:(id *)a3;
- (void)setRfEnhWCDMA:(id *)a3;
- (void)setRfLTE:(id *)a3;
- (void)setRpmData:(id *)a3;
@end

@implementation PLBBMav13HwMsgParser

+ (id)optimMaskMappings
{
  v5[19] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F29E8770;
  v4[1] = &unk_1F29E8788;
  v5[0] = @"PROTO_CDMA2K";
  v5[1] = @"PROTO_1xEVDO";
  v4[2] = &unk_1F29E87A0;
  v4[3] = &unk_1F29E87B8;
  v5[2] = @"PROTO_GSM";
  v5[3] = @"PROTO_WCDMA";
  v4[4] = &unk_1F29E87D0;
  v4[5] = &unk_1F29E87E8;
  v5[4] = @"PROTO_LTE";
  v5[5] = @"PROTO_TDSCDMA";
  v4[6] = &unk_1F29E8800;
  v4[7] = &unk_1F29E8818;
  v5[6] = @"RF_CDMA2K";
  v5[7] = @"RF_1xEVDO";
  v4[8] = &unk_1F29E8830;
  v4[9] = &unk_1F29E8848;
  v5[8] = @"RF_GSM";
  v5[9] = @"RF_WCDMA";
  v4[10] = &unk_1F29E8860;
  v4[11] = &unk_1F29E8878;
  v5[10] = @"RF_LTE";
  v5[11] = @"RF_TDSCDMA";
  v4[12] = &unk_1F29E8890;
  v4[13] = &unk_1F29E88A8;
  v5[12] = @"ENH_1x";
  v5[13] = @"ENH_HDR";
  v4[14] = &unk_1F29E88C0;
  v4[15] = &unk_1F29E88D8;
  v5[14] = @"ENH_GSM";
  v5[15] = @"ENH_WCDMA";
  v4[16] = &unk_1F29E88F0;
  v4[17] = &unk_1F29E8908;
  v5[16] = @"ENH_LTE";
  v5[17] = @"ENH_TDSCDMA";
  v4[18] = &unk_1F29E8920;
  v5[18] = @"ENH_OOS";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:19];
  return v2;
}

- (PLBBMav13HwMsgParser)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLBBMav13HwMsgParser;
  v5 = [(PLMav7BasebandHardwareMessage *)&v9 initWithData:v4];
  v6 = v5;
  if (v5 && ![(PLBBMav13HwMsgParser *)v5 parseData:v4]) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v377 = *MEMORY[0x1E4F143B8];
  id v325 = a3;
  id v4 = (unsigned __int8 *)[v325 bytes];
  v5 = [MEMORY[0x1E4F28E78] string];
  v6 = v5;
  if (*v4 == 129)
  {
    objc_msgSend(v5, "appendFormat:", @"SeqInd[%x] ", 129);
    v4 += 2;
  }
  [(PLMav4BasebandHardwareMessage *)self setHeader:v4 + 13];
  objc_msgSend(v6, "appendFormat:", @"Sw Rev[%0x %0x] ", v4[13], v4[14]);
  objc_msgSend(v6, "appendFormat:", @"Hw Rev[%0x %0x] ", v4[15], v4[16]);
  unint64_t v7 = 0x1E4F92000uLL;
  v326 = v6;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v370[0] = MEMORY[0x1E4F143A8];
    v370[1] = 3221225472;
    v370[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke;
    v370[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v370[4] = v8;
    objc_super v9 = v370;
    if (qword_1EBD5C6E8 != -1) {
      dispatch_once(&qword_1EBD5C6E8, v9);
    }

    if (_MergedGlobals_112)
    {
      v10 = [NSString stringWithFormat:@"Header Info: %@", v6];
      v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:84];

      v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v372 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v16 = v4 + 33;
  [(PLMav4BasebandHardwareMessage *)self setLogDuration:([(PLMav4BasebandHardwareMessage *)self header][16]- [(PLMav4BasebandHardwareMessage *)self header][12])];
  if ([(PLMav4BasebandHardwareMessage *)self level])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v369[0] = MEMORY[0x1E4F143A8];
      v369[1] = 3221225472;
      v369[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_476;
      v369[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v369[4] = v17;
      v18 = v369;
      if (qword_1EBD5C6F0 != -1) {
        dispatch_once(&qword_1EBD5C6F0, v18);
      }

      if (byte_1EBD5C679)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 1: RPM starts at offset %llu", 20);
        v19 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E4F929B8];
        v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v22 = [v21 lastPathComponent];
        v23 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:94];

        v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v19;
          _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav13HwMsgParser *)self setRpmData:v4 + 33];
    v16 = v4 + 57;
    uint64_t v25 = 44;
  }
  else
  {
    uint64_t v25 = 20;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 2)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      v368[0] = MEMORY[0x1E4F143A8];
      v368[1] = 3221225472;
      v368[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_482;
      v368[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v368[4] = v26;
      v27 = v368;
      if (qword_1EBD5C6F8 != -1) {
        dispatch_once(&qword_1EBD5C6F8, v27);
      }

      if (byte_1EBD5C67A)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 2: Apps Perf starts at offset %llu", v25);
        v28 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E4F929B8];
        v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v31 = [v30 lastPathComponent];
        v32 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:103];

        v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v28;
          _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav13HwMsgParser *)self setAppsPerf:v16];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v34 = objc_opt_class();
      v367[0] = MEMORY[0x1E4F143A8];
      v367[1] = 3221225472;
      v367[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_488;
      v367[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v367[4] = v34;
      v35 = v367;
      if (qword_1EBD5C700 != -1) {
        dispatch_once(&qword_1EBD5C700, v35);
      }

      if (byte_1EBD5C67B)
      {
        uint64_t v328 = v25;
        objc_msgSend(NSString, "stringWithFormat:", @"Level 2: Apps Sleep starts at offset %llu", v25 + 24);
        v36 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E4F929B8];
        v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v39 = [v38 lastPathComponent];
        v40 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:108];

        v41 = PLLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v36;
          _os_log_debug_impl(&dword_1D2690000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v328;
      }
    }
    [(PLBBMav13HwMsgParser *)self setAppsSleep:v16 + 24];
    v16 += 36;
    v25 += 36;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 3)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v42 = objc_opt_class();
      v366[0] = MEMORY[0x1E4F143A8];
      v366[1] = 3221225472;
      v366[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_494;
      v366[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v366[4] = v42;
      v43 = v366;
      if (qword_1EBD5C708 != -1) {
        dispatch_once(&qword_1EBD5C708, v43);
      }

      if (byte_1EBD5C67C)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 3: PCIE stats starts at offset %llu", v25);
        v44 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E4F929B8];
        v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v47 = [v46 lastPathComponent];
        v48 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:117];

        v49 = PLLogCommon();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v44;
          _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav13HwMsgParser *)self setPcieState:v16];
    v16 += 12;
    v25 += 12;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 4)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v50 = objc_opt_class();
      v365[0] = MEMORY[0x1E4F143A8];
      v365[1] = 3221225472;
      v365[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_500;
      v365[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v365[4] = v50;
      v51 = v365;
      if (qword_1EBD5C710 != -1) {
        dispatch_once(&qword_1EBD5C710, v51);
      }

      if (byte_1EBD5C67D)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 4: LPASS stats starts at offset %llu", v25);
        v52 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)MEMORY[0x1E4F929B8];
        v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v55 = [v54 lastPathComponent];
        v56 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v53 logMessage:v52 fromFile:v55 fromFunction:v56 fromLineNumber:126];

        v57 = PLLogCommon();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v52;
          _os_log_debug_impl(&dword_1D2690000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav13HwMsgParser *)self setLpassState:v16];
    v16 += 8;
    v25 += 8;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 5)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v58 = objc_opt_class();
      v364[0] = MEMORY[0x1E4F143A8];
      v364[1] = 3221225472;
      v364[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_506;
      v364[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v364[4] = v58;
      v59 = v364;
      if (qword_1EBD5C718 != -1) {
        dispatch_once(&qword_1EBD5C718, v59);
      }

      if (byte_1EBD5C67E)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: Apps Sleep veto stats starts at offset %llu", v25);
        v60 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)MEMORY[0x1E4F929B8];
        v62 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v63 = [v62 lastPathComponent];
        v64 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v61 logMessage:v60 fromFile:v63 fromFunction:v64 fromLineNumber:135];

        v65 = PLLogCommon();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v60;
          _os_log_debug_impl(&dword_1D2690000, v65, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav13HwMsgParser *)self setAppsSleepVeto:v16];
    uint64_t v329 = v25;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v66 = objc_opt_class();
      v363[0] = MEMORY[0x1E4F143A8];
      v363[1] = 3221225472;
      v363[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_512;
      v363[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v363[4] = v66;
      v67 = v363;
      if (qword_1EBD5C720 != -1) {
        dispatch_once(&qword_1EBD5C720, v67);
      }

      if (byte_1EBD5C67F)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: MPSS Sleep veto stats starts at offset %llu", v25 + 20);
        v68 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)MEMORY[0x1E4F929B8];
        v70 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v71 = [v70 lastPathComponent];
        v72 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v69 logMessage:v68 fromFile:v71 fromFunction:v72 fromLineNumber:140];

        v73 = PLLogCommon();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v68;
          _os_log_debug_impl(&dword_1D2690000, v73, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v329;
      }
    }
    [(PLBBMav13HwMsgParser *)self setMpssSleepVeto:v16 + 20];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v74 = objc_opt_class();
      v362[0] = MEMORY[0x1E4F143A8];
      v362[1] = 3221225472;
      v362[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_518;
      v362[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v362[4] = v74;
      v75 = v362;
      if (qword_1EBD5C728 != -1) {
        dispatch_once(&qword_1EBD5C728, v75);
      }

      if (byte_1EBD5C680)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: QDSP Sleep veto stats starts at offset %llu", v25 + 88);
        v76 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)MEMORY[0x1E4F929B8];
        v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v79 = [v78 lastPathComponent];
        v80 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v77 logMessage:v76 fromFile:v79 fromFunction:v80 fromLineNumber:145];

        v81 = PLLogCommon();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v76;
          _os_log_debug_impl(&dword_1D2690000, v81, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v329;
      }
    }
    [(PLBBMav13HwMsgParser *)self setQdspSpeed:v16 + 88];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v82 = objc_opt_class();
      v361[0] = MEMORY[0x1E4F143A8];
      v361[1] = 3221225472;
      v361[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_524;
      v361[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v361[4] = v82;
      v83 = v361;
      if (qword_1EBD5C730 != -1) {
        dispatch_once(&qword_1EBD5C730, v83);
      }

      if (byte_1EBD5C681)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: MPSS Sleep stats starts at offset %llu", v25 + 136);
        v84 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v85 = (void *)MEMORY[0x1E4F929B8];
        v86 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v87 = [v86 lastPathComponent];
        v88 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v85 logMessage:v84 fromFile:v87 fromFunction:v88 fromLineNumber:150];

        v89 = PLLogCommon();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v84;
          _os_log_debug_impl(&dword_1D2690000, v89, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v329;
      }
    }
    [(PLBBMav13HwMsgParser *)self setMpssSleep:v16 + 136];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v90 = objc_opt_class();
      v360[0] = MEMORY[0x1E4F143A8];
      v360[1] = 3221225472;
      v360[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_530;
      v360[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v360[4] = v90;
      v91 = v360;
      if (qword_1EBD5C738 != -1) {
        dispatch_once(&qword_1EBD5C738, v91);
      }

      if (byte_1EBD5C682)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS stats starts at offset %llu", v25 + 148);
        v92 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v93 = (void *)MEMORY[0x1E4F929B8];
        v94 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v95 = [v94 lastPathComponent];
        v96 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v93 logMessage:v92 fromFile:v95 fromFunction:v96 fromLineNumber:155];

        v97 = PLLogCommon();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v92;
          _os_log_debug_impl(&dword_1D2690000, v97, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v329;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsState:v16 + 148];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v98 = objc_opt_class();
      v359[0] = MEMORY[0x1E4F143A8];
      v359[1] = 3221225472;
      v359[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_536;
      v359[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v359[4] = v98;
      v99 = v359;
      if (qword_1EBD5C740 != -1) {
        dispatch_once(&qword_1EBD5C740, v99);
      }

      if (byte_1EBD5C683)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS DPO stats starts at offset %llu", v25 + 156);
        v100 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v101 = (void *)MEMORY[0x1E4F929B8];
        v102 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v103 = [v102 lastPathComponent];
        v104 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v101 logMessage:v100 fromFile:v103 fromFunction:v104 fromLineNumber:160];

        v105 = PLLogCommon();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v100;
          _os_log_debug_impl(&dword_1D2690000, v105, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v329;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsDpoState:v16 + 156];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v106 = objc_opt_class();
      v358[0] = MEMORY[0x1E4F143A8];
      v358[1] = 3221225472;
      v358[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_542;
      v358[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v358[4] = v106;
      v107 = v358;
      if (qword_1EBD5C748 != -1) {
        dispatch_once(&qword_1EBD5C748, v107);
      }

      if (byte_1EBD5C684)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 5: GPS DPO bin stats starts at offset %llu", v25 + 164);
        v108 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v109 = (void *)MEMORY[0x1E4F929B8];
        v110 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v111 = [v110 lastPathComponent];
        v112 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v109 logMessage:v108 fromFile:v111 fromFunction:v112 fromLineNumber:165];

        v113 = PLLogCommon();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v108;
          _os_log_debug_impl(&dword_1D2690000, v113, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v329;
      }
    }
    [(PLBBMav13HwMsgParser *)self setGpsDpoBins:v16 + 164];
    v16 += 188;
    v25 += 188;
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 6)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v114 = objc_opt_class();
      v357[0] = MEMORY[0x1E4F143A8];
      v357[1] = 3221225472;
      v357[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_548;
      v357[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v357[4] = v114;
      v115 = v357;
      if (qword_1EBD5C750 != -1) {
        dispatch_once(&qword_1EBD5C750, v115);
      }

      if (byte_1EBD5C685)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: MCPM Sleep veto starts at offset %llu", v25);
        v116 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v117 = (void *)MEMORY[0x1E4F929B8];
        v118 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v119 = [v118 lastPathComponent];
        v120 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v117 logMessage:v116 fromFile:v119 fromFunction:v120 fromLineNumber:174];

        v121 = PLLogCommon();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v116;
          _os_log_debug_impl(&dword_1D2690000, v121, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [(PLBBMav13HwMsgParser *)self setMcpmSleepVeto:v16];
    uint64_t v330 = v25;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v122 = objc_opt_class();
      v356[0] = MEMORY[0x1E4F143A8];
      v356[1] = 3221225472;
      v356[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_554;
      v356[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v356[4] = v122;
      v123 = v356;
      if (qword_1EBD5C758 != -1) {
        dispatch_once(&qword_1EBD5C758, v123);
      }

      if (byte_1EBD5C686)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Protocol Active starts at offset %llu", v25 + 52);
        v124 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v125 = (void *)MEMORY[0x1E4F929B8];
        v126 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v127 = [v126 lastPathComponent];
        v128 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v125 logMessage:v124 fromFile:v127 fromFunction:v128 fromLineNumber:179];

        v129 = PLLogCommon();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v124;
          _os_log_debug_impl(&dword_1D2690000, v129, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v330;
      }
    }
    [(PLBBMav13HwMsgParser *)self setProtocolActive:v16 + 52];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v130 = objc_opt_class();
      v355[0] = MEMORY[0x1E4F143A8];
      v355[1] = 3221225472;
      v355[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_560;
      v355[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v355[4] = v130;
      v131 = v355;
      if (qword_1EBD5C760 != -1) {
        dispatch_once(&qword_1EBD5C760, v131);
      }

      if (byte_1EBD5C687)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Optim mask starts at offset %llu", v25 + 76);
        v132 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v133 = (void *)MEMORY[0x1E4F929B8];
        v134 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v135 = [v134 lastPathComponent];
        v136 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v133 logMessage:v132 fromFile:v135 fromFunction:v136 fromLineNumber:184];

        v137 = PLLogCommon();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v132;
          _os_log_debug_impl(&dword_1D2690000, v137, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v25 = v330;
      }
    }
    [(PLBBMav13HwMsgParser *)self setOptimMaskArray:v16 + 76];
    uint64_t v138 = objc_opt_class();
    v354[0] = MEMORY[0x1E4F143A8];
    v354[1] = 3221225472;
    v354[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_566;
    v354[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v354[4] = v138;
    v139 = v354;
    if (qword_1EBD5C768 != -1) {
      dispatch_once(&qword_1EBD5C768, v139);
    }

    if (byte_1EBD5C688)
    {
      uint64_t v140 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", *(unsigned __int8 *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
      v141 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[1]);
      v142 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[2]);
      v143 = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", -[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray")[3]);
      v324 = (void *)v140;
      v144 = [NSString stringWithFormat:@"Optim Mask [%@ %@ %@ %@]", v140, v141, v142, v143];
      v145 = (void *)MEMORY[0x1E4F929B8];
      v146 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v147 = [v146 lastPathComponent];
      v148 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
      [v145 logMessage:v144 fromFile:v147 fromFunction:v148 fromLineNumber:192];

      v149 = PLLogCommon();
      if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v372 = v144;
        _os_log_debug_impl(&dword_1D2690000, v149, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v25 = v330;
      unint64_t v7 = 0x1E4F92000uLL;
    }
    uint64_t v150 = v25 + 80;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v151 = objc_opt_class();
      v353[0] = MEMORY[0x1E4F143A8];
      v353[1] = 3221225472;
      v353[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_575;
      v353[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v353[4] = v151;
      v152 = v353;
      if (qword_1EBD5C770 != -1) {
        dispatch_once(&qword_1EBD5C770, v152);
      }

      if (byte_1EBD5C689)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Protocol State starts at offset %llu", v150);
        v153 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v154 = (void *)MEMORY[0x1E4F929B8];
        v155 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v156 = [v155 lastPathComponent];
        v157 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v154 logMessage:v153 fromFile:v156 fromFunction:v157 fromLineNumber:196];

        v158 = PLLogCommon();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v153;
          _os_log_debug_impl(&dword_1D2690000, v158, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v16 += 80;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v159 = objc_opt_class();
      v352[0] = MEMORY[0x1E4F143A8];
      v352[1] = 3221225472;
      v352[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_581;
      v352[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v352[4] = v159;
      v160 = v352;
      if (qword_1EBD5C778 != -1) {
        dispatch_once(&qword_1EBD5C778, v160);
      }

      if (byte_1EBD5C68A)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Level 6: Optim mask value [0x%x]", *(unsigned int *)-[PLBBMav13HwMsgParser optimMaskArray](self, "optimMaskArray"));
        v161 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        v162 = (void *)MEMORY[0x1E4F929B8];
        v163 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v164 = [v163 lastPathComponent];
        v165 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v162 logMessage:v161 fromFile:v164 fromFunction:v165 fromLineNumber:201];

        v166 = PLLogCommon();
        if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v161;
          _os_log_debug_impl(&dword_1D2690000, v166, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    +[PLBBMav13HwMsgParser optimMaskMappings];
    v327 = uint64_t v167 = 0;
    do
    {
      if ((*(_DWORD *)[(PLBBMav13HwMsgParser *)self optimMaskArray] >> v167))
      {
        if ([*(id *)(v7 + 2496) debugEnabled])
        {
          uint64_t v168 = objc_opt_class();
          v351[0] = MEMORY[0x1E4F143A8];
          v351[1] = 3221225472;
          v351[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_588;
          v351[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v351[4] = v168;
          v169 = v351;
          if (qword_1EBD5C780 != -1) {
            dispatch_once(&qword_1EBD5C780, v169);
          }

          if (byte_1EBD5C68B)
          {
            v170 = NSString;
            v171 = [NSNumber numberWithUnsignedInt:v167];
            v172 = [v327 objectForKeyedSubscript:v171];
            v173 = [v170 stringWithFormat:@"Payload %@ is present at offset %llu, pointer %ld", v172, v150, v16];

            v174 = (void *)MEMORY[0x1E4F929B8];
            v175 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v176 = [v175 lastPathComponent];
            v177 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v174 logMessage:v173 fromFile:v176 fromFunction:v177 fromLineNumber:207];

            v178 = PLLogCommon();
            if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v372 = v173;
              _os_log_debug_impl(&dword_1D2690000, v178, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v7 = 0x1E4F92000uLL;
          }
        }
        switch((int)v167)
        {
          case 0:
            [(PLBBMav13HwMsgParser *)self setProtoStateC2K:v16];
            v150 += 64;
            v16 += 64;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v179 = objc_opt_class();
            v350[0] = MEMORY[0x1E4F143A8];
            v350[1] = 3221225472;
            v350[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_595;
            v350[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v350[4] = v179;
            v180 = v350;
            if (qword_1EBD5C788 != -1) {
              dispatch_once(&qword_1EBD5C788, v180);
            }

            if (!byte_1EBD5C68C) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v182 = (void *)MEMORY[0x1E4F929B8];
            v183 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v184 = [v183 lastPathComponent];
            v185 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v182 logMessage:v181 fromFile:v184 fromFunction:v185 fromLineNumber:214];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 1:
            [(PLBBMav13HwMsgParser *)self setProtoStateHDR:v16];
            v150 += 64;
            v16 += 64;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v187 = objc_opt_class();
            v349[0] = MEMORY[0x1E4F143A8];
            v349[1] = 3221225472;
            v349[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_601;
            v349[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v349[4] = v187;
            v188 = v349;
            if (qword_1EBD5C790 != -1) {
              dispatch_once(&qword_1EBD5C790, v188);
            }

            if (!byte_1EBD5C68D) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v189 = (void *)MEMORY[0x1E4F929B8];
            v190 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v191 = [v190 lastPathComponent];
            v192 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v189 logMessage:v181 fromFile:v191 fromFunction:v192 fromLineNumber:220];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 2:
            [(PLBBMav13HwMsgParser *)self setProtoStateGSM:v16];
            v150 += 64;
            v16 += 64;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v193 = objc_opt_class();
            v348[0] = MEMORY[0x1E4F143A8];
            v348[1] = 3221225472;
            v348[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_604;
            v348[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v348[4] = v193;
            v194 = v348;
            if (qword_1EBD5C798 != -1) {
              dispatch_once(&qword_1EBD5C798, v194);
            }

            if (!byte_1EBD5C68E) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v195 = (void *)MEMORY[0x1E4F929B8];
            v196 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v197 = [v196 lastPathComponent];
            v198 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v195 logMessage:v181 fromFile:v197 fromFunction:v198 fromLineNumber:226];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 3:
            [(PLBBMav13HwMsgParser *)self setProtoStateWCDMA:v16];
            v150 += 64;
            v16 += 64;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v199 = objc_opt_class();
            v347[0] = MEMORY[0x1E4F143A8];
            v347[1] = 3221225472;
            v347[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_607;
            v347[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v347[4] = v199;
            v200 = v347;
            if (qword_1EBD5C7A0 != -1) {
              dispatch_once(&qword_1EBD5C7A0, v200);
            }

            if (!byte_1EBD5C68F) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v201 = (void *)MEMORY[0x1E4F929B8];
            v202 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v203 = [v202 lastPathComponent];
            v204 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v201 logMessage:v181 fromFile:v203 fromFunction:v204 fromLineNumber:232];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 4:
            [(PLBBMav13HwMsgParser *)self setProtoStateLTE:v16];
            v150 += 64;
            v16 += 64;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v205 = objc_opt_class();
            v346[0] = MEMORY[0x1E4F143A8];
            v346[1] = 3221225472;
            v346[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_610;
            v346[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v346[4] = v205;
            v206 = v346;
            if (qword_1EBD5C7A8 != -1) {
              dispatch_once(&qword_1EBD5C7A8, v206);
            }

            if (!byte_1EBD5C690) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v207 = (void *)MEMORY[0x1E4F929B8];
            v208 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v209 = [v208 lastPathComponent];
            v210 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v207 logMessage:v181 fromFile:v209 fromFunction:v210 fromLineNumber:238];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 5:
            [(PLBBMav13HwMsgParser *)self setProtoStateTDS:v16];
            v150 += 64;
            v16 += 64;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v211 = objc_opt_class();
            v345[0] = MEMORY[0x1E4F143A8];
            v345[1] = 3221225472;
            v345[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_613;
            v345[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v345[4] = v211;
            v212 = v345;
            if (qword_1EBD5C7B0 != -1) {
              dispatch_once(&qword_1EBD5C7B0, v212);
            }

            if (!byte_1EBD5C691) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 64);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v213 = (void *)MEMORY[0x1E4F929B8];
            v214 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v215 = [v214 lastPathComponent];
            v216 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v213 logMessage:v181 fromFile:v215 fromFunction:v216 fromLineNumber:244];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 6:
            [(PLBBMav13HwMsgParser *)self setRfDataC2K:v16];
            v150 += 256;
            v16 += 256;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v217 = objc_opt_class();
            v344[0] = MEMORY[0x1E4F143A8];
            v344[1] = 3221225472;
            v344[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_616;
            v344[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v344[4] = v217;
            v218 = v344;
            if (qword_1EBD5C7B8 != -1) {
              dispatch_once(&qword_1EBD5C7B8, v218);
            }

            if (!byte_1EBD5C692) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v219 = (void *)MEMORY[0x1E4F929B8];
            v220 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v221 = [v220 lastPathComponent];
            v222 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v219 logMessage:v181 fromFile:v221 fromFunction:v222 fromLineNumber:250];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 7:
            [(PLBBMav13HwMsgParser *)self setRfData1xEVDO:v16];
            v150 += 256;
            v16 += 256;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v223 = objc_opt_class();
            v343[0] = MEMORY[0x1E4F143A8];
            v343[1] = 3221225472;
            v343[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_619;
            v343[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v343[4] = v223;
            v224 = v343;
            if (qword_1EBD5C7C0 != -1) {
              dispatch_once(&qword_1EBD5C7C0, v224);
            }

            if (!byte_1EBD5C693) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v225 = (void *)MEMORY[0x1E4F929B8];
            v226 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v227 = [v226 lastPathComponent];
            v228 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v225 logMessage:v181 fromFile:v227 fromFunction:v228 fromLineNumber:256];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 8:
            [(PLBBMav13HwMsgParser *)self setRfDataGSM:v16];
            v150 += 256;
            v16 += 256;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v229 = objc_opt_class();
            v342[0] = MEMORY[0x1E4F143A8];
            v342[1] = 3221225472;
            v342[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_622;
            v342[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v342[4] = v229;
            v230 = v342;
            if (qword_1EBD5C7C8 != -1) {
              dispatch_once(&qword_1EBD5C7C8, v230);
            }

            if (!byte_1EBD5C694) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v231 = (void *)MEMORY[0x1E4F929B8];
            v232 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v233 = [v232 lastPathComponent];
            v234 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v231 logMessage:v181 fromFile:v233 fromFunction:v234 fromLineNumber:262];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 9:
            [(PLBBMav13HwMsgParser *)self setRfDataWCDMA:v16];
            v150 += 208;
            v16 += 208;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v235 = objc_opt_class();
            v341[0] = MEMORY[0x1E4F143A8];
            v341[1] = 3221225472;
            v341[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_625;
            v341[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v341[4] = v235;
            v236 = v341;
            if (qword_1EBD5C7D0 != -1) {
              dispatch_once(&qword_1EBD5C7D0, v236);
            }

            if (!byte_1EBD5C695) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 208);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v237 = (void *)MEMORY[0x1E4F929B8];
            v238 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v239 = [v238 lastPathComponent];
            v240 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v237 logMessage:v181 fromFile:v239 fromFunction:v240 fromLineNumber:268];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 10:
            [(PLBBMav13HwMsgParser *)self setRfDataLTE:v16];
            v150 += 256;
            v16 += 256;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v241 = objc_opt_class();
            v340[0] = MEMORY[0x1E4F143A8];
            v340[1] = 3221225472;
            v340[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_628;
            v340[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v340[4] = v241;
            v242 = v340;
            if (qword_1EBD5C7D8 != -1) {
              dispatch_once(&qword_1EBD5C7D8, v242);
            }

            if (!byte_1EBD5C696) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v243 = (void *)MEMORY[0x1E4F929B8];
            v244 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v245 = [v244 lastPathComponent];
            v246 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v243 logMessage:v181 fromFile:v245 fromFunction:v246 fromLineNumber:274];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 11:
            [(PLBBMav13HwMsgParser *)self setRfDataTDS:v16];
            v150 += 256;
            v16 += 256;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v247 = objc_opt_class();
            v339[0] = MEMORY[0x1E4F143A8];
            v339[1] = 3221225472;
            v339[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_631;
            v339[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v339[4] = v247;
            v248 = v339;
            if (qword_1EBD5C7E0 != -1) {
              dispatch_once(&qword_1EBD5C7E0, v248);
            }

            if (!byte_1EBD5C697) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 256);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v249 = (void *)MEMORY[0x1E4F929B8];
            v250 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v251 = [v250 lastPathComponent];
            v252 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v249 logMessage:v181 fromFile:v251 fromFunction:v252 fromLineNumber:280];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 12:
            [(PLBBMav13HwMsgParser *)self setRfEnhLTE:v16];
            v150 += 576;
            v16 += 576;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v253 = objc_opt_class();
            v334[0] = MEMORY[0x1E4F143A8];
            v334[1] = 3221225472;
            v334[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_646;
            v334[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v334[4] = v253;
            v254 = v334;
            if (qword_1EBD5C808 != -1) {
              dispatch_once(&qword_1EBD5C808, v254);
            }

            if (!byte_1EBD5C69C) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 576);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v255 = (void *)MEMORY[0x1E4F929B8];
            v256 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v257 = [v256 lastPathComponent];
            v258 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v255 logMessage:v181 fromFile:v257 fromFunction:v258 fromLineNumber:310];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 13:
            [(PLBBMav13HwMsgParser *)self setRfEnhWCDMA:v16];
            v150 += 176;
            v16 += 176;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v259 = objc_opt_class();
            v335[0] = MEMORY[0x1E4F143A8];
            v335[1] = 3221225472;
            v335[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_643;
            v335[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v335[4] = v259;
            v260 = v335;
            if (qword_1EBD5C800 != -1) {
              dispatch_once(&qword_1EBD5C800, v260);
            }

            if (!byte_1EBD5C69B) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 176);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v261 = (void *)MEMORY[0x1E4F929B8];
            v262 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v263 = [v262 lastPathComponent];
            v264 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v261 logMessage:v181 fromFile:v263 fromFunction:v264 fromLineNumber:304];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 14:
            [(PLBBMav13HwMsgParser *)self setRfEnhGSM:v16];
            v150 += 20;
            v16 += 20;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v265 = objc_opt_class();
            v336[0] = MEMORY[0x1E4F143A8];
            v336[1] = 3221225472;
            v336[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_640;
            v336[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v336[4] = v265;
            v266 = v336;
            if (qword_1EBD5C7F8 != -1) {
              dispatch_once(&qword_1EBD5C7F8, v266);
            }

            if (!byte_1EBD5C69A) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 20);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v267 = (void *)MEMORY[0x1E4F929B8];
            v268 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v269 = [v268 lastPathComponent];
            v270 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v267 logMessage:v181 fromFile:v269 fromFunction:v270 fromLineNumber:298];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 15:
            [(PLBBMav13HwMsgParser *)self setRfEnhTDS:v16];
            v150 += 48;
            v16 += 48;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v271 = objc_opt_class();
            v333[0] = MEMORY[0x1E4F143A8];
            v333[1] = 3221225472;
            v333[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_649;
            v333[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v333[4] = v271;
            v272 = v333;
            if (qword_1EBD5C810 != -1) {
              dispatch_once(&qword_1EBD5C810, v272);
            }

            if (!byte_1EBD5C69D) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 48);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v273 = (void *)MEMORY[0x1E4F929B8];
            v274 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v275 = [v274 lastPathComponent];
            v276 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v273 logMessage:v181 fromFile:v275 fromFunction:v276 fromLineNumber:316];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 16:
            [(PLBBMav13HwMsgParser *)self setRfEnhC2K:v16];
            v150 += 40;
            v16 += 40;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v277 = objc_opt_class();
            v338[0] = MEMORY[0x1E4F143A8];
            v338[1] = 3221225472;
            v338[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_634;
            v338[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v338[4] = v277;
            v278 = v338;
            if (qword_1EBD5C7E8 != -1) {
              dispatch_once(&qword_1EBD5C7E8, v278);
            }

            if (!byte_1EBD5C698) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 40);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v279 = (void *)MEMORY[0x1E4F929B8];
            v280 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v281 = [v280 lastPathComponent];
            v282 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v279 logMessage:v181 fromFile:v281 fromFunction:v282 fromLineNumber:286];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_264;
            }
            goto LABEL_265;
          case 17:
            [(PLBBMav13HwMsgParser *)self setRfEnh1xEVDO:v16];
            v150 += 32;
            v16 += 32;
            if (![*(id *)(v7 + 2496) debugEnabled]) {
              break;
            }
            uint64_t v283 = objc_opt_class();
            v337[0] = MEMORY[0x1E4F143A8];
            v337[1] = 3221225472;
            v337[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_637;
            v337[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v337[4] = v283;
            v284 = v337;
            if (qword_1EBD5C7F0 != -1) {
              dispatch_once(&qword_1EBD5C7F0, v284);
            }

            if (!byte_1EBD5C699) {
              break;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 32);
            v181 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
            v285 = (void *)MEMORY[0x1E4F929B8];
            v286 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
            v287 = [v286 lastPathComponent];
            v288 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
            [v285 logMessage:v181 fromFile:v287 fromFunction:v288 fromLineNumber:292];

            v186 = PLLogCommon();
            if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
            {
LABEL_264:
              *(_DWORD *)buf = 138412290;
              v372 = v181;
              _os_log_debug_impl(&dword_1D2690000, v186, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_265:

            unint64_t v7 = 0x1E4F92000;
            break;
          case 18:
            [(PLBBMav13HwMsgParser *)self setRfEnhOOS:v16];
            v150 += 156;
            v16 += 156;
            if ([*(id *)(v7 + 2496) debugEnabled])
            {
              uint64_t v289 = objc_opt_class();
              v332[0] = MEMORY[0x1E4F143A8];
              v332[1] = 3221225472;
              v332[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_652;
              v332[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v332[4] = v289;
              v290 = v332;
              if (qword_1EBD5C818 != -1) {
                dispatch_once(&qword_1EBD5C818, v290);
              }

              if (byte_1EBD5C69E)
              {
                objc_msgSend(NSString, "stringWithFormat:", @"Payload size [%lu]", 156);
                v291 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
                v292 = (void *)MEMORY[0x1E4F929B8];
                v293 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
                v294 = [v293 lastPathComponent];
                v295 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
                [v292 logMessage:v291 fromFile:v294 fromFunction:v295 fromLineNumber:322];

                v296 = PLLogCommon();
                if (os_log_type_enabled(v296, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v372 = v291;
                  _os_log_debug_impl(&dword_1D2690000, v296, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            goto LABEL_275;
          default:
            break;
        }
      }
      uint64_t v167 = (v167 + 1);
    }
    while (v167 != 19);
LABEL_275:
    if ([*(id *)(v7 + 2496) debugEnabled])
    {
      uint64_t v297 = objc_opt_class();
      v331[0] = MEMORY[0x1E4F143A8];
      v331[1] = 3221225472;
      v331[2] = __34__PLBBMav13HwMsgParser_parseData___block_invoke_655;
      v331[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v331[4] = v297;
      v298 = v331;
      if (qword_1EBD5C820 != -1) {
        dispatch_once(&qword_1EBD5C820, v298);
      }

      if (byte_1EBD5C69F)
      {
        v299 = [NSString stringWithFormat:@"End of Proto, Rf, Enh data at offset %llu", v150];
        v300 = (void *)MEMORY[0x1E4F929B8];
        v301 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v302 = [v301 lastPathComponent];
        v303 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser parseData:]"];
        [v300 logMessage:v299 fromFile:v302 fromFunction:v303 fromLineNumber:328];

        v304 = PLLogCommon();
        if (os_log_type_enabled(v304, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v372 = v299;
          _os_log_debug_impl(&dword_1D2690000, v304, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 7)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration_mask:v16];
    v305 = v16 + 16;
    int v306 = [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask]];
    v307 = [MEMORY[0x1E4F28E78] string];
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_duration:v307];

    [(PLBBMav13HwMsgParser *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self apps_clock_duration_mask] oftype:0 withData:v305];
    v308 = &v305[4 * v306];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration_mask:v308];
    v308 += 16;
    int v309 = [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask]];
    v310 = [MEMORY[0x1E4F28E78] string];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_duration:v310];

    [(PLBBMav13HwMsgParser *)self SetClocks:[(PLMav7BasebandHardwareMessage *)self mpss_clock_duration_mask] oftype:1 withData:v308];
    v16 = &v308[4 * v309];
  }
  if ([(PLMav4BasebandHardwareMessage *)self level] >= 8)
  {
    [(PLMav7BasebandHardwareMessage *)self setApps_clock_count_mask:v16];
    uint64_t v311 = (uint64_t)&v16[4
                       * [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self apps_clock_count_mask]]+ 16];
    [(PLMav7BasebandHardwareMessage *)self setMpss_clock_count_mask:v311];
    uint64_t v312 = v311
         + 4
         * [(PLBBMav13HwMsgParser *)self GetClockCount:[(PLMav7BasebandHardwareMessage *)self mpss_clock_count_mask]];
    [(PLMav7BasebandHardwareMessage *)self setHsic:v312 + 16];
    v16 = (unsigned __int8 *)(v312 + 48);
  }
  v313 = v326;
  id v314 = v325;
  v315 = v16;
  unint64_t v316 = (unint64_t)&v16[-[v314 bytes]];
  unint64_t v317 = [v314 length];
  if (v316 > v317)
  {
    v318 = PLLogCommon();
    if (os_log_type_enabled(v318, OS_LOG_TYPE_ERROR))
    {
      id v320 = v314;
      v321 = &v315[-[v320 bytes]];
      v322 = v320;
      v313 = v326;
      uint64_t v323 = [v322 length];
      *(_DWORD *)buf = 134218498;
      v372 = v321;
      __int16 v373 = 2048;
      uint64_t v374 = v323;
      __int16 v375 = 2080;
      v376 = "-[PLBBMav13HwMsgParser parseData:]";
      _os_log_error_impl(&dword_1D2690000, v318, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
  }
  return v316 <= v317;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_112 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_476(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C679 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_482(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C67A = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_488(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C67B = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_494(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C67C = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_500(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C67D = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_506(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C67E = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_512(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C67F = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_518(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C680 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_524(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C681 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_530(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C682 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_536(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C683 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_542(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C684 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_548(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C685 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_554(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C686 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_560(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C687 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_566(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C688 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_575(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C689 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_581(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C68A = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_588(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C68B = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_595(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C68C = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_601(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C68D = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_604(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C68E = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_607(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C68F = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_610(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C690 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_613(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C691 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_616(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C692 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_619(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C693 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_622(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C694 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_625(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C695 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_628(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C696 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_631(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C697 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_634(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C698 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_637(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C699 = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_640(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C69A = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_643(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C69B = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_646(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C69C = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_649(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C69D = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_652(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C69E = result;
  return result;
}

uint64_t __34__PLBBMav13HwMsgParser_parseData___block_invoke_655(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C69F = result;
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
    v207[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke;
    v207[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v207[4] = v6;
    unint64_t v7 = v207;
    if (qword_1EBD5C828 != -1) {
      dispatch_once(&qword_1EBD5C828, v7);
    }

    if (byte_1EBD5C6A0)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logWithLogger:]");
      objc_super v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:376];

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
  v206.super_class = (Class)PLBBMav13HwMsgParser;
  [(PLBasebandHardwareMessage *)&v206 logRawWithLogger:v4];
  v14 = objc_alloc_init(PLBBMavLogMsg);
  v15 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v14 setAgent:v15];

  [(PLBBMavLogMsg *)v14 setError:&stru_1F294E108];
  v16 = [(PLBasebandMessage *)self seqNum];
  uint64_t v17 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v14, "setHeaderWithSeqNum:andDate:andTimeCal:", v16, v17);

  if ([(PLMav4BasebandHardwareMessage *)self sw_rev] == 2)
  {
    [(PLMav4BasebandHardwareMessage *)self logHeaderWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logRPMWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logAppsPerfWithLogger:v14];
    [(PLBBMav13HwMsgParser *)self logMPSSWithLogger:v14];
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
        v204[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_683;
        v204[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v204[4] = v19;
        v20 = v204;
        if (qword_1EBD5C838 != -1) {
          dispatch_once(&qword_1EBD5C838, v20);
        }

        if (byte_1EBD5C6A2)
        {
          v21 = [NSString stringWithFormat:@"protoStateC2K is valid"];
          v22 = (void *)MEMORY[0x1E4F929B8];
          v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v24 = [v23 lastPathComponent];
          uint64_t v25 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:414];

          uint64_t v26 = PLLogCommon();
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
        v203[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_689;
        v203[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v203[4] = v36;
        v37 = v203;
        if (qword_1EBD5C840 != -1) {
          dispatch_once(&qword_1EBD5C840, v37);
        }

        if (byte_1EBD5C6A3)
        {
          v38 = [NSString stringWithFormat:@"protoStateHDR is valid"];
          v39 = (void *)MEMORY[0x1E4F929B8];
          v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v41 = [v40 lastPathComponent];
          uint64_t v42 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:425];

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
        v202[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_695;
        v202[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v202[4] = v44;
        v45 = v202;
        if (qword_1EBD5C848 != -1) {
          dispatch_once(&qword_1EBD5C848, v45);
        }

        if (byte_1EBD5C6A4)
        {
          v46 = [NSString stringWithFormat:@"protoStateGSM is valid"];
          v47 = (void *)MEMORY[0x1E4F929B8];
          v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v49 = [v48 lastPathComponent];
          uint64_t v50 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:436];

          v51 = PLLogCommon();
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
        v201[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_701;
        v201[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v201[4] = v52;
        v53 = v201;
        if (qword_1EBD5C850 != -1) {
          dispatch_once(&qword_1EBD5C850, v53);
        }

        if (byte_1EBD5C6A5)
        {
          v54 = [NSString stringWithFormat:@"protoStateWCDMA is valid"];
          v55 = (void *)MEMORY[0x1E4F929B8];
          v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v57 = [v56 lastPathComponent];
          uint64_t v58 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:447];

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
        v200[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_707;
        v200[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v200[4] = v60;
        v61 = v200;
        if (qword_1EBD5C858 != -1) {
          dispatch_once(&qword_1EBD5C858, v61);
        }

        if (byte_1EBD5C6A6)
        {
          v62 = [NSString stringWithFormat:@"protoStateLTE is valid"];
          v63 = (void *)MEMORY[0x1E4F929B8];
          v64 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v65 = [v64 lastPathComponent];
          uint64_t v66 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v63 logMessage:v62 fromFile:v65 fromFunction:v66 fromLineNumber:458];

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
        v199[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_713;
        v199[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v199[4] = v68;
        v69 = v199;
        if (qword_1EBD5C860 != -1) {
          dispatch_once(&qword_1EBD5C860, v69);
        }

        if (byte_1EBD5C6A7)
        {
          v70 = [NSString stringWithFormat:@"protoStateTDS is valid"];
          v71 = (void *)MEMORY[0x1E4F929B8];
          v72 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v73 = [v72 lastPathComponent];
          uint64_t v74 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v71 logMessage:v70 fromFile:v73 fromFunction:v74 fromLineNumber:469];

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
    [(PLBBMavLogMsg *)v14 addToGroupPLBBMav13HwOther];
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 4) != 0
      && [(PLBBMav13HwMsgParser *)self rfDataLTE])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v76 = objc_opt_class();
        v198[0] = MEMORY[0x1E4F143A8];
        v198[1] = 3221225472;
        v198[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_719;
        v198[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v198[4] = v76;
        v77 = v198;
        if (qword_1EBD5C868 != -1) {
          dispatch_once(&qword_1EBD5C868, v77);
        }

        if (byte_1EBD5C6A8)
        {
          id v181 = v4;
          v78 = [NSString stringWithFormat:@"rfDataLTE is valid"];
          v79 = (void *)MEMORY[0x1E4F929B8];
          v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v81 = [v80 lastPathComponent];
          uint64_t v82 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v79 logMessage:v78 fromFile:v81 fromFunction:v82 fromLineNumber:494];

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
        v197[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_725;
        v197[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v197[4] = v85;
        v86 = v197;
        if (qword_1EBD5C870 != -1) {
          dispatch_once(&qword_1EBD5C870, v86);
        }

        if (byte_1EBD5C6A9)
        {
          id v182 = v4;
          v87 = [NSString stringWithFormat:@"rfDataWCDMA is valid"];
          v88 = (void *)MEMORY[0x1E4F929B8];
          v89 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          uint64_t v90 = [v89 lastPathComponent];
          v91 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v88 logMessage:v87 fromFile:v90 fromFunction:v91 fromLineNumber:503];

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
        v196[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_731;
        v196[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v196[4] = v93;
        v94 = v196;
        if (qword_1EBD5C878 != -1) {
          dispatch_once(&qword_1EBD5C878, v94);
        }

        if (byte_1EBD5C6AA)
        {
          id v183 = v4;
          v95 = [NSString stringWithFormat:@"rfDataGSM is valid"];
          v96 = (void *)MEMORY[0x1E4F929B8];
          v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          uint64_t v98 = [v97 lastPathComponent];
          v99 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v96 logMessage:v95 fromFile:v98 fromFunction:v99 fromLineNumber:512];

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
        v195[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_737;
        v195[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v195[4] = v101;
        v102 = v195;
        if (qword_1EBD5C880 != -1) {
          dispatch_once(&qword_1EBD5C880, v102);
        }

        if (byte_1EBD5C6AB)
        {
          id v184 = v4;
          v103 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          v104 = (void *)MEMORY[0x1E4F929B8];
          v105 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          uint64_t v106 = [v105 lastPathComponent];
          v107 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v104 logMessage:v103 fromFile:v106 fromFunction:v107 fromLineNumber:521];

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
        v194[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_743;
        v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v194[4] = v109;
        v110 = v194;
        if (qword_1EBD5C888 != -1) {
          dispatch_once(&qword_1EBD5C888, v110);
        }

        if (byte_1EBD5C6AC)
        {
          id v185 = v4;
          v111 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          v112 = (void *)MEMORY[0x1E4F929B8];
          v113 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          uint64_t v114 = [v113 lastPathComponent];
          v115 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v112 logMessage:v111 fromFile:v114 fromFunction:v115 fromLineNumber:530];

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
        v193[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_746;
        v193[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v193[4] = v117;
        v118 = v193;
        if (qword_1EBD5C890 != -1) {
          dispatch_once(&qword_1EBD5C890, v118);
        }

        if (byte_1EBD5C6AD)
        {
          v119 = [NSString stringWithFormat:@"rfDataTDS is valid"];
          v120 = (void *)MEMORY[0x1E4F929B8];
          v121 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          uint64_t v122 = [v121 lastPathComponent];
          v123 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v120 logMessage:v119 fromFile:v122 fromFunction:v123 fromLineNumber:539];

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
      && [(PLBBMav13HwMsgParser *)self rfEnhLTE])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v125 = objc_opt_class();
        v192[0] = MEMORY[0x1E4F143A8];
        v192[1] = 3221225472;
        v192[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_749;
        v192[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v192[4] = v125;
        v126 = v192;
        if (qword_1EBD5C898 != -1) {
          dispatch_once(&qword_1EBD5C898, v126);
        }

        if (byte_1EBD5C6AE)
        {
          v127 = [NSString stringWithFormat:@"rfEnhLTE is valid"];
          v128 = (void *)MEMORY[0x1E4F929B8];
          v129 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          uint64_t v130 = [v129 lastPathComponent];
          v131 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v128 logMessage:v127 fromFile:v130 fromFunction:v131 fromLineNumber:554];

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
      [(PLBBMav13HwMsgParser *)self logHwRFEnhLTEWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x20) != 0
      && [(PLBBMav13HwMsgParser *)self rfEnhWCDMA])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v133 = objc_opt_class();
        v191[0] = MEMORY[0x1E4F143A8];
        v191[1] = 3221225472;
        v191[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_755;
        v191[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v191[4] = v133;
        v134 = v191;
        if (qword_1EBD5C8A0 != -1) {
          dispatch_once(&qword_1EBD5C8A0, v134);
        }

        if (byte_1EBD5C6AF)
        {
          v135 = [NSString stringWithFormat:@"rfEnhWCDMA is valid"];
          v136 = (void *)MEMORY[0x1E4F929B8];
          v137 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          uint64_t v138 = [v137 lastPathComponent];
          v139 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v136 logMessage:v135 fromFile:v138 fromFunction:v139 fromLineNumber:560];

          uint64_t v140 = PLLogCommon();
          if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v209 = v135;
            _os_log_debug_impl(&dword_1D2690000, v140, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v5 = 0x1E4F92000uLL;
        }
      }
      [(PLBBMav13HwMsgParser *)self logHwRFEnhWCDMAWithLogger:v14];
    }
    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x40) != 0
      && [(PLBBMav13HwMsgParser *)self rfEnhGSM])
    {
      if ([*(id *)(v5 + 2496) debugEnabled])
      {
        uint64_t v141 = objc_opt_class();
        v190[0] = MEMORY[0x1E4F143A8];
        v190[1] = 3221225472;
        v190[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_761;
        v190[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v190[4] = v141;
        v142 = v190;
        if (qword_1EBD5C8A8 != -1) {
          dispatch_once(&qword_1EBD5C8A8, v142);
        }

        if (byte_1EBD5C6B0)
        {
          v143 = [NSString stringWithFormat:@"rfEnhGSM is valid"];
          v144 = (void *)MEMORY[0x1E4F929B8];
          v145 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v146 = [v145 lastPathComponent];
          v147 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v144 logMessage:v143 fromFile:v146 fromFunction:v147 fromLineNumber:566];

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
        v189[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_767;
        v189[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v189[4] = v149;
        uint64_t v150 = v189;
        if (qword_1EBD5C8B0 != -1) {
          dispatch_once(&qword_1EBD5C8B0, v150);
        }

        if (byte_1EBD5C6B1)
        {
          uint64_t v151 = [NSString stringWithFormat:@"rfEnhTDS is valid"];
          v152 = (void *)MEMORY[0x1E4F929B8];
          v153 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v154 = [v153 lastPathComponent];
          v155 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v152 logMessage:v151 fromFile:v154 fromFunction:v155 fromLineNumber:572];

          v156 = PLLogCommon();
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
        v188[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_773;
        v188[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v188[4] = v157;
        v158 = v188;
        if (qword_1EBD5C8B8 != -1) {
          dispatch_once(&qword_1EBD5C8B8, v158);
        }

        if (byte_1EBD5C6B2)
        {
          uint64_t v159 = [NSString stringWithFormat:@"rfEnh1x is valid"];
          v160 = (void *)MEMORY[0x1E4F929B8];
          v161 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v162 = [v161 lastPathComponent];
          v163 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v160 logMessage:v159 fromFile:v162 fromFunction:v163 fromLineNumber:578];

          v164 = PLLogCommon();
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
        v187[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_779;
        v187[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v187[4] = v165;
        v166 = v187;
        if (qword_1EBD5C8C0 != -1) {
          dispatch_once(&qword_1EBD5C8C0, v166);
        }

        if (byte_1EBD5C6B3)
        {
          uint64_t v167 = [NSString stringWithFormat:@"rfEnhHDR is valid"];
          uint64_t v168 = (void *)MEMORY[0x1E4F929B8];
          v169 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v170 = [v169 lastPathComponent];
          v171 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v168 logMessage:v167 fromFile:v170 fromFunction:v171 fromLineNumber:584];

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
        v186[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_785;
        v186[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v186[4] = v173;
        v174 = v186;
        if (qword_1EBD5C8C8 != -1) {
          dispatch_once(&qword_1EBD5C8C8, v174);
        }

        if (byte_1EBD5C6B4)
        {
          v175 = [NSString stringWithFormat:@"rfEnhOOS is valid"];
          v176 = (void *)MEMORY[0x1E4F929B8];
          v177 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
          v178 = [v177 lastPathComponent];
          uint64_t v179 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
          [v176 logMessage:v175 fromFile:v178 fromFunction:v179 fromLineNumber:590];

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
    [(PLBBMavLogMsg *)v14 logEventBackwardGrpEntriesBBMav13Hw];
  }
  else
  {
    v18 = [MEMORY[0x1E4F28E78] string];
    objc_msgSend(v18, "appendFormat:", @"Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 2);
    [(PLBBMavLogMsg *)v14 setError:v18];
    [(PLBBMavLogMsg *)v14 setType:@"BB HW Error"];
    [(PLBBMavLogMsg *)v14 logEventBackwardMavBBHwOther];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v29 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_676;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v29;
      if (qword_1EBD5C830 != -1) {
        dispatch_once(&qword_1EBD5C830, block);
      }
      if (byte_1EBD5C6A1)
      {
        v30 = [NSString stringWithFormat:@"SW version mismatch, cannot process, returning"];
        v31 = (void *)MEMORY[0x1E4F929B8];
        v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v33 = [v32 lastPathComponent];
        uint64_t v34 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logWithLogger:]"];
        [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:394];

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

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A0 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_676(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A1 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_683(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A2 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_689(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A3 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_695(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A4 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_701(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A5 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_707(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A6 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_713(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A7 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_719(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A8 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_725(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6A9 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_731(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6AA = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_737(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6AB = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_743(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6AC = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_746(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6AD = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_749(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6AE = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_755(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6AF = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_761(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B0 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_767(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B1 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_773(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B2 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_779(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B3 = result;
  return result;
}

uint64_t __38__PLBBMav13HwMsgParser_logWithLogger___block_invoke_785(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B4 = result;
  return result;
}

- (void)logPcieWithLogger:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __42__PLBBMav13HwMsgParser_logPcieWithLogger___block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v5;
    if (qword_1EBD5C8D0 != -1) {
      dispatch_once(&qword_1EBD5C8D0, &block);
    }
    if (byte_1EBD5C6B5)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logPcieWithLogger:]", block, v15, v16, v17, v18);
      unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logPcieWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:600];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBBMav13HwMsgParser *)self pcieState])
  {
    v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self pcieState] ofSize:3];
    [v12 setPcieStateHistogram:v13];
  }
}

uint64_t __42__PLBBMav13HwMsgParser_logPcieWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B5 = result;
  return result;
}

- (void)logSleepVetoWithLogger:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C8D8 != -1) {
      dispatch_once(&qword_1EBD5C8D8, block);
    }
    if (byte_1EBD5C6B6)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]");
      unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:612];

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
  if (![(PLBBMav13HwMsgParser *)self mcpmSleepVeto])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v23 = objc_opt_class();
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_791;
      v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v40[4] = v23;
      if (qword_1EBD5C8E0 != -1) {
        dispatch_once(&qword_1EBD5C8E0, v40);
      }
      if (byte_1EBD5C6B7)
      {
        v24 = [NSString stringWithFormat:@"Error: BB HW Sleep Veto is expected but not present or Mav16B"];
        uint64_t v25 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        uint64_t v27 = [v26 lastPathComponent];
        int v28 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]"];
        [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:621];

        uint64_t v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v24;
          _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v30 = @"Error: BB HW Sleep Veto is expected but not present  or Mav16B. ";
    goto LABEL_33;
  }
  v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self mcpmSleepVeto] ofSize:13];
  [v12 setMcpmVetoNumHistogram:v13];

  if (![(PLMav7BasebandHardwareMessage *)self npa_sleep_veto])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v31 = objc_opt_class();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_800;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v31;
      if (qword_1EBD5C8E8 != -1) {
        dispatch_once(&qword_1EBD5C8E8, v39);
      }
      if (byte_1EBD5C6B8)
      {
        v32 = [NSString stringWithFormat:@"Error: BB HW Sleep Veto is expected but not present"];
        v33 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v35 = [v34 lastPathComponent];
        uint64_t v36 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]"];
        [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:634];

        v37 = PLLogCommon();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v32;
          _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v30 = @"Error: BB HW Sleep Veto is expected but not present. ";
LABEL_33:
    [v12 appendToError:v30];
    goto LABEL_34;
  }
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto"));
  [v12 setNpaVetoMask:v14];

  uint64_t v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLMav7BasebandHardwareMessage *)self npa_sleep_veto] + 4 ofSize:24];
  [v12 setNpaVetoClientNumHistogram:v15];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_809;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v16;
    if (qword_1EBD5C8F0 != -1) {
      dispatch_once(&qword_1EBD5C8F0, v38);
    }
    if (byte_1EBD5C6B9)
    {
      uint64_t v17 = [NSString stringWithFormat:@"Decoded BB HW Sleep Veto"];
      uint64_t v18 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v20 = [v19 lastPathComponent];
      uint64_t v21 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logSleepVetoWithLogger:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:639];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v17;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
LABEL_34:
}

uint64_t __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B6 = result;
  return result;
}

uint64_t __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_791(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B7 = result;
  return result;
}

uint64_t __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_800(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B8 = result;
  return result;
}

uint64_t __47__PLBBMav13HwMsgParser_logSleepVetoWithLogger___block_invoke_809(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6B9 = result;
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
    block[2] = __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C8F8 != -1) {
      dispatch_once(&qword_1EBD5C8F8, block);
    }
    if (byte_1EBD5C6BA)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logRPMWithLogger:]");
      unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logRPMWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:645];

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
  if ([(PLBBMav13HwMsgParser *)self rpmData])
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav13HwMsgParser rpmData](self, "rpmData")[8]);
    [v12 setRpmXOShutDuration:v13];

    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav13HwMsgParser rpmData](self, "rpmData"));
    [v12 setRpmXOShutCnt:v14];

    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav13HwMsgParser rpmData](self, "rpmData")[16]);
    [v12 setRpmVDDMinDuration:v15];

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rpmData](self, "rpmData")[4]);
    [v12 setRpmVDDMinEnterCnt:v16];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke_815;
      v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v17;
      if (qword_1EBD5C900 != -1) {
        dispatch_once(&qword_1EBD5C900, v32);
      }
      if (byte_1EBD5C6BB)
      {
        uint64_t v18 = [NSString stringWithFormat:@"RPM=<unknown>"];
        uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        uint64_t v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logRPMWithLogger:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:660];

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
    v31[2] = __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke_824;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1EBD5C908 != -1) {
      dispatch_once(&qword_1EBD5C908, v31);
    }
    if (byte_1EBD5C6BC)
    {
      uint64_t v25 = [NSString stringWithFormat:@"Decoded BB HW RPM"];
      uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      int v28 = [v27 lastPathComponent];
      uint64_t v29 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logRPMWithLogger:]"];
      [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:664];

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

uint64_t __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6BA = result;
  return result;
}

uint64_t __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke_815(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6BB = result;
  return result;
}

uint64_t __41__PLBBMav13HwMsgParser_logRPMWithLogger___block_invoke_824(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6BC = result;
  return result;
}

- (void)logAppsPerfWithLogger:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C910 != -1) {
      dispatch_once(&qword_1EBD5C910, block);
    }
    if (byte_1EBD5C6BD)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]");
      unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:670];

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
  if ([(PLBBMav13HwMsgParser *)self appsPerf])
  {
    v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self appsPerf] ofSize:6];
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
    v47[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_833;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v14;
    if (qword_1EBD5C918 != -1) {
      dispatch_once(&qword_1EBD5C918, v47);
    }
    if (byte_1EBD5C6BE)
    {
      v13 = [NSString stringWithFormat:@"Perf_Level=<unknown>"];
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:682];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v13;
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

    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)-[PLBBMav13HwMsgParser appsSleep](self, "appsSleep"));
    [v12 setCxoShutDownCount:v21];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_839;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v22;
      if (qword_1EBD5C920 != -1) {
        dispatch_once(&qword_1EBD5C920, v46);
      }
      if (byte_1EBD5C6BF)
      {
        uint64_t v23 = [NSString stringWithFormat:@"Sleep_Stats=<unknown>"];
        uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        uint64_t v26 = [v25 lastPathComponent];
        uint64_t v27 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:693];

        int v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v23;
          _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v12 appendToError:@"Sleep_Stats=<unknown> "];
  }
  if ([(PLBBMav13HwMsgParser *)self appsSleepVeto])
  {
    uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self appsSleepVeto] ofSize:5];
    [v12 setAppsSleepVeto:v29];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v30 = objc_opt_class();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_848;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v30;
      if (qword_1EBD5C928 != -1) {
        dispatch_once(&qword_1EBD5C928, v45);
      }
      if (byte_1EBD5C6C0)
      {
        uint64_t v31 = [NSString stringWithFormat:@"Sleep_Veto_Duration=<unknown>"];
        v32 = (void *)MEMORY[0x1E4F929B8];
        v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        uint64_t v34 = [v33 lastPathComponent];
        v35 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]"];
        [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:705];

        uint64_t v36 = PLLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v31;
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
    v44[2] = __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_857;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v37;
    if (qword_1EBD5C930 != -1) {
      dispatch_once(&qword_1EBD5C930, v44);
    }
    if (byte_1EBD5C6C1)
    {
      v38 = [NSString stringWithFormat:@"Decoded BB HW APPS"];
      v39 = (void *)MEMORY[0x1E4F929B8];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v41 = [v40 lastPathComponent];
      uint64_t v42 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logAppsPerfWithLogger:]"];
      [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:709];

      v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v38;
        _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6BD = result;
  return result;
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_833(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6BE = result;
  return result;
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_839(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6BF = result;
  return result;
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_848(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C0 = result;
  return result;
}

uint64_t __46__PLBBMav13HwMsgParser_logAppsPerfWithLogger___block_invoke_857(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C1 = result;
  return result;
}

- (void)logMPSSWithLogger:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C938 != -1) {
      dispatch_once(&qword_1EBD5C938, block);
    }
    if (byte_1EBD5C6C2)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logMPSSWithLogger:]");
      unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logMPSSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:714];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v6;
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
  if ([(PLBBMav13HwMsgParser *)self mpssSleepVeto])
  {
    uint64_t v15 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self mpssSleepVeto] ofSize:17];
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
    v38[2] = __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_866;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v16;
    if (qword_1EBD5C940 != -1) {
      dispatch_once(&qword_1EBD5C940, v38);
    }
    if (byte_1EBD5C6C3)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Sleep_Veto=<unknown>"];
      uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logMPSSWithLogger:]"];
      [v17 logMessage:v15 fromFile:v19 fromFunction:v20 fromLineNumber:731];

      uint64_t v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v15;
        _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_12;
    }
  }
LABEL_20:
  if ([(PLBBMav13HwMsgParser *)self qdspSpeed])
  {
    uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self qdspSpeed] ofSize:12];
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
    v37[2] = __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_875;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v23;
    if (qword_1EBD5C948 != -1) {
      dispatch_once(&qword_1EBD5C948, v37);
    }
    if (byte_1EBD5C6C4)
    {
      uint64_t v22 = [NSString stringWithFormat:@"Q6SW_Perf=<unknown>"];
      uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v26 = [v25 lastPathComponent];
      uint64_t v27 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logMPSSWithLogger:]"];
      [v24 logMessage:v22 fromFile:v26 fromFunction:v27 fromLineNumber:744];

      int v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v22;
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
    v36[2] = __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_881;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v29;
    if (qword_1EBD5C950 != -1) {
      dispatch_once(&qword_1EBD5C950, v36);
    }
    if (byte_1EBD5C6C5)
    {
      uint64_t v30 = [NSString stringWithFormat:@"Decoded BB HW MPSS"];
      uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
      v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v33 = [v32 lastPathComponent];
      uint64_t v34 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logMPSSWithLogger:]"];
      [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:747];

      v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v30;
        _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C2 = result;
  return result;
}

uint64_t __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_866(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C3 = result;
  return result;
}

uint64_t __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_875(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C4 = result;
  return result;
}

uint64_t __42__PLBBMav13HwMsgParser_logMPSSWithLogger___block_invoke_881(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C5 = result;
  return result;
}

- (void)logLPASSWithLogger:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLBBMav13HwMsgParser *)self lpassState])
  {
    uint64_t v5 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self lpassState] ofSize:2];
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
    block[2] = __43__PLBBMav13HwMsgParser_logLPASSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD5C958 != -1) {
      dispatch_once(&qword_1EBD5C958, block);
    }
    if (byte_1EBD5C6C6)
    {
      uint64_t v5 = [NSString stringWithFormat:@"LPASS State=<unknown>"];
      unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logLPASSWithLogger:]"];
      [v7 logMessage:v5 fromFile:v9 fromFunction:v10 fromLineNumber:762];

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
    uint64_t v21 = __43__PLBBMav13HwMsgParser_logLPASSWithLogger___block_invoke_893;
    uint64_t v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v23 = v12;
    if (qword_1EBD5C960 != -1) {
      dispatch_once(&qword_1EBD5C960, &v19);
    }
    if (byte_1EBD5C6C7)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Decoded BB HW LPASS", v19, v20, v21, v22, v23);
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logLPASSWithLogger:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:765];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __43__PLBBMav13HwMsgParser_logLPASSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C6 = result;
  return result;
}

uint64_t __43__PLBBMav13HwMsgParser_logLPASSWithLogger___block_invoke_893(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C7 = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C968 != -1) {
      dispatch_once(&qword_1EBD5C968, block);
    }
    if (byte_1EBD5C6C8)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]");
      unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      objc_super v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:770];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  if ([(PLBBMav13HwMsgParser *)self gpsState])
  {
    v13 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self gpsState] ofSize:2];
    [v12 setGpsOnOff:v13];
LABEL_10:

    goto LABEL_18;
  }
  [v12 appendToError:@"GPS=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_902;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v14;
    if (qword_1EBD5C970 != -1) {
      dispatch_once(&qword_1EBD5C970, v44);
    }
    if (byte_1EBD5C6C9)
    {
      v13 = [NSString stringWithFormat:@"GPS=<unknown>"];
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]"];
      [v15 logMessage:v13 fromFile:v17 fromFunction:v18 fromLineNumber:782];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v13;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_10;
    }
  }
LABEL_18:
  if ([(PLBBMav13HwMsgParser *)self gpsDpoState])
  {
    uint64_t v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self gpsDpoState] ofSize:2];
    [v12 setGpsDPOOnOff:v20];
LABEL_20:

    goto LABEL_28;
  }
  [v12 appendToError:@"GPS_DPO=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_911;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v21;
    if (qword_1EBD5C978 != -1) {
      dispatch_once(&qword_1EBD5C978, v43);
    }
    if (byte_1EBD5C6CA)
    {
      uint64_t v20 = [NSString stringWithFormat:@"GPS_DPO=<unknown>"];
      uint64_t v22 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v24 = [v23 lastPathComponent];
      uint64_t v25 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]"];
      [v22 logMessage:v20 fromFile:v24 fromFunction:v25 fromLineNumber:794];

      uint64_t v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v20;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_20;
    }
  }
LABEL_28:
  if ([(PLBBMav13HwMsgParser *)self gpsDpoBins])
  {
    uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self gpsDpoBins] ofSize:6];
    [v12 setGpsDPOBin:v27];
LABEL_30:

    goto LABEL_38;
  }
  [v12 appendToError:@"GPS_DPO_BINS=<unknown> "];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v28 = objc_opt_class();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_920;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v28;
    if (qword_1EBD5C980 != -1) {
      dispatch_once(&qword_1EBD5C980, v42);
    }
    if (byte_1EBD5C6CB)
    {
      uint64_t v27 = [NSString stringWithFormat:@"GPS_DPO_BINS=<unknown>"];
      uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v31 = [v30 lastPathComponent];
      v32 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]"];
      [v29 logMessage:v27 fromFile:v31 fromFunction:v32 fromLineNumber:806];

      v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v27;
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_30;
    }
  }
LABEL_38:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_926;
    v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v41[4] = v34;
    if (qword_1EBD5C988 != -1) {
      dispatch_once(&qword_1EBD5C988, v41);
    }
    if (byte_1EBD5C6CC)
    {
      v35 = [NSString stringWithFormat:@"Decoded BB HW Peripherals GPS DPO BINS"];
      uint64_t v36 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logPeripheralsWithLogger:]"];
      [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:809];

      v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v35;
        _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C8 = result;
  return result;
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_902(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6C9 = result;
  return result;
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_911(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6CA = result;
  return result;
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_920(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6CB = result;
  return result;
}

uint64_t __49__PLBBMav13HwMsgParser_logPeripheralsWithLogger___block_invoke_926(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6CC = result;
  return result;
}

- (void)logProtocolWithLogger:(id)a3 container:(id)a4 state:(id *)a5 forRAT:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void *)MEMORY[0x1E4F929C0];
  id v12 = a4;
  if ([v11 debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __69__PLBBMav13HwMsgParser_logProtocolWithLogger_container_state_forRAT___block_invoke;
    uint64_t v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v28 = v13;
    if (qword_1EBD5C990 != -1) {
      dispatch_once(&qword_1EBD5C990, &block);
    }
    if (byte_1EBD5C6CD)
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:]", block, v25, v26, v27, v28);
      uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v17 = [v16 lastPathComponent];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logProtocolWithLogger:container:state:forRAT:]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:817];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v20 = v10;
  uint64_t v21 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:a5 ofSize:16];
  uint64_t v22 = [NSNumber numberWithUnsignedInt:v6];
  [v20 setRadioTech:v22];

  uint64_t v23 = [NSNumber numberWithUnsignedInt:v6];
  [v12 setObject:v21 forKey:v23];
}

uint64_t __69__PLBBMav13HwMsgParser_logProtocolWithLogger_container_state_forRAT___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6CD = result;
  return result;
}

- (void)logProtocolOnlyWithLogger:(id)a3 forRAT:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __57__PLBBMav13HwMsgParser_logProtocolOnlyWithLogger_forRAT___block_invoke;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v7;
    if (qword_1EBD5C998 != -1) {
      dispatch_once(&qword_1EBD5C998, v49);
    }
    if (byte_1EBD5C6CE)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logProtocolOnlyWithLogger:forRAT:]");
      objc_super v9 = (void *)MEMORY[0x1E4F929B8];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logProtocolOnlyWithLogger:forRAT:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:829];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v14 = v6;
  uint64_t v15 = objc_alloc_init(PLBBMavLogMsg);
  uint64_t v16 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v15 setAgent:v16];

  [(PLBBMavLogMsg *)v15 setError:&stru_1F294E108];
  uint64_t v17 = [(PLBasebandMessage *)self seqNum];
  uint64_t v18 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v15, "setHeaderWithSeqNum:andDate:andTimeCal:", v17, v18);

  uint64_t v19 = [NSNumber numberWithUnsignedInt:v4];
  [(PLBBMavLogMsg *)v15 setRadioTech:v19];

  id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
  [(PLBBMavLogMsg *)v15 setLogDuration:v20];

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", (-[PLMav4BasebandHardwareMessage header](self, "header")[16]- -[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  [(PLBBMavLogMsg *)v15 setBbHwLogDurationInTicks:v21];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [v14 protocolStateHistDict];
  uint64_t v22 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v43 = *(void *)v46;
    do
    {
      uint64_t v24 = 0;
      unint64_t v25 = 0x1E4F92000uLL;
      do
      {
        if (*(void *)v46 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * v24);
        uint64_t v27 = [v14 protocolStateHistDict];
        uint64_t v28 = [v27 objectForKey:v26];

        if (v28)
        {
          [(PLBBMavLogMsg *)v15 setProtocolStateHist:v28];
          if ([*(id *)(v25 + 2496) debugEnabled])
          {
            uint64_t v29 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __57__PLBBMav13HwMsgParser_logProtocolOnlyWithLogger_forRAT___block_invoke_932;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v29;
            if (qword_1EBD5C9A0 != -1) {
              dispatch_once(&qword_1EBD5C9A0, block);
            }
            if (byte_1EBD5C6CF)
            {
              uint64_t v30 = NSString;
              uint64_t v31 = [v14 protocolStateHistDict];
              v32 = [v31 objectForKey:v26];
              v33 = [v30 stringWithFormat:@"%@ : %@", v26, v32];

              uint64_t v34 = (void *)MEMORY[0x1E4F929B8];
              v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
              uint64_t v36 = [v35 lastPathComponent];
              uint64_t v37 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logProtocolOnlyWithLogger:forRAT:]"];
              [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:849];

              v38 = PLLogCommon();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v52 = v33;
                _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v25 = 0x1E4F92000;
            }
          }
        }
        v39 = [(PLBBMavLogMsg *)v15 logEventBackwardGrpEntriesBBMavHwOtherPerRAT];
        v40 = [v39 objectForKey:@"entry"];
        v41 = [v39 objectForKey:@"name"];
        [v14 addToGroupPLBBMavHwEntry:v40 withEntryKey:v41];

        ++v24;
      }
      while (v23 != v24);
      uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v23);
  }
}

uint64_t __57__PLBBMav13HwMsgParser_logProtocolOnlyWithLogger_forRAT___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6CE = result;
  return result;
}

uint64_t __57__PLBBMav13HwMsgParser_logProtocolOnlyWithLogger_forRAT___block_invoke_932(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6CF = result;
  return result;
}

- (void)logLegacyRFWithLogger:(id)a3 usingData:(id *)a4 forRAT:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PLBBMav13HwMsgParser_logLegacyRFWithLogger_usingData_forRAT___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5C9A8 != -1) {
      dispatch_once(&qword_1EBD5C9A8, block);
    }
    if (byte_1EBD5C6D0)
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:]");
      v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:864];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v47 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v16 = v8;
  uint64_t v17 = objc_alloc_init(PLBBMavLogMsg);
  uint64_t v18 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v17 setAgent:v18];

  [(PLBBMavLogMsg *)v17 setError:&stru_1F294E108];
  uint64_t v19 = [(PLBasebandMessage *)self seqNum];
  id v20 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v17, "setHeaderWithSeqNum:andDate:andTimeCal:", v19, v20);

  uint64_t v21 = [(PLMav7BasebandHardwareMessage *)self indexToRAT:v5];
  [(PLBBMavLogMsg *)v17 setRat:v21];

  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
  [(PLBBMavLogMsg *)v17 setLogDuration:v22];

  uint64_t v23 = [NSNumber numberWithUnsignedInt:v5];
  [(PLBBMavLogMsg *)v17 setRadioTech:v23];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", (-[PLMav4BasebandHardwareMessage header](self, "header")[16]- -[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  [(PLBBMavLogMsg *)v17 setBbHwLogDurationInTicks:v24];

  unint64_t v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:a4 ofSize:4];
  [(PLBBMavLogMsg *)v17 setRssiModeCount:v25];

  uint64_t v26 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:a4->var1 ofSize:13];
  [(PLBBMavLogMsg *)v17 setRx0RssiPowerHist:v26];

  uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:a4->var2 ofSize:13];
  [(PLBBMavLogMsg *)v17 setRx1RssiPowerHist:v27];

  uint64_t v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:a4->var4 ofSize:11];
  [(PLBBMavLogMsg *)v17 setRx0SQAPowerHist:v28];

  uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:a4->var5 ofSize:11];
  [(PLBBMavLogMsg *)v17 setRx1SQAPowerHist:v29];

  if (v5 != 3)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v30 = objc_opt_class();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __63__PLBBMav13HwMsgParser_logLegacyRFWithLogger_usingData_forRAT___block_invoke_944;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v30;
      if (qword_1EBD5C9B0 != -1) {
        dispatch_once(&qword_1EBD5C9B0, v44);
      }
      if (byte_1EBD5C6D1)
      {
        uint64_t v31 = [NSString stringWithFormat:@"Not WCDMA legacy data, use Tx power"];
        v32 = (void *)MEMORY[0x1E4F929B8];
        v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        uint64_t v34 = [v33 lastPathComponent];
        v35 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logLegacyRFWithLogger:usingData:forRAT:]"];
        [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:900];

        uint64_t v36 = PLLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v47 = v31;
          _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v37 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:a4->var3 ofSize:12];
    [(PLBBMavLogMsg *)v17 setTxPowerHist:v37];
  }
  v38 = [v16 protocolStateHistDict];
  v39 = [NSNumber numberWithUnsignedInt:v5];
  v40 = [v38 objectForKey:v39];

  if (v40) {
    [(PLBBMavLogMsg *)v17 setProtocolStateHist:v40];
  }
  v41 = [(PLBBMavLogMsg *)v17 logEventBackwardGrpEntriesBBMavHwOtherPerRAT];
  uint64_t v42 = [v41 objectForKey:@"entry"];
  uint64_t v43 = [v41 objectForKey:@"name"];
  [v16 addToGroupPLBBMavHwEntry:v42 withEntryKey:v43];
}

uint64_t __63__PLBBMav13HwMsgParser_logLegacyRFWithLogger_usingData_forRAT___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D0 = result;
  return result;
}

uint64_t __63__PLBBMav13HwMsgParser_logLegacyRFWithLogger_usingData_forRAT___block_invoke_944(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D1 = result;
  return result;
}

- (void)logHwRFEnhLTEWithLogger:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C9B8 != -1) {
      dispatch_once(&qword_1EBD5C9B8, block);
    }
    if (byte_1EBD5C6D2)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:919];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  uint64_t v13 = objc_alloc_init(PLBBMavHwRfLTELogMsg);
  if (v13)
  {
    id v14 = [(PLBasebandMessage *)self agent];
    [(PLBBMsgRoot *)v13 setAgent:v14];

    [(PLBBMavHwRfLTELogMsg *)v13 setError:@"not set"];
    uint64_t v15 = [(PLBasebandMessage *)self seqNum];
    id v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    if (([(PLBBMav13HwMsgParser *)self optimMaskArray][1] & 0x10) == 0
      || [(PLBBMav13HwMsgParser *)self rfEnhLTE])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (-[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE")[4]- -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE")[8]));
      [(PLBBMavHwRfLTELogMsg *)v13 setLogDuration:v17];

      uint64_t v18 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhLTE](self, "rfEnhLTE")[16]);
      [(PLBBMavHwRfLTELogMsg *)v13 setDupMode:v18];

      uint64_t v19 = [(PLBasebandHardwareMessage *)self convertUint8ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 20 ofSize:4];
      [(PLBBMavHwRfLTELogMsg *)v13 setCaFreqInfo:v19];

      id v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 24 ofSize:18];
      [(PLBBMavHwRfLTELogMsg *)v13 setDlC0TBSzCnt:v20];

      uint64_t v21 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 96 ofSize:18];
      [(PLBBMavHwRfLTELogMsg *)v13 setDlC1TBSzCnt:v21];

      uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 168 ofSize:12];
      [(PLBBMavHwRfLTELogMsg *)v13 setTxPwrCnt:v22];

      uint64_t v23 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 216 ofSize:4];
      [(PLBBMavHwRfLTELogMsg *)v13 setCaSCCCnt:v23];

      uint64_t v24 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 216 ofSize:4];
      [(PLBBMavHwRfLTELogMsg *)v13 setCaPriCCCnt:v24];

      unint64_t v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 232 ofSize:4];
      [(PLBBMavHwRfLTELogMsg *)v13 setCaPriCCCnt:v25];

      uint64_t v26 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 248 ofSize:4];
      [(PLBBMavHwRfLTELogMsg *)v13 setCaPriSecCCCnt:v26];

      uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 232 ofSize:8];
      [(PLBBMavHwRfLTELogMsg *)v13 setActRxTxPriCCCnt:v27];

      uint64_t v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 264 ofSize:8];
      [(PLBBMavHwRfLTELogMsg *)v13 setActRxTxSecCCCnt:v28];

      uint64_t v29 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 296 ofSize:8];
      [(PLBBMavHwRfLTELogMsg *)v13 setActRxTxPriSecCCCnt:v29];

      uint64_t v30 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 328 ofSize:7];
      [(PLBBMavHwRfLTELogMsg *)v13 setSleepStateIdleCnt:v30];

      uint64_t v31 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 356 ofSize:7];
      [(PLBBMavHwRfLTELogMsg *)v13 setSleepStateConnCnt:v31];

      v32 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 384 ofSize:6];
      [(PLBBMavHwRfLTELogMsg *)v13 setRsrpIdleCnt:v32];

      v33 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 408 ofSize:6];
      [(PLBBMavHwRfLTELogMsg *)v13 setRsrpConnCnt:v33];

      uint64_t v34 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 432 ofSize:6];
      [(PLBBMavHwRfLTELogMsg *)v13 setSinrIdleCnt:v34];

      v35 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 456 ofSize:6];
      [(PLBBMavHwRfLTELogMsg *)v13 setSinrConnCnt:v35];

      uint64_t v36 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 480 ofSize:5];
      [(PLBBMavHwRfLTELogMsg *)v13 setArxStateCnt:v36];

      uint64_t v37 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 500 ofSize:3];
      [(PLBBMavHwRfLTELogMsg *)v13 setNlicStateCnt:v37];

      v38 = [(PLBasebandHardwareMessage *)self convertUint64ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhLTE] + 512 ofSize:8];
      [(PLBBMavHwRfLTELogMsg *)v13 setBpeStats:v38];

      v39 = [(PLBBMavHwRfLTELogMsg *)v13 logEventBackwardBBMav13HwRfLTE];
      v40 = [v39 objectForKey:@"entry"];
      v41 = [v39 objectForKey:@"entryKey"];
      [v12 addToGroupPLBBMavHwEntry:v40 withEntryKey:v41];

      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_32;
      }
      uint64_t v42 = objc_opt_class();
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_969;
      v59[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v59[4] = v42;
      if (qword_1EBD5C9D0 != -1) {
        dispatch_once(&qword_1EBD5C9D0, v59);
      }
      if (!byte_1EBD5C6D5) {
        goto LABEL_32;
      }
      uint64_t v43 = [NSString stringWithFormat:@"Decoded enh Mav HW RF ENH LTE"];
      uint64_t v44 = (void *)MEMORY[0x1E4F929B8];
      long long v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      long long v46 = [v45 lastPathComponent];
      long long v47 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]"];
      [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:1029];

      uint64_t v48 = PLLogCommon();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v43;
        _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v54 = objc_opt_class();
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_960;
      v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v60[4] = v54;
      if (qword_1EBD5C9C8 != -1) {
        dispatch_once(&qword_1EBD5C9C8, v60);
      }
      if (byte_1EBD5C6D4)
      {
        v39 = [NSString stringWithFormat:@"rfEnhLTE is not valid, return"];
        v55 = (void *)MEMORY[0x1E4F929B8];
        v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
        v57 = [v56 lastPathComponent];
        uint64_t v58 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]"];
        [v55 logMessage:v39 fromFile:v57 fromFunction:v58 fromLineNumber:934];

        uint64_t v43 = PLLogCommon();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 138412290;
        v64 = v39;
        goto LABEL_30;
      }
    }
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v49 = objc_opt_class();
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_951;
    v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v61[4] = v49;
    if (qword_1EBD5C9C0 != -1) {
      dispatch_once(&qword_1EBD5C9C0, v61);
    }
    if (byte_1EBD5C6D3)
    {
      v39 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfLTE failed"];
      uint64_t v50 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v52 = [v51 lastPathComponent];
      uint64_t v53 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFEnhLTEWithLogger:]"];
      [v50 logMessage:v39 fromFile:v52 fromFunction:v53 fromLineNumber:923];

      uint64_t v43 = PLLogCommon();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412290;
      v64 = v39;
LABEL_30:
      _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_31;
    }
  }
LABEL_33:
}

uint64_t __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D2 = result;
  return result;
}

uint64_t __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_951(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D3 = result;
  return result;
}

uint64_t __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_960(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D4 = result;
  return result;
}

uint64_t __48__PLBBMav13HwMsgParser_logHwRFEnhLTEWithLogger___block_invoke_969(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D5 = result;
  return result;
}

- (void)logHwRFEnhWCDMAWithLogger:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C9D8 != -1) {
      dispatch_once(&qword_1EBD5C9D8, block);
    }
    if (byte_1EBD5C6D6)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1034];

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
  uint64_t v13 = objc_alloc_init(PLBBMavHwRfWCDMALogMsg);
  if (v13)
  {
    id v14 = [(PLBasebandMessage *)self agent];
    [(PLBasebandMessage *)v13 setAgent:v14];

    [(PLBBMavHwRfWCDMALogMsg *)v13 setError:@"not set"];
    uint64_t v15 = [(PLBasebandMessage *)self seqNum];
    id v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")- -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[4]));
    [(PLBBMavHwRfWCDMALogMsg *)v13 setLogDuration:v17];

    uint64_t v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhWCDMA] + 8 ofSize:3];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setSCEqStatCnt:v18];

    uint64_t v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhWCDMA] + 20 ofSize:3];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDCEqStatCnt:v19];

    id v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhWCDMA] + 32 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setSCQsetEqStatCnt:v20];

    uint64_t v21 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhWCDMA] + 48 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDCQsetEqStatCnt:v21];

    uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhWCDMA] + 64 ofSize:2];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setDurInCarrierMode:v22];

    uint64_t v23 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhWCDMA] + 72 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setRABModeCnt:v23];

    uint64_t v24 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhWCDMA] + 88 ofSize:4];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setRABTypeCnt:v24];

    unint64_t v25 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhWCDMA] + 104 ofSize:12];
    [(PLBBMavHwRfWCDMALogMsg *)v13 setTxPwrBucket:v25];

    uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[152]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setFetCnt:v26];

    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[156]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcRxOnCnt:v27];

    uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[160]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcRxTxOffCnt:v28];

    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[164]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcTimeCnt:v29];

    uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[PLBBMav13HwMsgParser rfEnhWCDMA](self, "rfEnhWCDMA")[168]);
    [(PLBBMavHwRfWCDMALogMsg *)v13 setCpcEnergy:v30];

    uint64_t v31 = [(PLBBMavHwRfWCDMALogMsg *)v13 logEventBackwardBBMavHwRfWCDMA];
    v32 = [v31 objectForKey:@"entry"];
    v33 = [v31 objectForKey:@"entryKey"];
    [v12 addToGroupPLBBMavHwEntry:v32 withEntryKey:v33];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v34 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke_982;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v34;
    if (qword_1EBD5C9E8 != -1) {
      dispatch_once(&qword_1EBD5C9E8, v46);
    }
    if (!byte_1EBD5C6D8) {
      goto LABEL_23;
    }
    v35 = [NSString stringWithFormat:@"Decoded enh BB HW RF WCDMA"];
    uint64_t v36 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
    v38 = [v37 lastPathComponent];
    v39 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:]"];
    [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:1095];

    v40 = PLLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = v35;
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
    v47[2] = __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke_976;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v41;
    if (qword_1EBD5C9E0 != -1) {
      dispatch_once(&qword_1EBD5C9E0, v47);
    }
    if (byte_1EBD5C6D7)
    {
      uint64_t v31 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfWCDMA failed"];
      uint64_t v42 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v44 = [v43 lastPathComponent];
      long long v45 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFEnhWCDMAWithLogger:]"];
      [v42 logMessage:v31 fromFile:v44 fromFunction:v45 fromLineNumber:1038];

      v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v31;
        _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:
}

uint64_t __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D6 = result;
  return result;
}

uint64_t __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke_976(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D7 = result;
  return result;
}

uint64_t __50__PLBBMav13HwMsgParser_logHwRFEnhWCDMAWithLogger___block_invoke_982(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D8 = result;
  return result;
}

- (void)logHwRFGSMWithLogger:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav13HwMsgParser_logHwRFGSMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5C9F0 != -1) {
      dispatch_once(&qword_1EBD5C9F0, block);
    }
    if (byte_1EBD5C6D9)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logHwRFGSMWithLogger:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFGSMWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1101];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  uint64_t v13 = objc_alloc_init(PLBBMavHwRfGSMLogMsg);
  if (!v13)
  {
    uint64_t v19 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfEnhGSM failed"];
    uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
    uint64_t v31 = [v30 lastPathComponent];
    v32 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFGSMWithLogger:]"];
    [v29 logMessage:v19 fromFile:v31 fromFunction:v32 fromLineNumber:1105];

    uint64_t v23 = PLLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v19;
      _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  id v14 = [(PLBasebandMessage *)self agent];
  [(PLBasebandMessage *)v13 setAgent:v14];

  [(PLBBMavHwRfGSMLogMsg *)v13 setError:@"not set"];
  uint64_t v15 = [(PLBasebandMessage *)self seqNum];
  id v16 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  -[PLBBMavHwRfGSMLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnhGSM](self, "rfEnhGSM")- -[PLBBMav13HwMsgParser rfEnhGSM](self, "rfEnhGSM")[4]));
  [(PLBBMavHwRfGSMLogMsg *)v13 setLogDuration:v17];

  uint64_t v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhGSM] + 8 ofSize:3];
  [(PLBBMavHwRfGSMLogMsg *)v13 setConnState:v18];

  uint64_t v19 = [(PLBBMavHwRfGSMLogMsg *)v13 logEventBackwardBBMavHwRfGSM];
  id v20 = [v19 objectForKey:@"entry"];
  uint64_t v21 = [v19 objectForKey:@"entryKey"];
  [v12 addToGroupPLBBMavHwEntry:v20 withEntryKey:v21];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v22 = objc_opt_class();
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __45__PLBBMav13HwMsgParser_logHwRFGSMWithLogger___block_invoke_992;
    v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v33[4] = v22;
    if (qword_1EBD5C9F8 != -1) {
      dispatch_once(&qword_1EBD5C9F8, v33);
    }
    if (byte_1EBD5C6DA)
    {
      uint64_t v23 = [NSString stringWithFormat:@"Decoded enh BB HW RF ENH GSM"];
      uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v26 = [v25 lastPathComponent];
      uint64_t v27 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFGSMWithLogger:]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1125];

      uint64_t v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_18:
    }
  }
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFGSMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6D9 = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFGSMWithLogger___block_invoke_992(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6DA = result;
  return result;
}

- (void)logHwRFTDSWithLogger:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5CA00 != -1) {
      dispatch_once(&qword_1EBD5CA00, block);
    }
    if (byte_1EBD5C6DB)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logHwRFTDSWithLogger:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFTDSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1130];

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
  uint64_t v13 = objc_alloc_init(PLBBMavHwRfTDSLogMsg);
  if (v13)
  {
    id v14 = [(PLBasebandMessage *)self agent];
    [(PLBasebandMessage *)v13 setAgent:v14];

    [(PLBBMavHwRfTDSLogMsg *)v13 setError:@"not set"];
    uint64_t v15 = [(PLBasebandMessage *)self seqNum];
    id v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnhTDS](self, "rfEnhTDS")- -[PLBBMav13HwMsgParser rfEnhTDS](self, "rfEnhTDS")[4]));
    [(PLBBMavHwRfTDSLogMsg *)v13 setLogDuration:v17];

    uint64_t v18 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhTDS] + 8 ofSize:7];
    [(PLBBMavHwRfTDSLogMsg *)v13 setSrvcTypeCnt:v18];

    uint64_t v19 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhTDS] + 36 ofSize:3];
    [(PLBBMavHwRfTDSLogMsg *)v13 setRxdStateCnt:v19];

    id v20 = [(PLBBMavHwRfTDSLogMsg *)v13 logEventBackwardBBMavHwRfTDS];
    uint64_t v21 = [v20 objectForKey:@"entry"];
    uint64_t v22 = [v20 objectForKey:@"entryKey"];
    [v12 addToGroupPLBBMavHwEntry:v21 withEntryKey:v22];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v23 = objc_opt_class();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke_1005;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v23;
    if (qword_1EBD5CA10 != -1) {
      dispatch_once(&qword_1EBD5CA10, v35);
    }
    if (!byte_1EBD5C6DD) {
      goto LABEL_23;
    }
    uint64_t v24 = [NSString stringWithFormat:@"Decoded enh BB HW RF TDS"];
    unint64_t v25 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
    uint64_t v27 = [v26 lastPathComponent];
    uint64_t v28 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFTDSWithLogger:]"];
    [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:1155];

    uint64_t v29 = PLLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v24;
      _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v30 = objc_opt_class();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke_999;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v30;
    if (qword_1EBD5CA08 != -1) {
      dispatch_once(&qword_1EBD5CA08, v36);
    }
    if (byte_1EBD5C6DC)
    {
      id v20 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfGSM failed"];
      uint64_t v31 = (void *)MEMORY[0x1E4F929B8];
      v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      v33 = [v32 lastPathComponent];
      uint64_t v34 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFTDSWithLogger:]"];
      [v31 logMessage:v20 fromFile:v33 fromFunction:v34 fromLineNumber:1134];

      uint64_t v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v20;
        _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6DB = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke_999(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6DC = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFTDSWithLogger___block_invoke_1005(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6DD = result;
  return result;
}

- (void)logHwRF1xWithLogger:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5CA18 != -1) {
      dispatch_once(&qword_1EBD5CA18, block);
    }
    if (byte_1EBD5C6DE)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logHwRF1xWithLogger:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRF1xWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1160];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  uint64_t v13 = objc_alloc_init(PLBBMavHwRf1xLogMsg);
  if (v13)
  {
    id v14 = [(PLBasebandMessage *)self agent];
    [(PLBasebandMessage *)v13 setAgent:v14];

    [(PLBBMavHwRf1xLogMsg *)v13 setError:@"not set"];
    uint64_t v15 = [(PLBasebandMessage *)self seqNum];
    id v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRf1xLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K")- -[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K")[4]));
    [(PLBBMavHwRf1xLogMsg *)v13 setLogDuration:v17];

    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K")[8]);
    [(PLBBMavHwRf1xLogMsg *)v13 setDtxOn:v18];

    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhC2K](self, "rfEnhC2K")[12]);
    [(PLBBMavHwRf1xLogMsg *)v13 setDtxOff:v19];

    id v20 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhC2K] + 16 ofSize:6];
    [(PLBBMavHwRf1xLogMsg *)v13 setCallTypeDur:v20];

    uint64_t v21 = [(PLBBMavHwRf1xLogMsg *)v13 logEventBackwardBBMavHwRf1x];
    uint64_t v22 = [v21 objectForKey:@"entry"];
    uint64_t v23 = [v21 objectForKey:@"entryKey"];
    [v12 addToGroupPLBBMavHwEntry:v22 withEntryKey:v23];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v24 = objc_opt_class();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke_1018;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v24;
    if (qword_1EBD5CA28 != -1) {
      dispatch_once(&qword_1EBD5CA28, v36);
    }
    if (!byte_1EBD5C6E0) {
      goto LABEL_23;
    }
    unint64_t v25 = [NSString stringWithFormat:@"Decoded enh BB HW RF ENH 1x"];
    uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
    uint64_t v28 = [v27 lastPathComponent];
    uint64_t v29 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRF1xWithLogger:]"];
    [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:1219];

    uint64_t v30 = PLLogCommon();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v25;
      _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v31 = objc_opt_class();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke_1012;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v31;
    if (qword_1EBD5CA20 != -1) {
      dispatch_once(&qword_1EBD5CA20, v37);
    }
    if (byte_1EBD5C6DF)
    {
      uint64_t v21 = [NSString stringWithFormat:@"Error: mem alloc for logHwRf1x failed"];
      v32 = (void *)MEMORY[0x1E4F929B8];
      v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v34 = [v33 lastPathComponent];
      v35 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRF1xWithLogger:]"];
      [v32 logMessage:v21 fromFile:v34 fromFunction:v35 fromLineNumber:1164];

      unint64_t v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v21;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:
}

uint64_t __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6DE = result;
  return result;
}

uint64_t __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke_1012(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6DF = result;
  return result;
}

uint64_t __44__PLBBMav13HwMsgParser_logHwRF1xWithLogger___block_invoke_1018(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6E0 = result;
  return result;
}

- (void)logHwRFHDRWithLogger:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5CA30 != -1) {
      dispatch_once(&qword_1EBD5CA30, block);
    }
    if (byte_1EBD5C6E1)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logHwRFHDRWithLogger:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFHDRWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1224];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  uint64_t v13 = objc_alloc_init(PLBBMavHwRfHDRLogMsg);
  if (v13)
  {
    id v14 = [(PLBasebandMessage *)self agent];
    [(PLBasebandMessage *)v13 setAgent:v14];

    [(PLBBMavHwRfHDRLogMsg *)v13 setError:@"not set"];
    uint64_t v15 = [(PLBasebandMessage *)self seqNum];
    id v16 = [(PLBasebandMessage *)self date];
    [(PLBasebandMessage *)self timeCal];
    -[PLBBMavHwRfHDRLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

    uint64_t v17 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", (*(_DWORD *)-[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")- -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[4]));
    [(PLBBMavHwRfHDRLogMsg *)v13 setLogDuration:v17];

    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[8]);
    [(PLBBMavHwRfHDRLogMsg *)v13 setSDTXOnFrame:v18];

    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[12]);
    [(PLBBMavHwRfHDRLogMsg *)v13 setSDTXOffFrame:v19];

    id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[16]);
    [(PLBBMavHwRfHDRLogMsg *)v13 setLDTXOnFrame:v20];

    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[20]);
    [(PLBBMavHwRfHDRLogMsg *)v13 setLDTXOffFrame:v21];

    uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[24]);
    [(PLBBMavHwRfHDRLogMsg *)v13 setTDTXOnFrame:v22];

    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnh1xEVDO](self, "rfEnh1xEVDO")[28]);
    [(PLBBMavHwRfHDRLogMsg *)v13 setTDTXOffFrame:v23];

    uint64_t v24 = [(PLBBMavHwRfHDRLogMsg *)v13 logEventBackwardBBMavHwRfHDR];
    unint64_t v25 = [v24 objectForKey:@"entry"];
    uint64_t v26 = [v24 objectForKey:@"entryKey"];
    [v12 addToGroupPLBBMavHwEntry:v25 withEntryKey:v26];

    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_23;
    }
    uint64_t v27 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke_1031;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v27;
    if (qword_1EBD5CA40 != -1) {
      dispatch_once(&qword_1EBD5CA40, v39);
    }
    if (!byte_1EBD5C6E3) {
      goto LABEL_23;
    }
    uint64_t v28 = [NSString stringWithFormat:@"Decoded enh BB HW RF ENH HDR"];
    uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
    uint64_t v31 = [v30 lastPathComponent];
    v32 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFHDRWithLogger:]"];
    [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:1254];

    v33 = PLLogCommon();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v28;
      _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v34 = objc_opt_class();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke_1025;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v34;
    if (qword_1EBD5CA38 != -1) {
      dispatch_once(&qword_1EBD5CA38, v40);
    }
    if (byte_1EBD5C6E2)
    {
      uint64_t v24 = [NSString stringWithFormat:@"Error: mem alloc for logHwRfHDR failed"];
      v35 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFHDRWithLogger:]"];
      [v35 logMessage:v24 fromFile:v37 fromFunction:v38 fromLineNumber:1228];

      uint64_t v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v24;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
LABEL_24:
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6E1 = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke_1025(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6E2 = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFHDRWithLogger___block_invoke_1031(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6E3 = result;
  return result;
}

- (void)logHwRFOOSWithLogger:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBMav13HwMsgParser_logHwRFOOSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD5CA48 != -1) {
      dispatch_once(&qword_1EBD5CA48, block);
    }
    if (byte_1EBD5C6E4)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBMav13HwMsgParser logHwRFOOSWithLogger:]");
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFOOSWithLogger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1259];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  uint64_t v13 = objc_opt_new();
  id v14 = [(PLBasebandMessage *)self agent];
  [v13 setAgent:v14];

  [v13 setError:&stru_1F294E108];
  uint64_t v15 = [(PLBasebandMessage *)self seqNum];
  id v16 = [(PLBasebandMessage *)self date];
  [(PLBasebandMessage *)self timeCal];
  objc_msgSend(v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
  [v13 setLogDuration:v17];

  objc_msgSend(v13, "setOosInProgress:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS")[2]);
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS")[4]);
  [v13 setOosTicks:v18];

  uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)-[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS"));
  [v13 setOosTimes:v19];

  id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLBBMav13HwMsgParser rfEnhOOS](self, "rfEnhOOS")[8]);
  [v13 setPssiTicks:v20];

  uint64_t v21 = [(PLBasebandHardwareMessage *)self convertUint16ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhOOS] + 12 ofSize:6];
  [v13 setOosGsmPssiTimes:v21];

  uint64_t v22 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhOOS] + 60 ofSize:6];
  [v13 setOosGsmPssiStatTicks:v22];

  uint64_t v23 = [(PLBasebandHardwareMessage *)self convertUint16ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhOOS] + 24 ofSize:6];
  [v13 setOosWcdmaPssiTimes:v23];

  uint64_t v24 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhOOS] + 84 ofSize:6];
  [v13 setOosWcdmaPssiStatTicks:v24];

  unint64_t v25 = [(PLBasebandHardwareMessage *)self convertUint16ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhOOS] + 36 ofSize:6];
  [v13 setOosLtePssiTimes:v25];

  uint64_t v26 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhOOS] + 108 ofSize:6];
  [v13 setOosLtePssiStatTicks:v26];

  uint64_t v27 = [(PLBasebandHardwareMessage *)self convertUint16ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhOOS] + 48 ofSize:6];
  [v13 setOosTdsPssiTimes:v27];

  uint64_t v28 = [(PLBasebandHardwareMessage *)self convertUint32ArrayToNSArray:[(PLBBMav13HwMsgParser *)self rfEnhOOS] + 132 ofSize:6];
  [v13 setOosTdsPssiStatTicks:v28];

  uint64_t v29 = [v13 logEventBackwardBBMavHwRfOos];
  uint64_t v30 = [v29 objectForKey:@"entry"];
  uint64_t v31 = [v29 objectForKey:@"entryKey"];
  [v12 addToGroupPLBBMavHwEntry:v30 withEntryKey:v31];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __45__PLBBMav13HwMsgParser_logHwRFOOSWithLogger___block_invoke_1038;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v32;
    if (qword_1EBD5CA50 != -1) {
      dispatch_once(&qword_1EBD5CA50, v39);
    }
    if (byte_1EBD5C6E5)
    {
      v33 = [NSString stringWithFormat:@"Decoded enh BB HW RF ENH OOS"];
      uint64_t v34 = (void *)MEMORY[0x1E4F929B8];
      v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav13HwMsgParser.m"];
      uint64_t v36 = [v35 lastPathComponent];
      uint64_t v37 = [NSString stringWithUTF8String:"-[PLBBMav13HwMsgParser logHwRFOOSWithLogger:]"];
      [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:1309];

      v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v33;
        _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFOOSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6E4 = result;
  return result;
}

uint64_t __45__PLBBMav13HwMsgParser_logHwRFOOSWithLogger___block_invoke_1038(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C6E5 = result;
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
  uint64_t v9 = apps_clock_names_2;
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
    uint64_t v15 = [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration];

    if (!v15) {
      goto LABEL_17;
    }
    id v16 = [(PLMav7BasebandHardwareMessage *)self mpss_clock_duration];
  }
  else
  {
    id v16 = [(PLMav7BasebandHardwareMessage *)self apps_clock_duration];
  }
  uint64_t v18 = v16;
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

- ($6A53C83E73901DD0C34CF18301855816)rpmData
{
  return self->_rpmData;
}

- (void)setRpmData:(id *)a3
{
  self->_rpmData = a3;
}

- ($13802F9730B8C46AAB76E09031085152)appsPerf
{
  return self->_appsPerf;
}

- (void)setAppsPerf:(id *)a3
{
  self->_appsPerf = a3;
}

- ($6247608A9E858CB8A0F4CC99D4816BFE)appsSleep
{
  return self->_appsSleep;
}

- (void)setAppsSleep:(id *)a3
{
  self->_appsSleep = a3;
}

- ($C1957A8FD3E0093B731E920E3B161E9A)pcieState
{
  return self->_pcieState;
}

- (void)setPcieState:(id *)a3
{
  self->_pcieState = a3;
}

- ($FC730E2F24BB0828101253C3B52D6220)lpassState
{
  return self->_lpassState;
}

- (void)setLpassState:(id *)a3
{
  self->_lpassState = a3;
}

- ($6988F191A2E699FD2FDBF2169EACE1F4)appsSleepVeto
{
  return self->_appsSleepVeto;
}

- (void)setAppsSleepVeto:(id *)a3
{
  self->_appsSleepVeto = a3;
}

- ($6A788595DF0CE5F229CF8C0E99A1983A)mpssSleepVeto
{
  return self->_mpssSleepVeto;
}

- (void)setMpssSleepVeto:(id *)a3
{
  self->_mpssSleepVeto = a3;
}

- ($E07DBFA35793E6ACBF53B370E2AAA817)qdspSpeed
{
  return self->_qdspSpeed;
}

- (void)setQdspSpeed:(id *)a3
{
  self->_qdspSpeed = a3;
}

- ($6247608A9E858CB8A0F4CC99D4816BFE)mpssSleep
{
  return self->_mpssSleep;
}

- (void)setMpssSleep:(id *)a3
{
  self->_mpssSleep = a3;
}

- ($FC730E2F24BB0828101253C3B52D6220)gpsState
{
  return self->_gpsState;
}

- (void)setGpsState:(id *)a3
{
  self->_gpsState = a3;
}

- ($FC730E2F24BB0828101253C3B52D6220)gpsDpoState
{
  return self->_gpsDpoState;
}

- (void)setGpsDpoState:(id *)a3
{
  self->_gpsDpoState = a3;
}

- ($13802F9730B8C46AAB76E09031085152)gpsDpoBins
{
  return self->_gpsDpoBins;
}

- (void)setGpsDpoBins:(id *)a3
{
  self->_gpsDpoBins = a3;
}

- ($6259AD99E0296D9E5FB04EEC1BEE6709)mcpmSleepVeto
{
  return self->_mcpmSleepVeto;
}

- (void)setMcpmSleepVeto:(id *)a3
{
  self->_mcpmSleepVeto = a3;
}

- ($13802F9730B8C46AAB76E09031085152)protocolActive
{
  return self->_protocolActive;
}

- (void)setProtocolActive:(id *)a3
{
  self->_protocolActive = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protocolState
{
  return self->_protocolState;
}

- (void)setProtocolState:(id *)a3
{
  self->_protocolState = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateC2K
{
  return self->_protoStateC2K;
}

- (void)setProtoStateC2K:(id *)a3
{
  self->_protoStateC2K = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateHDR
{
  return self->_protoStateHDR;
}

- (void)setProtoStateHDR:(id *)a3
{
  self->_protoStateHDR = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateGSM
{
  return self->_protoStateGSM;
}

- (void)setProtoStateGSM:(id *)a3
{
  self->_protoStateGSM = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateWCDMA
{
  return self->_protoStateWCDMA;
}

- (void)setProtoStateWCDMA:(id *)a3
{
  self->_protoStateWCDMA = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateLTE
{
  return self->_protoStateLTE;
}

- (void)setProtoStateLTE:(id *)a3
{
  self->_protoStateLTE = a3;
}

- ($DD746A1FB08B04E88D15572321826CC5)protoStateTDS
{
  return self->_protoStateTDS;
}

- (void)setProtoStateTDS:(id *)a3
{
  self->_protoStateTDS = a3;
}

- (char)optimMaskArray
{
  return self->_optimMaskArray;
}

- (void)setOptimMaskArray:(char *)a3
{
  self->_optimMaskArray = a3;
}

- ($4B43A875349FDE5438E0A7464BB34732)rfData
{
  return self->_rfData;
}

- (void)setRfData:(id *)a3
{
  self->_rfData = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfDataC2K
{
  return self->_rfDataC2K;
}

- (void)setRfDataC2K:(id *)a3
{
  self->_rfDataC2K = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfData1xEVDO
{
  return self->_rfData1xEVDO;
}

- (void)setRfData1xEVDO:(id *)a3
{
  self->_rfData1xEVDO = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfDataGSM
{
  return self->_rfDataGSM;
}

- (void)setRfDataGSM:(id *)a3
{
  self->_rfDataGSM = a3;
}

- ($D6D8E5E4F24C290D662940195489C6C4)rfDataWCDMA
{
  return self->_rfDataWCDMA;
}

- (void)setRfDataWCDMA:(id *)a3
{
  self->_rfDataWCDMA = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfDataLTE
{
  return self->_rfDataLTE;
}

- (void)setRfDataLTE:(id *)a3
{
  self->_rfDataLTE = a3;
}

- ($E087ED438533671735DC466A2DECADBB)rfDataTDS
{
  return self->_rfDataTDS;
}

- (void)setRfDataTDS:(id *)a3
{
  self->_rfDataTDS = a3;
}

- ($4B3C126EB6F1D3E89E2CF41D7D563E2C)rfEnhC2K
{
  return self->_rfEnhC2K;
}

- (void)setRfEnhC2K:(id *)a3
{
  self->_rfEnhC2K = a3;
}

- ($615E96CE89CC24DAA6A822A8D29B2798)rfEnh1xEVDO
{
  return self->_rfEnh1xEVDO;
}

- (void)setRfEnh1xEVDO:(id *)a3
{
  self->_rfEnh1xEVDO = a3;
}

- ($D38AB55F17507DDEA729FCED855170D9)rfEnhGSM
{
  return self->_rfEnhGSM;
}

- (void)setRfEnhGSM:(id *)a3
{
  self->_rfEnhGSM = a3;
}

- ($E0EEEB5BA8699BABA569A46DBC0146B0)rfEnhWCDMA
{
  return self->_rfEnhWCDMA;
}

- (void)setRfEnhWCDMA:(id *)a3
{
  self->_rfEnhWCDMA = a3;
}

- ($0C0A99A7A001DBC942837B17909EADCE)rfEnhLTE
{
  return self->_rfEnhLTE;
}

- (void)setRfEnhLTE:(id *)a3
{
  self->_rfEnhLTE = a3;
}

- ($81F89CDC83781E2F8C3B7C08B1FDA3B1)rfEnhTDS
{
  return self->_rfEnhTDS;
}

- (void)setRfEnhTDS:(id *)a3
{
  self->_rfEnhTDS = a3;
}

- ($75CBB50FA0EA21D6D12C68A4AD2E7930)rfEnhOOS
{
  return self->_rfEnhOOS;
}

- (void)setRfEnhOOS:(id *)a3
{
  self->_rfEnhOOS = a3;
}

@end