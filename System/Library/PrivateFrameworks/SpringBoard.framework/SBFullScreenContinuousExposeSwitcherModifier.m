@interface SBFullScreenContinuousExposeSwitcherModifier
- (BOOL)_isAppLayoutEffectivelyOnStage:(id)a3;
- (BOOL)_isStripRevealedFromHidden;
- (BOOL)_isStripStashed;
- (BOOL)_shouldEnableItemResizeGrabbersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)_stageContainsFullScreenItem;
- (BOOL)_wantsContinuousExposeHoverGestureForDismissingStrip;
- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3;
- (BOOL)handlesTapAppLayoutEvents;
- (BOOL)handlesTapAppLayoutHeaderEvents;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContinuousExposeConfigurationChangeTransition;
- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isScrollEnabled;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3;
- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)shouldConfigureInAppDockHiddenAssertion;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldScrollViewBlockTouches;
- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseWallpaperGradientTreatment;
- (BOOL)switcherHitTestsAsOpaque;
- (BOOL)wantsContinuousExposeHoverGesture;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (NSMutableSet)highlightedByHoverAppLayouts;
- (NSMutableSet)highlightedByTouchAppLayouts;
- (SBAppLayout)fullScreenAppLayout;
- (SBFullScreenContinuousExposeSwitcherModifier)initWithFullScreenAppLayout:(id)a3;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_continuousExposeStripRevealProgress;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)continuousExposeStripProgress;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)dockProgress;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)activeLeafAppLayoutsReachableByKeyboardShortcut;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleHoverEvent:(id)a3;
- (id)handlePointerCrossedDisplayBoundaryEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTapAppLayoutHeaderEvent:(id)a3;
- (id)handleTapOutsideToDismissEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)dockUpdateMode;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3;
- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (unsigned)_continuousExposeStripEdge;
- (void)_resetKeyboardNavigationZOrder;
- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3;
- (void)setHandlesTapAppLayoutEvents:(BOOL)a3;
- (void)setHandlesTapAppLayoutHeaderEvents:(BOOL)a3;
- (void)setHighlightedByHoverAppLayouts:(id)a3;
- (void)setHighlightedByTouchAppLayouts:(id)a3;
@end

@implementation SBFullScreenContinuousExposeSwitcherModifier

- (SBFullScreenContinuousExposeSwitcherModifier)initWithFullScreenAppLayout:(id)a3
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  v7 = [(SBSwitcherModifier *)&v12 init];
  if (v7)
  {
    if (!v6)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v7, @"SBFullScreenContinuousExposeSwitcherModifier.m", 52, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_fullScreenAppLayout, a3);
    [(SBFullScreenContinuousExposeSwitcherModifier *)v7 _resetKeyboardNavigationZOrder];
    v7->_handlesTapAppLayoutEvents = 1;
    v7->_handlesTapAppLayoutHeaderEvents = 1;
    v8 = [[SBFullScreenAppLayoutSwitcherModifier alloc] initWithActiveAppLayout:v6];
    fullScreenAppLayoutModifier = v7->_fullScreenAppLayoutModifier;
    v7->_fullScreenAppLayoutModifier = v8;

    [(SBFullScreenAppLayoutSwitcherModifier *)v7->_fullScreenAppLayoutModifier setHandlesAssistantPresentationEvents:0];
    [(SBChainableModifier *)v7 addChildModifier:v7->_fullScreenAppLayoutModifier atLevel:1 key:0];
  }

  return v7;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  char v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self prefersStripHiddenAndDisabled];
  stripModifier = self->_stripModifier;
  if (v5)
  {
    if (stripModifier)
    {
      [(SBChainableModifier *)stripModifier setState:1];
      v7 = self->_stripModifier;
      self->_stripModifier = 0;
    }
  }
  else if (!stripModifier)
  {
    v8 = objc_alloc_init(SBStripContinuousExposeSwitcherModifier);
    v9 = self->_stripModifier;
    self->_stripModifier = v8;

    [(SBChainableModifier *)self addChildModifier:self->_stripModifier atLevel:0 key:0];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  v10 = [(SBChainableModifier *)&v12 handleEvent:v4];

  return v10;
}

- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3
{
  self->_continuousExposeConfigurationChangeTransition = a3;
  -[SBStripContinuousExposeSwitcherModifier setContinuousExposeConfigurationChangeTransition:](self->_stripModifier, "setContinuousExposeConfigurationChangeTransition:");
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char v5 = [(SBChainableModifier *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__SBFullScreenContinuousExposeSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __86__SBFullScreenContinuousExposeSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 128) withName:@"fullScreenAppLayout"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 120) withName:@"handlesTapAppLayoutEvents"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 121) withName:@"handlesTapAppLayoutHeaderEvents"];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v5 + 96);
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    v8 = [v6 succinctDescription];
    id v9 = (id)[v7 appendObject:v8 withName:@"stripModifier"];

    uint64_t v5 = *(void *)(a1 + 40);
  }
  id v10 = *(void **)(a1 + 32);
  id v12 = [*(id *)(v5 + 104) succinctDescription];
  id v11 = (id)[v10 appendObject:v12 withName:@"fullScreenAppLayoutModifier"];
}

- (NSMutableSet)highlightedByTouchAppLayouts
{
  stripModifier = self->_stripModifier;
  if (stripModifier)
  {
    id v3 = [(SBStripContinuousExposeSwitcherModifier *)stripModifier highlightedByTouchAppLayouts];
  }
  else
  {
    id v3 = objc_opt_new();
  }
  return (NSMutableSet *)v3;
}

- (void)setHighlightedByTouchAppLayouts:(id)a3
{
}

- (NSMutableSet)highlightedByHoverAppLayouts
{
  stripModifier = self->_stripModifier;
  if (stripModifier)
  {
    id v3 = [(SBStripContinuousExposeSwitcherModifier *)stripModifier highlightedByHoverAppLayouts];
  }
  else
  {
    id v3 = objc_opt_new();
  }
  return (NSMutableSet *)v3;
}

- (void)setHighlightedByHoverAppLayouts:(id)a3
{
}

- (double)continuousExposeStripProgress
{
  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripStashed]
    && ![(SBFullScreenContinuousExposeSwitcherModifier *)self prefersStripHidden])
  {
    return 1.0;
  }
  [(SBFullScreenContinuousExposeSwitcherModifier *)self _continuousExposeStripRevealProgress];
  return result;
}

- (double)_continuousExposeStripRevealProgress
{
  v3.receiver = self;
  v3.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  [(SBFullScreenContinuousExposeSwitcherModifier *)&v3 continuousExposeStripProgress];
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    [(SBFullScreenAppLayoutSwitcherModifier *)self->_fullScreenAppLayoutModifier frameForIndex:a3];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    [(SBFullScreenContinuousExposeSwitcherModifier *)&v19 frameForIndex:a3];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  double v7 = 0.5;
  double v8 = 0.5;
  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    [(SBFullScreenContinuousExposeSwitcherModifier *)&v13 anchorPointForIndex:a3];
    double v7 = v9;
    double v8 = v10;
  }

  double v11 = v7;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    fullScreenAppLayoutModifier = [(SBChainableModifier *)self childModifierByKey:@"SBFullScreenContinuousExposeSwitcherModifierAssistantModifierKey"];
    double v8 = fullScreenAppLayoutModifier;
    if (!fullScreenAppLayoutModifier) {
      fullScreenAppLayoutModifier = self->_fullScreenAppLayoutModifier;
    }
    [fullScreenAppLayoutModifier scaleForIndex:a3];
    double v10 = v11;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    [(SBFullScreenContinuousExposeSwitcherModifier *)&v13 scaleForIndex:a3];
    double v10 = v9;
  }

  return v10;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v9])
  {
    v18.receiver = self;
    v18.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v18, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v7])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    -[SBFullScreenContinuousExposeSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v12, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    double x = v8;
    double y = v9;
  }

  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  v58.receiver = self;
  v58.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  -[SBFullScreenContinuousExposeSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v58, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v11]&& ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripStashed]|| [(SBFullScreenContinuousExposeSwitcherModifier *)self prefersStripHidden]))
  {
    [(SBFullScreenContinuousExposeSwitcherModifier *)self _continuousExposeStripRevealProgress];
    double v21 = v20;
    if (BSFloatGreaterThanFloat())
    {
      [(SBFullScreenContinuousExposeSwitcherModifier *)self containerViewBounds];
      double v23 = v22;
      v24 = [(SBFullScreenContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
      v25 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_fullScreenAppLayout];
      v26 = [v11 itemForLayoutRole:a3];
      v27 = [v25 autoLayoutItemForDisplayItem:v26];

      [v25 boundingBox];
      double v54 = v28;
      double v55 = v29;
      double v56 = v30;
      double v32 = v31;
      [v24 stripWidth];
      double v34 = v33;
      [v24 screenEdgePadding];
      double v35 = v23;
      double v37 = fmin((v23 - v34 - v36) / v32, 1.0);
      double v38 = (v34 + v35 - v36) * 0.5;
      if (v38 >= v34 + v32 * v37 * 0.5) {
        double v38 = v34 + v32 * v37 * 0.5;
      }
      double v53 = v38;
      double v57 = v17;
      double v39 = v21;
      double v40 = v54 + v32 * 0.5;
      if (BSFloatGreaterThanFloat()) {
        double v41 = v54 + v32 * 0.5;
      }
      else {
        double v41 = v53;
      }
      double v42 = v39 * (v37 + -1.0) + 1.0;
      int v43 = [(SBFullScreenContinuousExposeSwitcherModifier *)self isRTLEnabled];
      double v44 = v39 * (v41 - v40);
      double v17 = v57;
      double v45 = v44 + 0.0;
      if (v43) {
        double v46 = -v45;
      }
      else {
        double v46 = v45;
      }
      [v27 position];
      double v15 = v15 - (1.0 - v42) * (v48 - (v56 + v55 * 0.5));
      double v13 = v46 + v13 - (1.0 - v42) * (v47 - v40);
    }
  }

  double v49 = v13;
  double v50 = v15;
  double v51 = v17;
  double v52 = v19;
  result.size.double height = v52;
  result.size.double width = v51;
  result.origin.double y = v50;
  result.origin.double x = v49;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  id v6 = a4;
  [(SBFullScreenContinuousExposeSwitcherModifier *)&v22 scaleForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  LODWORD(a3) = -[SBFullScreenContinuousExposeSwitcherModifier _isAppLayoutEffectivelyOnStage:](self, "_isAppLayoutEffectivelyOnStage:", v6, v22.receiver, v22.super_class);

  if (a3
    && ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripStashed]
     || [(SBFullScreenContinuousExposeSwitcherModifier *)self prefersStripHidden]))
  {
    [(SBFullScreenContinuousExposeSwitcherModifier *)self _continuousExposeStripRevealProgress];
    double v10 = v9;
    if (BSFloatGreaterThanFloat())
    {
      [(SBFullScreenContinuousExposeSwitcherModifier *)self containerViewBounds];
      double v12 = v11;
      double v13 = [(SBFullScreenContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
      double v14 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_fullScreenAppLayout];
      [v14 boundingBox];
      double v16 = v15;
      [v13 stripWidth];
      double v18 = v17;
      [v13 screenEdgePadding];
      double v20 = fmin((v12 - v18 - v19) / v16, 1.0);
      BSFloatGreaterThanFloat();
      double v8 = v8 * (v10 * (v20 + -1.0) + 1.0);
    }
  }
  return v8;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  objc_super v3 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_fullScreenAppLayout];

  return v4;
}

- (id)appLayoutsToCacheSnapshots
{
  id v2 = [(SBFullScreenContinuousExposeSwitcherModifier *)self visibleAppLayouts];
  objc_super v3 = [v2 allObjects];

  return v3;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _stageContainsFullScreenItem])
    {
      [(SBFullScreenContinuousExposeSwitcherModifier *)self displayCornerRadius];
    }
    else
    {
      double v11 = [(SBFullScreenContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
      [v11 stageCornerRadii];
    }
    [(SBFullScreenContinuousExposeSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    [(SBFullScreenContinuousExposeSwitcherModifier *)&v20 cornerRadiiForIndex:a3];
  }
  double v12 = v7;
  double v13 = v8;
  double v14 = v9;
  double v15 = v10;

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
  uint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _stageContainsFullScreenItem])
    {
      unint64_t v7 = 0;
    }
    else
    {
      unint64_t v7 = 15;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    unint64_t v7 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v9 maskedCornersForIndex:a3];
  }

  return v7;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v7 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  double v8 = [v7 objectAtIndex:a4];

  double v9 = 1.0;
  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v8])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    [(SBFullScreenContinuousExposeSwitcherModifier *)&v12 shadowOpacityForLayoutRole:a3 atIndex:a4];
    double v9 = v10;
  }

  return v9;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  return 1;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    Emptdouble y = SBSwitcherWallpaperGradientAttributesMakeEmpty();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    [(SBFullScreenContinuousExposeSwitcherModifier *)&v13 wallpaperGradientAttributesForIndex:a3];
  }
  double v9 = Empty;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.trailingAlpha = v12;
  result.leadingAlpha = v11;
  return result;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  double v7 = 0.0;
  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    [(SBFullScreenContinuousExposeSwitcherModifier *)&v10 titleAndIconOpacityForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  fullScreenAppLayout = self->_fullScreenAppLayout;
  id v7 = a4;
  double v8 = [v7 itemForLayoutRole:a3];
  LODWORD(fullScreenAppLayout) = [(SBAppLayout *)fullScreenAppLayout containsItem:v8];

  if (fullScreenAppLayout)
  {
    BOOL v9 = [(SBFullScreenContinuousExposeSwitcherModifier *)self isLayoutRoleOccluded:a3 inAppLayout:v7];

    if (v9) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    id v10 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v12 touchBehaviorForLayoutRole:a3 inAppLayout:v7];
  }
  return (int64_t)v10;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayoutContainsOnlyResizableApps:v5]&& ([(SBFullScreenContinuousExposeSwitcherModifier *)self _continuousExposeStripRevealProgress], BSFloatIsZero())&& [(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v5];

  return v6;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _shouldEnableItemResizeGrabbersForLayoutRole:a3 inAppLayout:v6])
  {
    id v7 = [(SBFullScreenContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
    char v8 = [v7 isAdditiveModelEnabled];

    if (v8)
    {
      unint64_t v9 = 8;
    }
    else
    {
      id v10 = [v6 itemForLayoutRole:a3];
      double v11 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v6];
      objc_super v12 = [v11 autoLayoutItemForDisplayItem:v10];
      [v11 stageArea];
      double v14 = v13;
      double v16 = v15;
      [v12 position];
      double v18 = v17;
      [v12 size];
      double v20 = v18 - v19 * 0.5;
      [v12 position];
      double v22 = v21;
      [v12 size];
      if (vabdd_f64(v20, v14) <= vabdd_f64(v14 + v16, v22 + v23 * 0.5)) {
        unint64_t v9 = 8;
      }
      else {
        unint64_t v9 = 4;
      }
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    unint64_t v9 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v25 activeCornersForTouchResizeForLayoutRole:a3 inAppLayout:v6];
  }

  return v9;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6]&& ![(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripRevealedFromHidden])
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    BOOL v7 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v9 shouldAllowContentViewTouchesForLayoutRole:a3 inAppLayout:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6]|| [(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripRevealedFromHidden]|| (v10.receiver = self, v10.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier, [(SBFullScreenContinuousExposeSwitcherModifier *)&v10 isLayoutRoleSelectable:a3 inAppLayout:v6]))
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_super v9 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v6];
    BOOL v7 = [(SBFullScreenContinuousExposeSwitcherModifier *)self isLayoutRoleOccluded:a3 inAppLayout:v9];
  }
  return v7;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v6];
  char v8 = [v6 itemForLayoutRole:a3];

  objc_super v9 = [v7 autoLayoutItemForDisplayItem:v8];

  if ([v9 isFullyOccluded] & 1) != 0 || (objc_msgSend(v9, "isOverlapped")) {
    char v10 = 1;
  }
  else {
    char v10 = [v9 isPartiallyCoveredByPeekingItem];
  }

  return v10;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return ![(SBAppLayout *)self->_fullScreenAppLayout isOrContainsAppLayout:a3];
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return self->_zOrderedLeafAppLayoutsForKeyboardNavigation;
}

- (BOOL)isScrollEnabled
{
  return 0;
}

- (BOOL)shouldScrollViewBlockTouches
{
  return 0;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (double)homeScreenAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  id v2 = [(SBFullScreenContinuousExposeSwitcherModifier *)self switcherSettings];
  objc_super v3 = [v2 chamoisSettings];
  if ([v3 blurWallpaperInApps]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 3;
  }

  return v4;
}

- (double)homeScreenBackdropBlurProgress
{
  id v2 = [(SBFullScreenContinuousExposeSwitcherModifier *)self switcherSettings];
  objc_super v3 = [v2 chamoisSettings];
  if ([v3 blurWallpaperInApps]) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }

  return v4;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (BOOL)isContainerStatusBarVisible
{
  return ![(SBFullScreenContinuousExposeSwitcherModifier *)self _stageContainsFullScreenItem];
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripRevealedFromHidden])
  {
    unint64_t v7 = 10;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    unint64_t v7 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v9 hiddenContentStatusBarPartsForLayoutRole:a3 inAppLayout:v6];
  }

  return v7;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  objc_super v3 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_fullScreenAppLayout];
  [v3 stageArea];
  double v5 = v4;
  double v7 = v6;
  [(SBFullScreenContinuousExposeSwitcherModifier *)self containerViewBounds];
  double v9 = v8;
  [(SBFullScreenContinuousExposeSwitcherModifier *)self floatingDockHeight];
  double v11 = v10;
  [(SBFullScreenContinuousExposeSwitcherModifier *)self floatingDockViewTopMargin];
  double v13 = v11 + v12;
  double v14 = [(SBFullScreenContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  if ([v14 isAutoLayoutEnabled])
  {
    double v15 = v5 + v7;
  }
  else
  {
    [v3 boundingBox];
    double v15 = v16 + v17;
  }
  double v18 = v9 - v13;

  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self isSoftwareKeyboardVisible])
  {
    if (v15 > v18)
    {
      char v19 = 1;
      goto LABEL_11;
    }
LABEL_10:
    char v19 = [(SBFullScreenContinuousExposeSwitcherModifier *)self prefersDockHidden];
    goto LABEL_11;
  }
  char v19 = 1;
  if (([(SBFullScreenContinuousExposeSwitcherModifier *)self isMedusaHostedKeyboardVisible] & 1) == 0&& v15 <= v18)
  {
    goto LABEL_10;
  }
LABEL_11:

  return v19;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return ![(SBFullScreenContinuousExposeSwitcherModifier *)self shouldConfigureInAppDockHiddenAssertion];
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 3;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return ![(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:a4];
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  if (a3 == 4) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  return [(SBFullScreenContinuousExposeSwitcherModifier *)&v5 isLayoutRoleMatchMovedToScene:a3 inAppLayout:a4];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (![(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v4])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    [(SBFullScreenContinuousExposeSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3
{
  id v4 = a3;
  [(SBFullScreenContinuousExposeSwitcherModifier *)self perspectiveAngleForAppLayout:v4];
  if (BSFloatIsZero())
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    unint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v7 footerViewIconAlignmentForAppLayout:v4];
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

- (id)topMostLayoutElements
{
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  objc_super v3 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v8 topMostLayoutElements];
  id v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_fullScreenAppLayout, 0);

  unint64_t v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self continuousExposeStripTongueBackdropCaptureLayoutElement];
  if (v5)
  {
    double v6 = (void *)[v4 mutableCopy];
    [v6 removeObject:self->_fullScreenAppLayout];
    [v6 insertObject:v5 atIndex:0];
    [v6 insertObject:self->_fullScreenAppLayout atIndex:0];

    id v4 = v6;
  }

  return v4;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  if (![a3 isEqual:self->_fullScreenAppLayout]
    || ![(SBFullScreenContinuousExposeSwitcherModifier *)self _stageContainsFullScreenItem]|| ![(SBFullScreenContinuousExposeSwitcherModifier *)self isDisplayEmbedded])
  {
    return 0;
  }
  id v4 = [(SBFullScreenContinuousExposeSwitcherModifier *)self homeGrabberSettings];
  char v5 = [v4 isEnabled];

  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self isHomeAffordanceSupportedForAppLayout:self->_fullScreenAppLayout])
  {
    [MEMORY[0x1E4F1CAD0] setWithObject:self->_fullScreenAppLayout];
  }
  else
  {
    [MEMORY[0x1E4F1CAD0] set];
  objc_super v3 = };
  return v3;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  char v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
    BOOL v7 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v9 shouldPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  id v4 = self;
  char v5 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = ![(SBFullScreenContinuousExposeSwitcherModifier *)v4 _isAppLayoutEffectivelyOnStage:v6];
  return (char)v4;
}

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  return 1;
}

- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3
{
  return 10.0;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsContinuousExposeHoverGesture
{
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  unsigned __int8 v3 = [(SBFullScreenContinuousExposeSwitcherModifier *)&v5 wantsContinuousExposeHoverGesture];
  return v3 | [(SBFullScreenContinuousExposeSwitcherModifier *)self _wantsContinuousExposeHoverGestureForDismissingStrip];
}

- (BOOL)_wantsContinuousExposeHoverGestureForDismissingStrip
{
  [(SBFullScreenContinuousExposeSwitcherModifier *)self _continuousExposeStripRevealProgress];
  return BSFloatGreaterThanFloat();
}

- (id)handleHoverEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v11 handleHoverEvent:v4];
  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _wantsContinuousExposeHoverGestureForDismissingStrip])
  {
    [v4 position];
    double v6 = [(SBFullScreenContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
    [v6 stripWidth];
    if (BSFloatGreaterThanFloat())
    {
      [(SBFullScreenContinuousExposeSwitcherModifier *)self containerViewBounds];
      [v6 stripWidth];
      if (BSFloatLessThanFloat())
      {
        BOOL v7 = [[SBUpdateContinuousExposeStripsPresentationResponse alloc] initWithPresentationOptions:0 dismissalOptions:1];
        objc_super v8 = SBAppendSwitcherModifierResponse(v7, v5);

        objc_super v9 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:3];
        objc_super v5 = SBAppendSwitcherModifierResponse(v9, v8);
      }
    }
  }
  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v18 handleTapAppLayoutEvent:v4];
  if (self->_handlesTapAppLayoutEvents && ([v4 isHandled] & 1) == 0)
  {
    double v6 = [v4 appLayout];
    if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6])
    {
      if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripRevealedFromHidden])
      {
        BOOL v7 = [[SBUpdateContinuousExposeStripsPresentationResponse alloc] initWithPresentationOptions:0 dismissalOptions:1];
        objc_super v8 = SBAppendSwitcherModifierResponse(v7, v5);

        objc_super v9 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:self->_fullScreenAppLayout];
        objc_super v5 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v9 gestureInitiated:0];
        uint64_t v10 = SBAppendSwitcherModifierResponse(v5, v8);

LABEL_14:
        [v4 handleWithReason:@"Full Screen Continuous Expose"];

        objc_super v5 = (SBPerformTransitionSwitcherEventResponse *)v10;
        goto LABEL_15;
      }
      double v14 = objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));
      BOOL v7 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      double v15 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v6];
      double v16 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayoutByBringingItemToFront:v14 inAppLayout:v15];
      [(SBUpdateContinuousExposeStripsPresentationResponse *)v7 setAppLayout:v16];

      [(SBUpdateContinuousExposeStripsPresentationResponse *)v7 setActivatingDisplayItem:v14];
      if ([v4 source] == 1) {
        [(SBUpdateContinuousExposeStripsPresentationResponse *)v7 setSource:51];
      }
    }
    else
    {
      BOOL v7 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      [(SBUpdateContinuousExposeStripsPresentationResponse *)v7 setAppLayout:v6];
      if (([v4 modifierFlags] & 0x20000) != 0) {
        [(SBUpdateContinuousExposeStripsPresentationResponse *)v7 setEntityInsertionPolicy:1];
      }
      objc_super v11 = [v6 continuousExposeIdentifier];
      double v12 = [(SBAppLayout *)self->_fullScreenAppLayout continuousExposeIdentifier];
      int v13 = [v11 isEqualToString:v12];

      if (v13) {
        [(SBUpdateContinuousExposeStripsPresentationResponse *)v7 setSource:63];
      }
    }
    objc_super v9 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v7 gestureInitiated:0];
    uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v5);
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v14 handleTapAppLayoutHeaderEvent:v4];
  if (self->_handlesTapAppLayoutHeaderEvents && ([v4 isHandled] & 1) == 0)
  {
    double v6 = [v4 appLayout];
    BOOL v7 = objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));

    if ([(SBFullScreenContinuousExposeSwitcherModifier *)self displayItemSupportsMultipleWindowsIndicator:v7])
    {
      objc_super v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      [(SBSwitcherTransitionRequest *)v8 setSource:3];
      objc_super v9 = [v7 bundleIdentifier];
      [(SBSwitcherTransitionRequest *)v8 setBundleIdentifierForAppExpose:v9];

      uint64_t v10 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v8 gestureInitiated:0];
    }
    else
    {
      objc_super v8 = [[SBPulseDisplayItemSwitcherModifier alloc] initWithDisplayItem:v7];
      uint64_t v10 = [[SBAddModifierSwitcherEventResponse alloc] initWithModifier:v8 level:3];
    }
    objc_super v11 = v10;
    uint64_t v12 = SBAppendSwitcherModifierResponse(v10, v5);

    [v4 handleWithReason:@"Full Screen Continuous Expose"];
    objc_super v5 = (void *)v12;
  }

  return v5;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  id v4 = [(SBSwitcherModifier *)&v14 handleTapOutsideToDismissEvent:a3];
  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripRevealedFromHidden])
  {
    objc_super v5 = [[SBUpdateContinuousExposeStripsPresentationResponse alloc] initWithPresentationOptions:0 dismissalOptions:1];
    double v6 = SBAppendSwitcherModifierResponse(v5, v4);

    BOOL v7 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:self->_fullScreenAppLayout];
    id v4 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v7 gestureInitiated:0];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v4, v6);
  }
  else
  {
    objc_super v9 = [(SBFullScreenContinuousExposeSwitcherModifier *)self switcherSettings];
    uint64_t v10 = [v9 chamoisSettings];
    int v11 = [v10 tapWallpaperToGoHome];

    if (!v11) {
      goto LABEL_6;
    }
    uint64_t v12 = +[SBAppLayout homeScreenAppLayout];
    objc_super v5 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v12];

    BOOL v7 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v5 gestureInitiated:0];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v4);
  }

  id v4 = (SBPerformTransitionSwitcherEventResponse *)v8;
LABEL_6:
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v34 handleTransitionEvent:v4];
  double v6 = [v4 fromAppLayout];
  BOOL v7 = [v4 toAppLayout];
  if ([v4 phase] == 2)
  {
    uint64_t v8 = [v7 allItems];
    if ((unint64_t)[v8 count] <= 2)
    {
    }
    else
    {
      int v9 = [v6 isEqual:v7];

      if (v9)
      {
        if ([v4 isKeyboardShortcutInitiated])
        {
          uint64_t v10 = [v4 fromDisplayItemLayoutAttributesMap];
          int v11 = [v4 toDisplayItemLayoutAttributesMap];
          double v31 = v10;
          uint64_t v12 = __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke((uint64_t)v11, v10);
          int v13 = __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke((uint64_t)v12, v11);
          objc_super v14 = [v12 lastObject];
          double v15 = [v13 lastObject];
          if ([v14 isEqual:v15])
          {

LABEL_12:
            goto LABEL_15;
          }
          double v29 = v11;
          double v30 = v15;
          v26 = v13;
          double v28 = v12;
          zOrderedLeafAppLayoutsForKeyboardNavigation = self->_zOrderedLeafAppLayoutsForKeyboardNavigation;
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke_3;
          v32[3] = &unk_1E6AFA000;
          id v17 = v14;
          id v33 = v17;
          uint64_t v18 = [(NSArray *)zOrderedLeafAppLayoutsForKeyboardNavigation indexOfObjectPassingTest:v32];
          unint64_t v19 = (v18 + 1) % [(NSArray *)self->_zOrderedLeafAppLayoutsForKeyboardNavigation count];
          if (v18 <= 0) {
            uint64_t v18 = [(NSArray *)self->_zOrderedLeafAppLayoutsForKeyboardNavigation count];
          }
          double v20 = -[NSArray objectAtIndex:](self->_zOrderedLeafAppLayoutsForKeyboardNavigation, "objectAtIndex:", v19, v26);
          if ([v20 containsItem:v30])
          {

            goto LABEL_12;
          }
          double v21 = [(NSArray *)self->_zOrderedLeafAppLayoutsForKeyboardNavigation objectAtIndex:v18 - 1];
          char v22 = [v21 containsItem:v30];

          if (v22) {
            goto LABEL_15;
          }
        }
        [(SBFullScreenContinuousExposeSwitcherModifier *)self _resetKeyboardNavigationZOrder];
      }
    }
  }
LABEL_15:
  if ([v4 phase] == 2 && objc_msgSend(v4, "toEnvironmentMode") != 3)
  {
    double v23 = [[SBUpdateContinuousExposeStripsPresentationResponse alloc] initWithPresentationOptions:0 dismissalOptions:1];
    uint64_t v24 = SBAppendSwitcherModifierResponse(v23, v5);

    objc_super v5 = (void *)v24;
  }

  return v5;
}

id __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned __int8 v3 = [v2 allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke_2;
  v7[3] = &unk_1E6B00710;
  id v8 = v2;
  id v4 = v2;
  objc_super v5 = [v3 sortedArrayUsingComparator:v7];

  return v5;
}

uint64_t __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v5 = *(void **)(a1 + 32);
  id v6 = a3;
  BOOL v7 = [v5 objectForKey:a2];
  uint64_t v8 = [v7 lastInteractionTime];

  int v9 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v10 = [v9 lastInteractionTime];
  int v11 = [NSNumber numberWithInteger:v8];
  uint64_t v12 = [NSNumber numberWithInteger:v10];
  uint64_t v13 = [v11 compare:v12];

  return v13;
}

uint64_t __70__SBFullScreenContinuousExposeSwitcherModifier_handleTransitionEvent___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (id)handlePointerCrossedDisplayBoundaryEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFullScreenContinuousExposeSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v11 handlePointerCrossedDisplayBoundaryEvent:v4];
  int v6 = [v4 edge];
  if (v6 == [(SBFullScreenContinuousExposeSwitcherModifier *)self _continuousExposeStripEdge])
  {
    [(SBFullScreenContinuousExposeSwitcherModifier *)self continuousExposeStripProgress];
    if (BSFloatIsZero())
    {
      if ([v4 direction] == 1)
      {
        uint64_t v7 = 1;
      }
      else
      {
        if ([v4 direction]) {
          goto LABEL_8;
        }
        uint64_t v7 = 0;
      }
      id v8 = [[SBPresentContinuousExposeStripEdgeProtectGrabberEventResponse alloc] initForInitialPresentation:v7];
      uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

      objc_super v5 = (void *)v9;
    }
  }
LABEL_8:

  return v5;
}

- (BOOL)_isStripStashed
{
  unsigned __int8 v3 = [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayoutOnStage];
  id v4 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v3];

  LOBYTE(v3) = [v4 isStripVisible] ^ 1;
  return (char)v3;
}

- (BOOL)_shouldEnableItemResizeGrabbersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  [(SBFullScreenContinuousExposeSwitcherModifier *)self _continuousExposeStripRevealProgress];
  if (((BSFloatIsZero() & 1) != 0
     || ![(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripStashed])
    && [(SBFullScreenContinuousExposeSwitcherModifier *)self isDisplayEmbedded]
    && [(SBFullScreenContinuousExposeSwitcherModifier *)self _isAppLayoutEffectivelyOnStage:v6]&& [(SBFullScreenContinuousExposeSwitcherModifier *)self appLayoutContainsOnlyResizableApps:v6]&& SBLayoutRoleIsValidForSplitView(a3))
  {
    BOOL v7 = ![(SBFullScreenContinuousExposeSwitcherModifier *)self isLayoutRoleOccluded:a3 inAppLayout:v6];
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_isAppLayoutEffectivelyOnStage:(id)a3
{
  id v4 = a3;
  if ([(SBAppLayout *)self->_fullScreenAppLayout containsAllItemsFromAppLayout:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 containsAllItemsFromAppLayout:self->_fullScreenAppLayout];
  }

  return v5;
}

- (BOOL)_stageContainsFullScreenItem
{
  return [(SBSwitcherModifier *)self appLayoutContainsFullScreenDisplayItem:self->_fullScreenAppLayout];
}

- (BOOL)_isStripRevealedFromHidden
{
  if ([(SBFullScreenContinuousExposeSwitcherModifier *)self _isStripStashed]
    || (int v3 = [(SBFullScreenContinuousExposeSwitcherModifier *)self prefersStripHidden]) != 0)
  {
    [(SBFullScreenContinuousExposeSwitcherModifier *)self _continuousExposeStripRevealProgress];
    LOBYTE(v3) = BSFloatGreaterThanFloat();
  }
  return v3;
}

- (unsigned)_continuousExposeStripEdge
{
  return 2 * ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1);
}

- (void)_resetKeyboardNavigationZOrder
{
  int v3 = [(SBAppLayout *)self->_fullScreenAppLayout zOrderedLeafAppLayouts];
  zOrderedLeafAppLayoutsForKeyboardNavigation = self->_zOrderedLeafAppLayoutsForKeyboardNavigation;
  self->_zOrderedLeafAppLayoutsForKeyboardNavigation = v3;
}

- (SBAppLayout)fullScreenAppLayout
{
  return self->_fullScreenAppLayout;
}

- (BOOL)handlesTapAppLayoutEvents
{
  return self->_handlesTapAppLayoutEvents;
}

- (void)setHandlesTapAppLayoutEvents:(BOOL)a3
{
  self->_handlesTapAppLayoutEvents = a3;
}

- (BOOL)handlesTapAppLayoutHeaderEvents
{
  return self->_handlesTapAppLayoutHeaderEvents;
}

- (void)setHandlesTapAppLayoutHeaderEvents:(BOOL)a3
{
  self->_handlesTapAppLayoutHeaderEvents = a3;
}

- (BOOL)isContinuousExposeConfigurationChangeTransition
{
  return self->_continuousExposeConfigurationChangeTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_zOrderedLeafAppLayoutsForKeyboardNavigation, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayoutModifier, 0);
  objc_storeStrong((id *)&self->_stripModifier, 0);
}

@end