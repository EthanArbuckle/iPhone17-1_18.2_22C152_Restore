@interface STSRoundProgressView
- (STSProgressArcLayer)_progressArcLayer;
- (STSRoundProgressView)initWithFrame:(CGRect)a3;
- (STSRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (double)_contentsScale;
- (double)progress;
- (double)toRadian:(double)a3;
- (int64_t)style;
- (void)_setContentsScale:(double)a3;
- (void)_setProgressArcLayer:(id)a3;
- (void)_setupSubviews;
- (void)_updateSublayersContentsScale;
- (void)_updateUIProgress;
- (void)didMoveToWindow;
- (void)increaseUIProgress:(id)a3;
- (void)layoutSubviews;
- (void)recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4;
- (void)resetProgress;
- (void)setInitialIncreaseRatePerFrame:(double)a3;
- (void)setPieRadius:(double)a3;
- (void)setProgress:(double)a3;
- (void)startProgressTimer;
- (void)stopProgressTimer;
@end

@implementation STSRoundProgressView

- (STSRoundProgressView)initWithFrame:(CGRect)a3
{
  return -[STSRoundProgressView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (STSRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)STSRoundProgressView;
  v5 = -[STSRoundProgressView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v7 = [MEMORY[0x263F825C8] clearColor];
    [(STSRoundProgressView *)v6 setBackgroundColor:v7];

    [(STSRoundProgressView *)v6 _setupSubviews];
  }
  return v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)STSRoundProgressView;
  [(STSRoundProgressView *)&v3 layoutSubviews];
  [(STSRoundProgressView *)self _setupSubviews];
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)STSRoundProgressView;
  [(STSRoundProgressView *)&v7 didMoveToWindow];
  objc_super v3 = [(STSRoundProgressView *)self window];
  v4 = [v3 screen];
  [v4 scale];
  double v6 = v5;

  [(STSRoundProgressView *)self _setContentsScale:v6];
}

- (void)_setContentsScale:(double)a3
{
  if (self->__contentsScale != a3)
  {
    self->__contentsScale = a3;
    [(STSRoundProgressView *)self _updateSublayersContentsScale];
  }
}

- (void)_setProgressArcLayer:(id)a3
{
  double v5 = (STSProgressArcLayer *)a3;
  p_progressArcLayer = &self->__progressArcLayer;
  if (self->__progressArcLayer != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_progressArcLayer, a3);
    p_progressArcLayer = (STSProgressArcLayer **)[(STSRoundProgressView *)self _updateSublayersContentsScale];
    double v5 = v7;
  }

  MEMORY[0x270F9A758](p_progressArcLayer, v5);
}

- (void)_updateSublayersContentsScale
{
  [(STSRoundProgressView *)self _contentsScale];
  double v4 = v3;
  id v5 = [(STSRoundProgressView *)self _progressArcLayer];
  [v5 setContentsScale:v4];
}

- (void)_setupSubviews
{
  [(STSRoundProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  objc_super v9 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v7, v8, v3, v5);
  [v9 setAutoresizingMask:18];
  [(STSRoundProgressView *)self addSubview:v9];
  v10 = [v9 layer];
  int64_t style = self->_style;
  if (style == 1)
  {
    id v30 = [MEMORY[0x263F825C8] blackColor];
    int v14 = 0;
    int v13 = 1;
    double v12 = 0.5;
  }
  else
  {
    double v12 = 1.0;
    if (style)
    {
      id v30 = 0;
      int v13 = 0;
      int v14 = 0;
    }
    else
    {
      id v30 = [MEMORY[0x263F825C8] whiteColor];
      int v13 = 1;
      int v14 = 1;
    }
  }
  [v9 setAlpha:v12];
  double v15 = v4 * 0.5;
  if (v4 * 0.5 >= v6 * 0.5) {
    double v15 = v6 * 0.5;
  }
  double v16 = ceil(v15 / 5.5);
  [(STSRoundProgressView *)self setPieRadius:v15 - v16 * 0.5];
  progressTimer = self->_progressTimer;
  self->_progressTimer = 0;

  [(STSRoundProgressView *)self resetProgress];
  if (v13)
  {
    v18 = [MEMORY[0x263F15880] layer];
    sliceLayer = self->_sliceLayer;
    self->_sliceLayer = v18;

    [(CAShapeLayer *)self->_sliceLayer setZPosition:0.0];
    [(CAShapeLayer *)self->_sliceLayer setStrokeColor:0];
    v20 = self->_sliceLayer;
    id v21 = v30;
    -[CAShapeLayer setFillColor:](v20, "setFillColor:", [v21 CGColor]);
    v22 = [MEMORY[0x263F15880] layer];
    circleLayer = self->_circleLayer;
    self->_circleLayer = v22;

    [(CAShapeLayer *)self->_circleLayer setZPosition:0.0];
    -[CAShapeLayer setStrokeColor:](self->_circleLayer, "setStrokeColor:", [v21 CGColor]);
    [(CAShapeLayer *)self->_circleLayer setFillColor:0];
    [(CAShapeLayer *)self->_circleLayer setLineWidth:v16];
    double pieRadius = self->_pieRadius;
    CGFloat x = self->_pieCenter.x;
    CGFloat y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathAddArc(Mutable, 0, x, y, pieRadius + -1.0, 0.0, 6.28318531, 0);
    CGPathCloseSubpath(Mutable);
    [(CAShapeLayer *)self->_circleLayer setPath:Mutable];
    CGPathRelease(Mutable);
    [v10 addSublayer:self->_circleLayer];
    [v10 addSublayer:self->_sliceLayer];
  }
  if (v14)
  {
    id v28 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.75];
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v28, "CGColor"));

    objc_msgSend(v10, "setShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    LODWORD(v29) = 1.0;
    [v10 setShadowOpacity:v29];
    [v10 setShadowRadius:0.5];
  }
  [(STSRoundProgressView *)self _updateUIProgress];
}

- (void)setPieRadius:(double)a3
{
  self->_double pieRadius = a3;
  [(STSRoundProgressView *)self bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  CGFloat MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v13);
  self->_pieCenter.CGFloat x = MidX;
  self->_pieCenter.CGFloat y = MidY;
  id v10 = [(STSRoundProgressView *)self layer];
  [v10 setCornerRadius:self->_pieRadius];
}

- (void)stopProgressTimer
{
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    [(NSTimer *)progressTimer invalidate];
    double v4 = self->_progressTimer;
    self->_progressTimer = 0;
  }
}

- (void)startProgressTimer
{
  if (self->_uiProgress < 1.0 && !self->_progressTimer)
  {
    double v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_increaseUIProgress_ selector:0 userInfo:1 repeats:0.0166666667];
    progressTimer = self->_progressTimer;
    self->_progressTimer = v3;
    MEMORY[0x270F9A758](v3, progressTimer);
  }
}

- (double)toRadian:(double)a3
{
  return (a3 + a3) * 3.14159265;
}

- (void)increaseUIProgress:(id)a3
{
  id v10 = a3;
  double realProgress = self->_realProgress;
  if (realProgress != 0.0)
  {
    double uiProgress = self->_uiProgress;
    if (uiProgress >= realProgress)
    {
LABEL_11:
      if (uiProgress < 1.0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  double v6 = self->_uiProgress;
  double increaseRate = self->_increaseRate;
  double v8 = 1.0;
  if (realProgress >= 1.0)
  {
    double v9 = v6 + increaseRate;
    if (v6 + increaseRate <= 1.0)
    {
LABEL_10:
      self->_double uiProgress = v9;
      [(STSRoundProgressView *)self _updateUIProgress];
      double uiProgress = self->_uiProgress;
      goto LABEL_11;
    }
LABEL_9:
    double v9 = v8;
    goto LABEL_10;
  }
  if (v6 + increaseRate * 1.1 < 1.0 && (realProgress != 0.0 || v6 < 0.05))
  {
    double v8 = v6 + increaseRate;
    goto LABEL_9;
  }
LABEL_12:
  [(STSRoundProgressView *)self stopProgressTimer];
LABEL_13:
}

- (void)_updateUIProgress
{
  [(STSRoundProgressView *)self toRadian:self->_uiProgress];
  double v4 = v3 + 4.71238898;
  if (self->_sliceLayer)
  {
    double pieRadius = self->_pieRadius;
    CGFloat x = self->_pieCenter.x;
    CGFloat y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, x, y);
    CGPathAddArc(Mutable, 0, x, y, pieRadius, 4.71238898, v4, 0);
    CGPathCloseSubpath(Mutable);
    [(CAShapeLayer *)self->_sliceLayer setPath:Mutable];
    CFRelease(Mutable);
  }
  double v9 = [(STSRoundProgressView *)self _progressArcLayer];
  if (v9)
  {
    id v10 = v9;
    [v9 setStartAngle:4.71238898];
    [v10 setEndAngle:v4];
    double v9 = v10;
  }
}

- (void)setInitialIncreaseRatePerFrame:(double)a3
{
  if (!self->_progressTimer) {
    self->_double increaseRate = a3;
  }
}

- (void)recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4
{
  double v4 = a3 / a4 / 60.0;
  if (v4 < 0.000166666667) {
    double v4 = 0.000166666667;
  }
  self->_double increaseRate = v4;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  if (!self->_progressTimer && self->_realProgress <= 1.0) {
    [(STSRoundProgressView *)self startProgressTimer];
  }
  if (a3 > 0.0)
  {
    double realProgress = self->_realProgress;
    if (realProgress < 1.0 && realProgress < a3)
    {
      if (a3 >= 1.0)
      {
        double v12 = 1.0 - self->_uiProgress;
        double v13 = 0.1;
      }
      else
      {
        double v7 = [MEMORY[0x263EFF910] date];
        [v7 timeIntervalSinceDate:self->_prevUpdateTime];
        double v9 = v8;

        id v10 = [MEMORY[0x263EFF910] date];
        prevUpdateTime = self->_prevUpdateTime;
        self->_prevUpdateTime = v10;

        double v12 = 1.0 - self->_uiProgress;
        double v13 = v9 * (v12 / (a3 - self->_realProgress));
      }
      [(STSRoundProgressView *)self recalculateIncreaseProgress:v12 withTimeDiff:v13];
      self->_double realProgress = a3;
    }
  }
}

- (void)resetProgress
{
  self->_double uiProgress = 0.0;
  self->_double increaseRate = 0.00166666667;
  self->_double realProgress = 0.0;
  double v3 = [MEMORY[0x263EFF910] date];
  prevUpdateTime = self->_prevUpdateTime;
  self->_prevUpdateTime = v3;

  [(STSRoundProgressView *)self stopProgressTimer];

  [(STSRoundProgressView *)self _updateUIProgress];
}

- (int64_t)style
{
  return self->_style;
}

- (double)progress
{
  return self->_progress;
}

- (STSProgressArcLayer)_progressArcLayer
{
  return self->__progressArcLayer;
}

- (double)_contentsScale
{
  return self->__contentsScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progressArcLayer, 0);
  objc_storeStrong((id *)&self->_prevUpdateTime, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);

  objc_storeStrong((id *)&self->_sliceLayer, 0);
}

@end