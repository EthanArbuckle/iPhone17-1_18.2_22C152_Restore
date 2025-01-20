@interface PKLaunchAuthorizationPromptController
- (BOOL)_canPresentPrompt;
- (BOOL)isPresentingNotificationAuthorizationPrompt;
- (PKLaunchAuthorizationPromptController)initWithContext:(int64_t)a3 dataProvider:(id)a4 delegate:(id)a5;
- (void)disableLaunchPromptsForSession;
- (void)enableLaunchPromptsForSession;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)presentLaunchPromptsForPassesIfNeeded:(id)a3;
- (void)resetLaunchPromptsForNextSession;
@end

@implementation PKLaunchAuthorizationPromptController

uint64_t __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 40) resetLaunchPromptsForNextSession];
}

- (void)presentLaunchPromptsForPassesIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F14428];
  id v6 = MEMORY[0x1E4F14428];
  if (self->_shouldShowLaunchPrompts == 1 && !self->_evaluatingPresentment)
  {
    self->_evaluatingPresentment = 1;
    objc_initWeak(&location, self);
    id v7 = objc_alloc_init(MEMORY[0x1E4F84518]);
    if (self->_userNotificationAuthorizationViewController)
    {
      v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKLaunchAuthorizationPromptController: Skipping notification auth presentation due to other launch activity", buf, 2u);
      }
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke;
      v21[3] = &unk_1E59CD438;
      v22 = v4;
      id v9 = v5;
      id v23 = v5;
      objc_copyWeak(&v24, &location);
      [v7 addOperation:v21];
      objc_destroyWeak(&v24);

      v8 = v22;
    }

    if (!self->_locationAuthorizationRequested)
    {
      self->_locationAuthorizationRequested = 1;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_20;
      v17[3] = &unk_1E59D0108;
      id v10 = v5;
      id v18 = v5;
      objc_copyWeak(&v19, &location);
      [v7 addOperation:v17];
      objc_destroyWeak(&v19);
    }
    v11 = [MEMORY[0x1E4F1CA98] null];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_4;
    v14[3] = &unk_1E59DAEA0;
    id v12 = v5;
    id v15 = v5;
    v16 = self;
    id v13 = (id)[v7 evaluateWithInput:v11 completion:v14];

    objc_destroyWeak(&location);
  }
}

- (void)resetLaunchPromptsForNextSession
{
  self->_shouldShowLaunchPrompts = 0;
  self->_evaluatingPresentment = 0;
  self->_locationAuthorizationRequested = 0;
}

- (void)enableLaunchPromptsForSession
{
  if (self->_shouldShowLaunchPrompts != 2) {
    self->_shouldShowLaunchPrompts = 1;
  }
}

uint64_t __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3_23(uint64_t a1)
{
  if (![*(id *)(a1 + 32) authorizationStatus]) {
    [*(id *)(a1 + 32) requestWhenInUseAuthorization];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2_21(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1E600]);
  v3 = PKPassKitCoreBundle();
  id v4 = [v3 bundlePath];
  v5 = (void *)[v2 initWithEffectiveBundlePath:v4 delegate:*(void *)(a1 + 32) onQueue:*(void *)(a1 + 40)];

  id v6 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3_23;
  block[3] = &unk_1E59CA938;
  id v9 = v5;
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v7 = v5;
  dispatch_async(v6, block);
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_20(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained && ([WeakRetained _canPresentPrompt] & 1) != 0)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2_21;
    v11[3] = &unk_1E59CE9B0;
    v11[4] = v9;
    id v12 = *(id *)(a1 + 32);
    id v14 = v7;
    id v13 = v6;
    dispatch_async(v10, v11);
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

- (BOOL)_canPresentPrompt
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    if ([v5 canPresentLaunchPrompts]) {
      BOOL v6 = self->_shouldShowLaunchPrompts == 1;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F850F8] sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2;
  v15[3] = &unk_1E59DAE78;
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  objc_copyWeak(&v20, (id *)(a1 + 48));
  id v12 = v9;
  id v19 = v12;
  id v13 = v8;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [v14 shouldOfferAuthorizationPromptWithPasses:v11 completion:v15];

  objc_destroyWeak(&v20);
}

- (PKLaunchAuthorizationPromptController)initWithContext:(int64_t)a3 dataProvider:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKLaunchAuthorizationPromptController;
  uint64_t v11 = [(PKLaunchAuthorizationPromptController *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    v11->_context = a3;
    objc_storeStrong((id *)&v11->_dataProvider, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_shouldShowLaunchPrompts = 1;
  }

  return v12;
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2(id *a1, char a2, void *a3)
{
  BOOL v6 = a1[4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3;
  block[3] = &unk_1E59DAE50;
  objc_copyWeak(v12, a1 + 8);
  id v11 = a1[7];
  id v8 = a1[5];
  char v13 = a2;
  id v9 = a1[6];
  v12[1] = a3;
  id v10 = a1[4];
  dispatch_async(v6, block);

  objc_destroyWeak(v12);
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (!WeakRetained || !*(unsigned char *)(a1 + 80))
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  if (([WeakRetained _canPresentPrompt] & 1) == 0)
  {
    BOOL v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKLaunchAuthorizationPromptController: Skipping notification TCC warming screen as we are unable to present in the current state", buf, 2u);
    }

    goto LABEL_8;
  }
  id v5 = [[PKUserNotificationAuthorizationExplanationViewController alloc] initWithController:*(void *)(a1 + 40) contentType:*(void *)(a1 + 72) context:*((void *)v4 + 1) dataProvider:*((void *)v4 + 2)];
  objc_storeStrong((id *)v4 + 6, v5);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_12;
  v12[3] = &unk_1E59DAE00;
  id v13 = *(id *)(a1 + 48);
  objc_copyWeak(&v16, v2);
  id v15 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 32);
  [(PKUserNotificationAuthorizationExplanationViewController *)v5 setNextStepHandler:v12];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3_15;
  v7[3] = &unk_1E59DAE28;
  id v8 = *(id *)(a1 + 48);
  objc_copyWeak(&v11, v2);
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  [(PKUserNotificationAuthorizationExplanationViewController *)v5 preflightWithCompletion:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v16);

LABEL_9:
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_12(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2_13;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    id v4 = WeakRetained;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v4;
  }
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained _canPresentPrompt] & 1) != 0)
  {
    id v4 = [[PKNavigationController alloc] initWithRootViewController:*((void *)v3 + 6)];
    [(PKNavigationController *)v4 setNavigationBarHidden:1];
    if ([(UIViewController *)v4 pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKNavigationController *)v4 setModalPresentationStyle:1];
    }
    id v5 = objc_loadWeakRetained((id *)v3 + 3);
    [v5 presentLaunchPromptViewController:v4];
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKLaunchAuthorizationPromptController: Skipping notification TCC warming screen just before presenting as we are no longer able to present in the current state", v7, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)disableLaunchPromptsForSession
{
  self->_shouldShowLaunchPrompts = 2;
  self->_evaluatingPresentment = 0;
}

- (BOOL)isPresentingNotificationAuthorizationPrompt
{
  userNotificationAuthorizationViewController = self->_userNotificationAuthorizationViewController;
  if (userNotificationAuthorizationViewController) {
    LOBYTE(userNotificationAuthorizationViewController) = [(PKUserNotificationAuthorizationExplanationViewController *)userNotificationAuthorizationViewController isPresentingNotificationAuthorizationPrompt];
  }
  return (char)userNotificationAuthorizationViewController;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PKLaunchAuthorizationPromptController_locationManagerDidChangeAuthorization___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __79__PKLaunchAuthorizationPromptController_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) authorizationStatus];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = result != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationAuthorizationViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end