@interface NPKSubcredentialInvitationCoordinator
+ (BOOL)canAddSecureElementPassWithConfiguration:(id)a3 outError:(id *)a4;
+ (BOOL)canAddSecureElementPassWithInvitation:(id)a3;
- (BOOL)_isInvitationUniqueForPairedReaderIdentifier:(id)a3;
- (NPKStandaloneFirstUnlockCoordinator)firstUnlockCoordinator;
- (NPKSubcredentialInvitationCoordinator)init;
- (NPKSubcredentialInvitationCoordinator)initWithCallbackQueue:(id)a3;
- (NPKWatchSubcredentialProvisioningService)subcredentialProvisioningService;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)internalQueue;
- (PKAppletSubcredentialSharingSession)sharingSession;
- (PKPaymentService)paymentService;
- (PKSubcredentialProvisioningController)subcredentialProvisioningController;
- (id)_errorWithCode:(int64_t)a3 message:(id)a4;
- (id)_paymentWebService;
- (id)completion;
- (void)_endProvisioningWithPassForInvitation:(id)a3 error:(id)a4;
- (void)_fetchInvitationMatchingInvitation:(id)a3 completion:(id)a4;
- (void)_fetchInvitationWithIdentifier:(id)a3 completion:(id)a4;
- (void)_handleProvisioningAttemptForConfiguration:(id)a3 error:(id)a4;
- (void)_invokeCompletionWithPassForInvitation:(id)a3 error:(id)a4;
- (void)_makeConfigurationForInvitation:(id)a3 session:(id)a4 metadata:(id)a5 paymentWebService:(id)a6 completion:(id)a7;
- (void)_performBlockFollowingFirstUnlockWithBlock:(id)a3;
- (void)_queue_accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)_queue_canAcceptInvitation:(id)a3 completion:(id)a4;
- (void)_queue_declineRelatedInvitationsIfNecessaryForInvitation:(id)a3 completion:(id)a4;
- (void)_queue_deviceContainsInvitationMatchingInvitation:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5;
- (void)_queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:(id)a3;
- (void)_queue_listSubcredentialInvitationsWithCompletion:(id)a3;
- (void)_queue_registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)_queue_removeSharingInvitation:(id)a3 completion:(id)a4;
- (void)_queue_requestSubcredentialInvitation:(id)a3 fromIDSHandle:(id)a4 completion:(id)a5;
- (void)_queue_revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)_queue_setAccountAttestationAnonymizationSalt:(id)a3 completion:(id)a4;
- (void)_queue_updateSubcredentialMetadataOnPass:(id)a3 withCredential:(id)a4 completion:(id)a5;
- (void)_setUpSharingSessionWithSubcredentialProvisioningController:(id)a3 forInvitation:(id)a4;
- (void)_setUpSubcredentialProvisioningController;
- (void)_startProvisioningForProvisioningController:(id)a3 withConfiguration:(id)a4;
- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)canAcceptInvitation:(id)a3 completion:(id)a4;
- (void)canAcceptInvitationOnRemoteDeviceForInvitation:(id)a3 completion:(id)a4;
- (void)declineRelatedInvitationsIfNecessaryForInvitation:(id)a3 completion:(id)a4;
- (void)deviceContainsInvitationMatchingInvitation:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5;
- (void)fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:(id)a3;
- (void)listSubcredentialInvitationsWithCompletion:(id)a3;
- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)removeSharingInvitation:(id)a3 completion:(id)a4;
- (void)requestSubcredentialInvitation:(id)a3 completion:(id)a4;
- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)setAccountAttestationAnonymizationSalt:(id)a3 completion:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFirstUnlockCoordinator:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setPaymentService:(id)a3;
- (void)setSharingSession:(id)a3;
- (void)setSubcredentialProvisioningController:(id)a3;
- (void)setSubcredentialProvisioningService:(id)a3;
- (void)startProvisioningWithInvitation:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)startProvisioningWithInvitationIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)startProvisioningWithMailboxAddress:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)startSubcredentialProvisioningOnLocalDeviceMatchingInvitation:(id)a3 shouldFetchAnonymizationSaltFromRemoteDevice:(BOOL)a4 completion:(id)a5;
- (void)startSubcredentialProvisioningOnRemoteDeviceForInvitation:(id)a3;
- (void)startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress:(id)a3 activationCode:(id)a4;
- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5;
- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4;
- (void)updateSubcredentialMetadataOnPass:(id)a3 withCredential:(id)a4 completion:(id)a5;
@end

@implementation NPKSubcredentialInvitationCoordinator

- (NPKSubcredentialInvitationCoordinator)init
{
  return [(NPKSubcredentialInvitationCoordinator *)self initWithCallbackQueue:MEMORY[0x263EF83A0]];
}

- (NPKSubcredentialInvitationCoordinator)initWithCallbackQueue:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKSubcredentialInvitationCoordinator;
  v5 = [(NPKSubcredentialInvitationCoordinator *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NPKSubcredentialInvitationCoordinator", 0);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v6;

    if (v4)
    {
      v8 = (OS_dispatch_queue *)v4;
      callbackQueue = v5->_callbackQueue;
      v5->_callbackQueue = v8;
    }
    else
    {
      v10 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v11 = MEMORY[0x263EF83A0];
      callbackQueue = v5->_callbackQueue;
      v5->_callbackQueue = v10;
    }
  }
  return v5;
}

- (PKPaymentService)paymentService
{
  paymentService = self->_paymentService;
  if (!paymentService)
  {
    id v4 = (PKPaymentService *)objc_alloc_init(MEMORY[0x263F5C0A8]);
    v5 = self->_paymentService;
    self->_paymentService = v4;

    paymentService = self->_paymentService;
  }
  return paymentService;
}

- (NPKStandaloneFirstUnlockCoordinator)firstUnlockCoordinator
{
  firstUnlockCoordinator = self->_firstUnlockCoordinator;
  if (!firstUnlockCoordinator)
  {
    id v4 = [NPKStandaloneFirstUnlockCoordinator alloc];
    v5 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
    dispatch_queue_t v6 = [(NPKStandaloneFirstUnlockCoordinator *)v4 initWithQueue:v5];
    v7 = self->_firstUnlockCoordinator;
    self->_firstUnlockCoordinator = v6;

    firstUnlockCoordinator = self->_firstUnlockCoordinator;
  }
  return firstUnlockCoordinator;
}

- (NPKWatchSubcredentialProvisioningService)subcredentialProvisioningService
{
  subcredentialProvisioningService = self->_subcredentialProvisioningService;
  if (!subcredentialProvisioningService)
  {
    id v4 = objc_alloc_init(NPKWatchSubcredentialProvisioningService);
    v5 = self->_subcredentialProvisioningService;
    self->_subcredentialProvisioningService = v4;

    subcredentialProvisioningService = self->_subcredentialProvisioningService;
  }
  return subcredentialProvisioningService;
}

+ (BOOL)canAddSecureElementPassWithInvitation:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F5BD08];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setSupportedRadioTechnologies:", objc_msgSend(v5, "supportedRadioTechnologies"));
  v7 = [v5 manufacturerIdentifier];
  [v6 setManufacturerIdentifier:v7];

  v8 = [v5 brandIdentifier];

  [v6 setIssuerIdentifier:v8];
  LOBYTE(a1) = [a1 canAddSecureElementPassWithConfiguration:v6 outError:0];

  return (char)a1;
}

+ (BOOL)canAddSecureElementPassWithConfiguration:(id)a3 outError:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F5BF80]);
    char v7 = [v6 canAddSecureElementPassWithConfiguration:v5 outError:a4];
  }
  else
  {
    v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        int v14 = 138543618;
        v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = 0;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: %{public}@: Expected to have a configuration but instead found %@!", (uint8_t *)&v14, 0x16u);
      }
    }
    char v7 = 0;
  }

  return v7;
}

- (void)canAcceptInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke;
  v11[3] = &unk_2644D33D8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Checking whether pass library can accept invitation: %@ completion: %@", buf, 0x20u);
    }
  }
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke_54;
  v15 = &unk_2644D33B0;
  objc_copyWeak(&v17, v2);
  id v16 = *(id *)(a1 + 40);
  id v11 = (void *)MEMORY[0x223C37380](&v12);
  objc_msgSend(WeakRetained, "_queue_canAcceptInvitation:completion:", *(void *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke_54(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke_2;
  block[3] = &unk_2644D3388;
  block[4] = WeakRetained;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __72__NPKSubcredentialInvitationCoordinator_canAcceptInvitation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)listSubcredentialInvitationsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  BOOL v5 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke;
  block[3] = &unk_2644D2DB8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Listing subcredential invitations", buf, 0xCu);
    }
  }
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke_57;
  uint64_t v13 = &unk_2644D3400;
  objc_copyWeak(&v15, v2);
  id v14 = *(id *)(a1 + 32);
  id v9 = (void *)MEMORY[0x223C37380](&v10);
  objc_msgSend(WeakRetained, "_queue_listSubcredentialInvitationsWithCompletion:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
}

void __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke_2;
  block[3] = &unk_2644D3388;
  void block[4] = WeakRetained;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __84__NPKSubcredentialInvitationCoordinator_listSubcredentialInvitationsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = [*(id *)(a1 + 40) description];
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with invitations: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)startProvisioningWithInvitationIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke;
  v20[3] = &unk_2644D34C8;
  objc_copyWeak(&v24, &location);
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = v10;
  id v23 = v13;
  id v14 = (void *)MEMORY[0x223C37380](v20);
  id v15 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_5;
  block[3] = &unk_2644D2DB8;
  objc_copyWeak(&v19, &location);
  id v18 = v14;
  id v16 = v14;
  dispatch_async(v15, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      id v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Begin provisioning with invitation identifier: %@ metadata: %@ completion: %@", buf, 0x2Au);
    }
  }
  [WeakRetained setCompletion:*(void *)(a1 + 48)];
  [WeakRetained _setUpSubcredentialProvisioningController];
  uint64_t v12 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_59;
  v13[3] = &unk_2644D34A0;
  objc_copyWeak(&v15, v2);
  id v14 = *(id *)(a1 + 40);
  [WeakRetained _fetchInvitationWithIdentifier:v12 completion:v13];

  objc_destroyWeak(&v15);
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_2;
  v6[3] = &unk_2644D3478;
  v6[4] = WeakRetained;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v5 = v3;
  id v7 = v5;
  id v8 = *(id *)(a1 + 32);
  [WeakRetained canAcceptInvitation:v5 completion:v6];

  objc_destroyWeak(&v9);
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] internalQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_3;
  v6[3] = &unk_2644D3450;
  objc_copyWeak(&v10, a1 + 7);
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "_handleProvisioningAttemptForConfiguration:error:", 0);
  }
  else
  {
    id v5 = [WeakRetained subcredentialProvisioningController];
    [v4 _setUpSharingSessionWithSubcredentialProvisioningController:v5 forInvitation:*(void *)(a1 + 40)];

    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [v4 sharingSession];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [v4 _paymentWebService];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_4;
    v10[3] = &unk_2644D3428;
    objc_copyWeak(&v11, v2);
    [v4 _makeConfigurationForInvitation:v6 session:v7 metadata:v8 paymentWebService:v9 completion:v10];

    objc_destroyWeak(&v11);
  }
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleProvisioningAttemptForConfiguration:v6 error:v5];
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitationIdentifier_metadata_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performBlockFollowingFirstUnlockWithBlock:*(void *)(a1 + 32)];
}

- (void)startProvisioningWithInvitation:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke;
  v20[3] = &unk_2644D34C8;
  objc_copyWeak(&v24, &location);
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = v10;
  id v23 = v13;
  id v14 = (void *)MEMORY[0x223C37380](v20);
  id v15 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_4;
  block[3] = &unk_2644D2DB8;
  objc_copyWeak(&v19, &location);
  id v18 = v14;
  id v16 = v14;
  dispatch_async(v15, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      id v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Begin provisioning with invitation: %@ metadata: %@ completion: %@", buf, 0x2Au);
    }
  }
  [WeakRetained setCompletion:*(void *)(a1 + 48)];
  [WeakRetained _setUpSubcredentialProvisioningController];
  if (*(void *)(a1 + 32))
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_62;
    id v18 = &unk_2644D3518;
    objc_copyWeak(&v20, v2);
    id v19 = *(id *)(a1 + 40);
    id v12 = (void (**)(void, void, void))MEMORY[0x223C37380](&v15);
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "type", v15, v16, v17, v18);
    if (v13)
    {
      if (v13 == 1) {
        v12[2](v12, *(void *)(a1 + 32), 0);
      }
    }
    else
    {
      [WeakRetained deviceContainsInvitationMatchingInvitation:*(void *)(a1 + 32) withTimeout:60 completion:v12];
    }

    objc_destroyWeak(&v20);
  }
  else
  {
    id v14 = [WeakRetained _errorWithCode:0 message:@"Unable to start provisioning - insufficient information"];
    [WeakRetained _handleProvisioningAttemptForConfiguration:0 error:v14];
  }
}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_2;
  block[3] = &unk_2644D34F0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v10);
}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained subcredentialProvisioningController];
  [WeakRetained _setUpSharingSessionWithSubcredentialProvisioningController:v4 forInvitation:*(void *)(a1 + 32)];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [WeakRetained sharingSession];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [WeakRetained _paymentWebService];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_3;
  v9[3] = &unk_2644D3428;
  objc_copyWeak(&v10, v2);
  [WeakRetained _makeConfigurationForInvitation:v5 session:v6 metadata:v7 paymentWebService:v8 completion:v9];

  objc_destroyWeak(&v10);
}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleProvisioningAttemptForConfiguration:v6 error:v5];
}

void __93__NPKSubcredentialInvitationCoordinator_startProvisioningWithInvitation_metadata_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performBlockFollowingFirstUnlockWithBlock:*(void *)(a1 + 32)];
}

- (void)deviceContainsInvitationMatchingInvitation:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke;
  block[3] = &unk_2644D3590;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
      *(_DWORD *)buf = 138544130;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Checking whether device contains invitation matching invitation: %@ timeout: %lu completion: %@", buf, 0x2Au);
    }
  }
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke_67;
  uint64_t v16 = &unk_2644D3568;
  objc_copyWeak(&v18, v2);
  id v17 = *(id *)(a1 + 40);
  id v12 = (void *)MEMORY[0x223C37380](&v13);
  objc_msgSend(WeakRetained, "_queue_deviceContainsInvitationMatchingInvitation:withTimeout:completion:", *(void *)(a1 + 32), *(void *)(a1 + 56), v12, v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained callbackQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke_2;
  v11[3] = &unk_2644D3540;
  void v11[4] = WeakRetained;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __107__NPKSubcredentialInvitationCoordinator_deviceContainsInvitationMatchingInvitation_withTimeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = [*(id *)(a1 + 40) description];
      id v8 = [*(id *)(a1 + 48) description];
      int v10 = 138543874;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with invitation: %@ error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke;
  block[3] = &unk_2644D2DB8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Fetching account attestation anonymization salt", buf, 0xCu);
    }
  }
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  __int16 v12 = __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke_68;
  id v13 = &unk_2644D35B8;
  objc_copyWeak(&v15, v2);
  id v14 = *(id *)(a1 + 32);
  id v9 = (void *)MEMORY[0x223C37380](&v10);
  objc_msgSend(WeakRetained, "_queue_accountAttestationAnonymizationSaltWithCompletion:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
}

void __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained callbackQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke_2;
  v11[3] = &unk_2644D3540;
  void v11[4] = WeakRetained;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __91__NPKSubcredentialInvitationCoordinator_accountAttestationAnonymizationSaltWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = [*(id *)(a1 + 40) description];
      id v8 = [*(id *)(a1 + 48) description];
      int v10 = 138543874;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with anonymizationSalt: %@ error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke;
  v11[3] = &unk_2644D33D8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Setting account attestation anonymization salt: %@", buf, 0x16u);
    }
  }
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke_70;
  id v14 = &unk_2644D33B0;
  objc_copyWeak(&v16, v2);
  id v15 = *(id *)(a1 + 40);
  id v10 = (void *)MEMORY[0x223C37380](&v11);
  objc_msgSend(WeakRetained, "_queue_setAccountAttestationAnonymizationSalt:completion:", *(void *)(a1 + 32), v10, v11, v12, v13, v14);

  objc_destroyWeak(&v16);
}

void __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke_2;
  block[3] = &unk_2644D3388;
  void block[4] = WeakRetained;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __91__NPKSubcredentialInvitationCoordinator_setAccountAttestationAnonymizationSalt_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = [*(id *)(a1 + 40) description];
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)requestSubcredentialInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke;
  v11[3] = &unk_2644D33D8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Requesting subcredential invitation: %@", buf, 0x16u);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke_71;
  v15[3] = &unk_2644D3608;
  objc_copyWeak(&v18, v2);
  __int16 v11 = *(void **)(a1 + 32);
  id v10 = (id *)(a1 + 32);
  id v16 = v11;
  id v17 = v10[1];
  id v12 = (void *)MEMORY[0x223C37380](v15);
  id v13 = *v10;
  id v14 = [*v10 originatorIDSHandle];
  objc_msgSend(WeakRetained, "_queue_requestSubcredentialInvitation:fromIDSHandle:completion:", v13, v14, v12);

  objc_destroyWeak(&v18);
}

void __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke_71(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  BOOL v5 = [WeakRetained callbackQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke_2;
  v8[3] = &unk_2644D35E0;
  v8[4] = WeakRetained;
  id v9 = a1[4];
  id v6 = a1[5];
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __83__NPKSubcredentialInvitationCoordinator_requestSubcredentialInvitation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = [*(id *)(a1 + 40) description];
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with invitation: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)updateSubcredentialMetadataOnPass:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  __int16 v11 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke;
  block[3] = &unk_2644D34C8;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      __int16 v11 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Updating metadata on pass: %@ with credential: %@ completion: %@", buf, 0x2Au);
    }
  }
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke_72;
  id v16 = &unk_2644D3630;
  objc_copyWeak(&v18, v2);
  id v17 = *(id *)(a1 + 48);
  id v12 = (void *)MEMORY[0x223C37380](&v13);
  objc_msgSend(WeakRetained, "_queue_updateSubcredentialMetadataOnPass:withCredential:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), v12, v13, v14, v15, v16);

  objc_destroyWeak(&v18);
}

void __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke_2;
  block[3] = &unk_2644D3388;
  void block[4] = WeakRetained;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __101__NPKSubcredentialInvitationCoordinator_updateSubcredentialMetadataOnPass_withCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = [*(id *)(a1 + 40) description];
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with pass: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke;
  v11[3] = &unk_2644D33D8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      __int16 v23 = v10;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Registering credentials with identifiers: %@ completion: %@", buf, 0x20u);
    }
  }
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke_74;
  id v15 = &unk_2644D3658;
  objc_copyWeak(&v17, v2);
  id v16 = *(id *)(a1 + 40);
  __int16 v11 = (void *)MEMORY[0x223C37380](&v12);
  objc_msgSend(WeakRetained, "_queue_registerCredentialsWithIdentifiers:completion:", *(void *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained callbackQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke_2;
  v11[3] = &unk_2644D3540;
  void v11[4] = WeakRetained;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __87__NPKSubcredentialInvitationCoordinator_registerCredentialsWithIdentifiers_completion___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[6];
      int v10 = 138543874;
      __int16 v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with passes: %@ errors: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke;
  v11[3] = &unk_2644D33D8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      __int16 v23 = v10;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Revoking credentials with identifiers: %@ completion: %@", buf, 0x20u);
    }
  }
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke_76;
  uint64_t v15 = &unk_2644D36A8;
  objc_copyWeak(&v17, v2);
  id v16 = *(id *)(a1 + 40);
  __int16 v11 = (void *)MEMORY[0x223C37380](&v12);
  objc_msgSend(WeakRetained, "_queue_revokeCredentialsWithIdentifiers:completion:", *(void *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke_76(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke_2;
  block[3] = &unk_2644D3680;
  void block[4] = WeakRetained;
  char v8 = a2;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(v5, block);
}

uint64_t __85__NPKSubcredentialInvitationCoordinator_revokeCredentialsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      id v7 = (void *)v6;
      char v8 = @"YES";
      if (!*(unsigned char *)(a1 + 48)) {
        char v8 = @"NO";
      }
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with success: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeSharingInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  char v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke;
  v11[3] = &unk_2644D33D8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      char v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      __int16 v23 = v10;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Removing sharing invitation: %@ completion: %@", buf, 0x20u);
    }
  }
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke_84;
  uint64_t v15 = &unk_2644D36A8;
  objc_copyWeak(&v17, v2);
  id v16 = *(id *)(a1 + 40);
  uint64_t v11 = (void *)MEMORY[0x223C37380](&v12);
  objc_msgSend(WeakRetained, "_queue_removeSharingInvitation:completion:", *(void *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke_84(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke_2;
  block[3] = &unk_2644D3680;
  void block[4] = WeakRetained;
  char v8 = a2;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(v5, block);
}

uint64_t __76__NPKSubcredentialInvitationCoordinator_removeSharingInvitation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      id v7 = (void *)v6;
      char v8 = @"YES";
      if (!*(unsigned char *)(a1 + 48)) {
        char v8 = @"NO";
      }
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with success: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)declineRelatedInvitationsIfNecessaryForInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  char v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke;
  v11[3] = &unk_2644D33D8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      char v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      __int16 v23 = v10;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Declining related invitations if necessary for invitation: %@ completion: %@", buf, 0x20u);
    }
  }
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke_85;
  uint64_t v15 = &unk_2644D36A8;
  objc_copyWeak(&v17, v2);
  id v16 = *(id *)(a1 + 40);
  uint64_t v11 = (void *)MEMORY[0x223C37380](&v12);
  objc_msgSend(WeakRetained, "_queue_declineRelatedInvitationsIfNecessaryForInvitation:completion:", *(void *)(a1 + 32), v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
}

void __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke_85(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke_2;
  block[3] = &unk_2644D3680;
  void block[4] = WeakRetained;
  char v8 = a2;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(v5, block);
}

uint64_t __102__NPKSubcredentialInvitationCoordinator_declineRelatedInvitationsIfNecessaryForInvitation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      id v7 = (void *)v6;
      char v8 = @"YES";
      if (!*(unsigned char *)(a1 + 48)) {
        char v8 = @"NO";
      }
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with didDeclineInvitations: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  BOOL v5 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke;
  block[3] = &unk_2644D2DB8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 32));
      *(_DWORD *)buf = 138543618;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v9;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Initializing account attestation anonymization salt if necessary with completion: %@", buf, 0x16u);
    }
  }
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_86;
  uint64_t v14 = &unk_2644D35B8;
  objc_copyWeak(&v16, v2);
  id v15 = *(id *)(a1 + 32);
  int v10 = (void *)MEMORY[0x223C37380](&v11);
  objc_msgSend(WeakRetained, "_queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v16);
}

void __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained callbackQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_2;
  v11[3] = &unk_2644D3540;
  void v11[4] = WeakRetained;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __119__NPKSubcredentialInvitationCoordinator_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[6];
      int v10 = 138543874;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Invoking completion with anonymization salt: %@ error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)canAcceptInvitationOnRemoteDeviceForInvitation:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    int v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      __int16 v12 = NSStringFromClass(v11);
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending can accept invitation on remote device request for invitation: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  uint64_t v13 = [(NPKSubcredentialInvitationCoordinator *)self subcredentialProvisioningService];
  [v13 sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation:v6 completion:v7];
}

- (void)startSubcredentialProvisioningOnRemoteDeviceForInvitation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __99__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnRemoteDeviceForInvitation___block_invoke;
  v6[3] = &unk_2644D36D0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(NPKSubcredentialInvitationCoordinator *)self accountAttestationAnonymizationSaltWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __99__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnRemoteDeviceForInvitation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    int v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      if (!v11) {
        goto LABEL_13;
      }
      __int16 v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (objc_class *)objc_opt_class();
        int v14 = NSStringFromClass(v13);
        int v19 = 138543618;
        __int16 v20 = v14;
        __int16 v21 = 2112;
        id v22 = v6;
        uint64_t v15 = "Warning: %{public}@: Expected to initiate subcredential provisioning on the remote device, but encountered an error: %@";
        __int16 v16 = v12;
        uint32_t v17 = 22;
LABEL_11:
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v17);
      }
    }
    else
    {
      if (!v11) {
        goto LABEL_13;
      }
      __int16 v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (objc_class *)objc_opt_class();
        int v14 = NSStringFromClass(v18);
        int v19 = 138543874;
        __int16 v20 = v14;
        __int16 v21 = 2112;
        id v22 = 0;
        __int16 v23 = 2112;
        id v24 = v6;
        uint64_t v15 = "Warning: %{public}@: Expected to initiate subcredential provisioning on the remote device, but failed to o"
              "btain the anonymizationSalt: %@ error: %@";
        __int16 v16 = v12;
        uint32_t v17 = 32;
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  id v8 = objc_alloc_init(MEMORY[0x263F5BD78]);
  [v8 setAnonymizationSalt:v5];
  BOOL v9 = [WeakRetained subcredentialProvisioningService];
  [v9 sendAcceptSubcredentialProvisioningRequestForInvitation:*(void *)(a1 + 32) metadata:v8];

LABEL_13:
}

- (void)startProvisioningWithMailboxAddress:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke;
  v20[3] = &unk_2644D3720;
  objc_copyWeak(&v25, &location);
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  id v13 = v10;
  __int16 v23 = self;
  id v24 = v13;
  int v14 = (void *)MEMORY[0x223C37380](v20);
  uint64_t v15 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke_92;
  v17[3] = &unk_2644D2DB8;
  objc_copyWeak(&v19, &location);
  id v18 = v14;
  id v16 = v14;
  dispatch_async(v15, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 56));
      *(_DWORD *)buf = 138544131;
      __int16 v23 = v7;
      __int16 v24 = 2113;
      uint64_t v25 = v8;
      __int16 v26 = 2113;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = v10;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Begin provisioning with mailbox address: %{private}@, activation code: %{private}@, completion: %@", buf, 0x2Au);
    }
  }
  [WeakRetained setCompletion:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 32) length])
  {
    id v11 = objc_alloc_init(MEMORY[0x263F5C0A8]);
    id v12 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke_88;
    v16[3] = &unk_2644D36F8;
    id v17 = v12;
    id v18 = WeakRetained;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void **)(a1 + 56);
    id v19 = v13;
    uint64_t v20 = v14;
    id v21 = v15;
    [v11 retrieveShareInvitationForMailboxAddress:v17 completion:v16];
  }
  else
  {
    id v11 = [WeakRetained _errorWithCode:0 message:@"Unable to start provisioning - insufficient information"];
    [WeakRetained _handleProvisioningAttemptForConfiguration:0 error:v11];
  }
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = (objc_class *)MEMORY[0x263F5BD70];
    id v9 = v5;
    id v10 = (void *)[[v8 alloc] initWithCrossPlatformInvitation:v9];
    [v10 setActivationCode:*(void *)(a1 + 48)];
    [*(id *)(a1 + 56) startProvisioningWithInvitation:v10 metadata:0 completion:*(void *)(a1 + 64)];
  }
  else
  {
    id v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      id v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v15 = 138478339;
        id v16 = v5;
        __int16 v17 = 2113;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        uint64_t v20 = v7;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: Unable to start provisioning for invitation: %{private}@. mailboxAddress: %{private}@. Error: %@", (uint8_t *)&v15, 0x20u);
      }
    }
    [*(id *)(a1 + 40) _handleProvisioningAttemptForConfiguration:0 error:v7];
  }
}

void __103__NPKSubcredentialInvitationCoordinator_startProvisioningWithMailboxAddress_activationCode_completion___block_invoke_92(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performBlockFollowingFirstUnlockWithBlock:*(void *)(a1 + 32)];
}

- (void)startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress:(id)a3 activationCode:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = [(NPKSubcredentialInvitationCoordinator *)self subcredentialProvisioningService];
    [v8 sendAcceptSubcredentialProvisioningRequestForMailboxAddress:v6 activationCode:v7];
  }
  else
  {
    id v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        int v14 = 138543362;
        int v15 = v13;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to initiate subcredential provisioning on the remote device, but failed to obtain the mailboxAddress.", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)startSubcredentialProvisioningOnLocalDeviceMatchingInvitation:(id)a3 shouldFetchAnonymizationSaltFromRemoteDevice:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543874;
      v46 = v14;
      __int16 v47 = 2112;
      id v48 = v8;
      __int16 v49 = 2048;
      uint64_t v50 = [v8 type];
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Start local device provisioning with invitation: %@ of type %lu", buf, 0x20u);
    }
  }
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __159__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke;
  v37[3] = &unk_2644D3770;
  objc_copyWeak(&v41, &location);
  id v15 = v8;
  id v38 = v15;
  id v16 = v9;
  v39 = self;
  id v40 = v16;
  __int16 v17 = (void (**)(void, void, void))MEMORY[0x223C37380](v37);
  if (v6)
  {
    uint64_t v18 = [(NPKSubcredentialInvitationCoordinator *)self subcredentialProvisioningService];
    int v19 = [v18 isPairedDeviceConnected];

    if (v19)
    {
      uint64_t v20 = pk_General_log();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

      if (v21)
      {
        id v22 = pk_General_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = (objc_class *)objc_opt_class();
          __int16 v24 = NSStringFromClass(v23);
          *(_DWORD *)buf = 138543362;
          v46 = v24;
          _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Remote device is connected.", buf, 0xCu);
        }
      }
      uint64_t v25 = [(NPKSubcredentialInvitationCoordinator *)self subcredentialProvisioningService];
      [v25 fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion:v17];
    }
    else
    {
      __int16 v26 = pk_General_log();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        __int16 v28 = pk_General_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = (objc_class *)objc_opt_class();
          uint64_t v30 = NSStringFromClass(v29);
          *(_DWORD *)buf = 138543362;
          v46 = v30;
          _os_log_impl(&dword_21E92F000, v28, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Remote device is not connected; failing immediately...",
            buf,
            0xCu);
        }
      }
      v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v32 = [v31 localizedStringForKey:@"COMPANION_UNREACHABLE_ALERT_TITLE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
      v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"COMPANION_UNREACHABLE_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
      uint64_t v25 = PKDisplayableErrorCustom();

      uint64_t v43 = *MEMORY[0x263F08608];
      v44 = v25;
      v35 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      v36 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5C858] code:19 userInfo:v35];
      ((void (**)(void, void, void *))v17)[2](v17, 0, v36);
    }
  }
  else
  {
    [(NPKSubcredentialInvitationCoordinator *)self fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:v17];
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

void __159__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!v5 || v6)
  {
    if (a1[6])
    {
      if (!v6)
      {
        if (v5)
        {
          BOOL v10 = @"An unknown error occurred!";
          uint64_t v11 = 0;
        }
        else
        {
          BOOL v10 = @"Unable to start provisioning on local device without an anonymization salt";
          uint64_t v11 = 3;
        }
        id v6 = [a1[5] _errorWithCode:v11 message:v10];
      }
      (*((void (**)(void))a1[6] + 2))();
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F5BD78]);
    [v8 setAnonymizationSalt:v5];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __159__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke_2;
    v12[3] = &unk_2644D3748;
    objc_copyWeak(&v16, a1 + 7);
    id v13 = a1[4];
    id v9 = v8;
    id v14 = v9;
    id v15 = a1[6];
    [WeakRetained setAccountAttestationAnonymizationSalt:v5 completion:v12];

    objc_destroyWeak(&v16);
    id v6 = 0;
  }
}

void __159__NPKSubcredentialInvitationCoordinator_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v4 = WeakRetained;
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [WeakRetained startProvisioningWithInvitation:*(void *)(a1 + 32) metadata:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  BOOL v10 = [(NPKSubcredentialInvitationCoordinator *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__NPKSubcredentialInvitationCoordinator_subcredentialProvisioningController_didFinishWithError_inState___block_invoke;
  block[3] = &unk_2644D3798;
  objc_copyWeak(v16, &location);
  id v14 = v8;
  id v15 = v9;
  v16[1] = (id)a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __104__NPKSubcredentialInvitationCoordinator_subcredentialProvisioningController_didFinishWithError_inState___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 56);
      int v11 = 138544130;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Subcredential provisioning controller %@ did finish with error: %@ in state: %lu", (uint8_t *)&v11, 0x2Au);
    }
  }
  [WeakRetained _endProvisioningWithPassForInvitation:0 error:*(void *)(a1 + 40)];
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(NPKSubcredentialInvitationCoordinator *)self callbackQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __95__NPKSubcredentialInvitationCoordinator_subcredentialProvisioningController_didFinishWithPass___block_invoke;
  v11[3] = &unk_2644D34F0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __95__NPKSubcredentialInvitationCoordinator_subcredentialProvisioningController_didFinishWithPass___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543874;
      int v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Subcredential provisioning controller %@ did finish with pass: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  [WeakRetained _endProvisioningWithPassForInvitation:*(void *)(a1 + 40) error:0];
}

- (void)_queue_canAcceptInvitation:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
  int v10 = [v9 targetDevice];

  if (objc_opt_respondsToSelector())
  {
    int v11 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
    [v10 paymentWebService:v11 canAcceptInvitation:v6 withCompletionV2:v7];
LABEL_9:

    goto LABEL_10;
  }
  __int16 v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    __int16 v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:canAcceptInvitation:withCompletionV2:]", (uint8_t *)&v17, 0xCu);
    }
  }
  if (v7)
  {
    int v11 = [(NPKSubcredentialInvitationCoordinator *)self _errorWithCode:1 message:@"Unable to attempt to accept invitation"];
    v7[2](v7, v11);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_queue_listSubcredentialInvitationsWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void))a3;
  id v5 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
  id v7 = [v6 targetDevice];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
    [v7 paymentWebService:v8 subcredentialInvitationsWithCompletion:v4];
  }
  else
  {
    uint64_t v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      int v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = (objc_class *)objc_opt_class();
        BOOL v13 = NSStringFromClass(v12);
        int v14 = 138543362;
        uint64_t v15 = v13;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:subcredentialInvitationsWithCompletion:]", (uint8_t *)&v14, 0xCu);
      }
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
}

- (void)_queue_deviceContainsInvitationMatchingInvitation:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  BOOL v10 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v10);

  int v11 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
  __int16 v12 = [v11 targetDevice];

  if (objc_opt_respondsToSelector())
  {
    BOOL v13 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
    [v12 paymentWebService:v13 matchingInvitationOnDevice:v8 withTimeout:a4 completion:v9];
LABEL_9:

    goto LABEL_10;
  }
  int v14 = pk_General_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    uint64_t v16 = pk_General_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:matchingInvitationOnDevice:withTimeout:completion:]", (uint8_t *)&v19, 0xCu);
    }
  }
  if (v9)
  {
    BOOL v13 = [(NPKSubcredentialInvitationCoordinator *)self _errorWithCode:2 message:@"Unable to check whether device has matching invitation"];
    v9[2](v9, 0, v13);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_queue_accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void, void *))a3;
  id v5 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
  id v7 = [v6 targetDevice];

  if (objc_opt_respondsToSelector())
  {
    id v8 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
    [v7 paymentWebService:v8 accountAttestationAnonymizationSaltWithCompletion:v4];
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    int v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = (objc_class *)objc_opt_class();
      BOOL v13 = NSStringFromClass(v12);
      int v14 = 138543362;
      BOOL v15 = v13;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:accountAttestationAnonymizationSaltWithCompletion:]", (uint8_t *)&v14, 0xCu);
    }
  }
  if (v4)
  {
    id v8 = [(NPKSubcredentialInvitationCoordinator *)self _errorWithCode:3 message:@"Unable to fetch account attestation"];
    v4[2](v4, 0, v8);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_queue_setAccountAttestationAnonymizationSalt:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
  BOOL v10 = [v9 targetDevice];

  if (objc_opt_respondsToSelector())
  {
    int v11 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
    [v10 paymentWebService:v11 setAccountAttestationAnonymizationSalt:v6 withCompletion:v7];
LABEL_9:

    goto LABEL_10;
  }
  __int16 v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    int v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:setAccountAttestationAnonymizationSalt:withCompletion:]", (uint8_t *)&v17, 0xCu);
    }
  }
  if (v7)
  {
    int v11 = [(NPKSubcredentialInvitationCoordinator *)self _errorWithCode:0 message:@"Unable to set anonymiztion salt for account attestaion"];
    v7[2](v7, v11);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_queue_requestSubcredentialInvitation:(id)a3 fromIDSHandle:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  uint64_t v9 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v9);

  BOOL v10 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
  int v11 = [v10 targetDevice];

  if (objc_opt_respondsToSelector())
  {
    __int16 v12 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
    [v11 paymentWebService:v12 requestSubcredentialInvitation:v7 completion:v8];
LABEL_9:

    goto LABEL_10;
  }
  BOOL v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    BOOL v15 = pk_General_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      int v17 = NSStringFromClass(v16);
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:requestSubcredentialInvitation:completion:]", (uint8_t *)&v18, 0xCu);
    }
  }
  if (v8)
  {
    __int16 v12 = [(NPKSubcredentialInvitationCoordinator *)self _errorWithCode:2 message:@"Unable to request new invitation"];
    v8[2](v8, v12);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_queue_updateSubcredentialMetadataOnPass:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void))a5;
  int v11 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v11);

  __int16 v12 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
  BOOL v13 = [v12 targetDevice];

  if (objc_opt_respondsToSelector())
  {
    BOOL v14 = [(NPKSubcredentialInvitationCoordinator *)self _paymentWebService];
    [v13 paymentWebService:v14 updateMetadataOnPass:v8 withCredential:v9 completion:v10];
  }
  else
  {
    BOOL v15 = pk_General_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      int v17 = pk_General_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = (objc_class *)objc_opt_class();
        uint64_t v19 = NSStringFromClass(v18);
        int v20 = 138543362;
        uint64_t v21 = v19;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Target device does not respond to -[paymentWebService:updateMetadataOnPass:withCredential:completion:]", (uint8_t *)&v20, 0xCu);
      }
    }
    if (v10) {
      v10[2](v10, 0);
    }
  }
}

- (void)_queue_registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(NPKSubcredentialInvitationCoordinator *)self paymentService];
  [v9 registerCredentialsWithIdentifiers:v7 completion:v6];
}

- (void)_queue_revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(NPKSubcredentialInvitationCoordinator *)self paymentService];
  [v9 revokeCredentialsWithIdentifiers:v7 completion:v6];
}

- (void)_queue_removeSharingInvitation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(NPKSubcredentialInvitationCoordinator *)self paymentService];
  [v9 removeSharingInvitation:v7 withCompletion:v6];
}

- (void)_queue_declineRelatedInvitationsIfNecessaryForInvitation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(NPKSubcredentialInvitationCoordinator *)self paymentService];
  [v9 declineRelatedSharingInvitationsIfNecessary:v7 withCompletion:v6];
}

- (void)_queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __126__NPKSubcredentialInvitationCoordinator__queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke;
  v7[3] = &unk_2644D35B8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(NPKSubcredentialInvitationCoordinator *)self _queue_accountAttestationAnonymizationSaltWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __126__NPKSubcredentialInvitationCoordinator__queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5 || v6)
  {
    if (v6)
    {
      BOOL v14 = pk_General_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        BOOL v16 = pk_General_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = (objc_class *)objc_opt_class();
          int v18 = NSStringFromClass(v17);
          *(_DWORD *)buf = 138543618;
          v31 = v18;
          __int16 v32 = 2112;
          id v33 = v6;
          _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Failed to get anonymization salt: %@. Proceeding anyway...", buf, 0x16u);
        }
      }
    }
    uint64_t v19 = [MEMORY[0x263F5BCE0] createAnonymizationSalt];
    int v20 = pk_General_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      uint64_t v22 = pk_General_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = (objc_class *)objc_opt_class();
        __int16 v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138543362;
        v31 = v24;
        _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: No salt found, setting default salt", buf, 0xCu);
      }
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __126__NPKSubcredentialInvitationCoordinator__queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_144;
    v26[3] = &unk_2644D3608;
    objc_copyWeak(&v29, (id *)(a1 + 40));
    id v25 = v19;
    id v27 = v25;
    id v28 = *(id *)(a1 + 32);
    [WeakRetained setAccountAttestationAnonymizationSalt:v25 completion:v26];

    objc_destroyWeak(&v29);
  }
  else
  {
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = (objc_class *)objc_opt_class();
        __int16 v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138543618;
        v31 = v12;
        __int16 v32 = 2112;
        id v33 = v5;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Found previously established anonymization salt: %@", buf, 0x16u);
      }
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v5, 0);
    }
  }
}

void __126__NPKSubcredentialInvitationCoordinator__queue_fetchOrInitializeAccountAttestationAnonymizationSaltIfNecessaryWithCompletion___block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Set default salt with salt: %@ error: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, *(void *)(a1 + 32), v3);
  }
}

- (void)_setUpSubcredentialProvisioningController
{
  id v3 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x263F5C298]);
  [(NPKSubcredentialInvitationCoordinator *)self setSubcredentialProvisioningController:v4];

  id v5 = [(NPKSubcredentialInvitationCoordinator *)self subcredentialProvisioningController];
  [v5 setDelegate:self];
}

- (void)_setUpSharingSessionWithSubcredentialProvisioningController:(id)a3 forInvitation:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  if (v6 && v7)
  {
    if ([v7 type] == 1) {
      [MEMORY[0x263F5BD80] createPendingSessionWithDelegate:v6];
    }
    else {
    uint64_t v11 = [MEMORY[0x263F5BD80] createSessionWithDelegate:v6];
    }
    [(NPKSubcredentialInvitationCoordinator *)self setSharingSession:v11];
LABEL_10:

    goto LABEL_11;
  }
  BOOL v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    uint64_t v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to find a subcredential provisioning controller, but instead found nil!: %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (id)_paymentWebService
{
  return (id)[MEMORY[0x263F5C128] sharedService];
}

- (BOOL)_isInvitationUniqueForPairedReaderIdentifier:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F5BF80]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = objc_msgSend(v4, "passes", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [*(id *)(*((void *)&v33 + 1) + 8 * i) paymentPass];
        uint64_t v11 = [v10 pairedTerminalIdentifier];
        if ([(__CFString *)v11 isEqualToString:v3])
        {
          uint64_t v13 = pk_General_log();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

          if (v14)
          {
            uint64_t v15 = pk_General_log();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v16 = (objc_class *)objc_opt_class();
              id v17 = NSStringFromClass(v16);
              uint64_t v18 = [v10 uniqueID];
              *(_DWORD *)buf = 138544130;
              id v38 = v17;
              __int16 v39 = 2112;
              uint64_t v40 = (uint64_t)v3;
              __int16 v41 = 2112;
              v42 = v11;
              __int16 v43 = 2112;
              v44 = v18;
              _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: The invitation's paired reader identifier (%@) matches the paired reader identifier (%@) of pass with unique ID %@", buf, 0x2Au);
            }
          }
          uint64_t v19 = [v10 devicePrimaryPaymentApplication];
          [v19 state];
          int IsPersonalized = PKPaymentApplicationStateIsPersonalized();

          uint64_t v21 = [v10 effectiveContactlessPaymentApplicationState];
          uint64_t v22 = pk_General_log();
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

          if (v23)
          {
            __int16 v24 = pk_General_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = (objc_class *)objc_opt_class();
              __int16 v26 = NSStringFromClass(v25);
              uint64_t v27 = [v10 uniqueID];
              id v28 = (void *)v27;
              id v29 = @"YES";
              *(_DWORD *)buf = 138544130;
              id v38 = v26;
              if (IsPersonalized) {
                uint64_t v30 = @"YES";
              }
              else {
                uint64_t v30 = @"NO";
              }
              if (v21 != 2) {
                id v29 = @"NO";
              }
              __int16 v39 = 2112;
              uint64_t v40 = v27;
              __int16 v41 = 2112;
              v42 = v30;
              __int16 v43 = 2112;
              v44 = v29;
              _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Pass with unique ID %@ is personalized: %@ personalizing: %@", buf, 0x2Au);
            }
          }
          if (IsPersonalized) {
            BOOL v31 = 1;
          }
          else {
            BOOL v31 = v21 == 2;
          }
          BOOL v12 = !v31;

          goto LABEL_30;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_30:

  return v12;
}

- (void)_fetchInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __83__NPKSubcredentialInvitationCoordinator__fetchInvitationWithIdentifier_completion___block_invoke;
    v14[3] = &unk_2644D37E8;
    uint64_t v15 = v6;
    id v16 = v7;
    [(NPKSubcredentialInvitationCoordinator *)self listSubcredentialInvitationsWithCompletion:v14];

    BOOL v9 = v15;
  }
  else
  {
    BOOL v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (!v11) {
      goto LABEL_4;
    }
    BOOL v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to return an invitation, but no completion block was provided: %@", buf, 0x16u);
    }
  }

LABEL_4:
}

void __83__NPKSubcredentialInvitationCoordinator__fetchInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  BOOL v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__NPKSubcredentialInvitationCoordinator__fetchInvitationWithIdentifier_completion___block_invoke_148;
  v6[3] = &unk_2644D37C0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = &v9;
  [v3 enumerateObjectsUsingBlock:v6];
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10[5], v4, v5);

  _Block_object_dispose(&v9, 8);
}

void __83__NPKSubcredentialInvitationCoordinator__fetchInvitationWithIdentifier_completion___block_invoke_148(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 identifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_fetchInvitationMatchingInvitation:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __87__NPKSubcredentialInvitationCoordinator__fetchInvitationMatchingInvitation_completion___block_invoke;
    v14[3] = &unk_2644D37E8;
    uint64_t v15 = v6;
    id v16 = v7;
    [(NPKSubcredentialInvitationCoordinator *)self listSubcredentialInvitationsWithCompletion:v14];

    uint64_t v9 = v15;
  }
  else
  {
    BOOL v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (!v11) {
      goto LABEL_4;
    }
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to return an invitation, but no completion block was provided: %@", buf, 0x16u);
    }
  }

LABEL_4:
}

void __87__NPKSubcredentialInvitationCoordinator__fetchInvitationMatchingInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  BOOL v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__NPKSubcredentialInvitationCoordinator__fetchInvitationMatchingInvitation_completion___block_invoke_2;
  v6[3] = &unk_2644D37C0;
  id v7 = *(id *)(a1 + 32);
  id v8 = &v9;
  [v3 enumerateObjectsUsingBlock:v6];
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10[5], v4, v5);

  _Block_object_dispose(&v9, 8);
}

void __87__NPKSubcredentialInvitationCoordinator__fetchInvitationMatchingInvitation_completion___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 isSameInvitationAsInvitation:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_makeConfigurationForInvitation:(id)a3 session:(id)a4 metadata:(id)a5 paymentWebService:(id)a6 completion:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v17);

  if (v16)
  {
    if (v12 && v13 && v15)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __119__NPKSubcredentialInvitationCoordinator__makeConfigurationForInvitation_session_metadata_paymentWebService_completion___block_invoke;
      v28[3] = &unk_2644D3810;
      id v29 = v13;
      id v30 = v12;
      id v31 = v14;
      id v32 = v15;
      long long v33 = self;
      id v34 = v16;
      [(NPKSubcredentialInvitationCoordinator *)self canAcceptInvitation:v30 completion:v28];

      uint64_t v18 = v29;
    }
    else
    {
      BOOL v23 = pk_General_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v24)
      {
        id v25 = pk_General_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = (objc_class *)objc_opt_class();
          uint64_t v27 = NSStringFromClass(v26);
          *(_DWORD *)buf = 138544386;
          long long v36 = v27;
          __int16 v37 = 2112;
          id v38 = v13;
          __int16 v39 = 2112;
          id v40 = v12;
          __int16 v41 = 2112;
          id v42 = v14;
          __int16 v43 = 2112;
          id v44 = v15;
          _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to make accept invitation configuration with a non-nil sharing session, invitation, and paymentWebService! sharingSession: %@ invitation: %@ metadata: %@ paymentWebService: %@", buf, 0x34u);
        }
      }
      uint64_t v18 = [(NPKSubcredentialInvitationCoordinator *)self _errorWithCode:0 message:@"Unable to make invitation configuration - insufficient information"];
      (*((void (**)(id, void, NSObject *))v16 + 2))(v16, 0, v18);
    }
LABEL_14:

    goto LABEL_15;
  }
  __int16 v19 = pk_General_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    uint64_t v18 = pk_General_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      long long v36 = v22;
      __int16 v37 = 2112;
      id v38 = 0;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to return a configuration, but no completion block was provided: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_15:
}

void __119__NPKSubcredentialInvitationCoordinator__makeConfigurationForInvitation_session_metadata_paymentWebService_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = pk_General_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        int v11 = 138543618;
        id v12 = v8;
        __int16 v13 = 2112;
        id v14 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Unable to make accept invitation configuration for this invitation! error: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    uint64_t v9 = [*(id *)(a1 + 64) _errorWithCode:1 message:@"Unable to make invitation configuration - cannot accept invitation"];
    BOOL v10 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  else
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F5C290]) initWithSession:*(void *)(a1 + 32) invitation:*(void *)(a1 + 40) metadata:*(void *)(a1 + 48) declineRelatedInvitations:0 localDeviceWebService:*(void *)(a1 + 56) remoteDeviceWebService:0];
    BOOL v10 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  v10();
}

- (void)_handleProvisioningAttemptForConfiguration:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  if (v7)
  {
    id v8 = [(NPKSubcredentialInvitationCoordinator *)self callbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __90__NPKSubcredentialInvitationCoordinator__handleProvisioningAttemptForConfiguration_error___block_invoke_2;
    v12[3] = &unk_2644D2BB8;
    uint64_t v9 = &v14;
    objc_copyWeak(&v14, &location);
    BOOL v10 = &v13;
    id v13 = v7;
    int v11 = v12;
  }
  else
  {
    id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__NPKSubcredentialInvitationCoordinator__handleProvisioningAttemptForConfiguration_error___block_invoke;
    block[3] = &unk_2644D2BB8;
    uint64_t v9 = &v17;
    objc_copyWeak(&v17, &location);
    BOOL v10 = &v16;
    id v16 = v6;
    int v11 = block;
  }
  dispatch_async(v8, v11);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __90__NPKSubcredentialInvitationCoordinator__handleProvisioningAttemptForConfiguration_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained subcredentialProvisioningController];
  [WeakRetained _startProvisioningForProvisioningController:v2 withConfiguration:*(void *)(a1 + 32)];
}

void __90__NPKSubcredentialInvitationCoordinator__handleProvisioningAttemptForConfiguration_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _endProvisioningWithPassForInvitation:0 error:*(void *)(a1 + 32)];
}

- (void)_performBlockFollowingFirstUnlockWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (NPKProtectedDataAvailable())
  {
    v4[2](v4);
  }
  else
  {
    BOOL v5 = [(NPKSubcredentialInvitationCoordinator *)self firstUnlockCoordinator];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __84__NPKSubcredentialInvitationCoordinator__performBlockFollowingFirstUnlockWithBlock___block_invoke;
    v6[3] = &unk_2644D2B10;
    id v7 = v4;
    [v5 performSubjectToFirstUnlock:v6];
  }
}

uint64_t __84__NPKSubcredentialInvitationCoordinator__performBlockFollowingFirstUnlockWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_errorWithCode:(int64_t)a3 message:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 1) > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_21EBB16D0[a3 - 1];
  }
  BOOL v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F5C858];
  uint64_t v12 = *MEMORY[0x263F08338];
  v13[0] = a4;
  id v7 = NSDictionary;
  id v8 = a4;
  uint64_t v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  BOOL v10 = [v5 errorWithDomain:v6 code:v4 userInfo:v9];

  return v10;
}

- (void)_startProvisioningForProvisioningController:(id)a3 withConfiguration:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPKSubcredentialInvitationCoordinator *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    int v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543874;
      BOOL v20 = v13;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Starting provisioning for provisioning controller: %@ with configuration: %@", buf, 0x20u);
    }
  }
  if (v6 && v7)
  {
    [v6 startProvisioningWithConfiguration:v7];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v14 = [(NPKSubcredentialInvitationCoordinator *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__NPKSubcredentialInvitationCoordinator__startProvisioningForProvisioningController_withConfiguration___block_invoke;
    block[3] = &unk_2644D34F0;
    objc_copyWeak(&v18, (id *)buf);
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v14, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

void __103__NPKSubcredentialInvitationCoordinator__startProvisioningForProvisioningController_withConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected to start provisioning with a non-nil subcredential provisioning controller and configuration! subcredentialProvisioningController: %@ configuration: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  BOOL v10 = [WeakRetained _errorWithCode:0 message:@"Unable to start provisioning - insufficient information"];
  [WeakRetained _endProvisioningWithPassForInvitation:0 error:v10];
}

- (void)_endProvisioningWithPassForInvitation:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NPKSubcredentialInvitationCoordinator *)self callbackQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    int v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      int v15 = 138543874;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: End provisioning with pass: %@ error: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  [(NPKSubcredentialInvitationCoordinator *)self _invokeCompletionWithPassForInvitation:v6 error:v7];
  [(NPKSubcredentialInvitationCoordinator *)self setSubcredentialProvisioningController:0];
  uint64_t v14 = [(NPKSubcredentialInvitationCoordinator *)self sharingSession];
  [v14 endSession];

  [(NPKSubcredentialInvitationCoordinator *)self setSharingSession:0];
  [(NPKSubcredentialInvitationCoordinator *)self setFirstUnlockCoordinator:0];
}

- (void)_invokeCompletionWithPassForInvitation:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NPKSubcredentialInvitationCoordinator *)self callbackQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(NPKSubcredentialInvitationCoordinator *)self completion];
  [(NPKSubcredentialInvitationCoordinator *)self setCompletion:0];
  if (v9)
  {
    ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    BOOL v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      uint64_t v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        int v15 = 138543362;
        uint64_t v16 = v14;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Attempted to invoke completion handler, but no block was found!", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void)setPaymentService:(id)a3
{
}

- (PKSubcredentialProvisioningController)subcredentialProvisioningController
{
  return self->_subcredentialProvisioningController;
}

- (void)setSubcredentialProvisioningController:(id)a3
{
}

- (PKAppletSubcredentialSharingSession)sharingSession
{
  return self->_sharingSession;
}

- (void)setSharingSession:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void)setFirstUnlockCoordinator:(id)a3
{
}

- (void)setSubcredentialProvisioningService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentialProvisioningService, 0);
  objc_storeStrong((id *)&self->_firstUnlockCoordinator, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_sharingSession, 0);
  objc_storeStrong((id *)&self->_subcredentialProvisioningController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end