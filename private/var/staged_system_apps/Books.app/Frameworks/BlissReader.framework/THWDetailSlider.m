@interface THWDetailSlider
+ (Class)labelClass;
+ (double)defaultHeight;
- (BOOL)allowsDetailScrubbing;
- (BOOL)allowsScrubbing;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)detailScrubbingAvailableForCurrentDuration;
- (BOOL)hideLeftNumericDisplay;
- (BOOL)hideRightNumericDisplay;
- (BOOL)isTracking;
- (CGRect)_thumbHitFrame;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGSize)timeLabelShadowOffsetForStyle:(int64_t)a3;
- (THWDetailSlider)initWithFrame:(CGRect)a3;
- (THWDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (THWDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5;
- (THWDetailSliderDelegate)delegate;
- (UIEdgeInsets)timeLabelInsets;
- (UIImageView)thumbImageView;
- (double)availableDuration;
- (double)detailScrubbingVerticalRange;
- (double)duration;
- (double)minTimeLabelWidth;
- (double)timeLabelVerticalOffsetForStyle:(int64_t)a3;
- (float)_scaleForIdealValueForVerticalPosition:(double)a3;
- (float)_scaleForVerticalPosition:(double)a3;
- (id)_stringForCurrentTime:(double)a3;
- (id)_stringForInverseCurrentTime:(double)a3;
- (id)_stringForTime:(double)a3;
- (id)currentThumbImage;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)timeLabelFontForStyle:(int64_t)a3;
- (id)timeLabelShadowColorForStyle:(int64_t)a3;
- (id)timeLabelTextColorForStyle:(int64_t)a3;
- (int64_t)timeLabelStyle;
- (void)_adjustMinScale;
- (void)_autoscrubTick:(id)a3;
- (void)_commitValue;
- (void)_resetScrubInfo;
- (void)_setValueWhileTracking:(float)a3;
- (void)_setupControlsForStyle;
- (void)_updateForAvailableDuration;
- (void)_updateTimeDisplayForTime:(double)a3;
- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4;
- (void)_updateTrackInset;
- (void)cancelTracking;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAllowsDetailScrubbing:(BOOL)a3;
- (void)setAllowsScrubbing:(BOOL)a3;
- (void)setAvailableDuration:(double)duration;
- (void)setDelegate:(id)a3;
- (void)setDetailScrubbingVerticalRange:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHideLeftNumericDisplay:(BOOL)a3;
- (void)setHideRightNumericDisplay:(BOOL)a3;
- (void)setMinTimeLabelWidth:(double)a3;
- (void)setTimeLabelInsets:(UIEdgeInsets)a3;
- (void)setTimeLabelStyle:(int64_t)a3;
- (void)setValue:(float)a3;
@end

@implementation THWDetailSlider

- (THWDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)THWDetailSlider;
  v7 = -[THWDetailSlider initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_allowsScrubbing = 1;
    v7->_allowsDetailScrubbing = 1;
    v7->_detailScrubbingVerticalRange = 220.0;
    v7->_minTimeLabelWidth = 20.0;
    v7->_maxTrackWidth = a5;
    v7->_style = a4;
    [(THWDetailSlider *)v7 _setupControlsForStyle];
  }
  return v8;
}

- (THWDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return -[THWDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (THWDetailSlider)initWithFrame:(CGRect)a3
{
  return -[THWDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (void)dealloc
{
  [(NSTimer *)self->_autoscrubTimer invalidate];

  v3.receiver = self;
  v3.super_class = (Class)THWDetailSlider;
  [(THWDetailSlider *)&v3 dealloc];
}

- (void)setHideLeftNumericDisplay:(BOOL)a3
{
  if (self->_hideLeftNumericDisplay != a3)
  {
    self->_hideLeftNumericDisplay = a3;
    if (a3)
    {
      [(UILabel *)self->_currentTimeLabel removeFromSuperview];

      self->_currentTimeLabel = 0;
    }
    [(THWDetailSlider *)self setNeedsLayout];
  }
}

- (void)setHideRightNumericDisplay:(BOOL)a3
{
  if (self->_hideRightNumericDisplay != a3)
  {
    self->_hideRightNumericDisplay = a3;
    if (a3)
    {
      [(UILabel *)self->_currentTimeInverseLabel removeFromSuperview];

      self->_currentTimeInverseLabel = 0;
    }
    [(THWDetailSlider *)self setNeedsLayout];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [(THWDetailSlider *)self _thumbHitFrame];
  v10.double x = x;
  v10.double y = y;
  if (!CGRectContainsPoint(v11, v10)) {
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)THWDetailSlider;
  return -[THWDetailSlider hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, x, y);
}

- (void)layoutSubviews
{
  [(THWDetailSlider *)self timeLabelVerticalOffsetForStyle:self->_style];
  double v4 = v3;
  id v5 = [(THWDetailSlider *)self timeLabelFontForStyle:self->_style];
  id v6 = [(THWDetailSlider *)self timeLabelTextColorForStyle:self->_style];
  [(THWDetailSlider *)self timeLabelShadowOffsetForStyle:self->_style];
  double v8 = v7;
  double v10 = v9;
  id v11 = [(THWDetailSlider *)self timeLabelShadowColorForStyle:self->_style];
  if (![(THWDetailSlider *)self hideLeftNumericDisplay])
  {
    currentTimeLabel = self->_currentTimeLabel;
    if (!currentTimeLabel)
    {
      v13 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "labelClass")), "initWithFrame:", 0.0, 0.0, self->_minTimeLabelWidth, 25.0);
      self->_currentTimeLabel = v13;
      [(UILabel *)v13 setTextColor:v6];
      [(UILabel *)self->_currentTimeLabel setFont:v5];
      -[UILabel setShadowOffset:](self->_currentTimeLabel, "setShadowOffset:", v8, v10);
      [(UILabel *)self->_currentTimeLabel setShadowColor:v11];
      [(UILabel *)self->_currentTimeLabel setOpaque:0];
      [(UILabel *)self->_currentTimeLabel setBackgroundColor:0];
      [(UILabel *)self->_currentTimeLabel setLineBreakMode:2];
      [(UILabel *)self->_currentTimeLabel setText:[(THWDetailSlider *)self _stringForCurrentTime:self->_currentTime]];
      [(UILabel *)self->_currentTimeLabel setTextAlignment:2];
      [(THWDetailSlider *)self addSubview:self->_currentTimeLabel];
      currentTimeLabel = self->_currentTimeLabel;
    }
    [(UILabel *)currentTimeLabel frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(THWDetailSlider *)self bounds];
    float v21 = v4 + (v20 - v19) * 0.5;
    -[UILabel setFrame:](self->_currentTimeLabel, "setFrame:", v15, floorf(v21), v17, v19);
  }
  if (![(THWDetailSlider *)self hideRightNumericDisplay])
  {
    currentTimeInverseLabel = self->_currentTimeInverseLabel;
    if (!currentTimeInverseLabel)
    {
      v23 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "labelClass")), "initWithFrame:", 0.0, 0.0, self->_minTimeLabelWidth, 25.0);
      self->_currentTimeInverseLabel = v23;
      [(UILabel *)v23 setTextColor:v6];
      [(UILabel *)self->_currentTimeInverseLabel setFont:v5];
      -[UILabel setShadowOffset:](self->_currentTimeInverseLabel, "setShadowOffset:", v8, v10);
      [(UILabel *)self->_currentTimeInverseLabel setShadowColor:v11];
      [(UILabel *)self->_currentTimeInverseLabel setOpaque:0];
      [(UILabel *)self->_currentTimeInverseLabel setBackgroundColor:0];
      [(UILabel *)self->_currentTimeInverseLabel setLineBreakMode:2];
      [(UILabel *)self->_currentTimeInverseLabel setText:[(THWDetailSlider *)self _stringForInverseCurrentTime:self->_currentTime]];
      [(UILabel *)self->_currentTimeInverseLabel setTextAlignment:0];
      [(THWDetailSlider *)self addSubview:self->_currentTimeInverseLabel];
      currentTimeInverseLabel = self->_currentTimeInverseLabel;
    }
    [(UILabel *)currentTimeInverseLabel frame];
    double v25 = v24;
    double v27 = v26;
    [(THWDetailSlider *)self bounds];
    float v29 = v4 + (v28 - v27) * 0.5;
    double v30 = floorf(v29);
    [(THWDetailSlider *)self bounds];
    -[UILabel setFrame:](self->_currentTimeInverseLabel, "setFrame:", CGRectGetWidth(v32) - self->_trackInsetRight - self->_timeLabelInsets.left, self->_timeLabelInsets.top + v30, v25 - (-self->_timeLabelInsets.right - self->_timeLabelInsets.left), v27 - (self->_timeLabelInsets.top + self->_timeLabelInsets.bottom));
  }
  [(THWDetailSlider *)self _adjustMinScale];
  [(THWDetailSlider *)self _updateTrackInset];
  v31.receiver = self;
  v31.super_class = (Class)THWDetailSlider;
  [(THWDetailSlider *)&v31 layoutSubviews];
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWDetailSlider;
  -[THWDetailSlider setFrame:](&v5, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double currentTime = self->_currentTime;
  *(float *)&double currentTime = currentTime;
  [(THWDetailSlider *)self setValue:currentTime];
}

- (UIImageView)thumbImageView
{
  objc_opt_class();
  [(THWDetailSlider *)self _thumbView];
  result = (UIImageView *)TSUDynamicCast();
  if (!result)
  {
    objc_opt_class();
    [(THWDetailSlider *)self _thumbViewNeue];
    return (UIImageView *)TSUDynamicCast();
  }
  return result;
}

- (id)currentThumbImage
{
  if ((unint64_t)(self->_style - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if (self->_isTracking && self->_allowsDetailScrubbing && self->_durationAllowsDetailScrubbing)
    {
      if (!self->_glowDetailScrubImageView)
      {
        double v3 = [(UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:[UIImage th_imageNamed:@"scrubberglow"]];
        self->_glowDetailScrubImageView = v3;
        [(UIImageView *)v3 bounds];
        [(UIImageView *)[(THWDetailSlider *)self thumbImageView] bounds];
        UIRectCenteredIntegralRect();
        CGRect v8 = CGRectOffset(v7, 0.0, -1.0);
        -[UIImageView setFrame:](v3, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
      }
      [(UIImageView *)[(THWDetailSlider *)self thumbImageView] addSubview:self->_glowDetailScrubImageView];
    }
    else
    {
      glowDetailScrubImageView = self->_glowDetailScrubImageView;
      if (glowDetailScrubImageView)
      {
        [glowDetailScrubImageView layer removeAllAnimations];
        [(UIImageView *)self->_glowDetailScrubImageView removeFromSuperview];
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)THWDetailSlider;
  return [(THWDetailSlider *)&v6 currentThumbImage];
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(THWDetailSlider *)self _updateTrackInset];
  v15.receiver = self;
  v15.super_class = (Class)THWDetailSlider;
  -[THWDetailSlider trackRectForBounds:](&v15, "trackRectForBounds:", x, y, width, height);
  double v8 = v16.origin.x;
  CGFloat v9 = v16.origin.y;
  double v10 = v16.size.width;
  CGFloat v11 = v16.size.height;
  CGFloat v12 = CGRectGetWidth(v16);
  double trackInsetLeft = self->_trackInsetLeft;
  double v14 = trackInsetLeft + self->_trackInsetRight;
  if (v12 <= v14)
  {
    result.origin.double x = CGRectZero.origin.x;
    result.origin.double y = CGRectZero.origin.y;
    result.size.double width = CGRectZero.size.width;
    result.size.double height = CGRectZero.size.height;
  }
  else
  {
    v17.origin.double x = v8 + trackInsetLeft;
    v17.size.double width = v10 - v14;
    v17.origin.double y = v9;
    v17.size.double height = v11;
    return CGRectOffset(v17, 0.0, -2.0);
  }
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t style = self->_style;
  if (style == 4)
  {
    v18.receiver = self;
    v18.super_class = (Class)THWDetailSlider;
    -[THWDetailSlider thumbRectForBounds:trackRect:value:](&v18, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
    goto LABEL_6;
  }
  if (style == 3)
  {
    v17.receiver = self;
    v17.super_class = (Class)THWDetailSlider;
    -[THWDetailSlider thumbRectForBounds:trackRect:value:](&v17, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
LABEL_9:
    CGFloat v15 = 3.0;
    return CGRectOffset(*(CGRect *)&v11, 0.0, v15);
  }
  if (style != 2)
  {
    CGRect v21 = CGRectInset(a4, -2.0, 0.0);
    v16.receiver = self;
    v16.super_class = (Class)THWDetailSlider;
    -[THWDetailSlider thumbRectForBounds:trackRect:value:](&v16, "thumbRectForBounds:trackRect:value:", x, y, width, height, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, LODWORD(a5));
    goto LABEL_9;
  }
  CGRect v20 = CGRectInset(a4, -3.0, 0.0);
  v19.receiver = self;
  v19.super_class = (Class)THWDetailSlider;
  -[THWDetailSlider thumbRectForBounds:trackRect:value:](&v19, "thumbRectForBounds:trackRect:value:", x, y, width, height, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, LODWORD(a5));
LABEL_6:
  CGFloat v15 = 2.0;
  return CGRectOffset(*(CGRect *)&v11, 0.0, v15);
}

- (void)setValue:(float)a3
{
  if (!self->_isTracking) {
    -[THWDetailSlider _setValueWhileTracking:](self, "_setValueWhileTracking:");
  }
}

- (void)_setValueWhileTracking:(float)a3
{
  double duration = self->_duration;
  if (duration > 0.0)
  {
    double v5 = fmax(a3, 0.0);
    if (duration < v5) {
      double v5 = self->_duration;
    }
    float v6 = v5;
    double v7 = v6;
    float v8 = v6 / duration;
    [(THWDetailSlider *)self bounds];
    double v10 = 1.0 / v9;
    LODWORD(v10) = 1.0;
    if (vabdd_f64(1.0, v8) >= 1.0 / v9) {
      *(float *)&double v10 = v8;
    }
    v11.receiver = self;
    v11.super_class = (Class)THWDetailSlider;
    [(THWDetailSlider *)&v11 setValue:v10];
    [(THWDetailSlider *)self _updateForAvailableDuration];
    [(THWDetailSlider *)self _updateTimeDisplayForTime:v7];
    if (self->_isTracking && self->_canCommit) {
      [(THWDetailSlider *)self _commitValue];
    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_didBeginTracking = 0;
  [a3 locationInView:self];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(THWDetailSlider *)self _thumbHitFrame];
  v11.double x = v6;
  v11.double y = v8;
  BOOL v9 = CGRectContainsPoint(v12, v11);
  if (v9)
  {
    self->_isTracking = 1;
    self->_previousLocationInView.double x = v6;
    self->_previousLocationInView.double y = v8;
    self->_beginLocationInView.double x = v6;
    self->_beginLocationInView.double y = v8;
    self->_lastCommittedLocationInView.double x = v6;
    self->_lastCommittedLocationInView.double y = v8;
    if (objc_opt_respondsToSelector()) {
      [self->_delegate detailSliderTrackingDidBegin:self];
    }
    if (objc_opt_respondsToSelector()) {
      [self->_delegate detailSlider:self didChangeScrubSpeed:0];
    }
  }
  return v9;
}

- (void)_autoscrubTick:(id)a3
{
  [(THWDetailSlider *)self maximumValue];
  float v5 = v4;
  [(THWDetailSlider *)self minimumValue];
  double v7 = (float)(v5 - v6);
  [(THWDetailSlider *)self bounds];
  -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v8 = v7 / CGRectGetWidth(v24);
  [(THWDetailSlider *)self _scaleForVerticalPosition:self->_previousLocationInView.y];
  double v10 = v9;
  double v11 = v8 * v9;
  -[THWDetailSlider convertPoint:toView:](self, "convertPoint:toView:", [(THWDetailSlider *)self window], self->_previousLocationInView.x, self->_previousLocationInView.y);
  double v13 = v12;
  [self window].bounds;
  if (v13 >= CGRectGetMidX(v25)) {
    double v14 = v11;
  }
  else {
    double v14 = -(v8 * v10);
  }
  float v15 = v14;
  self->_needsCommit = 1;
  self->_canCommit = 1;
  [(THWDetailSlider *)self minimumValue];
  float v17 = v16;
  [(THWDetailSlider *)self maximumValue];
  float v19 = v18;
  [(THWDetailSlider *)self value];
  float v21 = v20 + v15;
  if (v19 < v21) {
    float v21 = v19;
  }
  if (v17 >= v21) {
    float v21 = v17;
  }
  double v22 = self->_duration * v21;
  *(float *)&double v22 = v22;
  [(THWDetailSlider *)self setValue:0 animated:v22];
  if ([(THWDetailSlider *)self isContinuous])
  {
    [(THWDetailSlider *)self sendActionsForControlEvents:4096];
  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  [a3 locationInView:self];
  double v7 = v6;
  double v8 = v5;
  float v9 = 1.0;
  if (self->_allowsDetailScrubbing && self->_durationAllowsDetailScrubbing)
  {
    [(THWDetailSlider *)self _scaleForVerticalPosition:v5];
    float v9 = v10;
    if (v10 <= self->_minScale || (double v11 = v10, v9 <= 0.1))
    {
      int64_t v12 = 3;
    }
    else if (v11 > 0.35 || v11 <= 0.1)
    {
      int64_t v12 = v11 > 0.35 && v9 <= 0.75;
    }
    else
    {
      int64_t v12 = 2;
    }
    if (self->_scrubValue != v12)
    {
      self->_scrubValue = v12;
      if (objc_opt_respondsToSelector()) {
        [self->_delegate detailSlider:self didChangeScrubSpeed:self->_scrubValue];
      }
    }
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
  }
  if (self->_didBeginTracking)
  {
    if (v13) {
      goto LABEL_16;
    }
  }
  else
  {
    if (vabdd_f64(self->_beginLocationInView.x, v7) < 12.0)
    {
LABEL_30:
      self->_previousLocationInView.double x = v7;
      p_double y = &self->_previousLocationInView.y;
      goto LABEL_56;
    }
    self->_didBeginTracking = 1;
    if (v13)
    {
LABEL_16:
      id v14 = [(THWDetailSlider *)self window];
      -[THWDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v14, v7, v8);
      double v16 = v15;
      double v18 = v17;
      BOOL autoscrubActive = self->_autoscrubActive;
      float v20 = (char *)[v14 windowScene].interfaceOrientation - 3;
      if ((unint64_t)v20 < 2) {
        double v16 = v18;
      }
      [v14 bounds];
      if ((unint64_t)v20 > 1)
      {
        double Width = CGRectGetWidth(*(CGRect *)&v21);
        if (v14)
        {
LABEL_20:
          int v26 = v16 < 20.0;
          double Width = Width + -20.0;
          if (v16 > Width) {
            int v26 = 1;
          }
          self->_BOOL autoscrubActive = v26;
          if (v26 == 1)
          {
            [(UIImageView *)[(THWDetailSlider *)self thumbImageView] setImage:[(THWDetailSlider *)self currentThumbImage]];
            if (!autoscrubActive)
            {
              double v27 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
              [(CABasicAnimation *)v27 setToValue:+[NSNumber numberWithFloat:0.0]];
              [(CABasicAnimation *)v27 setDuration:0.25];
              LODWORD(v28) = 2139095039;
              [(CABasicAnimation *)v27 setRepeatCount:v28];
              [(CABasicAnimation *)v27 setAutoreverses:1];
              [self->_glowDetailScrubImageView.layer addAnimation:v27 forKey:@"pulseAnimation"];
            }
            [(THWDetailSlider *)self value];
            double v30 = self->_duration * v29;
            *(float *)&double v30 = v30;
            [(THWDetailSlider *)self _setValueWhileTracking:v30];
            if ([(THWDetailSlider *)self isContinuous]) {
              [(THWDetailSlider *)self sendActionsForControlEvents:4096];
            }
            if (!self->_autoscrubTimer) {
              self->_autoscrubTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_autoscrubTick:" selector:0 userInfo:1 repeats:0.1];
            }
            goto LABEL_30;
          }
          goto LABEL_33;
        }
      }
      else
      {
        double Width = CGRectGetHeight(*(CGRect *)&v21);
        if (v14) {
          goto LABEL_20;
        }
      }
      self->_BOOL autoscrubActive = 0;
LABEL_33:
      if (self->_autoscrubTimer)
      {
        [self->_glowDetailScrubImageView.layer Width removeAnimationForKey:@"pulseAnimation"];
        CGRect v32 = self;
        [(NSTimer *)self->_autoscrubTimer invalidate];

        self->_autoscrubTimer = 0;
      }
    }
  }
  double v33 = v7 - self->_previousLocationInView.x;
  [(THWDetailSlider *)self maximumValue];
  float v35 = v34;
  [(THWDetailSlider *)self minimumValue];
  double v37 = (float)(v35 - v36);
  [(THWDetailSlider *)self bounds];
  -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v38 = v33 * (v37 / CGRectGetWidth(v64));
  [(THWDetailSlider *)self value];
  float v40 = v39;
  double v41 = v39 + v38 * v9;
  p_double y = &self->_previousLocationInView.y;
  if (v8 - self->_previousLocationInView.y < 0.0) {
    int v42 = v13;
  }
  else {
    int v42 = 0;
  }
  if (v42 == 1)
  {
    [(THWDetailSlider *)self minimumValue];
    float v44 = v43;
    [(THWDetailSlider *)self maximumValue];
    float v46 = v45;
    [(THWDetailSlider *)self bounds];
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
    v65.origin.double y = v48;
    v65.size.double height = v50;
    CGRect v66 = CGRectInset(v65, -2.0, 0.0);
    double x = v66.origin.x;
    double v52 = v66.size.width;
    [(UIImageView *)[(THWDetailSlider *)self thumbImageView] frame];
    float v54 = v7 - x + v53 * -0.5;
    float v55 = (float)((float)(v46 - v44) * v54) / (v52 - v53) + v44;
    if (v44 <= v55)
    {
      float v44 = v55;
      if (v46 < v55) {
        float v44 = v46;
      }
    }
    [(THWDetailSlider *)self _scaleForIdealValueForVerticalPosition:v8];
    double v41 = v41 + (float)((float)(v44 - v40) * v56);
  }
  [(THWDetailSlider *)self minimumValue];
  float v58 = v57;
  [(THWDetailSlider *)self maximumValue];
  double v60 = v59;
  if (v41 <= v60) {
    double v60 = v41;
  }
  if (v60 <= v58) {
    double v60 = v58;
  }
  float v61 = v60;
  if (vabds_f32(v61, v40) > 0.00000011921) {
    self->_needsCommit = 1;
  }
  if (vabdd_f64(self->_lastCommittedLocationInView.x, v7) > 8.0
    || vabdd_f64(self->_lastCommittedLocationInView.y, v8) > 4.0)
  {
    self->_canCommit = 1;
    self->_lastCommittedLocationInView.double x = v7;
    self->_lastCommittedLocationInView.double y = v8;
  }
  double v62 = v60 * self->_duration;
  *(float *)&double v62 = v62;
  [(THWDetailSlider *)self _setValueWhileTracking:v62];
  if ([(THWDetailSlider *)self isContinuous]) {
    [(THWDetailSlider *)self sendActionsForControlEvents:4096];
  }
  self->_previousLocationInView.double x = v7;
LABEL_56:
  *p_double y = v8;
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v6 = self;
  [(NSTimer *)self->_autoscrubTimer invalidate];

  self->_autoscrubTimer = 0;
  self->_BOOL autoscrubActive = 0;
  self->_isTracking = 0;
  [(THWDetailSlider *)self _resetScrubInfo];
  [a3 locationInView:self];
  if (vabdd_f64(self->_lastCommittedLocationInView.x, v7) > 3.0) {
    [(THWDetailSlider *)self _commitValue];
  }
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    [delegate detailSliderTrackingDidEnd:self];
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

+ (double)defaultHeight
{
  return 24.0;
}

+ (Class)labelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)allowsDetailScrubbing
{
  return self->_allowsDetailScrubbing;
}

- (void)cancelTracking
{
  double v3 = self;
  [(NSTimer *)self->_autoscrubTimer invalidate];

  self->_autoscrubTimer = 0;
  self->_BOOL autoscrubActive = 0;
  BOOL isTracking = self->_isTracking;
  self->_BOOL isTracking = 0;
  [(THWDetailSlider *)self _resetScrubInfo];
  if (isTracking && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    [delegate detailSliderTrackingDidCancel:self];
  }
}

- (BOOL)detailScrubbingAvailableForCurrentDuration
{
  return self->_duration >= 60.0;
}

- (void)setAllowsScrubbing:(BOOL)a3
{
  if (self->_allowsScrubbing != a3)
  {
    self->_allowsScrubbing = a3;
    -[THWDetailSlider setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  }
}

- (void)setAllowsDetailScrubbing:(BOOL)a3
{
  self->_allowsDetailScrubbing = a3;
}

- (void)setAvailableDuration:(double)duration
{
  if (self->_duration <= duration) {
    double duration = self->_duration;
  }
  if (vabdd_f64(duration, self->_availableDuration) > 2.22044605e-16)
  {
    self->_availableDuration = duration;
    [(THWDetailSlider *)self _updateForAvailableDuration];
  }
}

- (void)setDuration:(double)a3
{
  if (vabdd_f64(self->_duration, a3) > 2.22044605e-16)
  {
    self->_double duration = a3;
    self->_durationAllowsDetailScrubbing = [(THWDetailSlider *)self detailScrubbingAvailableForCurrentDuration];
    double currentTime = self->_currentTime;
    if (currentTime >= self->_duration) {
      double currentTime = self->_duration;
    }
    self->_double currentTime = fmax(currentTime, 0.0);
    [(THWDetailSlider *)self layoutSubviews];
    double v5 = self->_currentTime;
    *(float *)&double v5 = v5;
    [(THWDetailSlider *)self setValue:0 animated:v5];
    [(THWDetailSlider *)self setAvailableDuration:self->_duration];
    double v6 = self->_currentTime;
    [(THWDetailSlider *)self _updateTimeDisplayForTime:1 force:v6];
  }
}

- (void)setMinTimeLabelWidth:(double)a3
{
  if (self->_minTimeLabelWidth != a3)
  {
    self->_minTimeLabeldouble Width = a3;
    [(THWDetailSlider *)self setNeedsLayout];
  }
}

- (void)setTimeLabelInsets:(UIEdgeInsets)a3
{
  if (self->_timeLabelInsets.left != a3.left
    || self->_timeLabelInsets.top != a3.top
    || self->_timeLabelInsets.right != a3.right
    || self->_timeLabelInsets.bottom != a3.bottom)
  {
    self->_timeLabelInsets = a3;
    [(THWDetailSlider *)self setNeedsLayout];
  }
}

- (void)setTimeLabelStyle:(int64_t)a3
{
  if (self->_timeLabelStyle != a3)
  {
    self->_timeLabelStyle = a3;
    [(THWDetailSlider *)self setNeedsLayout];
  }
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  int64_t style = self->_style;
  if ((unint64_t)(style - 1) < 2)
  {
    double v4 = 12.0;
    return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", a3, v4);
  }
  if (style != 4)
  {
    if (style == 3) {
      double v4 = 10.0;
    }
    else {
      double v4 = 14.0;
    }
    return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", a3, v4);
  }
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", a3, 11.0);
}

- (id)timeLabelShadowColorForStyle:(int64_t)a3
{
  return +[UIColor blackColor];
}

- (CGSize)timeLabelShadowOffsetForStyle:(int64_t)a3
{
  double v3 = 1.0;
  if (self->_style != 2) {
    double v3 = -1.0;
  }
  double v4 = 0.0;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  return +[UIColor whiteColor];
}

- (double)timeLabelVerticalOffsetForStyle:(int64_t)a3
{
  return -2.0;
}

- (void)_setupControlsForStyle
{
  unint64_t v3 = self->_style - 1;
  if (v3 > 3)
  {
    CFStringRef v6 = @"ScrubberKnob";
    CFStringRef v5 = @"VolumeBlueTrack";
    uint64_t v7 = 5;
    CFStringRef v4 = @"VolumeWhiteTrack";
  }
  else
  {
    CFStringRef v4 = off_459FE0[v3];
    CFStringRef v5 = off_45A000[v3];
    CFStringRef v6 = off_45A020[v3];
    uint64_t v7 = 6;
  }
  id v8 = +[UIImage th_imageNamed:v6];
  id v9 = [+[UIImage th_imageNamed:] stretchableImageWithLeftCapWidth:topCapHeight:v7, 0];
  id v10 = [+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", v4) stretchableImageWithLeftCapWidth:v7 topCapHeight:0];
  [(THWDetailSlider *)self setThumbImage:v8 forState:0];
  [(THWDetailSlider *)self setMinimumTrackImage:v9 forState:0];

  [(THWDetailSlider *)self setMaximumTrackImage:v10 forState:0];
}

- (void)_updateTrackInset
{
  if (self->_currentTimeInverseLabel && self->_currentTimeLabel)
  {
    double v3 = 0.0;
    double v4 = 0.0;
    if (![(THWDetailSlider *)self hideRightNumericDisplay])
    {
      [(THWDetailSlider *)self duration];
      id v5 = -[THWDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:");
      NSAttributedStringKey v22 = NSFontAttributeName;
      v23 = [(UILabel *)self->_currentTimeInverseLabel font];
      [v5 sizeWithAttributes:[NSDictionary dictionaryWithObjects:forKeys:count:&v23, &v22, 1]];
      double v4 = v6;
    }
    if (![(THWDetailSlider *)self hideLeftNumericDisplay])
    {
      [(THWDetailSlider *)self duration];
      id v7 = -[THWDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:");
      NSAttributedStringKey v20 = NSFontAttributeName;
      uint64_t v21 = [(UILabel *)self->_currentTimeLabel font];
      [v7 sizeWithAttributes:[NSDictionary dictionaryWithObjects:forKeys:count:&v21, &v20, 1]];
      double v3 = v8;
    }
    unsigned __int8 v9 = [(THWDetailSlider *)self hideLeftNumericDisplay];
    double v10 = 2.0;
    double v11 = 2.0;
    if ((v9 & 1) == 0)
    {
      minTimeLabeldouble Width = self->_minTimeLabelWidth;
      if (minTimeLabelWidth < v3) {
        minTimeLabeldouble Width = v3;
      }
      double v11 = minTimeLabelWidth + 2.0;
    }
    self->_double trackInsetLeft = v11;
    if (![(THWDetailSlider *)self hideRightNumericDisplay])
    {
      double v13 = self->_minTimeLabelWidth;
      if (v13 < v4) {
        double v13 = v4;
      }
      double v10 = v13 + 2.0;
    }
    self->_trackInsetRight = v10;
    if (![(THWDetailSlider *)self hideLeftNumericDisplay])
    {
      [(UILabel *)self->_currentTimeLabel frame];
      -[UILabel setFrame:](self->_currentTimeLabel, "setFrame:", self->_timeLabelInsets.left + 0.0, v14 + self->_timeLabelInsets.top, self->_trackInsetLeft - (self->_timeLabelInsets.left + self->_timeLabelInsets.right), v15 - (self->_timeLabelInsets.top + self->_timeLabelInsets.bottom));
      [(UILabel *)self->_currentTimeLabel setNeedsDisplay];
    }
    if (![(THWDetailSlider *)self hideRightNumericDisplay])
    {
      [(UILabel *)self->_currentTimeInverseLabel frame];
      double v17 = v16;
      double v19 = v18;
      [(THWDetailSlider *)self bounds];
      -[UILabel setFrame:](self->_currentTimeInverseLabel, "setFrame:", CGRectGetWidth(v24) - self->_trackInsetRight - self->_timeLabelInsets.left, v17 + self->_timeLabelInsets.top, self->_trackInsetRight - (-self->_timeLabelInsets.right - self->_timeLabelInsets.left), v19 - (self->_timeLabelInsets.top + self->_timeLabelInsets.bottom));
    }
  }
}

- (void)_adjustMinScale
{
  [(THWDetailSlider *)self bounds];
  float Width = CGRectGetWidth(v5);
  float duration = self->_duration;
  self->_minScale = (float)(Width / duration) / 10.0;
}

- (float)_scaleForVerticalPosition:(double)a3
{
  int v5 = TSUPadUI();
  double detailScrubbingVerticalRange = self->_detailScrubbingVerticalRange;
  double v7 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (detailScrubbingVerticalRange >= v7) {
    double detailScrubbingVerticalRange = v7;
  }
  if (v5) {
    double v8 = 20.0;
  }
  else {
    double v8 = 0.0;
  }
  if (v8 >= detailScrubbingVerticalRange) {
    double v9 = v8;
  }
  else {
    double v9 = detailScrubbingVerticalRange;
  }
  if (TSUPadUI()) {
    double v10 = 20.0;
  }
  else {
    double v10 = 0.0;
  }
  float v11 = v9 - v10;
  double v12 = v11;
  double v13 = self->_detailScrubbingVerticalRange;
  if (TSUPadUI()) {
    double v14 = 20.0;
  }
  else {
    double v14 = 0.0;
  }
  float v15 = v12 / (v13 - v14);
  float result = 1.0 - v15;
  if (self->_minScale >= result) {
    return self->_minScale;
  }
  return result;
}

- (float)_scaleForIdealValueForVerticalPosition:(double)a3
{
  double detailScrubbingVerticalRange = self->_detailScrubbingVerticalRange;
  double v4 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (detailScrubbingVerticalRange < v4) {
    double v4 = self->_detailScrubbingVerticalRange;
  }
  double v5 = v4 + -20.0;
  BOOL v6 = v4 == 20.0;
  BOOL v7 = v4 < 20.0;
  double v8 = 0.0;
  if (!v7 && !v6) {
    double v8 = v5;
  }
  float v9 = v8;
  float v10 = v9 / (detailScrubbingVerticalRange + -20.0);
  if (v10 <= 0.15)
  {
    float v10 = v10 / 0.15;
    float v11 = 0.33333;
  }
  else
  {
    float v11 = 0.025;
  }
  float v12 = powf(v10, v11);
  if (v12 <= 0.0) {
    float v13 = 1.0;
  }
  else {
    float v13 = 1.0 - v12;
  }
  if (v13 > 1.0) {
    float v13 = 1.0;
  }
  return fmaxf(v13, 0.0);
}

- (void)_updateTimeDisplayForTime:(double)a3
{
}

- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4
{
  double v5 = floor(a3);
  if (a4 || vabdd_f64(self->_currentTime, v5) > 2.22044605e-16)
  {
    [(UILabel *)self->_currentTimeLabel setText:[(THWDetailSlider *)self _stringForCurrentTime:v5]];
    [(UILabel *)self->_currentTimeInverseLabel setText:[(THWDetailSlider *)self _stringForInverseCurrentTime:self->_duration - v5]];
    self->_double currentTime = v5;
  }
}

- (id)_stringForTime:(double)a3
{
  double v3 = floor(a3);
  double v4 = floor(v3 / 60.0);
  double v5 = v3 - v4 * 60.0;
  double v6 = floor(v4 / 60.0);
  double v7 = v4 - v6 * 60.0;
  double v8 = (void *)THBundle();
  if (v6 <= 0.0) {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v8 localizedStringForKey:@"%1$2lu:%2$02lu" value:&stru_46D7E8 table:0], (unint64_t)v7, (unint64_t)v5, v10);
  }
  else {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v8 localizedStringForKey:@"%1$2lu:%2$02lu:%3$02lu" value:&stru_46D7E8 table:0], (unint64_t)v6, (unint64_t)v7, (unint64_t)v5);
  }
}

- (id)_stringForCurrentTime:(double)a3
{
  if (self->_timeLabelStyle == 1 && vabdd_f64(self->_duration, a3) < 30.0)
  {
    double v3 = (void *)THBundle();
    return [v3 localizedStringForKey:@"Unknown Duration" value:&stru_46D7E8 table:0];
  }
  else
  {
    return [(THWDetailSlider *)self _stringForTime:a3];
  }
}

- (id)_stringForInverseCurrentTime:(double)a3
{
  if (self->_timeLabelStyle == 1)
  {
    if (fabs(a3) < 30.0)
    {
      double v3 = (void *)THBundle();
      return [v3 localizedStringForKey:@"Live" value:&stru_46D7E8 table:0];
    }
    id v5 = -[THWDetailSlider _stringForTime:](self, "_stringForTime:");
  }
  else
  {
    id v5 = [(THWDetailSlider *)self _stringForCurrentTime:a3];
  }

  return [@"-" stringByAppendingString:v5];
}

- (CGRect)_thumbHitFrame
{
  [(UIImageView *)[(THWDetailSlider *)self thumbImageView] frame];

  return CGRectInset(*(CGRect *)&v2, -15.0, -15.0);
}

- (void)_resetScrubInfo
{
  self->_scrubValue = 0;
  [(UIImageView *)[(THWDetailSlider *)self thumbImageView] setImage:[(THWDetailSlider *)self currentThumbImage]];
  id v3 = [(UIImageView *)self->_glowDetailScrubImageView layer];

  [v3 removeAnimationForKey:@"pulseAnimation"];
}

- (void)_commitValue
{
  if (self->_needsCommit && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    [(THWDetailSlider *)self value];
    double v5 = self->_duration * v4;
    *(float *)&double v5 = v5;
    [delegate detailSlider:self didChangeValue:v5];
    self->_needsCommit = 0;
  }
}

- (void)_updateForAvailableDuration
{
  [(THWDetailSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (![(THWDetailSlider *)self thumbImageView])
  {
    [(THWDetailSlider *)self setNeedsLayout];
    [(THWDetailSlider *)self layoutIfNeeded];
  }
  v65.origin.CGFloat x = v4;
  v65.origin.CGFloat y = v6;
  v65.size.double width = v8;
  v65.size.double height = v10;
  if (CGRectGetWidth(v65) > 0.0)
  {
    switch(self->_style)
    {
      case 0:
        double availableDuration = self->_availableDuration;
        if (availableDuration >= self->_duration)
        {
          downloadingTrackOverlaCGFloat y = self->_downloadingTrackOverlay;
          if (downloadingTrackOverlay)
          {
            [(UIImageView *)downloadingTrackOverlay removeFromSuperview];

            self->_downloadingTrackOverlaCGFloat y = 0;
          }
        }
        else
        {
          double currentTime = fmax(availableDuration, 0.0);
          if (currentTime < self->_currentTime && !self->_isTracking) {
            double currentTime = self->_currentTime;
          }
          -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
          CGRect v77 = CGRectOffset(v76, 0.0, 1.0);
          CGRect v78 = CGRectInset(v77, 1.0, 0.0);
          if (v78.size.width > 0.0)
          {
            CGFloat x = v78.origin.x;
            CGFloat y = v78.origin.y;
            double width = v78.size.width;
            if (!qword_573300) {
              qword_573300 = [[UIImage th_imageNamed:@"ScrubberDownloading"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
            }
            [+[UIScreen mainScreen] scale];
            CGFloat v45 = v44;
            v63.double height = 8.0;
            v63.double width = width;
            UIGraphicsBeginImageContextWithOptions(v63, 0, v45);
            v79.size.double height = 8.0;
            v79.origin.CGFloat x = x;
            v79.origin.CGFloat y = y;
            v79.size.double width = width;
            CGFloat v46 = floor(currentTime / self->_duration * CGRectGetWidth(v79));
            CurrentContext = UIGraphicsGetCurrentContext();
            v80.size.double height = 8.0;
            v80.origin.CGFloat x = x;
            v80.origin.CGFloat y = y;
            v80.size.double width = width;
            v81.size.double width = CGRectGetWidth(v80) - v46;
            v81.origin.CGFloat y = 0.0;
            v81.size.double height = 8.0;
            v81.origin.CGFloat x = v46;
            CGContextClipToRect(CurrentContext, v81);
            [qword_573300 drawInRect:CGPointZero blendMode:0 alpha:1.0];
            goto LABEL_20;
          }
        }
        break;
      case 2:
      case 4:
        -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
        CGRect v67 = CGRectOffset(v66, 0.0, 1.0);
        CGRect v68 = CGRectInset(v67, 0.0, 0.0);
        if (v68.size.width > 0.0)
        {
          CGFloat v11 = v68.origin.x;
          CGFloat v12 = v68.origin.y;
          CGFloat v13 = v68.size.width;
          [+[UIScreen mainScreen] scale];
          CGFloat v15 = v14;
          v62.double height = 10.0;
          v62.double width = v13;
          UIGraphicsBeginImageContextWithOptions(v62, 0, v15);
          CGFloat rect_24 = v13;
          double v16 = self->_availableDuration / self->_duration;
          v69.size.double height = 10.0;
          v69.origin.CGFloat x = v11;
          v69.origin.CGFloat y = v12;
          v69.size.double width = rect_24;
          float v17 = v16 * CGRectGetWidth(v69);
          CGFloat rect_8 = floorf(v17);
          -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
          CGFloat rect_16 = v12;
          CGFloat rect = v11;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          [(THWDetailSlider *)self value];
          LODWORD(v56) = v26;
          -[THWDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v19, v21, v23, v25, v56);
          double MidX = CGRectGetMidX(v70);
          v71.origin.CGFloat x = v19;
          v71.origin.CGFloat y = v21;
          v71.size.double width = v23;
          v71.size.double height = v25;
          CGFloat v28 = MidX - CGRectGetMinX(v71);
          v72.size.double height = 10.0;
          v72.origin.CGFloat x = rect;
          v72.size.double width = rect_24;
          v72.origin.CGFloat y = rect_16;
          CGFloat v29 = fmax(CGRectGetWidth(v72) - v28, 0.0);
          double v30 = UIGraphicsGetCurrentContext();
          v73.origin.CGFloat x = 0.0;
          v73.origin.CGFloat y = 0.0;
          v73.size.double height = 10.0;
          v87.origin.CGFloat y = 0.0;
          v87.size.double height = 10.0;
          v73.size.double width = rect_8;
          v87.origin.CGFloat x = v28;
          v87.size.double width = v29;
          CGRect v74 = CGRectIntersection(v73, v87);
          CGContextClipToRect(v30, v74);
          double v31 = CGPointZero.y;
          [+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGPointZero.x, v31, v23, v25 + -1.0, 5.0) addClip];
          [+[UIColor colorWithWhite:1.0 alpha:0.2] set];
          v75.size.double height = 10.0;
          v75.origin.CGFloat x = CGPointZero.x;
          v75.origin.CGFloat y = v31;
          v75.size.double width = rect_24;
          UIRectFill(v75);
          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          if (!self->_downloadingTrackOverlay && [(THWDetailSlider *)self thumbImageView])
          {
            double v33 = [(UIImageView *)[objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
            self->_downloadingTrackOverlaCGFloat y = v33;
            [(THWDetailSlider *)self insertSubview:v33 belowSubview:[(THWDetailSlider *)self thumbImageView]];
          }
          [(UIImageView *)self->_downloadingTrackOverlay setImage:ImageFromCurrentImageContext];
          float v34 = self->_downloadingTrackOverlay;
          double v35 = 10.0;
          double v36 = rect;
          double v37 = rect_16;
          double v38 = rect_24;
          goto LABEL_23;
        }
        break;
      case 3:
        -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
        CGRect v83 = CGRectOffset(v82, 0.0, 1.0);
        CGRect v84 = CGRectInset(v83, 1.0, 0.0);
        if (v84.size.width > 0.0)
        {
          CGFloat x = v84.origin.x;
          CGFloat y = v84.origin.y;
          double width = v84.size.width;
          [+[UIScreen mainScreen] scale];
          CGFloat v49 = v48;
          v64.double height = 8.0;
          v64.double width = width;
          UIGraphicsBeginImageContextWithOptions(v64, 0, v49);
          [+[UIColor colorWithWhite:1.0 alpha:0.1] set];
          v85.size.double height = 8.0;
          v85.origin.CGFloat x = x;
          v85.origin.CGFloat y = y;
          v85.size.double width = width;
          CGFloat v50 = floor(self->_availableDuration / self->_duration * CGRectGetWidth(v85));
          v51 = UIGraphicsGetCurrentContext();
          v86.origin.CGFloat x = 0.0;
          v86.origin.CGFloat y = 0.0;
          v86.size.double height = 8.0;
          v86.size.double width = v50;
          CGContextClipToRect(v51, v86);
          [+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGPointZero.x, CGPointZero.y, width, 8.0, 5.0) fill];
LABEL_20:
          double v52 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          double v53 = self->_downloadingTrackOverlay;
          if (!v53)
          {
            float v54 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
            self->_downloadingTrackOverlaCGFloat y = v54;
            [(THWDetailSlider *)self insertSubview:v54 belowSubview:[(THWDetailSlider *)self thumbImageView]];
            double v53 = self->_downloadingTrackOverlay;
          }
          [(UIImageView *)v53 setImage:v52];
          float v34 = self->_downloadingTrackOverlay;
          double v35 = 8.0;
          double v36 = x;
          double v37 = y;
          double v38 = width;
LABEL_23:
          -[UIImageView setFrame:](v34, "setFrame:", v36, v37, v38, v35);
        }
        break;
      default:
        return;
    }
  }
}

- (double)availableDuration
{
  return self->_availableDuration;
}

- (THWDetailSliderDelegate)delegate
{
  return (THWDetailSliderDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_id delegate = a3;
}

- (double)detailScrubbingVerticalRange
{
  return self->_detailScrubbingVerticalRange;
}

- (void)setDetailScrubbingVerticalRange:(double)a3
{
  self->_double detailScrubbingVerticalRange = a3;
}

- (double)duration
{
  return self->_duration;
}

- (UIEdgeInsets)timeLabelInsets
{
  double top = self->_timeLabelInsets.top;
  double left = self->_timeLabelInsets.left;
  double bottom = self->_timeLabelInsets.bottom;
  double right = self->_timeLabelInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)timeLabelStyle
{
  return self->_timeLabelStyle;
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (BOOL)allowsScrubbing
{
  return self->_allowsScrubbing;
}

- (BOOL)hideLeftNumericDisplay
{
  return self->_hideLeftNumericDisplay;
}

- (BOOL)hideRightNumericDisplay
{
  return self->_hideRightNumericDisplay;
}

@end