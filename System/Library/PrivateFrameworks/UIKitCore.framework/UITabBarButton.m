@interface UITabBarButton
+ (id)_defaultLabelColor;
- (BOOL)_areTabBarButtonAccessibilityButtonShapesEnabled;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isSelected;
- (BOOL)_showsHighlightedState;
- (BOOL)canBecomeFocused;
- (BOOL)iconShouldUseVibrancyForState:(int64_t)a3;
- (BOOL)isDefaultColor:(id)a3 forState:(int64_t)a4;
- (BOOL)isDefaultTVLayout;
- (BOOL)labelShouldUseVibrancyForState:(int64_t)a3;
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)_contentRect;
- (CGRect)_responderSelectionRect;
- (CGRect)_responderSelectionRectForWindow:(id)a3;
- (CGRect)_tabBarHitRect;
- (CGSize)_appleTV_sizeThatFits:(CGSize)a3;
- (CGSize)_horizontalLayout_sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)_appearanceGuideClass;
- (NSArray)carplayConstraints;
- (UIColor)_defaultUnselectedLabelTintColor;
- (UIColor)_unselectedTintColor;
- (UIOffset)_titlePositionAdjustment;
- (UIOffset)badgePositionAdjustmentForState:(int64_t)a3;
- (UIOffset)badgeTitlePositionAdjustmentForState:(int64_t)a3;
- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3;
- (UITabBar)tabBar;
- (UITabBarButton)initWithImage:(id)a3 landscapeImage:(id)a4 selectedImage:(id)a5 landscapeSelectedImage:(id)a6 label:(id)a7 withInsets:(UIEdgeInsets)a8 landscapeInsets:(UIEdgeInsets)a9 tabBar:(id)a10;
- (UITabBarButton)initWithImage:(id)a3 selectedImage:(id)a4 label:(id)a5 withInsets:(UIEdgeInsets)a6 tabBar:(id)a7;
- (UIVibrancyEffect)itemVibrantEffect;
- (UIView)focusView;
- (_UITabBarItemData)itemAppearanceData;
- (double)defaultAlphaForState:(int64_t)a3;
- (id)_buttonTintColorForState:(unint64_t)a3;
- (id)_contentTintColorForState:(unint64_t)a3;
- (id)_info;
- (id)_selectedIndicatorImage;
- (id)_selectedIndicatorView;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_tabBar;
- (id)badgeBackgroundColorForState:(int64_t)a3;
- (id)badgeTextAttributesForState:(int64_t)a3;
- (id)defaultColorForState:(int64_t)a3;
- (id)iconColorForState:(int64_t)a3;
- (id)titleTextAttributesForState:(int64_t)a3;
- (int64_t)_currentItemState;
- (int64_t)_focusTouchSensitivityStyle;
- (int64_t)defaultCompositingModeForState:(int64_t)a3;
- (int64_t)layoutStyle;
- (void)_UIAppearance_setBadgeColor:(id)a3;
- (void)_UIAppearance_setBadgeTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3;
- (void)_accessibilityButtonShapesDidChangeNotification:(id)a3;
- (void)_accessibilityGrayStatusDidChangeNotification:(id)a3;
- (void)_accessibilityHighContractFocusIndicatorDidChangeNotification:(id)a3;
- (void)_appleTV_layoutSubviews;
- (void)_applyTabBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_ios_layoutSubviews;
- (void)_positionBadge;
- (void)_positionBadgeAfterChangesIfNecessary:(id)a3;
- (void)_removeCarplayConstraints;
- (void)_sendFocusAction:(id)a3;
- (void)_setAppearanceGuideClass:(Class)a3;
- (void)_setBadgeOffset:(UIOffset)a3;
- (void)_setBadgeValue:(id)a3;
- (void)_setButtonTintColor:(id)a3 forState:(unint64_t)a4;
- (void)_setContentTintColor:(id)a3 forState:(unint64_t)a4;
- (void)_setCustomSelectedIndicatorImage:(id)a3;
- (void)_setSelected:(BOOL)a3;
- (void)_setShowsHighlightedState:(BOOL)a3;
- (void)_setTabBarHitRect:(CGRect)a3;
- (void)_setUnselectedTintColor:(id)a3;
- (void)_setupCarplayConstraints;
- (void)_setupSymbolConfigurationsForIdiom:(int64_t)a3;
- (void)_showBoundsViewAt:(CGRect)a3 alignmentViewAt:(double)a4 forSymbolImage:(BOOL)a5;
- (void)_showSelectedIndicator:(BOOL)a3 changeSelection:(BOOL)a4;
- (void)_updateAfterTraitCollectionOrAccessibilityDidChangeTV;
- (void)_updateBadgeAppearanceAndLayoutNow:(BOOL)a3;
- (void)_updateSelectedIndicatorFrame;
- (void)_updateSelectedIndicatorView;
- (void)_updateToMatchCurrentState;
- (void)_updateVibrancyEffectView;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setCarplayConstraints:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setItemAppearanceData:(id)a3;
- (void)setItemVibrantEffect:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSpringLoaded:(BOOL)a3;
- (void)set_info:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UITabBarButton

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITabBarButton;
  [(UIView *)&v12 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 userInterfaceIdiom];
  v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v5 != v7)
  {
    [(UIView *)self setNeedsLayout];
    v8 = [(UIView *)self traitCollection];
    -[UITabBarButton _setupSymbolConfigurationsForIdiom:](self, "_setupSymbolConfigurationsForIdiom:", [v8 userInterfaceIdiom]);
  }
  [(UIView *)self traitCollection];

  if (self->_vibrancyEffectView) {
    [(UITabBarButton *)self _updateVibrancyEffectView];
  }
  v9 = [(UIView *)self traitCollection];
  uint64_t v10 = [v9 legibilityWeight];
  uint64_t v11 = [v4 legibilityWeight];

  if (v10 != v11) {
    [(UIView *)self setNeedsLayout];
  }
}

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (UITabBarButton)initWithImage:(id)a3 landscapeImage:(id)a4 selectedImage:(id)a5 landscapeSelectedImage:(id)a6 label:(id)a7 withInsets:(UIEdgeInsets)a8 landscapeInsets:(UIEdgeInsets)a9 tabBar:(id)a10
{
  CGFloat right = a8.right;
  CGFloat bottom = a8.bottom;
  CGFloat left = a8.left;
  CGFloat top = a8.top;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a10;
  if (v20)
  {
    [v20 size];
    double v27 = v26;
    double v29 = v28;
  }
  else
  {
    double v27 = *MEMORY[0x1E4F1DB30];
    double v29 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v30 = (double *)MEMORY[0x1E4F1DAD8];
  if (v22)
  {
    [v22 size];
    if (v31 > v27) {
      double v27 = v31;
    }
    if (v32 > v29) {
      double v29 = v32;
    }
  }
  double v33 = *v30;
  double v34 = v30[1];
  if (v24)
  {
    v35 = objc_alloc_init(UITabBarButtonLabel);
    [(UIView *)v35 setOpaque:0];
    [(UITabBarButtonLabel *)v35 updateTextColorsForState];
    [(UIView *)v35 setBackgroundColor:0];
    [(UILabel *)v35 setText:v24];
    [(UILabel *)v35 setAdjustsLetterSpacingToFitWidth:1];
    [(UIView *)v35 sizeToFit];
    [(UIView *)v35 frame];
  }
  else
  {
    v35 = 0;
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  if (v36 + 2.0 <= v27) {
    double v37 = v27;
  }
  else {
    double v37 = v36 + 2.0;
  }
  v59.receiver = self;
  v59.super_class = (Class)UITabBarButton;
  v38 = -[UIControl initWithFrame:](&v59, sel_initWithFrame_, v33, v34, v37, v29);
  v39 = v38;
  if (v38)
  {
    id v53 = v24;
    id v55 = v23;
    v40 = v25;
    objc_storeWeak((id *)&v38->_tabBar, v25);
    if (v20)
    {
      v41 = [[UITabBarSwappableImageView alloc] initWithImage:v20 alternateImage:v22 landscapeImage:v21 landscapeAlternateImage:v23];
      imageView = v39->_imageView;
      v39->_imageView = v41;

      [(UIView *)v39->_imageView setUserInteractionEnabled:0];
      [(UIView *)v39->_imageView setOpaque:0];
      -[UIImageView setFrame:](v39->_imageView, "setFrame:", v33, v34, v27, v29);
      v43 = [(UIView *)v39 traitCollection];
      -[UITabBarButton _setupSymbolConfigurationsForIdiom:](v39, "_setupSymbolConfigurationsForIdiom:", [v43 userInterfaceIdiom]);
    }
    id v44 = v21;
    objc_storeStrong((id *)&v39->_label, v35);
    [(UITabBarButtonLabel *)v39->_label setTabBarButton:v39];
    v39->_imageInsets.CGFloat top = top;
    v39->_imageInsets.CGFloat left = left;
    v39->_imageInsets.CGFloat bottom = bottom;
    v39->_imageInsets.CGFloat right = right;
    v39->_imageLandscapeInsets = a9;
    [(UIView *)v39 setOpaque:0];
    [(UIView *)v39 addSubview:v39->_imageView];
    [(UIView *)v39 addSubview:v39->_label];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __124__UITabBarButton_initWithImage_landscapeImage_selectedImage_landscapeSelectedImage_label_withInsets_landscapeInsets_tabBar___block_invoke;
    v56[3] = &unk_1E52D9F98;
    v45 = v39;
    v57 = v45;
    id v58 = v40;
    +[UIView _performSystemAppearanceModifications:v56];
    [(UIView *)v45 addSubview:v45->_vibrancyEffectView];
    [(UIView *)v45 setNeedsLayout];
    v46 = objc_opt_new();
    [(UIView *)v45 _setIdleModeLayoutAttributes:v46];
    v47 = [(UIView *)v45 traitCollection];
    uint64_t v48 = [v47 userInterfaceIdiom];

    if (v48 == 3) {
      [(UITabBarButton *)v45 _setupCarplayConstraints];
    }

    id v21 = v44;
    id v23 = v55;
    id v25 = v40;
    id v24 = v53;
  }
  v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v49 addObserver:v39 selector:sel__accessibilityButtonShapesDidChangeNotification_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v50 addObserver:v39 selector:sel__accessibilityHighContractFocusIndicatorDidChangeNotification_ name:@"UIAccessibilityHighContrastFocusIndicatorChangedNotification" object:0];

  v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v51 addObserver:v39 selector:sel__accessibilityGrayStatusDidChangeNotification_ name:@"UIAccessibilityGrayscaleStatusDidChangeNotification" object:0];

  v39->_accessibilityGrayStatusEnabled = _AXSGrayscaleEnabled() != 0;
  v39->_accessibilityHighContractFocusIndicatorEnabled = _AXSHighContrastFocusIndicatorsEnabled() != 0;
  v39->_accessibilityButtonShapesEnabled = _AXSButtonShapesEnabled() != 0;

  return v39;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UITabBarButton;
  [(UIView *)&v8 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 3) {
    [(UITabBarButton *)self _setupCarplayConstraints];
  }
  else {
    [(UITabBarButton *)self _removeCarplayConstraints];
  }
}

- (void)setCarplayConstraints:(id)a3
{
}

- (void)_removeCarplayConstraints
{
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(UIView *)self->_label setTranslatesAutoresizingMaskIntoConstraints:1];
  [(UILabel *)self->_label setTextAlignment:4];
  v3 = [(UITabBarButton *)self focusView];
  [v3 removeFromSuperview];

  id v4 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v5 = [(UITabBarButton *)self carplayConstraints];
  [v4 deactivateConstraints:v5];

  [(UITabBarButton *)self setCarplayConstraints:0];
}

- (UIView)focusView
{
  focusView = self->_focusView;
  if (!focusView)
  {
    id v4 = [UIView alloc];
    uint64_t v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_focusView;
    self->_focusView = v5;

    [(UIView *)self->_focusView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = [(UIView *)self->_focusView layer];
    [v7 setCornerRadius:8.0];

    uint64_t v8 = *MEMORY[0x1E4F39EA8];
    v9 = [(UIView *)self->_focusView layer];
    [v9 setCornerCurve:v8];

    [(UIView *)self->_focusView setUserInteractionEnabled:0];
    focusView = self->_focusView;
  }
  return focusView;
}

- (NSArray)carplayConstraints
{
  return self->_carplayConstraints;
}

- (void)_updateToMatchCurrentState
{
  v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ([(UITabBarButton *)self _showsHighlightedState]) {
    BOOL v5 = [(UIControl *)self isHighlighted];
  }
  else {
    BOOL v5 = 0;
  }
  [(UITabBarButton *)self _showsHighlightedState];
  [(UITabBarButtonLabel *)self->_label setSelected:self->_selected];
  [(UITabBarButtonLabel *)self->_label setHighlighted:v5];
  if (self->_itemAppearanceData)
  {
    [(UITabBarButtonLabel *)self->_label updateTextColorsForState];
    [(UIView *)self->_label sizeToFit];
  }
  v18 = self->_imageView;
  [(UITabBarSwappableImageView *)v18 showAlternateImage:self->_selected];
  if (v18)
  {
    int64_t v6 = [(UITabBarButton *)self _currentItemState];
    if ([(UITabBarButton *)self iconShouldUseVibrancyForState:v6])
    {
      uint64_t v7 = 0;
    }
    else
    {
      if (self->_layoutStyle == 3) {
        [(UITabBarButton *)self _contentTintColorForState:v5 | (4 * self->_selected)];
      }
      else {
      uint64_t v7 = [(UITabBarButton *)self iconColorForState:v6];
      }
    }
    if ([(UITabBarButton *)self isDefaultTVLayout])
    {
      if ([(UITabBarButton *)self isDefaultColor:v7 forState:v6])
      {
        int64_t v8 = [(UITabBarButton *)self defaultCompositingModeForState:v6];
        [(UITabBarButton *)self defaultAlphaForState:v6];
        double v10 = v9;
      }
      else
      {
        int64_t v8 = 0;
        double v10 = 1.0;
      }
      int v11 = _AXSEnhanceBackgroundContrastEnabled();
      if (v11) {
        int64_t v12 = 0;
      }
      else {
        int64_t v12 = v8;
      }
      if (v11) {
        double v13 = 1.0;
      }
      else {
        double v13 = v10;
      }
      [(UIView *)v18 setAlpha:v13];
      [(UIView *)v18 setCompositingMode:v12];
    }
    [(UIView *)v18 setTintColor:v7];
  }
  v14 = [(UITabBarButton *)self _buttonTintColorForState:0];
  [(UIView *)self setTintColor:v14];

  if (v4 == 3)
  {
    if (v5)
    {
      v15 = [(UIView *)self tintColor];
      v16 = [(UITabBarButton *)self focusView];
      [v16 setBackgroundColor:v15];
    }
    else
    {
      v15 = [(UITabBarButton *)self focusView];
      [v15 setBackgroundColor:0];
    }

    goto LABEL_34;
  }
  if (!v5)
  {
LABEL_34:
    v17 = 0;
    goto LABEL_35;
  }
  v17 = 0;
  if (v4 != 2 && v4 != 8)
  {
    v17 = [(UIView *)self tintColor];
  }
LABEL_35:
  [(UIView *)self setBackgroundColor:v17];
  [(UITabBarButton *)self _updateBadgeAppearanceAndLayoutNow:0];
  [(UIView *)self setNeedsLayout];
}

- (BOOL)_showsHighlightedState
{
  return self->_showsHighlightedState;
}

- (BOOL)iconShouldUseVibrancyForState:(int64_t)a3
{
  if (!self->_itemVibrantEffect) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  int64_t layoutStyle = self->_layoutStyle;
  id v7 = WeakRetained;
  int64_t v8 = v7;
  if (a3 == 2 || layoutStyle == 3 || layoutStyle == 4 && ![v7 _vibrantLabels])
  {
    BOOL v10 = 0;
    int v11 = v8;
  }
  else
  {

    imageView = self->_imageView;
    if (self->_layoutStyle == 2) {
      [(UITabBarSwappableImageView *)imageView _unselectedCompactImage];
    }
    else {
    int v11 = [(UITabBarSwappableImageView *)imageView _unselectedImage];
    }
    if ([v11 renderingMode] == 1)
    {
      BOOL v10 = 0;
      goto LABEL_10;
    }
    itemAppearanceData = self->_itemAppearanceData;
    if (!itemAppearanceData)
    {
      BOOL v10 = 1;
      goto LABEL_10;
    }
    int64_t v8 = [(_UITabBarItemData *)itemAppearanceData iconColorForState:a3];
    BOOL v10 = v8 == 0;
  }

LABEL_10:
  return v10;
}

uint64_t __53__UITabBarButton__updateBadgeAppearanceAndLayoutNow___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentItemState];
  v3 = [*(id *)(a1 + 32) badgeBackgroundColorForState:v2];
  [*(id *)(*(void *)(a1 + 32) + 512) setBadgeColor:v3];

  uint64_t v4 = [*(id *)(a1 + 32) badgeTextAttributesForState:v2];
  [*(id *)(*(void *)(a1 + 32) + 512) setTextAttributes:v4];

  [*(id *)(a1 + 32) badgeTitlePositionAdjustmentForState:v2];
  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 512);
  return objc_msgSend(v5, "setTextOffset:");
}

- (int64_t)_currentItemState
{
  if (![(UIControl *)self isEnabled]) {
    return 3;
  }
  if ([(UIView *)self isFocused]) {
    return 4;
  }
  if ([(UIControl *)self isHighlighted] && self->_showsHighlightedState) {
    return 1;
  }
  return 2 * self->_selected;
}

- (UIOffset)badgeTitlePositionAdjustmentForState:(int64_t)a3
{
  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData)
  {
    [(_UITabBarItemData *)itemAppearanceData badgeTitlePositionAdjustmentForState:a3];
  }
  else
  {
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.vertical = v5;
  result.horizontal = v4;
  return result;
}

- (id)badgeTextAttributesForState:(int64_t)a3
{
  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData)
  {
    int64_t v6 = [(UIView *)self traitCollection];
    id v7 = [(_UITabBarItemData *)itemAppearanceData badgeTextAttributesForState:a3 compatibleWithTraitCollection:v6];
  }
  else
  {
    switch(a3)
    {
      case 0:
        id v7 = [(NSMutableDictionary *)self->_badgeTextAttributesForState objectForKeyedSubscript:&unk_1ED3F35B8];
        break;
      case 1:
        badgeTextAttributesForState = self->_badgeTextAttributesForState;
        double v9 = &unk_1ED3F35D0;
        goto LABEL_10;
      case 2:
        badgeTextAttributesForState = self->_badgeTextAttributesForState;
        double v9 = &unk_1ED3F35E8;
        goto LABEL_10;
      case 3:
        badgeTextAttributesForState = self->_badgeTextAttributesForState;
        double v9 = &unk_1ED3F3600;
        goto LABEL_10;
      case 4:
        badgeTextAttributesForState = self->_badgeTextAttributesForState;
        double v9 = &unk_1ED3F3618;
LABEL_10:
        BOOL v10 = [(NSMutableDictionary *)badgeTextAttributesForState objectForKeyedSubscript:v9];
        int v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [(NSMutableDictionary *)self->_badgeTextAttributesForState objectForKeyedSubscript:&unk_1ED3F35B8];
        }
        id v7 = v12;

        break;
      default:
        id v7 = 0;
        break;
    }
  }
  return v7;
}

- (id)badgeBackgroundColorForState:(int64_t)a3
{
  if (self->_itemAppearanceData)
  {
    v3 = [(_UITabBarItemData *)self->_itemAppearanceData badgeBackgroundColorForState:a3];
  }
  else
  {
    v3 = self->_badgeColor;
  }
  return v3;
}

- (void)_updateBadgeAppearanceAndLayoutNow:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UITabBarButton__updateBadgeAppearanceAndLayoutNow___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  double v5 = _Block_copy(aBlock);
  int64_t v6 = v5;
  if (v3) {
    [(UITabBarButton *)self _positionBadgeAfterChangesIfNecessary:v5];
  }
  else {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

- (id)_buttonTintColorForState:(unint64_t)a3
{
  buttonTintColorsForState = self->_buttonTintColorsForState;
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  double v5 = [(NSMutableDictionary *)buttonTintColorsForState objectForKey:v4];

  return v5;
}

- (id)iconColorForState:(int64_t)a3
{
  itemAppearanceData = self->_itemAppearanceData;
  if (!itemAppearanceData)
  {
    contentTintColorsForState = self->_contentTintColorsForState;
    int64_t v8 = [NSNumber numberWithUnsignedInteger:4 * (a3 == 2)];
    id v7 = [(NSMutableDictionary *)contentTintColorsForState objectForKeyedSubscript:v8];
    goto LABEL_5;
  }
  int64_t v6 = [(_UITabBarItemData *)itemAppearanceData iconColorForState:a3];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = v7;
LABEL_5:
    BOOL v10 = v7;
    goto LABEL_7;
  }
  BOOL v10 = [(UITabBarButton *)self defaultColorForState:a3];
  int64_t v8 = 0;
LABEL_7:

  return v10;
}

- (BOOL)isDefaultTVLayout
{
  return 0;
}

- (UITabBar)tabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  return (UITabBar *)WeakRetained;
}

- (UIColor)_defaultUnselectedLabelTintColor
{
  return self->_defaultUnselectedLabelTintColor;
}

- (void)_setContentTintColor:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  contentTintColorsForState = self->_contentTintColorsForState;
  id v15 = v6;
  if (v6)
  {
    if (!contentTintColorsForState)
    {
      int64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      double v9 = self->_contentTintColorsForState;
      self->_contentTintColorsForState = v8;

      contentTintColorsForState = self->_contentTintColorsForState;
    }
  }
  else if (!contentTintColorsForState)
  {
    goto LABEL_10;
  }
  BOOL v10 = [NSNumber numberWithUnsignedInteger:a4];
  int v11 = [(NSMutableDictionary *)contentTintColorsForState objectForKey:v10];
  char v12 = [v15 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    double v13 = self->_contentTintColorsForState;
    v14 = [NSNumber numberWithUnsignedInteger:a4];
    if (v15) {
      [(NSMutableDictionary *)v13 setObject:v15 forKey:v14];
    }
    else {
      [(NSMutableDictionary *)v13 removeObjectForKey:v14];
    }

    [(UITabBarButton *)self _updateToMatchCurrentState];
    [(UITabBarButtonLabel *)self->_label updateTextColorsForState];
  }
LABEL_10:
}

- (_UITabBarItemData)itemAppearanceData
{
  return self->_itemAppearanceData;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (id)defaultColorForState:(int64_t)a3
{
  if (a3 == 2)
  {
    double v4 = 0;
  }
  else
  {
    if ([(UITabBarButton *)self isDefaultTVLayout])
    {
      if (a3 == 4) {
        +[UIColor blackColor];
      }
      else {
      double v4 = [(UITabBarButton *)self _defaultUnselectedLabelTintColor];
      }
    }
    else
    {
      double v4 = +[UIColor colorWithWhite:0.57254902 alpha:0.85];
    }
  }
  return v4;
}

- (id)_contentTintColorForState:(unint64_t)a3
{
  contentTintColorsForState = self->_contentTintColorsForState;
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  double v5 = [(NSMutableDictionary *)contentTintColorsForState objectForKey:v4];

  return v5;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBarButton;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(UIImageView *)self->_imageView setSemanticContentAttribute:a3];
  [(UILabel *)self->_label setSemanticContentAttribute:a3];
}

void __124__UITabBarButton_initWithImage_landscapeImage_selectedImage_landscapeSelectedImage_label_withInsets_landscapeInsets_tabBar___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) _effectiveUnselectedLabelTintColor];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 632);
  *(void *)(v3 + 632) = v2;

  objc_super v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) _effectiveUnselectedTintColor];
  [v5 _setContentTintColor:v6 forState:0];

  id v7 = *(void **)(a1 + 32);
  id v8 = +[UIColor blackColor];
  [v7 _setContentTintColor:v8 forState:1];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)UITabBarButton;
  [(UIView *)&v15 layoutSubviews];
  uint64_t v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (self->_badge)
  {
    objc_super v5 = _UIBadgeGetTabBarVisualStyle(v4, self->_layoutStyle);
    [(_UIBadgeView *)self->_badge setStyle:v5];
  }
  [(UITabBarButton *)self _setupSymbolConfigurationsForIdiom:v4];
  switch(v4)
  {
    case 8:
      goto LABEL_6;
    case 3:
      break;
    case 2:
LABEL_6:
      [(UITabBarButton *)self _appleTV_layoutSubviews];
      break;
    default:
      [(UITabBarButton *)self _ios_layoutSubviews];
      break;
  }
  [(UITabBarButton *)self _updateSelectedIndicatorFrame];
  [(UITabBarButton *)self _positionBadge];
  id v6 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_tabBar);
  if (!v6->_itemVibrantEffect)
  {
    vibrancyEffectView = v6->_vibrancyEffectView;
    if (vibrancyEffectView)
    {
      [(UIView *)vibrancyEffectView removeFromSuperview];
      int v11 = v6->_vibrancyEffectView;
      v6->_vibrancyEffectView = 0;
      double v9 = v6;
      BOOL v10 = v6;
      goto LABEL_15;
    }
    double v9 = v6;
LABEL_17:
    BOOL v10 = v6;
    goto LABEL_18;
  }
  [(UITabBarButton *)v6 _updateVibrancyEffectView];
  [(UIView *)v6 bounds];
  -[UIView setFrame:](v6->_vibrancyEffectView, "setFrame:");
  uint64_t v8 = [(UITabBarButton *)v6 _currentItemState];
  double v9 = v6;
  if ([(UITabBarButton *)v6 labelShouldUseVibrancyForState:v8])
  {
    double v9 = [(UIVisualEffectView *)v6->_vibrancyEffectView contentView];
  }
  if (![(UITabBarButton *)v6 iconShouldUseVibrancyForState:v8]) {
    goto LABEL_17;
  }
  BOOL v10 = [(UIVisualEffectView *)v6->_vibrancyEffectView contentView];
  int v11 = v6;
LABEL_15:

LABEL_18:
  BOOL v13 = v6->_vibrancyEffectView == 0;
  v14 = [(UIView *)v6 layer];
  [v14 setAllowsGroupOpacity:v13];

  [v10 addSubview:v6->_imageView];
  [v9 addSubview:v6->_label];
  [(UIView *)v6 bringSubviewToFront:self->_badge];
}

- (void)_positionBadge
{
  badge = self->_badge;
  if (!badge) {
    return;
  }
  uint64_t v4 = [(_UIBadgeView *)badge style];

  if (!v4)
  {
    objc_super v5 = [(UIView *)self traitCollection];
    id v6 = _UIBadgeGetTabBarVisualStyle([v5 userInterfaceIdiom], self->_layoutStyle);
    [(_UIBadgeView *)self->_badge setStyle:v6];
  }
  -[_UIBadgeView sizeThatFits:](self->_badge, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self->_badge frame];
  if (v8 != v12 || v10 != v11)
  {
    [(UIView *)self->_badge sizeToFit];
    [(UIView *)self->_badge setNeedsLayout];
    [(UIView *)self->_badge layoutIfNeeded];
  }
  v14 = [(UIView *)self superview];
  if (v14)
  {
    rect_8 = v14;
    [(UIView *)self->_badge frame];
    CGFloat rect = v15;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [(UITabBarButton *)self badgePositionAdjustmentForState:[(UITabBarButton *)self _currentItemState]];
    double v21 = v20;
    imageView = self->_imageView;
    if (!imageView) {
      imageView = self->_label;
    }
    [imageView frame];
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", rect_8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    double v32 = v21 + v31;
    int v33 = *((_DWORD *)&self->super.super._viewFlags + 4);
    UIRoundToViewScale(self);
    int64_t layoutStyle = self->_layoutStyle;
    if (layoutStyle && layoutStyle != 3)
    {
      uint64_t v39 = v24;
      uint64_t v40 = v26;
      uint64_t v41 = v28;
      uint64_t v42 = v30;
      if ((v33 & 0x80000) != 0)
      {
        CGRectGetMinX(*(CGRect *)&v39);
        goto LABEL_21;
      }
      CGRectGetMaxX(*(CGRect *)&v39);
      UIRoundToViewScale(self);
      v63.origin.CGFloat x = rect;
      v63.origin.CGFloat y = v32;
      v63.size.CGFloat width = v17;
      v63.size.CGFloat height = v19;
      CGRectGetWidth(v63);
    }
    else
    {
      uint64_t v35 = v24;
      uint64_t v36 = v26;
      uint64_t v37 = v28;
      uint64_t v38 = v30;
      if ((v33 & 0x80000) == 0)
      {
        CGRectGetMaxX(*(CGRect *)&v35);
LABEL_21:
        UIRoundToViewScale(self);
        goto LABEL_22;
      }
      CGRectGetMinX(*(CGRect *)&v35);
      UIRoundToViewScale(self);
      v62.origin.CGFloat x = rect;
      v62.origin.CGFloat y = v32;
      v62.size.CGFloat width = v17;
      v62.size.CGFloat height = v19;
      CGRectGetWidth(v62);
    }
LABEL_22:
    [rect_8 bounds];
    CGRect v65 = CGRectInset(v64, 6.0, 0.0);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", rect_8, v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    [(UIView *)self bounds];
    v70.origin.CGFloat x = v51;
    v70.origin.CGFloat y = v52;
    v70.size.CGFloat width = v53;
    v70.size.CGFloat height = v54;
    v66.origin.CGFloat x = v44;
    v66.origin.CGFloat y = v46;
    v66.size.CGFloat width = v48;
    v66.size.CGFloat height = v50;
    CGRect v67 = CGRectIntersection(v66, v70);
    CGFloat x = v67.origin.x;
    CGFloat y = v67.origin.y;
    CGFloat width = v67.size.width;
    CGFloat height = v67.size.height;
    CGRectGetMinX(v67);
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    CGRectGetMaxX(v68);
    v69.origin.CGFloat x = rect;
    v69.origin.CGFloat y = v32;
    v69.size.CGFloat width = v17;
    v69.size.CGFloat height = v19;
    CGRectGetWidth(v69);
    UIRoundToViewScale(self);
    -[UIView setFrame:](self->_badge, "setFrame:");
    v14 = rect_8;
  }
}

- (void)_setupSymbolConfigurationsForIdiom:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 1)
  {
    if (a3 == 3)
    {
      id v12 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:2];
      -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:");
    }
    else
    {
      imageView = self->_imageView;
      [(UIImageView *)imageView setPreferredSymbolConfiguration:0];
    }
  }
  else
  {
    objc_super v5 = [(_UITabBarItemData *)self->_itemAppearanceData preferredSymbolConfiguration];
    if (!v5)
    {
      if (self->_layoutStyle == 3)
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v10 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            double v11 = "pad";
            if (!a3) {
              double v11 = "phone";
            }
            *(_DWORD *)buf = 136315138;
            v14 = v11;
            _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "LayoutStyle is CarPlay when on %s idiom. Substituting Stacked style.", buf, 0xCu);
          }
        }
        else
        {
          double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setupSymbolConfigurationsForIdiom____s_category)
                            + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            double v9 = "pad";
            if (!a3) {
              double v9 = "phone";
            }
            *(_DWORD *)buf = 136315138;
            v14 = v9;
            _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "LayoutStyle is CarPlay when on %s idiom. Substituting Stacked style.", buf, 0xCu);
          }
        }
      }
      id v6 = +[_UITabBarItemData standardItemDataForStyle:](_UITabBarItemData, "standardItemDataForStyle:");
      objc_super v5 = [v6 preferredSymbolConfiguration];
    }
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v5];
  }
}

- (void)_updateVibrancyEffectView
{
  itemVibrantEffect = self->_itemVibrantEffect;
  vibrancyEffectView = self->_vibrancyEffectView;
  double v8 = itemVibrantEffect;
  if (vibrancyEffectView)
  {
    [(UIVisualEffectView *)vibrancyEffectView setEffect:itemVibrantEffect];
  }
  else
  {
    objc_super v5 = [[UIVisualEffectView alloc] initWithEffect:itemVibrantEffect];
    id v6 = self->_vibrancyEffectView;
    self->_vibrancyEffectView = v5;

    [(UIVisualEffectView *)self->_vibrancyEffectView _setAllowsGroupFiltering:0];
    double v7 = [(UIVisualEffectView *)self->_vibrancyEffectView contentView];
    [v7 setClipsToBounds:0];

    [(UIView *)self bounds];
    -[UIView setFrame:](self->_vibrancyEffectView, "setFrame:");
    [(UIView *)self->_vibrancyEffectView setUserInteractionEnabled:0];
    [(UIView *)self insertSubview:self->_vibrancyEffectView atIndex:0];
  }
}

- (void)_updateSelectedIndicatorFrame
{
  if (!self->_selectedIndicator) {
    return;
  }
  [(UIView *)self bounds];
  CGRect v31 = CGRectInset(v30, 0.0, 2.0);
  double x = v31.origin.x;
  double y = v31.origin.y;
  double width = v31.size.width;
  double height = v31.size.height;
  double v7 = [(UIView *)self superview];
  if (v7)
  {
    customSelectedIndicatorImage = self->_customSelectedIndicatorImage;
    if (customSelectedIndicatorImage)
    {
      if (![(UIImage *)customSelectedIndicatorImage _isResizable])
      {

        goto LABEL_15;
      }
      [(UIImage *)self->_customSelectedIndicatorImage capInsets];
      if (v9 == 0.0)
      {
        [(UIImage *)self->_customSelectedIndicatorImage capInsets];
        double v11 = v10;

        if (v11 != 0.0) {
          goto LABEL_9;
        }
LABEL_15:
        [(UIImage *)self->_customSelectedIndicatorImage size];
        double height = v12;
        [(UIView *)self bounds];
        if (height <= v13)
        {
          [(UIView *)self bounds];
          double y = floor((v19 - height) * 0.5);
          goto LABEL_21;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
        [WeakRetained bounds];
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", WeakRetained, x, floor((v15 - height) * 0.5), width, height);
        double y = v16;
        double width = v17;
        double height = v18;
        goto LABEL_20;
      }
    }
  }

LABEL_9:
  if (!self->_customSelectedIndicatorImage
    && [(UITabBarButton *)self _areTabBarButtonAccessibilityButtonShapesEnabled])
  {
    if ([(UITabBarButton *)self isDefaultTVLayout])
    {
      [(UIImageView *)self->_selectedIndicator setHidden:1];
      [(UIView *)self->_highContrastFocusIndicator setHidden:1];
      goto LABEL_21;
    }
    id v20 = objc_loadWeakRetained((id *)&self->_tabBar);
    id WeakRetained = v20;
    if (v20)
    {
      double width = width + 0.0;
      [v20 bounds];
      double height = v21 + -4.0 - fmax(_UIBackgroundExtensionForBar(WeakRetained), 0.0);
      -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", WeakRetained, 0.0, 2.0);
      double y = v22;
    }
LABEL_20:
  }
LABEL_21:
  uint64_t v23 = [(UIImageView *)self->_selectedIndicator image];
  id v28 = v23;
  if (v23 && ([v23 _isResizable] & 1) == 0)
  {
    [v28 size];
    if (v25 != width || v26 != height)
    {
      double v24 = v26;
      double x = x + floor((width - v25) * 0.5);
      double y = y + floor((height - v26) * 0.5);
      double width = v25;
      goto LABEL_31;
    }
LABEL_30:
    double v24 = height;
    goto LABEL_31;
  }
  if (width >= 48.0) {
    goto LABEL_30;
  }
  v32.origin.double x = x;
  v32.origin.double y = y;
  v32.size.double width = width;
  v32.size.double height = height;
  CGRect v33 = CGRectInset(v32, -round((48.0 - width) * 0.5), 0.0);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double v24 = v33.size.height;
LABEL_31:
  -[UIImageView setFrame:](self->_selectedIndicator, "setFrame:", x, y, width, v24);
  -[UIView setFrame:](self->_highContrastFocusIndicator, "setFrame:", x, y, width, v24);
}

- (BOOL)labelShouldUseVibrancyForState:(int64_t)a3
{
  if (!self->_itemVibrantEffect) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  int64_t layoutStyle = self->_layoutStyle;
  id v7 = WeakRetained;
  double v8 = v7;
  if (a3 == 2 || layoutStyle == 3 || layoutStyle == 4 && ([v7 _vibrantLabels] & 1) == 0)
  {

    return 0;
  }

  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData) {
    return ![(_UITabBarItemData *)itemAppearanceData titleTextAttributesSpecifyColorForState:a3];
  }
  else {
    return 1;
  }
}

- (void)_ios_layoutSubviews
{
  [(UIView *)self bounds];
  double v93 = v3;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  BOOL v10 = [(UIView *)self _shouldReverseLayoutDirection];
  int64_t layoutStyle = self->_layoutStyle;
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v99 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  imageView = self->_imageView;
  double v16 = v14;
  double v17 = v13;
  if (imageView)
  {
    [(UITabBarSwappableImageView *)imageView setLandscape:layoutStyle == 2];
    -[UITabBarSwappableImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v7, v9);
    double v17 = v18;
    double v16 = v19;
    id v20 = [(UIImageView *)self->_imageView image];
    int v21 = [v20 hasBaseline];

    if (v21) {
      -[UIImageView setFrame:](self->_imageView, "setFrame:", v99, v12, v17, v16);
    }
  }
  double v98 = v12;
  double v97 = v14;
  [(UITabBarButton *)self titlePositionAdjustmentForState:[(UITabBarButton *)self _currentItemState]];
  int64_t v22 = self->_layoutStyle;
  uint64_t v23 = [(UIView *)self window];
  double v24 = [v23 windowScene];
  _UITabBarMetricsForStyleAndScene(v22, v24);
  double v26 = v25;

  double v27 = 49.0;
  if (layoutStyle == 2) {
    double v27 = 32.0;
  }
  double v94 = v9;
  double v28 = v9 - v27;
  double v29 = v28 + v26;
  label = self->_label;
  if (!self->_layoutStyle)
  {
    [(UITabBarButtonLabel *)label resizeToFitWidth:v7];
    CGFloat v46 = self->_label;
    if (v46)
    {
      [(UIView *)v46 frame];
      UIFloorToViewScale(self);
      double v48 = v47;
      [(UILabel *)self->_label _firstBaselineOffsetFromTop];
      UIFloorToViewScale(self);
      double v5 = v49;
      UICeilToViewScale(self);
      double v7 = v50;
      UICeilToViewScale(self);
      double v52 = v51;
      double v53 = v48;
      double v97 = v52;
      double v13 = v7;
      double v96 = v5;
      double v40 = v48;
      double v32 = v16;
    }
    else
    {
      double v96 = v98;
      double v32 = v16;
      double v40 = v99;
      double v53 = v93;
      double v52 = v94;
    }
    double v60 = v5;
    double v61 = v7;
    CGRectGetMidX(*(CGRect *)&v53);
    if (self->_imageView)
    {
      UIFloorToViewScale(self);
      double v45 = v62;
      CGRect v63 = [(UIImageView *)self->_imageView image];
      int v64 = [v63 hasBaseline];

      if (v64)
      {
        double v55 = _yOffsetForBaselinedImageView(self->_imageView, self);
        CGRect v65 = self;
        double v66 = v45;
        double v67 = v55;
        double v68 = v17;
        double v69 = v32;
        double MidY = v29;
        uint64_t v71 = 1;
      }
      else
      {
        UIFloorToViewScale(self);
        double top = self->_imageInsets.top;
        double left = self->_imageInsets.left;
        double v45 = v45 + left;
        double v55 = v90 + top;
        double v17 = v17 - (left + self->_imageInsets.right);
        double v32 = v32 - (top + self->_imageInsets.bottom);
        v102.origin.double x = v45;
        v102.origin.double y = v55;
        v102.size.double width = v17;
        v102.size.double height = v32;
        double MidY = CGRectGetMidY(v102);
        CGRect v65 = self;
        double v66 = v45;
        double v67 = v55;
        double v68 = v17;
        double v69 = v32;
        uint64_t v71 = 0;
      }
      -[UITabBarButton _showBoundsViewAt:alignmentViewAt:forSymbolImage:](v65, "_showBoundsViewAt:alignmentViewAt:forSymbolImage:", v71, v66, v67, v68, v69, MidY);
    }
    else
    {
      double v45 = v99;
      double v55 = v98;
    }
    double v38 = v97;
    double v78 = v96;
    goto LABEL_39;
  }
  CGRect v31 = self->_imageView;
  if (label)
  {
    double v92 = v28 + v26;
    double v32 = v16;
    if (!v31)
    {
      [(UITabBarButtonLabel *)label resizeToFitWidth:v7];
      [(UIView *)self->_label frame];
      double v95 = v56;
      double v13 = v57;
      double v38 = v58;
      UIFloorToViewScale(self);
      double v40 = v59;
      double v45 = v99;
      goto LABEL_19;
    }
    if (_UIIsFourInch()) {
      double v33 = 5.0;
    }
    else {
      double v33 = 6.0;
    }
    [(UITabBarButtonLabel *)self->_label resizeToFitWidth:v7 - v33 - v17];
    [(UIView *)self->_label frame];
    double v35 = v34;
    double v13 = v36;
    double v38 = v37;
    UIFloorToViewScale(self);
    double v40 = v39;
    double v95 = v35;
    if (v10)
    {
      double v41 = v35;
      double v42 = v13;
      double v43 = v38;
      CGRectGetMaxX(*(CGRect *)&v39);
      UIFloorToViewScale(self);
      double v45 = v44;
LABEL_19:
      double v55 = v98;
      goto LABEL_26;
    }
    double v55 = v98;
    double v72 = v98;
    double v73 = v17;
    double v74 = v32;
    CGRectGetMaxX(*(CGRect *)&v39);
    UIFloorToViewScale(self);
    double v45 = v40;
    double v40 = v75;
  }
  else
  {
    double v32 = v16;
    if (!v31)
    {
      double v40 = v99;
      double v45 = v99;
      double v38 = v97;
      double v55 = v98;
      double v78 = v98;
      goto LABEL_39;
    }
    double v92 = v29;
    UIFloorToViewScale(self);
    double v45 = v54;
    double v38 = v14;
    double v55 = v98;
    double v95 = v98;
    double v40 = v99;
  }
LABEL_26:
  v76 = self->_label;
  if (v76)
  {
    [(UILabel *)v76 _firstBaselineOffsetFromTop];
    UIFloorToViewScale(self);
    double v78 = v77;
    UICeilToViewScale(self);
    double v13 = v79;
    UICeilToViewScale(self);
    double v38 = v80;
  }
  else
  {
    double v78 = v95;
  }
  v81 = self->_imageView;
  if (v81)
  {
    v82 = [(UIImageView *)v81 image];
    int v83 = [v82 hasBaseline];

    if (v83)
    {
      double v55 = _yOffsetForBaselinedImageView(self->_imageView, self);
      -[UITabBarButton _showBoundsViewAt:alignmentViewAt:forSymbolImage:](self, "_showBoundsViewAt:alignmentViewAt:forSymbolImage:", 1, v45, v55, v17, v32, v92);
    }
    else
    {
      UIFloorToViewScale(self);
      uint64_t v85 = 25;
      if (layoutStyle == 2) {
        uint64_t v85 = 26;
      }
      v86 = (double *)((char *)self + OBJC_IVAR___UITabBarSwappableImageView__value[v85]);
      double v87 = v86[1];
      double v45 = v45 + v87;
      double v55 = v84 + *v86;
      double v17 = v17 - (v87 + v86[3]);
      double v32 = v32 - (*v86 + v86[2]);
      v101.origin.double x = v45;
      v101.origin.double y = v55;
      v101.size.double width = v17;
      v101.size.double height = v32;
      -[UITabBarButton _showBoundsViewAt:alignmentViewAt:forSymbolImage:](self, "_showBoundsViewAt:alignmentViewAt:forSymbolImage:", 0, v45, v55, v17, v32, CGRectGetMidY(v101));
    }
  }
LABEL_39:
  -[UILabel setFrame:](self->_label, "setFrame:", v40, v78, v13, v38);
  v91 = self->_imageView;
  -[UIImageView setFrame:](v91, "setFrame:", v45, v55, v17, v32);
}

- (UIOffset)titlePositionAdjustmentForState:(int64_t)a3
{
  if (self->_itemAppearanceData)
  {
    [(_UITabBarItemData *)self->_itemAppearanceData titlePositionAdjustmentForState:a3];
  }
  else
  {
    double horizontal = self->_labelOffset.horizontal;
    double vertical = self->_labelOffset.vertical;
  }
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)_showBoundsViewAt:(CGRect)a3 alignmentViewAt:(double)a4 forSymbolImage:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = +[_UIBarSettingsDomain rootSettings];
  double v13 = [v12 tabBarSettings];
  int v14 = [v13 showAlignmentGuides];

  if (v14)
  {
    _viewForKey(self, &_MergedGlobals_33_0);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    double v15 = _viewForKey(self, &unk_1EB25A969);
    p_imageView = (id *)&self->_imageView;
    double v17 = [(UIView *)self->_imageView superview];
    objc_msgSend(v17, "convertRect:toView:", self, x, y, width, height);
    double v19 = v18;
    CGFloat v21 = v20;
    double v23 = v22;
    CGFloat v25 = v24;

    if (a5) {
      +[UIColor greenColor];
    }
    else {
    double v27 = +[UIColor blueColor];
    }
    v36.origin.double x = v19;
    v36.origin.double y = v21;
    v36.size.double width = v23;
    v36.size.double height = v25;
    CGRect v37 = CGRectInset(v36, -1.0, -1.0);
    objc_msgSend(v15, "setFrame:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
    id v28 = v27;
    uint64_t v29 = [v28 CGColor];
    CGRect v30 = [v15 layer];
    [v30 setBorderColor:v29];

    CGRect v31 = [v15 layer];
    [v31 setBorderWidth:1.0];

    objc_msgSend(v34, "setFrame:", v19 + -5.0, a4, v23 + 10.0, 1.0);
    [v34 setBackgroundColor:v28];
    double v32 = [*p_imageView superview];
    if (v32 != self) {
      p_imageView = (id *)&self->_vibrancyEffectView;
    }
    id v33 = *p_imageView;

    [(UIView *)self insertSubview:v15 aboveSubview:v33];
    [(UIView *)self insertSubview:v34 aboveSubview:v15];
  }
  else
  {
    double v26 = objc_getAssociatedObject(self, &_MergedGlobals_33_0);
    [v26 removeFromSuperview];

    objc_getAssociatedObject(self, &unk_1EB25A969);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    [v34 removeFromSuperview];
  }
}

- (void)setItemVibrantEffect:(id)a3
{
  double v5 = (UIVibrancyEffect *)a3;
  if (self->_itemVibrantEffect != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_itemVibrantEffect, a3);
    [(UITabBarButton *)self _updateToMatchCurrentState];
    double v5 = v6;
  }
}

- (void)setItemAppearanceData:(id)a3
{
  id v5 = a3;
  double v6 = self->_itemAppearanceData;
  double v7 = (_UITabBarItemData *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(_UIBarAppearanceData *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_itemAppearanceData, a3);
    [(UITabBarButton *)self _updateToMatchCurrentState];
  }
LABEL_9:
}

- (void)_setTabBarHitRect:(CGRect)a3
{
  self->_hitRect = a3;
}

- (void)_setSelected:(BOOL)a3
{
  self->_selected = a3;
  [(UITabBarButton *)self _updateToMatchCurrentState];
}

- (void)_showSelectedIndicator:(BOOL)a3 changeSelection:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  BOOL v8 = [WeakRetained _appearanceStorage];
  double v9 = [v8 selectionIndicatorImage];
  if (v9)
  {
  }
  else
  {
    BOOL v10 = [(UITabBarButton *)self _areTabBarButtonAccessibilityButtonShapesEnabled];

    if (!v10)
    {
      selectedIndicator = self->_selectedIndicator;
      goto LABEL_14;
    }
  }
  selectedIndicator = self->_selectedIndicator;
  if (v5)
  {
    if (!selectedIndicator)
    {
      [(UITabBarButton *)self _updateSelectedIndicatorView];
      [(UIView *)self insertSubview:self->_selectedIndicator atIndex:0];
      [(UIView *)self insertSubview:self->_highContrastFocusIndicator aboveSubview:self->_selectedIndicator];
      if (!v4) {
        return;
      }
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (selectedIndicator)
  {
LABEL_14:
    [(UIView *)selectedIndicator removeFromSuperview];
    double v12 = self->_selectedIndicator;
    self->_selectedIndicator = 0;

    [(UIView *)self->_highContrastFocusIndicator removeFromSuperview];
    highContrastFocusIndicator = self->_highContrastFocusIndicator;
    self->_highContrastFocusIndicator = 0;

    if (!v4) {
      return;
    }
    goto LABEL_10;
  }
LABEL_9:
  if (!v4) {
    return;
  }
LABEL_10:
  [(UITabBarButton *)self _setSelected:v5];
}

- (BOOL)_areTabBarButtonAccessibilityButtonShapesEnabled
{
  return (self->_accessibilityGrayStatusEnabled
       || self->_accessibilityButtonShapesEnabled
       || self->_accessibilityHighContractFocusIndicatorEnabled)
      && objc_msgSend(-[UIView _screen](self, "_screen"), "_userInterfaceIdiom") != 3;
}

- (void)setSpringLoaded:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isEnabled] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarButton;
    [(UIControl *)&v7 setEnabled:v3];
    [(UIView *)self alpha];
    if (v5 > 0.0)
    {
      double v6 = 0.25;
      if (v3) {
        double v6 = 1.0;
      }
      [(UIView *)self setAlpha:v6];
    }
  }
}

- (void)_setShowsHighlightedState:(BOOL)a3
{
  if (self->_showsHighlightedState != a3)
  {
    self->_showsHighlightedState = a3;
    [(UITabBarButton *)self _updateToMatchCurrentState];
  }
}

- (void)_setBadgeOffset:(UIOffset)a3
{
  self->_badgeOffset = a3;
  [(UITabBarButton *)self _positionBadge];
}

- (void)_setAppearanceGuideClass:(Class)a3
{
  objc_storeStrong((id *)&self->_appearanceGuideClass, a3);
  label = self->_label;
  [(UITabBarButtonLabel *)label _setAppearanceGuideClass:a3];
}

- (void)_applyTabBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, v7, (void *)1);
  }
  if (v6)
  {
    [(UITabBarButtonLabel *)self->_label _applyTabBarButtonAppearanceStorage:v6 withTaggedSelectors:v7];
    [v6 titleOffset];
    -[UITabBarButton _setTitlePositionAdjustment:](self, "_setTitlePositionAdjustment:");
    BOOL v8 = [v6 badgeColor];
    [(UITabBarButton *)self _setBadgeColor:v8];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__UITabBarButton__applyTabBarButtonAppearanceStorage_withTaggedSelectors___block_invoke;
    v9[3] = &unk_1E52DF918;
    v9[4] = self;
    [v6 enumerateBadgeTextAttributesWithBlock:v9];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_int64_t layoutStyle = a3;
    label = self->_label;
    if (label)
    {
      double v5 = [(UIView *)self traitCollection];
      -[UITabBarButtonLabel _updateForFontChangeWithIdiom:](label, "_updateForFontChangeWithIdiom:", [v5 userInterfaceIdiom]);
    }
    [(UIView *)self setNeedsLayout];
  }
}

UISpringLoadedInteraction *__49__UITabBarButton_SpringLoading__setSpringLoaded___block_invoke()
{
  v0 = [[UISpringLoadedInteraction alloc] initWithActivationHandler:&__block_literal_global_385_0];
  return v0;
}

- (id)titleTextAttributesForState:(int64_t)a3
{
  itemAppearanceData = self->_itemAppearanceData;
  if (!itemAppearanceData)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UITabBarButton.m" lineNumber:2222 description:@"This method should only be called when a UITabBarAppearance has been set"];

    itemAppearanceData = self->_itemAppearanceData;
  }
  id v6 = [(UIView *)self traitCollection];
  id v7 = [(_UITabBarItemData *)itemAppearanceData titleTextAttributesForState:a3 compatibleWithTraitCollection:v6];

  return v7;
}

- (void)_setBadgeValue:(id)a3
{
  id v4 = a3;
  badge = self->_badge;
  if (v4)
  {
    if (!badge)
    {
      id v7 = [[_UIBadgeView alloc] initWithText:v4];
      BOOL v8 = self->_badge;
      self->_badge = v7;

      [(UIView *)self addSubview:self->_badge];
      [(UITabBarButton *)self _updateBadgeAppearanceAndLayoutNow:1];
      goto LABEL_7;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__UITabBarButton__setBadgeValue___block_invoke;
    v9[3] = &unk_1E52D9F98;
    v9[4] = self;
    BOOL v10 = (_UIBadgeView *)v4;
    [(UITabBarButton *)self _positionBadgeAfterChangesIfNecessary:v9];
    id v6 = v10;
  }
  else
  {
    [(UIView *)badge removeFromSuperview];
    id v6 = self->_badge;
    self->_badge = 0;
  }

LABEL_7:
}

- (void)_positionBadgeAfterChangesIfNecessary:(id)a3
{
  if (self->_badge)
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    [(UITabBarButton *)self _positionBadge];
  }
}

- (UIOffset)badgePositionAdjustmentForState:(int64_t)a3
{
  itemAppearanceData = self->_itemAppearanceData;
  if (itemAppearanceData)
  {
    [(_UITabBarItemData *)itemAppearanceData badgePositionAdjustmentForState:a3];
    double horizontal = v5;
  }
  else
  {
    double horizontal = self->_badgeOffset.horizontal;
  }
  int64_t layoutStyle = self->_layoutStyle;
  BOOL v8 = [(UIView *)self window];
  double v9 = [v8 windowScene];
  double v10 = _UITabBarAdjustBadgePositionForStyleAndScene(layoutStyle, v9, horizontal);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double vertical = v14;
  result.double horizontal = v13;
  return result;
}

- (CGRect)_contentRect
{
  imageView = self->_imageView;
  id v4 = self->_label;
  double v5 = imageView;
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [(UIView *)v4 frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(UIView *)v6 frame];
    v55.origin.double x = v16;
    v55.origin.double y = v17;
    v55.size.double width = v18;
    v55.size.double height = v19;
    v51.origin.double x = v9;
    v51.origin.double y = v11;
    v51.size.double width = v13;
    v51.size.double height = v15;
    CGRect v52 = CGRectUnion(v51, v55);
LABEL_10:
    double x = v52.origin.x;
    double y = v52.origin.y;
    double width = v52.size.width;
    double height = v52.size.height;
    goto LABEL_11;
  }
  if (v4)
  {
    double v5 = (UITabBarSwappableImageView *)v4;
LABEL_9:
    [(UIView *)v5 frame];
    goto LABEL_10;
  }
  if (v5) {
    goto LABEL_9;
  }
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_11:

  v53.origin.double x = x;
  v53.origin.double y = y;
  v53.size.double width = width;
  v53.size.double height = height;
  if (!CGRectIsNull(v53))
  {
    [(UIView *)self bounds];
    double v25 = v24;
    double v27 = v26;
    id v28 = +[_UIPointerSettingsDomain rootSettings];
    uint64_t v29 = [v28 tabBarSettings];

    int64_t layoutStyle = self->_layoutStyle;
    if ((unint64_t)(layoutStyle - 1) >= 2)
    {
      double v36 = 0.0;
      double v34 = 0.0;
      double v38 = 0.0;
      double v32 = 0.0;
      if (layoutStyle)
      {
LABEL_24:
        double x = x + v36;
        double y = v25 + v32;
        double width = width - (v36 + v38);
        double height = v27 - (v34 + v32);

        goto LABEL_25;
      }
      objc_msgSend(v29, "stackedTopInset", 0.0);
      double v32 = v39;
      [v29 stackedBottomInset];
      double v41 = v40;
      [(UIView *)self safeAreaInsets];
      if (v41 >= v42)
      {
        [v29 stackedBottomInset];
        double v34 = v43;
      }
      if ([(UIView *)self _shouldReverseLayoutDirection])
      {
        [v29 stackedTrailingPadding];
        double v36 = -v44;
        [v29 stackedLeadingPadding];
      }
      else
      {
        [v29 stackedLeadingPadding];
        double v36 = -v46;
        [v29 stackedTrailingPadding];
      }
    }
    else
    {
      [v29 inlineTopInset];
      double v32 = v31;
      [v29 inlineBottomInset];
      double v34 = v33;
      if ([(UIView *)self _shouldReverseLayoutDirection])
      {
        [v29 inlineTrailingPadding];
        double v36 = -v35;
        [v29 inlineLeadingPadding];
      }
      else
      {
        [v29 inlineLeadingPadding];
        double v36 = -v45;
        [v29 inlineTrailingPadding];
      }
    }
    double v38 = -v37;
    goto LABEL_24;
  }
LABEL_25:
  double v47 = x;
  double v48 = y;
  double v49 = width;
  double v50 = height;
  result.size.double height = v50;
  result.size.double width = v49;
  result.origin.double y = v48;
  result.origin.double x = v47;
  return result;
}

- (id)_selectedIndicatorView
{
  return self->_selectedIndicator;
}

+ (id)_defaultLabelColor
{
  uint64_t v2 = (void *)_defaultLabelColor___labelColor_0;
  if (!_defaultLabelColor___labelColor_0)
  {
    BOOL v3 = [[UIColor alloc] initWithWhite:0.57254902 alpha:1.0];
    id v4 = (void *)_defaultLabelColor___labelColor_0;
    _defaultLabelColor___labelColor_0 = (uint64_t)v3;

    uint64_t v2 = (void *)_defaultLabelColor___labelColor_0;
  }
  return v2;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UIAccessibilityHighContrastFocusIndicatorChangedNotification" object:0];

  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"UIAccessibilityGrayscaleStatusDidChangeNotification" object:0];

  v6.receiver = self;
  v6.super_class = (Class)UITabBarButton;
  [(UIView *)&v6 dealloc];
}

- (UITabBarButton)initWithImage:(id)a3 selectedImage:(id)a4 label:(id)a5 withInsets:(UIEdgeInsets)a6 tabBar:(id)a7
{
  return -[UITabBarButton initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:](self, "initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:", a3, 0, a4, 0, a5, a7, a6.top, a6.left, a6.bottom, a6.right, 0.0, 0.0, 0.0, 0.0);
}

- (void)_updateAfterTraitCollectionOrAccessibilityDidChangeTV
{
  if (self->_vibrancyEffectView)
  {
    [(UITabBarButton *)self _updateVibrancyEffectView];
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __71__UITabBarButton__updateAfterTraitCollectionOrAccessibilityDidChangeTV__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    +[UIView _performSystemAppearanceModifications:v3];
    [(UITabBarButton *)self _updateToMatchCurrentState];
    [(UITabBarButtonLabel *)self->_label updateTextColorsForState];
  }
}

void __71__UITabBarButton__updateAfterTraitCollectionOrAccessibilityDidChangeTV__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tabBar];
  uint64_t v3 = [v2 _effectiveUnselectedLabelTintColor];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 632);
  *(void *)(v4 + 632) = v3;

  objc_super v6 = *(id **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6 + 91);
  double v8 = [WeakRetained _effectiveUnselectedTintColor];
  [v6 _setContentTintColor:v8 forState:0];

  CGFloat v9 = *(void **)(a1 + 32);
  id v10 = +[UIColor blackColor];
  [v9 _setContentTintColor:v10 forState:1];
}

- (void)setImage:(id)a3
{
}

- (CGRect)_tabBarHitRect
{
  double x = self->_hitRect.origin.x;
  double y = self->_hitRect.origin.y;
  double width = self->_hitRect.size.width;
  double height = self->_hitRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_accessibilityGrayStatusDidChangeNotification:(id)a3
{
  self->_accessibilityGrayStatusEnabled = _AXSGrayscaleEnabled() != 0;
  BOOL v4 = [(UITabBarButton *)self _isSelected];
  [(UITabBarButton *)self _showSelectedIndicator:v4 changeSelection:0];
}

- (void)_accessibilityHighContractFocusIndicatorDidChangeNotification:(id)a3
{
  self->_accessibilityHighContractFocusIndicatorEnabled = _AXSHighContrastFocusIndicatorsEnabled() != 0;
  BOOL v4 = [(UITabBarButton *)self _isSelected];
  [(UITabBarButton *)self _showSelectedIndicator:v4 changeSelection:0];
}

- (void)_accessibilityButtonShapesDidChangeNotification:(id)a3
{
  self->_accessibilityButtonShapesEnabled = _AXSButtonShapesEnabled() != 0;
  BOOL v4 = [(UITabBarButton *)self _isSelected];
  [(UITabBarButton *)self _showSelectedIndicator:v4 changeSelection:0];
}

- (id)_selectedIndicatorImage
{
  uint64_t v3 = self->_customSelectedIndicatorImage;
  if (!v3)
  {
    if ([(UITabBarButton *)self _areTabBarButtonAccessibilityButtonShapesEnabled])
    {
      BOOL v4 = (void *)AccessibilitySelectedImageIndicatorMask_maskImage;
      if (!AccessibilitySelectedImageIndicatorMask_maskImage)
      {
        _UIGraphicsBeginImageContextWithOptions(0, 0, 11.0, 11.0, 1.0);
        double v5 = +[UIColor blackColor];
        [v5 set];

        objc_super v6 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 11.0, 11.0, 5.0);
        [v6 fill];

        BOOL v7 = _UIGraphicsGetImageFromCurrentImageContext(0);
        uint64_t v8 = objc_msgSend(v7, "resizableImageWithCapInsets:resizingMode:", 1, 5.0, 5.0, 5.0, 5.0);
        CGFloat v9 = (void *)AccessibilitySelectedImageIndicatorMask_maskImage;
        AccessibilitySelectedImageIndicatorMask_maskImage = v8;

        ContextStack = (int *)GetContextStack(0);
        PopContextFromStack(ContextStack);
        BOOL v4 = (void *)AccessibilitySelectedImageIndicatorMask_maskImage;
      }
      uint64_t v3 = v4;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (void)_updateSelectedIndicatorView
{
  uint64_t v3 = [(UITabBarButton *)self _selectedIndicatorImage];
  selectedIndicator = self->_selectedIndicator;
  double v22 = v3;
  if (v3)
  {
    if (!selectedIndicator)
    {
      double v5 = objc_alloc_init(UIImageView);
      objc_super v6 = self->_selectedIndicator;
      self->_selectedIndicator = v5;

      uint64_t v3 = v22;
    }
    if (v3 == self->_customSelectedIndicatorImage)
    {
      double v8 = 1.0;
      uint64_t v9 = 1;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
      if ([WeakRetained barStyle]) {
        double v8 = 0.25;
      }
      else {
        double v8 = 0.15;
      }

      uint64_t v9 = 2;
    }
    [(UIView *)self->_selectedIndicator setAlpha:v8];
    [(UIImageView *)self->_selectedIndicator _setDefaultRenderingMode:v9];
    [(UIView *)self bounds];
    double x = v11;
    double y = v13;
    double width = v15;
    double height = v17;
    if ([(UIImage *)v22 _isResizable])
    {
      if (width < 48.0)
      {
        v24.origin.double x = x;
        v24.origin.double y = y;
        v24.size.double width = width;
        v24.size.double height = height;
        CGRect v25 = CGRectInset(v24, -round((48.0 - width) * 0.5), 0.0);
        double x = v25.origin.x;
        double y = v25.origin.y;
        double width = v25.size.width;
        double height = v25.size.height;
      }
      uint64_t v19 = 0;
    }
    else
    {
      [(UIImage *)v22 size];
      if (v20 == width && v21 == height)
      {
        uint64_t v19 = 4;
      }
      else
      {
        double x = x + floor((width - v20) * 0.5);
        double y = y + floor((height - v21) * 0.5);
        uint64_t v19 = 4;
        double height = v21;
        double width = v20;
      }
    }
    [(UIImageView *)self->_selectedIndicator setContentMode:v19];
    -[UIImageView setFrame:](self->_selectedIndicator, "setFrame:", x, y, width, height);
    [(UIImageView *)self->_selectedIndicator setImage:v22];
  }
  else
  {
    [(UIView *)selectedIndicator removeFromSuperview];
    id v10 = self->_selectedIndicator;
    self->_selectedIndicator = 0;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITabBarButton;
  [(UIControl *)&v4 setHighlighted:a3];
  [(UITabBarButton *)self _updateToMatchCurrentState];
}

- (UIColor)_unselectedTintColor
{
  return (UIColor *)[(UITabBarButton *)self _contentTintColorForState:0];
}

- (void)_setUnselectedTintColor:(id)a3
{
  id v4 = a3;
  [(UITabBarButton *)self _setContentTintColor:v4 forState:0];
  [(UITabBarButtonLabel *)self->_label setUnselectedTintColor:v4];

  [(UITabBarButton *)self _updateToMatchCurrentState];
}

- (BOOL)_isSelected
{
  return self->_selected;
}

uint64_t __33__UITabBarButton__setBadgeValue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 512) setText:*(void *)(a1 + 40)];
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return CGRectContainsPoint(self->_hitRect, a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return CGRectContainsPoint(self->_hitRect, a3);
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  CGRect v10 = CGRectInset(self->_hitRect, -15.0, -15.0);
  CGFloat v6 = x;
  CGFloat v7 = y;
  return CGRectContainsPoint(v10, *(CGPoint *)&v6);
}

- (CGSize)_appleTV_sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIView *)self bounds];
  imageView = self->_imageView;
  if (imageView) {
    -[UITabBarSwappableImageView sizeThatFits:](imageView, "sizeThatFits:", width, height);
  }
  label = self->_label;
  if (label)
  {
    -[UILabel sizeThatFits:](label, "sizeThatFits:", width, height);
    if (self->_label) {
      [(UITabBarButton *)self titlePositionAdjustmentForState:[(UITabBarButton *)self _currentItemState]];
    }
  }
  UICeilToViewScale(self);
  double v9 = v8;
  UICeilToViewScale(self);
  double v11 = v10;
  double v12 = v9;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)_setupCarplayConstraints
{
  v63[6] = *MEMORY[0x1E4F143B8];
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  double v60 = objc_opt_new();
  uint64_t v3 = [(UITabBarButton *)self focusView];
  [(UIView *)self addSubview:v3];

  id v4 = [(UITabBarButton *)self focusView];
  double v5 = [v4 widthAnchor];
  double v59 = [v5 constraintLessThanOrEqualToConstant:76.0];

  LODWORD(v6) = 1148846080;
  [v59 setPriority:v6];
  CGFloat v7 = [(UITabBarButton *)self focusView];
  double v8 = [v7 leadingAnchor];
  double v9 = [(UIView *)self leadingAnchor];
  double v10 = [v8 constraintLessThanOrEqualToAnchor:v9 constant:2.0];

  double v11 = [(UITabBarButton *)self focusView];
  double v12 = [v11 trailingAnchor];
  double v13 = [(UIView *)self trailingAnchor];
  double v14 = [v12 constraintLessThanOrEqualToAnchor:v13 constant:-2.0];

  LODWORD(v15) = 1144750080;
  [v10 setPriority:v15];
  LODWORD(v16) = 1144750080;
  [v14 setPriority:v16];
  double v54 = [(UITabBarButton *)self focusView];
  CGRect v52 = [v54 topAnchor];
  double v50 = [(UIView *)self topAnchor];
  double v49 = [v52 constraintEqualToAnchor:v50 constant:2.0];
  v63[0] = v49;
  double v48 = [(UITabBarButton *)self focusView];
  double v17 = [v48 bottomAnchor];
  CGFloat v18 = [(UIView *)self bottomAnchor];
  uint64_t v19 = [v17 constraintEqualToAnchor:v18 constant:-3.0];
  v63[1] = v19;
  double v20 = [(UITabBarButton *)self focusView];
  double v21 = [v20 centerXAnchor];
  double v22 = [(UIView *)self centerXAnchor];
  double v23 = [v21 constraintEqualToAnchor:v22];
  v63[2] = v23;
  v63[3] = v59;
  double v58 = v10;
  v63[4] = v10;
  v63[5] = v14;
  double v57 = v14;
  CGRect v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:6];
  [v60 addObjectsFromArray:v24];

  imageView = self->_imageView;
  if (imageView)
  {
    double v26 = [(UIView *)imageView centerXAnchor];
    double v27 = [(UIView *)self centerXAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];
    [v60 addObject:v28];

    uint64_t v29 = [(UIImageView *)self->_imageView image];
    LODWORD(v27) = [v29 hasBaseline];

    CGRect v30 = self->_imageView;
    if (v27)
    {
      double v31 = [(UIView *)v30 lastBaselineAnchor];
      double v32 = [(UIView *)self topAnchor];
      double v33 = [v31 constraintEqualToAnchor:v32 constant:20.0];
      [v60 addObject:v33];
    }
    else
    {
      double v31 = [(UIView *)v30 centerYAnchor];
      double v32 = [(UIView *)self topAnchor];
      double v33 = [v31 constraintEqualToAnchor:v32 constant:13.0];
      v62[0] = v33;
      double v34 = [(UIView *)self->_imageView heightAnchor];
      double v35 = [v34 constraintLessThanOrEqualToConstant:21.0];
      v62[1] = v35;
      double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
      [v60 addObjectsFromArray:v36];
    }
  }
  label = self->_label;
  if (label)
  {
    [(UILabel *)label setTextAlignment:1];
    CGRect v55 = [(UIView *)self->_label leadingAnchor];
    double v56 = [(UITabBarButton *)self focusView];
    CGRect v53 = [v56 leadingAnchor];
    CGRect v51 = [v55 constraintEqualToAnchor:v53 constant:2.0];
    v61[0] = v51;
    double v38 = [(UIView *)self->_label trailingAnchor];
    double v39 = [(UITabBarButton *)self focusView];
    double v40 = [v39 trailingAnchor];
    double v41 = [v38 constraintEqualToAnchor:v40 constant:-2.0];
    v61[1] = v41;
    double v42 = [(UIView *)self->_label lastBaselineAnchor];
    double v43 = [(UIView *)self topAnchor];
    double v44 = [v42 constraintEqualToAnchor:v43 constant:36.0];
    v61[2] = v44;
    double v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
    [v60 addObjectsFromArray:v45];
  }
  [(UITabBarButton *)self setCarplayConstraints:v60];
  double v46 = (void *)MEMORY[0x1E4F5B268];
  double v47 = [(UITabBarButton *)self carplayConstraints];
  [v46 activateConstraints:v47];
}

- (void)_appleTV_layoutSubviews
{
  [(UIView *)self bounds];
  double v5 = v4;
  imageView = self->_imageView;
  if (imageView)
  {
    [(UIView *)imageView frame];
    CGFloat v7 = self->_imageView;
    [(UIView *)self bounds];
    -[UITabBarSwappableImageView sizeThatFits:](v7, "sizeThatFits:", v8, v9);
    if (v5 != 0.0)
    {
      double v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"_UITabBarButton.m" lineNumber:1744 description:@"huh?"];
    }
    UIFloorToViewScale(self);
    UIFloorToViewScale(self);
    double v11 = v10;
    UIFloorToViewScale(self);
    double v13 = v12;
    UICeilToViewScale(self);
    double v15 = v14;
    UICeilToViewScale(self);
    CGFloat v17 = v16;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v11, v13, v15, v16);
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  label = self->_label;
  if (label)
  {
    [(UIView *)label frame];
    if (self->_imageView)
    {
      v28.origin.CGFloat x = v11;
      v28.origin.CGFloat y = v13;
      v28.size.double width = v15;
      v28.size.double height = v17;
      CGRectGetMaxX(v28);
    }
    [(UITabBarButton *)self titlePositionAdjustmentForState:[(UITabBarButton *)self _currentItemState]];
    UIFloorToViewScale(self);
    double v20 = v19;
    UIFloorToViewScale(self);
    double v22 = v21;
    UICeilToViewScale(self);
    double v24 = v23;
    UICeilToViewScale(self);
    -[UILabel setFrame:](self->_label, "setFrame:", v20, v22, v24, v25);
  }
  [(UITabBarButton *)self _updateSelectedIndicatorFrame];
}

- (CGSize)_horizontalLayout_sizeThatFits:(CGSize)a3
{
  [(UIView *)self bounds];
  double v5 = v4;
  [(UIView *)self->_label bounds];
  double v7 = v6;
  BOOL v8 = _UIIsFourInch();
  double v9 = 6.0;
  if (v8) {
    double v9 = 5.0;
  }
  double v10 = v7 + v9;
  [(UIView *)self->_imageView bounds];
  double v12 = v10 + v11;
  double v13 = v5;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_layoutStyle)
  {
    -[UITabBarButton _horizontalLayout_sizeThatFits:](self, "_horizontalLayout_sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBarButton;
    -[UIView sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_setCustomSelectedIndicatorImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  if (self->_customSelectedIndicatorImage != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)&self->_customSelectedIndicatorImage, a3);
    selectedIndicator = self->_selectedIndicator;
    if (!selectedIndicator)
    {
      BOOL v7 = [(UITabBarButton *)self _isSelected];
      objc_super v5 = v9;
      if (!v7) {
        goto LABEL_6;
      }
      selectedIndicator = self->_selectedIndicator;
    }
    [(UIView *)selectedIndicator removeFromSuperview];
    BOOL v8 = self->_selectedIndicator;
    self->_selectedIndicator = 0;

    [(UITabBarButton *)self _showSelectedIndicator:1 changeSelection:0];
    objc_super v5 = v9;
  }
LABEL_6:
}

- (id)_systemDefaultFocusGroupIdentifier
{
  double v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x20) != 0)
  {
    objc_super v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarButton;
    objc_super v5 = [(UIControl *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (BOOL)canBecomeFocused
{
  BOOL v3 = [(UIControl *)self isEnabled];
  if (v3)
  {
    char v4 = [(UIView *)self _focusBehavior];
    char v5 = [v4 tabBarButtonCanBecomeFocused];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 1;
}

- (void)_sendFocusAction:(id)a3
{
  id v5 = a3;
  char v4 = [(UITabBarButton *)self _tabBar];
  [v4 _setPendingFocusAction:0];

  if (-[UIView isFocused](self, "isFocused") || [v5 BOOLValue]) {
    [(UIControl *)self sendActionsForControlEvents:0x2000];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UITabBarButton;
  id v6 = a3;
  [(UIView *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  objc_msgSend(v6, "nextFocusedView", v11.receiver, v11.super_class);
  objc_super v7 = (UITabBarButton *)objc_claimAutoreleasedReturnValue();

  BOOL v8 = [(UIView *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 3)
  {
    BOOL v10 = v7 == self || [(UITabBarButton *)self canBecomeFocused];
    [(UITabBarButton *)self _setShowsHighlightedState:v10];
    [(UITabBarButton *)self setHighlighted:v7 == self];
  }
  [(UITabBarButtonLabel *)self->_label updateTextColorsForState];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  if ([v4 focusHeading] == 2 || objc_msgSend(v4, "focusHeading") == 1)
  {
    id v5 = [(UITabBarButton *)self _tabBar];
    LODWORD(self) = [v5 _pendingFocusAction] ^ 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarButton;
    LOBYTE(self) = [(UIView *)&v7 shouldUpdateFocusInContext:v4];
  }

  return (char)self;
}

- (id)_tabBar
{
  uint64_t v2 = self;
  while (1)
  {
    BOOL v3 = v2;
    uint64_t v2 = [(UIView *)v2 superview];

    if (!v2) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v2;
      break;
    }
  }

  return v2;
}

- (CGRect)_responderSelectionRectForWindow:(id)a3
{
  id v4 = a3;
  [(UITabBarButton *)self _responderSelectionRect];
  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_responderSelectionRect
{
  [(UIView *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  if (![(UITabBarButton *)self isDefaultTVLayout])
  {
    v17.origin.CGFloat x = v4;
    v17.origin.CGFloat y = v6;
    v17.size.double width = v8;
    v17.size.double height = v10;
    double MaxY = CGRectGetMaxY(v17);
    [(UIView *)self frame];
    double v6 = v6 - v12;
    v18.origin.CGFloat x = v4;
    v18.origin.CGFloat y = v6;
    v18.size.double width = v8;
    v18.size.double height = v10;
    double v10 = v10 + MaxY - CGRectGetMaxY(v18);
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (int64_t)_focusTouchSensitivityStyle
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = self;
  double v9 = [v7 _lastPreparedPress];
  if ([v9 type] != 4)
  {

    goto LABEL_5;
  }
  BOOL v10 = [(UIControl *)v8 isEnabled];

  if (!v10)
  {
LABEL_5:
    v11.receiver = v8;
    v11.super_class = (Class)UITabBarButton;
    [(UIResponder *)&v11 pressesBegan:v6 withEvent:v7];
    goto LABEL_6;
  }
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:v8 selector:sel__sendFocusAction object:0];
  [(UITabBarButton *)v8 _sendFocusAction:MEMORY[0x1E4F1CC28]];
LABEL_6:
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = self;
  double v9 = [v7 _lastPreparedPress];
  if ([v9 type] == 4)
  {
    BOOL v10 = [(UIControl *)v8 isEnabled];

    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v11.receiver = v8;
  v11.super_class = (Class)UITabBarButton;
  [(UIResponder *)&v11 pressesChanged:v6 withEvent:v7];
LABEL_6:
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = self;
  double v9 = [v7 _lastPreparedPress];
  if ([v9 type] == 4)
  {
    BOOL v10 = [(UIControl *)v8 isEnabled];

    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v11.receiver = v8;
  v11.super_class = (Class)UITabBarButton;
  [(UIResponder *)&v11 pressesEnded:v6 withEvent:v7];
LABEL_6:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = self;
  double v9 = [v7 _lastPreparedPress];
  if ([v9 type] == 4)
  {
    BOOL v10 = [(UIControl *)v8 isEnabled];

    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v11.receiver = v8;
  v11.super_class = (Class)UITabBarButton;
  [(UIResponder *)&v11 pressesCancelled:v6 withEvent:v7];
LABEL_6:
}

- (double)defaultAlphaForState:(int64_t)a3
{
  return 1.0;
}

- (int64_t)defaultCompositingModeForState:(int64_t)a3
{
  return 0;
}

- (BOOL)isDefaultColor:(id)a3 forState:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UITabBarButton *)self defaultColorForState:a4];
  id v8 = v6;
  id v9 = v7;
  BOOL v10 = v9;
  if (v9 == v8)
  {
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
    if (v8 && v9) {
      char v11 = [v8 isEqual:v9];
    }
  }

  return v11;
}

- (void)_UIAppearance_setBadgeColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_badgeColor != v5) {
    objc_storeStrong((id *)&self->_badgeColor, a3);
  }
  [(UITabBarButton *)self _updateBadgeAppearanceAndLayoutNow:0];
}

- (void)_UIAppearance_setBadgeTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v13 = a3;
  id v6 = [NSNumber numberWithUnsignedInteger:a4];
  if (v13
    || ([(NSMutableDictionary *)self->_badgeTextAttributesForState objectForKeyedSubscript:v6], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    badgeTextAttributesForState = self->_badgeTextAttributesForState;
    if (!badgeTextAttributesForState)
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      BOOL v10 = self->_badgeTextAttributesForState;
      self->_badgeTextAttributesForState = v9;

      badgeTextAttributesForState = self->_badgeTextAttributesForState;
    }
    id v11 = [(NSMutableDictionary *)badgeTextAttributesForState objectForKeyedSubscript:v6];
    if (v11 != v13 && ([v13 isEqual:v11] & 1) == 0)
    {
      double v12 = (void *)[v13 copy];
      [(NSMutableDictionary *)self->_badgeTextAttributesForState setObject:v12 forKeyedSubscript:v6];
    }
    [(UITabBarButton *)self _updateBadgeAppearanceAndLayoutNow:1];
  }
}

- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3
{
  if (self->_labelOffset.horizontal != a3.horizontal || self->_labelOffset.vertical != a3.vertical)
  {
    self->_labelOffset = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (UIOffset)_titlePositionAdjustment
{
  double horizontal = self->_labelOffset.horizontal;
  double vertical = self->_labelOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

uint64_t __74__UITabBarButton__applyTabBarButtonAppearanceStorage_withTaggedSelectors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _setBadgeTextAttributes:a3 forState:a2];
}

- (void)_setButtonTintColor:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  buttonTintColorsForState = self->_buttonTintColorsForState;
  id v15 = v6;
  if (v6)
  {
    if (!buttonTintColorsForState)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = self->_buttonTintColorsForState;
      self->_buttonTintColorsForState = v8;

      buttonTintColorsForState = self->_buttonTintColorsForState;
    }
  }
  else if (!buttonTintColorsForState)
  {
    goto LABEL_10;
  }
  BOOL v10 = [NSNumber numberWithUnsignedInteger:a4];
  id v11 = [(NSMutableDictionary *)buttonTintColorsForState objectForKey:v10];
  char v12 = [v15 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    id v13 = self->_buttonTintColorsForState;
    double v14 = [NSNumber numberWithUnsignedInteger:a4];
    if (v15) {
      [(NSMutableDictionary *)v13 setObject:v15 forKey:v14];
    }
    else {
      [(NSMutableDictionary *)v13 removeObjectForKey:v14];
    }

    [(UITabBarButton *)self _updateToMatchCurrentState];
  }
LABEL_10:
}

- (id)_info
{
  return 0;
}

- (void)set_info:(id)a3
{
}

- (UIVibrancyEffect)itemVibrantEffect
{
  return self->_itemVibrantEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carplayConstraints, 0);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_itemVibrantEffect, 0);
  objc_storeStrong((id *)&self->_itemAppearanceData, 0);
  objc_storeStrong((id *)&self->_appearanceGuideClass, 0);
  objc_storeStrong((id *)&self->_focusView, 0);
  objc_storeStrong((id *)&self->_highContrastFocusIndicator, 0);
  objc_storeStrong((id *)&self->_badgeTextAttributesForState, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_defaultUnselectedLabelTintColor, 0);
  objc_storeStrong((id *)&self->_contentTintColorsForState, 0);
  objc_storeStrong((id *)&self->_buttonTintColorsForState, 0);
  objc_storeStrong((id *)&self->_customSelectedIndicatorImage, 0);
  objc_storeStrong((id *)&self->_selectedIndicator, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

void __49__UITabBarButton_SpringLoading__setSpringLoaded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 view];
  [v2 sendActionsForControlEvents:64];
}

@end