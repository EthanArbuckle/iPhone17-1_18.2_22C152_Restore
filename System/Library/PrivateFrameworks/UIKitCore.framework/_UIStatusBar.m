@interface _UIStatusBar
+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5;
+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5 isAzulBLinked:(BOOL)a6;
+ (NSString)sensorActivityIndicatorPartIdentifier;
+ (double)_effectiveScaleForVisualProviderClass:(Class)a3 targetScreen:(id)a4;
+ (id)sensorActivityIndicatorForScreen:(id)a3;
+ (id)stringForStatusBarStyle:(int64_t)a3;
+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldTerminateHUDGestureForOtherGestureRecognizer:(id)a4;
- (BOOL)_cursorLocation:(CGPoint)a3 isInsideActionable:(id)a4;
- (BOOL)_cursorLocation:(CGPoint)a3 isInsideHoverableActionable:(id)a4;
- (BOOL)_forceLayoutEngineSolutionInRationalEdges;
- (BOOL)_gestureRecognizer:(id)a3 isInsideActionable:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 pressInsideActionable:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 touchInsideActionable:(id)a4;
- (BOOL)areAnimationsEnabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGAffineTransform)_effectiveScaleTransform;
- (CGRect)_extendedHoverFrameForActionable:(id)a3;
- (CGRect)_frameForActionable:(id)a3;
- (CGRect)_frameForActionable:(id)a3 actionInsets:(UIEdgeInsets)a4;
- (CGRect)_pressFrameForActionable:(id)a3;
- (CGRect)avoidanceFrame;
- (CGRect)frameForDisplayItemWithIdentifier:(id)a3;
- (CGRect)frameForPartWithIdentifier:(id)a3;
- (CGRect)frameForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (Class)_visualProviderClass;
- (NSArray)disabledPartIdentifiers;
- (NSArray)enabledPartIdentifiers;
- (NSDictionary)regions;
- (NSDictionary)visualProviderInfo;
- (NSMutableDictionary)displayItemStates;
- (NSMutableDictionary)items;
- (NSSet)dependentDataEntryKeys;
- (NSString)_visualProviderClassName;
- (NSString)description;
- (UIAccessibilityHUDGestureManager)accessibilityHUDGestureManager;
- (UIColor)foregroundColor;
- (UIGestureRecognizer)actionGestureRecognizer;
- (UIOffset)offsetForPartWithIdentifier:(id)a3;
- (UIPointerInteraction)pointerInteraction;
- (UIScreen)_effectiveTargetScreen;
- (UIScreen)targetScreen;
- (UIView)containerView;
- (UIView)foregroundView;
- (_UIStatusBar)initWithStyle:(int64_t)a3;
- (_UIStatusBarAction)action;
- (_UIStatusBarActionable)hoveredActionable;
- (_UIStatusBarActionable)targetActionable;
- (_UIStatusBarData)currentAggregatedData;
- (_UIStatusBarData)currentData;
- (_UIStatusBarData)overlayData;
- (_UIStatusBarDataAggregator)dataAggregator;
- (_UIStatusBarStyleAttributes)styleAttributes;
- (_UIStatusBarVisualProvider)visualProvider;
- (double)alphaForPartWithIdentifier:(id)a3;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)_actionablesForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4 onlyVisible:(BOOL)a5;
- (id)_itemWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_rearrangeOverflowedItems;
- (id)_regionsForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)actionForPartWithIdentifier:(id)a3;
- (id)dataEntryKeysForItemsWithIdentifiers:(id)a3;
- (id)displayItemIdentifiersInRegionsWithIdentifiers:(id)a3;
- (id)displayItemWithIdentifier:(id)a3;
- (id)itemIdentifiersInRegionsWithIdentifiers:(id)a3;
- (id)itemWithIdentifier:(id)a3;
- (id)itemsDependingOnKeys:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)regionActionValidationBlock;
- (id)regionWithIdentifier:(id)a3;
- (id)stateForDisplayItemWithIdentifier:(id)a3;
- (id)styleAttributesForStyle:(int64_t)a3;
- (id)updateCompletionHandler;
- (int64_t)_effectiveStyleFromStyle:(int64_t)a3;
- (int64_t)mode;
- (int64_t)orientation;
- (int64_t)style;
- (int64_t)styleForPartWithIdentifier:(id)a3;
- (unsigned)animationContextId;
- (void)_accessibilityHUDGestureManager:(id)a3 showHUDItem:(id)a4;
- (void)_delayUpdatesWithKeys:(id)a3 fromAnimation:(id)a4;
- (void)_dismissAccessibilityHUDForGestureManager:(id)a3;
- (void)_fixupDisplayItemAttributes;
- (void)_performAnimations:(id)a3;
- (void)_performWithInheritedAnimation:(id)a3;
- (void)_prepareAnimations:(id)a3;
- (void)_prepareVisualProviderIfNeeded;
- (void)_setVisualProviderClass:(Class)a3;
- (void)_setVisualProviderClassName:(id)a3;
- (void)_updateActionGestureRecognizerAllowableTouchTypesIfNeeded;
- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5;
- (void)_updateRegionItems;
- (void)_updateStyleAttributes;
- (void)_updateWithAggregatedData:(id)a3;
- (void)_updateWithData:(id)a3 completionHandler:(id)a4;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)resetVisualProvider;
- (void)resizeSubviewsWithOldSize:(CGSize)a3;
- (void)setAccessibilityHUDGestureManager:(id)a3;
- (void)setAction:(id)a3;
- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4;
- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4;
- (void)setAvoidanceFrame:(CGRect)a3;
- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5;
- (void)setDisabledPartIdentifiers:(id)a3;
- (void)setDisplayItemStates:(id)a3;
- (void)setEnabledPartIdentifiers:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setForegroundView:(id)a3;
- (void)setHoveredActionable:(id)a3;
- (void)setItems:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOverlayData:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setRegionActionValidationBlock:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 forPartWithIdentifier:(id)a4;
- (void)setStyleAttributes:(id)a3;
- (void)setTargetActionable:(id)a3;
- (void)setTargetScreen:(id)a3;
- (void)setUpdateCompletionHandler:(id)a3;
- (void)setVisualProviderInfo:(id)a3;
- (void)statusBarGesture:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateForcingIterativeOverflow;
- (void)updateWithAnimations:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation _UIStatusBar

+ (id)stringForStatusBarStyle:(int64_t)a3
{
  id result = 0;
  switch(a3)
  {
    case 0:
      id result = @"_UIStatusBarResolvedStyleDefault";
      break;
    case 1:
      id result = @"_UIStatusBarResolvedStyleLightContent";
      break;
    case 2:
      id result = @"_UIStatusBarResolvedStyleDarkContent";
      break;
    case 3:
      return result;
    case 4:
      id result = @"_UIStatusBarResolvedStyleInherited";
      break;
    default:
      v4 = @"_UIStatusBarResolvedStyleAutomaticWithDarkBias";
      if (a3 != 128) {
        v4 = 0;
      }
      if (a3 == 64) {
        id result = @"_UIStatusBarResolvedStyleAutomaticWithLightBias";
      }
      else {
        id result = v4;
      }
      break;
  }
  return result;
}

+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4
{
  uint64_t v5 = _MergedGlobals_21_4;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&_MergedGlobals_21_4, &__block_literal_global_497);
  }
  v8 = (void *)qword_1EB25E828;
  sensorActivityScreenIdentifier(v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v8 setObject:v7 forKey:v9];
}

+ (id)sensorActivityIndicatorForScreen:(id)a3
{
  v3 = (void *)qword_1EB25E828;
  v4 = sensorActivityScreenIdentifier(a3);
  uint64_t v5 = [v3 objectForKey:v4];

  return v5;
}

- (BOOL)_forceLayoutEngineSolutionInRationalEdges
{
  return 1;
}

- (_UIStatusBar)initWithStyle:(int64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)_UIStatusBar;
  v4 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, 0.0, 0.0, 600.0, 50.0);
  v4->_style = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [(_UIStatusBar *)v4 setItems:v5];

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [(_UIStatusBar *)v4 setDisplayItemStates:v6];

  [(UIView *)v4 _setHostsLayoutEngine:1];
  uint64_t v7 = _UIGetUIStatusBarForcedMode();
  if (v7 != -1) {
    v4->_mode = v7;
  }
  objc_initWeak(&location, v4);
  v8 = [_UIStatusBarDataAggregator alloc];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __30___UIStatusBar_initWithStyle___block_invoke;
  v20 = &unk_1E5307258;
  objc_copyWeak(&v21, &location);
  uint64_t v9 = [(_UIStatusBarDataAggregator *)v8 initWithUpdateBlock:&v17];
  dataAggregator = v4->_dataAggregator;
  v4->_dataAggregator = (_UIStatusBarDataAggregator *)v9;

  v11 = [_UIStatusBarActionGestureRecognizer alloc];
  uint64_t v12 = -[UIGestureRecognizer initWithTarget:action:](v11, "initWithTarget:action:", v4, sel_statusBarGesture_, v17, v18, v19, v20);
  actionGestureRecognizer = v4->_actionGestureRecognizer;
  v4->_actionGestureRecognizer = (UIGestureRecognizer *)v12;

  [(UIGestureRecognizer *)v4->_actionGestureRecognizer setDelegate:v4];
  [(UIGestureRecognizer *)v4->_actionGestureRecognizer setAllowedPressTypes:&unk_1ED3F1198];
  [(UIGestureRecognizer *)v4->_actionGestureRecognizer setAllowedTouchTypes:&unk_1ED3F11B0];
  [(UIView *)v4 addGestureRecognizer:v4->_actionGestureRecognizer];
  v14 = [[UIAccessibilityHUDGestureManager alloc] initWithView:v4 delegate:v4];
  accessibilityHUDGestureManager = v4->_accessibilityHUDGestureManager;
  v4->_accessibilityHUDGestureManager = v14;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return v4;
}

- (NSString)description
{
  v8[1] = *MEMORY[0x1E4F143B8];
  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    uint64_t v7 = @"visualProvider";
    v8[0] = visualProvider;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v5 = +[UIDescriptionBuilder descriptionForObject:self namesAndObjects:v4];
  }
  else
  {
    uint64_t v5 = +[UIDescriptionBuilder descriptionForObject:self namesAndObjects:0];
  }
  return (NSString *)v5;
}

- (void)_setVisualProviderClassName:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  v8 = v5;
  if (v5)
  {
    Class v6 = NSClassFromString(v5);
    if (v6) {
      goto LABEL_5;
    }
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIStatusBar.m", 226, @"No visual provider class with name %@", v8 object file lineNumber description];
  }
  Class v6 = 0;
LABEL_5:
  [(_UIStatusBar *)self _setVisualProviderClass:v6];
}

- (NSString)_visualProviderClassName
{
  v2 = [(_UIStatusBar *)self _visualProviderClass];
  if (v2)
  {
    NSStringFromClass(v2);
    v2 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (_UIStatusBarVisualProvider)visualProvider
{
  [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
  visualProvider = self->_visualProvider;
  return visualProvider;
}

- (UIScreen)_effectiveTargetScreen
{
  v3 = self->_targetScreen;
  if (!v3)
  {
    v4 = [(UIView *)self window];
    v3 = [v4 screen];

    if (!v3)
    {
      uint64_t v5 = [(UIView *)self traitCollection];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6 == 3) {
        +[UIScreen _carScreen];
      }
      else {
      v3 = +[UIScreen mainScreen];
      }
    }
  }
  return v3;
}

- (void)_prepareVisualProviderIfNeeded
{
  if (!self->_visualProvider)
  {
    visualProviderClass = self->_visualProviderClass;
    if (!visualProviderClass)
    {
      v4 = [(_UIStatusBar *)self _effectiveTargetScreen];
      uint64_t v5 = [(_UIStatusBar *)self visualProviderInfo];
      _UIStatusBarGetVisualProviderClassForScreen(v4, v5);
      uint64_t v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
      Class v7 = self->_visualProviderClass;
      self->_visualProviderClass = v6;

      if ([(objc_class *)self->_visualProviderClass scalesWithScreenNativeScale])int v8 = 2; {
      else
      }
        int v8 = 0;
      self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFFD | v8);
      if (objc_opt_respondsToSelector()) {
        int v9 = 4;
      }
      else {
        int v9 = 0;
      }
      self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFFB | v9);
      if ([(objc_class *)self->_visualProviderClass requiresIterativeOverflowLayout])int v10 = 8; {
      else
      }
        int v10 = 0;
      self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFF7 | v10);

      visualProviderClass = self->_visualProviderClass;
    }
    v11 = (_UIStatusBarVisualProvider *)objc_alloc_init(visualProviderClass);
    visualProvider = self->_visualProvider;
    self->_visualProvider = v11;

    [(_UIStatusBarVisualProvider *)self->_visualProvider setStatusBar:self];
    if (objc_opt_respondsToSelector()) {
      int v13 = 16;
    }
    else {
      int v13 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFEF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 32;
    }
    else {
      int v14 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFDF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 64;
    }
    else {
      int v15 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFBF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 128;
    }
    else {
      int v16 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFF7F | v16);
    if (objc_opt_respondsToSelector()) {
      int v17 = 256;
    }
    else {
      int v17 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFEFF | v17);
    if (objc_opt_respondsToSelector()) {
      int v18 = 512;
    }
    else {
      int v18 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFDFF | v18);
    if (objc_opt_respondsToSelector()) {
      int v19 = 1024;
    }
    else {
      int v19 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFBFF | v19);
    if (objc_opt_respondsToSelector()) {
      int v20 = 2048;
    }
    else {
      int v20 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFF7FF | v20);
    if (objc_opt_respondsToSelector()) {
      int v21 = 4096;
    }
    else {
      int v21 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFEFFF | v21);
    if (objc_opt_respondsToSelector()) {
      int v22 = 0x2000;
    }
    else {
      int v22 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFDFFF | v22);
    if (objc_opt_respondsToSelector()) {
      int v23 = 0x4000;
    }
    else {
      int v23 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFBFFF | v23);
    if (objc_opt_respondsToSelector()) {
      int v24 = 0x8000;
    }
    else {
      int v24 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFF7FFF | v24);
    if (objc_opt_respondsToSelector()) {
      int v25 = 0x10000;
    }
    else {
      int v25 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFEFFFF | v25);
    if (objc_opt_respondsToSelector()) {
      int v26 = 0x20000;
    }
    else {
      int v26 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFDFFFF | v26);
    if (objc_opt_respondsToSelector()) {
      int v27 = 0x40000;
    }
    else {
      int v27 = 0;
    }
    self->_statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&self->_statusBarFlags & 0xFFFBFFFF | v27);
    [(_UIStatusBar *)self _updateActionGestureRecognizerAllowableTouchTypesIfNeeded];
  }
  if (!self->_foregroundView)
  {
    v28 = [_UIStatusBarForegroundView alloc];
    [(UIView *)self bounds];
    v29 = -[UIView initWithFrame:](v28, "initWithFrame:");
    [(_UIStatusBar *)self setForegroundView:v29];

    v30 = [[UIPointerInteraction alloc] initWithDelegate:self];
    pointerInteraction = self->_pointerInteraction;
    self->_pointerInteraction = v30;

    v32 = [(_UIStatusBar *)self foregroundView];
    [v32 addInteraction:self->_pointerInteraction];

    [(UIView *)self addSubview:self->_foregroundView];
  }
  if (![(NSDictionary *)self->_regions count])
  {
    v33 = [MEMORY[0x1E4F1CA60] dictionary];
    v34 = self->_visualProvider;
    v35 = [(_UIStatusBar *)self containerView];
    v36 = [(_UIStatusBarVisualProvider *)v34 setupInContainerView:v35];

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __46___UIStatusBar__prepareVisualProviderIfNeeded__block_invoke;
    v40[3] = &unk_1E5307280;
    v40[4] = self;
    id v37 = v33;
    id v41 = v37;
    [v36 enumerateObjectsUsingBlock:v40];
    objc_storeStrong((id *)&self->_regions, v33);
    regions = self->_regions;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __46___UIStatusBar__prepareVisualProviderIfNeeded__block_invoke_2;
    v39[3] = &unk_1E53072A8;
    v39[4] = self;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v39];
    +[_UIStatusBarDisplayItemState setupRelationsBetweenDisplayItemStates:self->_displayItemStates visualProvider:self->_visualProvider];
    if (self->_mode)
    {
      if ((*(unsigned char *)&self->_statusBarFlags & 0x10) != 0) {
        [(_UIStatusBarVisualProvider *)self->_visualProvider modeUpdatedFromMode:0];
      }
    }
    [(_UIStatusBar *)self _updateStyleAttributes];
  }
}

- (void)resetVisualProvider
{
  [(NSDictionary *)self->_regions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_79_0];
  regions = self->_regions;
  self->_regions = (NSDictionary *)MEMORY[0x1E4F1CC08];

  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  displayItemStates = self->_displayItemStates;
  self->_displayItemStates = v4;
}

- (void)setMode:(int64_t)a3
{
  if (_UIGetUIStatusBarForcedMode() == -1)
  {
    int64_t mode = self->_mode;
    if (mode != a3)
    {
      self->_int64_t mode = a3;
      if (self->_visualProvider)
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __24___UIStatusBar_setMode___block_invoke;
        v6[3] = &unk_1E52D9F70;
        v6[4] = self;
        [(_UIStatusBar *)self _performWithInheritedAnimation:v6];
        if ((*(unsigned char *)&self->_statusBarFlags & 0x10) != 0) {
          [(_UIStatusBarVisualProvider *)self->_visualProvider modeUpdatedFromMode:mode];
        }
      }
    }
    *(_DWORD *)&self->_statusBarFlags |= 1u;
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    visualProvider = self->_visualProvider;
    if (visualProvider)
    {
      if ((*(unsigned char *)&self->_statusBarFlags & 0x20) != 0) {
        -[_UIStatusBarVisualProvider orientationUpdatedFromOrientation:](visualProvider, "orientationUpdatedFromOrientation:");
      }
    }
  }
  *(_DWORD *)&self->_statusBarFlags |= 1u;
}

- (void)setAvoidanceFrame:(CGRect)a3
{
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  [(_UIStatusBar *)self _effectiveScaleTransform];
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGRect v23 = CGRectApplyAffineTransform(v22, &v21);
  CGFloat v12 = v23.origin.x;
  CGFloat v13 = v23.origin.y;
  CGFloat v14 = v23.size.width;
  CGFloat v15 = v23.size.height;
  p_avoidanceFrame = &self->_avoidanceFrame;
  if (!CGRectEqualToRect(v23, self->_avoidanceFrame))
  {
    double v17 = p_avoidanceFrame->origin.x;
    double v18 = self->_avoidanceFrame.origin.y;
    double v19 = self->_avoidanceFrame.size.width;
    double v20 = self->_avoidanceFrame.size.height;
    p_avoidanceFrame->origin.CGFloat x = v12;
    self->_avoidanceFrame.origin.CGFloat y = v13;
    self->_avoidanceFrame.size.CGFloat width = v14;
    self->_avoidanceFrame.size.CGFloat height = v15;
    if ((*(unsigned char *)&self->_statusBarFlags & 0x40) != 0) {
      -[_UIStatusBarVisualProvider avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:](self->_visualProvider, "avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:", v11, a5, v17, v18, v19, v20);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBar;
  [(UIView *)&v13 traitCollectionDidChange:v4];
  if (self->_visualProvider)
  {
    uint64_t v5 = [(UIView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];
    if (v6 != [v4 userInterfaceStyle]
      || (uint64_t v7 = [v5 userInterfaceIdiom], v7 != objc_msgSend(v4, "userInterfaceIdiom"))
      || (uint64_t v8 = [v5 layoutDirection], v8 != objc_msgSend(v4, "layoutDirection"))
      || ([v5 displayScale], double v10 = v9, objc_msgSend(v4, "displayScale"), v10 != v11))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __41___UIStatusBar_traitCollectionDidChange___block_invoke;
      v12[3] = &unk_1E52D9F70;
      v12[4] = self;
      [(_UIStatusBar *)self _performWithInheritedAnimation:v12];
    }
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  if ([(UIView *)self semanticContentAttribute] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIStatusBar;
    [(UIView *)&v5 setSemanticContentAttribute:a3];
    if (self) {
      _UIViewInvalidateTraitCollectionAndSchedulePropagation((uint64_t)self, 1);
    }
  }
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4 = [(UIView *)self traitCollection];
  objc_super v5 = objc_msgSend(v4, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), 0x1ED3F5A60);

  return v5;
}

- (void)_performWithInheritedAnimation:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F39CF8];
  id v4 = (void (**)(void))a3;
  [v3 begin];
  BOOL v5 = +[UIView areAnimationsEnabled];
  BOOL v6 = +[UIView _isInAnimationBlock];
  uint64_t v7 = (void *)MEMORY[0x1E4F39CF8];
  if (v6)
  {
    +[UIView _currentAnimationDuration];
    objc_msgSend(v7, "setAnimationDuration:");
    uint64_t v8 = (void *)MEMORY[0x1E4F39CF8];
    unint64_t v9 = +[UIView _currentAnimationCurve];
    CGFloat v14 = _UIGetAnimationCurveSpline(v9, v10, v11, v12, v13);
    [v8 setAnimationTimingFunction:v14];
  }
  else
  {
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    +[UIView setAnimationsEnabled:0];
  }
  v4[2](v4);

  [MEMORY[0x1E4F39CF8] commit];
  +[UIView setAnimationsEnabled:v5];
}

- (void)setStyle:(int64_t)a3
{
  int64_t style = self->_style;
  if (style != a3)
  {
    self->_int64_t style = a3;
    if (self->_visualProvider)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __25___UIStatusBar_setStyle___block_invoke;
      v5[3] = &unk_1E52D9F70;
      v5[4] = self;
      [(_UIStatusBar *)self _performWithInheritedAnimation:v5];
      if ((*(unsigned char *)&self->_statusBarFlags & 0x80) != 0) {
        [(_UIStatusBarVisualProvider *)self->_visualProvider styleUpdatedFromStyle:style];
      }
    }
  }
}

- (void)setForegroundColor:(id)a3
{
  id v5 = a3;
  foregroundColor = self->_foregroundColor;
  uint64_t v7 = (UIColor *)v5;
  uint64_t v8 = foregroundColor;
  if (v8 == v7)
  {
  }
  else
  {
    unint64_t v9 = v8;
    if (v7 && v8)
    {
      BOOL v10 = [(UIColor *)v7 isEqual:v8];

      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    if (self->_visualProvider)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __35___UIStatusBar_setForegroundColor___block_invoke;
      v11[3] = &unk_1E52D9F70;
      v11[4] = self;
      [(_UIStatusBar *)self _performWithInheritedAnimation:v11];
    }
  }
LABEL_10:
}

- (void)setStyleAttributes:(id)a3
{
  id v9 = a3;
  if (([v9 isEqual:self->_styleAttributes] & 1) == 0)
  {
    id v5 = (_UIStatusBarStyleAttributes *)[v9 copy];
    styleAttributes = self->_styleAttributes;
    self->_styleAttributes = v5;

    uint64_t v7 = [(_UIStatusBarStyleAttributes *)self->_styleAttributes traitCollection];

    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"_UIStatusBar.m" lineNumber:554 description:@"Style attributes should have a traitCollection"];
    }
    [(_UIStatusBar *)self _updateDisplayedItemsWithData:0 styleAttributes:v9 extraAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (int64_t)_effectiveStyleFromStyle:(int64_t)a3
{
  int64_t v3 = a3;
  if (!a3)
  {
    id v4 = [(UIView *)self traitCollection];
    if ([v4 userInterfaceStyle] == 2) {
      int64_t v3 = 1;
    }
    else {
      int64_t v3 = 2;
    }
  }
  return v3;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      BOOL v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &styleAttributesForStyle____s_category) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v12, 2u);
    }
  }
  id v5 = +[UITraitCollection _currentTraitCollectionIfExists]();
  BOOL v6 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v6];

  uint64_t v7 = (void *)_UISetCurrentFallbackEnvironment(self);
  uint64_t v8 = [(_UIStatusBarVisualProvider *)self->_visualProvider styleAttributesForStyle:[(_UIStatusBar *)self _effectiveStyleFromStyle:a3]];
  _UIRestorePreviousFallbackEnvironment(v7);
  +[UITraitCollection setCurrentTraitCollection:v5];

  return v8;
}

- (void)_updateStyleAttributes
{
  int64_t style = self->_style;
  if (style == 2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2 * (style == 1);
  }
  [(UIView *)self setOverrideUserInterfaceStyle:v4];
  id v5 = [(_UIStatusBar *)self styleAttributesForStyle:self->_style];
  [(_UIStatusBar *)self setStyleAttributes:v5];
}

- (void)updateWithData:(id)a3
{
}

- (void)setOverlayData:(id)a3
{
  id v10 = a3;
  if ([v10 isEmpty])
  {

    id v10 = 0;
  }
  id v4 = [(_UIStatusBar *)self overlayData];

  id v5 = v10;
  if (v10 != v4)
  {
    BOOL v6 = [(_UIStatusBarDataAggregator *)self->_dataAggregator overlayData];

    if (v6)
    {
      uint64_t v7 = [(_UIStatusBarDataAggregator *)self->_dataAggregator overlayData];
      id v8 = [v7 dataByApplyingOverlay:self->_currentData];

      id v9 = v10;
      if (v10)
      {
        if (v8)
        {
          [v8 applyUpdate:v10];
LABEL_12:
          [(_UIStatusBarDataAggregator *)self->_dataAggregator setOverlayData:0];
          [(_UIStatusBarDataAggregator *)self->_dataAggregator updateWithData:v8];
          [(_UIStatusBarDataAggregator *)self->_dataAggregator setOverlayData:v10];

          id v5 = v10;
          goto LABEL_13;
        }
LABEL_9:
        id v10 = v9;
        id v8 = v9;
        goto LABEL_12;
      }
    }
    else
    {
      id v9 = v10;
      if (v10) {
        goto LABEL_9;
      }
      id v8 = 0;
    }
    id v10 = v9;
    goto LABEL_12;
  }
LABEL_13:
}

- (_UIStatusBarData)overlayData
{
  return [(_UIStatusBarDataAggregator *)self->_dataAggregator overlayData];
}

- (void)_updateWithData:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &_updateWithData_completionHandler____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    double v12 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v13 = v12;
      if (+[UIView areAnimationsEnabled]) {
        CGFloat v14 = @"YES";
      }
      else {
        CGFloat v14 = @"NO";
      }
      CGFloat v15 = [(_UIStatusBarDataAggregator *)self->_dataAggregator delayedEntryKeys];
      *(_DWORD *)buf = 134218754;
      double v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      CGRect v23 = v14;
      __int16 v24 = 2112;
      int v25 = v15;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Status bar %p update with data: %@, animated: %@, delayedKeys: %@", buf, 0x2Au);
    }
  }
  [(_UIStatusBar *)self setUpdateCompletionHandler:v7];
  currentData = self->_currentData;
  if (currentData)
  {
    [(_UIStatusBarData *)currentData applyUpdate:v6];
    [(_UIStatusBarDataAggregator *)self->_dataAggregator updateWithData:v6];
  }
  else
  {
    id v10 = (_UIStatusBarData *)[v6 copy];
    double v11 = self->_currentData;
    self->_currentData = v10;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50___UIStatusBar__updateWithData_completionHandler___block_invoke;
    v16[3] = &unk_1E52D9F98;
    v16[4] = self;
    id v17 = v6;
    +[UIView performWithoutAnimation:v16];
  }
}

- (void)_updateWithAggregatedData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 copy];
  if (*((unsigned char *)&self->_statusBarFlags + 1))
  {
    id v5 = [(_UIStatusBarVisualProvider *)self->_visualProvider willUpdateWithData:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (self->_currentAggregatedData) {
    [(_UIStatusBarData *)self->_currentAggregatedData applyUpdate:v4];
  }
  else {
    objc_storeStrong((id *)&self->_currentAggregatedData, v4);
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &_updateWithAggregatedData____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    double v11 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      double v12 = v11;
      BOOL v13 = +[UIView areAnimationsEnabled];
      CGFloat v14 = @"NO";
      *(_DWORD *)CGFloat v15 = 134218498;
      *(void *)&v15[4] = self;
      *(_WORD *)&v15[12] = 2112;
      if (v13) {
        CGFloat v14 = @"YES";
      }
      *(void *)&v15[14] = v4;
      __int16 v16 = 2112;
      id v17 = v14;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Status bar %p now applying update: %@, animated: %@", v15, 0x20u);
    }
  }
  -[_UIStatusBar _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](self, "_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", v4, 0, v5, *(_OWORD *)v15);
  $C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags = self->_statusBarFlags;
  if ((*(_WORD *)&statusBarFlags & 0x200) != 0)
  {
    [(_UIStatusBarVisualProvider *)self->_visualProvider dataUpdated:v4];
    $C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags = self->_statusBarFlags;
  }
  self->_$C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&statusBarFlags | 1);
  [(UIPointerInteraction *)self->_pointerInteraction invalidate];
  id v8 = [(_UIStatusBar *)self updateCompletionHandler];

  if (v8)
  {
    id v9 = (void (**)(void))_Block_copy(self->_updateCompletionHandler);
    id updateCompletionHandler = self->_updateCompletionHandler;
    self->_id updateCompletionHandler = 0;

    v9[2](v9);
  }
}

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v29 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      uint64_t v26 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    int v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateDisplayedItemsWithData_styleAttributes_extraAnimations____s_category)+ 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
    }
  }
  v28 = +[UITraitCollection _currentTraitCollectionIfExists]();
  id v10 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v10];

  double v11 = (void *)_UISetCurrentFallbackEnvironment(self);
  [(NSMutableDictionary *)self->_displayItemStates enumerateKeysAndObjectsUsingBlock:&__block_literal_global_102_1];
  double v12 = [MEMORY[0x1E4F1CA48] array];
  *(_DWORD *)&self->_statusBarFlags |= 0x80000u;
  displayItemStates = self->_displayItemStates;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_2;
  v34[3] = &unk_1E5307310;
  id v14 = v8;
  id v35 = v14;
  id v15 = v9;
  id v36 = v15;
  id v16 = v12;
  id v37 = v16;
  [(NSMutableDictionary *)displayItemStates enumerateKeysAndObjectsUsingBlock:v34];
  items = self->_items;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_3;
  v32[3] = &unk_1E5307338;
  id v18 = v14;
  id v33 = v18;
  [(NSMutableDictionary *)items enumerateKeysAndObjectsUsingBlock:v32];
  *(_DWORD *)&self->_statusBarFlags &= ~0x80000u;
  [v16 addObjectsFromArray:v29];
  double v19 = _UIStatusBarGetPriorityComparator();
  id v20 = (id)[v16 sortedArrayUsingComparator:v19];

  [(_UIStatusBar *)self _prepareAnimations:v16];
  if ([v16 count])
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_4;
    v31[3] = &unk_1E52D9F70;
    v31[4] = self;
    +[UIView performWithoutAnimation:v31];
    if ((*(_DWORD *)&self->_statusBarFlags & 0x100008) != 0)
    {
      uint64_t v21 = [(_UIStatusBar *)self _rearrangeOverflowedItems];
      if (v21)
      {
        __int16 v22 = (void *)v21;
        do
        {
          [v22 prepareForOverflowDataUpdate];
          CGRect v23 = [v22 updateWithData:v18 styleAttributes:v15];
          [(_UIStatusBar *)self _prepareAnimations:v23];
          [v16 addObjectsFromArray:v23];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_5;
          v30[3] = &unk_1E52D9F70;
          v30[4] = self;
          +[UIView performWithoutAnimation:v30];

          uint64_t v24 = [(_UIStatusBar *)self _rearrangeOverflowedItems];

          __int16 v22 = (void *)v24;
        }
        while (v24);
      }
    }
    [(_UIStatusBar *)self _performAnimations:v16];
    [(UIView *)self layoutIfNeeded];
  }
  else
  {
    [(UIView *)self setNeedsUpdateConstraints];
    if ((*(_DWORD *)&self->_statusBarFlags & 0x100008) != 0)
    {
      do
      {
        [(UIView *)self layoutIfNeeded];
        int v25 = [(_UIStatusBar *)self _rearrangeOverflowedItems];
      }
      while (v25);
    }
    *(_DWORD *)&self->_statusBarFlags |= 1u;
  }
  [(_UIStatusBar *)self _fixupDisplayItemAttributes];
  _UIRestorePreviousFallbackEnvironment(v11);
  +[UITraitCollection setCurrentTraitCollection:v28];
}

- (void)_prepareAnimations:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[_UIStatusBarAnimation prepareAnimations:v4 forStatusBar:self];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4;
  uint64_t v23 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    obuint64_t j = v5;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "effectiveDelayedItemIdentifiers", obj);
        if ([v8 count])
        {
          __int16 v22 = v7;
          id v9 = [MEMORY[0x1E4F1CA80] set];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = [(_UIStatusBar *)self itemWithIdentifier:*(void *)(*((void *)&v24 + 1) + 8 * j)];
                id v16 = [v15 dependentEntryKeys];
                [v9 unionSet:v16];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v12);
          }

          if ([v9 count]) {
            [(_UIStatusBar *)self _delayUpdatesWithKeys:v9 fromAnimation:v22];
          }
        }
      }
      id v5 = obj;
      uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }

  if (self->_updateCompletionHandler && [v5 count])
  {
    id v17 = _Block_copy(self->_updateCompletionHandler);
    id updateCompletionHandler = self->_updateCompletionHandler;
    self->_id updateCompletionHandler = 0;

    double v19 = dispatch_group_create();
    +[_UIStatusBarAnimation _addAnimations:v5 toDispatchGroup:v19];
    dispatch_group_notify(v19, MEMORY[0x1E4F14428], v17);
  }
}

- (void)_delayUpdatesWithKeys:(id)a3 fromAnimation:(id)a4
{
  id v6 = a3;
  dataAggregator = self->_dataAggregator;
  id v8 = a4;
  [(_UIStatusBarDataAggregator *)dataAggregator beginDelayingUpdatesForEntryKeys:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52___UIStatusBar__delayUpdatesWithKeys_fromAnimation___block_invoke;
  v10[3] = &unk_1E52D9F98;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 addTotalCompletionHandler:v10];
}

- (void)updateWithAnimations:(id)a3
{
}

- (void)updateForcingIterativeOverflow
{
  *(_DWORD *)&self->_statusBarFlags |= 0x100000u;
  [(_UIStatusBar *)self updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  *(_DWORD *)&self->_statusBarFlags &= ~0x100000u;
}

- (void)_performAnimations:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 type] == 1
          && ([v9 displayItemIdentifier],
              id v10 = objc_claimAutoreleasedReturnValue(),
              [(_UIStatusBar *)self displayItemWithIdentifier:v10],
              id v11 = objc_claimAutoreleasedReturnValue(),
              int v12 = [v11 visible],
              v11,
              v10,
              !v12))
        {
          [v9 cancel];
        }
        else
        {
          [v9 performForStatusBar:self];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_fixupDisplayItemAttributes
{
  id v3 = (id)_statusBarRunningAnimations;
  uint64_t v4 = [v3 count];

  if (!v4
    && ((*((unsigned char *)&self->_statusBarFlags + 1) & 4) == 0
     || [(_UIStatusBarVisualProvider *)self->_visualProvider canFixupDisplayItemAttributes]))
  {
    regions = self->_regions;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_108];
  }
}

+ (double)_effectiveScaleForVisualProviderClass:(Class)a3 targetScreen:(id)a4
{
  id v5 = a4;
  double v6 = 1.0;
  if ([(objc_class *)a3 scalesWithScreenNativeScale])
  {
    [v5 _nativeScale];
    double v8 = v7;
    if (objc_opt_respondsToSelector()) {
      [(objc_class *)a3 referenceScreenScale];
    }
    else {
      [v5 _scale];
    }
    if (v8 != 0.0 && vabdd_f64(v9, v8) > 0.00000011920929) {
      double v6 = v9 / v8;
    }
  }

  return v6;
}

- (CGAffineTransform)_effectiveScaleTransform
{
  if ((LOBYTE(self[8].tx) & 2) == 0) {
    goto LABEL_11;
  }
  uint64_t v4 = self;
  id v5 = [(CGAffineTransform *)self _screen];
  [v5 _nativeScale];
  double v7 = v6;

  if ((LOBYTE(v4[8].tx) & 4) != 0)
  {
    [*(id *)&v4[11].ty referenceScreenScale];
    double v10 = v11;
  }
  else
  {
    double v8 = [(CGAffineTransform *)v4 _screen];
    [v8 _scale];
    double v10 = v9;
  }
  self = (CGAffineTransform *)[(CGAffineTransform *)v4 mode];
  if (self == (CGAffineTransform *)1 || v7 == 0.0 || vabdd_f64(v10, v7) <= 0.00000011920929)
  {
LABEL_11:
    uint64_t v12 = MEMORY[0x1E4F1DAB8];
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v12 + 32);
  }
  else
  {
    return CGAffineTransformMakeScale(retstr, v10 / v7, v10 / v7);
  }
  return self;
}

- (void)resizeSubviewsWithOldSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBar;
  -[UIView resizeSubviewsWithOldSize:](&v12, sel_resizeSubviewsWithOldSize_);
  [(UIView *)self bounds];
  if (width != v7 || height != v6) {
    [(NSMutableDictionary *)self->_displayItemStates enumerateKeysAndObjectsUsingBlock:&__block_literal_global_115_3];
  }
  [(_UIStatusBar *)self _effectiveScaleTransform];
  foregroundView = self->_foregroundView;
  v11[0] = v11[3];
  v11[1] = v11[4];
  v11[2] = v11[5];
  [(UIView *)foregroundView setTransform:v11];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_foregroundView, "setFrame:");
  [(UIView *)self setNeedsUpdateConstraints];
  $C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags = self->_statusBarFlags;
  self->_$C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags = ($C136912CCF4AA723A1C7FFC3680A3D65)(*(_DWORD *)&statusBarFlags | 1);
  if ((*(_WORD *)&statusBarFlags & 0x800) != 0) {
    -[_UIStatusBarVisualProvider sizeUpdatedFromSize:](self->_visualProvider, "sizeUpdatedFromSize:", width, height);
  }
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBar;
  [(UIView *)&v3 updateConstraints];
  if ((*((unsigned char *)&self->_statusBarFlags + 2) & 8) == 0) {
    [(_UIStatusBar *)self _updateRegionItems];
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBar;
  id v3 = [(UIView *)&v7 layoutSubviews];
  __30___UIStatusBar_layoutSubviews__block_invoke((uint64_t)v3, self->_foregroundView);
  regions = self->_regions;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30___UIStatusBar_layoutSubviews__block_invoke_2;
  v6[3] = &__block_descriptor_40_e45_v32__0__NSString_8___UIStatusBarRegion_16_B24lu32l8;
  v6[4] = &__block_literal_global_122_2;
  [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v6];
  [(UIView *)self->_foregroundView layoutIfNeeded];
  if ((*(_DWORD *)&self->_statusBarFlags & 0x100008) == 0) {
    id v5 = [(_UIStatusBar *)self _rearrangeOverflowedItems];
  }
  [(UIView *)self layoutIfNeeded];
}

- (void)_updateRegionItems
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!self->_currentData) {
    return;
  }
  v2 = self;
  uint64_t v3 = 512;
  [(NSMutableDictionary *)self->_displayItemStates enumerateKeysAndObjectsUsingBlock:&__block_literal_global_125_0];
  [(NSDictionary *)v2->_regions keysSortedByValueUsingComparator:&__block_literal_global_128_0];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (!v40) {
    goto LABEL_35;
  }
  char v38 = 0;
  uint64_t v39 = *(void *)v55;
  v45 = v2;
  do
  {
    for (uint64_t i = 0; i != v40; uint64_t i = v23 + 1)
    {
      if (*(void *)v55 != v39) {
        objc_enumerationMutation(obj);
      }
      uint64_t v42 = i;
      uint64_t v5 = *(void *)(*((void *)&v54 + 1) + 8 * i);
      id v41 = [(NSDictionary *)v2->_regions objectForKeyedSubscript:v5];
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      objc_super v7 = [(_UIStatusBarVisualProvider *)v2->_visualProvider orderedDisplayItemPlacementsInRegionWithIdentifier:v5];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v44 = v7;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v59 count:16];
      v43 = v6;
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)v51 != v10) {
              objc_enumerationMutation(v44);
            }
            objc_super v12 = *(void **)(*((void *)&v50 + 1) + 8 * j);
            long long v13 = [v12 identifier];
            uint64_t v14 = v3;
            long long v15 = [*(id *)((char *)&v2->super.super.super.isa + v3) objectForKeyedSubscript:v13];
            int v16 = [v15 isCurrentPlacement:v12];

            if (v16)
            {
              id v17 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v13];
              uint64_t v18 = [(_UIStatusBar *)v2 itemWithIdentifier:v17];
              double v19 = [v12 identifier];
              id v20 = [v18 displayItemForIdentifier:v19];

              id v6 = v43;
              [v20 setPlacement:v12];
              [v43 addObject:v20];

              v2 = v45;
            }

            uint64_t v3 = v14;
          }
          uint64_t v9 = [v44 countByEnumeratingWithState:&v50 objects:v59 count:16];
        }
        while (v9);
      }
      uint64_t v21 = [v41 displayItems];
      char v22 = [v6 isEqual:v21];

      if (v22)
      {
        uint64_t v23 = v42;
LABEL_19:
        long long v24 = v43;
        goto LABEL_23;
      }
      uint64_t v23 = v42;
      if ((*((unsigned char *)&v2->_statusBarFlags + 1) & 0x10) == 0) {
        goto LABEL_19;
      }
      long long v24 = v43;
      long long v25 = [(_UIStatusBarVisualProvider *)v2->_visualProvider region:v41 willSetDisplayItems:v43];
      long long v26 = v25;
      if (v25 != v43)
      {
        uint64_t v27 = [v25 mutableCopy];

        long long v24 = (void *)v27;
      }

LABEL_23:
      [v41 setDisplayItems:v24];
      long long v28 = [v41 displayItems];
      [v24 minusOrderedSet:v28];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v29 = v24;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v58 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v47;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v47 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(Class *)((char *)&v45->super.super.super.isa + v3);
            id v35 = [*(id *)(*((void *)&v46 + 1) + 8 * k) identifier];
            id v36 = [v34 objectForKeyedSubscript:v35];
            [v36 updateToNextEnabledPlacement];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v58 count:16];
        }
        while (v31);
        char v38 = 1;
        v2 = v45;
      }
    }
    uint64_t v40 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  }
  while (v40);
  if (v38) {
    [(_UIStatusBar *)v2 _updateRegionItems];
  }
LABEL_35:
  if ((*((unsigned char *)&v2->_statusBarFlags + 1) & 0x20) != 0) {
    [(_UIStatusBarVisualProvider *)v2->_visualProvider statusBarRegionsUpdated];
  }
}

- (id)_rearrangeOverflowedItems
{
  [(UIView *)self frame];
  if (CGRectIsEmpty(v16))
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    objc_super v12 = __Block_byref_object_copy__183;
    long long v13 = __Block_byref_object_dispose__183;
    id v14 = 0;
    regions = self->_regions;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __41___UIStatusBar__rearrangeOverflowedItems__block_invoke;
    v8[3] = &unk_1E53073E0;
    v8[4] = self;
    v8[5] = &v9;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v8];
    uint64_t v5 = (void *)v10[5];
    if (v5)
    {
      [v5 updateToNextEnabledPlacement];
      [(UIView *)self setNeedsUpdateConstraints];
      [(UIView *)self setNeedsLayout];
      id v6 = (void *)v10[5];
    }
    else
    {
      id v6 = 0;
    }
    id v3 = v6;
    _Block_object_dispose(&v9, 8);
  }
  return v3;
}

- (CGRect)_extendedHoverFrameForActionable:(id)a3
{
  id v4 = a3;
  [v4 absoluteHoverFrame];
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  if (!CGRectIsNull(v24))
  {
    [v4 extendedHoverInsets];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    UIUserInterfaceLayoutDirection v17 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
    if (v17 == UIUserInterfaceLayoutDirectionRightToLeft) {
      double v18 = v16;
    }
    else {
      double v18 = v12;
    }
    if (v17 == UIUserInterfaceLayoutDirectionRightToLeft) {
      double v19 = v12;
    }
    else {
      double v19 = v16;
    }
    double x = x + v18;
    double y = y + v10;
    double width = width - (v18 + v19);
    double height = height - (v10 + v14);
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (BOOL)_cursorLocation:(CGPoint)a3 isInsideActionable:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(_UIStatusBar *)self _frameForActionable:a4];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)_cursorLocation:(CGPoint)a3 isInsideHoverableActionable:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [v7 hoverView];
  [(_UIStatusBar *)self _extendedHoverFrameForActionable:v7];
  CGFloat v9 = v17.origin.x;
  CGFloat v10 = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  if (CGRectIsNull(v17))
  {
    BOOL v13 = -[_UIStatusBar _cursorLocation:isInsideActionable:](self, "_cursorLocation:isInsideActionable:", v7, x, y);
  }
  else
  {
    v18.origin.double x = v9;
    v18.origin.double y = v10;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    v16.double x = x;
    v16.double y = y;
    BOOL v13 = CGRectContainsPoint(v18, v16);
  }
  BOOL v14 = v13;

  return v14;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  regionActionValidationBlocuint64_t k = (unsigned int (**)(void))self->_regionActionValidationBlock;
  if (regionActionValidationBlock && !regionActionValidationBlock[2]())
  {
    double v21 = 0;
  }
  else
  {
    uint64_t v37 = 0;
    char v38 = &v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__183;
    id v41 = __Block_byref_object_dispose__183;
    id v42 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = __Block_byref_object_copy__183;
    id v35 = __Block_byref_object_dispose__183;
    id v36 = 0;
    regions = self->_regions;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    long long v25 = __66___UIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
    long long v26 = &unk_1E5307430;
    uint64_t v27 = self;
    id v28 = v9;
    id v29 = &v37;
    uint64_t v30 = &v31;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:&v23];
    if (v38[5])
    {
      -[_UIStatusBar _extendedHoverFrameForActionable:](self, "_extendedHoverFrameForActionable:", v23, v24, v25, v26, v27);
      double x = v44.origin.x;
      double y = v44.origin.y;
      double width = v44.size.width;
      double height = v44.size.height;
      if (CGRectIsNull(v44))
      {
        [(_UIStatusBar *)self _pressFrameForActionable:v38[5]];
        double x = v17;
        double y = v18;
        double width = v19;
        double height = v20;
      }
      double v21 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v32[5], x, y, width, height);
    }
    else
    {
      double v21 = 0;
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);
  }
  return v21;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  uint64_t v6 = objc_msgSend(a4, "identifier", a3);
  id v8 = (id)v6;
  if (v6)
  {
    id v7 = [(_UIStatusBar *)self regionWithIdentifier:v6];
    if (!v7)
    {
      id v7 = [(_UIStatusBar *)self displayItemWithIdentifier:v8];
    }
    objc_storeWeak((id *)&self->_hoveredActionable, v7);
  }
  else
  {
    objc_storeWeak((id *)&self->_hoveredActionable, 0);
  }
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  p_hoveredActionable = &self->_hoveredActionable;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hoveredActionable);
  id v7 = [WeakRetained hoverView];

  if (!v7)
  {
    long long v26 = 0;
    goto LABEL_13;
  }
  id v8 = objc_loadWeakRetained((id *)p_hoveredActionable);
  [v8 absoluteHoverFrame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  id v17 = objc_loadWeakRetained((id *)p_hoveredActionable);
  char v18 = [v17 hoverHighlightsAsRegion];

  v43.origin.double x = v10;
  v43.origin.double y = v12;
  v43.size.double width = v14;
  v43.size.double height = v16;
  if (!CGRectIsNull(v43))
  {
    uint64_t v27 = objc_opt_new();
    -[UIView convertRect:toView:](self, "convertRect:toView:", v7, v10, v12, v14, v16);
    id v28 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
    [v27 setVisiblePath:v28];

    uint64_t v23 = [[UITargetedPreview alloc] initWithView:v7 parameters:v27];
    if ((v18 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v24 = +[UIPointerEffect effectWithPreview:v23];
    id v29 = [(_UIStatusBar *)self visualProvider];
    int v30 = [v29 conformsToProtocol:&unk_1ED6460A0];

    if (v30)
    {
      uint64_t v31 = [(_UIStatusBar *)self visualProvider];
      [(id)objc_opt_class() regionCursorInsets];
      double v10 = v10 + v32;
      double v12 = v12 + v33;
      double v14 = v14 - (v32 + v34);
      double v16 = v16 - (v33 + v35);

      id v36 = [(_UIStatusBar *)self visualProvider];
      char v37 = [(id)objc_opt_class() regionCursorIsPill];

      if ((v37 & 1) == 0)
      {
        char v38 = [(_UIStatusBar *)self visualProvider];
        [(id)objc_opt_class() regionCursorCornerRadius];
        double v25 = v39;

        goto LABEL_12;
      }
    }
    else
    {
      double v10 = v10 + -8.0;
      double v12 = v12 + -2.0;
      double v14 = v14 + 16.0;
      double v16 = v16 + 4.0;
    }
    v44.origin.double x = v10;
    v44.origin.double y = v12;
    v44.size.double width = v14;
    v44.size.double height = v16;
    double v25 = CGRectGetHeight(v44) * 0.5;
    goto LABEL_12;
  }
  [v7 frame];
  double v10 = v19;
  double v12 = v20;
  double v14 = v21;
  double v16 = v22;
  uint64_t v23 = [[UITargetedPreview alloc] initWithView:v7];
  if (v18) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v24 = +[UIPointerEffect effectWithPreview:v23];
  double v25 = 0.0;
LABEL_12:
  uint64_t v40 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v25);
  long long v26 = +[UIPointerStyle styleWithEffect:v24 shape:v40];

LABEL_13:
  return v26;
}

- (CGRect)_frameForActionable:(id)a3
{
  id v4 = a3;
  [v4 actionInsets];
  -[_UIStatusBar _frameForActionable:actionInsets:](self, "_frameForActionable:actionInsets:", v4);
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
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_pressFrameForActionable:(id)a3
{
  -[_UIStatusBar _frameForActionable:actionInsets:](self, "_frameForActionable:actionInsets:", a3, 0.0, 0.0, 0.0, 0.0);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_frameForActionable:(id)a3 actionInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  double v10 = [v9 layoutItem];
  objc_msgSend(v10, "_ui_bounds");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = [v9 layoutItem];

  double v20 = objc_msgSend(v19, "_ui_view");
  objc_msgSend(v20, "convertRect:toView:", self, v12, v14, v16, v18);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  [(UIView *)self _currentScreenScale];
  double v30 = UIRectIntegralWithScale(left + v22, top + v24, v26 - (left + right), v28 - (top + bottom), v29);
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (void)_updateActionGestureRecognizerAllowableTouchTypesIfNeeded
{
  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    if ([(_UIStatusBarVisualProvider *)visualProvider supportsIndirectPointerTouchActions])double v4 = &unk_1ED3F11C8; {
    else
    }
      double v4 = &unk_1ED3F11B0;
    actionGestureRecognizer = self->_actionGestureRecognizer;
    [(UIGestureRecognizer *)actionGestureRecognizer setAllowedTouchTypes:v4];
  }
}

- (BOOL)_gestureRecognizer:(id)a3 isInsideActionable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(_UIStatusBar *)self _gestureRecognizer:v6 touchInsideActionable:v7]|| [(_UIStatusBar *)self _gestureRecognizer:v6 pressInsideActionable:v7];

  return v8;
}

- (BOOL)_gestureRecognizer:(id)a3 touchInsideActionable:(id)a4
{
  id v6 = a4;
  [a3 locationInView:self];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(_UIStatusBar *)self _frameForActionable:v6];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  uint64_t v19 = v12;
  uint64_t v20 = v14;
  uint64_t v21 = v16;
  uint64_t v22 = v18;
  uint64_t v23 = v8;
  uint64_t v24 = v10;
  return CGRectContainsPoint(*(CGRect *)&v19, *(CGPoint *)&v23);
}

- (BOOL)_gestureRecognizer:(id)a3 pressInsideActionable:(id)a4
{
  id v5 = a4;
  id v6 = [(UIView *)self _focusSystem];
  uint64_t v7 = [v6 focusedItem];

  uint64_t v8 = [v7 focusItemContainer];
  [(_UIStatusBar *)self _pressFrameForActionable:v5];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  [v7 frame];
  v23.origin.double x = v17;
  v23.origin.double y = v18;
  v23.size.double width = v19;
  v23.size.double height = v20;
  v22.origin.double x = v10;
  v22.origin.double y = v12;
  v22.size.double width = v14;
  v22.size.double height = v16;
  LOBYTE(self) = CGRectContainsRect(v22, v23);

  return (char)self;
}

- (void)statusBarGesture:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [v18 state];
  uint64_t v5 = v4;
  unint64_t v6 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 2)
  {
    if ((unint64_t)(v4 - 3) > 2)
    {
      id v10 = 0;
      goto LABEL_19;
    }
    id v10 = 0;
  }
  else
  {
    p_targetActionable = &self->_targetActionable;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetActionable);
    BOOL v9 = [(_UIStatusBar *)self _gestureRecognizer:v18 isInsideActionable:WeakRetained];

    if (v9) {
      id v10 = objc_loadWeakRetained((id *)&self->_targetActionable);
    }
    else {
      id v10 = 0;
    }
    if (v6 <= 1)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_targetActionable);
      if (v11)
      {
        $C136912CCF4AA723A1C7FFC3680A3D65 statusBarFlags = self->_statusBarFlags;

        if ((*(_WORD *)&statusBarFlags & 0x4000) != 0)
        {
          visualProvider = self->_visualProvider;
          id v14 = objc_loadWeakRetained((id *)p_targetActionable);
          [(_UIStatusBarVisualProvider *)visualProvider actionable:v14 highlighted:v10 != 0 initialPress:v5 == 1];
        }
      }
      goto LABEL_19;
    }
    double v15 = [v10 hoverAction];
    if (v15
      || ([v10 action], (double v15 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(_UIStatusBar *)self action], (double v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v15 performWithStatusBar:self completionHandler:0];
    }
  }
  if ((*((unsigned char *)&self->_statusBarFlags + 1) & 0x40) != 0)
  {
    CGFloat v16 = self->_visualProvider;
    id v17 = objc_loadWeakRetained((id *)&self->_targetActionable);
    [(_UIStatusBarVisualProvider *)v16 actionable:v17 highlighted:0 initialPress:0];
  }
  objc_storeWeak((id *)&self->_targetActionable, 0);
LABEL_19:
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hoveredActionable);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_hoveredActionable);
    objc_storeWeak((id *)&self->_targetActionable, v6);
  }
  else
  {
    regions = self->_regions;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45___UIStatusBar_gestureRecognizerShouldBegin___block_invoke;
    v11[3] = &unk_1E5307480;
    v11[4] = self;
    id v12 = v4;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v11];
  }
  id v8 = objc_loadWeakRetained((id *)&self->_targetActionable);
  BOOL v9 = v8 != 0;

  return v9;
}

- (id)_actionablesForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4 onlyVisible:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [MEMORY[0x1E4F1CA80] set];
  [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
  id v10 = [MEMORY[0x1E4F1CAD0] set];
  if (v6)
  {
    id v11 = +[_UIStatusBarIdentifier displayIdentifierFromStringRepresentation:v8];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];

      id v10 = (void *)v12;
    }
  }
  if ((*((unsigned char *)&self->_statusBarFlags + 1) & 0x80) != 0)
  {
    double v13 = [(_UIStatusBarVisualProvider *)self->_visualProvider displayItemIdentifiersForPartWithIdentifier:v8];
    uint64_t v14 = [v10 setByAddingObjectsFromSet:v13];

    id v10 = (void *)v14;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        CGFloat v20 = -[_UIStatusBar displayItemWithIdentifier:](self, "displayItemWithIdentifier:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24);
        uint64_t v21 = v20;
        if (v20 && (!v5 || [v20 visible])) {
          [v9 addObject:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  if (![v9 count])
  {
    CGRect v22 = [(_UIStatusBar *)self _regionsForPartWithIdentifier:v8 includeInternalItems:v6];
    [v9 unionSet:v22];
  }
  return v9;
}

- (id)_regionsForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
  if (a4) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  }
  else {
  id v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  if (*((unsigned char *)&self->_statusBarFlags + 2))
  {
    BOOL v9 = [(_UIStatusBarVisualProvider *)self->_visualProvider regionIdentifiersForPartWithIdentifier:v6];
    uint64_t v10 = [v8 setByAddingObjectsFromSet:v9];

    id v8 = (void *)v10;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        if (v16) {
          [v7 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v7;
}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = -[_UIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", a4, 0, 0, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setAction:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)actionForPartWithIdentifier:(id)a3
{
  double v3 = [(_UIStatusBar *)self _actionablesForPartWithIdentifier:a3 includeInternalItems:0 onlyVisible:0];
  id v4 = [v3 anyObject];
  BOOL v5 = [v4 action];

  return v5;
}

- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setOffset:", horizontal, vertical);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v3 = -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  double v5 = 0.0;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 offsetable])
        {
          [v9 offset];
          double v5 = v11;
          double v10 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  double v10 = 0.0;
LABEL_11:

  double v13 = v5;
  double v14 = v10;
  result.double vertical = v14;
  result.double horizontal = v13;
  return result;
}

- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) contentView];
        [v10 setAlpha:a3];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (double)alphaForPartWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v3 = -[_UIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  double v5 = 1.0;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v10 = [v9 contentView];

        if (v10)
        {
          long long v11 = [v9 contentView];
          [v11 alpha];
          double v5 = v12;

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)setStyle:(int64_t)a3 forPartWithIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(_UIStatusBar *)self _regionsForPartWithIdentifier:a4 includeInternalItems:0];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 style] != a3)
        {
          [v12 setStyle:a3];
          char v9 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);

    if (v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __47___UIStatusBar_setStyle_forPartWithIdentifier___block_invoke;
      v13[3] = &unk_1E52D9F70;
      v13[4] = self;
      [(_UIStatusBar *)self _performWithInheritedAnimation:v13];
    }
  }
  else
  {
  }
}

- (int64_t)styleForPartWithIdentifier:(id)a3
{
  double v3 = [(_UIStatusBar *)self _regionsForPartWithIdentifier:a3 includeInternalItems:0];
  uint64_t v4 = [v3 anyObject];
  int64_t v5 = [v4 style];

  return v5;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v21 = (NSArray *)a3;
  if (self->_enabledPartIdentifiers != v21)
  {
    objc_storeStrong((id *)&self->_enabledPartIdentifiers, a3);
    [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
    if (v21)
    {
      uint64_t v20 = (void *)v5;
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v7 = [(NSDictionary *)self->_regions allKeys];
      uint64_t v8 = [v6 setWithArray:v7];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      obuint64_t j = v21;
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v32 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v13 = [(_UIStatusBar *)self _regionsForPartWithIdentifier:v12 includeInternalItems:0];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v28;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v28 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  long long v17 = [*(id *)(*((void *)&v27 + 1) + 8 * j) identifier];
                  [v8 removeObject:v17];
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
              }
              while (v14);
            }
          }
          uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v9);
      }
    }
    else
    {
      uint64_t v8 = (void *)v5;
    }
    regions = self->_regions;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42___UIStatusBar_setEnabledPartIdentifiers___block_invoke;
    v24[3] = &unk_1E53073E0;
    id v19 = v8;
    id v25 = v19;
    long long v26 = &v35;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v24];
    if (*((unsigned char *)v36 + 24))
    {
      if ((*((unsigned char *)&self->_statusBarFlags + 2) & 2) != 0) {
        [(_UIStatusBarVisualProvider *)self->_visualProvider statusBarEnabledPartsUpdated];
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __42___UIStatusBar_setEnabledPartIdentifiers___block_invoke_2;
      v23[3] = &unk_1E52D9F70;
      v23[4] = self;
      [(_UIStatusBar *)self _performWithInheritedAnimation:v23];
    }

    _Block_object_dispose(&v35, 8);
  }
}

- (void)setDisabledPartIdentifiers:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSArray *)a3;
  if (self->_disabledPartIdentifiers != v5)
  {
    obuint64_t j = a3;
    [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
    p_disabledPartIdentifiers = &self->_disabledPartIdentifiers;
    long long v32 = v5;
    uint64_t v6 = [(NSArray *)self->_disabledPartIdentifiers arrayByExcludingObjectsInArray:v5];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v13 = [(_UIStatusBar *)self _actionablesForPartWithIdentifier:v12 includeInternalItems:1 onlyVisible:0];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v52 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v43;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v43 != v16) {
                  objc_enumerationMutation(v13);
                }
                [*(id *)(*((void *)&v42 + 1) + 8 * j) enableWithToken:2];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v42 objects:v52 count:16];
            }
            while (v15);
            char v9 = 1;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
    }
    long long v18 = [(NSArray *)v32 arrayByExcludingObjectsInArray:*p_disabledPartIdentifiers];
    objc_storeStrong((id *)p_disabledPartIdentifiers, obj);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * k);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v25 = [(_UIStatusBar *)self _actionablesForPartWithIdentifier:v24 includeInternalItems:1 onlyVisible:0];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v50 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v35;
            do
            {
              for (uint64_t m = 0; m != v27; ++m)
              {
                if (*(void *)v35 != v28) {
                  objc_enumerationMutation(v25);
                }
                [*(id *)(*((void *)&v34 + 1) + 8 * m) disableWithToken:2];
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v50 count:16];
            }
            while (v27);
            char v9 = 1;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v51 count:16];
      }
      while (v21);
    }

    uint64_t v5 = v32;
    if (v9)
    {
      if ((*((unsigned char *)&self->_statusBarFlags + 2) & 2) != 0) {
        [(_UIStatusBarVisualProvider *)self->_visualProvider statusBarEnabledPartsUpdated];
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __43___UIStatusBar_setDisabledPartIdentifiers___block_invoke;
      v33[3] = &unk_1E52D9F70;
      v33[4] = self;
      [(_UIStatusBar *)self _performWithInheritedAnimation:v33];
    }
  }
}

- (CGRect)frameForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (CGFloat *)MEMORY[0x1E4F1DB20];
  if (*(unsigned char *)&self->_statusBarFlags)
  {
    [(UIView *)self layoutIfNeeded];
    *(_DWORD *)&self->_statusBarFlags &= ~1u;
  }
  CGFloat x = *v7;
  CGFloat y = v7[1];
  CGFloat width = v7[2];
  CGFloat height = v7[3];
  if ([v6 isEqualToString:@"clockPartIdentifier"]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v12 = [(_UIStatusBar *)self _actionablesForPartWithIdentifier:v6 includeInternalItems:v4 onlyVisible:1];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v67 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          long long v18 = [v17 layoutItem];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(_UIStatusBarVisualProvider *)self->_visualProvider clockBoundsForLayoutItem:v17];
          }
          else {
            objc_msgSend(v18, "_ui_bounds");
          }
          double v23 = v19;
          double v24 = v20;
          double v25 = v21;
          double v26 = v22;
          uint64_t v27 = objc_msgSend(v18, "_ui_view");
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v27, v23, v24, v25, v26);
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          CGFloat v33 = v32;
          CGFloat v35 = v34;

          v73.origin.CGFloat x = x;
          v73.origin.CGFloat y = y;
          v73.size.CGFloat width = width;
          v73.size.CGFloat height = height;
          v78.origin.CGFloat x = v29;
          v78.origin.CGFloat y = v31;
          v78.size.CGFloat width = v33;
          v78.size.CGFloat height = v35;
          CGRect v74 = CGRectUnion(v73, v78);
          CGFloat x = v74.origin.x;
          CGFloat y = v74.origin.y;
          CGFloat width = v74.size.width;
          CGFloat height = v74.size.height;
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v14);
    }
  }
  else
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v12 = -[_UIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v6, v4, 1, 0);
    uint64_t v36 = [v12 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v63 != v38) {
            objc_enumerationMutation(v12);
          }
          long long v40 = [*(id *)(*((void *)&v62 + 1) + 8 * j) layoutItem];
          objc_msgSend(v40, "_ui_bounds");
          double v42 = v41;
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;
          long long v49 = objc_msgSend(v40, "_ui_view");
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v49, v42, v44, v46, v48);
          CGFloat v51 = v50;
          CGFloat v53 = v52;
          CGFloat v55 = v54;
          CGFloat v57 = v56;

          v75.origin.CGFloat x = x;
          v75.origin.CGFloat y = y;
          v75.size.CGFloat width = width;
          v75.size.CGFloat height = height;
          v79.origin.CGFloat x = v51;
          v79.origin.CGFloat y = v53;
          v79.size.CGFloat width = v55;
          v79.size.CGFloat height = v57;
          CGRect v76 = CGRectUnion(v75, v79);
          CGFloat x = v76.origin.x;
          CGFloat y = v76.origin.y;
          CGFloat width = v76.size.width;
          CGFloat height = v76.size.height;
        }
        uint64_t v37 = [v12 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v37);
    }
  }

  double v58 = x;
  double v59 = y;
  double v60 = width;
  double v61 = height;
  result.size.CGFloat height = v61;
  result.size.CGFloat width = v60;
  result.origin.CGFloat y = v59;
  result.origin.CGFloat x = v58;
  return result;
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  [(_UIStatusBar *)self frameForPartWithIdentifier:a3 includeInternalItems:0];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

+ (NSString)sensorActivityIndicatorPartIdentifier
{
  return (NSString *)@"trailingPartIdentifier";
}

+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5
{
  [a1 intrinsicContentSizeForTargetScreen:a3 orientation:a4 onLockScreen:a5 isAzulBLinked:1];
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5 isAzulBLinked:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id VisualProviderClassForScreen = _UIStatusBarGetVisualProviderClassForScreen(v10, 0);
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [VisualProviderClassForScreen intrinsicLockScreenContentSizeForOrientation:a4];
  }
  else {
    [VisualProviderClassForScreen intrinsicContentSizeForOrientation:a4];
  }
  double v14 = v12;
  double v15 = v13;
  if (v6)
  {
    [a1 _effectiveScaleForVisualProviderClass:VisualProviderClassForScreen targetScreen:v10];
    double v15 = round(v15 * v16);
  }

  double v17 = v14;
  double v18 = v15;
  result.CGFloat height = v18;
  result.CGFloat width = v17;
  return result;
}

- (NSSet)dependentDataEntryKeys
{
  [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
  double v3 = [MEMORY[0x1E4F1CA80] set];
  displayItemStates = self->_displayItemStates;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38___UIStatusBar_dependentDataEntryKeys__block_invoke;
  v9[3] = &unk_1E53074A8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(NSMutableDictionary *)displayItemStates enumerateKeysAndObjectsUsingBlock:v9];
  BOOL v6 = v10;
  BOOL v7 = (NSSet *)v5;

  return v7;
}

- (UIView)containerView
{
  return self->_foregroundView;
}

- (unsigned)animationContextId
{
  v2 = [(UIView *)self window];
  unsigned int v3 = [v2 _contextId];

  return v3;
}

- (BOOL)areAnimationsEnabled
{
  if (!+[UIView areAnimationsEnabled]) {
    return 0;
  }
  unsigned int v3 = [(UIView *)self window];
  if (v3)
  {
    double v4 = [(UIView *)self window];
    char v5 = [v4 _hasContext];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
  unsigned int v3 = [(UIView *)self window];
  double v4 = objc_opt_class();
  if (v3) {
    uint64_t v5 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v3];
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 intrinsicContentSizeForOrientation:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (id)_itemWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(NSMutableDictionary *)self->_items objectForKeyedSubscript:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    double v7 = +[_UIStatusBarItem createItemForIdentifier:v6 statusBar:self];
    if ((*((unsigned char *)&self->_statusBarFlags + 2) & 4) != 0) {
      [(_UIStatusBarVisualProvider *)self->_visualProvider itemCreated:v7];
    }
    [(NSMutableDictionary *)self->_items setObject:v7 forKeyedSubscript:v6];
  }

  return v7;
}

- (id)itemWithIdentifier:(id)a3
{
  return [(_UIStatusBar *)self _itemWithIdentifier:a3 createIfNeeded:1];
}

- (id)displayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v4];
  id v6 = [(_UIStatusBar *)self _itemWithIdentifier:v5 createIfNeeded:0];

  if (v6)
  {
    double v7 = [v6 displayItemForIdentifier:v4];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)regionWithIdentifier:(id)a3
{
  id v4 = a3;
  [(_UIStatusBar *)self _prepareVisualProviderIfNeeded];
  uint64_t v5 = [(NSDictionary *)self->_regions objectForKeyedSubscript:v4];

  return v5;
}

- (id)stateForDisplayItemWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_displayItemStates objectForKeyedSubscript:a3];
}

- (id)itemsDependingOnKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  items = self->_items;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37___UIStatusBar_itemsDependingOnKeys___block_invoke;
  v12[3] = &unk_1E53074D0;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(NSMutableDictionary *)items enumerateKeysAndObjectsUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

- (CGRect)frameForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  [(UIView *)self layoutIfNeeded];
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  items = self->_items;
  id v10 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v4];
  double v11 = [(NSMutableDictionary *)items objectForKeyedSubscript:v10];

  if (v11)
  {
    double v12 = [v11 displayItemForIdentifier:v4];
    id v13 = v12;
    if (v12)
    {
      id v14 = [v12 view];
      [v14 alpha];
      if (v15 > 0.0)
      {
        double v16 = [v14 window];

        if (v16)
        {
          [v14 bounds];
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v14);
          double v5 = v17;
          double v6 = v18;
          double v7 = v19;
          double v8 = v20;
        }
      }
    }
  }

  double v21 = v5;
  double v22 = v6;
  double v23 = v7;
  double v24 = v8;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (id)displayItemIdentifiersInRegionsWithIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA80] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [(_UIStatusBarVisualProvider *)self->_visualProvider orderedDisplayItemPlacementsInRegionWithIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              double v15 = [*(id *)(*((void *)&v18 + 1) + 8 * j) identifier];
              [v5 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)itemIdentifiersInRegionsWithIdentifiers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  uint64_t v6 = [v4 set];
  uint64_t v7 = [(_UIStatusBar *)self displayItemIdentifiersInRegionsWithIdentifiers:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56___UIStatusBar_itemIdentifiersInRegionsWithIdentifiers___block_invoke;
  v10[3] = &unk_1E53074F8;
  id v8 = v6;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return v8;
}

- (id)dataEntryKeysForItemsWithIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[_UIStatusBar itemWithIdentifier:](self, "itemWithIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        uint64_t v12 = [v11 dependentEntryKeys];
        [v5 unionSet:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  id v4 = [(UIView *)self traitCollection];
  BOOL v5 = [v4 userInterfaceIdiom] != 3;

  return v5;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(_UIStatusBar *)self regions];
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v12 isEnabled])
        {
          uint64_t v13 = objc_msgSend(v12, "displayItemForHUDAtLocation:", x, y);
          long long v14 = v13;
          if (v13)
          {
            long long v15 = [v13 view];
            char v16 = objc_opt_respondsToSelector();

            if (v16) {
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  long long v14 = 0;
LABEL_13:

  long long v17 = [v14 view];
  long long v18 = [v17 accessibilityHUDRepresentation];

  return v18;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldTerminateHUDGestureForOtherGestureRecognizer:(id)a4
{
  return self->_actionGestureRecognizer != a4;
}

- (void)_accessibilityHUDGestureManager:(id)a3 showHUDItem:(id)a4
{
  id v5 = a4;
  id v6 = [(UIView *)self traitCollection];
  objc_msgSend(v5, "setCustomUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  id v7 = [(_UIStatusBar *)self _statusBarWindowForAccessibilityHUD];
  [v7 _showAccessibilityHUDItem:v5 forView:self];
}

- (void)_dismissAccessibilityHUDForGestureManager:(id)a3
{
  id v3 = [(_UIStatusBar *)self _statusBarWindowForAccessibilityHUD];
  [v3 _dismissAccessibilityHUD];
}

- (UIScreen)targetScreen
{
  return self->_targetScreen;
}

- (void)setTargetScreen:(id)a3
{
}

- (NSDictionary)visualProviderInfo
{
  return self->_visualProviderInfo;
}

- (void)setVisualProviderInfo:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (_UIStatusBarData)currentData
{
  return self->_currentData;
}

- (UIGestureRecognizer)actionGestureRecognizer
{
  return self->_actionGestureRecognizer;
}

- (NSArray)enabledPartIdentifiers
{
  return self->_enabledPartIdentifiers;
}

- (NSArray)disabledPartIdentifiers
{
  return self->_disabledPartIdentifiers;
}

- (CGRect)avoidanceFrame
{
  double x = self->_avoidanceFrame.origin.x;
  double y = self->_avoidanceFrame.origin.y;
  double width = self->_avoidanceFrame.size.width;
  double height = self->_avoidanceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSMutableDictionary)displayItemStates
{
  return self->_displayItemStates;
}

- (void)setDisplayItemStates:(id)a3
{
}

- (id)updateCompletionHandler
{
  return self->_updateCompletionHandler;
}

- (void)setUpdateCompletionHandler:(id)a3
{
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (void)setForegroundView:(id)a3
{
}

- (_UIStatusBarActionable)targetActionable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetActionable);
  return (_UIStatusBarActionable *)WeakRetained;
}

- (void)setTargetActionable:(id)a3
{
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (_UIStatusBarActionable)hoveredActionable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hoveredActionable);
  return (_UIStatusBarActionable *)WeakRetained;
}

- (void)setHoveredActionable:(id)a3
{
}

- (UIAccessibilityHUDGestureManager)accessibilityHUDGestureManager
{
  return self->_accessibilityHUDGestureManager;
}

- (void)setAccessibilityHUDGestureManager:(id)a3
{
}

- (Class)_visualProviderClass
{
  return self->_visualProviderClass;
}

- (void)_setVisualProviderClass:(Class)a3
{
}

- (NSDictionary)regions
{
  return self->_regions;
}

- (_UIStatusBarDataAggregator)dataAggregator
{
  return self->_dataAggregator;
}

- (_UIStatusBarData)currentAggregatedData
{
  return self->_currentAggregatedData;
}

- (_UIStatusBarStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (_UIStatusBarAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (id)regionActionValidationBlock
{
  return self->_regionActionValidationBlock;
}

- (void)setRegionActionValidationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_regionActionValidationBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_currentAggregatedData, 0);
  objc_storeStrong((id *)&self->_dataAggregator, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_visualProviderClass, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDGestureManager, 0);
  objc_destroyWeak((id *)&self->_hoveredActionable);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_targetActionable);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong(&self->_updateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_displayItemStates, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_disabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_enabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_visualProviderInfo, 0);
  objc_storeStrong((id *)&self->_targetScreen, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
}

@end