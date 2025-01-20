@interface ICQUIOutOfProcessUpgradeFlowManager
+ (id)sharedManager;
- (BOOL)_canUseExtensionKitForURL:(id)a3;
- (BOOL)_isDefaultOfferFlow:(id)a3;
- (BOOL)isPresented;
- (ICQLink)link;
- (ICQOffer)offer;
- (ICQRemoteContext)remoteContext;
- (ICQRemoteUIDataLoader)loader;
- (ICQUIOutOfProcessUpgradeFlowManager)init;
- (ICQUpgradeFlowManager)flowManager;
- (ICQUpgradeFlowManagerDelegate)delegate;
- (ICQUpgradeFlowOptions)flowOptions;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (id)_rootViewController;
- (id)_topMostPresentingViewController;
- (void)_beginExtensionKitFlowWithViewController:(id)a3;
- (void)_beginSBRemoteAlertFlow;
- (void)_clearServerUIURL;
- (void)_startUpsellWithOffer:(id)a3 link:(id)a4 preloadedRemoteUIData:(id)a5 error:(id)a6 isPostPurchaseFlow:(BOOL)a7;
- (void)_topMostPresentingViewController;
- (void)beginFlowWithViewController:(id)a3;
- (void)beginPostPurchaseFlowWithOffer:(id)a3 link:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFlowManager:(id)a3;
- (void)setFlowOptions:(id)a3;
- (void)setIsPresented:(BOOL)a3;
- (void)setLink:(id)a3;
- (void)setLoader:(id)a3;
- (void)setOffer:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setRemoteContext:(id)a3;
@end

@implementation ICQUIOutOfProcessUpgradeFlowManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ICQUIOutOfProcessUpgradeFlowManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sRemoteUpgradeFlowManager;
  return v2;
}

void __52__ICQUIOutOfProcessUpgradeFlowManager_sharedManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_sRemoteUpgradeFlowManager;
  sharedManager_sRemoteUpgradeFlowManager = (uint64_t)v0;
}

- (ICQUIOutOfProcessUpgradeFlowManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICQUIOutOfProcessUpgradeFlowManager;
  v2 = [(ICQUIOutOfProcessUpgradeFlowManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ICQRemoteUIDataLoader);
    loader = v2->_loader;
    v2->_loader = v3;

    v2->_presentationLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)beginPostPurchaseFlowWithOffer:(id)a3 link:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICQUIOutOfProcessUpgradeFlowManager beginPostPurchaseFlowWithOffer:link:]();
  }

  v9 = [v7 actionURL];
  [v6 _updateRequestedServerUIURLWithURL:v9];

  [(ICQUIOutOfProcessUpgradeFlowManager *)self _startUpsellWithOffer:v6 link:v7 preloadedRemoteUIData:0 error:0 isPostPurchaseFlow:1];
}

- (void)beginFlowWithViewController:(id)a3
{
  id v4 = a3;
  v5 = [(ICQUIOutOfProcessUpgradeFlowManager *)self offer];
  BOOL v6 = [(ICQUIOutOfProcessUpgradeFlowManager *)self _isDefaultOfferFlow:v5];

  id v7 = [(ICQUIOutOfProcessUpgradeFlowManager *)self offer];
  v8 = [v7 serverUIURL];
  BOOL v9 = [(ICQUIOutOfProcessUpgradeFlowManager *)self _canUseExtensionKitForURL:v8];

  if (v4)
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [(ICQUIOutOfProcessUpgradeFlowManager *)self _topMostPresentingViewController];
    BOOL v10 = v11 == 0;
  }
  v12 = [(ICQUIOutOfProcessUpgradeFlowManager *)self link];
  uint64_t v13 = [v12 action];

  v14 = [(ICQUIOutOfProcessUpgradeFlowManager *)self presentingSceneIdentifier];

  if (!v14)
  {
    BOOL v21 = v6;
    v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Unknown scene identifier! Falling back to topmost viewcontroller's scene", buf, 2u);
    }

    v16 = [(ICQUIOutOfProcessUpgradeFlowManager *)self _topMostPresentingViewController];
    v17 = [v16 view];
    v18 = [v17 window];
    v19 = [v18 windowScene];
    v20 = [v19 _sceneIdentifier];
    [(ICQUIOutOfProcessUpgradeFlowManager *)self setPresentingSceneIdentifier:v20];

    BOOL v6 = v21;
  }
  if (v6 || v10 || !v9 || v13 == 127) {
    [(ICQUIOutOfProcessUpgradeFlowManager *)self _beginSBRemoteAlertFlow];
  }
  else {
    [(ICQUIOutOfProcessUpgradeFlowManager *)self _beginExtensionKitFlowWithViewController:v4];
  }
}

- (BOOL)_canUseExtensionKitForURL:(id)a3
{
  id v3 = a3;
  char v4 = +[ICQUIExtensionKitHelpers isExtensionKitFlagEnabled];
  uint64_t v5 = +[ICQUIExtensionKitHelpers isExtensionKitURL:v3];

  BOOL v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(ICQUIOutOfProcessUpgradeFlowManager *)v4 _canUseExtensionKitForURL:v6];
  }

  return v4 | v5;
}

- (BOOL)_isDefaultOfferFlow:(id)a3
{
  id v3 = a3;
  char v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.icq"];

  BOOL v6 = [v3 serverUIURL];

  if (v6) {
    return v5;
  }
  else {
    return 1;
  }
}

- (void)_beginSBRemoteAlertFlow
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  id v29 = [(ICQUIOutOfProcessUpgradeFlowManager *)self offer];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  id v23 = [(ICQUIOutOfProcessUpgradeFlowManager *)self link];
  p_presentationLock = &self->_presentationLock;
  os_unfair_lock_lock(&self->_presentationLock);
  if (!self->_isPresented)
  {
    self->_isPresented = 1;
    os_unfair_lock_unlock(&self->_presentationLock);
    BOOL v9 = [(id)v25[5] requestedServerUIURL];
    if (v9)
    {
      if ([(id)v19[5] action] != 115 && objc_msgSend((id)v19[5], "action") != 121)
      {
        objc_initWeak(buf, self);
        BOOL v10 = [(ICQUIOutOfProcessUpgradeFlowManager *)self loader];
        v11 = [(id)v25[5] serverUIURL];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __62__ICQUIOutOfProcessUpgradeFlowManager__beginSBRemoteAlertFlow__block_invoke;
        v12[3] = &unk_2649230A0;
        objc_copyWeak(&v16, buf);
        v14 = &v24;
        id v13 = v9;
        v15 = &v18;
        [v10 loadDataFromURL:v11 completion:v12];

        objc_destroyWeak(&v16);
        objc_destroyWeak(buf);
        goto LABEL_12;
      }
      [(id)v25[5] _updateRequestedServerUIURLWithURL:v9];
    }
    [(ICQUIOutOfProcessUpgradeFlowManager *)self _startUpsellWithOffer:v25[5] link:v19[5] preloadedRemoteUIData:0 error:0 isPostPurchaseFlow:0];
LABEL_12:

    goto LABEL_13;
  }
  char v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Remote flow already presented! Wait until it's complete.", (uint8_t *)buf, 2u);
  }

  char v5 = [(ICQUIOutOfProcessUpgradeFlowManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ICQUIOutOfProcessUpgradeFlowManager *)self delegate];
    v8 = [(ICQUIOutOfProcessUpgradeFlowManager *)self flowManager];
    [v7 upgradeFlowManagerDidCancel:v8];
  }
  os_unfair_lock_unlock(p_presentationLock);
LABEL_13:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __62__ICQUIOutOfProcessUpgradeFlowManager__beginSBRemoteAlertFlow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v11 || !WeakRetained)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _updateRequestedServerUIURLWithURL:*(void *)(a1 + 32)];
    [WeakRetained _startUpsellWithOffer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) link:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) preloadedRemoteUIData:v11 error:v5 isPostPurchaseFlow:0];
  }
  else
  {
    [WeakRetained setIsPresented:0];
    [WeakRetained _clearServerUIURL];
    id v7 = [WeakRetained delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      BOOL v9 = [WeakRetained delegate];
      BOOL v10 = [WeakRetained flowManager];
      [v9 upgradeFlowManagerDidCancel:v10];
    }
  }
}

- (void)_startUpsellWithOffer:(id)a3 link:(id)a4 preloadedRemoteUIData:(id)a5 error:(id)a6 isPostPurchaseFlow:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = _ICQGetLogSystem();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ICQUIOutOfProcessUpgradeFlowManager _startUpsellWithOffer:link:preloadedRemoteUIData:error:isPostPurchaseFlow:](v15);
    }

    self->_isPresented = 0;
    [(ICQUIOutOfProcessUpgradeFlowManager *)self _clearServerUIURL];
    uint64_t v18 = [(ICQUIOutOfProcessUpgradeFlowManager *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      uint64_t v20 = [(ICQUIOutOfProcessUpgradeFlowManager *)self delegate];
      BOOL v21 = [(ICQUIOutOfProcessUpgradeFlowManager *)self flowManager];
      [v20 upgradeFlowManagerDidCancel:v21];
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "Presenting out-of-process upgrade flow.", buf, 2u);
    }

    id v22 = objc_alloc(MEMORY[0x263F88938]);
    id v23 = [(ICQUIOutOfProcessUpgradeFlowManager *)self flowOptions];
    uint64_t v24 = [v23 serializedData];
    v25 = (void *)[v22 initWithOffer:v12 link:v13 flowOptionsData:v24 preloadedRemoteUIData:v14 isPostPurchaseFlow:v7];
    [(ICQUIOutOfProcessUpgradeFlowManager *)self setRemoteContext:v25];

    [(ICQRemoteContext *)self->_remoteContext setPresentingSceneIdentifier:self->_presentingSceneIdentifier];
    [(ICQRemoteContext *)self->_remoteContext setPresentingSceneBundleIdentifier:self->_presentingSceneBundleIdentifier];
    objc_initWeak(&location, self);
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    uint64_t v26 = (void *)getINDaemonConnectionClass_softClass_3;
    uint64_t v41 = getINDaemonConnectionClass_softClass_3;
    if (!getINDaemonConnectionClass_softClass_3)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v34 = 3221225472;
      v35 = __getINDaemonConnectionClass_block_invoke_3;
      v36 = &unk_264921E58;
      v37 = &v38;
      __getINDaemonConnectionClass_block_invoke_3((uint64_t)buf);
      uint64_t v26 = (void *)v39[3];
    }
    v27 = v26;
    _Block_object_dispose(&v38, 8);
    id v28 = objc_alloc_init(v27);
    id v29 = [(ICQUIOutOfProcessUpgradeFlowManager *)self remoteContext];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __113__ICQUIOutOfProcessUpgradeFlowManager__startUpsellWithOffer_link_preloadedRemoteUIData_error_isPostPurchaseFlow___block_invoke;
    v30[3] = &unk_2649230C8;
    objc_copyWeak(&v31, &location);
    v30[4] = self;
    [v28 presentHiddenFreshmintWithContext:v29 completion:v30];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void __113__ICQUIOutOfProcessUpgradeFlowManager__startUpsellWithOffer_link_preloadedRemoteUIData_error_isPostPurchaseFlow___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v7 = WeakRetained;
  if (!WeakRetained)
  {
    id v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __113__ICQUIOutOfProcessUpgradeFlowManager__startUpsellWithOffer_link_preloadedRemoteUIData_error_isPostPurchaseFlow___block_invoke_cold_1();
    }
    goto LABEL_18;
  }
  [WeakRetained setRemoteContext:0];
  [v7 setIsPresented:0];
  [v7 _clearServerUIURL];
  char v8 = _ICQGetLogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v9) {
      goto LABEL_15;
    }
    int v19 = 138412290;
    id v20 = v5;
    BOOL v10 = "[Within Client] presentHiddenFreshmintWithUserInfo ERROR = %@";
    id v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_14;
  }
  if (!a2)
  {
    if (!v9) {
      goto LABEL_15;
    }
    LOWORD(v19) = 0;
    BOOL v10 = "[Within Client] presentHiddenFreshmintWithUserInfo didCancel flow";
    id v11 = v8;
    uint32_t v12 = 2;
LABEL_14:
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v12);
LABEL_15:

    v17 = [v7 delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v13 = [v7 delegate];
      id v16 = [v7 flowManager];
      [v13 upgradeFlowManagerDidCancel:v16];
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (v9)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "[Within Client] presentHiddenFreshmintWithUserInfo didComplete flow", (uint8_t *)&v19, 2u);
  }

  id v14 = [v7 delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v13 = [v7 delegate];
    id v16 = [v7 flowManager];
    [v13 upgradeFlowManagerDidComplete:v16];
LABEL_17:

LABEL_18:
  }
LABEL_19:
}

- (void)_beginExtensionKitFlowWithViewController:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_presentationLock);
  if (!self->_isPresented)
  {
    self->_isPresented = 1;
    os_unfair_lock_unlock(&self->_presentationLock);
    BOOL v10 = [v4 presentedViewController];

    if (v10)
    {
      id v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ICQUIOutOfProcessUpgradeFlowManager _beginExtensionKitFlowWithViewController:](v11);
      }
    }
    else if (v4)
    {
      id v12 = v4;
      goto LABEL_13;
    }
    id v12 = [(ICQUIOutOfProcessUpgradeFlowManager *)self _topMostPresentingViewController];
LABEL_13:
    char v8 = v12;
    id v9 = [(ICQUIOutOfProcessUpgradeFlowManager *)self delegate];
    if (!v8)
    {
      uint64_t v21 = _ICQGetLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ICQUIOutOfProcessUpgradeFlowManager _beginExtensionKitFlowWithViewController:](v21);
      }

      [(ICQUIOutOfProcessUpgradeFlowManager *)self setIsPresented:0];
      [(ICQUIOutOfProcessUpgradeFlowManager *)self _clearServerUIURL];
      if (objc_opt_respondsToSelector())
      {
        id v22 = [(ICQUIOutOfProcessUpgradeFlowManager *)self flowManager];
        id v23 = ICQCreateError();
        [v9 upgradeFlowManagerDidFail:v22 error:v23];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_22;
        }
        id v22 = [(ICQUIOutOfProcessUpgradeFlowManager *)self flowManager];
        [v9 upgradeFlowManagerDidCancel:v22];
      }

      goto LABEL_22;
    }
    id v13 = objc_alloc(MEMORY[0x263F88938]);
    id v14 = [(ICQUIOutOfProcessUpgradeFlowManager *)self offer];
    char v15 = [(ICQUIOutOfProcessUpgradeFlowManager *)self link];
    id v16 = [(ICQUIOutOfProcessUpgradeFlowManager *)self flowOptions];
    v17 = [v16 serializedData];
    char v18 = (void *)[v13 initWithOffer:v14 link:v15 flowOptionsData:v17 preloadedRemoteUIData:0];
    [(ICQUIOutOfProcessUpgradeFlowManager *)self setRemoteContext:v18];

    [(ICQRemoteContext *)self->_remoteContext setPresentingSceneIdentifier:self->_presentingSceneIdentifier];
    [(ICQRemoteContext *)self->_remoteContext setPresentingSceneBundleIdentifier:self->_presentingSceneBundleIdentifier];
    int v19 = [(ICQUIOutOfProcessUpgradeFlowManager *)self remoteContext];
    id v20 = [v19 toDictionary];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __80__ICQUIOutOfProcessUpgradeFlowManager__beginExtensionKitFlowWithViewController___block_invoke;
    v24[3] = &unk_2649230F0;
    v24[4] = self;
    id v9 = v9;
    id v25 = v9;
    +[ICQUIRemoteExtensionEntry presentRemoteViewControllerWithContext:v20 presentingViewController:v8 completion:v24];

LABEL_22:
    goto LABEL_23;
  }
  os_unfair_lock_unlock(&self->_presentationLock);
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Remote extension flow already presented! Wait until it's complete.", buf, 2u);
  }

  char v6 = [(ICQUIOutOfProcessUpgradeFlowManager *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(ICQUIOutOfProcessUpgradeFlowManager *)self delegate];
    id v9 = [(ICQUIOutOfProcessUpgradeFlowManager *)self flowManager];
    [v8 upgradeFlowManagerDidCancel:v9];
    goto LABEL_22;
  }
LABEL_23:
}

void __80__ICQUIOutOfProcessUpgradeFlowManager__beginExtensionKitFlowWithViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 12) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(a1 + 32) _clearServerUIURL];
  if (a2)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v4 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) flowManager];
    objc_msgSend(v4, "upgradeFlowManagerDidCancel:");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) flowManager];
    objc_msgSend(v5, "upgradeFlowManagerDidComplete:");
  }
}

- (id)_topMostPresentingViewController
{
  v2 = [(ICQUIOutOfProcessUpgradeFlowManager *)self _rootViewController];
  id v3 = [v2 topMostViewController];

  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICQUIOutOfProcessUpgradeFlowManager _topMostPresentingViewController]();
  }

  return v3;
}

- (id)_rootViewController
{
  v2 = [MEMORY[0x263F82438] sharedApplication];
  id v3 = [v2 keyWindow];
  id v4 = [v3 rootViewController];

  return v4;
}

- (void)_clearServerUIURL
{
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
}

- (ICQLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (ICQUpgradeFlowOptions)flowOptions
{
  return self->_flowOptions;
}

- (void)setFlowOptions:(id)a3
{
}

- (ICQUpgradeFlowManager)flowManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowManager);
  return (ICQUpgradeFlowManager *)WeakRetained;
}

- (void)setFlowManager:(id)a3
{
}

- (ICQUpgradeFlowManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQUpgradeFlowManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (ICQRemoteContext)remoteContext
{
  return self->_remoteContext;
}

- (void)setRemoteContext:(id)a3
{
}

- (ICQRemoteUIDataLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_flowManager);
  objc_storeStrong((id *)&self->_flowOptions, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)beginPostPurchaseFlowWithOffer:link:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_22C821000, v0, v1, "Presenting success flow with offer: %@ and link: %@");
}

- (void)_canUseExtensionKitForURL:(NSObject *)a3 .cold.1(char a1, uint64_t a2, NSObject *a3)
{
  id v3 = @"NO";
  if (a1) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if (a2) {
    id v3 = @"YES";
  }
  *(_DWORD *)id v5 = 138412546;
  *(void *)&v5[4] = v4;
  *(_WORD *)&v5[12] = 2112;
  *(void *)&v5[14] = v3;
  OUTLINED_FUNCTION_1_1(&dword_22C821000, a2, a3, "isExtensionKitFlagEnabled: %@, isExtensionKitURL: %@", *(void *)v5, *(void *)&v5[8], *(void *)&v5[16], *MEMORY[0x263EF8340]);
}

- (void)_startUpsellWithOffer:(void *)a1 link:preloadedRemoteUIData:error:isPostPurchaseFlow:.cold.1(void *a1)
{
  os_log_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_22C821000, v2, v3, "Unable to present at this time, %@.", v4, v5, v6, v7, v8);
}

void __113__ICQUIOutOfProcessUpgradeFlowManager__startUpsellWithOffer_link_preloadedRemoteUIData_error_isPostPurchaseFlow___block_invoke_cold_1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  id v1 = v0;
  OUTLINED_FUNCTION_0_2(&dword_22C821000, v2, v3, "%@ instance no longer exist.", v4, v5, v6, v7, v8);
}

- (void)_beginExtensionKitFlowWithViewController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Viewcontroller is nil and couldn't find a root view controller -- Unable to start extension flow!", v1, 2u);
}

- (void)_beginExtensionKitFlowWithViewController:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Provided viewcontroller is already presenting! Using workaround to get topmost view controller", v1, 2u);
}

- (void)_topMostPresentingViewController
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEBUG, "Returning topmost VC %@", v1, 0xCu);
}

@end