@interface _UIParallaxMotionEffect
- (UIOffset)slideMagnitude;
- (_UIParallaxMotionEffect)init;
- (_UIParallaxMotionEffect)initWithCoder:(id)a3;
- (double)horizontalSlideAccelerationBoostFactor;
- (double)maximumHorizontalTiltAngle;
- (double)maximumVerticalTiltAngle;
- (double)rotatingSphereRadius;
- (double)verticalSlideAccelerationBoostFactor;
- (id)_keyPathsAndRelativeValuesForPose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3;
- (void)_activateTiltEffectIfNecessary;
- (void)_updateGroupMotionEffect;
- (void)_updateSlideEffectsWithCurrentSlideMagnitude;
- (void)encodeWithCoder:(id)a3;
- (void)setHorizontalSlideAccelerationBoostFactor:(double)a3;
- (void)setMaximumHorizontalTiltAngle:(double)a3;
- (void)setMaximumVerticalTiltAngle:(double)a3;
- (void)setRotatingSphereRadius:(double)a3;
- (void)setSlideMagnitude:(UIOffset)a3;
- (void)setVerticalSlideAccelerationBoostFactor:(double)a3;
@end

@implementation _UIParallaxMotionEffect

- (id)_keyPathsAndRelativeValuesForPose:(id)a3
{
  return [(UIMotionEffectGroup *)self->_group _keyPathsAndRelativeValuesForPose:a3];
}

- (void)setSlideMagnitude:(UIOffset)a3
{
  if (a3.horizontal != self->_slideMagnitude.horizontal || a3.vertical != self->_slideMagnitude.vertical)
  {
    self->_slideMagnitude = a3;
    [(_UIParallaxMotionEffect *)self _updateSlideEffectsWithCurrentSlideMagnitude];
  }
}

- (_UIParallaxMotionEffect)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UIParallaxMotionEffect;
  v2 = [(UIMotionEffect *)&v9 init];
  if (v2)
  {
    v3 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:0];
    horizontalSlideEffect = v2->_horizontalSlideEffect;
    v2->_horizontalSlideEffect = v3;

    v5 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:1];
    verticalSlideEffect = v2->_verticalSlideEffect;
    v2->_verticalSlideEffect = v5;

    _UIParallaxMotionEffectCommonInit(v2);
    v7 = v2;
  }

  return v2;
}

- (void)_updateSlideEffectsWithCurrentSlideMagnitude
{
  horizontalSlideEffect = self->_horizontalSlideEffect;
  p_slideMagnitude = &self->_slideMagnitude;
  double v5 = -self->_slideMagnitude.horizontal;
  if (self->_tiltEffect)
  {
    v6 = (void *)MEMORY[0x1E4F29238];
    CATransform3DMakeTranslation(&v27, v5, 0.0, 0.0);
    v7 = [v6 valueWithCATransform3D:&v27];
    [(UIInterpolatingMotionEffect *)horizontalSlideEffect setMinimumRelativeValue:v7];

    v8 = self->_horizontalSlideEffect;
    objc_super v9 = (void *)MEMORY[0x1E4F29238];
    CATransform3DMakeTranslation(&v26, p_slideMagnitude->horizontal, 0.0, 0.0);
    v10 = [v9 valueWithCATransform3D:&v26];
    [(UIInterpolatingMotionEffect *)v8 setMaximumRelativeValue:v10];

    verticalSlideEffect = self->_verticalSlideEffect;
    v12 = (void *)MEMORY[0x1E4F29238];
    CATransform3DMakeTranslation(&v25, 0.0, -p_slideMagnitude->vertical, 0.0);
    v13 = [v12 valueWithCATransform3D:&v25];
    [(UIInterpolatingMotionEffect *)verticalSlideEffect setMinimumRelativeValue:v13];

    v14 = self->_verticalSlideEffect;
    v15 = (void *)MEMORY[0x1E4F29238];
    CATransform3DMakeTranslation(&v24, 0.0, p_slideMagnitude->vertical, 0.0);
    v16 = [v15 valueWithCATransform3D:&v24];
    [(UIInterpolatingMotionEffect *)v14 setMaximumRelativeValue:v16];
  }
  else
  {
    v17 = [NSNumber numberWithDouble:v5];
    [(UIInterpolatingMotionEffect *)horizontalSlideEffect setMinimumRelativeValue:v17];

    v18 = self->_horizontalSlideEffect;
    v19 = [NSNumber numberWithDouble:p_slideMagnitude->horizontal];
    [(UIInterpolatingMotionEffect *)v18 setMaximumRelativeValue:v19];

    v20 = self->_verticalSlideEffect;
    v21 = [NSNumber numberWithDouble:-p_slideMagnitude->vertical];
    [(UIInterpolatingMotionEffect *)v20 setMinimumRelativeValue:v21];

    v22 = self->_verticalSlideEffect;
    id v23 = [NSNumber numberWithDouble:p_slideMagnitude->vertical];
    [(UIInterpolatingMotionEffect *)v22 setMaximumRelativeValue:v23];
  }
}

- (void)_updateGroupMotionEffect
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_tiltEffect)
  {
    horizontalSlideEffect = self->_horizontalSlideEffect;
    tiltEffect = self->_tiltEffect;
    v12 = horizontalSlideEffect;
    verticalSlideEffect = self->_verticalSlideEffect;
    v4 = (void *)MEMORY[0x1E4F1C978];
    p_tiltEffect = &tiltEffect;
    uint64_t v6 = 3;
  }
  else
  {
    v7 = self->_verticalSlideEffect;
    objc_super v9 = self->_horizontalSlideEffect;
    v10 = v7;
    v4 = (void *)MEMORY[0x1E4F1C978];
    p_tiltEffect = (_UITiltMotionEffect **)&v9;
    uint64_t v6 = 2;
  }
  v8 = objc_msgSend(v4, "arrayWithObjects:count:", p_tiltEffect, v6, v9, v10, tiltEffect, v12, verticalSlideEffect, v14);
  [(UIMotionEffectGroup *)self->_group setMotionEffects:v8];
}

- (UIOffset)slideMagnitude
{
  double horizontal = self->_slideMagnitude.horizontal;
  double vertical = self->_slideMagnitude.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiltEffect, 0);
  objc_storeStrong((id *)&self->_verticalSlideEffect, 0);
  objc_storeStrong((id *)&self->_horizontalSlideEffect, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIParallaxMotionEffect;
  v4 = [(UIMotionEffect *)&v12 copyWithZone:a3];
  uint64_t v5 = [(UIInterpolatingMotionEffect *)self->_horizontalSlideEffect copy];
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(UIInterpolatingMotionEffect *)self->_verticalSlideEffect copy];
  v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(_UITiltMotionEffect *)self->_tiltEffect copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  _UIParallaxMotionEffectCommonInit(v4);
  objc_msgSend(v4, "setSlideMagnitude:", self->_slideMagnitude.horizontal, self->_slideMagnitude.vertical);
  return v4;
}

- (_UIParallaxMotionEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIParallaxMotionEffect;
  uint64_t v5 = [(UIMotionEffect *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"horizontalSlideEffect"];
    horizontalSlideEffect = v5->_horizontalSlideEffect;
    v5->_horizontalSlideEffect = (UIInterpolatingMotionEffect *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"verticalSlideEffect"];
    verticalSlideEffect = v5->_verticalSlideEffect;
    v5->_verticalSlideEffect = (UIInterpolatingMotionEffect *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"tiltEffect"];
    tiltEffect = v5->_tiltEffect;
    v5->_tiltEffect = (_UITiltMotionEffect *)v10;

    [v4 decodeUIOffsetForKey:@"slideMagnitude"];
    -[_UIParallaxMotionEffect setSlideMagnitude:](v5, "setSlideMagnitude:");
    _UIParallaxMotionEffectCommonInit(v5);
    objc_super v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIParallaxMotionEffect;
  [(UIMotionEffect *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_horizontalSlideEffect forKey:@"horizontalSlideEffect"];
  [v4 encodeObject:self->_verticalSlideEffect forKey:@"verticalSlideEffect"];
  objc_msgSend(v4, "encodeUIOffset:forKey:", @"slideMagnitude", self->_slideMagnitude.horizontal, self->_slideMagnitude.vertical);
  tiltEffect = self->_tiltEffect;
  if (tiltEffect) {
    [v4 encodeObject:tiltEffect forKey:@"tiltEffect"];
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [(_UIParallaxMotionEffect *)self slideMagnitude];
  objc_super v6 = NSStringFromUIOffset(v19);
  [(_UIParallaxMotionEffect *)self horizontalSlideAccelerationBoostFactor];
  uint64_t v8 = v7;
  [(_UIParallaxMotionEffect *)self verticalSlideAccelerationBoostFactor];
  uint64_t v10 = v9;
  [(_UIParallaxMotionEffect *)self maximumHorizontalTiltAngle];
  uint64_t v12 = v11;
  [(_UIParallaxMotionEffect *)self maximumVerticalTiltAngle];
  uint64_t v14 = v13;
  [(_UIParallaxMotionEffect *)self rotatingSphereRadius];
  v16 = [v3 stringWithFormat:@"<%@: %p slideMagnitude=%@ accelerationBoostFactor=(%f, %f) maximumTiltAngle=(%f, %f) rotatingSphereRadius=%f>", v5, self, v6, v8, v10, v12, v14, v15];

  return v16;
}

- (void)setHorizontalSlideAccelerationBoostFactor:(double)a3
{
}

- (double)horizontalSlideAccelerationBoostFactor
{
  [(UIInterpolatingMotionEffect *)self->_horizontalSlideEffect _horizontalAccelerationBoostFactor];
  return result;
}

- (void)setVerticalSlideAccelerationBoostFactor:(double)a3
{
}

- (double)verticalSlideAccelerationBoostFactor
{
  [(UIInterpolatingMotionEffect *)self->_verticalSlideEffect _verticalAccelerationBoostFactor];
  return result;
}

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  return -[UIMotionEffectGroup keyPathsAndRelativeValuesForViewerOffset:](self->_group, "keyPathsAndRelativeValuesForViewerOffset:", a3.horizontal, a3.vertical);
}

- (void)_activateTiltEffectIfNecessary
{
  if (!self->_tiltEffect)
  {
    v3 = objc_alloc_init(_UITiltMotionEffect);
    tiltEffect = self->_tiltEffect;
    self->_tiltEffect = v3;

    [(_UIParallaxMotionEffect *)self _updateGroupMotionEffect];
    [(UIInterpolatingMotionEffect *)self->_horizontalSlideEffect _setKeyPath:@"layer.transform"];
    [(UIInterpolatingMotionEffect *)self->_verticalSlideEffect _setKeyPath:@"layer.transform"];
    [(_UIParallaxMotionEffect *)self _updateSlideEffectsWithCurrentSlideMagnitude];
  }
}

- (void)setMaximumHorizontalTiltAngle:(double)a3
{
  [(_UIParallaxMotionEffect *)self _activateTiltEffectIfNecessary];
  tiltEffect = self->_tiltEffect;
  [(_UITiltMotionEffect *)tiltEffect setMaximumHorizontalTiltAngle:a3];
}

- (double)maximumHorizontalTiltAngle
{
  [(_UITiltMotionEffect *)self->_tiltEffect maximumHorizontalTiltAngle];
  return result;
}

- (void)setMaximumVerticalTiltAngle:(double)a3
{
  [(_UIParallaxMotionEffect *)self _activateTiltEffectIfNecessary];
  tiltEffect = self->_tiltEffect;
  [(_UITiltMotionEffect *)tiltEffect setMaximumVerticalTiltAngle:a3];
}

- (double)maximumVerticalTiltAngle
{
  [(_UITiltMotionEffect *)self->_tiltEffect maximumVerticalTiltAngle];
  return result;
}

- (void)setRotatingSphereRadius:(double)a3
{
  [(_UIParallaxMotionEffect *)self _activateTiltEffectIfNecessary];
  tiltEffect = self->_tiltEffect;
  [(_UITiltMotionEffect *)tiltEffect setRotatingSphereRadius:a3];
}

- (double)rotatingSphereRadius
{
  [(_UITiltMotionEffect *)self->_tiltEffect rotatingSphereRadius];
  return result;
}

@end