@interface SBSystemHapticsPreferencesMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBSystemHapticsPreferencesMetric)init;
@end

@implementation SBSystemHapticsPreferencesMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  if (a3 == 11)
  {
    v6 = +[SBDefaults externalDefaults];
    v7 = [v6 soundDefaults];

    uint64_t v8 = [v7 systemHapticsEnabled];
    [(PETGoalConversionEventTracker *)self->_switchTracker trackGoalOpportunityEventWithConversion:v8 propertyValues:MEMORY[0x1E4F1CBF0]];
  }
  return a3 == 11;
}

- (SBSystemHapticsPreferencesMetric)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBSystemHapticsPreferencesMetric;
  v2 = [(SBSystemHapticsPreferencesMetric *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93730]);
    uint64_t v4 = [v3 initWithFeatureId:@"SpringBoard" opportunityEvent:@"systemHapticsAvailable" conversionEvent:@"systemHapticsEnabled" registerProperties:MEMORY[0x1E4F1CBF0]];
    switchTracker = v2->_switchTracker;
    v2->_switchTracker = (PETGoalConversionEventTracker *)v4;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end