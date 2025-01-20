@interface SBSlideOverSessionMetric
- (BOOL)_sendCoreAnalyticsEventWithStartReason:(id)a3 endReason:(id)a4 duration:(double)a5 floatingBundleIdentifier:(id)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8;
- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4;
- (NSString)floatingBundleIdentifier;
- (NSString)startReason;
- (SBSlideOverSessionMetric)initWithHeartbeatMetricPersistence:(id)a3;
- (double)startTimestamp;
- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4;
- (void)setFloatingBundleIdentifier:(id)a3;
- (void)setStartReason:(id)a3;
- (void)setStartTimestamp:(double)a3;
@end

@implementation SBSlideOverSessionMetric

uint64_t __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    v7 = [v5 eventPayload];
    uint64_t v14 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:3 fromContext:v6];
    v15 = (void *)v14;
    v16 = &stru_1F3084718;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v17 = v16;

    [*(id *)(a1 + 32) setFloatingBundleIdentifier:v17];
    v18 = [*(id *)(a1 + 32) floatingBundleIdentifier];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      v20 = *(void **)(a1 + 32);
      [v7 timestamp];
      objc_msgSend(v20, "setStartTimestamp:");
      v21 = *(void **)(a1 + 32);
      v22 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75C0]];
      v23 = SBMainWorkspaceTransitionSourceDescription([v22 integerValue]);
      [v21 setStartReason:v23];

      goto LABEL_12;
    }

LABEL_15:
    uint64_t v24 = 0;
    goto LABEL_16;
  }
  if (a2 == 48)
  {
    v7 = [v5 eventPayload];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75D8]];
    uint64_t v9 = [v8 unsignedIntegerValue];

    v10 = [*(id *)(a1 + 32) floatingBundleIdentifier];
    uint64_t v11 = [v10 length];

    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v11 == 0;
    }
    if (!v12)
    {
      v13 = *(void **)(a1 + 32);
      [v7 timestamp];
      objc_msgSend(v13, "setStartTimestamp:");
      [*(id *)(a1 + 32) setStartReason:@"Unlock"];
LABEL_12:
      uint64_t v24 = 1;
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_15;
  }
  uint64_t v24 = 0;
LABEL_17:

  return v24;
}

- (void)setFloatingBundleIdentifier:(id)a3
{
}

- (NSString)floatingBundleIdentifier
{
  return self->_floatingBundleIdentifier;
}

- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4
{
  id v5 = [a4 eventPayload];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA75A0]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__SBSlideOverSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v10[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v10[4] = a3;
  v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v8 = [v7 objectForKey:*MEMORY[0x1E4FA7580]];

  return v8;
}

BOOL __82__SBSlideOverSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:*MEMORY[0x1E4FA7598]];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

- (SBSlideOverSessionMetric)initWithHeartbeatMetricPersistence:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSlideOverSessionMetric;
  id v5 = [(SBAnalyticsStateMachineEventHandler *)&v19 init];
  v6 = v5;
  if (v5)
  {
    v5->_startTimestamp = 0.0;
    startReason = v5->_startReason;
    v5->_startReason = (NSString *)&stru_1F3084718;

    floatingBundleIdentifier = v6->_floatingBundleIdentifier;
    v6->_floatingBundleIdentifier = (NSString *)&stru_1F3084718;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke;
    v17[3] = &unk_1E6AF4C08;
    uint64_t v9 = v6;
    v18 = v9;
    v10 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v17];
    [(SBAnalyticsStateMachineEventHandler *)v9 addEdge:v10];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2;
    v14[3] = &unk_1E6AF8B90;
    uint64_t v11 = v9;
    v15 = v11;
    id v16 = v4;
    BOOL v12 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v14];
    [(SBAnalyticsStateMachineEventHandler *)v11 addEdge:v12];
  }
  return v6;
}

uint64_t __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    v18 = [v5 eventPayload];
    objc_super v19 = [*(id *)(a1 + 32) floatingBundleIdentifier];
    uint64_t v20 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:3 fromContext:v6];
    v21 = (void *)v20;
    v22 = &stru_1F3084718;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    v23 = v22;

    [*(id *)(a1 + 32) setFloatingBundleIdentifier:v23];
    uint64_t v24 = [*(id *)(a1 + 32) startReason];
    v25 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4FA75C0]];
    v26 = SBMainWorkspaceTransitionSourceDescription([v25 integerValue]);

    [v18 timestamp];
    double v28 = v27;
    [*(id *)(a1 + 32) startTimestamp];
    double v30 = v28 - v29;
    char v31 = [(id)SBApp isHardwareKeyboardAttached];
    if ([(__CFString *)v23 length])
    {
      if ([(__CFString *)v23 isEqualToString:v19])
      {
        v32 = v24;
        uint64_t v17 = 0;
        int v33 = 1;
        goto LABEL_14;
      }
      [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"SlideOverSession" duration:v30];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4;
      v50[3] = &unk_1E6AF8B68;
      v42 = &v51;
      id v51 = *(id *)(a1 + 32);
      v41 = &v52;
      v32 = v24;
      id v52 = v24;
      v34 = &v53;
      v43 = v26;
      v36 = v19;
      id v37 = v26;
      id v53 = v37;
      *(double *)&v54[1] = v30;
      v35 = (id *)v54;
      v54[0] = v36;
      char v55 = v31;
      [v6 stateForQueryName:5 completion:v50];
      v38 = *(void **)(a1 + 32);
      [v18 timestamp];
      objc_msgSend(v38, "setStartTimestamp:");
      id v39 = v37;
      objc_super v19 = v36;
      [*(id *)(a1 + 32) setStartReason:v39];
      uint64_t v17 = 1;
    }
    else
    {
      [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"SlideOverSession" duration:v30];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5;
      v44[3] = &unk_1E6AF8B68;
      v42 = &v45;
      id v45 = *(id *)(a1 + 32);
      v41 = &v46;
      v32 = v24;
      id v46 = v24;
      v34 = &v47;
      v43 = v26;
      id v47 = v26;
      *(double *)&v48[1] = v30;
      v35 = (id *)v48;
      v48[0] = v19;
      char v49 = v31;
      [v6 stateForQueryName:5 completion:v44];
      uint64_t v17 = 0;
    }

    int v33 = 0;
    v26 = v43;
LABEL_14:

    if (!v33) {
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v17 = 1;
    goto LABEL_16;
  }
  if (a2 != 48) {
    goto LABEL_15;
  }
  v7 = [v5 eventPayload];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75D8]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (!v9)
  {

    goto LABEL_15;
  }
  v10 = [*(id *)(a1 + 32) startReason];
  [v7 timestamp];
  double v12 = v11;
  [*(id *)(a1 + 32) startTimestamp];
  double v14 = v12 - v13;
  char v15 = [(id)SBApp isHardwareKeyboardAttached];
  [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"SlideOverSession" duration:v14];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3;
  v56[3] = &unk_1E6AF8B40;
  id v57 = *(id *)(a1 + 32);
  id v58 = v10;
  v59 = @"Lock";
  double v60 = v14;
  char v61 = v15;
  id v16 = v10;
  [v6 stateForQueryName:5 completion:v56];

  uint64_t v17 = 0;
LABEL_16:

  return v17;
}

void __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  double v8 = *(double *)(a1 + 56);
  id v9 = [v5 floatingBundleIdentifier];
  [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v7 duration:v9 floatingBundleIdentifier:v4 doNotDisturbActive:*(unsigned __int8 *)(a1 + 64) hardwareKeyboardAttached:v8];
}

uint64_t __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  return [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v8 duration:v9 floatingBundleIdentifier:v4 doNotDisturbActive:v10 hardwareKeyboardAttached:v7];
}

uint64_t __63__SBSlideOverSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  return [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v8 duration:v9 floatingBundleIdentifier:v4 doNotDisturbActive:v10 hardwareKeyboardAttached:v7];
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v7 = a4;
  id v4 = v7;
  char v5 = AnalyticsSendEventLazy();

  return v5;
}

id __67__SBSlideOverSessionMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)_sendCoreAnalyticsEventWithStartReason:(id)a3 endReason:(id)a4 duration:(double)a5 floatingBundleIdentifier:(id)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  v24[6] = *MEMORY[0x1E4F143B8];
  v23[0] = @"StartReason";
  v23[1] = @"EndReason";
  v24[0] = a3;
  v24[1] = a4;
  v23[2] = @"Duration";
  double v14 = NSNumber;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  v18 = [v14 numberWithDouble:a5];
  v24[2] = v18;
  v24[3] = v15;
  v23[3] = @"FloatingBundleID";
  v23[4] = @"IsDoNotDisturbActive";
  objc_super v19 = [NSNumber numberWithBool:v9];
  v24[4] = v19;
  v23[5] = @"IsHardwareKeyboardAttached";
  uint64_t v20 = [NSNumber numberWithBool:v8];
  v24[5] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

  LOBYTE(self) = [(SBSlideOverSessionMetric *)self sendCoreAnalyticsEventWithName:@"com.apple.SpringBoard.Analytics.SlideOverSession" payload:v21];
  return (char)self;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (NSString)startReason
{
  return self->_startReason;
}

- (void)setStartReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_startReason, 0);
}

@end