@interface PLBBTelephonyActivityMsg
+ (id)entryEventPointDefinitionTelephonyActivity;
- (NSNumber)signalBars;
- (NSNumber)signalStrength;
- (NSString)activeBand;
- (NSString)airplaneMode;
- (NSString)callStatus;
- (NSString)campedRat;
- (NSString)currentRat;
- (NSString)dataStatus;
- (NSString)preferredRat;
- (NSString)simStatus;
- (void)logPointIntervalTelephonyActivity;
- (void)logPointIntervalTelephonyActivityAirplaneModeChange;
- (void)refreshTelephonyActivity;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setActiveBand:(id)a3;
- (void)setAirplaneMode:(id)a3;
- (void)setCallStatus:(id)a3;
- (void)setCampedRat:(id)a3;
- (void)setCurrentRat:(id)a3;
- (void)setDataStatus:(id)a3;
- (void)setPreferredRat:(id)a3;
- (void)setSignalBars:(id)a3;
- (void)setSignalStrength:(id)a3;
- (void)setSimStatus:(id)a3;
@end

@implementation PLBBTelephonyActivityMsg

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F929C0];
  id v11 = a3;
  if ([v10 debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PLBBTelephonyActivityMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1EBD589B0 != -1) {
      dispatch_once(&qword_1EBD589B0, block);
    }
    if (_MergedGlobals_1_33)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBTelephonyActivityMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)MEMORY[0x1E4F929B8];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m"];
      v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"-[PLBBTelephonyActivityMsg sendAndLogPLEntry:withName:withType:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:23];

      v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __64__PLBBTelephonyActivityMsg_sendAndLogPLEntry_withName_withType___block_invoke_17;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = v19;
    if (qword_1EBD589B8 != -1) {
      dispatch_once(&qword_1EBD589B8, v27);
    }
    if (byte_1EBD589A9)
    {
      v20 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v8, v9];
      v21 = (void *)MEMORY[0x1E4F929B8];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m"];
      v23 = [v22 lastPathComponent];
      v24 = [NSString stringWithUTF8String:"-[PLBBTelephonyActivityMsg sendAndLogPLEntry:withName:withType:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:24];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v26 = [(PLBBMsgRoot *)self agent];
  [v26 logEntry:v11];
}

uint64_t __64__PLBBTelephonyActivityMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_33 = result;
  return result;
}

uint64_t __64__PLBBTelephonyActivityMsg_sendAndLogPLEntry_withName_withType___block_invoke_17(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589A9 = result;
  return result;
}

+ (id)entryEventPointDefinitionTelephonyActivity
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v31[0] = *MEMORY[0x1E4F92CD0];
  v31[1] = v2;
  v32[0] = &unk_1F29F0B30;
  v32[1] = MEMORY[0x1E4F1CC28];
  v31[2] = *MEMORY[0x1E4F92CB0];
  v32[2] = @"refreshRequestHandler";
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E4F92CA8];
  v29[0] = @"activeBand";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat");
  v30[0] = v26;
  v29[1] = @"dataStatus";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_StringFormat");
  v30[1] = v24;
  v29[2] = @"currentRat";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_StringFormat");
  v30[2] = v22;
  v29[3] = @"preferredRat";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v30[3] = v20;
  v29[4] = @"campedRat";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_StringFormat");
  v30[4] = v18;
  v29[5] = @"callStatus";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v30[5] = v16;
  v29[6] = @"airplaneMode";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v30[6] = v14;
  v29[7] = @"simStatus";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v30[7] = v4;
  v29[8] = @"subsId";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v30[8] = v6;
  v29[9] = @"signalStrength";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v30[9] = v8;
  v29[10] = @"signalBars";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v30[10] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
  v34[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  return v12;
}

- (void)refreshTelephonyActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PLBBTelephonyActivityMsg_refreshTelephonyActivity__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD589C0 != -1) {
      dispatch_once(&qword_1EBD589C0, block);
    }
    if (byte_1EBD589AA)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBTelephonyActivityMsg refreshTelephonyActivity]");
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m"];
      v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBTelephonyActivityMsg refreshTelephonyActivity]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:81];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__PLBBTelephonyActivityMsg_refreshTelephonyActivity__block_invoke_61;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = v10;
    if (qword_1EBD589C8 != -1) {
      dispatch_once(&qword_1EBD589C8, v17);
    }
    if (byte_1EBD589AB)
    {
      id v11 = [NSString stringWithFormat:@"Refresh not implemented"];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLBBTelephonyActivityMsg refreshTelephonyActivity]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:82];

      v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __52__PLBBTelephonyActivityMsg_refreshTelephonyActivity__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589AA = result;
  return result;
}

uint64_t __52__PLBBTelephonyActivityMsg_refreshTelephonyActivity__block_invoke_61(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589AB = result;
  return result;
}

- (void)logPointIntervalTelephonyActivityAirplaneModeChange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __79__PLBBTelephonyActivityMsg_logPointIntervalTelephonyActivityAirplaneModeChange__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v3;
    if (qword_1EBD589D0 != -1) {
      dispatch_once(&qword_1EBD589D0, &block);
    }
    if (byte_1EBD589AC)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBTelephonyActivityMsg logPointIntervalTelephonyActivityAirplaneModeChange]", block, v15, v16, v17, v18);
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m"];
      v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBTelephonyActivityMsg logPointIntervalTelephonyActivityAirplaneModeChange]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:89];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D48];
  id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"TelephonyActivity"];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  [v12 setObject:0 forKeyedSubscript:@"activeBand"];
  [v12 setObject:0 forKeyedSubscript:@"dataStatus"];
  [v12 setObject:0 forKeyedSubscript:@"currentRat"];
  [v12 setObject:0 forKeyedSubscript:@"preferredRat"];
  [v12 setObject:0 forKeyedSubscript:@"campedRat"];
  [v12 setObject:0 forKeyedSubscript:@"callStatus"];
  v13 = [(PLBBTelephonyActivityMsg *)self airplaneMode];
  [v12 setObject:v13 forKeyedSubscript:@"airplaneMode"];

  [v12 setObject:0 forKeyedSubscript:@"simStatus"];
  [v12 setObject:0 forKeyedSubscript:@"signalStrength"];
  [v12 setObject:0 forKeyedSubscript:@"signalBars"];
  [(PLBBTelephonyActivityMsg *)self sendAndLogPLEntry:v12 withName:@"TelephonyActivity" withType:v10];
}

uint64_t __79__PLBBTelephonyActivityMsg_logPointIntervalTelephonyActivityAirplaneModeChange__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589AC = result;
  return result;
}

- (void)logPointIntervalTelephonyActivity
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __61__PLBBTelephonyActivityMsg_logPointIntervalTelephonyActivity__block_invoke;
    v26 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v27 = v3;
    if (qword_1EBD589D8 != -1) {
      dispatch_once(&qword_1EBD589D8, &block);
    }
    if (byte_1EBD589AD)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBTelephonyActivityMsg logPointIntervalTelephonyActivity]", block, v24, v25, v26, v27);
      v5 = (void *)MEMORY[0x1E4F929B8];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m"];
      v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBTelephonyActivityMsg logPointIntervalTelephonyActivity]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:113];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F92D48];
  id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"TelephonyActivity"];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  v13 = [(PLBBTelephonyActivityMsg *)self activeBand];
  [v12 setObject:v13 forKeyedSubscript:@"activeBand"];

  v14 = [(PLBBTelephonyActivityMsg *)self dataStatus];
  [v12 setObject:v14 forKeyedSubscript:@"dataStatus"];

  uint64_t v15 = [(PLBBTelephonyActivityMsg *)self currentRat];
  [v12 setObject:v15 forKeyedSubscript:@"currentRat"];

  v16 = [(PLBBTelephonyActivityMsg *)self preferredRat];
  [v12 setObject:v16 forKeyedSubscript:@"preferredRat"];

  v17 = [(PLBBTelephonyActivityMsg *)self campedRat];
  [v12 setObject:v17 forKeyedSubscript:@"campedRat"];

  uint64_t v18 = [(PLBBTelephonyActivityMsg *)self callStatus];
  [v12 setObject:v18 forKeyedSubscript:@"callStatus"];

  uint64_t v19 = [(PLBBTelephonyActivityMsg *)self airplaneMode];
  [v12 setObject:v19 forKeyedSubscript:@"airplaneMode"];

  v20 = [(PLBBTelephonyActivityMsg *)self simStatus];
  [v12 setObject:v20 forKeyedSubscript:@"simStatus"];

  uint64_t v21 = [(PLBBTelephonyActivityMsg *)self signalStrength];
  [v12 setObject:v21 forKeyedSubscript:@"signalStrength"];

  v22 = [(PLBBTelephonyActivityMsg *)self signalBars];
  [v12 setObject:v22 forKeyedSubscript:@"signalBars"];

  [(PLBBTelephonyActivityMsg *)self sendAndLogPLEntry:v12 withName:@"TelephonyActivity" withType:v10];
}

uint64_t __61__PLBBTelephonyActivityMsg_logPointIntervalTelephonyActivity__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589AD = result;
  return result;
}

- (NSString)activeBand
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActiveBand:(id)a3
{
}

- (NSString)dataStatus
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDataStatus:(id)a3
{
}

- (NSString)currentRat
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentRat:(id)a3
{
}

- (NSString)preferredRat
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPreferredRat:(id)a3
{
}

- (NSString)campedRat
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCampedRat:(id)a3
{
}

- (NSString)callStatus
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCallStatus:(id)a3
{
}

- (NSString)airplaneMode
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAirplaneMode:(id)a3
{
}

- (NSString)simStatus
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSimStatus:(id)a3
{
}

- (NSNumber)signalStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSignalStrength:(id)a3
{
}

- (NSNumber)signalBars
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSignalBars:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalBars, 0);
  objc_storeStrong((id *)&self->_signalStrength, 0);
  objc_storeStrong((id *)&self->_simStatus, 0);
  objc_storeStrong((id *)&self->_airplaneMode, 0);
  objc_storeStrong((id *)&self->_callStatus, 0);
  objc_storeStrong((id *)&self->_campedRat, 0);
  objc_storeStrong((id *)&self->_preferredRat, 0);
  objc_storeStrong((id *)&self->_currentRat, 0);
  objc_storeStrong((id *)&self->_dataStatus, 0);
  objc_storeStrong((id *)&self->_activeBand, 0);
}

@end