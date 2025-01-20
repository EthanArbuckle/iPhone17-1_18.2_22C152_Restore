@interface REUpNextImageView
- (BOOL)_hasMultipartImages;
- (CGSize)intrinsicContentSize;
- (CLKImageProvider)imageProvider;
- (REUpNextImageView)initWithFrame:(CGRect)a3;
- (UIColor)fallbackTintColor;
- (UIImage)overrideImage;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
- (void)setFallbackTintColor:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setOverrideImage:(id)a3;
@end

@implementation REUpNextImageView

- (REUpNextImageView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)REUpNextImageView;
  v3 = -[REUpNextImageView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    foregroundImageView = v3->_foregroundImageView;
    v3->_foregroundImageView = (UIImageView *)v9;

    [(UIImageView *)v3->_foregroundImageView setContentMode:4];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v5, v6, v7, v8);
    foregroundAccentImageView = v3->_foregroundAccentImageView;
    v3->_foregroundAccentImageView = (UIImageView *)v11;

    [(UIImageView *)v3->_foregroundAccentImageView setContentMode:4];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v5, v6, v7, v8);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = (UIImageView *)v13;

    [(UIImageView *)v3->_backgroundImageView setContentMode:4];
    [(REUpNextImageView *)v3 addSubview:v3->_backgroundImageView];
    [(REUpNextImageView *)v3 addSubview:v3->_foregroundImageView];
    [(REUpNextImageView *)v3 addSubview:v3->_foregroundAccentImageView];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  overrideImage = self->_overrideImage;
  if (overrideImage)
  {
    [(UIImage *)overrideImage size];
    if (v4 >= 3.0 || ([(UIImage *)self->_overrideImage size], v5 >= 5.0))
    {
      [(UIImage *)self->_overrideImage size];
      double v7 = v8;
      double v6 = v9;
    }
    else
    {
      double v6 = *MEMORY[0x263F1D7C8];
      double v7 = 2.5;
    }
  }
  else if (self->_imageProvider)
  {
    if ([(REUpNextImageView *)self _hasMultipartImages])
    {
      uint64_t v20 = 0;
      v21 = (double *)&v20;
      uint64_t v22 = 0x3010000000;
      v23 = "";
      long long v24 = *MEMORY[0x263F001B0];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __41__REUpNextImageView_intrinsicContentSize__block_invoke;
      v19[3] = &unk_2644B7EE8;
      v19[4] = &v20;
      v10 = (void (**)(void, void))MEMORY[0x223C2D7E0](v19);
      uint64_t v11 = [(CLKImageProvider *)self->_imageProvider twoPieceImageBackground];
      ((void (**)(void, void *))v10)[2](v10, v11);

      v12 = [(CLKImageProvider *)self->_imageProvider twoPieceImageForeground];
      ((void (**)(void, void *))v10)[2](v10, v12);

      uint64_t v13 = [(CLKImageProvider *)self->_imageProvider foregroundAccentImage];
      ((void (**)(void, void *))v10)[2](v10, v13);

      double v7 = v21[4];
      double v6 = v21[5];

      _Block_object_dispose(&v20, 8);
    }
    else
    {
      v14 = [(CLKImageProvider *)self->_imageProvider onePieceImage];
      [v14 size];
      double v7 = v15;
      double v6 = v16;
    }
  }
  else
  {
    double v7 = *MEMORY[0x263F1D7C8];
    double v6 = *MEMORY[0x263F1D7C8];
  }
  double v17 = v7;
  double v18 = v6;
  result.height = v18;
  result.width = v17;
  return result;
}

void __41__REUpNextImageView_intrinsicContentSize__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  id v4 = a2;
  [v4 size];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v5;
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  [v4 size];
  double v8 = v7;

  if (v6 >= v8) {
    double v9 = v6;
  }
  else {
    double v9 = v8;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v9;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)REUpNextImageView;
  [(REUpNextImageView *)&v6 layoutSubviews];
  foregroundAccentImageView = self->_foregroundAccentImageView;
  [(REUpNextImageView *)self bounds];
  -[UIImageView setFrame:](foregroundAccentImageView, "setFrame:");
  foregroundImageView = self->_foregroundImageView;
  [(REUpNextImageView *)self bounds];
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
  backgroundImageView = self->_backgroundImageView;
  [(REUpNextImageView *)self bounds];
  -[UIImageView setFrame:](backgroundImageView, "setFrame:");
}

- (BOOL)_hasMultipartImages
{
  double v3 = [(CLKImageProvider *)self->_imageProvider twoPieceImageBackground];
  if (v3)
  {
    id v4 = [(CLKImageProvider *)self->_imageProvider twoPieceImageForeground];
    if (v4)
    {
      BOOL v5 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_super v6 = [(CLKImageProvider *)self->_imageProvider foregroundAccentImage];
  BOOL v5 = v6 != 0;

  if (v3)
  {
    id v4 = 0;
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)setImageProvider:(id)a3
{
  BOOL v5 = (CLKImageProvider *)a3;
  p_imageProvider = &self->_imageProvider;
  if (self->_imageProvider != v5)
  {
    v21 = v5;
    overrideImage = self->_overrideImage;
    self->_overrideImage = 0;

    objc_storeStrong((id *)&self->_imageProvider, a3);
    BOOL v8 = [(REUpNextImageView *)self _hasMultipartImages];
    [(UIImageView *)self->_backgroundImageView setHidden:0];
    foregroundImageView = self->_foregroundImageView;
    if (v8)
    {
      [(UIImageView *)foregroundImageView setHidden:0];
      [(UIImageView *)self->_foregroundAccentImageView setHidden:0];
      v10 = self->_foregroundImageView;
      uint64_t v11 = [(CLKImageProvider *)*p_imageProvider twoPieceImageForeground];
      v12 = [v11 imageWithRenderingMode:2];
      [(UIImageView *)v10 setImage:v12];

      backgroundImageView = self->_backgroundImageView;
      v14 = [(CLKImageProvider *)*p_imageProvider twoPieceImageBackground];
      double v15 = [v14 imageWithRenderingMode:2];
      [(UIImageView *)backgroundImageView setImage:v15];

      foregroundAccentImageView = self->_foregroundAccentImageView;
      double v17 = [(CLKImageProvider *)*p_imageProvider foregroundAccentImage];
      double v18 = v17;
      uint64_t v19 = 1;
    }
    else
    {
      [(UIImageView *)foregroundImageView setHidden:1];
      [(UIImageView *)self->_foregroundAccentImageView setHidden:1];
      foregroundAccentImageView = self->_backgroundImageView;
      double v17 = [(CLKImageProvider *)*p_imageProvider onePieceImage];
      double v18 = v17;
      uint64_t v19 = 2;
    }
    uint64_t v20 = [v17 imageWithRenderingMode:v19];
    [(UIImageView *)foregroundAccentImageView setImage:v20];

    [(REUpNextImageView *)self _updateColors];
    [(REUpNextImageView *)self invalidateIntrinsicContentSize];
    BOOL v5 = v21;
  }
}

- (void)setOverrideImage:(id)a3
{
  BOOL v5 = (UIImage *)a3;
  if (self->_overrideImage != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_overrideImage, a3);
    imageProvider = self->_imageProvider;
    self->_imageProvider = 0;

    [(UIImageView *)self->_foregroundImageView setHidden:1];
    [(UIImageView *)self->_backgroundImageView setHidden:1];
    [(UIImageView *)self->_foregroundAccentImageView setHidden:0];
    [(UIImageView *)self->_foregroundAccentImageView setImage:self->_overrideImage];
    [(REUpNextImageView *)self invalidateIntrinsicContentSize];
    BOOL v5 = v7;
  }
}

- (void)_updateColors
{
  double v3 = [(CLKImageProvider *)self->_imageProvider tintColor];
  fallbackTintColor = v3;
  if (v3 || (fallbackTintColor = self->_fallbackTintColor) != 0)
  {
    BOOL v5 = fallbackTintColor;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F1C550] whiteColor];
  }
  BOOL v8 = v5;

  foregroundImageView = self->_foregroundImageView;
  double v7 = [MEMORY[0x263F1C550] whiteColor];
  [(UIImageView *)foregroundImageView setTintColor:v7];

  [(UIImageView *)self->_backgroundImageView setTintColor:v8];
}

- (void)setContentMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REUpNextImageView;
  -[REUpNextImageView setContentMode:](&v5, sel_setContentMode_);
  [(UIImageView *)self->_foregroundImageView setContentMode:a3];
  [(UIImageView *)self->_backgroundImageView setContentMode:a3];
  [(UIImageView *)self->_foregroundAccentImageView setContentMode:a3];
}

- (UIColor)fallbackTintColor
{
  return self->_fallbackTintColor;
}

- (void)setFallbackTintColor:(id)a3
{
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_fallbackTintColor, 0);
  objc_storeStrong((id *)&self->_foregroundAccentImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);

  objc_storeStrong((id *)&self->_foregroundImageView, 0);
}

@end