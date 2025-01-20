@interface SBCenterWindowSessionMetric
- (BOOL)_sendCoreAnalyticsEventWithStartReason:(id)a3 endReason:(id)a4 duration:(double)a5 centerBundleIdentifier:(id)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8;
- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4;
- (NSString)centerBundleIdentifier;
- (NSString)startReason;
- (SBCenterWindowSessionMetric)initWithHeartbeatMetricPersistence:(id)a3;
- (double)startTimestamp;
- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4;
- (void)setCenterBundleIdentifier:(id)a3;
- (void)setStartReason:(id)a3;
- (void)setStartTimestamp:(double)a3;
@end

@implementation SBCenterWindowSessionMetric

uint64_t __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    v7 = [v5 eventPayload];
    uint64_t v14 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:4 fromContext:v6];
    v15 = (void *)v14;
    v16 = &stru_1F3084718;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v17 = v16;

    [*(id *)(a1 + 32) setCenterBundleIdentifier:v17];
    v18 = [*(id *)(a1 + 32) centerBundleIdentifier];
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

    v10 = [*(id *)(a1 + 32) centerBundleIdentifier];
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

- (void)setCenterBundleIdentifier:(id)a3
{
}

- (NSString)centerBundleIdentifier
{
  return self->_centerBundleIdentifier;
}

- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4
{
  id v5 = [a4 eventPayload];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA75A0]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SBCenterWindowSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v10[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v10[4] = a3;
  v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v8 = [v7 objectForKey:*MEMORY[0x1E4FA7580]];

  return v8;
}

BOOL __85__SBCenterWindowSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:*MEMORY[0x1E4FA7598]];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

- (SBCenterWindowSessionMetric)initWithHeartbeatMetricPersistence:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBCenterWindowSessionMetric;
  id v5 = [(SBAnalyticsStateMachineEventHandler *)&v19 init];
  v6 = v5;
  if (v5)
  {
    v5->_startTimestamp = 0.0;
    startReason = v5->_startReason;
    v5->_startReason = (NSString *)&stru_1F3084718;

    centerBundleIdentifier = v6->_centerBundleIdentifier;
    v6->_centerBundleIdentifier = (NSString *)&stru_1F3084718;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke;
    v17[3] = &unk_1E6AF4C08;
    uint64_t v9 = v6;
    v18 = v9;
    v10 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v17];
    [(SBAnalyticsStateMachineEventHandler *)v9 addEdge:v10];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2;
    v14[3] = &unk_1E6AF8B90;
    uint64_t v11 = v9;
    v15 = v11;
    id v16 = v4;
    BOOL v12 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v14];
    [(SBAnalyticsStateMachineEventHandler *)v11 addEdge:v12];
  }
  return v6;
}

uint64_t __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    v20 = [v5 eventPayload];
    v21 = [*(id *)(a1 + 32) centerBundleIdentifier];
    uint64_t v22 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:4 fromContext:v6];
    v23 = (void *)v22;
    uint64_t v24 = &stru_1F3084718;
    if (v22) {
      uint64_t v24 = (__CFString *)v22;
    }
    v25 = v24;

    [*(id *)(a1 + 32) setCenterBundleIdentifier:v25];
    v26 = [*(id *)(a1 + 32) startReason];
    v27 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4FA75C0]];
    v28 = SBMainWorkspaceTransitionSourceDescription([v27 integerValue]);

    [v20 timestamp];
    double v30 = v29;
    [*(id *)(a1 + 32) startTimestamp];
    double v32 = v30 - v31;
    char v33 = [(id)SBApp isHardwareKeyboardAttached];
    if ([(__CFString *)v25 length])
    {
      if ([(__CFString *)v25 isEqualToString:v21])
      {
        v34 = v26;
        uint64_t v19 = 0;
        int v35 = 1;
        goto LABEL_14;
      }
      [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"CenterWindowSession" duration:v32];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4;
      v52[3] = &unk_1E6AF8B68;
      v44 = &v53;
      id v53 = *(id *)(a1 + 32);
      v43 = &v54;
      v34 = v26;
      id v54 = v26;
      v36 = &v55;
      v45 = v28;
      v38 = v21;
      id v39 = v28;
      id v55 = v39;
      *(double *)&v56[1] = v32;
      v37 = (id *)v56;
      v56[0] = v38;
      char v57 = v33;
      [v6 stateForQueryName:5 completion:v52];
      v40 = *(void **)(a1 + 32);
      [v20 timestamp];
      objc_msgSend(v40, "setStartTimestamp:");
      id v41 = v39;
      v21 = v38;
      [*(id *)(a1 + 32) setStartReason:v41];
      uint64_t v19 = 1;
    }
    else
    {
      [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"CenterWindowSession" duration:v32];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5;
      v46[3] = &unk_1E6AF8B68;
      v44 = &v47;
      id v47 = *(id *)(a1 + 32);
      v43 = &v48;
      v34 = v26;
      id v48 = v26;
      v36 = &v49;
      v45 = v28;
      id v49 = v28;
      *(double *)&v50[1] = v32;
      v37 = (id *)v50;
      v50[0] = v21;
      char v51 = v33;
      [v6 stateForQueryName:5 completion:v46];
      uint64_t v19 = 0;
    }

    int v35 = 0;
    v28 = v45;
LABEL_14:

    if (!v35) {
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v19 = 1;
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
  v15 = [*(id *)(a1 + 32) centerBundleIdentifier];
  char v16 = [(id)SBApp isHardwareKeyboardAttached];
  [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"CenterWindowSession" duration:v14];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3;
  v58[3] = &unk_1E6AF8B68;
  id v59 = *(id *)(a1 + 32);
  id v60 = v10;
  double v63 = v14;
  v61 = @"Lock";
  id v62 = v15;
  char v64 = v16;
  id v17 = v15;
  id v18 = v10;
  [v6 stateForQueryName:5 completion:v58];

  uint64_t v19 = 0;
LABEL_16:

  return v19;
}

uint64_t __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  return [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v8 duration:v9 centerBundleIdentifier:v4 doNotDisturbActive:v10 hardwareKeyboardAttached:v7];
}

uint64_t __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  return [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v8 duration:v9 centerBundleIdentifier:v4 doNotDisturbActive:v10 hardwareKeyboardAttached:v7];
}

uint64_t __66__SBCenterWindowSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  return [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v8 duration:v9 centerBundleIdentifier:v4 doNotDisturbActive:v10 hardwareKeyboardAttached:v7];
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v7 = a4;
  id v4 = v7;
  char v5 = AnalyticsSendEventLazy();

  return v5;
}

id __70__SBCenterWindowSessionMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)_sendCoreAnalyticsEventWithStartReason:(id)a3 endReason:(id)a4 duration:(double)a5 centerBundleIdentifier:(id)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8
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
  id v18 = [v14 numberWithDouble:a5];
  v24[2] = v18;
  v24[3] = v15;
  v23[3] = @"CenterBundleID";
  v23[4] = @"IsDoNotDisturbActive";
  uint64_t v19 = [NSNumber numberWithBool:v9];
  v24[4] = v19;
  v23[5] = @"IsHardwareKeyboardAttached";
  v20 = [NSNumber numberWithBool:v8];
  v24[5] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

  LOBYTE(self) = [(SBCenterWindowSessionMetric *)self sendCoreAnalyticsEventWithName:@"com.apple.SpringBoard.Analytics.CenterWindowSession" payload:v21];
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
  objc_storeStrong((id *)&self->_centerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_startReason, 0);
}

@end