@interface BKCustomAnimationCurveFactory
- (CAMediaTimingFunction)timingFunction;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
- (void)setTimingFunction:(id)a3;
@end

@implementation BKCustomAnimationCurveFactory

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return +[CABasicAnimation animationWithKeyPath:a4];
}

- (id)_timingFunctionForAnimation
{
  return [(BKCustomAnimationCurveFactory *)self timingFunction];
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end