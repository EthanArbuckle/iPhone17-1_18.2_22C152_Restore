@interface SBHWidgetContainerView
- (BOOL)isBlockedForScreenTimeExpiration;
- (BOOL)requiresClippingToBounds;
- (MTMaterialView)screenTimeLockoutView;
- (NSString)applicationName;
- (NSString)gridSizeClass;
- (SBHWidgetContainerView)initWithGridSizeClass:(id)a3 applicationName:(id)a4;
- (UIView)backgroundView;
- (UIView)widgetView;
- (id)_fontWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 maxSizeCategory:(id)a5;
- (void)_reloadScreenTimeExpirationUI;
- (void)_updateScreenTimeLockoutView;
- (void)layoutSubviews;
- (void)setApplicationName:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBlockedForScreenTimeExpiration:(BOOL)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setGridSizeClass:(id)a3;
- (void)setRequiresClippingToBounds:(BOOL)a3;
- (void)setWidgetView:(id)a3;
@end

@implementation SBHWidgetContainerView

- (SBHWidgetContainerView)initWithGridSizeClass:(id)a3 applicationName:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBHWidgetContainerView;
  v8 = -[SBHWidgetContainerView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    gridSizeClass = v8->_gridSizeClass;
    v8->_gridSizeClass = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    applicationName = v8->_applicationName;
    v8->_applicationName = (NSString *)v11;

    v8->_lastRequestedClipToBoundsValue = 0;
    [(SBHWidgetContainerView *)v8 setAutoresizingMask:18];
    [(SBHWidgetContainerView *)v8 setAutoresizesSubviews:1];
    v13 = self;
    v18[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v15 = (id)[(SBHWidgetContainerView *)v8 registerForTraitChanges:v14 withAction:sel__reloadScreenTimeExpirationUI];
  }
  return v8;
}

- (void)setClipsToBounds:(BOOL)a3
{
  self->_lastRequestedClipToBoundsValue = a3;
  BOOL v3 = a3 || self->_requiresClippingToBounds || self->_blockedForScreenTimeExpiration;
  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetContainerView;
  [(SBHWidgetContainerView *)&v4 setClipsToBounds:v3];
}

- (void)layoutSubviews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__SBHWidgetContainerView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E6AAC810;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void *__40__SBHWidgetContainerView_layoutSubviews__block_invoke(uint64_t a1)
{
  v22.receiver = *(id *)(a1 + 32);
  v22.super_class = (Class)SBHWidgetContainerView;
  objc_msgSendSuper2(&v22, sel_layoutSubviews);
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 432));
  objc_msgSend(WeakRetained, "setFrame:", v3, v5, v7, v9);

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 448);
  if (v12)
  {
    UIRectGetCenter();
    objc_msgSend(v12, "setCenter:");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setBounds:", v3, v5, v7, v9);
    v13 = [*(id *)(*(void *)(a1 + 32) + 448) superview];
    v14 = *(void **)(a1 + 32);

    if (v13 != v14) {
      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 448)];
    }
    [*(id *)(a1 + 32) sendSubviewToBack:*(void *)(*(void *)(a1 + 32) + 448)];
    uint64_t v11 = *(void *)(a1 + 32);
  }
  result = *(void **)(v11 + 440);
  if (result)
  {
    objc_msgSend(result, "setFrame:", v3, v5, v7, v9);
    [*(id *)(*(void *)(a1 + 32) + 440) bounds];
    UIRectInsetEdges();
    double v17 = v16;
    double v19 = v18;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "sizeThatFits:", v16, v18);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "sizeThatFits:", v17, v19);
    BSRectWithSize();
    UIRectCenteredRect();
    UIRectContainInRect();
    BSRectWithSize();
    UIRectCenteredRect();
    UIRectContainInRect();
    v20 = *(void **)(*(void *)(a1 + 32) + 408);
    UIRectIntegralWithScale();
    objc_msgSend(v20, "setFrame:");
    v21 = *(void **)(*(void *)(a1 + 32) + 416);
    UIRectIntegralWithScale();
    objc_msgSend(v21, "setFrame:");
    return (void *)[*(id *)(a1 + 32) bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 440)];
  }
  return result;
}

- (void)setBlockedForScreenTimeExpiration:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_blockedForScreenTimeExpiration != a3)
  {
    double v5 = SBLogWidgets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL blockedForScreenTimeExpiration = self->_blockedForScreenTimeExpiration;
      v7[0] = 67109120;
      v7[1] = blockedForScreenTimeExpiration;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Updating blockedForScreenTimeExpiration to %{BOOL}u", (uint8_t *)v7, 8u);
    }
  }
  self->_BOOL blockedForScreenTimeExpiration = a3;
  [(SBHWidgetContainerView *)self _updateScreenTimeLockoutView];
  [(SBHWidgetContainerView *)self setClipsToBounds:self->_lastRequestedClipToBoundsValue];
}

- (void)setRequiresClippingToBounds:(BOOL)a3
{
  self->_requiresClippingToBounds = a3;
  [(SBHWidgetContainerView *)self setClipsToBounds:self->_lastRequestedClipToBoundsValue];
}

- (void)setBackgroundView:(id)a3
{
  p_backgroundView = &self->_backgroundView;
  id v6 = a3;
  if ((-[UIView isEqual:](*p_backgroundView, "isEqual:") & 1) == 0)
  {
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setAutoresizingMask:0];
    [(UIView *)*p_backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(SBHWidgetContainerView *)self bounds];
    objc_msgSend(v6, "setFrame:");
    [(SBHWidgetContainerView *)self setNeedsLayout];
  }
}

- (void)_updateScreenTimeLockoutView
{
  BOOL blockedForScreenTimeExpiration = self->_blockedForScreenTimeExpiration;
  screenTimeLockoutView = self->_screenTimeLockoutView;
  if (blockedForScreenTimeExpiration)
  {
    if (!screenTimeLockoutView)
    {
      double v5 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:51];
      id v6 = self->_screenTimeLockoutView;
      self->_screenTimeLockoutView = v5;

      [(MTMaterialView *)self->_screenTimeLockoutView setUserInteractionEnabled:1];
      [(SBHWidgetContainerView *)self addSubview:self->_screenTimeLockoutView];
      screenTimeLockoutView = self->_screenTimeLockoutView;
    }
    double v7 = [(MTMaterialView *)screenTimeLockoutView visualStylingProviderForCategory:1];
    id v8 = (id)*MEMORY[0x1E4FB2780];
    gridSizeClass = (__CFString *)self->_gridSizeClass;
    if (gridSizeClass == @"SBHIconGridSizeClassMedium"
      || [(__CFString *)gridSizeClass isEqualToString:@"SBHIconGridSizeClassMedium"])
    {
      id v10 = (id)*MEMORY[0x1E4FB2790];

      id v8 = v10;
    }
    if (!self->_titleLabel)
    {
      uint64_t v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      titleLabel = self->_titleLabel;
      self->_titleLabel = v11;

      v13 = self->_titleLabel;
      v14 = [(SBHWidgetContainerView *)self _fontWithTextStyle:*MEMORY[0x1E4FB28C8] symbolicTraits:2 maxSizeCategory:v8];
      [(UILabel *)v13 setFont:v14];

      id v15 = self->_titleLabel;
      double v16 = SBHBundle();
      double v17 = [v16 localizedStringForKey:@"WIDGET_SCREENTIME_TIME_LIMIT_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      [(UILabel *)v15 setText:v17];

      [(UILabel *)self->_titleLabel setTextAlignment:1];
      [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
      [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.5];
      [(UILabel *)self->_titleLabel setNumberOfLines:1];
      [v7 automaticallyUpdateView:self->_titleLabel withStyle:0];
      [(MTMaterialView *)self->_screenTimeLockoutView addSubview:self->_titleLabel];
    }
    double v18 = [SBHIconGridSizeClassSet alloc];
    double v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", @"SBHIconGridSizeClassExtraLarge", @"SBHIconGridSizeClassNewsLargeTall", 0);
    v20 = [(SBHIconGridSizeClassSet *)v18 initWithGridSizeClasses:v19];

    if ([(SBHIconGridSizeClassSet *)v20 containsGridSizeClass:self->_gridSizeClass]
      && [(NSString *)self->_applicationName length])
    {
      descriptionLabel = self->_descriptionLabel;
      if (!descriptionLabel)
      {
        objc_super v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v23 = self->_descriptionLabel;
        self->_descriptionLabel = v22;

        v24 = self->_descriptionLabel;
        v25 = [(SBHWidgetContainerView *)self _fontWithTextStyle:*MEMORY[0x1E4FB28F0] symbolicTraits:0 maxSizeCategory:v8];
        [(UILabel *)v24 setFont:v25];

        [(UILabel *)self->_descriptionLabel setTextAlignment:1];
        [(UILabel *)self->_descriptionLabel setAdjustsFontSizeToFitWidth:1];
        [(UILabel *)self->_descriptionLabel setMinimumScaleFactor:0.5];
        [(UILabel *)self->_descriptionLabel setNumberOfLines:3];
        [(MTMaterialView *)self->_screenTimeLockoutView addSubview:self->_descriptionLabel];
        descriptionLabel = self->_descriptionLabel;
      }
      v26 = NSString;
      v27 = SBHBundle();
      v28 = [v27 localizedStringForKey:@"WIDGET_SCREENTIME_TIME_LIMIT_DESCRIPTION" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      v29 = objc_msgSend(v26, "stringWithFormat:", v28, self->_applicationName);
      [(UILabel *)descriptionLabel setText:v29];
    }
    else
    {
      [(UILabel *)self->_descriptionLabel removeFromSuperview];
      v30 = self->_descriptionLabel;
      self->_descriptionLabel = 0;

      [(UILabel *)self->_titleLabel setNumberOfLines:2];
    }
  }
  else
  {
    [(MTMaterialView *)screenTimeLockoutView removeFromSuperview];
    v31 = self->_screenTimeLockoutView;
    self->_screenTimeLockoutView = 0;

    [(UILabel *)self->_titleLabel removeFromSuperview];
    v32 = self->_titleLabel;
    self->_titleLabel = 0;

    [(UILabel *)self->_descriptionLabel removeFromSuperview];
    double v7 = self->_descriptionLabel;
    self->_descriptionLabel = 0;
  }

  [(SBHWidgetContainerView *)self setNeedsLayout];
}

- (id)_fontWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 maxSizeCategory:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = (void *)MEMORY[0x1E4FB1E20];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(SBHWidgetContainerView *)self traitCollection];
  v12 = [v11 preferredContentSizeCategory];
  v13 = SBHContentSizeCategoryClip(v12, (void *)*MEMORY[0x1E4FB27C8], v9);

  v14 = [v8 traitCollectionWithPreferredContentSizeCategory:v13];

  id v15 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v10 compatibleWithTraitCollection:v14];

  double v16 = [v15 fontDescriptorWithSymbolicTraits:v5];
  double v17 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v16 size:0.0];

  return v17;
}

- (void)_reloadScreenTimeExpirationUI
{
  if (self->_blockedForScreenTimeExpiration)
  {
    [(SBHWidgetContainerView *)self setBlockedForScreenTimeExpiration:0];
    [(SBHWidgetContainerView *)self setBlockedForScreenTimeExpiration:1];
  }
}

- (UIView)widgetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetView);
  return (UIView *)WeakRetained;
}

- (void)setWidgetView:(id)a3
{
}

- (MTMaterialView)screenTimeLockoutView
{
  return self->_screenTimeLockoutView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (BOOL)isBlockedForScreenTimeExpiration
{
  return self->_blockedForScreenTimeExpiration;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (void)setGridSizeClass:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (BOOL)requiresClippingToBounds
{
  return self->_requiresClippingToBounds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_screenTimeLockoutView, 0);
  objc_destroyWeak((id *)&self->_widgetView);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end