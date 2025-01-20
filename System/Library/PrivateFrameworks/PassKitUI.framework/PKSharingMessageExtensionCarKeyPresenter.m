@interface PKSharingMessageExtensionCarKeyPresenter
+ (Class)messageClass;
+ (id)propertiesForMessage:(id)a3;
- (PKSharingMessageExtensionCarKeyPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4;
- (PKSharingMessageExtensionMessage)message;
- (PKSharingMessageExtensionRenderer)renderer;
- (void)_attemptToOpenPhoneInvitation:(void *)a3 watchInvitation:;
- (void)_presentIDSAlert;
- (void)didTapMessage;
- (void)extensionWillAppear;
- (void)setMessage:(id)a3;
- (void)setMessageFromShare:(id)a3 pass:(id)a4 completion:(id)a5;
- (void)setRenderer:(id)a3;
- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5;
@end

@implementation PKSharingMessageExtensionCarKeyPresenter

- (PKSharingMessageExtensionCarKeyPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingMessageExtensionCarKeyPresenter;
  v9 = [(PKSharingMessageExtensionCarKeyPresenter *)&v12 init];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_message = &self->_message;
  v4 = [(PKSubcredentialInvitationMessage *)self->_message phoneInvitation];
  id v5 = [v4 identifier];

  [(PKSubcredentialInvitationMessage *)*p_message status];
  objc_initWeak(&location, self);
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = PKShareStatusToString();
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: invitationIdentifier: %@ status: %@", buf, 0x16u);
  }
  [(PKSubcredentialInvitationMessage *)self->_message status];
  char IsTerminal = PKShareStatusIsTerminal();
  if (v5) {
    char v9 = IsTerminal;
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) == 0)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F84618]);
    if ([(PKSubcredentialInvitationMessage *)self->_message isFromMe])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke;
      v14[3] = &unk_1E59CF748;
      v11 = &v15;
      objc_copyWeak(&v15, &location);
      [v10 statusForSentSharingInvitationWithIdentifier:v5 completion:v14];
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_19;
      v12[3] = &unk_1E59CF748;
      v11 = &v13;
      objc_copyWeak(&v13, &location);
      [v10 statusForReceivedSharingInvitationWithIdentifier:v5 completion:v12];
    }
    objc_destroyWeak(v11);
  }
  objc_destroyWeak(&location);
}

void __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_2;
  v3[3] = &unk_1E59CF720;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Updated sent status: %lu", (uint8_t *)&v6, 0xCu);
  }

  [WeakRetained[3] setStatus:*(void *)(a1 + 40)];
  id v5 = objc_loadWeakRetained(WeakRetained + 9);
  [v5 messageDidUpdate];
}

void __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_19(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_2_20;
  v3[3] = &unk_1E59CF720;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __63__PKSharingMessageExtensionCarKeyPresenter_extensionWillAppear__block_invoke_2_20(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Updated received status: %lu", (uint8_t *)&v6, 0xCu);
  }

  [WeakRetained[3] setStatus:*(void *)(a1 + 40)];
  id v5 = objc_loadWeakRetained(WeakRetained + 9);
  [v5 messageDidUpdate];
}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Validate message for sending and present Oslo sheet", buf, 2u);
  }

  if ((PKiMessageIsActive() & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: iMessage is disabled", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
    id v13 = PKLocalizedCredentialString(&cfstr_SubcredentialM_0.isa);
    v14 = PKLocalizedCredentialString(&cfstr_SubcredentialM_1.isa);
    id v15 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
    [WeakRetained showAlertWithTitle:v13 message:v14 button:v15];

    goto LABEL_12;
  }
  if (!self || (unint64_t)[v8 count] < 2)
  {
    *(void *)buf = 0;
    v76 = buf;
    uint64_t v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__8;
    v79 = __Block_byref_object_dispose__8;
    id v80 = [v8 firstObject];
    if (PKIDSServiceContainsHandle())
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v68 = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sender address is the same as recipient!", v68, 2u);
      }

      id v16 = objc_loadWeakRetained((id *)&self->_renderer);
      v17 = PKLocalizedCredentialString(&cfstr_SubcredentialM_0.isa);
      v18 = PKLocalizedCredentialString(&cfstr_SubcredentialM_3.isa);
      __int16 v19 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
      [v16 showAlertWithTitle:v17 message:v18 button:v19];

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
    else
    {
      id v20 = *((id *)v76 + 5);
      if (self)
      {
        uint64_t v21 = [(PKSubcredentialInvitationMessage *)self->_message dataString];
        v22 = objc_msgSend(v21, "pk_decodeHexadecimal");

        if (v22)
        {
          v23 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:0];
          sharingRequest = self->_sharingRequest;
          self->_sharingRequest = v23;

          v50 = [(PKAppletSubcredentialSharingRequest *)self->_sharingRequest passIdentifier];
          v25 = [(PKPassLibraryDataProvider *)self->_passLibrary passWithUniqueID:v50];
          v26 = [v25 paymentPass];

          [(PKAppletSubcredentialSharingRequest *)self->_sharingRequest setPass:v26];
          [(PKAppletSubcredentialSharingRequest *)self->_sharingRequest setRecipientIdentifier:v20];
          v49 = self->_sharingRequest;
          id v27 = v20;
          contactResolver = self->_contactResolver;
          if (!contactResolver)
          {
            id v29 = objc_alloc_init(MEMORY[0x1E4F1B980]);
            v30 = [MEMORY[0x1E4F84D88] requiredContactKeys];
            v31 = (PKContactResolver *)[objc_alloc(MEMORY[0x1E4F845E8]) initWithContactStore:v29 keysToFetch:v30];
            v32 = self->_contactResolver;
            self->_contactResolver = v31;

            contactResolver = self->_contactResolver;
          }
          v33 = contactResolver;
          v34 = [(PKContactResolver *)v33 contactForHandle:v27];

          uint64_t v35 = [MEMORY[0x1E4F84D88] redactedDisplayNameForCounterpartHandle:v27 contact:v34];
          v36 = (void *)v35;
          if (v35) {
            v37 = (void *)v35;
          }
          else {
            v37 = v27;
          }
          id v38 = v37;

          [(PKAppletSubcredentialSharingRequest *)v49 setRecipientName:v38];
          id v39 = objc_alloc_init(MEMORY[0x1E4F84518]);
          id v40 = objc_alloc(MEMORY[0x1E4F84760]);
          uint64_t v41 = MEMORY[0x1E4F14428];
          id v42 = MEMORY[0x1E4F14428];
          v43 = (void *)[v40 initWithQueue:v41];

          objc_initWeak(&location, self);
          *(void *)v68 = 0;
          v69 = v68;
          uint64_t v70 = 0x3032000000;
          v71 = __Block_byref_object_copy__8;
          v72 = __Block_byref_object_dispose__8;
          id v73 = 0;
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke;
          v63[3] = &unk_1E59CF798;
          id v44 = v43;
          id v64 = v44;
          v65 = buf;
          v66 = v68;
          objc_copyWeak(&v67, &location);
          [v39 addOperation:v63];
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_40;
          v59[3] = &unk_1E59CF7C0;
          v59[4] = self;
          id v45 = v44;
          id v60 = v45;
          v61 = v68;
          objc_copyWeak(&v62, &location);
          [v39 addOperation:v59];
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_43;
          v55[3] = &unk_1E59CF7E8;
          id v46 = v45;
          id v56 = v46;
          v57 = buf;
          objc_copyWeak(&v58, &location);
          [v39 addOperation:v55];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_45;
          v53[3] = &unk_1E59CF838;
          objc_copyWeak(&v54, &location);
          [v39 addOperation:v53];
          v47 = [MEMORY[0x1E4F1CA98] null];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_50;
          v51[3] = &unk_1E59CEC00;
          id v52 = v10;
          id v48 = (id)[v39 evaluateWithInput:v47 completion:v51];

          objc_destroyWeak(&v54);
          objc_destroyWeak(&v58);

          objc_destroyWeak(&v62);
          objc_destroyWeak(&v67);

          _Block_object_dispose(v68, 8);
          objc_destroyWeak(&location);

          goto LABEL_29;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Error: Sharing Request Data is nil. Cannot send invitation", v68, 2u);
        }
      }
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
LABEL_29:
    _Block_object_dispose(buf, 8);

    goto LABEL_30;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Car Key is not available in group conversations", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
  id v13 = PKLocalizedCredentialString(&cfstr_SubcredentialM_2.isa);
  v14 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
  [WeakRetained showAlertWithTitle:v13 message:0 button:v14];
LABEL_12:

  (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
LABEL_30:
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v12 = *MEMORY[0x1E4F87478];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2;
  v15[3] = &unk_1E59CF770;
  uint64_t v18 = *(void *)(a1 + 48);
  objc_copyWeak(&v20, (id *)(a1 + 56));
  uint64_t v19 = *(void *)(a1 + 40);
  id v13 = v9;
  id v17 = v13;
  id v14 = v8;
  id v16 = v14;
  [v10 reachableDestinationsForDestination:v11 service:v12 completion:v15];

  objc_destroyWeak(&v20);
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (a3 || ![v6 count])
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Unable to find reachable destinations for recipient", v12, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    -[PKSharingMessageExtensionCarKeyPresenter _presentIDSAlert]((uint64_t)WeakRetained);
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
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v2 = [*(id *)(a1 + 48) recipientIdentifier];
    v3 = PKLocalizedCredentialString(&cfstr_SubcredentialM_13.isa, &stru_1EF1B4C70.isa, v2);
    uint64_t v4 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
    [WeakRetained showAlertWithTitle:0 message:v3 button:v4];
  }
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_40(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 48) credential];
  uint64_t v11 = [v10 supportedRadioTechnologies];

  if (v11 == 2)
  {
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v14 = *MEMORY[0x1E4F87478];
    uint64_t v15 = *MEMORY[0x1E4F87480];
    uint64_t v16 = *MEMORY[0x1E4F6B2C8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_41;
    v17[3] = &unk_1E59CAE30;
    objc_copyWeak(&v20, (id *)(a1 + 56));
    id v19 = v9;
    id v18 = v8;
    [v12 checkDeviceSupportForDestinations:v13 service:v14 listenerID:v15 capability:v16 completion:v17];

    objc_destroyWeak(&v20);
  }
  else
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_41(uint64_t a1, char a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Cannot send Car Key because the recipient device only supports NFC keys.", v11, 2u);
      }

      id v6 = objc_loadWeakRetained(WeakRetained + 9);
      id v7 = PKLocalizedCredentialString(&cfstr_SubcredentialM_0.isa);
      id v8 = PKLocalizedCredentialString(&cfstr_SubcredentialM_14.isa);
      id v9 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
      [v6 showAlertWithTitle:v7 message:v8 button:v9];

      [WeakRetained[3] setStatus:9];
      id v10 = objc_loadWeakRetained(WeakRetained + 9);
      [v10 messageDidUpdate];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v12 = *MEMORY[0x1E4F6AA78];
  uint64_t v13 = *MEMORY[0x1E4F87480];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_44;
  v16[3] = &unk_1E59CAE30;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  id v14 = v9;
  id v18 = v14;
  id v15 = v8;
  id v17 = v15;
  [v10 checkIDSStatusForDestination:v11 service:v12 listenerID:v13 completion:v16];

  objc_destroyWeak(&v19);
}

uint64_t __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_44(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Recipient doesn't support imessage", v6, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[PKSharingMessageExtensionCarKeyPresenter _presentIDSAlert]((uint64_t)WeakRetained);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_45(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v12 = PKPaymentRequestFromSharingRequest();
    uint64_t v13 = (void *)MEMORY[0x1E4F85000];
    id v14 = objc_loadWeakRetained(WeakRetained + 9);
    id v15 = [v14 presentationSceneIdentifier];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_47;
    v20[3] = &unk_1E59CF810;
    objc_copyWeak(&v21, v10);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_3;
    v17[3] = &unk_1E59CA820;
    id v19 = v9;
    id v18 = v8;
    id v16 = (id)[v13 authorizeForRequest:v12 presentationSceneIdentifier:v15 authHandler:v20 completion:v17];

    objc_destroyWeak(&v21);
  }
}

void __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_2_47(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  val = (id *)objc_loadWeakRetained(v4);
  id v7 = v6;
  id v8 = v5;
  if (val)
  {
    objc_initWeak(&location, val);
    id v9 = val[6];
    id v10 = [v9 recipientIdentifier];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke;
    v23[3] = &unk_1E59CF928;
    id v11 = v9;
    id v24 = v11;
    id v25 = v7;
    objc_copyWeak(&v27, &location);
    id v26 = v8;
    id v12 = v10;
    uint64_t v13 = v23;
    id v14 = [MEMORY[0x1E4F84D50] sharedService];
    id v15 = [v14 targetDevice];
    id v16 = [val[6] credential];
    id v17 = [v16 identifier];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke;
    v29[3] = &unk_1E59CF9A0;
    id v30 = v15;
    id v31 = v14;
    id v18 = v12;
    id v32 = v18;
    id v19 = v13;
    id v33 = v19;
    id v20 = v14;
    id v21 = v15;
    [v21 paymentWebService:v20 credentialWithIdentifier:v17 completion:v29];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

uint64_t __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Unable to authorize for share or unable to create share", v5, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __91__PKSharingMessageExtensionCarKeyPresenter_validateForRecipients_senderAddress_completion___block_invoke_50(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  [a4 isCanceled];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

- (void)didTapMessage
{
  BOOL v3 = [(PKSubcredentialInvitationMessage *)self->_message isFromMe];
  if ([(PKSubcredentialInvitationMessage *)self->_message status] - 4 >= 0xFFFFFFFFFFFFFFFDLL && !v3)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__8;
    id v19 = __Block_byref_object_dispose__8;
    id v20 = [(PKSubcredentialInvitationMessage *)self->_message phoneInvitation];
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__8;
    uint64_t v13 = __Block_byref_object_dispose__8;
    id v14 = [(PKSubcredentialInvitationMessage *)self->_message watchInvitation];
    uint64_t v4 = [(id)v16[5] partnerIdentifier];

    if (v4)
    {
      -[PKSharingMessageExtensionCarKeyPresenter _attemptToOpenPhoneInvitation:watchInvitation:]((uint64_t)self, (void *)v16[5], (void *)v10[5]);
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke;
      v6[3] = &unk_1E59CF888;
      objc_copyWeak(&v7, &location);
      v6[4] = &v15;
      v6[5] = &v9;
      [v5 subcredentialInvitationsWithCompletion:v6];
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }
}

- (void)_attemptToOpenPhoneInvitation:(void *)a3 watchInvitation:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = [v6 addCarKeyPassConfiguration];
    int v8 = [*(id *)(a1 + 16) canAddSecureElementPassWithConfiguration:v7];
    uint64_t v9 = [v6 identifier];

    id v10 = [v5 identifier];

    uint64_t v11 = PKLogFacilityTypeGetObject();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9 && v8)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Open subcredential invitation with phoneInvitationIdentifier: %@", buf, 0xCu);
      }

      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v10;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Open subcredential invitation with watchInvitationIdentifier: %@", buf, 0xCu);
        }

        [NSString stringWithFormat:@"shoebox://%@/?%@=%@&%@=%@", *MEMORY[0x1E4F870A8], *MEMORY[0x1E4F87098], v9, *MEMORY[0x1E4F870A0], v10];
      }
      else
      {
        [NSString stringWithFormat:@"shoebox://%@/?%@=%@", *MEMORY[0x1E4F870A8], *MEMORY[0x1E4F87098], v9, v18, v19];
      id v14 = };
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
      [WeakRetained openAppURL:v16];
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 1024;
        int v23 = v8;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Fail to open subcredential invitation with phoneInvitationIdentifier: %@, canOpen: %d", buf, 0x12u);
      }

      if (v10) {
        uint64_t v13 = @"CARKEY_NOT_SUPPORTED_BODY_TRY_WATCH";
      }
      else {
        uint64_t v13 = @"CARKEY_NOT_SUPPORTED_BODY";
      }
      id v14 = PKLocalizedCredentialString(&v13->isa);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      id v16 = PKLocalizedCredentialString(&cfstr_CarkeyNotSuppo_1.isa);
      uint64_t v17 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
      [WeakRetained showAlertWithTitle:v16 message:v14 button:v17];
    }
  }
}

void __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke_2;
    v12[3] = &unk_1E59CF860;
    void v12[4] = *(void *)(a1 + 32);
    uint64_t v5 = objc_msgSend(v3, "pk_anyObjectPassingTest:", v12);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke_3;
    v11[3] = &unk_1E59CF860;
    v11[4] = *(void *)(a1 + 40);
    uint64_t v8 = objc_msgSend(v3, "pk_anyObjectPassingTest:", v11);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    -[PKSharingMessageExtensionCarKeyPresenter _attemptToOpenPhoneInvitation:watchInvitation:]((uint64_t)WeakRetained, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

uint64_t __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  uint64_t v5 = [v3 identifier];

  uint64_t v6 = PKEqualObjects();
  return v6;
}

uint64_t __57__PKSharingMessageExtensionCarKeyPresenter_didTapMessage__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  uint64_t v5 = [v3 identifier];

  uint64_t v6 = PKEqualObjects();
  return v6;
}

void __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F84618]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_2;
  v5[3] = &unk_1E59CF900;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  [v2 sendSharingInvitationWithRequest:v3 auth:v4 completion:v5];

  objc_destroyWeak(&v8);
}

void __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
LABEL_10:
    (*((void (**)(void))a1[5] + 2))();
    goto LABEL_11;
  }
  id v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v5 || v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sharing failed with error: %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if (v9)
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sharing succeeded with share: %@", buf, 0xCu);
  }

  id v10 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v11 = [v10 targetDevice];
  BOOL v12 = [a1[4] credential];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_73;
  v13[3] = &unk_1E59CF8D8;
  v13[4] = WeakRetained;
  id v14 = v5;
  id v15 = a1[5];
  [v11 paymentWebService:v10 addPassShare:v14 onCredential:v12 withCompletion:v13];

LABEL_11:
}

void __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_73(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v4[2] = __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_2_74;
  v4[3] = &unk_1E59CF8B0;
  char v7 = a2;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __92__PKSharingMessageExtensionCarKeyPresenter__sendSharingRequestWithAuthorization_completion___block_invoke_2_74(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    uint64_t v43 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Added receipts to target device: %ld", buf, 0xCu);
  }
  oslog = v2;

  uint64_t v4 = *(id **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  if (v4)
  {
    uint64_t v30 = a1;
    id v6 = [v4[6] credential];
    id v33 = [v6 pairedReaderIdentifier];

    char v7 = [v4[6] credential];
    uint64_t v8 = [v7 supportedRadioTechnologies];

    BOOL v9 = [v4[6] credential];
    id v10 = [v9 brandIdentifier];

    uint64_t v11 = [v4[6] credential];
    BOOL v12 = [v11 partnerIdentifier];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v13 = v5;
    id obj = [v5 credentialShares];
    uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:buf count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          int v19 = [v18 isForWatch];
          id v20 = v4[3];
          if (v19)
          {
            id v21 = [v20 watchInvitation];
            __int16 v22 = [v18 identifier];
            [v21 setIdentifier:v22];

            int v23 = [v13 uuidIdentifier];
            [v21 setSharingSessionIdentifier:v23];

            [v21 setPairedReaderIdentifier:v33];
            [v21 setSupportedRadioTechnologies:v8];
            [v21 setPartnerIdentifier:v12];
            [v21 setBrandIdentifier:v10];
            [v4[3] setWatchInvitation:v21];
          }
          else
          {
            id v21 = [v20 phoneInvitation];
            uint64_t v24 = [v18 identifier];
            [v21 setIdentifier:v24];

            id v25 = [v13 uuidIdentifier];
            [v21 setSharingSessionIdentifier:v25];

            [v21 setPairedReaderIdentifier:v33];
            [v21 setSupportedRadioTechnologies:v8];
            [v21 setPartnerIdentifier:v12];
            [v21 setBrandIdentifier:v10];
            [v4[3] setPhoneInvitation:v21];
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:buf count:16];
      }
      while (v15);
    }

    [v4[3] setStatus:2];
    [v4[3] setDataString:0];
    [v4[3] setUniqueIdentifier:0];
    id WeakRetained = objc_loadWeakRetained(v4 + 9);
    [WeakRetained messageDidUpdate];

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [v4[3] phoneInvitation];
      *(_DWORD *)id v38 = 136315394;
      id v39 = "-[PKSharingMessageExtensionCarKeyPresenter _addShareToMessage:]";
      __int16 v40 = 2112;
      uint64_t v41 = v27;
      _os_log_impl(&dword_19F450000, oslog, OS_LOG_TYPE_DEFAULT, "iMessage Extension: %s: phoneInvitationIdentifier: %@", v38, 0x16u);
    }
    a1 = v30;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v4[3] watchInvitation];
      *(_DWORD *)id v38 = 136315394;
      id v39 = "-[PKSharingMessageExtensionCarKeyPresenter _addShareToMessage:]";
      __int16 v40 = 2112;
      uint64_t v41 = v28;
      _os_log_impl(&dword_19F450000, oslog, OS_LOG_TYPE_DEFAULT, "iMessage Extension: %s: watchInvitationIdentifier: %@", v38, 0x16u);
    }
    id v5 = v13;
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1[4];
  id v5 = a1[5];
  id v6 = [v3 identifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_2;
  v8[3] = &unk_1E59CF978;
  id v9 = a1[6];
  id v10 = v3;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = a1[7];
  id v7 = v3;
  [v4 paymentWebService:v5 passSharesForCredentialIdentifier:v6 completion:v8];
}

void __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v7 = [v6 credentialShares];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v30 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              id v13 = [v12 channelTransportIdentifier];
              int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

              if (v14) {
                [v4 addObject:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v39 count:16];
          }
          while (v9);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v22);
  }

  if ([v4 count])
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F84618]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_3;
    v23[3] = &unk_1E59CF950;
    uint64_t v16 = *(void *)(a1 + 40);
    id v24 = *(id *)(a1 + 48);
    id v25 = *(id *)(a1 + 56);
    id v26 = v4;
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 64);
    [v15 rescindInvitations:v26 onCredential:v16 withCompletion:v23];
  }
  else
  {
    id v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v18;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "iMessage Extension: No outstanding invites found to recipient: %@", buf, 0xCu);
    }

    uint64_t v19 = *(void *)(a1 + 64);
    if (v19) {
      (*(void (**)(void))(v19 + 16))();
    }
  }
}

void __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Failed to rescind outstanding invites: %@", buf, 0xCu);
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_77;
    v9[3] = &unk_1E59CA9F8;
    uint64_t v10 = *(id *)(a1 + 64);
    [v5 paymentWebService:v6 removeSharingInvitationReceipts:v7 onCredential:v8 withCompletion:v9];
    id v4 = v10;
  }
}

uint64_t __109__PKSharingMessageExtensionCarKeyPresenter__rescindOutstandingInvitationsForRecipientWithAddress_completion___block_invoke_77(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Successfully rescinded all outstanding invites", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)propertiesForMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  id v5 = [v3 phoneInvitation];
  uint64_t v6 = [v5 issuer];
  [(PKSharingMessageExtensionViewProperties *)v4 setLeftTitleText:v6];

  uint64_t v7 = [v3 phoneInvitation];
  uint64_t v8 = [v7 deviceModel];
  [(PKSharingMessageExtensionViewProperties *)v4 setRightTitleText:v8];

  uint64_t v9 = PKLocalizedCredentialString(&cfstr_CarKeyPass.isa);
  [(PKSharingMessageExtensionViewProperties *)v4 setTitle:v9];

  uint64_t v10 = PKLocalizedString(&cfstr_Wallet_0.isa);
  [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v10];

  [(PKSharingMessageExtensionViewProperties *)v4 setFallbackCardImageName:*MEMORY[0x1E4F87EC0]];
  int v11 = [v3 isFromMe];
  uint64_t v12 = [v3 status];

  switch(v12)
  {
    case 0:
      uint64_t v13 = @"SUBCREDENTIAL_MESSAGES_STATE_INVITATION_UNKNOWN";
      goto LABEL_12;
    case 1:
      uint64_t v16 = PKLocalizedCredentialString(&cfstr_SubcredentialM_7.isa);
      [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v16];

      if (v11) {
        goto LABEL_14;
      }
      id v15 = @"SUBCREDENTIAL_MESSAGES_TEXT_VIEW";
      goto LABEL_9;
    case 2:
    case 3:
    case 4:
    case 5:
      if (v11)
      {
        uint64_t v13 = @"SUBCREDENTIAL_MESSAGES_STATE_INVITATION_PENDING";
LABEL_12:
        id v17 = PKLocalizedCredentialString(&v13->isa);
        [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v17];
      }
      else
      {
        int v14 = PKLocalizedCredentialString(&cfstr_SubcredentialM_5.isa);
        [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v14];

        id v15 = @"SUBCREDENTIAL_MESSAGES_TEXT_ADD";
LABEL_9:
        id v17 = PKLocalizedCredentialString(&v15->isa);
        [(PKSharingMessageExtensionViewProperties *)v4 setButtonText:v17];
      }

LABEL_14:
      return v4;
    case 6:
    case 7:
      uint64_t v13 = @"SUBCREDENTIAL_MESSAGES_STATE_INVITATION_REVOKED";
      goto LABEL_12;
    case 8:
      uint64_t v13 = @"SUBCREDENTIAL_MESSAGES_STATE_INVITATION_CANCELED";
      goto LABEL_12;
    case 9:
      uint64_t v13 = @"SUBCREDENTIAL_MESSAGES_STATE_INVITATION_NOT_SUPPORTED";
      goto LABEL_12;
    default:
      goto LABEL_14;
  }
}

- (void)setMessageFromShare:(id)a3 pass:(id)a4 completion:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v37 = a5;
  uint64_t v38 = self;
  targetDevice = self->_targetDevice;
  id v9 = a4;
  id v10 = a3;
  long long v36 = v9;
  long long v35 = [v9 uniqueID];
  int v11 = -[PKPaymentWebServiceTargetDeviceProtocol entitlementsForPassIdentifier:](targetDevice, "entitlementsForPassIdentifier:");
  id v12 = v10;
  id v13 = v11;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = [v12 sharedEntitlements];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v45 + 1) + 8 * i) entitlementIdentifier];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v17);
  }

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v22 = v13;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        id v28 = [v27 identifier];
        int v29 = [v14 containsObject:v28];

        if (v29) {
          [v21 addObject:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v24);
  }

  long long v30 = (void *)[v21 copy];
  id v31 = objc_alloc(MEMORY[0x1E4F84430]);
  long long v32 = [v36 paymentPass];

  long long v33 = (void *)[v31 initWithPaymentPass:v32 entitlements:v30];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __80__PKSharingMessageExtensionCarKeyPresenter_setMessageFromShare_pass_completion___block_invoke;
  v39[3] = &unk_1E59CF9C8;
  v39[4] = v38;
  id v40 = v37;
  id v34 = v37;
  +[PKSharingMessageExtensionMessageBuilder messageURLFromSharingRequest:v33 completionHandler:v39];
}

void __80__PKSharingMessageExtensionCarKeyPresenter_setMessageFromShare_pass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PKSubcredentialInvitationMessage alloc] initWithURL:v3];

  [*(id *)(a1 + 32) setMessage:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
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
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_sharingRequest, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong(&self->_authorizationCoordinatorHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);

  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end