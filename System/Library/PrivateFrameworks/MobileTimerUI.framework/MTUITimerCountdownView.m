@interface MTUITimerCountdownView
- (BOOL)isStarted;
- (CALayer)mainLayer;
- (CAShapeLayer)backgroundCircleLayer;
- (CAShapeLayer)countdownCircleLayer;
- (MTUITimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5;
- (MTUITimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5 remainingTime:(double)a6 duration:(double)a7;
- (UIColor)backgroundBarColor;
- (UIColor)barColor;
- (double)angleForValue:(double)a3 total:(double)a4;
- (double)barWidth;
- (double)degToRad:(double)a3;
- (double)duration;
- (double)remainingTime;
- (int64_t)state;
- (void)layoutSubviews;
- (void)pause;
- (void)resume;
- (void)setAnimationRemainingTime:(double)a3 totalTime:(double)a4;
- (void)setBackgroundBarColor:(id)a3;
- (void)setBackgroundCircleLayer:(id)a3;
- (void)setBarColor:(id)a3;
- (void)setBarWidth:(double)a3;
- (void)setCountdownCircleLayer:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMainLayer:(id)a3;
- (void)setRemainingTime:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setupBackgroundCircle;
- (void)start;
- (void)stop;
@end

@implementation MTUITimerCountdownView

- (MTUITimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTUITimerCountdownView;
  v10 = [(MTUITimerCountdownView *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(MTUITimerCountdownView *)v10 setBarColor:v8];
    [(MTUITimerCountdownView *)v11 setBarWidth:a5];
    [(MTUITimerCountdownView *)v11 setBackgroundBarColor:v9];
  }

  return v11;
}

- (MTUITimerCountdownView)initWithBarColor:(id)a3 backgroundBarColor:(id)a4 barWidth:(double)a5 remainingTime:(double)a6 duration:(double)a7
{
  id v9 = [(MTUITimerCountdownView *)self initWithBarColor:a3 backgroundBarColor:a4 barWidth:a5];
  v10 = v9;
  if (v9)
  {
    [(MTUITimerCountdownView *)v9 setRemainingTime:a6];
    [(MTUITimerCountdownView *)v10 setDuration:a7];
  }
  return v10;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)MTUITimerCountdownView;
  [(MTUITimerCountdownView *)&v24 layoutSubviews];
  v3 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v3 beginTime];
  double v5 = v4;

  if (v5 > 0.0)
  {
    if ([(MTUITimerCountdownView *)self state] == 2)
    {
      v6 = [(MTUITimerCountdownView *)self countdownCircleLayer];
      [v6 timeOffset];
      double v8 = v7;
    }
    else
    {
      double v9 = CACurrentMediaTime();
      v6 = [(MTUITimerCountdownView *)self countdownCircleLayer];
      [v6 beginTime];
      double v8 = v9 - v10;
    }

    [(MTUITimerCountdownView *)self remainingTime];
    [(MTUITimerCountdownView *)self setRemainingTime:v11 - v8];
  }
  v12 = [(MTUITimerCountdownView *)self mainLayer];
  [v12 removeFromSuperlayer];

  id v13 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(MTUITimerCountdownView *)self setMainLayer:v13];

  v14 = [(MTUITimerCountdownView *)self layer];
  v15 = [(MTUITimerCountdownView *)self mainLayer];
  [v14 addSublayer:v15];

  [(MTUITimerCountdownView *)self frame];
  double v17 = v16;
  [(MTUITimerCountdownView *)self frame];
  double v19 = v18;
  v20 = [(MTUITimerCountdownView *)self mainLayer];
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, v17, v19);

  [(MTUITimerCountdownView *)self setupBackgroundCircle];
  [(MTUITimerCountdownView *)self remainingTime];
  double v22 = v21;
  [(MTUITimerCountdownView *)self duration];
  [(MTUITimerCountdownView *)self setAnimationRemainingTime:v22 totalTime:v23];
  if ([(MTUITimerCountdownView *)self state] == 1) {
    [(MTUITimerCountdownView *)self start];
  }
}

- (void)setupBackgroundCircle
{
  v3 = [(MTUITimerCountdownView *)self backgroundCircleLayer];

  if (v3)
  {
    double v4 = [(MTUITimerCountdownView *)self backgroundCircleLayer];
    [v4 removeFromSuperlayer];
  }
  double v5 = (void *)MEMORY[0x263F1C478];
  [(MTUITimerCountdownView *)self frame];
  double v7 = v6 * 0.5;
  [(MTUITimerCountdownView *)self frame];
  double v9 = v8 * 0.5;
  [(MTUITimerCountdownView *)self frame];
  double v11 = v10 * 0.5;
  [(MTUITimerCountdownView *)self barWidth];
  double v13 = v11 - v12 * 0.5;
  [(MTUITimerCountdownView *)self degToRad:-90.0];
  double v15 = v14;
  [(MTUITimerCountdownView *)self degToRad:270.0];
  double v17 = objc_msgSend(v5, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v7, v9, v13, v15, v16);
  double v18 = objc_opt_new();
  [(MTUITimerCountdownView *)self setBackgroundCircleLayer:v18];

  id v33 = v17;
  uint64_t v19 = [v33 CGPath];
  v20 = [(MTUITimerCountdownView *)self backgroundCircleLayer];
  [v20 setPath:v19];

  id v21 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v22 = [v21 CGColor];
  double v23 = [(MTUITimerCountdownView *)self backgroundCircleLayer];
  [v23 setFillColor:v22];

  id v24 = [(MTUITimerCountdownView *)self backgroundBarColor];
  uint64_t v25 = [v24 CGColor];
  v26 = [(MTUITimerCountdownView *)self backgroundCircleLayer];
  [v26 setStrokeColor:v25];

  [(MTUITimerCountdownView *)self barWidth];
  double v28 = v27;
  v29 = [(MTUITimerCountdownView *)self backgroundCircleLayer];
  [v29 setLineWidth:v28];

  v30 = [(MTUITimerCountdownView *)self backgroundCircleLayer];
  [v30 setStrokeEnd:1.0];

  v31 = [(MTUITimerCountdownView *)self mainLayer];
  v32 = [(MTUITimerCountdownView *)self backgroundCircleLayer];
  [v31 addSublayer:v32];
}

- (void)setAnimationRemainingTime:(double)a3 totalTime:(double)a4
{
  -[MTUITimerCountdownView setRemainingTime:](self, "setRemainingTime:");
  [(MTUITimerCountdownView *)self setDuration:a4];
  [(MTUITimerCountdownView *)self angleForValue:a3 total:a4];
  double v8 = v7;
  double v9 = [(MTUITimerCountdownView *)self countdownCircleLayer];

  if (v9)
  {
    double v10 = [(MTUITimerCountdownView *)self countdownCircleLayer];
    [v10 removeFromSuperlayer];
  }
  double v11 = (void *)MEMORY[0x263F1C478];
  [(MTUITimerCountdownView *)self frame];
  double v13 = v12 * 0.5;
  [(MTUITimerCountdownView *)self frame];
  double v15 = v14 * 0.5;
  [(MTUITimerCountdownView *)self frame];
  double v17 = v16 * 0.5;
  [(MTUITimerCountdownView *)self barWidth];
  double v19 = v17 - v18 * 0.5;
  [(MTUITimerCountdownView *)self degToRad:-90.0];
  double v21 = v20;
  [(MTUITimerCountdownView *)self degToRad:v8];
  double v23 = objc_msgSend(v11, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v13, v15, v19, v21, v22);
  id v24 = objc_opt_new();
  [(MTUITimerCountdownView *)self setCountdownCircleLayer:v24];

  id v41 = v23;
  uint64_t v25 = [v41 CGPath];
  v26 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v26 setPath:v25];

  id v27 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v28 = [v27 CGColor];
  v29 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v29 setFillColor:v28];

  id v30 = [(MTUITimerCountdownView *)self barColor];
  uint64_t v31 = [v30 CGColor];
  v32 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v32 setStrokeColor:v31];

  [(MTUITimerCountdownView *)self barWidth];
  double v34 = v33;
  v35 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v35 setLineWidth:v34];

  v36 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v36 setStrokeEnd:1.0];

  uint64_t v37 = *MEMORY[0x263F15E70];
  v38 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v38 setLineCap:v37];

  v39 = [(MTUITimerCountdownView *)self mainLayer];
  v40 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v39 addSublayer:v40];
}

- (void)start
{
  [(MTUITimerCountdownView *)self setState:1];
  id v10 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
  [(MTUITimerCountdownView *)self remainingTime];
  objc_msgSend(v10, "setDuration:");
  [v10 setFromValue:&unk_26E929F48];
  [v10 setToValue:&unk_26E929F60];
  [v10 setRemovedOnCompletion:0];
  v3 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  [v10 setTimingFunction:v3];

  double v4 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v4 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v6 = v5;
  double v7 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v7 setBeginTime:v6];

  double v8 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v8 setStrokeEnd:0.0];

  double v9 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v9 addAnimation:v10 forKey:@"MTUITimerCountdownViewAnimationKey"];
}

- (double)degToRad:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

- (double)angleForValue:(double)a3 total:(double)a4
{
  return a3 / a4 * 360.0 + -90.0;
}

- (void)pause
{
  [(MTUITimerCountdownView *)self setState:2];
  v3 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v3 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v5 = v4;

  double v6 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v6 setSpeed:0.0];

  id v7 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v7 setTimeOffset:v5];
}

- (void)stop
{
  [(MTUITimerCountdownView *)self setState:0];
  id v3 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  [v3 removeAnimationForKey:@"MTUITimerCountdownViewAnimationKey"];
}

- (void)resume
{
  [(MTUITimerCountdownView *)self setState:1];
  id v3 = [(MTUITimerCountdownView *)self countdownCircleLayer];
  double v4 = [v3 animationForKey:@"MTUITimerCountdownViewAnimationKey"];

  if (v4)
  {
    double v5 = [(MTUITimerCountdownView *)self countdownCircleLayer];
    [v5 timeOffset];
    double v7 = v6;

    double v8 = [(MTUITimerCountdownView *)self countdownCircleLayer];
    LODWORD(v9) = 1.0;
    [v8 setSpeed:v9];

    id v10 = [(MTUITimerCountdownView *)self countdownCircleLayer];
    [v10 setTimeOffset:0.0];

    double v11 = [(MTUITimerCountdownView *)self countdownCircleLayer];
    [v11 setBeginTime:0.0];

    double v12 = [(MTUITimerCountdownView *)self countdownCircleLayer];
    [v12 convertTime:0 fromLayer:CACurrentMediaTime()];
    double v14 = v13 - v7;

    id v15 = [(MTUITimerCountdownView *)self countdownCircleLayer];
    [v15 setBeginTime:v14];
  }
  else
  {
    [(MTUITimerCountdownView *)self start];
  }
}

- (BOOL)isStarted
{
  int64_t v3 = [(MTUITimerCountdownView *)self state];
  if (v3 != 1) {
    LOBYTE(v3) = [(MTUITimerCountdownView *)self state] == 2;
  }
  return v3;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CAShapeLayer)backgroundCircleLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 432, 1);
}

- (void)setBackgroundCircleLayer:(id)a3
{
}

- (CAShapeLayer)countdownCircleLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 440, 1);
}

- (void)setCountdownCircleLayer:(id)a3
{
}

- (UIColor)barColor
{
  return (UIColor *)objc_getProperty(self, a2, 448, 1);
}

- (void)setBarColor:(id)a3
{
}

- (UIColor)backgroundBarColor
{
  return (UIColor *)objc_getProperty(self, a2, 456, 1);
}

- (void)setBackgroundBarColor:(id)a3
{
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
}

- (CALayer)mainLayer
{
  return (CALayer *)objc_getProperty(self, a2, 472, 1);
}

- (void)setMainLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainLayer, 0);
  objc_storeStrong((id *)&self->_backgroundBarColor, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
  objc_storeStrong((id *)&self->_countdownCircleLayer, 0);

  objc_storeStrong((id *)&self->_backgroundCircleLayer, 0);
}

@end