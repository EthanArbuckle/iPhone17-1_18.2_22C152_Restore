@interface PKPasscodeUpgradeFlowController
- (BOOL)_isWatchTarget;
- (BOOL)upgradeRequiredToAddNewPass;
- (PKPasscodeUpgradeFlowController)init;
- (PKPasscodeUpgradeFlowController)initWithPaymentProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 flowRenderer:(id)a6 completionHandler:(id)a7;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice;
- (id)setupLaterHandler;
- (int64_t)context;
- (void)_completeWithShouldContinue:(BOOL)a3 error:(id)a4;
- (void)_showChangePasscodeFlow;
- (void)_showCurrentDevicePasscodeViewController;
- (void)_showNewDevicePasscodeViewControllerWithCurrentPasscode:(id)a3;
- (void)_showPasscodeUpgradeExplanation;
- (void)beginShowingViewController;
- (void)dealloc;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)dismissPasscodeUpgradeFlow;
- (void)endedShowingViewController;
- (void)forceShowPasscodeUpgradeFlow;
- (void)newDevicePasscodeViewController:(id)a3 didFinishSettingPasscode:(BOOL)a4 withError:(id)a5;
- (void)setSetupLaterHandler:(id)a3;
- (void)setUpgradeRequiredToAddNewPass:(BOOL)a3;
- (void)showPasscodeUpgradeFlow;
- (void)showPasscodeUpgradeFlow:(BOOL)a3;
@end

@implementation PKPasscodeUpgradeFlowController

- (PKPasscodeUpgradeFlowController)init
{
  return 0;
}

- (PKPasscodeUpgradeFlowController)initWithPaymentProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 flowRenderer:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PKPasscodeUpgradeFlowController;
  v17 = [(PKPasscodeUpgradeFlowController *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_context = a4;
    objc_storeStrong((id *)&v17->_provisioningController, a3);
    objc_storeWeak((id *)&v18->_setupDelegate, v14);
    v19 = _Block_copy(v16);
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v19;

    objc_storeWeak((id *)&v18->_flowRenderer, v15);
  }

  return v18;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPasscodeUpgradeFlowController;
  [(PKPasscodeUpgradeFlowController *)&v4 dealloc];
}

- (void)showPasscodeUpgradeFlow
{
}

- (void)forceShowPasscodeUpgradeFlow
{
}

- (void)showPasscodeUpgradeFlow:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4FB2640];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_dismissPasscodeUpgradeFlow name:v6 object:0];

  int v8 = [(PKPaymentProvisioningController *)self->_provisioningController isPasscodeUpgradeRequired];
  if (v3)
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "%@: Force beginning passcode upgrade flow", buf, 0xCu);
    }

    [(PKPasscodeUpgradeFlowController *)self _showPasscodeUpgradeExplanation];
  }
  else
  {
    int v10 = v8;
    if (self->_upgradeRequiredToAddNewPass) {
      int v11 = 1;
    }
    else {
      int v11 = v8;
    }
    if (v11 == 1)
    {
      objc_initWeak(&location, self);
      v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL upgradeRequiredToAddNewPass = self->_upgradeRequiredToAddNewPass;
        *(_DWORD *)buf = 138412802;
        v20 = self;
        __int16 v21 = 1024;
        int v22 = v10;
        __int16 v23 = 1024;
        BOOL v24 = upgradeRequiredToAddNewPass;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "%@: Preflighting passcode upgrade (strong passcode required for added pass: %d, strong passcode required to add new pass: %d)", buf, 0x18u);
      }

      provisioningController = self->_provisioningController;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __59__PKPasscodeUpgradeFlowController_showPasscodeUpgradeFlow___block_invoke;
      v16[3] = &unk_1E59E0568;
      objc_copyWeak(&v17, &location);
      v16[4] = self;
      [(PKPaymentProvisioningController *)provisioningController preflightPasscodeUpgradeWithCompletion:v16];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = self;
        _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "%@: Skipping passcode upgrade", buf, 0xCu);
      }

      [(PKPasscodeUpgradeFlowController *)self _completeWithShouldContinue:1 error:0];
    }
  }
}

void __59__PKPasscodeUpgradeFlowController_showPasscodeUpgradeFlow___block_invoke(uint64_t a1, int a2, char a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7 || !a2)
    {
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v16;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "%@: Passcode upgrade failed with error: %@", buf, 0x16u);
      }

      v12 = v9;
      uint64_t v13 = 0;
      id v14 = v7;
    }
    else
    {
      if ((a3 & 1) == 0)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __59__PKPasscodeUpgradeFlowController_showPasscodeUpgradeFlow___block_invoke_2;
        v17[3] = &unk_1E59CA870;
        v17[4] = *(void *)(a1 + 32);
        v17[5] = WeakRetained;
        dispatch_async(MEMORY[0x1E4F14428], v17);
        goto LABEL_13;
      }
      int v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v11;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "%@: Passcode upgrade flow not needed - passcode meets requirements", buf, 0xCu);
      }

      v12 = v9;
      uint64_t v13 = 1;
      id v14 = 0;
    }
    [v12 _completeWithShouldContinue:v13 error:v14];
  }
LABEL_13:
}

uint64_t __59__PKPasscodeUpgradeFlowController_showPasscodeUpgradeFlow___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "%@: Beginning passcode upgrade flow", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _showPasscodeUpgradeExplanation];
}

- (void)dismissPasscodeUpgradeFlow
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "%@: Dismissing passcode upgrade flow", (uint8_t *)&v4, 0xCu);
  }

  [(PKPasscodeUpgradeFlowController *)self _completeWithShouldContinue:0 error:0];
}

- (void)beginShowingViewController
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Passcode Upgrade Flow: Beginning showing view controller", v4, 2u);
  }

  ++self->_presentedViewControllerCount;
}

- (void)endedShowingViewController
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Passcode Upgrade Flow: Ended showing view controller", buf, 2u);
  }

  int64_t presentedViewControllerCount = self->_presentedViewControllerCount;
  self->_int64_t presentedViewControllerCount = presentedViewControllerCount - 1;
  if (presentedViewControllerCount <= 1 && self->_completionHandler)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Passcode Upgrade Flow: Last view controller removed, dismissing flow...", v5, 2u);
    }

    [(PKPasscodeUpgradeFlowController *)self dismissPasscodeUpgradeFlow];
  }
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  v2 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
  uint64_t v3 = [v2 targetDevice];

  return (PKPaymentWebServiceTargetDeviceProtocol *)v3;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  objc_msgSend(a3, "pk_zString");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPasscodeUpgradeFlowController *)self _showNewDevicePasscodeViewControllerWithCurrentPasscode:v4];
}

- (void)newDevicePasscodeViewController:(id)a3 didFinishSettingPasscode:(BOOL)a4 withError:(id)a5
{
}

- (void)_completeWithShouldContinue:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v17 = self;
    __int16 v18 = 2112;
    if (v4) {
      int v8 = @"YES";
    }
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "%@: Called complete with shouldContinue:%@ error:%@", buf, 0x20u);
  }

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];

  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PKPasscodeUpgradeFlowController__completeWithShouldContinue_error___block_invoke;
  v11[3] = &unk_1E59CB9F0;
  objc_copyWeak(&v14, (id *)buf);
  BOOL v15 = v4;
  id v12 = v6;
  uint64_t v13 = self;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __69__PKPasscodeUpgradeFlowController__completeWithShouldContinue_error___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    [WeakRetained[2] passcodeUpgradeCompleted:*(unsigned __int8 *)(a1 + 56)];
    id v4 = v14[3];
    if (v4)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
      id v5 = v14[3];
      v14[3] = 0;

      id v6 = v14[8];
      v14[8] = 0;
    }
    int v7 = [*(id *)(a1 + 40) _isWatchTarget];
    uint64_t v3 = v14;
    if (v7)
    {
      id v8 = objc_loadWeakRetained(v14 + 7);
      char v9 = objc_opt_respondsToSelector();

      id v10 = objc_loadWeakRetained(v14 + 7);
      if (v9)
      {
        id v11 = objc_loadWeakRetained(v14 + 5);
        id v12 = [v11 topViewController];
        [v10 viewController:v12 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:*(void *)(a1 + 40) withShouldContinue:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 32)];
      }
      else
      {
        char v13 = objc_opt_respondsToSelector();

        uint64_t v3 = v14;
        if ((v13 & 1) == 0) {
          goto LABEL_10;
        }
        id v10 = objc_loadWeakRetained(v14 + 7);
        id v11 = objc_loadWeakRetained(v14 + 5);
        id v12 = [v11 topViewController];
        [v10 viewController:v12 didExitPasscodeUpgradeWithShouldContinue:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 32)];
      }

      uint64_t v3 = v14;
    }
  }
LABEL_10:
}

- (void)_showPasscodeUpgradeExplanation
{
  objc_initWeak(&location, self);
  uint64_t v3 = [[PKPasscodeUpgradeExplanationViewController alloc] initWithPasscodeUpgradeFlowController:self isForWatch:[(PKPasscodeUpgradeFlowController *)self _isWatchTarget]];
  [(PKExplanationViewController *)v3 setShowCancelButton:0];
  [(PKExplanationViewController *)v3 setShowDoneButton:0];
  [(PKPasscodeUpgradeExplanationViewController *)v3 setUpgradeRequiredToAddNewPass:self->_upgradeRequiredToAddNewPass];
  objc_initWeak(&from, v3);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke;
  aBlock[3] = &unk_1E59D89B0;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  id v4 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_27;
  v10[3] = &unk_1E59CB128;
  objc_copyWeak(&v12, &location);
  id v5 = v4;
  id v11 = v5;
  [(PKPasscodeUpgradeExplanationViewController *)v3 setContinuationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_49;
  v8[3] = &unk_1E59CAA98;
  id v6 = v5;
  id v9 = v6;
  [(PKPasscodeUpgradeExplanationViewController *)v3 setSetupLaterHandler:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowRenderer);
  [WeakRetained pushViewController:v3 animated:1];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

void __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      char v13 = WeakRetained;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@: Terminating setup flow", (uint8_t *)&v12, 0xCu);
    }

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:WeakRetained name:*MEMORY[0x1E4FB2640] object:0];

    [WeakRetained[2] passcodeUpgradeCompleted:0];
    id v6 = WeakRetained[3];
    WeakRetained[3] = 0;

    id v7 = objc_loadWeakRetained(WeakRetained + 7);
    id v8 = v7;
    if (v7)
    {
      [v7 viewControllerDidTerminateSetupFlow:v3];
    }
    else
    {
      id v9 = (void (**)(void))WeakRetained[8];
      if (v9)
      {
        v9[2]();
        id v10 = WeakRetained[8];
        WeakRetained[8] = 0;
      }
      else
      {
        id v11 = [v3 presentingViewController];
        [v11 dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
}

void __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_27(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = [WeakRetained _isWatchTarget];

  if (v4)
  {
    id v10 = objc_loadWeakRetained(v2);
    [v10 _showChangePasscodeFlow];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    v15[0] = &unk_1EF2B9E10;
    id v6 = PKLocalizedShareableCredentialString(&cfstr_LocalAuthentic.isa);
    v16[0] = v6;
    v15[1] = &unk_1EF2B9E28;
    id v7 = PKLocalizedString(&cfstr_Wallet_0.isa);
    v16[1] = v7;
    v15[2] = &unk_1EF2B9E40;
    v16[2] = MEMORY[0x1E4F1CC38];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_41;
    v11[3] = &unk_1E59E0590;
    id v9 = v5;
    id v12 = v9;
    objc_copyWeak(&v14, v2);
    id v13 = *(id *)(a1 + 32);
    [v9 evaluatePolicy:1025 options:v8 reply:v11];

    objc_destroyWeak(&v14);
  }
}

void __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_41(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_2;
  v6[3] = &unk_1E59CF928;
  id v7 = v4;
  id v8 = a1[4];
  id v5 = v4;
  objc_copyWeak(&v10, a1 + 6);
  id v9 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v10);
}

void __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) invalidate];
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"N";
    if (!v2) {
      id v4 = @"Y";
    }
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPasscodeUpgradeFlowController requested local auth and returning %@.", (uint8_t *)&v6, 0xCu);
  }

  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _showChangePasscodeFlow];
  }
}

uint64_t __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showChangePasscodeFlow
{
  v27[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if ([(PKPasscodeUpgradeFlowController *)self _isWatchTarget])
  {
    id v4 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
    id v5 = [v4 targetDevice];

    if (objc_opt_respondsToSelector())
    {
      id v6 = objc_loadWeakRetained((id *)&self->_flowRenderer);
      id v7 = [v6 topViewController];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke;
      v23[3] = &unk_1E59CEAC0;
      objc_copyWeak(&v24, &location);
      [v5 requestPasscodeUpgradeForPasscodeUpgradeFlowController:self withVisibleViewController:v7 completion:v23];

      objc_destroyWeak(&v24);
    }
    else if (objc_opt_respondsToSelector())
    {
      id v10 = objc_loadWeakRetained((id *)&self->_flowRenderer);
      id v11 = [v10 topViewController];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_2;
      v21[3] = &unk_1E59CEAC0;
      objc_copyWeak(&v22, &location);
      [WeakRetained viewController:v11 requestPasscodeUpgradeForPasscodeUpgradeFlowController:self completion:v21];

      objc_destroyWeak(&v22);
    }
    else if (objc_opt_respondsToSelector())
    {
      id v12 = objc_loadWeakRetained((id *)&self->_flowRenderer);
      id v13 = [v12 topViewController];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_3;
      v19[3] = &unk_1E59CEAC0;
      objc_copyWeak(&v20, &location);
      [WeakRetained viewController:v13 requestPasscodeUpgradeWithCompletion:v19];

      objc_destroyWeak(&v20);
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"Error: setup delegate does not support viewController:requestPasscodeUpgradeForPasscodeUpgradeFlowController:completion:";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      uint64_t v16 = [v14 errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:v15];

      [(PKPasscodeUpgradeFlowController *)self _completeWithShouldContinue:0 error:v16];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v8 = objc_loadWeakRetained((id *)&self->_flowRenderer);
    id v9 = [v8 topViewController];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_4;
    v17[3] = &unk_1E59D7080;
    objc_copyWeak(&v18, &location);
    [WeakRetained viewController:v9 willPerformPasscodeUpgradeWithCompletionHandler:v17];

    objc_destroyWeak(&v18);
  }
  else
  {
    [(PKPasscodeUpgradeFlowController *)self _showCurrentDevicePasscodeViewController];
  }

  objc_destroyWeak(&location);
}

void __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _completeWithShouldContinue:a2 error:v5];
}

void __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _completeWithShouldContinue:a2 error:v5];
}

void __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _completeWithShouldContinue:a2 error:v5];
}

void __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = objc_msgSend(v3, "pk_zString");

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F74230] sharedConnection];
      uint64_t v13 = 0;
      char v7 = [v6 unlockDeviceWithPasscode:v5 outError:&v13];
      uint64_t v8 = v13;

      if (v8) {
        char v9 = 0;
      }
      else {
        char v9 = v7;
      }
    }
    else
    {
      char v9 = 0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_5;
    v10[3] = &unk_1E59CD7B0;
    char v12 = v9;
    void v10[4] = WeakRetained;
    id v3 = v5;
    id v11 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_5(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 _showNewDevicePasscodeViewControllerWithCurrentPasscode:*(void *)(a1 + 40)];
  }
  else {
    return [v3 _showCurrentDevicePasscodeViewController];
  }
}

- (void)_showCurrentDevicePasscodeViewController
{
  id v4 = [[PKCurrentDevicePasscodeViewController alloc] initWithPasscodeUpgradeFlowController:self];
  [(DevicePINController *)v4 setPinDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowRenderer);
  [WeakRetained pushViewController:v4 animated:1];
}

- (void)_showNewDevicePasscodeViewControllerWithCurrentPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [PKNewDevicePasscodeViewController alloc];
  char v7 = [(PKNewDevicePasscodeViewController *)v5 initWithPasscodeUpgradeFlowController:self minimumPasscodeLength:*MEMORY[0x1E4F87FD8] withCurrentPasscode:v4];

  [(PKNewDevicePasscodeViewController *)v7 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowRenderer);
  [WeakRetained pushViewController:v7 animated:1];
}

- (BOOL)_isWatchTarget
{
  int v2 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
  id v3 = [v2 targetDevice];

  id v4 = [v3 deviceClass];
  char IsWatch = PKDeviceClassIsWatch();

  return IsWatch;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (int64_t)context
{
  return self->_context;
}

- (id)setupLaterHandler
{
  return self->_setupLaterHandler;
}

- (void)setSetupLaterHandler:(id)a3
{
}

- (BOOL)upgradeRequiredToAddNewPass
{
  return self->_upgradeRequiredToAddNewPass;
}

- (void)setUpgradeRequiredToAddNewPass:(BOOL)a3
{
  self->_BOOL upgradeRequiredToAddNewPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupLaterHandler, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_flowRenderer);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end