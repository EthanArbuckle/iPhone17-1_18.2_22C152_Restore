@interface _UITransformGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformInView:(SEL)a3;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)translation;
- (CGPoint)translationInView:(id)a3;
- (double)rotation;
- (double)scale;
- (float64x2_t)_anchorPoint;
- (id)_driver;
- (void)_stateUpdatedForDriver:(id)a3 previousState:(int64_t)a4;
- (void)_transformChangedWithEvent:(id)a3;
- (void)reset;
@end

@implementation _UITransformGestureRecognizer

- (id)_driver
{
  v14[2] = *MEMORY[0x1E4F143B8];
  composedDriver = self->_composedDriver;
  if (!composedDriver)
  {
    v4 = (_UIPinchGestureRecognizerDriver *)objc_opt_new();
    pinchDriver = self->_pinchDriver;
    self->_pinchDriver = v4;

    v6 = (_UIRotationGestureRecognizerDriver *)objc_opt_new();
    rotationDriver = self->_rotationDriver;
    self->_rotationDriver = v6;

    v8 = self->_rotationDriver;
    v14[0] = self->_pinchDriver;
    v14[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    _UIGestureRecognizerComposeParallelDrivers(v9);
    v10 = (_UIGestureRecognizerDriver *)objc_claimAutoreleasedReturnValue();
    v11 = self->_composedDriver;
    self->_composedDriver = v10;

    v12 = self->_pinchDriver;
    if (v12) {
      *(unsigned char *)&v12->_flags |= 1u;
    }
    composedDriver = self->_composedDriver;
  }
  return composedDriver;
}

- (CGPoint)locationInView:(id)a3
{
  *(void *)&double v5 = *(_OWORD *)&-[_UITransformGestureRecognizer _anchorPoint]((uint64_t)self);
  [(UIGestureRecognizer *)self _convertPoint:a3 fromSceneReferenceCoordinatesToView:v5];
  result.y = v7;
  result.x = v6;
  return result;
}

- (float64x2_t)_anchorPoint
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 272);
    float64x2_t v2 = 0uLL;
    float64x2_t v3 = 0uLL;
    if (v1) {
      float64x2_t v3 = *(float64x2_t *)(v1 + 168);
    }
    v4 = *(float64x2_t **)(a1 + 280);
    if (v4) {
      float64x2_t v2 = v4[8];
    }
    float64x2_t v5 = vaddq_f64(v3, v2);
    __asm { FMOV            V1.2D, #0.5 }
    return vaddq_f64(vmulq_f64(v5, _Q1), *(float64x2_t *)(a1 + 296));
  }
  else
  {
    return (float64x2_t)0;
  }
}

- (void)reset
{
  pinchDriver = self->_pinchDriver;
  if (pinchDriver) {
    pinchDriver->_hysteresis = 8.0;
  }
  rotationDriver = self->_rotationDriver;
  if (rotationDriver) {
    rotationDriver->_hysteresisEnabled = 1;
  }
  self->_eventTranslation = (CGPoint)*MEMORY[0x1E4F1DAD8];
}

- (void)_stateUpdatedForDriver:(id)a3 previousState:(int64_t)a4
{
  uint64_t v6 = [a3 state];
  if ((unint64_t)(a4 - 1) >= 2 && (unint64_t)(v6 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    if ((unint64_t)([(_UIGestureRecognizerDriver *)self->_pinchDriver state] - 1) <= 1
      && (unint64_t)([(_UIGestureRecognizerDriver *)self->_rotationDriver state] - 1) >= 2)
    {
      rotationDriver = self->_rotationDriver;
      if (rotationDriver) {
        rotationDriver->_hysteresisEnabled = 0;
      }
    }
    else if ((unint64_t)([(_UIGestureRecognizerDriver *)self->_rotationDriver state] - 1) <= 1 {
           && (unint64_t)([(_UIGestureRecognizerDriver *)self->_rotationDriver state] - 1) >= 2)
    }
    {
      pinchDriver = self->_pinchDriver;
      if (pinchDriver) {
        pinchDriver->_hysteresis = 0.0;
      }
    }
  }
}

- (void)_transformChangedWithEvent:(id)a3
{
  p_eventTranslation = &self->_eventTranslation;
  [a3 translation];
  p_eventTranslation->x = v4;
  p_eventTranslation->y = v5;
}

- (double)scale
{
  pinchDriver = self->_pinchDriver;
  if (pinchDriver) {
    return pinchDriver->_transform.a;
  }
  else {
    return 0.0;
  }
}

- (double)rotation
{
  rotationDriver = self->_rotationDriver;
  if (rotationDriver) {
    return rotationDriver->_initialTouchAngle
  }
         - rotationDriver->_currentTouchAngle
         + (double)rotationDriver->_currentRotationCount * 6.28318531;
  else {
    return 0.0;
  }
}

- (CGPoint)translation
{
  float64x2_t v3 = [(UIGestureRecognizer *)self view];
  [(_UITransformGestureRecognizer *)self translationInView:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGAffineTransform)transform
{
  id v5 = [(UIGestureRecognizer *)self view];
  [(_UITransformGestureRecognizer *)self transformInView:v5];

  return result;
}

- (CGAffineTransform)transformInView:(SEL)a3
{
  [(_UITransformGestureRecognizer *)self scale];
  CGFloat v8 = v7;
  [(_UITransformGestureRecognizer *)self translationInView:a4];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = MEMORY[0x1E4F1DAB8];
  long long v14 = *MEMORY[0x1E4F1DAB8];
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v15;
  long long v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)&retstr->tx = v16;
  *(_OWORD *)&v24.a = v14;
  *(_OWORD *)&v24.c = v15;
  *(_OWORD *)&v24.tx = v16;
  CGAffineTransformScale(retstr, &v24, v8, v8);
  [(_UITransformGestureRecognizer *)self rotation];
  long long v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v23.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v23.c = v17;
  *(_OWORD *)&v23.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformRotate(&v24, &v23, v18);
  long long v19 = *(_OWORD *)&v24.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v24.a;
  *(_OWORD *)&retstr->c = v19;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v24.tx;
  long long v20 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v23.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v23.c = v20;
  *(_OWORD *)&v23.tx = *(_OWORD *)&retstr->tx;
  CGPoint result = CGAffineTransformTranslate(&v24, &v23, v10, v12);
  long long v22 = *(_OWORD *)&v24.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v24.a;
  *(_OWORD *)&retstr->c = v22;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v24.tx;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  if (self)
  {
    pinchDriver = self->_pinchDriver;
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    if (pinchDriver)
    {
      p_x = &pinchDriver->_initialAnchorPoint.x;
      double v8 = *p_x;
      double v7 = p_x[1];
    }
    rotationDriver = self->_rotationDriver;
    double v11 = 0.0;
    if (rotationDriver)
    {
      CGFloat v12 = &rotationDriver->_initialAnchorPoint.x;
      double v11 = *v12;
      double v6 = v12[1];
    }
    double v13 = (v8 + v11) * 0.5;
    double v14 = (v7 + v6) * 0.5;
  }
  else
  {
    double v14 = 0.0;
    double v13 = 0.0;
  }
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, v13, v14);
  double v16 = v15;
  double v18 = v17;
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, -[_UITransformGestureRecognizer _anchorPoint]((uint64_t)self).f64[0]);
  double v20 = v19 - v16;
  double v22 = v21 - v18;
  result.y = v22;
  result.x = v20;
  return result;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 18 || a3 == 20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedDriver, 0);
  objc_storeStrong((id *)&self->_rotationDriver, 0);
  objc_storeStrong((id *)&self->_pinchDriver, 0);
}

@end