@interface SBContinuousExposeWindowDragDestinationSwitcherModifier
- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem;
- (CGRect)_frameForSelectedAppLayout:(id)a3 addingToStage:(BOOL)a4;
- (CGRect)_frameForSelectedDisplayItemAddingToStage:(BOOL)a3;
- (SBAppLayout)hoveringOverAppLayout;
- (SBAppLayout)initialAppLayout;
- (SBAppLayout)proposedAppLayout;
- (SBContinuousExposeWindowDragDestinationSwitcherModifier)initWithSelectedDisplayItem:(id)a3 initialAppLayout:(id)a4 delegate:(id)a5;
- (SBContinuousExposeWindowDragDestinationSwitcherModifierDelegate)destinationDelegate;
- (SBDisplayItem)selectedDisplayItem;
- (id)_appLayoutByAddingItem:(id)a3 toAppLayout:(id)a4 size:(CGSize)a5 center:(CGPoint)a6 positionIsSystemManaged:(BOOL)a7;
- (id)_appLayoutContainingDisplayItem:(id)a3;
- (id)appLayoutByAddingAppLayout:(id)a3 toAppLayout:(id)a4;
- (id)handleGestureEvent:(id)a3;
- (id)proposedAppLayoutForWindowDrag;
- (unint64_t)proposedDestination;
- (void)didMoveToParentModifier:(id)a3;
- (void)updateProposedAppLayoutWithAppLayout:(id)a3 andInitialAppLayout:(id)a4;
@end

@implementation SBContinuousExposeWindowDragDestinationSwitcherModifier

- (SBContinuousExposeWindowDragDestinationSwitcherModifier)initWithSelectedDisplayItem:(id)a3 initialAppLayout:(id)a4 delegate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBContinuousExposeWindowDragDestinationSwitcherModifier;
  v13 = [(SBSwitcherModifier *)&v18 init];
  if (v13)
  {
    if (v10)
    {
      if (v11) {
        goto LABEL_4;
      }
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v13, @"SBContinuousExposeWindowDragDestinationSwitcherModifier.m", 51, @"Invalid parameter not satisfying: %@", @"selectedDisplayItem" object file lineNumber description];

      if (v11)
      {
LABEL_4:
        if (v12)
        {
LABEL_5:
          objc_storeStrong((id *)&v13->_selectedDisplayItem, a3);
          objc_storeStrong((id *)&v13->_initialAppLayout, a4);
          objc_storeWeak((id *)&v13->_destinationDelegate, v12);
          v13->_proposedDestination = 0;
          objc_storeStrong((id *)&v13->_proposedAppLayout, v13->_initialAppLayout);
          objc_storeStrong((id *)&v13->_lastAppLayoutForStripCalculation, v13->_initialAppLayout);
          goto LABEL_6;
        }
LABEL_9:
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, v13, @"SBContinuousExposeWindowDragDestinationSwitcherModifier.m", 53, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

        goto LABEL_5;
      }
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v13, @"SBContinuousExposeWindowDragDestinationSwitcherModifier.m", 52, @"Invalid parameter not satisfying: %@", @"initialAppLayout" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:

  return v13;
}

- (void)didMoveToParentModifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragDestinationSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_initialAutoLayoutSpace)
    {
      v5 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_initialAppLayout];
      initialAutoLayoutSpace = self->_initialAutoLayoutSpace;
      self->_initialAutoLayoutSpace = v5;
    }
  }
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v255.receiver = self;
  v255.super_class = (Class)SBContinuousExposeWindowDragDestinationSwitcherModifier;
  uint64_t v250 = [(SBSwitcherModifier *)&v255 handleGestureEvent:v4];
  p_location = &self->_location;
  [v4 locationInContainerView];
  self->_location.double x = v6;
  self->_location.CGFloat y = v7;
  [v4 velocityInContainerView];
  self->_velocity.double x = v8;
  self->_velocity.CGFloat y = v9;
  v251 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self chamoisLayoutAttributes];
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
  double v11 = v10;
  if ([v4 phase] == 1)
  {
    self->_initialLocation = *p_location;
    id v12 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
    v13 = [v12 layoutAttributesForItem:self->_selectedDisplayItem];
    initialSelectedDisplayItemLayoutAttributes = self->_initialSelectedDisplayItemLayoutAttributes;
    self->_initialSelectedDisplayItemLayoutAttributes = v13;

    v15 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self draggingAppLayoutsForWindowDrag];
    v254[0] = MEMORY[0x1E4F143A8];
    v254[1] = 3221225472;
    v254[2] = __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke;
    v254[3] = &unk_1E6AF4B60;
    v254[4] = self;
    v16 = objc_msgSend(v15, "bs_firstObjectPassingTest:", v254);

    uint64_t v17 = [v16 preferredDisplayOrdinal];
    self->_dragBeganInOtherSwitcher = v17 != [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self displayOrdinal];
    if ([(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self isPartiallyOffscreenWindowsEnabled])
    {
      objc_super v18 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self displayItemLayoutAttributesCalculator];
      uint64_t v19 = [v12 layoutRoleForItem:self->_selectedDisplayItem];
      [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      uint64_t v28 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self switcherInterfaceOrientation];
      v29 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self chamoisLayoutAttributes];
      [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self floatingDockHeight];
      double v31 = v30;
      [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self screenScale];
      double v33 = v32;
      uint64_t v34 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self prefersStripHidden];
      LOBYTE(v242) = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self prefersDockHidden];
      objc_msgSend(v18, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v19, v12, v28, v29, 1, v34, v21, v23, v25, v27, v31, v33, v242);
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;

      v43 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_initialAppLayout];
      [v43 stageArea];
      self->_shouldConstrainToLeftEdge = v36 > v44;
      self->_shouldConstrainToRightEdge = v36 + v40 < v44 + v45;
      self->_shouldConstrainToBottomEdge = v38 + v42 < v46 + v47;
    }
    else
    {
      self->_shouldConstrainToLeftEdge = 1;
      self->_shouldConstrainToRightEdge = 1;
      self->_shouldConstrainToBottomEdge = 1;
    }
    v59 = (void *)v250;
    v58 = v251;

LABEL_99:
    goto LABEL_100;
  }
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _frameForSelectedDisplayItemAddingToStage:0];
  double v49 = v48;
  double x = p_location->x;
  CGFloat y = self->_location.y;
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
  v257.double x = x;
  v257.CGFloat y = y;
  int v52 = 0;
  v53 = &OBJC_IVAR___SBDeviceStationaryMotionDetector__started;
  v54 = &OBJC_IVAR___SBDeviceStationaryMotionDetector__started;
  if (CGRectContainsPoint(v258, v257))
  {
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
    p_initialLocation = &self->_initialLocation;
    if (CGRectContainsPoint(v259, self->_initialLocation))
    {
      v56 = [(SBAppLayout *)self->_initialAppLayout allItems];
      if ([v56 count] == 1)
      {
        BOOL v57 = [(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem];

        if (v57)
        {
          int v52 = 1;
          v53 = &OBJC_IVAR___SBDeviceStationaryMotionDetector__started;
LABEL_43:
          v54 = &OBJC_IVAR___SBDeviceStationaryMotionDetector__started;
          goto LABEL_44;
        }
      }
      else
      {
      }
      BOOL v243 = [(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem];
      int v60 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self isRTLEnabled];
      BOOL v61 = p_initialLocation->x < v11 * 0.5;
      if (v60) {
        BOOL v61 = p_initialLocation->x >= v11 * 0.5;
      }
      BOOL v248 = v61;
      v245 = -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_proposedAppLayout, p_initialLocation->x);
      [v245 boundingBox];
      double v63 = v62;
      v64 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self switcherSettings];
      v65 = [v64 chamoisSettings];

      if ([(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem])
      {
        char v66 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self isContinuousExposeStripVisible];
        BOOL v67 = [(SBAppLayout *)self->_proposedAppLayout containsItem:self->_selectedDisplayItem];
        if ((v66 & 1) != 0 || !v67)
        {
          [v251 stripWidth];
          double v73 = v72;
          [v65 stripDropZoneMultiplier];
          double v69 = v73 * v74;
        }
        else
        {
          [v251 screenEdgePadding];
          double v69 = v68;
        }
      }
      else
      {
        [v251 stripWidth];
        if (v70 >= (v11 - v63) * 0.5) {
          double v69 = (v11 - v63) * 0.5;
        }
        else {
          double v69 = v70;
        }
        [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self continuousExposeStripProgress];
        if (BSFloatGreaterThanFloat())
        {
          [v251 stripWidth];
          if (v69 < v71) {
            double v69 = v71;
          }
        }
      }
      int v75 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self isRTLEnabled];
      BOOL v76 = x > v69;
      if (v75) {
        BOOL v76 = x < v11 - v69;
      }
      if (v76 || BSFloatIsZero()) {
        self->_double stripWidthForCancelZone = v69;
      }
      if ([v65 useLeadingWindowEdgeForDropZoneCalculations]) {
        double x = v49;
      }
      char v77 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self isRTLEnabled];
      double stripWidthForCancelZone = self->_stripWidthForCancelZone;
      if (v77)
      {
        if (x >= v11 - stripWidthForCancelZone)
        {
LABEL_36:
          v79 = v245;
          if ([(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem])
          {
            [v251 screenEdgePadding];
            BOOL v81 = self->_location.y <= v80 + v80;
          }
          else
          {
            BOOL v81 = 0;
          }
          v53 = &OBJC_IVAR___SBDeviceStationaryMotionDetector__started;
          goto LABEL_42;
        }
      }
      else if (x <= stripWidthForCancelZone)
      {
        goto LABEL_36;
      }
      BOOL v81 = 1;
      v53 = &OBJC_IVAR___SBDeviceStationaryMotionDetector__started;
      v79 = v245;
LABEL_42:
      int v52 = (v243 || v248) && v81;

      goto LABEL_43;
    }
    int v52 = 1;
  }
LABEL_44:
  if ([v4 phase] == 3 && (fabs(self->_velocity.x) > 1000.0 || fabs(self->_velocity.y) > 1000.0))
  {
    v82 = v53;
    uint64_t v83 = v54[256];
    if ([*(id *)((char *)&self->super.super.super.isa + v83) containsItem:self->_selectedDisplayItem])
    {
      v84 = v54;
      v85 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:*(Class *)((char *)&self->super.super.super.isa + v83)];
      [v85 stageArea];
      v86 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self switcherSettings];
      v87 = [v86 chamoisSettings];
      [v87 partiallyOffscreenWindowMargin];

      v88 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self chamoisLayoutAttributes];
      [v88 isAutoLayoutEnabled];

      v53 = v82;
      v54 = v84;
    }
    else
    {
      v53 = v82;
    }
  }
  v89 = (id *)((char *)&self->super.super.super.isa + v54[256]);
  int v90 = [*v89 containsItem:self->_selectedDisplayItem];
  if (!v52)
  {
    if (v90)
    {
      v98 = v53;
      uint64_t v99 = v53[253];
      if ([*(id *)((char *)&self->super.super.super.isa + v99) containsItem:self->_selectedDisplayItem])
      {
        id v100 = *v89;
        v252[0] = MEMORY[0x1E4F143A8];
        v252[1] = 3221225472;
        v252[2] = __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke_3;
        v252[3] = &unk_1E6AF4B38;
        v252[4] = self;
        uint64_t v101 = [v100 appLayoutWithItemsPassingTest:v252];
        id v102 = *v89;
        id *v89 = (id)v101;

        self->_proposedDestination = 3;
      }
      else
      {
        objc_storeStrong(v89, *(id *)((char *)&self->super.super.super.isa + v99));
        self->_proposedDestination = 0;
      }
      int v246 = 1;
      int v249 = 1;
      v53 = v98;
      goto LABEL_66;
    }
LABEL_58:
    if ([*v89 containsItem:self->_selectedDisplayItem])
    {
      uint64_t v103 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self appLayoutByBringingItemToFront:self->_selectedDisplayItem inAppLayout:*v89];
      id v104 = *v89;
      id *v89 = (id)v103;

      UIRectGetCenter();
      double v106 = v105;
      double v108 = v107;
      [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
      +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v106, v108, v109, v110, v111, v112);
      double v114 = v113;
      double v116 = v115;
      v117 = [*v89 layoutAttributesForItem:self->_selectedDisplayItem];
      v118 = objc_msgSend(v117, "attributesByModifyingNormalizedCenter:", v114, v116);

      uint64_t v119 = [*v89 appLayoutByModifyingLayoutAttributes:v118 forItem:self->_selectedDisplayItem];
      id v120 = *v89;
      id *v89 = (id)v119;

      int v246 = 1;
      self->_proposedDestination = 1;
    }
    else
    {
      int v246 = 0;
    }
    int v249 = 0;
    goto LABEL_66;
  }
  if (v90) {
    goto LABEL_58;
  }
  v91 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self switcherSettings];
  v92 = [v91 chamoisSettings];

  unint64_t v93 = [v92 maximumNumberOfAppsOnStage];
  v94 = [*(id *)((char *)&self->super.super.super.isa + v53[253]) allItems];
  v253[0] = MEMORY[0x1E4F143A8];
  v253[1] = 3221225472;
  v253[2] = __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke_2;
  v253[3] = &unk_1E6AF4B38;
  v253[4] = self;
  v95 = objc_msgSend(v94, "bs_filter:", v253);
  unint64_t v96 = [v95 count];

  if (v96 >= v93 && ([v92 rejectDropsWhenStageIsFull] & 1) != 0)
  {
    int v97 = 0;
  }
  else
  {
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _frameForSelectedDisplayItemAddingToStage:1];
    double v122 = v121;
    double v124 = v123;
    v125 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
    v126 = [v125 layoutAttributesForItem:self->_selectedDisplayItem];
    uint64_t v127 = [v126 isPositionSystemManaged];

    selectedDisplayItem = self->_selectedDisplayItem;
    id v129 = *v89;
    UIRectGetCenter();
    uint64_t v132 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier _appLayoutByAddingItem:toAppLayout:size:center:positionIsSystemManaged:](self, "_appLayoutByAddingItem:toAppLayout:size:center:positionIsSystemManaged:", selectedDisplayItem, v129, v127, v122, v124, v130, v131);
    id v133 = *v89;
    id *v89 = (id)v132;

    self->_proposedDestination = 2;
    int v97 = 1;
  }

  int v246 = v97;
  int v249 = v97;
LABEL_66:
  int v134 = [*v89 containsItem:self->_selectedDisplayItem];
  uint64_t v135 = v53[253];
  int v136 = [*(id *)((char *)&self->super.super.super.isa + v135) containsItem:self->_selectedDisplayItem];
  int v137 = v136;
  int v138 = v134 ^ 1;
  if (((v134 ^ 1) & 1) == 0
    && v136
    && ([*(id *)((char *)&self->super.super.super.isa + v135) allItems],
        v139 = objc_claimAutoreleasedReturnValue(),
        uint64_t v140 = [v139 count],
        v139,
        v140 == 1))
  {
    v141 = [*v89 layoutAttributesForItem:self->_selectedDisplayItem];
    v142 = [v141 attributesByModifyingPositionIsSystemManaged:0];

    uint64_t v143 = [*v89 appLayoutByModifyingLayoutAttributes:v142 forItem:self->_selectedDisplayItem];
    v144 = *v89;
    id *v89 = (id)v143;
  }
  else
  {
    if ((v134 | v137)) {
      goto LABEL_73;
    }
    v144 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
    v142 = [v144 appLayoutByModifyingLayoutAttributes:self->_initialSelectedDisplayItemLayoutAttributes forItem:self->_selectedDisplayItem];
  }

LABEL_73:
  if ((v138 | v137) == 1)
  {
    v58 = v251;
    goto LABEL_79;
  }
  v145 = [*(id *)((char *)&self->super.super.super.isa + v135) allItems];
  uint64_t v146 = [v145 count];

  if (v146 == 1)
  {
    v147 = [*(id *)((char *)&self->super.super.super.isa + v135) allItems];
    v148 = [v147 firstObject];

    v149 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:*(Class *)((char *)&self->super.super.super.isa + v135)];
    v150 = [v149 autoLayoutItemForDisplayItem:v148];

    v151 = [*(id *)((char *)&self->super.super.super.isa + v135) layoutAttributesForItem:v148];
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
    double v153 = v152;
    double v155 = v154;
    double v157 = v156;
    double v159 = v158;
    v58 = v251;
    [v251 defaultWindowSize];
    double v161 = v160;
    double v163 = v162;
    [v251 screenEdgePadding];
    objc_msgSend(v151, "userSizeBeforeOverlappingInBounds:defaultSize:screenEdgePadding:", v153, v155, v157, v159, v161, v163, v164);
    double v166 = v165;
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
    double v168 = v167;
    double v170 = v169;
    double v172 = v171;
    double v174 = v173;
    [v251 defaultWindowSize];
    double v176 = v175;
    double v178 = v177;
    [v251 screenEdgePadding];
    objc_msgSend(v151, "sizeInBounds:defaultSize:screenEdgePadding:", v168, v170, v172, v174, v176, v178, v179);
    double v181 = v180;
    if (([v150 isInDefaultPosition] & 1) != 0 || v166 > v181)
    {
      v183 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:*v89];
      v184 = [v183 autoLayoutItemForDisplayItem:self->_selectedDisplayItem];
      [v184 position];
      double v186 = v185;
      v244 = v184;
      [v184 size];
      double v188 = v187;
      v247 = v183;
      [v183 stageArea];
      double v190 = v189;
      double v192 = v191;
      [v150 position];
      double v194 = v193;
      if (v186 >= v190 + v192 * 0.5)
      {
        double v201 = v190 + v192 - v188 * 0.5;
        if (v186 < v201) {
          double v201 = v186;
        }
        double v202 = v201 - v188 * 0.5;
        [v251 stageInterItemSpacing];
        double v204 = v202 - v203;
        [v150 size];
        double v200 = v204 - v205 * 0.5;
      }
      else
      {
        double v195 = v188 * 0.5 + v190;
        if (v186 >= v195) {
          double v195 = v186;
        }
        double v196 = v188 * 0.5 + v195;
        [v251 stageInterItemSpacing];
        double v198 = v196 + v197;
        [v150 size];
        double v200 = v198 + v199 * 0.5;
      }
      id v206 = *v89;
      v207 = [v150 displayItem];
      v208 = [v206 layoutAttributesForItem:v207];

      [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
      +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v200, v194, v209, v210, v211, v212);
      v213 = objc_msgSend(v208, "attributesByModifyingNormalizedCenter:");

      id v214 = *v89;
      v215 = [v150 displayItem];
      uint64_t v216 = [v214 appLayoutByModifyingLayoutAttributes:v213 forItem:v215];
      id v217 = *v89;
      id *v89 = (id)v216;

      v59 = (void *)v250;
      v58 = v251;
      int v182 = v249;
      goto LABEL_92;
    }

LABEL_79:
    v59 = (void *)v250;
    int v182 = v249;
    if ((v246 & 1) == 0) {
      goto LABEL_80;
    }
LABEL_92:
    v218 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self displayItemLayoutAttributesCalculator];
    id v219 = *v89;
    uint64_t v220 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self switcherInterfaceOrientation];
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self floatingDockHeight];
    double v222 = v221;
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self screenScale];
    double v224 = v223;
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
    double v226 = v225;
    double v228 = v227;
    double v230 = v229;
    double v232 = v231;
    uint64_t v233 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self prefersStripHidden];
    LOBYTE(v242) = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self prefersDockHidden];
    uint64_t v234 = objc_msgSend(v218, "appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", v219, 0, 0, v220, v58, v233, v222, v224, v226, v228, v230, v232, v242, 11);
    id v235 = *v89;
    id *v89 = (id)v234;

    if (!v182) {
      goto LABEL_100;
    }
    goto LABEL_93;
  }
  v59 = (void *)v250;
  v58 = v251;
  int v182 = v249;
  if (v246) {
    goto LABEL_92;
  }
LABEL_80:
  if (v182)
  {
LABEL_93:
    v236 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:*v89];
    id v12 = v236;
    if (*v89) {
      uint64_t v237 = 3;
    }
    else {
      uint64_t v237 = 1;
    }
    [v236 setUnlockedEnvironmentMode:v237];
    [v12 setSceneUpdatesOnly:1];
    [v12 setFenceSceneUpdate:0];
    [v12 setPreventSwitcherRecencyModelUpdates:1];
    v238 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v12 gestureInitiated:1];
    v239 = SBAppendSwitcherModifierResponse(v238, v59);

    if ([(SBAppLayout *)self->_lastAppLayoutForStripCalculation containsAllItemsFromAppLayout:*v89])
    {
      v59 = v239;
    }
    else
    {
      objc_storeStrong((id *)&self->_lastAppLayoutForStripCalculation, *v89);
      v240 = [[SBInvalidateContinuousExposeIdentifiersEventResponse alloc] initWithTransitioningFromAppLayout:0 transitioningToAppLayout:0 animated:1];
      v59 = SBAppendSwitcherModifierResponse(v240, v239);
    }
    goto LABEL_99;
  }
LABEL_100:

  return v59;
}

uint64_t __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 192)];
}

BOOL __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 200) layoutRoleForItem:a2];
  return SBLayoutRoleIsValidForSplitView(v2);
}

uint64_t __78__SBContinuousExposeWindowDragDestinationSwitcherModifier_handleGestureEvent___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(*(void *)(a1 + 32) + 192)] ^ 1;
}

- (id)proposedAppLayoutForWindowDrag
{
  return self->_proposedAppLayout;
}

- (id)appLayoutByAddingAppLayout:(id)a3 toAppLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _frameForSelectedAppLayout:v7 addingToStage:0];
  double v9 = v8;
  double v11 = v10;
  id v12 = [v7 itemForLayoutRole:1];
  v13 = [v7 layoutAttributesForItem:v12];

  uint64_t v14 = [v13 isPositionSystemManaged];
  UIRectGetCenter();
  uint64_t v17 = -[SBContinuousExposeWindowDragDestinationSwitcherModifier _appLayoutByAddingItem:toAppLayout:size:center:positionIsSystemManaged:](self, "_appLayoutByAddingItem:toAppLayout:size:center:positionIsSystemManaged:", v12, v6, v14, v9, v11, v15, v16);

  return v17;
}

- (void)updateProposedAppLayoutWithAppLayout:(id)a3 andInitialAppLayout:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (![(SBAppLayout *)self->_proposedAppLayout isEqual:v9]) {
    objc_storeStrong((id *)&self->_proposedAppLayout, a3);
  }
  p_initialAppLayout = &self->_initialAppLayout;
  if (![(SBAppLayout *)*p_initialAppLayout isEqual:v7]) {
    objc_storeStrong((id *)p_initialAppLayout, a4);
  }
}

- (CGRect)_frameForSelectedAppLayout:(id)a3 addingToStage:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _anyProposedAppLayoutContainsSelectedDisplayItem];
  BOOL v8 = [(SBAppLayout *)self->_proposedAppLayout containsItem:self->_selectedDisplayItem];
  BOOL v9 = !self->_dragBeganInOtherSwitcher || !v7;
  if (v9 || v8)
  {
    double v10 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self displayItemLayoutAttributesCalculator];
    uint64_t v25 = [v6 layoutRoleForItem:self->_selectedDisplayItem];
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    uint64_t v34 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self switcherInterfaceOrientation];
    double v35 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self chamoisLayoutAttributes];
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self floatingDockHeight];
    double v37 = v36;
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self screenScale];
    double v39 = v38;
    uint64_t v40 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self prefersStripHidden];
    LOBYTE(v56) = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self prefersDockHidden];
    objc_msgSend(v10, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v25, v6, v34, v35, 1, v40, v27, v29, v31, v33, v37, v39, v56);
  }
  else
  {
    double v10 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self chamoisLayoutAttributes];
    initialSelectedDisplayItemLayoutAttributes = self->_initialSelectedDisplayItemLayoutAttributes;
    [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [v10 defaultWindowSize];
    double v21 = v20;
    double v23 = v22;
    [v10 screenEdgePadding];
    -[SBDisplayItemLayoutAttributes sizeInBounds:defaultSize:screenEdgePadding:](initialSelectedDisplayItemLayoutAttributes, "sizeInBounds:defaultSize:screenEdgePadding:", v13, v15, v17, v19, v21, v23, v24);
  }

  BOOL v41 = !self->_dragBeganInOtherSwitcher && v4;
  if (!self->_dragBeganInOtherSwitcher && !v4)
  {
    proposedAppLayout = self->_proposedAppLayout;
    if (proposedAppLayout
      && [(SBAppLayout *)proposedAppLayout containsItem:self->_selectedDisplayItem])
    {
      BOOL v41 = [(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem] ^ 1;
    }
    else
    {
      BOOL v41 = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationDelegate);
  [WeakRetained preferredCenterForSelectedItemInDestinationModifier:self clippingToInitialStageArea:v41];

  SBRectWithSize();
  UIRectCenteredAboutPoint();
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;

  double v52 = v45;
  double v53 = v47;
  double v54 = v49;
  double v55 = v51;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.CGFloat y = v53;
  result.origin.double x = v52;
  return result;
}

- (CGRect)_frameForSelectedDisplayItemAddingToStage:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBAppLayout *)self->_proposedAppLayout containsItem:self->_selectedDisplayItem])
  {
    v5 = self->_proposedAppLayout;
  }
  else
  {
    id v6 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
    v5 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self appLayoutContainingAppLayout:v6];
  }
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self _frameForSelectedAppLayout:v5 addingToStage:v3];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.CGFloat y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)_appLayoutByAddingItem:(id)a3 toAppLayout:(id)a4 size:(CGSize)a5 center:(CGPoint)a6 positionIsSystemManaged:(BOOL)a7
{
  double y = a6.y;
  double x = a6.x;
  double height = a5.height;
  double width = a5.width;
  v84[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  if ([v15 containsItem:v14])
  {
    id v16 = v15;
LABEL_8:
    double v36 = v16;
    goto LABEL_14;
  }
  if (!v15)
  {
    id v16 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self appLayoutByBringingItemToFront:v14 inAppLayout:self->_initialAppLayout];
    goto LABEL_8;
  }
  double v17 = [v15 allItems];
  double v18 = (void *)[v17 mutableCopy];

  double v72 = v18;
  [v18 addObject:v14];
  double v19 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self chamoisLayoutAttributes];
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", x, y, v20, v22, v24, v26);
  double v29 = v28;
  double v31 = v30;
  uint64_t v82 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v79 = 0u;
  double v32 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self draggingAppLayoutsForWindowDrag];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __130__SBContinuousExposeWindowDragDestinationSwitcherModifier__appLayoutByAddingItem_toAppLayout_size_center_positionIsSystemManaged___block_invoke;
  v78[3] = &unk_1E6AF4B60;
  v78[4] = self;
  double v33 = objc_msgSend(v32, "bs_firstObjectPassingTest:", v78);

  double v70 = v19;
  double v71 = v33;
  if (v33
    && (uint64_t v34 = [v33 preferredDisplayOrdinal],
        v34 != [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self displayOrdinal]))
  {
    double v37 = [v33 layoutAttributesForItem:self->_selectedDisplayItem];
    double v38 = v37;
    if (v37)
    {
      [v37 attributedSize];
    }
    else
    {
      uint64_t v77 = 0;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v74 = 0u;
    }
    long long v79 = v74;
    long long v80 = v75;
    long long v81 = v76;
    uint64_t v82 = v77;
  }
  else
  {
    [v19 defaultWindowSize];
    [v19 screenEdgePadding];
    uint64_t v66 = v35;
    SBDisplayItemAttributedSizeInfer((uint64_t)&v79, width, height, v21, v23, v25, v27);
  }
  double v39 = [SBDisplayItemLayoutAttributes alloc];
  SBDisplayItemAttributedSizeUnspecified((uint64_t)v73);
  long long v74 = v79;
  long long v75 = v80;
  long long v76 = v81;
  uint64_t v77 = v82;
  LOBYTE(v66) = a7;
  double v69 = -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](v39, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", 0, 0, 0, &v74, 0, v73, v29, v31, 0.0, 0.0, v66);
  uint64_t v40 = [v15 itemsToLayoutAttributesMap];
  BOOL v41 = (void *)[v40 mutableCopy];

  id v83 = v14;
  v84[0] = v69;
  double v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
  [v41 addEntriesFromDictionary:v42];

  v43 = [SBAppLayout alloc];
  double v44 = [v15 itemForLayoutRole:4];
  double v45 = [v15 itemForLayoutRole:3];
  uint64_t v46 = [v15 centerConfiguration];
  uint64_t v47 = [v15 environment];
  LOBYTE(v68) = [v15 isHidden];
  double v48 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v43, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v72, v44, v45, 3, v41, v46, v47, v68, [v15 preferredDisplayOrdinal]);

  double v49 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self appLayoutByBringingItemToFront:v14 inAppLayout:v48];

  double v50 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self displayItemLayoutAttributesCalculator];
  uint64_t v51 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self switcherInterfaceOrientation];
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self floatingDockHeight];
  double v53 = v52;
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self screenScale];
  double v55 = v54;
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self containerViewBounds];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  uint64_t v64 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self prefersStripHidden];
  LOBYTE(v67) = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self prefersDockHidden];
  double v36 = objc_msgSend(v50, "appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", v49, 0, 0, v51, v70, v64, v53, v55, v57, v59, v61, v63, v67, 11);

LABEL_14:
  return v36;
}

uint64_t __130__SBContinuousExposeWindowDragDestinationSwitcherModifier__appLayoutByAddingItem_toAppLayout_size_center_positionIsSystemManaged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 192)];
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4 = a3;
  v5 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self appLayouts];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __91__SBContinuousExposeWindowDragDestinationSwitcherModifier__appLayoutContainingDisplayItem___block_invoke;
  id v14 = &unk_1E6AF4B60;
  id v6 = v4;
  id v15 = v6;
  double v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &v11);

  if (!v7)
  {
    double v8 = SBLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9) {
      NSLog(&cfstr_ExpectedAnAppL.isa, v6, v11, v12, v13, v14);
    }
  }

  return v7;
}

uint64_t __91__SBContinuousExposeWindowDragDestinationSwitcherModifier__appLayoutContainingDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem
{
  uint64_t v2 = self;
  BOOL v3 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self proposedAppLayoutsForWindowDrag];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__SBContinuousExposeWindowDragDestinationSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke;
  v5[3] = &unk_1E6AF4B60;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "bs_containsObjectPassingTest:", v5);

  return (char)v2;
}

uint64_t __107__SBContinuousExposeWindowDragDestinationSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 192)];
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (SBContinuousExposeWindowDragDestinationSwitcherModifierDelegate)destinationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationDelegate);
  return (SBContinuousExposeWindowDragDestinationSwitcherModifierDelegate *)WeakRetained;
}

- (unint64_t)proposedDestination
{
  return self->_proposedDestination;
}

- (SBAppLayout)proposedAppLayout
{
  return self->_proposedAppLayout;
}

- (SBAppLayout)hoveringOverAppLayout
{
  return self->_hoveringOverAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoveringOverAppLayout, 0);
  objc_storeStrong((id *)&self->_proposedAppLayout, 0);
  objc_destroyWeak((id *)&self->_destinationDelegate);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_lastAppLayoutForStripCalculation, 0);
  objc_storeStrong((id *)&self->_initialAutoLayoutSpace, 0);
  objc_storeStrong((id *)&self->_initialSelectedDisplayItemLayoutAttributes, 0);
}

@end