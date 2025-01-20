@interface PXCASpringAnimationWorkaround132759829
- (float)_solveForInput:(float)a3;
@end

@implementation PXCASpringAnimationWorkaround132759829

- (float)_solveForInput:(float)a3
{
  double v4 = a3;
  [(PXCASpringAnimationWorkaround132759829 *)self duration];
  double v6 = v4 / v5;
  *(float *)&double v6 = v6;
  v8.receiver = self;
  v8.super_class = (Class)PXCASpringAnimationWorkaround132759829;
  [(CASpringAnimation *)&v8 _solveForInput:v6];
  return result;
}

@end