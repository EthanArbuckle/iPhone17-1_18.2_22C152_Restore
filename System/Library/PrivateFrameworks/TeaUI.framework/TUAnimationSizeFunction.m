@interface TUAnimationSizeFunction
- (CAMediaTimingFunction)timingFunction;
- (CGSize)endValue;
- (CGSize)solveForTime:(double)a3;
- (CGSize)startValue;
- (TUAnimationFloatFunction)heightFunction;
- (TUAnimationFloatFunction)widthFunction;
- (TUAnimationSizeFunction)initWithTimingFunction:(id)a3 startRect:(CGSize)a4 endRect:(CGSize)a5 speed:(double)a6;
- (double)speed;
- (void)_reloadFunctions;
- (void)setEndValue:(CGSize)a3;
- (void)setHeightFunction:(id)a3;
- (void)setSpeed:(double)a3;
- (void)setStartValue:(CGSize)a3;
- (void)setTimingFunction:(id)a3;
- (void)setWidthFunction:(id)a3;
@end

@implementation TUAnimationSizeFunction

- (TUAnimationSizeFunction)initWithTimingFunction:(id)a3 startRect:(CGSize)a4 endRect:(CGSize)a5 speed:(double)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v9 = a4.height;
  CGFloat v10 = a4.width;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUAnimationSizeFunction;
  v13 = [(TUAnimationSizeFunction *)&v17 init];
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

    v13->_startValue.CGFloat width = v10;
    v13->_startValue.CGFloat height = v9;
    v13->_endValue.CGFloat width = width;
    v13->_endValue.CGFloat height = height;
    v13->_speed = a6;
    [(TUAnimationSizeFunction *)v13 _reloadFunctions];
  }

  return v13;
}

- (CGSize)solveForTime:(double)a3
{
  v5 = [(TUAnimationSizeFunction *)self widthFunction];
  [v5 solveForTime:a3];
  double v7 = v6;
  v8 = [(TUAnimationSizeFunction *)self heightFunction];
  [v8 solveForTime:a3];
  double v10 = v9;

  double v11 = v7;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)setStartValue:(CGSize)a3
{
  self->_startValue = a3;
  [(TUAnimationSizeFunction *)self _reloadFunctions];
}

- (void)setEndValue:(CGSize)a3
{
  self->_endValue = a3;
  [(TUAnimationSizeFunction *)self _reloadFunctions];
}

- (void)_reloadFunctions
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__TUAnimationSizeFunction__reloadFunctions__block_invoke;
  aBlock[3] = &unk_1E6136728;
  aBlock[4] = self;
  v3 = (void (**)(void, double, double))_Block_copy(aBlock);
  [(TUAnimationSizeFunction *)self startValue];
  double v5 = v4;
  [(TUAnimationSizeFunction *)self endValue];
  double v7 = v3[2](v3, v5, v6);
  [(TUAnimationSizeFunction *)self setWidthFunction:v7];

  [(TUAnimationSizeFunction *)self startValue];
  double v9 = v8;
  [(TUAnimationSizeFunction *)self endValue];
  double v10 = ((void (*)(void (**)(void, double, double), double))v3[2])(v3, v9);
  [(TUAnimationSizeFunction *)self setHeightFunction:v10];
}

TUAnimationFloatFunction *__43__TUAnimationSizeFunction__reloadFunctions__block_invoke(uint64_t a1, double a2, double a3)
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

- (CGSize)startValue
{
  double width = self->_startValue.width;
  double height = self->_startValue.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)endValue
{
  double width = self->_endValue.width;
  double height = self->_endValue.height;
  result.double height = height;
  result.double width = width;
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

- (TUAnimationFloatFunction)widthFunction
{
  return self->_widthFunction;
}

- (void)setWidthFunction:(id)a3
{
}

- (TUAnimationFloatFunction)heightFunction
{
  return self->_heightFunction;
}

- (void)setHeightFunction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightFunction, 0);
  objc_storeStrong((id *)&self->_widthFunction, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end