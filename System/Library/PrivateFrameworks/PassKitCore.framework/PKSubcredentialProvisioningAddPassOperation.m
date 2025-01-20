@interface PKSubcredentialProvisioningAddPassOperation
- (PKSubcredentialProvisioningAddPassOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)addPassToLibrary:(id)a3 withCompletion:(id)a4;
- (void)configureExpressModeForPass:(id)a3 withCompletion:(id)a4;
- (void)performOperation;
- (void)performOperationWithCompletion:(id)a3;
- (void)updatePassMetadata:(id)a3 withCompletion:(id)a4;
@end

@implementation PKSubcredentialProvisioningAddPassOperation

- (PKSubcredentialProvisioningAddPassOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKSubcredentialProvisioningAddPassOperation;
  v9 = [(PKSubcredentialProvisioningOperation *)&v21 initWithConfiguration:a3 context:v8 delegate:a5];
  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = [v8 downloadedPass];
  downloadedPass = v9->_downloadedPass;
  v9->_downloadedPass = (PKPaymentPass *)v10;

  uint64_t v12 = [v8 addedCredential];
  addedCredential = v9->_addedCredential;
  v9->_addedCredential = (PKAppletSubcredential *)v12;

  if (!v9->_downloadedPass)
  {
    v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      v18 = "Missing downloaded pass in %@!";
LABEL_9:
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  if (!v9->_addedCredential)
  {
    v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      v18 = "Missing credential in %@!";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v14 = v9;
LABEL_11:

  return v14;
}

- (void)performOperation
{
  v10.receiver = self;
  v10.super_class = (Class)PKSubcredentialProvisioningAddPassOperation;
  [(PKSubcredentialProvisioningOperation *)&v10 performOperation];
  v3 = [(PKSubcredentialProvisioningOperation *)self context];
  v4 = [v3 operationQueue];

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PKSubcredentialProvisioningAddPassOperation_performOperation__block_invoke;
  v6[3] = &unk_1E56E1328;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(PKSubcredentialProvisioningAddPassOperation *)self performOperationWithCompletion:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __63__PKSubcredentialProvisioningAddPassOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PKSubcredentialProvisioningAddPassOperation_performOperation__block_invoke_2;
  v6[3] = &unk_1E56D9150;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __63__PKSubcredentialProvisioningAddPassOperation_performOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "failWithError:");
    }
    else
    {
      id v3 = [WeakRetained configuration];
      uint64_t v4 = [v3 configurationType];

      if (v4 == 1) {
        uint64_t v5 = 4;
      }
      else {
        uint64_t v5 = 16;
      }
      [v6 advanceToState:v5];
    }
    id WeakRetained = v6;
  }
}

- (void)performOperationWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = self->_downloadedPass;
  id v6 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(PKObject *)v5 uniqueID];
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Adding pass to library %@...", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke;
  v9[3] = &unk_1E56E1378;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [(PKSubcredentialProvisioningAddPassOperation *)self addPassToLibrary:v5 withCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 uniqueID];
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Configuring pass %@...", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (!v10) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke_14;
    v13[3] = &unk_1E56E1350;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    id v15 = *(id *)(a1 + 32);
    id v14 = v5;
    [WeakRetained updatePassMetadata:v14 withCompletion:v13];

    objc_destroyWeak(&v16);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v6 debugDescription];
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error while adding pass: %@", buf, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
LABEL_11:
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
LABEL_12:
}

void __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = [WeakRetained delegate];
      [v6 operation:v5 addedPass:v3];

      id v7 = v3;
    }
    else
    {
      id v7 = *(id *)(a1 + 32);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D8360;
    id v11 = *(id *)(a1 + 40);
    [v5 configureExpressModeForPass:v7 withCompletion:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

uint64_t __78__PKSubcredentialProvisioningAddPassOperation_performOperationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)addPassToLibrary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKSubcredentialProvisioningOperation *)self configuration];
  v9 = [v8 localDeviceConfiguration];

  uint64_t v10 = [v9 webService];
  id v11 = [(PKSubcredentialProvisioningOperation *)self context];
  uint64_t v12 = [v11 operationQueue];

  objc_initWeak(&location, self);
  v13 = [v10 targetDevice];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PKSubcredentialProvisioningAddPassOperation_addPassToLibrary_withCompletion___block_invoke;
  v17[3] = &unk_1E56E13A0;
  objc_copyWeak(&v21, &location);
  id v14 = v7;
  id v20 = v14;
  id v15 = v6;
  id v18 = v15;
  id v16 = v12;
  id v19 = v16;
  [v13 paymentWebService:v10 addPaymentPass:v15 withCompletionHandlerV2:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __79__PKSubcredentialProvisioningAddPassOperation_addPassToLibrary_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!v3)
  {
    v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to add downloaded pass to library", buf, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 48);
LABEL_9:
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);

    goto LABEL_10;
  }
  id v6 = [WeakRetained delegate];
  [v6 operation:v5 addedPass:*(void *)(a1 + 32)];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__PKSubcredentialProvisioningAddPassOperation_addPassToLibrary_withCompletion___block_invoke_17;
  v11[3] = &unk_1E56D83D8;
  id v7 = *(NSObject **)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v12 = v3;
  dispatch_async(v7, v11);

LABEL_10:
}

uint64_t __79__PKSubcredentialProvisioningAddPassOperation_addPassToLibrary_withCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)configureExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [(PKSubcredentialProvisioningOperation *)self configuration];
  v9 = [v8 localDeviceConfiguration];
  uint64_t v10 = [v9 webService];

  id v11 = [v10 targetDevice];
  if (PKTargetDeviceSupportsExpress(v11))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__PKSubcredentialProvisioningAddPassOperation_configureExpressModeForPass_withCompletion___block_invoke;
    v14[3] = &unk_1E56D8748;
    id v15 = v6;
    id v16 = v7;
    [v11 paymentWebService:v10 handlePotentialExpressPass:v15 withCompletionHandler:v14];
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 uniqueID];
      *(_DWORD *)buf = 138412546;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Newly provisioned pass (%@) was not set as express as target device (%@) does not support express", buf, 0x16u);
    }
    v7[2](v7);
  }
}

uint64_t __90__PKSubcredentialProvisioningAddPassOperation_configureExpressModeForPass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v5 uniqueID];
    uint64_t v8 = [v6 count];

    v9 = "";
    if (!v8) {
      v9 = "not ";
    }
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2080;
    id v14 = v9;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Newly provisioned pass (%@) was %sset as express", (uint8_t *)&v11, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updatePassMetadata:(id)a3 withCompletion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(PKSubcredentialProvisioningOperation *)self context];
  uint64_t v29 = [v8 operationQueue];

  v9 = [(PKSubcredentialProvisioningOperation *)self configuration];
  uint64_t v10 = [v9 localDeviceConfiguration];
  int v11 = [v10 webService];

  id v12 = [v11 targetDevice];
  __int16 v13 = [v6 devicePrimaryPaymentApplication];
  id v14 = [v13 subcredentials];
  uint64_t v15 = [v14 anyObject];

  id v16 = [(PKAppletSubcredential *)self->_addedCredential identifier];
  v17 = [v15 identifier];
  id v18 = v17;
  if (v16) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {

    if (v16 == v18) {
      goto LABEL_9;
    }
LABEL_7:
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:8, @"Found unknown credential on downloaded pass", v29 description];
LABEL_14:
    v26 = v30;
    goto LABEL_15;
  }
  char v20 = [v16 isEqual:v17];

  if ((v20 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_9:
  -[PKAppletSubcredential setState:](self->_addedCredential, "setState:", objc_msgSend(v15, "state", v29));
  addedCredential = self->_addedCredential;
  v22 = [v15 entitlement];
  [(PKAppletSubcredential *)addedCredential setEntitlement:v22];

  v23 = self->_addedCredential;
  uint64_t v24 = [v15 sharingConfiguration];
  [(PKAppletSubcredential *)v23 setSharingConfiguration:v24];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v27 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v6 uniqueID];
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Unable to update credential metadata on pass: %@", buf, 0xCu);
    }
    v7[2](v7, 0);
    goto LABEL_14;
  }
  v25 = self->_addedCredential;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__PKSubcredentialProvisioningAddPassOperation_updatePassMetadata_withCompletion___block_invoke;
  v31[3] = &unk_1E56E13C8;
  id v32 = v6;
  v26 = v30;
  id v33 = v30;
  v34 = v7;
  [v12 paymentWebService:v11 updateMetadataOnPass:v32 withCredential:v25 completion:v31];

LABEL_15:
}

void __81__PKSubcredentialProvisioningAddPassOperation_updatePassMetadata_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [v3 uniqueID];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      id v7 = "Updated metadata on pass: %@";
LABEL_6:
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    }
  }
  else if (v5)
  {
    id v6 = [*(id *)(a1 + 32) uniqueID];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v6;
    id v7 = "Failed to update metadata on pass: %@";
    goto LABEL_6;
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PKSubcredentialProvisioningAddPassOperation_updatePassMetadata_withCompletion___block_invoke_26;
  v11[3] = &unk_1E56D83D8;
  uint64_t v8 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v12 = v3;
  id v13 = v9;
  id v10 = v3;
  dispatch_async(v8, v11);
}

uint64_t __81__PKSubcredentialProvisioningAddPassOperation_updatePassMetadata_withCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedCredential, 0);
  objc_storeStrong((id *)&self->_downloadedPass, 0);
}

@end