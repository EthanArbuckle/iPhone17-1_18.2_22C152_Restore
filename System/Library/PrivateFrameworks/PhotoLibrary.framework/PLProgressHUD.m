@interface PLProgressHUD
- (CGSize)sizeThatFits:(CGSize)a3;
- (PLProgressHUD)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)done;
- (void)hide;
- (void)layoutSubviews;
- (void)setText:(id)a3;
- (void)showInView:(id)a3;
@end

@implementation PLProgressHUD

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PLProgressHUD;
  [(PLProgressHUD *)&v14 layoutSubviews];
  [(PLProgressHUD *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [MEMORY[0x1E4F42708] defaultSizeForStyle:100];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v11 = round((v6 - v9) * 0.5);
  -[UIActivityIndicatorView setFrame:](self->_activityIndicatorView, "setFrame:", 15.0, v11, v7, v9);
  v15.origin.x = 15.0;
  v15.origin.y = v11;
  v15.size.width = v8;
  v15.size.height = v10;
  v16.origin.x = CGRectGetMaxX(v15) + 5.0;
  v16.size.width = v4 - v16.origin.x + -15.0;
  v16.origin.y = 0.0;
  v16.size.height = v6;
  CGRect v17 = CGRectIntegral(v16);
  -[UILabel setFrame:](self->_label, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  [[(UIImageView *)self->_checkmarkView image] size];
  v18.size.width = v12;
  v18.size.height = v13;
  v18.origin.x = 18.0;
  v18.origin.y = 18.0;
  CGRect v19 = CGRectIntegral(v18);
  -[UIImageView setFrame:](self->_checkmarkView, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [MEMORY[0x1E4F42708] defaultSizeForStyle:100];
  double v7 = v6;
  double v9 = v8;
  if ([(NSString *)[(UILabel *)self->_label text] length])
  {
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
    double v12 = v11 + 5.0;
  }
  else
  {
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v12 = 0.0;
  }
  double v13 = ceil(v7 + 15.0 + v12 + 15.0);
  if (v9 >= v10) {
    double v10 = v9;
  }
  double v14 = ceil(v10 + 15.0 + 15.0);
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)done
{
  [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
  [(UIActivityIndicatorView *)self->_activityIndicatorView removeFromSuperview];

  self->_activityIndicatorView = 0;
  double v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithImage:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42A80], "imageNamed:inBundle:", @"PLProgressHUDCheckmark", PLPhotoLibraryFrameworkBundle()), "_flatImageWithColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.0, 0.65)));
  self->_checkmarkView = v3;
  [(PLProgressHUD *)self addSubview:v3];
  if (self->_isShowing)
  {
    [(PLProgressHUD *)self setNeedsLayout];
  }
}

- (void)hide
{
  self->_isShowing = 0;
  [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
  [(PLProgressHUD *)self removeFromSuperview];
}

- (void)showInView:(id)a3
{
  self->_isShowing = 1;
  [a3 addSubview:self];
  [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
  [a3 bounds];
  double v6 = v5;
  double v8 = v7;
  -[PLProgressHUD sizeThatFits:](self, "sizeThatFits:", v5, v7);
  v12.size.double width = v9;
  v12.size.double height = v10;
  v12.origin.x = (v6 - v9) * 0.5;
  v12.origin.y = (v8 - v10) * 0.5;
  CGRect v13 = CGRectIntegral(v12);
  -[PLProgressHUD setFrame:](self, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  [(PLProgressHUD *)self setAutoresizingMask:45];
}

- (void)setText:(id)a3
{
  [(UILabel *)self->_label setText:a3];
  [(PLProgressHUD *)self setNeedsLayout];
}

- (void)dealloc
{
  if (self->_isShowing) {
    [(PLProgressHUD *)self hide];
  }

  v3.receiver = self;
  v3.super_class = (Class)PLProgressHUD;
  [(PLProgressHUD *)&v3 dealloc];
}

- (PLProgressHUD)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PLProgressHUD;
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v7 = -[PLProgressHUD initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v4, v5, v6);
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2020];
    v7->_backdropView = (_UIBackdropView *)v8;
    [(PLProgressHUD *)v7 addSubview:v8];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "scale");
    CGFloat v10 = v9;
    v19.double width = 16.0;
    v19.double height = 16.0;
    UIGraphicsBeginImageContextWithOptions(v19, 0, v10);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.double width = 16.0;
    v20.size.double height = 16.0;
    CGContextAddRect(CurrentContext, v20);
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, 0.0, 0.0, 16.0, 16.0, 7.0, 7.0), "CGPath"));
    CGContextEOClip(CurrentContext);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.double width = 16.0;
    v21.size.double height = 16.0;
    UIRectFill(v21);
    CGContextRestoreGState(CurrentContext);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    uint64_t v13 = -[UIImage resizableImageWithCapInsets:](ImageFromCurrentImageContext, "resizableImageWithCapInsets:", 7.0, 7.0, 7.0, 7.0);
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v13];
    [v14 setAlpha:0.0];
    [v14 _setBackdropMaskViewFlags:7];
    [v14 setAutoresizingMask:18];
    objc_msgSend((id)-[_UIBackdropView contentView](v7->_backdropView, "contentView"), "bounds");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend((id)-[_UIBackdropView contentView](v7->_backdropView, "contentView"), "addSubview:", v14);

    CGRect v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v3, v4, v5, v6);
    v7->_label = v15;
    -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
    -[UILabel setTextColor:](v7->_label, "setTextColor:", [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5]);
    -[UILabel setFont:](v7->_label, "setFont:", [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0]);
    [(PLProgressHUD *)v7 addSubview:v7->_label];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    v7->_activityIndicatorView = (UIActivityIndicatorView *)v16;
    [(PLProgressHUD *)v7 addSubview:v16];
    [(PLProgressHUD *)v7 setOpaque:0];
    [(PLProgressHUD *)v7 setNeedsDisplay];
    objc_msgSend((id)-[PLProgressHUD layer](v7, "layer"), "setAllowsGroupOpacity:", 0);
  }
  return v7;
}

@end