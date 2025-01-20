@interface SUUIEmptyContentPlaceholderView
- (BOOL)showsSignInButton;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)placeholderMessage;
- (UIButton)signInButton;
- (UIEdgeInsets)placeholderImageInsets;
- (UIImage)placeholderImage;
- (UILabel)placeholderMessageLabel;
- (void)layoutSubviews;
- (void)maskPlaceholdersInBackdropView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderImageInsets:(UIEdgeInsets)a3;
- (void)setPlaceholderMessage:(id)a3;
- (void)setShowsSignInButton:(BOOL)a3;
@end

@implementation SUUIEmptyContentPlaceholderView

- (void)maskPlaceholdersInBackdropView:(id)a3
{
  if (a3)
  {
    id v10 = a3;
    [v10 removeMaskViews];
    label = self->_label;
    v5 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)label setBackgroundColor:v5];

    [(UILabel *)self->_label setOpaque:0];
    v6 = self->_label;
    v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UILabel *)v6 setTextColor:v7];

    [(UILabel *)self->_label _setBackdropMaskViewFlags:2];
    [v10 updateMaskViewsForView:self->_label];
    [(UIImageView *)self->_imageView setAlpha:0.2];
    imageView = self->_imageView;
    v9 = [MEMORY[0x263F825C8] clearColor];
    [(UIImageView *)imageView setBackgroundColor:v9];

    [(UIImageView *)self->_imageView setOpaque:0];
    [(UIImageView *)self->_imageView _setBackdropMaskViewFlags:2];
    [v10 updateMaskViewsForView:self->_imageView];
  }
}

- (UIImage)placeholderImage
{
  return [(UIImageView *)self->_imageView image];
}

- (NSString)placeholderMessage
{
  return [(UILabel *)self->_label text];
}

- (UILabel)placeholderMessageLabel
{
  label = self->_label;
  if (!label)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v5 = self->_label;
    self->_label = v4;

    v6 = self->_label;
    v7 = [(SUUIEmptyContentPlaceholderView *)self backgroundColor];
    [(UILabel *)v6 setBackgroundColor:v7];

    v8 = self->_label;
    v9 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)self->_label setHidden:1];
    [(UILabel *)self->_label setNumberOfLines:0];
    [(UILabel *)self->_label setTextAlignment:1];
    id v10 = self->_label;
    v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [(UILabel *)v10 setTextColor:v11];

    [(SUUIEmptyContentPlaceholderView *)self addSubview:self->_label];
    label = self->_label;
  }
  return label;
}

- (void)setPlaceholderImage:(id)a3
{
  id v4 = a3;
  imageView = self->_imageView;
  id v9 = v4;
  if (v4)
  {
    if (!imageView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      v7 = self->_imageView;
      self->_imageView = v6;

      [(SUUIEmptyContentPlaceholderView *)self addSubview:self->_imageView];
      imageView = self->_imageView;
    }
    [(UIImageView *)imageView setImage:v9];
    [(UIImageView *)self->_imageView sizeToFit];
    [(SUUIEmptyContentPlaceholderView *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)imageView removeFromSuperview];
    v8 = self->_imageView;
    self->_imageView = 0;
  }
}

- (void)setPlaceholderImageInsets:(UIEdgeInsets)a3
{
  self->_imageInsets = a3;
  [(SUUIEmptyContentPlaceholderView *)self setNeedsLayout];
}

- (void)setPlaceholderMessage:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v4 = [(SUUIEmptyContentPlaceholderView *)self placeholderMessageLabel];
    [v4 setHidden:0];
    [v4 setText:v5];
    [(SUUIEmptyContentPlaceholderView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)self->_label setHidden:1];
    [(UILabel *)self->_label setText:0];
  }
}

- (void)setShowsSignInButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUUIEmptyContentPlaceholderView *)self signInButton];
  [v4 setHidden:!v3];
}

- (UIButton)signInButton
{
  signInButton = self->_signInButton;
  if (!signInButton)
  {
    id v4 = [MEMORY[0x263F824E8] buttonWithType:1];
    id v5 = self->_signInButton;
    self->_signInButton = v4;

    [(UIButton *)self->_signInButton setHidden:1];
    v6 = [(UIButton *)self->_signInButton titleLabel];
    v7 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v6 setFont:v7];

    [(SUUIEmptyContentPlaceholderView *)self addSubview:self->_signInButton];
    signInButton = self->_signInButton;
  }
  return signInButton;
}

- (BOOL)showsSignInButton
{
  signInButton = self->_signInButton;
  if (signInButton) {
    LOBYTE(signInButton) = [(UIButton *)signInButton isHidden] ^ 1;
  }
  return (char)signInButton;
}

- (void)layoutSubviews
{
  [(SUUIEmptyContentPlaceholderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 + -30.0;
  [(UIImageView *)self->_imageView frame];
  double v9 = v8;
  double v11 = v10;
  [(UILabel *)self->_label frame];
  double v12 = v7;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v7, 1.79769313e308);
  double v14 = v13;
  if ([(UIButton *)self->_signInButton isHidden])
  {
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v30 = *MEMORY[0x263F001A8];
    double v31 = *(double *)(MEMORY[0x263F001A8] + 16);
  }
  else
  {
    [(UIButton *)self->_signInButton sizeToFit];
    [(UIButton *)self->_signInButton frame];
    float v17 = (v4 - v16) * 0.5;
    double v30 = floorf(v17);
    double v31 = v16;
  }
  double top = self->_imageInsets.top;
  double v19 = v15 + 20.0;
  double v29 = v15;
  if (v15 <= 0.00000011920929) {
    double v19 = -0.0;
  }
  double v20 = v19 + v14 + v11 + self->_imageInsets.bottom + top;
  float v21 = (v4 - v9) * 0.5;
  CGFloat v22 = floorf(v21);
  *(float *)&double v20 = (v6 - v20) * 0.5;
  double v23 = v11;
  double v24 = v9;
  CGFloat v25 = top + floorf(*(float *)&v20);
  v33.origin.x = v22;
  v33.origin.y = v25;
  v33.size.width = v24;
  v33.size.height = v23;
  CGFloat v26 = CGRectGetMaxY(v33) + self->_imageInsets.bottom;
  v34.origin.x = 15.0;
  v34.origin.y = v26;
  v34.size.width = v7;
  v34.size.height = v14;
  double v27 = CGRectGetMaxY(v34) + 20.0;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v22, v25, v24, v23);
  -[UILabel setFrame:](self->_label, "setFrame:", 15.0, v26, v12, v14);
  signInButton = self->_signInButton;
  -[UIButton setFrame:](signInButton, "setFrame:", v30, v27, v31, v29);
}

- (void)setBackgroundColor:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [(UIImageView *)imageView setBackgroundColor:v5];
  [(UILabel *)self->_label setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIEmptyContentPlaceholderView;
  [(SUUIEmptyContentPlaceholderView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(UIImageView *)self->_imageView frame];
  double v6 = v5;
  double v8 = v7;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width + -30.0, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;
  if ([(UIButton *)self->_signInButton isHidden])
  {
    double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    [(UIButton *)self->_signInButton sizeToFit];
    [(UIButton *)self->_signInButton frame];
  }
  double v14 = v13 + 20.0;
  if (v13 <= 0.00000011920929) {
    double v14 = -0.0;
  }
  double v15 = v14 + v12 + v8 + self->_imageInsets.bottom + self->_imageInsets.top;
  if (v6 >= v10) {
    double v16 = v6;
  }
  else {
    double v16 = v10;
  }
  double v17 = v16 + 30.0;
  result.height = v15;
  result.double width = v17;
  return result;
}

- (UIEdgeInsets)placeholderImageInsets
{
  double top = self->_imageInsets.top;
  double left = self->_imageInsets.left;
  double bottom = self->_imageInsets.bottom;
  double right = self->_imageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end