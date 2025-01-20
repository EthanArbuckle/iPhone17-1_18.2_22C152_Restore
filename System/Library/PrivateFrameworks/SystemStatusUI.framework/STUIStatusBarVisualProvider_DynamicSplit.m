@interface STUIStatusBarVisualProvider_DynamicSplit
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
+ (double)baseFontSize;
+ (double)expandedFontSize;
+ (double)height;
- (BOOL)_needsUpdateOfConstraintsForAvoidanceFrame:(double *)a3 cutoutOffset:(CGFloat)a4 cutoutWidth:(CGFloat)a5;
- (CGSize)smallPillSize;
- (NSDirectionalEdgeInsets)expandedEdgeInsets;
- (double)bottomLeadingTopOffset;
- (double)edgeInsets;
- (double)effectiveTargetDisplayWidth;
- (double)expandedIconScale;
- (double)itemSpacing;
- (double)leadingItemSpacing;
- (double)normalIconScale;
- (double)sensorAreaRect;
- (id)_orderedDisplayItemPlacements;
- (id)_updateSystemNavigationWithData:(CGFloat)a3 avoidanceFrame:(CGFloat)a4;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3;
- (id)leadingItemCutoffWidths;
- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3;
- (id)region:(id)a3 willSetDisplayItems:(id)a4;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)setupInContainerView:(id)a3;
- (id)trailingItemCutoffWidths;
- (uint64_t)_updateSystemUpdateRegionEnablement:(uint64_t)a3 forTrailingNumberOfItems:;
- (void)_calculateSquishyLayoutValuesForCutoutOffset:(uint64_t)a1 cutoutWidth:(uint64_t *)a2 maxLeadingItems:(uint64_t *)a3 maxTrailingItems:(void *)a4 leadingScale:(void *)a5 trailingScale:(double)a6 includingPrivacyIndicator:(double)a7;
- (void)_updateRingerDisplayItem:(int)a3 enabled:;
- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5;
- (void)dataUpdated:(id)a3;
- (void)itemCreated:(id)a3;
- (void)orientationUpdatedFromOrientation:(int64_t)a3;
- (void)setOnAODLockScreen:(BOOL)a3;
- (void)setOnLockScreen:(BOOL)a3;
- (void)updateDisplayItem:(id)a3 toDynamicallyHidden:(BOOL)a4 scale:(double)a5;
- (void)updateDisplayItem:(id)a3 toScale:(double)a4;
@end

@implementation STUIStatusBarVisualProvider_DynamicSplit

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[STUIStatusBarBatteryItem iconDisplayIdentifier];
  if ((id)v5 == v4)
  {
  }
  else
  {
    v6 = (void *)v5;
    id v7 = +[STUIStatusBarBatteryItem staticIconDisplayIdentifier];

    if (v7 != v4)
    {
      v15.receiver = self;
      v15.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
      v8 = [(STUIStatusBarVisualProvider_Split *)&v15 overriddenStyleAttributesForDisplayItemWithIdentifier:v4];
      goto LABEL_11;
    }
  }
  v8 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  if (self)
  {
    int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
    v10 = (void *)qword_1EC05F040;
    if (!qword_1EC05F040 || _MergedGlobals_11 != IsBoldTextEnabled)
    {
      _MergedGlobals_11 = IsBoldTextEnabled;
      v11 = (void *)MEMORY[0x1E4FB08E0];
      [(id)objc_opt_class() baseFontSize];
      uint64_t v12 = objc_msgSend(v11, "systemFontOfSize:weight:design:", *MEMORY[0x1E4FB0938]);
      v13 = (void *)qword_1EC05F040;
      qword_1EC05F040 = v12;

      v10 = (void *)qword_1EC05F040;
    }
    self = v10;
  }
  [v8 setFont:self];

LABEL_11:
  return v8;
}

- (CGSize)smallPillSize
{
  double v2 = 20.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)displayItemIdentifiersForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[STUIStatusBarSettingsDomain rootSettings];
  v6 = [v5 itemSettings];
  if ([v6 showRingerOnAODLockScreen])
  {
    int v7 = [v4 isEqual:@"aodPartIdentifier"];

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      v9 = +[STUIStatusBarItem defaultDisplayIdentifier];
      v10 = [v8 setWithObject:v9];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  v10 = [(STUIStatusBarVisualProvider_Split *)&v12 displayItemIdentifiersForPartWithIdentifier:v4];
LABEL_6:

  return v10;
}

- (double)normalIconScale
{
  return 1.26;
}

- (void)itemCreated:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  [(STUIStatusBarVisualProvider_Split *)&v13 itemCreated:v4];
  uint64_t v5 = +[STUIStatusBarSettingsDomain rootSettings];
  v6 = [v5 itemSettings];
  if ([v6 showRingerOffLockScreen])
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = +[STUIStatusBarItem defaultDisplayIdentifier];
      v9 = [v4 displayItemForIdentifier:v8];
      -[STUIStatusBarVisualProvider_DynamicSplit _updateRingerDisplayItem:enabled:]((uint64_t)self, v9, [(STUIStatusBarVisualProvider_iOS *)self onLockScreen]);
LABEL_10:

      goto LABEL_11;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = +[STUIStatusBarCellularItem nameDisplayIdentifier];
    v8 = [v4 displayItemForIdentifier:v10];

    if (self) {
      double v11 = 2.0;
    }
    else {
      double v11 = 0.0;
    }
    [v8 setAdditionalDynamicPadding:v11];
    objc_super v12 = +[STUIStatusBarCellularCondensedItem dualNameDisplayIdentifier];
    v9 = [v4 displayItemForIdentifier:v12];

    [v9 setAdditionalDynamicPadding:v11];
    goto LABEL_10;
  }
LABEL_11:
}

+ (double)height
{
  return 53.6666667;
}

- (id)setupInContainerView:(id)a3
{
  v211[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v202 = [MEMORY[0x1E4F1CA48] array];
  [(id)objc_opt_class() height];
  double v198 = v6;
  -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)self);
  double v8 = v7;
  double v10 = v9;
  double v197 = -[STUIStatusBarVisualProvider_DynamicSplit edgeInsets]((uint64_t)self);
  double v12 = v11;
  double v194 = v13;
  double v195 = v14;
  [(STUIStatusBarVisualProvider_DynamicSplit *)self leadingItemSpacing];
  double v193 = v15;
  [(STUIStatusBarVisualProvider_DynamicSplit *)self itemSpacing];
  double v200 = v16;
  v17 = [(STUIStatusBarVisualProvider_Split *)self normalFont];
  [v17 capHeight];
  double v19 = v18;

  v20 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v20 avoidanceFrame];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  double v209 = 0.0;
  double v210 = 0.0;
  -[STUIStatusBarVisualProvider_DynamicSplit _needsUpdateOfConstraintsForAvoidanceFrame:cutoutOffset:cutoutWidth:]((id *)&self->super.super.super.super.isa, &v210, &v209, v22, v24, v26, v28);
  double v207 = 0.0;
  double v208 = 0.0;
  uint64_t v205 = 0;
  uint64_t v206 = 0;
  -[STUIStatusBarVisualProvider_DynamicSplit _calculateSquishyLayoutValuesForCutoutOffset:cutoutWidth:maxLeadingItems:maxTrailingItems:leadingScale:trailingScale:includingPrivacyIndicator:]((uint64_t)self, &v206, &v205, &v208, &v207, v210, v209);
  id v29 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v29 setIdentifier:@"UIStatusBarCutout"];
  v30 = [v29 topAnchor];
  v31 = [v4 topAnchor];
  v32 = [v30 constraintEqualToAnchor:v31 constant:v8];
  [v5 addObject:v32];

  v33 = [v4 trailingAnchor];
  v34 = [v29 centerXAnchor];
  v35 = [v33 constraintEqualToAnchor:v34 constant:v210];
  v36 = v35;
  if (self)
  {
    objc_storeStrong((id *)&self->_cutoutCenterConstraint, v35);

    [v5 addObject:self->_cutoutCenterConstraint];
    v37 = [v29 widthAnchor];
    v38 = [v37 constraintEqualToConstant:v209];
    objc_storeStrong((id *)&self->_cutoutWidthConstraint, v38);

    cutoutWidthConstraint = self->_cutoutWidthConstraint;
    double v40 = 8.0;
    double v41 = 0.94;
  }
  else
  {

    [v5 addObject:0];
    v192 = [v29 widthAnchor];
    [v192 constraintEqualToConstant:v209];

    cutoutWidthConstraint = 0;
    double v41 = 0.0;
    double v40 = 0.0;
  }
  [v5 addObject:cutoutWidthConstraint];
  v42 = [v29 heightAnchor];
  v43 = [v42 constraintEqualToConstant:v10];
  [v5 addObject:v43];

  [v4 addLayoutGuide:v29];
  [(STUIStatusBarVisualProvider_Split *)self setCutoutLayoutGuide:v29];

  id v44 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v44 setIdentifier:@"UIStatusBarMainRegions"];
  v45 = [v44 trailingAnchor];
  v46 = [v4 trailingAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];

  LODWORD(v48) = 1144750080;
  [v47 setPriority:v48];
  [v5 addObject:v47];
  v49 = [v44 widthAnchor];
  v50 = [v49 constraintEqualToConstant:-[STUIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth]((uint64_t)self)];

  LODWORD(v51) = 1144750080;
  [v50 setPriority:v51];
  [v5 addObject:v50];
  v52 = [v44 heightAnchor];
  [v52 constraintEqualToConstant:v10];
  v54 = v53 = v4;
  [v5 addObject:v54];

  v55 = [v44 bottomAnchor];
  v56 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v57 = [v56 bottomAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];
  [v5 addObject:v58];

  v201 = v53;
  [v53 addLayoutGuide:v44];

  [(STUIStatusBarVisualProvider_Split *)self setMainRegionsLayoutGuide:v44];
  v59 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"leading"];
  v60 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v61 = objc_alloc_init(STUIStatusBarRegionAxisSquishyLayout);
  [(STUIStatusBarRegionAxisSquishyLayout *)v61 setAlignment:3];
  [(STUIStatusBarRegionAxisSquishyLayout *)v61 setInterspace:v193];
  [(STUIStatusBarRegionAxisSquishyLayout *)v61 setCompressItems:1];
  [(STUIStatusBarRegionAxisSquishyLayout *)v61 setMaxNumberOfItems:3];
  _updateSquishyRegionForDynamicValues(v61, v206, v208);
  [(STUIStatusBarRegionAxisSquishyLayout *)v61 setMinItemDynamicScale:v41];
  [(STUIStatusBarRegionAxisSquishyLayout *)v61 setMinInterspaceDynamicScale:0.6];
  [(STUIStatusBarRegionAxisSquishyLayout *)v61 setDynamicHidingDelegate:self];
  [(STUIStatusBarRegionAxesLayout *)v60 setHorizontalLayout:v61];

  v62 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:5];
  [(STUIStatusBarRegionAxesLayout *)v60 setVerticalLayout:v62];

  [(STUIStatusBarRegion *)v59 setLayout:v60];
  -[STUIStatusBarRegion setActionInsets:](v59, "setActionInsets:", -v197, -v12, -(v198 + v194 - v10), -v195);
  [(STUIStatusBarRegion *)v59 setDisableItemFrameBasedOverflow:1];
  v63 = [(STUIStatusBarRegion *)v59 layoutItem];
  v64 = [v63 centerYAnchor];
  v65 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v66 = [v65 centerYAnchor];
  v67 = [v64 constraintEqualToAnchor:v66 constant:v197];
  leadingCenterYConstraint = self->_leadingCenterYConstraint;
  self->_leadingCenterYConstraint = v67;

  [v5 addObject:self->_leadingCenterYConstraint];
  v69 = v63;
  v70 = [v63 heightAnchor];
  v71 = [v70 constraintEqualToConstant:v19 + 1.0];
  [v5 addObject:v71];

  v72 = [v63 leadingAnchor];
  v73 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v74 = [v73 leadingAnchor];
  v75 = [v72 constraintEqualToAnchor:v74 constant:v12];
  [v5 addObject:v75];

  v199 = v69;
  v76 = [v69 trailingAnchor];
  v77 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v78 = [v77 leadingAnchor];
  v79 = [v76 constraintEqualToAnchor:v78 constant:-v40];

  LODWORD(v80) = 1144750080;
  [v79 setPriority:v80];
  [v5 addObject:v79];
  objc_msgSend(v53, "_ui_addSubLayoutItem:", v69);

  [v202 addObject:v59];
  v81 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"trailing"];
  v82 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v83 = objc_alloc_init(STUIStatusBarRegionAxisSquishyLayout);
  [(STUIStatusBarRegionAxisSquishyLayout *)v83 setAlignment:4];
  [(STUIStatusBarRegionAxisSquishyLayout *)v83 setInterspace:v200];
  [(STUIStatusBarRegionAxisSquishyLayout *)v83 setMaxNumberOfItems:3];
  _updateSquishyRegionForDynamicValues(v83, v205, v207);
  [(STUIStatusBarRegionAxisSquishyLayout *)v83 setMinItemDynamicScale:v41];
  [(STUIStatusBarRegionAxisSquishyLayout *)v83 setMinInterspaceDynamicScale:0.6];
  [(STUIStatusBarRegionAxisSquishyLayout *)v83 setDynamicHidingDelegate:self];
  [(STUIStatusBarRegionAxesLayout *)v82 setHorizontalLayout:v83];

  v84 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:5];
  [(STUIStatusBarRegionAxesLayout *)v82 setVerticalLayout:v84];

  [(STUIStatusBarRegion *)v81 setLayout:v82];
  -[STUIStatusBarRegion setActionInsets:](v81, "setActionInsets:", -100.0, -20.0, -10.0, -20.0);
  [(STUIStatusBarRegion *)v81 setDisableItemFrameBasedOverflow:1];
  v85 = [(STUIStatusBarRegion *)v81 layoutItem];
  v86 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  v87 = [(STUIStatusBarVisualProvider_Split *)self emphasizedFont];
  [v86 setFont:v87];

  v88 = [(STUIStatusBarVisualProvider_Split *)self normalFont];
  [v86 setSmallFont:v88];

  [v86 setImageNamePrefixes:&unk_1F2F9C888];
  [(STUIStatusBarRegion *)v81 setOverriddenStyleAttributes:v86];
  v89 = [v85 centerYAnchor];
  v90 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v91 = [v90 centerYAnchor];
  v92 = [v89 constraintEqualToAnchor:v91 constant:v197];
  [v5 addObject:v92];

  v93 = [v85 heightAnchor];
  v94 = [v93 constraintEqualToConstant:v19 + 1.0];
  [v5 addObject:v94];

  v95 = [v85 trailingAnchor];
  v96 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v97 = [v96 trailingAnchor];
  v98 = [v95 constraintEqualToAnchor:v97 constant:-v195];
  [v5 addObject:v98];

  v99 = [v85 leadingAnchor];
  v100 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v101 = [v100 trailingAnchor];
  v102 = [v99 constraintEqualToAnchor:v101 constant:v40];

  LODWORD(v103) = 1144750080;
  [v102 setPriority:v103];
  [v5 addObject:v102];
  objc_msgSend(v201, "_ui_addSubLayoutItem:", v85);

  [v202 addObject:v81];
  v104 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"systemUpdates"];
  v105 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v106 = objc_alloc_init(STUIStatusBarRegionAxisCenteringLayout);
  [(STUIStatusBarRegionAxisCenteringLayout *)v106 setMaxNumberOfItems:3];
  [(STUIStatusBarRegionAxesLayout *)v105 setHorizontalLayout:v106];

  v107 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:5];
  [(STUIStatusBarRegionAxesLayout *)v105 setVerticalLayout:v107];

  [(STUIStatusBarRegion *)v104 setLayout:v105];
  v108 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
  [v108 setImageNamePrefixes:&unk_1F2F9C8A0];
  v109 = [(STUIStatusBarVisualProvider_Split *)self systemUpdateFont];
  [v108 setFont:v109];

  v110 = [(STUIStatusBarVisualProvider_Split *)self systemUpdateFont];
  [v108 setEmphasizedFont:v110];

  [v108 setSymbolScale:2];
  [(STUIStatusBarRegion *)v104 setOverriddenStyleAttributes:v108];
  v111 = [(STUIStatusBarRegion *)v104 layoutItem];
  v112 = [v111 topAnchor];
  v113 = [v85 topAnchor];
  v114 = [v112 constraintEqualToAnchor:v113];
  [v5 addObject:v114];

  v115 = [(STUIStatusBarRegion *)v104 layoutItem];
  v116 = [v115 bottomAnchor];
  v117 = [v85 bottomAnchor];
  v118 = [v116 constraintEqualToAnchor:v117];
  [v5 addObject:v118];

  v119 = [(STUIStatusBarRegion *)v104 layoutItem];
  v120 = [v119 rightAnchor];
  v121 = [v85 rightAnchor];
  v122 = [v120 constraintEqualToAnchor:v121];
  [v5 addObject:v122];

  v123 = [(STUIStatusBarRegion *)v104 layoutItem];
  v124 = [v123 leftAnchor];
  v125 = [v85 leftAnchor];
  v126 = [v124 constraintEqualToAnchor:v125];
  [v5 addObject:v126];

  v127 = [(STUIStatusBarRegion *)v104 layoutItem];
  objc_msgSend(v201, "_ui_addSubLayoutItem:", v127);

  -[STUIStatusBarVisualProvider_DynamicSplit _updateSystemUpdateRegionEnablement:forTrailingNumberOfItems:]((uint64_t)self, v104, v205);
  [v202 addObject:v104];

  v128 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"controlCenter"];
  v129 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v130 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v129 setHorizontalLayout:v130];

  v131 = +[STUIStatusBarRegionAxisFillingLayout fillingLayout];
  [(STUIStatusBarRegionAxesLayout *)v129 setVerticalLayout:v131];

  [(STUIStatusBarRegion *)v128 setLayout:v129];
  v132 = [(STUIStatusBarRegion *)v128 layoutItem];
  v133 = [v132 bottomAnchor];
  v134 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v135 = [v134 bottomAnchor];
  v136 = [v133 constraintEqualToAnchor:v135 constant:-2.0];
  [v5 addObject:v136];

  v137 = [(STUIStatusBarRegion *)v128 layoutItem];
  v138 = [v137 heightAnchor];
  [(STUIStatusBarVisualProvider_Split *)self grabberHeight];
  v139 = objc_msgSend(v138, "constraintEqualToConstant:");
  [v5 addObject:v139];

  v140 = [(STUIStatusBarRegion *)v128 layoutItem];
  v141 = [v140 leftAnchor];
  v142 = [v85 leftAnchor];
  v143 = [v141 constraintGreaterThanOrEqualToAnchor:v142 constant:10.0];
  [v5 addObject:v143];

  v144 = [(STUIStatusBarRegion *)v128 layoutItem];
  v145 = [v144 rightAnchor];
  v196 = v85;
  v146 = [v85 rightAnchor];
  v147 = [v145 constraintLessThanOrEqualToAnchor:v146 constant:-10.0];
  [v5 addObject:v147];

  v148 = [(STUIStatusBarRegion *)v128 layoutItem];
  v149 = [v148 widthAnchor];
  v150 = [v149 constraintEqualToConstant:41.0];

  LODWORD(v151) = 1132068864;
  [v150 setPriority:v151];
  [v5 addObject:v150];
  v152 = [(STUIStatusBarRegion *)v128 layoutItem];
  v153 = [v152 centerXAnchor];
  v154 = [v85 centerXAnchor];
  v155 = [v153 constraintEqualToAnchor:v154];
  [v5 addObject:v155];

  v156 = [(STUIStatusBarRegion *)v128 layoutItem];
  objc_msgSend(v201, "_ui_addSubLayoutItem:", v156);

  [v202 addObject:v128];
  id v203 = v202;
  id v204 = v5;
  [(STUIStatusBarVisualProvider_Split *)self _setupExpandedRegionsInContainerView:v201 sensorHeight:&v204 constraints:&v203 regions:v10];
  id v157 = v204;

  id v158 = v203;
  v159 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"bottomLeading"];
  v160 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v161 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v161 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v161 setInterspace:v200];
  [(STUIStatusBarRegionAxesLayout *)v160 setHorizontalLayout:v161];

  v162 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:6];
  [(STUIStatusBarRegionAxesLayout *)v160 setVerticalLayout:v162];

  [(STUIStatusBarRegion *)v159 setLayout:v160];
  -[STUIStatusBarRegion setActionInsets:](v159, "setActionInsets:", -100.0, -12.0, -10.0, -12.0);
  v163 = [(STUIStatusBarRegion *)v159 layoutItem];
  v164 = [v163 leadingAnchor];
  v165 = [(STUIStatusBarVisualProvider_Split *)self mainRegionsLayoutGuide];
  v166 = [v165 leadingAnchor];
  [(STUIStatusBarVisualProvider_Split *)self bottomLeadingSpace];
  v167 = objc_msgSend(v164, "constraintEqualToAnchor:constant:", v166);
  [v157 addObject:v167];

  v168 = [(STUIStatusBarRegion *)v159 layoutItem];
  v169 = [v168 trailingAnchor];
  v170 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v171 = [v170 leadingAnchor];
  [(STUIStatusBarVisualProvider_Split *)self bottomLeadingSpace];
  v173 = [v169 constraintEqualToAnchor:v171 constant:-v172];
  [v157 addObject:v173];

  v174 = [(STUIStatusBarRegion *)v159 layoutItem];
  v175 = [v174 bottomAnchor];
  v176 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
  v177 = [v176 bottomAnchor];
  [(STUIStatusBarVisualProvider_DynamicSplit *)self bottomLeadingTopOffset];
  v179 = [v175 constraintEqualToAnchor:v177 constant:-v178];
  [v157 addObject:v179];

  v180 = [(STUIStatusBarRegion *)v159 layoutItem];
  v181 = [v180 heightAnchor];
  v182 = [v181 constraintEqualToConstant:13.3333333];
  [v157 addObject:v182];

  v183 = [(STUIStatusBarRegion *)v159 layoutItem];
  objc_msgSend(v201, "_ui_insertSubLayoutItem:atIndex:", v183, 0);

  [v158 addObject:v159];
  v184 = STUIStatusBarAddLumaView(v201, v157, v199, 0, v10);
  [(STUIStatusBarVisualProvider_Split *)self setLeadingBackgroundLumaView:v184];

  v185 = STUIStatusBarAddLumaView(v201, v157, v196, 0, v10);
  [(STUIStatusBarVisualProvider_Split *)self setTrailingBackgroundLumaView:v185];

  id v186 = objc_alloc(MEMORY[0x1E4FB21F0]);
  v187 = [(STUIStatusBarVisualProvider_Split *)self leadingBackgroundLumaView];
  v211[0] = v187;
  v188 = [(STUIStatusBarVisualProvider_Split *)self trailingBackgroundLumaView];
  v211[1] = v188;
  v189 = [MEMORY[0x1E4F1C978] arrayWithObjects:v211 count:2];
  v190 = objc_msgSend(v186, "initWithTransitionBoundaries:minimumDifference:delegate:views:", self, v189, 0.4, 0.7, 0.5);
  [(STUIStatusBarVisualProvider_iOS *)self setLumaTrackingGroup:v190];

  [MEMORY[0x1E4F28DC8] activateConstraints:v157];
  return v158;
}

- (id)_updateSystemNavigationWithData:(CGFloat)a3 avoidanceFrame:(CGFloat)a4
{
  id v11 = a2;
  if (a1)
  {
    double v12 = [a1 statusBar];
    char v13 = [v12 _shouldReverseLayoutDirection];

    double v14 = -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)a1);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v41.origin.x = a3;
    v41.origin.y = a4;
    v41.size.width = a5;
    v41.size.height = a6;
    v45.origin.x = v14;
    v45.origin.y = v16;
    v45.size.width = v18;
    v45.size.height = v20;
    if (!CGRectIntersectsRect(v41, v45))
    {
      a6 = v20;
      a5 = v18;
      a4 = v16;
      a3 = v14;
    }
    if (v13)
    {
      double v21 = [a1 mainRegionsLayoutGuide];
      [v21 layoutFrame];
      double MaxX = CGRectGetMaxX(v42);
      v43.origin.x = a3;
      v43.origin.y = a4;
      v43.size.width = a5;
      v43.size.height = a6;
      double MinX = MaxX - CGRectGetMaxX(v43);
    }
    else
    {
      v44.origin.x = a3;
      v44.origin.y = a4;
      v44.size.width = a5;
      v44.size.height = a6;
      double MinX = CGRectGetMinX(v44);
    }
    [a1 bottomLeadingSpace];
    double v25 = MinX + v24 * -2.0;
    double v26 = -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)a1);
    [a1 bottomLeadingSpace];
    double v28 = floor((v26 + v27 * -2.0) * 0.75);
    id v29 = [v11 backNavigationEntry];

    if (v29 || v28 > v25)
    {
      v30 = [a1 statusBar];
      v31 = [v30 regions];
      v32 = [v31 objectForKeyedSubscript:@"bottomLeading"];

      v33 = [a1 statusBar];
      v34 = [v33 regions];
      v35 = [v34 objectForKeyedSubscript:@"leading"];
      v36 = [v35 action];

      double v37 = -[STUIStatusBarVisualProvider_DynamicSplit edgeInsets]((uint64_t)a1);
      v38 = [v11 backNavigationEntry];
      LODWORD(v34) = [v38 isEnabled];

      if (v34 && v28 <= v25)
      {
        [a1[44] setConstant:v37 + -7.66666667];
        [v36 setEnabled:0];
        uint64_t v39 = [v32 enableWithToken:13];
      }
      else
      {
        [a1[44] setConstant:v37];
        [v36 setEnabled:1];
        uint64_t v39 = [v32 disableWithToken:13];
      }
      a1 = (id *)v39;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (double)sensorAreaRect
{
  if (!a1) {
    return 0.0;
  }
  if ((*(unsigned char *)(a1 + 328) & 1) == 0)
  {
    *(unsigned char *)(a1 + 328) |= 1u;
    double v2 = [(id)a1 statusBar];
    double v3 = [v2 _effectiveTargetScreen];

    id v4 = [v3 _exclusionArea];
    [v4 rect];
    double v6 = v5;
    [v3 _nativeScale];
    double v8 = v7 * v6;
    [v3 _scale];
    double v10 = v8 / v9;
    [v4 rect];
    double v12 = v11;
    [v3 _nativeScale];
    double v14 = v13 * v12;
    [v3 _scale];
    double v16 = v14 / v15;
    [v4 rect];
    double v18 = v17;
    [v3 _nativeScale];
    double v20 = v19 * v18;
    [v3 _scale];
    double v22 = v20 / v21;
    [v4 rect];
    double v24 = v23;
    [v3 _nativeScale];
    double v26 = v25 * v24;
    [v3 _scale];
    *(double *)(a1 + 256) = v10;
    *(double *)(a1 + 264) = v16;
    *(double *)(a1 + 272) = v22;
    *(double *)(a1 + 280) = v26 / v27;
  }
  return *(double *)(a1 + 256);
}

- (double)edgeInsets
{
  if (!a1) {
    return 0.0;
  }
  if ((*(unsigned char *)(a1 + 328) & 4) == 0)
  {
    *(unsigned char *)(a1 + 328) |= 4u;
    double v2 = [(id)a1 statusBar];
    double v3 = [v2 _effectiveTargetScreen];

    [v3 _displayCornerRadiusIgnoringZoom];
    double v5 = v4 + -55.0;
    [v3 _nativeScale];
    double v7 = floor(v6 * v5 / 10.0);
    [v3 _nativeScale];
    double v9 = v7 / v8;
    *(double *)(a1 + 296) = v9;
    *(double *)(a1 + 304) = v9 + 17.0;
    *(void *)(a1 + 312) = 0;
    *(double *)(a1 + 320) = v9 + 18.0;
  }
  return *(double *)(a1 + 296);
}

- (BOOL)_needsUpdateOfConstraintsForAvoidanceFrame:(double *)a3 cutoutOffset:(CGFloat)a4 cutoutWidth:(CGFloat)a5
{
  if (!a1) {
    return 0;
  }
  -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)a1);
  double v15 = v14;
  CGFloat v16 = v14 + 20.0;
  double v17 = -[STUIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth]((uint64_t)a1);
  if (a6 <= v16)
  {
    v33.origin.x = -[STUIStatusBarVisualProvider_DynamicSplit sensorAreaRect]((uint64_t)a1);
    double MidX = CGRectGetMidX(v33);
    double v24 = [a1 statusBar];
    double v25 = [v24 styleAttributes];
    uint64_t v26 = [v25 effectiveLayoutDirection];

    if (v26 == 1) {
      double v22 = MidX;
    }
    else {
      double v22 = v17 - MidX;
    }
    a6 = v15;
  }
  else
  {
    v32.origin.x = a4;
    v32.origin.y = a5;
    v32.size.width = a6;
    v32.size.height = a7;
    double v18 = CGRectGetMidX(v32);
    double v19 = [a1 statusBar];
    double v20 = [v19 styleAttributes];
    uint64_t v21 = [v20 effectiveLayoutDirection];

    if (v21 == 1) {
      double v22 = v18;
    }
    else {
      double v22 = v17 - v18;
    }
  }
  BOOL v27 = 0;
  if (fabs(v22) != INFINITY && fabs(a6) != INFINITY)
  {
    if (a2) {
      *a2 = v22;
    }
    if (a3) {
      *a3 = a6;
    }
    id v28 = a1[43];
    [v28 constant];
    if (v22 == v29)
    {
      [a1[42] constant];
      BOOL v27 = a6 != v30;
    }
    else
    {
      BOOL v27 = 1;
    }
  }
  return v27;
}

- (double)effectiveTargetDisplayWidth
{
  if (!a1) {
    return 0.0;
  }
  if ((*(unsigned char *)(a1 + 328) & 2) == 0)
  {
    *(unsigned char *)(a1 + 328) |= 2u;
    double v2 = [(id)a1 statusBar];
    double v3 = [v2 _effectiveTargetScreen];

    [v3 _unjailedReferenceBounds];
    double Width = CGRectGetWidth(v9);
    [v3 _nativeScale];
    double v6 = Width * v5;
    [v3 _scale];
    *(double *)(a1 + 288) = v6 / v7;
  }
  return *(double *)(a1 + 288);
}

- (double)leadingItemSpacing
{
  return 2.66666667;
}

- (double)itemSpacing
{
  return 7.33333333;
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

- (double)bottomLeadingTopOffset
{
  return 3.0;
}

- (uint64_t)_updateSystemUpdateRegionEnablement:(uint64_t)a3 forTrailingNumberOfItems:
{
  id v5 = a2;
  double v6 = v5;
  if (a1)
  {
    if (a3 < 2) {
      uint64_t v7 = [v5 disableWithToken:13];
    }
    else {
      uint64_t v7 = [v5 enableWithToken:13];
    }
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_calculateSquishyLayoutValuesForCutoutOffset:(uint64_t)a1 cutoutWidth:(uint64_t *)a2 maxLeadingItems:(uint64_t *)a3 maxTrailingItems:(void *)a4 leadingScale:(void *)a5 trailingScale:(double)a6 includingPrivacyIndicator:(double)a7
{
  if (a1)
  {
    -[STUIStatusBarVisualProvider_DynamicSplit edgeInsets](a1);
    double v15 = v14;
    double v17 = v16;
    double v18 = -[STUIStatusBarVisualProvider_DynamicSplit effectiveTargetDisplayWidth](a1);
    double v19 = a7 * 0.5;
    double v20 = fmax(v18 - a6 - a7 * 0.5 - v15 + -8.0, 0.0);
    double v21 = a6 - v19 - v17 + -8.0;
    if (a2)
    {
      double v22 = -[STUIStatusBarVisualProvider_DynamicSplit leadingItemCutoffWidths]();
      uint64_t v23 = numberOfItemsForWidth(v22, v20);

      *a2 = v23;
    }
    double v24 = fmax(v21, 0.0);
    if (a3)
    {
      double v25 = -[STUIStatusBarVisualProvider_DynamicSplit trailingItemCutoffWidths]();
      uint64_t v26 = numberOfItemsForWidth(v25, v24);

      *a3 = v26;
    }
    if (a4)
    {
      BOOL v27 = -[STUIStatusBarVisualProvider_DynamicSplit leadingItemCutoffWidths]();
      scaleForWidth(v27);
      uint64_t v29 = v28;

      *a4 = v29;
    }
    if (a5)
    {
      double v30 = -[STUIStatusBarVisualProvider_DynamicSplit trailingItemCutoffWidths]();
      scaleForWidth(v30);
      uint64_t v32 = v31;

      *a5 = v32;
    }
  }
}

- (void)updateDisplayItem:(id)a3 toScale:(double)a4
{
  id v6 = a3;
  if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled]
    && self->_currentAnimationSettings
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = self->_currentAnimationSettings;
    [(BSAnimationSettings *)v7 damping];
    if (v8 >= 0.7)
    {
      CGAffineTransformMakeScale(&v24, a4, a4);
      CGAffineTransform v23 = v24;
      [v6 setDynamicScaleTransform:&v23];
    }
    else
    {
      CGRect v9 = (void *)MEMORY[0x1E4F4F840];
      [(BSAnimationSettings *)v7 mass];
      double v11 = v10;
      [(BSAnimationSettings *)v7 stiffness];
      double v13 = v12;
      [(BSAnimationSettings *)v7 epsilon];
      double v15 = v14;
      [(BSAnimationSettings *)v7 initialVelocity];
      uint64_t v17 = [v9 settingsWithMass:v11 stiffness:v13 damping:0.7 epsilon:v15 initialVelocity:v16];

      double v18 = (void *)MEMORY[0x1E4F4F680];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __70__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke;
      v25[3] = &unk_1E6AA3F80;
      id v26 = v6;
      double v27 = a4;
      [v18 tryAnimatingWithSettings:v17 fromCurrentState:1 actions:v25 completion:0];

      uint64_t v7 = (BSAnimationSettings *)v17;
    }
  }
  else
  {
    double v19 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toScale___block_invoke_2;
    v20[3] = &unk_1E6AA3F30;
    double v21 = (BSAnimationSettings *)v6;
    double v22 = a4;
    [v19 animateWithDuration:4 delay:v20 options:0 animations:0.25 completion:0.0];
    uint64_t v7 = v21;
  }
}

- (id)trailingItemCutoffWidths
{
  if (qword_1EC05F058 != -1) {
    dispatch_once(&qword_1EC05F058, &__block_literal_global_71);
  }
  v0 = (void *)qword_1EC05F060;
  return v0;
}

- (id)leadingItemCutoffWidths
{
  if (qword_1EC05F048 != -1) {
    dispatch_once(&qword_1EC05F048, &__block_literal_global_3);
  }
  v0 = (void *)qword_1EC05F050;
  return v0;
}

- (id)region:(id)a3 willSetDisplayItems:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 identifier];
  if ([v7 isEqual:@"trailing"])
  {
  }
  else
  {
    double v8 = [v5 identifier];
    int v9 = [v8 isEqual:@"leading"];

    if (!v9) {
      goto LABEL_14;
    }
  }
  id v26 = v5;
  id v27 = v6;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    uint64_t v14 = *MEMORY[0x1E4F3A0D0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        double v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "view", v26, v27, (void)v28);
        double v18 = [v17 layer];
        double v19 = [v18 filters];
        uint64_t v20 = [v19 count];

        if (!v20)
        {
          double v21 = [MEMORY[0x1E4F39BC0] filterWithType:v14];
          [v21 setValue:&unk_1F2F9CC70 forKey:@"inputRadius"];
          [v21 setName:@"gaussianBlur"];
          uint64_t v32 = v21;
          double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
          CGAffineTransform v23 = [v16 view];
          CGAffineTransform v24 = [v23 layer];
          [v24 setFilters:v22];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v12);
  }

  id v5 = v26;
  id v6 = v27;
LABEL_14:

  return v6;
}

- (void)avoidanceFrameUpdatedFromFrame:(CGRect)a3 withAnimationSettings:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a4;
  double v8 = _avoidanceFrameInLocalCoordinateSpace(self);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v15 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v15 avoidanceFrame];
  -[STUIStatusBarVisualProvider_Split _updateExpandedConstraintsForAvoidanceFrame:](self, "_updateExpandedConstraintsForAvoidanceFrame:");
  double v61 = 0.0;
  v62[0] = 0.0;
  BOOL v16 = -[STUIStatusBarVisualProvider_DynamicSplit _needsUpdateOfConstraintsForAvoidanceFrame:cutoutOffset:cutoutWidth:]((id *)&self->super.super.super.super.isa, v62, &v61, v8, v10, v12, v14);
  uint64_t v17 = [v15 currentAggregatedData];
  unsigned int v18 = -[STUIStatusBarVisualProvider_DynamicSplit _updateSystemNavigationWithData:avoidanceFrame:]((id *)&self->super.super.super.super.isa, v17, v8, v10, v12, v14);

  if (v16)
  {
    if (!self)
    {
      int v19 = 1;
      goto LABEL_7;
    }
  }
  else
  {
    if (!self) {
      goto LABEL_38;
    }
    if (!self->_forceAvoidanceRectUpdate)
    {
      if (!v18) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  int v19 = 0;
  self->_forceAvoidanceRectUpdate = 0;
LABEL_7:
  if (v7 || (v5 & 2) != 0) {
    id v20 = v7;
  }
  currentAnimationSettings = self->_currentAnimationSettings;
  self->_currentAnimationSettings = (BSAnimationSettings *)v7;

  double v22 = &OBJC_IVAR___STUIStatusBarSensorActivityView__sensorActivityView;
  if (v5)
  {
    if (v19)
    {
      v38 = 0;
      double v37 = v62[0];
      goto LABEL_20;
    }
    self->_forceAvoidanceRectUpdate = 1;
    double v37 = v62[0];
  }
  else
  {
    char v52 = v5;
    double v59 = 0.0;
    double v60 = 0.0;
    uint64_t v58 = 0;
    uint64_t v57 = 0;
    double v24 = v61;
    double v23 = v62[0];
    double v25 = [v15 currentAggregatedData];
    id v26 = [v25 sensorActivityEntry];
    [v26 isEnabled];
    -[STUIStatusBarVisualProvider_DynamicSplit _calculateSquishyLayoutValuesForCutoutOffset:cutoutWidth:maxLeadingItems:maxTrailingItems:leadingScale:trailingScale:includingPrivacyIndicator:]((uint64_t)self, &v58, &v57, &v60, &v59, v23, v24);

    id v27 = [v15 regionWithIdentifier:@"leading"];
    long long v28 = [v27 layout];
    double v48 = [v28 horizontalLayout];
    if (_updateSquishyRegionForDynamicValues(v48, v58, v60))
    {
      objc_msgSend(v27, "setNeedsReLayout:", 1, v48);
      [v28 invalidate];
    }
    v50 = v28;
    double v51 = v27;
    unsigned int v29 = v18;
    id v53 = v7;
    long long v30 = objc_msgSend(v15, "regionWithIdentifier:", @"trailing", v48);
    long long v31 = [v30 layout];
    uint64_t v32 = [v31 horizontalLayout];
    if (_updateSquishyRegionForDynamicValues(v32, v57, v59))
    {
      [v30 setNeedsReLayout:1];
      [v31 invalidate];
    }
    CGRect v33 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    uint64_t v34 = [v33 regions];
    v35 = [v34 objectForKeyedSubscript:@"systemUpdates"];

    int v36 = -[STUIStatusBarVisualProvider_DynamicSplit _updateSystemUpdateRegionEnablement:forTrailingNumberOfItems:]((uint64_t)self, v35, v57) | v29;
    double v37 = v62[0];
    if (v19)
    {
      v38 = 0;
      char v5 = v52;
      id v7 = v53;
      LOBYTE(v18) = v36;
      double v22 = &OBJC_IVAR___STUIStatusBarSensorActivityView__sensorActivityView;
      goto LABEL_20;
    }
    char v5 = v52;
    id v7 = v53;
    LOBYTE(v18) = v36;
    double v22 = &OBJC_IVAR___STUIStatusBarSensorActivityView__sensorActivityView;
  }
  v38 = *(Class *)((char *)&self->super.super.super.super.isa + v22[16]);
LABEL_20:
  [v38 constant];
  if (v37 != v39)
  {
    if (v19) {
      double v40 = 0;
    }
    else {
      double v40 = *(Class *)((char *)&self->super.super.super.super.isa + v22[16]);
    }
    [v40 setConstant:v62[0]];
  }
  double v41 = v61;
  if (v19) {
    cutoutWidthConstraint = 0;
  }
  else {
    cutoutWidthConstraint = self->_cutoutWidthConstraint;
  }
  [(NSLayoutConstraint *)cutoutWidthConstraint constant];
  if (v41 != v43)
  {
    if (v19) {
      CGRect v44 = 0;
    }
    else {
      CGRect v44 = self->_cutoutWidthConstraint;
    }
    [(NSLayoutConstraint *)v44 setConstant:v61];
  }
  if ((v5 & 2) != 0)
  {
    CGRect v45 = [(STUIStatusBarVisualProvider_Split *)self cutoutLayoutGuide];
    v46 = [v45 owningView];
    [v46 layoutSubviews];
  }
  else if (v7)
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke;
    v56[3] = &unk_1E6AA3FA8;
    v56[4] = self;
    [MEMORY[0x1E4F4F680] tryAnimatingWithSettings:v7 fromCurrentState:1 actions:v56 completion:0];
  }
  else
  {
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_2;
    v55[3] = &unk_1E6AA37A0;
    v55[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v55];
  }
  v47 = self->_currentAnimationSettings;
  self->_currentAnimationSettings = 0;

LABEL_38:
  if (v18)
  {
LABEL_39:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__STUIStatusBarVisualProvider_DynamicSplit_avoidanceFrameUpdatedFromFrame_withAnimationSettings_options___block_invoke_3;
    block[3] = &unk_1E6AA37A0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_40:
}

- (id)_orderedDisplayItemPlacements
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  double v2 = [(STUIStatusBarVisualProvider_Split *)&v8 _orderedDisplayItemPlacements];
  double v3 = [v2 objectForKeyedSubscript:@"trailing"];
  double v4 = +[STUIStatusBarItem defaultDisplayIdentifier];
  char v5 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v4 priority:1310];
  id v6 = [v3 arrayByAddingObject:v5];
  [v2 setObject:v6 forKeyedSubscript:@"trailing"];

  return v2;
}

- (void)dataUpdated:(id)a3
{
  id v4 = a3;
  double v5 = _avoidanceFrameInLocalCoordinateSpace(self);
  unsigned __int8 v9 = -[STUIStatusBarVisualProvider_DynamicSplit _updateSystemNavigationWithData:avoidanceFrame:]((id *)&self->super.super.super.super.isa, v4, v5, v6, v7, v8);
  BOOL v10 = [(STUIStatusBarVisualProvider_Split *)self _updateLowerRegionsWithData:v4];

  if ((v9 & 1) != 0 || v10)
  {
    id v11 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v11 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  unsigned __int8 v8 = [(STUIStatusBarVisualProvider_Split *)&v21 hasCustomAnimationForDisplayItemWithIdentifier:v6 removal:0];
  unsigned __int8 v9 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  BOOL v10 = [v9 displayItemWithIdentifier:v6];
  char v11 = [v10 dynamicallyHidden];

  if (v11)
  {
    CGFloat v12 = 0;
  }
  else
  {
    if (v8) {
      goto LABEL_6;
    }
    double v13 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    CGFloat v14 = [(STUIStatusBarVisualProvider_Split *)self regionIdentifiersForPartWithIdentifier:@"normalPartIdentifier"];
    double v15 = [v14 allObjects];
    BOOL v16 = [v13 displayItemIdentifiersInRegionsWithIdentifiers:v15];
    int v17 = [v16 containsObject:v6];

    if (!v17)
    {
LABEL_6:
      v20.receiver = self;
      v20.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
      uint64_t v18 = [(STUIStatusBarVisualProvider_Split *)&v20 additionAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
    }
    else
    {
      uint64_t v18 = STUIStatusBarDynamicSplitDefaultAnimation(self, v6);
    }
    CGFloat v12 = (void *)v18;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_leadingCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_cutoutCenterConstraint, 0);
  objc_storeStrong((id *)&self->_cutoutWidthConstraint, 0);
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v5 = a3;
  [v5 _unjailedReferenceBounds];
  double Width = CGRectGetWidth(v14);
  [v5 _nativeScale];
  double v8 = Width * v7;
  [v5 _scale];
  double v10 = v9;

  if (v8 / v10 <= 402.0)
  {
    objc_opt_class();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = a1;
  }
  return (Class)v11;
}

+ (double)baseFontSize
{
  return 16.0;
}

+ (double)expandedFontSize
{
  [a1 baseFontSize];
  return v2 + 1.0;
}

- (double)expandedIconScale
{
  return 1.2992;
}

- (void)updateDisplayItem:(id)a3 toDynamicallyHidden:(BOOL)a4 scale:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 visible])
  {
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled]
      && self->_currentAnimationSettings
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v9 = self->_currentAnimationSettings;
      [(BSAnimationSettings *)v9 damping];
      double v11 = v10;
      if (v10 < 0.7)
      {
        CGFloat v12 = (void *)MEMORY[0x1E4F4F840];
        [(BSAnimationSettings *)v9 mass];
        double v14 = v13;
        [(BSAnimationSettings *)v9 stiffness];
        double v16 = v15;
        [(BSAnimationSettings *)v9 epsilon];
        double v18 = v17;
        [(BSAnimationSettings *)v9 initialVelocity];
        uint64_t v20 = [v12 settingsWithMass:v14 stiffness:v16 damping:0.7 epsilon:v18 initialVelocity:v19];

        double v9 = (BSAnimationSettings *)v20;
      }
      [(BSAnimationSettings *)v9 mass];
      [(BSAnimationSettings *)v9 stiffness];
      [(BSAnimationSettings *)v9 damping];
      [(BSAnimationSettings *)v9 initialVelocity];
      _StatusBar_UIGetDurationOfSpringAnimation();
      uint64_t v22 = v21;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke;
      aBlock[3] = &unk_1E6AA3F58;
      BOOL v41 = v6;
      id v38 = v8;
      uint64_t v39 = v22;
      double v40 = a5;
      double v23 = _Block_copy(aBlock);
      double v24 = v23;
      if (v11 >= 0.7) {
        (*((void (**)(void *, uint64_t))v23 + 2))(v23, 1);
      }
      else {
        [MEMORY[0x1E4F4F680] tryAnimatingWithSettings:v9 fromCurrentState:1 actions:v23 completion:0];
      }
    }
    else
    {
      double v26 = 0.25;
      if (!v6) {
        double v26 = 0.5;
      }
      STUIStatusBarDynamicSplitPerformBaseAnimation(v8, v6, 1, 1, 0, 0.5, v26, 0.0);
      if (!v6)
      {
        id v27 = (void *)MEMORY[0x1E4FB1EB0];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __88__STUIStatusBarVisualProvider_DynamicSplit_updateDisplayItem_toDynamicallyHidden_scale___block_invoke_95;
        v34[3] = &unk_1E6AA3F30;
        id v35 = v8;
        double v36 = a5;
        [v27 animateWithDuration:4 delay:v34 options:0 animations:0.25 completion:0.0];
      }
    }
  }
  else
  {
    if (v6)
    {
      [v8 setDynamicHidingAlpha:0.0];
      CGAffineTransformMakeScale(&v33, 0.5, 0.5);
      CGAffineTransform v32 = v33;
      double v25 = &v32;
    }
    else
    {
      [v8 setDynamicHidingAlpha:1.0];
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v31[0] = *MEMORY[0x1E4F1DAB8];
      v31[1] = v28;
      v31[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v25 = (CGAffineTransform *)v31;
    }
    [v8 setDynamicHidingTransform:v25];
    CGAffineTransformMakeScale(&v30, a5, a5);
    CGAffineTransform v29 = v30;
    [v8 setDynamicScaleTransform:&v29];
  }
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  unsigned __int8 v8 = [(STUIStatusBarVisualProvider_Split *)&v21 hasCustomAnimationForDisplayItemWithIdentifier:v6 removal:1];
  double v9 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  double v10 = [v9 displayItemWithIdentifier:v6];
  char v11 = [v10 dynamicallyHidden];

  if (v11)
  {
    CGFloat v12 = 0;
  }
  else
  {
    if (v8) {
      goto LABEL_6;
    }
    double v13 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    double v14 = [(STUIStatusBarVisualProvider_Split *)self regionIdentifiersForPartWithIdentifier:@"normalPartIdentifier"];
    double v15 = [v14 allObjects];
    double v16 = [v13 displayItemIdentifiersInRegionsWithIdentifiers:v15];
    int v17 = [v16 containsObject:v6];

    if (!v17)
    {
LABEL_6:
      v20.receiver = self;
      v20.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
      uint64_t v18 = [(STUIStatusBarVisualProvider_Split *)&v20 removalAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
    }
    else
    {
      uint64_t v18 = STUIStatusBarDynamicSplitDefaultAnimation(self, v6);
    }
    CGFloat v12 = (void *)v18;
  }

  return v12;
}

- (void)_updateRingerDisplayItem:(int)a3 enabled:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = v5;
    if (a3) {
      [v5 enableWithToken:15];
    }
    else {
      [v5 disableWithToken:15];
    }
    id v5 = v6;
  }
}

- (void)orientationUpdatedFromOrientation:(int64_t)a3
{
  id v4 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  [v4 avoidanceFrame];
  -[STUIStatusBarVisualProvider_Split _updateExpandedConstraintsForAvoidanceFrame:](self, "_updateExpandedConstraintsForAvoidanceFrame:");

  id v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
  id v6 = [v5 currentAggregatedData];
  BOOL v7 = [(STUIStatusBarVisualProvider_Split *)self _updateLowerRegionsWithData:v6];

  if (v7)
  {
    id v8 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    [v8 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)setOnLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[STUIStatusBarSettingsDomain rootSettings];
  id v6 = [v5 itemSettings];
  if ([v6 showRingerOffLockScreen]) {
    goto LABEL_4;
  }
  BOOL v7 = [(STUIStatusBarVisualProvider_iOS *)self onLockScreen];

  if (v7 != v3)
  {
    id v5 = [(STUIStatusBarVisualProvider_iOS *)self statusBar];
    id v6 = +[STUIStatusBarItem defaultDisplayIdentifier];
    id v8 = [v5 displayItemWithIdentifier:v6];
    -[STUIStatusBarVisualProvider_DynamicSplit _updateRingerDisplayItem:enabled:]((uint64_t)self, v8, v3);

LABEL_4:
  }
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
  [(STUIStatusBarVisualProvider_iOS *)&v9 setOnLockScreen:v3];
}

- (void)setOnAODLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([(STUIStatusBarVisualProvider_iOS *)self onAODLockScreen] != a3)
  {
    BOOL v27 = v3;
    id v5 = [MEMORY[0x1E4F1CA80] set];
    id v6 = [(STUIStatusBarVisualProvider_Split *)v4 regionIdentifiersForPartWithIdentifier:@"normalPartIdentifier"];
    BOOL v7 = [(STUIStatusBarVisualProvider_DynamicSplit *)v4 displayItemIdentifiersForPartWithIdentifier:@"aodPartIdentifier"];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v29 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(obj);
          }
          char v11 = v4;
          CGFloat v12 = [(STUIStatusBarVisualProvider_Split *)v4 orderedDisplayItemPlacementsInRegionWithIdentifier:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v36 != v15) {
                  objc_enumerationMutation(v12);
                }
                int v17 = [*(id *)(*((void *)&v35 + 1) + 8 * j) identifier];
                if (([v7 containsObject:v17] & 1) == 0) {
                  [v5 addObject:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v14);
          }

          id v4 = v11;
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v9);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v5;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
    objc_super v20 = v18;
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * k);
          double v25 = [(STUIStatusBarVisualProvider_iOS *)v4 statusBar];
          double v26 = [v25 displayItemWithIdentifier:v24];

          if (v27) {
            [v26 disableWithToken:14];
          }
          else {
            [v26 enableWithToken:14];
          }
        }
        uint64_t v21 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v21);

      objc_super v20 = [(STUIStatusBarVisualProvider_iOS *)v4 statusBar];
      [v20 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
    }

    v30.receiver = v4;
    v30.super_class = (Class)STUIStatusBarVisualProvider_DynamicSplit;
    [(STUIStatusBarVisualProvider_iOS *)&v30 setOnAODLockScreen:v27];
  }
}

@end