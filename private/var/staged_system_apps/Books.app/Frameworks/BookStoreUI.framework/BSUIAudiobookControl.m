@interface BSUIAudiobookControl
- (BOOL)playing;
- (BOOL)wipeAnimationInProgress;
- (BSUIAudiobookControl)initWithFrame:(CGRect)a3;
- (BSUIAudiobookControlDelegate)delegate;
- (CAShapeLayer)progressLayer;
- (CGSize)currentSize;
- (TUIUIKitButton)backgroundButton;
- (TUIUIKitButton)playPauseButton;
- (UIView)blurView;
- (double)progress;
- (id)circleWithRect:(CGRect)a3 color:(id)a4;
- (void)_animateProgressWipe;
- (void)_updatePlaying;
- (void)_updateProgress;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)scaleDown:(id)a3;
- (void)scaleUpAndTogglePlayPause:(id)a3;
- (void)setBackgroundButton:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setCurrentSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setProgressLayer:(id)a3;
- (void)setWipeAnimationInProgress:(BOOL)a3;
@end

@implementation BSUIAudiobookControl

- (BSUIAudiobookControl)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIAudiobookControl;

  return 0;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)BSUIAudiobookControl;
  [(BSUIAudiobookControl *)&v20 layoutSubviews];
  [(BSUIAudiobookControl *)self bounds];
  if (v4 != self->_currentSize.width || v3 != self->_currentSize.height)
  {
    [(BSUIAudiobookControl *)self bounds];
    self->_currentSize.width = v6;
    self->_currentSize.height = v7;
    [(BSUIAudiobookControl *)self bounds];
    CGFloat v8 = CGRectGetWidth(v21) * 0.5;
    v9 = [(UIView *)self->_blurView layer];
    [v9 setCornerRadius:v8];

    [(BSUIAudiobookControl *)self bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = +[UIColor blackColor];
    v19 = -[BSUIAudiobookControl circleWithRect:color:](self, "circleWithRect:color:", v18, v11, v13, v15, v17);

    [(TUIUIKitButton *)self->_backgroundButton setImage:v19 forState:0];
    [(BSUIAudiobookControl *)self _updateProgress];
  }
}

- (void)scaleDown:(id)a3
{
  id v9 = +[CABasicAnimation animationWithKeyPath:@"transform.scale"];
  [v9 setFromValue:&off_3A0BB8];
  [v9 setToValue:&off_3A0BC8];
  [v9 setDuration:0.13];
  LODWORD(v4) = 1045220557;
  LODWORD(v5) = 1041865114;
  LODWORD(v6) = 1.0;
  CGFloat v7 = +[CAMediaTimingFunction functionWithControlPoints:v4 :0.0 :v5 :v6];
  [v9 setTimingFunction:v7];

  CGFloat v8 = [(BSUIAudiobookControl *)self layer];
  [v8 addAnimation:v9 forKey:@"layerScaleDownAnimation"];
}

- (void)scaleUpAndTogglePlayPause:(id)a3
{
  id v6 = +[CASpringAnimation animationWithKeyPath:@"transform.scale"];
  [v6 setMass:1.0];
  [v6 setStiffness:400.0];
  [v6 setDamping:23.0];
  [v6 setInitialVelocity:0.0];
  [v6 setFromValue:&off_3A0BC8];
  [v6 setToValue:&off_3A0BB8];
  [v6 settlingDuration];
  [v6 setDuration:];
  double v4 = [(BSUIAudiobookControl *)self layer];
  [v4 addAnimation:v6 forKey:@"layerScaleUpAnimation"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained togglePlayPause:self];
}

- (id)circleWithRect:(CGRect)a3 color:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v34);
  if (v9 < v10) {
    double v10 = v9;
  }
  double v11 = v10 * 0.5;
  double v12 = v10 + 1.0;
  double v13 = +[UIScreen mainScreen];
  [v13 scale];
  CGFloatRoundForScale();
  uint64_t v15 = v14;

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1340C;
  v25[3] = &unk_38E6E8;
  double v27 = v12;
  double v28 = v12;
  id v26 = v8;
  uint64_t v29 = v15;
  uint64_t v30 = v15;
  double v31 = v11;
  id v16 = v8;
  double v17 = objc_retainBlock(v25);
  v18 = +[UIGraphicsImageRendererFormat defaultFormat];
  id v19 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v18 format:v12];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_134CC;
  v23[3] = &unk_38E710;
  id v24 = v17;
  objc_super v20 = v17;
  CGRect v21 = [v19 imageWithActions:v23];

  return v21;
}

- (void)didMoveToWindow
{
  double v3 = [(BSUIAudiobookControl *)self window];

  if (v3)
  {
    double v4 = [(BSUIAudiobookControl *)self window];
    double v5 = [v4 screen];
    [v5 scale];
    double v7 = v6;

    progressLayer = self->_progressLayer;
    [(CAShapeLayer *)progressLayer setRasterizationScale:v7];
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    [(BSUIAudiobookControl *)self _updatePlaying];
    [(BSUIAudiobookControl *)self _updateProgress];
  }
}

- (void)_updatePlaying
{
  if (self->_playing) {
    double v3 = @"audiobook_pause_glyph";
  }
  else {
    double v3 = @"audiobook_play_glyph";
  }
  double v4 = v3;
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  double v5 = +[UIImage tui_imageNamed:v4 inBundle:v9];

  double v6 = +[UIColor whiteColor];
  double v7 = [v5 tui_imageMaskWithColor:v6];

  id v8 = [(BSUIAudiobookControl *)self playPauseButton];
  [v8 setImage:v7 forState:0];
}

- (void)setProgress:(double)a3
{
  double progress = self->_progress;
  if (progress != a3)
  {
    self->_double progress = a3;
    if (a3 >= 0.01 || progress <= 0.98) {
      [(BSUIAudiobookControl *)self _updateProgress];
    }
    else {
      [(BSUIAudiobookControl *)self _animateProgressWipe];
    }
  }
}

- (void)_animateProgressWipe
{
  [(CAShapeLayer *)self->_progressLayer setStrokeStart:1.0];
  id v7 = +[CABasicAnimation animationWithKeyPath:@"strokeStart"];
  [v7 setDuration:0.4];
  double v3 = +[NSNumber numberWithFloat:0.0];
  [v7 setFromValue:v3];

  LODWORD(v4) = 1.0;
  double v5 = +[NSNumber numberWithFloat:v4];
  [v7 setToValue:v5];

  double v6 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v7 setTimingFunction:v6];

  [v7 setDelegate:self];
  [(CAShapeLayer *)self->_progressLayer addAnimation:v7 forKey:@"strokeStartAnimation"];
}

- (void)animationDidStart:(id)a3
{
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[CAShapeLayer setPath:](self->_progressLayer, "setPath:", 0, a4);
  [(CAShapeLayer *)self->_progressLayer setStrokeStart:0.0];

  [(BSUIAudiobookControl *)self setWipeAnimationInProgress:0];
}

- (void)_updateProgress
{
  double progress = self->_progress;
  double v4 = 0.0;
  if (progress < 0.0 || (double v4 = 1.0, progress > 1.0)) {
    self->_double progress = v4;
  }
  if (![(BSUIAudiobookControl *)self wipeAnimationInProgress])
  {
    Mutable = CGPathCreateMutable();
    [(BSUIAudiobookControl *)self bounds];
    CGFloat Width = CGRectGetWidth(v10);
    CGPathAddArc(Mutable, 0, Width * 0.5, Width * 0.5, Width * 0.5 + -1.0 + -1.0, -1.57079633, (self->_progress + self->_progress) * 3.14159265 + -1.57079633, 0);
    [(CAShapeLayer *)self->_progressLayer setPath:Mutable];
    CGPathRelease(Mutable);
  }
  LODWORD(v5) = 1.0;
  if (!self->_playing) {
    *(float *)&double v5 = 0.5;
  }
  progressLayer = self->_progressLayer;

  [(CAShapeLayer *)progressLayer setOpacity:v5];
}

- (BSUIAudiobookControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BSUIAudiobookControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)playing
{
  return self->_playing;
}

- (TUIUIKitButton)backgroundButton
{
  return self->_backgroundButton;
}

- (void)setBackgroundButton:(id)a3
{
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (TUIUIKitButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
}

- (BOOL)wipeAnimationInProgress
{
  return self->_wipeAnimationInProgress;
}

- (void)setWipeAnimationInProgress:(BOOL)a3
{
  self->_wipeAnimationInProgress = a3;
}

- (CGSize)currentSize
{
  double width = self->_currentSize.width;
  double height = self->_currentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentSize:(CGSize)a3
{
  self->_currentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_backgroundButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end