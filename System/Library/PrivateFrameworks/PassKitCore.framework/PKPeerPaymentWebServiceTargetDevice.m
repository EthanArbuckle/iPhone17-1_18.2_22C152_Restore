@interface PKPeerPaymentWebServiceTargetDevice
- (PKPeerPaymentWebServiceTargetDevice)initWithTargetDeviceDelegate:(id)a3;
- (id)account;
- (id)appleAccountInformation;
- (id)bridgedClientInfo;
- (id)preferences;
- (id)secureElementIdentifiers;
- (void)_handleAccountChangedNotification:(id)a3;
- (void)_handlePreferencesChangedNotification:(id)a3;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)dealloc;
- (void)downloadPassIfNecessaryWithCompletion:(id)a3;
- (void)peerPaymentReRegisterWithURL:(id)a3 pushToken:(id)a4 peerPaymentWebService:(id)a5 completion:(id)a6;
- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 peerPaymentWebService:(id)a4 credential:(id)a5 completion:(id)a6;
- (void)renewAppleAccountWithCompletionHandler:(id)a3;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)setPreferences:(id)a3 completion:(id)a4;
- (void)setUserHasDisabledPeerPayment:(BOOL)a3;
- (void)updateAccountWithCompletion:(id)a3;
@end

@implementation PKPeerPaymentWebServiceTargetDevice

- (PKPeerPaymentWebServiceTargetDevice)initWithTargetDeviceDelegate:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentWebServiceTargetDevice;
  v6 = [(PKPeerPaymentWebServiceTargetDevice *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_targetDeviceDelegate, a3);
    if ((PKRunningInPassd() & 1) == 0)
    {
      uint64_t v8 = +[PKPeerPaymentService sharedInstance];
      peerPaymentService = v7->_peerPaymentService;
      v7->_peerPaymentService = (PKPeerPaymentService *)v8;

      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:v7 selector:sel__handleAccountChangedNotification_ name:@"PKPeerPaymentServiceAccountChangedNotification" object:v7->_peerPaymentService];

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:v7 selector:sel__handlePreferencesChangedNotification_ name:@"PKPeerPaymentServicePreferencesChangedNotification" object:v7->_peerPaymentService];
    }
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentWebServiceTargetDevice;
  [(PKPeerPaymentWebServiceTargetDevice *)&v4 dealloc];
}

- (void)peerPaymentReRegisterWithURL:(id)a3 pushToken:(id)a4 peerPaymentWebService:(id)a5 completion:(id)a6
{
  id v10 = a6;
  targetDeviceDelegate = self->_targetDeviceDelegate;
  if (targetDeviceDelegate)
  {
    [(PKPeerPaymentTargetDeviceDelegate *)targetDeviceDelegate registerDeviceWithRegistrationURL:a3 pushToken:a4 forceReregister:1 completion:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __111__PKPeerPaymentWebServiceTargetDevice_peerPaymentReRegisterWithURL_pushToken_peerPaymentWebService_completion___block_invoke;
    v12[3] = &unk_1E56DEED0;
    id v13 = v10;
    [a5 peerPaymentRegisterWithURL:a3 pushToken:a4 completion:v12];
  }
}

uint64_t __111__PKPeerPaymentWebServiceTargetDevice_peerPaymentReRegisterWithURL_pushToken_peerPaymentWebService_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2) {
      BOOL v4 = a3 == 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t v5 = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
}

- (id)account
{
  return [(PKPeerPaymentService *)self->_peerPaymentService account];
}

- (id)preferences
{
  return [(PKPeerPaymentService *)self->_peerPaymentService preferences];
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
}

- (void)updateAccountWithCompletion:(id)a3
{
  targetDeviceDelegate = self->_targetDeviceDelegate;
  if (!targetDeviceDelegate) {
    targetDeviceDelegate = self->_peerPaymentService;
  }
  [targetDeviceDelegate updateAccountWithCompletion:a3];
}

- (id)bridgedClientInfo
{
  return 0;
}

- (id)secureElementIdentifiers
{
  return +[PKSecureElement secureElementIdentifiers];
}

- (void)setUserHasDisabledPeerPayment:(BOOL)a3
{
}

- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[PKPeerPaymentWebService sharedService];
  [(PKPeerPaymentWebServiceTargetDevice *)self provisionPeerPaymentPassWithProvisioningController:v10 peerPaymentWebService:v11 credential:v9 completion:v8];
}

- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 peerPaymentWebService:(id)a4 credential:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 webService];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[PKPaymentWebService sharedService];
  }
  v16 = v15;

  if (!v10)
  {
    id v10 = +[PKPeerPaymentWebService sharedService];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke;
  aBlock[3] = &unk_1E56D8B08;
  id v17 = v12;
  id v32 = v17;
  v18 = _Block_copy(aBlock);
  v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentDow.isa, 0);
  v20 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentDow_0.isa, 0);
  v21 = PKDisplayableErrorCustomWithType(-1, v19, v20, 0, 0);

  if (v16
    && v10
    && ([v16 needsRegistration] & 1) == 0
    && ![v10 needsRegistration])
  {
    v23 = [[PKProvisioningContext alloc] initWithEnvironment:0 provisioningController:v9 groupsController:0];
    [(PKProvisioningContext *)v23 setPeerPaymentWebService:v10];
    v24 = [[PKProvisioningBackgroundCoordinator alloc] initWithSetupContext:v23 credential:v11 previouslyAcceptedTerms:1];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke_43;
    v26[3] = &unk_1E56DEEF8;
    id v29 = v18;
    id v27 = v21;
    v28 = v24;
    v25 = v24;
    [(PKProvisioningBackgroundCoordinator *)v25 startWithCompletion:v26];
  }
  else
  {
    v22 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "provisionPeerPaymentPassWithProvisioningController called, but failed to validate preconditions", buf, 2u);
    }

    (*((void (**)(void *, void, void *))v18 + 2))(v18, 0, v21);
  }
}

void __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke_2;
    block[3] = &unk_1E56D8478;
    id v9 = v6;
    char v10 = a2;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 && !v6)
  {
    if (v8)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Successfully provisioned peer payment pass!", (uint8_t *)&v19, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_20;
  }
  if (v8)
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Pass provisioning failed with error: %@", (uint8_t *)&v19, 0xCu);
  }

  if ([v6 hasLocalizedTitleAndMessage])
  {
    id v9 = [v6 underlyingError];
    char v10 = [v9 domain];
    id v11 = @"PKPeerPaymentWebServiceErrorDomain";
    if (v10 == v11)
    {
    }
    else
    {
      id v12 = v11;
      if (!v10 || !v11)
      {

LABEL_19:
        uint64_t v17 = *(void *)(a1 + 48);
        v18 = [v6 displayableError];
        (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

        goto LABEL_20;
      }
      char v13 = [(__CFString *)v10 isEqualToString:v11];

      if ((v13 & 1) == 0) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = [v6 underlyingError];
  v16 = v15;
  if (!v15) {
    v16 = *(void **)(a1 + 32);
  }
  (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v16);

LABEL_20:
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
}

- (void)_handleAccountChangedNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"PKPeerPaymentTargetDeviceAccountDidChangeNotification" object:self];
}

- (void)_handlePreferencesChangedNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"PKPeerPaymentTargetDevicePreferencesDidChangeNotification" object:self];
}

- (id)appleAccountInformation
{
  v2 = +[PKAppleAccountManager sharedInstance];
  v3 = [v2 appleAccountInformation];

  return v3;
}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[PKAppleAccountManager sharedInstance];
  [v4 renewAppleAccountWithCompletionHandler:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceDelegate, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
}

@end