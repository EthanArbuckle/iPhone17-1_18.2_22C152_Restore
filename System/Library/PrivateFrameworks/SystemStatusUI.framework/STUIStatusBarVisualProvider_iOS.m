@interface STUIStatusBarVisualProvider_iOS
+ (BOOL)requiresIterativeOverflowLayout;
+ (BOOL)scalesWithScreenNativeScale;
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
+ (double)cornerRadius;
+ (double)height;
- (BOOL)expanded;
- (BOOL)hasCellularCapability;
- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4;
- (BOOL)onAODLockScreen;
- (BOOL)onLockScreen;
- (BOOL)supportsIndirectPointerTouchActions;
- (BOOL)wantsBackgroundActivityPillInExpandedTrailingPlacements;
- (BOOL)wantsPillInExpandedTrailingPlacements;
- (NSArray)expandedCellularPlacementsAffectedByAirplaneMode;
- (NSArray)expandedLeadingPlacements;
- (NSArray)expandedTrailingPlacements;
- (STUIStatusBar)statusBar;
- (STUIStatusBarAnimation)animationForAirplaneMode;
- (STUIStatusBarAnimation)animationForProminentLocation;
- (STUIStatusBarDisplayItemPlacement)expandedPillPlacement;
- (STUIStatusBarDisplayItemPlacementGroup)secondaryWifiGroup;
- (STUIStatusBarDisplayItemPlacementNetworkGroup)expandedNetworkGroup;
- (STUIStatusBarVisualProvider_iOS)init;
- (UIFont)clockFont;
- (_UILumaTrackingGroup)lumaTrackingGroup;
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
- (id)regionIdentifiersForBackgroundLumaView:(id)a3;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)setupInContainerView:(id)a3;
- (id)styleAttributesForStyle:(int64_t)a3;
- (id)willUpdateWithData:(id)a3;
- (void)_applyToAppearingRegions:(BOOL)a3 block:(id)a4;
- (void)_createExpandedPlacements;
- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5;
- (void)backgroundLumaGroup:(id)a3 didTransitionToLevel:(unint64_t)a4 viewsWithDifferentLevels:(id)a5;
- (void)modeUpdatedFromMode:(int64_t)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setLumaTrackingGroup:(id)a3;
- (void)setOnAODLockScreen:(BOOL)a3;
- (void)setOnLockScreen:(BOOL)a3;
- (void)setSecondaryWifiGroup:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)updateDataForService:(id)a3;
- (void)updateDataForSystemNavigation:(id)a3;
- (void)updateLumaTracking:(BOOL)a3;
@end

@implementation STUIStatusBarVisualProvider_iOS

- (id)styleAttributesForStyle:(int64_t)a3
{
  v4 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  v5 = +[STUIStatusBarStyleAttributes styleAttributesForStatusBar:v4 style:a3];

  v6 = [v5 textColor];

  if (a3 == 1)
  {
    if (!v6)
    {
      v7 = [MEMORY[0x1E4FB1618] whiteColor];
      [v5 setTextColor:v7];
    }
    v8 = [v5 imageTintColor];

    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_10:
      v12 = (void *)v9;
      [v5 setImageTintColor:v9];
    }
  }
  else
  {
    if (!v6)
    {
      v10 = [MEMORY[0x1E4FB1618] blackColor];
      [v5 setTextColor:v10];
    }
    v11 = [v5 imageTintColor];

    if (!v11)
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] blackColor];
      goto LABEL_10;
    }
  }
  v13 = +[STUIStatusBarSettingsDomain rootSettings];
  v14 = [v13 visualProviderSettings];
  int v15 = [v14 redInSpringBoard];

  if (v15)
  {
    v16 = [MEMORY[0x1E4FB1618] redColor];
    [v5 setTextColor:v16];

    v17 = [MEMORY[0x1E4FB1618] redColor];
    [v5 setImageTintColor:v17];
  }
  v18 = [v5 imageTintColor];
  v19 = [v18 colorWithAlphaComponent:0.2];
  [v5 setImageDimmedTintColor:v19];

  [v5 setSymbolScale:1];
  return v5;
}

- (STUIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (STUIStatusBar *)WeakRetained;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB30D8];
  objc_msgSend(a1, "height", a3);
  double v5 = v4;
  double v6 = v3;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"batteryPartIdentifier"])
  {
    double v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = +[STUIStatusBarBatteryItem staticIconDisplayIdentifier];
LABEL_7:
    double v6 = (void *)v5;
    v7 = [v4 setWithObject:v5];
LABEL_8:

    goto LABEL_9;
  }
  if ([v3 isEqual:@"backNavigationPartIdentifier"])
  {
    double v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = +[STUIStatusBarItem defaultDisplayIdentifier];
    goto LABEL_7;
  }
  if ([v3 isEqual:@"clockPartIdentifier"])
  {
    double v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
    goto LABEL_7;
  }
  if ([v3 isEqual:@"dateAndTimePartIdentifier"])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    double v6 = +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
    v10 = +[STUIStatusBarTimeItem timeDisplayIdentifier];
    v11 = +[STUIStatusBarTimeItem dateDisplayIdentifier];
    v7 = objc_msgSend(v9, "setWithObjects:", v6, v10, v11, 0);

LABEL_16:
    goto LABEL_8;
  }
  int v12 = [v3 isEqual:@"lockPartIdentifier"];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  if (v12)
  {
    double v6 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v10 = +[STUIStatusBarLockItem textDisplayIdentifier];
    v7 = objc_msgSend(v13, "setWithObjects:", v6, v10, 0);
    goto LABEL_16;
  }
  v7 = [MEMORY[0x1E4F1CAD0] set];
LABEL_9:

  return v7;
}

- (void)setLumaTrackingGroup:(id)a3
{
}

- (void)updateLumaTracking:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(STUIStatusBarVisualProvider_iOS *)self lumaTrackingGroup];
  id v11 = v5;
  if (v3)
  {
    char v6 = [v5 isPaused];

    if ((v6 & 1) == 0)
    {
      v7 = [(STUIStatusBarVisualProvider_iOS *)self lumaTrackingGroup];
      [v7 setPaused:1];
    }
    id v11 = [(STUIStatusBarVisualProvider_iOS *)self lumaTrackingGroup];
    v8 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    uint64_t v9 = [v8 style] >> 6;
    if (v9 == 2) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (v9 == 1);
    }
    [v11 unpauseAfterSeedingWithLumaLevel:v10];
  }
  else
  {
    [v5 setPaused:1];
  }
}

- (_UILumaTrackingGroup)lumaTrackingGroup
{
  return self->_lumaTrackingGroup;
}

- (void)setStatusBar:(id)a3
{
}

- (STUIStatusBarVisualProvider_iOS)init
{
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarVisualProvider_iOS;
  v2 = [(STUIStatusBarVisualProvider_iOS *)&v4 init];
  [(STUIStatusBarVisualProvider_iOS *)v2 _createExpandedPlacements];
  return v2;
}

- (BOOL)supportsIndirectPointerTouchActions
{
  return [(id)*MEMORY[0x1E4FB2608] _supportsIndirectInputEvents];
}

+ (BOOL)requiresIterativeOverflowLayout
{
  return 0;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (id)willUpdateWithData:(id)a3
{
  id v4 = a3;
  [(STUIStatusBarVisualProvider_iOS *)self updateDataForService:v4];
  [(STUIStatusBarVisualProvider_iOS *)self updateDataForSystemNavigation:v4];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)updateDataForSystemNavigation:(id)a3
{
  id v16 = a3;
  uint64_t v4 = _UIStatusBarHostedInSpringBoard();
  id v5 = v16;
  if ((v4 & 1) == 0)
  {
    char v6 = [v16 backNavigationEntry];
    v7 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    v8 = [v7 currentAggregatedData];
    uint64_t v9 = [v8 backNavigationEntry];

    if (v6)
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v11 = [(id)*MEMORY[0x1E4FB2608] _systemNavigationAction];
      int v12 = [v11 destinations];
      int v13 = [v12 containsObject:&unk_1F2F9CB58];

      v14 = (void *)MEMORY[0x1E4FA94C0];
      if (v13)
      {
        int v15 = [v11 titleForDestination:0];
        uint64_t v10 = [v14 entryWithStringValue:v15];
      }
      else
      {
        uint64_t v10 = [MEMORY[0x1E4FA94C0] disabledEntry];
      }

      if (v10 && ([v10 isEqual:v9] & 1) == 0) {
        [v16 setBackNavigationEntry:v10];
      }
    }

    id v5 = v16;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)updateDataForService:(id)a3
{
  uint64_t v4 = [a3 secondaryCellularEntry];
  if (v4)
  {
    id v5 = v4;
    -[STUIStatusBarDisplayItemPlacementGroup setEnabled:](self->_secondaryWifiGroup, "setEnabled:", [v4 type] != 0);
    uint64_t v4 = v5;
  }
}

- (NSArray)expandedTrailingPlacements
{
  return self->_expandedTrailingPlacements;
}

- (NSArray)expandedLeadingPlacements
{
  return self->_expandedLeadingPlacements;
}

- (NSArray)expandedCellularPlacementsAffectedByAirplaneMode
{
  return self->_expandedCellularPlacementsAffectedByAirplaneMode;
}

- (void)_createExpandedPlacements
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if ([(STUIStatusBarVisualProvider_iOS *)self wantsPillInExpandedTrailingPlacements])
  {
    id v5 = +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];
    char v6 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v5 priority:300];
    expandedPillPlacement = self->_expandedPillPlacement;
    self->_expandedPillPlacement = v6;

    [(NSArray *)v4 addObject:self->_expandedPillPlacement];
  }
  v8 = +[STUIStatusBarItem defaultDisplayIdentifier];
  uint64_t v9 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:450];
  [(NSArray *)v4 addObject:v9];

  if ([(STUIStatusBarVisualProvider_iOS *)self wantsExpandedLeadingPlacements])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = objc_opt_class();
    int v12 = +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:1500 lowPriority:1200 cellularItemClass:v11 wifiItemClass:objc_opt_class() includeCellularName:1];
    expandedNetworkGroup = self->_expandedNetworkGroup;
    self->_expandedNetworkGroup = v12;

    v14 = [(STUIStatusBarDisplayItemPlacementNetworkGroup *)self->_expandedNetworkGroup cellularGroup];
    int v15 = [v14 placementsAffectedByAirplaneMode];
    [(NSArray *)v10 addObjectsFromArray:v15];

    uint64_t v16 = objc_opt_class();
    v17 = +[STUIStatusBarDisplayItemPlacementNetworkGroup secondaryGroupWithHighPriority:500 lowPriority:200 cellularItemClass:v16 wifiItemClass:objc_opt_class()];
    v18 = [v17 cellularGroup];
    v19 = [v18 placementsAffectedByAirplaneMode];
    [(NSArray *)v10 addObjectsFromArray:v19];

    v20 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v21 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v20 priority:4000];
    v22 = [v21 excludingPlacements:v10];
    [(NSArray *)v3 addObject:v22];

    v23 = [(STUIStatusBarDisplayItemPlacementGroup *)self->_expandedNetworkGroup placements];
    [(NSArray *)v3 addObjectsFromArray:v23];

    [(STUIStatusBarVisualProvider_iOS *)self regionSpacing];
    double v25 = v24;
    [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
    v27 = +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", [(STUIStatusBarDisplayItemPlacementGroup *)self->_expandedNetworkGroup minimumPriority] - 5, v25 + v26 * -2.0, 0.0);
    v28 = [(STUIStatusBarDisplayItemPlacementNetworkGroup *)self->_expandedNetworkGroup cellularGroup];
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
    v17 = +[STUIStatusBarWifiItem groupWithPriority:500];
    v35 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v36 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v35 priority:4000];
    [(NSArray *)v4 addObject:v36];

    v37 = [v17 placements];
    [(NSArray *)v4 addObjectsFromArray:v37];

    expandedCellularPlacementsAffectedByAirplaneMode = +[STUIStatusBarItem defaultDisplayIdentifier];
    v38 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:expandedCellularPlacementsAffectedByAirplaneMode priority:54];
    [(NSArray *)v4 addObject:v38];
  }
  [(STUIStatusBarVisualProvider_iOS *)self bluetoothPaddingInset];
  +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementExpandedIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 400, 100);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  v39 = +[STUIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](STUIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", [v47 maximumPriority] + 1, objc_msgSend(v47, "minimumPriority") - 5);
  v40 = [v47 placements];
  [(NSArray *)v4 addObjectsFromArray:v40];

  v41 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v42 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v41 priority:1];
  [(NSArray *)v4 addObject:v42];

  v43 = [v39 placements];
  [(NSArray *)v4 addObjectsFromArray:v43];

  expandedLeadingPlacements = self->_expandedLeadingPlacements;
  self->_expandedLeadingPlacements = v3;
  v45 = v3;

  expandedTrailingPlacements = self->_expandedTrailingPlacements;
  self->_expandedTrailingPlacements = v4;
}

- (double)bluetoothPaddingInset
{
  [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
  return round(v2 * 1.5);
}

- (double)expandedItemSpacing
{
  return 4.0;
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return self->_wantsPillInExpandedTrailingPlacements;
}

- (double)regionSpacing
{
  return 16.0;
}

- (BOOL)hasCellularCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v8 = (void *)v7;
  char v9 = (id)v7 == v6 || v4;
  if (v4 && (id)v7 != v6)
  {
    id v10 = +[STUIStatusBarIndicatorLocationItem prominentDisplayIdentifier];
    if (v10 == v6)
    {
      uint64_t v11 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      int v12 = [v11 currentAggregatedData];
      int v13 = [v12 locationEntry];
      char v9 = [v13 isEnabled];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (void)backgroundLumaGroup:(id)a3 didTransitionToLevel:(unint64_t)a4 viewsWithDifferentLevels:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v5;
  uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        char v9 = [obj objectForKey:v8];
        uint64_t v10 = [v9 integerValue];
        uint64_t v11 = 4;
        if (v10 == 2) {
          uint64_t v11 = 1;
        }
        if (v10 == 1) {
          uint64_t v12 = 2;
        }
        else {
          uint64_t v12 = v11;
        }

        int v13 = [(STUIStatusBarVisualProvider_iOS *)self regionIdentifiersForBackgroundLumaView:v8];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * j);
              v19 = [MEMORY[0x1E4F28ED0] numberWithInteger:v12];
              [v6 setObject:v19 forKeyedSubscript:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v15);
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }
  uint64_t v20 = 4;
  if (a4 == 2) {
    uint64_t v20 = 1;
  }
  if (a4 == 1) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = v20;
  }

  v22 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v22 _setAutomaticStyle:v21 additionalStylesForRegionIdentifiers:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryWifiGroup, 0);
  objc_storeStrong((id *)&self->_lumaTrackingGroup, 0);
  objc_storeStrong((id *)&self->_expandedPillPlacement, 0);
  objc_storeStrong((id *)&self->_expandedTrailingPlacements, 0);
  objc_storeStrong((id *)&self->_expandedLeadingPlacements, 0);
  objc_storeStrong((id *)&self->_expandedCellularPlacementsAffectedByAirplaneMode, 0);
  objc_storeStrong((id *)&self->_expandedNetworkGroup, 0);
  objc_destroyWeak((id *)&self->_statusBar);
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (!v8 || v8 == 3 || v8 == 1)
  {
    char v9 = objc_opt_class();
    uint64_t v10 = STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v9, v5, v6);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (Class)v10;
}

- (BOOL)wantsBackgroundActivityPillInExpandedTrailingPlacements
{
  return 0;
}

+ (BOOL)scalesWithScreenNativeScale
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

- (UIFont)clockFont
{
  return 0;
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
  BOOL v4 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  uint64_t v5 = [v4 mode];

  switch(v5)
  {
    case 0:
      [(STUIStatusBarVisualProvider_iOS *)self setOnLockScreen:0];
      id v6 = self;
      uint64_t v7 = 0;
      goto LABEL_4;
    case 1:
      [(STUIStatusBarVisualProvider_iOS *)self setOnLockScreen:0];
      id v6 = self;
      uint64_t v7 = 1;
LABEL_4:
      [(STUIStatusBarVisualProvider_iOS *)v6 setExpanded:v7];
      goto LABEL_6;
    case 2:
      [(STUIStatusBarVisualProvider_iOS *)self setExpanded:0];
      [(STUIStatusBarVisualProvider_iOS *)self setOnLockScreen:1];
LABEL_6:
      uint64_t v8 = 0;
      goto LABEL_8;
    case 3:
      [(STUIStatusBarVisualProvider_iOS *)self setExpanded:0];
      uint64_t v8 = 1;
      [(STUIStatusBarVisualProvider_iOS *)self setOnLockScreen:1];
LABEL_8:
      [(STUIStatusBarVisualProvider_iOS *)self setOnAODLockScreen:v8];
      break;
    default:
      return;
  }
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 layoutItem];
  uint64_t v8 = objc_msgSend(v7, "_ui_view");

  if (v8)
  {
    char v9 = (void *)MEMORY[0x1E4FB14D0];
    v11[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v9 _setVisuallyHighlighted:v6 forViews:v10 initialPress:v5];
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(STUIStatusBarVisualProvider_iOS *)self _applyToAppearingRegions:0 block:&__block_literal_global_2];
    [(STUIStatusBarVisualProvider_iOS *)self _applyToAppearingRegions:1 block:&__block_literal_global_28];
    id v4 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v4 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_applyToAppearingRegions:(BOOL)a3 block:(id)a4
{
  int v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(id, void *))a4;
  int v7 = [(STUIStatusBarVisualProvider_iOS *)self expanded];
  uint64_t v8 = STUIStatusBarPartIdentifierNormal;
  if (v7 == v4) {
    uint64_t v8 = STUIStatusBarPartIdentifierExpanded;
  }
  [(STUIStatusBarVisualProvider_iOS *)self regionIdentifiersForPartWithIdentifier:*v8];
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
        uint64_t v15 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
        uint64_t v16 = [v15 regions];
        v17 = [v16 objectForKeyedSubscript:v14];
        v6[2](v6, v17);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v8 == v6)
  {
    id v9 = [(STUIStatusBarVisualProvider_iOS *)self animationForAirplaneMode];
  }
  else if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(STUIStatusBarVisualProvider_iOS *)self defaultAnimationForDisplayItemWithIdentifier:v6];
  }
  uint64_t v10 = v9;

  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v8 == v6)
  {
    id v10 = [(STUIStatusBarVisualProvider_iOS *)self animationForAirplaneMode];
    goto LABEL_10;
  }
  id v9 = +[STUIStatusBarIndicatorLocationItem prominentDisplayIdentifier];
  if (v9 == v6)
  {
    uint64_t v11 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    uint64_t v12 = [v11 currentAggregatedData];
    uint64_t v13 = [v12 locationEntry];
    int v14 = [v13 isEnabled];

    if (v14)
    {
      id v10 = [(STUIStatusBarVisualProvider_iOS *)self animationForProminentLocation];
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
    id v10 = [(STUIStatusBarVisualProvider_iOS *)self defaultAnimationForDisplayItemWithIdentifier:v6];
  }
LABEL_10:
  uint64_t v15 = v10;

  return v15;
}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  double result = 0.0;
  if (a4 == 2)
  {
    id v6 = +[STUIStatusBarItem defaultDisplayIdentifier];
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

- (STUIStatusBarAnimation)animationForAirplaneMode
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
  v45[3] = __Block_byref_object_copy__1;
  v45[4] = __Block_byref_object_dispose__1;
  id v46 = 0;
  BOOL v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  int v4 = [v3 styleAttributes];
  BOOL v5 = [v4 effectiveLayoutDirection] == 1;

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke;
  v43[3] = &unk_1E6AA3D80;
  v43[4] = self;
  v43[5] = v45;
  BOOL v44 = v5;
  v43[6] = v47;
  v43[7] = v48;
  id v6 = +[STUIStatusBarAnimation animationWithBlock:v43];
  [v6 setPriority:100];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_3;
  v42[3] = &unk_1E6AA3E90;
  v42[4] = v47;
  [v6 setPrepareBlock:v42];
  id v27 = v6;
  uint64_t v26 = [MEMORY[0x1E4F1CA80] set];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  id v8 = +[STUIStatusBarItem defaultDisplayIdentifier];
  id v9 = [WeakRetained stateForDisplayItemWithIdentifier:v8];
  id v10 = [v9 potentialPlacementRegionIdentifiers];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v10;
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
        uint64_t v15 = [v14 regions];
        uint64_t v16 = [v15 objectForKeyedSubscript:v13];

        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x3032000000;
        v36[3] = __Block_byref_object_copy__1;
        v36[4] = __Block_byref_object_dispose__1;
        id v37 = 0;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_4;
        v35[3] = &unk_1E6AA3DD0;
        v35[6] = v47;
        v35[7] = v48;
        v35[8] = v36;
        v35[4] = self;
        v35[5] = v45;
        v17 = +[STUIStatusBarAnimation animationWithBlock:v35];
        [v17 setPriority:100];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_15;
        v32[3] = &unk_1E6AA3DF8;
        long long v34 = v36;
        id v18 = v16;
        id v33 = v18;
        [v17 setPrepareBlock:v32];
        long long v19 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
        uint64_t v49 = v13;
        long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
        long long v21 = [v19 displayItemIdentifiersInRegionsWithIdentifiers:v20];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __59__STUIStatusBarVisualProvider_iOS_animationForAirplaneMode__block_invoke_16;
        v28[3] = &unk_1E6AA3E20;
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
  return (STUIStatusBarAnimation *)v27;
}

- (STUIStatusBarAnimation)animationForProminentLocation
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3010000000;
  v8[3] = "";
  long long v9 = *MEMORY[0x1E4F1DAD8];
  double v2 = +[STUIStatusBarAnimation animationWithBlock:&__block_literal_global_40];
  [v2 setPriority:100];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_3;
  v7[3] = &unk_1E6AA3E68;
  v7[4] = v8;
  BOOL v3 = +[STUIStatusBarAnimation animationWithBlock:v7];
  [v3 setPriority:100];
  int v4 = +[STUIStatusBarItem defaultDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v4];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__STUIStatusBarVisualProvider_iOS_animationForProminentLocation__block_invoke_5;
  v6[3] = &unk_1E6AA3E90;
  v6[4] = v8;
  [v2 setPrepareBlock:v6];
  [v2 setDelaysAnimatingItems:1];

  _Block_object_dispose(v8, 8);
  return (STUIStatusBarAnimation *)v2;
}

- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3
{
  return STUIStatusBarDefaultScaleAnimation(self, a3, 0.75);
}

- (id)regionIdentifiersForBackgroundLumaView:(id)a3
{
  return 0;
}

- (double)leadingItemSpacing
{
  return self->_leadingItemSpacing;
}

- (BOOL)onLockScreen
{
  return self->_onLockScreen;
}

- (void)setOnLockScreen:(BOOL)a3
{
  self->_onLockScreen = a3;
}

- (BOOL)onAODLockScreen
{
  return self->_onAODLockScreen;
}

- (void)setOnAODLockScreen:(BOOL)a3
{
  self->_onAODLockScreen = a3;
}

- (STUIStatusBarDisplayItemPlacementNetworkGroup)expandedNetworkGroup
{
  return self->_expandedNetworkGroup;
}

- (STUIStatusBarDisplayItemPlacement)expandedPillPlacement
{
  return self->_expandedPillPlacement;
}

- (STUIStatusBarDisplayItemPlacementGroup)secondaryWifiGroup
{
  return self->_secondaryWifiGroup;
}

- (void)setSecondaryWifiGroup:(id)a3
{
}

@end