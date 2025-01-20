@interface PKPaymentRegistrationUtilities
+ (BOOL)_isPaymentSetupSupportedForWebService:(id)a3;
+ (void)_shouldShowAddCardFlowForWebService:(id)a3 completion:(id)a4;
+ (void)_shouldShowAddCardFlowForWebService:(id)a3 options:(unint64_t)a4 completion:(id)a5;
+ (void)configureWebServiceIfNecessary:(id)a3 completion:(id)a4;
+ (void)registrationIsSupportedInCurrentRegionWithWebService:(id)a3 completion:(id)a4;
+ (void)shouldShowPasscodeAccessibilityOverride:(id)a3 completion:(id)a4;
+ (void)shouldShowWalletInBuddy:(id)a3 completion:(id)a4;
+ (void)shouldShowWalletInDigitalSeparation:(id)a3 withDeviceSpecificCompletion:(id)a4;
+ (void)shouldShowWalletInSettings:(id)a3 completion:(id)a4;
+ (void)shouldShowWalletInSettingsWithApplePaySupportInformation:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentRegistrationUtilities

+ (void)shouldShowWalletInSettingsWithApplePaySupportInformation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__PKPaymentRegistrationUtilities_shouldShowWalletInSettingsWithApplePaySupportInformation_completion___block_invoke;
  v10[3] = &unk_1E56DC960;
  id v12 = v7;
  id v13 = a1;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [a1 configureWebServiceIfNecessary:v9 completion:v10];
}

+ (void)configureWebServiceIfNecessary:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 needsConfiguration])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke;
    v10[3] = &unk_1E56DC9D8;
    id v7 = &v11;
    id v11 = v6;
    [v5 configurePaymentServiceWithCompletion:v10];
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke_3;
    v8[3] = &unk_1E56D8360;
    id v7 = &v9;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
    goto LABEL_5;
  }
LABEL_6:
}

void __102__PKPaymentRegistrationUtilities_shouldShowWalletInSettingsWithApplePaySupportInformation_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) targetDevice];
  unsigned int v5 = [v4 paymentWebService:*(void *)(a1 + 32) hasPassesOfType:1];

  int IsAvailable = PKDaemonIsAvailable();
  if (IsAvailable || v5)
  {
    if ((unint64_t)PKCurrentPassbookState() < 2)
    {
      uint64_t v7 = 1;
      goto LABEL_9;
    }
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Wallet has been deleted, disabling showWalletSettings", buf, 2u);
    }
  }
  uint64_t v7 = 0;
LABEL_9:
  int v9 = [*(id *)(a1 + 48) _isPaymentSetupSupportedForWebService:*(void *)(a1 + 32)];
  uint64_t v10 = v9 | v5;
  id v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = IsAvailable;
    id v13 = v3;
    if (v7) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    if (v12) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    v22 = v15;
    unsigned int v23 = v7;
    if (v5) {
      v16 = @"YES";
    }
    else {
      v16 = @"NO";
    }
    uint64_t v17 = PKCurrentRegion();
    v18 = (void *)v17;
    *(_DWORD *)buf = 138545154;
    if (v10) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    v25 = v14;
    id v3 = v13;
    if (v9) {
      v20 = @"YES";
    }
    else {
      v20 = @"NO";
    }
    __int16 v26 = 2114;
    v27 = v22;
    __int16 v28 = 2114;
    v29 = v16;
    __int16 v30 = 2114;
    uint64_t v31 = v17;
    __int16 v32 = 2114;
    v33 = v19;
    __int16 v34 = 2114;
    v35 = v16;
    uint64_t v7 = v23;
    __int16 v36 = 2114;
    v37 = v20;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "shouldShowWalletInSettingsWithApplePaySupportInformation - settings should show returned: %{public}@ (daemonIsAvailable: %{public}@ or hasPaymentPasses: %{public}@) supported in current region (%{public}@) returned: %{public}@ (hasPaymentPasses: %{public}@ or canAddPaymentPasses: %{public}@) error: %@", buf, 0x52u);
  }
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v21 + 16))(v21, v7, v10, v3);
  }
}

+ (BOOL)_isPaymentSetupSupportedForWebService:(id)a3
{
  return [a3 paymentSetupSupportedInRegion] == 1;
}

uint64_t __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)shouldShowWalletInBuddy:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "shouldShowWalletInBuddy supported", v8, 2u);
  }

  if (v6) {
    v6[2](v6, 1, 0);
  }
}

+ (void)shouldShowWalletInSettings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PKPaymentRegistrationUtilities_shouldShowWalletInSettings_completion___block_invoke;
  v8[3] = &unk_1E56DC938;
  id v9 = v6;
  id v7 = v6;
  [a1 shouldShowWalletInSettingsWithApplePaySupportInformation:a3 completion:v8];
}

uint64_t __72__PKPaymentRegistrationUtilities_shouldShowWalletInSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)shouldShowWalletInDigitalSeparation:(id)a3 withDeviceSpecificCompletion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke;
    v9[3] = &unk_1E56D9528;
    uint64_t v10 = v6;
    id v11 = v7;
    [a1 configureWebServiceIfNecessary:v10 completion:v9];

    id v8 = v10;
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "+[PKPaymentRegistrationUtilities shouldShowWalletInDigitalSeparation:withDeviceSpecificCompletion:]";
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%s called with no completion", buf, 0xCu);
    }
  }
}

void __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v4 = dispatch_group_create();
  id v5 = [*(id *)(a1 + 32) targetDevice];
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v4);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_2;
    v18[3] = &unk_1E56DC988;
    v20 = v23;
    v19 = v4;
    [v5 hasActiveExternallySharedPasses:v18];
  }
  id v6 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_0[0]());
  SEL v7 = NSSelectorFromString(&cfstr_Hasactiveexter.isa);
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v4);
    id v8 = (void (*)(id, SEL, void *))[v6 methodForSelector:v7];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_3;
    v15[3] = &unk_1E56DC988;
    uint64_t v17 = v21;
    v16 = v4;
    v8(v6, v7, v15);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_4;
  v10[3] = &unk_1E56DC9B0;
  id v13 = v23;
  uint64_t v14 = v21;
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  id v9 = v3;
  dispatch_group_notify(v4, MEMORY[0x1E4F14428], v10);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

void __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_3(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __99__PKPaymentRegistrationUtilities_shouldShowWalletInDigitalSeparation_withDeviceSpecificCompletion___block_invoke_4(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      id v3 = @"YES";
    }
    else {
      id v3 = @"NO";
    }
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
      v4 = @"YES";
    }
    else {
      v4 = @"NO";
    }
    uint64_t v5 = a1[4];
    int v7 = 138543874;
    id v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "shouldShowWalletInDigitalSeparation - digital separation should show returned: sharesOnDevice (%{public}@), sharesOnCompanion (%{public}@) error: %@", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

+ (void)shouldShowPasscodeAccessibilityOverride:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PKPaymentRegistrationUtilities_shouldShowPasscodeAccessibilityOverride_completion___block_invoke;
  v10[3] = &unk_1E56D9528;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [a1 configureWebServiceIfNecessary:v9 completion:v10];
}

void __85__PKPaymentRegistrationUtilities_shouldShowPasscodeAccessibilityOverride_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) registrationSetupSupportedInRegion];
  uint64_t v5 = [*(id *)(a1 + 32) targetDevice];
  unsigned int v6 = [v5 paymentWebService:*(void *)(a1 + 32) hasPassesOfType:1];

  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 | v6) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    uint64_t v9 = PKCurrentRegion();
    uint64_t v10 = (void *)v9;
    int v14 = 138544386;
    if (v4) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    v15 = v8;
    if (v6) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "shouldShowPasscodeAccessibilityOverride shouldShow: %{public}@ in (%{public}@) region - registration supported: %{public}@, hasPaymentPasses:%{public}@ error: %@", (uint8_t *)&v14, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, v4 | v6, v3);
  }
}

void __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke_2;
    v6[3] = &unk_1E56D83D8;
    id v8 = v5;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __76__PKPaymentRegistrationUtilities_configureWebServiceIfNecessary_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)_shouldShowAddCardFlowForWebService:(id)a3 completion:(id)a4
{
}

+ (void)_shouldShowAddCardFlowForWebService:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke;
    aBlock[3] = &unk_1E56D8ED8;
    uint64_t v17 = v8;
    uint64_t v10 = _Block_copy(aBlock);
    if (a4)
    {
      if ((a4 & 1) == 0
        || +[PKPaymentRegistrationUtilities _isPaymentSetupSupportedForWebService:v7])
      {
        if ((a4 & 2) != 0)
        {
          id v11 = objc_alloc_init(PKPaymentService);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke_37;
          v14[3] = &unk_1E56D9100;
          id v15 = v10;
          [(PKPaymentService *)v11 familyMembersWithCompletion:v14];
        }
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "_shouldShowAddCardFlowForWebService called with no options", buf, 2u);
      }
    }
    (*((void (**)(void *, void))v10 + 2))(v10, 0);
LABEL_13:

    id v12 = v17;
    goto LABEL_14;
  }
  id v12 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "_shouldShowAddCardFlowForWebService called with no completion", buf, 2u);
  }
LABEL_14:
}

void __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke_2;
  v3[3] = &unk_1E56D8680;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __89__PKPaymentRegistrationUtilities__shouldShowAddCardFlowForWebService_options_completion___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isMe", (void)v9))
      {
        if ([v8 memberType] == 2) {
          break;
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)registrationIsSupportedInCurrentRegionWithWebService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__PKPaymentRegistrationUtilities_registrationIsSupportedInCurrentRegionWithWebService_completion___block_invoke;
  v10[3] = &unk_1E56DC960;
  id v12 = v7;
  id v13 = a1;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [a1 configureWebServiceIfNecessary:v9 completion:v10];
}

void __98__PKPaymentRegistrationUtilities_registrationIsSupportedInCurrentRegionWithWebService_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__PKPaymentRegistrationUtilities_registrationIsSupportedInCurrentRegionWithWebService_completion___block_invoke_2;
  v7[3] = &unk_1E56D86A8;
  id v8 = v3;
  uint64_t v5 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  [v5 _shouldShowAddCardFlowForWebService:v4 completion:v7];
}

uint64_t __98__PKPaymentRegistrationUtilities_registrationIsSupportedInCurrentRegionWithWebService_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = PKCurrentRegion();
    id v6 = @"NO";
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138543874;
    id v11 = v5;
    if (a2) {
      id v6 = @"YES";
    }
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "shouldShowWalletInPreferences supported in current region (%{public}@) returned: %{public}@, error: %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    if (a2) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, v9, *(void *)(a1 + 32));
  }
  return result;
}

@end