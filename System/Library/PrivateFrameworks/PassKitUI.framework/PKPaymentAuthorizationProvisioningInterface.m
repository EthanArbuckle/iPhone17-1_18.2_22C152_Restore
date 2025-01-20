@interface PKPaymentAuthorizationProvisioningInterface
- (PKPaymentAuthorizationProvisioningInterface)initWithContext:(id)a3 configuration:(id)a4;
- (PKPaymentAuthorizationProvisioningInterfaceDelegate)delegate;
- (UIViewController)primaryViewController;
- (id)createPrimaryViewController;
- (void)setDelegate:(id)a3;
@end

@implementation PKPaymentAuthorizationProvisioningInterface

- (PKPaymentAuthorizationProvisioningInterface)initWithContext:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAuthorizationProvisioningInterface;
  v9 = [(PKPaymentAuthorizationProvisioningInterface *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    uint64_t v11 = [(PKPaymentAuthorizationProvisioningInterface *)v10 createPrimaryViewController];
    primaryViewController = v10->_primaryViewController;
    v10->_primaryViewController = (UIViewController *)v11;
  }
  return v10;
}

- (id)createPrimaryViewController
{
  id v3 = objc_alloc(MEMORY[0x1E4F84BB8]);
  v4 = [MEMORY[0x1E4F84D50] sharedService];
  v5 = (void *)[v3 initWithWebService:v4];

  v6 = [(PKPaymentAuthorizationContext *)self->_context request];
  id v7 = [v6 supportedNetworks];
  [v5 setAllowedPaymentNetworks:v7];

  id v8 = [(PKPaymentAuthorizationContext *)self->_context request];
  LODWORD(v7) = [v8 isPayLaterPaymentRequest];

  if (v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    [v5 setAllowedFeatureIdentifiers:v9];
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:8 provisioningController:v5 groupsController:0];
  uint64_t v11 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:8];
  [(PKPaymentSetupDismissibleNavigationController *)v11 useStandardPlatformPresentationStyle];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__PKPaymentAuthorizationProvisioningInterface_createPrimaryViewController__block_invoke;
  v14[3] = &unk_1E59CB010;
  objc_copyWeak(&v16, &location);
  id v12 = v5;
  id v15 = v12;
  +[PKProvisioningFlowBridge startProvisionToPurchaseFlowWithNavController:v11 context:v10 onFirstViewControllerShown:0 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __74__PKPaymentAuthorizationProvisioningInterface_createPrimaryViewController__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) provisionedPasses];
    id v3 = [v2 lastObject];
    v4 = [v3 secureElementPass];
    v5 = [v4 paymentPass];

    id v6 = objc_loadWeakRetained(WeakRetained + 4);
    [v6 paymentAuthorizationProvisioningDidFinishWithPass:v5];
  }
}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (PKPaymentAuthorizationProvisioningInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentAuthorizationProvisioningInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_primaryViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end