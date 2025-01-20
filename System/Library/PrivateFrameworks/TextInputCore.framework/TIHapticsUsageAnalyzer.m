@interface TIHapticsUsageAnalyzer
+ (id)bucketForTime:(double)a3;
+ (id)idleTimeBuckets;
- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5;
- (TIHapticsUsageAnalyzer)init;
- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4;
- (void)dispatchIdleEventType:(id)a3 idleTime:(double)a4 session:(id)a5;
- (void)dispatchSessionEventWithActiveTime:(double)a3 visibleTime:(double)a4 session:(id)a5;
- (void)registerEventSpec;
@end

@implementation TIHapticsUsageAnalyzer

- (void)registerEventSpec
{
  v23[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FAE248];
  v3 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"keyClicksEnabled"];
  v23[0] = v3;
  v4 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"ringerSwitchOn"];
  v23[1] = v4;
  v5 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"visceralEnabled"];
  v23[2] = v5;
  v6 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"activeTime"];
  v23[3] = v6;
  v7 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"visibleTime"];
  v23[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
  v9 = [v2 eventSpecWithName:@"SoundAndHaptic.Session" inputModeRequired:0 fieldSpecs:v8];

  v10 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v10 registerEventSpec:v9];

  v11 = (void *)MEMORY[0x1E4FAE248];
  v12 = (void *)MEMORY[0x1E4FAE250];
  v13 = [(id)objc_opt_class() idleTimeBuckets];
  v14 = [v12 stringFieldSpecWithName:@"idleBucket" allowedValues:v13];
  v15 = (void *)MEMORY[0x1E4FAE250];
  v21[0] = @"first";
  v21[1] = @"intermediate";
  v21[2] = @"last";
  v22[0] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  v17 = [v15 stringFieldSpecWithName:@"idleType" allowedValues:v16];
  v22[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v19 = [v11 eventSpecWithName:@"SoundAndHaptic.IdlePeriods" inputModeRequired:0 fieldSpecs:v18];

  v20 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v20 registerEventSpec:v19];
}

- (void)dispatchIdleEventType:(id)a3 idleTime:(double)a4 session:(id)a5
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"idleType";
  v10[1] = @"idleBucket";
  v11[0] = a3;
  id v6 = a3;
  v7 = [(id)objc_opt_class() bucketForTime:a4];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  v9 = [MEMORY[0x1E4FAE260] sharedInstance];

  [v9 dispatchEventWithName:@"SoundAndHaptic.IdlePeriods" payload:v8 testingParameters:0 allowSparsePayload:1];
}

- (void)dispatchSessionEventWithActiveTime:(double)a3 visibleTime:(double)a4 session:(id)a5
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend(MEMORY[0x1E4FAE3D8], "sharedPreferencesController", a5);
  uint64_t v8 = [v7 BOOLForPreferenceKey:*MEMORY[0x1E4FAEA08]];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"keyboard-audio", @"com.apple.preferences.sounds", &keyExistsAndHasValidFormat);
  int v10 = keyExistsAndHasValidFormat;
  int v11 = dispatchSessionEventWithActiveTime_visibleTime_session__notifyToken;
  if (dispatchSessionEventWithActiveTime_visibleTime_session__notifyToken == -1)
  {
    notify_register_check("com.apple.springboard.ringerstate", &dispatchSessionEventWithActiveTime_visibleTime_session__notifyToken);
    int v11 = dispatchSessionEventWithActiveTime_visibleTime_session__notifyToken;
  }
  if (AppBooleanValue) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  uint64_t v13 = v12;
  uint64_t state64 = 0;
  notify_get_state(v11, &state64);
  BOOL v14 = state64 != 0;
  v24[0] = @"activeTime";
  v15 = [NSNumber numberWithLong:llround(a3)];
  v25[0] = v15;
  v24[1] = @"visibleTime";
  v16 = [NSNumber numberWithLong:llround(a4)];
  v25[1] = v16;
  v24[2] = @"keyClicksEnabled";
  v17 = [NSNumber numberWithBool:v13];
  v25[2] = v17;
  v24[3] = @"ringerSwitchOn";
  v18 = [NSNumber numberWithBool:v14];
  v25[3] = v18;
  v24[4] = @"visceralEnabled";
  v19 = [NSNumber numberWithBool:v8];
  v25[4] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];

  v21 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v21 dispatchEventWithName:@"SoundAndHaptic.Session" payload:v20 testingParameters:0 allowSparsePayload:1];
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  v44 = self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  v9 = [MEMORY[0x1E4F28F80] processInfo];
  [v9 systemUptime];
  double v11 = v10;

  BOOL v12 = [v5 startTime];
  [v12 timeIntervalSince1970];
  double v14 = v11 + v13 - v8;

  v15 = [v5 endTime];
  [v15 timeIntervalSince1970];
  double v17 = v11 + v16 - v8;

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v45 = v5;
  obuint64_t j = [v5 userActionHistory];
  uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v53;
    uint64_t v46 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if (!objc_msgSend(v23, "actionType", v44))
        {
          id v24 = v23;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v25 = [v24 allTouches];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v49 != v28) {
                  objc_enumerationMutation(v25);
                }
                [*(id *)(*((void *)&v48 + 1) + 8 * j) timestamp];
                if (v30 >= v14 && v30 <= v17)
                {
                  v32 = objc_msgSend(NSNumber, "numberWithDouble:");
                  [v18 addObject:v32];
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v27);
          }

          uint64_t v21 = v46;
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v20);
  }

  [v18 sortUsingComparator:&__block_literal_global_729];
  unint64_t v33 = [v18 count];
  unint64_t v34 = 0;
  double v35 = 0.0;
  double v36 = v14;
  do
  {
    if (v34 >= v33)
    {
      double v42 = v17 - v36;
      v41 = @"last";
    }
    else
    {
      v37 = [v18 objectAtIndexedSubscript:v34];
      [v37 doubleValue];
      double v39 = v38;

      if (v34) {
        double v40 = v36;
      }
      else {
        double v40 = v14;
      }
      if (v34) {
        v41 = @"intermediate";
      }
      else {
        v41 = @"first";
      }
      double v42 = v39 - v40;
      double v36 = v39;
    }
    if (v42 >= 0.5)
    {
      double v35 = v35 + v42;
      -[TIHapticsUsageAnalyzer dispatchIdleEventType:idleTime:session:](v44, "dispatchIdleEventType:idleTime:session:", v41, v45);
    }
    ++v34;
  }
  while (v34 <= v33);
  -[TIHapticsUsageAnalyzer dispatchSessionEventWithActiveTime:visibleTime:session:](v44, "dispatchSessionEventWithActiveTime:visibleTime:session:", v45, v17 - v14 - v35);

  return 1;
}

uint64_t __71__TIHapticsUsageAnalyzer_analyzeSession_alignedSession_withConfidence___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:a3 alignedSession:a4];
}

- (TIHapticsUsageAnalyzer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TIHapticsUsageAnalyzer;
  v2 = [(TIHapticsUsageAnalyzer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TIHapticsUsageAnalyzer *)v2 registerEventSpec];
  }
  return v3;
}

+ (id)bucketForTime:(double)a3
{
  v4 = [a1 idleTimeBuckets];
  objc_super v5 = v4;
  uint64_t v6 = (uint64_t)(a3 + a3);
  if (v6 <= 1) {
    uint64_t v6 = 1;
  }
  unint64_t v7 = v6 - 1;
  uint64_t v8 = [v4 count];
  if (v8 - 1 >= v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = v8 - 1;
  }
  double v10 = [v5 objectAtIndexedSubscript:v9];

  return v10;
}

+ (id)idleTimeBuckets
{
  return &unk_1F3FA76B8;
}

@end