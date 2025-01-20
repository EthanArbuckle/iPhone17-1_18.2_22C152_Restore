@interface TIKeyboardTyperContinuousPathGenerator
- (BOOL)isDone;
- (CGPoint)currentPoint;
- (TIKeyboardTyperContinuousPathGenerator)initWithVelocity:(double)a3 timestamp:(double)a4 dt:(double)a5 stallDuration:(double)a6;
- (double)currentTimestamp;
- (void)addTargetPoint:(CGPoint)a3;
- (void)step;
@end

@implementation TIKeyboardTyperContinuousPathGenerator

- (void).cxx_destruct
{
}

- (double)currentTimestamp
{
  return self->_currentTimestamp;
}

- (CGPoint)currentPoint
{
  double x = self->_currentPoint.x;
  double y = self->_currentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)step
{
  for (unint64_t i = 0; [(NSMutableArray *)self->_targets count]; ++i)
  {
    v4 = [(NSMutableArray *)self->_targets objectAtIndexedSubscript:0];
    [v4 CGPointValue];
    double v6 = v5;
    double v8 = v7;

    if (hypot(v6 - self->_currentPoint.x, v8 - self->_currentPoint.y) >= 1.0e-10) {
      break;
    }
    [(NSMutableArray *)self->_targets removeObjectAtIndex:0];
  }
  if ([(NSMutableArray *)self->_targets count])
  {
    v9 = [(NSMutableArray *)self->_targets objectAtIndexedSubscript:0];
    [v9 CGPointValue];
    double v11 = v10;
    double v13 = v12;

    double x = self->_currentPoint.x;
    double y = self->_currentPoint.y;
    double v16 = v11 - x;
    double v17 = v13 - y;
    double v18 = hypot(v16, v13 - y);
    double dt = self->_dt;
    double v20 = dt * self->_velocity;
    if (v18 > v20)
    {
      double v21 = v20 / v18;
      double v16 = v16 * v21;
      double v17 = v17 * v21;
    }
  }
  else
  {
    double v16 = *MEMORY[0x263F00148];
    double v17 = *(double *)(MEMORY[0x263F00148] + 8);
    double x = self->_currentPoint.x;
    double y = self->_currentPoint.y;
    double dt = self->_dt;
  }
  self->_currentPoint.double x = v16 + x;
  self->_currentPoint.double y = v17 + y;
  self->_currentTimestamp = self->_currentTimestamp + dt + self->_stallDuration * (double)i;
}

- (BOOL)isDone
{
  return [(NSMutableArray *)self->_targets count] == 0;
}

- (void)addTargetPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  targets = self->_targets;
  double v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
  [(NSMutableArray *)targets addObject:v7];

  if ([(NSMutableArray *)self->_targets count] == 1)
  {
    self->_currentPoint.CGFloat x = x;
    self->_currentPoint.CGFloat y = y;
  }
}

- (TIKeyboardTyperContinuousPathGenerator)initWithVelocity:(double)a3 timestamp:(double)a4 dt:(double)a5 stallDuration:(double)a6
{
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardTyperContinuousPathGenerator;
  v9 = [(TIKeyboardTyperContinuousPathGenerator *)&v13 init];
  if (v9)
  {
    double v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    targets = v9->_targets;
    v9->_targets = v10;

    v9->_velocitCGFloat y = a3;
    v9->_double dt = a5;
    v9->_stallDuration = a6;
  }
  return v9;
}

@end