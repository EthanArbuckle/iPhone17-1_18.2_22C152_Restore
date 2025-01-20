@interface SBSplitViewSessionMetric
- (BOOL)_sendAggregateSessionCoreAnalyticsEventWithIdentifier:(id)a3 startReason:(id)a4 endReason:(id)a5 duration:(double)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8;
- (BOOL)_sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:(id)a3 startReason:(id)a4 endReason:(id)a5 duration:(double)a6 primaryBundleIdentifier:(id)a7 sideBundleIdentifier:(id)a8 doNotDisturbActive:(BOOL)a9 hardwareKeyboardAttached:(BOOL)a10;
- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4;
- (NSString)aggregateSessionStartReason;
- (NSString)individualSessionPrimaryBundleIdentifier;
- (NSString)individualSessionSideBundleIdentifier;
- (NSString)individualSessionStartReason;
- (NSUUID)aggregateSessionIdentifier;
- (SBSplitViewSessionMetric)initWithHeartbeatMetricPersistence:(id)a3;
- (double)aggregateSessionStartTimestamp;
- (double)individualSessionStartTimestamp;
- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4;
- (void)setAggregateSessionIdentifier:(id)a3;
- (void)setAggregateSessionStartReason:(id)a3;
- (void)setAggregateSessionStartTimestamp:(double)a3;
- (void)setIndividualSessionPrimaryBundleIdentifier:(id)a3;
- (void)setIndividualSessionSideBundleIdentifier:(id)a3;
- (void)setIndividualSessionStartReason:(id)a3;
- (void)setIndividualSessionStartTimestamp:(double)a3;
@end

@implementation SBSplitViewSessionMetric

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 5)
  {
    v7 = [v5 eventPayload];
    uint64_t v20 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:1 fromContext:v6];
    v21 = (void *)v20;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    else {
      v22 = &stru_1F3084718;
    }
    v23 = v22;

    uint64_t v24 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:2 fromContext:v6];
    v25 = (void *)v24;
    if (v24) {
      v26 = (__CFString *)v24;
    }
    else {
      v26 = &stru_1F3084718;
    }
    v27 = v26;

    [*(id *)(a1 + 32) setIndividualSessionPrimaryBundleIdentifier:v23];
    [*(id *)(a1 + 32) setIndividualSessionSideBundleIdentifier:v27];
    v28 = [*(id *)(a1 + 32) individualSessionPrimaryBundleIdentifier];
    uint64_t v29 = [v28 length];

    v30 = [*(id *)(a1 + 32) individualSessionSideBundleIdentifier];
    uint64_t v31 = [v30 length];

    if (v29 && v31)
    {
      [v7 timestamp];
      double v33 = v32;
      v34 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75C0]];
      v35 = SBMainWorkspaceTransitionSourceDescription([v34 integerValue]);

      v36 = *(void **)(a1 + 32);
      v37 = [MEMORY[0x1E4F29128] UUID];
      [v36 setAggregateSessionIdentifier:v37];

      [*(id *)(a1 + 32) setAggregateSessionStartTimestamp:v33];
      [*(id *)(a1 + 32) setAggregateSessionStartReason:v35];
      [*(id *)(a1 + 32) setIndividualSessionStartTimestamp:v33];
      [*(id *)(a1 + 32) setIndividualSessionStartReason:v35];

      goto LABEL_20;
    }

LABEL_23:
    uint64_t v38 = 0;
    goto LABEL_24;
  }
  if (a2 == 48)
  {
    v7 = [v5 eventPayload];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75D8]];
    uint64_t v9 = [v8 unsignedIntegerValue];

    v10 = [*(id *)(a1 + 32) individualSessionPrimaryBundleIdentifier];
    uint64_t v11 = [v10 length];

    v12 = [*(id *)(a1 + 32) individualSessionSideBundleIdentifier];
    uint64_t v13 = [v12 length];

    if (v9) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v11 == 0;
    }
    if (!v14 && v13 != 0)
    {
      [v7 timestamp];
      double v17 = v16;
      v18 = *(void **)(a1 + 32);
      v19 = [MEMORY[0x1E4F29128] UUID];
      [v18 setAggregateSessionIdentifier:v19];

      [*(id *)(a1 + 32) setAggregateSessionStartTimestamp:v17];
      [*(id *)(a1 + 32) setAggregateSessionStartReason:@"Unlock"];
      [*(id *)(a1 + 32) setIndividualSessionStartTimestamp:v17];
      [*(id *)(a1 + 32) setIndividualSessionStartReason:@"Unlock"];
LABEL_20:
      uint64_t v38 = 1;
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_23;
  }
  uint64_t v38 = 0;
LABEL_25:

  return v38;
}

- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4
{
  id v5 = [a4 eventPayload];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA75A0]];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__SBSplitViewSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v10[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v10[4] = a3;
  v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v8 = [v7 objectForKey:*MEMORY[0x1E4FA7580]];

  return v8;
}

- (void)setIndividualSessionSideBundleIdentifier:(id)a3
{
}

- (void)setIndividualSessionPrimaryBundleIdentifier:(id)a3
{
}

- (NSString)individualSessionSideBundleIdentifier
{
  return self->_individualSessionSideBundleIdentifier;
}

- (NSString)individualSessionPrimaryBundleIdentifier
{
  return self->_individualSessionPrimaryBundleIdentifier;
}

BOOL __82__SBSplitViewSessionMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:*MEMORY[0x1E4FA7598]];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

- (SBSplitViewSessionMetric)initWithHeartbeatMetricPersistence:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBSplitViewSessionMetric;
  id v5 = [(SBAnalyticsStateMachineEventHandler *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    aggregateSessionIdentifier = v5->_aggregateSessionIdentifier;
    v5->_aggregateSessionIdentifier = (NSUUID *)v6;

    v5->_aggregateSessionStartTimestamp = 0.0;
    aggregateSessionStartReason = v5->_aggregateSessionStartReason;
    v5->_aggregateSessionStartReason = (NSString *)&stru_1F3084718;

    v5->_individualSessionStartTimestamp = 0.0;
    individualSessionStartReason = v5->_individualSessionStartReason;
    v5->_individualSessionStartReason = (NSString *)&stru_1F3084718;

    individualSessionPrimaryBundleIdentifier = v5->_individualSessionPrimaryBundleIdentifier;
    v5->_individualSessionPrimaryBundleIdentifier = (NSString *)&stru_1F3084718;

    individualSessionSideBundleIdentifier = v5->_individualSessionSideBundleIdentifier;
    v5->_individualSessionSideBundleIdentifier = (NSString *)&stru_1F3084718;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke;
    v20[3] = &unk_1E6AF4C08;
    v12 = v5;
    v21 = v12;
    uint64_t v13 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v20];
    [(SBAnalyticsStateMachineEventHandler *)v12 addEdge:v13];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2;
    v17[3] = &unk_1E6AF8B90;
    BOOL v14 = v12;
    v18 = v14;
    id v19 = v4;
    v15 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v17];
    [(SBAnalyticsStateMachineEventHandler *)v14 addEdge:v15];
  }
  return v5;
}

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2 == 5)
  {
    uint64_t v29 = [v5 eventPayload];
    v70 = [*(id *)(a1 + 32) individualSessionPrimaryBundleIdentifier];
    v68 = [*(id *)(a1 + 32) individualSessionSideBundleIdentifier];
    uint64_t v30 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:1 fromContext:v6];
    uint64_t v31 = (void *)v30;
    if (v30) {
      double v32 = (__CFString *)v30;
    }
    else {
      double v32 = &stru_1F3084718;
    }
    double v33 = v32;

    uint64_t v34 = [*(id *)(a1 + 32) _bundleIdentifierForElementWithLayoutRole:2 fromContext:v6];
    v35 = (void *)v34;
    if (v34) {
      v36 = (__CFString *)v34;
    }
    else {
      v36 = &stru_1F3084718;
    }
    v37 = v36;

    [*(id *)(a1 + 32) setIndividualSessionPrimaryBundleIdentifier:v33];
    [*(id *)(a1 + 32) setIndividualSessionSideBundleIdentifier:v37];
    [v29 timestamp];
    double v39 = v38;
    v40 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4FA75C0]];
    v41 = SBMainWorkspaceTransitionSourceDescription([v40 integerValue]);

    v42 = [*(id *)(a1 + 32) aggregateSessionIdentifier];
    v43 = [v42 UUIDString];

    v44 = [*(id *)(a1 + 32) aggregateSessionStartReason];
    [*(id *)(a1 + 32) aggregateSessionStartTimestamp];
    double v46 = v45;
    v69 = [*(id *)(a1 + 32) individualSessionStartReason];
    [*(id *)(a1 + 32) individualSessionStartTimestamp];
    double v48 = v39 - v47;
    char v49 = [(id)SBApp isHardwareKeyboardAttached];
    v67 = v44;
    if ([(__CFString *)v33 length] && [(__CFString *)v37 length])
    {
      if ([(__CFString *)v33 isEqualToString:v70]
        && ([(__CFString *)v37 isEqualToString:v68] & 1) != 0)
      {
        uint64_t v28 = 0;
        int v50 = 1;
        v51 = v68;
        goto LABEL_20;
      }
      [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"SplitViewSession" duration:v48];
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4;
      v82[3] = &unk_1E6B01630;
      v64 = &v83;
      id v83 = *(id *)(a1 + 32);
      v63 = &v84;
      v65 = v43;
      id v84 = v43;
      char v61 = v49;
      v53 = &v85;
      id v85 = v69;
      v54 = &v86;
      v66 = v41;
      v62 = v29;
      id v57 = v41;
      id v86 = v57;
      *(double *)&v88[1] = v48;
      v55 = &v87;
      id v87 = v70;
      v56 = (id *)v88;
      v88[0] = v68;
      char v89 = v61;
      [v6 stateForQueryName:5 completion:v82];
      [*(id *)(a1 + 32) setIndividualSessionStartTimestamp:v39];
      v58 = *(void **)(a1 + 32);
      v51 = v68;
      id v59 = v57;
      uint64_t v29 = v62;
      [v58 setIndividualSessionStartReason:v59];
      uint64_t v28 = 1;
    }
    else
    {
      [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"SplitViewSession" duration:v48];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5;
      v71[3] = &unk_1E6B01608;
      v64 = &v72;
      id v72 = *(id *)(a1 + 32);
      v63 = &v73;
      v65 = v43;
      id v73 = v43;
      char v52 = v49;
      v53 = &v74;
      id v74 = v44;
      v54 = &v75;
      v66 = v41;
      id v75 = v41;
      double v79 = v39 - v46;
      char v81 = v52;
      v55 = &v76;
      id v76 = v69;
      double v80 = v48;
      v56 = &v77;
      id v77 = v70;
      v51 = v68;
      id v78 = v68;
      [v6 stateForQueryName:5 completion:v71];

      uint64_t v28 = 0;
    }

    int v50 = 0;
    v43 = v65;
    v41 = v66;
LABEL_20:

    if (!v50) {
      goto LABEL_22;
    }
LABEL_21:
    uint64_t v28 = 1;
    goto LABEL_22;
  }
  if (a2 != 48) {
    goto LABEL_21;
  }
  v7 = [v5 eventPayload];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75D8]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (!v9)
  {

    goto LABEL_21;
  }
  [v7 timestamp];
  double v11 = v10;
  v12 = [*(id *)(a1 + 32) aggregateSessionIdentifier];
  uint64_t v13 = [v12 UUIDString];

  BOOL v14 = [*(id *)(a1 + 32) aggregateSessionStartReason];
  [*(id *)(a1 + 32) aggregateSessionStartTimestamp];
  double v16 = v11 - v15;
  double v17 = [*(id *)(a1 + 32) individualSessionStartReason];
  [*(id *)(a1 + 32) individualSessionStartTimestamp];
  double v19 = v18;
  uint64_t v20 = [*(id *)(a1 + 32) individualSessionPrimaryBundleIdentifier];
  v21 = [*(id *)(a1 + 32) individualSessionSideBundleIdentifier];
  char v22 = [(id)SBApp isHardwareKeyboardAttached];
  [*(id *)(a1 + 40) trackInteractionWithFeatureNamed:@"SplitViewSession" duration:v19];
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3;
  v90[3] = &unk_1E6B01608;
  id v91 = *(id *)(a1 + 32);
  id v92 = v13;
  id v93 = v14;
  v94 = @"Lock";
  char v100 = v22;
  double v98 = v16;
  double v99 = v19;
  id v95 = v17;
  id v96 = v20;
  id v97 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v17;
  id v26 = v14;
  id v27 = v13;
  [v6 stateForQueryName:5 completion:v90];

  uint64_t v28 = 0;
LABEL_22:

  return v28;
}

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  [*(id *)(a1 + 32) _sendAggregateSessionCoreAnalyticsEventWithIdentifier:*(void *)(a1 + 40) startReason:*(void *)(a1 + 48) endReason:*(void *)(a1 + 56) duration:v4 doNotDisturbActive:*(unsigned __int8 *)(a1 + 104) hardwareKeyboardAttached:*(double *)(a1 + 88)];
  LOBYTE(v6) = *(unsigned char *)(a1 + 104);
  return [*(id *)(a1 + 32) _sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:*(void *)(a1 + 40) startReason:*(void *)(a1 + 64) endReason:*(void *)(a1 + 56) duration:*(void *)(a1 + 72) primaryBundleIdentifier:*(void *)(a1 + 80) sideBundleIdentifier:v4 doNotDisturbActive:*(double *)(a1 + 96) hardwareKeyboardAttached:v6];
}

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  LOBYTE(v6) = *(unsigned char *)(a1 + 88);
  return [*(id *)(a1 + 32) _sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:*(void *)(a1 + 40) startReason:*(void *)(a1 + 48) endReason:*(void *)(a1 + 56) duration:*(void *)(a1 + 64) primaryBundleIdentifier:*(void *)(a1 + 72) sideBundleIdentifier:v4 doNotDisturbActive:*(double *)(a1 + 80) hardwareKeyboardAttached:v6];
}

uint64_t __63__SBSplitViewSessionMetric_initWithHeartbeatMetricPersistence___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
  uint64_t v4 = [v3 BOOLValue];

  [*(id *)(a1 + 32) _sendAggregateSessionCoreAnalyticsEventWithIdentifier:*(void *)(a1 + 40) startReason:*(void *)(a1 + 48) endReason:*(void *)(a1 + 56) duration:v4 doNotDisturbActive:*(unsigned __int8 *)(a1 + 104) hardwareKeyboardAttached:*(double *)(a1 + 88)];
  LOBYTE(v6) = *(unsigned char *)(a1 + 104);
  return [*(id *)(a1 + 32) _sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:*(void *)(a1 + 40) startReason:*(void *)(a1 + 64) endReason:*(void *)(a1 + 56) duration:*(void *)(a1 + 72) primaryBundleIdentifier:*(void *)(a1 + 80) sideBundleIdentifier:v4 doNotDisturbActive:*(double *)(a1 + 96) hardwareKeyboardAttached:v6];
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v7 = a4;
  id v4 = v7;
  char v5 = AnalyticsSendEventLazy();

  return v5;
}

id __67__SBSplitViewSessionMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)_sendAggregateSessionCoreAnalyticsEventWithIdentifier:(id)a3 startReason:(id)a4 endReason:(id)a5 duration:(double)a6 doNotDisturbActive:(BOOL)a7 hardwareKeyboardAttached:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  v24[6] = *MEMORY[0x1E4F143B8];
  v23[0] = @"ID";
  v23[1] = @"StartReason";
  v24[0] = a3;
  v24[1] = a4;
  v24[2] = a5;
  v23[2] = @"EndReason";
  v23[3] = @"Duration";
  BOOL v14 = NSNumber;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  double v18 = [v14 numberWithDouble:a6];
  v24[3] = v18;
  v23[4] = @"IsDoNotDisturbActive";
  double v19 = [NSNumber numberWithBool:v9];
  v24[4] = v19;
  v23[5] = @"IsHardwareKeyboardAttached";
  uint64_t v20 = [NSNumber numberWithBool:v8];
  v24[5] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

  LOBYTE(self) = [(SBSplitViewSessionMetric *)self sendCoreAnalyticsEventWithName:@"com.apple.SpringBoard.Analytics.SplitViewSession.Aggregate" payload:v21];
  return (char)self;
}

- (BOOL)_sendIndividualSessionCoreAnalyticsEventWithAggregateIdentifier:(id)a3 startReason:(id)a4 endReason:(id)a5 duration:(double)a6 primaryBundleIdentifier:(id)a7 sideBundleIdentifier:(id)a8 doNotDisturbActive:(BOOL)a9 hardwareKeyboardAttached:(BOOL)a10
{
  BOOL v10 = a9;
  v30[8] = *MEMORY[0x1E4F143B8];
  v29[0] = @"AggregateID";
  v29[1] = @"StartReason";
  v30[0] = a3;
  v30[1] = a4;
  v30[2] = a5;
  v29[2] = @"EndReason";
  v29[3] = @"Duration";
  id v16 = NSNumber;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  char v22 = [v16 numberWithDouble:a6];
  v30[3] = v22;
  v30[4] = v18;
  v29[4] = @"PrimaryBundleID";
  v29[5] = @"SideBundleID";
  v30[5] = v17;
  v29[6] = @"IsDoNotDisturbActive";
  id v23 = [NSNumber numberWithBool:v10];
  v30[6] = v23;
  v29[7] = @"IsHardwareKeyboardAttached";
  id v24 = [NSNumber numberWithBool:a10];
  v30[7] = v24;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];

  BOOL v26 = [(SBSplitViewSessionMetric *)self sendCoreAnalyticsEventWithName:@"com.apple.SpringBoard.Analytics.SplitViewSession.Individual" payload:v25];
  return v26;
}

- (NSUUID)aggregateSessionIdentifier
{
  return self->_aggregateSessionIdentifier;
}

- (void)setAggregateSessionIdentifier:(id)a3
{
}

- (double)aggregateSessionStartTimestamp
{
  return self->_aggregateSessionStartTimestamp;
}

- (void)setAggregateSessionStartTimestamp:(double)a3
{
  self->_aggregateSessionStartTimestamp = a3;
}

- (NSString)aggregateSessionStartReason
{
  return self->_aggregateSessionStartReason;
}

- (void)setAggregateSessionStartReason:(id)a3
{
}

- (double)individualSessionStartTimestamp
{
  return self->_individualSessionStartTimestamp;
}

- (void)setIndividualSessionStartTimestamp:(double)a3
{
  self->_individualSessionStartTimestamp = a3;
}

- (NSString)individualSessionStartReason
{
  return self->_individualSessionStartReason;
}

- (void)setIndividualSessionStartReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_individualSessionSideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_individualSessionPrimaryBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_individualSessionStartReason, 0);
  objc_storeStrong((id *)&self->_aggregateSessionStartReason, 0);
  objc_storeStrong((id *)&self->_aggregateSessionIdentifier, 0);
}

@end