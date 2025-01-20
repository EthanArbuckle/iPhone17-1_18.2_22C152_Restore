@interface PETDistributionEventTracker
- (NSString)event;
- (PETDistributionEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5;
- (PETDistributionEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5 propertySubsets:(id)a6;
- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6;
- (void)trackEventWithPropertyValues:(id)a3 value:(double)a4;
@end

@implementation PETDistributionEventTracker

- (void).cxx_destruct
{
}

- (NSString)event
{
  return self->_event;
}

- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = [(PETEventTracker *)self loggingOutlet];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [(PETEventTracker *)self featureId];
  [v17 logDoubleValue:v12 forEvent:v16 featureId:v11 stringifiedProperties:v10 metaData:v15];
}

- (void)trackEventWithPropertyValues:(id)a3 value:(double)a4
{
  id v6 = a3;
  id v8 = [(PETDistributionEventTracker *)self event];
  v7 = [NSNumber numberWithDouble:a4];
  [(PETEventTracker *)self _trackEvent:v8 withPropertyValues:v6 value:v7];
}

- (PETDistributionEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5 propertySubsets:(id)a6
{
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PETDistributionEventTracker;
  id v11 = [(PETEventTracker *)&v18 initWithFeatureId:a3 registerProperties:a5 propertySubsets:a6];
  if (v11)
  {
    if (!+[PETEventStringValidator stringIsValid:v10])
    {
      id v12 = (void *)MEMORY[0x1E4F1CA00];
      id v13 = [NSString stringWithFormat:@"event may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@", v10];
      double v14 = [v12 exceptionWithName:@"PETEventTrackingException" reason:v13 userInfo:0];

      [v14 raise];
    }
    uint64_t v15 = [v10 copy];
    event = v11->_event;
    v11->_event = (NSString *)v15;

    [(PETEventTracker *)v11 _checkCardinalityForEvent:v10];
    [(PETEventTracker *)v11 _checkKeyLengthForEvent:v10 metaData:0];
  }

  return v11;
}

- (PETDistributionEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5
{
  return [(PETDistributionEventTracker *)self initWithFeatureId:a3 event:a4 registerProperties:a5 propertySubsets:MEMORY[0x1E4F1CBF0]];
}

@end