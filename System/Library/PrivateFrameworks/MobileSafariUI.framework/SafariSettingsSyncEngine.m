@interface SafariSettingsSyncEngine
- (BOOL)syncEnabled;
- (SafariSettingsSyncEngine)init;
- (id)_sectionIdentifierToSettingName:(id)a3;
- (id)startPageSectionsManager;
- (void)_backgroundImageChanged:(id)a3;
- (void)_cloudBackgroundImageDidUpdateOnServer:(id)a3;
- (void)_cloudBackgroundImageWasDeletedOnServer:(id)a3;
- (void)_cloudSettingsDidUpdateOnServer:(id)a3;
- (void)_customizationPaletteWasDismissed:(id)a3;
- (void)_didUpdateCloudTabsOnStartPageConsent:(id)a3;
- (void)_didUpdateDefaultBrowserState;
- (void)_didUpdateStartPageBackgroundImageVisibility;
- (void)_didUpdateStartPageSectionOrder:(id)a3;
- (void)_didUpdateStartPageVisibility:(id)a3;
@end

@implementation SafariSettingsSyncEngine

- (SafariSettingsSyncEngine)init
{
  v30.receiver = self;
  v30.super_class = (Class)SafariSettingsSyncEngine;
  v2 = [(WBSSafariSettingsSyncEngine *)&v30 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:v2 selector:sel__cloudBackgroundImageDidUpdateOnServer_ name:*MEMORY[0x1E4F99448] object:0];

    v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 addObserver:v2 selector:sel__cloudBackgroundImageWasDeletedOnServer_ name:*MEMORY[0x1E4F99440] object:0];

    v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:v2 selector:sel__cloudSettingsDidUpdateOnServer_ name:*MEMORY[0x1E4F99458] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__backgroundImageChanged_ name:*MEMORY[0x1E4F99670] object:0];
    [v6 addObserver:v2 selector:sel__didUpdateStartPageVisibility_ name:*MEMORY[0x1E4F994B8] object:0];
    [v6 addObserver:v2 selector:sel__didUpdateStartPageSectionOrder_ name:*MEMORY[0x1E4F996A8] object:0];
    [v6 addObserver:v2 selector:sel__customizationPaletteWasDismissed_ name:*MEMORY[0x1E4F994C0] object:0];
    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v8 = *MEMORY[0x1E4F99628];
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __32__SafariSettingsSyncEngine_init__block_invoke;
    v27[3] = &unk_1E6D7AEE0;
    objc_copyWeak(&v28, &location);
    uint64_t v11 = objc_msgSend(v7, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v8, v9, 0, v27);
    wallpaperDefaultsObservation = v2->_wallpaperDefaultsObservation;
    v2->_wallpaperDefaultsObservation = (WBSUserDefaultObservation *)v11;

    v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v14 = SFDefaultBrowserSelectionStateKey();
    uint64_t v15 = [v13 integerForKey:v14];

    if (!v15)
    {
      v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v17 = SFDefaultBrowserSelectionStateKey();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __32__SafariSettingsSyncEngine_init__block_invoke_2;
      v25[3] = &unk_1E6D7AEE0;
      objc_copyWeak(&v26, &location);
      uint64_t v18 = objc_msgSend(v16, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v17, MEMORY[0x1E4F14428], 0, v25);
      defaultBrowserSelectionObservation = v2->_defaultBrowserSelectionObservation;
      v2->_defaultBrowserSelectionObservation = (WBSUserDefaultObservation *)v18;

      objc_destroyWeak(&v26);
    }
    objc_msgSend(v6, "safari_addObserver:selector:forUserDefaultKey:", v2, sel__didUpdateCloudTabsOnStartPageConsent_, *MEMORY[0x1E4F990C0]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __32__SafariSettingsSyncEngine_init__block_invoke_3;
    v23[3] = &unk_1E6D7AF08;
    v20 = v2;
    v24 = v20;
    [(WBSSafariSettingsSyncEngine *)v20 registerDiagnosticWithPayloadProvider:v23];
    v21 = v20;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __32__SafariSettingsSyncEngine_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _didUpdateStartPageBackgroundImageVisibility];
  }
}

void __32__SafariSettingsSyncEngine_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _didUpdateDefaultBrowserState];
  }
}

id __32__SafariSettingsSyncEngine_init__block_invoke_3(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"Start Page Section Order";
  v2 = [*(id *)(a1 + 32) startPageSectionsManager];
  v3 = [v2 sectionIdentifiers];
  v12[0] = v3;
  v11[1] = @"Start Page Enabled Sections";
  v4 = [*(id *)(a1 + 32) startPageSectionsManager];
  v5 = [v4 enabledSectionIdentifiers];
  v12[1] = v5;
  v11[2] = @"Background Image Exist";
  v6 = (void *)MEMORY[0x1E4F28ED0];
  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E4F99280]));
  v12[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (BOOL)syncEnabled
{
  v2 = +[FeatureManager sharedFeatureManager];
  char v3 = [v2 isCloudSyncAvailable];

  if ((v3 & 1) == 0) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F97EA0];
  return [v4 isStartPageSettingSyncEnabled];
}

- (id)startPageSectionsManager
{
  lazyStartPageSectionsManager = self->_lazyStartPageSectionsManager;
  if (!lazyStartPageSectionsManager)
  {
    v4 = (WBSStartPageSectionManager *)objc_alloc_init(MEMORY[0x1E4F98EB0]);
    v5 = self->_lazyStartPageSectionsManager;
    self->_lazyStartPageSectionsManager = v4;

    lazyStartPageSectionsManager = self->_lazyStartPageSectionsManager;
  }
  return lazyStartPageSectionsManager;
}

- (void)_cloudSettingsDidUpdateOnServer:(id)a3
{
  id v7 = a3;
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = (void *)MEMORY[0x1E4F1CB18];
  v5 = [v7 object];
  v6 = objc_msgSend(v4, "safari_notificationNameForUserDefaultsKey:", v5);
  [v3 postNotificationName:v6 object:0];
}

- (void)_customizationPaletteWasDismissed:(id)a3
{
  if ([(SafariSettingsSyncEngine *)self syncEnabled])
  {
    [(WBSSafariSettingsSyncEngine *)self triggerImmediateBackgroundImageSaveIfApplicable];
  }
}

- (void)_backgroundImageChanged:(id)a3
{
  id v11 = a3;
  if ([(SafariSettingsSyncEngine *)self syncEnabled])
  {
    v4 = [v11 userInfo];
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F99668]];

    if (![v5 length])
    {
      v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v7 = [v6 integerForKey:*MEMORY[0x1E4F99280]];

      if (v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v9 = objc_msgSend(v8, "safari_startPageBackgroundImageFileURLForDefaultProfile");

        id v10 = [MEMORY[0x1E4F98E88] defaultManager];
        -[WBSSafariSettingsSyncEngine scheduleCloudBackgroundImageSaveWithURL:isLightAppearance:successCompletionHandler:](self, "scheduleCloudBackgroundImageSaveWithURL:isLightAppearance:successCompletionHandler:", v9, [v10 appearanceIfImageExists:1] == 1, &__block_literal_global_41);
      }
      else
      {
        [(WBSSafariSettingsSyncEngine *)self deleteBackgroundImageFromCloudKitWithCompletionHandler:&__block_literal_global_23];
      }
    }
  }
}

void __52__SafariSettingsSyncEngine__backgroundImageChanged___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E102C000, v0, OS_LOG_TYPE_INFO, "Safari's background image has been deleted in CloudKit.", v1, 2u);
  }
}

void __52__SafariSettingsSyncEngine__backgroundImageChanged___block_invoke_38()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E102C000, v0, OS_LOG_TYPE_INFO, "Safari's background image has been updated in CloudKit", v1, 2u);
  }
}

- (void)_cloudBackgroundImageDidUpdateOnServer:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:*MEMORY[0x1E4F99660] object:0];
}

- (void)_cloudBackgroundImageWasDeletedOnServer:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:*MEMORY[0x1E4F99650] object:0];
}

- (void)_didUpdateStartPageBackgroundImageVisibility
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(SafariSettingsSyncEngine *)self syncEnabled])
  {
    uint64_t v3 = *MEMORY[0x1E4F990B0];
    v10[0] = *MEMORY[0x1E4F994C8];
    uint64_t v4 = *MEMORY[0x1E4F990B8];
    v9[0] = v3;
    v9[1] = v4;
    v5 = (void *)MEMORY[0x1E4F28ED0];
    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x1E4F99628]));
    v10[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

    [(WBSSafariSettingsSyncEngine *)self saveSettingWithDictionaryRepresentation:v8 successCompletionHandler:&__block_literal_global_43];
  }
}

void __72__SafariSettingsSyncEngine__didUpdateStartPageBackgroundImageVisibility__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E102C000, v0, OS_LOG_TYPE_INFO, "Safari's background image visibility has been updated in CloudKit", v1, 2u);
  }
}

- (void)_didUpdateDefaultBrowserState
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(SafariSettingsSyncEngine *)self syncEnabled])
  {
    v9[0] = *MEMORY[0x1E4F990B0];
    uint64_t v3 = SFDefaultBrowserSelectionStateKey();
    v10[0] = v3;
    v9[1] = *MEMORY[0x1E4F990B8];
    uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v6 = SFDefaultBrowserSelectionStateKey();
    uint64_t v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "integerForKey:", v6));
    v10[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

    [(WBSSafariSettingsSyncEngine *)self saveSettingWithDictionaryRepresentation:v8 successCompletionHandler:&__block_literal_global_45];
  }
}

void __57__SafariSettingsSyncEngine__didUpdateDefaultBrowserState__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E102C000, v0, OS_LOG_TYPE_INFO, "Safari's default browser state has been updated in CloudKit", v1, 2u);
  }
}

- (void)_didUpdateStartPageVisibility:(id)a3
{
  id v4 = a3;
  if ([(SafariSettingsSyncEngine *)self syncEnabled])
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"section"];
    uint64_t v8 = [(SafariSettingsSyncEngine *)self _sectionIdentifierToSettingName:v7];
    [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F990B0]];

    uint64_t v9 = [v4 userInfo];
    id v10 = [v9 objectForKeyedSubscript:@"isEnabled"];
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F990B8]];

    if ([v5 count])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58__SafariSettingsSyncEngine__didUpdateStartPageVisibility___block_invoke;
      void v11[3] = &unk_1E6D79060;
      id v12 = v4;
      [(WBSSafariSettingsSyncEngine *)self saveSettingWithDictionaryRepresentation:v5 successCompletionHandler:v11];
    }
  }
}

void __58__SafariSettingsSyncEngine__didUpdateStartPageVisibility___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) userInfo];
    id v4 = [v3 objectForKeyedSubscript:@"section"];
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_INFO, "Safari's %{public}@ has been updated in CloudKit", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_didUpdateStartPageSectionOrder:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(SafariSettingsSyncEngine *)self syncEnabled])
  {
    uint64_t v4 = *MEMORY[0x1E4F990B0];
    v10[0] = *MEMORY[0x1E4F99508];
    uint64_t v5 = *MEMORY[0x1E4F990B8];
    v9[0] = v4;
    v9[1] = v5;
    v6 = [(SafariSettingsSyncEngine *)self startPageSectionsManager];
    uint64_t v7 = [v6 cloudKitStartPageSectionOrder];
    v10[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

    [(WBSSafariSettingsSyncEngine *)self saveSettingWithDictionaryRepresentation:v8 successCompletionHandler:&__block_literal_global_54_0];
  }
}

void __60__SafariSettingsSyncEngine__didUpdateStartPageSectionOrder___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E102C000, v0, OS_LOG_TYPE_INFO, "Safari's Start Page order has been updated in CloudKit", v1, 2u);
  }
}

- (id)_sectionIdentifierToSettingName:(id)a3
{
  v22[10] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F994D0];
  uint64_t v5 = *MEMORY[0x1E4F996D8];
  v21[0] = *MEMORY[0x1E4F99688];
  v21[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F994F8];
  v22[0] = v4;
  v22[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F99510];
  uint64_t v8 = *MEMORY[0x1E4F996B8];
  v21[2] = *MEMORY[0x1E4F996E8];
  v21[3] = v8;
  uint64_t v9 = *MEMORY[0x1E4F994F0];
  v22[2] = v7;
  v22[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F994E0];
  uint64_t v11 = *MEMORY[0x1E4F99690];
  v21[4] = *MEMORY[0x1E4F99698];
  v21[5] = v11;
  uint64_t v12 = *MEMORY[0x1E4F994D8];
  v22[4] = v10;
  v22[5] = v12;
  uint64_t v13 = *MEMORY[0x1E4F994E8];
  uint64_t v14 = *MEMORY[0x1E4F996F0];
  v21[6] = *MEMORY[0x1E4F996A0];
  v21[7] = v14;
  uint64_t v15 = *MEMORY[0x1E4F99518];
  v22[6] = v13;
  v22[7] = v15;
  uint64_t v16 = *MEMORY[0x1E4F996F8];
  v21[8] = *MEMORY[0x1E4F996E0];
  v21[9] = v16;
  uint64_t v17 = *MEMORY[0x1E4F99520];
  v22[8] = *MEMORY[0x1E4F99500];
  v22[9] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:10];
  v19 = [v18 objectForKeyedSubscript:v3];

  return v19;
}

- (void)_didUpdateCloudTabsOnStartPageConsent:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F990B0];
  v11[0] = *MEMORY[0x1E4F994B0];
  uint64_t v5 = *MEMORY[0x1E4F990B8];
  v10[0] = v4;
  v10[1] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3);
  uint64_t v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E4F990C0]));
  v11[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(WBSSafariSettingsSyncEngine *)self saveSettingWithDictionaryRepresentation:v9 successCompletionHandler:&__block_literal_global_56_0];
}

void __66__SafariSettingsSyncEngine__didUpdateCloudTabsOnStartPageConsent___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1E102C000, v0, OS_LOG_TYPE_INFO, "Cloud tabs on start page consent has been updated in CloudKit", v1, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyStartPageSectionsManager, 0);
  objc_storeStrong((id *)&self->_defaultBrowserSelectionObservation, 0);
  objc_storeStrong((id *)&self->_wallpaperDefaultsObservation, 0);
}

@end