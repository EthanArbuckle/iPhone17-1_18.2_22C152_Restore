@interface STUIStatusBar
+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5;
+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5 isAzulBLinked:(BOOL)a6;
+ (NSString)sensorActivityIndicatorPartIdentifier;
+ (double)_effectiveScaleForVisualProviderClass:(Class)a3 targetScreen:(id)a4;
+ (id)sensorActivityIndicatorForScreen:(id)a3;
+ (id)stringForStatusBarStyle:(int64_t)a3;
+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldTerminateHUDGestureForOtherGestureRecognizer:(id)a4;
- (BOOL)_cursorLocation:(CGPoint)a3 isInsideActionable:(id)a4;
- (BOOL)_cursorLocation:(CGPoint)a3 isInsideHoverableActionable:(id)a4;
- (BOOL)_forceLayoutEngineSolutionInRationalEdges;
- (BOOL)_gestureRecognizer:(id)a3 isInsideActionable:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 pressInsideActionable:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 touchInsideActionable:(id)a4;
- (BOOL)_showSensorActivityIndicatorWithoutPortalView;
- (BOOL)_useAutomaticStyle;
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
- (NSDictionary)automaticStyleOutliers;
- (NSDictionary)regions;
- (NSDictionary)visualProviderInfo;
- (NSMutableDictionary)displayItemStates;
- (NSMutableDictionary)items;
- (NSSet)dependentDataEntryKeys;
- (NSString)_visualProviderClassName;
- (NSString)debugDescription;
- (NSString)description;
- (STStatusBarData)currentAggregatedData;
- (STStatusBarData)currentData;
- (STStatusBarData)overlayData;
- (STUIStatusBar)initWithStyle:(int64_t)a3;
- (STUIStatusBarAction)action;
- (STUIStatusBarActionable)hoveredActionable;
- (STUIStatusBarActionable)targetActionable;
- (STUIStatusBarDataAggregator)dataAggregator;
- (STUIStatusBarStyleAttributes)styleAttributes;
- (STUIStatusBarVisualProvider)visualProvider;
- (UIAccessibilityHUDGestureManager)accessibilityHUDGestureManager;
- (UIColor)foregroundColor;
- (UIGestureRecognizer)actionGestureRecognizer;
- (UIOffset)offsetForPartWithIdentifier:(id)a3;
- (UIPointerInteraction)pointerInteraction;
- (UIScreen)_effectiveTargetScreen;
- (UIScreen)targetScreen;
- (UIView)containerView;
- (UIView)foregroundView;
- (double)alphaForPartWithIdentifier:(id)a3;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)_actionablesForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4 onlyVisible:(BOOL)a5;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)_expandedDescription;
- (id)_expandedDescriptionBuilderWithMultilinePrefix:(id)a3;
- (id)_itemWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_rearrangeOverflowedItems;
- (id)_regionsForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)actionForPartWithIdentifier:(id)a3;
- (id)dataEntryKeysForItemsWithIdentifiers:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
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
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)updateCompletionHandler;
- (int64_t)_effectiveStyleFromStyle:(int64_t)a3;
- (int64_t)automaticStyle;
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
- (void)_setAutomaticStyle:(int64_t)a3 additionalStylesForRegionIdentifiers:(id)a4;
- (void)_setVisualProviderClass:(Class)a3;
- (void)_setVisualProviderClassName:(id)a3;
- (void)_updateActionGestureRecognizerAllowableTouchTypesIfNeeded;
- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5;
- (void)_updateRegionItems;
- (void)_updateStyleAttributes;
- (void)_updateWithAggregatedData:(id)a3;
- (void)_updateWithData:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)reinitializeStatusBar;
- (void)resetVisualProvider;
- (void)resizeSubviewsWithOldSize:(CGSize)a3;
- (void)setAccessibilityHUDGestureManager:(id)a3;
- (void)setAction:(id)a3;
- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4;
- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4;
- (void)setAutomaticStyle:(int64_t)a3;
- (void)setAutomaticStyleOutliers:(id)a3;
- (void)setAvoidanceFrame:(CGRect)a3;
- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5;
- (void)setDisabledPartIdentifiers:(id)a3;
- (void)setDisplayItemStates:(id)a3;
- (void)setEnabledPartIdentifiers:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setForegroundView:(id)a3;
- (void)setHidden:(BOOL)a3 animationParameters:(id)a4;
- (void)setHoveredActionable:(id)a3;
- (void)setItems:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOverlayData:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setRegionActionValidationBlock:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 forPartWithIdentifier:(id)a4;
- (void)setStyleAttributes:(id)a3;
- (void)setTargetActionable:(id)a3;
- (void)setTargetScreen:(id)a3;
- (void)setUpdateCompletionHandler:(id)a3;
- (void)setVisualProviderInfo:(id)a3;
- (void)statusBarGesture:(id)a3;
- (void)updateConstraints;
- (void)updateForDataChange:(id)a3;
- (void)updateForcingIterativeOverflow;
- (void)updateWithAnimations:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation STUIStatusBar

uint64_t __35__STUIStatusBar__updateRegionItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updatePlacement];
}

uint64_t __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 prepareForDataUpdate];
}

uint64_t __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updatedDisplayItemsWithData:*(void *)(a1 + 32)];
}

uint64_t __43__STUIStatusBar_resizeSubviewsWithOldSize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 resetToPreferredPlacement];
}

- (void)_updateRegionItems
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!self->_currentData) {
    return;
  }
  v2 = self;
  uint64_t v3 = 536;
  [(NSMutableDictionary *)self->_displayItemStates enumerateKeysAndObjectsUsingBlock:&__block_literal_global_148];
  [(NSDictionary *)v2->_regions keysSortedByValueUsingComparator:&__block_literal_global_151];
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
      v41 = [(NSDictionary *)v2->_regions objectForKeyedSubscript:v5];
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      v7 = [(STUIStatusBarVisualProvider *)v2->_visualProvider orderedDisplayItemPlacementsInRegionWithIdentifier:v5];
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
            v12 = *(void **)(*((void *)&v50 + 1) + 8 * j);
            v13 = [v12 identifier];
            uint64_t v14 = v3;
            v15 = [*(id *)((char *)&v2->super.super.super.isa + v3) objectForKeyedSubscript:v13];
            int v16 = [v15 isCurrentPlacement:v12];

            if (v16)
            {
              v17 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v13];
              v18 = [(STUIStatusBar *)v2 itemWithIdentifier:v17];
              v19 = [v12 identifier];
              v20 = [v18 displayItemForIdentifier:v19];

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
      v21 = [v41 displayItems];
      char v22 = [v6 isEqual:v21];

      if (v22)
      {
        uint64_t v23 = v42;
LABEL_19:
        v24 = v43;
        goto LABEL_23;
      }
      uint64_t v23 = v42;
      if ((*((unsigned char *)&v2->_statusBarFlags + 1) & 0x10) == 0) {
        goto LABEL_19;
      }
      v24 = v43;
      v25 = [(STUIStatusBarVisualProvider *)v2->_visualProvider region:v41 willSetDisplayItems:v43];
      v26 = v25;
      if (v25 != v43)
      {
        uint64_t v27 = [v25 mutableCopy];

        v24 = (void *)v27;
      }

LABEL_23:
      [v41 setDisplayItems:v24];
      v28 = [v41 displayItems];
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
            v34 = *(Class *)((char *)&v45->super.super.super.isa + v3);
            v35 = [*(id *)(*((void *)&v46 + 1) + 8 * k) identifier];
            v36 = [v34 objectForKeyedSubscript:v35];
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
    [(STUIStatusBar *)v2 _updateRegionItems];
  }
LABEL_35:
  if ((*((unsigned char *)&v2->_statusBarFlags + 1) & 0x20) != 0) {
    [(STUIStatusBarVisualProvider *)v2->_visualProvider statusBarRegionsUpdated];
  }
}

- (STStatusBarData)currentAggregatedData
{
  return (STStatusBarData *)[(STMutableStatusBarData *)self->_currentAggregatedData immutableCopy];
}

- (BOOL)areAnimationsEnabled
{
  if (![MEMORY[0x1E4FB1EB0] areAnimationsEnabled]) {
    return 0;
  }
  uint64_t v3 = [(STUIStatusBar *)self window];
  if (v3)
  {
    v4 = [(STUIStatusBar *)self window];
    char v5 = [v4 _hasContext];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

void __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 updateWithData:*(void *)(a1 + 32) styleAttributes:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObjectsFromArray:v4];
}

- (id)_itemWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_items objectForKeyedSubscript:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    v7 = +[STUIStatusBarItem createItemForIdentifier:v6 statusBar:self];
    if ((*((unsigned char *)&self->_statusBarFlags + 2) & 4) != 0) {
      [(STUIStatusBarVisualProvider *)self->_visualProvider itemCreated:v7];
    }
    [(NSMutableDictionary *)self->_items setObject:v7 forKeyedSubscript:v6];
  }

  return v7;
}

- (id)itemWithIdentifier:(id)a3
{
  return [(STUIStatusBar *)self _itemWithIdentifier:a3 createIfNeeded:1];
}

- (STUIStatusBarStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

void __41__STUIStatusBar_styleAttributesForStyle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _effectiveStyleFromStyle:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 32) visualProvider];
  uint64_t v3 = [v6 styleAttributesForStyle:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (STUIStatusBarVisualProvider)visualProvider
{
  [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
  visualProvider = self->_visualProvider;
  return visualProvider;
}

- (BOOL)_useAutomaticStyle
{
  uint64_t v2 = self;
  uint64_t v3 = v2;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = v2->_statusBarFlags;
  if ((*(_DWORD *)&statusBarFlags & 0x80000) != 0)
  {
    if ((v2->_style & 0x3F) == 0)
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
    if ((*(_DWORD *)&statusBarFlags & 0x800000) != 0)
    {
      BOOL v5 = [(STUIStatusBar *)v2 mode] != 1;
      goto LABEL_7;
    }
  }
  BOOL v5 = 0;
LABEL_7:

  return v5;
}

- (int64_t)_effectiveStyleFromStyle:(int64_t)a3
{
  int64_t v3 = a3;
  if (!a3)
  {
    uint64_t v4 = [(STUIStatusBar *)self traitCollection];
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
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6;
  v13 = __Block_byref_object_dispose__6;
  id v14 = 0;
  BOOL v5 = [(STUIStatusBar *)self traitCollection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__STUIStatusBar_styleAttributesForStyle___block_invoke;
  v8[3] = &unk_1E6AA4EB0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  [v5 performAsCurrentTraitCollection:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (NSMutableDictionary)displayItemStates
{
  return self->_displayItemStates;
}

uint64_t __35__STUIStatusBar__updateRegionItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 isEnabled];
  int v6 = [v4 isEnabled];

  if (v5 | v6 ^ 1) {
    return v5 & (v6 ^ 1u);
  }
  else {
    return -1;
  }
}

uint64_t __31__STUIStatusBar_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 contentView];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v5 = v7;
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

void __31__STUIStatusBar_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "_is_needsLayout"))
  {
    uint64_t v2 = [v3 layer];
    [v2 setNeedsLayout];
  }
}

void __47__STUIStatusBar__prepareVisualProviderIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 424) orderedDisplayItemPlacementsInRegionWithIdentifier:a2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        v12 = [*(id *)(*(void *)(a1 + 32) + 536) objectForKeyedSubscript:v11];
        if (!v12)
        {
          v12 = +[STUIStatusBarDisplayItemState stateForDisplayItemWithIdentifier:v11 statusBar:*(void *)(a1 + 32)];
          [*(id *)(*(void *)(a1 + 32) + 536) setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addPlacement:v10 inRegion:v5];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (UIScreen)_effectiveTargetScreen
{
  id v3 = self->_targetScreen;
  if (!v3)
  {
    uint64_t v4 = [(STUIStatusBar *)self window];
    id v3 = [v4 screen];

    if (!v3)
    {
      id v5 = [(STUIStatusBar *)self traitCollection];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6 == 3) {
        [MEMORY[0x1E4FB1BA8] _carScreen];
      }
      else {
      id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
      }
    }
  }
  return v3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (CGAffineTransform)_effectiveScaleTransform
{
  if ((LOBYTE(self[9].a) & 2) == 0) {
    goto LABEL_11;
  }
  uint64_t v4 = self;
  id v5 = [(CGAffineTransform *)self _screen];
  [v5 _nativeScale];
  double v7 = v6;

  if ((LOBYTE(v4[9].a) & 4) != 0)
  {
    [*(id *)&v4[12].c referenceScreenScale];
    double v10 = v11;
  }
  else
  {
    uint64_t v8 = [(CGAffineTransform *)v4 _screen];
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
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  }
  else
  {
    return CGAffineTransformMakeScale(retstr, v10 / v7, v10 / v7);
  }
  return self;
}

+ (CGSize)intrinsicContentSizeForTargetScreen:(id)a3 orientation:(int64_t)a4 onLockScreen:(BOOL)a5 isAzulBLinked:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id VisualProviderClassForScreen = STUIStatusBarGetVisualProviderClassForScreen(v10, 0);
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
  result.height = v18;
  result.width = v17;
  return result;
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

- (void)setOverlayData:(id)a3
{
  id v11 = a3;
  if ([v11 isEmpty])
  {

    id v11 = 0;
  }
  id v4 = [(STUIStatusBar *)self overlayData];

  id v5 = v11;
  if (v11 != v4)
  {
    double v6 = [(STUIStatusBarDataAggregator *)self->_dataAggregator overlayData];

    if (v6)
    {
      double v7 = [(STUIStatusBarDataAggregator *)self->_dataAggregator overlayData];
      double v8 = [v7 dataByApplyingOverlay:self->_currentData];
      double v9 = (void *)[v8 mutableCopy];

      id v10 = v11;
      if (v11)
      {
        if (v9)
        {
          [v9 applyUpdate:v11];
LABEL_12:
          [(STUIStatusBarDataAggregator *)self->_dataAggregator setOverlayData:0];
          [(STUIStatusBarDataAggregator *)self->_dataAggregator updateWithData:v9];
          [(STUIStatusBarDataAggregator *)self->_dataAggregator setOverlayData:v11];

          id v5 = v11;
          goto LABEL_13;
        }
LABEL_9:
        id v11 = v10;
        double v9 = (void *)[v10 mutableCopy];
        goto LABEL_12;
      }
    }
    else
    {
      id v10 = v11;
      if (v11) {
        goto LABEL_9;
      }
      double v9 = 0;
    }
    id v11 = v10;
    goto LABEL_12;
  }
LABEL_13:
}

- (STStatusBarData)overlayData
{
  return [(STUIStatusBarDataAggregator *)self->_dataAggregator overlayData];
}

void __42__STUIStatusBar__rearrangeOverflowedItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if ([v11 isEnabled] && (objc_msgSend(v11, "disableItemFrameBasedOverflow") & 1) == 0)
  {
    id v4 = [v11 overflowedDisplayItem];
    id v5 = v4;
    if (!v4)
    {
LABEL_9:

      goto LABEL_10;
    }
    double v6 = *(void **)(*(void *)(a1 + 32) + 536);
    double v7 = [v4 identifier];
    double v8 = [v6 objectForKeyedSubscript:v7];

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(void *)(v9 + 40))
    {
      uint64_t v10 = [v8 priority];
      if (v10 >= [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) priority])
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    objc_storeStrong((id *)(v9 + 40), v8);
    goto LABEL_8;
  }
LABEL_10:
}

void __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 536) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_126];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  *(_DWORD *)(*(void *)(a1 + 32) + 432) |= 0x200000u;
  id v3 = *(void **)(*(void *)(a1 + 32) + 536);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_3;
  v19[3] = &unk_1E6AA4EF8;
  id v20 = *(id *)(a1 + 40);
  id v21 = *(id *)(a1 + 48);
  id v4 = v2;
  id v22 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v19];
  id v5 = *(void **)(*(void *)(a1 + 32) + 528);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_4;
  v17[3] = &unk_1E6AA4F20;
  id v18 = *(id *)(a1 + 40);
  [v5 enumerateKeysAndObjectsUsingBlock:v17];
  *(_DWORD *)(*(void *)(a1 + 32) + 432) &= ~0x200000u;
  [v4 addObjectsFromArray:*(void *)(a1 + 56)];
  double v6 = STUIStatusBarGetPriorityComparator();
  id v7 = (id)[v4 sortedArrayUsingComparator:v6];

  [*(id *)(a1 + 32) _prepareAnimations:v4];
  if ([v4 count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_5;
    v16[3] = &unk_1E6AA37A0;
    v16[4] = *(void *)(a1 + 32);
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v16];
    double v8 = *(_DWORD **)(a1 + 32);
    if ((v8[108] & 0x400008) != 0)
    {
      uint64_t v9 = [v8 _rearrangeOverflowedItems];
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        do
        {
          [v10 prepareForOverflowDataUpdate];
          id v11 = [v10 updateWithData:*(void *)(a1 + 40) styleAttributes:*(void *)(a1 + 48)];
          [*(id *)(a1 + 32) _prepareAnimations:v11];
          [v4 addObjectsFromArray:v11];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_6;
          v15[3] = &unk_1E6AA37A0;
          v15[4] = *(void *)(a1 + 32);
          [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v15];

          uint64_t v12 = [*(id *)(a1 + 32) _rearrangeOverflowedItems];

          uint64_t v10 = (void *)v12;
        }
        while (v12);
      }
      double v8 = *(_DWORD **)(a1 + 32);
    }
    [v8 _performAnimations:v4];
    [*(id *)(a1 + 32) layoutIfNeeded];
  }
  else
  {
    [*(id *)(a1 + 32) setNeedsUpdateConstraints];
    double v13 = *(_DWORD **)(a1 + 32);
    if ((v13[108] & 0x400008) != 0)
    {
      while (1)
      {
        [v13 layoutIfNeeded];
        double v14 = [*(id *)(a1 + 32) _rearrangeOverflowedItems];

        if (!v14) {
          break;
        }
        double v13 = *(_DWORD **)(a1 + 32);
      }
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 432) |= 1u;
  }
  [*(id *)(a1 + 32) _fixupDisplayItemAttributes];
}

uint64_t __109__STUIStatusBar_Wrapper__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t result = [*(id *)(a1 + 32) _requestedResolvedStyle];
  if (v2 == result)
  {
    [*(id *)(a1 + 32) _updateWithData:0 force:0];
    [*(id *)(*(void *)(a1 + 32) + 592) setStyle:*(void *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 32) + 592) setForegroundColor:*(void *)(a1 + 40)];
    id v4 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __109__STUIStatusBar_Wrapper__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke_2;
    v5[3] = &unk_1E6AA3EE0;
    v5[4] = *(void *)(a1 + 32);
    return [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
  return result;
}

- (void)setStyle:(int64_t)a3
{
  int64_t style = self->_style;
  if (style == a3) {
    return;
  }
  int64_t automaticStyle = self->_automaticStyle;
  id v7 = self;
  double v8 = v7;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = v7->_statusBarFlags;
  if ((*(_DWORD *)&statusBarFlags & 0x80000) != 0)
  {
    if ((self->_style & 0x3F) == 0)
    {
      BOOL v10 = 1;
      goto LABEL_8;
    }
    if ((*(_DWORD *)&statusBarFlags & 0x800000) != 0)
    {
      BOOL v10 = [(STUIStatusBar *)v7 mode] != 1;
      goto LABEL_8;
    }
  }
  BOOL v10 = 0;
LABEL_8:
  int64_t v11 = a3 >> 6;

  self->_int64_t style = a3;
  uint64_t v12 = v8;
  p_isa = (id *)&v12->super.super.super.isa;
  $480163010D8600EFAA81F3B9B74CD7E7 v14 = v12->_statusBarFlags;
  if ((*(_DWORD *)&v14 & 0x80000) == 0) {
    goto LABEL_11;
  }
  if ((self->_style & 0x3F) != 0)
  {
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
    {
LABEL_11:

      BOOL v15 = 0;
      int v16 = v11 != automaticStyle || v10;
      goto LABEL_23;
    }
    BOOL v15 = [(STUIStatusBar *)v12 mode] != 1;
  }
  else
  {
    BOOL v15 = 1;
  }

  int v16 = v10 ^ v15;
  if (v11 != automaticStyle) {
    int v16 = 1;
  }
  if (v16 != 1 || !v15)
  {
LABEL_23:
    id v18 = p_isa + 53;
    if (!p_isa[53]) {
      return;
    }
    if (!v16) {
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  if ((unint64_t)a3 <= 0x3F) {
    int64_t v11 = self->_automaticStyle;
  }
  self->_int64_t automaticStyle = v11;
  id v18 = p_isa + 53;
  if (p_isa[53])
  {
    BOOL v15 = 1;
LABEL_30:
    if ((p_isa[54] & 0x1080000) == 0x80000)
    {
      [MEMORY[0x1E4FB1EB0] _currentAnimationDuration];
      if (v19 > 0.0 && v15)
      {
        double v21 = v19;
        objc_initWeak(&location, p_isa);
        dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __26__STUIStatusBar_setStyle___block_invoke;
        block[3] = &unk_1E6AA4C10;
        objc_copyWeak(&v26, &location);
        dispatch_after(v22, MEMORY[0x1E4F14428], block);
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
      else
      {
        [*v18 updateLumaTracking:v15];
      }
    }
    LOBYTE(v16) = 1;
LABEL_38:
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __26__STUIStatusBar_setStyle___block_invoke_2;
    v23[3] = &unk_1E6AA4E88;
    v23[4] = p_isa;
    char v24 = v16;
    [p_isa _performWithInheritedAnimation:v23];
    if (((_BYTE)p_isa[54] & 0x80) != 0) {
      [*v18 styleUpdatedFromStyle:style];
    }
  }
}

- (void)setForegroundColor:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    if (self->_visualProvider)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __36__STUIStatusBar_setForegroundColor___block_invoke;
      v6[3] = &unk_1E6AA37A0;
      v6[4] = self;
      [(STUIStatusBar *)self _performWithInheritedAnimation:v6];
    }
  }
}

- (STStatusBarData)currentData
{
  return (STStatusBarData *)[(STMutableStatusBarData *)self->_currentData immutableCopy];
}

- (int64_t)style
{
  return self->_style;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBar;
  id v3 = [(STUIStatusBar *)&v7 layoutSubviews];
  __31__STUIStatusBar_layoutSubviews__block_invoke((uint64_t)v3, self->_foregroundView);
  regions = self->_regions;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__STUIStatusBar_layoutSubviews__block_invoke_2;
  v6[3] = &__block_descriptor_40_e46_v32__0__NSString_8__STUIStatusBarRegion_16_B24lu32l8;
  v6[4] = &__block_literal_global_145_0;
  [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v6];
  [(UIView *)self->_foregroundView layoutIfNeeded];
  if ((*(_DWORD *)&self->_statusBarFlags & 0x400008) == 0) {
    id v5 = [(STUIStatusBar *)self _rearrangeOverflowedItems];
  }
  [(STUIStatusBar *)self layoutIfNeeded];
}

- (id)_rearrangeOverflowedItems
{
  [(STUIStatusBar *)self frame];
  if (CGRectIsEmpty(v16))
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    BOOL v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__6;
    double v13 = __Block_byref_object_dispose__6;
    id v14 = 0;
    regions = self->_regions;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__STUIStatusBar__rearrangeOverflowedItems__block_invoke;
    v8[3] = &unk_1E6AA4E60;
    v8[4] = self;
    v8[5] = &v9;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v8];
    id v5 = (void *)v10[5];
    if (v5)
    {
      [v5 updateToNextEnabledPlacement];
      [(STUIStatusBar *)self setNeedsUpdateConstraints];
      [(STUIStatusBar *)self setNeedsLayout];
      double v6 = (void *)v10[5];
    }
    else
    {
      double v6 = 0;
    }
    id v3 = v6;
    _Block_object_dispose(&v9, 8);
  }
  return v3;
}

- (void)_prepareAnimations:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[STUIStatusBarAnimation prepareAnimations:v4 forStatusBar:self];
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
        objc_super v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        double v8 = objc_msgSend(v7, "effectiveDelayedItemIdentifiers", obj);
        if ([v8 count])
        {
          dispatch_time_t v22 = v7;
          uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
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
                BOOL v15 = [(STUIStatusBar *)self itemWithIdentifier:*(void *)(*((void *)&v24 + 1) + 8 * j)];
                CGRect v16 = [v15 dependentEntryKeys];
                [v9 unionSet:v16];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v12);
          }

          if ([v9 count]) {
            [(STUIStatusBar *)self _delayUpdatesWithKeys:v9 fromAnimation:v22];
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
    double v17 = _Block_copy(self->_updateCompletionHandler);
    id updateCompletionHandler = self->_updateCompletionHandler;
    self->_id updateCompletionHandler = 0;

    double v19 = dispatch_group_create();
    +[STUIStatusBarAnimation _addAnimations:v5 toDispatchGroup:v19];
    dispatch_group_notify(v19, MEMORY[0x1E4F14428], v17);
  }
}

- (void)_fixupDisplayItemAttributes
{
  id v3 = (id)_statusBarRunningAnimations;
  uint64_t v4 = [v3 count];

  if (!v4
    && ((*((unsigned char *)&self->_statusBarFlags + 1) & 4) == 0
     || [(STUIStatusBarVisualProvider *)self->_visualProvider canFixupDisplayItemAttributes]))
  {
    regions = self->_regions;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_131];
  }
}

- (void)resizeSubviewsWithOldSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBar;
  -[STUIStatusBar resizeSubviewsWithOldSize:](&v12, sel_resizeSubviewsWithOldSize_);
  [(STUIStatusBar *)self bounds];
  if (width != v7 || height != v6) {
    [(NSMutableDictionary *)self->_displayItemStates enumerateKeysAndObjectsUsingBlock:&__block_literal_global_138];
  }
  [(STUIStatusBar *)self _effectiveScaleTransform];
  foregroundView = self->_foregroundView;
  v11[0] = v11[3];
  v11[1] = v11[4];
  v11[2] = v11[5];
  [(UIView *)foregroundView setTransform:v11];
  [(STUIStatusBar *)self bounds];
  -[UIView setFrame:](self->_foregroundView, "setFrame:");
  [(STUIStatusBar *)self setNeedsUpdateConstraints];
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = self->_statusBarFlags;
  self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&statusBarFlags | 1);
  if ((*(_WORD *)&statusBarFlags & 0x800) != 0) {
    -[STUIStatusBarVisualProvider sizeUpdatedFromSize:](self->_visualProvider, "sizeUpdatedFromSize:", width, height);
  }
}

- (void)_performWithInheritedAnimation:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F39CF8];
  uint64_t v4 = (void (**)(void))a3;
  [v3 begin];
  uint64_t v5 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  char v6 = [MEMORY[0x1E4FB1EB0] _isInAnimationBlock];
  double v7 = (void *)MEMORY[0x1E4F39CF8];
  if (v6)
  {
    [MEMORY[0x1E4FB1EB0] _currentAnimationDuration];
    objc_msgSend(v7, "setAnimationDuration:");
    double v8 = (void *)MEMORY[0x1E4F39CF8];
    uint64_t v9 = MEMORY[0x1D9482920]([MEMORY[0x1E4FB1EB0] _currentAnimationCurve]);
    [v8 setAnimationTimingFunction:v9];
  }
  else
  {
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
  }
  v4[2](v4);

  [MEMORY[0x1E4F39CF8] commit];
  id v10 = (void *)MEMORY[0x1E4FB1EB0];
  [v10 setAnimationsEnabled:v5];
}

- (void)updateWithData:(id)a3
{
}

- (void)_updateWithData:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
  double v8 = _STUIStatusBar_Log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled]) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    id v10 = [(STUIStatusBarDataAggregator *)self->_dataAggregator delayedEntryKeys];
    *(_DWORD *)buf = 134218754;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    dispatch_time_t v22 = v9;
    __int16 v23 = 2112;
    long long v24 = v10;
    _os_log_impl(&dword_1D7E39000, v8, OS_LOG_TYPE_INFO, "Status bar %p update with data: %@, animated: %@, delayedKeys: %@", buf, 0x2Au);
  }
  [(STUIStatusBar *)self setUpdateCompletionHandler:v7];

  currentData = self->_currentData;
  if (currentData)
  {
    [(STMutableStatusBarData *)currentData applyUpdate:v6];
    [(STUIStatusBarDataAggregator *)self->_dataAggregator updateWithData:v6];
  }
  else
  {
    objc_super v12 = (STMutableStatusBarData *)[v6 mutableCopy];
    uint64_t v13 = self->_currentData;
    self->_currentData = v12;

    id v14 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__STUIStatusBar__updateWithData_completionHandler___block_invoke;
    v15[3] = &unk_1E6AA39F0;
    v15[4] = self;
    id v16 = v6;
    [v14 performWithoutAnimation:v15];
  }
}

- (void)setUpdateCompletionHandler:(id)a3
{
}

void __31__STUIStatusBar_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateWithAggregatedData:v3];
}

uint64_t __31__STUIStatusBar_initWithStyle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyleAttributes];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBar;
  [(STUIStatusBar *)&v3 updateConstraints];
  if ((*((unsigned char *)&self->_statusBarFlags + 2) & 0x20) == 0) {
    [(STUIStatusBar *)self _updateRegionItems];
  }
}

- (NSDictionary)regions
{
  return self->_regions;
}

void __47__STUIStatusBar__prepareVisualProviderIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStatusBar:v3];
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v4 identifier];
  [v5 setObject:v4 forKeyedSubscript:v6];
}

- (void)setHidden:(BOOL)a3 animationParameters:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = self->_statusBarFlags;
  if (((((*(_DWORD *)&statusBarFlags & 0x1000000) == 0) ^ v4) & 1) == 0)
  {
    if (v4) {
      int v8 = 0x1000000;
    }
    else {
      int v8 = 0;
    }
    self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&statusBarFlags & 0xFEFFFFFF | v8);
    uint64_t v9 = self;
    id v10 = v9;
    $480163010D8600EFAA81F3B9B74CD7E7 v11 = self->_statusBarFlags;
    if ((*(_DWORD *)&v11 & 0x80000) == 0) {
      goto LABEL_8;
    }
    if ((v9->_style & 0x3F) != 0)
    {
      if ((*(_DWORD *)&v11 & 0x800000) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      BOOL v12 = [(STUIStatusBar *)v9 mode] == 1;
    }
    else
    {
      BOOL v12 = 0;
    }

    visualProvider = v10->_visualProvider;
    if (visualProvider && !v12 && (*((unsigned char *)&self->_statusBarFlags + 2) & 8) != 0)
    {
      if (v4)
      {
        [(STUIStatusBarVisualProvider *)visualProvider updateLumaTracking:0];
      }
      else
      {
        objc_initWeak(&location, v10);
        id v14 = (void *)*MEMORY[0x1E4FB2608];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __47__STUIStatusBar_setHidden_animationParameters___block_invoke;
        v15[3] = &unk_1E6AA4C10;
        objc_copyWeak(&v16, &location);
        [v14 _performBlockAfterCATransactionCommits:v15];
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_9:
}

void __47__STUIStatusBar_setHidden_animationParameters___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_7;
  }
  id v6 = WeakRetained;
  uint64_t v2 = (id *)WeakRetained;
  uint64_t v3 = v2;
  int v4 = *((_DWORD *)v2 + 108);
  if ((v4 & 0x80000) == 0)
  {
LABEL_5:

LABEL_6:
    id WeakRetained = v6;
    goto LABEL_7;
  }
  if (((_BYTE)v2[57] & 0x3F) == 0)
  {

    id WeakRetained = v6;
LABEL_12:
    if ((*((unsigned char *)v3 + 435) & 1) == 0)
    {
      [v3[53] updateLumaTracking:1];
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  if ((v4 & 0x800000) == 0) {
    goto LABEL_5;
  }
  uint64_t v5 = [v2 mode];

  id WeakRetained = v6;
  if (v5 != 1) {
    goto LABEL_12;
  }
LABEL_7:
}

- (void)setRegionActionValidationBlock:(id)a3
{
}

- (STUIStatusBar)initWithStyle:(int64_t)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)STUIStatusBar;
  int v4 = -[STUIStatusBar initWithFrame:](&v30, sel_initWithFrame_, 0.0, 0.0, 600.0, 50.0);
  uint64_t v5 = +[STUIStatusBarSettingsDomain rootSettings];
  id v6 = (unsigned int *)(v4 + 432);
  if ([v5 alwaysAutomaticStyle]) {
    int v7 = 0x800000;
  }
  else {
    int v7 = 0;
  }
  *id v6 = *((_DWORD *)v4 + 108) & 0xFF7FFFFF | v7;

  if ((*v6 & 0x800000) != 0) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = a3;
  }
  *((void *)v4 + 57) = v8;
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setItems:v9];

  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setDisplayItemStates:v10];

  [v4 _setHostsLayoutEngine:1];
  $480163010D8600EFAA81F3B9B74CD7E7 v11 = +[STUIStatusBarSettingsDomain rootSettings];
  uint64_t v12 = [v11 forcedMode];

  if (v12 != -1) {
    *((void *)v4 + 59) = v12;
  }
  objc_initWeak(&location, v4);
  uint64_t v13 = [STUIStatusBarDataAggregator alloc];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __31__STUIStatusBar_initWithStyle___block_invoke;
  v27[3] = &unk_1E6AA4DA0;
  objc_copyWeak(&v28, &location);
  uint64_t v14 = [(STUIStatusBarDataAggregator *)v13 initWithUpdateBlock:v27];
  BOOL v15 = (void *)*((void *)v4 + 76);
  *((void *)v4 + 76) = v14;

  id v16 = +[STUIStatusBarDataBroadcaster sharedInstance];
  [v16 registerListener:v4];

  double v17 = [[STUIStatusBarActionGestureRecognizer alloc] initWithTarget:v4 action:sel_statusBarGesture_];
  id v18 = (void *)*((void *)v4 + 61);
  *((void *)v4 + 61) = v17;

  [*((id *)v4 + 61) setDelegate:v4];
  [*((id *)v4 + 61) setAllowedPressTypes:&unk_1F2F9CAE0];
  [*((id *)v4 + 61) setAllowedTouchTypes:&unk_1F2F9CAF8];
  [v4 addGestureRecognizer:*((void *)v4 + 61)];
  uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB13D8]) initWithView:v4 delegate:v4];
  id v20 = (void *)*((void *)v4 + 73);
  *((void *)v4 + 73) = v19;

  __int16 v21 = self;
  v31[0] = v21;
  dispatch_time_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __31__STUIStatusBar_initWithStyle___block_invoke_65;
  v25[3] = &unk_1E6AA4DC8;
  objc_copyWeak(&v26, &location);
  id v23 = (id)[v4 registerForTraitChanges:v22 withHandler:v25];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
  return (STUIStatusBar *)v4;
}

- (void)setItems:(id)a3
{
}

- (void)setDisplayItemStates:(id)a3
{
}

- (void)reinitializeStatusBar
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  p_foregroundView = &self->_foregroundView;
  [(UIView *)self->_foregroundView removeFromSuperview];
  int v4 = [(STUIStatusBar *)self foregroundView];
  [v4 removeInteraction:self->_pointerInteraction];

  pointerInteraction = self->_pointerInteraction;
  self->_pointerInteraction = 0;

  id v6 = *p_foregroundView;
  *p_foregroundView = 0;

  visualProvider = self->_visualProvider;
  self->_visualProvider = 0;

  int64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [(STUIStatusBar *)self setItems:v8];

  [(STUIStatusBar *)self resetVisualProvider];
  objc_initWeak(&location, self);
  uint64_t v9 = [STUIStatusBarDataAggregator alloc];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __38__STUIStatusBar_reinitializeStatusBar__block_invoke;
  v60[3] = &unk_1E6AA4DA0;
  objc_copyWeak(&v61, &location);
  id v10 = [(STUIStatusBarDataAggregator *)v9 initWithUpdateBlock:v60];
  dataAggregator = self->_dataAggregator;
  self->_dataAggregator = v10;

  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  if (self->_enabledPartIdentifiers)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v13 = [(NSDictionary *)self->_regions allKeys];
    uint64_t v14 = [v12 setWithArray:v13];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obuint64_t j = self->_enabledPartIdentifiers;
    uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v53 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          uint64_t v19 = [(STUIStatusBar *)self _regionsForPartWithIdentifier:v18 includeInternalItems:0];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v65 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v49 != v21) {
                  objc_enumerationMutation(v19);
                }
                id v23 = [*(id *)(*((void *)&v48 + 1) + 8 * j) identifier];
                [v14 removeObject:v23];
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v65 count:16];
            }
            while (v20);
          }
        }
        uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v66 count:16];
      }
      while (v15);
    }

    regions = self->_regions;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __38__STUIStatusBar_reinitializeStatusBar__block_invoke_2;
    v45[3] = &unk_1E6AA4E60;
    id v25 = v14;
    id v46 = v25;
    long long v47 = &v56;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v45];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v26 = self->_disabledPartIdentifiers;
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v41 objects:v64 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * k);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v31 = [(STUIStatusBar *)self _actionablesForPartWithIdentifier:v30 includeInternalItems:1 onlyVisible:0];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v63 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v38;
          do
          {
            for (uint64_t m = 0; m != v32; ++m)
            {
              if (*(void *)v38 != v33) {
                objc_enumerationMutation(v31);
              }
              [*(id *)(*((void *)&v37 + 1) + 8 * m) disableWithToken:2];
              *((unsigned char *)v57 + 24) = 1;
            }
            uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v63 count:16];
          }
          while (v32);
        }
      }
      uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v41 objects:v64 count:16];
    }
    while (v27);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __38__STUIStatusBar_reinitializeStatusBar__block_invoke_3;
  v36[3] = &unk_1E6AA3860;
  v36[4] = self;
  v36[5] = &v56;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v36];
  _Block_object_dispose(&v56, 8);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
}

- (void)_prepareVisualProviderIfNeeded
{
  if (self->_targetScreen
    || ([(STUIStatusBar *)self window], uint64_t v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    if (!self->_visualProvider)
    {
      visualProviderClass = self->_visualProviderClass;
      if (!visualProviderClass)
      {
        uint64_t v5 = [(STUIStatusBar *)self _effectiveTargetScreen];
        id v6 = [(STUIStatusBar *)self visualProviderInfo];
        STUIStatusBarGetVisualProviderClassForScreen(v5, v6);
        int v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
        Class v8 = self->_visualProviderClass;
        self->_visualProviderClass = v7;

        if ([(objc_class *)self->_visualProviderClass scalesWithScreenNativeScale])int v9 = 2; {
        else
        }
          int v9 = 0;
        self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFFD | v9);
        if (objc_opt_respondsToSelector()) {
          int v10 = 4;
        }
        else {
          int v10 = 0;
        }
        self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFFB | v10);
        if ([(objc_class *)self->_visualProviderClass requiresIterativeOverflowLayout])int v11 = 8; {
        else
        }
          int v11 = 0;
        self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFF7 | v11);

        visualProviderClass = self->_visualProviderClass;
      }
      uint64_t v12 = (STUIStatusBarVisualProvider *)objc_alloc_init(visualProviderClass);
      visualProvider = self->_visualProvider;
      self->_visualProvider = v12;

      [(STUIStatusBarVisualProvider *)self->_visualProvider setStatusBar:self];
      if (objc_opt_respondsToSelector()) {
        int v14 = 16;
      }
      else {
        int v14 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFEF | v14);
      if (objc_opt_respondsToSelector()) {
        int v15 = 32;
      }
      else {
        int v15 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFDF | v15);
      if (objc_opt_respondsToSelector()) {
        int v16 = 64;
      }
      else {
        int v16 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFFBF | v16);
      if (objc_opt_respondsToSelector()) {
        int v17 = 128;
      }
      else {
        int v17 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFF7F | v17);
      if (objc_opt_respondsToSelector()) {
        int v18 = 256;
      }
      else {
        int v18 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFEFF | v18);
      if (objc_opt_respondsToSelector()) {
        int v19 = 512;
      }
      else {
        int v19 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFDFF | v19);
      if (objc_opt_respondsToSelector()) {
        int v20 = 1024;
      }
      else {
        int v20 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFFBFF | v20);
      if (objc_opt_respondsToSelector()) {
        int v21 = 2048;
      }
      else {
        int v21 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFF7FF | v21);
      if (objc_opt_respondsToSelector()) {
        int v22 = 4096;
      }
      else {
        int v22 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFEFFF | v22);
      if (objc_opt_respondsToSelector()) {
        int v23 = 0x2000;
      }
      else {
        int v23 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFDFFF | v23);
      if (objc_opt_respondsToSelector()) {
        int v24 = 0x4000;
      }
      else {
        int v24 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFFBFFF | v24);
      if (objc_opt_respondsToSelector()) {
        int v25 = 0x8000;
      }
      else {
        int v25 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFF7FFF | v25);
      if (objc_opt_respondsToSelector()) {
        int v26 = 0x10000;
      }
      else {
        int v26 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFEFFFF | v26);
      if (objc_opt_respondsToSelector()) {
        int v27 = 0x20000;
      }
      else {
        int v27 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFDFFFF | v27);
      if (objc_opt_respondsToSelector()) {
        int v28 = 0x40000;
      }
      else {
        int v28 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFFBFFFF | v28);
      if (objc_opt_respondsToSelector()) {
        int v29 = 0x80000;
      }
      else {
        int v29 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFF7FFFF | v29);
      if (objc_opt_respondsToSelector()) {
        int v30 = 0x100000;
      }
      else {
        int v30 = 0;
      }
      self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&self->_statusBarFlags & 0xFFEFFFFF | v30);
      [(STUIStatusBar *)self _updateActionGestureRecognizerAllowableTouchTypesIfNeeded];
    }
    if (!self->_foregroundView)
    {
      long long v31 = [STUIStatusBarForegroundView alloc];
      [(STUIStatusBar *)self bounds];
      uint64_t v32 = -[STUIStatusBarForegroundView initWithFrame:](v31, "initWithFrame:");
      [(STUIStatusBar *)self setForegroundView:v32];

      uint64_t v33 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
      pointerInteraction = self->_pointerInteraction;
      self->_pointerInteraction = v33;

      v35 = [(STUIStatusBar *)self foregroundView];
      [v35 addInteraction:self->_pointerInteraction];

      [(STUIStatusBar *)self addSubview:self->_foregroundView];
    }
    if (![(NSDictionary *)self->_regions count])
    {
      v36 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v37 = self->_visualProvider;
      long long v38 = [(STUIStatusBar *)self containerView];
      long long v39 = [(STUIStatusBarVisualProvider *)v37 setupInContainerView:v38];

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __47__STUIStatusBar__prepareVisualProviderIfNeeded__block_invoke;
      v48[3] = &unk_1E6AA4DF0;
      v48[4] = self;
      id v40 = v36;
      id v49 = v40;
      [v39 enumerateObjectsUsingBlock:v48];
      objc_storeStrong((id *)&self->_regions, v36);
      regions = self->_regions;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __47__STUIStatusBar__prepareVisualProviderIfNeeded__block_invoke_2;
      v47[3] = &unk_1E6AA4E18;
      v47[4] = self;
      [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v47];
      +[STUIStatusBarDisplayItemState setupRelationsBetweenDisplayItemStates:self->_displayItemStates visualProvider:self->_visualProvider];
      if (self->_mode)
      {
        if ((*(unsigned char *)&self->_statusBarFlags & 0x10) != 0) {
          [(STUIStatusBarVisualProvider *)self->_visualProvider modeUpdatedFromMode:0];
        }
      }
      if ((*((unsigned char *)&self->_statusBarFlags + 2) & 8) == 0) {
        goto LABEL_81;
      }
      long long v42 = self->_visualProvider;
      long long v43 = self;
      long long v44 = v43;
      $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = self->_statusBarFlags;
      if ((*(_DWORD *)&statusBarFlags & 0x80000) != 0)
      {
        if ((v43->_style & 0x3F) == 0)
        {
          BOOL v46 = 1;
          goto LABEL_80;
        }
        if ((*(_DWORD *)&statusBarFlags & 0x800000) != 0)
        {
          BOOL v46 = [(STUIStatusBar *)v43 mode] != 1;
          goto LABEL_80;
        }
      }
      BOOL v46 = 0;
LABEL_80:

      [(STUIStatusBarVisualProvider *)v42 updateLumaTracking:v46];
LABEL_81:
      [(STUIStatusBar *)self _updateStyleAttributes];
    }
  }
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

void __26__STUIStatusBar_setStyle___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateStyleAttributes];
  if (*(unsigned char *)(a1 + 40) && [*(id *)(*(void *)(a1 + 32) + 520) count])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [v2 styleAttributes];
    [v2 _updateDisplayedItemsWithData:0 styleAttributes:v3 extraAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)setForegroundView:(id)a3
{
}

- (UIView)containerView
{
  return self->_foregroundView;
}

- (void)_updateActionGestureRecognizerAllowableTouchTypesIfNeeded
{
  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    if ([(STUIStatusBarVisualProvider *)visualProvider supportsIndirectPointerTouchActions])int v4 = &unk_1F2F9CB10; {
    else
    }
      int v4 = &unk_1F2F9CAF8;
    actionGestureRecognizer = self->_actionGestureRecognizer;
    [(UIGestureRecognizer *)actionGestureRecognizer setAllowedTouchTypes:v4];
  }
}

- (NSDictionary)visualProviderInfo
{
  return self->_visualProviderInfo;
}

- (void)resetVisualProvider
{
  [(NSDictionary *)self->_regions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_112];
  regions = self->_regions;
  self->_regions = (NSDictionary *)MEMORY[0x1E4F1CC08];

  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  displayItemStates = self->_displayItemStates;
  self->_displayItemStates = v4;
  MEMORY[0x1F41817F8](v4, displayItemStates);
}

uint64_t __41__STUIStatusBar_Wrapper_forceUpdateData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithData:*(void *)(a1 + 40) force:0];
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  int v4 = [(STUIStatusBar *)self traitCollection];
  uint64_t v5 = [(STUIStatusBar *)self effectiveUserInterfaceLayoutDirection];
  id v6 = self;
  int v7 = [v4 traitCollectionByReplacingNSIntegerValue:v5 forTrait:v6];

  return v7;
}

uint64_t __51__STUIStatusBar__updateWithData_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 608) updateWithData:*(void *)(a1 + 40)];
}

- (void)setTargetScreen:(id)a3
{
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  [(STUIStatusBar *)self _effectiveScaleTransform];
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
      -[STUIStatusBarVisualProvider avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:](self->_visualProvider, "avoidanceFrameUpdatedFromFrame:withAnimationSettings:options:", v11, a5, v17, v18, v19, v20);
    }
  }
}

void __38__STUIStatusBar_reinitializeStatusBar__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateWithAggregatedData:v3];
}

void __73__STUIStatusBar__setAutomaticStyle_additionalStylesForRegionIdentifiers___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _updateStyleAttributes];
  }
  if (*(unsigned char *)(a1 + 41))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [v2 styleAttributes];
    [v2 _updateDisplayedItemsWithData:0 styleAttributes:v3 extraAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_updateWithAggregatedData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[v4 mutableCopy];
  id v6 = +[STUIStatusBarDataBroadcaster sharedInstance];
  int v7 = [v6 currentData];
  [v5 applyUpdate:v7];

  if (*((unsigned char *)&self->_statusBarFlags + 1))
  {
    Class v8 = [(STUIStatusBarVisualProvider *)self->_visualProvider willUpdateWithData:v5];
  }
  else
  {
    Class v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (self->_currentAggregatedData) {
    [(STMutableStatusBarData *)self->_currentAggregatedData applyUpdate:v5];
  }
  else {
    objc_storeStrong((id *)&self->_currentAggregatedData, v5);
  }
  int v9 = _STUIStatusBar_Log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    id v11 = @"NO";
    *(_DWORD *)int v16 = 134218498;
    *(void *)&v16[4] = self;
    *(_WORD *)&v16[12] = 2112;
    if (v10) {
      id v11 = @"YES";
    }
    *(void *)&v16[14] = v4;
    __int16 v17 = 2112;
    double v18 = v11;
    _os_log_impl(&dword_1D7E39000, v9, OS_LOG_TYPE_INFO, "Status bar %p now applying update: %@, animated: %@", v16, 0x20u);
  }

  [(STUIStatusBar *)self _updateDisplayedItemsWithData:v5 styleAttributes:0 extraAnimations:v8];
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = self->_statusBarFlags;
  if ((*(_WORD *)&statusBarFlags & 0x200) != 0)
  {
    [(STUIStatusBarVisualProvider *)self->_visualProvider dataUpdated:v5];
    $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = self->_statusBarFlags;
  }
  self->_$480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = ($480163010D8600EFAA81F3B9B74CD7E7)(*(_DWORD *)&statusBarFlags | 1);
  [(UIPointerInteraction *)self->_pointerInteraction invalidate];
  CGFloat v13 = [(STUIStatusBar *)self updateCompletionHandler];

  if (v13)
  {
    CGFloat v14 = (void (**)(void))_Block_copy(self->_updateCompletionHandler);
    id updateCompletionHandler = self->_updateCompletionHandler;
    self->_id updateCompletionHandler = 0;

    v14[2](v14);
  }
}

- (void)_updateStyleAttributes
{
  uint64_t v2 = self;
  id v3 = v2;
  $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = v2->_statusBarFlags;
  if ((*(_DWORD *)&statusBarFlags & 0x80000) == 0) {
    goto LABEL_4;
  }
  if ((v2->_style & 0x3F) != 0)
  {
    if ((*(_DWORD *)&statusBarFlags & 0x800000) == 0)
    {
LABEL_4:

LABEL_5:
      uint64_t v5 = &OBJC_IVAR___STUIStatusBar__style;
      goto LABEL_9;
    }
    uint64_t v6 = [(STUIStatusBar *)v2 mode];

    if (v6 == 1) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  uint64_t v5 = &OBJC_IVAR___STUIStatusBar__automaticStyle;
LABEL_9:
  uint64_t v7 = *(uint64_t *)((char *)&v3->super.super.super.isa + *v5);
  if (v7 == 2) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2 * (v7 == 1);
  }
  [(STUIStatusBar *)v3 setOverrideUserInterfaceStyle:v8];
  id v9 = [(STUIStatusBar *)v3 styleAttributesForStyle:v7];
  [(STUIStatusBar *)v3 setStyleAttributes:v9];
}

- (void)setStyleAttributes:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_styleAttributes] & 1) == 0)
  {
    id v4 = (STUIStatusBarStyleAttributes *)[v6 copy];
    styleAttributes = self->_styleAttributes;
    self->_styleAttributes = v4;

    [(STUIStatusBar *)self _updateDisplayedItemsWithData:0 styleAttributes:v6 extraAnimations:MEMORY[0x1E4F1CBF0]];
  }
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

- (id)updateCompletionHandler
{
  return self->_updateCompletionHandler;
}

- (void)updateWithAnimations:(id)a3
{
}

- (UIGestureRecognizer)actionGestureRecognizer
{
  return self->_actionGestureRecognizer;
}

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(STUIStatusBar *)self traitCollection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke;
  v15[3] = &unk_1E6AA4F48;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performAsCurrentTraitCollection:v15];
}

void __36__STUIStatusBar_resetVisualProvider__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (void *)MEMORY[0x1E4F1CAA0];
  id v4 = a3;
  id v5 = [v3 orderedSet];
  [v4 setDisplayItems:v5];
}

- (id)displayItemIdentifiersInRegionsWithIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
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
        id v10 = [(STUIStatusBarVisualProvider *)self->_visualProvider orderedDisplayItemPlacementsInRegionWithIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * i)];
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
              CGFloat v15 = [*(id *)(*((void *)&v18 + 1) + 8 * j) identifier];
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
              [(STUIStatusBar *)self displayItemWithIdentifier:v10],
              uint64_t v11 = objc_claimAutoreleasedReturnValue(),
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

- (int64_t)styleForPartWithIdentifier:(id)a3
{
  id v3 = [(STUIStatusBar *)self _regionsForPartWithIdentifier:a3 includeInternalItems:0];
  id v4 = [v3 anyObject];
  int64_t v5 = [v4 style];

  return v5;
}

- (id)_regionsForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
  if (a4) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  }
  else {
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  if (*((unsigned char *)&self->_statusBarFlags + 2))
  {
    id v9 = [(STUIStatusBarVisualProvider *)self->_visualProvider regionIdentifiersForPartWithIdentifier:v6];
    uint64_t v10 = [v8 setByAddingObjectsFromSet:v9];

    uint64_t v8 = (void *)v10;
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
        long long v16 = -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
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
  uint64_t v7 = -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", a4, 0, 0, 0);
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

- (id)_actionablesForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4 onlyVisible:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
  if (v6)
  {
    uint64_t v11 = +[STUIStatusBarIdentifier displayIdentifierFromStringRepresentation:v8];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];

      uint64_t v10 = (void *)v12;
    }
  }
  if ((*((unsigned char *)&self->_statusBarFlags + 1) & 0x80) != 0)
  {
    long long v13 = [(STUIStatusBarVisualProvider *)self->_visualProvider displayItemIdentifiersForPartWithIdentifier:v8];
    uint64_t v14 = [v10 setByAddingObjectsFromSet:v13];

    uint64_t v10 = (void *)v14;
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
        long long v20 = -[STUIStatusBar displayItemWithIdentifier:](self, "displayItemWithIdentifier:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24);
        long long v21 = v20;
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
    long long v22 = [(STUIStatusBar *)self _regionsForPartWithIdentifier:v8 includeInternalItems:v6];
    [v9 unionSet:v22];
  }
  return v9;
}

- (id)displayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v4];
  BOOL v6 = [(STUIStatusBar *)self _itemWithIdentifier:v5 createIfNeeded:0];

  if (v6)
  {
    uint64_t v7 = [v6 displayItemForIdentifier:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)stateForDisplayItemWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_displayItemStates objectForKeyedSubscript:a3];
}

- (unsigned)animationContextId
{
  uint64_t v2 = [(STUIStatusBar *)self window];
  unsigned int v3 = [v2 _contextId];

  return v3;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v21 = (NSArray *)a3;
  if (self->_enabledPartIdentifiers != v21)
  {
    objc_storeStrong((id *)&self->_enabledPartIdentifiers, a3);
    [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
    if (v21)
    {
      long long v20 = (void *)v5;
      BOOL v6 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v7 = [(NSDictionary *)self->_regions allKeys];
      id v8 = [v6 setWithArray:v7];

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
            long long v13 = [(STUIStatusBar *)self _regionsForPartWithIdentifier:v12 includeInternalItems:0];
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
                  uint64_t v17 = [*(id *)(*((void *)&v27 + 1) + 8 * j) identifier];
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
      id v8 = (void *)v5;
    }
    regions = self->_regions;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __43__STUIStatusBar_setEnabledPartIdentifiers___block_invoke;
    v24[3] = &unk_1E6AA4E60;
    id v19 = v8;
    id v25 = v19;
    long long v26 = &v35;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v24];
    if (*((unsigned char *)v36 + 24))
    {
      if ((*((unsigned char *)&self->_statusBarFlags + 2) & 2) != 0) {
        [(STUIStatusBarVisualProvider *)self->_visualProvider statusBarEnabledPartsUpdated];
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __43__STUIStatusBar_setEnabledPartIdentifiers___block_invoke_2;
      v23[3] = &unk_1E6AA37A0;
      v23[4] = self;
      [(STUIStatusBar *)self _performWithInheritedAnimation:v23];
    }

    _Block_object_dispose(&v35, 8);
  }
}

uint64_t __53__STUIStatusBar__delayUpdatesWithKeys_fromAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endDelayingUpdates:*(void *)(a1 + 40)];
}

uint64_t __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)_setAutomaticStyle:(int64_t)a3 additionalStylesForRegionIdentifiers:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a4;
  id v6 = a4;
  int64_t automaticStyle = self->_automaticStyle;
  if (automaticStyle != a3) {
    self->_int64_t automaticStyle = a3;
  }
  int64_t v39 = a3;
  id v40 = self;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  p_automaticStyleOutliers = &self->_automaticStyleOutliers;
  id v8 = self->_automaticStyleOutliers;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v15 = -[NSDictionary objectForKeyedSubscript:](*p_automaticStyleOutliers, "objectForKeyedSubscript:", v14, obj);
        uint64_t v16 = [v15 integerValue];

        uint64_t v17 = [v6 objectForKeyedSubscript:v14];
        uint64_t v18 = v17;
        if (!v17 || [v17 integerValue] != v16)
        {
          id v19 = [(STUIStatusBar *)v40 regionWithIdentifier:v14];
          [v19 setAutomaticStyle:4];

          char v11 = 1;
        }
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v10);
  }
  else
  {
    char v11 = 0;
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        long long v26 = -[NSDictionary objectForKeyedSubscript:](*p_automaticStyleOutliers, "objectForKeyedSubscript:", v25, obj);
        long long v27 = [v20 objectForKeyedSubscript:v25];
        uint64_t v28 = [v27 integerValue];

        if (!v26 || v28 != [v26 integerValue])
        {
          long long v29 = [(STUIStatusBar *)v40 regionWithIdentifier:v25];
          [v29 setAutomaticStyle:v28];

          char v11 = 1;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v22);
  }

  objc_storeStrong((id *)p_automaticStyleOutliers, obj);
  if (automaticStyle != v39 || (v11 & 1) != 0)
  {
    long long v30 = v40;
    long long v31 = v30;
    $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = v30->_statusBarFlags;
    if ((*(_DWORD *)&statusBarFlags & 0x80000) == 0)
    {
LABEL_30:

      goto LABEL_38;
    }
    if ((v30->_style & 0x3F) != 0)
    {
      if ((*(_DWORD *)&statusBarFlags & 0x800000) == 0) {
        goto LABEL_30;
      }
      uint64_t v33 = [(STUIStatusBar *)v30 mode];

      if (v33 == 1) {
        goto LABEL_38;
      }
    }
    else
    {
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__STUIStatusBar__setAutomaticStyle_additionalStylesForRegionIdentifiers___block_invoke;
    aBlock[3] = &unk_1E6AA5068;
    BOOL v42 = automaticStyle != v39;
    aBlock[4] = v31;
    char v43 = v11 & 1;
    long long v34 = _Block_copy(aBlock);
    if ([(STUIStatusBar *)v31 areAnimationsEnabled]
      && ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock] & 1) == 0)
    {
      uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4FB1C90]) initWithDefaultParameters];
      [v35 duration];
      [v35 setDuration:v36 * 0.6];
      [MEMORY[0x1E4FB1C70] animateWithParameters:v35 fromCurrentState:1 animations:v34 completion:0];
    }
    else
    {
      -[STUIStatusBar _performWithInheritedAnimation:](v31, "_performWithInheritedAnimation:", v34, obj);
    }
  }
LABEL_38:
}

- (id)regionWithIdentifier:(id)a3
{
  id v4 = a3;
  [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
  uint64_t v5 = [(NSDictionary *)self->_regions objectForKeyedSubscript:v4];

  return v5;
}

void __31__STUIStatusBar_initWithStyle___block_invoke_65(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__STUIStatusBar_initWithStyle___block_invoke_2;
  v3[3] = &unk_1E6AA37A0;
  id v4 = WeakRetained;
  id v2 = WeakRetained;
  [v2 _performWithInheritedAnimation:v3];
}

- (void)_delayUpdatesWithKeys:(id)a3 fromAnimation:(id)a4
{
  id v6 = self->_dataAggregator;
  id v7 = a4;
  id v8 = [(STUIStatusBarDataAggregator *)v6 beginDelayingUpdatesForEntryKeys:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__STUIStatusBar__delayUpdatesWithKeys_fromAnimation___block_invoke;
  v11[3] = &unk_1E6AA39F0;
  uint64_t v12 = v6;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = v6;
  [v7 addTotalCompletionHandler:v11];
}

- (void)setStyle:(int64_t)a3 forPartWithIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(STUIStatusBar *)self _regionsForPartWithIdentifier:a4 includeInternalItems:0];
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
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
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
      v13[2] = __48__STUIStatusBar_setStyle_forPartWithIdentifier___block_invoke;
      v13[3] = &unk_1E6AA37A0;
      v13[4] = self;
      [(STUIStatusBar *)self _performWithInheritedAnimation:v13];
    }
  }
  else
  {
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
        -[STUIStatusBarVisualProvider orientationUpdatedFromOrientation:](visualProvider, "orientationUpdatedFromOrientation:");
      }
    }
  }
  *(_DWORD *)&self->_statusBarFlags |= 1u;
}

uint64_t __38__STUIStatusBar_reinitializeStatusBar__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareVisualProviderIfNeeded];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && (*(unsigned char *)(v2 + 434) & 2) != 0)
  {
    [*(id *)(v2 + 424) statusBarEnabledPartsUpdated];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  unsigned int v3 = [(id)v2 currentAggregatedData];
  [(id)v2 updateWithData:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

uint64_t __94__STUIStatusBar_Wrapper__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained styleDelegate];
  unsigned int v3 = (void *)v2;
  uint64_t v4 = 1;
  if (WeakRetained && v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v4 = [v3 statusBarShouldDisableRegionActions:WeakRetained] ^ 1;
  }

  return v4;
}

void __109__STUIStatusBar_Wrapper__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 592), "setStyle:forPartWithIdentifier:", objc_msgSend(a3, "integerValue"), v5);
}

uint64_t __64__STUIStatusBar_Wrapper_setForegroundAlpha_animationParameters___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 592) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __37__STUIStatusBar_Wrapper_forceUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithData:0 force:1];
}

uint64_t ___STUIStatusBar_Log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SystemStatusUI", "STUIStatusBarLog");
  uint64_t v1 = _STUIStatusBar_Log___StatusBar_LOG;
  _STUIStatusBar_Log___StatusBar_LOG = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ___STUIStatusBar_BackgroundActivity_Log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SystemStatusUI", "BackgroundActivityLog");
  uint64_t v1 = _STUIStatusBar_BackgroundActivity_Log___StatusBarBackground_LOG;
  _STUIStatusBar_BackgroundActivity_Log___StatusBarBackground_LOG = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

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
      uint64_t v4 = @"_UIStatusBarResolvedStyleAutomaticWithDarkBias";
      if (a3 != 128) {
        uint64_t v4 = 0;
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
  uint64_t v5 = _MergedGlobals_7_0;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&_MergedGlobals_7_0, &__block_literal_global_13);
  }
  uint64_t v8 = (void *)qword_1EC05F030;
  sensorActivityScreenIdentifier(v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v8 setObject:v7 forKey:v9];
}

uint64_t __59__STUIStatusBar_registerSensorActivityIndicator_forScreen___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  uint64_t v1 = qword_1EC05F030;
  qword_1EC05F030 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sensorActivityIndicatorForScreen:(id)a3
{
  unsigned int v3 = (void *)qword_1EC05F030;
  uint64_t v4 = sensorActivityScreenIdentifier(a3);
  uint64_t v5 = [v3 objectForKey:v4];

  return v5;
}

- (BOOL)_forceLayoutEngineSolutionInRationalEdges
{
  return 1;
}

- (void)dealloc
{
  unsigned int v3 = +[STUIStatusBarDataBroadcaster sharedInstance];
  [v3 unregisterListener:self];

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBar;
  [(STUIStatusBar *)&v4 dealloc];
}

- (void)updateForDataChange:(id)a3
{
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBar *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBar *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)_expandedDescription
{
  uint64_t v2 = [(STUIStatusBar *)self _expandedDescriptionBuilderWithMultilinePrefix:0];
  unsigned int v3 = [v2 build];

  return v3;
}

- (void)_setVisualProviderClassName:(id)a3
{
  if (a3) {
    a3 = NSClassFromString((NSString *)a3);
  }
  [(STUIStatusBar *)self _setVisualProviderClass:a3];
}

- (NSString)_visualProviderClassName
{
  uint64_t v2 = [(STUIStatusBar *)self _visualProviderClass];
  if (v2)
  {
    NSStringFromClass(v2);
    uint64_t v2 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

void __38__STUIStatusBar_reinitializeStatusBar__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v7 = v4;
  id v6 = [v4 identifier];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5)
  {
    [v7 disableWithToken:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)setMode:(int64_t)a3
{
  uint64_t v5 = +[STUIStatusBarSettingsDomain rootSettings];
  uint64_t v6 = [v5 forcedMode];

  if (v6 == -1)
  {
    int64_t mode = self->_mode;
    if (mode != a3)
    {
      self->_int64_t mode = a3;
      if (self->_visualProvider)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __25__STUIStatusBar_setMode___block_invoke;
        v8[3] = &unk_1E6AA37A0;
        v8[4] = self;
        [(STUIStatusBar *)self _performWithInheritedAnimation:v8];
        if ((*(unsigned char *)&self->_statusBarFlags & 0x10) != 0) {
          [(STUIStatusBarVisualProvider *)self->_visualProvider modeUpdatedFromMode:mode];
        }
      }
    }
    *(_DWORD *)&self->_statusBarFlags |= 1u;
  }
}

uint64_t __25__STUIStatusBar_setMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyleAttributes];
}

- (void)setAvoidanceFrame:(CGRect)a3
{
}

void __26__STUIStatusBar_setStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_7;
  }
  id v6 = WeakRetained;
  uint64_t v2 = (id *)WeakRetained;
  unsigned int v3 = v2;
  int v4 = *((_DWORD *)v2 + 108);
  if ((v4 & 0x80000) == 0)
  {
LABEL_5:

LABEL_6:
    id WeakRetained = v6;
    goto LABEL_7;
  }
  if (((_BYTE)v2[57] & 0x3F) == 0)
  {

    id WeakRetained = v6;
LABEL_12:
    if ((*((unsigned char *)v3 + 435) & 1) == 0)
    {
      [v3[53] updateLumaTracking:1];
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  if ((v4 & 0x800000) == 0) {
    goto LABEL_5;
  }
  uint64_t v5 = [v2 mode];

  id WeakRetained = v6;
  if (v5 != 1) {
    goto LABEL_12;
  }
LABEL_7:
}

uint64_t __36__STUIStatusBar_setForegroundColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyleAttributes];
}

uint64_t __79__STUIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)updateForcingIterativeOverflow
{
  *(_DWORD *)&self->_statusBarFlags |= 0x400000u;
  [(STUIStatusBar *)self updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  *(_DWORD *)&self->_statusBarFlags &= ~0x400000u;
}

void __44__STUIStatusBar__fixupDisplayItemAttributes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 isEnabled])
  {
    unsigned int v3 = [v4 displayItems];
    [v3 enumerateObjectsUsingBlock:&__block_literal_global_134];
  }
}

void __44__STUIStatusBar__fixupDisplayItemAttributes__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAlpha:1.0];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v4];
}

- (BOOL)_showSensorActivityIndicatorWithoutPortalView
{
  if ((*((unsigned char *)&self->_statusBarFlags + 2) & 0x10) != 0) {
    return [(STUIStatusBarVisualProvider *)self->_visualProvider showSensorActivityIndicatorWithoutPortalView];
  }
  else {
    return 0;
  }
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
    uint64_t v17 = [(STUIStatusBar *)self effectiveUserInterfaceLayoutDirection];
    if (v17 == 1) {
      double v18 = v16;
    }
    else {
      double v18 = v12;
    }
    if (v17 == 1) {
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
  [(STUIStatusBar *)self _frameForActionable:a4];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)_cursorLocation:(CGPoint)a3 isInsideHoverableActionable:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(STUIStatusBar *)self _extendedHoverFrameForActionable:v7];
  CGFloat v8 = v16.origin.x;
  CGFloat v9 = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  if (CGRectIsNull(v16))
  {
    BOOL v12 = -[STUIStatusBar _cursorLocation:isInsideActionable:](self, "_cursorLocation:isInsideActionable:", v7, x, y);
  }
  else
  {
    v17.origin.double x = v8;
    v17.origin.double y = v9;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    v15.double x = x;
    v15.double y = y;
    BOOL v12 = CGRectContainsPoint(v17, v15);
  }
  BOOL v13 = v12;

  return v13;
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
    id v40 = __Block_byref_object_copy__6;
    uint64_t v41 = __Block_byref_object_dispose__6;
    id v42 = 0;
    uint64_t v31 = 0;
    long long v32 = &v31;
    uint64_t v33 = 0x3032000000;
    long long v34 = __Block_byref_object_copy__6;
    uint64_t v35 = __Block_byref_object_dispose__6;
    id v36 = 0;
    regions = self->_regions;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __67__STUIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
    long long v26 = &unk_1E6AA5018;
    long long v27 = self;
    id v28 = v9;
    long long v29 = &v37;
    long long v30 = &v31;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:&v23];
    if (v38[5])
    {
      -[STUIStatusBar _extendedHoverFrameForActionable:](self, "_extendedHoverFrameForActionable:", v23, v24, v25, v26, v27);
      double x = v44.origin.x;
      double y = v44.origin.y;
      double width = v44.size.width;
      double height = v44.size.height;
      if (CGRectIsNull(v44))
      {
        [(STUIStatusBar *)self _pressFrameForActionable:v38[5]];
        double x = v17;
        double y = v18;
        double width = v19;
        double height = v20;
      }
      double v21 = objc_msgSend(MEMORY[0x1E4FB1AD8], "regionWithRect:identifier:", v32[5], x, y, width, height);
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

void __67__STUIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([v7 isEnabled])
  {
    id v8 = [v7 displayItems];
    if ([v8 count])
    {
      id v9 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) location];
      id v10 = objc_msgSend(v9, "_cursorLocation:isInsideActionable:", v7);

      if (v10)
      {
        CGFloat v11 = [v7 displayItems];
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        uint64_t v24 = __67__STUIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke_2;
        uint64_t v25 = &unk_1E6AA4FF0;
        BOOL v12 = *(void **)(a1 + 40);
        uint64_t v26 = *(void *)(a1 + 32);
        id v27 = v12;
        long long v28 = *(_OWORD *)(a1 + 48);
        [v11 enumerateObjectsUsingBlock:&v22];

        if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          BOOL v13 = objc_msgSend(v7, "action", v22, v23, v24, v25, v26);
          int v14 = [v13 isEnabled];
          if ((v14 & 1) == 0)
          {
            id v10 = [v7 hoverAction];
            if (![v10 isEnabled]) {
              goto LABEL_14;
            }
          }
          CGPoint v15 = *(void **)(a1 + 32);
          [*(id *)(a1 + 40) location];
          if (objc_msgSend(v15, "_cursorLocation:isInsideHoverableActionable:", v7))
          {
            CGRect v16 = [v7 contentView];
            [v16 alpha];
            double v18 = v17;

            if ((v14 & 1) == 0) {
            if (v18 > 0.0)
            }
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
              uint64_t v19 = [v7 identifier];
              uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
              double v21 = *(void **)(v20 + 40);
              *(void *)(v20 + 40) = v19;

              *a4 = 1;
            }
            goto LABEL_16;
          }
          if (!v14) {
LABEL_14:
          }
        }
LABEL_16:
      }
    }
    else
    {
    }
  }
}

void __67__STUIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v8 = [v15 action];
  char v9 = [v8 isEnabled];
  if ((v9 & 1) == 0)
  {
    id v4 = [v15 hoverAction];
    if (([v4 isEnabled] & 1) == 0)
    {

      goto LABEL_9;
    }
  }
  id v10 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) location];
  int v11 = objc_msgSend(v10, "_cursorLocation:isInsideHoverableActionable:", v15);
  if ((v9 & 1) == 0)
  {

    if ((v11 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  if (v11)
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v12 = [v15 identifier];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
LABEL_9:
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  uint64_t v6 = objc_msgSend(a4, "identifier", a3);
  id v8 = (id)v6;
  if (v6)
  {
    id v7 = [(STUIStatusBar *)self regionWithIdentifier:v6];
    if (!v7)
    {
      id v7 = [(STUIStatusBar *)self displayItemWithIdentifier:v8];
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
    uint64_t v26 = 0;
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
    id v27 = objc_opt_new();
    -[STUIStatusBar convertRect:toView:](self, "convertRect:toView:", v7, v10, v12, v14, v16);
    long long v28 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
    [v27 setVisiblePath:v28];

    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v7 parameters:v27];
    if ((v18 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v24 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v23];
    long long v29 = [(STUIStatusBar *)self visualProvider];
    int v30 = [v29 conformsToProtocol:&unk_1F2FB0DF8];

    if (v30)
    {
      uint64_t v31 = [(STUIStatusBar *)self visualProvider];
      [(id)objc_opt_class() regionCursorInsets];
      double v10 = v10 + v32;
      double v12 = v12 + v33;
      double v14 = v14 - (v32 + v34);
      double v16 = v16 - (v33 + v35);

      id v36 = [(STUIStatusBar *)self visualProvider];
      char v37 = [(id)objc_opt_class() regionCursorIsPill];

      if ((v37 & 1) == 0)
      {
        char v38 = [(STUIStatusBar *)self visualProvider];
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
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v7];
  if (v18) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v24 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v23];
  double v25 = 0.0;
LABEL_12:
  id v40 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v25);
  uint64_t v26 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v24 shape:v40];

LABEL_13:
  return v26;
}

- (CGRect)_frameForActionable:(id)a3
{
  id v4 = a3;
  [v4 actionInsets];
  -[STUIStatusBar _frameForActionable:actionInsets:](self, "_frameForActionable:actionInsets:", v4);
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
  -[STUIStatusBar _frameForActionable:actionInsets:](self, "_frameForActionable:actionInsets:", a3, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_frameForActionable:(id)a3 actionInsets:(UIEdgeInsets)a4
{
  id v5 = a3;
  double v6 = [v5 layoutItem];
  objc_msgSend(v6, "_ui_bounds");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = [v5 layoutItem];

  double v16 = objc_msgSend(v15, "_ui_view");
  objc_msgSend(v16, "convertRect:toView:", self, v8, v10, v12, v14);

  [(STUIStatusBar *)self _currentScreenScale];
  UIRectIntegralWithScale();
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (BOOL)_gestureRecognizer:(id)a3 isInsideActionable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(STUIStatusBar *)self _gestureRecognizer:v6 touchInsideActionable:v7]|| [(STUIStatusBar *)self _gestureRecognizer:v6 pressInsideActionable:v7];

  return v8;
}

- (BOOL)_gestureRecognizer:(id)a3 touchInsideActionable:(id)a4
{
  id v6 = a4;
  [a3 locationInView:self];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(STUIStatusBar *)self _frameForActionable:v6];
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
  id v6 = [(STUIStatusBar *)self _focusSystem];
  uint64_t v7 = [v6 focusedItem];

  [(STUIStatusBar *)self _pressFrameForActionable:v5];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  [v7 frame];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  LOBYTE(self) = CGRectContainsRect(v21, v22);

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
    BOOL v9 = [(STUIStatusBar *)self _gestureRecognizer:v18 isInsideActionable:WeakRetained];

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
        $480163010D8600EFAA81F3B9B74CD7E7 statusBarFlags = self->_statusBarFlags;

        if ((*(_WORD *)&statusBarFlags & 0x4000) != 0)
        {
          visualProvider = self->_visualProvider;
          id v14 = objc_loadWeakRetained((id *)p_targetActionable);
          [(STUIStatusBarVisualProvider *)visualProvider actionable:v14 highlighted:v10 != 0 initialPress:v5 == 1];
        }
      }
      goto LABEL_19;
    }
    CGFloat v15 = [v10 hoverAction];
    if (v15
      || ([v10 action], (CGFloat v15 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(STUIStatusBar *)self action], (CGFloat v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v15 performWithStatusBar:self completionHandler:0];
    }
  }
  if ((*((unsigned char *)&self->_statusBarFlags + 1) & 0x40) != 0)
  {
    CGFloat v16 = self->_visualProvider;
    id v17 = objc_loadWeakRetained((id *)&self->_targetActionable);
    [(STUIStatusBarVisualProvider *)v16 actionable:v17 highlighted:0 initialPress:0];
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
    v11[2] = __46__STUIStatusBar_gestureRecognizerShouldBegin___block_invoke;
    v11[3] = &unk_1E6AA5040;
    void v11[4] = self;
    id v12 = v4;
    [(NSDictionary *)regions enumerateKeysAndObjectsUsingBlock:v11];
  }
  id v8 = objc_loadWeakRetained((id *)&self->_targetActionable);
  BOOL v9 = v8 != 0;

  return v9;
}

void __46__STUIStatusBar_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ([v6 isEnabled])
  {
    uint64_t v7 = [v6 displayItems];
    if ([v7 count])
    {
      int v8 = [*(id *)(a1 + 32) _gestureRecognizer:*(void *)(a1 + 40) isInsideActionable:v6];

      if (v8)
      {
        BOOL v9 = [v6 displayItems];
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        CGFloat v16 = __46__STUIStatusBar_gestureRecognizerShouldBegin___block_invoke_2;
        id v17 = &unk_1E6AA42E8;
        id v10 = *(void **)(a1 + 40);
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = v10;
        [v9 enumerateObjectsUsingBlock:&v14];

        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 560));
        if (WeakRetained)
        {
        }
        else
        {
          id v12 = objc_msgSend(v6, "action", v14, v15, v16, v17, v18);
          int v13 = [v12 isEnabled];

          if (v13)
          {
            objc_storeWeak((id *)(*(void *)(a1 + 32) + 560), v6);
            *a4 = 1;
          }
        }
      }
    }
    else
    {
    }
  }
}

uint64_t __46__STUIStatusBar_gestureRecognizerShouldBegin___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  obuint64_t j = a2;
  id v6 = [obj action];
  if ([v6 isEnabled])
  {
    int v7 = [*(id *)(a1 + 32) _gestureRecognizer:*(void *)(a1 + 40) isInsideActionable:obj];

    id v9 = obj;
    if (v7)
    {
      id v8 = objc_storeWeak((id *)(*(void *)(a1 + 32) + 560), obj);
      id v9 = obj;
      *a4 = 1;
    }
  }
  else
  {

    id v9 = obj;
  }
  return MEMORY[0x1F41817F8](v8, v9);
}

- (id)actionForPartWithIdentifier:(id)a3
{
  double v3 = [(STUIStatusBar *)self _actionablesForPartWithIdentifier:a3 includeInternalItems:0 onlyVisible:0];
  id v4 = [v3 anyObject];
  uint64_t v5 = [v4 action];

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
  id v6 = -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0, 0);
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
  double v3 = -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v8 offsetable])
        {
          [v8 offset];
          double v9 = v11;
          double v10 = v12;

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  double v9 = *MEMORY[0x1E4FB2E10];
  double v10 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
LABEL_11:
  double v13 = v9;
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
  uint64_t v5 = -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a4, 0, 0);
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
  double v3 = -[STUIStatusBar _regionsForPartWithIdentifier:includeInternalItems:](self, "_regionsForPartWithIdentifier:includeInternalItems:", a3, 0, 0);
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

void __48__STUIStatusBar_setStyle_forPartWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 styleAttributes];
  [v1 _updateDisplayedItemsWithData:0 styleAttributes:v2 extraAnimations:MEMORY[0x1E4F1CBF0]];
}

void __43__STUIStatusBar_setEnabledPartIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v7 = a3;
  double v5 = [v7 identifier];
  LODWORD(v4) = [v4 containsObject:v5];

  int v6 = [v7 isEnabled];
  if (v4)
  {
    if (v6) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    [v7 disableWithToken:1];
  }
  else
  {
    if ((v6 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    [v7 enableWithToken:1];
  }
}

uint64_t __43__STUIStatusBar_setEnabledPartIdentifiers___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

- (void)setDisabledPartIdentifiers:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  double v5 = (NSArray *)a3;
  if (self->_disabledPartIdentifiers != v5)
  {
    obuint64_t j = a3;
    [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
    p_disabledPartIdentifiers = &self->_disabledPartIdentifiers;
    double v32 = v5;
    int v6 = [(NSArray *)self->_disabledPartIdentifiers arrayByExcludingObjectsInArray:v5];
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
          long long v13 = [(STUIStatusBar *)self _actionablesForPartWithIdentifier:v12 includeInternalItems:1 onlyVisible:0];
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
          double v25 = [(STUIStatusBar *)self _actionablesForPartWithIdentifier:v24 includeInternalItems:1 onlyVisible:0];
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

    double v5 = v32;
    if (v9)
    {
      if ((*((unsigned char *)&self->_statusBarFlags + 2) & 2) != 0) {
        [(STUIStatusBarVisualProvider *)self->_visualProvider statusBarEnabledPartsUpdated];
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __44__STUIStatusBar_setDisabledPartIdentifiers___block_invoke;
      v33[3] = &unk_1E6AA37A0;
      v33[4] = self;
      [(STUIStatusBar *)self _performWithInheritedAnimation:v33];
    }
  }
}

uint64_t __44__STUIStatusBar_setDisabledPartIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

- (CGRect)frameForPartWithIdentifier:(id)a3 includeInternalItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (CGFloat *)MEMORY[0x1E4F1DB20];
  if (*(unsigned char *)&self->_statusBarFlags)
  {
    [(STUIStatusBar *)self layoutIfNeeded];
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
    uint64_t v12 = [(STUIStatusBar *)self _actionablesForPartWithIdentifier:v6 includeInternalItems:v4 onlyVisible:1];
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
            [(STUIStatusBarVisualProvider *)self->_visualProvider clockBoundsForLayoutItem:v17];
          }
          else {
            objc_msgSend(v18, "_ui_bounds");
          }
          double v23 = v19;
          double v24 = v20;
          double v25 = v21;
          double v26 = v22;
          uint64_t v27 = objc_msgSend(v18, "_ui_view");
          -[STUIStatusBar convertRect:fromView:](self, "convertRect:fromView:", v27, v23, v24, v25, v26);
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
    uint64_t v12 = -[STUIStatusBar _actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:](self, "_actionablesForPartWithIdentifier:includeInternalItems:onlyVisible:", v6, v4, 1, 0);
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
          -[STUIStatusBar convertRect:fromView:](self, "convertRect:fromView:", v49, v42, v44, v46, v48);
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
  [(STUIStatusBar *)self frameForPartWithIdentifier:a3 includeInternalItems:0];
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

- (NSSet)dependentDataEntryKeys
{
  [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
  double v3 = [MEMORY[0x1E4F1CA80] set];
  displayItemStates = self->_displayItemStates;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__STUIStatusBar_dependentDataEntryKeys__block_invoke;
  v9[3] = &unk_1E6AA3BA8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(NSMutableDictionary *)displayItemStates enumerateKeysAndObjectsUsingBlock:v9];
  double v6 = v10;
  uint64_t v7 = (NSSet *)v5;

  return v7;
}

void __39__STUIStatusBar_dependentDataEntryKeys__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 object];
  double v3 = [*(id *)(a1 + 32) itemWithIdentifier:v6];
  double v4 = *(void **)(a1 + 40);
  id v5 = [v3 dependentEntryKeys];
  [v4 unionSet:v5];
}

- (CGSize)intrinsicContentSize
{
  [(STUIStatusBar *)self _prepareVisualProviderIfNeeded];
  double v3 = [(STUIStatusBar *)self window];
  double v4 = objc_opt_class();
  if (v3) {
    uint64_t v5 = [(id)*MEMORY[0x1E4FB2608] _sceneInterfaceOrientationFromWindow:v3];
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

- (id)itemsDependingOnKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  items = self->_items;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__STUIStatusBar_itemsDependingOnKeys___block_invoke;
  v12[3] = &unk_1E6AA5090;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(NSMutableDictionary *)items enumerateKeysAndObjectsUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __38__STUIStatusBar_itemsDependingOnKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 dependentEntryKeys];
  int v5 = [v4 intersectsSet:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (CGRect)frameForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  [(STUIStatusBar *)self layoutIfNeeded];
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  items = self->_items;
  id v10 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v4];
  double v11 = [(NSMutableDictionary *)items objectForKeyedSubscript:v10];

  if (v11)
  {
    uint64_t v12 = [v11 displayItemForIdentifier:v4];
    id v13 = v12;
    if (v12)
    {
      id v14 = [v12 view];
      [v14 alpha];
      if (v15 > 0.0)
      {
        uint64_t v16 = [v14 window];

        if (v16)
        {
          [v14 bounds];
          -[STUIStatusBar convertRect:fromView:](self, "convertRect:fromView:", v14);
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

- (id)itemIdentifiersInRegionsWithIdentifiers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  double v6 = [v4 set];
  double v7 = [(STUIStatusBar *)self displayItemIdentifiersInRegionsWithIdentifiers:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__STUIStatusBar_itemIdentifiersInRegionsWithIdentifiers___block_invoke;
  v10[3] = &unk_1E6AA50B8;
  id v8 = v6;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return v8;
}

void __57__STUIStatusBar_itemIdentifiersInRegionsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:a2];
  [*(id *)(a1 + 32) addObject:v3];
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
        id v11 = -[STUIStatusBar itemWithIdentifier:](self, "itemWithIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
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
  id v4 = [(STUIStatusBar *)self traitCollection];
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
  id v6 = [(STUIStatusBar *)self regions];
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
          id v13 = objc_msgSend(v12, "displayItemForHUDAtLocation:", x, y);
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
  double v18 = [v17 accessibilityHUDRepresentation];

  return v18;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldTerminateHUDGestureForOtherGestureRecognizer:(id)a4
{
  return self->_actionGestureRecognizer != a4;
}

- (void)_accessibilityHUDGestureManager:(id)a3 showHUDItem:(id)a4
{
  id v5 = a4;
  id v6 = [(STUIStatusBar *)self traitCollection];
  objc_msgSend(v5, "setCustomUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  id v7 = [(STUIStatusBar *)self _statusBarWindowForAccessibilityHUD];
  [v7 _showAccessibilityHUDItem:v5 forView:self];
}

- (void)_dismissAccessibilityHUDForGestureManager:(id)a3
{
  id v3 = [(STUIStatusBar *)self _statusBarWindowForAccessibilityHUD];
  [v3 _dismissAccessibilityHUD];
}

- (id)succinctDescription
{
  id v2 = [(STUIStatusBar *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_visualProvider withName:@"visualProvider" skipIfNil:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIStatusBar *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIStatusBar *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBar *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(STUIStatusBar *)self succinctDescriptionBuilder];
  [v5 setUseDebugDescription:v4];
  return v5;
}

- (id)_expandedDescriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(STUIStatusBar *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v5 = [v4 activeMultilinePrefix];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__STUIStatusBar__expandedDescriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AA39F0;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v5 block:v9];

  id v7 = v6;
  return v7;
}

void __64__STUIStatusBar__expandedDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 activeMultilinePrefix];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __64__STUIStatusBar__expandedDescriptionBuilderWithMultilinePrefix___block_invoke_2;
  double v26 = &unk_1E6AA39F0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v27 = v4;
  uint64_t v28 = v5;
  [v2 appendBodySectionWithName:@"layout" multilinePrefix:v3 block:&v23];

  id v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend(*(id *)(a1 + 40), "enabledPartIdentifiers", v23, v24, v25, v26);
  [v6 appendArraySection:v7 withName:@"enabledPartIdentifiers" skipIfEmpty:1];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) disabledPartIdentifiers];
  [v8 appendArraySection:v9 withName:@"disabledPartIdentifiers" skipIfEmpty:1];

  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) styleAttributes];
  id v12 = (id)[v10 appendObject:v11 withName:@"styleAttributes"];

  id v13 = *(void **)(a1 + 32);
  long long v14 = [*(id *)(a1 + 40) regions];
  [v13 appendDictionarySection:v14 withName:@"regions" skipIfEmpty:1];

  long long v15 = *(void **)(a1 + 32);
  char v16 = [*(id *)(a1 + 40) currentData];
  id v17 = (id)[v15 appendObject:v16 withName:@"currentData"];

  double v18 = *(void **)(a1 + 32);
  uint64_t v19 = [*(id *)(a1 + 40) overlayData];
  id v20 = (id)[v18 appendObject:v19 withName:@"overlayData" skipIfNil:1];

  long long v21 = *(void **)(a1 + 32);
  long long v22 = [*(id *)(a1 + 40) displayItemStates];
  [v21 appendDictionarySection:v22 withName:@"displayItemStates" skipIfEmpty:1];
}

void __64__STUIStatusBar__expandedDescriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) frame];
  id v3 = (id)objc_msgSend(v2, "appendRect:withName:", @"frame");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) avoidanceFrame];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"avoidanceFrame");
  id v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) orientation];
  BSInterfaceOrientationDescription();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 appendString:v7 withName:@"orientation"];
}

- (UIScreen)targetScreen
{
  return self->_targetScreen;
}

- (void)setVisualProviderInfo:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSArray)enabledPartIdentifiers
{
  return self->_enabledPartIdentifiers;
}

- (NSArray)disabledPartIdentifiers
{
  return self->_disabledPartIdentifiers;
}

- (int64_t)automaticStyle
{
  return self->_automaticStyle;
}

- (void)setAutomaticStyle:(int64_t)a3
{
  self->_int64_t automaticStyle = a3;
}

- (NSDictionary)automaticStyleOutliers
{
  return self->_automaticStyleOutliers;
}

- (void)setAutomaticStyleOutliers:(id)a3
{
}

- (STUIStatusBarActionable)targetActionable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetActionable);
  return (STUIStatusBarActionable *)WeakRetained;
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

- (STUIStatusBarActionable)hoveredActionable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hoveredActionable);
  return (STUIStatusBarActionable *)WeakRetained;
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

- (STUIStatusBarDataAggregator)dataAggregator
{
  return self->_dataAggregator;
}

- (STUIStatusBarAction)action
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_regionActionValidationBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
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
  objc_storeStrong((id *)&self->_automaticStyleOutliers, 0);
  objc_storeStrong((id *)&self->_disabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_enabledPartIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_visualProviderInfo, 0);
  objc_storeStrong((id *)&self->_targetScreen, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_currentAggregatedData, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
}

@end