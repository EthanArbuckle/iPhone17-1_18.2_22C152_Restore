@interface PKSubcredentialInvitationFlowController
+ (BOOL)isPassPersonalizedOrPersonalizing:(id)a3;
+ (id)localDevicePassMatchingPairedTerminalIdentifier:(id)a3;
+ (void)canAttemptLocalDeviceProvisioningWithContext:(id)a3 completion:(id)a4;
+ (void)canAttemptRemoteDeviceProvisioningWithContext:(id)a3 completion:(id)a4;
- (PKSubcredentialInvitationFlowController)initWithDelegate:(id)a3;
- (PKSubcredentialProvisioningFlowControllerDelegate)delegate;
- (id)alertForOperation:(id)a3 withError:(id)a4 retryHandler:(id)a5 cancelationHandler:(id)a6;
- (id)localDeviceProvisioningViewModelForOperation:(id)a3;
- (id)localizedIssuerNameForProvisioningOperation:(id)a3;
- (id)remoteDeviceProvisioningViewModelForOperation:(id)a3;
- (void)_handOffToFlowManagerFromOperation:(id)a3 completion:(id)a4;
- (void)nextViewControllerFromProvisioningOperation:(id)a3 withCompletion:(id)a4;
- (void)provisioningFinishedWithOperation:(id)a3;
- (void)provisioningWasCanceledWithOperation:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKSubcredentialInvitationFlowController

- (PKSubcredentialInvitationFlowController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(PKSubcredentialInvitationFlowController *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)nextViewControllerFromProvisioningOperation:(id)a3 withCompletion:(id)a4
{
  id v20 = a3;
  v6 = (void (**)(id, void))a4;
  if (v6)
  {
    v7 = [v20 provisioningContext];
    v8 = [v7 provisionedPass];

    uint64_t v9 = [v20 operation];
    if (v9 == 2)
    {
LABEL_16:
      v6[2](v6, 0);
      goto LABEL_17;
    }
    if (v9 == 1)
    {
LABEL_13:
      if (v8)
      {
        v18 = [PKSubcredentialInvitationAcceptedViewController alloc];
        v12 = [v20 provisioningContext];
        v19 = [(PKSubcredentialInvitationAcceptedViewController *)v18 initWithFlowController:self context:v12];
        ((void (**)(id, PKSubcredentialInvitationAcceptedViewController *))v6)[2](v6, v19);

        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if (v9) {
      goto LABEL_17;
    }
    v10 = [v20 provisioningContext];
    v11 = [v10 localDeviceInvitation];
    v12 = [v11 originalInvitationMessage];

    v13 = [v12 activationOptions];
    if ([v13 containsOptionOfType:3])
    {
      int v14 = 0;
      if (!v8) {
        goto LABEL_12;
      }
    }
    else
    {
      int v14 = [v13 containsOptionOfType:2] ^ 1;
      if (!v8)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    if (!v14)
    {
      v15 = [PKSubcredentialInvitationActivationViewController alloc];
      v16 = [v20 provisioningContext];
      v17 = [(PKSubcredentialInvitationActivationViewController *)v15 initWithFlowController:self context:v16];
      ((void (**)(id, PKSubcredentialInvitationActivationViewController *))v6)[2](v6, v17);

LABEL_15:
      goto LABEL_17;
    }
    goto LABEL_12;
  }
LABEL_17:
}

- (void)provisioningFinishedWithOperation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PKSubcredentialInvitationFlowController_provisioningFinishedWithOperation___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(PKSubcredentialInvitationFlowController *)self _handOffToFlowManagerFromOperation:v5 completion:v6];
}

void __77__PKSubcredentialInvitationFlowController_provisioningFinishedWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) provisioningContext];
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) operation];
    int v9 = 134217984;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Provisioning was finished on operation: %ld", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [v2 provisionedPass];
  v8 = [v2 error];
  [WeakRetained subcredentialProvisioningFlowController:v6 didFinishWithPass:v7 error:v8];
}

- (void)provisioningWasCanceledWithOperation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = [a3 operation];
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Provisioning was cancelled on operation: %ld", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userCanceledPairingWithSubcredentialProvisioningFlowController:self];
}

- (void)_handOffToFlowManagerFromOperation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v6 provisioningContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  uint64_t v8 = [v7 navigationController];
  +[PKHeadUnitPairingFlowBridge startHeadUnitPairingFlowWithContext:v9 navController:v8 provisioningController:0 completion:v5];
}

- (id)localDeviceProvisioningViewModelForOperation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 provisioningContext];
  id v5 = [v4 localDeviceInvitation];
  id v6 = [[PKSubcredentialProvisioningViewModel alloc] initWithDelegate:v3];
  BOOL v7 = [v5 type] != 1;
  uint64_t v8 = [(PKSubcredentialProvisioningViewModel *)v6 provisioningController];
  id v9 = [v3 sharingSessionWithDelegate:v8 startSession:v7];

  id v10 = objc_alloc(MEMORY[0x1E4F85070]);
  uint64_t v11 = [v4 acceptRemoteDeviceInvitation] ^ 1;
  v12 = [v4 localDeviceWebService];
  v13 = [v4 remoteDeviceWebService];
  int v14 = (void *)[v10 initWithSession:v9 invitation:v5 metadata:0 declineRelatedInvitations:v11 localDeviceWebService:v12 remoteDeviceWebService:v13];

  [(PKSubcredentialProvisioningViewModel *)v6 setConfig:v14];

  return v6;
}

- (id)remoteDeviceProvisioningViewModelForOperation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 provisioningContext];
  id v5 = [[PKSubcredentialProvisioningViewModel alloc] initWithDelegate:v3];

  id v6 = objc_alloc(MEMORY[0x1E4F85078]);
  BOOL v7 = [v4 remoteDeviceInvitation];
  uint64_t v8 = [v4 acceptLocalDeviceInvitation] ^ 1;
  id v9 = [v4 localDeviceWebService];
  id v10 = [v4 remoteDeviceWebService];
  uint64_t v11 = (void *)[v6 initWithInvitation:v7 canRequestInvitation:0 declineRelatedInvitations:v8 localDeviceWebService:v9 remoteDeviceWebService:v10];

  [(PKSubcredentialProvisioningViewModel *)v5 setConfig:v11];

  return v5;
}

- (id)alertForOperation:(id)a3 withError:(id)a4 retryHandler:(id)a5 cancelationHandler:(id)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    int v14 = [v10 provisioningContext];
    v15 = [v14 provisionedPass];

    v78 = [v11 domain];
    if (![v78 isEqualToString:*MEMORY[0x1E4F87EC8]])
    {
      v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v78;
        _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "Unexpected domain to create alert from: %@", buf, 0xCu);
      }

      v22 = 0;
      id v20 = 0;
      v79 = 0;
      v80 = 0;
      goto LABEL_12;
    }
    id v75 = v12;
    v73 = [v11 userInfo];
    v74 = [v73 objectForKey:*MEMORY[0x1E4F28A50]];
    v76 = [(NSError *)v74 domain];
    uint64_t v16 = [(NSError *)v74 code];
    BOOL v85 = 0;
    uint64_t v17 = PKSharingDisplayableError(v74, &v85);
    v72 = (void *)v17;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = PKTitleForDisplayableError();
      id v20 = MEMORY[0x1A6221F20](v18);
      v77 = (void *)v19;
      if (v85)
      {
        v79 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
        v80 = 0;
      }
      else
      {
        PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);
        v80 = v79 = 0;
      }
    }
    else
    {
      v79 = 0;
      v80 = 0;
      id v20 = 0;
      v77 = 0;
    }
    v42 = v76;
    LODWORD(v43) = [v76 isEqualToString:*MEMORY[0x1E4F871A0]];
    v71 = self;
    if (v43)
    {
      v44 = [(PKSubcredentialInvitationFlowController *)self localizedIssuerNameForProvisioningOperation:v10];
      v45 = v74;
      v15 = PKAlertForSubcredentialDisplayableErrorWithCancelHandler(v74, v44, v13);

      int v46 = 1;
      goto LABEL_52;
    }
    if ([v76 isEqualToString:*MEMORY[0x1E4F289A0]] && (v16 == -1001 || v16 == -1009))
    {
      v47 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

      uint64_t v48 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd_0.isa);

      if (v12) {
        PKLocalizedString(&cfstr_CancelButtonTi.isa);
      }
      else {
      uint64_t v54 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
      }

      PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);
      v50 = v80;
      v80 = v79 = v54;
      id v20 = (void *)v48;
      self = v71;
    }
    else
    {
      if (([v76 isEqualToString:*MEMORY[0x1E4F88098]] & 1) == 0
        && ![v76 isEqualToString:*MEMORY[0x1E4F87C30]])
      {
        uint64_t v51 = PKSubcredentialProvisioningDisplayableDAError();
        if (v51)
        {
          v52 = (void *)v51;
          v53 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v87 = v52;
            _os_log_impl(&dword_19F450000, v53, OS_LOG_TYPE_DEFAULT, "Will display DA error: %@", buf, 0xCu);
          }

          v50 = v52;
          uint64_t v11 = v50;
        }
        else
        {
          v50 = 0;
        }
        v47 = v77;
        goto LABEL_43;
      }
      v47 = [(NSError *)v74 localizedFailureReason];

      uint64_t v49 = [(NSError *)v74 localizedRecoverySuggestion];

      PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
      v79 = v50 = v79;
      id v20 = (void *)v49;
    }
    LOBYTE(v43) = 0;
LABEL_43:

    v42 = v76;
    v77 = v47;
    if (!v47 || !v20)
    {
      switch([v11 code])
      {
        case 0:
        case 1:
        case 16:
        case 24:
        case 25:
          v15 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v56 = [(PKSubcredentialInvitationFlowController *)self localizedIssuerNameForProvisioningOperation:v10];
          uint64_t v43 = PKLocalizedCredentialString(&cfstr_CarkeyFailedAd.isa, &stru_1EF1B4C70.isa, v56);

          uint64_t v57 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);

          int v46 = 1;
          v79 = v57;
          v42 = v76;
          id v20 = (void *)v43;
          LOBYTE(v43) = 0;
          goto LABEL_81;
        case 2:
        case 3:
        case 4:
        case 6:
        case 10:
        case 14:
        case 17:
        case 18:
          v15 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_49;
          }
          *(_WORD *)buf = 0;
          goto LABEL_48;
        case 5:
        case 7:
        case 8:
        case 9:
          uint64_t v58 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v59 = [(PKSubcredentialInvitationFlowController *)self localizedIssuerNameForProvisioningOperation:v10];
          v15 = PKLocalizedCredentialString(&cfstr_CarkeyFailedAd_0.isa, &stru_1EF1B4C70.isa, v59);

          if (v75) {
            PKLocalizedString(&cfstr_CancelButtonTi.isa);
          }
          else {
          uint64_t v43 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
          }

          uint64_t v63 = PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);

          int v46 = 1;
          v79 = v43;
          v80 = v63;
          id v20 = v15;
          v77 = (void *)v58;
          v45 = v74;
          v42 = v76;
          LOBYTE(v43) = 0;
          goto LABEL_52;
        case 11:
          uint64_t v60 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v61 = @"CARKEY_KEY_ALREADY_EXISTS_BODY_WATCH";
          v62 = @"CARKEY_KEY_ALREADY_EXISTS_BODY";
          goto LABEL_84;
        case 12:
        case 15:
          uint64_t v60 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v61 = @"CARKEY_INVITATION_NEEDS_RESEND_WATCH";
          v62 = @"CARKEY_INVITATION_EXPIRED";
          goto LABEL_84;
        case 13:
          if (v15)
          {
            v15 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

            v64 = @"CARKEY_INVITATION_NEEDS_RESEND_WATCH";
LABEL_80:
            uint64_t v69 = PKLocalizedCredentialString(&v64->isa);

            uint64_t v43 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);

            int v46 = 1;
            v79 = v43;
            LOBYTE(v43) = 0;
            id v20 = (void *)v69;
            v42 = v76;
LABEL_81:
            v77 = v15;
            goto LABEL_51;
          }
          v15 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
LABEL_48:
            _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected failure reason", buf, 2u);
          }
LABEL_49:

          break;
        case 19:
          uint64_t v65 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v15 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd_0.isa);

          uint64_t v43 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);

          uint64_t v66 = PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);

          int v46 = 1;
          v79 = v43;
          v80 = v66;
          LOBYTE(v43) = 0;
          id v20 = v15;
          v77 = (void *)v65;
          v42 = v76;
          goto LABEL_51;
        case 20:
          uint64_t v60 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v61 = @"CARKEY_DEVICE_NOT_SUPPORTED_WATCH";
          v62 = @"CARKEY_DEVICE_NOT_SUPPORTED";
          goto LABEL_84;
        case 21:
          uint64_t v60 = PKLocalizedPaymentString(&cfstr_OsVersionUpdat.isa);

          if (v15) {
            v67 = @"OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE_WATCH";
          }
          else {
            v67 = @"OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE_IPHONE";
          }
          uint64_t v68 = PKLocalizedPaymentString(&v67->isa);
          goto LABEL_88;
        case 22:
          int v46 = 0;
          goto LABEL_51;
        case 23:
          v15 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v64 = @"CARKEY_FAILED_ADDING_KEY_BT_LIMIT";
          goto LABEL_80;
        case 26:
          uint64_t v60 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v61 = @"CARKEY_NFC_ONLY_NOT_SUPPORTED_ERROR_BODY_WATCH";
          v62 = @"CARKEY_NFC_ONLY_NOT_SUPPORTED_ERROR_BODY";
          goto LABEL_84;
        case 27:
          uint64_t v60 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v61 = @"CARKEY_CAR_NOT_SUPPORTED_WATCH";
          v62 = @"CARKEY_CAR_NOT_SUPPORTED";
LABEL_84:
          if (v15) {
            p_isa = &v61->isa;
          }
          else {
            p_isa = &v62->isa;
          }
          uint64_t v68 = PKLocalizedCredentialString(p_isa);
LABEL_88:
          v15 = v68;

          uint64_t v43 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);

          int v46 = 1;
          v79 = v43;
          LOBYTE(v43) = 0;
          id v20 = v15;
          v77 = (void *)v60;
          v42 = v76;
          goto LABEL_51;
        default:
          break;
      }
    }
    int v46 = 1;
LABEL_51:
    v45 = v74;
LABEL_52:

    if ((v43 & 1) == 0)
    {
      if (v46)
      {
        self = v71;
        v22 = v77;
        id v12 = v75;
LABEL_12:
        if ([v22 length] && objc_msgSend(v20, "length"))
        {
          v23 = v79;
        }
        else
        {
          uint64_t v24 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

          v25 = [(PKSubcredentialInvitationFlowController *)self localizedIssuerNameForProvisioningOperation:v10];
          uint64_t v26 = PKLocalizedCredentialString(&cfstr_CarkeyFailedAd.isa, &stru_1EF1B4C70.isa, v25);

          uint64_t v27 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);

          v23 = (void *)v27;
          id v20 = (void *)v26;
          v22 = (void *)v24;
        }
        v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v22 message:v20 preferredStyle:1];
        if (v13 && v23)
        {
          v28 = (void *)MEMORY[0x1E4FB1410];
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __103__PKSubcredentialInvitationFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke;
          v83[3] = &unk_1E59CB150;
          id v84 = v13;
          v29 = [v28 actionWithTitle:v23 style:1 handler:v83];
          [v15 addAction:v29];
        }
        if (v12)
        {
          v30 = v23;
          id v31 = v10;
          id v32 = v13;
          v33 = v12;
          if (v80)
          {
            v34 = v22;
            v35 = v11;
            v36 = v20;
            v37 = (void *)MEMORY[0x1E4FB1410];
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __103__PKSubcredentialInvitationFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke_2;
            v81[3] = &unk_1E59CB150;
            v38 = v33;
            id v82 = v33;
            v39 = v38;
            v40 = [v37 actionWithTitle:v80 style:0 handler:v81];
            [v15 addAction:v40];

            id v20 = v36;
            uint64_t v11 = v35;
            v22 = v34;
            id v12 = v39;
          }
          id v13 = v32;
          id v10 = v31;
          v23 = v30;
        }
        v41 = v78;
        goto LABEL_57;
      }
      v15 = 0;
    }
    v41 = v78;
    v23 = v79;
    v22 = v77;
    id v12 = v75;
LABEL_57:

    goto LABEL_58;
  }
  uint64_t v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Unable to create valid alert, no error set", buf, 2u);
  }
  v15 = 0;
LABEL_58:

  return v15;
}

uint64_t __103__PKSubcredentialInvitationFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__PKSubcredentialInvitationFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)localizedIssuerNameForProvisioningOperation:(id)a3
{
  id v3 = [a3 provisioningContext];
  uint64_t v4 = [v3 localDeviceInvitation];
  id v5 = [v4 issuer];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_GenericPartner.isa);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  return v8;
}

+ (void)canAttemptLocalDeviceProvisioningWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void))a4;
  if (v6)
  {
    uint64_t v11 = v6;
    id v7 = [a3 localDeviceInvitation];
    if ([v7 isThirdPartyCrossPlatformInvitation])
    {
      v11[2](v11, 1, 0);
    }
    else
    {
      [v7 supportedRadioTechnologies];
      if (PKRadioTechnologyForConfigurationTechnology())
      {
        uint64_t v8 = [v7 pairedReaderIdentifier];
        id v9 = [a1 localDevicePassMatchingPairedTerminalIdentifier:v8];
        if (v9 && [a1 isPassPersonalizedOrPersonalizing:v9])
        {
          id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87EC8] code:11 userInfo:0];
          ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v10);
        }
        else
        {
          v11[2](v11, 1, 0);
        }
      }
      else
      {
        uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87EC8] code:20 userInfo:0];
        ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v8);
      }
    }
    id v6 = v11;
  }
}

+ (void)canAttemptRemoteDeviceProvisioningWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 remoteDeviceWebService];
    uint64_t v8 = [v7 targetDevice];
    if (v8)
    {
      id v9 = [v5 remoteDeviceInvitation];
      id v10 = [v9 addCarKeyPassConfiguration];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __100__PKSubcredentialInvitationFlowController_canAttemptRemoteDeviceProvisioningWithContext_completion___block_invoke;
      v13[3] = &unk_1E59D35F0;
      id v14 = v7;
      id v15 = v8;
      id v18 = v6;
      id v16 = v5;
      id v17 = v10;
      id v11 = v10;
      [v15 paymentWebService:v14 canAddSecureElementPassWithConfiguration:v11 completion:v13];
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Target device not found", buf, 2u);
      }

      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

void __100__PKSubcredentialInvitationFlowController_canAttemptRemoteDeviceProvisioningWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) targetDevice];
    id v7 = [v6 paymentWebService:*(void *)(a1 + 32) supportedRegionFeatureOfType:2];

    uint64_t v8 = [v7 friendSharingOSVersionRequirement];
    id v9 = [*(id *)(a1 + 40) deviceVersion];
    id v10 = [*(id *)(a1 + 40) deviceClass];
    char v11 = [v8 versionMeetsRequirements:v9 deviceClass:v10];

    if (v11)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = *(void *)(a1 + 32);
        id v12 = *(void **)(a1 + 40);
        id v14 = [*(id *)(a1 + 48) remoteDeviceInvitation];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __100__PKSubcredentialInvitationFlowController_canAttemptRemoteDeviceProvisioningWithContext_completion___block_invoke_132;
        v21[3] = &unk_1E59CC620;
        id v22 = *(id *)(a1 + 64);
        [v12 paymentWebService:v13 canAcceptInvitation:v14 withCompletionV2:v21];
      }
      else
      {
        id v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Unable to check if remote device can accept invite", buf, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
    else
    {
      id v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Sharing is not supported to remote device", buf, 2u);
      }

      uint64_t v18 = *(void *)(a1 + 64);
      uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87EC8] code:20 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
    }
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Device cannot add secure element pass with configuration: %@. Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __100__PKSubcredentialInvitationFlowController_canAttemptRemoteDeviceProvisioningWithContext_completion___block_invoke_132(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Remote device cannot accept invite: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)localDevicePassMatchingPairedTerminalIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(MEMORY[0x1E4F84898]);
    [v4 passesOfType:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "secureElementPass", (void)v14);
          char v11 = [v10 pairedTerminalIdentifier];
          int v12 = [v11 isEqualToString:v3];

          if (v12)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Unable to find pass matching an unspecified paired terminal identifier.", buf, 2u);
    }
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)isPassPersonalizedOrPersonalizing:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isDevicePrimaryPaymentApplicationPersonalized];
  uint64_t v5 = [v3 effectiveContactlessPaymentApplicationState];

  if (v5 == 2) {
    return 1;
  }
  else {
    return v4;
  }
}

- (PKSubcredentialProvisioningFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSubcredentialProvisioningFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end