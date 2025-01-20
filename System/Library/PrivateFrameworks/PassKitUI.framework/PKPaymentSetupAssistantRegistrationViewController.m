@interface PKPaymentSetupAssistantRegistrationViewController
+ (BOOL)bridgeSetupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3;
+ (BOOL)bridgeSetupAssistantNeedsToRunWithContext:(id)a3 returningRequirements:(unint64_t *)a4;
+ (BOOL)setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3;
+ (id)defaultWebServiceForContext:(int64_t)a3;
- (NSArray)requiredPaymentSetupFileURLs;
- (PKPaymentSetupAssistantRegistrationViewController)initWithPaymentWebService:(id)a3 context:(int64_t)a4 delegate:(id)a5;
- (void)_setUserInteractionEnabled:(BOOL)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupAssistantRegistrationViewController

+ (id)defaultWebServiceForContext:(int64_t)a3
{
  if (PKPaymentSetupContextIsBridge())
  {
    id v3 = objc_alloc_init(getNPKCompanionAgentConnectionClass());
    v4 = [v3 watchPaymentWebService];
  }
  else
  {
    v4 = [MEMORY[0x1E4F84D50] sharedService];
  }

  return v4;
}

+ (BOOL)setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  return 0;
}

+ (BOOL)bridgeSetupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  return 0;
}

+ (BOOL)bridgeSetupAssistantNeedsToRunWithContext:(id)a3 returningRequirements:(unint64_t *)a4
{
  return 0;
}

- (PKPaymentSetupAssistantRegistrationViewController)initWithPaymentWebService:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F84BB8];
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithWebService:v10];

  v12 = [[PKPaymentSetupAssistantDelegateProxy alloc] initWithDelegate:v9 provisioningController:v11];
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupAssistantRegistrationViewController;
  v13 = [(PKPaymentSetupHeroViewController *)&v17 initWithProvisioningController:v11 context:a4 delegate:v12 product:0 allowsManualEntry:0];
  v14 = v13;
  if (v13)
  {
    v15 = [(PKPaymentSetupAssistantRegistrationViewController *)v13 navigationItem];
    [v15 setLeftBarButtonItem:0];

    objc_storeStrong((id *)&v14->_delegateProxy, v12);
  }

  return v14;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupAssistantRegistrationViewController starting preflight", buf, 2u);
    }

    [(PKExplanationViewController *)self context];
    int IsBridge = PKPaymentSetupContextIsBridge();
    setupAssistantCoreController = self->_setupAssistantCoreController;
    if (!setupAssistantCoreController)
    {
      if (IsBridge) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 1;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F84C48]);
      v11 = [[PKSetupAssistantContext alloc] initWithSetupAssistant:v9];
      v12 = (PKPaymentSetupAssistantCoreController *)[v10 initWithSetupAssistantContext:v11];
      v13 = self->_setupAssistantCoreController;
      self->_setupAssistantCoreController = v12;

      setupAssistantCoreController = self->_setupAssistantCoreController;
    }
    v14 = [(PKPaymentSetupHeroViewController *)self provisioningController];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PKPaymentSetupAssistantRegistrationViewController_preflightWithCompletion___block_invoke;
    v15[3] = &unk_1E59CBBD0;
    v16 = v4;
    [(PKPaymentSetupAssistantCoreController *)setupAssistantCoreController _preflightPaymentSetupProvisioningController:v14 completion:v15];

    v5 = v16;
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupAssistantRegistrationViewController exiting no completion for preflight", buf, 2u);
  }
}

void __77__PKPaymentSetupAssistantRegistrationViewController_preflightWithCompletion___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__PKPaymentSetupAssistantRegistrationViewController_preflightWithCompletion___block_invoke_2;
  v3[3] = &unk_1E59CAF20;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __77__PKPaymentSetupAssistantRegistrationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentSetupAssistantRegistrationViewController;
  [(PKPaymentSetupHeroViewController *)&v2 viewDidLoad];
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DB8], 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupAssistantRegistrationViewController;
  [(PKPaymentSetupHeroViewController *)&v5 viewDidAppear:a3];
  id v4 = [(PKPaymentSetupHeroViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 viewControllerDidBeginSetupFlow:self];
  }
}

- (NSArray)requiredPaymentSetupFileURLs
{
  return (NSArray *)[MEMORY[0x1E4F84C48] requiredPaymentSetupFileURLs];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  [(PKPaymentSetupAssistantRegistrationViewController *)self _setUserInteractionEnabled:0];
  id v5 = objc_alloc(MEMORY[0x1E4F84ED0]);
  int64_t v6 = [(PKExplanationViewController *)self context];
  v7 = [(PKPaymentSetupHeroViewController *)self provisioningController];
  v8 = (void *)[v5 initWithEnvironment:v6 provisioningController:v7 groupsController:0];

  [v8 setIsFollowupSetupAssistant:1];
  objc_initWeak(&location, self);
  uint64_t v9 = [(PKPaymentSetupAssistantRegistrationViewController *)self navigationController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__PKPaymentSetupAssistantRegistrationViewController_explanationViewDidSelectContinue___block_invoke;
  v12[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v13, &location);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__PKPaymentSetupAssistantRegistrationViewController_explanationViewDidSelectContinue___block_invoke_2;
  v10[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v11, &location);
  +[PKProvisioningFlowBridge startSetupAssistantFollowupFlowWithNavController:v9 context:v8 preflightCompletion:v12 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __86__PKPaymentSetupAssistantRegistrationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setUserInteractionEnabled:0];
}

void __86__PKPaymentSetupAssistantRegistrationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_super v2 = [WeakRetained delegate];
    [v2 viewControllerDidTerminateSetupFlow:v3];

    id WeakRetained = v3;
  }
}

- (void)_setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPaymentSetupAssistantRegistrationViewController *)self view];
  [v5 setUserInteractionEnabled:v3];

  int64_t v6 = [(PKExplanationViewController *)self explanationView];
  id v8 = [v6 dockView];

  [v8 setButtonsEnabled:v3];
  v7 = [v8 primaryButton];
  [v7 setShowSpinner:v3 ^ 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAssistantCoreController, 0);

  objc_storeStrong((id *)&self->_delegateProxy, 0);
}

@end