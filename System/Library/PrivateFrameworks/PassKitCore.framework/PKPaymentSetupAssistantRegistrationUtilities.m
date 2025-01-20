@interface PKPaymentSetupAssistantRegistrationUtilities
+ (BOOL)setupAssistantNeedsToRun:(unint64_t)a3 returningRequirements:(unint64_t *)a4;
+ (void)preflightPaymentSetupProvisioningController:(id)a3 forSetupAssistant:(unint64_t)a4 withCompletion:(id)a5;
@end

@implementation PKPaymentSetupAssistantRegistrationUtilities

+ (void)preflightPaymentSetupProvisioningController:(id)a3 forSetupAssistant:(unint64_t)a4 withCompletion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Performing -[PKPaymentRegistrationUtilities preflightPaymentSetupProvisioningController:forSetupAssistant:withCompletion:]", buf, 2u);
  }

  if (PKNetworkConnectivityAvailable())
  {
    v9 = [v6 webService];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke;
    v10[3] = &unk_1E56D9528;
    id v11 = v6;
    id v12 = v7;
    +[PKPaymentRegistrationUtilities configureWebServiceIfNecessary:v9 completion:v10];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Buddy provisioning disabled because device is not online", buf, 2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_130;
    block[3] = &unk_1E56D8A18;
    v5 = &v9;
    id v9 = v3;
    id v6 = &v10;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) webService];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_2;
    v11[3] = &unk_1E56DCA00;
    v5 = &v12;
    id v12 = *(id *)(a1 + 32);
    id v6 = (id *)v13;
    v13[0] = *(id *)(a1 + 40);
    v13[1] = 2;
    +[PKPaymentRegistrationUtilities _shouldShowAddCardFlowForWebService:v7 options:2 completion:v11];
  }
}

void __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) webService];
    v4 = [v3 targetDevice];
    v5 = [v4 deviceRegion];

    id v6 = [*(id *)(a1 + 32) webService];
    id v7 = [v6 context];
    v8 = [v7 configuration];
    int v9 = [v8 buddyProvisioningEnabledForRegion:v5];

    if (v9)
    {
      id v10 = v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      id v11 = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_3;
    }
    else
    {
      id v10 = v16;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      id v11 = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_4;
    }
    v10[2] = v11;
    v10[3] = &unk_1E56D8360;
    void v10[4] = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_129;
    v13[3] = &unk_1E56DC4C0;
    id v12 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v14 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v13);
    v5 = v14;
  }
}

uint64_t __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = PKCurrentRegion();
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Buddy provisioning disabled in current region (%{public}@). Skipping.", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_129(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Add card flow not supported in due to missing options %lu. Skipping.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __125__PKPaymentSetupAssistantRegistrationUtilities_preflightPaymentSetupProvisioningController_forSetupAssistant_withCompletion___block_invoke_130(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = PKCurrentRegion();
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Setup not supported in current region (%{public}@). Skipping. (Error: %{public}@)", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)setupAssistantNeedsToRun:(unint64_t)a3 returningRequirements:(unint64_t *)a4
{
  int v5 = [[PKSetupAssistantUtilityContext alloc] initWithSetupAssistant:a3];
  int v6 = [[PKPaymentSetupAssistantCoreController alloc] initWithSetupAssistantContext:v5];
  LOBYTE(a4) = [(PKPaymentSetupAssistantCoreController *)v6 _setupAssistantNeedsToRunReturningRequirements:a4];

  return (char)a4;
}

@end