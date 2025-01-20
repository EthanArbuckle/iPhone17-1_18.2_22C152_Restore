@interface STUIStatusBarVisualProvider_Pad
+ (BOOL)regionCursorIsPill;
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
+ (NSDirectionalEdgeInsets)edgeInsets;
+ (UIEdgeInsets)regionCursorInsets;
+ (double)baselineOffset;
+ (double)height;
+ (double)regionCursorCornerRadius;
- (BOOL)_updateDateAndTimePlacements;
- (BOOL)wantsPillInExpandedTrailingPlacements;
- (CGRect)clockBoundsForLayoutItem:(id)a3;
- (CGSize)expandedPillSize;
- (CGSize)pillSize;
- (CGSize)smallPillSize;
- (NSDictionary)orderedDisplayItemPlacements;
- (NSDirectionalEdgeInsets)expandedEdgeInsets;
- (NSLayoutConstraint)leadingRegionTrailingAnchorConstraint;
- (NSLayoutConstraint)trailingRegionLeadingAnchorConstraint;
- (STUIStatusBarDisplayItemPlacement)datePlacement;
- (STUIStatusBarDisplayItemPlacement)timePlacement;
- (STUIStatusBarVisualProvider_Pad)init;
- (UIFont)clockFont;
- (_UILumaTrackingBackdropView)centerBackgroundLumaView;
- (_UILumaTrackingBackdropView)leadingBackgroundLumaView;
- (_UILumaTrackingBackdropView)trailingBackgroundLumaView;
- (double)airplaneShouldFadeForAnimationType:(int64_t)a3;
- (double)airplaneSpeedForAnimationType:(int64_t)a3;
- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4;
- (double)regionSpacing;
- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3;
- (id)expandedFont;
- (id)expandedPillFont;
- (id)normalFont;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3;
- (id)pillFont;
- (id)pillSmallFont;
- (id)regionIdentifiersForBackgroundLumaView:(id)a3;
- (id)regionIdentifiersForPartWithIdentifier:(id)a3;
- (id)setupInContainerView:(id)a3;
- (id)styleAttributesForStyle:(int64_t)a3;
- (void)_dateTimePreferencesUpdated;
- (void)_updateConstraintsForAvoidanceFrame:(CGRect)a3;
- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5;
- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5;
- (void)dealloc;
- (void)itemCreated:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCenterBackgroundLumaView:(id)a3;
- (void)setDatePlacement:(id)a3;
- (void)setLeadingBackgroundLumaView:(id)a3;
- (void)setLeadingRegionTrailingAnchorConstraint:(id)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
- (void)setTimePlacement:(id)a3;
- (void)setTrailingBackgroundLumaView:(id)a3;
- (void)setTrailingRegionLeadingAnchorConstraint:(id)a3;
- (void)sizeUpdatedFromSize:(CGSize)a3;
- (void)statusBarEnabledPartsUpdated;
@end

@implementation STUIStatusBarVisualProvider_Pad

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5 = a3;
  if ([v5 _isMainLikeScreen]) {
    int v6 = [v5 _isEmbeddedScreen] ^ 1;
  }
  else {
    int v6 = 0;
  }
  [v5 _displayCornerRadius];
  double v8 = v7;
  [v5 _displayCornerRadiusIgnoringZoom];
  if (v6 || v8 > 0.0)
  {
    v10 = objc_opt_class();
    STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v10, v5, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = a1;
  }
  v11 = v9;

  return (Class)v11;
}

+ (double)height
{
  return 20.0;
}

- (double)regionSpacing
{
  return 8.0;
}

+ (NSDirectionalEdgeInsets)edgeInsets
{
  double v2 = 0.0;
  double v3 = 6.0;
  double v4 = 0.0;
  double v5 = 5.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)expandedEdgeInsets
{
  double v2 = 0.0;
  double v3 = 6.0;
  double v4 = 0.0;
  double v5 = 5.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (double)baselineOffset
{
  return 14.0;
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

- (CGSize)expandedPillSize
{
  double v2 = 44.0;
  double v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)regionCursorInsets
{
  double v2 = -1.0;
  double v3 = -3.0;
  double v4 = -1.0;
  double v5 = -3.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)regionCursorIsPill
{
  return 0;
}

+ (double)regionCursorCornerRadius
{
  return 4.0;
}

- (id)normalFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)qword_1EC05EFC0;
  if (qword_1EC05EFC0) {
    BOOL v4 = _MergedGlobals_3 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    _MergedGlobals_3 = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09D0]];
    int v6 = (void *)qword_1EC05EFC0;
    qword_1EC05EFC0 = v5;

    double v3 = (void *)qword_1EC05EFC0;
  }
  return v3;
}

- (id)expandedFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = *(void **)algn_1EC05EFC8;
  if (*(void *)algn_1EC05EFC8) {
    BOOL v4 = byte_1EC05EFA9 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05EFA9 = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09D0]];
    int v6 = *(void **)algn_1EC05EFC8;
    *(void *)algn_1EC05EFC8 = v5;

    double v3 = *(void **)algn_1EC05EFC8;
  }
  return v3;
}

- (id)pillFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = *(void **)&algn_1EC05EFC8[8];
  if (*(void *)&algn_1EC05EFC8[8]) {
    BOOL v4 = byte_1EC05EFAA == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05EFAA = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB09E0]];
    int v6 = *(void **)&algn_1EC05EFC8[8];
    *(void *)&algn_1EC05EFC8[8] = v5;

    double v3 = *(void **)&algn_1EC05EFC8[8];
  }
  return v3;
}

- (id)pillSmallFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = *(void **)&algn_1EC05EFC8[16];
  if (*(void *)&algn_1EC05EFC8[16]) {
    BOOL v4 = byte_1EC05EFAB == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05EFAB = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0 weight:*MEMORY[0x1E4FB09B8]];
    int v6 = *(void **)&algn_1EC05EFC8[16];
    *(void *)&algn_1EC05EFC8[16] = v5;

    double v3 = *(void **)&algn_1EC05EFC8[16];
  }
  return v3;
}

- (id)expandedPillFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = *(void **)&algn_1EC05EFC8[24];
  if (*(void *)&algn_1EC05EFC8[24]) {
    BOOL v4 = byte_1EC05EFAC == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EC05EFAC = IsBoldTextEnabled;
    uint64_t v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB09D0]];
    int v6 = *(void **)&algn_1EC05EFC8[24];
    *(void *)&algn_1EC05EFC8[24] = v5;

    double v3 = *(void **)&algn_1EC05EFC8[24];
  }
  return v3;
}

- (UIFont)clockFont
{
  double v3 = +[STUIStatusBarSettingsDomain rootSettings];
  BOOL v4 = [v3 visualProviderSettings];
  int v5 = [v4 hasBoldTime];

  if (v5)
  {
    int v6 = (void *)MEMORY[0x1E4FB08E0];
    double v7 = [(STUIStatusBarVisualProvider_Pad *)self normalFont];
    [v7 pointSize];
    double v8 = objc_msgSend(v6, "systemFontOfSize:weight:");
  }
  else
  {
    double v8 = [(STUIStatusBarVisualProvider_Pad *)self normalFont];
  }
  return (UIFont *)v8;
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return 1;
}

- (STUIStatusBarVisualProvider_Pad)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  double v2 = [(STUIStatusBarVisualProvider_iOS *)&v5 init];
  double v3 = __UIKitUserDefaults();
  [v3 addObserver:v2 forKeyPath:@"StatusBarHidesDate" options:0 context:0];
  [v3 addObserver:v2 forKeyPath:@"StatusBarHidesAMPM" options:0 context:0];

  return v2;
}

- (void)dealloc
{
  double v3 = __UIKitUserDefaults();
  [v3 removeObserver:self forKeyPath:@"StatusBarHidesDate"];
  [v3 removeObserver:self forKeyPath:@"StatusBarHidesAMPM"];

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  [(STUIStatusBarVisualProvider_Pad *)&v4 dealloc];
}

- (id)setupInContainerView:(id)a3
{
  v159[3] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  int v6 = [v4 array];
  double v7 = [MEMORY[0x1E4F1CA48] array];
  [(id)objc_opt_class() baselineOffset];
  double v9 = v8;
  [(id)objc_opt_class() edgeInsets];
  double v11 = v10;
  double v13 = v12;
  [(STUIStatusBarVisualProvider_Pad *)self expandedEdgeInsets];
  double v153 = v14;
  double v155 = v15;
  [(STUIStatusBarVisualProvider_iOS *)self itemSpacing];
  double v17 = v16;
  [(STUIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
  double v152 = v18;
  [(STUIStatusBarVisualProvider_Pad *)self regionSpacing];
  double v20 = v19;
  v156 = self;
  v21 = [(STUIStatusBarVisualProvider_Pad *)self normalFont];
  [v21 capHeight];
  double v23 = v22;

  v24 = [(STUIStatusBarVisualProvider_Pad *)self expandedFont];
  [v24 capHeight];
  double v154 = v25;

  [(STUIStatusBarVisualProvider_Pad *)self pillSize];
  double v27 = v26;
  v28 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"leading"];
  v29 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v30 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v30 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v30 setInterspace:10.0];
  [(STUIStatusBarRegionAxesLayout *)v29 setHorizontalLayout:v30];

  v31 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v29 setVerticalLayout:v31];

  [(STUIStatusBarRegion *)v28 setLayout:v29];
  [(STUIStatusBarRegion *)v28 setOffsetable:1];
  -[STUIStatusBarRegion setActionInsets:](v28, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  v32 = +[STUIStatusBarHoverRegionAction leadingHoverAction];
  [(STUIStatusBarRegion *)v28 setHoverAction:v32];

  UIRoundToViewScale();
  -[STUIStatusBarRegion setExtendedHoverInsets:](v28, "setExtendedHoverInsets:", -v33, -v11, 0.0, 0.0);
  v34 = [(STUIStatusBarRegion *)v28 layoutItem];
  v35 = [v34 bottomAnchor];
  v36 = [v5 topAnchor];
  v37 = [v35 constraintEqualToAnchor:v36 constant:v9];
  [v6 addObject:v37];

  v38 = [v34 leadingAnchor];
  v39 = [v5 leadingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39 constant:v11];
  [v6 addObject:v40];

  v158 = v34;
  v41 = [v34 heightAnchor];
  v42 = [v41 constraintEqualToConstant:v23];
  [v6 addObject:v42];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v34);
  v43 = v7;
  id v157 = v7;
  [v7 addObject:v28];

  v44 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"trailing"];
  v45 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v46 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v46 setAlignment:4];
  [(STUIStatusBarRegionAxisStackingLayout *)v46 setInterspace:v17];
  [(STUIStatusBarRegionAxesLayout *)v45 setHorizontalLayout:v46];

  v47 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v45 setVerticalLayout:v47];

  [(STUIStatusBarRegion *)v44 setLayout:v45];
  [(STUIStatusBarRegion *)v44 setOffsetable:1];
  -[STUIStatusBarRegion setActionInsets:](v44, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  v48 = +[STUIStatusBarHoverRegionAction trailingHoverAction];
  [(STUIStatusBarRegion *)v44 setHoverAction:v48];

  UIRoundToViewScale();
  -[STUIStatusBarRegion setExtendedHoverInsets:](v44, "setExtendedHoverInsets:", -v49, 0.0, 0.0, -v13);
  v50 = [(STUIStatusBarRegion *)v44 layoutItem];
  v51 = [v50 bottomAnchor];
  v52 = [v5 topAnchor];
  v53 = [v51 constraintEqualToAnchor:v52 constant:v9];
  [v6 addObject:v53];

  v54 = [v50 trailingAnchor];
  v55 = [v5 trailingAnchor];
  v56 = [v54 constraintEqualToAnchor:v55 constant:-v13];
  [v6 addObject:v56];

  v57 = [v50 heightAnchor];
  v58 = [v57 constraintEqualToConstant:v23];
  [v6 addObject:v58];

  v59 = v50;
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v50);

  [v43 addObject:v44];
  v60 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"center"];
  v148 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v61 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v61 setInterspace:v17];
  [(STUIStatusBarRegionAxesLayout *)v148 setHorizontalLayout:v61];

  v62 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v148 setVerticalLayout:v62];

  [(STUIStatusBarRegion *)v60 setLayout:v148];
  [(STUIStatusBarRegion *)v60 setOffsetable:1];
  v63 = [(STUIStatusBarRegion *)v60 layoutItem];
  v64 = [v63 centerXAnchor];
  v65 = [v5 centerXAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  LODWORD(v67) = 1132068864;
  v68 = objc_msgSend(v66, "_ui_constraintWithPriority:", v67);
  [v6 addObject:v68];

  v69 = [v63 widthAnchor];
  v70 = [v69 constraintEqualToConstant:0.0];
  LODWORD(v71) = 1132003328;
  v72 = objc_msgSend(v70, "_ui_constraintWithPriority:", v71);
  [v6 addObject:v72];

  v73 = [v63 bottomAnchor];
  v74 = [v5 topAnchor];
  v75 = [v73 constraintEqualToAnchor:v74 constant:v9];
  [v6 addObject:v75];

  v76 = [v63 heightAnchor];
  v77 = [v76 constraintEqualToConstant:v23];
  [v6 addObject:v77];

  v78 = [v63 leadingAnchor];
  v79 = [v158 trailingAnchor];
  v80 = [v78 constraintGreaterThanOrEqualToAnchor:v79 constant:v20];
  [v6 addObject:v80];

  v81 = [v59 leadingAnchor];
  v82 = [v63 trailingAnchor];
  v83 = [v81 constraintGreaterThanOrEqualToAnchor:v82 constant:v20];
  [v6 addObject:v83];

  v84 = [v63 leadingAnchor];
  v85 = [v158 trailingAnchor];
  v86 = [v84 constraintEqualToAnchor:v85 constant:v20];
  LODWORD(v87) = 1132003328;
  v88 = objc_msgSend(v86, "_ui_constraintWithPriority:", v87);
  [v6 addObject:v88];

  v151 = v59;
  v89 = [v59 leadingAnchor];
  v150 = v63;
  v90 = [v63 trailingAnchor];
  v91 = [v89 constraintEqualToAnchor:v90 constant:v20];
  LODWORD(v92) = 1132003328;
  v93 = objc_msgSend(v91, "_ui_constraintWithPriority:", v92);
  [v6 addObject:v93];

  v94 = [v5 centerXAnchor];
  v95 = [v158 trailingAnchor];
  uint64_t v96 = [v94 constraintGreaterThanOrEqualToAnchor:v95 constant:0.0];
  leadingRegionTrailingAnchorConstraint = v156->_leadingRegionTrailingAnchorConstraint;
  v156->_leadingRegionTrailingAnchorConstraint = (NSLayoutConstraint *)v96;

  [v6 addObject:v156->_leadingRegionTrailingAnchorConstraint];
  v98 = [v59 leadingAnchor];
  v99 = [v5 centerXAnchor];
  uint64_t v100 = [v98 constraintGreaterThanOrEqualToAnchor:v99 constant:0.0];
  trailingRegionLeadingAnchorConstraint = v156->_trailingRegionLeadingAnchorConstraint;
  v156->_trailingRegionLeadingAnchorConstraint = (NSLayoutConstraint *)v100;

  [v6 addObject:v156->_trailingRegionLeadingAnchorConstraint];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v63);

  [v157 addObject:v60];
  v102 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedLeading"];
  v103 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v104 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v104 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v104 setInterspace:v152];
  [(STUIStatusBarRegionAxesLayout *)v103 setHorizontalLayout:v104];

  v105 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v103 setVerticalLayout:v105];

  [(STUIStatusBarRegion *)v102 setLayout:v103];
  id v106 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(STUIStatusBarRegion *)v102 setContentView:v106];

  [(STUIStatusBarRegion *)v102 setOffsetable:1];
  [(STUIStatusBarRegion *)v102 disableWithToken:10];
  v107 = [(STUIStatusBarRegion *)v102 layoutItem];
  v108 = [v107 leadingAnchor];
  v109 = [v5 leadingAnchor];
  v110 = [v108 constraintEqualToAnchor:v109 constant:v153];
  [v6 addObject:v110];

  v111 = [v107 bottomAnchor];
  v112 = [v5 topAnchor];
  v113 = [v111 constraintEqualToAnchor:v112 constant:v9];
  [v6 addObject:v113];

  v114 = [v107 heightAnchor];
  v115 = [v114 constraintEqualToConstant:v154];
  [v6 addObject:v115];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v107);
  [v157 addObject:v102];

  v116 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"expandedTrailing"];
  v117 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v118 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v118 setAlignment:4];
  [(STUIStatusBarRegionAxisStackingLayout *)v118 setInterspace:v152];
  [(STUIStatusBarRegionAxesLayout *)v117 setHorizontalLayout:v118];

  v119 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v117 setVerticalLayout:v119];

  [(STUIStatusBarRegion *)v116 setLayout:v117];
  id v120 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(STUIStatusBarRegion *)v116 setContentView:v120];

  [(STUIStatusBarRegion *)v116 setOffsetable:1];
  [(STUIStatusBarRegion *)v116 disableWithToken:10];
  v121 = [(STUIStatusBarRegion *)v116 layoutItem];
  v122 = [v121 leadingAnchor];
  v149 = v107;
  v123 = [v107 trailingAnchor];
  v124 = [v122 constraintEqualToAnchor:v123 constant:v20];
  [v6 addObject:v124];

  v125 = [v121 widthAnchor];
  v126 = [v107 widthAnchor];
  v127 = [v125 constraintEqualToAnchor:v126];
  LODWORD(v128) = 1131741184;
  v129 = objc_msgSend(v127, "_ui_constraintWithPriority:", v128);
  [v6 addObject:v129];

  v130 = [v121 trailingAnchor];
  v131 = [v5 trailingAnchor];
  v132 = [v130 constraintEqualToAnchor:v131 constant:-v155];
  [v6 addObject:v132];

  v133 = [v121 bottomAnchor];
  v134 = [v5 topAnchor];
  v135 = [v133 constraintEqualToAnchor:v134 constant:v9];
  [v6 addObject:v135];

  v136 = [v121 heightAnchor];
  v137 = [v136 constraintEqualToConstant:v154];
  [v6 addObject:v137];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v121);
  [v157 addObject:v116];

  v138 = STUIStatusBarAddLumaView(v5, v6, v158, 1, v27);
  [(STUIStatusBarVisualProvider_Pad *)v156 setLeadingBackgroundLumaView:v138];

  v139 = STUIStatusBarAddLumaView(v5, v6, v150, 0, v27);
  [(STUIStatusBarVisualProvider_Pad *)v156 setCenterBackgroundLumaView:v139];

  v140 = STUIStatusBarAddLumaView(v5, v6, v151, 2, v27);

  [(STUIStatusBarVisualProvider_Pad *)v156 setTrailingBackgroundLumaView:v140];
  id v141 = objc_alloc(MEMORY[0x1E4FB21F0]);
  v142 = [(STUIStatusBarVisualProvider_Pad *)v156 leadingBackgroundLumaView];
  v159[0] = v142;
  v143 = [(STUIStatusBarVisualProvider_Pad *)v156 centerBackgroundLumaView];
  v159[1] = v143;
  v144 = [(STUIStatusBarVisualProvider_Pad *)v156 trailingBackgroundLumaView];
  v159[2] = v144;
  v145 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:3];
  v146 = objc_msgSend(v141, "initWithTransitionBoundaries:minimumDifference:delegate:views:", v156, v145, 0.4, 0.7, 0.5);
  [(STUIStatusBarVisualProvider_iOS *)v156 setLumaTrackingGroup:v146];

  [MEMORY[0x1E4F28DC8] activateConstraints:v6];
  return v157;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    id v82 = v4;
    int v6 = +[STUIStatusBarCellularItem nameDisplayIdentifier];
    uint64_t v7 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v6 priority:1003];

    double v8 = +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
    double v9 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:1200];
    v105[0] = v7;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:1];
    uint64_t v11 = [v9 excludingPlacements:v10];

    double v12 = +[STUIStatusBarTimeItem timeDisplayIdentifier];
    double v13 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v12 priority:1201];
    v104[0] = v7;
    v104[1] = v11;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
    double v15 = [v13 excludingPlacements:v14];
    timePlacement = self->_timePlacement;
    self->_timePlacement = v15;

    double v17 = +[STUIStatusBarTimeItem dateDisplayIdentifier];
    double v18 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v17 priority:700];
    v103[0] = self->_timePlacement;
    v103[1] = v11;
    v90 = (void *)v11;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:2];
    double v20 = [v18 requiringAnyPlacements:v19];
    datePlacement = self->_datePlacement;
    self->_datePlacement = v20;

    v89 = self;
    [(STUIStatusBarVisualProvider_Pad *)self _updateDateAndTimePlacements];
    double v22 = [MEMORY[0x1E4F1CA48] array];
    double v23 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v24 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v23 priority:1103];
    v102[0] = v24;
    double v25 = +[STUIStatusBarItem defaultDisplayIdentifier];
    double v26 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v25 priority:1102];
    uint64_t v101 = v7;
    double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
    v28 = [v26 excludingPlacements:v27];
    v102[1] = v28;
    v102[2] = v7;
    v81 = (void *)v7;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:3];
    v91 = v22;
    [v22 addObjectsFromArray:v29];

    v30 = +[STUIStatusBarSettingsDomain rootSettings];
    v31 = [v30 visualProviderSettings];
    LODWORD(v25) = [v31 showsDateBeforeTime];

    if (v25)
    {
      v32 = v89;
      double v33 = v89->_timePlacement;
      v100[0] = v89->_datePlacement;
      v100[1] = v33;
      v100[2] = v90;
      v34 = v100;
    }
    else
    {
      v99[0] = v89->_timePlacement;
      v99[1] = v90;
      v32 = v89;
      v99[2] = v89->_datePlacement;
      v34 = v99;
    }
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    [v91 addObjectsFromArray:v35];

    uint64_t v36 = objc_opt_class();
    v83 = +[STUIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:3500 lowPriority:3200 cellularItemClass:v36 wifiItemClass:objc_opt_class() includeCellularName:0];
    [(STUIStatusBarVisualProvider_iOS *)v32 bluetoothPaddingInset];
    v37 = +[STUIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](STUIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 3400, 3100);
    v88 = +[STUIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](STUIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", [v83 maximumPriority] + 1, objc_msgSend(v37, "minimumPriority") - 5);
    v79 = [MEMORY[0x1E4F1CA48] array];
    v38 = +[STUIStatusBarItem defaultDisplayIdentifier];
    double v87 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v38 priority:3720];

    v86 = +[STUIStatusBarIndicatorLocationItem groupWithPriority:3710];
    v39 = +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];
    v40 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v39 priority:3700];

    v41 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v85 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v41 priority:3680];

    v42 = [v37 unstablePlacements];
    [v79 addObjectsFromArray:v42];

    [(STUIStatusBarVisualProvider_iOS *)v32 itemSpacing];
    v44 = v37;
    v84 = v37;
    v45 = +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", [v37 minimumPriority] - 2, v43 * -2.0 + 8.0, 0.0);
    v46 = v40;
    v80 = v40;
    v97 = v40;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
    v48 = [v45 requiringAllPlacements:v47];
    double v49 = [v44 unstablePlacements];
    v50 = [v48 requiringAnyPlacements:v49];
    v98[0] = v50;
    v98[1] = v40;
    [(STUIStatusBarVisualProvider_iOS *)v32 itemSpacing];
    v52 = +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", [v40 priority] - 1, v51 * -2.0 + 8.0, 0.0);
    uint64_t v96 = v46;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
    v54 = [v52 requiringAllPlacements:v53];
    v98[2] = v54;
    v98[3] = v87;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:4];
    [v79 addObjectsFromArray:v55];

    v56 = [v86 placements];
    [v79 addObjectsFromArray:v56];

    v95[0] = v85;
    v57 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v58 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v57 priority:3600];
    v59 = [v83 cellularGroup];
    v60 = [v59 placementsAffectedByAirplaneMode];
    v61 = [v58 excludingPlacements:v60];
    v95[1] = v61;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
    [v79 addObjectsFromArray:v62];

    v63 = [v83 placements];
    [v79 addObjectsFromArray:v63];

    v64 = [v84 stablePlacements];
    [v79 addObjectsFromArray:v64];

    v65 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v66 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v65 priority:3730];
    [v79 addObject:v66];

    double v67 = [v88 placements];
    [v79 addObjectsFromArray:v67];

    v93[0] = @"leading";
    v93[1] = @"trailing";
    v94[0] = v91;
    v94[1] = v79;
    v93[2] = @"center";
    v68 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v69 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v68 priority:2000];
    v92[0] = v69;
    v70 = +[STUIStatusBarLockItem textDisplayIdentifier];
    double v71 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v70 priority:1999];
    v92[1] = v71;
    v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
    v94[2] = v72;
    v93[3] = @"expandedLeading";
    v73 = [(STUIStatusBarVisualProvider_iOS *)v89 expandedLeadingPlacements];
    v94[3] = v73;
    v93[4] = @"expandedTrailing";
    v74 = [(STUIStatusBarVisualProvider_iOS *)v89 expandedTrailingPlacements];
    v94[4] = v74;
    uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:5];
    v76 = v89->_orderedDisplayItemPlacements;
    v89->_orderedDisplayItemPlacements = (NSDictionary *)v75;

    orderedDisplayItemPlacements = v89->_orderedDisplayItemPlacements;
    id v4 = v82;
  }
  v77 = [(NSDictionary *)orderedDisplayItemPlacements objectForKeyedSubscript:v4];

  return v77;
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"leadingPartIdentifier"])
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    double v9 = @"expandedLeading";
    double v10 = 0;
LABEL_3:
    id v5 = @"leading";
LABEL_6:
    objc_msgSend(v4, "setWithObjects:", v5, v9, v10, v11);
    uint64_t v6 = LABEL_7:;
    goto LABEL_8;
  }
  if ([v3 isEqual:@"trailingPartIdentifier"])
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    double v9 = @"expandedTrailing";
    double v10 = 0;
    id v5 = @"trailing";
    goto LABEL_6;
  }
  if ([v3 isEqual:@"centerPartIdentifier"])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"center"];
  }
  else
  {
    if ([v3 isEqual:@"normalPartIdentifier"])
    {
      id v4 = (void *)MEMORY[0x1E4F1CAD0];
      double v10 = @"center";
      uint64_t v11 = 0;
      double v9 = @"trailing";
      goto LABEL_3;
    }
    if (([v3 isEqual:@"expandedPartIdentifier"] & 1) != 0
      || [v3 isEqual:@"visibleExpandedPartIdentifier"])
    {
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"expandedLeading", @"expandedTrailing", 0, v11);
      goto LABEL_7;
    }
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }
LABEL_8:
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqual:@"fittingLeadingPartIdentifier"])
  {
    id v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    if ([(STUIStatusBarVisualProvider_iOS *)self expanded])
    {
      v16[0] = @"expandedLeading";
      uint64_t v6 = (__CFString **)v16;
    }
    else
    {
      double v15 = @"leading";
      uint64_t v6 = &v15;
    }
LABEL_11:
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    uint64_t v9 = [v5 displayItemIdentifiersInRegionsWithIdentifiers:v8];
    goto LABEL_12;
  }
  if ([v4 isEqual:@"fittingTrailingPartIdentifier"])
  {
    id v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    if ([(STUIStatusBarVisualProvider_iOS *)self expanded])
    {
      double v14 = @"expandedTrailing";
      uint64_t v6 = &v14;
    }
    else
    {
      double v13 = @"trailing";
      uint64_t v6 = &v13;
    }
    goto LABEL_11;
  }
  if ([v4 isEqual:@"clockPartIdentifier"])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = +[STUIStatusBarTimeItem shortTimeDisplayIdentifier];
    double v8 = +[STUIStatusBarTimeItem timeDisplayIdentifier];
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v5, v8, 0);
LABEL_12:
    double v10 = (void *)v9;

    goto LABEL_13;
  }
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  double v10 = [(STUIStatusBarVisualProvider_iOS *)&v12 displayItemIdentifiersForPartWithIdentifier:v4];
LABEL_13:

  return v10;
}

- (CGRect)clockBoundsForLayoutItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  uint64_t v6 = +[STUIStatusBarTimeItem timeDisplayIdentifier];

  uint64_t v7 = [v4 view];

  if (v5 == v6)
  {
    double v16 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    double v17 = [v16 currentAggregatedData];
    double v18 = [v17 shortTimeEntry];
    double v19 = [v18 stringValue];

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

- (id)styleAttributesForStyle:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  id v4 = [(STUIStatusBarVisualProvider_iOS *)&v17 styleAttributesForStyle:a3];
  uint64_t v5 = [v4 mode];
  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5 == 1)
    {
      [v4 setIconScale:1.16];
      double v8 = [v4 traitCollection];
      [v8 displayScale];
      [v4 setIconSize:15];

      uint64_t v7 = [(STUIStatusBarVisualProvider_Pad *)self expandedFont];
      goto LABEL_6;
    }
    if (v5) {
      goto LABEL_7;
    }
  }
  [v4 setIconScale:1.0];
  uint64_t v6 = [v4 traitCollection];
  [v6 displayScale];
  [v4 setIconSize:14];

  uint64_t v7 = [(STUIStatusBarVisualProvider_Pad *)self normalFont];
LABEL_6:
  double v9 = (void *)v7;
  [v4 setFont:v7];

LABEL_7:
  double v10 = +[STUIStatusBarSettingsDomain rootSettings];
  double v11 = [v10 visualProviderSettings];
  int v12 = [v11 hasBoldTime];

  if (v12)
  {
    double v13 = (void *)MEMORY[0x1E4FB08E0];
    double v14 = [(STUIStatusBarVisualProvider_Pad *)self normalFont];
    [v14 pointSize];
    double v15 = objc_msgSend(v13, "systemFontOfSize:weight:");
    [v4 setEmphasizedFont:v15];
  }
  else
  {
    double v14 = [v4 font];
    [v4 setEmphasizedFont:v14];
  }

  [v4 setImageNamePrefixes:&unk_1F2F9C858];
  return v4;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v7 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
    double v8 = [(STUIStatusBarVisualProvider_Pad *)self pillFont];
    [v7 setFont:v8];

    double v9 = [(STUIStatusBarVisualProvider_Pad *)self pillSmallFont];
    [v7 setSmallFont:v9];

    [(STUIStatusBarVisualProvider_Pad *)self pillSize];
  }
  else
  {
    id v6 = +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];

    if (v6 != v4)
    {
      uint64_t v7 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
    double v11 = [(STUIStatusBarVisualProvider_Pad *)self expandedPillFont];
    [v7 setFont:v11];

    int v12 = [(STUIStatusBarVisualProvider_Pad *)self expandedPillFont];
    [v7 setSmallFont:v12];

    [(STUIStatusBarVisualProvider_Pad *)self expandedPillSize];
  }
  [v7 setIconScale:v10 / 21.3333333];
  [v7 setSymbolScale:2];
LABEL_7:

  return v7;
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v10 = 0;
LABEL_8:
    v16.receiver = self;
    v16.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    [(STUIStatusBarVisualProvider_iOS *)&v16 actionable:v8 highlighted:v6 initialPress:v5];
    goto LABEL_9;
  }
  id v9 = v8;
  double v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  double v11 = [v9 identifier];
  int v12 = +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];

  if (v11 != v12) {
    goto LABEL_8;
  }
  double v13 = [v10 highlightView];
  if (!v13)
  {
    double v13 = objc_alloc_init(STUIStatusBarRoundedCornerView);
    [v10 setHighlightView:v13];
  }
  double v14 = (void *)MEMORY[0x1E4FB14D0];
  v19[0] = v13;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__STUIStatusBarVisualProvider_Pad_actionable_highlighted_initialPress___block_invoke;
  v17[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  BOOL v18 = v6;
  [v14 _setVisuallyHighlighted:v6 forViews:v15 initialPress:v5 highlightBlock:v17];

LABEL_9:
}

- (void)statusBarEnabledPartsUpdated
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  id v4 = [v3 regionWithIdentifier:@"leading"];

  BOOL v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  BOOL v6 = [v5 regionWithIdentifier:@"trailing"];

  uint64_t v7 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  id v8 = [v7 containerView];
  id v9 = [v8 centerXAnchor];

  double v10 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  double v11 = [v10 containerView];
  int v12 = [v11 centerXAnchor];

  double v13 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  double v14 = [v13 regionWithIdentifier:@"center"];
  char v15 = [v14 isEnabled];

  if ((v15 & 1) == 0)
  {
    if ([v4 isEnabled])
    {
      if ([v6 isEnabled]) {
        goto LABEL_7;
      }
      objc_super v16 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      objc_super v17 = [v16 containerView];
      uint64_t v18 = [v17 trailingAnchor];
      double v19 = v9;
      id v9 = (void *)v18;
    }
    else
    {
      objc_super v16 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      objc_super v17 = [v16 containerView];
      uint64_t v20 = [v17 leadingAnchor];
      double v19 = v12;
      int v12 = (void *)v20;
    }
  }
LABEL_7:
  double v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  double v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  double v23 = [(NSLayoutConstraint *)self->_leadingRegionTrailingAnchorConstraint firstAnchor];

  if (v9 != v23)
  {
    [v21 addObject:self->_leadingRegionTrailingAnchorConstraint];
    double v24 = (void *)MEMORY[0x1E4F28DC8];
    v46[0] = self->_leadingRegionTrailingAnchorConstraint;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    v26 = double v25 = v6;
    [v24 deactivateConstraints:v26];

    double v27 = [v4 layoutItem];
    v28 = [v27 trailingAnchor];
    [(NSLayoutConstraint *)self->_leadingRegionTrailingAnchorConstraint constant];
    objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:constant:", v28);
    v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leadingRegionTrailingAnchorConstraint = self->_leadingRegionTrailingAnchorConstraint;
    self->_leadingRegionTrailingAnchorConstraint = v29;

    BOOL v6 = v25;
    [v22 addObject:self->_leadingRegionTrailingAnchorConstraint];
  }
  v31 = [(NSLayoutConstraint *)self->_trailingRegionLeadingAnchorConstraint secondAnchor];

  if (v12 != v31)
  {
    [v21 addObject:self->_trailingRegionLeadingAnchorConstraint];
    v32 = [v6 layoutItem];
    [v32 leadingAnchor];
    v34 = double v33 = v6;
    [(NSLayoutConstraint *)self->_trailingRegionLeadingAnchorConstraint constant];
    objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:constant:", v12);
    v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    trailingRegionLeadingAnchorConstraint = self->_trailingRegionLeadingAnchorConstraint;
    self->_trailingRegionLeadingAnchorConstraint = v35;

    BOOL v6 = v33;
    [v22 addObject:self->_trailingRegionLeadingAnchorConstraint];
  }
  if ([v21 count])
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v21];
    [MEMORY[0x1E4F28DC8] activateConstraints:v22];
    v37 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v37 avoidanceFrame];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;

    v47.origin.x = v39;
    v47.origin.y = v41;
    v47.size.width = v43;
    v47.size.height = v45;
    if (!CGRectIsEmpty(v47)) {
      -[STUIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:", v39, v41, v43, v45);
    }
  }
}

- (void)_updateConstraintsForAvoidanceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v8 bounds];
  r1.origin.CGFloat x = v9;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  double v16 = 0.0;
  if (CGRectIsEmpty(v52))
  {
    double v17 = 0.0;
    goto LABEL_16;
  }
  v53.origin.CGFloat x = r1.origin.x;
  v53.origin.CGFloat y = v11;
  v53.size.CGFloat width = v13;
  v53.size.CGFloat height = v15;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  CGRect v54 = CGRectIntersection(v53, v62);
  IsEmptCGFloat y = CGRectIsEmpty(v54);
  double v19 = v11;
  double v17 = 0.0;
  if (!IsEmpty)
  {
    double v20 = v15;
    CGFloat v21 = r1.origin.x;
    CGFloat v22 = v19;
    CGFloat v23 = v13;
    CGFloat v24 = v13;
    CGFloat v25 = v20;
    double MidX = CGRectGetMidX(*(CGRect *)(&v19 - 1));
    v55.origin.CGFloat x = x;
    v55.origin.CGFloat y = y;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    double v48 = fmax(MidX - CGRectGetMinX(v55), 0.0);
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v56);
    v57.origin.CGFloat x = r1.origin.x;
    CGFloat v47 = v22;
    v57.origin.CGFloat y = v22;
    v57.size.CGFloat width = v23;
    CGFloat v28 = v25;
    v57.size.CGFloat height = v25;
    double v29 = fmax(MaxX - CGRectGetMidX(v57), 0.0);
    v30 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    v31 = [v30 regionWithIdentifier:@"center"];
    char v32 = [v31 isEnabled];

    if ((v32 & 1) == 0)
    {
      double v33 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      v34 = [v33 regionWithIdentifier:@"leading"];
      char v35 = [v34 isEnabled];

      if (v35)
      {
        uint64_t v36 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
        v37 = [v36 regionWithIdentifier:@"trailing"];
        char v38 = [v37 isEnabled];

        if ((v38 & 1) == 0)
        {
          v58.origin.CGFloat x = r1.origin.x;
          v58.origin.CGFloat y = v47;
          v58.size.CGFloat width = v23;
          v58.size.CGFloat height = v28;
          double v39 = CGRectGetMaxX(v58);
          v59.origin.CGFloat x = x;
          v59.origin.CGFloat y = y;
          v59.size.CGFloat width = width;
          v59.size.CGFloat height = height;
          double v40 = fmax(v39 - CGRectGetMinX(v59), 0.0);
LABEL_10:
          double v42 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
          int v43 = [v42 _shouldReverseLayoutDirection];

          if (v43) {
            double v16 = v40;
          }
          else {
            double v16 = v29;
          }
          if (v43) {
            double v17 = v29;
          }
          else {
            double v17 = v40;
          }
          goto LABEL_16;
        }
      }
      else
      {
        v60.origin.CGFloat x = x;
        v60.origin.CGFloat y = y;
        v60.size.CGFloat width = width;
        v60.size.CGFloat height = height;
        double v41 = CGRectGetMaxX(v60);
        v61.origin.CGFloat x = r1.origin.x;
        v61.origin.CGFloat y = v47;
        v61.size.CGFloat width = v23;
        v61.size.CGFloat height = v28;
        double v29 = fmax(v41 - CGRectGetMinX(v61), 0.0);
      }
    }
    double v40 = v48;
    goto LABEL_10;
  }
LABEL_16:
  [(NSLayoutConstraint *)self->_leadingRegionTrailingAnchorConstraint constant];
  double v45 = v44;
  if (v17 != v44) {
    [(NSLayoutConstraint *)self->_leadingRegionTrailingAnchorConstraint setConstant:v17];
  }
  [(NSLayoutConstraint *)self->_trailingRegionLeadingAnchorConstraint constant];
  if (v16 == v46)
  {
    if (v17 == v45) {
      return;
    }
  }
  else
  {
    [(NSLayoutConstraint *)self->_trailingRegionLeadingAnchorConstraint setConstant:v16];
  }
  *(void *)&r1.origin.CGFloat y = MEMORY[0x1E4F143A8];
  *(void *)&r1.size.CGFloat width = 3221225472;
  *(void *)&r1.size.CGFloat height = __71__STUIStatusBarVisualProvider_Pad__updateConstraintsForAvoidanceFrame___block_invoke;
  v50 = &unk_1E6AA37A0;
  double v51 = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:&r1.origin.y];
}

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  id v6 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v6 avoidanceFrame];
  -[STUIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:");
}

- (void)sizeUpdatedFromSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v6 avoidanceFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v21.origin.CGFloat x = v8;
  v21.origin.CGFloat y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  if (!CGRectIsEmpty(v21))
  {
    CGFloat v15 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;

    if (width != v17 || height != v19)
    {
      -[STUIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:", v8, v10, v12, v14);
    }
  }
}

- (void)itemCreated:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setShowsDisabledSignalBars:0];
    goto LABEL_10;
  }
  id v4 = [v11 identifier];
  BOOL v5 = +[STUIStatusBarItem identifier];

  if (v4 == v5)
  {
    id v10 = v11;
    [(STUIStatusBarVisualProvider_Pad *)self pillSize];
  }
  else
  {
    id v6 = [v11 identifier];
    double v7 = +[STUIStatusBarItem identifier];

    if (v6 == v7)
    {
      id v10 = v11;
      [(STUIStatusBarVisualProvider_Pad *)self smallPillSize];
    }
    else
    {
      double v8 = [v11 identifier];
      double v9 = +[STUIStatusBarItem identifier];

      if (v8 != v9) {
        goto LABEL_10;
      }
      id v10 = v11;
      [(STUIStatusBarVisualProvider_Pad *)self expandedPillSize];
    }
  }
  objc_msgSend(v10, "setPillSize:");

LABEL_10:
}

- (BOOL)_updateDateAndTimePlacements
{
  id v3 = __UIKitUserDefaults();
  int v4 = [v3 BOOLForKey:@"StatusBarHidesDate"];
  int v5 = [v3 BOOLForKey:@"StatusBarHidesAMPM"];
  int v6 = v4 ^ [(STUIStatusBarDisplayItemPlacement *)self->_datePlacement isEnabled];
  if ((v6 & 1) == 0) {
    [(STUIStatusBarDisplayItemPlacement *)self->_datePlacement setEnabled:v4 ^ 1u];
  }
  if (v5 == [(STUIStatusBarDisplayItemPlacement *)self->_timePlacement isEnabled])
  {
    [(STUIStatusBarDisplayItemPlacement *)self->_timePlacement setEnabled:v5 ^ 1u];
    char v7 = 1;
  }
  else
  {
    char v7 = v6 ^ 1;
  }

  return v7;
}

- (void)_dateTimePreferencesUpdated
{
  if ([(STUIStatusBarVisualProvider_Pad *)self _updateDateAndTimePlacements])
  {
    id v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v3 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __UIKitUserDefaults();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    [(STUIStatusBarVisualProvider_Pad *)self _dateTimePreferencesUpdated];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    [(STUIStatusBarVisualProvider_Pad *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  if ([(STUIStatusBarVisualProvider_iOS *)self expanded]
    && [(STUIStatusBarVisualProvider_iOS *)self wantsExpandedLeadingPlacements])
  {
    v37.receiver = self;
    v37.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    [(STUIStatusBarVisualProvider_iOS *)&v37 airplaneTravelOffsetInProposedPartWithIdentifier:a3 animationType:a4];
    return v7;
  }
  else
  {
    double v9 = +[STUIStatusBarItem defaultDisplayIdentifier];
    id v10 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v10 frameForDisplayItemWithIdentifier:v9];
    CGFloat v12 = v11;
    CGFloat v35 = v13;
    CGFloat v36 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v34 = v17;

    double v19 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v19 frameForPartWithIdentifier:*a3 includeInternalItems:1];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    v38.origin.CGFloat x = v12;
    v38.origin.CGFloat y = v14;
    v38.size.double width = v16;
    v38.size.double height = v18;
    double MinX = CGRectGetMinX(v38);
    v39.origin.CGFloat x = v21;
    v39.origin.CGFloat y = v23;
    v39.size.double width = v25;
    v39.size.double height = v27;
    double v29 = MinX - CGRectGetMinX(v39);
    v40.origin.CGFloat x = v21;
    v40.origin.CGFloat y = v23;
    v40.size.double width = v25;
    v40.size.double height = v27;
    double MaxX = CGRectGetMaxX(v40);
    v41.origin.CGFloat x = v36;
    v41.origin.CGFloat y = v35;
    v41.size.double width = v16;
    v41.size.double height = v34;
    double v31 = MaxX - CGRectGetMaxX(v41);
    if (v29 <= v31) {
      double v8 = v29;
    }
    else {
      double v8 = v31;
    }
    if (a4 == 1)
    {
      v42.origin.CGFloat x = v36;
      v42.origin.CGFloat y = v35;
      v42.size.double width = v16;
      v42.size.double height = v34;
      double v8 = v8 - CGRectGetWidth(v42);
    }
    char v32 = +[STUIStatusBarItem defaultDisplayIdentifier];
    *a3 = [v32 stringRepresentation];
  }
  return v8;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  if (![(STUIStatusBarVisualProvider_iOS *)self expanded]
    || ![(STUIStatusBarVisualProvider_iOS *)self wantsExpandedLeadingPlacements])
  {
    return 160.0;
  }
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarVisualProvider_Pad;
  [(STUIStatusBarVisualProvider_iOS *)&v6 airplaneSpeedForAnimationType:a3];
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  BOOL v5 = [(STUIStatusBarVisualProvider_iOS *)self expanded];
  double result = 1.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)STUIStatusBarVisualProvider_Pad;
    -[STUIStatusBarVisualProvider_iOS airplaneShouldFadeForAnimationType:](&v7, sel_airplaneShouldFadeForAnimationType_, a3, 1.0);
  }
  return result;
}

- (id)regionIdentifiersForBackgroundLumaView:(id)a3
{
  id v4 = a3;
  id v5 = [(STUIStatusBarVisualProvider_Pad *)self leadingBackgroundLumaView];

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"leading", 0);
  }
  else
  {
    id v6 = [(STUIStatusBarVisualProvider_Pad *)self trailingBackgroundLumaView];

    if (v6 == v4)
    {
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"trailing", 0);
    }
    else
    {
      id v7 = [(STUIStatusBarVisualProvider_Pad *)self centerBackgroundLumaView];

      if (v7 != v4)
      {
        uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"center", 0);
    }
  uint64_t v8 = };
LABEL_9:
  double v9 = (void *)v8;

  return v9;
}

- (NSDictionary)orderedDisplayItemPlacements
{
  return self->_orderedDisplayItemPlacements;
}

- (void)setOrderedDisplayItemPlacements:(id)a3
{
}

- (NSLayoutConstraint)trailingRegionLeadingAnchorConstraint
{
  return self->_trailingRegionLeadingAnchorConstraint;
}

- (void)setTrailingRegionLeadingAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingRegionTrailingAnchorConstraint
{
  return self->_leadingRegionTrailingAnchorConstraint;
}

- (void)setLeadingRegionTrailingAnchorConstraint:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacement)datePlacement
{
  return self->_datePlacement;
}

- (void)setDatePlacement:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacement)timePlacement
{
  return self->_timePlacement;
}

- (void)setTimePlacement:(id)a3
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
  objc_storeStrong((id *)&self->_timePlacement, 0);
  objc_storeStrong((id *)&self->_datePlacement, 0);
  objc_storeStrong((id *)&self->_leadingRegionTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_trailingRegionLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end