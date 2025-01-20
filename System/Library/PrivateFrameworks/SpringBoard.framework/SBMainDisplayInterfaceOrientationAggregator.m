@interface SBMainDisplayInterfaceOrientationAggregator
- (NSArray)interfaceOrientationSources;
- (SBMainDisplayInterfaceOrientationAggregator)init;
- (id)_highestSourceAtOrBelow:(double)a3 amongSources:(id)a4;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)highestActiveInterfaceOrientationSource;
- (id)highestActiveInterfaceOrientationSourceBelow:(double)a3;
- (id)highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:(double)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_layoutOrientation;
- (int64_t)activeInterfaceOrientation;
- (int64_t)activeInterfaceOrientationAtOrBelow:(double)a3;
- (int64_t)activeInterfaceOrientationBelow:(double)a3;
- (void)_sortSources:(id)a3;
- (void)dealloc;
@end

@implementation SBMainDisplayInterfaceOrientationAggregator

- (SBMainDisplayInterfaceOrientationAggregator)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBMainDisplayInterfaceOrientationAggregator;
  v2 = [(SBMainDisplayInterfaceOrientationAggregator *)&v9 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v7, &location);
    uint64_t v4 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __51__SBMainDisplayInterfaceOrientationAggregator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplayInterfaceOrientationAggregator;
  [(SBMainDisplayInterfaceOrientationAggregator *)&v3 dealloc];
}

- (int64_t)activeInterfaceOrientation
{
  return [(SBMainDisplayInterfaceOrientationAggregator *)self activeInterfaceOrientationAtOrBelow:1.79769313e308];
}

- (NSArray)interfaceOrientationSources
{
  objc_super v3 = [MEMORY[0x1E4F43058] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
  uint64_t v4 = objc_msgSend(v3, "bs_objectsOfClass:", objc_opt_class());

  v5 = (void *)[v4 mutableCopy];
  [(SBMainDisplayInterfaceOrientationAggregator *)self _sortSources:v5];

  return (NSArray *)v5;
}

- (int64_t)activeInterfaceOrientationBelow:(double)a3
{
  objc_super v3 = [(SBMainDisplayInterfaceOrientationAggregator *)self highestActiveInterfaceOrientationSourceBelow:a3];
  int64_t v4 = [v3 activeInterfaceOrientation];

  return v4;
}

- (int64_t)activeInterfaceOrientationAtOrBelow:(double)a3
{
  objc_super v3 = [(SBMainDisplayInterfaceOrientationAggregator *)self highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:a3];
  int64_t v4 = [v3 activeInterfaceOrientation];

  return v4;
}

- (id)highestActiveInterfaceOrientationSource
{
  return [(SBMainDisplayInterfaceOrientationAggregator *)self highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:1.79769313e308];
}

- (id)highestActiveInterfaceOrientationSourceIgnoringSourcesAbove:(double)a3
{
  v5 = [(SBMainDisplayInterfaceOrientationAggregator *)self interfaceOrientationSources];
  v6 = [(SBMainDisplayInterfaceOrientationAggregator *)self _highestSourceAtOrBelow:v5 amongSources:a3];

  return v6;
}

- (id)highestActiveInterfaceOrientationSourceBelow:(double)a3
{
  double v4 = a3 + -0.01;
  v5 = [(SBMainDisplayInterfaceOrientationAggregator *)self interfaceOrientationSources];
  v6 = [(SBMainDisplayInterfaceOrientationAggregator *)self _highestSourceAtOrBelow:v5 amongSources:v4];

  return v6;
}

- (int64_t)_layoutOrientation
{
  v2 = [(id)SBApp windowSceneManager];
  objc_super v3 = [v2 activeDisplayWindowScene];
  double v4 = [v3 switcherController];
  v5 = [v4 layoutState];
  int64_t v6 = [v5 interfaceOrientation];

  return v6;
}

- (void)_sortSources:(id)a3
{
}

uint64_t __60__SBMainDisplayInterfaceOrientationAggregator__sortSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 orientationSourceLevel];
  double v6 = v5;
  [v4 orientationSourceLevel];
  double v8 = v7;

  uint64_t v9 = -1;
  if (v8 <= v6) {
    uint64_t v9 = 1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (id)_highestSourceAtOrBelow:(double)a3 amongSources:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    double v6 = [v5 firstObject];
    [v6 orientationSourceLevel];
    double v8 = v7;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "orientationSourceLevel", (void)v21);
          double v16 = v15;
          if ([v14 isActive]) {
            BOOL v17 = v16 < v8;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17 && v16 <= a3)
          {
            id v19 = v14;

            double v6 = v19;
            double v8 = v16;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)description
{
  return [(SBMainDisplayInterfaceOrientationAggregator *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBMainDisplayInterfaceOrientationAggregator *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v2 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(id)SBApp activeInterfaceOrientation];
  objc_super v3 = BSInterfaceOrientationDescription();
  id v4 = (id)[v2 appendObject:v3 withName:@"orientation"];

  return v2;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBMainDisplayInterfaceOrientationAggregator *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBMainDisplayInterfaceOrientationAggregator *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 40) interfaceOrientationSources];
  id v4 = [v3 valueForKey:@"orientationSourceDescription"];
  id v5 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v2 appendArraySection:v4 withName:@"active orientation sources" multilinePrefix:v5 skipIfEmpty:1];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 activeMultilinePrefix];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v30[3] = &unk_1E6AF5290;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v31 = v8;
  uint64_t v32 = v9;
  [v6 appendBodySectionWithName:@"notions of interface orientation" multilinePrefix:v7 block:v30];

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v10 activeMultilinePrefix];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v28[3] = &unk_1E6AF4AC0;
  id v29 = *(id *)(a1 + 32);
  [v10 appendBodySectionWithName:@"notions of device orientation" multilinePrefix:v11 block:v28];

  uint64_t v12 = objc_opt_class();
  v13 = +[SBUIController sharedInstance];
  v14 = [v13 window];
  double v15 = [v14 rootViewController];
  double v16 = SBSafeCast(v12, v15);

  BOOL v17 = *(void **)(a1 + 32);
  v18 = [v16 _autorotationPreventionReasons];
  id v19 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v17 appendArraySection:v18 withName:@"home screen autorotation prevention reasons" multilinePrefix:v19 skipIfEmpty:1];

  id v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend((id)SBApp, "wantsOrientationEvents"), @"springBoardWantsOrientationEvents");
  long long v21 = *(void **)(a1 + 32);
  long long v22 = +[SBOrientationLockManager sharedInstance];
  id v23 = (id)[v21 appendObject:v22 withName:@"orientationLockManager"];

  long long v24 = *(void **)(a1 + 32);
  v25 = [MEMORY[0x1E4F43058] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
  uint64_t v26 = objc_msgSend(v25, "bs_filter:", &__block_literal_global_74);
  v27 = [*(id *)(a1 + 32) activeMultilinePrefix];
  [v24 appendArraySection:v26 withName:@"disabled main screen active orientation windows" multilinePrefix:v27 skipIfEmpty:1];
}

void __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [(id)SBApp activeInterfaceOrientation];
  objc_super v3 = BSInterfaceOrientationDescription();
  id v4 = (id)[v2 appendObject:v3 withName:@"activeInterfaceOrientation"];

  id v5 = *(void **)(a1 + 32);
  [(id)SBApp statusBarOrientationForEmbeddedDisplay];
  id v6 = BSInterfaceOrientationDescription();
  id v7 = (id)[v5 appendObject:v6 withName:@"statusBarOrientation"];

  id v8 = *(void **)(a1 + 32);
  SBSystemGestureOrientation();
  uint64_t v9 = BSInterfaceOrientationDescription();
  id v10 = (id)[v8 appendObject:v9 withName:@"systemGestureOrientation"];

  uint64_t v11 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _layoutOrientation];
  BSInterfaceOrientationDescription();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = (id)[v11 appendObject:v13 withName:@"layoutOrientation"];
}

void __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [MEMORY[0x1E4F42948] currentDevice];
  [v3 orientation];
  id v4 = BSDeviceOrientationDescription();
  id v5 = (id)[v2 appendObject:v4 withName:@"uiDeviceOrientation"];

  id v6 = *(void **)(a1 + 32);
  BKHIDServicesGetNonFlatDeviceOrientation();
  id v7 = BSDeviceOrientationDescription();
  id v8 = (id)[v6 appendObject:v7 withName:@"bksNonFlatDeviceOrientation"];

  uint64_t v9 = *(void **)(a1 + 32);
  BKHIDServicesGetCurrentDeviceOrientation();
  id v10 = BSDeviceOrientationDescription();
  id v11 = (id)[v9 appendObject:v10 withName:@"bksCurrentDeviceOrientation"];

  int IsOrientationLockedWithOrientation = BKSHIDServicesIsOrientationLockedWithOrientation();
  id v13 = *(void **)(a1 + 32);
  if (IsOrientationLockedWithOrientation)
  {
    v14 = BSDeviceOrientationDescription();
    id v15 = (id)[v13 appendObject:v14 withName:@"bksLockedOrientation"];
  }
  else
  {
    id v16 = (id)[v13 appendObject:@"(unlocked)" withName:@"bksLockedOrientation"];
  }
}

uint64_t __85__SBMainDisplayInterfaceOrientationAggregator_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isDisablingInterfaceOrientationChanges];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end