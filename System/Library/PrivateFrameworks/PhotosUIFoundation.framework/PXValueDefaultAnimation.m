@interface PXValueDefaultAnimation
- (PXValueDefaultAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5;
- (PXValueDefaultAnimation)initWithFromValue:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5;
- (double)approximateVelocity;
- (double)currentValue;
@end

@implementation PXValueDefaultAnimation

- (double)approximateVelocity
{
  [(PXValueAnimation *)self duration];
  double v5 = v4;
  [(PXValueAnimation *)self elapsedTime];
  double v6 = 0.0;
  double v8 = fmax(fmin(v7 / v5, 1.0), 0.0);
  switch(self->_curve)
  {
    case 0:
      v10 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v8);
      [v10 handleFailureInMethod:a2 object:self file:@"PXValueAnimation.m" lineNumber:122 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      double v6 = 1.0;
      return -(v6 * self->_initialValue) / v5;
    case 2:
      goto LABEL_4;
    case 3:
      double v8 = 1.0 - v8;
LABEL_4:
      double v6 = v8 + v8;
      break;
    case 4:
      if (v8 >= 0.5) {
        double v8 = 1.0 - v8;
      }
      double v6 = v8 * 4.0;
      break;
    default:
      return -(v6 * self->_initialValue) / v5;
  }
  return -(v6 * self->_initialValue) / v5;
}

- (double)currentValue
{
  [(PXValueAnimation *)self elapsedTime];
  double v5 = v4;
  [(PXValueAnimation *)self duration];
  double v7 = fmax(fmin(v5 / v6, 1.0), 0.0);
  switch(self->_curve)
  {
    case 0:
      v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 1.0, v7);
      [v9 handleFailureInMethod:a2 object:self file:@"PXValueAnimation.m" lineNumber:98 description:@"Code which should be unreachable has been reached"];

      abort();
    case 2:
      double v7 = v7 * v7;
      break;
    case 3:
      double v7 = v7 * (2.0 - v7);
      break;
    case 4:
      if (v7 >= 0.5) {
        double v7 = (v7 * -2.0 + 4.0) * v7 + -1.0;
      }
      else {
        double v7 = v7 * (v7 + v7);
      }
      break;
    default:
      return (1.0 - v7) * self->_initialValue;
  }
  return (1.0 - v7) * self->_initialValue;
}

- (PXValueDefaultAnimation)initWithFromValue:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  long long v7 = *(_OWORD *)&a5->curve;
  long long v8 = *(_OWORD *)&a5->stiffness;
  v11[0] = *(_OWORD *)&a5->type;
  v11[1] = v7;
  double duration = a5->duration;
  v13.receiver = self;
  v13.super_class = (Class)PXValueDefaultAnimation;
  v11[2] = v8;
  double initialVelocity = a5->initialVelocity;
  result = [(PXValueAnimation *)&v13 initWithDuration:v11 currentMediaTime:duration spec:a4];
  if (result)
  {
    result->_initialValue = a3;
    result->_curve = a5->curve;
  }
  return result;
}

- (PXValueDefaultAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  long long v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a5, a3, a4);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXValueAnimation.m", 82, @"%s is not available as initializer", "-[PXValueDefaultAnimation initWithDuration:currentMediaTime:spec:]");

  abort();
}

@end