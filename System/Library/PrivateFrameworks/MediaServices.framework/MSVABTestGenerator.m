@interface MSVABTestGenerator
- (MSVABTestGenerator)initWithProbabilityForOutcomeA:(float)a3;
- (float)probabilityForOutcomeA;
- (id)description;
- (int64_t)lastOutcome;
- (int64_t)nextOutcome;
- (int64_t)totalExperiments;
- (int64_t)totalForOutcomeA;
- (int64_t)totalForOutcomeB;
- (void)updateProbabilityForOutcomeA:(float)a3;
@end

@implementation MSVABTestGenerator

- (int64_t)totalForOutcomeB
{
  return self->_totalForOutcomeB;
}

- (int64_t)totalForOutcomeA
{
  return self->_totalForOutcomeA;
}

- (int64_t)totalExperiments
{
  return self->_totalExperiments;
}

- (float)probabilityForOutcomeA
{
  return self->_probabilityForOutcomeA;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"#outcomes: %ld, #A: %ld, #B: %ld, target A: %0.3f, actual A: %0.3f", self->_totalExperiments, self->_totalForOutcomeA, self->_totalForOutcomeB, self->_probabilityForOutcomeA, (float)((float)self->_totalForOutcomeA / (float)self->_totalExperiments)];
}

- (int64_t)lastOutcome
{
  int64_t totalExperiments = self->_totalExperiments;
  float probabilityForOutcomeA = self->_probabilityForOutcomeA;
  if (totalExperiments)
  {
    if (probabilityForOutcomeA >= 1.0)
    {
      return 0;
    }
    else
    {
      float v4 = (float)self->_totalForOutcomeA / (float)totalExperiments;
      BOOL v5 = probabilityForOutcomeA <= 0.0;
      if (v4 >= probabilityForOutcomeA) {
        return 1;
      }
    }
  }
  else
  {
    return probabilityForOutcomeA <= 0.0;
  }
  return v5;
}

- (int64_t)nextOutcome
{
  p_int64_t totalForOutcomeA = &self->_totalForOutcomeA;
  int64_t totalForOutcomeA = self->_totalForOutcomeA;
  int64_t v4 = self->_totalExperiments + 1;
  self->_int64_t totalExperiments = v4;
  float probabilityForOutcomeA = self->_probabilityForOutcomeA;
  if (probabilityForOutcomeA < 1.0
    && (probabilityForOutcomeA <= 0.0 || (float)((float)totalForOutcomeA / (float)v4) >= probabilityForOutcomeA))
  {
    int64_t totalForOutcomeA = self->_totalForOutcomeB;
    int64_t v6 = 1;
    p_int64_t totalForOutcomeA = &self->_totalForOutcomeB;
  }
  else
  {
    int64_t v6 = 0;
  }
  *p_int64_t totalForOutcomeA = totalForOutcomeA + 1;
  return v6;
}

- (void)updateProbabilityForOutcomeA:(float)a3
{
  self->_float probabilityForOutcomeA = a3;
  self->_int64_t totalForOutcomeA = 0;
  self->_totalForOutcomeB = 0;
  self->_int64_t totalExperiments = 0;
}

- (MSVABTestGenerator)initWithProbabilityForOutcomeA:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSVABTestGenerator;
  result = [(MSVABTestGenerator *)&v5 init];
  if (result)
  {
    result->_float probabilityForOutcomeA = a3;
    result->_int64_t totalExperiments = 0;
    result->_int64_t totalForOutcomeA = 0;
  }
  return result;
}

@end