@interface PKSubcredentialProvisioningAcceptInvitationOperation
- (void)_handleShareAcceptResultCredential:(id)a3 pass:(id)a4 error:(id)a5;
- (void)acceptCrossPlatformInvitation;
- (void)acceptIDSInvitation;
- (void)performOperation;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation PKSubcredentialProvisioningAcceptInvitationOperation

- (void)performOperation
{
  v12.receiver = self;
  v12.super_class = (Class)PKSubcredentialProvisioningAcceptInvitationOperation;
  [(PKSubcredentialProvisioningOperation *)&v12 performOperation];
  v3 = [(PKSubcredentialProvisioningOperation *)self configuration];
  v4 = [v3 acceptInvitationConfiguration];

  v5 = [v4 invitation];
  uint64_t v6 = [v5 type];
  if (v6 == 1)
  {
    [(PKSubcredentialProvisioningAcceptInvitationOperation *)self acceptCrossPlatformInvitation];
  }
  else if (!v6)
  {
    v7 = [(PKSubcredentialProvisioningSharingSessionOperation *)self sharingSession];
    uint64_t v8 = [v7 state];
    if (v8)
    {
      if (v8 != 3)
      {
        if (v8 == 2)
        {
          [(PKSubcredentialProvisioningAcceptInvitationOperation *)self acceptIDSInvitation];
        }
        else
        {
          v10 = PKLogFacilityTypeGetObject(0x16uLL);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v11, 2u);
          }
        }
        goto LABEL_15;
      }
      v9 = @"Session was invalidated";
    }
    else
    {
      if ([v7 startSession])
      {
LABEL_15:

        goto LABEL_16;
      }
      v9 = @"Unable to start session";
    }
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:v9];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)acceptIDSInvitation
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [(PKSubcredentialProvisioningOperation *)self configuration];
  v4 = [v3 acceptInvitationConfiguration];

  v5 = [v4 session];
  uint64_t v6 = [v4 invitation];
  v7 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Accepting IDS invitation: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_initWeak(&location, self);
  uint64_t v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__75;
  v46 = __Block_byref_object_dispose__75;
  id v47 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__75;
  v40[4] = __Block_byref_object_dispose__75;
  id v41 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke;
  v35[3] = &unk_1E56E3958;
  id v9 = v5;
  id v36 = v9;
  id v10 = v6;
  id v37 = v10;
  v38 = v40;
  p_long long buf = &buf;
  [(PKAsyncUnaryOperationComposer *)v8 addOperation:v35];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__75;
  v33[4] = __Block_byref_object_dispose__75;
  id v34 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_22;
  v27[3] = &unk_1E56F3370;
  v30 = v40;
  id v11 = v10;
  id v28 = v11;
  id v12 = v4;
  id v29 = v12;
  v31 = &buf;
  v32 = v33;
  [(PKAsyncUnaryOperationComposer *)v8 addOperation:v27];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__75;
  v25[4] = __Block_byref_object_dispose__75;
  id v26 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_27;
  v19[3] = &unk_1E56F3370;
  id v13 = v9;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  v22 = v33;
  v23 = v25;
  v24 = &buf;
  [(PKAsyncUnaryOperationComposer *)v8 addOperation:v19];
  v15 = [MEMORY[0x1E4F1CA98] null];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_31;
  v17[3] = &unk_1E56D9500;
  v17[4] = &buf;
  objc_copyWeak(&v18, &location);
  v17[5] = v25;
  id v16 = [(PKAsyncUnaryOperationComposer *)v8 evaluateWithInput:v15 completion:v17];

  objc_destroyWeak(&v18);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&location);
}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Fetching PPID request from KML", buf, 2u);
  }

  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) identifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_16;
  v13[3] = &unk_1E56E3930;
  long long v16 = *(_OWORD *)(a1 + 48);
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [v9 getProductPlanIdentifierRequestForInvitationWithIdentifier:v10 fromMailboxIdentifier:0 completion:v13];
}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_16(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  if (PKSharingForceErrorAfterKMLReturnsPPIDRequest())
  {
    id v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterKMLReturnsPPIDRequest enabled", (uint8_t *)&v21, 2u);
    }

    uint64_t v18 = PKSubcredentialProvisioningError(@"Forcing error", v11, v12, v13, v14, v15, v16, v17, v21);
    uint64_t v19 = *(void *)(a1[7] + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
  (*(void (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[7] + 8) + 40) != 0);
}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_22(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Fetching PPID from broker", buf, 2u);
    }

    uint64_t v13 = [[PKPaymentVehicleManufacturerRequest alloc] initWithInvitation:*(void *)(a1 + 32) encryptedVehicleDataRequest:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v14 = [*(id *)(a1 + 40) webService];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_24;
    v15[3] = &unk_1E56F3320;
    long long v18 = *(_OWORD *)(a1 + 56);
    id v17 = v9;
    id v16 = v8;
    [v14 vehicleManufacturerWithRequest:v13 withCompletion:v15];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "No PPID request; skipping PPID fetch.", buf, 2u);
    }

    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_24(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (PKSharingForceErrorAfterBrokerReturnsVehicleManufacturerResponse())
  {
    id v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterBrokerReturnsVehicleManufacturerResponse enabled", v30, 2u);
    }

    uint64_t v15 = PKSubcredentialProvisioningError(@"Forcing error", v8, v9, v10, v11, v12, v13, v14, *(uint64_t *)v30);
    uint64_t v16 = *(void *)(a1[6] + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
  uint64_t v18 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (!v5 || v18)
  {
    id v28 = PKLogFacilityTypeGetObject(0x16uLL);
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v29)
      {
        *(_DWORD *)v30 = 138412290;
        *(void *)&v30[4] = v18;
        _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Failed to fetch PPID from broker: %@", v30, 0xCu);
      }
    }
    else if (v29)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Broker returned empty PPID", v30, 2u);
    }

    v27 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    uint64_t v19 = [PKSubcredentialEncryptedContainer alloc];
    id v20 = [v5 encryptionScheme];
    uint64_t v21 = [v5 ephemeralPublicKey];
    v22 = [v5 publicKeyHash];
    v23 = [v5 encryptedData];
    uint64_t v24 = [(PKSubcredentialEncryptedContainer *)v19 initWithEncryptionScheme:v20 ephemeralPublicKey:v21 publicKeyHash:v22 data:v23];
    uint64_t v25 = *(void *)(a1[7] + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    v27 = *(void (**)(void))(a1[5] + 16);
  }
  v27();
}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_27(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Accepting share", buf, 2u);
  }

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_28;
  v14[3] = &unk_1E56F3348;
  long long v17 = *(_OWORD *)(a1 + 56);
  id v15 = v6;
  id v16 = v7;
  id v12 = v6;
  id v13 = v7;
  [v9 acceptSharingInvitation:v10 encryptedProductPlanIdentifierContainer:v11 completion:v14];
}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_28(void *a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  if (PKSharingForceErrorAfterKMLAcceptShare())
  {
    id v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterKMLAcceptShare enabled", buf, 2u);
    }

    uint64_t v13 = PKSubcredentialProvisioningError(@"Forcing error", v6, v7, v8, v9, v10, v11, v12, v18);
    uint64_t v14 = *(void *)(a1[7] + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_6;
  }
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
LABEL_6:
    id v16 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_7;
  }
  long long v17 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "KML accept share failed with missing credential", (uint8_t *)&v18, 2u);
  }

  id v16 = *(void (**)(void))(a1[5] + 16);
LABEL_7:
  v16();
}

void __75__PKSubcredentialProvisioningAcceptInvitationOperation_acceptIDSInvitation__block_invoke_31(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) || ([v6 isCanceled] & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v9 = WeakRetained;
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v11 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v9 = WeakRetained;
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [WeakRetained _handleShareAcceptResultCredential:v11 pass:0 error:v10];
}

- (void)acceptCrossPlatformInvitation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PKSubcredentialProvisioningOperation *)self configuration];
  id v4 = [v3 acceptInvitationConfiguration];

  id v5 = [v4 invitation];
  id v6 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v18 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Accepting cross platform invitation: %@", buf, 0xCu);
  }

  uint64_t v7 = [v4 webService];
  uint64_t v8 = [v7 targetDevice];
  objc_initWeak((id *)buf, self);
  uint64_t v9 = [v5 originalInvitationMessage];
  uint64_t v10 = [v5 activationCode];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__PKSubcredentialProvisioningAcceptInvitationOperation_acceptCrossPlatformInvitation__block_invoke;
  v13[3] = &unk_1E56F33C0;
  id v11 = v8;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  objc_copyWeak(&v16, (id *)buf);
  [v11 acceptCarKeyShareForMessage:v9 activationCode:v10 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __85__PKSubcredentialProvisioningAcceptInvitationOperation_acceptCrossPlatformInvitation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 passUniqueIdentifier];
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) paymentWebService:*(void *)(a1 + 40) passWithUniqueID:v7];
    uint64_t v9 = [v8 secureElementPass];
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v10 = PKTargetDeviceSupportsExpress(*(void **)(a1 + 32));
  if (v9 && v10)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [v9 paymentPass];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__PKSubcredentialProvisioningAcceptInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2;
    v19[3] = &unk_1E56F3398;
    id v20 = v9;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    id v21 = v5;
    id v22 = v6;
    [v11 paymentWebService:v12 handlePotentialExpressPass:v13 withCompletionHandler:v19];

    objc_destroyWeak(&v23);
    id WeakRetained = v20;
  }
  else
  {
    if ((v10 & 1) == 0)
    {
      id v15 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v9 uniqueID];
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = v17;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Newly provisioned pass (%@) was not set as express as target device (%@) does not support express.", buf, 0x16u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v18 = [v5 subcredential];
    [WeakRetained _handleShareAcceptResultCredential:v18 pass:v9 error:v6];
  }
}

void __85__PKSubcredentialProvisioningAcceptInvitationOperation_acceptCrossPlatformInvitation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    uint64_t v7 = [v5 uniqueID];
    uint64_t v8 = [v6 count];

    uint64_t v9 = "";
    if (!v8) {
      uint64_t v9 = "not ";
    }
    int v12 = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 2080;
    id v15 = v9;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Newly provisioned pass (%@) was %sset as express", (uint8_t *)&v12, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = [*(id *)(a1 + 40) subcredential];
  [WeakRetained _handleShareAcceptResultCredential:v11 pass:*(void *)(a1 + 32) error:*(void *)(a1 + 48)];
}

- (void)_handleShareAcceptResultCredential:(id)a3 pass:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PKSubcredentialProvisioningOperation *)self context];
  int v12 = [v11 operationQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__PKSubcredentialProvisioningAcceptInvitationOperation__handleShareAcceptResultCredential_pass_error___block_invoke;
  v16[3] = &unk_1E56DB988;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v20 = self;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

void __102__PKSubcredentialProvisioningAcceptInvitationOperation__handleShareAcceptResultCredential_pass_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) uniqueID];
    uint64_t v5 = *(void *)(a1 + 48);
    int v19 = 138412802;
    uint64_t v20 = v3;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Invitation was accepted: %@ pass: %@, %@", (uint8_t *)&v19, 0x20u);
  }
  id v6 = [*(id *)(a1 + 56) configuration];
  uint64_t v7 = [v6 acceptInvitationConfiguration];

  id v8 = [v7 invitation];
  id v9 = [*(id *)(a1 + 56) context];
  [v9 setHasAcceptedInvitation:1];

  id v10 = *(void **)(a1 + 56);
  if (*(void *)(a1 + 32))
  {
    id v11 = [v10 context];
    [v11 setAddedCredential:*(void *)(a1 + 32)];

    int v12 = [*(id *)(a1 + 56) delegate];
    [v12 operation:*(void *)(a1 + 56) addedCredential:*(void *)(a1 + 32)];

    if (*(void *)(a1 + 40))
    {
      id v13 = [*(id *)(a1 + 56) delegate];
      uint64_t v14 = *(void *)(a1 + 56);
      id v15 = [*(id *)(a1 + 40) paymentPass];
      [v13 operation:v14 addedPass:v15];
    }
    uint64_t v16 = [v7 webService];
    id v17 = [v16 targetDevice];
    [v17 paymentWebService:v16 removeSharingInvitation:v8 withCompletion:0];

    if (*(void *)(a1 + 40)) {
      uint64_t v18 = 16;
    }
    else {
      uint64_t v18 = 9;
    }
    [*(id *)(a1 + 56) advanceToState:v18];
  }
  else
  {
    [v10 failWithErrorCode:16 description:@"Invitation didn't produce a credential" underlyingError:*(void *)(a1 + 48)];
  }
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
      goto LABEL_7;
    }
    [(PKSubcredentialProvisioningAcceptInvitationOperation *)self acceptIDSInvitation];
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_7;
    }
    id v8 = v6;
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:@"Session was invalidated unexpectedly"];
  }
  id v6 = v8;
LABEL_7:
}

@end