@interface PKSubcredentialProvisioningTrackCredentialOperation
- (PKSubcredentialProvisioningTrackCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4;
- (void)performOperation;
- (void)performOperationWithCompletion:(id)a3;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)trackCredentialWithAttestation;
@end

@implementation PKSubcredentialProvisioningTrackCredentialOperation

- (PKSubcredentialProvisioningTrackCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKSubcredentialProvisioningTrackCredentialOperation;
  v9 = [(PKSubcredentialProvisioningPairingSessionOperation *)&v21 initWithConfiguration:a3 context:v8 delegate:a5];
  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = [v8 trackingAttestation];
  trackingAttestation = v9->_trackingAttestation;
  v9->_trackingAttestation = (NSData *)v10;

  if (!v9->_trackingAttestation)
  {
    v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      v18 = "Missing tracking attestation in %@!";
LABEL_9:
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = [v8 addedCredential];
  subcredential = v9->_subcredential;
  v9->_subcredential = (PKAppletSubcredential *)v12;

  if (!v9->_subcredential)
  {
    v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      v18 = "Missing subcredential in %@!";
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
  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialProvisioningTrackCredentialOperation;
  [(PKSubcredentialProvisioningOperation *)&v6 performOperation];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__PKSubcredentialProvisioningTrackCredentialOperation_performOperation__block_invoke;
  v3[3] = &unk_1E56E15F8;
  objc_copyWeak(&v4, &location);
  [(PKSubcredentialProvisioningTrackCredentialOperation *)self performOperationWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __71__PKSubcredentialProvisioningTrackCredentialOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (v5) {
    [WeakRetained failWithError:v5];
  }
  else {
    [WeakRetained advanceToState:16];
  }
}

- (void)performOperationWithCompletion:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  if (!self->_performingOperation)
  {
    self->_performingOperation = 1;
    objc_super v6 = [(PKSubcredentialProvisioningPairingSessionOperation *)self pairingSession];
    uint64_t v7 = [v6 state];
    id v8 = _Block_copy(v5);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v8;

    if (v7 == 3)
    {
      uint64_t v10 = (void (**)(id, void *))self->_completionHandler;
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F28228];
        v18[0] = @"Session was invalidated";
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
        v13 = [v11 errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:v12];
        v10[2](v10, v13);

        id v14 = self->_completionHandler;
      }
      else
      {
        id v14 = 0;
      }
      self->_id completionHandler = 0;
    }
    else if (v7 == 2)
    {
      [(PKSubcredentialProvisioningTrackCredentialOperation *)self trackCredentialWithAttestation];
    }
    else
    {
      v15 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v16, 2u);
      }
    }
    goto LABEL_14;
  }
  if (v4)
  {
    objc_super v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
    ((void (**)(void, void *))v5)[2](v5, v6);
LABEL_14:
  }
}

- (void)trackCredentialWithAttestation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(PKSubcredentialProvisioningOperation *)self context];
  id v4 = [(PKSubcredentialProvisioningPairingSessionOperation *)self pairingSession];
  subcredential = self->_subcredential;
  objc_super v6 = [v3 vehicleMobilizationEncryptedContainer];
  uint64_t v7 = [v4 trackSubcredential:subcredential encryptedContainer:v6 withReceipt:self->_trackingAttestation];

  if (v7)
  {
    id v8 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_subcredential;
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      __int16 v20 = 2112;
      objc_super v21 = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Pairing session failed to track credential %@: %@", buf, 0x16u);
    }

    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    if (completionHandler)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      v16[0] = *MEMORY[0x1E4F28228];
      v16[1] = v12;
      v17[0] = @"Failed to track the credential";
      v17[1] = v7;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      id v14 = [v11 errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:9 userInfo:v13];
      completionHandler[2](completionHandler, v14);

      id v15 = self->_completionHandler;
    }
    else
    {
      id v15 = 0;
    }
    self->_id completionHandler = 0;
  }
  else
  {
    self->_hasTrackedCredential = 1;
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_performingOperation)
  {
    if (a4 == 2)
    {
      [(PKSubcredentialProvisioningTrackCredentialOperation *)self trackCredentialWithAttestation];
    }
    else if (a4 == 3 && !self->_firstTransactionCompleted)
    {
      id completionHandler = (void (**)(id, void *))self->_completionHandler;
      if (completionHandler)
      {
        id v8 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F28228];
        v13[0] = @"Session was invalidated unexpectedly";
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        uint64_t v10 = [v8 errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:v9];
        completionHandler[2](completionHandler, v10);

        id v11 = self->_completionHandler;
      }
      else
      {
        id v11 = 0;
      }
      self->_id completionHandler = 0;
    }
  }
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (PKAppletSubcredential *)a4;
  self->_firstTransactionCompleted = 1;
  if (self->_hasTrackedCredential)
  {
    id v8 = PKLogFacilityTypeGetObject(0x16uLL);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v9) {
        goto LABEL_11;
      }
      int v16 = 138412290;
      uint64_t v17 = v7;
      uint64_t v10 = "First transaction failed with error: %@";
    }
    else
    {
      if (!v9) {
        goto LABEL_11;
      }
      subcredential = self->_subcredential;
      int v16 = 138412290;
      uint64_t v17 = subcredential;
      uint64_t v10 = "First transaction completed with credential %@";
    }
    id v11 = v8;
    uint32_t v12 = 12;
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v16) = 0;
    uint64_t v10 = "First transaction completed without tracking the credential";
    id v11 = v8;
    uint32_t v12 = 2;
  }
  _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
LABEL_11:

  [v6 endSession];
  id completionHandler = (void (**)(id, void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0);
    id v15 = self->_completionHandler;
  }
  else
  {
    id v15 = 0;
  }
  self->_id completionHandler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_trackingAttestation, 0);
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end