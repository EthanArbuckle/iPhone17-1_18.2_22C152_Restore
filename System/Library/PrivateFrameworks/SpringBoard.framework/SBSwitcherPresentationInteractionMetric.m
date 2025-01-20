@interface SBSwitcherPresentationInteractionMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBSwitcherPresentationInteractionMetric)init;
@end

@implementation SBSwitcherPresentationInteractionMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 5)
  {
    v6 = [a4 eventPayload];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA75C8]];
    uint64_t v8 = [v7 unsignedIntegerValue];

    if (v8 == 2)
    {
      v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA75C0]];
      uint64_t v10 = [v9 unsignedIntegerValue];

      if ((unint64_t)(v10 - 1) > 0x1A) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = qword_1D8FD3270[v10 - 1];
      }
      tracker = self->_tracker;
      v13 = [NSNumber numberWithUnsignedInteger:v11];
      v16[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v14];
    }
  }
  return a3 == 5;
}

- (SBSwitcherPresentationInteractionMetric)init
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SBSwitcherPresentationInteractionMetric;
  v2 = [(SBSwitcherPresentationInteractionMetric *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    for (unint64_t i = 0; i != 26; ++i)
    {
      v5 = @"homescreen";
      if (i <= 0x19) {
        v5 = off_1E6B0CD38[i];
      }
      v6 = [NSNumber numberWithUnsignedInteger:i];
      [v3 setObject:v5 forKeyedSubscript:v6];
    }
    v7 = [MEMORY[0x1E4F93720] propertyWithName:@"method" enumMapping:v3];
    id v8 = objc_alloc(MEMORY[0x1E4F93738]);
    v14[0] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v10 = [v8 initWithFeatureId:@"SpringBoard" event:@"PresentSwitcher" registerProperties:v9];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v10;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end