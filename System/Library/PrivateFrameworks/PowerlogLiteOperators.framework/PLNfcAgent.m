@interface PLNfcAgent
+ (id)defaults;
+ (id)entryEventForwardDefinitionCard;
+ (id)entryEventForwardDefinitionField;
+ (id)entryEventForwardDefinitionLPEM;
+ (id)entryEventForwardDefinitionTSMCommunication;
+ (id)entryEventForwardDefinitionTransaction;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionAccessoryPower;
+ (id)entryEventIntervalDefinitionPower;
+ (id)entryEventIntervalDefinitions;
+ (id)parseLPEMFromData:(id)a3;
+ (void)load;
- (NSDate)lastAccessoryPowerCountersLogTime;
- (NSDate)lastPowerCountersLogTime;
- (PLEntryNotificationOperatorComposition)nfcAccessoryPowerCounterNotification;
- (PLEntryNotificationOperatorComposition)nfcPowerCountersNotification;
- (PLNfcAgent)init;
- (PLTimer)nfcConnectionRetryTimer;
- (PLXPCListenerOperatorComposition)cardNotification;
- (PLXPCListenerOperatorComposition)fieldNotification;
- (PLXPCListenerOperatorComposition)transactionNotification;
- (PLXPCListenerOperatorComposition)tsmCommunicationNotification;
- (double)onPower;
- (int)nfcConnectionRetryCount;
- (unsigned)getNFCHarwareState;
- (void)fieldChangedWithEntry:(id)a3;
- (void)initOperatorDependancies;
- (void)initTaskOperatorDependancies;
- (void)logEventForwardLPEM;
- (void)retrieveAndLogNfcAccessoryPowerCountersWithRetry:(BOOL)a3;
- (void)retrieveAndLogNfcPowerCountersWithRetry:(BOOL)a3;
- (void)setCardNotification:(id)a3;
- (void)setFieldNotification:(id)a3;
- (void)setLastAccessoryPowerCountersLogTime:(id)a3;
- (void)setLastPowerCountersLogTime:(id)a3;
- (void)setNfcAccessoryPowerCounterNotification:(id)a3;
- (void)setNfcConnectionRetryCount:(int)a3;
- (void)setNfcConnectionRetryTimer:(id)a3;
- (void)setNfcPowerCountersNotification:(id)a3;
- (void)setOnPower:(double)a3;
- (void)setTransactionNotification:(id)a3;
- (void)setTsmCommunicationNotification:(id)a3;
- (void)setUpNfcPowerCounterRetrieval;
- (void)setupLPEMCounter;
- (void)setupNfcAccessoryPowerCounterRetrieval;
@end

@implementation PLNfcAgent

void __38__PLNfcAgent_initOperatorDependancies__block_invoke_171(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F929C0];
  id v7 = a5;
  if ([v6 debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_172;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD59FC0 != -1) {
      dispatch_once(&qword_1EBD59FC0, block);
    }
    if (byte_1EBD59FA1)
    {
      v9 = [NSString stringWithFormat:@"PLNfcAgent::fieldNotification fired"];
      v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLNfcAgent initOperatorDependancies]_block_invoke"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:292];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Field"];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withRawData:v7];

  [*(id *)(a1 + 32) fieldChangedWithEntry:v16];
  [*(id *)(a1 + 32) logEntry:v16];
}

- (void)fieldChangedWithEntry:(id)a3
{
  id v10 = a3;
  v4 = [v10 objectForKeyedSubscript:@"State"];
  int v5 = [v4 BOOLValue];

  v6 = [MEMORY[0x1E4F92900] sharedInstance];
  double v7 = 0.0;
  if (v5)
  {
    [(PLNfcAgent *)self onPower];
    double v7 = v8;
  }
  v9 = [v10 entryDate];
  [v6 createPowerEventForwardWithRootNodeID:16 withPower:v9 withStartDate:v7];

  [(PLOperator *)self logEntry:v10];
}

- (double)onPower
{
  return self->_onPower;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLNfcAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"Card";
  v3 = [a1 entryEventForwardDefinitionCard];
  v11[0] = v3;
  v10[1] = @"Field";
  v4 = [a1 entryEventForwardDefinitionField];
  v11[1] = v4;
  v10[2] = @"Transaction";
  int v5 = [a1 entryEventForwardDefinitionTransaction];
  v11[2] = v5;
  v10[3] = @"TSMCommunication";
  v6 = [a1 entryEventForwardDefinitionTSMCommunication];
  v11[3] = v6;
  v10[4] = @"LPEM";
  double v7 = [a1 entryEventForwardDefinitionLPEM];
  v11[4] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

+ (id)entryEventForwardDefinitionCard
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F0F10;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  double v8 = @"AuthorizedStatus";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionField
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0F10;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"State";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  uint64_t v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionTransaction
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F0F10;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  double v8 = @"Status";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionTSMCommunication
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F0F10;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  double v8 = @"Status";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionLPEM
{
  v32[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasLPEM])
  {
    v31[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CE8];
    v29[0] = *MEMORY[0x1E4F92CD0];
    v29[1] = v2;
    v30[0] = &unk_1F29F0F10;
    v30[1] = MEMORY[0x1E4F1CC38];
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    v32[0] = v26;
    v31[1] = *MEMORY[0x1E4F92CA8];
    v27[0] = @"BTCC";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v28[0] = v24;
    v27[1] = @"BTCT";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v28[1] = v22;
    v27[2] = @"SRSC";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v28[2] = v20;
    v27[3] = @"SRST";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v28[3] = v18;
    v27[4] = @"SRUC";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v28[4] = v16;
    v27[5] = @"SRLC";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v28[5] = v14;
    v27[6] = @"SERESET";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v28[6] = v4;
    v27[7] = @"ROLL";
    int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v28[7] = v6;
    v27[8] = @"BTENTRY";
    double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v28[8] = v8;
    v27[9] = @"BTEXIT";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v28[9] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:10];
    v32[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Power";
  uint64_t v2 = +[PLNfcAgent entryEventIntervalDefinitionPower];
  v6[1] = @"AccessoryPower";
  v7[0] = v2;
  v3 = +[PLNfcAgent entryEventIntervalDefinitionAccessoryPower];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventIntervalDefinitionPower
{
  v36[2] = *MEMORY[0x1E4F143B8];
  v35[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v33[0] = *MEMORY[0x1E4F92CD0];
  v33[1] = v2;
  v34[0] = &unk_1F29F0F20;
  v34[1] = MEMORY[0x1E4F1CC38];
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v36[0] = v30;
  v35[1] = *MEMORY[0x1E4F92CA8];
  v31[0] = @"idleTime";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v32[0] = v28;
  v31[1] = @"rfTime";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v32[1] = v26;
  void v31[2] = @"sleepTime";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v32[2] = v24;
  v31[3] = @"SEUptime";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v32[3] = v22;
  v31[4] = @"lpcdFalseDetectCount";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  void v32[4] = v20;
  v31[5] = @"falseDetect";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v32[5] = v18;
  v31[6] = @"timestampEnd";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_DateFormat");
  v32[6] = v16;
  v31[7] = @"expressUpTime";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v32[7] = v14;
  v31[8] = @"fieldDetectUpTime";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v32[8] = v4;
  v31[9] = @"uiccUpCounter";
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v32[9] = v6;
  v31[10] = @"jcopUpCounter";
  double v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v32[10] = v8;
  v31[11] = @"mboxStatus";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v32[11] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
  v36[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitionAccessoryPower
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasCapability:7])
  {
    v28[0] = *MEMORY[0x1E4F92C50];
    uint64_t v26 = *MEMORY[0x1E4F92CD0];
    v27 = &unk_1F29F0F10;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v29[0] = v23;
    v28[1] = *MEMORY[0x1E4F92CA8];
    v24[0] = @"idleTime";
    v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v25[0] = v21;
    v24[1] = @"rfTime";
    uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v25[1] = v19;
    v24[2] = @"sleepTime";
    v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v25[2] = v17;
    v24[3] = @"SEUptime";
    v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v25[3] = v15;
    v24[4] = @"lpcdFalseDetectCount";
    v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v25[4] = v13;
    v24[5] = @"falseDetect";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v25[5] = v3;
    v24[6] = @"vGpioFalseDetectCount";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v25[6] = v5;
    v24[7] = @"vGpioFalseDetectCountWithTags";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v25[7] = v7;
    v24[8] = @"timestampEnd";
    double v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_DateFormat");
    v25[8] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
    v29[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

- (PLNfcAgent)init
{
  if ([MEMORY[0x1E4F92A38] hasNFC])
  {
    v5.receiver = self;
    v5.super_class = (Class)PLNfcAgent;
    self = [(PLAgent *)&v5 init];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if ([(PLOperator *)self isDebugEnabled])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)logFieldChangedNotificationReceived, @"com.apple.powerlogd.PLNfcAgent.logFieldChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v4 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"nfc"];
  objc_super v5 = [v4 objectForKeyedSubscript:@"field"];
  [v5 doubleValue];
  -[PLNfcAgent setOnPower:](self, "setOnPower:");

  id v6 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke;
  v17[3] = &unk_1E692A6F8;
  v17[4] = self;
  double v7 = (void *)[v6 initWithOperator:self withRegistration:&unk_1F29EAB48 withBlock:v17];
  [(PLNfcAgent *)self setCardNotification:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_171;
  v16[3] = &unk_1E692A6F8;
  v16[4] = self;
  v9 = (void *)[v8 initWithOperator:self withRegistration:&unk_1F29EAB70 withBlock:v16];
  [(PLNfcAgent *)self setFieldNotification:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_180;
  v15[3] = &unk_1E692A6F8;
  v15[4] = self;
  v11 = (void *)[v10 initWithOperator:self withRegistration:&unk_1F29EAB98 withBlock:v15];
  [(PLNfcAgent *)self setTransactionNotification:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_189;
  void v14[3] = &unk_1E692A6F8;
  v14[4] = self;
  v13 = (void *)[v12 initWithOperator:self withRegistration:&unk_1F29EABC0 withBlock:v14];
  [(PLNfcAgent *)self setTsmCommunicationNotification:v13];

  [(PLNfcAgent *)self setupNfcAccessoryPowerCounterRetrieval];
}

void __38__PLNfcAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F929C0];
  id v7 = a5;
  if ([v6 debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD59FB8 != -1) {
      dispatch_once(&qword_1EBD59FB8, block);
    }
    if (_MergedGlobals_1_48)
    {
      v9 = [NSString stringWithFormat:@"PLNfcAgent::cardNotification fired"];
      id v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
      id v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLNfcAgent initOperatorDependancies]_block_invoke"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:284];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Card"];
  v16 = *(void **)(a1 + 32);
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withRawData:v7];

  [v16 logEntry:v17];
}

uint64_t __38__PLNfcAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_48 = result;
  return result;
}

uint64_t __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_172(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA1 = result;
  return result;
}

void __38__PLNfcAgent_initOperatorDependancies__block_invoke_180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F929C0];
  id v7 = a5;
  if ([v6 debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_181;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD59FC8 != -1) {
      dispatch_once(&qword_1EBD59FC8, block);
    }
    if (byte_1EBD59FA2)
    {
      v9 = [NSString stringWithFormat:@"PLNfcAgent::transactionNotification fired"];
      id v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
      id v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLNfcAgent initOperatorDependancies]_block_invoke"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:304];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Transaction"];
  v16 = *(void **)(a1 + 32);
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withRawData:v7];

  [v16 logEntry:v17];
}

uint64_t __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_181(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA2 = result;
  return result;
}

void __38__PLNfcAgent_initOperatorDependancies__block_invoke_189(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F929C0];
  id v7 = a5;
  if ([v6 debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_190;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD59FD0 != -1) {
      dispatch_once(&qword_1EBD59FD0, block);
    }
    if (byte_1EBD59FA3)
    {
      v9 = [NSString stringWithFormat:@"PLNfcAgent::tsmCommunicationNotification fired"];
      id v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
      id v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLNfcAgent initOperatorDependancies]_block_invoke"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:312];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"TSMCommunication"];
  v16 = *(void **)(a1 + 32);
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withRawData:v7];

  [v16 logEntry:v17];
}

uint64_t __38__PLNfcAgent_initOperatorDependancies__block_invoke_2_190(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA3 = result;
  return result;
}

- (void)setupLPEMCounter
{
  if ([MEMORY[0x1E4F92A38] hasLPEM])
  {
    self->_nfcConnectionRetryCount = 0;
    id v3 = objc_alloc(MEMORY[0x1E4F92A80]);
    v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
    objc_super v5 = [(PLOperator *)self workQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__PLNfcAgent_setupLPEMCounter__block_invoke;
    v8[3] = &unk_1E692A200;
    v8[4] = self;
    id v6 = (PLTimer *)[v3 initWithFireDate:v4 withInterval:1 withTolerance:0 repeats:v5 withUserInfo:v8 withQueue:300.0 withBlock:0.0];
    nfcConnectionRetryTimer = self->_nfcConnectionRetryTimer;
    self->_nfcConnectionRetryTimer = v6;
  }
}

uint64_t __30__PLNfcAgent_setupLPEMCounter__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) getNFCHarwareState];
  if (result != 4)
  {
    if (result != 2)
    {
      ++*(_DWORD *)(*(void *)(a1 + 32) + 48);
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(int *)(v3 + 48) <= 4) {
        return result;
      }
      goto LABEL_6;
    }
    [*(id *)(a1 + 32) logEventForwardLPEM];
  }
  uint64_t v3 = *(void *)(a1 + 32);
LABEL_6:
  v4 = *(void **)(v3 + 128);
  return [v4 invalidate];
}

- (void)initTaskOperatorDependancies
{
  [(PLNfcAgent *)self setupLPEMCounter];
  [(PLNfcAgent *)self setUpNfcPowerCounterRetrieval];
}

- (void)setUpNfcPowerCounterRetrieval
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F7A090] sharedHardwareManager];
  id v38 = 0;
  int v4 = [v3 queryHardwareSupport:&v38];
  id v5 = v38;

  if (v4 != 4)
  {
    v13 = [MEMORY[0x1E4F7A090] sharedHardwareManager];
    id v36 = v5;
    id v7 = [v13 getPowerCounters:&v36];
    id v14 = v36;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      void v35[2] = __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_203;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v15;
      if (qword_1EBD59FE0 != -1) {
        dispatch_once(&qword_1EBD59FE0, v35);
      }
      if (byte_1EBD59FA5)
      {
        v16 = [NSString stringWithFormat:@"Initial NFC power counters: %@, error: %@", v7, v14];
        v17 = (void *)MEMORY[0x1E4F929B8];
        v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        v19 = [v18 lastPathComponent];
        uint64_t v20 = [NSString stringWithUTF8String:"-[PLNfcAgent setUpNfcPowerCounterRetrieval]"];
        [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:366];

        uint64_t v21 = PLLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v16;
          _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v22 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLNfcAgent *)self setLastPowerCountersLogTime:v22];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v23 = objc_opt_class();
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      void v34[2] = __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_209;
      v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v34[4] = v23;
      if (qword_1EBD59FE8 != -1) {
        dispatch_once(&qword_1EBD59FE8, v34);
      }
      if (byte_1EBD59FA6)
      {
        v24 = NSString;
        v25 = [(PLNfcAgent *)self lastPowerCountersLogTime];
        uint64_t v26 = [v24 stringWithFormat:@"NFC power logging start time: %@", v25];

        v27 = (void *)MEMORY[0x1E4F929B8];
        v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        v29 = [v28 lastPathComponent];
        v30 = [NSString stringWithUTF8String:"-[PLNfcAgent setUpNfcPowerCounterRetrieval]"];
        [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:369];

        v31 = PLLogCommon();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v26;
          _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    void v33[2] = __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_214;
    v33[3] = &unk_1E692A0F0;
    v33[4] = self;
    v32 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v33];
    [(PLNfcAgent *)self setNfcPowerCountersNotification:v32];

    id v5 = v14;
    goto LABEL_24;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD59FD8 != -1) {
      dispatch_once(&qword_1EBD59FD8, block);
    }
    if (byte_1EBD59FA4)
    {
      id v7 = [NSString stringWithFormat:@"Initial check: NF hardware not supported, error message: %@", v5];
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
      id v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLNfcAgent setUpNfcPowerCounterRetrieval]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:360];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_24:
    }
  }
}

uint64_t __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA4 = result;
  return result;
}

uint64_t __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_203(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA5 = result;
  return result;
}

uint64_t __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_209(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA6 = result;
  return result;
}

uint64_t __43__PLNfcAgent_setUpNfcPowerCounterRetrieval__block_invoke_214(uint64_t a1)
{
  return [*(id *)(a1 + 32) retrieveAndLogNfcPowerCountersWithRetry:1];
}

- (void)setupNfcAccessoryPowerCounterRetrieval
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasCapability:7])
  {
    uint64_t v3 = [MEMORY[0x1E4F7A0B0] sharedHardwareManager];
    id v27 = 0;
    int v4 = [v3 getPowerCounters:&v27];
    id v5 = v27;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (qword_1EBD59FF0 != -1) {
        dispatch_once(&qword_1EBD59FF0, block);
      }
      if (byte_1EBD59FA7)
      {
        id v7 = [NSString stringWithFormat:@"Initial NFC accessory power counters: %@, error: %@", v4, v5];
        uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
        v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        id v10 = [v9 lastPathComponent];
        v11 = [NSString stringWithUTF8String:"-[PLNfcAgent setupNfcAccessoryPowerCounterRetrieval]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:385];

        id v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v7;
          _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (!v5)
    {
      v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [(PLNfcAgent *)self setLastAccessoryPowerCountersLogTime:v13];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v14 = objc_opt_class();
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke_222;
        v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v25[4] = v14;
        if (qword_1EBD59FF8 != -1) {
          dispatch_once(&qword_1EBD59FF8, v25);
        }
        if (byte_1EBD59FA8)
        {
          uint64_t v15 = NSString;
          v16 = [(PLNfcAgent *)self lastAccessoryPowerCountersLogTime];
          v17 = [v15 stringWithFormat:@"NFC accessory power logging start time: %@", v16];

          v18 = (void *)MEMORY[0x1E4F929B8];
          v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
          uint64_t v20 = [v19 lastPathComponent];
          uint64_t v21 = [NSString stringWithUTF8String:"-[PLNfcAgent setupNfcAccessoryPowerCounterRetrieval]"];
          [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:392];

          v22 = PLLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v17;
            _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke_226;
      v24[3] = &unk_1E692A0F0;
      v24[4] = self;
      uint64_t v23 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v24];
      [(PLNfcAgent *)self setNfcAccessoryPowerCounterNotification:v23];
    }
  }
}

uint64_t __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA7 = result;
  return result;
}

uint64_t __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke_222(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA8 = result;
  return result;
}

uint64_t __52__PLNfcAgent_setupNfcAccessoryPowerCounterRetrieval__block_invoke_226(uint64_t a1)
{
  return [*(id *)(a1 + 32) retrieveAndLogNfcAccessoryPowerCountersWithRetry:1];
}

- (void)retrieveAndLogNfcPowerCountersWithRetry:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F7A090] sharedHardwareManager];
  id v61 = 0;
  uint64_t v6 = [v5 getPowerCounters:&v61];
  id v7 = v61;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    v9 = v7;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke;
      v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v60[4] = v10;
      if (qword_1EBD5A000 != -1) {
        dispatch_once(&qword_1EBD5A000, v60);
      }
      if (byte_1EBD59FA9)
      {
        v11 = [NSString stringWithFormat:@"Power counters not valid: %@, error: %@", v6, v9];
        id v12 = (void *)MEMORY[0x1E4F929B8];
        v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        uint64_t v14 = [v13 lastPathComponent];
        uint64_t v15 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:407];

        v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }

    id v59 = 0;
    uint64_t v17 = [v5 queryHardwareSupport:&v59];
    id v18 = v59;
    if (v17 == 4)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v19 = objc_opt_class();
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_2;
        v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v56[4] = v19;
        if (qword_1EBD5A010 != -1) {
          dispatch_once(&qword_1EBD5A010, v56);
        }
        if (byte_1EBD59FAB)
        {
          uint64_t v20 = [NSString stringWithFormat:@"NF hardware state is not supported, error message: %@", v18];
          uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
          v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
          uint64_t v23 = [v22 lastPathComponent];
          v24 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]"];
          [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:421];

          v25 = PLLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v20;
            _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    else if (v3)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v45 = objc_opt_class();
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_232;
        v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v58[4] = v45;
        if (qword_1EBD5A008 != -1) {
          dispatch_once(&qword_1EBD5A008, v58);
        }
        if (byte_1EBD59FAA)
        {
          v46 = objc_msgSend(NSString, "stringWithFormat:", @"Retry NF power counters query once with current HW state: %d", v17);
          v47 = (void *)MEMORY[0x1E4F929B8];
          v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
          v49 = [v48 lastPathComponent];
          v50 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]"];
          [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:415];

          v51 = PLLogCommon();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v46;
            _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      dispatch_time_t v52 = dispatch_time(0, 30000000000);
      v53 = [(PLOperator *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_236;
      block[3] = &unk_1E692A250;
      block[4] = self;
      dispatch_after(v52, v53, block);
    }
  }
  else
  {
    uint64_t v26 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"Power"];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v28 = objc_opt_class();
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_244;
      v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v55[4] = v28;
      if (qword_1EBD5A018 != -1) {
        dispatch_once(&qword_1EBD5A018, v55);
      }
      if (byte_1EBD59FAC)
      {
        v29 = [NSString stringWithFormat:@"Received valid NFC power counters: %@", v6];
        uint64_t v30 = (void *)MEMORY[0x1E4F929B8];
        v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        v32 = [v31 lastPathComponent];
        v33 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]"];
        [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:425];

        v34 = PLLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v29;
          _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v35 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v36 = objc_opt_class();
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_250;
      v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v54[4] = v36;
      if (qword_1EBD5A020 != -1) {
        dispatch_once(&qword_1EBD5A020, v54);
      }
      if (byte_1EBD59FAD)
      {
        v37 = [NSString stringWithFormat:@"NFC power logging end time: %@", v35];
        id v38 = (void *)MEMORY[0x1E4F929B8];
        v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        v40 = [v39 lastPathComponent];
        uint64_t v41 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcPowerCountersWithRetry:]"];
        [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:428];

        v42 = PLLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v37;
          _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v43 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v26 withRawData:v6];
    v44 = [(PLNfcAgent *)self lastPowerCountersLogTime];
    [v43 setEntryDate:v44];

    [v43 setObject:v35 forKeyedSubscript:@"timestampEnd"];
    [(PLOperator *)self logEntry:v43];
    [(PLNfcAgent *)self setLastPowerCountersLogTime:v35];

    id v18 = 0;
  }
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FA9 = result;
  return result;
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_232(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FAA = result;
  return result;
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_236(uint64_t a1)
{
  return [*(id *)(a1 + 32) retrieveAndLogNfcPowerCountersWithRetry:0];
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FAB = result;
  return result;
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_244(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FAC = result;
  return result;
}

uint64_t __54__PLNfcAgent_retrieveAndLogNfcPowerCountersWithRetry___block_invoke_250(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FAD = result;
  return result;
}

- (void)retrieveAndLogNfcAccessoryPowerCountersWithRetry:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F7A0B0] sharedHardwareManager];
  id v51 = 0;
  uint64_t v6 = [v5 getPowerCounters:&v51];
  id v7 = v51;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v9;
      if (qword_1EBD5A028 != -1) {
        dispatch_once(&qword_1EBD5A028, v50);
      }
      if (byte_1EBD59FAE)
      {
        uint64_t v10 = [NSString stringWithFormat:@"Accessory power counters not valid: %@, error: %@", v6, v7];
        v11 = (void *)MEMORY[0x1E4F929B8];
        id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        v13 = [v12 lastPathComponent];
        uint64_t v14 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcAccessoryPowerCountersWithRetry:]"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:447];

        uint64_t v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v10;
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if (v3)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v16 = objc_opt_class();
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_259;
        v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v49[4] = v16;
        if (qword_1EBD5A030 != -1) {
          dispatch_once(&qword_1EBD5A030, v49);
        }
        if (byte_1EBD59FAF)
        {
          uint64_t v17 = [NSString stringWithFormat:@"Retry NF power counters query once"];
          id v18 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
          uint64_t v20 = [v19 lastPathComponent];
          uint64_t v21 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcAccessoryPowerCountersWithRetry:]"];
          [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:450];

          v22 = PLLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v17;
            _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      dispatch_time_t v23 = dispatch_time(0, 30000000000);
      v24 = [(PLOperator *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_263;
      block[3] = &unk_1E692A250;
      block[4] = self;
      dispatch_after(v23, v24, block);
    }
  }
  else
  {
    v25 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"AccessoryPower"];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v27 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_2;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v27;
      if (qword_1EBD5A038 != -1) {
        dispatch_once(&qword_1EBD5A038, v47);
      }
      if (byte_1EBD59FB0)
      {
        v44 = v25;
        uint64_t v28 = [NSString stringWithFormat:@"Received valid NFC accessory power counters: %@", v6];
        v29 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        v31 = [v30 lastPathComponent];
        v32 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcAccessoryPowerCountersWithRetry:]"];
        [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:457];

        v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v28;
          _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v44;
      }
    }
    v34 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v35 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_271;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v35;
      if (qword_1EBD5A040 != -1) {
        dispatch_once(&qword_1EBD5A040, v46);
      }
      if (byte_1EBD59FB1)
      {
        uint64_t v45 = v25;
        uint64_t v36 = [NSString stringWithFormat:@"NFC accessory power logging end time: %@", v34];
        v37 = (void *)MEMORY[0x1E4F929B8];
        id v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLNfcAgent.m"];
        v39 = [v38 lastPathComponent];
        v40 = [NSString stringWithUTF8String:"-[PLNfcAgent retrieveAndLogNfcAccessoryPowerCountersWithRetry:]"];
        [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:460];

        uint64_t v41 = PLLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v36;
          _os_log_debug_impl(&dword_1D2690000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v25 = v45;
      }
    }
    v42 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v25 withRawData:v6];
    v43 = [(PLNfcAgent *)self lastAccessoryPowerCountersLogTime];
    [v42 setEntryDate:v43];

    [v42 setObject:v34 forKeyedSubscript:@"timestampEnd"];
    [(PLOperator *)self logEntry:v42];
    [(PLNfcAgent *)self setLastAccessoryPowerCountersLogTime:v34];
  }
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FAE = result;
  return result;
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_259(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FAF = result;
  return result;
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_263(uint64_t a1)
{
  return [*(id *)(a1 + 32) retrieveAndLogNfcAccessoryPowerCountersWithRetry:0];
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FB0 = result;
  return result;
}

uint64_t __63__PLNfcAgent_retrieveAndLogNfcAccessoryPowerCountersWithRetry___block_invoke_271(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59FB1 = result;
  return result;
}

- (unsigned)getNFCHarwareState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F7A090] sharedHardwareManager];
  id v7 = 0;
  unsigned int v3 = [v2 queryHardwareSupport:&v7];
  id v4 = v7;

  if (v4)
  {
    id v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, "failed to get the hardware state: %@", buf, 0xCu);
    }
    unsigned int v3 = 1;
LABEL_9:

    goto LABEL_10;
  }
  if (v3 == 4)
  {
    id v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "The hardware is not supported: %@", buf, 0xCu);
    }
    unsigned int v3 = 4;
    goto LABEL_9;
  }
LABEL_10:

  return v3;
}

- (void)logEventForwardLPEM
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__12;
  v9[4] = __Block_byref_object_dispose__12;
  id v10 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  void v7[3] = __Block_byref_object_copy__12;
  v7[4] = __Block_byref_object_dispose__12;
  id v8 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__12;
  v5[4] = __Block_byref_object_dispose__12;
  id v6 = 0;
  unsigned int v3 = dispatch_get_global_queue(2, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PLNfcAgent_logEventForwardLPEM__block_invoke;
  v4[3] = &unk_1E6930AB0;
  v4[6] = v7;
  v4[7] = v5;
  v4[4] = self;
  v4[5] = v9;
  dispatch_async(v3, v4);

  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
}

void __33__PLNfcAgent_logEventForwardLPEM__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F7A090] sharedHardwareManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PLNfcAgent_logEventForwardLPEM__block_invoke_2;
  v5[3] = &unk_1E6930A88;
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 32);
  long long v7 = v3;
  id v4 = [v2 startSecureElementLoggingSession:v5];
}

void __33__PLNfcAgent_logEventForwardLPEM__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    long long v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v8;
      id v9 = "failed to start  logEventForwardLPEM%@";
LABEL_10:
      _os_log_error_impl(&dword_1D2690000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F7A0A0] embeddedSecureElement];
    v11 = [v10 serialNumber];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v12 + 40);
    uint64_t v13 = [v5 getLogs:4 forSEID:v11 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      long long v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v16;
        id v9 = "failed to get logs%@";
        goto LABEL_10;
      }
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v18 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"A000000704E000010002"];
      uint64_t v19 = [v18 objectForKeyedSubscript:@"FixedBuffer"];
      uint64_t v20 = [v17 initWithData:v19];
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      dispatch_time_t v23 = [MEMORY[0x1E4F7A0A0] embeddedSecureElement];
      v24 = [v23 serialNumber];
      uint64_t v25 = [v5 clearLogs:4 forSEID:v24];
      uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
        goto LABEL_12;
      }
      long long v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v28;
        id v9 = "failed to clear the log: %@";
        goto LABEL_10;
      }
    }
  }

LABEL_12:
  [v5 endSession];
  uint64_t v29 = +[PLNfcAgent parseLPEMFromData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
  v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v32 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LPEM"];
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v32 withRawData:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(a1 + 32) logEntry:v33];
    v34 = [v33 objectForKeyedSubscript:@"BTCC"];
    [v34 intValue];
    ADClientSetValueForScalarKey();

    uint64_t v35 = [v33 objectForKeyedSubscript:@"BTCT"];
    [v35 intValue];
    ADClientSetValueForScalarKey();

    uint64_t v36 = [v33 objectForKeyedSubscript:@"SRSC"];
    [v36 intValue];
    ADClientSetValueForScalarKey();

    v37 = [v33 objectForKeyedSubscript:@"SRST"];
    [v37 intValue];
    ADClientSetValueForScalarKey();

    id v38 = [v33 objectForKeyedSubscript:@"SRUC"];
    [v38 intValue];
    ADClientSetValueForScalarKey();

    v39 = [v33 objectForKeyedSubscript:@"SRLC"];
    [v39 intValue];
    ADClientSetValueForScalarKey();

    v40 = [v33 objectForKeyedSubscript:@"SERESET"];
    [v40 intValue];
    ADClientSetValueForScalarKey();

    uint64_t v41 = [v33 objectForKeyedSubscript:@"ROLL"];
    [v41 intValue];
    ADClientSetValueForScalarKey();

    v42 = [v33 objectForKeyedSubscript:@"BTENTRY"];
    [v42 intValue];
    ADClientSetValueForScalarKey();

    v43 = [v33 objectForKeyedSubscript:@"BTEXIT"];
    [v43 intValue];
    ADClientSetValueForScalarKey();

    id v44 = v33;
    AnalyticsSendEventLazy();
  }
}

id __33__PLNfcAgent_logEventForwardLPEM__block_invoke_310(uint64_t a1)
{
  v35[10] = *MEMORY[0x1E4F143B8];
  v34[0] = @"BTCC";
  uint64_t v2 = NSNumber;
  v33 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v32 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v33, "intValue"));
  v35[0] = v32;
  v34[1] = @"BTCT";
  long long v3 = NSNumber;
  v31 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v30 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v31, "intValue"));
  v35[1] = v30;
  void v34[2] = @"SRSC";
  id v4 = NSNumber;
  uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v28 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v29, "intValue"));
  void v35[2] = v28;
  v34[3] = @"SRST";
  id v5 = NSNumber;
  uint64_t v27 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v26 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v27, "intValue"));
  v35[3] = v26;
  v34[4] = @"SRUC";
  id v6 = NSNumber;
  uint64_t v25 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v24 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v25, "intValue"));
  v35[4] = v24;
  void v34[5] = @"SRLC";
  long long v7 = NSNumber;
  dispatch_time_t v23 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v8 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v23, "intValue"));
  void v35[5] = v8;
  v34[6] = @"SERESET";
  id v9 = NSNumber;
  id v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "intValue"));
  v35[6] = v11;
  v34[7] = @"ROLL";
  uint64_t v12 = NSNumber;
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v14 = objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "intValue"));
  v35[7] = v14;
  v34[8] = @"BTENTRY";
  uint64_t v15 = NSNumber;
  uint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v17 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue"));
  v35[8] = v17;
  v34[9] = @"BTEXIT";
  id v18 = NSNumber;
  uint64_t v19 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v20 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "intValue"));
  v35[9] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:10];

  return v21;
}

+ (id)parseLPEMFromData:(id)a3
{
  v19[10] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x10)
  {
    id v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, "Not able to parse the LPEM, mismatch of length", buf, 2u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    id v4 = (unsigned __int8 *)[v3 bytes];
    v18[0] = @"BTCC";
    id v5 = [NSNumber numberWithUnsignedChar:*v4];
    v19[0] = v5;
    v18[1] = @"BTCT";
    uint64_t v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 1)];
    v19[1] = v16;
    v18[2] = @"SRSC";
    uint64_t v15 = [NSNumber numberWithUnsignedChar:v4[5]];
    v19[2] = v15;
    v18[3] = @"SRST";
    id v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v4 + 6)];
    v19[3] = v6;
    v18[4] = @"SRUC";
    long long v7 = [NSNumber numberWithUnsignedChar:v4[10]];
    v19[4] = v7;
    v18[5] = @"SRLC";
    uint64_t v8 = [NSNumber numberWithUnsignedChar:v4[11]];
    v19[5] = v8;
    v18[6] = @"SERESET";
    id v9 = [NSNumber numberWithUnsignedChar:v4[12]];
    v19[6] = v9;
    v18[7] = @"ROLL";
    id v10 = [NSNumber numberWithUnsignedChar:v4[13]];
    v19[7] = v10;
    v18[8] = @"BTENTRY";
    v11 = [NSNumber numberWithUnsignedChar:v4[14]];
    v19[8] = v11;
    v18[9] = @"BTEXIT";
    uint64_t v12 = [NSNumber numberWithUnsignedChar:v4[15]];
    v19[9] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:10];
  }
  return v13;
}

- (PLXPCListenerOperatorComposition)cardNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCardNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)fieldNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFieldNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)transactionNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransactionNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)tsmCommunicationNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTsmCommunicationNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)nfcPowerCountersNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNfcPowerCountersNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)nfcAccessoryPowerCounterNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNfcAccessoryPowerCounterNotification:(id)a3
{
}

- (void)setOnPower:(double)a3
{
  self->_onPower = a3;
}

- (NSDate)lastPowerCountersLogTime
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastPowerCountersLogTime:(id)a3
{
}

- (NSDate)lastAccessoryPowerCountersLogTime
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLastAccessoryPowerCountersLogTime:(id)a3
{
}

- (PLTimer)nfcConnectionRetryTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNfcConnectionRetryTimer:(id)a3
{
}

- (int)nfcConnectionRetryCount
{
  return self->_nfcConnectionRetryCount;
}

- (void)setNfcConnectionRetryCount:(int)a3
{
  self->_nfcConnectionRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcConnectionRetryTimer, 0);
  objc_storeStrong((id *)&self->_lastAccessoryPowerCountersLogTime, 0);
  objc_storeStrong((id *)&self->_lastPowerCountersLogTime, 0);
  objc_storeStrong((id *)&self->_nfcAccessoryPowerCounterNotification, 0);
  objc_storeStrong((id *)&self->_nfcPowerCountersNotification, 0);
  objc_storeStrong((id *)&self->_tsmCommunicationNotification, 0);
  objc_storeStrong((id *)&self->_transactionNotification, 0);
  objc_storeStrong((id *)&self->_fieldNotification, 0);
  objc_storeStrong((id *)&self->_cardNotification, 0);
}

@end