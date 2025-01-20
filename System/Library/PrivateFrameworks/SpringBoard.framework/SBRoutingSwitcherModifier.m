@interface SBRoutingSwitcherModifier
- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3;
- (BOOL)canLayoutRoleParticipateInSwitcherDragAndDrop:(int64_t)a3 appLayout:(id)a4;
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3;
- (BOOL)clipsToBoundsAtIndex:(unint64_t)a3;
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isContinuousExposeStripVisible;
- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3;
- (BOOL)isFocusEnabledForAppLayout:(id)a3;
- (BOOL)isHitTestBlockingViewVisible;
- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3;
- (BOOL)isItemContainerPointerInteractionEnabled;
- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isScrollEnabled;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
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
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldRubberbandFullScreenHomeGrabberView;
- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldScrollViewBlockTouches;
- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3;
- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3;
- (BOOL)shouldUpdateAnimatableProperty:(id)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3;
- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3;
- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldUseWallpaperGradientTreatment;
- (BOOL)switcherDimmingViewBlocksTouches;
- (BOOL)switcherHitTestsAsOpaque;
- (BOOL)systemApertureRequiresHeavyShadowForTransition;
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (BOOL)wantsBezelEffectsLayoutElement;
- (BOOL)wantsContinuousExposeHoverGesture;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (BOOL)wantsHomeScreenPointerInteractions;
- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3;
- (BOOL)wantsSlideOverTongue;
- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3;
- (BOOL)wantsSwitcherBackdropBlur;
- (BOOL)wantsSwitcherDimmingView;
- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3;
- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (CGPoint)expandedSourcePositionForSystemApertureTransition;
- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)bounceIconInitialFrame;
- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4;
- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6;
- (CGRect)containerViewBounds;
- (CGRect)frameForIconOverlayInAppLayout:(id)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (CGRect)frameForShelf:(id)a3;
- (CGRect)fullyPresentedFrameForIndex:(unint64_t)a3 frame:(CGRect)a4;
- (CGRect)rootContentViewMaskRect;
- (CGRect)shelfBackgroundBlurFrame;
- (CGRect)switcherViewBounds;
- (NSArray)modifiers;
- (SBRoutingSwitcherModifier)initWithModifiers:(id)a3 delegate:(id)a4;
- (SBRoutingSwitcherModifierDelegate)routingDelegate;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBSwitcherContinuousExposeStripTongueAttributes)continuousExposeStripTongueAttributes;
- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)adjustedSpaceAccessoryViewScale:(double)a3 forAppLayout:(id)a4;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)containerStatusBarAnimationDuration;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)contentViewScale;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)lighteningAlphaForIndex:(unint64_t)a3;
- (double)minimumTranslationToKillIndex:(unint64_t)a3;
- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (double)rootContentViewBlurRadius;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)shelfBackgroundBlurOpacity;
- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3;
- (double)switcherBackdropBlurProgress;
- (double)switcherDimmingAlpha;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)_adjustedShelfForShelf:(id)a3 forModifier:(id)a4;
- (id)_adjustedShelfForShelf:(id)a3 fromModifier:(id)a4;
- (id)_currentModifierOrFallback;
- (id)activeLeafAppLayoutsReachableByKeyboardShortcut;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4;
- (id)animatablePropertyIdentifiers;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)appLayoutForReceivingHardwareButtonEvents;
- (id)appLayoutToAttachSlideOverTongue;
- (id)appLayoutToScrollToBeforeReopeningClosedWindows;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)appLayouts;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)bounceIconBundleIdentifier;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)focusedAppLayoutForShelf:(id)a3;
- (id)foregroundAppLayouts;
- (id)handleEvent:(id)a3;
- (id)hiddenAppLayoutsInShelf:(id)a3;
- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3;
- (id)identityMeshTransformForIndex:(unint64_t)a3;
- (id)ignoredDisplayItemsForShelf:(id)a3;
- (id)inactiveAppLayoutsReachableByKeyboardShortcut;
- (id)keyboardSuppressionMode;
- (id)meshTransformForIndex:(unint64_t)a3;
- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3;
- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4;
- (id)proposedAppLayoutForWindowDrag;
- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3;
- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)scrollViewAttributes;
- (id)settingsForAnimatableProperty:(id)a3;
- (id)stackDescriptionWithPrefix:(id)a3;
- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5;
- (id)systemApertureTransitioningAppLayouts;
- (id)topMostLayoutElements;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
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
- (int64_t)updateModeForAnimatableProperty:(id)a3;
- (int64_t)wallpaperStyle;
- (unint64_t)_lastIndexForModifier:(id)a3;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3;
- (unint64_t)dockWindowLevelPriority;
- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3;
- (unint64_t)hiddenContainerStatusBarParts;
- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (unint64_t)maskedCornersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withMaskedCorners:(unint64_t)a5;
- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (unint64_t)transactionCompletionOptions;
- (void)didMoveToParentModifier:(id)a3;
- (void)resetAdjustedScrollingState;
@end

@implementation SBRoutingSwitcherModifier

- (SBRoutingSwitcherModifier)initWithModifiers:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBRoutingSwitcherModifier;
  v8 = [(SBSwitcherModifier *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    modifiers = v8->_modifiers;
    v8->_modifiers = (NSArray *)v9;

    objc_storeWeak((id *)&v8->_routingDelegate, v7);
  }

  return v8;
}

- (void)didMoveToParentModifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SBRoutingSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v14, sel_didMoveToParentModifier_);
  if (a3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_modifiers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setDelegate:", self, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if (v4)
  {
    uint64_t v6 = [v4 stringByAppendingString:@"\t"];
  }
  else
  {
    uint64_t v6 = @"\t";
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__SBRoutingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E6AF4E00;
  v12[4] = self;
  id v7 = v5;
  id v13 = v7;
  objc_super v14 = v6;
  uint64_t v8 = v6;
  [v7 appendBodySectionWithName:@"modifiers" multilinePrefix:v4 block:v12];
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __67__SBRoutingSwitcherModifier_descriptionBuilderWithMultilinePrefix___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1[4] + 136);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "delegate", (void)v13);
        uint64_t v9 = (void *)a1[4];

        if (v8 == v9)
        {
          id v10 = (void *)a1[5];
          long long v11 = [v7 descriptionWithMultilinePrefix:a1[6]];
          id v12 = (id)[v10 appendObject:v11 withName:0];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (id)stackDescriptionWithPrefix:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = NSString;
  id v7 = [(SBSwitcherModifier *)self displayName];
  uint64_t v8 = [v6 stringWithFormat:@"%@%@", v4, v7];
  [v5 addObject:v8];

  uint64_t v9 = [v4 stringByAppendingString:@"    "];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = self->_modifiers;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = [v15 delegate];

        if (v16 == self)
        {
          v17 = [v15 stackDescriptionWithPrefix:v9];
          [v5 addObject:v17];
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v18 = [v5 componentsJoinedByString:@"\n"];

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  modifiers = self->_modifiers;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v7 = (void *)[v4 initWithModifiers:modifiers delegate:WeakRetained];

  return v7;
}

- (id)handleEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__29;
  v30 = __Block_byref_object_dispose__29;
  id v31 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_modifiers;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v6)
  {
    v17 = 0;
    uint64_t v7 = *(void *)v23;
    id v8 = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = [WeakRetained routingModifier:self event:v4 forModifier:v10];

        if (v11)
        {
          if ([v11 isHandled])
          {
            uint64_t v12 = [v11 unhandledCopy];

            uint64_t v11 = (void *)v12;
          }
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __41__SBRoutingSwitcherModifier_handleEvent___block_invoke;
          v18[3] = &unk_1E6AFA860;
          v18[4] = v10;
          id v8 = v11;
          id v19 = v8;
          long long v20 = self;
          long long v21 = &v26;
          _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v18);
          if ([v8 isHandled])
          {
            uint64_t v13 = [v8 handledReason];

            v17 = (void *)v13;
          }
        }
        else
        {
          id v8 = 0;
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v6);

    if (v17)
    {
      if (([v4 isHandled] & 1) == 0) {
        [v4 handleWithReason:v17];
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {

    v17 = 0;
    id v8 = v4;
  }
  id v14 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v14;
}

void __41__SBRoutingSwitcherModifier_handleEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handleEvent:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 48) responseForProposedChildResponse:v2 childModifier:*(void *)(a1 + 32) event:*(void *)(a1 + 40)];

  uint64_t v3 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)appLayouts
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  v25.receiver = self;
  v25.super_class = (Class)SBRoutingSwitcherModifier;
  id v4 = [(SBRoutingSwitcherModifier *)&v25 appLayoutsGenerationCount];
  if (self->_appLayouts_lastAppLayoutsGenCount != v4)
  {
    unint64_t v19 = (unint64_t)v4;
    v24.receiver = self;
    v24.super_class = (Class)SBRoutingSwitcherModifier;
    uint64_t v5 = [(SBRoutingSwitcherModifier *)&v24 appLayouts];
    id v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = self->_modifiers;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [WeakRetained routingModifier:self filteredAppLayouts:v5 forModifier:v12];
          [(NSMapTable *)v6 setObject:v13 forKey:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v9);
    }

    appLayouts_appLayoutsForModifiers = self->_appLayouts_appLayoutsForModifiers;
    self->_appLayouts_appLayoutsForModifiers = v6;

    self->_appLayouts_lastAppLayoutsGenCount = v19;
  }
  long long v15 = self->_appLayouts_appLayoutsForModifiers;
  long long v16 = [(SBRoutingSwitcherModifier *)self _currentModifierOrFallback];
  v17 = [(NSMapTable *)v15 objectForKey:v16];

  return v17;
}

- (CGRect)containerViewBounds
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v4 = [(SBRoutingSwitcherModifier *)self _currentModifierOrFallback];
  [WeakRetained routingModifier:self containerViewBoundsForModifier:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)switcherViewBounds
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v4 = [(SBRoutingSwitcherModifier *)self _currentModifierOrFallback];
  [WeakRetained routingModifier:self switcherViewBoundsForModifier:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_currentModifierOrFallback
{
  currentModifier = self->_currentModifier;
  if (currentModifier)
  {
    uint64_t v3 = currentModifier;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
    uint64_t v3 = [WeakRetained fallbackModifierForRoutingModifier:self];
  }
  return v3;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a4;
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x4010000000;
  v32 = &unk_1D90ED3C6;
  long long v33 = 0u;
  long long v34 = 0u;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__SBRoutingSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
  v21[3] = &unk_1E6AFD988;
  long long v23 = &v29;
  int64_t v24 = a3;
  id v12 = v11;
  id v22 = v12;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v12, v21);
  double v13 = v30[4];
  double v14 = v30[5];
  double v15 = v30[6];
  double v16 = v30[7];

  _Block_object_dispose(&v29, 8);
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

uint64_t __71__SBRoutingSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "frameForLayoutRole:inAppLayout:withBounds:", *(void *)(a1 + 48), *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  double v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__SBRoutingSwitcherModifier_scaleForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  id v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  double v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __60__SBRoutingSwitcherModifier_scaleForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 scaleForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v4;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  id v11 = a4;
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x4010000000;
  v32 = &unk_1D90ED3C6;
  long long v33 = 0u;
  long long v34 = 0u;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__SBRoutingSwitcherModifier_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii___block_invoke;
  v21[3] = &unk_1E6AFD988;
  long long v23 = &v29;
  int64_t v24 = a3;
  id v12 = v11;
  id v22 = v12;
  double v25 = topLeft;
  double v26 = bottomLeft;
  double v27 = bottomRight;
  double v28 = topRight;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v12, v21);
  double v13 = v30[4];
  double v14 = v30[5];
  double v15 = v30[6];
  double v16 = v30[7];

  _Block_object_dispose(&v29, 8);
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.double topRight = v20;
  result.double bottomRight = v19;
  result.double bottomLeft = v18;
  result.double topLeft = v17;
  return result;
}

uint64_t __82__SBRoutingSwitcherModifier_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:", *(void *)(a1 + 48), *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SBRoutingSwitcherModifier_tintStyleForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  id v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  int64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __64__SBRoutingSwitcherModifier_tintStyleForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 tintStyleForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__SBRoutingSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  id v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  int64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __66__SBRoutingSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 shadowStyleForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__29;
  double v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SBRoutingSwitcherModifier_topMostLayoutRolesForAppLayout___block_invoke;
  v8[3] = &unk_1E6AFD9D8;
  double v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __60__SBRoutingSwitcherModifier_topMostLayoutRolesForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 topMostLayoutRolesForAppLayout:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBRoutingSwitcherModifier_isLayoutRoleMatchMovedToScene_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  uint64_t v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __71__SBRoutingSwitcherModifier_isLayoutRoleMatchMovedToScene_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 isLayoutRoleMatchMovedToScene:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v13 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_modifiers;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
        int64_t v8 = [WeakRetained routingModifier:self filteredAppLayouts:v14 forModifier:v6];

        uint64_t v18 = 0;
        double v19 = &v18;
        uint64_t v20 = 0x3032000000;
        long long v21 = __Block_byref_object_copy__29;
        id v22 = __Block_byref_object_dispose__29;
        id v23 = 0;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __61__SBRoutingSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
        v15[3] = &unk_1E6AF6380;
        uint64_t v17 = &v18;
        v15[4] = v6;
        id v9 = v8;
        id v16 = v9;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v6, v15);
        [v13 addObjectsFromArray:v19[5]];

        _Block_object_dispose(&v18, 8);
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }

  return v13;
}

void __61__SBRoutingSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) adjustedAppLayoutsForAppLayouts:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v6 = [WeakRetained routingModifier:self animationAttributesModifierForLayoutElement:v4];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__29;
  double v19 = __Block_byref_object_dispose__29;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SBRoutingSwitcherModifier_animationAttributesForLayoutElement___block_invoke;
  v11[3] = &unk_1E6AF6380;
  id v14 = &v15;
  id v7 = v6;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __65__SBRoutingSwitcherModifier_animationAttributesForLayoutElement___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) animationAttributesForLayoutElement:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__29;
  id v23 = __Block_byref_object_dispose__29;
  id v24 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__SBRoutingSwitcherModifier_switcherDropRegionContextForDraggingLayoutRole_inAppLayout_atLocation___block_invoke;
  v13[3] = &unk_1E6AFDA00;
  uint64_t v15 = &v19;
  int64_t v16 = a3;
  id v10 = v9;
  id v14 = v10;
  CGFloat v17 = x;
  CGFloat v18 = y;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v10, v13);
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __99__SBRoutingSwitcherModifier_switcherDropRegionContextForDraggingLayoutRole_inAppLayout_atLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "switcherDropRegionContextForDraggingLayoutRole:inAppLayout:atLocation:", *(void *)(a1 + 48), *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SBRoutingSwitcherModifier_isLayoutRoleDraggable_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __63__SBRoutingSwitcherModifier_isLayoutRoleDraggable_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 isLayoutRoleDraggable:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__SBRoutingSwitcherModifier_isLayoutRoleEligibleForContentDragSpringLoading_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __89__SBRoutingSwitcherModifier_isLayoutRoleEligibleForContentDragSpringLoading_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 isLayoutRoleEligibleForContentDragSpringLoading:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)canLayoutRoleParticipateInSwitcherDragAndDrop:(int64_t)a3 appLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__SBRoutingSwitcherModifier_canLayoutRoleParticipateInSwitcherDragAndDrop_appLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __85__SBRoutingSwitcherModifier_canLayoutRoleParticipateInSwitcherDragAndDrop_appLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 canLayoutRoleParticipateInSwitcherDragAndDrop:a1[6] appLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SBRoutingSwitcherModifier_backgroundOpacityForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SBRoutingSwitcherModifier_backgroundOpacityForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "backgroundOpacityForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBRoutingSwitcherModifier_maskedCornersForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SBRoutingSwitcherModifier_maskedCornersForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "maskedCornersForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)maskedCornersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withMaskedCorners:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v17 = 0;
  CGFloat v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__SBRoutingSwitcherModifier_maskedCornersForLayoutRole_inAppLayout_withMaskedCorners___block_invoke;
  v12[3] = &unk_1E6AFDA50;
  id v14 = &v17;
  int64_t v15 = a3;
  id v9 = v8;
  id v13 = v9;
  unint64_t v16 = a5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v9, v12);
  unint64_t v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __86__SBRoutingSwitcherModifier_maskedCornersForLayoutRole_inAppLayout_withMaskedCorners___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 maskedCornersForLayoutRole:a1[6] inAppLayout:a1[4] withMaskedCorners:a1[7]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBRoutingSwitcherModifier_isLayoutRoleBlurred_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __61__SBRoutingSwitcherModifier_isLayoutRoleBlurred_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 isLayoutRoleBlurred:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__SBRoutingSwitcherModifier_blurTargetPreferenceForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  int64_t v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  unint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __75__SBRoutingSwitcherModifier_blurTargetPreferenceForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 blurTargetPreferenceForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SBRoutingSwitcherModifier_blurDelayForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  int64_t v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  double v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __64__SBRoutingSwitcherModifier_blurDelayForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 blurDelayForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v4;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__SBRoutingSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
  v12[3] = &unk_1E6AFDA78;
  uint64_t v14 = &v16;
  int64_t v15 = a3;
  id v9 = v8;
  id v13 = v9;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a5, v12);
  double v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __70__SBRoutingSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 opacityForLayoutRole:a1[6] inAppLayout:a1[4] atIndex:a3];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v5;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBRoutingSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
  v6[3] = &unk_1E6AFDAA0;
  v6[4] = &v7;
  v6[5] = a3;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a4, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __64__SBRoutingSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 shadowOpacityForLayoutRole:*(void *)(a1 + 40) atIndex:a3];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__SBRoutingSwitcherModifier_shouldAllowContentViewTouchesForLayoutRole_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __84__SBRoutingSwitcherModifier_shouldAllowContentViewTouchesForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 shouldAllowContentViewTouchesForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SBRoutingSwitcherModifier_isLayoutRoleSelectable_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __64__SBRoutingSwitcherModifier_isLayoutRoleSelectable_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 isLayoutRoleSelectable:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__SBRoutingSwitcherModifier_shouldSuppressHighlightEffectForLayoutRole_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __84__SBRoutingSwitcherModifier_shouldSuppressHighlightEffectForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 shouldSuppressHighlightEffectForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__SBRoutingSwitcherModifier_shouldUseNonuniformSnapshotScalingForLayoutRole_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __89__SBRoutingSwitcherModifier_shouldUseNonuniformSnapshotScalingForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 shouldUseNonuniformSnapshotScalingForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__SBRoutingSwitcherModifier_touchBehaviorForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  int64_t v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  int64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __68__SBRoutingSwitcherModifier_touchBehaviorForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 touchBehaviorForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SBRoutingSwitcherModifier_blurViewIconScaleForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SBRoutingSwitcherModifier_blurViewIconScaleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "blurViewIconScaleForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SBRoutingSwitcherModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  int64_t v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  double v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __67__SBRoutingSwitcherModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 dimmingAlphaForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v4;
  return result;
}

- (double)shelfBackgroundBlurOpacity
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBRoutingSwitcherModifier_shelfBackgroundBlurOpacity__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  v7[4] = self;
  v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__SBRoutingSwitcherModifier_shelfBackgroundBlurOpacity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 shelfBackgroundBlurOpacity];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (CGRect)shelfBackgroundBlurFrame
{
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x4010000000;
  uint64_t v17 = &unk_1D90ED3C6;
  long long v18 = 0u;
  long long v19 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__SBRoutingSwitcherModifier_shelfBackgroundBlurFrame__block_invoke;
  v13[3] = &unk_1E6AF4B88;
  void v13[4] = self;
  v13[5] = &v14;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v13);

  double v5 = v15[4];
  double v6 = v15[5];
  double v7 = v15[6];
  double v8 = v15[7];
  _Block_object_dispose(&v14, 8);
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

void __53__SBRoutingSwitcherModifier_shelfBackgroundBlurFrame__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 shelfBackgroundBlurFrame];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
}

- (BOOL)switcherHitTestsAsOpaque
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __53__SBRoutingSwitcherModifier_switcherHitTestsAsOpaque__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __53__SBRoutingSwitcherModifier_switcherHitTestsAsOpaque__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) switcherHitTestsAsOpaque];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__29;
  long long v18 = __Block_byref_object_dispose__29;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__SBRoutingSwitcherModifier_resizeProgressNotificationsForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  double v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __82__SBRoutingSwitcherModifier_resizeProgressNotificationsForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 resizeProgressNotificationsForLayoutRole:a1[6] inAppLayout:a1[4]];
  uint64_t v4 = *(void *)(a1[5] + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__29;
  long long v18 = __Block_byref_object_dispose__29;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__SBRoutingSwitcherModifier_repositionProgressNotificationsForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  double v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __86__SBRoutingSwitcherModifier_repositionProgressNotificationsForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 repositionProgressNotificationsForLayoutRole:a1[6] inAppLayout:a1[4]];
  uint64_t v4 = *(void *)(a1[5] + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (CGRect)fullyPresentedFrameForIndex:(unint64_t)a3 frame:(CGRect)a4
{
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x4010000000;
  long long v17 = &unk_1D90ED3C6;
  long long v18 = 0u;
  long long v19 = 0u;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SBRoutingSwitcherModifier_fullyPresentedFrameForIndex_frame___block_invoke;
  v12[3] = &unk_1E6AFDAC8;
  void v12[4] = &v14;
  CGRect v13 = a4;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v12);
  double v4 = v15[4];
  double v5 = v15[5];
  double v6 = v15[6];
  double v7 = v15[7];
  _Block_object_dispose(&v14, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

uint64_t __63__SBRoutingSwitcherModifier_fullyPresentedFrameForIndex_frame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "fullyPresentedFrameForIndex:frame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (id)animatablePropertyIdentifiers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __58__SBRoutingSwitcherModifier_animatablePropertyIdentifiers__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _setByCombiningSets(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __58__SBRoutingSwitcherModifier_animatablePropertyIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) animatablePropertyIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(obj);
      }
      double v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      uint64_t v16 = 0;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x3032000000;
      long long v19 = __Block_byref_object_copy__29;
      id v20 = __Block_byref_object_dispose__29;
      id v21 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __83__SBRoutingSwitcherModifier_modelValueForAnimatableProperty_currentValue_creating___block_invoke;
      v15[3] = &unk_1E6AF4B88;
      v15[4] = v11;
      void v15[5] = &v16;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v15);
      char v12 = [(id)v17[5] containsObject:v7];
      _Block_object_dispose(&v16, 8);

      if (v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return a4;
}

void __83__SBRoutingSwitcherModifier_modelValueForAnimatableProperty_currentValue_creating___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) animatablePropertyIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_modifiers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v20 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x3032000000;
      uint64_t v16 = __Block_byref_object_copy__29;
      uint64_t v17 = __Block_byref_object_dispose__29;
      id v18 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__SBRoutingSwitcherModifier_updateModeForAnimatableProperty___block_invoke;
      v12[3] = &unk_1E6AF4B88;
      void v12[4] = v8;
      void v12[5] = &v13;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
      char v9 = [(id)v14[5] containsObject:v4];
      _Block_object_dispose(&v13, 8);

      if (v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return 1;
}

void __61__SBRoutingSwitcherModifier_updateModeForAnimatableProperty___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) animatablePropertyIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)settingsForAnimatableProperty:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_modifiers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v21 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * v7);
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = __Block_byref_object_copy__29;
      id v18 = __Block_byref_object_dispose__29;
      id v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__SBRoutingSwitcherModifier_settingsForAnimatableProperty___block_invoke;
      v13[3] = &unk_1E6AF4B88;
      void v13[4] = v8;
      v13[5] = &v14;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v13);
      char v9 = [(id)v15[5] containsObject:v4];
      _Block_object_dispose(&v14, 8);

      if (v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  return v10;
}

void __59__SBRoutingSwitcherModifier_settingsForAnimatableProperty___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) animatablePropertyIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)shouldUpdateAnimatableProperty:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_modifiers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v20 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x3032000000;
      uint64_t v16 = __Block_byref_object_copy__29;
      uint64_t v17 = __Block_byref_object_dispose__29;
      id v18 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__SBRoutingSwitcherModifier_shouldUpdateAnimatableProperty___block_invoke;
      v12[3] = &unk_1E6AF4B88;
      void v12[4] = v8;
      void v12[5] = &v13;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
      char v9 = [(id)v14[5] containsObject:v4];
      _Block_object_dispose(&v13, 8);

      if (v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return 1;
}

void __60__SBRoutingSwitcherModifier_shouldUpdateAnimatableProperty___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) animatablePropertyIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (CGRect)frameForIconOverlayInAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = (double *)&v17;
  uint64_t v19 = 0x4010000000;
  long long v20 = &unk_1D90ED3C6;
  long long v21 = 0u;
  long long v22 = 0u;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__SBRoutingSwitcherModifier_frameForIconOverlayInAppLayout___block_invoke;
  v14[3] = &unk_1E6AFD9D8;
  uint64_t v16 = &v17;
  id v5 = v4;
  id v15 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v14);
  double v6 = v18[4];
  double v7 = v18[5];
  double v8 = v18[6];
  double v9 = v18[7];

  _Block_object_dispose(&v17, 8);
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

uint64_t __60__SBRoutingSwitcherModifier_frameForIconOverlayInAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 frameForIconOverlayInAppLayout:*(void *)(a1 + 32)];
  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SBRoutingSwitcherModifier_canFocusableAppLayoutBeEffectivelyObscured___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  double v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __72__SBRoutingSwitcherModifier_canFocusableAppLayoutBeEffectivelyObscured___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 canFocusableAppLayoutBeEffectivelyObscured:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  double v11 = &unk_1D90ED3C6;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBRoutingSwitcherModifier_anchorPointForIndex___block_invoke;
  v7[3] = &unk_1E6AFDA28;
  void v7[4] = &v8;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

uint64_t __49__SBRoutingSwitcherModifier_anchorPointForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "anchorPointForIndex:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SBRoutingSwitcherModifier_shouldPinLayoutRolesToSpace___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SBRoutingSwitcherModifier_shouldPinLayoutRolesToSpace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "shouldPinLayoutRolesToSpace:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__SBRoutingSwitcherModifier_shouldUseAnchorPointToPinLayoutRolesToSpace___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __73__SBRoutingSwitcherModifier_shouldUseAnchorPointToPinLayoutRolesToSpace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "shouldUseAnchorPointToPinLayoutRolesToSpace:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isHitTestBlockingViewVisible
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __57__SBRoutingSwitcherModifier_isHitTestBlockingViewVisible__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __57__SBRoutingSwitcherModifier_isHitTestBlockingViewVisible__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isHitTestBlockingViewVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x4010000000;
  uint64_t v15 = &unk_1D90ED3C6;
  long long v16 = 0u;
  long long v17 = 0u;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SBRoutingSwitcherModifier_frameForIndex___block_invoke;
  v11[3] = &unk_1E6AFDA28;
  void v11[4] = &v12;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v11);
  double v3 = v13[4];
  double v4 = v13[5];
  double v5 = v13[6];
  double v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

uint64_t __43__SBRoutingSwitcherModifier_frameForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "frameForIndex:");
  double v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SBRoutingSwitcherModifier_scaleForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SBRoutingSwitcherModifier_scaleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "scaleForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBRoutingSwitcherModifier_rotationAngleForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SBRoutingSwitcherModifier_rotationAngleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "rotationAngleForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_modifiers;
  char v6 = 0;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    char v8 = 0;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v20 = 0;
        long long v21 = &v20;
        uint64_t v22 = 0x2020000000;
        char v23 = 0;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __62__SBRoutingSwitcherModifier_isLayoutRoleOccluded_inAppLayout___block_invoke;
        v16[3] = &unk_1E6AF63D0;
        long long v18 = &v20;
        int64_t v19 = a3;
        v16[4] = v11;
        id v17 = v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v16);
        unsigned int v12 = *((unsigned __int8 *)v21 + 24);

        _Block_object_dispose(&v20, 8);
        if (v8) {
          v6 |= v12 > (v6 & 1u);
        }
        else {
          char v6 = v12 != 0;
        }
        char v8 = 1;
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v6 & 1;
}

uint64_t __62__SBRoutingSwitcherModifier_isLayoutRoleOccluded_inAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isLayoutRoleOccluded:*(void *)(a1 + 56) inAppLayout:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  uint64_t v15 = 0;
  long long v16 = (double *)&v15;
  uint64_t v17 = 0x4010000000;
  long long v18 = &unk_1D90ED3C6;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v19 = *MEMORY[0x1E4F1DB28];
  long long v20 = v4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SBRoutingSwitcherModifier_clippingFrameForIndex_withBounds___block_invoke;
  v13[3] = &unk_1E6AFDAC8;
  void v13[4] = &v15;
  CGRect v14 = a4;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v13);
  double v5 = v16[4];
  double v6 = v16[5];
  double v7 = v16[6];
  double v8 = v16[7];
  _Block_object_dispose(&v15, 8);
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

uint64_t __62__SBRoutingSwitcherModifier_clippingFrameForIndex_withBounds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "clippingFrameForIndex:withBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v13 = a4;
  uint64_t v32 = 0;
  long long v33 = (double *)&v32;
  uint64_t v34 = 0x4010000000;
  v35 = &unk_1D90ED3C6;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v36 = *MEMORY[0x1E4F1DB28];
  long long v37 = v14;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __87__SBRoutingSwitcherModifier_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds___block_invoke;
  v24[3] = &unk_1E6AFDAF0;
  long long v26 = &v32;
  int64_t v27 = a3;
  id v15 = v13;
  id v25 = v15;
  CGFloat v28 = x;
  CGFloat v29 = y;
  CGFloat v30 = width;
  CGFloat v31 = height;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a5, v24);
  double v16 = v33[4];
  double v17 = v33[5];
  double v18 = v33[6];
  double v19 = v33[7];

  _Block_object_dispose(&v32, 8);
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

uint64_t __87__SBRoutingSwitcherModifier_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(a2, "clippingFrameForLayoutRole:inAppLayout:atIndex:withBounds:", *(void *)(a1 + 48), *(void *)(a1 + 32), a3, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 8);
  v5[4] = v6;
  void v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;
  return result;
}

- (BOOL)clipsToBoundsAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBRoutingSwitcherModifier_clipsToBoundsAtIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SBRoutingSwitcherModifier_clipsToBoundsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "clipsToBoundsAtIndex:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy__29;
  double v20 = __Block_byref_object_dispose__29;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__SBRoutingSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke;
  v12[3] = &unk_1E6AFDB18;
  id v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v8, v12);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __91__SBRoutingSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 preferredAppLayoutToReuseAccessoryForAppLayout:a1[4] fromAppLayouts:a1[5]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)systemApertureTransitioningAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)systemApertureRequiresHeavyShadowForTransition
{
  return 0;
}

- (CGPoint)expandedSourcePositionForSystemApertureTransition
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGRect)rootContentViewMaskRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (double)rootContentViewBlurRadius
{
  return 0.0;
}

- (id)meshTransformForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__29;
  id v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBRoutingSwitcherModifier_meshTransformForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__SBRoutingSwitcherModifier_meshTransformForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "meshTransformForIndex:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)identityMeshTransformForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__29;
  id v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SBRoutingSwitcherModifier_identityMeshTransformForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__SBRoutingSwitcherModifier_identityMeshTransformForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "identityMeshTransformForIndex:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SBRoutingSwitcherModifier_isDropletEffectRequiredBehindAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __68__SBRoutingSwitcherModifier_isDropletEffectRequiredBehindAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isDropletEffectRequiredBehindAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__29;
  id v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SBRoutingSwitcherModifier_resizeGrabberLayoutAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E6AFD9D8;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __71__SBRoutingSwitcherModifier_resizeGrabberLayoutAttributesForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 resizeGrabberLayoutAttributesForAppLayout:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  uint64_t v26 = 0;
  int64_t v27 = (double *)&v26;
  uint64_t v28 = 0x4010000000;
  CGFloat v29 = &unk_1D90ED3C6;
  long long v30 = 0u;
  long long v31 = 0u;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke;
  v19[3] = &unk_1E6AFDB40;
  id v21 = &v26;
  CGFloat v22 = x;
  CGFloat v23 = y;
  CGFloat v24 = width;
  CGFloat v25 = height;
  id v10 = v9;
  id v20 = v10;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v10, v19);
  double v11 = v27[4];
  double v12 = v27[5];
  double v13 = v27[6];
  double v14 = v27[7];

  _Block_object_dispose(&v26, 8);
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

uint64_t __74__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "adjustedSpaceAccessoryViewFrame:forAppLayout:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v18 = 0;
  double v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  id v21 = &unk_1D90ED3C6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke;
  v13[3] = &unk_1E6AFDA50;
  double v15 = &v18;
  CGFloat v16 = x;
  CGFloat v17 = y;
  id v8 = v7;
  id v14 = v8;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v8, v13);
  double v9 = v19[4];
  double v10 = v19[5];

  _Block_object_dispose(&v18, 8);
  double v11 = v9;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

uint64_t __80__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

- (double)adjustedSpaceAccessoryViewScale:(double)a3 forAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  double v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewScale_forAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  double v12 = &v14;
  double v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  double v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __74__SBRoutingSwitcherModifier_adjustedSpaceAccessoryViewScale_forAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 adjustedSpaceAccessoryViewScale:*(void *)(a1 + 32) forAppLayout:*(double *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (id)visibleAppLayouts
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_modifiers;
  double v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      id v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x3032000000;
        uint64_t v18 = __Block_byref_object_copy__29;
        double v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __46__SBRoutingSwitcherModifier_visibleAppLayouts__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _setByCombiningSets(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        double v2 = v9;

        ++v5;
        char v4 = 1;
        id v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __46__SBRoutingSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBRoutingSwitcherModifier_isHomeAffordanceSupportedForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __67__SBRoutingSwitcherModifier_isHomeAffordanceSupportedForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isHomeAffordanceSupportedForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)visibleHomeAffordanceLayoutElements
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      id v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x3032000000;
        uint64_t v18 = __Block_byref_object_copy__29;
        double v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __64__SBRoutingSwitcherModifier_visibleHomeAffordanceLayoutElements__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _setByCombiningSets(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        id v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __64__SBRoutingSwitcherModifier_visibleHomeAffordanceLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleHomeAffordanceLayoutElements];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SBRoutingSwitcherModifier_isResizeGrabberVisibleForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __64__SBRoutingSwitcherModifier_isResizeGrabberVisibleForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isResizeGrabberVisibleForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__SBRoutingSwitcherModifier_activeCornersForTouchResizeForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  uint64_t v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  unint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __82__SBRoutingSwitcherModifier_activeCornersForTouchResizeForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 activeCornersForTouchResizeForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBRoutingSwitcherModifier_isItemResizingAllowedForLayoutRole_inAppLayout___block_invoke;
  v9[3] = &unk_1E6AFD9B0;
  id v11 = &v13;
  int64_t v12 = a3;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __76__SBRoutingSwitcherModifier_isItemResizingAllowedForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 isItemResizingAllowedForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)visibleShelves
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_modifiers;
  uint64_t v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      id v7 = v3;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(obj);
        }
        unint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * v6);
        uint64_t v17 = 0;
        uint64_t v18 = &v17;
        uint64_t v19 = 0x3032000000;
        id v20 = __Block_byref_object_copy__29;
        long long v21 = __Block_byref_object_dispose__29;
        id v22 = 0;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __43__SBRoutingSwitcherModifier_visibleShelves__block_invoke;
        v16[3] = &unk_1E6AF4B88;
        v16[4] = v8;
        void v16[5] = &v17;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v16);
        id v9 = (id)v18[5];
        _Block_object_dispose(&v17, 8);

        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __43__SBRoutingSwitcherModifier_visibleShelves__block_invoke_2;
        v15[3] = &unk_1E6AFDB68;
        v15[4] = self;
        void v15[5] = v8;
        id v10 = objc_msgSend(v9, "bs_map:", v15);

        if (v5)
        {
          _setByCombiningSets(v7, v10);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v11 = v10;
        }
        uint64_t v3 = v11;

        ++v6;
        char v5 = 1;
        id v7 = v3;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }

  return v3;
}

void __43__SBRoutingSwitcherModifier_visibleShelves__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleShelves];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __43__SBRoutingSwitcherModifier_visibleShelves__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustedShelfForShelf:a2 fromModifier:*(void *)(a1 + 40)];
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x5810000000;
  long long v25 = &unk_1D90ED3C6;
  memset(v26, 0, sizeof(v26));
  uint64_t v27 = 0;
  SBSwitcherShelfPresentationAttributesMake(0, 0, 0, (uint64_t)v26, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_modifiers;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __60__SBRoutingSwitcherModifier_presentationAttributesForShelf___block_invoke;
        v15[3] = &unk_1E6AFA860;
        v15[4] = v9;
        void v15[5] = self;
        id v16 = v5;
        uint64_t v17 = &v22;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v15);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v6);
  }

  id v10 = v23;
  long long v11 = *((_OWORD *)v23 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v23 + 2);
  *(_OWORD *)&retstr->var1.origin.CGFloat y = v11;
  *(_OWORD *)&retstr->var1.size.CGFloat height = *((_OWORD *)v10 + 4);
  retstr->var3 = v10[10];
  _Block_object_dispose(&v22, 8);

  return result;
}

void __60__SBRoutingSwitcherModifier_presentationAttributesForShelf___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleShelves];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__SBRoutingSwitcherModifier_presentationAttributesForShelf___block_invoke_2;
  v14[3] = &unk_1E6AFDB90;
  int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v3 = objc_msgSend(v2, "bs_map:", v14);

  if ([v3 containsObject:*(void *)(a1 + 48)])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) _adjustedShelfForShelf:*(void *)(a1 + 48) forModifier:v4];
    [v4 presentationAttributesForShelf:v5];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = v13;
    long long v8 = v12;
    long long v9 = v11;
    *(_OWORD *)(v6 + 32) = v10;
    *(_OWORD *)(v6 + 48) = v9;
    *(_OWORD *)(v6 + 64) = v8;
    *(void *)(v6 + 80) = v7;
  }
}

uint64_t __60__SBRoutingSwitcherModifier_presentationAttributesForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustedShelfForShelf:a2 fromModifier:*(void *)(a1 + 40)];
}

- (CGRect)frameForShelf:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = (double *)&v26;
  uint64_t v28 = 0x4010000000;
  uint64_t v29 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v30 = *MEMORY[0x1E4F1DB28];
  long long v31 = v5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __43__SBRoutingSwitcherModifier_frameForShelf___block_invoke;
        v19[3] = &unk_1E6AFA860;
        void v19[4] = v9;
        v19[5] = self;
        id v20 = v4;
        long long v21 = &v26;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v19);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v6);
  }

  double v10 = v27[4];
  double v11 = v27[5];
  double v12 = v27[6];
  double v13 = v27[7];
  _Block_object_dispose(&v26, 8);

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

void __43__SBRoutingSwitcherModifier_frameForShelf___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleShelves];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SBRoutingSwitcherModifier_frameForShelf___block_invoke_2;
  v11[3] = &unk_1E6AFDB90;
  int8x16_t v12 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v3 = objc_msgSend(v2, "bs_map:", v11);

  if ([v3 containsObject:*(void *)(a1 + 48)])
  {
    id v4 = *(void **)(a1 + 32);
    long long v5 = [*(id *)(a1 + 40) _adjustedShelfForShelf:*(void *)(a1 + 48) forModifier:v4];
    [v4 frameForShelf:v5];
    uint64_t v6 = *(void **)(*(void *)(a1 + 56) + 8);
    v6[4] = v7;
    v6[5] = v8;
    void v6[6] = v9;
    v6[7] = v10;
  }
}

uint64_t __43__SBRoutingSwitcherModifier_frameForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustedShelfForShelf:a2 fromModifier:*(void *)(a1 + 40)];
}

- (id)focusedAppLayoutForShelf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__29;
  long long v23 = __Block_byref_object_dispose__29;
  id v24 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_modifiers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __54__SBRoutingSwitcherModifier_focusedAppLayoutForShelf___block_invoke;
        v12[3] = &unk_1E6AFA860;
        void v12[4] = v8;
        void v12[5] = self;
        id v13 = v4;
        double v14 = &v19;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }

  id v9 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __54__SBRoutingSwitcherModifier_focusedAppLayoutForShelf___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleShelves];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SBRoutingSwitcherModifier_focusedAppLayoutForShelf___block_invoke_2;
  v9[3] = &unk_1E6AFDB90;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v3 = objc_msgSend(v2, "bs_map:", v9);

  if ([v3 containsObject:*(void *)(a1 + 48)])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) _adjustedShelfForShelf:*(void *)(a1 + 48) forModifier:v4];
    uint64_t v6 = [v4 focusedAppLayoutForShelf:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

uint64_t __54__SBRoutingSwitcherModifier_focusedAppLayoutForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustedShelfForShelf:a2 fromModifier:*(void *)(a1 + 40)];
}

- (id)ignoredDisplayItemsForShelf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__29;
  long long v23 = __Block_byref_object_dispose__29;
  id v24 = [MEMORY[0x1E4F1CAD0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_modifiers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __57__SBRoutingSwitcherModifier_ignoredDisplayItemsForShelf___block_invoke;
        v12[3] = &unk_1E6AFA860;
        void v12[4] = v8;
        void v12[5] = self;
        id v13 = v4;
        double v14 = &v19;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }

  id v9 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __57__SBRoutingSwitcherModifier_ignoredDisplayItemsForShelf___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleShelves];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__SBRoutingSwitcherModifier_ignoredDisplayItemsForShelf___block_invoke_2;
  v9[3] = &unk_1E6AFDB90;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v3 = objc_msgSend(v2, "bs_map:", v9);

  if ([v3 containsObject:*(void *)(a1 + 48)])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) _adjustedShelfForShelf:*(void *)(a1 + 48) forModifier:v4];
    uint64_t v6 = [v4 ignoredDisplayItemsForShelf:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

uint64_t __57__SBRoutingSwitcherModifier_ignoredDisplayItemsForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustedShelfForShelf:a2 fromModifier:*(void *)(a1 + 40)];
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__29;
  long long v23 = __Block_byref_object_dispose__29;
  id v24 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_modifiers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __60__SBRoutingSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke;
        v12[3] = &unk_1E6AFA860;
        void v12[4] = v8;
        void v12[5] = self;
        id v13 = v4;
        double v14 = &v19;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }

  id v9 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __60__SBRoutingSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleShelves];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBRoutingSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke_2;
  v9[3] = &unk_1E6AFDB90;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v3 = objc_msgSend(v2, "bs_map:", v9);

  if ([v3 containsObject:*(void *)(a1 + 48)])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) _adjustedShelfForShelf:*(void *)(a1 + 48) forModifier:v4];
    uint64_t v6 = [v4 containerLeafAppLayoutForShelf:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

uint64_t __60__SBRoutingSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustedShelfForShelf:a2 fromModifier:*(void *)(a1 + 40)];
}

- (id)hiddenAppLayoutsInShelf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__29;
  long long v23 = __Block_byref_object_dispose__29;
  id v24 = [MEMORY[0x1E4F1CAD0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_modifiers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __53__SBRoutingSwitcherModifier_hiddenAppLayoutsInShelf___block_invoke;
        v12[3] = &unk_1E6AFA860;
        void v12[4] = v8;
        void v12[5] = self;
        id v13 = v4;
        double v14 = &v19;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }

  id v9 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __53__SBRoutingSwitcherModifier_hiddenAppLayoutsInShelf___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleShelves];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SBRoutingSwitcherModifier_hiddenAppLayoutsInShelf___block_invoke_2;
  v9[3] = &unk_1E6AFDB90;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v3 = objc_msgSend(v2, "bs_map:", v9);

  if ([v3 containsObject:*(void *)(a1 + 48)])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) _adjustedShelfForShelf:*(void *)(a1 + 48) forModifier:v4];
    uint64_t v6 = [v4 hiddenAppLayoutsInShelf:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

uint64_t __53__SBRoutingSwitcherModifier_hiddenAppLayoutsInShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustedShelfForShelf:a2 fromModifier:*(void *)(a1 + 40)];
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__29;
  long long v23 = __Block_byref_object_dispose__29;
  id v24 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_modifiers;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __74__SBRoutingSwitcherModifier_homeAffordanceLayoutElementToPortalIntoShelf___block_invoke;
        v12[3] = &unk_1E6AFA860;
        void v12[4] = v8;
        void v12[5] = self;
        id v13 = v4;
        double v14 = &v19;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }

  id v9 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __74__SBRoutingSwitcherModifier_homeAffordanceLayoutElementToPortalIntoShelf___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleShelves];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__SBRoutingSwitcherModifier_homeAffordanceLayoutElementToPortalIntoShelf___block_invoke_2;
  v9[3] = &unk_1E6AFDB90;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v3 = objc_msgSend(v2, "bs_map:", v9);

  if ([v3 containsObject:*(void *)(a1 + 48)])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) _adjustedShelfForShelf:*(void *)(a1 + 48) forModifier:v4];
    uint64_t v6 = [v4 homeAffordanceLayoutElementToPortalIntoShelf:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

uint64_t __74__SBRoutingSwitcherModifier_homeAffordanceLayoutElementToPortalIntoShelf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustedShelfForShelf:a2 fromModifier:*(void *)(a1 + 40)];
}

- (unint64_t)hiddenContainerStatusBarParts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __58__SBRoutingSwitcherModifier_hiddenContainerStatusBarParts__block_invoke;
        v10[3] = &unk_1E6AF4B88;
        void v10[4] = v7;
        v10[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v10);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v4);
  }

  unint64_t v8 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __58__SBRoutingSwitcherModifier_hiddenContainerStatusBarParts__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hiddenContainerStatusBarParts];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__SBRoutingSwitcherModifier_hiddenContentStatusBarPartsForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  long long v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  unint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __82__SBRoutingSwitcherModifier_hiddenContentStatusBarPartsForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 hiddenContentStatusBarPartsForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (id)_adjustedShelfForShelf:(id)a3 forModifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  int8x16_t v10 = v8;
  if (objc_opt_respondsToSelector())
  {
    int8x16_t v10 = [WeakRetained adjustedShelfForShelf:v8 forModifier:v7];
  }
  return v10;
}

- (id)_adjustedShelfForShelf:(id)a3 fromModifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  int8x16_t v10 = v8;
  if (objc_opt_respondsToSelector())
  {
    int8x16_t v10 = [WeakRetained adjustedShelfForShelf:v8 fromModifier:v7];
  }
  return v10;
}

- (double)contentViewScale
{
  uint64_t v8 = 0;
  id v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SBRoutingSwitcherModifier_contentViewScale__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __45__SBRoutingSwitcherModifier_contentViewScale__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 contentViewScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SBRoutingSwitcherModifier_clipsToUnobscuredMarginAtIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__SBRoutingSwitcherModifier_clipsToUnobscuredMarginAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "clipsToUnobscuredMarginAtIndex:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SBRoutingSwitcherModifier_visibleMarginForItemContainerAtIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__SBRoutingSwitcherModifier_visibleMarginForItemContainerAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "visibleMarginForItemContainerAtIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SBRoutingSwitcherModifier_wallpaperOverlayAlphaForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__SBRoutingSwitcherModifier_wallpaperOverlayAlphaForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "wallpaperOverlayAlphaForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SBRoutingSwitcherModifier_lighteningAlphaForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SBRoutingSwitcherModifier_lighteningAlphaForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "lighteningAlphaForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SBRoutingSwitcherModifier_headerStyleForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__SBRoutingSwitcherModifier_headerStyleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "headerStyleForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBRoutingSwitcherModifier_titleOpacityForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SBRoutingSwitcherModifier_titleOpacityForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "titleOpacityForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SBRoutingSwitcherModifier_titleAndIconOpacityForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SBRoutingSwitcherModifier_titleAndIconOpacityForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "titleAndIconOpacityForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBRoutingSwitcherModifier_shadowOffsetForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SBRoutingSwitcherModifier_shadowOffsetForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "shadowOffsetForIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v12 = 0;
  int64_t v13 = (double *)&v12;
  uint64_t v14 = 0x4010000000;
  uint64_t v15 = &unk_1D90ED3C6;
  long long v16 = 0u;
  long long v17 = 0u;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__SBRoutingSwitcherModifier_cornerRadiiForIndex___block_invoke;
  v11[3] = &unk_1E6AFDA28;
  void v11[4] = &v12;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v11);
  double v3 = v13[4];
  double v4 = v13[5];
  double v5 = v13[6];
  double v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.double topRight = v10;
  result.double bottomRight = v9;
  result.double bottomLeft = v8;
  result.double topLeft = v7;
  return result;
}

uint64_t __49__SBRoutingSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "cornerRadiiForIndex:");
  double v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBRoutingSwitcherModifier_shouldScaleOverlayToFillBoundsAtIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__SBRoutingSwitcherModifier_shouldScaleOverlayToFillBoundsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "shouldScaleOverlayToFillBoundsAtIndex:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBRoutingSwitcherModifier_shouldScaleContentToFillBoundsAtIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__SBRoutingSwitcherModifier_shouldScaleContentToFillBoundsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "shouldScaleContentToFillBoundsAtIndex:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SBRoutingSwitcherModifier_shouldUseBrightMaterialForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__SBRoutingSwitcherModifier_shouldUseBrightMaterialForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "shouldUseBrightMaterialForIndex:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__SBRoutingSwitcherModifier_shouldUseBackgroundWallpaperTreatmentForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__SBRoutingSwitcherModifier_shouldUseBackgroundWallpaperTreatmentForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "shouldUseBackgroundWallpaperTreatmentForIndex:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SBRoutingSwitcherModifier_shouldShowBackdropViewAtIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__SBRoutingSwitcherModifier_shouldShowBackdropViewAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "shouldShowBackdropViewAtIndex:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __64__SBRoutingSwitcherModifier_shouldUseWallpaperGradientTreatment__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __64__SBRoutingSwitcherModifier_shouldUseWallpaperGradientTreatment__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldUseWallpaperGradientTreatment];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = &unk_1D90ED3C6;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SBRoutingSwitcherModifier_wallpaperGradientAttributesForIndex___block_invoke;
  v7[3] = &unk_1E6AFDA28;
  void v7[4] = &v8;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.trailingAlpha = v6;
  result.leadingAlpha = v5;
  return result;
}

uint64_t __65__SBRoutingSwitcherModifier_wallpaperGradientAttributesForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "wallpaperGradientAttributesForIndex:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

- (double)homeScreenAlpha
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SBRoutingSwitcherModifier_homeScreenAlpha__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__SBRoutingSwitcherModifier_homeScreenAlpha__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 homeScreenAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (double)homeScreenScale
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SBRoutingSwitcherModifier_homeScreenScale__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__SBRoutingSwitcherModifier_homeScreenScale__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 homeScreenScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (double)wallpaperScale
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SBRoutingSwitcherModifier_wallpaperScale__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __43__SBRoutingSwitcherModifier_wallpaperScale__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 wallpaperScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (double)homeScreenDimmingAlpha
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SBRoutingSwitcherModifier_homeScreenDimmingAlpha__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __51__SBRoutingSwitcherModifier_homeScreenDimmingAlpha__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 homeScreenDimmingAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (int64_t)homeScreenBackdropBlurType
{
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBRoutingSwitcherModifier_homeScreenBackdropBlurType__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__SBRoutingSwitcherModifier_homeScreenBackdropBlurType__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 homeScreenBackdropBlurType];
}

- (double)homeScreenBackdropBlurProgress
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SBRoutingSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __59__SBRoutingSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (BOOL)wantsSwitcherDimmingView
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __53__SBRoutingSwitcherModifier_wantsSwitcherDimmingView__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      int v8 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__SBRoutingSwitcherModifier_wantsSwitcherDimmingView__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __53__SBRoutingSwitcherModifier_wantsSwitcherDimmingView__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsSwitcherDimmingView];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBRoutingSwitcherModifier_wantsSwitcherDimmingView__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsSwitcherDimmingView];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)switcherDimmingAlpha
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {

LABEL_13:
    uint64_t v5 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v23 != v6) {
        objc_enumerationMutation(v3);
      }
      int v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = (double *)&v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __49__SBRoutingSwitcherModifier_switcherDimmingAlpha__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      double v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9 != 0.0)
      {
        id v10 = v8;

        uint64_t v5 = v10;
      }
    }
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v4);

  if (!v5) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__SBRoutingSwitcherModifier_switcherDimmingAlpha__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v11 = v5;
  id v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  double v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

double __49__SBRoutingSwitcherModifier_switcherDimmingAlpha__block_invoke(uint64_t a1)
{
  double result = (double)[*(id *)(a1 + 32) wantsSwitcherDimmingView];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __49__SBRoutingSwitcherModifier_switcherDimmingAlpha__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) switcherDimmingAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__SBRoutingSwitcherModifier_switcherDimmingViewBlocksTouches__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      int v8 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__SBRoutingSwitcherModifier_switcherDimmingViewBlocksTouches__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __61__SBRoutingSwitcherModifier_switcherDimmingViewBlocksTouches__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsSwitcherDimmingView];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __61__SBRoutingSwitcherModifier_switcherDimmingViewBlocksTouches__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) switcherDimmingViewBlocksTouches];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54__SBRoutingSwitcherModifier_wantsSwitcherBackdropBlur__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      int v8 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__SBRoutingSwitcherModifier_wantsSwitcherBackdropBlur__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __54__SBRoutingSwitcherModifier_wantsSwitcherBackdropBlur__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsSwitcherBackdropBlur];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __54__SBRoutingSwitcherModifier_wantsSwitcherBackdropBlur__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsSwitcherBackdropBlur];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)switcherBackdropBlurType
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __53__SBRoutingSwitcherModifier_switcherBackdropBlurType__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      uint64_t v8 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__SBRoutingSwitcherModifier_switcherBackdropBlurType__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  int64_t v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __53__SBRoutingSwitcherModifier_switcherBackdropBlurType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsSwitcherBackdropBlur];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBRoutingSwitcherModifier_switcherBackdropBlurType__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) switcherBackdropBlurType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)switcherBackdropBlurProgress
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {

LABEL_13:
    uint64_t v5 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v23 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = (double *)&v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57__SBRoutingSwitcherModifier_switcherBackdropBlurProgress__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      double v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9 != 0.0)
      {
        id v10 = v8;

        uint64_t v5 = v10;
      }
    }
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v4);

  if (!v5) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SBRoutingSwitcherModifier_switcherBackdropBlurProgress__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v11 = v5;
  id v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  double v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

double __57__SBRoutingSwitcherModifier_switcherBackdropBlurProgress__block_invoke(uint64_t a1)
{
  double result = (double)[*(id *)(a1 + 32) wantsSwitcherBackdropBlur];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __57__SBRoutingSwitcherModifier_switcherBackdropBlurProgress__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) switcherBackdropBlurProgress];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SBRoutingSwitcherModifier_multipleWindowsIndicatorLayoutRoleMaskForAppLayout___block_invoke;
  v8[3] = &unk_1E6AFD9D8;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __80__SBRoutingSwitcherModifier_multipleWindowsIndicatorLayoutRoleMaskForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 multipleWindowsIndicatorLayoutRoleMaskForAppLayout:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__SBRoutingSwitcherModifier_wantsSpaceAccessoryViewPointerInteractionsForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __84__SBRoutingSwitcherModifier_wantsSpaceAccessoryViewPointerInteractionsForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 wantsSpaceAccessoryViewPointerInteractionsForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__SBRoutingSwitcherModifier_spaceAccessoryViewIconHitTestOutsetForAppLayout___block_invoke;
  v8[3] = &unk_1E6AFD9D8;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  double v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __77__SBRoutingSwitcherModifier_spaceAccessoryViewIconHitTestOutsetForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 spaceAccessoryViewIconHitTestOutsetForAppLayout:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBRoutingSwitcherModifier_canSelectLeafWithModifierKeysInAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __70__SBRoutingSwitcherModifier_canSelectLeafWithModifierKeysInAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 canSelectLeafWithModifierKeysInAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SBRoutingSwitcherModifier_shouldAllowGroupOpacityForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __65__SBRoutingSwitcherModifier_shouldAllowGroupOpacityForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 shouldAllowGroupOpacityForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SBRoutingSwitcherModifier_perspectiveAngleForAppLayout___block_invoke;
  v8[3] = &unk_1E6AFD9D8;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  double v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __58__SBRoutingSwitcherModifier_perspectiveAngleForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 perspectiveAngleForAppLayout:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SBRoutingSwitcherModifier_footerViewIconAlignmentForAppLayout___block_invoke;
  v8[3] = &unk_1E6AFD9D8;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __65__SBRoutingSwitcherModifier_footerViewIconAlignmentForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 footerViewIconAlignmentForAppLayout:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isScrollEnabled
{
  uint64_t v2 = self;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v4 = [WeakRetained scrollModifierForRoutingModifier:v2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SBRoutingSwitcherModifier_isScrollEnabled__block_invoke;
  v6[3] = &unk_1E6AF4B88;
  v6[4] = v2;
  v6[5] = &v7;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&v2->super.super.super.isa, v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __44__SBRoutingSwitcherModifier_isScrollEnabled__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isScrollEnabled];
}

- (BOOL)shouldScrollViewBlockTouches
{
  uint64_t v2 = self;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v4 = [WeakRetained scrollModifierForRoutingModifier:v2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SBRoutingSwitcherModifier_shouldScrollViewBlockTouches__block_invoke;
  v6[3] = &unk_1E6AF4B88;
  v6[4] = v2;
  v6[5] = &v7;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&v2->super.super.super.isa, v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __57__SBRoutingSwitcherModifier_shouldScrollViewBlockTouches__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 shouldScrollViewBlockTouches];
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __70__SBRoutingSwitcherModifier_shouldRubberbandFullScreenHomeGrabberView__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __70__SBRoutingSwitcherModifier_shouldRubberbandFullScreenHomeGrabberView__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldRubberbandFullScreenHomeGrabberView];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isContainerStatusBarVisible
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __56__SBRoutingSwitcherModifier_isContainerStatusBarVisible__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      int v8 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (!v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__SBRoutingSwitcherModifier_isContainerStatusBarVisible__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __56__SBRoutingSwitcherModifier_isContainerStatusBarVisible__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isContainerStatusBarVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __56__SBRoutingSwitcherModifier_isContainerStatusBarVisible__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isContainerStatusBarVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)containerStatusBarAnimationDuration
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {

LABEL_13:
    uint64_t v5 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v23 != v6) {
        objc_enumerationMutation(v3);
      }
      int v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = (double *)&v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64__SBRoutingSwitcherModifier_containerStatusBarAnimationDuration__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      double v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9 == 0.0)
      {
        id v10 = v8;

        uint64_t v5 = v10;
      }
    }
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v4);

  if (!v5) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__SBRoutingSwitcherModifier_containerStatusBarAnimationDuration__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v11 = v5;
  id v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  double v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

double __64__SBRoutingSwitcherModifier_containerStatusBarAnimationDuration__block_invoke(uint64_t a1)
{
  double result = (double)[*(id *)(a1 + 32) isContainerStatusBarVisible];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __64__SBRoutingSwitcherModifier_containerStatusBarAnimationDuration__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) containerStatusBarAnimationDuration];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SBRoutingSwitcherModifier_isContentStatusBarVisibleForIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__SBRoutingSwitcherModifier_isContentStatusBarVisibleForIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "isContentStatusBarVisibleForIndex:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __59__SBRoutingSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      int v8 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__SBRoutingSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __59__SBRoutingSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isWallpaperRequiredForSwitcher];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __59__SBRoutingSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isWallpaperRequiredForSwitcher];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)wallpaperStyle
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __43__SBRoutingSwitcherModifier_wallpaperStyle__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      uint64_t v8 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__SBRoutingSwitcherModifier_wallpaperStyle__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  int64_t v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __43__SBRoutingSwitcherModifier_wallpaperStyle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isWallpaperRequiredForSwitcher];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __43__SBRoutingSwitcherModifier_wallpaperStyle__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wallpaperStyle];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isHomeScreenContentRequired
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __56__SBRoutingSwitcherModifier_isHomeScreenContentRequired__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __56__SBRoutingSwitcherModifier_isHomeScreenContentRequired__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isHomeScreenContentRequired];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __63__SBRoutingSwitcherModifier_wantsHomeScreenPointerInteractions__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __63__SBRoutingSwitcherModifier_wantsHomeScreenPointerInteractions__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsHomeScreenPointerInteractions];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int64_t v11 = __Block_byref_object_copy__29;
  double v12 = __Block_byref_object_dispose__29;
  id v13 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained scrollModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBRoutingSwitcherModifier_appExposeAccessoryButtonsBundleIdentifier__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __70__SBRoutingSwitcherModifier_appExposeAccessoryButtonsBundleIdentifier__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 appExposeAccessoryButtonsBundleIdentifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (double)plusButtonAlpha
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained scrollModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SBRoutingSwitcherModifier_plusButtonAlpha__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__SBRoutingSwitcherModifier_plusButtonAlpha__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 plusButtonAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (double)reopenClosedWindowsButtonAlpha
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained scrollModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SBRoutingSwitcherModifier_reopenClosedWindowsButtonAlpha__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __59__SBRoutingSwitcherModifier_reopenClosedWindowsButtonAlpha__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 reopenClosedWindowsButtonAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (double)reopenClosedWindowsButtonScale
{
  uint64_t v8 = 0;
  unsigned int v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained scrollModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SBRoutingSwitcherModifier_reopenClosedWindowsButtonScale__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __59__SBRoutingSwitcherModifier_reopenClosedWindowsButtonScale__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  [v2 reopenClosedWindowsButtonScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained scrollModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__SBRoutingSwitcherModifier_appExposeAccessoryButtonsOverrideUserInterfaceStyle__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __80__SBRoutingSwitcherModifier_appExposeAccessoryButtonsOverrideUserInterfaceStyle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 appExposeAccessoryButtonsOverrideUserInterfaceStyle];
}

- (int64_t)plusButtonStyle
{
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained scrollModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SBRoutingSwitcherModifier_plusButtonStyle__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__SBRoutingSwitcherModifier_plusButtonStyle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 plusButtonStyle];
}

- (BOOL)isSwitcherWindowVisible
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __52__SBRoutingSwitcherModifier_isSwitcherWindowVisible__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __52__SBRoutingSwitcherModifier_isSwitcherWindowVisible__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSwitcherWindowVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __67__SBRoutingSwitcherModifier_isSwitcherWindowUserInteractionEnabled__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __67__SBRoutingSwitcherModifier_isSwitcherWindowUserInteractionEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSwitcherWindowUserInteractionEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __69__SBRoutingSwitcherModifier_isItemContainerPointerInteractionEnabled__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __69__SBRoutingSwitcherModifier_isItemContainerPointerInteractionEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isItemContainerPointerInteractionEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __55__SBRoutingSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _arrayByCombiningArrays(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __55__SBRoutingSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayoutsToCacheSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __63__SBRoutingSwitcherModifier_appLayoutsToCacheFullsizeSnapshots__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _arrayByCombiningArrays(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __63__SBRoutingSwitcherModifier_appLayoutsToCacheFullsizeSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayoutsToCacheFullsizeSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__SBRoutingSwitcherModifier_preferredSnapshotOrientationForAppLayout___block_invoke;
  v8[3] = &unk_1E6AFD9D8;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __70__SBRoutingSwitcherModifier_preferredSnapshotOrientationForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 preferredSnapshotOrientationForAppLayout:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)topMostLayoutElements
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v4 = self->_modifiers;
  if (objc_opt_respondsToSelector())
  {
    long long v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F28E10]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = v4;
    uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16, v4);
    if (v5)
    {
      uint64_t v6 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v33 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v26 = 0;
          uint64_t v27 = &v26;
          uint64_t v28 = 0x3032000000;
          uint64_t v29 = __Block_byref_object_copy__29;
          long long v30 = __Block_byref_object_dispose__29;
          id v31 = 0;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __50__SBRoutingSwitcherModifier_topMostLayoutElements__block_invoke;
          v25[3] = &unk_1E6AF4B88;
          v25[4] = v8;
          v25[5] = &v26;
          _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v25);
          id v9 = (id)v27[5];
          _Block_object_dispose(&v26, 8);

          [(NSArray *)v19 setObject:v9 forKey:v8];
        }
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v5);
    }

    id v10 = [WeakRetained routingModifier:self topMostLayoutElementsByModifier:v19];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v19 = v4;
    uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v21, v36, 16, v4);
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v19);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
          uint64_t v26 = 0;
          uint64_t v27 = &v26;
          uint64_t v28 = 0x3032000000;
          uint64_t v29 = __Block_byref_object_copy__29;
          long long v30 = __Block_byref_object_dispose__29;
          id v31 = 0;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __50__SBRoutingSwitcherModifier_topMostLayoutElements__block_invoke_2;
          v20[3] = &unk_1E6AF4B88;
          v20[4] = v14;
          v20[5] = &v26;
          _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v14, v20);
          id v15 = (id)v27[5];
          _Block_object_dispose(&v26, 8);

          [v10 addObjectsFromArray:v15];
        }
        uint64_t v11 = [(NSArray *)v19 countByEnumeratingWithState:&v21 objects:v36 count:16];
      }
      while (v11);
    }
  }

  return v10;
}

void __50__SBRoutingSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) topMostLayoutElements];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __50__SBRoutingSwitcherModifier_topMostLayoutElements__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) topMostLayoutElements];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  id v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __67__SBRoutingSwitcherModifier_appLayoutToScrollToBeforeTransitioning__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v6) {
          id v9 = v6;
        }
        else {
          id v9 = v8;
        }
        if ((v4 & 1) == 0) {
          id v9 = v8;
        }
        id v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __67__SBRoutingSwitcherModifier_appLayoutToScrollToBeforeTransitioning__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayoutToScrollToBeforeTransitioning];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  id v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __76__SBRoutingSwitcherModifier_appLayoutToScrollToBeforeReopeningClosedWindows__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v6) {
          id v9 = v6;
        }
        else {
          id v9 = v8;
        }
        if ((v4 & 1) == 0) {
          id v9 = v8;
        }
        id v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __76__SBRoutingSwitcherModifier_appLayoutToScrollToBeforeReopeningClosedWindows__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayoutToScrollToBeforeReopeningClosedWindows];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)transactionCompletionOptions
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  char v4 = [WeakRetained transactionCompletionOptionsModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SBRoutingSwitcherModifier_transactionCompletionOptions__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __57__SBRoutingSwitcherModifier_transactionCompletionOptions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained transactionCompletionOptionsModifierForRoutingModifier:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 transactionCompletionOptions];
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __66__SBRoutingSwitcherModifier_shouldAcceleratedHomeButtonPressBegin__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __66__SBRoutingSwitcherModifier_shouldAcceleratedHomeButtonPressBegin__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldAcceleratedHomeButtonPressBegin];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __79__SBRoutingSwitcherModifier_shouldFireTransitionCompletionInDefaultRunLoopMode__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __79__SBRoutingSwitcherModifier_shouldFireTransitionCompletionInDefaultRunLoopMode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldFireTransitionCompletionInDefaultRunLoopMode];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __79__SBRoutingSwitcherModifier_shouldPerformRotationAnimationForOrientationChange__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __79__SBRoutingSwitcherModifier_shouldPerformRotationAnimationForOrientationChange__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldPerformRotationAnimationForOrientationChange];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __66__SBRoutingSwitcherModifier_shouldPerformCrossfadeForReduceMotion__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __66__SBRoutingSwitcherModifier_shouldPerformCrossfadeForReduceMotion__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldPerformCrossfadeForReduceMotion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SBRoutingSwitcherModifier_isLayoutRoleKillable_inAppLayout_atIndex___block_invoke;
  v11[3] = &unk_1E6AFDA78;
  uint64_t v13 = &v15;
  int64_t v14 = a3;
  id v9 = v8;
  id v12 = v9;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a5, v11);
  LOBYTE(a5) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a5;
}

uint64_t __70__SBRoutingSwitcherModifier_isLayoutRoleKillable_inAppLayout_atIndex___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 isLayoutRoleKillable:a1[6] inAppLayout:a1[4] atIndex:a3];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SBRoutingSwitcherModifier_isIndexRubberbandableForSwipeToKill___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__SBRoutingSwitcherModifier_isIndexRubberbandableForSwipeToKill___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "isIndexRubberbandableForSwipeToKill:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  int64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__SBRoutingSwitcherModifier_shouldAnimateInsertionOrRemovalOfAppLayout_atIndex___block_invoke;
  v9[3] = &unk_1E6AFDBB8;
  uint64_t v11 = &v13;
  unint64_t v12 = a4;
  void v9[4] = self;
  id v7 = v6;
  id v10 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v9);
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

void __80__SBRoutingSwitcherModifier_shouldAnimateInsertionOrRemovalOfAppLayout_atIndex___block_invoke(void *a1, void *a2)
{
  char v3 = (void *)a1[4];
  unint64_t v4 = a1[7];
  id v5 = a2;
  LOBYTE(v3) = objc_msgSend(v5, "shouldAnimateInsertionOrRemovalOfAppLayout:atIndex:", a1[5], _SBRoutingSwitcherModifierSubIndexFromIndexForModifier(v3, v4, v5));

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v3;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SBRoutingSwitcherModifier_indexToScrollToAfterRemovingIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__SBRoutingSwitcherModifier_indexToScrollToAfterRemovingIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "indexToScrollToAfterRemovingIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SBRoutingSwitcherModifier_indexToScrollToAfterInsertingAtIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__SBRoutingSwitcherModifier_indexToScrollToAfterInsertingAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "indexToScrollToAfterInsertingAtIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        int64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __75__SBRoutingSwitcherModifier_shouldBringCardToFrontDuringInsertionOrRemoval__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __75__SBRoutingSwitcherModifier_shouldBringCardToFrontDuringInsertionOrRemoval__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldBringCardToFrontDuringInsertionOrRemoval];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        int64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __68__SBRoutingSwitcherModifier_shouldConfigureInAppDockHiddenAssertion__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __68__SBRoutingSwitcherModifier_shouldConfigureInAppDockHiddenAssertion__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldConfigureInAppDockHiddenAssertion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsDockBehaviorAssertion
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__SBRoutingSwitcherModifier_wantsDockBehaviorAssertion__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      int v8 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__SBRoutingSwitcherModifier_wantsDockBehaviorAssertion__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __55__SBRoutingSwitcherModifier_wantsDockBehaviorAssertion__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsDockBehaviorAssertion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __55__SBRoutingSwitcherModifier_wantsDockBehaviorAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsDockBehaviorAssertion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)dockProgress
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {

LABEL_13:
    uint64_t v5 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v23 != v6) {
        objc_enumerationMutation(v3);
      }
      int v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = (double *)&v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __41__SBRoutingSwitcherModifier_dockProgress__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      double v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9 != 0.0)
      {
        id v10 = v8;

        uint64_t v5 = v10;
      }
    }
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v4);

  if (!v5) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__SBRoutingSwitcherModifier_dockProgress__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v11 = v5;
  id v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  double v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

double __41__SBRoutingSwitcherModifier_dockProgress__block_invoke(uint64_t a1)
{
  double result = (double)[*(id *)(a1 + 32) wantsDockBehaviorAssertion];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __41__SBRoutingSwitcherModifier_dockProgress__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dockProgress];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)dockUpdateMode
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __43__SBRoutingSwitcherModifier_dockUpdateMode__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      uint64_t v8 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__SBRoutingSwitcherModifier_dockUpdateMode__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  int64_t v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __43__SBRoutingSwitcherModifier_dockUpdateMode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsDockBehaviorAssertion];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __43__SBRoutingSwitcherModifier_dockUpdateMode__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dockUpdateMode];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __58__SBRoutingSwitcherModifier_wantsDockWindowLevelAssertion__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      int v8 = *((unsigned __int8 *)v19 + 24);
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__SBRoutingSwitcherModifier_wantsDockWindowLevelAssertion__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __58__SBRoutingSwitcherModifier_wantsDockWindowLevelAssertion__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsDockWindowLevelAssertion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __58__SBRoutingSwitcherModifier_wantsDockWindowLevelAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsDockWindowLevelAssertion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)dockWindowLevelPriority
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v3)
  {

LABEL_13:
    uint64_t v4 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v23 != v5) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__SBRoutingSwitcherModifier_dockWindowLevelPriority__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v7;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v17);
      uint64_t v8 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v8)
      {
        id v9 = v7;

        uint64_t v4 = v9;
      }
    }
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v3);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__SBRoutingSwitcherModifier_dockWindowLevelPriority__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v10 = v4;
  id v15 = v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v14);
  unint64_t v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __52__SBRoutingSwitcherModifier_dockWindowLevelPriority__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsDockWindowLevelAssertion];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __52__SBRoutingSwitcherModifier_dockWindowLevelPriority__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dockWindowLevelPriority];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)dockWindowLevel
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v4)
  {

LABEL_13:
    uint64_t v5 = [(NSArray *)self->_modifiers lastObject];
    goto LABEL_14;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v23 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      uint64_t v18 = 0;
      long long v19 = (double *)&v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __44__SBRoutingSwitcherModifier_dockWindowLevel__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v8;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v17);
      double v9 = v19[3];
      _Block_object_dispose(&v18, 8);
      if (v9 != 0.0)
      {
        id v10 = v8;

        uint64_t v5 = v10;
      }
    }
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v4);

  if (!v5) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v18 = 0;
  long long v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__SBRoutingSwitcherModifier_dockWindowLevel__block_invoke_2;
  v14[3] = &unk_1E6AF4B88;
  char v16 = &v18;
  id v11 = v5;
  id v15 = v11;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v14);
  double v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

double __44__SBRoutingSwitcherModifier_dockWindowLevel__block_invoke(uint64_t a1)
{
  double result = (double)[*(id *)(a1 + 32) wantsDockWindowLevelAssertion];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __44__SBRoutingSwitcherModifier_dockWindowLevel__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dockWindowLevel];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)appLayoutsToResignActive
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        uint64_t v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __53__SBRoutingSwitcherModifier_appLayoutsToResignActive__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _dictionaryByCombingDictionaryOfSetOfAppLayouts(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __53__SBRoutingSwitcherModifier_appLayoutsToResignActive__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayoutsToResignActive];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)keyboardSuppressionMode
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        uint64_t v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __52__SBRoutingSwitcherModifier_keyboardSuppressionMode__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _switcherKeyboardSuppressionModeByCombiningSuppressionModes(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __52__SBRoutingSwitcherModifier_keyboardSuppressionMode__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyboardSuppressionMode];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2810000000;
  uint64_t v13 = &unk_1D90ED3C6;
  __int16 v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SBRoutingSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOWORD(self) = *((_WORD *)v11 + 16);

  _Block_object_dispose(&v10, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __66__SBRoutingSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 asyncRenderingAttributesForAppLayout:*(void *)(a1 + 32)];
  *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        __int16 v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __71__SBRoutingSwitcherModifier_wantsAsynchronousSurfaceRetentionAssertion__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __71__SBRoutingSwitcherModifier_wantsAsynchronousSurfaceRetentionAssertion__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsAsynchronousSurfaceRetentionAssertion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SBRoutingSwitcherModifier_wantsSceneResizesHostedContextForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  unsigned int v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __72__SBRoutingSwitcherModifier_wantsSceneResizesHostedContextForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 wantsSceneResizesHostedContextForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  id v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __70__SBRoutingSwitcherModifier_appLayoutForReceivingHardwareButtonEvents__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v6) {
          unsigned int v9 = v6;
        }
        else {
          unsigned int v9 = v8;
        }
        if ((v4 & 1) == 0) {
          unsigned int v9 = v8;
        }
        id v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __70__SBRoutingSwitcherModifier_appLayoutForReceivingHardwareButtonEvents__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayoutForReceivingHardwareButtonEvents];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = self->_modifiers;
  BOOL v6 = 0;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    char v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = 0;
        id v20 = &v19;
        uint64_t v21 = 0x2020000000;
        char v22 = 0;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __82__SBRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke;
        v15[3] = &unk_1E6AF63D0;
        uint64_t v17 = &v19;
        int64_t v18 = a3;
        v15[4] = v11;
        id v16 = v14;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v15);
        LODWORD(v11) = *((unsigned __int8 *)v20 + 24);

        _Block_object_dispose(&v19, 8);
        BOOL v6 = (v11 != 0) & (v8 ^ 1 | v6);
        char v8 = 1;
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  return v6;
}

uint64_t __82__SBRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canPerformKeyboardShortcutAction:*(void *)(a1 + 56) forBundleIdentifier:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      BOOL v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        id v16 = &v15;
        uint64_t v17 = 0x3032000000;
        int64_t v18 = __Block_byref_object_copy__29;
        uint64_t v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __76__SBRoutingSwitcherModifier_activeLeafAppLayoutsReachableByKeyboardShortcut__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _arrayByCombiningArrays(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        BOOL v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __76__SBRoutingSwitcherModifier_activeLeafAppLayoutsReachableByKeyboardShortcut__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeLeafAppLayoutsReachableByKeyboardShortcut];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      BOOL v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        id v16 = &v15;
        uint64_t v17 = 0x3032000000;
        int64_t v18 = __Block_byref_object_copy__29;
        uint64_t v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __74__SBRoutingSwitcherModifier_inactiveAppLayoutsReachableByKeyboardShortcut__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _arrayByCombiningArrays(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        BOOL v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __74__SBRoutingSwitcherModifier_inactiveAppLayoutsReachableByKeyboardShortcut__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inactiveAppLayoutsReachableByKeyboardShortcut];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__29;
  long long v24 = __Block_byref_object_dispose__29;
  id v25 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v9 = [WeakRetained scrollModifierForRoutingModifier:self];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __127__SBRoutingSwitcherModifier_adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher_identifiersInStrip___block_invoke;
  v15[3] = &unk_1E6AFDBE0;
  uint64_t v19 = &v20;
  id v10 = v9;
  id v16 = v10;
  id v11 = v6;
  id v17 = v11;
  id v12 = v7;
  id v18 = v12;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v10, v15);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __127__SBRoutingSwitcherModifier_adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher_identifiersInStrip___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:*(void *)(a1 + 40) identifiersInStrip:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__29;
  uint64_t v19 = __Block_byref_object_dispose__29;
  id v20 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  id v6 = [WeakRetained scrollModifierForRoutingModifier:self];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__SBRoutingSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke;
  v11[3] = &unk_1E6AF6380;
  id v14 = &v15;
  id v7 = v6;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __102__SBRoutingSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__SBRoutingSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  id v12 = &v14;
  int64_t v13 = a3;
  id v7 = v6;
  id v11 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  double v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __68__SBRoutingSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 snapshotScaleForLayoutRole:a1[6] inAppLayout:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v4;
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBRoutingSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke;
  v10[3] = &unk_1E6AFD9B0;
  id v12 = &v14;
  id v7 = v6;
  id v11 = v7;
  double v13 = a4;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v10);
  double v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __72__SBRoutingSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 contentPageViewScaleForAppLayout:*(void *)(a1 + 32) withScale:*(double *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (id)scrollViewAttributes
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__29;
  id v12 = __Block_byref_object_dispose__29;
  id v13 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained scrollModifierForRoutingModifier:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBRoutingSwitcherModifier_scrollViewAttributes__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  void v7[4] = self;
  void v7[5] = &v8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__SBRoutingSwitcherModifier_scrollViewAttributes__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained scrollModifierForRoutingModifier:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 scrollViewAttributes];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SBRoutingSwitcherModifier_minimumTranslationToKillIndex___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__SBRoutingSwitcherModifier_minimumTranslationToKillIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "minimumTranslationToKillIndex:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SBRoutingSwitcherModifier_isFocusEnabledForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __56__SBRoutingSwitcherModifier_isFocusEnabledForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isFocusEnabledForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__29;
  uint64_t v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__SBRoutingSwitcherModifier_neighboringAppLayoutsForFocusedAppLayout___block_invoke;
  v8[3] = &unk_1E6AFD9D8;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __70__SBRoutingSwitcherModifier_neighboringAppLayoutsForFocusedAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 neighboringAppLayoutsForFocusedAppLayout:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = &unk_1D90ED3C6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SBRoutingSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
  v8[3] = &unk_1E6AFDAA0;
  void v8[4] = &v9;
  v8[5] = a4;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v8);
  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

uint64_t __61__SBRoutingSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 contentOffsetForIndex:a3 alignment:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  return result;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  uint64_t v23 = 0;
  long long v24 = (double *)&v23;
  uint64_t v25 = 0x3010000000;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = &unk_1D90ED3C6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v10 = [WeakRetained scrollModifierForRoutingModifier:self];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__SBRoutingSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke;
  v16[3] = &unk_1E6AFA9B0;
  id v18 = &v23;
  id v11 = v10;
  id v17 = v11;
  CGFloat v19 = v7;
  CGFloat v20 = v6;
  CGFloat v21 = x;
  CGFloat v22 = y;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v16);
  double v12 = v24[4];
  double v13 = v24[5];

  _Block_object_dispose(&v23, 8);
  double v14 = v12;
  double v15 = v13;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

uint64_t __67__SBRoutingSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "restingOffsetForScrollOffset:velocity:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  uint64_t v6 = 0;
  CGFloat v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __117__SBRoutingSwitcherModifier_distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch___block_invoke;
  v5[3] = &unk_1E6AFDA28;
  v5[4] = &v6;
  _SBRoutingSwitcherModifierRouteToModifierContainingIndex(self, a3, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __117__SBRoutingSwitcherModifier_distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v12 = a5.y;
  CGFloat v13 = a5.x;
  CGFloat v14 = a4.y;
  CGFloat v15 = a4.x;
  CGFloat v16 = a3.y;
  CGFloat v17 = a3.x;
  uint64_t v39 = 0;
  v40 = (double *)&v39;
  uint64_t v41 = 0x3010000000;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  v42 = &unk_1D90ED3C6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  CGFloat v20 = [WeakRetained scrollModifierForRoutingModifier:self];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __127__SBRoutingSwitcherModifier_adjustedOffsetForOffset_translation_startPoint_locationInView_horizontalVelocity_verticalVelocity___block_invoke;
  _OWORD v26[3] = &unk_1E6AFDC08;
  uint64_t v28 = &v39;
  id v21 = v20;
  id v27 = v21;
  CGFloat v29 = v17;
  CGFloat v30 = v16;
  CGFloat v31 = v15;
  CGFloat v32 = v14;
  CGFloat v33 = v13;
  CGFloat v34 = v12;
  CGFloat v35 = x;
  CGFloat v36 = y;
  long long v37 = a7;
  uint64_t v38 = a8;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v21, v26);
  double v22 = v40[4];
  double v23 = v40[5];

  _Block_object_dispose(&v39, 8);
  double v24 = v22;
  double v25 = v23;
  result.CGFloat y = v25;
  result.CGFloat x = v24;
  return result;
}

uint64_t __127__SBRoutingSwitcherModifier_adjustedOffsetForOffset_translation_startPoint_locationInView_horizontalVelocity_verticalVelocity___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:", *(void *)(a1 + 112), *(void *)(a1 + 120), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (void)resetAdjustedScrollingState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained scrollModifierForRoutingModifier:self];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBRoutingSwitcherModifier_resetAdjustedScrollingState__block_invoke;
  v6[3] = &unk_1E6AF4AC0;
  id v7 = v4;
  id v5 = v4;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v5, v6);
}

uint64_t __56__SBRoutingSwitcherModifier_resetAdjustedScrollingState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetAdjustedScrollingState];
}

- (BOOL)wantsSlideOverTongue
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        CGFloat v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __49__SBRoutingSwitcherModifier_wantsSlideOverTongue__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __49__SBRoutingSwitcherModifier_wantsSlideOverTongue__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsSlideOverTongue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)slideOverTongueState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __49__SBRoutingSwitcherModifier_slideOverTongueState__block_invoke;
        v10[3] = &unk_1E6AF4B88;
        void v10[4] = v7;
        v10[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v10);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v4);
  }

  unint64_t v8 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v8;
}

unint64_t __49__SBRoutingSwitcherModifier_slideOverTongueState__block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t result = [*(id *)(a1 + 32) slideOverTongueState];
  if (v2 <= result) {
    unint64_t v4 = result;
  }
  else {
    unint64_t v4 = v2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (unint64_t)slideOverTongueDirection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __53__SBRoutingSwitcherModifier_slideOverTongueDirection__block_invoke;
        v10[3] = &unk_1E6AF4B88;
        void v10[4] = v7;
        v10[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v10);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v4);
  }

  unint64_t v8 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v8;
}

unint64_t __53__SBRoutingSwitcherModifier_slideOverTongueDirection__block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t result = [*(id *)(a1 + 32) slideOverTongueDirection];
  if (v2 <= result) {
    unint64_t v4 = result;
  }
  else {
    unint64_t v4 = v2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (id)appLayoutToAttachSlideOverTongue
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__29;
  long long v19 = __Block_byref_object_dispose__29;
  id v20 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __61__SBRoutingSwitcherModifier_appLayoutToAttachSlideOverTongue__block_invoke;
        v10[3] = &unk_1E6AF4B88;
        void v10[4] = v7;
        v10[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v10);
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v21 count:16];
    }
    while (v4);
  }

  id v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __61__SBRoutingSwitcherModifier_appLayoutToAttachSlideOverTongue__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) appLayoutToAttachSlideOverTongue];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (BOOL)wantsBezelEffectsLayoutElement
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        long long v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __59__SBRoutingSwitcherModifier_wantsBezelEffectsLayoutElement__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __59__SBRoutingSwitcherModifier_wantsBezelEffectsLayoutElement__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsBezelEffectsLayoutElement];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)foregroundAppLayouts
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  uint64_t v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __49__SBRoutingSwitcherModifier_foregroundAppLayouts__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v4)
        {
          _setByCombiningSets(v6, v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = v8;
        }
        uint64_t v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __49__SBRoutingSwitcherModifier_foregroundAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) foregroundAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (char)jetsamModeForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SBRoutingSwitcherModifier_jetsamModeForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __52__SBRoutingSwitcherModifier_jetsamModeForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 jetsamModeForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (char)activityModeForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SBRoutingSwitcherModifier_activityModeForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __54__SBRoutingSwitcherModifier_activityModeForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 activityModeForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  unint64_t v20 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_modifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __70__SBRoutingSwitcherModifier_bounceIconGenerationCountForCurrentCount___block_invoke;
        v12[3] = &unk_1E6AF6358;
        void v12[4] = v9;
        void v12[5] = &v17;
        void v12[6] = a3;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v9, v12);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }

  unint64_t v10 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v10;
}

unint64_t __70__SBRoutingSwitcherModifier_bounceIconGenerationCountForCurrentCount___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t result = [*(id *)(a1 + 32) bounceIconGenerationCountForCurrentCount:*(void *)(a1 + 48)];
  if (v2 <= result) {
    unint64_t v4 = result;
  }
  else {
    unint64_t v4 = v2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (id)bounceIconBundleIdentifier
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  id v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        long long v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        uint64_t v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __55__SBRoutingSwitcherModifier_bounceIconBundleIdentifier__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v6) {
          id v9 = v6;
        }
        else {
          id v9 = v8;
        }
        if ((v4 & 1) == 0) {
          id v9 = v8;
        }
        id v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __55__SBRoutingSwitcherModifier_bounceIconBundleIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bounceIconBundleIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (CGRect)bounceIconInitialFrame
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v3 = self->_modifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v4)
  {
    uint64_t v9 = *(void *)v25;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v3);
      }
      long long v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
      uint64_t v18 = 0;
      uint64_t v19 = (CGRect *)&v18;
      uint64_t v20 = 0x4010000000;
      long long v21 = &unk_1D90ED3C6;
      long long v22 = 0u;
      long long v23 = 0u;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__SBRoutingSwitcherModifier_bounceIconInitialFrame__block_invoke;
      v17[3] = &unk_1E6AF4B88;
      v17[4] = v11;
      v17[5] = &v18;
      _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v11, v17);
      BOOL IsNull = CGRectIsNull(v19[1]);
      if (!IsNull)
      {
        double x = v19[1].origin.x;
        double y = v19[1].origin.y;
        double width = v19[1].size.width;
        double height = v19[1].size.height;
      }
      _Block_object_dispose(&v18, 8);
      if (!IsNull) {
        break;
      }
      if (v4 == ++v10)
      {
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

uint64_t __51__SBRoutingSwitcherModifier_bounceIconInitialFrame__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) bounceIconInitialFrame];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBRoutingSwitcherModifier_shouldAccessoryDrawShadowForAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __67__SBRoutingSwitcherModifier_shouldAccessoryDrawShadowForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 shouldAccessoryDrawShadowForAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SBRoutingSwitcherModifier_shouldTetherItemsAndAccessoriesInAppLayout___block_invoke;
  v7[3] = &unk_1E6AFD9D8;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v7);
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __72__SBRoutingSwitcherModifier_shouldTetherItemsAndAccessoriesInAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 shouldTetherItemsAndAccessoriesInAppLayout:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x3010000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  double v16 = &unk_1D90ED3C6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBRoutingSwitcherModifier_contentViewOffsetForAccessoriesOfAppLayout___block_invoke;
  v10[3] = &unk_1E6AFD9D8;
  uint64_t v12 = &v13;
  id v5 = v4;
  id v11 = v5;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v5, v10);
  double v6 = v14[4];
  double v7 = v14[5];

  _Block_object_dispose(&v13, 8);
  double v8 = v6;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

uint64_t __72__SBRoutingSwitcherModifier_contentViewOffsetForAccessoriesOfAppLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 contentViewOffsetForAccessoriesOfAppLayout:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x3010000000;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v19 = &unk_1D90ED3C6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__SBRoutingSwitcherModifier_contentViewOffsetForLayoutRole_inAppLayout___block_invoke;
  v12[3] = &unk_1E6AFD9B0;
  double v14 = &v16;
  int64_t v15 = a3;
  id v7 = v6;
  id v13 = v7;
  _SBRoutingSwitcherModifierRouteToModifierContainingAppLayout((id *)&self->super.super.super.isa, v7, v12);
  double v8 = v17[4];
  double v9 = v17[5];

  _Block_object_dispose(&v16, 8);
  double v10 = v8;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

uint64_t __72__SBRoutingSwitcherModifier_contentViewOffsetForLayoutRole_inAppLayout___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 contentViewOffsetForLayoutRole:a1[6] inAppLayout:a1[4]];
  uint64_t v4 = *(void *)(a1[5] + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

- (SBSwitcherContinuousExposeStripTongueAttributes)continuousExposeStripTongueAttributes
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3010000000;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  id v13 = &unk_1D90ED3C6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  uint64_t v4 = [WeakRetained homeScreenModifierForRoutingModifier:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBRoutingSwitcherModifier_continuousExposeStripTongueAttributes__block_invoke;
  v9[3] = &unk_1E6AF4B88;
  void v9[4] = self;
  void v9[5] = &v10;
  _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v4, v9);

  unint64_t v5 = v11[4];
  unint64_t v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  result.direction = v8;
  result.state = v7;
  return result;
}

void __66__SBRoutingSwitcherModifier_continuousExposeStripTongueAttributes__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [WeakRetained homeScreenModifierForRoutingModifier:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 continuousExposeStripTongueAttributes];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v5;
}

- (BOOL)wantsContinuousExposeHoverGesture
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        unint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __62__SBRoutingSwitcherModifier_wantsContinuousExposeHoverGesture__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __62__SBRoutingSwitcherModifier_wantsContinuousExposeHoverGesture__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wantsContinuousExposeHoverGesture];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isContinuousExposeStripVisible
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = self->_modifiers;
  char v3 = 0;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        unint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __59__SBRoutingSwitcherModifier_isContinuousExposeStripVisible__block_invoke;
        v12[3] = &unk_1E6AF4B88;
        void v12[4] = v8;
        void v12[5] = &v13;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v8, v12);
        unsigned int v9 = *((unsigned __int8 *)v14 + 24);
        _Block_object_dispose(&v13, 8);
        if (v5) {
          v3 |= v9 > (v3 & 1u);
        }
        else {
          char v3 = v9 != 0;
        }
        char v5 = 1;
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

uint64_t __59__SBRoutingSwitcherModifier_isContinuousExposeStripVisible__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isContinuousExposeStripVisible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)proposedAppLayoutForWindowDrag
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_modifiers;
  id v2 = 0;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    char v4 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v15 = 0;
        char v16 = &v15;
        uint64_t v17 = 0x3032000000;
        long long v18 = __Block_byref_object_copy__29;
        long long v19 = __Block_byref_object_dispose__29;
        id v20 = 0;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __59__SBRoutingSwitcherModifier_proposedAppLayoutForWindowDrag__block_invoke;
        v14[3] = &unk_1E6AF4B88;
        void v14[4] = v7;
        v14[5] = &v15;
        _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v14);
        id v8 = (id)v16[5];
        _Block_object_dispose(&v15, 8);

        if (v6) {
          unsigned int v9 = v6;
        }
        else {
          unsigned int v9 = v8;
        }
        if ((v4 & 1) == 0) {
          unsigned int v9 = v8;
        }
        id v2 = v9;

        ++v5;
        char v4 = 1;
        uint64_t v6 = v2;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  return v2;
}

void __59__SBRoutingSwitcherModifier_proposedAppLayoutForWindowDrag__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) proposedAppLayoutForWindowDrag];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)_lastIndexForModifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SBRoutingSwitcherModifier;
  id v15 = [(SBRoutingSwitcherModifier *)&v32 appLayoutsGenerationCount];
  if (v15 != self->_lastIndexForModifier_GenCount)
  {
    long long v19 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v31.receiver = self;
    v31.super_class = (Class)SBRoutingSwitcherModifier;
    long long v18 = [(SBRoutingSwitcherModifier *)&v31 appLayouts];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = self->_modifiers;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v28 != v5) {
            objc_enumerationMutation(obj);
          }
          unint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v21 = 0;
          long long v22 = &v21;
          uint64_t v23 = 0x3032000000;
          long long v24 = __Block_byref_object_copy__29;
          long long v25 = __Block_byref_object_dispose__29;
          id v26 = 0;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __51__SBRoutingSwitcherModifier__lastIndexForModifier___block_invoke;
          v20[3] = &unk_1E6AF4B88;
          v20[4] = v7;
          v20[5] = &v21;
          _SBRoutingSwitcherModifierRouteToModifier((id *)&self->super.super.super.isa, v7, v20);
          id v8 = [(id)v22[5] lastObject];
          if (v8) {
            uint64_t v9 = [v18 indexOfObject:v8];
          }
          else {
            uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
          }
          uint64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
          [(NSMapTable *)v19 setObject:v10 forKey:v7];

          _Block_object_dispose(&v21, 8);
        }
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v4);
    }

    lastIndexForModifier_indexCapsForModifiers = self->_lastIndexForModifier_indexCapsForModifiers;
    self->_lastIndexForModifier_indexCapsForModifiers = v19;

    self->_lastIndexForModifier_GenCount = (unint64_t)v15;
  }
  uint64_t v12 = [(NSMapTable *)self->_lastIndexForModifier_indexCapsForModifiers objectForKey:v16];
  unint64_t v13 = [v12 unsignedIntegerValue];

  return v13;
}

void __51__SBRoutingSwitcherModifier__lastIndexForModifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)modifiers
{
  return self->_modifiers;
}

- (SBRoutingSwitcherModifierDelegate)routingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);
  return (SBRoutingSwitcherModifierDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_lastIndexForModifier_indexCapsForModifiers, 0);
  objc_storeStrong((id *)&self->_appLayouts_appLayoutsForModifiers, 0);
  objc_storeStrong((id *)&self->_currentModifier, 0);
}

@end