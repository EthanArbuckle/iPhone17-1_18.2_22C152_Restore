@interface SBDisplayItemLayoutAttributesCalculator
- (BOOL)_appLayoutContainsOnlyResizableApps:(id)a3;
- (CGRect)_containerBoundsForWindowScene:(id)a3 containerOrientation:(int64_t)a4;
- (CGRect)_frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 isChamoisWindowingUIEnabled:(BOOL)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 skipAutoLayout:(BOOL)a13;
- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4 bounds:(CGRect)a5;
- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4 windowScene:(id)a5;
- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4 bounds:(CGRect)a5;
- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4 windowScene:(id)a5;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 isChamoisWindowingUIEnabled:(BOOL)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerOrientation:(int64_t)a5 windowScene:(id)a6;
- (id)_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 bounds:(CGRect)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 source:(int64_t)a13;
- (id)_applicationForDisplayItem:(id)a3;
- (id)_autoLayoutController;
- (id)_centerWindowSheetMetricsCache;
- (id)_chamoisLayoutGridCache;
- (id)_chamoisSettingsCache;
- (id)_deviceApplicationSceneHandleForDisplayItem:(id)a3;
- (id)appLayoutByPerformingAutoLayoutForAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 bounds:(CGRect)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 source:(int64_t)a13;
- (id)appLayoutByPerformingAutoLayoutForAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 windowScene:(id)a7 source:(int64_t)a8;
- (id)autoLayoutSpaceForAppLayout:(id)a3 containerOrientation:(int64_t)a4 chamoisLayoutAttributes:(id)a5 floatingDockHeight:(double)a6 screenScale:(double)a7 bounds:(CGRect)a8 prefersStripHidden:(BOOL)a9 prefersDockHidden:(BOOL)a10;
- (id)layoutRestrictionInfoForItem:(id)a3;
- (int64_t)sizingPolicyForDisplayItem:(id)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 proposedSizingPolicy:(int64_t)a6 windowScene:(id)a7;
@end

@implementation SBDisplayItemLayoutAttributesCalculator

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerOrientation:(int64_t)a5 windowScene:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  [(SBDisplayItemLayoutAttributesCalculator *)self _containerBoundsForWindowScene:v11 containerOrientation:a5];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  int64_t v51 = a3;
  v52 = v10;
  if (SBLayoutRoleIsValidForSplitView(a3)) {
    uint64_t v20 = [(SBDisplayItemLayoutAttributesCalculator *)self _appLayoutContainsOnlyResizableApps:v10] ^ 1;
  }
  else {
    uint64_t v20 = 0;
  }
  v21 = [(SBDisplayItemLayoutAttributesCalculator *)self _chamoisSettingsCache];
  v22 = [v11 floatingDockController];
  objc_msgSend(v22, "floatingDockHeightForFrame:", v13, v15, v17, v19);
  double v24 = v23;

  v25 = [v21 layoutAttributesForWindowScene:v11 interfaceOrientation:a5 requiresFullScreen:v20 floatingDockHeight:v24];
  v26 = [v11 switcherController];
  v27 = [v26 contentViewController];
  uint64_t v28 = objc_opt_class();
  id v29 = v27;
  if (v28)
  {
    if (objc_opt_isKindOfClass()) {
      v30 = v29;
    }
    else {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }
  id v31 = v30;

  v32 = [v11 screen];
  [v32 scale];
  double v34 = v33;

  uint64_t v35 = [v26 isChamoisWindowingUIEnabled];
  uint64_t v36 = [v31 prefersStripHidden];
  char v37 = [v31 prefersDockHidden];

  LOBYTE(v50) = v37;
  -[SBDisplayItemLayoutAttributesCalculator frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:](self, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v51, v52, a5, v25, v35, v36, v13, v15, v17, v19, v24, v34, v50);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  double v46 = v39;
  double v47 = v41;
  double v48 = v43;
  double v49 = v45;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 isChamoisWindowingUIEnabled:(BOOL)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12
{
  LOWORD(v16) = a12;
  -[SBDisplayItemLayoutAttributesCalculator _frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:](self, "_frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:", a3, a4, a6, a7, a10, a11, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a8, a9, v16);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 isChamoisWindowingUIEnabled:(BOOL)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 skipAutoLayout:(BOOL)a13
{
  BOOL v13 = a11;
  BOOL v14 = a10;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v25 = a4;
  id v26 = a7;
  if (a12) {
    double v27 = 0.0;
  }
  else {
    double v27 = a8;
  }
  if (!v14 || a13)
  {
    id v28 = v25;
  }
  else
  {
    LOBYTE(v168) = a12;
    -[SBDisplayItemLayoutAttributesCalculator _appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:](self, "_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", v25, 0, 0, a6, v26, v13, v27, a9, x, y, width, height, v168, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v29 = v28;
  if (a3 != 4 && [v28 environment] != 3)
  {
    if (a3 == 3 || [v29 environment] == 2)
    {
      -[SBDisplayItemLayoutAttributesCalculator frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:bounds:](self, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:bounds:", a6, 2, x, y, width, height);
      goto LABEL_112;
    }
    double v180 = *MEMORY[0x1E4F1DB30];
    double v177 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    UIRectGetCenter();
    if (!v14)
    {
      SBLayoutDefaultSideLayoutElementWidth();
      SBLayoutDefaultSideLayoutElementWidth();
      uint64_t v36 = (id *)MEMORY[0x1E4F43630];
      [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      uint64_t v37 = [v29 configuration];
      if (v37 != 3 || (unint64_t)(a6 - 1) >= 2) {
        uint64_t v39 = v37;
      }
      else {
        uint64_t v39 = 4;
      }
      BOOL v40 = [*v36 userInterfaceLayoutDirection] == 1;
      if (v40 && v39 == 2) {
        uint64_t v41 = 4;
      }
      else {
        uint64_t v41 = v39;
      }
      if (v40 && v39 == 4) {
        uint64_t v42 = 2;
      }
      else {
        uint64_t v42 = v41;
      }
      switch(v42)
      {
        case 0:
        case 1:
          UIRectGetCenter();
          break;
        default:
          goto LABEL_111;
      }
      goto LABEL_111;
    }
    if (([v26 prefersDockHidden] & 1) != 0 || objc_msgSend(v26, "isAdditiveModelEnabled"))
    {
      UIRectGetCenter();
      double v187 = v34;
      double v174 = v35;
    }
    else
    {
      double v187 = x + width * 0.5;
      double v174 = (height - a8) * 0.5;
    }
    double v43 = [v29 cachedLastAutoLayoutSpace];
    double v44 = [v29 itemForLayoutRole:a3];
    v171 = v43;
    v176 = [v43 autoLayoutItemForDisplayItemIfExists:v44];

    double v45 = [v29 layoutAttributesForItemInRole:a3];
    double v46 = [v29 itemForLayoutRole:a3];
    double v47 = [(SBDisplayItemLayoutAttributesCalculator *)self layoutRestrictionInfoForItem:v46];

    v173 = v47;
    uint64_t v172 = [v47 layoutRestrictions];
    if (a13)
    {
      [v26 defaultWindowSize];
      double v49 = v48;
      double v183 = v50;
      [v26 screenEdgePadding];
      objc_msgSend(v45, "sizeInBounds:defaultSize:screenEdgePadding:", x, y, width, height, v49, v183, v51);
      double v53 = v52;
      double v184 = v54;
      v55 = v45;
      v56 = v173;
    }
    else
    {
      v55 = v45;
      double v57 = v177;
      double v53 = v180;
      if (v176)
      {
        [v176 size];
        double v53 = v58;
      }
      double v184 = v57;
      v56 = v173;
      if ((BSFloatLessThanOrEqualToFloat() & 1) != 0 || BSFloatLessThanOrEqualToFloat())
      {
        [v26 defaultWindowSize];
        double v60 = v59;
        double v185 = v61;
        [v26 screenEdgePadding];
        objc_msgSend(v55, "sizeInBounds:defaultSize:screenEdgePadding:", x, y, width, height, v60, v185, v62);
        double v53 = v63;
        double v184 = v64;
      }
      if (v176)
      {
        double v179 = v53;
        [v176 position];
        goto LABEL_43;
      }
    }
    double v179 = v53;
    objc_msgSend(v55, "centerInBounds:", x, y, width, height);
LABEL_43:
    BOOL v67 = v65 == 0.0;
    BOOL v68 = v66 == 0.0;
    if (v67 && v68) {
      double v69 = v174;
    }
    else {
      double v69 = v66;
    }
    if (v67 && v68) {
      double v65 = v187;
    }
    double v175 = v65;
    if ([v55 sizingPolicy] == 1)
    {
      v70 = [v29 itemForLayoutRole:a3];
      v71 = [(SBDisplayItemLayoutAttributesCalculator *)self layoutRestrictionInfoForItem:v70];

      [v26 screenEdgePadding];
      CGFloat v73 = v72;
      v189.origin.double x = x;
      v189.origin.double y = y;
      v189.size.double width = width;
      v189.size.double height = height;
      CGRect v190 = CGRectInset(v189, v73, v73);
      double v74 = CGRectGetHeight(v190);
      if (v184 <= v74) {
        double v75 = v184;
      }
      else {
        double v75 = v74;
      }
      v76 = [(SBDisplayItemLayoutAttributesCalculator *)self _chamoisLayoutGridCache];
      v77 = [v29 allItems];
      objc_msgSend(v76, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v77, "count"), objc_msgSend(v55, "contentOrientation"), v71, v26, v179, v75, x, y, width, height, a9);
      double v79 = v78;
      double v81 = v80;

      goto LABEL_82;
    }
    if ([v26 requiresFullScreen])
    {
      if ([v55 sizingPolicy] == 2)
      {
        UIRectGetCenter();
        double v184 = height;
        double v179 = width;
      }
      else
      {
        [v26 defaultWindowSize];
        double v179 = v86;
        double v184 = v87;
      }
      goto LABEL_66;
    }
    if (v179 != v180 || v184 != v177)
    {
LABEL_66:
      v94 = [(SBDisplayItemLayoutAttributesCalculator *)self _chamoisLayoutGridCache];
      objc_msgSend(v94, "minGridSizeForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v55, "contentOrientation"), v56, v26, x, y, width, height, a9);
      double v178 = v95;
      double v182 = v96;

      v97 = [v29 allItems];
      if (unint64_t)[v97 count] > 1 || (BSFloatLessThanFloat())
      {
      }
      else
      {
        char v158 = BSFloatLessThanFloat();

        double v117 = width;
        double v118 = height;
        if ((v158 & 1) == 0)
        {
LABEL_72:
          double v119 = v179;
          if (v178 >= v179) {
            double v119 = v178;
          }
          if (v117 <= v119) {
            double v79 = v117;
          }
          else {
            double v79 = v119;
          }
          double v120 = v184;
          if (v182 >= v184) {
            double v120 = v182;
          }
          if (v118 <= v120) {
            double v81 = v118;
          }
          else {
            double v81 = v120;
          }
LABEL_82:
          if (v172)
          {
            v121 = [(SBDisplayItemLayoutAttributesCalculator *)self _chamoisLayoutGridCache];
            v122 = [v29 allItems];
            objc_msgSend(v121, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v122, "count"), objc_msgSend(v55, "contentOrientation"), v56, v26, v79, v81, x, y, width, height, a9);
            double v124 = v123;
            double v126 = v125;

            v127 = [v29 allItems];
            if ((unint64_t)[v127 count] < 2)
            {
              v128 = v176;
              v129 = v171;
            }
            else
            {

              if (v124 < width && v126 < height)
              {
                v128 = v176;
LABEL_88:
                v129 = v171;
LABEL_110:

LABEL_111:
                SBRectWithSize();
                UIRectCenteredAboutPointScale();
                goto LABEL_112;
              }
              v130 = [(SBDisplayItemLayoutAttributesCalculator *)self _chamoisLayoutGridCache];
              v127 = objc_msgSend(v130, "allGridWidthsForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v55, "contentOrientation"), v56, v26, x, y, width, height, a9);

              v131 = [(SBDisplayItemLayoutAttributesCalculator *)self _chamoisLayoutGridCache];
              v132 = objc_msgSend(v131, "allGridHeightsForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v55, "contentOrientation"), v56, v26, x, y, width, height, a9);

              unint64_t v133 = [v127 count];
              unint64_t v134 = [v132 count];
              if (v133 >= v134) {
                uint64_t v135 = v134;
              }
              else {
                uint64_t v135 = v133;
              }
              if (v135 >= 2)
              {
                uint64_t v136 = 0;
                uint64_t v137 = v135 - 1;
                double v138 = 1.79769313e308;
                double v139 = v124 / v126;
                do
                {
                  v140 = [v127 objectAtIndex:v136];
                  [v140 doubleValue];
                  double v142 = v141;

                  v143 = [v132 objectAtIndex:v136];
                  [v143 doubleValue];
                  double v145 = v144;

                  BOOL v146 = v142 / v145 < 1.0 && v139 < 1.0;
                  if (v142 / v145 >= 1.0 && v139 >= 1.0 || v146)
                  {
                    double v149 = vabdd_f64(v142, v124) + vabdd_f64(v145, v126);
                    if (v149 < v138)
                    {
                      double v124 = v142;
                      double v126 = v145;
                      double v138 = v149;
                    }
                  }
                  ++v136;
                }
                while (v137 != v136);
              }

              v129 = v171;
              v128 = v176;
              v56 = v173;
            }

            goto LABEL_110;
          }
          v128 = v176;
          goto LABEL_88;
        }
      }
      v98 = [(SBDisplayItemLayoutAttributesCalculator *)self _autoLayoutController];
      v99 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:]([SBContinuousExposeAutoLayoutConfiguration alloc], "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v26, x, y, width, height, a9, a8);
      v100 = [v98 validTopStageAreaInsetsWithConfiguration:v99];
      v101 = [v100 lastObject];
      [v101 doubleValue];
      double v170 = v102;

      v103 = [v98 validBottomStageAreaInsetsWithConfiguration:v99];
      v104 = [v103 lastObject];
      [v104 doubleValue];
      double v169 = v105;

      v106 = [v98 validLeadingStageAreaInsetsWithConfiguration:v99];
      v107 = [v106 lastObject];
      [v107 doubleValue];
      double v109 = v108;

      v110 = [v98 validTrailingStageAreaInsetsWithConfiguration:v99];
      v111 = [v110 lastObject];
      [v111 doubleValue];
      double v113 = v112;

      v114 = [v29 allItems];
      double v115 = 0.0;
      if ((unint64_t)[v114 count] >= 2)
      {
        [v26 stageOcclusionDodgingPeekLength];
        double v115 = v116;
      }

      double v117 = width - (v109 + v113 + v115);
      double v118 = height - (v170 + v169);

      goto LABEL_72;
    }
    v82 = objc_msgSend(v29, "itemForLayoutRole:", a3, v177, v184);
    v83 = [(SBDisplayItemLayoutAttributesCalculator *)self _deviceApplicationSceneHandleForDisplayItem:v82];

    v181 = v83;
    if (!v83 || ![v83 supportsCenterWindow] || objc_msgSend(v55, "sizingPolicy"))
    {
      if ([v55 sizingPolicy] == 2)
      {
        UIRectGetCenter();
        double v84 = height;
        double v85 = width;
      }
      else
      {
        [v26 defaultWindowSize];
        double v85 = v88;
        double v84 = v89;
      }
      goto LABEL_65;
    }
    double v188 = v69;
    [v26 screenEdgePadding];
    SBRectWithSize();
    -[SBDisplayItemLayoutAttributesCalculator frameForCenterItemWithConfiguration:interfaceOrientation:bounds:](self, "frameForCenterItemWithConfiguration:interfaceOrientation:bounds:", 1, a6);
    double v85 = v159;
    double v84 = v160;
    if (v175 != *MEMORY[0x1E4F1DAD8] || v188 != *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
      goto LABEL_65;
    }
    v186 = [v29 zOrderedItems];
    uint64_t v161 = [v186 firstObject];
    if (v161)
    {
      v162 = (void *)v161;
      v163 = [v29 itemForLayoutRole:a3];
      if ([v163 isEqual:v162])
      {
        v164 = v186;
        unint64_t v165 = [v186 count];

        if (v165 >= 2)
        {
          uint64_t v166 = [v186 objectAtIndex:1];

          v162 = (void *)v166;
          if (!v166) {
            goto LABEL_125;
          }
        }
      }
      else
      {

        v164 = v186;
      }
      v167 = [v29 layoutAttributesForItem:v162];
      objc_msgSend(v167, "centerInBounds:", x, y, width, height);
    }
    else
    {
      v164 = v186;
    }
LABEL_125:

LABEL_65:
    v90 = [(SBDisplayItemLayoutAttributesCalculator *)self _chamoisLayoutGridCache];
    v91 = [v29 allItems];
    objc_msgSend(v90, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v91, "count"), objc_msgSend(v55, "contentOrientation"), v56, v26, v85, v84, x, y, width, height, a9);
    double v179 = v92;
    double v184 = v93;

    goto LABEL_66;
  }
  -[SBDisplayItemLayoutAttributesCalculator frameForCenterItemWithConfiguration:interfaceOrientation:bounds:](self, "frameForCenterItemWithConfiguration:interfaceOrientation:bounds:", SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration([v29 centerConfiguration]), a6, x, y, width, height);
LABEL_112:
  double v150 = v30;
  double v151 = v31;
  double v152 = v32;
  double v153 = v33;

  double v154 = v150;
  double v155 = v151;
  double v156 = v152;
  double v157 = v153;
  result.size.double height = v157;
  result.size.double width = v156;
  result.origin.double y = v155;
  result.origin.double x = v154;
  return result;
}

- (CGRect)_containerBoundsForWindowScene:(id)a3 containerOrientation:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 screen];
  v7 = [v6 displayConfiguration];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  BOOL v14 = [v5 traitsPipelineManager];

  if ([v14 supportsLiveDeviceRotation])
  {

    if ((unint64_t)(a4 - 3) <= 1)
    {
      BSSizeSwap();
      double v9 = v15;
      double v11 = v16;
    }
  }
  else
  {
  }
  double v17 = v12;
  double v18 = v13;
  double v19 = v9;
  double v20 = v11;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (id)_chamoisSettingsCache
{
  chamoisSettingsCache = self->_chamoisSettingsCache;
  if (!chamoisSettingsCache)
  {
    v4 = +[SBAppSwitcherDomain rootSettings];
    id v5 = [v4 chamoisSettings];
    v6 = self->_chamoisSettingsCache;
    self->_chamoisSettingsCache = v5;

    chamoisSettingsCache = self->_chamoisSettingsCache;
  }
  return chamoisSettingsCache;
}

- (BOOL)_appLayoutContainsOnlyResizableApps:(id)a3
{
  id v3 = a3;
  v4 = +[SBApplicationController sharedInstance];
  char v5 = [v4 _appLayoutContainsOnlyResizableApps:v3];

  return v5;
}

- (int64_t)sizingPolicyForDisplayItem:(id)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 proposedSizingPolicy:(int64_t)a6 windowScene:(id)a7
{
  id v12 = a7;
  double v13 = [(SBDisplayItemLayoutAttributesCalculator *)self _applicationForDisplayItem:a3];
  if (v13)
  {
    BOOL v14 = [v12 switcherController];
    uint64_t v15 = [v14 windowManagementStyle];
    double v16 = [v14 displayIdentity];
    if (((1 << a6) & (unint64_t)~[v13 supportedSizingPoliciesForSwitcherWindowManagementStyle:v15 displayIdentity:v16 contentOrientation:a4 containerOrientation:a5]) != 0)a6 = objc_msgSend(v13, "preferredSizingPolicyForSwitcherWindowManagementStyle:displayIdentity:contentOrientation:containerOrientation:", v15, v16, a4, a5); {
  }
    }
  return a6;
}

- (id)_applicationForDisplayItem:(id)a3
{
  id v3 = a3;
  v4 = +[SBApplicationController sharedInstance];
  char v5 = [v4 applicationForDisplayItem:v3];

  return v5;
}

- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4 windowScene:(id)a5
{
  double v8 = [a5 _fbsDisplayConfiguration];
  [v8 bounds];
  _UIWindowConvertRectFromOrientationToOrientation();
  -[SBDisplayItemLayoutAttributesCalculator frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:bounds:](self, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:bounds:", a3, a4);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4 bounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  SBLayoutDefaultSideLayoutElementWidth();
  double v11 = v10;
  if (frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds__onceToken != -1) {
    dispatch_once(&frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds__onceToken, &__block_literal_global_127);
  }
  switch(a4)
  {
    case 0:
    case 4:
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
      {
        double v12 = -v11;
      }
      else
      {
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        double v12 = CGRectGetWidth(v24);
      }
      break;
    case 1:
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1) {
        goto LABEL_10;
      }
      goto LABEL_8;
    case 2:
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
      {
LABEL_10:
        double v12 = *(double *)&frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin;
      }
      else
      {
LABEL_8:
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        double v12 = CGRectGetWidth(v23)
            - (v11
             + *(double *)&frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin);
      }
      break;
    case 3:
      uint64_t v13 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      CGFloat v14 = x;
      CGFloat v15 = y;
      CGFloat v16 = width;
      CGFloat v17 = height;
      if (v13 == 1) {
        double v12 = v11 + CGRectGetMaxX(*(CGRect *)&v14);
      }
      else {
        double v12 = CGRectGetMinX(*(CGRect *)&v14) - v11;
      }
      break;
    default:
      double v12 = 0.0;
      break;
  }
  uint64_t v18 = frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v19 = CGRectGetHeight(v25)
      + *(double *)&frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin * -2.0;
  double v20 = v12;
  double v21 = *(double *)&v18;
  double v22 = v11;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

uint64_t __120__SBDisplayItemLayoutAttributesCalculator_frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds___block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
  frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin = v1;
  return result;
}

- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4 windowScene:(id)a5
{
  double v8 = [a5 _fbsDisplayConfiguration];
  [v8 bounds];
  _UIWindowConvertRectFromOrientationToOrientation();
  -[SBDisplayItemLayoutAttributesCalculator frameForCenterItemWithConfiguration:interfaceOrientation:bounds:](self, "frameForCenterItemWithConfiguration:interfaceOrientation:bounds:", a3, a4);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = [(SBDisplayItemLayoutAttributesCalculator *)self _centerWindowSheetMetricsCache];
  objc_msgSend(v11, "pageSheetFrameForBounds:interfaceOrientation:configuration:", a4, a3 == 2, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)autoLayoutSpaceForAppLayout:(id)a3 containerOrientation:(int64_t)a4 chamoisLayoutAttributes:(id)a5 floatingDockHeight:(double)a6 screenScale:(double)a7 bounds:(CGRect)a8 prefersStripHidden:(BOOL)a9 prefersDockHidden:(BOOL)a10
{
  LOBYTE(v13) = a10;
  double v10 = -[SBDisplayItemLayoutAttributesCalculator _appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:](self, "_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", a3, 0, 0, a4, a5, a9, a6, a7, a8.origin.x, a8.origin.y, a8.size.width, a8.size.height, v13, 0);
  double v11 = [v10 cachedLastAutoLayoutSpace];

  return v11;
}

- (id)appLayoutByPerformingAutoLayoutForAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 bounds:(CGRect)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 source:(int64_t)a13
{
  return -[SBDisplayItemLayoutAttributesCalculator _appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:](self, "_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", a3, a4, a5, a6, a7, a11, a8, a9, a10.origin.x, a10.origin.y, a10.size.width, a10.size.height);
}

- (id)appLayoutByPerformingAutoLayoutForAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 windowScene:(id)a7 source:(int64_t)a8
{
  id v12 = a7;
  id v43 = a4;
  id v13 = a3;
  uint64_t v14 = [(SBDisplayItemLayoutAttributesCalculator *)self _appLayoutContainsOnlyResizableApps:v13] ^ 1;
  [(SBDisplayItemLayoutAttributesCalculator *)self _containerBoundsForWindowScene:v12 containerOrientation:a6];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = [(SBDisplayItemLayoutAttributesCalculator *)self _chamoisSettingsCache];
  CGRect v24 = [v12 floatingDockController];
  objc_msgSend(v24, "floatingDockHeightForFrame:", v16, v18, v20, v22);
  double v26 = v25;

  double v27 = [v23 layoutAttributesForWindowScene:v12 interfaceOrientation:a6 requiresFullScreen:v14 floatingDockHeight:v26];
  id v28 = [v12 switcherController];
  id v29 = [v28 contentViewController];
  uint64_t v30 = objc_opt_class();
  id v31 = v29;
  if (v30)
  {
    if (objc_opt_isKindOfClass()) {
      double v32 = v31;
    }
    else {
      double v32 = 0;
    }
  }
  else
  {
    double v32 = 0;
  }
  id v33 = v32;

  double v34 = [v12 screen];
  [v34 scale];
  double v36 = v35;

  uint64_t v37 = [v33 prefersStripHidden];
  char v38 = [v33 prefersDockHidden];

  LOBYTE(v41) = v38;
  uint64_t v39 = -[SBDisplayItemLayoutAttributesCalculator appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:](self, "appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", v13, v43, a5, a6, v27, v37, v26, v36, v16, v18, v20, v22, v41, a8);

  return v39;
}

- (id)layoutRestrictionInfoForItem:(id)a3
{
  id v3 = [(SBDisplayItemLayoutAttributesCalculator *)self _applicationForDisplayItem:a3];
  int v4 = [v3 supportsChamoisSceneResizing];
  if (!v3 || v4)
  {
    uint64_t v7 = 0;
    double v5 = -1.0;
    double v6 = -1.0;
  }
  else if ([v3 alwaysMaximizedInChamois])
  {
    double v5 = -1.0;
    double v6 = -1.0;
    uint64_t v7 = 12;
  }
  else
  {
    double v8 = [MEMORY[0x1E4F42D90] mainScreen];
    double v9 = [v8 displayConfiguration];
    [v3 defaultLaunchingSizeForDisplayConfiguration:v9];
    double v5 = v10;
    double v6 = v11;

    uint64_t v7 = 10;
  }
  id v12 = +[SBDisplayItemGridLayoutRestrictionInfo layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:](SBDisplayItemGridLayoutRestrictionInfo, "layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:", v7, v5, v6);

  return v12;
}

- (id)_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 bounds:(CGRect)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 source:(int64_t)a13
{
  BOOL v13 = a11;
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v25 = a4;
  id v26 = a7;
  double v27 = [v24 cachedLastOverlappingModelKey];
  int64_t v201 = a6;
  double v193 = a8;
  BOOL v192 = v13;
  id v28 = +[SBAppLayoutAutoLayoutSpaceCacheKey cacheKeyForSnapshotOfAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:](SBAppLayoutAutoLayoutSpaceCacheKey, "cacheKeyForSnapshotOfAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:", v24, v26, a6, v13, a12, x, y, width, height, a8);
  if (v27 && [v27 isEqual:v28])
  {
    id v24 = v24;
    id v29 = v24;
    goto LABEL_107;
  }
  double v177 = v28;
  double v178 = v27;
  SEL v174 = a2;
  v202 = self;
  if ((unint64_t)a13 > 0x37 || ((1 << a13) & 0x80000800002000) == 0 || v25 == 0) {
    goto LABEL_18;
  }
  double v32 = [v24 allItems];
  uint64_t v33 = [v32 count];
  double v34 = [v25 allItems];
  uint64_t v35 = [v34 count] + 1;

  if (v33 != v35) {
    goto LABEL_18;
  }
  double v36 = [v24 allItems];
  v232[0] = MEMORY[0x1E4F143A8];
  v232[1] = 3221225472;
  v232[2] = __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke;
  v232[3] = &unk_1E6AF4B38;
  id v233 = v25;
  uint64_t v37 = objc_msgSend(v36, "bs_firstObjectPassingTest:", v232);

  if (!v37) {
    goto LABEL_17;
  }
  char v38 = [(SBDisplayItemLayoutAttributesCalculator *)v202 _deviceApplicationSceneHandleForDisplayItem:v37];
  if (!v38)
  {

LABEL_17:
    goto LABEL_18;
  }
  uint64_t v39 = v38;
  int v40 = [v38 supportsCenterWindow];

  if (v40)
  {
    uint64_t v41 = [(SBDisplayItemLayoutAttributesCalculator *)v202 _chamoisLayoutGridCache];
    uint64_t v42 = +[SBDisplayItemGridLayoutRestrictionInfo layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:](SBDisplayItemGridLayoutRestrictionInfo, "layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:", 0, -1.0, -1.0);
    objc_msgSend(v41, "maxGridSizeForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", v201, v42, v26, x, y, width, height, a9);
    double v44 = v43;
    double v190 = v45;

    [v26 stageOcclusionDodgingPeekLength];
    double v188 = v44 - v46;
    goto LABEL_19;
  }
LABEL_18:
  double v47 = [(SBDisplayItemLayoutAttributesCalculator *)v202 _chamoisLayoutGridCache];
  [v26 maximumWindowWidthForOverlapping];
  double v49 = v48;
  double v50 = [v24 allItems];
  uint64_t v51 = [v50 count];
  double v52 = +[SBDisplayItemGridLayoutRestrictionInfo layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:](SBDisplayItemGridLayoutRestrictionInfo, "layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:", 0, -1.0, -1.0);
  objc_msgSend(v47, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", v51, v201, v52, v26, v49, height, x, y, width, height, a9);
  double v188 = v53;
  double v190 = v54;

LABEL_19:
  [v26 defaultWindowSize];
  double v198 = v56;
  double v199 = v55;
  [v26 screenEdgePadding];
  double v197 = v57;
  double v58 = [v24 allItems];
  unint64_t v59 = [v58 count];

  v194 = v25;
  double v183 = v26;
  double v203 = y;
  double v195 = width;
  double v196 = x;
  double v200 = height;
  if (v59 < 2)
  {
    v104 = [v24 allItems];
    uint64_t v105 = [v104 count];

    if (v105 != 1) {
      goto LABEL_64;
    }
    double v60 = [v24 itemForLayoutRole:1];
    v106 = [v24 layoutAttributesForItem:v60];
    objc_msgSend(v106, "userSizeBeforeOverlappingInBounds:defaultSize:screenEdgePadding:", x, y, width, height, v199, v198, v197);
    if (v107 != *MEMORY[0x1E4F1DB30] || v108 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      uint64_t v227 = 0;
      memset(&rect, 0, sizeof(rect));
      long long v225 = 0u;
      SBDisplayItemAttributedSizeInfer((uint64_t)&v225, v107, v108, x, y, width, height);
      v223[0] = v225;
      *(CGRect *)&v223[1] = rect;
      uint64_t v224 = v227;
      objc_msgSend(v106, "attributesByModifyingAttributedSize:", v223, *(void *)&v197);
      v110 = double v109 = v60;

      v106 = objc_msgSend(v110, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v220, SBDisplayItemAttributedSizeUnspecified((uint64_t)v220).n128_f64[0]);

      uint64_t v111 = [v24 appLayoutByModifyingLayoutAttributes:v106 forItem:v109];

      id v24 = (id)v111;
      double v60 = v109;
    }
  }
  else
  {
    long long v230 = 0u;
    long long v231 = 0u;
    long long v228 = 0u;
    long long v229 = 0u;
    double v60 = [v24 allItems];
    uint64_t v61 = [v60 countByEnumeratingWithState:&v228 objects:v236 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v229;
      double v64 = *MEMORY[0x1E4F1DB30];
      double v65 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v66 = v202;
      obuint64_t j = v60;
      id v184 = *(id *)MEMORY[0x1E4F1DB30];
      double v181 = v65;
      do
      {
        uint64_t v67 = 0;
        uint64_t v204 = v62;
        do
        {
          if (*(void *)v229 != v63) {
            objc_enumerationMutation(v60);
          }
          uint64_t v68 = *(void *)(*((void *)&v228 + 1) + 8 * v67);
          uint64_t v69 = [v24 layoutRoleForItem:v68];
          if (SBLayoutRoleIsValidForSplitView(v69))
          {
            v70 = [v24 layoutAttributesForItem:v68];
            objc_msgSend(v70, "userSizeBeforeOverlappingInBounds:defaultSize:screenEdgePadding:", x, y, width, v200, v199, v198, v197);
            if (v72 == v64 && v71 == v65)
            {
              double v74 = [(SBDisplayItemLayoutAttributesCalculator *)v66 layoutRestrictionInfoForItem:v68];
              double v75 = x;
              double v77 = v188;
              double v76 = v190;
              if ([v74 layoutRestrictions])
              {
                double v78 = [(SBDisplayItemLayoutAttributesCalculator *)v66 _chamoisLayoutGridCache];
                double v79 = [v24 allItems];
                objc_msgSend(v78, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v79, "count"), v201, v74, v183, v188, v190, v75, y, width, v200, a9);
                double v77 = v80;
                double v76 = v81;

                id v25 = v194;
                if (v77 >= width || v76 >= v200)
                {
                  v83 = [(SBDisplayItemLayoutAttributesCalculator *)v66 _chamoisLayoutGridCache];
                  [v183 maximumWindowWidthForOverlapping];
                  double v85 = v84;
                  double v86 = [v24 allItems];
                  double v66 = v202;
                  objc_msgSend(v83, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v86, "count"), v201, v74, v183, v85, v200, v75, y, width, v200, a9);
                  double v77 = v87;
                  double v76 = v88;

                  id v25 = v194;
                }
              }
              objc_msgSend(v70, "sizeInBounds:defaultSize:screenEdgePadding:", v75, y, width, v200, v199, v198, v197);
              if (v89 <= 0.0 || (double v91 = v90, v90 <= 0.0))
              {
                BYTE1(v173) = 1;
                LOBYTE(v173) = a12;
                double v94 = v195;
                double v95 = v196;
                double v93 = v203;
                double v96 = v200;
                id v26 = v183;
                -[SBDisplayItemLayoutAttributesCalculator _frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:](v66, "_frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:", v69, v24, v201, v183, 1, v192, v196, v203, v195, v200, v193, a9, v173);
                double v92 = v97;
                double v91 = v98;
              }
              else
              {
                double v92 = v89;
                id v26 = v183;
                double v93 = v203;
                double v94 = v195;
                double v95 = v196;
                double v96 = v200;
              }
              uint64_t v227 = 0;
              memset(&rect, 0, sizeof(rect));
              long long v225 = 0u;
              SBDisplayItemAttributedSizeInfer((uint64_t)&v225, v92, v91, v95, v93, v94, v96);
              v223[0] = v225;
              *(CGRect *)&v223[1] = rect;
              uint64_t v224 = v227;
              v99 = objc_msgSend(v70, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v223, *(void *)&v197);

              double width = v94;
              if ((BSFloatGreaterThanFloat() & 1) != 0 || BSFloatGreaterThanFloat())
              {
                double v64 = *(double *)&v184;
                double v65 = v181;
                if ([v26 isAutoLayoutEnabled])
                {
                  if (v77 >= v92) {
                    double v100 = v92;
                  }
                  else {
                    double v100 = v77;
                  }
                  uint64_t v224 = 0;
                  memset(&v223[1], 0, 32);
                  if (v76 >= v91) {
                    double v101 = v91;
                  }
                  else {
                    double v101 = v76;
                  }
                  v223[0] = 0uLL;
                  double x = v196;
                  double y = v203;
                  SBDisplayItemAttributedSizeInfer((uint64_t)v223, v100, v101, v196, v203, width, v200);
                  v221[0] = v223[0];
                  v221[1] = v223[1];
                  v221[2] = v223[2];
                  uint64_t v222 = v224;
                  uint64_t v102 = objc_msgSend(v99, "attributesByModifyingAttributedSize:", v221, *(void *)&v197);

                  v99 = (void *)v102;
                }
                else
                {
                  double y = v203;
                  double x = v196;
                }
              }
              else
              {
                double y = v203;
                double x = v196;
                double v64 = *(double *)&v184;
                double v65 = v181;
              }
              uint64_t v103 = [v24 appLayoutByModifyingLayoutAttributes:v99 forItem:v68];

              v70 = v99;
              id v24 = (id)v103;
              double v60 = obj;
            }

            uint64_t v62 = v204;
          }
          ++v67;
        }
        while (v62 != v67);
        uint64_t v62 = [v60 countByEnumeratingWithState:&v228 objects:v236 count:16];
      }
      while (v62);
      double height = v200;
    }
  }

LABEL_64:
  id v112 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v218[0] = MEMORY[0x1E4F143A8];
  v218[1] = 3221225472;
  v218[2] = __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke_2;
  v218[3] = &unk_1E6AF9EF0;
  id v113 = v112;
  id v219 = v113;
  [v24 enumerate:v218];
  v114 = [v24 zOrderedItems];
  v216[0] = MEMORY[0x1E4F143A8];
  v216[1] = 3221225472;
  v216[2] = __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke_3;
  v216[3] = &unk_1E6AFFEE0;
  id v182 = v114;
  id v217 = v182;
  [v113 sortUsingComparator:v216];
  id v191 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v212 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  id obja = v113;
  uint64_t v115 = [obja countByEnumeratingWithState:&v212 objects:v235 count:16];
  if (v115)
  {
    uint64_t v116 = v115;
    uint64_t v117 = *(void *)v213;
    do
    {
      for (uint64_t i = 0; i != v116; ++i)
      {
        if (*(void *)v213 != v117) {
          objc_enumerationMutation(obja);
        }
        uint64_t v119 = *(void *)(*((void *)&v212 + 1) + 8 * i);
        BYTE1(v173) = 1;
        LOBYTE(v173) = a12;
        -[SBDisplayItemLayoutAttributesCalculator _frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:](v202, "_frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:", [v24 layoutRoleForItem:v119], v24, v201, v26, 1, v192, x, y, width, height, v193, a9, v173);
        double v121 = v120;
        double v123 = v122;
        double v124 = [v24 layoutAttributesForItem:v119];
        double v125 = [(SBContinuousExposeAutoLayoutItem *)[SBMutableContinuousExposeAutoLayoutItem alloc] initWithDisplayItem:v119];
        -[SBContinuousExposeAutoLayoutItem setSize:](v125, "setSize:", v121, v123);
        UIRectGetCenter();
        -[SBContinuousExposeAutoLayoutItem setPosition:](v125, "setPosition:");
        -[SBContinuousExposeAutoLayoutItem setInDefaultPosition:](v125, "setInDefaultPosition:", [v124 isPositionSystemManaged]);
        [v191 addObject:v125];
      }
      uint64_t v116 = [obja countByEnumeratingWithState:&v212 objects:v235 count:16];
    }
    while (v116);
  }

  double v126 = [[SBContinuousExposeAutoLayoutSpace alloc] initWithItems:v191];
  v127 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:]([SBContinuousExposeAutoLayoutConfiguration alloc], "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v26, x, y, width, height, a9, v193);
  if (v25)
  {
    v128 = v202;
    if ([v25 isEqual:v24])
    {
      uint64_t v129 = 0;
    }
    else
    {
      uint64_t v129 = -[SBDisplayItemLayoutAttributesCalculator autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:](v202, "autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:", v25, v201, v26, v192, a12, v193, a9, x, y, width, height);
    }
  }
  else
  {
    uint64_t v129 = 0;
    v128 = v202;
  }
  v130 = [(SBDisplayItemLayoutAttributesCalculator *)v128 _autoLayoutController];
  double v175 = (void *)v129;
  v176 = v127;
  v131 = [v130 spaceByPerformingAutoLayoutWithSpace:v126 previousSpace:v129 configuration:v127 options:a5];

  id v132 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  double v180 = v131;
  id v185 = [v131 items];
  uint64_t v133 = [v185 countByEnumeratingWithState:&v208 objects:v234 count:16];
  if (v133)
  {
    uint64_t v134 = v133;
    uint64_t v189 = *(void *)v209;
    double width = v195;
    double height = v200;
    do
    {
      for (uint64_t j = 0; j != v134; ++j)
      {
        if (*(void *)v209 != v189) {
          objc_enumerationMutation(v185);
        }
        uint64_t v136 = v132;
        uint64_t v137 = *(void **)(*((void *)&v208 + 1) + 8 * j);
        double v138 = [v137 displayItem];
        [v137 position];
        double v140 = v139;
        double v142 = v141;
        [v137 size];
        double v205 = v144;
        double v207 = v143;
        [v137 unoccludedPeekingPosition];
        double v146 = v145;
        double v148 = v147;
        if ([v137 isFullyOccluded])
        {
          uint64_t v149 = 3;
        }
        else if ([v137 isOverlapped])
        {
          uint64_t v149 = 2;
        }
        else
        {
          uint64_t v149 = 1;
        }
        double v150 = [v24 layoutAttributesForItem:v138];
        +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v140, v142, x, v203, v195, v200);
        double v152 = v151;
        double v154 = v153;
        +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v146, v148, x, v203, v195, v200);
        double v156 = v155;
        double v158 = v157;
        double v159 = [(SBDisplayItemLayoutAttributesCalculator *)v202 _deviceApplicationSceneHandleForDisplayItem:v138];
        uint64_t v160 = [v150 sizingPolicy];
        if (v159) {
          uint64_t v160 = SBPreferredDisplayItemSizingPolicy([v150 sizingPolicy], objc_msgSend(v159, "_supportedSizingPoliciesForContentOrientation:containerOrientation:", objc_msgSend(v150, "contentOrientation"), v201), v207, v205, x, v203, v195, v200);
        }
        uint64_t v161 = [v150 attributesByModifyingSizingPolicy:v160];
        v162 = [v161 attributesByModifyingOcclusionState:v149];

        v163 = objc_msgSend(v162, "attributesByModifyingUnoccludedPeekingCenter:", v156, v158);

        v164 = objc_msgSend(v163, "attributesByModifyingPositionIsSystemManaged:", objc_msgSend(v137, "isInDefaultPosition"));

        uint64_t v227 = 0;
        memset(&rect, 0, sizeof(rect));
        long long v225 = 0u;
        if (v164) {
          [v164 attributedSize];
        }
        v223[0] = v225;
        *(CGRect *)&v223[1] = rect;
        uint64_t v224 = v227;
        BOOL IsUnspecified = SBDisplayItemAttributedSizeIsUnspecified((uint64_t)v223);
        BOOL v166 = SBDisplayItemCenterIsUnspecified(v152, v154);
        double x = v196;
        if (CGRectIsNull(rect) || (IsEmptdouble y = CGRectIsEmpty(rect), IsUnspecified || v166) || IsEmpty)
        {
          double y = v203;
          SBDisplayItemAttributedSizeInfer((uint64_t)v223, v207, v205, v196, v203, v195, v200);
          uint64_t v227 = v224;
          CGRect rect = *(CGRect *)&v223[1];
          long long v225 = v223[0];
          v167 = objc_msgSend(v164, "attributesByModifyingAttributedSize:", v223, *(void *)&v197);

          v164 = objc_msgSend(v167, "attributesByModifyingNormalizedCenter:", v152, v154);
        }
        else
        {
          double y = v203;
        }
        id v25 = v194;
        if (v194)
        {
          if (![v194 containsAllItemsFromAppLayout:v24]) {
            goto LABEL_101;
          }
          int v169 = [v24 containsAllItemsFromAppLayout:v194] ^ 1;
        }
        else
        {
          int v169 = 0;
        }
        if (a13 == 27 || v169)
        {
LABEL_101:
          uint64_t v170 = objc_msgSend(v164, "attributesByModifyingNormalizedCenter:", v152, v154);

          v164 = (void *)v170;
        }
        id v132 = v136;
        [v136 setObject:v164 forKey:v138];
      }
      uint64_t v134 = [v185 countByEnumeratingWithState:&v208 objects:v234 count:16];
    }
    while (v134);
  }

  id v29 = [v24 appLayoutByModifyingLayoutAttributesForItems:v132];
  [v29 setCachedLastAutoLayoutSpace:v180];
  id v26 = v183;
  id v28 = +[SBAppLayoutAutoLayoutSpaceCacheKey cacheKeyForSnapshotOfAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:](SBAppLayoutAutoLayoutSpaceCacheKey, "cacheKeyForSnapshotOfAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:", v24, v183, v201, v192, a12, x, y, width, height, v193);

  [v29 setCachedLastOverlappingModelKey:v28];
  if (v24 != v29)
  {
    uint64_t v172 = [MEMORY[0x1E4F28B00] currentHandler];
    [v172 handleFailureInMethod:v174 object:v202 file:@"SBDisplayItemLayoutAttributesCalculator.m" lineNumber:573 description:@"Expected appLayout and newAppLayout to be equal"];
  }
  double v27 = v178;
LABEL_107:

  return v29;
}

uint64_t __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2] ^ 1;
}

void __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (SBLayoutRoleIsValidForSplitView(a2)) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  double v6 = *(void **)(a1 + 32);
  id v7 = a3;
  double v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  double v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  double v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (id)_deviceApplicationSceneHandleForDisplayItem:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  double v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  int v4 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__SBDisplayItemLayoutAttributesCalculator__deviceApplicationSceneHandleForDisplayItem___block_invoke;
  v8[3] = &unk_1E6AFC258;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = &v11;
  [v4 enumerateSwitcherControllersWithBlock:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __87__SBDisplayItemLayoutAttributesCalculator__deviceApplicationSceneHandleForDisplayItem___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = (void *)MEMORY[0x1E4F62A60];
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  double v8 = [v6 uniqueIdentifier];
  id v18 = [v5 identityForIdentifier:v8];

  id v9 = [v7 windowScene];

  uint64_t v10 = [v9 sceneManager];
  uint64_t v11 = [v10 existingSceneHandleForSceneIdentity:v18];

  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  double v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)_centerWindowSheetMetricsCache
{
  centerWindowSheetMetricsCache = self->_centerWindowSheetMetricsCache;
  if (!centerWindowSheetMetricsCache)
  {
    int v4 = objc_alloc_init(SBFluidSwitcherSheetMetricsCache);
    id v5 = self->_centerWindowSheetMetricsCache;
    self->_centerWindowSheetMetricsCache = v4;

    centerWindowSheetMetricsCache = self->_centerWindowSheetMetricsCache;
  }
  return centerWindowSheetMetricsCache;
}

- (id)_autoLayoutController
{
  cached_autoLayoutController = self->_cached_autoLayoutController;
  if (!cached_autoLayoutController)
  {
    int v4 = objc_alloc_init(SBContinuousExposeAutoLayoutController);
    id v5 = self->_cached_autoLayoutController;
    self->_cached_autoLayoutController = v4;

    cached_autoLayoutController = self->_cached_autoLayoutController;
  }
  return cached_autoLayoutController;
}

- (id)_chamoisLayoutGridCache
{
  chamoisLayoutGridCache = self->_chamoisLayoutGridCache;
  if (!chamoisLayoutGridCache)
  {
    int v4 = objc_alloc_init(SBDisplayItemLayoutGrid);
    id v5 = self->_chamoisLayoutGridCache;
    self->_chamoisLayoutGridCache = v4;

    chamoisLayoutGridCache = self->_chamoisLayoutGridCache;
  }
  return chamoisLayoutGridCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chamoisLayoutGridCache, 0);
  objc_storeStrong((id *)&self->_cached_autoLayoutController, 0);
  objc_storeStrong((id *)&self->_chamoisSettingsCache, 0);
  objc_storeStrong((id *)&self->_centerWindowSheetMetricsCache, 0);
}

@end