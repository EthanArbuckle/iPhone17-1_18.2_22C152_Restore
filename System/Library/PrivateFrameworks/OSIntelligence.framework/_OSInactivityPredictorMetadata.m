@interface _OSInactivityPredictorMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)requireEnoughHistory;
- (NSString)description;
- (NSString)modelVersion;
- (NSString)predictorType;
- (NSString)queryingMechanism;
- (_OSInactivityPredictorMetadata)initWithCoder:(id)a3;
- (_OSInactivityPredictorMetadata)initWithProtocolConformer:(id)a3;
- (double)confidenceThresholdRelaxed;
- (double)confidenceThresholdStrict;
- (double)longThreshold;
- (double)recommendedWaitTime;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceThresholdRelaxed:(double)a3;
- (void)setConfidenceThresholdStrict:(double)a3;
- (void)setLongThreshold:(double)a3;
- (void)setModelVersion:(id)a3;
- (void)setPredictorType:(id)a3;
- (void)setQueryingMechanism:(id)a3;
- (void)setRecommendedWaitTime:(double)a3;
- (void)setRequireEnoughHistory:(BOOL)a3;
@end

@implementation _OSInactivityPredictorMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  modelVersion = self->modelVersion;
  id v5 = a3;
  [v5 encodeObject:modelVersion forKey:@"modelVersion"];
  [v5 encodeObject:self->predictorType forKey:@"predictorType"];
  [v5 encodeObject:self->queryingMechanism forKey:@"queryingMechanism"];
  [v5 encodeDouble:@"recommendedWaitTime" forKey:self->recommendedWaitTime];
  [v5 encodeDouble:@"longThreshold" forKey:self->longThreshold];
  [v5 encodeDouble:@"confidenceThresholdStrict" forKey:self->confidenceThresholdStrict];
  [v5 encodeDouble:@"confidenceThresholdRelaxed" forKey:self->confidenceThresholdRelaxed];
  [v5 encodeBool:self->requireEnoughHistory forKey:@"requireEnoughHistory"];
}

- (_OSInactivityPredictorMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_OSInactivityPredictorMetadata;
  id v5 = [(_OSInactivityPredictorMetadata *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelVersion"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"None";
    }
    objc_storeStrong((id *)&v5->modelVersion, v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictorType"];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = @"None";
    }
    objc_storeStrong((id *)&v5->predictorType, v11);

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryingMechanism"];
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = @"None";
    }
    objc_storeStrong((id *)&v5->queryingMechanism, v14);

    [v4 decodeDoubleForKey:@"recommendedWaitTime"];
    v5->recommendedWaitTime = v15;
    [v4 decodeDoubleForKey:@"longThreshold"];
    v5->longThreshold = v16;
    [v4 decodeDoubleForKey:@"confidenceThresholdStrict"];
    v5->confidenceThresholdStrict = v17;
    [v4 decodeDoubleForKey:@"confidenceThresholdRelaxed"];
    v5->confidenceThresholdRelaxed = v18;
    v5->requireEnoughHistory = [v4 decodeBoolForKey:@"requireEnoughHistory"];
    v19 = v5;
  }

  return v5;
}

- (_OSInactivityPredictorMetadata)initWithProtocolConformer:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_OSInactivityPredictorMetadata;
  id v5 = [(_OSInactivityPredictorMetadata *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 modelVersion];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"None";
    }
    objc_storeStrong((id *)&v5->modelVersion, v8);

    uint64_t v9 = [v4 predictorType];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = @"None";
    }
    objc_storeStrong((id *)&v5->predictorType, v11);

    uint64_t v12 = [v4 queryingMechanism];
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = @"None";
    }
    objc_storeStrong((id *)&v5->queryingMechanism, v14);

    [v4 recommendedWaitTime];
    v5->recommendedWaitTime = v15;
    [v4 longThreshold];
    v5->longThreshold = v16;
    [v4 confidenceThresholdStrict];
    v5->confidenceThresholdStrict = v17;
    [v4 confidenceThresholdRelaxed];
    v5->confidenceThresholdRelaxed = v18;
    v5->requireEnoughHistory = [v4 requireEnoughHistory];
    v19 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(_OSInactivityPredictorMetadata *)self predictorType];
  id v5 = [(_OSInactivityPredictorMetadata *)self queryingMechanism];
  [(_OSInactivityPredictorMetadata *)self recommendedWaitTime];
  double v7 = v6 / 60.0;
  [(_OSInactivityPredictorMetadata *)self longThreshold];
  double v9 = v8 / 3600.0;
  [(_OSInactivityPredictorMetadata *)self confidenceThresholdRelaxed];
  uint64_t v11 = v10;
  [(_OSInactivityPredictorMetadata *)self confidenceThresholdStrict];
  v13 = [v3 stringWithFormat:@"### Inactivity Predictor\n- Model Type: %@\n- How to Query: %@\n- Wait Time Before Query: %.2f minutes\n- Definition of Long Inactivity: >%.2f hours\n- Confidence Spectrum: 0 --- low --- %.2f --- medium --- %.2f --- high --- 1", v4, v5, *(void *)&v7, *(void *)&v9, v11, v12];

  return (NSString *)v13;
}

- (NSString)modelVersion
{
  return self->modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)predictorType
{
  return self->predictorType;
}

- (void)setPredictorType:(id)a3
{
}

- (NSString)queryingMechanism
{
  return self->queryingMechanism;
}

- (void)setQueryingMechanism:(id)a3
{
}

- (double)recommendedWaitTime
{
  return self->recommendedWaitTime;
}

- (void)setRecommendedWaitTime:(double)a3
{
  self->recommendedWaitTime = a3;
}

- (double)longThreshold
{
  return self->longThreshold;
}

- (void)setLongThreshold:(double)a3
{
  self->longThreshold = a3;
}

- (double)confidenceThresholdStrict
{
  return self->confidenceThresholdStrict;
}

- (void)setConfidenceThresholdStrict:(double)a3
{
  self->confidenceThresholdStrict = a3;
}

- (double)confidenceThresholdRelaxed
{
  return self->confidenceThresholdRelaxed;
}

- (void)setConfidenceThresholdRelaxed:(double)a3
{
  self->confidenceThresholdRelaxed = a3;
}

- (BOOL)requireEnoughHistory
{
  return self->requireEnoughHistory;
}

- (void)setRequireEnoughHistory:(BOOL)a3
{
  self->requireEnoughHistory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queryingMechanism, 0);
  objc_storeStrong((id *)&self->predictorType, 0);

  objc_storeStrong((id *)&self->modelVersion, 0);
}

@end