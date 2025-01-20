@interface _UIStatusBarVisualProvider_LegacyPhone
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
- (NSLayoutConstraint)expandedLeadingBottomConstraint;
- (NSLayoutConstraint)expandedTrailingBottomConstraint;
- (NSLayoutConstraint)leadingHeightConstraint;
- (NSLayoutConstraint)leadingTopConstraint;
- (NSLayoutConstraint)trailingHeightConstraint;
- (NSLayoutConstraint)trailingTopConstraint;
- (_UIStatusBarCellularItem)condensedCellularItem;
- (_UIStatusBarDisplayItemPlacementGroup)lowerWifiGroup;
- (_UIStatusBarRegionAxisCenteringLayout)centerHorizontalLayout;
- (_UIStatusBarRegionAxisStackingLayout)leadingHorizontalLayout;
- (_UIStatusBarRegionAxisStackingLayout)trailingHorizontalLayout;
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
- (id)regionIdentifiersForPartWithIdentifier:(id)a3;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)setupInContainerView:(id)a3;
- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4;
- (id)styleAttributesForStyle:(int64_t)a3;
- (id)timeFont;
- (id)willUpdateWithData:(id)a3;
- (void)_updateBackgroundHeight;
- (void)_updateExpandedTrailingRegion;
- (void)_updateLockScreenSizing;
- (void)_updateLowerRegionsWithData:(id)a3;
- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5;
- (void)itemCreated:(id)a3;
- (void)orientationUpdatedFromOrientation:(int64_t)a3;
- (void)setBackgroundHeightConstraint:(id)a3;
- (void)setCenterHeightConstraint:(id)a3;
- (void)setCenterHorizontalLayout:(id)a3;
- (void)setCenterTopConstraint:(id)a3;
- (void)setCondensedCellularItem:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedLeadingBottomConstraint:(id)a3;
- (void)setExpandedTrailingBottomConstraint:(id)a3;
- (void)setLeadingHeightConstraint:(id)a3;
- (void)setLeadingHorizontalLayout:(id)a3;
- (void)setLeadingTopConstraint:(id)a3;
- (void)setLowerWifiGroup:(id)a3;
- (void)setOnLockScreen:(BOOL)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
- (void)setTrailingHeightConstraint:(id)a3;
- (void)setTrailingHorizontalLayout:(id)a3;
- (void)setTrailingTopConstraint:(id)a3;
- (void)updateDataForService:(id)a3;
@end

@implementation _UIStatusBarVisualProvider_LegacyPhone

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
  [a1 _heightExpanded:1];
  double v4 = v3;
  double v5 = -1.0;
  result.height = v4;
  result.width = v5;
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
  BOOL v4 = [(_UIStatusBarVisualProvider_iOS *)self expanded]
    || [(_UIStatusBarVisualProvider_iOS *)self onLockScreen];
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
  double v2 = +[UIScreen mainScreen];
  [v2 scale];
  UIRoundToScale(14.5, v3);
  double v5 = v4;

  return v5;
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
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)qword_1EB25E4F8;
  if (qword_1EB25E4F8) {
    BOOL v4 = _MergedGlobals_19_10 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    _MergedGlobals_19_10 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:12.0 weight:*(double *)off_1E52D6BF8];
    v6 = (void *)qword_1EB25E4F8;
    qword_1EB25E4F8 = v5;

    double v3 = (void *)qword_1EB25E4F8;
  }
  return v3;
}

- (id)timeFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25E500;
  if (unk_1EB25E500) {
    BOOL v4 = byte_1EB25E4F1 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25E4F1 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:12.0 weight:*(double *)off_1E52D6C00];
    v6 = (void *)unk_1EB25E500;
    unk_1EB25E500 = v5;

    double v3 = (void *)unk_1EB25E500;
  }
  return v3;
}

- (id)expandedFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25E508;
  if (unk_1EB25E508) {
    BOOL v4 = byte_1EB25E4F2 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25E4F2 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:14.0 weight:*(double *)off_1E52D6BF8];
    v6 = (void *)unk_1EB25E508;
    unk_1EB25E508 = v5;

    double v3 = (void *)unk_1EB25E508;
  }
  return v3;
}

- (id)pillFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25E510;
  if (unk_1EB25E510) {
    BOOL v4 = byte_1EB25E4F3 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25E4F3 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:12.0 weight:*(double *)off_1E52D6C00];
    v6 = (void *)unk_1EB25E510;
    unk_1EB25E510 = v5;

    double v3 = (void *)unk_1EB25E510;
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
  BOOL v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  v185 = [MEMORY[0x1E4F1CA48] array];
  [(_UIStatusBarVisualProvider_LegacyPhone *)self baselineOffset];
  double v8 = v7;
  [(_UIStatusBarVisualProvider_LegacyPhone *)self expandedBaselineOffset];
  double v181 = v9;
  [(_UIStatusBarVisualProvider_LegacyPhone *)self edgeInsets];
  double v11 = v10;
  double v13 = v12;
  [(_UIStatusBarVisualProvider_iOS *)self itemSpacing];
  double v15 = v14;
  [(_UIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
  double v17 = v16;
  [(_UIStatusBarVisualProvider_LegacyPhone *)self regionSpacing];
  double v19 = v18;
  v20 = [(_UIStatusBarVisualProvider_LegacyPhone *)self normalFont];
  [v20 capHeight];
  double v22 = v21 + 1.0;

  v23 = [(_UIStatusBarVisualProvider_LegacyPhone *)self expandedFont];
  [v23 capHeight];
  double v25 = v24 + 1.0;

  v26 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"leading"];
  v27 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v28 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v28 setAlignment:3];
  [(_UIStatusBarRegionAxisStackingLayout *)v28 setInterspace:v15];
  leadingHorizontalLayout = self->_leadingHorizontalLayout;
  self->_leadingHorizontalLayout = v28;

  [(_UIStatusBarRegionAxesLayout *)v27 setHorizontalLayout:self->_leadingHorizontalLayout];
  v30 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v27 setVerticalLayout:v30];

  [(_UIStatusBarRegion *)v26 setLayout:v27];
  -[_UIStatusBarRegion setActionInsets:](v26, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  v31 = [(_UIStatusBarRegion *)v26 layoutItem];
  v32 = [v31 bottomAnchor];
  v33 = [v5 topAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:v8];
  leadingTopConstraint = self->_leadingTopConstraint;
  self->_leadingTopConstraint = v34;

  [v6 addObject:self->_leadingTopConstraint];
  v36 = [v31 leadingAnchor];
  v37 = [v5 leadingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37 constant:v11];
  [v6 addObject:v38];

  v184 = v31;
  v39 = [v31 heightAnchor];
  v40 = [v39 constraintEqualToConstant:v22];
  leadingHeightConstraint = self->_leadingHeightConstraint;
  self->_leadingHeightConstraint = v40;

  [v6 addObject:self->_leadingHeightConstraint];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v31);

  [v185 addObject:v26];
  v42 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"trailing"];
  v43 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v44 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v44 setAlignment:4];
  [(_UIStatusBarRegionAxisStackingLayout *)v44 setInterspace:v15];
  trailingHorizontalLayout = self->_trailingHorizontalLayout;
  self->_trailingHorizontalLayout = v44;

  [(_UIStatusBarRegionAxesLayout *)v43 setHorizontalLayout:self->_trailingHorizontalLayout];
  v46 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v43 setVerticalLayout:v46];

  [(_UIStatusBarRegion *)v42 setLayout:v43];
  -[_UIStatusBarRegion setActionInsets:](v42, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  v47 = [(_UIStatusBarRegion *)v42 layoutItem];
  v48 = [v47 bottomAnchor];
  v49 = [v5 topAnchor];
  v50 = [v48 constraintEqualToAnchor:v49 constant:v8];
  trailingTopConstraint = self->_trailingTopConstraint;
  self->_trailingTopConstraint = v50;

  [v6 addObject:self->_trailingTopConstraint];
  v52 = [v47 trailingAnchor];
  v53 = [v5 trailingAnchor];
  double v54 = -v13;
  v55 = [v52 constraintEqualToAnchor:v53 constant:v54];
  [v6 addObject:v55];

  v183 = v47;
  v56 = [v47 heightAnchor];
  v57 = [v56 constraintEqualToConstant:v22];
  trailingHeightConstraint = self->_trailingHeightConstraint;
  self->_trailingHeightConstraint = v57;

  [v6 addObject:self->_trailingHeightConstraint];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v47);

  [v185 addObject:v42];
  v59 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"center"];
  v60 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v61 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  [(_UIStatusBarRegionAxisCenteringLayout *)v61 setInterspace:v15];
  centerHorizontalLayout = self->_centerHorizontalLayout;
  self->_centerHorizontalLayout = v61;

  [(_UIStatusBarRegionAxesLayout *)v60 setHorizontalLayout:self->_centerHorizontalLayout];
  v63 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v60 setVerticalLayout:v63];

  [(_UIStatusBarRegion *)v59 setLayout:v60];
  v64 = [(_UIStatusBarRegion *)v59 layoutItem];
  v65 = [v64 centerXAnchor];
  v66 = [v5 centerXAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  [v6 addObject:v67];

  v68 = [v64 widthAnchor];
  v69 = [v68 constraintEqualToConstant:0.0];
  LODWORD(v70) = 1132068864;
  v71 = objc_msgSend(v69, "_ui_constraintWithPriority:", v70);
  [v6 addObject:v71];

  v72 = [v64 bottomAnchor];
  v73 = [v5 topAnchor];
  v74 = [v72 constraintEqualToAnchor:v73 constant:v8];
  centerTopConstraint = self->_centerTopConstraint;
  self->_centerTopConstraint = v74;

  [v6 addObject:self->_centerTopConstraint];
  v76 = [v64 heightAnchor];
  v77 = [v76 constraintEqualToConstant:v22];
  centerHeightConstraint = self->_centerHeightConstraint;
  self->_centerHeightConstraint = v77;

  [v6 addObject:self->_centerHeightConstraint];
  v79 = [v64 leadingAnchor];
  v80 = [v31 trailingAnchor];
  v81 = [v79 constraintEqualToAnchor:v80 constant:v19];
  [v6 addObject:v81];

  v82 = [v183 leadingAnchor];
  v83 = [v64 trailingAnchor];
  v84 = [v82 constraintEqualToAnchor:v83 constant:v19];
  [v6 addObject:v84];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v64);
  [v185 addObject:v59];

  v85 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"background"];
  v86 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v87 = +[_UIStatusBarRegionAxisFillingLayout fillingLayout];
  [(_UIStatusBarRegionAxesLayout *)v86 setHorizontalLayout:v87];

  v88 = +[_UIStatusBarRegionAxisFillingLayout fillingLayout];
  [(_UIStatusBarRegionAxesLayout *)v86 setVerticalLayout:v88];

  [(_UIStatusBarRegion *)v85 setLayout:v86];
  v89 = [(_UIStatusBarRegion *)v85 layoutItem];
  v90 = [v89 leadingAnchor];
  v91 = [v5 leadingAnchor];
  v92 = [v90 constraintEqualToAnchor:v91];
  [v6 addObject:v92];

  v93 = [v89 trailingAnchor];
  v94 = [v5 trailingAnchor];
  v95 = [v93 constraintEqualToAnchor:v94];
  [v6 addObject:v95];

  v96 = [v89 topAnchor];
  v97 = [v5 topAnchor];
  v98 = [v96 constraintEqualToAnchor:v97];
  [v6 addObject:v98];

  v99 = [v89 heightAnchor];
  [(id)objc_opt_class() height];
  objc_msgSend(v99, "constraintEqualToConstant:");
  v100 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  backgroundHeightConstraint = self->_backgroundHeightConstraint;
  self->_backgroundHeightConstraint = v100;

  [v6 addObject:self->_backgroundHeightConstraint];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v89);

  [v185 addObject:v85];
  [(_UIStatusBarVisualProvider_LegacyPhone *)self lowerExpandedBaselineOffset];
  double v103 = v102;
  v104 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedLeading"];
  v105 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v106 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v106 setAlignment:3];
  [(_UIStatusBarRegionAxisStackingLayout *)v106 setInterspace:v17];
  [(_UIStatusBarRegionAxesLayout *)v105 setHorizontalLayout:v106];

  v107 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v105 setVerticalLayout:v107];

  [(_UIStatusBarRegion *)v104 setLayout:v105];
  -[_UIStatusBarRegion setActionInsets:](v104, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  [(_UIStatusBarRegion *)v104 disableWithToken:10];
  v108 = [(_UIStatusBarRegion *)v104 layoutItem];
  v109 = [v108 bottomAnchor];
  v110 = [v5 topAnchor];
  v111 = [v109 constraintEqualToAnchor:v110 constant:v181];
  expandedLeadingBottomConstraint = self->_expandedLeadingBottomConstraint;
  self->_expandedLeadingBottomConstraint = v111;

  [(NSLayoutConstraint *)self->_expandedLeadingBottomConstraint setIdentifier:@"UISB-expanded-leading-bottom"];
  [v6 addObject:self->_expandedLeadingBottomConstraint];
  v113 = [v108 leadingAnchor];
  v114 = [v5 leadingAnchor];
  v115 = [v113 constraintEqualToAnchor:v114 constant:v11];
  [v6 addObject:v115];

  v116 = [v108 heightAnchor];
  v117 = [v116 constraintEqualToConstant:v25];
  [v6 addObject:v117];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v108);
  [v185 addObject:v104];

  v118 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedTrailing"];
  v119 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v120 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v120 setAlignment:4];
  [(_UIStatusBarRegionAxisStackingLayout *)v120 setInterspace:v17];
  [(_UIStatusBarRegionAxesLayout *)v119 setHorizontalLayout:v120];

  v121 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v119 setVerticalLayout:v121];

  [(_UIStatusBarRegion *)v118 setLayout:v119];
  -[_UIStatusBarRegion setActionInsets:](v118, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  [(_UIStatusBarRegion *)v118 disableWithToken:10];
  v122 = [(_UIStatusBarRegion *)v118 layoutItem];
  v123 = [v122 bottomAnchor];
  v124 = [v5 topAnchor];
  v125 = [v123 constraintEqualToAnchor:v124 constant:v181];
  expandedTrailingBottomConstraint = self->_expandedTrailingBottomConstraint;
  self->_expandedTrailingBottomConstraint = v125;

  [(NSLayoutConstraint *)self->_expandedTrailingBottomConstraint setIdentifier:@"UISB-expanded-trailing-bottom"];
  [v6 addObject:self->_expandedTrailingBottomConstraint];
  v127 = [v122 trailingAnchor];
  v128 = [v5 trailingAnchor];
  v129 = [v127 constraintEqualToAnchor:v128 constant:v54];
  [v6 addObject:v129];

  v130 = [v122 heightAnchor];
  v131 = [v130 constraintEqualToConstant:v25];
  [v6 addObject:v131];

  v132 = [v122 leadingAnchor];
  v182 = v108;
  v133 = [v108 trailingAnchor];
  v134 = [v132 constraintEqualToAnchor:v133 constant:v17];
  [v6 addObject:v134];

  v135 = [v122 widthAnchor];
  v136 = [v108 widthAnchor];
  v137 = [v135 constraintEqualToAnchor:v136];
  LODWORD(v138) = 1131741184;
  v139 = objc_msgSend(v137, "_ui_constraintWithPriority:", v138);
  [v6 addObject:v139];

  v180 = v122;
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v122);

  [v185 addObject:v118];
  v140 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedLowerLeading"];
  v141 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v142 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v142 setAlignment:3];
  [(_UIStatusBarRegionAxisStackingLayout *)v142 setInterspace:v17];
  [(_UIStatusBarRegionAxesLayout *)v141 setHorizontalLayout:v142];

  v143 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v141 setVerticalLayout:v143];

  [(_UIStatusBarRegion *)v140 setLayout:v141];
  [(_UIStatusBarRegion *)v140 disableWithToken:10];
  v144 = [(_UIStatusBarRegion *)v140 layoutItem];
  v145 = [v144 bottomAnchor];
  v146 = [v182 bottomAnchor];
  v147 = [v145 constraintEqualToAnchor:v146 constant:v103];
  [v6 addObject:v147];

  v148 = [v144 leadingAnchor];
  v149 = [v5 leadingAnchor];
  v150 = [v148 constraintEqualToAnchor:v149 constant:v11];
  [v6 addObject:v150];

  v151 = [v144 heightAnchor];
  v152 = [v151 constraintEqualToConstant:v25];
  [v6 addObject:v152];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v144);
  [v185 addObject:v140];

  v153 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedLowerTrailing"];
  v154 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v155 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v155 setAlignment:4];
  [(_UIStatusBarRegionAxisStackingLayout *)v155 setInterspace:v17];
  [(_UIStatusBarRegionAxesLayout *)v154 setHorizontalLayout:v155];

  v156 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v154 setVerticalLayout:v156];

  [(_UIStatusBarRegion *)v153 setLayout:v154];
  [(_UIStatusBarRegion *)v153 disableWithToken:10];
  v157 = [(_UIStatusBarRegion *)v153 layoutItem];
  v158 = [v157 bottomAnchor];
  v159 = [v122 bottomAnchor];
  v160 = [v158 constraintEqualToAnchor:v159 constant:v103];
  [v6 addObject:v160];

  v161 = [(_UIStatusBarRegion *)v153 layoutItem];
  v162 = [v161 trailingAnchor];
  v163 = [v5 trailingAnchor];
  v164 = [v162 constraintEqualToAnchor:v163 constant:v54];
  [v6 addObject:v164];

  v165 = [(_UIStatusBarRegion *)v153 layoutItem];
  v166 = [v165 heightAnchor];
  v167 = [v166 constraintEqualToConstant:v25];
  [v6 addObject:v167];

  v168 = [(_UIStatusBarRegion *)v153 layoutItem];
  v169 = [v168 leadingAnchor];
  v170 = [v144 trailingAnchor];
  v171 = [v169 constraintEqualToAnchor:v170 constant:v17];
  [v6 addObject:v171];

  v172 = [(_UIStatusBarRegion *)v153 layoutItem];
  v173 = [v172 widthAnchor];
  v174 = [v144 widthAnchor];
  v175 = [v173 constraintEqualToAnchor:v174];
  LODWORD(v176) = 1131741184;
  v177 = objc_msgSend(v175, "_ui_constraintWithPriority:", v176);
  [v6 addObject:v177];

  v178 = [(_UIStatusBarRegion *)v153 layoutItem];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v178);

  [v185 addObject:v153];
  [MEMORY[0x1E4F5B268] activateConstraints:v6];

  return v185;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v186[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    id v161 = v4;
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    LOBYTE(v137) = 1;
    double v9 = +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:1300 lowPriority:1000 cellularItemClass:v7 wifiItemClass:v8 cellularTypeClass:objc_opt_class() includeCellularName:1 allowDualNetwork:v137];
    double v10 = [v9 cellularGroup];
    uint64_t v11 = [v10 namePlacement];

    double v12 = [v9 cellularGroup];
    uint64_t v13 = [v12 dualNamePlacement];

    double v14 = [v9 cellularGroup];
    uint64_t v15 = [v14 dualNameAndTypePlacement];

    double v16 = +[_UIStatusBarItem defaultDisplayIdentifier];
    double v17 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v16, [v9 maximumPriority] + 1);
    v159 = (void *)v13;
    v160 = (void *)v11;
    v186[0] = v11;
    v186[1] = v13;
    v158 = (void *)v15;
    v186[2] = v15;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:3];
    double v19 = [v17 excludingPlacements:v18];

    if ([(_UIStatusBarVisualProvider_iOS *)self hasCellularCapability])
    {
      v20 = v6;
      [v6 addObject:v19];
      uint64_t v21 = 0;
      char v22 = 1;
    }
    else
    {
      v23 = +[_UIStatusBarItem defaultDisplayIdentifier];
      uint64_t v21 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v23 priority:30];

      uint64_t v185 = v21;
      char v22 = 1;
      double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v185 count:1];
      uint64_t v25 = [v19 excludingPlacements:v24];

      [v6 addObject:v25];
      v20 = v6;
      if (v21)
      {
        [v6 addObject:v21];
        char v22 = 0;
      }
      double v19 = (void *)v25;
    }
    v157 = v19;
    v170 = self;
    v26 = [MEMORY[0x1E4F1CA48] array];
    v27 = [v9 cellularGroup];
    v28 = [v27 placementsAffectedByAirplaneMode];
    [v26 addObjectsFromArray:v28];

    if ((v22 & 1) == 0) {
      [v26 addObject:v21];
    }
    v156 = (void *)v21;
    v29 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v30 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v29 priority:1400];
    v155 = v26;
    v31 = [v30 excludingPlacements:v26];
    v169 = v20;
    [v20 addObject:v31];

    uint64_t v32 = [v9 minimumPriority];
    v33 = +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", v32 - 5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v34 = [v9 cellularGroup];
    v35 = [v34 typePlacement];
    v184[0] = v35;
    v36 = [v9 cellularGroup];
    [v36 namePlacement];
    v37 = v9;
    v38 = v168 = v9;
    v184[1] = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:2];
    v40 = [v33 requiringAllPlacements:v39];

    v171 = [v37 placements];
    v143 = [v171 arrayByAddingObject:v40];
    v166 = +[_UIStatusBarCellularItem signalStrengthDisplayIdentifier];
    v183[0] = v166;
    v164 = +[_UIStatusBarCellularCondensedItem dualSignalStrengthDisplayIdentifier];
    v183[1] = v164;
    v162 = +[_UIStatusBarCellularItem warningDisplayIdentifier];
    v183[2] = v162;
    v152 = +[_UIStatusBarCellularItem rawDisplayIdentifier];
    v183[3] = v152;
    v150 = +[_UIStatusBarCellularItem nameDisplayIdentifier];
    v183[4] = v150;
    v147 = +[_UIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier];
    v183[5] = v147;
    v145 = +[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier];
    v183[6] = v145;
    v154 = v40;
    v41 = [v40 identifier];
    v183[7] = v41;
    v42 = +[_UIStatusBarCellularItem typeDisplayIdentifier];
    v183[8] = v42;
    v43 = +[_UIStatusBarWifiItem signalStrengthDisplayIdentifier];
    v183[9] = v43;
    v44 = +[_UIStatusBarWifiItem iconDisplayIdentifier];
    v183[10] = v44;
    v45 = +[_UIStatusBarWifiItem rawDisplayIdentifier];
    v183[11] = v45;
    v46 = +[_UIStatusBarCellularItem callForwardingDisplayIdentifier];
    v183[12] = v46;
    v47 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v183[13] = v47;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:14];
    v49 = _reorderedPlacementsFromGroupForLegacyLayout(v143, 0, v48);
    [v169 addObjectsFromArray:v49];

    v50 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v51 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v50, [v168 minimumPriority] - 10);
    [v169 addObject:v51];

    v172 = [MEMORY[0x1E4F1CA48] array];
    v52 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v167 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v52 priority:3000];

    v53 = +[_UIStatusBarLockItem textDisplayIdentifier];
    double v54 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v53 priority:2999];
    v55 = [v168 cellularGroup];
    v56 = [v55 dualNamePlacement];
    v182[0] = v56;
    v57 = [v168 cellularGroup];
    v58 = [v57 dualNameAndTypePlacement];
    v182[1] = v58;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:2];
    uint64_t v60 = [v54 excludingPlacements:v59];

    v61 = +[_UIStatusBarTimeItem timeDisplayIdentifier];
    v62 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v61 priority:3002];
    v181[0] = v60;
    v63 = [v168 cellularGroup];
    v64 = [v63 dualNamePlacement];
    v181[1] = v64;
    v65 = [v168 cellularGroup];
    v66 = [v65 dualNameAndTypePlacement];
    v181[2] = v66;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:3];
    v165 = [v62 excludingPlacements:v67];

    v68 = v172;
    [v172 addObject:v167];
    v153 = (void *)v60;
    [v172 addObject:v60];
    if (_UIGetFullWidthBackgroundActivity())
    {
      v69 = +[_UIStatusBarItem defaultDisplayIdentifier];
      double v70 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v69 priority:1950];

      v71 = +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
      v72 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v71 priority:1949];
      v180 = v70;
      v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v180 count:1];
      v74 = [v72 requiringAllPlacements:v73];

      v75 = +[_UIStatusBarFullBackgroundActivityItem detailDisplayIdentifier];
      v76 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v75 priority:5000];
      v179[0] = @"leading";
      v179[1] = @"center";
      v179[2] = @"trailing";
      v179[3] = @"expandedLeading";
      v179[4] = @"expandedTrailing";
      v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:5];
      v178[0] = v70;
      v178[1] = v74;
      v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:2];
      v79 = [v76 excludingAllPlacementsInRegions:v77 exceptPlacements:v78];

      v68 = v172;
      v80 = [(_UIStatusBarVisualProvider_Phone *)v170 pillRegionCoordinator];
      [v80 setBackgroundActivityDetailPlacement:v79];

      [v172 addObject:v70];
      [v172 addObject:v74];
      [v172 addObject:v79];
    }
    [v68 addObject:v165];
    v81 = [MEMORY[0x1E4F1CA48] array];
    v82 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v83 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v82 priority:1960];
    [v81 addObject:v83];

    v84 = +[_UIStatusBarIndicatorLocationItem groupWithPriority:1955];
    v85 = [v84 placements];
    [v81 addObjectsFromArray:v85];

    if ((_UIGetFullWidthBackgroundActivity() & 1) == 0)
    {
      v86 = +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];
      v87 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v86 priority:1950];

      [v81 addObject:v87];
    }
    v88 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v89 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v88 priority:1940];
    [v81 addObject:v89];

    [(_UIStatusBarVisualProvider_iOS *)v170 bluetoothPaddingInset];
    v90 = +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 800, 500);
    v163 = +[_UIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](_UIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", [v90 maximumPriority] + 1, objc_msgSend(v90, "minimumPriority") - 5);
    v139 = [v90 placements];
    v148 = +[_UIStatusBarBluetoothItem batteryDisplayIdentifier];
    v151 = v90;
    v177[0] = v148;
    v146 = [v90 bluetoothInsetPaddingItem];
    v144 = [v146 identifier];
    v177[1] = v144;
    v142 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[2] = v142;
    v141 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[3] = v141;
    v140 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[4] = v140;
    v91 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[5] = v91;
    v92 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[6] = v92;
    v93 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[7] = v93;
    v94 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[8] = v94;
    v95 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[9] = v95;
    v96 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[10] = v96;
    v97 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v177[11] = v97;
    v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:12];
    v99 = _reorderedPlacementsFromGroupForLegacyLayout(v139, 1, v98);
    [v81 addObjectsFromArray:v99];

    v100 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v101 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v100 priority:2];
    double v102 = v81;
    [v81 addObject:v101];

    double v103 = [v163 placements];
    v104 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v176[0] = v104;
    v105 = +[_UIStatusBarBatteryItem staticIconDisplayIdentifier];
    v176[1] = v105;
    v106 = +[_UIStatusBarBatteryItem percentDisplayIdentifier];
    v176[2] = v106;
    v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:3];
    v108 = _reorderedPlacementsFromGroupForLegacyLayout(v103, 1, v107);
    v149 = v102;
    [v102 addObjectsFromArray:v108];

    v109 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v110 = objc_opt_class();
    uint64_t v111 = objc_opt_class();
    LOBYTE(v138) = 0;
    v112 = +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:2500 lowPriority:2200 cellularItemClass:v110 wifiItemClass:v111 cellularTypeClass:objc_opt_class() includeCellularName:1 allowDualNetwork:v138];
    uint64_t v113 = [v112 wifiGroup];
    lowerWifiGroup = v170->_lowerWifiGroup;
    v170->_lowerWifiGroup = (_UIStatusBarDisplayItemPlacementGroup *)v113;

    v115 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v116 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v115 priority:5000];
    v117 = [(_UIStatusBarVisualProvider_iOS *)v170 expandedCellularPlacementsAffectedByAirplaneMode];
    v118 = [v112 cellularGroup];
    v119 = [v118 placementsAffectedByAirplaneMode];
    v120 = [v117 arrayByAddingObjectsFromArray:v119];
    v121 = [v116 excludingPlacements:v120];
    [v109 addObject:v121];

    v122 = [v112 placements];
    [v109 addObjectsFromArray:v122];

    v123 = [MEMORY[0x1E4F1CA48] array];
    v124 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v125 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v124 priority:1450];
    [v123 addObject:v125];

    [(_UIStatusBarVisualProvider_iOS *)v170 bluetoothPaddingInset];
    v126 = +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 1400, 1000);
    v127 = [v126 placements];
    [v123 addObjectsFromArray:v127];

    if (_UIGetFullWidthBackgroundActivity())
    {
      v128 = +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];
      v129 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v128 priority:2000];
      v175 = v129;
      v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v175 count:1];
    }
    else
    {
      v130 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v173[0] = @"leading";
    v173[1] = @"trailing";
    v174[0] = v169;
    v174[1] = v149;
    v173[2] = @"center";
    v173[3] = @"background";
    v174[2] = v172;
    v174[3] = v130;
    v173[4] = @"expandedLeading";
    v131 = [(_UIStatusBarVisualProvider_iOS *)v170 expandedLeadingPlacements];
    v174[4] = v131;
    v174[5] = v109;
    v173[5] = @"expandedLowerLeading";
    v173[6] = @"expandedTrailing";
    v132 = [(_UIStatusBarVisualProvider_iOS *)v170 expandedTrailingPlacements];
    v173[7] = @"expandedLowerTrailing";
    v174[6] = v132;
    v174[7] = v123;
    uint64_t v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v174 forKeys:v173 count:8];
    v134 = v170->_orderedDisplayItemPlacements;
    v170->_orderedDisplayItemPlacements = (NSDictionary *)v133;

    orderedDisplayItemPlacements = v170->_orderedDisplayItemPlacements;
    id v4 = v161;
  }
  v135 = [(NSDictionary *)orderedDisplayItemPlacements objectForKeyedSubscript:v4];

  return v135;
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
      objc_msgSend(v5, "setMarqueeServiceName:", -[_UIStatusBarVisualProvider_iOS onLockScreen](self, "onLockScreen"));
      objc_storeStrong((id *)&self->_condensedCellularItem, a3);
    }
    [v5 setTypeStringProvider:self];
  }
  else
  {
    v6 = [v12 identifier];
    uint64_t v7 = +[_UIStatusBarItem identifier];

    if (v6 == v7)
    {
      id v11 = v12;
      [(_UIStatusBarVisualProvider_LegacyPhone *)self smallPillSize];
      objc_msgSend(v11, "setPillSize:");
    }
    else
    {
      uint64_t v8 = [v12 identifier];
      double v9 = +[_UIStatusBarItem identifier];

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
    id v5 = _UINSLocalizedStringWithDefaultValue(@"GPRS", @"GPRS");
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
  if ((unint64_t)a3 <= 0xD)
  {
    if (((1 << a3) & 0x38C0) != 0)
    {
      double v9 = [v6 fontDescriptor];
      double v10 = [v9 fontDescriptorWithSymbolicTraits:64];

      id v11 = off_1E52D39B8;
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
      double v10 = [v7 fontDescriptor];
      id v11 = off_1E52D39B8;
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
  v23[1] = *MEMORY[0x1E4F143B8];
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
    v20.receiver = self;
    v20.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
    [(_UIStatusBarVisualProvider_Phone *)&v20 actionable:v8 highlighted:v6 initialPress:v5];
    goto LABEL_8;
  }
  id v11 = [v9 identifier];
  uint64_t v12 = +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];
  if (v11 != (void *)v12)
  {
    uint64_t v13 = (void *)v12;
    double v14 = [v10 identifier];
    double v15 = +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

    if (v14 == v15) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }

LABEL_10:
  double v16 = [v10 highlightView];
  if (!v16)
  {
    double v16 = objc_alloc_init(_UIStatusBarRoundedCornerView);
    [(UIView *)v16 setAutoresizingMask:18];
    double v17 = [v10 identifier];
    double v18 = +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

    if (v17 == v18) {
      [(_UIStatusBarRoundedCornerView *)v16 setCornerRadius:0.0];
    }
    [v10 setHighlightView:v16];
  }
  v23[0] = v16;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78___UIStatusBarVisualProvider_LegacyPhone_actionable_highlighted_initialPress___block_invoke;
  v21[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  BOOL v22 = v6;
  +[UIButton _setVisuallyHighlighted:v6 forViews:v19 initialPress:v5 highlightBlock:v21];

LABEL_8:
}

- (id)willUpdateWithData:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
  id v4 = a3;
  BOOL v5 = [(_UIStatusBarVisualProvider_Phone *)&v15 willUpdateWithData:v4];
  BOOL v6 = [v4 backgroundActivityEntry];

  if (v6)
  {
    uint64_t v7 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    id v8 = [v7 currentAggregatedData];
    id v9 = [v8 backgroundActivityEntry];

    LODWORD(v7) = [v6 isEnabled];
    if (v7 != [v9 isEnabled])
    {
      if ([v6 isEnabled])
      {
        if ([(_UIStatusBarVisualProvider_iOS *)self expanded]) {
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
      id v11 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      uint64_t v12 = [v11 regions];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __61___UIStatusBarVisualProvider_LegacyPhone_willUpdateWithData___block_invoke;
      v14[3] = &__block_descriptor_40_e45_v32__0__NSString_8___UIStatusBarRegion_16_B24l;
      v14[4] = v10;
      [v12 enumerateKeysAndObjectsUsingBlock:v14];
    }
  }

  return v5;
}

- (id)_animationForSingleLineDualCarrier
{
  double v2 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.2];
  double v3 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.2];
  [v3 setPriority:10];
  id v4 = +[_UIStatusBarWifiItem iconDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v4];

  BOOL v5 = +[_UIStatusBarWifiItem rawDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v5];

  BOOL v6 = +[_UIStatusBarWifiItem signalStrengthDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v6];

  uint64_t v7 = +[_UIStatusBarItem defaultDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v7];

  id v8 = +[_UIStatusBarItem defaultDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v8];

  return v2;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIStatusBarFullBackgroundActivityItem detailDisplayIdentifier];

  if (v8 == v6)
  {
    uint64_t v13 = +[_UIStatusBarAnimationFactory noAnimation];
    double v14 = +[_UIStatusBarTimeItem timeDisplayIdentifier];
    [v7 addSubAnimation:v13 forDisplayItemWithIdentifier:v14];

    objc_super v15 = +[_UIStatusBarAnimationFactory noAnimation];
    double v16 = +[_UIStatusBarItem defaultDisplayIdentifier];
    [v7 addSubAnimation:v15 forDisplayItemWithIdentifier:v16];

    double v17 = +[_UIStatusBarAnimationFactory noAnimation];
    double v18 = +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
    [v7 addSubAnimation:v17 forDisplayItemWithIdentifier:v18];

    id v12 = v7;
  }
  else
  {
    uint64_t v9 = +[_UIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier];
    if ((id)v9 == v6)
    {
    }
    else
    {
      uint64_t v10 = (void *)v9;
      id v11 = +[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier];

      if (v11 != v6)
      {
        v21.receiver = self;
        v21.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
        id v12 = [(_UIStatusBarVisualProvider_Phone *)&v21 additionAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
        goto LABEL_8;
      }
    }
    id v12 = [(_UIStatusBarVisualProvider_LegacyPhone *)self _animationForSingleLineDualCarrier];
  }
LABEL_8:
  double v19 = v12;

  return v19;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIStatusBarFullBackgroundActivityItem detailDisplayIdentifier];

  if (v8 == v6)
  {
    uint64_t v12 = [(_UIStatusBarVisualProvider_LegacyPhone *)self _backgroundActivityDetailRemovalAnimation];
  }
  else
  {
    uint64_t v9 = +[_UIStatusBarCellularCondensedItem dualSingleLineNameDisplayIdentifier];
    if ((id)v9 == v6)
    {
    }
    else
    {
      uint64_t v10 = (void *)v9;
      id v11 = +[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeDisplayIdentifier];

      if (v11 != v6)
      {
        v15.receiver = self;
        v15.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
        uint64_t v12 = [(_UIStatusBarVisualProvider_Phone *)&v15 removalAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
        goto LABEL_8;
      }
    }
    uint64_t v12 = [(_UIStatusBarVisualProvider_LegacyPhone *)self _animationForSingleLineDualCarrier];
  }
LABEL_8:
  uint64_t v13 = (void *)v12;

  return v13;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_UIStatusBarItem defaultDisplayIdentifier];
  if ((id)v4 == v3)
  {
  }
  else
  {
    BOOL v5 = (void *)v4;
    id v6 = +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];

    if (v6 != v3)
    {
      id v7 = 0;
      goto LABEL_6;
    }
  }
  id v7 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
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
    objc_super v20 = 0;
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
  if ([v4 isEqual:0x1ED169E00])
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v20 = @"trailing";
    uint64_t v21 = 0;
    id v6 = @"background";
    id v7 = @"center";
    goto LABEL_3;
  }
  if ([v4 isEqual:0x1ED169E20]) {
    goto LABEL_11;
  }
  if ([v4 isEqual:0x1ED169E40])
  {
LABEL_13:
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    double v17 = @"expandedTrailing";
    double v18 = 0;
    goto LABEL_14;
  }
  if ([v4 isEqual:0x1ED169E60])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"expandedLowerLeading", @"expandedLowerTrailing", 0, v19, v21);
    goto LABEL_15;
  }
  if ([v4 isEqual:@"visibleExpandedPartIdentifier"])
  {
    uint64_t v12 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    uint64_t v13 = [v12 currentData];
    double v14 = [v13 secondaryCellularEntry];
    if ([v14 isEnabled])
    {
      objc_super v15 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
  v19.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
  id v4 = [(_UIStatusBarVisualProvider_iOS *)&v19 styleAttributesForStyle:a3];
  uint64_t v5 = [v4 mode];
  if ((unint64_t)(v5 - 1) >= 2)
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

    objc_super v15 = [(_UIStatusBarVisualProvider_LegacyPhone *)self normalFont];
    [v4 setFont:v15];

    unint64_t v16 = [v4 font];
    [v4 setSmallFont:v16];

    uint64_t v11 = [(_UIStatusBarVisualProvider_LegacyPhone *)self timeFont];
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

    uint64_t v9 = [(_UIStatusBarVisualProvider_LegacyPhone *)self expandedFont];
    [v4 setFont:v9];

    uint64_t v10 = [v4 font];
    [v4 setSmallFont:v10];

    uint64_t v11 = [(_UIStatusBarVisualProvider_LegacyPhone *)self expandedFont];
  }
  double v17 = (void *)v11;
  [v4 setEmphasizedFont:v11];

LABEL_12:
  [v4 setImageNamePrefixes:&unk_1ED3F1108];
  return v4;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"clockPartIdentifier"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = +[_UIStatusBarTimeItem timeDisplayIdentifier];
    double v7 = [v5 setWithObject:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
    double v7 = [(_UIStatusBarVisualProvider_iOS *)&v9 displayItemIdentifiersForPartWithIdentifier:v4];
  }

  return v7;
}

- (CGRect)clockBoundsForLayoutItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = +[_UIStatusBarTimeItem timeDisplayIdentifier];

  double v7 = [v4 view];

  if (v5 == v6)
  {
    unint64_t v16 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    double v17 = [v16 currentAggregatedData];
    double v18 = [v17 shortTimeEntry];
    objc_super v19 = [v18 stringValue];

    [v7 bounds];
    double v13 = _UIComputedSizeForLabel(v7, v19, 0, 1uLL, 0, 0, 0, v20, v21);
    double v15 = v22;
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

  double v23 = v9;
  double v24 = v11;
  double v25 = v13;
  double v26 = v15;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  id v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  id v4 = [v5 currentAggregatedData];
  [(_UIStatusBarVisualProvider_LegacyPhone *)self _updateLowerRegionsWithData:v4];
}

- (void)_updateLowerRegionsWithData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 secondaryCellularEntry];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isEnabled])
    {
      double v7 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
    double v9 = [(_UIStatusBarVisualProvider_LegacyPhone *)self regionIdentifiersForPartWithIdentifier:0x1ED169E60];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70___UIStatusBarVisualProvider_LegacyPhone__updateLowerRegionsWithData___block_invoke;
    v11[3] = &unk_1E53062E8;
    BOOL v12 = v8;
    v11[4] = self;
    v11[5] = &v13;
    [v9 enumerateObjectsUsingBlock:v11];

    [(_UIStatusBarVisualProvider_LegacyPhone *)self _updateBackgroundHeight];
    if (v8) {
      [(_UIStatusBarVisualProvider_LegacyPhone *)self dualLineExpandedBaselineOffset];
    }
    else {
      [(_UIStatusBarVisualProvider_LegacyPhone *)self expandedBaselineOffset];
    }
    -[NSLayoutConstraint setConstant:](self->_expandedLeadingBottomConstraint, "setConstant:");
    if (*((unsigned char *)v14 + 24))
    {
      double v10 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      [v10 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
    }
    _Block_object_dispose(&v13, 8);
  }
}

- (void)_updateExpandedTrailingRegion
{
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __71___UIStatusBarVisualProvider_LegacyPhone__updateExpandedTrailingRegion__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    [(id)UIApp _performBlockAfterCATransactionCommits:v3];
  }
}

- (void)updateDataForService:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
  id v4 = a3;
  [(_UIStatusBarVisualProvider_iOS *)&v6 updateDataForService:v4];
  id v5 = objc_msgSend(v4, "secondaryCellularEntry", v6.receiver, v6.super_class);

  if (v5) {
    -[_UIStatusBarDisplayItemPlacementGroup setEnabled:](self->_lowerWifiGroup, "setEnabled:", [v5 type] != 0);
  }
}

- (void)_updateBackgroundHeight
{
  [(_UIStatusBarVisualProvider_LegacyPhone *)self effectiveHeight];
  backgroundHeightConstraint = self->_backgroundHeightConstraint;
  -[NSLayoutConstraint setConstant:](backgroundHeightConstraint, "setConstant:");
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded] != a3)
  {
    id v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
      double v10 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      double v11 = [v10 regions];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54___UIStatusBarVisualProvider_LegacyPhone_setExpanded___block_invoke;
      v13[3] = &__block_descriptor_40_e45_v32__0__NSString_8___UIStatusBarRegion_16_B24l;
      v13[4] = v9;
      [v11 enumerateKeysAndObjectsUsingBlock:v13];
    }
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
    [(_UIStatusBarVisualProvider_iOS *)&v12 setExpanded:v3];
    [(_UIStatusBarVisualProvider_LegacyPhone *)self _updateBackgroundHeight];
  }
}

- (void)_updateLockScreenSizing
{
  BOOL v3 = [(_UIStatusBarVisualProvider_iOS *)self onLockScreen];
  if (v3)
  {
    [(_UIStatusBarVisualProvider_LegacyPhone *)self expandedBaselineOffset];
    double v5 = v4;
    [(_UIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
    double v7 = v6;
    [(_UIStatusBarVisualProvider_LegacyPhone *)self expandedFont];
  }
  else
  {
    [(_UIStatusBarVisualProvider_LegacyPhone *)self baselineOffset];
    double v5 = v8;
    [(_UIStatusBarVisualProvider_iOS *)self itemSpacing];
    double v7 = v9;
    [(_UIStatusBarVisualProvider_LegacyPhone *)self normalFont];
  double v10 = };
  [v10 capHeight];
  double v12 = v11;

  double v13 = v12 + 1.0;
  [(_UIStatusBarCellularItem *)self->_condensedCellularItem setMarqueeServiceName:v3];
  [(_UIStatusBarRegionAxisStackingLayout *)self->_leadingHorizontalLayout setInterspace:v7];
  [(_UIStatusBarRegionAxisCenteringLayout *)self->_centerHorizontalLayout setInterspace:v7];
  [(_UIStatusBarRegionAxisStackingLayout *)self->_trailingHorizontalLayout setInterspace:v7];
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
  if ([(_UIStatusBarVisualProvider_iOS *)self onLockScreen] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIStatusBarVisualProvider_LegacyPhone;
    [(_UIStatusBarVisualProvider_iOS *)&v5 setOnLockScreen:v3];
    [(_UIStatusBarVisualProvider_LegacyPhone *)self _updateLockScreenSizing];
    [(_UIStatusBarVisualProvider_LegacyPhone *)self _updateBackgroundHeight];
  }
}

- (id)_backgroundActivityDetailRemovalAnimation
{
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x4010000000;
  v33[3] = &unk_186D7DBA7;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v34 = *MEMORY[0x1E4F1DB20];
  long long v35 = v2;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x4010000000;
  v30[3] = &unk_186D7DBA7;
  long long v31 = v34;
  long long v32 = v2;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x4010000000;
  v27[3] = &unk_186D7DBA7;
  long long v28 = v34;
  long long v29 = v2;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x4010000000;
  v24[3] = &unk_186D7DBA7;
  long long v25 = v34;
  long long v26 = v2;
  BOOL v3 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke;
  v23[3] = &unk_1E5301EA0;
  v23[4] = v33;
  v23[5] = v24;
  double v12 = +[_UIStatusBarAnimation animationWithBlock:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_4;
  v22[3] = &unk_1E5306310;
  v22[5] = v5;
  v22[6] = v7;
  v22[7] = v9;
  v22[8] = v11;
  v22[4] = v33;
  [v12 setPrepareBlock:v22];
  [v12 setPriority:100];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_5;
  v21[3] = &unk_1E5301EA0;
  void v21[4] = v24;
  v21[5] = v33;
  double v13 = +[_UIStatusBarAnimation animationWithBlock:v21];
  [v13 setPriority:200];
  double v14 = +[_UIStatusBarTimeItem timeDisplayIdentifier];
  [v12 addSubAnimation:v13 forDisplayItemWithIdentifier:v14];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_9;
  v20[3] = &unk_1E5301EA0;
  v20[4] = v27;
  v20[5] = v30;
  uint64_t v15 = +[_UIStatusBarAnimation animationWithBlock:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83___UIStatusBarVisualProvider_LegacyPhone__backgroundActivityDetailRemovalAnimation__block_invoke_12;
  v19[3] = &unk_1E5306338;
  v19[6] = v5;
  v19[7] = v7;
  v19[8] = v9;
  v19[9] = v11;
  v19[4] = v27;
  v19[5] = v30;
  [v15 setPrepareBlock:v19];
  [v15 setPriority:50];
  char v16 = +[_UIStatusBarItem defaultDisplayIdentifier];
  [v12 addSubAnimation:v15 forDisplayItemWithIdentifier:v16];

  double v17 = +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
  [v12 addSubAnimation:v15 forDisplayItemWithIdentifier:v17];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v33, 8);
  return v12;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacementGroup)lowerWifiGroup
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

- (_UIStatusBarCellularItem)condensedCellularItem
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

- (_UIStatusBarRegionAxisStackingLayout)leadingHorizontalLayout
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

- (_UIStatusBarRegionAxisCenteringLayout)centerHorizontalLayout
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

- (_UIStatusBarRegionAxisStackingLayout)trailingHorizontalLayout
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

- (void).cxx_destruct
{
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