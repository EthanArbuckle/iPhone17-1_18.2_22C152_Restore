@interface UITabBarSwappableImageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UITabBarSwappableImageView)initWithImage:(id)a3 alternateImage:(id)a4 landscapeImage:(id)a5 landscapeAlternateImage:(id)a6;
- (id)_selectedCompactImage;
- (id)_selectedImage;
- (id)_unselectedCompactImage;
- (id)_unselectedImage;
- (void)setAlternateImage:(id)a3;
- (void)setCurrentImage;
- (void)setImage:(id)a3;
- (void)setLandscape:(BOOL)a3;
- (void)showAlternateImage:(BOOL)a3;
@end

@implementation UITabBarSwappableImageView

- (UITabBarSwappableImageView)initWithImage:(id)a3 alternateImage:(id)a4 landscapeImage:(id)a5 landscapeAlternateImage:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)UITabBarSwappableImageView;
  v15 = -[UIImageView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_value, a3);
    objc_storeStrong((id *)&v16->_alternate, a4);
    objc_storeStrong((id *)&v16->_landscapeValue, a5);
    objc_storeStrong((id *)&v16->_landscapeAlternate, a6);
    [(UIView *)v16 setOpaque:0];
    [(UITabBarSwappableImageView *)v16 setCurrentImage];
    [(UIImageView *)v16 setContentMode:1];
  }
  [(UIImageView *)v16 _setDefaultRenderingMode:2];

  return v16;
}

- (void)setCurrentImage
{
  if (self->_showLandscape)
  {
    if (self->_showAlternate) {
      v3 = &OBJC_IVAR___UITabBarSwappableImageView__alternate;
    }
    else {
      v3 = &OBJC_IVAR___UITabBarSwappableImageView__value;
    }
    uint64_t v4 = v3[2];
  }
  else
  {
    v3 = &OBJC_IVAR___UITabBarSwappableImageView__value;
    if (!self->_showAlternate)
    {
LABEL_9:
      v5 = *(Class *)((char *)&self->super.super.super.super.isa + *v3);
      goto LABEL_10;
    }
    uint64_t v4 = 512;
  }
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + v4);
  if (!v5) {
    goto LABEL_9;
  }
LABEL_10:
  id v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)UITabBarSwappableImageView;
  [(UIImageView *)&v7 setImage:v6];
}

- (void)showAlternateImage:(BOOL)a3
{
  if (self->_showAlternate != a3) {
    self->_showAlternate = a3;
  }
  [(UITabBarSwappableImageView *)self setCurrentImage];
}

- (id)_unselectedImage
{
  return self->_value;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (!self->_showLandscape) {
    goto LABEL_8;
  }
  if (self->_showAlternate)
  {
    if (!self->_landscapeAlternate)
    {
      BOOL v6 = [(UIImage *)self->_alternate isSymbolImage];
      double v7 = 20.0;
      double v8 = 20.0;
      if (!v6) {
        goto LABEL_9;
      }
    }
LABEL_8:
    v10.receiver = self;
    v10.super_class = (Class)UITabBarSwappableImageView;
    -[UIImageView sizeThatFits:](&v10, sel_sizeThatFits_, width, height);
    goto LABEL_9;
  }
  if (self->_landscapeValue) {
    goto LABEL_8;
  }
  BOOL v9 = [(UIImage *)self->_value isSymbolImage];
  double v7 = 20.0;
  double v8 = 20.0;
  if (v9) {
    goto LABEL_8;
  }
LABEL_9:
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setLandscape:(BOOL)a3
{
  if (self->_showLandscape != a3) {
    self->_showLandscape = a3;
  }
  [(UITabBarSwappableImageView *)self setCurrentImage];
}

- (id)_unselectedCompactImage
{
  return self->_alternate;
}

- (id)_selectedImage
{
  return self->_landscapeValue;
}

- (id)_selectedCompactImage
{
  return self->_landscapeAlternate;
}

- (void)setAlternateImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_alternate != v5) {
    objc_storeStrong((id *)&self->_alternate, a3);
  }
  [(UITabBarSwappableImageView *)self setCurrentImage];
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_value != v5) {
    objc_storeStrong((id *)&self->_value, a3);
  }
  [(UITabBarSwappableImageView *)self setCurrentImage];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeAlternate, 0);
  objc_storeStrong((id *)&self->_landscapeValue, 0);
  objc_storeStrong((id *)&self->_alternate, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end