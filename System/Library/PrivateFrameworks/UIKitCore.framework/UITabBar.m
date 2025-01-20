@interface UITabBar
+ (Class)_visualProviderClassForTabBar:(id)a3;
+ (id)_unselectedTabTintColorForView:(id)a3;
+ (id)_visualProviderForTabBar:(id)a3;
+ (void)_initializeForIdiom:(int64_t)a3;
- (BOOL)_backgroundNeedsUpdate;
- (BOOL)_blurEnabled;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_deferViewUpdateToFocusUpdate;
- (BOOL)_disableBlurTinting;
- (BOOL)_focusedItemHighlightShouldBeVisible;
- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3;
- (BOOL)_hidesShadow;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isEligibleForFocusOcclusion;
- (BOOL)_isHiddenAwaitingFocus;
- (BOOL)_pendingFocusAction;
- (BOOL)_scrollsItems;
- (BOOL)_shouldDecodeSubviews;
- (BOOL)_showsHighlightedState;
- (BOOL)_subclassImplementsDrawRect;
- (BOOL)_suspendBackgroundUpdates;
- (BOOL)_useVibrantItems;
- (BOOL)_vibrantLabels;
- (BOOL)canBecomeFocused;
- (BOOL)endCustomizingAnimated:(BOOL)animated;
- (BOOL)isCustomizing;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isLocked;
- (BOOL)isSpringLoaded;
- (BOOL)isTranslucent;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGFloat)itemSpacing;
- (CGFloat)itemWidth;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)backgroundEffects;
- (NSArray)items;
- (NSString)_backdropViewLayerGroupName;
- (NSString)description;
- (UIBarStyle)barStyle;
- (UIColor)barTintColor;
- (UIColor)selectedImageTintColor;
- (UIColor)unselectedItemTintColor;
- (UIImage)backgroundImage;
- (UIImage)selectionIndicatorImage;
- (UIImage)shadowImage;
- (UITabBar)initWithCoder:(id)a3;
- (UITabBar)initWithFrame:(CGRect)a3;
- (UITabBarAppearance)scrollEdgeAppearance;
- (UITabBarAppearance)standardAppearance;
- (UITabBarItem)_focusedTabBarItem;
- (UITabBarItem)selectedItem;
- (UITabBarItemPositioning)itemPositioning;
- (UIView)_accessoryView;
- (UIView)_backgroundView;
- (UIView)_expectedSuperviewFollowingAnimation;
- (UIView)_externalViewForSafeAreaInsets;
- (UIView)leadingAccessoryView;
- (UIView)trailingAccessoryView;
- (_UITabBarAccessoryView)_leadingBarAccessoryView;
- (_UITabBarAccessoryView)_trailingBarAccessoryView;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6;
- (double)_backgroundTransitionProgress;
- (double)_defaultAutolayoutSpacing;
- (double)_heightForCustomizingItems;
- (double)_minimumWidthForHorizontalLayout;
- (double)_nextSelectionSlideDuration;
- (double)_scaleFactorForItems:(id)a3 spacing:(double)a4 dimension:(double)a5 maxWidth:(double)a6;
- (double)_shadowAlpha;
- (double)_totalDimensionForItems:(id)a3 spacing:(double)a4 dimension:(double)a5 scaleFactor:(double)a6;
- (id)_appearanceStorage;
- (id)_defaultUnselectedTintColorForDefaultTV;
- (id)_dividerImageForLeftButtonState:(unint64_t)a3 rightButtonState:(unint64_t)a4;
- (id)_effectiveUnselectedLabelTintColor;
- (id)_effectiveUnselectedTabTintColorConsideringView:(id)a3;
- (id)_effectiveUnselectedTintColor;
- (id)_normalInheritedTintColor;
- (id)_shadowView;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_tabBarItemForButtonAtPoint:(CGPoint)a3;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)delegate;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)preferredFocusedView;
- (int64_t)_barMetrics;
- (int64_t)_displayStyle;
- (int64_t)_effectiveBarOrientation;
- (int64_t)_expectedInterfaceOrientation;
- (int64_t)_focusedIndex;
- (int64_t)_imageStyle;
- (int64_t)_rotaryFocusMovementAxis;
- (int64_t)_tabBarSizing;
- (int64_t)barPosition;
- (uint64_t)_performWhileIgnoringLock:(uint64_t)result;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (unint64_t)_preferredFocusHeading;
- (void)_accessibilityButtonShapesParametersDidChange;
- (void)_adjustButtonSelection:(id)a3;
- (void)_buttonCancel:(id)a3;
- (void)_buttonDown:(id)a3;
- (void)_buttonDownDelayed:(id)a3;
- (void)_buttonUp:(id)a3;
- (void)_configureTabBarReplacingItem:(id)a3 withNewItem:(id)a4 swapping:(BOOL)a5;
- (void)_customizeDoneButtonAction:(id)a3;
- (void)_customizeWithAvailableItems:(id)a3;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_dismissCustomizeSheet:(BOOL)a3;
- (void)_doCommonTabBarInit;
- (void)_doCommonTabBarPreInit;
- (void)_effectiveBarTintColorDidChange;
- (void)_installDefaultAppearance;
- (void)_makeCurrentButtonFirstResponder;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_positionAllItems;
- (void)_sendAction:(id)a3 withEvent:(id)a4;
- (void)_setAccessoryView:(id)a3;
- (void)_setBackdropViewLayerGroupName:(id)a3;
- (void)_setBackgroundNeedsUpdate:(BOOL)a3;
- (void)_setBackgroundTransitionProgress:(double)a3;
- (void)_setBackgroundTransitionProgress:(double)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5;
- (void)_setBackgroundView:(id)a3;
- (void)_setBarMetrics:(int64_t)a3;
- (void)_setBarOrientation:(int64_t)a3;
- (void)_setDisableBlurTinting:(BOOL)a3;
- (void)_setDisplayStyle:(int64_t)a3;
- (void)_setFocusedItemHightlightShouldBeVisible:(BOOL)a3;
- (void)_setHiddenAwaitingFocus:(BOOL)a3;
- (void)_setHidesShadow:(BOOL)a3;
- (void)_setImageStyle:(int64_t)a3;
- (void)_setLabelFont:(id)a3;
- (void)_setLabelShadowColor:(id)a3;
- (void)_setLabelShadowOffset:(CGSize)a3;
- (void)_setLabelTextColor:(id)a3 selectedTextColor:(id)a4;
- (void)_setMinimumWidthForHorizontalLayout:(double)a3;
- (void)_setPendingFocusAction:(BOOL)a3;
- (void)_setPreferredFocusHeading:(unint64_t)a3;
- (void)_setScrollsItems:(BOOL)a3;
- (void)_setShadowAlpha:(double)a3;
- (void)_setShowsHighlightedState:(BOOL)a3;
- (void)_setSpringLoaded:(BOOL)a3 force:(BOOL)a4;
- (void)_setSuspendBackgroundUpdates:(BOOL)a3;
- (void)_setTabBarSizing:(int64_t)a3;
- (void)_setVibrantLabels:(BOOL)a3;
- (void)_tabBarFinishedAnimating;
- (void)_tabDataProviderContentDidChange:(id)a3;
- (void)_updateTabBarItemView:(id)a3;
- (void)_useModernAppearance;
- (void)addConstraint:(id)a3;
- (void)beginCustomizingItems:(NSArray *)items;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)dismissCustomizeSheet:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)removeConstraint:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setBackgroundEffects:(id)a3;
- (void)setBackgroundImage:(UIImage *)backgroundImage;
- (void)setBarStyle:(UIBarStyle)barStyle;
- (void)setBarTintColor:(UIColor *)barTintColor;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)delegate;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setItemPositioning:(UITabBarItemPositioning)itemPositioning;
- (void)setItemSpacing:(CGFloat)itemSpacing;
- (void)setItemWidth:(CGFloat)itemWidth;
- (void)setItems:(NSArray *)items;
- (void)setItems:(NSArray *)items animated:(BOOL)animated;
- (void)setLocked:(BOOL)a3;
- (void)setScrollEdgeAppearance:(UITabBarAppearance *)scrollEdgeAppearance;
- (void)setSelectedItem:(UITabBarItem *)selectedItem;
- (void)setSelectionIndicatorImage:(UIImage *)selectionIndicatorImage;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShadowImage:(UIImage *)shadowImage;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setStandardAppearance:(UITabBarAppearance *)standardAppearance;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)setTranslucent:(BOOL)translucent;
- (void)setUnselectedItemTintColor:(UIColor *)unselectedItemTintColor;
- (void)set_expectedSuperviewFollowingAnimation:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UITabBar

- (BOOL)_subclassImplementsDrawRect
{
  if (!__drawRectUITabBarIMP) {
    __drawRectUITabBarIMP = +[UITabBar instanceMethodForSelector:sel_drawRect_];
  }
  uint64_t v3 = [(UITabBar *)self methodForSelector:sel_drawRect_];
  if (v3) {
    BOOL v4 = v3 == __drawRectUITabBarIMP;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

+ (void)_initializeForIdiom:(int64_t)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 2 || a3 == 8)
  {
    if ((id)objc_opt_class() != a1) {
      return;
    }
    uint64_t v28 = _UIAppearanceContainerForUserInterfaceIdiom();
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    BOOL v4 = +[UIView appearanceWhenContainedInInstancesOfClasses:v3];
    [v4 _setBarMetrics:3];
    [v4 _setScrollsItems:1];
    [v4 setItemPositioning:2];
    [v4 setItemSpacing:70.0];
    goto LABEL_8;
  }
  if (a3 == 3 && (id)objc_opt_class() == a1)
  {
    v40[0] = _UIAppearanceContainerForUserInterfaceIdiom();
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    BOOL v4 = +[UIView appearanceWhenContainedInInstancesOfClasses:v3];
    v5 = objc_alloc_init(UIImage);
    [v4 setBackgroundImage:v5];

    v6 = +[UIColor _externalBarBackgroundColor];
    v7 = [v6 colorWithAlphaComponent:0.8];
    [v4 setBackgroundColor:v7];

    v27 = +[UIColorEffect colorEffectSaturate:1.5];
    v8 = +[UIBlurEffect effectWithBlurRadius:10.0];
    v39[0] = v27;
    v39[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    [v4 setBackgroundEffects:v9];

    [v4 _setBarMetrics:1];
    [v4 _setImageStyle:1];
    [v4 _setShowsHighlightedState:1];
    v10 = +[UIView appearanceWhenContainedInInstancesOfClasses:v3];
    v11 = +[UIColor _carSystemSecondaryColor];
    [v10 _setContentTintColor:v11 forState:0];

    v12 = +[UIColor _carSystemFocusSecondaryColor];
    [v10 _setContentTintColor:v12 forState:1];

    v13 = +[UIColor _carSystemFocusSecondaryColor];
    [v10 _setContentTintColor:v13 forState:8];

    v14 = +[UIColor _carSystemFocusLabelColor];
    [v10 _setContentTintColor:v14 forState:5];

    v15 = +[UIBarItem appearanceWhenContainedInInstancesOfClasses:v3];
    uint64_t v37 = *(void *)off_1E52D2048;
    uint64_t v16 = v37;
    v17 = +[UIColor _carSystemSecondaryColor];
    v38 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    [v15 setTitleTextAttributes:v18 forState:0];

    uint64_t v35 = v16;
    v19 = +[UIColor _carSystemFocusColor];
    v36 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v15 setTitleTextAttributes:v20 forState:4];

    uint64_t v33 = v16;
    v21 = +[UIColor _carSystemFocusSecondaryColor];
    v34 = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v15 setTitleTextAttributes:v22 forState:8];

    uint64_t v31 = v16;
    v23 = +[UIColor _carSystemFocusSecondaryColor];
    v32 = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v15 setTitleTextAttributes:v24 forState:1];

    uint64_t v29 = v16;
    v25 = +[UIColor _carSystemFocusLabelColor];
    v30 = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    [v15 setTitleTextAttributes:v26 forState:5];

LABEL_8:
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UITabBar;
  [(UIView *)&v11 _didMoveFromWindow:a3 toWindow:v6];
  if (v6 && ![(UIView *)self _canDrawContent])
  {
    v7 = [v6 screen];
    [v7 scale];
    double v9 = v8;
    v10 = [(UIView *)self layer];
    [v10 setRasterizationScale:v9];
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v19.receiver = self;
  v19.super_class = (Class)UITabBar;
  [(UIView *)&v19 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    -[UITabBar sizeThatFits:](self, "sizeThatFits:", v11, v13);
    if (v15 != v14)
    {
      -[UITabBar setFrame:](self, "setFrame:", v8, v10, v12, v15);
      uint64_t v16 = [(UIView *)self superview];
      [v16 setNeedsLayout];
    }
    v17 = [(UIView *)self _screen];
    uint64_t v18 = [v17 _userInterfaceIdiom];

    if (v18 != a3 && (a3 == 3 || v18 == 3)) {
      [(UITabBar *)self _accessibilityButtonShapesParametersDidChange];
    }
  }
}

- (int64_t)barPosition
{
  return 1;
}

- (id)_normalInheritedTintColor
{
  uint64_t v3 = [(_UITabBarVisualProvider *)self->_visualProvider defaultTintColor];
  if ([(UIView *)self _definesTintColor] || !v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    id v4 = [(UIView *)&v7 _normalInheritedTintColor];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)_effectiveUnselectedTabTintColorConsideringView:(id)a3
{
  id v4 = a3;
  v5 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage unselectedImageTintColor];
  if (!v5)
  {
    v5 = +[UITabBar _unselectedTabTintColorForView:v4];
  }

  return v5;
}

+ (id)_unselectedTabTintColorForView:(id)a3
{
  return (id)[a3 tintColor];
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UITabBar;
  return [(UIView *)&v3 _edgesPropagatingSafeAreaInsetsToSubviews];
}

- (id)_effectiveUnselectedTintColor
{
  v2 = [(UITabBar *)self unselectedItemTintColor];
  if (!v2)
  {
    v2 = +[UIColor colorWithWhite:0.57254902 alpha:0.85];
  }
  return v2;
}

- (id)_effectiveUnselectedLabelTintColor
{
  v2 = [(UITabBar *)self unselectedItemTintColor];
  if (!v2)
  {
    v2 = +[UIColor colorWithWhite:0.57254902 alpha:1.0];
  }
  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UITabBar _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(UIView *)self superview];
  if (v8) {
    [(UIView *)self superview];
  }
  else {
  double v9 = [(UIView *)self _screen];
  }
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  int64_t v14 = [(UITabBar *)self _effectiveBarOrientation];
  if ((unint64_t)(v14 - 1) >= 2) {
    double v15 = v7;
  }
  else {
    double v15 = v13;
  }
  if ((unint64_t)(v14 - 1) >= 2) {
    double v16 = v11;
  }
  else {
    double v16 = v5;
  }
  result.height = v15;
  result.width = v16;
  return result;
}

- (int64_t)_effectiveBarOrientation
{
  if (self->_barOrientation) {
    return self->_barOrientation;
  }
  else {
    return 4;
  }
}

- (int64_t)_barMetrics
{
  return self->_barMetrics;
}

- (int64_t)_expectedInterfaceOrientation
{
  objc_super v3 = [(UIView *)self window];
  if (v3) {
    goto LABEL_2;
  }
  if ((*((unsigned char *)&self->_tabBarFlags + 2) & 2) == 0)
  {
    objc_super v3 = 0;
LABEL_8:
    int64_t v5 = 1;
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v3 = [WeakRetained _tabBarWindowForInterfaceOrientation:self];

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

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  -[_UITabBarVisualProvider intrinsicContentSizeGivenSize:](self->_visualProvider, "intrinsicContentSizeGivenSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isTranslucent
{
  char v7 = 1;
  int v2 = (*(_DWORD *)&self->_tabBarFlags >> 7) & 7;
  if (v2) {
    return v2 == 1;
  }
  if ([(UIView *)self _currentUserInterfaceIdiom] == 3) {
    return 1;
  }
  int64_t v5 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage backgroundImage];
  double v6 = v5;
  if (v5) {
    [v5 _isInvisibleAndGetIsTranslucent:&v7];
  }

  return v7 != 0;
}

- (void)_setBackgroundTransitionProgress:(double)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5
{
}

- (double)_backgroundTransitionProgress
{
  [(_UITabBarVisualProvider *)self->_visualProvider backgroundTransitionProgress];
  return result;
}

- (void)_setBackgroundTransitionProgress:(double)a3
{
}

- (void)_setBackdropViewLayerGroupName:(id)a3
{
  id v7 = a3;
  double v4 = [(UIView *)self traitOverrides];
  int64_t v5 = self;
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
    double v4 = [(UIView *)self traitOverrides];
    int64_t v5 = self;
    [v4 removeTrait:v5];
  }

LABEL_6:
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  visualProvider = self->_visualProvider;
  id v5 = a3;
  int v6 = [(UIView *)self traitCollection];
  id v7 = [(_UITabBarVisualProvider *)visualProvider traitCollectionForChild:v5 baseTraitCollection:v6];

  return v7;
}

- (UIBarStyle)barStyle
{
  return ((unint64_t)self->_tabBarFlags >> 4) & 7;
}

- (BOOL)_useVibrantItems
{
  if (!dyld_program_sdk_at_least() || ![(UITabBar *)self isTranslucent]) {
    return 0;
  }
  double v3 = [(UITabBar *)self barTintColor];
  double v4 = [(UITabBar *)self unselectedItemTintColor];
  if (v3 && ([v3 alphaComponent], v5 != 0.0) || v4 && (objc_msgSend(v4, "alphaComponent"), v6 != 0.0))
  {
    BOOL v8 = 0;
  }
  else
  {
    id v7 = [(UIView *)self traitCollection];
    BOOL v8 = [v7 userInterfaceIdiom] != 3;
  }
  return v8;
}

- (UIColor)unselectedItemTintColor
{
  return [(_UITabBarAppearanceStorage *)self->_appearanceStorage unselectedImageTintColor];
}

- (UIColor)barTintColor
{
  return [(_UITabBarAppearanceStorage *)self->_appearanceStorage barTintColor];
}

- (UIImage)backgroundImage
{
  return [(_UITabBarAppearanceStorage *)self->_appearanceStorage backgroundImage];
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (void)_setBackgroundNeedsUpdate:(BOOL)a3
{
  $A65F59733608D94F9E77A112F9FC6161 tabBarFlags = self->_tabBarFlags;
  if ((*(_DWORD *)&tabBarFlags & 0x40000) == 0)
  {
    if (a3) {
      int v4 = 1024;
    }
    else {
      int v4 = 0;
    }
    self->_$A65F59733608D94F9E77A112F9FC6161 tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&tabBarFlags & 0xFFFFFBFF | v4);
    if (a3) {
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)_disableBlurTinting
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 6) & 1;
}

- (UITabBarItem)selectedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedItem);
  return (UITabBarItem *)WeakRetained;
}

- (UITabBarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (UITabBarAppearance)standardAppearance
{
  standardAppearance = self->_standardAppearance;
  if (!standardAppearance)
  {
    [(UITabBar *)self _installDefaultAppearance];
    standardAppearance = self->_standardAppearance;
  }
  return standardAppearance;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBar;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(_UITabBarVisualProvider *)self->_visualProvider setSemanticContentAttribute:a3];
}

- (void)layoutSubviews
{
  [(_UITabBarVisualProvider *)self->_visualProvider layoutSubviews];
  v3.receiver = self;
  v3.super_class = (Class)UITabBar;
  [(UIView *)&v3 layoutSubviews];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBar;
  id v4 = a3;
  [(UIView *)&v5 traitCollectionDidChange:v4];
  -[_UITabBarVisualProvider traitCollectionDidChange:](self->_visualProvider, "traitCollectionDidChange:", v4, v5.receiver, v5.super_class);
}

- (BOOL)_suspendBackgroundUpdates
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 2) >> 2) & 1;
}

- (NSArray)items
{
  return self->_items;
}

- (UIImage)selectionIndicatorImage
{
  return [(_UITabBarAppearanceStorage *)self->_appearanceStorage selectionIndicatorImage];
}

- (CGFloat)itemWidth
{
  return self->_itemDimension;
}

- (CGFloat)itemSpacing
{
  return self->_itemSpacing;
}

- (UITabBarItemPositioning)itemPositioning
{
  return self->_itemPositioning;
}

- (id)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (BOOL)_showsHighlightedState
{
  return self->_showsHighlightedState;
}

- (int64_t)_imageStyle
{
  if (self->_imageStyle) {
    return self->_imageStyle;
  }
  else {
    return 2;
  }
}

- (int64_t)_tabBarSizing
{
  return self->_tabBarSizing;
}

- (void)setStandardAppearance:(UITabBarAppearance *)standardAppearance
{
  id v4 = standardAppearance;
  objc_super v5 = self->_standardAppearance;
  double v6 = v4;
  v21 = v6;
  if (v5 == v6)
  {

    BOOL v8 = v21;
    goto LABEL_21;
  }
  if (!v6 || !v5)
  {

LABEL_8:
    BOOL v8 = self->_standardAppearance;
    double v9 = self->_standardAppearance;
    if (v9) {
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    }
    double v10 = [(UIBarAppearance *)v21 copy];
    double v11 = self->_standardAppearance;
    self->_standardAppearance = v10;

    [(UITabBar *)self _installDefaultAppearance];
    double v12 = [(_UITabBarVisualProvider *)self->_visualProvider appearanceObserver];
    double v13 = self->_standardAppearance;
    if (v13) {
      objc_storeWeak((id *)&v13->super._changeObserver, v12);
    }

    [(_UITabBarVisualProvider *)self->_visualProvider backgroundTransitionProgress];
    if (v14 >= 1.0) {
      goto LABEL_21;
    }
    double v15 = [(UIBarAppearance *)self->_standardAppearance _backgroundData];
    double v16 = [(UIBarAppearance *)v8 _backgroundData];
    id v17 = v15;
    id v18 = v16;
    if (v17 == v18)
    {
    }
    else
    {
      objc_super v19 = v18;
      if (v17 && v18)
      {
        char v20 = [v17 isEqual:v18];

        if (v20) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      [(UITabBar *)self _setBackgroundNeedsUpdate:1];
    }
LABEL_21:

    goto LABEL_22;
  }
  BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

  if (!v7) {
    goto LABEL_8;
  }
LABEL_22:
  [(UITabBar *)self _useModernAppearance];
}

- (void)setScrollEdgeAppearance:(UITabBarAppearance *)scrollEdgeAppearance
{
  id v4 = scrollEdgeAppearance;
  objc_super v5 = self->_scrollEdgeAppearance;
  double v6 = v4;
  v21 = v6;
  if (v5 == v6)
  {

    BOOL v8 = v21;
    goto LABEL_21;
  }
  if (!v6 || !v5)
  {

LABEL_8:
    BOOL v8 = self->_scrollEdgeAppearance;
    double v9 = self->_scrollEdgeAppearance;
    if (v9) {
      objc_storeWeak((id *)&v9->super._changeObserver, 0);
    }
    double v10 = [(UIBarAppearance *)v21 copy];
    double v11 = self->_scrollEdgeAppearance;
    self->_scrollEdgeAppearance = v10;

    [(UITabBar *)self _installDefaultAppearance];
    double v12 = [(_UITabBarVisualProvider *)self->_visualProvider appearanceObserver];
    double v13 = self->_scrollEdgeAppearance;
    if (v13) {
      objc_storeWeak((id *)&v13->super._changeObserver, v12);
    }

    [(_UITabBarVisualProvider *)self->_visualProvider backgroundTransitionProgress];
    if (v14 <= 0.0) {
      goto LABEL_21;
    }
    double v15 = [(UIBarAppearance *)self->_scrollEdgeAppearance _backgroundData];
    double v16 = [(UIBarAppearance *)v8 _backgroundData];
    id v17 = v15;
    id v18 = v16;
    if (v17 == v18)
    {
    }
    else
    {
      objc_super v19 = v18;
      if (v17 && v18)
      {
        char v20 = [v17 isEqual:v18];

        if (v20) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      [(UITabBar *)self _setBackgroundNeedsUpdate:1];
    }
LABEL_21:

    goto LABEL_22;
  }
  BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

  if (!v7) {
    goto LABEL_8;
  }
LABEL_22:
  [(UITabBar *)self _useModernAppearance];
}

- (void)_useModernAppearance
{
}

- (void)_installDefaultAppearance
{
  if (!self->_standardAppearance)
  {
    objc_super v3 = (UITabBarAppearance *)objc_opt_new();
    standardAppearance = self->_standardAppearance;
    self->_standardAppearance = v3;

    objc_super v5 = [(_UITabBarVisualProvider *)self->_visualProvider appearanceObserver];
    double v6 = self->_standardAppearance;
    if (v6)
    {
      BOOL v7 = v5;
      objc_storeWeak((id *)&v6->super._changeObserver, v5);
      objc_super v5 = v7;
    }
  }
}

- (UITabBar)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBar;
  objc_super v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UITabBar *)v3 _doCommonTabBarPreInit];
  [(UITabBar *)v3 _setBackgroundNeedsUpdate:1];
  [(UITabBar *)v3 _doCommonTabBarInit];
  return v3;
}

- (void)_doCommonTabBarPreInit
{
  int v3 = dyld_program_sdk_at_least();
  self->_displayStyle = 0;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v5 = [v4 BOOLForKey:@"UseTabBarLegacyTVStyle"];

    if (v5) {
      self->_displayStyle = 0;
    }
  }
  double v6 = [(id)objc_opt_class() _visualProviderForTabBar:self];
  visualProvider = self->_visualProvider;
  self->_visualProvider = v6;
}

- (void)_doCommonTabBarInit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    int v4 = 0x20000;
  }
  else {
    int v4 = 0;
  }
  self->_$A65F59733608D94F9E77A112F9FC6161 tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFDFFFF | v4);

  if (self->_standardAppearance) {
    goto LABEL_7;
  }
  if (_UIBarAppearanceAPIVersion() >= 2)
  {
    [(UITabBar *)self _installDefaultAppearance];
LABEL_7:
    [(_UITabBarVisualProvider *)self->_visualProvider setUseModernAppearance:1];
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    int v5 = [(UIView *)self _screen];
    uint64_t v6 = [v5 _userInterfaceIdiom];

    if (v6 == 1) {
      self->_barMetrics = 2;
    }
  }
  BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__accessibilityButtonShapesEnabledDidChangeNotification_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  visualProvider = self->_visualProvider;
  [(_UITabBarVisualProvider *)visualProvider prepare];
}

+ (id)_visualProviderForTabBar:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_visualProviderClassForTabBar:", v4)), "initWithTabBar:", v4);

  return v5;
}

+ (Class)_visualProviderClassForTabBar:(id)a3
{
  return (Class)objc_opt_class();
}

- (UIView)_externalViewForSafeAreaInsets
{
  int v3 = [(UITabBar *)self _expectedSuperviewFollowingAnimation];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIView *)self superview];
  }
  uint64_t v6 = v5;

  return (UIView *)v6;
}

- (UIView)_expectedSuperviewFollowingAnimation
{
  return self->__expectedSuperviewFollowingAnimation;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  [(UIView *)self frame];
  double v13 = v12;
  double v15 = v14;
  v17.receiver = self;
  v17.super_class = (Class)UITabBar;
  -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
  if (width != v13 || height != v15)
  {
    -[_UITabBarVisualProvider tabBarSizeChanged:](self->_visualProvider, "tabBarSizeChanged:", v9, v11);
    [(UIView *)self setNeedsLayout];
    [(UIView *)self setNeedsDisplay];
  }
}

- (uint64_t)_performWhileIgnoringLock:(uint64_t)result
{
  if (result)
  {
    int v2 = (void *)result;
    int v3 = a2;
    uint64_t v4 = [v2 isLocked];
    [v2 setLocked:0];
    v3[2](v3);

    return [v2 setLocked:v4];
  }
  return result;
}

- (void)setLocked:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$A65F59733608D94F9E77A112F9FC6161 tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFFFF7 | v3);
}

- (BOOL)isLocked
{
  return (*(unsigned char *)&self->_tabBarFlags >> 3) & 1;
}

- (void)setSelectedItem:(UITabBarItem *)selectedItem
{
  obj = selectedItem;
  if ([(UITabBar *)self isLocked])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Directly modifying a tab bar managed by a tab bar controller is not allowed."];
    goto LABEL_10;
  }
  id WeakRetained = (UITabBarItem *)objc_loadWeakRetained((id *)&self->_selectedItem);
  id v5 = WeakRetained;
  if (obj)
  {
    if ([(NSArray *)self->_items containsObject:obj]) {
      BOOL v6 = v5 == obj;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      goto LABEL_9;
    }
  }
  else if (!WeakRetained)
  {
    goto LABEL_9;
  }
  objc_storeWeak((id *)&self->_selectedItem, obj);
  [(_UITabBarVisualProvider *)self->_visualProvider changeSelectedItem:obj fromItem:v5];
LABEL_9:

LABEL_10:
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated
{
  BOOL v4 = animated;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  BOOL v6 = items;
  if ([(UITabBar *)self isLocked])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Directly modifying a tab bar managed by a tab bar controller is not allowed."];
  }
  else if (self->_items != v6)
  {
    BOOL v7 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage _tabItemAppearanceStorage];
    double v8 = v7;
    if (v7)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __30__UITabBar_setItems_animated___block_invoke;
      v44[3] = &unk_1E52DF4B0;
      id v45 = v7;
      [(NSArray *)v6 enumerateObjectsUsingBlock:v44];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedItem);
    BOOL v35 = v4;
    v34 = v8;
    location = (id *)&self->_selectedItem;
    if (-[NSArray containsObject:](v6, "containsObject:"))
    {
      id v9 = objc_loadWeakRetained((id *)&self->_selectedItem);
      objc_storeWeak((id *)&self->_selectedItem, v9);
    }
    else
    {
      objc_storeWeak((id *)&self->_selectedItem, 0);
    }
    uint64_t v31 = (void *)[(NSArray *)self->_items mutableCopy];
    [v31 removeObjectsInArray:v6];
    double v10 = (NSArray *)[(NSArray *)v6 copy];
    double v11 = self->_items;
    self->_items = v10;

    [(UITabBar *)self _setSpringLoaded:HIWORD(*(_DWORD *)&self->_tabBarFlags) & 1 force:0];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    double v12 = self->_items;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_super v17 = *(id **)(*((void *)&v40 + 1) + 8 * i);
          id v18 = [(UIView *)self traitCollection];
          uint64_t v19 = [v18 userInterfaceIdiom];

          if (v19 == 6 && v17) {
            objc_storeWeak(v17 + 35, self);
          }
          if ([v17 _usesModernAppearance])
          {
            [(UITabBar *)self _useModernAppearance];
            goto LABEL_22;
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_22:

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = v31;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * j);
          v26 = [(UIView *)self traitCollection];
          uint64_t v27 = [v26 userInterfaceIdiom];

          if (v27 == 6 && v25) {
            objc_storeWeak((id *)(v25 + 280), 0);
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v22);
    }

    visualProvider = self->_visualProvider;
    uint64_t v29 = self->_items;
    id v30 = objc_loadWeakRetained(location);
    [(_UITabBarVisualProvider *)visualProvider changeItemsTo:v29 removingItems:v20 selectedItem:v30 oldSelectedItem:WeakRetained animate:v35];
  }
}

- (void)_setSpringLoaded:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 || a4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v6 = self->_items;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setSpringLoaded:", v4, (void)v12);
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  if (v4) {
    int v11 = 0x10000;
  }
  else {
    int v11 = 0;
  }
  self->_$A65F59733608D94F9E77A112F9FC6161 tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFEFFFF | v11);
}

- (void)setDelegate:(id)delegate
{
  obuint64_t j = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    if ([(UITabBar *)self isLocked])
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Changing the delegate of a tab bar managed by a tab bar controller is not allowed."];
    }
    else
    {
      id v6 = objc_storeWeak((id *)&self->_delegate, obj);
      if (objc_opt_respondsToSelector()) {
        int v7 = 0x20000;
      }
      else {
        int v7 = 0;
      }
      self->_$A65F59733608D94F9E77A112F9FC6161 tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFDFFFF | v7);
    }
    id v5 = obj;
  }
}

- (void)_setHidesShadow:(BOOL)a3
{
  self->_hidesShadow = a3;
  id v4 = [(_UITabBarVisualProvider *)self->_visualProvider _shim_shadowView];
  [v4 setHidden:self->_hidesShadow];
}

- (void)_setBarOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[UITabBar _setBarOrientation:]"];
    [v5 handleFailureInFunction:v6, @"UITabBar.m", 1655, @"Invalid parameter not satisfying: %@", @"UIDeviceOrientationIsValidInterfaceOrientation(orientation)" file lineNumber description];
  }
  int64_t v7 = [(UITabBar *)self _effectiveBarOrientation];
  self->_barOrientation = a3;
  if (v7 != [(UITabBar *)self _effectiveBarOrientation])
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setAccessoryView:(id)a3
{
}

- (void)setSpringLoaded:(BOOL)a3
{
}

- (void)_setBackgroundView:(id)a3
{
}

- (void)setTintColor:(UIColor *)tintColor
{
  v3.receiver = self;
  v3.super_class = (Class)UITabBar;
  [(UIView *)&v3 setTintColor:tintColor];
}

- (void)_setMinimumWidthForHorizontalLayout:(double)a3
{
}

- (UIView)_backgroundView
{
  return (UIView *)[(_UITabBarVisualProvider *)self->_visualProvider _shim_compatibilityBackgroundView];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIView *)self isHidden];
  v11.receiver = self;
  v11.super_class = (Class)UITabBar;
  [(UIView *)&v11 setHidden:v3];
  if (v5 != v3)
  {
    if ([(UITabBar *)self isLocked])
    {
      [(UIView *)self alpha];
      if (v6 != 0.0)
      {
        p_delegate = &self->_delegate;
        id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          id v10 = objc_loadWeakRetained((id *)p_delegate);
          [v10 _tabBarVisibilityDidChange];
        }
      }
    }
  }
}

- (void)setAlpha:(double)a3
{
  [(UIView *)self alpha];
  double v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)UITabBar;
  [(UIView *)&v11 setAlpha:a3];
  if (![(UIView *)self isHidden] && (a3 == 0.0 && v6 != 0.0 || a3 != 0.0 && v6 == 0.0))
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 _tabBarVisibilityDidChange];
    }
  }
}

- (void)setTranslucent:(BOOL)translucent
{
  $A65F59733608D94F9E77A112F9FC6161 tabBarFlags = self->_tabBarFlags;
  if (translucent) {
    unsigned int v4 = 128;
  }
  else {
    unsigned int v4 = 256;
  }
  self->_$A65F59733608D94F9E77A112F9FC6161 tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&tabBarFlags & 0xFFFFFC7F | v4);
  if (((*(unsigned int *)&tabBarFlags >> 7) & 7) != v4 >> 7) {
    [(UITabBar *)self _setBackgroundNeedsUpdate:1];
  }
}

- (void)dealloc
{
  [(_UITabBarVisualProvider *)self->_visualProvider teardown];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UITabBar;
  [(UIView *)&v4 dealloc];
}

- (NSString)_backdropViewLayerGroupName
{
  int v2 = [(UIView *)self traitCollection];
  BOOL v3 = self;
  objc_super v4 = [v2 objectForTrait:v3];

  return (NSString *)v4;
}

- (void)setBarStyle:(UIBarStyle)barStyle
{
  if ((unint64_t)barStyle >= UIBarStyleBlackTranslucent) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Bar style not supported by UITabBar. Supported bar styles are UIBarStyleDefault and UIBarStyleBlack"];
  }
  unint64_t tabBarFlags = self->_tabBarFlags;
  if (((tabBarFlags >> 4) & 7) != barStyle)
  {
    self->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(tabBarFlags & 0xFFFFFF8F | (16 * (barStyle & 7)));
    [(UITabBar *)self _setBackgroundNeedsUpdate:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->__expectedSuperviewFollowingAnimation, 0);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_storeStrong((id *)&self->_trailingBarAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingBarAccessoryView, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_customizationItems, 0);
  objc_destroyWeak((id *)&self->_selectedItem);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customizeView, 0);
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)UITabBar;
  BOOL v3 = [(UIView *)&v6 description];
  objc_super v4 = (void *)[v3 mutableCopy];

  if (self->_standardAppearance) {
    objc_msgSend(v4, "appendFormat:", @" standardAppearance=%p", self->_standardAppearance);
  }
  if (self->_scrollEdgeAppearance) {
    objc_msgSend(v4, "appendFormat:", @" scrollEdgeAppearance=%p", self->_scrollEdgeAppearance);
  }
  return (NSString *)v4;
}

- (void)_setLabelFont:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    objc_super v6 = objc_alloc_init(_UITabBarAppearanceStorage);
    int64_t v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  uint64_t v8 = [(_UITabBarAppearanceStorage *)appearanceStorage tabItemAppearanceStorage];
  uint64_t v9 = *(void *)off_1E52D2040;
  [v8 setTextAttribute:v4 forKey:*(void *)off_1E52D2040 state:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_items;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "_setTitleTextAttributeValue:forAttributeKey:state:", v4, v9, 0, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)_setLabelTextColor:(id)a3 selectedTextColor:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    uint64_t v9 = objc_alloc_init(_UITabBarAppearanceStorage);
    id v10 = self->_appearanceStorage;
    self->_appearanceStorage = v9;

    appearanceStorage = self->_appearanceStorage;
  }
  uint64_t v11 = [(_UITabBarAppearanceStorage *)appearanceStorage tabItemAppearanceStorage];
  uint64_t v12 = *(void *)off_1E52D2048;
  [v11 setTextAttribute:v6 forKey:*(void *)off_1E52D2048 state:0];
  [v11 setTextAttribute:v7 forKey:v12 state:4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_items;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v18, "_setTitleTextAttributeValue:forAttributeKey:state:", v6, v12, 0, (void)v19);
        [v18 _setTitleTextAttributeValue:v7 forAttributeKey:v12 state:4];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (void)_setLabelShadowColor:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    id v6 = objc_alloc_init(_UITabBarAppearanceStorage);
    id v7 = self->_appearanceStorage;
    self->_appearanceStorage = v6;

    appearanceStorage = self->_appearanceStorage;
  }
  uint64_t v8 = [(_UITabBarAppearanceStorage *)appearanceStorage tabItemAppearanceStorage];
  uint64_t v9 = *(void *)off_1E52D2238;
  id v10 = [v8 textAttributeForKey:*(void *)off_1E52D2238 state:0];

  if (!v10) {
    id v10 = objc_alloc_init((Class)off_1E52D2E28);
  }
  [v10 setShadowColor:v4];
  uint64_t v11 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage tabItemAppearanceStorage];
  [v11 setTextAttribute:v10 forKey:v9 state:0];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_items;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "_setTitleTextAttributeValue:forAttributeKey:state:", v10, v9, 0, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)_setLabelShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    id v7 = objc_alloc_init(_UITabBarAppearanceStorage);
    uint64_t v8 = self->_appearanceStorage;
    self->_appearanceStorage = v7;

    appearanceStorage = self->_appearanceStorage;
  }
  uint64_t v9 = [(_UITabBarAppearanceStorage *)appearanceStorage tabItemAppearanceStorage];
  uint64_t v10 = *(void *)off_1E52D2238;
  id v11 = [v9 textAttributeForKey:*(void *)off_1E52D2238 state:0];

  if (!v11) {
    id v11 = objc_alloc_init((Class)off_1E52D2E28);
  }
  objc_msgSend(v11, "setShadowOffset:", width, height);
  uint64_t v12 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage tabItemAppearanceStorage];
  [v12 setTextAttribute:v11 forKey:v10 state:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v13 = self->_items;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "_setTitleTextAttributeValue:forAttributeKey:state:", v11, v10, 0, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)_setVibrantLabels:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_tabBarFlags & 0x2000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 0x2000;
    }
    else {
      int v3 = 0;
    }
    self->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFDFFF | v3);
  }
}

- (BOOL)_vibrantLabels
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 5) & 1;
}

- (BOOL)_blurEnabled
{
  return 1;
}

- (void)_setDisableBlurTinting:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_tabBarFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 0x4000;
    }
    else {
      int v3 = 0;
    }
    self->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFBFFF | v3);
    [(UITabBar *)self _setBackgroundNeedsUpdate:1];
  }
}

- (void)_tabDataProviderContentDidChange:(id)a3
{
}

- (double)_nextSelectionSlideDuration
{
  return 0.0;
}

- (UIView)_accessoryView
{
  return (UIView *)[(_UITabBarVisualProvider *)self->_visualProvider _shim_accessoryView];
}

- (double)_minimumWidthForHorizontalLayout
{
  [(_UITabBarVisualProvider *)self->_visualProvider minimumWidthForHorizontalLayout];
  return result;
}

- (double)_shadowAlpha
{
  int v2 = [(_UITabBarVisualProvider *)self->_visualProvider _shim_shadowView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)_setShadowAlpha:(double)a3
{
  id v4 = [(_UITabBarVisualProvider *)self->_visualProvider _shim_shadowView];
  [v4 setAlpha:a3];
}

- (void)_setSuspendBackgroundUpdates:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFBFFFF | v3);
  if (!a3) {
    [(UIView *)self setNeedsLayout];
  }
}

- (BOOL)_backgroundNeedsUpdate
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 2) & 1;
}

- (void)_setTabBarSizing:(int64_t)a3
{
  double v5 = [(UIView *)self _screen];
  uint64_t v6 = [v5 _userInterfaceIdiom];

  self->_tabBarSizing = a3;
  int64_t barMetrics = self->_barMetrics;
  if (a3 == 2)
  {
    int64_t v8 = 2;
  }
  else if ((unint64_t)(v6 - 2) > 6)
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = qword_186B938B0[v6 - 2];
  }
  self->_int64_t barMetrics = v8;
  if (barMetrics != v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBarSizingDidChange:self];
    }
  }
}

- (UITabBar)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UITabBar;
  double v5 = [(UIView *)&v25 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [(UITabBar *)v5 _doCommonTabBarPreInit];
    id v7 = [v4 decodeObjectForKey:@"UIDelegate"];
    objc_storeWeak((id *)&v6->_delegate, v7);

    uint64_t v8 = [(UITabBar *)v6 isLocked];
    [(UITabBar *)v6 setLocked:0];
    [(UIView *)v6 setClipsToBounds:0];
    uint64_t v9 = [v4 decodeObjectForKey:@"UISelectionIndicatorImage"];
    [(UITabBar *)v6 setSelectionIndicatorImage:v9];

    if ([v4 containsValueForKey:@"UISpringLoaded"])
    {
      if ([v4 decodeBoolForKey:@"UISpringLoaded"]) {
        int v10 = 0x10000;
      }
      else {
        int v10 = 0;
      }
      v6->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&v6->_tabBarFlags & 0xFFFEFFFF | v10);
    }
    id v11 = [v4 decodeObjectForKey:@"UIItems"];
    if (v11)
    {
      if (v8) {
        objc_storeStrong((id *)&v6->_items, v11);
      }
      else {
        [(UITabBar *)v6 setItems:v11 animated:0];
      }
    }
    uint64_t v12 = [v4 decodeObjectForKey:@"UISelectedItem"];
    [(UITabBar *)v6 setSelectedItem:v12];
    [(UITabBar *)v6 setLocked:v8];
    uint64_t v13 = [v4 decodeObjectForKey:@"UIBarTintColor"];
    [(UITabBar *)v6 setBarTintColor:v13];

    uint64_t v14 = [v4 decodeObjectForKey:@"UIBarUnselectedImageTintColor"];
    [(UITabBar *)v6 setUnselectedItemTintColor:v14];

    uint64_t v15 = [v4 decodeObjectForKey:@"UISelectedImageTintColor"];
    if (v15) {
      [(UITabBar *)v6 setSelectedImageTintColor:v15];
    }
    uint64_t v16 = [v4 decodeObjectForKey:@"UIShadowImage"];
    [(UITabBar *)v6 setShadowImage:v16];

    uint64_t v17 = [v4 decodeObjectForKey:@"UIBackgroundImage"];
    if (v17) {
      [(UITabBar *)v6 setBackgroundImage:v17];
    }
    else {
      [(UITabBar *)v6 _setBackgroundNeedsUpdate:1];
    }
    uint64_t v18 = [v4 decodeObjectForKey:@"UITabBarStandardAppearance"];
    standardAppearance = v6->_standardAppearance;
    v6->_standardAppearance = (UITabBarAppearance *)v18;

    uint64_t v20 = [v4 decodeObjectForKey:@"UITabBarScrollEdgeAppearance"];
    scrollEdgeAppearance = v6->_scrollEdgeAppearance;
    v6->_scrollEdgeAppearance = (UITabBarAppearance *)v20;

    if ([v4 containsValueForKey:@"UITabBarItemPositioning"]) {
      v6->_itemPositioning = [v4 decodeIntegerForKey:@"UITabBarItemPositioning"];
    }
    if ([v4 containsValueForKey:@"UITabBarItemWidth"])
    {
      [v4 decodeDoubleForKey:@"UITabBarItemWidth"];
      v6->_itemDimension = v22;
    }
    if ([v4 containsValueForKey:@"UITabBarItemSpacing"])
    {
      [v4 decodeDoubleForKey:@"UITabBarItemSpacing"];
      v6->_itemSpacing = v23;
    }
    if ([v4 containsValueForKey:@"UIBarTranslucence"]) {
      v6->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&v6->_tabBarFlags & 0xFFFFFC7F | (([v4 decodeIntegerForKey:@"UIBarTranslucence"] & 7) << 7));
    }
    if ([v4 containsValueForKey:@"UIBarStyle"]) {
      v6->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&v6->_tabBarFlags & 0xFFFFFF8F | (16 * ([v4 decodeIntegerForKey:@"UIBarStyle"] & 7)));
    }
  }
  [(UITabBar *)v6 _doCommonTabBarInit];

  return v6;
}

- (BOOL)_shouldDecodeSubviews
{
  int v2 = (void *)[(id)objc_opt_class() _visualProviderClassForTabBar:self];
  return [v2 shouldDecodeSubviews];
}

- (void)_populateArchivedSubviews:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBar;
  id v4 = a3;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  -[_UITabBarVisualProvider updateArchivedSubviews:](self->_visualProvider, "updateArchivedSubviews:", v4, v5.receiver, v5.super_class);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UITabBar;
  [(UIView *)&v24 encodeWithCoder:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained forKey:@"UIDelegate"];
  }
  items = self->_items;
  if (items) {
    [v4 encodeObject:items forKey:@"UIItems"];
  }
  id v7 = objc_loadWeakRetained((id *)&self->_selectedItem);

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_selectedItem);
    [v4 encodeObject:v8 forKey:@"UISelectedItem"];
  }
  uint64_t v9 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage barTintColor];

  if (v9)
  {
    int v10 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage barTintColor];
    [v4 encodeObject:v10 forKey:@"UIBarTintColor"];
  }
  id v11 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage unselectedImageTintColor];

  if (v11)
  {
    uint64_t v12 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage unselectedImageTintColor];
    [v4 encodeObject:v12 forKey:@"UIBarUnselectedImageTintColor"];
  }
  uint64_t v13 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage selectedImageTintColor];

  if (v13)
  {
    uint64_t v14 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage selectedImageTintColor];
    [v4 encodeObject:v14 forKey:@"UISelectedImageTintColor"];
  }
  uint64_t v15 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage selectionIndicatorImage];
  if (v15) {
    [v4 encodeObject:v15 forKey:@"UISelectionIndicatorImage"];
  }
  uint64_t v16 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage shadowImage];

  if (v16) {
    [v4 encodeObject:v16 forKey:@"UIShadowImage"];
  }
  uint64_t v17 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage backgroundImage];

  if (v17) {
    [v4 encodeObject:v17 forKey:@"UIBackgroundImage"];
  }
  int64_t itemPositioning = self->_itemPositioning;
  if (itemPositioning) {
    [v4 encodeInteger:itemPositioning forKey:@"UITabBarItemPositioning"];
  }
  if (self->_itemDimension > 0.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UITabBarItemWidth");
  }
  if (self->_itemSpacing > 0.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UITabBarItemSpacing");
  }
  unint64_t tabBarFlags = self->_tabBarFlags;
  uint64_t v20 = (tabBarFlags >> 7) & 7;
  if (v20)
  {
    [v4 encodeInteger:v20 forKey:@"UIBarTranslucence"];
    LODWORD(tabBarFlags) = self->_tabBarFlags;
  }
  uint64_t v21 = (tabBarFlags >> 4) & 7;
  if (v21)
  {
    [v4 encodeInteger:v21 forKey:@"UIBarStyle"];
    LODWORD(tabBarFlags) = self->_tabBarFlags;
  }
  if ((tabBarFlags & 0x10000) != 0) {
    [v4 encodeBool:1 forKey:@"UISpringLoaded"];
  }
  if ([(_UITabBarVisualProvider *)self->_visualProvider useModernAppearance])
  {
    standardAppearance = self->_standardAppearance;
    if (standardAppearance) {
      [v4 encodeObject:standardAppearance forKey:@"UITabBarStandardAppearance"];
    }
    scrollEdgeAppearance = self->_scrollEdgeAppearance;
    if (scrollEdgeAppearance) {
      [v4 encodeObject:scrollEdgeAppearance forKey:@"UITabBarScrollEdgeAppearance"];
    }
  }
}

- (void)setItems:(NSArray *)items
{
}

- (id)_tabBarItemForButtonAtPoint:(CGPoint)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = -[UITabBar hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_opt_class();
  objc_super v5 = 0;
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_items;
    objc_super v5 = (id *)[(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (id *)((char *)i + 1))
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(id **)(*((void *)&v12 + 1) + 8 * i);
          int v10 = -[UITabBarItem _tabBarButton](v9);

          if (v10 == v4)
          {
            objc_super v5 = v9;
            goto LABEL_12;
          }
        }
        objc_super v5 = (id *)[(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

- (double)_heightForCustomizingItems
{
  [(_UITabBarVisualProvider *)self->_visualProvider _shim_heightForCustomizingItems];
  return result;
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = [(UITabBar *)self items];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v8 + 1) + 8 * i));
        if ([v7 _isSelected])
        {
          [v7 _showSelectedIndicator:1 changeSelection:0];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_sendAction:(id)a3 withEvent:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v8 = self->_items;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(id **)(*((void *)&v19 + 1) + 8 * i);
        -[UITabBarItem _tabBarButton](v13);
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v6)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
            objc_msgSend(WeakRetained, "tabBar:didSelectItem:", self, v13, (void)v19);
          }
          if (objc_msgSend(v13, "action", (void)v19))
          {
            uint64_t v16 = (void *)UIApp;
            uint64_t v17 = [v13 action];
            uint64_t v18 = [v13 target];
            [v16 sendAction:v17 toTarget:v18 fromSender:v13 forEvent:v7];
          }
          goto LABEL_16;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

void __30__UITabBar_setItems_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 textAttributesForState:0];
  [v4 setTitleTextAttributes:v5 forState:0];

  id v6 = [*(id *)(a1 + 32) textAttributesForState:4];
  [v4 setTitleTextAttributes:v6 forState:4];
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITabBar *)self isLocked])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    [v5 raise:v6 format:@"Cannot choose layout method for UITabBar managed by a controller"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    [(UIView *)&v7 setTranslatesAutoresizingMaskIntoConstraints:v3];
  }
}

- (void)addConstraint:(id)a3
{
  id v4 = a3;
  if ([(UITabBar *)self isLocked])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot modify constraints for UITabBar managed by a controller"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    [(UIView *)&v5 addConstraint:v4];
  }
}

- (void)removeConstraint:(id)a3
{
  id v4 = a3;
  if ([(UITabBar *)self isLocked])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot modify constraints for UITabBar managed by a controller"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    [(UIView *)&v5 removeConstraint:v4];
  }
}

- (void)beginCustomizingItems:(NSArray *)items
{
  long long v8 = items;
  if ([(UITabBar *)self isLocked])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Directly modifying a tab bar managed by a tab bar controller is not allowed."];
  }
  else if (!self->_customizeView)
  {
    id v4 = (NSArray *)[(NSArray *)v8 copy];
    customizationItems = self->_customizationItems;
    self->_customizationItems = v4;

    [(UITabBar *)self _customizeWithAvailableItems:self->_customizationItems];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_super v7 = [(UITabBar *)self items];
      [WeakRetained tabBar:self willBeginCustomizingItems:v7];
    }
  }
}

- (BOOL)endCustomizingAnimated:(BOOL)animated
{
  BOOL v3 = animated;
  if ([(UITabBar *)self isLocked])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Directly modifying a tab bar managed by a tab bar controller is not allowed."];
    LOBYTE(v5) = 0;
  }
  else
  {
    [(UITabBar *)self _dismissCustomizeSheet:v3];
    return (*(unsigned char *)&self->_tabBarFlags >> 1) & 1;
  }
  return v5;
}

- (BOOL)isCustomizing
{
  return self->_customizeView != 0;
}

- (void)_makeCurrentButtonFirstResponder
{
  BOOL v3 = [(UITabBar *)self selectedItem];
  int v2 = -[UITabBarItem _tabBarButton](v3);
  [v2 becomeFirstResponder];
}

- (id)preferredFocusedView
{
  return [(_UITabBarVisualProvider *)self->_visualProvider preferredFocusedView];
}

- (BOOL)isSpringLoaded
{
  return *((unsigned char *)&self->_tabBarFlags + 2) & 1;
}

- (void)setBackgroundEffects:(id)a3
{
  id v4 = (NSArray *)a3;
  backgroundEffects = self->_backgroundEffects;
  if (backgroundEffects != v4)
  {
    uint64_t v9 = v4;
    BOOL v6 = [(NSArray *)backgroundEffects isEqualToArray:v4];
    id v4 = v9;
    if (!v6)
    {
      objc_super v7 = (NSArray *)[(NSArray *)v9 copy];
      long long v8 = self->_backgroundEffects;
      self->_backgroundEffects = v7;

      [(UITabBar *)self _setBackgroundNeedsUpdate:1];
      id v4 = v9;
    }
  }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
  id v4 = backgroundImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    BOOL v6 = v4;
    long long v12 = v4;
    if (!appearanceStorage)
    {
      objc_super v7 = objc_alloc_init(_UITabBarAppearanceStorage);
      long long v8 = self->_appearanceStorage;
      self->_appearanceStorage = v7;

      BOOL v6 = v12;
    }
    if ([(UIImage *)v6 _isResizable] || ([(UIImage *)v12 size], v9 <= 1.0))
    {
      id v4 = v12;
    }
    else
    {
      uint64_t v10 = -[UIImage resizableImageWithCapInsets:](v12, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

      id v4 = (UIImage *)v10;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_11;
  }
  uint64_t v13 = v4;
  uint64_t v11 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage backgroundImage];

  id v4 = v13;
  if (v13 != v11)
  {
    [(_UITabBarAppearanceStorage *)self->_appearanceStorage setBackgroundImage:v13];
    [(UITabBar *)self _setBackgroundNeedsUpdate:1];
    id v4 = v13;
  }
LABEL_11:
}

- (void)_setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    [(_UITabBarVisualProvider *)self->_visualProvider teardown];
    visualProvider = self->_visualProvider;
    self->_visualProvider = 0;

    self->_displayStyle = a3;
    BOOL v6 = +[UITabBar _visualProviderForTabBar:self];
    objc_super v7 = self->_visualProvider;
    self->_visualProvider = v6;

    long long v8 = self->_visualProvider;
    [(_UITabBarVisualProvider *)v8 prepare];
  }
}

- (void)setShadowImage:(UIImage *)shadowImage
{
  id v4 = shadowImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    BOOL v6 = v4;
    long long v12 = v4;
    if (!appearanceStorage)
    {
      objc_super v7 = objc_alloc_init(_UITabBarAppearanceStorage);
      long long v8 = self->_appearanceStorage;
      self->_appearanceStorage = v7;

      BOOL v6 = v12;
    }
    if ([(UIImage *)v6 _isResizable] || ([(UIImage *)v12 size], v9 <= 1.0))
    {
      id v4 = v12;
    }
    else
    {
      uint64_t v10 = -[UIImage resizableImageWithCapInsets:](v12, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

      id v4 = (UIImage *)v10;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_11;
  }
  uint64_t v13 = v4;
  uint64_t v11 = [(_UITabBarAppearanceStorage *)self->_appearanceStorage shadowImage];

  id v4 = v13;
  if (v13 != v11)
  {
    [(_UITabBarAppearanceStorage *)self->_appearanceStorage setShadowImage:v13];
    [(UITabBar *)self _setBackgroundNeedsUpdate:1];
    id v4 = v13;
  }
LABEL_11:
}

- (UIImage)shadowImage
{
  return [(_UITabBarAppearanceStorage *)self->_appearanceStorage shadowImage];
}

- (void)setSelectionIndicatorImage:(UIImage *)selectionIndicatorImage
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = selectionIndicatorImage;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    if (!appearanceStorage)
    {
      BOOL v6 = objc_alloc_init(_UITabBarAppearanceStorage);
      objc_super v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_16;
  }
  long long v8 = [(_UITabBarAppearanceStorage *)appearanceStorage selectionIndicatorImage];

  if (v8 != v4)
  {
    [(_UITabBarAppearanceStorage *)self->_appearanceStorage setSelectionIndicatorImage:v4];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v9 = [(UIView *)self subviews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            [v14 _setCustomSelectedIndicatorImage:v4];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
LABEL_16:
}

- (void)_effectiveBarTintColorDidChange
{
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
  id v4 = barTintColor;
  appearanceStorage = self->_appearanceStorage;
  double v9 = v4;
  if (v4)
  {
    if (!appearanceStorage)
    {
      BOOL v6 = objc_alloc_init(_UITabBarAppearanceStorage);
      objc_super v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  long long v8 = [(_UITabBarAppearanceStorage *)appearanceStorage barTintColor];

  id v4 = v9;
  if (v8 != v9)
  {
    [(_UITabBarAppearanceStorage *)self->_appearanceStorage setBarTintColor:v9];
    [(UITabBar *)self _effectiveBarTintColorDidChange];
    id v4 = v9;
  }
LABEL_7:
}

- (id)_defaultUnselectedTintColorForDefaultTV
{
  if (_AXSEnhanceBackgroundContrastEnabled()) {
    +[UIColor whiteColor];
  }
  else {
  int v2 = +[UIColor labelColor];
  }
  return v2;
}

- (void)setUnselectedItemTintColor:(UIColor *)unselectedItemTintColor
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = unselectedItemTintColor;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    if (!appearanceStorage)
    {
      BOOL v6 = objc_alloc_init(_UITabBarAppearanceStorage);
      objc_super v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    double v9 = 0;
    goto LABEL_16;
  }
  long long v8 = [(_UITabBarAppearanceStorage *)appearanceStorage unselectedImageTintColor];

  if (v8 == v4)
  {
    double v9 = v4;
  }
  else
  {
    [(_UITabBarAppearanceStorage *)self->_appearanceStorage setUnselectedImageTintColor:v4];
    double v9 = [(UITabBar *)self _effectiveUnselectedTintColor];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_items;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v16 + 1) + 8 * v14));
          objc_msgSend(v15, "_setUnselectedTintColor:", v9, (void)v16);

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
LABEL_16:
}

- (UIColor)selectedImageTintColor
{
  return [(_UITabBarAppearanceStorage *)self->_appearanceStorage selectedImageTintColor];
}

- (id)_shadowView
{
  return [(_UITabBarVisualProvider *)self->_visualProvider _shim_shadowView];
}

- (id)_dividerImageForLeftButtonState:(unint64_t)a3 rightButtonState:(unint64_t)a4
{
  return 0;
}

- (void)_setBarMetrics:(int64_t)a3
{
  if (self->_barMetrics != a3)
  {
    self->_int64_t barMetrics = a3;
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBarSizingDidChange:self];
    }
  }
}

- (void)_setImageStyle:(int64_t)a3
{
  if (self->_imageStyle != a3)
  {
    self->_imageStyle = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setShowsHighlightedState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_showsHighlightedState = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_items;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = -[UITabBarItem _tabBarButton](*(id **)(*((void *)&v10 + 1) + 8 * v8));
        objc_msgSend(v9, "_setShowsHighlightedState:", v3, (void)v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_setScrollsItems:(BOOL)a3
{
  if (self->_scrollsItems != a3)
  {
    self->_scrollsItems = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (id)_systemDefaultFocusGroupIdentifier
{
  BOOL v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x20) != 0)
  {
    uint64_t v5 = _UIFocusGroupIdentifierForInstance(self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    uint64_t v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (int64_t)_rotaryFocusMovementAxis
{
  return 1;
}

- (BOOL)_isEligibleForFocusInteraction
{
  v4.receiver = self;
  v4.super_class = (Class)UITabBar;
  return [(UIView *)&v4 _isEligibleForFocusInteraction]
      || [(UITabBar *)self _isHiddenAwaitingFocus];
}

- (BOOL)_isEligibleForFocusOcclusion
{
  v4.receiver = self;
  v4.super_class = (Class)UITabBar;
  return [(UIView *)&v4 _isEligibleForFocusOcclusion]
      || [(UITabBar *)self _isHiddenAwaitingFocus];
}

- (BOOL)canBecomeFocused
{
  BOOL v3 = [(UIView *)self _focusBehavior];
  int v4 = [v3 tabBarCanBecomeFocused];

  if (v4) {
    return ![(UIView *)self _isFocusedOrAncestorOfFocusedView];
  }
  else {
    return 0;
  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  if ([(_UITabBarVisualProvider *)self->_visualProvider shouldUpdateFocusInContext:v4])
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBar;
    BOOL v5 = [(UIView *)&v7 shouldUpdateFocusInContext:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
}

- (BOOL)_isHiddenAwaitingFocus
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 3) & 1;
}

- (void)_setHiddenAwaitingFocus:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFF7FF | v3);
}

- (BOOL)_focusedItemHighlightShouldBeVisible
{
  return (*((unsigned __int8 *)&self->_tabBarFlags + 1) >> 4) & 1;
}

- (void)_setFocusedItemHightlightShouldBeVisible:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_tabBarFlags & 0x1000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 4096;
    }
    else {
      int v3 = 0;
    }
    self->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFFEFFF | v3);
    [(_UITabBarVisualProvider *)self->_visualProvider _shim_updateFocusHighlightVisibility];
  }
}

- (BOOL)_pendingFocusAction
{
  return *((unsigned __int8 *)&self->_tabBarFlags + 1) >> 7;
}

- (void)_setPendingFocusAction:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFF7FFF | v3);
}

- (UITabBarItem)_focusedTabBarItem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = self->_items;
  int v3 = (id *)[(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (id *)((char *)i + 1))
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(id **)(*((void *)&v10 + 1) + 8 * i);
        objc_super v7 = -[UITabBarItem _tabBarButton](v6);
        char v8 = objc_msgSend(v7, "isFocused", (void)v10);

        if (v8)
        {
          int v3 = v6;
          goto LABEL_11;
        }
      }
      int v3 = (id *)[(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (UITabBarItem *)v3;
}

- (int64_t)_focusedIndex
{
  int v3 = [(UITabBar *)self items];
  uint64_t v4 = [(UITabBar *)self _focusedTabBarItem];
  int64_t v5 = [v3 indexOfObject:v4];

  return v5;
}

- (BOOL)_deferViewUpdateToFocusUpdate
{
  return 0;
}

- (void)_tabBarFinishedAnimating
{
}

- (void)dismissCustomizeSheet:(BOOL)a3
{
  if (self->_customizeView) {
    [(UITabBar *)self _dismissCustomizeSheet:a3];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (self->_customizeView)
  {
    if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)) {
      int64_t v5 = self;
    }
    else {
      int64_t v5 = 0;
    }
    uint64_t v6 = v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBar;
    -[UIView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
    uint64_t v6 = (UITabBar *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (self->_customizeView)
  {
    customizeView = self->_customizeView;
    [(UITabBarCustomizeView *)customizeView tabBarTouchesBegan:a3 withEvent:a4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    [(UIResponder *)&v5 touchesBegan:a3 withEvent:a4];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (self->_customizeView)
  {
    customizeView = self->_customizeView;
    [(UITabBarCustomizeView *)customizeView tabBarTouchesMoved:a3 withEvent:a4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    [(UIResponder *)&v5 touchesMoved:a3 withEvent:a4];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (self->_customizeView)
  {
    customizeView = self->_customizeView;
    [(UITabBarCustomizeView *)customizeView tabBarTouchesEnded:a3 withEvent:a4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    [(UIResponder *)&v5 touchesEnded:a3 withEvent:a4];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (self->_customizeView)
  {
    customizeView = self->_customizeView;
    [(UITabBarCustomizeView *)customizeView tabBarTouchesCancelled:a3 withEvent:a4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITabBar;
    [(UIResponder *)&v5 touchesCancelled:a3 withEvent:a4];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITabBar;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    -[_UITabBarVisualProvider tabBarSizeChanged:](self->_visualProvider, "tabBarSizeChanged:", v9, v11);
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_buttonDown:(id)a3
{
  id v4 = a3;
  *(_DWORD *)&self->_tabBarFlags &= ~4u;
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    [(UITabBar *)self performSelector:sel__buttonDownDelayed_ withObject:v4 afterDelay:0.2];
  }
}

- (void)_buttonDownDelayed:(id)a3
{
  *(_DWORD *)&self->_tabBarFlags |= 4u;
  id v4 = a3;
  [(UITabBar *)self _adjustButtonSelection:v4];
  [v4 sendActionsForControlEvents:0x40000000];
}

- (void)_buttonUp:(id)a3
{
  id v4 = a3;
  objc_msgSend(MEMORY[0x1E4FBA8A8], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__buttonDownDelayed_);
  if ((*(unsigned char *)&self->_tabBarFlags & 4) == 0)
  {
    [(UITabBar *)self _adjustButtonSelection:v4];
    [v4 sendActionsForControlEvents:0x40000000];
  }
  if ([v4 isFirstResponder]) {
    [v4 resignFirstResponder];
  }
}

- (void)_buttonCancel:(id)a3
{
}

- (void)_adjustButtonSelection:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(id **)(*((void *)&v14 + 1) + 8 * i);
        -[UITabBarItem _tabBarButton](v10);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          BOOL v12 = [(UITabBar *)self isLocked];
          [(UITabBar *)self setLocked:0];
          $A65F59733608D94F9E77A112F9FC6161 tabBarFlags = self->_tabBarFlags;
          if (v12) {
            self->_$A65F59733608D94F9E77A112F9FC6161 tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&tabBarFlags | 0x40000);
          }
          [(UITabBar *)self setSelectedItem:v10];
          self->_$A65F59733608D94F9E77A112F9FC6161 tabBarFlags = ($A65F59733608D94F9E77A112F9FC6161)(*(_DWORD *)&self->_tabBarFlags & 0xFFFBFFFF | (((*(unsigned int *)&tabBarFlags >> 18) & 1) << 18));
          [(UITabBar *)self setLocked:v12];
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_dismissCustomizeSheet:(BOOL)a3
{
  BOOL v3 = a3;
  customizationItems = self->_customizationItems;
  if (customizationItems)
  {
    self->_customizationItems = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__UITabBar__dismissCustomizeSheet___block_invoke;
  aBlock[3] = &unk_1E52DC3A0;
  aBlock[4] = self;
  uint64_t v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v3)
  {
    [(UIView *)self->_customizeView frame];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__UITabBar__dismissCustomizeSheet___block_invoke_2;
    v13[3] = &unk_1E52DA520;
    v13[4] = self;
    v13[5] = v7;
    *(double *)&v13[6] = v8 + v9;
    v13[7] = v10;
    *(double *)&v13[8] = v9;
    +[UIView animateWithDuration:v13 animations:v6 completion:0.33];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v12 = [(UITabBar *)self items];
    [WeakRetained tabBar:self willEndCustomizingItems:v12 changed:(*(_DWORD *)&self->_tabBarFlags >> 1) & 1];
  }
  if (!v3) {
    v6[2](v6, 1);
  }
}

void __35__UITabBar__dismissCustomizeSheet___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 416));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v2 = *(void **)(a1 + 32);
    BOOL v3 = [v2 items];
    [WeakRetained tabBar:v2 didEndCustomizingItems:v3 changed:(*(_DWORD *)(*(void *)(a1 + 32) + 456) >> 1) & 1];
  }
  [*(id *)(*(void *)(a1 + 32) + 408) removeFromSuperview];
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 408);
  *(void *)(v4 + 408) = 0;
}

uint64_t __35__UITabBar__dismissCustomizeSheet___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(*(void *)(a1 + 32) + 408) setIsBeingDismissed];
  int v2 = *(void **)(*(void *)(a1 + 32) + 408);
  return [v2 tintTabBarItemsForEdit:0];
}

- (void)_customizeDoneButtonAction:(id)a3
{
}

- (void)_customizeWithAvailableItems:(id)a3
{
  id v4 = a3;
  if (!self->_customizeView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBar:self willDisplayItemsForCustomization:v4];
    }
    uint64_t v6 = [(UIView *)self superview];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    long long v15 = [(UIView *)self window];
    long long v16 = [v15 windowScene];
    uint64_t v17 = [v16 interfaceOrientation];

    long long v18 = [(UIView *)self window];
    uint64_t v19 = __UIStatusBarManagerForWindow(v18);
    char v20 = [v19 isStatusBarHidden];

    uint64_t v21 = [(UIView *)self _screen];
    long long v22 = v21;
    if (v20) {
      [v21 bounds];
    }
    else {
      [v21 _applicationFrameForInterfaceOrientation:v17];
    }
    double v25 = v23;
    double v26 = v24;

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((unint64_t)(v17 - 3) >= 2) {
      double v28 = v25;
    }
    else {
      double v28 = v26;
    }
    if ((unint64_t)(v17 - 3) >= 2) {
      double v29 = v26;
    }
    else {
      double v29 = v25;
    }
    if (isKindOfClass)
    {
      double v30 = v14;
    }
    else
    {
      double v12 = v28;
      double v30 = v29;
    }
    double v31 = v10 + v14;
    UISemanticContentAttribute v32 = [(UIView *)self semanticContentAttribute];
    uint64_t v33 = -[UITabBarCustomizeView initWithFrame:]([UITabBarCustomizeView alloc], "initWithFrame:", v8, v31, v12, v30);
    customizeView = self->_customizeView;
    self->_customizeView = v33;

    [v6 _addSubview:self->_customizeView positioned:-3 relativeTo:self];
    BOOL v35 = self->_customizeView;
    long long v36 = +[UIColor systemBackgroundColor];
    [(UIView *)v35 setBackgroundColor:v36];

    [(UIView *)self->_customizeView setSemanticContentAttribute:v32];
    long long v37 = [UINavigationBar alloc];
    long long v38 = [(UIView *)self window];
    long long v39 = __UIStatusBarManagerForWindow(v38);
    [v39 statusBarHeight];
    double v41 = v40;

    +[UINavigationBar defaultSizeForOrientation:v17];
    long long v43 = -[UINavigationBar initWithFrame:](v37, "initWithFrame:", 0.0, v41, v12, v42);
    [(UIView *)v43 setAutoresizingMask:2];
    [(UINavigationBar *)v43 _setBarPosition:3];
    [(UINavigationBar *)v43 setSemanticContentAttribute:v32];
    v44 = [[UINavigationItem alloc] initWithTitle:&stru_1ED0E84C0];
    id v45 = [UIBarButtonItem alloc];
    v46 = _UINSLocalizedStringWithDefaultValue(@"Done", @"Done");
    v47 = [(UIBarButtonItem *)v45 initWithTitle:v46 style:2 target:self action:sel__customizeDoneButtonAction_];
    [(UINavigationItem *)v44 setRightBarButtonItem:v47];

    [(UINavigationBar *)v43 pushNavigationItem:v44 animated:0];
    [(UITabBarCustomizeView *)self->_customizeView setNavigationBar:v43];
    [(UIView *)self->_customizeView addSubview:v43];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBar:self willShowCustomizationSheet:self->_customizeView withNavigationBar:v43];
    }
    [(UITabBarCustomizeView *)self->_customizeView setTabBar:self currentItems:self->_items availableItems:v4];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabBar:self didDisplayItemsForCustomization:v4];
    }
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __41__UITabBar__customizeWithAvailableItems___block_invoke;
    v52[3] = &unk_1E52DA520;
    v52[4] = self;
    *(double *)&v52[5] = v8;
    *(double *)&v52[6] = v31 - v30;
    *(double *)&v52[7] = v12;
    *(double *)&v52[8] = v30;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __41__UITabBar__customizeWithAvailableItems___block_invoke_2;
    v49[3] = &unk_1E52DA660;
    id v50 = WeakRetained;
    v51 = self;
    id v48 = WeakRetained;
    +[UIView animateWithDuration:v52 animations:v49 completion:0.33];
    *(_DWORD *)&self->_tabBarFlags &= ~2u;
  }
}

uint64_t __41__UITabBar__customizeWithAvailableItems___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  int v2 = *(void **)(*(void *)(a1 + 32) + 408);
  return [v2 tintTabBarItemsForEdit:1];
}

void __41__UITabBar__customizeWithAvailableItems___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    int v2 = *(void **)(a1 + 40);
    id v4 = [v2 items];
    [v3 tabBar:v2 didBeginCustomizingItems:v4];
  }
}

- (void)_configureTabBarReplacingItem:(id)a3 withNewItem:(id)a4 swapping:(BOOL)a5
{
  BOOL v5 = a5;
  double v7 = [(_UITabBarVisualProvider *)self->_visualProvider exchangeItem:a3 withItem:a4];
  items = self->_items;
  self->_items = v7;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__UITabBar__configureTabBarReplacingItem_withNewItem_swapping___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  double v9 = _Block_copy(aBlock);
  double v10 = v9;
  if (v5) {
    +[UIView animateWithDuration:v9 animations:0.2];
  }
  else {
    (*((void (**)(void *))v9 + 2))(v9);
  }
  *(_DWORD *)&self->_tabBarFlags |= 2u;
}

uint64_t __63__UITabBar__configureTabBarReplacingItem_withNewItem_swapping___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _positionAllItems];
}

- (double)_scaleFactorForItems:(id)a3 spacing:(double)a4 dimension:(double)a5 maxWidth:(double)a6
{
  [(UITabBar *)self _totalDimensionForItems:a3 spacing:a4 dimension:a5 scaleFactor:1.0];
  BOOL v8 = v7 <= a6;
  double result = 0.9;
  if (v8) {
    return 1.0;
  }
  return result;
}

- (double)_totalDimensionForItems:(id)a3 spacing:(double)a4 dimension:(double)a5 scaleFactor:(double)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(id **)(*((void *)&v24 + 1) + 8 * i);
        long long v16 = -[UITabBarItem _tabBarButton](v15);
        uint64_t v17 = -[UITabBarItem _tabBarButton](v15);
        [v17 frame];
        objc_msgSend(v16, "sizeThatFits:", v18, v19);
        double v21 = v20;

        double v22 = v21 * a6;
        if (v21 * a6 <= 0.0) {
          double v22 = a5;
        }
        double v13 = v13 + v22 + a4;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (void)_positionAllItems
{
}

- (void)_updateTabBarItemView:(id)a3
{
  id v4 = a3;
  if (-[NSArray containsObject:](self->_items, "containsObject:")) {
    [(_UITabBarVisualProvider *)self->_visualProvider _shim_updateTabBarItemView:v4];
  }
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  if (self->_customizeView)
  {
    if (-[UIView pointInside:forEvent:](self, "pointInside:forEvent:", a4, a3.x, a3.y)) {
      BOOL v5 = self;
    }
    else {
      BOOL v5 = 0;
    }
    uint64_t v6 = v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBar;
    -[UIView hitTest:forEvent:](&v8, sel_hitTest_forEvent_, a4, a3.x, a3.y);
    uint64_t v6 = (UITabBar *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (_UITabBarAccessoryView)_leadingBarAccessoryView
{
  return self->_leadingBarAccessoryView;
}

- (_UITabBarAccessoryView)_trailingBarAccessoryView
{
  return self->_trailingBarAccessoryView;
}

- (UIView)leadingAccessoryView
{
  return [(_UITabBarAccessoryView *)self->_leadingBarAccessoryView contentView];
}

- (UIView)trailingAccessoryView
{
  return [(_UITabBarAccessoryView *)self->_trailingBarAccessoryView contentView];
}

- (void)setItemPositioning:(UITabBarItemPositioning)itemPositioning
{
  self->_int64_t itemPositioning = itemPositioning;
}

- (void)setItemWidth:(CGFloat)itemWidth
{
  self->_itemDimension = itemWidth;
}

- (void)setItemSpacing:(CGFloat)itemSpacing
{
  self->_itemSpacing = itemSpacing;
}

- (BOOL)_hidesShadow
{
  return self->_hidesShadow;
}

- (BOOL)_scrollsItems
{
  return self->_scrollsItems;
}

- (unint64_t)_preferredFocusHeading
{
  return self->_preferredFocusHeading;
}

- (void)_setPreferredFocusHeading:(unint64_t)a3
{
  self->_preferredFocusHeading = a3;
}

- (void)set_expectedSuperviewFollowingAnimation:(id)a3
{
}

- (int64_t)_displayStyle
{
  return self->_displayStyle;
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
    v7.super_class = (Class)UITabBar;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v7, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(void *)&a3, a4, a5, 1, 0.0);
  }
  return result;
}

- (double)_defaultAutolayoutSpacing
{
  return 0.0;
}

@end