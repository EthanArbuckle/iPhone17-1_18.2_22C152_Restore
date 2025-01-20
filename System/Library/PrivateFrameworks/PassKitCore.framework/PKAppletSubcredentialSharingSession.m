@interface PKAppletSubcredentialSharingSession
+ (id)createPendingSessionWithDelegate:(id)a3;
+ (id)createSessionWithDelegate:(id)a3;
- (BOOL)cancelSharingInvitationWithIdentifier:(id)a3;
- (BOOL)startSession;
- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 transportChannelIdentifier:(id)a4 activationCode:(id)a5 encryptedProductPlanIdentifierContainer:(id)a6 completion:(id)a7;
- (void)acceptInvitationWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)acceptSharingInvitation:(id)a3 encryptedProductPlanIdentifierContainer:(id)a4 completion:(id)a5;
- (void)accountAttestionRequestForCredential:(id)a3 withCompletion:(id)a4;
- (void)createInviteForShare:(id)a3 forCredential:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)createSilentInviteForSharingSessionIdentifier:(id)a3 completion:(id)a4;
- (void)getPretrackRequestForKeyWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)getProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5;
- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)requestSharingInvitation:(id)a3 from:(id)a4 completion:(id)a5;
- (void)retryActivationCode:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)retryActivationCodeForCredentialIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)retryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)routingInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendSharingInvitation:(id)a3 forInvitationRequest:(id)a4 completion:(id)a5;
- (void)sendSharingInvitationWithRequest:(id)a3 auth:(id)a4 completion:(id)a5;
- (void)setAccountAttestation:(id)a3 forCredential:(id)a4 withCompletion:(id)a5;
- (void)setEncryptedProductPlanIdentifierContainer:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)setTransportChannelIdentifier:(id)a3 forCredential:(id)a4 forCredentialShare:(id)a5 completion:(id)a6;
- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5;
@end

@implementation PKAppletSubcredentialSharingSession

+ (id)createSessionWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [(PKDASession *)[PKAppletSubcredentialSharingSession alloc] initWithDelegate:v3];

  if ([(PKAppletSubcredentialSharingSession *)v4 startSession]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

+ (id)createPendingSessionWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [(PKDASession *)[PKAppletSubcredentialSharingSession alloc] initWithDelegate:v3];

  [(PKDASession *)v4 setState:0];
  return v4;
}

- (BOOL)startSession
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKDASession *)self session];

  if (!v3)
  {
    v5 = [MEMORY[0x1E4F5F4E8] sharedManager];
    v6 = [v5 createSharingSessionWithDelegate:self];

    BOOL v4 = v6 != 0;
    if (v6)
    {
      [(PKDASession *)self setSession:v6];
      v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        v13 = self;
        v8 = "Starting sharing session: %p";
        v9 = v7;
        uint32_t v10 = 12;
LABEL_8:
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      v7 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        v8 = "Failed to create sharing session!";
        v9 = v7;
        uint32_t v10 = 2;
        goto LABEL_8;
      }
    }

    return v4;
  }
  return 0;
}

- (void)sendSharingInvitationWithRequest:(id)a3 auth:(id)a4 completion:(id)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint32_t v10 = (void (**)(id, void, void *))a5;
  if ([(PKDASession *)self state] == 2)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = [v8 invitations];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      id v31 = v8;
LABEL_4:
      id v16 = v9;
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v36 + 1) + 8 * v17);
        if (!objc_msgSend(v18, "canBeSent", v31)) {
          break;
        }
        uint64_t v19 = [v18 sharingConfigurationRepresentation];
        if (!v19) {
          break;
        }
        v20 = (void *)v19;
        [v11 addObject:v19];

        if (v14 == ++v17)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
          id v9 = v16;
          id v8 = v31;
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      v28 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v18;
        _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Failed to create sharing configuration from invitation: %@", buf, 0xCu);
      }

      id v9 = v16;
      if (v10)
      {
        v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = *MEMORY[0x1E4F28228];
        v41 = @"Unable to create invitaiton config";
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        v30 = [v29 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v25];
        v10[2](v10, 0, v30);

        id v8 = v31;
        goto LABEL_20;
      }
      id v8 = v31;
    }
    else
    {
LABEL_11:

      v21 = [v8 credential];
      v22 = [v21 identifier];

      v23 = [(PKDASession *)self session];
      v24 = [v8 recipientIdentifier];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __88__PKAppletSubcredentialSharingSession_sendSharingInvitationWithRequest_auth_completion___block_invoke;
      v32[3] = &unk_1E56EF1D0;
      id v33 = v8;
      id v34 = v22;
      v35 = v10;
      id v12 = v22;
      [v23 sendSharingInvitationForKeyIdentifier:v12 toIdsIdentifier:v24 auth:v9 config:v11 completionHandler:v32];

      v25 = v33;
LABEL_20:
    }
    goto LABEL_22;
  }
  v26 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for send invitation operation", buf, 2u);
  }

  if (v10)
  {
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    v46[0] = @"Session not active";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    id v12 = [v27 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v11];
    v10[2](v10, 0, v12);
LABEL_22:
  }
}

void __88__PKAppletSubcredentialSharingSession_sendSharingInvitationWithRequest_auth_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  id v8 = 0;
  if (!v6 && v7)
  {
    id v8 = objc_alloc_init(PKPassShare);
    [(PKPassShare *)v8 setStatus:2];
    id v9 = [*(id *)(a1 + 32) recipientName];
    [(PKPassShare *)v8 setRecipientNickname:v9];

    uint32_t v10 = [*(id *)(a1 + 32) recipientIdentifier];
    [(PKPassShare *)v8 setRecipientHandle:v10];

    id v11 = [v5 firstObject];
    id v12 = [v11 sharingSessionIdentifier];
    uint64_t v13 = [v12 UUIDString];
    [(PKPassShare *)v8 setIdentifier:v13];

    [(PKPassShare *)v8 setSubcredentialIdentifier:*(void *)(a1 + 40)];
    [(PKPassShare *)v8 setManageability:1];
    uint64_t v14 = [*(id *)(a1 + 32) entitlement];
    uint64_t v15 = [v14 value];
    uint64_t v16 = [v15 unsignedIntegerValue];

    v29 = [[PKPassSharedEntitlement alloc] initWithCarKeyEntitlementValue:v16];
    v38[0] = v29;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    [(PKPassShare *)v8 setSharedEntitlements:v17];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v30 = v5;
    id v18 = v5;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(PKPassShare **)(*((void *)&v31 + 1) + 8 * i);
          v24 = [[PKPassCredentialShare alloc] initWithInvitationData:v23];
          if (v24)
          {
            v25 = [*(id *)(a1 + 32) recipientIdentifier];
            [(PKPassCredentialShare *)v24 setChannelTransportIdentifier:v25];

            if ([*(id *)(a1 + 32) isForLocalDevice]) {
              [(PKPassCredentialShare *)v24 setTargetDevice:4];
            }
            [(PKPassShare *)v8 addCredentialShare:v24];
          }
          else
          {
            v26 = PKLogFacilityTypeGetObject(0x16uLL);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v36 = v23;
              _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Failed to create receipt from invitation data: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v20);
    }

    v27 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v36 = v8;
      _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Creating share: %@", buf, 0xCu);
    }

    id v6 = 0;
    id v5 = v30;
  }
  uint64_t v28 = *(void *)(a1 + 48);
  if (v28) {
    (*(void (**)(uint64_t, PKPassShare *, id))(v28 + 16))(v28, v8, v6);
  }
}

- (void)sendSharingInvitation:(id)a3 forInvitationRequest:(id)a4 completion:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(PKDASession *)self state];
  id v12 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 == 2)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Sending silent share for invitation: %@", buf, 0xCu);
    }

    uint64_t v14 = [v9 credentialIdentifier];
    uint64_t v15 = [v8 sharingConfigurationRepresentation];
    uint64_t v16 = [(PKDASession *)self session];
    uint64_t v17 = [v9 sharingSessionIdentifier];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__PKAppletSubcredentialSharingSession_sendSharingInvitation_forInvitationRequest_completion___block_invoke;
    v19[3] = &unk_1E56EF1F8;
    id v20 = v10;
    [v16 sendSilentSharingInvitationWithKeyIdentifier:v14 config:v15 groupIdentifier:v17 completionHandler:v19];

    goto LABEL_9;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for send invitation operation", buf, 2u);
  }

  if (v10)
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = @"Session not active";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v15 = [v18 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v14];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
LABEL_9:
  }
}

void __93__PKAppletSubcredentialSharingSession_sendSharingInvitation_forInvitationRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = 0;
  if (v8 && !v5)
  {
    id v6 = objc_alloc_init(PKPassCredentialShare);
    [(PKPassCredentialShare *)v6 setStatus:2];
    [(PKPassCredentialShare *)v6 updateWithInvitationData:v8];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, PKPassCredentialShare *, id))(v7 + 16))(v7, v6, v5);
  }
}

- (BOOL)cancelSharingInvitationWithIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PKDASession *)self state] == 2)
  {
    id v5 = [(PKDASession *)self session];
    id v6 = [v5 cancelSharingInvitation:v4];

    if (!v6)
    {
      BOOL v8 = 1;
      goto LABEL_9;
    }
    uint64_t v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      unint64_t v11 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to cancel sharing invite with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for cancel sharing operation", (uint8_t *)&v10, 2u);
    }
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (void)acceptSharingInvitation:(id)a3 encryptedProductPlanIdentifierContainer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKDASession *)self state] == 2)
  {
    unint64_t v11 = PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v9);
    uint64_t v12 = [v8 identifier];
    BOOL v13 = [(PKDASession *)self session];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __114__PKAppletSubcredentialSharingSession_acceptSharingInvitation_encryptedProductPlanIdentifierContainer_completion___block_invoke;
    v16[3] = &unk_1E56EF220;
    id v17 = v12;
    id v18 = v8;
    id v19 = v10;
    id v14 = v12;
    [v13 acceptSharingInvitationWithIdentifier:v14 passcode:0 productPlanIdentifier:v11 completionHandler:v16];
  }
  else
  {
    uint64_t v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __114__PKAppletSubcredentialSharingSession_acceptSharingInvitation_encryptedProductPlanIdentifierContainer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    unint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Failed to accept sharing invitation (%@) with error: %@", (uint8_t *)&v14, 0x16u);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = [[PKAppletSubcredential alloc] initWithKeyInformation:v5];
    id v9 = [*(id *)(a1 + 40) sharingSessionIdentifier];
    [(PKAppletSubcredential *)v8 setSharingSessionIdentifier:v9];

    id v10 = [*(id *)(a1 + 40) originatorIDSHandle];
    [(PKAppletSubcredential *)v8 setOriginatorIDSHandle:v10];
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, PKAppletSubcredential *))(v13 + 16))(v13, v8);
  }
}

- (void)accountAttestionRequestForCredential:(id)a3 withCompletion:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v8 = [(PKDASession *)self session];
      id v9 = [v6 identifier];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __91__PKAppletSubcredentialSharingSession_accountAttestionRequestForCredential_withCompletion___block_invoke;
      v14[3] = &unk_1E56EF248;
      id v15 = v6;
      id v16 = v7;
      [v8 requestBindingAttestationDataForKeyWithIdentifier:v9 callback:v14];

      id v10 = v15;
    }
    else
    {
      unint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
      }

      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28228];
      v19[0] = @"Session not active";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v13 = [v12 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v10];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
    }
  }
}

void __91__PKAppletSubcredentialSharingSession_accountAttestionRequestForCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 32) identifier];
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      int v14 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get binding attestation request for credential (%@) with error: %@", (uint8_t *)&v11, 0x16u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = [[PKAppletSubcredentialAccountAttestationRequest alloc] initWithRequestData:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setAccountAttestation:(id)a3 forCredential:(id)a4 withCompletion:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  if ([(PKDASession *)self state] != 2)
  {
    int v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
    }

    if (v8)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28228];
      v22[0] = @"Session not active";
      __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int v14 = [v12 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v13];
      v8[2](v8, v14);
    }
  }
  uint64_t v15 = [(PKDASession *)self session];
  id v16 = [v9 identifier];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__PKAppletSubcredentialSharingSession_setAccountAttestation_forCredential_withCompletion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v19 = v8;
  id v17 = v8;
  [v15 setBindingAttestation:v10 forKeyWithIdentifier:v16 callback:v18];
}

uint64_t __90__PKAppletSubcredentialSharingSession_setAccountAttestation_forCredential_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestSharingInvitation:(id)a3 from:(id)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([(PKDASession *)self state] == 2)
  {
    uint64_t v9 = [v7 invitationRequestRepresentation];
    if (v9)
    {
      id v10 = (void *)v9;
      int v11 = [(PKDASession *)self session];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__PKAppletSubcredentialSharingSession_requestSharingInvitation_from_completion___block_invoke;
      v17[3] = &unk_1E56D8388;
      id v18 = v8;
      [v11 requestInviteWithConfig:v10 completionHandler:v17];

      uint64_t v12 = v18;
    }
    else
    {
      if (!v8)
      {
        id v10 = 0;
        goto LABEL_11;
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28228];
      uint64_t v21 = @"Unable to create request from invitation";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v16 = [v15 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v12];
      (*((void (**)(id, void *))v8 + 2))(v8, v16);

      id v10 = 0;
    }
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  __int16 v13 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
  }

  if (v8)
  {
    int v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = @"Session not active";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    uint64_t v12 = [v14 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v10];
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
    goto LABEL_10;
  }
LABEL_12:
}

void __80__PKAppletSubcredentialSharingSession_requestSharingInvitation_from_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to request invitation with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)routingInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (v10)
  {
    if ([(PKDASession *)self state] == 2)
    {
      int v11 = [(PKDASession *)self session];
      [v11 readerInformationForInvitationWithIdentifier:v8 fromMailboxIdentifier:v9 completionHandler:v10];
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28228];
      v16[0] = @"Session not active";
      __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      int v14 = [v12 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v13];
      v10[2](v10, 0, v14);
    }
  }
}

- (void)getProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([(PKDASession *)self state] == 2)
    {
      int v11 = [(PKDASession *)self session];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __131__PKAppletSubcredentialSharingSession_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke;
      v15[3] = &unk_1E56EF270;
      id v16 = v10;
      [v11 ppidRequestForInvitationWithIdentifier:v8 fromMailboxIdentifier:v9 completionHandler:v15];

      uint64_t v12 = v16;
    }
    else
    {
      __int16 v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28228];
      v18[0] = @"Session not active";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      int v14 = [v13 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v12];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
    }
  }
}

void __131__PKAppletSubcredentialSharingSession_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke(uint64_t a1, PKSubcredentialEncryptedContainer *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v5 = a2;
    a2 = [[PKSubcredentialEncryptedContainer alloc] initWithRequest:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPretrackRequestForKeyWithIdentifier:(id)a3 withCompletion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v8 = [(PKDASession *)self session];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __93__PKAppletSubcredentialSharingSession_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke;
      v12[3] = &unk_1E56EF270;
      id v13 = v7;
      [v8 getPreTrackRequestForKeyWithIdentifier:v6 callback:v12];

      id v9 = v13;
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28228];
      v15[0] = @"Session not active";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      int v11 = [v10 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v9];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

void __93__PKAppletSubcredentialSharingSession_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke(uint64_t a1, PKSubcredentialEncryptedContainer *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v5 = a2;
    a2 = [[PKSubcredentialEncryptedContainer alloc] initWithRequest:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createInviteForShare:(id)a3 forCredential:(id)a4 authorization:(id)a5 completion:(id)a6
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (v13)
  {
    if ([(PKDASession *)self state] != 2)
    {
      uint64_t v22 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for setting transport channel", buf, 2u);
      }

      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28228];
      v59[0] = @"Session not active";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
      uint64_t v15 = [v23 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v14];
      v13[2](v13, 0, v15);
      goto LABEL_34;
    }
    uint64_t v14 = [v10 sharedEntitlements];
    uint64_t v15 = [v14 firstObject];
    if ([v14 count] != 1)
    {
      v24 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Error: Car key shares should only have a single entitlement", buf, 2u);
      }

      v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
      v13[2](v13, 0, v25);
      goto LABEL_33;
    }
    uint64_t v45 = v11;
    uint64_t v41 = [v15 carKeyEntitlementValue];
    id v16 = [v10 activationOptions];
    char v17 = [v16 containsVehicleEnteredPin];
    int v18 = [v16 containsOptionOfType:3];
    if ((v17 & 1) == 0)
    {
      int v26 = v18;
      uint64_t v27 = [v16 activationCode];
      if (v27)
      {
        uint64_t v20 = (void *)v27;
        id v19 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)v56 = v20;
          _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Creating car key share with activation code %{private}@", buf, 0xCu);
          char v39 = 0;
LABEL_21:

          goto LABEL_22;
        }
        char v21 = 0;
LABEL_20:
        char v39 = v21;
        goto LABEL_21;
      }
      if (!v26)
      {
        char v39 = 0;
        uint64_t v20 = 0;
LABEL_22:
        uint64_t v40 = v20;
        uint64_t v28 = [v15 recipientCapabilityRole];

        if (v28)
        {
          v29 = [v15 recipientCapabilityRole];
          unsigned __int16 v30 = [v29 unsignedIntValue];
        }
        else
        {
          unsigned __int16 v30 = PKPassEntitlementCapabilityRoleValueFrom([v15 recipientShareability], objc_msgSend(v15, "recipientVisibility"), objc_msgSend(v15, "recipientManageability"), objc_msgSend(v15, "intraAccountSharingEnabled"));
        }
        v43 = v16;
        id v44 = v12;
        long long v31 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v56 = v30;
          *(_WORD *)&v56[4] = 1024;
          *(_DWORD *)&v56[6] = v30;
          LOWORD(v57[0]) = 2112;
          *(void *)((char *)v57 + 2) = v15;
          _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Created role '0x%04x' / '%hu' from: %@", buf, 0x18u);
        }

        id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v33 = [v10 credentialShares];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __99__PKAppletSubcredentialSharingSession_createInviteForShare_forCredential_authorization_completion___block_invoke;
        v48[3] = &unk_1E56EF298;
        uint64_t v52 = v41;
        id v34 = v10;
        id v49 = v34;
        char v54 = v39;
        id v42 = v40;
        id v50 = v42;
        unsigned __int16 v53 = v30;
        id v35 = v32;
        id v51 = v35;
        [v33 enumerateObjectsUsingBlock:v48];

        if ([v35 count])
        {
          long long v36 = [(PKDASession *)self session];
          id v11 = v45;
          long long v37 = [v45 identifier];
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __99__PKAppletSubcredentialSharingSession_createInviteForShare_forCredential_authorization_completion___block_invoke_42;
          void v46[3] = &unk_1E56D90D8;
          v47 = v13;
          [v36 createSharingInvitationsForKeyIdentifier:v37 friendIdentifier:0 auth:v44 config:v35 completionHandler:v46];

          id v12 = v44;
          long long v38 = v47;
        }
        else
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v56 = v34;
            *(_WORD *)&v56[8] = 2112;
            v57[0] = v45;
            _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Error: Unable to create DAKeySharingConfiguration from %@ for %@", buf, 0x16u);
          }

          long long v38 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
          v13[2](v13, 0, v38);
          id v12 = v44;
          id v11 = v45;
        }
        v25 = v43;

LABEL_33:
LABEL_34:

        goto LABEL_35;
      }
    }
    id v19 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Creating car key share with vehicle authenticated option", buf, 2u);
    }
    uint64_t v20 = 0;
    char v21 = 1;
    goto LABEL_20;
  }
LABEL_35:
}

void __99__PKAppletSubcredentialSharingSession_createInviteForShare_forCredential_authorization_completion___block_invoke(uint64_t a1)
{
  id v3 = objc_alloc(MEMORY[0x1E4F5F4E0]);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = [*(id *)(a1 + 32) recipientNickname];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) recipientHandle];
    v1 = (void *)v7;
    if (v7) {
      id v6 = (__CFString *)v7;
    }
    else {
      id v6 = @"unknown";
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  id v9 = (id)[v3 initWithProfile:v4 displayName:v6 metaData:v8 targetDeviceType:255 enableVehiclePasscode:*(unsigned __int8 *)(a1 + 66) maxRetriesForDevicePasscode:5 deviceEnteredPasscode:*(void *)(a1 + 40) proprietaryEntitlements:0];

  if (!v5) {
  [v9 setKeyRole:*(unsigned __int16 *)(a1 + 64)];
  }
  [*(id *)(a1 + 48) safelyAddObject:v9];
}

uint64_t __99__PKAppletSubcredentialSharingSession_createInviteForShare_forCredential_authorization_completion___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setTransportChannelIdentifier:(id)a3 forCredential:(id)a4 forCredentialShare:(id)a5 completion:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  if (v13)
  {
    if ([(PKDASession *)self state] == 2)
    {
      uint64_t v14 = [(PKDASession *)self session];
      uint64_t v15 = [v11 identifier];
      id v16 = [v12 identifier];
      [v14 setMailboxIdentifier:v10 forOwnerKeyIdentifier:v15 forInvitationIdentifier:v16 completionHandler:v13];
    }
    else
    {
      char v17 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v21 = 0;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for setting transport channel", v21, 2u);
      }

      int v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28228];
      v23[0] = @"Session not active";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      uint64_t v20 = [v18 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v19];
      v13[2](v13, v20);
    }
  }
}

- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v11 = [(PKDASession *)self session];
      [v11 startShareAcceptanceFlowWithInvitation:v8 fromMailboxIdentifier:v9 completionHandler:v10];
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for setting transport channel", v16, 2u);
      }

      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28228];
      v18[0] = @"Session not active";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v15 = [v13 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v14];
      v10[2](v10, v15);
    }
  }
}

- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 transportChannelIdentifier:(id)a4 activationCode:(id)a5 encryptedProductPlanIdentifierContainer:(id)a6 completion:(id)a7
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    if ([(PKDASession *)self state] == 2)
    {
      uint64_t v17 = PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v15);
      if (v17)
      {
        int v18 = (void *)v17;
        id v19 = [(PKDASession *)self session];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __176__PKAppletSubcredentialSharingSession_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke;
        v25[3] = &unk_1E56E0DB0;
        id v26 = v16;
        [v19 acceptCrossPlatformInvitationWithIdentifier:v12 passcode:v14 productPlanIdentifier:v18 completionHandler:v25];

        uint64_t v20 = v26;
      }
      else
      {
        uint64_t v22 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Missing daEncryptedProductPlanIdentifierContainer", buf, 2u);
        }

        uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *MEMORY[0x1E4F28228];
        v29 = @"Missing daEncryptedProductPlanIdentifierContainer";
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v24 = [v23 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v20];
        (*((void (**)(id, void, void, void *))v16 + 2))(v16, 0, 0, v24);

        int v18 = 0;
      }
    }
    else
    {
      char v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28228];
      v31[0] = @"Session not active";
      int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      uint64_t v20 = [v21 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v18];
      (*((void (**)(id, void, void, void *))v16 + 2))(v16, 0, 0, v20);
    }
  }
}

void __176__PKAppletSubcredentialSharingSession_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 genericData];
    uint64_t v5 = [v4 friendKeyIdentifier];

    id v6 = [v9 additionalData];
    uint64_t v7 = [v6 sharingSessionUUID];

    id v8 = [[PKAppletSubcredential alloc] initWithIdentifier:v5];
    [(PKAppletSubcredential *)v8 setSharingSessionIdentifier:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)retryActivationCodeForCredentialIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v11 = [(PKDASession *)self session];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __108__PKAppletSubcredentialSharingSession_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke;
      v15[3] = &unk_1E56D8388;
      id v16 = v10;
      [v11 retryPasscode:v9 forKeyIdentifier:v8 completionHandler:v15];

      id v12 = v16;
    }
    else
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28228];
      v18[0] = @"Session not active";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v14 = [v13 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v12];
      (*((void (**)(id, void *))v10 + 2))(v10, v14);
    }
  }
}

uint64_t __108__PKAppletSubcredentialSharingSession_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acceptInvitationWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (v9)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v10 = [(PKDASession *)self session];
      [v10 acceptInvitationWithIdentifier:v11 passcode:v8 completionHandler:v9];
    }
    else
    {
      v9[2](v9, 0);
    }
  }
}

- (void)retryActivationCode:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (v9)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v10 = [(PKDASession *)self session];
      [v10 retryPasscode:v11 forInvitationIdentifier:v8 completionHandler:v9];
    }
    else
    {
      v9[2](v9, 0);
    }
  }
}

- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (v9)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v10 = [(PKDASession *)self session];
      [v10 handleRecipientMessage:v11 forInvitationIdentifier:v8 completionHandler:v9];
    }
    else
    {
      v9[2](v9, 0);
    }
  }
}

- (void)retryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (v9)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v10 = [(PKDASession *)self session];
      [v10 retryPasscode:v8 forInvitationIdentifier:v11 completionHandler:v9];
    }
    else
    {
      v9[2](v9, 0);
    }
  }
}

- (void)setEncryptedProductPlanIdentifierContainer:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (v9)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v10 = PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v12);
      id v11 = [(PKDASession *)self session];
      [v11 setProductPlanIdentifier:v10 forInvitationIdentifier:v8 completion:v9];
    }
    else
    {
      v9[2](v9, 0);
    }
  }
}

- (void)createSilentInviteForSharingSessionIdentifier:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([(PKDASession *)self state] == 2)
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
      id v8 = [(PKDASession *)self session];
      [v8 createSilentSharingInvitationWithGroupIdentifier:v7 completionHandler:v6];
    }
    else
    {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

@end