@interface PKPaymentSetupNavigationController
+ (id)viewControllerForPresentingPaymentError:(id)a3;
- (BOOL)allowsManualEntry;
- (BOOL)showsWelcomeViewController;
- (BOOL)viewController:(id)a3 requestsReturnToPresentationMarker:(unint64_t)a4 reset:(BOOL)a5;
- (PKGroupsController)groupsController;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupDelegate)setupDelegate;
- (PKPaymentSetupNavigationController)init;
- (PKPaymentSetupNavigationController)initWithProvisioningController:(id)a3 context:(int64_t)a4;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)paymentSetupMode;
- (void)_reconfigureRootViewControllerWithCompletion:(id)a3;
- (void)cancelButtonPressed:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setAllowsManualEntry:(BOOL)a3;
- (void)setGroupsController:(id)a3;
- (void)setPaymentSetupMode:(int64_t)a3;
- (void)setSetupDelegate:(id)a3;
- (void)setShowsWelcomeViewController:(BOOL)a3;
- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6;
- (void)viewController:(id)a3 didExitPasscodeUpgradeWithShouldContinue:(BOOL)a4 error:(id)a5;
- (void)viewController:(id)a3 didShowProvisioningError:(id)a4;
- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5;
- (void)viewController:(id)a3 requestPasscodeUpgradeWithCompletion:(id)a4;
- (void)viewController:(id)a3 requestPresentPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)viewControllerDidCancelSetupFlow:(id)a3;
- (void)viewControllerDidShowEligibilityIssue:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPaymentSetupNavigationController

- (PKPaymentSetupNavigationController)init
{
  return 0;
}

- (PKPaymentSetupNavigationController)initWithProvisioningController:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupNavigationController;
  v8 = [(PKPaymentSetupDismissibleNavigationController *)&v11 initWithContext:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_provisioningController, a3);
    v9->_showsWelcomeViewController = 1;
    v9->_allowsManualEntry = 1;
    v9->_rootViewControllerNeedsConfiguration = 1;
  }

  return v9;
}

- (int64_t)_preferredModalPresentationStyle
{
  unint64_t v2 = [(PKPaymentSetupDismissibleNavigationController *)self context];
  if (v2 > 0xA) {
    return -2;
  }
  else {
    return qword_1A0445B20[v2];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupNavigationController;
  [(PKPaymentSetupDismissibleNavigationController *)&v3 viewDidLoad];
  PKPaymentSetupApplyContextAppearance([(PKPaymentSetupDismissibleNavigationController *)self context], self);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupNavigationController;
  [(PKPaymentSetupDismissibleNavigationController *)&v4 viewWillAppear:a3];
  [(PKPaymentSetupNavigationController *)self _reconfigureRootViewControllerWithCompletion:0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupNavigationController;
  [(PKPaymentSetupNavigationController *)&v7 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3
    || ([(PKPaymentSetupNavigationController *)self presentedViewController],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    [(PKPaymentProvisioningController *)self->_provisioningController noteProvisioningUserInterfaceDidAppear];
  }
  else
  {
    [(PKPaymentProvisioningController *)self->_provisioningController noteProvisioningUserInterfaceDidDisappear];
  }
}

- (void)_reconfigureRootViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29060] currentThread];
  char v6 = [v5 isMainThread];

  if ((v6 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPaymentSetupNavigationControllerException called off main queue"];
  }
  if (self->_rootViewControllerNeedsConfiguration)
  {
    self->_rootViewControllerNeedsConfiguration = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59CAA98;
    id v20 = v4;
    objc_super v7 = _Block_copy(aBlock);
    PKTimeProfileBegin();
    id v8 = objc_alloc(MEMORY[0x1E4F84ED0]);
    int64_t v9 = [(PKPaymentSetupDismissibleNavigationController *)self context];
    provisioningController = self->_provisioningController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_groupsController);
    v12 = (void *)[v8 initWithEnvironment:v9 provisioningController:provisioningController groupsController:WeakRetained];

    int64_t paymentSetupMode = self->_paymentSetupMode;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke_2;
    v17[3] = &unk_1E59CAA98;
    id v14 = v7;
    id v18 = v14;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke_3;
    v15[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v16, &location);
    +[PKProvisioningFlowBridge startPaymentSetupFlowWithNavController:self context:v12 mode:paymentSetupMode preflightCompletion:v17 completion:v15];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
}

uint64_t __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  unint64_t v2 = PKLogFacilityTypeGetObject();
  id v3 = (id)PKTimeProfileEnd();

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained viewControllerDidTerminateSetupFlow:WeakRetained];
    id WeakRetained = v2;
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PKPaymentSetupNavigationController_preflightWithCompletion___block_invoke;
  v6[3] = &unk_1E59CAA98;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentSetupNavigationController *)self _reconfigureRootViewControllerWithCompletion:v6];
}

uint64_t __62__PKPaymentSetupNavigationController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)setPaymentSetupMode:(int64_t)a3
{
  if (self->_paymentSetupMode != a3)
  {
    self->_int64_t paymentSetupMode = a3;
    if ((unint64_t)(a3 - 2) <= 3) {
      [(PKPaymentSetupNavigationController *)self setShowsWelcomeViewController:0];
    }
  }
}

- (void)setShowsWelcomeViewController:(BOOL)a3
{
  if (self->_showsWelcomeViewController != a3)
  {
    self->_showsWelcomeViewController = a3;
    if (!self->_rootViewControllerNeedsConfiguration)
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupNavigationController: WARNING: setShowsWelcomeViewController called after view configured", v4, 2u);
      }
    }
  }
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  if (self->_allowsManualEntry != a3)
  {
    self->_allowsManualEntry = a3;
    if (!self->_rootViewControllerNeedsConfiguration)
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupNavigationController: WARNING: setAllowsManualEntry called after view configured", v4, 2u);
      }
    }
  }
}

- (void)cancelButtonPressed:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:1 userInfo:0];
      id v9 = objc_loadWeakRetained((id *)&self->_setupDelegate);
      [v9 paymentSetupDidFinish:self withError:v8];
    }
    else
    {
      id v10 = objc_loadWeakRetained((id *)&self->_setupDelegate);
      [v10 paymentSetupDidFinish:self];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaymentSetupNavigationController;
    [(PKPaymentSetupDismissibleNavigationController *)&v11 cancelButtonPressed:v4];
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  p_setupDelegate = &self->_setupDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_setupDelegate);
    [v6 paymentSetupDidFinish:self];

    objc_storeWeak((id *)p_setupDelegate, 0);
  }
  else
  {
    char v7 = [(PKPaymentSetupNavigationController *)self presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
  provisioningController = self->_provisioningController;

  [(PKPaymentProvisioningController *)provisioningController noteProvisioningUserInterfaceDidDisappear];
}

- (void)viewController:(id)a3 requestPresentPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  p_setupDelegate = &self->_setupDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_setupDelegate);
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v11 = objc_loadWeakRetained((id *)p_setupDelegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)p_setupDelegate);
      [v13 paymentSetupRequestPresentPassUniqueIdentifier:v14 completion:v7];
    }
  }
}

- (BOOL)viewController:(id)a3 requestsReturnToPresentationMarker:(unint64_t)a4 reset:(BOOL)a5
{
  if (a5) {
    [(PKPaymentProvisioningController *)self->_provisioningController reset];
  }

  return [(UINavigationController *)self _pk_popToViewControllerPresentationMarker:a4 animated:1];
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  p_setupDelegate = &self->_setupDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_setupDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:1 userInfo:0];
      id v8 = objc_loadWeakRetained((id *)p_setupDelegate);
      [v8 paymentSetupDidFinish:self withError:v9];
    }
    else
    {
      id v9 = objc_loadWeakRetained((id *)p_setupDelegate);
      [v9 paymentSetupDidFinish:self];
    }
  }
  else
  {
    id v9 = [(PKPaymentSetupNavigationController *)self presentingViewController];
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)viewController:(id)a3 didShowProvisioningError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained
    && (id v8 = WeakRetained,
        id v9 = objc_loadWeakRetained((id *)&self->_setupDelegate),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0)
    && ([(PKPaymentSetupDismissibleNavigationController *)self context],
        !PKPaymentSetupContextIsBridge()))
  {
    id v11 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    [v11 paymentSetupDidShowError:v6];
  }
  else
  {
    [(PKPaymentSetupNavigationController *)self viewControllerDidTerminateSetupFlow:v12];
  }
}

- (void)viewControllerDidShowEligibilityIssue:(id)a3
{
  p_setupDelegate = &self->_setupDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_setupDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_setupDelegate);
      [v8 paymentSetupDidShowEligibilityIssue];
    }
  }
}

- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained paymentSetupRequestPasscodeUpgradeForPasscodeUpgradeFlowController:v8 withVisibleViewController:v11 completion:v9];
  }
}

- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v11 = a4;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained paymentSetupDidExitPasscodeUpgradeForPasscodeUpgradeFlowController:v11 withShouldContinue:v7 error:v9];
  }
}

- (void)viewController:(id)a3 requestPasscodeUpgradeWithCompletion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained paymentSetupRequestPasscodeUpgradeWithVisibleViewController:v8 completion:v6];
  }
}

- (void)viewController:(id)a3 didExitPasscodeUpgradeWithShouldContinue:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained paymentSetupDidExitPasscodeUpgradeWithShouldContinue:v5 error:v8];
  }
}

+ (id)viewControllerForPresentingPaymentError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F871A0]];

  if (!v5)
  {
    BOOL v7 = PKLocalizedPaymentString(&cfstr_CouldNotSetUpT.isa);
    id v8 = PKLocalizedPaymentString(&cfstr_CouldNotSetUpM.isa);
    id v9 = [v3 domain];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (v10)
    {
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);

      uint64_t v12 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
LABEL_15:
      v17 = v8;
      BOOL v7 = (void *)v11;
      id v8 = (void *)v12;
      goto LABEL_16;
    }
    id v13 = [v3 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F88098]];

    if (v14)
    {
      uint64_t v15 = [v3 code];
      if ((unint64_t)(v15 - 2) >= 4 && v15)
      {
        if (v15 == 1)
        {
          uint64_t v16 = PKLocalizedPaymentString(&cfstr_CouldNotSetUpT.isa);

          v17 = v8;
          BOOL v7 = (void *)v16;
          id v8 = 0;
LABEL_16:
        }
LABEL_17:
        PKDisplayableErrorCustom();
        id v6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      v19 = [v3 localizedFailureReason];

      if (!v19) {
        goto LABEL_17;
      }
    }
    else
    {
      v17 = [v3 domain];
      if (![v17 isEqualToString:*MEMORY[0x1E4F87C30]]) {
        goto LABEL_16;
      }
      id v18 = [v3 localizedFailureReason];

      if (!v18) {
        goto LABEL_17;
      }
    }
    uint64_t v11 = [v3 localizedFailureReason];

    uint64_t v12 = [v3 localizedRecoverySuggestion];
    goto LABEL_15;
  }
  id v6 = v3;
LABEL_18:
  id v20 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);

  return v20;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKGroupsController)groupsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupsController);

  return (PKGroupsController *)WeakRetained;
}

- (void)setGroupsController:(id)a3
{
}

- (PKPaymentSetupDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (BOOL)showsWelcomeViewController
{
  return self->_showsWelcomeViewController;
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (int64_t)paymentSetupMode
{
  return self->_paymentSetupMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_groupsController);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end