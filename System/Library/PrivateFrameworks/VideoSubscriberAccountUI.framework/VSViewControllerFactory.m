@interface VSViewControllerFactory
+ (id)sharedFactory;
- (NSOperationQueue)privateQueue;
- (VSViewControllerFactory)init;
- (id)authenticationViewControllerForViewModel:(id)a3;
- (id)identityProviderPickerViewControllerWithIdentityProviders:(id)a3;
- (id)loadingViewController;
- (id)viewControllerForAppsSupportedByIdentityProvider:(id)a3 supportedApps:(id)a4 delegate:(id)a5;
- (id)viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs:(id)a3 grantingVouchers:(BOOL)a4 appleAccountName:(id)a5 identityProvider:(id)a6 completionHandler:(id)a7;
- (id)viewControllerForUnsupportedProvider:(id)a3 withRequestingAppDisplayName:(id)a4 storage:(id)a5 acknowledgementHandler:(id)a6;
- (id)viewControllerToConfirmAccountDeletionForAccount:(id)a3 preferredStyle:(int64_t)a4 confirmationHandler:(id)a5;
- (id)viewControllerToConfirmDeveloperIdentityProviderDeletionWithConfirmationHandler:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)viewServiceRemoteViewControllerWithCompletion:(id)a3;
@end

@implementation VSViewControllerFactory

+ (id)sharedFactory
{
  if (sharedFactory___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedFactory___vs_lazy_init_predicate, &__block_literal_global_10);
  }
  v2 = (void *)sharedFactory___vs_lazy_init_variable;
  return v2;
}

uint64_t __40__VSViewControllerFactory_sharedFactory__block_invoke()
{
  v0 = objc_alloc_init(VSViewControllerFactory);
  uint64_t v1 = sharedFactory___vs_lazy_init_variable;
  sharedFactory___vs_lazy_init_variable = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (VSViewControllerFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSViewControllerFactory;
  v2 = [(VSViewControllerFactory *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    [(NSOperationQueue *)v2->_privateQueue setName:@"VSViewControllerFactory"];
    [(NSOperationQueue *)v2->_privateQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)viewServiceRemoteViewControllerWithCompletion:(id)a3
{
  id v3 = a3;
  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The completion parameter must not be nil."];
  }
  v4 = objc_opt_class();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__VSViewControllerFactory_viewServiceRemoteViewControllerWithCompletion___block_invoke;
  v7[3] = &unk_265077760;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 requestViewController:@"VSViewServiceViewController" fromServiceWithBundleIdentifier:@"com.apple.VSViewService" connectionHandler:v7];
}

void __73__VSViewControllerFactory_viewServiceRemoteViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = (void *)MEMORY[0x263EFF940];
      uint64_t v6 = *MEMORY[0x263EFF4A0];
      v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      [v5 raise:v6, @"Unexpectedly, readyViewController was %@, instead of VSViewServiceRemoteViewController.", v8 format];
    }
    v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    VSPublicError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

- (id)identityProviderPickerViewControllerWithIdentityProviders:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VSIdentityProviderPickerViewController_iOS);
  [(VSIdentityProviderPickerViewController_iOS *)v4 setIdentityProviders:v3];

  id v5 = [MEMORY[0x263F1E250] optionalWithObject:v4];

  return v5;
}

- (id)authenticationViewControllerForViewModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = (void *)MEMORY[0x263EFF940];
      uint64_t v5 = *MEMORY[0x263EFF4A0];
      uint64_t v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      [v4 raise:v5, @"Unexpectedly, viewModel was %@, instead of VSCredentialEntryViewModel.", v7 format];
    }
    id v8 = VSCredentialEntryViewController_iOS;
LABEL_21:
    id v25 = v3;
    id v26 = objc_alloc_init(v8);
    [v26 setViewModel:v25];

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      [v9 raise:v10, @"Unexpectedly, viewModel was %@, instead of VSAutoAuthenticationViewModel.", v12 format];
    }
    id v8 = VSAutoAuthenticationViewController_iOS;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = (void *)MEMORY[0x263EFF940];
      uint64_t v14 = *MEMORY[0x263EFF4A0];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      [v13 raise:v14, @"Unexpectedly, viewModel was %@, instead of VSWebAuthenticationViewModel.", v16 format];
    }
    id v8 = VSWebAuthenticationViewController;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)MEMORY[0x263EFF940];
      uint64_t v18 = *MEMORY[0x263EFF4A0];
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      [v17 raise:v18, @"Unexpectedly, viewModel was %@, instead of VSOnscreenCodeViewModel.", v20 format];
    }
    [0 setViewModel:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = (void *)MEMORY[0x263EFF940];
        uint64_t v22 = *MEMORY[0x263EFF4A0];
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        [v21 raise:v22, @"Unexpectedly, viewModel was %@, instead of VSTwoFactorEntryViewModel.", v24 format];
      }
      id v8 = VSTwoFactorEntryViewController_iOS;
      goto LABEL_21;
    }
  }
  id v26 = 0;
LABEL_22:
  v27 = [MEMORY[0x263F1E250] optionalWithObject:v26];

  return v27;
}

- (id)loadingViewController
{
  v2 = objc_alloc_init(VSLoadingViewController_iOS);
  id v3 = [MEMORY[0x263F1E250] optionalWithObject:v2];

  return v3;
}

- (id)viewControllerToConfirmAccountDeletionForAccount:(id)a3 preferredStyle:(int64_t)a4 confirmationHandler:(id)a5
{
  id v7 = a5;
  id v8 = NSString;
  v9 = (void *)MEMORY[0x263F086E0];
  id v10 = a3;
  v11 = objc_msgSend(v9, "vs_frameworkBundle");
  v12 = [v11 localizedStringForKey:@"SIGN_OUT_CONFIRMATION_TITLE_FORMAT" value:0 table:0];
  v13 = [v10 identityProviderDisplayName];
  uint64_t v14 = objc_msgSend(v8, "stringWithFormat:", v12, v13);

  LODWORD(v11) = [v10 isSynchronizable];
  v15 = 0;
  if (v11)
  {
    v16 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v15 = [v16 localizedStringForKey:@"DELETE_ACCOUNT_CONFIRMATION_MESSAGE_FORMAT_GENERIC" value:0 table:0];
  }
  v17 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v14 message:v15 preferredStyle:a4];
  uint64_t v18 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v19 = [v18 localizedStringForKey:@"SIGN_OUT_BUTTON_TITLE" value:0 table:0];

  v20 = (void *)MEMORY[0x263F1C3F0];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __111__VSViewControllerFactory_viewControllerToConfirmAccountDeletionForAccount_preferredStyle_confirmationHandler___block_invoke;
  v28[3] = &unk_265077140;
  id v29 = v7;
  id v21 = v7;
  uint64_t v22 = [v20 actionWithTitle:v19 style:2 handler:v28];
  [v17 addAction:v22];
  v23 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v24 = [v23 localizedStringForKey:@"CANCEL_TITLE" value:0 table:0];

  id v25 = [MEMORY[0x263F1C3F0] actionWithTitle:v24 style:1 handler:0];
  [v17 addAction:v25];
  id v26 = [MEMORY[0x263F1E250] optionalWithObject:v17];

  return v26;
}

uint64_t __111__VSViewControllerFactory_viewControllerToConfirmAccountDeletionForAccount_preferredStyle_confirmationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)viewControllerToConfirmDeveloperIdentityProviderDeletionWithConfirmationHandler:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F1E1F0] currentDevice];
  uint64_t v5 = [v4 developerIdentityProviderDeletionConfirmationMessage];

  uint64_t v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v5 message:0 preferredStyle:0];
  id v7 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  id v8 = [v7 localizedStringForKey:@"DEVELOPER_DELETION_ACTION_TITLE" value:0 table:0];

  v9 = (void *)MEMORY[0x263F1C3F0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __107__VSViewControllerFactory_viewControllerToConfirmDeveloperIdentityProviderDeletionWithConfirmationHandler___block_invoke;
  v17[3] = &unk_265077140;
  id v18 = v3;
  id v10 = v3;
  v11 = [v9 actionWithTitle:v8 style:2 handler:v17];
  [v6 addAction:v11];
  v12 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v13 = [v12 localizedStringForKey:@"CANCEL_TITLE" value:0 table:0];

  uint64_t v14 = [MEMORY[0x263F1C3F0] actionWithTitle:v13 style:1 handler:0];
  [v6 addAction:v14];
  v15 = [MEMORY[0x263F1E250] optionalWithObject:v6];

  return v15;
}

uint64_t __107__VSViewControllerFactory_viewControllerToConfirmDeveloperIdentityProviderDeletionWithConfirmationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)viewControllerForUnsupportedProvider:(id)a3 withRequestingAppDisplayName:(id)a4 storage:(id)a5 acknowledgementHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v44 = a6;
  v13 = [v10 displayName];
  uint64_t v14 = [v13 forceUnwrapObject];

  v45 = v11;
  v43 = (void *)v14;
  if (v11)
  {
    id v15 = v11;
    int v16 = [v10 isProhibitedByStore];
    v17 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    id v18 = v17;
    if (v16)
    {
      v19 = [v17 localizedStringForKey:@"UNSUPPORTED_PROVIDER_TITLE_FORMAT" value:0 table:0];

      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", v19, v14);
      id v21 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
      uint64_t v22 = [v21 localizedStringForKey:@"UNSUPPORTED_PROVIDER_MESSAGE_FORMAT" value:0 table:0];

      objc_msgSend(NSString, "stringWithFormat:", v22, v15, v41);
    }
    else
    {
      v19 = [v17 localizedStringForKey:@"UNSUPPORTED_APP_TITLE_FORMAT" value:0 table:0];

      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", v19, v15, v14);
      id v25 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
      uint64_t v22 = [v25 localizedStringForKey:@"UNSUPPORTED_APP_MESSAGE_FORMAT" value:0 table:0];

      objc_msgSend(NSString, "stringWithFormat:", v22, v14, v15);
    v24 = };
  }
  else
  {
    v23 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    id v15 = [v23 localizedStringForKey:@"UNSUPPORTED_PROVIDER_TITLE_FORMAT" value:0 table:0];

    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", v15, v14);
    v19 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v24 = [v19 localizedStringForKey:@"UNSUPPORTED_PROVIDER_SYSTEM_MESSAGE" value:0 table:0];
  }
  v42 = (void *)v20;

  id v26 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v20 message:v24 preferredStyle:1];
  v27 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v28 = [v27 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0];

  id v29 = (void *)MEMORY[0x263F1C3F0];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke;
  v48[3] = &unk_2650777B0;
  id v49 = v10;
  id v50 = v12;
  id v30 = v44;
  v51 = self;
  id v52 = v30;
  id v31 = v12;
  id v32 = v10;
  v33 = [v29 actionWithTitle:v28 style:0 handler:v48];
  [v26 addAction:v33];
  v34 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v35 = [v34 localizedStringForKey:@"CHOOSE_ANOTHER_PROVIDER_BUTTON_TITLE" value:0 table:0];

  v36 = (void *)MEMORY[0x263F1C3F0];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke_3;
  v46[3] = &unk_265077140;
  id v47 = v30;
  id v37 = v30;
  v38 = [v36 actionWithTitle:v35 style:1 handler:v46];
  [v26 addAction:v38];
  v39 = [MEMORY[0x263F1E250] optionalWithObject:v26];

  return v39;
}

void __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F1E170]);
  if (([*(id *)(a1 + 32) isDeveloper] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) providerID];
    id v4 = [v3 forceUnwrapObject];

    [MEMORY[0x263F1E240] recordSignInEventWithProviderIdentifier:v4 supportedProvider:0 channelAdamID:0 signInType:*MEMORY[0x263F1E460] error:0];
  }
  uint64_t v5 = [*(id *)(a1 + 32) providerID];
  [v2 setIdentityProviderID:v5];

  uint64_t v6 = [*(id *)(a1 + 32) displayName];
  [v2 setOptionalIdentityProviderDisplayName:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  id v8 = (void *)[objc_alloc(MEMORY[0x263F1E248]) initWithSerializedData:v7];
  v9 = [MEMORY[0x263F1E250] optionalWithObject:v8];
  [v2 setAuthenticationToken:v9];

  id v10 = objc_alloc_init(MEMORY[0x263F1E178]);
  id v11 = objc_alloc(MEMORY[0x263F1E1A0]);
  v20[0] = v2;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v13 = (void *)[v11 initWithUnsavedAccounts:v12 channels:v10 storage:*(void *)(a1 + 40)];

  uint64_t v17 = MEMORY[0x263EF8330];
  id v18 = v13;
  id v19 = *(id *)(a1 + 56);
  id v14 = v13;
  id v15 = VSMainThreadOperationWithBlock();
  objc_msgSend(v15, "addDependency:", v14, v17, 3221225472, __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke_2, &unk_265077788);
  VSEnqueueCompletionOperation();
  int v16 = [*(id *)(a1 + 48) privateQueue];
  [v16 addOperation:v14];
}

void __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F1E250];
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) result];
  id v3 = [v5 forceUnwrapObject];
  id v4 = [v1 optionalWithObject:v3];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

void __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x263F1E250]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)viewControllerForAppsSupportedByIdentityProvider:(id)a3 supportedApps:(id)a4 delegate:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(VSSupportedAppsViewController);
  [(VSSupportedAppsViewController *)v10 setDelegate:v8];

  id v11 = [MEMORY[0x263F1E250] optionalWithObject:v9];

  [(VSSupportedAppsViewController *)v10 setIdentityProvider:v11];
  if (v7) {
    [(VSSupportedAppsViewController *)v10 setSupportedApps:v7];
  }
  [(VSSupportedAppsViewController *)v10 beginLoadingImages];
  id v12 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v13 = [v12 localizedStringForKey:@"SUPPORTED_APPS_TITLE" value:0 table:0];
  [(VSSupportedAppsViewController *)v10 setTitle:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F1C7F8]);
  v18[0] = v10;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v14 setViewControllers:v15];

  [v14 setModalPresentationStyle:2];
  int v16 = [MEMORY[0x263F1E250] optionalWithObject:v14];

  return v16;
}

- (id)viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs:(id)a3 grantingVouchers:(BOOL)a4 appleAccountName:(id)a5 identityProvider:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = (objc_class *)MEMORY[0x263EFF9A0];
  id v15 = a3;
  id v16 = objc_alloc_init(v14);
  uint64_t v17 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  id v18 = [v17 localizedStringForKey:@"PLAYBACK_ACTIVITY_REPORTING_CONSENT_TITLE" value:0 table:0];

  unint64_t v19 = 0x263F08000;
  v40 = v12;
  if (v12)
  {
    uint64_t v20 = (void *)MEMORY[0x263F086E0];
    id v21 = v12;
    uint64_t v22 = objc_msgSend(v20, "vs_frameworkBundle");
    v23 = [v22 localizedStringForKey:@"PLAYBACK_ACTIVITY_REPORTING_CONSENT_TITLE_FORMAT" value:0 table:0];

    v24 = [v21 displayName];

    id v25 = [v24 forceUnwrapObject];

    uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", v23, v25);

    unint64_t v19 = 0x263F08000uLL;
    id v18 = (void *)v26;
  }
  [v16 setObject:v18 forKey:*MEMORY[0x263F84798]];
  v27 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v28 = v27;
  if (v9) {
    id v29 = @"PLAYBACK_ACTIVITY_REPORTING_COMBINED_CONSENT_MESSAGE_FORMAT";
  }
  else {
    id v29 = @"PLAYBACK_ACTIVITY_REPORTING_CONSENT_MESSAGE_FORMAT";
  }
  id v30 = [v27 localizedStringForKey:v29 value:0 table:0];

  id v31 = objc_msgSend(*(id *)(v19 + 2880), "stringWithFormat:", v30, v11);

  [v16 setObject:v31 forKey:*MEMORY[0x263F84790]];
  if (v11) {
    [v16 setObject:v11 forKey:*MEMORY[0x263F84788]];
  }
  id v32 = objc_alloc(MEMORY[0x263F84770]);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __160__VSViewControllerFactory_viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs_grantingVouchers_appleAccountName_identityProvider_completionHandler___block_invoke;
  v41[3] = &unk_265077800;
  id v42 = v13;
  id v33 = v13;
  v34 = (void *)[v32 initWithBundleIDs:v15 options:v16 completionHandler:v41];

  id v35 = objc_alloc_init(MEMORY[0x263F1CB68]);
  v36 = [v35 view];
  [v35 addChildViewController:v34];
  id v37 = [v34 view];
  [v36 bounds];
  objc_msgSend(v37, "setFrame:");
  [v37 setAutoresizingMask:18];
  [v36 addSubview:v37];
  [v34 didMoveToParentViewController:v35];
  v38 = [MEMORY[0x263F1E250] optionalWithObject:v35];

  return v38;
}

void __160__VSViewControllerFactory_viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs_grantingVouchers_appleAccountName_identityProvider_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a2];
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Received access result: %@.", buf, 0xCu);
  }
  id v6 = *(id *)(a1 + 32);
  VSPerformBlockOnMainThread();
}

uint64_t __160__VSViewControllerFactory_viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs_grantingVouchers_appleAccountName_identityProvider_completionHandler___block_invoke_141(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40) != 0, *(void *)(a1 + 40) == 1);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end