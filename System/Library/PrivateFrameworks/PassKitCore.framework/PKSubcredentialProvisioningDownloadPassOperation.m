@interface PKSubcredentialProvisioningDownloadPassOperation
- (PKSubcredentialProvisioningDownloadPassOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)downloadPassAtURL:(id)a3 withCompletion:(id)a4;
- (void)performOperation;
- (void)performOperationWithCompletion:(id)a3;
@end

@implementation PKSubcredentialProvisioningDownloadPassOperation

- (PKSubcredentialProvisioningDownloadPassOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKSubcredentialProvisioningDownloadPassOperation;
  v9 = [(PKSubcredentialProvisioningOperation *)&v17 initWithConfiguration:a3 context:v8 delegate:a5];
  if (v9
    && ([v8 passURL],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        passURL = v9->_passURL,
        v9->_passURL = (NSURL *)v10,
        passURL,
        !v9->_passURL))
  {
    v13 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Missing pass url in %@!", buf, 0xCu);
    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (void)performOperation
{
  v10.receiver = self;
  v10.super_class = (Class)PKSubcredentialProvisioningDownloadPassOperation;
  [(PKSubcredentialProvisioningOperation *)&v10 performOperation];
  v3 = [(PKSubcredentialProvisioningOperation *)self context];
  v4 = [v3 operationQueue];

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PKSubcredentialProvisioningDownloadPassOperation_performOperation__block_invoke;
  v6[3] = &unk_1E56E1328;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(PKSubcredentialProvisioningDownloadPassOperation *)self performOperationWithCompletion:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __68__PKSubcredentialProvisioningDownloadPassOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PKSubcredentialProvisioningDownloadPassOperation_performOperation__block_invoke_2;
  v6[3] = &unk_1E56D9150;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __68__PKSubcredentialProvisioningDownloadPassOperation_performOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(void *)(a1 + 32)) {
      objc_msgSend(WeakRetained, "failWithError:");
    }
    else {
      [WeakRetained advanceToState:12];
    }
    id WeakRetained = v3;
  }
}

- (void)performOperationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  passURL = self->_passURL;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKSubcredentialProvisioningDownloadPassOperation_performOperationWithCompletion___block_invoke;
  v7[3] = &unk_1E56F5430;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [(PKSubcredentialProvisioningDownloadPassOperation *)self downloadPassAtURL:passURL withCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __83__PKSubcredentialProvisioningDownloadPassOperation_performOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (!v12) {
      goto LABEL_12;
    }
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
LABEL_11:

    goto LABEL_12;
  }
  if (!v5)
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_12;
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v13 setValue:@"Failed to download pass" forKey:*MEMORY[0x1E4F28228]];
    [v13 setValue:v6 forKey:*MEMORY[0x1E4F28A50]];
    uint64_t v14 = *(void *)(a1 + 40);
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:8 userInfo:v13];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    goto LABEL_11;
  }
  id v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 uniqueID];
    int v16 = 138412290;
    objc_super v17 = v9;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Downloaded pass %@", (uint8_t *)&v16, 0xCu);
  }
  objc_super v10 = [*(id *)(a1 + 32) context];
  [v10 setDownloadedPass:v5];

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
LABEL_12:
}

- (void)downloadPassAtURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKSubcredentialProvisioningOperation *)self configuration];
  id v9 = [v8 localDeviceConfiguration];

  objc_super v10 = [v9 webService];
  uint64_t v11 = [(PKSubcredentialProvisioningOperation *)self context];
  uint64_t v12 = [v11 operationQueue];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke;
  v16[3] = &unk_1E56F54A8;
  id v17 = v10;
  id v18 = v12;
  id v19 = v6;
  id v13 = v6;
  id v14 = v12;
  id v15 = v10;
  [v15 passAtURL:v7 completion:v16];
}

void __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2 == 1 && v5)
  {
    id v7 = [a1[4] targetDevice];
    id v8 = [v7 secureElementIdentifiers];

    id v9 = +[PKDownloadRemoteAssetConfiguration configurationWithSEIDs:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_2;
    v14[3] = &unk_1E56F5480;
    id v15 = a1[5];
    id v17 = a1[6];
    id v16 = v6;
    [v16 downloadRemoteAssetsWithConfiguration:v9 completion:v14];
  }
  else
  {
    objc_super v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = a2;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed while downloading the pass with result: %ld", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_21;
    v12[3] = &unk_1E56D8360;
    uint64_t v11 = a1[5];
    id v13 = a1[6];
    dispatch_async(v11, v12);
    id v8 = v13;
  }
}

void __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_3;
  v8[3] = &unk_1E56F5458;
  id v9 = v5;
  id v11 = *(id *)(a1 + 48);
  char v12 = a2;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_3(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Failed while downloading the pass assets with error: %@", (uint8_t *)&v5, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16))();
  }
  else if (*(unsigned char *)(result + 56))
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(result + 48) + 16);
    return v4();
  }
  return result;
}

uint64_t __85__PKSubcredentialProvisioningDownloadPassOperation_downloadPassAtURL_withCompletion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedCredential, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end