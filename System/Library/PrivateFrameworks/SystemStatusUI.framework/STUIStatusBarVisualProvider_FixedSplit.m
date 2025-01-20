@interface STUIStatusBarVisualProvider_FixedSplit
+ (BOOL)showsLargeBatteryChargingAnimation;
+ (double)additionalBottomLeadingMargin;
+ (double)expandedPillFontSize;
+ (double)leadingCenteringOffset;
+ (double)pillCenteringOffset;
+ (double)pillFontSize;
+ (double)trailingCenteringOffset;
+ (double)trailingEdgeInsetLeadingAdjustment;
- (BOOL)_updateLowerRegionsWithData:(id)a3;
- (BOOL)wantsPillInExpandedTrailingPlacements;
- (CGRect)notchRect;
- (CGSize)expandedPillSize;
- (CGSize)notchSize;
- (CGSize)pillSize;
- (CGSize)smallPillSize;
- (NSDirectionalEdgeInsets)_edgeInsetsFromCenteringEdgeInset:(double)a3 trailing:(BOOL)a4;
- (NSDirectionalEdgeInsets)expandedEdgeInsets;
- (UIFont)pillFont;
- (UIFont)pillSmallFont;
- (double)leadingCenteringEdgeInset;
- (double)leadingItemSpacing;
- (double)leadingPillInset;
- (double)leadingPillSpacing;
- (double)leadingSmallPillSpacing;
- (double)nativeDisplayWidth;
- (double)pillCenteringEdgeInset;
- (double)referenceWidth;
- (double)trailingCenteringEdgeInset;
- (id)_orderedDisplayItemPlacements;
- (id)animationForBackgroundActivityPillAnimation:(id)a3 duration:(double)a4 scale:(double)a5;
- (id)expandedPillFont;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3;
- (id)region:(id)a3 willSetDisplayItems:(id)a4;
- (id)regionIdentifiersForPartWithIdentifier:(id)a3;
- (id)setupInContainerView:(id)a3;
- (id)styleAttributesForStyle:(int64_t)a3;
- (void)_updateSystemNavigationWithData:(id)a3;
- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5;
- (void)dataUpdated:(id)a3;
- (void)itemCreated:(id)a3;
- (void)orientationUpdatedFromOrientation:(int64_t)a3;
@end

@implementation STUIStatusBarVisualProvider_FixedSplit

+ (BOOL)showsLargeBatteryChargingAnimation
{
  return 1;
}

- (double)nativeDisplayWidth
{
  v2 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  v3 = [v2 _effectiveTargetScreen];
  [v3 nativeBounds];
  double v5 = v4;

  return v5;
}

- (double)referenceWidth
{
  v2 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  v3 = [v2 _effectiveTargetScreen];

  [v3 nativeBounds];
  double v5 = v4;
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [(id)objc_opt_class() referenceScreenScale];
  }
  else {
    [v3 _scale];
  }
  double v7 = v5 / v6;

  return v7;
}

- (double)leadingItemSpacing
{
  return 3.33333333;
}

- (double)leadingPillSpacing
{
  [(STUIStatusBarVisualProvider_FixedSplit *)self leadingPillInset];
  v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  double v4 = [v3 _effectiveTargetScreen];
  [v4 _scale];
  UIRoundToScale();
  double v6 = v5;

  return v6;
}

- (double)leadingPillInset
{
  [(STUIStatusBarVisualProvider_FixedSplit *)self pillSize];
  v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  double v4 = [v3 _effectiveTargetScreen];
  [v4 _scale];
  UIRoundToScale();
  double v6 = v5;

  return v6;
}

- (double)leadingSmallPillSpacing
{
  return 6.66666667;
}

- (double)leadingCenteringEdgeInset
{
  [(STUIStatusBarVisualProvider_FixedSplit *)self notchRect];
  [(STUIStatusBarVisualProvider_Split *)self cornerRadius];
  v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  double v4 = [v3 _effectiveTargetScreen];
  [v4 _scale];
  UIRoundToScale();
  double v6 = v5;
  [(id)objc_opt_class() leadingCenteringOffset];
  double v8 = v6 + v7;

  return v8;
}

+ (double)leadingCenteringOffset
{
  return 0.0;
}

- (double)trailingCenteringEdgeInset
{
  [(STUIStatusBarVisualProvider_FixedSplit *)self leadingCenteringEdgeInset];
  double v3 = v2;
  [(id)objc_opt_class() trailingCenteringOffset];
  return v3 + v4;
}

+ (double)trailingCenteringOffset
{
  return 1.0;
}

- (double)pillCenteringEdgeInset
{
  [(STUIStatusBarVisualProvider_FixedSplit *)self leadingCenteringEdgeInset];
  double v3 = v2;
  [(id)objc_opt_class() pillCenteringOffset];
  return v3 + v4;
}

+ (double)pillCenteringOffset
{
  return 0.0;
}

- (CGSize)pillSize
{
  double v2 = 64.6666667;
  double v3 = 23.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2 = 19.6666667;
  double v3 = 19.6666667;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)expandedPillSize
{
  double v2 = 50.0;
  double v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)pillFontSize
{
  return 15.0;
}

+ (double)expandedPillFontSize
{
  [a1 expandedFontSize];
  return v2 + -4.0;
}

- (UIFont)pillFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)unk_1EA87ED68;
  if (unk_1EA87ED68) {
    BOOL v4 = byte_1EA87ED2E == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EA87ED2E = IsBoldTextEnabled;
    double v5 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() pillFontSize];
    uint64_t v6 = objc_msgSend(v5, "systemFontOfSize:weight:");
    double v7 = (void *)unk_1EA87ED68;
    unk_1EA87ED68 = v6;

    double v3 = (void *)unk_1EA87ED68;
  }
  return (UIFont *)v3;
}

- (UIFont)pillSmallFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)unk_1EA87ED70;
  if (unk_1EA87ED70) {
    BOOL v4 = byte_1EA87ED2F == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EA87ED2F = IsBoldTextEnabled;
    double v5 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() pillFontSize];
    uint64_t v6 = objc_msgSend(v5, "systemFontOfSize:weight:");
    double v7 = (void *)unk_1EA87ED70;
    unk_1EA87ED70 = v6;

    double v3 = (void *)unk_1EA87ED70;
  }
  return (UIFont *)v3;
}

- (id)expandedPillFont
{
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v3 = (void *)qword_1EA87ED78;
  if (qword_1EA87ED78) {
    BOOL v4 = byte_1EA87ED30 == IsBoldTextEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    byte_1EA87ED30 = IsBoldTextEnabled;
    double v5 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() expandedPillFontSize];
    uint64_t v6 = objc_msgSend(v5, "systemFontOfSize:weight:");
    double v7 = (void *)qword_1EA87ED78;
    qword_1EA87ED78 = v6;

    double v3 = (void *)qword_1EA87ED78;
  }
  return v3;
}

+ (double)additionalBottomLeadingMargin
{
  return 1.0;
}

- (NSDirectionalEdgeInsets)_edgeInsetsFromCenteringEdgeInset:(double)a3 trailing:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = [(STUIStatusBarVisualProvider_Split *)self normalIconSize];
  +[STUIStatusBarBatteryView _statusBarIntrinsicContentSizeForIconSize:v7];
  double v9 = v8;
  +[STUIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:4 iconSize:v7];
  double v11 = v9 + v10;
  +[STUIStatusBarWifiSignalView _intrinsicContentSizeForNumberOfBars:3 iconSize:v7];
  double v13 = v11 + v12;
  [(STUIStatusBarVisualProvider_Split *)self itemSpacing];
  double v15 = v13 + v14 * 2.0;
  double v16 = a3 - v15 * 0.5;
  [(STUIStatusBarVisualProvider_FixedSplit *)self referenceWidth];
  double v18 = v17;
  [(STUIStatusBarVisualProvider_FixedSplit *)self notchSize];
  double v20 = (v18 - v19) * 0.5 - (v15 + v16);
  [(STUIStatusBarVisualProvider_Split *)self baselineBottomInset];
  double v22 = v21;
  if (v4) {
    double v23 = v20;
  }
  else {
    double v23 = v16;
  }
  if (v4) {
    double v24 = v16;
  }
  else {
    double v24 = v20;
  }
  double v25 = 14.6666667;
  result.trailing = v24;
  result.bottom = v22;
  result.leading = v23;
  result.top = v25;
  return result;
}

+ (double)trailingEdgeInsetLeadingAdjustment
{
  return 0.0;
}

- (NSDirectionalEdgeInsets)expandedEdgeInsets
{
  if (self)
  {
    [(STUIStatusBarVisualProvider_FixedSplit *)self leadingCenteringEdgeInset];
    -[STUIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 0);
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
    double v4 = 0.0;
  }
  [(id)objc_opt_class() expandedEdgeInset];
  double v8 = v7;
  [(id)objc_opt_class() trailingCenteringOffset];
  double v10 = v8 + v9;
  [(id)objc_opt_class() expandedEdgeInset];
  double v12 = v11;
  double v13 = v4;
  double v14 = v10;
  double v15 = v6;
  result.trailing = v12;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (CGRect)notchRect
{
  if ((*(unsigned char *)&self->_fixedSplitVisualProviderFlags & 1) == 0)
  {
    *(unsigned char *)&self->_fixedSplitVisualProviderFlags |= 1u;
    double v3 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    double v4 = [v3 _effectiveTargetScreen];

    double v5 = [v4 _exclusionArea];
    [v5 rect];
    double v7 = v6;
    [v4 _nativeScale];
    double v9 = v8 * v7;
    [v4 _scale];
    CGFloat v11 = v9 / v10;
    [v5 rect];
    double v13 = v12;
    [v4 _nativeScale];
    double v15 = v14 * v13;
    [v4 _scale];
    CGFloat v17 = v15 / v16;
    [v5 rect];
    double v19 = v18;
    [v4 _nativeScale];
    double v21 = v20 * v19;
    [v4 _scale];
    CGFloat v23 = v21 / v22;
    [v5 rect];
    double v25 = v24;
    [v4 _nativeScale];
    double v27 = v26 * v25;
    [v4 _scale];
    self->_notchRect.origin.double x = v11;
    self->_notchRect.origin.double y = v17;
    self->_notchRect.size.double width = v23;
    self->_notchRect.size.double height = v27 / v28;
  }
  double x = self->_notchRect.origin.x;
  double y = self->_notchRect.origin.y;
  double width = self->_notchRect.size.width;
  double height = self->_notchRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)notchSize
{
  [(STUIStatusBarVisualProvider_FixedSplit *)self notchRect];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (id)setupInContainerView:(id)a3
{
  v278[2] = *MEMORY[0x1E4F143B8];
  double v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  double v6 = [v4 array];
  v275 = [MEMORY[0x1E4F1CA48] array];
  [(id)objc_opt_class() height];
  double v269 = v7;
  [(STUIStatusBarVisualProvider_FixedSplit *)self referenceWidth];
  double v9 = v8;
  [(STUIStatusBarVisualProvider_FixedSplit *)self notchSize];
  double v11 = v10;
  double v13 = v12;
  double v14 = (v9 - v10) * 0.5;
  [(STUIStatusBarVisualProvider_Split *)self itemSpacing];
  double v271 = v15;
  [(STUIStatusBarVisualProvider_FixedSplit *)self leadingItemSpacing];
  double v259 = v16;
  [(STUIStatusBarVisualProvider_FixedSplit *)self leadingPillSpacing];
  double v262 = v17;
  [(STUIStatusBarVisualProvider_FixedSplit *)self leadingPillInset];
  double v263 = v18;
  [(STUIStatusBarVisualProvider_FixedSplit *)self pillCenteringEdgeInset];
  double v260 = v19;
  [(STUIStatusBarVisualProvider_FixedSplit *)self pillSize];
  double v261 = v20;
  double v272 = v21;
  if (self)
  {
    [(STUIStatusBarVisualProvider_FixedSplit *)self leadingCenteringEdgeInset];
    -[STUIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 0);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v273 = v28;
    [(STUIStatusBarVisualProvider_FixedSplit *)self trailingCenteringEdgeInset];
    -[STUIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 1);
    double v264 = v29;
    double v265 = v30;
    double v32 = v31;
    double v267 = v33;
    [(id)objc_opt_class() trailingEdgeInsetLeadingAdjustment];
    double v266 = v32 - v34;
  }
  else
  {
    double v23 = 0.0;
    double v273 = 0.0;
    double v27 = 0.0;
    double v25 = 0.0;
    double v265 = 0.0;
    double v266 = 0.0;
    double v267 = 0.0;
    double v264 = 0.0;
  }
  id v35 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v35 setIdentifier:@"cutout"];
  v36 = [v35 topAnchor];
  v37 = [v5 topAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v6 addObject:v38];

  v39 = [v5 trailingAnchor];
  v40 = [v35 trailingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40 constant:v14];
  [v6 addObject:v41];

  v42 = [v35 widthAnchor];
  v43 = [v42 constraintEqualToConstant:v11];
  [v6 addObject:v43];

  v44 = [v35 heightAnchor];
  v45 = [v44 constraintEqualToConstant:v13];
  [v6 addObject:v45];

  [v5 addLayoutGuide:v35];
  [(STUIStatusBarVisualProvider_Split *)self setCutoutLayoutGuide:v35];

  id v46 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v46 setIdentifier:@"UIStatusBarMainRegions"];
  v47 = [v46 trailingAnchor];
  v274 = v5;
  v48 = [v5 trailingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v6 addObject:v49];

  v50 = [v46 widthAnchor];
  v51 = [v50 constraintEqualToConstant:v9];
  [v6 addObject:v51];

  v52 = [v46 heightAnchor];
  v53 = [v52 constraintEqualToConstant:v13];
  [v6 addObject:v53];

  v54 = [v46 bottomAnchor];
  v55 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v56 = [v55 bottomAnchor];
  v57 = [v54 constraintEqualToAnchor:v56];
  [v6 addObject:v57];

  [v5 addLayoutGuide:v46];
  [(STUIStatusBarVisualProvider_Split *)self setMainRegionsLayoutGuide:v46];

  v58 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"leading"];
  v59 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v60 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v60 setInterspace:v259];
  [(STUIStatusBarRegionAxisCenteringLayout *)v60 setMaxNumberOfItems:3];
  [(STUIStatusBarRegionAxesLayout *)v59 setHorizontalLayout:v60];

  v61 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:5];
  [(STUIStatusBarRegionAxesLayout *)v59 setVerticalLayout:v61];

  [(STUIStatusBarRegion *)v58 setLayout:v59];
  -[STUIStatusBarRegion setActionInsets:](v58, "setActionInsets:", -v23, -v25, -(v269 + v27 - v13), -v273);
  v62 = [(STUIStatusBarRegion *)v58 layoutItem];
  v63 = [v62 topAnchor];
  v64 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v65 = [v64 topAnchor];
  v66 = [v63 constraintEqualToAnchor:v65 constant:v23];
  [v6 addObject:v66];

  v67 = [v62 bottomAnchor];
  v68 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v69 = [v68 bottomAnchor];
  v70 = [v67 constraintEqualToAnchor:v69 constant:-v27];
  leadingBottomConstraint = self->_leadingBottomConstraint;
  self->_leadingBottomConstraint = v70;

  [v6 addObject:self->_leadingBottomConstraint];
  v72 = [v62 leadingAnchor];
  v73 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v74 = [v73 leadingAnchor];
  v75 = [v72 constraintEqualToAnchor:v74 constant:v25];
  [v6 addObject:v75];

  v270 = v62;
  v76 = [v62 widthAnchor];
  v77 = [v76 constraintEqualToConstant:v14 - (v273 + v25)];
  [v6 addObject:v77];

  objc_msgSend(v274, "_ui_addSubLayoutItem:", v62);
  [v275 addObject:v58];

  v78 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"pill"];
  v79 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v80 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v79 setHorizontalLayout:v80];

  v81 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v79 setVerticalLayout:v81];

  [(STUIStatusBarRegion *)v78 setLayout:v79];
  -[STUIStatusBarRegion setActionInsets:](v78, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  v82 = [(STUIStatusBarRegion *)v78 layoutItem];
  v83 = [v82 bottomAnchor];
  v84 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v85 = [v84 bottomAnchor];
  v86 = [v83 constraintEqualToAnchor:v85];
  [v6 addObject:v86];

  v87 = [(STUIStatusBarRegion *)v78 layoutItem];
  v88 = [v87 centerXAnchor];
  v89 = [v274 leadingAnchor];
  v90 = [v88 constraintEqualToAnchor:v89 constant:v260];
  [v6 addObject:v90];

  v91 = [(STUIStatusBarRegion *)v78 layoutItem];
  v92 = [v91 widthAnchor];
  v93 = [v92 constraintEqualToConstant:v261];
  [v6 addObject:v93];

  v94 = [(STUIStatusBarRegion *)v78 layoutItem];
  v95 = [v94 heightAnchor];
  v96 = [v95 constraintEqualToConstant:v272];
  [v6 addObject:v96];

  v97 = [(STUIStatusBarRegion *)v78 layoutItem];
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v97);

  [v275 addObject:v78];
  v98 = [v275 lastObject];
  v99 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
  [v99 setPillRegion:v98];

  v100 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"pillContent"];
  v101 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
  v102 = [v101 pillRegion];
  [(STUIStatusBarRegion *)v100 setEnabilityRegion:v102];

  v103 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v104 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v104 setInterspace:v262];
  [(STUIStatusBarRegionAxisCenteringLayout *)v104 setMaxNumberOfItems:2];
  [(STUIStatusBarRegionAxesLayout *)v103 setHorizontalLayout:v104];

  v105 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  [(STUIStatusBarRegionAxesLayout *)v103 setVerticalLayout:v105];

  [(STUIStatusBarRegion *)v100 setLayout:v103];
  v106 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  v107 = [MEMORY[0x1E4FB1618] whiteColor];
  [v106 setTextColor:v107];

  v108 = [MEMORY[0x1E4FB1618] whiteColor];
  [v106 setImageTintColor:v108];

  v109 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.3];
  [v106 setImageDimmedTintColor:v109];

  v110 = [(STUIStatusBarVisualProvider_FixedSplit *)self pillFont];
  [v106 setFont:v110];

  v111 = [(STUIStatusBarVisualProvider_FixedSplit *)self pillSmallFont];
  [v106 setSmallFont:v111];

  v112 = [(STUIStatusBarVisualProvider_FixedSplit *)self pillFont];
  [v106 setEmphasizedFont:v112];

  [v106 setSymbolScale:2];
  [(STUIStatusBarRegion *)v100 setOverriddenStyleAttributes:v106];
  v113 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
  v114 = [v113 pillRegion];
  v115 = [v114 layoutItem];

  v116 = [(STUIStatusBarRegion *)v100 layoutItem];
  v117 = [v116 topAnchor];
  v118 = [v115 topAnchor];
  v119 = [v117 constraintEqualToAnchor:v118];
  [v6 addObject:v119];

  v120 = [(STUIStatusBarRegion *)v100 layoutItem];
  v121 = [v120 bottomAnchor];
  v122 = [v115 bottomAnchor];
  v123 = [v121 constraintEqualToAnchor:v122];
  [v6 addObject:v123];

  v124 = [(STUIStatusBarRegion *)v100 layoutItem];
  v125 = [v124 leadingAnchor];
  v126 = [v115 leadingAnchor];
  v127 = [v125 constraintEqualToAnchor:v126 constant:v263];
  [v6 addObject:v127];

  v128 = [(STUIStatusBarRegion *)v100 layoutItem];
  v129 = [v128 trailingAnchor];
  v130 = [v115 trailingAnchor];
  v131 = [v129 constraintEqualToAnchor:v130 constant:-v263];
  [v6 addObject:v131];

  v132 = [(STUIStatusBarRegion *)v100 layoutItem];
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v132);

  [v275 addObject:v100];
  v133 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"trailing"];
  v134 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v135 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:5];
  [(STUIStatusBarRegionAxesLayout *)v134 setVerticalLayout:v135];

  [(STUIStatusBarRegion *)v133 setLayout:v134];
  -[STUIStatusBarRegion setActionInsets:](v133, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  v136 = [(STUIStatusBarRegion *)v133 layoutItem];
  v137 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  v138 = [(STUIStatusBarVisualProvider_Split *)self emphasizedFont];
  [v137 setFont:v138];

  v139 = [(STUIStatusBarVisualProvider_Split *)self normalFont];
  [v137 setSmallFont:v139];

  [v137 setImageNamePrefixes:&unk_1F2F9CAB0];
  [(STUIStatusBarRegion *)v133 setOverriddenStyleAttributes:v137];
  v140 = [v136 topAnchor];
  v141 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v142 = [v141 topAnchor];
  v143 = [v140 constraintEqualToAnchor:v142 constant:v264];
  [v6 addObject:v143];

  v144 = [v136 bottomAnchor];
  v145 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v146 = [v145 bottomAnchor];
  v147 = [v144 constraintEqualToAnchor:v146 constant:-v265];
  [v6 addObject:v147];

  v148 = [v136 trailingAnchor];
  v149 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v150 = [v149 trailingAnchor];
  v151 = [v148 constraintEqualToAnchor:v150 constant:-v267];
  [v6 addObject:v151];

  v152 = [v136 widthAnchor];
  v153 = [v152 constraintEqualToConstant:v14 - (v266 + v267)];
  [v6 addObject:v153];

  objc_msgSend(v274, "_ui_addSubLayoutItem:", v136);
  [v275 addObject:v133];

  v154 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"systemUpdates"];
  v155 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v156 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v156 setMaxNumberOfItems:3];
  [(STUIStatusBarRegionAxesLayout *)v155 setHorizontalLayout:v156];

  v157 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:5];
  [(STUIStatusBarRegionAxesLayout *)v155 setVerticalLayout:v157];

  [(STUIStatusBarRegion *)v154 setLayout:v155];
  v158 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  [v158 setImageNamePrefixes:&unk_1F2F9CAC8];
  v159 = [(STUIStatusBarVisualProvider_Split *)self systemUpdateFont];
  [v158 setFont:v159];

  v160 = [(STUIStatusBarVisualProvider_Split *)self systemUpdateFont];
  [v158 setEmphasizedFont:v160];

  [v158 setSymbolScale:2];
  [(STUIStatusBarRegion *)v154 setOverriddenStyleAttributes:v158];
  v161 = [(STUIStatusBarRegion *)v154 layoutItem];
  v162 = [v161 topAnchor];
  v163 = [v136 topAnchor];
  v164 = [v162 constraintEqualToAnchor:v163];
  [v6 addObject:v164];

  v165 = [(STUIStatusBarRegion *)v154 layoutItem];
  v166 = [v165 bottomAnchor];
  v167 = [v136 bottomAnchor];
  v168 = [v166 constraintEqualToAnchor:v167];
  [v6 addObject:v168];

  v169 = [(STUIStatusBarRegion *)v154 layoutItem];
  v170 = [v169 rightAnchor];
  v171 = [v136 rightAnchor];
  v172 = [v170 constraintEqualToAnchor:v171];
  [v6 addObject:v172];

  v173 = [(STUIStatusBarRegion *)v154 layoutItem];
  v174 = [v173 leftAnchor];
  v175 = [v136 leftAnchor];
  v176 = [v174 constraintEqualToAnchor:v175];
  [v6 addObject:v176];

  v177 = [(STUIStatusBarRegion *)v154 layoutItem];
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v177);

  [v275 addObject:v154];
  v178 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"controlCenter"];
  v179 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v180 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v179 setHorizontalLayout:v180];

  v181 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v179 setVerticalLayout:v181];

  [(STUIStatusBarRegion *)v178 setLayout:v179];
  v182 = [(STUIStatusBarRegion *)v178 layoutItem];
  v183 = [v182 topAnchor];
  v184 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v185 = [v184 bottomAnchor];
  v186 = [v183 constraintEqualToAnchor:v185 constant:6.0];
  [v6 addObject:v186];

  v187 = [(STUIStatusBarRegion *)v178 layoutItem];
  v188 = [v187 heightAnchor];
  [(STUIStatusBarVisualProvider_Split *)self grabberHeight];
  v189 = objc_msgSend(v188, "constraintEqualToConstant:");
  [v6 addObject:v189];

  v190 = [(STUIStatusBarRegion *)v178 layoutItem];
  v191 = [v190 leftAnchor];
  v192 = [v136 leftAnchor];
  v193 = [v191 constraintEqualToAnchor:v192 constant:10.0];
  [v6 addObject:v193];

  v194 = [(STUIStatusBarRegion *)v178 layoutItem];
  v195 = [v194 rightAnchor];
  v196 = [v136 rightAnchor];
  v197 = [v195 constraintEqualToAnchor:v196 constant:-10.0];
  [v6 addObject:v197];

  v198 = [(STUIStatusBarRegion *)v178 layoutItem];
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v198);

  [v275 addObject:v178];
  id v276 = v275;
  id v277 = v6;
  [(STUIStatusBarVisualProvider_Split *)self _setupExpandedRegionsInContainerView:v274 sensorHeight:&v277 constraints:&v276 regions:v13];
  id v199 = v277;

  id v268 = v276;
  v200 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"bottomLeading"];
  v201 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v202 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v202 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v202 setInterspace:v271];
  [(STUIStatusBarRegionAxesLayout *)v201 setHorizontalLayout:v202];

  v203 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v201 setVerticalLayout:v203];

  [(STUIStatusBarRegion *)v200 setLayout:v201];
  -[STUIStatusBarRegion setActionInsets:](v200, "setActionInsets:", -100.0, -12.0, -10.0, -12.0);
  v204 = [(STUIStatusBarRegion *)v200 layoutItem];
  v205 = [v204 leadingAnchor];
  v206 = [v274 leadingAnchor];
  [(STUIStatusBarVisualProvider_Split *)self bottomLeadingSpace];
  v207 = objc_msgSend(v205, "constraintEqualToAnchor:constant:", v206);
  [v199 addObject:v207];

  v208 = [(STUIStatusBarRegion *)v200 layoutItem];
  v209 = [v208 bottomAnchor];
  v210 = [v274 topAnchor];
  [(id)objc_opt_class() height];
  v212 = [v209 constraintEqualToAnchor:v210 constant:v211 + -6.0];
  [v199 addObject:v212];

  v213 = [(STUIStatusBarRegion *)v200 layoutItem];
  v214 = [v213 widthAnchor];
  [(STUIStatusBarVisualProvider_FixedSplit *)self notchRect];
  double v216 = floor(v215);
  [(id)objc_opt_class() additionalBottomLeadingMargin];
  v218 = [v214 constraintEqualToConstant:v216 - v217];
  [v199 addObject:v218];

  v219 = [(STUIStatusBarRegion *)v200 layoutItem];
  v220 = [v219 heightAnchor];
  v221 = [v220 constraintEqualToConstant:13.3333333];
  [v199 addObject:v221];

  v222 = [(STUIStatusBarRegion *)v200 layoutItem];
  objc_msgSend(v274, "_ui_insertSubLayoutItem:atIndex:", v222, 0);

  [v268 addObject:v200];
  v223 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"topTrailing"];
  v224 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v225 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v224 setHorizontalLayout:v225];

  v226 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:3];
  [(STUIStatusBarRegionAxesLayout *)v224 setVerticalLayout:v226];

  [(STUIStatusBarRegion *)v223 setLayout:v224];
  v227 = [(STUIStatusBarRegion *)v223 layoutItem];
  v228 = [v227 leadingAnchor];
  v229 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v230 = [v229 trailingAnchor];
  v231 = [v228 constraintEqualToAnchor:v230 constant:6.66666667];
  [v199 addObject:v231];

  v232 = [(STUIStatusBarRegion *)v223 layoutItem];
  v233 = [v232 topAnchor];
  v234 = [v274 topAnchor];
  v235 = [v233 constraintEqualToAnchor:v234 constant:6.33333333];
  [v199 addObject:v235];

  v236 = [(STUIStatusBarRegion *)v223 layoutItem];
  v237 = [v236 trailingAnchor];
  v238 = [v274 trailingAnchor];
  v239 = [v237 constraintEqualToAnchor:v238 constant:-30.0];
  [v199 addObject:v239];

  v240 = [(STUIStatusBarRegion *)v223 layoutItem];
  v241 = [v240 heightAnchor];
  v242 = [v241 constraintEqualToConstant:4.0];
  [v199 addObject:v242];

  v243 = [(STUIStatusBarRegion *)v223 layoutItem];
  objc_msgSend(v274, "_ui_addSubLayoutItem:", v243);

  [v268 addObject:v223];
  v244 = STUIStatusBarAddLumaView(v274, v199, v270, 0, v272);
  [(STUIStatusBarVisualProvider_Split *)self setLeadingBackgroundLumaView:v244];

  v245 = STUIStatusBarAddLumaView(v274, v199, v136, 0, v272);

  [(STUIStatusBarVisualProvider_Split *)self setTrailingBackgroundLumaView:v245];
  id v246 = objc_alloc(MEMORY[0x1E4FB21F0]);
  v247 = [(STUIStatusBarVisualProvider_Split *)self leadingBackgroundLumaView];
  v278[0] = v247;
  v248 = [(STUIStatusBarVisualProvider_Split *)self trailingBackgroundLumaView];
  v278[1] = v248;
  v249 = [MEMORY[0x1E4F1C978] arrayWithObjects:v278 count:2];
  v250 = objc_msgSend(v246, "initWithTransitionBoundaries:minimumDifference:delegate:views:", self, v249, 0.4, 0.7, 0.5);
  [(STUIStatusBarVisualProvider_iOS *)self setLumaTrackingGroup:v250];

  [MEMORY[0x1E4F28DC8] activateConstraints:v199];
  v251 = +[STUIStatusBarSettingsDomain rootSettings];
  v252 = [v251 visualProviderSettings];
  [v252 backgroundActivityCoalescingDelay];
  double v254 = v253;

  if (v254 > 0.0)
  {
    v255 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    v256 = [v255 dataAggregator];
    v257 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA9728]];
    [v256 beginCoalescingUpdatesForEntryKeys:v257 delay:v254];
  }
  return v268;
}

- (id)_orderedDisplayItemPlacements
{
  v75[1] = *MEMORY[0x1E4F143B8];
  v65.receiver = self;
  v65.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  double v3 = [(STUIStatusBarVisualProvider_Split *)&v65 _orderedDisplayItemPlacements];
  [(STUIStatusBarVisualProvider_FixedSplit *)self leadingSmallPillSpacing];
  double v5 = v4;
  [(STUIStatusBarVisualProvider_FixedSplit *)self leadingItemSpacing];
  double v7 = +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 1013, v5 + v6 * -2.0, 0.0);
  double v8 = [v3 objectForKeyedSubscript:@"leading"];
  double v9 = (void *)[v8 mutableCopy];

  double v10 = [(STUIStatusBarVisualProvider_Split *)self voiceControlPillPlacement];
  uint64_t v11 = [v9 indexOfObject:v10];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v12 = [(STUIStatusBarVisualProvider_Split *)self voiceControlPillPlacement];
    v75[0] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
    double v14 = [v7 requiringAllPlacements:v13];
    [v9 insertObject:v14 atIndex:v11];

    [v3 setObject:v9 forKeyedSubscript:@"leading"];
  }
  v61 = v7;
  v62 = v9;
  double v15 = +[STUIStatusBarTimeItem pillTimeDisplayIdentifier];
  v63 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v15 priority:1900];

  double v16 = +[STUIStatusBarItem defaultDisplayIdentifier];
  double v17 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v16 priority:1800];

  double v18 = +[STUIStatusBarItem defaultDisplayIdentifier];
  double v19 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v18 priority:1950];
  v74[0] = v63;
  v74[1] = v17;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  uint64_t v21 = [v19 excludingPlacements:v20];

  double v22 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
  [v22 setPillIconPlacement:v21];

  double v23 = +[STUIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
  double v24 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v23 priority:1949];
  uint64_t v73 = v21;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
  uint64_t v26 = [v24 requiringAllPlacements:v25];

  v71[0] = @"pill";
  double v27 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];
  double v28 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v27 priority:2000];
  v69[0] = @"leading";
  v69[1] = @"bottomLeading";
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  double v30 = [v28 excludingAllPlacementsInRegions:v29];
  v70 = v30;
  double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  v71[1] = @"pillContent";
  v72[0] = v31;
  v59 = (void *)v26;
  v60 = (void *)v21;
  v68[0] = v21;
  v68[1] = v26;
  v68[2] = v63;
  v68[3] = v17;
  double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];
  v72[1] = v32;
  double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
  [v3 addEntriesFromDictionary:v33];

  double v34 = +[STUIStatusBarSettingsDomain rootSettings];
  id v35 = [v34 visualProviderSettings];
  LODWORD(v32) = [v35 enableActivity];

  if (v32)
  {
    v36 = +[STUIStatusBarActivityItem_Split pillDisplayIdentifier];
    v37 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v36 priority:100];
    v67 = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
    [v3 setObject:v38 forKeyedSubscript:@"topTrailing"];
  }
  v39 = +[STUIStatusBarSettingsDomain rootSettings];
  v40 = [v39 visualProviderSettings];
  int v41 = [v40 promoteThermalWarning];

  v42 = v62;
  if (v41)
  {
    v43 = [v3 objectForKeyedSubscript:@"trailing"];
    v44 = (void *)[v43 mutableCopy];

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __71__STUIStatusBarVisualProvider_FixedSplit__orderedDisplayItemPlacements__block_invoke;
    v64[3] = &unk_1E6AA4D00;
    v64[4] = self;
    uint64_t v45 = [v44 indexOfObjectPassingTest:v64];
    uint64_t v46 = [v44 indexOfObjectPassingTest:&__block_literal_global_450];
    if (v46 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v47 = 0;
    }
    else
    {
      v47 = [v44 objectAtIndexedSubscript:v46];
    }
    uint64_t v48 = [v44 indexOfObjectPassingTest:&__block_literal_global_452];
    if (v48 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v49 = 0;
    }
    else
    {
      uint64_t v50 = [v44 objectAtIndexedSubscript:v48];
      v49 = (void *)v50;
      if (v45 != 0x7FFFFFFFFFFFFFFFLL && v47 && v50)
      {
        v51 = +[STUIStatusBarItem defaultDisplayIdentifier];
        v52 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v51 priority:1110];
        v66[0] = v47;
        v66[1] = v49;
        v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
        v54 = [v52 excludingPlacements:v53];
        [v44 insertObject:v54 atIndex:v45];

        v42 = v62;
      }
    }
    [v3 setObject:v44 forKeyedSubscript:@"trailing"];

    v55 = [v3 objectForKeyedSubscript:@"systemUpdates"];
    v56 = (void *)[v55 mutableCopy];

    uint64_t v57 = [v56 indexOfObjectPassingTest:&__block_literal_global_454];
    if (v57 != 0x7FFFFFFFFFFFFFFFLL) {
      [v56 removeObjectAtIndex:v57];
    }
    [v3 setObject:v56 forKeyedSubscript:@"systemUpdates"];
  }
  return v3;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacements];

  if (!v5)
  {
    double v6 = [(STUIStatusBarVisualProvider_FixedSplit *)self _orderedDisplayItemPlacements];
    [(STUIStatusBarVisualProvider_Split *)self setOrderedDisplayItemPlacements:v6];
  }
  double v7 = [(STUIStatusBarVisualProvider_Split *)self orderedDisplayItemPlacements];
  double v8 = [v7 objectForKeyedSubscript:v4];

  return v8;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  id v4 = [(STUIStatusBarVisualProvider_Split *)&v12 styleAttributesForStyle:a3];
  [(STUIStatusBarVisualProvider_FixedSplit *)self referenceWidth];
  double v6 = v5;
  double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 _unjailedReferenceBounds];
  double Width = CGRectGetWidth(v14);

  uint64_t v9 = [v4 mode];
  if ((unint64_t)(v9 - 2) >= 2)
  {
    if (v9 == 1)
    {
      BOOL v10 = 0;
      goto LABEL_6;
    }
    if (v9) {
      goto LABEL_7;
    }
  }
  BOOL v10 = v6 != Width;
LABEL_6:
  [v4 setScaledFixedWidthBar:v10];
LABEL_7:
  return v4;
}

- (BOOL)wantsPillInExpandedTrailingPlacements
{
  return 1;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[STUIStatusBarPillBackgroundActivityItem pillCombinedDisplayIdentifier];

  if (v5 == v4)
  {
    double v6 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
    double v7 = [(STUIStatusBarVisualProvider_FixedSplit *)self expandedPillFont];
    [v6 setFont:v7];

    double v8 = [(STUIStatusBarVisualProvider_FixedSplit *)self expandedPillFont];
    [v6 setSmallFont:v8];

    [(STUIStatusBarVisualProvider_FixedSplit *)self expandedPillSize];
    [v6 setIconScale:v9 / 21.3333333];
    [v6 setSymbolScale:2];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
    double v6 = [(STUIStatusBarVisualProvider_Split *)&v11 overriddenStyleAttributesForDisplayItemWithIdentifier:v4];
  }

  return v6;
}

- (void)itemCreated:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  [(STUIStatusBarVisualProvider_Split *)&v8 itemCreated:v4];
  id v5 = [v4 identifier];
  double v6 = +[STUIStatusBarItem identifier];

  if (v5 == v6)
  {
    id v7 = v4;
    [(STUIStatusBarVisualProvider_FixedSplit *)self expandedPillSize];
    objc_msgSend(v7, "setPillSize:");
  }
}

- (id)region:(id)a3 willSetDisplayItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 identifier];
  if (![v7 isEqual:@"trailing"]) {
    goto LABEL_11;
  }
  uint64_t v8 = [v6 count];

  if (!v8) {
    goto LABEL_12;
  }
  unint64_t v9 = [v6 count];
  unsigned __int8 isKindOfClass = v9 < 3;
  id v7 = [v5 layout];
  objc_super v11 = [v7 horizontalLayout];
  if (v11)
  {
    objc_super v12 = [v7 horizontalLayout];
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  }
  if (v9 >= 3 && (isKindOfClass & 1) == 0)
  {
    double v13 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
    [(STUIStatusBarRegionAxisCenteringLayout *)v13 setMargin:0.0];
    [(STUIStatusBarRegionAxisCenteringLayout *)v13 setMaxNumberOfItems:3];
LABEL_10:
    [v7 setHorizontalLayout:v13];

    goto LABEL_11;
  }
  if (((v9 < 3) & isKindOfClass) == 1)
  {
    double v13 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
    [(STUIStatusBarRegionAxisCenteringLayout *)v13 setAlignment:4];
    [(STUIStatusBarRegionAxisCenteringLayout *)v13 setInterspace:6.0];
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  return v6;
}

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  id v4 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v4 avoidanceFrame];
  -[STUIStatusBarVisualProvider_Split _updateExpandedConstraintsForAvoidanceFrame:](self, "_updateExpandedConstraintsForAvoidanceFrame:");

  id v6 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  id v5 = [v6 currentAggregatedData];
  [(STUIStatusBarVisualProvider_FixedSplit *)self _updateLowerRegionsWithData:v5];
}

- (void)dataUpdated:(id)a3
{
  id v4 = a3;
  [(STUIStatusBarVisualProvider_FixedSplit *)self _updateSystemNavigationWithData:v4];
  [(STUIStatusBarVisualProvider_FixedSplit *)self _updateLowerRegionsWithData:v4];
}

- (id)regionIdentifiersForPartWithIdentifier:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  id v5 = [(STUIStatusBarVisualProvider_Split *)&v13 regionIdentifiersForPartWithIdentifier:v4];
  if ([v4 isEqual:@"leadingPartIdentifier"])
  {
    v15[0] = @"pill";
    v15[1] = @"pillContent";
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = v15;
    uint64_t v8 = 2;
LABEL_7:
    BOOL v10 = [v6 arrayWithObjects:v7 count:v8];
    objc_super v11 = [v5 setByAddingObjectsFromArray:v10];

    goto LABEL_10;
  }
  if ([v4 isEqual:@"trailingPartIdentifier"])
  {
    id v9 = [v5 setByAddingObject:@"topTrailing"];
  }
  else
  {
    if ([v4 isEqual:@"normalPartIdentifier"])
    {
      v14[0] = @"pill";
      v14[1] = @"pillContent";
      v14[2] = @"topTrailing";
      id v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = v14;
      uint64_t v8 = 3;
      goto LABEL_7;
    }
    id v9 = v5;
  }
  objc_super v11 = v9;
LABEL_10:

  return v11;
}

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  id v6 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v6 avoidanceFrame];
  -[STUIStatusBarVisualProvider_Split _updateExpandedConstraintsForAvoidanceFrame:](self, "_updateExpandedConstraintsForAvoidanceFrame:");
}

- (void)_updateSystemNavigationWithData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 backNavigationEntry];
  if (v5)
  {

LABEL_3:
    id v6 = [v4 backNavigationEntry];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      double v15 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      double v16 = [v15 currentAggregatedData];
      id v8 = [v16 backNavigationEntry];
    }
    double v17 = [v4 backgroundActivityEntry];
    double v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      double v20 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
      uint64_t v21 = [v20 currentAggregatedData];
      id v19 = [v21 backgroundActivityEntry];
    }
    double v22 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    double v23 = [v22 regions];
    double v24 = [v23 objectForKeyedSubscript:@"leading"];
    double v25 = [v24 action];

    if (self)
    {
      [(STUIStatusBarVisualProvider_FixedSplit *)self leadingCenteringEdgeInset];
      -[STUIStatusBarVisualProvider_FixedSplit _edgeInsetsFromCenteringEdgeInset:trailing:](self, "_edgeInsetsFromCenteringEdgeInset:trailing:", 0);
      double v27 = v26;
    }
    else
    {
      double v27 = 0.0;
    }
    if ([v8 isEnabled] && (objc_msgSend(v19, "isEnabled") & 1) == 0)
    {
      [(STUIStatusBarVisualProvider_Split *)self bottomLeadingTopOffset];
      double v30 = -v27 - v34;
      p_leadingBottomConstraint = &self->_leadingBottomConstraint;
      [(NSLayoutConstraint *)self->_leadingBottomConstraint constant];
      if (vabdd_f64(v35, v30) > 2.22044605e-16)
      {
        uint64_t v31 = 0;
        goto LABEL_21;
      }
      double v32 = v25;
      uint64_t v33 = 0;
    }
    else
    {
      p_leadingBottomConstraint = &self->_leadingBottomConstraint;
      [(NSLayoutConstraint *)self->_leadingBottomConstraint constant];
      if (fabs(v27 + v29) > 2.22044605e-16)
      {
        double v30 = -v27;
        uint64_t v31 = 1;
LABEL_21:
        [(NSLayoutConstraint *)*p_leadingBottomConstraint setConstant:v30];
        [v25 setEnabled:v31];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __74__STUIStatusBarVisualProvider_FixedSplit__updateSystemNavigationWithData___block_invoke;
        v36[3] = &unk_1E6AA37A0;
        v36[4] = self;
        [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:0 friction:v36 interactive:0 animations:200.0 completion:20.0];
LABEL_24:

        goto LABEL_25;
      }
      double v32 = v25;
      uint64_t v33 = 1;
    }
    [v32 setEnabled:v33];
    goto LABEL_24;
  }
  uint64_t v9 = [v4 backgroundActivityEntry];
  if (v9)
  {
    BOOL v10 = (void *)v9;
    objc_super v11 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    objc_super v12 = [v11 currentAggregatedData];
    objc_super v13 = [v12 backNavigationEntry];
    int v14 = [v13 isEnabled];

    if (v14) {
      goto LABEL_3;
    }
  }
LABEL_25:
}

- (id)animationForBackgroundActivityPillAnimation:(id)a3 duration:(double)a4 scale:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  BOOL v10 = [v9 currentAggregatedData];
  objc_super v11 = [v10 voiceControlEntry];
  int v12 = [v11 isEnabled];

  if (v12)
  {
    objc_super v13 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    int v14 = [v13 _shouldReverseLayoutDirection];

    if (v14) {
      double v15 = -1.0;
    }
    else {
      double v15 = 1.0;
    }
    double v16 = +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a4, a5, v15 * 5.0, 0.0);
    [v16 setPriority:30];
    double v17 = +[STUIStatusBarTimeItem pillTimeDisplayIdentifier];
    [v8 addSubAnimation:v16 forDisplayItemWithIdentifier:v17];

    double v18 = +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a4, a5, v15 * -5.0, 0.0);
    [v18 setPriority:30];
    id v19 = +[STUIStatusBarItem defaultDisplayIdentifier];
    [v8 addSubAnimation:v18 forDisplayItemWithIdentifier:v19];
  }
  [v8 setDelaysDependentItems:1];
  return v8;
}

- (BOOL)_updateLowerRegionsWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarVisualProvider_FixedSplit;
  BOOL v4 = [(STUIStatusBarVisualProvider_Split *)&v7 _updateLowerRegionsWithData:a3];
  if (v4)
  {
    id v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v5 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end