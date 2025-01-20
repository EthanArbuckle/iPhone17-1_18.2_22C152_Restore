@interface COSLogTransferSpinnerButton
- (COSLogTransferSpinnerButton)initWithFrame:(CGRect)a3;
- (void)cancelDownload:(id)a3;
- (void)layoutSubviews;
- (void)prepareProgressIndicatorIfNeeded;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)setSpecifier:(id)a3;
@end

@implementation COSLogTransferSpinnerButton

- (COSLogTransferSpinnerButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)COSLogTransferSpinnerButton;
  v3 = -[COSLogTransferSpinnerButton initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:0];
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = v4;

    [(COSLogTransferSpinnerButton *)v3 addSubview:v3->_spinnerView];
    [(COSLogTransferSpinnerButton *)v3 setProgress:1 animated:1.0];
  }
  return v3;
}

- (void)prepareProgressIndicatorIfNeeded
{
  if (!self->_progressIndicator)
  {
    [(COSLogTransferSpinnerButton *)self bounds];
    objc_super v7 = (SKUICircleProgressIndicator *)[objc_alloc((Class)SKUICircleProgressIndicator) initWithFrame:v3, v4, v5, v6];
    progressIndicator = self->_progressIndicator;
    self->_progressIndicator = v7;

    [(SKUICircleProgressIndicator *)self->_progressIndicator setAutoresizingMask:18];
    v9 = self->_progressIndicator;
    v10 = +[UIColor clearColor];
    [(SKUICircleProgressIndicator *)v9 setBackgroundColor:v10];

    [(SKUICircleProgressIndicator *)self->_progressIndicator setUserInteractionEnabled:0];
    id v11 = +[UIImage systemImageNamed:@"stop.fill"];
    -[SKUICircleProgressIndicator setImageInsets:](self->_progressIndicator, "setImageInsets:", 0.0, 0.8, 0.0, 0.0);
    [(SKUICircleProgressIndicator *)self->_progressIndicator setImage:v11];
    [(COSLogTransferSpinnerButton *)self addTarget:self action:"cancelDownload:" forEvents:64];
    [(COSLogTransferSpinnerButton *)self addSubview:self->_progressIndicator];
    [(COSLogTransferSpinnerButton *)self layoutIfNeeded];
  }
}

- (void)setSpecifier:(id)a3
{
}

- (void)cancelDownload:(id)a3
{
  double v4 = +[NSNotificationCenter defaultCenter];
  specifier = self->_specifier;
  CFStringRef v7 = @"Specifier";
  v8 = specifier;
  double v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 postNotificationName:@"DiagnosticLogTransferTapped" object:0 userInfo:v6];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)COSLogTransferSpinnerButton;
  [(COSLogTransferSpinnerButton *)&v10 layoutSubviews];
  [(COSLogTransferSpinnerButton *)self bounds];
  double v4 = v3 + -0.5;
  [(COSLogTransferSpinnerButton *)self bounds];
  double v6 = v5 + -0.5;
  [(COSLogTransferSpinnerButton *)self bounds];
  double v8 = v7 + 1.0;
  [(COSLogTransferSpinnerButton *)self bounds];
  -[UIImageView setFrame:](self->_spinnerView, "setFrame:", v4, v6, v8, v9 + 1.0);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 > 0.0) {
    [(COSLogTransferSpinnerButton *)self prepareProgressIndicatorIfNeeded];
  }
  progressIndicator = self->_progressIndicator;

  [(SKUICircleProgressIndicator *)progressIndicator setProgress:v4 animated:a3 / 100.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);

  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end