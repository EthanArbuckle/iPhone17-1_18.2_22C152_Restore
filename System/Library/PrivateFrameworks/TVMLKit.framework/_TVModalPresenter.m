@interface _TVModalPresenter
+ (id)presenter;
- (BOOL)_isDismissing;
- (UINavigationController)modalRootViewController;
- (UIViewController)presentedViewController;
- (_TVModalPresenter)init;
- (id)_hidden;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_configureModalController:(id)a3 withFromController:(id)a4 andConfiguration:(id)a5;
- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)_forceOrientationBackToSupportedOrientation;
- (void)_willRotateNotification:(id)a3;
- (void)dealloc;
- (void)hideController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)showController:(id)a3 fromController:(id)a4 withCompletionBlock:(id)a5;
- (void)showController:(id)a3 fromController:(id)a4 withConfiguration:(id)a5 andCompletionBlock:(id)a6;
- (void)showController:(id)a3 fromController:(id)a4 withConfiguration:(id)a5 animated:(BOOL)a6 andCompletionBlock:(id)a7;
@end

@implementation _TVModalPresenter

- (_TVModalPresenter)init
{
  return 0;
}

- (id)_hidden
{
  v16.receiver = self;
  v16.super_class = (Class)_TVModalPresenter;
  v2 = [(_TVModalPresenter *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F1CB68]);
    v4 = [[__TVModalPresenterNavigationController alloc] initWithRootViewController:v3];
    modalRootViewController = v2->_modalRootViewController;
    v2->_modalRootViewController = &v4->super;

    [(UINavigationController *)v2->_modalRootViewController setDelegate:v2];
    [(UINavigationController *)v2->_modalRootViewController setTransitioningDelegate:v2];
    [(UINavigationController *)v2->_modalRootViewController setModalPresentationCapturesStatusBarAppearance:1];
    [(UINavigationController *)v2->_modalRootViewController setModalPresentationStyle:5];
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v7 = *MEMORY[0x263F1D838];
    v8 = [(id)*MEMORY[0x263F1D020] keyWindow];
    [v6 addObserver:v2 selector:sel__willRotateNotification_ name:v7 object:v8];

    v9 = objc_alloc_init(_TVPlaybackFadeAnimator);
    playbackAnimator = v2->_playbackAnimator;
    v2->_playbackAnimator = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F1CCF8]) initForPresenting:1];
    presentingAnimator = v2->_presentingAnimator;
    v2->_presentingAnimator = (_UIProgressiveBlurPresentationAnimator *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F1CCF8]) initForPresenting:0];
    dismissingAnimator = v2->_dismissingAnimator;
    v2->_dismissingAnimator = (_UIProgressiveBlurPresentationAnimator *)v13;
  }
  return v2;
}

+ (id)presenter
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30___TVModalPresenter_presenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (presenter_onceToken != -1) {
    dispatch_once(&presenter_onceToken, block);
  }
  v2 = (void *)presenter_presenter;
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_TVModalPresenter;
  [(_TVModalPresenter *)&v4 dealloc];
}

- (UIViewController)presentedViewController
{
  id v3 = [(_TVModalPresenter *)self modalRootViewController];
  objc_super v4 = [v3 viewControllers];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    v6 = 0;
  }
  else
  {
    uint64_t v7 = [(_TVModalPresenter *)self modalRootViewController];
    v6 = [v7 topViewController];
  }
  return (UIViewController *)v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  v6 = [a3 childViewControllers];
  uint64_t v7 = [v6 lastObject];

  if (!v7) {
    goto LABEL_6;
  }
  v8 = objc_getAssociatedObject(v7, "TVMLPresenterConfiguration");
  if (!v8) {
    goto LABEL_6;
  }
  v9 = v8;
  uint64_t v10 = [v8 configurationType];

  if (v10 == 4)
  {
    uint64_t v11 = 8;
    goto LABEL_8;
  }
  if (v10 != 2)
  {
LABEL_6:
    id v12 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = 32;
LABEL_8:
  id v12 = *(id *)((char *)&self->super.isa + v11);
LABEL_9:

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  objc_super v4 = [a3 childViewControllers];
  uint64_t v5 = [v4 lastObject];

  if (!v5) {
    goto LABEL_6;
  }
  v6 = objc_getAssociatedObject(v5, "TVMLPresenterConfiguration");
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 configurationType];

  if (v8 == 4)
  {
    uint64_t v9 = 16;
    goto LABEL_8;
  }
  if (v8 != 2)
  {
LABEL_6:
    id v10 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = 32;
LABEL_8:
  id v10 = *(id *)((char *)&self->super.isa + v9);
LABEL_9:

  return v10;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  v6 = (objc_class *)MEMORY[0x263F1CD00];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  [v9 setBlurStyle:4005];
  return v9;
}

- (void)showController:(id)a3 fromController:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(TVModalPresenterConfiguration);
  [(_TVModalPresenter *)self showController:v10 fromController:v9 withConfiguration:v11 andCompletionBlock:v8];
}

- (void)showController:(id)a3 fromController:(id)a4 withConfiguration:(id)a5 andCompletionBlock:(id)a6
{
}

- (void)showController:(id)a3 fromController:(id)a4 withConfiguration:(id)a5 animated:(BOOL)a6 andCompletionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(void))a7;
  if (!v12)
  {
    v30 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    {
      -[_TVModalPresenter showController:fromController:withConfiguration:animated:andCompletionBlock:](v30);
      if (!v15) {
        goto LABEL_14;
      }
    }
    else if (!v15)
    {
      goto LABEL_14;
    }
    v15[2](v15);
    goto LABEL_14;
  }
  objc_super v16 = [(_TVModalPresenter *)self modalRootViewController];
  if (![v13 isEqual:v16]) {
    goto LABEL_6;
  }
  v17 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
    -[_TVModalPresenter showController:fromController:withConfiguration:animated:andCompletionBlock:](v17);
  }
  uint64_t v18 = [v16 presentingViewController];

  id v13 = (id)v18;
  if (!v18)
  {
    if (v15) {
      v15[2](v15);
    }
    id v13 = 0;
  }
  else
  {
LABEL_6:
    [(_TVModalPresenter *)self _configureModalController:v16 withFromController:v13 andConfiguration:v14];
    objc_setAssociatedObject(v12, "TVMLPresenterConfiguration", v14, (void *)1);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke;
    v45[3] = &unk_264BA7BF8;
    id v19 = v12;
    id v46 = v19;
    v31 = v16;
    id v20 = v16;
    id v47 = v20;
    id v32 = v14;
    id v21 = v14;
    id v48 = v21;
    id v22 = v13;
    id v49 = v22;
    v23 = v15;
    id v50 = v23;
    BOOL v51 = a6;
    v24 = (void *)MEMORY[0x230FC9DC0](v45);
    objc_initWeak(&location, self);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_3;
    v35[3] = &unk_264BA7C20;
    objc_copyWeak(&v42, &location);
    id v25 = v20;
    id v36 = v25;
    id v13 = v22;
    id v37 = v13;
    id v26 = v24;
    id v40 = v26;
    id v38 = v19;
    id v39 = v21;
    BOOL v43 = a6;
    v41 = v23;
    v27 = (void (**)(void))MEMORY[0x230FC9DC0](v35);
    v28 = [v25 transitionCoordinator];

    if (v28)
    {
      v29 = [v25 transitionCoordinator];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_6;
      v33[3] = &unk_264BA7C48;
      v34 = v27;
      [v29 animateAlongsideTransition:0 completion:v33];
    }
    else
    {
      v27[2](v27);
    }

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    objc_super v16 = v31;
    id v14 = v32;
  }

LABEL_14:
}

- (void)hideController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_TVModalPresenter *)self modalRootViewController];
  uint64_t v11 = [v10 presentedViewController];

  if (v11)
  {
    id v12 = [v10 presentedViewController];
    [v12 dismissViewControllerAnimated:0 completion:v9];
LABEL_3:

    goto LABEL_4;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = [v10 viewControllers];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
LABEL_7:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v34 != v16) {
        objc_enumerationMutation(v13);
      }
      if (*(id *)(*((void *)&v33 + 1) + 8 * v17) == v8) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v15) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    id v18 = v8;

    if (!v18) {
      goto LABEL_17;
    }
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __60___TVModalPresenter_hideController_animated_withCompletion___block_invoke;
    v28[3] = &unk_264BA7C70;
    v28[4] = self;
    id v19 = v10;
    id v29 = v19;
    id v20 = v18;
    id v30 = v20;
    BOOL v32 = a4;
    id v31 = v9;
    id v21 = (void (**)(void))MEMORY[0x230FC9DC0](v28);
    id v22 = [v19 transitionCoordinator];

    if (v22)
    {
      v23 = [v19 transitionCoordinator];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __60___TVModalPresenter_hideController_animated_withCompletion___block_invoke_2;
      v26[3] = &unk_264BA7C48;
      v27 = v21;
      [v23 animateAlongsideTransition:0 completion:v26];
    }
    else
    {
      v21[2](v21);
    }
  }
  else
  {
LABEL_13:

LABEL_17:
    v24 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v24;
      id v25 = [v10 viewControllers];
      *(_DWORD *)buf = 138412546;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v25;
      _os_log_impl(&dword_230B4C000, v12, OS_LOG_TYPE_DEFAULT, "_TVModalPresenter: Cannot hide %@. It isn't in the stack: %@", buf, 0x16u);

      goto LABEL_3;
    }
  }
LABEL_4:
}

- (void)_configureModalController:(id)a3 withFromController:(id)a4 andConfiguration:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend(v8, "setModalPresentationStyle:", objc_msgSend(v10, "presentationStyle"));
  uint64_t v11 = [v8 presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 _setShouldDismissWhenTappedOutside:1];
  }
  objc_msgSend(v8, "setNavigationBarHidden:animated:", objc_msgSend(v10, "navigationBarHidden"), 0);
  if ([v10 configurationType] == 3)
  {
    id v12 = [v9 childViewControllers];
    id v13 = [v12 lastObject];

    uint64_t v14 = [v13 navigationItem];
    uint64_t v15 = [v10 barButtonID];

    id v47 = v14;
    if (v15)
    {
      id v46 = self;
      uint64_t v16 = [MEMORY[0x263EFF980] array];
      uint64_t v17 = [v14 leftBarButtonItems];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        id v19 = [v14 leftBarButtonItems];
        [v16 addObjectsFromArray:v19];
      }
      v45 = v13;
      id v20 = [v14 rightBarButtonItems];
      uint64_t v21 = [v20 count];

      if (v21)
      {
        id v22 = [v14 rightBarButtonItems];
        [v16 addObjectsFromArray:v22];
      }
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = v16;
      uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v42 = v11;
        id v43 = v9;
        id v44 = v8;
        uint64_t v25 = *(void *)v50;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v50 != v25) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            v28 = [v27 customView];
            id v29 = objc_msgSend(v28, "tv_associatedIKViewElement");
            id v30 = [v29 attributes];
            id v31 = [v30 objectForKey:@"barButtonID"];

            BOOL v32 = [v10 barButtonID];
            int v33 = [v31 isEqualToString:v32];

            if (v33)
            {
              id v34 = v27;

              goto LABEL_23;
            }
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
          if (v24) {
            continue;
          }
          break;
        }
        id v34 = 0;
LABEL_23:
        id v9 = v43;
        id v8 = v44;
        uint64_t v11 = v42;
      }
      else
      {
        id v34 = 0;
      }

      id v13 = v45;
      self = v46;
    }
    else
    {
      id v34 = 0;
    }
    id v37 = [v8 popoverPresentationController];
    id v38 = v37;
    if (v34) {
      [v37 setBarButtonItem:v34];
    }
    __int16 v39 = [v10 sourceView];

    if (v39)
    {
      id v40 = [v10 sourceView];
      [v38 setSourceView:v40];

      [v10 sourceRect];
      objc_msgSend(v38, "setSourceRect:");
    }
    v41 = [MEMORY[0x263F1C550] whiteColor];
    [v38 setBackgroundColor:v41];

    [v38 setDelegate:self];
    [v10 popoverSize];
    objc_msgSend(v8, "setPreferredContentSize:");
  }
  else
  {
    if ([v10 configurationType] == 1)
    {
      [v10 formSheetSize];
    }
    else
    {
      double v35 = *MEMORY[0x263F001B0];
      double v36 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
    objc_msgSend(v8, "setPreferredContentSize:", v35, v36);
  }
}

- (BOOL)_isDismissing
{
  return self->_dismissing;
}

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(_TVModalPresenter *)self modalRootViewController];
  self->_dismissing = 1;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49___TVModalPresenter__dismissAnimated_completion___block_invoke;
  v15[3] = &unk_264BA7C98;
  objc_copyWeak(&v18, &location);
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = (void (**)(void))MEMORY[0x230FC9DC0](v15);
  uint64_t v11 = [v9 presentingViewController];

  if (v11)
  {
    id v12 = [v9 presentingViewController];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49___TVModalPresenter__dismissAnimated_completion___block_invoke_2;
    v13[3] = &unk_264BA68A0;
    uint64_t v14 = v10;
    [v12 dismissViewControllerAnimated:v4 completion:v13];
  }
  else
  {
    v10[2](v10);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_willRotateNotification:(id)a3
{
  id v7 = [(_TVModalPresenter *)self modalRootViewController];
  uint64_t v4 = [v7 presentingViewController];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [v7 modalPresentationStyle];

    if (v6 == 7) {
      [(_TVModalPresenter *)self hideAllAnimated:0 withCompletion:0];
    }
  }
}

- (void)_forceOrientationBackToSupportedOrientation
{
  id v7 = [MEMORY[0x263F1C408] sharedApplication];
  if ((unint64_t)([v7 statusBarOrientation] - 3) <= 1)
  {
    v2 = [v7 delegate];
    id v3 = [v2 window];
    uint64_t v4 = [v3 rootViewController];
    uint64_t v5 = [v4 supportedInterfaceOrientations] & 0x18;

    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x263F1C5C0] currentDevice];
      [v6 setOrientation:1];
    }
  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = [(_TVModalPresenter *)self modalRootViewController];
  [v4 reset];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"TVModalPresenterDismissedNotification" object:0];
}

- (UINavigationController)modalRootViewController
{
  return self->_modalRootViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalRootViewController, 0);
  objc_storeStrong((id *)&self->_playbackAnimator, 0);
  objc_storeStrong((id *)&self->_dismissingAnimator, 0);
  objc_storeStrong((id *)&self->_presentingAnimator, 0);
}

- (void)showController:(os_log_t)log fromController:withConfiguration:animated:andCompletionBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "Cannot show nil controller.", v1, 2u);
}

- (void)showController:(os_log_t)log fromController:withConfiguration:animated:andCompletionBlock:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "Cannot show controller from the ModalRootViewController", v1, 2u);
}

@end