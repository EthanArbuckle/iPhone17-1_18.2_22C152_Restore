@interface PKSecurityCapabilitiesController
+ (id)displayableErrorForErrorCode:(unint64_t)a3;
- (BOOL)isHSA2Enabled;
- (PKSecurityCapabilitiesController)initWithRequirements:(unint64_t)a3 context:(int64_t)a4;
- (PKSecurityCapabilitiesController)initWithRequirements:(unint64_t)a3 feature:(unint64_t)a4 context:(int64_t)a5;
- (id)_authenticationReason;
- (id)_createAuthContext;
- (id)_genericDisplayableError;
- (id)_missingTLKsAlertController;
- (int64_t)context;
- (unint64_t)feature;
- (unint64_t)securityRequirements;
- (void)_isEnabledForSecurityRequirements:(unint64_t)a3 withCompletion:(id)a4;
- (void)_isManateeCapableWithCompletion:(id)a3;
- (void)_isMissingTLKsWithCompletion:(id)a3;
- (void)_presentDeviceToDeviceEncryptionRepairFlow:(id)a3 completion:(id)a4;
- (void)_presentManateeSecurityFlowWithPresentingViewController:(id)a3 suppressHSA2Alert:(BOOL)a4 completion:(id)a5;
- (void)_presentManateeTermsAlertViewController:(id)a3 completion:(id)a4;
- (void)_presentMissingTLKsAlertWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)_presentPasswordPromptWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)_resetApplyPayManateeViewWithCompletion:(id)a3;
- (void)isEnabledForSecuirtyRequirementsWithCompletion:(id)a3;
- (void)presentSecurityRepairFlowWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)presentSecurityRepairFlowWithPresentingViewController:(id)a3 suppressHSA2Alert:(BOOL)a4 completion:(id)a5;
@end

@implementation PKSecurityCapabilitiesController

+ (id)displayableErrorForErrorCode:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
      v3 = PKLocalizedPaymentString(&cfstr_HsaEnrollmentF.isa);
      v4 = @"HSA_ENROLLMENT_FAILED_MESSAGE";
      goto LABEL_7;
    case 3uLL:
      v3 = PKLocalizedPaymentString(&cfstr_HsaEnrollmentC.isa);
      v4 = @"HSA_ENROLLMENT_CANCELED_MESSAGE";
      goto LABEL_7;
    case 4uLL:
      v6 = PKPrimaryAppleAccountFormattedUsername();
      v3 = PKLocalizedPaymentString(&cfstr_HsaEnrollmentN.isa, &stru_1EF1B4C70.isa, v6);

      v7 = PKLocalizedPaymentString(&cfstr_HsaEnrollmentN_0.isa);
      goto LABEL_8;
    case 5uLL:
      v3 = PKLocalizedPaymentString(&cfstr_HsaEnrollmentM.isa);
      v4 = @"HSA_ENROLLMENT_MANATEE_UNAVAILABLE_MESSAGE";
LABEL_7:
      v7 = PKLocalizedPaymentString(&v4->isa);
LABEL_8:
      v5 = PKDisplayableErrorCustom();

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (PKSecurityCapabilitiesController)initWithRequirements:(unint64_t)a3 context:(int64_t)a4
{
  return [(PKSecurityCapabilitiesController *)self initWithRequirements:a3 feature:0 context:a4];
}

- (PKSecurityCapabilitiesController)initWithRequirements:(unint64_t)a3 feature:(unint64_t)a4 context:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)PKSecurityCapabilitiesController;
  v8 = [(PKSecurityCapabilitiesController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_feature = a4;
    v8->_securityRequirements = a3;
    uint64_t v10 = [(PKSecurityCapabilitiesController *)v8 _createAuthContext];
    authContext = v9->_authContext;
    v9->_authContext = (AKAppleIDAuthenticationContext *)v10;

    v9->_context = a5;
    uint64_t v12 = [MEMORY[0x1E4F845A8] sharedInstance];
    cloudService = v9->_cloudService;
    v9->_cloudService = (PKCloudStoreService *)v12;
  }
  return v9;
}

- (void)presentSecurityRepairFlowWithPresentingViewController:(id)a3 completion:(id)a4
{
}

- (void)presentSecurityRepairFlowWithPresentingViewController:(id)a3 suppressHSA2Alert:(BOOL)a4 completion:(id)a5
{
  BOOL v24 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v7 = a5;
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = PKFeatureIdentifierToString();
    uint64_t v10 = PKSecurityCapabilitiesRequirementToString(self->_securityRequirements);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Presenting security capabilities flow for feature: %@, requirements: %@", buf, 0x16u);
  }
  unint64_t securityRequirements = self->_securityRequirements;
  int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v56 = __Block_byref_object_copy__11;
  v57 = __Block_byref_object_dispose__11;
  id v58 = 0;
  if (IsSetupAssistant)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "The current context is setup assistant so dont present any repair flows.", v51, 2u);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke;
    aBlock[3] = &unk_1E59CC990;
    id v47 = v7;
    v48 = buf;
    v49 = v50;
    v13 = _Block_copy(aBlock);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2;
    v42[3] = &unk_1E59D0B70;
    v44 = v50;
    v42[4] = self;
    id v14 = v13;
    id v43 = v14;
    v45 = buf;
    objc_super v15 = _Block_copy(v42);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_87;
    v37[3] = &unk_1E59D0BE8;
    v40 = v50;
    v37[4] = self;
    id v16 = v25;
    id v38 = v16;
    v41 = buf;
    id v17 = v15;
    id v39 = v17;
    v18 = (void (**)(void))_Block_copy(v37);
    v19 = v18;
    unint64_t v20 = securityRequirements & 2;
    if ((securityRequirements & 0xCC) != 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = PKSecurityCapabilitiesRequirementToString(0xCCuLL);
        v22 = (void *)v21;
        v23 = &stru_1EF1B5B50;
        if (v24) {
          v23 = @" with HSA2 alert suppressed.";
        }
        *(_DWORD *)v51 = 138412546;
        uint64_t v52 = v21;
        __int16 v53 = 2112;
        v54 = v23;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Checking security eligibility for %@%@", v51, 0x16u);
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_97;
      v30[3] = &unk_1E59D0C38;
      v30[4] = self;
      BOOL v35 = v24;
      id v31 = v16;
      v33 = v50;
      v34 = buf;
      id v32 = v19;
      char v36 = v20 >> 1;
      [(PKSecurityCapabilitiesController *)self _isEnabledForSecurityRequirements:204 withCompletion:v30];
    }
    else if ((securityRequirements & 2) != 0)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2_102;
      v26[3] = &unk_1E59D0B98;
      v28 = v50;
      v29 = buf;
      v27 = v18;
      [(PKSecurityCapabilitiesController *)self _presentPasswordPromptWithPresentingViewController:v16 completion:v26];
    }
    else
    {
      v18[2](v18);
    }
  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v50, 8);
}

void *__119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)(result[5] + 8) + 40);
    if (v2)
    {
      uint64_t v3 = *(void *)(result[6] + 8);
      if (!*(void *)(v3 + 24))
      {
        *(void *)(v3 + 24) = 2;
        uint64_t v1 = result[4];
        uint64_t v2 = *(void *)(*(void *)(result[5] + 8) + 40);
      }
    }
    return (void *)(*(uint64_t (**)(uint64_t, void, uint64_t))(v1 + 16))(v1, *(void *)(*(void *)(result[6] + 8) + 24), v2);
  }
  return result;
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && (*(unsigned char *)(*(void *)(a1 + 32) + 32) & 0x20) != 0)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = PKSecurityCapabilitiesRequirementToString(0x20uLL);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Checking security eligibility for %@", buf, 0xCu);
    }
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_77;
    v6[3] = &unk_1E59D0B48;
    v6[4] = v5;
    id v7 = *(id *)(a1 + 40);
    long long v8 = *(_OWORD *)(a1 + 48);
    [v5 _isEnabledForSecurityRequirements:32 withCompletion:v6];
  }
  else
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_77(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = PKSecurityCapabilitiesRequirementToString(a3);
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Missing security eligibility %@", buf, 0xCu);
  }
  if ((a3 & 0x20) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Trying to setup the apple pay container...", buf, 2u);
    }

    id v7 = *(void **)(*(void *)(a1 + 32) + 16);
    long long v8 = PKCurrentCloudStoreApplePayContainerName();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_78;
    v10[3] = &unk_1E59D0B20;
    id v9 = *(id *)(a1 + 40);
    long long v12 = *(_OWORD *)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v7 setupCloudDatabaseForContainerName:v8 completion:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_78(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v11 = 138412546;
    long long v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Finished the apple pay container setup with success %@, error %@", (uint8_t *)&v11, 0x16u);
  }

  if ((a2 & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
    uint64_t v8 = [*(id *)(a1 + 32) _genericDisplayableError];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_87(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && (*(unsigned char *)(*(void *)(a1 + 32) + 32) & 0x10) != 0)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = PKSecurityCapabilitiesRequirementToString(0x10uLL);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Checking security eligibility for %@", buf, 0xCu);
    }
    id v5 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_88;
    v10[3] = &unk_1E59D0BC0;
    v10[4] = v5;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    id v11 = v6;
    uint64_t v13 = v7;
    long long v9 = *(_OWORD *)(a1 + 48);
    id v8 = (id)v9;
    long long v12 = v9;
    [v5 _isEnabledForSecurityRequirements:16 withCompletion:v10];
  }
  else
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_88(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = PKSecurityCapabilitiesRequirementToString(a3);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Missing security eligibility %@", buf, 0xCu);
  }
  if ((a3 & 0x10) != 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_89;
    v11[3] = &unk_1E59D0B98;
    uint64_t v13 = *(void *)(a1 + 64);
    long long v10 = *(_OWORD *)(a1 + 48);
    id v9 = (id)v10;
    long long v12 = v10;
    [v7 _presentMissingTLKsAlertWithPresentingViewController:v8 completion:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_89(void *a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_97(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = PKSecurityCapabilitiesRequirementToString(a3);
    *(_DWORD *)buf = 138412290;
    id v38 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Missing security eligibility %@", buf, 0xCu);
  }
  if ((a3 & 8) != 0)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 72);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_98;
    v34[3] = &unk_1E59D0C10;
    uint64_t v36 = *(void *)(a1 + 64);
    v34[4] = v11;
    long long v22 = *(_OWORD *)(a1 + 48);
    id v14 = (id)v22;
    long long v35 = v22;
    [v11 _presentManateeSecurityFlowWithPresentingViewController:v12 suppressHSA2Alert:v13 completion:v34];
    long long v10 = (void *)v35;
  }
  else if ((a3 & 0x80) != 0)
  {
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2_100;
    v31[3] = &unk_1E59D0C10;
    uint64_t v33 = *(void *)(a1 + 64);
    v31[4] = v15;
    long long v23 = *(_OWORD *)(a1 + 48);
    id v17 = (id)v23;
    long long v32 = v23;
    [v15 _presentManateeTermsAlertViewController:v16 completion:v31];
    long long v10 = (void *)v32;
  }
  else if ((a3 & 0x44) != 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_3;
    v28[3] = &unk_1E59D0C10;
    uint64_t v30 = *(void *)(a1 + 64);
    v28[4] = v7;
    long long v21 = *(_OWORD *)(a1 + 48);
    id v9 = (id)v21;
    long long v29 = v21;
    [v7 _presentDeviceToDeviceEncryptionRepairFlow:v8 completion:v28];
    long long v10 = (void *)v29;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 73))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      return;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "The user is hsa2/manatee capable, but a password prompt is required.", buf, 2u);
    }

    v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_101;
    v25[3] = &unk_1E59D0B98;
    uint64_t v27 = *(void *)(a1 + 64);
    long long v24 = *(_OWORD *)(a1 + 48);
    id v20 = (id)v24;
    long long v26 = v24;
    [v18 _presentPasswordPromptWithPresentingViewController:v19 completion:v25];
    long long v10 = (void *)v26;
  }
}

uint64_t __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_98(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
  uint64_t v3 = [(id)objc_opt_class() displayableErrorForErrorCode:*(void *)(*(void *)(a1[6] + 8) + 24)];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(a1[5] + 16);

  return v6();
}

uint64_t __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2_100(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
  uint64_t v3 = [(id)objc_opt_class() displayableErrorForErrorCode:*(void *)(*(void *)(a1[6] + 8) + 24)];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(a1[5] + 16);

  return v6();
}

uint64_t __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_3(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
  uint64_t v3 = [(id)objc_opt_class() displayableErrorForErrorCode:*(void *)(*(void *)(a1[6] + 8) + 24)];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(a1[5] + 16);

  return v6();
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_101(void *a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

void __119__PKSecurityCapabilitiesController_presentSecurityRepairFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2_102(void *a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

- (void)isEnabledForSecuirtyRequirementsWithCompletion:(id)a3
{
}

- (BOOL)isHSA2Enabled
{
  uint64_t v3 = [MEMORY[0x1E4F4EF40] sharedInstance];
  uint64_t v4 = [(AKAppleIDAuthenticationContext *)self->_authContext altDSID];
  id v5 = [v3 authKitAccountWithAltDSID:v4];

  uint64_t v6 = [v3 securityLevelForAccount:v5];
  if (v6 == 4) {
    return 1;
  }
  uint64_t v8 = [MEMORY[0x1E4F843F0] sharedInstance];
  id v9 = [v8 appleAccountInformation];

  LOBYTE(v8) = [v9 isManagedAppleAccount];
  return (char)v8;
}

- (void)_presentMissingTLKsAlertWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = [(PKSecurityCapabilitiesController *)self _missingTLKsAlertController];
      id v9 = (void *)MEMORY[0x1E4FB1410];
      long long v10 = PKLocalizedPaymentString(&cfstr_TlksResetButto.isa);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke;
      v22[3] = &unk_1E59D0C60;
      v22[4] = self;
      id v11 = v7;
      id v23 = v11;
      uint64_t v12 = [v9 actionWithTitle:v10 style:0 handler:v22];
      [v8 addAction:v12];

      uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
      id v14 = PKLocalizedPaymentString(&cfstr_TlksResetCance.isa);
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke_3;
      uint64_t v19 = &unk_1E59D0C60;
      id v20 = self;
      id v21 = v11;
      uint64_t v15 = [v13 actionWithTitle:v14 style:1 handler:&v16];
      objc_msgSend(v8, "addAction:", v15, v16, v17, v18, v19, v20);

      [v6 presentViewController:v8 animated:1 completion:0];
    }
    else
    {
      uint64_t v8 = [(PKSecurityCapabilitiesController *)self _genericDisplayableError];
      (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 2, v8);
    }
  }
}

void __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[3] == 1)
  {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85CE0], 0);
    uint64_t v2 = *(void **)(a1 + 32);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke_2;
  v4[3] = &unk_1E59CF340;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _resetApplyPayManateeViewWithCompletion:v4];
}

void __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    id v9 = v5;
    if (a2)
    {
      (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
    }
    else
    {
      id v7 = *(void **)(a1 + 32);
      if (v7[3] == 1)
      {
        MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E50], 0);
        id v7 = *(void **)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
      }
      uint64_t v8 = [v7 _genericDisplayableError];
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, 2, v8);
    }
    id v5 = v9;
  }
}

void __100__PKSecurityCapabilitiesController__presentMissingTLKsAlertWithPresentingViewController_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 24) == 1) {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85CD8], 0);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 3, 0);
  }
}

- (void)_resetApplyPayManateeViewWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "User wants to blow away apple pay manatee view and create new TLKs.", v6, 2u);
  }

  [(PKCloudStoreService *)self->_cloudService resetApplePayManateeViewWithCompletion:v4];
}

- (void)_presentDeviceToDeviceEncryptionRepairFlow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (v6)
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Presenting CDPUIDeviceToDeviceEncryptionHelper", buf, 2u);
      }

      if (PKPaymentSetupContextIsBridge())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v6 presentedViewController];

          id v6 = (id)v10;
        }
      }
      id v11 = objc_alloc(MEMORY[0x1E4F5B300]);
      uint64_t v12 = [(AKAppleIDAuthenticationContext *)self->_authContext altDSID];
      uint64_t v13 = (void *)[v11 initWithAltDSID:v12];

      [v13 setPresentingViewController:v6];
      [v13 setDeviceToDeviceEncryptionUpgradeType:0];
      [v13 setDeviceToDeviceEncryptionUpgradeUIStyle:3];
      [v13 setSecurityUpgradeContext:*MEMORY[0x1E4F4EEF8]];
      id v14 = [(PKSecurityCapabilitiesController *)self _authenticationReason];
      [v13 setFeatureName:v14];

      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F5B308]) initWithContext:v13];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __90__PKSecurityCapabilitiesController__presentDeviceToDeviceEncryptionRepairFlow_completion___block_invoke;
      v16[3] = &unk_1E59CE160;
      id v17 = v8;
      [v15 performDeviceToDeviceEncryptionStateRepairWithCompletion:v16];
    }
    else
    {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 2);
    }
  }
}

void __90__PKSecurityCapabilitiesController__presentDeviceToDeviceEncryptionRepairFlow_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v11 = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Completed CDPUIDeviceToDeviceEncryptionHelper with didRepair %@, error %@", (uint8_t *)&v11, 0x16u);
  }

  if (a2)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v9 = [v5 domain];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F5B2D0]];

    if (v10) {
      [v5 code];
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (void)_presentManateeSecurityFlowWithPresentingViewController:(id)a3 suppressHSA2Alert:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t feature = self->_feature;
  if (feature == 1)
  {
    uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTwo.isa);
  }
  else
  {
    if (feature == 2) {
      PKLocalizedFeatureString();
    }
    else {
    uint64_t v11 = PKLocalizedPaymentString(&cfstr_TwoFactorAuthR.isa);
    }
  }
  uint64_t v12 = (void *)v11;
  if (a4 || [(PKSecurityCapabilitiesController *)self isHSA2Enabled])
  {
    [(PKSecurityCapabilitiesController *)self _presentDeviceToDeviceEncryptionRepairFlow:v8 completion:v9];
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x1E4FB1418];
    id v14 = PKLocalizedPaymentString(&cfstr_TwoFactorAuthR_0.isa);
    uint64_t v15 = [v13 alertControllerWithTitle:v14 message:v12 preferredStyle:1];

    uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
    id v17 = PKLocalizedPaymentString(&cfstr_TwoFactorAuthR_1.isa);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __121__PKSecurityCapabilitiesController__presentManateeSecurityFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke;
    v29[3] = &unk_1E59D0C88;
    v29[4] = self;
    id v18 = v8;
    id v30 = v18;
    id v19 = v9;
    id v31 = v19;
    id v20 = [v16 actionWithTitle:v17 style:0 handler:v29];
    [v15 addAction:v20];

    id v21 = (void *)MEMORY[0x1E4FB1410];
    long long v22 = PKLocalizedPaymentString(&cfstr_TwoFactorAuthR_2.isa);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    long long v26 = __121__PKSecurityCapabilitiesController__presentManateeSecurityFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2;
    uint64_t v27 = &unk_1E59CB150;
    id v28 = v19;
    id v23 = [v21 actionWithTitle:v22 style:1 handler:&v24];
    objc_msgSend(v15, "addAction:", v23, v24, v25, v26, v27);

    [v18 presentViewController:v15 animated:1 completion:0];
  }
}

uint64_t __121__PKSecurityCapabilitiesController__presentManateeSecurityFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentDeviceToDeviceEncryptionRepairFlow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __121__PKSecurityCapabilitiesController__presentManateeSecurityFlowWithPresentingViewController_suppressHSA2Alert_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  }
  return result;
}

- (void)_presentManateeTermsAlertViewController:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = a3;
  id v8 = PKLocalizedPaymentString(&cfstr_ManateeTermsAc.isa);
  id v9 = PKLocalizedPaymentString(&cfstr_ManateeTermsAc_0.isa);
  int v10 = [v6 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v12 = PKLocalizedPaymentString(&cfstr_ManateeTermsAc_1.isa);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __87__PKSecurityCapabilitiesController__presentManateeTermsAlertViewController_completion___block_invoke;
  v24[3] = &unk_1E59CB150;
  id v13 = v5;
  id v25 = v13;
  id v14 = [v11 actionWithTitle:v12 style:0 handler:v24];
  [v10 addAction:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v16 = PKLocalizedPaymentString(&cfstr_TwoFactorAuthR_2.isa);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __87__PKSecurityCapabilitiesController__presentManateeTermsAlertViewController_completion___block_invoke_2;
  long long v22 = &unk_1E59CB150;
  id v23 = v13;
  id v17 = v13;
  id v18 = [v15 actionWithTitle:v16 style:1 handler:&v19];
  objc_msgSend(v10, "addAction:", v18, v19, v20, v21, v22);

  [v7 presentViewController:v10 animated:1 completion:0];
}

void __87__PKSecurityCapabilitiesController__presentManateeTermsAlertViewController_completion___block_invoke(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v4 withOptions:0];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 3);
  }
}

uint64_t __87__PKSecurityCapabilitiesController__presentManateeTermsAlertViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  }
  return result;
}

- (void)_presentPasswordPromptWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Presenting password prompt...", buf, 2u);
    }

    int v10 = [MEMORY[0x1E4F843F0] sharedInstance];
    uint64_t v11 = [v10 appleAccountInformation];

    id v12 = objc_alloc_init(MEMORY[0x1E4F4F100]);
    [v12 setPresentingViewController:v6];
    id v13 = [v11 appleID];
    [v12 setUsername:v13];

    id v14 = [v11 aaAlternateDSID];
    [v12 setAltDSID:v14];

    [v12 setIsUsernameEditable:0];
    [v12 setShouldPromptForPasswordOnly:1];
    [v12 setAuthenticationType:2];
    uint64_t v15 = [(PKSecurityCapabilitiesController *)self _authenticationReason];
    [v12 setReason:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke;
    v17[3] = &unk_1E59D0CD8;
    id v19 = v8;
    v17[4] = self;
    id v18 = v6;
    [v16 authenticateWithContext:v12 completion:v17];
  }
}

void __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke_2;
  block[3] = &unk_1E59CEF00;
  id v13 = v5;
  id v14 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v17 = v7;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke_2(id *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [a1[4] allKeys];
    id v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    id v28 = v3;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Request for user authentication returned result with keys: %@ error: %@", buf, 0x16u);
  }
  id v5 = a1[5];
  if (!v5)
  {
    id v9 = (void (*)(void))*((void *)a1[8] + 2);
    goto LABEL_8;
  }
  id v6 = [v5 domain];
  uint64_t v7 = *MEMORY[0x1E4F4ED70];
  if ([v6 isEqual:*MEMORY[0x1E4F4ED70]])
  {
    uint64_t v8 = [a1[5] code];

    if (v8 == -7003)
    {
      id v9 = (void (*)(void))*((void *)a1[8] + 2);
LABEL_8:
      v9();
      return;
    }
  }
  else
  {
  }
  id v10 = [a1[5] domain];
  if (![v10 isEqual:v7])
  {

    goto LABEL_15;
  }
  uint64_t v11 = [a1[5] code];

  if (v11 != -7005)
  {
LABEL_15:
    id v18 = (void (**)(id, uint64_t, void *))a1[8];
    id v19 = [a1[6] _genericDisplayableError];
    v18[2](v18, 2, v19);

    goto LABEL_16;
  }
  id v12 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
  id v13 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
  id v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v13 preferredStyle:1];
  uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
  id v16 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke_160;
  uint64_t v24 = &unk_1E59D0CB0;
  id v26 = a1[8];
  id v25 = a1[5];
  id v17 = [v15 actionWithTitle:v16 style:1 handler:&v21];
  objc_msgSend(v14, "addAction:", v17, v21, v22, v23, v24);

  if (!v14)
  {
LABEL_16:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Error: Tried to present a user error for authentication request but could not generate one. Exiting", buf, 2u);
    }

    uint64_t v20 = (void (**)(id, uint64_t, void *))a1[8];
    id v14 = [a1[6] _genericDisplayableError];
    v20[2](v20, 2, v14);
    goto LABEL_19;
  }
  [a1[7] presentViewController:v14 animated:1 completion:0];
LABEL_19:
}

uint64_t __98__PKSecurityCapabilitiesController__presentPasswordPromptWithPresentingViewController_completion___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 2, *(void *)(a1 + 32));
}

- (void)_isEnabledForSecurityRequirements:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  int IsBridge = PKPaymentSetupContextIsBridge();
  uint64_t v8 = dispatch_group_create();
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = PKSecurityCapabilitiesRequirementToString(a3);
    *(_DWORD *)buf = 138412290;
    *(void *)id v43 = v10;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Checking security requirements: %@", buf, 0xCu);
  }
  if (IsBridge && PKPassbookIsCurrentlyDeletedByUser())
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = PKSecurityCapabilitiesRequirementToString(a3 & 0x38);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)id v43 = 1;
      *(_WORD *)&v43[4] = 2112;
      *(void *)&v43[6] = v11;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Is Bridge: %d, Skipping requirement checks: %@", buf, 0x12u);
    }
    goto LABEL_11;
  }
  if ((a3 & 0xA8) != 0)
  {
    dispatch_group_enter(v8);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke;
    v27[3] = &unk_1E59D0D28;
    BOOL v31 = (a3 & 8) != 0;
    __int16 v29 = &v38;
    id v30 = &v34;
    BOOL v32 = (a3 & 0x20) != 0;
    BOOL v33 = (a3 & 0x80) != 0;
    id v28 = v8;
    [(PKSecurityCapabilitiesController *)self _isManateeCapableWithCompletion:v27];
  }
  if ((a3 & 0x10) != 0)
  {
    dispatch_group_enter(v8);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_3;
    v23[3] = &unk_1E59CECB0;
    id v25 = &v38;
    id v26 = &v34;
    uint64_t v24 = v8;
    [(PKSecurityCapabilitiesController *)self _isMissingTLKsWithCompletion:v23];
    id v9 = v24;
LABEL_11:
  }
  if ((a3 & 4) != 0)
  {
    BOOL v12 = [(PKSecurityCapabilitiesController *)self isHSA2Enabled];
    BOOL v13 = *((unsigned char *)v39 + 24) && v12;
    *((unsigned char *)v39 + 24) = v13;
    if (!v12) {
      v35[3] |= 4uLL;
    }
  }
  if ((a3 & 0x40) != 0)
  {
    int v14 = PKPasscodeEnabled();
    if (v14) {
      BOOL v15 = *((unsigned char *)v39 + 24) == 0;
    }
    else {
      BOOL v15 = 1;
    }
    char v16 = !v15;
    *((unsigned char *)v39 + 24) = v16;
    if (!v14) {
      v35[3] |= 0x40uLL;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_5;
  block[3] = &unk_1E59D0D78;
  uint64_t v21 = &v34;
  unint64_t v22 = a3;
  id v19 = v6;
  uint64_t v20 = &v38;
  id v17 = v6;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

void __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke(uint64_t a1, char a2, char a3, char a4)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_2;
  block[3] = &unk_1E59D0D00;
  char v9 = a2;
  __int16 v10 = *(_WORD *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  char v11 = a3;
  char v12 = *(unsigned char *)(a1 + 58);
  char v13 = a4;
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  char v2 = *(unsigned char *)(v1 + 24);
  if (v2) {
    char v2 = *(unsigned char *)(a1 + 56) != 0;
  }
  *(unsigned char *)(v1 + 24) = v2;
  if (*(unsigned char *)(a1 + 57) && !*(unsigned char *)(a1 + 56)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 8uLL;
  }
  if (*(unsigned char *)(a1 + 58) && !*(unsigned char *)(a1 + 59)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 0x20uLL;
  }
  if (*(unsigned char *)(a1 + 60) && *(unsigned char *)(a1 + 61)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 0x80uLL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_3(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_4;
  block[3] = &unk_1E59D0D50;
  char v7 = a2;
  uint64_t v6 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 32);
  id v2 = (id)v3;
  long long v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  char v2 = *(unsigned char *)(v1 + 24);
  if (v2) {
    char v2 = *(unsigned char *)(a1 + 56) == 0;
  }
  *(unsigned char *)(v1 + 24) = v2;
  if (*(unsigned char *)(a1 + 56)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 0x10uLL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __85__PKSecurityCapabilitiesController__isEnabledForSecurityRequirements_withCompletion___block_invoke_5(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    long long v3 = PKSecurityCapabilitiesRequirementToString(a1[7]);
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    long long v5 = PKSecurityCapabilitiesRequirementToString(*(void *)(*(void *)(a1[6] + 8) + 24));
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    char v12 = v5;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking security requirements for %@. isEnabled %@, missing requirements: %@", (uint8_t *)&v7, 0x20u);
  }
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 24));
  }
  return result;
}

- (id)_missingTLKsAlertController
{
  unint64_t feature = self->_feature;
  if (feature > 5)
  {
    id v4 = 0;
    long long v3 = 0;
  }
  else
  {
    if (((1 << feature) & 0x39) != 0)
    {
      long long v3 = PKLocalizedPaymentString(&cfstr_TlksResetFaile.isa);
      PKLocalizedPaymentString(&cfstr_TlksResetFaile_0.isa);
    }
    else
    {
      long long v3 = PKLocalizedFeatureString();
      PKLocalizedFeatureString();
    id v4 = };
  }
  long long v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  return v5;
}

- (id)_genericDisplayableError
{
  char v2 = 0;
  long long v3 = 0;
  switch(self->_feature)
  {
    case 0uLL:
    case 5uLL:
      char v2 = PKLocalizedPaymentString(&cfstr_GenericErrorTi.isa);
      uint64_t v4 = PKLocalizedPaymentString(&cfstr_GenericErrorMe.isa);
      goto LABEL_5;
    case 1uLL:
      char v2 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_0.isa);
      uint64_t v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_1.isa);
      goto LABEL_5;
    case 2uLL:
      char v2 = PKLocalizedFeatureString();
      uint64_t v4 = PKLocalizedFeatureString();
LABEL_5:
      long long v3 = (void *)v4;
      break;
    default:
      break;
  }
  long long v5 = PKDisplayableErrorCustom();

  return v5;
}

- (id)_createAuthContext
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  uint64_t v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  long long v5 = [MEMORY[0x1E4F4EF40] sharedInstance];
  uint64_t v6 = [v5 altDSIDForAccount:v4];

  id v7 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  [v7 setAltDSID:v6];
  [v7 setSecurityUpgradeContext:*MEMORY[0x1E4F4EEF8]];
  uint64_t v8 = [(PKSecurityCapabilitiesController *)self _authenticationReason];
  [v7 setReason:v8];

  return v7;
}

- (void)_isManateeCapableWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    cloudService = self->_cloudService;
    uint64_t v6 = PKCurrentCloudStoreApplePayContainerName();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PKSecurityCapabilitiesController__isManateeCapableWithCompletion___block_invoke;
    v7[3] = &unk_1E59D0DA0;
    id v8 = v4;
    [(PKCloudStoreService *)cloudService cloudStoreStatusForContainer:v6 completion:v7];
  }
}

uint64_t __68__PKSecurityCapabilitiesController__isManateeCapableWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v5 supportsDeviceToDeviceEncryption];
  uint64_t v7 = [v5 needsToVerifyTerms];

  id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v8(v4, v6, a3, v7);
}

- (void)_isMissingTLKsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    cloudService = self->_cloudService;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__PKSecurityCapabilitiesController__isMissingTLKsWithCompletion___block_invoke;
    v7[3] = &unk_1E59CE160;
    id v8 = v4;
    [(PKCloudStoreService *)cloudService checkTLKsMissingWithCompletion:v7];
  }
}

uint64_t __65__PKSecurityCapabilitiesController__isMissingTLKsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_authenticationReason
{
  id v3 = [MEMORY[0x1E4F843F0] sharedInstance];
  id v4 = [v3 appleAccountInformation];

  if (self->_feature - 1 > 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    int IsBridge = PKPaymentSetupContextIsBridge();
    uint64_t v6 = PKDeviceSpecificLocalizedStringKeyForKey(@"ACCOUNT_PROVISION_PASS_AUTHENTICATION_REASON_FORMAT", IsBridge);
    __int16 v9 = [v4 appleID];
    uint64_t v7 = PKLocalizedFeatureString();
  }

  return v7;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (unint64_t)securityRequirements
{
  return self->_securityRequirements;
}

- (int64_t)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudService, 0);

  objc_storeStrong((id *)&self->_authContext, 0);
}

@end