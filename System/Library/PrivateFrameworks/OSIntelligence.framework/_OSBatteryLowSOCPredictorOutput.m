@interface _OSBatteryLowSOCPredictorOutput
+ (BOOL)supportsSecureCoding;
- (BOOL)lowSOCPredicted;
- (NSString)modelName;
- (NSString)modelVersion;
- (_OSBatteryLowSOCPredictorOutput)initWithCoder:(id)a3;
- (double)confidence;
- (double)confidenceThreshold;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setConfidenceThreshold:(double)a3;
- (void)setLowSOCPredicted:(BOOL)a3;
- (void)setModelName:(id)a3;
- (void)setModelVersion:(id)a3;
@end

@implementation _OSBatteryLowSOCPredictorOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double confidence = self->_confidence;
  id v5 = a3;
  [v5 encodeDouble:@"confidence" forKey:confidence];
  [v5 encodeDouble:@"confidenceThreshold" forKey:self->_confidenceThreshold];
  [v5 encodeBool:self->_lowSOCPredicted forKey:@"lowSOCPredicted"];
}

- (_OSBatteryLowSOCPredictorOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_OSBatteryLowSOCPredictorOutput;
  id v5 = [(_OSBatteryLowSOCPredictorOutput *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"confidence"];
    v5->_double confidence = v6;
    [v4 decodeDoubleForKey:@"confidenceThreshold"];
    v5->_confidenceThreshold = v7;
    v5->_lowSOCPredicted = [v4 decodeBoolForKey:@"lowSOCPredicted"];
    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_OSLowSOCPredictionOutput: lowSOCPredicted %d, Confidence: %.2lf, Confidence Threshold: %.21f>", self->_lowSOCPredicted, *(void *)&self->_confidence, *(void *)&self->_confidenceThreshold];
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_double confidence = a3;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

- (BOOL)lowSOCPredicted
{
  return self->_lowSOCPredicted;
}

- (void)setLowSOCPredicted:(BOOL)a3
{
  self->_lowSOCPredicted = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);

  objc_storeStrong((id *)&self->_modelName, 0);
}

@end