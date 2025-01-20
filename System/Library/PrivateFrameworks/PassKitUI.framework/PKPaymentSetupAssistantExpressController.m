@interface PKPaymentSetupAssistantExpressController
- (id)_provisioningContextWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5;
- (id)_setupAssistantCredentialForPaymentCredential:(id)a3;
- (id)_setupAssistantCredentialForPaymentPass:(id)a3;
- (void)expressSetupFlowForSetupProvisioningContext:(id)a3 withCompletion:(id)a4;
- (void)expressSetupProvisioningContext:(id)a3;
@end

@implementation PKPaymentSetupAssistantExpressController

- (id)_provisioningContextWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 webService];
  v10 = [v9 targetDevice];
  v11 = [v10 secureElementIdentifiers];

  v12 = [[PKPassSnapshotCoordinator alloc] initWithSEIDs:v11];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F88140]) initWithProvisioningController:v8 snapshotCoordinator:v12 setupAssistantCredentials:v7 maximumSelectable:a5];

  return v13;
}

- (id)_setupAssistantCredentialForPaymentCredential:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F88138];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithPaymentCredential:v4];

  return v5;
}

- (id)_setupAssistantCredentialForPaymentPass:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F88138];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithPaymentPass:v4];

  return v5;
}

- (void)expressSetupProvisioningContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ with: %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PKPaymentSetupAssistantExpressController_expressSetupProvisioningContext___block_invoke;
  v9[3] = &unk_1E59DFFA0;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v8 = v5;
  [(PKPaymentSetupAssistantCoreController *)self _expressSetupProvisioningContext:v9];
}

void __76__PKPaymentSetupAssistantExpressController_expressSetupProvisioningContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v8 = 138543874;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = a3;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ returning:\n%@ with requirements: %lu", (uint8_t *)&v8, 0x20u);
  }
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DB8], 0);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)expressSetupFlowForSetupProvisioningContext:(id)a3 withCompletion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = (void (**)(id, void))a4;
  if (v8)
  {
    v9 = [v7 provisioningController];
    __int16 v10 = [v7 availablePaymentCredentials];
    id v11 = v10;
    if (!v7 || ![v10 count])
    {
      v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Error: Empty provisioning context %@ supplied to %@", buf, 0x16u);
      }
      v8[2](v8, 0);
      goto LABEL_18;
    }
    __int16 v12 = [PKPaymentSetupAssistantDelegateProxy alloc];
    uint64_t v13 = [(PKPaymentSetupAssistantController *)self setupAssistantContext];
    uint64_t v14 = [v13 delegate];
    v15 = [(PKPaymentSetupAssistantDelegateProxy *)v12 initWithDelegate:v14 provisioningController:v9];

    uint64_t v16 = [(PKPaymentSetupAssistantController *)self setupAssistantContext];
    uint64_t v17 = [v16 setupAssistant];

    if (v17 == 1)
    {
      uint64_t v18 = 2;
    }
    else
    {
      if (v17 != 2)
      {
        v23 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [(PKPaymentSetupAssistantController *)self setupAssistantContext];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = [v24 setupAssistant];
          _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Error: expressSetupFlowForSetupProvisioningContext called with unsupported type %lu. File a radar!", buf, 0xCu);
        }
        v8[2](v8, 0);
        goto LABEL_17;
      }
      uint64_t v18 = 6;
    }
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:v18 provisioningController:v9 groupsController:0];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v33 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __103__PKPaymentSetupAssistantExpressController_expressSetupFlowForSetupProvisioningContext_withCompletion___block_invoke;
    v29[3] = &unk_1E59D37A0;
    v30 = v8;
    v31 = buf;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __103__PKPaymentSetupAssistantExpressController_expressSetupFlowForSetupProvisioningContext_withCompletion___block_invoke_2;
    v25[3] = &unk_1E59DF918;
    v28 = buf;
    v26 = v15;
    v27 = v30;
    +[PKProvisioningFlowBridge startSetupAssistantFlowWithContext:v22 credentials:v11 onFirstViewControllerShown:v29 completion:v25];

    _Block_object_dispose(buf, 8);
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Error: No completion provided to %@", buf, 0xCu);
  }
LABEL_19:
}

uint64_t __103__PKPaymentSetupAssistantExpressController_expressSetupFlowForSetupProvisioningContext_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __103__PKPaymentSetupAssistantExpressController_expressSetupFlowForSetupProvisioningContext_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return [*(id *)(a1 + 32) viewControllerDidTerminateSetupFlow:0];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end