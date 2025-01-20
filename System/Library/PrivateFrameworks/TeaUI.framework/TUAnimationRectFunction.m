@interface TUAnimationRectFunction
- (CAMediaTimingFunction)timingFunction;
- (CGRect)endValue;
- (CGRect)solveForTime:(double)a3;
- (CGRect)startValue;
- (TUAnimationPointFunction)originFunction;
- (TUAnimationRectFunction)initWithTimingFunction:(id)a3 startRect:(CGRect)a4 endRect:(CGRect)a5 speed:(double)a6;
- (TUAnimationSizeFunction)sizeFunction;
- (double)speed;
- (void)_reloadFunctions;
- (void)setEndValue:(CGRect)a3;
- (void)setOriginFunction:(id)a3;
- (void)setSizeFunction:(id)a3;
- (void)setSpeed:(double)a3;
- (void)setStartValue:(CGRect)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation TUAnimationRectFunction

- (TUAnimationRectFunction)initWithTimingFunction:(id)a3 startRect:(CGRect)a4 endRect:(CGRect)a5 speed:(double)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v10 = a4.size.height;
  CGFloat v11 = a4.size.width;
  CGFloat v12 = a4.origin.y;
  CGFloat v13 = a4.origin.x;
  id v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TUAnimationRectFunction;
  v16 = [(TUAnimationRectFunction *)&v20 init];
  if (v16)
  {
    if (v15)
    {
      v17 = (CAMediaTimingFunction *)v15;
    }
    else
    {
      v17 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    }
    timingFunction = v16->_timingFunction;
    v16->_timingFunction = v17;

    v16->_startValue.origin.CGFloat x = v13;
    v16->_startValue.origin.CGFloat y = v12;
    v16->_startValue.size.CGFloat width = v11;
    v16->_startValue.size.CGFloat height = v10;
    v16->_endValue.origin.CGFloat x = x;
    v16->_endValue.origin.CGFloat y = y;
    v16->_endValue.size.CGFloat width = width;
    v16->_endValue.size.CGFloat height = height;
    v16->_speed = a6;
    [(TUAnimationRectFunction *)v16 _reloadFunctions];
  }

  return v16;
}

- (CGRect)solveForTime:(double)a3
{
  v5 = [(TUAnimationRectFunction *)self originFunction];
  [v5 solveForTime:a3];
  double v7 = v6;
  double v9 = v8;
  CGFloat v10 = [(TUAnimationRectFunction *)self sizeFunction];
  [v10 solveForTime:a3];
  double v12 = v11;
  double v14 = v13;

  double v15 = v7;
  double v16 = v9;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)setStartValue:(CGRect)a3
{
  self->_startValue = a3;
  [(TUAnimationRectFunction *)self _reloadFunctions];
}

- (void)setEndValue:(CGRect)a3
{
  self->_endValue = a3;
  [(TUAnimationRectFunction *)self _reloadFunctions];
}

- (void)_reloadFunctions
{
  v3 = -[TUAnimationPointFunction initWithTimingFunction:startRect:endRect:speed:]([TUAnimationPointFunction alloc], "initWithTimingFunction:startRect:endRect:speed:", self->_timingFunction, self->_startValue.origin.x, self->_startValue.origin.y, self->_endValue.origin.x, self->_endValue.origin.y, self->_speed);
  [(TUAnimationRectFunction *)self setOriginFunction:v3];

  v4 = -[TUAnimationSizeFunction initWithTimingFunction:startRect:endRect:speed:]([TUAnimationSizeFunction alloc], "initWithTimingFunction:startRect:endRect:speed:", self->_timingFunction, self->_startValue.size.width, self->_startValue.size.height, self->_endValue.size.width, self->_endValue.size.height, self->_speed);
  [(TUAnimationRectFunction *)self setSizeFunction:v4];
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (CGRect)startValue
{
  double x = self->_startValue.origin.x;
  double y = self->_startValue.origin.y;
  double width = self->_startValue.size.width;
  double height = self->_startValue.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)endValue
{
  double x = self->_endValue.origin.x;
  double y = self->_endValue.origin.y;
  double width = self->_endValue.size.width;
  double height = self->_endValue.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
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

- (TUAnimationPointFunction)originFunction
{
  return self->_originFunction;
}

- (void)setOriginFunction:(id)a3
{
}

- (TUAnimationSizeFunction)sizeFunction
{
  return self->_sizeFunction;
}

- (void)setSizeFunction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeFunction, 0);
  objc_storeStrong((id *)&self->_originFunction, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end