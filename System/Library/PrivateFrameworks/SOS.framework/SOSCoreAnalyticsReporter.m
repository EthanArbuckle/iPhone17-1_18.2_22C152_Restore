@interface SOSCoreAnalyticsReporter
+ (BOOL)_firstPartyEnablementForTrigger:(int64_t)a3;
+ (BOOL)_thirdPartyEnablementForTrigger:(int64_t)a3;
+ (BOOL)isSensitiveTrigger:(int64_t)a3;
+ (id)SOSCoordinationDeviceString:(int64_t)a3;
+ (id)sharedInstance;
+ (void)_AnalyticsSendEventLazy:(id)a3 data:(id)a4;
+ (void)reportSOSAutomaticCallCountdownEnabled:(BOOL)a3;
+ (void)reportSOSAutomaticNewtonEnabled:(BOOL)a3;
+ (void)reportSOSLongPressTriggersEmergencySOS:(BOOL)a3;
+ (void)reportSOSNumberOfVoiceLoops:(int64_t)a3;
+ (void)reportSOSShouldPlayAudioDuringCountdown:(BOOL)a3;
- (void)reportSOSCancelationTimeout:(int64_t)a3;
- (void)reportSOSEvent:(id)a3 callDuration:(int64_t)a4 isHandoffTrigger:(BOOL)a5 onWristState:(int64_t)a6;
- (void)reportSOSRejectedWithTrigger:(int64_t)a3 currentTriggerMechanism:(int64_t)a4;
- (void)reportSOSRestingResponse:(int64_t)a3 restingResponse:(int64_t)a4 hasMedicalID:(BOOL)a5;
- (void)reportSOSTriggerHandoff:(int64_t)a3 source:(int64_t)a4 destination:(int64_t)a5 result:(int64_t)a6;
- (void)reportSOSTriggered:(int64_t)a3;
- (void)reportSOSUserCancelled:(int64_t)a3 lastFlowState:(int64_t)a4 countdownValue:(int64_t)a5;
@end

@implementation SOSCoreAnalyticsReporter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SOSCoreAnalyticsReporter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_sosCoreAnalyticsReporter;

  return v2;
}

uint64_t __42__SOSCoreAnalyticsReporter_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sosCoreAnalyticsReporter = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (void)reportSOSTriggered:(int64_t)a3
{
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  char v4 = [v3 isSafetyDataSubmissionAllowed];

  if (v4)
  {
    AnalyticsSendEventLazy();
  }
  else
  {
    v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSCoreAnalyticsReport, not reporting SOS trigger because Safety data collection is OFF", buf, 2u);
    }
  }
}

id __47__SOSCoreAnalyticsReporter_reportSOSTriggered___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  char v4 = @"triggerMechanism";
  v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportSOSUserCancelled:(int64_t)a3 lastFlowState:(int64_t)a4 countdownValue:(int64_t)a5
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"triggerMechanism";
  v7 = [NSNumber numberWithInteger:a3];
  v12[0] = v7;
  v11[1] = @"lastFlowState2";
  v8 = [NSNumber numberWithInteger:a4];
  v12[1] = v8;
  v11[2] = @"lastCountdownValue";
  v9 = [NSNumber numberWithInteger:a5];
  v12[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:@"com.apple.sos.user_canceled" data:v10];
}

- (void)reportSOSTriggerHandoff:(int64_t)a3 source:(int64_t)a4 destination:(int64_t)a5 result:(int64_t)a6
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"triggerMechanism";
  v9 = [NSNumber numberWithInteger:a3];
  v15[0] = v9;
  v14[1] = @"handoffSourceDescription";
  v10 = +[SOSCoreAnalyticsReporter SOSCoordinationDeviceString:a4];
  v15[1] = v10;
  v14[2] = @"handoffDestinationDescription";
  v11 = +[SOSCoreAnalyticsReporter SOSCoordinationDeviceString:a5];
  v15[2] = v11;
  v14[3] = @"handoffResult";
  v12 = [NSNumber numberWithInteger:a6];
  v15[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:@"com.apple.sos.trigger.handoff" data:v13];
}

- (void)reportSOSRejectedWithTrigger:(int64_t)a3 currentTriggerMechanism:(int64_t)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"currentTriggerMechanism";
  v5 = [NSNumber numberWithInteger:a4];
  v8[1] = @"rejectedTriggerMechanism";
  v9[0] = v5;
  v6 = [NSNumber numberWithInteger:a3];
  v9[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:@"com.apple.sos.trigger.already_active" data:v7];
}

- (void)reportSOSRestingResponse:(int64_t)a3 restingResponse:(int64_t)a4 hasMedicalID:(BOOL)a5
{
  BOOL v5 = a5;
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"triggerMechanism";
  v7 = [NSNumber numberWithInteger:a3];
  v12[0] = v7;
  v11[1] = @"restingResponse";
  v8 = [NSNumber numberWithInteger:a4];
  v12[1] = v8;
  v11[2] = @"hasMedicalID";
  v9 = [NSNumber numberWithBool:v5];
  v12[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:@"com.apple.sos.trigger.resting_response" data:v10];
}

- (void)reportSOSCancelationTimeout:(int64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"triggerMechanism";
  v3 = [NSNumber numberWithInteger:a3];
  v6[0] = v3;
  char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:@"com.apple.sos.user_cancelation_timeout" data:v4];
}

- (void)reportSOSEvent:(id)a3 callDuration:(int64_t)a4 isHandoffTrigger:(BOOL)a5 onWristState:(int64_t)a6
{
  BOOL v27 = a5;
  v29[8] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = +[SOSCoreAnalyticsReporter _firstPartyEnablementForTrigger:](SOSCoreAnalyticsReporter, "_firstPartyEnablementForTrigger:", [v8 trigger]);
  BOOL v10 = +[SOSCoreAnalyticsReporter _thirdPartyEnablementForTrigger:](SOSCoreAnalyticsReporter, "_thirdPartyEnablementForTrigger:", [v8 trigger]);
  v11 = [v8 timeOfResolution];
  v12 = [v8 timeOfDetection];
  [v11 timeIntervalSinceDate:v12];
  uint64_t v14 = (int)v13;

  BOOL v15 = a6 == 1;
  v28[0] = @"triggerMechanism";
  v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "trigger"));
  v29[0] = v16;
  v28[1] = @"3rdPartyFeatureEnablement";
  v17 = [NSNumber numberWithBool:v10];
  v29[1] = v17;
  v28[2] = @"callDuration";
  v18 = [NSNumber numberWithInteger:a4];
  v29[2] = v18;
  v28[3] = @"eventDuration";
  v19 = [NSNumber numberWithInteger:v14];
  v29[3] = v19;
  v28[4] = @"eventResolution";
  v20 = NSNumber;
  uint64_t v21 = [v8 resolution];

  v22 = [v20 numberWithInteger:v21];
  v29[4] = v22;
  v28[5] = @"featureEnablement";
  v23 = [NSNumber numberWithBool:v9];
  v29[5] = v23;
  v28[6] = @"wasHandoffTrigger";
  v24 = [NSNumber numberWithBool:v27];
  v29[6] = v24;
  v28[7] = @"watchOnWrist";
  v25 = [NSNumber numberWithBool:v15];
  v29[7] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:8];
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:@"com.apple.sos.event" data:v26];
}

+ (void)reportSOSShouldPlayAudioDuringCountdown:(BOOL)a3
{
}

id __68__SOSCoreAnalyticsReporter_reportSOSShouldPlayAudioDuringCountdown___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  char v4 = @"shouldPlayAudioDuringCountdown";
  v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)reportSOSAutomaticCallCountdownEnabled:(BOOL)a3
{
}

id __67__SOSCoreAnalyticsReporter_reportSOSAutomaticCallCountdownEnabled___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  char v4 = @"automaticCallCountdownEnabled";
  v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)reportSOSLongPressTriggersEmergencySOS:(BOOL)a3
{
}

id __67__SOSCoreAnalyticsReporter_reportSOSLongPressTriggersEmergencySOS___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  char v4 = @"longPressTriggersEmergencySOS";
  v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)reportSOSAutomaticNewtonEnabled:(BOOL)a3
{
}

id __60__SOSCoreAnalyticsReporter_reportSOSAutomaticNewtonEnabled___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  char v4 = @"fallDetectionEnabled";
  v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)reportSOSNumberOfVoiceLoops:(int64_t)a3
{
}

id __56__SOSCoreAnalyticsReporter_reportSOSNumberOfVoiceLoops___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  char v4 = @"numberOfVoiceLoops";
  v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (BOOL)isSensitiveTrigger:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xA)
  {
    BOOL v5 = sos_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SOSCoreAnalyticsReporter isSensitiveTrigger:](a3, v5, v6, v7, v8, v9, v10, v11);
    }

    LOBYTE(v4) = 1;
  }
  else
  {
    return (0xA0u >> a3) & 1;
  }
  return v4;
}

+ (void)_AnalyticsSendEventLazy:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"triggerMechanism"];
  if (+[SOSCoreAnalyticsReporter isSensitiveTrigger:](SOSCoreAnalyticsReporter, "isSensitiveTrigger:", [v7 integerValue]))
  {
    uint64_t v8 = [MEMORY[0x1E4F74230] sharedConnection];
    char v9 = [v8 isSafetyDataSubmissionAllowed];

    if ((v9 & 1) == 0)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v10 addEntriesFromDictionary:v6];
      [v10 setObject:&unk_1F0C4AC00 forKeyedSubscript:@"triggerMechanism"];
      uint64_t v11 = [v10 copy];

      id v6 = (id)v11;
    }
  }
  double v13 = v6;
  id v12 = v6;
  AnalyticsSendEventLazy();
}

id __57__SOSCoreAnalyticsReporter__AnalyticsSendEventLazy_data___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)_firstPartyEnablementForTrigger:(int64_t)a3
{
  BOOL result = 0;
  switch(a3)
  {
    case 0:
    case 9:
      return result;
    case 1:
    case 2:
      BOOL result = +[SOSUtilities isCallWithSideButtonPressesEnabled];
      break;
    case 3:
      BOOL result = +[SOSUtilities isCallWithVolumeLockHoldEnabled];
      break;
    case 4:
      BOOL result = +[SOSUtilities longPressTriggersEmergencySOS];
      break;
    case 5:
      BOOL result = +[SOSUtilities newtonTriggersEmergencySOS];
      break;
    case 6:
    case 8:
      BOOL result = 1;
      break;
    case 7:
      BOOL result = +[SOSUtilities kappaTriggersEmergencySOS];
      break;
    default:
      id v5 = sos_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[SOSCoreAnalyticsReporter _firstPartyEnablementForTrigger:](a3, v5, v6, v7, v8, v9, v10, v11);
      }

      BOOL result = 0;
      break;
  }
  return result;
}

+ (BOOL)_thirdPartyEnablementForTrigger:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
  {
    uint64_t v7 = sos_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SOSCoreAnalyticsReporter _thirdPartyEnablementForTrigger:](a3, v7, v8, v9, v10, v11, v12, v13);
    }

    return 0;
  }
  if (((1 << a3) & 0x35F) != 0) {
    return 0;
  }
  if (a3 != 5) {
    return +[SOSUtilities getKappaThirdPartyActiveAppBundle] != 0;
  }
  uint64_t v6 = (void *)TCCAccessCopyBundleIdentifiersForService();
  BOOL v4 = [v6 count] != 0;

  return v4;
}

+ (id)SOSCoordinationDeviceString:(int64_t)a3
{
  v3 = @"none";
  if (a3 == 1) {
    v3 = @"watch";
  }
  if (a3 == 2) {
    return @"phone";
  }
  else {
    return v3;
  }
}

+ (void)isSensitiveTrigger:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_firstPartyEnablementForTrigger:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_thirdPartyEnablementForTrigger:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end