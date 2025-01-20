@interface PUPhotoEditButtonMaterialView
+ (id)colorBurnContentImageForImage:(id)a3;
- (BOOL)isHighlighted;
- (PUPhotoEditButtonMaterialView)initWithFrame:(CGRect)a3;
- (PUPhotoEditButtonMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5;
- (UIColor)backgroundColor;
- (UIEdgeInsets)backgroundInsets;
- (UIImage)foregroundImage;
- (UIView)backgroundView;
- (double)brightness;
- (void)_addHighlightViewIfNecessary;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundEnabled:(BOOL)a3;
- (void)setBackgroundInsets:(UIEdgeInsets)a3;
- (void)setBrightness:(double)a3;
- (void)setForegroundImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PUPhotoEditButtonMaterialView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIEdgeInsets)backgroundInsets
{
  double top = self->_backgroundInsets.top;
  double left = self->_backgroundInsets.left;
  double bottom = self->_backgroundInsets.bottom;
  double right = self->_backgroundInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)_addHighlightViewIfNecessary
{
  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __61__PUPhotoEditButtonMaterialView__addHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_1E5F2ED10;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
  }
}

uint64_t __61__PUPhotoEditButtonMaterialView__addHighlightViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 424);
  *(void *)(v3 + 424) = v2;

  v5 = *(void **)(*(void *)(a1 + 32) + 424);
  v6 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setBackgroundColor:v6];

  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  v7 = [*(id *)(*(void *)(a1 + 32) + 424) layer];
  [v7 setCompositingFilter:*MEMORY[0x1E4F3A308]];

  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 424)];
  v8 = *(void **)(a1 + 32);
  return [v8 layoutIfNeeded];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PUPhotoEditButtonMaterialView;
  [(PUPhotoEditButtonMaterialView *)&v23 layoutSubviews];
  [(PUPhotoEditButtonMaterialView *)self bounds];
  [(PUPhotoEditButtonMaterialView *)self backgroundInsets];
  UIRectIntegralWithScale();
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  CGFloat v22 = CGRectGetHeight(v24) * 0.5;
  -[UIView setFrame:](self->_backgroundView, "setFrame:", x, y, width, height);
  v7 = [(UIView *)self->_backgroundView layer];
  [v7 setMasksToBounds:1];

  v8 = [(UIView *)self->_backgroundView layer];
  [v8 setCornerRadius:v22];

  v9 = [(UIView *)self->_backgroundView layer];
  v10 = [v9 cornerCurve];

  v11 = [(UIImageView *)self->_imageView image];
  [v11 size];
  UIRectCenteredIntegralRectScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  -[UIImageView setFrame:](self->_imageView, "setFrame:", v13, v15, v17, v19, 0);
  -[UIView setFrame:](self->_highlightView, "setFrame:", x, y, width, height);
  v20 = [(UIView *)self->_highlightView layer];
  [v20 setCornerRadius:v22];

  v21 = [(UIView *)self->_highlightView layer];
  [v21 setCornerCurve:v10];
}

- (void)setBackgroundEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PUPhotoEditButtonMaterialView *)self backgroundColor];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  id v12 = v7;

  v8 = [(PUPhotoEditButtonMaterialView *)self backgroundColor];
  if (v8)
  {
    v9 = [(PUPhotoEditButtonMaterialView *)self backgroundColor];
    v10 = [v9 colorWithAlphaComponent:0.4];
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1618] systemGray4Color];
  }

  if (v3) {
    id v11 = v12;
  }
  else {
    id v11 = v10;
  }
  [(UIView *)self->_backgroundView setBackgroundColor:v11];
}

- (void)setBrightness:(double)a3
{
  [(PUPhotoEditButtonMaterialView *)self _addHighlightViewIfNecessary];
  highlightView = self->_highlightView;
  [(UIView *)highlightView setAlpha:1.0 - a3];
}

- (double)brightness
{
  [(UIView *)self->_highlightView alpha];
  return 1.0 - v2;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    double v3 = 0.466666667;
    if (!a3) {
      double v3 = 1.0;
    }
    [(PUPhotoEditButtonMaterialView *)self setBrightness:v3];
  }
}

- (void)setForegroundImage:(id)a3
{
  id v6 = a3;
  id v4 = [(PUPhotoEditButtonMaterialView *)self foregroundImage];

  v5 = v6;
  if (v4 != v6)
  {
    [(UIImageView *)self->_imageView setImage:v6];
    [(PUPhotoEditButtonMaterialView *)self setNeedsLayout];
    v5 = v6;
  }
}

- (UIImage)foregroundImage
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setBackgroundInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_backgroundInsets.left
    || a3.top != self->_backgroundInsets.top
    || a3.right != self->_backgroundInsets.right
    || a3.bottom != self->_backgroundInsets.bottom)
  {
    self->_backgroundInsets = a3;
    [(PUPhotoEditButtonMaterialView *)self setNeedsLayout];
  }
}

- (PUPhotoEditButtonMaterialView)initWithFrame:(CGRect)a3
{
  return -[PUPhotoEditButtonMaterialView initWithFrame:backgroundView:foregroundImage:](self, "initWithFrame:backgroundView:foregroundImage:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUPhotoEditButtonMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PUPhotoEditButtonMaterialView;
  double v13 = -[PUPhotoEditButtonMaterialView initWithFrame:](&v35, sel_initWithFrame_, x, y, width, height);
  double v14 = v13;
  if (v13)
  {
    [(PUPhotoEditButtonMaterialView *)v13 setOpaque:0];
    double v15 = [(PUPhotoEditButtonMaterialView *)v14 layer];
    [v15 setAllowsGroupBlending:0];

    if (v11)
    {
      double v16 = (UIView *)v11;
      backgroundView = v14->_backgroundView;
      v14->_backgroundView = v16;
    }
    else
    {
      double v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v19 = v14->_backgroundView;
      v14->_backgroundView = v18;

      v20 = v14->_backgroundView;
      v21 = [MEMORY[0x1E4FB1618] systemGray2Color];
      [(UIView *)v20 setBackgroundColor:v21];

      uint64_t v22 = *MEMORY[0x1E4F39EA8];
      backgroundView = [(UIView *)v14->_backgroundView layer];
      [backgroundView setCornerCurve:v22];
    }

    [(PUPhotoEditButtonMaterialView *)v14 addSubview:v14->_backgroundView];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
    imageView = v14->_imageView;
    v14->_imageView = (UIImageView *)v23;

    [(PUPhotoEditButtonMaterialView *)v14 addSubview:v14->_imageView];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v25 = [(PUPhotoEditButtonMaterialView *)v14 subviews];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v32;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v29++) setUserInteractionEnabled:0];
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v27);
    }
  }
  return v14;
}

+ (id)colorBurnContentImageForImage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = objc_getAssociatedObject(v3, "PUPhotoEditButtonMaterialViewColorBurnImageAssociationKey");
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.3 alpha:1.0];
      v5 = [v4 _flatImageWithColor:v6];

      if (v5) {
        objc_setAssociatedObject(v4, "PUPhotoEditButtonMaterialViewColorBurnImageAssociationKey", v5, (void *)1);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end