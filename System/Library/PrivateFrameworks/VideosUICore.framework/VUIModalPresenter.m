@interface VUIModalPresenter
+ (id)sharedInstance;
- (NSArray)presentedViewControllers;
- (VUIModalPresenter)init;
- (id)_presentationControllers;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 fromViewController:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation VUIModalPresenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance___presenter;
  return v2;
}

uint64_t __35__VUIModalPresenter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIModalPresenter);
  uint64_t v1 = sharedInstance___presenter;
  sharedInstance___presenter = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (VUIModalPresenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIModalPresenter;
  v2 = [(VUIModalPresenter *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F432B0]) initForPresenting:1];
    presentingAnimator = v2->_presentingAnimator;
    v2->_presentingAnimator = (_UIProgressiveBlurPresentationAnimator *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F432B0]) initForPresenting:0];
    dismissingAnimator = v2->_dismissingAnimator;
    v2->_dismissingAnimator = (_UIProgressiveBlurPresentationAnimator *)v5;
  }
  return v2;
}

- (id)_presentationControllers
{
  presentationControllers = self->__presentationControllers;
  if (!presentationControllers)
  {
    v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v5 = self->__presentationControllers;
    self->__presentationControllers = v4;

    presentationControllers = self->__presentationControllers;
  }
  return presentationControllers;
}

- (NSArray)presentedViewControllers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(VUIModalPresenter *)self _presentationControllers];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = [(VUIModalPresenter *)self _presentationControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v12 = objc_msgSend(v11, "viewControllers", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * j);
              if (([v5 containsObject:v17] & 1) == 0) {
                [v5 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  v18 = (void *)[v5 copy];
  return (NSArray *)v18;
}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (VUIModalPresenter *)a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(void, void, void))v13;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v11;
      v16 = [v15 vuiPresentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v15 vuiPresentedViewController];
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    v18 = objc_msgSend(v17, "configuration", v11);
    uint64_t v19 = [v18 type];
    uint64_t v20 = [(VUIModalPresenter *)v12 type];

    long long v21 = v10;
    if (v19 == v20)
    {
      if (!v17)
      {
LABEL_16:
        long long v23 = [[VUIModalPresentationNavigationController alloc] initWithConfiguration:v12];
        char v24 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      char v22 = [(VUIModalPresenter *)v12 allowsModalOverModal];
      if (!v17 || (v22 & 1) == 0) {
        goto LABEL_16;
      }
    }
    long long v23 = v17;
    char v24 = 1;
LABEL_17:
    [(VUIModalPresentationNavigationController *)v23 setConfiguration:v12];
    char v25 = [(VUIModalPresenter *)v12 isAnimated];
    objc_initWeak(location, self);
    if ([(VUIModalPresenter *)v12 conformsToProtocol:&unk_1F3E31208]) {
      long long v26 = v12;
    }
    else {
      long long v26 = self;
    }
    long long v27 = v26;
    [(VUIModalPresentationNavigationController *)v23 setTransitioningDelegate:v27];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke;
    v35[3] = &unk_1E6DDCF00;
    objc_copyWeak(&v42, location);
    v28 = v23;
    v36 = v28;
    char v43 = v24;
    v37 = v12;
    v38 = self;
    id v10 = v21;
    id v39 = v21;
    v41 = v14;
    char v44 = v25;
    id v11 = v32;
    id v40 = v32;
    v29 = (void (**)(void))MEMORY[0x1E4E604D0](v35);
    uint64_t v30 = [(VUIModalPresentationNavigationController *)v28 transitionCoordinator];

    if (v30)
    {
      v31 = [(VUIModalPresentationNavigationController *)v28 transitionCoordinator];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_4;
      v33[3] = &unk_1E6DDCF28;
      v34 = v29;
      [v31 animateAlongsideTransition:0 completion:v33];
    }
    else
    {
      v29[2](v29);
    }

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);

    goto LABEL_24;
  }
  if (v13)
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIModalPresentationErrorDomain" code:0 userInfo:0];
    ((void (**)(void, void, void *))v14)[2](v14, 0, v17);
LABEL_24:
  }
}

void __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_21;
  }
  v4 = [WeakRetained _presentationControllers];
  [v4 addObject:*(void *)(a1 + 32)];

  if (*(unsigned char *)(a1 + 88))
  {
    if ([*(id *)(a1 + 40) allowsModalOverModal]) {
      [*(id *)(a1 + 48) presentViewController:*(void *)(a1 + 56) fromViewController:*(void *)(a1 + 32) options:*(void *)(a1 + 40) completion:*(void *)(a1 + 72)];
    }
    else {
      [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 56) animated:*(unsigned __int8 *)(a1 + 89)];
    }
    goto LABEL_21;
  }
  id v5 = *(id *)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [*(id *)(a1 + 64) vuiPresentedViewController];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 56) animated:0];
  if ([*(id *)(a1 + 40) type] == 7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) popoverPresentationController];
    uint64_t v9 = [*(id *)(a1 + 40) popOverSourceBarButtonItem];
    [v8 setBarButtonItem:v9];

    id v10 = [*(id *)(a1 + 32) popoverPresentationController];
    [*(id *)(a1 + 40) popOverSourceRect];
    objc_msgSend(v10, "setSourceRect:");

    id v11 = [*(id *)(a1 + 32) popoverPresentationController];
    v12 = [*(id *)(a1 + 40) popOverSourceView];
    [v11 setSourceView:v12];

    id v13 = [*(id *)(a1 + 32) popoverPresentationController];
    objc_msgSend(v13, "setPermittedArrowDirections:", objc_msgSend(*(id *)(a1 + 40), "popOverArrowDirection"));

    int v14 = [*(id *)(a1 + 40) conformsToProtocol:&unk_1F3E262B0];
    uint64_t v15 = 48;
    if (v14) {
      uint64_t v15 = 40;
    }
    v16 = *(void **)(a1 + 32);
    id v17 = *(id *)(a1 + v15);
    v18 = [v16 popoverPresentationController];
    [v18 setDelegate:v17];

    goto LABEL_16;
  }
  if ([*(id *)(a1 + 40) type] == 1001 || objc_msgSend(*(id *)(a1 + 40), "type") == 1002)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F42728], "alertControllerWithTitle:message:preferredStyle:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "type") == 1001);
    [*(id *)(a1 + 40) _applyAlertActionsForController:v19];
    [v19 setContentViewController:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setContainingAlertController:v19];
    v18 = v5;
    id v5 = v19;
LABEL_16:
  }
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  char v25 = __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_2;
  long long v26 = &unk_1E6DDCED8;
  id v27 = *(id *)(a1 + 64);
  id v20 = v5;
  id v28 = v20;
  char v30 = *(unsigned char *)(a1 + 89);
  id v29 = *(id *)(a1 + 72);
  uint64_t v21 = MEMORY[0x1E4E604D0](&v23);
  char v22 = (void *)v21;
  if (v7) {
    objc_msgSend(*(id *)(a1 + 64), "dismissViewControllerAnimated:completion:", 0, v21, v23, v24, v25, v26, v27, v28);
  }
  else {
    (*(void (**)(uint64_t))(v21 + 16))(v21);
  }

LABEL_21:
}

void __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_3;
  v4[3] = &unk_1E6DDCEB0;
  id v5 = *(id *)(a1 + 48);
  [v1 presentViewController:v2 animated:v3 completion:v4];
}

uint64_t __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 presentingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v7 presentingViewController];

    if (v10)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__VUIModalPresenter_dismissViewController_animated_completion___block_invoke;
      v18[3] = &unk_1E6DDCEB0;
      id v19 = v8;
      [v10 dismissViewControllerAnimated:v6 completion:v18];

      goto LABEL_13;
    }
  }
  else
  {
  }
  id v11 = [v7 navigationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v7 navigationController];
  }
  else
  {
    id v10 = 0;
  }

  id v12 = [v10 topViewController];

  if (v12 == v7)
  {
    id v15 = (id)[v10 popViewControllerAnimated:v6 completion:v8];
  }
  else
  {
    id v13 = [v10 viewControllers];
    int v14 = (void *)[v13 mutableCopy];

    [v14 removeObject:v7];
    [v10 setViewControllers:v14 animated:v6];
    if (v8)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__VUIModalPresenter_dismissViewController_animated_completion___block_invoke_2;
      v16[3] = &unk_1E6DDCEB0;
      id v17 = v8;
      dispatch_async(MEMORY[0x1E4F14428], v16);
    }
  }
LABEL_13:
}

uint64_t __63__VUIModalPresenter_dismissViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __63__VUIModalPresenter_dismissViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = 0;
  if (v6 && (isKindOfClass & 1) != 0) {
    id v8 = self->_presentingAnimator;
  }

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0) {
    id v6 = self->_dismissingAnimator;
  }

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4F432B8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  [v9 setBlurStyle:4005];
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissingAnimator, 0);
  objc_storeStrong((id *)&self->_presentingAnimator, 0);
  objc_storeStrong((id *)&self->__presentationControllers, 0);
}

@end