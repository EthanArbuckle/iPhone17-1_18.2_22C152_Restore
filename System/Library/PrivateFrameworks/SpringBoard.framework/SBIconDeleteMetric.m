@interface SBIconDeleteMetric
- (SBIconDeleteMetric)init;
- (id)_propertyValuesForTracker;
@end

@implementation SBIconDeleteMetric

uint64_t __26__SBIconDeleteMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 != 18) {
    return 0;
  }
  v4 = [a3 eventPayload];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7450]];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7458]];
  *(void *)(*(void *)(a1 + 32) + 32) = [v8 unsignedIntegerValue];

  return 1;
}

- (SBIconDeleteMetric)init
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SBIconDeleteMetric;
  result = [(SBAnalyticsStateMachineEventHandler *)&v28 init];
  if (result)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __26__SBIconDeleteMetric_init__block_invoke;
    v26[3] = &unk_1E6AF4C08;
    v23 = result;
    v3 = result;
    v27 = v3;
    v22 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v26];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __26__SBIconDeleteMetric_init__block_invoke_2;
    v24[3] = &unk_1E6AF4C08;
    v4 = v3;
    v25 = v4;
    v21 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v24];
    [(SBAnalyticsStateMachineEventHandler *)v4 addEdge:v22];
    [(SBAnalyticsStateMachineEventHandler *)v4 addEdge:v21];
    uint64_t v5 = (void *)MEMORY[0x1E4F93720];
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    uint64_t v7 = MEMORY[0x1E4F1CC28];
    v34[0] = MEMORY[0x1E4F1CC38];
    v34[1] = MEMORY[0x1E4F1CC28];
    v35[0] = @"Y";
    v35[1] = @"N";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v9 = [v5 propertyWithName:@"cancel" enumMapping:v8];

    v10 = (void *)MEMORY[0x1E4F93720];
    v32[0] = v6;
    v32[1] = v7;
    v33[0] = @"Y";
    v33[1] = @"N";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    v12 = [v10 propertyWithName:@"delete" enumMapping:v11];

    v13 = (void *)MEMORY[0x1E4F93720];
    v30[0] = v6;
    v30[1] = v7;
    v31[0] = @"Y";
    v31[1] = @"N";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    v15 = [v13 propertyWithName:@"removeDock" enumMapping:v14];

    v16 = PETEventPropertyForIconLocation(@"Location");
    id v17 = objc_alloc(MEMORY[0x1E4F93718]);
    v29[0] = v9;
    v29[1] = v12;
    v29[2] = v15;
    v29[3] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    uint64_t v19 = [v17 initWithFeatureId:@"SpringBoard" event:@"deleteIcon" registerProperties:v18 propertySubsets:&unk_1F33474F0];
    tracker = v4->_tracker;
    v4->_tracker = (PETDistributionEventTracker *)v19;

    return v23;
  }
  return result;
}

uint64_t __26__SBIconDeleteMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 != 19) {
    return 1;
  }
  v4 = [a3 eventPayload];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7460]];
  unint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = *(void **)(a1 + 32);
  v8 = (void *)v7[5];
  v9 = [v7 _propertyValuesForTracker];
  [v8 trackEventWithPropertyValues:v9 value:(double)v6];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), (id)*MEMORY[0x1E4FA66C8]);
  *(void *)(*(void *)(a1 + 32) + 32) = 0;

  return 0;
}

- (id)_propertyValuesForTracker
{
  v12[4] = *MEMORY[0x1E4F143B8];
  unint64_t presentedOptions = self->_presentedOptions;
  uint64_t v4 = (presentedOptions >> 1) & 1;
  uint64_t v5 = (presentedOptions >> 2) & 1;
  unint64_t v6 = [NSNumber numberWithBool:presentedOptions & 1];
  v12[0] = v6;
  uint64_t v7 = [NSNumber numberWithBool:v4];
  v12[1] = v7;
  v8 = [NSNumber numberWithBool:v5];
  location = self->_location;
  v12[2] = v8;
  v12[3] = location;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end