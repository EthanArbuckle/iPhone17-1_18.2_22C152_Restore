@interface _UIStatusBarVisualProvider_iOS
+ (BOOL)requiresIterativeOverflowLayout;
+ (BOOL)scalesWithScreenNativeScale;
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
+ (double)cornerRadius;
+ (double)height;
- (BOOL)expanded;
- (BOOL)hasCellularCapability;
- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4;
- (BOOL)onLockScreen;
- (BOOL)supportsIndirectPointerTouchActions;
- (BOOL)wantsBackgroundActivityPillInExpandedTrailingPlacements;
- (BOOL)wantsPillInExpandedTrailingPlacements;
- (NSArray)expandedCellularPlacementsAffectedByAirplaneMode;
- (NSArray)expandedLeadingPlacements;
- (NSArray)expandedTrailingPlacements;
- (UIFont)clockFont;
- (_UIStatusBar)statusBar;
- (_UIStatusBarAnimation)animationForAirplaneMode;
- (_UIStatusBarAnimation)animationForProminentLocation;
- (_UIStatusBarDisplayItemPlacement)expandedPillPlacement;
- (_UIStatusBarDisplayItemPlacementGroup)secondaryWifiGroup;
- (_UIStatusBarDisplayItemPlacementNetworkGroup)expandedNetworkGroup;
- (_UIStatusBarVisualProvider_iOS)init;
- (double)airplaneObstacleFadeInDuration;
- (double)airplaneObstacleFadeOutDuration;
- (double)airplaneShouldFadeForAnimationType:(int64_t)a3;
- (double)airplaneSpeedForAnimationType:(int64_t)a3;
- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4;
- (double)bluetoothPaddingInset;
- (double)expandedItemSpacing;
- (double)leadingItemSpacing;
- (double)regionSpacing;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)setupInContainerView:(id)a3;
- (id)styleAttributesForStyle:(int64_t)a3;
- (id)willUpdateWithData:(id)a3;
- (void)_applyToAppearingRegions:(BOOL)a3 block:(id)a4;
- (void)_createExpandedPlacements;
- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5;
- (void)modeUpdatedFromMode:(int64_t)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setOnLockScreen:(BOOL)a3;
- (void)setSecondaryWifiGroup:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)updateDataForService:(id)a3;
- (void)updateDataForSystemNavigation:(id)a3;
@end

@implementation _UIStatusBarVisualProvider_iOS

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (!v8 || v8 == 3 || v8 == 1)
  {
    v9 = objc_opt_class();
    v10 = _UIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v9, v5, v6);
  }
  else
  {
    v10 = 0;
  }

  return (Class)v10;
}

- (BOOL)hasCellularCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)wantsBackgroundActivityPillInExpandedTrailingPlacements
{
  return 0;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 0;
}

+ (BOOL)requiresIterativeOverflowLayout
{
  return 0;
}

+ (double)height
{
  return 0.0;
}

+ (double)cornerRadius
{
  return 0.0;
}

- (double)expandedItemSpacing
{
  return 4.0;
}

- (double)regionSpacing
{
  return 16.0;
}

- (double)bluetoothPaddingInset
{
  [(_UIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
  return round(v2 * 1.5);
}

- (_UIStatusBarVisualProvider_iOS)init
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarVisualProvider_iOS;
  double v2 = [(_UIStatusBarVisualProvider_iOS *)&v4 init];
  [(_UIStatusBarVisualProvider_iOS *)v2 _createExpandedPlacements];
  return v2;
}

- (BOOL)supportsIndirectPointerTouchActions
{
  return [(id)UIApp _supportsIndirectInputEvents];
}

- (UIFont)clockFont
{
  return 0;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  objc_super v4 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  id v5 = +[_UIStatusBarStyleAttributes styleAttributesForStatusBar:v4 style:a3];

  id v6 = [v5 textColor];

  if (a3 == 1)
  {
    if (!v6)
    {
      v7 = +[UIColor whiteColor];
      [v5 setTextColor:v7];
    }
    uint64_t v8 = [v5 imageTintColor];

    if (!v8)
    {
      uint64_t v9 = +[UIColor whiteColor];
LABEL_10:
      v12 = (void *)v9;
      [v5 setImageTintColor:v9];
    }
  }
  else
  {
    if (!v6)
    {
      v10 = +[UIColor blackColor];
      [v5 setTextColor:v10];
    }
    v11 = [v5 imageTintColor];

    if (!v11)
    {
      uint64_t v9 = +[UIColor blackColor];
      goto LABEL_10;
    }
  }
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v13 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v17 = _UIInternalPreference_StatusBarRedInSpringBoard;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_StatusBarRedInSpringBoard)
    {
      while (v13 >= v17)
      {
        _UIInternalPreferenceSync(v13, &_UIInternalPreference_StatusBarRedInSpringBoard, @"StatusBarRedInSpringBoard", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v17 = _UIInternalPreference_StatusBarRedInSpringBoard;
        if (v13 == _UIInternalPreference_StatusBarRedInSpringBoard) {
          goto LABEL_14;
        }
      }
      if (byte_1E8FD5494 && [(id)UIApp _isSpringBoard])
      {
        v18 = +[UIColor redColor];
        [v5 setTextColor:v18];

        v19 = +[UIColor redColor];
        [v5 setImageTintColor:v19];
      }
    }
  }
LABEL_14:
  v14 = [v5 imageTintColor];
  v15 = [v14 colorWithAlphaComponent:0.2];
  [v5 setImageDimmedTintColor:v15];

  [v5 setSymbolScale:1];
  return v5;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  objc_msgSend(a1, "height", a3);
  double v4 = v3;
  double v5 = -1.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)setupInContainerView:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)modeUpdatedFromMode:(int64_t)a3
{
  double v4 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  uint64_t v5 = [v4 mode];

  if (v5 == 2)
  {
    [(_UIStatusBarVisualProvider_iOS *)self setExpanded:0];
    [(_UIStatusBarVisualProvider_iOS *)self setOnLockScreen:1];
  }
  else
  {
    if (v5 == 1)
    {
      [(_UIStatusBarVisualProvider_iOS *)self setOnLockScreen:0];
      id v6 = self;
      uint64_t v7 = 1;
    }
    else
    {
      if (v5) {
        return;
      }
      [(_UIStatusBarVisualProvider_iOS *)self setOnLockScreen:0];
      id v6 = self;
      uint64_t v7 = 0;
    }
    [(_UIStatusBarVisualProvider_iOS *)v6 setExpanded:v7];
  }
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 layoutItem];
  uint64_t v8 = objc_msgSend(v7, "_ui_view");

  if (v8)
  {
    v10[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    +[UIButton _setVisuallyHighlighted:v6 forViews:v9 initialPress:v5];
  }
}

- (void)_createExpandedPlacements
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [MEMORY[0x1E4F1CA48] array];
  if ([(_UIStatusBarVisualProvider_iOS *)self wantsPillInExpandedTrailingPlacements])
  {
    BOOL v5 = +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];
    BOOL v6 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v5 priority:300];
    expandedPillPlacement = self->_expandedPillPlacement;
    self->_expandedPillPlacement = v6;

    [(NSArray *)v4 addObject:self->_expandedPillPlacement];
  }
  uint64_t v8 = +[_UIStatusBarItem defaultDisplayIdentifier];
  uint64_t v9 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:450];
  [(NSArray *)v4 addObject:v9];

  if ([(_UIStatusBarVisualProvider_iOS *)self wantsExpandedLeadingPlacements])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = objc_opt_class();
    v12 = +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:1500 lowPriority:1200 cellularItemClass:v11 wifiItemClass:objc_opt_class() includeCellularName:1];
    expandedNetworkGroup = self->_expandedNetworkGroup;
    self->_expandedNetworkGroup = v12;

    v14 = [(_UIStatusBarDisplayItemPlacementNetworkGroup *)self->_expandedNetworkGroup cellularGroup];
    v15 = [v14 placementsAffectedByAirplaneMode];
    [(NSArray *)v10 addObjectsFromArray:v15];

    uint64_t v16 = objc_opt_class();
    int v17 = +[_UIStatusBarDisplayItemPlacementNetworkGroup secondaryGroupWithHighPriority:500 lowPriority:200 cellularItemClass:v16 wifiItemClass:objc_opt_class()];
    v18 = [v17 cellularGroup];
    v19 = [v18 placementsAffectedByAirplaneMode];
    [(NSArray *)v10 addObjectsFromArray:v19];

    v20 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v21 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v20 priority:4000];
    v22 = [v21 excludingPlacements:v10];
    [(NSArray *)v3 addObject:v22];

    v23 = [(_UIStatusBarDisplayItemPlacementGroup *)self->_expandedNetworkGroup placements];
    [(NSArray *)v3 addObjectsFromArray:v23];

    [(_UIStatusBarVisualProvider_iOS *)self regionSpacing];
    double v25 = v24;
    [(_UIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
    v27 = +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", [(_UIStatusBarDisplayItemPlacementGroup *)self->_expandedNetworkGroup minimumPriority] - 5, v25 - (v26 + v26), 0.0);
    v28 = [(_UIStatusBarDisplayItemPlacementNetworkGroup *)self->_expandedNetworkGroup cellularGroup];
    v29 = [v28 placements];
    v30 = [v27 requiringAnyPlacements:v29];
    [(NSArray *)v3 addObject:v30];

    v31 = [v17 placements];
    [(NSArray *)v3 addObjectsFromArray:v31];

    v32 = [v17 wifiGroup];
    secondaryWifiGroup = self->_secondaryWifiGroup;
    self->_secondaryWifiGroup = v32;

    expandedCellularPlacementsAffectedByAirplaneMode = self->_expandedCellularPlacementsAffectedByAirplaneMode;
    self->_expandedCellularPlacementsAffectedByAirplaneMode = v10;
  }
  else
  {
    int v17 = +[_UIStatusBarWifiItem groupWithPriority:500];
    v35 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v36 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v35 priority:4000];
    [(NSArray *)v4 addObject:v36];

    v37 = [v17 placements];
    [(NSArray *)v4 addObjectsFromArray:v37];

    expandedCellularPlacementsAffectedByAirplaneMode = +[_UIStatusBarItem defaultDisplayIdentifier];
    v38 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:expandedCellularPlacementsAffectedByAirplaneMode priority:54];
    [(NSArray *)v4 addObject:v38];
  }
  [(_UIStatusBarVisualProvider_iOS *)self bluetoothPaddingInset];
  +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementExpandedIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 400, 100);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  v39 = +[_UIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](_UIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", [v47 maximumPriority] + 1, objc_msgSend(v47, "minimumPriority") - 5);
  v40 = [v47 placements];
  [(NSArray *)v4 addObjectsFromArray:v40];

  v41 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v42 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v41 priority:1];
  [(NSArray *)v4 addObject:v42];

  v43 = [v39 placements];
  [(NSArray *)v4 addObjectsFromArray:v43];

  expandedLeadingPlacements = self->_expandedLeadingPlacements;
  self->_expandedLeadingPlacements = v3;
  v45 = v3;

  expandedTrailingPlacements = self->_expandedTrailingPlacements;
  self->_expandedTrailingPlacements = v4;
}

- (id)willUpdateWithData:(id)a3
{
  id v4 = a3;
  [(_UIStatusBarVisualProvider_iOS *)self updateDataForService:v4];
  [(_UIStatusBarVisualProvider_iOS *)self updateDataForSystemNavigation:v4];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)updateDataForService:(id)a3
{
  id v4 = [a3 secondaryCellularEntry];
  if (v4)
  {
    id v5 = v4;
    -[_UIStatusBarDisplayItemPlacementGroup setEnabled:](self->_secondaryWifiGroup, "setEnabled:", [v4 type] != 0);
    id v4 = v5;
  }
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"batteryPartIdentifier"])
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = +[_UIStatusBarBatteryItem staticIconDisplayIdentifier];
LABEL_7:
    BOOL v6 = (void *)v5;
    uint64_t v7 = [v4 setWithObject:v5];
LABEL_8:

    goto LABEL_9;
  }
  if ([v3 isEqual:@"backNavigationPartIdentifier"])
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = +[_UIStatusBarItem defaultDisplayIdentifier];
    goto LABEL_7;
  }
  if ([v3 isEqual:@"clockPartIdentifier"])
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = +[_UIStatusBarTimeItem shortTimeDisplayIdentifier];
    goto LABEL_7;
  }
  if ([v3 isEqual:@"dateAndTimePartIdentifier"])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v6 = +[_UIStatusBarTimeItem shortTimeDisplayIdentifier];
    v10 = +[_UIStatusBarTimeItem timeDisplayIdentifier];
    uint64_t v11 = +[_UIStatusBarTimeItem dateDisplayIdentifier];
    uint64_t v7 = objc_msgSend(v9, "setWithObjects:", v6, v10, v11, 0);

LABEL_16:
    goto LABEL_8;
  }
  int v12 = [v3 isEqual:@"lockPartIdentifier"];
  int v13 = (void *)MEMORY[0x1E4F1CAD0];
  if (v12)
  {
    BOOL v6 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v10 = +[_UIStatusBarLockItem textDisplayIdentifier];
    uint64_t v7 = objc_msgSend(v13, "setWithObjects:", v6, v10, 0);
    goto LABEL_16;
  }
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
LABEL_9:

  return v7;
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(_UIStatusBarVisualProvider_iOS *)self _applyToAppearingRegions:0 block:&__block_literal_global_495];
    [(_UIStatusBarVisualProvider_iOS *)self _applyToAppearingRegions:1 block:&__block_literal_global_33_4];
    id v4 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    [v4 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_applyToAppearingRegions:(BOOL)a3 block:(id)a4
{
  int v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(id, void *))a4;
  int v7 = [(_UIStatusBarVisualProvider_iOS *)self expanded];
  uint64_t v8 = &_UIStatusBarPartIdentifierNormal;
  if (v7 == v4) {
    uint64_t v8 = &_UIStatusBarPartIdentifierExpanded;
  }
  [(_UIStatusBarVisualProvider_iOS *)self regionIdentifiersForPartWithIdentifier:*v8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        v15 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
        uint64_t v16 = [v15 regions];
        int v17 = [v16 objectForKeyedSubscript:v14];
        v6[2](v6, v17);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[_UIStatusBarItem defaultDisplayIdentifier];
  uint64_t v8 = (void *)v7;
  char v9 = (id)v7 == v6 || v4;
  if (v4 && (id)v7 != v6)
  {
    id v10 = +[_UIStatusBarIndicatorLocationItem prominentDisplayIdentifier];
    if (v10 == v6)
    {
      uint64_t v11 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      uint64_t v12 = [v11 currentAggregatedData];
      uint64_t v13 = [v12 locationEntry];
      char v9 = [v13 isEnabled];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIStatusBarItem defaultDisplayIdentifier];

  if (v8 == v6)
  {
    id v9 = [(_UIStatusBarVisualProvider_iOS *)self animationForAirplaneMode];
  }
  else if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(_UIStatusBarVisualProvider_iOS *)self defaultAnimationForDisplayItemWithIdentifier:v6];
  }
  id v10 = v9;

  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIStatusBarItem defaultDisplayIdentifier];

  if (v8 == v6)
  {
    id v10 = [(_UIStatusBarVisualProvider_iOS *)self animationForAirplaneMode];
    goto LABEL_10;
  }
  id v9 = +[_UIStatusBarIndicatorLocationItem prominentDisplayIdentifier];
  if (v9 == v6)
  {
    uint64_t v11 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    uint64_t v12 = [v11 currentAggregatedData];
    uint64_t v13 = [v12 locationEntry];
    int v14 = [v13 isEnabled];

    if (v14)
    {
      id v10 = [(_UIStatusBarVisualProvider_iOS *)self animationForProminentLocation];
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    id v10 = [(_UIStatusBarVisualProvider_iOS *)self defaultAnimationForDisplayItemWithIdentifier:v6];
  }
LABEL_10:
  v15 = v10;

  return v15;
}

- (void)updateDataForSystemNavigation:(id)a3
{
  id v3 = a3;
}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  double result = 0.0;
  if (a4 == 2)
  {
    id v6 = +[_UIStatusBarItem defaultDisplayIdentifier];
    *a3 = [v6 stringRepresentation];

    return 100.0;
  }
  return result;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  double result = 40.0;
  if (a3 == 2) {
    return 160.0;
  }
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 2) {
    return 1.0;
  }
  return result;
}

- (double)airplaneObstacleFadeOutDuration
{
  return 0.05;
}

- (double)airplaneObstacleFadeInDuration
{
  return 0.3;
}

- (_UIStatusBarAnimation)animationForAirplaneMode
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__181;
  v45[4] = __Block_byref_object_dispose__181;
  id v46 = 0;
  id v3 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  BOOL v4 = [v3 styleAttributes];
  BOOL v5 = [v4 effectiveLayoutDirection] == 1;

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke;
  v43[3] = &unk_1E5306890;
  v43[4] = self;
  v43[5] = v45;
  BOOL v44 = v5;
  v43[6] = v47;
  v43[7] = v48;
  id v6 = +[_UIStatusBarAnimation animationWithBlock:v43];
  [v6 setPriority:100];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_3;
  v42[3] = &unk_1E5301EC8;
  v42[4] = v47;
  [v6 setPrepareBlock:v42];
  id v27 = v6;
  double v26 = [MEMORY[0x1E4F1CA80] set];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  id v8 = +[_UIStatusBarItem defaultDisplayIdentifier];
  id v9 = [WeakRetained stateForDisplayItemWithIdentifier:v8];
  id v10 = [v9 potentialPlacementRegionIdentifiers];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v11)
  {
    uint64_t v25 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v14 = objc_loadWeakRetained((id *)&self->_statusBar);
        v15 = [v14 regions];
        uint64_t v16 = [v15 objectForKeyedSubscript:v13];

        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x3032000000;
        v36[3] = __Block_byref_object_copy__181;
        v36[4] = __Block_byref_object_dispose__181;
        id v37 = 0;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_4;
        v35[3] = &unk_1E53068E0;
        v35[6] = v47;
        v35[7] = v48;
        v35[8] = v36;
        v35[4] = self;
        v35[5] = v45;
        int v17 = +[_UIStatusBarAnimation animationWithBlock:v35];
        [v17 setPriority:100];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_15;
        v32[3] = &unk_1E5306908;
        v34 = v36;
        id v18 = v16;
        id v33 = v18;
        [v17 setPrepareBlock:v32];
        long long v19 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
        uint64_t v49 = v13;
        long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
        long long v21 = [v19 displayItemIdentifiersInRegionsWithIdentifiers:v20];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __58___UIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_16;
        v28[3] = &unk_1E5306930;
        id v29 = v26;
        id v30 = v27;
        id v22 = v17;
        id v31 = v22;
        [v21 enumerateObjectsUsingBlock:v28];

        _Block_object_dispose(v36, 8);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v11);
  }

  [v27 setDelaysDependentItems:1];
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v48, 8);
  return (_UIStatusBarAnimation *)v27;
}

- (_UIStatusBarAnimation)animationForProminentLocation
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3010000000;
  v8[3] = &unk_186D7DBA7;
  long long v9 = *MEMORY[0x1E4F1DAD8];
  double v2 = +[_UIStatusBarAnimation animationWithBlock:&__block_literal_global_45_3];
  [v2 setPriority:100];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_3;
  v7[3] = &unk_1E5306820;
  v7[4] = v8;
  id v3 = +[_UIStatusBarAnimation animationWithBlock:v7];
  [v3 setPriority:100];
  BOOL v4 = +[_UIStatusBarItem defaultDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v4];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___UIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_5;
  v6[3] = &unk_1E5301EC8;
  v6[4] = v8;
  [v2 setPrepareBlock:v6];
  [v2 setDelaysAnimatingItems:1];

  _Block_object_dispose(v8, 8);
  return (_UIStatusBarAnimation *)v2;
}

- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3
{
  return _UIStatusBarDefaultScaleAnimation(self, a3, 0.75);
}

- (_UIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (_UIStatusBar *)WeakRetained;
}

- (void)setStatusBar:(id)a3
{
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return self->_wantsPillInExpandedTrailingPlacements;
}

- (double)leadingItemSpacing
{
  return self->_leadingItemSpacing;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)onLockScreen
{
  return self->_onLockScreen;
}

- (void)setOnLockScreen:(BOOL)a3
{
  self->_onLockScreen = a3;
}

- (_UIStatusBarDisplayItemPlacementNetworkGroup)expandedNetworkGroup
{
  return self->_expandedNetworkGroup;
}

- (NSArray)expandedCellularPlacementsAffectedByAirplaneMode
{
  return self->_expandedCellularPlacementsAffectedByAirplaneMode;
}

- (NSArray)expandedLeadingPlacements
{
  return self->_expandedLeadingPlacements;
}

- (NSArray)expandedTrailingPlacements
{
  return self->_expandedTrailingPlacements;
}

- (_UIStatusBarDisplayItemPlacement)expandedPillPlacement
{
  return self->_expandedPillPlacement;
}

- (_UIStatusBarDisplayItemPlacementGroup)secondaryWifiGroup
{
  return self->_secondaryWifiGroup;
}

- (void)setSecondaryWifiGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryWifiGroup, 0);
  objc_storeStrong((id *)&self->_expandedPillPlacement, 0);
  objc_storeStrong((id *)&self->_expandedTrailingPlacements, 0);
  objc_storeStrong((id *)&self->_expandedLeadingPlacements, 0);
  objc_storeStrong((id *)&self->_expandedCellularPlacementsAffectedByAirplaneMode, 0);
  objc_storeStrong((id *)&self->_expandedNetworkGroup, 0);
  objc_destroyWeak((id *)&self->_statusBar);
}

@end