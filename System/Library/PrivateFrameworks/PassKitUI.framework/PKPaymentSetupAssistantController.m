@interface PKPaymentSetupAssistantController
- (BOOL)_isExpressSetupAssistant;
- (BOOL)isFollowupNeededReturningRequirements:(unint64_t *)a3;
- (PKPaymentSetupAssistantController)initWithSetupAssistant:(unint64_t)a3 setupAssistantContext:(id)a4;
- (PKPaymentSetupAssistantController)initWithSetupAssistantContext:(id)a3;
- (PKSetupAssistantContext)setupAssistantContext;
- (void)_bridgeStartingViewControllerForPaymentSetupContext:(int64_t)a3 completion:(id)a4;
- (void)_phoneStartingViewControllerForPaymentSetupContext:(int64_t)a3 completion:(id)a4;
- (void)_setupAssistantViewControllerWithCompletion:(id)a3;
- (void)prepareForPresentationWithCompletion:(id)a3;
- (void)setSetupAssistantContext:(id)a3;
@end

@implementation PKPaymentSetupAssistantController

- (PKPaymentSetupAssistantController)initWithSetupAssistantContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupAssistantController;
  v6 = [(PKPaymentSetupAssistantCoreController *)&v9 initWithSetupAssistantContext:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_setupAssistantContext, a3);
  }

  return v7;
}

- (PKPaymentSetupAssistantController)initWithSetupAssistant:(unint64_t)a3 setupAssistantContext:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (a3 == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    if ([v6 setupAssistant] != v8) {
      [v7 setSetupAssistant:v8];
    }
    objc_super v9 = [(PKPaymentSetupAssistantController *)self initWithSetupAssistantContext:v7];
  }
  else
  {
    v10 = [[PKSetupAssistantContext alloc] initWithSetupAssistant:a3];
    objc_super v9 = [(PKPaymentSetupAssistantController *)self initWithSetupAssistantContext:v10];
  }
  return v9;
}

- (BOOL)isFollowupNeededReturningRequirements:(unint64_t *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  setupAssistantContext = self->_setupAssistantContext;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PKPaymentSetupAssistantController_isFollowupNeededReturningRequirements___block_invoke;
  v6[3] = &unk_1E59D3700;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  [(PKSetupAssistantContext *)setupAssistantContext prepareForFollowupQueryWithHandler:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __75__PKPaymentSetupAssistantController_isFollowupNeededReturningRequirements___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setupAssistantNeedsToRunReturningRequirements:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)prepareForPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PKPaymentSetupAssistantController_prepareForPresentationWithCompletion___block_invoke;
    v7[3] = &unk_1E59D3750;
    v7[4] = self;
    id v8 = v4;
    [(PKPaymentSetupAssistantCoreController *)self _extendedSetupAssistantNeedsToRunWithCompletion:v7];
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Error: No completion provided to prepareForPresentationWithCompletion:", buf, 2u);
    }
  }
}

void __74__PKPaymentSetupAssistantController_prepareForPresentationWithCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a3 || !a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__PKPaymentSetupAssistantController_prepareForPresentationWithCompletion___block_invoke_2;
    v5[3] = &unk_1E59D3728;
    char v8 = 1;
    v3 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = 0;
    [v3 _setupAssistantViewControllerWithCompletion:v5];
  }
}

uint64_t __74__PKPaymentSetupAssistantController_prepareForPresentationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BOOL v3 = *(unsigned char *)(a1 + 48) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v4, a2, *(void *)(a1 + 40));
}

- (BOOL)_isExpressSetupAssistant
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)_setupAssistantViewControllerWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    unint64_t v5 = [(PKSetupAssistantContext *)self->_setupAssistantContext setupAssistant];
    if (v5 == 2)
    {
      if ([(PKPaymentSetupAssistantController *)self _isExpressSetupAssistant]) {
        uint64_t v8 = 6;
      }
      else {
        uint64_t v8 = 5;
      }
      [(PKPaymentSetupAssistantController *)self _bridgeStartingViewControllerForPaymentSetupContext:v8 completion:v4];
    }
    else if (v5 == 1)
    {
      if ([(PKPaymentSetupAssistantController *)self _isExpressSetupAssistant]) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
      [(PKPaymentSetupAssistantController *)self _phoneStartingViewControllerForPaymentSetupContext:v6 completion:v4];
    }
    else
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = [(PKSetupAssistantContext *)self->_setupAssistantContext setupAssistant];
        int v11 = 134217984;
        unint64_t v12 = v10;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Error: _setupAssistantViewControllerWithCompletion called with unsupported type %lu. File a radar!", (uint8_t *)&v11, 0xCu);
      }

      v4[2](v4, 0);
    }
  }
  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Error: No completion provided to setupAssistantStartingViewController", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)_bridgeStartingViewControllerForPaymentSetupContext:(int64_t)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    setupAssistantContext = self->_setupAssistantContext;
    *(_DWORD *)buf = 138543618;
    v44 = v9;
    __int16 v45 = 2112;
    v46 = setupAssistantContext;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ with context: %@", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke;
  aBlock[3] = &unk_1E59D3778;
  SEL v42 = a2;
  id v11 = v7;
  id v41 = v11;
  unint64_t v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (self->_setupAssistantContext)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = self->_setupAssistantContext;
      id v14 = [(PKSetupAssistantContext *)v13 parentFamilyMember];
      v15 = [(PKSetupAssistantContext *)v13 pairingFamilyMember];
      if (v15) {
        BOOL v16 = v14 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16)
      {
        int64_t v31 = a3;
        v17 = [(objc_class *)getNPKCompanionAgentConnectionClass_2() watchPeerPaymentWebService];
        v18 = [MEMORY[0x1E4F84E10] sharedService];
        v30 = v17;
        v19 = [v17 targetDevice];
        v28 = [v19 account];

        v29 = v18;
        v20 = [v18 targetDevice];
        v21 = [v20 account];

        buf[0] = 0;
        [(PKPaymentSetupAssistantCoreController *)self _shouldRunAppleCashFlow:buf shouldRunPaymentSetupFlow:0 pairingFamilyMember:v15 pairingPeerPaymentAccount:v28 parentFamilyMember:v14 parentPeerPaymentAccount:v21];
        if (buf[0])
        {
          v22 = [PKSetupAssistantPeerPaymentAddAssociatedAccountViewController alloc];
          v23 = [(PKSetupAssistantContext *)v13 dataProvider];
          v24 = [(PKSetupAssistantContext *)v13 peerPaymentDelegate];
          uint64_t v25 = [(PKSetupAssistantPeerPaymentAddAssociatedAccountViewController *)v22 initWithPairingFamilyMember:v15 parentFamilyMember:v14 webService:v30 passLibraryDataProvider:v23 delegate:v24 context:v31];
          v32 = v21;
          v26 = (void *)v25;

          v12[2](v12, v26);
          goto LABEL_18;
        }

        a3 = v31;
      }
    }
  }
  uint64_t v13 = [(objc_class *)getNPKCompanionAgentConnectionClass_2() watchPaymentWebService];
  v27 = [(PKPaymentSetupAssistantCoreController *)self _provisioningControllerWithWebService:v13];
  if (PKIsAltAccountPairedOrPairing())
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Configuring provisoning controller for alt account", buf, 2u);
    }

    [v27 setIsProvisioningForAltAccount:1];
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_59;
  v33[3] = &unk_1E59D37F0;
  id v36 = v11;
  id v34 = v27;
  SEL v38 = a2;
  v37 = v12;
  v35 = self;
  int64_t v39 = a3;
  id v14 = v27;
  [(PKPaymentSetupAssistantCoreController *)self _preflightPaymentSetupProvisioningController:v14 completion:v33];

  v15 = v36;
LABEL_18:
}

void __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v6 = [v3 description];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ returning: %@", (uint8_t *)&v8, 0x16u);
  }
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DB8], 0);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_59(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (!PKIsAltAccountPairedOrPairing())
    {
LABEL_5:
      uint64_t v7 = [PKPaymentSetupAssistantDelegateProxy alloc];
      int v8 = [*(id *)(*(void *)(a1 + 40) + 32) delegate];
      uint64_t v9 = [(PKPaymentSetupAssistantDelegateProxy *)v7 initWithDelegate:v8 provisioningController:*(void *)(a1 + 32)];

      __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:*(void *)(a1 + 72) provisioningController:*(void *)(a1 + 32) groupsController:0];
      objc_msgSend(v10, "setIsFollowupSetupAssistant:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "isFollowupAction"));
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_63;
      v22[3] = &unk_1E59D37A0;
      id v23 = *(id *)(a1 + 56);
      p_long long buf = &buf;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_2;
      v17[3] = &unk_1E59D37C8;
      uint64_t v12 = *(void **)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 64);
      v20 = &buf;
      uint64_t v21 = v11;
      id v19 = v12;
      uint64_t v13 = v9;
      v18 = v13;
      +[PKProvisioningFlowBridge startSetupAssistantFlowWithContext:v10 allowManualEntry:a3 onFirstViewControllerShown:v22 completion:v17];

      _Block_object_dispose(&buf, 8);
      return;
    }
    unint64_t v5 = [*(id *)(a1 + 32) associatedCredentials];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      a3 = 0;
      goto LABEL_5;
    }
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = NSStringFromSelector(*(SEL *)(a1 + 64));
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ not appearing in buddy as alt account with 0 parked cards", (uint8_t *)&buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v14();
  }
}

uint64_t __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_63(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __100__PKPaymentSetupAssistantController__bridgeStartingViewControllerForPaymentSetupContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = *(void **)(a1 + 32);
    return [v2 viewControllerDidTerminateSetupFlow:0];
  }
  else
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no initial view controller found", (uint8_t *)&v6, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_phoneStartingViewControllerForPaymentSetupContext:(int64_t)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    setupAssistantContext = self->_setupAssistantContext;
    *(_DWORD *)long long buf = 138543618;
    uint64_t v28 = (uint64_t)v9;
    __int16 v29 = 2112;
    v30 = setupAssistantContext;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ with context: %@", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke;
  aBlock[3] = &unk_1E59D3818;
  SEL v25 = a2;
  id v11 = v7;
  void aBlock[4] = self;
  id v24 = v11;
  int64_t v26 = a3;
  uint64_t v12 = (void (**)(void *, id, uint64_t, uint64_t))_Block_copy(aBlock);
  id v13 = [(PKPaymentSetupAssistantCoreController *)self provisioningController];
  if (v13 && ([(PKPaymentSetupAssistantCoreController *)self preflightState] & 2) != 0)
  {
    unint64_t v16 = [(PKPaymentSetupAssistantCoreController *)self preflightState];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = NSStringFromSelector(a2);
      v18 = (void *)v17;
      id v19 = @"NO";
      if ((v16 & 4) != 0) {
        id v19 = @"YES";
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Preflight already completed, using result with allowsManualEntry: %@", buf, 0x16u);
    }
    v12[2](v12, v13, 1, (v16 >> 2) & 1);
  }
  else
  {
    id v14 = [MEMORY[0x1E4F84D50] sharedService];
    v15 = [(PKPaymentSetupAssistantCoreController *)self _provisioningControllerWithWebService:v14];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_75;
    v20[3] = &unk_1E59D3840;
    v22 = v12;
    id v13 = v15;
    id v21 = v13;
    [(PKPaymentSetupAssistantCoreController *)self _preflightPaymentSetupProvisioningController:v13 completion:v20];
  }
}

void __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v7 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_2;
  aBlock[3] = &unk_1E59D3778;
  long long v16 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v16;
  long long v27 = v16;
  uint64_t v9 = _Block_copy(aBlock);
  __int16 v10 = v9;
  if (a3)
  {
    id v11 = [PKPaymentSetupAssistantDelegateProxy alloc];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 32) delegate];
    id v13 = [(PKPaymentSetupAssistantDelegateProxy *)v11 initWithDelegate:v12 provisioningController:v7];

    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:*(void *)(a1 + 56) provisioningController:v7 groupsController:0];
    objc_msgSend(v14, "setIsFollowupSetupAssistant:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "isFollowupAction"));
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    char v25 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_65;
    v21[3] = &unk_1E59D37A0;
    id v22 = *(id *)(a1 + 40);
    id v23 = v24;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_2_66;
    v17[3] = &unk_1E59D14F8;
    v20 = v24;
    id v19 = *(id *)(a1 + 40);
    v15 = v13;
    v18 = v15;
    +[PKProvisioningFlowBridge startSetupAssistantFlowWithContext:v14 allowManualEntry:a4 onFirstViewControllerShown:v21 completion:v17];

    _Block_object_dispose(v24, 8);
  }
  else
  {
    (*((void (**)(void *, void))v9 + 2))(v9, 0);
  }
}

void __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = [v3 description];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ returning: %@", (uint8_t *)&v8, 0x16u);
  }
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DB8], 0);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_65(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_2_66(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return [*(id *)(a1 + 32) viewControllerDidTerminateSetupFlow:0];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __99__PKPaymentSetupAssistantController__phoneStartingViewControllerForPaymentSetupContext_completion___block_invoke_75(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (PKSetupAssistantContext)setupAssistantContext
{
  return self->_setupAssistantContext;
}

- (void)setSetupAssistantContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end