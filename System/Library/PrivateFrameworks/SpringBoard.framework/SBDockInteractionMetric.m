@interface SBDockInteractionMetric
- (SBDockInteractionMetric)init;
@end

@implementation SBDockInteractionMetric

uint64_t __31__SBDockInteractionMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = [a3 eventPayload];
  v6 = v5;
  if (a2 == 3)
  {
    v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA7488]];
    *(void *)(*(void *)(a1 + 32) + 40) = SBAnalyticsLayoutLocationForDisplayLayoutElements(v10);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      uint64_t v15 = *MEMORY[0x1E4FA7470];
      uint64_t v16 = *MEMORY[0x1E4FA6F38];
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v17), "objectForKeyedSubscript:", v15, (void)v21);
          char v19 = [v18 isEqualToString:v16];

          if (v19)
          {

            uint64_t v9 = 2;
            goto LABEL_16;
          }
          ++v17;
        }
        while (v13 != v17);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    goto LABEL_14;
  }
  if (a2 != 25
    || ([v5 objectForKeyedSubscript:*MEMORY[0x1E4FA74B8]],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 unsignedIntegerValue],
        v7,
        v8))
  {
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = 1;
LABEL_16:

  return v9;
}

- (SBDockInteractionMetric)init
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)SBDockInteractionMetric;
  v2 = [(SBAnalyticsStateMachineEventHandler *)&v32 init];
  if (v2)
  {
    v3 = PETEventPropertyForLayoutLocations(@"location");
    id v4 = objc_alloc(MEMORY[0x1E4F93730]);
    v36[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    uint64_t v6 = [v4 initWithFeatureId:@"SpringBoard" opportunityEvent:@"dockBeginSwipeIn" conversionEvent:@"dockCompleteSwipeIn" registerProperties:v5 propertySubsets:&unk_1F3347EC8];
    swipeInTracker = v2->_swipeInTracker;
    v2->_swipeInTracker = (PETGoalConversionEventTracker *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F93720];
    v34[0] = &unk_1F334A2E0;
    v34[1] = &unk_1F334A2F8;
    v35[0] = @"tap";
    v35[1] = @"swipe";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v10 = [v8 propertyWithName:@"dismissMethod" enumMapping:v9];

    id v11 = objc_alloc(MEMORY[0x1E4F93730]);
    v33 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    uint64_t v13 = [v11 initWithFeatureId:@"SpringBoard" opportunityEvent:@"dockBeginManualDismiss" conversionEvent:@"dockCompleteManualDismiss" registerProperties:v12];
    dismissTracker = v2->_dismissTracker;
    v2->_dismissTracker = (PETGoalConversionEventTracker *)v13;

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __31__SBDockInteractionMetric_init__block_invoke;
    v30[3] = &unk_1E6AF4C08;
    uint64_t v15 = v2;
    v31 = v15;
    uint64_t v16 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v30];
    [(SBAnalyticsStateMachineEventHandler *)v15 addEdge:v16];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __31__SBDockInteractionMetric_init__block_invoke_2;
    v28[3] = &unk_1E6AF4C08;
    uint64_t v17 = v15;
    v29 = v17;
    v18 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v28];
    [(SBAnalyticsStateMachineEventHandler *)v17 addEdge:v18];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __31__SBDockInteractionMetric_init__block_invoke_3;
    v26[3] = &unk_1E6AF4C08;
    char v19 = v17;
    v27 = v19;
    v20 = +[SBAnalyticsStateMachineEdge edgeFromState:2 transition:v26];
    [(SBAnalyticsStateMachineEventHandler *)v19 addEdge:v20];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __31__SBDockInteractionMetric_init__block_invoke_4;
    v24[3] = &unk_1E6AF4C08;
    long long v21 = v19;
    v25 = v21;
    long long v22 = +[SBAnalyticsStateMachineEdge edgeFromState:3 transition:v24];
    [(SBAnalyticsStateMachineEventHandler *)v21 addEdge:v22];
  }
  return v2;
}

uint64_t __31__SBDockInteractionMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v5 = [a3 eventPayload];
  uint64_t v6 = v5;
  if (a2 != 25)
  {
LABEL_5:
    uint64_t v13 = 1;
    goto LABEL_10;
  }
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA74B8]];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v8 != 1)
  {
    if (v8 == 2)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 24);
      id v11 = [NSNumber numberWithUnsignedInteger:*(void *)(v9 + 40)];
      v18[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v10 trackGoalOpportunityEventWithConversion:0 propertyValues:v12];
      uint64_t v13 = 0;
LABEL_9:

      goto LABEL_10;
    }
    goto LABEL_5;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (*(void *)(v14 + 40) != 6)
  {
    uint64_t v15 = *(void **)(v14 + 24);
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    uint64_t v17 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v15 trackGoalOpportunityEventWithConversion:1 propertyValues:v12];
    uint64_t v13 = 2;
    goto LABEL_9;
  }
  uint64_t v13 = 2;
LABEL_10:

  return v13;
}

uint64_t __31__SBDockInteractionMetric_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = [a3 eventPayload];
  uint64_t v6 = v5;
  if (a2 == 3)
  {
    [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA7488]];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      uint64_t v14 = *MEMORY[0x1E4FA7470];
      uint64_t v15 = *MEMORY[0x1E4FA6F38];
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16), "objectForKeyedSubscript:", v14, (void)v20);
          char v18 = [v17 isEqualToString:v15];

          if (v18)
          {

            goto LABEL_18;
          }
          ++v16;
        }
        while (v12 != v16);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    goto LABEL_16;
  }
  if (a2 == 27)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) trackGoalOpportunityEventWithConversion:1 propertyValues:&unk_1F3347EE0];
LABEL_16:
    uint64_t v9 = 0;
    goto LABEL_19;
  }
  if (a2 != 26
    || ([v5 objectForKeyedSubscript:*MEMORY[0x1E4FA74B8]],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 unsignedIntegerValue],
        v7,
        v8))
  {
LABEL_18:
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 3;
  }
LABEL_19:

  return v9;
}

uint64_t __31__SBDockInteractionMetric_init__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = [a3 eventPayload];
  uint64_t v6 = v5;
  if (a2 != 26) {
    goto LABEL_5;
  }
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA74B8]];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v8 == 2)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) trackGoalOpportunityEventWithConversion:0 propertyValues:&unk_1F3347F10];
    uint64_t v9 = 2;
    goto LABEL_7;
  }
  if (v8 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) trackGoalOpportunityEventWithConversion:1 propertyValues:&unk_1F3347EF8];
    uint64_t v9 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v9 = 3;
  }
LABEL_7:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTracker, 0);
  objc_storeStrong((id *)&self->_swipeInTracker, 0);
}

@end