@interface FCNewsPersonalizationLogisticRegressionClassifierConfiguration
- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)init;
- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)initWithDictionary:(id)a3;
- (NSNumber)convergenceThreshold;
- (NSNumber)l1Penalty;
- (NSNumber)l2Penalty;
- (NSNumber)maximumIterations;
- (NSNumber)stepSize;
- (id)description;
- (void)setConvergenceThreshold:(id)a3;
- (void)setL1Penalty:(id)a3;
- (void)setL2Penalty:(id)a3;
- (void)setMaximumIterations:(id)a3;
- (void)setStepSize:(id)a3;
@end

@implementation FCNewsPersonalizationLogisticRegressionClassifierConfiguration

- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCNewsPersonalizationLogisticRegressionClassifierConfiguration;
  v5 = [(FCNewsPersonalizationLogisticRegressionClassifierConfiguration *)&v17 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationNumberValue(v4, @"l2Penalty", &unk_1EF8D9A98);
    l2Penalty = v5->_l2Penalty;
    v5->_l2Penalty = (NSNumber *)v6;

    uint64_t v8 = FCAppConfigurationNumberValue(v4, @"l1Penalty", 0);
    l1Penalty = v5->_l1Penalty;
    v5->_l1Penalty = (NSNumber *)v8;

    uint64_t v10 = FCAppConfigurationNumberValue(v4, @"maximumIterations", &unk_1EF8D87D8);
    maximumIterations = v5->_maximumIterations;
    v5->_maximumIterations = (NSNumber *)v10;

    uint64_t v12 = FCAppConfigurationNumberValue(v4, @"stepSize", &unk_1EF8D9A98);
    stepSize = v5->_stepSize;
    v5->_stepSize = (NSNumber *)v12;

    uint64_t v14 = FCAppConfigurationNumberValue(v4, @"convergenceThreshold", &unk_1EF8D9AA8);
    convergenceThreshold = v5->_convergenceThreshold;
    v5->_convergenceThreshold = (NSNumber *)v14;
  }
  return v5;
}

- (NSNumber)stepSize
{
  return self->_stepSize;
}

- (NSNumber)maximumIterations
{
  return self->_maximumIterations;
}

- (NSNumber)l2Penalty
{
  return self->_l2Penalty;
}

- (NSNumber)l1Penalty
{
  return self->_l1Penalty;
}

- (NSNumber)convergenceThreshold
{
  return self->_convergenceThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convergenceThreshold, 0);
  objc_storeStrong((id *)&self->_stepSize, 0);
  objc_storeStrong((id *)&self->_maximumIterations, 0);
  objc_storeStrong((id *)&self->_l1Penalty, 0);
  objc_storeStrong((id *)&self->_l2Penalty, 0);
}

- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)init
{
  return [(FCNewsPersonalizationLogisticRegressionClassifierConfiguration *)self initWithDictionary:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationLogisticRegressionClassifierConfiguration *)self l2Penalty];
  [v3 appendFormat:@"; l2Penalty: %@", v4];

  v5 = [(FCNewsPersonalizationLogisticRegressionClassifierConfiguration *)self l1Penalty];
  [v3 appendFormat:@"; l1Penalty: %@", v5];

  uint64_t v6 = [(FCNewsPersonalizationLogisticRegressionClassifierConfiguration *)self maximumIterations];
  [v3 appendFormat:@"; maximumIterations: %@", v6];

  v7 = [(FCNewsPersonalizationLogisticRegressionClassifierConfiguration *)self stepSize];
  [v3 appendFormat:@"; stepSize: %@", v7];

  uint64_t v8 = [(FCNewsPersonalizationLogisticRegressionClassifierConfiguration *)self convergenceThreshold];
  [v3 appendFormat:@"; convergenceThreshold: %@", v8];

  [v3 appendString:@">"];
  return v3;
}

- (void)setL2Penalty:(id)a3
{
}

- (void)setL1Penalty:(id)a3
{
}

- (void)setMaximumIterations:(id)a3
{
}

- (void)setStepSize:(id)a3
{
}

- (void)setConvergenceThreshold:(id)a3
{
}

@end