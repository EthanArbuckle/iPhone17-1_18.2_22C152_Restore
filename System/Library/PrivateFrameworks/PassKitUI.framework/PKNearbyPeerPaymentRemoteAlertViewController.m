@interface PKNearbyPeerPaymentRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (NSDictionary)userInfo;
- (PKNearbyPeerPaymentViewController)viewController;
- (int64_t)nearbyContext;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss:(id)a3;
- (void)_handleInitialHome;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKNearbyPeerPaymentRemoteAlertViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKNearbyPeerPaymentRemoteAlertViewController;
  [(PKNearbyPeerPaymentRemoteAlertViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    [v6 bounds];
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    PKSetDisplayProperties();
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKNearbyPeerPaymentRemoteAlertViewController;
  [(PKNearbyPeerPaymentRemoteAlertViewController *)&v8 viewWillAppear:a3];
  [(PKNearbyPeerPaymentViewController *)self->_viewController setModalPresentationStyle:0];
  [(PKNearbyPeerPaymentViewController *)self->_viewController setModalTransitionStyle:2];
  [(PKNearbyPeerPaymentRemoteAlertViewController *)self presentViewController:self->_viewController animated:1 completion:0];
  if (!self->_inUseAssertion)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1E5E8];
    v5 = PKPassKitCoreBundle();
    id v6 = (CLInUseAssertion *)[v4 newAssertionForBundle:v5 withReason:@"Passbook displaying nearby remote UI"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v6;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKNearbyPeerPaymentRemoteAlertViewController;
  [(PKNearbyPeerPaymentRemoteAlertViewController *)&v11 viewWillDisappear:a3];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    v5 = inUseAssertion;
    id v6 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F87460] * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PKNearbyPeerPaymentRemoteAlertViewController_viewWillDisappear___block_invoke;
    block[3] = &unk_1E59CA7D0;
    v10 = v5;
    objc_super v8 = v5;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  [(PKNearbyPeerPaymentRemoteAlertViewController *)self _dismiss:0];
}

uint64_t __66__PKNearbyPeerPaymentRemoteAlertViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKNearbyPeerPaymentRemoteAlertViewController;
  [(PKNearbyPeerPaymentRemoteAlertViewController *)&v3 viewDidDisappear:a3];
  [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87000]];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = (void (**)(void))a4;
  dispatch_time_t v7 = [(PKNearbyPeerPaymentRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v7 setAllowsAlertItems:1];
  [v7 setAllowsSiri:0];
  [v7 setAllowsBanners:1];
  [v7 setAllowsAlertStacking:1];
  uint64_t IsAvailable = PKHomeButtonIsAvailable();
  if (IsAvailable) {
    uint64_t v9 = 16;
  }
  else {
    uint64_t v9 = 0;
  }
  objc_msgSend(v7, "setAllowsMenuButtonDismissal:", IsAvailable, v23);
  [v7 setDesiredHardwareButtonEvents:v9];
  [v7 setSwipeDismissalStyle:0];
  [v7 setDismissalAnimationStyle:1];
  [v7 setWallpaperStyle:0 withDuration:0.0];
  [v7 setLaunchingInterfaceOrientation:1];
  v10 = [v24 userInfo];
  userInfo = self->_userInfo;
  self->_userInfo = v10;

  v12 = [(NSDictionary *)self->_userInfo valueForKey:*MEMORY[0x1E4F878D0]];
  uint64_t v13 = *MEMORY[0x1E4F87000];
  if (v12) {
    [MEMORY[0x1E4F843E0] beginSubjectReporting:v13 withArchivedParent:v12];
  }
  else {
    [MEMORY[0x1E4F843E0] beginSubjectReporting:v13];
  }
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKNearbyPeerPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v28, &location);
  v14 = _Block_copy(aBlock);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __80__PKNearbyPeerPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke_2;
  v25[3] = &unk_1E59DD970;
  objc_copyWeak(&v26, &location);
  v15 = _Block_copy(v25);
  int64_t v16 = [(PKNearbyPeerPaymentRemoteAlertViewController *)self nearbyContext];
  if (v16)
  {
    if (v16 != 1) {
      goto LABEL_16;
    }
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_userInfo;
      *(_DWORD *)buf = 138412290;
      v31 = v18;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentSenderRemoteAlertViewController: initializing internal controller with user info %@", buf, 0xCu);
    }

    v19 = [[PKNearbyPeerPaymentSenderViewController alloc] initWithUserInfo:self->_userInfo screenEdgeSwipeAction:v14 dismissAction:v15];
  }
  else
  {
    v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_userInfo;
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentReceiverRemoteAlertViewController: initializing internal controller with user info %@", buf, 0xCu);
    }

    v19 = [[PKNearbyPeerPaymentReceiverViewController alloc] initWithUserInfo:self->_userInfo screenEdgeSwipeAction:v14 dismissAction:v15];
  }
  viewController = self->_viewController;
  self->_viewController = &v19->super;

LABEL_16:
  if (v6) {
    v6[2](v6);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __80__PKNearbyPeerPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInitialHome];
}

void __80__PKNearbyPeerPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dismiss:v3];
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v37;
    v22 = (void *)*MEMORY[0x1E4F869B0];
    id v23 = (void *)*MEMORY[0x1E4F86A68];
    v34 = (void *)*MEMORY[0x1E4F86A70];
    objc_super v8 = (void *)*MEMORY[0x1E4F869B8];
    uint64_t v31 = *MEMORY[0x1E4F864C8];
    uint64_t v32 = *MEMORY[0x1E4F87000];
    uint64_t v29 = *MEMORY[0x1E4F86A60];
    uint64_t v30 = *MEMORY[0x1E4F869F0];
    uint64_t v27 = *MEMORY[0x1E4F86308];
    uint64_t v28 = *MEMORY[0x1E4F86730];
    uint64_t v25 = *MEMORY[0x1E4F86120];
    uint64_t v26 = *MEMORY[0x1E4F86380];
    uint64_t v24 = *MEMORY[0x1E4F86500];
    do
    {
      uint64_t v9 = 0;
      uint64_t v33 = v6;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v36 + 1) + 8 * v9) events] & 0x10) != 0)
        {
          if ([(PKNearbyPeerPaymentViewController *)self->_viewController hideStatusBar])
          {
            [(PKNearbyPeerPaymentRemoteAlertViewController *)self _handleInitialHome];
            goto LABEL_20;
          }
          v10 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "NearbyPeerPayment/PKPeerPaymentRemoteAlertViewController: user initiated dismiss", buf, 2u);
          }

          int64_t v11 = [(PKNearbyPeerPaymentRemoteAlertViewController *)self nearbyContext];
          v12 = v34;
          uint64_t v13 = v8;
          if (v11 == 1)
          {
LABEL_14:
            id v14 = v12;
            id v15 = v13;
          }
          else
          {
            if (!v11)
            {
              uint64_t v13 = v22;
              v12 = v23;
              goto LABEL_14;
            }
            id v14 = 0;
            id v15 = 0;
          }
          if ([v14 length] && objc_msgSend(v15, "length"))
          {
            int64_t v16 = self;
            uint64_t v17 = v7;
            id v18 = v4;
            v19 = (void *)MEMORY[0x1E4F843E0];
            v40[0] = v31;
            v40[1] = v29;
            v41[0] = v30;
            v41[1] = v14;
            v40[2] = v28;
            v40[3] = v27;
            v41[2] = v15;
            v41[3] = v26;
            v40[4] = v25;
            v41[4] = v24;
            v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:5];
            v21 = v19;
            id v4 = v18;
            uint64_t v7 = v17;
            self = v16;
            uint64_t v6 = v33;
            [v21 subject:v32 sendEvent:v20];
          }
          [(PKNearbyPeerPaymentRemoteAlertViewController *)self _dismiss:0];
        }
LABEL_20:
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v6);
  }
}

- (void)_handleInitialHome
{
  [(PKNearbyPeerPaymentViewController *)self->_viewController setHideStatusBar:0];
  char IsAvailable = PKHomeButtonIsAvailable();
  if ((IsAvailable & 1) == 0)
  {
    id v4 = [(PKNearbyPeerPaymentRemoteAlertViewController *)self _remoteViewControllerProxy];
    [v4 setAllowsMenuButtonDismissal:1];
    [v4 setDesiredHardwareButtonEvents:16];
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1];
  [v5 impactOccurred];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke;
  v6[3] = &unk_1E59CDA78;
  v6[4] = self;
  char v7 = IsAvailable;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 992);
  *(void *)(v3 + 992) = v2;

  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 992);
  dispatch_time_t v6 = dispatch_time(0, 8000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  char v7 = *(NSObject **)(*(void *)(a1 + 32) + 992);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke_2;
  handler[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v12, &location);
  char v13 = *(unsigned char *)(a1 + 40);
  dispatch_source_set_event_handler(v7, handler);
  objc_super v8 = *(NSObject **)(*(void *)(a1 + 32) + 992);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke_3;
  v9[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_cancel_handler(v8, v9);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 992));
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained[124];
  if (v3)
  {
    WeakRetained[124] = 0;
    uint64_t v5 = WeakRetained;

    [v5[125] setHideStatusBar:1];
    id WeakRetained = v5;
    if (!*(unsigned char *)(a1 + 40))
    {
      id v4 = [v5 _remoteViewControllerProxy];
      [v4 setAllowsMenuButtonDismissal:0];
      [v4 setDesiredHardwareButtonEvents:0];

      id WeakRetained = v5;
    }
  }
}

void __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[124];
  WeakRetained[124] = 0;
}

- (void)_dismiss:(id)a3
{
  id v4 = a3;
  systemUITimer = self->_systemUITimer;
  if (systemUITimer) {
    dispatch_source_cancel(systemUITimer);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKNearbyPeerPaymentRemoteAlertViewController__dismiss___block_invoke;
  v7[3] = &unk_1E59CAD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKNearbyPeerPaymentRemoteAlertViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

void __57__PKNearbyPeerPaymentRemoteAlertViewController__dismiss___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [*(id *)(*(void *)(a1 + 32) + 1000) invalidate];
  [v3 invalidate];
  [*(id *)(a1 + 32) _cleanup];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (PKNearbyPeerPaymentViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (int64_t)nearbyContext
{
  return self->_nearbyContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_systemUITimer, 0);

  objc_storeStrong((id *)&self->_inUseAssertion, 0);
}

@end