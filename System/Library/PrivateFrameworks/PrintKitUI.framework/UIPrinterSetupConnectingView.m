@interface UIPrinterSetupConnectingView
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)label;
- (UIPrinterSetupConnectingView)initWithFrame:(CGRect)a3;
- (double)presentationTime;
- (void)layoutSubviews;
- (void)presentView;
- (void)setActivityIndicator:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMessage:(id)a3 active:(BOOL)a4;
- (void)setPresentationTime:(double)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation UIPrinterSetupConnectingView

- (UIPrinterSetupConnectingView)initWithFrame:(CGRect)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)UIPrinterSetupConnectingView;
  v3 = -[UIPrinterSetupConnectingView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.75];
    [(UIPrinterSetupConnectingView *)v3 setBackgroundColor:v4];

    [(UIPrinterSetupConnectingView *)v3 setUserInteractionEnabled:0];
    [(UIPrinterSetupConnectingView *)v3 setAutoresizingMask:18];
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v5;

    v7 = [MEMORY[0x1E4FB1798] boldSystemFontOfSize:20.0];
    [(UILabel *)v3->_label setFont:v7];

    v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v3->_label setTextColor:v8];

    [(UILabel *)v3->_label setTextAlignment:1];
    -[UILabel setShadowOffset:](v3->_label, "setShadowOffset:", 0.0, 1.0);
    v9 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v3->_label setShadowColor:v9];

    [(UILabel *)v3->_label setBackgroundColor:0];
    [(UILabel *)v3->_label setOpaque:0];
    [(UILabel *)v3->_label setNumberOfLines:0];
    [(UILabel *)v3->_label setPreferredMaxLayoutWidth:0.0];
    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v10;

    [(UIActivityIndicatorView *)v3->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPrinterSetupConnectingView *)v3 addSubview:v3->_label];
    [(UIPrinterSetupConnectingView *)v3 addSubview:v3->_activityIndicator];
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPrinterSetupConnectingView *)v3 addSubview:v12];
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPrinterSetupConnectingView *)v3 addSubview:v13];
    v20[0] = @"label";
    v21[0] = v3->_label;
    v20[1] = @"activityIndicator";
    v21[1] = v3->_activityIndicator;
    v21[2] = v12;
    v20[2] = @"spacer1";
    v20[3] = @"spacer2";
    v21[3] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    v15 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[label]-|" options:0 metrics:0 views:v14];
    [(UIPrinterSetupConnectingView *)v3 addConstraints:v15];

    v16 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[activityIndicator]-|" options:0 metrics:0 views:v14];
    [(UIPrinterSetupConnectingView *)v3 addConstraints:v16];

    v17 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[spacer1][label]-20-[activityIndicator][spacer2(==spacer1)]|" options:0 metrics:0 views:v14];
    [(UIPrinterSetupConnectingView *)v3 addConstraints:v17];

    [(UIActivityIndicatorView *)v3->_activityIndicator startAnimating];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(UILabel *)self->_label setPreferredMaxLayoutWidth:0.0];
  v5.receiver = self;
  v5.super_class = (Class)UIPrinterSetupConnectingView;
  [(UIPrinterSetupConnectingView *)&v5 layoutSubviews];
  [(UILabel *)self->_label bounds];
  [(UILabel *)self->_label setPreferredMaxLayoutWidth:v3];
  v4.receiver = self;
  v4.super_class = (Class)UIPrinterSetupConnectingView;
  [(UIPrinterSetupConnectingView *)&v4 layoutSubviews];
}

- (void)presentView
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_presentationTime = v3;
  [(UIPrinterSetupConnectingView *)self setHidden:0];
}

- (void)willMoveToSuperview:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(UIPrinterSetupConnectingView *)self superview];

  if (v8 || !v4)
  {
    v7 = [(UIPrinterSetupConnectingView *)self superview];

    if (v8 && !v7)
    {
      [v8 setUserInteractionEnabled:0];
      [(UIPrinterSetupConnectingView *)self setHidden:1];
      [(UIPrinterSetupConnectingView *)self performSelector:sel_presentView withObject:0 afterDelay:0.5];
    }
  }
  else
  {
    [0 setUserInteractionEnabled:1];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_presentView object:0];
    if (([(UIPrinterSetupConnectingView *)self isHidden] & 1) == 0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v6 = v5 - self->_presentationTime;
      if (v6 < 1.0) {
        usleep(((1.0 - v6) * 1000000.0));
      }
    }
  }
}

- (void)setMessage:(id)a3 active:(BOOL)a4
{
  if (a4) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  activityIndicator = self->_activityIndicator;
  id v8 = a3;
  [(UIActivityIndicatorView *)activityIndicator setAlpha:v6];
  [(UILabel *)self->_label setText:v8];

  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E4FBA8A8];
    [v9 cancelPreviousPerformRequestsWithTarget:self selector:sel_presentView object:0];
  }
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (double)presentationTime
{
  return self->_presentationTime;
}

- (void)setPresentationTime:(double)a3
{
  self->_presentationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end