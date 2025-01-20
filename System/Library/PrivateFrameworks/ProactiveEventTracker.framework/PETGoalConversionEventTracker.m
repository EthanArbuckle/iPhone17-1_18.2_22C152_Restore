@interface PETGoalConversionEventTracker
- (NSString)conversionEvent;
- (NSString)opportunityEvent;
- (PETGoalConversionEventTracker)initWithFeatureId:(id)a3 opportunityEvent:(id)a4 conversionEvent:(id)a5 registerProperties:(id)a6;
- (PETGoalConversionEventTracker)initWithFeatureId:(id)a3 opportunityEvent:(id)a4 conversionEvent:(id)a5 registerProperties:(id)a6 propertySubsets:(id)a7;
- (id)_keyMetadataForEvent:(id)a3;
- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6;
- (void)trackGoalConversionEventWithPropertyValues:(id)a3;
- (void)trackGoalOpportunityEventWithConversion:(BOOL)a3 propertyValues:(id)a4;
- (void)trackGoalOpportunityEventWithPropertyValues:(id)a3;
@end

@implementation PETGoalConversionEventTracker

- (id)_keyMetadataForEvent:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:self->_opportunityEvent])
  {
    v5 = [PETStringPairs alloc];
    v11[0] = self->_conversionEvent;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v7 = &unk_1EE090AD0;
LABEL_5:
    v8 = [(PETStringPairs *)v5 initWithKeys:v7 values:v6];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:self->_conversionEvent])
  {
    v5 = [PETStringPairs alloc];
    opportunityEvent = self->_opportunityEvent;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&opportunityEvent count:1];
    v7 = &unk_1EE090AE8;
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  return v8;
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

- (void)trackGoalOpportunityEventWithPropertyValues:(id)a3
{
}

- (void)trackGoalConversionEventWithPropertyValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionEvent, 0);

  objc_storeStrong((id *)&self->_opportunityEvent, 0);
}

- (NSString)conversionEvent
{
  return self->_conversionEvent;
}

- (NSString)opportunityEvent
{
  return self->_opportunityEvent;
}

- (void)trackGoalOpportunityEventWithConversion:(BOOL)a3 propertyValues:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  -[PETGoalConversionEventTracker trackGoalOpportunityEventWithPropertyValues:](self, "trackGoalOpportunityEventWithPropertyValues:");
  if (v4) {
    [(PETGoalConversionEventTracker *)self trackGoalConversionEventWithPropertyValues:v6];
  }
}

- (PETGoalConversionEventTracker)initWithFeatureId:(id)a3 opportunityEvent:(id)a4 conversionEvent:(id)a5 registerProperties:(id)a6 propertySubsets:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PETGoalConversionEventTracker;
  uint64_t v14 = [(PETEventTracker *)&v25 initWithFeatureId:a3 registerProperties:a6 propertySubsets:a7];
  if (v14)
  {
    if (!+[PETEventStringValidator stringIsValid:v12]
      || !+[PETEventStringValidator stringIsValid:v13])
    {
      v15 = (void *)MEMORY[0x1E4F1CA00];
      id v16 = [NSString stringWithFormat:@"opportunityEvent, and conversionEvent may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@, %@", v12, v13];
      v17 = [v15 exceptionWithName:@"EventTrackerException" reason:v16 userInfo:0];

      [v17 raise];
    }
    uint64_t v18 = [v12 copy];
    opportunityEvent = v14->_opportunityEvent;
    v14->_opportunityEvent = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    conversionEvent = v14->_conversionEvent;
    v14->_conversionEvent = (NSString *)v20;

    [(PETEventTracker *)v14 _checkCardinalityForEvent:v14->_opportunityEvent];
    v22 = v14->_conversionEvent;
    v23 = [(PETGoalConversionEventTracker *)v14 _keyMetadataForEvent:v22];
    [(PETEventTracker *)v14 _checkKeyLengthForEvent:v22 metaData:v23];
  }
  return v14;
}

- (PETGoalConversionEventTracker)initWithFeatureId:(id)a3 opportunityEvent:(id)a4 conversionEvent:(id)a5 registerProperties:(id)a6
{
  return [(PETGoalConversionEventTracker *)self initWithFeatureId:a3 opportunityEvent:a4 conversionEvent:a5 registerProperties:a6 propertySubsets:MEMORY[0x1E4F1CBF0]];
}

@end