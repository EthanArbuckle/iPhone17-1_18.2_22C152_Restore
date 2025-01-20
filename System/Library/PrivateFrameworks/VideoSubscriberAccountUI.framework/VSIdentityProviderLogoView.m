@interface VSIdentityProviderLogoView
- (CGRect)_imageViewFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)logo;
- (UIImageView)imageView;
- (VSIdentityProviderLogoView)initWithCoder:(id)a3;
- (VSIdentityProviderLogoView)initWithFrame:(CGRect)a3;
- (double)_height;
- (double)marginLength;
- (void)layoutSubviews;
- (void)setImageView:(id)a3;
- (void)setLogo:(id)a3;
@end

@implementation VSIdentityProviderLogoView

- (VSIdentityProviderLogoView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderLogoView;
  v3 = -[VSIdentityProviderLogoView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    commonInit_4(v3);
  }
  return v4;
}

- (VSIdentityProviderLogoView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderLogoView;
  v3 = [(VSIdentityProviderLogoView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    commonInit_4(v3);
  }
  return v4;
}

- (CGRect)_imageViewFrame
{
  [(VSIdentityProviderLogoView *)self marginLength];
  CGFloat v4 = v3;
  [(VSIdentityProviderLogoView *)self bounds];
  return CGRectInset(*(CGRect *)&v5, v4, v4);
}

- (double)_height
{
  return 133.0;
}

- (void)setLogo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VSIdentityProviderLogoView *)self imageView];
  [v5 setImage:v4];

  [(VSIdentityProviderLogoView *)self invalidateIntrinsicContentSize];
}

- (UIImage)logo
{
  v2 = [(VSIdentityProviderLogoView *)self imageView];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (double)marginLength
{
  return 30.0;
}

- (CGSize)preferredImageSize
{
  [(VSIdentityProviderLogoView *)self _imageViewFrame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(VSIdentityProviderLogoView *)self _height];
  double v4 = v3;
  double v5 = [(VSIdentityProviderLogoView *)self logo];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  if (v7 == *MEMORY[0x263F001B0] && v9 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(VSIdentityProviderLogoView *)self preferredImageSize];
    double v11 = v12;
  }
  else
  {
    double v11 = v4 * v7 / v9;
  }
  [(VSIdentityProviderLogoView *)self marginLength];
  double v14 = v11 + v13 + v13;
  double v15 = v4;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderLogoView;
  [(VSIdentityProviderLogoView *)&v4 layoutSubviews];
  double v3 = [(VSIdentityProviderLogoView *)self imageView];
  [(VSIdentityProviderLogoView *)self _imageViewFrame];
  objc_msgSend(v3, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(VSIdentityProviderLogoView *)self _height];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end