@interface PLBBTelephonyRegMsg
+ (id)bbEuLogMsgNameTelephonyReg;
- (NSDate)timeUpdate;
- (NSDictionary)telRegInfo;
- (NSNumber)cellID;
- (NSNumber)dataActive;
- (NSNumber)dataAttached;
- (NSNumber)homeNetwork;
- (NSNumber)lac;
- (NSString)dataIndicator;
- (NSString)operatorName;
- (NSString)registrationStatus;
- (PLBBTelephonyRegMsg)init;
- (id)humanReadableDataIndicator:(id)a3;
- (id)humanReadableRegistrationStatus:(id)a3;
- (unsigned)changed;
- (void)fillPLEntryAndSend:(id)a3;
- (void)logEventPointTelephonyRegistration;
- (void)logEventPointTelephonyRegistrationAtInit;
- (void)processTelReg;
- (void)refreshTelephonyReg;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setAttrCellID:(id)a3;
- (void)setAttrDataActive:(id)a3;
- (void)setAttrDataAttached:(id)a3;
- (void)setAttrDataIndicator:(id)a3;
- (void)setAttrHomeNetwork:(id)a3;
- (void)setAttrLac:(id)a3;
- (void)setAttrOperatorName:(id)a3;
- (void)setAttrRegistrationStatus:(id)a3;
- (void)setCellID:(id)a3;
- (void)setChanged:(unsigned __int8)a3;
- (void)setDataActive:(id)a3;
- (void)setDataAttached:(id)a3;
- (void)setDataIndicator:(id)a3;
- (void)setHomeNetwork:(id)a3;
- (void)setLac:(id)a3;
- (void)setOperatorName:(id)a3;
- (void)setRegistrationStatus:(id)a3;
- (void)setTelRegInfo:(id)a3;
- (void)setTimeUpdate:(id)a3;
@end

@implementation PLBBTelephonyRegMsg

- (void)setAttrOperatorName:(id)a3
{
  id v8 = a3;
  if (([v8 isEqualToString:&stru_1F294E108] & 1) != 0 || !objc_msgSend(v8, "length"))
  {

    id v8 = 0;
  }
  v4 = [(PLBBTelephonyRegMsg *)self operatorName];
  if ([v4 isEqual:v8])
  {
  }
  else
  {
    v5 = [(PLBBTelephonyRegMsg *)self operatorName];
    if ([v5 length])
    {

      v6 = v8;
    }
    else
    {
      uint64_t v7 = [v8 length];

      v6 = v8;
      if (!v7) {
        goto LABEL_11;
      }
    }
    id v8 = v6;
    [(PLBBTelephonyRegMsg *)self setOperatorName:v6];
    [(PLBBTelephonyRegMsg *)self setChanged:1];
  }
  v6 = v8;
LABEL_11:
}

- (NSString)operatorName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)processTelReg
{
  v3 = [(PLBBTelephonyRegMsg *)self telRegInfo];
  v4 = [v3 objectForKey:@"kCTRegistrationCellChangedNotification"];
  int v5 = [v4 isEqualToString:@"Valid"];

  if (v5)
  {
    v6 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F23FC8]];
    [(PLBBTelephonyRegMsg *)self setCellID:v7];

    id v8 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    uint64_t v9 = *MEMORY[0x1E4F24090];
    v10 = [v8 objectForKey:*MEMORY[0x1E4F24090]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(PLBBTelephonyRegMsg *)self telRegInfo];
      uint64_t v12 = [v11 objectForKey:v9];

      if (!v12) {
        goto LABEL_7;
      }
      [(PLBBTelephonyRegMsg *)self setAttrLac:v12];
      id v8 = (void *)v12;
    }
    else
    {
    }
  }
LABEL_7:
  v13 = [(PLBBTelephonyRegMsg *)self telRegInfo];
  v14 = [v13 objectForKey:@"kCTRegistrationStatusChangedNotification"];
  int v15 = [v14 isEqualToString:@"Valid"];

  if (v15)
  {
    v16 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    uint64_t v17 = *MEMORY[0x1E4F24170];
    v18 = [v16 objectForKey:*MEMORY[0x1E4F24170]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [(PLBBTelephonyRegMsg *)self telRegInfo];
      v20 = [v19 objectForKey:v17];
    }
    else
    {
      v20 = 0;
    }

    v21 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    uint64_t v22 = *MEMORY[0x1E4F24088];
    v23 = [v21 objectForKey:*MEMORY[0x1E4F24088]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [(PLBBTelephonyRegMsg *)self telRegInfo];
      v25 = [v24 objectForKey:v22];
    }
    else
    {
      v25 = 0;
    }

    if (v20)
    {
      v26 = [(PLBBTelephonyRegMsg *)self humanReadableRegistrationStatus:v20];
      [(PLBBTelephonyRegMsg *)self setAttrRegistrationStatus:v26];
    }
    if (v25) {
      [(PLBBTelephonyRegMsg *)self setAttrHomeNetwork:v25];
    }
  }
  v27 = [(PLBBTelephonyRegMsg *)self telRegInfo];
  v28 = [v27 objectForKey:@"kCTRegistrationDataStatusChangedNotification"];
  int v29 = [v28 isEqualToString:@"Valid"];

  if (v29)
  {
    v30 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    uint64_t v31 = *MEMORY[0x1E4F23FF8];
    v32 = [v30 objectForKey:*MEMORY[0x1E4F23FF8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [(PLBBTelephonyRegMsg *)self telRegInfo];
      v34 = [v33 objectForKey:v31];
    }
    else
    {
      v34 = 0;
    }

    v35 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    uint64_t v36 = *MEMORY[0x1E4F23FF0];
    v37 = [v35 objectForKey:*MEMORY[0x1E4F23FF0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [(PLBBTelephonyRegMsg *)self telRegInfo];
      v39 = [v38 objectForKey:v36];
    }
    else
    {
      v39 = 0;
    }

    v40 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    uint64_t v41 = *MEMORY[0x1E4F24018];
    v42 = [v40 objectForKey:*MEMORY[0x1E4F24018]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [(PLBBTelephonyRegMsg *)self telRegInfo];
      v44 = [v43 objectForKey:v41];
    }
    else
    {
      v44 = 0;
    }

    if (v34) {
      [(PLBBTelephonyRegMsg *)self setAttrDataAttached:v34];
    }
    if (v39) {
      [(PLBBTelephonyRegMsg *)self setAttrDataActive:v39];
    }
    if (v44)
    {
      v45 = [(PLBBTelephonyRegMsg *)self humanReadableDataIndicator:v44];
      [(PLBBTelephonyRegMsg *)self setAttrDataIndicator:v45];
    }
  }
  v46 = [(PLBBTelephonyRegMsg *)self telRegInfo];
  v47 = [v46 objectForKey:@"kCTRegistrationOperatorNameChangedNotification"];
  int v48 = [v47 isEqualToString:@"Valid"];

  if (v48)
  {
    v49 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    v50 = [v49 objectForKey:*MEMORY[0x1E4F24098]];
    [(PLBBTelephonyRegMsg *)self setAttrOperatorName:v50];
  }
  else
  {
    v49 = (void *)CTRegistrationCopyOperatorName();
    [(PLBBTelephonyRegMsg *)self setAttrOperatorName:v49];
  }

  v51 = [(PLBBTelephonyRegMsg *)self telRegInfo];
  v52 = [v51 objectForKey:@"kCTTimeUpdateNotification"];
  int v53 = [v52 isEqualToString:@"Valid"];

  if (v53)
  {
    v54 = [(PLBBTelephonyRegMsg *)self telRegInfo];
    uint64_t v55 = *MEMORY[0x1E4F24298];
    id v60 = v54;
    v56 = [v54 objectForKey:*MEMORY[0x1E4F24298]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = [(PLBBTelephonyRegMsg *)self telRegInfo];
      uint64_t v58 = [v57 objectForKey:v55];

      if (!v58) {
        return;
      }
      [(PLBBTelephonyRegMsg *)self setTimeUpdate:v58];
      v59 = (void *)v58;
    }
    else
    {

      v59 = v60;
    }
  }
}

- (NSDictionary)telRegInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTelRegInfo:(id)a3
{
}

- (void)setCellID:(id)a3
{
}

- (void)setAttrLac:(id)a3
{
  id v6 = a3;
  v4 = [(PLBBTelephonyRegMsg *)self lac];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(PLBBTelephonyRegMsg *)self setLac:v6];
    if ([MEMORY[0x1E4F929C0] fullMode]) {
      [(PLBBTelephonyRegMsg *)self setChanged:1];
    }
  }
}

- (void)logEventPointTelephonyRegistration
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    int v15 = __57__PLBBTelephonyRegMsg_logEventPointTelephonyRegistration__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v3;
    if (qword_1EBD5AA38 != -1) {
      dispatch_once(&qword_1EBD5AA38, &block);
    }
    if (byte_1EBD5AA14)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBTelephonyRegMsg logEventPointTelephonyRegistration]", block, v14, v15, v16, v17);
      char v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m"];
      uint64_t v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBTelephonyRegMsg logEventPointTelephonyRegistration]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:92];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v10 = [(PLBBTelephonyRegMsg *)self telRegInfo];

  if (v10)
  {
    v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"TelephonyRegistration"];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
    [(PLBBTelephonyRegMsg *)self processTelReg];
    [(PLBBTelephonyRegMsg *)self fillPLEntryAndSend:v12];
  }
}

- (NSNumber)lac
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)fillPLEntryAndSend:(id)a3
{
  id v13 = a3;
  if ([(PLBBTelephonyRegMsg *)self changed])
  {
    v4 = [(PLBBTelephonyRegMsg *)self operatorName];
    [v13 setObject:v4 forKeyedSubscript:@"operator"];

    char v5 = [(PLBBTelephonyRegMsg *)self lac];
    [v13 setObject:v5 forKeyedSubscript:@"lac"];

    id v6 = [(PLBBTelephonyRegMsg *)self cellID];
    [v13 setObject:v6 forKeyedSubscript:@"cellId"];

    uint64_t v7 = [(PLBBTelephonyRegMsg *)self homeNetwork];
    [v13 setObject:v7 forKeyedSubscript:@"home"];

    id v8 = [(PLBBTelephonyRegMsg *)self dataAttached];
    [v13 setObject:v8 forKeyedSubscript:@"dataAttached"];

    uint64_t v9 = [(PLBBTelephonyRegMsg *)self dataActive];
    [v13 setObject:v9 forKeyedSubscript:@"dataActive"];

    v10 = [(PLBBTelephonyRegMsg *)self dataIndicator];
    [v13 setObject:v10 forKeyedSubscript:@"dataInd"];

    v11 = [(PLBBTelephonyRegMsg *)self registrationStatus];
    [v13 setObject:v11 forKeyedSubscript:@"status"];

    [(PLBBTelephonyRegMsg *)self sendAndLogPLEntry:v13 withName:@"TelephonyRegistration" withType:*MEMORY[0x1E4F92D30]];
    if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
    {
      uint64_t v12 = [(PLBasebandMessage *)self agent];
      [v12 createOOSAccountingEvent:v13];
    }
    [(PLBBTelephonyRegMsg *)self setChanged:0];
  }
}

- (unsigned)changed
{
  return self->_changed;
}

- (PLBBTelephonyRegMsg)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLBBTelephonyRegMsg;
  result = [(PLBBTelephonyRegMsg *)&v3 init];
  if (result) {
    result->_changed = 0;
  }
  return result;
}

- (void)refreshTelephonyReg
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D942A350](self, a2);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLBBTelephonyRegMsg_refreshTelephonyReg__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AA18 != -1) {
      dispatch_once(&qword_1EBD5AA18, block);
    }
    if (_MergedGlobals_1_61)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBTelephonyRegMsg refreshTelephonyReg]");
      char v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m"];
      uint64_t v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBTelephonyRegMsg refreshTelephonyReg]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:37];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __42__PLBBTelephonyRegMsg_refreshTelephonyReg__block_invoke_17;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = v10;
    if (qword_1EBD5AA20 != -1) {
      dispatch_once(&qword_1EBD5AA20, v17);
    }
    if (byte_1EBD5AA11)
    {
      v11 = [NSString stringWithFormat:@"Refresh not implemented"];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m"];
      uint64_t v14 = [v13 lastPathComponent];
      int v15 = [NSString stringWithUTF8String:"-[PLBBTelephonyRegMsg refreshTelephonyReg]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:38];

      v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __42__PLBBTelephonyRegMsg_refreshTelephonyReg__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_61 = result;
  return result;
}

uint64_t __42__PLBBTelephonyRegMsg_refreshTelephonyReg__block_invoke_17(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA11 = result;
  return result;
}

+ (id)bbEuLogMsgNameTelephonyReg
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v29[0] = *MEMORY[0x1E4F92CD0];
  v29[1] = v2;
  v30[0] = &unk_1F29F13A0;
  v30[1] = MEMORY[0x1E4F1CC28];
  v29[2] = *MEMORY[0x1E4F92CB0];
  v30[2] = @"refreshRequestHandler";
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  v32[0] = v26;
  v31[1] = *MEMORY[0x1E4F92CA8];
  v27[0] = @"operator";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_StringFormat");
  v28[0] = v24;
  v27[1] = @"lac";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v28[1] = v22;
  v27[2] = @"cellId";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v28[2] = v20;
  v27[3] = @"home";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v28[3] = v18;
  v27[4] = @"dataAttached";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_BoolFormat");
  v28[4] = v16;
  v27[5] = @"dataActive";
  int v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_BoolFormat");
  v28[5] = v14;
  v27[6] = @"dataInd";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v28[6] = v4;
  v27[7] = @"status";
  char v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v28[7] = v6;
  v27[8] = @"serviceOpt";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v28[8] = v8;
  v27[9] = @"subsId";
  uint64_t v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v28[9] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:10];
  v32[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

  return v12;
}

- (void)logEventPointTelephonyRegistrationAtInit
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PLBBTelephonyRegMsg_logEventPointTelephonyRegistrationAtInit__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5AA28 != -1) {
      dispatch_once(&qword_1EBD5AA28, block);
    }
    if (byte_1EBD5AA12)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBTelephonyRegMsg logEventPointTelephonyRegistrationAtInit]");
      char v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m"];
      uint64_t v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLBBTelephonyRegMsg logEventPointTelephonyRegistrationAtInit]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:69];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBTelephonyRegMsg *)self setAttrCellID:0];
  [(PLBBTelephonyRegMsg *)self setAttrLac:0];
  uint64_t v10 = [NSNumber numberWithBool:CTRegistrationGetDataAttached() != 0];
  [(PLBBTelephonyRegMsg *)self setAttrDataAttached:v10];

  v11 = [NSNumber numberWithBool:CTRegistrationGetDataContextActive() != 0];
  [(PLBBTelephonyRegMsg *)self setAttrDataActive:v11];

  uint64_t v12 = [(PLBBTelephonyRegMsg *)self humanReadableDataIndicator:CTRegistrationGetDataIndicator()];
  [(PLBBTelephonyRegMsg *)self setAttrDataIndicator:v12];

  [(PLBBTelephonyRegMsg *)self setAttrHomeNetwork:0];
  id v13 = [(PLBBTelephonyRegMsg *)self humanReadableRegistrationStatus:CTRegistrationGetStatus()];
  [(PLBBTelephonyRegMsg *)self setAttrRegistrationStatus:v13];

  uint64_t v14 = (void *)CTRegistrationCopyOperatorName();
  [(PLBBTelephonyRegMsg *)self setAttrOperatorName:v14];
  [(PLBBTelephonyRegMsg *)self setChanged:1];
  int v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"TelephonyRegistration"];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__PLBBTelephonyRegMsg_logEventPointTelephonyRegistrationAtInit__block_invoke_60;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = v17;
    if (qword_1EBD5AA30 != -1) {
      dispatch_once(&qword_1EBD5AA30, v24);
    }
    if (byte_1EBD5AA13)
    {
      v18 = [NSString stringWithFormat:@"Send Telephony Registration msgs at Init"];
      v19 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m"];
      uint64_t v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLBBTelephonyRegMsg logEventPointTelephonyRegistrationAtInit]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:85];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLBBTelephonyRegMsg *)self fillPLEntryAndSend:v16];
}

uint64_t __63__PLBBTelephonyRegMsg_logEventPointTelephonyRegistrationAtInit__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA12 = result;
  return result;
}

uint64_t __63__PLBBTelephonyRegMsg_logEventPointTelephonyRegistrationAtInit__block_invoke_60(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA13 = result;
  return result;
}

uint64_t __57__PLBBTelephonyRegMsg_logEventPointTelephonyRegistration__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA14 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F929C0];
  id v11 = a3;
  if ([v10 debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PLBBTelephonyRegMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1EBD5AA40 != -1) {
      dispatch_once(&qword_1EBD5AA40, block);
    }
    if (byte_1EBD5AA15)
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBTelephonyRegMsg sendAndLogPLEntry:withName:withType:]");
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      int v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m"];
      v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLBBTelephonyRegMsg sendAndLogPLEntry:withName:withType:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:192];

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
    v27[2] = __59__PLBBTelephonyRegMsg_sendAndLogPLEntry_withName_withType___block_invoke_86;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = v19;
    if (qword_1EBD5AA48 != -1) {
      dispatch_once(&qword_1EBD5AA48, v27);
    }
    if (byte_1EBD5AA16)
    {
      uint64_t v20 = [NSString stringWithFormat:@"Sending PLEntry: name=%@ type=%@", v8, v9];
      uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m"];
      v23 = [v22 lastPathComponent];
      v24 = [NSString stringWithUTF8String:"-[PLBBTelephonyRegMsg sendAndLogPLEntry:withName:withType:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:193];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v26 = [(PLBasebandMessage *)self agent];
  [v26 logEntry:v11];
}

uint64_t __59__PLBBTelephonyRegMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA15 = result;
  return result;
}

uint64_t __59__PLBBTelephonyRegMsg_sendAndLogPLEntry_withName_withType___block_invoke_86(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5AA16 = result;
  return result;
}

- (void)setAttrCellID:(id)a3
{
  id v6 = a3;
  v4 = [(PLBBTelephonyRegMsg *)self cellID];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(PLBBTelephonyRegMsg *)self setCellID:v6];
    if ([MEMORY[0x1E4F929C0] fullMode]) {
      [(PLBBTelephonyRegMsg *)self setChanged:1];
    }
  }
}

- (void)setAttrDataAttached:(id)a3
{
  id v6 = a3;
  v4 = [(PLBBTelephonyRegMsg *)self dataAttached];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(PLBBTelephonyRegMsg *)self setDataAttached:v6];
    if ([MEMORY[0x1E4F929C0] fullMode]) {
      [(PLBBTelephonyRegMsg *)self setChanged:1];
    }
  }
}

- (void)setAttrDataActive:(id)a3
{
  id v6 = a3;
  v4 = [(PLBBTelephonyRegMsg *)self dataActive];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(PLBBTelephonyRegMsg *)self setDataActive:v6];
    if ([MEMORY[0x1E4F929C0] fullMode]) {
      [(PLBBTelephonyRegMsg *)self setChanged:1];
    }
  }
}

- (void)setAttrDataIndicator:(id)a3
{
  id v6 = a3;
  v4 = [(PLBBTelephonyRegMsg *)self dataIndicator];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(PLBBTelephonyRegMsg *)self setDataIndicator:v6];
    [(PLBBTelephonyRegMsg *)self setChanged:1];
  }
}

- (void)setAttrHomeNetwork:(id)a3
{
  id v6 = a3;
  v4 = [(PLBBTelephonyRegMsg *)self homeNetwork];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(PLBBTelephonyRegMsg *)self setHomeNetwork:v6];
    if ([MEMORY[0x1E4F929C0] fullMode]) {
      [(PLBBTelephonyRegMsg *)self setChanged:1];
    }
  }
}

- (void)setAttrRegistrationStatus:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    CTRegistrationGetStatus();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = [(PLBBTelephonyRegMsg *)self registrationStatus];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(PLBBTelephonyRegMsg *)self setRegistrationStatus:v6];
    [(PLBBTelephonyRegMsg *)self setChanged:1];
  }
}

- (id)humanReadableRegistrationStatus:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [v3 substringFromIndex:objc_msgSend(@"kCTRegistrationStatus", "length")];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)humanReadableDataIndicator:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [v3 substringFromIndex:objc_msgSend(@"kCTRegistrationDataIndicator", "length")];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSNumber)cellID
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLac:(id)a3
{
}

- (NSNumber)dataAttached
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataAttached:(id)a3
{
}

- (NSNumber)dataActive
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDataActive:(id)a3
{
}

- (NSString)dataIndicator
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDataIndicator:(id)a3
{
}

- (NSNumber)homeNetwork
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setHomeNetwork:(id)a3
{
}

- (NSString)registrationStatus
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setRegistrationStatus:(id)a3
{
}

- (void)setOperatorName:(id)a3
{
}

- (NSDate)timeUpdate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTimeUpdate:(id)a3
{
}

- (void)setChanged:(unsigned __int8)a3
{
  self->_changed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telRegInfo, 0);
  objc_storeStrong((id *)&self->_timeUpdate, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_registrationStatus, 0);
  objc_storeStrong((id *)&self->_homeNetwork, 0);
  objc_storeStrong((id *)&self->_dataIndicator, 0);
  objc_storeStrong((id *)&self->_dataActive, 0);
  objc_storeStrong((id *)&self->_dataAttached, 0);
  objc_storeStrong((id *)&self->_lac, 0);
  objc_storeStrong((id *)&self->_cellID, 0);
}

@end