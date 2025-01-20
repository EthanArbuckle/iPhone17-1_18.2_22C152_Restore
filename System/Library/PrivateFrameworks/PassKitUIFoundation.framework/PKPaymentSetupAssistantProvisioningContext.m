@interface PKPaymentSetupAssistantProvisioningContext
- (PKPassSnapshotCoordinatorProtocol)snapshotCoordinator;
- (PKPaymentSetupAssistantProvisioningContext)initWithProvisioningController:(id)a3 snapshotCoordinator:(id)a4 setupAssistantCredentials:(id)a5 maximumSelectable:(unint64_t)a6;
- (PKPaymentSetupAssistantProvisioningContextDelegate)delegate;
- (id)_setupAssistantCredentialForPaymentCredential:(id)a3;
- (id)passSnapshotForCredential:(id)a3;
- (void)paymentPassUpdatedOnCredential:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSnapshotCoordinator:(id)a3;
@end

@implementation PKPaymentSetupAssistantProvisioningContext

- (PKPaymentSetupAssistantProvisioningContext)initWithProvisioningController:(id)a3 snapshotCoordinator:(id)a4 setupAssistantCredentials:(id)a5 maximumSelectable:(unint64_t)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupAssistantProvisioningContext;
  v12 = [(PKPaymentSetupAssistantCoreProvisioningContext *)&v15 initWithProvisioningController:a3 setupAssistantCredentials:a5 maximumSelectable:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_snapshotCoordinator, a4);
  }

  return v13;
}

- (id)passSnapshotForCredential:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    delegate = self->_delegate;
    if (delegate)
    {
      [(PKPaymentSetupAssistantProvisioningContextDelegate *)delegate setupAssistantCredentialCardArtSize];
      snapshotCoordinator = self->_snapshotCoordinator;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __72__PKPaymentSetupAssistantProvisioningContext_passSnapshotForCredential___block_invoke;
      v11[3] = &unk_2644F8DE8;
      v11[4] = self;
      v7 = -[PKPassSnapshotCoordinatorProtocol cardSnapshotForSource:withSize:completion:](snapshotCoordinator, "cardSnapshotForSource:withSize:completion:", v4, v11);
      goto LABEL_10;
    }
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[PKPaymentSetupAssistantProvisioningContext passSnapshotForCredential:]";
      v9 = "%s - called without a delegate set, returning nil as no snapshot size can be determined.";
      goto LABEL_8;
    }
  }
  else
  {
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[PKPaymentSetupAssistantProvisioningContext passSnapshotForCredential:]";
      v9 = "%s - called without a credential, returning nil.";
LABEL_8:
      _os_log_impl(&dword_21EEBD000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }

  v7 = 0;
LABEL_10:

  return v7;
}

uint64_t __72__PKPaymentSetupAssistantProvisioningContext_passSnapshotForCredential___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setupAssistantCredentialUpdatedCardArt:");
}

- (void)paymentPassUpdatedOnCredential:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (self->_delegate)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__PKPaymentSetupAssistantProvisioningContext_paymentPassUpdatedOnCredential___block_invoke;
    v7[3] = &unk_2644F8C58;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  else
  {
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[PKPaymentSetupAssistantProvisioningContext paymentPassUpdatedOnCredential:]";
      _os_log_impl(&dword_21EEBD000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring %s as no delegate has been set.", buf, 0xCu);
    }
  }
}

void __77__PKPaymentSetupAssistantProvisioningContext_paymentPassUpdatedOnCredential___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _setupAssistantCredentialForPaymentCredential:*(void *)(a1 + 40)];
  v2 = objc_msgSend(*(id *)(a1 + 32), "passSnapshotForCredential:");
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 40) setupAssistantCredentialUpdatedCardArt:v3];
  }
}

- (id)_setupAssistantCredentialForPaymentCredential:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentSetupAssistantProvisioningContext *)self setupAssistantCredentials];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __92__PKPaymentSetupAssistantProvisioningContext__setupAssistantCredentialForPaymentCredential___block_invoke;
  v9[3] = &unk_2644F8E10;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __92__PKPaymentSetupAssistantProvisioningContext__setupAssistantCredentialForPaymentCredential___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 credential];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (PKPaymentSetupAssistantProvisioningContextDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (PKPassSnapshotCoordinatorProtocol)snapshotCoordinator
{
  return self->_snapshotCoordinator;
}

- (void)setSnapshotCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCoordinator, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end