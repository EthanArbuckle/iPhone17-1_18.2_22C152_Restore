@interface PXValueSpringAnimation
+ (double)durationOfSpringAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6 epsilon:(double)a7;
- (PXValueSpringAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5;
- (PXValueSpringAnimation)initWithFromValue:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5;
- (double)approximateVelocity;
- (double)currentValue;
@end

@implementation PXValueSpringAnimation

- (double)approximateVelocity
{
  [(PXValueAnimation *)self elapsedTime];
  double v4 = v3;
  double B = self->_B;
  double omega0 = self->_omega0;
  long double v7 = exp(-(omega0 * v3));
  return v7 * -(omega0 * (self->_A + B * v4)) + B * v7;
}

- (double)currentValue
{
  [(PXValueAnimation *)self elapsedTime];
  double v4 = self->_A + self->_B * v3;
  long double v5 = v4 * exp(-(self->_omega0 * v3));
  [(PXValueAnimation *)self spec];
  return v7 * floor(v5 / v7);
}

- (PXValueSpringAnimation)initWithFromValue:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v9 = sqrt(a5->stiffness);
  double v10 = (v9 + v9) * a5->dampingRatio;
  [(id)objc_opt_class() durationOfSpringAnimationWithMass:1.0 stiffness:a5->stiffness damping:v10 velocity:a5->initialVelocity epsilon:a5->epsilon];
  double v12 = v11;
  double v13 = fabs(v11);
  if (v12 > 10.0 || v13 == INFINITY)
  {
    v15 = PFUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double stiffness = a5->stiffness;
      double initialVelocity = a5->initialVelocity;
      *(_DWORD *)buf = 134219008;
      *(double *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0x3FF0000000000000;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = stiffness;
      *(_WORD *)v22 = 2048;
      *(double *)&v22[2] = v10;
      *(_WORD *)&v22[10] = 2048;
      *(double *)&v22[12] = initialVelocity;
      _os_log_impl(&dword_259CDA000, v15, OS_LOG_TYPE_DEFAULT, "Got invalid duration:%.2f for spring with mass:%.3f stiffness:%.3f damping:%.3f velocity:%.3f", buf, 0x34u);
    }

    double v12 = 1.0;
  }
  v20.receiver = self;
  v20.super_class = (Class)PXValueSpringAnimation;
  long long v18 = *(_OWORD *)&a5->curve;
  *(_OWORD *)buf = *(_OWORD *)&a5->type;
  *(_OWORD *)&buf[16] = v18;
  *(_OWORD *)v22 = *(_OWORD *)&a5->stiffness;
  *(double *)&v22[16] = a5->initialVelocity;
  result = [(PXValueAnimation *)&v20 initWithDuration:buf currentMediaTime:v12 spec:a4];
  if (result)
  {
    result->_double omega0 = sqrt(a5->stiffness);
    result->_A = a3;
    result->_double B = a5->initialVelocity + result->_omega0 * a3;
  }
  return result;
}

- (PXValueSpringAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  double v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a5, a3, a4);
  [v7 handleFailureInMethod:a2 object:self file:@"PXValueAnimation.m" lineNumber:148 description:@"invalid initializer"];

  abort();
}

+ (double)durationOfSpringAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6 epsilon:(double)a7
{
  double v8 = sqrt(a3 * a4);
  double v9 = a5 / (v8 + v8);
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = 0.0;
  }
  if (fmin(v10, 1.0) == 0.0) {
    return INFINITY;
  }
  double v12 = sqrt(a4 / a3);
  if (v10 >= 1.0)
  {
    double v10 = v12 - a6;
    long double v15 = exp(-v12 / (v12 - a6));
    double v16 = -1.0 - log(fabs(v12 * v15 * a7 / v10));
    double v14 = -(v12
          + v10
          * (-1.0
           - v16
           + (-1.0 / (sqrt(v16 * 0.5) * 0.3361 / (v16 * -0.0042 * exp(sqrt(v16) * -0.0201) + 1.0) + 1.0) + 1.0)
           * -5.95060994));
    return v14 / (v12 * v10);
  }
  double v13 = fabs(-(a6 - v10 * v12) / (v12 * sqrt(1.0 - v10 * v10)));
  if (v13 < 0.00000011920929)
  {
    double v14 = log(1.0 / a7);
    return v14 / (v12 * v10);
  }
  return fmax(-log(a7 / (v13 + 1.0)) / (v12 * v10), 0.0);
}

@end