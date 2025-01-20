@interface SBStageManagerEnablementMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 source:(int64_t)a4;
- (SBFAnalyticsClient)analyticsClient;
- (SBStageManagerEnablementMetric)init;
- (SBStageManagerEnablementMetric)initWithAnalyticsClient:(id)a3;
- (id)chamoisPreferencesSnapshotWithSource:(int64_t)a3;
@end

@implementation SBStageManagerEnablementMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 == 11)
  {
    uint64_t v10 = 0;
  }
  else
  {
    if (a3 != 60)
    {
      BOOL v11 = 0;
      goto LABEL_7;
    }
    v8 = [v6 eventPayload];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FA7620]];
    uint64_t v10 = [v9 integerValue];
  }
  [(SBStageManagerEnablementMetric *)self sendCoreAnalyticsEventWithName:@"com.apple.SpringBoard.StageManager" source:v10];
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (SBStageManagerEnablementMetric)initWithAnalyticsClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBStageManagerEnablementMetric;
  id v6 = [(SBStageManagerEnablementMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_analyticsClient, a3);
  }

  return v7;
}

- (SBStageManagerEnablementMetric)init
{
  v3 = [MEMORY[0x1E4FA5E78] sharedInstance];
  v4 = [(SBStageManagerEnablementMetric *)self initWithAnalyticsClient:v3];

  return v4;
}

- (id)chamoisPreferencesSnapshotWithSource:(int64_t)a3
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v4 = +[SBDefaults localDefaults];
  id v5 = [v4 appSwitcherDefaults];

  uint64_t v6 = [v5 chamoisWindowingEnabled];
  uint64_t v7 = [v5 chamoisHideStrips];
  uint64_t v8 = [v5 chamoisHideDock];
  uint64_t v9 = [v5 chamoisHideStripsExternal];
  uint64_t v10 = [v5 chamoisHideDockExternal];
  v19[0] = @"StageManagerEnablement";
  BOOL v11 = [NSNumber numberWithBool:v6];
  v20[0] = v11;
  v19[1] = @"EmbeddedStripHidden";
  v12 = [NSNumber numberWithBool:v7];
  v20[1] = v12;
  v19[2] = @"EmbeddedDockHidden";
  v13 = [NSNumber numberWithBool:v8];
  v20[2] = v13;
  v19[3] = @"ExternalStripHidden";
  v14 = [NSNumber numberWithBool:v9];
  v20[3] = v14;
  v19[4] = @"ExternalDockHidden";
  v15 = [NSNumber numberWithBool:v10];
  v20[4] = v15;
  v19[5] = @"StageManagerPreferenceChangingSource";
  v16 = [NSNumber numberWithInteger:a3];
  v20[5] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];

  return v17;
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBStageManagerEnablementMetric *)self chamoisPreferencesSnapshotWithSource:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v14 = v7;
    char v9 = AnalyticsSendEventLazy();

    if (v9)
    {
      BOOL v10 = 1;
      goto LABEL_9;
    }
    BOOL v11 = @"CoreAnalytics sending failed";
  }
  else
  {
    BOOL v11 = @"Missing payload";
  }
  v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[SBStageManagerEnablementMetric sendCoreAnalyticsEventWithName:source:]((uint64_t)v11, v12);
  }

  BOOL v10 = 0;
LABEL_9:

  return v10;
}

id __72__SBStageManagerEnablementMetric_sendCoreAnalyticsEventWithName_source___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (SBFAnalyticsClient)analyticsClient
{
  return self->_analyticsClient;
}

- (void).cxx_destruct
{
}

- (void)sendCoreAnalyticsEventWithName:(uint64_t)a1 source:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to log Stage Manager preferences with reason: %@.", (uint8_t *)&v2, 0xCu);
}

@end