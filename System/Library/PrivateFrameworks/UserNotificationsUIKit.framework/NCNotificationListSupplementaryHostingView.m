@interface NCNotificationListSupplementaryHostingView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)auxiliaryOptionsVisible;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hasContentForAuxiliaryOptions;
- (BOOL)isHostedViewUserInteractionEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCAuxiliaryOptionsView)auxiliaryOptionsView;
- (NCNotificationListSupplementaryHostingView)init;
- (NCNotificationListSupplementaryHostingViewDelegate)delegate;
- (NSArray)auxiliaryOptionActions;
- (NSArray)auxiliaryOptionButtons;
- (NSString)auxiliaryOptionsBackgroundCompositingFilter;
- (NSString)auxiliaryOptionsSummaryText;
- (NSString)materialGroupNameBase;
- (PLPlatterView)platterView;
- (UIColor)auxiliaryOptionsBackgroundColor;
- (UIColor)auxiliaryOptionsTextColor;
- (UIColor)materialTintColor;
- (UIView)hostedView;
- (int64_t)materialRecipe;
- (void)_configureAuxiliaryOptionsViewIfNecessary;
- (void)_configureBackgroundTintViewIfNecessary;
- (void)_configurePlatterViewIfNecessary;
- (void)_configureViewToBlockOutOfProcessUIInteractionsIfNecessary;
- (void)_layoutAuxiliaryOptionsView;
- (void)_layoutHostedView;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_tapGestureRecognized:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAuxiliaryOptionActions:(id)a3;
- (void)setAuxiliaryOptionsBackgroundColor:(id)a3;
- (void)setAuxiliaryOptionsBackgroundCompositingFilter:(id)a3;
- (void)setAuxiliaryOptionsSummaryText:(id)a3;
- (void)setAuxiliaryOptionsTextColor:(id)a3;
- (void)setAuxiliaryOptionsVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHostedView:(id)a3;
- (void)setHostedViewUserInteractionEnabled:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setMaterialRecipe:(int64_t)a3;
- (void)setMaterialTintColor:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation NCNotificationListSupplementaryHostingView

- (NCNotificationListSupplementaryHostingView)init
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationListSupplementaryHostingView;
  v2 = -[NCDimmableView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    [(NCNotificationListSupplementaryHostingView *)v2 _setContinuousCornerRadius:23.5];
    v4 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = v4;

    [(NCNotificationListSupplementaryHostingView *)v3 addGestureRecognizer:v3->_tapGestureRecognizer];
    [(UITapGestureRecognizer *)v3->_tapGestureRecognizer addTarget:v3 action:sel__tapGestureRecognized_];
    [(UITapGestureRecognizer *)v3->_tapGestureRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v3->_tapGestureRecognizer setDelegate:v3];
    v3->_adjustsFontForContentSizeCategory = 1;
  }
  return v3;
}

- (void)setHostedView:(id)a3
{
  v5 = (UIView *)a3;
  p_hostedView = &self->_hostedView;
  hostedView = self->_hostedView;
  if (hostedView != v5)
  {
    v10 = v5;
    [(UIView *)hostedView removeFromSuperview];
    v8 = *p_hostedView;
    *p_hostedView = 0;

    objc_storeStrong((id *)&self->_hostedView, a3);
    [(NCDimmableView *)self setViewToFadeWhenDimming:*p_hostedView];
    if (v10)
    {
      [(NCNotificationListSupplementaryHostingView *)self _configurePlatterViewIfNecessary];
      v9 = [(PLPlatterView *)self->_platterView customContentView];
      [v9 addSubview:v10];
    }
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
    v5 = v10;
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSupplementaryHostingView;
  -[NCNotificationListSupplementaryHostingView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:v3];
  BOOL v5 = v3 && self->_hostedViewUserInteractionEnabled;
  [(NCNotificationListSupplementaryHostingView *)self _blockOutOfProcessUIInteractions:v5];
}

- (void)setHostedViewUserInteractionEnabled:(BOOL)a3
{
  self->_hostedViewUserInteractionEnabled = a3;
  -[NCNotificationListSupplementaryHostingView _blockOutOfProcessUIInteractions:](self, "_blockOutOfProcessUIInteractions:");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationListSupplementaryHostingView;
  -[NCNotificationListSupplementaryHostingView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(PLPlatterView *)self->_platterView _setContinuousCornerRadius:a3];
  [(UIView *)self->_hostedView _setContinuousCornerRadius:a3];
  [(NCNotificationListStackBackgroundDimmingView *)self->_backgroundTintView _setContinuousCornerRadius:a3];
}

- (BOOL)auxiliaryOptionsVisible
{
  return [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView auxiliaryOptionsVisible];
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCNotificationListSupplementaryHostingView *)self auxiliaryOptionsVisible] != a3)
  {
    [(NCNotificationListSupplementaryHostingView *)self _configureAuxiliaryOptionsViewIfNecessary];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __73__NCNotificationListSupplementaryHostingView_setAuxiliaryOptionsVisible___block_invoke;
    v5[3] = &unk_1E6A91BB0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsVisible:v3];
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
  }
}

uint64_t __73__NCNotificationListSupplementaryHostingView_setAuxiliaryOptionsVisible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
  id v5 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsSummaryText, a3);
    [(NCNotificationListSupplementaryHostingView *)self _configureAuxiliaryOptionsViewIfNecessary];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsSummaryText:v5];
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
  }
}

- (void)setAuxiliaryOptionActions:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, a3);
  id v5 = a3;
  [(NCNotificationListSupplementaryHostingView *)self _configureAuxiliaryOptionsViewIfNecessary];
  [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionActions:v5];

  [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
}

- (NSArray)auxiliaryOptionButtons
{
  return [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView auxiliaryOptionButtons];
}

- (void)setAuxiliaryOptionsTextColor:(id)a3
{
  p_auxiliaryOptionsTextColor = &self->_auxiliaryOptionsTextColor;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsTextColor, a3);
    [(NCNotificationListSupplementaryHostingView *)self _configureAuxiliaryOptionsViewIfNecessary];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsTextColor:*p_auxiliaryOptionsTextColor];
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
  }
}

- (void)setAuxiliaryOptionsBackgroundColor:(id)a3
{
  p_auxiliaryOptionsBackgroundColor = &self->_auxiliaryOptionsBackgroundColor;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, a3);
    [(NCNotificationListSupplementaryHostingView *)self _configureAuxiliaryOptionsViewIfNecessary];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsBackgroundColor:*p_auxiliaryOptionsBackgroundColor];
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
  }
}

- (void)setAuxiliaryOptionsBackgroundCompositingFilter:(id)a3
{
  p_auxiliaryOptionsBackgroundCompositingFilter = &self->_auxiliaryOptionsBackgroundCompositingFilter;
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, a3);
    [(NCNotificationListSupplementaryHostingView *)self _configureAuxiliaryOptionsViewIfNecessary];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsBackgroundCompositingFilter:*p_auxiliaryOptionsBackgroundCompositingFilter];
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  if (objc_opt_respondsToSelector()) {
    int v3 = [(PLPlatterView *)self->_platterView adjustForContentSizeCategoryChange];
  }
  else {
    int v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(UIView *)self->_hostedView adjustForContentSizeCategoryChange] & 1) != 0)
  {
    int v3 = 1;
  }
  int v4 = [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView adjustForContentSizeCategoryChange] | v3;
  if (v4 == 1) {
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
  }
  return v4;
}

- (void)setMaterialRecipe:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_materialRecipe != a3)
  {
    self->_materialRecipe = a3;
    -[PLPlatterView setMaterialRecipe:](self->_platterView, "setMaterialRecipe:");
    if (objc_opt_respondsToSelector())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      int v4 = [(UIView *)self->_hostedView requiredVisualStyleCategories];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) integerValue];
            hostedView = self->_hostedView;
            v11 = [(PLPlatterView *)self->_platterView visualStylingProviderForCategory:v9];
            [(UIView *)hostedView setVisualStylingProvider:v11 forCategory:v9];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
    }
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setMaterialRecipe:self->_materialRecipe];
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
  }
}

- (void)setMaterialTintColor:(id)a3
{
  id v5 = a3;
  if ((NCIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_materialTintColor, a3);
    [(NCNotificationListStackBackgroundDimmingView *)self->_backgroundTintView setBackgroundColor:v5];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setMaterialTintColor:v5];
    [(NCNotificationListSupplementaryHostingView *)self setNeedsLayout];
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  id v5 = a3;
  [(PLPlatterView *)self->_platterView setMaterialGroupNameBase:v5];
  [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setMaterialGroupNameBase:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(NCNotificationListSupplementaryHostingView *)self hostedView];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;

  if ([(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView auxiliaryOptionsVisible])
  {
    auxiliaryOptionsView = self->_auxiliaryOptionsView;
    if (auxiliaryOptionsView) {
      -[NCAuxiliaryOptionsView sizeThatFits:](auxiliaryOptionsView, "sizeThatFits:", width, height);
    }
    else {
      double v10 = 0.0;
    }
    double v8 = v8 + v10;
  }
  double v11 = width;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSupplementaryHostingView;
  [(NCNotificationListSupplementaryHostingView *)&v3 layoutSubviews];
  [(NCNotificationListSupplementaryHostingView *)self _configurePlatterViewIfNecessary];
  [(NCNotificationListSupplementaryHostingView *)self _configureBackgroundTintViewIfNecessary];
  [(NCNotificationListSupplementaryHostingView *)self _layoutHostedView];
  [(NCNotificationListSupplementaryHostingView *)self _layoutAuxiliaryOptionsView];
}

- (void)_configurePlatterViewIfNecessary
{
  if (!self->_platterView)
  {
    objc_super v3 = (PLPlatterView *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:self->_materialRecipe];
    platterView = self->_platterView;
    self->_platterView = v3;

    [(PLPlatterView *)self->_platterView setMaterialGroupNameBase:self->_materialGroupNameBase];
    [(NCNotificationListSupplementaryHostingView *)self addSubview:self->_platterView];
    [(NCNotificationListSupplementaryHostingView *)self sendSubviewToBack:self->_platterView];
    id v5 = self->_platterView;
    [(NCNotificationListSupplementaryHostingView *)self _continuousCornerRadius];
    -[PLPlatterView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
    uint64_t v6 = self->_platterView;
    [(NCNotificationListSupplementaryHostingView *)self bounds];
    -[PLPlatterView setFrame:](v6, "setFrame:");
    double v7 = self->_platterView;
    [(PLPlatterView *)v7 setAutoresizingMask:18];
  }
}

- (void)_configureBackgroundTintViewIfNecessary
{
  materialTintColor = self->_materialTintColor;
  backgroundTintView = self->_backgroundTintView;
  if (materialTintColor)
  {
    if (backgroundTintView) {
      return;
    }
    [(NCNotificationListSupplementaryHostingView *)self _configurePlatterViewIfNecessary];
    id v5 = [NCNotificationListStackBackgroundDimmingView alloc];
    [(NCNotificationListSupplementaryHostingView *)self bounds];
    uint64_t v6 = -[NCNotificationListStackBackgroundDimmingView initWithFrame:](v5, "initWithFrame:");
    double v7 = self->_backgroundTintView;
    self->_backgroundTintView = v6;

    double v8 = [(PLPlatterView *)self->_platterView customContentView];
    [v8 addSubview:self->_backgroundTintView];

    uint64_t v9 = [(PLPlatterView *)self->_platterView customContentView];
    [v9 sendSubviewToBack:self->_backgroundTintView];

    [(NCNotificationListStackBackgroundDimmingView *)self->_backgroundTintView setBackgroundColor:self->_materialTintColor];
    double v10 = self->_backgroundTintView;
    [(NCNotificationListSupplementaryHostingView *)self _continuousCornerRadius];
    -[NCNotificationListStackBackgroundDimmingView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:");
    double v11 = self->_backgroundTintView;
  }
  else
  {
    if (!backgroundTintView) {
      return;
    }
    [(NCNotificationListStackBackgroundDimmingView *)backgroundTintView removeFromSuperview];
    double v12 = self->_backgroundTintView;
    self->_backgroundTintView = 0;

    double v11 = 0;
  }

  [(NCDimmableView *)self setBackgroundDimmingView:v11];
}

- (void)_configureAuxiliaryOptionsViewIfNecessary
{
  if (!self->_auxiliaryOptionsView)
  {
    if ([(NCNotificationListSupplementaryHostingView *)self hasContentForAuxiliaryOptions])
    {
      objc_super v3 = objc_alloc_init(NCAuxiliaryOptionsView);
      auxiliaryOptionsView = self->_auxiliaryOptionsView;
      self->_auxiliaryOptionsView = v3;

      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAdjustsFontForContentSizeCategory:[(NCNotificationListSupplementaryHostingView *)self adjustsFontForContentSizeCategory]];
      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionActions:self->_auxiliaryOptionActions];
      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsTextColor:self->_auxiliaryOptionsTextColor];
      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsSummaryText:self->_auxiliaryOptionsSummaryText];
      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsBackgroundColor:self->_auxiliaryOptionsBackgroundColor];
      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsBackgroundCompositingFilter:self->_auxiliaryOptionsBackgroundCompositingFilter];
      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setMaterialRecipe:self->_materialRecipe];
      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setMaterialTintColor:self->_materialTintColor];
      [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setMaterialGroupNameBase:self->_materialGroupNameBase];
      id v5 = self->_auxiliaryOptionsView;
      [(NCNotificationListSupplementaryHostingView *)self _continuousCornerRadius];
      -[NCAuxiliaryOptionsView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
      uint64_t v6 = [(PLPlatterView *)self->_platterView customContentView];
      [v6 addSubview:self->_auxiliaryOptionsView];

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __87__NCNotificationListSupplementaryHostingView__configureAuxiliaryOptionsViewIfNecessary__block_invoke;
      v7[3] = &unk_1E6A91BB0;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    }
  }
}

uint64_t __87__NCNotificationListSupplementaryHostingView__configureAuxiliaryOptionsViewIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 608) layoutIfNeeded];
}

- (void)_layoutHostedView
{
  [(NCNotificationListSupplementaryHostingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(NCNotificationListSupplementaryHostingView *)self hostedView];
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  double v13 = v12;

  -[NCNotificationListStackBackgroundDimmingView setFrame:](self->_backgroundTintView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_viewToBlockOutOfProcessUIInteractions, "setFrame:", v4, v6, v8, v10);
  hostedView = self->_hostedView;

  -[UIView setFrame:](hostedView, "setFrame:", v4, v6, v8, v13);
}

- (void)_layoutAuxiliaryOptionsView
{
  if (self->_auxiliaryOptionsView)
  {
    [(NCNotificationListSupplementaryHostingView *)self bounds];
    -[NCAuxiliaryOptionsView sizeThatFits:](self->_auxiliaryOptionsView, "sizeThatFits:", v3, v4);
    BSRectWithSize();
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(UIView *)self->_hostedView frame];
    -[NCAuxiliaryOptionsView setFrame:](self->_auxiliaryOptionsView, "setFrame:", v6, CGRectGetMaxY(v13), v8, v10);
    auxiliaryOptionsView = self->_auxiliaryOptionsView;
    [(NCNotificationListSupplementaryHostingView *)self _continuousCornerRadius];
    -[NCAuxiliaryOptionsView _setContinuousCornerRadius:](auxiliaryOptionsView, "_setContinuousCornerRadius:");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v4 = objc_msgSend(a4, "view", a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_configureViewToBlockOutOfProcessUIInteractionsIfNecessary
{
  if (!self->_viewToBlockOutOfProcessUIInteractions)
  {
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    viewToBlockOutOfProcessUIInteractions = self->_viewToBlockOutOfProcessUIInteractions;
    self->_viewToBlockOutOfProcessUIInteractions = v3;

    double v5 = [(UIView *)self->_viewToBlockOutOfProcessUIInteractions layer];
    [v5 setHitTestsAsOpaque:1];

    double v6 = [(UIView *)self->_viewToBlockOutOfProcessUIInteractions layer];
    [v6 setAllowsHitTesting:1];

    [(UIView *)self->_viewToBlockOutOfProcessUIInteractions setHidden:1];
    double v7 = self->_viewToBlockOutOfProcessUIInteractions;
    double v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v7 setBackgroundColor:v8];

    double v9 = self->_viewToBlockOutOfProcessUIInteractions;
    [(NCNotificationListSupplementaryHostingView *)self bounds];
    -[UIView setFrame:](v9, "setFrame:");
    [(UIView *)self->_viewToBlockOutOfProcessUIInteractions setAutoresizingMask:18];
    double v10 = self->_viewToBlockOutOfProcessUIInteractions;
    platterView = self->_platterView;
    [(NCNotificationListSupplementaryHostingView *)self insertSubview:v10 aboveSubview:platterView];
  }
}

- (void)_tapGestureRecognized:(id)a3
{
  if ([a3 state] == 3
    && [(NCNotificationListSupplementaryHostingView *)self isUserInteractionEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      double v5 = WeakRetained;
      if (objc_opt_respondsToSelector()) {
        [v5 supplementaryHostingViewWasTapped:self];
      }
    }
    MEMORY[0x1F4181820]();
  }
}

- (BOOL)hasContentForAuxiliaryOptions
{
  return [(NSArray *)self->_auxiliaryOptionActions count] != 0;
}

- (NSString)auxiliaryOptionsSummaryText
{
  return self->_auxiliaryOptionsSummaryText;
}

- (NSArray)auxiliaryOptionActions
{
  return self->_auxiliaryOptionActions;
}

- (UIColor)auxiliaryOptionsTextColor
{
  return self->_auxiliaryOptionsTextColor;
}

- (UIColor)auxiliaryOptionsBackgroundColor
{
  return self->_auxiliaryOptionsBackgroundColor;
}

- (NSString)auxiliaryOptionsBackgroundCompositingFilter
{
  return self->_auxiliaryOptionsBackgroundCompositingFilter;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (UIColor)materialTintColor
{
  return self->_materialTintColor;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (BOOL)isHostedViewUserInteractionEnabled
{
  return self->_hostedViewUserInteractionEnabled;
}

- (NCNotificationListSupplementaryHostingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListSupplementaryHostingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (NCAuxiliaryOptionsView)auxiliaryOptionsView
{
  return self->_auxiliaryOptionsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryOptionsView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_materialTintColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundCompositingFilter, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsBackgroundColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsTextColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsSummaryText, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_viewToBlockOutOfProcessUIInteractions, 0);

  objc_storeStrong((id *)&self->_backgroundTintView, 0);
}

@end