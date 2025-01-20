@interface NTKUpNextImageView
- (BOOL)_hasMultipartImages;
- (CGRect)contentsLayerBoundsForLayout:(id)a3;
- (CGSize)intrinsicContentSize;
- (CLKImageProvider)imageProvider;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSString)compositingFilter;
- (NTKUpNextImageView)initWithFrame:(CGRect)a3 parentCell:(id)a4;
- (UIColor)fallbackTintColor;
- (UIImage)overrideImage;
- (id)contentsLayer;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setCompositingFilter:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setFallbackTintColor:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setFullColorImage:(id)a3 tintableImageProvider:(id)a4;
- (void)setImageProvider:(id)a3;
- (void)setOverrideImage:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKUpNextImageView

- (NTKUpNextImageView)initWithFrame:(CGRect)a3 parentCell:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)NTKUpNextImageView;
  v10 = -[NTKUpNextImageView initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_parentCell, v9);
    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
    foregroundImageView = v11->_foregroundImageView;
    v11->_foregroundImageView = (UIImageView *)v17;

    [(UIImageView *)v11->_foregroundImageView setContentMode:4];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v13, v14, v15, v16);
    foregroundAccentImageView = v11->_foregroundAccentImageView;
    v11->_foregroundAccentImageView = (UIImageView *)v19;

    [(UIImageView *)v11->_foregroundAccentImageView setContentMode:4];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v13, v14, v15, v16);
    backgroundImageView = v11->_backgroundImageView;
    v11->_backgroundImageView = (UIImageView *)v21;

    [(UIImageView *)v11->_backgroundImageView setContentMode:4];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v13, v14, v15, v16);
    overrideImageView = v11->_overrideImageView;
    v11->_overrideImageView = (UIImageView *)v23;

    [(UIImageView *)v11->_overrideImageView setContentMode:4];
    [(NTKUpNextImageView *)v11 addSubview:v11->_backgroundImageView];
    [(NTKUpNextImageView *)v11 addSubview:v11->_foregroundImageView];
    [(NTKUpNextImageView *)v11 addSubview:v11->_foregroundAccentImageView];
    [(NTKUpNextImageView *)v11 addSubview:v11->_overrideImageView];
    uint64_t v25 = objc_opt_new();
    foregroundAccentBackdrop = v11->_foregroundAccentBackdrop;
    v11->_foregroundAccentBackdrop = (CALayer *)v25;

    v27 = [(NTKUpNextImageView *)v11 layer];
    [v27 insertSublayer:v11->_foregroundAccentBackdrop atIndex:0];

    [v9 addContentsLayerProvider:v11];
    v28 = [(NTKUpNextImageView *)v11 layer];
    [v28 setAllowsGroupBlending:0];
  }
  return v11;
}

- (void)setCompositingFilter:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_compositingFilter, a3);
  [(CALayer *)self->_foregroundAccentBackdrop setHidden:self->_compositingFilter == 0];
  v5 = [(UIImageView *)self->_foregroundAccentImageView layer];
  v6 = v5;
  if (v11)
  {
    v7 = [MEMORY[0x1E4F39BC0] filterWithType:v11];
    [v6 setCompositingFilter:v7];
  }
  else
  {
    [v5 setCompositingFilter:0];
  }

  v8 = [(UIImageView *)self->_backgroundImageView layer];
  id v9 = v8;
  if (v11)
  {
    v10 = [MEMORY[0x1E4F39BC0] filterWithType:v11];
    [v9 setCompositingFilter:v10];
  }
  else
  {
    [v8 setCompositingFilter:0];
  }
}

- (id)contentsLayer
{
  return self->_foregroundAccentBackdrop;
}

- (CGRect)contentsLayerBoundsForLayout:(id)a3
{
  [a3 unitFrameOnScreen];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCell);
  [WeakRetained bounds];
  double v14 = v13;
  double v16 = v15;

  [(NTKUpNextImageView *)self frame];
  double v18 = v5 + v17 / v14 * v9;
  double v20 = v7 + v19 / v16 * v11;
  double v22 = v9 * (v21 / v14);
  double v24 = v11 * (v23 / v16);
  result.size.double height = v24;
  result.size.double width = v22;
  result.origin.double y = v20;
  result.origin.double x = v18;
  return result;
}

- (CGSize)intrinsicContentSize
{
  overrideImage = self->_overrideImage;
  if (!overrideImage)
  {
    if (!self->_imageProvider)
    {
      double v5 = *MEMORY[0x1E4FB30D8];
      double v7 = *MEMORY[0x1E4FB30D8];
      goto LABEL_12;
    }
    uint64_t v20 = 0;
    double v21 = (double *)&v20;
    uint64_t v22 = 0x3010000000;
    double v23 = &unk_1BC8E8B0B;
    long long v24 = *MEMORY[0x1E4F1DB30];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__NTKUpNextImageView_intrinsicContentSize__block_invoke;
    aBlock[3] = &unk_1E62C1418;
    aBlock[4] = &v20;
    double v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v9 = [(UIImageView *)self->_backgroundImageView image];
      v8[2](v8, v9);

      double v10 = [(UIImageView *)self->_foregroundImageView image];
      v8[2](v8, v10);

      double v11 = [(UIImageView *)self->_foregroundAccentImageView image];
      v8[2](v8, v11);
    }
    else
    {
      if (![(NTKUpNextImageView *)self _hasMultipartImages])
      {
        double v14 = [(CLKImageProvider *)self->_imageProvider onePieceImage];
        [v14 size];
        double v5 = v15;
        double v7 = v16;

        goto LABEL_11;
      }
      id v12 = [(CLKImageProvider *)self->_imageProvider twoPieceImageBackground];
      v8[2](v8, v12);

      double v13 = [(CLKImageProvider *)self->_imageProvider twoPieceImageForeground];
      v8[2](v8, v13);

      double v11 = [(CLKImageProvider *)self->_imageProvider foregroundAccentImage];
      v8[2](v8, v11);
    }

    double v5 = v21[4];
    double v7 = v21[5];
LABEL_11:

    _Block_object_dispose(&v20, 8);
    goto LABEL_12;
  }
  [(UIImage *)overrideImage size];
  double v5 = v4;
  double v7 = v6;
LABEL_12:
  double v17 = v5;
  double v18 = v7;
  result.double height = v18;
  result.double width = v17;
  return result;
}

void __42__NTKUpNextImageView_intrinsicContentSize__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
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
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKUpNextImageView;
  [(NTKUpNextImageView *)&v8 layoutSubviews];
  overrideImageView = self->_overrideImageView;
  [(NTKUpNextImageView *)self bounds];
  -[UIImageView setFrame:](overrideImageView, "setFrame:");
  foregroundAccentImageView = self->_foregroundAccentImageView;
  [(NTKUpNextImageView *)self bounds];
  -[UIImageView setFrame:](foregroundAccentImageView, "setFrame:");
  foregroundImageView = self->_foregroundImageView;
  [(NTKUpNextImageView *)self bounds];
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
  backgroundImageView = self->_backgroundImageView;
  [(NTKUpNextImageView *)self bounds];
  -[UIImageView setFrame:](backgroundImageView, "setFrame:");
  foregroundAccentBackdrop = self->_foregroundAccentBackdrop;
  [(NTKUpNextImageView *)self bounds];
  -[CALayer setFrame:](foregroundAccentBackdrop, "setFrame:");
}

- (BOOL)_hasMultipartImages
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  imageProvider = self->_imageProvider;
  if ((isKindOfClass & 1) == 0)
  {
    double v6 = [(CLKImageProvider *)imageProvider twoPieceImageBackground];
    if (v6
      && ([(CLKImageProvider *)self->_imageProvider twoPieceImageForeground],
          (double v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      BOOL v8 = 1;
    }
    else
    {
      double v9 = [(CLKImageProvider *)self->_imageProvider foregroundAccentImage];
      BOOL v8 = v9 != 0;

      if (!v6)
      {
LABEL_11:

        return v8;
      }
      double v7 = 0;
    }

    goto LABEL_11;
  }
  return [(CLKImageProvider *)imageProvider isTwoPiece];
}

- (void)setFullColorImage:(id)a3 tintableImageProvider:(id)a4
{
  id v6 = a3;
  [(NTKUpNextImageView *)self setImageProvider:a4];
  [(NTKUpNextImageView *)self setOverrideImage:v6];

  [(NTKUpNextImageView *)self invalidateIntrinsicContentSize];
}

- (void)setImageProvider:(id)a3
{
  v43 = (CLKImageProvider *)a3;
  double v5 = [(UIImageView *)self->_backgroundImageView layer];
  [v5 setFilters:0];

  id v6 = [(UIImageView *)self->_foregroundImageView layer];
  [v6 setFilters:0];

  double v7 = [(UIImageView *)self->_foregroundAccentImageView layer];
  [v7 setFilters:0];

  BOOL v8 = [(UIImageView *)self->_overrideImageView layer];
  [v8 setFilters:0];

  double v9 = v43;
  p_imageProvider = &self->_imageProvider;
  if (self->_imageProvider != v43)
  {
    objc_storeStrong((id *)&self->_imageProvider, a3);
    double v9 = v43;
    if (v43)
    {
      [(UIImageView *)self->_overrideImageView setHidden:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v11 = v43;
        id v12 = [(CLKImageProvider *)*p_imageProvider tintColor];
        fallbackTintColor = v12;
        if (v12 || (fallbackTintColor = self->_fallbackTintColor) != 0)
        {
          double v14 = fallbackTintColor;
        }
        else
        {
          double v14 = [MEMORY[0x1E4FB1618] whiteColor];
        }
        double v15 = v14;

        if ([(CLKImageProvider *)v11 isTwoPiece])
        {
          double v16 = [(CLKImageProvider *)v11 createSymbolImageForType:3 color:v15];
          double v17 = [MEMORY[0x1E4FB1618] whiteColor];
          double v18 = [(CLKImageProvider *)v11 createSymbolImageForType:2 color:v17];

          [(UIImageView *)self->_foregroundImageView setHidden:0];
          [(UIImageView *)self->_backgroundImageView setHidden:0];
          [(UIImageView *)self->_foregroundAccentImageView setHidden:1];
          [(UIImageView *)self->_foregroundImageView setImage:v18];
          backgroundImageView = self->_backgroundImageView;
          uint64_t v20 = [v16 imageWithRenderingMode:2];
          [(UIImageView *)backgroundImageView setImage:v20];
        }
        else
        {
          [(UIImageView *)self->_backgroundImageView setHidden:0];
          [(UIImageView *)self->_foregroundImageView setHidden:1];
          [(UIImageView *)self->_foregroundAccentImageView setHidden:1];
          v32 = self->_backgroundImageView;
          v33 = [(CLKImageProvider *)v11 createSymbolImage];
          [(UIImageView *)v32 setImage:v33];

          [(UIImageView *)self->_foregroundImageView setImage:0];
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCell);
        v35 = [WeakRetained device];
        [v35 screenScale];
        double v37 = v36;
        v38 = [(NTKUpNextImageView *)self layer];
        [v38 setRasterizationScale:v37];

        v39 = [(NTKUpNextImageView *)self layer];
        [v39 setShouldRasterize:1];
      }
      else
      {
        BOOL v21 = [(NTKUpNextImageView *)self _hasMultipartImages];
        [(UIImageView *)self->_backgroundImageView setHidden:0];
        foregroundImageView = self->_foregroundImageView;
        if (v21)
        {
          [(UIImageView *)foregroundImageView setHidden:0];
          [(UIImageView *)self->_foregroundAccentImageView setHidden:0];
          double v23 = self->_foregroundImageView;
          long long v24 = [(CLKImageProvider *)*p_imageProvider twoPieceImageForeground];
          uint64_t v25 = [v24 imageWithRenderingMode:2];
          [(UIImageView *)v23 setImage:v25];

          v26 = self->_backgroundImageView;
          v27 = [(CLKImageProvider *)*p_imageProvider twoPieceImageBackground];
          v28 = [v27 imageWithRenderingMode:2];
          [(UIImageView *)v26 setImage:v28];

          foregroundAccentImageView = self->_foregroundAccentImageView;
          objc_super v30 = [(CLKImageProvider *)*p_imageProvider foregroundAccentImage];
          v31 = [v30 imageWithRenderingMode:1];
          [(UIImageView *)foregroundAccentImageView setImage:v31];
        }
        else
        {
          [(UIImageView *)foregroundImageView setHidden:1];
          [(UIImageView *)self->_foregroundAccentImageView setHidden:1];
          v40 = self->_backgroundImageView;
          v41 = [(CLKImageProvider *)*p_imageProvider onePieceImage];
          v42 = [v41 imageWithRenderingMode:2];
          [(UIImageView *)v40 setImage:v42];

          [(UIImageView *)self->_foregroundImageView setImage:0];
        }
        double v11 = [(NTKUpNextImageView *)self layer];
        [(CLKImageProvider *)v11 setShouldRasterize:0];
      }

      [(NTKUpNextImageView *)self _updateColors];
      double v9 = v43;
    }
  }
}

- (void)setOverrideImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_overrideImage != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_overrideImage, a3);
    double v5 = v6;
    if (v6)
    {
      [(UIImageView *)self->_foregroundImageView setHidden:1];
      [(UIImageView *)self->_backgroundImageView setHidden:1];
      [(UIImageView *)self->_foregroundAccentImageView setHidden:1];
      [(UIImageView *)self->_overrideImageView setHidden:0];
      [(UIImageView *)self->_overrideImageView setImage:self->_overrideImage];
      double v5 = v6;
    }
  }
}

- (void)_updateColors
{
  double v3 = [(CLKImageProvider *)self->_imageProvider tintColor];
  fallbackTintColor = v3;
  if (v3 || (fallbackTintColor = self->_fallbackTintColor) != 0)
  {
    double v5 = fallbackTintColor;
  }
  else
  {
    double v5 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  double v9 = v5;

  if ([(NTKUpNextImageView *)self _hasMultipartImages]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    foregroundImageView = self->_foregroundImageView;
    double v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)foregroundImageView setTintColor:v7];

    BOOL v8 = &OBJC_IVAR___NTKUpNextImageView__backgroundImageView;
  }
  else
  {
    BOOL v8 = &OBJC_IVAR___NTKUpNextImageView__foregroundImageView;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v8) setTintColor:v9];
}

- (void)setContentMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextImageView;
  -[NTKUpNextImageView setContentMode:](&v5, sel_setContentMode_);
  [(UIImageView *)self->_foregroundImageView setContentMode:a3];
  [(UIImageView *)self->_backgroundImageView setContentMode:a3];
  [(UIImageView *)self->_foregroundAccentImageView setContentMode:a3];
  [(UIImageView *)self->_overrideImageView setContentMode:a3];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  if (self->_overrideImage && self->_imageProvider)
  {
    [(NTKUpNextImageView *)self updateMonochromeColor];
    [(UIImageView *)self->_overrideImageView setHidden:0];
    objc_super v5 = [(UIImageView *)self->_overrideImageView layer];
    [v5 setFilters:0];

    overrideImageView = self->_overrideImageView;
    [(UIImageView *)overrideImageView setAlpha:1.0 - a3];
  }
  else
  {
    double v7 = [(NTKUpNextImageView *)self filterProvider];
    id v16 = [v7 filtersForView:self style:2 fraction:a3];

    if (v16)
    {
      BOOL v8 = [(UIImageView *)self->_backgroundImageView layer];
      [v8 setFilters:v16];
    }
    double v9 = [(NTKUpNextImageView *)self filterProvider];
    double v10 = [v9 filtersForView:self style:0 fraction:a3];

    if (v10)
    {
      double v11 = [(UIImageView *)self->_foregroundImageView layer];
      [v11 setFilters:v10];
    }
    id v12 = [(NTKUpNextImageView *)self filterProvider];
    double v13 = [v12 filtersForView:self style:1 fraction:a3];

    if (v13)
    {
      double v14 = [(UIImageView *)self->_foregroundAccentImageView layer];
      [v14 setFilters:v13];

      double v15 = [(UIImageView *)self->_overrideImageView layer];
      [v15 setFilters:v13];
    }
  }
}

- (void)updateMonochromeColor
{
  if (self->_imageProvider)
  {
    [(UIImageView *)self->_overrideImageView setHidden:1];
    [(UIImageView *)self->_overrideImageView setAlpha:1.0];
    [(UIImageView *)self->_foregroundAccentImageView setHidden:0];
    [(UIImageView *)self->_foregroundImageView setHidden:0];
    [(UIImageView *)self->_backgroundImageView setHidden:0];
  }
  double v3 = [(NTKUpNextImageView *)self filterProvider];
  id v12 = [v3 filtersForView:self style:2];

  if (v12)
  {
    id v4 = [(UIImageView *)self->_backgroundImageView layer];
    [v4 setFilters:v12];
  }
  objc_super v5 = [(NTKUpNextImageView *)self filterProvider];
  id v6 = [v5 filtersForView:self style:0];

  if (v6)
  {
    double v7 = [(UIImageView *)self->_foregroundImageView layer];
    [v7 setFilters:v6];
  }
  BOOL v8 = [(NTKUpNextImageView *)self filterProvider];
  double v9 = [v8 filtersForView:self style:1];

  if (v9)
  {
    double v10 = [(UIImageView *)self->_foregroundAccentImageView layer];
    [v10 setFilters:v9];

    double v11 = [(UIImageView *)self->_overrideImageView layer];
    [v11 setFilters:v9];
  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
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

- (NSString)compositingFilter
{
  return self->_compositingFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_fallbackTintColor, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_destroyWeak((id *)&self->_parentCell);
  objc_storeStrong((id *)&self->_overrideImageView, 0);
  objc_storeStrong((id *)&self->_foregroundAccentImageView, 0);
  objc_storeStrong((id *)&self->_foregroundAccentBackdrop, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
}

@end