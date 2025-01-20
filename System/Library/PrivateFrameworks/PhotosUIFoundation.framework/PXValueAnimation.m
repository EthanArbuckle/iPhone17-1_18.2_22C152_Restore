@interface PXValueAnimation
- (BOOL)completed;
- (PXValueAnimation)init;
- (PXValueAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5;
- (PXValueAnimationSpec)spec;
- (double)approximateVelocity;
- (double)currentMediaTime;
- (double)currentValue;
- (double)duration;
- (double)elapsedTime;
- (double)remainingTime;
- (double)startTime;
- (double)valueForProgress:(double)a3;
- (id)description;
- (void)setCurrentMediaTime:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation PXValueAnimation

- (void)setCurrentMediaTime:(double)a3
{
  self->_currentMediaTime = a3;
}

- (double)currentMediaTime
{
  return self->_currentMediaTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (PXValueAnimationSpec)spec
{
  long long v3 = *(_OWORD *)&self->initialVelocity;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->stiffness;
  *(_OWORD *)&retstr->curve = v3;
  *(_OWORD *)&retstr->stiffness = *(_OWORD *)&self[1].duration;
  retstr->initialVelocity = self[1].epsilon;
  return self;
}

- (double)duration
{
  return self->_duration;
}

- (double)valueForProgress:(double)a3
{
  [(PXValueAnimation *)self duration];
  double v6 = a3 / v5;
  [(PXValueAnimation *)self startTime];
  [(PXValueAnimation *)self setCurrentMediaTime:v7 + v6];

  [(PXValueAnimation *)self currentValue];
  return result;
}

- (BOOL)completed
{
  [(PXValueAnimation *)self elapsedTime];
  double v4 = v3;
  [(PXValueAnimation *)self duration];
  return v4 > v5;
}

- (double)approximateVelocity
{
  [(PXValueAnimation *)self currentMediaTime];
  double v4 = v3;
  [(PXValueAnimation *)self currentValue];
  double v6 = v5;
  [(PXValueAnimation *)self setCurrentMediaTime:v4 + 0.00833333333];
  [(PXValueAnimation *)self currentValue];
  double v8 = v7;
  [(PXValueAnimation *)self setCurrentMediaTime:v4];
  return (v8 - v6) / (v4 + 0.00833333333 - v4);
}

- (double)currentValue
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXValueAnimation.m" lineNumber:48 description:@"concrete subclass must implement"];

  abort();
}

- (double)remainingTime
{
  [(PXValueAnimation *)self duration];
  double v4 = v3;
  [(PXValueAnimation *)self elapsedTime];
  return fmax(v4 - v5, 0.0);
}

- (double)elapsedTime
{
  [(PXValueAnimation *)self currentMediaTime];
  return v3 - self->_startTime;
}

- (id)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(PXValueAnimation *)self currentValue];
  uint64_t v7 = v6;
  [(PXValueAnimation *)self duration];
  v9 = [v3 stringWithFormat:@"<%@:%p; currentValue:%.2f duration:%.2f>", v5, self, v7, v8];

  return v9;
}

- (PXValueAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)PXValueAnimation;
  double result = [(PXValueAnimation *)&v12 init];
  if (result)
  {
    result->_startTime = a4;
    result->_currentMediaTime = a4;
    result->_duration = a3;
    long long v9 = *(_OWORD *)&a5->type;
    long long v10 = *(_OWORD *)&a5->curve;
    long long v11 = *(_OWORD *)&a5->stiffness;
    result->_spec.initialVelocity = a5->initialVelocity;
    *(_OWORD *)&result->_spec.curve = v10;
    *(_OWORD *)&result->_spec.stiffness = v11;
    *(_OWORD *)&result->_spec.type = v9;
  }
  return result;
}

- (PXValueAnimation)init
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXValueAnimation.m" lineNumber:20 description:@"invalid initializer"];

  abort();
}

@end