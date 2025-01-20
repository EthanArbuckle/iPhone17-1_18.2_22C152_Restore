@interface PKSubcredentialProvisioningSendInvitationOperation
- (PKSubcredentialProvisioningSendInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (id)userAuthDelegate;
- (void)canAcceptInvitationWithCompletion:(id)a3;
- (void)initializeAccountAttestationIfNecessaryWithCompletion:(id)a3;
- (void)performOperation;
- (void)sendInvitation;
- (void)sendInvitationWithAuth:(id)a3 completion:(id)a4;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation PKSubcredentialProvisioningSendInvitationOperation

- (PKSubcredentialProvisioningSendInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKSubcredentialProvisioningSendInvitationOperation;
  v9 = [(PKSubcredentialProvisioningSharingSessionOperation *)&v26 initWithConfiguration:v8 context:a4 delegate:a5];
  if (!v9) {
    goto LABEL_9;
  }
  v10 = [v8 remoteDeviceConfiguration];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 sharingRequest];
    sharingRequest = v9->_sharingRequest;
    v9->_sharingRequest = (PKAppletSubcredentialSharingRequest *)v12;

    uint64_t v14 = [v11 invitation];
    invitation = v9->_invitation;
    v9->_invitation = (PKAppletSubcredentialSharingInvitation *)v14;

    uint64_t v16 = [(PKAppletSubcredentialSharingRequest *)v9->_sharingRequest credential];
    credential = v9->_credential;
    v9->_credential = (PKAppletSubcredential *)v16;

    uint64_t v18 = [v11 localDeviceWebService];
    localDeviceWebService = v9->_localDeviceWebService;
    v9->_localDeviceWebService = (PKPaymentWebService *)v18;

    uint64_t v20 = [v11 remoteDeviceWebService];
    remoteDeviceWebService = v9->_remoteDeviceWebService;
    v9->_remoteDeviceWebService = (PKPaymentWebService *)v20;
  }
  if (v9->_sharingRequest && v9->_invitation && v9->_credential && v9->_remoteDeviceWebService)
  {

LABEL_9:
    v22 = v9;
    goto LABEL_13;
  }
  v23 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "No sharing request, invitation, credential, or webservice to use!", v25, 2u);
  }

  v22 = 0;
LABEL_13:

  return v22;
}

- (void)performOperation
{
  v8.receiver = self;
  v8.super_class = (Class)PKSubcredentialProvisioningSendInvitationOperation;
  [(PKSubcredentialProvisioningOperation *)&v8 performOperation];
  v3 = [(PKPaymentWebService *)self->_remoteDeviceWebService targetDevice];
  if (+[PKSubcredentialProvisioningAcceptRemoteInvitationOperation canDeviceAcceptInvitation:v3])
  {
    v4 = [(PKSubcredentialProvisioningSharingSessionOperation *)self sharingSession];
    uint64_t v5 = [v4 state];
    if (v5 == 3)
    {
      [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:@"Session was invalidated"];
    }
    else if (v5 == 2)
    {
      [(PKSubcredentialProvisioningSendInvitationOperation *)self sendInvitation];
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v7, 2u);
      }
    }
  }
  else
  {
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:21 description:@"Remote device can't accept invitations"];
  }
}

- (void)sendInvitation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v3 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    invitation = self->_invitation;
    *(_DWORD *)buf = 138412290;
    v9 = invitation;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Checking if device can accept invitation: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke;
  v5[3] = &unk_1E56E15F8;
  objc_copyWeak(&v6, &location);
  [(PKSubcredentialProvisioningSendInvitationOperation *)self canAcceptInvitationWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      [WeakRetained failWithError:v3];
    }
    else
    {
      v7 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Device can accept the invitation", buf, 2u);
      }

      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_18;
      v8[3] = &unk_1E56E15F8;
      objc_copyWeak(&v9, v4);
      [v6 initializeAccountAttestationIfNecessaryWithCompletion:v8];
      objc_destroyWeak(&v9);
    }
  }
}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      [WeakRetained failWithErrorCode:5 description:@"Unable to set account attestation"];
    }
    else
    {
      v7 = [WeakRetained userAuthDelegate];
      if (v7)
      {
        objc_super v8 = [v6 context];
        id v9 = [v8 operationQueue];

        uint64_t v10 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Requesting auth to send invitation", buf, 2u);
        }

        v11 = [v6 configuration];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_25;
        v13[3] = &unk_1E56F5110;
        id v12 = v9;
        id v14 = v12;
        objc_copyWeak(&v15, v4);
        [v7 subcredentialProvisioningConfiguration:v11 requestUserAuthWithCompletion:v13];

        objc_destroyWeak(&v15);
      }
      else
      {
        [v6 failWithErrorCode:0 description:@"No auth delegate"];
      }
    }
  }
}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_25(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(NSObject **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_2;
  v14[3] = &unk_1E56F4018;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v16 = v8;
  id v17 = v9;
  id v15 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v18);
}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
    {
      id v6 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Got user auth for sharing", buf, 2u);
      }

      uint64_t v7 = *(void *)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_26;
      v8[3] = &unk_1E56F50E8;
      objc_copyWeak(&v10, v2);
      id v9 = *(id *)(a1 + 48);
      [WeakRetained sendInvitationWithAuth:v7 completion:v8];

      objc_destroyWeak(&v10);
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 48);
      if (v4) {
        (*(void (**)(void))(v4 + 16))();
      }
      [WeakRetained failWithErrorCode:22 description:@"Unable to get auth" underlyingError:*(void *)(a1 + 40)];
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __68__PKSubcredentialProvisioningSendInvitationOperation_sendInvitation__block_invoke_26(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (v5) {
    [WeakRetained failWithError:v5];
  }
  else {
    [WeakRetained advanceToState:15];
  }
}

- (void)canAcceptInvitationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PKPaymentWebService *)self->_remoteDeviceWebService targetDevice];
    if (v5)
    {
      id v6 = [(PKAppletSubcredentialSharingInvitation *)self->_invitation addCarKeyPassConfiguration];
      remoteDeviceWebService = self->_remoteDeviceWebService;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke;
      v9[3] = &unk_1E56E2520;
      id v12 = v4;
      id v10 = v5;
      id v11 = self;
      [v10 paymentWebService:remoteDeviceWebService canAddSecureElementPassWithConfiguration:v6 completion:v9];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
      (*((void (**)(id, void *))v4 + 2))(v4, v8);
    }
  }
}

void __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E56D8388;
  id v15 = *(id *)(a1 + 48);
  id v6 = _Block_copy(aBlock);
  uint64_t v7 = v6;
  if (a2)
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(v8 + 72);
      uint64_t v11 = *(void *)(v8 + 48);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke_3;
      v12[3] = &unk_1E56D8388;
      id v13 = v7;
      [v9 paymentWebService:v10 canAcceptInvitation:v11 withCompletionV2:v12];
    }
  }
  else
  {
    (*((void (**)(void *, id))v6 + 2))(v6, v5);
  }
}

void __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    char v6 = [v5 isEqualToString:@"PKSubcredentialProvisioningErrorDomain"];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F28A50];
      v11[0] = *MEMORY[0x1E4F28228];
      v11[1] = v8;
      v12[0] = @"Device can't accept invite";
      v12[1] = v4;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
      uint64_t v10 = [v7 errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:v9];

      id v4 = (void *)v10;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__PKSubcredentialProvisioningSendInvitationOperation_canAcceptInvitationWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendInvitationWithAuth:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKPaymentWebService *)self->_localDeviceWebService targetDevice];
  id v9 = [(PKSubcredentialProvisioningSharingSessionOperation *)self sharingSession];
  uint64_t v10 = [(PKSubcredentialProvisioningOperation *)self context];
  uint64_t v11 = [v10 operationQueue];

  if (v9)
  {
    id v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      invitation = self->_invitation;
      credential = self->_credential;
      *(_DWORD *)buf = 138412546;
      v22 = invitation;
      __int16 v23 = 2112;
      v24 = credential;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Sending invitation (%@) for credential: %@", buf, 0x16u);
    }

    sharingRequest = self->_sharingRequest;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke;
    v16[3] = &unk_1E56F5160;
    id v17 = v11;
    id v18 = self;
    id v19 = v8;
    id v20 = v7;
    [v9 sendSharingInvitationWithRequest:sharingRequest auth:v6 completion:v16];
  }
  else
  {
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:0 description:@"No sharing session"];
  }
}

void __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_2;
  v11[3] = &unk_1E56D8BF8;
  id v12 = v5;
  id v13 = v6;
  id v7 = *(NSObject **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v8;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v3 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    id v6 = [v2 credentialShares];
    id v7 = [v6 firstObject];

    uint64_t v8 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 48);
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Sent invitation (%@) with new share: %@", buf, 0x16u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = *(void **)(a1 + 56);
    uint64_t v13 = *(void *)(v11 + 64);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(v11 + 56);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_44;
    v20[3] = &unk_1E56F5138;
    id v16 = *(id *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 48);
    id v21 = v16;
    uint64_t v22 = v17;
    id v23 = v7;
    id v24 = *(id *)(a1 + 72);
    id v18 = v7;
    [v12 paymentWebService:v13 addPassShare:v14 onCredential:v15 withCompletion:v20];
  }
  else
  {
    id v4 = PKConvertDAErrorToSubcredentialProvisioningErrorDomain(*(void **)(a1 + 40), @"Failed to send invitation");
    uint64_t v5 = *(void *)(a1 + 72);
    if (v5)
    {
      id v19 = v4;
      (*(void (**)(void))(v5 + 16))();
      id v4 = v19;
    }
  }
}

void __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_44(uint64_t a1, char a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_2_45;
  v5[3] = &unk_1E56D8BD0;
  char v8 = a2;
  BOOL v3 = *(NSObject **)(a1 + 32);
  id v4 = *(void **)(a1 + 48);
  void v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v3, v5);
}

void __88__PKSubcredentialProvisioningSendInvitationOperation_sendInvitationWithAuth_completion___block_invoke_2_45(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 56)) {
      BOOL v3 = "";
    }
    else {
      BOOL v3 = "un";
    }
    int v8 = 136315138;
    uint64_t v9 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Invitation receipt added %ssuccessfully", (uint8_t *)&v8, 0xCu);
  }

  id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v5 = [*(id *)(a1 + 40) identifier];
  [v4 setIdentifier:v5];

  id v6 = [*(id *)(a1 + 32) context];
  [v6 setSentInvitation:v4];

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

- (void)initializeAccountAttestationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(PKPaymentWebService *)self->_localDeviceWebService targetDevice];
  id v6 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Checking if anonymization salt has been set...", buf, 2u);
  }

  localDeviceWebService = self->_localDeviceWebService;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__PKSubcredentialProvisioningSendInvitationOperation_initializeAccountAttestationIfNecessaryWithCompletion___block_invoke;
  v10[3] = &unk_1E56DED00;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  id v9 = v5;
  id v11 = v9;
  [v9 paymentWebService:localDeviceWebService accountAttestationAnonymizationSaltWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __108__PKSubcredentialProvisioningSendInvitationOperation_initializeAccountAttestationIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
        id v9 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v6;
          _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get anonymization salt: %@", buf, 0xCu);
        }
      }
      uint64_t v10 = +[PKAccountAttestationRequest createAnonymizationSalt];

      id v11 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "No salt found, setting default salt", buf, 2u);
      }

      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = WeakRetained[8];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __108__PKSubcredentialProvisioningSendInvitationOperation_initializeAccountAttestationIfNecessaryWithCompletion___block_invoke_54;
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

void __108__PKSubcredentialProvisioningSendInvitationOperation_initializeAccountAttestationIfNecessaryWithCompletion___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      id v6 = "Failed to set default salt: %@";
LABEL_6:
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    int v8 = 138412290;
    id v9 = v7;
    id v6 = "Setting default salt to: %@";
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (id)userAuthDelegate
{
  v2 = [(PKSubcredentialProvisioningOperation *)self configuration];
  id v3 = [v2 remoteDeviceConfiguration];

  if (v3)
  {
    id v4 = [v3 userAuthDelegate];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v8 = v6;
    BOOL v7 = [(PKSubcredentialProvisioningOperation *)self isInProgress];
    id v6 = v8;
    if (!v7) {
      goto LABEL_8;
    }
    [(PKSubcredentialProvisioningSendInvitationOperation *)self sendInvitation];
    goto LABEL_7;
  }
  if (a4 == 3 && !self->_hasFinished)
  {
    id v8 = v6;
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:@"Session was invalidated unexpectedly"];
LABEL_7:
    id v6 = v8;
  }
LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationReceipt, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
  objc_storeStrong((id *)&self->_localDeviceWebService, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_sharingRequest, 0);
}

@end