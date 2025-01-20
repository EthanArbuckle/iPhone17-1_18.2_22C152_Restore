@interface RCMPDetailSlider
+ (Class)labelClass;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)allowsDetailScrubbing;
- (BOOL)allowsScrubbing;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)detailScrubbingAvailableForCurrentDuration;
- (BOOL)isTracking;
- (CGRect)thumbHitRect;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (NSString)localizedScrubSpeedText;
- (RCMPDetailSlider)initWithFrame:(CGRect)a3;
- (RCMPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (RCMPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5;
- (RCMPDetailSliderDelegate)delegate;
- (UIEdgeInsets)_thumbHitEdgeInsets;
- (double)availableDuration;
- (double)detailScrubbingVerticalRange;
- (double)duration;
- (double)minTimeLabelWidth;
- (id)_colorSliceImageWithColor:(id)a3 height:(double)a4;
- (id)_modernThumbImageWithColor:(id)a3 height:(double)a4 includeShadow:(BOOL)a5;
- (id)_stringForCurrentTime:(double)a3;
- (id)_stringForInverseCurrentTime:(double)a3;
- (id)_stringForTime:(double)a3 elapsed:(BOOL)a4;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)createThumbView;
- (id)currentThumbImage;
- (id)timeLabelFontForStyle:(int64_t)a3;
- (id)timeLabelTextColorForStyle:(int64_t)a3;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)timeLabelStyle;
- (void)_autoscrubTick:(id)a3;
- (void)_beginTracking;
- (void)_commitValue;
- (void)_resetScrubInfo;
- (void)_setValueWhileTracking:(float)a3 duration:(double)a4;
- (void)_setupControlsForStyle;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateForAvailableDuraton;
- (void)_updateTimeDisplayForTime:(double)a3;
- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4;
- (void)_updateTrackInset;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)cancelTracking;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4;
- (void)detailScrubController:(id)a3 didChangeValue:(float)a4;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAllowsDetailScrubbing:(BOOL)a3;
- (void)setAllowsScrubbing:(BOOL)a3;
- (void)setAvailableDuration:(double)duration;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailScrubbingVerticalRange:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMinTimeLabelWidth:(double)a3;
- (void)setTimeLabelStyle:(int64_t)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)setValue:(float)a3 duration:(double)a4;
- (void)tintColorDidChange;
@end

@implementation RCMPDetailSlider

- (RCMPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5
{
  if (a3.size.height < 34.0 && a4 == 3 || a3.size.height == 0.0) {
    a3.size.height = 34.0;
  }
  v19.receiver = self;
  v19.super_class = (Class)RCMPDetailSlider;
  v9 = -[RCMPDetailSlider initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v9)
  {
    v10 = [[RCMPDetailScrubController alloc] initWithScrubbingControl:v9];
    scrubController = v9->_scrubController;
    v9->_scrubController = v10;

    [(RCMPDetailScrubController *)v9->_scrubController setDelegate:v9];
    [(RCMPDetailScrubController *)v9->_scrubController setDetailedScrubbingEnabled:1];
    v9->_allowsScrubbing = 1;
    v9->_maxTrackWidth = a5;
    v9->_style = a4;
    v9->_minTimeLabelWidth = 41.0;
    [(RCMPDetailSlider *)v9 _setupControlsForStyle];
    [(RCMPDetailSlider *)v9 setDeliversTouchesForGesturesToSuperview:0];
    [(RCMPDetailSlider *)v9 setSemanticContentAttribute:1];
    uint64_t v12 = objc_opt_new();
    formatter = v9->_formatter;
    v9->_formatter = (AVTimeFormatter *)v12;

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v9 selector:"didChangePreferredContentSize" name:UIContentSizeCategoryDidChangeNotification object:0];

    v15 = self;
    v20 = v15;
    v16 = +[NSArray arrayWithObjects:&v20 count:1];
    id v17 = [(RCMPDetailSlider *)v9 registerForTraitChanges:v16 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v9;
}

- (RCMPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return -[RCMPDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (RCMPDetailSlider)initWithFrame:(CGRect)a3
{
  return -[RCMPDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (void)dealloc
{
  [(NSTimer *)self->_autoscrubTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RCMPDetailSlider;
  [(RCMPDetailSlider *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(RCMPDetailSlider *)self bounds];
  objc_super v3 = [(RCMPDetailSlider *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  if (v5 < 0.00000011920929) {
    double v5 = UIMainScreenScale();
  }
  if (self->_timeLabelStyle == 1)
  {
    [(UILabel *)self->_currentTimeLabel removeFromSuperview];
    currentTimeLabel = self->_currentTimeLabel;
    self->_currentTimeLabel = 0;

    [(UILabel *)self->_currentTimeInverseLabel removeFromSuperview];
    currentTimeInverseLabel = self->_currentTimeInverseLabel;
    self->_currentTimeInverseLabel = 0;
  }
  else
  {
    [(RCMPDetailSlider *)self bounds];
    -[RCMPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat rect = v14;
    currentTimeInverseLabel = [(RCMPDetailSlider *)self timeLabelFontForStyle:self->_style];
    v15 = [(RCMPDetailSlider *)self timeLabelTextColorForStyle:self->_style];
    v16 = self->_currentTimeLabel;
    if (!v16)
    {
      id v17 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "labelClass")), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v18 = self->_currentTimeLabel;
      self->_currentTimeLabel = v17;

      [(UILabel *)self->_currentTimeLabel setBackgroundColor:0];
      [(UILabel *)self->_currentTimeLabel setFont:currentTimeInverseLabel];
      [(UILabel *)self->_currentTimeLabel setLineBreakMode:2];
      [(UILabel *)self->_currentTimeLabel setOpaque:0];
      objc_super v19 = [(RCMPDetailSlider *)self _stringForCurrentTime:NAN];
      v20 = RCLocalizationNotNeeded();
      [(UILabel *)self->_currentTimeLabel setText:v20];

      [(UILabel *)self->_currentTimeLabel setTextAlignment:2];
      [(UILabel *)self->_currentTimeLabel setTextColor:v15];
      [(RCMPDetailSlider *)self addSubview:self->_currentTimeLabel];
      v16 = self->_currentTimeLabel;
    }
    [(UILabel *)v16 setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_currentTimeLabel sizeToFit];
    [(UILabel *)self->_currentTimeLabel frame];
    UIRectCenteredYInRectScale();
    v37.origin.x = v9;
    v37.origin.y = v11;
    v37.size.width = v13;
    v37.size.height = rect;
    CGRectGetMinX(v37);
    v38.origin.x = v9;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = rect;
    CGRectGetMaxY(v38);
    UIRectIntegralWithScale();
    [(UILabel *)self->_currentTimeLabel setFrame:*(void *)&v5];
    v21 = self->_currentTimeInverseLabel;
    if (!v21)
    {
      v22 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "labelClass")), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v23 = self->_currentTimeInverseLabel;
      self->_currentTimeInverseLabel = v22;

      [(UILabel *)self->_currentTimeInverseLabel setBackgroundColor:0];
      [(UILabel *)self->_currentTimeInverseLabel setFont:currentTimeInverseLabel];
      [(UILabel *)self->_currentTimeInverseLabel setLineBreakMode:2];
      [(UILabel *)self->_currentTimeInverseLabel setOpaque:0];
      v24 = [(RCMPDetailSlider *)self _stringForInverseCurrentTime:NAN];
      v25 = RCLocalizationNotNeeded();
      [(UILabel *)self->_currentTimeInverseLabel setText:v25];

      [(UILabel *)self->_currentTimeInverseLabel setTextAlignment:0];
      [(UILabel *)self->_currentTimeInverseLabel setTextColor:v15];
      [(RCMPDetailSlider *)self addSubview:self->_currentTimeInverseLabel];
      v21 = self->_currentTimeInverseLabel;
    }
    [(UILabel *)v21 setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_currentTimeInverseLabel sizeToFit];
    [(UILabel *)self->_currentTimeInverseLabel frame];
    UIRectCenteredYInRectScale();
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    v39.origin.x = v9;
    v39.origin.y = v11;
    v39.size.width = v13;
    v39.size.height = rect;
    CGRectGetMaxX(v39);
    v40.origin.x = v27;
    v40.origin.y = v29;
    v40.size.width = v31;
    v40.size.height = v33;
    CGRectGetWidth(v40);
    [(UILabel *)self->_currentTimeLabel frame];
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_currentTimeInverseLabel, "setFrame:");
  }
  [(RCMPDetailSlider *)self _updateTrackInset];
  v36.receiver = self;
  v36.super_class = (Class)RCMPDetailSlider;
  [(RCMPDetailSlider *)&v36 layoutSubviews];
  if ((unint64_t)(self->_style - 3) <= 1)
  {
    v34 = [(RCMPDetailSlider *)self _maxTrackView];
    [v34 _setDrawsAsBackdropOverlayWithBlendMode:2];

    [(UILabel *)self->_currentTimeLabel _setDrawsAsBackdropOverlayWithBlendMode:2];
    [(UILabel *)self->_currentTimeInverseLabel _setDrawsAsBackdropOverlayWithBlendMode:2];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RCMPDetailSlider *)self bounds];
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v9.receiver = self;
    v9.super_class = (Class)RCMPDetailSlider;
    -[RCMPDetailSlider setBounds:](&v9, "setBounds:", x, y, width, height);
    double currentTime = self->_currentTime;
    *(float *)&double currentTime = currentTime;
    [(RCMPDetailSlider *)self setValue:currentTime];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RCMPDetailSlider *)self frame];
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v9.receiver = self;
    v9.super_class = (Class)RCMPDetailSlider;
    -[RCMPDetailSlider setFrame:](&v9, "setFrame:", x, y, width, height);
    double currentTime = self->_currentTime;
    *(float *)&double currentTime = currentTime;
    [(RCMPDetailSlider *)self setValue:currentTime];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)RCMPDetailSlider;
  [(RCMPDetailSlider *)&v3 tintColorDidChange];
  if (self->_style == 5) {
    [(RCMPDetailSlider *)self _setupControlsForStyle];
  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_currentTimeLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_currentTimeLabel;
}

- (id)createThumbView
{
  v7.receiver = self;
  v7.super_class = (Class)RCMPDetailSlider;
  objc_super v3 = [(RCMPDetailSlider *)&v7 createThumbView];
  thumbImageView = self->_thumbImageView;
  self->_thumbImageView = v3;

  double v5 = self->_thumbImageView;

  return v5;
}

- (id)currentThumbImage
{
  if ((unint64_t)(self->_style - 1) >= 5)
  {
    if (self->_isTracking
      && [(RCMPDetailScrubController *)self->_scrubController detailedScrubbingEnabled]
      && [(RCMPDetailScrubController *)self->_scrubController durationAllowsForDetailedScrubbing])
    {
      glowDetailScrubImageView = self->_glowDetailScrubImageView;
      if (!glowDetailScrubImageView)
      {
        id v6 = objc_alloc((Class)UIImageView);
        objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
        double v8 = +[UIImage imageNamed:@"scrubberglow" inBundle:v7];
        objc_super v9 = (UIImageView *)[v6 initWithImage:v8];
        CGRect v10 = self->_glowDetailScrubImageView;
        self->_glowDetailScrubImageView = v9;

        CGRect v11 = self->_glowDetailScrubImageView;
        [(UIImageView *)v11 bounds];
        [(UIImageView *)self->_thumbImageView bounds];
        UIRectCenteredIntegralRect();
        CGRect v17 = CGRectOffset(v16, 0.0, -1.0);
        -[UIImageView setFrame:](v11, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
        glowDetailScrubImageView = self->_glowDetailScrubImageView;
      }
      [(UIImageView *)self->_thumbImageView addSubview:glowDetailScrubImageView];
    }
    else
    {
      double v4 = self->_glowDetailScrubImageView;
      if (v4)
      {
        double v5 = [(UIImageView *)v4 layer];
        [v5 removeAllAnimations];

        [(UIImageView *)self->_glowDetailScrubImageView removeFromSuperview];
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)RCMPDetailSlider;
  double v12 = [(RCMPDetailSlider *)&v14 currentThumbImage];

  return v12;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RCMPDetailSlider *)self _updateTrackInset];
  v14.receiver = self;
  v14.super_class = (Class)RCMPDetailSlider;
  -[RCMPDetailSlider trackRectForBounds:](&v14, "trackRectForBounds:", x, y, width, height);
  CGFloat v8 = v15.origin.x;
  CGFloat v9 = v15.origin.y;
  CGFloat v10 = v15.size.width;
  CGFloat v11 = v15.size.height;
  CGFloat v12 = CGRectGetWidth(v15);
  double trackInset = self->_trackInset;
  if (v12 <= trackInset + trackInset)
  {
    result.origin.double x = CGRectZero.origin.x;
    result.origin.double y = CGRectZero.origin.y;
    result.size.double width = CGRectZero.size.width;
    result.size.double height = CGRectZero.size.height;
  }
  else
  {
    v16.origin.double x = v8;
    v16.origin.double y = v9;
    v16.size.double width = v10;
    v16.size.double height = v11;
    return CGRectInset(v16, trackInset, 0.0);
  }
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v27.receiver = self;
  v27.super_class = (Class)RCMPDetailSlider;
  -[RCMPDetailSlider thumbRectForBounds:trackRect:value:](&v27, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  if ((unint64_t)(self->_style - 3) > 1)
  {
    double v21 = 1.0;
    if (a5 < 0.5) {
      double v21 = -1.0;
    }
    CGRect v28 = CGRectOffset(*(CGRect *)&v6, v21, 0.0);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
  }
  else
  {
    double v10 = 0.0;
    if (a5 < 0.5) {
      double v10 = -1.0;
    }
    CGRectOffset(*(CGRect *)&v6, v10, 0.5);
    CGFloat v11 = [(RCMPDetailSlider *)self traitCollection];
    [v11 displayScale];
    if (v12 == 0.0) {
      UIMainScreenScale();
    }
    UIRectIntegralWithScale();
    CGFloat x = v13;
    CGFloat y = v15;
    CGFloat width = v17;
    CGFloat height = v19;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
}

- (void)setValue:(float)a3 duration:(double)a4
{
  if (!self->_isTracking) {
    -[RCMPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:");
  }
}

- (void)_setValueWhileTracking:(float)a3 duration:(double)a4
{
  double duration = self->_duration;
  if (duration > 0.0)
  {
    double v7 = fmax(a3, 0.0);
    if (duration < v7) {
      double v7 = self->_duration;
    }
    float v8 = v7;
    double v9 = v8;
    float v10 = v8 / duration;
    [(RCMPDetailSlider *)self bounds];
    if (vabdd_f64(1.0, v10) < 1.0 / v11) {
      float v10 = 1.0;
    }
    double v12 = [(RCMPDetailSlider *)self layer];
    double v13 = [v12 animationKeys];
    id v14 = [v13 count];

    CGRect v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_1000BC7F4;
    double v19 = &unk_100223288;
    if (v14) {
      uint64_t v15 = 196640;
    }
    else {
      uint64_t v15 = 196644;
    }
    float v21 = v10;
    v20 = self;
    +[UIView animateWithDuration:v15 delay:&v16 options:0 animations:a4 completion:0.0];
    [(RCMPDetailSlider *)self _updateForAvailableDuraton];
    [(RCMPDetailSlider *)self _updateTimeDisplayForTime:v9];
    if (self->_isTracking && self->_canCommit) {
      [(RCMPDetailSlider *)self _commitValue];
    }
  }
}

- (UIEdgeInsets)_thumbHitEdgeInsets
{
  double v2 = -19.0;
  double v3 = -19.0;
  double v4 = -19.0;
  double v5 = -19.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_beginTracking
{
  if (!self->_isTracking)
  {
    self->_isTracking = 1;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      [v6 detailSliderTrackingDidBegin:self];
    }
  }
}

- (CGRect)thumbHitRect
{
  [(RCMPDetailSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(RCMPDetailSlider *)self bounds];
  -[RCMPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(RCMPDetailSlider *)self value];
  LODWORD(v24) = v19;
  -[RCMPDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v24);

  return CGRectInset(*(CGRect *)&v20, -19.0, -19.0);
}

- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 detailSlider:self didChangeScrubSpeed:a4];
  }
}

- (void)detailScrubController:(id)a3 didChangeValue:(float)a4
{
  -[RCMPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:", a3);

  [(RCMPDetailSlider *)self _commitValue];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5 = [(RCMPDetailScrubController *)self->_scrubController beginTrackingWithTouch:a3 withEvent:a4];
  [(RCMPDetailSlider *)self _beginTracking];
  return v5;
}

- (void)_autoscrubTick:(id)a3
{
  [(RCMPDetailSlider *)self maximumValue];
  float v5 = v4;
  [(RCMPDetailSlider *)self minimumValue];
  double v7 = (float)(v5 - v6);
  [(RCMPDetailSlider *)self bounds];
  -[RCMPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v8 = v7 / CGRectGetWidth(v26);
  [(RCMPDetailScrubController *)self->_scrubController scaleForVerticalPosition:self->_previousLocationInView.y];
  double v10 = v9;
  double v11 = v8 * v9;
  double v12 = [(RCMPDetailSlider *)self window];
  -[RCMPDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v12, self->_previousLocationInView.x, self->_previousLocationInView.y);
  double v14 = v13;
  double v15 = [(RCMPDetailSlider *)self window];
  [v15 bounds];
  if (v14 >= CGRectGetMidX(v27)) {
    double v16 = v11;
  }
  else {
    double v16 = -(v8 * v10);
  }
  float v17 = v16;

  self->_canCommit = 1;
  [(RCMPDetailSlider *)self minimumValue];
  float v19 = v18;
  [(RCMPDetailSlider *)self maximumValue];
  float v21 = v20;
  [(RCMPDetailSlider *)self value];
  float v23 = v22 + v17;
  if (v21 < v23) {
    float v23 = v21;
  }
  if (v19 >= v23) {
    float v23 = v19;
  }
  double v24 = self->_duration * v23;
  *(float *)&double v24 = v24;
  [(RCMPDetailSlider *)self setValue:0 animated:v24];
  if ([(RCMPDetailSlider *)self isContinuous])
  {
    [(RCMPDetailSlider *)self sendActionsForControlEvents:4096];
  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  if ([(RCMPDetailScrubController *)self->_scrubController detailedScrubbingEnabled]
    && [(RCMPDetailScrubController *)self->_scrubController durationAllowsForDetailedScrubbing])
  {
    double v12 = [(RCMPDetailSlider *)self window];
    -[RCMPDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v12, v9, v11);
    double v14 = v13;
    double v16 = v15;
    BOOL autoscrubActive = self->_autoscrubActive;
    float v17 = +[UIApplication sharedApplication];
    float v18 = [v17 delegate];
    float v19 = [v18 window];
    float v20 = [v19 windowScene];
    float v21 = (char *)[v20 interfaceOrientation] - 3;

    if ((unint64_t)v21 < 2) {
      double v14 = v16;
    }
    [v12 bounds];
    if ((unint64_t)v21 > 1)
    {
      double Width = CGRectGetWidth(*(CGRect *)&v22);
      if (v12)
      {
LABEL_7:
        BOOL v27 = v14 < 20.0;
        double Width = Width + -20.0;
        if (v14 > Width) {
          BOOL v27 = 1;
        }
        self->_BOOL autoscrubActive = v27;
        if (v27)
        {
          thumbImageView = self->_thumbImageView;
          CGFloat v29 = [(RCMPDetailSlider *)self currentThumbImage];
          [(UIImageView *)thumbImageView setImage:v29];

          if (!autoscrubActive)
          {
            double v30 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
            CGFloat v31 = +[NSNumber numberWithFloat:0.0];
            [v30 setToValue:v31];

            [v30 setDuration:0.25];
            LODWORD(v32) = 2139095039;
            [v30 setRepeatCount:v32];
            [v30 setAutoreverses:1];
            CGFloat v33 = [(UIImageView *)self->_glowDetailScrubImageView layer];
            [v33 addAnimation:v30 forKey:@"pulseAnimation"];
          }
          [(RCMPDetailSlider *)self value];
          double v35 = self->_duration * v34;
          *(float *)&double v35 = v35;
          [(RCMPDetailSlider *)self _setValueWhileTracking:v35 duration:0.0];
          if ([(RCMPDetailSlider *)self isContinuous]) {
            [(RCMPDetailSlider *)self sendActionsForControlEvents:4096];
          }
          if (!self->_autoscrubTimer)
          {
            objc_super v36 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_autoscrubTick:" selector:0 userInfo:1 repeats:0.1];
            autoscrubTimer = self->_autoscrubTimer;
            self->_autoscrubTimer = v36;
          }
          self->_previousLocationInView.CGFloat x = v9;
          self->_previousLocationInView.CGFloat y = v11;

          BOOL v38 = 1;
          goto LABEL_28;
        }
        goto LABEL_19;
      }
    }
    else
    {
      double Width = CGRectGetHeight(*(CGRect *)&v22);
      if (v12) {
        goto LABEL_7;
      }
    }
    self->_BOOL autoscrubActive = 0;
LABEL_19:
    if (self->_autoscrubTimer)
    {
      CGRect v39 = [(UIImageView *)self->_glowDetailScrubImageView layer];
      [v39 removeAnimationForKey:@"pulseAnimation"];

      [(NSTimer *)self->_autoscrubTimer invalidate];
      CGRect v40 = self->_autoscrubTimer;
      self->_autoscrubTimer = 0;
    }
  }
  if ([(RCMPDetailSlider *)self isContinuous]) {
    [(RCMPDetailSlider *)self sendActionsForControlEvents:4096];
  }
  BOOL v38 = [(RCMPDetailScrubController *)self->_scrubController continueTrackingWithTouch:v6 withEvent:v7];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(RCMPDetailSlider *)self value];
    int v42 = LODWORD(v41);
    if (vabds_f32(v41, *(float *)&dword_10026A880) > 0.02
      || CFAbsoluteTimeGetCurrent() - *(double *)&qword_10026A888 > 5.0)
    {
      UIAccessibilityNotifications v43 = UIAccessibilityAnnouncementNotification;
      v44 = [(RCMPDetailSlider *)self accessibilityValue];
      UIAccessibilityPostNotification(v43, v44);

      dword_10026A880 = v42;
      qword_10026A888 = CFAbsoluteTimeGetCurrent();
    }
  }
LABEL_28:

  return v38;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  autoscrubTimer = self->_autoscrubTimer;
  id v7 = a4;
  id v8 = a3;
  [(NSTimer *)autoscrubTimer invalidate];
  double v9 = self->_autoscrubTimer;
  self->_autoscrubTimer = 0;

  self->_BOOL autoscrubActive = 0;
  self->_isTracking = 0;
  [(RCMPDetailSlider *)self _resetScrubInfo];
  [(RCMPDetailScrubController *)self->_scrubController endTrackingWithTouch:v8 withEvent:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 detailSliderTrackingDidEnd:self];
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  [(RCMPDetailScrubController *)self->_scrubController cancelTrackingWithEvent:a3];

  [(RCMPDetailSlider *)self cancelTracking];
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

+ (Class)labelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)allowsDetailScrubbing
{
  return [(RCMPDetailScrubController *)self->_scrubController detailedScrubbingEnabled];
}

- (BOOL)detailScrubbingAvailableForCurrentDuration
{
  return [(RCMPDetailScrubController *)self->_scrubController durationAllowsForDetailedScrubbing];
}

- (void)cancelTracking
{
  [(NSTimer *)self->_autoscrubTimer invalidate];
  autoscrubTimer = self->_autoscrubTimer;
  self->_autoscrubTimer = 0;

  self->_BOOL autoscrubActive = 0;
  BOOL isTracking = self->_isTracking;
  self->_BOOL isTracking = 0;
  [(RCMPDetailSlider *)self _resetScrubInfo];
  if (isTracking)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 detailSliderTrackingDidCancel:self];
    }
  }
}

- (void)setAllowsScrubbing:(BOOL)a3
{
  if (self->_allowsScrubbing != a3)
  {
    self->_allowsScrubbing = a3;
    if (self->_style == 5)
    {
      [(RCMPDetailSlider *)self _setupControlsForStyle];
      *(void *)&a3 = self->_allowsScrubbing;
    }
    [(RCMPDetailSlider *)self setUserInteractionEnabled:a3];
  }
}

- (void)setAllowsDetailScrubbing:(BOOL)a3
{
}

- (void)setAvailableDuration:(double)duration
{
  if (self->_duration <= duration) {
    double duration = self->_duration;
  }
  if (vabdd_f64(duration, self->_availableDuration) > 2.22044605e-16)
  {
    self->_availableDuration = duration;
    [(RCMPDetailSlider *)self _updateForAvailableDuraton];
  }
}

- (void)setDuration:(double)a3
{
  if (vabdd_f64(self->_duration, a3) > 2.22044605e-16)
  {
    self->_double duration = a3;
    -[RCMPDetailScrubController setDuration:](self->_scrubController, "setDuration:");
    double currentTime = self->_currentTime;
    if (currentTime >= self->_duration) {
      double currentTime = self->_duration;
    }
    self->_double currentTime = fmax(currentTime, 0.0);
    [(RCMPDetailSlider *)self frame];
    if (!CGRectIsEmpty(v8)) {
      [(RCMPDetailSlider *)self layoutSubviews];
    }
    double v5 = self->_currentTime;
    *(float *)&double v5 = v5;
    [(RCMPDetailSlider *)self setValue:0 animated:v5];
    [(RCMPDetailSlider *)self setAvailableDuration:self->_duration];
    double v6 = self->_currentTime;
    [(RCMPDetailSlider *)self _updateTimeDisplayForTime:1 force:v6];
  }
}

- (void)setMinTimeLabelWidth:(double)a3
{
  if (self->_minTimeLabelWidth != a3)
  {
    self->_minTimeLabeldouble Width = a3;
    [(RCMPDetailSlider *)self setNeedsLayout];
  }
}

- (void)setTimeLabelStyle:(int64_t)a3
{
  if (self->_timeLabelStyle != a3)
  {
    self->_timeLabelStyle = a3;
    [(RCMPDetailSlider *)self _setupControlsForStyle];
    [(RCMPDetailSlider *)self setNeedsLayout];
  }
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  int64_t style = self->_style;
  if ((unint64_t)(style - 1) < 2)
  {
    double v5 = 12.0;
    goto LABEL_7;
  }
  if ((unint64_t)(style - 3) >= 2)
  {
    if (style != 5)
    {
      double v4 = 14.0;
      goto LABEL_9;
    }
    double v5 = 10.0;
LABEL_7:
    double v6 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", a3, v5);
    goto LABEL_10;
  }
  double v4 = 13.0;
LABEL_9:
  double v6 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", a3, v4);
LABEL_10:
  id v7 = v6;
  CGRect v8 = [v6 fontDescriptor];
  UIFontDescriptorAttributeName v18 = UIFontDescriptorFeatureSettingsAttribute;
  v15[0] = UIFontFeatureTypeIdentifierKey;
  v15[1] = UIFontFeatureSelectorIdentifierKey;
  v16[0] = &off_10022D7C0;
  v16[1] = &off_10022D7D8;
  double v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  float v17 = v9;
  double v10 = +[NSArray arrayWithObjects:&v17 count:1];
  float v19 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  double v12 = [v8 fontDescriptorByAddingAttributes:v11];

  double v13 = +[UIFont fontWithDescriptor:v12 size:0.0];

  return v13;
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  if ((unint64_t)(self->_style - 3) > 1) {
    +[UIColor blackColor];
  }
  else {
  double v3 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 1.0, 0.45);
  }

  return v3;
}

- (id)_modernThumbImageWithColor:(id)a3 height:(double)a4 includeShadow:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = [(RCMPDetailSlider *)self traitCollection];
  [v9 displayScale];
  double v11 = v10;
  if (v10 == 0.0) {
    double v11 = UIMainScreenScale();
  }
  v19.CGFloat width = a4;
  v19.CGFloat height = a4;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v11);

  if (v5)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    id v13 = +[UIColor colorWithWhite:0.0 alpha:0.1];
    double v14 = (CGColor *)[v13 CGColor];
    v20.CGFloat width = CGSizeZero.width;
    v20.CGFloat height = CGSizeZero.height;
    CGContextSetShadowWithColor(CurrentContext, v20, 2.0, v14);
  }
  [v8 setFill];
  double v15 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a4, a4, a4 * 0.5);
  [v15 fill];

  double v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

- (id)_colorSliceImageWithColor:(id)a3 height:(double)a4
{
  CGFloat v5 = a4 * 3.0;
  id v6 = a3;
  v12.CGFloat width = v5;
  v12.CGFloat height = a4;
  UIGraphicsBeginImageContext(v12);
  id v7 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v5, a4, a4 * 0.5);
  [v6 setFill];

  [v7 fill];
  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  double v9 = [v8 stretchableImageWithLeftCapWidth:(uint64_t)a4 topCapHeight:(uint64_t)(a4 * 0.5)];

  return v9;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(RCMPDetailSlider *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];
  id v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    [(RCMPDetailSlider *)self _setupControlsForStyle];
  }
}

- (void)_setupControlsForStyle
{
  if (self->_timeLabelStyle == 3)
  {
    v15.CGFloat width = 1.0;
    v15.CGFloat height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
    double v3 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(RCMPDetailSlider *)self setThumbImage:v3 forState:0];

    char v4 = 1;
  }
  else
  {
    if (self->_style == 5) {
      [(RCMPDetailSlider *)self duration];
    }
    char v4 = 0;
  }
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (self->_style == 5)
  {
    id v13 = v5;
    if ((v4 & 1) == 0)
    {
      BOOL v6 = [(RCMPDetailSlider *)self allowsScrubbing];
      if (v6) {
        [v13 sliderThumbTintColor];
      }
      else {
      id v7 = +[UIColor blackColor];
      }
      id v8 = [(RCMPDetailSlider *)self _modernThumbImageWithColor:v7 height:v6 includeShadow:7.0];
      [(RCMPDetailSlider *)self setThumbImage:v8 forState:0];
    }
    double v9 = [v13 minTrackTintColor];
    double v10 = [(RCMPDetailSlider *)self _colorSliceImageWithColor:v9 height:3.0];

    double v11 = [v13 maxTrackTintColor];
    CGSize v12 = [(RCMPDetailSlider *)self _colorSliceImageWithColor:v11 height:3.0];

    [(RCMPDetailSlider *)self setMinimumTrackImage:v10 forState:0];
    [(RCMPDetailSlider *)self setMaximumTrackImage:v12 forState:0];

    id v5 = v13;
  }
}

- (void)_updateTrackInset
{
  double v2 = 4.0;
  if (self->_style == 5) {
    double v2 = 0.0;
  }
  self->_double trackInset = v2;
}

- (void)_updateTimeDisplayForTime:(double)a3
{
}

- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4
{
  double v5 = floor(a3);
  if (a4 || vabdd_f64(self->_currentTime, v5) > 2.22044605e-16)
  {
    if (self->_timeLabelStyle != 1)
    {
      currentTimeLabel = self->_currentTimeLabel;
      id v7 = [(RCMPDetailSlider *)self _stringForCurrentTime:v5];
      id v8 = RCLocalizationNotNeeded();
      [(UILabel *)currentTimeLabel setText:v8];

      currentTimeInverseLabel = self->_currentTimeInverseLabel;
      double v10 = [(RCMPDetailSlider *)self _stringForInverseCurrentTime:self->_duration - v5];
      double v11 = RCLocalizationNotNeeded();
      [(UILabel *)currentTimeInverseLabel setText:v11];

      [(RCMPDetailSlider *)self setNeedsLayout];
    }
    self->_double currentTime = v5;
  }
}

- (id)_stringForTime:(double)a3 elapsed:(BOOL)a4
{
  formatter = self->_formatter;
  if (a4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [(AVTimeFormatter *)formatter setStyle:v7];
  id v8 = self->_formatter;

  return [(AVTimeFormatter *)v8 stringFromSeconds:a3];
}

- (id)_stringForCurrentTime:(double)a3
{
  int64_t timeLabelStyle = self->_timeLabelStyle;
  if (timeLabelStyle == 3 || timeLabelStyle == 2 && vabdd_f64(self->_duration, a3) < 30.0)
  {
    char v4 = @"--:--";
  }
  else
  {
    char v4 = [(RCMPDetailSlider *)self _stringForTime:1 elapsed:a3];
  }

  return v4;
}

- (id)_stringForInverseCurrentTime:(double)a3
{
  int64_t timeLabelStyle = self->_timeLabelStyle;
  if (timeLabelStyle == 3 || ((double v4 = fabs(a3), timeLabelStyle == 2) ? (v5 = v4 < 30.0) : (v5 = 0), v5))
  {
    BOOL v6 = @"Live";
  }
  else
  {
    -[RCMPDetailSlider _stringForTime:elapsed:](self, "_stringForTime:elapsed:", 0, a3, v4);
    BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_resetScrubInfo
{
  thumbImageView = self->_thumbImageView;
  double v4 = [(RCMPDetailSlider *)self currentThumbImage];
  [(UIImageView *)thumbImageView setImage:v4];

  id v5 = [(UIImageView *)self->_glowDetailScrubImageView layer];
  [v5 removeAnimationForKey:@"pulseAnimation"];
}

- (void)_commitValue
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [(RCMPDetailSlider *)self value];
    double v7 = self->_duration * v6;
    *(float *)&double v7 = v7;
    [v8 detailSlider:self didChangeValue:v7];
  }
}

- (void)_updateForAvailableDuraton
{
  if (!self->_thumbImageView)
  {
    [(RCMPDetailSlider *)self setNeedsLayout];
    [(RCMPDetailSlider *)self layoutIfNeeded];
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 0;
}

- (id)accessibilityValue
{
  double v3 = +[NSDateComponentsFormatter hoursMinutesSecondsStringWithInterval:1 forAccessibility:self->_currentTime];
  double v4 = +[NSDateComponentsFormatter hoursMinutesSecondsStringWithInterval:1 forAccessibility:self->_availableDuration];
  char v5 = +[NSBundle mainBundle];
  float v6 = [v5 localizedStringForKey:@"AX_DURATION_PROGRESS" value:&stru_100228BC8 table:0];

  double v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:v6 value:&stru_100228BC8 table:0];
  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v3, v4);

  return v9;
}

- (void)accessibilityIncrement
{
  [(RCMPDetailSlider *)self value];
  float v4 = v3 + 0.1;
  double v5 = self->_duration * v4;
  *(float *)&double v5 = v5;
  [(RCMPDetailSlider *)self setValue:0 animated:v5];

  [(RCMPDetailSlider *)self _commitValue];
}

- (void)accessibilityDecrement
{
  [(RCMPDetailSlider *)self value];
  float v4 = v3 + -0.1;
  double v5 = self->_duration * v4;
  *(float *)&double v5 = v5;
  [(RCMPDetailSlider *)self setValue:0 animated:v5];

  [(RCMPDetailSlider *)self _commitValue];
}

- (id)accessibilityLabel
{
  double v2 = +[NSBundle mainBundle];
  float v3 = [v2 localizedStringForKey:@"TRACK_SLIDER" value:&stru_100228BC8 table:0];

  return v3;
}

- (RCMPDetailSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCMPDetailSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsScrubbing
{
  return self->_allowsScrubbing;
}

- (double)detailScrubbingVerticalRange
{
  return self->_detailScrubbingVerticalRange;
}

- (void)setDetailScrubbingVerticalRange:(double)a3
{
  self->_detailScrubbingVerticalRange = a3;
}

- (double)duration
{
  return self->_duration;
}

- (double)availableDuration
{
  return self->_availableDuration;
}

- (int64_t)timeLabelStyle
{
  return self->_timeLabelStyle;
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (NSString)localizedScrubSpeedText
{
  return self->_localizedScrubSpeedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedScrubSpeedText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);
  objc_storeStrong((id *)&self->_glowDetailScrubImageView, 0);
  objc_storeStrong((id *)&self->_downloadingTrackOverlay, 0);
  objc_storeStrong((id *)&self->_autoscrubTimer, 0);
  objc_storeStrong((id *)&self->_scrubController, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);

  objc_storeStrong((id *)&self->_currentTimeInverseLabel, 0);
}

@end