@interface SBIconFlockingMetric
- (SBIconFlockingMetric)init;
@end

@implementation SBIconFlockingMetric

BOOL __28__SBIconFlockingMetric_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 28;
}

- (SBIconFlockingMetric)init
{
  v15.receiver = self;
  v15.super_class = (Class)SBIconFlockingMetric;
  v2 = [(SBAnalyticsStateMachineEventHandler *)&v15 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93718]);
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    uint64_t v5 = [v3 initWithFeatureId:@"SpringBoard" event:@"IconDragging" registerProperties:MEMORY[0x1E4F1CBF0]];
    flockingDistributionTracker = v2->_flockingDistributionTracker;
    v2->_flockingDistributionTracker = (PETDistributionEventTracker *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"SpringBoard" event:@"IconFlocking" registerProperties:v4];
    flockingUsageTracker = v2->_flockingUsageTracker;
    v2->_flockingUsageTracker = (PETScalarEventTracker *)v7;

    v9 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:&__block_literal_global_65];
    [(SBAnalyticsStateMachineEventHandler *)v2 addEdge:v9];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __28__SBIconFlockingMetric_init__block_invoke_2;
    v13[3] = &unk_1E6AF4C08;
    v10 = v2;
    v14 = v10;
    v11 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v13];
    [(SBAnalyticsStateMachineEventHandler *)v10 addEdge:v11];
  }
  return v2;
}

uint64_t __28__SBIconFlockingMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 != 30) {
    return 1;
  }
  uint64_t v4 = [a3 eventPayload];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7540]];
  unint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = 0;
  while (v6 >= qword_1D8FD0DA8[v7])
  {
    if (++v7 == 15)
    {
      double v8 = 50.0;
      goto LABEL_10;
    }
  }
  if ((int)v7 <= 1) {
    LODWORD(v7) = 1;
  }
  double v8 = (double)qword_1D8FD0DA8[(v7 - 1)];
LABEL_10:
  [*(id *)(*(void *)(a1 + 32) + 24) trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] value:v8];
  if (v6 >= 2) {
    [*(id *)(*(void *)(a1 + 32) + 32) trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flockingUsageTracker, 0);
  objc_storeStrong((id *)&self->_flockingDistributionTracker, 0);
}

@end