@interface SBSystemGestureMetric
- (id)initForType:(unint64_t)a3 parentMetric:(id)a4;
@end

@implementation SBSystemGestureMetric

- (id)initForType:(unint64_t)a3 parentMetric:(id)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v35 = a4;
  v50.receiver = self;
  v50.super_class = (Class)SBSystemGestureMetric;
  v6 = [(SBAnalyticsStateMachineEventHandler *)&v50 init];
  if (v6)
  {
    objc_initWeak(&location, v6);
    v34 = +[SBAnalyticsStateMachineEdge edgeFromState:5 toState:0 uponGestureState:0];
    v33 = +[SBAnalyticsStateMachineEdge edgeFromState:3 toState:0 uponGestureState:0];
    v32 = +[SBAnalyticsStateMachineEdge edgeFromState:4 toState:0 uponGestureState:0];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke;
    v46[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v48, &location);
    id v7 = v35;
    id v47 = v7;
    v31 = +[SBAnalyticsStateMachineEdge edgeFromState:0 toState:5 uponGestureState:5 andDo:v46];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_2;
    v43[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v45, &location);
    id v8 = v7;
    id v44 = v8;
    v30 = +[SBAnalyticsStateMachineEdge edgeFromState:0 toState:3 uponGestureState:3 andDo:v43];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_3;
    v40[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v42, &location);
    id v41 = v8;
    v29 = +[SBAnalyticsStateMachineEdge edgeFromState:0 toState:1 uponGestureState:1 andDo:v40];
    v28 = +[SBAnalyticsStateMachineEdge edgeFromState:1 toState:2 uponGestureState:2];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_4;
    v38[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v39, &location);
    v27 = +[SBAnalyticsStateMachineEdge edgeFromState:1 toState:3 uponGestureState:3 andDo:v38];
    v26 = +[SBAnalyticsStateMachineEdge edgeFromState:1 toState:4 uponGestureState:4];
    v25 = +[SBAnalyticsStateMachineEdge edgeFromState:1 toState:5 uponGestureState:5];
    v24 = +[SBAnalyticsStateMachineEdge edgeFromState:2 toState:2 uponGestureState:2];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_5;
    v36[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v37, &location);
    v23 = +[SBAnalyticsStateMachineEdge edgeFromState:2 toState:3 uponGestureState:3 andDo:v36];
    v9 = +[SBAnalyticsStateMachineEdge edgeFromState:2 toState:5 uponGestureState:5];
    v10 = +[SBAnalyticsStateMachineEdge edgeFromState:2 toState:4 uponGestureState:4];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v34];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v33];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v32];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v31];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v30];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v29];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v28];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v27];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v26];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v25];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v24];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v23];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v9];
    [(SBAnalyticsStateMachineEventHandler *)v6 addEdge:v10];
    v11 = SBAnalyticsNameForSystemGestureType(a3);
    v12 = [MEMORY[0x1E4F1CA48] array];
    for (unint64_t i = 0; i != 10; ++i)
    {
      v14 = NSStringFromAnalyticsLayoutLocation(i);
      [v12 addObject:v14];
    }
    v15 = [MEMORY[0x1E4F93720] propertyWithName:@"location" possibleValues:v12];
    id v16 = objc_alloc(MEMORY[0x1E4F93730]);
    v17 = [NSString stringWithFormat:@"SGstart_%@", v11];
    v18 = [NSString stringWithFormat:@"SGend_%@", v11];
    v51[0] = v15;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    uint64_t v20 = [v16 initWithFeatureId:@"SpringBoard" opportunityEvent:v17 conversionEvent:v18 registerProperties:v19];
    goalTracker = v6->_goalTracker;
    v6->_goalTracker = (PETGoalConversionEventTracker *)v20;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v45);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((void *)WeakRetained + 3);
    v5 = NSStringFromAnalyticsLayoutLocation([*(id *)(a1 + 32) currentLocation]);
    v7[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v4 trackGoalOpportunityEventWithConversion:0 propertyValues:v6];
  }
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((void *)WeakRetained + 3);
    v5 = NSStringFromAnalyticsLayoutLocation([*(id *)(a1 + 32) currentLocation]);
    v7[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v4 trackGoalOpportunityEventWithConversion:1 propertyValues:v6];
  }
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_3(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v3 = [*(id *)(a1 + 32) currentLocation];
    WeakRetained[4] = v3;
    v4 = (void *)WeakRetained[3];
    v5 = NSStringFromAnalyticsLayoutLocation(v3);
    v7[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v4 trackGoalOpportunityEventWithPropertyValues:v6];
  }
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_4(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v3 = (void *)WeakRetained[3];
    v4 = NSStringFromAnalyticsLayoutLocation(WeakRetained[4]);
    v6[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v3 trackGoalConversionEventWithPropertyValues:v5];
  }
}

void __50__SBSystemGestureMetric_initForType_parentMetric___block_invoke_5(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v3 = (void *)WeakRetained[3];
    v4 = NSStringFromAnalyticsLayoutLocation(WeakRetained[4]);
    v6[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v3 trackGoalConversionEventWithPropertyValues:v5];
  }
}

- (void).cxx_destruct
{
}

@end