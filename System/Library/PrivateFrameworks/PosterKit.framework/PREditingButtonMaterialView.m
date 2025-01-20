@interface PREditingButtonMaterialView
+ (id)colorBurnContentImageForImage:(id)a3;
- (BOOL)isHighlighted;
- (PREditingButtonMaterialView)initWithFrame:(CGRect)a3;
- (PREditingButtonMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5;
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
- (void)setLegibilityStyle:(int64_t)a3;
@end

@implementation PREditingButtonMaterialView

+ (id)colorBurnContentImageForImage:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_getAssociatedObject(v3, "PREditingButtonMaterialViewColorBurnImageAssociationKey");
    if (!v5)
    {
      v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.3 alpha:1.0];
      v5 = [v4 _flatImageWithColor:v6];

      if (v5) {
        objc_setAssociatedObject(v4, "PREditingButtonMaterialViewColorBurnImageAssociationKey", v5, (void *)1);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PREditingButtonMaterialView)initWithFrame:(CGRect)a3 backgroundView:(id)a4 foregroundImage:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  v43.receiver = self;
  v43.super_class = (Class)PREditingButtonMaterialView;
  v13 = -[PREditingButtonMaterialView initWithFrame:](&v43, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    [(PREditingButtonMaterialView *)v13 setOpaque:0];
    v15 = [(PREditingButtonMaterialView *)v14 layer];
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

    [(PREditingButtonMaterialView *)v14 addSubview:v14->_backgroundView];
    v21 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    whiteTintView = v14->_whiteTintView;
    v14->_whiteTintView = v21;

    v23 = v14->_whiteTintView;
    v24 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v23 setBackgroundColor:v24];

    [(UIView *)v14->_whiteTintView setAlpha:0.42];
    [(PREditingButtonMaterialView *)v14 addSubview:v14->_whiteTintView];
    v25 = [(id)objc_opt_class() colorBurnContentImageForImage:v12];
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v25];
    xColorBurnView = v14->_xColorBurnView;
    v14->_xColorBurnView = (UIImageView *)v26;

    v28 = [(UIImageView *)v14->_xColorBurnView layer];
    [v28 setCompositingFilter:*MEMORY[0x1E4F3A008]];

    [(PREditingButtonMaterialView *)v14 addSubview:v14->_xColorBurnView];
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
    xPlusDView = v14->_xPlusDView;
    v14->_xPlusDView = (UIImageView *)v29;

    v31 = [(UIImageView *)v14->_xPlusDView layer];
    v32 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    [v31 setCompositingFilter:v32];

    [(UIImageView *)v14->_xPlusDView setAlpha:0.3];
    [(PREditingButtonMaterialView *)v14 addSubview:v14->_xPlusDView];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v33 = [(PREditingButtonMaterialView *)v14 subviews];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v40;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v40 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v37++) setUserInteractionEnabled:0];
        }
        while (v35 != v37);
        uint64_t v35 = [v33 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v35);
    }
  }
  return v14;
}

- (PREditingButtonMaterialView)initWithFrame:(CGRect)a3
{
  return -[PREditingButtonMaterialView initWithFrame:backgroundView:foregroundImage:](self, "initWithFrame:backgroundView:foregroundImage:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBackgroundInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_backgroundInsets.left
    || a3.top != self->_backgroundInsets.top
    || a3.right != self->_backgroundInsets.right
    || a3.bottom != self->_backgroundInsets.bottom)
  {
    self->_backgroundInsets = a3;
    [(PREditingButtonMaterialView *)self setNeedsLayout];
  }
}

- (UIImage)foregroundImage
{
  return [(UIImageView *)self->_xPlusDView image];
}

- (void)setForegroundImage:(id)a3
{
  id v6 = a3;
  id v4 = [(PREditingButtonMaterialView *)self foregroundImage];

  if (v4 != v6)
  {
    [(UIImageView *)self->_xPlusDView setImage:v6];
    v5 = [(id)objc_opt_class() colorBurnContentImageForImage:v6];
    [(UIImageView *)self->_xColorBurnView setImage:v5];
    [(PREditingButtonMaterialView *)self setNeedsLayout];
  }
}

- (void)setLegibilityStyle:(int64_t)a3
{
  whiteTintView = self->_whiteTintView;
  double v5 = 0.42;
  if (a3 == 2) {
    double v5 = 0.0;
  }
  double v6 = dbl_18C2DCE00[a3 == 2];
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
    [(PREditingButtonMaterialView *)self setBrightness:v3];
  }
}

- (double)brightness
{
  [(UIView *)self->_highlightView alpha];
  return 1.0 - v2;
}

- (void)setBrightness:(double)a3
{
  [(PREditingButtonMaterialView *)self _addHighlightViewIfNecessary];
  highlightView = self->_highlightView;
  [(UIView *)highlightView setAlpha:1.0 - a3];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PREditingButtonMaterialView;
  [(PREditingButtonMaterialView *)&v26 layoutSubviews];
  [(PREditingButtonMaterialView *)self bounds];
  [(PREditingButtonMaterialView *)self backgroundInsets];
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
  double v25 = v7;
  [v9 setCornerRadius:v7];

  v10 = [(UIView *)self->_backgroundView layer];
  id v11 = [v10 cornerCurve];

  -[UIView setFrame:](self->_whiteTintView, "setFrame:", x, y, width, height);
  id v12 = [(UIView *)self->_whiteTintView layer];
  [v12 setCornerRadius:v7];

  v13 = [(UIView *)self->_whiteTintView layer];
  [v13 setCornerCurve:v11];

  v14 = [(UIImageView *)self->_xColorBurnView image];
  [v14 size];
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  -[UIImageView setFrame:](self->_xColorBurnView, "setFrame:", v16, v18, v20, v22, 0);
  -[UIImageView setFrame:](self->_xPlusDView, "setFrame:", v16, v18, v20, v22);
  -[UIView setFrame:](self->_highlightView, "setFrame:", x, y, width, height);
  v23 = [(UIView *)self->_highlightView layer];
  [v23 setCornerRadius:v25];

  v24 = [(UIView *)self->_highlightView layer];
  [v24 setCornerCurve:v11];
}

- (void)_addHighlightViewIfNecessary
{
  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __59__PREditingButtonMaterialView__addHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_1E54DAFB8;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
  }
}

uint64_t __59__PREditingButtonMaterialView__addHighlightViewIfNecessary__block_invoke(uint64_t a1)
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