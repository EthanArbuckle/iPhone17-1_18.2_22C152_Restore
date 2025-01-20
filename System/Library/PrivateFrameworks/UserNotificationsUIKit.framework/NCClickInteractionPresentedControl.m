@interface NCClickInteractionPresentedControl
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)result;
- (MTMaterialView)_backgroundMaterialView;
- (NCClickInteractionPresentedControl)initWithTitle:(id)a3 materialRecipe:(int64_t)a4;
- (NCClickInteractionPresentedView)_presentedView;
- (NSString)_title;
- (NSString)preferredContentSizeCategory;
- (UITraitCollection)overrideTraitCollection;
- (id)_newMaterialViewWithRecipe:(int64_t)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_materialRecipe;
- (void)_configureContentViewIfNecessaryWithTitle:(id)a3;
- (void)_configureMaterialViewsIfNecessary;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setTitle:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOverrideTraitCollection:(id)a3;
@end

@implementation NCClickInteractionPresentedControl

- (NCClickInteractionPresentedControl)initWithTitle:(id)a3 materialRecipe:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NCClickInteractionPresentedControl;
  v7 = [(NCClickInteractionPresentedControl *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v9 = [(NCClickInteractionPresentedControl *)v7 layer];
    [v9 setHitTestsAsOpaque:1];

    v8->_materialRecipe = a4;
    [(NCClickInteractionPresentedControl *)v8 setAutoresizesSubviews:1];
    [(NCClickInteractionPresentedControl *)v8 setAccessibilityIdentifier:@"clear-all-button"];
    [(NCClickInteractionPresentedControl *)v8 _configureContentViewIfNecessaryWithTitle:v6];
    v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (v11 == 1)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v8];
      [(NCClickInteractionPresentedControl *)v8 addInteraction:v12];
    }
  }

  return v8;
}

- (void)_setCornerRadius:(double)a3
{
  [(NCClickInteractionPresentedControl *)self _configureMaterialViewsIfNecessary];
  backgroundMaterialView = self->_backgroundMaterialView;

  [(MTMaterialView *)backgroundMaterialView _setCornerRadius:a3];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  [(NCClickInteractionPresentedControl *)self _configureMaterialViewsIfNecessary];
  backgroundMaterialView = self->_backgroundMaterialView;

  [(MTMaterialView *)backgroundMaterialView _setContinuousCornerRadius:a3];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  presentedView = self->_presentedView;
  if (presentedView) {
    -[NCClickInteractionPresentedView sizeThatFits:](presentedView, "sizeThatFits:", result.width, result.height);
  }
  return result;
}

- (void)_setTitle:(id)a3
{
}

- (NSString)_title
{
  return [(NCClickInteractionPresentedView *)self->_presentedView title];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NCClickInteractionPresentedControl;
  unsigned int v5 = [(NCClickInteractionPresentedControl *)&v17 isHighlighted];
  v16.receiver = self;
  v16.super_class = (Class)NCClickInteractionPresentedControl;
  [(NCClickInteractionPresentedControl *)&v16 setHighlighted:v3];
  v15.receiver = self;
  v15.super_class = (Class)NCClickInteractionPresentedControl;
  unsigned int v6 = [(NCClickInteractionPresentedControl *)&v15 isHighlighted];
  if (v5 != v6)
  {
    char v7 = v6;
    [(NCClickInteractionPresentedControl *)self _configureMaterialViewsIfNecessary];
    backgroundMaterialView = self->_backgroundMaterialView;
    id v9 = objc_initWeak(&location, backgroundMaterialView);
    v10 = (void *)[(id)objc_opt_class() newDefaultHighlightAnimator];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__NCClickInteractionPresentedControl_setHighlighted___block_invoke;
    v11[3] = &unk_1E6A94DF8;
    objc_copyWeak(&v12, &location);
    char v13 = v7;
    [v10 addAnimations:v11];
    [v10 startAnimation];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

void __53__NCClickInteractionPresentedControl_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHighlighted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(NCClickInteractionPresentedControl *)self adjustForContentSizeCategoryChange];
  }
}

- (NSString)preferredContentSizeCategory
{
  v2 = [(NCClickInteractionPresentedView *)self->_presentedView preferredContentSizeCategory];
  BOOL v3 = v2;
  if (!v2) {
    v2 = (void *)*MEMORY[0x1E4FB27F0];
  }
  v4 = v2;

  return v4;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(NCClickInteractionPresentedView *)self->_presentedView adjustForContentSizeCategoryChange];
  if (v3) {
    [(NCClickInteractionPresentedControl *)self setNeedsLayout];
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FB1B28];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  v8 = (void *)MEMORY[0x1E4FB14C0];
  [v6 rect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  objc_super v17 = objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, 13.0);
  [v7 setVisiblePath:v17];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v7];
  v19 = [MEMORY[0x1E4FB1AB0] effectWithPreview:v18];
  v20 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v19 shape:0];

  return v20;
}

- (id)_newMaterialViewWithRecipe:(int64_t)a3
{
  v4 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:a3];
  [(NCClickInteractionPresentedControl *)self bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  return v4;
}

- (void)_configureMaterialViewsIfNecessary
{
  if (!self->_backgroundMaterialView)
  {
    BOOL v3 = [(NCClickInteractionPresentedControl *)self _newMaterialViewWithRecipe:self->_materialRecipe];
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v3;

    [(MTMaterialView *)self->_backgroundMaterialView setBlurEnabled:0];
    id v5 = self->_backgroundMaterialView;
    [(NCClickInteractionPresentedControl *)self insertSubview:v5 atIndex:0];
  }
}

- (void)_configureContentViewIfNecessaryWithTitle:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_presentedView)
  {
    id v16 = v4;
    id v5 = [[NCClickInteractionPresentedView alloc] initWithTitle:v4];
    presentedView = self->_presentedView;
    self->_presentedView = v5;

    [(NCClickInteractionPresentedView *)self->_presentedView setAdjustsFontForContentSizeCategory:[(NCClickInteractionPresentedControl *)self adjustsFontForContentSizeCategory]];
    id v7 = self->_presentedView;
    [(NCClickInteractionPresentedControl *)self bounds];
    -[NCClickInteractionPresentedView setFrame:](v7, "setFrame:");
    [(NCClickInteractionPresentedView *)self->_presentedView setAutoresizingMask:18];
    [(NCClickInteractionPresentedControl *)self _configureMaterialViewsIfNecessary];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = [(NCClickInteractionPresentedView *)self->_presentedView requiredVisualStyleCategories];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) integerValue];
          double v14 = self->_presentedView;
          double v15 = [(MTMaterialView *)self->_backgroundMaterialView visualStylingProviderForCategory:v13];
          [(NCClickInteractionPresentedView *)v14 setVisualStylingProvider:v15 forCategory:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [(NCClickInteractionPresentedControl *)self addSubview:self->_presentedView];
    id v4 = v16;
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NCClickInteractionPresentedView)_presentedView
{
  return self->_presentedView;
}

- (int64_t)_materialRecipe
{
  return self->_materialRecipe;
}

- (MTMaterialView)_backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (void)setOverrideTraitCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);

  objc_storeStrong((id *)&self->_presentedView, 0);
}

@end