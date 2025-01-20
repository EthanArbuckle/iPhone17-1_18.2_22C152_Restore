@interface SBSwitcherModifier
+ (id)contextProtocol;
+ (id)newEventResponse;
+ (id)queryProtocol;
- (BOOL)appLayoutContainsFullScreenDisplayItem:(id)a3;
- (BOOL)isAssistantEffectivelyPresentedForSAETypeToSiri;
- (BOOL)runsInternalVerificationAfterEventDispatch;
- (BOOL)shouldZoomToSystemApertureForEvent:(id)a3 activeLayout:(id)a4;
- (CGRect)frameForContinuousExposePeekingDisplayItem:(id)a3 inAppLayout:(id)a4 bounds:(CGRect)a5 defaultFrameForLayoutRole:(CGRect)a6;
- (CGRect)scaledFrameForIndex:(unint64_t)a3;
- (CGRect)scaledFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (SBSwitcherModifier)init;
- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3 numberOfRows:(unint64_t)a4 padding:(double)a5 layoutDirection:(unint64_t)a6;
- (id)_handleEvent:(id)a3;
- (id)appLayoutsToCacheSnapshotsWithVisibleRange:(_NSRange)a3 numberOfSnapshotsToCache:(unint64_t)a4 biasForward:(BOOL)a5;
- (id)autoLayoutSpaceForAppLayout:(id)a3;
- (id)defaultAppLayoutsToCacheSnapshots;
- (id)displayName;
- (id)handleAnimatablePropertyChangedEvent:(id)a3;
- (id)handleAssistantPresentationChangedEvent:(id)a3;
- (id)handleBlurProgressEvent:(id)a3;
- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3;
- (id)handleContinuousExposeStripEdgeProtectTongueEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleHardwareButtonDropletAnimationEvent:(id)a3;
- (id)handleHideMorphToPIPAppLayoutEvent:(id)a3;
- (id)handleHighlightEvent:(id)a3;
- (id)handleHomeGestureSettingsChangedEvent:(id)a3;
- (id)handleHomeGrabberSettingsChangedEvent:(id)a3;
- (id)handleHoverEvent:(id)a3;
- (id)handleInitialSetupEvent:(id)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)handleMedusaSettingsChangedEvent:(id)a3;
- (id)handlePointerCrossedDisplayBoundaryEvent:(id)a3;
- (id)handlePrepareForSceneUpdateEvent:(id)a3;
- (id)handleReduceMotionChangedEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleRepositionProgressEvent:(id)a3;
- (id)handleResizeProgressEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleShelfFocusedDisplayItemsChangedEvent:(id)a3;
- (id)handleSlideOverEdgeProtectTongueEvent:(id)a3;
- (id)handleSwipeToKillEvent:(id)a3;
- (id)handleSwitcherDropEvent:(id)a3;
- (id)handleSwitcherSettingsChangedEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTapAppLayoutHeaderEvent:(id)a3;
- (id)handleTapOutsideToDismissEvent:(id)a3;
- (id)handleTapSlideOverTongueEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)handleUpdateFocusedAppLayoutEvent:(id)a3;
- (id)handleUpdateWindowingModeEvent:(id)a3;
- (id)stackDescription;
- (id)stackDescriptionWithPrefix:(id)a3;
- (unint64_t)indexOfFirstFloatingAppFromAppLayouts:(id)a3;
- (unint64_t)indexOfFirstMainAppLayoutFromAppLayouts:(id)a3;
- (void)performWithTemporarilyInsertedAppLayout:(id)a3 atIndex:(unint64_t)a4 block:(id)a5;
@end

@implementation SBSwitcherModifier

- (BOOL)runsInternalVerificationAfterEventDispatch
{
  return self->_verifyModifierStackCoherencyCheckAfterHandlingEvent;
}

- (id)_handleEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherModifier;
  id v5 = [(SBChainableModifier *)&v8 _handleEvent:v4];
  switch([v4 type])
  {
    case 0:
      v6 = [(SBSwitcherModifier *)self handleInitialSetupEvent:v4];
      goto LABEL_3;
    case 1:
      v6 = [(SBSwitcherModifier *)self handleTransitionEvent:v4];
      goto LABEL_3;
    case 2:
    case 3:
    case 4:
    case 5:
    case 31:
      v6 = [(SBSwitcherModifier *)self handleGestureEvent:v4];
      goto LABEL_3;
    case 6:
      v6 = [(SBSwitcherModifier *)self handleReduceMotionChangedEvent:v4];
      goto LABEL_3;
    case 7:
      v6 = [(SBSwitcherModifier *)self handleSwitcherSettingsChangedEvent:v4];
      goto LABEL_3;
    case 8:
      v6 = [(SBSwitcherModifier *)self handleHomeGestureSettingsChangedEvent:v4];
      goto LABEL_3;
    case 9:
      v6 = [(SBSwitcherModifier *)self handleMedusaSettingsChangedEvent:v4];
      goto LABEL_3;
    case 10:
      v6 = [(SBSwitcherModifier *)self handleHomeGrabberSettingsChangedEvent:v4];
      goto LABEL_3;
    case 11:
      v6 = [(SBSwitcherModifier *)self handleHighlightEvent:v4];
      goto LABEL_3;
    case 12:
      v6 = [(SBSwitcherModifier *)self handleSwipeToKillEvent:v4];
      goto LABEL_3;
    case 13:
      v6 = [(SBSwitcherModifier *)self handleInsertionEvent:v4];
      goto LABEL_3;
    case 14:
      v6 = [(SBSwitcherModifier *)self handleRemovalEvent:v4];
      goto LABEL_3;
    case 15:
      v6 = [(SBSwitcherModifier *)self handleTimerEvent:v4];
      goto LABEL_3;
    case 16:
      v6 = [(SBSwitcherModifier *)self handleTapOutsideToDismissEvent:v4];
      goto LABEL_3;
    case 17:
      v6 = [(SBSwitcherModifier *)self handleTapAppLayoutEvent:v4];
      goto LABEL_3;
    case 18:
      v6 = [(SBSwitcherModifier *)self handleTapSlideOverTongueEvent:v4];
      goto LABEL_3;
    case 19:
      v6 = [(SBSwitcherModifier *)self handleScrollEvent:v4];
      goto LABEL_3;
    case 20:
      v6 = [(SBSwitcherModifier *)self handleUpdateFocusedAppLayoutEvent:v4];
      goto LABEL_3;
    case 21:
      v6 = [(SBSwitcherModifier *)self handleResizeProgressEvent:v4];
      goto LABEL_3;
    case 22:
      v6 = [(SBSwitcherModifier *)self handleBlurProgressEvent:v4];
      goto LABEL_3;
    case 23:
      v6 = [(SBSwitcherModifier *)self handleRepositionProgressEvent:v4];
      goto LABEL_3;
    case 24:
      v6 = [(SBSwitcherModifier *)self handleSceneReadyEvent:v4];
      goto LABEL_3;
    case 25:
      v6 = [(SBSwitcherModifier *)self handleSwitcherDropEvent:v4];
      goto LABEL_3;
    case 26:
      v6 = [(SBSwitcherModifier *)self handleSlideOverEdgeProtectTongueEvent:v4];
      goto LABEL_3;
    case 27:
      v6 = [(SBSwitcherModifier *)self handleHideMorphToPIPAppLayoutEvent:v4];
      goto LABEL_3;
    case 28:
      v6 = [(SBSwitcherModifier *)self handleAnimatablePropertyChangedEvent:v4];
      goto LABEL_3;
    case 29:
      v6 = [(SBSwitcherModifier *)self handleShelfFocusedDisplayItemsChangedEvent:v4];
      goto LABEL_3;
    case 30:
      v6 = [(SBSwitcherModifier *)self handlePrepareForSceneUpdateEvent:v4];
      goto LABEL_3;
    case 32:
      v6 = [(SBSwitcherModifier *)self handleHoverEvent:v4];
      goto LABEL_3;
    case 33:
      v6 = [(SBSwitcherModifier *)self handleUpdateWindowingModeEvent:v4];
      goto LABEL_3;
    case 34:
      v6 = [(SBSwitcherModifier *)self handleContinuousExposeIdentifiersChangedEvent:v4];
      goto LABEL_3;
    case 35:
      v6 = [(SBSwitcherModifier *)self handleContinuousExposeStripEdgeProtectTongueEvent:v4];
      goto LABEL_3;
    case 36:
      v6 = [(SBSwitcherModifier *)self handleTapAppLayoutHeaderEvent:v4];
      goto LABEL_3;
    case 37:
      v6 = [(SBSwitcherModifier *)self handlePointerCrossedDisplayBoundaryEvent:v4];
      goto LABEL_3;
    case 38:
      v6 = [(SBSwitcherModifier *)self handleAssistantPresentationChangedEvent:v4];
      goto LABEL_3;
    case 39:
      v6 = [(SBSwitcherModifier *)self handleHardwareButtonDropletAnimationEvent:v4];
LABEL_3:
      self = v6;
      break;
    default:
      break;
  }

  return self;
}

- (id)handleTransitionEvent:(id)a3
{
  return 0;
}

- (id)handleTimerEvent:(id)a3
{
  return 0;
}

- (id)handleSceneReadyEvent:(id)a3
{
  return 0;
}

- (id)defaultAppLayoutsToCacheSnapshots
{
  if ([(SBSwitcherModifier *)self isDevicePad])
  {
    v3 = [(SBSwitcherModifier *)self switcherSettings];
    NSUInteger v4 = [v3 numberOfSnapshotsToAlwaysKeepAround];

    id v5 = [(SBSwitcherModifier *)self appLayouts];
    v11.length = [v5 count];
    v10.location = 0;
    v10.length = v4;
    v11.location = 0;
    NSRange v6 = NSIntersectionRange(v10, v11);
    v7 = objc_msgSend(v5, "subarrayWithRange:", v6.location, v6.length);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (SBSwitcherModifier)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherModifier;
  v2 = [(SBChainableModifier *)&v5 init];
  if (v2)
  {
    v3 = +[SBPlatformController sharedInstance];
    v2->_verifyModifierStackCoherencyCheckAfterHandlingEvent = [v3 isInternalInstall];
  }
  return v2;
}

- (BOOL)isAssistantEffectivelyPresentedForSAETypeToSiri
{
  int v3 = [(SBSwitcherModifier *)self isSystemAssistantExperienceEnabled];
  BOOL v4 = [(SBSwitcherModifier *)self assistantPresentationState] != 2
    && [(SBSwitcherModifier *)self assistantPresentationState] != 3;
  uint64_t v5 = [(SBSwitcherModifier *)self assistantModality];
  char v6 = [(SBSwitcherModifier *)self isAssistantKeyboardVisible];
  if (v5 == 2) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (v4) {
    BOOL v7 = 0;
  }
  return v3 && v7;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3 numberOfRows:(unint64_t)a4 padding:(double)a5 layoutDirection:(unint64_t)a6
{
  NSRange v11 = [(SBSwitcherModifier *)self appLayouts];
  unint64_t v12 = [v11 count];
  v13 = [(SBSwitcherModifier *)self visibleAppLayouts];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v12) {
      a3 = v12 - 1;
    }
    else {
      a3 = 0;
    }
  }
  else
  {
    v14 = [v11 objectAtIndex:a3];
    char v15 = [v13 containsObject:v14];

    unint64_t v16 = v12 - 1;
    if (!v12) {
      unint64_t v16 = 0;
    }
    if ((v15 & 1) == 0) {
      a3 = v16;
    }
  }
  int64_t v17 = a3 % a4;
  if (a6) {
    unint64_t v18 = a4;
  }
  else {
    unint64_t v18 = -(uint64_t)a4;
  }
  double v19 = 0.0;
  if ((uint64_t)a3 >= v17 && a3 < v12)
  {
    v21 = [v11 objectAtIndex:a3];
    int v22 = [v13 containsObject:v21];

    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (v22)
    {
      do
      {
        unint64_t v23 = a3;
        a3 += v18;
        if ((uint64_t)a3 < v17 || a3 >= v12) {
          break;
        }
        v25 = [v11 objectAtIndex:a3];
        char v26 = [v13 containsObject:v25];
      }
      while ((v26 & 1) != 0);
    }
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(SBSwitcherModifier *)self frameForIndex:v23];
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      [(SBSwitcherModifier *)self scaleForIndex:v23];
      CGFloat v36 = v35;
      UIRectGetCenter();
      CGAffineTransformMakeScale(&v48, v36, v36);
      v49.origin.x = v28;
      v49.origin.y = v30;
      v49.size.width = v32;
      v49.size.height = v34;
      CGRectApplyAffineTransform(v49, &v48);
      SBUnintegralizedRectCenteredAboutPoint();
      double v38 = v37;
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      if ([(SBSwitcherModifier *)self isRTLEnabled])
      {
        [(SBSwitcherModifier *)self switcherViewBounds];
        double MaxX = v45 - v38;
      }
      else
      {
        v50.origin.x = v38;
        v50.origin.y = v40;
        v50.size.width = v42;
        v50.size.height = v44;
        double MaxX = CGRectGetMaxX(v50);
      }
      double v19 = MaxX + a5;
    }
  }

  return v19;
}

- (CGRect)scaledFrameForIndex:(unint64_t)a3
{
  -[SBSwitcherModifier frameForIndex:](self, "frameForIndex:");
  [(SBSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)scaledFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(SBSwitcherModifier *)self frameForIndex:a5];
    [(SBSwitcherModifier *)self scaleForIndex:a5];
    double v14 = v13;
    SBTransformedRectWithScale();
    double v10 = v15;
    double v9 = v16;
    double v11 = v17;
    double v12 = v18;
    int v19 = [(SBSwitcherModifier *)self isRTLEnabled];
    if (a3 == 1 && v19 == 0)
    {
      char v21 = 1;
    }
    else if (a3 == 2)
    {
      char v21 = v19;
    }
    else
    {
      char v21 = 0;
    }
    if ([v8 isSplitConfiguration])
    {
      int v22 = (id *)MEMORY[0x1E4F43630];
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = 1;
      }
      uint64_t v24 = [*v22 userInterfaceLayoutDirection];
      [(SBSwitcherModifier *)self containerViewBounds];
      -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", v23, v8);
      SBTransformedRectWithScale();
      double v11 = v26;
      if (v21)
      {
        double v12 = v25;
      }
      else
      {
        if (v24 == 1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = 2;
        }
        [(SBSwitcherModifier *)self containerViewBounds];
        -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", v27, v8);
        SBTransformedRectWithScale();
        double v29 = v28;
        double v12 = v30;
        [(SBSwitcherModifier *)self separatorViewWidth];
        double v10 = v10 + v11 + v31 * v14;
        double v11 = v29;
      }
    }
  }

  double v32 = v10;
  double v33 = v9;
  double v34 = v11;
  double v35 = v12;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (id)appLayoutsToCacheSnapshotsWithVisibleRange:(_NSRange)a3 numberOfSnapshotsToCache:(unint64_t)a4 biasForward:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if ([(SBSwitcherModifier *)self isChamoisWindowingUIEnabled]
    && ([(SBSwitcherModifier *)self chamoisLayoutAttributes],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isAdditiveModelEnabled],
        v10,
        (v11 & 1) != 0))
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v13 = [(SBSwitcherModifier *)self appLayouts];
    NSUInteger v14 = [v13 count];
    unint64_t v15 = a4 - length;
    if (a4 < length) {
      unint64_t v15 = 0;
    }
    double v16 = (double)v15 * 0.5;
    double v17 = ceil(v16);
    double v18 = floor(v16);
    if (!v5) {
      double v18 = v17;
    }
    NSUInteger v19 = (unint64_t)v18;
    BOOL v20 = v15 >= (unint64_t)v18;
    NSUInteger v21 = v15 - (unint64_t)v18;
    if (v20) {
      v22.NSUInteger length = v21;
    }
    else {
      v22.NSUInteger length = 0;
    }
    v22.NSUInteger location = location + length;
    v67.NSUInteger location = 0;
    v67.NSUInteger length = v14;
    NSRange v23 = NSIntersectionRange(v22, v67);
    if (location >= v19) {
      v24.NSUInteger location = location - v19;
    }
    else {
      v24.NSUInteger location = 0;
    }
    v24.NSUInteger length = v19;
    v68.NSUInteger location = 0;
    v68.NSUInteger length = v14;
    NSRange v25 = NSIntersectionRange(v24, v68);
    NSUInteger v26 = v23.location + v23.length;
    if (v23.location + v23.length <= location + length) {
      NSUInteger v26 = location + length;
    }
    NSUInteger v59 = v26;
    BOOL v20 = v14 >= v26;
    NSUInteger v27 = v14 - v26;
    if (!v20) {
      NSUInteger v27 = 0;
    }
    NSUInteger v58 = v27;
    if (v25.location >= location) {
      NSUInteger v28 = location;
    }
    else {
      NSUInteger v28 = v25.location;
    }
    NSUInteger v57 = v28;
    double v29 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSet", v25.length);
    double v30 = objc_msgSend(v13, "subarrayWithRange:", location, length);
    double v31 = v30;
    if (v5)
    {
      [v29 addObjectsFromArray:v30];

      double v32 = objc_msgSend(v13, "subarrayWithRange:", v23.location, v23.length);
      [v29 addObjectsFromArray:v32];

      double v33 = objc_msgSend(v13, "subarrayWithRange:", v25.location, v56);
      double v34 = [v33 reverseObjectEnumerator];
      double v35 = [v34 allObjects];
      [v29 addObjectsFromArray:v35];

      CGFloat v36 = objc_msgSend(v13, "subarrayWithRange:", v59, v58);
      [v29 addObjectsFromArray:v36];

      double v37 = objc_msgSend(v13, "subarrayWithRange:", 0, v57);
      double v38 = [v37 reverseObjectEnumerator];
      double v39 = [v38 allObjects];
      [v29 addObjectsFromArray:v39];
    }
    else
    {
      CGFloat v40 = [v30 reverseObjectEnumerator];
      double v41 = [v40 allObjects];
      [v29 addObjectsFromArray:v41];

      CGFloat v42 = objc_msgSend(v13, "subarrayWithRange:", v25.location, v56);
      double v43 = [v42 reverseObjectEnumerator];
      CGFloat v44 = [v43 allObjects];
      [v29 addObjectsFromArray:v44];

      double v45 = objc_msgSend(v13, "subarrayWithRange:", v23.location, v23.length);
      [v29 addObjectsFromArray:v45];

      v46 = objc_msgSend(v13, "subarrayWithRange:", 0, v57);
      v47 = [v46 reverseObjectEnumerator];
      CGAffineTransform v48 = [v47 allObjects];
      [v29 addObjectsFromArray:v48];

      double v37 = objc_msgSend(v13, "subarrayWithRange:", v59, v58);
      [v29 addObjectsFromArray:v37];
    }

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v49 = v29;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v61;
LABEL_26:
      uint64_t v53 = 0;
      while (1)
      {
        if (*(void *)v61 != v52) {
          objc_enumerationMutation(v49);
        }
        v54 = *(void **)(*((void *)&v60 + 1) + 8 * v53);
        if ([v12 count] >= a4) {
          break;
        }
        if (![v54 type]) {
          [v12 addObject:v54];
        }
        if (v51 == ++v53)
        {
          uint64_t v51 = [v49 countByEnumeratingWithState:&v60 objects:v64 count:16];
          if (v51) {
            goto LABEL_26;
          }
          break;
        }
      }
    }
  }
  return v12;
}

- (unint64_t)indexOfFirstMainAppLayoutFromAppLayouts:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__SBSwitcherModifier_SharedModifierUtilities__indexOfFirstMainAppLayoutFromAppLayouts___block_invoke;
  v6[3] = &unk_1E6AFB450;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __87__SBSwitcherModifier_SharedModifierUtilities__indexOfFirstMainAppLayoutFromAppLayouts___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 environment];
  if (result == 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)indexOfFirstFloatingAppFromAppLayouts:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__SBSwitcherModifier_SharedModifierUtilities__indexOfFirstFloatingAppFromAppLayouts___block_invoke;
  v6[3] = &unk_1E6AFB450;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __85__SBSwitcherModifier_SharedModifierUtilities__indexOfFirstFloatingAppFromAppLayouts___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 environment];
  if (result == 2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  else {
    *a4 = 1;
  }
  return result;
}

- (void)performWithTemporarilyInsertedAppLayout:(id)a3 atIndex:(unint64_t)a4 block:(id)a5
{
  id v14 = a3;
  id v9 = a5;
  if (!v14)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSwitcherModifierUtilities.m", 216, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
  }
  uint64_t v10 = [(SBSwitcherModifier *)self appLayouts];
  char v11 = (void *)[v10 mutableCopy];

  [v11 insertObject:v14 atIndex:a4];
  id v12 = [[SBOverrideAppLayoutsSwitcherModifier alloc] initWithAppLayouts:v11];
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v12 usingBlock:v9];
}

- (id)autoLayoutSpaceForAppLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBSwitcherModifier *)self displayItemLayoutAttributesCalculator];
  double v6 = [(SBSwitcherModifier *)self appLayoutContainingAppLayout:v4];

  uint64_t v7 = [(SBSwitcherModifier *)self switcherInterfaceOrientation];
  id v8 = [(SBSwitcherModifier *)self chamoisLayoutAttributes];
  [(SBSwitcherModifier *)self floatingDockHeight];
  double v10 = v9;
  [(SBSwitcherModifier *)self screenScale];
  double v12 = v11;
  [(SBSwitcherModifier *)self containerViewBounds];
  double v17 = objc_msgSend(v5, "autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:", v6, v7, v8, -[SBSwitcherModifier prefersStripHidden](self, "prefersStripHidden"), -[SBSwitcherModifier prefersDockHidden](self, "prefersDockHidden"), v10, v12, v13, v14, v15, v16);

  return v17;
}

- (BOOL)appLayoutContainsFullScreenDisplayItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 allItems];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    uint64_t v7 = [(SBSwitcherModifier *)self appLayouts];
    uint64_t v8 = [v7 indexOfObject:v4];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(SBSwitcherModifier *)self containerViewBounds];
    }
    else
    {
      uint64_t v10 = v8;
      [(SBSwitcherModifier *)self frameForIndex:v8];
      [(SBSwitcherModifier *)self scaleForIndex:v10];
    }
    SBRectWithSize();
    -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", 1, v4);
    [(SBSwitcherModifier *)self scaleForLayoutRole:1 inAppLayout:v4];
    [(SBSwitcherModifier *)self containerViewBounds];
    char v9 = BSSizeEqualToSize();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (CGRect)frameForContinuousExposePeekingDisplayItem:(id)a3 inAppLayout:(id)a4 bounds:(CGRect)a5 defaultFrameForLayoutRole:(CGRect)a6
{
  CGFloat height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  id v10 = a3;
  id v11 = a4;
  [(SBSwitcherModifier *)self containerViewBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  BOOL v20 = [v11 itemForLayoutRole:2];

  if (v20)
  {
    CGFloat v21 = height;
  }
  else
  {
    uint64_t v22 = +[SBDisplayItem displayItemWithType:0 bundleIdentifier:@"com.apple.springboard.PeekPlacholderItem" uniqueIdentifier:@"com.apple.springboard.PeekPlacholderItem.1"];
    NSRange v23 = objc_alloc_init(SBDisplayItemLayoutAttributes);
    long long v63 = (void *)v22;
    NSRange v24 = [v11 appLayoutByInsertingItem:v22 withLayoutAttributes:v23 inLayoutRole:2];

    NSRange v25 = [(SBSwitcherModifier *)self displayItemLayoutAttributesCalculator];
    uint64_t v26 = [v24 layoutRoleForItem:v10];
    uint64_t v27 = [(SBSwitcherModifier *)self switcherInterfaceOrientation];
    NSUInteger v28 = [(SBSwitcherModifier *)self chamoisLayoutAttributes];
    [(SBSwitcherModifier *)self floatingDockHeight];
    double v29 = v15;
    double v31 = v30;
    [(SBSwitcherModifier *)self screenScale];
    double v33 = v32;
    uint64_t v34 = [(SBSwitcherModifier *)self isChamoisWindowingUIEnabled];
    uint64_t v35 = [(SBSwitcherModifier *)self prefersStripHidden];
    LOBYTE(v62) = [(SBSwitcherModifier *)self prefersDockHidden];
    objc_msgSend(v25, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v26, v24, v27, v28, v34, v35, v13, v29, v17, v19, v31, v33, v62);
    double width = v36;
    CGFloat v21 = v37;

    if (SBRectEqualsRect())
    {
      UIRectCenteredYInRect();
      CGFloat y = v38;
      double width = v39;
      CGFloat v21 = v40;
    }
  }
  double v41 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v11];
  CGFloat v42 = [v11 zOrderedItems];
  double v43 = [v42 firstObject];

  CGFloat v44 = [v41 autoLayoutItemForDisplayItem:v43];
  [v44 position];
  double v46 = v45;
  v47 = [v41 configuration];
  [v47 containerBounds];
  UIRectGetCenter();
  double v49 = v48;

  int v50 = [v43 isEqual:v10];
  if (v46 >= v49) {
    int v51 = v50 ^ 1;
  }
  else {
    int v51 = v50;
  }
  uint64_t v52 = [(SBSwitcherModifier *)self chamoisLayoutAttributes];
  [v52 screenEdgePadding];
  double v54 = v53 + v53;

  [v41 boundingBox];
  double v56 = v13 + v17 - v54;
  if (v51) {
    double v56 = v13 - width + v54;
  }
  double v57 = v56 - v55;

  double v58 = v57;
  double v59 = y;
  double v60 = width;
  double v61 = v21;
  result.size.CGFloat height = v61;
  result.size.double width = v60;
  result.origin.CGFloat y = v59;
  result.origin.x = v58;
  return result;
}

- (BOOL)shouldZoomToSystemApertureForEvent:(id)a3 activeLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(SBSwitcherModifier *)self isReduceMotionEnabled] & 1) != 0
    || ![(SBSwitcherModifier *)self isJindoEnabled])
  {
    char v10 = 0;
  }
  else
  {
    uint64_t v8 = [v6 fromEnvironmentMode];
    uint64_t v9 = [v6 toEnvironmentMode];
    char v10 = 0;
    if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2 && v9 == 1)
    {
      id v11 = [v7 itemForLayoutRole:1];
      BOOL v12 = [(SBSwitcherModifier *)self switcherInterfaceOrientation] == 1;
      double v13 = [v11 uniqueIdentifier];
      double v14 = [v11 bundleIdentifier];
      char v10 = [(SBSwitcherModifier *)self isSystemApertureTransitionTargetForSceneIdentifier:v13 bundleIdentifier:v14 isPortrait:v12];
    }
  }

  return v10;
}

+ (id)contextProtocol
{
  return &unk_1F33603A0;
}

+ (id)queryProtocol
{
  return &unk_1F335F110;
}

+ (id)newEventResponse
{
  return objc_alloc_init(SBSwitcherModifierEventResponse);
}

- (id)stackDescription
{
  return [(SBSwitcherModifier *)self stackDescriptionWithPrefix:&stru_1F3084718];
}

- (id)stackDescriptionWithPrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  id v6 = NSString;
  id v7 = [(SBSwitcherModifier *)self displayName];
  uint64_t v8 = [v6 stringWithFormat:@"%@%@", v4, v7];
  [v5 addObject:v8];

  uint64_t v9 = [v4 stringByAppendingString:@"    "];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__SBSwitcherModifier_stackDescriptionWithPrefix___block_invoke;
  v14[3] = &unk_1E6B0AD98;
  id v15 = v5;
  id v16 = v9;
  id v10 = v9;
  id v11 = v5;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v14];
  BOOL v12 = [v11 componentsJoinedByString:@"\n"];

  return v12;
}

void __49__SBSwitcherModifier_stackDescriptionWithPrefix___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 stackDescriptionWithPrefix:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

- (id)displayName
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  uint64_t v4 = [v3 length];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [&unk_1F3348570 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(&unk_1F3348570);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v3 hasPrefix:v9])
        {
          uint64_t v10 = [v9 length];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [&unk_1F3348570 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [&unk_1F3348588 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(&unk_1F3348588);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        if ([v3 hasSuffix:v15])
        {
          uint64_t v16 = [v3 length];
          uint64_t v4 = v16 - [v15 length];
          goto LABEL_21;
        }
      }
      uint64_t v12 = [&unk_1F3348588 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_21:
  double v17 = objc_msgSend(v3, "substringWithRange:", v10, v4 - v10);

  return v17;
}

- (id)handleInitialSetupEvent:(id)a3
{
  return 0;
}

- (id)handleGestureEvent:(id)a3
{
  return 0;
}

- (id)handleReduceMotionChangedEvent:(id)a3
{
  return 0;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  return 0;
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  return 0;
}

- (id)handleMedusaSettingsChangedEvent:(id)a3
{
  return 0;
}

- (id)handleHomeGrabberSettingsChangedEvent:(id)a3
{
  return 0;
}

- (id)handleSwipeToKillEvent:(id)a3
{
  return 0;
}

- (id)handleHighlightEvent:(id)a3
{
  return 0;
}

- (id)handleInsertionEvent:(id)a3
{
  return 0;
}

- (id)handleRemovalEvent:(id)a3
{
  return 0;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  return 0;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  return 0;
}

- (id)handleTapSlideOverTongueEvent:(id)a3
{
  return 0;
}

- (id)handleScrollEvent:(id)a3
{
  return 0;
}

- (id)handleUpdateFocusedAppLayoutEvent:(id)a3
{
  return 0;
}

- (id)handleResizeProgressEvent:(id)a3
{
  return 0;
}

- (id)handleBlurProgressEvent:(id)a3
{
  return 0;
}

- (id)handleRepositionProgressEvent:(id)a3
{
  return 0;
}

- (id)handleSwitcherDropEvent:(id)a3
{
  return 0;
}

- (id)handleSlideOverEdgeProtectTongueEvent:(id)a3
{
  return 0;
}

- (id)handleHideMorphToPIPAppLayoutEvent:(id)a3
{
  return 0;
}

- (id)handleAnimatablePropertyChangedEvent:(id)a3
{
  return 0;
}

- (id)handleShelfFocusedDisplayItemsChangedEvent:(id)a3
{
  return 0;
}

- (id)handlePrepareForSceneUpdateEvent:(id)a3
{
  return 0;
}

- (id)handleHoverEvent:(id)a3
{
  return 0;
}

- (id)handleUpdateWindowingModeEvent:(id)a3
{
  return 0;
}

- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3
{
  return 0;
}

- (id)handleContinuousExposeStripEdgeProtectTongueEvent:(id)a3
{
  return 0;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  return 0;
}

- (id)handlePointerCrossedDisplayBoundaryEvent:(id)a3
{
  return 0;
}

- (id)handleAssistantPresentationChangedEvent:(id)a3
{
  return 0;
}

- (id)handleHardwareButtonDropletAnimationEvent:(id)a3
{
  return 0;
}

@end