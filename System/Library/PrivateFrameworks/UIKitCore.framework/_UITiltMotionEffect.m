@interface _UITiltMotionEffect
- (_UITiltMotionEffect)initWithCoder:(id)a3;
- (double)maximumHorizontalTiltAngle;
- (double)maximumVerticalTiltAngle;
- (double)rotatingSphereRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumHorizontalTiltAngle:(double)a3;
- (void)setMaximumVerticalTiltAngle:(double)a3;
- (void)setRotatingSphereRadius:(double)a3;
@end

@implementation _UITiltMotionEffect

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  CGFloat v4 = a3.horizontal * self->_maximumHorizontalTiltAngle;
  CGFloat v5 = -(a3.vertical * self->_maximumVerticalTiltAngle);
  memset(&v13, 0, sizeof(v13));
  CATransform3DMakeTranslation(&v13, 0.0, 0.0, self->_rotatingSphereRadius);
  CATransform3D v11 = v13;
  CATransform3DRotate(&v12, &v11, v4, 0.0, 1.0, 0.0);
  *(_OWORD *)&v13.m31 = *(_OWORD *)&v12.m31;
  *(_OWORD *)&v13.m33 = *(_OWORD *)&v12.m33;
  *(_OWORD *)&v13.m41 = *(_OWORD *)&v12.m41;
  *(_OWORD *)&v13.m43 = *(_OWORD *)&v12.m43;
  *(_OWORD *)&v13.m11 = *(_OWORD *)&v12.m11;
  *(_OWORD *)&v13.m13 = *(_OWORD *)&v12.m13;
  *(_OWORD *)&v13.m21 = *(_OWORD *)&v12.m21;
  *(_OWORD *)&v13.m23 = *(_OWORD *)&v12.m23;
  __double2 v6 = __sincos_stret(v4);
  CATransform3D v11 = v13;
  CATransform3DRotate(&v12, &v11, v5, v6.__cosval, 0.0, v6.__sinval);
  *(_OWORD *)&v13.m31 = *(_OWORD *)&v12.m31;
  *(_OWORD *)&v13.m33 = *(_OWORD *)&v12.m33;
  *(_OWORD *)&v13.m41 = *(_OWORD *)&v12.m41;
  *(_OWORD *)&v13.m43 = *(_OWORD *)&v12.m43;
  *(_OWORD *)&v13.m11 = *(_OWORD *)&v12.m11;
  *(_OWORD *)&v13.m13 = *(_OWORD *)&v12.m13;
  double rotatingSphereRadius = self->_rotatingSphereRadius;
  *(_OWORD *)&v13.m21 = *(_OWORD *)&v12.m21;
  *(_OWORD *)&v13.m23 = *(_OWORD *)&v12.m23;
  CATransform3D v11 = v12;
  CATransform3DTranslate(&v12, &v11, 0.0, 0.0, -rotatingSphereRadius);
  CATransform3D v13 = v12;
  v14 = @"layer.transform";
  v8 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v12];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  return v9;
}

- (_UITiltMotionEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UITiltMotionEffect;
  CGFloat v5 = [(UIMotionEffect *)&v11 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"_maximumHorizontalTiltAngle"];
    v5->_maximumHorizontalTiltAngle = v6;
    [v4 decodeFloatForKey:@"_maximumVerticalTiltAngle"];
    v5->_maximumVerticalTiltAngle = v7;
    [v4 decodeFloatForKey:@"_rotatingSphereRadius"];
    v5->_double rotatingSphereRadius = v8;
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UITiltMotionEffect;
  id v4 = a3;
  [(UIMotionEffect *)&v8 encodeWithCoder:v4];
  double maximumHorizontalTiltAngle = self->_maximumHorizontalTiltAngle;
  *(float *)&double maximumHorizontalTiltAngle = maximumHorizontalTiltAngle;
  objc_msgSend(v4, "encodeFloat:forKey:", @"_maximumHorizontalTiltAngle", maximumHorizontalTiltAngle, v8.receiver, v8.super_class);
  double maximumVerticalTiltAngle = self->_maximumVerticalTiltAngle;
  *(float *)&double maximumVerticalTiltAngle = maximumVerticalTiltAngle;
  [v4 encodeFloat:@"_maximumVerticalTiltAngle" forKey:maximumVerticalTiltAngle];
  double rotatingSphereRadius = self->_rotatingSphereRadius;
  *(float *)&double rotatingSphereRadius = rotatingSphereRadius;
  [v4 encodeFloat:@"_rotatingSphereRadius" forKey:rotatingSphereRadius];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITiltMotionEffect;
  id result = [(UIMotionEffect *)&v5 copyWithZone:a3];
  *((void *)result + 3) = *(void *)&self->_maximumHorizontalTiltAngle;
  *((void *)result + 4) = *(void *)&self->_maximumVerticalTiltAngle;
  *((void *)result + 5) = *(void *)&self->_rotatingSphereRadius;
  return result;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  float v6 = [v3 stringWithFormat:@"<%@: %p maximumTiltAngle=(%f, %f) rotatingSphereRadius=%f>", v5, self, *(void *)&self->_maximumHorizontalTiltAngle, *(void *)&self->_maximumVerticalTiltAngle, *(void *)&self->_rotatingSphereRadius];

  return v6;
}

- (void)setRotatingSphereRadius:(double)a3
{
  if (a3 < 0.0)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    float v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"-[%@ rotatingSphereRadius] must be non-negative (%f provided)", v8, *(void *)&a3 format];
  }
  self->_double rotatingSphereRadius = a3;
}

- (double)maximumHorizontalTiltAngle
{
  return self->_maximumHorizontalTiltAngle;
}

- (void)setMaximumHorizontalTiltAngle:(double)a3
{
  self->_double maximumHorizontalTiltAngle = a3;
}

- (double)maximumVerticalTiltAngle
{
  return self->_maximumVerticalTiltAngle;
}

- (void)setMaximumVerticalTiltAngle:(double)a3
{
  self->_double maximumVerticalTiltAngle = a3;
}

- (double)rotatingSphereRadius
{
  return self->_rotatingSphereRadius;
}

@end