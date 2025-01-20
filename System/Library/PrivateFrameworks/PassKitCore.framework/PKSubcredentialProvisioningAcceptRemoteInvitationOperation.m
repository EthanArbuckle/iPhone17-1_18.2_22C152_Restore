@interface PKSubcredentialProvisioningAcceptRemoteInvitationOperation
+ (BOOL)canDeviceAcceptInvitation:(id)a3;
- (PKSubcredentialProvisioningAcceptRemoteInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)_handleAcceptInviteResponseWithPass:(id)a3 error:(id)a4;
- (void)acceptCrossPlatformInvitation;
- (void)acceptIDSInvitation;
- (void)acceptInvitation:(id)a3 withMetadata:(id)a4;
- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4;
- (void)getMatchingInvitation:(id)a3 withCompletion:(id)a4;
- (void)metadataForInvitation:(id)a3 withCompletion:(id)a4;
- (void)performOperation;
@end

@implementation PKSubcredentialProvisioningAcceptRemoteInvitationOperation

+ (BOOL)canDeviceAcceptInvitation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v6 = NSStringFromSelector(sel_paymentWebService_canAcceptInvitation_withCompletionV2_);
    int v9 = 138412290;
    v10 = v6;
LABEL_18:
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Device doesn't support %@", (uint8_t *)&v9, 0xCu);
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v6 = NSStringFromSelector(sel_deviceIDSIdentifier);
    int v9 = 138412290;
    v10 = v6;
    goto LABEL_18;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(sel_paymentWebService_acceptSubcredentialInvitationWithIdentifier_metadata_completion_);
      v7 = NSStringFromSelector(sel_paymentWebService_acceptSubcredentialInvitation_completion_);
      int v9 = 138412546;
      v10 = v6;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Device doesn't support %@ or %@", (uint8_t *)&v9, 0x16u);

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v6 = NSStringFromSelector(sel_paymentWebService_matchingInvitationOnDevice_withTimeout_completion_);
    int v9 = 138412290;
    v10 = v6;
    goto LABEL_18;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(sel_paymentWebService_subcredentialInvitationsWithCompletion_);
      int v9 = 138412290;
      v10 = v6;
      goto LABEL_18;
    }
LABEL_20:

    BOOL v4 = 0;
    goto LABEL_21;
  }
  BOOL v4 = 1;
LABEL_21:

  return v4;
}

- (PKSubcredentialProvisioningAcceptRemoteInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PKSubcredentialProvisioningAcceptRemoteInvitationOperation;
  v10 = [(PKSubcredentialProvisioningOperation *)&v27 initWithConfiguration:v8 context:v9 delegate:a5];
  if (!v10) {
    goto LABEL_10;
  }
  __int16 v11 = [v8 remoteDeviceInvitation];
  uint64_t v12 = [v11 localDeviceWebService];
  localDeviceWebService = v10->_localDeviceWebService;
  v10->_localDeviceWebService = (PKPaymentWebService *)v12;

  uint64_t v14 = [v11 remoteDeviceWebService];
  remoteDeviceWebService = v10->_remoteDeviceWebService;
  v10->_remoteDeviceWebService = (PKPaymentWebService *)v14;

  uint64_t v16 = [(PKPaymentWebService *)v10->_remoteDeviceWebService targetDevice];
  remoteTargetDevice = v10->_remoteTargetDevice;
  v10->_remoteTargetDevice = (PKPaymentWebServiceTargetDeviceProtocol *)v16;

  uint64_t v18 = [(PKPaymentWebService *)v10->_localDeviceWebService targetDevice];
  localTargetDevice = v10->_localTargetDevice;
  v10->_localTargetDevice = (PKPaymentWebServiceTargetDeviceProtocol *)v18;

  v20 = [v9 sentInvitation];
  v21 = v20;
  if (!v20)
  {
    v21 = [v11 invitation];
  }
  objc_storeStrong((id *)&v10->_invitation, v21);
  if (!v20) {

  }
  if (!v10->_invitation)
  {
    v23 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)v26 = 0;
    v24 = "No invitation to accept";
LABEL_17:
    _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, v24, v26, 2u);
    goto LABEL_18;
  }
  if (!v10->_localTargetDevice)
  {
    v23 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)v26 = 0;
    v24 = "Missing local target device";
    goto LABEL_17;
  }
  if (!v10->_remoteTargetDevice)
  {
    v23 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v24 = "No remote target device to accept invitation on";
      goto LABEL_17;
    }
LABEL_18:

    v22 = 0;
    goto LABEL_19;
  }

LABEL_10:
  v22 = v10;
LABEL_19:

  return v22;
}

- (void)performOperation
{
  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialProvisioningAcceptRemoteInvitationOperation;
  [(PKSubcredentialProvisioningOperation *)&v4 performOperation];
  if ([(id)objc_opt_class() canDeviceAcceptInvitation:self->_remoteTargetDevice])
  {
    unint64_t v3 = [(PKAppletSubcredentialSharingInvitation *)self->_invitation type];
    if (v3 == 1)
    {
      [(PKSubcredentialProvisioningAcceptRemoteInvitationOperation *)self acceptCrossPlatformInvitation];
    }
    else if (!v3)
    {
      [(PKSubcredentialProvisioningAcceptRemoteInvitationOperation *)self acceptIDSInvitation];
    }
  }
  else
  {
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:21 description:@"Remote device not supported"];
  }
}

- (void)acceptIDSInvitation
{
  unint64_t v3 = [(PKSubcredentialProvisioningOperation *)self context];
  objc_super v4 = [v3 operationQueue];

  objc_initWeak(&location, self);
  invitation = self->_invitation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke;
  v7[3] = &unk_1E56D9410;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(PKSubcredentialProvisioningAcceptRemoteInvitationOperation *)self canAcceptInvitation:invitation withCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v3)
    {
LABEL_8:
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_27;
      v12[3] = &unk_1E56D93E8;
      objc_copyWeak(&v14, (id *)(a1 + 48));
      id v13 = *(id *)(a1 + 40);
      [WeakRetained metadataForInvitation:v9 withCompletion:v12];

      objc_destroyWeak(&v14);
      goto LABEL_13;
    }
    v5 = [v3 domain];
    if ([v5 isEqualToString:@"PKSubcredentialProvisioningErrorDomain"])
    {
      uint64_t v6 = [v3 code];

      if (v6 == 15)
      {
        v7 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 72);
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v8;
          _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "The remote device supports accepting invitations like %@, but no matching invite was found. We'll try to wait for a matching invite to arrive.", buf, 0xCu);
        }

        goto LABEL_8;
      }
    }
    else
    {
    }
    v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 72);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Remote device does not support accepting invitation: %@. Error: %@", buf, 0x16u);
    }

    [WeakRetained failWithError:v3];
  }
LABEL_13:
}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v6 = WeakRetained[9];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_2;
      v7[3] = &unk_1E56D93C0;
      objc_copyWeak(&v10, (id *)(a1 + 40));
      id v8 = v3;
      id v9 = *(id *)(a1 + 32);
      [v5 getMatchingInvitation:v6 withCompletion:v7];

      objc_destroyWeak(&v10);
    }
    else
    {
      [WeakRetained failWithErrorCode:12 description:@"Unable to get metadata for invitation"];
    }
  }
}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_2(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5 = PKLogFacilityTypeGetObject(0x16uLL);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Found matching invitation already on device: %@", buf, 0xCu);
      }

      [WeakRetained acceptInvitation:v3 withMetadata:a1[4]];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "No invitation found on device, waiting to see if one comes in", buf, 2u);
      }

      v7 = (void *)WeakRetained[7];
      uint64_t v8 = WeakRetained[5];
      uint64_t v9 = WeakRetained[9];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_28;
      v10[3] = &unk_1E56D9398;
      id v11 = a1[5];
      objc_copyWeak(&v13, a1 + 6);
      id v12 = a1[4];
      [v7 paymentWebService:v8 matchingInvitationOnDevice:v9 withTimeout:60 completion:v10];

      objc_destroyWeak(&v13);
    }
  }
}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_2_29;
  v10[3] = &unk_1E56D9370;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v13 = *(id *)(a1 + 40);
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __81__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptIDSInvitation__block_invoke_2_29(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained acceptInvitation:*(void *)(a1 + 32) withMetadata:*(void *)(a1 + 48)];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained failWithErrorCode:15 description:@"No matching invitation found"];
  }
}

- (void)acceptCrossPlatformInvitation
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__0;
  v17[4] = __Block_byref_object_dispose__0;
  id v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__0;
  v15[4] = __Block_byref_object_dispose__0;
  id v16 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke;
  v14[3] = &unk_1E56D9460;
  v14[4] = self;
  v14[5] = v15;
  v14[6] = v17;
  [(PKAsyncUnaryOperationComposer *)v3 addOperation:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_43;
  v12[3] = &unk_1E56D94B0;
  objc_copyWeak(&v13, &location);
  void v12[4] = v15;
  v12[5] = v17;
  [(PKAsyncUnaryOperationComposer *)v3 addOperation:v12];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__0;
  void v10[4] = __Block_byref_object_dispose__0;
  id v11 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_3;
  v8[3] = &unk_1E56D94B0;
  objc_copyWeak(&v9, &location);
  v8[4] = v10;
  v8[5] = v17;
  [(PKAsyncUnaryOperationComposer *)v3 addOperation:v8];
  objc_super v4 = [MEMORY[0x1E4F1CA98] null];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_5;
  v6[3] = &unk_1E56D9500;
  v6[4] = v17;
  objc_copyWeak(&v7, &location);
  v6[5] = v10;
  id v5 = [(PKAsyncUnaryOperationComposer *)v3 evaluateWithInput:v4 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  _Block_object_dispose(v10, 8);

  objc_destroyWeak(&v13);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(v17, 8);
  objc_destroyWeak(&location);
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 64);
  uint64_t v10 = *(void *)(v8 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2;
  v13[3] = &unk_1E56D9438;
  long long v16 = *(_OWORD *)(a1 + 40);
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [v9 paymentWebService:v10 accountAttestationAnonymizationSaltWithCompletion:v13];
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      __int16 v17 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Missing anonymization salt: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  uint64_t v13 = *(void *)(a1[7] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v7;
  id v15 = v7;

  (*(void (**)(void))(a1[5] + 16))();
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_43(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = (void *)WeakRetained[7];
    uint64_t v11 = WeakRetained[5];
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2_44;
    v13[3] = &unk_1E56D9488;
    uint64_t v16 = *(void *)(a1 + 40);
    id v15 = v7;
    id v14 = v6;
    [v10 paymentWebService:v11 setAccountAttestationAnonymizationSalt:v12 withCompletion:v13];
  }
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2_44(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40) != 0);
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[7];
    uint64_t v5 = v3[5];
    uint64_t v6 = v3[9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_4;
    v7[3] = &unk_1E56D94D8;
    long long v8 = *(_OWORD *)(a1 + 32);
    [v4 paymentWebService:v5 acceptSubcredentialInvitation:v6 completion:v7];
  }
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __91__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptCrossPlatformInvitation__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v8)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to accept cross platform invitation with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleAcceptInviteResponseWithPass:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(PKSubcredentialProvisioningOperation *)self context];
    uint64_t v9 = [v8 operationQueue];

    uint64_t v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Checking whether remote device can accept invitation: %@", buf, 0xCu);
    }

    remoteTargetDevice = self->_remoteTargetDevice;
    remoteDeviceWebService = self->_remoteDeviceWebService;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_canAcceptInvitation_withCompletion___block_invoke;
    v14[3] = &unk_1E56D9528;
    id v15 = v9;
    id v16 = v7;
    id v13 = v9;
    [(PKPaymentWebServiceTargetDeviceProtocol *)remoteTargetDevice paymentWebService:remoteDeviceWebService canAcceptInvitation:v6 withCompletionV2:v14];
  }
}

void __97__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_canAcceptInvitation_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_canAcceptInvitation_withCompletion___block_invoke_2;
  v7[3] = &unk_1E56D83D8;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __97__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_canAcceptInvitation_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getMatchingInvitation:(id)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(PKSubcredentialProvisioningOperation *)self context];
    id v9 = [v8 operationQueue];

    uint64_t v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Examining invitations already on device for one matching: %@", buf, 0xCu);
    }

    remoteTargetDevice = self->_remoteTargetDevice;
    remoteDeviceWebService = self->_remoteDeviceWebService;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_getMatchingInvitation_withCompletion___block_invoke;
    v14[3] = &unk_1E56D9038;
    id v15 = v9;
    id v16 = self;
    id v17 = v7;
    id v13 = v9;
    [(PKPaymentWebServiceTargetDeviceProtocol *)remoteTargetDevice paymentWebService:remoteDeviceWebService subcredentialInvitationsWithCompletion:v14];
  }
}

void __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_getMatchingInvitation_withCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_getMatchingInvitation_withCompletion___block_invoke_2;
  block[3] = &unk_1E56D89F0;
  id v5 = a1[4];
  uint64_t v4 = a1[5];
  id v6 = (void *)a1[6];
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_getMatchingInvitation_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = (id)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "isSameInvitationAsInvitation:", v6, (void)v7))
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)metadataForInvitation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v8 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Creating invitation metadata...", buf, 2u);
    }

    long long v9 = [(PKSubcredentialProvisioningOperation *)self context];
    long long v10 = [v9 operationQueue];

    id v11 = objc_alloc_init(PKAppletSubcredentialSharingInvitationMetadata);
    uint64_t v12 = [(PKSubcredentialProvisioningOperation *)self configuration];
    id v13 = [v12 remoteDeviceInvitation];
    -[PKAppletSubcredentialSharingInvitationMetadata setShouldRequestInvitation:](v11, "setShouldRequestInvitation:", [v13 canRequestInvitation]);

    localTargetDevice = self->_localTargetDevice;
    localDeviceWebService = self->_localDeviceWebService;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_metadataForInvitation_withCompletion___block_invoke;
    v18[3] = &unk_1E56D9550;
    id v19 = v10;
    uint64_t v20 = v11;
    id v21 = v7;
    id v16 = v11;
    id v17 = v10;
    [(PKPaymentWebServiceTargetDeviceProtocol *)localTargetDevice paymentWebService:localDeviceWebService accountAttestationAnonymizationSaltWithCompletion:v18];
  }
}

void __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_metadataForInvitation_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_metadataForInvitation_withCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8BA8;
  id v11 = v5;
  id v12 = v6;
  id v7 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

uint64_t __99__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_metadataForInvitation_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    uint64_t v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Got anonymization salt", (uint8_t *)&v6, 2u);
    }

    [*(id *)(a1 + 48) setAnonymizationSalt:*(void *)(a1 + 32)];
  }
  else
  {
    id v2 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Missing anonymization salt: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)acceptInvitation:(id)a3 withMetadata:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Accepting invitation: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  remoteTargetDevice = self->_remoteTargetDevice;
  remoteDeviceWebService = self->_remoteDeviceWebService;
  id v11 = [v6 identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptInvitation_withMetadata___block_invoke;
  v12[3] = &unk_1E56D9578;
  objc_copyWeak(&v13, (id *)buf);
  [(PKPaymentWebServiceTargetDeviceProtocol *)remoteTargetDevice paymentWebService:remoteDeviceWebService acceptSubcredentialInvitationWithIdentifier:v11 metadata:v7 completion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __92__PKSubcredentialProvisioningAcceptRemoteInvitationOperation_acceptInvitation_withMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleAcceptInviteResponseWithPass:v6 error:v5];
}

- (void)_handleAcceptInviteResponseWithPass:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKSubcredentialProvisioningOperation *)self context];
  id v9 = [v8 operationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKSubcredentialProvisioningAcceptRemoteInvitationOperation__handleAcceptInviteResponseWithPass_error___block_invoke;
  block[3] = &unk_1E56D8AB8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __104__PKSubcredentialProvisioningAcceptRemoteInvitationOperation__handleAcceptInviteResponseWithPass_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) context];
  [v2 setHasAcceptedInvitation:1];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v4 uniqueID];
      int v15 = 138412290;
      uint64_t v16 = v13;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Invitation accepted successfully adding pass %@", (uint8_t *)&v15, 0xCu);
    }
    id v14 = [*(id *)(a1 + 32) delegate];
    [v14 operation:*(void *)(a1 + 32) addedPass:*(void *)(a1 + 40)];

    return [*(id *)(a1 + 32) advanceToState:16];
  }
  else
  {
    id v6 = [v3 domain];
    int v7 = [v6 isEqualToString:@"PKSubcredentialProvisioningErrorDomain"];

    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    if (v7)
    {
      uint64_t v10 = *(void *)(a1 + 48);
      return [v8 failWithError:v10];
    }
    else
    {
      return [v8 failWithErrorCode:16 description:@"Failed to accept invitation" underlyingError:v9];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_localTargetDevice, 0);
  objc_storeStrong((id *)&self->_remoteTargetDevice, 0);
  objc_storeStrong((id *)&self->_localDeviceWebService, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
}

@end