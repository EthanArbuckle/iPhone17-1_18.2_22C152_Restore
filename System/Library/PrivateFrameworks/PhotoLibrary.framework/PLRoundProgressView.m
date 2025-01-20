@interface PLRoundProgressView
- (BOOL)allowFake25PercentProgress;
- (BOOL)skipResetOnRelayout;
- (CALayer)_irisGlyphLayer;
- (CAShapeLayer)_circleLayer;
- (CAShapeLayer)_sliceLayer;
- (PLProgressArcLayer)_progressArcLayer;
- (PLRoundProgressView)initWithFrame:(CGRect)a3;
- (PLRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIColor)manualColor;
- (UIView)_contentView;
- (double)_contentsScale;
- (double)progress;
- (double)toRadian:(double)a3;
- (int64_t)style;
- (void)_setCircleLayer:(id)a3;
- (void)_setContentView:(id)a3;
- (void)_setContentsScale:(double)a3;
- (void)_setIrisGlyphLayer:(id)a3;
- (void)_setProgressArcLayer:(id)a3;
- (void)_setSliceLayer:(id)a3;
- (void)_updateSublayersContentsScale;
- (void)_updateSubviews;
- (void)_updateUIProgress;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)increaseUIProgress:(id)a3;
- (void)layoutSubviews;
- (void)recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4;
- (void)resetProgress;
- (void)setAllowFake25PercentProgress:(BOOL)a3;
- (void)setInitialIncreaseRatePerFrame:(double)a3;
- (void)setManualColor:(id)a3;
- (void)setPieRadius:(double)a3;
- (void)setProgress:(double)a3;
- (void)setSkipResetOnRelayout:(BOOL)a3;
- (void)startProgressTimer;
- (void)stopProgressTimer;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PLRoundProgressView

- (double)_contentsScale
{
  return self->__contentsScale;
}

- (void)_setIrisGlyphLayer:(id)a3
{
}

- (CALayer)_irisGlyphLayer
{
  return self->__irisGlyphLayer;
}

- (PLProgressArcLayer)_progressArcLayer
{
  return self->__progressArcLayer;
}

- (void)_setCircleLayer:(id)a3
{
}

- (CAShapeLayer)_circleLayer
{
  return self->__circleLayer;
}

- (void)_setSliceLayer:(id)a3
{
}

- (CAShapeLayer)_sliceLayer
{
  return self->__sliceLayer;
}

- (void)_setContentView:(id)a3
{
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (double)progress
{
  return self->_progress;
}

- (void)setSkipResetOnRelayout:(BOOL)a3
{
  self->_skipResetOnRelayout = a3;
}

- (BOOL)skipResetOnRelayout
{
  return self->_skipResetOnRelayout;
}

- (void)setAllowFake25PercentProgress:(BOOL)a3
{
  self->_allowFake25PercentProgress = a3;
}

- (BOOL)allowFake25PercentProgress
{
  return self->_allowFake25PercentProgress;
}

- (UIColor)manualColor
{
  return self->_manualColor;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setManualColor:(id)a3
{
  manualColor = self->_manualColor;
  if (manualColor != a3)
  {
    self->_manualColor = (UIColor *)a3;

    [(PLRoundProgressView *)self _updateSubviews];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLRoundProgressView;
  -[PLRoundProgressView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_);
  if (self->_style == 3)
  {
    if (objc_msgSend((id)-[PLRoundProgressView traitCollection](self, "traitCollection"), "hasDifferentColorAppearanceComparedToTraitCollection:", a3))-[PLRoundProgressView _updateSubviews](self, "_updateSubviews"); {
  }
    }
}

- (void)resetProgress
{
  self->_uiProgress = 0.0;
  self->_increaseRate = 0.00166666667;
  self->_realProgress = 0.0;

  self->_prevUpdateTime = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
  [(PLRoundProgressView *)self stopProgressTimer];
  [(PLRoundProgressView *)self _updateUIProgress];
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  if (!self->_progressTimer && self->_realProgress <= 1.0) {
    [(PLRoundProgressView *)self startProgressTimer];
  }
  if (a3 > 0.0)
  {
    double realProgress = self->_realProgress;
    if (realProgress < 1.0 && realProgress < a3)
    {
      if (a3 >= 1.0)
      {
        double v9 = 1.0 - self->_uiProgress;
        double v10 = 0.1;
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", self->_prevUpdateTime);
        double v8 = v7;

        self->_prevUpdateTime = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
        double v9 = 1.0 - self->_uiProgress;
        double v10 = v8 * (v9 / (a3 - self->_realProgress));
      }
      [(PLRoundProgressView *)self recalculateIncreaseProgress:v9 withTimeDiff:v10];
      self->_double realProgress = a3;
    }
  }
}

- (void)recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4
{
  double v4 = a3 / a4 / 60.0;
  if (v4 < 0.000166666667) {
    double v4 = 0.000166666667;
  }
  if (v4 > 0.0166666667) {
    double v4 = 0.0166666667;
  }
  self->_increaseRate = v4;
}

- (void)setInitialIncreaseRatePerFrame:(double)a3
{
  if (!self->_progressTimer) {
    self->_increaseRate = a3;
  }
}

- (void)_updateUIProgress
{
  [(PLRoundProgressView *)self toRadian:self->_uiProgress];
  double v4 = v3 + 4.71238898;
  objc_super v5 = [(PLRoundProgressView *)self _sliceLayer];
  if (v5)
  {
    v6 = v5;
    double pieRadius = self->_pieRadius;
    CGFloat x = self->_pieCenter.x;
    CGFloat y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, x, y);
    CGPathAddArc(Mutable, 0, x, y, pieRadius, 4.71238898, v4, 0);
    CGPathCloseSubpath(Mutable);
    [(CAShapeLayer *)v6 setPath:Mutable];
    CFRelease(Mutable);
  }
  v11 = [(PLRoundProgressView *)self _progressArcLayer];
  if (v11)
  {
    v12 = v11;
    [(PLProgressArcLayer *)v11 setStartAngle:4.71238898];
    [(PLProgressArcLayer *)v12 setEndAngle:v4];
  }
}

- (void)increaseUIProgress:(id)a3
{
  double realProgress = self->_realProgress;
  double uiProgress = self->_uiProgress;
  if (realProgress != 0.0 && uiProgress >= realProgress)
  {
LABEL_13:
    if (uiProgress < 1.0) {
      return;
    }
    goto LABEL_18;
  }
  double increaseRate = self->_increaseRate;
  double v8 = 1.0;
  if (realProgress >= 1.0)
  {
    double v9 = uiProgress + increaseRate;
    if (v9 <= 1.0)
    {
LABEL_12:
      self->_double uiProgress = v9;
      [(PLRoundProgressView *)self _updateUIProgress];
      double uiProgress = self->_uiProgress;
      goto LABEL_13;
    }
LABEL_11:
    double v9 = v8;
    goto LABEL_12;
  }
  if (uiProgress + increaseRate * 1.1 < 1.0)
  {
    if (realProgress != 0.0)
    {
LABEL_9:
      double v8 = uiProgress + increaseRate;
      goto LABEL_11;
    }
    if (uiProgress < 0.25 && [(PLRoundProgressView *)self allowFake25PercentProgress])
    {
      double uiProgress = self->_uiProgress;
      double increaseRate = self->_increaseRate;
      goto LABEL_9;
    }
  }
LABEL_18:
  [(PLRoundProgressView *)self stopProgressTimer];
}

- (double)toRadian:(double)a3
{
  return (a3 + a3) * 3.14159265;
}

- (void)startProgressTimer
{
  if (self->_uiProgress < 1.0 && !self->_progressTimer)
  {
    v3[0] = 0;
    v3[1] = v3;
    v3[2] = 0x3052000000;
    v3[3] = __Block_byref_object_copy__2694;
    v3[4] = __Block_byref_object_dispose__2695;
    v3[5] = self;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __41__PLRoundProgressView_startProgressTimer__block_invoke;
    v2[3] = &unk_1E63D2300;
    v2[4] = v3;
    self->_progressTimer = (NSTimer *)(id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v2 block:0.0166666667];
    _Block_object_dispose(v3, 8);
  }
}

uint64_t __41__PLRoundProgressView_startProgressTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) increaseUIProgress:a2];
}

- (void)stopProgressTimer
{
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    [(NSTimer *)progressTimer invalidate];

    self->_progressTimer = 0;
  }
}

- (void)setPieRadius:(double)a3
{
  self->_double pieRadius = a3;
  [(PLRoundProgressView *)self bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGFloat MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v14);
  self->_pieCenter.CGFloat x = MidX;
  self->_pieCenter.CGFloat y = MidY;
  double v10 = (void *)[(PLRoundProgressView *)self layer];
  double pieRadius = self->_pieRadius;
  [v10 setCornerRadius:pieRadius];
}

- (void)_updateSubviews
{
  [(PLRoundProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PLRoundProgressView *)self _contentView];
  if (!v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v11 = (UIView *)(id)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v11 setAutoresizingMask:18];
    [(PLRoundProgressView *)self addSubview:v11];
    [(PLRoundProgressView *)self _setContentView:v11];
  }
  -[UIView setFrame:](v11, "setFrame:", v4, v6, v8, v10);
  CGRect v13 = [(UIView *)v11 layer];
  double v14 = 1.0;
  switch(self->_style)
  {
    case 0:
      v15 = (UIColor *)[MEMORY[0x1E4F428B8] whiteColor];
      int v16 = 0;
      int v17 = 1;
      goto LABEL_8;
    case 1:
      v15 = (UIColor *)[MEMORY[0x1E4F428B8] blackColor];
      int v16 = 0;
      BOOL v18 = 0;
      goto LABEL_10;
    case 2:
      v15 = 0;
      int v17 = 0;
      int v16 = 1;
LABEL_8:
      BOOL v18 = 1;
      break;
    case 3:
      BOOL v18 = objc_msgSend((id)-[PLRoundProgressView traitCollection](self, "traitCollection"), "userInterfaceStyle") != 2;
      v15 = (UIColor *)[MEMORY[0x1E4F428B8] labelColor];
      int v16 = 0;
LABEL_10:
      int v17 = 1;
      double v14 = 0.5;
      break;
    default:
      v15 = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      break;
  }
  if ([(PLRoundProgressView *)self manualColor])
  {
    v15 = [(PLRoundProgressView *)self manualColor];
    *(double *)&uint64_t v45 = 1.0;
    if ([(UIColor *)v15 getRed:0 green:0 blue:0 alpha:&v45]) {
      v15 = [(UIColor *)v15 colorWithAlphaComponent:1.0];
    }
    double v14 = *(double *)&v45;
  }
  [(UIView *)v11 setAlpha:v14];
  double v19 = v8 * 0.5;
  if (v8 * 0.5 >= v10 * 0.5) {
    double v19 = v10 * 0.5;
  }
  double v20 = ceil(v19 / 5.5);
  double v21 = v19 - v20 * 0.5;
  [(PLRoundProgressView *)self setPieRadius:v21];
  if ([(PLRoundProgressView *)self skipResetOnRelayout])
  {
    if (v17) {
      goto LABEL_19;
    }
LABEL_28:
    if (!v16) {
      goto LABEL_24;
    }
LABEL_29:
    double v44 = v8;
    [(CALayer *)v13 bounds];
    CGFloat x = v46.origin.x;
    CGFloat y = v46.origin.y;
    double width = v46.size.width;
    double height = v46.size.height;
    double MidX = CGRectGetMidX(v46);
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.double width = width;
    v47.size.double height = height;
    double MidY = CGRectGetMidY(v47);
    v35 = [(PLRoundProgressView *)self _progressArcLayer];
    if (!v35)
    {
      v35 = objc_alloc_init(PLProgressArcLayer);
      [(CALayer *)v13 addSublayer:v35];
      [(PLRoundProgressView *)self _setProgressArcLayer:v35];
    }
    -[PLProgressArcLayer setPosition:](v35, "setPosition:", MidX, MidY);
    double v36 = *MEMORY[0x1E4F1DAD8];
    double v37 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[PLProgressArcLayer setBounds:](v35, "setBounds:", *MEMORY[0x1E4F1DAD8], v37, width, height);
    [(PLProgressArcLayer *)v35 setRadius:v21];
    [(PLProgressArcLayer *)v35 setLineWidth:v20];
    v38 = [(PLRoundProgressView *)self _irisGlyphLayer];
    if (!v38)
    {
      v38 = (CALayer *)[MEMORY[0x1E4F39BE8] layer];
      v39 = @"-Compact";
      if (v44 >= 30.0) {
        v39 = @"-Regular";
      }
      uint64_t v40 = [NSString stringWithFormat:@"PLProgressIris%@-PhotoIris", 30.0, v44, v39];
      v41 = (void *)[MEMORY[0x1E4F42A80] imageNamed:v40 inBundle:PLPhotoLibraryFrameworkBundle()];
      [v41 size];
      -[CALayer setBounds:](v38, "setBounds:", v36, v37, v42, v43);
      -[CALayer setContents:](v38, "setContents:", [v41 CGImage]);
      [(PLRoundProgressView *)self _setIrisGlyphLayer:v38];
      [(CALayer *)v13 addSublayer:v38];
    }
    -[CALayer setPosition:](v38, "setPosition:", MidX, MidY);
    if (v18) {
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  [(PLRoundProgressView *)self resetProgress];
  if (!v17) {
    goto LABEL_28;
  }
LABEL_19:
  v22 = [(PLRoundProgressView *)self _sliceLayer];
  if (!v22)
  {
    v22 = (CAShapeLayer *)[MEMORY[0x1E4F39C88] layer];
    [(CALayer *)v13 addSublayer:v22];
    [(PLRoundProgressView *)self _setSliceLayer:v22];
  }
  [(CAShapeLayer *)v22 setZPosition:0.0];
  [(CAShapeLayer *)v22 setStrokeColor:0];
  [(CAShapeLayer *)v22 setFillColor:[(UIColor *)v15 CGColor]];
  v23 = [(PLRoundProgressView *)self _circleLayer];
  if (!v23)
  {
    v23 = (CAShapeLayer *)[MEMORY[0x1E4F39C88] layer];
    [(CALayer *)v13 addSublayer:v23];
    [(PLRoundProgressView *)self _setCircleLayer:v23];
  }
  [(CAShapeLayer *)v23 setZPosition:0.0];
  [(CAShapeLayer *)v23 setStrokeColor:[(UIColor *)v15 CGColor]];
  [(CAShapeLayer *)v23 setFillColor:0];
  [(CAShapeLayer *)v23 setLineWidth:v20];
  double pieRadius = self->_pieRadius;
  CGFloat v25 = self->_pieCenter.x;
  CGFloat v26 = self->_pieCenter.y;
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, v25, v26, pieRadius + -1.0, 0.0, 6.28318531, 0);
  CGPathCloseSubpath(Mutable);
  [(CAShapeLayer *)v23 setPath:Mutable];
  CGPathRelease(Mutable);
  if (v16) {
    goto LABEL_29;
  }
LABEL_24:
  if (v18)
  {
LABEL_25:
    -[CALayer setShadowColor:](v13, "setShadowColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.0, 0.75), "CGColor"));
    -[CALayer setShadowOffset:](v13, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    LODWORD(v28) = 1.0;
    [(CALayer *)v13 setShadowOpacity:v28];
    [(CALayer *)v13 setShadowRadius:0.5];
  }
LABEL_26:
  [(PLRoundProgressView *)self _updateUIProgress];
}

- (void)_updateSublayersContentsScale
{
  [(PLRoundProgressView *)self _contentsScale];
  double v4 = v3;
  double v5 = [(PLRoundProgressView *)self _progressArcLayer];
  [(PLProgressArcLayer *)v5 setContentsScale:v4];
}

- (void)_setProgressArcLayer:(id)a3
{
  progressArcLayer = self->__progressArcLayer;
  if (progressArcLayer != a3)
  {

    self->__progressArcLayer = (PLProgressArcLayer *)a3;
    [(PLRoundProgressView *)self _updateSublayersContentsScale];
  }
}

- (void)_setContentsScale:(double)a3
{
  if (self->__contentsScale != a3)
  {
    self->__contentsScale = a3;
    [(PLRoundProgressView *)self _updateSublayersContentsScale];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PLRoundProgressView;
  [(PLRoundProgressView *)&v3 didMoveToWindow];
  objc_msgSend((id)objc_msgSend((id)-[PLRoundProgressView window](self, "window"), "screen"), "scale");
  -[PLRoundProgressView _setContentsScale:](self, "_setContentsScale:");
}

- (void)dealloc
{
  [(NSTimer *)self->_progressTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLRoundProgressView;
  [(PLRoundProgressView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLRoundProgressView;
  [(PLRoundProgressView *)&v3 layoutSubviews];
  [(PLRoundProgressView *)self _updateSubviews];
}

- (PLRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PLRoundProgressView;
  double v5 = -[PLRoundProgressView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v5->_allowFake25PercentProgress = 1;
    v5->_skipResetOnRelayout = 0;
    -[PLRoundProgressView setBackgroundColor:](v5, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
    [(PLRoundProgressView *)v6 _updateSubviews];
  }
  return v6;
}

- (PLRoundProgressView)initWithFrame:(CGRect)a3
{
  return -[PLRoundProgressView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end