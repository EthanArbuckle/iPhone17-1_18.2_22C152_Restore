@interface UIProgressHUD
- (UIProgressHUD)initWithFrame:(CGRect)a3;
- (UIProgressHUD)initWithWindow:(id)a3;
- (void)dealloc;
- (void)done;
- (void)drawRect:(CGRect)a3;
- (void)hide;
- (void)layoutSubviews;
- (void)setFontSize:(int)a3;
- (void)setShowsText:(BOOL)a3;
- (void)setText:(id)a3;
- (void)show:(BOOL)a3;
- (void)showInView:(id)a3;
@end

@implementation UIProgressHUD

- (UIProgressHUD)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)UIProgressHUD;
  v7 = -[UIView initWithFrame:](&v18, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(UIView *)v7 setOpaque:0];
    [(UIView *)v8 setNeedsDisplayOnBoundsChange:1];
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    +[UIActivityIndicatorView defaultSizeForStyle:101];
    v13 = -[UIActivityIndicatorView initWithFrame:]([UIActivityIndicatorView alloc], "initWithFrame:", v9, v10, v11, v12);
    v8->_progressIndicator = v13;
    [(UIActivityIndicatorView *)v13 setActivityIndicatorViewStyle:101];
    [(UIActivityIndicatorView *)v8->_progressIndicator setColor:+[UIColor whiteColor]];
    [(UIView *)v8 addSubview:v8->_progressIndicator];
    v14 = [UILabel alloc];
    v15 = -[UILabel initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v8->_progressMessage = v15;
    [(UILabel *)v15 setTextColor:+[UIColor whiteColor]];
    [(UIView *)v8->_progressMessage setBackgroundColor:0];
    [(UIView *)v8->_progressMessage setOpaque:0];
    [(UILabel *)v8->_progressMessage setNumberOfLines:0];
    [(UILabel *)v8->_progressMessage setTextAlignment:1];
    [(UILabel *)v8->_progressMessage setLineBreakMode:0];
    [(UIView *)v8 addSubview:v8->_progressMessage];
    [(UIProgressHUD *)v8 setText:0];
    [(UIProgressHUD *)v8 setFontSize:24];
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    if (CGRectIsEmpty(v19)) {
      char v16 = 2;
    }
    else {
      char v16 = 6;
    }
    *(unsigned char *)&v8->_progressHUDFlags = *(unsigned char *)&v8->_progressHUDFlags & 0xFB | v16;
  }
  return v8;
}

- (void)setText:(id)a3
{
  progressMessage = self->_progressMessage;
  if (!a3) {
    a3 = _UINSLocalizedStringWithDefaultValue(@"Loading", @"Loading");
  }
  [(UILabel *)progressMessage setText:a3];
  [(UIView *)self setNeedsLayout];
}

- (void)setShowsText:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_progressMessage setHidden:!a3];
  if (v3) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_progressHUDFlags = *(unsigned char *)&self->_progressHUDFlags & 0xFD | v5;
  [(UIView *)self setNeedsLayout];
}

- (void)setFontSize:(int)a3
{
  -[UILabel setFont:](self->_progressMessage, "setFont:", objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:", *(void *)&a3, 24.0));
  [(UIView *)self setNeedsLayout];
}

- (void)drawRect:(CGRect)a3
{
  [(UIView *)self bounds];
  id v3 = +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1);
  [+[UIColor colorWithWhite:0.0 alpha:0.77] set];
  [v3 fill];
}

- (void)layoutSubviews
{
  +[UIActivityIndicatorView defaultSizeForStyle:101];
  double v4 = v3;
  [(UIView *)self frame];
  if ((*(unsigned char *)&self->_progressHUDFlags & 4) != 0)
  {
    double v15 = v5;
    double v16 = v6;
    [(UILabel *)self->_progressMessage textSizeForWidth:v5 + -20.0];
    double v13 = v17;
    double v14 = v18;
  }
  else
  {
    double v30 = v4;
    [[(UIView *)self superview] bounds];
    CGRect v33 = CGRectInset(v32, 20.0, 20.0);
    double x = v33.origin.x;
    double y = v33.origin.y;
    double width = v33.size.width;
    double height = v33.size.height;
    [(UILabel *)self->_progressMessage textSizeForWidth:v33.size.width + -20.0];
    double v13 = v11;
    double v14 = v12;
    if ((*(unsigned char *)&self->_progressHUDFlags & 2) != 0)
    {
      double v19 = v11 + 20.0;
      if (width < v13 + 20.0) {
        double v19 = width;
      }
      double v15 = fmax(v19, 156.0);
      double v20 = v30 + 26.0 + 8.0 + v12 + 25.0;
      if (height < v20) {
        double v20 = height;
      }
      double v16 = fmax(v20, 124.0);
    }
    else
    {
      double v15 = 156.0;
      double v16 = 124.0;
    }
    -[UIView setFrame:](self, "setFrame:", round(x + (width - v15) * 0.5), round(y + (height - v16) * 0.5), v15, v16);
    double v4 = v30;
  }
  p_progressIndicator = (id *)&self->_progressIndicator;
  progressIndicator = self->_progressIndicator;
  if (progressIndicator || (p_progressIndicator = (id *)&self->_doneView, (progressIndicator = self->_doneView) != 0))
  {
    [progressIndicator frame];
    double v24 = round((v15 - v23) * 0.5);
    double v26 = round((v16 - v25) * 0.5);
    if ((*(unsigned char *)&self->_progressHUDFlags & 2) != 0) {
      double v26 = 26.0;
    }
    objc_msgSend(*p_progressIndicator, "setFrame:", v24, v26);
  }
  double v27 = round((v15 - v13) * 0.5);
  double v28 = v15 + -20.0;
  progressMessage = self->_progressMessage;
  if (v13 < v15 + -20.0) {
    double v28 = v13;
  }
  -[UILabel setFrame:](progressMessage, "setFrame:", v27, v4 + 26.0 + 8.0, v28, v14);
}

- (void)showInView:(id)a3
{
  *(unsigned char *)&self->_progressHUDFlags |= 1u;
  [a3 addSubview:self];
  progressIndicator = self->_progressIndicator;
  [(UIActivityIndicatorView *)progressIndicator startAnimating];
}

- (void)hide
{
  *(unsigned char *)&self->_progressHUDFlags &= ~1u;
  [(UIActivityIndicatorView *)self->_progressIndicator stopAnimating];
  [(UIView *)self removeFromSuperview];
}

- (void)done
{
  [(UIView *)self->_progressIndicator removeFromSuperview];

  self->_progressIndicator = 0;
  double v3 = [[UIImageView alloc] initWithImage:_UIImageWithName(@"UIProgressHUDCheck.png")];
  self->_doneView = v3;
  [(UIView *)self addSubview:v3];
  if (*(unsigned char *)&self->_progressHUDFlags)
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)dealloc
{
  if (*(unsigned char *)&self->_progressHUDFlags) {
    [(UIProgressHUD *)self hide];
  }
  [(UIView *)self->_progressIndicator removeFromSuperview];

  [(UIView *)self->_doneView removeFromSuperview];
  [(UIView *)self->_progressMessage removeFromSuperview];

  v3.receiver = self;
  v3.super_class = (Class)UIProgressHUD;
  [(UIView *)&v3 dealloc];
}

- (UIProgressHUD)initWithWindow:(id)a3
{
  double v4 = [(UIView *)self init];
  if (v4) {
    v4->_parentWindow = (UIWindow *)a3;
  }
  return v4;
}

- (void)show:(BOOL)a3
{
  if (a3) {
    [(UIProgressHUD *)self showInView:self->_parentWindow];
  }
  else {
    [(UIProgressHUD *)self hide];
  }
}

@end