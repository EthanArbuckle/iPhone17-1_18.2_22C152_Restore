@interface PUILockdownModeWebController
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldShowBundleID:(id)a3;
- (NSArray)_allSpecifiers;
- (PUILockdownModeWebController)init;
- (UISearchController)searchController;
- (id)isSpecifierEnabled:(id)a3;
- (id)safariSettingsBundle;
- (id)specifiers;
- (void)dataDidChange;
- (void)dealloc;
- (void)didBecomeActive;
- (void)presentAboutController;
- (void)refreshLinkStatusInParent;
- (void)reloadSpecifiers;
- (void)setAppLockdownModeEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setSearchController:(id)a3;
- (void)set_allSpecifiers:(id)a3;
- (void)specifiers;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUILockdownModeWebController

- (PUILockdownModeWebController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUILockdownModeWebController;
  v2 = [(PUILockdownModeWebController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_didBecomeActive name:*MEMORY[0x1E4FB2628] object:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PUILockdownModeWebController;
  [(PUILockdownModeWebController *)&v10 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  [(PUILockdownModeWebController *)self setSearchController:v3];

  v4 = [(PUILockdownModeWebController *)self searchController];
  [v4 setSearchResultsUpdater:self];

  objc_super v5 = [(PUILockdownModeWebController *)self searchController];
  [v5 setObscuresBackgroundDuringPresentation:0];

  v6 = [(PUILockdownModeWebController *)self searchController];
  v7 = [v6 searchBar];
  [v7 setKeyboardType:0];

  v8 = [(PUILockdownModeWebController *)self searchController];
  v9 = [(PUILockdownModeWebController *)self navigationItem];
  [v9 setSearchController:v8];

  [(PUILockdownModeWebController *)self setDefinesPresentationContext:1];
}

- (void)refreshLinkStatusInParent
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E4F92F90]));
  [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0])];
}

- (void)dataDidChange
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PUILockdownModeWebController_dataDidChange__block_invoke;
  v2[3] = &unk_1E6E9C618;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __45__PUILockdownModeWebController_dataDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUILockdownModeWebController;
  [(PUILockdownModeWebController *)&v4 dealloc];
}

- (void)didBecomeActive
{
  [(PUILockdownModeWebController *)self set_allSpecifiers:0];
  [(PUILockdownModeWebController *)self reloadSpecifiers];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)PUILockdownModeWebController;
  [(PUILockdownModeWebController *)&v3 reloadSpecifiers];
  [(PUILockdownModeWebController *)self updateSearchResultsForSearchController:self->_searchController];
}

- (id)specifiers
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  v2 = [(PUILockdownModeWebController *)self _allSpecifiers];

  if (!v2)
  {
    v68 = objc_opt_new();
    v64 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"LOCKDOWN_MODE_GROUP"];
    objc_super v3 = NSString;
    objc_super v4 = PUI_LocalizedStringForLockdownMode(@"WEB_CONTENT_FOOTER");
    objc_super v5 = getLocalizedDeviceName();
    v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);
    [v64 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F93170]];

    [v68 addObject:v64];
    v71 = objc_opt_new();
    uint64_t v86 = 0;
    v87 = &v86;
    uint64_t v88 = 0x2020000000;
    v7 = (uint64_t (*)(void))getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
    v89 = getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
    if (!getSBSCopyDisplayIdentifiersSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke;
      v93 = &unk_1E6E9C7F8;
      v94 = &v86;
      __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke((uint64_t)buf);
      v7 = (uint64_t (*)(void))v87[3];
    }
    _Block_object_dispose(&v86, 8);
    if (!v7)
    {
      -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
      __break(1u);
    }
    v80 = (void *)v7();
    v73 = CFPreferencesCopyApplicationList((CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v83;
      uint64_t v70 = *MEMORY[0x1E4F931C8];
      uint64_t v69 = *MEMORY[0x1E4F93250];
      uint64_t v66 = *MEMORY[0x1E4F931C0];
      uint64_t v67 = *MEMORY[0x1E4F931D0];
      uint64_t v65 = *MEMORY[0x1E4F93190];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v83 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1E4E884F0]();
          v13 = [v11 bundleIdentifier];
          if (![v80 containsObject:v13]) {
            goto LABEL_27;
          }
          v14 = [v11 bundleIdentifier];
          BOOL v15 = [(PUILockdownModeWebController *)self shouldShowBundleID:v14];

          if (v15 && ([v11 isWebBrowser] & 1) == 0)
          {
            v16 = (void *)MEMORY[0x1E4F92E70];
            v17 = [v11 localizedName];
            v13 = [v16 preferenceSpecifierNamed:v17 target:self set:sel_setAppLockdownModeEnabled_forSpecifier_ get:sel_isSpecifierEnabled_ detail:0 cell:6 edit:0];

            v18 = (void *)MEMORY[0x1E4F223F8];
            v19 = [v11 bundleIdentifier];
            id v81 = 0;
            v76 = [v18 bundleRecordWithApplicationIdentifier:v19 error:&v81];
            id v77 = v81;

            if (v77)
            {
              v20 = _PUILoggingFacility();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                id v21 = [v11 bundleIdentifier];
                uint64_t v22 = [v21 UTF8String];
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "-[PUILockdownModeWebController specifiers]";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = v22;
                _os_log_error_impl(&dword_1E4AD5000, v20, OS_LOG_TYPE_ERROR, "%s - could not get bundle record for %s", buf, 0x16u);
              }
            }
            else
            {
              v20 = [v76 dataContainerURL];
              if (v20)
              {
                id v23 = objc_alloc(MEMORY[0x1E4F1CB18]);
                v24 = [v76 bundleIdentifier];
                v25 = [v76 bundleIdentifier];
                if ([v73 containsObject:v25]) {
                  v26 = 0;
                }
                else {
                  v26 = v20;
                }
                v27 = (void *)[v23 _initWithSuiteName:v24 container:v26];

                if ([v27 BOOLForKey:@"WebKitCaptivePortalModeAlertShown"])
                {
                  v75 = [v20 path];
                  [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v70];
                  [v13 setObject:v75 forKeyedSubscript:@"PUILockdownModeWebContainerPathKey"];
                  v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", +[PUILockdownModeUtilities isCaptivePortalModeIgnoredForContainerPath:](PUILockdownModeUtilities, "isCaptivePortalModeIgnoredForContainerPath:", v75) ^ 1);
                  [v13 setObject:v28 forKeyedSubscript:v69];

                  v29 = [v11 bundleIdentifier];
                  int v30 = [v29 isEqualToString:@"com.apple.mobilecal"];

                  if (v30)
                  {
                    id v31 = objc_alloc(MEMORY[0x1E4F6F248]);
                    v32 = [MEMORY[0x1E4F1C9C8] date];
                    v33 = [MEMORY[0x1E4F1C9A8] currentCalendar];
                    v74 = (void *)[v31 initWithDate:v32 calendar:v33 format:0];

                    id v34 = objc_alloc(MEMORY[0x1E4F6F258]);
                    v35 = PSBlankIconImage();
                    [v35 size];
                    double v37 = v36;
                    double v39 = v38;
                    v40 = [MEMORY[0x1E4FB1BA8] mainScreen];
                    [v40 scale];
                    v72 = objc_msgSend(v34, "initWithSize:scale:", v37, v39, v41);

                    v90 = v72;
                    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
                    [v74 prepareImagesForImageDescriptors:v42];

                    v43 = [v74 imageForDescriptor:v72];
                    v44 = (void *)MEMORY[0x1E4FB1818];
                    uint64_t v45 = [v43 CGImage];
                    [v43 scale];
                    v46 = objc_msgSend(v44, "imageWithCGImage:scale:orientation:", v45, 0);
                    [v13 setObject:v46 forKeyedSubscript:v65];
                  }
                  else
                  {
                    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v67];
                    v74 = [v11 bundleIdentifier];
                    [v13 setObject:v74 forKeyedSubscript:v66];
                  }

                  [v71 addObject:v13];
                }
              }
            }

LABEL_27:
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
      }
      while (v8);
    }

    v47 = [(PUILockdownModeWebController *)self safariSettingsBundle];
    v48 = v47;
    if (v47)
    {
      uint64_t v49 = [v47 classNamed:@"SafariLockdownModePerSitePreferenceSettingsController"];
      if (v49)
      {
        v50 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
        [v68 addObject:v50];
        v51 = (void *)MEMORY[0x1E4F92E70];
        v52 = PUI_LocalizedStringForLockdownMode(@"WEBSITES");
        v53 = [v51 preferenceSpecifierNamed:v52 target:self set:0 get:0 detail:v49 cell:2 edit:0];

        [v68 addObject:v53];
      }
      else
      {
        v50 = _PUILoggingFacility();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
          -[PUILockdownModeWebController specifiers](v50);
        }
      }
    }
    else
    {
      v50 = _PUILoggingFacility();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
        -[PUILockdownModeWebController specifiers](v50);
      }
    }

    if ([v71 count])
    {
      v54 = (void *)MEMORY[0x1E4F92E70];
      v55 = PUI_LocalizedStringForLockdownMode(@"APPS_SECTION");
      v56 = [v54 groupSpecifierWithID:@"APPS_GROUP" name:v55];

      [v68 addObject:v56];
      [v71 sortUsingFunction:PUICompareSpecifiersByName context:0];
      [v68 addObjectsFromArray:v71];
    }
    [(PUILockdownModeWebController *)self set_allSpecifiers:v68];
  }
  v57 = [(PUILockdownModeWebController *)self searchController];
  int v58 = [v57 isActive];

  if (v58)
  {
    uint64_t v59 = (int)*MEMORY[0x1E4F92F08];
  }
  else
  {
    v60 = [(PUILockdownModeWebController *)self _allSpecifiers];
    uint64_t v59 = (int)*MEMORY[0x1E4F92F08];
    v61 = *(Class *)((char *)&self->super.super.super.super.super.isa + v59);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v59) = v60;
  }
  v62 = *(Class *)((char *)&self->super.super.super.super.super.isa + v59);
  return v62;
}

- (id)isSpecifierEnabled:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x1E4F93250]];
}

- (void)setAppLockdownModeEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F93250];
  uint64_t v8 = [v6 propertyForKey:*MEMORY[0x1E4F93250]];
  if (([v5 isEqual:v8] & 1) == 0)
  {
    int v9 = [v5 BOOLValue];
    objc_super v10 = _PUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      v13 = "-[PUILockdownModeWebController setAppLockdownModeEnabled:forSpecifier:]";
      __int16 v14 = 1024;
      int v15 = v9;
      _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "%s - enable for app: %d", (uint8_t *)&v12, 0x12u);
    }

    [v6 setProperty:v5 forKey:v7];
    v11 = [v6 propertyForKey:@"PUILockdownModeWebContainerPathKey"];
    +[PUILockdownModeUtilities setCaptivePortalModeIgnoredForContainerPath:v11 ignored:v9 ^ 1u];
  }
}

- (void)presentAboutController
{
  id v3 = objc_alloc(MEMORY[0x1E4F83AE8]);
  objc_super v4 = PUI_LocalizedStringForLockdownMode(@"WEB_CONTENT");
  id v5 = (void *)[v3 initWithTitle:v4 detailText:0 symbolName:0 contentLayout:2];

  id v6 = PUI_LocalizedStringForLockdownMode(@"LEARN_MORE_TEXT");
  [v5 addSectionWithHeader:0 content:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v8 = (void *)MEMORY[0x1E4FB13F0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__PUILockdownModeWebController_presentAboutController__block_invoke;
  v14[3] = &unk_1E6E9C708;
  id v15 = v5;
  id v9 = v5;
  objc_super v10 = [v8 actionWithHandler:v14];
  v11 = (void *)[v7 initWithBarButtonSystemItem:0 primaryAction:v10];

  int v12 = [v9 navigationItem];
  [v12 setRightBarButtonItem:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
  [(PUILockdownModeWebController *)self presentModalViewController:v13 withTransition:3];
}

void __54__PUILockdownModeWebController_presentAboutController__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (id)safariSettingsBundle
{
  if (safariSettingsBundle_onceToken != -1) {
    dispatch_once(&safariSettingsBundle_onceToken, &__block_literal_global);
  }
  v2 = (void *)safariSettingsBundle_bundle;
  return v2;
}

void __52__PUILockdownModeWebController_safariSettingsBundle__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  SFRuntimeAbsoluteFilePathForPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 bundleWithPath:v3];
  v2 = (void *)safariSettingsBundle_bundle;
  safariSettingsBundle_bundle = v1;
}

- (BOOL)shouldShowBundleID:(id)a3
{
  uint64_t v3 = shouldShowBundleID__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shouldShowBundleID__onceToken, &__block_literal_global_70);
  }
  char v5 = [(id)shouldShowBundleID__bundleIDs containsObject:v4];

  return v5 ^ 1;
}

void __51__PUILockdownModeWebController_shouldShowBundleID___block_invoke()
{
  v0 = (void *)shouldShowBundleID__bundleIDs;
  shouldShowBundleID__bundleIDs = (uint64_t)&unk_1F40806C8;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  char v5 = [v4 text];

  if ([v5 length])
  {
    id v6 = objc_opt_new();
    id v7 = [(PUILockdownModeWebController *)self _allSpecifiers];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __71__PUILockdownModeWebController_updateSearchResultsForSearchController___block_invoke;
    int v12 = &unk_1E6E9C900;
    id v13 = v5;
    id v14 = v6;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:&v9];

    -[PUILockdownModeWebController setSpecifiers:](self, "setSpecifiers:", v8, v9, v10, v11, v12);
  }
  else
  {
    id v8 = [(PUILockdownModeWebController *)self _allSpecifiers];
    [(PUILockdownModeWebController *)self setSpecifiers:v8];
  }
}

void __71__PUILockdownModeWebController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 cellType] == 6)
  {
    uint64_t v3 = [v5 name];
    int v4 = [v3 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];

    if (v4) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (NSArray)_allSpecifiers
{
  return self->__allSpecifiers;
}

- (void)set_allSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allSpecifiers, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

- (void)specifiers
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[PUILockdownModeWebController specifiers]";
  _os_log_fault_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_FAULT, "%s Error getting Safari LockdownMode class", (uint8_t *)&v1, 0xCu);
}

@end