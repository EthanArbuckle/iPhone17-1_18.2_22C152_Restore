@interface SBHomeScreenMaterialView
+ (id)colorBurnContentImageForImage:(id)a3;
- (BOOL)isHighlighted;
- (SBHomeScreenMaterialView)initWithFrame:(CGRect)a3;
- (SBHomeScreenMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5;
- (UIEdgeInsets)backgroundInsets;
- (UIImage)foregroundImage;
- (UIView)backgroundView;
- (double)brightness;
- (void)_addHighlightViewIfNecessary;
- (void)layoutSubviews;
- (void)setBackgroundInsets:(UIEdgeInsets)a3;
- (void)setBrightness:(double)a3;
- (void)setForegroundImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setLegibilityStyle:(int64_t)a3;
@end

@implementation SBHomeScreenMaterialView

+ (id)colorBurnContentImageForImage:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isSymbolImage])
    {
      id v5 = v4;
    }
    else
    {
      objc_getAssociatedObject(v4, "SBHomeScreenMaterialViewColorBurnImageAssociationKey");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        id v5 = [v4 imageWithRenderingMode:2];
        if (v5) {
          objc_setAssociatedObject(v4, "SBHomeScreenMaterialViewColorBurnImageAssociationKey", v5, (void *)1);
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (SBHomeScreenMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  v47.receiver = self;
  v47.super_class = (Class)SBHomeScreenMaterialView;
  v13 = -[SBHomeScreenMaterialView initWithFrame:](&v47, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    [(SBHomeScreenMaterialView *)v13 setOpaque:0];
    v15 = [(SBHomeScreenMaterialView *)v14 layer];
    [v15 setAllowsGroupBlending:0];

    if (v11)
    {
      v16 = (UIView *)v11;
      backgroundView = v14->_backgroundView;
      v14->_backgroundView = v16;
    }
    else
    {
      v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v19 = v14->_backgroundView;
      v14->_backgroundView = v18;

      v20 = v14->_backgroundView;
      backgroundView = [MEMORY[0x1E4FB1618] lightGrayColor];
      [(UIView *)v20 setBackgroundColor:backgroundView];
    }

    [(SBHomeScreenMaterialView *)v14 addSubview:v14->_backgroundView];
    v21 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    whiteTintView = v14->_whiteTintView;
    v14->_whiteTintView = v21;

    v23 = v14->_whiteTintView;
    v24 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v23 setBackgroundColor:v24];

    [(UIView *)v14->_whiteTintView setAlpha:0.42];
    [(SBHomeScreenMaterialView *)v14 addSubview:v14->_whiteTintView];
    v25 = [(id)objc_opt_class() colorBurnContentImageForImage:v12];
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v25];
    xColorBurnView = v14->_xColorBurnView;
    v14->_xColorBurnView = (UIImageView *)v26;

    v28 = v14->_xColorBurnView;
    v29 = [MEMORY[0x1E4FB1618] colorWithWhite:0.3 alpha:1.0];
    [(UIImageView *)v28 setTintColor:v29];

    v30 = [(UIImageView *)v14->_xColorBurnView layer];
    [v30 setCompositingFilter:*MEMORY[0x1E4F3A008]];

    [(SBHomeScreenMaterialView *)v14 addSubview:v14->_xColorBurnView];
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
    xPlusDView = v14->_xPlusDView;
    v14->_xPlusDView = (UIImageView *)v31;

    v33 = [(UIImageView *)v14->_xPlusDView layer];
    v34 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    [v33 setCompositingFilter:v34];

    v35 = v14->_xPlusDView;
    v36 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIImageView *)v35 setTintColor:v36];

    [(UIImageView *)v14->_xPlusDView setAlpha:0.3];
    [(SBHomeScreenMaterialView *)v14 addSubview:v14->_xPlusDView];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v37 = [(SBHomeScreenMaterialView *)v14 subviews];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v44;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v44 != v40) {
            objc_enumerationMutation(v37);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * v41++) setUserInteractionEnabled:0];
        }
        while (v39 != v41);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v39);
    }
  }
  return v14;
}

- (SBHomeScreenMaterialView)initWithFrame:(CGRect)a3
{
  return -[SBHomeScreenMaterialView initWithFrame:backgroundView:foregroundImage:](self, "initWithFrame:backgroundView:foregroundImage:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBackgroundInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_backgroundInsets.left
    || a3.top != self->_backgroundInsets.top
    || a3.right != self->_backgroundInsets.right
    || a3.bottom != self->_backgroundInsets.bottom)
  {
    self->_backgroundInsets = a3;
    [(SBHomeScreenMaterialView *)self setNeedsLayout];
  }
}

- (UIImage)foregroundImage
{
  return [(UIImageView *)self->_xPlusDView image];
}

- (void)setForegroundImage:(id)a3
{
  id v6 = a3;
  id v4 = [(SBHomeScreenMaterialView *)self foregroundImage];

  if (v4 != v6)
  {
    [(UIImageView *)self->_xPlusDView setImage:v6];
    id v5 = [(id)objc_opt_class() colorBurnContentImageForImage:v6];
    [(UIImageView *)self->_xColorBurnView setImage:v5];
    [(SBHomeScreenMaterialView *)self setNeedsLayout];
  }
}

- (void)setLegibilityStyle:(int64_t)a3
{
  whiteTintView = self->_whiteTintView;
  double v5 = 0.42;
  if (a3 == 2) {
    double v5 = 0.0;
  }
  double v6 = dbl_1D81E7380[a3 == 2];
  [(UIView *)whiteTintView setAlpha:v5];
  xPlusDView = self->_xPlusDView;
  [(UIImageView *)xPlusDView setAlpha:v6];
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
    [(SBHomeScreenMaterialView *)self setBrightness:v3];
  }
}

- (double)brightness
{
  [(UIView *)self->_highlightView alpha];
  return 1.0 - v2;
}

- (void)setBrightness:(double)a3
{
  [(SBHomeScreenMaterialView *)self _addHighlightViewIfNecessary];
  highlightView = self->_highlightView;
  [(UIView *)highlightView setAlpha:1.0 - a3];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)SBHomeScreenMaterialView;
  [(SBHomeScreenMaterialView *)&v26 layoutSubviews];
  [(SBHomeScreenMaterialView *)self bounds];
  [(SBHomeScreenMaterialView *)self backgroundInsets];
  UIRectIntegralWithScale();
  double x = v27.origin.x;
  double y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  CGFloat v7 = CGRectGetHeight(v27) * 0.5;
  -[UIView setFrame:](self->_backgroundView, "setFrame:", x, y, width, height);
  v8 = [(UIView *)self->_backgroundView layer];
  [v8 setMasksToBounds:1];

  v9 = [(UIView *)self->_backgroundView layer];
  [v9 setCornerRadius:v7];

  v10 = [(UIView *)self->_backgroundView layer];
  id v11 = [v10 cornerCurve];

  -[UIView setFrame:](self->_whiteTintView, "setFrame:", x, y, width, height);
  id v12 = [(UIView *)self->_whiteTintView layer];
  double v25 = v7;
  [v12 setCornerRadius:v7];

  v13 = [(UIView *)self->_whiteTintView layer];
  [v13 setCornerCurve:v11];

  if (self->_imageSize.width == 0.0 && self->_imageSize.height == 0.0)
  {
    v14 = [(UIImageView *)self->_xColorBurnView image];
    [v14 size];
  }
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [(UIImageView *)self->_xColorBurnView setFrame:0];
  -[UIImageView setFrame:](self->_xPlusDView, "setFrame:", v16, v18, v20, v22);
  -[UIView setFrame:](self->_highlightView, "setFrame:", x, y, width, height);
  v23 = [(UIView *)self->_highlightView layer];
  [v23 setCornerRadius:v25];

  v24 = [(UIView *)self->_highlightView layer];
  [v24 setCornerCurve:v11];
}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    [(SBHomeScreenMaterialView *)self setNeedsLayout];
  }
}

- (void)_addHighlightViewIfNecessary
{
  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __56__SBHomeScreenMaterialView__addHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_1E6AAC810;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
  }
}

uint64_t __56__SBHomeScreenMaterialView__addHighlightViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 440);
  *(void *)(v3 + 440) = v2;

  double v5 = *(void **)(*(void *)(a1 + 32) + 440);
  double v6 = [MEMORY[0x1E4FB1618] blackColor];
  [v5 setBackgroundColor:v6];

  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
  CGFloat v7 = [*(id *)(*(void *)(a1 + 32) + 440) layer];
  [v7 setCompositingFilter:*MEMORY[0x1E4F3A308]];

  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 440)];
  v8 = *(void **)(a1 + 32);
  return [v8 layoutIfNeeded];
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_xPlusDView, 0);
  objc_storeStrong((id *)&self->_xColorBurnView, 0);
  objc_storeStrong((id *)&self->_whiteTintView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end