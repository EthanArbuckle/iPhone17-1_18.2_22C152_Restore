@interface PKSharingMessageExtensionRelayServerPresenter
+ (Class)messageClass;
+ (id)propertiesForMessage:(id)a3;
- (PKSharingMessageExtensionMessage)message;
- (PKSharingMessageExtensionRelayServerPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4;
- (PKSharingMessageExtensionRenderer)renderer;
- (void)_createShareFromInvite:(void *)a3 externalizedAuth:(void *)a4 completion:;
- (void)_reportAuthenticationEventWithSuccess:(uint64_t)a1;
- (void)_setMessageStatusTo:(void *)a3 pass:;
- (void)didTapMessage;
- (void)extensionWillAppear;
- (void)setMessage:(id)a3;
- (void)setRenderer:(id)a3;
- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5;
@end

@implementation PKSharingMessageExtensionRelayServerPresenter

- (PKSharingMessageExtensionRelayServerPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKSharingMessageExtensionRelayServerPresenter;
  v9 = [(PKSharingMessageExtensionRelayServerPresenter *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong((id *)&v10->_passLibrary, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F84760]);
    uint64_t v12 = [v11 initWithQueue:MEMORY[0x1E4F14428]];
    idsManager = v10->_idsManager;
    v10->_idsManager = (PKIDSIDQueryManager *)v12;
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (![(PKSharingMessageExtensionCommonMessage *)self->_message isPending]
    && ![(PKSharingMessageExtensionCommonMessage *)self->_message isFromMe])
  {
    v3 = [(PKSharingMessageExtensionRelayServerMessage *)self->_message phoneMailboxURL];
    if (v3)
    {
      v16 = [(PKSharingMessageExtensionRelayServerMessage *)self->_message provisioningCredentialHash];
      if (v16
        && (-[PKPassLibraryDataProvider passForProvisioningCredentialHash:](self->_passLibrary, "passForProvisioningCredentialHash:", v16), v4 = objc_claimAutoreleasedReturnValue(), [v4 secureElementPass], id v5 = objc_claimAutoreleasedReturnValue(), v4, v5))
      {
        -[PKSharingMessageExtensionRelayServerPresenter _setMessageStatusTo:pass:]((uint64_t)self, 1, v5);
      }
      else
      {
        v6 = [(PKSharingMessageExtensionRelayServerMessage *)self->_message carKeyReaderIdentifier];
        if (v6)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v7 = [(PKPassLibraryDataProvider *)self->_passLibrary paymentPasses];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v21;
            while (2)
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v21 != v9) {
                  objc_enumerationMutation(v7);
                }
                id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
                uint64_t v12 = [v11 pairedTerminalIdentifier];
                int v13 = [v12 isEqualToString:v6];

                if (v13)
                {
                  [v11 effectiveContactlessPaymentApplicationState];
                  if (!PKPaymentApplicationStateAllowsReplacementInvitation())
                  {
                    -[PKSharingMessageExtensionRelayServerPresenter _setMessageStatusTo:pass:]((uint64_t)self, 1, v11);

                    goto LABEL_21;
                  }
                }
              }
              uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }
        }
        objc_initWeak(&location, self);
        targetDevice = self->_targetDevice;
        objc_super v15 = [v3 absoluteString];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __68__PKSharingMessageExtensionRelayServerPresenter_extensionWillAppear__block_invoke;
        v17[3] = &unk_1E59CEAC0;
        objc_copyWeak(&v18, &location);
        [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice checkInvitationStatusForMailboxAddress:v15 completion:v17];

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
LABEL_21:
      }
    }
    else
    {
      -[PKSharingMessageExtensionRelayServerPresenter _setMessageStatusTo:pass:]((uint64_t)self, 0, 0);
    }
  }
}

- (void)_setMessageStatusTo:(void *)a3 pass:
{
  id v5 = a3;
  v6 = v5;
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PKSharingMessageExtensionRelayServerPresenter__setMessageStatusTo_pass___block_invoke;
    block[3] = &unk_1E59CC648;
    uint64_t v10 = a2;
    id v8 = v5;
    uint64_t v9 = a1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __68__PKSharingMessageExtensionRelayServerPresenter_extensionWillAppear__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a2) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 8;
  }
  -[PKSharingMessageExtensionRelayServerPresenter _setMessageStatusTo:pass:]((uint64_t)WeakRetained, v4, 0);
}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] < 2)
  {
    objc_super v15 = [(PKSharingMessageExtensionRelayServerMessage *)self->_message localProperties];
    v16 = [v15 partialInvite];
    if (v16)
    {
      v17 = [v8 firstObject];
      v50 = v17;
      if (PKIDSServiceContainsHandle())
      {
        id v18 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Sender address is the same as recipient!", buf, 2u);
        }

        v19 = [v16 pass];
        int v20 = [v19 isCarKeyPass];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
        if (v20)
        {
          long long v22 = PKLocalizedCredentialString(&cfstr_SubcredentialM_0.isa);
          long long v23 = PKLocalizedCredentialString(&cfstr_SubcredentialM_3.isa);
          PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
        }
        else
        {
          long long v22 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_3.isa);
          long long v23 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_4.isa);
          PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
        v42 = };
        [WeakRetained showAlertWithTitle:v22 message:v23 button:v42];

        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      }
      else
      {
        v45 = v15;
        id v46 = v9;
        uint64_t v25 = (objc_class *)MEMORY[0x1E4F1B980];
        id v26 = v17;
        id v27 = objc_alloc_init(v25);
        v28 = [MEMORY[0x1E4F84D88] requiredContactKeys];
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F845E8]) initWithContactStore:v27 keysToFetch:v28];
        id v30 = [v29 contactForHandle:v26];
        v31 = [MEMORY[0x1E4F84D88] redactedDisplayNameForCounterpartHandle:v26 contact:v30];

        id v47 = v30;
        [v16 setRecipientNickname:v31];

        [v16 setRecipientHandle:v26];
        id v32 = objc_alloc_init(MEMORY[0x1E4F84518]);
        v49 = PKShareAuthorizationPaymentRequest((PKPartialShareInvitation *)v16);
        id v33 = objc_loadWeakRetained((id *)&self->_renderer);
        v48 = [v33 presentationSceneIdentifier];

        objc_initWeak(location, self);
        v34 = [v16 pass];
        LODWORD(v27) = [v34 isCarKeyPass];

        int v35 = [v16 isHomeShare];
        v86[0] = 0;
        v86[1] = v86;
        v86[2] = 0x2020000000;
        char v87 = 0;
        *(void *)buf = 0;
        v81 = buf;
        uint64_t v82 = 0x3032000000;
        v83 = __Block_byref_object_copy__26;
        v84 = __Block_byref_object_dispose__26;
        id v85 = 0;
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke;
        v76[3] = &unk_1E59CE488;
        v76[4] = self;
        id v36 = v26;
        id v77 = v36;
        id v37 = v16;
        id v78 = v37;
        v79 = v86;
        [v32 addOperation:v76];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_3;
        v71[3] = &unk_1E59D5278;
        v71[4] = self;
        id v72 = v36;
        id v38 = v47;
        id v73 = v38;
        v75 = v86;
        id v39 = v37;
        id v74 = v39;
        [v32 addOperation:v71];
        v69[0] = 0;
        v69[1] = v69;
        v69[2] = 0x2020000000;
        char v70 = 0;
        if ((v35 | v27 ^ 1))
        {
          if (v35)
          {
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_11;
            v56[3] = &unk_1E59CEB60;
            v40 = &v58;
            objc_copyWeak(&v58, location);
            id v57 = v39;
            [v32 addOperation:v56];
            v41 = v57;
          }
          else
          {
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_8;
            v59[3] = &unk_1E59D5318;
            v61 = v69;
            v40 = &v62;
            objc_copyWeak(&v62, location);
            id v60 = v39;
            [v32 addOperation:v59];
            v41 = v60;
          }

          objc_destroyWeak(v40);
        }
        else
        {
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_5;
          v63[3] = &unk_1E59D52F0;
          id v64 = v49;
          id v65 = v48;
          v67 = v69;
          objc_copyWeak(&v68, location);
          id v66 = v39;
          [v32 addOperation:v63];

          objc_destroyWeak(&v68);
        }
        objc_super v15 = v45;
        id v9 = v46;
        v43 = [MEMORY[0x1E4F1CA98] null];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_13;
        v51[3] = &unk_1E59D5368;
        objc_copyWeak(&v55, location);
        v53 = v86;
        v54 = buf;
        id v52 = v10;
        id v44 = (id)[v32 evaluateWithInput:v43 completion:v51];

        objc_destroyWeak(&v55);
        _Block_object_dispose(v69, 8);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v86, 8);
        objc_destroyWeak(location);
      }
    }
    else
    {
      v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "iMessage Extension: ERROR missing invite!", buf, 2u);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)&self->_renderer);
    uint64_t v12 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_1.isa);
    int v13 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_2.isa);
    v14 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
    [v11 showAlertWithTitle:v12 message:v13 button:v14];

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = a1[4];
  id v8 = (void *)a1[5];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  long long v21 = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_2;
  long long v22 = &unk_1E59D20A8;
  id v11 = (void *)a1[6];
  uint64_t v10 = a1[7];
  id v24 = v7;
  uint64_t v25 = v10;
  id v23 = v6;
  id v12 = v6;
  id v13 = v7;
  id v14 = v8;
  id v15 = v11;
  v16 = v20;
  if (v9)
  {
    if (PKiMessageIsActive())
    {
      v17 = *(void **)(v9 + 32);
      uint64_t v18 = *MEMORY[0x1E4F6AA78];
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __115__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageWillBeSentOverSMSToRecipient_invitation_completion___block_invoke;
      v29 = &unk_1E59CA9F8;
      id v30 = v16;
      [v17 checkIDSStatusForDestination:v14 service:v18 listenerID:@"ShareableCredentialsIDSStatusQueryListenerID" completion:buf];
    }
    else
    {
      v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "iMessage Extension: iMessage not active fror user.", buf, 2u);
      }

      v21(v16, 1);
    }
  }
}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_2(void *a1, char a2)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], 0);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_3(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = a1[4];
  id v8 = (void *)a1[5];
  int v10 = *(unsigned __int8 *)(*(void *)(a1[8] + 8) + 24);
  uint64_t v12 = a1[6];
  id v11 = (void *)a1[7];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v71 = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_4;
  id v72 = &unk_1E59CA820;
  id v73 = v6;
  id v74 = v7;
  id v67 = v6;
  id v66 = v7;
  id v69 = v8;
  id v13 = v11;
  id v14 = v70;
  id v15 = v14;
  if (v9)
  {
    id v68 = v14;
    v16 = [v13 share];
    uint64_t v17 = [v13 pass];
    id v18 = objc_alloc(MEMORY[0x1E4F85018]);
    v19 = [MEMORY[0x1E4F84D50] sharedService];
    id v64 = (void *)v17;
    int v20 = (void *)[v18 initWithPass:v17 webService:v19 paymentServiceProvider:0 queue:MEMORY[0x1E4F14428]];

    if (v10) {
      long long v21 = @"com.apple.SMS";
    }
    else {
      long long v21 = @"com.apple.UIKit.activity.Message";
    }
    id v65 = v20;
    long long v22 = [v20 shareInitiationActivationConfigurationForChannelBundleIdentifier:v21 isRecipientKnownContact:v12 != 0];
    id v23 = [v16 activationOptions];
    id v24 = [v22 defaultOptions];
    if ([v22 isBlocked])
    {
      id v62 = v22;
      id v25 = v13;
      id v26 = v24;
      uint64_t v27 = v16;
      v28 = v23;
      id WeakRetained = objc_loadWeakRetained((id *)(v9 + 40));
      if (v12 || v10)
      {
        id v30 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_6.isa);
        uint64_t v31 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_7.isa, &stru_1EF1B4C70.isa, v69);
      }
      else
      {
        id v30 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_8.isa);
        uint64_t v31 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_9.isa);
      }
      id v39 = (void *)v31;
      v40 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
      [WeakRetained showAlertWithTitle:v30 message:v39 button:v40];

      id v15 = v68;
      v71((uint64_t)v68, 1);
      v41 = v64;
      id v37 = v65;
      id v23 = v28;
      v16 = v27;
      id v24 = v26;
      id v13 = v25;
      long long v22 = v62;
      goto LABEL_36;
    }
    if (v24)
    {
      v63 = v16;
      if (v23) {
        goto LABEL_11;
      }
      uint64_t v43 = [v22 allowUserEdit];
      id v44 = PKLogFacilityTypeGetObject();
      v42 = v44;
      if ((v43 & 1) == 0)
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v42, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Activation options required for SMS/iMessage share, adding them.", buf, 2u);
        }

        [v16 setActivationOptions:v24];
        id v15 = v68;
        v71((uint64_t)v68, 0);
        v41 = v64;
        id v37 = v65;
        id v23 = 0;
        goto LABEL_36;
      }
      id v23 = 0;
    }
    else
    {
      v42 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v42, OS_LOG_TYPE_DEFAULT, "iMessage Extension: No activation options required SMS/iMessage.", buf, 2u);
      }

      if (v12)
      {
        id v15 = v68;
        v71((uint64_t)v68, 0);
        v41 = v64;
        id v37 = v65;
LABEL_36:

        goto LABEL_37;
      }
      v63 = v16;
      id v58 = objc_loadWeakRetained((id *)(v9 + 40));
      v54 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_10.isa);
      v56 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_11.isa, &stru_1EF1B4C70.isa, v69);
      v45 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_12.isa);
      PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_13.isa);
      id v46 = v60 = v23;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __161__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageRequiresSecurityUpgradeToRecipient_isRecipientKnownContact_willSendOverSMS_invitation_completion___block_invoke;
      v82[3] = &unk_1E59CA9F8;
      id v83 = v68;
      [v58 showAlertWithTitle:v54 message:v56 button:v45 destructiveButton:v46 completion:v82];

      id v23 = v60;
      if (v60)
      {
LABEL_11:
        id v32 = v23;
        id v33 = [v23 identifiers];
        v34 = [v24 identifiers];
        int v35 = PKEqualObjects();

        if (v35)
        {
          id v36 = PKLogFacilityTypeGetObject();
          id v37 = v65;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            id v38 = "iMessage Extension: Activation options for SMS/iMessage are same as what was configured.";
LABEL_24:
            _os_log_impl(&dword_19F450000, v36, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
          }
        }
        else
        {
          [v63 setActivationOptions:v24];
          id v36 = PKLogFacilityTypeGetObject();
          id v37 = v65;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            id v38 = "iMessage Extension: Activation options for SMS/iMessage are different then what was configured, switching.";
            goto LABEL_24;
          }
        }
        id v23 = v32;
        v16 = v63;
        v41 = v64;

        id v15 = v68;
        v71((uint64_t)v68, 0);
        goto LABEL_36;
      }
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v42, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Prompting user to upgrade security for SMS/iMessage", buf, 2u);
    }

    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v76 = 3221225472;
    id v77 = __161__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageRequiresSecurityUpgradeToRecipient_isRecipientKnownContact_willSendOverSMS_invitation_completion___block_invoke_103;
    id v78 = &unk_1E59CF8D8;
    v16 = v63;
    id v79 = v63;
    id v80 = v24;
    id v81 = v68;
    v59 = _Block_copy(buf);
    id v57 = objc_loadWeakRetained((id *)(v9 + 40));
    id v37 = v65;
    v61 = v23;
    if (v10)
    {
      uint64_t v47 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_14.isa);
      id v55 = [v13 pass];
      PKLocalizationKeyForPassType();
      v53 = (NSString *)objc_claimAutoreleasedReturnValue();
      v48 = PKLocalizedShareableCredentialString(v53);
      v49 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_16.isa);
      v50 = @"SHAREABLE_MESSAGES_UPGRADE_SECURITY_SMS_BODY_PROCEED_ANYWAY_BUTTON";
    }
    else
    {
      uint64_t v47 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_18.isa);
      id v55 = [v13 pass];
      PKLocalizationKeyForPassType();
      v53 = (NSString *)objc_claimAutoreleasedReturnValue();
      v48 = PKLocalizedShareableCredentialString(v53);
      v49 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_12.isa);
      v50 = @"SHAREABLE_MESSAGES_UPGRADE_SECURITY_BODY_DOWNGRADE_SECURITY_BUTTON";
    }
    v51 = PKLocalizedShareableCredentialString(&v50->isa);
    id v52 = (void *)v47;
    [v57 showAlertWithTitle:v47 message:v48 button:v49 destructiveButton:v51 completion:v59];
    v41 = v64;

    id v15 = v68;
    id v23 = v61;
    goto LABEL_36;
  }
LABEL_37:
}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)MEMORY[0x1E4F85000];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_6;
  v21[3] = &unk_1E59D52A0;
  uint64_t v23 = *(void *)(a1 + 56);
  objc_copyWeak(&v24, (id *)(a1 + 64));
  id v22 = *(id *)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_7;
  v16[3] = &unk_1E59D52C8;
  objc_copyWeak(&v20, (id *)(a1 + 64));
  uint64_t v19 = *(void *)(a1 + 56);
  id v13 = v9;
  id v18 = v13;
  id v14 = v8;
  id v17 = v14;
  id v15 = (id)[v10 authorizeForRequest:v11 presentationSceneIdentifier:v12 authHandler:v21 completion:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v24);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  -[PKSharingMessageExtensionRelayServerPresenter _createShareFromInvite:externalizedAuth:completion:](WeakRetained, *(void **)(a1 + 32), v7, v6);
}

- (void)_createShareFromInvite:(void *)a3 externalizedAuth:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    objc_initWeak(&location, a1);
    int v10 = (void *)a1[1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __100__PKSharingMessageExtensionRelayServerPresenter__createShareFromInvite_externalizedAuth_completion___block_invoke;
    v11[3] = &unk_1E59D5390;
    objc_copyWeak(&v13, &location);
    id v12 = v9;
    [v10 createShareForPartialShareInvitation:v7 authorization:v8 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[PKSharingMessageExtensionRelayServerPresenter _reportAuthenticationEventWithSuccess:]((uint64_t)WeakRetained, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)_reportAuthenticationEventWithSuccess:(uint64_t)a1
{
  if (a1)
  {
    v3 = [*(id *)(a1 + 24) localProperties];
    uint64_t v4 = [v3 partialInvite];
    id v5 = [v3 analyticsSessionToken];
    if (v5)
    {
      id v6 = [PKShareInitiationAnalyticsReporter alloc];
      id v7 = [v4 pass];
      id v8 = [(PKShareInitiationAnalyticsReporter *)v6 initWithPass:v7 sessionToken:v5];
    }
    else
    {
      id v8 = 0;
    }

    [(PKShareInitiationAnalyticsReporter *)v8 sendAuthenticationEventForSuccess:a2 specifics:0];
  }
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)MEMORY[0x1E4F85000];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_9;
  v18[3] = &unk_1E59D52A0;
  uint64_t v20 = *(void *)(a1 + 40);
  objc_copyWeak(&v21, (id *)(a1 + 48));
  id v19 = *(id *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_10;
  v13[3] = &unk_1E59D52C8;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  uint64_t v16 = *(void *)(a1 + 40);
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v10 authorizeDeviceOwnerWithAuthHandler:v18 completion:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  -[PKSharingMessageExtensionRelayServerPresenter _createShareFromInvite:externalizedAuth:completion:](WeakRetained, *(void **)(a1 + 32), v7, v6);
}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[PKSharingMessageExtensionRelayServerPresenter _reportAuthenticationEventWithSuccess:]((uint64_t)WeakRetained, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_12;
  v12[3] = &unk_1E59CA820;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  -[PKSharingMessageExtensionRelayServerPresenter _createShareFromInvite:externalizedAuth:completion:](WeakRetained, v9, 0, v12);
}

uint64_t __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_12(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2 ^ 1u);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_14;
  block[3] = &unk_1E59D5340;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  uint64_t v12 = *(void *)(a1 + 48);
  id v10 = v5;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __96__PKSharingMessageExtensionRelayServerPresenter_validateForRecipients_senderAddress_completion___block_invoke_14(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Recipient doesn't support imessage so sending raw share url.", buf, 2u);
      }

      uint64_t v4 = [WeakRetained[3] phoneMailboxURL];
      uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
    int v7 = [*(id *)(a1 + 32) isCanceled];
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v7)
    {
      if (!v8) {
        goto LABEL_17;
      }
    }
    else if (!v8)
    {
LABEL_16:
      [WeakRetained[3] setLocalProperties:0];
      id v11 = objc_loadWeakRetained(WeakRetained + 5);
      [v11 messageDidUpdate];

LABEL_17:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_18;
    }
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Using override url", v12, 2u);
    }

    [WeakRetained[3] setOverrideURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    goto LABEL_16;
  }
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "iMessage Extension: presenter deallocated", v14, 2u);
  }

LABEL_18:
}

void __100__PKSharingMessageExtensionRelayServerPresenter__createShareFromInvite_externalizedAuth_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__PKSharingMessageExtensionRelayServerPresenter__createShareFromInvite_externalizedAuth_completion___block_invoke_2;
  v9[3] = &unk_1E59D11A8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __100__PKSharingMessageExtensionRelayServerPresenter__createShareFromInvite_externalizedAuth_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3 && !*(void *)(a1 + 40))
    {
      id v6 = [v3 url];
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v6 absoluteString];
        id v14 = PKSharingLoggableMailboxAddress();
        *(_DWORD *)buf = 138543362;
        id v25 = v14;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "iMessage Extension: using share url: %{public}@", buf, 0xCu);
      }
      id v15 = WeakRetained[3];
      uint64_t v23 = v6;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      [v15 setMailboxURLS:v16];

      id v17 = WeakRetained[3];
      id v18 = [*(id *)(a1 + 32) expectedProvisioningCredentialHash];
      [v17 setProvisioningCredentialHash:v18];

      id v19 = WeakRetained[3];
      uint64_t v20 = [*(id *)(a1 + 32) expectedPairedReaderIdentifier];
      [v19 setCarKeyReaderIdentifier:v20];

      id v21 = WeakRetained[3];
      id v22 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_5.isa);
      [v21 setButtonTitle:v22];

      [WeakRetained[3] setActionURL:v6];
    }
    else
    {
      uint64_t v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        id v25 = v5;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Unable to create share with error %@", buf, 0xCu);
      }

      id v6 = PKSharingDisplayableError(*(NSError **)(a1 + 40));
      if (!v6)
      {
        id v7 = [MEMORY[0x1E4F28C58] pkSharingError:7];
        id v6 = PKSharingDisplayableError(v7);
      }
      id v8 = objc_loadWeakRetained(WeakRetained + 5);
      id v9 = PKTitleForDisplayableError();
      id v10 = MEMORY[0x1A6221F20](v6);
      id v11 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa.isa);
      [v8 showAlertWithTitle:v9 message:v10 button:v11];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)didTapMessage
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (![(PKSharingMessageExtensionCommonMessage *)self->_message isPending]
    && ![(PKSharingMessageExtensionCommonMessage *)self->_message isFromMe])
  {
    unint64_t v3 = [(PKSharingMessageExtensionRelayServerMessage *)self->_message status];
    uint64_t v4 = [(PKSharingMessageExtensionRelayServerMessage *)self->_message localProperties];
    id v5 = [v4 passUniqueIdentifier];

    if (PKShareStatusIsPending())
    {
      id v6 = [(PKSharingMessageExtensionRelayServerMessage *)self->_message phoneMailboxURL];
      id v7 = v6;
      if (!v6)
      {
LABEL_21:

LABEL_22:
        return;
      }
      id v8 = (objc_class *)MEMORY[0x1E4F29088];
      id v9 = v6;
      id v10 = (void *)[[v8 alloc] initWithURL:v9 resolvingAgainstBaseURL:0];

      id v11 = [v10 queryItems];
      int v12 = objc_msgSend(v11, "pk_containsObjectPassingTest:", &__block_literal_global_106);

      if (!v12)
      {
        id v22 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v9 resolvingAgainstBaseURL:0];
        uint64_t v23 = [v22 queryItems];
        id v24 = (void *)[v23 mutableCopy];
        id v25 = v24;
        if (v24) {
          id v26 = v24;
        }
        else {
          id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        v29 = v26;

        id v30 = objc_alloc(MEMORY[0x1E4F290C8]);
        uint64_t v31 = (void *)[v30 initWithName:*MEMORY[0x1E4F87FD0] value:*MEMORY[0x1E4F86C98]];
        [v29 addObject:v31];

        [v22 setQueryItems:v29];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
        id v33 = [v22 URL];
        [WeakRetained openAppURL:v33];

        goto LABEL_21;
      }
      if (PKPassbookIsCurrentlyAvailable())
      {
        id v13 = objc_alloc(MEMORY[0x1E4F1CB10]);
        id v14 = NSString;
        id v15 = [v9 absoluteString];
        uint64_t v16 = [v14 stringWithFormat:@"com.apple.Home-private://sharing/%@", v15];
        id v17 = (void *)[v13 initWithString:v16];

        id v18 = objc_loadWeakRetained((id *)&self->_renderer);
        [v18 openAppURL:v17];

        goto LABEL_21;
      }
      id v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [v9 absoluteString];
        v28 = PKSharingLoggableMailboxAddress();
        *(_DWORD *)buf = 138412290;
        int v35 = v28;
        _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Silently failing to present Home URL (%@) as passbook is not available.", buf, 0xCu);
      }
    }
    else
    {
      if (v3 != 1 || !v5) {
        goto LABEL_22;
      }
      if (!PKPassbookIsCurrentlyAvailable())
      {
        id v7 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int v35 = v5;
          _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Silently failing to present Wallet URL for %@ as passbook is not available.", buf, 0xCu);
        }
        goto LABEL_21;
      }
      id v19 = objc_alloc(MEMORY[0x1E4F1CB10]);
      uint64_t v20 = [NSString stringWithFormat:@"wallet://%@/%@", *MEMORY[0x1E4F88048], v5];
      id v7 = [v19 initWithString:v20];

      id v21 = objc_loadWeakRetained((id *)&self->_renderer);
      [v21 openAppURL:v7];
    }

    goto LABEL_21;
  }
}

uint64_t __70__PKSharingMessageExtensionRelayServerPresenter__isMailboxURLForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 name];
  if (PKEqualObjects())
  {
    uint64_t v4 = [v2 value];
    uint64_t v5 = PKEqualObjects();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __115__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageWillBeSentOverSMSToRecipient_invitation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __161__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageRequiresSecurityUpgradeToRecipient_isRecipientKnownContact_willSendOverSMS_invitation_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    unint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "User opted to not send to unknown contact", v5, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __161__PKSharingMessageExtensionRelayServerPresenter__checkIfMessageRequiresSecurityUpgradeToRecipient_isRecipientKnownContact_willSendOverSMS_invitation_completion___block_invoke_103(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"Y";
    if (a2) {
      uint64_t v5 = @"N";
    }
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Upgrading security for SMS/iMessage: %@", (uint8_t *)&v7, 0xCu);
  }

  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) setActivationOptions:*(void *)(a1 + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)propertiesForMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  uint64_t v5 = [v3 title];
  [(PKSharingMessageExtensionViewProperties *)v4 setTitle:v5];

  id v6 = [v3 subtitle];
  [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v6];

  int v7 = [v3 thumbnail];
  [(PKSharingMessageExtensionViewProperties *)v4 setCardImage:v7];

  char v8 = [v3 isFromMe];
  uint64_t v9 = [v3 localProperties];
  uint64_t v10 = [v3 status];

  if ((unint64_t)(v10 - 2) >= 2)
  {
    if (v10 != 1) {
      goto LABEL_8;
    }
    id v11 = @"SHAREABLE_MESSAGES_EXTENSION_BUTTON_TEXT_VIEW";
    goto LABEL_7;
  }
  if ((v8 & 1) == 0 && [v9 hasCheckedStatus])
  {
    id v11 = @"SHAREABLE_MESSAGES_EXTENSION_BUTTON_TEXT_ADD";
LABEL_7:
    int v12 = PKLocalizedShareableCredentialString(&v11->isa);
    [(PKSharingMessageExtensionViewProperties *)v4 setButtonText:v12];
  }
LABEL_8:

  return v4;
}

void __74__PKSharingMessageExtensionRelayServerPresenter__setMessageStatusTo_pass___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = PKShareStatusToString();
    uint64_t v4 = [*(id *)(a1 + 32) uniqueID];
    int v11 = 138412546;
    int v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Updating message status to %@ for pass %@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) setStatus:*(void *)(a1 + 48)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 24) localProperties];
  id v6 = v5;
  if (v5) {
    int v7 = v5;
  }
  else {
    int v7 = objc_alloc_init(PKSharingMessageExtensionRelayServerLocalProperties);
  }
  char v8 = v7;

  [(PKSharingMessageExtensionRelayServerLocalProperties *)v8 setHasCheckedStatus:1];
  uint64_t v9 = [*(id *)(a1 + 32) uniqueID];
  [(PKSharingMessageExtensionRelayServerLocalProperties *)v8 setPassUniqueIdentifier:v9];

  [*(id *)(*(void *)(a1 + 40) + 24) setLocalProperties:v8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  [WeakRetained messageDidUpdate];
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
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);

  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end