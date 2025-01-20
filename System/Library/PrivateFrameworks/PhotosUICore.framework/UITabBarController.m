@interface UITabBarController
@end

@implementation UITabBarController

void __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] count];
  a1[5];
  a1[6];
  a1[4];
  id v4 = v3;
  PXIterateAsynchronously();
}

void __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_7(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_8;
  v4[3] = &unk_1E5DD0E78;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 _switchToBarBarItem:v3 completionHandler:v4];
}

uint64_t __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedTest:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 index];
  if (v4) {
    [*(id *)(a1 + 32) startedSubTest:@"SwitchTab" forTest:*(void *)(a1 + 40)];
  }
  BOOL v5 = v4 != 0;
  id v6 = *(void **)(a1 + 48);
  id v7 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_4;
  v9[3] = &unk_1E5DCA2A0;
  BOOL v13 = v5;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  id v8 = v3;
  [v6 _switchToBarBarItem:v7 completionHandler:v9];
}

uint64_t __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

void __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) finishedSubTest:@"SwitchTab" forTest:*(void *)(a1 + 40)];
  }
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_5;
  block[3] = &unk_1E5DD36F8;
  id v4 = *(id *)(a1 + 48);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __103__UITabBarController_PXPPTSupport__ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

uint64_t __113__UITabBarController_PXProgrammaticNavigation__px_switchToTabAndNavigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 routingOptionsForDestination:*(void *)(a1 + 32)] & 1;
}

void __96__UITabBarController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((unint64_t)(a2 - 2) < 4)
  {
    id v8 = v5;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_7:
    id v6 = v8;
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    id v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "px_switchToTabAndNavigateToDestination:options:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 64), *(void *)(a1 + 48));
    goto LABEL_7;
  }
  if (!a2)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v5);
    [v7 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"UIViewController+PXProgrammaticNavigation.m" lineNumber:229 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_8:
}

void __129__UITabBarController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 32) selectedViewController];
    id v4 = (void *)v3;
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5 != *(void *)(a1 + 32) && v5 != v3) {
      PXAssertGetLog();
    }
    if (!v3 || *(void *)(a1 + 40) == v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 64);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __129__UITabBarController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke_75;
      v11[3] = &unk_1E5DC71E0;
      v11[4] = *(void *)(a1 + 32);
      long long v10 = *(_OWORD *)(a1 + 48);
      id v8 = (id)v10;
      long long v12 = v10;
      objc_msgSend(v4, "px_navigateToStateAllowingTabSwitchingWithOptions:completionHandler:", v7, v11);
    }
  }
  else
  {
    v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v9();
  }
}

void __129__UITabBarController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke_75(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((unint64_t)(a2 - 2) < 4)
  {
    id v6 = *(void (**)(void))(a1[5] + 16);
    id v8 = v5;
LABEL_7:
    v6();
    id v5 = v8;
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    id v6 = *(void (**)(void))(a1[5] + 16);
    id v8 = v5;
    goto LABEL_7;
  }
  if (!a2)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v5);
    [v7 handleFailureInMethod:a1[6] object:a1[4] file:@"UIViewController+PXProgrammaticNavigation.m" lineNumber:196 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_8:
}

uint64_t __77__UITabBarController_PXProgrammaticNavigation__routingOptionsForDestination___block_invoke(uint64_t a1, void *a2)
{
  return [a2 routingOptionsForDestination:*(void *)(a1 + 32)] & 1;
}

@end