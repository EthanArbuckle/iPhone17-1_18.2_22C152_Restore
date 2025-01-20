@interface COSInstallSpinnerButton
+ (id)applicationSpinnerView;
- (COSInstallSpinnerButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareProgressIndicatorIfNeeded;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)showProgressAnimation;
- (void)stopSpinnerView;
@end

@implementation COSInstallSpinnerButton

+ (id)applicationSpinnerView
{
  if (qword_10029AFA0 != -1) {
    dispatch_once(&qword_10029AFA0, &stru_100244298);
  }
  v2 = (void *)qword_10029AF98;

  return v2;
}

- (COSInstallSpinnerButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)COSInstallSpinnerButton;
  v3 = -[COSInstallSpinnerButton initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    v5 = +[COSInstallSpinnerButton applicationSpinnerView];
    v6 = (UIImageView *)[v4 initWithImage:v5];
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = v6;

    [(COSInstallSpinnerButton *)v3 addSubview:v3->_spinnerView];
    v8 = (UIView *)objc_alloc_init((Class)UIView);
    squareView = v3->_squareView;
    v3->_squareView = v8;

    v10 = v3->_squareView;
    v11 = +[UIColor systemOrangeColor];
    [(UIView *)v10 setBackgroundColor:v11];

    [(COSInstallSpinnerButton *)v3 addSubview:v3->_squareView];
    v3->_showingSpinner = 0;
  }
  return v3;
}

- (void)prepareProgressIndicatorIfNeeded
{
  if (!self->_progressIndicator)
  {
    id v3 = objc_alloc((Class)SKUICircleProgressIndicator);
    [(COSInstallSpinnerButton *)self bounds];
    id v4 = [v3 initWithFrame:];
    progressIndicator = self->_progressIndicator;
    self->_progressIndicator = v4;

    [(SKUICircleProgressIndicator *)self->_progressIndicator setAutoresizingMask:18];
    v6 = self->_progressIndicator;
    v7 = +[UIColor clearColor];
    [(SKUICircleProgressIndicator *)v6 setBackgroundColor:v7];

    [(SKUICircleProgressIndicator *)self->_progressIndicator setUserInteractionEnabled:0];
    [(COSInstallSpinnerButton *)self addSubview:self->_progressIndicator];
    [(COSInstallSpinnerButton *)self layoutIfNeeded];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)COSInstallSpinnerButton;
  [(COSInstallSpinnerButton *)&v13 layoutSubviews];
  [(COSInstallSpinnerButton *)self bounds];
  double v4 = v3 + -0.5;
  [(COSInstallSpinnerButton *)self bounds];
  double v6 = v5 + -0.5;
  [(COSInstallSpinnerButton *)self bounds];
  double v8 = v7 + 1.0;
  [(COSInstallSpinnerButton *)self bounds];
  -[UIImageView setFrame:](self->_spinnerView, "setFrame:", v4, v6, v8, v9 + 1.0);
  [(COSInstallSpinnerButton *)self bounds];
  -[UIView setFrame:](self->_squareView, "setFrame:");
  progressIndicator = self->_progressIndicator;
  if (progressIndicator)
  {
    [(SKUICircleProgressIndicator *)progressIndicator center];
  }
  else
  {
    double v12 = 14.5;
    double v11 = 14.5;
  }
  -[UIView setCenter:](self->_squareView, "setCenter:", v11, v12);
}

- (void)showProgressAnimation
{
  [(SKUICircleProgressIndicator *)self->_progressIndicator progress];
  if (v3 == 0.0)
  {
    [(SKUICircleProgressIndicator *)self->_progressIndicator setHidden:1];
    double v4 = [(UIImageView *)self->_spinnerView layer];
    double v5 = [v4 animationForKey:@"COSRotationAnimationKey"];

    if (!v5)
    {
      double v6 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
      LODWORD(v7) = 1095307227;
      double v8 = +[NSNumber numberWithFloat:v7];
      [v6 setToValue:v8];

      [v6 setDuration:2.0];
      [v6 setCumulative:1];
      LODWORD(v9) = 2139095040;
      [v6 setRepeatCount:v9];
      [v6 setRemovedOnCompletion:0];
      [v6 setFrameInterval:0.0333333333];
      v10 = [(UIImageView *)self->_spinnerView layer];
      [v10 addAnimation:v6 forKey:@"COSRotationAnimationKey"];
    }
    [(UIImageView *)self->_spinnerView setHidden:0];
    self->_showingSpinner = 1;
  }
  else
  {
    [(COSInstallSpinnerButton *)self stopSpinnerView];
  }
}

- (void)stopSpinnerView
{
  if (self->_showingSpinner)
  {
    self->_showingSpinner = 0;
    double v3 = [(UIImageView *)self->_spinnerView layer];
    [v3 removeAnimationForKey:@"COSRotationAnimationKey"];
  }
  [(UIImageView *)self->_spinnerView setHidden:1];
  progressIndicator = self->_progressIndicator;

  [(SKUICircleProgressIndicator *)progressIndicator setHidden:0];
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 > 0.0 && self->_showingSpinner) {
    [(COSInstallSpinnerButton *)self stopSpinnerView];
  }
  if (a3 > 0.0) {
    [(COSInstallSpinnerButton *)self prepareProgressIndicatorIfNeeded];
  }
  progressIndicator = self->_progressIndicator;

  [(SKUICircleProgressIndicator *)progressIndicator setProgress:v4 animated:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_squareView, 0);

  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end