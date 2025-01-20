@interface _UIHIDPath
- (BOOL)isTouching;
- (CGPoint)position;
- (NSNumber)overridePathId;
- (NSNumber)pathId;
- (_UIHIDPath)init;
- (double)density;
- (double)force;
- (double)irregularity;
- (double)majorRadius;
- (double)minorRadius;
- (double)quality;
- (double)twist;
- (int64_t)deliveryPhase;
- (int64_t)generationCount;
- (unsigned)identity;
- (void)applyTransform:(CGAffineTransform *)a3;
- (void)setDeliveryPhase:(int64_t)a3;
- (void)setOverridePathId:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)updateWithHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation _UIHIDPath

- (_UIHIDPath)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIHIDPath;
  result = [(_UIHIDPath *)&v3 init];
  if (result) {
    result->_deliveryPhase = 0;
  }
  return result;
}

- (void)updateWithHIDEvent:(__IOHIDEvent *)a3
{
  int Type = IOHIDEventGetType();
  if (Type == 7)
  {
    uint64_t v15 = [(_UIHIDPath *)self overridePathId];
    v16 = (void *)v15;
    if (v15) {
      v17 = (void *)v15;
    }
    else {
      v17 = &unk_1ED3F6540;
    }
    objc_storeStrong((id *)&self->_pathId, v17);

    v18 = _UIEventHIDGetChildPointerEvent((uint64_t)a3);
    if (dyld_program_sdk_at_least())
    {
      if (!v18)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2 object:self file:@"_UIHIDPath.m" lineNumber:128 description:@"scale event missing child pointer event"];
      }
    }
    else if (!v18)
    {
      v35 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1205) + 8);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "scale event missing child pointer event", v36, 2u);
      }
    }
    IOHIDEventGetFloatValue();
    CGFloat v32 = v31;
    IOHIDEventGetFloatValue();
    self->_position.x = v32;
    self->_position.y = v33;
    *(_OWORD *)&self->_majorRadius = xmmword_186B9BE20;
    *(_OWORD *)&self->_density = xmmword_186B9BE30;
    self->_twist = 90.0;
    self->_generationCount = 0;
    *(_OWORD *)&self->_force = xmmword_186B9BE40;
    self->_identity = 0;
    _ZF = (IOHIDEventGetPhase() & 0xC) == 0;
LABEL_22:
    BOOL v34 = !_ZF;
    self->_touching = v34;
    return;
  }
  if (Type != 17)
  {
    if (Type != 11) {
      return;
    }
    v7 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue()];
    pathId = self->_pathId;
    self->_pathId = v7;

    IOHIDEventGetFloatValue();
    CGFloat v10 = v9;
    IOHIDEventGetFloatValue();
    self->_position.x = v10;
    self->_position.y = v11;
    IOHIDEventGetFloatValue();
    self->_majorRadius = v12;
    self->_generationCount = IOHIDEventGetIntegerValue();
    IOHIDEventGetFloatValue();
    self->_force = v13;
    self->_identity = IOHIDEventGetIntegerValue();
    _ZF = IOHIDEventGetIntegerValue() == 0;
    goto LABEL_22;
  }
  uint64_t v20 = [(_UIHIDPath *)self overridePathId];
  v21 = (void *)v20;
  if (v20) {
    v22 = (void *)v20;
  }
  else {
    v22 = &unk_1ED3F6540;
  }
  objc_storeStrong((id *)&self->_pathId, v22);

  IOHIDEventGetFloatValue();
  CGFloat v24 = v23;
  IOHIDEventGetFloatValue();
  self->_position.x = v24;
  self->_position.y = v25;
  __asm { FMOV            V1.2D, #1.5 }
  *(_OWORD *)&self->_minorRadius = xmmword_186B9BE50;
  *(_OWORD *)&self->_quality = _Q1;
  *(_OWORD *)&self->_irregularity = xmmword_186B9BE60;
  self->_generationCount = 0;
  self->_identity = 0;
  self->_touching = IOHIDEventGetIntegerValue() != 0;
  self->_force = 0.0;
  if (qword_1EB262640 != -1) {
    dispatch_once(&qword_1EB262640, &__block_literal_global_464);
  }
  if (_UIHIDPathShouldPopulatePointerForce_shouldPopulate)
  {
    BKSHIDEventGetDigitizerAttributes();

    if (_os_feature_enabled_impl())
    {
      if (!_UIEventHIDGetChildForceStageEvent((uint64_t)a3)) {
        return;
      }
      IOHIDEventGetDoubleValue();
    }
    else
    {
      if (!_UIEventHIDGetChildVendorDefinedForceStageEvent((uint64_t)a3)) {
        return;
      }
      double v30 = *(double *)(IOHIDEventGetDataValue() + 32);
    }
    self->_force = v30 * 1000.0;
  }
}

- (void)applyTransform:(CGAffineTransform *)a3
{
  self->_position = (CGPoint)vaddq_f64(*(float64x2_t *)&a3->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a3->a, self->_position.x), vmulq_n_f64(*(float64x2_t *)&a3->c, self->_position.y)));
}

- (NSNumber)pathId
{
  return self->_pathId;
}

- (unsigned)identity
{
  return self->_identity;
}

- (double)force
{
  return self->_force;
}

- (double)minorRadius
{
  return self->_minorRadius;
}

- (double)majorRadius
{
  return self->_majorRadius;
}

- (double)quality
{
  return self->_quality;
}

- (double)density
{
  return self->_density;
}

- (double)irregularity
{
  return self->_irregularity;
}

- (double)twist
{
  return self->_twist;
}

- (int64_t)generationCount
{
  return self->_generationCount;
}

- (BOOL)isTouching
{
  return self->_touching;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (NSNumber)overridePathId
{
  return self->_overridePathId;
}

- (void)setOverridePathId:(id)a3
{
}

- (int64_t)deliveryPhase
{
  return self->_deliveryPhase;
}

- (void)setDeliveryPhase:(int64_t)a3
{
  self->_deliveryPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridePathId, 0);
  objc_storeStrong((id *)&self->_pathId, 0);
}

@end