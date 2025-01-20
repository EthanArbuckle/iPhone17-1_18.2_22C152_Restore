@interface PGEventLabelingConfigurationWrapper
+ (BOOL)isEventLabelingEnabled;
+ (BOOL)usePrimaryMeaningDomainForEventLabelingMeanings;
- (PGEventLabelingConfigurationWrapper)init;
- (double)highPrecisionThresholdForMeaningLabel:(id)a3;
- (double)highRecallThresholdForMeaningLabel:(id)a3;
- (id)meaningLabelsForEventLabeling;
@end

@implementation PGEventLabelingConfigurationWrapper

- (void).cxx_destruct
{
}

- (double)highRecallThresholdForMeaningLabel:(id)a3
{
  v3 = [(PGEventLabelingConfiguration *)self->_configuration thresholdsBy:a3];
  [v3 highRecallThreshold];
  double v5 = v4;

  return v5;
}

- (double)highPrecisionThresholdForMeaningLabel:(id)a3
{
  v3 = [(PGEventLabelingConfiguration *)self->_configuration thresholdsBy:a3];
  [v3 highPrecisionThreshold];
  double v5 = v4;

  return v5;
}

- (id)meaningLabelsForEventLabeling
{
  return [(PGEventLabelingConfiguration *)self->_configuration meaningLabels];
}

- (PGEventLabelingConfigurationWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGEventLabelingConfigurationWrapper;
  v2 = [(PGEventLabelingConfigurationWrapper *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PGEventLabelingConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;
  }
  return v2;
}

+ (BOOL)usePrimaryMeaningDomainForEventLabelingMeanings
{
  return +[PGEventLabelingConfiguration usePrimaryMeaningDomainForEventLabelingMeanings];
}

+ (BOOL)isEventLabelingEnabled
{
  return +[PGEventLabelingConfiguration isEventLabelingEnabled];
}

@end