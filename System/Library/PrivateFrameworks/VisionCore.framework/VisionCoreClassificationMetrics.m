@interface VisionCoreClassificationMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VisionCoreClassificationMetrics)initWithCoder:(id)a3;
- (VisionCoreClassificationMetrics)initWithPrecisionCurve:(id)a3 recallCurve:(id)a4;
- (float)confidenceThresholdForPrecision:(float)a3;
- (float)confidenceThresholdForRecall:(float)a3;
- (float)precisionOfConfidence:(float)a3;
- (float)recallOfConfidence:(float)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreClassificationMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recallCurve, 0);
  objc_storeStrong((id *)&self->_precisionCurve, 0);
}

- (VisionCoreClassificationMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"P"];
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:v5 forKey:@"R"];
    if (v7)
    {
      self = [(VisionCoreClassificationMetrics *)self initWithPrecisionCurve:v6 recallCurve:v7];
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_precisionCurve forKey:@"P"];
  [v4 encodeObject:self->_recallCurve forKey:@"R"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreClassificationMetrics *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(VisionCoreValueConfidenceCurve *)self->_precisionCurve isEqual:v5->_precisionCurve]
        && [(VisionCoreValueConfidenceCurve *)self->_recallCurve isEqual:v5->_recallCurve];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"P: %@\nR: %@", self->_precisionCurve, self->_recallCurve];
  return v2;
}

- (float)recallOfConfidence:(float)a3
{
  -[VisionCoreValueConfidenceCurve valueForConfidence:](self->_recallCurve, "valueForConfidence:");
  return result;
}

- (float)precisionOfConfidence:(float)a3
{
  -[VisionCoreValueConfidenceCurve valueForConfidence:](self->_precisionCurve, "valueForConfidence:");
  return result;
}

- (float)confidenceThresholdForRecall:(float)a3
{
  -[VisionCoreValueConfidenceCurve confidenceForValue:](self->_recallCurve, "confidenceForValue:");
  return result;
}

- (float)confidenceThresholdForPrecision:(float)a3
{
  -[VisionCoreValueConfidenceCurve confidenceForValue:](self->_precisionCurve, "confidenceForValue:");
  return result;
}

- (VisionCoreClassificationMetrics)initWithPrecisionCurve:(id)a3 recallCurve:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VisionCoreClassificationMetrics;
  v8 = [(VisionCoreClassificationMetrics *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    precisionCurve = v8->_precisionCurve;
    v8->_precisionCurve = (VisionCoreValueConfidenceCurve *)v9;

    uint64_t v11 = [v7 copy];
    recallCurve = v8->_recallCurve;
    v8->_recallCurve = (VisionCoreValueConfidenceCurve *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end