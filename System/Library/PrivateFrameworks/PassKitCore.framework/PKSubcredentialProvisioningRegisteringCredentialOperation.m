@interface PKSubcredentialProvisioningRegisteringCredentialOperation
- (BOOL)canBeRestarted;
- (BOOL)credentialShouldHaveAttestation;
- (PKSubcredentialProvisioningRegisteringCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)performOperation;
- (void)performOperationForFriendConfiguration;
- (void)performOperationWithSession:(id)a3;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation PKSubcredentialProvisioningRegisteringCredentialOperation

- (PKSubcredentialProvisioningRegisteringCredentialOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKSubcredentialProvisioningRegisteringCredentialOperation;
  v10 = [(PKSubcredentialProvisioningOperation *)&v20 initWithConfiguration:v9 context:a4 delegate:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_3;
  }
  v12 = [(PKSubcredentialProvisioningOperation *)v10 context];
  uint64_t v13 = [v12 addedCredential];
  subcredential = v11->_subcredential;
  v11->_subcredential = (PKAppletSubcredential *)v13;

  objc_storeStrong((id *)&v11->_configuration, a3);
  if (!v11->_subcredential)
  {
    v16 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Missing subcredential in %@!", buf, 0xCu);
    }
    v15 = 0;
  }
  else
  {
LABEL_3:
    v15 = v11;
  }

  return v15;
}

- (BOOL)canBeRestarted
{
  return 1;
}

- (void)performOperation
{
  v3.receiver = self;
  v3.super_class = (Class)PKSubcredentialProvisioningRegisteringCredentialOperation;
  [(PKSubcredentialProvisioningOperation *)&v3 performOperation];
  if ([(PKSubcredentialProvisioningConfiguration *)self->_configuration configurationType] == 1) {
    [(PKSubcredentialProvisioningRegisteringCredentialOperation *)self performOperationForFriendConfiguration];
  }
  else {
    [(PKSubcredentialProvisioningRegisteringCredentialOperation *)self performOperationWithSession:0];
  }
}

- (void)performOperationForFriendConfiguration
{
  objc_super v3 = [(PKSubcredentialProvisioningOperation *)self configuration];
  v4 = [v3 acceptInvitationConfiguration];

  v5 = [v4 session];
  uint64_t v6 = [v5 state];
  switch(v6)
  {
    case 0:
      if ([v5 startSession]) {
        break;
      }
      v7 = @"Unable to start session";
LABEL_8:
      [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:v7];
      break;
    case 3:
      v7 = @"Session was invalidated";
      goto LABEL_8;
    case 2:
      [(PKSubcredentialProvisioningRegisteringCredentialOperation *)self performOperationWithSession:v5];
      break;
    default:
      v8 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v9, 2u);
      }

      break;
  }
}

- (void)performOperationWithSession:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PKSubcredentialProvisioningRegisteringCredentialOperation *)self credentialShouldHaveAttestation];
  uint64_t v6 = [(PKSubcredentialProvisioningOperation *)self context];
  v7 = [v6 registrationData];

  if (v5)
  {
    if (v7) {
      goto LABEL_10;
    }
    v8 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    subcredential = self->_subcredential;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = subcredential;
    v10 = "Credential %@ is missing attestation";
    goto LABEL_8;
  }
  if (!v7) {
    goto LABEL_10;
  }
  v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_subcredential;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    v10 = "Unexpected credential %@ with attestation";
LABEL_8:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&buf, 0xCu);
  }
LABEL_9:

LABEL_10:
  v12 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__24;
  v64 = __Block_byref_object_dispose__24;
  id v65 = 0;
  int64_t v13 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration configurationType];
  BOOL v14 = v13 != 0;
  if (v13)
  {
    if (v7)
    {
      BOOL v14 = 0;
      uint64_t v15 = 2;
      goto LABEL_23;
    }
    if (v13 != 1)
    {
      BOOL v14 = 0;
      uint64_t v15 = 1;
LABEL_23:
      v21 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v57 = 134217984;
        *(void *)&v57[4] = v15;
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Registration type is %ld", v57, 0xCu);
      }

      *(void *)v57 = 0;
      *(void *)&v57[8] = v57;
      *(void *)&v57[16] = 0x3032000000;
      v58 = __Block_byref_object_copy__24;
      v59 = __Block_byref_object_dispose__24;
      id v60 = 0;
      if (v14)
      {
        if (!v4)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v47 = 0;
            _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Session is nil", v47, 2u);
          }

          [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:7 description:@"Session is nil"];
          goto LABEL_29;
        }
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke;
        v53[3] = &unk_1E56E3958;
        v53[4] = self;
        id v54 = v4;
        v55 = v57;
        p_long long buf = &buf;
        [(PKAsyncUnaryOperationComposer *)v12 addOperation:v53];
      }
      *(void *)v47 = 0;
      v48 = v47;
      uint64_t v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__24;
      v51 = __Block_byref_object_dispose__24;
      id v52 = 0;
      v22 = [(PKSubcredentialProvisioningOperation *)self configuration];
      uint64_t v23 = [v22 localDeviceConfiguration];

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_33;
      v39[3] = &unk_1E56E39A8;
      v43 = v57;
      uint64_t v46 = v15;
      id v24 = v23;
      id v40 = v24;
      v41 = self;
      id v42 = v7;
      v44 = v47;
      v45 = &buf;
      [(PKAsyncUnaryOperationComposer *)v12 addOperation:v39];
      v25 = [(PKSubcredentialProvisioningOperation *)self context];
      v26 = [v25 operationQueue];

      objc_initWeak(&location, self);
      v27 = [MEMORY[0x1E4F1CA98] null];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_39;
      v31[3] = &unk_1E56E39F8;
      id v28 = v26;
      id v32 = v28;
      objc_copyWeak(v36, &location);
      v33 = v47;
      v34 = &buf;
      BOOL v37 = v7 != 0;
      v36[1] = (id)v15;
      v35 = v57;
      id v29 = [(PKAsyncUnaryOperationComposer *)v12 evaluateWithInput:v27 completion:v31];

      objc_destroyWeak(v36);
      objc_destroyWeak(&location);

      _Block_object_dispose(v47, 8);
LABEL_29:
      _Block_object_dispose(v57, 8);

      goto LABEL_30;
    }
    v19 = [(PKSubcredentialProvisioningOperation *)self configuration];
    v16 = [v19 acceptInvitationConfiguration];

    v18 = [v16 invitation];
    if (v18)
    {
      uint64_t v15 = 0;
      goto LABEL_18;
    }
    v30 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v57 = 138412290;
      *(void *)&v57[4] = v16;
      _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Invitation for configuration (%@) is nil", v57, 0xCu);
    }

    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:7 description:@"Invitation is nil"];
  }
  else
  {
    v16 = [(PKAppletSubcredential *)self->_subcredential brandIdentifier];
    v17 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration ownerConfiguration];
    v18 = [v17 issuerIdentifier];

    if ([v16 isEqualToString:v18])
    {
      uint64_t v15 = 2;
LABEL_18:

      goto LABEL_23;
    }
    objc_super v20 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v57 = 138412546;
      *(void *)&v57[4] = v16;
      *(_WORD *)&v57[12] = 2112;
      *(void *)&v57[14] = v18;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Credential brand: %@ does not match requested issuerIdentifier: %@", v57, 0x16u);
    }

    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:25 description:@"Credential brand doesn't match issuerIdentifier"];
  }
LABEL_30:
  _Block_object_dispose(&buf, 8);
}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [*(id *)(*(void *)(a1 + 32) + 40) identifier];
  id v9 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Fetching pretrack request for key identifier: %@", buf, 0xCu);
  }

  v10 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_27;
  v13[3] = &unk_1E56E3930;
  long long v16 = *(_OWORD *)(a1 + 48);
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [v10 getPretrackRequestForKeyWithIdentifier:v8 withCompletion:v13];
}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_27(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  if (PKSharingForceErrorAfterKMLReturnsPreTrackRequest())
  {
    v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterKMLReturnsPreTrackRequest enabled", (uint8_t *)&v22, 2u);
    }

    uint64_t v18 = PKSubcredentialProvisioningError(@"Forcing error", v11, v12, v13, v14, v15, v16, v17, v22);
    uint64_t v19 = *(void *)(a1[7] + 8);
    objc_super v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 40)) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = *(void *)(*(void *)(a1[6] + 8) + 40) == 0;
  }
  (*(void (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], v21);
}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) || *(void *)(a1 + 80))
  {
    v10 = [*(id *)(a1 + 32) webService];
    switch(*(void *)(a1 + 80))
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        uint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Missing Register Credential Request Type", buf, 2u);
        }

        v9[2](v9, v8, 1);
        goto LABEL_13;
      case 0:
        uint64_t v13 = [PKPaymentRegisterPreTrackCredentialRequest alloc];
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 40);
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v16 = [*(id *)(a1 + 32) registrationMetadata];
        uint64_t v17 = [(PKPaymentRegisterPreTrackCredentialRequest *)v13 initWithCredential:v14 encryptedVehicleDataRequest:v15 metadata:v16];
        goto LABEL_11;
      case 1:
        uint64_t v18 = [PKPaymentRegisterPreTrackCredentialRequest alloc];
        uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 40);
        uint64_t v16 = [*(id *)(a1 + 32) registrationMetadata];
        uint64_t v17 = [(PKPaymentRegisterPreTrackCredentialRequest *)v18 initWithCredential:v19 metadata:v16];
        goto LABEL_11;
      case 2:
        objc_super v20 = [PKPaymentRegisterTrackCredentialRequest alloc];
        uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 40);
        uint64_t v22 = *(void *)(a1 + 48);
        uint64_t v16 = [*(id *)(a1 + 32) registrationMetadata];
        uint64_t v17 = [(PKPaymentRegisterTrackCredentialRequest *)v20 initWithCredential:v21 registrationData:v22 metadata:v16];
LABEL_11:
        uint64_t v12 = (void *)v17;

        break;
      default:
        uint64_t v12 = 0;
        break;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_36;
    v24[3] = &unk_1E56E3980;
    long long v27 = *(_OWORD *)(a1 + 64);
    v26 = v9;
    id v25 = v8;
    [v10 registerCredentialWithRequest:v12 withCompletion:v24];

LABEL_13:
  }
  else
  {
    uint64_t v23 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "Missing required pre-track request", buf, 2u);
    }

    v9[2](v9, v8, 1);
  }
}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_36(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  if (PKSharingForceErrorAfterBrokerReturnsRegisterCredentialResponse())
  {
    v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKSharingForceErrorAfterBrokerReturnsRegisterCredentialResponse enabled", (uint8_t *)&v22, 2u);
    }

    uint64_t v18 = PKSubcredentialProvisioningError(@"Forcing error", v11, v12, v13, v14, v15, v16, v17, v22);
    uint64_t v19 = *(void *)(a1[7] + 8);
    objc_super v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 40)) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = *(void *)(*(void *)(a1[6] + 8) + 40) == 0;
  }
  (*(void (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], v21);
}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_39(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_2;
  block[3] = &unk_1E56E39D0;
  objc_copyWeak(v14, (id *)(a1 + 64));
  long long v12 = *(_OWORD *)(a1 + 40);
  id v11 = v5;
  uint64_t v7 = *(void **)(a1 + 72);
  char v15 = *(unsigned char *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 56);
  v14[1] = v7;
  uint64_t v13 = v8;
  id v9 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(v14);
}

void __89__PKSubcredentialProvisioningRegisteringCredentialOperation_performOperationWithSession___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_8;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && ([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    objc_super v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) passURL];
    if (PKSharingForceNilPassURLInPreTrackResponse())
    {
      id v4 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKSharingForceNilPassURLInPreTrackResponse enabled", v11, 2u);
      }

      if (*(void *)(a1 + 72) <= 1uLL)
      {

        objc_super v3 = 0;
      }
    }
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) credentialAttestation];
    id v6 = (void *)v5;
    if (v3)
    {
      if (!*(unsigned char *)(a1 + 80) || v5)
      {
        uint64_t v8 = [WeakRetained context];
        [v8 setPassURL:v3];
        [v8 setTrackingAttestation:v6];
        id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) vehicleMobilizationEncryptedContainer];
        [v8 setVehicleMobilizationEncryptedContainer:v9];

        if (v6) {
          uint64_t v10 = 11;
        }
        else {
          uint64_t v10 = 10;
        }
        [WeakRetained advanceToState:v10];

        goto LABEL_25;
      }
      uint64_t v7 = @"Missing attestation in register response!";
    }
    else
    {
      uint64_t v7 = @"Missing pass url!";
    }
    [WeakRetained failWithErrorCode:7 description:v7];
LABEL_25:

    goto LABEL_8;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) || *(void *)(a1 + 72)) {
    [WeakRetained failWithErrorCode:7 description:@"Credential registration request failed" underlyingError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  else {
    [WeakRetained failWithErrorCode:1 description:@"KML did not return a pretrack request when one was required"];
  }
LABEL_8:
}

- (BOOL)credentialShouldHaveAttestation
{
  v2 = [(PKSubcredentialProvisioningOperation *)self configuration];
  objc_super v3 = [v2 acceptInvitationConfiguration];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(PKSubcredentialProvisioningOperation *)self isInProgress])
  {
    if (a4 == 2)
    {
      [(PKSubcredentialProvisioningRegisteringCredentialOperation *)self performOperationWithSession:v6];
    }
    else if (a4 == 3)
    {
      [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:@"Session was invalidated unexpectedly"];
    }
  }
  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2048;
      unint64_t v11 = a4;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Session %@ state did change but we're not in progress: %lu", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end