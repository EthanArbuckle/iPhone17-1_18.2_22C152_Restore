@interface CAAnimation
- (float)solveForInput:(float)a3;
@end

@implementation CAAnimation

- (float)solveForInput:(float)a3
{
  v4 = self;
  v5 = [(CAAnimation *)v4 timingFunction];
  if (!v5) {
    v5 = (CAMediaTimingFunction *)[self functionWithName:kCAMediaTimingFunctionLinear];
  }
  *(float *)&double v6 = a3;
  [(CAMediaTimingFunction *)v5 _solveForInput:v6];
  float v8 = v7;

  return v8;
}

@end