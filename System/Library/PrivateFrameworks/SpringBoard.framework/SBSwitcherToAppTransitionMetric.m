@interface SBSwitcherToAppTransitionMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBSwitcherToAppTransitionMetric)init;
@end

@implementation SBSwitcherToAppTransitionMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 14)
  {
    v6 = [a4 eventPayload];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7698]];
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7690]];
    uint64_t v9 = [v8 integerValue];

    tracker = self->_tracker;
    v13[0] = v7;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [(PETDistributionEventTracker *)tracker trackEventWithPropertyValues:v11 value:(double)v9];
  }
  return a3 == 14;
}

- (SBSwitcherToAppTransitionMetric)init
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherToAppTransitionMetric;
  v2 = [(SBSwitcherToAppTransitionMetric *)&v11 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    v13[0] = &unk_1F3349E78;
    v13[1] = &unk_1F3349E90;
    v14[0] = @"CommandTab";
    v14[1] = @"MainSwitcher";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v5 = [v3 propertyWithName:@"Type" enumMapping:v4];

    id v6 = objc_alloc(MEMORY[0x1E4F93718]);
    v12 = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    uint64_t v8 = [v6 initWithFeatureId:@"SpringBoard" event:@"SwitcherTransition" registerProperties:v7];
    tracker = v2->_tracker;
    v2->_tracker = (PETDistributionEventTracker *)v8;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end