@interface UINavigationButton
+ (id)defaultFont;
+ (void)_resetRenderingModesForBackgroundImageView:(id)a3 inBarStyle:(int64_t)a4 isEnabled:(BOOL)a5 withAccessibilityBackground:(BOOL)a6 wantsBlendModeForAccessibilityBackgrounds:(BOOL)a7 accessibilityBackgroundTintColor:(id)a8;
- (BOOL)_barItemHidden;
- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_createdByBarButtonItem;
- (BOOL)_hasBaselineAlignedAbsoluteVerticalPosition:(double *)a3 withinNavBar:(id)a4 forSize:(CGSize)a5;
- (BOOL)_isExternalRoundedRectButton;
- (BOOL)_isFontScaleInvalid;
- (BOOL)_isModernButton;
- (BOOL)_showsAccessibilityBackgroundWhenEnabled;
- (BOOL)_supportsMacIdiom;
- (BOOL)_wantsAccessibilityButtonShapes;
- (BOOL)_wantsBlendModeForAccessibilityBackgrounds;
- (BOOL)canBecomeFocused;
- (BOOL)contentsEqualTo:(id)a3 withStyle:(int)a4;
- (CGRect)_selectedIndicatorBounds;
- (CGSize)_defaultTitleShadowOffsetForState:(unint64_t)a3;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (Class)_appearanceGuideClass;
- (NSDictionary)_stylesForSizingTitles;
- (NSString)title;
- (UIBarButtonItem)originatingButtonItem;
- (UIColor)_accessibilityBackgroundTintColor;
- (UIColor)_tintColor;
- (UIEdgeInsets)_additionalSelectionInsets;
- (UIEdgeInsets)_buttonTitleEdgeInsets;
- (UIEdgeInsets)_pathImageEdgeInsets;
- (UIEdgeInsets)_pathTitleEdgeInsets;
- (UIImage)image;
- (UINavigationButton)initWithImage:(id)a3;
- (UINavigationButton)initWithImage:(id)a3 style:(int)a4;
- (UINavigationButton)initWithImage:(id)a3 width:(double)a4 style:(int)a5;
- (UINavigationButton)initWithImage:(id)a3 width:(double)a4 style:(int)a5 applyBezel:(BOOL)a6 forBarStyle:(int64_t)a7 buttonItemStyle:(int64_t)a8;
- (UINavigationButton)initWithTitle:(id)a3;
- (UINavigationButton)initWithTitle:(id)a3 possibleTitles:(id)a4 style:(int)a5;
- (UINavigationButton)initWithTitle:(id)a3 style:(int)a4;
- (UINavigationButton)initWithValue:(id)a3 width:(double)a4 style:(int)a5 barStyle:(int64_t)a6 possibleTitles:(id)a7 possibleSystemItems:(id)a8 tintColor:(id)a9 applyBezel:(BOOL)a10 forButtonItemStyle:(int64_t)a11;
- (UINavigationButton)initWithValue:(id)a3 width:(double)a4 style:(int)a5 barStyle:(int64_t)a6 possibleTitles:(id)a7 tintColor:(id)a8;
- (UINavigationItem)originatingNavigationItem;
- (UIOffset)_titlePositionAdjustmentForBarMetrics:(int64_t)a3;
- (UIView)_enclosingBar;
- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3;
- (double)_fontScaleAdjustment;
- (double)maximumWidth;
- (double)minimumWidth;
- (id)_activeVisualStyle;
- (id)_adjustedDefaultTitleFont;
- (id)_appearanceStorage;
- (id)_backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4;
- (id)_customOrAccessibilityBackgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5;
- (id)_defaultTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4;
- (id)_defaultTitleShadowColorForState:(unint64_t)a3;
- (id)_externalTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4;
- (id)_externalUnfocusedBorderColor;
- (id)_titleTextAttributesForState:(unint64_t)a3;
- (id)_visualStyleForMetrics:(int64_t)a3;
- (int)controlSize;
- (int)style;
- (int64_t)_activeBarMetrics;
- (int64_t)_barButtonItemStyle;
- (int64_t)_buttonItemStyle;
- (int64_t)_externalDrawingStyleForState:(unint64_t)a3;
- (int64_t)barStyle;
- (int64_t)buttonType;
- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 barMetrics:(int64_t)a6;
- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setTintColor:(id)a3;
- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)_accessibilityButtonShapesParametersDidChange;
- (void)_adjustBounds;
- (void)_applyBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_sendSetNeedsLayoutToSuperviewOnTitleAnimationCompletionIfNecessary;
- (void)_setAccessibilityBackgroundTintColor:(id)a3;
- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3;
- (void)_setAppearanceGuideClass:(Class)a3;
- (void)_setBarItemHidden:(BOOL)a3;
- (void)_setBoundsAdjustment:(CGSize)a3;
- (void)_setButtonItemStyle:(int64_t)a3;
- (void)_setCreatedByBarButtonItem:(BOOL)a3;
- (void)_setEnclosingBar:(id)a3;
- (void)_setFontScaleAdjustment:(double)a3;
- (void)_setFontScaleInvalid:(BOOL)a3;
- (void)_setFrame:(CGRect)a3 deferLayout:(BOOL)a4;
- (void)_setGroupName:(id)a3 forNavigationBar:(id)a4;
- (void)_setStylesForSizingTitles:(id)a3;
- (void)_setTitleFrozen:(BOOL)a3;
- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3;
- (void)_uinavigationbar_prepareToAppearInNavigationItem:(id)a3 onLeft:(BOOL)a4;
- (void)_updateContentInsets;
- (void)_updateShadowOffsetWithAttributes:(id)a3 forState:(unint64_t)a4;
- (void)_updateStyle;
- (void)_updateTitleColorsForState:(unint64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBarStyle:(int64_t)a3;
- (void)setControlSize:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMaximumWidth:(double)a3;
- (void)setMinimumWidth:(double)a3;
- (void)setNavigationBarTintColor:(id)a3;
- (void)setOriginatingButtonItem:(id)a3;
- (void)setOriginatingNavigationItem:(id)a3;
- (void)setPointerInteractionEnabled:(BOOL)a3;
- (void)setStyle:(int)a3;
- (void)setTitle:(id)a3;
@end

@implementation UINavigationButton

- (int64_t)buttonType
{
  if ([(UINavigationButton *)self _isCarPlaySystemTypeButton]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UINavigationButton;
  return [(UIButton *)&v4 buttonType];
}

- (void)_setFontScaleAdjustment:(double)a3
{
  if (self->_fontScaleAdjustment != a3)
  {
    self->_isFontScaleInvalid = 1;
    self->_fontScaleAdjustment = a3;
  }
}

- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3
{
  if (self->_wantsBlendModeForAccessibilityBackgrounds != a3)
  {
    self->_wantsBlendModeForAccessibilityBackgrounds = a3;
    id v10 = [(UIButton *)self _backgroundView];
    BOOL v4 = [(UIControl *)self isEnabled];
    if (v10)
    {
      int64_t barStyle = self->_barStyle;
      BOOL v6 = [(UINavigationButton *)self _wantsAccessibilityButtonShapes];
      BOOL v7 = [(UINavigationButton *)self _wantsBlendModeForAccessibilityBackgrounds];
      v8 = [(UINavigationButton *)self _accessibilityBackgroundTintColor];
      +[UINavigationButton _resetRenderingModesForBackgroundImageView:v10 inBarStyle:barStyle isEnabled:v4 withAccessibilityBackground:v6 wantsBlendModeForAccessibilityBackgrounds:v7 accessibilityBackgroundTintColor:v8];
    }
    if (!v4)
    {
      v9 = [(UINavigationButton *)self _defaultTitleColorForState:2 isTintColor:0];
      [(UIButton *)self setTitleColor:v9 forState:2];
    }
  }
}

- (void)_setAccessibilityBackgroundTintColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_accessibilityBackgroundTintColor != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_accessibilityBackgroundTintColor, a3);
    BOOL v6 = [(UIButton *)self _backgroundView];
    if (v6)
    {
      int64_t barStyle = self->_barStyle;
      BOOL v8 = [(UIControl *)self isEnabled];
      BOOL v9 = [(UINavigationButton *)self _wantsAccessibilityButtonShapes];
      BOOL v10 = [(UINavigationButton *)self _wantsBlendModeForAccessibilityBackgrounds];
      v11 = [(UINavigationButton *)self _accessibilityBackgroundTintColor];
      +[UINavigationButton _resetRenderingModesForBackgroundImageView:v6 inBarStyle:barStyle isEnabled:v8 withAccessibilityBackground:v9 wantsBlendModeForAccessibilityBackgrounds:v10 accessibilityBackgroundTintColor:v11];
    }
    v5 = v12;
  }
}

- (void)setMinimumWidth:(double)a3
{
  self->_minimumWidth = a3;
  double maximumWidth = self->_maximumWidth;
  if (maximumWidth > 0.0 && maximumWidth < a3) {
    self->_double maximumWidth = a3;
  }
}

- (void)setMaximumWidth:(double)a3
{
  self->_double maximumWidth = a3;
  if (a3 > 0.0)
  {
    double minimumWidth = self->_minimumWidth;
    if (minimumWidth > a3) {
      self->_double maximumWidth = minimumWidth;
    }
  }
}

+ (id)defaultFont
{
  v2 = +[UINavigationBar _defaultVisualStyleForOrientation:1];
  v3 = [v2 buttonFontForStyle:0];

  return v3;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UINavigationButton;
  [(UIButton *)&v9 _didMoveFromWindow:a3 toWindow:a4];
  if ([(UINavigationButton *)self _showsAccessibilityBackgroundWhenEnabled])
  {
    v5 = +[UIDevice currentDevice];
    uint64_t v6 = [v5 _graphicsQuality];

    if (v6 == 100)
    {
      BOOL v7 = [(UINavigationButton *)self _accessibilityBackgroundTintColor];
      if (v7)
      {
        [(UINavigationButton *)self _setWantsBlendModeForAccessibilityBackgrounds:0];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
        [(UINavigationButton *)self _setWantsBlendModeForAccessibilityBackgrounds:_UIBarBlurAcceptsBlendModeOnBackground(WeakRetained)];
      }
    }
    else
    {
      [(UINavigationButton *)self _setWantsBlendModeForAccessibilityBackgrounds:0];
    }
    if ([(UINavigationButton *)self _wantsAccessibilityButtonShapes]) {
      [(UIButton *)self setNeedsLayout];
    }
  }
}

- (BOOL)_showsAccessibilityBackgroundWhenEnabled
{
  if (!self->_createdByBarButtonItem) {
    return 0;
  }
  v3 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage anyBackgroundImage];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(UIButton *)self titleForState:0];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (BOOL)_wantsAccessibilityButtonShapes
{
  int v3 = -[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self);
  if (v3)
  {
    LOBYTE(v3) = [(UINavigationButton *)self _showsAccessibilityBackgroundWhenEnabled];
  }
  return v3;
}

- (id)_defaultTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4
{
  if ([(UIButton *)self _isInCarPlay])
  {
    BOOL v7 = [(UINavigationButton *)self _externalTitleColorForState:a3 isTintColor:a4];
    goto LABEL_16;
  }
  if (![(UINavigationButton *)self _wantsAccessibilityButtonShapes]) {
    goto LABEL_14;
  }
  if ((unint64_t)(self->_barStyle - 1) > 1)
  {
    if (a3 == 2)
    {
      objc_super v9 = +[UIColor blackColor];
      BOOL v10 = v9;
      double v11 = 0.2;
      goto LABEL_12;
    }
LABEL_14:
    BOOL v7 = 0;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (a3 == 2)
  {
    if ([(UINavigationButton *)self _wantsBlendModeForAccessibilityBackgrounds])
    {
      double v8 = 0.2;
    }
    else
    {
      double v8 = 0.3;
    }
    objc_super v9 = +[UIColor whiteColor];
    BOOL v10 = v9;
    double v11 = v8;
LABEL_12:
    BOOL v7 = [v9 colorWithAlphaComponent:v11];

    if (!a4) {
      goto LABEL_16;
    }
LABEL_15:
    *a4 = 0;
    goto LABEL_16;
  }
  BOOL v7 = +[UIColor whiteColor];
  if (a4) {
    goto LABEL_15;
  }
LABEL_16:
  return v7;
}

- (id)_externalTitleColorForState:(unint64_t)a3 isTintColor:(BOOL *)a4
{
  if (![(UINavigationButton *)self _isCarPlaySystemTypeButton])
  {
    BOOL v8 = 0;
    objc_super v9 = 0;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v7 = a3 == 8;
  BOOL v8 = a3 != 8;
  if (!v7)
  {
    objc_super v9 = [(UIView *)self tintColor];
    if (!a4) {
      goto LABEL_7;
    }
LABEL_6:
    *a4 = v8;
    goto LABEL_7;
  }
  objc_super v9 = [(UIButton *)self _externalFocusedTitleColor];
  if (a4) {
    goto LABEL_6;
  }
LABEL_7:
  return v9;
}

- (id)_defaultTitleShadowColorForState:(unint64_t)a3
{
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = +[UIButton _defaultNormalTitleShadowColor];
  }
  return v5;
}

- (CGSize)_defaultTitleShadowOffsetForState:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateShadowOffsetWithAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6 = [a3 objectForKey:*(void *)off_1E52D2238];
  id v7 = v6;
  if (v6) {
    [v6 shadowOffset];
  }
  else {
    [(UINavigationButton *)self _defaultTitleShadowOffsetForState:a4];
  }
  -[UIButton _setTitleShadowOffset:](self, "_setTitleShadowOffset:");
}

+ (void)_resetRenderingModesForBackgroundImageView:(id)a3 inBarStyle:(int64_t)a4 isEnabled:(BOOL)a5 withAccessibilityBackground:(BOOL)a6 wantsBlendModeForAccessibilityBackgrounds:(BOOL)a7 accessibilityBackgroundTintColor:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v19 = a3;
  id v13 = a8;
  if (v10) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  [v19 _setDefaultRenderingMode:v14];
  if (!v10)
  {
    uint64_t v18 = 0;
    goto LABEL_15;
  }
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    if (v9)
    {
      if (!a4)
      {
        id v15 = +[UIColor _accessibilityButtonShapesBackgroundColorOnLight];
        goto LABEL_7;
      }
      if (a5) {
        +[UIColor _accessibilityButtonShapesBackgroundColorOnDark];
      }
      else {
        +[UIColor _accessibilityButtonShapesDisabledBackgroundColorOnDark];
      }
    }
    else if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      +[UIColor _accessibilityButtonShapesNoBlendModeBackgroundColorOnDark];
    }
    else
    {
      +[UIColor _accessibilityButtonShapesNoBlendModeBackgroundColorOnLight];
    }
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  v16 = v15;
  [v19 setTintColor:v15];

  uint64_t v17 = 100;
  if (a4) {
    uint64_t v17 = 101;
  }
  if (!v9) {
    uint64_t v17 = 0;
  }
  if (v13) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v17;
  }
LABEL_15:
  [v19 _setDrawsAsBackdropOverlayWithBlendMode:v18];
}

- (void)_sendSetNeedsLayoutToSuperviewOnTitleAnimationCompletionIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
  [WeakRetained setNeedsLayout];
}

- (CGRect)_selectedIndicatorBounds
{
  v13.receiver = self;
  v13.super_class = (Class)UINavigationButton;
  [(UIButton *)&v13 _selectedIndicatorBounds];
  double top = self->__additionalSelectionInsets.top;
  double left = self->__additionalSelectionInsets.left;
  double v6 = v5 + left;
  double v8 = v7 - (self->__additionalSelectionInsets.right + left);
  double v10 = v9 + top;
  double v12 = v11 - (top + self->__additionalSelectionInsets.bottom);
  result.size.height = v12;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)UINavigationButton;
  [(UIButton *)&v10 layoutSubviews];
  if ([(UINavigationButton *)self _wantsAccessibilityButtonShapes])
  {
    double v3 = [(UIButton *)self _titleView];
    [v3 frame];
    objc_msgSend(v3, "setFrame:");
    double v4 = [(UIButton *)self _backgroundView];
    if (v4)
    {
      int64_t barStyle = self->_barStyle;
      BOOL v6 = [(UIControl *)self isEnabled];
      BOOL v7 = [(UINavigationButton *)self _wantsAccessibilityButtonShapes];
      BOOL v8 = [(UINavigationButton *)self _wantsBlendModeForAccessibilityBackgrounds];
      double v9 = [(UINavigationButton *)self _accessibilityBackgroundTintColor];
      +[UINavigationButton _resetRenderingModesForBackgroundImageView:v4 inBarStyle:barStyle isEnabled:v6 withAccessibilityBackground:v7 wantsBlendModeForAccessibilityBackgrounds:v8 accessibilityBackgroundTintColor:v9];
    }
  }
}

- (void)_updateTitleColorsForState:(unint64_t)a3
{
  double v5 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:0];
  id v21 = v5;
  if (v5)
  {
    if (a3)
    {
      id v6 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:a3];
    }
    else
    {
      id v6 = v5;
    }
    double v11 = v6;
    double v12 = [v6 objectForKey:*(void *)off_1E52D2048];
    objc_super v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(UINavigationButton *)self _defaultTitleColorForState:a3 isTintColor:0];
    }
    id v15 = v14;

    [(UIButton *)self setTitleColor:v15 forState:a3];
    v16 = [v11 objectForKey:*(void *)off_1E52D2238];
    uint64_t v17 = v16;
    if (v16) {
      [v16 shadowColor];
    }
    else {
    uint64_t v18 = [(UINavigationButton *)self _defaultTitleShadowColorForState:a3];
    }
    [(UIButton *)self setTitleShadowColor:v18 forState:a3];
    BOOL v19 = [(UIControl *)self isEnabled];
    uint64_t v20 = 2;
    if (v19) {
      uint64_t v20 = 0;
    }
    if (v20 == a3) {
      [(UINavigationButton *)self _updateShadowOffsetWithAttributes:v11 forState:a3];
    }
  }
  else
  {
    BOOL v7 = [(UINavigationButton *)self _defaultTitleColorForState:0 isTintColor:0];
    [(UIButton *)self setTitleColor:v7 forStates:0];

    BOOL v8 = [(UINavigationButton *)self _defaultTitleColorForState:2 isTintColor:0];
    [(UIButton *)self setTitleColor:v8 forStates:2];

    double v9 = [(UINavigationButton *)self _defaultTitleColorForState:8 isTintColor:0];
    [(UIButton *)self setTitleColor:v9 forStates:8];

    objc_super v10 = [(UINavigationButton *)self _defaultTitleColorForState:1 isTintColor:0];
    [(UIButton *)self setTitleColor:v10 forStates:1];

    double v11 = [(UINavigationButton *)self _defaultTitleColorForState:4 isTintColor:0];
    [(UIButton *)self setTitleColor:v11 forStates:4];
  }
}

- (int64_t)_barButtonItemStyle
{
  int v3 = dyld_program_sdk_at_least();
  int style = self->_style;
  int64_t v5 = v3 ^ 1u;
  if (style == 5) {
    int64_t v5 = 7;
  }
  if (style == 2) {
    return 2;
  }
  else {
    return v5;
  }
}

- (UIEdgeInsets)_buttonTitleEdgeInsets
{
  double v2 = 0.0;
  if (self->_barStyle) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.double left = v2;
  result.double top = v4;
  return result;
}

- (UIEdgeInsets)_pathTitleEdgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (UIEdgeInsets)_pathImageEdgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (id)_adjustedDefaultTitleFont
{
  double v3 = [(UINavigationButton *)self _activeVisualStyle];
  double v4 = objc_msgSend(v3, "buttonFontForStyle:", -[UINavigationButton _barButtonItemStyle](self, "_barButtonItemStyle"));
  double v5 = v4;
  if (self->_fontScaleAdjustment != 0.0)
  {
    [v4 pointSize];
    uint64_t v7 = [v5 fontWithSize:v6 * self->_fontScaleAdjustment];

    double v5 = (void *)v7;
  }

  return v5;
}

- (id)_customOrAccessibilityBackgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = -[_UIBarButtonItemAppearanceStorage backgroundImageForState:style:isMini:](self->_appearanceStorage, "backgroundImageForState:style:isMini:", a3, a4);
  BOOL v9 = [(UINavigationButton *)self _wantsAccessibilityButtonShapes];
  if (!a3 && v9)
  {
    uint64_t v10 = _UINavigationButtonAccessibilityBackground(0, v5);

    BOOL v8 = (void *)v10;
  }
  return v8;
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  if ([(UINavigationButton *)self _showsAccessibilityBackgroundWhenEnabled])
  {
    [(UINavigationButton *)self _updateStyle];
    [(UIButton *)self setNeedsLayout];
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)UINavigationButton;
  [(UIButton *)&v9 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  uint64_t v7 = [(UIView *)self _screen];
  uint64_t v8 = [v7 _userInterfaceIdiom];

  if (v8 != a3 && (a3 == 3 || v8 == 3))
  {
    [(UINavigationButton *)self _accessibilityButtonShapesParametersDidChange];
    [(UINavigationButton *)self _updateStyle];
  }
}

- (void)_updateStyle
{
  id v35 = [(UINavigationButton *)self _tintColor];
  int64_t v3 = [(UINavigationButton *)self _barButtonItemStyle];
  double v4 = [(UINavigationButton *)self _activeVisualStyle];
  BOOL v5 = [(UINavigationButton *)self _customOrAccessibilityBackgroundImageForState:0 style:v3 isMini:0];
  if (v5)
  {
    uint64_t v6 = [(UINavigationButton *)self _customOrAccessibilityBackgroundImageForState:0 style:v3 isMini:1];
    uint64_t v7 = (void *)v6;
    BOOL v8 = (*((unsigned char *)self + 808) & 3) == 1;
    BOOL v9 = v6 != 0;
    uint64_t v10 = v8 & v9;
    if (v8 && v9) {
      double v11 = (void *)v6;
    }
    else {
      double v11 = v5;
    }
    [(UIButton *)self setBackgroundImage:v11 forState:0];
    double v12 = [(UINavigationButton *)self _customOrAccessibilityBackgroundImageForState:1 style:v3 isMini:v10];
    objc_super v13 = [(UINavigationButton *)self _customOrAccessibilityBackgroundImageForState:2 style:v3 isMini:v10];
    [(UIButton *)self setBackgroundImage:v12 forState:1];
    [(UIButton *)self setBackgroundImage:v13 forState:2];
    [(UIButton *)self setAdjustsImageWhenHighlighted:v12 == 0];
    [(UIButton *)self setAdjustsImageWhenDisabled:0];
  }
  else
  {
    [(UIButton *)self setAdjustsImageWhenHighlighted:0];
    [(UIButton *)self setAdjustsImageWhenDisabled:0];
    [(UIButton *)self setBackgroundImage:0 forState:0];
    [(UIButton *)self setBackgroundImage:0 forState:1];
    [(UIButton *)self setBackgroundImage:0 forState:2];
  }
  [(UIButton *)self setTintColor:v35];
  id v14 = [(UINavigationButton *)self _defaultTitleColorForState:0 isTintColor:0];
  [(UIButton *)self _setImageColor:v14 forState:0];

  id v15 = [(UINavigationButton *)self _defaultTitleColorForState:2 isTintColor:0];
  [(UIButton *)self _setImageColor:v15 forState:2];

  v16 = [(UINavigationButton *)self _defaultTitleColorForState:8 isTintColor:0];
  [(UIButton *)self _setImageColor:v16 forState:8];

  appearanceStorage = self->_appearanceStorage;
  if ((*((unsigned char *)self + 808) & 3) == 1) {
    [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniTitlePositionOffset];
  }
  else {
  uint64_t v18 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage titlePositionOffset];
  }
  if (v18)
  {
    [(UINavigationButton *)self _buttonTitleEdgeInsets];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [v18 UIOffsetValue];
    -[UIButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", v20 + v28, v22 + v27, v24 - v28, v26 - v27);
  }
  [(UINavigationButton *)self _updateContentInsets];
  if (![(UIButton *)self _isTitleFrozen])
  {
    v29 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:0];
    v30 = [v29 objectForKey:*(void *)off_1E52D2040];

    if (v30)
    {
      [v30 pointSize];
      if (v31 == 0.0)
      {
        [v4 _legacyButtonFontSize];
        uint64_t v32 = objc_msgSend(v30, "fontWithSize:");

        v30 = (void *)v32;
      }
      [(UIButton *)self _setFont:v30];
    }
    else
    {
      v33 = [(UINavigationButton *)self _adjustedDefaultTitleFont];
      [(UIButton *)self _setFont:v33];

      self->_isFontScaleInvalid = 0;
    }
  }
  v34 = [(UINavigationButton *)self _defaultTitleColorForState:2 isTintColor:0];
  [(UIButton *)self setTitleColor:v34 forState:2];

  [(UINavigationButton *)self _updateTitleColorsForState:0];
  [(UINavigationButton *)self _updateTitleColorsForState:1];
  [(UINavigationButton *)self _updateTitleColorsForState:2];
  [(UINavigationButton *)self _updateTitleColorsForState:8];
  if (self->_minimumWidth > 0.0 || self->_maximumWidth > 0.0)
  {
    [(UIView *)self frame];
    -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    -[UIView frameForAlignmentRect:](self, "frameForAlignmentRect:");
    -[UIButton setFrame:](self, "setFrame:");
  }
  [(UIButton *)self setNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_setTitleFrozen:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UINavigationButton;
  -[UIButton _setTitleFrozen:](&v5, sel__setTitleFrozen_);
  if (!a3) {
    [(UINavigationButton *)self _updateStyle];
  }
}

- (UINavigationButton)initWithValue:(id)a3 width:(double)a4 style:(int)a5 barStyle:(int64_t)a6 possibleTitles:(id)a7 possibleSystemItems:(id)a8 tintColor:(id)a9 applyBezel:(BOOL)a10 forButtonItemStyle:(int64_t)a11
{
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (a6
    && !initWithValue_width_style_barStyle_possibleTitles_possibleSystemItems_tintColor_applyBezel_forButtonItemStyle____shadowColor)
  {
    double v21 = [[UIColor alloc] initWithWhite:0.0 alpha:0.35];
    double v22 = (void *)initWithValue_width_style_barStyle_possibleTitles_possibleSystemItems_tintColor_applyBezel_forButtonItemStyle____shadowColor;
    initWithValue_width_style_barStyle_possibleTitles_possibleSystemItems_tintColor_applyBezel_forButtonItemStyle____shadowColor = (uint64_t)v21;
  }
  v40.receiver = self;
  v40.super_class = (Class)UINavigationButton;
  double v23 = -[UIButton initWithFrame:](&v40, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v24 = v23;
  if (v23)
  {
    id v39 = v20;
    double v25 = [(UINavigationButton *)v23 _activeVisualStyle];
    double v26 = v25;
    if (a6) {
      [v25 _legacyButtonFontForStyle:a5];
    }
    else {
    double v27 = [v25 buttonFontForStyle:a5];
    }
    [(UIButton *)v24 _setFont:v27];

    [(UINavigationButton *)v24 _buttonTitleEdgeInsets];
    -[UIButton setTitleEdgeInsets:](v24, "setTitleEdgeInsets:");
    [(UIButton *)v24 setTitleShadowColor:initWithValue_width_style_barStyle_possibleTitles_possibleSystemItems_tintColor_applyBezel_forButtonItemStyle____shadowColor forStates:0];
    if (a6) {
      -[UIButton _setTitleShadowOffset:](v24, "_setTitleShadowOffset:", 0.0, -1.0);
    }
    [v26 buttonContentEdgeInsets];
    -[UIButton setContentEdgeInsets:](v24, "setContentEdgeInsets:");
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      [(UIButton *)v24 setTitle:v17 forStates:0];
    }
    else {
      [(UIButton *)v24 setImage:v17 forStates:0];
    }
    [(UIButton *)v24 setContentHorizontalAlignment:0];
    [(UIButton *)v24 setContentVerticalAlignment:0];
    [(UIButton *)v24 setAdjustsImageWhenHighlighted:0];
    [(UIButton *)v24 setAdjustsImageWhenDisabled:0];
    [(UIButton *)v24 setDisabledDimsImage:0];
    v24->_int style = a5;
    v24->_int64_t barStyle = a6;
    uint64_t v29 = [v18 copy];
    possibleTitles = v24->_possibleTitles;
    v24->_possibleTitles = (NSSet *)v29;

    uint64_t v31 = [v19 copy];
    possibleSystemItems = v24->_possibleSystemItems;
    v24->_possibleSystemItems = (NSSet *)v31;

    objc_storeStrong((id *)&v24->_navigationBarTintColor, a9);
    v24->_buttonItemStyle = a11;
    [(UINavigationButton *)v24 _updateStyle];
    -[UINavigationButton sizeThatFits:](v24, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    -[UINavigationButton _setFrame:deferLayout:](v24, "_setFrame:deferLayout:", 1, 0.0, 0.0, v33, v34);
    id v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v24 selector:sel__accessibilityButtonShapesDidChangeNotification_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

    v36 = [(UIView *)v24 layer];
    [v36 setAllowsGroupBlending:(isKindOfClass & 1) == 0];

    v37 = [(UIView *)v24 layer];
    [v37 setAllowsGroupOpacity:0];

    [(UINavigationButton *)v24 setPointerInteractionEnabled:_UIUseModernBars()];
    id v20 = v39;
  }

  return v24;
}

- (UINavigationButton)initWithValue:(id)a3 width:(double)a4 style:(int)a5 barStyle:(int64_t)a6 possibleTitles:(id)a7 tintColor:(id)a8
{
  LOBYTE(v9) = 0;
  return [(UINavigationButton *)self initWithValue:a3 width:*(void *)&a5 style:a6 barStyle:a7 possibleTitles:0 possibleSystemItems:a8 tintColor:a4 applyBezel:v9 forButtonItemStyle:0];
}

- (UINavigationButton)initWithTitle:(id)a3
{
  return [(UINavigationButton *)self initWithValue:a3 width:0 style:0 barStyle:0 possibleTitles:0 tintColor:0.0];
}

- (UINavigationButton)initWithTitle:(id)a3 style:(int)a4
{
  return [(UINavigationButton *)self initWithValue:a3 width:*(void *)&a4 style:0 barStyle:0 possibleTitles:0 tintColor:0.0];
}

- (UINavigationButton)initWithTitle:(id)a3 possibleTitles:(id)a4 style:(int)a5
{
  return [(UINavigationButton *)self initWithValue:a3 width:*(void *)&a5 style:0 barStyle:a4 possibleTitles:0 tintColor:0.0];
}

- (UINavigationButton)initWithImage:(id)a3 width:(double)a4 style:(int)a5 applyBezel:(BOOL)a6 forBarStyle:(int64_t)a7 buttonItemStyle:(int64_t)a8
{
  LOBYTE(v9) = a6;
  return [(UINavigationButton *)self initWithValue:a3 width:*(void *)&a5 style:a7 barStyle:0 possibleTitles:0 possibleSystemItems:0 tintColor:a4 applyBezel:v9 forButtonItemStyle:a8];
}

- (UINavigationButton)initWithImage:(id)a3 width:(double)a4 style:(int)a5
{
  return [(UINavigationButton *)self initWithValue:a3 width:*(void *)&a5 style:0 barStyle:0 possibleTitles:0 tintColor:a4];
}

- (UINavigationButton)initWithImage:(id)a3
{
  return [(UINavigationButton *)self initWithValue:a3 width:0 style:0 barStyle:0 possibleTitles:0 tintColor:0.0];
}

- (UINavigationButton)initWithImage:(id)a3 style:(int)a4
{
  return [(UINavigationButton *)self initWithValue:a3 width:*(void *)&a4 style:0 barStyle:0 possibleTitles:0 tintColor:0.0];
}

- (void)dealloc
{
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UINavigationButton;
  [(UIButton *)&v4 dealloc];
}

- (BOOL)_isModernButton
{
  return 1;
}

- (NSString)title
{
  return [(UIButton *)self titleForState:0];
}

- (void)setTitle:(id)a3
{
  [(UIButton *)self setTitle:a3 forStates:0];
  objc_super v4 = [(UIView *)self window];
  if (v4)
  {
  }
  else if (+[UIView areAnimationsEnabled])
  {
    return;
  }
  [(UIView *)self layoutBelowIfNeeded];
}

- (UIImage)image
{
  return [(UIButton *)self imageForState:0];
}

- (void)setImage:(id)a3
{
  [(UIButton *)self setImage:a3 forStates:0];
  if ([(UINavigationButton *)self style] != 1)
  {
    [(UINavigationButton *)self _updateContentInsets];
  }
}

- (BOOL)contentsEqualTo:(id)a3 withStyle:(int)a4
{
  id v6 = a3;
  if (v6 && self->_style == a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(UINavigationButton *)self title];
      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      uint64_t v7 = [(UINavigationButton *)self image];
      char v8 = [v6 isEqual:v7];
    }
    BOOL v9 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  int64_t v3 = self;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (double *)MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v6 = [(UINavigationButton *)self title];
  uint64_t v7 = [(UINavigationButton *)v3 image];
  uint64_t v8 = [(UINavigationButton *)v3 _barButtonItemStyle];
  v100 = [(UINavigationButton *)v3 _activeVisualStyle];
  v102 = v3;
  if (v6)
  {
    BOOL v9 = [(_UIBarItemAppearanceStorage *)v3->_appearanceStorage textAttributesForState:0];
    uint64_t v10 = [v9 objectForKey:*(void *)off_1E52D2040];

    obuint64_t j = [(UINavigationButton *)v3 _adjustedDefaultTitleFont];
    double v11 = obj;
    v97 = v7;
    if (v10 && ([(NSSet *)v10 pointSize], double v11 = v10, v12 == 0.0))
    {
      objc_super v13 = [(_UIBarButtonItemAppearanceStorage *)v3->_appearanceStorage anyBackgroundImage];
      if (v13) {
        [v100 _legacyButtonFontSize];
      }
      else {
        [v100 buttonFontSize];
      }
      -[NSSet fontWithSize:](v10, "fontWithSize:");
      id v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = v11;
    }
    uint64_t v96 = v8;
    v98 = v6;
    objc_msgSend(v6, "_legacy_sizeWithFont:", v14);
    double v18 = v30;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    uint64_t v31 = v3->_possibleTitles;
    uint64_t v32 = [(NSSet *)v31 countByEnumeratingWithState:&v108 objects:v113 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v109;
      v99 = v14;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v109 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          v37 = v14;
          if (!v10 && [(NSDictionary *)v3->_stylesForSizingTitles count])
          {
            v38 = [(NSDictionary *)v3->_stylesForSizingTitles objectForKey:v36];
            id v39 = v38;
            if (v38)
            {
              objc_super v40 = v31;
              objc_msgSend(v100, "buttonFontForStyle:", objc_msgSend(v38, "integerValue"));
              v41 = (NSSet *)objc_claimAutoreleasedReturnValue();

              if (v3->_fontScaleAdjustment <= 0.0)
              {
                v37 = v41;
              }
              else
              {
                [(NSSet *)v41 pointSize];
                v37 = [(NSSet *)v41 fontWithSize:v42 * v3->_fontScaleAdjustment];
              }
              uint64_t v31 = v40;
              uint64_t v10 = 0;
              id v14 = v99;
            }
          }
          objc_msgSend(v36, "_legacy_sizeWithFont:", v37);
          if (v43 > v18) {
            double v18 = v43;
          }
        }
        uint64_t v33 = [(NSSet *)v31 countByEnumeratingWithState:&v108 objects:v113 count:16];
      }
      while (v33);
    }

    uint64_t v7 = v97;
    id v6 = v98;
    uint64_t v8 = v96;
LABEL_39:

    goto LABEL_40;
  }
  if (v7)
  {
    BOOL v15 = _AXSEnhanceTextLegibilityEnabled() != 0;
    v16 = [(UIView *)v3 traitCollection];
    [v7 _sizeWithHairlineThickening:v15 forTraitCollection:v16];
    double v18 = v17;
    double v5 = v19;
  }
  else
  {
    double v18 = *v4;
  }
  if ([(NSSet *)v3->_possibleSystemItems count])
  {
    uint64_t v10 = [(UIView *)v3 traitCollection];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    obuint64_t j = v3->_possibleSystemItems;
    uint64_t v20 = [(NSSet *)obj countByEnumeratingWithState:&v104 objects:v112 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v105;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v105 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = [*(id *)(*((void *)&v104 + 1) + 8 * j) unsignedIntegerValue];
          id v103 = 0;
          BYTE1(v95) = 1;
          LOBYTE(v95) = (*((unsigned char *)v102 + 808) & 3) == 1;
          +[UIBarButtonItem _getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:usingSystemItem:usingItemStyle:](UIBarButtonItem, "_getSystemItemStyle:title:image:selectedImage:action:forBarStyle:landscape:alwaysBordered:usingSystemItem:usingItemStyle:", 0, 0, &v103, 0, 0, v102->_barStyle, v95, v24, v8);
          id v25 = v103;
          [v25 _sizeWithHairlineThickening:_AXSEnhanceTextLegibilityEnabled() != 0 forTraitCollection:v10];
          double v27 = v26;
          double v29 = v28;

          double v18 = fmax(v18, v27);
          double v5 = fmax(v5, v29);
        }
        uint64_t v21 = [(NSSet *)obj countByEnumeratingWithState:&v104 objects:v112 count:16];
      }
      while (v21);
      int64_t v3 = v102;
      id v6 = 0;
    }
    goto LABEL_39;
  }
LABEL_40:
  v44 = [(_UIBarButtonItemAppearanceStorage *)v3->_appearanceStorage backgroundImageForState:0 style:v8 isMini:(*((unsigned char *)v3 + 808) & 3) == 1];
  if (!v44)
  {
    if ((*((unsigned char *)v3 + 808) & 3) == 1)
    {
      v44 = [(_UIBarButtonItemAppearanceStorage *)v3->_appearanceStorage backgroundImageForState:0 style:v8 isMini:0];
    }
    else
    {
      v44 = 0;
    }
  }
  int v45 = [(UINavigationButton *)v3 style];
  v46 = v3;
  char v47 = *((unsigned char *)v3 + 808);
  BOOL v48 = [(UINavigationButton *)v46 _wantsAccessibilityButtonShapes];
  id v49 = v44;
  id v50 = v100;
  v51 = v50;
  if (v49)
  {
    [v49 capInsets];
    if (v48) {
      double v54 = 6.0;
    }
    else {
      double v54 = v53;
    }
    if (v48) {
      double v55 = 6.0;
    }
    else {
      double v55 = v52;
    }
    [v49 alignmentRectInsets];
    double v57 = v56;
    double v59 = v58;
    if (v7)
    {
      [v51 _legacyButtonImagePadding];
LABEL_58:
      double v61 = fmax(v55 - v57, v60 * 0.5) + fmax(v54 - v59, v60 * 0.5);
      if (v45 == 1 && v49) {
        double v61 = v61 + -1.0;
      }
      goto LABEL_69;
    }
    [v51 _legacyLeftTitleMargin];
    double v63 = v62;
    [v51 _legacyRightTitleMargin];
  }
  else
  {
    double v57 = 0.0;
    if (v48) {
      double v55 = 6.0;
    }
    else {
      double v55 = 0.0;
    }
    if (v7)
    {
      [v50 buttonImagePadding];
      double v54 = v55;
      double v59 = 0.0;
      goto LABEL_58;
    }
    if (v45 == 1) {
      [v50 leftBackTitleMargin];
    }
    else {
      [v50 leftTitleMargin];
    }
    double v63 = v65;
    [v51 rightTitleMargin];
    double v54 = v55;
    double v59 = 0.0;
  }
  double v61 = fmax(v55 - v57, v63) + fmax(v54 - v59, v64);
  [v51 minBackTextWidth];
  if (v18 < v66)
  {
    [v51 minBackTextWidth];
    double v18 = v67;
  }
LABEL_69:
  [v51 buttonHeight];
  double v69 = v68;
  if (v49)
  {
    [v49 alignmentRectInsets];
    double v71 = v70;
    double v73 = v72;
    [v49 size];
    double v75 = fmax(v69, v74 - (v71 + v73));
  }
  else
  {
    if (v48)
    {
      v76 = _UINavigationButtonAccessibilityBackground(0, (v47 & 3) == 1);
      [v76 size];
      double v69 = v77;
    }
    double v78 = fmax(v69, v5);
    if (v7) {
      double v75 = v78;
    }
    else {
      double v75 = v69;
    }
  }
  double v79 = ceil(v61 + v18);

  double height = v102->_boundsAdjustment.height;
  double v81 = fmax(v102->_minimumWidth, v79 - v102->_boundsAdjustment.width);
  double maximumWidth = v102->_maximumWidth;
  double v83 = fmin(maximumWidth, v81);
  if (maximumWidth <= 0.0) {
    double v84 = v81;
  }
  else {
    double v84 = v83;
  }
  [(UIButton *)v102 alignmentRectInsets];
  double v86 = v85;
  double v88 = v87;
  double v90 = v89;
  double v92 = v91;

  double v93 = v84 + v88 + v92;
  double v94 = v75 - height + v86 + v90;
  result.double height = v94;
  result.width = v93;
  return result;
}

- (void)setStyle:(int)a3
{
  if (self->_style != a3
    || ([(UIButton *)self backgroundImageForState:0],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_int style = a3;
    [(UINavigationButton *)self _updateStyle];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationButton;
  -[UIButton setHighlighted:](&v13, sel_setHighlighted_);
  double v5 = [(UINavigationButton *)self originatingNavigationItem];
  id v6 = [v5 navigationBar];
  BOOL v7 = [(UIControl *)self isHighlighted];
  uint64_t v8 = [(UINavigationButton *)self originatingButtonItem];
  [v6 _evaluateBackIndicatorForHilightedState:v7 ofBarButtonItem:v8 inNavigationItem:v5];

  BOOL v9 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:0];
  uint64_t v10 = v9;
  if (v9)
  {
    if (v3)
    {
      id v11 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:1];
    }
    else
    {
      id v11 = v9;
    }
    double v12 = v11;
    [(UINavigationButton *)self _updateShadowOffsetWithAttributes:v11 forState:v3];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIControl *)self isEnabled];
  v17.receiver = self;
  v17.super_class = (Class)UINavigationButton;
  [(UIButton *)&v17 setEnabled:v3];
  id v6 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:0];
  if (v6)
  {
    BOOL v7 = [(UIControl *)self isHighlighted];
    uint64_t v8 = 2;
    if (v3) {
      uint64_t v8 = 0;
    }
    if (v7) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    if (v7 || !v3)
    {
      id v10 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:v9];
    }
    else
    {
      id v10 = v6;
    }
    id v11 = v10;
    [(UINavigationButton *)self _updateShadowOffsetWithAttributes:v10 forState:v9];
  }
  BOOL v12 = (unint64_t)(self->_barStyle - 1) > 1 || v5 == v3;
  if (!v12 && [(UINavigationButton *)self _wantsAccessibilityButtonShapes])
  {
    objc_super v13 = [(UIButton *)self _backgroundView];
    if (v13)
    {
      int64_t barStyle = self->_barStyle;
      BOOL v15 = [(UINavigationButton *)self _wantsBlendModeForAccessibilityBackgrounds];
      v16 = [(UINavigationButton *)self _accessibilityBackgroundTintColor];
      +[UINavigationButton _resetRenderingModesForBackgroundImageView:v13 inBarStyle:barStyle isEnabled:v3 withAccessibilityBackground:1 wantsBlendModeForAccessibilityBackgrounds:v15 accessibilityBackgroundTintColor:v16];
    }
  }
}

- (void)setControlSize:(int)a3
{
  char v3 = *((unsigned char *)self + 808);
  if ((v3 & 3) != a3)
  {
    *((unsigned char *)self + 808) = v3 & 0xFC | a3 & 3;
    [(UINavigationButton *)self _updateStyle];
  }
}

- (int)controlSize
{
  return *((unsigned char *)self + 808) & 3;
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3
    || ([(UIButton *)self backgroundImageForState:0],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_int64_t barStyle = a3;
    [(UINavigationButton *)self _updateStyle];
  }
}

- (void)setNavigationBarTintColor:(id)a3
{
  BOOL v5 = (UIColor *)a3;
  if (self->_navigationBarTintColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_navigationBarTintColor, a3);
    [(UINavigationButton *)self _updateStyle];
    BOOL v5 = v6;
  }
}

- (BOOL)_canHandleStatusBarTouchAtLocation:(CGPoint)a3
{
  return 1;
}

- (void)_adjustBounds
{
  [(UIView *)self bounds];
  -[UIButton setBounds:](self, "setBounds:");
}

- (void)_setFrame:(CGRect)a3 deferLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v11 = v10;
  double v13 = v12;
  v18.receiver = self;
  v18.super_class = (Class)UINavigationButton;
  -[UIButton _setFrame:deferLayout:](&v18, sel__setFrame_deferLayout_, v4, x, y, width, height);
  if (width != v11 || height != v13) {
    [(UINavigationButton *)self _adjustBounds];
  }
  uint64_t v15 = [(UINavigationButton *)self image];
  if (v15)
  {
    v16 = (void *)v15;
    int v17 = [(UINavigationButton *)self style];

    if (v17 != 1) {
      [(UINavigationButton *)self _updateContentInsets];
    }
  }
}

- (void)_setBoundsAdjustment:(CGSize)a3
{
  if (a3.width != self->_boundsAdjustment.width || a3.height != self->_boundsAdjustment.height)
  {
    self->_boundsAdjustment = a3;
    [(UINavigationButton *)self _adjustBounds];
  }
}

- (void)_updateContentInsets
{
  id v17 = [(UINavigationButton *)self _activeVisualStyle];
  int v3 = [(UINavigationButton *)self style];
  BOOL v4 = [(UINavigationButton *)self image];
  BOOL v5 = v4;
  if (v3 == 1)
  {

    [v17 leftBackTitleMargin];
    double v7 = v6;
    [v17 rightTitleMargin];
    double v9 = v7 + 1.0;
    double v10 = v7 + -2.0;
    if (v5) {
      double v11 = v8;
    }
    else {
      double v11 = v8 + -1.0;
    }
    if (v5) {
      double v9 = v10;
    }
  }
  else
  {
    if (v4)
    {
      [v17 buttonImagePadding];
      double v13 = v12;
      [(UIView *)self bounds];
      double v15 = v14;
      [v5 size];
      double v11 = floor(fmin(v13, v15 - v16) * 0.5);
    }
    else
    {
      double v11 = 0.0;
    }

    double v9 = v11;
  }
  -[UIButton setContentEdgeInsets:](self, "setContentEdgeInsets:", 0.0, v9, 0.0, v11);
}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 barMetrics:(int64_t)a6
{
  id v10 = a3;
  if ((unint64_t)(a6 - 101) <= 1)
  {
    if (_UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn) {
      goto LABEL_30;
    }
    _UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn = 1;
    id v25 = v10;
    NSLog(&cfstr_SCustomization.isa, "UIBarButtonItem", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    goto LABEL_29;
  }
  appearanceStorage = self->_appearanceStorage;
  if (v10)
  {
    id v25 = v10;
    if (!appearanceStorage)
    {
      double v12 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      double v13 = self->_appearanceStorage;
      self->_appearanceStorage = v12;

      id v10 = v25;
    }
    id v14 = v10;
    if (([v14 _isResizable] & 1) == 0)
    {
      [v14 size];
      double v16 = floor(v15 * 0.5);
      uint64_t v17 = objc_msgSend(v14, "resizableImageWithCapInsets:", 0.0, v16, 0.0, v15 - v16 + -1.0);

      id v14 = (id)v17;
    }
  }
  else
  {
    if (!appearanceStorage) {
      goto LABEL_30;
    }
    id v25 = 0;
    id v14 = 0;
  }
  objc_super v18 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage anyBackgroundImage];

  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    unint64_t v19 = 1;
  }
  else {
    unint64_t v19 = a4;
  }
  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundImageForState:v19 style:a5 isMini:a6 == 1];
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 != v14)
  {
    [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackgroundImage:v14 forState:v19 style:a5 isMini:a6 == 1];
LABEL_16:
    [(UINavigationButton *)self _updateStyle];
    if (_AXSButtonShapesEnabled()
      && objc_msgSend(-[UIView _screen](self, "_screen"), "_userInterfaceIdiom") != 3)
    {
      uint64_t v21 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage anyBackgroundImage];
      if ((v18 == 0) == (v21 != 0))
      {
        BOOL createdByBarButtonItem = self->_createdByBarButtonItem;

        if (createdByBarButtonItem) {
          [(UIButton *)self setNeedsLayout];
        }
      }
      else
      {
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
    [WeakRetained setNeedsLayout];

    goto LABEL_28;
  }
  if ((a6 == 1) != ([(UINavigationButton *)self controlSize] != 1)
    && (a5 == 8 || [(UINavigationButton *)self _buttonItemStyle] == a5))
  {
    id v22 = [(UIButton *)self backgroundImageForState:a4];

    if (v22 != v14) {
      goto LABEL_16;
    }
  }
LABEL_28:

LABEL_29:
  id v10 = v25;
LABEL_30:
}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
}

- (id)_backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) > 1)
  {
    int64_t v8 = [(UINavigationButton *)self _barButtonItemStyle];
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = a3;
    }
    BOOL v4 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundImageForState:v9 style:v8 isMini:a4 == 1];
  }
  else
  {
    if ((_backgroundImageForState_barMetrics__didWarn & 1) == 0)
    {
      _backgroundImageForState_barMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, a3, "UIBarButtonItem", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    BOOL v4 = 0;
  }
  return v4;
}

- (void)_UIAppearance_setTintColor:(id)a3
{
  id v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  id v9 = v4;
  if (v4)
  {
    if (!appearanceStorage)
    {
      double v6 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      double v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  id v8 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage tintColor];

  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setTintColor:v9];
  if (v8 != v9) {
    [(UINavigationButton *)self _updateStyle];
  }
LABEL_7:
}

- (UIColor)_tintColor
{
  return [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage tintColor];
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (v6)
  {
    if (!appearanceStorage)
    {
      id v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      id v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;
    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  uint64_t v10 = objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");

  if (os_variant_has_internal_diagnostics())
  {
    if (a4 >= 3)
    {
      uint64_t v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        int v19 = 134217984;
        unint64_t v20 = a4;
        _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted and UIControlStateDisabled. state = %ld is interpreted as UIControlStateHighlighted.", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else if (a4 >= 3)
  {
    objc_super v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIAppearance_setTitleTextAttributes_forState____s_category)+ 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 134217984;
      unint64_t v20 = a4;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted and UIControlStateDisabled. state = %ld is interpreted as UIControlStateHighlighted.", (uint8_t *)&v19, 0xCu);
    }
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = a4;
  }
  uint64_t v12 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:v11];
  if (v10 | v12 && ([(id)v10 isEqualToDictionary:v12] & 1) == 0)
  {
    [(_UIBarItemAppearanceStorage *)self->_appearanceStorage setTextAttributes:v10 forState:v11];
    if (!v11)
    {
      uint64_t v13 = *(void *)off_1E52D2040;
      uint64_t v14 = [(id)v10 objectForKey:*(void *)off_1E52D2040];
      uint64_t v15 = [(id)v12 objectForKey:v13];
      if (v14 | v15)
      {
        if (([(id)v14 isEqual:v15] & 1) == 0)
        {
          [(UIView *)self sizeToFit];
          id WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
          [WeakRetained setNeedsLayout];
        }
      }
    }
    [(UINavigationButton *)self _updateStyle];
  }
}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    if (a3 >= 3)
    {
      id v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v10 = 134217984;
        unint64_t v11 = a3;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted and UIControlStateDisabled. state = %ld is interpreted as UIControlStateHighlighted.", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else if (a3 >= 3)
  {
    id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_titleTextAttributesForState____s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      unint64_t v11 = a3;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "button text attributes only respected for UIControlStateNormal, UIControlStateHighlighted and UIControlStateDisabled. state = %ld is interpreted as UIControlStateHighlighted.", (uint8_t *)&v10, 0xCu);
    }
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = a3;
  }
  id v6 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:v5];
  return v6;
}

- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  appearanceStorage = self->_appearanceStorage;
  if (a3 != 0.0 || appearanceStorage != 0)
  {
    if (!appearanceStorage)
    {
      id v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      int v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;

      appearanceStorage = self->_appearanceStorage;
    }
    [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backgroundVerticalAdjustmentForBarMetrics:a4];
    if (v11 != a3)
    {
      [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackgroundVerticalAdjustment:a4 forBarMetrics:a3];
      id WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
      [WeakRetained setNeedsLayout];
    }
  }
}

- (double)_backgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3
{
  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundVerticalAdjustmentForBarMetrics:a3];
  return result;
}

- (BOOL)_hasBaselineAlignedAbsoluteVerticalPosition:(double *)a3 withinNavBar:(id)a4 forSize:(CGSize)a5
{
  id v7 = a4;
  id v8 = [(UINavigationButton *)self title];

  if (v8)
  {
    id v9 = [v7 _currentVisualStyle];
    [(UIView *)self layoutBelowIfNeeded];
    int v10 = [(UIButton *)self titleLabel];
    [v10 frame];
    double MaxY = CGRectGetMaxY(v19);
    [v10 _baselineOffsetFromBottom];
    double v13 = v12;
    uint64_t v14 = [v7 _contentView];
    [v14 bounds];
    double Height = CGRectGetHeight(v20);
    [v9 navigationItemBaselineOffset];
    double v17 = v16;

    if (a3) {
      *a3 = Height - v17 - (MaxY - v13);
    }
  }
  return v8 != 0;
}

- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) <= 1)
  {
    if ((_UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn & 1) == 0)
    {
      _UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, a3.horizontal, a3.vertical, "UIBarButtonItem", @"button title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    return;
  }
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    if (a3.horizontal == 0.0 && a3.vertical == 0.0) {
      return;
    }
    id v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    int v10 = self->_appearanceStorage;
    self->_appearanceStorage = v9;

    appearanceStorage = self->_appearanceStorage;
  }
  if (a4 == 1) {
    [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniTitlePositionOffset];
  }
  else {
  double v11 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage titlePositionOffset];
  }
  double v12 = v11;
  if (v11)
  {
    [v11 UIOffsetValue];
  }
  else
  {
    double v13 = 0.0;
    double v14 = 0.0;
  }
  if (horizontal != v13 || vertical != v14)
  {
    uint64_t v15 = self->_appearanceStorage;
    if (a4 == 1)
    {
      *(double *)objc_super v18 = horizontal;
      *(double *)&v18[1] = vertical;
      double v16 = [MEMORY[0x1E4F29238] valueWithBytes:v18 objCType:"{UIOffset=dd}"];
      [(_UIBarButtonItemAppearanceStorage *)v15 setMiniTitlePositionOffset:v16];
    }
    else
    {
      *(double *)double v17 = horizontal;
      *(double *)&v17[1] = vertical;
      double v16 = [MEMORY[0x1E4F29238] valueWithBytes:v17 objCType:"{UIOffset=dd}"];
      [(_UIBarButtonItemAppearanceStorage *)v15 setTitlePositionOffset:v16];
    }

    [(UINavigationButton *)self _updateStyle];
  }
}

- (UIOffset)_titlePositionAdjustmentForBarMetrics:(int64_t)a3
{
  if ((unint64_t)(a3 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (a3 == 1) {
      [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniTitlePositionOffset];
    }
    else {
    id v6 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage titlePositionOffset];
    }
    id v7 = v6;
    if (v6)
    {
      [v6 UIOffsetValue];
      double v3 = v8;
      double v4 = v9;
    }
    else
    {
      double v3 = 0.0;
      double v4 = 0.0;
    }
  }
  else
  {
    double v3 = 0.0;
    if ((_titlePositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      _titlePositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, "UIBarButtonItem", @"button title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    double v4 = 0.0;
  }
  double v10 = v3;
  double v11 = v4;
  result.double vertical = v11;
  result.double horizontal = v10;
  return result;
}

- (void)_applyBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (v6) {
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, v6, (void *)1);
  }
  if (v22)
  {
    int64_t v7 = [(UINavigationButton *)self _barButtonItemStyle];
    uint64_t v8 = [v22 backgroundImageForState:0 style:v7 isMini:0];
    double v9 = [v22 backgroundImageForState:1 style:v7 isMini:0];
    CGRect v20 = [v22 backgroundImageForState:2 style:v7 isMini:0];
    double v10 = [v22 backgroundImageForState:0 style:v7 isMini:1];
    double v11 = [v22 backgroundImageForState:1 style:v7 isMini:1];
    double v12 = [v22 backgroundImageForState:2 style:v7 isMini:1];
    double v13 = [v22 textAttributesForState:0];
    double v14 = [v22 textAttributesForState:1];
    uint64_t v21 = (void *)v8;
    if (!v6)
    {
      TagAttributeForAxes(self, v8, sel_setBackgroundImage_forState_barMetrics_, 0, 0);
      TagAttributeForAxes(self, (uint64_t)v9, sel_setBackgroundImage_forState_barMetrics_, 1, 0);
      TagAttributeForAxes(self, (uint64_t)v20, sel_setBackgroundImage_forState_barMetrics_, 2, 0);
      TagAttributeForAxes(self, (uint64_t)v10, sel_setBackgroundImage_forState_barMetrics_, 0, 1);
      TagAttributeForAxes(self, (uint64_t)v11, sel_setBackgroundImage_forState_barMetrics_, 1, 1);
      TagAttributeForAxes(self, (uint64_t)v12, sel_setBackgroundImage_forState_barMetrics_, 2, 1);
      TagAttributeForAxes(self, (uint64_t)v13, sel_setTitleTextAttributes_forState_, 0, -1);
      TagAttributeForAxes(self, (uint64_t)v14, sel_setTitleTextAttributes_forState_, 1, -1);
    }
    [(UINavigationButton *)self _setBackgroundImage:v8 forState:0 style:v7 barMetrics:0];
    [(UINavigationButton *)self _setBackgroundImage:v9 forState:1 style:v7 barMetrics:0];
    [(UINavigationButton *)self _setBackgroundImage:v20 forState:2 style:v7 barMetrics:0];
    [(UINavigationButton *)self _setBackgroundImage:v10 forState:0 style:v7 barMetrics:1];
    [(UINavigationButton *)self _setBackgroundImage:v11 forState:1 style:v7 barMetrics:1];
    [(UINavigationButton *)self _setBackgroundImage:v12 forState:2 style:v7 barMetrics:1];
    [(UINavigationButton *)self _setTitleTextAttributes:v13 forState:0];
    [(UINavigationButton *)self _setTitleTextAttributes:v14 forState:1];
    uint64_t v15 = [v22 textAttributesForState:2];
    [(UINavigationButton *)self _setTitleTextAttributes:v15 forState:2];

    double v16 = [v22 tintColor];
    [(UINavigationButton *)self _setTintColor:v16];

    double v17 = [v22 titlePositionOffset];
    objc_super v18 = v17;
    if (v17)
    {
      [v17 UIOffsetValue];
      -[UINavigationButton _setTitlePositionAdjustment:forBarMetrics:](self, "_setTitlePositionAdjustment:forBarMetrics:", 0);
    }
    CGRect v19 = [v22 miniTitlePositionOffset];

    if (v19)
    {
      [v19 UIOffsetValue];
      -[UINavigationButton _setTitlePositionAdjustment:forBarMetrics:](self, "_setTitlePositionAdjustment:forBarMetrics:", 1);
    }
    [v22 backgroundVerticalAdjustmentForBarMetrics:0];
    -[UINavigationButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 0);
    [v22 backgroundVerticalAdjustmentForBarMetrics:1];
    -[UINavigationButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 1);
    [v22 backgroundVerticalAdjustmentForBarMetrics:101];
    -[UINavigationButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 101);
    [v22 backgroundVerticalAdjustmentForBarMetrics:102];
    -[UINavigationButton _setBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackgroundVerticalPositionAdjustment:forBarMetrics:", 102);
  }
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (void)_setGroupName:(id)a3 forNavigationBar:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int64_t v7 = [(UIButton *)self _contentBackdropView];
  uint64_t v8 = v7;
  if (v10)
  {
    double v9 = [NSString stringWithFormat:@"%p-%@", v6, v10];
    [v8 _setGroupName:v9];
  }
  else
  {
    [v7 _setGroupName:0];
  }
}

- (int64_t)_activeBarMetrics
{
  return (*((unsigned char *)self + 808) & 3) == 1;
}

- (id)_visualStyleForMetrics:(int64_t)a3
{
  if (qword_1EB25D788 != -1) {
    dispatch_once(&qword_1EB25D788, &__block_literal_global_52);
  }
  unint64_t v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == -1)
  {
    int64_t v7 = +[UIDevice currentDevice];
    uint64_t v6 = [v7 userInterfaceIdiom];
  }
  uint64_t v8 = [NSNumber numberWithInteger:(a3 << 8) + 16 * v6];
  double v9 = [(id)_MergedGlobals_19_1 objectForKeyedSubscript:v8];
  if (!v9)
  {
    double v9 = +[_UINavigationBarVisualStyle visualStyleForIdiom:v6];
    [v9 setMetrics:a3];
    [(id)_MergedGlobals_19_1 setObject:v9 forKeyedSubscript:v8];
  }

  return v9;
}

void __45__UINavigationButton__visualStyleForMetrics___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)_MergedGlobals_19_1;
  _MergedGlobals_19_1 = v0;
}

- (int64_t)_externalDrawingStyleForState:(unint64_t)a3
{
  if (((a3 == 8) & [(UINavigationButton *)self _isCarPlaySystemTypeButton]) != 0) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)_activeVisualStyle
{
  int64_t v3 = [(UINavigationButton *)self _activeBarMetrics];
  return [(UINavigationButton *)self _visualStyleForMetrics:v3];
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  double v2 = self;
  int64_t v3 = [(UIView *)self _focusBehavior];
  LOBYTE(v2) = [v3 controlCanBecomeFocused:v2];

  return (char)v2;
}

- (BOOL)_isExternalRoundedRectButton
{
  double v2 = [(UIView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 3;

  return v3;
}

- (id)_externalUnfocusedBorderColor
{
  return +[UIColor _externalBarBackgroundColor];
}

- (void)_uinavigationbar_prepareToAppearInNavigationItem:(id)a3 onLeft:(BOOL)a4
{
  BOOL v4 = a4;
  [(UINavigationButton *)self setOriginatingNavigationItem:a3];
  if ([(NSSet *)self->_possibleTitles count] || [(NSSet *)self->_possibleSystemItems count])
  {
    if ([(UINavigationButton *)self _wantsAccessibilityButtonShapes])
    {
      uint64_t v6 = 0;
    }
    else if (((*((_DWORD *)&self->super.super.super._viewFlags + 4) >> 19) & 1) != v4)
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 2;
    }
    [(UIButton *)self setContentHorizontalAlignment:v6];
  }
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UINavigationButton;
  -[UIControl setPointerInteractionEnabled:](&v7, sel_setPointerInteractionEnabled_);
  uint64_t v5 = [(UIButton *)self pointerStyleProvider];
  if (a3 && v5 == 0) {
    uint64_t v6 = &__block_literal_global_65;
  }
  else {
    uint64_t v6 = (void *)v5;
  }
  [(UIButton *)self setPointerStyleProvider:v6];
}

id __51__UINavigationButton_setPointerInteractionEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = +[_UIPointerSettingsDomain rootSettings];
  objc_super v7 = [v6 searchBarSettings];

  uint64_t v8 = [v5 titleLabel];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [v4 preview];
  objc_super v18 = [v17 target];
  CGRect v19 = [v18 container];
  objc_msgSend(v5, "convertRect:toView:", v19, v10, v12, v14, v16);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  [v7 buttonMinimumHeight];
  double v29 = v28;
  if ([v7 useGenerousPadding]) {
    [v7 buttonGenerousPadding];
  }
  else {
    [v7 buttonTightPadding];
  }
  double v31 = (v29 - v27) * 0.5;
  if (v27 >= v29) {
    double v31 = 0.0;
  }
  double v32 = v23 - v31;
  if (v27 >= v29) {
    double v33 = v27;
  }
  else {
    double v33 = v29;
  }
  uint64_t v34 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v21 - v30, v32, v25 + v30 + v30, v33);
  id v35 = +[UIPointerStyle styleWithEffect:v4 shape:v34];

  return v35;
}

- (int64_t)_buttonItemStyle
{
  return self->_buttonItemStyle;
}

- (void)_setButtonItemStyle:(int64_t)a3
{
  self->_buttonItemStyle = a3;
}

- (NSDictionary)_stylesForSizingTitles
{
  return self->_stylesForSizingTitles;
}

- (void)_setStylesForSizingTitles:(id)a3
{
}

- (BOOL)_createdByBarButtonItem
{
  return self->_createdByBarButtonItem;
}

- (void)_setCreatedByBarButtonItem:(BOOL)a3
{
  self->_BOOL createdByBarButtonItem = a3;
}

- (BOOL)_isFontScaleInvalid
{
  return self->_isFontScaleInvalid;
}

- (void)_setFontScaleInvalid:(BOOL)a3
{
  self->_isFontScaleInvalid = a3;
}

- (double)_fontScaleAdjustment
{
  return self->_fontScaleAdjustment;
}

- (BOOL)_wantsBlendModeForAccessibilityBackgrounds
{
  return self->_wantsBlendModeForAccessibilityBackgrounds;
}

- (UIColor)_accessibilityBackgroundTintColor
{
  return self->_accessibilityBackgroundTintColor;
}

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (void)_setAppearanceGuideClass:(Class)a3
{
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double top = self->__additionalSelectionInsets.top;
  double left = self->__additionalSelectionInsets.left;
  double bottom = self->__additionalSelectionInsets.bottom;
  double right = self->__additionalSelectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3
{
  self->__additionalSelectionInsets = a3;
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (int)style
{
  return self->_style;
}

- (UIView)_enclosingBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__enclosingBar);
  return (UIView *)WeakRetained;
}

- (void)_setEnclosingBar:(id)a3
{
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (UINavigationItem)originatingNavigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatingNavigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (void)setOriginatingNavigationItem:(id)a3
{
}

- (UIBarButtonItem)originatingButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatingButtonItem);
  return (UIBarButtonItem *)WeakRetained;
}

- (void)setOriginatingButtonItem:(id)a3
{
}

- (BOOL)_barItemHidden
{
  return self->__barItemHidden;
}

- (void)_setBarItemHidden:(BOOL)a3
{
  self->__barItemHidden = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__enclosingBar);
  objc_storeStrong((id *)&self->_appearanceGuideClass, 0);
  objc_storeStrong((id *)&self->_accessibilityBackgroundTintColor, 0);
  objc_storeStrong((id *)&self->_stylesForSizingTitles, 0);
  objc_destroyWeak((id *)&self->_originatingNavigationItem);
  objc_destroyWeak((id *)&self->_originatingButtonItem);
  objc_storeStrong((id *)&self->_possibleSystemItems, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
}

@end