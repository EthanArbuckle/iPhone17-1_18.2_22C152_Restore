@interface SBInlineAppExposeContinuousExposeSwitcherModifier
- (BOOL)_canShowReopenClosedWindowsButton;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isFocusEnabledForAppLayout:(id)a3;
- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isItemContainerPointerInteractionEnabled;
- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isScrollEnabled;
- (BOOL)isShowingReopenClosedWindowsButton;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)shouldConfigureInAppDockHiddenAssertion;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldScrollViewBlockTouches;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)switcherHitTestsAsOpaque;
- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3;
- (CGRect)_inlineAppExposeSwitcherFrame;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (NSMutableSet)highlightedByHoverAppLayouts;
- (NSMutableSet)highlightedByTouchAppLayouts;
- (NSString)appExposeBundleIdentifier;
- (SBAppLayout)activeAppLayout;
- (SBFullScreenAppLayoutSwitcherModifier)fullScreenAppLayoutModifier;
- (SBInlineAppExposeContinuousExposeSwitcherModifier)initWithActiveAppLayout:(id)a3 appExposeBundleIdentifier:(id)a4;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_scaleForActiveAppLayoutLeafAppLayouts;
- (double)_scaleForInlineAppExposeAppLayouts;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)dockProgress;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)_inlineAppExposeAppLayouts;
- (id)_responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)handleHighlightEvent:(id)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTapAppLayoutHeaderEvent:(id)a3;
- (id)handleTapOutsideToDismissEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)visibleAppLayouts;
- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)plusButtonStyle;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
- (unint64_t)_maximumNumberOfInlineAppExposeAppLayouts;
- (unint64_t)_maximumNumberOfInlineAppExposeColumns;
- (unint64_t)_maximumNumberOfInlineAppExposeRows;
- (unint64_t)_numberOfInlineAppExposeAppLayouts;
- (unint64_t)_numberOfInlineAppExposeColumns;
- (unint64_t)_numberOfInlineAppExposeRows;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (unint64_t)numberOfHiddenAppLayouts;
- (void)setFullScreenAppLayoutModifier:(id)a3;
- (void)setHighlightedByHoverAppLayouts:(id)a3;
- (void)setHighlightedByTouchAppLayouts:(id)a3;
- (void)setNumberOfHiddenAppLayouts:(unint64_t)a3;
- (void)setShowingReopenClosedWindowsButton:(BOOL)a3;
@end

@implementation SBInlineAppExposeContinuousExposeSwitcherModifier

- (SBInlineAppExposeContinuousExposeSwitcherModifier)initWithActiveAppLayout:(id)a3 appExposeBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activeAppLayout, a3);
    uint64_t v11 = [v8 copy];
    appExposeBundleIdentifier = v10->_appExposeBundleIdentifier;
    v10->_appExposeBundleIdentifier = (NSString *)v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    highlightedByHoverAppLayouts = v10->_highlightedByHoverAppLayouts;
    v10->_highlightedByHoverAppLayouts = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    highlightedByTouchAppLayouts = v10->_highlightedByTouchAppLayouts;
    v10->_highlightedByTouchAppLayouts = v15;

    v17 = [[SBFullScreenAppLayoutSwitcherModifier alloc] initWithActiveAppLayout:v10->_activeAppLayout];
    fullScreenAppLayoutModifier = v10->_fullScreenAppLayoutModifier;
    v10->_fullScreenAppLayoutModifier = v17;

    [(SBChainableModifier *)v10 addChildModifier:v10->_fullScreenAppLayoutModifier];
  }

  return v10;
}

- (id)handleInsertionEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleInsertionEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v10.receiver, v10.super_class);

  if (v6 == 2)
  {
    id v7 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v14 handleTransitionEvent:v4];
  uint64_t v6 = [v4 toAppLayout];
  activeAppLayout = self->_activeAppLayout;
  self->_activeAppLayout = v6;

  if ([v4 phase] == 2)
  {
    uint64_t v8 = [v4 fromAppExposeBundleID];
    if (v8)
    {
      v9 = (void *)v8;
    }
    else
    {
      objc_super v10 = [v4 toAppExposeBundleID];

      if (!v10) {
        goto LABEL_7;
      }
      v9 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded];
      uint64_t v11 = SBAppendSwitcherModifierResponse(v9, v5);

      v12 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
      v5 = SBAppendSwitcherModifierResponse(v12, v11);
    }
  }
LABEL_7:

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v14 handleTapAppLayoutEvent:v4];
  if (([v4 isHandled] & 1) == 0)
  {
    uint64_t v6 = [v4 appLayout];
    if ([v6 isEqual:self->_activeAppLayout])
    {
      id v7 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:v4];
      [(SBSwitcherTransitionRequest *)v7 setRetainsSiri:[(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isSystemAssistantExperiencePersistentSiriEnabled]];
    }
    else
    {
      uint64_t v8 = objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));
      id v7 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      v9 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v6];
      objc_super v10 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayoutByBringingItemToFront:v8 inAppLayout:v9];
      [(SBSwitcherTransitionRequest *)v7 setAppLayout:v10];

      [(SBSwitcherTransitionRequest *)v7 setActivatingDisplayItem:v8];
      if (([v4 modifierFlags] & 0x20000) != 0) {
        [(SBSwitcherTransitionRequest *)v7 setEntityInsertionPolicy:1];
      }
    }
    uint64_t v11 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v7 gestureInitiated:0];
    uint64_t v12 = SBAppendSwitcherModifierResponse(v11, v5);

    [v4 handleWithReason:@"In-line App Exposé"];
    v5 = (void *)v12;
  }

  return v5;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v18 handleTapAppLayoutHeaderEvent:v4];
  if (([v4 isHandled] & 1) == 0)
  {
    uint64_t v6 = [v4 appLayout];
    id v7 = objc_msgSend(v6, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));
    if ([(SBInlineAppExposeContinuousExposeSwitcherModifier *)self displayItemSupportsMultipleWindowsIndicator:v7])
    {
      uint64_t v8 = [v7 bundleIdentifier];
      int v9 = [v8 isEqualToString:self->_appExposeBundleIdentifier];

      if (v9)
      {
        if ([v6 isEqual:self->_activeAppLayout])
        {
          objc_super v10 = +[SBSwitcherTransitionRequest requestForTapAppLayoutHeaderEvent:v4];
        }
        else
        {
          objc_super v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
          v13 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v6];
          objc_super v14 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayoutByBringingItemToFront:v7 inAppLayout:v13];
          [(SBSwitcherTransitionRequest *)v10 setAppLayout:v14];

          [(SBSwitcherTransitionRequest *)v10 setActivatingDisplayItem:v7];
        }
      }
      else
      {
        objc_super v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        [(SBSwitcherTransitionRequest *)v10 setSource:3];
        uint64_t v12 = [v7 bundleIdentifier];
        [(SBSwitcherTransitionRequest *)v10 setBundleIdentifierForAppExpose:v12];
      }
      uint64_t v11 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v10 gestureInitiated:0];
    }
    else
    {
      objc_super v10 = [[SBPulseDisplayItemSwitcherModifier alloc] initWithDisplayItem:v7];
      uint64_t v11 = [[SBAddModifierSwitcherEventResponse alloc] initWithModifier:v10 level:3];
    }
    v15 = v11;
    uint64_t v16 = SBAppendSwitcherModifierResponse(v11, v5);

    [v4 handleWithReason:@"In-line App Exposé"];
    v5 = (void *)v16;
  }

  return v5;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleTapOutsideToDismissEvent:v4];
  uint64_t v6 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_activeAppLayout, v10.receiver, v10.super_class);
  id v7 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v6 gestureInitiated:0];
  uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

  [v4 handleWithReason:@"In-line App Exposé"];
  return v8;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleTimerEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"SBInlineAppExposeContinuousExposeSwitcherModifierTimerEventReason"];
  if (v4)
  {
    self->_showingReopenClosedWindowsButton = 1;
    id v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleHighlightEvent:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v35 handleHighlightEvent:v4];
  if (([v4 isHandled] & 1) == 0)
  {
    unint64_t v6 = [v4 phase] - 1;
    id v7 = [v4 appLayout];
    char v8 = [v7 isEqual:self->_activeAppLayout];
    int v9 = [v4 isHoverEvent];
    if ((v8 & 1) == 0 && v6 > 1)
    {
      if (v9) {
        uint64_t v10 = 120;
      }
      else {
        uint64_t v10 = 128;
      }
      [*(id *)((char *)&self->super.super.super.isa + v10) addObject:v7];
      goto LABEL_35;
    }
    if (v6 < 2) {
      int v11 = v9;
    }
    else {
      int v11 = 0;
    }
    if (v11 == 1)
    {
      uint64_t v12 = 120;
      if (![(NSMutableSet *)self->_highlightedByHoverAppLayouts containsObject:v7])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v13 = (void *)[(NSMutableSet *)self->_highlightedByHoverAppLayouts copy];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              objc_super v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if ([v18 containsAnyItemFromAppLayout:v7]) {
                [(NSMutableSet *)self->_highlightedByHoverAppLayouts removeObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }
          while (v15);
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v12 = 128;
      if (![(NSMutableSet *)self->_highlightedByTouchAppLayouts containsObject:v7])
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v13 = (void *)[(NSMutableSet *)self->_highlightedByTouchAppLayouts copy];
        uint64_t v19 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v13);
              }
              v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              if ([v23 containsAnyItemFromAppLayout:v7]) {
                [(NSMutableSet *)self->_highlightedByTouchAppLayouts removeObject:v23];
              }
            }
            uint64_t v20 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }
          while (v20);
        }
        goto LABEL_34;
      }
    }
    [*(id *)((char *)&self->super.super.super.isa + v12) removeObject:v7];
LABEL_35:
    v24 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:3];
    uint64_t v25 = SBAppendSwitcherModifierResponse(v24, v5);

    [v4 handleWithReason:@"In-line App Exposé"];
    v5 = (void *)v25;
  }

  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  id v4 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)&v13 adjustedAppLayoutsForAppLayouts:a3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__SBInlineAppExposeContinuousExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v12[3] = &unk_1E6AF9F18;
  v12[4] = self;
  v5 = objc_msgSend(v4, "bs_compactMap:", v12);
  unint64_t v6 = objc_msgSend(v5, "bs_flatten");

  unint64_t v7 = [v6 count];
  unint64_t v8 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _maximumNumberOfInlineAppExposeAppLayouts];
  if (v7 >= v8 + 1) {
    unint64_t v9 = v8 + 1;
  }
  else {
    unint64_t v9 = v7;
  }
  uint64_t v10 = objc_msgSend(v6, "subarrayWithRange:", 0, v9);

  return v10;
}

id __85__SBInlineAppExposeContinuousExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqual:*(void *)(*(void *)(a1 + 32) + 104)] & 1) != 0
    || ([v3 continuousExposeIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 containsString:*(void *)(*(void *)(a1 + 32) + 112)],
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)visibleAppLayouts
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if ([v9 isEqual:self->_activeAppLayout])
  {
    uint64_t v32 = 0;
    long long v33 = (double *)&v32;
    uint64_t v34 = 0x4010000000;
    objc_super v35 = &unk_1D90ED3C6;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v36 = *MEMORY[0x1E4F1DB20];
    long long v37 = v10;
    activeAppLayout = self->_activeAppLayout;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __98__SBInlineAppExposeContinuousExposeSwitcherModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke;
    v25[3] = &unk_1E6B03258;
    v25[4] = self;
    double v28 = x;
    double v29 = y;
    double v30 = width;
    double v31 = height;
    id v26 = v9;
    long long v27 = &v32;
    [(SBAppLayout *)activeAppLayout enumerate:v25];
    double v12 = v33[4];
    double v13 = v33[5];
    double v14 = v33[6];
    double v15 = v33[7];

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    -[SBInlineAppExposeContinuousExposeSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v24, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
    double v15 = v19;
  }

  double v20 = v12;
  double v21 = v13;
  double v22 = v14;
  double v23 = v15;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

void __98__SBInlineAppExposeContinuousExposeSwitcherModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  SBRectWithSize();
  objc_msgSend(v4, "frameForLayoutRole:inAppLayout:withBounds:", a2, v5);
  CGRectOffset(v18, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
  uint64_t v6 = *(void *)(a1 + 40);
  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  objc_msgSendSuper2(&v17, sel_scaleForLayoutRole_inAppLayout_, a2, v6);
  [*(id *)(a1 + 32) _scaleForActiveAppLayoutLeafAppLayouts];
  SBTransformedRectWithScale();
  CGFloat v8 = v7;
  CGFloat y = v9;
  CGFloat width = v11;
  CGFloat height = v13;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  double v16 = *(CGRect **)(*(void *)(a1 + 48) + 8);
  if (IsNull)
  {
    v16[1].origin.double x = v8;
  }
  else
  {
    v20.origin.double x = v8;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v19 = CGRectUnion(v16[1], v20);
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
    double v16 = *(CGRect **)(*(void *)(a1 + 48) + 8);
    v16[1].origin.double x = v19.origin.x;
  }
  v16[1].origin.CGFloat y = y;
  v16[1].size.CGFloat width = width;
  v16[1].size.CGFloat height = height;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v37.receiver = self;
  v37.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier frameForIndex:](&v37, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _inlineAppExposeAppLayouts];
  double v14 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  double v15 = [v14 objectAtIndex:a3];

  if ([v13 containsObject:v15])
  {
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self containerViewBounds];
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
    round(CGRectGetHeight(v38) * 0.0625);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    round(CGRectGetHeight(v39) * 0.0625);
    if ([(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isDisplayEmbedded]) {
      double v20 = 192.0;
    }
    else {
      double v20 = 132.0;
    }
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double v21 = CGRectGetHeight(v40);
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self floatingDockPresentedHeight];
    round((v21- v22+ -128.0+ -128.0- (double)([(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _maximumNumberOfInlineAppExposeRows]- 1)* v20)/ (double)[(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _maximumNumberOfInlineAppExposeRows]);
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeRows];
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeRows];
    [v13 indexOfObject:v15];
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeRows];
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeRows];
    double v23 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
    [v23 defaultWindowSize];
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _scaleForInlineAppExposeAppLayouts];

    uint64_t v24 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    CGFloat v25 = x;
    CGFloat v26 = y;
    CGFloat v27 = width;
    CGFloat v28 = height;
    if (v24 == 1) {
      CGRectGetMaxX(*(CGRect *)&v25);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v25);
    }
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeColumns];
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeColumns];
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    CGRectGetMinX(v41);
    UIRectCenteredAboutPoint();
    double v6 = v29;
    double v8 = v30;
    double v10 = v31;
    double v12 = v32;
  }

  double v33 = v6;
  double v34 = v8;
  double v35 = v10;
  double v36 = v12;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  v52.receiver = self;
  v52.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  -[SBInlineAppExposeContinuousExposeSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v52, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  if ([v11 isEqual:self->_activeAppLayout])
  {
    double v20 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v11];
    [v20 boundingBox];
    CGFloat v50 = v21;
    CGFloat v51 = v22;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self scaleForLayoutRole:a3 inAppLayout:v11];
    double v28 = v27;
    v53.origin.double x = v13;
    v53.origin.double y = v15;
    v53.size.double width = v17;
    v53.size.double height = v19;
    double MidX = CGRectGetMidX(v53);
    double v30 = (id *)MEMORY[0x1E4F43630];
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      v54.origin.double x = v50;
      v54.origin.double y = v51;
      v54.size.double width = v24;
      v54.size.double height = v26;
      double MinX = CGRectGetMinX(v54);
    }
    else
    {
      v55.origin.double x = v50;
      v55.origin.double y = v51;
      v55.size.double width = v24;
      v55.size.double height = v26;
      double MinX = CGRectGetMaxX(v55);
    }
    double v32 = MidX - MinX;
    double v33 = 1.0 - v28;
    double v49 = (1.0 - v28) * v32;
    v56.origin.double x = v13;
    v56.origin.double y = v15;
    v56.size.double width = v17;
    v56.size.double height = v19;
    double MidY = CGRectGetMidY(v56);
    v57.origin.double x = v50;
    v57.origin.double y = v51;
    v57.size.double width = v24;
    v57.size.double height = v26;
    CGFloat v35 = v15 - v33 * (MidY - CGRectGetMidY(v57));
    uint64_t v36 = [*v30 userInterfaceLayoutDirection];
    v58.origin.double x = v13 - v49;
    v58.origin.double y = v35;
    v58.size.double width = v17;
    v58.size.double height = v19;
    CGRectGetMinX(v58);
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _inlineAppExposeSwitcherFrame];
    if (v36 == 1)
    {
      CGRectGetMinX(*(CGRect *)&v37);
      v59.origin.double x = v50;
      v59.origin.double y = v51;
      v59.size.double width = v24;
      v59.size.double height = v26;
      CGRectGetWidth(v59);
    }
    else
    {
      CGRectGetMaxX(*(CGRect *)&v37);
      v60.origin.double x = v50;
      v60.origin.double y = v51;
      v60.size.double width = v24;
      v60.size.double height = v26;
      CGRectGetMinX(v60);
    }
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self screenScale];
    UIRectRoundToScale();
    double v13 = v41;
    double v15 = v42;
    CGFloat v17 = v43;
    CGFloat v19 = v44;
  }

  double v45 = v13;
  double v46 = v15;
  double v47 = v17;
  double v48 = v19;
  result.size.double height = v48;
  result.size.double width = v47;
  result.origin.double y = v46;
  result.origin.double x = v45;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_activeAppLayout])
  {
    v10.receiver = self;
    v10.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)&v10 scaleForIndex:a3];
  }
  else
  {
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _scaleForInlineAppExposeAppLayouts];
  }
  double v8 = v7;

  return v8;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)&v20 scaleForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  double v9 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  objc_super v10 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v6];
  id v11 = [v6 itemForLayoutRole:a3];
  double v12 = [v10 autoLayoutItemForDisplayItem:v11];

  if ([v12 isFullyOccluded])
  {
    [v9 stageOcclusionDodgingPeekScale];
  }
  else
  {
    if (![v12 isOverlapped]) {
      goto LABEL_6;
    }
    [v12 size];
    objc_msgSend(v9, "partiallyOccludedStageScaleForItemWithSize:");
  }
  double v8 = v8 * v13;
LABEL_6:
  if ([v6 isEqual:self->_activeAppLayout])
  {
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _scaleForActiveAppLayoutLeafAppLayouts];
LABEL_16:
    double v8 = v8 * v14;
    goto LABEL_17;
  }
  double v15 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self highlightedByHoverAppLayouts];
  int v16 = [v15 containsObject:v6];

  CGFloat v17 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self highlightedByTouchAppLayouts];
  int v18 = [v17 containsObject:v6];

  if (v16 && v18)
  {
    double v14 = 0.98;
    goto LABEL_16;
  }
  if (((v16 ^ 1 | v18) & 1) == 0)
  {
    double v14 = 1.1;
    goto LABEL_16;
  }
  if (v18) {
    double v8 = v8 * 0.9;
  }
LABEL_17:

  return v8;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_activeAppLayout])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    BOOL v7 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)&v9 shouldPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_activeAppLayout])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    BOOL v7 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  id v4 = self;
  double v5 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];
  LODWORD(v4) = [v6 isEqual:v4->_activeAppLayout];

  double result = 1.0;
  if (v4) {
    return 0.0;
  }
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (BOOL)isContainerStatusBarVisible
{
  return 0;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 10;
}

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  return 1;
}

- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3
{
  return 10.0;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isEqual:self->_activeAppLayout]) {
    BOOL v7 = ![(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isLayoutRoleOccluded:a3 inAppLayout:v6];
  }
  else {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  activeAppLayout = self->_activeAppLayout;
  id v7 = a4;
  if ([v7 isEqual:activeAppLayout])
  {
    BOOL v8 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isLayoutRoleOccluded:a3 inAppLayout:v7];

    if (v8) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    id v9 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)&v11 touchBehaviorForLayoutRole:a3 inAppLayout:v7];
  }
  return (int64_t)v9;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return self->_appExposeBundleIdentifier;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 1;
}

- (double)plusButtonAlpha
{
  return 1.0;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  if (![(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _canShowReopenClosedWindowsButton]|| (BOOL v4 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isShowingReopenClosedWindowsButton], result = 1.0, !v4))
  {
    v5.receiver = self;
    v5.super_class = (Class)SBInlineAppExposeContinuousExposeSwitcherModifier;
    [(SBInlineAppExposeContinuousExposeSwitcherModifier *)&v5 reopenClosedWindowsButtonAlpha];
  }
  return result;
}

- (double)reopenClosedWindowsButtonScale
{
  if ([(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isShowingReopenClosedWindowsButton])
  {
    return 1.0;
  }
  BOOL v4 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self switcherSettings];
  objc_super v5 = [v4 animationSettings];
  [v5 reopenButtonInitialScale];
  double v7 = v6;

  return v7;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return [a3 isEqual:self->_activeAppLayout] ^ 1;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 1;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  objc_super v5 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  [v5 stageCornerRadii];
  [v5 stripCornerRadii];
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self displayCornerRadius];
  double v6 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  double v7 = [v6 objectAtIndex:a3];

  if ([v7 isEqual:self->_activeAppLayout]
    && [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayoutContainsAnUnoccludedMaximizedDisplayItem:self->_activeAppLayout])
  {
    BSFloatIsZero();
  }
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self scaleForIndex:a3];
  SBRectCornerRadiiForRadius();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (double)dockProgress
{
  return 0.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isScrollEnabled
{
  return 0;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (double)homeScreenAlpha
{
  return 0.0;
}

- (double)homeScreenBackdropBlurProgress
{
  return 1.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
}

- (double)homeScreenDimmingAlpha
{
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self containerViewBounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_activeAppLayout];
  [v7 boundingBox];
  double v9 = v8;
  double v11 = v10;

  double v12 = fmin(fmax((v9 * v11 / (v4 * v6) + -0.7) * 0.5 / 0.3 + 0.0, 0.0), 1.0);
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self continuousExposeStripProgress];
  return v12 + v13 * (v12 * 0.5 - v12);
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  double v3 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_activeAppLayout];
  [v3 stageArea];
  double v6 = v4 + v5;
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self containerViewBounds];
  double v8 = v7;
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self floatingDockHeight];
  double v10 = v9;
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self floatingDockViewTopMargin];
  double v12 = v8 - (v10 + v11);
  if (![(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isSoftwareKeyboardVisible])
  {
    if (v6 > v12)
    {
      char v13 = 1;
      goto LABEL_8;
    }
LABEL_7:
    char v13 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self prefersDockHidden];
    goto LABEL_8;
  }
  char v13 = 1;
  if (([(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isMedusaHostedKeyboardVisible] & 1) == 0&& v6 <= v12)
  {
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (BOOL)shouldScrollViewBlockTouches
{
  return 0;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (id)_inlineAppExposeAppLayouts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v9 = [v8 continuousExposeIdentifier];
        if ([v9 containsString:self->_appExposeBundleIdentifier])
        {
          char v10 = [v8 isEqual:self->_activeAppLayout];

          if ((v10 & 1) == 0) {
            [v12 addObject:v8];
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v12;
}

- (CGRect)_inlineAppExposeSwitcherFrame
{
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self containerViewBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  unint64_t v11 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeColumns];
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  double v12 = round(CGRectGetHeight(v25) * 0.0625);
  v26.origin.double x = v4;
  v26.origin.double y = v6;
  v26.size.double width = v8;
  v26.size.double height = v10;
  double v13 = round(CGRectGetHeight(v26) * 0.0625);
  long long v14 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  [v14 defaultWindowSize];
  double v16 = v15;
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _scaleForInlineAppExposeAppLayouts];
  double v18 = v12 + v12 + v16 * v17 * (double)v11 + v13 * (double)(uint64_t)(v11 - 1) + -10.0;

  v27.origin.double x = v4;
  v27.origin.double y = v6;
  v27.size.double width = v8;
  v27.size.double height = v10;
  CGFloat Height = CGRectGetHeight(v27);
  double v20 = 0.0;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    v28.origin.double x = v4;
    v28.origin.double y = v6;
    v28.size.double width = v8;
    v28.size.double height = v10;
    double v20 = CGRectGetMaxX(v28) - v18;
  }
  v29.origin.double x = v4;
  v29.origin.double y = v6;
  v29.size.double width = v8;
  v29.size.double height = v10;
  double MinY = CGRectGetMinY(v29);
  double v22 = v20;
  double v23 = v18;
  double v24 = Height;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = MinY;
  result.origin.double x = v22;
  return result;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  double v7 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v6];
  CGFloat v8 = [v6 itemForLayoutRole:a3];

  double v9 = [v7 autoLayoutItemForDisplayItem:v8];

  if ([v9 isFullyOccluded] & 1) != 0 || (objc_msgSend(v9, "isOverlapped")) {
    char v10 = 1;
  }
  else {
    char v10 = [v9 isPartiallyCoveredByPeekingItem];
  }

  return v10;
}

- (unint64_t)_maximumNumberOfInlineAppExposeAppLayouts
{
  unint64_t v3 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _maximumNumberOfInlineAppExposeColumns];
  return [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _maximumNumberOfInlineAppExposeRows]* v3;
}

- (unint64_t)_maximumNumberOfInlineAppExposeColumns
{
  if ([(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isDisplayEmbedded]) {
    return 3;
  }
  else {
    return 4;
  }
}

- (unint64_t)_maximumNumberOfInlineAppExposeRows
{
  unint64_t v3 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self switcherSettings];
  CGFloat v4 = [v3 chamoisSettings];

  if ([(SBInlineAppExposeContinuousExposeSwitcherModifier *)self isDisplayEmbedded]) {
    uint64_t v5 = [v4 numberOfRowsWhileInAppOnEmbeddedDisplay];
  }
  else {
    uint64_t v5 = [v4 numberOfRowsWhileInAppOnExternalDisplay];
  }
  unint64_t v6 = v5;

  return v6;
}

- (unint64_t)_numberOfInlineAppExposeAppLayouts
{
  v2 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _inlineAppExposeAppLayouts];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)_numberOfInlineAppExposeColumns
{
  double v3 = ceil((double)[(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeAppLayouts]/ (double)[(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeRows]);
  double v4 = (double)[(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _maximumNumberOfInlineAppExposeColumns];
  if (v3 <= v4) {
    return (unint64_t)v3;
  }
  return (unint64_t)v4;
}

- (unint64_t)_numberOfInlineAppExposeRows
{
  unint64_t v3 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _numberOfInlineAppExposeAppLayouts];
  unint64_t result = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _maximumNumberOfInlineAppExposeRows];
  if (v3 < result) {
    return v3;
  }
  return result;
}

- (double)_scaleForActiveAppLayoutLeafAppLayouts
{
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self containerViewBounds];
  double Height = CGRectGetHeight(v9);
  [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self floatingDockPresentedHeight];
  double v5 = Height - v4 + -192.0;
  unint64_t v6 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_activeAppLayout];
  [v6 boundingBox];
  double v7 = CGRectGetHeight(v10);

  double result = v5 / v7;
  if (v5 / v7 > 1.0) {
    return 1.0;
  }
  return result;
}

- (double)_scaleForInlineAppExposeAppLayouts
{
  v2 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  [v2 stripCardScale];
  double v4 = v3;

  return v4;
}

- (BOOL)_canShowReopenClosedWindowsButton
{
  return self->_numberOfHiddenAppLayouts != 0;
}

- (id)_responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded
{
  BOOL v3 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _canShowReopenClosedWindowsButton];
  self->_numberOfHiddenAppLayouts = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self numberOfHiddenAppLayoutsForBundleIdentifier:self->_appExposeBundleIdentifier];
  double v4 = 0;
  if ([(SBInlineAppExposeContinuousExposeSwitcherModifier *)self _canShowReopenClosedWindowsButton]&& !v3)
  {
    self->_showingReopenClosedWindowsButton = 0;
    double v5 = [(SBInlineAppExposeContinuousExposeSwitcherModifier *)self switcherSettings];
    unint64_t v6 = [v5 animationSettings];
    [v6 reopenButtonFadeInDelay];
    double v8 = v7;

    objc_initWeak(&location, self);
    CGRect v9 = [SBTimerEventSwitcherEventResponse alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __111__SBInlineAppExposeContinuousExposeSwitcherModifier__responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded__block_invoke;
    v11[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v12, &location);
    double v4 = [(SBTimerEventSwitcherEventResponse *)v9 initWithDelay:v11 validator:@"SBInlineAppExposeContinuousExposeSwitcherModifierTimerEventReason" reason:v8];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

BOOL __111__SBInlineAppExposeContinuousExposeSwitcherModifier__responseToUpdateReopenClosedWindowsButtonPresenceIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SBAppLayout)activeAppLayout
{
  return self->_activeAppLayout;
}

- (NSString)appExposeBundleIdentifier
{
  return self->_appExposeBundleIdentifier;
}

- (NSMutableSet)highlightedByHoverAppLayouts
{
  return self->_highlightedByHoverAppLayouts;
}

- (void)setHighlightedByHoverAppLayouts:(id)a3
{
}

- (NSMutableSet)highlightedByTouchAppLayouts
{
  return self->_highlightedByTouchAppLayouts;
}

- (void)setHighlightedByTouchAppLayouts:(id)a3
{
}

- (SBFullScreenAppLayoutSwitcherModifier)fullScreenAppLayoutModifier
{
  return self->_fullScreenAppLayoutModifier;
}

- (void)setFullScreenAppLayoutModifier:(id)a3
{
}

- (unint64_t)numberOfHiddenAppLayouts
{
  return self->_numberOfHiddenAppLayouts;
}

- (void)setNumberOfHiddenAppLayouts:(unint64_t)a3
{
  self->_numberOfHiddenAppLayouts = a3;
}

- (BOOL)isShowingReopenClosedWindowsButton
{
  return self->_showingReopenClosedWindowsButton;
}

- (void)setShowingReopenClosedWindowsButton:(BOOL)a3
{
  self->_showingReopenClosedWindowsButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayoutModifier, 0);
  objc_storeStrong((id *)&self->_highlightedByTouchAppLayouts, 0);
  objc_storeStrong((id *)&self->_highlightedByHoverAppLayouts, 0);
  objc_storeStrong((id *)&self->_appExposeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activeAppLayout, 0);
}

@end