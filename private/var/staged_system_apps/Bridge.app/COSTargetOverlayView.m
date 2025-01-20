@interface COSTargetOverlayView
- (BOOL)firstReadDone;
- (BOOL)usingAgaveReticuleMetrics;
- (CGRect)targetRect;
- (COSTargetBackgroundView)backgroundView;
- (COSTargetOutlineView)outlineView;
- (COSTargetOverlayView)initWithFrame:(CGRect)a3;
- (COSTargetProgressView)progressView;
- (NSTimer)progressTimer;
- (UIBezierPath)cutoutPath;
- (UILabel)progressLabel;
- (double)cachedProgress;
- (double)gradientHeight;
- (double)targetAspect;
- (double)targetCornerRadius;
- (double)targetWidthRatio;
- (void)_checkForProximateAgaveDevice;
- (void)_configureMetrics;
- (void)_setupSubviews;
- (void)_updateProgressViewFrame:(float)a3;
- (void)_updateSubviews;
- (void)layoutSubviews;
- (void)removeAnimation;
- (void)setBackgroundView:(id)a3;
- (void)setCachedProgress:(double)a3;
- (void)setCutoutPath:(id)a3;
- (void)setFirstReadDone:(BOOL)a3;
- (void)setGradientHeight:(double)a3;
- (void)setOutlineView:(id)a3;
- (void)setProgressLabel:(id)a3;
- (void)setProgressTimer:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setScanningProgress:(double)a3 key:(id)a4;
- (void)setTargetAspect:(double)a3;
- (void)setTargetCornerRadius:(double)a3;
- (void)setTargetRect:(CGRect)a3;
- (void)setTargetWidthRatio:(double)a3;
- (void)setUsingAgaveReticuleMetrics:(BOOL)a3;
@end

@implementation COSTargetOverlayView

- (COSTargetOverlayView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)COSTargetOverlayView;
  v3 = -[COSTargetOverlayView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_usingAgaveReticuleMetrics = 0;
    [(COSTargetOverlayView *)v3 _checkForProximateAgaveDevice];
    [(COSTargetOverlayView *)v4 _setupSubviews];
    v5 = +[UIColor clearColor];
    [(COSTargetOverlayView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)COSTargetOverlayView;
  [(COSTargetOverlayView *)&v3 layoutSubviews];
  [(COSTargetOverlayView *)self _updateSubviews];
}

- (void)setScanningProgress:(double)a3 key:(id)a4
{
  id v18 = a4;
  if (a3 > 0.0 && self->_cachedProgress != a3)
  {
    [(NSTimer *)self->_progressTimer invalidate];
    progressTimer = self->_progressTimer;
    self->_progressTimer = 0;

    objc_super v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"removeAnimation" selector:0 userInfo:0 repeats:2.0];
    v8 = self->_progressTimer;
    self->_progressTimer = v7;

    if (self->_cachedProgress == -1.0
      || [(COSTargetProgressView *)self->_progressView isHidden])
    {
      [(COSTargetProgressView *)self->_progressView setHidden:0];
      progressView = self->_progressView;
      v10 = +[UIColor systemYellowColor];
      [(COSTargetProgressView *)progressView animateToColor:v10];

      if (!self->_firstReadDone)
      {
        v11 = [(COSTargetOverlayView *)self outlineView];
        [v11 setHidden:1];

        [(COSTargetProgressView *)self->_progressView pulseAnimation];
        [(COSTargetBackgroundView *)self->_backgroundView pulseBackground];
        self->_firstReadDone = 1;
      }
    }
    if (a3 >= 1.0)
    {
      v12 = self->_progressView;
      v13 = +[UIColor greenColor];
      [(COSTargetProgressView *)v12 animateToColor:v13];

      [(NSTimer *)self->_progressTimer invalidate];
      v14 = self->_progressTimer;
      self->_progressTimer = 0;
    }
  }
  int v15 = MGGetBoolAnswer();
  v17 = v18;
  if (v15)
  {
    if (v18 || (double cachedProgress = self->_cachedProgress, cachedProgress != a3))
    {
      if (v18) {
        [(UILabel *)self->_progressLabel setText:v18];
      }
      *(float *)&double cachedProgress = a3;
      [(COSTargetOverlayView *)self _updateProgressViewFrame:cachedProgress];
      v17 = v18;
    }
  }
  self->_double cachedProgress = a3;
}

- (void)removeAnimation
{
  self->_firstReadDone = 0;
  objc_super v3 = [(COSTargetOverlayView *)self outlineView];
  [v3 setHidden:0];

  self->_double cachedProgress = -1.0;
  [(COSTargetBackgroundView *)self->_backgroundView removeAnimation];
  progressView = self->_progressView;

  [(COSTargetProgressView *)progressView removeAnimation];
}

- (void)_updateProgressViewFrame:(float)a3
{
  p_targetRect = &self->_targetRect;
  double MinX = CGRectGetMinX(self->_targetRect);
  CGRectGetMaxY(*p_targetRect);
  double Width = CGRectGetWidth(*p_targetRect);
  BPSCurrentScreenType();
  progressLabel = self->_progressLabel;
  double v9 = fmin(fmax(a3, 0.0), 1.0) * Width;

  -[UILabel setFrame:](progressLabel, "setFrame:", MinX, 0.0, v9, 10.0);
}

- (void)_setupSubviews
{
  [(COSTargetOverlayView *)self _configureMetrics];
  objc_super v3 = [[COSTargetBackgroundView alloc] initWithCutoutPath:self->_cutoutPath gradientHeight:self->_gradientHeight];
  [(COSTargetOverlayView *)self setBackgroundView:v3];

  [(COSTargetOverlayView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(COSTargetOverlayView *)self backgroundView];
  [v12 setFrame:v5, v7, v9, v11];

  v13 = [(COSTargetOverlayView *)self backgroundView];
  [(COSTargetOverlayView *)self addSubview:v13];

  v14 = [[COSTargetOutlineView alloc] initWithOutlinePath:self->_cutoutPath];
  [(COSTargetOverlayView *)self setOutlineView:v14];

  [(COSTargetOverlayView *)self bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(COSTargetOverlayView *)self outlineView];
  [v23 setFrame:v16, v18, v20, v22];

  v24 = [(COSTargetOverlayView *)self outlineView];
  [(COSTargetOverlayView *)self addSubview:v24];

  v25 = [[COSTargetProgressView alloc] initWithOutlinePath:self->_cutoutPath];
  [(COSTargetOverlayView *)self setProgressView:v25];

  [(COSTargetOverlayView *)self bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(COSTargetOverlayView *)self progressView];
  [v34 setFrame:v27, v29, v31, v33];

  v35 = [(COSTargetOverlayView *)self progressView];
  [(COSTargetOverlayView *)self addSubview:v35];

  if (MGGetBoolAnswer())
  {
    self->_double cachedProgress = -1.0;
    v36 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    progressLabel = self->_progressLabel;
    self->_progressLabel = v36;

    v38 = +[UIColor greenColor];
    v39 = [v38 colorWithAlphaComponent:0.5];
    [(UILabel *)self->_progressLabel setBackgroundColor:v39];

    v40 = +[UIColor whiteColor];
    [(UILabel *)self->_progressLabel setTextColor:v40];

    v41 = +[UIFont systemFontOfSize:7.0];
    [(UILabel *)self->_progressLabel setFont:v41];

    [(UILabel *)self->_progressLabel setNumberOfLines:0];
    v42 = [(UILabel *)self->_progressLabel layer];
    [v42 setCornerRadius:4.0];

    [(UILabel *)self->_progressLabel setClipsToBounds:1];
    [(COSTargetOverlayView *)self addSubview:self->_progressLabel];
    LODWORD(v43) = -1.0;
    [(COSTargetOverlayView *)self _updateProgressViewFrame:v43];
  }
}

- (void)_updateSubviews
{
  [(COSTargetOverlayView *)self _configureMetrics];
  cutoutPath = self->_cutoutPath;
  double v4 = [(COSTargetOverlayView *)self backgroundView];
  [v4 setCutoutPath:cutoutPath];

  double gradientHeight = self->_gradientHeight;
  double v6 = [(COSTargetOverlayView *)self backgroundView];
  [v6 setGradientHeight:gradientHeight];

  double v7 = [(COSTargetOverlayView *)self backgroundView];
  [v7 setNeedsDisplay];

  double v8 = self->_cutoutPath;
  double v9 = [(COSTargetOverlayView *)self outlineView];
  [v9 setOutlinePath:v8];

  double v10 = [(COSTargetOverlayView *)self outlineView];
  [v10 setNeedsDisplay];

  double v11 = self->_cutoutPath;
  v12 = [(COSTargetOverlayView *)self progressView];
  [v12 setOutlinePath:v11];

  id v13 = [(COSTargetOverlayView *)self progressView];
  [v13 setNeedsDisplay];
}

- (void)_configureMetrics
{
  self->_targetAspect = 0.865;
  self->_targetWidthRatio = 0.46;
  if (self->_usingAgaveReticuleMetrics)
  {
    self->_targetAspect = 0.817;
    double v3 = 0.263;
  }
  else
  {
    double v3 = 0.2;
  }
  uint64_t v4 = BPSCurrentScreenType();
  uint64_t v5 = MGGetProductType();
  if (v5 <= 1434404432)
  {
    if (v5 > 851437780)
    {
      if (v5 == 851437781) {
        goto LABEL_17;
      }
      uint64_t v6 = 1060988941;
    }
    else
    {
      if (v5 == 330877086) {
        goto LABEL_17;
      }
      uint64_t v6 = 574536383;
    }
  }
  else
  {
    if (v5 > 2795618602)
    {
      if (v5 != 2795618603 && v5 != 4201643249)
      {
        uint64_t v6 = 3585085679;
        goto LABEL_16;
      }
LABEL_17:
      BOOL v7 = v5 == 2080700391 && v4 == 5;
      double v8 = 0.31;
      if (v7) {
        double v8 = 0.55;
      }
      goto LABEL_22;
    }
    if (v5 == 1434404433) {
      goto LABEL_17;
    }
    uint64_t v6 = 2021146989;
  }
LABEL_16:
  if (v5 == v6) {
    goto LABEL_17;
  }
  if (v4 == 5 && v5 == 2080700391)
  {
    double v8 = 0.55;
  }
  else if (v4 == 4)
  {
    double v8 = 0.51;
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_23;
    }
    double v8 = dbl_1001AB200[!self->_usingAgaveReticuleMetrics];
  }
LABEL_22:
  self->_targetWidthRatio = v8;
LABEL_23:
  [(COSTargetOverlayView *)self bounds];
  CGFloat v10 = ceil(self->_targetWidthRatio * v9);
  CGFloat v11 = v10 / self->_targetAspect;
  self->_targetRect.origin.x = (v9 - v10) * 0.5;
  self->_targetRect.origin.y = (v12 - v11) * 0.5;
  self->_targetRect.size.width = v10;
  self->_targetRect.size.height = v11;
  self->_targetCornerRadius = v3 * v10;
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", self->_targetRect.origin.x, self->_targetRect.origin.y, self->_targetRect.size.width, self->_targetRect.size.height);
  id v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  cutoutPath = self->_cutoutPath;
  self->_cutoutPath = v13;

  self->_double gradientHeight = 0.0;
}

- (void)_checkForProximateAgaveDevice
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(33, 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F1860;
  v3[3] = &unk_1002439E0;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (double)targetWidthRatio
{
  return self->_targetWidthRatio;
}

- (void)setTargetWidthRatio:(double)a3
{
  self->_targetWidthRatio = a3;
}

- (UIBezierPath)cutoutPath
{
  return self->_cutoutPath;
}

- (void)setCutoutPath:(id)a3
{
}

- (double)targetAspect
{
  return self->_targetAspect;
}

- (void)setTargetAspect:(double)a3
{
  self->_targetAspect = a3;
}

- (CGRect)targetRect
{
  double x = self->_targetRect.origin.x;
  double y = self->_targetRect.origin.y;
  double width = self->_targetRect.size.width;
  double height = self->_targetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetRect:(CGRect)a3
{
  self->_targetRect = a3;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (void)setTargetCornerRadius:(double)a3
{
  self->_targetCornerRadius = a3;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (void)setGradientHeight:(double)a3
{
  self->_double gradientHeight = a3;
}

- (COSTargetOutlineView)outlineView
{
  return self->_outlineView;
}

- (void)setOutlineView:(id)a3
{
}

- (COSTargetBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (COSTargetProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (NSTimer)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
}

- (double)cachedProgress
{
  return self->_cachedProgress;
}

- (void)setCachedProgress:(double)a3
{
  self->_double cachedProgress = a3;
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
}

- (BOOL)firstReadDone
{
  return self->_firstReadDone;
}

- (void)setFirstReadDone:(BOOL)a3
{
  self->_firstReadDone = a3;
}

- (BOOL)usingAgaveReticuleMetrics
{
  return self->_usingAgaveReticuleMetrics;
}

- (void)setUsingAgaveReticuleMetrics:(BOOL)a3
{
  self->_usingAgaveReticuleMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_outlineView, 0);

  objc_storeStrong((id *)&self->_cutoutPath, 0);
}

@end