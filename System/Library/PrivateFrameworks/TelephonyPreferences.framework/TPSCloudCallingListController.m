@interface TPSCloudCallingListController
- (OBPrivacyLinkController)privacyLinkController;
- (OBPrivacyPresenter)privacyPresenter;
- (void)appendAboutWiFiCallingFooterToGroupSpecifier:(id)a3;
- (void)presentOrUpdateViewController:(id)a3;
- (void)presentPrivacyPresenter;
- (void)privacySplashControllerDidRequestDismissal:(id)a3;
@end

@implementation TPSCloudCallingListController

- (OBPrivacyLinkController)privacyLinkController
{
  privacyLinkController = self->_privacyLinkController;
  if (!privacyLinkController)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getOBPrivacyLinkControllerClass_softClass;
    uint64_t v13 = getOBPrivacyLinkControllerClass_softClass;
    if (!getOBPrivacyLinkControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getOBPrivacyLinkControllerClass_block_invoke;
      v9[3] = &unk_1E6EB21F8;
      v9[4] = &v10;
      __getOBPrivacyLinkControllerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = [v5 linkWithBundleIdentifier:@"com.apple.onboarding.cloudcalling"];
    v7 = self->_privacyLinkController;
    self->_privacyLinkController = v6;

    privacyLinkController = self->_privacyLinkController;
  }
  return privacyLinkController;
}

- (OBPrivacyPresenter)privacyPresenter
{
  privacyPresenter = self->_privacyPresenter;
  if (!privacyPresenter)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getOBPrivacyPresenterClass_softClass;
    uint64_t v13 = getOBPrivacyPresenterClass_softClass;
    if (!getOBPrivacyPresenterClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getOBPrivacyPresenterClass_block_invoke;
      v9[3] = &unk_1E6EB21F8;
      v9[4] = &v10;
      __getOBPrivacyPresenterClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = [v5 presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.cloudcalling"];
    v7 = self->_privacyPresenter;
    self->_privacyPresenter = v6;

    [(OBPrivacyPresenter *)self->_privacyPresenter setPresentingViewController:self];
    privacyPresenter = self->_privacyPresenter;
  }
  return privacyPresenter;
}

- (void)appendAboutWiFiCallingFooterToGroupSpecifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v16 = v4;
    id v5 = [(TPSCloudCallingListController *)self privacyLinkController];
    v6 = [v5 flow];
    v7 = [v6 localizedButtonTitle];

    v8 = [v16 propertyForKey:*MEMORY[0x1E4F93170]];
    if (v8) {
      [NSString stringWithFormat:@"%@ %@", v8, v7];
    }
    else {
    v9 = [NSString stringWithFormat:@"%@", v7, v15];
    }
    uint64_t v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v16 setProperty:v11 forKey:*MEMORY[0x1E4F93140]];

    [v16 setProperty:v9 forKey:*MEMORY[0x1E4F93160]];
    v18.location = [v9 rangeOfString:v7];
    uint64_t v12 = NSStringFromRange(v18);
    [v16 setProperty:v12 forKey:*MEMORY[0x1E4F93150]];

    uint64_t v13 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v16 setProperty:v13 forKey:*MEMORY[0x1E4F93158]];

    v14 = NSStringFromSelector(sel_presentPrivacyPresenter);
    [v16 setProperty:v14 forKey:*MEMORY[0x1E4F93148]];

    id v4 = v16;
  }
}

- (void)presentOrUpdateViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Asked to present or update view controller: %@", buf, 0xCu);
  }

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __63__TPSCloudCallingListController_presentOrUpdateViewController___block_invoke;
  v14 = &unk_1E6EB22C8;
  id v15 = v4;
  id v16 = self;
  id v6 = v4;
  v7 = (void (**)(void))_Block_copy(&v11);
  v8 = [(TPSCloudCallingListController *)self presentedViewController];

  if (v8)
  {
    v9 = TPSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(TPSCloudCallingListController *)self presentedViewController];
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl(&dword_1E4DD4000, v9, OS_LOG_TYPE_DEFAULT, "A view controller is already being presented: %@. Dismissing it and presenting the new one", buf, 0xCu);
    }
    [(TPSCloudCallingListController *)self dismissViewControllerAnimated:1 completion:v7];
  }
  else
  {
    v7[2](v7);
  }
}

void __63__TPSCloudCallingListController_presentOrUpdateViewController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalPresentationStyle:2];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__TPSCloudCallingListController_presentOrUpdateViewController___block_invoke_2;
  v6[3] = &unk_1E6EB22C8;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 presentViewController:v4 animated:1 completion:v6];
}

uint64_t __63__TPSCloudCallingListController_presentOrUpdateViewController___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    v3 = TPSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "Reloading specifiers because the presented view controller was a UIAlertController: %@", (uint8_t *)&v5, 0xCu);
    }

    return [*(id *)(a1 + 40) reloadSpecifiers];
  }
  return result;
}

- (void)presentPrivacyPresenter
{
  id v2 = [(TPSCloudCallingListController *)self privacyPresenter];
  [v2 present];
}

- (void)privacySplashControllerDidRequestDismissal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPresenter, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
}

@end