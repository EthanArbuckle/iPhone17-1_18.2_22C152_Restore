@interface PKSubcredentialPairingFlowController
+ (id)contextFromPaymentCredential:(id)a3 provisioningController:(id)a4;
+ (id)credentialToShareForContext:(id)a3;
+ (id)sharingRequestForContext:(id)a3 withCredential:(id)a4;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKSubcredentialPairingFlowController)initWithDelegate:(id)a3;
- (PKSubcredentialProvisioningFlowControllerDelegate)delegate;
- (id)alertForOperation:(id)a3 withError:(id)a4 retryHandler:(id)a5 cancelationHandler:(id)a6;
- (id)localDeviceProvisioningViewModelForOperation:(id)a3;
- (id)localizedIssuerNameForProvisioningOperation:(id)a3;
- (id)remoteDeviceProvisioningViewModelForOperation:(id)a3;
- (id)startingViewControllerForContext:(id)a3;
- (void)_handOffToFlowManagerFromOperation:(id)a3 completion:(id)a4;
- (void)canProvisionOnRemoteDeviceWithContext:(id)a3 sharingRequest:(id)a4 completion:(id)a5;
- (void)nextViewControllerFromHeroViewController:(id)a3 completion:(id)a4;
- (void)nextViewControllerFromProvisioningOperation:(id)a3 withCompletion:(id)a4;
- (void)prewarmPairingWithContext:(id)a3 completion:(id)a4;
- (void)provisioningFinishedWithOperation:(id)a3;
- (void)provisioningWasCanceledWithOperation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSetupDelegate:(id)a3;
@end

@implementation PKSubcredentialPairingFlowController

+ (id)contextFromPaymentCredential:(id)a3 provisioningController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PKSubcredentialPairingFlowControllerContext alloc] initWithFlowType:4 referralSource:8];
  v8 = [MEMORY[0x1E4F84D50] sharedService];
  [(PKSubcredentialProvisioningFlowControllerContext *)v7 setLocalDeviceWebService:v8];

  v9 = [v5 webService];
  [(PKSubcredentialProvisioningFlowControllerContext *)v7 setRemoteDeviceWebService:v9];

  v10 = [v6 paymentPass];
  [(PKSubcredentialProvisioningFlowControllerContext *)v7 setProvisionedPass:v10];

  v11 = [v6 credentialToShare];

  [(PKSubcredentialPairingFlowControllerContext *)v7 setCredentialToShare:v11];
  v12 = +[PKSubcredentialPairingFlowController sharingRequestForContext:v7 withCredential:v11];
  [(PKSubcredentialPairingFlowControllerContext *)v7 setRemoteDeviceSharingRequest:v12];

  [(PKSubcredentialPairingFlowControllerContext *)v7 setProvisioningController:v5];

  return v7;
}

- (PKSubcredentialPairingFlowController)initWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSubcredentialPairingFlowController *)self init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)nextViewControllerFromProvisioningOperation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, PKAddCredentialToWatchCompletedViewController *))a4;
  if (!v7) {
    goto LABEL_38;
  }
  v8 = [v6 provisioningContext];
  v9 = (void *)[v8 copy];

  switch([v6 operation])
  {
    case 0:
    case 2:
      v10 = [v9 error];
      v11 = [v10 domain];
      if ([v11 isEqualToString:*MEMORY[0x1E4F87EC8]] && objc_msgSend(v10, "code") == 3)
      {
        char v12 = [v9 passwordManuallyEntered];

        if (v12)
        {
          v13 = off_1E59C5540;
LABEL_9:
          v14 = (PKAddCredentialToWatchCompletedViewController *)[objc_alloc(*v13) initWithFlowController:self context:v9];
          [v9 setError:0];
          v7[2](v7, v14);

          goto LABEL_27;
        }
      }
      else
      {
      }
      v13 = &off_1E59C5548;
      goto LABEL_9;
    case 1:
      [(PKSubcredentialPairingFlowController *)self nextViewControllerFromHeroViewController:v6 completion:v7];
      goto LABEL_37;
    case 3:
      v15 = [v9 error];
      if (v15)
      {
      }
      else
      {
        v22 = [v9 provisionedPass];

        if (v22)
        {
          v21 = PKSubcredentialPairingCompletedViewController;
          goto LABEL_26;
        }
      }
      if (![v9 shouldExitFlowOnError])
      {
        v21 = PKSubcredentialPairingErrorViewController;
LABEL_26:
        v14 = (PKAddCredentialToWatchCompletedViewController *)[[v21 alloc] initWithFlowController:self context:v9];
        v7[2](v7, v14);
        goto LABEL_27;
      }
      v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Exiting flow due to error", (uint8_t *)buf, 2u);
      }

LABEL_17:
      v7[2](v7, 0);
LABEL_37:

LABEL_38:
      return;
    case 4:
      v17 = [(id)objc_opt_class() credentialToShareForContext:v9];
      v18 = [(id)objc_opt_class() sharingRequestForContext:v9 withCredential:v17];
      if (v18)
      {
        v19 = [v9 remoteDeviceWebService];
        if (v19)
        {
          objc_initWeak(buf, self);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __99__PKSubcredentialPairingFlowController_nextViewControllerFromProvisioningOperation_withCompletion___block_invoke;
          v25[3] = &unk_1E59CD5A0;
          objc_copyWeak(&v30, buf);
          id v26 = v9;
          id v27 = v17;
          id v28 = v18;
          v29 = v7;
          [(PKSubcredentialPairingFlowController *)self canProvisionOnRemoteDeviceWithContext:v26 sharingRequest:v28 completion:v25];

          objc_destroyWeak(&v30);
          objc_destroyWeak(buf);
        }
        else
        {
          v24 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "No remote device to accept invitation with", (uint8_t *)buf, 2u);
          }

          v7[2](v7, 0);
        }
      }
      else
      {
        v23 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "No invitation to send to remote device", (uint8_t *)buf, 2u);
        }

        v7[2](v7, 0);
      }

      goto LABEL_37;
    case 5:
      v20 = [v9 provisionedRemotePass];

      if (v20)
      {
        v14 = [[PKAddCredentialToWatchCompletedViewController alloc] initWithFlowController:self context:v9];
        v7[2](v7, v14);
LABEL_27:
      }
      else
      {
        v7[2](v7, 0);
      }
      goto LABEL_37;
    case 6:
      goto LABEL_17;
    default:
      goto LABEL_37;
  }
}

void __99__PKSubcredentialPairingFlowController_nextViewControllerFromProvisioningOperation_withCompletion___block_invoke(id *a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __99__PKSubcredentialPairingFlowController_nextViewControllerFromProvisioningOperation_withCompletion___block_invoke_2;
    v6[3] = &unk_1E59CD578;
    char v12 = a2;
    id v7 = a1[4];
    id v8 = a1[5];
    id v9 = a1[6];
    id v5 = a1[7];
    id v10 = WeakRetained;
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __99__PKSubcredentialPairingFlowController_nextViewControllerFromProvisioningOperation_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 32) setCredentialToShare:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setRemoteDeviceSharingRequest:*(void *)(a1 + 48)];
    uint64_t v2 = *(void *)(a1 + 64);
    id v4 = [[PKAddCredentialToWatchViewController alloc] initWithFlowController:*(void *)(a1 + 56) context:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, PKAddCredentialToWatchViewController *))(v2 + 16))(v2, v4);
  }
  else
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Remote device can't accept invitation", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)nextViewControllerFromHeroViewController:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = [a3 provisioningContext];
  uint64_t v8 = [v7 flowType];
  id v9 = off_1E59C5540;
  switch(v8)
  {
    case 0:
      goto LABEL_7;
    case 2:
      id v10 = [v7 configuration];
      id v11 = [v10 password];
      uint64_t v12 = [v11 length];

      if (v12) {
        id v9 = &off_1E59C5548;
      }
LABEL_7:
      v13 = (void *)[objc_alloc(*v9) initWithFlowController:self context:v7];
      if (v13) {
        goto LABEL_11;
      }
      break;
    case 1:
      id v9 = &off_1E59C5548;
      goto LABEL_7;
  }
  v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Invalid flow type to advance from.", v15, 2u);
  }

  v13 = 0;
LABEL_11:
  if (v6) {
    v6[2](v6, v13);
  }
}

- (void)provisioningFinishedWithOperation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __74__PKSubcredentialPairingFlowController_provisioningFinishedWithOperation___block_invoke;
  id v10 = &unk_1E59CA870;
  id v11 = v4;
  uint64_t v12 = self;
  id v5 = v4;
  id v6 = _Block_copy(&v7);
  -[PKSubcredentialPairingFlowController _handOffToFlowManagerFromOperation:completion:](self, "_handOffToFlowManagerFromOperation:completion:", v5, v6, v7, v8, v9, v10);
}

void __74__PKSubcredentialPairingFlowController_provisioningFinishedWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) provisioningContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = *(void **)(a1 + 32);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 32) operation];
    int v13 = 134217984;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Provisioning was finished on operation: %ld", (uint8_t *)&v13, 0xCu);
  }

  +[PKSubcredentialPairingAnalyticsReporter endSubcredentialPairingSession];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:v4];
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [v2 provisionedPass];
    uint64_t v12 = [v2 error];
    [v9 subcredentialProvisioningFlowController:v10 didFinishWithPass:v11 error:v12];
  }
}

- (void)provisioningWasCanceledWithOperation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = [v4 operation];
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Provisioning was cancelled on operation: %ld", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
    if (objc_opt_respondsToSelector()) {
      [WeakRetained viewControllerDidCancelSetupFlow:v8];
    }
    else {
      [WeakRetained viewControllerDidTerminateSetupFlow:v8];
    }
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 userCanceledPairingWithSubcredentialProvisioningFlowController:self];
  }
}

- (void)_handOffToFlowManagerFromOperation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = [v6 provisioningContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [v7 navigationController];
  int v9 = [v10 provisioningController];
  +[PKHeadUnitPairingFlowBridge startHeadUnitPairingFlowWithContext:v10 navController:v8 provisioningController:v9 completion:v5];
}

- (id)localDeviceProvisioningViewModelForOperation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 provisioningContext];
  id v5 = [v4 configuration];
  if (v5)
  {
    id v27 = [[PKSubcredentialProvisioningViewModel alloc] initWithDelegate:v3];
    id v6 = [(PKSubcredentialProvisioningViewModel *)v27 provisioningController];
    id v26 = v3;
    uint64_t v7 = [v3 pairingSessionWithDelegate:v6];

    id v8 = [v4 localDeviceWebService];
    int v9 = [v8 targetDevice];
    id v10 = [v9 deviceDescriptionForPaymentWebService:v8];

    id v11 = objc_alloc(MEMORY[0x1E4F84590]);
    uint64_t v12 = [v5 issuerIdentifier];
    int v13 = [v5 localizedDescription];
    uint64_t v14 = (void *)[v11 initWithMake:v12 model:v13 keyType:0];

    id v15 = objc_alloc(MEMORY[0x1E4F85088]);
    v16 = [v5 password];
    v17 = [v5 issuerIdentifier];
    v18 = [v5 manufacturerIdentifier];
    id v28 = (void *)v7;
    v19 = objc_msgSend(v15, "initWithSession:pairingPassword:keyName:issuerIdentifier:manufacturerIdentifier:webService:registrationMetadata:radioTechnologies:", v7, v16, v10, v17, v18, v8, v14, objc_msgSend(v5, "supportedRadioTechnologies"));

    v20 = [v4 appEntitlementWhitelist];
    v21 = v20;
    if (v20)
    {
      v22 = [v20 applicationID];
      [v19 setAppIdentifier:v22];
    }
    v23 = v27;
    [(PKSubcredentialProvisioningViewModel *)v27 setConfig:v19];

    id v3 = v26;
  }
  else
  {
    v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Starting provisioning without config?", buf, 2u);
    }

    v23 = 0;
  }

  return v23;
}

- (id)remoteDeviceProvisioningViewModelForOperation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 provisioningContext];
  id v5 = [[PKSubcredentialProvisioningViewModel alloc] initWithDelegate:v3];
  id v6 = [v4 credentialToShare];
  if ([v6 isShareable])
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Configuring remote device provisioning for sharing flow", (uint8_t *)&v21, 2u);
    }

    id v8 = [(PKSubcredentialProvisioningViewModel *)v5 provisioningController];
    int v9 = [v3 sharingSessionWithDelegate:v8];

    id v10 = objc_alloc(MEMORY[0x1E4F85090]);
    id v11 = [v4 remoteDeviceSharingRequest];
    uint64_t v12 = [v4 localDeviceWebService];
    int v13 = [v4 remoteDeviceWebService];
    uint64_t v14 = (void *)[v10 initWithSharingRequest:v11 sharingSession:v9 localDeviceWebService:v12 remoteDeviceWebService:v13 userAuthDelegate:v3];
  }
  else
  {
    uint64_t v15 = [v4 shouldRequestInvitation];
    v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "No";
      if (v15) {
        v17 = "Yes";
      }
      int v21 = 136315138;
      v22 = v17;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Configuring remote device provisioning for accept invite flow (requesting invite: %s)", (uint8_t *)&v21, 0xCu);
    }

    int v9 = [v4 remoteDeviceInvitation];
    id v18 = objc_alloc(MEMORY[0x1E4F85078]);
    uint64_t v19 = [v4 declineRelatedInvitations];
    id v11 = [v4 localDeviceWebService];
    uint64_t v12 = [v4 remoteDeviceWebService];
    uint64_t v14 = (void *)[v18 initWithInvitation:v9 canRequestInvitation:v15 declineRelatedInvitations:v19 localDeviceWebService:v11 remoteDeviceWebService:v12];
  }

  [(PKSubcredentialProvisioningViewModel *)v5 setConfig:v14];

  return v5;
}

- (void)canProvisionOnRemoteDeviceWithContext:(id)a3 sharingRequest:(id)a4 completion:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [v8 localDeviceWebService];
    uint64_t v12 = [v8 remoteDeviceWebService];
    int v13 = [v12 targetDevice];
    if (v12)
    {
      if (v9)
      {
        uint64_t v14 = [v9 credential];
        if ([v14 isShareable])
        {
          if (v13)
          {
            uint64_t v15 = [v8 configuration];
            objc_initWeak(location, self);
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __104__PKSubcredentialPairingFlowController_canProvisionOnRemoteDeviceWithContext_sharingRequest_completion___block_invoke;
            v19[3] = &unk_1E59CD5C8;
            objc_copyWeak(&v26, location);
            id v25 = v10;
            id v20 = v11;
            id v21 = v13;
            id v22 = v9;
            id v23 = v12;
            id v16 = v15;
            id v24 = v16;
            [v21 paymentWebService:v23 canAddSecureElementPassWithConfiguration:v16 completion:v19];

            objc_destroyWeak(&v26);
            objc_destroyWeak(location);

LABEL_19:
            goto LABEL_20;
          }
          id v18 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Target device not found", (uint8_t *)location, 2u);
          }
        }
        else
        {
          id v18 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = v14;
            _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Unable to share credential: %@", (uint8_t *)location, 0xCu);
          }
        }

        (*((void (**)(id, void))v10 + 2))(v10, 0);
        goto LABEL_19;
      }
      v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "No sharing request to check", (uint8_t *)location, 2u);
      }
    }
    else
    {
      v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "No remote device to check if it can accept invitation on", (uint8_t *)location, 2u);
      }
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_20:
  }
}

void __104__PKSubcredentialPairingFlowController_canProvisionOnRemoteDeviceWithContext_sharingRequest_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (WeakRetained)
    {
      uint64_t v7 = [*(id *)(a1 + 32) targetDevice];
      id v8 = [v7 paymentWebService:*(void *)(a1 + 32) supportedRegionFeatureOfType:2];

      id v9 = [v8 ownerSharingOSVersionRequirement];
      id v10 = [*(id *)(a1 + 40) deviceVersion];
      id v11 = [*(id *)(a1 + 40) deviceClass];
      char v12 = [v9 versionMeetsRequirements:v10 deviceClass:v11];

      if (v12)
      {
        int v13 = [*(id *)(a1 + 48) invitations];
        if ([v13 count] == 1)
        {
          uint64_t v14 = [v13 firstObject];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v15 = *(void **)(a1 + 40);
            uint64_t v16 = *(void *)(a1 + 56);
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __104__PKSubcredentialPairingFlowController_canProvisionOnRemoteDeviceWithContext_sharingRequest_completion___block_invoke_74;
            v22[3] = &unk_1E59CC620;
            id v23 = *(id *)(a1 + 72);
            [v15 paymentWebService:v16 canAcceptInvitation:v14 withCompletionV2:v22];
          }
          else
          {
            id v21 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "Unable to check if target device supports invitation", buf, 2u);
            }

            (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
          }
        }
        else
        {
          id v20 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "No invitations no check", buf, 2u);
          }

          (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        }
      }
      else
      {
        uint64_t v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Sharing is not allowed to this device", buf, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
  else
  {
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Device cannot add secure element pass with configuration: %@. Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __104__PKSubcredentialPairingFlowController_canProvisionOnRemoteDeviceWithContext_sharingRequest_completion___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Device can not accept invitation: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prewarmPairingWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F84618];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [v7 configuration];

  id v10 = [v9 manufacturerIdentifier];
  if (!v10)
  {
    id v10 = [v9 issuerIdentifier];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PKSubcredentialPairingFlowController_prewarmPairingWithContext_completion___block_invoke;
  v12[3] = &unk_1E59CC620;
  id v13 = v5;
  id v11 = v5;
  [v8 prewarmWithManufacturerIdentifier:v10 completion:v12];
}

void __77__PKSubcredentialPairingFlowController_prewarmPairingWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__PKSubcredentialPairingFlowController_prewarmPairingWithContext_completion___block_invoke_2;
    v5[3] = &unk_1E59CAD68;
    id v7 = v4;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __77__PKSubcredentialPairingFlowController_prewarmPairingWithContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)sharingRequestForContext:(id)a3 withCredential:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 provisionedPass];
  if (v6)
  {
    if (a4)
    {
      id v7 = [v5 localDeviceWebService];
      id v8 = [v7 targetDevice];
      if (objc_opt_respondsToSelector())
      {
        id v9 = [v5 provisionedPass];
        id v10 = [v9 uniqueID];
        id v11 = [v8 entitlementsForPassIdentifier:v10];

        char v12 = objc_msgSend(v11, "pk_firstObjectPassingTest:", &__block_literal_global_31);
        id v13 = (void *)[objc_alloc(MEMORY[0x1E4F84430]) initWithPaymentPass:v6 entitlements:v11];
        [v13 setEntitlement:v12];
        uint64_t v14 = [v5 remoteDeviceWebService];
        uint64_t v15 = [v14 targetDevice];
        uint64_t v16 = [v15 deviceDescriptionForPaymentWebService:v14];
        [v13 setRecipientName:v16];

        v17 = [v15 deviceIDSIdentifier];
        [v13 setRecipientIdentifier:v17];

        [v13 setForLocalDevice:1];
      }
      else
      {
        id v13 = 0;
      }

      goto LABEL_12;
    }
    uint64_t v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v6 uniqueID];
      int v21 = 138412290;
      id v22 = v19;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Pass (%@) has no credentials to create invitation from", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    uint64_t v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "No pass to create invitation from", (uint8_t *)&v21, 2u);
    }
  }

  id v13 = 0;
LABEL_12:

  return v13;
}

uint64_t __80__PKSubcredentialPairingFlowController_sharingRequestForContext_withCredential___block_invoke(uint64_t a1, void *a2)
{
  return [a2 active];
}

+ (id)credentialToShareForContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 provisionedPass];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "devicePaymentApplications", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) subcredentials];
      id v10 = [v9 anyObject];

      if (v10) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  return v10;
}

- (id)startingViewControllerForContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 flowType];
  if (v5 < 3)
  {
    uint64_t v6 = PKSubcredentialHeroViewController;
LABEL_5:
    uint64_t v7 = (void *)[[v6 alloc] initWithFlowController:self context:v4];
    goto LABEL_6;
  }
  if (v5 - 3 < 2)
  {
    uint64_t v6 = PKAddCredentialToWatchViewController;
    goto LABEL_5;
  }
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v4 flowType];
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Unsupported flow type: %ld", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

- (id)alertForOperation:(id)a3 withError:(id)a4 retryHandler:(id)a5 cancelationHandler:(id)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    v80 = self;
    long long v14 = [v10 provisioningContext];
    long long v15 = [v14 provisionedPass];

    uint64_t v16 = [v10 provisioningContext];
    uint64_t v17 = [v16 credentialToShare];
    uint64_t v18 = v17;
    if (v15) {
      char v19 = [v17 isShareable];
    }
    else {
      char v19 = 1;
    }
    int v21 = [v11 domain];
    v81 = v18;
    v82 = v21;
    if (![v21 isEqualToString:*MEMORY[0x1E4F87EC8]])
    {
      v79 = v16;
      v31 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v21;
        _os_log_impl(&dword_19F450000, v31, OS_LOG_TYPE_DEFAULT, "Unexpected domain to create alert from: %@", buf, 0xCu);
      }
      v32 = 0;
      v33 = 0;
      v83 = 0;
      v84 = 0;
      goto LABEL_64;
    }
    char v77 = v19;
    id v22 = v13;
    id v23 = v12;
    id v24 = [v11 userInfo];
    uint64_t v25 = [v24 objectForKey:*MEMORY[0x1E4F28A50]];
    __int16 v26 = [v25 domain];
    uint64_t v27 = [v25 code];
    if ([v26 isEqualToString:*MEMORY[0x1E4F871A0]])
    {
      uint64_t v28 = [(PKSubcredentialPairingFlowController *)v80 localizedIssuerNameForProvisioningOperation:v10];
      v29 = v22;
      id v20 = PKAlertForSubcredentialDisplayableErrorWithCancelHandler(v25, v28, v22);

      id v30 = v81;
      id v12 = v23;
      id v13 = v29;
LABEL_76:

      goto LABEL_77;
    }
    v76 = v24;
    v79 = v16;
    if ([v26 isEqualToString:*MEMORY[0x1E4F289A0]] && (v27 == -1001 || v27 == -1009))
    {
      v32 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);
      v33 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd_0.isa);
      id v12 = v23;
      if (v23) {
        PKLocalizedString(&cfstr_CancelButtonTi.isa);
      }
      else {
      v84 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
      }
      id v13 = v22;
      v83 = PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);
      if (!v32) {
        goto LABEL_31;
      }
    }
    else
    {
      id v12 = v23;
      if (([v26 isEqualToString:*MEMORY[0x1E4F88098]] & 1) == 0
        && ![v26 isEqualToString:*MEMORY[0x1E4F87C30]])
      {
        v34 = PKSubcredentialProvisioningDisplayableDAError();
        if (v34)
        {
          v35 = v26;
          v36 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v34;
            _os_log_impl(&dword_19F450000, v36, OS_LOG_TYPE_DEFAULT, "Will display DA error: %@", buf, 0xCu);
          }

          v37 = v34;
          uint64_t v11 = v37;
          __int16 v26 = v35;
          id v12 = v23;
        }

        v32 = 0;
        v33 = 0;
        v83 = 0;
        v84 = 0;
        id v13 = v22;
        goto LABEL_31;
      }
      v32 = [v25 localizedFailureReason];
      v33 = [v25 localizedRecoverySuggestion];
      PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
      v84 = v83 = 0;
      id v13 = v22;
      if (!v32)
      {
LABEL_31:
        switch([v11 code])
        {
          case 0:
          case 1:
          case 2:
          case 11:
          case 24:
          case 25:
            goto LABEL_38;
          case 3:
            v50 = [v10 provisioningContext];
            char v51 = [v50 passwordManuallyEntered];

            if (v51) {
              goto LABEL_43;
            }
            v74 = [(PKSubcredentialPairingFlowController *)v80 localizedIssuerNameForProvisioningOperation:v10];
            uint64_t v42 = PKLocalizedCredentialString(&cfstr_CarkeyInvalidP.isa, &stru_1EF1B4C70.isa, v74);

            v73 = @"CARKEY_INVALID_PAIRING_CODE_PROVIDED_BODY";
            goto LABEL_82;
          case 4:
          case 10:
          case 22:
LABEL_43:

            id v20 = 0;
            goto LABEL_75;
          case 5:
          case 7:
          case 8:
          case 9:
            uint64_t v38 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

            v39 = [(PKSubcredentialPairingFlowController *)v80 localizedIssuerNameForProvisioningOperation:v10];
            uint64_t v40 = PKLocalizedCredentialString(&cfstr_CarkeyFailedAd_0.isa, &stru_1EF1B4C70.isa, v39);

            if (v12) {
              PKLocalizedString(&cfstr_CancelButtonTi.isa);
            }
            else {
            uint64_t v47 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
            }

            uint64_t v48 = PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);
            v49 = v83;
            v83 = (void *)v48;
            v33 = (void *)v40;
            v32 = (void *)v38;
            uint64_t v46 = v47;

            goto LABEL_62;
          case 6:
          case 12:
          case 14:
          case 16:
            goto LABEL_35;
          case 13:
          case 15:
            if (v77)
            {
LABEL_35:
              v41 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19F450000, v41, OS_LOG_TYPE_DEFAULT, "Unexpected failure reason", buf, 2u);
              }

LABEL_38:
              uint64_t v42 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

              v43 = [(PKSubcredentialPairingFlowController *)v80 localizedIssuerNameForProvisioningOperation:v10];
              uint64_t v44 = PKLocalizedCredentialString(&cfstr_CarkeyFailedAd.isa, &stru_1EF1B4C70.isa, v43);

              uint64_t v45 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
              v33 = (void *)v44;
            }
            else
            {
              uint64_t v42 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

              v73 = @"CARKEY_INVITATION_NEEDS_RESEND_WATCH";
LABEL_82:
              uint64_t v75 = PKLocalizedCredentialString(&v73->isa);

              uint64_t v45 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
              v33 = (void *)v75;
            }
            v32 = (void *)v42;
            uint64_t v46 = v45;
            goto LABEL_61;
          case 17:
            uint64_t v52 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

            v53 = @"UNABLE_TO_SHARE_NO_TOKENS_BODY_WATCH";
            v54 = @"UNABLE_TO_SHARE_NO_TOKENS_BODY";
            goto LABEL_55;
          case 18:
            uint64_t v52 = PKLocalizedCredentialString(&cfstr_CarkeyBluetoot.isa);

            uint64_t v55 = PKLocalizedCredentialString(&cfstr_CarkeyBluetoot_0.isa);

            uint64_t v46 = PKLocalizedCredentialString(&cfstr_SubcredentialS.isa);

            uint64_t v56 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
            v57 = v83;
            v83 = (void *)v56;
            v84 = v57;
            goto LABEL_60;
          case 19:
            uint64_t v52 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

            uint64_t v55 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd_0.isa);

            uint64_t v58 = PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);

            uint64_t v46 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
            v83 = (void *)v58;
            goto LABEL_60;
          case 20:
            uint64_t v52 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

            v53 = @"CARKEY_DEVICE_NOT_SUPPORTED_WATCH";
            v54 = @"CARKEY_DEVICE_NOT_SUPPORTED";
            goto LABEL_55;
          case 21:
            uint64_t v52 = PKLocalizedPaymentString(&cfstr_OsVersionUpdat.isa);

            if (v15) {
              v59 = @"OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE_WATCH";
            }
            else {
              v59 = @"OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE_IPHONE";
            }
            uint64_t v60 = PKLocalizedPaymentString(&v59->isa);
            goto LABEL_59;
          case 23:
            uint64_t v52 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

            v61 = @"CARKEY_FAILED_ADDING_KEY_BT_LIMIT";
            goto LABEL_58;
          case 26:
            uint64_t v52 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

            v61 = @"CARKEY_NFC_ONLY_NOT_SUPPORTED_ERROR_BODY";
            goto LABEL_58;
          case 27:
            uint64_t v52 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

            v53 = @"CARKEY_CAR_NOT_SUPPORTED_WATCH";
            v54 = @"CARKEY_CAR_NOT_SUPPORTED";
LABEL_55:
            if (v15) {
              v61 = v53;
            }
            else {
              v61 = v54;
            }
LABEL_58:
            uint64_t v60 = PKLocalizedCredentialString(&v61->isa);
LABEL_59:
            uint64_t v55 = v60;

            uint64_t v46 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
LABEL_60:
            v33 = (void *)v55;
            v32 = (void *)v52;
LABEL_61:

LABEL_62:
            v84 = (void *)v46;
            break;
          default:
            goto LABEL_63;
        }
        goto LABEL_63;
      }
    }
    if (v33)
    {
LABEL_63:

      v31 = v76;
LABEL_64:
      v78 = v11;

      if ([v32 length] && objc_msgSend(v33, "length"))
      {
        id v62 = v10;
      }
      else
      {
        uint64_t v63 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);

        id v62 = v10;
        v64 = [(PKSubcredentialPairingFlowController *)v80 localizedIssuerNameForProvisioningOperation:v10];
        uint64_t v65 = PKLocalizedCredentialString(&cfstr_CarkeyFailedAd.isa, &stru_1EF1B4C70.isa, v64);

        uint64_t v66 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);

        v84 = (void *)v66;
        v33 = (void *)v65;
        v32 = (void *)v63;
      }
      id v20 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v32 message:v33 preferredStyle:1];
      if (v13 && v84)
      {
        v67 = (void *)MEMORY[0x1E4FB1410];
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __100__PKSubcredentialPairingFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke;
        v87[3] = &unk_1E59CB150;
        id v88 = v13;
        v68 = [v67 actionWithTitle:v84 style:1 handler:v87];
        [v20 addAction:v68];
      }
      v69 = v83;
      if (v12 && v83)
      {
        v70 = (void *)MEMORY[0x1E4FB1410];
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __100__PKSubcredentialPairingFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke_2;
        v85[3] = &unk_1E59CB150;
        id v86 = v12;
        v71 = [v70 actionWithTitle:v83 style:0 handler:v85];
        [v20 addAction:v71];

        v69 = v83;
      }

      id v10 = v62;
      uint64_t v11 = v78;
LABEL_75:
      uint64_t v16 = v79;
      id v30 = v81;
      goto LABEL_76;
    }
    goto LABEL_31;
  }
  uint64_t v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Unable to create valid alert, no error set", buf, 2u);
  }
  id v20 = 0;
LABEL_77:

  return v20;
}

uint64_t __100__PKSubcredentialPairingFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__PKSubcredentialPairingFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)localizedIssuerNameForProvisioningOperation:(id)a3
{
  id v3 = [a3 provisioningContext];
  id v4 = [v3 configuration];
  unint64_t v5 = [v4 issuerIdentifier];

  uint64_t v6 = [v3 localDeviceWebService];
  uint64_t v7 = [v6 targetDevice];
  uint64_t v8 = [v7 paymentWebService:v6 supportedRegionFeatureOfType:2];

  id v9 = [v8 localizedNameForIssuerWithIdentifier:v5];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_GenericPartner.isa);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;

  return v12;
}

- (PKSubcredentialProvisioningFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSubcredentialProvisioningFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end