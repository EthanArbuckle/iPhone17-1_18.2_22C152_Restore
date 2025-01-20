@interface SBIconLaunchMetric
- (SBIconLaunchMetric)init;
- (void)_processAndReportLaunchedEventPayload:(id)a3;
- (void)_processAndReportTappedEventPayload:(id)a3;
@end

@implementation SBIconLaunchMetric

uint64_t __26__SBIconLaunchMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 != 9) {
    return 0;
  }
  v3 = *(void **)(a1 + 32);
  v4 = [a3 eventPayload];
  [v3 _processAndReportTappedEventPayload:v4];

  return 1;
}

uint64_t __26__SBIconLaunchMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 == 3)
  {
    v4 = [a3 eventPayload];
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7488]];

    *(void *)(*(void *)(a1 + 32) + 56) = SBAnalyticsLayoutLocationForDisplayLayoutElements(v5);
  }
  return 0;
}

uint64_t __26__SBIconLaunchMetric_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 9)
  {
    v10 = *(void **)(a1 + 32);
    v8 = [v5 eventPayload];
    [v10 _processAndReportTappedEventPayload:v8];
    uint64_t v9 = 1;
  }
  else
  {
    if (a2 != 10)
    {
      uint64_t v9 = 1;
      goto LABEL_7;
    }
    v7 = *(void **)(a1 + 32);
    v8 = [v5 eventPayload];
    [v7 _processAndReportLaunchedEventPayload:v8];
    uint64_t v9 = 0;
  }

LABEL_7:
  return v9;
}

- (void)_processAndReportTappedEventPayload:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FA7550];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:v4];
  self->_isFolder = [v6 BOOLValue];

  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA7558]];

  PETStringValueForIconLocation(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  iconLocationValue = self->_iconLocationValue;
  self->_iconLocationValue = v8;

  trackerV1 = self->_trackerV1;
  v11 = [NSNumber numberWithBool:self->_isFolder];
  v12 = self->_iconLocationValue;
  v19[0] = v11;
  v19[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [(PETGoalConversionEventTracker *)trackerV1 trackGoalOpportunityEventWithPropertyValues:v13];

  trackerV2 = self->_trackerV2;
  v15 = [NSNumber numberWithBool:self->_isFolder];
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_layoutLocation, v15, self->_iconLocationValue);
  v18[2] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  [(PETGoalConversionEventTracker *)trackerV2 trackGoalOpportunityEventWithPropertyValues:v17];
}

- (void)_processAndReportLaunchedEventPayload:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  trackerV1 = self->_trackerV1;
  id v5 = [NSNumber numberWithBool:self->_isFolder];
  iconLocationValue = self->_iconLocationValue;
  v13[0] = v5;
  v13[1] = iconLocationValue;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [(PETGoalConversionEventTracker *)trackerV1 trackGoalConversionEventWithPropertyValues:v7];

  trackerV2 = self->_trackerV2;
  uint64_t v9 = [NSNumber numberWithBool:self->_isFolder];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_layoutLocation, v9, self->_iconLocationValue);
  v12[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  [(PETGoalConversionEventTracker *)trackerV2 trackGoalConversionEventWithPropertyValues:v11];
}

- (SBIconLaunchMetric)init
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)SBIconLaunchMetric;
  v2 = [(SBAnalyticsStateMachineEventHandler *)&v30 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    v33[0] = MEMORY[0x1E4F1CC28];
    v33[1] = MEMORY[0x1E4F1CC38];
    v34[0] = @"App";
    v34[1] = @"Folder";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v5 = [v3 propertyWithName:@"Type" enumMapping:v4];

    v23 = PETEventPropertyForIconLocation(@"Location");
    v6 = PETEventPropertyForIconLocation(@"iconLocation");
    v7 = PETEventPropertyForLayoutLocations(@"location");
    id v8 = objc_alloc(MEMORY[0x1E4F93730]);
    v32[0] = v5;
    v32[1] = v23;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    uint64_t v10 = [v8 initWithFeatureId:@"SpringBoard" opportunityEvent:@"iconTapped" conversionEvent:@"iconLaunched" registerProperties:v9];
    trackerV1 = v2->_trackerV1;
    v2->_trackerV1 = (PETGoalConversionEventTracker *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F93730]);
    v31[0] = v5;
    v31[1] = v6;
    v31[2] = v7;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
    uint64_t v14 = [v12 initWithFeatureId:@"SpringBoard" opportunityEvent:@"iconTappedv2" conversionEvent:@"iconLaunchedv2" registerProperties:v13];
    trackerV2 = v2->_trackerV2;
    v2->_trackerV2 = (PETGoalConversionEventTracker *)v14;

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __26__SBIconLaunchMetric_init__block_invoke;
    v28[3] = &unk_1E6AF4C08;
    v16 = v2;
    v29 = v16;
    v17 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __26__SBIconLaunchMetric_init__block_invoke_2;
    v26[3] = &unk_1E6AF4C08;
    v18 = v16;
    v27 = v18;
    v19 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v26];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __26__SBIconLaunchMetric_init__block_invoke_3;
    v24[3] = &unk_1E6AF4C08;
    v20 = v18;
    v25 = v20;
    v21 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v24];
    [(SBAnalyticsStateMachineEventHandler *)v20 addEdge:v17];
    [(SBAnalyticsStateMachineEventHandler *)v20 addEdge:v19];
    [(SBAnalyticsStateMachineEventHandler *)v20 addEdge:v21];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconLocationValue, 0);
  objc_storeStrong((id *)&self->_trackerV2, 0);
  objc_storeStrong((id *)&self->_trackerV1, 0);
}

@end