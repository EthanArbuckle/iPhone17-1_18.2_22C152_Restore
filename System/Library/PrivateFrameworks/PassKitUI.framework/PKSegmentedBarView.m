@interface PKSegmentedBarView
- (BOOL)isBlurDisabled;
- (BOOL)roundBaselineCorners;
- (BOOL)showPlaceholder;
- (BOOL)useSmallCornerRadius;
- (PKSegmentedBarView)initWithFrame:(CGRect)a3;
- (UIColor)placeholderColor;
- (double)minimumLength;
- (void)_callCompletion;
- (void)_generateImageForConfiguration:(id)a3 barLength:(double)a4 maximumLength:(double)a5 synchronous:(BOOL)a6;
- (void)_updateImageWithImage:(id)a3;
- (void)_updatePlaceholder;
- (void)configureWithBarConfiguration:(id)a3 axis:(unsigned int)a4 maximumLength:(double)a5 barLength:(double)a6 synchronous:(BOOL)a7 completion:(id)a8;
- (void)layoutSubviews;
- (void)setBlurDisabled:(BOOL)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setRoundBaselineCorners:(BOOL)a3;
- (void)setShowPlaceholder:(BOOL)a3;
- (void)setUseSmallCornerRadius:(BOOL)a3;
@end

@implementation PKSegmentedBarView

- (PKSegmentedBarView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PKSegmentedBarView;
  v3 = -[PKSegmentedBarView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    bar = v3->_bar;
    v3->_bar = (UIImageView *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    placeholder = v3->_placeholder;
    v3->_placeholder = (UIView *)v7;

    uint64_t v9 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    placeholderColor = v3->_placeholderColor;
    v3->_placeholderColor = (UIColor *)v9;

    v11 = [(UIImageView *)v3->_bar layer];
    __36__PKSegmentedBarView_initWithFrame___block_invoke(v11);

    v12 = [(UIView *)v3->_placeholder layer];
    __36__PKSegmentedBarView_initWithFrame___block_invoke(v12);

    [(PKSegmentedBarView *)v3 addSubview:v3->_placeholder];
    [(PKSegmentedBarView *)v3 addSubview:v3->_bar];
    [(PKSegmentedBarView *)v3 _updatePlaceholder];
  }
  return v3;
}

void __36__PKSegmentedBarView_initWithFrame___block_invoke(void *a1)
{
  id v1 = a1;
  [v1 setMasksToBounds:1];
  [v1 setCornerCurve:*MEMORY[0x1E4F39EA8]];
}

- (void)configureWithBarConfiguration:(id)a3 axis:(unsigned int)a4 maximumLength:(double)a5 barLength:(double)a6 synchronous:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v23 = a3;
  v15 = (void (**)(void))a8;
  if (v15)
  {
    v16 = self->_configuration;
    objc_storeStrong((id *)&self->_configuration, a3);
    unsigned int axis = self->_axis;
    self->_unsigned int axis = a4;
    double barLength = self->_barLength;
    self->_double barLength = a6;
    double maximumLength = self->_maximumLength;
    self->_double maximumLength = a5;
    if (PKEqualObjects()
      && self->_image
      && self->_barLength == barLength
      && self->_maximumLength == maximumLength
      && self->_axis == axis)
    {
      v15[2](v15);
    }
    else
    {
      atomic_fetch_add((atomic_ullong *volatile)&self->_generationCounter, 1uLL);
      [(PKSegmentedBarView *)self _updateImageWithImage:0];
      imageCompletion = (void (**)(void))self->_imageCompletion;
      if (imageCompletion) {
        imageCompletion[2]();
      }
      v21 = (void *)[v15 copy];
      id v22 = self->_imageCompletion;
      self->_imageCompletion = v21;

      [(PKSegmentedBarView *)self _generateImageForConfiguration:self->_configuration barLength:v9 maximumLength:a6 synchronous:a5];
      [(PKSegmentedBarView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PKSegmentedBarView;
  [(PKSegmentedBarView *)&v20 layoutSubviews];
  [(PKSegmentedBarView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_placeholder, "setFrame:");
  [(PKSegmentedBarView *)self _updatePlaceholder];
  v11.n128_u64[0] = *(void *)&self->_barLength;
  PKFloatFloorToPixel(v11, v12);
  unsigned int axis = self->_axis;
  if (axis) {
    double v15 = v8;
  }
  else {
    double v15 = v10;
  }
  if (axis) {
    double v16 = v15;
  }
  else {
    double v16 = v13;
  }
  if (axis) {
    double v17 = v13;
  }
  else {
    double v17 = v15;
  }
  double v18 = v6 + v10 - v13;
  if (axis) {
    double v19 = v18;
  }
  else {
    double v19 = v6;
  }
  -[UIImageView setFrame:](self->_bar, "setFrame:", v4, v19, v16, v17);
}

- (void)_updateImageWithImage:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  double v5 = [(UIImageView *)self->_bar image];
  image = self->_image;

  if (v5 != image) {
    [(UIImageView *)self->_bar setImage:self->_image];
  }
}

- (void)_callCompletion
{
  id imageCompletion = self->_imageCompletion;
  if (imageCompletion)
  {
    double v5 = (void (**)(void))_Block_copy(imageCompletion);
    id v4 = self->_imageCompletion;
    self->_id imageCompletion = 0;

    v5[2]();
  }
}

- (void)_generateImageForConfiguration:(id)a3 barLength:(double)a4 maximumLength:(double)a5 synchronous:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  __n128 v11 = v10;
  if (a4 <= 0.0)
  {
    [v10 totalValue];
LABEL_7:
    [(PKSegmentedBarView *)self _updateImageWithImage:0];
    [(PKSegmentedBarView *)self _callCompletion];
    goto LABEL_12;
  }
  int v12 = [v10 isReady];
  [v11 totalValue];
  if (!v12 || v13 <= 0.0) {
    goto LABEL_7;
  }
  objc_super v14 = [(PKSegmentedBarView *)self traitCollection];
  unsigned int axis = self->_axis;
  BOOL blurDisabled = self->_blurDisabled;
  if (v6)
  {
    id BarImage = CreateBarImage(v11, v14, self->_axis, !blurDisabled, a4, a5);
    [(PKSegmentedBarView *)self _updateImageWithImage:BarImage];
    [(PKSegmentedBarView *)self _callCompletion];
  }
  else
  {
    BOOL v18 = !blurDisabled;
    double v19 = (void *)atomic_load(&self->_generationCounter);
    objc_initWeak(&location, self);
    if (qword_1E94F5B48 != -1) {
      dispatch_once(&qword_1E94F5B48, &__block_literal_global_97_0);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__PKSegmentedBarView__generateImageForConfiguration_barLength_maximumLength_synchronous___block_invoke;
    v21[3] = &unk_1E59DEB18;
    objc_super v20 = (id)_MergedGlobals_2_3;
    objc_copyWeak(v24, &location);
    v24[1] = v19;
    id v22 = v11;
    id v23 = v14;
    unsigned int v25 = axis;
    v24[2] = *(id *)&a4;
    v24[3] = *(id *)&a5;
    BOOL v26 = v18;
    dispatch_async(v20, v21);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }

LABEL_12:
}

void __89__PKSegmentedBarView__generateImageForConfiguration_barLength_maximumLength_synchronous___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v5 = atomic_load(WeakRetained + 59);
    if (v5 == *(void *)(a1 + 56))
    {
      id BarImage = CreateBarImage(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_DWORD *)(a1 + 80), *(unsigned char *)(a1 + 84), *(double *)(a1 + 64), *(double *)(a1 + 72));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89__PKSegmentedBarView__generateImageForConfiguration_barLength_maximumLength_synchronous___block_invoke_2;
      block[3] = &unk_1E59CFBA8;
      objc_copyWeak(v10, v2);
      v10[1] = *(id *)(a1 + 56);
      id v9 = BarImage;
      id v7 = BarImage;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(v10);
    }
  }
}

void __89__PKSegmentedBarView__generateImageForConfiguration_barLength_maximumLength_synchronous___block_invoke_2(uint64_t a1)
{
  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v3 = atomic_load(WeakRetained + 59);
    if (v3 == *(void *)(a1 + 48))
    {
      id v4 = WeakRetained;
      [WeakRetained _updateImageWithImage:*(void *)(a1 + 32)];
      [v4 _callCompletion];
      WeakRetained = v4;
    }
  }
}

- (void)setShowPlaceholder:(BOOL)a3
{
  if (((!self->_showPlaceholder ^ a3) & 1) == 0)
  {
    self->_showPlaceholder = a3;
    [(PKSegmentedBarView *)self setNeedsLayout];
  }
}

- (void)setRoundBaselineCorners:(BOOL)a3
{
  if (((!self->_roundBaselineCorners ^ a3) & 1) == 0)
  {
    self->_roundBaselineCorners = a3;
    [(PKSegmentedBarView *)self setNeedsLayout];
  }
}

- (void)setUseSmallCornerRadius:(BOOL)a3
{
  if (((!self->_useSmallCornerRadius ^ a3) & 1) == 0)
  {
    self->_useSmallCornerRadius = a3;
    [(PKSegmentedBarView *)self setNeedsLayout];
  }
}

- (void)setBlurDisabled:(BOOL)a3
{
  if (((!self->_blurDisabled ^ a3) & 1) == 0)
  {
    self->_BOOL blurDisabled = a3;
    image = self->_image;
    self->_image = 0;

    atomic_fetch_add((atomic_ullong *volatile)&self->_generationCounter, 1uLL);
    [(PKSegmentedBarView *)self setNeedsLayout];
  }
}

- (void)setPlaceholderColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    [(PKSegmentedBarView *)self _updatePlaceholder];
  }
}

- (void)_updatePlaceholder
{
  [(UIView *)self->_placeholder setBackgroundColor:self->_placeholderColor];
  BOOL useSmallCornerRadius = self->_useSmallCornerRadius;
  double v4 = 2.0;
  double v5 = 4.0;
  if (!self->_useSmallCornerRadius) {
    double v4 = 4.0;
  }
  self->_minimumLength = v4;
  uint64_t v6 = 3;
  if (!self->_axis) {
    uint64_t v6 = 10;
  }
  if (self->_roundBaselineCorners)
  {
    if (!useSmallCornerRadius) {
      double v5 = 8.0;
    }
    self->_minimumLength = v5;
    uint64_t v6 = 15;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __40__PKSegmentedBarView__updatePlaceholder__block_invoke;
  v10[3] = &__block_descriptor_48_e17_v16__0__CALayer_8l;
  v10[4] = v6;
  *(double *)&v10[5] = v4;
  id v7 = (void (**)(void *, void *))_Block_copy(v10);
  double v8 = [(UIImageView *)self->_bar layer];
  v7[2](v7, v8);

  id v9 = [(UIView *)self->_placeholder layer];
  v7[2](v7, v9);

  [(UIView *)self->_placeholder setHidden:!self->_showPlaceholder];
}

void __40__PKSegmentedBarView__updatePlaceholder__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setMaskedCorners:v3];
  [v4 setCornerRadius:*(double *)(a1 + 40)];
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (BOOL)roundBaselineCorners
{
  return self->_roundBaselineCorners;
}

- (BOOL)useSmallCornerRadius
{
  return self->_useSmallCornerRadius;
}

- (BOOL)isBlurDisabled
{
  return self->_blurDisabled;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (double)minimumLength
{
  return self->_minimumLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong(&self->_imageCompletion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);

  objc_storeStrong((id *)&self->_bar, 0);
}

@end