@interface STUIStatusBarVisualProvider_LegacyPhone
+ (CGSize)intrinsicLockScreenContentSizeForOrientation:(int64_t)a3;
+ (double)_heightExpanded:(BOOL)a3;
+ (double)height;
- (BOOL)wantsExpandedLeadingPlacements;
- (CGRect)clockBoundsForLayoutItem:(id)a3;
- (CGSize)pillSize;
- (CGSize)smallPillSize;
- (NSDictionary)orderedDisplayItemPlacements;
- (NSDirectionalEdgeInsets)edgeInsets;
- (NSLayoutConstraint)backgroundHeightConstraint;
- (NSLayoutConstraint)centerHeightConstraint;
- (NSLayoutConstraint)centerTopConstraint;
- (NSLayoutConstraint)expandedLeadingBannerConstraint;
- (NSLayoutConstraint)expandedLeadingBottomConstraint;
- (NSLayoutConstraint)expandedTopMiddleConstraint;
- (NSLayoutConstraint)expandedTrailingBannerConstraint;
- (NSLayoutConstraint)expandedTrailingBottomConstraint;
- (NSLayoutConstraint)leadingHeightConstraint;
- (NSLayoutConstraint)leadingTopConstraint;
- (NSLayoutConstraint)trailingHeightConstraint;
- (NSLayoutConstraint)trailingTopConstraint;
- (STUIStatusBarCellularItem)condensedCellularItem;
- (STUIStatusBarDisplayItemPlacementGroup)lowerWifiGroup;
- (STUIStatusBarRegionAxisCenteringLayout)centerHorizontalLayout;
- (STUIStatusBarRegionAxisStackingLayout)leadingHorizontalLayout;
- (STUIStatusBarRegionAxisStackingLayout)trailingHorizontalLayout;
- (_UILumaTrackingBackdropView)centerBackgroundLumaView;
- (_UILumaTrackingBackdropView)leadingBackgroundLumaView;
- (_UILumaTrackingBackdropView)trailingBackgroundLumaView;
- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3;
- (double)baselineOffset;
- (double)dualLineExpandedBaselineOffset;
- (double)effectiveHeight;
- (double)expandedBaselineOffset;
- (double)lowerExpandedBaselineOffset;
- (double)regionSpacing;
- (id)_animationForSingleLineDualCarrier;
- (id)_backgroundActivityDetailRemovalAnimation;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5;
- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3;
- (id)expandedFont;
- (id)normalFont;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3;
- (id)pillFont;
- (id)regionIdentifiersForBackgroundLumaView:(id)a3;
- (id)regionIdentifiersForPartWithIdentifier:(id)a3;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)setupInContainerView:(id)a3;
- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4;
- (id)styleAttributesForStyle:(int64_t)a3;
- (id)timeFont;
- (id)willUpdateWithData:(id)a3;
- (void)_updateBackgroundHeight;
- (void)_updateExpandedConstraintsForAvoidanceFrame:(CGRect)a3;
- (void)_updateExpandedTrailingRegion;
- (void)_updateLockScreenSizing;
- (void)_updateLowerRegionsWithData:(id)a3;
- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5;
- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5;
- (void)itemCreated:(id)a3;
- (void)orientationUpdatedFromOrientation:(int64_t)a3;
- (void)setBackgroundHeightConstraint:(id)a3;
- (void)setCenterBackgroundLumaView:(id)a3;
- (void)setCenterHeightConstraint:(id)a3;
- (void)setCenterHorizontalLayout:(id)a3;
- (void)setCenterTopConstraint:(id)a3;
- (void)setCondensedCellularItem:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedLeadingBannerConstraint:(id)a3;
- (void)setExpandedLeadingBottomConstraint:(id)a3;
- (void)setExpandedTopMiddleConstraint:(id)a3;
- (void)setExpandedTrailingBannerConstraint:(id)a3;
- (void)setExpandedTrailingBottomConstraint:(id)a3;
- (void)setLeadingBackgroundLumaView:(id)a3;
- (void)setLeadingHeightConstraint:(id)a3;
- (void)setLeadingHorizontalLayout:(id)a3;
- (void)setLeadingTopConstraint:(id)a3;
- (void)setLowerWifiGroup:(id)a3;
- (void)setOnLockScreen:(BOOL)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
- (void)setTrailingBackgroundLumaView:(id)a3;
- (void)setTrailingHeightConstraint:(id)a3;
- (void)setTrailingHorizontalLayout:(id)a3;
- (void)setTrailingTopConstraint:(id)a3;
- (void)updateDataForService:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_LegacyPhone

- (BOOL)wantsExpandedLeadingPlacements
{
  return 1;
}

+ (double)_heightExpanded:(BOOL)a3
{
  double result = 20.0;
  if (a3) {
    return 24.0;
  }
  return result;
}

+ (CGSize)intrinsicLockScreenContentSizeForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB30D8];
  [a1 _heightExpanded:1];
  double v5 = v4;
  double v6 = v3;
  result.height = v5;
  result.width = v6;
  return result;
}

+ (double)height
{
  [a1 _heightExpanded:0];
  return result;
}

- (double)effectiveHeight
{
  double v3 = objc_opt_class();
  BOOL v4 = [(STUIStatusBarVisualProvider_iOS *)self expanded]
    || [(STUIStatusBarVisualProvider_iOS *)self onLockScreen];
  [v3 _heightExpanded:v4];
  return result;
}

- (double)regionSpacing
{
  return 8.0;
}

- (NSDirectionalEdgeInsets)edgeInsets
{
  double v2 = 0.0;
  double v3 = 6.5;
  double v4 = 0.0;
  double v5 = 5.5;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)baselineOffset
{
  double v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  UIRoundToScale();
  double v4 = v3;

  return v4;
}

- (double)expandedBaselineOffset
{
  return 17.0;
}

- (double)dualLineExpandedBaselineOffset
{
  return -1.0;
}

- (double)lowerExpandedBaselineOffset
{
  return 18.0;
}

- (id)normalFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)qword_1EC05F008;
  if (qword_1EC05F008) {
    BOOL v4 = _MergedGlobals_7 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    _MergedGlobals_7 = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09D8]];
    double v6 = (void *)qword_1EC05F008;
    qword_1EC05F008 = v5;

    double v3 = (void *)qword_1EC05F008;
  }
  return v3;
}

- (id)timeFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)unk_1EC05F010;
  if (unk_1EC05F010) {
    BOOL v4 = byte_1EC05F001 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05F001 = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09E0]];
    double v6 = (void *)unk_1EC05F010;
    unk_1EC05F010 = v5;

    double v3 = (void *)unk_1EC05F010;
  }
  return v3;
}

- (id)expandedFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)unk_1EC05F018;
  if (unk_1EC05F018) {
    BOOL v4 = byte_1EC05F002 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05F002 = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0 weight:*MEMORY[0x1E4FB09D8]];
    double v6 = (void *)unk_1EC05F018;
    unk_1EC05F018 = v5;

    double v3 = (void *)unk_1EC05F018;
  }
  return v3;
}

- (id)pillFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)unk_1EC05F020;
  if (unk_1EC05F020) {
    BOOL v4 = byte_1EC05F003 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05F003 = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09E0]];
    double v6 = (void *)unk_1EC05F020;
    unk_1EC05F020 = v5;

    double v3 = (void *)unk_1EC05F020;
  }
  return v3;
}

- (CGSize)pillSize
{
  double v2 = 44.0;
  double v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2 = 16.0;
  double v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)setupInContainerView:(id)a3
{
  v214[3] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  double v6 = [v4 array];
  id v213 = [MEMORY[0x1E4F1CA48] array];
  [(STUIStatusBarVisualProvider_LegacyPhone *)self baselineOffset];
  double v8 = v7;
  [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedBaselineOffset];
  double v204 = v9;
  [(STUIStatusBarVisualProvider_LegacyPhone *)self edgeInsets];
  double v11 = v10;
  double v13 = v12;
  [(STUIStatusBarVisualProvider_iOS *)self itemSpacing];
  double v15 = v14;
  [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
  double v17 = v16;
  [(STUIStatusBarVisualProvider_LegacyPhone *)self regionSpacing];
  double v19 = v18;
  v20 = [(STUIStatusBarVisualProvider_LegacyPhone *)self normalFont];
  [v20 capHeight];
  double v22 = v21 + 1.0;

  v23 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedFont];
  [v23 capHeight];
  double v25 = v24 + 1.0;

  [(STUIStatusBarVisualProvider_LegacyPhone *)self pillSize];
  double v207 = v26;
  v27 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"leading"];
  v28 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v29 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v29 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v29 setInterspace:v15];
  leadingHorizontalLayout = self->_leadingHorizontalLayout;
  self->_leadingHorizontalLayout = v29;

  [(STUIStatusBarRegionAxesLayout *)v28 setHorizontalLayout:self->_leadingHorizontalLayout];
  v31 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v28 setVerticalLayout:v31];

  [(STUIStatusBarRegion *)v27 setLayout:v28];
  -[STUIStatusBarRegion setActionInsets:](v27, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  v32 = [(STUIStatusBarRegion *)v27 layoutItem];
  v33 = [v32 bottomAnchor];
  v34 = v5;
  v35 = [v5 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35 constant:v8];
  leadingTopConstraint = self->_leadingTopConstraint;
  self->_leadingTopConstraint = v36;

  v38 = v6;
  [v6 addObject:self->_leadingTopConstraint];
  v39 = [v32 leadingAnchor];
  v40 = [v34 leadingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40 constant:v11];
  [v38 addObject:v41];

  v212 = v32;
  v42 = [v32 heightAnchor];
  v43 = [v42 constraintEqualToConstant:v22];
  leadingHeightConstraint = self->_leadingHeightConstraint;
  self->_leadingHeightConstraint = v43;

  [v38 addObject:self->_leadingHeightConstraint];
  objc_msgSend(v34, "_ui_addSubLayoutItem:", v32);

  [v213 addObject:v27];
  v45 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"trailing"];
  v46 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v47 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v47 setAlignment:4];
  [(STUIStatusBarRegionAxisStackingLayout *)v47 setInterspace:v15];
  trailingHorizontalLayout = self->_trailingHorizontalLayout;
  self->_trailingHorizontalLayout = v47;

  [(STUIStatusBarRegionAxesLayout *)v46 setHorizontalLayout:self->_trailingHorizontalLayout];
  v49 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v46 setVerticalLayout:v49];

  [(STUIStatusBarRegion *)v45 setLayout:v46];
  -[STUIStatusBarRegion setActionInsets:](v45, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  v50 = [(STUIStatusBarRegion *)v45 layoutItem];
  v51 = [v50 bottomAnchor];
  v52 = [v34 topAnchor];
  v53 = [v51 constraintEqualToAnchor:v52 constant:v8];
  trailingTopConstraint = self->_trailingTopConstraint;
  self->_trailingTopConstraint = v53;

  [v38 addObject:self->_trailingTopConstraint];
  v55 = [v50 trailingAnchor];
  v56 = [v34 trailingAnchor];
  double v57 = -v13;
  v58 = [v55 constraintEqualToAnchor:v56 constant:v57];
  v203 = v38;
  [v38 addObject:v58];

  v211 = v50;
  v59 = [v50 heightAnchor];
  v60 = [v59 constraintEqualToConstant:v22];
  trailingHeightConstraint = self->_trailingHeightConstraint;
  self->_trailingHeightConstraint = v60;

  [v38 addObject:self->_trailingHeightConstraint];
  objc_msgSend(v34, "_ui_addSubLayoutItem:", v50);

  [v213 addObject:v45];
  v62 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"center"];
  v63 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v64 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v64 setInterspace:v15];
  centerHorizontalLayout = self->_centerHorizontalLayout;
  self->_centerHorizontalLayout = v64;

  [(STUIStatusBarRegionAxesLayout *)v63 setHorizontalLayout:self->_centerHorizontalLayout];
  v66 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v63 setVerticalLayout:v66];

  v209 = v62;
  [(STUIStatusBarRegion *)v62 setLayout:v63];
  v67 = [(STUIStatusBarRegion *)v62 layoutItem];
  v68 = [v67 centerXAnchor];
  v69 = [v34 centerXAnchor];
  v70 = [v68 constraintEqualToAnchor:v69];
  [v38 addObject:v70];

  v71 = [v67 widthAnchor];
  v72 = [v71 constraintEqualToConstant:0.0];
  LODWORD(v73) = 1132068864;
  v74 = objc_msgSend(v72, "_ui_constraintWithPriority:", v73);
  [v38 addObject:v74];

  v75 = [v67 bottomAnchor];
  v76 = [v34 topAnchor];
  v77 = [v75 constraintEqualToAnchor:v76 constant:v8];
  centerTopConstraint = self->_centerTopConstraint;
  self->_centerTopConstraint = v77;

  [v38 addObject:self->_centerTopConstraint];
  v79 = [v67 heightAnchor];
  v80 = [v79 constraintEqualToConstant:v22];
  centerHeightConstraint = self->_centerHeightConstraint;
  self->_centerHeightConstraint = v80;

  [v38 addObject:self->_centerHeightConstraint];
  v82 = [v67 leadingAnchor];
  v83 = [v212 trailingAnchor];
  v84 = [v82 constraintEqualToAnchor:v83 constant:v19];
  [v38 addObject:v84];

  v85 = [v211 leadingAnchor];
  v206 = v67;
  v86 = [v67 trailingAnchor];
  v87 = [v85 constraintEqualToAnchor:v86 constant:v19];
  [v38 addObject:v87];

  objc_msgSend(v34, "_ui_addSubLayoutItem:", v67);
  [v213 addObject:v209];

  v88 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"background"];
  v89 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v90 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v89 setHorizontalLayout:v90];

  v91 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v89 setVerticalLayout:v91];

  [(STUIStatusBarRegion *)v88 setLayout:v89];
  v92 = [(STUIStatusBarRegion *)v88 layoutItem];
  v93 = [v92 leadingAnchor];
  v94 = [v34 leadingAnchor];
  v95 = [v93 constraintEqualToAnchor:v94];
  [v203 addObject:v95];

  v96 = [v92 trailingAnchor];
  v97 = [v34 trailingAnchor];
  v98 = [v96 constraintEqualToAnchor:v97];
  [v203 addObject:v98];

  v99 = [v92 topAnchor];
  v100 = [v34 topAnchor];
  v101 = [v99 constraintEqualToAnchor:v100];
  [v203 addObject:v101];

  v102 = [v92 heightAnchor];
  [(id)objc_opt_class() height];
  objc_msgSend(v102, "constraintEqualToConstant:");
  v103 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  backgroundHeightConstraint = self->_backgroundHeightConstraint;
  self->_backgroundHeightConstraint = v103;

  [v203 addObject:self->_backgroundHeightConstraint];
  objc_msgSend(v34, "_ui_addSubLayoutItem:", v92);

  [v213 addObject:v88];
  [(STUIStatusBarVisualProvider_LegacyPhone *)self lowerExpandedBaselineOffset];
  double v106 = v105;
  v107 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedLeading"];
  v108 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v109 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v109 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v109 setInterspace:v17];
  [(STUIStatusBarRegionAxesLayout *)v108 setHorizontalLayout:v109];

  v110 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v108 setVerticalLayout:v110];

  [(STUIStatusBarRegion *)v107 setLayout:v108];
  -[STUIStatusBarRegion setActionInsets:](v107, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  [(STUIStatusBarRegion *)v107 disableWithToken:10];
  v111 = [(STUIStatusBarRegion *)v107 layoutItem];
  v112 = [v111 trailingAnchor];
  v113 = [v34 centerXAnchor];
  v114 = [v112 constraintEqualToAnchor:v113 constant:0.0];
  expandedLeadingBannerConstraint = self->_expandedLeadingBannerConstraint;
  self->_expandedLeadingBannerConstraint = v114;

  v116 = [v111 bottomAnchor];
  v117 = [v34 topAnchor];
  v118 = [v116 constraintEqualToAnchor:v117 constant:v204];
  expandedLeadingBottomConstraint = self->_expandedLeadingBottomConstraint;
  self->_expandedLeadingBottomConstraint = v118;

  [(NSLayoutConstraint *)self->_expandedLeadingBottomConstraint setIdentifier:@"UISB-expanded-leading-bottom"];
  [v203 addObject:self->_expandedLeadingBottomConstraint];
  v120 = [v111 leadingAnchor];
  v121 = [v34 leadingAnchor];
  v122 = [v120 constraintEqualToAnchor:v121 constant:v11];
  [v203 addObject:v122];

  v123 = [v111 heightAnchor];
  v124 = [v123 constraintEqualToConstant:v25];
  [v203 addObject:v124];

  v208 = v111;
  objc_msgSend(v34, "_ui_addSubLayoutItem:", v111);

  [v213 addObject:v107];
  v125 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedTrailing"];
  v126 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v127 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v127 setAlignment:4];
  [(STUIStatusBarRegionAxisStackingLayout *)v127 setInterspace:v17];
  [(STUIStatusBarRegionAxesLayout *)v126 setHorizontalLayout:v127];

  v128 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v126 setVerticalLayout:v128];

  [(STUIStatusBarRegion *)v125 setLayout:v126];
  -[STUIStatusBarRegion setActionInsets:](v125, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  [(STUIStatusBarRegion *)v125 disableWithToken:10];
  v129 = [(STUIStatusBarRegion *)v125 layoutItem];
  v130 = [v129 leadingAnchor];
  v131 = [v111 trailingAnchor];
  v132 = [v130 constraintEqualToAnchor:v131 constant:v17];
  expandedTopMiddleConstraint = self->_expandedTopMiddleConstraint;
  self->_expandedTopMiddleConstraint = v132;

  v134 = [v129 leadingAnchor];
  v135 = [v34 centerXAnchor];
  v136 = [v134 constraintEqualToAnchor:v135 constant:0.0];
  expandedTrailingBannerConstraint = self->_expandedTrailingBannerConstraint;
  self->_expandedTrailingBannerConstraint = v136;

  v138 = [v129 bottomAnchor];
  v139 = [v34 topAnchor];
  v140 = [v138 constraintEqualToAnchor:v139 constant:v204];
  expandedTrailingBottomConstraint = self->_expandedTrailingBottomConstraint;
  self->_expandedTrailingBottomConstraint = v140;

  [(NSLayoutConstraint *)self->_expandedTrailingBottomConstraint setIdentifier:@"UISB-expanded-trailing-bottom"];
  [v203 addObject:self->_expandedTrailingBottomConstraint];
  v142 = [v129 trailingAnchor];
  v143 = [v34 trailingAnchor];
  v144 = [v142 constraintEqualToAnchor:v143 constant:v57];
  [v203 addObject:v144];

  v145 = v129;
  v146 = [v129 heightAnchor];
  v147 = [v146 constraintEqualToConstant:v25];
  [v203 addObject:v147];

  [v203 addObject:self->_expandedTopMiddleConstraint];
  v210 = v129;
  v148 = [v129 widthAnchor];
  v149 = v111;
  v150 = [v111 widthAnchor];
  v151 = [v148 constraintEqualToAnchor:v150];
  LODWORD(v152) = 1131741184;
  v153 = objc_msgSend(v151, "_ui_constraintWithPriority:", v152);
  [v203 addObject:v153];

  objc_msgSend(v34, "_ui_addSubLayoutItem:", v145);
  [v213 addObject:v125];

  v154 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedLowerLeading"];
  v155 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v156 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v156 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v156 setInterspace:v17];
  [(STUIStatusBarRegionAxesLayout *)v155 setHorizontalLayout:v156];

  v157 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v155 setVerticalLayout:v157];

  [(STUIStatusBarRegion *)v154 setLayout:v155];
  [(STUIStatusBarRegion *)v154 disableWithToken:10];
  v158 = [(STUIStatusBarRegion *)v154 layoutItem];
  v159 = [v158 bottomAnchor];
  v160 = [v149 bottomAnchor];
  v161 = [v159 constraintEqualToAnchor:v160 constant:v106];
  [v203 addObject:v161];

  v162 = [v158 leadingAnchor];
  v163 = [v34 leadingAnchor];
  v164 = [v162 constraintEqualToAnchor:v163 constant:v11];
  [v203 addObject:v164];

  v165 = [v158 heightAnchor];
  v166 = [v165 constraintEqualToConstant:v25];
  [v203 addObject:v166];

  objc_msgSend(v34, "_ui_addSubLayoutItem:", v158);
  [v213 addObject:v154];

  v167 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedLowerTrailing"];
  v168 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v169 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v169 setAlignment:4];
  [(STUIStatusBarRegionAxisStackingLayout *)v169 setInterspace:v17];
  [(STUIStatusBarRegionAxesLayout *)v168 setHorizontalLayout:v169];

  v170 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v168 setVerticalLayout:v170];

  [(STUIStatusBarRegion *)v167 setLayout:v168];
  [(STUIStatusBarRegion *)v167 disableWithToken:10];
  v171 = [(STUIStatusBarRegion *)v167 layoutItem];
  v172 = [v171 bottomAnchor];
  v173 = [v210 bottomAnchor];
  v174 = [v172 constraintEqualToAnchor:v173 constant:v106];
  [v203 addObject:v174];

  v175 = [(STUIStatusBarRegion *)v167 layoutItem];
  v176 = [v175 trailingAnchor];
  v177 = [v34 trailingAnchor];
  v178 = [v176 constraintEqualToAnchor:v177 constant:v57];
  [v203 addObject:v178];

  v179 = [(STUIStatusBarRegion *)v167 layoutItem];
  v180 = [v179 heightAnchor];
  v181 = [v180 constraintEqualToConstant:v25];
  [v203 addObject:v181];

  v182 = [(STUIStatusBarRegion *)v167 layoutItem];
  v183 = [v182 leadingAnchor];
  v205 = v158;
  v184 = [v158 trailingAnchor];
  v185 = [v183 constraintEqualToAnchor:v184 constant:v17];
  [v203 addObject:v185];

  v186 = [(STUIStatusBarRegion *)v167 layoutItem];
  v187 = [v186 widthAnchor];
  v188 = [v158 widthAnchor];
  v189 = [v187 constraintEqualToAnchor:v188];
  LODWORD(v190) = 1131741184;
  v191 = objc_msgSend(v189, "_ui_constraintWithPriority:", v190);
  [v203 addObject:v191];

  v192 = [(STUIStatusBarRegion *)v167 layoutItem];
  objc_msgSend(v34, "_ui_addSubLayoutItem:", v192);

  [v213 addObject:v167];
  v193 = STUIStatusBarAddLumaView(v34, v203, v212, 1, v207);
  [(STUIStatusBarVisualProvider_LegacyPhone *)self setLeadingBackgroundLumaView:v193];

  v194 = STUIStatusBarAddLumaView(v34, v203, v206, 0, v207);
  [(STUIStatusBarVisualProvider_LegacyPhone *)self setCenterBackgroundLumaView:v194];

  v195 = STUIStatusBarAddLumaView(v34, v203, v211, 2, v207);

  [(STUIStatusBarVisualProvider_LegacyPhone *)self setTrailingBackgroundLumaView:v195];
  id v196 = objc_alloc(MEMORY[0x1E4FB21F0]);
  v197 = [(STUIStatusBarVisualProvider_LegacyPhone *)self leadingBackgroundLumaView];
  v214[0] = v197;
  v198 = [(STUIStatusBarVisualProvider_LegacyPhone *)self centerBackgroundLumaView];
  v214[1] = v198;
  v199 = [(STUIStatusBarVisualProvider_LegacyPhone *)self trailingBackgroundLumaView];
  v214[2] = v199;
  v200 = [MEMORY[0x1E4F1C978] arrayWithObjects:v214 count:3];
  v201 = objc_msgSend(v196, "initWithTransitionBoundaries:minimumDifference:delegate:views:", self, v200, 0.4, 0.7, 0.5);
  [(STUIStatusBarVisualProvider_iOS *)self setLumaTrackingGroup:v201];

  [MEMORY[0x1E4F28DC8] activateConstraints:v203];
  return v213;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v192[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    id v167 = v4;
    double v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    LOBYTE(v142) = 1;
    double v9 = +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:1300 lowPriority:1000 cellularItemClass:v7 wifiItemClass:v8 cellularTypeClass:objc_opt_class() includeCellularName:1 allowDualNetwork:v142];
    double v10 = [v9 cellularGroup];
    uint64_t v11 = [v10 namePlacement];

    double v12 = [v9 cellularGroup];
    uint64_t v13 = [v12 dualNamePlacement];

    double v14 = [v9 cellularGroup];
    uint64_t v15 = [v14 dualNameAndTypePlacement];

    double v16 = +[STUIStatusBarItem defaultDisplayIdentifier];
    double v17 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v16, [v9 maximumPriority] + 1);
    v165 = (void *)v13;
    v166 = (void *)v11;
    v192[0] = v11;
    v192[1] = v13;
    v164 = (void *)v15;
    v192[2] = v15;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:3];
    double v19 = [v17 excludingPlacements:v18];

    if ([(STUIStatusBarVisualProvider_iOS *)self hasCellularCapability])
    {
      [v6 addObject:v19];
      uint64_t v20 = 0;
      char v21 = 1;
    }
    else
    {
      double v22 = +[STUIStatusBarItem defaultDisplayIdentifier];
      uint64_t v20 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v22 priority:30];

      uint64_t v191 = v20;
      char v21 = 1;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];
      uint64_t v24 = [v19 excludingPlacements:v23];

      [v6 addObject:v24];
      if (v20)
      {
        [v6 addObject:v20];
        char v21 = 0;
      }
      double v19 = (void *)v24;
    }
    v163 = v19;
    v175 = self;
    double v25 = [MEMORY[0x1E4F1CA48] array];
    double v26 = [v9 cellularGroup];
    v27 = [v26 placementsAffectedByAirplaneMode];
    [v25 addObjectsFromArray:v27];

    if ((v21 & 1) == 0) {
      [v25 addObject:v20];
    }
    v162 = (void *)v20;
    v28 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v29 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v28 priority:1400];
    v161 = v25;
    v30 = [v29 excludingPlacements:v25];
    v178 = v6;
    [v6 addObject:v30];

    uint64_t v31 = [v9 minimumPriority];
    v32 = +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", v31 - 5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v33 = [v9 cellularGroup];
    v34 = [v33 typePlacement];
    v190[0] = v34;
    v35 = [v9 cellularGroup];
    [v35 namePlacement];
    v36 = v9;
    v37 = v174 = v9;
    v190[1] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:2];
    v39 = [v32 requiringAllPlacements:v38];

    v176 = [v36 placements];
    v147 = [v176 arrayByAddingObject:v39];
    v172 = +[STUIStatusBarCellularItem signalStrengthDisplayIdentifier];
    v189[0] = v172;
    v170 = +[STUIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
    v189[1] = v170;
    v168 = +[STUIStatusBarCellularItem warningDisplayIdentifier];
    v189[2] = v168;
    v158 = +[STUIStatusBarCellularItem rawDisplayIdentifier];
    v189[3] = v158;
    v156 = +[STUIStatusBarCellularItem nameDisplayIdentifier];
    v189[4] = v156;
    v153 = +[STUIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier];
    v189[5] = v153;
    v151 = +[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier];
    v189[6] = v151;
    v160 = v39;
    v149 = [v39 identifier];
    v189[7] = v149;
    v40 = +[STUIStatusBarCellularItem typeDisplayIdentifier];
    v189[8] = v40;
    v41 = +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier];
    v189[9] = v41;
    v42 = +[STUIStatusBarWifiItem iconDisplayIdentifier];
    v189[10] = v42;
    v43 = +[STUIStatusBarWifiItem rawDisplayIdentifier];
    v189[11] = v43;
    v44 = +[STUIStatusBarCellularItem callForwardingDisplayIdentifier];
    v189[12] = v44;
    v45 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v189[13] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:14];
    v47 = _reorderedPlacementsFromGroupForLegacyLayout(v147, 0, v46);
    [v178 addObjectsFromArray:v47];

    v48 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v49 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v48, [v174 minimumPriority] - 10);
    [v178 addObject:v49];

    v177 = [MEMORY[0x1E4F1CA48] array];
    v50 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v173 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v50 priority:3000];

    v51 = +[STUIStatusBarLockItem textDisplayIdentifier];
    v52 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v51 priority:2999];
    v53 = [v174 cellularGroup];
    v54 = [v53 dualNamePlacement];
    v188[0] = v54;
    v55 = [v174 cellularGroup];
    v56 = [v55 dualNameAndTypePlacement];
    v188[1] = v56;
    double v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:2];
    uint64_t v58 = [v52 excludingPlacements:v57];

    v59 = +[STUIStatusBarTimeItem timeDisplayIdentifier];
    v60 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v59 priority:3002];
    v187[0] = v58;
    v61 = [v174 cellularGroup];
    v62 = [v61 dualNamePlacement];
    v187[1] = v62;
    v63 = [v174 cellularGroup];
    v64 = [v63 dualNameAndTypePlacement];
    v187[2] = v64;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:3];
    v171 = [v60 excludingPlacements:v65];

    v66 = v177;
    [v177 addObject:v173];
    v159 = (void *)v58;
    [v177 addObject:v58];
    v67 = +[STUIStatusBarSettingsDomain rootSettings];
    v68 = [v67 visualProviderSettings];
    LODWORD(v61) = [v68 fullWidthBackgroundActivity];

    if (v61)
    {
      v69 = +[STUIStatusBarItem defaultDisplayIdentifier];
      v70 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v69 priority:1950];

      v71 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
      v72 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v71 priority:1949];
      v186 = v70;
      double v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v186 count:1];
      v74 = [v72 requiringAllPlacements:v73];

      v75 = +[STUIStatusBarFullBackgroundActivityItem detailDisplayIdentifier];
      v76 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v75 priority:5000];
      v185[0] = @"leading";
      v185[1] = @"center";
      v185[2] = @"trailing";
      v185[3] = @"expandedLeading";
      v185[4] = @"expandedTrailing";
      v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:5];
      v184[0] = v70;
      v184[1] = v74;
      v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:2];
      v79 = [v76 excludingAllPlacementsInRegions:v77 exceptPlacements:v78];

      v66 = v177;
      v80 = [(STUIStatusBarVisualProvider_Phone *)v175 pillRegionCoordinator];
      [v80 setBackgroundActivityDetailPlacement:v79];

      [v177 addObject:v70];
      [v177 addObject:v74];
      [v177 addObject:v79];
    }
    [v66 addObject:v171];
    v81 = [MEMORY[0x1E4F1CA48] array];
    v82 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v83 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v82 priority:1960];
    [v81 addObject:v83];

    v84 = +[STUIStatusBarIndicatorLocationItem groupWithPriority:1955];
    v85 = [v84 placements];
    [v81 addObjectsFromArray:v85];

    v86 = +[STUIStatusBarSettingsDomain rootSettings];
    v87 = [v86 visualProviderSettings];
    char v88 = [v87 fullWidthBackgroundActivity];

    if ((v88 & 1) == 0)
    {
      v89 = +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];
      v90 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v89 priority:1950];

      [v81 addObject:v90];
    }
    v91 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v92 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v91 priority:1940];
    [v81 addObject:v92];

    [(STUIStatusBarVisualProvider_iOS *)v175 bluetoothPaddingInset];
    v93 = +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 800, 500);
    v169 = +[STUIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](STUIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", [v93 maximumPriority] + 1, objc_msgSend(v93, "minimumPriority") - 5);
    v144 = [v93 placements];
    v154 = +[STUIStatusBarBluetoothItem batteryDisplayIdentifier];
    v157 = v93;
    v183[0] = v154;
    double v152 = [v93 bluetoothInsetPaddingItem];
    v150 = [v152 identifier];
    v183[1] = v150;
    v148 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[2] = v148;
    v146 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[3] = v146;
    v145 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[4] = v145;
    v94 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[5] = v94;
    v95 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[6] = v95;
    v96 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[7] = v96;
    v97 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[8] = v97;
    v98 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[9] = v98;
    v99 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[10] = v99;
    v100 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v183[11] = v100;
    v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:12];
    _reorderedPlacementsFromGroupForLegacyLayout(v144, 1, v101);
    v103 = v102 = v81;
    [v102 addObjectsFromArray:v103];

    v104 = +[STUIStatusBarItem defaultDisplayIdentifier];
    double v105 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v104 priority:2];
    [v102 addObject:v105];

    double v106 = [v169 placements];
    v107 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v182[0] = v107;
    v108 = +[STUIStatusBarBatteryItem staticIconDisplayIdentifier];
    v182[1] = v108;
    v109 = +[STUIStatusBarBatteryItem percentDisplayIdentifier];
    v182[2] = v109;
    v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:3];
    v111 = _reorderedPlacementsFromGroupForLegacyLayout(v106, 1, v110);
    v155 = v102;
    [v102 addObjectsFromArray:v111];

    v112 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v113 = objc_opt_class();
    uint64_t v114 = objc_opt_class();
    LOBYTE(v143) = 0;
    v115 = +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:2500 lowPriority:2200 cellularItemClass:v113 wifiItemClass:v114 cellularTypeClass:objc_opt_class() includeCellularName:1 allowDualNetwork:v143];
    uint64_t v116 = [v115 wifiGroup];
    lowerWifiGroup = v175->_lowerWifiGroup;
    v175->_lowerWifiGroup = (STUIStatusBarDisplayItemPlacementGroup *)v116;

    v118 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v119 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v118 priority:5000];
    v120 = [(STUIStatusBarVisualProvider_iOS *)v175 expandedCellularPlacementsAffectedByAirplaneMode];
    v121 = [v115 cellularGroup];
    v122 = [v121 placementsAffectedByAirplaneMode];
    v123 = [v120 arrayByAddingObjectsFromArray:v122];
    v124 = [v119 excludingPlacements:v123];
    [v112 addObject:v124];

    v125 = [v115 placements];
    [v112 addObjectsFromArray:v125];

    v126 = [MEMORY[0x1E4F1CA48] array];
    v127 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v128 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v127 priority:1450];
    [v126 addObject:v128];

    [(STUIStatusBarVisualProvider_iOS *)v175 bluetoothPaddingInset];
    v129 = +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 1400, 1000);
    v130 = [v129 placements];
    [v126 addObjectsFromArray:v130];

    v131 = +[STUIStatusBarSettingsDomain rootSettings];
    v132 = [v131 visualProviderSettings];
    LODWORD(v121) = [v132 fullWidthBackgroundActivity];

    if (v121)
    {
      v133 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];
      v134 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v133 priority:2000];
      v181 = v134;
      v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v181 count:1];
    }
    else
    {
      v135 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v179[0] = @"leading";
    v179[1] = @"trailing";
    v180[0] = v178;
    v180[1] = v155;
    v179[2] = @"center";
    v179[3] = @"background";
    v180[2] = v177;
    v180[3] = v135;
    v179[4] = @"expandedLeading";
    v136 = [(STUIStatusBarVisualProvider_iOS *)v175 expandedLeadingPlacements];
    v180[4] = v136;
    v180[5] = v112;
    v179[5] = @"expandedLowerLeading";
    v179[6] = @"expandedTrailing";
    v137 = [(STUIStatusBarVisualProvider_iOS *)v175 expandedTrailingPlacements];
    v179[7] = @"expandedLowerTrailing";
    v180[6] = v137;
    v180[7] = v126;
    uint64_t v138 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v180 forKeys:v179 count:8];
    v139 = v175->_orderedDisplayItemPlacements;
    v175->_orderedDisplayItemPlacements = (NSDictionary *)v138;

    orderedDisplayItemPlacements = v175->_orderedDisplayItemPlacements;
    id v4 = v167;
  }
  v140 = [(NSDictionary *)orderedDisplayItemPlacements objectForKeyedSubscript:v4];

  return v140;
}

- (void)itemCreated:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v12;
    objc_opt_class();
    [v5 setMarqueeServiceName:objc_opt_isKindOfClass() & 1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 setMarqueeServiceName:1];
    }
    else if ([v5 isMemberOfClass:objc_opt_class()])
    {
      [v5 setShowsDisabledSignalBars:0];
      objc_msgSend(v5, "setMarqueeServiceName:", -[STUIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen"));
      objc_storeStrong((id *)&self->_condensedCellularItem, a3);
    }
    [v5 setTypeStringProvider:self];
  }
  else
  {
    double v6 = [v12 identifier];
    uint64_t v7 = +[STUIStatusBarItem identifier];

    if (v6 == v7)
    {
      id v11 = v12;
      [(STUIStatusBarVisualProvider_LegacyPhone *)self smallPillSize];
      objc_msgSend(v11, "setPillSize:");
    }
    else
    {
      uint64_t v8 = [v12 identifier];
      double v9 = +[STUIStatusBarItem identifier];

      double v10 = v12;
      if (v8 != v9) {
        goto LABEL_12;
      }
      [v12 setUseFullColorIndicator:1];
    }
  }
  double v10 = v12;
LABEL_12:
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  if (a3 == 2)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"GPRS" value:&stru_1F2F86950 table:0];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5
{
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v8 = v6;
  if ((unint64_t)a3 <= 0xF)
  {
    if (((1 << a3) & 0xF8C0) != 0)
    {
      double v9 = [v6 fontDescriptor];
      double v10 = [v9 fontDescriptorWithSymbolicTraits:64];

      id v11 = (void *)MEMORY[0x1E4FB08E0];
      double v12 = 0.0;
      uint64_t v13 = v10;
LABEL_4:
      uint64_t v8 = [v11 fontWithDescriptor:v13 size:v12];

      goto LABEL_5;
    }
    uint64_t v8 = v6;
    if (a3 == 2)
    {
      [v6 pointSize];
      double v16 = v15 * 0.7;
      double v17 = (void *)MEMORY[0x1E4FB08E0];
      double v10 = [v7 fontDescriptor];
      id v11 = v17;
      uint64_t v13 = v10;
      double v12 = v16;
      goto LABEL_4;
    }
  }
LABEL_5:

  return v8;
}

- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3
{
  return 1.0;
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v10 = 0;
    goto LABEL_7;
  }
  id v9 = v8;
  double v10 = v9;
  if (!v9)
  {
LABEL_7:
    v21.receiver = self;
    v21.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
    [(STUIStatusBarVisualProvider_Phone *)&v21 actionable:v8 highlighted:v6 initialPress:v5];
    goto LABEL_8;
  }
  id v11 = [v9 identifier];
  uint64_t v12 = +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];
  if (v11 != (void *)v12)
  {
    uint64_t v13 = (void *)v12;
    double v14 = [v10 identifier];
    double v15 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

    if (v14 == v15) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }

LABEL_10:
  double v16 = [v10 highlightView];
  if (!v16)
  {
    double v16 = objc_alloc_init(STUIStatusBarRoundedCornerView);
    [(STUIStatusBarRoundedCornerView *)v16 setAutoresizingMask:18];
    double v17 = [v10 identifier];
    double v18 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

    if (v17 == v18) {
      [(STUIStatusBarRoundedCornerView *)v16 setCornerRadius:0.0];
    }
    [v10 setHighlightView:v16];
  }
  double v19 = (void *)MEMORY[0x1E4FB14D0];
  v24[0] = v16;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__STUIStatusBarVisualProvider_LegacyPhone_actionable_highlighted_initialPress___block_invoke;
  v22[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  BOOL v23 = v6;
  [v19 _setVisuallyHighlighted:v6 forViews:v20 initialPress:v5 highlightBlock:v22];

LABEL_8:
}

- (id)willUpdateWithData:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
  id v4 = a3;
  BOOL v5 = [(STUIStatusBarVisualProvider_Phone *)&v15 willUpdateWithData:v4];
  BOOL v6 = [v4 backgroundActivityEntry];

  if (v6)
  {
    uint64_t v7 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    id v8 = [v7 currentAggregatedData];
    id v9 = [v8 backgroundActivityEntry];

    LODWORD(v7) = [v6 isEnabled];
    if (v7 != [v9 isEnabled])
    {
      if ([v6 isEnabled])
      {
        if ([(STUIStatusBarVisualProvider_iOS *)self expanded]) {
          uint64_t v10 = 4;
        }
        else {
          uint64_t v10 = 1;
        }
      }
      else
      {
        uint64_t v10 = 4;
      }
      id v11 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      uint64_t v12 = [v11 regions];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62__STUIStatusBarVisualProvider_LegacyPhone_willUpdateWithData___block_invoke;
      v14[3] = &__block_descriptor_40_e46_v32__0__NSString_8__STUIStatusBarRegion_16_B24l;
      v14[4] = v10;
      [v12 enumerateKeysAndObjectsUsingBlock:v14];
    }
  }

  return v5;
}

- (id)_animationForSingleLineDualCarrier
{
  double v2 = +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:0.2];
  double v3 = +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:0.2];
  [v3 setPriority:10];
  id v4 = +[STUIStatusBarWifiItem iconDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v4];

  BOOL v5 = +[STUIStatusBarWifiItem rawDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v5];

  BOOL v6 = +[STUIStatusBarWifiItem signalStrengthDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v6];

  uint64_t v7 = +[STUIStatusBarItem defaultDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v7];

  id v8 = +[STUIStatusBarItem defaultDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v8];

  return v2;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUIStatusBarFullBackgroundActivityItem detailDisplayIdentifier];

  if (v8 == v6)
  {
    uint64_t v13 = +[STUIStatusBarAnimationFactory noAnimation];
    double v14 = +[STUIStatusBarTimeItem timeDisplayIdentifier];
    [v7 addSubAnimation:v13 forDisplayItemWithIdentifier:v14];

    objc_super v15 = +[STUIStatusBarAnimationFactory noAnimation];
    double v16 = +[STUIStatusBarItem defaultDisplayIdentifier];
    [v7 addSubAnimation:v15 forDisplayItemWithIdentifier:v16];

    double v17 = +[STUIStatusBarAnimationFactory noAnimation];
    double v18 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
    [v7 addSubAnimation:v17 forDisplayItemWithIdentifier:v18];

    id v12 = v7;
  }
  else
  {
    uint64_t v9 = +[STUIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier];
    if ((id)v9 == v6)
    {
    }
    else
    {
      uint64_t v10 = (void *)v9;
      id v11 = +[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier];

      if (v11 != v6)
      {
        v21.receiver = self;
        v21.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
        id v12 = [(STUIStatusBarVisualProvider_Phone *)&v21 additionAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
        goto LABEL_8;
      }
    }
    id v12 = [(STUIStatusBarVisualProvider_LegacyPhone *)self _animationForSingleLineDualCarrier];
  }
LABEL_8:
  double v19 = v12;

  return v19;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUIStatusBarFullBackgroundActivityItem detailDisplayIdentifier];

  if (v8 == v6)
  {
    uint64_t v12 = [(STUIStatusBarVisualProvider_LegacyPhone *)self _backgroundActivityDetailRemovalAnimation];
  }
  else
  {
    uint64_t v9 = +[STUIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier];
    if ((id)v9 == v6)
    {
    }
    else
    {
      uint64_t v10 = (void *)v9;
      id v11 = +[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier];

      if (v11 != v6)
      {
        v15.receiver = self;
        v15.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
        uint64_t v12 = [(STUIStatusBarVisualProvider_Phone *)&v15 removalAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
        goto LABEL_8;
      }
    }
    uint64_t v12 = [(STUIStatusBarVisualProvider_LegacyPhone *)self _animationForSingleLineDualCarrier];
  }
LABEL_8:
  uint64_t v13 = (void *)v12;

  return v13;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[STUIStatusBarItem defaultDisplayIdentifier];
  if ((id)v4 == v3)
  {
  }
  else
  {
    BOOL v5 = (void *)v4;
    id v6 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];

    if (v6 != v3)
    {
      id v7 = 0;
      goto LABEL_6;
    }
  }
  id v7 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  [v7 setIconScale:0.75];
LABEL_6:

  return v7;
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"leadingPartIdentifier"])
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = 0;
    id v6 = @"expandedLowerLeading";
    id v7 = @"expandedLeading";
LABEL_3:
    objc_msgSend(v5, "setWithObjects:", @"leading", v7, v6, v20, v21);
    uint64_t v9 = LABEL_15:;
    goto LABEL_16;
  }
  if ([v4 isEqual:@"trailingPartIdentifier"])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"trailing", @"expandedTrailing", @"expandedLowerTrailing", 0, v21);
    goto LABEL_15;
  }
  if ([v4 isEqual:@"centerPartIdentifier"])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"center", @"background", 0, v19, v21);
    goto LABEL_15;
  }
  if ([v4 isEqual:@"normalPartIdentifier"])
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = @"trailing";
    uint64_t v21 = 0;
    id v6 = @"background";
    id v7 = @"center";
    goto LABEL_3;
  }
  if ([v4 isEqual:@"expandedPartIdentifier"]) {
    goto LABEL_11;
  }
  if ([v4 isEqual:@"expandedPartTopIdentifier"])
  {
LABEL_13:
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    double v17 = @"expandedTrailing";
    double v18 = 0;
    goto LABEL_14;
  }
  if ([v4 isEqual:@"expandedBottomPartIdentifier"])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"expandedLowerLeading", @"expandedLowerTrailing", 0, v19, v21);
    goto LABEL_15;
  }
  if ([v4 isEqual:@"visibleExpandedPartIdentifier"])
  {
    uint64_t v12 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    uint64_t v13 = [v12 currentData];
    double v14 = [v13 secondaryCellularEntry];
    if ([v14 isEnabled])
    {
      objc_super v15 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      unint64_t v16 = [v15 orientation] - 1;

      if (v16 <= 1)
      {
LABEL_11:
        id v8 = (void *)MEMORY[0x1E4F1CAD0];
        double v19 = @"expandedLowerTrailing";
        uint64_t v21 = 0;
        double v17 = @"expandedLowerLeading";
        double v18 = @"expandedTrailing";
LABEL_14:
        objc_msgSend(v8, "setWithObjects:", @"expandedLeading", v17, v18, v19, v21);
        goto LABEL_15;
      }
    }
    else
    {
    }
    goto LABEL_13;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
LABEL_16:
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
  id v4 = [(STUIStatusBarVisualProvider_iOS *)&v19 styleAttributesForStyle:a3];
  uint64_t v5 = [v4 mode];
  if ((unint64_t)(v5 - 1) >= 3)
  {
    if (v5) {
      goto LABEL_12;
    }
    [v4 setIconScale:1.0];
    uint64_t v12 = [v4 traitCollection];
    [v12 displayScale];
    if (v13 <= 2.5) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
    [v4 setIconSize:v14];

    objc_super v15 = [(STUIStatusBarVisualProvider_LegacyPhone *)self normalFont];
    [v4 setFont:v15];

    unint64_t v16 = [v4 font];
    [v4 setSmallFont:v16];

    uint64_t v11 = [(STUIStatusBarVisualProvider_LegacyPhone *)self timeFont];
  }
  else
  {
    [v4 setIconScale:1.07];
    id v6 = [v4 traitCollection];
    [v6 displayScale];
    if (v7 <= 2.5) {
      uint64_t v8 = 5;
    }
    else {
      uint64_t v8 = 2;
    }
    [v4 setIconSize:v8];

    uint64_t v9 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedFont];
    [v4 setFont:v9];

    uint64_t v10 = [v4 font];
    [v4 setSmallFont:v10];

    uint64_t v11 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedFont];
  }
  double v17 = (void *)v11;
  [v4 setEmphasizedFont:v11];

LABEL_12:
  [v4 setImageNamePrefixes:&unk_1F2F9C870];
  return v4;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"clockPartIdentifier"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = +[STUIStatusBarTimeItem timeDisplayIdentifier];
    double v7 = [v5 setWithObject:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
    double v7 = [(STUIStatusBarVisualProvider_iOS *)&v9 displayItemIdentifiersForPartWithIdentifier:v4];
  }

  return v7;
}

- (CGRect)clockBoundsForLayoutItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = +[STUIStatusBarTimeItem timeDisplayIdentifier];

  double v7 = [v4 view];

  if (v5 == v6)
  {
    unint64_t v16 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    double v17 = [v16 currentAggregatedData];
    double v18 = [v17 shortTimeEntry];
    objc_super v19 = [v18 stringValue];

    _StatusBar_UITimeSizeForLabel();
    double v13 = v20;
    double v15 = v21;
    double v9 = 0.0;

    double v11 = 0.0;
  }
  else
  {
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }

  double v22 = v9;
  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  id v4 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v4 avoidanceFrame];
  -[STUIStatusBarVisualProvider_LegacyPhone _updateExpandedConstraintsForAvoidanceFrame:](self, "_updateExpandedConstraintsForAvoidanceFrame:");

  id v6 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  uint64_t v5 = [v6 currentAggregatedData];
  [(STUIStatusBarVisualProvider_LegacyPhone *)self _updateLowerRegionsWithData:v5];
}

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  id v6 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v6 avoidanceFrame];
  -[STUIStatusBarVisualProvider_LegacyPhone _updateExpandedConstraintsForAvoidanceFrame:](self, "_updateExpandedConstraintsForAvoidanceFrame:");
}

- (void)_updateLowerRegionsWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 secondaryCellularEntry];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isEnabled])
    {
      double v7 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      BOOL v8 = (unint64_t)([v7 orientation] - 1) < 2;
    }
    else
    {
      BOOL v8 = 0;
    }
    uint64_t v13 = 0;
    double v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    double v9 = [(STUIStatusBarVisualProvider_LegacyPhone *)self regionIdentifiersForPartWithIdentifier:@"expandedBottomPartIdentifier"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__STUIStatusBarVisualProvider_LegacyPhone__updateLowerRegionsWithData___block_invoke;
    v11[3] = &unk_1E6AA37E8;
    BOOL v12 = v8;
    v11[4] = self;
    v11[5] = &v13;
    [v9 enumerateObjectsUsingBlock:v11];

    [(STUIStatusBarVisualProvider_LegacyPhone *)self _updateBackgroundHeight];
    if (v8) {
      [(STUIStatusBarVisualProvider_LegacyPhone *)self dualLineExpandedBaselineOffset];
    }
    else {
      [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedBaselineOffset];
    }
    -[NSLayoutConstraint setConstant:](self->_expandedLeadingBottomConstraint, "setConstant:");
    if (*((unsigned char *)v14 + 24))
    {
      double v10 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      [v10 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
    }
    _Block_object_dispose(&v13, 8);
  }
}

- (void)_updateExpandedTrailingRegion
{
  if ([(STUIStatusBarVisualProvider_iOS *)self expanded])
  {
    id v3 = (void *)*MEMORY[0x1E4FB2608];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72__STUIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke;
    v4[3] = &unk_1E6AA37A0;
    v4[4] = self;
    [v3 _performBlockAfterCATransactionCommits:v4];
  }
}

- (void)updateDataForService:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
  id v4 = a3;
  [(STUIStatusBarVisualProvider_iOS *)&v6 updateDataForService:v4];
  uint64_t v5 = objc_msgSend(v4, "secondaryCellularEntry", v6.receiver, v6.super_class);

  if (v5) {
    -[STUIStatusBarDisplayItemPlacementGroup setEnabled:](self->_lowerWifiGroup, "setEnabled:", [v5 type] != 0);
  }
}

- (void)_updateBackgroundHeight
{
  [(STUIStatusBarVisualProvider_LegacyPhone *)self effectiveHeight];
  backgroundHeightConstraint = self->_backgroundHeightConstraint;
  -[NSLayoutConstraint setConstant:](backgroundHeightConstraint, "setConstant:");
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(STUIStatusBarVisualProvider_iOS *)self expanded] != a3)
  {
    uint64_t v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    objc_super v6 = [v5 currentAggregatedData];
    double v7 = [v6 backgroundActivityEntry];
    int v8 = [v7 isEnabled];

    if (v8)
    {
      if (v3) {
        uint64_t v9 = 4;
      }
      else {
        uint64_t v9 = 1;
      }
      double v10 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      double v11 = [v10 regions];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __55__STUIStatusBarVisualProvider_LegacyPhone_setExpanded___block_invoke;
      v13[3] = &__block_descriptor_40_e46_v32__0__NSString_8__STUIStatusBarRegion_16_B24l;
      v13[4] = v9;
      [v11 enumerateKeysAndObjectsUsingBlock:v13];
    }
    v12.receiver = self;
    v12.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
    [(STUIStatusBarVisualProvider_iOS *)&v12 setExpanded:v3];
    [(STUIStatusBarVisualProvider_LegacyPhone *)self _updateBackgroundHeight];
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
        int v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 orientation] - 3,
        v8,
        v9 <= 1))
  {
    double v26 = 0.0;
    double v27 = 0.0;
    double v10 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v10 frame];
    CGFloat MidX = CGRectGetMidX(v29);
    objc_super v12 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    STUIStatusBarGetLeadingAndTrailingParts([v12 _shouldReverseLayoutDirection], &v27, &v26, x, y, width, height, MidX);

    BOOL v13 = v26 > 0.0 || v27 > 0.0;
    if (v13)
    {
      [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
      double v27 = v14 + v27;
      [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
      double v26 = v15 + v26;
    }
    char v16 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedTopMiddleConstraint];
    [v16 setActive:v13 ^ 1];

    double v17 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedLeadingBannerConstraint];
    [v17 setActive:v13];

    double v18 = -v27;
    objc_super v19 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedLeadingBannerConstraint];
    [v19 setConstant:v18];

    double v20 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedTrailingBannerConstraint];
    [v20 setActive:v13];

    double v21 = v26;
    double v22 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedTrailingBannerConstraint];
    [v22 setConstant:v21];
  }
  else
  {
    double v23 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedTopMiddleConstraint];
    [v23 setActive:1];

    double v24 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedLeadingBannerConstraint];
    [v24 setActive:0];

    id v25 = [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedTrailingBannerConstraint];
    [v25 setActive:0];
  }
}

- (void)_updateLockScreenSizing
{
  BOOL v3 = [(STUIStatusBarVisualProvider_iOS *)self onLockScreen];
  if (v3)
  {
    [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedBaselineOffset];
    double v5 = v4;
    [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
    double v7 = v6;
    [(STUIStatusBarVisualProvider_LegacyPhone *)self expandedFont];
  }
  else
  {
    [(STUIStatusBarVisualProvider_LegacyPhone *)self baselineOffset];
    double v5 = v8;
    [(STUIStatusBarVisualProvider_iOS *)self itemSpacing];
    double v7 = v9;
    [(STUIStatusBarVisualProvider_LegacyPhone *)self normalFont];
  double v10 = };
  [v10 capHeight];
  double v12 = v11;

  double v13 = v12 + 1.0;
  [(STUIStatusBarCellularItem *)self->_condensedCellularItem setMarqueeServiceName:v3];
  [(STUIStatusBarRegionAxisStackingLayout *)self->_leadingHorizontalLayout setInterspace:v7];
  [(STUIStatusBarRegionAxisCenteringLayout *)self->_centerHorizontalLayout setInterspace:v7];
  [(STUIStatusBarRegionAxisStackingLayout *)self->_trailingHorizontalLayout setInterspace:v7];
  [(NSLayoutConstraint *)self->_leadingTopConstraint setConstant:v5];
  [(NSLayoutConstraint *)self->_centerTopConstraint setConstant:v5];
  [(NSLayoutConstraint *)self->_trailingTopConstraint setConstant:v5];
  [(NSLayoutConstraint *)self->_leadingHeightConstraint setConstant:v13];
  [(NSLayoutConstraint *)self->_centerHeightConstraint setConstant:v13];
  trailingHeightConstraint = self->_trailingHeightConstraint;
  [(NSLayoutConstraint *)trailingHeightConstraint setConstant:v13];
}

- (void)setOnLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(STUIStatusBarVisualProvider_iOS *)self onLockScreen] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)STUIStatusBarVisualProvider_LegacyPhone;
    [(STUIStatusBarVisualProvider_iOS *)&v5 setOnLockScreen:v3];
    [(STUIStatusBarVisualProvider_LegacyPhone *)self _updateLockScreenSizing];
    [(STUIStatusBarVisualProvider_LegacyPhone *)self _updateBackgroundHeight];
  }
}

- (id)_backgroundActivityDetailRemovalAnimation
{
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x4010000000;
  v33[3] = "";
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v34 = *MEMORY[0x1E4F1DB20];
  long long v35 = v2;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x4010000000;
  v30[3] = "";
  long long v31 = v34;
  long long v32 = v2;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x4010000000;
  v27[3] = "";
  long long v28 = v34;
  long long v29 = v2;
  v24[0] = 0;
  v24[1] = v24;
  void v24[2] = 0x4010000000;
  v24[3] = "";
  long long v25 = v34;
  long long v26 = v2;
  BOOL v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke;
  v23[3] = &unk_1E6AA3810;
  v23[4] = v33;
  v23[5] = v24;
  double v12 = +[STUIStatusBarAnimation animationWithBlock:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_4;
  v22[3] = &unk_1E6AA3838;
  v22[5] = v5;
  v22[6] = v7;
  v22[7] = v9;
  v22[8] = v11;
  void v22[4] = v33;
  [v12 setPrepareBlock:v22];
  [v12 setPriority:100];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_5;
  v21[3] = &unk_1E6AA3810;
  v21[4] = v24;
  v21[5] = v33;
  double v13 = +[STUIStatusBarAnimation animationWithBlock:v21];
  [v13 setPriority:200];
  double v14 = +[STUIStatusBarTimeItem timeDisplayIdentifier];
  [v12 addSubAnimation:v13 forDisplayItemWithIdentifier:v14];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_9;
  v20[3] = &unk_1E6AA3810;
  v20[4] = v27;
  v20[5] = v30;
  double v15 = +[STUIStatusBarAnimation animationWithBlock:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__STUIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_12;
  v19[3] = &unk_1E6AA3888;
  v19[6] = v5;
  v19[7] = v7;
  v19[8] = v9;
  v19[9] = v11;
  v19[4] = v27;
  v19[5] = v30;
  [v15 setPrepareBlock:v19];
  [v15 setPriority:50];
  char v16 = +[STUIStatusBarItem defaultDisplayIdentifier];
  [v12 addSubAnimation:v15 forDisplayItemWithIdentifier:v16];

  double v17 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
  [v12 addSubAnimation:v15 forDisplayItemWithIdentifier:v17];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v33, 8);
  return v12;
}

- (id)regionIdentifiersForBackgroundLumaView:(id)a3
{
  id v4 = a3;
  id v5 = [(STUIStatusBarVisualProvider_LegacyPhone *)self leadingBackgroundLumaView];

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"leading", 0);
  }
  else
  {
    id v6 = [(STUIStatusBarVisualProvider_LegacyPhone *)self trailingBackgroundLumaView];

    if (v6 == v4)
    {
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"trailing", 0);
    }
    else
    {
      id v7 = [(STUIStatusBarVisualProvider_LegacyPhone *)self centerBackgroundLumaView];

      if (v7 != v4)
      {
        uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"center", 0);
    }
  uint64_t v8 = };
LABEL_9:
  uint64_t v9 = (void *)v8;

  return v9;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacementGroup)lowerWifiGroup
{
  return self->_lowerWifiGroup;
}

- (void)setLowerWifiGroup:(id)a3
{
}

- (NSLayoutConstraint)backgroundHeightConstraint
{
  return self->_backgroundHeightConstraint;
}

- (void)setBackgroundHeightConstraint:(id)a3
{
}

- (STUIStatusBarCellularItem)condensedCellularItem
{
  return self->_condensedCellularItem;
}

- (void)setCondensedCellularItem:(id)a3
{
}

- (NSLayoutConstraint)leadingTopConstraint
{
  return self->_leadingTopConstraint;
}

- (void)setLeadingTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingHeightConstraint
{
  return self->_leadingHeightConstraint;
}

- (void)setLeadingHeightConstraint:(id)a3
{
}

- (STUIStatusBarRegionAxisStackingLayout)leadingHorizontalLayout
{
  return self->_leadingHorizontalLayout;
}

- (void)setLeadingHorizontalLayout:(id)a3
{
}

- (NSLayoutConstraint)centerTopConstraint
{
  return self->_centerTopConstraint;
}

- (void)setCenterTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)centerHeightConstraint
{
  return self->_centerHeightConstraint;
}

- (void)setCenterHeightConstraint:(id)a3
{
}

- (STUIStatusBarRegionAxisCenteringLayout)centerHorizontalLayout
{
  return self->_centerHorizontalLayout;
}

- (void)setCenterHorizontalLayout:(id)a3
{
}

- (NSLayoutConstraint)trailingTopConstraint
{
  return self->_trailingTopConstraint;
}

- (void)setTrailingTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingHeightConstraint
{
  return self->_trailingHeightConstraint;
}

- (void)setTrailingHeightConstraint:(id)a3
{
}

- (STUIStatusBarRegionAxisStackingLayout)trailingHorizontalLayout
{
  return self->_trailingHorizontalLayout;
}

- (void)setTrailingHorizontalLayout:(id)a3
{
}

- (NSLayoutConstraint)expandedLeadingBottomConstraint
{
  return self->_expandedLeadingBottomConstraint;
}

- (void)setExpandedLeadingBottomConstraint:(id)a3
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

- (_UILumaTrackingBackdropView)leadingBackgroundLumaView
{
  return self->_leadingBackgroundLumaView;
}

- (void)setLeadingBackgroundLumaView:(id)a3
{
}

- (_UILumaTrackingBackdropView)centerBackgroundLumaView
{
  return self->_centerBackgroundLumaView;
}

- (void)setCenterBackgroundLumaView:(id)a3
{
}

- (_UILumaTrackingBackdropView)trailingBackgroundLumaView
{
  return self->_trailingBackgroundLumaView;
}

- (void)setTrailingBackgroundLumaView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBackgroundLumaView, 0);
  objc_storeStrong((id *)&self->_centerBackgroundLumaView, 0);
  objc_storeStrong((id *)&self->_leadingBackgroundLumaView, 0);
  objc_storeStrong((id *)&self->_expandedTopMiddleConstraint, 0);
  objc_storeStrong((id *)&self->_expandedTrailingBannerConstraint, 0);
  objc_storeStrong((id *)&self->_expandedLeadingBannerConstraint, 0);
  objc_storeStrong((id *)&self->_expandedTrailingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_expandedLeadingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_trailingHorizontalLayout, 0);
  objc_storeStrong((id *)&self->_trailingHeightConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTopConstraint, 0);
  objc_storeStrong((id *)&self->_centerHorizontalLayout, 0);
  objc_storeStrong((id *)&self->_centerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_centerTopConstraint, 0);
  objc_storeStrong((id *)&self->_leadingHorizontalLayout, 0);
  objc_storeStrong((id *)&self->_leadingHeightConstraint, 0);
  objc_storeStrong((id *)&self->_leadingTopConstraint, 0);
  objc_storeStrong((id *)&self->_condensedCellularItem, 0);
  objc_storeStrong((id *)&self->_backgroundHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lowerWifiGroup, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end