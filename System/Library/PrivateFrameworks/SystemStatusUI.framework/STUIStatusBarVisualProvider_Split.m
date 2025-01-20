@interface STUIStatusBarVisualProvider_Split
+ (BOOL)scalesWithScreenNativeScale;
+ (BOOL)showsLargeBatteryChargingAnimation;
+ (BOOL)shrinksSingleCharacterTypes;
+ (BOOL)supportsDisplayingRingerStatus;
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
+ (double)LTEAPlusFontSize;
+ (double)baseFontSize;
+ (double)expandedEdgeInset;
+ (double)expandedFontSize;
+ (double)height;
- (BOOL)_updateLowerRegionsWithData:(id)a3;
- (BOOL)canFixupDisplayItemAttributes;
- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4;
- (BOOL)supportsAnimatedCellularNetworkType;
- (BOOL)supportsCondensedBatteryPercentage;
- (CGAffineTransform)_collapseChargingBoltTransformForDisplayItem:(void *)a3;
- (CGSize)smallPillSize;
- (NSDictionary)orderedDisplayItemPlacements;
- (NSDirectionalEdgeInsets)expandedEdgeInsets;
- (NSLayoutConstraint)expandedLeadingBannerConstraint;
- (NSLayoutConstraint)expandedLeadingLowerTopConstraint;
- (NSLayoutConstraint)expandedTopMiddleConstraint;
- (NSLayoutConstraint)expandedTrailingBannerConstraint;
- (NSLayoutConstraint)expandedTrailingBottomConstraint;
- (NSTimer)airplaneModeIgnoreChangesTimer;
- (NSTimer)batteryExpansionTimer;
- (NSTimer)systemUpdatesTimer;
- (STUIStatusBarDisplayItemPlacement)batteryChargingPlacement;
- (STUIStatusBarDisplayItemPlacement)dualServiceNamePlacement;
- (STUIStatusBarDisplayItemPlacement)serviceNamePlacement;
- (STUIStatusBarDisplayItemPlacement)voiceControlPillPlacement;
- (STUIStatusBarDisplayItemPlacementGroup)lowerWifiGroup;
- (UIFont)emphasizedFont;
- (UIFont)expandedFont;
- (UIFont)normalFont;
- (UIFont)smallFont;
- (UIFont)systemUpdateFont;
- (UIFont)voiceControlFont;
- (UILayoutGuide)cutoutLayoutGuide;
- (UILayoutGuide)mainRegionsLayoutGuide;
- (_UILumaTrackingBackdropView)leadingBackgroundLumaView;
- (_UILumaTrackingBackdropView)trailingBackgroundLumaView;
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
- (double)grabberHeight;
- (double)itemSpacing;
- (double)lowerExpandedBaselineOffset;
- (double)normalIconScale;
- (id)_controlCenterGrabberAnimation;
- (id)_orderedDisplayItemPlacements;
- (id)_systemUpdateAnimationForDisplayItemWithIdentifier:(void *)a1;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)animationForAirplaneMode;
- (id)animationForProminentLocation;
- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5;
- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)delayedSystemUpdateDataToken;
- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3;
- (id)regionIdentifiersForBackgroundLumaView:(id)a3;
- (id)regionIdentifiersForPartWithIdentifier:(id)a3;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4;
- (id)styleAttributesForStyle:(int64_t)a3;
- (id)willUpdateWithData:(id)a3;
- (int64_t)expandedIconSize;
- (int64_t)normalIconSize;
- (uint64_t)_shouldShowSystemUpdateForDisplayItemWithIdentifier:(void *)a1;
- (void)_collapseBattery;
- (void)_disableSystemUpdates;
- (void)_resetBattery;
- (void)_resumeSystemUpdateData;
- (void)_setupExpandedRegionsInContainerView:(id)a3 sensorHeight:(double)a4 constraints:(id *)a5 regions:(id *)a6;
- (void)_updateExpandedConstraintsForAvoidanceFrame:(CGRect)a3;
- (void)dealloc;
- (void)itemCreated:(id)a3;
- (void)setAirplaneModeIgnoreChangesTimer:(id)a3;
- (void)setBatteryChargingPlacement:(id)a3;
- (void)setBatteryExpansionTimer:(id)a3;
- (void)setCutoutLayoutGuide:(id)a3;
- (void)setDelayedSystemUpdateDataToken:(id)a3;
- (void)setDualServiceNamePlacement:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedLeadingBannerConstraint:(id)a3;
- (void)setExpandedLeadingLowerTopConstraint:(id)a3;
- (void)setExpandedTopMiddleConstraint:(id)a3;
- (void)setExpandedTrailingBannerConstraint:(id)a3;
- (void)setExpandedTrailingBottomConstraint:(id)a3;
- (void)setLeadingBackgroundLumaView:(id)a3;
- (void)setLowerWifiGroup:(id)a3;
- (void)setMainRegionsLayoutGuide:(id)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
- (void)setServiceNamePlacement:(id)a3;
- (void)setSystemUpdatesTimer:(id)a3;
- (void)setTrailingBackgroundLumaView:(id)a3;
- (void)setVoiceControlPillPlacement:(id)a3;
- (void)statusBarRegionsUpdated;
- (void)updateDataForService:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_Split

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacements];

  if (!v5)
  {
    v6 = [(STUIStatusBarVisualProvider_Split *)self _orderedDisplayItemPlacements];
    [(STUIStatusBarVisualProvider_Split *)self setOrderedDisplayItemPlacements:v6];
  }
  v7 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacements];
  v8 = [v7 objectForKeyedSubscript:v4];

  return v8;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v5 == v4)
  {
    v10 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
    uint64_t v11 = [(STUIStatusBarVisualProvider_Split *)self smallFont];
    goto LABEL_10;
  }
  uint64_t v6 = +[STUIStatusBarItem defaultDisplayIdentifier];
  if ((id)v6 == v4)
  {

    goto LABEL_8;
  }
  v7 = (void *)v6;
  id v8 = +[STUIStatusBarIndicatorLocationItem prominentDisplayIdentifier];

  if (v8 == v4)
  {
LABEL_8:
    v10 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
    uint64_t v11 = [(STUIStatusBarVisualProvider_Split *)self emphasizedFont];
    goto LABEL_10;
  }
  id v9 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v9 != v4)
  {
    v10 = 0;
    goto LABEL_11;
  }
  v10 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  [v10 setSymbolScale:1];
  uint64_t v11 = [(STUIStatusBarVisualProvider_Split *)self voiceControlFont];
LABEL_10:
  v12 = (void *)v11;
  [v10 setFont:v11];

LABEL_11:
  return v10;
}

- (void)itemCreated:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 setTypeStringProvider:self];
  }
  else
  {
    id v4 = [v13 identifier];
    id v5 = +[STUIStatusBarItem identifier];

    if (v4 == v5)
    {
      id v9 = v13;
      [(STUIStatusBarVisualProvider_Split *)self smallPillSize];
      objc_msgSend(v9, "setPillSize:");
    }
    else
    {
      uint64_t v6 = [v13 identifier];
      v7 = +[STUIStatusBarItem identifier];

      id v8 = v13;
      if (v6 != v7) {
        goto LABEL_12;
      }
      id v9 = v13;
      v10 = +[STUIStatusBarSettingsDomain rootSettings];
      uint64_t v11 = [v10 itemSettings];
      BOOL v12 = ([v11 batteryPercentageAlwaysEnabled] & 1) != 0
         || [(STUIStatusBarVisualProvider_Split *)self supportsCondensedBatteryPercentage];
      [v9 setUsesCondensedPercentageDisplay:v12];
    }
  }
  id v8 = v13;
LABEL_12:
}

- (BOOL)supportsCondensedBatteryPercentage
{
  return 1;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarVisualProvider_Split;
  id v4 = [(STUIStatusBarVisualProvider_iOS *)&v16 styleAttributesForStyle:a3];
  switch([v4 mode])
  {
    case 0:
    case 2:
      goto LABEL_4;
    case 1:
      [(STUIStatusBarVisualProvider_Split *)self expandedIconScale];
      objc_msgSend(v4, "setIconScale:");
      objc_msgSend(v4, "setIconSize:", -[STUIStatusBarVisualProvider_Split expandedIconSize](self, "expandedIconSize"));
      id v5 = [(STUIStatusBarVisualProvider_Split *)self expandedFont];
      [v4 setFont:v5];

      uint64_t v6 = [(STUIStatusBarVisualProvider_Split *)self expandedFont];
      [v4 setEmphasizedFont:v6];

      uint64_t v7 = [(STUIStatusBarVisualProvider_Split *)self expandedFont];
      goto LABEL_5;
    case 3:
      id v8 = [MEMORY[0x1E4FB1618] labelColor];
      id v9 = [v8 colorWithAlphaComponent:0.8];
      [v4 setTextColor:v9];

      v10 = [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v11 = [v10 colorWithAlphaComponent:0.8];
      [v4 setImageTintColor:v11];

LABEL_4:
      [(STUIStatusBarVisualProvider_Split *)self normalIconScale];
      objc_msgSend(v4, "setIconScale:");
      objc_msgSend(v4, "setIconSize:", -[STUIStatusBarVisualProvider_Split normalIconSize](self, "normalIconSize"));
      BOOL v12 = [(STUIStatusBarVisualProvider_Split *)self normalFont];
      [v4 setFont:v12];

      id v13 = [(STUIStatusBarVisualProvider_Split *)self emphasizedFont];
      [v4 setEmphasizedFont:v13];

      uint64_t v7 = [(STUIStatusBarVisualProvider_Split *)self smallFont];
LABEL_5:
      v14 = (void *)v7;
      [v4 setSmallFont:v7];

      break;
    default:
      break;
  }
  [v4 setImageNamePrefixes:&unk_1F2F9CA98];
  return v4;
}

- (UIFont)normalFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)qword_1EA87ED38;
  if (qword_1EA87ED38) {
    BOOL v4 = _MergedGlobals_8 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    _MergedGlobals_8 = IsBoldTextEnabled;
    id v5 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() baseFontSize];
    uint64_t v6 = objc_msgSend(v5, "systemFontOfSize:weight:");
    uint64_t v7 = (void *)qword_1EA87ED38;
    qword_1EA87ED38 = v6;

    v3 = (void *)qword_1EA87ED38;
  }
  return (UIFont *)v3;
}

- (UIFont)emphasizedFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EA87ED48;
  if (unk_1EA87ED48) {
    BOOL v4 = byte_1EA87ED2A == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EA87ED2A = IsBoldTextEnabled;
    id v5 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() baseFontSize];
    uint64_t v7 = [v5 systemFontOfSize:v6 + 2.0 weight:*MEMORY[0x1E4FB09E0]];
    id v8 = (void *)unk_1EA87ED48;
    unk_1EA87ED48 = v7;

    v3 = (void *)unk_1EA87ED48;
  }
  return (UIFont *)v3;
}

- (UIFont)smallFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EA87ED50;
  if (unk_1EA87ED50) {
    BOOL v4 = byte_1EA87ED2B == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EA87ED2B = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB09D0]];
    double v6 = (void *)unk_1EA87ED50;
    unk_1EA87ED50 = v5;

    v3 = (void *)unk_1EA87ED50;
  }
  return (UIFont *)v3;
}

- (int64_t)normalIconSize
{
  [(STUIStatusBarVisualProvider_Split *)self normalIconScale];
  double v4 = v3;
  uint64_t v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  double v6 = [v5 _effectiveTargetScreen];
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
    v5.super_class = (Class)&OBJC_METACLASS___STUIStatusBarVisualProvider_Split;
    objc_msgSendSuper2(&v5, sel_intrinsicContentSizeForOrientation_);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 1;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqual:@"batteryPartIdentifier"])
  {
    if ([(STUIStatusBarVisualProvider_iOS *)self expanded]
      || ([(id)objc_opt_class() showsLargeBatteryChargingAnimation] & 1) == 0)
    {
      objc_super v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = +[STUIStatusBarBatteryItem staticIconDisplayIdentifier];
    }
    else
    {
      objc_super v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
    }
    double v7 = (void *)v6;
    id v9 = [v5 setWithObject:v6];
  }
  else
  {
    if ([v4 isEqual:@"fittingLeadingPartIdentifier"])
    {
      double v7 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      if ([(STUIStatusBarVisualProvider_iOS *)self expanded])
      {
        v16[0] = @"expandedLeading";
        int64_t v8 = (__CFString **)v16;
      }
      else
      {
        v15 = @"leading";
        int64_t v8 = &v15;
      }
    }
    else
    {
      if (![v4 isEqual:@"fittingTrailingPartIdentifier"])
      {
        v12.receiver = self;
        v12.super_class = (Class)STUIStatusBarVisualProvider_Split;
        id v9 = [(STUIStatusBarVisualProvider_iOS *)&v12 displayItemIdentifiersForPartWithIdentifier:v4];
        goto LABEL_18;
      }
      double v7 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      if ([(STUIStatusBarVisualProvider_iOS *)self expanded])
      {
        v14 = @"expandedTrailing";
        int64_t v8 = &v14;
      }
      else
      {
        id v13 = @"trailing";
        int64_t v8 = &v13;
      }
    }
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v9 = [v7 displayItemIdentifiersInRegionsWithIdentifiers:v10];
  }
LABEL_18:

  return v9;
}

- (BOOL)canFixupDisplayItemAttributes
{
  batteryChargingPlacement = self->_batteryChargingPlacement;
  if (batteryChargingPlacement) {
    LOBYTE(batteryChargingPlacement) = ![(STUIStatusBarDisplayItemPlacement *)batteryChargingPlacement isEnabled];
  }
  return (char)batteryChargingPlacement;
}

- (UILayoutGuide)cutoutLayoutGuide
{
  return self->_cutoutLayoutGuide;
}

- (UILayoutGuide)mainRegionsLayoutGuide
{
  return self->_mainRegionsLayoutGuide;
}

- (UIFont)systemUpdateFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)unk_1EA87ED60;
  if (unk_1EA87ED60) {
    BOOL v4 = byte_1EA87ED2D == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EA87ED2D = IsBoldTextEnabled;
    objc_super v5 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() baseFontSize];
    uint64_t v7 = [v5 systemFontOfSize:v6 + 2.0 weight:*MEMORY[0x1E4FB09D0]];
    int64_t v8 = (void *)unk_1EA87ED60;
    unk_1EA87ED60 = v7;

    double v3 = (void *)unk_1EA87ED60;
  }
  return (UIFont *)v3;
}

- (double)bottomLeadingSpace
{
  return 12.0;
}

- (_UILumaTrackingBackdropView)trailingBackgroundLumaView
{
  return self->_trailingBackgroundLumaView;
}

- (void)setTrailingBackgroundLumaView:(id)a3
{
}

- (void)setMainRegionsLayoutGuide:(id)a3
{
}

- (void)setLeadingBackgroundLumaView:(id)a3
{
}

- (void)setCutoutLayoutGuide:(id)a3
{
}

- (_UILumaTrackingBackdropView)leadingBackgroundLumaView
{
  return self->_leadingBackgroundLumaView;
}

- (double)grabberHeight
{
  return 2.33333333;
}

- (void)_setupExpandedRegionsInContainerView:(id)a3 sensorHeight:(double)a4 constraints:(id *)a5 regions:(id *)a6
{
  id v9 = *a5;
  id v125 = *a6;
  id v126 = v9;
  id v10 = a3;
  [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
  double v12 = v11;
  [(STUIStatusBarVisualProvider_Split *)self baselineBottomInset];
  double v14 = v13;
  [(STUIStatusBarVisualProvider_Split *)self expandedEdgeInsets];
  double v16 = v15;
  double v18 = v17;
  v19 = [(STUIStatusBarVisualProvider_Split *)self expandedFont];
  [v19 capHeight];
  double v21 = v20;

  v22 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedLeading"];
  v23 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v24 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v24 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v24 setInterspace:v12];
  [(STUIStatusBarRegionAxesLayout *)v23 setHorizontalLayout:v24];

  v25 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v23 setVerticalLayout:v25];

  [(STUIStatusBarRegion *)v22 setLayout:v23];
  id v26 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(STUIStatusBarRegion *)v22 setContentView:v26];

  [(STUIStatusBarRegion *)v22 setOffsetable:1];
  [(STUIStatusBarRegion *)v22 disableWithToken:10];
  v27 = [(STUIStatusBarRegion *)v22 layoutItem];
  v28 = [v27 trailingAnchor];
  v29 = [v10 centerXAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:0.0];
  expandedLeadingBannerConstraint = self->_expandedLeadingBannerConstraint;
  self->_expandedLeadingBannerConstraint = v30;

  v32 = [v27 leadingAnchor];
  v33 = [v10 leadingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:v16];
  [v126 addObject:v34];

  v35 = [v27 bottomAnchor];
  v36 = [v10 topAnchor];
  double v37 = a4 - v14;
  v38 = [v35 constraintEqualToAnchor:v36 constant:v37];
  LODWORD(v39) = 1147207680;
  v40 = objc_msgSend(v38, "_ui_constraintWithPriority:", v39);
  [v126 addObject:v40];

  v41 = [v27 heightAnchor];
  v42 = [v41 constraintEqualToConstant:v21];
  [v126 addObject:v42];

  v124 = v27;
  objc_msgSend(v10, "_ui_addSubLayoutItem:", v27);

  [v125 addObject:v22];
  v43 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedTrailing"];
  v44 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v45 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v45 setAlignment:4];
  [(STUIStatusBarRegionAxisStackingLayout *)v45 setInterspace:v12];
  [(STUIStatusBarRegionAxesLayout *)v44 setHorizontalLayout:v45];

  v46 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v44 setVerticalLayout:v46];

  [(STUIStatusBarRegion *)v43 setLayout:v44];
  id v47 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(STUIStatusBarRegion *)v43 setContentView:v47];

  [(STUIStatusBarRegion *)v43 setOffsetable:1];
  [(STUIStatusBarRegion *)v43 disableWithToken:10];
  v48 = [(STUIStatusBarRegion *)v43 layoutItem];
  v49 = [v48 leadingAnchor];
  v50 = [v27 trailingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50 constant:v12];
  expandedTopMiddleConstraint = self->_expandedTopMiddleConstraint;
  self->_expandedTopMiddleConstraint = v51;

  v53 = [v48 leadingAnchor];
  v54 = [v10 centerXAnchor];
  v55 = [v53 constraintEqualToAnchor:v54 constant:0.0];
  expandedTrailingBannerConstraint = self->_expandedTrailingBannerConstraint;
  self->_expandedTrailingBannerConstraint = v55;

  v57 = [v48 trailingAnchor];
  v58 = [v10 trailingAnchor];
  v59 = [v57 constraintEqualToAnchor:v58 constant:-v18];
  [v126 addObject:v59];

  v60 = [v48 bottomAnchor];
  v61 = [v10 topAnchor];
  v62 = [v60 constraintEqualToAnchor:v61 constant:v37];
  LODWORD(v63) = 1147207680;
  v64 = objc_msgSend(v62, "_ui_constraintWithPriority:", v63);
  [v126 addObject:v64];

  v65 = [v48 heightAnchor];
  v66 = [v65 constraintEqualToConstant:v21];
  [v126 addObject:v66];

  [v126 addObject:self->_expandedTopMiddleConstraint];
  v67 = [v48 widthAnchor];
  v68 = [v124 widthAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  LODWORD(v70) = 1131741184;
  v71 = objc_msgSend(v69, "_ui_constraintWithPriority:", v70);
  [v126 addObject:v71];

  objc_msgSend(v10, "_ui_addSubLayoutItem:", v48);
  [v125 addObject:v43];

  [(STUIStatusBarVisualProvider_Split *)self lowerExpandedBaselineOffset];
  double v73 = v72;
  v74 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedLowerLeading"];
  v75 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v76 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v76 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v76 setInterspace:v12];
  [(STUIStatusBarRegionAxesLayout *)v75 setHorizontalLayout:v76];

  v77 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v75 setVerticalLayout:v77];

  [(STUIStatusBarRegion *)v74 setLayout:v75];
  id v78 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(STUIStatusBarRegion *)v74 setContentView:v78];

  [(STUIStatusBarRegion *)v74 setOffsetable:1];
  [(STUIStatusBarRegion *)v74 disableWithToken:10];
  v79 = [(STUIStatusBarRegion *)v74 layoutItem];
  v80 = [v79 bottomAnchor];
  v81 = [v10 topAnchor];
  v82 = [v80 constraintEqualToAnchor:v81 constant:v37];
  expandedLeadingLowerTopConstraint = self->_expandedLeadingLowerTopConstraint;
  self->_expandedLeadingLowerTopConstraint = v82;

  v84 = [v79 leadingAnchor];
  v85 = [v10 leadingAnchor];
  v86 = [v84 constraintEqualToAnchor:v85 constant:v16];
  [v126 addObject:v86];

  v87 = [v79 bottomAnchor];
  v88 = [v124 bottomAnchor];
  v89 = [v87 constraintEqualToAnchor:v88 constant:v73];
  [v126 addObject:v89];

  v90 = [v79 heightAnchor];
  v91 = [v90 constraintEqualToConstant:v21];
  [v126 addObject:v91];

  [v126 addObject:self->_expandedLeadingLowerTopConstraint];
  objc_msgSend(v10, "_ui_addSubLayoutItem:", v79);

  [v125 addObject:v74];
  v92 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedLowerTrailing"];
  v93 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v94 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v94 setAlignment:4];
  [(STUIStatusBarRegionAxisStackingLayout *)v94 setInterspace:v12];
  [(STUIStatusBarRegionAxesLayout *)v93 setHorizontalLayout:v94];

  v95 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v93 setVerticalLayout:v95];

  [(STUIStatusBarRegion *)v92 setLayout:v93];
  id v96 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(STUIStatusBarRegion *)v92 setContentView:v96];

  [(STUIStatusBarRegion *)v92 setOffsetable:1];
  [(STUIStatusBarRegion *)v92 disableWithToken:10];
  v97 = [(STUIStatusBarRegion *)v92 layoutItem];
  v98 = [v97 trailingAnchor];
  v99 = [v10 trailingAnchor];
  v100 = [v98 constraintEqualToAnchor:v99 constant:-v18];
  [v126 addObject:v100];

  v101 = [(STUIStatusBarRegion *)v92 layoutItem];
  v102 = [v101 heightAnchor];
  v103 = [v102 constraintEqualToConstant:v21];
  [v126 addObject:v103];

  v104 = [(STUIStatusBarRegion *)v92 layoutItem];
  v105 = [v104 bottomAnchor];
  v106 = [v79 bottomAnchor];
  v107 = [v105 constraintEqualToAnchor:v106];
  [v126 addObject:v107];

  v108 = [(STUIStatusBarRegion *)v92 layoutItem];
  v109 = [v108 bottomAnchor];
  v110 = [v48 bottomAnchor];
  v111 = [v109 constraintEqualToAnchor:v110 constant:v73];
  expandedTrailingBottomConstraint = self->_expandedTrailingBottomConstraint;
  self->_expandedTrailingBottomConstraint = v111;

  [v126 addObject:self->_expandedTrailingBottomConstraint];
  v113 = [(STUIStatusBarRegion *)v92 layoutItem];
  v114 = [v113 leadingAnchor];
  v115 = [v79 trailingAnchor];
  v116 = [v114 constraintEqualToAnchor:v115 constant:v12];
  [v126 addObject:v116];

  v117 = [(STUIStatusBarRegion *)v92 layoutItem];
  v118 = [v117 widthAnchor];
  v119 = [v79 widthAnchor];
  v120 = [v118 constraintEqualToAnchor:v119];
  LODWORD(v121) = 1131741184;
  v122 = objc_msgSend(v120, "_ui_constraintWithPriority:", v121);
  [v126 addObject:v122];

  v123 = [(STUIStatusBarRegion *)v92 layoutItem];
  objc_msgSend(v10, "_ui_addSubLayoutItem:", v123);

  [v125 addObject:v92];
}

- (double)lowerExpandedBaselineOffset
{
  return 25.0;
}

- (UIFont)expandedFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)unk_1EA87ED40;
  if (unk_1EA87ED40) {
    BOOL v4 = byte_1EA87ED29 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EA87ED29 = IsBoldTextEnabled;
    objc_super v5 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() expandedFontSize];
    uint64_t v6 = objc_msgSend(v5, "systemFontOfSize:weight:");
    uint64_t v7 = (void *)unk_1EA87ED40;
    unk_1EA87ED40 = v6;

    double v3 = (void *)unk_1EA87ED40;
  }
  return (UIFont *)v3;
}

- (double)baselineBottomInset
{
  return 1.66666667;
}

- (void)dealloc
{
  -[STUIStatusBarVisualProvider_Split _resumeSystemUpdateData](self);
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarVisualProvider_Split;
  [(STUIStatusBarVisualProvider_Split *)&v3 dealloc];
}

- (void)_resumeSystemUpdateData
{
  if (a1)
  {
    v2 = [a1 delayedSystemUpdateDataToken];

    if (v2)
    {
      objc_super v3 = [a1 statusBar];
      BOOL v4 = [v3 dataAggregator];
      objc_super v5 = [a1 delayedSystemUpdateDataToken];
      [v4 endDelayingUpdates:v5];

      [a1 setDelayedSystemUpdateDataToken:0];
    }
  }
}

- (id)delayedSystemUpdateDataToken
{
  return self->_delayedSystemUpdateDataToken;
}

- (uint64_t)_shouldShowSystemUpdateForDisplayItemWithIdentifier:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && ([a1 expanded] & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    objc_super v5 = objc_msgSend(a1, "orderedDisplayItemPlacementsInRegionWithIdentifier:", @"systemUpdates", 0);
    uint64_t v4 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v5);
          }
          id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) identifier];

          if (v8 == v3)
          {
            uint64_t v4 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v4 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (STUIStatusBarDisplayItemPlacement)serviceNamePlacement
{
  return self->_serviceNamePlacement;
}

- (STUIStatusBarDisplayItemPlacement)dualServiceNamePlacement
{
  return self->_dualServiceNamePlacement;
}

- (void)setServiceNamePlacement:(id)a3
{
}

- (void)setDualServiceNamePlacement:(id)a3
{
}

- (id)_orderedDisplayItemPlacements
{
  v221[3] = *MEMORY[0x1E4F143B8];
  v187 = [MEMORY[0x1E4F1CA48] array];
  id v3 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v170 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v3 priority:996];

  uint64_t v4 = +[STUIStatusBarIndicatorQuietModeItem emphasizedQuietModeIdentifier];
  objc_super v5 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v4 priority:997];

  uint64_t v6 = +[STUIStatusBarIndicatorLocationItem groupWithPriority:1000];
  uint64_t v7 = +[STUIStatusBarCellularItem nameDisplayIdentifier];
  id v8 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v7 priority:1010];
  id v9 = [v6 prominentPlacement];
  v221[0] = v9;
  long long v10 = [v6 regularPlacement];
  v221[1] = v10;
  v221[2] = v5;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v221 count:3];
  long long v12 = [v8 excludingPlacements:v11];
  [(STUIStatusBarVisualProvider_Split *)self setServiceNamePlacement:v12];

  long long v13 = +[STUIStatusBarCellularCondensedItem dualNameDisplayIdentifier];
  double v14 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v13 priority:1011];
  uint64_t v15 = [v6 prominentPlacement];
  v220[0] = v15;
  double v16 = [v6 regularPlacement];
  v220[1] = v16;
  v220[2] = v5;
  double v17 = [(STUIStatusBarVisualProvider_Split *)self serviceNamePlacement];
  v220[3] = v17;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v220 count:4];
  v19 = [v14 excludingPlacements:v18];
  [(STUIStatusBarVisualProvider_Split *)self setDualServiceNamePlacement:v19];

  double v20 = +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
  double v21 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v20 priority:1012];
  v22 = [(STUIStatusBarVisualProvider_Split *)self serviceNamePlacement];
  v219[0] = v22;
  v23 = [(STUIStatusBarVisualProvider_Split *)self dualServiceNamePlacement];
  v219[1] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v219 count:2];
  uint64_t v25 = [v21 excludingPlacements:v24];

  id v26 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v27 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v26 priority:1014];
  v28 = [v6 prominentPlacement];
  v218[0] = v28;
  v181 = v6;
  v29 = [v6 regularPlacement];
  v218[1] = v29;
  v218[2] = v5;
  v182 = v5;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v218 count:3];
  v31 = [v27 excludingPlacements:v30];
  [(STUIStatusBarVisualProvider_Split *)self setVoiceControlPillPlacement:v31];

  v180 = (void *)v25;
  v217[0] = v25;
  v32 = [(STUIStatusBarVisualProvider_Split *)self serviceNamePlacement];
  v217[1] = v32;
  v33 = [(STUIStatusBarVisualProvider_Split *)self dualServiceNamePlacement];
  v217[2] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v217 count:3];
  [v187 addObjectsFromArray:v34];

  v183 = self;
  if ([(id)objc_opt_class() supportsDisplayingRingerStatus])
  {
    [v187 addObject:v170];
    v216 = v170;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v216 count:1];
    v36 = [v35 arrayByAddingObjectsFromArray:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v36 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v37 = [v36 arrayByAddingObject:v5];
  v169 = v36;
  v185 = [v5 excludingPlacements:v36];
  uint64_t v214 = v25;
  v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v214 count:1];
  v176 = [v185 requiringAllPlacements:v178];
  v215[0] = v176;
  v173 = [v6 regularPlacement];
  v38 = [v173 excludingPlacements:v37];
  uint64_t v213 = v25;
  double v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v213 count:1];
  v40 = [v38 requiringAllPlacements:v39];
  v215[1] = v40;
  v41 = [v6 prominentPlacement];
  v168 = (void *)v37;
  v42 = [v41 excludingPlacements:v37];
  v212 = v180;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v212 count:1];
  v44 = [v42 requiringAllPlacements:v43];
  v215[2] = v44;
  v45 = [(STUIStatusBarVisualProvider_Split *)v183 voiceControlPillPlacement];
  v215[3] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v215 count:4];
  [v187 addObjectsFromArray:v46];

  v186 = [MEMORY[0x1E4F1CA48] array];
  id v47 = +[STUIStatusBarItem defaultDisplayIdentifier];
  uint64_t v48 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v47 priority:1101];

  v49 = +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier];
  uint64_t v50 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v49 priority:1104];

  v51 = +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
  v52 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v51 priority:1105];
  uint64_t v211 = v50;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v211 count:1];
  uint64_t v54 = [v52 excludingPlacements:v53];

  v55 = +[STUIStatusBarCellularItem sosDisplayIdentifier];
  uint64_t v56 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v55 priority:1100];

  v57 = +[STUIStatusBarCellularCondensedItem sosSignalStrengthDisplayIdentifier];
  v58 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v57 priority:1109];
  v210[0] = v50;
  v210[1] = v54;
  v210[2] = v56;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v210 count:3];
  v179 = [v58 excludingPlacements:v59];

  v60 = +[STUIStatusBarCellularItem warningDisplayIdentifier];
  v61 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v60 priority:1106];
  uint64_t v209 = v50;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v209 count:1];
  v177 = [v61 excludingPlacements:v62];

  if ([(STUIStatusBarVisualProvider_Split *)v183 supportsAnimatedCellularNetworkType])
  {
    double v63 = +[STUIStatusBarCellularCondensedItem animatedTypeDisplayIdentifier];
    v64 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v63 priority:1102];
    uint64_t v208 = v48;
    v65 = (void *)MEMORY[0x1E4F1C978];
    v66 = &v208;
  }
  else
  {
    double v63 = +[STUIStatusBarCellularItem typeDisplayIdentifier];
    v64 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v63 priority:1102];
    uint64_t v207 = v48;
    v65 = (void *)MEMORY[0x1E4F1C978];
    v66 = &v207;
  }
  v67 = [v65 arrayWithObjects:v66 count:1];
  uint64_t v68 = [v64 excludingPlacements:v67];

  v174 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v171 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v174 priority:1200];
  v205[0] = v50;
  v205[1] = v54;
  v205[2] = v179;
  v205[3] = v177;
  v205[4] = v56;
  v205[5] = v68;
  v161 = [MEMORY[0x1E4F1C978] arrayWithObjects:v205 count:6];
  v159 = [v171 excludingPlacements:v161];
  v206[0] = v159;
  v165 = (void *)v54;
  v166 = (void *)v50;
  v206[1] = v50;
  v206[2] = v54;
  v206[3] = v179;
  v206[4] = v177;
  v164 = (void *)v56;
  v206[5] = v56;
  v157 = +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier];
  v69 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v157 priority:1107];
  v204[0] = v68;
  v204[1] = v48;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v204 count:2];
  v71 = double v70 = (void *)v48;
  double v72 = [v69 excludingPlacements:v71];
  v206[6] = v72;
  v206[7] = v68;
  double v73 = +[STUIStatusBarWifiItem iconDisplayIdentifier];
  v74 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v73 priority:1103];
  v163 = (void *)v68;
  v203[0] = v68;
  v203[1] = v70;
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:2];
  v76 = [v74 excludingPlacements:v75];
  v206[8] = v76;
  v167 = v70;
  v206[9] = v70;
  v77 = +[STUIStatusBarItem defaultDisplayIdentifier];
  id v78 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v77 priority:1108];
  v206[10] = v78;
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v206 count:11];
  [v186 addObjectsFromArray:v79];

  unint64_t v80 = 0x1E6AA2000uLL;
  if ([(id)objc_opt_class() showsLargeBatteryChargingAnimation])
  {
    v81 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
    v82 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v81 priority:1111];
    [v186 addObject:v82];

    v83 = +[STUIStatusBarBatteryItem chargingDisplayIdentifier];
    v84 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v83 priority:1300];
    v85 = objc_msgSend(v186, "subarrayWithRange:", 0, objc_msgSend(v186, "count") - 1);
    v86 = [v84 excludingPlacements:v85];
    v87 = [v86 disabledPlacement];
    [(STUIStatusBarVisualProvider_Split *)v183 setBatteryChargingPlacement:v87];

    unint64_t v80 = 0x1E6AA2000;
    v88 = [(STUIStatusBarVisualProvider_Split *)v183 batteryChargingPlacement];
    [v186 addObject:v88];
  }
  else
  {
    v88 = +[STUIStatusBarBatteryItem staticIconDisplayIdentifier];
    v89 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v88 priority:1111];
    [v186 addObject:v89];
  }
  uint64_t v90 = objc_opt_class();
  v91 = +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:2500 lowPriority:2200 cellularItemClass:v90 wifiItemClass:objc_opt_class() includeCellularName:1];
  v92 = [v91 wifiGroup];
  [(STUIStatusBarVisualProvider_Split *)v183 setLowerWifiGroup:v92];

  v93 = [MEMORY[0x1E4F1CA48] array];
  v94 = *(void **)(v80 + 3192);
  v95 = +[STUIStatusBarItem defaultDisplayIdentifier];
  id v96 = [v94 placementWithIdentifier:v95 priority:5000];
  v97 = [(STUIStatusBarVisualProvider_iOS *)v183 expandedCellularPlacementsAffectedByAirplaneMode];
  v98 = [v91 cellularGroup];
  v99 = [v98 placementsAffectedByAirplaneMode];
  v100 = [v97 arrayByAddingObjectsFromArray:v99];
  v101 = [v96 excludingPlacements:v100];
  [v93 addObject:v101];

  v162 = v91;
  v102 = [v91 placements];
  v175 = v93;
  [v93 addObjectsFromArray:v102];

  v103 = [MEMORY[0x1E4F1CA48] array];
  v104 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v105 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v104 priority:2450];
  [v103 addObject:v105];

  [(STUIStatusBarVisualProvider_iOS *)v183 bluetoothPaddingInset];
  v106 = +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 2400, 200);
  v107 = [v106 placements];
  v172 = v103;
  [v103 addObjectsFromArray:v107];

  v108 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v109 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v108 priority:1996];
  v202 = @"trailing";
  v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v202 count:1];
  v111 = [v109 excludingAllPlacementsInRegions:v110];
  uint64_t v112 = [v111 disabledPlacement];

  v147 = (void *)MEMORY[0x1E4F1CA60];
  v200[0] = @"leading";
  v200[1] = @"trailing";
  v201[0] = v187;
  v201[1] = v186;
  v200[2] = @"systemUpdates";
  v158 = +[STUIStatusBarSettingsDomain rootSettings];
  v156 = [v158 visualProviderSettings];
  LODWORD(v108) = [v156 showVPNDisconnect];
  v155 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v113 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
  int v149 = (int)v108;
  v154 = v113;
  if (v108)
  {
    v198 = @"trailing";
    v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v198 count:1];
    v152 = objc_msgSend(v113, "excludingAllPlacementsInRegions:");
    v151 = [v152 disabledPlacement];
    v199[0] = v151;
    v150 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v114 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v197 = @"trailing";
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
    v146 = v148 = v114;
    v145 = objc_msgSend(v114, "excludingAllPlacementsInRegions:");
    v144 = [v145 disabledPlacement];
    v199[1] = v144;
    v143 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v115 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v196 = @"trailing";
    v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v196 count:1];
    v142 = v115;
    v140 = [v115 excludingAllPlacementsInRegions:v141];
    v139 = [v140 disabledPlacement];
    v199[2] = v139;
    uint64_t v136 = +[STUIStatusBarActivityItem_Split syncStartDisplayIdentifier];
    v116 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v195 = @"trailing";
    v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v195 count:1];
    v135 = v116;
    v133 = [v116 excludingAllPlacementsInRegions:v134];
    v132 = [v133 disabledPlacement];
    v199[3] = v132;
    v199[4] = v112;
    uint64_t v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:v199 count:5];
  }
  else
  {
    v193 = @"trailing";
    v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1];
    v152 = objc_msgSend(v113, "excludingAllPlacementsInRegions:");
    v151 = [v152 disabledPlacement];
    v194[0] = v151;
    v150 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v118 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v192 = @"trailing";
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v192 count:1];
    v146 = v148 = v118;
    v145 = objc_msgSend(v118, "excludingAllPlacementsInRegions:");
    v144 = [v145 disabledPlacement];
    v194[1] = v144;
    v143 = +[STUIStatusBarActivityItem_Split syncStartDisplayIdentifier];
    v119 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:");
    v191 = @"trailing";
    v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];
    v142 = v119;
    v140 = [v119 excludingAllPlacementsInRegions:v141];
    v139 = [v140 disabledPlacement];
    v194[2] = v139;
    v194[3] = v112;
    uint64_t v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:4];
  }
  v138 = (void *)v117;
  v201[2] = v117;
  v200[3] = @"controlCenter";
  v137 = +[STUIStatusBarControlCenterItem grabberIdentifier];
  v120 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v137 priority:1995];
  v160 = (void *)v112;
  uint64_t v189 = v112;
  double v121 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1];
  v122 = [v120 requiringAllPlacements:v121];
  v190 = v122;
  v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v190 count:1];
  v201[3] = v123;
  v200[4] = @"expandedLeading";
  v124 = [(STUIStatusBarVisualProvider_iOS *)v183 expandedLeadingPlacements];
  v201[4] = v124;
  v201[5] = v93;
  v200[5] = @"expandedLowerLeading";
  v200[6] = @"expandedLowerTrailing";
  v201[6] = v172;
  v200[7] = @"expandedTrailing";
  id v125 = [(STUIStatusBarVisualProvider_iOS *)v183 expandedTrailingPlacements];
  v201[7] = v125;
  v200[8] = @"bottomLeading";
  id v126 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v127 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v126 priority:40];
  v188 = v127;
  v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v188 count:1];
  v201[8] = v128;
  v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v201 forKeys:v200 count:9];
  id v184 = [v147 dictionaryWithDictionary:v129];

  v130 = v138;
  if (v149)
  {

    v130 = (void *)v136;
  }

  return v184;
}

- (id)willUpdateWithData:(id)a3
{
  id v3 = self;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)STUIStatusBarVisualProvider_Split;
  id v4 = a3;
  objc_super v5 = [(STUIStatusBarVisualProvider_Phone *)&v49 willUpdateWithData:v4];
  id v42 = v4;
  if (!v3)
  {

    id v40 = v42;
    goto LABEL_45;
  }
  id v47 = v3;
  if ([(id)objc_opt_class() showsLargeBatteryChargingAnimation])
  {
    uint64_t v6 = [v42 mainBatteryEntry];
    uint64_t v7 = [(STUIStatusBarVisualProvider_iOS *)v3 statusBar];
    id v8 = [v7 currentAggregatedData];
    id v9 = [v8 mainBatteryEntry];

    if (!v6 || !v9 || [(STUIStatusBarVisualProvider_iOS *)v3 expanded]) {
      goto LABEL_15;
    }
    if (![v9 state]
      && [v6 state] == 1
      && ![(STUIStatusBarDisplayItemPlacement *)v3->_batteryChargingPlacement isEnabled])
    {
      long long v10 = [(STUIStatusBarVisualProvider_iOS *)v3 statusBar];
      if ([v10 areAnimationsEnabled])
      {
        long long v11 = [(STUIStatusBarVisualProvider_iOS *)v3 statusBar];
        long long v12 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
        long long v13 = [v11 displayItemWithIdentifier:v12];
        int v14 = [v13 isEnabled];

        id v3 = v47;
        if (v14)
        {
          [(STUIStatusBarDisplayItemPlacement *)v47->_batteryChargingPlacement setEnabled:1];
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    uint64_t v15 = [(STUIStatusBarVisualProvider_iOS *)v3 statusBar];
    char v16 = [v15 areAnimationsEnabled];

    if ((v16 & 1) == 0) {
      -[STUIStatusBarVisualProvider_Split _collapseBattery]((id *)&v3->super.super.super.isa);
    }
    goto LABEL_15;
  }
LABEL_16:

  id v48 = v42;
  double v17 = [(STUIStatusBarVisualProvider_iOS *)v3 statusBar];
  if (![v17 areAnimationsEnabled])
  {

    goto LABEL_44;
  }
  BOOL v18 = [(STUIStatusBarVisualProvider_iOS *)v3 expanded];

  if (v18)
  {
LABEL_44:
    -[STUIStatusBarVisualProvider_Split _disableSystemUpdates](v3);
    goto LABEL_45;
  }
  v41 = v5;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = [(STUIStatusBarVisualProvider_Split *)v3 orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
  uint64_t v45 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(obj);
        }
        double v20 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        double v21 = [(STUIStatusBarVisualProvider_iOS *)v3 statusBar];
        v22 = [v20 identifier];
        v23 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v22];
        v24 = [v21 itemWithIdentifier:v23];

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v25 = [v24 dependentEntryKeys];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v51;
          v46 = v24;
          while (2)
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v51 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v50 + 1) + 8 * j);
              uint64_t v31 = [v48 valueForKey:v30];
              if (!v31) {
                goto LABEL_39;
              }
              v32 = (void *)v31;
              v33 = [(STUIStatusBarVisualProvider_iOS *)v3 statusBar];
              v34 = [v33 currentAggregatedData];
              v35 = [v34 valueForKey:v30];

              v36 = [v20 identifier];
              uint64_t v37 = +[STUIStatusBarItem defaultDisplayIdentifier];

              int v38 = [v32 isEnabled];
              if (v36 == v37)
              {
                if ((v38 & 1) != 0 || ([v35 isEnabled] & 1) == 0)
                {
LABEL_38:

                  id v3 = v47;
LABEL_39:

                  v24 = v46;
                  goto LABEL_40;
                }
              }
              else if (!v38 || [v35 isEnabled])
              {
                goto LABEL_38;
              }

              id v3 = v47;
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
            v24 = v46;
            if (v27) {
              continue;
            }
            break;
          }
        }

        [v20 setEnabled:1];
LABEL_40:
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v45);
  }

  objc_super v5 = v41;
LABEL_45:

  return v5;
}

- (void)statusBarRegionsUpdated
{
  if (self)
  {
    if ([(STUIStatusBarVisualProvider_iOS *)self expanded])
    {
      id v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      id v4 = (void *)*MEMORY[0x1E4FB2608];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __66__STUIStatusBarVisualProvider_Split__updateExpandedTrailingRegion__block_invoke;
      v6[3] = &unk_1E6AA39F0;
      id v7 = v3;
      id v8 = self;
      id v5 = v3;
      [v4 _performBlockAfterCATransactionCommits:v6];
    }
  }
}

+ (BOOL)showsLargeBatteryChargingAnimation
{
  return 0;
}

- (void)updateDataForService:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STUIStatusBarVisualProvider_Split;
  id v4 = a3;
  [(STUIStatusBarVisualProvider_iOS *)&v10 updateDataForService:v4];
  id v5 = objc_msgSend(v4, "cellularEntry", v10.receiver, v10.super_class);
  uint64_t v6 = [v4 secondaryCellularEntry];

  if (v6)
  {
    -[STUIStatusBarDisplayItemPlacementGroup setEnabled:](self->_lowerWifiGroup, "setEnabled:", [v6 type] != 0);
    if (v5) {
      goto LABEL_7;
    }
    id v7 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    id v8 = [v7 currentAggregatedData];
    id v5 = [v8 cellularEntry];
  }
  else
  {
    if (!v5) {
      return;
    }
    id v7 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    id v8 = [v7 currentAggregatedData];
    uint64_t v6 = [v8 secondaryCellularEntry];
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
  [(STUIStatusBarDisplayItemPlacement *)self->_serviceNamePlacement setEnabled:v9];
}

- (BOOL)_updateLowerRegionsWithData:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v5 = [v4 secondaryCellularEntry];
  if (v5)
  {
    uint64_t v6 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    if ([v5 isEnabled]) {
      BOOL v7 = (unint64_t)([v6 orientation] - 1) < 2;
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = [(STUIStatusBarVisualProvider_Split *)self regionIdentifiersForPartWithIdentifier:@"expandedBottomPartIdentifier"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__STUIStatusBarVisualProvider_Split__updateLowerRegionsWithData___block_invoke;
    v12[3] = &unk_1E6AA37E8;
    id v9 = v6;
    BOOL v15 = v7;
    id v13 = v9;
    int v14 = &v16;
    [v8 enumerateObjectsUsingBlock:v12];

    [(NSLayoutConstraint *)self->_expandedLeadingLowerTopConstraint setActive:v7];
  }
  char v10 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)_disableSystemUpdates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v1 = objc_msgSend(a1, "orderedDisplayItemPlacementsInRegionWithIdentifier:", @"systemUpdates", 0);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setEnabled:0];
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }
  }
}

- (BOOL)supportsAnimatedCellularNetworkType
{
  return 1;
}

- (void)setLowerWifiGroup:(id)a3
{
}

- (BOOL)hasCustomAnimationForDisplayItemWithIdentifier:(id)a3 removal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUIStatusBarVisualProvider_Split;
  if ([(STUIStatusBarVisualProvider_iOS *)&v11 hasCustomAnimationForDisplayItemWithIdentifier:v6 removal:v4])
  {
    char v7 = 1;
  }
  else
  {
    id v8 = +[STUIStatusBarBatteryItem chargingDisplayIdentifier];
    if (v8 == v6)
    {
      char v7 = 1;
    }
    else
    {
      id v9 = +[STUIStatusBarControlCenterItem grabberIdentifier];
      if (v9 == v6) {
        char v7 = 1;
      }
      else {
        char v7 = -[STUIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, v6);
      }
    }
  }

  return v7;
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"batteryPartIdentifier"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = @"trailing";
LABEL_5:
    uint64_t v7 = [v5 setWithObject:v6];
    goto LABEL_19;
  }
  if ([v4 isEqual:@"clockPartIdentifier"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = @"leading";
    goto LABEL_5;
  }
  if ([v4 isEqual:@"leadingPartIdentifier"])
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    double v21 = @"expandedLowerLeading";
    v23 = 0;
    id v9 = @"expandedLeading";
    char v10 = @"bottomLeading";
LABEL_8:
    objc_msgSend(v8, "setWithObjects:", @"leading", v10, v9, v21, v23, v24);
    uint64_t v7 = LABEL_18:;
    goto LABEL_19;
  }
  if ([v4 isEqual:@"trailingPartIdentifier"])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"trailing", @"systemUpdates", @"controlCenter", @"expandedTrailing", @"expandedLowerTrailing", 0);
    goto LABEL_18;
  }
  if ([v4 isEqual:@"normalPartIdentifier"])
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    v23 = @"bottomLeading";
    uint64_t v24 = 0;
    double v21 = @"controlCenter";
    id v9 = @"systemUpdates";
    char v10 = @"trailing";
    goto LABEL_8;
  }
  if ([v4 isEqual:@"expandedPartIdentifier"]) {
    goto LABEL_14;
  }
  if ([v4 isEqual:@"expandedPartTopIdentifier"])
  {
LABEL_16:
    objc_super v11 = (void *)MEMORY[0x1E4F1CAD0];
    char v19 = 0;
    goto LABEL_17;
  }
  if ([v4 isEqual:@"expandedBottomPartIdentifier"])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"expandedLowerLeading", @"expandedLowerTrailing", 0, v20, v22, v24);
    goto LABEL_18;
  }
  if ([v4 isEqual:@"visibleExpandedPartIdentifier"])
  {
    int v14 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    BOOL v15 = [v14 currentData];
    uint64_t v16 = [v15 secondaryCellularEntry];
    if ([v16 isEnabled])
    {
      double v17 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      unint64_t v18 = [v17 orientation] - 1;

      if (v18 <= 1)
      {
LABEL_14:
        objc_super v11 = (void *)MEMORY[0x1E4F1CAD0];
        double v20 = @"expandedLowerTrailing";
        uint64_t v22 = 0;
        char v19 = @"expandedLowerLeading";
LABEL_17:
        objc_msgSend(v11, "setWithObjects:", @"expandedLeading", @"expandedTrailing", v19, v20, v22, v24);
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
  long long v12 = (void *)v7;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBackgroundLumaView, 0);
  objc_storeStrong((id *)&self->_leadingBackgroundLumaView, 0);
  objc_storeStrong(&self->_delayedSystemUpdateDataToken, 0);
  objc_storeStrong((id *)&self->_airplaneModeIgnoreChangesTimer, 0);
  objc_storeStrong((id *)&self->_batteryExpansionTimer, 0);
  objc_storeStrong((id *)&self->_systemUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_expandedTopMiddleConstraint, 0);
  objc_storeStrong((id *)&self->_expandedTrailingBannerConstraint, 0);
  objc_storeStrong((id *)&self->_expandedLeadingBannerConstraint, 0);
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_expandedLeadingLowerTopConstraint, 0);
  objc_storeStrong((id *)&self->_mainRegionsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_cutoutLayoutGuide, 0);
  objc_storeStrong((id *)&self->_batteryChargingPlacement, 0);
  objc_storeStrong((id *)&self->_lowerWifiGroup, 0);
  objc_storeStrong((id *)&self->_voiceControlPillPlacement, 0);
  objc_storeStrong((id *)&self->_dualServiceNamePlacement, 0);
  objc_storeStrong((id *)&self->_serviceNamePlacement, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

- (id)regionIdentifiersForBackgroundLumaView:(id)a3
{
  id v4 = a3;
  id v5 = [(STUIStatusBarVisualProvider_Split *)self leadingBackgroundLumaView];

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"leading", @"bottomLeading", 0, v10);
  }
  else
  {
    id v6 = [(STUIStatusBarVisualProvider_Split *)self trailingBackgroundLumaView];

    if (v6 != v4)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"trailing", @"systemUpdates", @"controlCenter", 0);
  uint64_t v7 = };
LABEL_7:
  id v8 = (void *)v7;

  return v8;
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  v27[9] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 _nativeDisplayBounds];
  CGFloat Width = CGRectGetWidth(v29);
  id v8 = [v5 _exclusionArea];
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
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:9];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  uint64_t v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__STUIStatusBarVisualProvider_Split_visualProviderSubclassForScreen_visualProviderInfo___block_invoke;
  v17[3] = &unk_1E6AA4AE0;
  CGFloat v20 = Width;
  id v14 = v5;
  uint64_t v21 = v10;
  uint64_t v22 = v12;
  id v18 = v14;
  char v19 = &v23;
  [v13 enumerateObjectsUsingBlock:v17];
  id v15 = (id)v24[3];

  _Block_object_dispose(&v23, 8);
  return (Class)v15;
}

+ (BOOL)supportsDisplayingRingerStatus
{
  return MGGetBoolAnswer() ^ 1;
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

- (UIFont)voiceControlFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)unk_1EA87ED58;
  if (unk_1EA87ED58) {
    BOOL v4 = byte_1EA87ED2C == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EA87ED2C = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0 weight:*MEMORY[0x1E4FB09D0]];
    id v6 = (void *)unk_1EA87ED58;
    unk_1EA87ED58 = v5;

    double v3 = (void *)unk_1EA87ED58;
  }
  return (UIFont *)v3;
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

- (int64_t)expandedIconSize
{
  [(STUIStatusBarVisualProvider_Split *)self expandedIconScale];
  double v4 = v3;
  uint64_t v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  id v6 = [v5 _effectiveTargetScreen];
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
  double v2 = *MEMORY[0x1E4FB12A8];
  double v3 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
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
  double v2 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  double v3 = [v2 _effectiveTargetScreen];

  [v3 _displayCornerRadius];
  double v5 = v4;
  [v3 _nativeScale];
  double v7 = v5 * v6;
  [v3 _scale];
  double v9 = v7 / v8;

  return v9;
}

- (double)condensedPointSizeForCellularType:(int64_t)a3 defaultPointSize:(double)a4 baselineOffset:(double *)a5
{
  if ((unint64_t)(a3 - 8) < 2)
  {
    *a5 = 1.0;
    double v9 = objc_opt_class();
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
  -[STUIStatusBarVisualProvider_Split condensedPointSizeForCellularType:defaultPointSize:baselineOffset:](self, "condensedPointSizeForCellularType:defaultPointSize:baselineOffset:", a3, a5);
  double v12 = v11;
  if ((unint64_t)a3 <= 0xF && ((1 << a3) & 0xF8C0) != 0)
  {
    id v13 = [v8 fontDescriptor];
    id v14 = [v13 fontDescriptorWithSymbolicTraits:64];

    if (v12 == v10)
    {
      id v15 = (void *)MEMORY[0x1E4FB08E0];
      double v17 = 0.0;
      uint64_t v16 = v14;
      goto LABEL_6;
    }
LABEL_4:
    id v15 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v16 = v14;
    double v17 = v12;
LABEL_6:
    id v18 = [v15 fontWithDescriptor:v16 size:v17];

    goto LABEL_7;
  }
  id v18 = v8;
  if (v11 != v10)
  {
    id v14 = [v8 fontDescriptor];
    goto LABEL_4;
  }
LABEL_7:

  return v18;
}

- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3
{
  double result = 1.0;
  if ((unint64_t)(a3 - 6) <= 9) {
    return dbl_1D7ED6E40[a3 - 6];
  }
  return result;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v25 = a4;
  id v5 = +[STUIStatusBarBatteryItem chargingDisplayIdentifier];

  if (v5 == v27)
  {
    if (self && ![(STUIStatusBarVisualProvider_iOS *)self expanded])
    {
      batteryExpansionTimer = self->_batteryExpansionTimer;
      id v8 = self;
      if (batteryExpansionTimer)
      {
        [(NSTimer *)batteryExpansionTimer invalidate];
        [(STUIStatusBarVisualProvider_Split *)self setBatteryExpansionTimer:0];
        id v8 = self;
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke;
      v37[3] = &unk_1E6AA4460;
      v37[4] = v8;
      id v28 = +[STUIStatusBarAnimation animationWithBlock:v37];
      [v28 setPriority:200];
      [v28 setExclusivityGroupIdentifier:@"trailing"];
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3010000000;
      v36[4] = 0;
      v36[5] = 0;
      v36[3] = "";
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_6;
      v35[3] = &unk_1E6AA3E68;
      v35[4] = v36;
      double v9 = +[STUIStatusBarAnimation animationWithBlock:v35];
      [v9 setPriority:200];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __73__STUIStatusBarVisualProvider_Split__additionAnimationForBatteryCharging__block_invoke_8;
      v34[3] = &unk_1E6AA3E90;
      v34[4] = v36;
      [v9 setPrepareBlock:v34];
      double v10 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
      [v28 addSubAnimation:v9 forDisplayItemWithIdentifier:v10];
      uint64_t v24 = v9;

      double v11 = +[STUIStatusBarAnimation animationWithBlock:&__block_literal_global_11];
      [v11 setPriority:150];
      [v11 setPrepareBlock:&__block_literal_global_141];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      double v12 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"trailing"];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = [*(id *)(*((void *)&v30 + 1) + 8 * i) identifier];
            double v17 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v16];
            id v18 = +[STUIStatusBarItem identifier];
            char v19 = [v17 isEqual:v18];

            if ((v19 & 1) == 0) {
              [v28 addSubAnimation:v11 forDisplayItemWithIdentifier:v16];
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v13);
      }

      [v28 setDelaysDependentItems:1];
      CGFloat v20 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v21 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
      uint64_t v22 = [v20 setWithArray:v21];
      [v28 setDelayedDisplayItemPlacements:v22];

      _Block_object_dispose(v36, 8);
    }
    else
    {
      id v28 = 0;
    }
  }
  else
  {
    id v6 = +[STUIStatusBarControlCenterItem grabberIdentifier];

    if (v6 == v27)
    {
      -[STUIStatusBarVisualProvider_Split _controlCenterGrabberAnimation]((uint64_t)self);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (-[STUIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, v27))
    {
      -[STUIStatusBarVisualProvider_Split _systemUpdateAnimationForDisplayItemWithIdentifier:](self, v27);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29.receiver = self;
      v29.super_class = (Class)STUIStatusBarVisualProvider_Split;
      id v28 = [(STUIStatusBarVisualProvider_Phone *)&v29 additionAnimationForDisplayItemWithIdentifier:v27 itemAnimation:v25];
    }
  }

  return v28;
}

- (id)_controlCenterGrabberAnimation
{
  if (a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67__STUIStatusBarVisualProvider_Split__controlCenterGrabberAnimation__block_invoke;
    v3[3] = &unk_1E6AA4460;
    v3[4] = a1;
    v1 = +[STUIStatusBarAnimation animationWithBlock:v3];
    [v1 setPriority:300];
    [v1 setPrepareBlock:&__block_literal_global_147];
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)_systemUpdateAnimationForDisplayItemWithIdentifier:(void *)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v30 = v3;
  if (a1)
  {
    id v4 = v3;
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = [a1 statusBar];
    char v7 = [v6 _shouldReverseLayoutDirection];

    id v8 = +[STUIStatusBarItem defaultDisplayIdentifier];
    BOOL v9 = v8 == v4;

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke;
    v44[3] = &unk_1E6AA4C88;
    v44[4] = a1;
    BOOL v46 = v9;
    char v47 = v7;
    id v10 = v5;
    id v45 = v10;
    double v11 = +[STUIStatusBarAnimation animationWithBlock:v44];
    [v11 setPriority:300];
    [v11 setExclusivityGroupIdentifier:@"trailing"];
    [v11 setPrepareBlock:&__block_literal_global_155];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_12;
    v41[3] = &unk_1E6AA4CB0;
    id v12 = v10;
    id v42 = v12;
    BOOL v43 = v9;
    uint64_t v13 = +[STUIStatusBarAnimation animationWithBlock:v41];
    [v13 setPriority:300];
    [v13 setIdentifier:@"systemUpdateItem"];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __88__STUIStatusBarVisualProvider_Split__systemUpdateAnimationForDisplayItemWithIdentifier___block_invoke_14;
    v39[3] = &unk_1E6AA4CD8;
    id v29 = v12;
    id v40 = v29;
    [v13 setPrepareBlock:v39];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v14 = [a1 orderedDisplayItemPlacementsInRegionWithIdentifier:@"trailing"];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          char v19 = [*(id *)(*((void *)&v35 + 1) + 8 * i) identifier];
          [v11 addSubAnimation:v13 forDisplayItemWithIdentifier:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v16);
    }

    CGFloat v20 = [MEMORY[0x1E4F1CA80] set];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v21 = [a1 orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v48 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v31 + 1) + 8 * j) identifier];
          id v27 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v26];
          [v20 addObject:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v48 count:16];
      }
      while (v23);
    }

    [v11 setDelayedItemIdentifiers:v20];
    [v11 setDelaysDependentItems:1];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v27 = a4;
  id v5 = +[STUIStatusBarBatteryItem chargingDisplayIdentifier];

  if (v5 == v29)
  {
    if (self && ![(STUIStatusBarVisualProvider_iOS *)self expanded])
    {
      batteryExpansionTimer = self->_batteryExpansionTimer;
      id v8 = self;
      if (batteryExpansionTimer)
      {
        [(NSTimer *)batteryExpansionTimer invalidate];
        [(STUIStatusBarVisualProvider_Split *)self setBatteryExpansionTimer:0];
        id v8 = self;
      }
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x4010000000;
      v41[3] = "";
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      long long v42 = *MEMORY[0x1E4F1DB28];
      long long v43 = v9;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke;
      v40[3] = &unk_1E6AA4B78;
      v40[4] = v8;
      v40[5] = v41;
      id v10 = +[STUIStatusBarAnimation animationWithBlock:v40];
      [v10 setPriority:200];
      [v10 setExclusivityGroupIdentifier:@"trailing"];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_5;
      v39[3] = &unk_1E6AA3E90;
      void v39[4] = v41;
      [v10 setPrepareBlock:v39];
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x3010000000;
      v38[4] = 0;
      v38[5] = 0;
      v38[3] = "";
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_6;
      v37[3] = &unk_1E6AA4B78;
      void v37[5] = v38;
      v37[4] = self;
      double v11 = +[STUIStatusBarAnimation animationWithBlock:v37];
      [v11 setPriority:200];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __72__STUIStatusBarVisualProvider_Split__removalAnimationForBatteryCharging__block_invoke_9;
      v36[3] = &unk_1E6AA3E90;
      v36[4] = v38;
      [v11 setPrepareBlock:v36];
      id v12 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
      [v10 addSubAnimation:v11 forDisplayItemWithIdentifier:v12];
      uint64_t v26 = v11;
      id v30 = v10;

      uint64_t v13 = +[STUIStatusBarAnimation animationWithBlock:&__block_literal_global_145];
      [v13 setPriority:150];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v14 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"trailing"];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v33 != v16) {
              objc_enumerationMutation(v14);
            }
            id v18 = [*(id *)(*((void *)&v32 + 1) + 8 * i) identifier];
            char v19 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v18];
            CGFloat v20 = +[STUIStatusBarItem identifier];
            char v21 = [v19 isEqual:v20];

            if ((v21 & 1) == 0) {
              [v10 addSubAnimation:v13 forDisplayItemWithIdentifier:v18];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v15);
      }

      [v10 setDelaysDependentItems:1];
      uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v23 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
      uint64_t v24 = [v22 setWithArray:v23];
      [v10 setDelayedDisplayItemPlacements:v24];

      _Block_object_dispose(v38, 8);
      _Block_object_dispose(v41, 8);
    }
    else
    {
      id v30 = 0;
    }
  }
  else
  {
    id v6 = +[STUIStatusBarControlCenterItem grabberIdentifier];

    if (v6 == v29)
    {
      -[STUIStatusBarVisualProvider_Split _controlCenterGrabberAnimation]((uint64_t)self);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (-[STUIStatusBarVisualProvider_Split _shouldShowSystemUpdateForDisplayItemWithIdentifier:](self, v29))
    {
      -[STUIStatusBarVisualProvider_Split _systemUpdateAnimationForDisplayItemWithIdentifier:](self, v29);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31.receiver = self;
      v31.super_class = (Class)STUIStatusBarVisualProvider_Split;
      id v30 = [(STUIStatusBarVisualProvider_Phone *)&v31 removalAnimationForDisplayItemWithIdentifier:v29 itemAnimation:v27];
    }
  }

  return v30;
}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  BOOL v7 = [(STUIStatusBarVisualProvider_iOS *)self expanded];
  double result = 20.0;
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarVisualProvider_Split;
    -[STUIStatusBarVisualProvider_iOS airplaneTravelOffsetInProposedPartWithIdentifier:animationType:](&v9, sel_airplaneTravelOffsetInProposedPartWithIdentifier_animationType_, a3, a4, 20.0);
  }
  return result;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  if ([(STUIStatusBarVisualProvider_iOS *)self expanded])
  {
    v6.receiver = self;
    v6.super_class = (Class)STUIStatusBarVisualProvider_Split;
    [(STUIStatusBarVisualProvider_iOS *)&v6 airplaneSpeedForAnimationType:a3];
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
  BOOL v5 = [(STUIStatusBarVisualProvider_iOS *)self expanded];
  double result = 0.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)STUIStatusBarVisualProvider_Split;
    -[STUIStatusBarVisualProvider_iOS airplaneShouldFadeForAnimationType:](&v7, sel_airplaneShouldFadeForAnimationType_, a3, 0.0);
  }
  return result;
}

- (double)airplaneObstacleFadeOutDuration
{
  if (![(STUIStatusBarVisualProvider_iOS *)self expanded]) {
    return 0.15;
  }
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarVisualProvider_Split;
  [(STUIStatusBarVisualProvider_iOS *)&v4 airplaneObstacleFadeOutDuration];
  return result;
}

- (id)animationForAirplaneMode
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)STUIStatusBarVisualProvider_Split;
  id v3 = [(STUIStatusBarVisualProvider_iOS *)&v17 animationForAirplaneMode];
  [v3 setExclusivityGroupIdentifier:@"trailing"];
  objc_super v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates", 0];
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
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        double v11 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v10];
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
  v12.super_class = (Class)STUIStatusBarVisualProvider_Split;
  double v2 = [(STUIStatusBarVisualProvider_iOS *)&v12 animationForProminentLocation];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x4010000000;
  v9[3] = "";
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v10 = *MEMORY[0x1E4F1DB28];
  long long v11 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke;
  v8[3] = &unk_1E6AA3E68;
  v8[4] = v9;
  objc_super v4 = +[STUIStatusBarAnimation animationWithBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__STUIStatusBarVisualProvider_Split_animationForProminentLocation__block_invoke_4;
  v7[3] = &unk_1E6AA3E90;
  v7[4] = v9;
  [v4 setPrepareBlock:v7];
  [v4 setPriority:-300];
  BOOL v5 = +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
  [v2 addSubAnimation:v4 forDisplayItemWithIdentifier:v5];

  _Block_object_dispose(v9, 8);
  return v2;
}

- (void)_collapseBattery
{
  if (a1)
  {
    if ([a1[18] isEnabled])
    {
      [a1[18] setEnabled:0];
      double v2 = [a1 statusBar];
      [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];

      long long v3 = [a1 statusBar];
      char v4 = [v3 areAnimationsEnabled];

      if ((v4 & 1) == 0)
      {
        -[STUIStatusBarVisualProvider_Split _resetBattery](a1);
      }
    }
  }
}

- (CGAffineTransform)_collapseChargingBoltTransformForDisplayItem:(void *)a3
{
  long long v3 = result;
  if (a2)
  {
    char v4 = [a3 view];
    if ([v4 _shouldReverseLayoutDirection]) {
      double v5 = -12.0;
    }
    else {
      double v5 = 12.0;
    }

    *(_OWORD *)&v3->c = 0u;
    *(_OWORD *)&v3->tx = 0u;
    *(_OWORD *)&v3->a = 0u;
    CGAffineTransformMakeTranslation(v3, v5, 0.666666667);
    long long v6 = *(_OWORD *)&v3->c;
    *(_OWORD *)&v8.a = *(_OWORD *)&v3->a;
    *(_OWORD *)&v8.c = v6;
    *(_OWORD *)&v8.tx = *(_OWORD *)&v3->tx;
    double result = CGAffineTransformScale(&v9, &v8, 0.1, 0.1);
    long long v7 = *(_OWORD *)&v9.c;
    *(_OWORD *)&v3->a = *(_OWORD *)&v9.a;
    *(_OWORD *)&v3->c = v7;
    *(_OWORD *)&v3->tx = *(_OWORD *)&v9.tx;
  }
  else
  {
    *(_OWORD *)&result->c = 0u;
    *(_OWORD *)&result->tx = 0u;
    *(_OWORD *)&result->a = 0u;
  }
  return result;
}

- (void)_resetBattery
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = [a1 statusBar];
    long long v3 = +[STUIStatusBarBatteryItem chargingDisplayIdentifier];
    char v4 = [v2 displayItemWithIdentifier:v3];

    double v5 = [a1 statusBar];
    long long v6 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
    long long v7 = [v5 displayItemWithIdentifier:v6];

    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v29[0] = *MEMORY[0x1E4F1DAB8];
    long long v21 = v29[0];
    v29[1] = v22;
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v20 = v30;
    uint64_t v23 = v4;
    [v4 setTransform:v29];
    v28[0] = v21;
    v28[1] = v22;
    v28[2] = v20;
    [v7 setTransform:v28];
    CGAffineTransform v8 = [a1 statusBar];
    CGAffineTransform v9 = +[STUIStatusBarItem identifier];
    long long v10 = [v8 itemWithIdentifier:v9];

    [v10 setHighlighted:0];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v11 = [a1 orderedDisplayItemPlacementsInRegionWithIdentifier:@"trailing"];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * v15);
          objc_super v17 = [a1 statusBar];
          id v18 = [v16 identifier];
          uint64_t v19 = [v17 displayItemWithIdentifier:v18];

          [v19 setAlpha:1.0];
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }
      while (v13);
    }
  }
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(STUIStatusBarVisualProvider_iOS *)self expanded] != a3)
  {
    if (self)
    {
      batteryExpansionTimer = self->_batteryExpansionTimer;
      if (batteryExpansionTimer)
      {
        [(NSTimer *)batteryExpansionTimer invalidate];
        [(STUIStatusBarVisualProvider_Split *)self setBatteryExpansionTimer:0];
      }
    }
    if ([(STUIStatusBarVisualProvider_iOS *)self expanded])
    {
      long long v6 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
      long long v7 = [v6 pillIconPlacement];
      [v7 setEnabled:1];

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__STUIStatusBarVisualProvider_Split_setExpanded___block_invoke;
      v10[3] = &unk_1E6AA37A0;
      v10[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
    }
    CGAffineTransform v8 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
    [v8 updatePill];

    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarVisualProvider_Split;
    [(STUIStatusBarVisualProvider_iOS *)&v9 setExpanded:v3];
  }
}

- (void)_updateExpandedConstraintsForAvoidanceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(STUIStatusBarVisualProvider_iOS *)self expanded]
    && ([(STUIStatusBarVisualProvider_iOS *)self statusBar],
        CGAffineTransform v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 orientation] - 3,
        v8,
        v9 <= 1))
  {
    double v26 = 0.0;
    double v27 = 0.0;
    long long v10 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v10 frame];
    CGFloat MidX = CGRectGetMidX(v29);
    uint64_t v12 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    STUIStatusBarGetLeadingAndTrailingParts([v12 _shouldReverseLayoutDirection], &v27, &v26, x, y, width, height, MidX);

    BOOL v13 = v26 > 0.0 || v27 > 0.0;
    if (v13)
    {
      [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
      double v27 = v14 + v27;
      [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
      double v26 = v15 + v26;
    }
    long long v16 = [(STUIStatusBarVisualProvider_Split *)self expandedTopMiddleConstraint];
    [v16 setActive:v13 ^ 1];

    objc_super v17 = [(STUIStatusBarVisualProvider_Split *)self expandedLeadingBannerConstraint];
    [v17 setActive:v13];

    double v18 = -v27;
    uint64_t v19 = [(STUIStatusBarVisualProvider_Split *)self expandedLeadingBannerConstraint];
    [v19 setConstant:v18];

    long long v20 = [(STUIStatusBarVisualProvider_Split *)self expandedTrailingBannerConstraint];
    [v20 setActive:v13];

    double v21 = v26;
    long long v22 = [(STUIStatusBarVisualProvider_Split *)self expandedTrailingBannerConstraint];
    [v22 setConstant:v21];
  }
  else
  {
    uint64_t v23 = [(STUIStatusBarVisualProvider_Split *)self expandedTopMiddleConstraint];
    [v23 setActive:1];

    long long v24 = [(STUIStatusBarVisualProvider_Split *)self expandedLeadingBannerConstraint];
    [v24 setActive:0];

    id v25 = [(STUIStatusBarVisualProvider_Split *)self expandedTrailingBannerConstraint];
    [v25 setActive:0];
  }
}

- (id)defaultAnimationForDisplayItemWithIdentifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarVisualProvider_Split;
  char v4 = [(STUIStatusBarVisualProvider_iOS *)&v9 defaultAnimationForDisplayItemWithIdentifier:a3];
  double v5 = (void *)MEMORY[0x1E4F1CAD0];
  long long v6 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacementsInRegionWithIdentifier:@"systemUpdates"];
  long long v7 = [v5 setWithArray:v6];
  [v4 setDelayedDisplayItemPlacements:v7];

  return v4;
}

- (double)animatedTypeDisplayItemSpacingFactor
{
  return self->_animatedTypeDisplayItemSpacingFactor;
}

- (STUIStatusBarDisplayItemPlacement)voiceControlPillPlacement
{
  return self->_voiceControlPillPlacement;
}

- (void)setVoiceControlPillPlacement:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacementGroup)lowerWifiGroup
{
  return self->_lowerWifiGroup;
}

- (STUIStatusBarDisplayItemPlacement)batteryChargingPlacement
{
  return self->_batteryChargingPlacement;
}

- (void)setBatteryChargingPlacement:(id)a3
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

- (NSLayoutConstraint)expandedLeadingBannerConstraint
{
  return self->_expandedLeadingBannerConstraint;
}

- (void)setExpandedLeadingBannerConstraint:(id)a3
{
}

- (NSLayoutConstraint)expandedTrailingBannerConstraint
{
  return self->_expandedTrailingBannerConstraint;
}

- (void)setExpandedTrailingBannerConstraint:(id)a3
{
}

- (NSLayoutConstraint)expandedTopMiddleConstraint
{
  return self->_expandedTopMiddleConstraint;
}

- (void)setExpandedTopMiddleConstraint:(id)a3
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

- (void)setDelayedSystemUpdateDataToken:(id)a3
{
}

@end