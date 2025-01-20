@interface UITabBarController(PXProgrammaticNavigation)
- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation;
- (id)px_navigationDestination;
- (void)_px_prepareNavigationFromViewController:()PXProgrammaticNavigation routingOptions:options:completionHandler:;
- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:;
- (void)px_switchToTabAndNavigateToDestination:()PXProgrammaticNavigation options:completionHandler:;
- (void)routingOptionsForDestination:()PXProgrammaticNavigation;
@end

@implementation UITabBarController(PXProgrammaticNavigation)

- (id)px_navigationDestination
{
  v1 = [a1 selectedViewController];
  v2 = objc_msgSend(v1, "px_navigationDestination");

  return v2;
}

- (void)px_switchToTabAndNavigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v7 = a3;
  id v8 = a5;
  [a1 viewControllers];
  objc_claimAutoreleasedReturnValue();
  v7;
  PXFind();
}

- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v9 = a3;
  id v10 = a5;
  v11 = [a1 _nextExistingViewControllerOnRouteToDestination:v9];
  if (v11)
  {
    v12 = [a1 selectedViewController];
    if (v11 == v12) {
      v13 = v11;
    }
    else {
      v13 = a1;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = a1;
  }
  uint64_t v15 = [v14 routingOptionsForDestination:v9];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__UITabBarController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke;
  v18[3] = &unk_1E5DD34E8;
  v18[4] = a1;
  id v19 = v9;
  uint64_t v21 = a2;
  uint64_t v22 = a4;
  id v20 = v10;
  id v16 = v10;
  id v17 = v9;
  objc_msgSend(a1, "_px_prepareNavigationFromViewController:routingOptions:options:completionHandler:", v14, v15, a4, v18);
}

- (void)_px_prepareNavigationFromViewController:()PXProgrammaticNavigation routingOptions:options:completionHandler:
{
  id v11 = a3;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __129__UITabBarController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke;
  v16[3] = &unk_1E5DD34E8;
  v16[4] = a1;
  id v17 = v11;
  id v18 = v12;
  uint64_t v19 = a2;
  uint64_t v20 = a5;
  v15.receiver = a1;
  v15.super_class = (Class)&off_1F04CBF70;
  id v13 = v11;
  id v14 = v12;
  objc_msgSendSuper2(&v15, sel__px_prepareNavigationFromViewController_routingOptions_options_completionHandler_, a1, a4, a5, v16);
}

- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4 = a3;
  uint64_t v5 = [a1 selectedViewController];
  uint64_t v6 = [(id)v5 routingOptionsForDestination:v4];

  id v7 = (id)((v6 << 63 >> 63) & v5);
  return v7;
}

- (void)routingOptionsForDestination:()PXProgrammaticNavigation
{
  id v4 = a3;
  [a1 viewControllers];
  objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  PXFind();
}

@end