@interface UINavigationController
@end

@implementation UINavigationController

uint64_t __79__UINavigationController_PXImageModulationManager__px_imageModulationIntensity__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4FB19E8] instancesRespondToSelector:sel_px_imageModulationIntensityWithProposedValue_];
  px_imageModulationIntensity_hookExists = result;
  return result;
}

void __100__UINavigationController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)(a2 - 2) >= 4)
  {
    if (a2 == 1)
    {
      uint64_t v7 = *(void *)(a1 + 72);
      if ((v7 & 2) != 0)
      {
        v8 = [*(id *)(a1 + 32) viewControllers];
        uint64_t v9 = [v8 indexOfObjectIdenticalTo:*(void *)(a1 + 40)];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);

          v8 = (void *)v10;
        }
        v12 = *(void **)(a1 + 40);
        v11 = *(void **)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 80);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __100__UINavigationController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke_2;
        v16[3] = &unk_1E5DC7230;
        uint64_t v14 = *(void *)(a1 + 32);
        id v17 = v8;
        uint64_t v18 = v14;
        uint64_t v21 = v13;
        id v19 = v11;
        id v20 = *(id *)(a1 + 56);
        id v15 = v8;
        [v12 provideViewControllersForDestination:v19 options:v13 completionHandler:v16];
      }
      else
      {
        if ((v7 & 1) == 0) {
          PXAssertGetLog();
        }
        [*(id *)(a1 + 40) navigateToDestination:*(void *)(a1 + 48) options:*(void *)(a1 + 80) completionHandler:*(void *)(a1 + 56)];
      }
    }
    else if (!a2)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"UIViewController+PXProgrammaticNavigation.m" lineNumber:344 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __100__UINavigationController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 arrayByAddingObjectsFromArray:v7];
  [*(id *)(a1 + 40) setViewControllers:v8 animated:(*(void *)(a1 + 64) >> 1) & 1];
  uint64_t v9 = [v7 lastObject];

  if (([v9 routingOptionsForDestination:*(void *)(a1 + 48)] & 3) == 1) {
    [v9 navigateToDestination:*(void *)(a1 + 48) options:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __133__UINavigationController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    v3 = [*(id *)(a1 + 32) viewControllers];
    if (([v3 containsObject:*(void *)(a1 + 40)] & 1) == 0) {
      PXAssertGetLog();
    }
    v4 = *(void **)(a1 + 40);
    id v5 = [v3 lastObject];

    if (v4 != v5)
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "px_preparePopToViewController:forced:", *(void *)(a1 + 40), *(_DWORD *)(a1 + 64) & 1))
      {
        (*(void (**)(void, uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 3, 0, v6, v7);
        goto LABEL_13;
      }
      if (*(void *)(a1 + 72) == 1)
      {
        v8 = (void *)MEMORY[0x1E4FB1EC0];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __133__UINavigationController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke_80;
        v11[3] = &unk_1E5DD32A8;
        uint64_t v9 = *(void **)(a1 + 40);
        v11[4] = *(void *)(a1 + 32);
        id v12 = v9;
        [v8 _performWithoutDeferringTransitions:v11];
      }
    }
    (*(void (**)(void, uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 1, 0, v6, v7);
LABEL_13:

    return;
  }
  id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v10();
}

id __133__UINavigationController_PXProgrammaticNavigation___px_prepareNavigationFromViewController_routingOptions_options_completionHandler___block_invoke_80(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) popToViewController:*(void *)(a1 + 40) animated:0];
}

uint64_t __92__UINavigationController_PhotosUICore_PPT__ppt_installTransitionAnimationCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __77__UINavigationController_PhotosUICore__px_preparePopToViewController_forced___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (*(id *)(a1 + 32) == v5) {
    goto LABEL_5;
  }
  uint64_t v9 = v5;
  char v7 = objc_opt_respondsToSelector();
  uint64_t v6 = v9;
  if (v7)
  {
    char v8 = [v9 isReadyForDismissal];
    uint64_t v6 = v9;
    if ((v8 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_5:
      *a3 = 1;
    }
  }
}

void __77__UINavigationController_PhotosUICore__px_preparePopToViewController_forced___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (*(id *)(a1 + 32) == v5)
  {
    *a3 = 1;
  }
  else
  {
    char v8 = v5;
    char v7 = objc_opt_respondsToSelector();
    uint64_t v6 = v8;
    if (v7)
    {
      [v8 prepareForDismissal];
      uint64_t v6 = v8;
    }
  }
}

@end