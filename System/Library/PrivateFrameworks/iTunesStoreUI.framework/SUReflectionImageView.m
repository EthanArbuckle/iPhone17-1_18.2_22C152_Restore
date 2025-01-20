@interface SUReflectionImageView
- (BOOL)nonSquareImage;
- (SUReflectionImageView)init;
- (SUReflectionImageView)initWithReflectionHeight:(double)a3 spacing:(double)a4;
- (double)reflectionSpacing;
- (void)dealloc;
- (void)setImage:(id)a3;
- (void)setNonSquareImage:(BOOL)a3;
- (void)setReflectionAlphaWhenVisible:(double)a3;
- (void)setReflectionSpacing:(double)a3;
- (void)setReflectionVisible:(BOOL)a3;
- (void)setUseImageSize:(BOOL)a3;
@end

@implementation SUReflectionImageView

- (SUReflectionImageView)init
{
  return [(SUReflectionImageView *)self initWithReflectionHeight:15.0 spacing:0.0];
}

- (SUReflectionImageView)initWithReflectionHeight:(double)a3 spacing:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUReflectionImageView;
  result = [(SUReflectionImageView *)&v7 init];
  if (result)
  {
    result->_reflectionAlpha = 1.0;
    result->_reflectionHeight = a3;
    result->_spacing = a4;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUReflectionImageView;
  [(SUReflectionImageView *)&v3 dealloc];
}

- (BOOL)nonSquareImage
{
  return *((unsigned char *)self + 433) & 1;
}

- (void)setImage:(id)a3
{
  imageView = self->_imageView;
  if (imageView)
  {
    [(UIImageView *)imageView setImage:a3];
    [(UIImageView *)self->_imageView setNeedsDisplay];
  }
  else
  {
    v6 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:a3];
    self->_imageView = v6;
    [(UIImageView *)v6 setContentMode:1];
    [(UIImageView *)self->_imageView setUserInteractionEnabled:0];
    [(SUReflectionImageView *)self addSubview:self->_imageView];
  }
  if (self->_useImageSize)
  {
    [(SUReflectionImageView *)self frame];
    double v8 = v7;
    double v10 = v9;
    [(UIImageView *)self->_imageView frame];
    v12 = self;
    double v13 = v8;
    double v14 = v10;
  }
  else
  {
    [(SUReflectionImageView *)self bounds];
    double v16 = v15;
    [(UIImageView *)self->_imageView frame];
    v12 = self->_imageView;
    double v11 = v16;
  }
  objc_msgSend(v12, "setFrame:", v13, v14, v11);
  [(UIImageView *)self->_imageView frame];
  double v19 = v18 + self->_spacing;
  reflection = self->_reflection;
  if (reflection)
  {
    -[SUReflectionView setFrame:](reflection, "setFrame:", 0.0, v19, v17, self->_reflectionHeight);
  }
  else
  {
    v21 = -[SUReflectionView initWithFrame:]([SUReflectionView alloc], "initWithFrame:", 0.0, v19, v17, self->_reflectionHeight);
    self->_reflection = v21;
    [(SUReflectionView *)v21 setAlpha:self->_reflectionAlpha];
    [(SUReflectionView *)self->_reflection setOpaque:0];
    [(SUReflectionView *)self->_reflection setUserInteractionEnabled:0];
    [(SUReflectionImageView *)self addSubview:self->_reflection];
  }
  [(SUReflectionView *)self->_reflection setImage:a3];
  [(SUReflectionView *)self->_reflection setNeedsDisplay];
  [(SUReflectionImageView *)self frame];
  double v23 = v22;
  double v25 = v24;
  [(UIImageView *)self->_imageView frame];
  double v27 = v26;
  [(SUReflectionView *)self->_reflection frame];
  double MaxY = CGRectGetMaxY(v30);

  -[SUReflectionImageView setFrame:](self, "setFrame:", v23, v25, v27, MaxY);
}

- (void)setNonSquareImage:(BOOL)a3
{
  *((unsigned char *)self + 433) = *((unsigned char *)self + 433) & 0xFE | a3;
}

- (void)setReflectionAlphaWhenVisible:(double)a3
{
  self->_double reflectionAlpha = a3;
  [(SUReflectionView *)self->_reflection alpha];
  if (v4 > 0.0)
  {
    reflection = self->_reflection;
    double reflectionAlpha = self->_reflectionAlpha;
    [(SUReflectionView *)reflection setAlpha:reflectionAlpha];
  }
}

- (void)setReflectionVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUReflectionView *)self->_reflection alpha];
  double v6 = v5;
  if (v3)
  {
    double reflectionAlpha = self->_reflectionAlpha;
    if (v6 == reflectionAlpha) {
      return;
    }
  }
  else
  {
    if (v5 == 0.0) {
      return;
    }
    double reflectionAlpha = 0.0;
  }
  reflection = self->_reflection;

  [(SUReflectionView *)reflection setAlpha:reflectionAlpha];
}

- (void)setUseImageSize:(BOOL)a3
{
  self->_useImageSize = a3;
}

- (double)reflectionSpacing
{
  return self->_spacing;
}

- (void)setReflectionSpacing:(double)a3
{
  self->_spacing = a3;
}

@end