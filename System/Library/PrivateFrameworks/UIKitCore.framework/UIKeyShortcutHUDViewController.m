@interface UIKeyShortcutHUDViewController
@end

@implementation UIKeyShortcutHUDViewController

void __86___UIKeyShortcutHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && [WeakRetained isCompletelyPresented])
  {
    v4 = _UIKeyShortcutHUDLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [*(id *)(a1 + 32) view];
      [v5 size];
      v6 = NSStringFromCGSize(v14);
      v7 = NSStringFromCGSize(*(CGSize *)(a1 + 48));
      int v9 = 138543618;
      v10 = v6;
      __int16 v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to VC resize: oldSize=%{public}@, newSize=%{public}@", (uint8_t *)&v9, 0x16u);
    }
    v8 = [v3 delegate];
    [v8 keyShortcutHUDViewControllerDidRequestDismissal:v3];
  }
}

void __63___UIKeyShortcutHUDViewController_setHidden_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40)) {
      v4 = &_UIKeyShortcutHUDAnimationShrunkTransform;
    }
    else {
      v4 = (long long *)MEMORY[0x1E4F1DAB8];
    }
    long long v5 = v4[1];
    long long v10 = *v4;
    long long v11 = v5;
    long long v12 = v4[2];
    v6 = [WeakRetained hudContainerView];
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    [v6 setTransform:v9];

    if (*(unsigned char *)(a1 + 40)) {
      double v7 = 0.0;
    }
    else {
      double v7 = 1.0;
    }
    v8 = [v3 hudContainerView];
    [v8 setAlpha:v7];
  }
}

void __63___UIKeyShortcutHUDViewController_setHidden_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(unsigned char *)(a1 + 48)) {
      *((unsigned char *)WeakRetained + 978) = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      long long v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }
}

void __57___UIKeyShortcutHUDViewController_handleModelKeyCommand___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = [v4 delegate];
    [v7 keyShortcutHUDViewController:*(void *)(a1 + 32) didSelectShortcut:*(void *)(a1 + 40)];
  }
  else
  {
    v6 = (void *)v4[130];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57___UIKeyShortcutHUDViewController_handleModelKeyCommand___block_invoke_2;
    v8[3] = &unk_1E52DA660;
    v8[4] = v4;
    id v9 = *(id *)(a1 + 40);
    [v6 flashCategoryAtIndex:a3 completionHandler:v8];
  }
}

void __57___UIKeyShortcutHUDViewController_handleModelKeyCommand___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 keyShortcutHUDViewController:*(void *)(a1 + 32) didSelectShortcut:*(void *)(a1 + 40)];
}

void __66___UIKeyShortcutHUDViewController__focusTopSearchResultWithDelay___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSearching])
  {
    [*(id *)(*(void *)(a1 + 32) + 1120) setNextFocusUpdatePrefersTopSearchResult:1];
    id v4 = [*(id *)(a1 + 32) toolbarVC];
    id v2 = [v4 searchBar];
    v3 = [v2 searchTextField];
    [v3 setNeedsFocusUpdate];
  }
}

uint64_t __66___UIKeyShortcutHUDViewController__focusTopSearchResultWithDelay___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (*(unsigned char *)(a1 + 41)) {
        double v3 = 1.0;
      }
      else {
        double v3 = 0.0;
      }
    }
    else
    {
      double v3 = 1.0;
    }
    id v6 = WeakRetained;
    id v4 = [WeakRetained menuVC];
    long long v5 = [v4 view];
    [v5 setAlpha:v3];

    id WeakRetained = v6;
  }
}

void __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained view];
    [v4 layoutIfNeeded];

    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_11;
    }
    if (*(unsigned char *)(a1 + 57))
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_3;
      v7[3] = &unk_1E52DD128;
      v7[4] = v3;
      char v9 = 1;
      id v8 = *(id *)(a1 + 32);
      char v10 = *(unsigned char *)(a1 + 58);
      +[UIView performWithoutAnimation:v7];
      [*(id *)(a1 + 40) _focusTopSearchResultWithDelay:1];

      if (!*(unsigned char *)(a1 + 56))
      {
LABEL_11:
        if (*(unsigned char *)(a1 + 59))
        {
          long long v5 = [v3 menuVC];
          [v5 setSearching:*(unsigned __int8 *)(a1 + 56)];

          [v3 _updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:*(unsigned __int8 *)(a1 + 58)];
        }
      }
    }
    id v6 = [v3 toolbarVC];
    [v6 setSearching:*(unsigned __int8 *)(a1 + 56)];
  }
}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) menuVC];
  [v2 setSearching:*(unsigned __int8 *)(a1 + 48)];

  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
  return [v3 _setDisplayedMenu:v4 animated:v5];
}

void __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41))
  {
    id v7 = WeakRetained;
    if (!a2)
    {
      uint64_t v5 = [WeakRetained metrics];
      [v5 hiddenMenuPanelHeight];
      objc_msgSend(v7, "_setMenuHeight:");
    }
    id v6 = [v7 menuVC];
    [v6 setSearching:*(unsigned __int8 *)(a1 + 40)];

    id WeakRetained = v7;
  }
}

void __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained menuVC];
    [v2 didCompleteSearchTransition];

    double v3 = [v4 toolbarVC];
    [v3 didCompleteSearchTransition];

    id WeakRetained = v4;
  }
}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77___UIKeyShortcutHUDViewController_toolbarViewController_didUpdateSearchText___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40)) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
    id v6 = WeakRetained;
    id v4 = [WeakRetained menuVC];
    uint64_t v5 = [v4 view];
    [v5 setAlpha:v3];

    id WeakRetained = v6;
  }
}

void __77___UIKeyShortcutHUDViewController_toolbarViewController_didUpdateSearchText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2 && WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _setMenuHeight:*(double *)(a1 + 48)];
    [v5 _setMenuWidth:*(double *)(a1 + 56)];
    [v5 _setDisplayedMenu:*(void *)(a1 + 32) animated:0];
    id WeakRetained = v5;
  }
}

@end