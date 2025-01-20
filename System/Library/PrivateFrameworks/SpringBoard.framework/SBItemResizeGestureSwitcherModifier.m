@interface SBItemResizeGestureSwitcherModifier
- (BOOL)_isStripVisibleForCurrentAppLayout;
- (BOOL)_shouldUseSprings;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3;
- (CGRect)_convertToScreenRectFromSpaceRect:(CGRect)a3;
- (CGRect)_convertToSpaceRectFromScreenRect:(CGRect)a3;
- (CGRect)_initialScaledFrameInScreenCoordinatesForSelectedDisplayItemInAppLayout:(id)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)selectedAppLayout;
- (SBItemResizeGestureSwitcherModifier)initWithGestureID:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (id)_animationSettingsForLayout;
- (id)_responseForGestureUpdateAtGestureEnd:(BOOL)a3;
- (id)_responseForSceneSizeUpdateToSize:(CGSize)a3 center:(CGPoint)a4 sceneUpdatesOnly:(BOOL)a5;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)layoutRestrictionInfoForItem:(id)a3;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
@end

@implementation SBItemResizeGestureSwitcherModifier

- (SBItemResizeGestureSwitcherModifier)initWithGestureID:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  v3 = [(SBGestureSwitcherModifier *)&v9 initWithGestureID:a3];
  if (v3)
  {
    v4 = objc_alloc_init(SBDisplayItemLayoutGrid);
    layoutGrid = v3->_layoutGrid;
    v3->_layoutGrid = v4;

    v6 = objc_alloc_init(SBContinuousExposeAutoLayoutController);
    autoLayoutController = v3->_autoLayoutController;
    v3->_autoLayoutController = v6;
  }
  return v3;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  v6 = [(SBGestureSwitcherModifier *)&v40 handleGestureEvent:v5];
  p_location = (float64x2_t *)&self->_location;
  [v5 locationInContainerView];
  self->_location.double x = v8;
  self->_location.double y = v9;
  if ([v5 phase] == 1)
  {
    v36 = v6;
    uint64_t v10 = objc_opt_class();
    v11 = SBSafeCast(v10, v5);
    v12 = [v11 selectedAppLayout];
    if (!v12)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2 object:self file:@"SBItemResizeGestureSwitcherModifier.m" lineNumber:81 description:@"Item resize got a nil selected app layout"];
    }
    currentAppLayout = self->_currentAppLayout;
    self->_currentAppLayout = v12;
    v14 = v12;

    self->_int64_t selectedLayoutRole = [v11 selectedLayoutRole];
    self->_unint64_t selectedEdge = [v11 selectedEdge];
    p_initialFrameInScreenCoordinates = &self->_initialFrameInScreenCoordinates;
    [(SBItemResizeGestureSwitcherModifier *)self _initialScaledFrameInScreenCoordinatesForSelectedDisplayItemInAppLayout:v14];
    self->_initialFrameInScreenCoordinates.origin.double x = v16;
    self->_initialFrameInScreenCoordinates.origin.double y = v17;
    self->_initialFrameInScreenCoordinates.size.width = v18;
    self->_initialFrameInScreenCoordinates.size.height = v19;
    v20 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_currentAppLayout];
    [(SBAppLayout *)self->_currentAppLayout itemForLayoutRole:self->_selectedLayoutRole];
    v38 = v35 = v20;
    v37 = objc_msgSend(v20, "autoLayoutItemForDisplayItem:");
    self->_BOOL selectedItemWasInitiallyInDefaultPosition = [v37 isInDefaultPosition];
    CGSize size = self->_initialFrameInScreenCoordinates.size;
    self->_currentFrameForDrawingInScreenCoordinates.origin = self->_initialFrameInScreenCoordinates.origin;
    self->_currentFrameForDrawingInScreenCoordinates.CGSize size = size;
    self->_currentSceneSize = self->_initialFrameInScreenCoordinates.size;
    int64_t selectedLayoutRole = self->_selectedLayoutRole;
    v23 = self->_currentAppLayout;
    v39.receiver = self;
    v39.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    self->_currentActiveResizeCorner = [(SBItemResizeGestureSwitcherModifier *)&v39 activeCornersForTouchResizeForLayoutRole:selectedLayoutRole inAppLayout:v23];
    self->_resizeAnchor = 0;
    v24 = [(SBAppLayout *)self->_currentAppLayout allItems];

    if ((unint64_t)[v24 count] <= 1)
    {
      BOOL selectedItemWasInitiallyInDefaultPosition = self->_selectedItemWasInitiallyInDefaultPosition;

      if (selectedItemWasInitiallyInDefaultPosition) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    unint64_t v26 = self->_selectedEdge - 3;
    if (v26 <= 5) {
      self->_resizeAnchor = qword_1D8FD1B20[v26];
    }
LABEL_10:
    self->_locationEdgeAdjustment = (CGPoint)*MEMORY[0x1E4F1DAD8];
    unint64_t selectedEdge = self->_selectedEdge;
    if (selectedEdge > 8)
    {
      v28 = v35;
      v6 = v36;
    }
    else
    {
      v28 = v35;
      v6 = v36;
      if (((1 << selectedEdge) & 0x62) != 0)
      {
        double y = self->_initialFrameInScreenCoordinates.origin.y;
      }
      else
      {
        if (((1 << selectedEdge) & 0x184) == 0) {
          goto LABEL_16;
        }
        double y = self->_initialFrameInScreenCoordinates.origin.y + self->_initialFrameInScreenCoordinates.size.height;
      }
      self->_locationEdgeAdjustment.double y = y - self->_location.y;
      unint64_t selectedEdge = self->_selectedEdge;
    }
LABEL_16:
    if (selectedEdge <= 8)
    {
      if (((1 << selectedEdge) & 0xA8) != 0)
      {
        double x = p_initialFrameInScreenCoordinates->origin.x;
        goto LABEL_21;
      }
      if (((1 << selectedEdge) & 0x150) != 0)
      {
        double x = p_initialFrameInScreenCoordinates->origin.x + self->_initialFrameInScreenCoordinates.size.width;
LABEL_21:
        self->_locationEdgeAdjustment.double x = x - p_location->f64[0];
      }
    }
  }
  float64x2_t *p_location = vaddq_f64(*p_location, (float64x2_t)self->_locationEdgeAdjustment);
  v31 = -[SBItemResizeGestureSwitcherModifier _responseForGestureUpdateAtGestureEnd:](self, "_responseForGestureUpdateAtGestureEnd:", [v5 phase] == 3);
  v32 = SBAppendSwitcherModifierResponse(v31, v6);

  return v32;
}

- (id)_responseForGestureUpdateAtGestureEnd:(BOOL)a3
{
  BOOL v277 = a3;
  uint64_t v352 = *MEMORY[0x1E4F143B8];
  v343.receiver = self;
  v343.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  [(SBItemResizeGestureSwitcherModifier *)&v343 containerViewBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SBItemResizeGestureSwitcherModifier *)self chamoisLayoutAttributes];
  [v12 screenEdgePadding];
  double v281 = v13;
  [v12 maximumWindowHeightWithDock];
  double v261 = v14;
  [v12 stageInterItemSpacing];
  double v16 = v15;
  [v12 stageOcclusionDodgingPeekLength];
  double v264 = v17;
  CGFloat v18 = [v12 gridWidths];
  CGFloat v19 = [v18 firstObject];
  [v19 doubleValue];
  double v262 = v20;

  v21 = [v12 gridHeights];
  v22 = [v21 firstObject];
  [v22 doubleValue];
  double v263 = v23;

  double width = self->_initialFrameInScreenCoordinates.size.width;
  double height = self->_initialFrameInScreenCoordinates.size.height;
  UIRectGetCenter();
  double v288 = v25;
  double v285 = v26;
  uint64_t v27 = [(SBAppLayout *)self->_currentAppLayout itemForLayoutRole:self->_selectedLayoutRole];
  v28 = [SBContinuousExposeAutoLayoutConfiguration alloc];
  [(SBItemResizeGestureSwitcherModifier *)self screenScale];
  double v30 = v29;
  [(SBItemResizeGestureSwitcherModifier *)self floatingDockHeight];
  double v32 = v31;
  double v33 = v5;
  double v34 = v5;
  double v292 = v7;
  double v35 = v9;
  double v287 = v11;
  uint64_t v284 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:](v28, "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v12, v34, v7, v9, v11, v30, v32);
  v36 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_currentAppLayout];
  [v36 stageArea];
  uint64_t v38 = v37;
  double v283 = v39;
  uint64_t v41 = v40;
  double v280 = v42;
  v43 = [v36 autoLayoutItemForDisplayItem:v27];
  v290 = [(SBItemResizeGestureSwitcherModifier *)self layoutRestrictionInfoForItem:v27];
  v44 = [(SBAppLayout *)self->_currentAppLayout layoutAttributesForItem:v27];
  uint64_t v45 = [v44 contentOrientation];

  v46 = [(SBItemResizeGestureSwitcherModifier *)self switcherSettings];
  [v46 liveResizeGridRubberbandingRange];

  unint64_t resizeAnchor = self->_resizeAnchor;
  BOOL v271 = resizeAnchor == 1;
  unint64_t selectedEdge = self->_selectedEdge;
  BOOL v270 = resizeAnchor == 2;
  if (resizeAnchor == 2)
  {
    double x = self->_location.x;
    double v52 = width * 0.5 + v288;
LABEL_10:
    double v49 = v52 - x;
    double v50 = height;
    goto LABEL_11;
  }
  if (resizeAnchor == 1)
  {
    double x = v288 + width * -0.5;
    double v52 = self->_location.x;
    goto LABEL_10;
  }
  double v49 = width;
  double v50 = height;
  if (!resizeAnchor)
  {
    double v49 = width;
    if (selectedEdge <= 8)
    {
      if (((1 << selectedEdge) & 0xA8) != 0)
      {
        double v49 = v288 + v288 - self->_location.x - self->_location.x;
      }
      else
      {
        double v49 = width;
        if (((1 << selectedEdge) & 0x150) != 0) {
          double v49 = self->_location.x - (v288 - (self->_location.x - v288));
        }
      }
    }
  }
LABEL_11:
  uint64_t v267 = v45;
  double v289 = v49;
  unint64_t v266 = selectedEdge - 5;
  double v286 = v35;
  v278 = (void *)v27;
  v279 = v12;
  uint64_t v275 = v38;
  double v276 = width;
  uint64_t v274 = v41;
  unint64_t v265 = self->_selectedEdge;
  char v53 = 0;
  if (selectedEdge - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v64 = 0;
LABEL_25:
    double v61 = v50;
LABEL_30:
    double v69 = v35;
    double v59 = v33;
    double v60 = v7;
    goto LABEL_42;
  }
  if (selectedEdge > 8) {
    goto LABEL_32;
  }
  if (((1 << selectedEdge) & 0x62) != 0)
  {
    double y = self->_location.y;
    if (self->_selectedItemWasInitiallyInDefaultPosition
      && ([v36 items],
          v66 = objc_claimAutoreleasedReturnValue(),
          unint64_t v67 = [v66 count],
          v66,
          v67 < 2))
    {
      double v68 = v285 + v285 - y;
      if (v68 <= v283 + v280)
      {
        char v53 = 0;
      }
      else
      {
        char v53 = 1;
        double v68 = v283 + v280;
      }
    }
    else
    {
      double v68 = v50 * 0.5 + v285;
      char v53 = 1;
    }
    BOOL v64 = 0;
    double v61 = v68 - y;
    goto LABEL_30;
  }
  if (((1 << selectedEdge) & 0x184) == 0)
  {
LABEL_32:
    BOOL v64 = 0;
    goto LABEL_25;
  }
  double v54 = self->_location.y;
  if (self->_selectedItemWasInitiallyInDefaultPosition
    && ([v36 items],
        v55 = objc_claimAutoreleasedReturnValue(),
        unint64_t v56 = [v55 count],
        v55,
        v56 < 2))
  {
    double v57 = v285 - (v54 - v285);
    double v59 = v33;
    if (v57 >= v283)
    {
      int v58 = 0;
    }
    else
    {
      int v58 = 1;
      double v57 = v283;
    }
  }
  else
  {
    double v57 = v285 + v50 * -0.5;
    int v58 = 1;
    double v59 = v33;
  }
  double v60 = v7;
  double v61 = v54 - v57;
  if (v50 >= v287 + v281 * -2.0)
  {
    char v62 = [(SBItemResizeGestureSwitcherModifier *)self prefersDockHidden];
    double v63 = v285;
    if ((v62 & 1) == 0 && !self->_resizeAnchor)
    {
      if (v61 <= v261 && self->_selectedItemWasInitiallyInDefaultPosition)
      {
        double v63 = v261 * 0.5 + v283;
      }
      else
      {
        int v58 = 1;
        double v57 = v283;
      }
      double v285 = v63;
      double v61 = v54 - v57;
    }
  }
  char v53 = 0;
  BOOL v64 = v58 != 0;
  double v69 = v286;
LABEL_42:
  layoutGrid = self->_layoutGrid;
  uint64_t v71 = [(SBAppLayout *)self->_currentAppLayout allItems];
  uint64_t v72 = [(id)v71 count];
  [(SBItemResizeGestureSwitcherModifier *)self screenScale];
  double v74 = v73;
  v75 = [(SBItemResizeGestureSwitcherModifier *)self chamoisLayoutAttributes];
  uint64_t v76 = v72;
  v77 = v290;
  -[SBDisplayItemLayoutGrid nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](layoutGrid, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", v76, v267, v290, v75, v289, v61, v59, v60, v69, v287, v74);
  double v78 = v59;
  double v80 = v79;
  double v82 = v81;

  v83 = [(SBItemResizeGestureSwitcherModifier *)self chamoisLayoutAttributes];
  LOBYTE(v71) = [v83 isAutoLayoutEnabled];

  double v282 = v61;
  if (v71)
  {
    double v84 = v285;
    double v85 = v82;
    double v86 = v80;
  }
  else
  {
    v87 = self->_layoutGrid;
    [(SBItemResizeGestureSwitcherModifier *)self screenScale];
    double v89 = v88;
    v90 = [(SBItemResizeGestureSwitcherModifier *)self chamoisLayoutAttributes];
    -[SBDisplayItemLayoutGrid minGridSizeForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](v87, "minGridSizeForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", v267, v290, v90, v78, v292, v69, v287, v89);
    double v86 = v91;
    double v93 = v92;

    if (v86 < v289) {
      double v86 = v289;
    }
    if (v93 >= v61) {
      double v85 = v93;
    }
    else {
      double v85 = v61;
    }
    double v84 = v285;
    double v69 = v286;
  }
  v325[0] = MEMORY[0x1E4F143A8];
  v325[1] = 3221225472;
  v325[2] = __77__SBItemResizeGestureSwitcherModifier__responseForGestureUpdateAtGestureEnd___block_invoke;
  v325[3] = &unk_1E6B03ED0;
  double v327 = v288;
  double v328 = v84;
  double v329 = v78;
  double v330 = v292;
  double v331 = v69;
  double v332 = v287;
  BOOL v339 = v271;
  double v94 = v276;
  double v333 = v276;
  double v95 = height;
  double v334 = height;
  BOOL v340 = v270;
  BOOL v341 = v64;
  v325[4] = self;
  id v96 = v36;
  id v326 = v96;
  uint64_t v335 = v275;
  double v336 = v283;
  uint64_t v337 = v274;
  double v338 = v280;
  char v342 = v53;
  v97 = (void (**)(void, double, double))MEMORY[0x1D948C7A0](v325);
  if ([v290 layoutRestrictions])
  {
    double v94 = v86;
    v98 = (void *)v284;
    goto LABEL_52;
  }
  unint64_t v136 = self->_resizeAnchor;
  v98 = (void *)v284;
  if (!v136)
  {
    double v94 = v86;
    goto LABEL_52;
  }
  if (v265 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v136 == 2)
    {
      double v268 = v85;
      long long v315 = 0u;
      long long v316 = 0u;
      long long v313 = 0u;
      long long v314 = 0u;
      id v272 = v96;
      v176 = [v96 items];
      uint64_t v177 = [v176 countByEnumeratingWithState:&v313 objects:v349 count:16];
      if (v177)
      {
        uint64_t v178 = v177;
        uint64_t v179 = *(void *)v314;
        double v180 = 0.0;
        double v181 = 1.79769313e308;
        do
        {
          for (uint64_t i = 0; i != v178; ++i)
          {
            if (*(void *)v314 != v179) {
              objc_enumerationMutation(v176);
            }
            v183 = *(void **)(*((void *)&v313 + 1) + 8 * i);
            if (([v183 isEqual:v43] & 1) == 0)
            {
              [v183 position];
              double v185 = v184;
              [v183 size];
              double v187 = v16 + v185 + v186 * 0.5;
              double v188 = vabdd_f64(v187, self->_location.x);
              if (v188 < v181)
              {
                double v180 = v187;
                double v181 = v188;
              }
            }
          }
          uint64_t v178 = [v176 countByEnumeratingWithState:&v313 objects:v349 count:16];
        }
        while (v178);
      }
      else
      {
        double v180 = 0.0;
        double v181 = 1.79769313e308;
      }

      uint64_t v202 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      autoLayoutController = self->_autoLayoutController;
      if (v202 == 1) {
        [(SBContinuousExposeAutoLayoutController *)autoLayoutController validTrailingStageAreaInsetsWithConfiguration:v284];
      }
      else {
        [(SBContinuousExposeAutoLayoutController *)autoLayoutController validLeadingStageAreaInsetsWithConfiguration:v284];
      }
      long long v311 = 0u;
      long long v312 = 0u;
      long long v309 = 0u;
      long long v310 = 0u;
      id v191 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v204 = [v191 countByEnumeratingWithState:&v309 objects:v348 count:16];
      if (v204)
      {
        uint64_t v205 = v204;
        uint64_t v206 = *(void *)v310;
        v77 = v290;
        do
        {
          for (uint64_t j = 0; j != v205; ++j)
          {
            if (*(void *)v310 != v206) {
              objc_enumerationMutation(v191);
            }
            [*(id *)(*((void *)&v309 + 1) + 8 * j) doubleValue];
            double v209 = v78 + v208;
            double v210 = vabdd_f64(v209, self->_location.x);
            if (v210 < v181)
            {
              double v180 = v209;
              double v181 = v210;
            }
          }
          uint64_t v205 = [v191 countByEnumeratingWithState:&v309 objects:v348 count:16];
        }
        while (v205);
      }
      else
      {
        v77 = v290;
      }

      double v211 = vabdd_f64(v86, v289);
      if (v181 >= v16 + v264 && v181 >= v211) {
        goto LABEL_156;
      }
      double v201 = v276 * 0.5 + v288 - v180;
    }
    else
    {
      if (v136 != 1)
      {
        double v94 = v86;
        goto LABEL_158;
      }
      double v268 = v85;
      long long v323 = 0u;
      long long v324 = 0u;
      long long v321 = 0u;
      long long v322 = 0u;
      id v272 = v96;
      v137 = [v96 items];
      uint64_t v138 = [v137 countByEnumeratingWithState:&v321 objects:v351 count:16];
      if (v138)
      {
        uint64_t v139 = v138;
        uint64_t v140 = *(void *)v322;
        double v141 = 0.0;
        double v142 = 1.79769313e308;
        do
        {
          for (uint64_t k = 0; k != v139; ++k)
          {
            if (*(void *)v322 != v140) {
              objc_enumerationMutation(v137);
            }
            v144 = *(void **)(*((void *)&v321 + 1) + 8 * k);
            if (([v144 isEqual:v43] & 1) == 0)
            {
              [v144 position];
              double v146 = v145;
              [v144 size];
              double v148 = v146 + v147 * -0.5 - v16;
              double v149 = vabdd_f64(v148, self->_location.x);
              if (v149 < v142)
              {
                double v141 = v148;
                double v142 = v149;
              }
            }
          }
          uint64_t v139 = [v137 countByEnumeratingWithState:&v321 objects:v351 count:16];
        }
        while (v139);
      }
      else
      {
        double v141 = 0.0;
        double v142 = 1.79769313e308;
      }

      uint64_t v189 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      v190 = self->_autoLayoutController;
      if (v189 == 1) {
        [(SBContinuousExposeAutoLayoutController *)v190 validLeadingStageAreaInsetsWithConfiguration:v284];
      }
      else {
        [(SBContinuousExposeAutoLayoutController *)v190 validTrailingStageAreaInsetsWithConfiguration:v284];
      }
      long long v319 = 0u;
      long long v320 = 0u;
      long long v317 = 0u;
      long long v318 = 0u;
      id v191 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v192 = [v191 countByEnumeratingWithState:&v317 objects:v350 count:16];
      v77 = v290;
      if (v192)
      {
        uint64_t v193 = v192;
        uint64_t v194 = *(void *)v318;
        do
        {
          for (uint64_t m = 0; m != v193; ++m)
          {
            if (*(void *)v318 != v194) {
              objc_enumerationMutation(v191);
            }
            [*(id *)(*((void *)&v317 + 1) + 8 * m) doubleValue];
            double v197 = v78 + v286 - v196;
            double v198 = vabdd_f64(v197, self->_location.x);
            if (v198 < v142)
            {
              double v141 = v197;
              double v142 = v198;
            }
          }
          uint64_t v193 = [v191 countByEnumeratingWithState:&v317 objects:v350 count:16];
        }
        while (v193);
      }

      double v199 = vabdd_f64(v86, v289);
      BOOL v200 = v142 < v16 + v264 || v142 < v199;
      if (!v200)
      {
        double v95 = height;
        double v85 = v268;
LABEL_157:

        double v94 = v86;
        id v96 = v272;
        goto LABEL_158;
      }
      double v201 = v141 - (v288 + v276 * -0.5);
    }
    if (v201 >= v262) {
      double v86 = v201;
    }
    else {
      double v86 = v262;
    }
LABEL_156:
    double v95 = height;
    double v85 = v268;
    goto LABEL_157;
  }
LABEL_158:
  if (v266 > 0xFFFFFFFFFFFFFFFDLL)
  {
    double v85 = v95;
  }
  else
  {
    unint64_t v213 = self->_selectedEdge;
    if (v213 > 8) {
      goto LABEL_52;
    }
    id v273 = v96;
    double v269 = v85;
    if (((1 << v213) & 0x62) != 0)
    {
      long long v299 = 0u;
      long long v300 = 0u;
      long long v297 = 0u;
      long long v298 = 0u;
      v227 = [v96 items];
      uint64_t v228 = [v227 countByEnumeratingWithState:&v297 objects:v345 count:16];
      if (v228)
      {
        uint64_t v229 = v228;
        uint64_t v230 = *(void *)v298;
        double v231 = 0.0;
        double v219 = 1.79769313e308;
        do
        {
          for (uint64_t n = 0; n != v229; ++n)
          {
            if (*(void *)v298 != v230) {
              objc_enumerationMutation(v227);
            }
            v233 = *(void **)(*((void *)&v297 + 1) + 8 * n);
            if (([v233 isEqual:v43] & 1) == 0)
            {
              [v233 position];
              double v235 = v234;
              [v233 size];
              double v237 = v16 + v235 + v236 * 0.5;
              double v238 = vabdd_f64(v237, self->_location.y);
              if (v238 < v219)
              {
                double v219 = v238;
                double v231 = v237;
              }
            }
          }
          uint64_t v229 = [v227 countByEnumeratingWithState:&v297 objects:v345 count:16];
        }
        while (v229);
      }
      else
      {
        double v231 = 0.0;
        double v219 = 1.79769313e308;
      }

      long long v295 = 0u;
      long long v296 = 0u;
      long long v293 = 0u;
      long long v294 = 0u;
      v248 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController validTopStageAreaInsetsWithConfiguration:v284];
      uint64_t v249 = [v248 countByEnumeratingWithState:&v293 objects:v344 count:16];
      if (v249)
      {
        uint64_t v250 = v249;
        uint64_t v251 = *(void *)v294;
        id v96 = v273;
        double v252 = v285;
        do
        {
          for (iuint64_t i = 0; ii != v250; ++ii)
          {
            if (*(void *)v294 != v251) {
              objc_enumerationMutation(v248);
            }
            [*(id *)(*((void *)&v293 + 1) + 8 * ii) doubleValue];
            double v255 = v292 + v254;
            double v256 = vabdd_f64(v255, self->_location.y);
            if (v256 < v219)
            {
              double v219 = v256;
              double v231 = v255;
            }
          }
          uint64_t v250 = [v248 countByEnumeratingWithState:&v293 objects:v344 count:16];
        }
        while (v250);
      }
      else
      {
        id v96 = v273;
        double v252 = v285;
      }

      double v257 = v16 + v264;
      double v258 = height * 0.5 + v252 - v231;
    }
    else
    {
      if (((1 << v213) & 0x184) == 0) {
        goto LABEL_52;
      }
      long long v307 = 0u;
      long long v308 = 0u;
      long long v305 = 0u;
      long long v306 = 0u;
      v214 = [v96 items];
      uint64_t v215 = [v214 countByEnumeratingWithState:&v305 objects:v347 count:16];
      if (v215)
      {
        uint64_t v216 = v215;
        uint64_t v217 = *(void *)v306;
        double v218 = 0.0;
        double v219 = 1.79769313e308;
        do
        {
          for (juint64_t j = 0; jj != v216; ++jj)
          {
            if (*(void *)v306 != v217) {
              objc_enumerationMutation(v214);
            }
            v221 = *(void **)(*((void *)&v305 + 1) + 8 * jj);
            if (([v221 isEqual:v43] & 1) == 0)
            {
              [v221 position];
              double v223 = v222;
              [v221 size];
              double v225 = v223 + v224 * -0.5 - v16;
              double v226 = vabdd_f64(v225, self->_location.y);
              if (v226 < v219)
              {
                double v219 = v226;
                double v218 = v225;
              }
            }
          }
          uint64_t v216 = [v214 countByEnumeratingWithState:&v305 objects:v347 count:16];
        }
        while (v216);
      }
      else
      {
        double v218 = 0.0;
        double v219 = 1.79769313e308;
      }

      long long v303 = 0u;
      long long v304 = 0u;
      long long v301 = 0u;
      long long v302 = 0u;
      v239 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController validBottomStageAreaInsetsWithConfiguration:v284];
      uint64_t v240 = [v239 countByEnumeratingWithState:&v301 objects:v346 count:16];
      if (v240)
      {
        uint64_t v241 = v240;
        uint64_t v242 = *(void *)v302;
        id v96 = v273;
        double v243 = v285;
        do
        {
          for (kuint64_t k = 0; kk != v241; ++kk)
          {
            if (*(void *)v302 != v242) {
              objc_enumerationMutation(v239);
            }
            [*(id *)(*((void *)&v301 + 1) + 8 * kk) doubleValue];
            double v246 = v292 + v287 - v245;
            double v247 = vabdd_f64(v246, self->_location.y);
            if (v247 < v219)
            {
              double v219 = v247;
              double v218 = v246;
            }
          }
          uint64_t v241 = [v239 countByEnumeratingWithState:&v301 objects:v346 count:16];
        }
        while (v241);
      }
      else
      {
        id v96 = v273;
        double v243 = v285;
      }

      double v257 = v16 + v264;
      double v258 = v218 - (v243 + height * -0.5);
    }
    if (v258 < v263) {
      double v258 = v263;
    }
    BOOL v200 = v219 < v257;
    double v85 = v269;
    double v259 = vabdd_f64(v269, v282);
    if (v200 || v219 < v259) {
      double v85 = v258;
    }
    v98 = (void *)v284;
    v77 = v290;
  }
LABEL_52:
  v99 = [v96 items];
  uint64_t v100 = [v99 count];

  if (v100 == 1)
  {
    v101 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController validLeadingStageAreaInsetsWithConfiguration:v98];
    v102 = [v101 lastObject];
    [v102 doubleValue];

    v103 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController validTrailingStageAreaInsetsWithConfiguration:v98];
    v104 = [v103 lastObject];
    [v104 doubleValue];

    v105 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController validTopStageAreaInsetsWithConfiguration:v98];
    v106 = [v105 lastObject];
    [v106 doubleValue];

    v107 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController validBottomStageAreaInsetsWithConfiguration:v98];
    v108 = [v107 lastObject];
    [v108 doubleValue];

    UIRectInset();
    double v110 = v94;
    if (v94 >= v111 && v85 >= v109)
    {
      double v85 = v287;
      double v110 = v286;
    }
  }
  else
  {
    SBRectWithSize();
    v97[2](v97, v94, v85);
    UIRectCenteredAboutPoint();
    double v113 = v112;
    double v115 = v114;
    double v117 = v116;
    double v119 = v118;
    id v120 = v96;
    v121 = (void *)[v96 mutableCopy];
    v122 = [v43 displayItem];
    v123 = [v121 autoLayoutItemForDisplayItem:v122];

    objc_msgSend(v123, "setPosition:", v113 + v117 * 0.5, v115 + v119 * 0.5);
    objc_msgSend(v123, "setSize:", v117, v119);
    v124 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController spaceByPerformingAutoLayoutWithSpace:v121 previousSpace:0 configuration:v98 options:0];
    [v124 stageArea];
    double v126 = v125;
    double v128 = v127;
    v129 = [v43 displayItem];
    v130 = [v124 autoLayoutItemForDisplayItem:v129];

    [v130 position];
    double v132 = v131 - v94 * 0.5;
    unint64_t v133 = self->_resizeAnchor;
    if (v133)
    {
      if (v133 == 2)
      {
        double v135 = self->_initialFrameInScreenCoordinates.origin.x + self->_initialFrameInScreenCoordinates.size.width;
        double v134 = v126;
      }
      else
      {
        double v134 = 0.0;
        double v135 = v286;
        if (v133 == 1)
        {
          double v134 = self->_initialFrameInScreenCoordinates.origin.x;
          double v135 = v126 + v128;
        }
      }
    }
    else
    {
      double v135 = v126 + v128;
      double v134 = v126;
    }
    if (v132 >= v134) {
      double v134 = v132;
    }
    double v150 = v94 + v132;
    if (v150 >= v135) {
      double v150 = v135;
    }
    double v110 = v150 - v134;

    v77 = v290;
    id v96 = v120;
  }
  BSUIConstrainValueToIntervalWithRubberBand();
  double v152 = v151;
  BSUIConstrainValueToIntervalWithRubberBand();
  double v154 = v153;
  SBRectWithSize();
  double v155 = v85;
  v97[2](v97, v152, v154);
  UIRectCenteredAboutPoint();
  self->_currentFrameForDrawingInScreenCoordinates.origin.double x = v156;
  self->_currentFrameForDrawingInScreenCoordinates.origin.double y = v157;
  self->_currentFrameForDrawingInScreenCoordinates.size.double width = v158;
  self->_currentFrameForDrawingInScreenCoordinates.size.double height = v159;
  p_currentSceneSize = &self->_currentSceneSize;
  if (vabdd_f64(self->_currentSceneSize.width, v110) <= 1.0 && vabdd_f64(self->_currentSceneSize.height, v85) <= 1.0)
  {
    double v155 = self->_currentSceneSize.height;
    double v110 = self->_currentSceneSize.width;
    BOOL v161 = v277;
    if (!v277)
    {
      v166 = 0;
      goto LABEL_96;
    }
  }
  else
  {
    p_currentSceneSize->double width = v110;
    self->_currentSceneSize.double height = v85;
    BOOL v161 = v277;
  }
  double v162 = ((double (*)(void, double, double))v97[2])(v97, v110, v155);
  BOOL v163 = !v161;
  v165 = -[SBItemResizeGestureSwitcherModifier _responseForSceneSizeUpdateToSize:center:sceneUpdatesOnly:](self, "_responseForSceneSizeUpdateToSize:center:sceneUpdatesOnly:", v163, p_currentSceneSize->width, self->_currentSceneSize.height, v162, v164);
  v166 = SBAppendSwitcherModifierResponse(v165, 0);

  [(SBItemResizeGestureSwitcherModifier *)self newAppLayoutsGenCount];
  if (v163)
  {
LABEL_96:
    v172 = v278;
    v171 = v279;
    goto LABEL_100;
  }
  v167 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if ([(SBItemResizeGestureSwitcherModifier *)self _shouldUseSprings]) {
    uint64_t v168 = 3;
  }
  else {
    uint64_t v168 = 2;
  }
  v169 = [(SBUpdateLayoutSwitcherEventResponse *)v167 initWithOptions:30 updateMode:v168];
  v170 = SBAppendSwitcherModifierResponse(v169, v166);

  [(SBItemResizeGestureSwitcherModifier *)self continuousExposeStripProgress];
  v171 = v279;
  if (BSFloatGreaterThanFloat())
  {
    v172 = v278;
    if ([(SBItemResizeGestureSwitcherModifier *)self _isStripVisibleForCurrentAppLayout])
    {
      v173 = [[SBUpdateContinuousExposeStripsPresentationResponse alloc] initWithPresentationOptions:0 dismissalOptions:1];
      v166 = SBAppendSwitcherModifierResponse(v173, v170);
    }
    else
    {
      v166 = v170;
    }
  }
  else
  {
    v166 = v170;
    v172 = v278;
  }
  v77 = v290;
LABEL_100:
  id v174 = v166;

  return v174;
}

double __77__SBItemResizeGestureSwitcherModifier__responseForGestureUpdateAtGestureEnd___block_invoke(uint64_t a1, double a2, double a3)
{
  if (a2 >= *(double *)(a1 + 80) && a3 >= *(double *)(a1 + 88))
  {
    UIRectGetCenter();
    return v6;
  }
  else
  {
    if (*(unsigned char *)(a1 + 144))
    {
      double v3 = a2 * 0.5 + *(double *)(a1 + 48) - *(double *)(a1 + 96) * 0.5;
    }
    else
    {
      double v3 = *(double *)(a1 + 48);
      if (*(unsigned char *)(a1 + 145)) {
        double v3 = v3 + *(double *)(a1 + 96) * 0.5 - a2 * 0.5;
      }
    }
    if (*(unsigned char *)(a1 + 146))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 184))
      {
        double v4 = [*(id *)(a1 + 40) items];
        [v4 count];
      }
    }
    else if (*(unsigned char *)(a1 + 147) && *(unsigned char *)(*(void *)(a1 + 32) + 184))
    {
      double v5 = [*(id *)(a1 + 40) items];
      [v5 count];
    }
  }
  return v3;
}

- (id)_responseForSceneSizeUpdateToSize:(CGSize)a3 center:(CGPoint)a4 sceneUpdatesOnly:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  double height = a3.height;
  double width = a3.width;
  [(SBItemResizeGestureSwitcherModifier *)self containerViewBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  CGFloat v19 = [(SBAppLayout *)self->_currentAppLayout itemForLayoutRole:self->_selectedLayoutRole];
  double v20 = [(SBAppLayout *)self->_currentAppLayout layoutAttributesForItem:v19];
  v21 = [(SBItemResizeGestureSwitcherModifier *)self chamoisLayoutAttributes];
  +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", x, y, v12, v14, v16, v18);
  v22 = objc_msgSend(v20, "attributesByModifyingNormalizedCenter:");

  if (self->_selectedItemWasInitiallyInDefaultPosition)
  {
    if (self->_resizeAnchor)
    {
      double v23 = [(SBAppLayout *)self->_currentAppLayout allItems];
      BOOL v24 = (unint64_t)[v23 count] > 1;
    }
    else
    {
      BOOL v24 = 1;
    }
  }
  else
  {
    BOOL v24 = 0;
  }
  double v25 = [v22 attributesByModifyingPositionIsSystemManaged:v24];

  uint64_t v63 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  [v21 defaultWindowSize];
  [v21 screenEdgePadding];
  uint64_t v54 = v26;
  SBDisplayItemAttributedSizeInfer((uint64_t)&v60, width, height, v12, v14, v16, v18);
  long long v56 = v60;
  long long v57 = v61;
  long long v58 = v62;
  uint64_t v59 = v63;
  uint64_t v27 = objc_msgSend(v25, "attributesByModifyingAttributedSize:", &v56, v54);

  v28 = [(SBAppLayout *)self->_currentAppLayout allItems];
  unint64_t v29 = [v28 count];

  if (v29 < 2)
  {
    SBDisplayItemAttributedSizeUnspecified((uint64_t)v55);
    double v30 = (long long *)v55;
  }
  else
  {
    long long v56 = v60;
    long long v57 = v61;
    long long v58 = v62;
    uint64_t v59 = v63;
    double v30 = &v56;
  }
  double v31 = [v27 attributesByModifyingAttributedUserSizeBeforeOverlapping:v30];

  unint64_t v32 = [(SBItemResizeGestureSwitcherModifier *)self supportedSizingPoliciesForItem:v19 inAppLayout:self->_currentAppLayout];
  uint64_t v33 = SBDisplayItemSizingPolicyAllowingLargestSize(v32);
  uint64_t v34 = SBDisplayItemSizingPolicyAllowingSmallestSize(v32);
  if (v33 == 1)
  {
    v36 = [(SBItemResizeGestureSwitcherModifier *)self chamoisLayoutAttributes];
    [v36 screenEdgePadding];
    CGFloat v38 = v37;

    v64.origin.double x = v12;
    v64.origin.double y = v14;
    v64.size.double width = v16;
    v64.size.double height = v18;
    CGRectInset(v64, v38, v38);
    if ((BSFloatEqualToFloat() & 1) == 0 && !BSFloatEqualToFloat()) {
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v34 = v33;
    goto LABEL_19;
  }
  if (v33 == 2 && v18 == height && v16 == width) {
    goto LABEL_18;
  }
LABEL_19:
  double v39 = [v31 attributesByModifyingSizingPolicy:v34];

  uint64_t v40 = [(SBAppLayout *)self->_currentAppLayout appLayoutByModifyingLayoutAttributes:v39 forItem:v19];
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v40;

  double v42 = [(SBItemResizeGestureSwitcherModifier *)self appLayoutByBringingItemToFront:v19 inAppLayout:self->_currentAppLayout];
  v43 = self->_currentAppLayout;
  self->_currentAppLayout = v42;

  v44 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:self->_currentAppLayout];
  [v44 setSceneUpdatesOnly:v5];
  uint64_t v45 = [(SBItemResizeGestureSwitcherModifier *)self switcherSettings];
  int v46 = [v45 liveResizeSendsAnimatedSceneSizeUpdates];

  if (v46)
  {
    v47 = [(SBItemResizeGestureSwitcherModifier *)self _animationSettingsForLayout];
    [v44 setAnimationSettings:v47];
  }
  v48 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v44 gestureInitiated:1];
  double v49 = [(SBItemResizeGestureSwitcherModifier *)self layoutRestrictionInfoForItem:v19];
  if (([v49 layoutRestrictions] & 0xA) == 2)
  {
    if (width <= height) {
      uint64_t v50 = 1;
    }
    else {
      uint64_t v50 = 3;
    }
    v51 = [[SBSetInterfaceOrientationFromUserResizingEventResponse alloc] initWithDisplayItem:v19 desiredContentOrientation:v50];
    [(SBChainableModifierEventResponse *)v51 addChildResponse:v48];
  }
  else
  {
    v51 = v48;
  }
  double v52 = v51;

  return v52;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  BOOL v5 = [(SBSwitcherModifier *)&v21 handleSceneReadyEvent:v4];
  currentAppLayout = self->_currentAppLayout;
  double v7 = [v4 appLayout];
  LODWORD(currentAppLayout) = [(SBAppLayout *)currentAppLayout isOrContainsAppLayout:v7];

  if (currentAppLayout)
  {
    double v8 = self->_currentAppLayout;
    double v9 = [v4 appLayout];
    double v10 = [v9 itemForLayoutRole:1];
    uint64_t v11 = [(SBAppLayout *)v8 layoutRoleForItem:v10];

    int v12 = [(SBItemResizeGestureSwitcherModifier *)self isLayoutRoleContentReady:v11 inAppLayout:self->_currentAppLayout];
    double v13 = [SBUpdateLayoutSwitcherEventResponse alloc];
    if ([(SBItemResizeGestureSwitcherModifier *)self _shouldUseSprings]) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 2;
    }
    double v15 = [(SBUpdateLayoutSwitcherEventResponse *)v13 initWithOptions:32 updateMode:v14];
    double v16 = SBAppendSwitcherModifierResponse(v15, v5);

    if (v12)
    {
      UIRectGetCenter();
      CGFloat v19 = -[SBItemResizeGestureSwitcherModifier _responseForSceneSizeUpdateToSize:center:sceneUpdatesOnly:](self, "_responseForSceneSizeUpdateToSize:center:sceneUpdatesOnly:", 1, self->_currentSceneSize.width, self->_currentSceneSize.height, v17, v18);
      BOOL v5 = SBAppendSwitcherModifierResponse(v19, v16);
    }
    else
    {
      BOOL v5 = v16;
    }
  }

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  BOOL v5 = [(SBGestureSwitcherModifier *)&v7 handleTransitionEvent:v4];
  if ([v4 isGestureInitiated] && (unint64_t)objc_msgSend(v4, "phase") >= 2) {
    [(SBChainableModifier *)self setState:1];
  }

  return v5;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  if ([v11 isEqual:self->_currentAppLayout]
    && self->_selectedLayoutRole == a3
    && [(SBGestureSwitcherModifier *)self gesturePhase] >= 2)
  {
    -[SBItemResizeGestureSwitcherModifier _convertToSpaceRectFromScreenRect:](self, "_convertToSpaceRectFromScreenRect:", self->_currentFrameForDrawingInScreenCoordinates.origin.x, self->_currentFrameForDrawingInScreenCoordinates.origin.y, self->_currentFrameForDrawingInScreenCoordinates.size.width, self->_currentFrameForDrawingInScreenCoordinates.size.height);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    -[SBItemResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v24, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  }
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;

  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  BOOL v5 = [(SBItemResizeGestureSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_currentAppLayout])
  {
    [(SBItemResizeGestureSwitcherModifier *)self displayCornerRadius];
    objc_super v7 = [(SBItemResizeGestureSwitcherModifier *)self chamoisLayoutAttributes];
    [v7 stageCornerRadii];

    if ([(SBSwitcherModifier *)self appLayoutContainsFullScreenDisplayItem:v6])
    {
      BSFloatIsZero();
    }
    [(SBItemResizeGestureSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    [(SBItemResizeGestureSwitcherModifier *)&v20 cornerRadiiForIndex:a3];
  }
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;

  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isOrContainsAppLayout:self->_currentAppLayout]
    && self->_selectedLayoutRole == a3)
  {
    unint64_t currentActiveResizeCorner = self->_currentActiveResizeCorner;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    unint64_t currentActiveResizeCorner = [(SBItemResizeGestureSwitcherModifier *)&v9 activeCornersForTouchResizeForLayoutRole:a3 inAppLayout:v6];
  }

  return currentActiveResizeCorner;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  BOOL v5 = [(SBGestureSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  id v6 = (void *)[v5 mutableCopy];

  if ([v4 switcherLayoutElementType]
    || ![v4 isOrContainsAppLayout:self->_currentAppLayout])
  {
    if ([(SBItemResizeGestureSwitcherModifier *)self _shouldUseSprings]) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 2;
    }
    [v6 setUpdateMode:v10];
  }
  else
  {
    if ([(SBItemResizeGestureSwitcherModifier *)self _shouldUseSprings]) {
      uint64_t v7 = 5;
    }
    else {
      uint64_t v7 = 2;
    }
    [v6 setUpdateMode:v7];
    if ([(SBItemResizeGestureSwitcherModifier *)self _shouldUseSprings]) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 2;
    }
    [v6 setScaleUpdateMode:v8];
    objc_super v9 = [(SBItemResizeGestureSwitcherModifier *)self _animationSettingsForLayout];
    [v6 setLayoutSettings:v9];
  }
  return v6;
}

- (id)layoutRestrictionInfoForItem:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  BOOL v5 = [(SBItemResizeGestureSwitcherModifier *)&v11 layoutRestrictionInfoForItem:v4];
  uint64_t v6 = [v5 layoutRestrictions];
  if ((v6 & 0xA) != 0)
  {
    uint64_t v7 = v6;
    char v8 = [(SBItemResizeGestureSwitcherModifier *)self supportedContentInterfaceOrientationsForItem:v4];
    if ((v8 & 6) != 0 && (v8 & 0x18) != 0)
    {
      [v5 restrictedSize];
      uint64_t v9 = +[SBDisplayItemGridLayoutRestrictionInfo layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:](SBDisplayItemGridLayoutRestrictionInfo, "layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:", v7 & 0xFFFFFFFFFFFFFFF7);

      BOOL v5 = (void *)v9;
    }
  }

  return v5;
}

- (BOOL)_shouldUseSprings
{
  v2 = [(SBItemResizeGestureSwitcherModifier *)self chamoisLayoutAttributes];
  char v3 = [v2 isAutoLayoutEnabled];

  return v3;
}

- (id)_animationSettingsForLayout
{
  v2 = [(SBItemResizeGestureSwitcherModifier *)self switcherSettings];
  char v3 = [v2 chamoisSettings];
  id v4 = [v3 liveResizeDuringDragLayoutAnimationSettings];

  return v4;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isOrContainsAppLayout:self->_currentAppLayout]
    && self->_selectedLayoutRole == a3)
  {
    char v7 = [(SBItemResizeGestureSwitcherModifier *)self appLayoutContainsOnlyResizableApps:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isOrContainsAppLayout:self->_currentAppLayout])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    BOOL v5 = [(SBItemResizeGestureSwitcherModifier *)&v7 wantsSceneResizesHostedContextForAppLayout:v4];
  }

  return v5;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  id v4 = a3;
  BOOL v5 = [(SBItemResizeGestureSwitcherModifier *)&v11 topMostLayoutRolesForAppLayout:v4];
  int v6 = objc_msgSend(v4, "isEqual:", self->_currentAppLayout, v11.receiver, v11.super_class);

  if (v6)
  {
    objc_super v7 = (void *)[v5 mutableCopy];
    char v8 = [NSNumber numberWithInteger:self->_selectedLayoutRole];
    [v7 removeObject:v8];

    uint64_t v9 = [NSNumber numberWithInteger:self->_selectedLayoutRole];
    [v7 insertObject:v9 atIndex:0];

    BOOL v5 = v7;
  }
  return v5;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (CGRect)_initialScaledFrameInScreenCoordinatesForSelectedDisplayItemInAppLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBItemResizeGestureSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 indexOfObject:v4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SBItemResizeGestureSwitcherModifier *)self containerViewBounds];
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    [(SBItemResizeGestureSwitcherModifier *)&v26 frameForIndex:v6];
  }
  int64_t selectedLayoutRole = self->_selectedLayoutRole;
  SBRectWithSize();
  v25.receiver = self;
  v25.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBItemResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v25, sel_frameForLayoutRole_inAppLayout_withBounds_, selectedLayoutRole, v4);
  double v9 = v8;
  double v11 = v10;
  UIRectGetCenter();
  double v13 = v12;
  double v15 = v14;
  int64_t v16 = self->_selectedLayoutRole;
  v24.receiver = self;
  v24.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  [(SBItemResizeGestureSwitcherModifier *)&v24 scaleForLayoutRole:v16 inAppLayout:v4];
  double v18 = v9 * v17;
  double v19 = v11 * v17;

  double v20 = v13 - v18 * 0.5;
  double v21 = v15 - v19 * 0.5;
  double v22 = v18;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)_convertToSpaceRectFromScreenRect:(CGRect)a3
{
  id v4 = [(SBItemResizeGestureSwitcherModifier *)self appLayouts];
  uint64_t v5 = [v4 indexOfObject:self->_currentAppLayout];

  [(SBItemResizeGestureSwitcherModifier *)self frameForIndex:v5];
  [(SBItemResizeGestureSwitcherModifier *)self screenScale];
  UIRectIntegralWithScale();
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)_convertToScreenRectFromSpaceRect:(CGRect)a3
{
  id v4 = [(SBItemResizeGestureSwitcherModifier *)self appLayouts];
  uint64_t v5 = [v4 indexOfObject:self->_currentAppLayout];

  [(SBItemResizeGestureSwitcherModifier *)self frameForIndex:v5];
  [(SBItemResizeGestureSwitcherModifier *)self screenScale];
  UIRectIntegralWithScale();
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (BOOL)_isStripVisibleForCurrentAppLayout
{
  v2 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_currentAppLayout];
  char v3 = [v2 isStripVisible] ^ 1;

  return v3;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_currentAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoLayoutController, 0);
  objc_storeStrong((id *)&self->_layoutGrid, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
}

@end