@interface _UIViewAnimationAttributes
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasSpringAttributes;
- (CAFrameRateRange)_preferredFrameRateRange;
- (_UIViewAnimationAttributes)initWithBSXPCCoder:(id)a3;
- (_UIViewAnimationAttributes)initWithCoder:(id)a3;
- (double)_delay;
- (double)_duration;
- (double)_frameInterval;
- (double)_springDamping;
- (double)_springMass;
- (double)_springStiffness;
- (double)_springVelocity;
- (int64_t)_curve;
- (unsigned)_updateReason;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIViewAnimationAttributes

- (double)_duration
{
  return self->_duration;
}

- (double)_delay
{
  return self->_delay;
}

- (int64_t)_curve
{
  return (self->_options >> 16) & 7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_UIViewAnimationAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UIViewAnimationAttributes;
  v5 = [(_UIViewAnimationAttributes *)&v18 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"duration"];
    v5->_duration = v6;
    [v4 decodeFloatForKey:@"delay"];
    v5->_delay = v7;
    int v8 = [v4 decodeBoolForKey:@"hasSpringAttributes"];
    v5->_hasSpringAttributes = v8;
    if (v8)
    {
      [v4 decodeFloatForKey:@"springDamping"];
      v5->_springDamping = v9;
      [v4 decodeFloatForKey:@"springVelocity"];
      v5->_springVelocity = v10;
      [v4 decodeFloatForKey:@"springMass"];
      v5->_springMass = v11;
      [v4 decodeFloatForKey:@"springStiffness"];
      v5->_springStiffness = v12;
    }
    v5->_options = [v4 decodeIntegerForKey:@"options"];
    objc_msgSend(v4, "_ui_decodeCAFrameRateRangeForKey:", @"preferredFrameRateRange");
    v5->_preferredFrameRateRange.minimum = v13;
    v5->_preferredFrameRateRange.maximum = v14;
    v5->_preferredFrameRateRange.preferred = v15;
    v5->_updateReason = [v4 decodeInt32ForKey:@"updateReason"];
    v16 = v5;
  }

  return v5;
}

- (_UIViewAnimationAttributes)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIViewAnimationAttributes;
  v5 = [(_UIViewAnimationAttributes *)&v17 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v6;
    [v4 decodeDoubleForKey:@"delay"];
    v5->_delay = v7;
    int v8 = [v4 decodeBoolForKey:@"hasSpringAttributes"];
    v5->_hasSpringAttributes = v8;
    if (v8)
    {
      [v4 decodeDoubleForKey:@"springDamping"];
      v5->_springDamping = v9;
      [v4 decodeDoubleForKey:@"springVelocity"];
      v5->_springVelocity = v10;
      [v4 decodeDoubleForKey:@"springMass"];
      v5->_springMass = v11;
      [v4 decodeDoubleForKey:@"springStiffness"];
      v5->_springStiffness = v12;
    }
    v5->_options = [v4 decodeInt64ForKey:@"options"];
    float v13 = [v4 decodeStringForKey:@"preferredFrameRateRange"];
    v5->_preferredFrameRateRange.minimum = _CAFrameRateRangeFromString(v13);
    v5->_preferredFrameRateRange.maximum = v14;
    v5->_preferredFrameRateRange.preferred = v15;

    v5->_updateReason = [v4 decodeInt64ForKey:@"updateReason"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  double duration = self->_duration;
  if (duration != 0.0)
  {
    *(float *)&double duration = duration;
    [v15 encodeFloat:@"duration" forKey:duration];
  }
  double delay = self->_delay;
  if (delay != 0.0)
  {
    *(float *)&double delay = delay;
    [v15 encodeFloat:@"delay" forKey:delay];
  }
  unint64_t options = self->_options;
  if (options) {
    [v15 encodeInteger:options forKey:@"options"];
  }
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, *MEMORY[0x1E4F39AF0]))
  {
    *(float *)&double v7 = self->_preferredFrameRateRange.minimum;
    *(float *)&double v8 = self->_preferredFrameRateRange.maximum;
    *(float *)&double v9 = self->_preferredFrameRateRange.preferred;
    objc_msgSend(v15, "_ui_encodeCAFrameRateRange:forKey:", @"preferredFrameRateRange", v7, v8, v9);
    [v15 encodeInt32:self->_updateReason forKey:@"updateReason"];
  }
  if (self->_hasSpringAttributes) {
    [v15 encodeBool:1 forKey:@"hasSpringAttributes"];
  }
  double springDamping = self->_springDamping;
  double v11 = v15;
  if (springDamping != 0.0)
  {
    *(float *)&double springDamping = springDamping;
    [v15 encodeFloat:@"springDamping" forKey:springDamping];
    double v11 = v15;
  }
  double springVelocity = self->_springVelocity;
  if (springVelocity != 0.0)
  {
    *(float *)&double springVelocity = springVelocity;
    [v15 encodeFloat:@"springVelocity" forKey:springVelocity];
    double v11 = v15;
  }
  double springMass = self->_springMass;
  if (springMass != 0.0)
  {
    *(float *)&double springMass = springMass;
    [v15 encodeFloat:@"springMass" forKey:springMass];
    double v11 = v15;
  }
  double springStiffness = self->_springStiffness;
  if (springStiffness != 0.0)
  {
    *(float *)&double springStiffness = springStiffness;
    [v15 encodeFloat:@"springStiffness" forKey:springStiffness];
    double v11 = v15;
  }
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  if (self->_duration != 0.0) {
    objc_msgSend(v7, "encodeDouble:forKey:", @"duration");
  }
  if (self->_delay != 0.0) {
    objc_msgSend(v7, "encodeDouble:forKey:", @"delay");
  }
  unint64_t options = self->_options;
  if (options) {
    [v7 encodeInt64:options forKey:@"options"];
  }
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, *MEMORY[0x1E4F39AF0]))
  {
    v5 = _NSStringFromCAFrameRateRange(self->_preferredFrameRateRange.minimum, self->_preferredFrameRateRange.maximum, self->_preferredFrameRateRange.preferred);
    [v7 encodeObject:v5 forKey:@"preferredFrameRateRange"];

    [v7 encodeInt64:self->_updateReason forKey:@"updateReason"];
  }
  if (self->_hasSpringAttributes) {
    [v7 encodeBool:1 forKey:@"hasSpringAttributes"];
  }
  double v6 = v7;
  if (self->_springDamping != 0.0)
  {
    objc_msgSend(v7, "encodeDouble:forKey:", @"springDamping");
    double v6 = v7;
  }
  if (self->_springVelocity != 0.0)
  {
    objc_msgSend(v7, "encodeDouble:forKey:", @"springVelocity");
    double v6 = v7;
  }
  if (self->_springMass != 0.0)
  {
    objc_msgSend(v7, "encodeDouble:forKey:", @"springMass");
    double v6 = v7;
  }
  if (self->_springStiffness != 0.0)
  {
    objc_msgSend(v7, "encodeDouble:forKey:", @"springStiffness");
    double v6 = v7;
  }
}

- (double)_frameInterval
{
  if ((self->_options & 0xF000000) != 0) {
    return 1.0 / (240.0 / (double)((BYTE3(self->_options) & 0xF) + 1));
  }
  else {
    return 0.0;
  }
}

- (CAFrameRateRange)_preferredFrameRateRange
{
  float minimum = self->_preferredFrameRateRange.minimum;
  float maximum = self->_preferredFrameRateRange.maximum;
  float preferred = self->_preferredFrameRateRange.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (unsigned)_updateReason
{
  return self->_updateReason;
}

- (BOOL)_hasSpringAttributes
{
  return self->_hasSpringAttributes;
}

- (double)_springDamping
{
  return self->_springDamping;
}

- (double)_springVelocity
{
  return self->_springVelocity;
}

- (double)_springMass
{
  return self->_springMass;
}

- (double)_springStiffness
{
  return self->_springStiffness;
}

@end