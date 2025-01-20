@interface PXRoundProgressView
+ (CGSize)sizeForSizeClass:(int64_t)a3;
+ (double)toRadian:(double)a3;
+ (int64_t)_sizeClassForSize:(CGSize)a3;
- (CALayer)_irisGlyphLayer;
- (CAShapeLayer)_circleLayer;
- (CAShapeLayer)_foregroundCircleLayer;
- (CAShapeLayer)_sliceLayer;
- (PXProgressArcLayer)_progressArcLayer;
- (PXRoundProgressView)initWithCoder:(id)a3;
- (PXRoundProgressView)initWithFrame:(CGRect)a3;
- (PXRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIView)_contentView;
- (double)_contentsScale;
- (float)progress;
- (int64_t)style;
- (void)_recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4;
- (void)_resetProgress;
- (void)_setCircleLayer:(id)a3;
- (void)_setContentView:(id)a3;
- (void)_setContentsScale:(double)a3;
- (void)_setForegroundCircleLayer:(id)a3;
- (void)_setIrisGlyphLayer:(id)a3;
- (void)_setPieRadius:(double)a3;
- (void)_setProgressArcLayer:(id)a3;
- (void)_setSliceLayer:(id)a3;
- (void)_updateSublayersContentsScale;
- (void)_updateSubviews;
- (void)_updateUIProgress;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)increaseUIProgress:(id)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)setProgress:(float)a3;
- (void)setStyle:(int64_t)a3;
- (void)startProgressTimer;
- (void)stopProgressTimer;
@end

@implementation PXRoundProgressView

uint64_t __41__PXRoundProgressView_startProgressTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) increaseUIProgress:a2];
}

- (void)increaseUIProgress:(id)a3
{
  id v4 = a3;
  double realProgress = self->_realProgress;
  double uiProgress = self->_uiProgress;
  if (realProgress != 0.0 && uiProgress >= realProgress)
  {
LABEL_17:
    if (uiProgress < 1.0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  double increaseRate = self->_increaseRate;
  double v9 = 1.0;
  if (realProgress >= 1.0)
  {
    id v12 = v4;
    double v11 = uiProgress + increaseRate;
    if (v11 <= 1.0)
    {
LABEL_16:
      self->_double uiProgress = v11;
      [(PXRoundProgressView *)self _updateUIProgress];
      double uiProgress = self->_uiProgress;
      id v4 = v12;
      goto LABEL_17;
    }
LABEL_15:
    double v11 = v9;
    goto LABEL_16;
  }
  if (uiProgress + increaseRate * 1.1 < 1.0 && (realProgress != 0.0 || uiProgress < 0.25))
  {
    id v12 = v4;
    double v9 = uiProgress + increaseRate;
    goto LABEL_15;
  }
LABEL_18:
  id v13 = v4;
  [(PXRoundProgressView *)self stopProgressTimer];
  id v4 = v13;
LABEL_19:
}

- (void)_updateUIProgress
{
  +[PXRoundProgressView toRadian:self->_uiProgress];
  double v4 = v3 + 4.71238898;
  id v19 = [(PXRoundProgressView *)self _sliceLayer];
  if (v19)
  {
    double pieRadius = self->_pieRadius;
    v6 = [(PXRoundProgressView *)self _circleLayer];
    if ([(PXRoundProgressView *)self style] == 5 && v6)
    {
      double v7 = self->_pieRadius;
      [v6 lineWidth];
      double pieRadius = v7 - v8;
    }
    CGFloat x = self->_pieCenter.x;
    CGFloat y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, x, y);
    CGPathAddArc(Mutable, 0, x, y, pieRadius, 4.71238898, v4, 0);
    CGPathCloseSubpath(Mutable);
    [v19 setPath:Mutable];
    CFRelease(Mutable);
  }
  id v12 = [(PXRoundProgressView *)self _foregroundCircleLayer];
  if (v12)
  {
    double v13 = self->_pieRadius;
    CGFloat v14 = self->_pieCenter.x;
    CGFloat v15 = self->_pieCenter.y;
    v16 = CGPathCreateMutable();
    CGPathCloseSubpath(v16);
    CGPathAddArc(v16, 0, v14, v15, v13 + -1.0, 4.71238898, v4, 0);
    [v12 setPath:v16];
    [v12 setLineCap:*MEMORY[0x1E4F3A458]];
    CFRelease(v16);
  }
  v17 = [(PXRoundProgressView *)self _progressArcLayer];
  v18 = v17;
  if (v17)
  {
    [v17 setStartAngle:4.71238898];
    [v18 setEndAngle:v4];
  }
}

- (int64_t)style
{
  return self->_style;
}

- (CAShapeLayer)_sliceLayer
{
  return self->__sliceLayer;
}

- (PXProgressArcLayer)_progressArcLayer
{
  return self->__progressArcLayer;
}

- (CAShapeLayer)_foregroundCircleLayer
{
  return self->__foregroundCircleLayer;
}

- (CAShapeLayer)_circleLayer
{
  return self->__circleLayer;
}

+ (double)toRadian:(double)a3
{
  return (a3 + a3) * 3.14159265;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__irisGlyphLayer, 0);
  objc_storeStrong((id *)&self->__progressArcLayer, 0);
  objc_storeStrong((id *)&self->__foregroundCircleLayer, 0);
  objc_storeStrong((id *)&self->__circleLayer, 0);
  objc_storeStrong((id *)&self->__sliceLayer, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->_prevUpdateTime, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
}

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

- (void)_setForegroundCircleLayer:(id)a3
{
}

- (void)_setCircleLayer:(id)a3
{
}

- (void)_setSliceLayer:(id)a3
{
}

- (void)_setContentView:(id)a3
{
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (float)progress
{
  return self->_progress;
}

- (void)_resetProgress
{
  self->_double uiProgress = 0.0;
  self->_double increaseRate = 0.00166666667;
  self->_double realProgress = 0.0;
  double v3 = [MEMORY[0x1E4F1C9C8] date];
  prevUpdateTime = self->_prevUpdateTime;
  self->_prevUpdateTime = v3;

  [(PXRoundProgressView *)self stopProgressTimer];
  [(PXRoundProgressView *)self _updateUIProgress];
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
  if (!self->_progressTimer && self->_realProgress <= 1.0) {
    [(PXRoundProgressView *)self startProgressTimer];
  }
  if (a3 > 0.0)
  {
    double v5 = a3;
    double realProgress = self->_realProgress;
    if (realProgress < 1.0 && realProgress < v5)
    {
      if (a3 >= 1.0)
      {
        double v13 = 1.0 - self->_uiProgress;
        double v14 = 0.1;
      }
      else
      {
        double v8 = [MEMORY[0x1E4F1C9C8] date];
        [v8 timeIntervalSinceDate:self->_prevUpdateTime];
        double v10 = v9;

        double v11 = [MEMORY[0x1E4F1C9C8] date];
        prevUpdateTime = self->_prevUpdateTime;
        self->_prevUpdateTime = v11;

        double v13 = 1.0 - self->_uiProgress;
        double v14 = v10 * (v13 / (v5 - self->_realProgress));
      }
      [(PXRoundProgressView *)self _recalculateIncreaseProgress:v13 withTimeDiff:v14];
      self->_double realProgress = v5;
    }
  }
}

- (void)_recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4
{
  double v4 = a3 / a4 / 60.0;
  if (v4 < 0.000166666667) {
    double v4 = 0.000166666667;
  }
  self->_double increaseRate = v4;
}

- (void)startProgressTimer
{
  if (self->_uiProgress < 1.0 && !self->_progressTimer)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__202786;
    v7[4] = __Block_byref_object_dispose__202787;
    double v8 = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__PXRoundProgressView_startProgressTimer__block_invoke;
    v6[3] = &unk_1E5DC4620;
    v6[4] = v7;
    double v3 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:1 repeats:v6 block:0.0166666667];
    progressTimer = self->_progressTimer;
    self->_progressTimer = v3;

    double v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v5 addTimer:self->_progressTimer forMode:*MEMORY[0x1E4F1C4B0]];

    _Block_object_dispose(v7, 8);
  }
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

- (void)_setPieRadius:(double)a3
{
  self->_double pieRadius = a3;
  [(PXRoundProgressView *)self bounds];
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
  id v10 = [(PXRoundProgressView *)self layer];
  [v10 setCornerRadius:self->_pieRadius];
}

- (void)_updateSubviews
{
  [(PXRoundProgressView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PXRoundProgressView *)self _contentView];
  if (!v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v11 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v11 setAutoresizingMask:18];
    [(PXRoundProgressView *)self addSubview:v11];
    [(PXRoundProgressView *)self _setContentView:v11];
  }
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  CGRect v13 = [v11 layer];
  double v14 = 1.0;
  double v15 = 5.5;
  switch(self->_style)
  {
    case 0:
      PXAssertGetLog();
    case 1:
      v16 = [MEMORY[0x1E4FB1618] whiteColor];
      v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 1;
      goto LABEL_12;
    case 2:
      v16 = [MEMORY[0x1E4FB1618] blackColor];
      v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v22 = 0;
      int v20 = 1;
      double v14 = 0.5;
      goto LABEL_10;
    case 3:
      v17 = 0;
      v16 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v18 = 1;
      goto LABEL_14;
    case 4:
      v16 = [MEMORY[0x1E4FB1618] grayColor];
      v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v22 = 0;
      int v20 = 1;
      double v15 = 10.5;
LABEL_10:
      int v21 = 1;
      break;
    case 5:
      v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v17 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 1;
      double v14 = 0.8;
LABEL_12:
      int v21 = 1;
      goto LABEL_14;
    case 6:
      v23 = [MEMORY[0x1E4FB1618] whiteColor];
      v16 = [v23 colorWithAlphaComponent:0.2];

      v24 = [MEMORY[0x1E4FB1618] whiteColor];
      v17 = [v24 colorWithAlphaComponent:0.9];

      int v18 = 0;
      int v21 = 0;
      int v19 = 1;
      double v15 = 6.5999999;
      int v20 = 1;
LABEL_14:
      int v22 = 1;
      break;
    default:
      v17 = 0;
      v16 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      break;
  }
  [v11 setAlpha:v14];
  double v25 = v8 * 0.5;
  if (v8 * 0.5 >= v10 * 0.5) {
    double v25 = v10 * 0.5;
  }
  double v26 = ceil(v25 / v15);
  double v27 = v25 - v26 * 0.5;
  [(PXRoundProgressView *)self _setPieRadius:v27];
  if (v21)
  {
    v28 = [(PXRoundProgressView *)self _sliceLayer];
    if (!v28)
    {
      v28 = [MEMORY[0x1E4F39C88] layer];
      [v13 addSublayer:v28];
      [(PXRoundProgressView *)self _setSliceLayer:v28];
    }
    [v28 setZPosition:0.0];
    [v28 setStrokeColor:0];
    objc_msgSend(v28, "setFillColor:", objc_msgSend(v16, "CGColor"));

    if (!v20)
    {
LABEL_21:
      if (v19) {
        goto LABEL_22;
      }
LABEL_31:
      if (!v18) {
        goto LABEL_25;
      }
LABEL_32:
      double v60 = v10;
      double v61 = v8;
      [v13 bounds];
      CGFloat x = v63.origin.x;
      CGFloat y = v63.origin.y;
      double width = v63.size.width;
      double height = v63.size.height;
      double MidX = CGRectGetMidX(v63);
      v64.origin.CGFloat x = x;
      v64.origin.CGFloat y = y;
      v64.size.double width = width;
      v64.size.double height = height;
      double MidY = CGRectGetMidY(v64);
      v43 = [(PXRoundProgressView *)self _progressArcLayer];
      if (!v43)
      {
        v43 = objc_alloc_init(PXProgressArcLayer);
        [v13 addSublayer:v43];
        [(PXRoundProgressView *)self _setProgressArcLayer:v43];
      }
      -[PXProgressArcLayer setPosition:](v43, "setPosition:", MidX, MidY);
      double v44 = *MEMORY[0x1E4F1DAD8];
      double v45 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      -[PXProgressArcLayer setBounds:](v43, "setBounds:", *MEMORY[0x1E4F1DAD8], v45, width, height);
      [(PXProgressArcLayer *)v43 setRadius:v27];
      [(PXProgressArcLayer *)v43 setLineWidth:v26];
      v46 = [(PXRoundProgressView *)self _irisGlyphLayer];
      if (!v46)
      {
        v46 = [MEMORY[0x1E4F39BE8] layer];
        uint64_t v47 = objc_msgSend((id)objc_opt_class(), "_sizeClassForSize:", v61, v60);
        v48 = @"-Compact";
        if (v47 != 1) {
          v48 = 0;
        }
        if (v47 == 2) {
          v48 = @"-Regular";
        }
        v62 = [NSString stringWithFormat:@"PXProgressIris%@-PhotoIris", v48];
        v49 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", v62);
        [v49 size];
        double v51 = v50;
        double v53 = v52;
        id v54 = v49;
        v55 = v16;
        int v56 = v22;
        v57 = v17;
        uint64_t v58 = [v54 CGImage];
        objc_msgSend(v46, "setBounds:", v44, v45, v51, v53);
        uint64_t v59 = v58;
        v17 = v57;
        int v22 = v56;
        v16 = v55;
        [v46 setContents:v59];
        [(PXRoundProgressView *)self _setIrisGlyphLayer:v46];
        [v13 addSublayer:v46];
      }
      objc_msgSend(v46, "setPosition:", MidX, MidY);

      if (v22) {
        goto LABEL_26;
      }
LABEL_41:
      [v13 setShadowOpacity:0.0];
      goto LABEL_42;
    }
  }
  else if (!v20)
  {
    goto LABEL_21;
  }
  v32 = [(PXRoundProgressView *)self _circleLayer];
  if (!v32)
  {
    v32 = [MEMORY[0x1E4F39C88] layer];
    [v13 addSublayer:v32];
    [(PXRoundProgressView *)self _setCircleLayer:v32];
  }
  [v32 setZPosition:0.0];
  objc_msgSend(v32, "setStrokeColor:", objc_msgSend(v16, "CGColor"));
  [v32 setFillColor:0];
  [v32 setLineWidth:v26];
  double pieRadius = self->_pieRadius;
  CGFloat v34 = self->_pieCenter.x;
  CGFloat v35 = self->_pieCenter.y;
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, v34, v35, pieRadius + -1.0, 0.0, 6.28318531, 0);
  CGPathCloseSubpath(Mutable);
  [v32 setPath:Mutable];
  CGPathRelease(Mutable);

  if (!v19) {
    goto LABEL_31;
  }
LABEL_22:
  v29 = [(PXRoundProgressView *)self _foregroundCircleLayer];
  if (!v29)
  {
    v29 = [MEMORY[0x1E4F39C88] layer];
    [v13 addSublayer:v29];
    [(PXRoundProgressView *)self _setForegroundCircleLayer:v29];
  }
  [v29 setZPosition:0.0];
  objc_msgSend(v29, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  [v29 setFillColor:0];
  [v29 setLineWidth:v26];

  if (v18) {
    goto LABEL_32;
  }
LABEL_25:
  if (!v22) {
    goto LABEL_41;
  }
LABEL_26:
  id v30 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.75];
  objc_msgSend(v13, "setShadowColor:", objc_msgSend(v30, "CGColor"));

  objc_msgSend(v13, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  LODWORD(v31) = 1.0;
  [v13 setShadowOpacity:v31];
  [v13 setShadowRadius:0.5];
LABEL_42:
  [(PXRoundProgressView *)self _updateUIProgress];
}

- (void)_updateSublayersContentsScale
{
  [(PXRoundProgressView *)self _contentsScale];
  double v4 = v3;
  id v5 = [(PXRoundProgressView *)self _progressArcLayer];
  [v5 setContentsScale:v4];
}

- (void)_setProgressArcLayer:(id)a3
{
  id v5 = (PXProgressArcLayer *)a3;
  if (self->__progressArcLayer != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->__progressArcLayer, a3);
    [(PXRoundProgressView *)self _updateSublayersContentsScale];
    id v5 = v6;
  }
}

- (void)_setContentsScale:(double)a3
{
  if (self->__contentsScale != a3)
  {
    self->__contentsScale = a3;
    [(PXRoundProgressView *)self _updateSublayersContentsScale];
  }
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)PXRoundProgressView;
  [(PXRoundProgressView *)&v8 didMoveToWindow];
  double v3 = [(PXRoundProgressView *)self window];
  double v4 = [v3 screen];
  [v4 scale];
  double v6 = v5;

  [(PXRoundProgressView *)self _setContentsScale:v6];
  double v7 = [(PXRoundProgressView *)self window];

  if (!v7) {
    [(PXRoundProgressView *)self stopProgressTimer];
  }
}

- (void)removeFromSuperview
{
  [(NSTimer *)self->_progressTimer invalidate];
  progressTimer = self->_progressTimer;
  self->_progressTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXRoundProgressView;
  [(PXRoundProgressView *)&v4 removeFromSuperview];
}

- (void)dealloc
{
  [(NSTimer *)self->_progressTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PXRoundProgressView;
  [(PXRoundProgressView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXRoundProgressView;
  [(PXRoundProgressView *)&v3 layoutSubviews];
  [(PXRoundProgressView *)self _updateSubviews];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    objc_super v4 = [(PXRoundProgressView *)self _contentView];
    id v6 = [v4 layer];

    double v5 = [v6 sublayers];
    [v5 makeObjectsPerformSelector:sel_removeFromSuperlayer];

    [(PXRoundProgressView *)self _setSliceLayer:0];
    [(PXRoundProgressView *)self _setCircleLayer:0];
    [(PXRoundProgressView *)self _setForegroundCircleLayer:0];
    [(PXRoundProgressView *)self _setProgressArcLayer:0];
    [(PXRoundProgressView *)self _setIrisGlyphLayer:0];
    [(PXRoundProgressView *)self setNeedsLayout];
  }
}

- (PXRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXRoundProgressView;
  double v5 = -[PXRoundProgressView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    double v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXRoundProgressView *)v6 setBackgroundColor:v7];

    [(PXRoundProgressView *)v6 _updateSubviews];
  }
  return v6;
}

- (PXRoundProgressView)initWithCoder:(id)a3
{
  return -[PXRoundProgressView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PXRoundProgressView)initWithFrame:(CGRect)a3
{
  return -[PXRoundProgressView initWithFrame:style:](self, "initWithFrame:style:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (int64_t)_sizeClassForSize:(CGSize)a3
{
  double width = a3.width;
  objc_msgSend(a1, "sizeForSizeClass:", 2, a3.width, a3.height);
  if (width < v4) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (CGSize)sizeForSizeClass:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    double v3 = 22.0;
    double v4 = 22.0;
  }
  else
  {
    if (a3 != 2) {
      PXAssertGetLog();
    }
    double v3 = 33.0;
    double v4 = 33.0;
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

@end