@interface PLSiriAgent
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardASREvent;
+ (id)entryEventForwardDefinitionDictationConnection;
+ (id)entryEventForwardDefinitionSiriConfig;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventIntervalSelfTriggerSuppression;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionSiriWakes;
+ (id)entryEventPointDefinitions;
+ (id)entryEventPointSelfTriggerSuppressionDetected;
+ (void)load;
- (PLSiriAgent)init;
- (PLXPCListenerOperatorComposition)asrEventListener;
- (PLXPCListenerOperatorComposition)dictationConnectionListener;
- (PLXPCListenerOperatorComposition)selfTriggerSuppressionDetectedListener;
- (PLXPCListenerOperatorComposition)selfTriggerSuppressionProcessingListener;
- (PLXPCListenerOperatorComposition)siriConfigListener;
- (PLXPCListenerOperatorComposition)siriWakesListener;
- (unint64_t)convertASREvent:(id)a3;
- (unint64_t)convertMode:(id)a3;
- (unint64_t)convertRecognition:(id)a3;
- (unint64_t)convertSiriEvent:(id)a3;
- (void)initOperatorDependancies;
- (void)logEventForwardASREvent:(id)a3;
- (void)logEventForwardDictationConnection:(id)a3;
- (void)logEventForwardSiriConfig:(id)a3;
- (void)logEventIntervalSelfTriggerSuppression:(id)a3;
- (void)logEventPointSelfTriggerSuppressionDetected:(id)a3;
- (void)logEventPointSiriWakes:(id)a3;
- (void)setAsrEventListener:(id)a3;
- (void)setDictationConnectionListener:(id)a3;
- (void)setSelfTriggerSuppressionDetectedListener:(id)a3;
- (void)setSelfTriggerSuppressionProcessingListener:(id)a3;
- (void)setSiriConfigListener:(id)a3;
- (void)setSiriWakesListener:(id)a3;
@end

@implementation PLSiriAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSiriAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"SiriWakes";
  v3 = [a1 entryEventPointDefinitionSiriWakes];
  v7[1] = @"SelfTriggerSuppressionDetected";
  v8[0] = v3;
  v4 = [a1 entryEventPointSelfTriggerSuppressionDetected];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventPointDefinitionSiriWakes
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F29F04B0;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"phID";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"secondPassState";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  v12[2] = @"secondPassScore";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventPointSelfTriggerSuppressionDetected
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F29F04B0;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"AudioClientType";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"AudioPlaybackRouteType";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  v12[2] = @"AudioSourceType";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventForwardDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ASR";
  v3 = [a1 entryEventForwardASREvent];
  v9[0] = v3;
  v8[1] = @"DictationConnection";
  v4 = [a1 entryEventForwardDefinitionDictationConnection];
  v9[1] = v4;
  v8[2] = @"SiriConfig";
  v5 = [a1 entryEventForwardDefinitionSiriConfig];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventForwardASREvent
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F04B0;
  v18[1] = MEMORY[0x1E4F1CC38];
  v17[2] = *MEMORY[0x1E4F92C58];
  v18[2] = &unk_1F29ED790;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"ASREvent";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"ApplicationName";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v16[1] = v6;
  v15[2] = @"Language";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  void v16[2] = v8;
  v15[3] = @"ModelVersion";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionDictationConnection
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F29F04B0;
  v22[1] = MEMORY[0x1E4F1CC38];
  v21[2] = *MEMORY[0x1E4F92C58];
  v22[2] = &unk_1F29ED7A8;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"SiriEvent";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v20[0] = v16;
  v19[1] = @"Mode";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v20[1] = v14;
  void v19[2] = @"startReason";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v20[2] = v4;
  v19[3] = @"stopReason";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v20[3] = v6;
  v19[4] = @"appBundleID";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat_withBundleID");
  void v20[4] = v8;
  v19[5] = @"Recognition";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionSiriConfig
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isAppleTV])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v14 = *MEMORY[0x1E4F92CD0];
    v15 = &unk_1F29F04B0;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v3;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"HeySiriEnabled";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
    v13[0] = v5;
    v12[1] = @"Language";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    v13[1] = v7;
    v12[2] = @"ModelVersion";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
    v13[2] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v17[1] = v10;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  return v2;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"SelfTriggerSuppression";
  uint64_t v2 = [a1 entryEventIntervalSelfTriggerSuppression];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventIntervalSelfTriggerSuppression
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v20 = *MEMORY[0x1E4F92CD0];
  v21 = &unk_1F29F04B0;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"AudioClientType";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v19[0] = v15;
  v18[1] = @"AudioPlaybackRouteType";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v19[1] = v13;
  v18[2] = @"AudioSourceType";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  void v19[2] = v3;
  void v18[3] = @"NumSelfTriggers";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[3] = v5;
  v18[4] = @"DurationSec";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v19[4] = v7;
  v18[5] = @"timestampEnd";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_DateFormat");
  v19[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLSiriAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLSiriAgent;
  return [(PLAgent *)&v3 init];
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __39__PLSiriAgent_initOperatorDependancies__block_invoke;
  v20[3] = &unk_1E692A6F8;
  void v20[4] = self;
  v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29E8ED8 withBlock:v20];
  [(PLSiriAgent *)self setAsrEventListener:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __39__PLSiriAgent_initOperatorDependancies__block_invoke_114;
  v19[3] = &unk_1E692A6F8;
  v19[4] = self;
  v6 = (void *)[v5 initWithOperator:self withRegistration:&unk_1F29E8F00 withBlock:v19];
  [(PLSiriAgent *)self setDictationConnectionListener:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__PLSiriAgent_initOperatorDependancies__block_invoke_119;
  void v18[3] = &unk_1E692A6F8;
  v18[4] = self;
  v8 = (void *)[v7 initWithOperator:self withRegistration:&unk_1F29E8F28 withBlock:v18];
  [(PLSiriAgent *)self setSelfTriggerSuppressionDetectedListener:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__PLSiriAgent_initOperatorDependancies__block_invoke_127;
  void v17[3] = &unk_1E692A6F8;
  v17[4] = self;
  v10 = (void *)[v9 initWithOperator:self withRegistration:&unk_1F29E8F50 withBlock:v17];
  [(PLSiriAgent *)self setSelfTriggerSuppressionProcessingListener:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __39__PLSiriAgent_initOperatorDependancies__block_invoke_132;
  v16[3] = &unk_1E692A6F8;
  void v16[4] = self;
  v12 = (void *)[v11 initWithOperator:self withRegistration:&unk_1F29E8F78 withBlock:v16];
  [(PLSiriAgent *)self setSiriWakesListener:v12];

  if (([MEMORY[0x1E4F92A38] isAppleTV] & 1) == 0)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__PLSiriAgent_initOperatorDependancies__block_invoke_137;
    v15[3] = &unk_1E692A6F8;
    void v15[4] = self;
    uint64_t v14 = (void *)[v13 initWithOperator:self withRegistration:&unk_1F29E8FA0 withBlock:v15];
    [(PLSiriAgent *)self setSiriConfigListener:v14];
  }
}

void __39__PLSiriAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "ESConnection payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardASREvent:v6];
}

void __39__PLSiriAgent_initOperatorDependancies__block_invoke_114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "DictationConnection payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardDictationConnection:v6];
}

void __39__PLSiriAgent_initOperatorDependancies__block_invoke_119(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "SelfTriggerSuppressionDetected payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointSelfTriggerSuppressionDetected:v6];
}

void __39__PLSiriAgent_initOperatorDependancies__block_invoke_127(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "SelfTriggerSuppressionEvent payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventIntervalSelfTriggerSuppression:v6];
}

void __39__PLSiriAgent_initOperatorDependancies__block_invoke_132(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "SiriWakes payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointSiriWakes:v6];
}

void __39__PLSiriAgent_initOperatorDependancies__block_invoke_137(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "SiriConfig payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSiriConfig:v6];
}

- (void)logEventPointSelfTriggerSuppressionDetected:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v14 = +[PLOperator entryKeyForType:v4 andName:@"SelfTriggerSuppressionDetected"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = [v5 objectForKeyedSubscript:@"DetectedTime"];
  [v7 doubleValue];
  int v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  id v9 = [v8 convertFromSystemToMonotonic];

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withDate:v9];
  id v11 = [v5 objectForKeyedSubscript:@"PhoneCallConnected"];
  [v10 setObject:v11 forKeyedSubscript:@"AudioClientType"];

  v12 = [v5 objectForKeyedSubscript:@"AudioPlaybackRouteType"];
  [v10 setObject:v12 forKeyedSubscript:@"AudioPlaybackRouteType"];

  id v13 = [v5 objectForKeyedSubscript:@"AudioSourceType"];

  [v10 setObject:v13 forKeyedSubscript:@"AudioSourceType"];
  [(PLOperator *)self logEntry:v10];
}

- (void)logEventPointSiriWakes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v6 = +[PLOperator entryKeyForType:v4 andName:@"SiriWakes"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withRawData:v5];

  int v8 = PLLogSiri();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [v7 objectForKeyedSubscript:@"secondPassState"];
    int v12 = 138412290;
    id v13 = v11;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "logEventPointSiriWakes: secondPassState value: %@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [v7 objectForKeyedSubscript:@"secondPassState"];
  int v10 = [v9 intValue];

  if (v10 == 11) {
    [v7 setObject:&unk_1F29E4E88 forKeyedSubscript:@"secondPassState"];
  }
  [(PLOperator *)self logEntry:v7];
}

- (unint64_t)convertASREvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"preheatSpeechRecognitionWithAssetConfig"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"startSpeechRecognitionWithParameters"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"createSpeechProfileWithLanguage"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"compileAllAssetsWithCompletion"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"didFinishRecognitionWithError"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    id v5 = PLLogSiri();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Unknown/Other ASR siriEvent %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v4 = 5;
  }

  return v4;
}

- (void)logEventForwardASREvent:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"ASR"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10 withRawData:v5];
  int v7 = [v5 objectForKeyedSubscript:@"ASR Event"];

  unint64_t v8 = [(PLSiriAgent *)self convertASREvent:v7];
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:v8];
  [v6 setObject:v9 forKeyedSubscript:@"ASREvent"];

  [(PLOperator *)self logEntry:v6];
}

- (unint64_t)convertMode:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"Location"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Person"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Text"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"PhonemeTranscription"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    id v5 = PLLogSiri();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Unknown Dictation mode %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v4 = 4;
  }

  return v4;
}

- (unint64_t)convertRecognition:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"on-device"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"server"])
  {
    unint64_t v4 = 1;
  }
  else
  {
    id v5 = PLLogSiri();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Unknown/Other Dictation recognition %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v4 = 2;
  }

  return v4;
}

- (unint64_t)convertSiriEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"Dictation start"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Dictation stop"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Dictation endSession"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Dictation pause"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"Dictation resume"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    id v5 = PLLogSiri();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Unknown/Other Dictation siriEvent %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v4 = 5;
  }

  return v4;
}

- (void)logEventForwardDictationConnection:(id)a3
{
  id v15 = a3;
  unint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"DictationConnection"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v15];
  id v6 = [v15 objectForKeyedSubscript:@"Siri Event"];
  unint64_t v7 = [(PLSiriAgent *)self convertSiriEvent:v6];

  if (v7 != 5)
  {
    if (v7 == 1)
    {
      id v8 = NSNumber;
      uint64_t v9 = [v15 objectForKeyedSubscript:@"mode"];
      id v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", -[PLSiriAgent convertMode:](self, "convertMode:", v9));
      [v5 setObject:v10 forKeyedSubscript:@"Mode"];

      id v11 = NSNumber;
      int v12 = [v15 objectForKeyedSubscript:@"recognition"];
      id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", -[PLSiriAgent convertRecognition:](self, "convertRecognition:", v12));
      [v5 setObject:v13 forKeyedSubscript:@"Recognition"];
    }
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:v7];
    [v5 setObject:v14 forKeyedSubscript:@"SiriEvent"];

    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventForwardSiriConfig:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"SiriConfig"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventIntervalSelfTriggerSuppression:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v20 = +[PLOperator entryKeyForType:v4 andName:@"SelfTriggerSuppression"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = [v5 objectForKeyedSubscript:@"StartTime"];
  [v7 doubleValue];
  id v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  uint64_t v9 = [v8 convertFromSystemToMonotonic];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v20 withDate:v9];
  id v11 = [v5 objectForKeyedSubscript:@"PhoneCallConnected"];
  [v10 setObject:v11 forKeyedSubscript:@"AudioClientType"];

  int v12 = [v5 objectForKeyedSubscript:@"AudioPlaybackRouteType"];
  [v10 setObject:v12 forKeyedSubscript:@"AudioPlaybackRouteType"];

  id v13 = [v5 objectForKeyedSubscript:@"AudioSourceType"];
  [v10 setObject:v13 forKeyedSubscript:@"AudioSourceType"];

  uint64_t v14 = [v5 objectForKeyedSubscript:@"DurationSec"];
  [v10 setObject:v14 forKeyedSubscript:@"DurationSec"];

  id v15 = [v5 objectForKeyedSubscript:@"NumSelfTriggersInInterval"];
  [v10 setObject:v15 forKeyedSubscript:@"NumSelfTriggers"];

  v16 = (void *)MEMORY[0x1E4F1C9C8];
  v17 = [v5 objectForKeyedSubscript:@"StopTime"];

  [v17 doubleValue];
  v18 = objc_msgSend(v16, "dateWithTimeIntervalSince1970:");

  v19 = [v18 convertFromSystemToMonotonic];

  [v10 setObject:v19 forKeyedSubscript:@"timestampEnd"];
  [(PLOperator *)self logEntry:v10];
}

- (PLXPCListenerOperatorComposition)asrEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAsrEventListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)dictationConnectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDictationConnectionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)selfTriggerSuppressionDetectedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSelfTriggerSuppressionDetectedListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)selfTriggerSuppressionProcessingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSelfTriggerSuppressionProcessingListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)siriWakesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSiriWakesListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)siriConfigListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSiriConfigListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriConfigListener, 0);
  objc_storeStrong((id *)&self->_siriWakesListener, 0);
  objc_storeStrong((id *)&self->_selfTriggerSuppressionProcessingListener, 0);
  objc_storeStrong((id *)&self->_selfTriggerSuppressionDetectedListener, 0);
  objc_storeStrong((id *)&self->_dictationConnectionListener, 0);
  objc_storeStrong((id *)&self->_asrEventListener, 0);
}

@end