@interface TUAnimationPointFunction
- (CAMediaTimingFunction)timingFunction;
- (CGPoint)endValue;
- (CGPoint)solveForTime:(double)a3;
- (CGPoint)startValue;
- (TUAnimationFloatFunction)xFunction;
- (TUAnimationFloatFunction)yFunction;
- (TUAnimationPointFunction)initWithTimingFunction:(id)a3 startRect:(CGPoint)a4 endRect:(CGPoint)a5 speed:(double)a6;
- (double)speed;
- (void)_reloadFunctions;
- (void)setEndValue:(CGPoint)a3;
- (void)setSpeed:(double)a3;
- (void)setStartValue:(CGPoint)a3;
- (void)setTimingFunction:(id)a3;
- (void)setXFunction:(id)a3;
- (void)setYFunction:(id)a3;
@end

@implementation TUAnimationPointFunction

- (TUAnimationPointFunction)initWithTimingFunction:(id)a3 startRect:(CGPoint)a4 endRect:(CGPoint)a5 speed:(double)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v9 = a4.y;
  CGFloat v10 = a4.x;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUAnimationPointFunction;
  v13 = [(TUAnimationPointFunction *)&v17 init];
  if (v13)
  {
    if (v12)
    {
      v14 = (CAMediaTimingFunction *)v12;
    }
    else
    {
      v14 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    }
    timingFunction = v13->_timingFunction;
    v13->_timingFunction = v14;

    v13->_startValue.CGFloat x = v10;
    v13->_startValue.CGFloat y = v9;
    v13->_endValue.CGFloat x = x;
    v13->_endValue.CGFloat y = y;
    v13->_speed = a6;
    [(TUAnimationPointFunction *)v13 _reloadFunctions];
  }

  return v13;
}

- (CGPoint)solveForTime:(double)a3
{
  v5 = [(TUAnimationPointFunction *)self xFunction];
  [v5 solveForTime:a3];
  double v7 = v6;
  v8 = [(TUAnimationPointFunction *)self yFunction];
  [v8 solveForTime:a3];
  double v10 = v9;

  double v11 = v7;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (void)setStartValue:(CGPoint)a3
{
  self->_startValue = a3;
  [(TUAnimationPointFunction *)self _reloadFunctions];
}

- (void)setEndValue:(CGPoint)a3
{
  self->_endValue = a3;
  [(TUAnimationPointFunction *)self _reloadFunctions];
}

- (void)_reloadFunctions
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__TUAnimationPointFunction__reloadFunctions__block_invoke;
  aBlock[3] = &unk_1E6136728;
  aBlock[4] = self;
  v3 = (void (**)(void, double, double))_Block_copy(aBlock);
  [(TUAnimationPointFunction *)self startValue];
  double v5 = v4;
  [(TUAnimationPointFunction *)self endValue];
  double v7 = v3[2](v3, v5, v6);
  [(TUAnimationPointFunction *)self setXFunction:v7];

  [(TUAnimationPointFunction *)self startValue];
  double v9 = v8;
  [(TUAnimationPointFunction *)self endValue];
  double v10 = ((void (*)(void (**)(void, double, double), double))v3[2])(v3, v9);
  [(TUAnimationPointFunction *)self setYFunction:v10];
}

TUAnimationFloatFunction *__44__TUAnimationPointFunction__reloadFunctions__block_invoke(uint64_t a1, double a2, double a3)
{
  double v6 = [TUAnimationFloatFunction alloc];
  double v7 = [*(id *)(a1 + 32) timingFunction];
  [*(id *)(a1 + 32) speed];
  double v9 = [(TUAnimationFloatFunction *)v6 initWithTimingFunction:v7 startValue:a2 endValue:a3 speed:v8];

  return v9;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (CGPoint)startValue
{
  double x = self->_startValue.x;
  double y = self->_startValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endValue
{
  double x = self->_endValue.x;
  double y = self->_endValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (TUAnimationFloatFunction)xFunction
{
  return self->_xFunction;
}

- (void)setXFunction:(id)a3
{
}

- (TUAnimationFloatFunction)yFunction
{
  return self->_yFunction;
}

- (void)setYFunction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yFunction, 0);
  objc_storeStrong((id *)&self->_xFunction, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end