@interface SBHUDHostViewController
@end

@implementation SBHUDHostViewController

void __79___SBHUDHostViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 984);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "HUDViewController", (void)v9);
        v8 = [v7 view];
        objc_msgSend(v8, "setFrame:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __50___SBHUDHostViewController_knownHUDForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __59___SBHUDHostViewController_dismissHUD_animated_completion___block_invoke(uint64_t a1, unsigned int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained
    && (int v5 = [*(id *)(*(void *)(a1 + 32) + 984) containsObject:WeakRetained], WeakRetained = v8, a2)
    && v5)
  {
    [*(id *)(a1 + 32) _executeDismissHUD:v8 animated:0 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, a2, WeakRetained);
    }
  }
  return MEMORY[0x1F4181820]();
}

uint64_t __118___SBHUDHostViewController__buildTransitionContextToPresentHUD_dismissHUD_animated_delegate_containerView_completion___block_invoke(uint64_t result, uint64_t a2)
{
  id v2 = (void *)result;
  if (a2 == 1)
  {
    [*(id *)(result + 32) didMoveToParentViewController:*(void *)(result + 48)];
    result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v6 = (void *)v2[5];
      uint64_t v7 = v2[6];
      uint64_t v8 = v2[7];
      return [v6 hudViewController:v7 didPresentHUD:v8];
    }
  }
  else if (!a2)
  {
    [*(id *)(result + 32) removeFromParentViewController];
    result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v3 = (void *)v2[5];
      uint64_t v4 = v2[6];
      uint64_t v5 = v2[7];
      return [v3 hudViewController:v4 didDismissHUD:v5];
    }
  }
  return result;
}

uint64_t __118___SBHUDHostViewController__buildTransitionContextToPresentHUD_dismissHUD_animated_delegate_containerView_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  id v2 = (void *)result;
  if (a2 == 1)
  {
    [*(id *)(result + 32) removeFromParentViewController];
    result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v7 = v2[5];
      uint64_t v6 = (void *)v2[6];
      uint64_t v8 = v2[7];
      return [v6 hudViewController:v7 didDismissHUD:v8];
    }
  }
  else if (!a2)
  {
    [*(id *)(result + 32) didMoveToParentViewController:*(void *)(result + 40)];
    result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = v2[5];
      uint64_t v3 = (void *)v2[6];
      uint64_t v5 = v2[7];
      return [v3 hudViewController:v4 didPresentHUD:v5];
    }
  }
  return result;
}

uint64_t __70___SBHUDHostViewController__executePresentNewHUD_animated_completion___block_invoke(void *a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1[4] + 984) addObject:a1[5]];
  }
  uint64_t result = a1[6];
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __70___SBHUDHostViewController__executePresentNewHUD_animated_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  uint64_t v3 = [*(id *)(a1 + 40) view];
  [v3 bounds];
  objc_msgSend(v2, "setFrame:");

  uint64_t v4 = [*(id *)(a1 + 40) view];
  uint64_t v5 = [*(id *)(a1 + 32) view];
  [v4 addSubview:v5];

  id v6 = [*(id *)(a1 + 40) view];
  [v6 layoutIfNeeded];
}

uint64_t __67___SBHUDHostViewController__executeDismissHUD_animated_completion___block_invoke(void *a1, uint64_t a2)
{
  if (!a2)
  {
    [*(id *)(a1[4] + 984) removeObject:a1[5]];
    [*(id *)(a1[4] + 992) removeObject:a1[5]];
  }
  uint64_t result = a1[6];
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __67___SBHUDHostViewController__executeDismissHUD_animated_completion___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 removeFromSuperview];
}

@end