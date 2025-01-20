@interface PLGlyphControl
+ (id)dismissControlWithMaterialRecipe:(int64_t)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isBlurEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTMaterialView)_backgroundMaterialView;
- (NSArray)requiredVisualStyleCategories;
- (NSString)materialGroupNameBase;
- (PLGlyphControl)initWithMaterialRecipe:(int64_t)a3;
- (UIImage)glyph;
- (UIImageView)_glyphView;
- (double)_cornerRadius;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)materialRecipe;
- (int64_t)visualStyle;
- (void)_configureBackgroundMaterialViewIfNecessary;
- (void)_configureGlyphViewIfNecessaryWithImage:(id)a3;
- (void)_configureMaterialViewIfNecessary:(id *)a3 positioningAtIndex:(unint64_t)a4;
- (void)_handleTouchUpInsideWithEvent:(id)a3;
- (void)_removeAllVisualStyling;
- (void)_removeVisualStylingOfView:(id)a3;
- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4;
- (void)_updateGlyphViewVisualStyling;
- (void)_updateVisualStylingOfView:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundMaterialView:(id)a3;
- (void)setBlurEnabled:(BOOL)a3;
- (void)setGlyph:(id)a3;
- (void)setGlyphView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setVisualStyle:(int64_t)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation PLGlyphControl

+ (id)dismissControlWithMaterialRecipe:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithMaterialRecipe:a3];
  v4 = (void *)MEMORY[0x1E4F42A80];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v4 imageNamed:@"x" inBundle:v5 compatibleWithTraitCollection:0];
  v7 = [v6 imageWithRenderingMode:2];
  [v3 setGlyph:v7];

  [v3 setAccessibilityIdentifier:@"dismiss-expanded-button"];
  return v3;
}

- (PLGlyphControl)initWithMaterialRecipe:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLGlyphControl;
  v4 = [(PLGlyphControl *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_materialRecipe = a3;
    v4->_visualStyle = -1;
    v4->_blurEnabled = 1;
    v6 = [(PLGlyphControl *)v4 layer];
    [v6 setAllowsGroupBlending:0];
  }
  return v5;
}

- (UIImage)glyph
{
  return [(UIImageView *)self->_glyphView image];
}

- (void)setGlyph:(id)a3
{
  id v6 = a3;
  v4 = [(PLGlyphControl *)self glyph];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0) {
    [(PLGlyphControl *)self _configureGlyphViewIfNecessaryWithImage:v6];
  }
}

- (void)setVisualStyle:(int64_t)a3
{
  if (self->_visualStyle != a3)
  {
    [(PLGlyphControl *)self _removeAllVisualStyling];
    self->_visualStyle = a3;
    [(PLGlyphControl *)self _updateAllVisualStyling];
  }
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (self->_blurEnabled != a3)
  {
    self->_blurEnabled = a3;
    -[MTMaterialView setBlurEnabled:](self->_backgroundMaterialView, "setBlurEnabled:");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLGlyphControl;
  unsigned int v5 = [(PLGlyphControl *)&v17 isHighlighted];
  v16.receiver = self;
  v16.super_class = (Class)PLGlyphControl;
  [(PLGlyphControl *)&v16 setHighlighted:v3];
  v15.receiver = self;
  v15.super_class = (Class)PLGlyphControl;
  unsigned int v6 = [(PLGlyphControl *)&v15 isHighlighted];
  if (v5 != v6)
  {
    char v7 = v6;
    [(PLGlyphControl *)self _configureBackgroundMaterialViewIfNecessary];
    backgroundMaterialView = self->_backgroundMaterialView;
    id v9 = objc_initWeak(&location, backgroundMaterialView);
    v10 = (void *)[(id)objc_opt_class() newDefaultHighlightAnimator];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__PLGlyphControl_setHighlighted___block_invoke;
    v11[3] = &unk_1E6B5F778;
    objc_copyWeak(&v12, &location);
    char v13 = v7;
    [v10 addAnimations:v11];
    [v10 startAnimation];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

void __33__PLGlyphControl_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHighlighted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  v7.receiver = self;
  v7.super_class = (Class)PLGlyphControl;
  [(PLGlyphControl *)&v7 _sendActionsForEvents:a3 withEvent:v6];
  if ((a3 & 0x40) != 0) {
    [(PLGlyphControl *)self _handleTouchUpInsideWithEvent:v6];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 34.0;
  double v4 = 34.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_cornerRadius
{
  [(PLGlyphControl *)self bounds];
  return CGRectGetHeight(v3) * 0.5;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PLGlyphControl;
  [(PLGlyphControl *)&v13 layoutSubviews];
  [(PLGlyphControl *)self _configureBackgroundMaterialViewIfNecessary];
  [(PLGlyphControl *)self _cornerRadius];
  -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundMaterialView, "_setContinuousCornerRadius:");
  [(PLGlyphControl *)self bounds];
  -[MTMaterialView setFrame:](self->_backgroundMaterialView, "setFrame:");
  CGRect v3 = [(UIImageView *)self->_glyphView image];
  [v3 size];
  BSRectWithSize();
  double v12 = PLMainScreenScale();
  UIRectCenteredIntegralRectScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIImageView setFrame:](self->_glyphView, "setFrame:", v5, v7, v9, v11, *(void *)&v12);
}

- (NSString)materialGroupNameBase
{
  return (NSString *)[(MTMaterialView *)self->_backgroundMaterialView groupNameBase];
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v6 = a3;
  double v4 = [(PLGlyphControl *)self materialGroupNameBase];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(PLGlyphControl *)self _configureBackgroundMaterialViewIfNecessary];
    [(MTMaterialView *)self->_backgroundMaterialView setGroupNameBase:v6];
  }
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  return self->_visualStylingProvider;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = (MTVisualStylingProvider *)a3;
  if (self->_visualStylingProvider != v6)
  {
    double v7 = v6;
    [(PLGlyphControl *)self _removeAllVisualStyling];
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [(PLGlyphControl *)self _updateAllVisualStyling];
    id v6 = v7;
  }
}

- (void)_updateGlyphViewVisualStyling
{
}

- (void)_configureGlyphViewIfNecessaryWithImage:(id)a3
{
  if (a3 && !self->_glyphView)
  {
    double v4 = (objc_class *)MEMORY[0x1E4F42AA0];
    id v5 = a3;
    id v6 = (UIImageView *)[[v4 alloc] initWithImage:v5];

    glyphView = self->_glyphView;
    self->_glyphView = v6;

    [(UIImageView *)self->_glyphView setContentMode:1];
    [(PLGlyphControl *)self _updateGlyphViewVisualStyling];
    [(PLGlyphControl *)self addSubview:self->_glyphView];
    [(PLGlyphControl *)self setNeedsLayout];
  }
}

- (void)_configureMaterialViewIfNecessary:(id *)a3 positioningAtIndex:(unint64_t)a4
{
  if (a3 && !*a3 && self->_materialRecipe)
  {
    objc_msgSend(MEMORY[0x1E4F743C8], "materialViewWithRecipe:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    *a3 = v7;
    [(PLGlyphControl *)self insertSubview:v7 atIndex:a4];
    [(PLGlyphControl *)self setNeedsLayout];
  }
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  backgroundMaterialView = self->_backgroundMaterialView;
  CGRect v3 = backgroundMaterialView;
  [(PLGlyphControl *)self _configureMaterialViewIfNecessary:&backgroundMaterialView positioningAtIndex:0];
  double v4 = backgroundMaterialView;

  [(MTMaterialView *)v4 setBlurEnabled:self->_blurEnabled];
  id v5 = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v4;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (int64_t)visualStyle
{
  return self->_visualStyle;
}

- (BOOL)isBlurEnabled
{
  return self->_blurEnabled;
}

- (UIImageView)_glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
}

- (MTMaterialView)_backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (void)setBackgroundMaterialView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

- (void)_updateVisualStylingOfView:(id)a3
{
  id v4 = a3;
  if (v4 && self->_materialRecipe)
  {
    id v9 = v4;
    [(PLGlyphControl *)self _configureBackgroundMaterialViewIfNecessary];
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider)
    {
      id v6 = visualStylingProvider;
    }
    else
    {
      id v6 = [(MTMaterialView *)self->_backgroundMaterialView visualStylingProviderForCategory:1];
    }
    id v7 = v6;
    if (self->_visualStyle == -1) {
      int64_t visualStyle = 1;
    }
    else {
      int64_t visualStyle = self->_visualStyle;
    }
    [(MTVisualStylingProvider *)v6 automaticallyUpdateView:v9 withStyle:visualStyle andObserverBlock:&__block_literal_global];

    id v4 = v9;
  }
}

id __64__PLGlyphControl_SubclassUtilities___updateVisualStylingOfView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 alpha];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PLGlyphControl_SubclassUtilities___updateVisualStylingOfView___block_invoke_2;
  v6[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v6[4] = v3;
  id v4 = (void *)MEMORY[0x1D948D440](v6);
  return v4;
}

uint64_t __64__PLGlyphControl_SubclassUtilities___updateVisualStylingOfView___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

- (void)_removeVisualStylingOfView:(id)a3
{
}

- (void)_removeAllVisualStyling
{
}

- (void)_handleTouchUpInsideWithEvent:(id)a3
{
}

@end