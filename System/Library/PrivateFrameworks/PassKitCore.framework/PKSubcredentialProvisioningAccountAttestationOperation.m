@interface PKSubcredentialProvisioningAccountAttestationOperation
- (PKSubcredentialProvisioningAccountAttestationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)_setAccountAttestationWithSession:(id)a3;
- (void)accountAttesatationAnonymizationSaltWithCompletion:(id)a3;
- (void)performOperation;
- (void)performOperationWithSession:(id)a3;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation PKSubcredentialProvisioningAccountAttestationOperation

- (PKSubcredentialProvisioningAccountAttestationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKSubcredentialProvisioningAccountAttestationOperation;
  v10 = [(PKSubcredentialProvisioningSharingSessionOperation *)&v24 initWithConfiguration:v8 context:v9 delegate:a5];
  if (!v10) {
    goto LABEL_8;
  }
  uint64_t v11 = [v9 addedCredential];
  credential = v10->_credential;
  v10->_credential = (PKAppletSubcredential *)v11;

  if (!v10->_credential)
  {
    v13 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Unable to get binding attestation with no credential", buf, 2u);
    }
    goto LABEL_22;
  }
  v13 = [v8 acceptInvitationConfiguration];
  uint64_t v14 = [v13 metadata];
  metadata = v10->_metadata;
  v10->_metadata = (PKAppletSubcredentialSharingInvitationMetadata *)v14;

  uint64_t v16 = [v13 webService];
  webService = v10->_webService;
  v10->_webService = (PKPaymentWebService *)v16;

  v18 = v10->_webService;
  if (!v18)
  {
    v19 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Unable to get binding attestation with no credential", buf, 2u);
    }
    goto LABEL_21;
  }
  v19 = [(PKPaymentWebService *)v18 targetDevice];
  if (!v19)
  {
    v21 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Missing target device", buf, 2u);
    }
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v21 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = NSStringFromSelector(sel_paymentWebService_accountAttestationAnonymizationSaltWithCompletion_);
      *(_DWORD *)buf = 138412290;
      v26 = v22;
LABEL_19:
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Target device doesn't support selector: %@", buf, 0xCu);
    }
LABEL_20:

LABEL_21:
LABEL_22:

    v20 = 0;
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v21 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = NSStringFromSelector(sel_paymentWebService_setAccountAttestationAnonymizationSalt_withCompletion_);
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      goto LABEL_19;
    }
    goto LABEL_20;
  }

LABEL_8:
  v20 = v10;
LABEL_23:

  return v20;
}

- (void)performOperation
{
  v8.receiver = self;
  v8.super_class = (Class)PKSubcredentialProvisioningAccountAttestationOperation;
  [(PKSubcredentialProvisioningOperation *)&v8 performOperation];
  v3 = [(PKSubcredentialProvisioningSharingSessionOperation *)self sharingSession];
  uint64_t v4 = [v3 state];
  switch(v4)
  {
    case 0:
      if ([v3 startSession]) {
        break;
      }
      v5 = @"Unable to start session";
LABEL_8:
      [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:v5];
      break;
    case 3:
      v5 = @"Session was invalidated";
      goto LABEL_8;
    case 2:
      [(PKSubcredentialProvisioningAccountAttestationOperation *)self performOperationWithSession:v3];
      break;
    default:
      v6 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v7, 2u);
      }

      break;
  }
}

- (void)performOperationWithSession:(id)a3
{
  id v4 = a3;
  v5 = [(PKSubcredentialProvisioningOperation *)self configuration];
  v6 = [v5 acceptInvitationConfiguration];

  v7 = [v6 invitation];
  uint64_t v8 = [v7 type];
  if (v8 == 1)
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Skipping binding attestation because this is a cross platform share", v10, 2u);
    }

    self->_operationCompleted = 1;
    [v4 endSession];
  }
  else if (!v8)
  {
    [(PKSubcredentialProvisioningAccountAttestationOperation *)self _setAccountAttestationWithSession:v4];
  }
}

- (void)_setAccountAttestationWithSession:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Getting binding attestation request...", (uint8_t *)buf, 2u);
  }

  v6 = [(PKSubcredentialProvisioningOperation *)self context];
  v7 = [v6 operationQueue];

  objc_initWeak(buf, self);
  credential = self->_credential;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke;
  v11[3] = &unk_1E56DECD8;
  id v9 = v7;
  id v12 = v9;
  objc_copyWeak(&v14, buf);
  id v10 = v4;
  id v13 = v10;
  [v10 accountAttestionRequestForCredential:credential withCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = a1[4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_2;
  block[3] = &unk_1E56DECB0;
  objc_copyWeak(&v15, a1 + 6);
  id v11 = v5;
  id v12 = v6;
  id v13 = a1[4];
  id v14 = a1[5];
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32)) {
      BOOL v5 = *(void *)(a1 + 40) == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Got binding attestation request, getting anonymization salt...", buf, 2u);
      }

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_22;
      v7[3] = &unk_1E56DEC88;
      id v8 = *(id *)(a1 + 48);
      objc_copyWeak(&v11, v2);
      id v9 = *(id *)(a1 + 32);
      id v10 = *(id *)(a1 + 56);
      [v4 accountAttesatationAnonymizationSaltWithCompletion:v7];

      objc_destroyWeak(&v11);
    }
    else
    {
      objc_msgSend(WeakRetained, "failWithErrorCode:description:underlyingError:", 5, @"Failed to get the account attestation request");
    }
  }
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_22(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = a1[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_2_23;
  v10[3] = &unk_1E56DEC60;
  objc_copyWeak(&v16, a1 + 7);
  id v11 = v5;
  id v12 = v6;
  id v13 = a1[5];
  id v14 = a1[4];
  id v15 = a1[6];
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v16);
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_2_23(uint64_t a1)
{
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32)) {
      BOOL v5 = *(void *)(a1 + 40) == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "setAnonymizationSalt:");
      id v6 = [[PKPaymentCredentialAccountAttestationRequest alloc] initWithAttestationRequest:*(void *)(a1 + 48)];
      v7 = (void *)v4[6];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_3;
      v8[3] = &unk_1E56DEC38;
      id v9 = *(id *)(a1 + 56);
      objc_copyWeak(&v11, v2);
      id v10 = *(id *)(a1 + 64);
      [v7 credentialAccountAttesationWithRequest:v6 completion:v8];

      objc_destroyWeak(&v11);
    }
    else
    {
      objc_msgSend(WeakRetained, "failWithErrorCode:description:underlyingError:", 5, @"Failed to get the anonymization salt");
    }
  }
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_4;
  v10[3] = &unk_1E56DEC10;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v11 = v6;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = v3;
    if (*(void *)(a1 + 40)) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Got account attestation, setting the attesation...", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, *(id *)(a1 + 48));
      uint64_t v8 = *(void *)(a1 + 40);
      v7 = *(void **)(a1 + 48);
      uint64_t v9 = WeakRetained[5];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_24;
      v10[3] = &unk_1E56DEBE8;
      void v10[4] = WeakRetained;
      objc_copyWeak(&v12, buf);
      id v11 = 0;
      [v7 setAccountAttestation:v8 forCredential:v9 withCompletion:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
    else
    {
      [WeakRetained failWithErrorCode:5 description:@"Failed to get the account attestation" underlyingError:v3];
    }
  }
}

void __92__PKSubcredentialProvisioningAccountAttestationOperation__setAccountAttestationWithSession___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to set binding attestation. Underlying error: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) failWithErrorCode:5 description:@"Failed to set the account attestation" underlyingError:*(void *)(a1 + 40)];
  }
  else
  {
    if (v5)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Set the account attesation successfully", (uint8_t *)&v7, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained endSession];
  }
}

- (void)accountAttesatationAnonymizationSaltWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  if (v4)
  {
    BOOL v5 = [(PKAppletSubcredentialSharingInvitationMetadata *)self->_metadata anonymizationSalt];
    id v6 = PKLogFacilityTypeGetObject(0x16uLL);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Using salt from metadata: %@", buf, 0xCu);
      }

      v4[2](v4, v5, 0);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Fetching anonymization salt...", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      id v8 = [(PKPaymentWebService *)self->_webService targetDevice];
      webService = self->_webService;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __109__PKSubcredentialProvisioningAccountAttestationOperation_accountAttesatationAnonymizationSaltWithCompletion___block_invoke;
      v11[3] = &unk_1E56DED00;
      objc_copyWeak(&v14, (id *)buf);
      id v13 = v4;
      id v10 = v8;
      id v12 = v10;
      [v10 paymentWebService:webService accountAttestationAnonymizationSaltWithCompletion:v11];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __109__PKSubcredentialProvisioningAccountAttestationOperation_accountAttesatationAnonymizationSaltWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      if (v6)
      {
        uint64_t v9 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v6;
          _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get anonymization salt: %@", buf, 0xCu);
        }
      }
      id v10 = +[PKAccountAttestationRequest createAnonymizationSalt];

      id v11 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "No salt found, setting default salt", buf, 2u);
      }

      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = WeakRetained[6];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __109__PKSubcredentialProvisioningAccountAttestationOperation_accountAttesatationAnonymizationSaltWithCompletion___block_invoke_43;
      v14[3] = &unk_1E56D9528;
      id v5 = v10;
      id v15 = v5;
      id v16 = *(id *)(a1 + 40);
      [v12 paymentWebService:v13 setAccountAttestationAnonymizationSalt:v5 withCompletion:v14];
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v5;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Found already defined anonymization salt: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __109__PKSubcredentialProvisioningAccountAttestationOperation_accountAttesatationAnonymizationSaltWithCompletion___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to set default salt: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Setting default salt to: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  if (a4 == 2)
  {
    id v9 = v6;
    BOOL v8 = [(PKSubcredentialProvisioningOperation *)self isInProgress];
    int v7 = v9;
    if (!v8) {
      goto LABEL_9;
    }
    [(PKSubcredentialProvisioningAccountAttestationOperation *)self performOperationWithSession:v9];
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_9;
    }
    id v9 = v6;
    if (self->_operationCompleted) {
      [(PKSubcredentialProvisioningOperation *)self advanceToState:16];
    }
    else {
      [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:@"Session was invalidated unexpectedly"];
    }
  }
  int v7 = v9;
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end