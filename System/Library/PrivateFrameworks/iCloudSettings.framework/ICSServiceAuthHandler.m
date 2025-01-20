@interface ICSServiceAuthHandler
- (AIDAServiceOwnerProtocol)serviceOwnersManager;
- (BOOL)accountMatchesPrimaryAccount:(id)a3 service:(id)a4;
- (ICSServiceAuthHandler)initWithAccountManager:(id)a3;
- (ICSServiceAuthHandler)initWithAccountManager:(id)a3 presenter:(id)a4;
- (id)account;
- (void)signInAccountForService:(id)a3 completion:(id)a4;
- (void)signOutAccountForService:(id)a3 completion:(id)a4;
@end

@implementation ICSServiceAuthHandler

- (ICSServiceAuthHandler)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSServiceAuthHandler;
  v9 = [(ICSServiceAuthHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
  }

  return v10;
}

- (ICSServiceAuthHandler)initWithAccountManager:(id)a3
{
  return [(ICSServiceAuthHandler *)self initWithAccountManager:a3 presenter:0];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  serviceOwnersManager = self->_serviceOwnersManager;
  if (!serviceOwnersManager)
  {
    id v4 = objc_alloc(MEMORY[0x263F26D88]);
    v5 = [(AIDAAccountManager *)self->_accountManager accountStore];
    v6 = (AIDAServiceOwnerProtocol *)[v4 initWithAccountStore:v5];
    id v7 = self->_serviceOwnersManager;
    self->_serviceOwnersManager = v6;

    serviceOwnersManager = self->_serviceOwnersManager;
  }

  return serviceOwnersManager;
}

- (void)signInAccountForService:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke;
  aBlock[3] = &unk_2655B5D58;
  id v8 = v7;
  id v43 = v8;
  v9 = _Block_copy(aBlock);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_3;
  v39[3] = &unk_2655B5DD0;
  v39[4] = self;
  id v10 = v6;
  id v40 = v10;
  id v11 = v9;
  id v41 = v11;
  objc_super v12 = _Block_copy(v39);
  v13 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager accountForService:v10];
  if (v13)
  {
    BOOL v14 = [(ICSServiceAuthHandler *)self accountMatchesPrimaryAccount:v13 service:v10];
    v15 = LogSubsystem();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v10;
        _os_log_impl(&dword_262993000, v15, OS_LOG_TYPE_DEFAULT, "Already signed in to service %@, marking as such...", buf, 0xCu);
      }

      (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
    }
    else
    {
      v34 = v12;
      v35 = v8;
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v10;
        _os_log_impl(&dword_262993000, v15, OS_LOG_TYPE_DEFAULT, "User already signed in to service %@, prompting for clarification...", buf, 0xCu);
      }

      v17 = AALocalizedStringForServiceType();
      v32 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"ICLOUD_SERVICE_SWAP_ACCOUNT_MESSAGE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      v20 = [(ICSServiceAuthHandler *)self account];
      v21 = [v20 username];
      v22 = [v13 username];
      v33 = objc_msgSend(v32, "stringWithFormat:", v19, v17, v21, v22);

      v23 = NSString;
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"ICLOUD_SERVICE_SWAP_ACCOUNT_ACTION" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      v31 = objc_msgSend(v23, "stringWithFormat:", v25, v17);

      v26 = (void *)MEMORY[0x263F82418];
      v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"CANCEL" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_78;
      v36[3] = &unk_2655B5DF8;
      id v8 = v35;
      id v37 = v35;
      id v38 = v34;
      v29 = [v26 alertWithTitle:v33 message:0 cancelButtonTitle:v28 defaultButtonTitle:v31 actionHandler:v36];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      [WeakRetained presentViewController:v29 animated:1 completion:0];

      objc_super v12 = v34;
    }
  }
  else
  {
    (*((void (**)(void *, void))v12 + 2))(v12, 0);
  }
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_2;
  v3[3] = &unk_2655B56D8;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_3(id *a1, char a2)
{
  id v4 = objc_alloc_init(MEMORY[0x263F292A8]);
  char v5 = [a1[4] account];
  id v6 = objc_msgSend(v5, "aa_altDSID");
  [v4 setAltDSID:v6];

  [v4 setIsUsernameEditable:0];
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 2);
  [v4 setPresentingViewController:WeakRetained];

  id v8 = a1[5];
  if ([v8 isEqualToString:*MEMORY[0x263F26D28]])
  {
    uint64_t v9 = 1;
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F26D48]])
  {
    uint64_t v9 = 2;
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F26D40]])
  {
    uint64_t v9 = 4;
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F26D30]])
  {
    uint64_t v9 = 5;
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F26D38]])
  {
    uint64_t v9 = 6;
  }
  else
  {
    uint64_t v9 = 0;
  }

  [v4 setServiceType:v9];
  id v10 = [a1[4] account];
  id v11 = [v10 username];
  [v4 setUsername:v11];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = objc_alloc_init(MEMORY[0x263F29118]);
  objc_super v12 = (void *)v22[5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_44;
  v16[3] = &unk_2655B5DA8;
  v19 = &v21;
  id v13 = a1[6];
  char v20 = a2;
  id v14 = a1[4];
  id v15 = a1[5];
  id v18 = v13;
  v16[4] = v14;
  id v17 = v15;
  [v12 authenticateWithContext:v4 completion:v16];

  _Block_object_dispose(&v21, 8);
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (v6)
  {
    uint64_t v9 = LogSubsystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_44_cold_1((uint64_t)v6, v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263F26D78]);
    [v10 setAuthenticationResults:v5];
    [v10 setShouldForceOperation:*(unsigned __int8 *)(a1 + 64)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v10 setViewController:WeakRetained];

    objc_super v12 = *(void **)(a1 + 40);
    if (v12 == (void *)*MEMORY[0x263F26D38])
    {
      uint64_t v18 = *(void *)(a1 + 40);
      v19[0] = &unk_270E05C18;
      id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      [v10 setSignInContexts:v13];

      objc_super v12 = *(void **)(a1 + 40);
    }
    id v14 = *(void **)(*(void *)(a1 + 32) + 24);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_51;
    v15[3] = &unk_2655B5D80;
    id v16 = v12;
    id v17 = *(id *)(a1 + 48);
    [v14 signInService:v16 withContext:v10 completion:v15];
  }
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_51(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = LogSubsystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    objc_super v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "Signed in to service %{public}@ with success: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_78(uint64_t a1, int a2)
{
  id v4 = LogSubsystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "User chose not to swap, bailing!", buf, 2u);
    }

    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "User opted to swap accounts, on it!", v8, 2u);
    }

    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v6();
}

- (void)signOutAccountForService:(id)a3 completion:(id)a4
{
  v37[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  id v8 = objc_alloc(MEMORY[0x263F25D60]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v31 = (id)[v8 initWithPresentingViewController:WeakRetained];

  [(id)v27[5] setAccountManager:self->_accountManager];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke;
  aBlock[3] = &unk_2655B5E20;
  v25 = &v26;
  id v10 = v7;
  id v24 = v10;
  __int16 v11 = _Block_copy(aBlock);
  id v12 = objc_alloc_init(MEMORY[0x263F26D78]);
  id v13 = objc_loadWeakRetained((id *)&self->_listController);
  [v12 setViewController:v13];

  if ((id)*MEMORY[0x263F26D38] == v6)
  {
    uint64_t v15 = v27[5];
    v36[0] = *MEMORY[0x263F26D28];
    v36[1] = v6;
    v37[0] = v15;
    v37[1] = &unk_270E05C40;
    [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    uint64_t v34 = *MEMORY[0x263F26D28];
    uint64_t v35 = v27[5];
    [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v14 = };
  [v12 setSignOutContexts:v14];

  id v16 = LogSubsystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v6;
    _os_log_impl(&dword_262993000, v16, OS_LOG_TYPE_DEFAULT, "Attempting sign out for service: %{public}@", buf, 0xCu);
  }

  serviceOwnersManager = self->_serviceOwnersManager;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke_87;
  v20[3] = &unk_2655B5D80;
  id v18 = v6;
  id v21 = v18;
  id v19 = v11;
  id v22 = v19;
  [(AIDAServiceOwnerProtocol *)serviceOwnersManager signOutService:v18 withContext:v12 completion:v20];

  _Block_object_dispose(&v26, 8);
}

void __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke_2;
  v6[3] = &unk_2655B56D8;
  id v7 = *(id *)(a1 + 32);
  char v8 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke_87(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = LogSubsystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      char v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "Signed out of service: %{public}@, success: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (BOOL)accountMatchesPrimaryAccount:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v6 service:v7];
  if (v8)
  {
    int v9 = NSNumber;
    uint64_t v10 = [(ICSServiceAuthHandler *)self account];
    __int16 v11 = objc_msgSend(v10, "aa_altDSID");
    id v12 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "isEqualToString:", v8));
    __int16 v13 = v12;
  }
  else
  {
    uint64_t v10 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager DSIDForAccount:v6 service:v7];
    id v14 = NSNumber;
    uint64_t v15 = [(ICSServiceAuthHandler *)self account];
    __int16 v11 = v15;
    if (v10)
    {
      id v12 = objc_msgSend(v15, "aa_personID");
      id v16 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v12, "isEqualToString:", v10));
      __int16 v13 = v16;
    }
    else
    {
      id v12 = [v15 username];
      id v16 = [v6 username];
      __int16 v13 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v12, "isEqualToString:", v16));
    }
  }

  return v13 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_destroyWeak((id *)&self->_listController);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_44_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "AuthKit authentication returned an error: %@", (uint8_t *)&v2, 0xCu);
}

@end