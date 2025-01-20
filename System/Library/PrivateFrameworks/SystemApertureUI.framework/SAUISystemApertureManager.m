@interface SAUISystemApertureManager
+ (void)initialize;
- (BOOL)_axLayoutSpecifierRequestsCollapseIfExpandedByUserInteraction:(id)a3;
- (BOOL)_elementRequiresBeingDisplayedAlone:(id)a3;
- (BOOL)viewProviderShouldMakeSensorShadowVisible:(id)a3;
- (CGRect)interSensorRegionInContentView:(id)a3;
- (CGRect)sensorRegionInContentView:(id)a3 fromViewProvider:(id)a4;
- (CGRect)sensorRegionObstructingViewProvider:(id)a3 inContentView:(id)a4;
- (CGSize)maximumAvailableSizeForProvidedLeadingView:(id)a3 fromViewProvider:(id)a4;
- (CGSize)maximumAvailableSizeForProvidedMinimalView:(id)a3 fromViewProvider:(id)a4;
- (CGSize)maximumAvailableSizeForProvidedTrailingView:(id)a3 fromViewProvider:(id)a4;
- (NSArray)orderedElementViewControllers;
- (NSArray)registeredElements;
- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3;
- (SAUIElementViewControlling)indicatorElementViewController;
- (SAUISystemApertureManager)initWithElementAuthority:(id)a3;
- (SAUISystemApertureManagerDelegate)delegate;
- (double)alertingDurationForHost:(id)a3;
- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4;
- (double)viewProviderSensorShadowOpacityFactor:(id)a3;
- (id)_assertionForElement:(id)a3;
- (id)_assertionForElementCreatingIfNecessary:(id)a3;
- (id)_elementViewControllerForElement:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)_invalidatedAssertionForElement:(id)a3;
- (id)_temporallyOrderedVisibleAlertAndActivityElements;
- (id)elementViewControllerForElement:(id)a3;
- (id)registerElement:(id)a3;
- (int64_t)behaviorOverridingRole;
- (unint64_t)_maximumNumberOfSimultaneouslyVisibleElements;
- (void)_addInvalidatedAssertion:(id)a3 forElement:(id)a4;
- (void)_axLayoutSpecifierRequestsDiminishment:(id)a3;
- (void)_compactElements;
- (void)_elementAssertionDidInvalidate:(id)a3;
- (void)_invalidatePromotedState;
- (void)_invalidateTemporallyOrderedElements;
- (void)_purgeRemovedElementViewControllers;
- (void)_reevaluatePromotedElements;
- (void)_removeAssertionForElement:(id)a3;
- (void)_removeElementViewController:(id)a3;
- (void)_removeInvalidatedAssertionForElement:(id)a3;
- (void)_requestHostNeedsLayout;
- (void)elementRequestsNegativeResponse:(id)a3;
- (void)elementRequestsSignificantUpdateTransition:(id)a3;
- (void)elementViewControllingDidDisappear:(id)a3;
- (void)hostWillPerformLayout;
- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3;
- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3;
- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3;
- (void)preferredPromotionDidInvalidateForLayoutSpecifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5;
@end

@implementation SAUISystemApertureManager

- (NSArray)orderedElementViewControllers
{
  return self->_orderedElementViewControllers;
}

- (void)hostWillPerformLayout
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_promotedStateIsValid) {
    [(SAUISystemApertureManager *)obj _reevaluatePromotedElements];
  }
  objc_sync_exit(obj);
}

- (id)_assertionForElementCreatingIfNecessary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = [(SAUISystemApertureManager *)v5 _assertionForElement:v4];
    if (!v6)
    {
      [v4 uniquelyIdentifyElement];
      objc_initWeak(&location, v5);
      v7 = [SAUIElementAssertion alloc];
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __69__SAUISystemApertureManager__assertionForElementCreatingIfNecessary___block_invoke;
      v18 = &unk_26552BBF0;
      objc_copyWeak(&v19, &location);
      v6 = [(SAUIElementAssertion *)v7 initWithElement:v4 invalidationHandler:&v15];
      if (v6)
      {
        elementsToAssertions = v5->_elementsToAssertions;
        if (!elementsToAssertions)
        {
          uint64_t v9 = objc_msgSend(MEMORY[0x263F08968], "strongToWeakObjectsMapTable", v15, v16, v17, v18);
          v10 = v5->_elementsToAssertions;
          v5->_elementsToAssertions = (NSMapTable *)v9;

          elementsToAssertions = v5->_elementsToAssertions;
        }
        -[NSMapTable setObject:forKey:](elementsToAssertions, "setObject:forKey:", v6, v4, v15, v16, v17, v18);
        elements = v5->_elements;
        if (!elements)
        {
          uint64_t v12 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
          v13 = v5->_elements;
          v5->_elements = (NSPointerArray *)v12;

          elements = v5->_elements;
        }
        [(NSPointerArray *)elements addPointer:v4];
        [(SAUISystemApertureManager *)v5 _invalidateTemporallyOrderedElements];
      }
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)registerElement:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)SAUILogManager;
  if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = MEMORY[0x2611E1490](v4);
    *(_DWORD *)buf = 138543362;
    id v32 = v7;
    _os_log_impl(&dword_25E6E1000, v6, OS_LOG_TYPE_DEFAULT, "Asked to register element: %{public}@", buf, 0xCu);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v8 = [(SAUISystemApertureManager *)self registeredElements];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v28;
    *(void *)&long long v10 = 138412802;
    long long v24 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v14 = -[SAUISystemApertureManager _assertionForElement:](self, "_assertionForElement:", v13, v24);
        uint64_t v15 = v14;
        if (v14)
        {
          if ([v14 isValid])
          {
            if (SAElementIdentityEqualToIdentity())
            {
              uint64_t v16 = SAUILogManager;
              if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v24;
                id v32 = v4;
                __int16 v33 = 2112;
                uint64_t v34 = v13;
                __int16 v35 = 2112;
                v36 = v15;
                _os_log_error_impl(&dword_25E6E1000, v16, OS_LOG_TYPE_ERROR, "Invalid Client Request: Attempting to register element (%@) with same identity as already registered element (%@) with assertion: %@", buf, 0x20u);
              }
            }
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v9);
  }

  v17 = [(SAUISystemApertureManager *)self _assertionForElementCreatingIfNecessary:v4];
  if (v17)
  {
    if (SAHasIndicatorBehavior())
    {
      id v18 = [(SAUISystemApertureManager *)self _elementViewControllerForElement:v4 creatingIfNecessary:1];
      [(SAUISystemApertureManager *)self _requestHostNeedsLayout];
    }
    else
    {
      id v19 = [v4 viewProvider];
      v20 = [v19 systemApertureLayoutSpecifyingOverrider];
      [v20 addBehaviorOverridingParticipant:self];

      v21 = [(SAUISystemApertureManager *)self _elementViewControllerForElement:v4 creatingIfNecessary:1];
      [(SAUISystemApertureManager *)self _invalidatePromotedState];
      if SAHasAlertBehavior() && (objc_opt_respondsToSelector())
      {
        objc_initWeak((id *)buf, v17);
        v22 = [v21 alertAssertion];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __45__SAUISystemApertureManager_registerElement___block_invoke;
        v25[3] = &unk_26552BBF0;
        objc_copyWeak(&v26, (id *)buf);
        [v22 addInvalidationBlock:v25];

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
    }
  }

  return v17;
}

- (void)_invalidatePromotedState
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_promotedStateIsValid)
  {
    obj->_promotedStateIsValid = 0;
    [(SAUISystemApertureManager *)obj _invalidateTemporallyOrderedElements];
    [(SAUISystemApertureManager *)obj _requestHostNeedsLayout];
  }
  objc_sync_exit(obj);
}

- (void)_requestHostNeedsLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained systemApertureManagerRequestsHostNeedsLayout:self];
  }
}

- (void)_invalidateTemporallyOrderedElements
{
  obj = self;
  objc_sync_enter(obj);
  temporallyOrderedElements = obj->_temporallyOrderedElements;
  obj->_temporallyOrderedElements = 0;

  objc_sync_exit(obj);
}

- (id)_elementViewControllerForElement:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_48;
  }
  v7 = self;
  objc_sync_enter(v7);
  obj = v7;
  v8 = [(NSMapTable *)v7->_elementsToElementViewControllers objectForKey:v6];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (v9) {
    goto LABEL_47;
  }
  long long v10 = (id)SAUILogManager;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x2611E1490](v6);
    uint64_t v11 = (SAUIIndicatorElementViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v11;
    _os_log_impl(&dword_25E6E1000, v10, OS_LOG_TYPE_DEFAULT, "Asked to add view controller for element: %{public}@", buf, 0xCu);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v12 = (void *)[(NSMutableSet *)v7->_removedElementViewControllers copy];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v13)
  {
    v8 = 0;
    uint64_t v15 = *(void *)v37;
    p_indicatorElementViewController = (id *)&v7->_indicatorElementViewController;
    *(void *)&long long v14 = 138543362;
    long long v34 = v14;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v19 = objc_msgSend(v18, "elementViewProvider", v34);
        id v20 = [v19 element];
        BOOL v21 = v20 == v6;

        if (v21)
        {
          v22 = v18;

          [(NSMutableSet *)obj->_removedElementViewControllers removeObject:v22];
          if (SAHasIndicatorBehavior()) {
            objc_storeWeak(p_indicatorElementViewController, v22);
          }
          v23 = SAUILogManager;
          if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v34;
            v42 = v22;
            _os_log_impl(&dword_25E6E1000, v23, OS_LOG_TYPE_DEFAULT, "Adding back element view controller that had been removed: %{public}@", buf, 0xCu);
          }
          v8 = v22;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v13);

    if (v8) {
      goto LABEL_44;
    }
  }
  else
  {
  }
  if (SAHasIndicatorBehavior())
  {
    long long v24 = [SAUIIndicatorElementViewController alloc];
    v25 = [v6 viewProvider];
    v8 = [(SAUIIndicatorElementViewController *)v24 initWithIndicatorElementViewProvider:v25];

    [(SAUIIndicatorElementViewController *)v8 setLayoutHost:obj];
    objc_storeWeak((id *)&obj->_indicatorElementViewController, v8);
    goto LABEL_43;
  }
  if (((objc_opt_respondsToSelector() & 1) == 0 || ([v6 hasAlertBehavior] & 1) == 0)
    && ((objc_opt_respondsToSelector() & 1) == 0 || ![v6 hasActivityBehavior]))
  {
    long long v28 = (id)SAUILogManager;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = MEMORY[0x2611E1490](v6);
      -[SAUISystemApertureManager _elementViewControllerForElement:creatingIfNecessary:](v29, buf, v28);
    }

    v8 = 0;
    goto LABEL_47;
  }
  id v26 = [v6 viewProvider];
  if (objc_opt_respondsToSelector())
  {
    long long v27 = [[SAUIMonolithicElementViewController alloc] initWithMonolithicElementViewProvider:v26];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_42;
    }
    long long v27 = [[SAUIElementViewController alloc] initWithElementViewProvider:v26];
  }
  v8 = (SAUIIndicatorElementViewController *)v27;
LABEL_42:
  [(SAUIIndicatorElementViewController *)v8 setLayoutMode:0 reason:4];
  [(SAUIIndicatorElementViewController *)v8 setLayoutHost:obj];

LABEL_43:
  if (v8)
  {
LABEL_44:
    elementsToElementViewControllers = obj->_elementsToElementViewControllers;
    if (!elementsToElementViewControllers)
    {
      uint64_t v31 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      id v32 = obj->_elementsToElementViewControllers;
      obj->_elementsToElementViewControllers = (NSMapTable *)v31;

      elementsToElementViewControllers = obj->_elementsToElementViewControllers;
    }
    [(NSMapTable *)elementsToElementViewControllers setObject:v8 forKey:v6];
    [(SAUIIndicatorElementViewController *)v8 addElementViewControllingObserver:obj];
  }
LABEL_47:
  objc_sync_exit(obj);

LABEL_48:
  return v8;
}

- (SAUIElementViewControlling)indicatorElementViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indicatorElementViewController);
  BOOL v4 = [WeakRetained elementViewProvider];
  v5 = [v4 element];
  id v6 = [(SAUISystemApertureManager *)self _assertionForElement:v5];
  if ([v6 isValid]) {
    v7 = WeakRetained;
  }
  else {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (id)_assertionForElement:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMapTable *)v5->_elementsToAssertions objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)_reevaluatePromotedElements
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_25E6E1000, log, OS_LOG_TYPE_ERROR, "Element in custom layout mode or with alert behavior isn't first: element: %{public}@; ordered elements: %{public}@",
    buf,
    0x16u);
}

- (id)_temporallyOrderedVisibleAlertAndActivityElements
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  [(SAUISystemApertureManager *)v2 _compactElements];
  if (!v2->_temporallyOrderedElements && [(NSPointerArray *)v2->_elements count])
  {
    v3 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSPointerArray count](v2->_elements, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = (void *)[(NSPointerArray *)v2->_elements copy];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
          BOOL v9 = [(NSMapTable *)v2->_elementsToAssertions objectForKey:v8];
          if ([v9 isValid] && (SAHasIndicatorBehavior() & 1) == 0)
          {
            long long v10 = SAUILayoutSpecifyingOverriderForElement(v8);
            BOOL v11 = [v10 preferredLayoutMode] > 0;

            if (v11) {
              [(NSArray *)v3 addObject:v8];
            }
          }
          else
          {
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v12 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v5 = v12;
      }
      while (v12);
    }

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __78__SAUISystemApertureManager__temporallyOrderedVisibleAlertAndActivityElements__block_invoke;
    v17[3] = &unk_26552BEC0;
    v17[4] = v2;
    [(NSArray *)v3 sortUsingComparator:v17];
    temporallyOrderedElements = v2->_temporallyOrderedElements;
    v2->_temporallyOrderedElements = v3;
    long long v14 = v3;
  }
  uint64_t v15 = v2->_temporallyOrderedElements;
  objc_sync_exit(v2);

  return v15;
}

- (unint64_t)_maximumNumberOfSimultaneouslyVisibleElements
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [WeakRetained systemApertureManagerMaximumNumberOfSimultaneouslyVisibleElements:self];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)_compactElements
{
  obj = self;
  objc_sync_enter(obj);
  if ([(NSPointerArray *)obj->_elements sa_compact]) {
    [(SAUISystemApertureManager *)obj _invalidateTemporallyOrderedElements];
  }
  objc_sync_exit(obj);
}

- (NSArray)registeredElements
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSPointerArray *)v2->_elements sa_compact];
  v3 = [(NSPointerArray *)v2->_elements allObjects];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (CGRect)interSensorRegionInContentView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained interSensorRegionInContentView:v4];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    SAUIRegisterSystemApertureLogging();
  }
}

- (SAUISystemApertureManager)initWithElementAuthority:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SAUISystemApertureManager.m", 68, @"Invalid parameter not satisfying: %@", @"elementAuthority" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SAUISystemApertureManager;
  double v7 = [(SAUISystemApertureManager *)&v11 init];
  double v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_elementAuthority, a3);
  }

  return v8;
}

void __45__SAUISystemApertureManager_registerElement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained invalidateWithReason:v4];
}

- (id)elementViewControllerForElement:(id)a3
{
  return [(SAUISystemApertureManager *)self _elementViewControllerForElement:a3 creatingIfNecessary:0];
}

- (void)elementRequestsNegativeResponse:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained elementRequestsNegativeResponse:v5];
  }
}

- (void)elementRequestsSignificantUpdateTransition:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained elementRequestsSignificantUpdateTransition:v5];
  }
}

- (double)alertingDurationForHost:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v10 = [MEMORY[0x263F08690] currentHandler];
  }
  [WeakRetained alertingDurationForHost:v5];
  double v8 = v7;

  return v8;
}

- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(SAUISystemApertureManager *)self _invalidatePromotedState];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained preferredLayoutModeDidInvalidateForLayoutSpecifier:v4];
  }
}

- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3
{
  if (a3)
  {
    p_delegate = &self->_delegate;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:v4];
  }
}

- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3
{
  if (a3)
  {
    p_delegate = &self->_delegate;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained menuPresentationRequestDidChangeForLayoutSpecifier:v4];
  }
}

- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "edgeOutsetsForSize:", width, height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.trailing = v17;
  result.bottom = v16;
  result.leading = v15;
  result.top = v14;
  return result;
}

- (void)preferredPromotionDidInvalidateForLayoutSpecifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    [(SAUISystemApertureManager *)self _invalidatePromotedState];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained preferredPromotionDidInvalidateForLayoutSpecifier:v6];
    }

    id v4 = v6;
  }
}

- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v9 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained concentricPaddingForProvidedView:v6 fromViewProvider:v7];
    double v9 = v10;
  }

  return v9;
}

- (CGRect)sensorRegionObstructingViewProvider:(id)a3 inContentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained sensorRegionObstructingViewProvider:v6 inContentView:v7];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)sensorRegionInContentView:(id)a3 fromViewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained sensorRegionInContentView:v6 fromViewProvider:v7];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)viewProviderShouldMakeSensorShadowVisible:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v6 = [WeakRetained viewProviderShouldMakeSensorShadowVisible:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (double)viewProviderSensorShadowOpacityFactor:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained viewProviderSensorShadowOpacityFactor:v4];
    double v6 = v7;
  }

  return v6;
}

- (CGSize)maximumAvailableSizeForProvidedMinimalView:(id)a3 fromViewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained maximumAvailableSizeForProvidedMinimalView:v6 fromViewProvider:v7];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x263F001B0];
    double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedLeadingView:(id)a3 fromViewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained maximumAvailableSizeForProvidedLeadingView:v6 fromViewProvider:v7];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x263F001B0];
    double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedTrailingView:(id)a3 fromViewProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained maximumAvailableSizeForProvidedTrailingView:v6 fromViewProvider:v7];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x263F001B0];
    double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)_axLayoutSpecifierRequestsDiminishment:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _axLayoutSpecifierRequestsDiminishment:v5];
  }
}

- (BOOL)_axLayoutSpecifierRequestsCollapseIfExpandedByUserInteraction:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v6 = [WeakRetained _axLayoutSpecifierRequestsCollapseIfExpandedByUserInteraction:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (int64_t)behaviorOverridingRole
{
  return 2;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [v8 layoutMode];
  double v10 = [v8 layoutSpecifyingOverridingParticipantSubordinateToParticipant:self thatRespondsToSelector:sel_setLayoutMode_reason_forTargetWithOverrider_];
  [v10 setLayoutMode:a3 reason:a4 forTargetWithOverrider:v8];

  uint64_t v11 = [v8 layoutMode];
  if (v9 != v11)
  {
    [(SAUISystemApertureManager *)self _invalidatePromotedState];
  }
}

- (void)elementViewControllingDidDisappear:(id)a3
{
  id v12 = a3;
  id v4 = [v12 elementViewProvider];
  id v5 = [v4 element];
  char v6 = [(SAUISystemApertureManager *)self _assertionForElement:v5];
  char v7 = [v6 isValid];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v12;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        double v10 = v9;
      }
      else {
        double v10 = 0;
      }
    }
    else
    {
      double v10 = 0;
    }
    id v11 = v10;

    [(SAUISystemApertureManager *)self _removeElementViewController:v11];
    [(SAUISystemApertureManager *)self _purgeRemovedElementViewControllers];
  }
}

- (void)_removeElementViewController:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SAUILogManager;
  if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_25E6E1000, v5, OS_LOG_TYPE_DEFAULT, "Asked to remove element view controller: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  if (v4)
  {
    char v6 = self;
    objc_sync_enter(v6);
    char v7 = [v4 elementViewProvider];
    uint64_t v8 = [v7 element];

    id v9 = [(SAUISystemApertureManager *)v6 elementViewControllerForElement:v8];
    if (v9 == v4)
    {
      removedElementViewControllers = v6->_removedElementViewControllers;
      if (!removedElementViewControllers)
      {
        id v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
        double v13 = v6->_removedElementViewControllers;
        v6->_removedElementViewControllers = v12;

        removedElementViewControllers = v6->_removedElementViewControllers;
      }
      [(NSMutableSet *)removedElementViewControllers addObject:v4];
      [(NSMapTable *)v6->_elementsToElementViewControllers removeObjectForKey:v8];
      [v4 removeElementViewControllingObserver:v6];
      double v14 = SAUILogManager;
      if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        id v17 = v4;
        _os_log_impl(&dword_25E6E1000, v14, OS_LOG_TYPE_DEFAULT, "Removed element view controller: %{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      double v10 = (id)SAUILogManager;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        double v15 = MEMORY[0x2611E1490](v8);
        int v16 = 138543874;
        id v17 = v15;
        __int16 v18 = 2114;
        id v19 = v9;
        __int16 v20 = 2114;
        id v21 = v4;
        _os_log_error_impl(&dword_25E6E1000, v10, OS_LOG_TYPE_ERROR, "Asked to remove element view controller with element that is associated with a different view controller: element: %{public}@; expected view controller: %{public}@; argument view controller: %{public}@",
          (uint8_t *)&v16,
          0x20u);
      }
    }

    objc_sync_exit(v6);
  }
}

- (void)_purgeRemovedElementViewControllers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = (void *)[(NSMutableSet *)v2->_removedElementViewControllers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v5 = 138543362;
    long long v15 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = SAUILogManager;
        if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          id v21 = v8;
          _os_log_impl(&dword_25E6E1000, v9, OS_LOG_TYPE_DEFAULT, "Purging removed element view controller: %{public}@", buf, 0xCu);
        }
        -[NSMutableSet removeObject:](v2->_removedElementViewControllers, "removeObject:", v8, v15);
        double v10 = [v8 elementViewProvider];
        id v11 = [v10 element];

        id v12 = [(SAUISystemApertureManager *)v2 _invalidatedAssertionForElement:v11];
        [(SAUISystemApertureManager *)v2 _removeInvalidatedAssertionForElement:v11];
        double v13 = SAUILayoutSpecifyingOverriderForElement(v11);
        if (v12) {
          uint64_t v14 = [v12 invalidationLayoutModeChangeReason];
        }
        else {
          uint64_t v14 = 0;
        }
        [v13 setLayoutMode:-1 reason:v14];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __78__SAUISystemApertureManager__temporallyOrderedVisibleAlertAndActivityElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__SAUISystemApertureManager__temporallyOrderedVisibleAlertAndActivityElements__block_invoke_2;
  v12[3] = &unk_26552BE98;
  v12[4] = *(void *)(a1 + 32);
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = (void (**)(void, void))MEMORY[0x2611E1790](v12);
  uint64_t v7 = ((void (**)(void, id))v6)[2](v6, v5);

  uint64_t v8 = ((void (**)(void, id))v6)[2](v6, v4);

  [v7 timeIntervalSinceDate:v8];
  if (v9 > 0.0) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }

  return v10;
}

id __78__SAUISystemApertureManager__temporallyOrderedVisibleAlertAndActivityElements__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v3];
  id v5 = [v4 creationDate];

  if (SAHasActivityBehavior())
  {
    uint64_t v6 = [*(id *)(a1 + 32) elementViewControllerForElement:v3];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v6 temporallyOrderedAlertingActivityAssertions];
      uint64_t v8 = [v7 lastObject];
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [v8 creationDate];
    uint64_t v10 = (void *)v9;
    if (v9) {
      id v11 = (void *)v9;
    }
    else {
      id v11 = v5;
    }
    id v12 = v11;

    id v5 = v12;
  }

  return v5;
}

- (BOOL)_elementRequiresBeingDisplayedAlone:(id)a3
{
  id v4 = a3;
  if ((SAHasAlertBehavior() & 1) != 0
    || (SAUILayoutSpecifyingOverriderForElement(v4),
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 layoutModePreference],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 preferredLayoutMode],
        v6,
        v5,
        v7 == 3))
  {
    char v8 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    char v8 = [(SAElementConsidering *)self->_elementAuthority elementRequiresBeingDisplayedAlone:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

id __56__SAUISystemApertureManager__reevaluatePromotedElements__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 elementViewProvider];
  id v3 = [v2 element];

  return v3;
}

id __56__SAUISystemApertureManager__reevaluatePromotedElements__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 elementViewProvider];
  id v3 = [v2 element];
  id v4 = MEMORY[0x2611E1490]();

  return v4;
}

- (void)_elementAssertionDidInvalidate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 element];
  uint64_t v6 = (void *)SAUILogManager;
  if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    char v8 = MEMORY[0x2611E1490](v5);
    int v14 = 138543362;
    long long v15 = v8;
    _os_log_impl(&dword_25E6E1000, v7, OS_LOG_TYPE_DEFAULT, "Assertion for element did invalidate: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  [(SAUISystemApertureManager *)self _addInvalidatedAssertion:v4 forElement:v5];

  [(SAUISystemApertureManager *)self _removeAssertionForElement:v5];
  uint64_t v9 = [(SAUISystemApertureManager *)self elementViewControllerForElement:v5];
  uint64_t v10 = v9;
  if (v9 && (![v9 isViewLoaded] || !objc_msgSend(v10, "_appearState")))
  {
    id v11 = (void *)SAUILogManager;
    if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      double v13 = MEMORY[0x2611E1490](v5);
      int v14 = 138543362;
      long long v15 = v13;
      _os_log_impl(&dword_25E6E1000, v12, OS_LOG_TYPE_DEFAULT, "Removing unpresented element view controller for invalidated element: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    [(SAUISystemApertureManager *)self _removeElementViewController:v10];
    [(SAUISystemApertureManager *)self _purgeRemovedElementViewControllers];
  }
  if (SAHasIndicatorBehavior()) {
    [(SAUISystemApertureManager *)self _requestHostNeedsLayout];
  }
  else {
    [(SAUISystemApertureManager *)self _invalidatePromotedState];
  }
}

void __69__SAUISystemApertureManager__assertionForElementCreatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = objc_opt_class();
  id v8 = v3;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v8;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  [WeakRetained _elementAssertionDidInvalidate:v7];
}

- (void)_removeAssertionForElement:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(SAUISystemApertureManager *)v5 _assertionForElement:v8];
    if (v6)
    {
      [(SAUISystemApertureManager *)v5 _compactElements];
      for (unint64_t i = 0; i < [(NSPointerArray *)v5->_elements count]; ++i)
      {
        if ([(NSPointerArray *)v5->_elements pointerAtIndex:i] == v8)
        {
          if (i != 0x7FFFFFFFFFFFFFFFLL)
          {
            [(NSPointerArray *)v5->_elements removePointerAtIndex:i];
            [(NSMapTable *)v5->_elementsToAssertions removeObjectForKey:v8];
            [(SAUISystemApertureManager *)v5 _compactElements];
            [(SAUISystemApertureManager *)v5 _invalidateTemporallyOrderedElements];
          }
          break;
        }
      }
    }

    objc_sync_exit(v5);
    id v4 = v8;
  }
}

- (void)_addInvalidatedAssertion:(id)a3 forElement:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (v7)
  {
    if (!v13 || [v13 isValid])
    {
      id v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"SAUISystemApertureManager.m", 617, @"Invalidated assertion argument either missing, or valid: %@", v13 object file lineNumber description];
    }
    id v8 = self;
    objc_sync_enter(v8);
    elementsToInvalidatedAssertions = v8->_elementsToInvalidatedAssertions;
    if (!elementsToInvalidatedAssertions)
    {
      uint64_t v10 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
      id v11 = v8->_elementsToInvalidatedAssertions;
      v8->_elementsToInvalidatedAssertions = (NSMapTable *)v10;

      elementsToInvalidatedAssertions = v8->_elementsToInvalidatedAssertions;
    }
    [(NSMapTable *)elementsToInvalidatedAssertions setObject:v13 forKey:v7];
    objc_sync_exit(v8);
  }
}

- (id)_invalidatedAssertionForElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMapTable *)v5->_elementsToInvalidatedAssertions objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)_removeInvalidatedAssertionForElement:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMapTable *)v4->_elementsToInvalidatedAssertions removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (SAUISystemApertureManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SAUISystemApertureManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedElementViewControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_indicatorElementViewController);
  objc_storeStrong((id *)&self->_mostPromotedElements, 0);
  objc_storeStrong((id *)&self->_temporallyOrderedElements, 0);
  objc_storeStrong((id *)&self->_elementsToInvalidatedAssertions, 0);
  objc_storeStrong((id *)&self->_elementsToAssertions, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_removedElementViewControllers, 0);
  objc_storeStrong((id *)&self->_elementsToElementViewControllers, 0);
  objc_storeStrong((id *)&self->_elementAuthority, 0);
}

- (void)_elementViewControllerForElement:(os_log_t)log creatingIfNecessary:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_25E6E1000, log, OS_LOG_TYPE_ERROR, "Attempt to add element that has no known behavior: %{public}@", buf, 0xCu);
}

@end