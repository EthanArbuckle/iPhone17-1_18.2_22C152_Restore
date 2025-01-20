@interface PKSharingMessageExtensionPushProvisioningPresenter
+ (Class)messageClass;
+ (id)propertiesForMessage:(id)a3;
- (PKSharingMessageExtensionMessage)message;
- (PKSharingMessageExtensionPushProvisioningPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4;
- (PKSharingMessageExtensionRenderer)renderer;
- (id)_passInLibraryForMessage;
- (void)_presentIDSAlert;
- (void)didTapMessage;
- (void)extensionWillAppear;
- (void)setMessage:(id)a3;
- (void)setRenderer:(id)a3;
- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5;
@end

@implementation PKSharingMessageExtensionPushProvisioningPresenter

- (PKSharingMessageExtensionPushProvisioningPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingMessageExtensionPushProvisioningPresenter;
  v9 = [(PKSharingMessageExtensionPushProvisioningPresenter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong((id *)&v10->_passLibrary, a4);
  }

  return v10;
}

+ (Class)messageClass
{
  return (Class)objc_opt_class();
}

- (PKSharingMessageExtensionMessage)message
{
  return (PKSharingMessageExtensionMessage *)self->_message;
}

- (void)setMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_message, a3);
  }
}

- (void)extensionWillAppear
{
  v3 = -[PKSharingMessageExtensionPushProvisioningPresenter _passInLibraryForMessage]((uint64_t)self);
  v4 = [(PKShareableCredentialMessage *)self->_message shareableCredentials];
  id v5 = v4;
  if (v3)
  {
    v6 = [v4 firstObject];
    [v6 setStatus:2];

    [(PKShareableCredentialMessage *)self->_message setShareableCredentials:v5];
    [(PKShareableCredentialMessage *)self->_message setIsPassInLibrary:1];
  }
  else
  {
    [(PKShareableCredentialMessage *)self->_message setIsPassInLibrary:0];
    if (![(PKShareableCredentialMessage *)self->_message isPending])
    {
      targetDevice = self->_targetDevice;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __73__PKSharingMessageExtensionPushProvisioningPresenter_extensionWillAppear__block_invoke;
      v9[3] = &unk_1E59DDD18;
      v9[4] = self;
      [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice statusForShareableCredentials:v5 completion:v9];
      goto LABEL_6;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
  [WeakRetained messageDidUpdate];

LABEL_6:
}

- (id)_passInLibraryForMessage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1 && ([*(id *)(a1 + 24) isFromMe] & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v2 = objc_msgSend(*(id *)(a1 + 24), "shareableCredentials", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
LABEL_6:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 16);
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v6) credentialIdentifierHash];
        v9 = [v7 passForProvisioningCredentialHash:v8];

        if (v9) {
          break;
        }
        if (v4 == ++v6)
        {
          uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v4) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __73__PKSharingMessageExtensionPushProvisioningPresenter_extensionWillAppear__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__PKSharingMessageExtensionPushProvisioningPresenter_extensionWillAppear__block_invoke_2;
  v6[3] = &unk_1E59CA870;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __73__PKSharingMessageExtensionPushProvisioningPresenter_extensionWillAppear__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setShareableCredentials:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained messageDidUpdate];
}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v39 = a4;
  id v41 = a5;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    message = self->_message;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = message;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Validate before sending iMessage: %@", (uint8_t *)&buf, 0xCu);
  }

  if (PKiMessageIsActive())
  {
    if ((unint64_t)[v40 count] < 2)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v73 = 0x3032000000;
      v74 = __Block_byref_object_copy__55;
      v75 = __Block_byref_object_dispose__55;
      id v76 = [v40 firstObject];
      if (PKIDSServiceContainsHandle())
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v64 = 0;
          _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sender address is the same as recipient!", v64, 2u);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
        v19 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_3.isa);
        v20 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_4.isa);
        v21 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
        [WeakRetained showAlertWithTitle:v19 message:v20 button:v21];

        (*((void (**)(id, void, void))v41 + 2))(v41, 0, 0);
      }
      else
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F84518]);
        id v22 = objc_alloc(MEMORY[0x1E4F84760]);
        uint64_t v23 = MEMORY[0x1E4F14428];
        id v24 = MEMORY[0x1E4F14428];
        v25 = (void *)[v22 initWithQueue:v23];

        objc_initWeak(&location, self);
        *(void *)v64 = 0;
        v65 = v64;
        uint64_t v66 = 0x3032000000;
        v67 = __Block_byref_object_copy__55;
        v68 = __Block_byref_object_dispose__55;
        id v69 = 0;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke;
        v59[3] = &unk_1E59CF798;
        id v26 = v25;
        id v60 = v26;
        p_long long buf = &buf;
        v62 = v64;
        v37 = &v63;
        objc_copyWeak(&v63, &location);
        [v42 addOperation:v59];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_46;
        v55[3] = &unk_1E59CF7E8;
        id v36 = v26;
        id v56 = v36;
        v57 = &buf;
        v38 = &v58;
        objc_copyWeak(&v58, &location);
        [v42 addOperation:v55];
        id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        long long v51 = 0u;
        v28 = [(PKShareableCredentialMessage *)self->_message shareableCredentials];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v71 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v52;
          do
          {
            uint64_t v31 = 0;
            do
            {
              if (*(void *)v52 != v30) {
                objc_enumerationMutation(v28);
              }
              uint64_t v32 = *(void *)(*((void *)&v51 + 1) + 8 * v31);
              v47[0] = MEMORY[0x1E4F143A8];
              v47[1] = 3221225472;
              v47[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_50;
              v47[3] = &unk_1E59DDD90;
              objc_copyWeak(&v50, &location);
              v49 = v64;
              v47[4] = v32;
              id v48 = v27;
              objc_msgSend(v42, "addOperation:", v47, v36, v37, v38);

              objc_destroyWeak(&v50);
              ++v31;
            }
            while (v29 != v31);
            uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v71 count:16];
          }
          while (v29);
        }

        v33 = [MEMORY[0x1E4F1CA98] null];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_59;
        v43[3] = &unk_1E59CFB80;
        objc_copyWeak(&v46, &location);
        id v34 = v27;
        id v44 = v34;
        id v45 = v41;
        id v35 = (id)[v42 evaluateWithInput:v33 completion:v43];

        objc_destroyWeak(&v46);
        objc_destroyWeak(v38);

        objc_destroyWeak(v37);
        _Block_object_dispose(v64, 8);

        objc_destroyWeak(&location);
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v10 = objc_loadWeakRetained((id *)&self->_renderer);
      long long v11 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_1.isa);
      long long v12 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_2.isa);
      long long v13 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
      [v10 showAlertWithTitle:v11 message:v12 button:v13];

      (*((void (**)(id, void, void))v41 + 2))(v41, 0, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: iMessage is disabled", (uint8_t *)&buf, 2u);
    }

    id v14 = objc_loadWeakRetained((id *)&self->_renderer);
    v15 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_1.isa);
    uint64_t v16 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_21.isa);
    v17 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
    [v14 showAlertWithTitle:v15 message:v16 button:v17];

    (*((void (**)(id, void, void))v41 + 2))(v41, 0, 0);
  }
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2;
  v14[3] = &unk_1E59CF770;
  uint64_t v17 = *(void *)(a1 + 48);
  objc_copyWeak(&v19, (id *)(a1 + 56));
  uint64_t v18 = *(void *)(a1 + 40);
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [v10 reachableDestinationsForDestination:v11 service:@"com.apple.private.alloy.harmony.pushprovisioning" completion:v14];

  objc_destroyWeak(&v19);
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (a3 || ![v6 count])
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = @"com.apple.private.alloy.harmony.pushprovisioning";
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "iMessage Extension: IDSBatchIDQueryController service %@ returned no reachable destinations", (uint8_t *)&v12, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    -[PKSharingMessageExtensionPushProvisioningPresenter _presentIDSAlert]((uint64_t)WeakRetained);
  }
  else
  {
    uint64_t v9 = [v6 firstObject];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_presentIDSAlert
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v1 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_1.isa);
    v2 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_28.isa);
    uint64_t v3 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
    [WeakRetained showAlertWithTitle:v1 message:v2 button:v3];
  }
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_46(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(*(void *)(v10 + 8) + 40);
  uint64_t v13 = *MEMORY[0x1E4F6AA78];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_47;
  v16[3] = &unk_1E59DDD40;
  uint64_t v19 = v10;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  id v14 = v9;
  id v18 = v14;
  id v15 = v8;
  id v17 = v15;
  [v11 checkIDSStatusForDestination:v12 service:v13 listenerID:@"ShareableCredentialsIDSStatusQueryListenerID" completion:v16];

  objc_destroyWeak(&v20);
}

uint64_t __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_47(uint64_t a1, char a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Recipient %@ doesn't support imessage", (uint8_t *)&v7, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    -[PKSharingMessageExtensionPushProvisioningPresenter _presentIDSAlert]((uint64_t)WeakRetained);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_50(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v22 = v7;
    id v11 = objc_alloc(MEMORY[0x1E4F84EF8]);
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) firstObject];
    uint64_t v13 = PKIDSNormalizedAddress();
    id v14 = [*(id *)(a1 + 32) credentialIdentifier];
    id v15 = [*(id *)(a1 + 32) cardConfigurationIdentifier];
    [*(id *)(a1 + 32) sharingInstanceIdentifier];
    id v16 = v23 = v8;
    [*(id *)(a1 + 32) nonce];
    v18 = id v17 = v9;
    uint64_t v19 = (void *)[v11 initWithAppleIdentifier:v13 appleIdentifierType:2 provisioningCredentialIdentifier:v14 cardConfigurationIdentifier:v15 sharingInstanceIdentifier:v16 nonce:v18];

    id v9 = v17;
    id v20 = (void *)WeakRetained[1];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_52;
    v24[3] = &unk_1E59DDD68;
    v21 = *(void **)(a1 + 40);
    v24[4] = *(void *)(a1 + 32);
    id v25 = v21;
    id v8 = v23;
    objc_copyWeak(&v28, (id *)(a1 + 56));
    id v27 = v17;
    id v26 = v23;
    [v20 prepareProvisioningTarget:v19 checkFamilyCircle:1 completion:v24];

    objc_destroyWeak(&v28);
    id v7 = v22;
  }
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_52(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v15 = v7;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sending provisioning target %@ (family circle: %d).", buf, 0x12u);
  }

  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v11 = *(id *)(a1 + 32);
    [v11 setEncryptedPushProvisioningTarget:v7];
    [v11 setStatus:1];
    [*(id *)(a1 + 40) addObject:v11];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "iMessage Extension: prepareProvisioningTarget error: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_53;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v13, (id *)(a1 + 64));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v13);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_53(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 4);
    uint64_t v3 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_1.isa);
    uint64_t v4 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_22.isa);
    id v5 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
    [v2 showAlertWithTitle:v3 message:v4 button:v5];

    id WeakRetained = v6;
  }
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_59(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_3;
  v7[3] = &unk_1E59D11A8;
  objc_copyWeak(&v11, a1 + 6);
  id v8 = v5;
  id v9 = a1[4];
  id v10 = a1[5];
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v11);
}

void __101__PKSharingMessageExtensionPushProvisioningPresenter_validateForRecipients_senderAddress_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
    {
      uint64_t v3 = (void *)*((void *)WeakRetained + 3);
      uint64_t v4 = (void *)[*(id *)(a1 + 40) copy];
      [v3 setShareableCredentials:v4];

      id v5 = objc_loadWeakRetained((id *)WeakRetained + 4);
      [v5 messageDidUpdate];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: presenter deallocated", v7, 2u);
    }
  }
}

- (void)didTapMessage
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[PKSharingMessageExtensionPushProvisioningPresenter _passInLibraryForMessage]((uint64_t)self);
  if (!v3)
  {
    if (![(PKShareableCredentialMessage *)self->_message isShareAcceptable]) {
      goto LABEL_15;
    }
    id v6 = [(PKShareableCredentialMessage *)self->_message shareableCredentials];
    objc_msgSend(v6, "pk_arrayByApplyingBlock:", &__block_literal_global_206);
    id v7 = (PKShareableCredentialMessage *)objc_claimAutoreleasedReturnValue();

    id v28 = 0;
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v28];
    id v9 = v28;
    if (v8)
    {
      int IsCurrentlyAvailable = PKPassbookIsCurrentlyAvailable();
      id v11 = PKLogFacilityTypeGetObject();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (IsCurrentlyAvailable)
      {
        id v27 = v9;
        if (v12)
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v30 = v7;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Open shareable credential with encrypted provisioning targets %@", buf, 0xCu);
        }

        id v25 = NSString;
        uint64_t v13 = *MEMORY[0x1E4F87D90];
        uint64_t v14 = *MEMORY[0x1E4F87D88];
        id v15 = [v8 hexEncoding];
        uint64_t v16 = *MEMORY[0x1E4F87D98];
        [(PKShareableCredentialMessage *)self->_message passThumbnailImage];
        id v26 = v8;
        int v17 = (UIImage *)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = UIImagePNGRepresentation(v17);
        uint64_t v19 = [v18 hexEncoding];
        id v11 = [v25 stringWithFormat:@"shoebox://%@/?%@=%@&%@=%@", v13, v14, v15, v16, v19];

        id v8 = v26;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
        v21 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
        [WeakRetained openAppURL:v21];

        id v9 = v27;
        goto LABEL_14;
      }
      if (v12)
      {
        message = self->_message;
        *(_DWORD *)long long buf = 138412546;
        uint64_t v30 = message;
        __int16 v31 = 2112;
        uint64_t v32 = v7;
        uint64_t v23 = "iMessage Extension: Unable to open shareable credential as passbook is not available: %@ %@";
        goto LABEL_13;
      }
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = self->_message;
        *(_DWORD *)long long buf = 138412546;
        uint64_t v30 = v22;
        __int16 v31 = 2112;
        uint64_t v32 = v7;
        uint64_t v23 = "iMessage Extension: Open shareable credential with no encrypted provisioning targets: %@ %@";
LABEL_13:
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  id v4 = objc_loadWeakRetained((id *)&self->_renderer);
  id v5 = [v3 passURL];
  [v4 openAppURL:v5];

LABEL_15:
}

uint64_t __67__PKSharingMessageExtensionPushProvisioningPresenter_didTapMessage__block_invoke(uint64_t a1, void *a2)
{
  return [a2 encryptedPushProvisioningTarget];
}

+ (id)propertiesForMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  id v5 = [v3 caption];
  [(PKSharingMessageExtensionViewProperties *)v4 setTitle:v5];

  id v6 = [v3 passThumbnailImage];
  if (v6)
  {
    [(PKSharingMessageExtensionViewProperties *)v4 setCardImage:v6];
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1818] imageNamed:@"placeholder"];
    [(PKSharingMessageExtensionViewProperties *)v4 setCardImage:v7];
  }
  int v8 = [v3 isFromMe];
  id v9 = [v3 shareableCredentials];
  id v10 = [v9 firstObject];
  uint64_t v11 = [v10 status];

  switch(v11)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (v8) {
        BOOL v12 = @"SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_AVAILABLE_SENDER";
      }
      else {
LABEL_7:
      }
        BOOL v12 = @"SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_WALLET";
      goto LABEL_12;
    case 2:
      uint64_t v13 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_27.isa);
      [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v13];

      if (![v3 isPassInLibrary]) {
        break;
      }
      uint64_t v14 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_0.isa);
      [(PKSharingMessageExtensionViewProperties *)v4 setButtonText:v14];
      goto LABEL_13;
    case 3:
      BOOL v12 = @"SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_REVOKED";
      goto LABEL_12;
    case 4:
      BOOL v12 = @"SHAREABLE_MESSAGES_EXTENSION_SUBTITLE_TEXT_EXPIRED";
LABEL_12:
      uint64_t v14 = PKLocalizedShareableCredentialString(&v12->isa);
      [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v14];
LABEL_13:

      break;
    default:
      break;
  }
  if ([v3 isShareAcceptable])
  {
    id v15 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_5.isa);
    [(PKSharingMessageExtensionViewProperties *)v4 setButtonText:v15];
  }

  return v4;
}

- (PKSharingMessageExtensionRenderer)renderer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);

  return (PKSharingMessageExtensionRenderer *)WeakRetained;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderer);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);

  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end