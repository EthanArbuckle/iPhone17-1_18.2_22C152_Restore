@interface SBReachabilityMetric
- (SBReachabilityMetric)init;
@end

@implementation SBReachabilityMetric

uint64_t __28__SBReachabilityMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 != 6) {
    return 0;
  }
  v4 = [a3 eventPayload];
  [v4 timestamp];
  *(void *)(*(void *)(a1 + 32) + 24) = v5;

  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  return 1;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 == 3)
  {
    v4 = [a3 eventPayload];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7488]];

    *(void *)(*(void *)(a1 + 32) + 40) = SBAnalyticsLayoutLocationForDisplayLayoutElements(v5);
  }
  return 0;
}

- (SBReachabilityMetric)init
{
  v40[2] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)SBReachabilityMetric;
  v2 = [(SBAnalyticsStateMachineEventHandler *)&v39 init];
  if (v2)
  {
    uint64_t v3 = PETEventPropertyForLayoutLocations(@"location");
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unint64_t v5 = -1;
    do
    {
      v6 = @"other";
      if (v5 <= 6) {
        v6 = off_1E6B04E50[v5];
      }
      v7 = [NSNumber numberWithUnsignedInteger:++v5];
      [v4 setObject:v6 forKeyedSubscript:v7];
    }
    while (v5 != 7);
    v26 = [MEMORY[0x1E4F93720] propertyWithName:@"deactivate" enumMapping:v4];

    id v8 = objc_alloc(MEMORY[0x1E4F93718]);
    v40[0] = v3;
    v40[1] = v26;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    uint64_t v10 = [v8 initWithFeatureId:@"SpringBoard" event:@"reachability" registerProperties:v9];
    tracker = v2->_tracker;
    v2->_tracker = (PETDistributionEventTracker *)v10;

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __28__SBReachabilityMetric_init__block_invoke;
    v37[3] = &unk_1E6AF4C08;
    v12 = v2;
    v38 = v12;
    v13 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v37];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __28__SBReachabilityMetric_init__block_invoke_2;
    v35[3] = &unk_1E6AF4C08;
    v14 = v12;
    v36 = v14;
    v15 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v35];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __28__SBReachabilityMetric_init__block_invoke_3;
    v33[3] = &unk_1E6AF4C08;
    v16 = v14;
    v34 = v16;
    v17 = +[SBAnalyticsStateMachineEdge edgeFromState:2 transition:v33];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __28__SBReachabilityMetric_init__block_invoke_4;
    v31[3] = &unk_1E6AF4C08;
    v18 = (void *)v3;
    v19 = v16;
    v32 = v19;
    v20 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v31];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __28__SBReachabilityMetric_init__block_invoke_5;
    v29[3] = &unk_1E6AF4C08;
    v21 = v19;
    v30 = v21;
    v22 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v29];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __28__SBReachabilityMetric_init__block_invoke_6;
    v27[3] = &unk_1E6AF4C08;
    v23 = v21;
    v28 = v23;
    v24 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v27];
    [(SBAnalyticsStateMachineEventHandler *)v23 addEdge:v13];
    [(SBAnalyticsStateMachineEventHandler *)v23 addEdge:v15];
    [(SBAnalyticsStateMachineEventHandler *)v23 addEdge:v17];
    [(SBAnalyticsStateMachineEventHandler *)v23 addEdge:v20];
    [(SBAnalyticsStateMachineEventHandler *)v23 addEdge:v22];
    [(SBAnalyticsStateMachineEventHandler *)v23 addEdge:v24];
  }
  return v2;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a2 != 7) {
    return 2;
  }
  id v4 = [a3 eventPayload];
  [v4 timestamp];
  double v6 = v5 - *(double *)(*(void *)(a1 + 32) + 24);

  uint64_t v7 = 0;
  while (v6 >= dbl_1D8FD1D68[v7])
  {
    if (++v7 == 10)
    {
      double v8 = 16.0;
      goto LABEL_10;
    }
  }
  if ((int)v7 <= 1) {
    LODWORD(v7) = 1;
  }
  double v8 = dbl_1D8FD1D68[(v7 - 1)];
LABEL_10:
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 32);
  v12 = [NSNumber numberWithUnsignedInteger:*(void *)(v10 + 40)];
  v15[0] = v12;
  v13 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 48)];
  v15[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v11 trackEventWithPropertyValues:v14 value:v8];

  return 0;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2 != 9) {
    return 1;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = 2;
  *(void *)(v2 + 48) = 2;
  return result;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return 1;
  }
  *(void *)(*(void *)(a1 + 32) + 48) = 1;
  return 2;
}

uint64_t __28__SBReachabilityMetric_init__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 != 8) {
    return 1;
  }
  id v4 = [a3 eventPayload];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA75F8]];
  unint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 <= 4) {
    *(void *)(*(void *)(a1 + 32) + 48) = v6 + 3;
  }

  return 2;
}

- (void).cxx_destruct
{
}

@end