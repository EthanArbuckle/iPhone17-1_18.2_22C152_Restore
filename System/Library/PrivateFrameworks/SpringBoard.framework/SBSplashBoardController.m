@interface SBSplashBoardController
- (id)_splashBoardApplicationForBundleID:(id)a3;
- (void)_checkForChangedLocale;
- (void)_handleLocaleDidChangeNotification;
- (void)_observeLocaleChanges;
- (void)configureForLocaleChanges;
- (void)dealloc;
@end

@implementation SBSplashBoardController

- (void)dealloc
{
  if (self->_isObservingAppLanguageChanges) {
    [MEMORY[0x1E4F70FE8] unsubscribeFromAppLanguageChanges];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBSplashBoardController;
  [(XBApplicationController *)&v3 dealloc];
}

- (void)configureForLocaleChanges
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Skipping any snapshot migration as we're in or going to Buddy", v1, 2u);
}

- (void)_checkForChangedLocale
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "checking if locale has changed: %{public}@ to %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_handleLocaleDidChangeNotification
{
  int v3 = +[SBSetupManager sharedInstance];
  int v4 = [v3 isInSetupMode];

  if (v4)
  {
    [(SBSplashBoardController *)self _checkForChangedLocale];
  }
}

- (id)_splashBoardApplicationForBundleID:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(XBApplicationController *)self applicationProvider];
  uint64_t v6 = [v5 allSplashBoardApplications];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__SBSplashBoardController__splashBoardApplicationForBundleID___block_invoke;
  v10[3] = &unk_1E6B01D58;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __62__SBSplashBoardController__splashBoardApplicationForBundleID___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_observeLocaleChanges
{
  if (self->_isObservingAppLanguageChanges)
  {
    __int16 v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBSplashBoardController.m" lineNumber:86 description:@"configureForLocaleChanges can only be called once"];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SBSplashBoardController__observeLocaleChanges__block_invoke;
  v6[3] = &unk_1E6B01D80;
  v6[4] = self;
  [MEMORY[0x1E4F70FE8] subscribeToAppLanguageChanges:v6];
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleLocaleDidChangeNotification name:*MEMORY[0x1E4F1C370] object:0];

  self->_isObservingAppLanguageChanges = 1;
}

void __48__SBSplashBoardController__observeLocaleChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _splashBoardApplicationForBundleID:v3];
  __int16 v5 = XBLogFileManifest();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = v3;
      __int16 v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "locale changed for %{public}@; purging generated launch images. appInfo: %{public}@",
        buf,
        0x16u);
    }

    id v7 = *(void **)(a1 + 32);
    v8 = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    [v7 removeCachedLaunchImagesForApplications:v6 forgettingApps:0];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "informed locale changed for %{public}@, but not a splashboard app so we're skipping", buf, 0xCu);
  }
}

@end