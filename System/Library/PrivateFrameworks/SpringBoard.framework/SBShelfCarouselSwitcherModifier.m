@interface SBShelfCarouselSwitcherModifier
- (BOOL)_isIndexVisible:(unint64_t)a3;
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3;
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isFocusEnabledForAppLayout:(id)a3;
- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3;
- (BOOL)isItemContainerPointerInteractionEnabled;
- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isScrollEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAcceleratedHomeButtonPressBegin;
- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3;
- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval;
- (BOOL)shouldConfigureInAppDockHiddenAssertion;
- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode;
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (BOOL)shouldPerformRotationAnimationForOrientationChange;
- (BOOL)shouldRubberbandFullScreenHomeGrabberView;
- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldScrollViewBlockTouches;
- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3;
- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3;
- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3;
- (BOOL)switcherDimmingViewBlocksTouches;
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (BOOL)wantsHomeScreenPointerInteractions;
- (BOOL)wantsSlideOverTongue;
- (BOOL)wantsSwitcherBackdropBlur;
- (BOOL)wantsSwitcherDimmingView;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGRect)_frameForIndex:(unint64_t)a3 applyCarousel:(BOOL)a4;
- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4;
- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (CGRect)frameForShelf:(id)a3;
- (CGRect)shelfBackgroundBlurFrame;
- (CGSize)_cardSizeForAppLayout:(id)a3;
- (CGSize)_cardSizeForIndex:(unint64_t)a3;
- (CGSize)_centerCardSizeForOrientation:(int64_t)a3;
- (CGSize)_contentSize;
- (CGSize)_fittedContentSize;
- (CGSize)_floatingCardSizeForOrientation:(int64_t)a3;
- (SBShelfCarouselSwitcherModifier)init;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (_NSRange)_visibleRange;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)_effectiveMaxCarouselWidth;
- (double)_trailingPaddingIfAny;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)containerStatusBarAnimationDuration;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)contentViewScale;
- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)lighteningAlphaForIndex:(unint64_t)a3;
- (double)minimumTranslationToKillIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)shelfBackgroundBlurOpacity;
- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)switcherBackdropBlurProgress;
- (double)switcherDimmingAlpha;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)_orderedVisibleAppLayouts;
- (id)activeLeafAppLayoutsReachableByKeyboardShortcut;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)appLayoutForReceivingHardwareButtonEvents;
- (id)appLayoutToAttachSlideOverTongue;
- (id)appLayoutToScrollToBeforeReopeningClosedWindows;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)foregroundAppLayouts;
- (id)handleInitialSetupEvent:(id)a3;
- (id)handleShelfFocusedDisplayItemsChangedEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)inactiveAppLayoutsReachableByKeyboardShortcut;
- (id)keyboardSuppressionMode;
- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3;
- (id)scrollViewAttributes;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (id)visibleShelves;
- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle;
- (int64_t)dockUpdateMode;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)plusButtonStyle;
- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)switcherBackdropBlurType;
- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)dockWindowLevelPriority;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (unint64_t)transactionCompletionOptions;
@end

@implementation SBShelfCarouselSwitcherModifier

- (SBShelfCarouselSwitcherModifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBShelfCarouselSwitcherModifier;
  v2 = [(SBSwitcherModifier *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_fittedContentSize_lastAppLayoutsGenCount = 0x7FFFFFFFFFFFFFFFLL;
    v2->_fittedContentSize_lastOrientation = 0;
    CGPoint v5 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v2->_fittedContentSize_lastContainerViewBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v2->_fittedContentSize_lastContainerViewBounds.size = v4;
    v2->_fittedContentSize_lastSwitcherViewBounds.origin = v5;
    v2->_fittedContentSize_lastSwitcherViewBounds.size = v4;
    v2->_fittedContentSize_lastSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v2->_visibleRange_lastAppLayoutsGenCount = 0x7FFFFFFFFFFFFFFFLL;
    v2->_visibleRange_lastOrientation = 0;
    v2->_visibleRange_lastContainerViewBounds.origin = v5;
    v2->_visibleRange_lastContainerViewBounds.size = v4;
    v2->_visibleRange_lastSwitcherViewBounds.origin = v5;
    v2->_visibleRange_lastSwitcherViewBounds.size = v4;
    v2->_visibleRange_lastContentOffset = (CGPoint)SBInvalidPoint;
    v2->_visibleRange_lastRange = (_NSRange)xmmword_1D8FD3140;
    v2->_centerCardSize_containerViewBounds.origin = v5;
    v2->_centerCardSize_containerViewBounds.size = v4;
    v2->_floatingCardSize_containerViewBounds.origin = v5;
    v2->_floatingCardSize_containerViewBounds.size = v4;
    v6 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    [(SBChainableModifier *)v3 addChildModifier:v6];
  }
  return v3;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)visibleAppLayouts
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(SBShelfCarouselSwitcherModifier *)self _orderedVisibleAppLayouts];
  CGSize v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)_orderedVisibleAppLayouts
{
  uint64_t v3 = [(SBShelfCarouselSwitcherModifier *)self _visibleRange];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CGPoint v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    objc_super v8 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
    CGPoint v5 = objc_msgSend(v8, "subarrayWithRange:", v6, v7);
  }
  return v5;
}

- (_NSRange)_visibleRange
{
  if (self->_hasReceivedInitialSetupEvent)
  {
    unint64_t v3 = [(SBShelfCarouselSwitcherModifier *)self appLayoutsGenerationCount];
    int64_t v4 = [(SBShelfCarouselSwitcherModifier *)self switcherInterfaceOrientation];
    [(SBShelfCarouselSwitcherModifier *)self containerViewBounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
    CGFloat v32 = v14;
    CGFloat v33 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [(SBShelfCarouselSwitcherModifier *)self scrollViewContentOffset];
    double v20 = v19;
    double v22 = v21;
    if (*(_OWORD *)&self->_visibleRange_lastAppLayoutsGenCount != __PAIR128__(v4, v3)) {
      goto LABEL_12;
    }
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    if (!CGRectEqualToRect(self->_visibleRange_lastContainerViewBounds, v35)) {
      goto LABEL_12;
    }
    v36.origin.y = v32;
    v36.origin.x = v33;
    v36.size.width = v16;
    v36.size.height = v18;
    if (!CGRectEqualToRect(self->_visibleRange_lastSwitcherViewBounds, v36)) {
      goto LABEL_12;
    }
    if (self->_visibleRange_lastContentOffset.x == v20 && self->_visibleRange_lastContentOffset.y == v22)
    {
      NSUInteger location = self->_visibleRange_lastRange.location;
      NSUInteger length = self->_visibleRange_lastRange.length;
    }
    else
    {
LABEL_12:
      self->_visibleRange_lastAppLayoutsGenCount = v3;
      self->_visibleRange_lastOrientation = v4;
      self->_visibleRange_lastContainerViewBounds.origin.x = v6;
      self->_visibleRange_lastContainerViewBounds.origin.y = v8;
      self->_visibleRange_lastContainerViewBounds.size.width = v10;
      self->_visibleRange_lastContainerViewBounds.size.height = v12;
      self->_visibleRange_lastSwitcherViewBounds.origin.x = v33;
      self->_visibleRange_lastSwitcherViewBounds.origin.y = v32;
      self->_visibleRange_lastSwitcherViewBounds.size.width = v16;
      self->_visibleRange_lastSwitcherViewBounds.size.height = v18;
      self->_visibleRange_lastContentOffset.x = v20;
      self->_visibleRange_lastContentOffset.y = v22;
      v26 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
      uint64_t v27 = [v26 count];

      if (v27)
      {
        uint64_t v28 = 0;
        NSUInteger length = 0;
        NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          if ([(SBShelfCarouselSwitcherModifier *)self _isIndexVisible:v28])
          {
            if (location == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v29 = v28;
            }
            else {
              uint64_t v29 = location;
            }
            ++length;
          }
          else
          {
            uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
            if (location != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
          }
          ++v28;
          NSUInteger location = v29;
        }
        while (v27 != v28);
      }
      else
      {
        NSUInteger length = 0;
        NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      }
      self->_visibleRange_lastRange.NSUInteger location = location;
      self->_visibleRange_lastRange.NSUInteger length = length;
    }
  }
  else
  {
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v30 = location;
  NSUInteger v31 = length;
  result.NSUInteger length = v31;
  result.NSUInteger location = v30;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  -[SBShelfCarouselSwitcherModifier scaleForIndex:](self, "scaleForIndex:");
  double v6 = v5;
  double v7 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v7 switcherShelfCardScale];
  double v9 = v8;

  double v10 = (v6 - v9 * 0.75) * 0.25 / (v9 - v9 * 0.75) + 0.75;
  [(SBShelfCarouselSwitcherModifier *)self frameForIndex:a3];
  UIRectGetCenter();
  double v12 = v11;
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  double v14 = v10 * 0.5;
  if (v12 <= v13 * 0.5) {
    double v14 = 1.0 - v10 * 0.5;
  }
  double v15 = 0.5;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  [(SBShelfCarouselSwitcherModifier *)self _frameForIndex:a3 applyCarousel:1];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  if ([v11 environment] == 1)
  {
    v28.receiver = self;
    v28.super_class = (Class)SBShelfCarouselSwitcherModifier;
    -[SBShelfCarouselSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v28, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    [(SBShelfCarouselSwitcherModifier *)self _cardSizeForAppLayout:v11];

    SBRectWithSize();
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
    double v19 = v23;
  }
  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  double v27 = v19;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGRect)_frameForIndex:(unint64_t)a3 applyCarousel:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = a3;
  if (([(SBShelfCarouselSwitcherModifier *)self isRTLEnabled] & 1) == 0)
  {
    double v8 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
    unint64_t v7 = [v8 count] + ~a3;
  }
  [(SBShelfCarouselSwitcherModifier *)self _cardSizeForIndex:a3];
  double v10 = v9;
  id v11 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v11 switcherShelfCardScale];
  double v13 = v12;

  if (v7)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    double v16 = 0.0;
    do
    {
      uint64_t v17 = v15;
      if (([(SBShelfCarouselSwitcherModifier *)self isRTLEnabled] & 1) == 0)
      {
        double v18 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
        uint64_t v17 = [v18 count] + v14 - 1;
      }
      [(SBShelfCarouselSwitcherModifier *)self _cardSizeForIndex:v17];
      double v16 = v16 + v13 * v19 + 32.0;
      ++v15;
      --v14;
    }
    while (-(uint64_t)v7 != v14);
  }
  else
  {
    double v16 = 0.0;
  }
  double v20 = v10 * v13;
  double v21 = v20 * 0.5;
  [(SBShelfCarouselSwitcherModifier *)self scrollViewContentOffset];
  double v23 = v20 * 0.5 + v16 - v22;
  [(SBShelfCarouselSwitcherModifier *)self _fittedContentSize];
  double v25 = v24;
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  double v27 = v26;
  if (v25 >= v26)
  {
    if ([(SBShelfCarouselSwitcherModifier *)self isRTLEnabled])
    {
      [(SBShelfCarouselSwitcherModifier *)self _cardSizeForIndex:0];
      double v30 = v29;
    }
    else
    {
      NSUInteger v31 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
      -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", [v31 count] - 1);
      double v30 = v32;
    }
    CGFloat v33 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
    [v33 switcherShelfCardScale];
    double v35 = v34;

    double v28 = v27 * 0.5 - v27 * 0.899497487 * 0.5 + v30 * v35 * 0.5 - v30 * v35 * 0.5;
  }
  else
  {
    double v28 = (v26 - v25) * 0.5;
  }
  double v36 = v23 + v28;
  if (v4)
  {
    [(SBShelfCarouselSwitcherModifier *)self _effectiveMaxCarouselWidth];
    double v37 = v27 * 0.5;
    double v39 = v38 * 0.5;
    double v40 = v27 * 0.5 - v39;
    double v41 = v20 * 3.0 * 0.5;
    double v42 = v41 + v40;
    double v43 = v21 + v40;
    double v44 = v37 + v39;
    double v45 = v44 - v41;
    double v46 = v44 - v21;
    if (v36 <= v37)
    {
      if (!v7
        || ([(SBShelfCarouselSwitcherModifier *)self appLayouts],
            v52 = objc_claimAutoreleasedReturnValue(),
            uint64_t v53 = [v52 count] - 1,
            v52,
            v7 == v53))
      {
        if (v43 >= v36) {
          double v54 = v43;
        }
        else {
          double v54 = v36;
        }
        if (v42 <= v54) {
          double v54 = v42;
        }
        double v50 = v54 - v42;
        double v51 = v43 - v42;
        goto LABEL_34;
      }
      if (v43 - v21 >= v36) {
        double v60 = v43 - v21;
      }
      else {
        double v60 = v36;
      }
      if (v42 <= v60) {
        double v60 = v42;
      }
      double v58 = v60 - v42;
      double v59 = v43 - v21 - v42;
    }
    else
    {
      if (!v7
        || ([(SBShelfCarouselSwitcherModifier *)self appLayouts],
            v47 = objc_claimAutoreleasedReturnValue(),
            uint64_t v48 = [v47 count] - 1,
            v47,
            v7 == v48))
      {
        if (v45 >= v36) {
          double v49 = v45;
        }
        else {
          double v49 = v36;
        }
        if (v46 <= v49) {
          double v49 = v46;
        }
        double v50 = v49 - v45;
        double v51 = v46 - v45;
LABEL_34:
        double v55 = v50 / v51;
        goto LABEL_48;
      }
      double v56 = v21 + v46;
      if (v45 >= v36) {
        double v57 = v45;
      }
      else {
        double v57 = v36;
      }
      if (v56 <= v57) {
        double v57 = v21 + v46;
      }
      double v58 = v57 - v45;
      double v59 = v56 - v45;
    }
    double v55 = v58 / v59;
LABEL_48:
    double v61 = fmax(v55 + 0.0, 0.0);
    if (v61 >= 1.0) {
      double v62 = 1.57079633;
    }
    else {
      double v62 = v61 * 1.57079633;
    }
    sin(v62);
    if (!BSFloatIsOne() && (BSFloatIsZero() & 1) == 0 && v7)
    {
      v63 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
      [v63 count];
    }
  }
  SBRectWithSize();
  UIRectCenteredAboutPoint();
  result.size.double height = v67;
  result.size.double width = v66;
  result.origin.double y = v65;
  result.origin.double x = v64;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  double v6 = v5;
  [(SBShelfCarouselSwitcherModifier *)self _frameForIndex:a3 applyCarousel:1];
  UIRectGetCenter();
  double v8 = v7;
  double v9 = v6 * 0.5;
  if ([(SBShelfCarouselSwitcherModifier *)self isRTLEnabled] != v7 <= v6 * 0.5) {
    int64_t v10 = a3 - 1;
  }
  else {
    int64_t v10 = a3 + 1;
  }
  id v11 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
  uint64_t v12 = [v11 count] - 1;
  uint64_t v13 = v10 & ~(v10 >> 63);

  if (v12 >= v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v12;
  }
  [(SBShelfCarouselSwitcherModifier *)self _cardSizeForIndex:a3];
  double v16 = v15;
  [(SBShelfCarouselSwitcherModifier *)self _frameForIndex:v14 applyCarousel:0];
  UIRectGetCenter();
  double v18 = v17;
  double v19 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v19 switcherShelfCardScale];
  double v21 = v20;

  [(SBShelfCarouselSwitcherModifier *)self _effectiveMaxCarouselWidth];
  double v23 = v22 * 0.5;
  double v24 = v9 - v22 * 0.5;
  double v25 = v16 * v21 * 3.0 * 0.5;
  double v26 = v16 * v21 * 0.5;
  double v27 = v9 + v23;
  double v28 = v27 - v25;
  double v29 = v25 + v24 + 32.0;
  double v30 = v28 + -32.0;
  double v31 = (v29 - (v28 + -32.0)) * 0.5;
  if (v8 > v9)
  {
    double v37 = -0.0;
    if (v30 < v29) {
      double v37 = v31;
    }
    double v38 = v30 + v37;
    double v39 = v27 - v26 + 32.0;
    if (v38 >= v18) {
      double v40 = v38;
    }
    else {
      double v40 = v18;
    }
    if (v39 <= v40) {
      double v40 = v39;
    }
    double v36 = (v40 - v38) / (v39 - v38);
  }
  else
  {
    double v32 = 0.0;
    if (v30 < v29) {
      double v32 = v31;
    }
    double v33 = v29 - v32;
    double v34 = v26 + v24 + -32.0;
    if (v34 >= v18) {
      double v35 = v34;
    }
    else {
      double v35 = v18;
    }
    if (v33 <= v35) {
      double v35 = v33;
    }
    double v36 = (v35 - v33) / (v34 - v33);
  }
  double v41 = fmax(v36 + 0.0, 0.0);
  if (v41 >= 1.0) {
    double v42 = 1.57079633;
  }
  else {
    double v42 = v41 * 1.57079633;
  }
  double v43 = sin(v42) * -0.25 + 1.0;
  double v44 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
  unint64_t v45 = [v44 count];

  double v46 = 0.76;
  if (v43 >= 0.76 || v45 >= 3) {
    double v46 = v43;
  }
  return v21 * v46;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  -[SBShelfCarouselSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a5, a4);
  double v6 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v6 switcherShelfCardScale];
  if (BSFloatEqualToFloat()) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }

  return v7;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v5 switcherShelfCardScale];

  [(SBShelfCarouselSwitcherModifier *)self scaleForIndex:a3];
  int v6 = BSFloatLessThanOrEqualToFloat();
  double result = 1.0;
  if (v6) {
    return 0.0;
  }
  return result;
}

- (id)topMostLayoutElements
{
  uint64_t v3 = [(SBShelfCarouselSwitcherModifier *)self _visibleRange];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    unint64_t v6 = v3;
    uint64_t v7 = v4;
    double v5 = objc_opt_new();
    int v8 = [(SBShelfCarouselSwitcherModifier *)self isRTLEnabled];
    if (v6 < v6 + v7)
    {
      int v9 = v8;
      do
      {
        [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
        UIRectGetCenter();
        double v11 = v10;
        [(SBShelfCarouselSwitcherModifier *)self _frameForIndex:v6 applyCarousel:1];
        UIRectGetCenter();
        double v13 = v12;
        uint64_t v14 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
        double v15 = [v14 objectAtIndex:v6];

        if ((v9 ^ (v13 <= v11))) {
          [v5 addObject:v15];
        }
        else {
          [v5 insertObject:v15 atIndex:0];
        }

        ++v6;
        --v7;
      }
      while (v7);
    }
  }
  return v5;
}

- (id)appLayoutsToCacheSnapshots
{
  v2 = [(SBShelfCarouselSwitcherModifier *)self visibleAppLayouts];
  uint64_t v3 = [v2 allObjects];

  return v3;
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
  id v4 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v4 switcherShelfCardScale];
  double v6 = v5;

  return v6;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  id v4 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v4 switcherShelfCardScale];
  double v6 = v5;

  return v6;
}

- (CGSize)_cardSizeForIndex:(unint64_t)a3
{
  double v5 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  [(SBShelfCarouselSwitcherModifier *)self _cardSizeForAppLayout:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)_cardSizeForAppLayout:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 environment];
    if (v4 == 1)
    {
      [(SBShelfCarouselSwitcherModifier *)self containerViewBounds];
      double v6 = v5;
      double v8 = v7;
    }
    else
    {
      uint64_t v9 = v4;
      uint64_t v10 = [(SBShelfCarouselSwitcherModifier *)self switcherInterfaceOrientation];
      if (v9 == 2) {
        [(SBShelfCarouselSwitcherModifier *)self _floatingCardSizeForOrientation:v10];
      }
      else {
        [(SBShelfCarouselSwitcherModifier *)self _centerCardSizeForOrientation:v10];
      }
    }
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v8;
  result.double width = v6;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 3;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  [(SBShelfCarouselSwitcherModifier *)self containerViewBounds];
  return v3;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  if ([v7 type] == 5
    || ([(SBShelfCarouselSwitcherModifier *)self shelfFocusedDisplayItems],
        double v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 containsAnyItemFromSet:v8],
        v8,
        (v9 & 1) != 0))
  {
    BOOL v10 = 0;
  }
  else
  {
    int v11 = [v7 isCenterOverSplit] ^ 1;
    if (a3 == 4) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v11;
    }
  }

  return v10;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 1;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (BOOL)shouldScrollViewBlockTouches
{
  return 0;
}

- (double)shelfBackgroundBlurOpacity
{
  return 1.0;
}

- (CGRect)shelfBackgroundBlurFrame
{
  [(SBShelfCarouselSwitcherModifier *)self _fittedContentSize];
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  SBRectWithSize();
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v3 switcherShelfCardCornerRadius];
  [v3 switcherShelfCardScale];
  SBRectCornerRadiiForRadius();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.topRight = v15;
  result.bottomRight = v14;
  result.bottomLeft = v13;
  result.topLeft = v12;
  return result;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)scrollViewAttributes
{
  double v3 = objc_opt_new();
  [(SBShelfCarouselSwitcherModifier *)self _contentSize];
  objc_msgSend(v3, "setContentSize:");
  [v3 setDecelerationRate:*MEMORY[0x1E4F43CE0]];
  [v3 setScrollViewPagingEnabled:0];
  objc_msgSend(v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  objc_msgSend(v3, "setPagingOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [v3 setInterpolatesDuringSwipeToKill:0];
  return v3;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (double)plusButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonScale
{
  return 1.0;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 0;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 0;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)visibleShelves
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (CGRect)frameForShelf:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  return 0;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  double v4 = objc_opt_new();
  [v4 setUpdateMode:1];
  [v4 setTitleAndIconOpacityUpdateMode:3];
  double v5 = [(SBShelfCarouselSwitcherModifier *)self switcherSettings];
  double v6 = [v5 animationSettings];
  double v7 = [v6 layoutSettings];
  [v4 setLayoutSettings:v7];

  double v8 = [(SBShelfCarouselSwitcherModifier *)self switcherSettings];
  double v9 = [v8 animationSettings];
  double v10 = [v9 opacitySettings];
  [v4 setOpacitySettings:v10];

  return v4;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(SBShelfCarouselSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v6 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v6 switcherShelfCardScale];
  double v8 = v7;

  [(SBShelfCarouselSwitcherModifier *)self scaleForIndex:a4];
  double v10 = v9;
  double result = 1.0;
  if (v10 < v8 * 0.765) {
    return (v10 + v8 * -0.75) / (v8 * 0.765 + v8 * -0.75) + 0.0;
  }
  return result;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)homeScreenAlpha
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)wallpaperScale
{
  return 1.0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (double)homeScreenBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 0;
}

- (int64_t)switcherBackdropBlurType
{
  return 1;
}

- (double)switcherBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 0;
}

- (double)switcherDimmingAlpha
{
  return 0.0;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  return 0;
}

- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 1;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return 1;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isContainerStatusBarVisible
{
  return 0;
}

- (double)containerStatusBarAnimationDuration
{
  return 0.35;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double v6 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 0;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  uint64_t v3 = [a3 itemForLayoutRole:2];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  return 2;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  return 0;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  return 0;
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return 0;
}

- (unint64_t)transactionCompletionOptions
{
  uint64_t v3 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    int v4 = [(SBShelfCarouselSwitcherModifier *)self isReduceMotionEnabled];

    if (v4) {
      return 6;
    }
    else {
      return 2;
    }
  }
  else
  {

    return 6;
  }
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 0;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 0;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 1;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBShelfCarouselSwitcherModifier *)self _visibleRange];
  if (v5 > a3) {
    return a3;
  }
  unint64_t v7 = v5;
  uint64_t v8 = v6;
  if (v5 + v6 <= a3) {
    return a3;
  }
  [(SBShelfCarouselSwitcherModifier *)self titleAndIconOpacityForIndex:a3];
  unint64_t i = a3;
  if (BSFloatIsOne())
  {
    for (unint64_t i = v7; ; ++i)
    {
      [(SBShelfCarouselSwitcherModifier *)self titleAndIconOpacityForIndex:i];
      if (BSFloatIsOne()) {
        break;
      }
      if (!--v8) {
        return a3;
      }
    }
  }
  if (i == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  return i;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBShelfCarouselSwitcherModifier *)self _visibleRange];
  if (v5 >= v5 + v6) {
    return a3;
  }
  unint64_t v7 = v5;
  uint64_t v8 = v6;
  while (1)
  {
    [(SBShelfCarouselSwitcherModifier *)self titleAndIconOpacityForIndex:v7];
    if (BSFloatIsOne()) {
      break;
    }
    ++v7;
    if (!--v8) {
      return a3;
    }
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  return v7;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 type]
    || ([(SBShelfCarouselSwitcherModifier *)self shelfFocusedDisplayItems],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 containsAnyItemFromSet:v7],
        v7,
        (v8 & 1) != 0))
  {
    char v9 = 0;
  }
  else
  {
    double v10 = [v6 leafAppLayoutForRole:a3];
    double v11 = [v10 itemForLayoutRole:1];
    char v9 = [(SBShelfCarouselSwitcherModifier *)self displayItemSupportsMedusa:v11];
  }
  return v9;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 0;
}

- (double)dockProgress
{
  return 0.0;
}

- (int64_t)dockUpdateMode
{
  return 2;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
}

- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBShelfCarouselSwitcherModifier *)self shelfFocusedDisplayItems];
  if ([v4 containsAnyItemFromSet:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v7 = [v4 itemForLayoutRole:4];
    BOOL v6 = v7 != 0;
  }
  return v6;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
  unint64_t v5 = [v3 setWithArray:v4];
  BOOL v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F334B420];

  return v6;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 0;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  [(SBShelfCarouselSwitcherModifier *)self _frameForIndex:a3 applyCarousel:0];
  double v6 = v5;
  UIRectGetCenter();
  double v8 = v7;
  [(SBShelfCarouselSwitcherModifier *)self scrollViewContentOffset];
  double v10 = v8 + v9;
  double v11 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
  [v11 switcherShelfCardScale];
  double v13 = v10 + v6 * v12 * 0.5;

  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  double v15 = v13 + v14 * -0.899497487;
  [(SBShelfCarouselSwitcherModifier *)self _contentSize];
  double v17 = v16;
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  double v19 = v17 - v18;
  double v20 = fmax(v15, 0.0);
  if (v17 - v18 > v20) {
    double v19 = v20;
  }
  double v21 = 0.0;
  result.double y = v21;
  result.double x = v19;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  return 0.0;
}

- (unint64_t)slideOverTongueState
{
  return 0;
}

- (unint64_t)slideOverTongueDirection
{
  return 0;
}

- (id)appLayoutToAttachSlideOverTongue
{
  return 0;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return 0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  double v5 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  double v7 = [(SBShelfCarouselSwitcherModifier *)self shelfFocusedDisplayItems];
  if ([v6 containsAnyItemFromSet:v7])
  {
    char v8 = [v6 isSplitConfiguration];

    double v9 = 1.0;
    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v9 = 0.0;
LABEL_6:

  return v9;
}

- (id)handleInitialSetupEvent:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBShelfCarouselSwitcherModifier;
  id v4 = [(SBSwitcherModifier *)&v13 handleInitialSetupEvent:a3];
  self->_hasReceivedInitialSetupEvent = 1;
  double v5 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
    char v8 = [v7 objectAtIndex:0];

    if (v8)
    {
      double v9 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v8 alignment:0 animated:0];
      double v10 = SBAppendSwitcherModifierResponse(v9, v4);

      double v11 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:2];
      id v4 = SBAppendSwitcherModifierResponse(v11, v10);
    }
  }
  return v4;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  double v5 = [v4 appLayout];
  if ([v5 type] == 5)
  {
    uint64_t v6 = [SBNewWindowRequestSwitcherEventResponse alloc];
    double v7 = [v5 allItems];
    char v8 = [v7 firstObject];
    double v9 = [v8 bundleIdentifier];
    double v10 = [(SBNewWindowRequestSwitcherEventResponse *)v6 initWithBundleIdentifier:v9];
  }
  else
  {
    double v7 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:v4];
    objc_msgSend(v7, "setRetainsSiri:", -[SBShelfCarouselSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
    double v10 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v7 gestureInitiated:0];
  }

  v14.receiver = self;
  v14.super_class = (Class)SBShelfCarouselSwitcherModifier;
  double v11 = [(SBSwitcherModifier *)&v14 handleTapAppLayoutEvent:v4];

  double v12 = SBAppendSwitcherModifierResponse(v10, v11);

  return v12;
}

- (id)handleShelfFocusedDisplayItemsChangedEvent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBShelfCarouselSwitcherModifier;
  uint64_t v3 = [(SBSwitcherModifier *)&v9 handleShelfFocusedDisplayItemsChangedEvent:a3];
  id v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  double v5 = SBAppendSwitcherModifierResponse(v4, v3);

  uint64_t v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
  double v7 = SBAppendSwitcherModifierResponse(v6, v5);

  return v7;
}

- (id)foregroundAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (char)jetsamModeForAppLayout:(id)a3
{
  return 0;
}

- (char)activityModeForAppLayout:(id)a3
{
  return 0;
}

- (double)_effectiveMaxCarouselWidth
{
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  double v4 = v3;
  [(SBShelfCarouselSwitcherModifier *)self _fittedContentSize];
  double result = v5 + v4 * 0.100502513;
  if (result > v4 * 0.899497487) {
    return v4 * 0.899497487;
  }
  return result;
}

- (BOOL)_isIndexVisible:(unint64_t)a3
{
  double v5 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  [(SBShelfCarouselSwitcherModifier *)self opacityForLayoutRole:1 inAppLayout:v6 atIndex:a3];
  LOBYTE(a3) = BSFloatIsZero() ^ 1;

  return a3;
}

- (CGSize)_contentSize
{
  [(SBShelfCarouselSwitcherModifier *)self _fittedContentSize];
  double v4 = v3;
  double v6 = v5;
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  double v8 = v7;
  if (v4 >= v7)
  {
    objc_super v9 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      if ([(SBShelfCarouselSwitcherModifier *)self isRTLEnabled])
      {
        [(SBShelfCarouselSwitcherModifier *)self _cardSizeForIndex:0];
        double v12 = v11;
      }
      else
      {
        objc_super v13 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
        -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", [v13 count] - 1);
        double v12 = v14;
      }
      double v15 = v8 * 0.899497487;
      if ([(SBShelfCarouselSwitcherModifier *)self isRTLEnabled])
      {
        double v16 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
        -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", [v16 count] - 1);
        double v18 = v17;
      }
      else
      {
        [(SBShelfCarouselSwitcherModifier *)self _cardSizeForIndex:0];
        double v18 = v19;
      }
      double v20 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
      [v20 switcherShelfCardScale];
      double v22 = v21;

      double v23 = v12 * v22 * 0.5;
      double v24 = v8 * 0.5 - v15 * 0.5 + v23;
      double v25 = v8 * 0.5 + v15 * 0.5;
      double v26 = v18 * v22 * 0.5;
      double v27 = v25 - v26;
      double v28 = v24 - v23;
      [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
      double v8 = v4 + v28 + v29 - v27 - v26;
    }
    else
    {
      double v8 = 0.0;
    }
  }
  double v30 = v8;
  double v31 = v6;
  result.double height = v31;
  result.double width = v30;
  return result;
}

- (double)_trailingPaddingIfAny
{
  [(SBShelfCarouselSwitcherModifier *)self _fittedContentSize];
  double v4 = v3;
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  double result = 0.0;
  if (v4 >= v6)
  {
    double v7 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
    [v7 switcherShelfCardScale];
    double v9 = v8;

    [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
    double v11 = v10;
    double v12 = v10 * -0.899497487;
    objc_super v13 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
    -[SBShelfCarouselSwitcherModifier _cardSizeForIndex:](self, "_cardSizeForIndex:", [v13 count] - 1);
    double v15 = v14;

    return v11 * 0.5 + v12 * 0.5 + v9 * v15 * 3.0 * 0.5 - (v15 * v9 + 32.0);
  }
  return result;
}

- (CGSize)_fittedContentSize
{
  unint64_t v3 = [(SBShelfCarouselSwitcherModifier *)self appLayoutsGenerationCount];
  int64_t v4 = [(SBShelfCarouselSwitcherModifier *)self switcherInterfaceOrientation];
  [(SBShelfCarouselSwitcherModifier *)self containerViewBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  if (*(_OWORD *)&self->_fittedContentSize_lastAppLayoutsGenCount != __PAIR128__(v4, v3)) {
    goto LABEL_5;
  }
  v34.origin.double x = v6;
  v34.origin.double y = v8;
  v34.size.double width = v10;
  v34.size.double height = v12;
  if (!CGRectEqualToRect(self->_fittedContentSize_lastContainerViewBounds, v34)) {
    goto LABEL_5;
  }
  v35.origin.double x = v14;
  v35.origin.double y = v16;
  v35.size.double width = v18;
  v35.size.double height = v20;
  if (CGRectEqualToRect(self->_fittedContentSize_lastSwitcherViewBounds, v35))
  {
    double width = self->_fittedContentSize_lastSize.width;
    double height = self->_fittedContentSize_lastSize.height;
  }
  else
  {
LABEL_5:
    self->_fittedContentSize_lastAppLayoutsGenCount = v3;
    self->_fittedContentSize_lastOrientation = v4;
    self->_fittedContentSize_lastContainerViewBounds.origin.double x = v6;
    self->_fittedContentSize_lastContainerViewBounds.origin.double y = v8;
    self->_fittedContentSize_lastContainerViewBounds.size.double width = v10;
    self->_fittedContentSize_lastContainerViewBounds.size.double height = v12;
    self->_fittedContentSize_lastSwitcherViewBounds.origin.double x = v14;
    self->_fittedContentSize_lastSwitcherViewBounds.origin.double y = v16;
    self->_fittedContentSize_lastSwitcherViewBounds.size.double width = v18;
    self->_fittedContentSize_lastSwitcherViewBounds.size.double height = v20;
    double v23 = [(SBShelfCarouselSwitcherModifier *)self medusaSettings];
    [v23 switcherShelfCardScale];
    double v25 = v24;

    double v26 = [(SBShelfCarouselSwitcherModifier *)self appLayouts];
    uint64_t v27 = [v26 count];

    if (v27)
    {
      uint64_t v28 = 0;
      double v29 = 0.0;
      do
      {
        [(SBShelfCarouselSwitcherModifier *)self _cardSizeForIndex:v28];
        double v29 = v29 + v30 * v25;
        ++v28;
      }
      while (v27 != v28);
    }
    else
    {
      double v29 = 0.0;
    }
    double width = v29 + (double)(unint64_t)(v27 - 1) * 32.0;
    [(SBShelfCarouselSwitcherModifier *)self switcherViewBounds];
    double height = v31;
    self->_fittedContentSize_lastSize.double width = width;
    self->_fittedContentSize_lastSize.double height = v31;
  }
  double v32 = width;
  result.double height = height;
  result.double width = v32;
  return result;
}

- (CGSize)_centerCardSizeForOrientation:(int64_t)a3
{
  [(SBShelfCarouselSwitcherModifier *)self containerViewBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  p_centerCardSize_containerViewBounds = &self->_centerCardSize_containerViewBounds;
  if (CGRectIsNull(self->_centerCardSize_containerViewBounds)) {
    goto LABEL_3;
  }
  v29.origin.double x = p_centerCardSize_containerViewBounds->origin.x;
  v29.origin.double y = self->_centerCardSize_containerViewBounds.origin.y;
  v29.size.double width = self->_centerCardSize_containerViewBounds.size.width;
  v29.size.double height = self->_centerCardSize_containerViewBounds.size.height;
  v28.origin.double x = v6;
  v28.origin.double y = v8;
  v28.size.double width = v10;
  v28.size.double height = v12;
  if (!CGRectEqualToRect(v28, v29))
  {
LABEL_3:
    p_centerCardSize_containerViewBounds->origin.double x = v6;
    self->_centerCardSize_containerViewBounds.origin.double y = v8;
    self->_centerCardSize_containerViewBounds.size.double width = v10;
    self->_centerCardSize_containerViewBounds.size.double height = v12;
    CGFloat v14 = SBAppLayoutGenericAppLayoutWithConfiguration(1);
    -[SBShelfCarouselSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v14, 3, v6, v8, v10, v12);
    double v16 = v15;
    -[SBShelfCarouselSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v14, 1, v6, v8, v10, v12);
    double v18 = v17;
    [(SBShelfCarouselSwitcherModifier *)self centerWindowFrameInInterfaceOrientation:4 centerConfiguration:1];
    self->_centerCardSize_landscapeCardSize.double width = v16 * (v19 / v20);
    self->_centerCardSize_landscapeCardSize.double height = v16;
    [(SBShelfCarouselSwitcherModifier *)self centerWindowFrameInInterfaceOrientation:1 centerConfiguration:1];
    self->_centerCardSize_portraitCardSize.double width = v18 * (v21 / v22);
    self->_centerCardSize_portraitCardSize.double height = v18;
  }
  if ((unint64_t)(a3 - 1) >= 2) {
    double v23 = &OBJC_IVAR___SBShelfCarouselSwitcherModifier__centerCardSize_landscapeCardSize;
  }
  else {
    double v23 = &OBJC_IVAR___SBShelfCarouselSwitcherModifier__centerCardSize_portraitCardSize;
  }
  double v24 = (double *)((char *)self + *v23);
  double v25 = *v24;
  double v26 = v24[1];
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (CGSize)_floatingCardSizeForOrientation:(int64_t)a3
{
  [(SBShelfCarouselSwitcherModifier *)self containerViewBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  p_floatingCardSize_containerViewBounds = &self->_floatingCardSize_containerViewBounds;
  if (CGRectIsNull(self->_floatingCardSize_containerViewBounds)) {
    goto LABEL_3;
  }
  v29.origin.double x = p_floatingCardSize_containerViewBounds->origin.x;
  v29.origin.double y = self->_floatingCardSize_containerViewBounds.origin.y;
  v29.size.double width = self->_floatingCardSize_containerViewBounds.size.width;
  v29.size.double height = self->_floatingCardSize_containerViewBounds.size.height;
  v28.origin.double x = v6;
  v28.origin.double y = v8;
  v28.size.double width = v10;
  v28.size.double height = v12;
  if (!CGRectEqualToRect(v28, v29))
  {
LABEL_3:
    p_floatingCardSize_containerViewBounds->origin.double x = v6;
    self->_floatingCardSize_containerViewBounds.origin.double y = v8;
    self->_floatingCardSize_containerViewBounds.size.double width = v10;
    self->_floatingCardSize_containerViewBounds.size.double height = v12;
    CGFloat v14 = SBAppLayoutGenericAppLayoutWithConfiguration(1);
    [(SBShelfCarouselSwitcherModifier *)self containerViewBounds];
    -[SBShelfCarouselSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v14, 3);
    double v16 = v15;
    [(SBShelfCarouselSwitcherModifier *)self containerViewBounds];
    -[SBShelfCarouselSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v14, 1);
    double v18 = v17;
    [(SBShelfCarouselSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:3 floatingConfiguration:2];
    self->_floatingCardSize_landscapeCardSize.double width = v16 * (v19 / v20);
    self->_floatingCardSize_landscapeCardSize.double height = v16;
    [(SBShelfCarouselSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:1 floatingConfiguration:2];
    self->_floatingCardSize_portraitCardSize.double width = v18 * (v21 / v22);
    self->_floatingCardSize_portraitCardSize.double height = v18;
  }
  if ((unint64_t)(a3 - 1) >= 2) {
    double v23 = &OBJC_IVAR___SBShelfCarouselSwitcherModifier__floatingCardSize_landscapeCardSize;
  }
  else {
    double v23 = &OBJC_IVAR___SBShelfCarouselSwitcherModifier__floatingCardSize_portraitCardSize;
  }
  double v24 = (double *)((char *)self + *v23);
  double v25 = *v24;
  double v26 = v24[1];
  result.double height = v26;
  result.double width = v25;
  return result;
}

@end