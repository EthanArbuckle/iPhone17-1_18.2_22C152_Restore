@interface UIViewController(PXProgrammaticNavigation)
- (id)_nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation;
- (id)_nextExistingViewControllerOnRouteToDestination:()PXProgrammaticNavigation;
- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation;
- (id)px_navigationDestination;
- (uint64_t)provideViewControllersForDestination:()PXProgrammaticNavigation options:completionHandler:;
- (uint64_t)px_forwardingNavigationParticipantForDestination:()PXProgrammaticNavigation;
- (uint64_t)px_navigateToStateAllowingTabSwitchingWithOptions:()PXProgrammaticNavigation completionHandler:;
- (uint64_t)routingOptionsForDestination:()PXProgrammaticNavigation;
- (void)_navigateToDestination:()PXProgrammaticNavigation options:completionHandler:;
- (void)_px_prepareNavigationFromViewController:()PXProgrammaticNavigation routingOptions:options:completionHandler:;
- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:;
- (void)px_dismissPresentedViewControllerWithOptions:()PXProgrammaticNavigation completionHandler:;
@end

@implementation UIViewController(PXProgrammaticNavigation)

- (id)px_navigationDestination
{
  v1 = objc_msgSend(a1, "px_forwardingNavigationParticipantForDestination:", 0);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "px_navigationDestination");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_px_prepareNavigationFromViewController:()PXProgrammaticNavigation routingOptions:options:completionHandler:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if (v9 != a1) {
    PXAssertGetLog();
  }
  objc_msgSend(a1, "px_dismissPresentedViewControllerWithOptions:completionHandler:", a5, v10);
}

- (uint64_t)provideViewControllersForDestination:()PXProgrammaticNavigation options:completionHandler:
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(a5 + 16))(a5, MEMORY[0x1E4F1CBF0], 2, 0);
}

- (void)_navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a1;
  v12 = (void *)MEMORY[0x1E4F1CAD0];
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
  v24[2] = __95__UIViewController_PXProgrammaticNavigation___navigateToDestination_options_completionHandler___block_invoke;
  v24[3] = &unk_1E5DC7190;
  v24[4] = v11;
  id v25 = v19;
  uint64_t v28 = a2;
  uint64_t v29 = a4;
  id v26 = v9;
  id v27 = v10;
  id v21 = v10;
  id v22 = v9;
  id v23 = v19;
  objc_msgSend(v11, "_px_prepareNavigationFromViewController:routingOptions:options:completionHandler:", v23, v20, a4, v24);
}

- (id)_nextExistingViewControllerOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4 = a1;
  while (1)
  {
    v5 = v4;
    id v4 = [v4 nextExistingParticipantOnRouteToDestination:a3];

    if (!v4) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (id)_nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__227025;
  id v21 = __Block_byref_object_dispose__227026;
  id v22 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __91__UIViewController_PXProgrammaticNavigation___nextExistingParticipantOnRouteToDestination___block_invoke;
  v14 = &unk_1E5DC7168;
  v16 = &v17;
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void *, void *))_Block_copy(&v11);
  v7 = objc_msgSend(a1, "px_nextViewControllerInNavigationController", v11, v12, v13, v14);
  v6[2](v6, v7);

  v8 = [a1 presentedViewController];
  v6[2](v6, v8);

  id v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v8 = a5;
  id v9 = a3;
  objc_msgSend(a1, "px_forwardingNavigationParticipantForDestination:", v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector()) {
    [v10 navigateToDestination:v9 options:a4 completionHandler:v8];
  }
  else {
    [a1 _navigateToDestination:v9 options:a4 completionHandler:v8];
  }
}

- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "px_forwardingNavigationParticipantForDestination:", v4);
  id v6 = v5;
  if (v5) {
    [v5 nextExistingParticipantOnRouteToDestination:v4];
  }
  else {
  v7 = [a1 _nextExistingParticipantOnRouteToDestination:v4];
  }

  return v7;
}

- (uint64_t)routingOptionsForDestination:()PXProgrammaticNavigation
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "px_forwardingNavigationParticipantForDestination:", v4);
  id v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 routingOptionsForDestination:v4];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)px_navigateToStateAllowingTabSwitchingWithOptions:()PXProgrammaticNavigation completionHandler:
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, 1, 0);
}

- (void)px_dismissPresentedViewControllerWithOptions:()PXProgrammaticNavigation completionHandler:
{
  id v6 = a4;
  uint64_t v7 = [a1 presentedViewController];
  if (v7)
  {
    if (objc_opt_respondsToSelector() & 1) == 0 || (int v8 = [v7 isReadyForDismissal], (a3) || v8)
    {
      id v9 = v7;
      if (objc_opt_respondsToSelector()) {
        [v9 prepareForDismissal];
      }

      id v10 = [v9 presentingViewController];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __109__UIViewController_PXProgrammaticNavigation__px_dismissPresentedViewControllerWithOptions_completionHandler___block_invoke;
      v11[3] = &unk_1E5DD3128;
      id v12 = v6;
      [v10 dismissViewControllerAnimated:0 completion:v11];
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 3, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
  }
}

- (uint64_t)px_forwardingNavigationParticipantForDestination:()PXProgrammaticNavigation
{
  return 0;
}

@end