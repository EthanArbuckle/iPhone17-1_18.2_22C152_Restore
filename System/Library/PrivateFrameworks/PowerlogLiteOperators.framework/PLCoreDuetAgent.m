@interface PLCoreDuetAgent
+ (id)entryEventForwardDefinitionInactivityFeatures;
+ (id)entryEventForwardDefinitionInactivityPredictionInterruption;
+ (id)entryEventForwardDefinitionInactivityPredictionQuery;
+ (id)entryEventForwardDefinitionInactivityPredictionTimeline;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionInBedDetection;
+ (id)entryEventIntervalDefinitionInactivityPrediction;
+ (id)entryEventIntervalDefinitions;
+ (void)load;
- (PLCoreDuetAgent)init;
- (PLNSNotificationOperatorComposition)dailyTaskNotification;
- (PLXPCListenerOperatorComposition)inactivityFeaturesListener;
- (PLXPCListenerOperatorComposition)inactivityPredictionInterruptionListener;
- (PLXPCListenerOperatorComposition)inactivityPredictionListener;
- (PLXPCListenerOperatorComposition)inactivityPredictionQueryListener;
- (PLXPCListenerOperatorComposition)inactivityPredictionTimelineListener;
- (void)initOperatorDependancies;
- (void)logEventForwardInactivityFeatures:(id)a3;
- (void)logEventForwardInactivityPredictionInterruption:(id)a3;
- (void)logEventForwardInactivityPredictionQuery:(id)a3;
- (void)logEventForwardInactivityPredictionTimeline:(id)a3;
- (void)logEventIntervalInactivityPrediction:(id)a3;
- (void)setDailyTaskNotification:(id)a3;
- (void)setInactivityFeaturesListener:(id)a3;
- (void)setInactivityPredictionInterruptionListener:(id)a3;
- (void)setInactivityPredictionListener:(id)a3;
- (void)setInactivityPredictionQueryListener:(id)a3;
- (void)setInactivityPredictionTimelineListener:(id)a3;
@end

@implementation PLCoreDuetAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCoreDuetAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventIntervalDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"InBedDetection";
  objc_super v2 = +[PLCoreDuetAgent entryEventIntervalDefinitionInBedDetection];
  v6[1] = @"InactivityPrediction";
  v7[0] = v2;
  v3 = +[PLCoreDuetAgent entryEventIntervalDefinitionInactivityPrediction];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventIntervalDefinitionInBedDetection
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F01E0;
  v14[1] = MEMORY[0x1E4F1CC38];
  v13[2] = *MEMORY[0x1E4F92CE8];
  v14[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"timestampEnd";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v11[1] = @"Confidence";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventIntervalDefinitionInactivityPrediction
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F29F01E0;
  v22[1] = &unk_1F29E1BE8;
  v21[2] = *MEMORY[0x1E4F92CF0];
  v22[2] = &unk_1F29F01F0;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"timestampEnd";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_DateFormat");
  v20[0] = v16;
  v19[1] = @"InactivityTimestamp";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_DateFormat");
  v20[1] = v14;
  v19[2] = @"InactivityTimestampEnd";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_DateFormat");
  v20[2] = v4;
  v19[3] = @"ModelConfidence";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v20[3] = v6;
  v19[4] = @"ModelEngaged";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v20[4] = v8;
  v19[5] = @"PredictedDuration";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"InactivityFeatures";
  uint64_t v2 = +[PLCoreDuetAgent entryEventForwardDefinitionInactivityFeatures];
  v9[0] = v2;
  v8[1] = @"InactivityPredictionQuery";
  v3 = +[PLCoreDuetAgent entryEventForwardDefinitionInactivityPredictionQuery];
  v9[1] = v3;
  v8[2] = @"InactivityPredictionTimeline";
  v4 = +[PLCoreDuetAgent entryEventForwardDefinitionInactivityPredictionTimeline];
  v9[2] = v4;
  v8[3] = @"InactivityPredictionInterruption";
  v5 = +[PLCoreDuetAgent entryEventForwardDefinitionInactivityPredictionInterruption];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)entryEventForwardDefinitionInactivityFeatures
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v24 = *MEMORY[0x1E4F92CD0];
  v25 = &unk_1F29F01E0;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"recent_q95_1";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v23[0] = v19;
  v22[1] = @"woo_q95_1";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v23[1] = v17;
  v22[2] = @"recent_q95_2";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  void v23[2] = v15;
  void v22[3] = @"recent_q75_1";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v23[3] = v13;
  v22[4] = @"recent_q75_2";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v23[4] = v3;
  v22[5] = @"recent_dur_med_1";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v23[5] = v5;
  v22[6] = @"woo_q50_1";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v23[6] = v7;
  v22[7] = @"woo_q95_2";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v23[7] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:8];
  v27[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionInactivityPredictionTimeline
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F29F0200;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"eventType";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"reason";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitionInactivityPredictionQuery
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v32[0] = *MEMORY[0x1E4F92C50];
  uint64_t v30 = *MEMORY[0x1E4F92CD0];
  v31 = &unk_1F29F01E0;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E4F92CA8];
  v28[0] = @"AmbientLightLevel";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v29[0] = v25;
  v28[1] = @"StationaryLevel";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v29[1] = v23;
  v28[2] = @"CurrentPlayback";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_BoolFormat");
  v29[2] = v21;
  v28[3] = @"MediaPlayback";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v29[3] = v19;
  v28[4] = @"DeadlineSetter";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v29[4] = v17;
  v28[5] = @"ModelType";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v29[5] = v15;
  v28[6] = @"ModelConfidence";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v29[6] = v13;
  v28[7] = @"ModelConfidenceLevel";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v29[7] = v3;
  v28[8] = @"PredictedDuration";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v29[8] = v5;
  v28[9] = @"TreatmentID";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v29[9] = v7;
  v28[10] = @"RolloutID";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v29[10] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:11];
  v33[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionInactivityPredictionInterruption
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v26 = *MEMORY[0x1E4F92CD0];
  v27 = &unk_1F29F0210;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"interruptionDuration";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v25[0] = v21;
  v24[1] = @"intrLuxValue";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v25[1] = v19;
  v24[2] = @"intrTimeUntilNextAlarm";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v25[2] = v17;
  v24[3] = @"intrTimeUntilEndOfDnd";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v25[3] = v15;
  void v24[4] = @"intrActivityCountYesterdaySameHour";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v25[4] = v13;
  v24[5] = @"intrActivityCountLastHour";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v25[5] = v3;
  v24[6] = @"deviceIdleFrequency";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v25[6] = v5;
  v24[7] = @"intrActivityDurationLastHour";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v25[7] = v7;
  v24[8] = @"intrActivityDurationYesterdaySameHour";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v25[8] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
  v29[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v11;
}

- (PLCoreDuetAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLCoreDuetAgent;
  return [(PLAgent *)&v3 init];
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke;
  void v22[3] = &unk_1E692A6F8;
  v22[4] = self;
  v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F29E8A78 withBlock:v22];
  inactivityPredictionListener = self->_inactivityPredictionListener;
  self->_inactivityPredictionListener = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke_160;
  void v21[3] = &unk_1E692A6F8;
  v21[4] = self;
  v7 = (PLXPCListenerOperatorComposition *)[v6 initWithOperator:self withRegistration:&unk_1F29E8AA0 withBlock:v21];
  inactivityFeaturesListener = self->_inactivityFeaturesListener;
  self->_inactivityFeaturesListener = v7;

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke_165;
  v20[3] = &unk_1E692A6F8;
  v20[4] = self;
  v10 = (PLXPCListenerOperatorComposition *)[v9 initWithOperator:self withRegistration:&unk_1F29E8AC8 withBlock:v20];
  inactivityPredictionTimelineListener = self->_inactivityPredictionTimelineListener;
  self->_inactivityPredictionTimelineListener = v10;

  if (([MEMORY[0x1E4F92A38] internalBuild] & 1) != 0
    || [MEMORY[0x1E4F929C0] taskMode])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke_172;
    v19[3] = &unk_1E692A6F8;
    v19[4] = self;
    v13 = (PLXPCListenerOperatorComposition *)[v12 initWithOperator:self withRegistration:&unk_1F29E8AF0 withBlock:v19];
    inactivityPredictionQueryListener = self->_inactivityPredictionQueryListener;
    self->_inactivityPredictionQueryListener = v13;

    id v15 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke_177;
    v18[3] = &unk_1E692A6F8;
    v18[4] = self;
    v16 = (PLXPCListenerOperatorComposition *)[v15 initWithOperator:self withRegistration:&unk_1F29E8B18 withBlock:v18];
    inactivityPredictionInterruptionListener = self->_inactivityPredictionInterruptionListener;
    self->_inactivityPredictionInterruptionListener = v16;
  }
}

void __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogCoreDuet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "InactivityPrediction payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventIntervalInactivityPrediction:v6];
}

void __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke_160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogCoreDuet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "InactivityFeatures payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardInactivityFeatures:v6];
}

void __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke_165(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogCoreDuet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "InactivityPredictionTimeline payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardInactivityPredictionTimeline:v6];
}

void __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogCoreDuet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "InactivityPredictionQuery payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardInactivityPredictionQuery:v6];
}

void __43__PLCoreDuetAgent_initOperatorDependancies__block_invoke_177(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogCoreDuet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "InactivityPredictionInterruption payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardInactivityPredictionInterruption:v6];
}

- (void)logEventIntervalInactivityPrediction:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v13 = +[PLOperator entryKeyForType:v4 andName:@"InactivityPrediction"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13 withRawData:v5];
  v7 = [v5 objectForKeyedSubscript:@"timestamp"];
  int v8 = [v7 convertFromSystemToMonotonic];
  [v6 setEntryDate:v8];

  id v9 = [v5 objectForKeyedSubscript:@"timestampEnd"];

  uint64_t v10 = [v9 convertFromSystemToMonotonic];
  [v6 setObject:v10 forKeyedSubscript:@"timestampEnd"];

  v11 = [v6 objectForKeyedSubscript:@"timestampEnd"];

  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v6 setObject:v12 forKeyedSubscript:@"timestampEnd"];
  }
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardInactivityFeatures:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"InactivityFeatures"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardInactivityPredictionInterruption:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v15 = +[PLOperator entryKeyForType:v4 andName:@"InactivityPredictionInterruption"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v15 withRawData:v5];
  id v7 = NSNumber;
  int v8 = [v5 objectForKeyedSubscript:@"intrActivityDurationLastHour"];
  [v8 doubleValue];
  uint64_t v10 = [v7 numberWithDouble:round(v9 / 10.0) * 10.0];
  [v6 setObject:v10 forKeyedSubscript:@"intrActivityDurationLastHour"];

  v11 = NSNumber;
  id v12 = [v5 objectForKeyedSubscript:@"intrActivityDurationYesterdaySameHour"];

  [v12 doubleValue];
  v14 = [v11 numberWithDouble:round(v13 / 10.0) * 10.0];
  [v6 setObject:v14 forKeyedSubscript:@"intrActivityDurationYesterdaySameHour"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardInactivityPredictionQuery:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"InactivityPredictionQuery"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardInactivityPredictionTimeline:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"InactivityPredictionTimeline"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)inactivityPredictionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInactivityPredictionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)inactivityFeaturesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInactivityFeaturesListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)inactivityPredictionQueryListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInactivityPredictionQueryListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)inactivityPredictionTimelineListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInactivityPredictionTimelineListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)inactivityPredictionInterruptionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInactivityPredictionInterruptionListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactivityPredictionInterruptionListener, 0);
  objc_storeStrong((id *)&self->_inactivityPredictionTimelineListener, 0);
  objc_storeStrong((id *)&self->_inactivityPredictionQueryListener, 0);
  objc_storeStrong((id *)&self->_inactivityFeaturesListener, 0);
  objc_storeStrong((id *)&self->_inactivityPredictionListener, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
}

@end