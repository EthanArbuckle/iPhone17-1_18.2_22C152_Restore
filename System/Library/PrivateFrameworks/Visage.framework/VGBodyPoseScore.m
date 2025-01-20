@interface VGBodyPoseScore
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VGBodyPoseScore)initWithCoder:(id)a3;
- (float)rawValue;
- (float)rawValueMarginMax;
- (float)rawValueMarginMin;
- (float)rawValueTargetMax;
- (float)rawValueTargetMin;
- (float)value;
- (unint64_t)feedback;
- (void)encodeWithCoder:(id)a3;
- (void)setFeedback:(unint64_t)a3;
- (void)setRawValue:(float)a3;
- (void)setRawValueMarginMax:(float)a3;
- (void)setRawValueMarginMin:(float)a3;
- (void)setRawValueTargetMax:(float)a3;
- (void)setRawValueTargetMin:(float)a3;
- (void)setValue:(float)a3;
@end

@implementation VGBodyPoseScore

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGBodyPoseScore)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VGBodyPoseScore *)self init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"value"];
    v5->_value = v6;
    v5->_feedback = (int)[v4 decodeIntForKey:@"feedback"];
    [v4 decodeFloatForKey:@"rawValue"];
    v5->_rawValue = v7;
    [v4 decodeFloatForKey:@"rawValueTargetMin"];
    v5->_rawValueTargetMin = v8;
    [v4 decodeFloatForKey:@"rawValueTargetMax"];
    v5->_rawValueTargetMax = v9;
    [v4 decodeFloatForKey:@"rawValueMarginMin"];
    v5->_rawValueMarginMin = v10;
    [v4 decodeFloatForKey:@"rawValueMarginMax"];
    v5->_rawValueMarginMax = v11;
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = self->_value;
  id v11 = v4;
  [v4 encodeFloat:@"value" forKey:v5];
  [v11 encodeInt:LODWORD(self->_feedback) forKey:@"feedback"];
  *(float *)&double v6 = self->_rawValue;
  [v11 encodeFloat:@"rawValue" forKey:v6];
  *(float *)&double v7 = self->_rawValueTargetMin;
  [v11 encodeFloat:@"rawValueTargetMin" forKey:v7];
  *(float *)&double v8 = self->_rawValueTargetMax;
  [v11 encodeFloat:@"rawValueTargetMax" forKey:v8];
  *(float *)&double v9 = self->_rawValueMarginMin;
  [v11 encodeFloat:@"rawValueMarginMin" forKey:v9];
  *(float *)&double v10 = self->_rawValueMarginMax;
  [v11 encodeFloat:@"rawValueMarginMax" forKey:v10];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = (float *)v4;
    BOOL v6 = self->_value == v5[2]
      && self->_feedback == *((void *)v5 + 4)
      && self->_rawValue == v5[3]
      && self->_rawValueTargetMin == v5[4]
      && self->_rawValueTargetMax == v5[5]
      && self->_rawValueMarginMin == v5[6]
      && self->_rawValueMarginMax == v5[7];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (unint64_t)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(unint64_t)a3
{
  self->_feedback = a3;
}

- (float)rawValue
{
  return self->_rawValue;
}

- (void)setRawValue:(float)a3
{
  self->_rawValue = a3;
}

- (float)rawValueTargetMin
{
  return self->_rawValueTargetMin;
}

- (void)setRawValueTargetMin:(float)a3
{
  self->_rawValueTargetMin = a3;
}

- (float)rawValueTargetMax
{
  return self->_rawValueTargetMax;
}

- (void)setRawValueTargetMax:(float)a3
{
  self->_rawValueTargetMax = a3;
}

- (float)rawValueMarginMin
{
  return self->_rawValueMarginMin;
}

- (void)setRawValueMarginMin:(float)a3
{
  self->_rawValueMarginMin = a3;
}

- (float)rawValueMarginMax
{
  return self->_rawValueMarginMax;
}

- (void)setRawValueMarginMax:(float)a3
{
  self->_rawValueMarginMax = a3;
}

@end