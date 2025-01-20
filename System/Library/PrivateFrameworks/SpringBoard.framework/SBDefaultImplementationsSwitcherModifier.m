@interface SBDefaultImplementationsSwitcherModifier
- (BOOL)_isLayoutRoleBehindCenterWindow:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3;
- (BOOL)canLayoutRoleParticipateInSwitcherDragAndDrop:(int64_t)a3 appLayout:(id)a4;
- (BOOL)clipsToBoundsAtIndex:(unint64_t)a3;
- (BOOL)isContinuousExposeStripVisible;
- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3;
- (BOOL)isHitTestBlockingViewVisible;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldContentViewBlockTouches;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3;
- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3;
- (BOOL)shouldUpdateAnimatableProperty:(id)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldUseWallpaperGradientTreatment;
- (BOOL)switcherHitTestsAsOpaque;
- (BOOL)systemApertureRequiresHeavyShadowForTransition;
- (BOOL)wantsBezelEffectsLayoutElement;
- (BOOL)wantsContinuousExposeHoverGesture;
- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3;
- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3;
- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (CGPoint)expandedSourcePositionForSystemApertureTransition;
- (CGRect)bounceIconInitialFrame;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (CGRect)rootContentViewMaskRect;
- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)rootContentViewBlurRadius;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3;
- (id)animatablePropertyIdentifiers;
- (id)bounceIconBundleIdentifier;
- (id)focusedAppLayoutForShelf:(id)a3;
- (id)hiddenAppLayoutsInShelf:(id)a3;
- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3;
- (id)identityMeshTransformForIndex:(unint64_t)a3;
- (id)ignoredDisplayItemsForShelf:(id)a3;
- (id)meshTransformForIndex:(unint64_t)a3;
- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4;
- (id)proposedAppLayoutForWindowDrag;
- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3;
- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)settingsForAnimatableProperty:(id)a3;
- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5;
- (id)systemApertureTransitioningAppLayouts;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
- (int64_t)updateModeForAnimatableProperty:(id)a3;
- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3;
- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3;
- (unint64_t)hiddenContainerStatusBarParts;
- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (unint64_t)maskedCornersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withMaskedCorners:(unint64_t)a5;
- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3;
@end

@implementation SBDefaultImplementationsSwitcherModifier

void __95__SBDefaultImplementationsSwitcherModifier_multipleWindowsIndicatorLayoutRoleMaskForAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
  v4 = [v6 bundleIdentifier];
  if (v6
    && [*(id *)(a1 + 40) displayItemSupportsMultipleWindowsIndicator:v6]
    && [*(id *)(a1 + 40) numberOfVisibleAppLayoutsForBundleIdentifier:v4] >= 2)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = SBLayoutRoleMaskForRole(a2) | v5;
  }
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  int v5 = [(SBDefaultImplementationsSwitcherModifier *)self isRTLEnabled];
  id v6 = &SBLayoutRoleSide;
  if (!v5) {
    id v6 = &SBLayoutRolePrimary;
  }
  uint64_t v7 = *v6;
  v8 = [(SBDefaultImplementationsSwitcherModifier *)self appLayoutContainingAppLayout:v4];

  v9 = [v8 leafAppLayoutForRole:v7];

  v10 = +[SBSwitcherResizeGrabberLayoutAttributes attributesWithLeafAppLayout:v9 edge:8];

  return v10;
}

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  return 0;
}

- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3
{
  v3 = [(SBDefaultImplementationsSwitcherModifier *)self medusaSettings];
  [v3 switcherShelfIconHitTestInset];
  double v5 = v4;

  return v5;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  return (id)objc_msgSend(a4, "firstObject", a3);
}

- (BOOL)systemApertureRequiresHeavyShadowForTransition
{
  return 0;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 0;
}

- (CGRect)rootContentViewMaskRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)rootContentViewBlurRadius
{
  return 0.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (![(SBDefaultImplementationsSwitcherModifier *)self _isLayoutRoleBehindCenterWindow:a3 inAppLayout:a4])return 0.0; {
  double v5 = [(SBDefaultImplementationsSwitcherModifier *)self medusaSettings];
  }
  [v5 defaultDimmingOpacity];
  double v7 = v6;

  return v7;
}

- (BOOL)_isLayoutRoleBehindCenterWindow:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  id v7 = [(SBDefaultImplementationsSwitcherModifier *)self appLayoutContainingAppLayout:v6];
  if (v7 != v6)
  {
    v8 = [v6 allItems];
    uint64_t v9 = [v8 count];

    if (v9 == 1) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = a3;
    }
    v11 = [v6 itemForLayoutRole:v10];
    a3 = [v7 layoutRoleForItem:v11];
  }
  v12 = [v7 itemForLayoutRole:4];

  BOOL IsValidForSplitView = SBLayoutRoleIsValidForSplitView(a3);
  if (v12) {
    BOOL v14 = !IsValidForSplitView;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = !v14 && [v6 environment] == 1;

  return v15;
}

- (unint64_t)hiddenContainerStatusBarParts
{
  return 0;
}

- (id)animatablePropertyIdentifiers
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)isHitTestBlockingViewVisible
{
  return 0;
}

- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3
{
  return a3;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = objc_msgSend(v3, "zOrderedItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [v3 layoutRoleForItem:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v10 != 4)
        {
          v11 = [NSNumber numberWithInteger:v10];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v12 = [v3 itemForLayoutRole:4];

  if (v12)
  {
    v13 = [NSNumber numberWithInteger:4];
    [v4 insertObject:v13 atIndex:0];
  }
  return v4;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  [(SBDefaultImplementationsSwitcherModifier *)self screenScale];
  if ([v11 environment] != 3 && objc_msgSend(v11, "environment") != 2)
  {
    if ([(SBDefaultImplementationsSwitcherModifier *)self isChamoisWindowingUIEnabled])
    {
      if (a3 == 4)
      {
        v12 = [(SBDefaultImplementationsSwitcherModifier *)self displayItemLayoutAttributesCalculator];
        uint64_t v13 = [(SBDefaultImplementationsSwitcherModifier *)self switcherInterfaceOrientation];
        [(SBDefaultImplementationsSwitcherModifier *)self containerViewBounds];
        objc_msgSend(v12, "frameForCenterItemWithConfiguration:interfaceOrientation:bounds:", 1, v13);

        UIRectGetCenter();
        UIRectCenteredAboutPoint();
        double x = v14;
        double y = v15;
        double width = v16;
        double height = v17;
        goto LABEL_20;
      }
      v30 = [(SBDefaultImplementationsSwitcherModifier *)self chamoisLayoutAttributes];
      int v31 = [v30 isAutoLayoutEnabled];

      long long v18 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v11];
      v32 = [v11 itemForLayoutRole:a3];
      v33 = [v18 autoLayoutItemForDisplayItem:v32];
      [v33 position];
      if (v31)
      {
        if ([v33 isFullyOccluded]) {
          [v33 unoccludedPeekingPosition];
        }
        [v33 size];
        double v35 = v34;
        double v66 = v36;
        SBRectWithSize();
        UIRectCenteredAboutPoint();
        double v38 = v37;
        double v40 = v39;
        double width = v41;
        double height = v42;
        [v18 boundingBox];
        double v44 = v38 - v43;
        [v18 boundingBox];
        double x = x + v44;
        double y = y + v40 - v45;
        v46 = [(SBDefaultImplementationsSwitcherModifier *)self appLayoutContainingAppLayout:v11];
        v47 = [v46 allItems];
        unint64_t v48 = [v47 count];

        if (v48 >= 2)
        {
          v49 = [(SBDefaultImplementationsSwitcherModifier *)self chamoisLayoutAttributes];
          if (([v33 isFullyOccluded] & 1) == 0)
          {
            [v33 anchorPosition];
            if ([v33 isOverlapped]) {
              objc_msgSend(v49, "partiallyOccludedStageScaleForItemWithSize:", v66, v35, 1.0);
            }
            UIRoundToScale();
            double x = x - v50;
            UIRoundToScale();
            double y = y - v51;
          }
        }
      }
      else
      {
        [v33 size];
        SBRectWithSize();
        UIRectCenteredAboutPoint();
        double v53 = v52;
        double v55 = v54;
        double width = v56;
        double height = v57;
        [v18 boundingBox];
        double v59 = v53 - v58;
        [v18 boundingBox];
        double x = x + v59;
        double y = y + v55 - v60;
      }
    }
    else
    {
      long long v18 = [(SBDefaultImplementationsSwitcherModifier *)self displayItemLayoutAttributesCalculator];
      uint64_t v19 = [(SBDefaultImplementationsSwitcherModifier *)self switcherInterfaceOrientation];
      uint64_t v20 = [(SBDefaultImplementationsSwitcherModifier *)self chamoisLayoutAttributes];
      [(SBDefaultImplementationsSwitcherModifier *)self floatingDockHeight];
      double v22 = v21;
      [(SBDefaultImplementationsSwitcherModifier *)self screenScale];
      double v24 = v23;
      uint64_t v25 = [(SBDefaultImplementationsSwitcherModifier *)self prefersStripHidden];
      LOBYTE(v65) = [(SBDefaultImplementationsSwitcherModifier *)self prefersDockHidden];
      objc_msgSend(v18, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", a3, v11, v19, v20, 0, v25, x, y, width, height, v22, v24, v65);
      double x = v26;
      double y = v27;
      double width = v28;
      double height = v29;
    }
  }
LABEL_20:

  double v61 = x;
  double v62 = y;
  double v63 = width;
  double v64 = height;
  result.size.double height = v64;
  result.size.double width = v63;
  result.origin.double y = v62;
  result.origin.double x = v61;
  return result;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  return 0;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)meshTransformForIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3
{
  return 0;
}

- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)clipsToBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if ([v4 environment] == 1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __95__SBDefaultImplementationsSwitcherModifier_multipleWindowsIndicatorLayoutRoleMaskForAppLayout___block_invoke;
    v7[3] = &unk_1E6B047E8;
    id v8 = v4;
    uint64_t v9 = self;
    uint64_t v10 = &v11;
    SBLayoutRoleEnumerateValidRoles(v7);
  }
  unint64_t v5 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v5;
}

- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (BOOL)canLayoutRoleParticipateInSwitcherDragAndDrop:(int64_t)a3 appLayout:(id)a4
{
  return 0;
}

- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (unint64_t)maskedCornersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withMaskedCorners:(unint64_t)a5
{
  id v8 = a4;
  if (a3 != 4)
  {
    if ([(SBDefaultImplementationsSwitcherModifier *)self isChamoisWindowingUIEnabled]) {
      goto LABEL_14;
    }
    if (a3 == 1)
    {
      uint64_t v9 = [v8 itemForLayoutRole:2];

      if (!v9) {
        goto LABEL_14;
      }
      if (![(SBDefaultImplementationsSwitcherModifier *)self isRTLEnabled]) {
        goto LABEL_11;
      }
      char v10 = 0;
    }
    else
    {
      char v10 = [(SBDefaultImplementationsSwitcherModifier *)self isRTLEnabled] ^ 1;
    }
    if (a3 != 2 || (v10 & 1) != 0)
    {
      uint64_t v11 = 5;
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v11 = 10;
LABEL_13:
    a5 |= v11;
    goto LABEL_14;
  }
  a5 = 15;
LABEL_14:

  return a5;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  id v11 = a4;
  if (a3 == 4)
  {
    [(SBDefaultImplementationsSwitcherModifier *)self displayCornerRadius];
    if (BSFloatIsZero())
    {
      v12 = [(SBDefaultImplementationsSwitcherModifier *)self switcherSettings];
      [v12 gridSwitcherHomeButtonDeviceCardCornerRadius];
    }
    SBRectCornerRadiiForRadius();
    double topLeft = v13;
    double v15 = v14;
    double bottomRight = v16;
    double topRight = v17;
  }
  else
  {
    if (([(SBDefaultImplementationsSwitcherModifier *)self isChamoisWindowingUIEnabled] & 1) == 0)
    {
      if (a3 != 1
        || ([v11 itemForLayoutRole:2],
            long long v18 = objc_claimAutoreleasedReturnValue(),
            v18,
            v18))
      {
        int v19 = [(SBDefaultImplementationsSwitcherModifier *)self isRTLEnabled];
        [(SBDefaultImplementationsSwitcherModifier *)self splitViewInnerCornerRadius];
        double v15 = v20;
        if (a3 != 1 || v19 != 0)
        {
          char v22 = a3 == 2 ? v19 : 0;
          if ((v22 & 1) == 0)
          {
            double topLeft = v20;
            goto LABEL_18;
          }
        }
        double topRight = v20;
        double bottomRight = v20;
      }
    }
    double v15 = bottomLeft;
  }
LABEL_18:

  double v23 = topLeft;
  double v24 = v15;
  double v25 = bottomRight;
  double v26 = topRight;
  result.double topRight = v26;
  result.double bottomRight = v25;
  result.double bottomLeft = v24;
  result.double topLeft = v23;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  double v7 = 1.0;
  if ([(SBDefaultImplementationsSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    id v8 = [(SBDefaultImplementationsSwitcherModifier *)self chamoisLayoutAttributes];
    int v9 = [v8 isAutoLayoutEnabled];

    if (v9)
    {
      char v10 = [(SBDefaultImplementationsSwitcherModifier *)self appLayoutContainingAppLayout:v6];
      id v11 = [v6 itemForLayoutRole:a3];
      uint64_t v12 = [v10 layoutRoleForItem:v11];

      double v13 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v6];
      double v14 = [(SBDefaultImplementationsSwitcherModifier *)self chamoisLayoutAttributes];
      double v15 = [v10 itemForLayoutRole:v12];
      double v16 = [v13 autoLayoutItemForDisplayItem:v15];
      if ([v16 isFullyOccluded])
      {
        [v14 stageOcclusionDodgingPeekScale];
      }
      else
      {
        if (![v16 isOverlapped])
        {
LABEL_8:

          goto LABEL_9;
        }
        [v16 size];
        objc_msgSend(v14, "partiallyOccludedStageScaleForItemWithSize:");
      }
      double v7 = v17;
      goto LABEL_8;
    }
  }
LABEL_9:

  return v7;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3, a4);
}

- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3, a4);
}

- (BOOL)wantsBezelEffectsLayoutElement
{
  return 0;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v3 = 0.5;
  double v4 = 0.5;
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  return 1;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  return 0.0;
}

- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v5 = [a4 itemForLayoutRole:a3];
  LOBYTE(self) = [(SBDefaultImplementationsSwitcherModifier *)self displayItemIsClassic:v5];

  return (char)self;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3
{
  return 0;
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  return (SBSwitcherShelfPresentationAttributes *)SBSwitcherShelfPresentationAttributesMake(0, 0, 0, (uint64_t)retstr, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (id)hiddenAppLayoutsInShelf:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

- (id)focusedAppLayoutForShelf:(id)a3
{
  return 0;
}

- (id)ignoredDisplayItemsForShelf:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5
{
  return 0;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  return 1;
}

- (id)settingsForAnimatableProperty:(id)a3
{
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  return v3;
}

- (BOOL)shouldUpdateAnimatableProperty:(id)a3
{
  return 1;
}

- (id)bounceIconBundleIdentifier
{
  return 0;
}

- (CGRect)bounceIconInitialFrame
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  return 0;
}

- (id)systemApertureTransitioningAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (CGPoint)expandedSourcePositionForSystemApertureTransition
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id)identityMeshTransformForIndex:(unint64_t)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  long long v13 = xmmword_1D8FD1170;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0x3FE0000000000000;
  long long v17 = xmmword_1D8FD11A0;
  uint64_t v18 = 0x3FF0000000000000;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  long long v22 = xmmword_1D8FD1170;
  long long v23 = xmmword_1D8FD1170;
  __asm { FMOV            V0.2D, #0.5 }
  long long v24 = _Q0;
  long long v25 = _Q0;
  long long v26 = xmmword_1D8FD1150;
  long long v27 = xmmword_1D8FD1180;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v28 = 0x3FE0000000000000;
  long long v31 = xmmword_1D8FD11A0;
  uint64_t v32 = 0x3FF0000000000000;
  long long v33 = xmmword_1D8FD1140;
  long long v34 = xmmword_1D8FD11B0;
  __asm { FMOV            V0.2D, #1.0 }
  long long v35 = xmmword_1D8FD11A0;
  long long v36 = _Q0;
  long long v37 = _Q0;
  uint64_t v38 = 0;
  long long v39 = xmmword_1D8FD11D0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  long long v42 = xmmword_1D8FD11E0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  long long v45 = xmmword_1D8FD11F0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  long long v48 = xmmword_1D8FD1200;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  int v9 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:9 vertices:v11 faceCount:4 faces:&v39 depthNormalization:*MEMORY[0x1E4F39ED8]];
  return v9;
}

- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldContentViewBlockTouches
{
  return 0;
}

- (BOOL)wantsContinuousExposeHoverGesture
{
  return 0;
}

- (BOOL)isContinuousExposeStripVisible
{
  [(SBDefaultImplementationsSwitcherModifier *)self continuousExposeStripProgress];
  return BSFloatGreaterThanFloat();
}

- (id)proposedAppLayoutForWindowDrag
{
  return 0;
}

@end