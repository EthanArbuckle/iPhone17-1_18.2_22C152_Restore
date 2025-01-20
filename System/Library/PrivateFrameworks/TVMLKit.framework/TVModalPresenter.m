@interface TVModalPresenter
+ (id)_viewControllerForResponder:(id)a3;
+ (id)sharedInstance;
- (NSArray)presentedViewControllers;
- (NSHashTable)_presentationControllers;
- (TVModalPresenter)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)dismissAllViewControllersWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dismissViewControllerWithResponder:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 forResponder:(id)a4 options:(id)a5 completion:(id)a6;
- (void)presentViewController:(id)a3 fromViewController:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation TVModalPresenter

uint64_t __30___TVModalPresenter_presenter__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _hidden];
  uint64_t v2 = presenter_presenter;
  presenter_presenter = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

void __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAutomaticallyAdjustsScrollViewInsets:0];
  uint64_t v2 = [*(id *)(a1 + 40) childViewControllers];
  char v3 = [v2 containsObject:*(void *)(a1 + 32)];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 40) pushViewController:*(void *)(a1 + 32) animated:0];
  }
  v4 = [MEMORY[0x263F1C408] sharedApplication];
  v5 = [v4 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = *(void **)(a1 + 48);
    id v7 = v5;
    objc_msgSend(v7, "setOverrideOrientation:", objc_msgSend(v6, "configurationType") == 2);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 56) willPresentTraitsOverridingViewController];
  }
  if ([*(id *)(a1 + 48) configurationType] != 3) {
    goto LABEL_11;
  }
  v8 = [*(id *)(a1 + 40) popoverPresentationController];
  v9 = [v8 sourceView];
  if (v9)
  {

LABEL_11:
    v12 = *(void **)(a1 + 56);
    v13 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_2;
    v15[3] = &unk_264BA7BD0;
    char v18 = *(unsigned char *)(a1 + 72);
    id v16 = v13;
    id v17 = *(id *)(a1 + 64);
    [v12 presentViewController:v16 animated:1 completion:v15];

    goto LABEL_12;
  }
  v10 = [*(id *)(a1 + 40) popoverPresentationController];
  v11 = [v10 barButtonItem];

  if (v11) {
    goto LABEL_11;
  }
  uint64_t v14 = *(void *)(a1 + 64);
  if (v14) {
    (*(void (**)(void))(v14 + 16))();
  }
LABEL_12:
}

uint64_t __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 32) view];
    [v2 setAlpha:1.0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v3 = [*(id *)(a1 + 32) presentingViewController];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [*(id *)(a1 + 40) presentedViewController];
    char v6 = [v5 isEqual:*(void *)(a1 + 32)];

    if ((v6 & 1) == 0)
    {
      id v17 = [*(id *)(a1 + 32) presentingViewController];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_4;
      v26[3] = &unk_264BA68A0;
      id v27 = *(id *)(a1 + 64);
      [v17 dismissViewControllerAnimated:0 completion:v26];

      char v18 = v27;
LABEL_12:

      goto LABEL_17;
    }
  }
  id v7 = [*(id *)(a1 + 32) presentingViewController];

  if (!v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_5;
    v24[3] = &unk_264BA69A0;
    v19 = *(void **)(a1 + 32);
    id v25 = *(id *)(a1 + 40);
    [v19 setDismissalBlock:v24];
    char v18 = v25;
    goto LABEL_12;
  }
  [*(id *)(a1 + 48) setAutomaticallyAdjustsScrollViewInsets:0];
  int v8 = [*(id *)(a1 + 56) allowsModalOverModal];
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    v10 = [v9 presentedViewController];

    if (v10)
    {
      v11 = [*(id *)(a1 + 32) presentedViewController];
      [v11 dismissViewControllerAnimated:0 completion:0];
    }
    v12 = [[__TVModalPresenterNavigationController alloc] initWithRootViewController:*(void *)(a1 + 48)];
    [WeakRetained _configureModalController:v12 withFromController:*(void *)(a1 + 32) andConfiguration:*(void *)(a1 + 56)];
    [(__TVModalPresenterNavigationController *)v12 setNavigationBarHidden:1];
    int v13 = *(unsigned __int8 *)(a1 + 88);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    uint64_t v14 = [*(id *)(a1 + 48) appDocument];
    v15 = [v14 templateElement];
    id v16 = [v15 elementName];
    if ([v16 isEqualToString:@"descriptiveAlertTemplate"])
    {
    }
    else
    {
      v20 = [*(id *)(a1 + 48) appDocument];
      v21 = [v20 templateElement];
      v22 = [v21 elementName];
      int v23 = [v22 isEqualToString:@"alertTemplate"];

      if (!v23)
      {
LABEL_16:
        [*(id *)(a1 + 32) presentViewController:v12 animated:v13 != 0 completion:0];

        goto LABEL_17;
      }
    }
    int v13 = 0;
    goto LABEL_16;
  }
  [v9 pushViewController:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 88) completion:*(void *)(a1 + 72)];
LABEL_17:
}

uint64_t __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_5(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 didPresentTraitsOverridingViewController];
  }
  return result;
}

uint64_t __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60___TVModalPresenter_hideController_animated_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _forceOrientationBackToSupportedOrientation];
  uint64_t v2 = [*(id *)(a1 + 40) viewControllers];
  uint64_t v3 = [v2 lastObject];
  v4 = *(void **)(a1 + 48);

  v5 = [*(id *)(a1 + 40) viewControllers];
  char v6 = v5;
  if (v3 == v4)
  {
    uint64_t v8 = [v5 count];

    int v9 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 56);
    if (v8 == 2)
    {
      v11 = *(void **)(a1 + 32);
      [v11 _dismissAnimated:v9 != 0 completion:v10];
    }
    else
    {
      v12 = *(void **)(a1 + 40);
      [v12 popViewControllerAnimated:v9 != 0 completion:v10];
    }
  }
  else
  {
    id v13 = (id)[v5 mutableCopy];

    [v13 removeObject:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setViewControllers:v13];
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

uint64_t __60___TVModalPresenter_hideController_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49___TVModalPresenter__dismissAnimated_completion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained) {
    WeakRetained[24] = 0;
  }
  id v4 = WeakRetained;
  if (a1[5]) {
    dispatch_async(MEMORY[0x263EF83A0], a1[5]);
  }
  [a1[4] reset];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"TVModalPresenterDismissedNotification" object:0];
}

uint64_t __49___TVModalPresenter__dismissAnimated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_43);
  }
  uint64_t v2 = (void *)sharedInstance___presenter;
  return v2;
}

uint64_t __34__TVModalPresenter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TVModalPresenter);
  uint64_t v1 = sharedInstance___presenter;
  sharedInstance___presenter = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (TVModalPresenter)init
{
  v10.receiver = self;
  v10.super_class = (Class)TVModalPresenter;
  uint64_t v2 = [(TVModalPresenter *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F1CCF8]) initForPresenting:1];
    presentingAnimator = v2->_presentingAnimator;
    v2->_presentingAnimator = (_UIProgressiveBlurPresentationAnimator *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F1CCF8]) initForPresenting:0];
    dismissingAnimator = v2->_dismissingAnimator;
    v2->_dismissingAnimator = (_UIProgressiveBlurPresentationAnimator *)v5;

    uint64_t v7 = objc_alloc_init(_TVPlaybackFadeAnimator);
    playbackAnimator = v2->_playbackAnimator;
    v2->_playbackAnimator = v7;
  }
  return v2;
}

- (NSHashTable)_presentationControllers
{
  presentationControllers = self->__presentationControllers;
  if (!presentationControllers)
  {
    id v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v5 = self->__presentationControllers;
    self->__presentationControllers = v4;

    presentationControllers = self->__presentationControllers;
  }
  return presentationControllers;
}

- (NSArray)presentedViewControllers
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(TVModalPresenter *)self _presentationControllers];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v6 = [(TVModalPresenter *)self _presentationControllers];
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

  char v18 = (void *)[v5 copy];
  return (NSArray *)v18;
}

- (void)presentViewController:(id)a3 forResponder:(id)a4 options:(id)a5 completion:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(id)objc_opt_class() _viewControllerForResponder:v10];
  uint64_t v14 = [v13 navigationController];
  uint64_t v15 = (void *)v14;
  if (v14) {
    id v16 = (void *)v14;
  }
  else {
    id v16 = v13;
  }
  id v17 = v16;

  if ([v11 type] == 7)
  {
    [v11 popOverSourceRect];
    if (CGRectIsEmpty(v23))
    {
      char v18 = [v11 popOverSourceView];
      if (v18)
      {
        BOOL v19 = 0;
      }
      else
      {
        long long v20 = [v11 popOverSourceBarButtonItem];
        BOOL v19 = v20 == 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v19) {
      [v11 setPopOverSourceView:v10];
    }
  }
  [(TVModalPresenter *)self presentViewController:v21 fromViewController:v17 options:v11 completion:v12];
}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (TVModalPresenter *)a5;
  id v13 = a6;
  objc_initWeak(location, self);
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v10;
      [v14 setPresentedModal:1];
    }
    uint64_t v15 = [v11 presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = [v11 presentedViewController];
    }
    else
    {
      id v16 = 0;
    }

    id v17 = [v16 configuration];
    uint64_t v18 = [v17 type];
    uint64_t v19 = [(TVModalPresenter *)v12 type];

    if (v18 == v19)
    {
      if (v16)
      {
LABEL_11:
        long long v20 = v16;
        char v21 = 1;
LABEL_17:
        [(TVModalPresentationNavigationController *)v20 setConfiguration:v12];
        if ([(TVModalPresenter *)v12 conformsToProtocol:&unk_26E5E4038]) {
          long long v24 = v12;
        }
        else {
          long long v24 = self;
        }
        long long v25 = v24;
        [(TVModalPresentationNavigationController *)v20 setTransitioningDelegate:v25];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke;
        v32[3] = &unk_264BA8D60;
        objc_copyWeak(&v39, location);
        long long v26 = v20;
        v33 = v26;
        char v40 = v21;
        v34 = v12;
        v35 = self;
        id v36 = v10;
        id v38 = v13;
        id v37 = v11;
        long long v27 = (void (**)(void))MEMORY[0x230FC9DC0](v32);
        v28 = [(TVModalPresentationNavigationController *)v26 transitionCoordinator];

        if (v28)
        {
          v29 = [(TVModalPresentationNavigationController *)v26 transitionCoordinator];
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_4;
          v30[3] = &unk_264BA7C48;
          v31 = v27;
          [v29 animateAlongsideTransition:0 completion:v30];
        }
        else
        {
          v27[2](v27);
        }

        objc_destroyWeak(&v39);
        goto LABEL_24;
      }
    }
    else
    {
      char v22 = [(TVModalPresenter *)v12 allowsModalOverModal];
      if (v16) {
        char v23 = v22;
      }
      else {
        char v23 = 0;
      }
      if (v23) {
        goto LABEL_11;
      }
    }
    long long v20 = [[TVModalPresentationNavigationController alloc] initWithConfiguration:v12];
    char v21 = 0;
    goto LABEL_17;
  }
  if (v13)
  {
    id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"TVModalPresentationErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v16);
LABEL_24:
  }
  objc_destroyWeak(location);
}

void __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_18;
  }
  id v4 = [WeakRetained _presentationControllers];
  [v4 addObject:*(void *)(a1 + 32)];

  if (*(unsigned char *)(a1 + 88))
  {
    if ([*(id *)(a1 + 40) allowsModalOverModal]) {
      [*(id *)(a1 + 48) presentViewController:*(void *)(a1 + 56) fromViewController:*(void *)(a1 + 32) options:*(void *)(a1 + 40) completion:*(void *)(a1 + 72)];
    }
    else {
      objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "isAnimated"));
    }
    goto LABEL_18;
  }
  id v5 = *(id *)(a1 + 32);
  char v6 = [*(id *)(a1 + 64) presentedViewController];

  [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 56) animated:0];
  if ([*(id *)(a1 + 40) type] == 7)
  {
    uint64_t v7 = [*(id *)(a1 + 32) popoverPresentationController];
    uint64_t v8 = [*(id *)(a1 + 40) popOverSourceBarButtonItem];
    [v7 setBarButtonItem:v8];

    uint64_t v9 = [*(id *)(a1 + 32) popoverPresentationController];
    [*(id *)(a1 + 40) popOverSourceRect];
    objc_msgSend(v9, "setSourceRect:");

    id v10 = [*(id *)(a1 + 32) popoverPresentationController];
    id v11 = [*(id *)(a1 + 40) popOverSourceView];
    [v10 setSourceView:v11];

    id v12 = [*(id *)(a1 + 32) popoverPresentationController];
    objc_msgSend(v12, "setPermittedArrowDirections:", objc_msgSend(*(id *)(a1 + 40), "popOverArrowDirection"));

    int v13 = [*(id *)(a1 + 40) conformsToProtocol:&unk_26E5E1320];
    uint64_t v14 = 48;
    if (v13) {
      uint64_t v14 = 40;
    }
    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = *(id *)(a1 + v14);
    id v17 = [v15 popoverPresentationController];
    [v17 setDelegate:v16];

    goto LABEL_13;
  }
  if ([*(id *)(a1 + 40) type] == 1001 || objc_msgSend(*(id *)(a1 + 40), "type") == 1002)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x263F1C3F8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "type") == 1001);
    [*(id *)(a1 + 40) _applyAlertActionsForController:v18];
    [v18 setContentViewController:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setContainingAlertController:v18];
    id v17 = v5;
    id v5 = v18;
LABEL_13:
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_2;
  v22[3] = &unk_264BA6AB0;
  id v23 = *(id *)(a1 + 64);
  id v19 = v5;
  id v24 = v19;
  id v25 = *(id *)(a1 + 72);
  uint64_t v20 = MEMORY[0x230FC9DC0](v22);
  char v21 = (void *)v20;
  if (v6) {
    [*(id *)(a1 + 64) dismissViewControllerAnimated:0 completion:v20];
  }
  else {
    (*(void (**)(uint64_t))(v20 + 16))(v20);
  }

LABEL_18:
}

void __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_3;
  v3[3] = &unk_264BA68A0;
  id v4 = *(id *)(a1 + 48);
  [v1 presentViewController:v2 animated:1 completion:v3];
}

uint64_t __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissViewControllerWithResponder:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v19 = a3;
  uint64_t v8 = (void (**)(id, void, void *))a5;
  uint64_t v9 = [(id)objc_opt_class() _viewControllerForResponder:v19];
  id v10 = [(TVModalPresenter *)self presentedViewControllers];
  char v11 = [v10 containsObject:v9];

  id v12 = [(TVModalPresenter *)self presentedViewControllers];
  int v13 = [v9 presentingViewController];
  char v14 = [v12 containsObject:v13];

  if (!v9 || (v11 & 1) != 0 || (v14 & 1) != 0)
  {
    if (v9)
    {
      [(TVModalPresenter *)self dismissViewController:v9 animated:v6 completion:v8];
      goto LABEL_13;
    }
  }
  else
  {
    do
    {
      uint64_t v15 = [v9 parentViewController];
      id v16 = v15;
      if (v15)
      {
        id v17 = v15;
      }
      else
      {
        id v17 = [v9 presentingViewController];
      }
      id v18 = v17;

      uint64_t v9 = v18;
    }
    while (v18);
  }
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TVModalPresentationErrorDomain" code:1 userInfo:0];
  v8[2](v8, 0, v9);
LABEL_13:

LABEL_14:
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
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __62__TVModalPresenter_dismissViewController_animated_completion___block_invoke;
      v18[3] = &unk_264BA68A0;
      id v19 = v8;
      [v10 dismissViewControllerAnimated:v6 completion:v18];

      goto LABEL_13;
    }
  }
  else
  {
  }
  char v11 = [v7 navigationController];
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
    int v13 = [v10 viewControllers];
    char v14 = (void *)[v13 mutableCopy];

    [v14 removeObject:v7];
    [v10 setViewControllers:v14 animated:v6];
    if (v8)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __62__TVModalPresenter_dismissViewController_animated_completion___block_invoke_2;
      v16[3] = &unk_264BA68A0;
      id v17 = v8;
      dispatch_async(MEMORY[0x263EF83A0], v16);
    }
  }
LABEL_13:
}

uint64_t __62__TVModalPresenter_dismissViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __62__TVModalPresenter_dismissViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissAllViewControllersWithAnimation:(BOOL)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = dispatch_group_create();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [(TVModalPresenter *)self _presentationControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        dispatch_group_enter(v6);
        int v13 = [v12 presentingViewController];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __70__TVModalPresenter_dismissAllViewControllersWithAnimation_completion___block_invoke;
        v17[3] = &unk_264BA69A0;
        id v18 = v6;
        [v13 dismissViewControllerAnimated:1 completion:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__TVModalPresenter_dismissAllViewControllersWithAnimation_completion___block_invoke_2;
  v15[3] = &unk_264BA68A0;
  id v16 = v5;
  id v14 = v5;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], v15);
}

void __70__TVModalPresenter_dismissAllViewControllersWithAnimation_completion___block_invoke(uint64_t a1)
{
}

uint64_t __70__TVModalPresenter_dismissAllViewControllersWithAnimation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

+ (id)_viewControllerForResponder:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v6 = [v5 nextResponder];

      id v5 = (void *)v6;
    }
    while (v6);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 configuration];
    uint64_t v11 = [v10 type];

    if (v11 == 1000)
    {
      uint64_t v12 = 32;
LABEL_9:
      id v15 = *(id *)((char *)&self->super.isa + v12);
      goto LABEL_11;
    }
    int v13 = [v9 configuration];
    uint64_t v14 = [v13 type];

    if (v14 == 4)
    {
      uint64_t v12 = 16;
      goto LABEL_9;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 configuration];
    uint64_t v9 = [v8 type];

    if (v9 == 1000)
    {
      uint64_t v10 = 32;
LABEL_9:
      id v13 = *(id *)((char *)&self->super.isa + v10);
      goto LABEL_11;
    }
    uint64_t v11 = [v7 configuration];
    uint64_t v12 = [v11 type];

    if (v12 == 4)
    {
      uint64_t v10 = 24;
      goto LABEL_9;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x263F1CD00];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  [v9 setBlurStyle:4005];
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackAnimator, 0);
  objc_storeStrong((id *)&self->_dismissingAnimator, 0);
  objc_storeStrong((id *)&self->_presentingAnimator, 0);
  objc_storeStrong((id *)&self->__presentationControllers, 0);
}

@end