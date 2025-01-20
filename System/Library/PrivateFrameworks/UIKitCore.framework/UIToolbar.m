@interface UIToolbar
+ (BOOL)_forceLegacyVisualProvider;
+ (Class)_visualProviderClassForToolbar:(id)a3;
+ (double)defaultHeight;
+ (double)defaultHeightForBarSize:(int)a3;
+ (id)_visualProviderForToolbar:(id)a3;
+ (id)defaultButtonFont;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_disableBlurTinting;
- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3;
- (BOOL)_hidesShadow;
- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO;
- (BOOL)_isLocked;
- (BOOL)_linkedBeforeWhitetailAndInitializedFromCoder;
- (BOOL)_shouldDecodeSubviews;
- (BOOL)_shouldStretchDuringCrossfadeTransition;
- (BOOL)_subclassImplementsDrawRect;
- (BOOL)autoHidesToolbarInFullscreen;
- (BOOL)centerTextButtons;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isMinibar;
- (BOOL)isTranslucent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_frameOfBarButtonItem:(id)a3;
- (CGSize)defaultSizeForOrientation:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)backgroundEffects;
- (NSArray)items;
- (NSString)_backdropViewLayerGroupName;
- (NSString)description;
- (UIBarButtonItem)centerItem;
- (UIBarStyle)barStyle;
- (UIColor)barTintColor;
- (UIImage)backgroundImageForToolbarPosition:(UIBarPosition)topOrBottom barMetrics:(UIBarMetrics)barMetrics;
- (UIImage)shadowImageForToolbarPosition:(UIBarPosition)topOrBottom;
- (UIToolbar)initWithCoder:(id)a3;
- (UIToolbar)initWithFrame:(CGRect)a3;
- (UIToolbarAppearance)compactAppearance;
- (UIToolbarAppearance)compactScrollEdgeAppearance;
- (UIToolbarAppearance)scrollEdgeAppearance;
- (UIToolbarAppearance)standardAppearance;
- (UIView)_backgroundView;
- (UIView)_shadowView;
- (UIView)currentBackgroundView;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6;
- (double)_backgroundTransitionProgress;
- (double)_defaultAutolayoutSpacing;
- (id)__appearanceStorage;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)_itemAtPoint:(CGPoint)a3;
- (id)_itemsDidChangeBlock;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)delegate;
- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5;
- (int64_t)_appearanceHint;
- (int64_t)_barPosition;
- (int64_t)_barTranslucence;
- (int64_t)_expectedInterfaceOrientation;
- (int64_t)_hintFromCurrentAppearance;
- (int64_t)_itemDistribution;
- (int64_t)barPosition;
- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4;
- (void)_customViewChangedForButtonItem:(id)a3;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_doCommonToolbarInit;
- (void)_effectiveBarTintColorDidChangeWithPreviousColor:(id)a3;
- (void)_frameOrBoundsChangedWithVisibleSizeChange:(BOOL)a3 wasMinibar:(BOOL)a4;
- (void)_installDefaultAppearance;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_positionToolbarButtonsAndResetFontScaleAdjustment:(BOOL)a3;
- (void)_sendAction:(id)a3 withEvent:(id)a4;
- (void)_setAppearanceHint:(int64_t)a3;
- (void)_setBackdropViewLayerGroupName:(id)a3;
- (void)_setBackgroundTransitionProgress:(double)a3;
- (void)_setBackgroundView:(id)a3;
- (void)_setBarPosition:(int64_t)a3;
- (void)_setButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5;
- (void)_setDisableBlurTinting:(BOOL)a3;
- (void)_setForceTopBarAppearance:(BOOL)a3;
- (void)_setHidesShadow:(BOOL)a3;
- (void)_setItemDistribution:(int64_t)a3;
- (void)_setItemsDidChangeBlock:(id)a3;
- (void)_setLocked:(BOOL)a3;
- (void)_setNeedsBackgroundViewUpdate;
- (void)_setShadowView:(id)a3;
- (void)_setVisualAltitude:(double)a3;
- (void)_setVisualAltitudeBias:(CGSize)a3;
- (void)_setupAXHUDGestureIfNecessary;
- (void)_updateBackgroundView;
- (void)_updateBarForStyle;
- (void)backdropView:(id)a3 didChangeToGraphicsQuality:(int64_t)a4;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)setAutoHidesToolbarInFullscreen:(BOOL)a3;
- (void)setBackgroundEffects:(id)a3;
- (void)setBackgroundImage:(UIImage *)backgroundImage forToolbarPosition:(UIBarPosition)topOrBottom barMetrics:(UIBarMetrics)barMetrics;
- (void)setBarStyle:(UIBarStyle)barStyle;
- (void)setBarTintColor:(UIColor *)barTintColor;
- (void)setBounds:(CGRect)a3;
- (void)setCenterItem:(id)a3;
- (void)setCenterTextButtons:(BOOL)a3;
- (void)setCompactAppearance:(UIToolbarAppearance *)compactAppearance;
- (void)setCompactScrollEdgeAppearance:(UIToolbarAppearance *)compactScrollEdgeAppearance;
- (void)setDelegate:(id)delegate;
- (void)setFrame:(CGRect)a3;
- (void)setItems:(NSArray *)items;
- (void)setItems:(NSArray *)items animated:(BOOL)animated;
- (void)setScrollEdgeAppearance:(UIToolbarAppearance *)scrollEdgeAppearance;
- (void)setShadowImage:(UIImage *)shadowImage forToolbarPosition:(UIBarPosition)topOrBottom;
- (void)setStandardAppearance:(UIToolbarAppearance *)standardAppearance;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)setTranslucent:(BOOL)translucent;
@end

@implementation UIToolbar

- (BOOL)_subclassImplementsDrawRect
{
  if (!__drawRectUIToolbarIMP) {
    __drawRectUIToolbarIMP = +[UIToolbar instanceMethodForSelector:sel_drawRect_];
  }
  uint64_t v3 = [(UIToolbar *)self methodForSelector:sel_drawRect_];
  if (v3) {
    BOOL v4 = v3 == __drawRectUIToolbarIMP;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIToolbar;
  [(UIView *)&v10 _didMoveFromWindow:a3 toWindow:v6];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      -[UIToolbar _setBarPosition:](self, "_setBarPosition:", [WeakRetained positionForBar:self]);
    }
    if (!self->_barPosition) {
      [(UIToolbar *)self _setBarPosition:1];
    }
    v8 = [(UIView *)self layer];
    v9 = [v6 screen];
    [v9 scale];
    objc_msgSend(v8, "setRasterizationScale:");

    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setBackgroundTransitionProgress:(double)a3
{
}

- (CGSize)intrinsicContentSize
{
  [(_UIToolbarVisualProvider *)self->_visualProvider defaultSizeForOrientation:[(UIToolbar *)self _expectedInterfaceOrientation]];
  double v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*(_WORD *)&self->_toolbarFlags & 0x40) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot manually set translatesAutoResizingMaskIntoConstraints on a UIToolbar managed by a controller."];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIToolbar;
  [(UIView *)&v5 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  objc_super v5 = [(UIView *)self superview];
  id v6 = v5;
  if (v5)
  {
    [v5 bounds];
    CGFloat width = v7;
  }
  else if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    [(_UIToolbarVisualProvider *)self->_visualProvider defaultSizeForOrientation:[(UIToolbar *)self _expectedInterfaceOrientation]];
    CGFloat width = v8;
  }
  [(_UIToolbarVisualProvider *)self->_visualProvider defaultSizeForOrientation:[(UIToolbar *)self _expectedInterfaceOrientation]];
  double v10 = v9;

  double v11 = width;
  double v12 = v10;
  result.height = v12;
  result.CGFloat width = v11;
  return result;
}

- (int64_t)_expectedInterfaceOrientation
{
  BOOL v3 = [(UIView *)self window];
  if (v3) {
    goto LABEL_2;
  }
  if ((*(_WORD *)&self->_toolbarFlags & 0x200) == 0)
  {
    BOOL v3 = 0;
LABEL_8:
    int64_t v5 = 1;
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = [WeakRetained _toolbarWindowForInterfaceOrientation:self];

  if (!v3) {
    goto LABEL_8;
  }
LABEL_2:
  uint64_t v4 = [v3 _windowInterfaceOrientation];
  if (!v4) {
    uint64_t v4 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v3];
  }
  int64_t v5 = v4;
LABEL_9:

  return v5;
}

- (BOOL)isTranslucent
{
  unint64_t v3 = *(_WORD *)&self->_toolbarFlags & 7;
  uint64_t v4 = [(UIToolbar *)self _effectiveBarTintColor];
  int64_t v5 = [(UIView *)self _screen];
  BOOL IsTranslucentOnScreen = _UIBarStyleWithTintColorIsTranslucentOnScreen(v3, (uint64_t)v4, v5);

  int v7 = (*(_WORD *)&self->_toolbarFlags >> 3) & 7;
  if (v7) {
    return v7 == 1;
  }
  double v9 = [(UIView *)self _screen];
  uint64_t v10 = [v9 _userInterfaceIdiom];

  BOOL result = v10 != 3 && IsTranslucentOnScreen;
  if (v10 == 3 && IsTranslucentOnScreen) {
    return (*(_WORD *)&self->_toolbarFlags & 7) != 3;
  }
  return result;
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [(UIToolbar *)self isMinibar];
  [(UIView *)self bounds];
  BOOL v11 = height != v10 || width != v9;
  v12.receiver = self;
  v12.super_class = (Class)UIToolbar;
  -[UIView setBounds:](&v12, sel_setBounds_, x, y, width, height);
  [(UIToolbar *)self _frameOrBoundsChangedWithVisibleSizeChange:v11 wasMinibar:v8];
}

- (void)_frameOrBoundsChangedWithVisibleSizeChange:(BOOL)a3 wasMinibar:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    [(_UIToolbarVisualProvider *)self->_visualProvider updateBarBackgroundSize];
    [(UIView *)self setNeedsDisplay];
    [(UIView *)self setNeedsLayout];
  }
  if ([(UIToolbar *)self isMinibar] != v4)
  {
    visualProvider = self->_visualProvider;
    items = self->_items;
    [(_UIToolbarVisualProvider *)visualProvider updateItemsForNewFrame:items];
  }
}

- (int64_t)barPosition
{
  return self->_barPosition;
}

- (BOOL)isMinibar
{
  return [(_UIToolbarVisualProvider *)self->_visualProvider toolbarIsSmall];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forToolbarPosition:(UIBarPosition)topOrBottom barMetrics:(UIBarMetrics)barMetrics
{
  BOOL v8 = backgroundImage;
  double v9 = v8;
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    id appearanceStorage = self->__appearanceStorage;
    if (v8)
    {
      v16 = v8;
      if (!appearanceStorage)
      {
        BOOL v11 = objc_alloc_init(_UIToolbarAppearanceStorage);
        id v12 = self->__appearanceStorage;
        self->__id appearanceStorage = v11;

        double v9 = v16;
      }
      if ([(UIImage *)v9 _isResizable] || ([(UIImage *)v16 size], v13 <= 1.0))
      {
        double v9 = v16;
      }
      else
      {
        uint64_t v14 = -[UIImage resizableImageWithCapInsets:](v16, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

        double v9 = (UIImage *)v14;
      }
    }
    else if (!appearanceStorage)
    {
      goto LABEL_16;
    }
    v15 = v9;
    objc_msgSend(self->__appearanceStorage, "setBackgroundImage:forBarPosition:barMetrics:");
    if (topOrBottom == UIBarPositionAny)
    {
      [self->__appearanceStorage setBackgroundImage:v15 forBarPosition:1 barMetrics:barMetrics];
      [self->__appearanceStorage setBackgroundImage:v15 forBarPosition:3 barMetrics:barMetrics];
      [self->__appearanceStorage setBackgroundImage:v15 forBarPosition:2 barMetrics:barMetrics];
      [self->__appearanceStorage setBackgroundImage:v15 forBarPosition:4 barMetrics:barMetrics];
    }
    [(UIToolbar *)self _setNeedsBackgroundViewUpdate];
  }
  else
  {
    if (setBackgroundImage_forToolbarPosition_barMetrics__didWarn) {
      goto LABEL_16;
    }
    setBackgroundImage_forToolbarPosition_barMetrics__didWarn = 1;
    v15 = v8;
    NSLog(&cfstr_SCustomization.isa, "UIToolbar", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
  }
  double v9 = v15;
LABEL_16:
}

- (void)_setHidesShadow:(BOOL)a3
{
  BOOL v3 = a3;
  id appearanceStorage = self->__appearanceStorage;
  if (!appearanceStorage)
  {
    id v6 = objc_alloc_init(_UIToolbarAppearanceStorage);
    id v7 = self->__appearanceStorage;
    self->__id appearanceStorage = v6;

    id appearanceStorage = self->__appearanceStorage;
  }
  if ([appearanceStorage hidesShadow] != v3)
  {
    [self->__appearanceStorage setHidesShadow:v3];
    [(UIToolbar *)self _updateBackgroundView];
  }
}

- (BOOL)_disableBlurTinting
{
  return HIBYTE(*(_WORD *)&self->_toolbarFlags) & 1;
}

- (UIToolbarAppearance)standardAppearance
{
  standardAppearance = self->_standardAppearance;
  if (!standardAppearance)
  {
    [(UIToolbar *)self _installDefaultAppearance];
    standardAppearance = self->_standardAppearance;
  }
  return standardAppearance;
}

- (UIToolbarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  visualProvider = self->_visualProvider;
  id v5 = a3;
  id v6 = [(UIView *)self traitCollection];
  id v7 = [(_UIToolbarVisualProvider *)visualProvider traitCollectionForChild:v5 baseTraitCollection:v6];

  return v7;
}

- (UIBarStyle)barStyle
{
  return *(_WORD *)&self->_toolbarFlags & 7;
}

- (int64_t)_barPosition
{
  return self->_barPosition;
}

- (id)__appearanceStorage
{
  return self->__appearanceStorage;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (BOOL)_hidesShadow
{
  return [self->__appearanceStorage hidesShadow];
}

- (void)setStandardAppearance:(UIToolbarAppearance *)standardAppearance
{
  BOOL v4 = standardAppearance;
  id v5 = self->_standardAppearance;
  id v6 = v4;
  double v13 = v6;
  if (v5 == v6)
  {

    BOOL v8 = v13;
LABEL_12:

    goto LABEL_13;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

  if (!v7)
  {
LABEL_8:
    double v9 = self->_standardAppearance;
    if (v9) {
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    }
    double v10 = [(UIBarAppearance *)v13 copy];
    BOOL v11 = self->_standardAppearance;
    self->_standardAppearance = v10;

    [(UIToolbar *)self _installDefaultAppearance];
    BOOL v8 = [(_UIToolbarVisualProvider *)self->_visualProvider appearanceObserver];
    id v12 = self->_standardAppearance;
    if (v12) {
      objc_storeWeak((id *)&v12->super._changeObserver, v8);
    }
    goto LABEL_12;
  }
LABEL_13:
  [(_UIToolbarVisualProvider *)self->_visualProvider setUseModernAppearance:1];
}

- (void)setCompactAppearance:(UIToolbarAppearance *)compactAppearance
{
  BOOL v4 = compactAppearance;
  id v5 = self->_compactAppearance;
  id v6 = v4;
  double v13 = v6;
  if (v5 == v6)
  {

    BOOL v8 = v13;
LABEL_12:

    goto LABEL_13;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

  if (!v7)
  {
LABEL_8:
    double v9 = self->_compactAppearance;
    if (v9) {
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    }
    double v10 = [(UIBarAppearance *)v13 copy];
    BOOL v11 = self->_compactAppearance;
    self->_compactAppearance = v10;

    [(UIToolbar *)self _installDefaultAppearance];
    BOOL v8 = [(_UIToolbarVisualProvider *)self->_visualProvider appearanceObserver];
    id v12 = self->_compactAppearance;
    if (v12) {
      objc_storeWeak((id *)&v12->super._changeObserver, v8);
    }
    goto LABEL_12;
  }
LABEL_13:
  [(_UIToolbarVisualProvider *)self->_visualProvider setUseModernAppearance:1];
}

- (void)setCompactScrollEdgeAppearance:(UIToolbarAppearance *)compactScrollEdgeAppearance
{
  BOOL v4 = compactScrollEdgeAppearance;
  id v5 = self->_compactScrollEdgeAppearance;
  id v6 = v4;
  double v13 = v6;
  if (v5 == v6)
  {

    BOOL v8 = v13;
LABEL_12:

    goto LABEL_13;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

  if (!v7)
  {
LABEL_8:
    double v9 = self->_compactScrollEdgeAppearance;
    if (v9) {
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    }
    double v10 = [(UIBarAppearance *)v13 copy];
    BOOL v11 = self->_compactScrollEdgeAppearance;
    self->_compactScrollEdgeAppearance = v10;

    [(UIToolbar *)self _installDefaultAppearance];
    BOOL v8 = [(_UIToolbarVisualProvider *)self->_visualProvider appearanceObserver];
    id v12 = self->_compactScrollEdgeAppearance;
    if (v12) {
      objc_storeWeak((id *)&v12->super._changeObserver, v8);
    }
    goto LABEL_12;
  }
LABEL_13:
  [(_UIToolbarVisualProvider *)self->_visualProvider setUseModernAppearance:1];
}

- (void)setScrollEdgeAppearance:(UIToolbarAppearance *)scrollEdgeAppearance
{
  BOOL v4 = scrollEdgeAppearance;
  id v5 = self->_scrollEdgeAppearance;
  id v6 = v4;
  double v13 = v6;
  if (v5 == v6)
  {

    BOOL v8 = v13;
LABEL_12:

    goto LABEL_13;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

  if (!v7)
  {
LABEL_8:
    double v9 = self->_scrollEdgeAppearance;
    if (v9) {
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    }
    double v10 = [(UIBarAppearance *)v13 copy];
    BOOL v11 = self->_scrollEdgeAppearance;
    self->_scrollEdgeAppearance = v10;

    [(UIToolbar *)self _installDefaultAppearance];
    BOOL v8 = [(_UIToolbarVisualProvider *)self->_visualProvider appearanceObserver];
    id v12 = self->_scrollEdgeAppearance;
    if (v12) {
      objc_storeWeak((id *)&v12->super._changeObserver, v8);
    }
    goto LABEL_12;
  }
LABEL_13:
  [(_UIToolbarVisualProvider *)self->_visualProvider setUseModernAppearance:1];
}

- (void)_installDefaultAppearance
{
  if (!self->_standardAppearance)
  {
    BOOL v3 = (UIToolbarAppearance *)objc_opt_new();
    standardAppearance = self->_standardAppearance;
    self->_standardAppearance = v3;

    id v5 = [(_UIToolbarVisualProvider *)self->_visualProvider appearanceObserver];
    id v6 = self->_standardAppearance;
    if (v6)
    {
      BOOL v7 = v5;
      objc_storeWeak((id *)&v6->super._changeObserver, v5);
      id v5 = v7;
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIToolbar;
  [(UIView *)&v3 layoutSubviews];
  [(_UIToolbarVisualProvider *)self->_visualProvider layoutSubviews];
}

- (UIToolbarAppearance)compactScrollEdgeAppearance
{
  return self->_compactScrollEdgeAppearance;
}

- (UIToolbarAppearance)compactAppearance
{
  return self->_compactAppearance;
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
  BOOL v4 = barTintColor;
  id v5 = self->_barTintColor;
  if (v5 != v4)
  {
    double v9 = v4;
    id v6 = v4;
    BOOL v7 = self->_barTintColor;
    self->_barTintColor = v6;
    BOOL v8 = v5;

    [(UIToolbar *)self _effectiveBarTintColorDidChangeWithPreviousColor:v8];
    BOOL v4 = v9;
  }
}

- (NSArray)items
{
  return self->_items;
}

- (UIToolbar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIToolbar;
  objc_super v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    v3->_barPosition = 1;
    [(UIToolbar *)v3 _doCommonToolbarInit];
  }
  return v4;
}

- (void)_doCommonToolbarInit
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v4 = 512;
  }
  else {
    __int16 v4 = 0;
  }
  *(_WORD *)&self->_toolbarFlags = *(_WORD *)&self->_toolbarFlags & 0xFDFF | v4;

  id v5 = [(id)objc_opt_class() _visualProviderForToolbar:self];
  visualProvider = self->_visualProvider;
  self->_visualProvider = v5;

  if (!self->_standardAppearance)
  {
    if (_UIBarAppearanceAPIVersion() < 2) {
      goto LABEL_8;
    }
    [(UIToolbar *)self _installDefaultAppearance];
  }
  [(_UIToolbarVisualProvider *)self->_visualProvider setUseModernAppearance:1];
LABEL_8:
  [(UIToolbar *)self _setNeedsBackgroundViewUpdate];
  if ([(UIView *)self translatesAutoresizingMaskIntoConstraints]) {
    [(UIView *)self _setHostsLayoutEngine:1];
  }
  [(_UIToolbarVisualProvider *)self->_visualProvider prepare];
  [(UIToolbar *)self _setupAXHUDGestureIfNecessary];
  v10[0] = 0x1ED3F5A30;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = [(UIView *)self _registerForTraitTokenChanges:v7 withTarget:self action:sel__setupAXHUDGestureIfNecessary];

  double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__largeContentViewerEnabledStatusDidChange_ name:@"UILargeContentViewerInteractionEnabledStatusDidChangeNotification" object:0];
}

- (void)setTintColor:(UIColor *)tintColor
{
  __int16 v4 = tintColor;
  id v5 = [(UIToolbar *)self _effectiveBarTintColor];
  v6.receiver = self;
  v6.super_class = (Class)UIToolbar;
  [(UIView *)&v6 setTintColor:v4];

  [(UIToolbar *)self _effectiveBarTintColorDidChangeWithPreviousColor:v5];
}

- (void)_effectiveBarTintColorDidChangeWithPreviousColor:(id)a3
{
  [(UIView *)self setNeedsDisplay];
  [(UIToolbar *)self _setNeedsBackgroundViewUpdate];
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated
{
  BOOL v4 = animated;
  objc_super v6 = items;
  BOOL v7 = v6;
  id v8 = self->_items;
  if (v6 || !v8)
  {
    if (!v6) {
      goto LABEL_10;
    }
    v16 = v6;
    BOOL v9 = [(NSArray *)v6 isEqualToArray:v8];
    BOOL v7 = v16;
    if (v9) {
      goto LABEL_10;
    }
    id v8 = self->_items;
  }
  else
  {
    v16 = 0;
  }
  double v10 = (void *)[(NSArray *)v8 copy];
  BOOL v11 = (NSArray *)[(NSArray *)v16 copy];
  id v12 = self->_items;
  self->_items = v11;

  [(_UIToolbarVisualProvider *)self->_visualProvider updateItemsForNewFrame:self->_items];
  [(UIToolbar *)self _updateBarForStyle];
  double v13 = [(UIToolbar *)self _effectiveBarTintColor];
  [(UIToolbar *)self _effectiveBarTintColorDidChangeWithPreviousColor:v13];

  [(_UIToolbarVisualProvider *)self->_visualProvider updateWithItems:self->_items fromOldItems:v10 animate:v4];
  uint64_t v14 = [(UIToolbar *)self _itemsDidChangeBlock];

  if (v14)
  {
    v15 = [(UIToolbar *)self _itemsDidChangeBlock];
    v15[2]();
  }
  BOOL v7 = v16;
LABEL_10:
}

- (void)_setNeedsBackgroundViewUpdate
{
  if (![(UIView *)self _isInLayoutSubviews])
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_updateBarForStyle
{
  if ((*(_WORD *)&self->_toolbarFlags & 0x3F) == 9) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = *(_WORD *)&self->_toolbarFlags & 7;
  }
  [(_UIToolbarVisualProvider *)self->_visualProvider updateBarForStyle:v3];
  [(UIView *)self setNeedsDisplay];
  [(UIToolbar *)self _setNeedsBackgroundViewUpdate];
}

- (void)_setupAXHUDGestureIfNecessary
{
  if (!self->_axHUDGestureManager)
  {
    if (dyld_program_sdk_at_least())
    {
      uint64_t v3 = [(UIView *)self traitCollection];
      int v4 = [v3 _isLargeContentViewerEnabled];

      if (v4)
      {
        id v5 = [[UIAccessibilityHUDGestureManager alloc] initWithView:self delegate:self];
        axHUDGestureManager = self->_axHUDGestureManager;
        self->_axHUDGestureManager = v5;
      }
    }
  }
}

+ (id)_visualProviderForToolbar:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_visualProviderClassForToolbar:", v4)), "initWithToolbar:", v4);

  return v5;
}

+ (Class)_visualProviderClassForToolbar:(id)a3
{
  [(id)objc_opt_class() _forceLegacyVisualProvider];
  uint64_t v3 = objc_opt_class();
  return (Class)v3;
}

+ (BOOL)_forceLegacyVisualProvider
{
  return _UIUseModernBars() ^ 1;
}

- (BOOL)centerTextButtons
{
  return self->_centerTextButtons;
}

- (id)_itemsDidChangeBlock
{
  return self->__itemsDidChangeBlock;
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  if ((*(_WORD *)&self->_toolbarFlags & 0x40) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot manually set the delegate on a UIToolbar managed by a controller."];
  }
  id v4 = objc_storeWeak((id *)&self->_delegate, obj);
  if (objc_opt_respondsToSelector()) {
    __int16 v5 = 512;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->_toolbarFlags = *(_WORD *)&self->_toolbarFlags & 0xFDFF | v5;
}

- (void)_setLocked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_toolbarFlags = *(_WORD *)&self->_toolbarFlags & 0xFFBF | v3;
}

- (void)_setBarPosition:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  if (v3 != self->_barPosition)
  {
    self->_barPosition = v3;
    [(UIToolbar *)self _setNeedsBackgroundViewUpdate];
  }
}

- (void)setItems:(NSArray *)items
{
}

- (void)setBarStyle:(UIBarStyle)barStyle
{
  __int16 toolbarFlags = (__int16)self->_toolbarFlags;
  if ((toolbarFlags & 7) != barStyle)
  {
    *(_WORD *)&self->___int16 toolbarFlags = toolbarFlags & 0xFFF8 | barStyle & 7;
    [(UIToolbar *)self _updateBarForStyle];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [(UIToolbar *)self isMinibar];
  [(UIView *)self frame];
  BOOL v11 = height != v10 || width != v9;
  v12.receiver = self;
  v12.super_class = (Class)UIToolbar;
  -[UIView setFrame:](&v12, sel_setFrame_, x, y, width, height);
  [(UIToolbar *)self _frameOrBoundsChangedWithVisibleSizeChange:v11 wasMinibar:v8];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setTranslucent:(BOOL)translucent
{
  uint64_t v3 = 1;
  if (!translucent) {
    uint64_t v3 = 2;
  }
  unint64_t toolbarFlags = (unint64_t)self->_toolbarFlags;
  if (v3 != ((toolbarFlags >> 3) & 7))
  {
    *(_WORD *)&self->_unint64_t toolbarFlags = toolbarFlags & 0xFFC7 | (8 * v3);
    [(UIToolbar *)self _updateBarForStyle];
  }
}

- (void)_updateBackgroundView
{
}

- (void)_setItemDistribution:(int64_t)a3
{
}

- (void)_setBackgroundView:(id)a3
{
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIToolbar;
  uint64_t v3 = [(UIView *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  if ([(id)objc_opt_class() _forceLegacyVisualProvider]) {
    [v4 appendFormat:@" forcedLegacyProvider"];
  }
  if (self->_standardAppearance) {
    objc_msgSend(v4, "appendFormat:", @" standardAppearance=%p", self->_standardAppearance);
  }
  if (self->_compactAppearance) {
    objc_msgSend(v4, "appendFormat:", @" compactAppearance=%p", self->_compactAppearance);
  }
  if (self->_scrollEdgeAppearance) {
    objc_msgSend(v4, "appendFormat:", @" scrollEdgeAppearance=%p", self->_scrollEdgeAppearance);
  }
  if (self->_compactScrollEdgeAppearance) {
    objc_msgSend(v4, "appendFormat:", @" compactScrollEdgeAppearance=%p", self->_compactScrollEdgeAppearance);
  }
  return (NSString *)v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)UIToolbar;
  if (-[UIView pointInside:withEvent:](&v8, sel_pointInside_withEvent_, a4)) {
    return 1;
  }
  [(_UIToolbarVisualProvider *)self->_visualProvider backgroundFrame];
  v9.CGFloat x = x;
  v9.CGFloat y = y;
  return CGRectContainsPoint(v10, v9);
}

- (UIToolbar)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIToolbar;
  __int16 v5 = [(UIView *)&v20 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_toolbarFlags &= 0xFFF8u;
    if ([v4 containsValueForKey:@"UIBarStyle"]) {
      *(_WORD *)&v6->_unint64_t toolbarFlags = *(_WORD *)&v6->_toolbarFlags & 0xFFF8 | [v4 decodeIntegerForKey:@"UIBarStyle"] & 7;
    }
    BOOL v7 = [v4 decodeObjectForKey:@"UIDelegate"];
    objc_storeWeak((id *)&v6->_delegate, v7);

    uint64_t v8 = [v4 decodeObjectForKey:@"UIBarTintColor"];
    barTintColor = v6->_barTintColor;
    v6->_barTintColor = (UIColor *)v8;

    if ([v4 containsValueForKey:@"UIBarPosition"]) {
      v6->_barPosition = [v4 decodeIntegerForKey:@"UIBarPosition"];
    }
    if ([v4 containsValueForKey:@"UIBarTranslucence"]) {
      *(_WORD *)&v6->_unint64_t toolbarFlags = (8 * ([v4 decodeIntegerForKey:@"UIBarTranslucence"] & 7)) | *(_WORD *)&v6->_toolbarFlags & 0xFFC7;
    }
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      *(_WORD *)&v6->_toolbarFlags |= 0x80u;
    }
    uint64_t v10 = [v4 decodeObjectForKey:@"UIToolbarStandardAppearance"];
    standardAppearance = v6->_standardAppearance;
    v6->_standardAppearance = (UIToolbarAppearance *)v10;

    if (v6->_standardAppearance)
    {
      uint64_t v12 = [v4 decodeObjectForKey:@"UIToolbarCompactAppearance"];
      compactAppearance = v6->_compactAppearance;
      v6->_compactAppearance = (UIToolbarAppearance *)v12;

      uint64_t v14 = [v4 decodeObjectForKey:@"UIToolbarScrollEdgeAppearance"];
      scrollEdgeAppearance = v6->_scrollEdgeAppearance;
      v6->_scrollEdgeAppearance = (UIToolbarAppearance *)v14;

      uint64_t v16 = [v4 decodeObjectForKey:@"UIToolbarCompactScrollEdgeAppearance"];
      compactScrollEdgeAppearance = v6->_compactScrollEdgeAppearance;
      v6->_compactScrollEdgeAppearance = (UIToolbarAppearance *)v16;
    }
    [(UIToolbar *)v6 _doCommonToolbarInit];
    v18 = [v4 decodeObjectForKey:@"UIItems"];
    if (v18) {
      [(UIToolbar *)v6 setItems:v18 animated:0];
    }
  }
  return v6;
}

- (void)_populateArchivedSubviews:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIToolbar;
  [(UIView *)&v19 _populateArchivedSubviews:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  __int16 v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v11 = objc_msgSend(v10, "view", (void)v15);

        if (v11)
        {
          uint64_t v12 = [v10 view];
          [v4 removeObject:v12];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }

  double v13 = [(_UIToolbarVisualProvider *)self->_visualProvider currentBackgroundView];

  if (v13)
  {
    uint64_t v14 = [(_UIToolbarVisualProvider *)self->_visualProvider currentBackgroundView];
    [v4 removeObject:v14];
  }
  if (self->_shadowView) {
    objc_msgSend(v4, "removeObject:");
  }
  -[_UIToolbarVisualProvider updateArchivedSubviews:](self->_visualProvider, "updateArchivedSubviews:", v4, (void)v15);
}

- (BOOL)_shouldDecodeSubviews
{
  double v2 = (void *)[(id)objc_opt_class() _visualProviderClassForToolbar:self];
  return [v2 shouldDecodeSubviews];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIToolbar;
  [(UIView *)&v14 encodeWithCoder:v4];
  if ((*(_WORD *)&self->_toolbarFlags & 7) != 0) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained forKey:@"UIDelegate"];
  }
  barTintColor = self->_barTintColor;
  if (barTintColor) {
    [v4 encodeObject:barTintColor forKey:@"UIBarTintColor"];
  }
  items = self->_items;
  if (items) {
    [v4 encodeObject:items forKey:@"UIItems"];
  }
  int64_t barPosition = self->_barPosition;
  if (barPosition) {
    [v4 encodeInteger:barPosition forKey:@"UIBarPosition"];
  }
  unint64_t v9 = ((unint64_t)*(_WORD *)&self->_toolbarFlags >> 3) & 7;
  if (v9) {
    [v4 encodeInteger:v9 forKey:@"UIBarTranslucence"];
  }
  if ([(_UIToolbarVisualProvider *)self->_visualProvider useModernAppearance])
  {
    standardAppearance = self->_standardAppearance;
    if (standardAppearance) {
      [v4 encodeObject:standardAppearance forKey:@"UIToolbarStandardAppearance"];
    }
    compactAppearance = self->_compactAppearance;
    if (compactAppearance) {
      [v4 encodeObject:compactAppearance forKey:@"UIToolbarCompactAppearance"];
    }
    scrollEdgeAppearance = self->_scrollEdgeAppearance;
    if (scrollEdgeAppearance) {
      [v4 encodeObject:scrollEdgeAppearance forKey:@"UIToolbarScrollEdgeAppearance"];
    }
    compactScrollEdgeAppearance = self->_compactScrollEdgeAppearance;
    if (compactScrollEdgeAppearance) {
      [v4 encodeObject:compactScrollEdgeAppearance forKey:@"UIToolbarCompactScrollEdgeAppearance"];
    }
  }
}

- (BOOL)_linkedBeforeWhitetailAndInitializedFromCoder
{
  return (*(_WORD *)&self->_toolbarFlags >> 7) & 1;
}

- (int64_t)_barTranslucence
{
  return ((unint64_t)*(_WORD *)&self->_toolbarFlags >> 3) & 7;
}

- (NSString)_backdropViewLayerGroupName
{
  double v2 = [(UIView *)self traitCollection];
  uint64_t v3 = self;
  id v4 = [v2 objectForTrait:v3];

  return (NSString *)v4;
}

- (void)_setBackdropViewLayerGroupName:(id)a3
{
  id v7 = a3;
  id v4 = [(UIView *)self traitOverrides];
  __int16 v5 = self;
  if (v7)
  {
    [v4 setObject:v7 forTrait:v5];
  }
  else
  {
    int v6 = [v4 containsTrait:v5];

    if (!v6) {
      goto LABEL_6;
    }
    id v4 = [(UIView *)self traitOverrides];
    __int16 v5 = self;
    [v4 removeTrait:v5];
  }

LABEL_6:
}

- (void)backdropView:(id)a3 didChangeToGraphicsQuality:(int64_t)a4
{
  id v5 = [(UIView *)self subviews];
  _UINavigationButtonUpdateAccessibilityBackgrounds(v5, a4 == 100, 0);
}

- (BOOL)_shouldStretchDuringCrossfadeTransition
{
  return 0;
}

- (int64_t)_itemDistribution
{
  return [(_UIToolbarVisualProvider *)self->_visualProvider itemDistribution];
}

- (UIView)currentBackgroundView
{
  return [(_UIToolbarVisualProvider *)self->_visualProvider currentBackgroundView];
}

- (double)_backgroundTransitionProgress
{
  [(_UIToolbarVisualProvider *)self->_visualProvider backgroundTransitionProgress];
  return result;
}

- (int64_t)_hintFromCurrentAppearance
{
  [(UIToolbar *)self _backgroundTransitionProgress];
  if (v2 == 0.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_setAppearanceHint:(int64_t)a3
{
  *(_WORD *)&self->_unint64_t toolbarFlags = *(_WORD *)&self->_toolbarFlags & 0xF3FF | ((a3 & 3) << 10);
}

- (int64_t)_appearanceHint
{
  return ((unint64_t)*(_WORD *)&self->_toolbarFlags >> 10) & 3;
}

- (void)setCenterTextButtons:(BOOL)a3
{
  self->_centerTextButtons = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)_sendAction:(id)a3 withEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_items;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "view", (void)v18);
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v6)
        {
          if ([v13 action])
          {
            long long v15 = (void *)UIApp;
            uint64_t v16 = [v13 action];
            long long v17 = [v13 target];
            [v15 sendAction:v16 toTarget:v17 fromSender:v13 forEvent:v7];
          }
          goto LABEL_12;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)_customViewChangedForButtonItem:(id)a3
{
  id v4 = a3;
  if (-[NSArray containsObject:](self->_items, "containsObject:")) {
    [(_UIToolbarVisualProvider *)self->_visualProvider customViewChangedForButtonItem:v4];
  }
}

- (CGRect)_frameOfBarButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  BOOL v6 = [(NSArray *)self->_items containsObject:v4];

  if (!v6 || v5 == 0)
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    uint64_t v8 = [v5 superview];
    [v5 frame];
    objc_msgSend(v8, "convertRect:toView:", self);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)_positionToolbarButtonsAndResetFontScaleAdjustment:(BOOL)a3
{
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v6 = [(UIToolbar *)self items];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v11 = [v5 view];
        double v12 = [v10 view];
        char v13 = [v11 isDescendantOfView:v12];

        if (v13)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  uint64_t v7 = -[UIToolbar _itemAtPoint:](self, "_itemAtPoint:", x, y);
  uint64_t v8 = [v7 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = [v7 view];
    int v10 = [v9 _accessibilityShouldActivateOnHUDLift];

    if (!v10) {
      goto LABEL_5;
    }
    uint64_t v8 = [v7 view];
    double v11 = [v12 view];
    objc_msgSend(v8, "convertPoint:fromView:", v11, x, y);
    objc_msgSend(v8, "_activateForAccessibilityHUDLiftAtPoint:");
  }
LABEL_5:
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [(UIToolbar *)self _itemAtPoint:a3];
  if (v7)
  {
    uint64_t v8 = +[UIAccessibilityHUDItem HUDItemForBarButtonItem:atPoint:inView:isBackButton:](UIAccessibilityHUDItem, "HUDItemForBarButtonItem:atPoint:inView:isBackButton:", v7, self, 0, x, y);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_itemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v6 = self->_items;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "view", (void)v17);
        char v13 = [v11 view];
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        char v14 = objc_msgSend(v12, "pointInside:withEvent:", 0);

        if (v14)
        {
          id v15 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  [(_UIToolbarVisualProvider *)self->_visualProvider defaultSizeForOrientation:a3];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)UIToolbar;
  [(UIView *)&v12 invalidateIntrinsicContentSize];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = [(UIView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidateIntrinsicContentSize];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  self->_disableAutolayoutWarnings = 1;
  v2.receiver = self;
  v2.super_class = (Class)UIToolbar;
  [(UIView *)&v2 dealloc];
}

- (UIView)_backgroundView
{
  return [(_UIToolbarVisualProvider *)self->_visualProvider currentBackgroundView];
}

- (UIImage)backgroundImageForToolbarPosition:(UIBarPosition)topOrBottom barMetrics:(UIBarMetrics)barMetrics
{
  if ((unint64_t)(barMetrics - 101) > 1)
  {
    uint64_t v4 = objc_msgSend(self->__appearanceStorage, "backgroundImageForBarPosition:barMetrics:", topOrBottom);
  }
  else
  {
    if ((backgroundImageForToolbarPosition_barMetrics__didWarn & 1) == 0)
    {
      backgroundImageForToolbarPosition_barMetrics__didWarn = 1;
      NSLog(&cfstr_SCustomization.isa, a2, topOrBottom, "UIToolbar", @"background image", "UIBarMetricsDefaultPrompt", "UIBarMetricsCompactPrompt");
    }
    uint64_t v4 = 0;
  }
  return (UIImage *)v4;
}

- (void)setBackgroundEffects:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  backgroundEffects = self->_backgroundEffects;
  if (backgroundEffects != v4)
  {
    long long v9 = v4;
    BOOL v6 = [(NSArray *)backgroundEffects isEqualToArray:v4];
    uint64_t v4 = v9;
    if (!v6)
    {
      uint64_t v7 = (NSArray *)[(NSArray *)v9 copy];
      long long v8 = self->_backgroundEffects;
      self->_backgroundEffects = v7;

      [(UIToolbar *)self _updateBackgroundView];
      uint64_t v4 = v9;
    }
  }
}

- (void)_setVisualAltitude:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIToolbar;
  [(UIView *)&v4 _setVisualAltitude:a3];
  [(UIToolbar *)self _updateBackgroundView];
}

- (void)_setVisualAltitudeBias:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIToolbar;
  -[UIView _setVisualAltitudeBias:](&v4, sel__setVisualAltitudeBias_, a3.width, a3.height);
  [(UIToolbar *)self _updateBackgroundView];
}

- (void)setShadowImage:(UIImage *)shadowImage forToolbarPosition:(UIBarPosition)topOrBottom
{
  BOOL v6 = shadowImage;
  id appearanceStorage = self->__appearanceStorage;
  if (v6)
  {
    long long v8 = v6;
    id v15 = v6;
    if (!appearanceStorage)
    {
      long long v9 = objc_alloc_init(_UIToolbarAppearanceStorage);
      id v10 = self->__appearanceStorage;
      self->__id appearanceStorage = v9;

      long long v8 = v15;
    }
    if ([(UIImage *)v8 _isResizable] || ([(UIImage *)v15 size], v11 <= 1.0))
    {
      id v13 = v15;
    }
    else
    {
      uint64_t v12 = -[UIImage resizableImageWithCapInsets:](v15, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

      id v13 = (id)v12;
    }
  }
  else
  {
    if (!appearanceStorage) {
      return;
    }
    id v13 = 0;
  }
  id v14 = self->__appearanceStorage;
  id v16 = v13;
  if (topOrBottom == UIBarPositionBottom) {
    goto LABEL_13;
  }
  [v14 setTopShadowImage:v13];
  if (topOrBottom != UIBarPositionTop)
  {
    id v14 = self->__appearanceStorage;
    id v13 = v16;
LABEL_13:
    [v14 setShadowImage:v13];
  }
  [(UIToolbar *)self _setNeedsBackgroundViewUpdate];
}

- (UIImage)shadowImageForToolbarPosition:(UIBarPosition)topOrBottom
{
  id appearanceStorage = self->__appearanceStorage;
  if (topOrBottom == UIBarPositionTop) {
    [appearanceStorage topShadowImage];
  }
  else {
  objc_super v4 = [appearanceStorage shadowImage];
  }
  return (UIImage *)v4;
}

- (void)_setDisableBlurTinting:(BOOL)a3
{
  __int16 toolbarFlags = (__int16)self->_toolbarFlags;
  if (((((toolbarFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 256;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 toolbarFlags = toolbarFlags & 0xFEFF | v4;
    [(UIToolbar *)self _updateBackgroundView];
  }
}

- (void)drawRect:(CGRect)a3
{
}

+ (id)defaultButtonFont
{
  return +[UIToolbarButton defaultButtonFont];
}

+ (double)defaultHeight
{
  return 44.0;
}

- (BOOL)_isLocked
{
  return (*(_WORD *)&self->_toolbarFlags >> 6) & 1;
}

- (void)_setForceTopBarAppearance:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(UIToolbar *)self _setBarPosition:v3];
}

+ (double)defaultHeightForBarSize:(int)a3
{
  NSLog(&cfstr_PleaseStopUsin.isa, a2, "+[UIToolbar defaultHeightForBarSize:]");
  double result = 44.0;
  if (a3 == 2) {
    return 32.0;
  }
  return result;
}

- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a3;
  NSLog(&cfstr_PleaseStopUsin.isa, "-[UIToolbar initInView:withFrame:withItemList:]");
  v13.receiver = self;
  v13.super_class = (Class)UIToolbar;
  double v11 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    [v10 addSubview:v11];
    [(UIView *)v11 setAutoresizingMask:8];
    [(UIToolbar *)v11 _setNeedsBackgroundViewUpdate];
  }

  return v11;
}

- (void)_setButtonBackgroundImage:(id)a3 mini:(id)a4 forStates:(unint64_t)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a3;
  NSLog(&cfstr_PleaseStopUsin.isa, "-[UIToolbar _setButtonBackgroundImage:mini:forStates:]");
  if (a5 >= 2)
  {
    objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIToolbar.m" lineNumber:1091 description:@"Normal and Highlighted (pressed) states are the only supported states."];
  }
  v14[0] = objc_opt_class();
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = +[UIView appearanceWhenContainedInInstancesOfClasses:v11];

  [v12 _setBackgroundImage:v10 forState:a5 barMetrics:0];
  [v12 _setBackgroundImage:v9 forState:a5 barMetrics:1];
}

- (UIView)_shadowView
{
  return self->_shadowView;
}

- (void)_setShadowView:(id)a3
{
}

- (void)_setItemsDidChangeBlock:(id)a3
{
}

- (UIBarButtonItem)centerItem
{
  return self->_centerItem;
}

- (void)setCenterItem:(id)a3
{
}

- (BOOL)autoHidesToolbarInFullscreen
{
  return self->_autoHidesToolbarInFullscreen;
}

- (void)setAutoHidesToolbarInFullscreen:(BOOL)a3
{
  self->_autoHidesToolbarInFullscreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_centerItem, 0);
  objc_storeStrong(&self->__itemsDidChangeBlock, 0);
  objc_storeStrong((id *)&self->_compactAppearance, 0);
  objc_storeStrong((id *)&self->_compactScrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_axHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong(&self->__appearanceStorage, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return 1;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result = 0.0;
  if (a6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIToolbar;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v7, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(void *)&a3, a4, a5, 1, 0.0);
  }
  return result;
}

- (double)_defaultAutolayoutSpacing
{
  return 0.0;
}

@end