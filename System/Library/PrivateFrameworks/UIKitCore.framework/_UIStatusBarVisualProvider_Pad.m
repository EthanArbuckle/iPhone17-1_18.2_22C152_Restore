@interface _UIStatusBarVisualProvider_Pad
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
- (UIFont)clockFont;
- (_UIStatusBarDisplayItemPlacement)datePlacement;
- (_UIStatusBarDisplayItemPlacement)timePlacement;
- (_UIStatusBarVisualProvider_Pad)init;
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
- (void)setDatePlacement:(id)a3;
- (void)setLeadingRegionTrailingAnchorConstraint:(id)a3;
- (void)setOrderedDisplayItemPlacements:(id)a3;
- (void)setTimePlacement:(id)a3;
- (void)setTrailingRegionLeadingAnchorConstraint:(id)a3;
- (void)sizeUpdatedFromSize:(CGSize)a3;
- (void)statusBarEnabledPartsUpdated;
@end

@implementation _UIStatusBarVisualProvider_Pad

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5 = a3;
  if ([v5 _isMainLikeScreen])
  {
    char v6 = [v5 _isEmbeddedScreen];
    [v5 _displayCornerRadius];
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    [v5 _displayCornerRadius];
  }
  if (v7 > 0.0)
  {
LABEL_6:
    v8 = objc_opt_class();
    _UIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v8, v5, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  id v9 = a1;
LABEL_8:
  v10 = v9;

  return (Class)v10;
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
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)qword_1EB25B458;
  if (qword_1EB25B458) {
    BOOL v4 = _MergedGlobals_13_4 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    _MergedGlobals_13_4 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:12.0 weight:*(double *)off_1E52D6BF0];
    char v6 = (void *)qword_1EB25B458;
    qword_1EB25B458 = v5;

    double v3 = (void *)qword_1EB25B458;
  }
  return v3;
}

- (id)expandedFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25B460;
  if (unk_1EB25B460) {
    BOOL v4 = byte_1EB25B451 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25B451 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:15.0 weight:*(double *)off_1E52D6BF0];
    char v6 = (void *)unk_1EB25B460;
    unk_1EB25B460 = v5;

    double v3 = (void *)unk_1EB25B460;
  }
  return v3;
}

- (id)pillFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25B468;
  if (unk_1EB25B468) {
    BOOL v4 = byte_1EB25B452 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25B452 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:11.0 weight:*(double *)off_1E52D6C00];
    char v6 = (void *)unk_1EB25B468;
    unk_1EB25B468 = v5;

    double v3 = (void *)unk_1EB25B468;
  }
  return v3;
}

- (id)pillSmallFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25B470;
  if (unk_1EB25B470) {
    BOOL v4 = byte_1EB25B453 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25B453 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:10.0 weight:*(double *)off_1E52D6BD8];
    char v6 = (void *)unk_1EB25B470;
    unk_1EB25B470 = v5;

    double v3 = (void *)unk_1EB25B470;
  }
  return v3;
}

- (id)expandedPillFont
{
  int v2 = _AXSEnhanceTextLegibilityEnabled() != 0;
  double v3 = (void *)unk_1EB25B478;
  if (unk_1EB25B478) {
    BOOL v4 = byte_1EB25B454 == v2;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EB25B454 = v2;
    uint64_t v5 = [off_1E52D39B8 systemFontOfSize:11.0 weight:*(double *)off_1E52D6BF0];
    char v6 = (void *)unk_1EB25B478;
    unk_1EB25B478 = v5;

    double v3 = (void *)unk_1EB25B478;
  }
  return v3;
}

- (UIFont)clockFont
{
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_StatusBarHasBoldTime, @"StatusBarHasBoldTime") & 1) != 0|| !byte_1E8FD546C)
  {
    BOOL v4 = [(_UIStatusBarVisualProvider_Pad *)self normalFont];
  }
  else
  {
    double v3 = [(_UIStatusBarVisualProvider_Pad *)self normalFont];
    [v3 pointSize];
    BOOL v4 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:weight:");
  }
  return (UIFont *)v4;
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return 1;
}

- (_UIStatusBarVisualProvider_Pad)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  int v2 = [(_UIStatusBarVisualProvider_iOS *)&v5 init];
  double v3 = _UIKitUserDefaults();
  [v3 addObserver:v2 forKeyPath:@"StatusBarHidesDate" options:0 context:0];
  [v3 addObserver:v2 forKeyPath:@"StatusBarHidesAMPM" options:0 context:0];

  return v2;
}

- (void)dealloc
{
  double v3 = _UIKitUserDefaults();
  [v3 removeObserver:self forKeyPath:@"StatusBarHidesDate"];
  [v3 removeObserver:self forKeyPath:@"StatusBarHidesAMPM"];

  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  [(_UIStatusBarVisualProvider_Pad *)&v4 dealloc];
}

- (id)setupInContainerView:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  char v6 = [v4 array];
  double v7 = [MEMORY[0x1E4F1CA48] array];
  [(id)objc_opt_class() baselineOffset];
  double v9 = v8;
  [(id)objc_opt_class() edgeInsets];
  double v11 = v10;
  double v13 = v12;
  [(_UIStatusBarVisualProvider_Pad *)self expandedEdgeInsets];
  double v139 = v14;
  double v141 = v15;
  [(_UIStatusBarVisualProvider_iOS *)self itemSpacing];
  double v17 = v16;
  [(_UIStatusBarVisualProvider_iOS *)self expandedItemSpacing];
  double v19 = v18;
  [(_UIStatusBarVisualProvider_Pad *)self regionSpacing];
  double v21 = v20;
  v22 = [(_UIStatusBarVisualProvider_Pad *)self normalFont];
  [v22 capHeight];
  double v24 = v23;

  v25 = [(_UIStatusBarVisualProvider_Pad *)self expandedFont];
  [v25 capHeight];
  double v140 = v26;

  v27 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"leading"];
  v28 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v29 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v29 setAlignment:3];
  [(_UIStatusBarRegionAxisStackingLayout *)v29 setInterspace:10.0];
  [(_UIStatusBarRegionAxesLayout *)v28 setHorizontalLayout:v29];

  v30 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v28 setVerticalLayout:v30];

  [(_UIStatusBarRegion *)v27 setLayout:v28];
  [(_UIStatusBarRegion *)v27 setOffsetable:1];
  -[_UIStatusBarRegion setActionInsets:](v27, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  v31 = +[_UIStatusBarHoverRegionAction leadingHoverAction];
  [(_UIStatusBarRegion *)v27 setHoverAction:v31];

  UIRoundToViewScale(v5);
  -[_UIStatusBarRegion setExtendedHoverInsets:](v27, "setExtendedHoverInsets:", -v32, -v11, 0.0, 0.0);
  v33 = [(_UIStatusBarRegion *)v27 layoutItem];
  v34 = [v33 bottomAnchor];
  v35 = [v5 topAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 constant:v9];
  [v6 addObject:v36];

  v37 = [v33 leadingAnchor];
  v38 = [v5 leadingAnchor];
  v39 = [v37 constraintEqualToAnchor:v38 constant:v11];
  [v6 addObject:v39];

  v144 = v33;
  v40 = [v33 heightAnchor];
  v41 = [v40 constraintEqualToConstant:v24];
  [v6 addObject:v41];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v33);
  v42 = v7;
  v142 = v7;
  [v7 addObject:v27];

  v43 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"trailing"];
  v44 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v45 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v45 setAlignment:4];
  [(_UIStatusBarRegionAxisStackingLayout *)v45 setInterspace:v17];
  [(_UIStatusBarRegionAxesLayout *)v44 setHorizontalLayout:v45];

  v46 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v44 setVerticalLayout:v46];

  [(_UIStatusBarRegion *)v43 setLayout:v44];
  [(_UIStatusBarRegion *)v43 setOffsetable:1];
  -[_UIStatusBarRegion setActionInsets:](v43, "setActionInsets:", -20.0, -20.0, -20.0, -20.0);
  v47 = +[_UIStatusBarHoverRegionAction trailingHoverAction];
  [(_UIStatusBarRegion *)v43 setHoverAction:v47];

  UIRoundToViewScale(v5);
  -[_UIStatusBarRegion setExtendedHoverInsets:](v43, "setExtendedHoverInsets:", -v48, 0.0, 0.0, -v13);
  v49 = [(_UIStatusBarRegion *)v43 layoutItem];
  v50 = [v49 bottomAnchor];
  v51 = [v5 topAnchor];
  v52 = [v50 constraintEqualToAnchor:v51 constant:v9];
  [v6 addObject:v52];

  v53 = [v49 trailingAnchor];
  v54 = [v5 trailingAnchor];
  v55 = [v53 constraintEqualToAnchor:v54 constant:-v13];
  [v6 addObject:v55];

  v143 = v49;
  v56 = [v49 heightAnchor];
  v57 = [v56 constraintEqualToConstant:v24];
  [v6 addObject:v57];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v49);
  [v42 addObject:v43];

  v58 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"center"];
  v138 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v59 = objc_alloc_init(_UIStatusBarRegionAxisCenteringLayout);
  [(_UIStatusBarRegionAxisCenteringLayout *)v59 setInterspace:v17];
  [(_UIStatusBarRegionAxesLayout *)v138 setHorizontalLayout:v59];

  v60 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v138 setVerticalLayout:v60];

  v137 = v58;
  [(_UIStatusBarRegion *)v58 setLayout:v138];
  [(_UIStatusBarRegion *)v58 setOffsetable:1];
  v61 = [(_UIStatusBarRegion *)v58 layoutItem];
  v62 = [v61 centerXAnchor];
  v63 = [v5 centerXAnchor];
  v64 = [v62 constraintEqualToAnchor:v63];
  LODWORD(v65) = 1132068864;
  v66 = objc_msgSend(v64, "_ui_constraintWithPriority:", v65);
  [v6 addObject:v66];

  v67 = [v61 widthAnchor];
  v68 = [v67 constraintEqualToConstant:0.0];
  LODWORD(v69) = 1132003328;
  v70 = objc_msgSend(v68, "_ui_constraintWithPriority:", v69);
  [v6 addObject:v70];

  v71 = [v61 bottomAnchor];
  v72 = [v5 topAnchor];
  v73 = [v71 constraintEqualToAnchor:v72 constant:v9];
  [v6 addObject:v73];

  v74 = [v61 heightAnchor];
  v75 = [v74 constraintEqualToConstant:v24];
  [v6 addObject:v75];

  v76 = [v61 leadingAnchor];
  v77 = [v144 trailingAnchor];
  v78 = [v76 constraintGreaterThanOrEqualToAnchor:v77 constant:v21];
  [v6 addObject:v78];

  v79 = [v143 leadingAnchor];
  v80 = [v61 trailingAnchor];
  v81 = [v79 constraintGreaterThanOrEqualToAnchor:v80 constant:v21];
  [v6 addObject:v81];

  v82 = [v61 leadingAnchor];
  v83 = [v144 trailingAnchor];
  v84 = [v82 constraintEqualToAnchor:v83 constant:v21];
  LODWORD(v85) = 1132003328;
  v86 = objc_msgSend(v84, "_ui_constraintWithPriority:", v85);
  [v6 addObject:v86];

  v87 = [v143 leadingAnchor];
  v88 = [v61 trailingAnchor];
  v89 = [v87 constraintEqualToAnchor:v88 constant:v21];
  LODWORD(v90) = 1132003328;
  v91 = objc_msgSend(v89, "_ui_constraintWithPriority:", v90);
  [v6 addObject:v91];

  v92 = [v5 centerXAnchor];
  v93 = [v144 trailingAnchor];
  v94 = [v92 constraintGreaterThanOrEqualToAnchor:v93 constant:0.0];
  leadingRegionTrailingAnchorConstraint = self->_leadingRegionTrailingAnchorConstraint;
  self->_leadingRegionTrailingAnchorConstraint = v94;

  [v6 addObject:self->_leadingRegionTrailingAnchorConstraint];
  v96 = [v143 leadingAnchor];
  v97 = [v5 centerXAnchor];
  v98 = [v96 constraintGreaterThanOrEqualToAnchor:v97 constant:0.0];
  trailingRegionLeadingAnchorConstraint = self->_trailingRegionLeadingAnchorConstraint;
  self->_trailingRegionLeadingAnchorConstraint = v98;

  [v6 addObject:self->_trailingRegionLeadingAnchorConstraint];
  objc_msgSend(v5, "_ui_addSubLayoutItem:", v61);

  [v142 addObject:v137];
  v100 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedLeading"];
  v101 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v102 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v102 setAlignment:3];
  [(_UIStatusBarRegionAxisStackingLayout *)v102 setInterspace:v19];
  [(_UIStatusBarRegionAxesLayout *)v101 setHorizontalLayout:v102];

  v103 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v101 setVerticalLayout:v103];

  [(_UIStatusBarRegion *)v100 setLayout:v101];
  v104 = objc_alloc_init(UIView);
  [(_UIStatusBarRegion *)v100 setContentView:v104];

  [(_UIStatusBarRegion *)v100 setOffsetable:1];
  [(_UIStatusBarRegion *)v100 disableWithToken:10];
  v105 = [(_UIStatusBarRegion *)v100 layoutItem];
  v106 = [v105 leadingAnchor];
  v107 = [v5 leadingAnchor];
  v108 = [v106 constraintEqualToAnchor:v107 constant:v139];
  [v6 addObject:v108];

  v109 = [v105 bottomAnchor];
  v110 = [v5 topAnchor];
  v111 = [v109 constraintEqualToAnchor:v110 constant:v9];
  [v6 addObject:v111];

  v112 = [v105 heightAnchor];
  v113 = [v112 constraintEqualToConstant:v140];
  [v6 addObject:v113];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v105);
  [v142 addObject:v100];

  v114 = [[_UIStatusBarRegion alloc] initWithIdentifier:@"expandedTrailing"];
  v115 = objc_alloc_init(_UIStatusBarRegionAxesLayout);
  v116 = objc_alloc_init(_UIStatusBarRegionAxisStackingLayout);
  [(_UIStatusBarRegionAxisStackingLayout *)v116 setAlignment:4];
  [(_UIStatusBarRegionAxisStackingLayout *)v116 setInterspace:v19];
  [(_UIStatusBarRegionAxesLayout *)v115 setHorizontalLayout:v116];

  v117 = +[_UIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(_UIStatusBarRegionAxesLayout *)v115 setVerticalLayout:v117];

  [(_UIStatusBarRegion *)v114 setLayout:v115];
  v118 = objc_alloc_init(UIView);
  [(_UIStatusBarRegion *)v114 setContentView:v118];

  [(_UIStatusBarRegion *)v114 setOffsetable:1];
  [(_UIStatusBarRegion *)v114 disableWithToken:10];
  v119 = [(_UIStatusBarRegion *)v114 layoutItem];
  v120 = [v119 leadingAnchor];
  v121 = [v105 trailingAnchor];
  v122 = [v120 constraintEqualToAnchor:v121 constant:v21];
  [v6 addObject:v122];

  v123 = [v119 widthAnchor];
  v124 = [v105 widthAnchor];
  v125 = [v123 constraintEqualToAnchor:v124];
  LODWORD(v126) = 1131741184;
  v127 = objc_msgSend(v125, "_ui_constraintWithPriority:", v126);
  [v6 addObject:v127];

  v128 = [v119 trailingAnchor];
  v129 = [v5 trailingAnchor];
  v130 = [v128 constraintEqualToAnchor:v129 constant:-v141];
  [v6 addObject:v130];

  v131 = [v119 bottomAnchor];
  v132 = [v5 topAnchor];
  v133 = [v131 constraintEqualToAnchor:v132 constant:v9];
  [v6 addObject:v133];

  v134 = [v119 heightAnchor];
  v135 = [v134 constraintEqualToConstant:v140];
  [v6 addObject:v135];

  objc_msgSend(v5, "_ui_addSubLayoutItem:", v119);
  [v142 addObject:v114];

  [MEMORY[0x1E4F5B268] activateConstraints:v6];
  return v142;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v101[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  orderedDisplayItemPlacements = self->_orderedDisplayItemPlacements;
  if (!orderedDisplayItemPlacements)
  {
    id v79 = v4;
    char v6 = +[_UIStatusBarCellularItem nameDisplayIdentifier];
    uint64_t v7 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v6 priority:1003];

    double v8 = +[_UIStatusBarTimeItem shortTimeDisplayIdentifier];
    double v9 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v8 priority:1200];
    v101[0] = v7;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:1];
    uint64_t v11 = [v9 excludingPlacements:v10];

    double v12 = +[_UIStatusBarTimeItem timeDisplayIdentifier];
    double v13 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v12 priority:1201];
    v100[0] = v7;
    v100[1] = v11;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:2];
    double v15 = [v13 excludingPlacements:v14];
    timePlacement = self->_timePlacement;
    self->_timePlacement = v15;

    double v17 = +[_UIStatusBarTimeItem dateDisplayIdentifier];
    double v18 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v17 priority:700];
    v99[0] = self->_timePlacement;
    v99[1] = v11;
    v81 = (void *)v11;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:2];
    double v20 = [v18 requiringAnyPlacements:v19];
    datePlacement = self->_datePlacement;
    self->_datePlacement = v20;

    v80 = self;
    [(_UIStatusBarVisualProvider_Pad *)self _updateDateAndTimePlacements];
    v22 = [MEMORY[0x1E4F1CA48] array];
    double v23 = +[_UIStatusBarItem defaultDisplayIdentifier];
    double v24 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v23 priority:1103];
    v98[0] = v24;
    v25 = +[_UIStatusBarItem defaultDisplayIdentifier];
    double v26 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v25 priority:1102];
    uint64_t v97 = v7;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
    v28 = [v26 excludingPlacements:v27];
    v98[1] = v28;
    v98[2] = v7;
    v78 = (void *)v7;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:3];
    [v22 addObjectsFromArray:v29];

    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_StatusBarShowsDateBeforeTime, @"StatusBarShowsDateBeforeTime") & 1) != 0|| !byte_1E8FD5464)
    {
      v95[0] = v80->_timePlacement;
      v95[1] = v81;
      v30 = v80;
      v95[2] = v80->_datePlacement;
      double v32 = v95;
    }
    else
    {
      v30 = v80;
      v31 = v80->_timePlacement;
      v96[0] = v80->_datePlacement;
      v96[1] = v31;
      v96[2] = v81;
      double v32 = v96;
    }
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
    [v22 addObjectsFromArray:v33];

    uint64_t v34 = objc_opt_class();
    v82 = +[_UIStatusBarDisplayItemPlacementNetworkGroup groupWithHighPriority:3500 lowPriority:3200 cellularItemClass:v34 wifiItemClass:objc_opt_class() includeCellularName:0];
    [(_UIStatusBarVisualProvider_iOS *)v30 bluetoothPaddingInset];
    v35 = +[_UIStatusBarDisplayItemPlacementIndicatorsGroup groupWithHighPriority:lowPriority:bluetoothPaddingInset:](_UIStatusBarDisplayItemPlacementIndicatorsGroup, "groupWithHighPriority:lowPriority:bluetoothPaddingInset:", 3400, 3100);
    v87 = +[_UIStatusBarDisplayItemPlacementBatteryGroup groupWithHighPriority:lowPriority:](_UIStatusBarDisplayItemPlacementBatteryGroup, "groupWithHighPriority:lowPriority:", [v82 maximumPriority] + 1, objc_msgSend(v35, "minimumPriority") - 5);
    v76 = [MEMORY[0x1E4F1CA48] array];
    v36 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v84 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v36 priority:3720];

    v86 = +[_UIStatusBarIndicatorLocationItem groupWithPriority:3710];
    v37 = +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];
    v38 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v37 priority:3700];

    v39 = +[_UIStatusBarItem defaultDisplayIdentifier];
    double v85 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v39 priority:3680];

    v40 = [v35 unstablePlacements];
    [v76 addObjectsFromArray:v40];

    [(_UIStatusBarVisualProvider_iOS *)v30 itemSpacing];
    v83 = v35;
    v42 = +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", [v35 minimumPriority] - 2, 8.0 - (v41 + v41), 0.0);
    v43 = v38;
    v77 = v38;
    v93 = v38;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
    v45 = [v42 requiringAllPlacements:v44];
    v46 = [v35 unstablePlacements];
    v47 = [v45 requiringAnyPlacements:v46];
    v94[0] = v47;
    v94[1] = v38;
    [(_UIStatusBarVisualProvider_iOS *)v30 itemSpacing];
    v49 = +[_UIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](_UIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", [v38 priority] - 1, 8.0 - (v48 + v48), 0.0);
    v92 = v43;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
    v51 = [v49 requiringAllPlacements:v50];
    v94[2] = v51;
    v94[3] = v84;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:4];
    [v76 addObjectsFromArray:v52];

    v53 = [v86 placements];
    [v76 addObjectsFromArray:v53];

    v91[0] = v85;
    v54 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v55 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v54 priority:3600];
    v56 = [v82 cellularGroup];
    v57 = [v56 placementsAffectedByAirplaneMode];
    v58 = [v55 excludingPlacements:v57];
    v91[1] = v58;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
    [v76 addObjectsFromArray:v59];

    v60 = [v82 placements];
    [v76 addObjectsFromArray:v60];

    v61 = [v83 stablePlacements];
    [v76 addObjectsFromArray:v61];

    v62 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v63 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v62 priority:3730];
    [v76 addObject:v63];

    v64 = [v87 placements];
    [v76 addObjectsFromArray:v64];

    v89[0] = @"leading";
    v89[1] = @"trailing";
    v90[0] = v22;
    v90[1] = v76;
    v89[2] = @"center";
    double v65 = +[_UIStatusBarItem defaultDisplayIdentifier];
    v66 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v65 priority:2000];
    v88[0] = v66;
    v67 = +[_UIStatusBarLockItem textDisplayIdentifier];
    v68 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v67 priority:1999];
    v88[1] = v68;
    double v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
    v90[2] = v69;
    v89[3] = @"expandedLeading";
    v70 = [(_UIStatusBarVisualProvider_iOS *)v80 expandedLeadingPlacements];
    v90[3] = v70;
    v89[4] = @"expandedTrailing";
    v71 = [(_UIStatusBarVisualProvider_iOS *)v80 expandedTrailingPlacements];
    v90[4] = v71;
    uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:5];
    v73 = v80->_orderedDisplayItemPlacements;
    v80->_orderedDisplayItemPlacements = (NSDictionary *)v72;

    orderedDisplayItemPlacements = v80->_orderedDisplayItemPlacements;
    id v4 = v79;
  }
  v74 = [(NSDictionary *)orderedDisplayItemPlacements objectForKeyedSubscript:v4];

  return v74;
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
    if ([v3 isEqual:0x1ED169E00])
    {
      id v4 = (void *)MEMORY[0x1E4F1CAD0];
      double v10 = @"center";
      uint64_t v11 = 0;
      double v9 = @"trailing";
      goto LABEL_3;
    }
    if (([v3 isEqual:0x1ED169E20] & 1) != 0
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
    id v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
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
    id v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    if ([(_UIStatusBarVisualProvider_iOS *)self expanded])
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
    id v5 = +[_UIStatusBarTimeItem shortTimeDisplayIdentifier];
    double v8 = +[_UIStatusBarTimeItem timeDisplayIdentifier];
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v5, v8, 0);
LABEL_12:
    double v10 = (void *)v9;

    goto LABEL_13;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  double v10 = [(_UIStatusBarVisualProvider_iOS *)&v12 displayItemIdentifiersForPartWithIdentifier:v4];
LABEL_13:

  return v10;
}

- (CGRect)clockBoundsForLayoutItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  uint64_t v6 = +[_UIStatusBarTimeItem timeDisplayIdentifier];

  uint64_t v7 = [v4 view];

  if (v5 == v6)
  {
    double v16 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    double v17 = [v16 currentAggregatedData];
    double v18 = [v17 shortTimeEntry];
    double v19 = [v18 stringValue];

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

- (id)styleAttributesForStyle:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  id v4 = [(_UIStatusBarVisualProvider_iOS *)&v13 styleAttributesForStyle:a3];
  uint64_t v5 = [v4 mode];
  switch(v5)
  {
    case 2:
      goto LABEL_4;
    case 1:
      [v4 setIconScale:1.16];
      double v8 = [v4 traitCollection];
      [v8 displayScale];
      [v4 setIconSize:15];

      uint64_t v7 = [(_UIStatusBarVisualProvider_Pad *)self expandedFont];
      goto LABEL_6;
    case 0:
LABEL_4:
      [v4 setIconScale:1.0];
      uint64_t v6 = [v4 traitCollection];
      [v6 displayScale];
      [v4 setIconSize:14];

      uint64_t v7 = [(_UIStatusBarVisualProvider_Pad *)self normalFont];
LABEL_6:
      double v9 = (void *)v7;
      [v4 setFont:v7];

      break;
  }
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_StatusBarHasBoldTime, @"StatusBarHasBoldTime") & 1) != 0|| !byte_1E8FD546C)
  {
    double v10 = [v4 font];
    [v4 setEmphasizedFont:v10];
  }
  else
  {
    double v10 = [(_UIStatusBarVisualProvider_Pad *)self normalFont];
    [v10 pointSize];
    double v11 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:weight:");
    [v4 setEmphasizedFont:v11];
  }
  [v4 setImageNamePrefixes:&unk_1ED3F1120];
  return v4;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v7 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
    double v8 = [(_UIStatusBarVisualProvider_Pad *)self pillFont];
    [v7 setFont:v8];

    double v9 = [(_UIStatusBarVisualProvider_Pad *)self pillSmallFont];
    [v7 setSmallFont:v9];

    [(_UIStatusBarVisualProvider_Pad *)self pillSize];
  }
  else
  {
    id v6 = +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];

    if (v6 != v4)
    {
      uint64_t v7 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
    double v11 = [(_UIStatusBarVisualProvider_Pad *)self expandedPillFont];
    [v7 setFont:v11];

    double v12 = [(_UIStatusBarVisualProvider_Pad *)self expandedPillFont];
    [v7 setSmallFont:v12];

    [(_UIStatusBarVisualProvider_Pad *)self expandedPillSize];
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
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v10 = 0;
LABEL_8:
    v15.receiver = self;
    v15.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    [(_UIStatusBarVisualProvider_iOS *)&v15 actionable:v8 highlighted:v6 initialPress:v5];
    goto LABEL_9;
  }
  id v9 = v8;
  double v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  double v11 = [v9 identifier];
  double v12 = +[_UIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];

  if (v11 != v12) {
    goto LABEL_8;
  }
  objc_super v13 = [v10 highlightView];
  if (!v13)
  {
    objc_super v13 = objc_alloc_init(_UIStatusBarRoundedCornerView);
    [v10 setHighlightView:v13];
  }
  v18[0] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __70___UIStatusBarVisualProvider_Pad_actionable_highlighted_initialPress___block_invoke;
  v16[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  BOOL v17 = v6;
  +[UIButton _setVisuallyHighlighted:v6 forViews:v14 initialPress:v5 highlightBlock:v16];

LABEL_9:
}

- (void)statusBarEnabledPartsUpdated
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  id v4 = [v3 regionWithIdentifier:@"leading"];

  BOOL v5 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  BOOL v6 = [v5 regionWithIdentifier:@"trailing"];

  uint64_t v7 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  id v8 = [v7 containerView];
  id v9 = [v8 centerXAnchor];

  double v10 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  double v11 = [v10 containerView];
  double v12 = [v11 centerXAnchor];

  objc_super v13 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  double v14 = [v13 regionWithIdentifier:@"center"];
  char v15 = [v14 isEnabled];

  if ((v15 & 1) == 0)
  {
    if ([v4 isEnabled])
    {
      if ([v6 isEnabled]) {
        goto LABEL_7;
      }
      double v16 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      BOOL v17 = [v16 containerView];
      uint64_t v18 = [v17 trailingAnchor];
      double v19 = v9;
      id v9 = (void *)v18;
    }
    else
    {
      double v16 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      BOOL v17 = [v16 containerView];
      uint64_t v20 = [v17 leadingAnchor];
      double v19 = v12;
      double v12 = (void *)v20;
    }
  }
LABEL_7:
  double v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  double v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  double v23 = [(NSLayoutConstraint *)self->_leadingRegionTrailingAnchorConstraint firstAnchor];

  if (v9 != v23)
  {
    [v21 addObject:self->_leadingRegionTrailingAnchorConstraint];
    double v24 = (void *)MEMORY[0x1E4F5B268];
    v46[0] = self->_leadingRegionTrailingAnchorConstraint;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    double v26 = v25 = v6;
    [v24 deactivateConstraints:v26];

    v27 = [v4 layoutItem];
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
    double v32 = [v6 layoutItem];
    [v32 leadingAnchor];
    uint64_t v34 = v33 = v6;
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
    [MEMORY[0x1E4F5B268] deactivateConstraints:v21];
    [MEMORY[0x1E4F5B268] activateConstraints:v22];
    v37 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
      -[_UIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:", v39, v41, v43, v45);
    }
  }
}

- (void)_updateConstraintsForAvoidanceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
    v30 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    v31 = [v30 regionWithIdentifier:@"center"];
    char v32 = [v31 isEnabled];

    if ((v32 & 1) == 0)
    {
      v33 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
      uint64_t v34 = [v33 regionWithIdentifier:@"leading"];
      char v35 = [v34 isEnabled];

      if (v35)
      {
        v36 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
          double v42 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
  *(void *)&r1.size.CGFloat height = __70___UIStatusBarVisualProvider_Pad__updateConstraintsForAvoidanceFrame___block_invoke;
  v50 = &unk_1E52D9F70;
  v51 = self;
  +[UIView performWithoutAnimation:&r1.origin.y];
}

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  id v6 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
  [v6 avoidanceFrame];
  -[_UIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:");
}

- (void)sizeUpdatedFromSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
    CGFloat v15 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;

    if (width != v17 || height != v19)
    {
      -[_UIStatusBarVisualProvider_Pad _updateConstraintsForAvoidanceFrame:](self, "_updateConstraintsForAvoidanceFrame:", v8, v10, v12, v14);
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
  BOOL v5 = +[_UIStatusBarItem identifier];

  if (v4 == v5)
  {
    id v10 = v11;
    [(_UIStatusBarVisualProvider_Pad *)self pillSize];
  }
  else
  {
    id v6 = [v11 identifier];
    double v7 = +[_UIStatusBarItem identifier];

    if (v6 == v7)
    {
      id v10 = v11;
      [(_UIStatusBarVisualProvider_Pad *)self smallPillSize];
    }
    else
    {
      double v8 = [v11 identifier];
      double v9 = +[_UIStatusBarItem identifier];

      if (v8 != v9) {
        goto LABEL_10;
      }
      id v10 = v11;
      [(_UIStatusBarVisualProvider_Pad *)self expandedPillSize];
    }
  }
  objc_msgSend(v10, "setPillSize:");

LABEL_10:
}

- (BOOL)_updateDateAndTimePlacements
{
  id v3 = _UIKitUserDefaults();
  int v4 = [v3 BOOLForKey:@"StatusBarHidesDate"];
  int v5 = [v3 BOOLForKey:@"StatusBarHidesAMPM"];
  int v6 = v4 ^ [(_UIStatusBarDisplayItemPlacement *)self->_datePlacement isEnabled];
  if ((v6 & 1) == 0) {
    [(_UIStatusBarDisplayItemPlacement *)self->_datePlacement setEnabled:v4 ^ 1u];
  }
  if (v5 == [(_UIStatusBarDisplayItemPlacement *)self->_timePlacement isEnabled])
  {
    [(_UIStatusBarDisplayItemPlacement *)self->_timePlacement setEnabled:v5 ^ 1u];
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
  if ([(_UIStatusBarVisualProvider_Pad *)self _updateDateAndTimePlacements])
  {
    id v3 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    [v3 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  _UIKitUserDefaults();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    [(_UIStatusBarVisualProvider_Pad *)self _dateTimePreferencesUpdated];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    [(_UIStatusBarVisualProvider_Pad *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (double)airplaneTravelOffsetInProposedPartWithIdentifier:(id *)a3 animationType:(int64_t)a4
{
  if ([(_UIStatusBarVisualProvider_iOS *)self expanded]
    && [(_UIStatusBarVisualProvider_iOS *)self wantsExpandedLeadingPlacements])
  {
    v37.receiver = self;
    v37.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    [(_UIStatusBarVisualProvider_iOS *)&v37 airplaneTravelOffsetInProposedPartWithIdentifier:a3 animationType:a4];
    return v7;
  }
  else
  {
    double v9 = +[_UIStatusBarItem defaultDisplayIdentifier];
    id v10 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
    [v10 frameForDisplayItemWithIdentifier:v9];
    CGFloat v12 = v11;
    CGFloat v35 = v13;
    CGFloat v36 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v34 = v17;

    double v19 = [(_UIStatusBarVisualProvider_iOS *)self statusBar];
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
    char v32 = +[_UIStatusBarItem defaultDisplayIdentifier];
    *a3 = [v32 stringRepresentation];
  }
  return v8;
}

- (double)airplaneSpeedForAnimationType:(int64_t)a3
{
  if (![(_UIStatusBarVisualProvider_iOS *)self expanded]
    || ![(_UIStatusBarVisualProvider_iOS *)self wantsExpandedLeadingPlacements])
  {
    return 160.0;
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarVisualProvider_Pad;
  [(_UIStatusBarVisualProvider_iOS *)&v6 airplaneSpeedForAnimationType:a3];
  return result;
}

- (double)airplaneShouldFadeForAnimationType:(int64_t)a3
{
  BOOL v5 = [(_UIStatusBarVisualProvider_iOS *)self expanded];
  double result = 1.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIStatusBarVisualProvider_Pad;
    -[_UIStatusBarVisualProvider_iOS airplaneShouldFadeForAnimationType:](&v7, sel_airplaneShouldFadeForAnimationType_, a3, 1.0);
  }
  return result;
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

- (_UIStatusBarDisplayItemPlacement)datePlacement
{
  return self->_datePlacement;
}

- (void)setDatePlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)timePlacement
{
  return self->_timePlacement;
}

- (void)setTimePlacement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePlacement, 0);
  objc_storeStrong((id *)&self->_datePlacement, 0);
  objc_storeStrong((id *)&self->_leadingRegionTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_trailingRegionLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_orderedDisplayItemPlacements, 0);
}

@end