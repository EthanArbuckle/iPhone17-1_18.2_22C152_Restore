@interface _UIButtonBarButtonVisualProviderIOS
- (BOOL)backButtonMaskEnabled;
- (BOOL)buttonSelectionState:(id)a3 forRequestedState:(BOOL)a4;
- (BOOL)canUpdateMenuInPlace;
- (BOOL)shouldLift;
- (BOOL)supportsBackButtons;
- (CGPoint)menuAnchorPoint;
- (CGSize)buttonImageViewSize:(id)a3;
- (Class)buttonControlClass;
- (UIEdgeInsets)_imageInsetsForBarButtonItem:(id)a3 compact:(BOOL)a4 isBackButton:(BOOL)a5;
- (UIEdgeInsets)_insetsForCompact:(BOOL)a3;
- (UIOffset)backButtonBackgroundVerticalAdjustmentForCompact:(BOOL)a3;
- (UIOffset)backButtonTitlePositionOffsetForCompact:(BOOL)a3;
- (UIOffset)backgroundVerticalAdjustmentForCompact:(BOOL)a3;
- (UIOffset)titlePositionOffsetForCompact:(BOOL)a3;
- (double)_defaultBackIndicatorBaselineInsetCompact:(BOOL)a3;
- (double)_defaultPaddingForInsets:(UIEdgeInsets)a3;
- (id)_backIndicatorImageForCompact:(BOOL)a3;
- (id)_backIndicatorMaskForCompact:(BOOL)a3;
- (id)_backIndicatorMaskSymbolConfigurationForCompact:(BOOL)a3;
- (id)_backIndicatorSymbolConfigurationForCompact:(BOOL)a3;
- (id)_titleContentForTitle:(id)a3;
- (id)alignmentViewForStaticNavBarButtonLeading;
- (id)alignmentViewForStaticNavBarButtonTrailing;
- (id)backButtonBackgroundImageForState:(unint64_t)a3 compact:(BOOL)a4;
- (id)backIndicatorView;
- (id)backgroundImageForState:(unint64_t)a3 compact:(BOOL)a4;
- (id)backgroundImageView;
- (id)buttonContextMenuInteractionConfiguration;
- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3;
- (id)buttonContextMenuTargetedPreview;
- (id)buttonSpringLoadedInteractionEffect;
- (id)contentView;
- (id)imageButton;
- (id)matchingPointerShapeForView:(id)a3 rect:(CGRect)a4 inContainer:(id)a5;
- (id)pointerPreviewParameters;
- (id)pointerShapeInContainer:(id)a3;
- (id)symbolConfigurationCompact:(BOOL)a3;
- (id)symbolImageView;
- (id)textButton;
- (id)tintColor;
- (void)_addConstraintsForBackgroundViewWithOffset:(double)a3 isBackButton:(BOOL)a4 resizesImage:(BOOL)a5;
- (void)_addHorizontalConstraintsForContentButton:(id)a3 titleOffset:(double)a4 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a5;
- (void)_addHorizontalConstraintsForImageWithInsets:(UIEdgeInsets)a3 paddingEdges:(unint64_t)a4 additionalPadding:(double)a5;
- (void)_addHorizontalConstraintsForTextWithOffset:(double)a3 additionalPadding:(UIEdgeInsets)a4;
- (void)_addVerticalConstraintsForBackIndicatorWithTitleOffset:(double)a3 bottomOffset:(double)a4 useBaselineAlignment:(BOOL)a5;
- (void)_addVerticalConstraintsForImageWithInsets:(UIEdgeInsets)a3;
- (void)_addVerticalConstraintsForTextWithOffset:(double)a3;
- (void)_computeTextAttributes;
- (void)_computeTextAttributesForBarButtonItem:(id)a3;
- (void)_configureBackButtonMask;
- (void)_configureBackButtonWithBackButtonLayoutInsets:(NSDirectionalEdgeInsets)a3 useBaselineAlignment:(BOOL)a4;
- (void)_configureImageBackButtonWithImageInsets:(UIEdgeInsets)a3 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a4 useBaselineAlignment:(BOOL)a5;
- (void)_configureImageOrTitleCompact:(BOOL)a3;
- (void)_configureImageWithInsets:(UIEdgeInsets)a3 paddingEdges:(unint64_t)a4 additionalPadding:(double)a5;
- (void)_configureTextBackButtonWithTitlePositionAdjustment:(UIOffset)a3 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a4 useBaselineAlignment:(BOOL)a5;
- (void)_configureTextWithOffset:(UIOffset)a3 additionalPadding:(UIEdgeInsets)a4;
- (void)_prepareBackgroundViewFromBarButtonItem:(id)a3 isBackButton:(BOOL)a4;
- (void)_removeTitleButton;
- (void)_setTitle:(id)a3;
- (void)_setupAlternateTitles;
- (void)_updateTextContent;
- (void)_updateViewsForMaskingEnabled;
- (void)activateHeightMinimizer;
- (void)activateWidthMinimizer;
- (void)addActiveConstraint:(id)a3 named:(id)a4;
- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4;
- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4;
- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5;
- (void)reload;
- (void)resetButtonHasHighlighted;
- (void)setBackButtonMaskEnabled:(BOOL)a3;
- (void)updateActiveConstraints:(id)a3;
- (void)updateButton:(id)a3 forEnabledState:(BOOL)a4;
- (void)updateButton:(id)a3 forHeldState:(BOOL)a4;
- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4;
- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4;
- (void)updateImage;
- (void)updateMenu;
@end

@implementation _UIButtonBarButtonVisualProviderIOS

- (void)_addHorizontalConstraintsForImageWithInsets:(UIEdgeInsets)a3 paddingEdges:(unint64_t)a4 additionalPadding:(double)a5
{
  double right = a3.right;
  double left = a3.left;
  -[_UIButtonBarButtonVisualProviderIOS _defaultPaddingForInsets:](self, "_defaultPaddingForInsets:", a3.top, a3.left, a3.bottom);
  double v11 = v10;
  UIUserInterfaceLayoutDirection v12 = [(UIView *)self->super._button effectiveUserInterfaceLayoutDirection];
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft) {
    uint64_t v13 = 8;
  }
  else {
    uint64_t v13 = 2;
  }
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 8;
  }
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v15 = right;
  }
  else {
    double v15 = left;
  }
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v16 = left;
  }
  else {
    double v16 = right;
  }
  if ((v13 & a4) != 0)
  {
    double v17 = v11 * 0.5 + a5;
    v18 = [(UIView *)self->_imageButton leadingAnchor];
    v19 = [(UIView *)self->super._button leadingAnchor];
    v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19 constant:v17 + v15];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v20 named:@"IB_Leading_Leading"];

    double v21 = v17 + 0.0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    [WeakRetained defaultEdgeSpacing];
    double v24 = v15 + v23;

    v25 = [(UIView *)self->_imageButton leadingAnchor];
    v26 = [(UIView *)self->super._button leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:v24];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v27 named:@"IB_Leading_Leading"];

    double v17 = 0.0;
    double v21 = 0.0;
  }
  if ((v14 & a4) != 0)
  {
    double v28 = v11 * 0.5 + a5;
    v29 = [(UIView *)self->super._button trailingAnchor];
    v30 = [(UIView *)self->_imageButton trailingAnchor];
    v31 = [v29 constraintGreaterThanOrEqualToAnchor:v30 constant:v28 + v16];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v31 named:@"IB_Trailing_Trailing"];

    double v21 = v28 + v21;
  }
  else
  {
    id v32 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    [v32 defaultEdgeSpacing];
    double v34 = v16 + v33;

    v35 = [(UIView *)self->super._button trailingAnchor];
    v36 = [(UIView *)self->_imageButton trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36 constant:v34];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v37 named:@"IB_Trailing_Trailing"];

    double v28 = 0.0;
  }
  double v38 = left + v17;
  double v39 = right + v28;
  if (left + v17 != 0.0 || v39 == 0.0)
  {
    if (v39 == 0.0 && v38 != 0.0) {
      double left = left + v17;
    }
  }
  else
  {
    double left = -v39;
  }
  v41 = [(UIView *)self->_imageButton centerXAnchor];
  v42 = [(UIView *)self->super._button centerXAnchor];
  id v48 = [v41 constraintEqualToAnchor:v42 constant:left];

  LODWORD(v43) = 1148829696;
  [v48 setPriority:v43];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v48 named:@"IB_CenterX_CenterX"];
  [(_UIButtonBarButtonVisualProviderIOS *)self activateWidthMinimizer];
  v44 = [(UIView *)self->super._button widthAnchor];
  v45 = [(UIView *)self->_imageButton widthAnchor];
  v46 = [v44 constraintEqualToAnchor:v45 constant:v21];

  LODWORD(v47) = 1148829696;
  [v46 setPriority:v47];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v46 named:@"IB_Width"];
}

- (void)addActiveConstraint:(id)a3 named:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  if (![v7 length])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UIButtonBarButtonVisualProviderIOS.m" lineNumber:709 description:@"Activating a constraint requires a non-empty identifier"];
  }
  if (!v17)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIButtonBarButtonVisualProviderIOS.m", 710, @"Cannot activate a nil constraint (%@)", v7 object file lineNumber description];
  }
  p_oldConstraints = &self->_oldConstraints;
  uint64_t v9 = [(NSMutableDictionary *)self->_oldConstraints objectForKeyedSubscript:v7];
  double v10 = (void *)v9;
  double v11 = v17;
  if ((id)v9 == v17)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"_UIButtonBarButtonVisualProviderIOS.m" lineNumber:715 description:@"On non-optimal path for reusing existing constraint – did you mean to call -activate[Width|Height]Minimizer instead?"];

    double v11 = v17;
    if (!v10) {
      goto LABEL_10;
    }
  }
  else if (!v9)
  {
    goto LABEL_10;
  }
  int v12 = [v10 _isEqualToConstraintValue:v17 includingConstant:0 includeOtherMutableProperties:0];
  double v11 = v17;
  if (v12)
  {
    [v17 constant];
    objc_msgSend(v10, "setConstant:");
    [(NSMutableDictionary *)self->_currentConstraints setObject:v10 forKeyedSubscript:v7];
    id v13 = 0;
    goto LABEL_11;
  }
LABEL_10:
  [v11 setIdentifier:v7];
  p_oldConstraints = &self->_currentConstraints;
  id v13 = v17;
LABEL_11:
  [(NSMutableDictionary *)*p_oldConstraints setObject:v13 forKeyedSubscript:v7];
}

- (void)activateWidthMinimizer
{
  id v3 = [(_UIButtonBarButton *)self->super._button widthMinimizingConstraint];
  [(NSMutableDictionary *)self->_currentConstraints setObject:v3 forKeyedSubscript:@"minimizeWidth"];
  [(NSMutableDictionary *)self->_oldConstraints setObject:0 forKeyedSubscript:@"minimizeWidth"];
}

- (double)_defaultPaddingForInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double left = a3.left;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  uint64_t v6 = [WeakRetained barType];

  double v7 = 10.0;
  if (v6 == 1) {
    double v7 = 22.0;
  }
  return v7 - left - right;
}

- (void)_addVerticalConstraintsForTextWithOffset:(double)a3
{
  if (!self->_titleButton)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_UIButtonBarButtonVisualProviderIOS.m" lineNumber:1323 description:@"Invalid text button configuration"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  int v6 = [WeakRetained centerTextButtons];

  titleButton = self->_titleButton;
  if (v6)
  {
    v8 = [(UIView *)titleButton centerYAnchor];
    uint64_t v9 = [(UIView *)self->super._button centerYAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v10 named:@"TB_CenterY_CenterY"];
  }
  else
  {
    v8 = [(UIView *)titleButton lastBaselineAnchor];
    uint64_t v9 = [(UIView *)self->super._button layoutMarginsGuide];
    double v10 = [v9 bottomAnchor];
    double v11 = [v8 constraintEqualToAnchor:v10 constant:a3];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v11 named:@"TB_Baseline_Baseline"];
  }
  int v12 = [(UIView *)self->_titleButton topAnchor];
  id v13 = [(UIView *)self->super._button topAnchor];
  uint64_t v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v14 named:@"TB_Top_Top"];

  id v19 = [(UIView *)self->super._button bottomAnchor];
  double v15 = [(UIView *)self->_titleButton bottomAnchor];
  double v16 = [v19 constraintGreaterThanOrEqualToAnchor:v15];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v16 named:@"TB_Bottom_Bottom"];
}

- (void)_addVerticalConstraintsForImageWithInsets:(UIEdgeInsets)a3
{
  double bottom = a3.bottom;
  double top = a3.top;
  if (!self->_imageButton)
  {
    double v28 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.top, a3.left, a3.bottom, a3.right);
    [v28 handleFailureInMethod:a2 object:self file:@"_UIButtonBarButtonVisualProviderIOS.m" lineNumber:1337 description:@"Invalid image button configuration"];
  }
  if (*(unsigned char *)&self->_flags)
  {
    v18 = [(UIView *)self->_imageButton lastBaselineAnchor];
    id v19 = [(UIView *)self->super._button layoutMarginsGuide];
    v20 = [v19 bottomAnchor];
    double v21 = [v18 constraintEqualToAnchor:v20];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v21 named:@"IB_Baseline_Baseline"];

    v22 = [(UIView *)self->_imageButton topAnchor];
    double v23 = [(UIView *)self->super._button topAnchor];
    double v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v24 named:@"IB_Top_Top"];

    id v29 = [(UIView *)self->super._button bottomAnchor];
    v25 = [(UIView *)self->_imageButton bottomAnchor];
    v26 = [v29 constraintGreaterThanOrEqualToAnchor:v25];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v26 named:@"IB_Bottom_Bottom"];
  }
  else
  {
    BOOL v6 = bottom != 0.0 && top == 0.0;
    double v7 = -bottom;
    if (v6) {
      double v8 = v7;
    }
    else {
      double v8 = top;
    }
    uint64_t v9 = [(UIView *)self->_imageButton centerYAnchor];
    double v10 = [(UIView *)self->super._button centerYAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10 constant:v8];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v11 named:@"IB_CenterY_CenterY"];

    int v12 = [(UIView *)self->_imageButton topAnchor];
    id v13 = [(UIView *)self->super._button topAnchor];
    uint64_t v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13 constant:top];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v14 named:@"IB_Top_Top"];

    double v15 = [(UIView *)self->super._button bottomAnchor];
    double v16 = [(UIView *)self->_imageButton bottomAnchor];
    id v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16 constant:v7];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v17 named:@"IB_Bottom_Bottom"];

    [(_UIButtonBarButtonVisualProviderIOS *)self activateHeightMinimizer];
  }
}

- (id)alignmentViewForStaticNavBarButtonLeading
{
  backIndicatorButton = (_UIModernBarButton *)self->_backIndicatorButton;
  if (!backIndicatorButton)
  {
    backIndicatorButton = self->_imageButton;
    if (!backIndicatorButton) {
      backIndicatorButton = self->_titleButton;
    }
  }
  return backIndicatorButton;
}

- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isSpringLoaded]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = [v6 isBackButton];
  }
  [v6 setSpringLoaded:v8];
  [(_UIButtonBarButtonVisualProviderIOS *)self updateMenu];
  int v9 = [v7 isSystemItem];
  if (v9) {
    char v10 = 32;
  }
  else {
    char v10 = 0;
  }
  char flags = *(unsigned char *)&self->_flags & 0xDF | v10;
  *(unsigned char *)&self->_char flags = flags;
  if (v9)
  {
    self->_systemItem = [v7 systemItem];
    char flags = (char)self->_flags;
  }
  *(unsigned char *)&self->_char flags = flags & 0xFD;
  [(_UIButtonBarButtonVisualProviderIOS *)self _computeTextAttributesForBarButtonItem:v7];
  int v12 = [(_UIButtonBarButtonVisualProviderIOS *)self tintColor];
  [v6 setTintColor:v12];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  uint64_t v14 = [WeakRetained compactMetrics];

  [(_UIButtonBarButtonVisualProviderIOS *)self _configureImageOrTitleCompact:v14];
  if ([v6 isBackButton])
  {
    [v6 effectiveUserInterfaceLayoutDirection];
  }
  else
  {
    int v15 = [v7 _showsChevron];
    [v6 effectiveUserInterfaceLayoutDirection];
    if (!v15)
    {
      [(UIView *)self->_backIndicatorButton removeFromSuperview];
      backIndicatorButton = self->_backIndicatorButton;
      self->_backIndicatorButton = 0;

      [(UIView *)self->_backButtonMask removeFromSuperview];
      uint64_t v26 = 0;
      v18 = 0;
      backButtonMask = self->_backButtonMask;
      self->_backButtonMask = 0;
      goto LABEL_18;
    }
  }
  if (!self->_backIndicatorButton)
  {
    _newButton(self);
    double v16 = (UIButton *)objc_claimAutoreleasedReturnValue();
    id v17 = self->_backIndicatorButton;
    self->_backIndicatorButton = v16;
  }
  v18 = [(_UIButtonBarButtonVisualProviderIOS *)self _backIndicatorImageForCompact:v14];
  [(UIButton *)self->_backIndicatorButton setImage:v18 forState:0];
  backButtonMask = [(_UIButtonBarButtonVisualProviderIOS *)self _backIndicatorSymbolConfigurationForCompact:v14];
  [(UIButton *)self->_backIndicatorButton setPreferredSymbolConfiguration:backButtonMask forImageInState:0];
  [(UIButton *)self->_backIndicatorButton setTintColor:0];
  if (!self->_backButtonMask)
  {
    v20 = objc_alloc_init(_UIBackButtonMaskView);
    double v21 = self->_backButtonMask;
    self->_backButtonMask = v20;

    [(UIView *)self->_backButtonMask setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  v22 = [(_UIButtonBarButtonVisualProviderIOS *)self _backIndicatorMaskForCompact:v14];
  double v23 = [(_UIBackButtonMaskView *)self->_backButtonMask maskImageView];
  [v23 setImage:v22];

  double v24 = [(_UIButtonBarButtonVisualProviderIOS *)self _backIndicatorMaskSymbolConfigurationForCompact:v14];
  v25 = [(_UIBackButtonMaskView *)self->_backButtonMask maskImageView];
  [v25 setPreferredSymbolConfiguration:v24];

  uint64_t v26 = 1;
LABEL_18:

  [(_UIButtonBarButtonVisualProviderIOS *)self _prepareBackgroundViewFromBarButtonItem:v7 isBackButton:v26];
  [(_UIButtonBarButtonVisualProviderIOS *)self _updateViewsForMaskingEnabled];
  [(_UIButtonBarButtonVisualProviderIOS *)self _insetsForCompact:v14];
  objc_msgSend(v6, "setLayoutMargins:");
  id v28 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  uint64_t v29 = [v28 edgesPaddingBarButtonItem:v7];

  id v30 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  [v30 absorptionForItem:v7];
  uint64_t v32 = v31;

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __73___UIButtonBarButtonVisualProviderIOS_configureButton_fromBarButtonItem___block_invoke;
  v53[3] = &unk_1E52DDB38;
  char v60 = v26;
  id v33 = v18;
  id v54 = v33;
  v55 = self;
  char v61 = v14;
  id v34 = v7;
  id v56 = v34;
  uint64_t v57 = v29;
  uint64_t v58 = v32;
  uint64_t v59 = v14;
  [(_UIButtonBarButtonVisualProviderIOS *)self updateActiveConstraints:v53];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v35 = [v34 _gestureRecognizers];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(v35);
        }
        [v6 addGestureRecognizer:*(void *)(*((void *)&v49 + 1) + 8 * i)];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v63 count:16];
    }
    while (v37);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v40 = [v34 _interactions];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v45 objects:v62 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v46 != v43) {
          objc_enumerationMutation(v40);
        }
        [v6 addInteraction:*(void *)(*((void *)&v45 + 1) + 8 * j)];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v45 objects:v62 count:16];
    }
    while (v42);
  }
}

- (void)updateMenu
{
  p_barButtonItem = &self->super._barButtonItem;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  v5 = [WeakRetained menu];

  if ([(_UIButtonBarButton *)self->super._button isBackButton])
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_barButtonItem);
    uint64_t v6 = [v7 _menuIsPrimary];
  }
  id v8 = objc_loadWeakRetained((id *)p_barButtonItem);
  int v9 = [v8 _secondaryActionsProvider];

  id v10 = objc_loadWeakRetained((id *)p_barButtonItem);
  double v11 = [v10 _owningButtonGroup];

  if (v9)
  {
    objc_copyWeak(&to, (id *)p_barButtonItem);
    if (v6)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke;
      v32[3] = &unk_1E52DDB88;
      int v12 = &v33;
      id v33 = v9;
      id v13 = &v34;
      objc_copyWeak(&v34, &to);
      uint64_t v14 = v32;
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_2;
      v29[3] = &unk_1E52DDB88;
      int v12 = &v30;
      id v30 = v9;
      id v13 = &v31;
      objc_copyWeak(&v31, &to);
      uint64_t v14 = v29;
    }
    v18 = _Block_copy(v14);
    id menuProvider = self->_menuProvider;
    self->_id menuProvider = v18;

    objc_destroyWeak(v13);
    objc_destroyWeak(&to);
  }
  else
  {
    if (v5)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_3;
      aBlock[3] = &unk_1E52DD380;
      id v28 = v5;
      int v15 = _Block_copy(aBlock);
      id v16 = self->_menuProvider;
      self->_id menuProvider = v15;

      id v17 = v28;
    }
    else
    {
      if (v11)
      {
        id v20 = objc_loadWeakRetained((id *)p_barButtonItem);
        char v21 = [v20 _hasAction];

        if ((v21 & 1) == 0)
        {
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __49___UIButtonBarButtonVisualProviderIOS_updateMenu__block_invoke_4;
          v25[3] = &unk_1E52DD380;
          id v26 = v11;
          double v23 = _Block_copy(v25);
          id v24 = self->_menuProvider;
          self->_id menuProvider = v23;

          uint64_t v6 = 1;
          goto LABEL_15;
        }
      }
      id v17 = self->_menuProvider;
      self->_id menuProvider = 0;
    }
  }
LABEL_15:
  id v22 = objc_loadWeakRetained((id *)p_barButtonItem);
  -[_UIButtonBarButton setPreferredMenuElementOrder:](self->super._button, "setPreferredMenuElementOrder:", [v22 preferredMenuElementOrder]);

  [(UIControl *)self->super._button setContextMenuInteractionEnabled:self->_menuProvider != 0];
  [(UIControl *)self->super._button setShowsMenuAsPrimaryAction:v6];
}

- (void)updateActiveConstraints:(id)a3
{
  id v13 = (void (**)(void))a3;
  p_oldConstraints = &self->_oldConstraints;
  oldConstraints = self->_oldConstraints;
  if (oldConstraints)
  {
    uint64_t v6 = oldConstraints;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v7 = v6;
  p_currentConstraints = &self->_currentConstraints;
  objc_storeStrong((id *)p_oldConstraints, *p_currentConstraints);
  objc_storeStrong((id *)p_currentConstraints, v7);
  v13[2]();
  if ([(NSMutableDictionary *)*p_oldConstraints count])
  {
    int v9 = (void *)MEMORY[0x1E4F5B268];
    id v10 = [(NSMutableDictionary *)*p_oldConstraints allValues];
    [v9 deactivateConstraints:v10];

    [(NSMutableDictionary *)*p_oldConstraints removeAllObjects];
  }
  if ([(NSMutableDictionary *)*p_currentConstraints count])
  {
    double v11 = (void *)MEMORY[0x1E4F5B268];
    int v12 = [(NSMutableDictionary *)*p_currentConstraints allValues];
    [v11 activateConstraints:v12];
  }
}

- (void)_updateViewsForMaskingEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    backgroundView = 0;
  }
  else {
    backgroundView = self->_backgroundView;
  }
  int v9 = backgroundView;
  titleButton = self->_titleButton;
  if (!titleButton) {
    titleButton = self->_imageButton;
  }
  backButtonMask = self->_backButtonMask;
  id v10 = titleButton;
  double v11 = backButtonMask;
  backIndicatorButton = self->_backIndicatorButton;
  if ((flags & 2) != 0) {
    id v7 = self->_backgroundView;
  }
  else {
    id v7 = 0;
  }
  id v13 = v7;
  [(UIView *)self->super._button _ensureViewsAreInstalledInRelativeOrder:&v9 viewCount:5 insertionStartIndex:0];
  -[UIView setHidden:](self->_backButtonMask, "setHidden:", (*(unsigned char *)&self->_flags & 2) == 0, v9, v10, v11, backIndicatorButton);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v8 = 18;
  }
  else {
    uint64_t v8 = 0;
  }
  [(UIView *)self->_backgroundView setCompositingMode:v8];
}

- (void)_prepareBackgroundViewFromBarButtonItem:(id)a3 isBackButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  unsigned int v7 = [WeakRetained compactMetrics];

  uint64_t v8 = v7;
  if (!self->_backgroundImages)
  {
    int v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backgroundImages = self->_backgroundImages;
    self->_backgroundImages = v9;
  }
  uint64_t v11 = 0;
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  do
  {
    uint64_t v14 = qword_186B93588[v11];
    if (v4)
    {
      int v15 = [v27 backButtonBackgroundImageForState:qword_186B93588[v11] barMetrics:v8];
      if (!v15)
      {
        uint64_t v16 = [(_UIButtonBarButtonVisualProviderIOS *)self backButtonBackgroundImageForState:v14 compact:v8];
LABEL_9:
        int v15 = (void *)v16;
        if (!v16)
        {
          int v15 = [v27 _backgroundImageForState:v14 compact:v8 type:0];
          if (!v15) {
            goto LABEL_16;
          }
        }
      }
    }
    else
    {
      int v15 = [v27 backgroundImageForState:qword_186B93588[v11] style:((unint64_t)*(unsigned char *)&self->_flags >> 2) & 7 barMetrics:v8];
      if (!v15)
      {
        uint64_t v16 = [(_UIButtonBarButtonVisualProviderIOS *)self backgroundImageForState:v14 compact:v8];
        goto LABEL_9;
      }
    }
    [v15 size];
    if (v18 != v12 || v17 != v13)
    {
      id v20 = self->_backgroundImages;
      char v21 = [NSNumber numberWithUnsignedInteger:v14];
      [(NSMutableDictionary *)v20 setObject:v15 forKey:v21];
    }
LABEL_16:

    ++v11;
  }
  while (v11 != 3);
  id v22 = [(NSMutableDictionary *)self->_backgroundImages objectForKeyedSubscript:&unk_1ED3F3348];

  backgroundView = self->_backgroundView;
  if (v22)
  {
    if (!backgroundView)
    {
      id v24 = objc_alloc_init(UIImageView);
      [(UIImageView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)v24 setContentMode:0];
      [(UIView *)self->super._button insertSubview:v24 atIndex:0];
      v25 = self->_backgroundView;
      self->_backgroundView = v24;
    }
    id v26 = [(NSMutableDictionary *)self->_backgroundImages objectForKeyedSubscript:&unk_1ED3F3348];
    [(UIImageView *)self->_backgroundView setImage:v26];
LABEL_23:
  }
  else if (backgroundView)
  {
    [(UIView *)backgroundView removeFromSuperview];
    id v26 = self->_backgroundView;
    self->_backgroundView = 0;
    goto LABEL_23;
  }
}

- (id)backgroundImageForState:(unint64_t)a3 compact:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [(_UIButtonBarButton *)self->super._button appearanceData];
  uint64_t v8 = v7;
  if (v7)
  {
    if (a3) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = a3 & 2;
    }
    id v10 = [v7 backgroundImageForState:v9];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    double v12 = [WeakRetained appearanceStorage];
    id v10 = [v12 backgroundImageForState:a3 style:((unint64_t)*(unsigned char *)&self->_flags >> 2) & 7 isMini:v4];
  }
  return v10;
}

- (UIEdgeInsets)_insetsForCompact:(BOOL)a3
{
  double v3 = 16.0;
  if (a3) {
    double v3 = 11.0;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.double right = v5;
  result.double bottom = v6;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (void)_computeTextAttributesForBarButtonItem:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xE3 | (4 * ([v4 style] & 7));
  double v5 = [v4 tintColor];
  tintColor = self->_tintColor;
  self->_tintColor = v5;

  uint64_t v7 = [v4 titleTextAttributesForState:0];
  uint64_t v8 = (void *)v7;
  unint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  if (v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CC08];
  }
  uint64_t v11 = objc_msgSend(v4, "titleTextAttributesForState:", 1, v10);
  double v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = (uint64_t)v9;
  }
  v18[1] = v13;
  uint64_t v14 = [v4 titleTextAttributesForState:2];

  if (v14) {
    int v15 = v14;
  }
  else {
    int v15 = v9;
  }
  v18[2] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  barButtonTitleAttributes = self->_barButtonTitleAttributes;
  self->_barButtonTitleAttributes = v16;

  [(_UIButtonBarButtonVisualProviderIOS *)self _computeTextAttributes];
}

- (void)_computeTextAttributes
{
  v36[3] = *MEMORY[0x1E4F143B8];
  double v3 = [(_UIButtonBarButton *)self->super._button appearanceData];
  if (v3)
  {
    id v4 = v3;
    double v5 = [v3 titleTextAttributesForState:0];
    double v6 = [v4 titleTextAttributesForState:1];
    id v33 = v4;
    uint64_t v7 = [v4 titleTextAttributesForState:2];
  }
  else
  {
    uint64_t v8 = +[_UIBarButtonItemData standardItemDataForStyle:((unint64_t)*(unsigned char *)&self->_flags >> 2) & 7];
    unint64_t v9 = [v8 titleTextAttributesForState:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    uint64_t v11 = [WeakRetained appearanceStorage];
    double v12 = [v11 textAttributesForState:0];
    double v5 = _finalAttributesFromSources(v9, v12, 0, 0);

    uint64_t v13 = [v8 titleTextAttributesForState:1];
    id v14 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    int v15 = [v14 appearanceStorage];
    uint64_t v16 = [v15 textAttributesForState:1];
    double v6 = _finalAttributesFromSources(v13, v16, 0, 0);

    id v33 = v8;
    double v17 = [v8 titleTextAttributesForState:2];
    id v18 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    id v19 = [v18 appearanceStorage];
    id v20 = [v19 textAttributesForState:2];
    uint64_t v7 = _finalAttributesFromSources(v17, v20, 0, 0);
  }
  char v21 = [(_UIButtonBarButtonVisualProviderIOS *)self tintColor];
  id v22 = [(UIView *)self->super._button traitCollection];
  double v23 = [(NSArray *)self->_barButtonTitleAttributes objectAtIndexedSubscript:0];
  v35 = v5;
  id v24 = _finalAttributesFromSources(v5, v23, v21, v22);

  v25 = [(NSArray *)self->_barButtonTitleAttributes objectAtIndexedSubscript:1];
  id v34 = v6;
  id v26 = _finalAttributesFromSources(v6, v25, v21, v22);

  id v27 = [(NSArray *)self->_barButtonTitleAttributes objectAtIndexedSubscript:2];
  id v28 = +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v21);
  uint64_t v29 = _finalAttributesFromSources(v7, v27, v28, v22);

  v36[0] = v24;
  v36[1] = v26;
  v36[2] = v29;
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  finalTitleAttributes = self->_finalTitleAttributes;
  if (finalTitleAttributes && ![(NSArray *)finalTitleAttributes isEqualToArray:v30]) {
    [(NSMutableDictionary *)self->_titleLookup removeAllObjects];
  }
  uint64_t v32 = self->_finalTitleAttributes;
  self->_finalTitleAttributes = v30;
}

- (id)tintColor
{
  double v3 = self->_tintColor;
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    double v5 = [WeakRetained appearanceStorage];
    double v3 = [v5 tintColor];

    if (!v3)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      double v3 = [v6 tintColor];

      if (!v3)
      {
        double v3 = [(UIView *)self->super._button tintColor];
      }
    }
  }
  return v3;
}

- (void)updateButton:(id)a3 forEnabledState:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIButton *)self->_backIndicatorButton setEnabled:a4];
  [(UIButton *)self->_titleButton setEnabled:v4];
  [(UIButton *)self->_imageButton setEnabled:v4];
  if (v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 2;
  }
  backgroundImages = self->_backgroundImages;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
  unint64_t v9 = [(NSMutableDictionary *)backgroundImages objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = self->_backgroundImages;
    id v12 = [NSNumber numberWithUnsignedInteger:v6];
    uint64_t v11 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v12];
    [(UIImageView *)self->_backgroundView setImage:v11];
  }
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  p_appearanceDelegate = &self->_appearanceDelegate;
  id v9 = a5;
  id v10 = a3;
  objc_storeWeak((id *)p_appearanceDelegate, a4);
  [(_UIButtonBarButtonVisualProviderIOS *)self configureButton:v10 fromBarButtonItem:v9];
}

- (void)updateButton:(id)a3 forSelectedState:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIButton *)self->_titleButton setSelected:a4];
  [(UIButton *)self->_imageButton setSelected:v4];
  if (v4) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  backgroundImages = self->_backgroundImages;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
  id v9 = [(NSMutableDictionary *)backgroundImages objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = self->_backgroundImages;
    id v12 = [NSNumber numberWithUnsignedInteger:v6];
    uint64_t v11 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v12];
    [(UIImageView *)self->_backgroundView setImage:v11];
  }
}

- (BOOL)buttonSelectionState:(id)a3 forRequestedState:(BOOL)a4
{
  if (!a4) {
    return 0;
  }
  if ([a3 isBackButton]) {
    return 0;
  }
  if (self->_titleButton) {
    return 1;
  }
  return self->_imageButton != 0;
}

- (id)symbolImageView
{
  imageButton = self->_imageButton;
  if (imageButton)
  {
    imageButton = [imageButton _imageView];
  }
  return imageButton;
}

- (id)backButtonBackgroundImageForState:(unint64_t)a3 compact:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(_UIButtonBarButton *)self->super._button appearanceData];
  uint64_t v8 = v7;
  if (v7)
  {
    if (a3) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = a3 & 2;
    }
    id v10 = [v7 backgroundImageForState:v9];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    id v12 = [WeakRetained appearanceStorage];
    id v10 = [v12 backButtonBackgroundImageForState:a3 isMini:v4];
  }
  return v10;
}

- (UIOffset)backButtonTitlePositionOffsetForCompact:(BOOL)a3
{
  double v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 titlePositionAdjustmentForState:0];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    id v12 = [WeakRetained appearanceStorage];

    if (a3) {
      [v12 miniBackButtonTitlePositionOffset];
    }
    else {
    uint64_t v13 = [v12 backButtonTitlePositionOffset];
    }
    id v14 = v13;
    if (v13)
    {
      [v13 UIOffsetValue];
      double v8 = v15;
      double v10 = v16;
    }
    else
    {
      double v8 = 0.0;
      double v10 = 0.0;
    }
  }
  double v17 = v8;
  double v18 = v10;
  result.vertical = v18;
  result.horizontal = v17;
  return result;
}

- (UIOffset)titlePositionOffsetForCompact:(BOOL)a3
{
  double v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 titlePositionAdjustmentForState:0];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    id v12 = [WeakRetained appearanceStorage];

    if (a3) {
      [v12 miniTitlePositionOffset];
    }
    else {
    uint64_t v13 = [v12 titlePositionOffset];
    }
    id v14 = v13;
    if (v13)
    {
      [v13 UIOffsetValue];
      double v8 = v15;
      double v10 = v16;
    }
    else
    {
      double v8 = 0.0;
      double v10 = 0.0;
    }
  }
  double v17 = v8;
  double v18 = v10;
  result.vertical = v18;
  result.horizontal = v17;
  return result;
}

- (void)_configureImageOrTitleCompact:(BOOL)a3
{
  BOOL v3 = a3;
  v56[2] = *MEMORY[0x1E4F143B8];
  if (![(_UIButtonBarButton *)self->super._button isBreadcrumb])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    double v7 = [WeakRetained _imageForState:0 compact:v3 type:0];

    if (v7)
    {
      [(_UIButtonBarButtonVisualProviderIOS *)self _removeTitleButton];
      imageButton = self->_imageButton;
      if (imageButton)
      {
        [(UIButton *)imageButton setNeedsLayout];
      }
      else
      {
        _newButton(self);
        uint64_t v13 = (_UIModernBarButton *)objc_claimAutoreleasedReturnValue();
        id v14 = self->_imageButton;
        self->_imageButton = v13;

        id v15 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
        [v15 _additionalSelectionInsets];
        -[_UIModernBarButton _setAdditionalSelectionInsets:](self->_imageButton, "_setAdditionalSelectionInsets:");

        [(_UIModernBarButton *)self->_imageButton _setupForUseAsImageButton];
      }
      id v16 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
      -[UIButton setEnabled:](self->_imageButton, "setEnabled:", [v16 isEnabled]);

      id v11 = v7;
      *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | [v11 hasBaseline];
      double v17 = [(_UIButtonBarButtonVisualProviderIOS *)self symbolConfigurationCompact:v3];
      [(UIButton *)self->_imageButton setImage:v11 forState:0];
      [(UIButton *)self->_imageButton setPreferredSymbolConfiguration:v17 forImageInState:0];
      [(UIButton *)self->_imageButton setImage:v11 forState:2];
      [(_UIModernBarButton *)self->_imageButton _setGuardAgainstDegenerateBaselineCalculation:1];
      id v18 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
      -[UIControl setSymbolAnimationEnabled:](self->_imageButton, "setSymbolAnimationEnabled:", [v18 isSymbolAnimationEnabled]);

      goto LABEL_37;
    }
    [(UIView *)self->_imageButton removeFromSuperview];
    double v9 = self->_imageButton;
    self->_imageButton = 0;

    *(unsigned char *)&self->_flags &= ~1u;
    id v10 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    id v11 = [v10 resolvedTitle];

    if (!v11)
    {
      [(_UIButtonBarButtonVisualProviderIOS *)self _removeTitleButton];
LABEL_37:

      return;
    }
    titleButton = self->_titleButton;
    if (titleButton)
    {
      [(UIButton *)self->_titleButton setNeedsLayout];
    }
    else
    {
      _newButton(self);
      id v19 = (_UIModernBarButton *)objc_claimAutoreleasedReturnValue();
      id v20 = self->_titleButton;
      self->_titleButton = v19;

      char v21 = self->_titleButton;
      v56[0] = 0x1ED3F5AD8;
      v56[1] = 0x1ED3F5B38;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
      id v23 = [(UIView *)v21 _registerForTraitTokenChanges:v22 withTarget:self action:sel__updateTextContent];
    }
    id v24 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    char v25 = [v24 centerTextButtons];

    double v26 = 0.0;
    double v27 = 0.0;
    if ((v25 & 1) == 0)
    {
      BOOL v28 = [(_UIButtonBarButton *)self->super._button isBackButton];
      double v27 = 0.0;
      if (!v28)
      {
        id v29 = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
        id v30 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
        char v31 = [v29 edgesPaddingBarButtonItem:v30];

        if ((v31 & 8) != 0) {
          double v27 = 3.0;
        }
        else {
          double v27 = 0.0;
        }
      }
      double v26 = 1.0;
      if (v3) {
        double v26 = 3.0;
      }
    }
    -[UIButton setContentEdgeInsets:](self->_titleButton, "setContentEdgeInsets:", v26, 0.0, 0.0, v27);
    id v32 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    -[UIButton setEnabled:](self->_titleButton, "setEnabled:", [v32 isEnabled]);

    if (titleButton && (id v33 = self->_titleContent) != 0)
    {
      id v34 = [(NSArray *)v33 firstObject];
      v35 = [v34 title];
      int v36 = [v35 isEqualToString:v11];

      [(_UIButtonBarButtonVisualProviderIOS *)self _setupAlternateTitles];
      if (v36 && self->_titleContent)
      {
        uint64_t v37 = [(UIButton *)self->_titleButton attributedTitleForState:0];
        uint64_t v38 = [v37 string];

        if (v38)
        {
          titleContent = self->_titleContent;
          uint64_t v51 = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          v53 = __69___UIButtonBarButtonVisualProviderIOS__configureImageOrTitleCompact___block_invoke;
          id v54 = &unk_1E52DDAF0;
          id v40 = v38;
          id v55 = v40;
          if ([(NSArray *)titleContent indexOfObjectPassingTest:&v51] == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v41 = v11;
          }
          else {
            uint64_t v41 = v40;
          }
          id v42 = v41;
        }
        else
        {
          id v42 = v11;
        }

LABEL_33:
        -[_UIButtonBarButtonVisualProviderIOS _setTitle:](self, "_setTitle:", v42, v51, v52, v53, v54);
        if ([(UIView *)self->super._button translatesAutoresizingMaskIntoConstraints])
        {
          [(UIView *)self->_titleButton layoutMargins];
          double v43 = *MEMORY[0x1E4F1DAD8];
          double v44 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          double v47 = v45 + v46;
          double v50 = v48 + v49;
          [(UIView *)self->super._button bounds];
          v59.origin.x = v43;
          v59.origin.y = v44;
          v59.size.width = v47;
          v59.size.height = v50;
          if (!CGRectContainsRect(v58, v59)) {
            -[_UIButtonBarButton setBounds:](self->super._button, "setBounds:", v43, v44, v47, v50);
          }
        }
        [(UIView *)self->_titleButton layoutIfNeeded];

        goto LABEL_37;
      }
    }
    else
    {
      [(_UIButtonBarButtonVisualProviderIOS *)self _setupAlternateTitles];
    }
    id v42 = v11;
    goto LABEL_33;
  }
  [(UIView *)self->_imageButton removeFromSuperview];
  double v5 = self->_imageButton;
  self->_imageButton = 0;

  [(_UIButtonBarButtonVisualProviderIOS *)self _removeTitleButton];
}

- (id)symbolConfigurationCompact:(BOOL)a3
{
  double v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
  if (!v5)
  {
    double v5 = +[_UIBarButtonItemData standardItemDataForStyle:((unint64_t)*(unsigned char *)&self->_flags >> 2) & 7];
  }
  if (a3) {
    [v5 compactImageSymbolConfiguration];
  }
  else {
  uint64_t v6 = [v5 imageSymbolConfiguration];
  }

  return v6;
}

- (void)_removeTitleButton
{
  backButtonTitleMaxWidthConstraint = self->_backButtonTitleMaxWidthConstraint;
  self->_backButtonTitleMaxWidthConstraint = 0;

  [(UIView *)self->_titleButton removeFromSuperview];
  titleButton = self->_titleButton;
  self->_titleButton = 0;
}

- (void)_setTitle:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (__CFString *)a3;
  if (v4) {
    goto LABEL_10;
  }
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v6 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    titleButton = self->_titleButton;
    double v9 = [(UIButton *)titleButton _allButtonContent];
    int v24 = 138412802;
    id v25 = WeakRetained;
    __int16 v26 = 2112;
    double v27 = titleButton;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Received nil title, substituting item's title (item=%@, button=%@, buttonContent=%@)", (uint8_t *)&v24, 0x20u);
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  double v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setTitle____s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    double v8 = self->_titleButton;
    double v9 = [(UIButton *)v8 _allButtonContent];
    int v24 = 138412802;
    id v25 = WeakRetained;
    __int16 v26 = 2112;
    double v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Received nil title, substituting item's title (item=%@, button=%@, buttonContent=%@)", (uint8_t *)&v24, 0x20u);
    goto LABEL_5;
  }
LABEL_7:
  id v10 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  uint64_t v11 = [v10 resolvedTitle];
  id v12 = (void *)v11;
  uint64_t v13 = &stru_1ED0E84C0;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  BOOL v4 = v13;

LABEL_10:
  if (!self->_finalTitleAttributes) {
    [(_UIButtonBarButtonVisualProviderIOS *)self _computeTextAttributes];
  }
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v15 = [(NSArray *)self->_finalTitleAttributes objectAtIndexedSubscript:0];
  id v16 = (void *)[v14 initWithString:v4 attributes:v15];

  [(UIButton *)self->_titleButton setAttributedTitle:v16 forState:0];
  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v18 = [(NSArray *)self->_finalTitleAttributes objectAtIndexedSubscript:1];
  id v19 = (void *)[v17 initWithString:v4 attributes:v18];

  [(UIButton *)self->_titleButton setAttributedTitle:v19 forState:1];
  id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
  char v21 = [(NSArray *)self->_finalTitleAttributes objectAtIndexedSubscript:2];
  id v22 = (void *)[v20 initWithString:v4 attributes:v21];

  [(UIButton *)self->_titleButton setAttributedTitle:v22 forState:2];
}

- (void)_configureImageWithInsets:(UIEdgeInsets)a3 paddingEdges:(unint64_t)a4 additionalPadding:(double)a5
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForImageWithInsets:paddingEdges:additionalPadding:](self, "_addHorizontalConstraintsForImageWithInsets:paddingEdges:additionalPadding:", a4, a3.top, a3.left, a3.bottom, a3.right, a5);
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForImageWithInsets:](self, "_addVerticalConstraintsForImageWithInsets:", top, left, bottom, right);
}

- (void)_configureTextWithOffset:(UIOffset)a3 additionalPadding:(UIEdgeInsets)a4
{
  double vertical = a3.vertical;
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForTextWithOffset:additionalPadding:](self, "_addHorizontalConstraintsForTextWithOffset:additionalPadding:", a3.horizontal, a4.top, a4.left, a4.bottom, a4.right);
  [(_UIButtonBarButtonVisualProviderIOS *)self _addVerticalConstraintsForTextWithOffset:vertical];
}

- (void)_addHorizontalConstraintsForTextWithOffset:(double)a3 additionalPadding:(UIEdgeInsets)a4
{
  double right = a4.right;
  double left = a4.left;
  UIUserInterfaceLayoutDirection v8 = [(UIView *)self->super._button effectiveUserInterfaceLayoutDirection];
  if (v8 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v9 = right;
  }
  else {
    double v9 = left;
  }
  if (v8 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double right = left;
  }
  id v10 = [(UIView *)self->_titleButton leadingAnchor];
  uint64_t v11 = [(UIView *)self->super._button leadingAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11 constant:v9 + a3];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v12 named:@"TB_Leading_Leading"];

  id v15 = [(UIView *)self->super._button trailingAnchor];
  uint64_t v13 = [(UIView *)self->_titleButton trailingAnchor];
  id v14 = [v15 constraintEqualToAnchor:v13 constant:right - a3];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v14 named:@"TB_Trailing_Trailing"];
}

- (void)_configureTextBackButtonWithTitlePositionAdjustment:(UIOffset)a3 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a4 useBaselineAlignment:(BOOL)a5
{
  BOOL v5 = a5;
  double trailing = a4.trailing;
  double bottom = a4.bottom;
  double leading = a4.leading;
  double top = a4.top;
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  if (!self->_titleButton)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UIButtonBarButtonVisualProviderIOS.m" lineNumber:1395 description:@"Invalid text button configuration"];
  }
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:](self, "_addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:", horizontal, top, leading, bottom, trailing);
  [(_UIButtonBarButtonVisualProviderIOS *)self _addVerticalConstraintsForBackIndicatorWithTitleOffset:v5 bottomOffset:vertical useBaselineAlignment:bottom];
  [(_UIButtonBarButtonVisualProviderIOS *)self _addVerticalConstraintsForTextWithOffset:vertical];
  [(_UIButtonBarButtonVisualProviderIOS *)self _configureBackButtonMask];
}

- (void)_addVerticalConstraintsForBackIndicatorWithTitleOffset:(double)a3 bottomOffset:(double)a4 useBaselineAlignment:(BOOL)a5
{
  backIndicatorButton = self->_backIndicatorButton;
  if (a5)
  {
    UIUserInterfaceLayoutDirection v8 = [(UIView *)backIndicatorButton lastBaselineAnchor];
    double v9 = [(UIView *)self->super._button layoutMarginsGuide];
    id v10 = [v9 bottomAnchor];
    uint64_t v11 = [v8 constraintEqualToAnchor:v10 constant:-a3];
    id v12 = @"BIB_Baseline_Baseline";
  }
  else
  {
    UIUserInterfaceLayoutDirection v8 = [(UIView *)backIndicatorButton bottomAnchor];
    double v9 = [(UIView *)self->super._button layoutMarginsGuide];
    id v10 = [v9 bottomAnchor];
    uint64_t v11 = [v8 constraintEqualToAnchor:v10 constant:a4 - a3];
    id v12 = @"BIB_Bottom_Baseline";
  }
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v11 named:v12];

  id v14 = [(UIView *)self->_backIndicatorButton topAnchor];
  id v15 = [(UIView *)self->super._button topAnchor];
  id v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v16 named:@"BIB_Top_Top"];

  id v19 = [(UIView *)self->super._button bottomAnchor];
  id v17 = [(UIView *)self->_backIndicatorButton bottomAnchor];
  id v18 = [v19 constraintGreaterThanOrEqualToAnchor:v17];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v18 named:@"BIB_Bottom_Bottom"];
}

- (void)_addHorizontalConstraintsForContentButton:(id)a3 titleOffset:(double)a4 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a5
{
  double trailing = a5.trailing;
  double leading = a5.leading;
  id v24 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  [WeakRetained backButtonMargin];
  double v11 = v10;

  id v12 = [(UIView *)self->_backIndicatorButton leadingAnchor];
  uint64_t v13 = [(UIView *)self->super._button leadingAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13 constant:v11 - leading];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v14 named:@"BIB_Leading_Leading"];

  if (v24)
  {
    id v15 = [v24 leadingAnchor];
    id v16 = [(UIView *)self->_backIndicatorButton trailingAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16 constant:a4 + 6.0 - trailing];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v17 named:@"BIB_Trailing_CB_Leading"];

    [(_UIButtonBarButtonVisualProviderIOS *)self contentButtonTrailingOffset:0.0];
    double v19 = -v18;
    id v20 = [v24 trailingAnchor];
    char v21 = [(UIView *)self->super._button trailingAnchor];
    id v22 = [v20 constraintLessThanOrEqualToAnchor:v21 constant:v19];
    id v23 = @"CB_Trailing_Trailing";
  }
  else
  {
    id v20 = [(UIView *)self->_backIndicatorButton trailingAnchor];
    char v21 = [(UIView *)self->super._button trailingAnchor];
    id v22 = [v20 constraintLessThanOrEqualToAnchor:v21 constant:-trailing];
    id v23 = @"BIB_Trailing_Trailing";
  }
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v22 named:v23];

  [(_UIButtonBarButtonVisualProviderIOS *)self activateWidthMinimizer];
}

- (void)_configureBackButtonMask
{
  backButtonMask = self->_backButtonMask;
  if (backButtonMask)
  {
    BOOL v4 = [(UIView *)backButtonMask leadingAnchor];
    BOOL v5 = [(UIView *)self->super._button leadingAnchor];
    uint64_t v6 = [v4 constraintEqualToAnchor:v5];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v6 named:@"Mask_Leading_Leading"];

    double v7 = [(UIView *)self->_backButtonMask trailingAnchor];
    UIUserInterfaceLayoutDirection v8 = [(UIView *)self->super._button trailingAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v9 named:@"Mask_Trailing_Trailing"];

    double v10 = [(UIView *)self->_backButtonMask topAnchor];
    double v11 = [(UIView *)self->super._button topAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v12 named:@"Mask_Top_Top"];

    uint64_t v13 = [(UIView *)self->_backButtonMask bottomAnchor];
    id v14 = [(UIView *)self->super._button bottomAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v15 named:@"Mask_Bottom_Bottom"];

    id v16 = [(_UIBackButtonMaskView *)self->_backButtonMask maskImageView];
    id v17 = [v16 leadingAnchor];
    double v18 = [(UIView *)self->_backIndicatorButton leadingAnchor];
    double v19 = [v17 constraintEqualToAnchor:v18];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v19 named:@"MaskIV_Leading_BIB_Leadinng"];

    id v20 = [(_UIBackButtonMaskView *)self->_backButtonMask maskExtensionLeadingAnchor];
    char v21 = [(UIView *)self->_backIndicatorButton trailingAnchor];
    id v22 = [v20 constraintEqualToAnchor:v21];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v22 named:@"MaskEV_Leading_BIB_Trailing"];

    id v26 = [(_UIBackButtonMaskView *)self->_backButtonMask maskImageView];
    id v23 = [v26 centerYAnchor];
    id v24 = [(UIView *)self->_backIndicatorButton centerYAnchor];
    id v25 = [v23 constraintEqualToAnchor:v24];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v25 named:@"MaskIV_CenterY_BIB_CenterY"];
  }
}

- (UIEdgeInsets)_imageInsetsForBarButtonItem:(id)a3 compact:(BOOL)a4 isBackButton:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = [(UIButton *)self->_imageButton currentImage];
  double v10 = v9;
  if (v9)
  {
    [v9 alignmentRectInsets];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = 0.0;
    double v20 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
    if (v8)
    {
      if (v6) {
        objc_msgSend(v8, "landscapeImagePhoneInsets", 0.0);
      }
      else {
        objc_msgSend(v8, "imageInsets", 0.0);
      }
      double v22 = v24;
      double v20 = v25;
    }
    double v30 = v12 + v23;
    double v31 = v16 + v21;
    if (!a5)
    {
      [(_UIButtonBarButtonVisualProviderIOS *)self backgroundVerticalAdjustmentForCompact:v6];
      double v19 = v32;
      if (fabs(v32) < 2.22044605e-16)
      {
        [v8 backgroundVerticalPositionAdjustmentForBarMetrics:v6];
        double v19 = v33;
      }
    }
    double v28 = v14 + v22;
    double v26 = v18 + v20;
    double v34 = v30 + v19;
    double v35 = v31 - v19;
    int v36 = +[UIScreen mainScreen];
    [v36 scale];
    double v38 = v37;

    UIRoundToScale(1.0 / v38, v38);
    double v29 = v34 - v39;
    double v27 = v35 - v39;
  }
  else
  {
    double v26 = 0.0;
    double v27 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
  }

  double v40 = v29;
  double v41 = v28;
  double v42 = v27;
  double v43 = v26;
  result.double right = v43;
  result.double bottom = v42;
  result.double left = v41;
  result.double top = v40;
  return result;
}

- (UIOffset)backgroundVerticalAdjustmentForCompact:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 backgroundImagePositionAdjustmentForState:0];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    double v12 = [WeakRetained appearanceStorage];
    [v12 backgroundVerticalAdjustmentForBarMetrics:v3];
    double v10 = v13;
    double v8 = 0.0;
  }
  double v14 = v8;
  double v15 = v10;
  result.double vertical = v15;
  result.double horizontal = v14;
  return result;
}

- (BOOL)supportsBackButtons
{
  return 1;
}

- (Class)buttonControlClass
{
  return (Class)objc_opt_class();
}

- (id)_backIndicatorImageForCompact:(BOOL)a3
{
  BOOL v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
  BOOL v6 = v5;
  if (!v5) {
    goto LABEL_16;
  }
  if (a3) {
    [v5 compactBackIndicatorImage];
  }
  else {
  double v7 = [v5 backIndicatorImage];
  }
  if (!v7)
  {
LABEL_16:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    double v7 = [WeakRetained backIndicatorImage];

    if (!v7)
    {
      double v9 = +[_UIBarButtonItemData standardBackButtonData];
      double v10 = v9;
      if (a3) {
        [v9 compactBackIndicatorImage];
      }
      else {
      double v7 = [v9 backIndicatorImage];
      }
    }
  }
  double v11 = [v7 imageFlippedForRightToLeftLayoutDirection];

  return v11;
}

- (id)_backIndicatorSymbolConfigurationForCompact:(BOOL)a3
{
  if (dyld_program_sdk_at_least())
  {
    BOOL v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
    if (!v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      double v7 = [WeakRetained backIndicatorImage];

      if (v7)
      {
        BOOL v5 = 0;
      }
      else
      {
        BOOL v5 = +[_UIBarButtonItemData standardBackButtonData];
      }
    }
    if (a3) {
      [v5 compactBackIndicatorSymbolConfiguration];
    }
    else {
    double v8 = [v5 backIndicatorSymbolConfiguration];
    }
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)_backIndicatorMaskSymbolConfigurationForCompact:(BOOL)a3
{
  if (dyld_program_sdk_at_least())
  {
    BOOL v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
    if (!v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      double v7 = [WeakRetained backIndicatorImage];

      if (v7)
      {
        BOOL v5 = 0;
      }
      else
      {
        BOOL v5 = +[_UIBarButtonItemData standardBackButtonData];
      }
    }
    if (a3) {
      [v5 compactBackIndicatorTransitionMaskSymbolConfiguration];
    }
    else {
    double v8 = [v5 backIndicatorTransitionMaskSymbolConfiguration];
    }
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)_backIndicatorMaskForCompact:(BOOL)a3
{
  BOOL v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
  BOOL v6 = v5;
  if (!v5) {
    goto LABEL_13;
  }
  if (a3) {
    [v5 compactBackIndicatorTransitionMaskImage];
  }
  else {
  double v7 = [v5 backIndicatorTransitionMaskImage];
  }
  if (!v7)
  {
LABEL_13:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    double v7 = [WeakRetained backIndicatorMaskImage];

    if (!v7)
    {
      double v9 = +[_UIBarButtonItemData standardBackButtonData];
      double v7 = [v9 compactBackIndicatorTransitionMaskImage];
    }
  }
  double v10 = [v7 imageFlippedForRightToLeftLayoutDirection];

  return v10;
}

- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4
{
  id v21 = a3;
  BOOL v6 = (void (**)(void))a4;
  if (!self->_titleContent) {
    goto LABEL_16;
  }
  [(UIView *)self->_titleButton _nsis_bounds];
  p_appearanceDelegate = &self->_appearanceDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  [WeakRetained backButtonMaximumWidth];

  UIRoundToViewScale(self->_titleButton);
  double v10 = v9;
  if ([(NSArray *)self->_titleContent count])
  {
    uint64_t v11 = 0;
    double v12 = &stru_1ED0E84C0;
    while (1)
    {
      double v13 = [(NSArray *)self->_titleContent objectAtIndexedSubscript:v11];
      [v13 width];
      if (v14 <= v10) {
        break;
      }

      if (++v11 >= [(NSArray *)self->_titleContent count])
      {
        BOOL v15 = 0;
        double v13 = 0;
        goto LABEL_11;
      }
    }
    BOOL v15 = v11 != 0;
    if (v13)
    {
      double v12 = [v13 title];
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v15 = 0;
    double v13 = 0;
  }
  double v12 = &stru_1ED0E84C0;
LABEL_11:
  double v16 = [(UIButton *)self->_titleButton titleForState:0];
  if (![v16 length])
  {
    [(_UIButtonBarButtonVisualProviderIOS *)self _setTitle:v12];

LABEL_16:
    v6[2](v6);
    goto LABEL_17;
  }
  int v17 = v15 & ([v16 isEqualToString:v12] ^ 1);
  [(_UIButtonBarButtonVisualProviderIOS *)self _setTitle:v12];

  v6[2](v6);
  if (v17 == 1)
  {
    id v18 = objc_loadWeakRetained((id *)p_appearanceDelegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)p_appearanceDelegate);
      [v20 backButtonTitleDidChange];
    }
  }
LABEL_17:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
  objc_storeStrong((id *)&self->_backButtonTitleMaxWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleLookup, 0);
  objc_storeStrong((id *)&self->_titleContent, 0);
  objc_storeStrong((id *)&self->_backgroundImages, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_finalTitleAttributes, 0);
  objc_storeStrong((id *)&self->_barButtonTitleAttributes, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageButton, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_backButtonMask, 0);
  objc_storeStrong((id *)&self->_backIndicatorButton, 0);
  objc_storeStrong((id *)&self->_oldConstraints, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
}

- (id)buttonSpringLoadedInteractionEffect
{
  v2 = objc_opt_new();
  return v2;
}

- (void)_setupAlternateTitles
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (self->_titleButton)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    BOOL v4 = [WeakRetained _backButtonAlternateTitles];

    if ([v4 count])
    {
      BOOL v5 = objc_opt_new();
      id v6 = objc_loadWeakRetained((id *)&self->super._barButtonItem);
      double v7 = [v6 resolvedTitle];

      if (v7) {
        char v36 = [v4 containsObject:v7];
      }
      else {
        char v36 = 0;
      }
      if (!self->_titleLookup)
      {
        uint64_t v11 = (NSMutableDictionary *)objc_opt_new();
        titleLookup = self->_titleLookup;
        self->_titleLookup = v11;
      }
      if (v7)
      {
        double v13 = [(_UIButtonBarButtonVisualProviderIOS *)self _titleContentForTitle:v7];
        [v5 addObject:v13];
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v14 = v4;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v38 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            id v20 = [(_UIButtonBarButtonVisualProviderIOS *)self _titleContentForTitle:v19];
            uint64_t v21 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, objc_msgSend(v5, "count"), 1024, &__block_literal_global_49);
            if (v19) {
              BOOL v22 = v21 == 0;
            }
            else {
              BOOL v22 = 0;
            }
            if (!v22) {
              [v5 insertObject:v20 atIndex:v21];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v16);
      }

      double v23 = (NSArray *)[v5 copy];
      titleContent = self->_titleContent;
      self->_titleContent = v23;

      NSUInteger v25 = [(NSArray *)self->_titleContent count];
      char v26 = v36 ^ 1;
      if (!v7) {
        char v26 = 0;
      }
      if (v26)
      {
        if (v25 > 1) {
          goto LABEL_30;
        }
      }
      else if (v25)
      {
LABEL_30:
        LODWORD(v10) = 1132068864;
        [(UIView *)self->_titleButton setContentCompressionResistancePriority:0 forAxis:v10];
        double v27 = [(NSArray *)self->_titleContent firstObject];
        [v27 width];
        double v29 = v28;

        p_backButtonTitleMaxWidthConstraint = (id *)&self->_backButtonTitleMaxWidthConstraint;
        backButtonTitleMaxWidthConstraint = self->_backButtonTitleMaxWidthConstraint;
        if (backButtonTitleMaxWidthConstraint)
        {
          [(NSLayoutConstraint *)backButtonTitleMaxWidthConstraint setConstant:v29];
        }
        else
        {
          double v33 = [(UIView *)self->_titleButton widthAnchor];
          uint64_t v34 = [v33 constraintLessThanOrEqualToConstant:v29];
          id v35 = *p_backButtonTitleMaxWidthConstraint;
          id *p_backButtonTitleMaxWidthConstraint = (id)v34;
        }
        uint64_t v32 = 1;
        goto LABEL_36;
      }
    }
    else
    {
      double v9 = self->_titleContent;
      self->_titleContent = 0;
    }
    LODWORD(v10) = 1144913920;
    [(UIView *)self->_titleButton setContentCompressionResistancePriority:0 forAxis:v10];
    uint64_t v32 = 0;
    p_backButtonTitleMaxWidthConstraint = (id *)&self->_backButtonTitleMaxWidthConstraint;
LABEL_36:
    [*p_backButtonTitleMaxWidthConstraint setActive:v32];

    return;
  }
  double v8 = self->_titleContent;
  self->_titleContent = 0;
}

- (id)_titleContentForTitle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_titleLookup objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [(NSArray *)self->_finalTitleAttributes objectAtIndexedSubscript:0];
    BOOL v5 = +[_UITitleContent contentWithTitle:v4 attributes:v6 button:self->_titleButton];

    [(NSMutableDictionary *)self->_titleLookup setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (BOOL)canUpdateMenuInPlace
{
  return 1;
}

- (void)activateHeightMinimizer
{
  id v3 = [(_UIButtonBarButton *)self->super._button heightMinimizingConstraint];
  [(NSMutableDictionary *)self->_currentConstraints setObject:v3 forKeyedSubscript:@"minimizeHeight"];
  [(NSMutableDictionary *)self->_oldConstraints setObject:0 forKeyedSubscript:@"minimizeHeight"];
}

- (UIOffset)backButtonBackgroundVerticalAdjustmentForCompact:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIButtonBarButton *)self->super._button appearanceData];
  id v6 = v5;
  if (v5)
  {
    [v5 backgroundImagePositionAdjustmentForState:0];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    double v12 = [WeakRetained appearanceStorage];
    [v12 backButtonBackgroundVerticalAdjustmentForBarMetrics:v3];
    double v10 = v13;
    double v8 = 0.0;
  }
  double v14 = v8;
  double v15 = v10;
  result.double vertical = v15;
  result.double horizontal = v14;
  return result;
}

- (void)resetButtonHasHighlighted
{
  [(UIControl *)self->_titleButton _setTouchHasHighlighted:0];
  [(UIControl *)self->_imageButton _setTouchHasHighlighted:0];
  backIndicatorButton = self->_backIndicatorButton;
  [(UIControl *)backIndicatorButton _setTouchHasHighlighted:0];
}

- (id)pointerPreviewParameters
{
  BOOL v3 = objc_opt_new();
  if ((*(unsigned char *)&self->_flags & 0x20) != 0 && self->_systemItem == 24)
  {
    [(UIView *)self->_backgroundView frame];
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
    id v4 = (_UIModernBarButton *)objc_claimAutoreleasedReturnValue();
    [v3 setShadowPath:v4];
  }
  else
  {
    if (![(UIControl *)self->super._button isSelected]) {
      goto LABEL_10;
    }
    titleButton = self->_titleButton;
    if (titleButton)
    {
      id v4 = titleButton;
    }
    else
    {
      id v4 = self->_imageButton;
      if (!v4) {
        goto LABEL_10;
      }
    }
    [(_UIModernBarButton *)v4 _selectedIndicatorBounds];
    -[UIView convertRect:toView:](v4, "convertRect:toView:", self->super._button);
    id v6 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
    [v3 setShadowPath:v6];
  }
LABEL_10:
  return v3;
}

- (id)pointerShapeInContainer:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[_UIPointerSettingsDomain rootSettings];
  id v6 = [v5 navigationAndToolbarSettings];

  if ((*(unsigned char *)&self->_flags & 0x20) != 0 && self->_systemItem == 24)
  {
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView bounds];
    -[UIView convertRect:toView:](backgroundView, "convertRect:toView:", v4);
    double v8 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height, CGRectGetWidth(v36) * 0.5);
    goto LABEL_21;
  }
  if ([(UIControl *)self->super._button isSelected])
  {
    titleButton = self->_titleButton;
    if (titleButton)
    {
      double v10 = titleButton;
    }
    else
    {
      double v10 = self->_imageButton;
      if (!v10) {
        goto LABEL_24;
      }
    }
    if ([(UIButton *)v10 _hasVisibleDefaultSelectionIndicator])
    {
      [(_UIModernBarButton *)v10 _selectedIndicatorBounds];
      -[UIView convertRect:toView:](v10, "convertRect:toView:", v4);
      double v8 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");

      goto LABEL_21;
    }
  }
  backIndicatorButton = self->_backIndicatorButton;
  if (backIndicatorButton)
  {
    CGFloat v12 = *MEMORY[0x1E4F1DB20];
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    [(UIView *)backIndicatorButton frame];
    v41.origin.double x = v16;
    v41.origin.double y = v17;
    v41.size.double width = v18;
    v41.size.double height = v19;
    v37.origin.double x = v12;
    v37.origin.double y = v13;
    v37.size.double width = v14;
    v37.size.double height = v15;
    CGRect v38 = CGRectUnion(v37, v41);
    double x = v38.origin.x;
    double y = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
    double v24 = self->_titleButton;
    if (v24)
    {
LABEL_13:
      NSUInteger v25 = [(UIButton *)v24 titleLabel];
      goto LABEL_19;
    }
LABEL_17:
    imageButton = self->_imageButton;
    if (!imageButton)
    {
LABEL_20:
      button = self->super._button;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
      double v8 = _calculateFinalPointerShape(button, v4, WeakRetained, v6, [(_UIButtonBarButton *)self->super._button isBackButton], [(UIView *)self->super._button effectiveUserInterfaceLayoutDirection] != UIUserInterfaceLayoutDirectionRightToLeft, x, y, width, height);

      goto LABEL_21;
    }
    NSUInteger v25 = [(UIButton *)imageButton imageView];
LABEL_19:
    double v27 = v25;
    [v25 bounds];
    objc_msgSend(v27, "convertRect:toView:", self->super._button);
    v42.origin.double x = v28;
    v42.origin.double y = v29;
    v42.size.double width = v30;
    v42.size.double height = v31;
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    CGRect v40 = CGRectUnion(v39, v42);
    double x = v40.origin.x;
    double y = v40.origin.y;
    double width = v40.size.width;
    double height = v40.size.height;

    goto LABEL_20;
  }
  double v24 = self->_titleButton;
  if (v24 || self->_imageButton)
  {
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (v24) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
LABEL_24:
  double v8 = 0;
LABEL_21:

  return v8;
}

- (id)matchingPointerShapeForView:(id)a3 rect:(CGRect)a4 inContainer:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a5;
  id v11 = a3;
  CGFloat v12 = +[_UIPointerSettingsDomain rootSettings];
  CGFloat v13 = [v12 navigationAndToolbarSettings];
  CGFloat v14 = _calculateFinalPointerShape(v11, v10, 0, v13, 0, 0, x, y, width, height);

  return v14;
}

- (BOOL)shouldLift
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0 && self->_systemItem == 24)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    BOOL v2 = [(UIControl *)self->super._button isSelected];
    if (v2)
    {
      BOOL v3 = +[_UIPointerSettingsDomain rootSettings];
      id v4 = [v3 navigationAndToolbarSettings];

      LOBYTE(v3) = [v4 enableLiftOnSelected];
      LOBYTE(v2) = (_BYTE)v3;
    }
  }
  return v2;
}

- (BOOL)backButtonMaskEnabled
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setBackButtonMaskEnabled:(BOOL)a3
{
  if (self->_backButtonMask)
  {
    char flags = (char)self->_flags;
    if (((((flags & 2) == 0) ^ a3) & 1) == 0)
    {
      if (a3) {
        char v4 = 2;
      }
      else {
        char v4 = 0;
      }
      *(unsigned char *)&self->_char flags = flags & 0xFD | v4;
      [(_UIButtonBarButtonVisualProviderIOS *)self _updateViewsForMaskingEnabled];
    }
  }
}

- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIButton *)self->_backIndicatorButton setHighlighted:a4];
  [(UIButton *)self->_titleButton setHighlighted:v4];
  [(UIButton *)self->_imageButton setHighlighted:v4];
  backgroundImages = self->_backgroundImages;
  double v7 = [NSNumber numberWithUnsignedInteger:v4];
  double v8 = [(NSMutableDictionary *)backgroundImages objectForKeyedSubscript:v7];

  if (v8)
  {
    double v9 = self->_backgroundImages;
    id v11 = [NSNumber numberWithUnsignedInteger:v4];
    id v10 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v11];
    [(UIImageView *)self->_backgroundView setImage:v10];
  }
}

- (void)updateButton:(id)a3 forHeldState:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIButton *)self->_backIndicatorButton _setHasActiveMenuPresentation:a4];
  [(UIButton *)self->_titleButton _setHasActiveMenuPresentation:v4];
  imageButton = self->_imageButton;
  [(UIButton *)imageButton _setHasActiveMenuPresentation:v4];
}

- (id)backIndicatorView
{
  return self->_backIndicatorButton;
}

- (id)contentView
{
  imageButton = self->_imageButton;
  if (imageButton) {
    goto LABEL_2;
  }
  BOOL v3 = self->_titleButton;
  if (!v3)
  {
    imageButton = (_UIModernBarButton *)self->_backIndicatorButton;
LABEL_2:
    BOOL v3 = imageButton;
  }
  return v3;
}

- (void)_addConstraintsForBackgroundViewWithOffset:(double)a3 isBackButton:(BOOL)a4 resizesImage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  imageButton = self->_imageButton;
  if (imageButton)
  {
    id v10 = imageButton;
  }
  else
  {
    id v10 = self->_titleButton;
    if (!v10) {
      return;
    }
  }
  char v26 = v10;
  if (v6 && self->_backIndicatorButton)
  {
    id v11 = [(UIView *)self->_backgroundView leadingAnchor];
    CGFloat v12 = [(UIView *)self->_backIndicatorButton leadingAnchor];
    CGFloat v13 = [v11 constraintEqualToAnchor:v12 constant:-3.0];
    CGFloat v14 = @"BGI_Leading_BIB_Leading";
  }
  else
  {
    id v11 = [(UIView *)self->_backgroundView leadingAnchor];
    CGFloat v12 = [(UIView *)v26 leadingAnchor];
    CGFloat v13 = [v11 constraintEqualToAnchor:v12 constant:-3.0];
    CGFloat v14 = @"BGI_Leading_CB_Leading";
  }
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v13 named:v14];

  CGFloat v15 = [(UIView *)self->_backgroundView trailingAnchor];
  CGFloat v16 = [(UIView *)v26 trailingAnchor];
  CGFloat v17 = [v15 constraintEqualToAnchor:v16 constant:3.0];
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v17 named:@"BGI_Trailing_CB_Trailing"];

  backgroundView = self->_backgroundView;
  if (v5)
  {
    CGFloat v19 = [(UIView *)backgroundView topAnchor];
    id v20 = [(UIView *)v26 topAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20 constant:a3 + -3.0];
    [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v21 named:@"BGI_Top_CB_Top"];

    BOOL v22 = [(UIView *)self->_backgroundView bottomAnchor];
    double v23 = [(UIView *)v26 bottomAnchor];
    double v24 = [v22 constraintEqualToAnchor:v23 constant:a3 + 3.0];
    NSUInteger v25 = @"BGI_Bottom_CB_Bottom";
  }
  else
  {
    BOOL v22 = [(UIView *)backgroundView centerYAnchor];
    double v23 = [(UIView *)v26 centerYAnchor];
    double v24 = [v22 constraintEqualToAnchor:v23 constant:a3];
    NSUInteger v25 = @"BGI_Center_CB_Center";
  }
  [(_UIButtonBarButtonVisualProviderIOS *)self addActiveConstraint:v24 named:v25];
}

- (double)_defaultBackIndicatorBaselineInsetCompact:(BOOL)a3
{
  double result = 3.0;
  if (!a3)
  {
    BOOL v4 = [(UIView *)self->super._button traitCollection];
    [v4 displayScale];
    double v6 = v5;

    double result = 4.0;
    if (v6 > 0.0) {
      return -1.0 / v6 + 5.0;
    }
  }
  return result;
}

- (id)alignmentViewForStaticNavBarButtonTrailing
{
  titleButton = self->_titleButton;
  if (!titleButton)
  {
    titleButton = self->_imageButton;
    if (!titleButton) {
      titleButton = (_UIModernBarButton *)self->_backIndicatorButton;
    }
  }
  return titleButton;
}

- (void)_configureImageBackButtonWithImageInsets:(UIEdgeInsets)a3 backButtonLayoutInsets:(NSDirectionalEdgeInsets)a4 useBaselineAlignment:(BOOL)a5
{
  BOOL v5 = a5;
  double trailing = a4.trailing;
  double bottom = a4.bottom;
  double leading = a4.leading;
  double top = a4.top;
  double right = a3.right;
  double v11 = a3.bottom;
  double left = a3.left;
  double v13 = a3.top;
  if (!self->_imageButton)
  {
    CGFloat v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"_UIButtonBarButtonVisualProviderIOS.m" lineNumber:1386 description:@"Invalid image button configuration"];
  }
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:](self, "_addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:", 0.0, top, leading, bottom, trailing);
  [(_UIButtonBarButtonVisualProviderIOS *)self _addVerticalConstraintsForBackIndicatorWithTitleOffset:v5 bottomOffset:0.0 useBaselineAlignment:bottom];
  -[_UIButtonBarButtonVisualProviderIOS _addVerticalConstraintsForImageWithInsets:](self, "_addVerticalConstraintsForImageWithInsets:", v13, left, v11, right);
  [(_UIButtonBarButtonVisualProviderIOS *)self _configureBackButtonMask];
}

- (void)_configureBackButtonWithBackButtonLayoutInsets:(NSDirectionalEdgeInsets)a3 useBaselineAlignment:(BOOL)a4
{
  BOOL v4 = a4;
  double bottom = a3.bottom;
  -[_UIButtonBarButtonVisualProviderIOS _addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:](self, "_addHorizontalConstraintsForContentButton:titleOffset:backButtonLayoutInsets:", 0, 0.0, a3.top, a3.leading, a3.bottom, a3.trailing);
  [(_UIButtonBarButtonVisualProviderIOS *)self _addVerticalConstraintsForBackIndicatorWithTitleOffset:v4 bottomOffset:0.0 useBaselineAlignment:bottom];
  [(_UIButtonBarButtonVisualProviderIOS *)self _configureBackButtonMask];
}

- (CGSize)buttonImageViewSize:(id)a3
{
  if (self->_imageButton)
  {
    BOOL v3 = [(UIButton *)self->_imageButton _imageView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIButtonBarButtonVisualProviderIOS;
    [(_UIButtonBarButtonVisualProvider *)&v12 buttonImageViewSize:a3];
    double v5 = v8;
    double v7 = v9;
  }
  double v10 = v5;
  double v11 = v7;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_updateTextContent
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  finalTitleAttributes = self->_finalTitleAttributes;
  self->_finalTitleAttributes = 0;

  CGFloat v15 = [(UIButton *)self->_titleButton attributedTitleForState:0];
  double v4 = [v15 string];
  [(_UIButtonBarButtonVisualProviderIOS *)self _setTitle:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = self->_titleContent;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v11 = [(NSArray *)self->_finalTitleAttributes objectAtIndexedSubscript:0];
        [v10 updateWithTitleAttributes:v11 button:self->_titleButton];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  objc_super v12 = [(NSArray *)self->_titleContent firstObject];
  [v12 width];
  double v14 = v13;

  [(NSLayoutConstraint *)self->_backButtonTitleMaxWidthConstraint setConstant:v14];
  [(UIView *)self->super._button setNeedsLayout];
}

- (id)buttonContextMenuInteractionConfiguration
{
  if (self->_menuProvider)
  {
    BOOL v2 = +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", @"UIBarButtonItemContextMenu", 0);
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3
{
  id v4 = a3;
  [(_UIButtonBarButtonVisualProviderIOS *)self menuAnchorPoint];
  double v6 = v5;
  CGFloat v8 = v7;
  button = self->super._button;
  double v10 = [(_UIButtonBarButtonVisualProviderIOS *)self buttonContextMenuTargetedPreview];
  _UIControlMenuSupportUpdateStyleForBarButtons(v4, button, v10, self->_backIndicatorButton != 0, v6, v8);

  return v4;
}

- (id)buttonContextMenuTargetedPreview
{
  button = self->super._button;
  imageButton = self->_imageButton;
  if (!imageButton) {
    imageButton = self->_titleButton;
  }
  return _UIControlMenuSupportTargetedPreviewOverViews(button, imageButton, self->_backIndicatorButton);
}

- (CGPoint)menuAnchorPoint
{
  imageButton = self->_imageButton;
  if (!imageButton) {
    imageButton = self->_titleButton;
  }
  BOOL v3 = imageButton;
  id v4 = [(UIView *)v3 _viewControllerForAncestor];
  double v5 = [v4 view];

  if (!v5)
  {
    double v5 = [(UIView *)v3 window];
  }
  double v6 = [(UIView *)v3 superview];
  [(UIView *)v3 frame];
  objc_msgSend(v6, "convertRect:toView:", v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = _UIControlMenuAttachmentPointForRectInContainer(v5, v8, v10, v12, v14);
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (void)updateImage
{
  if (self->_imageButton)
  {
    button = self->super._button;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
    [(_UIButtonBarButtonVisualProviderIOS *)self configureButton:button fromBarButtonItem:WeakRetained];
  }
}

- (void)reload
{
  button = self->super._button;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._barButtonItem);
  [(_UIButtonBarButtonVisualProviderIOS *)self configureButton:button fromBarButtonItem:WeakRetained];
}

- (id)textButton
{
  return self->_titleButton;
}

- (id)imageButton
{
  return self->_imageButton;
}

- (id)backgroundImageView
{
  return self->_backgroundView;
}

@end