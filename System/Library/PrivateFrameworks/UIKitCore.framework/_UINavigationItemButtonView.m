@interface _UINavigationItemButtonView
- (BOOL)_showsAccessibilityBackgroundWhenEnabled;
- (BOOL)_suppressesBackIndicatorView;
- (BOOL)_useSilverLookForBarStyle:(int64_t)a3;
- (BOOL)_wantsAccessibilityButtonShapes;
- (BOOL)_wantsBlendModeForAccessibilityBackgrounds;
- (BOOL)canBecomeFocused;
- (BOOL)customBackgroundImageChangedToOrFromNil;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hasCustomBackgroundImage;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)pressed;
- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3;
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)_appearanceGuideClass;
- (UIColor)_accessibilityBackgroundTintColor;
- (UIColor)_tintColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIOffset)_backButtonTitlePositionAdjustmentForBarMetrics:(int64_t)a3;
- (_UINavigationItemButtonView)initWithFrame:(CGRect)a3;
- (_UINavigationItemButtonView)initWithNavigationItem:(id)a3;
- (double)_backButtonBackgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3;
- (double)_titleYAdjustmentCustomization;
- (id)_appearanceStorage;
- (id)_backButtonBackgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4;
- (id)_currentCustomBackgroundNeedsDarkening:(BOOL *)a3;
- (id)_currentTextColorForBarStyle:(int64_t)a3;
- (id)_currentTextShadowColorForBarStyle:(int64_t)a3;
- (id)_defaultFont;
- (id)_titleTextAttributesForState:(unint64_t)a3;
- (id)backgroundImageView;
- (id)image;
- (id)title;
- (unint64_t)_abbreviatedTitleIndex;
- (void)_UIAppearance_setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (void)_UIAppearance_setBackButtonBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setBackButtonTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setTintColor:(id)a3;
- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)_accessibilityButtonShapesParametersDidChange;
- (void)_applyBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4;
- (void)_backSelectGestureChanged:(id)a3;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_installBackSelectGestureRecognizer;
- (void)_resetRenderingModesForAccessibilityBackgrounds;
- (void)_setAbbreviatedTitleIndex:(unint64_t)a3;
- (void)_setAccessibilityBackgroundTintColor:(id)a3;
- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3;
- (void)_uninstallBackSelectGestureRecognizer;
- (void)_updateBackSelectGestureRecognizer;
- (void)backIndicatorViewHasRespondedToCustomBackgroundImageChange;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 initialPress:(BOOL)a4;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation _UINavigationItemButtonView

- (_UINavigationItemButtonView)initWithNavigationItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationItemButtonView;
  v3 = [(_UINavigationItemView *)&v5 initWithNavigationItem:a3];
  if (v3) {
    [(UILabel *)v3->super._label _setWantsUnderlineForAccessibilityButtonShapesEnabled:dyld_program_sdk_at_least()];
  }
  return v3;
}

- (void)_resetRenderingModesForAccessibilityBackgrounds
{
  backgroundImageView = self->_backgroundImageView;
  if (backgroundImageView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
    v4 = [WeakRetained _navigationBar];
    uint64_t v5 = [v4 _barStyle];
    BOOL v6 = [(_UINavigationItemButtonView *)self _wantsAccessibilityButtonShapes];
    BOOL v7 = [(_UINavigationItemButtonView *)self _wantsBlendModeForAccessibilityBackgrounds];
    v8 = [(_UINavigationItemButtonView *)self _accessibilityBackgroundTintColor];
    +[UINavigationButton _resetRenderingModesForBackgroundImageView:backgroundImageView inBarStyle:v5 isEnabled:1 withAccessibilityBackground:v6 wantsBlendModeForAccessibilityBackgrounds:v7 accessibilityBackgroundTintColor:v8];
  }
}

- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)a3
{
  BOOL v3 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0 && self->_wantsBlendModeForAccessibilityBackgrounds != v3)
  {
    self->_wantsBlendModeForAccessibilityBackgrounds = v3;
    [(_UINavigationItemButtonView *)self _resetRenderingModesForAccessibilityBackgrounds];
  }
}

- (void)_setAccessibilityBackgroundTintColor:(id)a3
{
  BOOL v7 = (UIColor *)a3;
  char v5 = dyld_program_sdk_at_least();
  BOOL v6 = v7;
  if ((v5 & 1) == 0 && self->_accessibilityBackgroundTintColor != v7)
  {
    objc_storeStrong((id *)&self->_accessibilityBackgroundTintColor, a3);
    [(_UINavigationItemButtonView *)self _resetRenderingModesForAccessibilityBackgrounds];
    BOOL v6 = v7;
  }
}

- (BOOL)_showsAccessibilityBackgroundWhenEnabled
{
  if (dyld_program_sdk_at_least()) {
    return 0;
  }
  v4 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage anyBackButtonBackgroundImage];
  if (v4)
  {
    BOOL v3 = 0;
  }
  else if (self->_imageView)
  {
    BOOL v3 = 1;
  }
  else
  {
    char v5 = [(_UINavigationItemButtonView *)self title];
    BOOL v3 = [v5 length] != 0;
  }
  return v3;
}

- (BOOL)_wantsAccessibilityButtonShapes
{
  int v3 = -[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self);
  if (v3)
  {
    LOBYTE(v3) = [(_UINavigationItemButtonView *)self _showsAccessibilityBackgroundWhenEnabled];
  }
  return v3;
}

- (BOOL)_suppressesBackIndicatorView
{
  int v3 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage anyBackButtonBackgroundImage];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(_UINavigationItemButtonView *)self _wantsAccessibilityButtonShapes];
  }

  return v4;
}

- (_UINavigationItemButtonView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationItemButtonView;
  int v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    v3->_abbreviatedTitleIndex = 0x7FFFFFFFFFFFFFFFLL;
    char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__accessibilityButtonShapesDidChangeNotification_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

    BOOL v6 = [(UIView *)v4 layer];
    [v6 setAllowsGroupBlending:0];

    BOOL v7 = [(UIView *)v4 layer];
    [v7 setAllowsGroupOpacity:0];
  }
  return v4;
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  if ([(_UINavigationItemButtonView *)self _showsAccessibilityBackgroundWhenEnabled])
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationItemButtonView;
  [(UIView *)&v9 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  BOOL v7 = [(UIView *)self _screen];
  uint64_t v8 = [v7 _userInterfaceIdiom];

  if (v8 != a3 && (a3 == 3 || v8 == 3)) {
    [(_UINavigationItemButtonView *)self _accessibilityButtonShapesParametersDidChange];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationItemButtonView;
  [(UIView *)&v3 tintColorDidChange];
  [(UIView *)self setNeedsDisplay];
  [(_UINavigationItemView *)self _updateLabelColor];
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (BOOL)_useSilverLookForBarStyle:(int64_t)a3
{
  return 0;
}

- (id)_currentTextColorForBarStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 1
    && [(_UINavigationItemButtonView *)self _wantsAccessibilityButtonShapes])
  {
    BOOL v4 = +[UIColor whiteColor];
    goto LABEL_16;
  }
  appearanceStorage = self->_appearanceStorage;
  if (self->_pressed)
  {
    uint64_t v6 = 1;
  }
  else if ([(UIView *)self isFocused])
  {
    uint64_t v6 = 8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  BOOL v7 = [(_UIBarItemAppearanceStorage *)appearanceStorage textAttributesForState:v6];
  uint64_t v8 = [v7 objectForKey:*(void *)off_1E52D2048];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    if (![(UIView *)self isFocused])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
      v11 = [WeakRetained navigationBar];
      BOOL v4 = [v11 buttonItemTextColor];

      goto LABEL_15;
    }
    id v9 = +[UIColor _externalBarBackgroundColor];
  }
  BOOL v4 = v9;
LABEL_15:

LABEL_16:
  return v4;
}

- (id)_currentTextShadowColorForBarStyle:(int64_t)a3
{
  BOOL v4 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributeForKey:*(void *)off_1E52D2238 state:self->_pressed];
  char v5 = [v4 shadowColor];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
    uint64_t v8 = [WeakRetained navigationBar];
    id v6 = [v8 buttonItemShadowColor];
  }
  return v6;
}

- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3
{
  objc_super v3 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributeForKey:*(void *)off_1E52D2238 state:self->_pressed];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 shadowOffset];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v8 = -1.0;
    double v6 = 0.0;
  }

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_currentCustomBackgroundNeedsDarkening:(BOOL *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  double v6 = [WeakRetained _navigationBar];

  int v7 = [v6 isMinibar];
  if (a3) {
    *a3 = 0;
  }
  double v8 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:0 isMini:0];
  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:0 isMini:1];
      id v10 = (id)v9;
      if (self->_pressed)
      {
        [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:1 isMini:v9 != 0];
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9) {
          v13 = (void *)v9;
        }
        else {
          v13 = v8;
        }
        id v11 = v13;
      }
      v14 = v11;
      if (v11)
      {
        id v15 = v11;
      }
      else
      {
        if (v10) {
          v16 = v10;
        }
        else {
          v16 = v8;
        }
        id v15 = v16;

        if (a3) {
          *a3 = 1;
        }
      }

      double v8 = v15;
    }
    else
    {
      if (!self->_pressed) {
        goto LABEL_23;
      }
      v12 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:1 isMini:0];
      if (v12)
      {
        id v10 = v12;

        double v8 = v10;
      }
      else
      {
        id v10 = 0;
        if (a3) {
          *a3 = 1;
        }
      }
    }
  }
LABEL_23:

  return v8;
}

- (UIEdgeInsets)alignmentRectInsets
{
  v2 = [(_UINavigationItemButtonView *)self _currentCustomBackgroundNeedsDarkening:0];
  objc_super v3 = v2;
  if (v2)
  {
    [v2 alignmentRectInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = 0.0;
    double v7 = 0.0;
    double v9 = 0.0;
    double v11 = 0.0;
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  double v7 = [WeakRetained _navigationBar];
  double v8 = [v7 _currentVisualStyle];
  double v9 = [(_UINavigationItemButtonView *)self image];
  uint64_t v10 = [v7 isMinibar];
  double v11 = [(UIImageView *)self->_backgroundImageView image];
  if (v11) {
    goto LABEL_11;
  }
  if ([(_UINavigationItemButtonView *)self _wantsAccessibilityButtonShapes])
  {
    uint64_t v12 = _UINavigationButtonAccessibilityBackground(1, v10);
LABEL_9:
    double v11 = (void *)v12;
    goto LABEL_10;
  }
  double v11 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:0 isMini:v10];
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v10;
  }
  if (v13 == 1)
  {
    uint64_t v12 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:0 isMini:0];
    goto LABEL_9;
  }
LABEL_10:
  if (v11)
  {
LABEL_11:
    [v11 capInsets];
    double v15 = v14;
    double v17 = v16;
    goto LABEL_12;
  }
  double v17 = 0.0;
  double v15 = 0.0;
LABEL_12:
  if (v9)
  {
    [v8 leftBackImageMargin];
    double v19 = fmax(v15, v18);
    [v8 rightImageMargin];
  }
  else
  {
    [v8 leftBackTitleMarginForCustomBackButtonBackground:v11];
    double v19 = v21;
    [v8 rightTitleMargin];
  }
  double v22 = fmax(v17, v20);
  [WeakRetained _fontScaleAdjustment];
  if (!v9 && v23 != 0.0)
  {
    [v8 backButtonIndicatorSpacing];
    [v8 backButtonIndicatorSpacing];
    UIFloorToViewScale(self);
    double v19 = v24;
    UIRoundToViewScale(self);
    double v22 = v25;
LABEL_20:
    double v28 = width - v19 - v22;
    double v26 = v22 + v19;
    -[UILabel sizeThatFits:](self->super._label, "sizeThatFits:", v28, 0.0);
    goto LABEL_21;
  }
  if (!v9) {
    goto LABEL_20;
  }
  double v26 = v19 + v22;
  [(_UINavigationItemButtonView *)self imageSize];
LABEL_21:
  double v29 = v26 + v27;

  double v30 = v29;
  double v31 = height;
  result.CGFloat height = v31;
  result.double width = v30;
  return result;
}

- (double)_titleYAdjustmentCustomization
{
  return 0.0;
}

- (id)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)layoutSubviews
{
  v89.receiver = self;
  v89.super_class = (Class)_UINavigationItemButtonView;
  [(_UINavigationItemView *)&v89 _updateLabelContents];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = [WeakRetained _navigationBar];
  double v9 = [v8 _currentVisualStyle];
  uint64_t v10 = [(_UINavigationItemButtonView *)self image];
  uint64_t v11 = [v8 isMinibar];
  BOOL v12 = [(_UINavigationItemButtonView *)self _wantsAccessibilityButtonShapes];
  if (v12) {
    _UINavigationButtonAccessibilityBackground(1, v11);
  }
  else {
  int v13 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:0 isMini:v11];
  }
  char v88 = v11;
  if (v13) {
    int v14 = 0;
  }
  else {
    int v14 = v11;
  }
  if (v14 == 1)
  {
    int v13 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:0 isMini:0];
  }
  backgroundImageView = self->_backgroundImageView;
  if (v13)
  {
    v86 = v10;
    id v87 = WeakRetained;
    if (!backgroundImageView)
    {
      double v16 = [[UIImageView alloc] initWithImage:v13];
      double v17 = self->_backgroundImageView;
      self->_backgroundImageView = v16;

      [(UIView *)self insertSubview:self->_backgroundImageView atIndex:0];
      backgroundImageView = self->_backgroundImageView;
    }
    [(UIView *)self bounds];
    -[UIImageView setFrame:](backgroundImageView, "setFrame:");
    double v18 = self->_backgroundImageView;
    double v19 = v8;
    uint64_t v20 = [v8 _barStyle];
    BOOL v21 = [(_UINavigationItemButtonView *)self _wantsBlendModeForAccessibilityBackgrounds];
    double v22 = [(_UINavigationItemButtonView *)self _accessibilityBackgroundTintColor];
    +[UINavigationButton _resetRenderingModesForBackgroundImageView:v18 inBarStyle:v20 isEnabled:1 withAccessibilityBackground:v12 wantsBlendModeForAccessibilityBackgrounds:v21 accessibilityBackgroundTintColor:v22];

    [v13 alignmentRectInsets];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    [v13 capInsets];
    double v32 = v31;
    double v34 = v33;
    uint64_t v10 = v86;
    id WeakRetained = v87;
  }
  else
  {
    double v30 = 0.0;
    double v19 = v8;
    if (backgroundImageView)
    {
      [(UIView *)self->_backgroundImageView removeFromSuperview];
      v35 = self->_backgroundImageView;
      self->_backgroundImageView = 0;
    }
    double v28 = 0.0;
    double v26 = 0.0;
    double v24 = 0.0;
    double v32 = 0.0;
    double v34 = 0.0;
  }
  if (v10)
  {
    [v9 leftBackImageMargin];
    double v37 = fmax(v26, fmax(v32, v36));
    double v38 = fmax(v30, v34);
    [v9 rightImageMargin];
  }
  else
  {
    [v9 leftBackTitleMarginForCustomBackButtonBackground:v13];
    double v37 = fmax(v26, v40);
    double v38 = fmax(v30, v34);
    [v9 rightTitleMargin];
  }
  v41 = v19;
  double v42 = fmax(v38, v39);
  [WeakRetained _fontScaleAdjustment];
  if (!v10 && v43 != 0.0)
  {
    [v9 backButtonIndicatorSpacing];
    [v9 backButtonIndicatorSpacing];
    UIFloorToViewScale(self);
    double v37 = v44;
    UIRoundToViewScale(self);
    double v42 = v45;
LABEL_26:
    v57 = [(_UINavigationItemButtonView *)self title];
    if (([v57 isEqualToString:&stru_1ED0E84C0] & 1) == 0)
    {
      [(_UINavigationItemView *)self _titleSize];
      double v59 = v58;
      [(_UINavigationItemView *)self _labelFrame];
      double v63 = v62;
      double v65 = v64;
      if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
        double v66 = v42;
      }
      else {
        double v66 = v37;
      }
      double v67 = v60 + v66;
      double v68 = v61 - (v42 + v37);
      BOOL v69 = round(v59) < v68;
      double v70 = v67 + floor((v68 - v59) * 0.5);
      double v71 = v68 - floor(v68 - v59);
      if (v69) {
        double v72 = v70;
      }
      else {
        double v72 = v67;
      }
      if (v69) {
        double v73 = v71;
      }
      else {
        double v73 = v68;
      }
      appearanceStorage = self->_appearanceStorage;
      if (v88) {
        [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniBackButtonTitlePositionOffset];
      }
      else {
      v75 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backButtonTitlePositionOffset];
      }
      v76 = v19;
      v77 = v75;
      if (v75)
      {
        [v75 UIOffsetValue];
        if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
          double v78 = -v78;
        }
        double v72 = v72 + v78;
        double v63 = v63 + v79;
      }
      v80 = [(UIView *)self window];
      v81 = [v80 screen];
      [v81 scale];
      double v83 = v82;

      if (v83 == 0.0)
      {
        v84 = +[UIScreen mainScreen];
        [v84 scale];
        double v83 = v85;
      }
      v41 = v76;
      [(UIView *)self->_imageView removeFromSuperview];
      [(UIView *)self addSubview:self->super._label];
      -[UILabel setFrame:](self->super._label, "setFrame:", v72, round(v63 * v83) / v83, v73, v65);
    }
    goto LABEL_47;
  }
  if (!v10) {
    goto LABEL_26;
  }
  if (!self->_imageView)
  {
    v46 = objc_alloc_init(UIImageView);
    imageView = self->_imageView;
    self->_imageView = v46;
  }
  [v9 topImageMargin];
  double v49 = v24 + v48;
  double v50 = v5 - (v37 + v42);
  [v9 topImageMargin];
  double v52 = v51;
  [v9 bottomImageMargin];
  double v54 = v7 - (v28 + v24 + v52 + v53);
  [(_UINavigationItemButtonView *)self imageSize];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", round(v37 + (v50 - v55) * 0.5), round(v49 + (v54 - v56) * 0.5), v55);
  [(UIImageView *)self->_imageView setImage:v10];
  [(UIView *)self->super._label removeFromSuperview];
  [(UIView *)self addSubview:self->_imageView];
LABEL_47:
}

- (id)title
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  double v4 = WeakRetained;
  if (self->_abbreviatedTitleIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = [WeakRetained backBarButtonItem];
    double v6 = [v5 title];

    if (!v6)
    {
      double v6 = [v4 backButtonTitle];
      if (!v6)
      {
        double v6 = [v4 title];
        if (!v6)
        {
          double v6 = _UINSLocalizedStringWithDefaultValue(@"Back", @"Back");
        }
      }
    }
  }
  else
  {
    double v7 = [WeakRetained _abbreviatedBackButtonTitles];
    double v6 = [v7 objectAtIndex:self->_abbreviatedTitleIndex];
  }
  return v6;
}

- (id)image
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  objc_super v3 = [WeakRetained backBarButtonItem];
  double v4 = [v3 image];

  return v4;
}

- (CGSize)imageSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
  double v4 = [WeakRetained _navigationBar];

  double v5 = [v4 _currentVisualStyle];
  [v4 defaultBackButtonAlignmentHeight];
  double v7 = v6;
  [v5 topImageMargin];
  double v9 = v7 - v8;
  [v5 bottomImageMargin];
  double v11 = v9 - v10;
  BOOL v12 = [(_UINavigationItemButtonView *)self image];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  if (v16 <= v11) {
    double v11 = v16;
  }
  else {
    double v14 = ceil(v14 * (v11 / v16));
  }

  double v17 = v14;
  double v18 = v11;
  result.CGFloat height = v18;
  result.double width = v17;
  return result;
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_style != a3)
  {
    if (a4)
    {
      [(UIView *)self bounds];
      if (!CGRectIsEmpty(v22))
      {
        +[UIView setAnimationsEnabled:0];
        double v6 = [UIView alloc];
        [(UIView *)self bounds];
        double v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
        [(UIView *)v7 setUserInteractionEnabled:0];
        [(UIView *)self bounds];
        _UIGraphicsBeginImageContextWithOptions(0, 0, v8, v9, 0.0);
        [(UIView *)self bounds];
        -[UIView drawRect:](self, "drawRect:");
        double v10 = _UIGraphicsGetImageFromCurrentImageContext(0);
        UIGraphicsEndImageContext();
        id v11 = v10;
        uint64_t v12 = [v11 CGImage];
        double v13 = [(UIView *)v7 layer];
        [v13 setContents:v12];

        [(UIView *)self addSubview:v7];
        +[UIView setAnimationsEnabled:1];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __49___UINavigationItemButtonView_setStyle_animated___block_invoke;
        v20[3] = &unk_1E52D9F70;
        BOOL v21 = v7;
        uint64_t v15 = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        double v17 = __49___UINavigationItemButtonView_setStyle_animated___block_invoke_2;
        double v18 = &unk_1E52DC3A0;
        double v19 = v21;
        double v14 = v21;
        +[UIView animateWithDuration:0 delay:v20 options:&v15 animations:0.2 completion:0.0];
      }
    }
    self->_style = a3;
    [(UIView *)self setNeedsDisplay];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setStyle:(int64_t)a3
{
}

- (void)setPressed:(BOOL)a3
{
}

- (void)setPressed:(BOOL)a3 initialPress:(BOOL)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_pressed != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_pressed = a3;
    v8[0] = self;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    +[UIButton _setVisuallyHighlighted:v5 forViews:v7 initialPress:v4];

    [(UIView *)self setNeedsLayout];
  }
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (id)_defaultFont
{
  objc_super v3 = [(_UINavigationItemView *)self navigationItem];
  BOOL v4 = [v3 _navigationBar];
  BOOL v5 = [v4 _currentVisualStyle];

  double v6 = [(_UINavigationItemView *)self navigationItem];
  [v6 _fontScaleAdjustment];
  double v8 = v7;

  if (v8 == 0.0) {
    double v8 = 1.0;
  }
  CGFloat v9 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:0];
  uint64_t v10 = *(void *)off_1E52D2040;
  id v11 = [v9 objectForKey:*(void *)off_1E52D2040];

  if (!v11)
  {
    uint64_t v12 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:1];
    id v11 = [v12 objectForKey:v10];
  }
  [v11 pointSize];
  if (v13 == 0.0)
  {
    [v5 buttonFontSize];
    id v15 = [v11 fontWithSize:v8 * v14];
  }
  else
  {
    id v15 = v11;
  }
  uint64_t v16 = v15;
  if (!v15)
  {
    double v17 = +[UINavigationButton defaultFont];
    uint64_t v16 = v17;
    if (v8 < 1.0)
    {
      [v17 pointSize];
      uint64_t v19 = [v16 fontWithSize:v8 * v18];

      uint64_t v16 = (void *)v19;
    }
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationItemButtonView;
  [(UIView *)&v4 dealloc];
}

- (void)_UIAppearance_setTintColor:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  appearanceStorage = self->_appearanceStorage;
  if (v4 | (unint64_t)appearanceStorage)
  {
    id v8 = (id)v4;
    if (!appearanceStorage)
    {
      double v6 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      double v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    [(_UIBarButtonItemAppearanceStorage *)appearanceStorage setTintColor:v8];
    unint64_t v4 = (unint64_t)v8;
  }
}

- (UIColor)_tintColor
{
  return [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage tintColor];
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  unint64_t v6 = (unint64_t)a3;
  appearanceStorage = self->_appearanceStorage;
  if (v6 | (unint64_t)appearanceStorage)
  {
    id v8 = (void *)v6;
    if (!appearanceStorage)
    {
      CGFloat v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      uint64_t v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;
    }
    objc_msgSend(v8, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    [(_UIBarItemAppearanceStorage *)self->_appearanceStorage setTextAttributes:v11 forState:a4];
  }
}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  return [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:a3];
}

- (BOOL)customBackgroundImageChangedToOrFromNil
{
  return self->_customBackgroundImageChangedToOrFromNil;
}

- (void)backIndicatorViewHasRespondedToCustomBackgroundImageChange
{
  self->_customBackgroundImageChangedToOrFromNil = 0;
}

- (BOOL)hasCustomBackgroundImage
{
  v2 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage anyBackButtonBackgroundImage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_UIAppearance_setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  unint64_t v8 = (unint64_t)a3;
  if ((unint64_t)(a5 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (!(v8 | (unint64_t)appearanceStorage)) {
      goto LABEL_23;
    }
    id v21 = (id)v8;
    if (!appearanceStorage)
    {
      uint64_t v10 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      id v11 = self->_appearanceStorage;
      self->_appearanceStorage = v10;
    }
    id v12 = v21;
    if (v21)
    {
      double v13 = v12;
      if (([v12 _isResizable] & 1) == 0)
      {
        [v12 size];
        double v15 = floor(v14 * 0.5);
        double v13 = objc_msgSend(v12, "resizableImageWithCapInsets:", 0.0, v15, 0.0, v14 - v15 + -1.0);
      }
    }
    else
    {
      double v13 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
    double v17 = [WeakRetained _navigationBar];

    if (!a4)
    {
      if (v17)
      {
        if ((a5 != 1) != [v17 isMinibar])
        {
          double v18 = [(_UINavigationItemButtonView *)self _backButtonBackgroundImageForState:0 barMetrics:a5];

          if (v13 != v18) {
            [v17 setNeedsLayout];
          }
        }
      }
    }
    BOOL v19 = a5 == 1;
    uint64_t v20 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:a4 isMini:v19];
    [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackButtonBackgroundImage:v13 forState:a4 isMini:v19];
    if (!v21 && v20 || v12 && !v20)
    {
      self->_customBackgroundImageChangedToOrFromNil = 1;
      [v17 _updateBackIndicatorImage];
    }
  }
  else
  {
    if (_UIAppearance_setBackButtonBackgroundImage_forState_barMetrics__didWarn) {
      goto LABEL_23;
    }
    _UIAppearance_setBackButtonBackgroundImage_forState_barMetrics__didWarn = 1;
    id v21 = (id)v8;
    NSLog(&cfstr_SCustomization.isa, "UIBarButtonItem", @"back button background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
  unint64_t v8 = (unint64_t)v21;
LABEL_23:
}

- (id)_backButtonBackgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) > 1)
  {
    unint64_t v4 = [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:a3 isMini:a4 == 1];
  }
  else
  {
    if ((_backButtonBackgroundImageForState_barMetrics__didWarn & 1) == 0)
    {
      _backButtonBackgroundImageForState_barMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, a3, "UIBarButtonItem", @"back button background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    unint64_t v4 = 0;
  }
  return v4;
}

- (void)_UIAppearance_setBackButtonBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  appearanceStorage = self->_appearanceStorage;
  if (a3 != 0.0 || appearanceStorage != 0)
  {
    if (!appearanceStorage)
    {
      CGFloat v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      uint64_t v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;

      appearanceStorage = self->_appearanceStorage;
    }
    [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:a4];
    if (v11 != a3)
    {
      [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackButtonBackgroundVerticalAdjustment:a4 forBarMetrics:a3];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._item);
      id v12 = [WeakRetained _navigationBar];
      [v12 setNeedsLayout];
    }
  }
}

- (double)_backButtonBackgroundVerticalPositionAdjustmentForBarMetrics:(int64_t)a3
{
  [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:a3];
  return result;
}

- (void)_UIAppearance_setBackButtonTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) <= 1)
  {
    if ((_UIAppearance_setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn & 1) == 0)
    {
      _UIAppearance_setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, a3.horizontal, a3.vertical, "UIBarButtonItem", @"back button title adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
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
    CGFloat v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    uint64_t v10 = self->_appearanceStorage;
    self->_appearanceStorage = v9;

    appearanceStorage = self->_appearanceStorage;
  }
  if (a4 == 1) {
    [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniTitlePositionOffset];
  }
  else {
  double v11 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage titlePositionOffset];
  }
  id v12 = v11;
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
    double v15 = self->_appearanceStorage;
    if (a4 == 1)
    {
      *(double *)double v18 = horizontal;
      *(double *)&v18[1] = vertical;
      uint64_t v16 = [MEMORY[0x1E4F29238] valueWithBytes:v18 objCType:"{UIOffset=dd}"];
      [(_UIBarButtonItemAppearanceStorage *)v15 setMiniBackButtonTitlePositionOffset:v16];
    }
    else
    {
      *(double *)double v17 = horizontal;
      *(double *)&v17[1] = vertical;
      uint64_t v16 = [MEMORY[0x1E4F29238] valueWithBytes:v17 objCType:"{UIOffset=dd}"];
      [(_UIBarButtonItemAppearanceStorage *)v15 setBackButtonTitlePositionOffset:v16];
    }

    [(UIView *)self setNeedsLayout];
  }
}

- (UIOffset)_backButtonTitlePositionAdjustmentForBarMetrics:(int64_t)a3
{
  if ((unint64_t)(a3 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (a3 == 1) {
      [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniBackButtonTitlePositionOffset];
    }
    else {
    unint64_t v6 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backButtonTitlePositionOffset];
    }
    double v7 = v6;
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
    if ((_backButtonTitlePositionAdjustmentForBarMetrics__didWarn & 1) == 0)
    {
      _backButtonTitlePositionAdjustmentForBarMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, "UIBarButtonItem", @"back button title adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
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
  id v18 = a3;
  id v6 = a4;
  if (v6) {
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, v6, (void *)1);
  }
  if (v18)
  {
    double v7 = [v18 backButtonBackgroundImageForState:0 isMini:0];
    double v8 = [v18 backButtonBackgroundImageForState:1 isMini:0];
    double v9 = [v18 backButtonBackgroundImageForState:0 isMini:1];
    double v10 = [v18 backButtonBackgroundImageForState:1 isMini:1];
    double v11 = [v18 textAttributesForState:0];
    id v12 = [v18 textAttributesForState:1];
    if (!v6)
    {
      TagAttributeForAxes(self, (uint64_t)v7, sel_setBackButtonBackgroundImage_forState_barMetrics_, 0, 0);
      TagAttributeForAxes(self, (uint64_t)v8, sel_setBackButtonBackgroundImage_forState_barMetrics_, 1, 0);
      TagAttributeForAxes(self, (uint64_t)v9, sel_setBackButtonBackgroundImage_forState_barMetrics_, 0, 1);
      TagAttributeForAxes(self, (uint64_t)v10, sel_setBackButtonBackgroundImage_forState_barMetrics_, 1, 1);
      TagAttributeForAxes(self, (uint64_t)v11, sel_setTitleTextAttributes_forState_, 0, -1);
      TagAttributeForAxes(self, (uint64_t)v12, sel_setTitleTextAttributes_forState_, 1, -1);
    }
    [(_UINavigationItemButtonView *)self _setBackButtonBackgroundImage:v7 forState:0 barMetrics:0];
    [(_UINavigationItemButtonView *)self _setBackButtonBackgroundImage:v8 forState:1 barMetrics:0];
    [(_UINavigationItemButtonView *)self _setBackButtonBackgroundImage:v9 forState:0 barMetrics:1];
    [(_UINavigationItemButtonView *)self _setBackButtonBackgroundImage:v10 forState:1 barMetrics:1];
    [(_UINavigationItemButtonView *)self _setTitleTextAttributes:v11 forState:0];
    [(_UINavigationItemButtonView *)self _setTitleTextAttributes:v12 forState:1];
    double v13 = [v18 textAttributesForState:2];
    [(_UINavigationItemButtonView *)self _setTitleTextAttributes:v13 forState:2];

    double v14 = [v18 tintColor];
    [(_UINavigationItemButtonView *)self _setTintColor:v14];

    double v15 = [v18 backButtonTitlePositionOffset];
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 UIOffsetValue];
      -[_UINavigationItemButtonView _setBackButtonTitlePositionAdjustment:forBarMetrics:](self, "_setBackButtonTitlePositionAdjustment:forBarMetrics:", 0);
    }
    double v17 = [v18 miniBackButtonTitlePositionOffset];

    if (v17)
    {
      [v17 UIOffsetValue];
      -[_UINavigationItemButtonView _setBackButtonTitlePositionAdjustment:forBarMetrics:](self, "_setBackButtonTitlePositionAdjustment:forBarMetrics:", 1);
    }
    [v18 backButtonBackgroundVerticalAdjustmentForBarMetrics:0];
    -[_UINavigationItemButtonView _setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:", 0);
    [v18 backButtonBackgroundVerticalAdjustmentForBarMetrics:1];
    -[_UINavigationItemButtonView _setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:", 1);
    [v18 backButtonBackgroundVerticalAdjustmentForBarMetrics:101];
    -[_UINavigationItemButtonView _setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:", 101);
    [v18 backButtonBackgroundVerticalAdjustmentForBarMetrics:102];
    -[_UINavigationItemButtonView _setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:](self, "_setBackButtonBackgroundVerticalPositionAdjustment:forBarMetrics:", 102);
    -[UIView _updateNeedsDisplayOnBoundsChange](self);
  }
}

- (Class)_appearanceGuideClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UINavigationItemButtonView;
  [(UIView *)&v12 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  double v7 = [v6 nextFocusedItem];

  if (v7 == self)
  {
    double v9 = [(UIView *)self tintColor];
    [(UIView *)self setBackgroundColor:v9];

    goto LABEL_5;
  }
  double v8 = [v6 previouslyFocusedItem];

  if (v8 == self)
  {
    [(UIView *)self setBackgroundColor:0];
LABEL_5:
    double v10 = [(_UINavigationItemView *)self navigationItem];
    double v11 = [v10 _navigationBar];
    [v11 _updateBackIndicatorImage];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationItemButtonView;
  [(UIView *)&v3 didMoveToWindow];
  [(_UINavigationItemButtonView *)self _updateBackSelectGestureRecognizer];
}

- (void)_updateBackSelectGestureRecognizer
{
  objc_super v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 3)
  {
    [(UIView *)self setUserInteractionEnabled:1];
    [(_UINavigationItemButtonView *)self _installBackSelectGestureRecognizer];
    BOOL v5 = [(UIView *)self layer];
    double v6 = 4.5;
  }
  else
  {
    [(UIView *)self setUserInteractionEnabled:0];
    [(_UINavigationItemButtonView *)self _uninstallBackSelectGestureRecognizer];
    BOOL v5 = [(UIView *)self layer];
    double v6 = 0.0;
  }
  id v7 = v5;
  [v5 setCornerRadius:v6];
}

- (void)_installBackSelectGestureRecognizer
{
  objc_super v3 = objc_getAssociatedObject(self, &_buttonViewBackSelectGestureRecognizerKey);
  if (!v3)
  {
    value = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__backSelectGestureChanged_];
    [(UIGestureRecognizer *)value setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)value setDelegate:self];
    [(UITapGestureRecognizer *)value setAllowedPressTypes:&unk_1ED3EF218];
    [(UIView *)self addGestureRecognizer:value];
    objc_setAssociatedObject(self, &_buttonViewBackSelectGestureRecognizerKey, value, (void *)1);
    objc_super v3 = value;
  }
}

- (void)_uninstallBackSelectGestureRecognizer
{
  objc_super v3 = objc_getAssociatedObject(self, &_buttonViewBackSelectGestureRecognizerKey);
  if (v3)
  {
    uint64_t v4 = v3;
    [(UIView *)self removeGestureRecognizer:v3];
    objc_setAssociatedObject(self, &_buttonViewBackSelectGestureRecognizerKey, 0, (void *)1);
    objc_super v3 = v4;
  }
}

- (void)_backSelectGestureChanged:(id)a3
{
  if ([a3 state] == 3)
  {
    [(UIView *)self bounds];
    CGFloat x = v13.origin.x;
    CGFloat y = v13.origin.y;
    CGFloat width = v13.size.width;
    CGFloat height = v13.size.height;
    double MidX = CGRectGetMidX(v13);
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v14);
    double v10 = [(_UINavigationItemView *)self navigationItem];
    id v11 = [v10 _navigationBar];

    objc_msgSend(v11, "convertPoint:fromView:", self, MidX, MidY);
    objc_msgSend(v11, "popForCarplayPressAtFakePoint:");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(UIView *)self traitCollection];
  if ([v8 userInterfaceIdiom] != 3)
  {

    goto LABEL_5;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)_UINavigationItemButtonView;
    BOOL v10 = -[UIView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
    goto LABEL_6;
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (unint64_t)_abbreviatedTitleIndex
{
  return self->_abbreviatedTitleIndex;
}

- (void)_setAbbreviatedTitleIndex:(unint64_t)a3
{
  self->_abbreviatedTitleIndedouble x = a3;
}

- (BOOL)_wantsBlendModeForAccessibilityBackgrounds
{
  return self->_wantsBlendModeForAccessibilityBackgrounds;
}

- (UIColor)_accessibilityBackgroundTintColor
{
  return self->_accessibilityBackgroundTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityBackgroundTintColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
}

@end