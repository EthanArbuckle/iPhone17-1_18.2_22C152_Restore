@interface VGFaceSelectionFrustum
+ (BOOL)supportsSecureCoding;
+ (float)defaultPitchOffsetBottom;
+ (float)defaultPitchOffsetTop;
+ (float)defaultYawOffsetLeft;
+ (float)defaultYawOffsetRight;
- (BOOL)isEqual:(id)a3;
- (VGFaceSelectionFrustum)init;
- (VGFaceSelectionFrustum)initWithCoder:(id)a3;
- (float)pitchOffsetBottom;
- (float)pitchOffsetTop;
- (float)yawOffsetLeft;
- (float)yawOffsetRight;
- (id)description;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setPitchOffsetBottom:(float)a3;
- (void)setPitchOffsetTop:(float)a3;
- (void)setYawOffsetLeft:(float)a3;
- (void)setYawOffsetRight:(float)a3;
@end

@implementation VGFaceSelectionFrustum

- (VGFaceSelectionFrustum)init
{
  v9.receiver = self;
  v9.super_class = (Class)VGFaceSelectionFrustum;
  v2 = [(VGFaceSelectionFrustum *)&v9 init];
  if (v2)
  {
    [(id)objc_opt_class() defaultYawOffsetLeft];
    v2->_yawOffsetLeft = v3;
    [(id)objc_opt_class() defaultYawOffsetRight];
    v2->_yawOffsetRight = v4;
    [(id)objc_opt_class() defaultPitchOffsetTop];
    v2->_pitchOffsetTop = v5;
    [(id)objc_opt_class() defaultPitchOffsetBottom];
    v2->_pitchOffsetBottom = v6;
    v7 = v2;
  }

  return v2;
}

+ (float)defaultYawOffsetLeft
{
  return 10.0;
}

+ (float)defaultYawOffsetRight
{
  return 10.0;
}

+ (float)defaultPitchOffsetTop
{
  return 10.0;
}

+ (float)defaultPitchOffsetBottom
{
  return 10.0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Pose frustum offsets [yaw left %g, yaw right %g, pitch top %g, pitch bottom %g] ", self->_yawOffsetLeft, self->_yawOffsetRight, self->_pitchOffsetTop, self->_pitchOffsetBottom];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGFaceSelectionFrustum)initWithCoder:(id)a3
{
  id v4 = a3;
  float v5 = [(VGFaceSelectionFrustum *)self init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"selectionFrustumYawOffsetLeft"])
    {
      [v4 decodeFloatForKey:@"selectionFrustumYawOffsetLeft"];
      v5->_yawOffsetLeft = v6;
    }
    if ([v4 containsValueForKey:@"selectionFrustumYawOffsetRight"])
    {
      [v4 decodeFloatForKey:@"selectionFrustumYawOffsetRight"];
      v5->_yawOffsetRight = v7;
    }
    if ([v4 containsValueForKey:@"selectionFrustumPitchOffsetTop"])
    {
      [v4 decodeFloatForKey:@"selectionFrustumPitchOffsetTop"];
      v5->_pitchOffsetTop = v8;
    }
    if ([v4 containsValueForKey:@"selectionFrustumPitchOffsetBottom"])
    {
      [v4 decodeFloatForKey:@"selectionFrustumPitchOffsetBottom"];
      v5->_pitchOffsetBottom = v9;
    }
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = self->_yawOffsetLeft;
  id v9 = v4;
  [v4 encodeFloat:@"selectionFrustumYawOffsetLeft" forKey:v5];
  *(float *)&double v6 = self->_yawOffsetRight;
  [v9 encodeFloat:@"selectionFrustumYawOffsetRight" forKey:v6];
  *(float *)&double v7 = self->_pitchOffsetTop;
  [v9 encodeFloat:@"selectionFrustumPitchOffsetTop" forKey:v7];
  *(float *)&double v8 = self->_pitchOffsetBottom;
  [v9 encodeFloat:@"selectionFrustumPitchOffsetBottom" forKey:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    float yawOffsetLeft = self->_yawOffsetLeft;
    [v5 yawOffsetLeft];
    if (yawOffsetLeft == v7
      && (float yawOffsetRight = self->_yawOffsetRight, [v5 yawOffsetRight], yawOffsetRight == v9)
      && (float pitchOffsetTop = self->_pitchOffsetTop, [v5 pitchOffsetTop], pitchOffsetTop == v11))
    {
      float pitchOffsetBottom = self->_pitchOffsetBottom;
      [v5 pitchOffsetBottom];
      BOOL v14 = pitchOffsetBottom == v13;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)toDictionary
{
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = @"yawOffsetLeft";
  *(float *)&double v2 = self->_yawOffsetLeft;
  id v4 = [NSNumber numberWithFloat:v2];
  v14[0] = v4;
  v13[1] = @"yawOffsetRight";
  *(float *)&double v5 = self->_yawOffsetRight;
  double v6 = [NSNumber numberWithFloat:v5];
  v14[1] = v6;
  v13[2] = @"pitchOffsetTop";
  *(float *)&double v7 = self->_pitchOffsetTop;
  double v8 = [NSNumber numberWithFloat:v7];
  v14[2] = v8;
  v13[3] = @"pitchOffsetBottom";
  *(float *)&double v9 = self->_pitchOffsetBottom;
  v10 = [NSNumber numberWithFloat:v9];
  v14[3] = v10;
  float v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (float)yawOffsetLeft
{
  return self->_yawOffsetLeft;
}

- (void)setYawOffsetLeft:(float)a3
{
  self->_float yawOffsetLeft = a3;
}

- (float)yawOffsetRight
{
  return self->_yawOffsetRight;
}

- (void)setYawOffsetRight:(float)a3
{
  self->_float yawOffsetRight = a3;
}

- (float)pitchOffsetTop
{
  return self->_pitchOffsetTop;
}

- (void)setPitchOffsetTop:(float)a3
{
  self->_float pitchOffsetTop = a3;
}

- (float)pitchOffsetBottom
{
  return self->_pitchOffsetBottom;
}

- (void)setPitchOffsetBottom:(float)a3
{
  self->_float pitchOffsetBottom = a3;
}

@end