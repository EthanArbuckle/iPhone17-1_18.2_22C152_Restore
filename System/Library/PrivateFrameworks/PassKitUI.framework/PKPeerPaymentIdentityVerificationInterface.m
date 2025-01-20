@interface PKPeerPaymentIdentityVerificationInterface
+ (void)interfaceWithContext:(id)a3 configuration:(id)a4 completion:(id)a5;
- (PKPeerPaymentIdentityVerificationInterface)initWithContext:(id)a3 configuration:(id)a4 verificationResponse:(id)a5;
- (PKPeerPaymentIdentityVerificationInterfaceDelegate)delegate;
- (UIViewController)primaryViewController;
- (id)createPrimaryViewControllerWithVerificationResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewControllerDidCancelSetupFlow:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation PKPeerPaymentIdentityVerificationInterface

+ (void)interfaceWithContext:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F84D50] sharedService];
  v11 = [MEMORY[0x1E4F84E10] sharedService];
  id v12 = objc_alloc_init(MEMORY[0x1E4F84DA0]);
  v13 = [v10 context];
  objc_msgSend(v12, "setDevSigned:", objc_msgSend(v13, "devSigned"));

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__PKPeerPaymentIdentityVerificationInterface_interfaceWithContext_configuration_completion___block_invoke;
  v17[3] = &unk_1E59D2808;
  id v19 = v8;
  id v20 = v9;
  id v18 = v7;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  [v11 peerPaymentIdentityVerificationRequest:v12 completion:v17];
}

void __92__PKPeerPaymentIdentityVerificationInterface_interfaceWithContext_configuration_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKPeerPaymentIdentityVerificationInterface_interfaceWithContext_configuration_completion___block_invoke_2;
  block[3] = &unk_1E59CEF00;
  id v10 = v6;
  id v11 = v5;
  id v14 = a1[6];
  id v12 = a1[4];
  id v13 = a1[5];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __92__PKPeerPaymentIdentityVerificationInterface_interfaceWithContext_configuration_completion___block_invoke_2(void *a1)
{
  if (a1[4] || !a1[5])
  {
    v1 = *(void (**)(void))(a1[8] + 16);
    v1();
  }
  else
  {
    uint64_t v2 = a1[8];
    v3 = [[PKPeerPaymentIdentityVerificationInterface alloc] initWithContext:a1[6] configuration:a1[7] verificationResponse:a1[5]];
    (*(void (**)(uint64_t, PKPeerPaymentIdentityVerificationInterface *))(v2 + 16))(v2, v3);
  }
}

- (PKPeerPaymentIdentityVerificationInterface)initWithContext:(id)a3 configuration:(id)a4 verificationResponse:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentIdentityVerificationInterface;
  id v12 = [(PKPeerPaymentIdentityVerificationInterface *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    uint64_t v14 = [(PKPeerPaymentIdentityVerificationInterface *)v13 createPrimaryViewControllerWithVerificationResponse:v11];
    if (!v14)
    {
      id v16 = 0;
      goto LABEL_6;
    }
    primaryViewController = v13->_primaryViewController;
    v13->_primaryViewController = (UIViewController *)v14;
  }
  id v16 = v13;
LABEL_6:

  return v16;
}

- (id)createPrimaryViewControllerWithVerificationResponse:(id)a3
{
  id v4 = a3;
  if (PKDeviceSupportsPeerPaymentIdentityVerification())
  {
    id v5 = [PKPeerPaymentIdentityVerificationController alloc];
    id v6 = [MEMORY[0x1E4F84E10] sharedService];
    id v7 = [(PKPeerPaymentIdentityVerificationController *)v5 initWithPeerPaymentWebService:v6 identityVerificationResponse:v4 setupDelegate:self hideInitialSplashScreen:0 context:8];

    id v8 = [(PKPeerPaymentIdentityVerificationController *)v7 firstViewController];
    if (v8)
    {
      id v9 = [[PKNavigationController alloc] initWithRootViewController:v8];
      [(PKNavigationController *)v9 setSupportedInterfaceOrientations:2];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F84E00], "sharedInstance", a3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__PKPeerPaymentIdentityVerificationInterface_viewControllerDidTerminateSetupFlow___block_invoke;
  v5[3] = &unk_1E59CE240;
  v5[4] = self;
  [v4 updateAccountWithCompletion:v5];
}

void __82__PKPeerPaymentIdentityVerificationInterface_viewControllerDidTerminateSetupFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__PKPeerPaymentIdentityVerificationInterface_viewControllerDidTerminateSetupFlow___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __82__PKPeerPaymentIdentityVerificationInterface_viewControllerDidTerminateSetupFlow___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained peerPaymentIdentityVerificationDidFinishWithAccount:*(void *)(a1 + 40)];
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134349056;
    id v7 = self;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentIdentityVerificationInterface (%{public}p): Dismissing because setup was cancelled", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(PKPaymentAuthorizationInterfaceConfiguration *)self->_configuration presenter];
  [v5 dismissWithReason:3 error:0 completion:0];
}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (PKPeerPaymentIdentityVerificationInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentIdentityVerificationInterfaceDelegate *)WeakRetained;
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