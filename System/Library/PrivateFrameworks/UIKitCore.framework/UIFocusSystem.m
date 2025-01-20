@interface UIFocusSystem
+ (BOOL)environment:(id)environment containsEnvironment:(id)otherEnvironment;
+ (NSArray)_allFocusSystems;
+ (UIFocusSystem)focusSystemForEnvironment:(id)environment;
+ (id)_focusSystemForEnvironment:(id)a3;
+ (void)registerURL:(NSURL *)soundFileURL forSoundIdentifier:(UIFocusSoundIdentifier)identifier;
- (BOOL)_debug_isEnvironmentEligibleForFocusUpdate:(id)a3 debugReport:(id)a4;
- (BOOL)_focusSystemIsValid;
- (BOOL)_focusedItemIsContainedInEnvironment:(id)a3 includeSelf:(BOOL)a4;
- (BOOL)_handleFailedFocusMovementRequest:(id)a3 withPerformer:(id)a4;
- (BOOL)_hasValidItemForCurrentDeferralState;
- (BOOL)_isEnabled;
- (BOOL)_isEnvironmentEligibleForFocusUpdate:(id)a3 fallbackToEnvironment:(id *)a4 debugReport:(id)a5;
- (BOOL)_isEnvironmentLocked:(id)a3;
- (BOOL)_isScrollingScrollableContainer:(id)a3 targetContentOffset:(CGPoint *)a4;
- (BOOL)_performDeferredFocusUpdateIfAvailable;
- (BOOL)_performFocusMovement:(id)a3;
- (BOOL)_postsFocusUpdateNotifications;
- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3;
- (BOOL)_prefersFocusContainment;
- (BOOL)_requiresFocusedItemToBeInHierarchy;
- (BOOL)_safari_moveFocusToNextGroup;
- (BOOL)_safari_moveFocusToPreviousGroup;
- (BOOL)_shouldRestoreFocusInContext:(id)a3;
- (BOOL)_shouldReverseLayoutDirectionForEnvironment:(id)a3;
- (BOOL)_shouldReverseLinearWrappingForEnvironment:(id)a3;
- (BOOL)_uiktest_updateFocusToItem:(id)a3;
- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3;
- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3 startDeferringOnLostFocus:(BOOL)a4 suppressLostFocusUpdate:(BOOL)a5;
- (BOOL)_updateFocusImmediatelyWithContext:(id)a3;
- (BOOL)_updateFocusWithContext:(id)a3 report:(id)a4;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)waitingForFocusMovementAction;
- (CGRect)_clippingRectInCoordinateSpace:(id)a3;
- (NSArray)preferredFocusEnvironments;
- (NSNumber)_overrideFocusDeferralBehavior;
- (NSString)description;
- (UIFocusEnvironment)_deepestPreferredFocusEnvironment;
- (UIFocusEnvironment)_disappearingFocusEnvironment;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItem)_focusedItemOrDeferralTarget;
- (UIFocusItem)_previousFocusedItem;
- (UIFocusItemContainer)focusItemContainer;
- (UIFocusMovementAction)pendingFocusMovementAction;
- (UIFocusSystem)_hostFocusSystem;
- (UIFocusSystem)_preferredFirstResponderFocusSystem;
- (UIFocusSystem)init;
- (UIFocusSystem)initWithFocusBehavior:(id)a3;
- (UIFocusSystem)initWithFocusBehavior:(id)a3 enabled:(BOOL)a4;
- (UIResponder)_preferredFirstResponder;
- (UIView)_focusedView;
- (_UIFocusBehavior)behavior;
- (_UIFocusCastingController)_focusCastingController;
- (_UIFocusEnvironmentPreferenceCache)_deepestPreferredFocusableItemCacheForCurrentUpdate;
- (_UIFocusGroupHistory)_focusGroupHistory;
- (_UIFocusLinearMovementCache)_focusMovementCache;
- (_UIFocusMovementPerformer)_movementPerformer;
- (_UIFocusRegionContainer)_focusMapContainer;
- (_UIFocusSystemDelegate)delegate;
- (_UIFocusTreeLock)treeLock;
- (_UIFocusUpdateThrottle)updateThrottle;
- (id)_configureFocusDeferralIfNecessaryForContext:(id)a3 report:(id)a4;
- (id)_contextForUpdateToEnvironment:(id)a3;
- (id)_contextForUpdateToEnvironment:(id)a3 allowsOverridingPreferedFocusEnvironments:(BOOL)a4 allowsDeferral:(BOOL)a5;
- (id)_focusItemForValidation;
- (id)_focusedWindow;
- (id)_preferredFirstResponderFocusSystemForFocusedItem:(id)a3;
- (id)_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:(id)a3;
- (id)_topEnvironment;
- (id)_validatedAppearingFocusEnvironmentRequest;
- (id)_validatedPendingFocusUpdateRequest;
- (id)focusedItem;
- (int64_t)_effectiveFocusDeferralBehavior;
- (void)_buildFocusItemAncestorCacheIfNecessary;
- (void)_cancelPendingFocusRestoration;
- (void)_clearDeferredFocusUpdateTarget;
- (void)_clearFocusItemAncestorCache;
- (void)_didFinishUpdatingFocusInContext:(id)a3;
- (void)_dropFocusAndStartDeferring:(BOOL)a3 suppressUpdate:(BOOL)a4;
- (void)_enableWithoutFocusRestoration;
- (void)_focusBehaviorDidChange;
- (void)_focusEnvironmentDidAppear:(id)a3;
- (void)_focusEnvironmentDidBecomeVisible:(id)a3;
- (void)_focusEnvironmentWillBecomeInvisible:(id)a3;
- (void)_focusEnvironmentWillDisappear:(id)a3;
- (void)_focusEnvironmentWillDisappear:(id)a3 remainingInHierarchy:(BOOL)a4;
- (void)_handleFocusMovementAction:(id)a3;
- (void)_lockEnvironment:(id)a3;
- (void)_notifyEnvironment:(id)a3 didUpdateFocusInContext:(id)a4;
- (void)_performWithoutFocusUpdates:(id)a3;
- (void)_prepareForTeardown;
- (void)_reevaluateLockedEnvironments;
- (void)_requestFocusUpdate:(id)a3;
- (void)_resetFocusDeferral;
- (void)_sendDidUpdateFocusNotificationsInContext:(id)a3;
- (void)_sendNotificationsForFocusUpdateInContext:(id)a3 usingBlock:(id)a4;
- (void)_sendWillUpdateFocusNotificationsInContext:(id)a3;
- (void)_setDeferredFocusUpdateTarget:(id)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setFocusCastingController:(id)a3;
- (void)_setFocusMovementCache:(id)a3;
- (void)_setNeedsFocusRestoration;
- (void)_setOverrideFocusDeferralBehavior:(id)a3;
- (void)_startDeferringFocusIfSupported;
- (void)_tickHasSeenFocusedItemTimer:(BOOL)a3;
- (void)_uiktest_disableFocusDeferral;
- (void)_uiktest_disableThrottle;
- (void)_uiktest_setPreviousFocusedItem:(id)a3;
- (void)_unlockEnvironment:(id)a3;
- (void)_updateFocusUpdateThrottle;
- (void)_updateWantsTreeLocking;
- (void)invalidateFocusItemContainer:(id)a3;
- (void)requestFocusUpdateToEnvironment:(id)environment;
- (void)setBehavior:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsFocusUpdate;
- (void)setPendingFocusMovementAction:(id)a3;
- (void)setWaitingForFocusMovementAction:(BOOL)a3;
- (void)updateFocusIfNeeded;
@end

@implementation UIFocusSystem

+ (UIFocusSystem)focusSystemForEnvironment:(id)environment
{
  id v5 = environment;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"UIFocusSystem.m", 548, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  id v6 = (id)qword_1EB260630;
  v7 = v6;
  if (v6 && [v6 count])
  {
    v8 = _UIFocusEnvironmentRootAncestorEnvironment(v5);
    if ([v7 containsObject:v8])
    {
      if ([v8 _focusSystemIsValid]) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return (UIFocusSystem *)v10;
}

+ (id)_focusSystemForEnvironment:(id)a3
{
  return +[UIFocusSystem focusSystemForEnvironment:a3];
}

- (UIFocusSystem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIFocusSystem.m" lineNumber:123 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (UIFocusSystem)initWithFocusBehavior:(id)a3
{
  return [(UIFocusSystem *)self initWithFocusBehavior:a3 enabled:1];
}

- (UIFocusSystem)initWithFocusBehavior:(id)a3 enabled:(BOOL)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIFocusSystem;
  v8 = [(UIFocusSystem *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_behavior, a3);
    v9->_enabled = a4;
    id v10 = (_UIFocusMovementPerformer *)objc_opt_new();
    [(_UIFocusMovementPerformer *)v10 setDelegate:v9];
    movementPerformer = v9->_movementPerformer;
    v9->_movementPerformer = v10;
    v12 = v10;

    uint64_t v13 = qword_1EB2606E8;
    v14 = v9;
    if (v13 != -1) {
      dispatch_once(&qword_1EB2606E8, &__block_literal_global_210);
    }
    [(id)qword_1EB260630 addObject:v14];

    [(UIFocusSystem *)v14 _focusBehaviorDidChange];
  }

  return v9;
}

- (void)_prepareForTeardown
{
  *(_DWORD *)&self->_flags |= 1u;
}

- (void)_setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
LABEL_10:
    [(UIFocusSystem *)self setWaitingForFocusMovementAction:0];
    if (self->_enabled == v3) {
      return;
    }
    v9 = [(UIFocusSystem *)self _hostFocusSystem];

    if (!v9)
    {
      id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2605E8) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = @"disabled";
        if (v3) {
          v11 = @"enabled";
        }
        int v31 = 138543362;
        v32 = v11;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Focus system %{public}@", (uint8_t *)&v31, 0xCu);
      }
    }
    self->_enabled = v3;
    if (!v3)
    {
      v24 = [(UIFocusSystem *)self focusedItem];

      if (v24) {
        [(UIFocusSystem *)self _setNeedsFocusRestoration];
      }
      v25 = [(UIFocusSystem *)self _contextForUpdateToEnvironment:0];
      [(UIFocusSystem *)self _updateFocusWithContext:v25 report:0];
      [(UIFocusSystem *)self setPendingFocusMovementAction:0];
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = 0;

      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;

      disappearingFocusEnvironment = self->_disappearingFocusEnvironment;
      self->_disappearingFocusEnvironment = 0;

      goto LABEL_32;
    }
    uint64_t v12 = [(UIFocusSystem *)self pendingFocusMovementAction];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      v14 = [(UIFocusSystem *)self pendingFocusMovementAction];
      v15 = [v14 focusMovementInfo];
      uint64_t v16 = [v15 heading];

      if (v16)
      {
        v17 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:self];
        uint64_t v18 = [(UIFocusSystem *)self pendingFocusMovementAction];
        v19 = [(id)v18 focusMovementInfo];
        [(_UIFocusMovementRequest *)v17 setMovementInfo:v19];

        LOBYTE(v18) = [(UIFocusSystem *)self _performFocusMovement:v17];
        [(UIFocusSystem *)self setPendingFocusMovementAction:0];

        if (v18)
        {
LABEL_31:
          [(UIFocusSystem *)self _tickHasSeenFocusedItemTimer:0];
LABEL_32:
          v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v30 postNotificationName:@"_UIFocusSystemEnabledStateDidChangeNotification" object:self];

          return;
        }
      }
    }
    $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
      self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags & 0xFFFFFFFB);
      v21 = [(UIFocusSystem *)self _previousFocusedItem];
      v22 = [(UIFocusSystem *)self _contextForUpdateToEnvironment:v21];

      if ([(UIFocusSystem *)self _shouldRestoreFocusInContext:v22])
      {
        v23 = [(UIFocusSystem *)self _configureFocusDeferralIfNecessaryForContext:v22 report:0];

        [(UIFocusSystem *)self _updateFocusWithContext:v23 report:0];
        if (!self->_pendingFocusUpdateRequest) {
          goto LABEL_31;
        }
LABEL_29:
        [(UIFocusSystem *)self updateFocusIfNeeded];
        goto LABEL_31;
      }
    }
    if (!self->_pendingFocusUpdateRequest)
    {
      v29 = [[_UIFocusUpdateRequest alloc] initWithEnvironment:self];
      [(UIFocusSystem *)self _requestFocusUpdate:v29];
      [(UIFocusSystem *)self updateFocusIfNeeded];

      goto LABEL_31;
    }
    goto LABEL_29;
  }
  id v5 = [(UIFocusSystem *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  id v6 = [(UIFocusSystem *)self delegate];
  if (([v6 _shouldWaitForFocusMovementActionToEnableFocusSystem:self] & 1) == 0)
  {

    goto LABEL_9;
  }
  id v7 = [(UIFocusSystem *)self pendingFocusMovementAction];

  if (v7) {
    goto LABEL_10;
  }
  v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &_MergedGlobals_1046) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Tried to enable focus system without receiving focus movement action, waiting until action is received to enable", (uint8_t *)&v31, 2u);
  }
  [(UIFocusSystem *)self setWaitingForFocusMovementAction:1];
}

- (BOOL)_focusSystemIsValid
{
  return (*(unsigned char *)&self->_flags & 1) == 0;
}

- (void)_enableWithoutFocusRestoration
{
  if (_AXSFullKeyboardAccessEnabled() && !self->_enabled)
  {
    self->_enabled = 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"_UIFocusSystemEnabledStateDidChangeNotification" object:self];
  }
}

- (id)focusedItem
{
  p_focusedItem = &self->_focusedItem;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  if (WeakRetained && [(UIFocusSystem *)self _requiresFocusedItemToBeInHierarchy])
  {
    id v5 = objc_loadWeakRetained((id *)p_focusedItem);
    _UIFocusEnvironmentRootAncestorEnvironment(v5);
    id v6 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();
    if (v6 == self) {
      id v7 = objc_loadWeakRetained((id *)p_focusedItem);
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_focusedItem);
  }

  return v7;
}

- (UIFocusItem)_focusedItemOrDeferralTarget
{
  id v3 = [(UIFocusSystem *)self focusedItem];
  v4 = v3;
  if (v3) {
    id WeakRetained = v3;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
  }
  id v6 = WeakRetained;

  return (UIFocusItem *)v6;
}

- (id)_focusItemForValidation
{
  id v3 = [(UIFocusSystem *)self _focusedItemOrDeferralTarget];
  if (v3 || [(UIFocusSystem *)self _isEnabled]) {
    id WeakRetained = v3;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
  }
  id v5 = WeakRetained;

  return v5;
}

- (BOOL)_hasValidItemForCurrentDeferralState
{
  int64_t v4 = [(UIFocusSystem *)self _effectiveFocusDeferralBehavior];
  if ((unint64_t)(v4 - 1) < 4)
  {
    id v5 = [(UIFocusSystem *)self _focusedItemOrDeferralTarget];
LABEL_5:
    BOOL v2 = v5 != 0;

    return v2;
  }
  if (!v4)
  {
    id v5 = [(UIFocusSystem *)self focusedItem];
    goto LABEL_5;
  }
  return v2;
}

- (UIView)_focusedView
{
  BOOL v2 = [(UIFocusSystem *)self focusedItem];
  id v3 = _UIFocusEnvironmentContainingView(v2);

  return (UIView *)v3;
}

- (id)_focusedWindow
{
  BOOL v2 = [(UIFocusSystem *)self _focusedView];
  id v3 = [v2 _window];

  return v3;
}

- (void)_setFocusCastingController:(id)a3
{
  id v5 = (_UIFocusCastingController *)a3;
  focusCastingController = self->_focusCastingController;
  if (focusCastingController != v5)
  {
    id v7 = v5;
    if (focusCastingController)
    {
      [(_UIFocusCastingController *)focusCastingController setFocusSystem:0];
      [(_UIFocusCastingController *)self->_focusCastingController teardown];
      id v5 = v7;
    }
    [(_UIFocusCastingController *)v5 setFocusSystem:self];
    objc_storeStrong((id *)&self->_focusCastingController, a3);
    id v5 = v7;
  }
}

- (_UIFocusGroupHistory)_focusGroupHistory
{
  focusGroupHistory = self->_focusGroupHistory;
  if (!focusGroupHistory)
  {
    int64_t v4 = (_UIFocusGroupHistory *)objc_opt_new();
    id v5 = self->_focusGroupHistory;
    self->_focusGroupHistory = v4;

    focusGroupHistory = self->_focusGroupHistory;
  }
  return focusGroupHistory;
}

- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 326, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  switch([(UIFocusSystem *)self _effectiveFocusDeferralBehavior])
  {
    case 1:
    case 4:
      id v6 = [v5 _request];
      char v7 = [v6 allowsDeferral];
      goto LABEL_5;
    case 2:
      char v7 = 1;
      break;
    case 3:
      id v6 = [v5 _request];
      if ([v6 allowsDeferral])
      {
        v9 = [v5 nextFocusedItem];
        if (_UIFocusItemDeferralModeForItem(v9) == 1)
        {
          char v7 = 1;
        }
        else if ((*(unsigned char *)&self->_flags & 0x10) != 0)
        {
          char v7 = 0;
        }
        else
        {
          id v10 = [v5 nextFocusedItem];
          char v7 = _UIFocusItemDeferralModeForItem(v10) != 2;
        }
      }
      else
      {
        char v7 = 0;
      }
LABEL_5:

      break;
    default:
      char v7 = 0;
      break;
  }

  return v7;
}

- (id)_configureFocusDeferralIfNecessaryForContext:(id)a3 report:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v8 nextFocusedItem];
  if (v9
    && (id v10 = (void *)v9,
        BOOL v11 = [(UIFocusSystem *)self _prefersDeferralForFocusUpdateInContext:v8], v10, v11))
  {
    if ([v7 shouldLog])
    {
      uint64_t v12 = *(id *)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2605F0) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v8 nextFocusedItem];
        if (v13)
        {
          v14 = NSString;
          v15 = (objc_class *)objc_opt_class();
          uint64_t v16 = NSStringFromClass(v15);
          v17 = [v14 stringWithFormat:@"<%@: %p>", v16, v13];
        }
        else
        {
          v17 = @"(nil)";
        }
        v24 = v17;
        v25 = +[_UIDebugReportFormatter defaultFormatter];
        v26 = [v25 stringFromReport:v7];
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        __int16 v31 = 2114;
        v32 = v26;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Deferring focus update to item %{public}@:\n%{public}@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v12 = *(id *)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2605F8) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v8 nextFocusedItem];
        if (v19)
        {
          v20 = NSString;
          v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          v23 = [v20 stringWithFormat:@"<%@: %p>", v22, v19];
        }
        else
        {
          v23 = @"(nil)";
        }
        *(_DWORD *)buf = 138543362;
        v30 = v23;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Deferring focus update to item %{public}@. No additional info available.", buf, 0xCu);
      }
    }

    v27 = [v8 nextFocusedItem];
    [(UIFocusSystem *)self _setDeferredFocusUpdateTarget:v27];

    uint64_t v18 = [(UIFocusSystem *)self _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:0];
  }
  else
  {
    [(UIFocusSystem *)self _setDeferredFocusUpdateTarget:0];
    uint64_t v18 = v8;
  }

  return v18;
}

- (BOOL)_performDeferredFocusUpdateIfAvailable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(UIFocusSystem *)self _isEnabled]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
  if (WeakRetained && [(UIFocusSystem *)self _effectiveFocusDeferralBehavior] != 2)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &_performDeferredFocusUpdateIfAvailable___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v8 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = NSString;
        id v10 = WeakRetained;
        BOOL v11 = v8;
        uint64_t v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        v14 = [v9 stringWithFormat:@"<%@: %p>", v13, v10];

        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v14;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Executing previously deferred focus update to item %{public}@", buf, 0xCu);
      }
    }
    [(UIFocusSystem *)self _setDeferredFocusUpdateTarget:0];
    id v6 = [(UIFocusSystem *)self _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:WeakRetained];
    [v6 _setDeferredUpdate:1];
    BOOL v4 = [(UIFocusSystem *)self _updateFocusImmediatelyWithContext:v6];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_tickHasSeenFocusedItemTimer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(UIFocusSystem *)self _effectiveFocusDeferralBehavior];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hasSeenFocusedItemDidExpireTimer);
  [WeakRetained invalidate];

  id v7 = [(UIFocusSystem *)self focusedItem];

  if (v7 && v5 == 3)
  {
    if (v3)
    {
      if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260600))
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260608);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v12 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = (void *)MEMORY[0x1E4F29060];
            v14 = v12;
            v15 = [v13 callStackSymbols];
            *(_DWORD *)buf = 138543362;
            v19 = v15;
            _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Disabling focus deferral.\n%{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260610) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Disabling focus deferral.", buf, 2u);
        }
      }
      *(_DWORD *)&self->_flags |= 0x10u;
    }
    objc_initWeak((id *)buf, self);
    uint64_t v9 = (void *)MEMORY[0x1E4F1CB00];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__UIFocusSystem__tickHasSeenFocusedItemTimer___block_invoke;
    v16[3] = &unk_1E52DAB28;
    objc_copyWeak(&v17, (id *)buf);
    id v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:v16 block:60.0];
    objc_storeWeak((id *)&self->_hasSeenFocusedItemDidExpireTimer, v10);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __46__UIFocusSystem__tickHasSeenFocusedItemTimer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hasSeenFocusedItemDidExpire];
}

- (void)_resetFocusDeferral
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F29000uLL;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260618))
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260620);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = (void *)MEMORY[0x1E4F29060];
          BOOL v11 = v9;
          uint64_t v12 = [v10 callStackSymbols];
          int v13 = 138543362;
          v14 = v12;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Starting to defer focus updates.\n%{public}@", (uint8_t *)&v13, 0xCu);

          unint64_t v3 = 0x1E4F29000;
        }
      }
    }
    else
    {
      BOOL v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260628) + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Starting to defer focus updates.", (uint8_t *)&v13, 2u);
      }
    }
  }
  [*(id *)(v3 + 96) cancelPreviousPerformRequestsWithTarget:self selector:sel__hasSeenFocusedItemDidExpire object:0];
  *(_DWORD *)&self->_flags &= ~0x10u;
  int64_t v5 = [(UIFocusSystem *)self behavior];
  uint64_t v6 = [v5 focusCastingMode];

  if (v6 == 2)
  {
    id v7 = [(UIFocusSystem *)self _focusCastingController];
    [v7 forgetEntryPoint];
  }
}

- (void)_startDeferringFocusIfSupported
{
  [(UIFocusSystem *)self _resetFocusDeferral];
  int64_t v3 = [(UIFocusSystem *)self _effectiveFocusDeferralBehavior];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3 != 3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
      goto LABEL_10;
    }
    id v5 = objc_loadWeakRetained((id *)&self->_focusedItem);
    BOOL v4 = _UIFocusItemDeferralModeForItem(v5) != 2;
  }
  else
  {
    BOOL v4 = 1;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_focusedItem);

  if (!v6 || !v4) {
    return;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_focusedItem);
  [(UIFocusSystem *)self _dropFocusAndStartDeferring:0 suppressUpdate:1];
  [(UIFocusSystem *)self _setDeferredFocusUpdateTarget:v8];
  id WeakRetained = v8;
LABEL_10:
}

- (void)_clearDeferredFocusUpdateTarget
{
}

- (void)_setDeferredFocusUpdateTarget:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_deferredFocusUpdateTarget, obj);
    if ((*((unsigned char *)&self->_flags + 2) & 4) != 0)
    {
      id v5 = [(UIFocusSystem *)self delegate];
      [v5 _focusSystem:self didUpdateDeferralTarget:obj];
    }
  }
}

- (int64_t)_effectiveFocusDeferralBehavior
{
  int64_t v3 = [(UIFocusSystem *)self _overrideFocusDeferralBehavior];
  BOOL v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
  }
  else
  {
    id v6 = [(UIFocusSystem *)self behavior];
    int64_t v5 = [v6 focusDeferral];
  }
  return v5;
}

- (void)_setOverrideFocusDeferralBehavior:(id)a3
{
  int64_t v5 = (NSNumber *)a3;
  if (self->_overrideFocusDeferralBehavior != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_overrideFocusDeferralBehavior, a3);
    if ([(UIFocusSystem *)self _effectiveFocusDeferralBehavior])
    {
      [(UIFocusSystem *)self _startDeferringFocusIfSupported];
    }
    else
    {
      BOOL v6 = [(UIFocusSystem *)self _performDeferredFocusUpdateIfAvailable];
      int64_t v5 = v7;
      if (v6) {
        goto LABEL_7;
      }
      [(UIFocusSystem *)self requestFocusUpdateToEnvironment:self];
      [(UIFocusSystem *)self updateFocusIfNeeded];
    }
    int64_t v5 = v7;
  }
LABEL_7:
}

+ (NSArray)_allFocusSystems
{
  BOOL v2 = [(id)qword_1EB260630 allObjects];
  int64_t v3 = v2;
  if (!v2) {
    BOOL v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  BOOL v4 = v2;

  return v4;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return 0;
}

- (_UIFocusRegionContainer)_focusMapContainer
{
  int64_t v3 = [_UIFocusRegionContainerProxy alloc];
  BOOL v4 = [(UIFocusSystem *)self focusItemContainer];
  int64_t v5 = [(_UIFocusRegionContainerProxy *)v3 initWithOwningEnvironment:self itemContainer:v4];

  [(_UIFocusRegionContainerProxy *)v5 setAllowsLazyLoading:0];
  [(_UIFocusRegionContainerProxy *)v5 setShouldCreateRegionForOwningItem:0];
  [(_UIFocusRegionContainerProxy *)v5 setShouldCreateRegionForGuideBehavior:0];
  return (_UIFocusRegionContainer *)v5;
}

- (UIFocusItemContainer)focusItemContainer
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && ($C26450B17F84A6D740AC00827B43141C flags = self->_flags, WeakRetained, (*(_DWORD *)&flags & 0x10000) != 0))
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    BOOL v6 = [v7 _focusItemContainerForFocusSystem:self];
  }
  else
  {
    BOOL v6 = 0;
  }
  return (UIFocusItemContainer *)v6;
}

- (CGRect)_clippingRectInCoordinateSpace:(id)a3
{
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    id v8 = a3;
    uint64_t v9 = [(UIFocusSystem *)self delegate];
    [v9 _clippingRectForFocusSystem:self inCoordinateSpace:v8];
    double v3 = v10;
    double v4 = v11;
    double v5 = v12;
    double v6 = v13;
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (NSArray)preferredFocusEnvironments
{
  double v4 = [(UIFocusSystem *)self delegate];
  double v5 = v4;
  if (!v4 || (*(unsigned char *)&self->_flags & 0x80) == 0) {
    goto LABEL_3;
  }
  double v6 = [v4 _preferredFocusEnvironmentsForFocusSystem:self];
  if (!v6)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UIFocusSystem.m" lineNumber:624 description:@"Returning nil for a focus system's preferred focus environments is not allowed."];

LABEL_3:
    double v6 = 0;
  }
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  return v8;
}

- (void)setNeedsFocusUpdate
{
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_prefersFocusContainment
{
  return 1;
}

+ (BOOL)environment:(id)environment containsEnvironment:(id)otherEnvironment
{
  id v7 = environment;
  id v8 = otherEnvironment;
  uint64_t v9 = v8;
  if (!v7)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"UIFocusSystem.m", 656, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"UIFocusSystem.m", 657, @"Invalid parameter not satisfying: %@", @"otherEnvironment" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v7, v9);

  return IsAncestorOfEnvironment;
}

- (void)requestFocusUpdateToEnvironment:(id)environment
{
  id v7 = environment;
  if (!v7)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 666, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  double v5 = [[_UIFocusUpdateRequest alloc] initWithEnvironment:v7];
  [(UIFocusSystem *)self _requestFocusUpdate:v5];
}

- (void)_requestFocusUpdate:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 673, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  if (([v5 isFocusRemovalRequest] & 1) == 0)
  {
    double v6 = (void *)[v5 copy];

    [v6 cacheCurrentFocusSystem];
    if (![v6 isValidInFocusSystem:self]) {
      goto LABEL_28;
    }
    id v7 = [(UIFocusSystem *)self _validatedPendingFocusUpdateRequest];
    id v8 = v7;
    if (v7 && [v7 canMergeWithRequest:v6])
    {
      uint64_t v9 = [v8 requestByMergingWithRequest:v6];

      BOOL v10 = 1;
      double v6 = (void *)v9;
      goto LABEL_22;
    }
    id v11 = [v6 environment];
    if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260638)) {
      double v12 = objc_opt_new();
    }
    else {
      double v12 = 0;
    }
    id v50 = 0;
    BOOL v13 = [(UIFocusSystem *)self _isEnvironmentEligibleForFocusUpdate:v11 fallbackToEnvironment:&v50 debugReport:v12];
    id v14 = v50;
    double v15 = v14;
    if (v13)
    {

      if (v8) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = self->_appearingFocusEnvironment != 0;
      }
LABEL_22:
      objc_storeStrong((id *)&self->_pendingFocusUpdateRequest, v6);
      v19 = [(UIFocusSystem *)self updateThrottle];
      BOOL v20 = v19 == 0;

      if (v20)
      {
        if (!v10)
        {
          objc_initWeak((id *)location, self);
          v23 = (void *)UIApp;
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __37__UIFocusSystem__requestFocusUpdate___block_invoke;
          v48[3] = &unk_1E52DC308;
          objc_copyWeak(&v49, (id *)location);
          [v23 _performBlockAfterCATransactionCommits:v48];
          objc_destroyWeak(&v49);
          objc_destroyWeak((id *)location);
        }
      }
      else
      {
        v21 = [(UIFocusSystem *)self updateThrottle];
        [v21 scheduleProgrammaticFocusUpdate];

        if ([v6 resetsUpdateThrottle])
        {
          v22 = [(UIFocusSystem *)self updateThrottle];
          [v22 reset];
        }
      }
      goto LABEL_27;
    }
    if (!v14 || v11 == v14)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260648);
      if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
        goto LABEL_20;
      }
      double v17 = *(id *)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v29 = v11;
        if (v29)
        {
          v30 = NSString;
          __int16 v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          uint64_t v33 = [v30 stringWithFormat:@"<%@: %p>", v32, v29];
        }
        else
        {
          uint64_t v33 = @"(nil)";
        }

        v42 = v33;
        v43 = objc_opt_new();
        v44 = [v43 stringFromReport:v12];
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v33;
        __int16 v52 = 2114;
        v53 = v44;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Ignoring focus update request for ineligible environment %{public}@.\n%{public}@", location, 0x16u);
      }
    }
    else
    {
      unint64_t v16 = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260640);
      if (*(unsigned char *)v16)
      {
        log = *(id *)(v16 + 8);
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          id v25 = v11;
          if (v25)
          {
            v26 = NSString;
            v27 = (objc_class *)objc_opt_class();
            v28 = NSStringFromClass(v27);
            v45 = [v26 stringWithFormat:@"<%@: %p>", v28, v25];
          }
          else
          {
            v45 = @"(nil)";
          }

          v34 = NSString;
          id v35 = v15;
          v46 = v45;
          v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          v38 = [v34 stringWithFormat:@"<%@: %p>", v37, v35];

          id v39 = v38;
          v40 = objc_opt_new();
          v41 = [v40 stringFromReport:v12];
          *(_DWORD *)location = 138543874;
          *(void *)&location[4] = v45;
          __int16 v52 = 2114;
          v53 = v38;
          __int16 v54 = 2114;
          v55 = v41;
          _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "Ignoring focus update request for ineligible environment %{public}@. Using fallback environment %{public}@ instead.\n%{public}@", location, 0x20u);
        }
      }
      double v17 = [v6 requestByRedirectingRequestToEnvironment:v15];
      [(UIFocusSystem *)self _requestFocusUpdate:v17];
    }

LABEL_20:
LABEL_27:

    goto LABEL_28;
  }
  double v6 = v5;
LABEL_28:
}

void __37__UIFocusSystem__requestFocusUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFocusIfNeeded];
}

- (void)_focusEnvironmentWillBecomeInvisible:(id)a3
{
  id v4 = a3;
  if ([(UIFocusSystem *)self _focusSystemIsValid])
  {
    id v5 = (void *)UIApp;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__UIFocusSystem__focusEnvironmentWillBecomeInvisible___block_invoke;
    v6[3] = &unk_1E52D9F98;
    v6[4] = self;
    id v7 = v4;
    [v5 _performBlockAfterCATransactionCommits:v6];
  }
}

uint64_t __54__UIFocusSystem__focusEnvironmentWillBecomeInvisible___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _focusSystemIsValid];
  if (result)
  {
    uint64_t result = _UIFocusEnvironmentIsEligibleForFocusOcclusion(*(void **)(a1 + 40), 0);
    if ((result & 1) == 0)
    {
      double v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      return [v3 _focusEnvironmentWillDisappear:v4 remainingInHierarchy:1];
    }
  }
  return result;
}

- (void)_focusEnvironmentWillDisappear:(id)a3
{
}

- (void)_focusEnvironmentWillDisappear:(id)a3 remainingInHierarchy:(BOOL)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([(UIFocusSystem *)self _focusSystemIsValid])
  {
    if (a4 || !dyld_program_sdk_at_least())
    {
      BOOL v10 = 0;
    }
    else
    {
      uint64_t v9 = [(UIFocusSystem *)self focusedItem];
      if (v9) {
        BOOL v10 = [(UIFocusSystem *)self _focusedItemIsContainedInEnvironment:v8 includeSelf:1];
      }
      else {
        BOOL v10 = 0;
      }
    }
    if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260650)) {
      id v11 = objc_opt_new();
    }
    else {
      id v11 = 0;
    }
    id v56 = 0;
    BOOL v12 = [(UIFocusSystem *)self _isEnvironmentEligibleForFocusUpdate:v8 fallbackToEnvironment:&v56 debugReport:v11];
    id v13 = v56;
    if (v12)
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __69__UIFocusSystem__focusEnvironmentWillDisappear_remainingInHierarchy___block_invoke;
      v53[3] = &unk_1E52EE238;
      id v54 = v8;
      v55 = self;
      _UIFocusEnvironmentEnumerateAncestorEnvironments(v54, v53);
      objc_storeStrong((id *)&self->_disappearingFocusEnvironment, a3);
    }
    else if (v13)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260658);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v26 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          log = v26;
          id v27 = v8;
          if (v27)
          {
            v28 = NSString;
            id v29 = (objc_class *)objc_opt_class();
            v30 = NSStringFromClass(v29);
            __int16 v31 = [v28 stringWithFormat:@"<%@: %p>", v30, v27];
          }
          else
          {
            __int16 v31 = @"(nil)";
          }

          id v39 = NSString;
          id v40 = v13;
          id v49 = v31;
          id v50 = v31;
          v41 = (objc_class *)objc_opt_class();
          v42 = NSStringFromClass(v41);
          v43 = [v39 stringWithFormat:@"<%@: %p>", v42, v40];

          id v44 = v43;
          v48 = objc_opt_new();
          v45 = [v48 stringFromReport:v11];
          *(_DWORD *)buf = 138543874;
          v58 = v49;
          __int16 v59 = 2114;
          id v60 = v43;
          __int16 v61 = 2114;
          v62 = v45;
          v26 = log;
          _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "Ignoring focus update request for disappearing focus environment %{public}@. Using fallback environment %{public}@ instead.\n%{public}@", buf, 0x20u);
        }
      }
      [(UIFocusSystem *)self requestFocusUpdateToEnvironment:v13];
    }
    else
    {
      unint64_t v15 = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260660);
      if (*(unsigned char *)v15)
      {
        v32 = *(id *)(v15 + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v33 = v8;
          if (v33)
          {
            v34 = NSString;
            id v35 = (objc_class *)objc_opt_class();
            v36 = NSStringFromClass(v35);
            v37 = [v34 stringWithFormat:@"<%@: %p>", v36, v33];
          }
          else
          {
            v37 = @"(nil)";
          }

          os_log_t loga = v37;
          v46 = objc_opt_new();
          v47 = [v46 stringFromReport:v11];
          *(_DWORD *)buf = 138543618;
          v58 = v37;
          __int16 v59 = 2114;
          id v60 = v47;
          _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Ignoring focus update request for disappearing focus environment %{public}@.\n%{public}@", buf, 0x16u);
        }
      }
    }
    objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
    if (!v10 || ![(UIFocusSystem *)self _isEnabled]) {
      goto LABEL_35;
    }
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      unint64_t v16 = self->_pendingFocusUpdateRequest;
      [(UIFocusSystem *)self _dropFocusAndStartDeferring:0 suppressUpdate:1];
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = v16;

LABEL_35:
      id v25 = [(UIFocusSystem *)self _focusMovementCache];
      [v25 environmentWillDisappear:v8];

      goto LABEL_36;
    }
    if (dyld_program_sdk_at_least() && (_UIIsPrivateMainBundle() & 1) == 0)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = [(UIFocusSystem *)self focusedItem];
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIFocusSystem.m", 829, @"The newly focused item or one of its parent environments is getting removed from the hierarchy in response of that item becoming focused. This is a client bug that leaves the focus system in an undefined state. Focused item: %@; environment being removed: %@.",
        v24,
        v8);

      goto LABEL_35;
    }
    if (dyld_program_sdk_at_least() && _UIIsPrivateMainBundle())
    {
      if (!os_variant_has_internal_diagnostics())
      {
        uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260668) + 8);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        v19 = v18;
        BOOL v20 = [(UIFocusSystem *)self focusedItem];
        *(_DWORD *)buf = 138412546;
        v58 = v20;
        __int16 v59 = 2112;
        id v60 = v8;
        v21 = "The newly focused item or one of its parent environments is getting removed from the hierarchy in response"
              " of that item becoming focused. This is a client bug that leaves the focus system in an undefined state. F"
              "ocused item: %@; environment being removed: %@. This is a hard assert for other clients and requires immediate attention.";
        goto LABEL_31;
      }
      v19 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      BOOL v20 = [(UIFocusSystem *)self focusedItem];
      *(_DWORD *)buf = 138412546;
      v58 = v20;
      __int16 v59 = 2112;
      id v60 = v8;
      v38 = "The newly focused item or one of its parent environments is getting removed from the hierarchy in response o"
            "f that item becoming focused. This is a client bug that leaves the focus system in an undefined state. Focus"
            "ed item: %@; environment being removed: %@. This is a hard assert for other clients and requires immediate attention.";
    }
    else
    {
      if (!os_variant_has_internal_diagnostics())
      {
        v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260670) + 8);
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        v19 = v22;
        BOOL v20 = [(UIFocusSystem *)self focusedItem];
        *(_DWORD *)buf = 138412546;
        v58 = v20;
        __int16 v59 = 2112;
        id v60 = v8;
        v21 = "The newly focused item or one of its parent environments is getting removed from the hierarchy in response"
              " of that item becoming focused. This is a client bug that leaves the focus system in an undefined state. F"
              "ocused item: %@; environment being removed: %@. This will become an assert in a future version.";
LABEL_31:
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, v21, buf, 0x16u);
LABEL_32:

LABEL_33:
        goto LABEL_35;
      }
      v19 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      BOOL v20 = [(UIFocusSystem *)self focusedItem];
      *(_DWORD *)buf = 138412546;
      v58 = v20;
      __int16 v59 = 2112;
      id v60 = v8;
      v38 = "The newly focused item or one of its parent environments is getting removed from the hierarchy in response o"
            "f that item becoming focused. This is a client bug that leaves the focus system in an undefined state. Focus"
            "ed item: %@; environment being removed: %@. This will become an assert in a future version.";
    }
    _os_log_fault_impl(&dword_1853B0000, v19, OS_LOG_TYPE_FAULT, v38, buf, 0x16u);
    goto LABEL_32;
  }
LABEL_36:
}

void __69__UIFocusSystem__focusEnvironmentWillDisappear_remainingInHierarchy___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (!v5)
  {
LABEL_12:
    id v6 = 0;
    goto LABEL_13;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0 && (objc_msgSend(v5, sel_allowsWeakReference) & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__UIFocusSystem__focusEnvironmentWillDisappear_remainingInHierarchy___block_invoke_2;
    block[3] = &unk_1E52D9F70;
    id v12 = v5;
    if (__allFocusSystems_block_invoke_once != -1) {
      dispatch_once(&__allFocusSystems_block_invoke_once, block);
    }

    goto LABEL_12;
  }
  id v6 = v5;
  if (*(id *)(a1 + 32) != v6)
  {
    id v7 = [[_UIFocusUpdateRequest alloc] initWithEnvironment:v6];
    [(_UIFocusUpdateRequest *)v7 setAllowsFocusingCurrentItem:1];
    [*(id *)(a1 + 40) _requestFocusUpdate:v7];
    id v8 = *(id *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 environment];

      if (v10 == v6) {
        *a3 = 1;
      }
    }
  }
LABEL_13:
}

void __69__UIFocusSystem__focusEnvironmentWillDisappear_remainingInHierarchy___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &__allFocusSystems_block_invoke_2___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Focus system attempting to use a deallocating focus environment. Offending object: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_focusEnvironmentDidBecomeVisible:(id)a3
{
  id v6 = a3;
  if ([(UIFocusSystem *)self _focusSystemIsValid])
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0
      || ([(UIFocusSystem *)self _focusedItemOrDeferralTarget],
          int v4 = objc_claimAutoreleasedReturnValue(),
          BOOL HaveCommonHierarchy = _UIFocusEnvironmentsHaveCommonHierarchy(v6, v4),
          v4,
          !HaveCommonHierarchy))
    {
      [(UIFocusSystem *)self _focusEnvironmentDidAppear:v6];
    }
  }
}

- (void)_focusEnvironmentDidAppear:(id)a3
{
  id v4 = a3;
  if ([(UIFocusSystem *)self _focusSystemIsValid])
  {
    if ([(NSHashTable *)self->_focusItemAncestorCache containsObject:v4]) {
      [(UIFocusSystem *)self _clearFocusItemAncestorCache];
    }
    uint64_t v5 = [(UIFocusSystem *)self _focusMovementCache];
    [v5 environmentDidAppear:v4];

    if ([(UIFocusSystem *)self _effectiveFocusDeferralBehavior])
    {
      if ((*(unsigned char *)&self->_flags & 2) == 0)
      {
        if (v4)
        {
          _UIFocusEnvironmentRootAncestorEnvironment(v4);
          id v6 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v6 = 0;
        }
        if (v6 != self) {
          goto LABEL_29;
        }
        objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
        id v7 = [(UIFocusSystem *)self _focusItemForValidation];
        id v8 = v7;
        if (!v7)
        {
          if (!self->_pendingFocusUpdateRequest && [(UIFocusSystem *)self _isEnabled]) {
            [(UIFocusSystem *)self requestFocusUpdateToEnvironment:self];
          }
          goto LABEL_28;
        }
        uint64_t v9 = _UIFocusEnvironmentFirstCommonAncestor(v7, v4);
        id v10 = (void *)v9;
        if (v9 && (void *)v9 != v8)
        {
          if (!_UIFocusItemIsViewOrRespondsToSelector(v4)) {
            goto LABEL_18;
          }
          id v11 = [v10 focusItemContainer];
          id v12 = [v11 coordinateSpace];

          double v13 = _UIFocusItemFrameInCoordinateSpace(v4, v12);
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          double v20 = _UIFocusItemFrameInCoordinateSpace(v8, v12);
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          v37.origin.x = v13;
          v37.origin.y = v15;
          v37.size.width = v17;
          v37.size.height = v19;
          if (!CGRectIsNull(v37))
          {
            v38.origin.x = v20;
            v38.origin.y = v22;
            v38.size.width = v24;
            v38.size.height = v26;
            if (!CGRectIsNull(v38))
            {
              if (_UIRectSmartIntersectsRect(v13, v15, v17, v19, v20, v22, v24, v26))
              {

LABEL_18:
                p_appearingFocusEnvironment = &self->_appearingFocusEnvironment;
                appearingFocusEnvironment = self->_appearingFocusEnvironment;
                if (appearingFocusEnvironment)
                {
                  id v29 = _UIFocusEnvironmentFirstCommonAncestor(appearingFocusEnvironment, v10);

                  objc_storeStrong((id *)p_appearingFocusEnvironment, v29);
                  id v10 = v29;
                }
                else
                {
                  pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
                  objc_storeStrong((id *)&self->_appearingFocusEnvironment, v10);
                  if (!pendingFocusUpdateRequest)
                  {
                    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &_focusEnvironmentDidAppear____s_category);
                    if (*(unsigned char *)CategoryCachedImpl)
                    {
                      id v33 = *(NSObject **)(CategoryCachedImpl + 8);
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                      {
                        LOWORD(location[0]) = 0;
                        _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "Scheduling focused item validation for appearing environment.", (uint8_t *)location, 2u);
                      }
                    }
                    objc_initWeak(location, self);
                    v32 = (void *)UIApp;
                    v34[0] = MEMORY[0x1E4F143A8];
                    v34[1] = 3221225472;
                    v34[2] = __44__UIFocusSystem__focusEnvironmentDidAppear___block_invoke;
                    v34[3] = &unk_1E52DC308;
                    objc_copyWeak(&v35, location);
                    [v32 _performBlockAfterCATransactionCommits:v34];
                    objc_destroyWeak(&v35);
                    objc_destroyWeak(location);
                  }
                }
                goto LABEL_27;
              }
            }
          }
        }
LABEL_27:

LABEL_28:
LABEL_29:
      }
    }
  }
}

void __44__UIFocusSystem__focusEnvironmentDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFocusIfNeeded];
}

- (id)_validatedAppearingFocusEnvironmentRequest
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_appearingFocusEnvironment;
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_14;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260678);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v12 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v13 = NSString;
      double v14 = v3;
      CGFloat v15 = v12;
      double v16 = (objc_class *)objc_opt_class();
      CGFloat v17 = NSStringFromClass(v16);
      double v18 = [v13 stringWithFormat:@"<%@: %p>", v17, v14];

      *(_DWORD *)buf = 138543362;
      CGFloat v22 = v18;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Validating focused item for appearing environment %{public}@.", buf, 0xCu);
    }
  }
  uint64_t v5 = [(UIFocusSystem *)self _focusedItemOrDeferralTarget];
  if (v5)
  {
    _UIFocusEnvironmentRootAncestorEnvironment(v3);
    id v6 = (UIFocusSystem *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      id v8 = _UIFocusEnvironmentPreferredFocusMapContainer(v3);
      if (os_variant_has_internal_diagnostics())
      {
        if (v8)
        {
LABEL_9:
          uint64_t v9 = [[_UIFocusMap alloc] initWithFocusSystem:self rootContainer:v8 coordinateSpace:0 searchInfo:0 ignoresRootContainerClippingRect:0];
          if ([(_UIFocusMap *)v9 verifyFocusabilityForItem:v5])
          {
            appearingFocusEnvironment = self->_appearingFocusEnvironment;
            self->_appearingFocusEnvironment = 0;

            id v7 = 0;
          }
          else
          {
            id v7 = [[_UIFocusUpdateRequest alloc] initWithFocusSystem:self environment:v3];
          }
          goto LABEL_12;
        }
        CGFloat v19 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v19, OS_LOG_TYPE_FAULT, "Unable to find a focus map container. This should never happen.", buf, 2u);
        }
      }
      else
      {
        if (v8) {
          goto LABEL_9;
        }
        double v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260680) + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Unable to find a focus map container. This should never happen.", buf, 2u);
        }
      }
      id v7 = 0;
      uint64_t v9 = (_UIFocusMap *)self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  id v7 = 0;
  id v8 = self->_appearingFocusEnvironment;
  self->_appearingFocusEnvironment = 0;
LABEL_13:

LABEL_14:
  return v7;
}

- (id)_validatedPendingFocusUpdateRequest
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_pendingFocusUpdateRequest;
  id v4 = v3;
  if (v3 && ![(_UIFocusUpdateRequest *)v3 isValidInFocusSystem:self])
  {
    id v6 = *(id *)(__UILogGetCategoryCachedImpl("UIFocus", &_validatedPendingFocusUpdateRequest___s_category)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(_UIFocusUpdateRequest *)v4 environment];
      if (v7)
      {
        id v8 = NSString;
        uint64_t v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        id v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v7];
      }
      else
      {
        id v11 = @"(nil)";
      }
      id v12 = NSString;
      double v13 = self;
      double v14 = v11;
      CGFloat v15 = (objc_class *)objc_opt_class();
      double v16 = NSStringFromClass(v15);
      CGFloat v17 = [v12 stringWithFormat:@"<%@: %p>", v16, v13];

      *(_DWORD *)buf = 138543618;
      double v21 = v11;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Found invalid pending focus update request for environment %{public}@ in focus system %{public}@.", buf, 0x16u);
    }
    pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
    self->_pendingFocusUpdateRequest = 0;

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = v4;
  }

  return v5;
}

- (id)_topEnvironment
{
  BOOL v2 = self;
  uint64_t v3 = v2;
  id v4 = v2;
  if ((*(unsigned char *)&v2->_flags & 0x40) == 0
    || ([(UIFocusSystem *)v2 delegate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 _topEnvironmentForFocusSystem:v3],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v6,
        v4)
    && ((disappearingFocusEnvironment = v3->_disappearingFocusEnvironment) != 0
     && _UIFocusEnvironmentIsAncestorOfEnvironment(disappearingFocusEnvironment, v4)
     || !_UIFocusEnvironmentIsAncestorOfEnvironment(v3, v4)))
  {
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = v4;
    id v4 = v5;
  }

  return v5;
}

- (BOOL)_debug_isEnvironmentEligibleForFocusUpdate:(id)a3 debugReport:(id)a4
{
  return [(UIFocusSystem *)self _isEnvironmentEligibleForFocusUpdate:a3 fallbackToEnvironment:0 debugReport:a4];
}

- (BOOL)_isEnvironmentEligibleForFocusUpdate:(id)a3 fallbackToEnvironment:(id *)a4 debugReport:(id)a5
{
  id v8 = (UIFocusSystem *)a3;
  id v9 = a5;
  if (![(UIFocusSystem *)self _isEnabled])
  {
    id v10 = +[_UIDebugIssue issueWithDescription:@"Focus is not currently enabled in this environment's focus system, updates will be delayed."];
    [v9 addIssue:v10];
  }
  id v11 = [(UIFocusSystem *)self _topEnvironment];
  id v12 = v11;
  if (!v11)
  {
    CGFloat v15 = +[_UIDebugIssue issueWithDescription:@"The current first responder is not a focus environment, no focus updates are allowed as that would force the first responder to change."];
    [v9 addIssue:v15];
    BOOL v23 = 0;
LABEL_25:

    goto LABEL_26;
  }
  BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v11, v8);
  if (v12 != v8)
  {
    BOOL v14 = IsAncestorOfEnvironment;
    CGFloat v15 = [(UIFocusSystem *)self _focusItemForValidation];
    double v16 = self->_pendingFocusUpdateRequest;
    CGFloat v17 = v16;
    if (v16)
    {
      if (v15) {
        int v18 = 1;
      }
      else {
        int v18 = v14;
      }
      if (v18 != 1
        || ([(_UIFocusUpdateRequest *)v16 environment],
            CGFloat v19 = objc_claimAutoreleasedReturnValue(),
            BOOL v20 = _UIFocusEnvironmentIsAncestorOfEnvironment(v8, v19),
            v19,
            !v20))
      {
        double v21 = @"An ancestor of this environment has already requested a focus update, which takes priority.";
LABEL_12:
        __int16 v22 = +[_UIDebugIssue issueWithDescription:v21];
        [v9 addIssue:v22];

LABEL_13:
        BOOL v23 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    else if (v15)
    {
      if (!_UIFocusEnvironmentIsAncestorOfEnvironment(v8, v15))
      {
        double v21 = @"This environment does not contain the currently focused item.";
        goto LABEL_12;
      }
    }
    else if (v12 == self || !v14)
    {
      if (v12 == self) {
        CGFloat v26 = @"Nothing is currently focused, so this environment's request will be ignored and focus will be reset to the focus system's preferred focused item.";
      }
      else {
        CGFloat v26 = @"This environment is not inside the current first responder.";
      }
      id v27 = +[_UIDebugIssue issueWithDescription:v26];
      [v9 addIssue:v27];

      if (a4)
      {
        BOOL v23 = 0;
        *a4 = v12;
        goto LABEL_24;
      }
      goto LABEL_13;
    }
    BOOL v23 = 1;
    goto LABEL_24;
  }
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (void)_updateWantsTreeLocking
{
  uint64_t v3 = [(UIFocusSystem *)self behavior];
  int v4 = [v3 wantsTreeLocking];

  treeLock = self->_treeLock;
  if (v4)
  {
    if (!treeLock)
    {
      id v6 = (_UIFocusTreeLock *)objc_opt_new();
      id v7 = self->_treeLock;
      self->_treeLock = v6;
    }
  }
  else if (treeLock)
  {
    self->_treeLock = 0;

    [(UIFocusSystem *)self _reevaluateLockedEnvironments];
  }
}

- (BOOL)_isEnvironmentLocked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIFocusSystem *)self treeLock];
  id v6 = v5;
  if (v5) {
    char v7 = [v5 isEnvironmentLocked:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)_lockEnvironment:(id)a3
{
  id v6 = a3;
  id v4 = [(UIFocusSystem *)self treeLock];
  uint64_t v5 = v4;
  if (v4) {
    [v4 lockEnvironmentTree:v6];
  }
}

- (void)_unlockEnvironment:(id)a3
{
  id v6 = a3;
  id v4 = [(UIFocusSystem *)self treeLock];
  uint64_t v5 = v4;
  if (!v4 || [v4 unlockEnvironmentTree:v6]) {
    [(UIFocusSystem *)self _reevaluateLockedEnvironments];
  }
}

- (void)updateFocusIfNeeded
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (![(UIFocusSystem *)self _focusSystemIsValid]) {
    return;
  }
  if (![(UIFocusSystem *)self _isEnabled]) {
    return;
  }
  $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
  if ((*(unsigned char *)&flags & 9) != 0) {
    return;
  }
  if (self->_appearingFocusEnvironment)
  {
    BOOL v5 = -[UIFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:");
    $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    if (v5)
    {
      self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 8);
      return;
    }
  }
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    int v6 = *(unsigned char *)&flags & 0x20;
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 0x20);
    uint64_t v7 = [(UIFocusSystem *)self _validatedPendingFocusUpdateRequest];
    uint64_t v8 = [(UIFocusSystem *)self _validatedAppearingFocusEnvironmentRequest];
    if (v7 | v8)
    {
      deepestPreferredFocusableItemCacheForCurrentUpdate = [(UIFocusSystem *)self _topEnvironment];
      if (v7)
      {
        id v10 = [(id)v7 environment];
        BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v10);

        if (!IsAncestorOfEnvironment)
        {
          uint64_t v12 = [(id)v7 requestByRedirectingRequestToEnvironment:deepestPreferredFocusableItemCacheForCurrentUpdate];

          uint64_t v7 = v12;
        }
      }
      if (v8)
      {
        double v13 = [(id)v8 environment];
        BOOL v14 = _UIFocusEnvironmentFirstCommonAncestor(deepestPreferredFocusableItemCacheForCurrentUpdate, v13);

        if (v14 != deepestPreferredFocusableItemCacheForCurrentUpdate)
        {
          id v15 = v14;

          deepestPreferredFocusableItemCacheForCurrentUpdate = v15;
        }
        if (v7)
        {
          int v16 = v6;
          CGFloat v17 = [(id)v7 environment];
          int v18 = [(id)v8 environment];
          CGFloat v19 = _UIFocusEnvironmentFirstCommonAncestor(v17, v18);

          if (!v19)
          {
            v68 = [MEMORY[0x1E4F28B00] currentHandler];
            [v68 handleFailureInMethod:a2 object:self file:@"UIFocusSystem.m" lineNumber:1204 description:@"The appearing environment and the requested environment are not part of the same focus system."];
          }
          BOOL v20 = [(id)v7 environment];

          if (v19 != v20)
          {
            uint64_t v21 = [(id)v7 requestByRedirectingRequestToEnvironment:v19];

            uint64_t v7 = v21;
          }
          int v6 = v16;
        }
        else
        {
          uint64_t v7 = (uint64_t)(id)v8;
        }
      }
      BOOL v23 = [(id)v7 environment];
      BOOL v24 = [(UIFocusSystem *)self _isEnvironmentLocked:v23];

      if (v24)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260690);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v63 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = v63;
            v65 = [(id)v7 environment];
            *(_DWORD *)buf = 138412290;
            v77 = v65;
            _os_log_impl(&dword_1853B0000, v64, OS_LOG_TYPE_ERROR, "Postponing update for locked environment %@", buf, 0xCu);
          }
        }
        self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(v6 | *(_DWORD *)&self->_flags & 0xFFFFFFDF | 8);
        goto LABEL_64;
      }
      int v74 = v6;
      v75 = self->_appearingFocusEnvironment;
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = 0;

      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;

      v28 = (_UIFocusUpdateRequest *)(id)v7;
      unint64_t v29 = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260698);
      v30 = *(id *)(v29 + 8);
      if (os_signpost_id_make_with_pointer(*(os_log_t *)(v29 + 8), v28) - 1 <= 0xFFFFFFFFFFFFFFFDLL
        && os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }

      id v31 = [[UIFocusUpdateContext alloc] _initWithFocusUpdateRequest:v28];
      if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2606A0))
      {
        v66 = objc_alloc_init(_UIDebugIssueReport);
        [v31 _setValidationReport:v66];

        v67 = objc_alloc_init(_UIDebugLogReport);
        [v31 _setPreferredFocusReport:v67];
      }
      v32 = [v31 nextFocusedItem];
      if (v32 || !deepestPreferredFocusableItemCacheForCurrentUpdate)
      {
        id v45 = v31;
        id v44 = v28;
LABEL_56:

        id v31 = v45;
        uint64_t v7 = (uint64_t)v44;
      }
      else
      {
        uint64_t v7 = (uint64_t)v28;
        while (1)
        {
          uint64_t v33 = [(id)v7 environment];
          if (!v33) {
            break;
          }
          v34 = (void *)v33;
          id v35 = [(id)v7 environment];

          if (v35 == deepestPreferredFocusableItemCacheForCurrentUpdate) {
            break;
          }
          v36 = [(id)v7 environment];
          if (_UIFocusEnvironmentPrefersFocusContainment(v36))
          {
            int64_t v37 = [(UIFocusSystem *)self _effectiveFocusDeferralBehavior];

            if (v37 == 3) {
              [(UIFocusSystem *)self _resetFocusDeferral];
            }
          }
          else
          {
          }
          CGRect v38 = [(id)v7 requestByRedirectingRequestToNextContainerEnvironment];
          if (os_variant_has_internal_diagnostics())
          {
            if (!v38)
            {
              v72 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1853B0000, v72, OS_LOG_TYPE_FAULT, "Iterating through container providing environments resulted in a nil request without ever reaching the defined top environment. This should never happen.", buf, 2u);
              }

              break;
            }
          }
          else if (!v38)
          {
            v62 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2606A8) + 8);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v62, OS_LOG_TYPE_ERROR, "Iterating through container providing environments resulted in a nil request without ever reaching the defined top environment. This should never happen.", buf, 2u);
            }
            break;
          }
          id v39 = [(_UIFocusUpdateRequest *)v38 environment];
          BOOL v40 = _UIFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v39);

          if (!v40)
          {
            uint64_t v41 = [(id)v7 requestByRedirectingRequestToEnvironment:deepestPreferredFocusableItemCacheForCurrentUpdate];

            CGRect v38 = (_UIFocusUpdateRequest *)v41;
            if (!v41) {
              break;
            }
          }
          v42 = [(_UIFocusUpdateRequest *)v38 environment];
          BOOL v43 = [(UIFocusSystem *)self _isEnvironmentLocked:v42];

          if (v43)
          {
            unint64_t v57 = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2606B0);
            if (*(unsigned char *)v57)
            {
              v69 = *(NSObject **)(v57 + 8);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                v70 = v69;
                v71 = [(_UIFocusUpdateRequest *)v38 environment];
                *(_DWORD *)buf = 138412290;
                v77 = v71;
                _os_log_impl(&dword_1853B0000, v70, OS_LOG_TYPE_ERROR, "Postponing update for locked environment %@", buf, 0xCu);
              }
            }
            *(_DWORD *)&self->_flags |= 8u;
            v58 = self->_pendingFocusUpdateRequest;
            self->_pendingFocusUpdateRequest = v38;
            __int16 v59 = v38;

            id v60 = self->_appearingFocusEnvironment;
            self->_appearingFocusEnvironment = v75;
            __int16 v61 = v75;

            goto LABEL_64;
          }
          id v44 = v38;

          id v45 = [[UIFocusUpdateContext alloc] _initWithFocusUpdateRequest:v44];
          if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2606B8))
          {
            v46 = [v31 _preferredFocusReport];
            [v46 addLineBreak];

            v47 = [v31 _preferredFocusReport];
            [v47 addMessage:@" === unable to find focused item in context. retrying with updated request. === "];

            v48 = [v31 _preferredFocusReport];
            [v48 addLineBreak];

            id v49 = [v31 _validationReport];
            [v45 _setValidationReport:v49];

            id v50 = [v31 _preferredFocusReport];
            [v45 _setPreferredFocusReport:v50];
          }
          v32 = [v45 nextFocusedItem];
          uint64_t v7 = (uint64_t)v44;
          id v31 = v45;
          if (v32) {
            goto LABEL_56;
          }
        }
      }
      disappearingFocusEnvironment = self->_disappearingFocusEnvironment;
      self->_disappearingFocusEnvironment = 0;

      __int16 v52 = [(UIFocusSystem *)self updateThrottle];
      [v52 didCreateProgrammaticFocusUpdateContext:v31];

      v53 = 0;
      if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2606C0))
      {
        v53 = [[_UIFocusUpdateReport alloc] initWithFocusSystem:self];
        [(_UIFocusUpdateReport *)v53 setContext:v31];
      }
      id v54 = [(UIFocusSystem *)self _configureFocusDeferralIfNecessaryForContext:v31 report:v53];

      [(UIFocusSystem *)self _updateFocusWithContext:v54 report:v53];
      unint64_t v55 = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2606C8);
      id v56 = *(id *)(v55 + 8);
      if (os_signpost_id_make_with_pointer(*(os_log_t *)(v55 + 8), v28) - 1 <= 0xFFFFFFFFFFFFFFFDLL
        && os_signpost_enabled(v56))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }

      int v6 = v74;
    }
    else
    {
      uint64_t v7 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v6);
    deepestPreferredFocusableItemCacheForCurrentUpdate = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
    self->_deepestPreferredFocusableItemCacheForCurrentUpdate = 0;
LABEL_64:

    return;
  }
  __int16 v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB260688) + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Calling updateFocusIfNeeded while a focus update is in progress. This call will be ignored.", buf, 2u);
  }
}

- (BOOL)_updateFocusWithContext:(id)a3 report:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    int64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"UIFocusSystem.m" lineNumber:1314 description:@"Attempting to initiate a focus update with a nil context."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  [v7 _willUpdateFocusFromFocusedItem:WeakRetained];
  char v10 = [v7 _isValidInFocusSystem:self];
  int v11 = [v8 shouldLog];
  if (v10)
  {
    if (v11)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2606E0);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        id v39 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          BOOL v40 = v39;
          uint64_t v41 = +[_UIDebugReportFormatter defaultFormatter];
          v42 = [v41 stringFromReport:v8];
          int v43 = 138543618;
          id v44 = v7;
          __int16 v45 = 2114;
          v46 = v42;
          _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_ERROR, "Updating focus with context %{public}@:\n%{public}@", (uint8_t *)&v43, 0x16u);
        }
      }
    }
    $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      CGRect v38 = [MEMORY[0x1E4F28B00] currentHandler];
      [v38 handleFailureInMethod:a2 object:self file:@"UIFocusSystem.m" lineNumber:1335 description:@"_ignoreFocusUpdateIfNeeded should never be YES at the beginning of a focus update."];

      $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 2);
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      BOOL v14 = [(UIFocusSystem *)self delegate];
      [v14 _focusSystem:self willUpdateFocusInContext:v7];
    }
    [(UIFocusSystem *)self _sendWillUpdateFocusNotificationsInContext:v7];
    objc_storeWeak((id *)&self->_previousFocusedItem, WeakRetained);
    id v15 = [v7 nextFocusedItem];
    objc_storeWeak((id *)&self->_focusedItem, v15);
    objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
    pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
    self->_pendingFocusUpdateRequest = 0;

    appearingFocusEnvironment = self->_appearingFocusEnvironment;
    self->_appearingFocusEnvironment = 0;

    [(UIFocusSystem *)self _clearFocusItemAncestorCache];
    [(UIFocusSystem *)self _sendDidUpdateFocusNotificationsInContext:v7];
    if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
    {
      int v18 = [(UIFocusSystem *)self delegate];
      [v18 _focusSystem:self didUpdateFocusInContext:v7];
    }
    CGFloat v19 = [(UIFocusSystem *)self _focusCastingController];

    if (v19)
    {
      BOOL v20 = [(UIFocusSystem *)self _focusCastingController];
      [v20 updateFocusCastingWithContext:v7];
    }
    uint64_t v21 = [(UIFocusSystem *)self _focusMovementCache];

    if (v21)
    {
      __int16 v22 = [(UIFocusSystem *)self _focusMovementCache];
      [v22 updateCacheWithContext:v7];
    }
    [(UIFocusSystem *)self _didFinishUpdatingFocusInContext:v7];
    [v7 _didUpdateFocus];
    *(_DWORD *)&self->_flags &= ~2u;
    if (v15 && v15 != WeakRetained)
    {
      BOOL v23 = [v7 _focusMovement];
      if (v23) {
        uint64_t v24 = 1;
      }
      else {
        uint64_t v24 = [v7 _isDeferredUpdate];
      }
      [(UIFocusSystem *)self _tickHasSeenFocusedItemTimer:v24];
    }
    id v30 = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
    uint64_t v31 = [v7 _previouslyFocusedGroupIdentifier];
    v32 = (void *)v31;
    if (v30 && v31)
    {
      uint64_t v33 = [v7 _nextFocusedGroupIdentifier];
      v34 = v33;
      if (!v33 || ([v33 isEqualToString:v32] & 1) == 0)
      {
        id v35 = [(UIFocusSystem *)self _focusGroupHistory];
        [v35 setLastFocusedItem:v30 forGroupIdentifier:v32];
      }
    }
  }
  else if (v11)
  {
    double v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2606D0) + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v26 = v25;
      id v27 = +[_UIDebugReportFormatter defaultFormatter];
      v28 = [v27 stringFromReport:v8];
      int v43 = 138543618;
      id v44 = v7;
      __int16 v45 = 2114;
      v46 = v28;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_DEFAULT, "Failed to update focus with context %{public}@:\n%{public}@", (uint8_t *)&v43, 0x16u);
    }
  }
  else
  {
    unint64_t v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2606D8) + 8);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 138543362;
      id v44 = v7;
      _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_DEFAULT, "Failed to update focus with context %{public}@. No additional info available.", (uint8_t *)&v43, 0xCu);
    }
  }

  return v10;
}

- (void)_notifyEnvironment:(id)a3 didUpdateFocusInContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v8 _didUpdateFocusInContext:v6];
  }
  else if ((*((unsigned char *)&self->_flags + 1) & 0x40) != 0)
  {
    id v7 = [(UIFocusSystem *)self delegate];
    [v7 _focusSystem:self environment:v8 didUpdateFocusInContext:v6];
  }
}

- (void)_sendWillUpdateFocusNotificationsInContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 1428, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__UIFocusSystem__sendWillUpdateFocusNotificationsInContext___block_invoke;
  v8[3] = &unk_1E52EE578;
  id v9 = v5;
  id v6 = v5;
  [(UIFocusSystem *)self _sendNotificationsForFocusUpdateInContext:v6 usingBlock:v8];
}

void __60__UIFocusSystem__sendWillUpdateFocusNotificationsInContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 _willUpdateFocusInContext:*(void *)(a1 + 32)];
  }
}

- (void)_sendDidUpdateFocusNotificationsInContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 1439, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__UIFocusSystem__sendDidUpdateFocusNotificationsInContext___block_invoke;
  v8[3] = &unk_1E52EE5A0;
  void v8[4] = self;
  id v9 = v5;
  id v6 = v5;
  [(UIFocusSystem *)self _sendNotificationsForFocusUpdateInContext:v6 usingBlock:v8];
}

uint64_t __59__UIFocusSystem__sendDidUpdateFocusNotificationsInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyEnvironment:a2 didUpdateFocusInContext:*(void *)(a1 + 40)];
}

- (void)_sendNotificationsForFocusUpdateInContext:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 1449, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  int v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 1450, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  char v10 = [v7 previouslyFocusedItem];
  int v11 = [v7 nextFocusedItem];
  uint64_t v12 = [v7 _commonAncestorEnvironment];
  if (v10)
  {
    if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0)
    {
      double v13 = [(UIFocusSystem *)self delegate];
      [v13 _focusSystem:self willMessageOldFocusNodes:v7];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__UIFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke;
    v19[3] = &unk_1E52EE5C8;
    id v20 = v12;
    id v21 = v9;
    _UIFocusEnvironmentEnumerateAncestorEnvironments(v10, v19);
  }
  if (v11)
  {
    if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0)
    {
      BOOL v14 = [(UIFocusSystem *)self delegate];
      [v14 _focusSystem:self willMessageNewFocusNodes:v7];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__UIFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke_2;
    v17[3] = &unk_1E52EE5F0;
    id v18 = v9;
    _UIFocusEnvironmentEnumerateAncestorEnvironments(v11, v17);
  }
}

uint64_t __70__UIFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 32) != a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  *a3 = 1;
  return result;
}

uint64_t __70__UIFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIFocusEnvironment)_disappearingFocusEnvironment
{
  return self->_disappearingFocusEnvironment;
}

- (void)_performWithoutFocusUpdates:(id)a3
{
  if (a3)
  {
    $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 2);
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | (2
                                                                                              * ((*(unsigned int *)&flags >> 1) & 1)));
  }
}

- (BOOL)_updateFocusImmediatelyWithContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 1504, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  if (*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &_updateFocusImmediatelyWithContext____s_category))
  {
    id v6 = [v5 _focusMovement];

    if (v6)
    {
      id v6 = [[_UIFocusUpdateReport alloc] initWithFocusSystem:self];
      [(_UIFocusUpdateReport *)v6 setContext:v5];
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(UIFocusSystem *)self _configureFocusDeferralIfNecessaryForContext:v5 report:v6];

  BOOL v8 = [(UIFocusSystem *)self _updateFocusWithContext:v7 report:v6];
  return v8;
}

- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3 startDeferringOnLostFocus:(BOOL)a4 suppressLostFocusUpdate:(BOOL)a5
{
  id v8 = a3;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v21 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "UIKit is trying to programatically move focus while inside another focus update. This typically happens when clients are manipulating state in response to a state change callout for the same state.", buf, 2u);
      }
    }
    else
    {
      id v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate____s_category)+ 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "UIKit is trying to programatically move focus while inside another focus update. This typically happens when clients are manipulating state in response to a state change callout for the same state.", buf, 2u);
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if (!dyld_program_sdk_at_least() || [(UIFocusSystem *)self _isEnabled])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __104__UIFocusSystem__updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate___block_invoke;
      v22[3] = &unk_1E52DF220;
      BOOL v23 = a4;
      v22[4] = self;
      BOOL v24 = a5;
      id v9 = (void (**)(void))_Block_copy(v22);
      char v10 = [(UIFocusSystem *)self _contextForUpdateToEnvironment:v8 allowsOverridingPreferedFocusEnvironments:0 allowsDeferral:1];
      int v11 = v10;
      if (v8
        && ([v10 nextFocusedItem],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            !v12))
      {
        int v16 = [(UIFocusSystem *)self _topEnvironment];
        if (v16 == self)
        {

          int v16 = 0;
        }
        CGFloat v17 = [(UIFocusSystem *)self _focusedItemOrDeferralTarget];
        id v18 = v17;
        if (v16 && v17 && !_UIFocusEnvironmentIsAncestorOfEnvironment(v16, v17)) {
          v9[2](v9);
        }
      }
      else
      {
        if (![(UIFocusSystem *)self _isEnabled])
        {
          id v15 = [v11 nextFocusedItem];
          objc_storeWeak((id *)&self->_previousFocusedItem, v15);

          [(UIFocusSystem *)self _setNeedsFocusRestoration];
          BOOL v14 = 1;
LABEL_26:

          goto LABEL_27;
        }
        if ([v11 _isValidInFocusSystem:self])
        {
          uint64_t v13 = [(UIFocusSystem *)self _configureFocusDeferralIfNecessaryForContext:v11 report:0];

          if ([(UIFocusSystem *)self _updateFocusImmediatelyWithContext:v13])
          {
            if (![(UIFocusSystem *)self _hasValidItemForCurrentDeferralState]) {
              v9[2](v9);
            }
            BOOL v14 = 1;
          }
          else
          {
            BOOL v14 = 0;
          }
          int v11 = (void *)v13;
          goto LABEL_26;
        }
      }
      BOOL v14 = 0;
      goto LABEL_26;
    }
    [(UIFocusSystem *)self _cancelPendingFocusRestoration];
  }
  BOOL v14 = 0;
LABEL_27:

  return v14;
}

uint64_t __104__UIFocusSystem__updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 40))
  {
    uint64_t result = [*(id *)(result + 32) _effectiveFocusDeferralBehavior];
    if (result) {
      uint64_t result = [*(id *)(v1 + 32) _resetFocusDeferral];
    }
  }
  if (!*(unsigned char *)(v1 + 41))
  {
    BOOL v2 = *(void **)(v1 + 32);
    return [v2 requestFocusUpdateToEnvironment:v2];
  }
  return result;
}

- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3
{
  return [(UIFocusSystem *)self _updateFocusImmediatelyToEnvironment:a3 startDeferringOnLostFocus:1 suppressLostFocusUpdate:0];
}

- (void)_dropFocusAndStartDeferring:(BOOL)a3 suppressUpdate:(BOOL)a4
{
}

- (id)_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:(id)a3
{
  return [(UIFocusSystem *)self _contextForUpdateToEnvironment:a3 allowsOverridingPreferedFocusEnvironments:0 allowsDeferral:0];
}

- (id)_contextForUpdateToEnvironment:(id)a3
{
  return [(UIFocusSystem *)self _contextForUpdateToEnvironment:a3 allowsOverridingPreferedFocusEnvironments:1 allowsDeferral:1];
}

- (id)_contextForUpdateToEnvironment:(id)a3 allowsOverridingPreferedFocusEnvironments:(BOOL)a4 allowsDeferral:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    id v9 = [[_UIFocusUpdateRequest alloc] initWithFocusSystem:self environment:v8];
  }
  else
  {
    id v9 = +[_UIFocusUpdateRequest requestForRemovingFocusInFocusSystem:self];
  }
  char v10 = v9;
  [(_UIFocusUpdateRequest *)v9 setAllowsOverridingPreferedFocusEnvironments:v6];
  [(_UIFocusUpdateRequest *)v10 setAllowsDeferral:v5];
  id v11 = [[UIFocusUpdateContext alloc] _initWithFocusUpdateRequest:v10];

  return v11;
}

- (BOOL)_performFocusMovement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIFocusSystem *)self _movementPerformer];
  char v6 = [v5 performFocusMovement:v4];

  return v6;
}

- (void)invalidateFocusItemContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFocusSystem *)self _focusMovementCache];
  [v5 invalidateFocusItemContainer:v4];
}

- (_UIFocusEnvironmentPreferenceCache)_deepestPreferredFocusableItemCacheForCurrentUpdate
{
  if (!self->_deepestPreferredFocusableItemCacheForCurrentUpdate && (*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    id v3 = [(UIFocusSystem *)self behavior];
    int v4 = [v3 cachesPreferredEnvironmentEnumerationResults];

    if (v4)
    {
      id v5 = (_UIFocusEnvironmentPreferenceCache *)objc_opt_new();
      deepestPreferredFocusableItemCacheForCurrentUpdate = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
      self->_deepestPreferredFocusableItemCacheForCurrentUpdate = v5;
    }
  }
  id v7 = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
  return v7;
}

- (void)_buildFocusItemAncestorCacheIfNecessary
{
  p_focusItemAncestorCache = &self->_focusItemAncestorCache;
  if (!self->_focusItemAncestorCache)
  {
    int v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
    if (WeakRetained)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __56__UIFocusSystem__buildFocusItemAncestorCacheIfNecessary__block_invoke;
      v6[3] = &unk_1E52EE618;
      id v7 = v4;
      _UIFocusEnvironmentEnumerateAncestorEnvironments(WeakRetained, v6);
      objc_storeStrong((id *)p_focusItemAncestorCache, v4);
    }
    else
    {
      objc_storeStrong((id *)p_focusItemAncestorCache, v4);
    }
  }
}

uint64_t __56__UIFocusSystem__buildFocusItemAncestorCacheIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_clearFocusItemAncestorCache
{
  focusItemAncestorCache = self->_focusItemAncestorCache;
  self->_focusItemAncestorCache = 0;
}

- (BOOL)_focusedItemIsContainedInEnvironment:(id)a3 includeSelf:(BOOL)a4
{
  id v7 = (char *)a3;
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v8 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1) {
    goto LABEL_4;
  }
  int v12 = _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic) {
    goto LABEL_4;
  }
  while (v8 >= v12)
  {
    _UIInternalPreferenceSync(v8, &_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic, @"FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    int v12 = _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic;
    if (v8 == _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic) {
      goto LABEL_4;
    }
  }
  if (!byte_1E8FD4F0C)
  {
LABEL_4:
    if (!v7)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 1679, @"Invalid parameter not satisfying: %@", @"environment != nil" object file lineNumber description];
    }
    [(UIFocusSystem *)self _buildFocusItemAncestorCacheIfNecessary];
    if (a4)
    {
      BOOL IsAncestorOfEnvironment = [(NSHashTable *)self->_focusItemAncestorCache containsObject:v7];
    }
    else
    {
      id WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_focusedItem);
      BOOL IsAncestorOfEnvironment = WeakRetained != v7
                             && [(NSHashTable *)self->_focusItemAncestorCache containsObject:v7];
    }
  }
  else
  {
    if (!a4)
    {
      a2 = (SEL)objc_loadWeakRetained((id *)&self->_focusedItem);
      if (a2 == v7)
      {
        BOOL IsAncestorOfEnvironment = 0;
        a2 = v7;
LABEL_23:

        goto LABEL_12;
      }
    }
    id v14 = objc_loadWeakRetained((id *)&self->_focusedItem);
    BOOL IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v7, v14);

    if (!a4) {
      goto LABEL_23;
    }
  }
LABEL_12:

  return IsAncestorOfEnvironment;
}

- (void)_reevaluateLockedEnvironments
{
  $C26450B17F84A6D740AC00827B43141C flags = self->_flags;
  self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags & 0xFFFFFFF7);
  if ((*(unsigned char *)&flags & 8) != 0 && (self->_pendingFocusUpdateRequest || self->_appearingFocusEnvironment))
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &_reevaluateLockedEnvironments___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      char v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Trying to execute postponed update...", (uint8_t *)location, 2u);
      }
    }
    objc_initWeak(location, self);
    id v5 = (void *)UIApp;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__UIFocusSystem__reevaluateLockedEnvironments__block_invoke;
    v7[3] = &unk_1E52DC308;
    objc_copyWeak(&v8, location);
    [v5 _performBlockAfterCATransactionCommits:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

void __46__UIFocusSystem__reevaluateLockedEnvironments__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFocusIfNeeded];
}

- (void)_setNeedsFocusRestoration
{
  *(_DWORD *)&self->_flags |= 4u;
}

- (void)_cancelPendingFocusRestoration
{
  *(_DWORD *)&self->_flags &= ~4u;
}

- (void)_handleFocusMovementAction:(id)a3
{
  [(UIFocusSystem *)self setPendingFocusMovementAction:a3];
  if ([(UIFocusSystem *)self waitingForFocusMovementAction])
  {
    [(UIFocusSystem *)self _setEnabled:1];
    [(UIFocusSystem *)self setWaitingForFocusMovementAction:0];
  }
}

- (UIFocusEnvironment)_deepestPreferredFocusEnvironment
{
  id v3 = [(UIFocusSystem *)self _focusedItemOrDeferralTarget];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    p_deepestPreferredFocusEnvironment = &self->_deepestPreferredFocusEnvironment;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deepestPreferredFocusEnvironment);

    if (!WeakRetained)
    {
      id v8 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
      id v9 = [(_UIDeepestPreferredEnvironmentSearch *)v8 deepestPreferredFocusEnvironmentForEnvironment:self];
      objc_storeWeak((id *)p_deepestPreferredFocusEnvironment, v9);
    }
    id v5 = objc_loadWeakRetained((id *)p_deepestPreferredFocusEnvironment);
  }
  char v10 = v5;

  return (UIFocusEnvironment *)v10;
}

- (BOOL)_shouldReverseLayoutDirectionForEnvironment:(id)a3
{
  if ((*((unsigned char *)&self->_flags + 2) & 0x10) == 0) {
    return 0;
  }
  int v4 = self;
  id v5 = a3;
  char v6 = [(UIFocusSystem *)v4 delegate];
  LOBYTE(v4) = [v6 _focusSystem:v4 shouldReverseLayoutDirectionForEnvironment:v5];

  return (char)v4;
}

- (BOOL)_shouldReverseLinearWrappingForEnvironment:(id)a3
{
  if ((*((unsigned char *)&self->_flags + 2) & 0x20) == 0) {
    return 0;
  }
  int v4 = self;
  id v5 = a3;
  char v6 = [(UIFocusSystem *)v4 delegate];
  LOBYTE(v4) = [v6 _focusSystem:v4 shouldReverseLinearWrappingForEnvironment:v5];

  return (char)v4;
}

- (BOOL)_requiresFocusedItemToBeInHierarchy
{
  BOOL v2 = [(UIFocusSystem *)self behavior];
  char v3 = [v2 modernFocusedItemGetterBehavior] ^ 1;

  return v3;
}

- (BOOL)_postsFocusUpdateNotifications
{
  return 1;
}

- (UIFocusSystem)_hostFocusSystem
{
  return 0;
}

- (BOOL)_uiktest_updateFocusToItem:(id)a3
{
  char v3 = self;
  int v4 = [(UIFocusSystem *)self _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:a3];
  LOBYTE(v3) = [(UIFocusSystem *)v3 _updateFocusWithContext:v4 report:0];

  return (char)v3;
}

- (void)_uiktest_setPreviousFocusedItem:(id)a3
{
}

- (void)_uiktest_disableFocusDeferral
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIFocusSystem.m" lineNumber:1806 description:@"This method is only to be used during UIKit tests."];
}

- (void)_uiktest_disableThrottle
{
  [(_UIFocusUpdateThrottle *)self->_updateThrottle teardown];
  updateThrottle = self->_updateThrottle;
  self->_updateThrottle = 0;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector()) {
      int v5 = 64;
    }
    else {
      int v5 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v5);
    if (objc_opt_respondsToSelector()) {
      int v6 = 128;
    }
    else {
      int v6 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 256;
    }
    else {
      int v7 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 512;
    }
    else {
      int v8 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 1024;
    }
    else {
      int v9 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 2048;
    }
    else {
      int v10 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 4096;
    }
    else {
      int v11 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 0x2000;
    }
    else {
      int v12 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 0x4000;
    }
    else {
      int v13 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 0x8000;
    }
    else {
      int v14 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v14);
    if (objc_opt_respondsToSelector()) {
      int v15 = 0x10000;
    }
    else {
      int v15 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v15);
    if (objc_opt_respondsToSelector()) {
      int v16 = 0x20000;
    }
    else {
      int v16 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v16);
    if (objc_opt_respondsToSelector()) {
      int v17 = 0x40000;
    }
    else {
      int v17 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v17);
    if (objc_opt_respondsToSelector()) {
      int v18 = 0x80000;
    }
    else {
      int v18 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v18);
    if (objc_opt_respondsToSelector()) {
      int v19 = 0x100000;
    }
    else {
      int v19 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v19);
    if (objc_opt_respondsToSelector()) {
      int v20 = 0x200000;
    }
    else {
      int v20 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFDFFFFF | v20);
    if (objc_opt_respondsToSelector()) {
      int v21 = 0x400000;
    }
    else {
      int v21 = 0;
    }
    self->_$C26450B17F84A6D740AC00827B43141C flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v21);
  }
}

- (BOOL)_shouldRestoreFocusInContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 1851, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  int v6 = [(UIFocusSystem *)self delegate];
  int v7 = v6;
  if (v6 && (*((unsigned char *)&self->_flags + 1) & 1) != 0)
  {
    char IsAncestorOfEnvironment = [v6 _focusSystem:self shouldRestoreFocusInContext:v5];
  }
  else
  {
    int v8 = [v5 nextFocusedItem];
    char IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(self, v8);
  }
  return IsAncestorOfEnvironment;
}

- (void)_didFinishUpdatingFocusInContext:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIFocusSystem.m", 1863, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    id v5 = 0;
  }
  int v6 = [v5 _sourceItemInfo];
  [v6 invalidateFocusedRegion];

  int v7 = [v11 _destinationItemInfo];
  [v7 invalidateFocusedRegion];

  int v8 = [(UIFocusSystem *)self delegate];
  int v9 = v8;
  if (v8 && (*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    [v8 _focusSystem:self didFinishUpdatingFocusInContext:v11];
  }
}

- (BOOL)_isScrollingScrollableContainer:(id)a3 targetContentOffset:(CGPoint *)a4
{
  id v6 = a3;
  int v7 = [(UIFocusSystem *)self delegate];
  int v8 = v7;
  if (v7 && (*((unsigned char *)&self->_flags + 2) & 0x40) != 0) {
    char v9 = [v7 _focusSystem:self isScrollingScrollableContainer:v6 targetContentOffset:a4];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_handleFailedFocusMovementRequest:(id)a3 withPerformer:(id)a4
{
  if ((*((unsigned char *)&self->_flags + 2) & 8) == 0) {
    return 0;
  }
  id v5 = self;
  id v6 = a3;
  int v7 = [(UIFocusSystem *)v5 delegate];
  LOBYTE(v5) = [v7 _focusSystem:v5 handleFailedMovementRequest:v6];

  return (char)v5;
}

- (void)setBehavior:(id)a3
{
  id v5 = (_UIFocusBehavior *)a3;
  if (self->_behavior != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_behavior, a3);
    [(UIFocusSystem *)self _focusBehaviorDidChange];
    id v5 = v6;
  }
}

- (void)_focusBehaviorDidChange
{
  [(UIFocusSystem *)self _updateFocusUpdateThrottle];
  [(UIFocusSystem *)self _updateWantsTreeLocking];
}

- (void)_updateFocusUpdateThrottle
{
  char v3 = [(UIFocusSystem *)self behavior];
  if ([v3 throttlesProgrammaticFocusUpdates])
  {
    updateThrottle = self->_updateThrottle;

    if (!updateThrottle)
    {
      objc_initWeak(&location, self);
      id v5 = [_UIFocusUpdateThrottle alloc];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __43__UIFocusSystem__updateFocusUpdateThrottle__block_invoke;
      v11[3] = &unk_1E52DC308;
      objc_copyWeak(&v12, &location);
      id v6 = [(_UIFocusUpdateThrottle *)v5 initWithUpdateHandler:v11];
      int v7 = self->_updateThrottle;
      self->_updateThrottle = v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {
  }
  int v10 = [(UIFocusSystem *)self behavior];
  if ([(_UIFocusUpdateThrottle *)v10 throttlesProgrammaticFocusUpdates])
  {
    int v8 = v10;
  }
  else
  {
    char v9 = self->_updateThrottle;

    if (!v9) {
      return;
    }
    [(_UIFocusUpdateThrottle *)self->_updateThrottle teardown];
    int v8 = self->_updateThrottle;
    self->_updateThrottle = 0;
  }
}

void __43__UIFocusSystem__updateFocusUpdateThrottle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFocusIfNeeded];
}

- (NSString)description
{
  char v3 = [[UIDescriptionBuilder alloc] initWithObject:self];
  if os_variant_has_internal_diagnostics() && (*(unsigned char *)&self->_flags) {
    id v10 = [(UIDescriptionBuilder *)v3 appendName:@"TEARDOWN RECEIVED" object:@"YES"];
  }
  id v4 = [(UIDescriptionBuilder *)v3 appendName:@"enabled" BOOLValue:self->_enabled];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  id v6 = [(UIDescriptionBuilder *)v3 appendName:@"focusedItem" object:WeakRetained];

  if (self->_pendingFocusUpdateRequest) {
    id v7 = -[UIDescriptionBuilder appendName:object:](v3, "appendName:object:", @"pendingFocusUpdateRequest");
  }
  int v8 = [(UIDescriptionBuilder *)v3 string];

  return (NSString *)v8;
}

- (_UIFocusMovementPerformer)_movementPerformer
{
  return self->_movementPerformer;
}

- (BOOL)waitingForFocusMovementAction
{
  return self->_waitingForFocusMovementAction;
}

- (void)setWaitingForFocusMovementAction:(BOOL)a3
{
  self->_waitingForFocusMovementAction = a3;
}

- (UIFocusMovementAction)pendingFocusMovementAction
{
  return self->_pendingFocusMovementAction;
}

- (void)setPendingFocusMovementAction:(id)a3
{
}

- (_UIFocusUpdateThrottle)updateThrottle
{
  return self->_updateThrottle;
}

- (_UIFocusTreeLock)treeLock
{
  return self->_treeLock;
}

- (_UIFocusSystemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIFocusSystemDelegate *)WeakRetained;
}

- (UIFocusItem)_previousFocusedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
  return (UIFocusItem *)WeakRetained;
}

- (_UIFocusCastingController)_focusCastingController
{
  return self->_focusCastingController;
}

- (_UIFocusLinearMovementCache)_focusMovementCache
{
  return self->_focusMovementCache;
}

- (void)_setFocusMovementCache:(id)a3
{
}

- (_UIFocusBehavior)behavior
{
  return self->_behavior;
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (NSNumber)_overrideFocusDeferralBehavior
{
  return self->_overrideFocusDeferralBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFocusDeferralBehavior, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_focusMovementCache, 0);
  objc_storeStrong((id *)&self->_focusCastingController, 0);
  objc_destroyWeak((id *)&self->_previousFocusedItem);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_treeLock, 0);
  objc_storeStrong((id *)&self->_updateThrottle, 0);
  objc_storeStrong((id *)&self->_pendingFocusMovementAction, 0);
  objc_destroyWeak((id *)&self->_deepestPreferredFocusEnvironment);
  objc_storeStrong((id *)&self->_deepestPreferredFocusableItemCacheForCurrentUpdate, 0);
  objc_storeStrong((id *)&self->_focusGroupHistory, 0);
  objc_destroyWeak((id *)&self->_focusedItem);
  objc_storeStrong((id *)&self->_movementPerformer, 0);
  objc_destroyWeak((id *)&self->_hasSeenFocusedItemDidExpireTimer);
  objc_storeStrong((id *)&self->_focusItemAncestorCache, 0);
  objc_storeStrong((id *)&self->_disappearingFocusEnvironment, 0);
  objc_storeStrong((id *)&self->_appearingFocusEnvironment, 0);
  objc_destroyWeak((id *)&self->_deferredFocusUpdateTarget);
  objc_storeStrong((id *)&self->_pendingFocusUpdateRequest, 0);
}

+ (void)registerURL:(NSURL *)soundFileURL forSoundIdentifier:(UIFocusSoundIdentifier)identifier
{
  id v12 = soundFileURL;
  id v7 = identifier;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"UIFocusSystem.m", 1966, @"Invalid parameter not satisfying: %@", @"soundFileURL" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  char v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, a1, @"UIFocusSystem.m", 1967, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  if ([(NSString *)v7 isEqual:@"UIFocusSoundIdentifierDefault"])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"UIFocusSystem.m" lineNumber:1968 description:@"UIFocusSoundIdentifierDefault is reserved for system use."];
  }
  if ([(NSString *)v7 isEqual:@"UIFocusSoundIdentifierNone"])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"UIFocusSystem.m" lineNumber:1969 description:@"UIFocusSoundIdentifierNone is reserved for system use."];
  }
  +[_UIFocusSoundGenerator registerURL:v12 forIdentifier:v7];
}

- (UIFocusSystem)_preferredFirstResponderFocusSystem
{
  char v3 = [(UIFocusSystem *)self focusedItem];
  id v4 = [(UIFocusSystem *)self _preferredFirstResponderFocusSystemForFocusedItem:v3];

  return (UIFocusSystem *)v4;
}

- (id)_preferredFirstResponderFocusSystemForFocusedItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    char v9 = self;
    goto LABEL_27;
  }
  id v6 = _UIHostedFocusSystemsForHostEnvironment(v4);
  if ([v6 count] == 1)
  {
    id v7 = [v6 anyObject];
    int v8 = [v7 focusedItem];
    if (!v7) {
      goto LABEL_25;
    }
  }
  else
  {
    if ((unint64_t)[v6 count] < 2)
    {
      id v7 = 0;
      int v8 = 0;
LABEL_25:
      int v18 = self;
      goto LABEL_26;
    }
    int v20 = self;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      int v8 = 0;
      id v7 = 0;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          int v16 = [v15 focusedItem];
          if (v16)
          {
            if (v7)
            {

              goto LABEL_21;
            }
            id v7 = v15;
            id v17 = v16;

            int v8 = v17;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v8 = 0;
LABEL_21:
      id v7 = 0;
    }

    self = v20;
    if (!v7) {
      goto LABEL_25;
    }
  }
  if (!v8) {
    goto LABEL_25;
  }
  int v18 = [v7 _preferredFirstResponderFocusSystemForFocusedItem:v8];
LABEL_26:
  char v9 = v18;

LABEL_27:
  return v9;
}

- (UIResponder)_preferredFirstResponder
{
  char v3 = objc_getAssociatedObject(self, &_overridePreferredFirstResponderKey);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_27;
  }
  id v6 = [(UIFocusSystem *)self focusedItem];
  id v7 = [(UIFocusSystem *)self _focusedItemOrDeferralTarget];
  int v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  int v10 = !v9;
  if (v9)
  {
    if (v6)
    {
LABEL_14:
      uint64_t v11 = [(UIFocusSystem *)self _preferredFirstResponderFocusSystemForFocusedItem:v6];
      uint64_t v12 = v11;
      if (v11 == self
        || ([(UIFocusSystem *)v11 _preferredFirstResponder],
            (id v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        _UIFirstResponderCandidateForEnvironment(v6);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v10)
      {
        uint64_t v13 = _UIFocusEnvironmentContainingView(v6);
        int v14 = [v13 _window];

        if (!v14) {
          goto LABEL_21;
        }
        uint64_t v15 = [(id)UIApp _physicalKeyboardEventForWindow:v14];
        if (!v15
          || (int v16 = (void *)v15,
              objc_setAssociatedObject(self, &_overridePreferredFirstResponderKey, v5, (void *)0x301),
              [v5 _keyCommandForEvent:v16],
              id v17 = objc_claimAutoreleasedReturnValue(),
              objc_setAssociatedObject(self, &_overridePreferredFirstResponderKey, 0, (void *)0x301),
              v16,
              !v17))
        {
LABEL_21:

          id v17 = 0;
          id v5 = 0;
        }
      }
      goto LABEL_26;
    }
  }
  else
  {
    if (_UIFocusItemIsViewOrRespondsToSelector(v7)
      && [v8 _wantsKeyCommandsWhenDeferred])
    {
      id v6 = v8;
      goto LABEL_14;
    }
    id v6 = 0;
  }
  id v5 = 0;
LABEL_26:

LABEL_27:
  return (UIResponder *)v5;
}

- (BOOL)_safari_moveFocusToNextGroup
{
  _UIFocusSystemAssertIfNotSafari();
  char v3 = [[_UIFocusMovementInfo alloc] initWithHeading:16 linearHeading:0 isInitial:1 shouldLoadScrollableContainer:0 looping:1 groupFilter:2 inputType:5];
  id v4 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:self];
  [(_UIFocusMovementRequest *)v4 setMovementInfo:v3];
  LOBYTE(self) = [(UIFocusSystem *)self _performFocusMovement:v4];

  return (char)self;
}

- (BOOL)_safari_moveFocusToPreviousGroup
{
  _UIFocusSystemAssertIfNotSafari();
  char v3 = [[_UIFocusMovementInfo alloc] initWithHeading:32 linearHeading:0 isInitial:1 shouldLoadScrollableContainer:0 looping:1 groupFilter:2 inputType:5];
  id v4 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:self];
  [(_UIFocusMovementRequest *)v4 setMovementInfo:v3];
  LOBYTE(self) = [(UIFocusSystem *)self _performFocusMovement:v4];

  return (char)self;
}

@end