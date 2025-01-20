@interface UIFocusMovementHint
- (CATransform3D)interactionTransform;
- (CATransform3D)perspectiveTransform;
- (CGVector)movementDirection;
- (CGVector)rotation;
- (CGVector)translation;
- (UIFocusMovementHint)initWithMovementDirection:(CGVector)a3 itemSize:(CGSize)a4;
- (double)rotationAmount;
- (double)translationAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setRotationAmount:(double)a3;
- (void)setTranslationAmount:(double)a3;
@end

@implementation UIFocusMovementHint

- (UIFocusMovementHint)initWithMovementDirection:(CGVector)a3 itemSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGFloat dy = a3.dy;
  CGFloat dx = a3.dx;
  v18.receiver = self;
  v18.super_class = (Class)UIFocusMovementHint;
  result = [(UIFocusMovementHint *)&v18 init];
  if (result)
  {
    result->_movementDirection.CGFloat dx = dx;
    result->_movementDirection.CGFloat dy = dy;
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      float64x2_t v17 = (float64x2_t)xmmword_186B96490;
    }
    else
    {
      if (height <= width) {
        double v10 = width;
      }
      else {
        double v10 = height;
      }
      double v11 = v10 / 1920.0;
      if (v11 < 0.0) {
        double v11 = 0.0;
      }
      float64x2_t v12 = vmulq_n_f64((float64x2_t)xmmword_186B964A0, fmin(v11, 1.0));
      __asm { FMOV            V1.2D, #6.0 }
      *(void *)&_Q1.f64[0] = *(_OWORD *)&vaddq_f64(v12, _Q1);
      _Q1.f64[1] = vsubq_f64((float64x2_t)vdupq_n_s64(0x3FBEB851EB851EB8uLL), v12).f64[1];
      float64x2_t v17 = vminnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64((float64x2_t)xmmword_186B964B0, _Q1), (int8x16_t)xmmword_186B964B0, (int8x16_t)_Q1), (float64x2_t)xmmword_186B964C0);
    }
    *(float64x2_t *)&result->_translationAmount = v17;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result) {
    *(CGVector *)((char *)result + 24) = self->_movementDirection;
  }
  return result;
}

- (CATransform3D)perspectiveTransform
{
  v3 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v4;
  long long v5 = v3[7];
  *(_OWORD *)&retstr->m41 = v3[6];
  *(_OWORD *)&retstr->m43 = v5;
  long long v6 = v3[1];
  *(_OWORD *)&retstr->m11 = *v3;
  *(_OWORD *)&retstr->m13 = v6;
  long long v7 = v3[3];
  *(_OWORD *)&retstr->m21 = v3[2];
  *(_OWORD *)&retstr->m23 = v7;
  retstr->m34 = -0.00111111111;
  return self;
}

- (CGVector)rotation
{
  double rotationAmount = self->_rotationAmount;
  double v3 = rotationAmount * self->_movementDirection.dy;
  double v4 = -(rotationAmount * self->_movementDirection.dx);
  result.CGFloat dy = v4;
  result.CGFloat dx = v3;
  return result;
}

- (CGVector)translation
{
  double translationAmount = self->_translationAmount;
  double v3 = translationAmount * self->_movementDirection.dx;
  double v4 = translationAmount * self->_movementDirection.dy;
  result.CGFloat dy = v4;
  result.CGFloat dx = v3;
  return result;
}

- (CATransform3D)interactionTransform
{
  long long v5 = (long long *)MEMORY[0x1E4F39B10];
  long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v42 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = v41;
  *(_OWORD *)&retstr->m33 = v42;
  long long v39 = v5[6];
  long long v40 = v5[7];
  *(_OWORD *)&retstr->m41 = v39;
  *(_OWORD *)&retstr->m43 = v40;
  long long v37 = *v5;
  long long v38 = v5[1];
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v38;
  long long v35 = v5[2];
  long long v36 = v5[3];
  *(_OWORD *)&retstr->m21 = v35;
  *(_OWORD *)&retstr->m23 = v36;
  [(UIFocusMovementHint *)self rotation];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(UIFocusMovementHint *)self translation];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  *(_OWORD *)&v44.m31 = v41;
  *(_OWORD *)&v44.m33 = v42;
  *(_OWORD *)&v44.m41 = v39;
  *(_OWORD *)&v44.m43 = v40;
  *(_OWORD *)&v44.m11 = v37;
  *(_OWORD *)&v44.m13 = v38;
  *(_OWORD *)&v44.m21 = v35;
  *(_OWORD *)&v44.m23 = v36;
  CATransform3DRotate(&v45, &v44, v9, 0.0, 1.0, 0.0);
  long long v14 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v14;
  long long v15 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v15;
  long long v16 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v16;
  long long v17 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v17;
  long long v18 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v44.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v44.m33 = v18;
  long long v19 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v44.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v44.m43 = v19;
  long long v20 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v44.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v44.m13 = v20;
  long long v21 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v44.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v44.m23 = v21;
  CATransform3DRotate(&v45, &v44, v7, 1.0, 0.0, 0.0);
  long long v22 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v22;
  long long v23 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v23;
  long long v24 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v24;
  long long v25 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v25;
  long long v26 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v44.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v44.m33 = v26;
  long long v27 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v44.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v44.m43 = v27;
  long long v28 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v44.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v44.m13 = v28;
  long long v29 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v44.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v44.m23 = v29;
  CATransform3DTranslate(&v45, &v44, v11, v13, 0.0);
  long long v30 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v30;
  long long v31 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v31;
  long long v32 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v32;
  long long v33 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v33;
  CGVector result = [(UIFocusMovementHint *)self perspectiveTransform];
  retstr->m34 = v43;
  return result;
}

- (CGVector)movementDirection
{
  double dx = self->_movementDirection.dx;
  double dy = self->_movementDirection.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (double)translationAmount
{
  return self->_translationAmount;
}

- (void)setTranslationAmount:(double)a3
{
  self->_double translationAmount = a3;
}

- (double)rotationAmount
{
  return self->_rotationAmount;
}

- (void)setRotationAmount:(double)a3
{
  self->_double rotationAmount = a3;
}

@end