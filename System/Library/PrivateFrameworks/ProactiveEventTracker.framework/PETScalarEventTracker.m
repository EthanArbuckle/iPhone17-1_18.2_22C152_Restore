@interface PETScalarEventTracker
- (NSString)event;
- (PETScalarEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5;
- (PETScalarEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5 propertySubsets:(id)a6;
- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6;
- (void)_setValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6;
- (void)trackEventWithPropertyValues:(id)a3;
- (void)trackEventWithPropertyValues:(id)a3 setValue:(unint64_t)a4;
- (void)trackEventWithPropertyValues:(id)a3 value:(unint64_t)a4;
@end

@implementation PETScalarEventTracker

- (void)trackEventWithPropertyValues:(id)a3
{
}

- (void)trackEventWithPropertyValues:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(PETScalarEventTracker *)self event];
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  [(PETEventTracker *)self _trackEvent:v8 withPropertyValues:v6 value:v7];
}

- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v16 = [(PETEventTracker *)self loggingOutlet];
  uint64_t v14 = [v13 unsignedIntegerValue];

  v15 = [(PETEventTracker *)self featureId];
  [v16 logUnsignedIntegerValue:v14 forEvent:v12 featureId:v15 stringifiedProperties:v11 metaData:v10];
}

- (NSString)event
{
  return self->_event;
}

- (void).cxx_destruct
{
}

- (void)_setValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v16 = [(PETEventTracker *)self loggingOutlet];
  uint64_t v14 = [v13 unsignedIntegerValue];

  v15 = [(PETEventTracker *)self featureId];
  [v16 setUnsignedIntegerValue:v14 forEvent:v12 featureId:v15 stringifiedProperties:v11 metaData:v10];
}

- (void)trackEventWithPropertyValues:(id)a3 setValue:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(PETScalarEventTracker *)self event];
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  [(PETEventTracker *)self _trackEvent:v8 withPropertyValues:v6 value:v7 overwrite:1];
}

- (PETScalarEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5 propertySubsets:(id)a6
{
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PETScalarEventTracker;
  id v11 = [(PETEventTracker *)&v18 initWithFeatureId:a3 registerProperties:a5 propertySubsets:a6];
  if (v11)
  {
    if (!+[PETEventStringValidator stringIsValid:v10])
    {
      id v12 = (void *)MEMORY[0x1E4F1CA00];
      id v13 = [NSString stringWithFormat:@"event may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@", v10];
      uint64_t v14 = [v12 exceptionWithName:@"EventTrackerException" reason:v13 userInfo:0];

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

- (PETScalarEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5
{
  return [(PETScalarEventTracker *)self initWithFeatureId:a3 event:a4 registerProperties:a5 propertySubsets:MEMORY[0x1E4F1CBF0]];
}

@end