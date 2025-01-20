@interface _TVStackWrappingView
- (BOOL)shouldAdjustForTabBarSafeAreaInsets;
- (BOOL)usesBackdropImage;
- (BOOL)usesBackgroundImage;
- (NSArray)headerSupplementaryViews;
- (NSArray)supplementaryCellLayoutAttributes;
- (UICollectionView)stackView;
- (UIImage)backdropImage;
- (UIImage)backgroundImage;
- (_TVStackWrappingView)initWithFrame:(CGRect)a3;
- (double)backdropInitialPeek;
- (double)backdropMaskFactor;
- (double)backdropPeekGradient;
- (id)preferredFocusEnvironments;
- (int64_t)backdropBlurEffectStyle;
- (void)configureSupplementaryCellLayoutAttributesWithAutomaticInsets:(UIEdgeInsets)a3 sectionIndex:(int64_t)a4;
- (void)layoutSubviews;
- (void)setBackdropBlurEffectStyle:(int64_t)a3;
- (void)setBackdropImage:(id)a3;
- (void)setBackdropInitialPeek:(double)a3;
- (void)setBackdropMaskFactor:(double)a3;
- (void)setBackdropPeekGradient:(double)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setHeaderSupplementaryViews:(id)a3;
- (void)setShouldAdjustForTabBarSafeAreaInsets:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setUsesBackdropImage:(BOOL)a3;
- (void)setUsesBackgroundImage:(BOOL)a3;
@end

@implementation _TVStackWrappingView

- (_TVStackWrappingView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVStackWrappingView;
  result = -[_TVStackWrappingView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_usesBackgroundImage = 1;
    result->_usesBackdropImage = 1;
    result->_backdropBlurEffectStyle = 0x8000000000000000;
  }
  return result;
}

- (void)setBackgroundImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_backgroundImage = &self->_backgroundImage;
  if (self->_backgroundImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_backgroundImage, a3);
    p_backgroundImage = (UIImage **)[(_TVStackWrappingView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_backgroundImage, v5);
}

- (void)setUsesBackgroundImage:(BOOL)a3
{
  if (self->_usesBackgroundImage != a3)
  {
    self->_usesBackgroundImage = a3;
    [(_TVStackWrappingView *)self setNeedsLayout];
  }
}

- (void)setStackView:(id)a3
{
  v5 = (UICollectionView *)a3;
  stackView = self->_stackView;
  if (stackView != v5)
  {
    v7 = v5;
    [(UICollectionView *)stackView removeFromSuperview];
    objc_storeStrong((id *)&self->_stackView, a3);
    stackView = (UICollectionView *)[(_TVStackWrappingView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](stackView, v5);
}

- (void)setBackdropImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_backdropImage = &self->_backdropImage;
  if (self->_backdropImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_backdropImage, a3);
    p_backdropImage = (UIImage **)[(_TVStackWrappingView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_backdropImage, v5);
}

- (void)setUsesBackdropImage:(BOOL)a3
{
  if (self->_usesBackdropImage != a3)
  {
    self->_usesBackdropImage = a3;
    [(_TVStackWrappingView *)self setNeedsLayout];
  }
}

- (void)setBackdropBlurEffectStyle:(int64_t)a3
{
  if (self->_backdropBlurEffectStyle != a3)
  {
    self->_backdropBlurEffectStyle = a3;
    [(_TVStackWrappingView *)self setNeedsLayout];
  }
}

- (void)setBackdropPeekGradient:(double)a3
{
  if (self->_backdropPeekGradient != a3)
  {
    self->_backdropPeekGradient = a3;
    [(_TVStackWrappingView *)self setNeedsLayout];
  }
}

- (void)setBackdropInitialPeek:(double)a3
{
  if (self->_backdropInitialPeek != a3)
  {
    self->_backdropInitialPeek = a3;
    [(_TVStackWrappingView *)self setNeedsLayout];
  }
}

- (void)setBackdropMaskFactor:(double)a3
{
  if (self->_backdropMaskFactor != a3)
  {
    self->_backdropMaskFactor = a3;
    [(_TVStackWrappingView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)_TVStackWrappingView;
  [(_TVStackWrappingView *)&v52 layoutSubviews];
  [(_TVStackWrappingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t v11 = [(_TVStackWrappingView *)self backdropBlurEffectStyle];
  [(_TVStackWrappingView *)self backdropInitialPeek];
  double v13 = v12;
  [(_TVStackWrappingView *)self backdropPeekGradient];
  double v15 = v14;
  [(_TVStackWrappingView *)self backdropMaskFactor];
  double v17 = v16;
  v18 = [(_TVStackWrappingView *)self backgroundImage];
  if (v18 && [(_TVStackWrappingView *)self usesBackgroundImage])
  {
    backgroundImageView = self->_backgroundImageView;
    if (!backgroundImageView)
    {
      _TVStackMakeImageView();
      v20 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      v21 = self->_backgroundImageView;
      self->_backgroundImageView = v20;

      [(_TVStackWrappingView *)self insertSubview:self->_backgroundImageView atIndex:0];
      backgroundImageView = self->_backgroundImageView;
    }
    [(UIImageView *)backgroundImageView setImage:v18];
    -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v4, v6, v8, v10);
  }
  else
  {
    [(UIImageView *)self->_backgroundImageView removeFromSuperview];
    v22 = self->_backgroundImageView;
    self->_backgroundImageView = 0;
  }
  if (v11 == 0x8000000000000000)
  {
    [(_TVStackBackdropView *)self->_backdropView removeFromSuperview];
    backdropView = self->_backdropView;
    self->_backdropView = 0;

    [(_TVStackBackdropMaskingView *)self->_maskedBackdropView removeFromSuperview];
    maskedBackdropView = self->_maskedBackdropView;
    self->_maskedBackdropView = 0;
  }
  else
  {
    if ([(_TVStackWrappingView *)self usesBackdropImage])
    {
      v25 = [(_TVStackWrappingView *)self backdropImage];
      BOOL v26 = v25 != 0;
    }
    else
    {
      BOOL v26 = 0;
    }
    v27 = self->_backdropView;
    if (!v27)
    {
      v28 = [[_TVStackBackdropView alloc] initWithBlurEffectStyle:v11];
      v29 = self->_backdropView;
      self->_backdropView = v28;

      [(_TVStackWrappingView *)self insertSubview:self->_backdropView atIndex:self->_backgroundImageView != 0];
      v27 = self->_backdropView;
    }
    __38___TVStackWrappingView_layoutSubviews__block_invoke([(_TVStackBackdropView *)v27 setBlurEffectStyle:v11], self->_backdropView, v26);
    v30 = self->_backdropView;
    v31 = [(_TVStackWrappingView *)self backdropImage];
    [(_TVStackBackdropView *)v30 setImage:v31];

    -[_TVStackBackdropView setFrame:](self->_backdropView, "setFrame:", v4, v6, v8, v10);
    v32 = self->_maskedBackdropView;
    if (v13 <= 0.0)
    {
      [(_TVStackBackdropMaskingView *)v32 setAlpha:0.0];
      v41 = self->_backdropView;
      double v42 = 1.0 - v17;
    }
    else
    {
      if (!v32)
      {
        v33 = (_TVStackBackdropMaskingView *)objc_opt_new();
        v34 = self->_maskedBackdropView;
        self->_maskedBackdropView = v33;

        v35 = self->_maskedBackdropView;
        v36 = [[_TVStackBackdropView alloc] initWithBlurEffectStyle:v11];
        [(_TVStackBackdropMaskingView *)v35 setBackdropView:v36];

        [(_TVStackWrappingView *)self insertSubview:self->_maskedBackdropView below:self->_backdropView];
        v32 = self->_maskedBackdropView;
      }
      v37 = [(_TVStackBackdropMaskingView *)v32 backdropView];
      [v37 setBlurEffectStyle:v11];

      v38 = [(_TVStackBackdropMaskingView *)self->_maskedBackdropView backdropView];
      v39 = v38;
      if (v26)
      {
        v40 = [(_TVStackWrappingView *)self backdropImage];
        [v39 setImage:v40];
      }
      else
      {
        [v38 setImage:0];
      }

      v43 = [(_TVStackBackdropMaskingView *)self->_maskedBackdropView backdropView];
      objc_msgSend(v43, "setBounds:", v4, v6, v8, v10);

      if (v15 <= 0.0)
      {
        -[_TVStackBackdropMaskingView setFrame:](self->_maskedBackdropView, "setFrame:", v4, (v10 - v13) * v17, v8, v10 - (v10 - v13) * v17);
        v47 = [(_TVStackBackdropMaskingView *)self->_maskedBackdropView layer];
        [v47 setShouldRasterize:0];

        v48 = [(_TVStackBackdropMaskingView *)self->_maskedBackdropView backdropView];
        __38___TVStackWrappingView_layoutSubviews__block_invoke((uint64_t)v48, v48, v26);

        [(_TVStackBackdropMaskingView *)self->_maskedBackdropView setAlpha:1.0];
        v41 = self->_backdropView;
        double v42 = 0.0;
      }
      else
      {
        [(_TVStackBackdropMaskingView *)self->_maskedBackdropView setGradientScale:v15 / v13];
        double v44 = 0.7;
        if (!v26) {
          double v44 = 1.0;
        }
        [(_TVStackBackdropMaskingView *)self->_maskedBackdropView setGradientStop:v44];
        -[_TVStackBackdropMaskingView setFrame:](self->_maskedBackdropView, "setFrame:", 0.0, v10 - v13, v8, v13);
        v45 = [(_TVStackBackdropMaskingView *)self->_maskedBackdropView layer];
        [v45 setShouldRasterize:v26];

        v46 = [(_TVStackBackdropMaskingView *)self->_maskedBackdropView backdropView];
        __38___TVStackWrappingView_layoutSubviews__block_invoke((uint64_t)v46, v46, 0);

        [(_TVStackBackdropMaskingView *)self->_maskedBackdropView setAlpha:1.0];
        v41 = self->_backdropView;
        double v42 = 1.0 - v17;
      }
    }
    [(_TVStackBackdropView *)v41 setAlpha:v42];
  }
  v49 = [(_TVStackWrappingView *)self stackView];
  v50 = v49;
  if (v49)
  {
    v51 = [v49 superview];

    if (v51 != self) {
      [(_TVStackWrappingView *)self addSubview:v50];
    }
    objc_msgSend(v50, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)configureSupplementaryCellLayoutAttributesWithAutomaticInsets:(UIEdgeInsets)a3 sectionIndex:(int64_t)a4
{
  double bottom = a3.bottom;
  double right = a3.right;
  double left = a3.left;
  double top = a3.top;
  uint64_t v82 = *MEMORY[0x263EF8340];
  double v8 = [(_TVStackWrappingView *)self stackView];

  if (v8)
  {
    [(_TVStackWrappingView *)self bounds];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    double v17 = [(_TVStackWrappingView *)self stackView];
    v18 = (void *)MEMORY[0x263EFF980];
    v19 = [(_TVStackWrappingView *)self headerSupplementaryViews];
    v20 = objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));

    uint64_t v77 = 0;
    v78 = (double *)&v77;
    uint64_t v79 = 0x2020000000;
    uint64_t v80 = 0;
    uint64_t v71 = 0;
    v72 = (double *)&v71;
    uint64_t v73 = 0x4010000000;
    v74 = &unk_230C43B61;
    long long v21 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    long long v75 = *MEMORY[0x263F1D1C0];
    long long v76 = v21;
    v22 = [(_TVStackWrappingView *)self headerSupplementaryViews];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __99___TVStackWrappingView_configureSupplementaryCellLayoutAttributesWithAutomaticInsets_sectionIndex___block_invoke;
    v62[3] = &unk_264BA7808;
    uint64_t v66 = v10;
    uint64_t v67 = v12;
    uint64_t v68 = v14;
    uint64_t v69 = v16;
    int64_t v70 = a4;
    v64 = &v71;
    v65 = &v77;
    id v23 = v20;
    id v63 = v23;
    [v22 enumerateObjectsUsingBlock:v62];

    [v17 contentOffset];
    double v25 = v24;
    [v17 contentInset];
    double v27 = v26;
    double v55 = v25;
    objc_msgSend(v17, "tv_margin");
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v36 = v72[6];
    [(UIView *)self tv_padding];
    double v41 = v29 + v36;
    if (top + v41 + v78[3] >= v37) {
      double v42 = top + v41 + v78[3];
    }
    else {
      double v42 = v37;
    }
    if (left + v31 >= v38) {
      double v43 = left + v31;
    }
    else {
      double v43 = v38;
    }
    if (bottom + v33 >= v39) {
      double v44 = bottom + v33;
    }
    else {
      double v44 = v39;
    }
    if (right + v35 >= v40) {
      double v45 = right + v35;
    }
    else {
      double v45 = v40;
    }
    if ([(_TVStackWrappingView *)self shouldAdjustForTabBarSafeAreaInsets])
    {
      [(_TVStackWrappingView *)self safeAreaInsets];
      if (v42 < v46) {
        double v42 = v46;
      }
    }
    objc_msgSend(v17, "setContentInset:", v42, v43, v44, v45);
    if (v55 <= -v27)
    {
      objc_msgSend(v17, "contentOffset", -v27, v55);
      objc_msgSend(v17, "setContentOffset:");
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v47 = v23;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v58 objects:v81 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v59 != v49) {
            objc_enumerationMutation(v47);
          }
          v51 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          [v51 frame];
          objc_msgSend(v51, "setFrame:");
        }
        uint64_t v48 = [v47 countByEnumeratingWithState:&v58 objects:v81 count:16];
      }
      while (v48);
    }

    uint64_t v52 = [v47 count];
    if (v52) {
      v53 = (void *)[v47 copy];
    }
    else {
      v53 = 0;
    }
    objc_storeStrong((id *)&self->_supplementaryCellLayoutAttributes, v53);
    if (v52) {

    }
    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(&v77, 8);
  }
  else
  {
    supplementaryCellLayoutAttributes = self->_supplementaryCellLayoutAttributes;
    self->_supplementaryCellLayoutAttributes = 0;
  }
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  [(_TVStackWrappingView *)self layoutIfNeeded];
  double v3 = [(_TVStackWrappingView *)self stackView];
  if (v3)
  {
    double v4 = [(_TVStackWrappingView *)self stackView];
    v7[0] = v4;
    double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    double v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (UICollectionView)stackView
{
  return self->_stackView;
}

- (NSArray)headerSupplementaryViews
{
  return self->_headerSupplementaryViews;
}

- (void)setHeaderSupplementaryViews:(id)a3
{
}

- (BOOL)shouldAdjustForTabBarSafeAreaInsets
{
  return self->_shouldAdjustForTabBarSafeAreaInsets;
}

- (void)setShouldAdjustForTabBarSafeAreaInsets:(BOOL)a3
{
  self->_shouldAdjustForTabBarSafeAreaInsets = a3;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (BOOL)usesBackgroundImage
{
  return self->_usesBackgroundImage;
}

- (UIImage)backdropImage
{
  return self->_backdropImage;
}

- (BOOL)usesBackdropImage
{
  return self->_usesBackdropImage;
}

- (int64_t)backdropBlurEffectStyle
{
  return self->_backdropBlurEffectStyle;
}

- (double)backdropInitialPeek
{
  return self->_backdropInitialPeek;
}

- (double)backdropPeekGradient
{
  return self->_backdropPeekGradient;
}

- (double)backdropMaskFactor
{
  return self->_backdropMaskFactor;
}

- (NSArray)supplementaryCellLayoutAttributes
{
  return self->_supplementaryCellLayoutAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryCellLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_backdropImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_headerSupplementaryViews, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_maskedBackdropView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end