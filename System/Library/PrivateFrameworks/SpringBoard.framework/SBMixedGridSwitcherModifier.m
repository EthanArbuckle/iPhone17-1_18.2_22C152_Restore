@interface SBMixedGridSwitcherModifier
- (BOOL)_isDoubleStackingFullScreenCards;
- (BOOL)_isIndexFullScreen:(unint64_t)a3;
- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3;
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)disableFullScreenCardScaleRounding;
- (BOOL)isIndexFullyVisible:(unint64_t)a3;
- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3;
- (BOOL)isIndexVisible:(unint64_t)a3;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)reversesFloatingCardDirection;
- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval;
- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGRect)_adjustedFrame:(CGRect)a3 forFloatingAppIndex:(unint64_t)a4;
- (CGRect)_frameForIndex:(unint64_t)a3 applyScrollViewContentOffset:(BOOL)a4;
- (CGRect)_unpaddedCoplanarFrameForIndex:(unint64_t)a3 doubleStack:(BOOL)a4 count:(unint64_t)a5 cardSize:(CGSize)a6 scale:(double)a7 contentWidth:(double)a8;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGSize)_contentSize;
- (CGSize)_fittedContentSize;
- (CGSize)_fittedFloatingContentSize;
- (CGSize)_fittedFullScreenContentSize;
- (CGSize)_minimumFullScreenContentSize;
- (CGSize)_scaledCardSizeForIndex:(unint64_t)a3;
- (CGSize)floatingCardSize;
- (CGSize)fullScreenCardSize;
- (SBMixedGridSwitcherModifier)initWithFullScreenCardSize:(CGSize)a3 floatingCardSize:(CGSize)a4;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (_NSRange)_floatingAppsStackRange;
- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3;
- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3 lastVisibleIndex:(unint64_t)a4;
- (_NSRange)rangeOfVisibleAppLayouts;
- (double)_cachedFullScreenCardScale;
- (double)_cardCornerRadiusInSwitcher;
- (double)_cardHeaderHeight;
- (double)_floatingCardScale;
- (double)_fullScreenCardScale;
- (double)_horizontalSpacing;
- (double)_verticalSpacing;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)contentViewScale;
- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3;
- (double)firstFloatingCardPeekingWidth;
- (double)minimumTranslationToKillIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)splitViewInnerCornerRadius;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)unadjustedScaleForIndex:(unint64_t)a3;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (id)_appLayoutWithPrimaryLeafAppLayout:(id)a3 sideLeafAppLayout:(id)a4 configuration:(int64_t)a5;
- (id)_cacheKeyForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)activeLeafAppLayoutsReachableByKeyboardShortcut;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)inactiveAppLayoutsReachableByKeyboardShortcut;
- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (id)scrollViewAttributes;
- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)_indexOfFirstFloatingLayoutFromAppLayouts:(id)a3;
- (unint64_t)_indexOfLeadingCard;
- (unint64_t)_numberOfFullScreenAppLayouts;
- (unint64_t)_numberOfFullScreenColumns;
- (unint64_t)_numberOfFullScreenRows;
- (unint64_t)_numberOfOffScreenTrailingFloatingCardsForContentOffset:(CGPoint)a3;
- (unint64_t)_numberOfOffScreenTrailingFullScreenCardsForContentOffset:(CGPoint)a3;
- (unint64_t)_subtreeIndexForIndex:(unint64_t)a3 indexOfFirstMainAppLayout:(unint64_t)a4;
- (unint64_t)indexOfFirstMainAppLayoutFromAppLayouts:(id)a3;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)lowDensityGridLayoutAlignment;
- (unint64_t)maximumNumberOfFullScreenCardsForSingleRow;
- (unint64_t)numberOfFloatingAppLayouts;
- (unint64_t)slideOverTongueDirection;
- (void)_invalidateCachesIfNeeded;
- (void)didMoveToParentModifier:(id)a3;
- (void)setDisableFullScreenCardScaleRounding:(BOOL)a3;
- (void)setLowDensityGridLayoutAlignment:(unint64_t)a3;
- (void)setMaximumNumberOfFullScreenCardsForSingleRow:(unint64_t)a3;
- (void)setReversesFloatingCardDirection:(BOOL)a3;
@end

@implementation SBMixedGridSwitcherModifier

- (SBMixedGridSwitcherModifier)initWithFullScreenCardSize:(CGSize)a3 floatingCardSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v6 = a3.height;
  CGFloat v7 = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)SBMixedGridSwitcherModifier;
  v8 = [(SBSwitcherModifier *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_fullScreenCardSize.CGFloat width = v7;
    v8->_fullScreenCardSize.CGFloat height = v6;
    v8->_floatingCardSize.CGFloat width = width;
    v8->_floatingCardSize.CGFloat height = height;
    v8->_maximumNumberOfFullScreenCardsForSingleRow = 0;
    v8->_lowDensityGridLayoutAlignment = 0;
    v8->_reversesFloatingCardDirection = 1;
    v8->_cachedVisibleAppsRangeIsValid = 0;
    v8->_lastAppLayoutsGenerationCount = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = objc_opt_new();
    cachedFrameForIndex = v9->_cachedFrameForIndex;
    v9->_cachedFrameForIndex = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (void)didMoveToParentModifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBMixedGridSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v8, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_gridModifier)
    {
      v5 = objc_alloc_init(SBGridSwitcherModifier);
      gridModifier = self->_gridModifier;
      self->_gridModifier = &v5->super;

      [(SBChainableModifier *)self addChildModifier:self->_gridModifier];
      CGFloat v7 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
      [(SBChainableModifier *)self addChildModifier:v7];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBMixedGridSwitcherModifier;
  v4 = [(SBChainableModifier *)&v6 copyWithZone:a3];
  *(CGSize *)(v4 + 248) = self->_fullScreenCardSize;
  *(CGSize *)(v4 + 264) = self->_floatingCardSize;
  v4[228] = self->_reversesFloatingCardDirection;
  *((void *)v4 + 29) = self->_lowDensityGridLayoutAlignment;
  *((void *)v4 + 30) = self->_maximumNumberOfFullScreenCardsForSingleRow;
  v4[130] = self->_cachedVisibleAppsRangeIsValid;
  *(_NSRange *)(v4 + 136) = self->_cachedVisibleAppsRange;
  *((void *)v4 + 23) = *(void *)&self->_cachedFullScreenCardScale;
  *((void *)v4 + 21) = self->_lastAppLayoutsGenerationCount;
  *((void *)v4 + 22) = self->_cachedIndexOfFirstMainAppLayout;
  *((void *)v4 + 23) = *(void *)&self->_cachedFullScreenCardScale;
  *((_OWORD *)v4 + 12) = self->_cachedContentSize;
  objc_storeStrong((id *)v4 + 26, self->_cachedFrameForIndex);
  *((_DWORD *)v4 + 56) = self->_cachesValidity;
  return v4;
}

- (id)handleScrollEvent:(id)a3
{
  id v4 = a3;
  self->_isScrolling = [v4 phase] == 0;
  [v4 contentOffset];
  double x = self->_previousContentOffset.x;
  if (x != 1.79769313e308 || self->_previousContentOffset.y != 1.79769313e308) {
    self->_isScrollingForward = x > v5;
  }
  self->_previousContentOffset.double x = v5;
  self->_previousContentOffset.y = v6;
  self->_cachedVisibleAppsRangeIsValid = 0;
  v11.receiver = self;
  v11.super_class = (Class)SBMixedGridSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v11 handleScrollEvent:v4];

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBMixedGridSwitcherModifier;
  double v5 = [(SBSwitcherModifier *)&v12 handleTransitionEvent:v4];
  if ([v4 toEnvironmentMode] == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
    self->_floatingConfiguration = [v4 fromFloatingConfiguration];
    if ([v4 phase] == 2
      && ![(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts]
      && [(SBMixedGridSwitcherModifier *)self numberOfFloatingAppLayouts])
    {
      CGFloat v6 = [(SBMixedGridSwitcherModifier *)self appLayouts];
      CGFloat v7 = [v6 lastObject];

      objc_super v8 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v7 alignment:0 animated:1];
      uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

      double v5 = (void *)v9;
    }
  }
  uint64_t v10 = [v4 toAppLayout];
  self->_hasForegroundFullScreenApp = v10 != 0;

  self->_isSwitcherVisible = [v4 toEnvironmentMode] == 2;
  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBMixedGridSwitcherModifier;
  uint64_t v9 = [(SBChainableModifier *)&v15 responseForProposedChildResponse:a3 childModifier:a4 event:v8];
  if (v9 && [v8 type] == 17)
  {
    uint64_t v10 = [v8 appLayout];
    if ([v10 environment] == 2 && !self->_hasForegroundFullScreenApp)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __84__SBMixedGridSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
      v13[3] = &unk_1E6AFB4C8;
      v13[4] = self;
      id v14 = v10;
      uint64_t v11 = [v9 responseByTransformingResponseWithTransformer:v13];

      uint64_t v9 = (void *)v11;
    }
  }
  return v9;
}

SBPerformTransitionSwitcherEventResponse *__84__SBMixedGridSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if ([(SBPerformTransitionSwitcherEventResponse *)v3 type] == 1)
  {
    id v4 = *(unsigned char **)(a1 + 32);
    if (v4[129])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      double v5 = [v4 appLayouts];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v40;
LABEL_5:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
          if ([v9 environment] == 1) {
            break;
          }
          if (v6 == ++v8)
          {
            uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
            if (v6) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v10 = v9;

        if (!v10) {
          goto LABEL_17;
        }
        uint64_t v11 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__20;
        v37 = __Block_byref_object_dispose__20;
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __84__SBMixedGridSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_15;
        v32[3] = &unk_1E6AFB4A0;
        v32[4] = &v33;
        [v10 enumerate:v32];
        objc_super v12 = (void *)v34[5];
        objc_super v13 = [*(id *)(a1 + 40) itemForLayoutRole:1];
        id v14 = [NSNumber numberWithInteger:3];
        [v12 setObject:v13 forKey:v14];

        objc_super v15 = [SBAppLayout alloc];
        v16 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v15, "initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v34[5], [v10 configuration], objc_msgSend(v10, "centerConfiguration"), objc_msgSend(v10, "environment"), objc_msgSend(v10, "isHidden"), objc_msgSend(*(id *)(a1 + 32), "displayOrdinal"));
        [(SBSwitcherTransitionRequest *)v11 setAppLayout:v16];
        [(SBSwitcherTransitionRequest *)v11 setAppLayoutEnvironment:1];
        uint64_t v17 = objc_opt_class();
        v18 = v3;
        if (v17)
        {
          if (objc_opt_isKindOfClass()) {
            v19 = v18;
          }
          else {
            v19 = 0;
          }
        }
        else
        {
          v19 = 0;
        }
        v28 = v19;

        v29 = [(SBPerformTransitionSwitcherEventResponse *)v28 transitionRequest];
        v30 = [v29 activatingDisplayItem];
        [(SBSwitcherTransitionRequest *)v11 setActivatingDisplayItem:v30];

        v3 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v11 gestureInitiated:0];
        _Block_object_dispose(&v33, 8);

        goto LABEL_25;
      }
LABEL_11:
    }
LABEL_17:
    id v10 = +[SBSwitcherTransitionRequest requestForActivatingHomeScreen];
    uint64_t v11 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    [(SBSwitcherTransitionRequest *)v11 setAppLayout:*(void *)(a1 + 40)];
    [(SBSwitcherTransitionRequest *)v11 setAppLayoutEnvironment:1];
    uint64_t v20 = objc_opt_class();
    v21 = v3;
    if (v20)
    {
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
    v23 = v22;

    v24 = [(SBPerformTransitionSwitcherEventResponse *)v23 transitionRequest];

    v25 = [v24 activatingDisplayItem];
    [(SBSwitcherTransitionRequest *)v11 setActivatingDisplayItem:v25];

    v26 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v10 gestureInitiated:0];
    v27 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v11 gestureInitiated:0];
    [(SBChainableModifierEventResponse *)v27 setDelay:0 withValidator:0.2];
    v3 = +[SBChainableModifierEventResponse responseByAppendingResponse:v27 toResponse:v26];

LABEL_25:
  }
  return v3;
}

void __84__SBMixedGridSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  double v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithInteger:a2];
  [v4 setObject:v6 forKey:v7];
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v7 = [(SBMixedGridSwitcherModifier *)self reversesFloatingCardDirection];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "environment", (void)v16) != 3
          && [(SBMixedGridSwitcherModifier *)self isAppLayoutMostRecentRepresentationOfDisplayItems:v13])
        {
          if ([v13 environment] == 1)
          {
            id v14 = v5;
          }
          else
          {
            id v14 = v6;
            if (v7)
            {
              [v6 insertObject:v13 atIndex:0];
              continue;
            }
          }
          [v14 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [v6 addObjectsFromArray:v5];
  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  [(SBMixedGridSwitcherModifier *)self _frameForIndex:a3 applyScrollViewContentOffset:1];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (![(SBMixedGridSwitcherModifier *)self _isIndexFullScreen:a3]) {
    -[SBMixedGridSwitcherModifier _adjustedFrame:forFloatingAppIndex:](self, "_adjustedFrame:forFloatingAppIndex:", a3, v6, v8, v10, v12);
  }
  UIRectGetCenter();
  [(SBMixedGridSwitcherModifier *)self screenScale];
  UIRectCenteredAboutPointScale();
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_adjustedFrame:(CGRect)a3 forFloatingAppIndex:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  int v10 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
  double v11 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  unint64_t v12 = [(SBMixedGridSwitcherModifier *)self _floatingAppsStackRange];
  if (!v13) {
    goto LABEL_35;
  }
  unint64_t v14 = v12;
  if (a4 < v12) {
    goto LABEL_35;
  }
  unint64_t v15 = v13;
  if (a4 - v12 >= v13) {
    goto LABEL_35;
  }
  [(SBMixedGridSwitcherModifier *)self floatingCardSize];
  double v17 = v16;
  [(SBMixedGridSwitcherModifier *)self unadjustedScaleForIndex:a4];
  double v19 = v18;
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  double v21 = v20;
  [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
  double v23 = v22;
  unint64_t v24 = [(SBMixedGridSwitcherModifier *)self _indexOfFirstFloatingLayoutFromAppLayouts:v11];
  if (v24 == a4) {
    goto LABEL_35;
  }
  unint64_t v25 = v24;
  double v26 = v17 * v19 + v21;
  unint64_t v27 = v24 - 1;
  [(SBMixedGridSwitcherModifier *)self contentOffsetForIndex:a4 alignment:0];
  double v29 = v28;
  if (v27 == a4)
  {
    double v30 = v28 - v26 + 20.0;
    if (v10) {
      double v30 = v26 + v29 + -20.0;
    }
  }
  else
  {
    unint64_t v31 = v15 - a4 + v14;
    if (v27 < v14 || v27 - v14 >= v15 || v25 < v14 || v25 - v14 >= v15)
    {
      int v32 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
      double v33 = -v26;
      if (!v32) {
        double v33 = v26;
      }
      double v30 = v29 - v33 * (double)v31;
    }
    else
    {
      double v30 = v28 + v26 * (double)v31 + -20.0;
      if (!v10) {
        double v30 = v29 - v26 * (double)v31 + 20.0;
      }
    }
  }
  if (v23 <= v30) {
    double v34 = v23;
  }
  else {
    double v34 = v30;
  }
  if (v23 >= v30) {
    double v30 = v23;
  }
  if (v10) {
    double v30 = v34;
  }
  double v35 = x - (v29 - v30);
  [(SBMixedGridSwitcherModifier *)self _frameForIndex:v25 applyScrollViewContentOffset:1];
  if (v10)
  {
    if (v35 >= x) {
      double x = v35;
    }
    if (x <= v36) {
      goto LABEL_35;
    }
LABEL_34:
    double x = v36;
    goto LABEL_35;
  }
  if (v35 < x) {
    double x = v35;
  }
  if (x < v36) {
    goto LABEL_34;
  }
LABEL_35:

  double v37 = x;
  double v38 = y;
  double v39 = width;
  double v40 = height;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.CGFloat y = v38;
  result.origin.double x = v37;
  return result;
}

- (_NSRange)_floatingAppsStackRange
{
  v3 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  unint64_t v4 = [(SBMixedGridSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = [v3 count];
  }
  if (v4 >= 4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = v4;
  }
  if (v5)
  {
    if (self->_cachedVisibleAppsRangeIsValid)
    {
      NSUInteger location = self->_cachedVisibleAppsRange.location;
    }
    else
    {
      [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
      unint64_t v7 = [(SBMixedGridSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
      uint64_t v9 = v7 == 1;
      if (v7 <= 1)
      {
        NSUInteger location = 0;
      }
      else
      {
        uint64_t v9 = 2;
        NSUInteger location = v7 - 2;
      }
      self->_cachedVisibleAppsRange.NSUInteger location = location;
      self->_cachedVisibleAppsRange.length = v8 + v9;
      self->_cachedVisibleAppsRangeIsValid = 1;
    }
  }
  else
  {
    NSUInteger location = 0;
  }

  NSUInteger v10 = location;
  NSUInteger v11 = v5;
  result.length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (double)unadjustedScaleForIndex:(unint64_t)a3
{
  if ([(SBMixedGridSwitcherModifier *)self _isIndexFullScreen:a3])
  {
    [(SBMixedGridSwitcherModifier *)self _fullScreenCardScale];
  }
  else
  {
    [(SBMixedGridSwitcherModifier *)self _floatingCardScale];
  }
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if (-[SBMixedGridSwitcherModifier _isIndexFullScreen:](self, "_isIndexFullScreen:"))
  {
    [(SBMixedGridSwitcherModifier *)self _cachedFullScreenCardScale];
  }
  else
  {
    [(SBMixedGridSwitcherModifier *)self _floatingCardScale];
    double v7 = v6;
    double v8 = v6 * 0.899999976;
    uint64_t v9 = [(SBMixedGridSwitcherModifier *)self appLayouts];
    [(SBMixedGridSwitcherModifier *)self _indexOfFirstFloatingLayoutFromAppLayouts:v9];

    [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
    double v11 = v10;
    [(SBMixedGridSwitcherModifier *)self containerViewBounds];
    double v13 = v12;
    if ([(SBMixedGridSwitcherModifier *)self isRTLEnabled]) {
      double v14 = 0.0;
    }
    else {
      double v14 = v13;
    }
    double v15 = v11 + v14;
    [(SBMixedGridSwitcherModifier *)self _frameForIndex:a3 applyScrollViewContentOffset:0];
    double x = v24.origin.x;
    double v17 = v7 * CGRectGetWidth(v24);
    [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
    double v19 = v17 + v18 * 2.0;
    if ([(SBMixedGridSwitcherModifier *)self isRTLEnabled]) {
      double v20 = v19;
    }
    else {
      double v20 = 0.0;
    }
    double v21 = x + v20;
    if ([(SBMixedGridSwitcherModifier *)self isRTLEnabled]) {
      double v22 = 0.0;
    }
    else {
      double v22 = v19;
    }
    double result = v8 + (v7 - v8) * (v15 - v21) / (x + v22 - v21);
    if (v8 >= result) {
      double result = v7 * 0.899999976;
    }
    if (v7 <= result) {
      return v7;
    }
  }
  return result;
}

- (id)visibleAppLayouts
{
  [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBMixedGridSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  uint64_t v5 = v4;
  double v6 = (void *)MEMORY[0x1E4F1CAD0];
  double v7 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  double v8 = objc_msgSend(v7, "subarrayWithRange:", v3, v5);
  uint64_t v9 = [v6 setWithArray:v8];

  return v9;
}

- (_NSRange)rangeOfVisibleAppLayouts
{
  [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
  NSUInteger v3 = [(SBMixedGridSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  result.length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  NSUInteger v3 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  NSUInteger v4 = [v3 animationSettings];

  uint64_t v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  [(SBSwitcherAnimationAttributes *)v5 setUpdateMode:1];
  [(SBSwitcherAnimationAttributes *)v5 setCornerRadiusUpdateMode:3];
  double v6 = [v4 layoutSettings];
  [(SBSwitcherAnimationAttributes *)v5 setLayoutSettings:v6];

  double v7 = [v4 opacitySettings];
  [(SBSwitcherAnimationAttributes *)v5 setOpacitySettings:v7];

  return v5;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  unint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)[v5 count] < 3)
  {
    double v11 = 0;
  }
  else
  {
    double v7 = [MEMORY[0x1E4F28E60] indexSet];
    double v8 = v7;
    if (v6)
    {
      [v7 addIndex:v6 - 1];
      if (v6 != 1) {
        [v8 addIndex:v6 - 2];
      }
    }
    if (v6 < [v5 count] - 1) {
      [v8 addIndex:v6 + 1];
    }
    if (v6 < [v5 count] - 2) {
      [v8 addIndex:v6 + 2];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    double v10 = [v5 objectsAtIndexes:v8];
    double v11 = [v9 setWithArray:v10];
  }
  return v11;
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(SBMixedGridSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5 = 1.0;
  if (!-[SBMixedGridSwitcherModifier _isIndexFullScreen:](self, "_isIndexFullScreen:"))
  {
    unint64_t v6 = [(SBMixedGridSwitcherModifier *)self appLayouts];
    unint64_t v7 = [(SBSwitcherModifier *)self indexOfFirstFloatingAppFromAppLayouts:v6];

    if (v7 != a3)
    {
      [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
      double v9 = v8;
      [(SBMixedGridSwitcherModifier *)self containerViewBounds];
      double v11 = v10;
      if ([(SBMixedGridSwitcherModifier *)self isRTLEnabled]) {
        double v12 = 0.0;
      }
      else {
        double v12 = v11;
      }
      double v13 = v9 + v12;
      [(SBMixedGridSwitcherModifier *)self _frameForIndex:a3 applyScrollViewContentOffset:0];
      double v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [(SBMixedGridSwitcherModifier *)self _floatingCardScale];
      double v23 = v22;
      v32.origin.double x = v15;
      v32.origin.CGFloat y = v17;
      v32.size.CGFloat width = v19;
      v32.size.CGFloat height = v21;
      double v24 = v23 * CGRectGetWidth(v32);
      [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
      double v26 = v24 + v25;
      double v27 = v25 * 1.5;
      if ([(SBMixedGridSwitcherModifier *)self isRTLEnabled]) {
        double v28 = v26;
      }
      else {
        double v28 = v27;
      }
      double v29 = v15 + v28;
      if ([(SBMixedGridSwitcherModifier *)self isRTLEnabled]) {
        double v30 = v27;
      }
      else {
        double v30 = v26;
      }
      return fmin(fmax((v13 - v29) / (v15 + v30 - v29) + 0.0, 0.0), 1.0);
    }
  }
  return v5;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (a3 == 4) {
    return 2;
  }
  else {
    return 1;
  }
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBMixedGridSwitcherModifier *)self _cardCornerRadiusInSwitcher];
  [(SBMixedGridSwitcherModifier *)self scaleForIndex:a3];
  SBRectCornerRadiiForRadius();
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (double)splitViewInnerCornerRadius
{
  v11.receiver = self;
  v11.super_class = (Class)SBMixedGridSwitcherModifier;
  [(SBMixedGridSwitcherModifier *)&v11 splitViewInnerCornerRadius];
  double v4 = v3;
  [(SBMixedGridSwitcherModifier *)self displayCornerRadius];
  double v6 = v5;
  if ((BSFloatIsZero() & 1) == 0)
  {
    [(SBMixedGridSwitcherModifier *)self _cardCornerRadiusInSwitcher];
    double v8 = v7;
    [(SBMixedGridSwitcherModifier *)self _cachedFullScreenCardScale];
    return v4 * (v8 / v9 / v6);
  }
  return v4;
}

- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3
{
  return [a3 environment] == 2;
}

- (id)appLayoutsToCacheSnapshots
{
  [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBMixedGridSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  uint64_t v5 = v4;
  double v6 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  uint64_t v7 = [v6 numberOfSnapshotsToCacheInSwitcher];

  BOOL isScrollingForward = self->_isScrollingForward;
  return -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v3, v5, v7, isScrollingForward);
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  if ([(SBMixedGridSwitcherModifier *)self _isDoubleStackingFullScreenCards])
  {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [(SBMixedGridSwitcherModifier *)self appLayoutsToCacheSnapshots];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__SBMixedGridSwitcherModifier_appLayoutsToCacheFullsizeSnapshots__block_invoke;
    v8[3] = &unk_1E6AFA1E0;
    id v6 = v4;
    id v9 = v6;
    double v10 = self;
    [v5 enumerateObjectsUsingBlock:v8];

    id v3 = v6;
  }
  return v3;
}

void __65__SBMixedGridSwitcherModifier_appLayoutsToCacheFullsizeSnapshots__block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7 = a2;
  if ([v7 environment] == 1) {
    [*(id *)(a1 + 32) addObject:v7];
  }
  uint64_t v6 = [*(id *)(a1 + 32) count];
  *a4 = v6 == [*(id *)(a1 + 40) maximumNumberOfFullScreenCardsForSingleRow];
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return [(SBMixedGridSwitcherModifier *)self isIndexVisible:a4];
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t result = [(SBMixedGridSwitcherModifier *)self _indexOfLeadingCard];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return result;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  id v4 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  uint64_t v5 = [v4 count];

  if (v5 < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = [(SBMixedGridSwitcherModifier *)self _indexOfLeadingCard];
  unsigned int v8 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
  if (v7 >= v5 - 1) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  return v7 - v9;
}

- (unint64_t)indexOfFirstMainAppLayoutFromAppLayouts:(id)a3
{
  id v4 = a3;
  [(SBMixedGridSwitcherModifier *)self _invalidateCachesIfNeeded];
  if (*(unsigned char *)&self->_cachesValidity)
  {
    unint64_t cachedIndexOfFirstMainAppLayout = self->_cachedIndexOfFirstMainAppLayout;
  }
  else
  {
    uint64_t v9 = 0;
    double v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__SBMixedGridSwitcherModifier_indexOfFirstMainAppLayoutFromAppLayouts___block_invoke;
    v8[3] = &unk_1E6AFB450;
    void v8[4] = &v9;
    [v4 enumerateObjectsUsingBlock:v8];
    uint64_t v5 = v10;
    self->_unint64_t cachedIndexOfFirstMainAppLayout = v10[3];
    *(unsigned char *)&self->_cachesValidity |= 1u;
    unint64_t cachedIndexOfFirstMainAppLayout = v5[3];
    _Block_object_dispose(&v9, 8);
  }

  return cachedIndexOfFirstMainAppLayout;
}

uint64_t __71__SBMixedGridSwitcherModifier_indexOfFirstMainAppLayoutFromAppLayouts___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 environment];
  if (result == 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)_indexOfFirstFloatingLayoutFromAppLayouts:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBMixedGridSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v4];
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v4 count];
    if (v7) {
      unint64_t v6 = v7 - 1;
    }
  }
  else
  {
    unint64_t v6 = v5 - 1;
  }

  return v6;
}

- (unint64_t)numberOfFloatingAppLayouts
{
  id v3 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  unint64_t v4 = [(SBMixedGridSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = [v3 count];
  }

  return v4;
}

- (BOOL)isIndexVisible:(unint64_t)a3
{
  [(SBMixedGridSwitcherModifier *)self _frameForIndex:a3 applyScrollViewContentOffset:1];
  [(SBMixedGridSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  double v13 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  [v13 switcherCardShadowRadius];
  double v15 = v14;

  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  CGRect v23 = CGRectInset(v22, v15 * -2.8, v15 * -2.8);
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v10;
  uint64_t v19 = v12;
  return CGRectIntersectsRect(v23, *(CGRect *)&v16);
}

- (BOOL)isIndexFullyVisible:(unint64_t)a3
{
  [(SBMixedGridSwitcherModifier *)self _frameForIndex:a3 applyScrollViewContentOffset:1];
  [(SBMixedGridSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  double v13 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  [v13 switcherCardShadowRadius];
  double v15 = v14;

  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  CGRect v23 = CGRectInset(v22, v15 * -2.8, v15 * -2.8);
  uint64_t v16 = v6;
  uint64_t v17 = v8;
  uint64_t v18 = v10;
  uint64_t v19 = v12;
  return CGRectContainsRect(v23, *(CGRect *)&v16);
}

- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isCenterOverFull])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMixedGridSwitcherModifier;
    BOOL v5 = [(SBMixedGridSwitcherModifier *)&v7 shouldTetherItemsAndAccessoriesInAppLayout:v4];
  }

  return v5;
}

- (double)firstFloatingCardPeekingWidth
{
  v2 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  [v2 spacingBetweenLeadingEdgeAndIcon];
  double v4 = v3;
  [v2 iconSideLength];
  double v6 = v4 + v5;
  [v2 spacingBetweenLeadingEdgeAndIcon];
  double v8 = v6 + v7 * 2.0;

  return v8;
}

- (unint64_t)_indexOfLeadingCard
{
  int v3 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
  [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v4 = [(SBMixedGridSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = v4;
  [(SBSwitcherModifier *)self scaledFrameForIndex:v4];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  v20.origin.double x = v8;
  v20.origin.CGFloat y = v10;
  v20.size.CGFloat width = v12;
  v20.size.CGFloat height = v14;
  if (!CGRectIntersectsRect(v19, v20))
  {
    if (v6) {
      int v15 = v3;
    }
    else {
      int v15 = 0;
    }
    if (v15 == 1)
    {
      --v6;
    }
    else if ((v3 & 1) == 0)
    {
      uint64_t v17 = [(SBMixedGridSwitcherModifier *)self appLayouts];
      BOOL v18 = v6 < [v17 count] - 1;

      v6 += v18;
    }
  }
  return v6;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  id v4 = a3;
  return v4;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v3 = a3;
  return v3;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (objc_msgSend(a4, "environment", a3) == 1)
  {
    [(SBMixedGridSwitcherModifier *)self _fullScreenCardScale];
  }
  else
  {
    [(SBMixedGridSwitcherModifier *)self _floatingCardScale];
  }
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  if (objc_msgSend(a3, "environment", a4) == 1)
  {
    [(SBMixedGridSwitcherModifier *)self _fullScreenCardScale];
  }
  else
  {
    [(SBMixedGridSwitcherModifier *)self _floatingCardScale];
  }
  return result;
}

- (id)scrollViewAttributes
{
  id v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  [(SBMixedGridSwitcherModifier *)self _contentSize];
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  [(SBSwitcherScrollViewAttributes *)v3 setDecelerationRate:*MEMORY[0x1E4F43CE0]];
  [(SBSwitcherScrollViewAttributes *)v3 setScrollViewPagingEnabled:0];
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(SBSwitcherScrollViewAttributes *)v3 setInterpolatesDuringSwipeToKill:0];
  return v3;
}

- (double)_cardCornerRadiusInSwitcher
{
  [(SBMixedGridSwitcherModifier *)self displayCornerRadius];
  BOOL v3 = v2 <= 0.0;
  double result = 7.0;
  if (!v3) {
    return 10.0;
  }
  return result;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  -[SBMixedGridSwitcherModifier frameForIndex:](self, "frameForIndex:");
  [(SBMixedGridSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  return CGRectGetMinY(*(CGRect *)&v5);
}

- (CGSize)_contentSize
{
  [(SBMixedGridSwitcherModifier *)self _invalidateCachesIfNeeded];
  if ((*(unsigned char *)&self->_cachesValidity & 4) != 0)
  {
    double width = self->_cachedContentSize.width;
    double height = self->_cachedContentSize.height;
  }
  else
  {
    [(SBMixedGridSwitcherModifier *)self _fittedContentSize];
    double v4 = v3;
    double v6 = v5;
    [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
    double width = v4 + v7 * 2.0;
    [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat v11 = v18.size.width;
    CGFloat v12 = v18.size.height;
    double v13 = CGRectGetWidth(v18);
    if (width < v13) {
      double width = v13;
    }
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.double width = v11;
    v19.size.double height = v12;
    double v14 = CGRectGetHeight(v19);
    if (v6 >= v14) {
      double height = v6;
    }
    else {
      double height = v14;
    }
    self->_cachedContentSize.double width = width;
    self->_cachedContentSize.double height = height;
    *(unsigned char *)&self->_cachesValidity |= 4u;
  }
  double v16 = width;
  result.double height = height;
  result.double width = v16;
  return result;
}

- (CGSize)_fittedContentSize
{
  [(SBMixedGridSwitcherModifier *)self _fittedFullScreenContentSize];
  double v4 = v3;
  [(SBMixedGridSwitcherModifier *)self _fittedFloatingContentSize];
  double v6 = v5;
  [(SBMixedGridSwitcherModifier *)self _minimumFullScreenContentSize];
  double v8 = v7;
  char IsZero = BSFloatIsZero();
  double v10 = 0.0;
  if ((IsZero & 1) == 0) {
    [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  }
  if (v4 >= v8) {
    double v11 = v4;
  }
  else {
    double v11 = v8;
  }
  double v12 = v6 + v11 + v10;
  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  double v14 = v13;
  double v15 = v12;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (CGSize)_fittedFullScreenContentSize
{
  unint64_t v3 = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts];
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  double v5 = v4;
  unint64_t v6 = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenColumns];
  double width = self->_fullScreenCardSize.width;
  [(SBMixedGridSwitcherModifier *)self _fullScreenCardScale];
  if (v3) {
    double v9 = -(v5 - (double)v6 * (v5 + width * v8));
  }
  else {
    double v9 = 0.0;
  }
  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  double v11 = v10;
  double v12 = v9;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (CGSize)_fittedFloatingContentSize
{
  unint64_t v3 = [(SBMixedGridSwitcherModifier *)self numberOfFloatingAppLayouts];
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  double v5 = v4;
  unint64_t v6 = [(SBMixedGridSwitcherModifier *)self _numberOfFloatingColumns];
  double width = self->_floatingCardSize.width;
  [(SBMixedGridSwitcherModifier *)self _floatingCardScale];
  if (v3) {
    double v9 = -(v5 - (double)v6 * (v5 + width * v8));
  }
  else {
    double v9 = 0.0;
  }
  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  double v11 = v10;
  double v12 = v9;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (CGSize)_minimumFullScreenContentSize
{
  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double v7 = CGRectGetWidth(v14);
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  double v9 = v7 + v8 * -2.0;
  if ([(SBMixedGridSwitcherModifier *)self numberOfFloatingAppLayouts])
  {
    [(SBMixedGridSwitcherModifier *)self firstFloatingCardPeekingWidth];
    double v9 = v9 - v10;
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v15);
  double v12 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v12;
  return result;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  int v7 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
  [(SBMixedGridSwitcherModifier *)self _contentSize];
  double v9 = v8;
  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  double v11 = v10;
  [(SBMixedGridSwitcherModifier *)self _scaledCardSizeForIndex:a3];
  double v13 = v12;
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  double v15 = v14;
  [(SBMixedGridSwitcherModifier *)self _frameForIndex:a3 applyScrollViewContentOffset:0];
  [(SBMixedGridSwitcherModifier *)self unadjustedScaleForIndex:a3];
  SBTransformedRectWithScale();
  double v20 = v19;
  double v21 = 0.0;
  double v22 = v13 + v15;
  switch(a4)
  {
    case 0:
      if (v7) {
        double v21 = -v15;
      }
      else {
        double v21 = v13 + v15;
      }
      CGRect v23 = [(SBMixedGridSwitcherModifier *)self appLayouts];
      uint64_t v24 = [(SBMixedGridSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v23];
      if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v24 = [v23 count];
      }
      double v25 = [v23 objectAtIndex:a3];
      uint64_t v26 = [(SBMixedGridSwitcherModifier *)self keyboardFocusedAppLayout];
      double v27 = (void *)v26;
      if (a3 && (void *)v26 == v25 && v24 - 1 > a3 && [v25 environment] == 2)
      {
        int v28 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
        double v29 = 20.0;
        if (v28) {
          double v29 = -20.0;
        }
        double v21 = v21 + v29;
      }

      break;
    case 1:
      double v30 = v22 - v11;
      if (v7) {
        double v21 = v30;
      }
      else {
        double v21 = v11 - v15;
      }
      break;
    case 2:
      double v31 = -(v15 + v22);
      double v32 = v22 + v22;
      if (v7) {
        double v21 = v31;
      }
      else {
        double v21 = v32;
      }
      break;
    case 3:
      if (v7)
      {
        double v33 = v20;
        double Width = CGRectGetWidth(*(CGRect *)(&v16 - 1));
        [(SBMixedGridSwitcherModifier *)self firstFloatingCardPeekingWidth];
        double v21 = Width - v35;
      }
      else
      {
        [(SBMixedGridSwitcherModifier *)self firstFloatingCardPeekingWidth];
        double v21 = v36;
      }
      break;
    default:
      break;
  }
  if (v7) {
    double v37 = 0.0;
  }
  else {
    double v37 = v11;
  }
  double v38 = fmax(v20 + v21 - v37, 0.0);
  if (v9 - v11 <= v38) {
    double v38 = v9 - v11;
  }
  double v39 = 0.0;
  result.CGFloat y = v39;
  result.CGFloat x = v38;
  return result;
}

- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts];
    unint64_t v9 = [(SBMixedGridSwitcherModifier *)self numberOfFloatingAppLayouts];
    if ([(SBMixedGridSwitcherModifier *)self isRTLEnabled])
    {
      unint64_t v10 = -[SBMixedGridSwitcherModifier _numberOfOffScreenTrailingFloatingCardsForContentOffset:](self, "_numberOfOffScreenTrailingFloatingCardsForContentOffset:", x, y);
      if (v10 == v9)
      {
        double v11 = x;
        if (v8 && v9)
        {
          [(SBMixedGridSwitcherModifier *)self _fittedFloatingContentSize];
          double v13 = v12;
          [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
          double v11 = x - (v13 + v14);
        }
        unint64_t v10 = -[SBMixedGridSwitcherModifier _numberOfOffScreenTrailingFullScreenCardsForContentOffset:](self, "_numberOfOffScreenTrailingFullScreenCardsForContentOffset:", v10, v11, y)+ v9;
      }
    }
    else
    {
      unint64_t v17 = -[SBMixedGridSwitcherModifier _numberOfOffScreenTrailingFullScreenCardsForContentOffset:](self, "_numberOfOffScreenTrailingFullScreenCardsForContentOffset:", x, y);
      if (v17 == v8)
      {
        if (v8)
        {
          [(SBMixedGridSwitcherModifier *)self _fittedFullScreenContentSize];
          double v19 = v18;
          [(SBMixedGridSwitcherModifier *)self _minimumFullScreenContentSize];
          if (v19 < v20) {
            double v19 = v20;
          }
        }
        else
        {
          [(SBMixedGridSwitcherModifier *)self _minimumFullScreenContentSize];
          double v19 = v21;
        }
        [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
        unint64_t v17 = -[SBMixedGridSwitcherModifier _numberOfOffScreenTrailingFloatingCardsForContentOffset:](self, "_numberOfOffScreenTrailingFloatingCardsForContentOffset:", x - (v19 + v22), y)+ v8;
      }
      unint64_t v10 = v7 + ~v17;
    }
    NSUInteger v15 = -[SBMixedGridSwitcherModifier _visibleAppLayoutRangeForContentOffset:lastVisibleIndex:](self, "_visibleAppLayoutRangeForContentOffset:lastVisibleIndex:", v10, x, y);
  }
  else
  {
    NSUInteger v15 = 0;
    NSUInteger v16 = 0;
  }
  result.length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBMixedGridSwitcherModifier;
  id v5 = a4;
  unsigned __int8 v6 = [(SBMixedGridSwitcherModifier *)&v10 shouldSuppressHighlightEffectForLayoutRole:a3 inAppLayout:v5];
  char v7 = objc_msgSend(v5, "isCenterOverSplit", v10.receiver, v10.super_class);

  if (a3 == 4) {
    char v8 = 0;
  }
  else {
    char v8 = v7;
  }
  return v8 | v6;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SBMixedGridSwitcherModifier;
  id v7 = a4;
  LOBYTE(a5) = [(SBMixedGridSwitcherModifier *)&v10 isLayoutRoleKillable:a3 inAppLayout:v7 atIndex:a5];
  char v8 = objc_msgSend(v7, "isCenterOverSplit", v10.receiver, v10.super_class);

  return ((a3 == 4) | ~v8) & a5;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 1;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBMixedGridSwitcherModifier *)self isSplitViewSupported])
  {
    id v7 = [v6 itemForLayoutRole:4];
    BOOL v8 = v7 == 0;

    unint64_t v9 = [v6 itemForLayoutRole:a3];
    objc_super v10 = [v9 bundleIdentifier];
    char v11 = [v10 isEqualToString:@"com.apple.PrintKit.Print-Center"];

    BOOL v12 = v8 & ~v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_cacheKeyForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld-%p", a3, a4);
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  [(SBMixedGridSwitcherModifier *)self scaleForIndex:a3];
  return 1.0 / v3;
}

- (id)_appLayoutWithPrimaryLeafAppLayout:(id)a3 sideLeafAppLayout:(id)a4 configuration:(int64_t)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  unint64_t v9 = [a3 itemForLayoutRole:1];
  objc_super v10 = [v8 itemForLayoutRole:1];

  char v11 = [NSNumber numberWithInteger:1];
  v16[0] = v11;
  v17[0] = v9;
  BOOL v12 = [NSNumber numberWithInteger:2];
  v16[1] = v12;
  v17[1] = v10;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  double v14 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v13 configuration:a5 environment:1 preferredDisplayOrdinal:[(SBMixedGridSwitcherModifier *)self displayOrdinal]];
  return v14;
}

- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  v163 = [v9 leafAppLayoutForRole:a3];
  [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
  unint64_t v10 = [(SBMixedGridSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  uint64_t v12 = v11;
  uint64_t v13 = [(SBMixedGridSwitcherModifier *)self switcherInterfaceOrientation];
  double v14 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  uint64_t v15 = [v14 indexOfObject:v9];

  [(SBSwitcherModifier *)self scaledFrameForLayoutRole:a3 inAppLayout:v9 atIndex:v15];
  double v151 = v16;
  double v152 = v17;
  double v19 = v18;
  double v21 = v20;
  double v23 = *MEMORY[0x1E4F1DB28];
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double rect = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  int64_t v146 = a3;
  id v159 = v9;
  v160 = [[SBSwitcherDropRegionContext alloc] initWithDraggingLayoutRole:a3 inAppLayout:v9];
  double v25 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  unint64_t v26 = [(SBSwitcherModifier *)self indexOfFirstFloatingAppFromAppLayouts:v25];

  double v149 = v21;
  double v150 = v19;
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v27 = 0;
    int v28 = 0;
    uint64_t v29 = 0;
  }
  else
  {
    double v153 = v23;
    double v30 = v22;
    double v31 = height;
    double v32 = [(SBMixedGridSwitcherModifier *)self appLayouts];
    unint64_t v33 = [(SBMixedGridSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v32];

    [(SBSwitcherModifier *)self scaledFrameForIndex:v33];
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    if (([(SBMixedGridSwitcherModifier *)self isRTLEnabled] & 1) == 0)
    {
      v167.origin.double x = v35;
      v167.origin.double y = v37;
      v167.size.CGFloat width = v39;
      v167.size.double height = v41;
      if (x > CGRectGetMaxX(v167)) {
        goto LABEL_7;
      }
    }
    if (![(SBMixedGridSwitcherModifier *)self isRTLEnabled]
      || (v168.origin.double x = v35,
          v168.origin.double y = v37,
          v168.size.CGFloat width = v39,
          v168.size.double height = v41,
          x >= CGRectGetMinX(v168)))
    {
      uint64_t v27 = 0;
      int v28 = 0;
      uint64_t v29 = 0;
      double v21 = v149;
      double v19 = v150;
      double height = v31;
      double v22 = v30;
      double v23 = v153;
    }
    else
    {
LABEL_7:
      long long v42 = [(SBMixedGridSwitcherModifier *)self appLayouts];
      uint64_t v43 = [v42 objectAtIndex:v26];

      unint64_t v44 = v26;
      int v28 = (void *)v43;
      uint64_t v29 = 1;
      [(SBSwitcherModifier *)self scaledFrameForIndex:v44];
      double v23 = v45;
      double v22 = v46;
      double rect = v47;
      double height = v48;
      uint64_t v27 = SBEffectiveAppLayoutConfigurationForInterfaceOrientation([v28 configuration], v13);
      double v21 = v149;
      double v19 = v150;
    }
  }
  uint64_t v49 = 1;
  if (v10 < v10 + v12 && !v28)
  {
    double v154 = v23;
    double v143 = height;
    uint64_t v147 = v29;
    uint64_t v50 = v12;
    unint64_t v51 = v10;
    while (1)
    {
      v52 = [(SBMixedGridSwitcherModifier *)self appLayouts];
      v53 = [v52 objectAtIndex:v51];

      [(SBMixedGridSwitcherModifier *)self frameForIndex:v51];
      [(SBMixedGridSwitcherModifier *)self scaleForIndex:v51];
      SBTransformedRectWithScale();
      CGFloat v54 = v169.origin.x;
      CGFloat v55 = v169.origin.y;
      CGFloat width = v169.size.width;
      double height = v169.size.height;
      v165.double x = x;
      v165.double y = y;
      if (CGRectContainsPoint(v169, v165)) {
        break;
      }

      ++v51;
      if (!--v50)
      {
        int v28 = 0;
        char v57 = 1;
        uint64_t v58 = 0;
        v60 = v159;
        v59 = v160;
        double v19 = v150;
        double v61 = v151;
        double v21 = v149;
        goto LABEL_58;
      }
    }
    id v62 = v53;
    uint64_t v27 = SBEffectiveAppLayoutConfigurationForInterfaceOrientation([v62 configuration], v13);
    if ([v62 environment] == 2)
    {
      uint64_t v49 = 1;
      double rect = width;
      double v22 = v55;
      double v23 = v54;
      uint64_t v58 = 0;
      v60 = v159;
      int v28 = v62;
      uint64_t v29 = 1;
    }
    else
    {
      v60 = v159;
      if ([v62 environment] != 1)
      {
        uint64_t v49 = 1;
        uint64_t v58 = 0;
        int v28 = v62;
        uint64_t v29 = v147;
        double v21 = v149;
        double v19 = v150;
        double height = v143;
        double v23 = v154;
LABEL_47:

        goto LABEL_48;
      }
      uint64_t v63 = [(SBMixedGridSwitcherModifier *)self appLayouts];
      unint64_t v64 = [(SBMixedGridSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v63];

      LOBYTE(v63) = [(SBMixedGridSwitcherModifier *)self _subtreeIndexForIndex:v51 indexOfFirstMainAppLayout:v64];
      unsigned int v65 = ![(SBMixedGridSwitcherModifier *)self _isDoubleStackingFullScreenCards];
      if (v63) {
        uint64_t v49 = v65;
      }
      else {
        uint64_t v49 = 1;
      }
      if ([v62 isSplitConfiguration])
      {
        id v66 = v62;
      }
      else
      {
        id v66 = [(SBMixedGridSwitcherModifier *)self _appLayoutWithPrimaryLeafAppLayout:v163 sideLeafAppLayout:v62 configuration:3];
      }
      id v67 = v66;
      -[SBSwitcherModifier scaledFrameForLayoutRole:inAppLayout:atIndex:](self, "scaledFrameForLayoutRole:inAppLayout:atIndex:");
      CGFloat v69 = v68;
      CGFloat v71 = v70;
      CGFloat v73 = v72;
      double height = v74;
      v141 = v67;
      -[SBSwitcherModifier scaledFrameForLayoutRole:inAppLayout:atIndex:](self, "scaledFrameForLayoutRole:inAppLayout:atIndex:");
      double v76 = v75;
      double v148 = v77;
      double v142 = v79;
      double v144 = v78;
      v170.origin.double x = v69;
      v170.origin.double y = v71;
      v170.size.CGFloat width = v73;
      v170.size.double height = height;
      v166.double x = x;
      v166.double y = y;
      BOOL v80 = CGRectContainsPoint(v170, v166);
      uint64_t v81 = 1;
      if (!v80) {
        uint64_t v81 = 2;
      }
      uint64_t v155 = v81;
      v161 = v62;
      if ([v62 isSplitConfiguration]
        && [v62 isOrContainsAppLayout:v163]
        && v155 != v146)
      {
        v140 = [v62 appLayoutByModifyingConfiguration:v27];
        v82 = [v140 flippedAppLayout];
        [(SBSwitcherModifier *)self scaledFrameForLayoutRole:1 inAppLayout:v82 atIndex:v51];
        CGFloat v69 = v83;
        CGFloat v71 = v84;
        CGFloat v73 = v85;
        double height = v86;
        [(SBSwitcherModifier *)self scaledFrameForLayoutRole:2 inAppLayout:v82 atIndex:v51];
        double v76 = v87;
        double v148 = v88;
        double v142 = v90;
        double v144 = v89;
      }
      int v28 = v161;
      uint64_t v58 = v155;
      if ([v161 isSplitConfiguration]) {
        uint64_t v29 = v155;
      }
      else {
        uint64_t v29 = 1;
      }
      if (v155 != 1) {
        double height = v142;
      }
      CGFloat v91 = v144;
      if (v155 == 1) {
        CGFloat v91 = v73;
      }
      double rect = v91;
      double v92 = v76;
      if (v155 == 1) {
        double v22 = v71;
      }
      else {
        double v22 = v148;
      }
      if (v155 == 1) {
        double v23 = v69;
      }
      else {
        double v23 = v92;
      }
    }
    double v21 = v149;
    double v19 = v150;
    goto LABEL_47;
  }
  uint64_t v58 = 0;
  v60 = v159;
LABEL_48:
  uint64_t v147 = v29;
  if (v28)
  {
    if (!v29)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      v135 = uint64_t v134 = v58;
      [v135 handleFailureInMethod:a2 object:self file:@"SBMixedGridSwitcherModifier.m" lineNumber:1135 description:@"intersectingLayoutRole should not be undefined"];

      uint64_t v58 = v134;
    }
    v171.origin.double x = v23;
    v171.origin.double y = v22;
    v171.size.CGFloat width = rect;
    v171.size.double height = height;
    if (CGRectIsEmpty(v171))
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      v137 = uint64_t v136 = v58;
      [v137 handleFailureInMethod:a2 object:self file:@"SBMixedGridSwitcherModifier.m" lineNumber:1136 description:@"targetRect should not have an empty size"];

      uint64_t v58 = v136;
    }
    if (!v27)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      v139 = uint64_t v138 = v58;
      [v139 handleFailureInMethod:a2 object:self file:@"SBMixedGridSwitcherModifier.m" lineNumber:1137 description:@"intersectingLayoutRoleConfiguration should not be undefined"];

      uint64_t v58 = v138;
    }
    v59 = v160;
    [(SBSwitcherDropRegionContext *)v160 setIntersectingAppLayout:v28];
    [(SBSwitcherDropRegionContext *)v160 setIntersectingLayoutRole:v29];
    -[SBSwitcherDropRegionContext setScaledIntersectingAppLayoutSize:](v160, "setScaledIntersectingAppLayoutSize:", rect, height);
    SBTransformedSizeWithScale();
    [(SBSwitcherDropRegionContext *)v160 setUnscaledIntersectingAppLayoutSize:"setUnscaledIntersectingAppLayoutSize:"];
    [(SBSwitcherDropRegionContext *)v160 setIntersectingAppLayoutConfiguration:v27];
    [(SBSwitcherDropRegionContext *)v160 setIntersectingAppLayoutIsOnFirstRow:v49];
    -[SBSwitcherDropRegionContext setTargetRect:](v160, "setTargetRect:", v23, v22, rect, height);
    char v57 = 0;
  }
  else
  {
    char v57 = 1;
    v59 = v160;
  }
  double v61 = v151;
LABEL_58:
  -[SBSwitcherDropRegionContext setOriginRect:](v59, "setOriginRect:", v61, v19, v152, v21);
  uint64_t v156 = v58;
  if ([v60 configuration] == 1) {
    uint64_t v93 = 1;
  }
  else {
    uint64_t v93 = v58;
  }
  v162 = v28;
  v94 = [v28 itemForLayoutRole:v93];
  v95 = [v94 uniqueIdentifier];
  v96 = [v163 itemForLayoutRole:1];
  v97 = [v96 uniqueIdentifier];
  int v98 = [v95 isEqualToString:v97];

  if (v57 & 1) != 0 || (v98)
  {
    if (v57)
    {
      if (v98) {
        unint64_t v102 = 1;
      }
      else {
        unint64_t v102 = 2;
      }
      goto LABEL_73;
    }
    BOOL recta = 0;
    int v101 = 1;
    v99 = v162;
  }
  else
  {
    v99 = v162;
    v100 = [v162 itemForLayoutRole:4];

    if (v100)
    {
      BOOL recta = 0;
      int v101 = 1;
    }
    else
    {
      int v101 = 0;
      BOOL recta = [v162 environment] == 2;
    }
  }
  v103 = [v99 leafAppLayoutForRole:1];
  v104 = [v103 itemForLayoutRole:1];
  int v105 = [(SBMixedGridSwitcherModifier *)self displayItemSupportsMedusa:v104];

  v106 = [v163 itemForLayoutRole:1];
  int v107 = [(SBMixedGridSwitcherModifier *)self displayItemSupportsMedusa:v106];

  if (v98)
  {
    unint64_t v102 = 1;
LABEL_73:
    v108 = v159;
    v109 = v160;
    goto LABEL_81;
  }
  int v110 = v101 | v107 ^ 1 | v105 ^ 1;
  if (v110) {
    unint64_t v102 = 7;
  }
  else {
    unint64_t v102 = 6;
  }
  v108 = v159;
  v109 = v160;
  if (((v110 | recta) & 1) == 0)
  {
    if (v156 == 1) {
      unint64_t v102 = 4;
    }
    else {
      unint64_t v102 = 5;
    }
  }
LABEL_81:
  BOOL v111 = ([v108 isSplitConfiguration] & 1) == 0 && objc_msgSend(v108, "environment") != 2;
  v112 = v162;
  if (v102 == 2 && !v111)
  {
    v113 = [(SBMixedGridSwitcherModifier *)self appLayouts];
    [v113 indexOfObject:v108];

    if (v10 >= v10 + v12)
    {
      unint64_t v102 = 3;
    }
    else
    {
      double v114 = 9.22337204e18;
      unint64_t v102 = 3;
      do
      {
        v115 = [(SBMixedGridSwitcherModifier *)self appLayouts];
        v116 = [v115 objectAtIndex:v10];

        if ([v116 environment] == 1)
        {
          [(SBSwitcherModifier *)self scaledFrameForIndex:v10];
          double v118 = v117;
          double v120 = v119;
          double v122 = v121;
          double v124 = v123;
          UIRectGetCenter();
          double v127 = hypot(x - v125, y - v126);
          if (v127 < v114)
          {
            double v128 = v127;
            -[SBSwitcherDropRegionContext setTargetRect:](v109, "setTargetRect:", v118, v120, v122, v124);
            [(SBSwitcherDropRegionContext *)v109 setClosestVisibleAppLayout:v116];
            double v114 = v128;
          }
        }

        ++v10;
        --v12;
      }
      while (v12);
      v112 = v162;
    }
  }
  [(SBSwitcherDropRegionContext *)v109 setCurrentDropRegion:v102];
  if ([v108 isSplitConfiguration]
    && SBSwitcherDropRegionWarrantsModelUpdate(v102))
  {
    if (v146 == 1) {
      uint64_t v129 = 2;
    }
    else {
      uint64_t v129 = 1;
    }
    v130 = [v108 leafAppLayoutForRole:v129];
    [(SBSwitcherDropRegionContext *)v109 setRemainingAppLayout:v130];
  }
  int v131 = [v112 isSplitConfiguration];
  if (v102 == 3 || v131)
  {
    if ((v102 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v132 = [v112 leafAppLayoutForRole:v147];
      [(SBSwitcherDropRegionContext *)v109 setEvictedAppLayout:v132];
    }
    else if (v102 == 3)
    {
      [(SBSwitcherDropRegionContext *)v109 setEvictedAppLayout:v163];
    }
  }

  return v109;
}

- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3 lastVisibleIndex:(unint64_t)a4
{
  if ([(SBMixedGridSwitcherModifier *)self isRTLEnabled])
  {
    id v6 = [(SBMixedGridSwitcherModifier *)self appLayouts];
    unint64_t v7 = [v6 count];

    if (v7 > a4 && [(SBMixedGridSwitcherModifier *)self isIndexVisible:a4])
    {
      unint64_t v8 = v7 - 1;
      unint64_t v9 = a4;
      do
      {
        unint64_t v10 = v9;
        if (v8 == v9) {
          break;
        }
        ++v9;
      }
      while ([(SBMixedGridSwitcherModifier *)self isIndexVisible:v10 + 1]);
    }
    else
    {
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if ((a4 & 0x8000000000000000) != 0 {
         || ![(SBMixedGridSwitcherModifier *)self isIndexVisible:a4])
  }
  {
    unint64_t v10 = a4;
    a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v11 = a4;
    while (v11-- >= 1)
    {
      if (![(SBMixedGridSwitcherModifier *)self isIndexVisible:v11])
      {
        unint64_t v10 = a4;
        a4 = v11 + 1;
        goto LABEL_16;
      }
    }
    unint64_t v10 = a4;
    a4 = 0;
  }
LABEL_16:
  BOOL v13 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  BOOL v14 = v10 != 0x7FFFFFFFFFFFFFFFLL;
  if (v14 && v13) {
    NSUInteger v15 = a4;
  }
  else {
    NSUInteger v15 = 0;
  }
  if (v14 && v13) {
    NSUInteger v16 = v10 - a4 + 1;
  }
  else {
    NSUInteger v16 = 0;
  }
  result.length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (unint64_t)_numberOfOffScreenTrailingFullScreenCardsForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  unint64_t v5 = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts];
  if (!v5) {
    return 0;
  }
  char v6 = v5;
  [(SBMixedGridSwitcherModifier *)self _fittedFullScreenContentSize];
  double v8 = v7;
  [(SBMixedGridSwitcherModifier *)self _minimumFullScreenContentSize];
  double v10 = v9 - v8;
  BOOL v11 = v8 > v9;
  double v12 = 0.0;
  if (!v11) {
    double v12 = v10;
  }
  double v13 = x - v12;
  double width = self->_fullScreenCardSize.width;
  [(SBMixedGridSwitcherModifier *)self _fullScreenCardScale];
  double v16 = width * v15;
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  double v18 = v13 / (v16 + v17);
  int v19 = BSFloatLessThanOrEqualToFloat();
  unint64_t v20 = vcvtmd_u64_f64(v18);
  if (v19) {
    unint64_t v21 = 0;
  }
  else {
    unint64_t v21 = v20;
  }
  unint64_t v22 = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenColumns];
  if (v21 >= v22) {
    unint64_t v21 = v22;
  }
  if (![(SBMixedGridSwitcherModifier *)self _isDoubleStackingFullScreenCards]
    || !v21)
  {
    return v21;
  }
  unint64_t v23 = 2 * v21;
  if (![(SBMixedGridSwitcherModifier *)self isRTLEnabled]) {
    return v23 - (v6 & 1);
  }
  unint64_t result = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts];
  if (v23 < result) {
    return v23;
  }
  return result;
}

- (unint64_t)_numberOfOffScreenTrailingFloatingCardsForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  unint64_t result = [(SBMixedGridSwitcherModifier *)self numberOfFloatingAppLayouts];
  if (result)
  {
    [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
    double v7 = v6;
    double width = self->_floatingCardSize.width;
    [(SBMixedGridSwitcherModifier *)self _floatingCardScale];
    double v10 = x / (v7 + width * v9);
    int v11 = BSFloatLessThanOrEqualToFloat();
    unint64_t v12 = vcvtmd_u64_f64(v10);
    if (v11) {
      unint64_t v13 = 0;
    }
    else {
      unint64_t v13 = v12;
    }
    unint64_t result = [(SBMixedGridSwitcherModifier *)self _numberOfFloatingColumns];
    if (v13 < result) {
      return v13;
    }
  }
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  -[SBSwitcherModifier distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:](self, "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:", a3, 1, 0);
  return result;
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_floatingConfiguration)) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)topMostLayoutElements
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v2 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "environment", (void)v11) == 2) {
          [v3 insertObject:v9 atIndex:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (double)_verticalSpacing
{
  id v3 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  if ((unint64_t)(-[SBMixedGridSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation")- 1) > 1)[v3 gridSwitcherVerticalNaturalSpacingLandscape]; {
  else
  }
    [v3 gridSwitcherVerticalNaturalSpacingPortrait];
  [(SBMixedGridSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  double v5 = v4;

  return v5;
}

- (double)_horizontalSpacing
{
  id v3 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  if ((unint64_t)(-[SBMixedGridSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation")- 1) > 1)[v3 gridSwitcherHorizontalInterpageSpacingLandscape]; {
  else
  }
    [v3 gridSwitcherHorizontalInterpageSpacingPortrait];
  [(SBMixedGridSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  double v5 = v4;

  return v5;
}

- (unint64_t)_numberOfFullScreenAppLayouts
{
  id v3 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  uint64_t v4 = [v3 count];
  unint64_t v5 = v4 - [(SBMixedGridSwitcherModifier *)self numberOfFloatingAppLayouts];

  return v5;
}

- (unint64_t)_numberOfFullScreenRows
{
  if ([(SBMixedGridSwitcherModifier *)self _isDoubleStackingFullScreenCards]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (unint64_t)_numberOfFullScreenColumns
{
  unint64_t v3 = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts];
  BOOL v4 = [(SBMixedGridSwitcherModifier *)self _isDoubleStackingFullScreenCards];
  double v5 = (double)v3;
  double v6 = ceil((double)v3 * 0.5);
  if (v4) {
    return (unint64_t)v6;
  }
  return (unint64_t)v5;
}

- (double)_cachedFullScreenCardScale
{
  [(SBMixedGridSwitcherModifier *)self _invalidateCachesIfNeeded];
  if ((*(unsigned char *)&self->_cachesValidity & 2) == 0)
  {
    [(SBMixedGridSwitcherModifier *)self _fullScreenCardScale];
    self->_cachedFullScreenCardScale = v3;
    *(unsigned char *)&self->_cachesValidity |= 2u;
  }
  return self->_cachedFullScreenCardScale;
}

- (double)_fullScreenCardScale
{
  double v3 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  if ([(SBMixedGridSwitcherModifier *)self _isDoubleStackingFullScreenCards]) {
    [v3 appExposeNonFloatingDoubleRowScale];
  }
  else {
    [v3 appExposeNonFloatingSingleRowScale];
  }
  double v5 = v4;
  if ([(SBMixedGridSwitcherModifier *)self disableFullScreenCardScaleRounding])
  {
    double v6 = v5;
  }
  else
  {
    [(SBMixedGridSwitcherModifier *)self containerViewBounds];
    double Width = CGRectGetWidth(v9);
    double v6 = 0.0;
    if ((BSFloatIsZero() & 1) == 0) {
      double v6 = round(v5 * Width) / Width;
    }
  }

  return v6;
}

- (double)_floatingCardScale
{
  double v3 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  if ([(SBMixedGridSwitcherModifier *)self _isDoubleStackingFullScreenCards])
  {
    [v3 appExposeFloatingDoubleRowScale];
    double v5 = v4;
  }
  else
  {
    [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
    double v7 = v6;
    [v3 appExposeNonFloatingSingleRowScale];
    double v5 = v8 * v7 / self->_floatingCardSize.height;
  }

  return v5;
}

- (CGSize)_scaledCardSizeForIndex:(unint64_t)a3
{
  BOOL v4 = [(SBMixedGridSwitcherModifier *)self _isIndexFullScreen:a3];
  double v5 = &OBJC_IVAR___SBMixedGridSwitcherModifier__floatingCardSize;
  if (v4) {
    double v5 = &OBJC_IVAR___SBMixedGridSwitcherModifier__fullScreenCardSize;
  }
  double v6 = (double *)((char *)self + *v5);
  double v8 = *v6;
  double v7 = v6[1];
  if (v4) {
    [(SBMixedGridSwitcherModifier *)self _fullScreenCardScale];
  }
  else {
    [(SBMixedGridSwitcherModifier *)self _floatingCardScale];
  }
  double v10 = v7 * v9;
  double v11 = v8 * v9;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (BOOL)_isDoubleStackingFullScreenCards
{
  if (![(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts]) {
    return 1;
  }
  unint64_t v3 = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts];
  return v3 > [(SBMixedGridSwitcherModifier *)self maximumNumberOfFullScreenCardsForSingleRow];
}

- (CGRect)_frameForIndex:(unint64_t)a3 applyScrollViewContentOffset:(BOOL)a4
{
  BOOL v4 = a4;
  [(SBMixedGridSwitcherModifier *)self _invalidateCachesIfNeeded];
  double v7 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
  unint64_t v8 = 0x1E4F28000uLL;
  if ((*(unsigned char *)&self->_cachesValidity & 8) != 0)
  {
    cachedFrameForIndedouble x = self->_cachedFrameForIndex;
    double v10 = [NSNumber numberWithUnsignedInteger:a3];
    double v11 = [(NSMutableDictionary *)cachedFrameForIndex objectForKeyedSubscript:v10];

    if (v11)
    {
      [v11 CGRectValue];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      if (!v4) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  double v21 = v20;
  unint64_t v22 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  unint64_t v23 = [(SBMixedGridSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v22];

  if ([(SBMixedGridSwitcherModifier *)self _isIndexFullScreen:a3])
  {
    unint64_t v24 = [(SBMixedGridSwitcherModifier *)self numberOfFloatingAppLayouts];
    char v25 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
    [(SBMixedGridSwitcherModifier *)self _contentSize];
    double v27 = v26;
    unint64_t v28 = [(SBMixedGridSwitcherModifier *)self _subtreeIndexForIndex:a3 indexOfFirstMainAppLayout:v23];
    BOOL v29 = [(SBMixedGridSwitcherModifier *)self _isDoubleStackingFullScreenCards];
    unint64_t v30 = [(SBMixedGridSwitcherModifier *)self _numberOfFullScreenAppLayouts];
    [(SBMixedGridSwitcherModifier *)self _fullScreenCardScale];
    -[SBMixedGridSwitcherModifier _unpaddedCoplanarFrameForIndex:doubleStack:count:cardSize:scale:contentWidth:](self, "_unpaddedCoplanarFrameForIndex:doubleStack:count:cardSize:scale:contentWidth:", v28, v29, v30, self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, v31, v27);
    double v33 = v32;
    double v15 = v34;
    double v17 = v35;
    double v19 = v36;
    int v37 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
    double v38 = -v21;
    if (v37) {
      double v38 = v21;
    }
    double v13 = v33 + v38;
    if (v24)
    {
      [(SBMixedGridSwitcherModifier *)self _fittedFloatingContentSize];
      double v40 = v21 + v39;
      double v41 = v13 + v40;
      double v42 = v13 - v40;
      if (v25) {
        double v13 = v41;
      }
      else {
        double v13 = v42;
      }
    }
    unint64_t v8 = 0x1E4F28000;
    double v7 = &OBJC_IVAR___SBTransitionSwitcherModifierEvent__morphFromInAppView;
  }
  else
  {
    [(SBMixedGridSwitcherModifier *)self _contentSize];
    double v44 = v43;
    unint64_t v45 = [(SBMixedGridSwitcherModifier *)self _subtreeIndexForIndex:a3 indexOfFirstMainAppLayout:v23];
    unint64_t v46 = [(SBMixedGridSwitcherModifier *)self numberOfFloatingAppLayouts];
    [(SBMixedGridSwitcherModifier *)self unadjustedScaleForIndex:a3];
    -[SBMixedGridSwitcherModifier _unpaddedCoplanarFrameForIndex:doubleStack:count:cardSize:scale:contentWidth:](self, "_unpaddedCoplanarFrameForIndex:doubleStack:count:cardSize:scale:contentWidth:", v45, 0, v46, self->_floatingCardSize.width, self->_floatingCardSize.height, v47, v44);
    double v49 = v48;
    double v15 = v50;
    double v17 = v51;
    double v19 = v52;
    int v53 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
    double v54 = -v21;
    if (v53) {
      double v54 = v21;
    }
    double v13 = v49 + v54;
  }
  if (self->_lowDensityGridLayoutAlignment == 1)
  {
    [(SBMixedGridSwitcherModifier *)self _contentSize];
    double v56 = v55;
    [(SBMixedGridSwitcherModifier *)self _fittedContentSize];
    double v58 = v57 + v21 * 2.0;
    if (BSFloatLessThanOrEqualToFloat())
    {
      int v59 = [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
      double v60 = -0.5;
      if (v59) {
        double v60 = 0.5;
      }
      double v13 = v13 + (v56 - v58) * v60;
    }
  }
  double v61 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v13, v15, v17, v19);
  id v62 = *(Class *)((char *)&self->super.super.super.isa + v7[494]);
  uint64_t v63 = [*(id *)(v8 + 3792) numberWithUnsignedInteger:a3];
  [v62 setObject:v61 forKeyedSubscript:v63];

  *(unsigned char *)&self->_cachesValidity |= 8u;
  if (v4)
  {
LABEL_22:
    [(SBMixedGridSwitcherModifier *)self scrollViewContentOffset];
    double v13 = v13 - v64;
  }
LABEL_23:
  double v65 = v13;
  double v66 = v15;
  double v67 = v17;
  double v68 = v19;
  result.size.double height = v68;
  result.size.double width = v67;
  result.origin.double y = v66;
  result.origin.double x = v65;
  return result;
}

- (CGRect)_unpaddedCoplanarFrameForIndex:(unint64_t)a3 doubleStack:(BOOL)a4 count:(unint64_t)a5 cardSize:(CGSize)a6 scale:(double)a7 contentWidth:(double)a8
{
  [(SBMixedGridSwitcherModifier *)self switcherViewBounds];
  [(SBMixedGridSwitcherModifier *)self _horizontalSpacing];
  [(SBMixedGridSwitcherModifier *)self _verticalSpacing];
  [(SBMixedGridSwitcherModifier *)self isRTLEnabled];
  [(SBMixedGridSwitcherModifier *)self _cardHeaderHeight];
  [(SBMixedGridSwitcherModifier *)self floatingDockHeight];
  [(SBMixedGridSwitcherModifier *)self _verticalSpacing];
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (double)_cardHeaderHeight
{
  double v2 = [(SBMixedGridSwitcherModifier *)self switcherSettings];
  [v2 spacingBetweenSnapshotAndIcon];
  double v4 = v3;
  [v2 iconSideLength];
  double v6 = v4 + v5;

  return v6;
}

- (BOOL)_isIndexFullScreen:(unint64_t)a3
{
  double v5 = [(SBMixedGridSwitcherModifier *)self appLayouts];
  unint64_t v6 = [(SBMixedGridSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v5];

  return v6 != 0x7FFFFFFFFFFFFFFFLL && v6 <= a3;
}

- (unint64_t)_subtreeIndexForIndex:(unint64_t)a3 indexOfFirstMainAppLayout:(unint64_t)a4
{
  if (a3 < a4 || a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = a4;
  }
  unint64_t v6 = a3 - v5;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  else {
    return v6;
  }
}

- (void)_invalidateCachesIfNeeded
{
  v5.receiver = self;
  v5.super_class = (Class)SBMixedGridSwitcherModifier;
  id v3 = [(SBMixedGridSwitcherModifier *)&v5 appLayoutsGenerationCount];
  int64_t v4 = [(SBMixedGridSwitcherModifier *)self switcherInterfaceOrientation];
  if (self->_lastAppLayoutsGenerationCount != v3 || self->_lastInterfaceOrientation == v4)
  {
    self->_lastAppLayoutsGenerationCount = (unint64_t)v3;
    self->_lastInterfaceOrientation = v4;
    *(unsigned char *)&self->_cachesValidity &= 0xF0u;
    [(NSMutableDictionary *)self->_cachedFrameForIndex removeAllObjects];
  }
}

- (BOOL)reversesFloatingCardDirection
{
  return self->_reversesFloatingCardDirection;
}

- (void)setReversesFloatingCardDirection:(BOOL)a3
{
  self->_reversesFloatingCardDirection = a3;
}

- (CGSize)fullScreenCardSize
{
  double width = self->_fullScreenCardSize.width;
  double height = self->_fullScreenCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)floatingCardSize
{
  double width = self->_floatingCardSize.width;
  double height = self->_floatingCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)lowDensityGridLayoutAlignment
{
  return self->_lowDensityGridLayoutAlignment;
}

- (void)setLowDensityGridLayoutAlignment:(unint64_t)a3
{
  self->_lowDensityGridLayoutAlignment = a3;
}

- (unint64_t)maximumNumberOfFullScreenCardsForSingleRow
{
  return self->_maximumNumberOfFullScreenCardsForSingleRow;
}

- (void)setMaximumNumberOfFullScreenCardsForSingleRow:(unint64_t)a3
{
  self->_maximumNumberOfFullScreenCardsForSingleRow = a3;
}

- (BOOL)disableFullScreenCardScaleRounding
{
  return self->_disableFullScreenCardScaleRounding;
}

- (void)setDisableFullScreenCardScaleRounding:(BOOL)a3
{
  self->_disableFullScreenCardScaleRounding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFrameForIndex, 0);
  objc_storeStrong((id *)&self->_gridModifier, 0);
}

@end