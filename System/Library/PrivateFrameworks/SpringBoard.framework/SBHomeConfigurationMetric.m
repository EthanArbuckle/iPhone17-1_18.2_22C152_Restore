@interface SBHomeConfigurationMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBHomeConfigurationMetric)init;
@end

@implementation SBHomeConfigurationMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  if (a3 == 58)
  {
    uint64_t v7 = 16;
  }
  else
  {
    if (a3 != 59)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = 24;
  }
  [*(id *)((char *)&self->super.isa + v7) trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (SBHomeConfigurationMetric)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBHomeConfigurationMetric;
  v2 = [(SBHomeConfigurationMetric *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93738]);
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    uint64_t v5 = [v3 initWithFeatureId:@"SpringBoard" event:@"WidgetIconConfigurationPresented" registerProperties:MEMORY[0x1E4F1CBF0]];
    widgetIconConfigurationPresentationEventTracker = v2->_widgetIconConfigurationPresentationEventTracker;
    v2->_widgetIconConfigurationPresentationEventTracker = (PETScalarEventTracker *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"SpringBoard" event:@"WidgetIconStackConfigurationPresented" registerProperties:v4];
    widgetIconStackConfigurationPresentationEventTracker = v2->_widgetIconStackConfigurationPresentationEventTracker;
    v2->_widgetIconStackConfigurationPresentationEventTracker = (PETScalarEventTracker *)v7;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIconStackConfigurationPresentationEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetIconConfigurationPresentationEventTracker, 0);
  objc_storeStrong((id *)&self->_homescreenDensityEventTracker, 0);
}

@end