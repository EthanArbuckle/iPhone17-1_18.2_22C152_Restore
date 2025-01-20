@interface ICSSettingsHelper
+ (id)getWebAccessStatusUpdateHook;
+ (void)repairPrimaryAppleAccountInViewController:(id)a3 completion:(id)a4;
+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4;
+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4 highlightRowIdentifier:(id)a5;
@end

@implementation ICSSettingsHelper

+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting Account recovery flow.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v6);
  objc_initWeak(&location, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__ICSSettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke;
  v11[3] = &unk_2655B5E70;
  objc_copyWeak(&v12, (id *)buf);
  objc_copyWeak(&v13, &location);
  [a1 repairPrimaryAppleAccountInViewController:v6 completion:v11];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __74__ICSSettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_copyWeak(&to, (id *)(a1 + 32));
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v6 = objc_loadWeakRetained(&to);
  if (v6)
  {
    id v7 = objc_loadWeakRetained(&v18);
    if (!v7) {
      a2 = 0;
    }

    if (a2)
    {
      v8 = MEMORY[0x263EF83A0];
      id v9 = MEMORY[0x263EF83A0];
      dispatch_assert_queue_V2(v8);

      id v10 = objc_alloc(MEMORY[0x263F25C80]);
      id v11 = objc_loadWeakRetained(&v18);
      id v12 = (void *)[v10 initWithAccountManager:v11];

      id v13 = objc_loadWeakRetained(&to);
      [v13 showViewController:v12 sender:v13];
    }
  }
  v14 = _AAUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_loadWeakRetained(&to);
    v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412546;
    v21 = v17;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_262993000, v14, OS_LOG_TYPE_DEFAULT, "%@: Account recovery flow completed with error: %@", buf, 0x16u);
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&to);
}

+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4 highlightRowIdentifier:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412290;
    v21 = v13;
    _os_log_impl(&dword_262993000, v11, OS_LOG_TYPE_DEFAULT, "%@: Starting Account recovery flow.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v8);
  objc_initWeak(&location, v9);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__ICSSettingsHelper_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier___block_invoke;
  v15[3] = &unk_2655B5E98;
  objc_copyWeak(&v17, (id *)buf);
  objc_copyWeak(&v18, &location);
  id v14 = v10;
  id v16 = v14;
  [a1 repairPrimaryAppleAccountInViewController:v8 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __97__ICSSettingsHelper_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  objc_copyWeak(&v18, (id *)(a1 + 48));
  id v6 = objc_loadWeakRetained(&to);
  if (v6)
  {
    id v7 = objc_loadWeakRetained(&v18);
    if (!v7) {
      a2 = 0;
    }

    if (a2)
    {
      id v8 = MEMORY[0x263EF83A0];
      id v9 = MEMORY[0x263EF83A0];
      dispatch_assert_queue_V2(v8);

      id v10 = objc_alloc(MEMORY[0x263F25C80]);
      id v11 = objc_loadWeakRetained(&v18);
      id v12 = (void *)[v10 initWithAccountManager:v11 highlightRowIdentifier:*(void *)(a1 + 32)];

      id v13 = objc_loadWeakRetained(&to);
      [v13 showViewController:v12 sender:v13];
    }
  }
  id v14 = _AAUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_loadWeakRetained(&to);
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412546;
    v21 = v17;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_262993000, v14, OS_LOG_TYPE_DEFAULT, "%@: Account recovery flow completed with error: %@", buf, 0x16u);
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&to);
}

+ (void)repairPrimaryAppleAccountInViewController:(id)a3 completion:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F25C98];
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)[[v5 alloc] initWithType:2];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F25CF0]) initWithFlowContext:v9 withPresentingViewController:v7];

  [v8 repairIfPrimaryAppleAccountIsCDP:v6];
}

+ (id)getWebAccessStatusUpdateHook
{
  v2 = objc_alloc_init(ICSCDPWebAccessStatusUpdateHook);

  return v2;
}

@end