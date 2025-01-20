@interface UINavigationController(PXProgrammaticNavigation)
- (BOOL)routingOptionsForDestination:()PXProgrammaticNavigation;
- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation;
- (id)px_navigationDestination;
- (void)_px_prepareNavigationFromViewController:()PXProgrammaticNavigation routingOptions:options:completionHandler:;
- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:;
- (void)px_navigateToStateAllowingTabSwitchingWithOptions:()PXProgrammaticNavigation completionHandler:;
@end

@implementation UINavigationController(PXProgrammaticNavigation)

- (id)px_navigationDestination
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(a1, "viewControllers", 0);
  v2 = [v1 reverseObjectEnumerator];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "px_navigationDestination");
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a1;
  long long v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = [v11 childViewControllers];
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }
  v16 = [v12 setWithArray:v15];

  v17 = [v11 _nextExistingViewControllerOnRouteToDestination:v9];
  if (v17)
  {
    v18 = v11;
    while ([v16 containsObject:v17])
    {
      id v19 = v17;

      v17 = [v19 _nextExistingViewControllerOnRouteToDestination:v9];

      v18 = v19;
      if (!v17) {
        goto LABEL_11;
      }
    }
    id v19 = v18;
  }
  else
  {
    id v19 = v11;
  }
LABEL_11:
  uint64_t v20 = [v19 routingOptionsForDestination:v9];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __100__UINavigationController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke;
  v24[3] = &unk_1E5DC7258;
  uint64_t v28 = a2;
  uint64_t v29 = v20;
  v24[4] = v11;
  id v25 = v19;
  uint64_t v30 = a4;
  id v26 = v9;
  id v27 = v10;
  id v21 = v10;
  id v22 = v9;
  id v23 = v19;
  objc_msgSend(v11, "_px_prepareNavigationFromViewController:routingOptions:options:completionHandler:", v23, v20, a4, v24);
}

- (void)_px_prepareNavigationFromViewController:()PXProgrammaticNavigation routingOptions:options:completionHandler:
{
  id v11 = a3;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __133__UINavigationController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke;
  v16[3] = &unk_1E5DC7208;
  v16[4] = a1;
  id v17 = v11;
  id v18 = v12;
  uint64_t v19 = a2;
  uint64_t v20 = a5;
  uint64_t v21 = a4;
  v15.receiver = a1;
  v15.super_class = (Class)UINavigationController_0;
  id v13 = v11;
  id v14 = v12;
  objc_msgSendSuper2(&v15, sel__px_prepareNavigationFromViewController_routingOptions_options_completionHandler_, a1, a4, a5, v16);
}

- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4 = a3;
  uint64_t v5 = [a1 viewControllers];
  v6 = [v5 firstObject];

  uint64_t v7 = [v6 routingOptionsForDestination:v4];
  if (v7) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)routingOptionsForDestination:()PXProgrammaticNavigation
{
  id v4 = a3;
  uint64_t v5 = [a1 viewControllers];
  v6 = [v5 firstObject];

  uint64_t v7 = [v6 routingOptionsForDestination:v4];
  return v7 != 0;
}

- (void)px_navigateToStateAllowingTabSwitchingWithOptions:()PXProgrammaticNavigation completionHandler:
{
  id v6 = a4;
  uint64_t v7 = [a1 topViewController];
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "px_navigateToStateAllowingTabSwitchingWithOptions:completionHandler:", a3, v6);
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)UINavigationController_0;
    objc_msgSendSuper2(&v9, sel_px_navigateToStateAllowingTabSwitchingWithOptions_completionHandler_, a3, v6);
  }
}

@end