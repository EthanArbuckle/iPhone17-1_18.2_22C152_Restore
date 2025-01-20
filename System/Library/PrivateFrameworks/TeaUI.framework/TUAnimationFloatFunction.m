@interface TUAnimationFloatFunction
- (CAMediaTimingFunction)timingFunction;
- (TUAnimationFloatFunction)init;
- (TUAnimationFloatFunction)initWithTimingFunction:(id)a3 startValue:(double)a4 endValue:(double)a5 speed:(double)a6;
- (double)endValue;
- (double)solveForTime:(double)a3;
- (double)speed;
- (double)startValue;
- (void)setEndValue:(double)a3;
- (void)setSpeed:(double)a3;
- (void)setStartValue:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation TUAnimationFloatFunction

- (TUAnimationFloatFunction)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUAnimationFloatFunction;
  v2 = [(TUAnimationFloatFunction *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    timingFunction = v2->_timingFunction;
    v2->_timingFunction = (CAMediaTimingFunction *)v3;

    v2->_speed = 1.0;
  }
  return v2;
}

- (TUAnimationFloatFunction)initWithTimingFunction:(id)a3 startValue:(double)a4 endValue:(double)a5 speed:(double)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUAnimationFloatFunction;
  v11 = [(TUAnimationFloatFunction *)&v15 init];
  if (v11)
  {
    if (v10)
    {
      v12 = (CAMediaTimingFunction *)v10;
    }
    else
    {
      v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    }
    timingFunction = v11->_timingFunction;
    v11->_timingFunction = v12;

    v11->_startValue = a4;
    v11->_endValue = a5;
    v11->_speed = a6;
  }

  return v11;
}

- (double)solveForTime:(double)a3
{
  [(TUAnimationFloatFunction *)self startValue];
  double v6 = v5;
  [(TUAnimationFloatFunction *)self endValue];
  double v8 = v7;
  [(TUAnimationFloatFunction *)self startValue];
  double v10 = v9;
  v11 = [(TUAnimationFloatFunction *)self timingFunction];
  [(TUAnimationFloatFunction *)self speed];
  double v13 = v12 * a3;
  double v14 = 0.0;
  if (v13 >= 0.0)
  {
    double v14 = v13;
    if (v13 > 1.0) {
      double v14 = 1.0;
    }
  }
  *(float *)&double v14 = v14;
  [v11 _solveForInput:v14];
  double v16 = v6 + (v8 - v10) * v15;

  return v16;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (double)startValue
{
  return self->_startValue;
}

- (void)setStartValue:(double)a3
{
  self->_startValue = a3;
}

- (double)endValue
{
  return self->_endValue;
}

- (void)setEndValue:(double)a3
{
  self->_endValue = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (void).cxx_destruct
{
}

@end