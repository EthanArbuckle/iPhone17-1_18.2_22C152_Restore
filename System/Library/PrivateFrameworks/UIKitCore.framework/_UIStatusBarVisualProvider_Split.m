@interface _UIStatusBarVisualProvider_Split
+ (BOOL)scalesWithScreenNativeScale;
+ (BOOL)showsLargeBatteryChargingAnimation;
+ (BOOL)shrinksSingleCharacterTypes;
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
+ (double)LTEAPlusFontSize;
+ (double)baseFontSize;
+ (double)expandedEdgeInset;
+ (double)expandedFontSize;
+ (double)height;
- (BOOL)_shouldShowSystemUpdateForDisplayItemWithIdentifier:(id)a3;
- (BOOL)_updateLowerRegionsWithData:(id)a3;
- (BOOL)canFixupDisplayItemAttributes;
- (BOOL)delayedSystemUpdateData;
- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4;
- (BOOL)supportsAnimatedCellularNetworkType;
- (BOOL)supportsCondensedBatteryPercentage;
- (CGAffineTransform)_collapseChargingBoltTransformForDisplayItem:(SEL)a3;
- (CGAffineTransform)_expandedChargingBoltTransformForDisplayItem:(SEL)a3;
- (CGSize)smallPillSize;
- (NSDictionary)orderedDisplayItemPlacements;
- (NSDirectionalEdgeInsets)expandedEdgeInsets;
- (NSLayoutConstraint)expandedLeadingLowerTopConstraint;
- (NSLayoutConstraint)expandedTrailingBottomConstraint;
- (NSTimer)airplaneModeIgnoreChangesTimer;
- (NSTimer)batteryExpansionTimer;
- (NSTimer)systemUpdatesTimer;
- (UIFont)emphasizedFont;
- (UIFont)expandedFont;
- (UIFont)normalFont;
- (UIFont)smallFont;
- (UIFont)systemUpdateFont;
- (UIFont)voiceControlFont;
- (UILayoutGuide)cutoutLayoutGuide;
- (UILayoutGuide)mainRegionsLayoutGuide;
- (_UIStatusBarDisplayItemPlacement)batteryChargingPlacement;
- (_UIStatusBarDisplayItemPlacement)dualServiceNamePlacement;
- (_UIStatusBarDisplayItemPlacement)serviceNamePlacement;
- (_UIStatusBarDisplayItemPlacementGroup)lowerWifiGroup;
- (double)airplaneObstacleFadeOutDuration;
- (double)airplaneShouldFadeForAnimationType:(int64_t)a3;
- (double)airplaneSpeedForAnimationType:(int64_t)a3;
- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4;
- (double)animatedTypeDisplayItemSpacingFactor;
- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3;
- (double)baselineBottomInset;
- (double)bottomLeadingSpace;
- (double)bottomLeadingTopOffset;
- (double)condensedPointSizeForCellularType:(int64_t)a3 defaultPointSize:(double)a4 baselineOffset:(double *)a5;
- (double)cornerRadius;
- (double)expandedIconScale;
- (double)itemSpacing;
- (double)lowerExpandedBaselineOffset;
- (double)normalIconScale;
- (id)_additionAnimationForBatteryCharging;
- (id)_orderedDisplayItemPlacements;
- (id)_removalAnimationForBatteryCharging;
- (id)_systemUpdateAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)_systemUpdateDelayedDataIdentifiers;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)animationForAirplaneMode;
- (id)animationForProminentLocation;
- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5;
- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3;
- (id)regionIdentifiersForPartWithIdentifier:(id)a3;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4;
- (id)styleAttributesForStyle:(int64_t)a3;
- (id)willUpdateWithData:(id)a3;
- (int64_t)expandedIconSize;
- (int64_t)normalIconSize;
- (void)_collapseBattery;
- (void)_delaySystemUpdateData;
- (void)_disableSystemUpdates;
- (void)_resetBattery;
- (void)_resumeSystemUpdateData;
- (void)_setupExpandedRegionsInContainerView:(id)a3 sensorHeight:(double)a4 constraints:(id *)a5 regions:(id *)a6;
- (void)_stopBatteryCollapseTimer;
- (void)_updateDataForBatteryCharging:(id)a3;
- (void)_updateDataForSystemUpdates:(id)a3;
- (void)_updateExpandedTrailingRegion;
- (void)dealloc;
- (void)itemCreated:(id)a3;
- (void)setAirplaneModeIgnoreChangesTimer:(id)a3;
- (void)setBatteryChargingPlacement:(id)a3;
- (void)setBatteryExpansionTimer:(id)a3;
- (void)setCutoutLayoutGuide:(id)a3;
- (void)setDelayedSystemUpdateData:(BOOL)a3;
- (void)setDualServiceNamePlacement:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedLeadingLowerTopConstraint:(id)a3;
- (void)setExpandedTrailingBottomConstraint:(id)a3;
- (void)setLowerWifiGroup:(id)a3;
- (void)setMainRegionsLayoutGuide:(id)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
- (void)setServiceNamePlacement:(id)a3;
- (void)setSystemUpdatesTimer:(id)a3;
- (void)updateDataForService:(id)a3;
@end

@implementation _UIStatusBarVisualProvider_Split

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  v27[9] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 _nativeDisplayBounds];
  CGFloat Width = CGRectGetWidth(v29);
  v8 = [v5 _exclusionArea];
  [v8 rect];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  v27[4] = objc_opt_class();
  v27[5] = objc_opt_class();
  v27[6] = objc_opt_class();
  v27[7] = objc_opt_class();
  v27[8] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:9];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  uint64_t v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87___UIStatusBarVisualProvider_Split_visualProviderSubclassForScreen_visualProviderInfo___block_invoke;
  v17[3] = &unk_1E53066F8;
  CGFloat v20 = Width;
  id v14 = v5;
  uint64_t v21 = v10;
  uint64_t v22 = v12;
  id v18 = v14;
  v19 = &v23;
  [v13 enumerateObjectsUsingBlock:v17];
  id v15 = (id)v24[3];

  _Block_object_dispose(&v23, 8);
  return (Class)v15;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 1;
}

+ (double)height
{
  return 47.0;
}

- (double)itemSpacing
{
  return 4.33333333;
}

+ (double)baseFontSize
{
  return 15.0;
}

+ (double)expandedFontSize
{
  [a1 baseFontSize];
  return v2 + 2.0;
}

+ (double)LTEAPlusFontSize
{
  return 13.0;
}

+ (BOOL)shrinksSingleCharacterTypes
{
  return 0;
}

- (CGSize)smallPillSize
{
  double v2 = 20.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIFont)normalFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)qword_1EB258540;
  if (qword_1EB258540) {
    BOOL v4 = _MergedGlobals_20_0 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    _MergedGlobals_20_0 = v2;
    [(id)objc_opt_class() baseFontSize];
    uint64_t v5 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:weight:");
    id v6 = (void *)qword_1EB258540;
    qword_1EB258540 = v5;

    double v3 = (void *)qword_1EB258540;
  }
  return (UIFont *)v3;
}

- (UIFont)expandedFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = *(void **)algn_1EB258548;
  if (*(void *)algn_1EB258548) {
    BOOL v4 = byte_1EB258531 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB258531 = v2;
    [(id)objc_opt_class() expandedFontSize];
    uint64_t v5 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:weight:");
    id v6 = *(void **)algn_1EB258548;
    *(void *)algn_1EB258548 = v5;

    double v3 = *(void **)algn_1EB258548;
  }
  return (UIFont *)v3;
}

- (UIFont)emphasizedFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = *(void **)&algn_1EB258548[8];
  if (*(void *)&algn_1EB258548[8]) {
    BOOL v4 = byte_1EB258532 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB258532 = v2;
    [(id)objc_opt_class() baseFontSize];
    uint64_t v6 = [off_1E52D39B8 systemFontOfSize:v5 + 2.0 weight:*(double *)off_1E52D6C00];
    v7 = *(void **)&algn_1EB258548[8];
    *(void *)&algn_1EB258548[8] = v6;

    double v3 = *(void **)&algn_1EB258548[8];
  }
  return (UIFont *)v3;
}

- (UIFont)smallFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = *(void **)&algn_1EB258548[16];
  if (*(void *)&algn_1EB258548[16]) {
    BOOL v4 = byte_1EB258533 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB258533 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:11.0 weight:*(double *)off_1E52D6BF0];
    uint64_t v6 = *(void **)&algn_1EB258548[16];
    *(void *)&algn_1EB258548[16] = v5;

    double v3 = *(void **)&algn_1EB258548[16];
  }
  return (UIFont *)v3;
}

- (UIFont)voiceControlFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = *(void **)&algn_1EB258548[24];
  if (*(void *)&algn_1EB258548[24]) {
    BOOL v4 = byte_1EB258534 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB258534 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:13.0 weight:*(double *)off_1E52D6BF0];
    uint64_t v6 = *(void **)&algn_1EB258548[24];
    *(void *)&algn_1EB258548[24] = v5;

    double v3 = *(void **)&algn_1EB258548[24];
  }
  return (UIFont *)v3;
}

- (UIFont)systemUpdateFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = *(void **)&algn_1EB258548[32];
  if (*(void *)&algn_1EB258548[32]) {
    BOOL v4 = byte_1EB258535 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB258535 = v2;
    [(id)objc_opt_class() baseFontSize];
    uint64_t v6 = [off_1E52D39B8 systemFontOfSize:v5 + 2.0 weight:*(double *)off_1E52D6BF0];
    v7 = *(void **)&algn_1EB258548[32];
    *(void *)&algn_1EB258548[32] = v6;

    double v3 = *(void **)&algn_1EB258548[32];
  }
  return (UIFont *)v3;
}

- (double)baselineBottomInset
{
  return 1.66666667;
}

- (double)lowerExpandedBaselineOffset
{
  return 25.0;
}

- (double)bottomLeadingSpace
{
  return 12.0;
}

- (double)bottomLeadingTopOffset
{
  return 7.33333333;
}

- (double)normalIconScale
{
  return 1.12;
}

- (double)expandedIconScale
{
  return 1.2992;
}

- (int64_t)normalIconSize
{
  [(_UIStatusBarVisualProvider_Split *)self normalIconScale];
  double v4 = v3;
  double v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  uint64_t v6 = [v5 _effectiveTargetScreen];
  [v6 _scale];
  if (v7 <= 2.5)
  {
    if (v4 == 1.07)
    {
      int64_t v8 = 5;
    }
    else if (v4 == 1.16)
    {
      int64_t v8 = 9;
    }
    else if (v4 == 1.2412)
    {
      int64_t v8 = 11;
    }
    else
    {
      int64_t v8 = 1;
    }
  }
  else if (v4 == 1.08)
  {
    int64_t v8 = 6;
  }
  else if (v4 == 1.06)
  {
    int64_t v8 = 4;
  }
  else if (v4 == 1.12)
  {
    int64_t v8 = 7;
  }
  else if (v4 == 1.26)
  {
    int64_t v8 = 8;
  }
  else if (v4 == 1.16)
  {
    int64_t v8 = 10;
  }
  else if (v4 == 1.2412)
  {
    int64_t v8 = 12;
  }
  else if (v4 == 1.2992)
  {
    int64_t v8 = 13;
  }
  else
  {
    int64_t v8 = 2;
  }

  return v8;
}

- (int64_t)expandedIconSize
{
  [(_UIStatusBarVisualProvider_Split *)self expandedIconScale];
  double v4 = v3;
  double v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  uint64_t v6 = [v5 _effectiveTargetScreen];
  [v6 _scale];
  if (v7 <= 2.5)
  {
    if (v4 == 1.07)
    {
      int64_t v8 = 5;
    }
    else if (v4 == 1.16)
    {
      int64_t v8 = 9;
    }
    else if (v4 == 1.2412)
    {
      int64_t v8 = 11;
    }
    else
    {
      int64_t v8 = 1;
    }
  }
  else if (v4 == 1.08)
  {
    int64_t v8 = 6;
  }
  else if (v4 == 1.06)
  {
    int64_t v8 = 4;
  }
  else if (v4 == 1.12)
  {
    int64_t v8 = 7;
  }
  else if (v4 == 1.26)
  {
    int64_t v8 = 8;
  }
  else if (v4 == 1.16)
  {
    int64_t v8 = 10;
  }
  else if (v4 == 1.2412)
  {
    int64_t v8 = 12;
  }
  else if (v4 == 1.2992)
  {
    int64_t v8 = 13;
  }
  else
  {
    int64_t v8 = 2;
  }

  return v8;
}

- (NSDirectionalEdgeInsets)expandedEdgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (double)expandedEdgeInset
{
  return 7.0;
}

- (double)cornerRadius
{
  double v2 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  double v3 = [v2 _effectiveTargetScreen];

  [v3 _displayCornerRadius];
  double v5 = v4;
  [v3 _nativeScale];
  double v7 = v5 * v6;
  [v3 _scale];
  double v9 = v7 / v8;

  return v9;
}

- (void)_setupExpandedRegionsInContainerView:(id)a3 sensorHeight:(double)a4 constraints:(id *)a5 regions:(id *)a6
{
  id v9 = *a5;
  id v118 = *a6;
  id v119 = v9;
  id v10 = a3;
  [(_UIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
  double v12 = v11;
  [(_UIStatusBarVisualProvider_Split *)self baselineBottomInset];
  double v14 = v13;
  [(_UIStatusBarVisualProvider_Split *)self expandedEdgeInsets];
  double v16 = v15;
  double v18 = v17;
  v19 = [(_UIStatusBarVisualProvider_Split *)self expandedFont];
  [v19 capHeight];
  double v21 = v20;

  uint64_t v22 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedLeading"];
  uint64_t v23 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v24 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v24 setAlignment:3];
  [(_UIStatusBarRegionAxisStackingLayout *)v24 setInterspace:v12];
  [(_UIStatusBarRegionAxesLayout *)v23 setHorizontalLayout:v24];

  uint64_t v25 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v23 setVerticalLayout:v25];

  [(_UIStatusBarRegion *)v22 setLayout:v23];
  uint64_t v26 = objc_alloc_init(UIView);
  [(_UIStatusBarRegion *)v22 setContentView:v26];

  [(_UIStatusBarRegion *)v22 setOffsetable:1];
  [(_UIStatusBarRegion *)v22 disableWithToken:10];
  v27 = [(_UIStatusBarRegion *)v22 layoutItem];
  v28 = [v27 leadingAnchor];
  CGRect v29 = [v10 leadingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:v16];
  [v119 addObject:v30];

  v31 = [v27 bottomAnchor];
  v32 = [v10 topAnchor];
  double v33 = a4 - v14;
  v34 = [v31 constraintEqualToAnchor:v32 constant:v33];
  LODWORD(v35) = 1147207680;
  v36 = objc_msgSend(v34, "_ui_constraintWithPriority:", v35);
  [v119 addObject:v36];

  v117 = v27;
  v37 = [v27 heightAnchor];
  v38 = [v37 constraintEqualToConstant:v21];
  [v119 addObject:v38];

  objc_msgSend(v10, "_ui_addSubLayoutItem:", v27);
  [v118 addObject:v22];

  v39 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedTrailing"];
  v40 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v41 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v41 setAlignment:4];
  [(_UIStatusBarRegionAxisStackingLayout *)v41 setInterspace:v12];
  [(_UIStatusBarRegionAxesLayout *)v40 setHorizontalLayout:v41];

  v42 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v40 setVerticalLayout:v42];

  [(_UIStatusBarRegion *)v39 setLayout:v40];
  v43 = objc_alloc_init(UIView);
  [(_UIStatusBarRegion *)v39 setContentView:v43];

  [(_UIStatusBarRegion *)v39 setOffsetable:1];
  [(_UIStatusBarRegion *)v39 disableWithToken:10];
  v44 = [(_UIStatusBarRegion *)v39 layoutItem];
  v45 = [v44 trailingAnchor];
  v46 = [v10 trailingAnchor];
  v47 = [v45 constraintEqualToAnchor:v46 constant:-v18];
  [v119 addObject:v47];

  v48 = [v44 bottomAnchor];
  v49 = [v10 topAnchor];
  v50 = [v48 constraintEqualToAnchor:v49 constant:v33];
  LODWORD(v51) = 1147207680;
  v52 = objc_msgSend(v50, "_ui_constraintWithPriority:", v51);
  [v119 addObject:v52];

  v53 = [v44 heightAnchor];
  v54 = [v53 constraintEqualToConstant:v21];
  [v119 addObject:v54];

  v55 = [v44 leadingAnchor];
  v56 = [v117 trailingAnchor];
  v57 = [v55 constraintEqualToAnchor:v56 constant:v12];
  [v119 addObject:v57];

  v58 = [v44 widthAnchor];
  v59 = [v117 widthAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  LODWORD(v61) = 1131741184;
  v62 = objc_msgSend(v60, "_ui_constraintWithPriority:", v61);
  [v119 addObject:v62];

  objc_msgSend(v10, "_ui_addSubLayoutItem:", v44);
  [v118 addObject:v39];

  [(_UIStatusBarVisualProvider_Split *)self lowerExpandedBaselineOffset];
  double v64 = v63;
  v65 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedLowerLeading"];
  v66 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v67 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v67 setAlignment:3];
  [(_UIStatusBarRegionAxisStackingLayout *)v67 setInterspace:v12];
  [(_UIStatusBarRegionAxesLayout *)v66 setHorizontalLayout:v67];

  v68 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v66 setVerticalLayout:v68];

  [(_UIStatusBarRegion *)v65 setLayout:v66];
  v69 = objc_alloc_init(UIView);
  [(_UIStatusBarRegion *)v65 setContentView:v69];

  [(_UIStatusBarRegion *)v65 setOffsetable:1];
  [(_UIStatusBarRegion *)v65 disableWithToken:10];
  v70 = [(_UIStatusBarRegion *)v65 layoutItem];
  v71 = [v70 bottomAnchor];
  v72 = [v10 topAnchor];
  v73 = [v71 constraintEqualToAnchor:v72 constant:v33];
  expandedLeadingLowerTopConstraint = self->_expandedLeadingLowerTopConstraint;
  self->_expandedLeadingLowerTopConstraint = v73;

  v75 = [v70 leadingAnchor];
  v76 = [v10 leadingAnchor];
  v77 = [v75 constraintEqualToAnchor:v76 constant:v16];
  [v119 addObject:v77];

  v78 = [v70 bottomAnchor];
  v79 = [v117 bottomAnchor];
  v80 = [v78 constraintEqualToAnchor:v79 constant:v64];
  [v119 addObject:v80];

  v81 = [v70 heightAnchor];
  v82 = [v81 constraintEqualToConstant:v21];
  [v119 addObject:v82];

  [v119 addObject:self->_expandedLeadingLowerTopConstraint];
  v115 = v10;
  objc_msgSend(v10, "_ui_addSubLayoutItem:", v70);

  [v118 addObject:v65];
  v83 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedLowerTrailing"];
  v84 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v85 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v85 setAlignment:4];
  [(_UIStatusBarRegionAxisStackingLayout *)v85 setInterspace:v12];
  [(_UIStatusBarRegionAxesLayout *)v84 setHorizontalLayout:v85];

  v86 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v84 setVerticalLayout:v86];

  [(_UIStatusBarRegion *)v83 setLayout:v84];
  v87 = objc_alloc_init(UIView);
  [(_UIStatusBarRegion *)v83 setContentView:v87];

  [(_UIStatusBarRegion *)v83 setOffsetable:1];
  [(_UIStatusBarRegion *)v83 disableWithToken:10];
  v88 = [(_UIStatusBarRegion *)v83 layoutItem];
  v89 = [v88 trailingAnchor];
  v90 = [v10 trailingAnchor];
  v91 = [v89 constraintEqualToAnchor:v90 constant:-v18];
  [v119 addObject:v91];

  v92 = [(_UIStatusBarRegion *)v83 layoutItem];
  v93 = [v92 heightAnchor];
  v94 = [v93 constraintEqualToConstant:v21];
  [v119 addObject:v94];

  v95 = [(_UIStatusBarRegion *)v83 layoutItem];
  v96 = [v95 bottomAnchor];
  v97 = [v70 bottomAnchor];
  v98 = [v96 constraintEqualToAnchor:v97];
  [v119 addObject:v98];

  v99 = [(_UIStatusBarRegion *)v83 layoutItem];
  v100 = [v99 bottomAnchor];
  v101 = [v44 bottomAnchor];
  v102 = [v100 constraintEqualToAnchor:v101 constant:v64];
  expandedTrailingBottomConstraint = self->_expandedTrailingBottomConstraint;
  self->_expandedTrailingBottomConstraint = v102;

  [v119 addObject:self->_expandedTrailingBottomConstraint];
  v104 = [(_UIStatusBarRegion *)v83 layoutItem];
  v105 = [v104 leadingAnchor];
  v106 = [v70 trailingAnchor];
  v107 = [v105 constraintEqualToAnchor:v106 constant:v12];
  [v119 addObject:v107];

  v108 = [(_UIStatusBarRegion *)v83 layoutItem];
  v109 = [v108 widthAnchor];
  v110 = [v70 widthAnchor];
  v111 = [v109 constraintEqualToAnchor:v110];
  LODWORD(v112) = 1131741184;
  v113 = objc_msgSend(v111, "_ui_constraintWithPriority:", v112);
  [v119 addObject:v113];

  v114 = [(_UIStatusBarRegion *)v83 layoutItem];
  objc_msgSend(v115, "_ui_addSubLayoutItem:", v114);

  [v118 addObject:v83];
}

- (id)_orderedDisplayItemPlacements
{
  v135[1] = *MEMORY[0x1E4F143B8];
  v114 = [MEMORY[0x1E4F1CA48] array];
  double v2 = +[_UIStatusBarItem defaultDisplayIdentifier];
  uint64_t v3 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v2 priority:1101];

  double v4 = +[_UIStatusBarCellularItem signalStrengthDisplayIdentifier];
  uint64_t v5 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v4 priority:1104];

  double v6 = +[_UIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
  double v7 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v6 priority:1105];
  v135[0] = v5;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:1];
  uint64_t v9 = [v7 excludingPlacements:v8];

  id v10 = +[_UIStatusBarCellularCondensedItem sosSignalStrengthDisplayIdentifier];
  double v11 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v10 priority:1109];
  v134[0] = v5;
  v134[1] = v9;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:2];
  uint64_t v13 = [v11 excludingPlacements:v12];

  double v14 = +[_UIStatusBarCellularItem warningDisplayIdentifier];
  double v15 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v14 priority:1106];
  uint64_t v133 = v5;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
  uint64_t v17 = [v15 excludingPlacements:v16];

  if ([(_UIStatusBarVisualProvider_Split *)self supportsAnimatedCellularNetworkType])
  {
    double v18 = +[_UIStatusBarCellularCondensedItem animatedTypeDisplayIdentifier];
    v19 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v18 priority:1102];
    uint64_t v132 = v3;
    double v20 = (void *)MEMORY[0x1E4F1C978];
    double v21 = &v132;
  }
  else
  {
    double v18 = +[_UIStatusBarCellularItem typeDisplayIdentifier];
    v19 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v18 priority:1102];
    uint64_t v131 = v3;
    double v20 = (void *)MEMORY[0x1E4F1C978];
    double v21 = &v131;
  }
  uint64_t v22 = [v20 arrayWithObjects:v21 count:1];
  uint64_t v23 = [v19 excludingPlacements:v22];

  v111 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v103 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v111 priority:1200];
  v129[0] = v5;
  v129[1] = v9;
  v129[2] = v13;
  v129[3] = v17;
  v129[4] = v23;
  v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:5];
  v99 = [v103 excludingPlacements:v101];
  v130[0] = v99;
  v130[1] = v5;
  v108 = (void *)v9;
  v109 = (void *)v5;
  v130[2] = v9;
  v130[3] = v13;
  v106 = (void *)v17;
  v107 = (void *)v13;
  v130[4] = v17;
  v97 = +[_UIStatusBarWifiItem signalStrengthDisplayIdentifier];
  v95 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v97 priority:1107];
  v128[0] = v23;
  v128[1] = v3;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
  uint64_t v25 = [v95 excludingPlacements:v24];
  v130[5] = v25;
  v130[6] = v23;
  +[_UIStatusBarWifiItem iconDisplayIdentifier];
  v27 = uint64_t v26 = (void *)v23;
  v28 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v27 priority:1103];
  v105 = v26;
  v127[0] = v26;
  v127[1] = v3;
  CGRect v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
  v30 = [v28 excludingPlacements:v29];
  v130[7] = v30;
  v130[8] = v3;
  v110 = (void *)v3;
  v31 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v32 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v31 priority:1108];
  v130[9] = v32;
  double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:10];
  [v114 addObjectsFromArray:v33];

  v34 = +[_UIStatusBarBatteryItem iconDisplayIdentifier];
  double v35 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v34 priority:1111];
  [v114 addObject:v35];

  if ([(id)objc_opt_class() showsLargeBatteryChargingAnimation])
  {
    v36 = +[_UIStatusBarBatteryItem chargingDisplayIdentifier];
    v37 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v36 priority:1300];
    v38 = objc_msgSend(v114, "subarrayWithRange:", 0, objc_msgSend(v114, "count") - 1);
    v39 = [v37 excludingPlacements:v38];
    v40 = [v39 disabledPlacement];
    [(_UIStatusBarVisualProvider_Split *)self setBatteryChargingPlacement:v40];

    v41 = [(_UIStatusBarVisualProvider_Split *)self batteryChargingPlacement];
    [v114 addObject:v41];
  }
  uint64_t v42 = objc_opt_class();
  v43 = +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:2500 lowPriority:2200 cellularItemClass:v42 wifiItemClass:objc_opt_class() includeCellularName:1];
  v44 = [v43 wifiGroup];
  [(_UIStatusBarVisualProvider_Split *)self setLowerWifiGroup:v44];

  v45 = [MEMORY[0x1E4F1CA48] array];
  v46 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v47 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v46 priority:5000];
  v48 = [(_UIStatusBarVisualProvider_iOS *)self expandedCellularPlacementsAffectedByAirplaneMode];
  v49 = [v43 cellularGroup];
  v50 = [v49 placementsAffectedByAirplaneMode];
  double v51 = [v48 arrayByAddingObjectsFromArray:v50];
  v52 = [v47 excludingPlacements:v51];
  [v45 addObject:v52];

  v104 = v43;
  v53 = [v43 placements];
  double v112 = v45;
  [v45 addObjectsFromArray:v53];

  v54 = [MEMORY[0x1E4F1CA48] array];
  v55 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v56 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v55 priority:2450];
  [v54 addObject:v56];

  [(_UIStatusBarVisualProvider_iOS *)self bluetoothPaddingInset];
  v57 = +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 2400, 200);
  v58 = [v57 placements];
  [v54 addObjectsFromArray:v58];

  v90 = (void *)MEMORY[0x1E4F1CA60];
  v126[0] = v114;
  v125[0] = @"trailing";
  v125[1] = @"systemUpdates";
  char v59 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_SplitStatusBarShowVPNDisconnect, @"SplitStatusBarShowVPNDisconnect", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1E8FD548C) {
    char v60 = v59;
  }
  else {
    char v60 = 1;
  }
  v102 = +[_UIStatusBarItem defaultDisplayIdentifier];
  double v61 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
  char v92 = v60;
  v100 = v61;
  if (v60)
  {
    id v118 = @"trailing";
    v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
    v96 = objc_msgSend(v61, "excludingAllPlacementsInRegions:");
    v94 = [v96 disabledPlacement];
    v119[0] = v94;
    v93 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v62 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v117 = @"trailing";
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
    v89 = v91 = v62;
    v88 = objc_msgSend(v62, "excludingAllPlacementsInRegions:");
    v87 = [v88 disabledPlacement];
    v119[1] = v87;
    v86 = +[_UIStatusBarActivityItem_Split syncStartDisplayIdentifier];
    double v63 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v116 = @"trailing";
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    v85 = v63;
    v83 = [v63 excludingAllPlacementsInRegions:v84];
    double v64 = [v83 disabledPlacement];
    v119[2] = v64;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:3];
  }
  else
  {
    v123 = @"trailing";
    v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
    v96 = objc_msgSend(v61, "excludingAllPlacementsInRegions:");
    v94 = [v96 disabledPlacement];
    v124[0] = v94;
    v93 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v66 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v122 = @"trailing";
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
    v89 = v91 = v66;
    v88 = objc_msgSend(v66, "excludingAllPlacementsInRegions:");
    v87 = [v88 disabledPlacement];
    v124[1] = v87;
    v86 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v67 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v121 = @"trailing";
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
    v85 = v67;
    v83 = [v67 excludingAllPlacementsInRegions:v84];
    double v64 = [v83 disabledPlacement];
    v124[2] = v64;
    uint64_t v82 = +[_UIStatusBarActivityItem_Split syncStartDisplayIdentifier];
    v68 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v120 = @"trailing";
    v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
    v81 = v68;
    v79 = [v68 excludingAllPlacementsInRegions:v80];
    v78 = [v79 disabledPlacement];
    v124[3] = v78;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:4];
  }
  v126[1] = v65;
  v125[2] = @"expandedLeading";
  v69 = [(_UIStatusBarVisualProvider_iOS *)self expandedLeadingPlacements];
  v126[2] = v69;
  v126[3] = v112;
  v125[3] = @"expandedLowerLeading";
  v125[4] = @"expandedLowerTrailing";
  v70 = v54;
  v126[4] = v54;
  v125[5] = @"expandedTrailing";
  v71 = [(_UIStatusBarVisualProvider_iOS *)self expandedTrailingPlacements];
  v126[5] = v71;
  v125[6] = @"bottomLeading";
  v72 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v73 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v72 priority:40];
  v115 = v73;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
  v126[6] = v74;
  v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:7];
  v76 = [v90 dictionaryWithDictionary:v75];

  if ((v92 & 1) == 0)
  {

    v65 = (void *)v82;
  }

  return v76;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacements];

  if (!v5)
  {
    double v6 = [(_UIStatusBarVisualProvider_Split *)self _orderedDisplayItemPlacements];
    [(_UIStatusBarVisualProvider_Split *)self setOrderedDisplayItemPlacements:v6];
  }
  double v7 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacements];
  double v8 = [v7 objectForKeyedSubscript:v4];

  return v8;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS____UIStatusBarVisualProvider_Split;
    objc_msgSendSuper2(&v5, sel_intrinsicContentSizeForOrientation_);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVisualProvider_Split;
  double v4 = [(_UIStatusBarVisualProvider_iOS *)&v13 styleAttributesForStyle:a3];
  uint64_t v5 = [v4 mode];
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      [(_UIStatusBarVisualProvider_Split *)self expandedIconScale];
      objc_msgSend(v4, "setIconScale:");
      objc_msgSend(v4, "setIconSize:", -[_UIStatusBarVisualProvider_Split expandedIconSize](self, "expandedIconSize"));
      uint64_t v9 = [(_UIStatusBarVisualProvider_Split *)self expandedFont];
      [v4 setFont:v9];

      id v10 = [(_UIStatusBarVisualProvider_Split *)self expandedFont];
      [v4 setEmphasizedFont:v10];

      uint64_t v8 = [(_UIStatusBarVisualProvider_Split *)self expandedFont];
      goto LABEL_6;
    }
    if (v5) {
      goto LABEL_7;
    }
  }
  [(_UIStatusBarVisualProvider_Split *)self normalIconScale];
  objc_msgSend(v4, "setIconScale:");
  objc_msgSend(v4, "setIconSize:", -[_UIStatusBarVisualProvider_Split normalIconSize](self, "normalIconSize"));
  double v6 = [(_UIStatusBarVisualProvider_Split *)self normalFont];
  [v4 setFont:v6];

  double v7 = [(_UIStatusBarVisualProvider_Split *)self emphasizedFont];
  [v4 setEmphasizedFont:v7];

  uint64_t v8 = [(_UIStatusBarVisualProvider_Split *)self smallFont];
LABEL_6:
  double v11 = (void *)v8;
  [v4 setSmallFont:v8];

LABEL_7:
  [v4 setImageNamePrefixes:&unk_1ED3F1150];
  return v4;
}

- (double)condensedPointSizeForCellularType:(int64_t)a3 defaultPointSize:(double)a4 baselineOffset:(double *)a5
{
  if ((unint64_t)(a3 - 8) < 2)
  {
    *a5 = 1.0;
    uint64_t v9 = objc_opt_class();
    [v9 LTEAPlusFontSize];
  }
  else if ((unint64_t)(a3 - 2) > 1)
  {
    *a5 = 0.666666667;
    return a4 + -1.0;
  }
  else
  {
    int v6 = [(id)objc_opt_class() shrinksSingleCharacterTypes];
    double v7 = 0.0;
    if (v6) {
      double v7 = 1.0;
    }
    return a4 - v7;
  }
  return result;
}

- (BOOL)supportsAnimatedCellularNetworkType
{
  return 1;
}

- (BOOL)supportsCondensedBatteryPercentage
{
  return 1;
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  double v4 = @"􀛳";
  if (a3 != 9) {
    double v4 = 0;
  }
  if (a3 == 8) {
    double v4 = @"􀛲";
  }
  if (a4) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5
{
  id v8 = a4;
  [v8 pointSize];
  double v10 = v9;
  -[_UIStatusBarVisualProvider_Split condensedPointSizeForCellularType:defaultPointSize:baselineOffset:](self, "condensedPointSizeForCellularType:defaultPointSize:baselineOffset:", a3, a5);
  double v12 = v11;
  if ((unint64_t)a3 <= 0xD && ((1 << a3) & 0x38C0) != 0)
  {
    objc_super v13 = [v8 fontDescriptor];
    double v14 = [v13 fontDescriptorWithSymbolicTraits:64];

    if (v12 == v10)
    {
      double v15 = off_1E52D39B8;
      double v17 = 0.0;
      double v16 = v14;
      goto LABEL_6;
    }
LABEL_4:
    double v15 = off_1E52D39B8;
    double v16 = v14;
    double v17 = v12;
LABEL_6:
    double v18 = [v15 fontWithDescriptor:v16 size:v17];

    goto LABEL_7;
  }
  double v18 = v8;
  if (v11 != v10)
  {
    double v14 = [v8 fontDescriptor];
    goto LABEL_4;
  }
LABEL_7:

  return v18;
}

- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3
{
  double result = 1.0;
  if ((unint64_t)(a3 - 6) <= 7) {
    return dbl_186B9CFF8[a3 - 6];
  }
  return result;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[_UIStatusBarItem defaultDisplayIdentifier];

  if (v5 == v4)
  {
    double v10 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
    uint64_t v11 = [(_UIStatusBarVisualProvider_Split *)self smallFont];
    goto LABEL_10;
  }
  uint64_t v6 = +[_UIStatusBarItem defaultDisplayIdentifier];
  if ((id)v6 == v4)
  {

    goto LABEL_8;
  }
  double v7 = (void *)v6;
  id v8 = +[_UIStatusBarIndicatorLocationItem prominentDisplayIdentifier];

  if (v8 == v4)
  {
LABEL_8:
    double v10 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
    uint64_t v11 = [(_UIStatusBarVisualProvider_Split *)self emphasizedFont];
    goto LABEL_10;
  }
  id v9 = +[_UIStatusBarItem defaultDisplayIdentifier];

  if (v9 != v4)
  {
    double v10 = 0;
    goto LABEL_11;
  }
  double v10 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
  [v10 setSymbolScale:1];
  uint64_t v11 = [(_UIStatusBarVisualProvider_Split *)self voiceControlFont];
LABEL_10:
  double v12 = (void *)v11;
  [v10 setFont:v11];

LABEL_11:
  return v10;
}

- (void)itemCreated:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setTypeStringProvider:self];
  }
  else
  {
    id v4 = [v11 identifier];
    id v5 = +[_UIStatusBarItem identifier];

    if (v4 == v5)
    {
      id v9 = v11;
      [(_UIStatusBarVisualProvider_Split *)self smallPillSize];
      objc_msgSend(v9, "setPillSize:");
    }
    else
    {
      uint64_t v6 = [v11 identifier];
      double v7 = +[_UIStatusBarItem identifier];

      id v8 = v11;
      if (v6 != v7) {
        goto LABEL_16;
      }
      id v9 = v11;
      if ((_UIInternalPreferenceUsesDefault(&dword_1EB2578B0, @"SplitStatusBarBatteryPercentageEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EB2578B4)
      {
        BOOL v10 = (_UIInternalPreferenceUsesDefault(&dword_1EB2578B8, @"SplitStatusBarBatteryPercentageAlwaysEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB2578BC|| [(_UIStatusBarVisualProvider_Split *)self supportsCondensedBatteryPercentage];
      }
      else
      {
        BOOL v10 = 0;
      }
      [v9 setUsesCondensedPercentageDisplay:v10];
    }
  }
  id v8 = v11;
LABEL_16:
}

- (id)willUpdateWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarVisualProvider_Split;
  id v4 = a3;
  id v5 = [(_UIStatusBarVisualProvider_Phone *)&v7 willUpdateWithData:v4];
  -[_UIStatusBarVisualProvider_Split _updateDataForBatteryCharging:](self, "_updateDataForBatteryCharging:", v4, v7.receiver, v7.super_class);
  [(_UIStatusBarVisualProvider_Split *)self _updateDataForSystemUpdates:v4];

  return v5;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqual:@"batteryPartIdentifier"])
  {
    BOOL v5 = [(_UIStatusBarVisualProvider_iOS *)self expanded];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    if (v5) {
      +[_UIStatusBarBatteryItem staticIconDisplayIdentifier];
    }
    else {
    objc_super v7 = +[_UIStatusBarBatteryItem iconDisplayIdentifier];
    }
    id v9 = [v6 setWithObject:v7];
  }
  else
  {
    if ([v4 isEqual:@"fittingLeadingPartIdentifier"])
    {
      objc_super v7 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
      {
        v16[0] = @"expandedLeading";
        id v8 = (__CFString **)v16;
      }
      else
      {
        double v15 = @"leading";
        id v8 = &v15;
      }
    }
    else
    {
      if (![v4 isEqual:@"fittingTrailingPartIdentifier"])
      {
        v12.receiver = self;
        v12.super_class = (Class)_UIStatusBarVisualProvider_Split;
        id v9 = [(_UIStatusBarVisualProvider_iOS *)&v12 displayItemIdentifiersForPartWithIdentifier:v4];
        goto LABEL_17;
      }
      objc_super v7 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
      {
        double v14 = @"expandedTrailing";
        id v8 = &v14;
      }
      else
      {
        objc_super v13 = @"trailing";
        id v8 = &v13;
      }
    }
    BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v9 = [v7 displayItemIdentifiersInRegionsWithIdentifiers:v10];
  }
LABEL_17:

  return v9;
}

- (id)_systemUpdateDelayedDataIdentifiers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
        BOOL v10 = [v8 identifier];
        id v11 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v10];
        objc_super v12 = [v9 itemWithIdentifier:v11];

        objc_super v13 = [v12 dependentEntryKeys];
        [v3 unionSet:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)_delaySystemUpdateData
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_SplitStatusBarShowVPNDisconnect, @"SplitStatusBarShowVPNDisconnect", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1E8FD548C&& ![(_UIStatusBarVisualProvider_Split *)self delayedSystemUpdateData])
  {
    [(_UIStatusBarVisualProvider_Split *)self setDelayedSystemUpdateData:1];
    id v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    double v3 = [v5 dataAggregator];
    uint64_t v4 = [(_UIStatusBarVisualProvider_Split *)self _systemUpdateDelayedDataIdentifiers];
    [v3 beginDelayingUpdatesForEntryKeys:v4];
  }
}

- (void)_resumeSystemUpdateData
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_SplitStatusBarShowVPNDisconnect, @"SplitStatusBarShowVPNDisconnect", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1E8FD548C&& [(_UIStatusBarVisualProvider_Split *)self delayedSystemUpdateData])
  {
    double v3 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    uint64_t v4 = [v3 dataAggregator];
    id v5 = [(_UIStatusBarVisualProvider_Split *)self _systemUpdateDelayedDataIdentifiers];
    [v4 endDelayingUpdatesForEntryKeys:v5];

    [(_UIStatusBarVisualProvider_Split *)self setDelayedSystemUpdateData:0];
  }
}

- (void)dealloc
{
  [(_UIStatusBarVisualProvider_Split *)self _resumeSystemUpdateData];
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarVisualProvider_Split;
  [(_UIStatusBarVisualProvider_Split *)&v3 dealloc];
}

- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarVisualProvider_Split;
  if ([(_UIStatusBarVisualProvider_iOS *)&v10 hasCustomAnimationForDisplayItemWithIdentifier:v6 removal:v4])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = +[_UIStatusBarBatteryItem chargingDisplayIdentifier];
    BOOL v7 = v8 == v6
      || [(_UIStatusBarVisualProvider_Split *)self _shouldShowSystemUpdateForDisplayItemWithIdentifier:v6];
  }
  return v7;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIStatusBarBatteryItem chargingDisplayIdentifier];

  if (v8 == v6)
  {
    uint64_t v9 = [(_UIStatusBarVisualProvider_Split *)self _additionAnimationForBatteryCharging];
  }
  else if ([(_UIStatusBarVisualProvider_Split *)self _shouldShowSystemUpdateForDisplayItemWithIdentifier:v6])
  {
    uint64_t v9 = [(_UIStatusBarVisualProvider_Split *)self _systemUpdateAnimationForDisplayItemWithIdentifier:v6];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarVisualProvider_Split;
    uint64_t v9 = [(_UIStatusBarVisualProvider_Phone *)&v12 additionAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
  }
  objc_super v10 = (void *)v9;

  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIStatusBarBatteryItem chargingDisplayIdentifier];

  if (v8 == v6)
  {
    uint64_t v9 = [(_UIStatusBarVisualProvider_Split *)self _removalAnimationForBatteryCharging];
  }
  else if ([(_UIStatusBarVisualProvider_Split *)self _shouldShowSystemUpdateForDisplayItemWithIdentifier:v6])
  {
    uint64_t v9 = [(_UIStatusBarVisualProvider_Split *)self _systemUpdateAnimationForDisplayItemWithIdentifier:v6];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarVisualProvider_Split;
    uint64_t v9 = [(_UIStatusBarVisualProvider_Phone *)&v12 removalAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
  }
  objc_super v10 = (void *)v9;

  return v10;
}

- (BOOL)canFixupDisplayItemAttributes
{
  batteryChargingPlacement = self->_batteryChargingPlacement;
  if (batteryChargingPlacement) {
    LOBYTE(batteryChargingPlacement) = ![(_UIStatusBarDisplayItemPlacement *)batteryChargingPlacement isEnabled];
  }
  return (char)batteryChargingPlacement;
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"batteryPartIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = @"trailing";
LABEL_5:
    uint64_t v7 = [v5 setWithObject:v6];
    goto LABEL_19;
  }
  if ([v4 isEqual:@"clockPartIdentifier"])
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = @"leading";
    goto LABEL_5;
  }
  if ([v4 isEqual:@"leadingPartIdentifier"])
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = @"expandedLowerLeading";
    uint64_t v9 = @"expandedLeading";
    objc_super v10 = @"bottomLeading";
LABEL_8:
    objc_msgSend(v8, "setWithObjects:", @"leading", v10, v9, v21, 0);
    uint64_t v7 = LABEL_18:;
    goto LABEL_19;
  }
  if ([v4 isEqual:@"trailingPartIdentifier"])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"trailing", @"systemUpdates", @"expandedTrailing", @"expandedLowerTrailing", 0);
    goto LABEL_18;
  }
  if ([v4 isEqual:0x1ED169E00])
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = @"bottomLeading";
    uint64_t v9 = @"systemUpdates";
    objc_super v10 = @"trailing";
    goto LABEL_8;
  }
  if ([v4 isEqual:0x1ED169E20]) {
    goto LABEL_14;
  }
  if ([v4 isEqual:0x1ED169E40])
  {
LABEL_16:
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    long long v19 = 0;
    goto LABEL_17;
  }
  if ([v4 isEqual:0x1ED169E60])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"expandedLowerLeading", @"expandedLowerTrailing", 0, v20, v22);
    goto LABEL_18;
  }
  if ([v4 isEqual:@"visibleExpandedPartIdentifier"])
  {
    double v14 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    double v15 = [v14 currentData];
    long long v16 = [v15 secondaryCellularEntry];
    if ([v16 isEnabled])
    {
      long long v17 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      unint64_t v18 = [v17 orientation] - 1;

      if (v18 <= 1)
      {
LABEL_14:
        id v11 = (void *)MEMORY[0x1E4F1CAD0];
        double v20 = @"expandedLowerTrailing";
        uint64_t v22 = 0;
        long long v19 = @"expandedLowerLeading";
LABEL_17:
        objc_msgSend(v11, "setWithObjects:", @"expandedLeading", @"expandedTrailing", v19, v20, v22);
        goto LABEL_18;
      }
    }
    else
    {
    }
    goto LABEL_16;
  }
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
LABEL_19:
  objc_super v12 = (void *)v7;

  return v12;
}

- (void)updateDataForService:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarVisualProvider_Split;
  id v4 = a3;
  [(_UIStatusBarVisualProvider_iOS *)&v10 updateDataForService:v4];
  id v5 = objc_msgSend(v4, "cellularEntry", v10.receiver, v10.super_class);
  id v6 = [v4 secondaryCellularEntry];

  if (v6)
  {
    -[_UIStatusBarDisplayItemPlacementGroup setEnabled:](self->_lowerWifiGroup, "setEnabled:", [v6 type] != 0);
    if (v5) {
      goto LABEL_7;
    }
    uint64_t v7 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    id v8 = [v7 currentAggregatedData];
    id v5 = [v8 cellularEntry];
  }
  else
  {
    if (!v5) {
      return;
    }
    uint64_t v7 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    id v8 = [v7 currentAggregatedData];
    id v6 = [v8 secondaryCellularEntry];
  }

LABEL_7:
  if ([v5 status] == 5
    || ([v5 wifiCallingEnabled] & 1) != 0
    || [v6 status] == 5)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = [v6 wifiCallingEnabled];
  }
  [(_UIStatusBarDisplayItemPlacement *)self->_serviceNamePlacement setEnabled:v9];
}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  BOOL v7 = [(_UIStatusBarVisualProvider_iOS *)self expanded];
  double result = 20.0;
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarVisualProvider_Split;
    -[_UIStatusBarVisualProvider_iOS airplaneTravelOffsetInProposedPartWithIdentifier:animationType:](&v9, sel_airplaneTravelOffsetInProposedPartWithIdentifier_animationType_, a3, a4, 20.0);
  }
  return result;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIStatusBarVisualProvider_Split;
    [(_UIStatusBarVisualProvider_iOS *)&v6 airplaneSpeedForAnimationType:a3];
  }
  else
  {
    double result = 60.0;
    if (a3 == 2) {
      return 100.0;
    }
  }
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  BOOL v5 = [(_UIStatusBarVisualProvider_iOS *)self expanded];
  double result = 0.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIStatusBarVisualProvider_Split;
    -[_UIStatusBarVisualProvider_iOS airplaneShouldFadeForAnimationType:](&v7, sel_airplaneShouldFadeForAnimationType_, a3, 0.0);
  }
  return result;
}

- (double)airplaneObstacleFadeOutDuration
{
  if (![(_UIStatusBarVisualProvider_iOS *)self expanded]) {
    return 0.15;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarVisualProvider_Split;
  [(_UIStatusBarVisualProvider_iOS *)&v4 airplaneObstacleFadeOutDuration];
  return result;
}

- (id)animationForAirplaneMode
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UIStatusBarVisualProvider_Split;
  objc_super v3 = [(_UIStatusBarVisualProvider_iOS *)&v17 animationForAirplaneMode];
  [v3 setExclusivityGroupIdentifier:@"trailing"];
  objc_super v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates", 0];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        id v11 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v10];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  [v3 setDelayedItemIdentifiers:v4];
  return v3;
}

- (id)animationForProminentLocation
{
  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBarVisualProvider_Split;
  double v2 = [(_UIStatusBarVisualProvider_iOS *)&v12 animationForProminentLocation];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x4010000000;
  v9[3] = &unk_186D7DBA7;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v10 = *MEMORY[0x1E4F1DB28];
  long long v11 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke;
  v8[3] = &unk_1E5306820;
  v8[4] = v9;
  objc_super v4 = +[_UIStatusBarAnimation animationWithBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65___UIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_4;
  v7[3] = &unk_1E5301EC8;
  v7[4] = v9;
  [v4 setPrepareBlock:v7];
  [v4 setPriority:-300];
  BOOL v5 = +[_UIStatusBarTimeItem shortTimeDisplayIdentifier];
  [v2 addSubAnimation:v4 forDisplayItemWithIdentifier:v5];

  _Block_object_dispose(v9, 8);
  return v2;
}

+ (BOOL)showsLargeBatteryChargingAnimation
{
  return 0;
}

- (void)_updateDataForBatteryCharging:(id)a3
{
  id v17 = a3;
  int v4 = [(id)objc_opt_class() showsLargeBatteryChargingAnimation];
  BOOL v5 = v17;
  if (v4)
  {
    uint64_t v6 = [v17 mainBatteryEntry];
    uint64_t v7 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    uint64_t v8 = [v7 currentAggregatedData];
    objc_super v9 = [v8 mainBatteryEntry];

    if (!v6 || !v9 || [(_UIStatusBarVisualProvider_iOS *)self expanded]) {
      goto LABEL_14;
    }
    if (![v9 state]
      && [v6 state] == 1
      && ![(_UIStatusBarDisplayItemPlacement *)self->_batteryChargingPlacement isEnabled])
    {
      long long v10 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      if ([v10 areAnimationsEnabled])
      {
        long long v11 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
        objc_super v12 = +[_UIStatusBarBatteryItem iconDisplayIdentifier];
        long long v13 = [v11 displayItemWithIdentifier:v12];
        int v14 = [v13 isEnabled];

        if (v14)
        {
          [(_UIStatusBarDisplayItemPlacement *)self->_batteryChargingPlacement setEnabled:1];
LABEL_14:

          BOOL v5 = v17;
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    long long v15 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    char v16 = [v15 areAnimationsEnabled];

    if ((v16 & 1) == 0) {
      [(_UIStatusBarVisualProvider_Split *)self _collapseBattery];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (CGAffineTransform)_collapseChargingBoltTransformForDisplayItem:(SEL)a3
{
  BOOL v5 = [a4 view];
  if ([v5 _shouldReverseLayoutDirection]) {
    double v6 = -12.0;
  }
  else {
    double v6 = 12.0;
  }

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, v6, 0.666666667);
  long long v7 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&retstr->tx;
  double result = CGAffineTransformScale(&v11, &v10, 0.1, 0.1);
  long long v9 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  return result;
}

- (CGAffineTransform)_expandedChargingBoltTransformForDisplayItem:(SEL)a3
{
  BOOL v5 = [a4 view];
  if ([v5 _shouldReverseLayoutDirection]) {
    double v6 = 7.0;
  }
  else {
    double v6 = -7.0;
  }

  return CGAffineTransformMakeTranslation(retstr, v6, -1.66666667);
}

- (id)_additionAnimationForBatteryCharging
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
  {
    id v20 = 0;
  }
  else
  {
    [(_UIStatusBarVisualProvider_Split *)self _stopBatteryCollapseTimer];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke;
    v28[3] = &unk_1E53051A0;
    unint64_t v18 = self;
    v28[4] = self;
    id v20 = +[_UIStatusBarAnimation animationWithBlock:v28];
    [v20 setPriority:200];
    [v20 setExclusivityGroupIdentifier:@"trailing"];
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3010000000;
    v27[4] = 0;
    v27[5] = 0;
    v27[3] = &unk_186D7DBA7;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_6;
    v26[3] = &unk_1E5306820;
    v26[4] = v27;
    long long v3 = +[_UIStatusBarAnimation animationWithBlock:v26];
    [v3 setPriority:200];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72___UIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_8;
    v25[3] = &unk_1E5301EC8;
    v25[4] = v27;
    [v3 setPrepareBlock:v25];
    int v4 = +[_UIStatusBarBatteryItem iconDisplayIdentifier];
    [v20 addSubAnimation:v3 forDisplayItemWithIdentifier:v4];
    id v17 = v3;

    uint64_t v19 = +[_UIStatusBarAnimation animationWithBlock:&__block_literal_global_494];
    [v19 setPriority:150];
    [v19 setPrepareBlock:&__block_literal_global_130_3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v5 = [(_UIStatusBarVisualProvider_Split *)v18 orderedDisplayItemPlacementsInRegionWithIdentifier:@"trailing"];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "identifier", v17);
          CGAffineTransform v10 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v9];
          CGAffineTransform v11 = +[_UIStatusBarItem identifier];
          char v12 = [v10 isEqual:v11];

          if ((v12 & 1) == 0) {
            [v20 addSubAnimation:v19 forDisplayItemWithIdentifier:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v6);
    }

    [v20 setDelaysDependentItems:1];
    long long v13 = (void *)MEMORY[0x1E4F1CAD0];
    int v14 = [(_UIStatusBarVisualProvider_Split *)v18 orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
    long long v15 = [v13 setWithArray:v14];
    [v20 setDelayedDisplayItemPlacements:v15];

    _Block_object_dispose(v27, 8);
  }
  return v20;
}

- (id)_removalAnimationForBatteryCharging
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
  {
    id v22 = 0;
  }
  else
  {
    [(_UIStatusBarVisualProvider_Split *)self _stopBatteryCollapseTimer];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x4010000000;
    v32[3] = &unk_186D7DBA7;
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v33 = *MEMORY[0x1E4F1DB28];
    long long v34 = v3;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke;
    v31[3] = &unk_1E5306768;
    v31[4] = self;
    v31[5] = v32;
    id v20 = self;
    int v4 = +[_UIStatusBarAnimation animationWithBlock:v31];
    [v4 setPriority:200];
    [v4 setExclusivityGroupIdentifier:@"trailing"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_5;
    v30[3] = &unk_1E5301EC8;
    v30[4] = v32;
    [v4 setPrepareBlock:v30];
    id v22 = v4;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3010000000;
    v29[4] = 0;
    v29[5] = 0;
    v29[3] = &unk_186D7DBA7;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_6;
    v28[3] = &unk_1E5306768;
    void v28[5] = v29;
    v28[4] = self;
    BOOL v5 = +[_UIStatusBarAnimation animationWithBlock:v28];
    [v5 setPriority:200];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __71___UIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_9;
    v27[3] = &unk_1E5301EC8;
    v27[4] = v29;
    [v5 setPrepareBlock:v27];
    uint64_t v6 = +[_UIStatusBarBatteryItem iconDisplayIdentifier];
    [v4 addSubAnimation:v5 forDisplayItemWithIdentifier:v6];
    uint64_t v19 = v5;

    long long v21 = +[_UIStatusBarAnimation animationWithBlock:&__block_literal_global_134_1];
    [v21 setPriority:150];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [(_UIStatusBarVisualProvider_Split *)v20 orderedDisplayItemPlacementsInRegionWithIdentifier:@"trailing"];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          CGAffineTransform v11 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "identifier", v19);
          char v12 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v11];
          long long v13 = +[_UIStatusBarItem identifier];
          char v14 = [v12 isEqual:v13];

          if ((v14 & 1) == 0) {
            [v4 addSubAnimation:v21 forDisplayItemWithIdentifier:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v8);
    }

    [v4 setDelaysDependentItems:1];
    long long v15 = (void *)MEMORY[0x1E4F1CAD0];
    char v16 = [(_UIStatusBarVisualProvider_Split *)v20 orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
    id v17 = [v15 setWithArray:v16];
    [v4 setDelayedDisplayItemPlacements:v17];

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v32, 8);
  }
  return v22;
}

- (void)_stopBatteryCollapseTimer
{
  batteryExpansionTimer = self->_batteryExpansionTimer;
  if (batteryExpansionTimer)
  {
    [(NSTimer *)batteryExpansionTimer invalidate];
    [(_UIStatusBarVisualProvider_Split *)self setBatteryExpansionTimer:0];
  }
}

- (void)_collapseBattery
{
  if ([(_UIStatusBarDisplayItemPlacement *)self->_batteryChargingPlacement isEnabled])
  {
    [(_UIStatusBarDisplayItemPlacement *)self->_batteryChargingPlacement setEnabled:0];
    long long v3 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    [v3 updateWithAnimations:MEMORY[0x1E4F1CBF0]];

    int v4 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    char v5 = [v4 areAnimationsEnabled];

    if ((v5 & 1) == 0)
    {
      [(_UIStatusBarVisualProvider_Split *)self _resetBattery];
    }
  }
}

- (void)_resetBattery
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v3 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  int v4 = +[_UIStatusBarBatteryItem chargingDisplayIdentifier];
  char v5 = [v3 displayItemWithIdentifier:v4];

  uint64_t v6 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  uint64_t v7 = +[_UIStatusBarBatteryItem iconDisplayIdentifier];
  uint64_t v8 = [v6 displayItemWithIdentifier:v7];

  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v30[0] = *MEMORY[0x1E4F1DAB8];
  long long v22 = v30[0];
  v30[1] = v23;
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v21 = v31;
  long long v24 = v5;
  [v5 setTransform:v30];
  v29[0] = v22;
  v29[1] = v23;
  v29[2] = v21;
  [v8 setTransform:v29];
  uint64_t v9 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  CGAffineTransform v10 = +[_UIStatusBarItem identifier];
  CGAffineTransform v11 = [v9 itemWithIdentifier:v10];

  [v11 setHighlighted:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v12 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"trailing"];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
        unint64_t v18 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
        uint64_t v19 = [v17 identifier];
        id v20 = [v18 displayItemWithIdentifier:v19];

        [v20 setAlpha:1.0];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v14);
  }
}

- (void)_updateDataForSystemUpdates:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  int v4 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  if (![v4 areAnimationsEnabled])
  {

    goto LABEL_29;
  }
  BOOL v5 = [(_UIStatusBarVisualProvider_iOS *)self expanded];

  if (v5)
  {
LABEL_29:
    [(_UIStatusBarVisualProvider_Split *)self _disableSystemUpdates];
    goto LABEL_30;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
  uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v30)
  {
    uint64_t v6 = self;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v9 = [(_UIStatusBarVisualProvider_iOS *)v6 statusBar];
        CGAffineTransform v10 = [v8 identifier];
        CGAffineTransform v11 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v10];
        char v12 = [v9 itemWithIdentifier:v11];

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v13 = [v12 dependentEntryKeys];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v35;
          long long v31 = v12;
          uint64_t v32 = i;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              uint64_t v19 = [v33 valueForKey:v18];
              if (!v19) {
                goto LABEL_24;
              }
              id v20 = (void *)v19;
              long long v21 = v6;
              long long v22 = [(_UIStatusBarVisualProvider_iOS *)v6 statusBar];
              long long v23 = [v22 currentAggregatedData];
              long long v24 = [v23 valueForKey:v18];

              long long v25 = [v8 identifier];
              long long v26 = +[_UIStatusBarItem defaultDisplayIdentifier];

              int v27 = [v20 isEnabled];
              if (v25 == v26)
              {
                if ((v27 & 1) != 0 || ([v24 isEnabled] & 1) == 0)
                {
LABEL_23:

                  uint64_t v6 = v21;
LABEL_24:

                  char v12 = v31;
                  uint64_t i = v32;
                  goto LABEL_25;
                }
              }
              else if (!v27 || [v24 isEnabled])
              {
                goto LABEL_23;
              }

              uint64_t v6 = v21;
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
            char v12 = v31;
            uint64_t i = v32;
            if (v15) {
              continue;
            }
            break;
          }
        }

        [v8 setEnabled:1];
LABEL_25:
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v30);
  }

LABEL_30:
}

- (BOOL)_shouldShowSystemUpdateForDisplayItemWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates", 0];
    uint64_t v5 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v6);
          }
          id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) identifier];

          if (v9 == v4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (id)_systemUpdateAnimationForDisplayItemWithIdentifier:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  uint64_t v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  char v6 = [v5 _shouldReverseLayoutDirection];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke;
  v39[3] = &unk_1E5306790;
  v39[4] = self;
  char v41 = v6;
  id v7 = v4;
  id v40 = v7;
  uint64_t v8 = +[_UIStatusBarAnimation animationWithBlock:v39];
  [v8 setPriority:300];
  [v8 setExclusivityGroupIdentifier:@"trailing"];
  [v8 setPrepareBlock:&__block_literal_global_136_1];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_9;
  v37[3] = &unk_1E53051A0;
  id v9 = v7;
  id v38 = v9;
  CGAffineTransform v10 = +[_UIStatusBarAnimation animationWithBlock:v37];
  [v10 setPriority:300];
  [v10 setIdentifier:@"systemUpdateItem"];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __87___UIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_11;
  v35[3] = &unk_1E53067B8;
  id v26 = v9;
  id v36 = v26;
  [v10 setPrepareBlock:v35];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v11 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"trailing"];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v31 + 1) + 8 * i) identifier];
        [v8 addSubAnimation:v10 forDisplayItemWithIdentifier:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v13);
  }

  id v17 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v18 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = [*(id *)(*((void *)&v27 + 1) + 8 * j) identifier];
        long long v24 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v23];
        [v17 addObject:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v42 count:16];
    }
    while (v20);
  }

  [v8 setDelayedItemIdentifiers:v17];
  [v8 setDelaysDependentItems:1];

  return v8;
}

- (void)_disableSystemUpdates
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates", 0];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setEnabled:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_updateLowerRegionsWithData:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v5 = [v4 secondaryCellularEntry];
  if (v5)
  {
    uint64_t v6 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    if ([v5 isEnabled]) {
      BOOL v7 = (unint64_t)([v6 orientation] - 1) < 2;
    }
    else {
      BOOL v7 = 0;
    }
    long long v8 = [(_UIStatusBarVisualProvider_Split *)self regionIdentifiersForPartWithIdentifier:0x1ED169E60];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64___UIStatusBarVisualProvider_Split__updateLowerRegionsWithData___block_invoke;
    v12[3] = &unk_1E53062E8;
    id v9 = v6;
    BOOL v15 = v7;
    id v13 = v9;
    uint64_t v14 = &v16;
    [v8 enumerateObjectsUsingBlock:v12];

    [(NSLayoutConstraint *)self->_expandedLeadingLowerTopConstraint setActive:v7];
  }
  char v10 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)_updateExpandedTrailingRegion
{
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
  {
    uint64_t v3 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    id v4 = (void *)UIApp;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65___UIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke;
    v6[3] = &unk_1E52D9F98;
    id v7 = v3;
    long long v8 = self;
    id v5 = v3;
    [v4 _performBlockAfterCATransactionCommits:v6];
  }
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded] != a3)
  {
    [(_UIStatusBarVisualProvider_Split *)self _stopBatteryCollapseTimer];
    if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
    {
      id v5 = [(_UIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
      uint64_t v6 = [v5 pillIconPlacement];
      [v6 setEnabled:1];

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __48___UIStatusBarVisualProvider_Split_setExpanded___block_invoke;
      v9[3] = &unk_1E52D9F70;
      void v9[4] = self;
      +[UIView performWithoutAnimation:v9];
    }
    id v7 = [(_UIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
    [v7 updatePill];

    v8.receiver = self;
    v8.super_class = (Class)_UIStatusBarVisualProvider_Split;
    [(_UIStatusBarVisualProvider_iOS *)&v8 setExpanded:v3];
  }
}

- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarVisualProvider_Split;
  id v4 = [(_UIStatusBarVisualProvider_iOS *)&v9 defaultAnimationForDisplayItemWithIdentifier:a3];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(_UIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
  id v7 = [v5 setWithArray:v6];
  [v4 setDelayedDisplayItemPlacements:v7];

  return v4;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
}

- (double)animatedTypeDisplayItemSpacingFactor
{
  return self->_animatedTypeDisplayItemSpacingFactor;
}

- (_UIStatusBarDisplayItemPlacement)serviceNamePlacement
{
  return self->_serviceNamePlacement;
}

- (void)setServiceNamePlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)dualServiceNamePlacement
{
  return self->_dualServiceNamePlacement;
}

- (void)setDualServiceNamePlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacementGroup)lowerWifiGroup
{
  return self->_lowerWifiGroup;
}

- (void)setLowerWifiGroup:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)batteryChargingPlacement
{
  return self->_batteryChargingPlacement;
}

- (void)setBatteryChargingPlacement:(id)a3
{
}

- (UILayoutGuide)cutoutLayoutGuide
{
  return self->_cutoutLayoutGuide;
}

- (void)setCutoutLayoutGuide:(id)a3
{
}

- (UILayoutGuide)mainRegionsLayoutGuide
{
  return self->_mainRegionsLayoutGuide;
}

- (void)setMainRegionsLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)expandedLeadingLowerTopConstraint
{
  return self->_expandedLeadingLowerTopConstraint;
}

- (void)setExpandedLeadingLowerTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)expandedTrailingBottomConstraint
{
  return self->_expandedTrailingBottomConstraint;
}

- (void)setExpandedTrailingBottomConstraint:(id)a3
{
}

- (NSTimer)systemUpdatesTimer
{
  return self->_systemUpdatesTimer;
}

- (void)setSystemUpdatesTimer:(id)a3
{
}

- (NSTimer)batteryExpansionTimer
{
  return self->_batteryExpansionTimer;
}

- (void)setBatteryExpansionTimer:(id)a3
{
}

- (NSTimer)airplaneModeIgnoreChangesTimer
{
  return self->_airplaneModeIgnoreChangesTimer;
}

- (void)setAirplaneModeIgnoreChangesTimer:(id)a3
{
}

- (BOOL)delayedSystemUpdateData
{
  return self->_delayedSystemUpdateData;
}

- (void)setDelayedSystemUpdateData:(BOOL)a3
{
  self->_delayedSystemUpdateData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplaneModeIgnoreChangesTimer, 0);
  objc_storeStrong((id *)&self->_batteryExpansionTimer, 0);
  objc_storeStrong((id *)&self->_systemUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_expandedLeadingLowerTopConstraint, 0);
  objc_storeStrong((id *)&self->_mainRegionsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_cutoutLayoutGuide, 0);
  objc_storeStrong((id *)&self->_batteryChargingPlacement, 0);
  objc_storeStrong((id *)&self->_lowerWifiGroup, 0);
  objc_storeStrong((id *)&self->_dualServiceNamePlacement, 0);
  objc_storeStrong((id *)&self->_serviceNamePlacement, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end