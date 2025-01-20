@interface PLBBSleepWakeMsg
+ (id)entryEventPointDefinitionSleepWakeActivityIceABM;
+ (id)entryEventPointDefinitionSleepWakeActivityMavABM;
- (NSData)bbWakeDataBin;
- (NSDictionary)bbWakeDataParsed;
- (NSDictionary)swIpData;
- (NSMutableDictionary)commonInfo;
- (NSMutableDictionary)kvPairs;
- (NSNumber)swSvcId;
- (NSString)ariGroupId;
- (NSString)ariLen;
- (NSString)ariMsgId;
- (NSString)ariMsgName;
- (NSString)ariSeqNum;
- (NSString)bbWakeChannel;
- (NSString)bbWakeSubType;
- (NSString)bbWakeType;
- (NSString)qmiClntId;
- (NSString)qmiLen;
- (NSString)qmiMsgId;
- (NSString)qmiMsgType;
- (NSString)qmiSvcType;
- (NSString)swAtCmd;
- (NSString)swCTData;
- (NSString)swChan;
- (NSString)swClientId;
- (NSString)swCmd;
- (NSString)swCmdFullName;
- (NSString)swCmdName;
- (NSString)swMsgId;
- (NSString)swMsgType;
- (NSString)swRadioClass;
- (NSString)swRawData;
- (NSString)swReason;
- (void)logEventPointSleepWakeABM;
- (void)refreshSleepWakeActivity;
- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5;
- (void)setAriGroupId:(id)a3;
- (void)setAriLen:(id)a3;
- (void)setAriMsgId:(id)a3;
- (void)setAriMsgName:(id)a3;
- (void)setAriSeqNum:(id)a3;
- (void)setBbWakeChannel:(id)a3;
- (void)setBbWakeDataBin:(id)a3;
- (void)setBbWakeDataParsed:(id)a3;
- (void)setBbWakeSubType:(id)a3;
- (void)setBbWakeType:(id)a3;
- (void)setCommonInfo:(id)a3;
- (void)setKvPairs:(id)a3;
- (void)setQmiClntId:(id)a3;
- (void)setQmiLen:(id)a3;
- (void)setQmiMsgId:(id)a3;
- (void)setQmiMsgType:(id)a3;
- (void)setQmiSvcType:(id)a3;
- (void)setSwAtCmd:(id)a3;
- (void)setSwCTData:(id)a3;
- (void)setSwChan:(id)a3;
- (void)setSwClientId:(id)a3;
- (void)setSwCmd:(id)a3;
- (void)setSwCmdFullName:(id)a3;
- (void)setSwCmdName:(id)a3;
- (void)setSwIpData:(id)a3;
- (void)setSwMsgId:(id)a3;
- (void)setSwMsgType:(id)a3;
- (void)setSwRadioClass:(id)a3;
- (void)setSwRawData:(id)a3;
- (void)setSwReason:(id)a3;
- (void)setSwSvcId:(id)a3;
@end

@implementation PLBBSleepWakeMsg

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PLBBSleepWakeMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1EBD57CF0 != -1) {
      dispatch_once(&qword_1EBD57CF0, block);
    }
    if (_MergedGlobals_1_16)
    {
      id v28 = v9;
      v12 = [NSString stringWithFormat:@"%s Sending PLEntry: name=%@ type=%@", "-[PLBBSleepWakeMsg sendAndLogPLEntry:withName:withType:]", v9, v10];
      v13 = (void *)MEMORY[0x1E4F929B8];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m"];
      v15 = [v14 lastPathComponent];
      v16 = [NSString stringWithUTF8String:"-[PLBBSleepWakeMsg sendAndLogPLEntry:withName:withType:]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:42];

      v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v28;
    }
  }
  v18 = [(PLBBMsgRoot *)self agent];

  if (!v18 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __56__PLBBSleepWakeMsg_sendAndLogPLEntry_withName_withType___block_invoke_17;
    v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v29[4] = v19;
    if (qword_1EBD57CF8 != -1) {
      dispatch_once(&qword_1EBD57CF8, v29);
    }
    if (byte_1EBD57CE9)
    {
      id v20 = v9;
      v21 = [NSString stringWithFormat:@"Bad agent"];
      v22 = (void *)MEMORY[0x1E4F929B8];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m"];
      v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLBBSleepWakeMsg sendAndLogPLEntry:withName:withType:]"];
      [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:45];

      v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v21;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v9 = v20;
    }
  }
  if (([MEMORY[0x1E4F92A38] isBasebandMav] & 1) != 0
    || [MEMORY[0x1E4F92A38] isBasebandIce])
  {
    v27 = [(PLBBMsgRoot *)self agent];
    [v27 logEntry:v8];
  }
}

uint64_t __56__PLBBSleepWakeMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_16 = result;
  return result;
}

uint64_t __56__PLBBSleepWakeMsg_sendAndLogPLEntry_withName_withType___block_invoke_17(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57CE9 = result;
  return result;
}

+ (id)entryEventPointDefinitionSleepWakeActivityMavABM
{
  v52[2] = *MEMORY[0x1E4F143B8];
  v51[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v49[0] = *MEMORY[0x1E4F92CD0];
  v49[1] = v2;
  v50[0] = &unk_1F29F04E0;
  v50[1] = MEMORY[0x1E4F1CC38];
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  v52[0] = v46;
  v51[1] = *MEMORY[0x1E4F92CA8];
  v47[0] = @"WakeChannel";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v48[0] = v44;
  v47[1] = @"WakeData";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_StringFormat");
  v48[1] = v42;
  v47[2] = @"WakeDataParsed";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_StringFormat");
  v48[2] = v40;
  v47[3] = @"WakeSubType";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v48[3] = v38;
  v47[4] = @"WakeType";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v48[4] = v36;
  v47[5] = @"QmiSvcType";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v48[5] = v34;
  v47[6] = @"QmiClientId";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v48[6] = v32;
  v47[7] = @"QmiMsgId";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v48[7] = v30;
  v47[8] = @"QmiLen";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v48[8] = v28;
  v47[9] = @"IpVer";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v48[9] = v26;
  v47[10] = @"IpProto";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v48[10] = v24;
  v47[11] = @"IpSrc";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_StringFormat");
  v48[11] = v22;
  v47[12] = @"IpDst";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v48[12] = v20;
  v47[13] = @"IpSrcPort";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v48[13] = v18;
  v47[14] = @"IpDstPort";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v48[14] = v16;
  v47[15] = @"PID";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v48[15] = v14;
  v47[16] = @"ProcessName";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withProcessName");
  v48[16] = v4;
  v47[17] = @"IsCmas";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v48[17] = v6;
  v47[18] = @"spi";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v48[18] = v8;
  v47[19] = @"seqNo";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v48[19] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:20];
  v52[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionSleepWakeActivityIceABM
{
  v54[2] = *MEMORY[0x1E4F143B8];
  v53[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v51[0] = *MEMORY[0x1E4F92CD0];
  v51[1] = v2;
  v52[0] = &unk_1F29F04F0;
  v52[1] = MEMORY[0x1E4F1CC38];
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  v54[0] = v48;
  v53[1] = *MEMORY[0x1E4F92CA8];
  v49[0] = @"WakeChannel";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v50[0] = v46;
  v49[1] = @"WakeData";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_StringFormat");
  v50[1] = v44;
  void v49[2] = @"WakeDataParsed";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_StringFormat");
  void v50[2] = v42;
  v49[3] = @"WakeSubType";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v50[3] = v40;
  v49[4] = @"WakeType";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v50[4] = v38;
  v49[5] = @"AriGroupID";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v50[5] = v36;
  v49[6] = @"AriMsgID";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v50[6] = v34;
  v49[7] = @"AriLength";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v50[7] = v32;
  v49[8] = @"AriMsgName";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_StringFormat");
  v50[8] = v30;
  v49[9] = @"AriSeqNum";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v50[9] = v28;
  v49[10] = @"IpVer";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v50[10] = v26;
  v49[11] = @"IpProto";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v50[11] = v24;
  v49[12] = @"IpSrc";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_StringFormat");
  v50[12] = v22;
  v49[13] = @"IpDst";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v50[13] = v20;
  v49[14] = @"IpSrcPort";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v50[14] = v18;
  v49[15] = @"IpDstPort";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v50[15] = v16;
  v49[16] = @"PID";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v50[16] = v14;
  v49[17] = @"ProcessName";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withProcessName");
  v50[17] = v4;
  v49[18] = @"IsCmas";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v50[18] = v6;
  v49[19] = @"spi";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v50[19] = v8;
  v49[20] = @"seqNo";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v50[20] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:21];
  v54[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];

  return v12;
}

- (void)refreshSleepWakeActivity
{
  uint64_t v2 = (void *)MEMORY[0x1D942A350](self, a2);
}

- (void)logEventPointSleepWakeABM
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v143 = "-[PLBBSleepWakeMsg logEventPointSleepWakeABM]";
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLBBSleepWakeMsg_logEventPointSleepWakeABM__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD57D00 != -1) {
      dispatch_once(&qword_1EBD57D00, block);
    }
    if (byte_1EBD57CEA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLBBSleepWakeMsg logEventPointSleepWakeABM]");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m"];
      id v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLBBSleepWakeMsg logEventPointSleepWakeABM]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:197];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v143 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  char v11 = [MEMORY[0x1E4F92A38] isBasebandIce];
  v12 = (uint64_t *)MEMORY[0x1E4F92D48];
  if ((v11 & 1) != 0 || [MEMORY[0x1E4F92A38] isBasebandIBIS])
  {
    uint64_t v13 = *v12;
    v14 = @"SleepWakeActivityIceABM";
  }
  else
  {
    uint64_t v13 = *v12;
    v14 = @"SleepWakeActivityMavABM";
  }
  v15 = +[PLOperator entryKeyForType:v13 andName:v14];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15];
  if (v16)
  {
    v17 = NSNumber;
    v18 = [(PLBBSleepWakeMsg *)self bbWakeChannel];
    uint64_t v19 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "intValue"));
    [v16 setObject:v19 forKeyedSubscript:@"WakeChannel"];

    if ([MEMORY[0x1E4F92A38] isBasebandIce])
    {
      id v20 = &off_1E6928FB8;
    }
    else
    {
      if (![MEMORY[0x1E4F92A38] isBasebandMav]) {
        goto LABEL_25;
      }
      id v20 = off_1E6929028;
    }
    id v28 = [(__objc2_class *)*v20 convertToStringData:self->_bbWakeDataBin];
    [v16 setObject:v28 forKeyedSubscript:@"WakeData"];

LABEL_25:
    if ([MEMORY[0x1E4F929C0] fullMode])
    {
      v29 = [(PLBBSleepWakeMsg *)self bbWakeDataParsed];
      [v16 setObject:v29 forKeyedSubscript:@"WakeDataParsed"];
    }
    v30 = [(PLBBSleepWakeMsg *)self bbWakeType];
    int v31 = [v30 isEqualToString:@"DATA"];

    unint64_t v32 = 0x1EBD52000uLL;
    if (v31)
    {
      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "BB Agent: Wake Type - Data", buf, 2u);
      }

      [v16 setObject:&unk_1F29E4FA8 forKeyedSubscript:@"WakeType"];
      v34 = (void *)MEMORY[0x1E4F92A30];
      v35 = [(PLBBSleepWakeMsg *)self bbWakeDataBin];
      v36 = [v34 decodeIPPacket:v35 encryptedPath:0];

      v37 = [v36 objectForKey:@"protocol_info"];
      v38 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v39 = [v38 isEqualToString:@"IP"];

      if (!v39)
      {
        [v16 setObject:&unk_1F29E5008 forKeyedSubscript:@"WakeSubType"];
LABEL_77:

        unint64_t v32 = 0x1EBD52000;
        goto LABEL_101;
      }
      v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        bbWakeDataParsed = self->_bbWakeDataParsed;
        *(_DWORD *)buf = 138412290;
        v143 = (const char *)bbWakeDataParsed;
        _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "BB Agent: Wake Sub Type - IP Wake %@", buf, 0xCu);
      }

      [v16 setObject:&unk_1F29E4FC0 forKeyedSubscript:@"WakeSubType"];
      v41 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyIPVersion"];
      char v42 = [v41 isEqualToString:@"IPv4"];

      if (v42)
      {
        v43 = &unk_1F29E4FD8;
      }
      else
      {
        v60 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyIPVersion"];
        int v61 = [v60 isEqualToString:@"IPv6"];

        if (v61) {
          v43 = &unk_1F29E4FF0;
        }
        else {
          v43 = &unk_1F29E5008;
        }
      }
      [v16 setObject:v43 forKeyedSubscript:@"IpVer"];
      v62 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyIPProtocol"];
      int v63 = [v62 isEqualToString:@"TCP"];

      uint64_t v138 = v13;
      v139 = v15;
      v137 = v37;
      if (v63)
      {
        v64 = &unk_1F29E5020;
      }
      else
      {
        v75 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyIPProtocol"];
        int v76 = [v75 isEqualToString:@"UDP"];

        if (!v76)
        {
          v82 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyIPProtocol"];
          int v83 = [v82 isEqualToString:@"ICMP"];

          if (v83) {
            v84 = &unk_1F29E5038;
          }
          else {
            v84 = &unk_1F29E5008;
          }
          [v16 setObject:v84 forKeyedSubscript:@"IpProto"];
          goto LABEL_67;
        }
        v64 = &unk_1F29E4FA8;
      }
      [v16 setObject:v64 forKeyedSubscript:@"IpProto"];
      v77 = [v37 objectForKey:@"source_port"];
      [v16 setObject:v77 forKeyedSubscript:@"IpSrcPort"];

      v78 = [v37 objectForKey:@"dest_port"];
      [v16 setObject:v78 forKeyedSubscript:@"IpDstPort"];

LABEL_67:
      v87 = [v36 objectForKeyedSubscript:@"source"];
      [v16 setObject:v87 forKeyedSubscript:@"IpSrc"];

      v88 = [v36 objectForKeyedSubscript:@"destination"];
      [v16 setObject:v88 forKeyedSubscript:@"IpDst"];

      v89 = NSNumber;
      v90 = [v36 objectForKeyedSubscript:@"seqNo"];
      v91 = objc_msgSend(v89, "numberWithUnsignedInt:", objc_msgSend(v90, "unsignedIntValue"));
      [v16 setObject:v91 forKeyedSubscript:@"seqNo"];

      v92 = NSNumber;
      v93 = [v36 objectForKeyedSubscript:@"spi"];
      v94 = objc_msgSend(v92, "numberWithUnsignedInt:", objc_msgSend(v93, "unsignedIntValue"));
      [v16 setObject:v94 forKeyedSubscript:@"spi"];

      v95 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyIPProtocol"];
      v96 = +[PLProcessPortMap sharedInstance];
      v97 = [v36 objectForKeyedSubscript:@"destination"];
      v98 = [v16 objectForKeyedSubscript:@"IpDstPort"];
      v99 = [v36 objectForKeyedSubscript:@"source"];
      v100 = [v16 objectForKeyedSubscript:@"IpSrcPort"];
      v101 = [v96 pidAndProcessNameForDestAddress:v97 withDestPort:v98 withSourceAddress:v99 withSourcePort:v100 withProtocol:v95];

      uint64_t v13 = v138;
      v15 = v139;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v102 = objc_opt_class();
        v140[0] = MEMORY[0x1E4F143A8];
        v140[1] = 3221225472;
        v140[2] = __45__PLBBSleepWakeMsg_logEventPointSleepWakeABM__block_invoke_185;
        v140[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v140[4] = v102;
        if (qword_1EBD57D08 != -1) {
          dispatch_once(&qword_1EBD57D08, v140);
        }
        if (byte_1EBD57CEB)
        {
          [NSString stringWithFormat:@"pidAndProcessName=%@", v101];
          v103 = (char *)objc_claimAutoreleasedReturnValue();
          v104 = (void *)MEMORY[0x1E4F929B8];
          v105 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m"];
          v106 = [v105 lastPathComponent];
          v107 = [NSString stringWithUTF8String:"-[PLBBSleepWakeMsg logEventPointSleepWakeABM]"];
          [v104 logMessage:v103 fromFile:v106 fromFunction:v107 fromLineNumber:306];

          v108 = PLLogCommon();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v143 = v103;
            _os_log_debug_impl(&dword_1D2690000, v108, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v13 = v138;
          v15 = v139;
        }
      }
      if (v101)
      {
        v109 = [v101 pid];
        [v16 setObject:v109 forKeyedSubscript:@"PID"];

        v110 = [v101 processName];
        [v16 setObject:v110 forKeyedSubscript:@"ProcessName"];
      }
      [v16 setObject:0 forKeyedSubscript:@"WakeData"];
      [v16 setObject:0 forKeyedSubscript:@"WakeDataParsed"];

      v37 = v137;
      goto LABEL_77;
    }
    v44 = [(PLBBSleepWakeMsg *)self bbWakeType];
    int v45 = [v44 isEqualToString:@"CONTROL"];

    if (v45)
    {
      v46 = PLLogCommon();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "BB Agent: Wake Type - Control", buf, 2u);
      }

      [v16 setObject:&unk_1F29E5050 forKeyedSubscript:@"WakeType"];
      v47 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v48 = [v47 isEqualToString:@"ARI"];

      if (v48)
      {
        [v16 setObject:&unk_1F29E5020 forKeyedSubscript:@"WakeSubType"];
        v49 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyARIGroupID"];
        [v16 setObject:v49 forKeyedSubscript:@"AriGroupID"];

        v50 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyARIMsgID"];
        [v16 setObject:v50 forKeyedSubscript:@"AriMsgID"];

        v51 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyARILength"];
        [v16 setObject:v51 forKeyedSubscript:@"AriLength"];

        v52 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyARIMsgName"];
        [v16 setObject:v52 forKeyedSubscript:@"AriMsgName"];

        v53 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyARISeqNumber"];
        v54 = @"AriSeqNum";
LABEL_51:
        [v16 setObject:v53 forKeyedSubscript:v54];

LABEL_101:
        uint64_t v134 = *(int *)(v32 + 2692);
        v135 = [*(id *)((char *)&self->super.super.isa + v134) objectForKeyedSubscript:@"kKeyBasebandWakeFromCMAS"];

        if (v135)
        {
          v136 = [*(id *)((char *)&self->super.super.isa + v134) objectForKeyedSubscript:@"kKeyBasebandWakeFromCMAS"];
          [v16 setObject:v136 forKeyedSubscript:@"IsCmas"];
        }
        else
        {
          [v16 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"IsCmas"];
        }
        [(PLBBSleepWakeMsg *)self sendAndLogPLEntry:v16 withName:@"SleepWakeActivityABM" withType:v13];
        goto LABEL_105;
      }
      v65 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v66 = [v65 isEqualToString:@"QMI"];

      if (v66)
      {
        [v16 setObject:&unk_1F29E5050 forKeyedSubscript:@"WakeSubType"];
        v67 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyQMIServiceType"];
        [v16 setObject:v67 forKeyedSubscript:@"QmiSvcType"];

        v68 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyQMIClientID"];
        [v16 setObject:v68 forKeyedSubscript:@"QmiClientId"];

        v69 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyQMIMsgID"];
        [v16 setObject:v69 forKeyedSubscript:@"QmiMsgId"];

        v70 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyQMIMsgType"];
        [v16 setObject:v70 forKeyedSubscript:@"QmiMsgType"];

        v53 = [(NSDictionary *)self->_bbWakeDataParsed objectForKeyedSubscript:@"kKeyQMILength"];
        v54 = @"QmiLen";
        goto LABEL_51;
      }
      goto LABEL_98;
    }
    v55 = [(PLBBSleepWakeMsg *)self bbWakeType];
    int v56 = [v55 isEqualToString:@"TRACE"];

    if (v56)
    {
      [v16 setObject:&unk_1F29E5020 forKeyedSubscript:@"WakeType"];
      v57 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v58 = [v57 isEqualToString:@"DIAG"];

      if (v58) {
        goto LABEL_43;
      }
      v79 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v80 = [v79 isEqualToString:@"STT"];

      if (v80) {
        goto LABEL_59;
      }
    }
    else
    {
      v71 = [(PLBBSleepWakeMsg *)self bbWakeType];
      int v72 = [v71 isEqualToString:@"OTHER"];

      if (!v72)
      {
        v59 = &unk_1F29E5008;
        v81 = @"WakeType";
LABEL_100:
        [v16 setObject:v59 forKeyedSubscript:v81];
        goto LABEL_101;
      }
      [v16 setObject:&unk_1F29E5038 forKeyedSubscript:@"WakeType"];
      v73 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v74 = [v73 isEqualToString:@"QMI"];

      if (v74)
      {
        v59 = &unk_1F29E5050;
        goto LABEL_99;
      }
      v85 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v86 = [v85 isEqualToString:@"ARI"];

      if (v86)
      {
        v59 = &unk_1F29E5020;
        goto LABEL_99;
      }
      v111 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v112 = [v111 isEqualToString:@"CMAS"];

      if (v112)
      {
        v59 = &unk_1F29E4FA8;
        goto LABEL_99;
      }
      v114 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v115 = [v114 isEqualToString:@"PAGING"];

      if (v115)
      {
        v59 = &unk_1F29E5038;
        goto LABEL_99;
      }
      v116 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v117 = [v116 isEqualToString:@"SERIAL"];

      if (v117)
      {
        v59 = &unk_1F29E4FD8;
        goto LABEL_99;
      }
      v118 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v119 = [v118 isEqualToString:@"HSIC"];

      if (v119)
      {
        v59 = &unk_1F29E5098;
        goto LABEL_99;
      }
      v120 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v121 = [v120 isEqualToString:@"PCI"];

      if (v121)
      {
        v59 = &unk_1F29E4FF0;
        goto LABEL_99;
      }
      v122 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v123 = [v122 isEqualToString:@"DIAG"];

      if (v123)
      {
LABEL_43:
        v59 = &unk_1F29E5068;
LABEL_99:
        v81 = @"WakeSubType";
        goto LABEL_100;
      }
      v124 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v125 = [v124 isEqualToString:@"STT"];

      if (v125)
      {
LABEL_59:
        v59 = &unk_1F29E5080;
        goto LABEL_99;
      }
      v126 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v127 = [v126 isEqualToString:@"UART"];

      if (v127)
      {
        v59 = &unk_1F29E50B0;
        goto LABEL_99;
      }
      v128 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v129 = [v128 isEqualToString:@"QMAP"];

      if (v129)
      {
        v59 = &unk_1F29E50C8;
        goto LABEL_99;
      }
      v130 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v131 = [v130 isEqualToString:@"ADAM"];

      if (v131)
      {
        v59 = &unk_1F29E50E0;
        goto LABEL_99;
      }
      v132 = [(PLBBSleepWakeMsg *)self bbWakeSubType];
      int v133 = [v132 isEqualToString:@"IP"];

      if (v133)
      {
        v59 = &unk_1F29E4FC0;
        goto LABEL_99;
      }
    }
LABEL_98:
    v59 = &unk_1F29E5008;
    goto LABEL_99;
  }
  v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "BB Agent: Unable to allocate wake entry", buf, 2u);
  }

  v22 = [NSString stringWithFormat:@"*** Error *** unable to allocate PLEntry"];
  v23 = (void *)MEMORY[0x1E4F929B8];
  v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m"];
  v25 = [v24 lastPathComponent];
  v26 = [NSString stringWithUTF8String:"-[PLBBSleepWakeMsg logEventPointSleepWakeABM]"];
  [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:219];

  v27 = PLLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v143 = v22;
    _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_105:
}

uint64_t __45__PLBBSleepWakeMsg_logEventPointSleepWakeABM__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57CEA = result;
  return result;
}

uint64_t __45__PLBBSleepWakeMsg_logEventPointSleepWakeABM__block_invoke_185(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57CEB = result;
  return result;
}

- (NSString)swReason
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSwReason:(id)a3
{
}

- (NSString)bbWakeChannel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbWakeChannel:(id)a3
{
}

- (NSString)bbWakeType
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBbWakeType:(id)a3
{
}

- (NSString)bbWakeSubType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBbWakeSubType:(id)a3
{
}

- (NSData)bbWakeDataBin
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBbWakeDataBin:(id)a3
{
}

- (NSDictionary)bbWakeDataParsed
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBbWakeDataParsed:(id)a3
{
}

- (NSString)qmiSvcType
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setQmiSvcType:(id)a3
{
}

- (NSString)qmiClntId
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setQmiClntId:(id)a3
{
}

- (NSString)qmiMsgId
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQmiMsgId:(id)a3
{
}

- (NSString)qmiMsgType
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setQmiMsgType:(id)a3
{
}

- (NSString)qmiLen
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setQmiLen:(id)a3
{
}

- (NSString)ariGroupId
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAriGroupId:(id)a3
{
}

- (NSString)ariMsgId
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAriMsgId:(id)a3
{
}

- (NSString)ariMsgName
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAriMsgName:(id)a3
{
}

- (NSString)ariLen
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAriLen:(id)a3
{
}

- (NSString)ariSeqNum
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAriSeqNum:(id)a3
{
}

- (NSString)swAtCmd
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSwAtCmd:(id)a3
{
}

- (NSString)swRawData
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSwRawData:(id)a3
{
}

- (NSNumber)swSvcId
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSwSvcId:(id)a3
{
}

- (NSString)swClientId
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSwClientId:(id)a3
{
}

- (NSString)swMsgId
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSwMsgId:(id)a3
{
}

- (NSString)swMsgType
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSwMsgType:(id)a3
{
}

- (NSString)swCmdName
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSwCmdName:(id)a3
{
}

- (NSString)swCmdFullName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSwCmdFullName:(id)a3
{
}

- (NSDictionary)swIpData
{
  return (NSDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSwIpData:(id)a3
{
}

- (NSString)swRadioClass
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSwRadioClass:(id)a3
{
}

- (NSString)swCTData
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSwCTData:(id)a3
{
}

- (NSString)swChan
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setSwChan:(id)a3
{
}

- (NSString)swCmd
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSwCmd:(id)a3
{
}

- (NSMutableDictionary)commonInfo
{
  return self->_commonInfo;
}

- (void)setCommonInfo:(id)a3
{
}

- (NSMutableDictionary)kvPairs
{
  return self->_kvPairs;
}

- (void)setKvPairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvPairs, 0);
  objc_storeStrong((id *)&self->_commonInfo, 0);
  objc_storeStrong((id *)&self->_swCmd, 0);
  objc_storeStrong((id *)&self->_swChan, 0);
  objc_storeStrong((id *)&self->_swCTData, 0);
  objc_storeStrong((id *)&self->_swRadioClass, 0);
  objc_storeStrong((id *)&self->_swIpData, 0);
  objc_storeStrong((id *)&self->_swCmdFullName, 0);
  objc_storeStrong((id *)&self->_swCmdName, 0);
  objc_storeStrong((id *)&self->_swMsgType, 0);
  objc_storeStrong((id *)&self->_swMsgId, 0);
  objc_storeStrong((id *)&self->_swClientId, 0);
  objc_storeStrong((id *)&self->_swSvcId, 0);
  objc_storeStrong((id *)&self->_swRawData, 0);
  objc_storeStrong((id *)&self->_swAtCmd, 0);
  objc_storeStrong((id *)&self->_ariSeqNum, 0);
  objc_storeStrong((id *)&self->_ariLen, 0);
  objc_storeStrong((id *)&self->_ariMsgName, 0);
  objc_storeStrong((id *)&self->_ariMsgId, 0);
  objc_storeStrong((id *)&self->_ariGroupId, 0);
  objc_storeStrong((id *)&self->_qmiLen, 0);
  objc_storeStrong((id *)&self->_qmiMsgType, 0);
  objc_storeStrong((id *)&self->_qmiMsgId, 0);
  objc_storeStrong((id *)&self->_qmiClntId, 0);
  objc_storeStrong((id *)&self->_qmiSvcType, 0);
  objc_storeStrong((id *)&self->_bbWakeDataParsed, 0);
  objc_storeStrong((id *)&self->_bbWakeDataBin, 0);
  objc_storeStrong((id *)&self->_bbWakeSubType, 0);
  objc_storeStrong((id *)&self->_bbWakeType, 0);
  objc_storeStrong((id *)&self->_bbWakeChannel, 0);
  objc_storeStrong((id *)&self->_swReason, 0);
}

@end