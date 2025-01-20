@interface STRootViewControllerProvider
+ (id)rootViewControllerForDSID:(id)a3;
+ (void)requestRootViewControllerForDSID:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
@end

@implementation STRootViewControllerProvider

+ (id)rootViewControllerForDSID:(id)a3
{
  id v3 = a3;
  v4 = [[STRootViewModelCoordinator alloc] initWithUserDSID:v3 deviceIdentifier:0 usageReportType:0 usageContext:0];

  if (_os_feature_enabled_impl())
  {
    v5 = [(STRootViewModelCoordinator *)v4 viewModel];
    v6 = [v5 me];
    if ([v6 isRemoteUser])
    {
      v7 = [(STRootViewModelCoordinator *)v4 viewModel];
      v8 = [v7 me];
      char v9 = [v8 isManaged];

      if ((v9 & 1) == 0)
      {
        v10 = (STRootViewController *)objc_opt_new();
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v10 = [[STRootViewController alloc] initWithRootViewModelCoordinator:v4];
LABEL_7:
  v11 = v10;

  return v11;
}

+ (void)requestRootViewControllerForDSID:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = (void (**)(id, void *))a5;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v27 = v7;
    v28 = [[STRootViewModelCoordinator alloc] initWithUserDSID:v27 deviceIdentifier:0 usageReportType:0 usageContext:0];
    if (_os_feature_enabled_impl())
    {
      v29 = [(STRootViewModelCoordinator *)v28 viewModel];
      v30 = [v29 me];
      if ([v30 isRemoteUser])
      {
        v31 = [(STRootViewModelCoordinator *)v28 viewModel];
        [v31 me];
        v33 = id v32 = v8;
        char v38 = [v33 isManaged];

        id v8 = v32;
        if ((v38 & 1) == 0)
        {
          v34 = (STRootViewController *)objc_opt_new();
LABEL_14:
          v35 = v34;

          v9[2](v9, v35);
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    v34 = [[STRootViewController alloc] initWithRootViewModelCoordinator:v28];
    goto LABEL_14;
  }
  id v37 = v8;
  v10 = +[STUsageDetailsViewModelCoordinator defaultDeviceIdentifierForChild:v7];
  v11 = +[STUsageDetailsViewModelCoordinator defaultUsageReportTypeForChild:v7];
  v12 = [[STRootViewModelCoordinator alloc] initWithUserDSID:v7 deviceIdentifier:v10 usageReportType:v11 usageContext:0];
  v13 = [[STRootViewController alloc] initWithRootViewModelCoordinator:v12];
  v14 = [(STRootViewModelCoordinator *)v12 viewModel];
  v15 = [v14 me];
  if (([v15 isRemoteUser] & 1) == 0)
  {

    goto LABEL_10;
  }
  [(STRootViewModelCoordinator *)v12 viewModel];
  v36 = v9;
  id v16 = v7;
  v17 = v13;
  v18 = v11;
  v20 = v19 = v10;
  v21 = [v20 me];
  char v22 = [v21 isManaged];

  v10 = v19;
  v11 = v18;
  v13 = v17;
  id v7 = v16;
  char v9 = v36;

  if (v22)
  {
LABEL_10:
    v9[2](v9, v13);
    id v8 = v37;
    goto LABEL_11;
  }
  [(STRootViewModelCoordinator *)v12 setHasShownMiniBuddy:1];
  v23 = [[STIntroductionController alloc] initWithNewUserRootViewModelCoordinator:v12];
  v24 = [(STRootViewModelCoordinator *)v12 viewModel];
  v25 = [v24 me];
  char v26 = [v25 isRemoteUser];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke;
  v39[3] = &unk_264768C48;
  v40 = v12;
  v42 = v36;
  char v43 = v26;
  v41 = v13;
  [(STIntroductionController *)v23 setCompletionBlock:v39];
  id v8 = v37;
  [(STIntroductionController *)v23 presentOverViewController:v37];

LABEL_11:
LABEL_15:
}

void __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 parentalControlsPasscode];
    char v9 = [v6 recoveryAltDSID];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke_2;
    v10[3] = &unk_264768C20;
    id v14 = *(id *)(a1 + 48);
    char v15 = *(unsigned char *)(a1 + 56);
    id v11 = v6;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    [v7 enableManagementWithPIN:v8 recoveryAltDSID:v9 completionHandler:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke_2_cold_1((uint64_t)v3);
    }
    v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    if (*(unsigned char *)(a1 + 64) || [*(id *)(a1 + 32) deviceForChild]) {
      [*(id *)(a1 + 40) applyIntroductionViewModel:*(void *)(a1 + 32) withCompletionHandler:0];
    }
    v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v4();
}

void __108__STRootViewControllerProvider_requestRootViewControllerForDSID_presentingViewController_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to enable Screen Time remote management of child: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end