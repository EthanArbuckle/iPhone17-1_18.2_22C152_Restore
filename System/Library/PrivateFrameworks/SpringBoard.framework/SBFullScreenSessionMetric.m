@interface SBFullScreenSessionMetric
- (BOOL)_sendCoreAnalyticsEventWithStartReason:(id)a3 endReason:(id)a4 duration:(double)a5 primaryBundleIdentifier:(id)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8;
- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4;
- (NSString)primaryBundleIdentifier;
- (NSString)sideBundleIdentifier;
- (NSString)startReason;
- (SBFullScreenSessionMetric)init;
- (double)startTimestamp;
- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4;
- (void)setPrimaryBundleIdentifier:(id)a3;
- (void)setSideBundleIdentifier:(id)a3;
- (void)setStartReason:(id)a3;
- (void)setStartTimestamp:(double)a3;
@end

@implementation SBFullScreenSessionMetric

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    v7 = [v5 eventPayload];
    uint64_t v17 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:1 fromContext:v6];
    v18 = (void *)v17;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = &stru_1F3084718;
    }
    v20 = v19;

    uint64_t v21 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:2 fromContext:v6];
    v22 = (void *)v21;
    if (v21) {
      v23 = (__CFString *)v21;
    }
    else {
      v23 = &stru_1F3084718;
    }
    v24 = v23;

    [*(id *)(a1 + 32) setPrimaryBundleIdentifier:v20];
    [*(id *)(a1 + 32) setSideBundleIdentifier:v24];
    v25 = [*(id *)(a1 + 32) primaryBundleIdentifier];
    uint64_t v26 = [v25 length];

    v27 = [*(id *)(a1 + 32) sideBundleIdentifier];
    uint64_t v28 = [v27 length];

    if (!v26 || v28)
    {

LABEL_24:
      uint64_t v33 = 0;
      goto LABEL_25;
    }
    v29 = *(void **)(a1 + 32);
    [v7 timestamp];
    objc_msgSend(v29, "setStartTimestamp:");
    v30 = *(void **)(a1 + 32);
    v31 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75C0]];
    v32 = SBMainWorkspaceTransitionSourceDescription([v31 integerValue]);
    [v30 setStartReason:v32];

LABEL_21:
    uint64_t v33 = 1;
LABEL_25:

    goto LABEL_26;
  }
  if (a2 == 48)
  {
    v7 = [v5 eventPayload];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75D8]];
    uint64_t v9 = [v8 unsignedIntegerValue];

    v10 = [*(id *)(a1 + 32) primaryBundleIdentifier];
    uint64_t v11 = [v10 length];

    v12 = [*(id *)(a1 + 32) sideBundleIdentifier];
    uint64_t v13 = [v12 length];

    if (v9) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v11 == 0;
    }
    if (v14 || v13 != 0) {
      goto LABEL_24;
    }
    v16 = *(void **)(a1 + 32);
    [v7 timestamp];
    objc_msgSend(v16, "setStartTimestamp:");
    [*(id *)(a1 + 32) setStartReason:@"Unlock"];
    goto LABEL_21;
  }
  uint64_t v33 = 0;
LABEL_26:

  return v33;
}

- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4
{
  id v5 = [a4 eventPayload];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA75A0]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__SBFullScreenSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v10[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v10[4] = a3;
  v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v8 = [v7 objectForKey:*MEMORY[0x1E4FA7580]];

  return v8;
}

- (NSString)sideBundleIdentifier
{
  return self->_sideBundleIdentifier;
}

- (void)setSideBundleIdentifier:(id)a3
{
}

- (void)setPrimaryBundleIdentifier:(id)a3
{
}

- (NSString)primaryBundleIdentifier
{
  return self->_primaryBundleIdentifier;
}

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    v20 = [v5 eventPayload];
    uint64_t v21 = [*(id *)(a1 + 32) primaryBundleIdentifier];
    uint64_t v22 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:1 fromContext:v6];
    v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = &stru_1F3084718;
    }
    v25 = v24;

    uint64_t v26 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:2 fromContext:v6];
    v27 = (void *)v26;
    if (v26) {
      uint64_t v28 = (__CFString *)v26;
    }
    else {
      uint64_t v28 = &stru_1F3084718;
    }
    v29 = v28;

    [*(id *)(a1 + 32) setPrimaryBundleIdentifier:v25];
    [*(id *)(a1 + 32) setSideBundleIdentifier:v29];
    v30 = [*(id *)(a1 + 32) startReason];
    v31 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4FA75C0]];
    v54 = SBMainWorkspaceTransitionSourceDescription([v31 integerValue]);

    [v20 timestamp];
    double v33 = v32;
    [*(id *)(a1 + 32) startTimestamp];
    double v35 = v33 - v34;
    char v36 = [(id)SBApp isHardwareKeyboardAttached];
    if ([(__CFString *)v25 length] && ![(__CFString *)v29 length])
    {
      if ([(__CFString *)v25 isEqualToString:v21])
      {
        uint64_t v19 = 0;
        int v47 = 1;
LABEL_15:

        if (!v47) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      v51 = v21;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __33__SBFullScreenSessionMetric_init__block_invoke_4;
      v61[3] = &unk_1E6AF8B68;
      v42 = &v62;
      id v62 = *(id *)(a1 + 32);
      v46 = &v63;
      v53 = v30;
      id v63 = v30;
      v52 = &v64;
      id v50 = v54;
      id v64 = v50;
      *(double *)&v65[1] = v35;
      v43 = (id *)v65;
      v44 = v51;
      v65[0] = v51;
      char v66 = v36;
      [v6 stateForQueryName:5 completion:v61];
      v49 = *(void **)(a1 + 32);
      [v20 timestamp];
      objc_msgSend(v49, "setStartTimestamp:");
      [*(id *)(a1 + 32) setStartReason:v50];
      uint64_t v19 = 1;
    }
    else
    {
      char v37 = v36;
      v38 = v25;
      v39 = v29;
      v40 = v20;
      v41 = v21;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __33__SBFullScreenSessionMetric_init__block_invoke_5;
      v55[3] = &unk_1E6AF8B68;
      v42 = &v56;
      id v56 = *(id *)(a1 + 32);
      v53 = v30;
      id v57 = v30;
      v52 = &v58;
      id v58 = v54;
      *(double *)&v59[1] = v35;
      v43 = (id *)v59;
      v44 = v41;
      id v45 = v41;
      v20 = v40;
      v29 = v39;
      v25 = v38;
      v59[0] = v45;
      char v60 = v37;
      v46 = &v57;
      [v6 stateForQueryName:5 completion:v55];
      uint64_t v19 = 0;
    }

    int v47 = 0;
    uint64_t v21 = v44;
    v30 = v53;
    goto LABEL_15;
  }
  if (a2 != 48)
  {
LABEL_18:
    uint64_t v19 = 1;
    goto LABEL_19;
  }
  v7 = [v5 eventPayload];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75D8]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (!v9)
  {

    goto LABEL_18;
  }
  v10 = [*(id *)(a1 + 32) startReason];
  [v7 timestamp];
  double v12 = v11;
  [*(id *)(a1 + 32) startTimestamp];
  double v14 = v12 - v13;
  v15 = [*(id *)(a1 + 32) primaryBundleIdentifier];
  char v16 = [(id)SBApp isHardwareKeyboardAttached];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __33__SBFullScreenSessionMetric_init__block_invoke_3;
  v67[3] = &unk_1E6AF8B68;
  id v68 = *(id *)(a1 + 32);
  id v69 = v10;
  double v72 = v14;
  v70 = @"Lock";
  id v71 = v15;
  char v73 = v16;
  id v17 = v15;
  id v18 = v10;
  [v6 stateForQueryName:5 completion:v67];

  uint64_t v19 = 0;
LABEL_19:

  return v19;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (void)setStartReason:(id)a3
{
}

BOOL __83__SBFullScreenSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:*MEMORY[0x1E4FA7598]];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

- (SBFullScreenSessionMetric)init
{
  v19.receiver = self;
  v19.super_class = (Class)SBFullScreenSessionMetric;
  v2 = [(SBAnalyticsStateMachineEventHandler *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v2->_startTimestamp = 0.0;
    startReason = v2->_startReason;
    v2->_startReason = (NSString *)&stru_1F3084718;

    primaryBundleIdentifier = v3->_primaryBundleIdentifier;
    v3->_primaryBundleIdentifier = (NSString *)&stru_1F3084718;

    sideBundleIdentifier = v3->_sideBundleIdentifier;
    v3->_sideBundleIdentifier = (NSString *)&stru_1F3084718;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __33__SBFullScreenSessionMetric_init__block_invoke;
    v17[3] = &unk_1E6AF4C08;
    v7 = v3;
    id v18 = v7;
    v8 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v17];
    [(SBAnalyticsStateMachineEventHandler *)v7 addEdge:v8];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __33__SBFullScreenSessionMetric_init__block_invoke_2;
    v15 = &unk_1E6AF4C08;
    uint64_t v9 = v7;
    char v16 = v9;
    v10 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:&v12];
    -[SBAnalyticsStateMachineEventHandler addEdge:](v9, "addEdge:", v10, v12, v13, v14, v15);
  }
  return v3;
}

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  return [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v8 duration:v9 primaryBundleIdentifier:v4 doNotDisturbActive:v10 hardwareKeyboardAttached:v7];
}

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  return [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v8 duration:v9 primaryBundleIdentifier:v4 doNotDisturbActive:v10 hardwareKeyboardAttached:v7];
}

uint64_t __33__SBFullScreenSessionMetric_init__block_invoke_5(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  return [v5 _sendCoreAnalyticsEventWithStartReason:v6 endReason:v8 duration:v9 primaryBundleIdentifier:v4 doNotDisturbActive:v10 hardwareKeyboardAttached:v7];
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v7 = a4;
  id v4 = v7;
  char v5 = AnalyticsSendEventLazy();

  return v5;
}

id __68__SBFullScreenSessionMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)_sendCoreAnalyticsEventWithStartReason:(id)a3 endReason:(id)a4 duration:(double)a5 primaryBundleIdentifier:(id)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8
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
  v23[3] = @"PrimaryBundleID";
  v23[4] = @"IsDoNotDisturbActive";
  objc_super v19 = [NSNumber numberWithBool:v9];
  v24[4] = v19;
  v23[5] = @"IsHardwareKeyboardAttached";
  v20 = [NSNumber numberWithBool:v8];
  v24[5] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

  LOBYTE(self) = [(SBFullScreenSessionMetric *)self sendCoreAnalyticsEventWithName:@"com.apple.SpringBoard.Analytics.SingleAppSession" payload:v21];
  return (char)self;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (NSString)startReason
{
  return self->_startReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_startReason, 0);
}

@end