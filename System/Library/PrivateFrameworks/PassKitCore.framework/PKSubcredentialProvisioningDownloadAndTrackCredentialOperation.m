@interface PKSubcredentialProvisioningDownloadAndTrackCredentialOperation
- (PKSubcredentialProvisioningDownloadAndTrackCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4;
- (void)performOperation;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation PKSubcredentialProvisioningDownloadAndTrackCredentialOperation

- (PKSubcredentialProvisioningDownloadAndTrackCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKSubcredentialProvisioningDownloadAndTrackCredentialOperation;
  v11 = [(PKSubcredentialProvisioningPairingSessionOperation *)&v23 initWithConfiguration:v8 context:v9 delegate:v10];
  if (!v11) {
    goto LABEL_4;
  }
  v12 = [[PKSubcredentialProvisioningDownloadPassOperation alloc] initWithConfiguration:v8 context:v9 delegate:v10];
  downloadOperation = v11->_downloadOperation;
  v11->_downloadOperation = v12;

  if (!v11->_downloadOperation)
  {
    v17 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      v20 = "Unable to create download operation in %@!";
LABEL_9:
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    }
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }
  v14 = [[PKSubcredentialProvisioningTrackCredentialOperation alloc] initWithConfiguration:v8 context:v9 delegate:v10];
  trackOperation = v11->_trackOperation;
  v11->_trackOperation = v14;

  if (!v11->_trackOperation)
  {
    v17 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      v20 = "Unable to create track operation in %@!";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v16 = v11;
LABEL_11:

  return v16;
}

- (void)performOperation
{
  v22.receiver = self;
  v22.super_class = (Class)PKSubcredentialProvisioningDownloadAndTrackCredentialOperation;
  [(PKSubcredentialProvisioningOperation *)&v22 performOperation];
  objc_initWeak(&location, self);
  v3 = [(PKSubcredentialProvisioningOperation *)self context];
  v4 = [v3 operationQueue];

  v5 = dispatch_group_create();
  v6 = v5;
  if (self->_downloadOperation)
  {
    dispatch_group_enter(v5);
    downloadOperation = self->_downloadOperation;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke;
    v17[3] = &unk_1E56DEBE8;
    id v18 = v4;
    objc_copyWeak(&v20, &location);
    v19 = v6;
    [(PKSubcredentialProvisioningDownloadPassOperation *)downloadOperation performOperationWithCompletion:v17];

    objc_destroyWeak(&v20);
  }
  if (self->_trackOperation)
  {
    dispatch_group_enter(v6);
    trackOperation = self->_trackOperation;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_5;
    v13[3] = &unk_1E56DEBE8;
    id v14 = v4;
    objc_copyWeak(&v16, &location);
    v15 = v6;
    [(PKSubcredentialProvisioningTrackCredentialOperation *)trackOperation performOperationWithCompletion:v13];

    objc_destroyWeak(&v16);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_7;
  block[3] = &unk_1E56E4508;
  id v11 = v4;
  id v9 = v4;
  objc_copyWeak(&v12, &location);
  dispatch_group_notify(v6, v9, block);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2;
  block[3] = &unk_1E56E15D0;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    int v10 = 138412290;
    uint64_t v11 = v2;
    id v5 = "Download operation completed with an error: %@";
    v6 = v3;
    uint32_t v7 = 12;
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    LOWORD(v10) = 0;
    id v5 = "Download operation completed successfully";
    v6 = v3;
    uint32_t v7 = 2;
  }
  _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
LABEL_7:

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2_6;
  block[3] = &unk_1E56E15D0;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    int v10 = 138412290;
    uint64_t v11 = v2;
    id v5 = "Track operation completed with an error: %@";
    v6 = v3;
    uint32_t v7 = 12;
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    LOWORD(v10) = 0;
    id v5 = "Track operation completed successfully";
    v6 = v3;
    uint32_t v7 = 2;
  }
  _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
LABEL_7:

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_7(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2_8;
  block[3] = &unk_1E56DD818;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __82__PKSubcredentialProvisioningDownloadAndTrackCredentialOperation_performOperation__block_invoke_2_8(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (WeakRetained[7] || WeakRetained[8])
    {
      objc_msgSend(WeakRetained, "failWithError:");
    }
    else
    {
      uint64_t v2 = [WeakRetained[5] context];
      id v3 = [v2 downloadedPass];

      BOOL v4 = [v5 context];
      [v4 setDownloadedPass:v3];

      [v5 advanceToState:12];
    }
    WeakRetained = v5;
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackOperationError, 0);
  objc_storeStrong((id *)&self->_downloadOperationError, 0);
  objc_storeStrong((id *)&self->_trackOperation, 0);
  objc_storeStrong((id *)&self->_downloadOperation, 0);
}

@end