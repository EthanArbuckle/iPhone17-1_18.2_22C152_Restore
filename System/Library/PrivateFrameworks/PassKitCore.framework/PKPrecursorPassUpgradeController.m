@interface PKPrecursorPassUpgradeController
- (BOOL)_updateActiveProofingConfigureFrom:(id)a3;
- (NSArray)devicePrecursorRequests;
- (PKPassUpgradePrecursorPassRequest)devicePrimaryPrecursorRequest;
- (PKPrecursorPassUpgradeController)init;
- (PKPrecursorPassUpgradeController)initWithPass:(id)a3 webService:(id)a4;
- (PKPrecursorPassUpgradeControllerDelegate)delegate;
- (void)_carKeyDescriptionFor:(id)a3 completion:(id)a4;
- (void)_fetchProofingStatusWithCompletion:(id)a3;
- (void)_genericReProvisionDescriptionFor:(id)a3 completion:(id)a4;
- (void)_issuerAppDescriptionFor:(id)a3 completion:(id)a4;
- (void)_loadConfigurationIfNeeded;
- (void)_proofingDescriptionFor:(id)a3 completion:(id)a4;
- (void)mockIdentityPrecursorPassUpgradeRequestDescriptions:(id)a3;
- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4;
- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4;
- (void)reloadPrecursorRequests;
- (void)requestDescriptionFor:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PKPrecursorPassUpgradeController

- (PKPrecursorPassUpgradeController)init
{
  return 0;
}

- (PKPrecursorPassUpgradeController)initWithPass:(id)a3 webService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPrecursorPassUpgradeController;
  v9 = [(PKPrecursorPassUpgradeController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    objc_storeStrong((id *)&v10->_webService, a4);
  }

  return v10;
}

- (void)_loadConfigurationIfNeeded
{
  if (!self->_hasLoadedConfiguration)
  {
    self->_hasLoadedConfiguration = 1;
    id v9 = [(PKPaymentWebService *)self->_webService targetDevice];
    v3 = [v9 secureElementIdentifiers];
    seids = self->_seids;
    self->_seids = v3;

    v5 = [v9 deviceClass];
    deviceClass = self->_deviceClass;
    self->_deviceClass = v5;

    id v7 = [v9 deviceVersion];
    deviceVersion = self->_deviceVersion;
    self->_deviceVersion = v7;
  }
}

- (NSArray)devicePrecursorRequests
{
  [(PKPrecursorPassUpgradeController *)self _loadConfigurationIfNeeded];
  pass = self->_pass;
  seids = self->_seids;
  deviceClass = self->_deviceClass;
  deviceVersion = self->_deviceVersion;
  return (NSArray *)[(PKSecureElementPass *)pass precursorUpgradeRequestsForDeviceSEIDs:seids deviceClass:deviceClass deviceVersion:deviceVersion];
}

- (PKPassUpgradePrecursorPassRequest)devicePrimaryPrecursorRequest
{
  v2 = [(PKPrecursorPassUpgradeController *)self devicePrecursorRequests];
  v3 = [v2 firstObject];

  return (PKPassUpgradePrecursorPassRequest *)v3;
}

- (void)requestDescriptionFor:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  v6 = [a3 actions];
  id v7 = [v6 firstObject];

  if (a3 && v7)
  {
    switch([v7 type])
    {
      case 1:
        [(PKPrecursorPassUpgradeController *)self _proofingDescriptionFor:v7 completion:v8];
        break;
      case 2:
        [(PKPrecursorPassUpgradeController *)self _carKeyDescriptionFor:v7 completion:v8];
        break;
      case 3:
        [(PKPrecursorPassUpgradeController *)self _genericReProvisionDescriptionFor:v7 completion:v8];
        break;
      case 4:
        [(PKPrecursorPassUpgradeController *)self _issuerAppDescriptionFor:v7 completion:v8];
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8[2](v8, 0);
  }
}

- (void)_proofingDescriptionFor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PKPrecursorPassUpgradeController__proofingDescriptionFor_completion___block_invoke;
  v10[3] = &unk_1E56D9290;
  id v11 = v6;
  objc_super v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPrecursorPassUpgradeController *)self _fetchProofingStatusWithCompletion:v10];
}

void __71__PKPrecursorPassUpgradeController__proofingDescriptionFor_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = PKLogFacilityTypeGetObject(0x26uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 134218242;
    uint64_t v18 = a2;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: showing description for status: %lu, action: %@", buf, 0x16u);
  }

  id v6 = [*(id *)(a1[5] + 8) organizationName];
  id v7 = 0;
  id v8 = 0;
  id v9 = 0;
  switch(a2)
  {
    case 0:
    case 3:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_10.isa, 0);
      unint64_t v11 = [*(id *)(a1[5] + 8) identityType];
      id v9 = 0;
      if (v11 <= 3)
      {
        id v9 = PKLocalizedIdentityString(&off_1E56F6E40[v11]->isa, 0);
      }
      objc_super v12 = @"CARD_TYPE_IDENTITY_NO_STATUS_ACTION_TEXT";
      goto LABEL_21;
    case 1:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_0.isa, 0);
      id v9 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_16.isa, &stru_1EE105568.isa, v6, v6);
      id v7 = [*(id *)(a1[5] + 64) learnMoreURL];
      id v8 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_17.isa, 0);
      uint64_t v14 = 4;
      if (!v10) {
        goto LABEL_26;
      }
      goto LABEL_22;
    case 2:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti.isa, 0);
      id v9 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_15.isa, 0);
      goto LABEL_25;
    case 5:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_2.isa, 0);
      id v9 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_18.isa, &stru_1EE0F6808.isa, v6);
      objc_super v12 = @"CARD_TYPE_IDENTITY_AUTH_CODE_ACTION_TEXT";
      goto LABEL_21;
    case 6:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_4.isa, 0);
      id v9 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_22.isa, &stru_1EE0F6808.isa, v6);
      id v13 = @"CARD_TYPE_IDENTITY_RETRY_ADDING_ACTION_TEXT";
      goto LABEL_13;
    case 7:
    case 9:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_5.isa, 0);
      id v9 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_26.isa, &stru_1EE0F6808.isa, v6);
      id v13 = @"CARD_TYPE_IDENTITY_UNABLE_TO_ADD_ACTION_TEXT";
LABEL_13:
      id v8 = PKLocalizedIdentityString(&v13->isa, 0);
      id v7 = 0;
      uint64_t v14 = 3;
      if (!v10) {
        goto LABEL_26;
      }
      goto LABEL_22;
    case 8:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_6.isa, 0);
      id v9 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_24.isa, &stru_1EE0F6808.isa, v6);
      id v8 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_25.isa, 0);
      id v7 = 0;
      uint64_t v14 = 2;
      if (!v10) {
        goto LABEL_26;
      }
      goto LABEL_22;
    case 10:
      if (PKUseWLAN()) {
        v15 = @"CARD_TYPE_IDENTITY_WAITING_WLAN";
      }
      else {
        v15 = @"CARD_TYPE_IDENTITY_WAITING_WIFI";
      }
      v10 = PKLocalizedIdentityString(&v15->isa, 0);
      id v9 = 0;
LABEL_25:
      id v8 = 0;
      uint64_t v14 = 0;
      id v7 = 0;
      if (!v10) {
        goto LABEL_26;
      }
      goto LABEL_22;
    case 11:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_3.isa, 0);
      id v9 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_20.isa, &stru_1EE0F6808.isa, v6);
      objc_super v12 = @"CARD_TYPE_IDENTITY_RETRY_AUTH_CODE_ACTION_TEXT";
      goto LABEL_21;
    case 12:
      v10 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_28.isa, 0);
      id v9 = PKLocalizedIdentityString(&cfstr_CardTypeIdenti_29.isa, 0);
      objc_super v12 = @"CARD_TYPE_IDENTITY_LIVENESS_STEP_UP_ACTION_TEXT";
LABEL_21:
      id v8 = PKLocalizedIdentityString(&v12->isa, 0);
      id v7 = 0;
      uint64_t v14 = 1;
      if (!v10) {
        goto LABEL_26;
      }
LABEL_22:
      id v16 = [[PKPrecursorPassUpgradeRequestDescription alloc] _init];
      [v16 setLocalizedTitle:v10];
      [v16 setLocalizedDescription:v9];
      [v16 setLocalizedActionText:v8];
      [v16 setActionType:v14];
      [v16 setActionURL:v7];
      (*(void (**)(void))(a1[6] + 16))();

      break;
    default:
LABEL_26:
      (*(void (**)(void))(a1[6] + 16))();
      break;
  }
}

- (void)_carKeyDescriptionFor:(id)a3 completion:(id)a4
{
}

- (void)_genericReProvisionDescriptionFor:(id)a3 completion:(id)a4
{
}

- (void)_issuerAppDescriptionFor:(id)a3 completion:(id)a4
{
}

- (void)_fetchProofingStatusWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  currentProofingConfiguration = self->_currentProofingConfiguration;
  if (currentProofingConfiguration)
  {
    v4[2](v4, [(PKIdentityProofingConfiguration *)currentProofingConfiguration status]);
  }
  else
  {
    if (!self->_identityProofingManager)
    {
      id v6 = (CIDVUIProofingFlowManager *)[objc_alloc((Class)getCIDVUIProofingFlowManagerClass_0[0]()) initWithDelegate:self];
      identityProofingManager = self->_identityProofingManager;
      self->_identityProofingManager = v6;
    }
    id v8 = PKLogFacilityTypeGetObject(0x26uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: fetching proofing flow availability", buf, 2u);
    }

    id v9 = self->_identityProofingManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__PKPrecursorPassUpgradeController__fetchProofingStatusWithCompletion___block_invoke;
    v10[3] = &unk_1E56F6D80;
    void v10[4] = self;
    unint64_t v11 = v4;
    [(CIDVUIProofingFlowManager *)v9 proofingFlowAvailability:v10];
  }
}

void __71__PKPrecursorPassUpgradeController__fetchProofingStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PKPrecursorPassUpgradeController__fetchProofingStatusWithCompletion___block_invoke_2;
  v11[3] = &unk_1E56F2058;
  id v12 = v7;
  id v8 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v8;
  uint64_t v13 = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __71__PKPrecursorPassUpgradeController__fetchProofingStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    [*(id *)(a1 + 40) _updateActiveProofingConfigureFrom:*(void *)(a1 + 48)];
    v3 = *(void **)(*(void *)(a1 + 40) + 64);
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = v3;
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, [v3 status]);
    }
    else {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
}

- (BOOL)_updateActiveProofingConfigureFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKSecureElementPass *)self->_pass issuerAdministrativeAreaCode];
  v27 = self;
  id v6 = [(PKSecureElementPass *)self->_pass issuerCountryCode];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    char v28 = 0;
    uint64_t v10 = *(void *)v31;
    *(void *)&long long v8 = 138412290;
    long long v26 = v8;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "state", v26);
        id v14 = v5;
        id v15 = v13;
        currentProofingConfiguration = v15;
        if (v14 == v15)
        {

LABEL_12:
          uint64_t v18 = [v12 country];
          id v19 = v6;
          id v20 = v18;
          if (v19 == v20)
          {

LABEL_19:
            v23 = PKLogFacilityTypeGetObject(0x26uLL);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              v35 = v12;
              _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: Found match: %@", buf, 0xCu);
            }

            v24 = [[PKIdentityProofingConfiguration alloc] initWithCIDVUIProofingConfiguration:v12];
            currentProofingConfiguration = v27->_currentProofingConfiguration;
            v27->_currentProofingConfiguration = v24;
            char v28 = 1;
            goto LABEL_23;
          }
          uint64_t v21 = v20;
          if (v6 && v20)
          {
            uint64_t v22 = [v19 caseInsensitiveCompare:v20];

            if (v22) {
              continue;
            }
            goto LABEL_19;
          }

          goto LABEL_23;
        }
        if (!v5 || !v15)
        {

          goto LABEL_23;
        }
        uint64_t v17 = [(PKIdentityProofingConfiguration *)v14 caseInsensitiveCompare:v15];

        if (!v17) {
          goto LABEL_12;
        }
LABEL_23:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (!v9) {
        goto LABEL_28;
      }
    }
  }
  char v28 = 0;
LABEL_28:

  return v28 & 1;
}

- (void)reloadPrecursorRequests
{
  v3 = [(PKPrecursorPassUpgradeController *)self devicePrimaryPrecursorRequest];
  id v4 = [v3 actions];
  id v5 = [v4 firstObject];

  if ([v5 type] == 1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PKPrecursorPassUpgradeController_reloadPrecursorRequests__block_invoke;
    v6[3] = &unk_1E56E25E0;
    v6[4] = self;
    [(PKPrecursorPassUpgradeController *)self _fetchProofingStatusWithCompletion:v6];
  }
}

void __59__PKPrecursorPassUpgradeController_reloadPrecursorRequests__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained precursorPassUpgradeRequestDidChange];
}

- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4
{
  id v5 = PKLogFacilityTypeGetObject(0x26uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: Did receive identity proofing completed", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPrecursorPassUpgradeController_proofingFlowManager_completedProofingWithError___block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __83__PKPrecursorPassUpgradeController_proofingFlowManager_completedProofingWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadPrecursorRequests];
}

- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4
{
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject(0x26uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: Did receive identity proofing change", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PKPrecursorPassUpgradeController_proofingFlowManager_didChangeActiveConfigurations___block_invoke;
  v8[3] = &unk_1E56D8A90;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __86__PKPrecursorPassUpgradeController_proofingFlowManager_didChangeActiveConfigurations___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _updateActiveProofingConfigureFrom:*(void *)(a1 + 40)])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
    [WeakRetained precursorPassUpgradeRequestDidChange];
  }
}

- (void)mockIdentityPrecursorPassUpgradeRequestDescriptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  id v7 = objc_alloc_init(PKIdentityProofingConfiguration);
  currentProofingConfiguration = self->_currentProofingConfiguration;
  self->_currentProofingConfiguration = v7;

  id v9 = objc_alloc_init(PKPassUpgradePrecursorPassProofingAction);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke;
  aBlock[3] = &unk_1E56F6DD0;
  aBlock[4] = self;
  v54 = v9;
  id v10 = v5;
  id v55 = v10;
  unint64_t v11 = v9;
  id v12 = _Block_copy(aBlock);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_3;
  v51[3] = &unk_1E56F6DF8;
  v51[4] = self;
  id v13 = v12;
  id v52 = v13;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v51];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_4;
  v49[3] = &unk_1E56F6DF8;
  v49[4] = self;
  id v14 = v13;
  id v50 = v14;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v49];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_5;
  v47[3] = &unk_1E56F6DF8;
  v47[4] = self;
  id v15 = v14;
  id v48 = v15;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v47];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_6;
  v45[3] = &unk_1E56F6DF8;
  v45[4] = self;
  id v16 = v15;
  id v46 = v16;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v45];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_7;
  v43[3] = &unk_1E56F6DF8;
  v43[4] = self;
  id v17 = v16;
  id v44 = v17;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v43];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_8;
  v41[3] = &unk_1E56F6DF8;
  v41[4] = self;
  id v18 = v17;
  id v42 = v18;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v41];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_9;
  v39[3] = &unk_1E56F6DF8;
  v39[4] = self;
  id v19 = v18;
  id v40 = v19;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v39];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_10;
  v37[3] = &unk_1E56F6DF8;
  v37[4] = self;
  id v20 = v19;
  id v38 = v20;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v37];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_11;
  v35[3] = &unk_1E56F6DF8;
  v35[4] = self;
  id v21 = v20;
  id v36 = v21;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v35];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_12;
  v33[3] = &unk_1E56F6DF8;
  v33[4] = self;
  id v22 = v21;
  id v34 = v22;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v33];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_13;
  v31[3] = &unk_1E56F6DF8;
  v31[4] = self;
  id v32 = v22;
  id v23 = v22;
  [(PKAsyncUnaryOperationComposer *)v6 addOperation:v31];
  v24 = [MEMORY[0x1E4F1CA98] null];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_14;
  v28[3] = &unk_1E56F6E20;
  id v29 = v10;
  id v30 = v4;
  id v25 = v10;
  id v26 = v4;
  id v27 = [(PKAsyncUnaryOperationComposer *)v6 evaluateWithInput:v24 completion:v28];
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_2;
  v11[3] = &unk_1E56F6DA8;
  id v12 = *(id *)(a1 + 48);
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  [v7 _proofingDescriptionFor:v8 completion:v11];
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [MEMORY[0x1E4F1CA98] null];
  (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0);
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v8 = a4;
  [v5 setStatus:1];
  id v6 = *(void **)(*(void *)(a1 + 32) + 64);
  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"https:apple.com"];
  [v6 setLearnMoreURL:v7];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:9];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a4;
  [v5 setStatus:11];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (PKPrecursorPassUpgradeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPrecursorPassUpgradeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentProofingConfiguration, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_seids, 0);
  objc_storeStrong((id *)&self->_identityProofingManager, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end