@interface SBMedusaDragAndDropMetric
- (SBMedusaDragAndDropMetric)init;
@end

@implementation SBMedusaDragAndDropMetric

uint64_t __33__SBMedusaDragAndDropMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 == 28) {
    return 1;
  }
  if (a2 == 3)
  {
    v4 = [a3 eventPayload];
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7488]];

    *(void *)(*(void *)(a1 + 32) + 24) = SBAnalyticsLayoutLocationForDisplayLayoutElements(v5);
  }
  return 0;
}

- (SBMedusaDragAndDropMetric)init
{
  v28[9] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)SBMedusaDragAndDropMetric;
  v2 = [(SBAnalyticsStateMachineEventHandler *)&v23 init];
  if (v2)
  {
    v18 = PETEventPropertyForLayoutLocations(@"location");
    v3 = (void *)MEMORY[0x1E4F93720];
    v27[0] = &unk_1F334AF40;
    v27[1] = &unk_1F334AF58;
    v28[0] = @"Dock";
    v28[1] = @"Suggestions";
    v27[2] = &unk_1F334AF70;
    v27[3] = &unk_1F334AF88;
    v28[2] = @"Unknown";
    v28[3] = @"Spotlight";
    v27[4] = &unk_1F334AFA0;
    v27[5] = &unk_1F334AFB8;
    v28[4] = @"Home";
    v28[5] = @"StackConfiguration";
    v27[6] = &unk_1F334AFD0;
    v27[7] = &unk_1F334AFE8;
    v28[6] = @"AddWidgetSheet";
    v28[7] = @"AppLibrary";
    v27[8] = &unk_1F334B000;
    v28[8] = @"Today";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:9];
    v5 = [v3 propertyWithName:@"dragStart" enumMapping:v4];

    v25[0] = &unk_1F334AF40;
    v25[1] = &unk_1F334AF88;
    v6 = (void *)MEMORY[0x1E4F93720];
    v26[0] = @"cancel";
    v26[1] = @"rSide";
    v25[2] = &unk_1F334AF70;
    v25[3] = &unk_1F334AF58;
    v26[2] = @"rPrimary";
    v26[3] = @"rSpace";
    v25[4] = &unk_1F334AFA0;
    v25[5] = &unk_1F334AFB8;
    v26[4] = @"rSideLeft";
    v26[5] = @"rSideRight";
    v25[6] = &unk_1F334AFD0;
    v26[6] = @"pip";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
    v8 = [v6 propertyWithName:@"dropAction" enumMapping:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F93730]);
    v24[0] = v18;
    v24[1] = v5;
    v24[2] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    uint64_t v11 = [v9 initWithFeatureId:@"SpringBoard" opportunityEvent:@"MedusaDrop" conversionEvent:@"MedusaDropComplete" registerProperties:v10];
    medusaDropTracker = v2->_medusaDropTracker;
    v2->_medusaDropTracker = (PETGoalConversionEventTracker *)v11;

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __33__SBMedusaDragAndDropMetric_init__block_invoke;
    v21[3] = &unk_1E6AF4C08;
    v13 = v2;
    v22 = v13;
    v14 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v21];
    [(SBAnalyticsStateMachineEventHandler *)v13 addEdge:v14];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __33__SBMedusaDragAndDropMetric_init__block_invoke_2;
    v19[3] = &unk_1E6AF4C08;
    v15 = v13;
    v20 = v15;
    v16 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v19];
    [(SBAnalyticsStateMachineEventHandler *)v15 addEdge:v16];
  }
  return v2;
}

uint64_t __33__SBMedusaDragAndDropMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  if (a2 != 30)
  {
    if (a2 != 32) {
      return 1;
    }
    v4 = [a3 eventPayload];
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7528]];
    unint64_t v6 = [v5 unsignedIntegerValue];

    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7530]];
    unint64_t v8 = [v7 unsignedIntegerValue];

    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:*(void *)(v9 + 24)];
    uint64_t v12 = BridgeLocationForSBSLocation(v6);
    if (v8)
    {
      v20[0] = v11;
      v13 = [NSNumber numberWithUnsignedInteger:v12];
      v20[1] = v13;
      if (v8 > 0xA) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = qword_1D8FD2D38[v8 - 1];
      }
      v16 = [NSNumber numberWithUnsignedInteger:v14];
      v20[2] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
      v18 = v10;
      uint64_t v19 = 1;
    }
    else
    {
      v21[0] = v11;
      v13 = [NSNumber numberWithUnsignedInteger:v12];
      v21[1] = v13;
      v16 = [NSNumber numberWithUnsignedInteger:0];
      v21[2] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
      v18 = v10;
      uint64_t v19 = 0;
    }
    [v18 trackGoalOpportunityEventWithConversion:v19 propertyValues:v17];
  }
  return 0;
}

- (void).cxx_destruct
{
}

@end