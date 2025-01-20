@interface _UIBarContentView
- (BOOL)centerTextButtons;
- (BOOL)compactMetrics;
- (Class)_appearanceGuideClass;
- (UIImage)backIndicatorImage;
- (UIImage)backIndicatorMaskImage;
- (_UIBarButtonItemAppearanceStorage)appearanceStorage;
- (_UIBarContentView)initWithFrame:(CGRect)a3;
- (double)absorptionForItem:(id)a3;
- (double)backButtonMargin;
- (double)backButtonMaximumWidth;
- (double)defaultEdgeSpacing;
- (double)defaultTextPadding;
- (id)_titleTextAttributesForState:(unint64_t)a3;
- (int64_t)barType;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (unint64_t)edgesPaddingBarButtonItem:(id)a3;
- (void)_UIAppearance_setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (void)_UIAppearance_setBackButtonBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setBackButtonTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 barMetrics:(int64_t)a6;
- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setTintColor:(id)a3;
- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4;
- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)_appearanceChanged;
- (void)_setAppearanceGuideClass:(Class)a3;
- (void)setBackIndicatorMaskImage:(id)a3;
- (void)setCenterTextButtons:(BOOL)a3;
@end

@implementation _UIBarContentView

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 10;
}

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  return [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:a3];
}

- (_UIBarButtonItemAppearanceStorage)appearanceStorage
{
  return self->_appearanceStorage;
}

- (double)absorptionForItem:(id)a3
{
  return 0.0;
}

- (double)defaultTextPadding
{
  return 0.0;
}

- (BOOL)centerTextButtons
{
  return self->_centerTextButtons;
}

- (_UIBarContentView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBarContentView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3) {
    [(_UIBarContentView *)v3 _setAppearanceGuideClass:objc_opt_class()];
  }
  return v3;
}

- (void)_setAppearanceGuideClass:(Class)a3
{
}

- (UIImage)backIndicatorMaskImage
{
  return self->_backIndicatorMaskImage;
}

- (void)setCenterTextButtons:(BOOL)a3
{
  self->_centerTextButtons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backIndicatorMaskImage, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_appearanceGuideClass, 0);
}

- (int64_t)barType
{
  return 0;
}

- (BOOL)compactMetrics
{
  return 0;
}

- (unint64_t)edgesPaddingBarButtonItem:(id)a3
{
  return 15;
}

- (double)defaultEdgeSpacing
{
  return 0.0;
}

- (double)backButtonMargin
{
  return 0.0;
}

- (double)backButtonMaximumWidth
{
  return 0.0;
}

- (void)_appearanceChanged
{
  id v2 = [(UIView *)self superview];
  [v2 setNeedsLayout];
}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
}

- (void)_UIAppearance_setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 barMetrics:(int64_t)a6
{
  id v10 = a3;
  if ((unint64_t)(a6 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (v10)
    {
      id v20 = v10;
      if (!appearanceStorage)
      {
        v12 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
        v13 = self->_appearanceStorage;
        self->_appearanceStorage = v12;

        id v10 = v20;
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
        goto LABEL_20;
      }
      id v20 = 0;
      id v14 = 0;
    }
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a4 != 4) {
      a4 = 1;
    }
    [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backgroundImageForState:a4 style:a5 isMini:a6 == 1];
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 != v14)
    {
      [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackgroundImage:v14 forState:a4 style:a5 isMini:a6 == 1];
      [(_UIBarContentView *)self _appearanceChanged];
    }
  }
  else
  {
    if (_UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn_1) {
      goto LABEL_20;
    }
    _UIAppearance_setBackgroundImage_forState_style_barMetrics__didWarn_1 = 1;
    id v20 = v10;
    NSLog(&cfstr_SCustomization.isa, "UIBarButtonItem", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
  id v10 = v20;
LABEL_20:
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
      v6 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      v7 = self->_appearanceStorage;
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
    [(_UIBarContentView *)self _appearanceChanged];
  }
LABEL_7:
}

- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (a3 != 0.0 || appearanceStorage != 0)
    {
      if (!appearanceStorage)
      {
        id v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
        id v10 = self->_appearanceStorage;
        self->_appearanceStorage = v9;

        appearanceStorage = self->_appearanceStorage;
      }
      [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backgroundVerticalAdjustmentForBarMetrics:a4];
      if (v11 != a3)
      {
        [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackgroundVerticalAdjustment:a4 forBarMetrics:a3];
        [(_UIBarContentView *)self _appearanceChanged];
      }
    }
  }
  else if ((_UIAppearance_setBackgroundVerticalPositionAdjustment_forBarMetrics__didWarn_0 & 1) == 0)
  {
    _UIAppearance_setBackgroundVerticalPositionAdjustment_forBarMetrics__didWarn_0 = 1;
    NSLog(&cfstr_SCustomization.isa, a2, a3, "UIBarButtonItem", @"toolbar button background vertical position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
}

- (void)_UIAppearance_setTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) <= 1)
  {
    if ((_UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn_1 & 1) == 0)
    {
      _UIAppearance_setTitlePositionAdjustment_forBarMetrics__didWarn_1 = 1;
      NSLog(&cfstr_SCustomization.isa, a2, a3.horizontal, a3.vertical, "UIBarButtonItem", @"title position adjustment", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
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
    id v10 = self->_appearanceStorage;
    self->_appearanceStorage = v9;

    appearanceStorage = self->_appearanceStorage;
  }
  if (a4 == 1) {
    [(_UIBarButtonItemAppearanceStorage *)appearanceStorage miniTitlePositionOffset];
  }
  else {
  double v11 = [(_UIBarButtonItemAppearanceStorage *)appearanceStorage titlePositionOffset];
  }
  v12 = v11;
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
      *(double *)v18 = horizontal;
      *(double *)&v18[1] = vertical;
      double v16 = [MEMORY[0x1E4F29238] valueWithBytes:v18 objCType:"{UIOffset=dd}"];
      [(_UIBarButtonItemAppearanceStorage *)v15 setMiniTitlePositionOffset:v16];
    }
    else
    {
      *(double *)uint64_t v17 = horizontal;
      *(double *)&v17[1] = vertical;
      double v16 = [MEMORY[0x1E4F29238] valueWithBytes:v17 objCType:"{UIOffset=dd}"];
      [(_UIBarButtonItemAppearanceStorage *)v15 setTitlePositionOffset:v16];
    }

    [(_UIBarContentView *)self _appearanceChanged];
  }
}

- (void)_UIAppearance_setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  unint64_t v8 = (unint64_t)a3;
  if ((unint64_t)(a5 - 101) > 1)
  {
    appearanceStorage = self->_appearanceStorage;
    if (!(v8 | (unint64_t)appearanceStorage)) {
      goto LABEL_15;
    }
    id v17 = (id)v8;
    if (!appearanceStorage)
    {
      id v10 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      double v11 = self->_appearanceStorage;
      self->_appearanceStorage = v10;
    }
    id v12 = v17;
    if (v17)
    {
      if (([v12 _isResizable] & 1) == 0)
      {
        [v12 size];
        double v14 = floor(v13 * 0.5);
        uint64_t v15 = objc_msgSend(v12, "resizableImageWithCapInsets:", 0.0, v14, 0.0, v13 - v14 + -1.0);

        id v12 = (id)v15;
      }
    }
    else
    {
      id v12 = 0;
    }
    [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage backButtonBackgroundImageForState:a4 isMini:a5 == 1];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 != v16)
    {
      [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackButtonBackgroundImage:v12 forState:a4 isMini:a5 == 1];
      [(_UIBarContentView *)self _appearanceChanged];
    }
  }
  else
  {
    if (_UIAppearance_setBackButtonBackgroundImage_forState_barMetrics__didWarn_0) {
      goto LABEL_15;
    }
    _UIAppearance_setBackButtonBackgroundImage_forState_barMetrics__didWarn_0 = 1;
    id v17 = (id)v8;
    NSLog(&cfstr_SCustomization.isa, "UIBarButtonItem", @"back button background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
  unint64_t v8 = (unint64_t)v17;
LABEL_15:
}

- (void)_UIAppearance_setBackButtonTitlePositionAdjustment:(UIOffset)a3 forBarMetrics:(int64_t)a4
{
  if ((unint64_t)(a4 - 101) <= 1)
  {
    if ((_UIAppearance_setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn_0 & 1) == 0)
    {
      _UIAppearance_setBackButtonTitlePositionAdjustment_forBarMetrics__didWarn_0 = 1;
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
    id v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    id v10 = self->_appearanceStorage;
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
    uint64_t v15 = self->_appearanceStorage;
    if (a4 == 1)
    {
      *(double *)v18 = horizontal;
      *(double *)&v18[1] = vertical;
      id v16 = [MEMORY[0x1E4F29238] valueWithBytes:v18 objCType:"{UIOffset=dd}"];
      [(_UIBarButtonItemAppearanceStorage *)v15 setMiniBackButtonTitlePositionOffset:v16];
    }
    else
    {
      *(double *)id v17 = horizontal;
      *(double *)&v17[1] = vertical;
      id v16 = [MEMORY[0x1E4F29238] valueWithBytes:v17 objCType:"{UIOffset=dd}"];
      [(_UIBarButtonItemAppearanceStorage *)v15 setBackButtonTitlePositionOffset:v16];
    }

    [(_UIBarContentView *)self _appearanceChanged];
  }
}

- (void)_UIAppearance_setBackButtonBackgroundVerticalPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  appearanceStorage = self->_appearanceStorage;
  if (a3 != 0.0 || appearanceStorage != 0)
  {
    if (!appearanceStorage)
    {
      id v9 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      id v10 = self->_appearanceStorage;
      self->_appearanceStorage = v9;

      appearanceStorage = self->_appearanceStorage;
    }
    [(_UIBarButtonItemAppearanceStorage *)appearanceStorage backButtonBackgroundVerticalAdjustmentForBarMetrics:a4];
    if (v11 != a3)
    {
      [(_UIBarButtonItemAppearanceStorage *)self->_appearanceStorage setBackButtonBackgroundVerticalAdjustment:a4 forBarMetrics:a3];
      [(_UIBarContentView *)self _appearanceChanged];
    }
  }
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (v6)
  {
    if (!appearanceStorage)
    {
      unint64_t v8 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
      id v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;
    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  uint64_t v14 = objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");

  uint64_t v10 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:a4];
  if (v14 | v10 && ([(id)v14 isEqualToDictionary:v10] & 1) == 0)
  {
    [(_UIBarItemAppearanceStorage *)self->_appearanceStorage setTextAttributes:v14 forState:a4];
    uint64_t v11 = *(void *)off_1E52D2040;
    uint64_t v12 = [(id)v14 objectForKey:*(void *)off_1E52D2040];
    uint64_t v13 = [(id)v10 objectForKey:v11];
    if (v12 | v13 && ([(id)v12 isEqual:v13] & 1) == 0) {
      [(_UIBarContentView *)self _appearanceChanged];
    }
  }
}

- (UIImage)backIndicatorImage
{
  return 0;
}

- (void)setBackIndicatorMaskImage:(id)a3
{
}

@end