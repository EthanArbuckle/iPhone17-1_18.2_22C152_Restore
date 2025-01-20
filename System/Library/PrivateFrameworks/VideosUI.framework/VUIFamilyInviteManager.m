@interface VUIFamilyInviteManager
- (ACAccountStore)store;
- (AIDAAccountManager)accountManager;
- (VUIFamilyInviteManager)init;
- (id)accountsForAccountManager:(id)a3;
- (void)presentFamilySetupScreenIfEligible:(id)a3 checkEligibility:(BOOL)a4;
- (void)presentFamilySetupScreenWithBuyParams:(id)a3;
@end

@implementation VUIFamilyInviteManager

- (VUIFamilyInviteManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)VUIFamilyInviteManager;
  v2 = [(VUIFamilyInviteManager *)&v10 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    store = v2->_store;
    v2->_store = v3;

    id v5 = objc_alloc(MEMORY[0x1E4F4D920]);
    v6 = [(VUIFamilyInviteManager *)v2 store];
    uint64_t v7 = [v5 initWithAccountStore:v6];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AIDAAccountManager *)v7;

    [(AIDAAccountManager *)v2->_accountManager setDelegate:v2];
  }
  return v2;
}

- (void)presentFamilySetupScreenIfEligible:(id)a3 checkEligibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke;
  aBlock[3] = &unk_1E6DF3D58;
  id v7 = v6;
  id v16 = v7;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (v4)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F61888]);
    v11 = [(VUIFamilyInviteManager *)self accountManager];
    v12 = (void *)[v10 initWithAccountManager:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_46;
    v13[3] = &unk_1E6DF6BB8;
    id v14 = v9;
    [v12 requestFamilyEligibilityWithCompletion:v13];
  }
  else
  {
    (*((void (**)(void *))v8 + 2))(v8);
  }
}

void __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_2;
  block[3] = &unk_1E6DF3D58;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F61878]);
  v3 = (void *)[v2 initWithEventType:*MEMORY[0x1E4F61870]];
  [v3 setClientName:@"AppleTV"];
  BOOL v4 = *(void **)(a1 + 32);
  if (v4 && [v4 count]) {
    [v3 setAdditionalParameters:*(void *)(a1 + 32)];
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  id v14 = __Block_byref_object_dispose__6;
  id v15 = objc_alloc_init(MEMORY[0x1E4F61880]);
  id v5 = +[VUIApplicationRouter currentNavigationController];
  if (!v5)
  {
    id v6 = +[VUITVAppLauncher sharedInstance];
    id v7 = [v6 appWindow];
    id v5 = [v7 rootViewController];
  }
  [(id)v11[5] setPresenter:v5];
  v8 = (void *)v11[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_33;
  v9[3] = &unk_1E6DF6B90;
  v9[4] = &v10;
  [v8 performOperationWithContext:v3 completion:v9];

  _Block_object_dispose(&v10, 8);
}

void __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    if (v5)
    {
      v8 = [v5 description];
    }
    else
    {
      v8 = @"no error";
    }
    int v11 = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::FACircleStateController completion -- success: %@ -- error: %@", (uint8_t *)&v11, 0x16u);
    if (v5) {
  }
    }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 eligibilityStatus];
  id v7 = VUIDefaultLogObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == 1)
  {
    if (v8)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::presentFamilySetupScreenIfEligible eligible for family.  Presenting Family Setup Screen", (uint8_t *)&v10, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = [v5 description];
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::presentFamilySetupScreenIfEligible not eligible for family -- error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)presentFamilySetupScreenWithBuyParams:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = +[VUIActionCommerceTransaction extractSalableAdamIDFromBuyParams:](VUIActionCommerceTransaction, "extractSalableAdamIDFromBuyParams:");
    id v5 = [v4 copy];

    if (v5)
    {
      BOOL v8 = @"salableAdamId";
      v9[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      [(VUIFamilyInviteManager *)self presentFamilySetupScreenIfEligible:v6 checkEligibility:1];
    }
    else
    {
      uint64_t v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::Failed to find salableAdamId from buyparams. Not presenting family setup screen.", v7, 2u);
      }
    }
  }
  else
  {
    id v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::Missing buyparams. Not presenting family setup screen.", v7, 2u);
    }
  }
}

- (id)accountsForAccountManager:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 accountStore];

  id v7 = objc_msgSend(v6, "aa_primaryAppleAccount");

  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F4D8E8]];
  }
  BOOL v8 = (void *)[v5 copy];

  return v8;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end