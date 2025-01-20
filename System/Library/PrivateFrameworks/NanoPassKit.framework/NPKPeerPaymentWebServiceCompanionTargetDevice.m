@interface NPKPeerPaymentWebServiceCompanionTargetDevice
+ (void)attemptToDownloadPeerPaymentPassAtURL:(id)a3 withWebService:(id)a4 completion:(id)a5;
- (BOOL)userHasDisabledPeerPayment;
- (NPKPeerPaymentWebServiceCompanionTargetDevice)init;
- (PKPeerPaymentWebService)peerPaymentWebService;
- (id)account;
- (id)appleAccountInformation;
- (id)bridgedClientInfo;
- (id)deviceClass;
- (id)preferences;
- (void)_handleAccountChanged:(id)a3;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)dealloc;
- (void)downloadPassIfNecessaryWithCompletion:(id)a3;
- (void)initalizeCloudStoreIfNecessaryWithCompletion:(id)a3;
- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3;
- (void)peerPaymentReRegisterWithURL:(id)a3 pushToken:(id)a4 peerPaymentWebService:(id)a5 completion:(id)a6;
- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)setPeerPaymentWebService:(id)a3;
- (void)setPreferences:(id)a3 completion:(id)a4;
- (void)setUserHasDisabledPeerPayment:(BOOL)a3;
- (void)updateAccountWithCompletion:(id)a3;
@end

@implementation NPKPeerPaymentWebServiceCompanionTargetDevice

+ (void)attemptToDownloadPeerPaymentPassAtURL:(id)a3 withWebService:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Attempting to download peer payment pass following provisioning", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke;
  v15[3] = &unk_2644D4F60;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v14 passAtURL:v7 completion:v15];
}

void __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2 == 1 && v5)
  {
    id v7 = [MEMORY[0x263F5BDF8] sharedInstance];
    id v8 = [v6 dataAccessor];
    id v9 = NPKPairedDeviceSecureElementIdentifiers();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke_2;
    v11[3] = &unk_2644D4018;
    id v12 = *(id *)(a1 + 32);
    id v13 = v6;
    id v14 = *(id *)(a1 + 40);
    [v8 downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:v7 seids:v9 completion:v11];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
  }
}

void __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) targetDevice];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke_3;
    v6[3] = &unk_2644D2B10;
    id v7 = *(id *)(a1 + 48);
    [v3 paymentWebService:v4 addPaymentPass:v5 withCompletionHandler:v6];
  }
}

uint64_t __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke_3(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    uint64_t v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Added payment pass following provisioning", v6, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NPKPeerPaymentWebServiceCompanionTargetDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPeerPaymentWebServiceCompanionTargetDevice;
  v2 = [(NPKPeerPaymentWebServiceCompanionTargetDevice *)&v5 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleAccountChanged_ name:@"NPKSharedPeerPaymentAccountDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NPKPeerPaymentWebServiceCompanionTargetDevice;
  [(NPKPeerPaymentWebServiceCompanionTargetDevice *)&v4 dealloc];
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (id)account
{
  v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  BOOL v3 = [v2 peerPaymentAccount];

  return v3;
}

- (void)updateAccountWithCompletion:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  id v5 = [v4 targetDevice];

  [v5 updatePeerPaymentAccountWithCompletion:v3];
}

- (id)bridgedClientInfo
{
  return +[NPKPaymentWebServiceCompanionTargetDevice bridgedClientInfoHTTPHeader];
}

- (BOOL)userHasDisabledPeerPayment
{
  v2 = NPKDomainAccessorForDomain(@".GlobalPreferences");
  char v3 = [v2 BOOLForKey:*MEMORY[0x263F5C8B8]];

  return v3;
}

- (void)setUserHasDisabledPeerPayment:(BOOL)a3
{
  BOOL v3 = a3;
  NPKDomainAccessorForDomain(@".GlobalPreferences");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *MEMORY[0x263F5C8B8];
  [v8 setBool:v3 forKey:*MEMORY[0x263F5C8B8]];
  id v5 = (id)[v8 synchronize];
  id v6 = objc_alloc_init(MEMORY[0x263F57528]);
  id v7 = [MEMORY[0x263EFFA08] setWithObject:v4];
  [v6 synchronizeNanoDomain:@".GlobalPreferences" keys:v7];
}

- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  uint64_t v10 = [v9 targetDevice];

  BOOL v11 = [v8 webService];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __122__NPKPeerPaymentWebServiceCompanionTargetDevice_provisionPeerPaymentPassWithProvisioningController_credential_completion___block_invoke;
  v14[3] = &unk_2644D4F88;
  v14[4] = self;
  id v15 = v11;
  id v16 = v7;
  id v12 = v7;
  id v13 = v11;
  [v10 provisionPeerPaymentPassWithCompletion:v14];
}

void __122__NPKPeerPaymentWebServiceCompanionTargetDevice_provisionPeerPaymentPassWithProvisioningController_credential_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) account];
    id v8 = [v7 associatedPassURL];

    if (v8)
    {
      id v9 = objc_opt_class();
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __122__NPKPeerPaymentWebServiceCompanionTargetDevice_provisionPeerPaymentPassWithProvisioningController_credential_completion___block_invoke_2;
      v19[3] = &unk_2644D3028;
      uint64_t v10 = *(void *)(a1 + 40);
      id v21 = *(id *)(a1 + 48);
      char v22 = a2;
      id v20 = v6;
      [v9 attemptToDownloadPeerPaymentPassAtURL:v8 withWebService:v10 completion:v19];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    BOOL v11 = [v5 domain];
    int v12 = [v11 isEqualToString:@"com.apple.NPKErrorDomain"];

    if (v12)
    {
      id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"GIZMO_UNREACHABLE_ALERT_TITLE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v16 = [v15 localizedStringForKey:@"GIZMO_UNREACHABLE_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
      uint64_t v17 = PKDisplayableErrorCustom();

      id v6 = (void *)v17;
    }
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, void *))(v18 + 16))(v18, a2, v6);
  }
}

uint64_t __122__NPKPeerPaymentWebServiceCompanionTargetDevice_provisionPeerPaymentPassWithProvisioningController_credential_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)initalizeCloudStoreIfNecessaryWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  id v5 = [v4 targetDevice];

  [v5 initializeCloudStoreIfNecessaryWithCompletion:v3];
}

- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  id v5 = [v4 targetDevice];

  [v5 initializeCloudStoreIfNecessaryWithHandler:v3];
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  id v5 = [v4 targetDevice];

  [v5 checkTLKsMissingWithCompletion:v3];
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  id v5 = [v4 targetDevice];

  [v5 resetApplePayManateeViewWithCompletion:v3];
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  id v5 = [v4 targetDevice];

  [v5 cloudStoreStatusWithCompletion:v3];
}

- (void)peerPaymentReRegisterWithURL:(id)a3 pushToken:(id)a4 peerPaymentWebService:(id)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = a3;
  id v9 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  uint64_t v10 = [v9 targetDevice];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __121__NPKPeerPaymentWebServiceCompanionTargetDevice_peerPaymentReRegisterWithURL_pushToken_peerPaymentWebService_completion___block_invoke;
  v12[3] = &unk_2644D4FB0;
  id v13 = v7;
  id v11 = v7;
  [v10 peerPaymentRegisterWithURL:v8 forceReRegistration:1 completion:v12];
}

void __121__NPKPeerPaymentWebServiceCompanionTargetDevice_peerPaymentReRegisterWithURL_pushToken_peerPaymentWebService_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109378;
      v10[1] = a2;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Calling peerPaymentReRegisterWithURL:pushToken: completion with success %i error %@", (uint8_t *)v10, 0x12u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

- (id)deviceClass
{
  return @"Watch";
}

- (void)_handleAccountChanged:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:*MEMORY[0x263F5C7D8] object:self userInfo:0];
}

- (id)appleAccountInformation
{
  v2 = [MEMORY[0x263F5BD50] sharedInstance];
  id v3 = [v2 appleAccountInformation];

  return v3;
}

- (id)preferences
{
  v2 = NPKPairedDevicePeerPaymentPreferences();
  if (!v2)
  {
    id v3 = NPKPairedOrPairingDevice();
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"47B09AC1-3757-485D-9FB4-F124AC8FE430"];
    int v5 = [v3 supportsCapability:v4];

    if (v5)
    {
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x263F5C168]);
      v2 = [v6 preferences];

      if (v2) {
        goto LABEL_10;
      }
    }
    BOOL v7 = pk_Payment_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      uint64_t v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v11 = 0;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Missing peer payment preferences for paring paired device", v11, 2u);
      }
    }
    v2 = 0;
  }
LABEL_10:
  return v2;
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Requested to set peer payment preferences:%@", buf, 0xCu);
    }
  }
  __int16 v11 = NPKPairedOrPairingDevice();
  id v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"47B09AC1-3757-485D-9FB4-F124AC8FE430"];
  int v13 = [v11 supportsCapability:v12];

  if (v13)
  {
    id v14 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
    id v15 = [v14 targetDevice];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __75__NPKPeerPaymentWebServiceCompanionTargetDevice_setPreferences_completion___block_invoke;
    v25[3] = &unk_2644D4FD8;
    id v26 = v7;
    [v15 setPeerPaymentPreferences:v6 completion:v25];
    id v16 = v26;
LABEL_13:

    goto LABEL_14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peerPaymentWebService);

  uint64_t v18 = pk_General_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (WeakRetained)
  {
    if (v19)
    {
      id v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Falling back to setting preferences via peer payment web service", buf, 2u);
      }
    }
    id v15 = (void *)[objc_alloc(MEMORY[0x263F5C170]) initWithPeerPaymentPreferences:v6];
    id v21 = objc_loadWeakRetained((id *)&self->_peerPaymentWebService);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __75__NPKPeerPaymentWebServiceCompanionTargetDevice_setPreferences_completion___block_invoke_87;
    v23[3] = &unk_2644D5000;
    v23[4] = self;
    id v24 = v7;
    [v21 peerPaymentUpdatePreferencesWithRequest:v15 completion:v23];

    id v16 = v24;
    goto LABEL_13;
  }
  if (v19)
  {
    char v22 = pk_General_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Warning: No peer payment web service; not setting preferences",
        buf,
        2u);
    }
  }
  id v15 = [(NPKPeerPaymentWebServiceCompanionTargetDevice *)self preferences];
  (*((void (**)(id, void *, void))v7 + 2))(v7, v15, 0);
LABEL_14:
}

void __75__NPKPeerPaymentWebServiceCompanionTargetDevice_setPreferences_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Calling setPreferences:completion: completion with preferences %@ error %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

void __75__NPKPeerPaymentWebServiceCompanionTargetDevice_setPreferences_completion___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = [a2 peerPaymentPreferences];
  if (v9)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) preferences];
      (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v9);
    }
  }
  else
  {
    [v5 setDirty:0];
    NPKPairedDeviceSetPeerPaymentPreferences(v5);
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v5, 0);
    }
  }
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peerPaymentWebService);
  return (PKPeerPaymentWebService *)WeakRetained;
}

- (void)setPeerPaymentWebService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end