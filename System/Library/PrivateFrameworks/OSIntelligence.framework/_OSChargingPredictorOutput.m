@interface _OSChargingPredictorOutput
+ (BOOL)supportsSecureCoding;
- (BOOL)meetsSystemConfidenceThreshold;
- (_OSChargingPredictorOutput)initWithCoder:(id)a3;
- (double)chargingDuration;
- (double)confidence;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChargingDuration:(double)a3;
- (void)setConfidence:(double)a3;
- (void)setMeetsSystemConfidenceThreshold:(BOOL)a3;
@end

@implementation _OSChargingPredictorOutput

- (BOOL)meetsSystemConfidenceThreshold
{
  return self->_meetsSystemConfidenceThreshold;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double confidence = self->_confidence;
  id v5 = a3;
  [v5 encodeDouble:@"confidence" forKey:confidence];
  [v5 encodeBool:self->_meetsSystemConfidenceThreshold forKey:@"meetsThreshold"];
  [v5 encodeDouble:@"chargingDuration" forKey:self->_chargingDuration];
}

- (_OSChargingPredictorOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_OSChargingPredictorOutput;
  id v5 = [(_OSChargingPredictorOutput *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"confidence"];
    v5->_double confidence = v6;
    v5->_meetsSystemConfidenceThreshold = [v4 decodeBoolForKey:@"meetsThreshold"];
    [v4 decodeDoubleForKey:@"chargingDuration"];
    v5->_chargingDuration = v7;
    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_OSChargingPredictionOutput: Duration %.0lfm, Confidence: %.2lf>", self->_chargingDuration / 60.0, *(void *)&self->_confidence];
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_double confidence = a3;
}

- (void)setMeetsSystemConfidenceThreshold:(BOOL)a3
{
  self->_meetsSystemConfidenceThreshold = a3;
}

- (double)chargingDuration
{
  return self->_chargingDuration;
}

- (void)setChargingDuration:(double)a3
{
  self->_chargingDuration = a3;
}

@end