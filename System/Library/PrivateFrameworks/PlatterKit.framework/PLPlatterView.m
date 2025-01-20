@interface PLPlatterView
+ (id)platterViewWithBlurEffectStyle:(int64_t)a3;
+ (id)platterViewWithStyle:(id)a3;
+ (id)platterViewWithStyle:(id)a3 inBundle:(id)a4;
- ($2162B30EF87954972E631D01CBA5CFD1)shadowAttributes;
- (BOOL)_isMaterialViewSufficientlySpecified;
- (BOOL)hasShadow;
- (BOOL)isBackgroundBlurred;
- (BOOL)isHighlighted;
- (BOOL)isRecipeDynamic;
- (BOOL)usesBackgroundView;
- (CGSize)contentSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTMaterialShadowView)backgroundMaterialShadowView;
- (MTMaterialView)backgroundMaterialView;
- (NSArray)requiredVisualStyleCategories;
- (NSString)materialGroupNameBase;
- (PLPlatterView)initWithFrame:(CGRect)a3;
- (PLPlatterView)initWithRecipe:(int64_t)a3;
- (PLPlatterView)initWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4;
- (UIEdgeInsets)shadowOutsets;
- (UIView)backgroundView;
- (UIView)customContentView;
- (double)_continuousCornerRadius;
- (double)cornerRadius;
- (id)_contentLight;
- (id)_initWithBlurEffectStyle:(int64_t)a3;
- (id)_initWithCarPlayBannerStyle;
- (id)_initWithNavigationBannerStyle;
- (id)_initWithNotificationsBannerStyle;
- (id)_initWithRecipe:(int64_t)a3 orRecipeNamesByTraitCollection:(id)a4 inBundle:(id)a5;
- (id)_innerEdgeLight;
- (id)_newCarPlayBannerStrokeView;
- (id)_newDefaultBackgroundView;
- (id)_outerEdgeLight;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)materialRecipe;
- (void)_configureBackgroundView:(id)a3;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureCustomContentView;
- (void)_configureCustomContentViewIfNecessary;
- (void)_configureLightViewsIfNecessary;
- (void)_configureShadowViewIfNecessary;
- (void)_invalidateShadowView;
- (void)_layoutShadowView;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setBackgroundBlurred:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setMaterialRecipe:(int64_t)a3;
- (void)setRecipeDynamic:(BOOL)a3;
- (void)setShadowAttributes:(id *)a3;
- (void)setUsesBackgroundView:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)startLightEffect;
- (void)stopLightEffect;
@end

@implementation PLPlatterView

- (id)_initWithNavigationBannerStyle
{
  v2 = [(PLPlatterView *)self initWithRecipe:0];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2030];
    [(PLPlatterView *)v2 setBackgroundView:v3];
  }
  return v2;
}

- (id)_initWithCarPlayBannerStyle
{
  v2 = [(PLPlatterView *)self initWithRecipe:15];
  v3 = v2;
  if (v2)
  {
    [(PLPlatterView *)v2 _setContinuousCornerRadius:20.0];
    int v7 = 1034147594;
    long long v8 = xmmword_1D9406D70;
    uint64_t v9 = 0x4030000000000000;
    [(PLPlatterView *)v3 setShadowAttributes:&v7];
    id v4 = [(PLPlatterView *)v3 _newCarPlayBannerStrokeView];
    v5 = [(PLPlatterView *)v3 customContentView];
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");
    [v5 addSubview:v4];
  }
  return v3;
}

- (id)_initWithNotificationsBannerStyle
{
  v2 = [(PLPlatterView *)self initWithRecipe:1];
  v3 = v2;
  if (v2)
  {
    [(PLPlatterView *)v2 setHasShadow:1];
    [(PLPlatterView *)v3 _setContinuousCornerRadius:23.5];
  }
  return v3;
}

- (id)_initWithBlurEffectStyle:(int64_t)a3
{
  v3 = [(PLPlatterView *)self initWithRecipe:MTMaterialRecipeForUIBlurEffectStyle()];
  id v4 = v3;
  if (v3)
  {
    [(PLPlatterView *)v3 setHasShadow:1];
    [(PLPlatterView *)v4 setRecipeDynamic:MTIsUIBlurEffectStyleDynamic()];
  }
  return v4;
}

- (id)_newCarPlayBannerStrokeView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v2 _setContinuousCornerRadius:20.0];
  [v2 setAutoresizingMask:18];
  v3 = [v2 layer];
  id v4 = [MEMORY[0x1E4F428B8] _carSystemQuaternaryColor];
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  v5 = [v2 layer];
  [v5 setBorderWidth:0.5];

  return v2;
}

+ (id)platterViewWithStyle:(id)a3
{
  return (id)[a1 platterViewWithStyle:a3 inBundle:0];
}

+ (id)platterViewWithBlurEffectStyle:(int64_t)a3
{
  id v3 = [[PLPlatterView alloc] _initWithBlurEffectStyle:a3];
  return v3;
}

- (PLPlatterView)initWithRecipe:(int64_t)a3
{
  return (PLPlatterView *)[(PLPlatterView *)self _initWithRecipe:a3 orRecipeNamesByTraitCollection:0 inBundle:0];
}

- (void)setBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    v10 = v5;
    if (v5) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = !self->_usesBackgroundView;
    }
    BOOL v8 = !v7;
    self->_usesBackgroundView = v8;
    uint64_t v9 = [(UIView *)*p_backgroundView superview];

    if (v9 == self) {
      [(UIView *)*p_backgroundView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(PLPlatterView *)self _configureBackgroundView:*p_backgroundView];
    [(PLPlatterView *)self setNeedsLayout];
    v5 = v10;
  }
}

- (void)setMaterialRecipe:(int64_t)a3
{
  if (self->_materialRecipe != a3)
  {
    self->_materialRecipe = a3;
    id v4 = [(PLPlatterView *)self backgroundMaterialView];
    [v4 setRecipe:self->_materialRecipe];
  }
}

- (void)setShadowAttributes:(id *)a3
{
  if (a3->var0 != self->_shadowAttributes.opacity
    || (a3->var1.width == self->_shadowAttributes.offset.width
      ? (BOOL v3 = a3->var1.height == self->_shadowAttributes.offset.height)
      : (BOOL v3 = 0),
        v3 ? (BOOL v4 = a3->var2 == self->_shadowAttributes.radius) : (BOOL v4 = 0),
        !v4))
  {
    long long v5 = *(_OWORD *)&a3->var1.height;
    *(_OWORD *)&self->_shadowAttributes.opacity = *(_OWORD *)&a3->var0;
    *(_OWORD *)&self->_shadowAttributes.offset.height = v5;
    [(PLPlatterView *)self _invalidateShadowView];
  }
}

- (UIEdgeInsets)shadowOutsets
{
  if ([(PLPlatterView *)self hasShadow])
  {
    [(PLPlatterView *)self _configureShadowViewIfNecessary];
    [(MTShadowView *)self->_shadowView shadowOutsets];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F437F8];
    double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)startLightEffect
{
  v11[1] = *MEMORY[0x1E4F143B8];
  contentLightView = self->_contentLightView;
  double v4 = [(PLPlatterView *)self _contentLight];
  v11[0] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(UIVisualEffectView *)contentLightView setBackgroundEffects:v5];

  edgeLightView = self->_edgeLightView;
  BOOL v7 = [(PLPlatterView *)self _innerEdgeLight];
  BOOL v8 = [(PLPlatterView *)self _outerEdgeLight];
  v10[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [(UIVisualEffectView *)edgeLightView setBackgroundEffects:v9];

  [(PLPlatterView *)self setAccessibilityIdentifier:@"platter-intelligence-light"];
}

- (void)stopLightEffect
{
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  [(UIVisualEffectView *)self->_contentLightView setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
  [(UIVisualEffectView *)self->_edgeLightView setBackgroundEffects:v3];
  [(PLPlatterView *)self setAccessibilityIdentifier:0];
}

- (PLPlatterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v7 = [(PLPlatterView *)self initWithRecipe:0];
  BOOL v8 = v7;
  if (v7) {
    -[PLPlatterView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PLPlatterView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);
  -[PLPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLPlatterView;
  [(PLPlatterView *)&v3 layoutSubviews];
  [(PLPlatterView *)self _configureShadowViewIfNecessary];
  [(PLPlatterView *)self _configureBackgroundViewIfNecessary];
  [(PLPlatterView *)self _configureCustomContentViewIfNecessary];
  [(PLPlatterView *)self _configureLightViewsIfNecessary];
  [(PLPlatterView *)self _layoutShadowView];
}

- (double)_continuousCornerRadius
{
  return self->_cornerRadius;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
    [(PLPlatterView *)self _invalidateShadowView];
    [(PLPlatterView *)self setNeedsLayout];
  }
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (width > 0.0 && height > 0.0)
  {
    -[PLPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", width, 0.0);
    double v6 = (double)((int)(height - v7) & ~((int)(height - v7) >> 31));
    double v5 = width;
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (UIView)customContentView
{
  [(PLPlatterView *)self _configureCustomContentViewIfNecessary];
  customContentView = self->_customContentView;
  return customContentView;
}

- (BOOL)hasShadow
{
  return self->_shadowAttributes.opacity > 0.0;
}

- (void)setHasShadow:(BOOL)a3
{
  if (a3)
  {
    if ([(PLPlatterView *)self hasShadow]) {
      return;
    }
    *(_OWORD *)&v4[4] = *MEMORY[0x1E4F1DB30];
    self->_shadowAttributes.opacitdouble y = 1.0;
    *(_OWORD *)(&self->_shadowAttributes.opacity + 1) = *(_OWORD *)v4;
    HIDWORD(self->_shadowAttributes.offset.height) = *(_DWORD *)&v4[16];
    self->_shadowAttributes.radius = 15.0;
  }
  else
  {
    self->_shadowAttributes.opacitdouble y = 0.0;
    [(PLPlatterView *)self _invalidateShadowView];
  }
  [(PLPlatterView *)self setNeedsLayout];
}

- (void)_invalidateShadowView
{
  [(MTShadowView *)self->_shadowView removeFromSuperview];
  shadowView = self->_shadowView;
  self->_shadowView = 0;

  [(PLPlatterView *)self setNeedsLayout];
}

- (void)_configureBackgroundView:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    [v5 setUserInteractionEnabled:0];
    [(PLPlatterView *)self _continuousCornerRadius];
    if (v4 > 0.0) {
      objc_msgSend(v5, "_setContinuousCornerRadius:");
    }
    [(PLPlatterView *)self bounds];
    objc_msgSend(v5, "setFrame:");
    [v5 setAutoresizingMask:18];
    if (self->_shadowView) {
      -[PLPlatterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5);
    }
    else {
      -[PLPlatterView insertSubview:atIndex:](self, "insertSubview:atIndex:", v5);
    }
  }
}

- (id)_newDefaultBackgroundView
{
  if (![(PLPlatterView *)self _isMaterialViewSufficientlySpecified]) {
    return 0;
  }
  uint64_t v3 = !self->_backgroundBlurred;
  if ([(PLPlatterView *)self hasShadow]) {
    v3 |= 8uLL;
  }
  int64_t materialRecipe = self->_materialRecipe;
  id v5 = (void *)MEMORY[0x1E4F743C8];
  if (materialRecipe)
  {
    double v6 = [(PLPlatterView *)self traitCollection];
    [v5 materialViewWithRecipe:materialRecipe options:v3 compatibleWithTraitCollection:v6];
  }
  else
  {
    recipeNamesByTraitCollection = self->_recipeNamesByTraitCollection;
    recipeBundle = self->_recipeBundle;
    double v6 = [(PLPlatterView *)self traitCollection];
    [v5 materialViewWithRecipeNamesByTraitCollection:recipeNamesByTraitCollection inBundle:recipeBundle options:v3 initialWeighting:0 scaleAdjustment:v6 compatibleWithTraitCollection:1.0];
  double v7 = };

  [v7 setRecipeDynamic:self->_recipeDynamic];
  v10 = [(PLPlatterView *)self materialGroupNameBase];
  [v7 setGroupNameBase:v10];

  return v7;
}

- (BOOL)_isMaterialViewSufficientlySpecified
{
  return self->_materialRecipe || self->_recipeNamesByTraitCollection != 0;
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView
    && self->_usesBackgroundView
    && [(PLPlatterView *)self _isMaterialViewSufficientlySpecified])
  {
    id v3 = [(PLPlatterView *)self _newDefaultBackgroundView];
    [(PLPlatterView *)self setBackgroundView:v3];
  }
}

- (void)_configureLightViewsIfNecessary
{
  if (!self->_contentLightView)
  {
    id v3 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4F43028]);
    contentLightView = self->_contentLightView;
    self->_contentLightView = v3;

    [(UIVisualEffectView *)self->_contentLightView setUserInteractionEnabled:0];
    [(PLPlatterView *)self _continuousCornerRadius];
    if (v5 > 0.0) {
      -[UIVisualEffectView _setContinuousCornerRadius:](self->_contentLightView, "_setContinuousCornerRadius:");
    }
    [(UIVisualEffectView *)self->_contentLightView setAutoresizingMask:18];
    double v6 = self->_contentLightView;
    [(PLPlatterView *)self bounds];
    -[UIVisualEffectView setFrame:](v6, "setFrame:");
    if (self->_backgroundView)
    {
      -[PLPlatterView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_contentLightView);
    }
    else
    {
      double v7 = self->_contentLightView;
      if (self->_shadowView)
      {
        -[PLPlatterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v7);
      }
      else
      {
        [(PLPlatterView *)self addSubview:v7];
        [(PLPlatterView *)self sendSubviewToBack:self->_contentLightView];
      }
    }
  }
  if (!self->_edgeLightView)
  {
    BOOL v8 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4F43028]);
    edgeLightView = self->_edgeLightView;
    self->_edgeLightView = v8;

    [(UIVisualEffectView *)self->_edgeLightView setUserInteractionEnabled:0];
    [(PLPlatterView *)self _continuousCornerRadius];
    if (v10 > 0.0) {
      -[UIVisualEffectView _setContinuousCornerRadius:](self->_edgeLightView, "_setContinuousCornerRadius:");
    }
    [(UIVisualEffectView *)self->_edgeLightView setAutoresizingMask:18];
    v11 = self->_edgeLightView;
    [(PLPlatterView *)self bounds];
    -[UIVisualEffectView setFrame:](v11, "setFrame:");
    if (self->_backgroundView)
    {
      v12 = self->_edgeLightView;
LABEL_15:
      -[PLPlatterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v12);
      return;
    }
    v12 = self->_edgeLightView;
    if (self->_shadowView) {
      goto LABEL_15;
    }
    [(PLPlatterView *)self addSubview:v12];
    v13 = self->_edgeLightView;
    [(PLPlatterView *)self sendSubviewToBack:v13];
  }
}

- (void)_configureShadowViewIfNecessary
{
  if ([(PLPlatterView *)self hasShadow])
  {
    if (!self->_shadowView)
    {
      id v3 = objc_alloc(MEMORY[0x1E4F743D0]);
      [(PLPlatterView *)self _continuousCornerRadius];
      long long v4 = *(_OWORD *)&self->_shadowAttributes.offset.height;
      v7[0] = *(_OWORD *)&self->_shadowAttributes.opacity;
      v7[1] = v4;
      double v5 = (MTShadowView *)objc_msgSend(v3, "initWithShadowAttributes:maskCornerRadius:", v7);
      shadowView = self->_shadowView;
      self->_shadowView = v5;

      [(PLPlatterView *)self insertSubview:self->_shadowView atIndex:0];
    }
  }
}

- (void)_layoutShadowView
{
  shadowView = self->_shadowView;
  if (shadowView)
  {
    [(PLPlatterView *)self bounds];
    -[MTShadowView frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:");
    long long v4 = self->_shadowView;
    -[MTShadowView setFrame:](v4, "setFrame:");
  }
}

- (id)_innerEdgeLight
{
  id v2 = objc_alloc(MEMORY[0x1E4F431C8]);
  id v3 = [MEMORY[0x1E4F431D0] sharedShimmeringLight];
  long long v4 = (void *)[v2 initWithLightSource:v3 radius:0 region:3.0];

  [v4 setActivationTransitionDirection:2];
  return v4;
}

- (id)_outerEdgeLight
{
  id v2 = objc_alloc(MEMORY[0x1E4F431C8]);
  id v3 = [MEMORY[0x1E4F431D0] sharedShimmeringLight];
  long long v4 = (void *)[v2 initWithLightSource:v3 radius:1 region:10.0];

  [v4 setActivationTransitionDirection:2];
  return v4;
}

- (id)_contentLight
{
  id v2 = objc_alloc(MEMORY[0x1E4F431C0]);
  id v3 = [MEMORY[0x1E4F431D0] sharedLight];
  long long v4 = (void *)[v2 initWithLightSource:v3];

  [v4 setActivationTransitionDirection:2];
  [v4 setDeactivationTransitionDirection:0];
  return v4;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  categoriesToProviders = self->_categoriesToProviders;
  double v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  double v7 = [(NSMutableDictionary *)categoriesToProviders objectForKey:v6];

  if (!v7)
  {
    [(PLPlatterView *)self _configureBackgroundViewIfNecessary];
    BOOL v8 = [(PLPlatterView *)self backgroundMaterialView];
    double v7 = [v8 visualStylingProviderForCategory:a3];
  }
  return v7;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F3358EC0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v10 = a3;
  if (!self->_categoriesToProviders)
  {
    double v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    categoriesToProviders = self->_categoriesToProviders;
    self->_categoriesToProviders = v6;
  }
  BOOL v8 = [NSNumber numberWithInteger:a4];
  uint64_t v9 = self->_categoriesToProviders;
  if (v10) {
    [(NSMutableDictionary *)v9 setObject:v10 forKey:v8];
  }
  else {
    [(NSMutableDictionary *)v9 removeObjectForKey:v8];
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_materialGroupNameBase] & 1) == 0)
  {
    long long v4 = (NSString *)[v7 copy];
    materialGroupNameBase = self->_materialGroupNameBase;
    self->_materialGroupNameBase = v4;

    double v6 = [(PLPlatterView *)self backgroundMaterialView];
    [v6 setGroupNameBase:self->_materialGroupNameBase];
  }
}

- (BOOL)isBackgroundBlurred
{
  return self->_backgroundBlurred;
}

- (void)setBackgroundBlurred:(BOOL)a3
{
  self->_backgroundBlurred = a3;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)usesBackgroundView
{
  return self->_usesBackgroundView;
}

- (void)setUsesBackgroundView:(BOOL)a3
{
  self->_usesBackgroundView = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- ($2162B30EF87954972E631D01CBA5CFD1)shadowAttributes
{
  long long v3 = *(_OWORD *)&self[16].var1.height;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[16].var0;
  *(_OWORD *)&retstr->var1.double height = v3;
  return self;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_recipeBundle, 0);
  objc_storeStrong((id *)&self->_recipeNamesByTraitCollection, 0);
  objc_storeStrong((id *)&self->_categoriesToProviders, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_edgeLightView, 0);
  objc_storeStrong((id *)&self->_contentLightView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

+ (id)platterViewWithStyle:(id)a3 inBundle:(id)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"navigationBanner"])
  {
    double v5 = [[PLPlatterView alloc] _initWithNavigationBannerStyle];
  }
  else if ([v4 isEqualToString:@"carPlayBanner"])
  {
    double v5 = [[PLPlatterView alloc] _initWithCarPlayBannerStyle];
  }
  else if ([v4 isEqualToString:@"notificationBanner"])
  {
    double v5 = [[PLPlatterView alloc] _initWithNotificationsBannerStyle];
  }
  else
  {
    double v5 = objc_alloc_init(PLPlatterView);
  }
  double v6 = v5;

  return v6;
}

- (MTMaterialView)backgroundMaterialView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    backgroundView = self->_backgroundView;
  }
  else {
    backgroundView = 0;
  }
  return (MTMaterialView *)backgroundView;
}

- (PLPlatterView)initWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4
{
  return (PLPlatterView *)[(PLPlatterView *)self _initWithRecipe:0 orRecipeNamesByTraitCollection:a3 inBundle:a4];
}

- (BOOL)isHighlighted
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  backgroundView = self->_backgroundView;
  return [(UIView *)backgroundView isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView setHighlighted:v3];
  }
}

- (BOOL)isRecipeDynamic
{
  return self->_recipeDynamic;
}

- (void)setRecipeDynamic:(BOOL)a3
{
  if (self->_recipeDynamic != a3)
  {
    BOOL v3 = a3;
    self->_recipeDynamic = a3;
    id v4 = [(PLPlatterView *)self backgroundMaterialView];
    [v4 setRecipeDynamic:v3];
  }
}

- (void)_configureCustomContentViewIfNecessary
{
  if (!self->_customContentView) {
    [(PLPlatterView *)self _configureCustomContentView];
  }
}

- (id)_initWithRecipe:(int64_t)a3 orRecipeNamesByTraitCollection:(id)a4 inBundle:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLPlatterView;
  v11 = -[PLPlatterView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_int64_t materialRecipe = a3;
    p_recipeNamesByTraitCollection = &v11->_recipeNamesByTraitCollection;
    objc_storeStrong((id *)&v11->_recipeNamesByTraitCollection, a4);
    if (*(void *)(v12 + 504))
    {
      if (*p_recipeNamesByTraitCollection)
      {
        v14 = PLLogGeneral;
        if (os_log_type_enabled((os_log_t)PLLogGeneral, OS_LOG_TYPE_ERROR)) {
          -[PLPlatterView(SubclassOverrides) _initWithRecipe:orRecipeNamesByTraitCollection:inBundle:](v12, v14);
        }
      }
    }
    objc_storeStrong((id *)(v12 + 464), a5);
    *(unsigned char *)(v12 + 481) = 1;
    [(id)v12 _setContinuousCornerRadius:13.0];
    *(unsigned char *)(v12 + 480) = 1;
    *(unsigned char *)(v12 + 440) = 1;
    [(id)v12 setPreservesSuperviewLayoutMargins:1];
  }

  return (id)v12;
}

- (void)_configureCustomContentView
{
  BOOL v3 = [[PLPlatterCustomContentView alloc] initWithAncestorPlatterView:self];
  customContentView = self->_customContentView;
  self->_customContentView = &v3->super;

  [(UIView *)self->_customContentView setAutoresizingMask:18];
  [(PLPlatterView *)self addSubview:self->_customContentView];
  double v5 = self->_customContentView;
  [(PLPlatterView *)self bringSubviewToFront:v5];
}

- (MTMaterialShadowView)backgroundMaterialShadowView
{
  return 0;
}

@end