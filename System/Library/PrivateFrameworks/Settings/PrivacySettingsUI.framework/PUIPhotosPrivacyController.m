@interface PUIPhotosPrivacyController
+ (BOOL)isServiceRestricted:(id)a3;
+ (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5;
+ (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5 completion:(id)a6;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)allAppSpecifiers;
- (NSSet)photosAddOnlyAllAppIDs;
- (NSSet)photosAddOnlyAllowedAppIDs;
- (NSSet)photosAddOnlyDeniedAppIDs;
- (NSSet)photosAllAppIDs;
- (NSSet)photosReadWriteAllAppIDs;
- (NSSet)photosReadWriteAllowedAppIDs;
- (NSSet)photosReadWriteAllowedOrLimitedAppIDs;
- (NSSet)photosReadWriteDeniedAppIDs;
- (NSSet)photosReadWriteLimitedAppIDs;
- (NSSet)pickerUsageAppIDs;
- (id)_photosStatus:(id)a3;
- (id)_specifiersWithCombinedPickerUsage;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6 showPickerUsage:(BOOL)a7;
- (void)_setPhotosStatus:(id)a3 specifier:(id)a4;
- (void)_updatePhotosAuthorizationStates;
- (void)provideNavigationDonations;
- (void)setAllAppSpecifiers:(id)a3;
- (void)setPhotosAddOnlyAllAppIDs:(id)a3;
- (void)setPhotosAddOnlyAllowedAppIDs:(id)a3;
- (void)setPhotosAddOnlyDeniedAppIDs:(id)a3;
- (void)setPhotosAllAppIDs:(id)a3;
- (void)setPhotosReadWriteAllAppIDs:(id)a3;
- (void)setPhotosReadWriteAllowedAppIDs:(id)a3;
- (void)setPhotosReadWriteAllowedOrLimitedAppIDs:(id)a3;
- (void)setPhotosReadWriteDeniedAppIDs:(id)a3;
- (void)setPhotosReadWriteLimitedAppIDs:(id)a3;
- (void)setPickerUsageAppIDs:(id)a3;
- (void)updateSpecifiersForImposedSettings;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUIPhotosPrivacyController

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  v4 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  v5 = v4;
  if (v4) {
    char v6 = [v4 containsObject:v3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
}

+ (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11 = (void (**)(void))a6;
  if (a5 != 5)
  {
    if (setTCCForService_appIdentifier_value_completion__onceToken != -1) {
      dispatch_once(&setTCCForService_appIdentifier_value_completion__onceToken, &__block_literal_global_142);
    }
    v12 = _PUILoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v29 = a3;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 1024;
      int v33 = a5;
      _os_log_impl(&dword_1E4AD5000, v12, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
    }

    id v13 = v10;
    [v13 cStringUsingEncoding:4];
    v14 = (void *)tcc_identity_create();
    v15 = tcc_service_singleton_for_CF_name();
    uint64_t v16 = 0;
    if ((a5 - 1) <= 2) {
      uint64_t v16 = qword_1E4B436D0[a5 - 1];
    }
    int v17 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4FA9AE0]);
    if (a5 == 2 && v17 && TCCLibraryCore() && gettcc_server_message_prompt_authorization_valueSymbolLoc())
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke_143;
      aBlock[3] = &unk_1E6E9D9E8;
      id v27 = a1;
      id v25 = v13;
      v26 = v11;
      v18 = _Block_copy(aBlock);
      id v19 = (id)setTCCForService_appIdentifier_value_completion__tccServer;
      id v20 = v14;
      id v21 = v15;
      id v22 = v18;
      v23 = (void (*)(id, void, id, id, void, uint64_t, id))gettcc_server_message_prompt_authorization_valueSymbolLoc();
      if (!v23) {
        -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
      }
      v23(v19, 0, v20, v21, 0, v16, v22);
    }
    else
    {
      tcc_server_message_set_authorization_value();
      if (v11) {
        v11[2](v11);
      }
    }
  }
}

uint64_t __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke()
{
  uint64_t v0 = tcc_server_create();
  uint64_t v1 = setTCCForService_appIdentifier_value_completion__tccServer;
  setTCCForService_appIdentifier_value_completion__tccServer = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke_143(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  v8 = @"PUIPhotosPrivacyUpgradePromptAppIdentifierKey";
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v2 postNotificationName:@"PUIPhotosPrivacyUpgradePromptCompletedNotification" object:v3 userInfo:v5];

  if (*(void *)(a1 + 40))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke_2;
    v6[3] = &unk_1E6E9CB28;
    id v7 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __78__PUIPhotosPrivacyController_setTCCForService_appIdentifier_value_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIPhotosPrivacyController;
  [(PUIPhotosPrivacyController *)&v4 viewDidAppear:a3];
  [(PUIPhotosPrivacyController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  char v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v7 = (void *)[v5 initWithKey:@"PHOTOS" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/PHOTOS"];
  [(PUIPhotosPrivacyController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.privacy" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (id)_specifiersWithCombinedPickerUsage
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v70 = (int)*MEMORY[0x1E4F92F08];
    val = self;
    [(PUIPhotosPrivacyController *)self _updatePhotosAuthorizationStates];
    id v85 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v86 = [MEMORY[0x1E4F1CA80] set];
    objc_super v4 = (void *)MEMORY[0x1E4FA9AE0];
    v68 = (void *)TCCAccessCopyInformation();
    v69 = (void *)TCCAccessCopyInformation();
    id v5 = objc_msgSend(v68, "arrayByAddingObjectsFromArray:");
    BOOL v71 = +[PUIPhotosPrivacyController isServiceRestricted:*v4];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v101;
      id v81 = (id)*MEMORY[0x1E4F931C0];
      to = (id *)*MEMORY[0x1E4F931D0];
      uint64_t v75 = *MEMORY[0x1E4F93130];
      id v8 = (void *)MEMORY[0x1E4FA99D8];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v101 != v7) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v100 + 1) + 8 * i);
          v11 = (__CFBundle *)[v10 objectForKey:*v8];
          v12 = v11;
          if (v11)
          {
            id v13 = CFBundleGetIdentifier(v11);
            if (([v86 containsObject:v13] & 1) == 0)
            {
              [v86 addObject:v13];
              v14 = PUIDisplayNameForApp(v12);
              v15 = [(PUIPhotosPrivacyController *)val photosAddOnlyAllAppIDs];
              uint64_t v16 = [v15 containsObject:v13];

              int v17 = [(PUIPhotosPrivacyController *)val photosReadWriteAllAppIDs];
              uint64_t v18 = [v17 containsObject:v13];

              id v19 = [(PUIPhotosPrivacyController *)val pickerUsageAppIDs];
              uint64_t v20 = [v19 containsObject:v13];

              id v21 = [(PUIPhotosPrivacyController *)val appSpecifierWithName:v14 bundleID:v13 showPhotosAccess:v18 showPhotosAddAccess:v16 showPickerUsage:v20];
              [v21 setProperty:v13 forKey:v81];
              [v21 setProperty:MEMORY[0x1E4F1CC38] forKey:to];
              id v22 = [MEMORY[0x1E4F28ED0] numberWithInt:!v71];
              [v21 setObject:v22 forKeyedSubscript:v75];

              [v85 addObject:v21];
            }
          }
          else
          {
            id v13 = _PUILoggingFacility();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v105 = v10;
              _os_log_impl(&dword_1E4AD5000, v13, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
      }
      while (v6);
    }

    v72 = PUIGetActivePairedDevice();
    if (v72 && objc_opt_class())
    {
      v23 = [MEMORY[0x1E4F79F08] sharedInstance];
      ScreenScale();
      long long v98 = 0u;
      long long v99 = 0u;
      if ((int)v24 == 2) {
        int v25 = 47;
      }
      else {
        int v25 = 48;
      }
      unsigned int v76 = v25;
      long long v97 = 0uLL;
      long long v96 = 0uLL;
      id v77 = [(PUIPhotosPrivacyController *)val photosAllAppIDs];
      uint64_t v26 = [v77 countByEnumeratingWithState:&v96 objects:v109 count:16];
      if (v26)
      {
        id v82 = *(id *)v97;
        uint64_t v73 = *MEMORY[0x1E4F93130];
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(id *)v97 != v82) {
              objc_enumerationMutation(v77);
            }
            v28 = *(void **)(*((void *)&v96 + 1) + 8 * j);
            if (([v86 containsObject:v28] & 1) == 0)
            {
              [v86 addObject:v28];
              v29 = PUIDisplayNameForWatchApp(v28);
              if (v29)
              {
                id v30 = v28;
              }
              else
              {
                PUIWatchBundleIDForBundleID(v28);
                id v30 = (id)objc_claimAutoreleasedReturnValue();
                v29 = PUIDisplayNameForWatchApp(v30);
              }
              id v31 = [(PUIPhotosPrivacyController *)val photosAddOnlyAllAppIDs];
              uint64_t v32 = [v31 containsObject:v28];

              int v33 = [(PUIPhotosPrivacyController *)val photosReadWriteAllAppIDs];
              uint64_t v34 = [v33 containsObject:v28];

              v35 = [(PUIPhotosPrivacyController *)val pickerUsageAppIDs];
              uint64_t v36 = [v35 containsObject:v28];

              if (v29) {
                v37 = v29;
              }
              else {
                v37 = v28;
              }
              v38 = [(PUIPhotosPrivacyController *)val appSpecifierWithName:v37 bundleID:v28 showPhotosAccess:v34 showPhotosAddAccess:v32 showPickerUsage:v36];
              v39 = [MEMORY[0x1E4F28ED0] numberWithInt:!v71];
              [v38 setObject:v39 forKeyedSubscript:v73];

              objc_initWeak((id *)buf, val);
              v93[0] = MEMORY[0x1E4F143A8];
              v93[1] = 3221225472;
              v93[2] = __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke;
              v93[3] = &unk_1E6E9D3E0;
              id v40 = v38;
              id v94 = v40;
              objc_copyWeak(&v95, (id *)buf);
              [v23 getIconForBundleID:v30 iconVariant:v76 block:v93 timeout:-1.0];
              [v85 addObject:v40];
              objc_destroyWeak(&v95);

              objc_destroyWeak((id *)buf);
            }
          }
          uint64_t v26 = [v77 countByEnumeratingWithState:&v96 objects:v109 count:16];
        }
        while (v26);
      }
    }
    v41 = [MEMORY[0x1E4F8B998] sharedInstance];
    v42 = [v41 photosPickerPresentedLibraryLogsByClient];

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v83 = v42;
    uint64_t v43 = [v83 countByEnumeratingWithState:&v89 objects:v108 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v90;
      uint64_t v45 = *MEMORY[0x1E4F8C508];
      toa = (id *)*MEMORY[0x1E4F931C0];
      id v78 = (id)*MEMORY[0x1E4F931D0];
      uint64_t v74 = *MEMORY[0x1E4F93130];
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v90 != v44) {
            objc_enumerationMutation(v83);
          }
          v47 = *(void **)(*((void *)&v89 + 1) + 8 * k);
          v48 = [v47 objectForKeyedSubscript:v45];
          v49 = [(PUIPhotosPrivacyController *)val pickerUsageAppIDs];
          int v50 = [v49 containsObject:v48];

          if ((v50 ^ 1 | [v86 containsObject:v48]))
          {
            v51 = _PUILoggingFacility();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v105 = v47;
              _os_log_impl(&dword_1E4AD5000, v51, OS_LOG_TYPE_DEFAULT, "Skipping picker log: %@", buf, 0xCu);
            }
          }
          else
          {
            id v88 = 0;
            v52 = [MEMORY[0x1E4F223C8] bundleRecordWithApplicationIdentifier:v48 error:&v88];
            v51 = v88;
            if (v52)
            {
              v53 = [v52 localizedName];
              v54 = [(PUIPhotosPrivacyController *)val appSpecifierWithName:v53 bundleID:v48 showPhotosAccess:0 showPhotosAddAccess:0 showPickerUsage:1];
              [v54 setProperty:v48 forKey:toa];
              [v54 setProperty:MEMORY[0x1E4F1CC38] forKey:v78];
              v55 = [MEMORY[0x1E4F28ED0] numberWithInt:!v71];
              [v54 setObject:v55 forKeyedSubscript:v74];

              [v85 addObject:v54];
            }
            else
            {
              v53 = _PUILoggingFacility();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v105 = v48;
                __int16 v106 = 2112;
                v107 = v51;
                _os_log_impl(&dword_1E4AD5000, v53, OS_LOG_TYPE_DEFAULT, "Skipping app (%@) without bundle record with error: %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v43 = [v83 countByEnumeratingWithState:&v89 objects:v108 count:16];
      }
      while (v43);
    }

    [v85 sortUsingComparator:&__block_literal_global_175];
    v56 = (void *)[v85 copy];
    [(PUIPhotosPrivacyController *)val setAllAppSpecifiers:v56];

    v57 = objc_opt_new();
    Class v58 = NSClassFromString(&cfstr_Psphotostccgri.isa);
    if (v58)
    {
      v59 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      uint64_t v60 = *MEMORY[0x1E4F93188];
      [v59 setProperty:@"PHOTOS_GRID_GROUP" forKey:*MEMORY[0x1E4F93188]];
      v61 = PUI_LocalizedStringForPrivacy(@"PHOTOS_GRID_FOOTER");
      [v59 setProperty:v61 forKey:*MEMORY[0x1E4F93170]];
      v62 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F4072988 target:val set:0 get:0 detail:0 cell:-1 edit:0];
      [v62 setProperty:@"PHOTOS_GRID_CELL" forKey:v60];
      v63 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
      [v62 setProperty:v63 forKey:*MEMORY[0x1E4F93218]];

      [v62 setProperty:v58 forKey:*MEMORY[0x1E4F930A8]];
      [v57 addObject:v59];
      [v57 addObject:v62];
    }
    if ([v85 count])
    {
      if (![v85 count])
      {
LABEL_57:
        v66 = *(Class *)((char *)&val->super.super.super.super.super.isa + v70);
        *(Class *)((char *)&val->super.super.super.super.super.isa + v70) = (Class)v57;

        uint64_t v3 = *(Class *)((char *)&val->super.super.super.super.super.isa + v70);
        goto LABEL_58;
      }
      v64 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F4072988 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      [v64 setIdentifier:@"PHOTOKIT_APP_GROUP"];
      [v57 addObject:v64];
      [v57 addObjectsFromArray:v85];
    }
    else
    {
      v64 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      [v64 setIdentifier:@"NO_APP_GROUP"];
      v65 = PUI_LocalizedStringForPrivacy(@"PHOTOS_NO_APP_FOOTER");
      [v64 setProperty:v65 forKey:*MEMORY[0x1E4F93170]];
      [v57 addObject:v64];
    }
    goto LABEL_57;
  }
LABEL_58:
  return v3;
}

void __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke_2;
  block[3] = &unk_1E6E9D3B8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93190]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

uint64_t __64__PUIPhotosPrivacyController__specifiersWithCombinedPickerUsage__block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6 showPickerUsage:(BOOL)a7
{
  BOOL v24 = a7;
  BOOL v7 = a6;
  BOOL v8 = a5;
  v11 = (void *)MEMORY[0x1E4F92E70];
  id v12 = a4;
  id v13 = a3;
  v14 = [v11 preferenceSpecifierNamed:v13 target:self set:sel__setPhotosStatus_specifier_ get:sel__photosStatus_ detail:objc_opt_class() cell:2 edit:0];

  [v14 setIdentifier:v12];
  [v14 setProperty:v12 forKey:@"appBundleID"];

  v15 = PUI_LocalizedStringForPrivacy(@"PHOTOS_AUTH_ONGOING_HEADER");
  [v14 setProperty:v15 forKey:*MEMORY[0x1E4F93200]];

  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  int v17 = [MEMORY[0x1E4F1CA48] array];
  if (!v8 && !v7
    || (PUI_LocalizedStringForPrivacy(@"PHOTOS_NO_ACCESS_AUTHORIZATION"),
        id v22 = objc_claimAutoreleasedReturnValue(),
        [v16 addObject:v22],
        v22,
        [v17 addObject:&unk_1F4080470],
        [v14 setProperty:MEMORY[0x1E4F1CC38] forKey:@"hasTCCOptions"],
        !v7))
  {
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v23 = PUI_LocalizedStringForPrivacy(@"PHOTOS_ADD_ONLY_AUTHORIZATION");
  [v16 addObject:v23];

  [v17 addObject:&unk_1F4080488];
  if (v8)
  {
LABEL_4:
    uint64_t v18 = PUI_LocalizedStringForPrivacy(@"PHOTOS_LIMITED_AUTHORIZATION");
    [v16 addObject:v18];

    [v17 addObject:&unk_1F4080440];
    id v19 = PUI_LocalizedStringForPrivacy(@"PHOTOS_FULL_AUTHORIZATION");
    [v16 addObject:v19];

    [v17 addObject:&unk_1F4080458];
  }
LABEL_5:
  if (v24)
  {
    uint64_t v20 = PUI_LocalizedStringForPrivacy(@"PHOTOS_PICKER_ONLY_AUTHORIZATION");
    [v16 addObject:v20];

    [v17 addObject:&unk_1F40804A0];
    [v14 setProperty:MEMORY[0x1E4F1CC38] forKey:@"hasPickerInfo"];
  }
  [v14 setValues:v17 titles:v16];

  return v14;
}

- (void)_updatePhotosAuthorizationStates
{
  uint64_t v3 = *MEMORY[0x1E4FA9AE0];
  id v27 = 0;
  id v28 = 0;
  id v26 = 0;
  PUIPhotosAuthorizationStatesForService(v3, &v28, &v27, &v26, 0);
  id v4 = v28;
  id v5 = v27;
  id v6 = v26;
  uint64_t v7 = *MEMORY[0x1E4FA9AE8];
  id v24 = 0;
  id v25 = 0;
  id v23 = 0;
  PUIPhotosAuthorizationStatesForService(v7, &v25, 0, &v24, &v23);
  id v8 = v25;
  id v9 = v24;
  id v10 = v23;
  [(PUIPhotosPrivacyController *)self setPhotosReadWriteAllowedAppIDs:v4];
  [(PUIPhotosPrivacyController *)self setPhotosReadWriteLimitedAppIDs:v5];
  [(PUIPhotosPrivacyController *)self setPhotosReadWriteDeniedAppIDs:v6];
  [(PUIPhotosPrivacyController *)self setPhotosAddOnlyAllowedAppIDs:v8];
  [(PUIPhotosPrivacyController *)self setPhotosAddOnlyDeniedAppIDs:v9];
  v11 = PUIPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
  [(PUIPhotosPrivacyController *)self setPickerUsageAppIDs:v11];

  id v12 = [(PUIPhotosPrivacyController *)self photosReadWriteAllowedAppIDs];
  id v13 = [(PUIPhotosPrivacyController *)self photosReadWriteLimitedAppIDs];
  v14 = [v12 setByAddingObjectsFromSet:v13];
  [(PUIPhotosPrivacyController *)self setPhotosReadWriteAllowedOrLimitedAppIDs:v14];

  v15 = [(PUIPhotosPrivacyController *)self photosReadWriteAllowedOrLimitedAppIDs];
  uint64_t v16 = [v15 setByAddingObjectsFromSet:v6];
  [(PUIPhotosPrivacyController *)self setPhotosReadWriteAllAppIDs:v16];

  int v17 = [(PUIPhotosPrivacyController *)self photosReadWriteAllAppIDs];
  uint64_t v18 = [v17 setByAddingObjectsFromSet:v10];
  [(PUIPhotosPrivacyController *)self setPhotosReadWriteAllAppIDs:v18];

  id v19 = [v8 setByAddingObjectsFromSet:v9];

  [(PUIPhotosPrivacyController *)self setPhotosAddOnlyAllAppIDs:v19];
  uint64_t v20 = [(PUIPhotosPrivacyController *)self photosReadWriteAllAppIDs];
  id v21 = [(PUIPhotosPrivacyController *)self photosAddOnlyAllAppIDs];
  id v22 = [v20 setByAddingObjectsFromSet:v21];
  [(PUIPhotosPrivacyController *)self setPhotosAllAppIDs:v22];
}

- (void)_setPhotosStatus:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 propertyForKey:@"appBundleID"];
  if ([v6 intValue] == 2)
  {
    uint64_t v8 = *MEMORY[0x1E4FA9AE0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__PUIPhotosPrivacyController__setPhotosStatus_specifier___block_invoke;
    v19[3] = &unk_1E6E9C758;
    v19[4] = self;
    +[PUIPhotosPrivacyController setTCCForService:v8 appIdentifier:v7 value:2 completion:v19];
    goto LABEL_16;
  }
  if ([v6 intValue] == 1)
  {
    id v9 = [(PUIPhotosPrivacyController *)self photosReadWriteAllowedOrLimitedAppIDs];
    int v10 = [v9 containsObject:v7];

    if (v10) {
      +[PUIPhotosPrivacyController setTCCForService:*MEMORY[0x1E4FA9AE0] appIdentifier:v7 value:0];
    }
    uint64_t v11 = *MEMORY[0x1E4FA9AE8];
    id v12 = v7;
    uint64_t v13 = 1;
    goto LABEL_15;
  }
  if ([v6 intValue] == 3)
  {
    uint64_t v11 = *MEMORY[0x1E4FA9AE0];
    id v12 = v7;
    uint64_t v13 = 3;
LABEL_15:
    +[PUIPhotosPrivacyController setTCCForService:v11 appIdentifier:v12 value:v13];
    goto LABEL_16;
  }
  if ([v6 intValue] && objc_msgSend(v6, "intValue") != 5)
  {
    uint64_t v18 = _PUILoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PUIPhotosPrivacyController _setPhotosStatus:specifier:]((uint64_t)v6, v18);
    }
  }
  else
  {
    v14 = [(PUIPhotosPrivacyController *)self photosReadWriteAllowedOrLimitedAppIDs];
    int v15 = [v14 containsObject:v7];

    if (v15) {
      +[PUIPhotosPrivacyController setTCCForService:*MEMORY[0x1E4FA9AE0] appIdentifier:v7 value:0];
    }
    uint64_t v16 = [(PUIPhotosPrivacyController *)self photosAddOnlyAllowedAppIDs];
    int v17 = [v16 containsObject:v7];

    if (v17)
    {
      uint64_t v11 = *MEMORY[0x1E4FA9AE8];
      id v12 = v7;
      uint64_t v13 = 0;
      goto LABEL_15;
    }
  }
LABEL_16:
  [(PUIPhotosPrivacyController *)self _updatePhotosAuthorizationStates];
  [(PUIPhotosPrivacyController *)self reloadSpecifiers];
}

uint64_t __57__PUIPhotosPrivacyController__setPhotosStatus_specifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePhotosAuthorizationStates];
  v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

- (id)_photosStatus:(id)a3
{
  id v4 = [a3 propertyForKey:@"appBundleID"];
  id v5 = [(PUIPhotosPrivacyController *)self photosReadWriteAllowedAppIDs];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = &unk_1F4080458;
  }
  else
  {
    uint64_t v8 = [(PUIPhotosPrivacyController *)self photosReadWriteLimitedAppIDs];
    char v9 = [v8 containsObject:v4];

    if (v9)
    {
      uint64_t v7 = &unk_1F4080440;
    }
    else
    {
      int v10 = [(PUIPhotosPrivacyController *)self photosAddOnlyAllowedAppIDs];
      char v11 = [v10 containsObject:v4];

      if (v11)
      {
        uint64_t v7 = &unk_1F4080488;
      }
      else
      {
        id v12 = [(PUIPhotosPrivacyController *)self pickerUsageAppIDs];
        int v13 = [v12 containsObject:v4];

        if (v13) {
          uint64_t v7 = &unk_1F40804A0;
        }
        else {
          uint64_t v7 = &unk_1F4080470;
        }
      }
    }
  }

  return v7;
}

- (void)updateSpecifiersForImposedSettings
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", +[PUIPhotosPrivacyController isServiceRestricted:](PUIPhotosPrivacyController, "isServiceRestricted:", *MEMORY[0x1E4FA9AE0]) ^ 1);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = [(PUIPhotosPrivacyController *)self allAppSpecifiers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    uint64_t v7 = *MEMORY[0x1E4F93130];
    uint64_t v18 = *MEMORY[0x1E4F93220];
    uint64_t v16 = *MEMORY[0x1E4F93250];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = [v9 propertyForKey:v7];
        if (v10)
        {
          char v11 = (void *)v10;
          id v12 = [v9 objectForKeyedSubscript:v7];
          int v13 = [v12 BOOLValue];
          int v14 = [v3 BOOLValue];

          if (v13 == v14) {
            continue;
          }
        }
        [v9 setProperty:v3 forKey:v7];
        int v15 = [v9 propertyForKey:v18];
        objc_msgSend(v15, "setCellEnabled:", objc_msgSend(v3, "BOOLValue"));

        if (([v3 BOOLValue] & 1) == 0) {
          [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v16];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PUIPhotosPrivacyController *)self specifierForID:@"PICKER_APP_GROUP"];
  uint64_t v13 = 0;
  if (-[PUIPhotosPrivacyController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v13, 0, v8)&& (uint64_t v9 = [v7 section], v9 == v13))
  {
    BOOL v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PUIPhotosPrivacyController;
    BOOL v10 = [(PUIPhotosPrivacyController *)&v12 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }

  return v10;
}

- (NSSet)photosReadWriteAllowedAppIDs
{
  return self->_photosReadWriteAllowedAppIDs;
}

- (void)setPhotosReadWriteAllowedAppIDs:(id)a3
{
}

- (NSSet)photosReadWriteLimitedAppIDs
{
  return self->_photosReadWriteLimitedAppIDs;
}

- (void)setPhotosReadWriteLimitedAppIDs:(id)a3
{
}

- (NSSet)photosReadWriteDeniedAppIDs
{
  return self->_photosReadWriteDeniedAppIDs;
}

- (void)setPhotosReadWriteDeniedAppIDs:(id)a3
{
}

- (NSSet)photosAddOnlyAllowedAppIDs
{
  return self->_photosAddOnlyAllowedAppIDs;
}

- (void)setPhotosAddOnlyAllowedAppIDs:(id)a3
{
}

- (NSSet)photosAddOnlyDeniedAppIDs
{
  return self->_photosAddOnlyDeniedAppIDs;
}

- (void)setPhotosAddOnlyDeniedAppIDs:(id)a3
{
}

- (NSSet)pickerUsageAppIDs
{
  return self->_pickerUsageAppIDs;
}

- (void)setPickerUsageAppIDs:(id)a3
{
}

- (NSSet)photosReadWriteAllowedOrLimitedAppIDs
{
  return self->_photosReadWriteAllowedOrLimitedAppIDs;
}

- (void)setPhotosReadWriteAllowedOrLimitedAppIDs:(id)a3
{
}

- (NSSet)photosReadWriteAllAppIDs
{
  return self->_photosReadWriteAllAppIDs;
}

- (void)setPhotosReadWriteAllAppIDs:(id)a3
{
}

- (NSSet)photosAddOnlyAllAppIDs
{
  return self->_photosAddOnlyAllAppIDs;
}

- (void)setPhotosAddOnlyAllAppIDs:(id)a3
{
}

- (NSSet)photosAllAppIDs
{
  return self->_photosAllAppIDs;
}

- (void)setPhotosAllAppIDs:(id)a3
{
}

- (NSArray)allAppSpecifiers
{
  return self->_allAppSpecifiers;
}

- (void)setAllAppSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_photosAllAppIDs, 0);
  objc_storeStrong((id *)&self->_photosAddOnlyAllAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteAllAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteAllowedOrLimitedAppIDs, 0);
  objc_storeStrong((id *)&self->_pickerUsageAppIDs, 0);
  objc_storeStrong((id *)&self->_photosAddOnlyDeniedAppIDs, 0);
  objc_storeStrong((id *)&self->_photosAddOnlyAllowedAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteDeniedAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteLimitedAppIDs, 0);
  objc_storeStrong((id *)&self->_photosReadWriteAllowedAppIDs, 0);
}

- (void)_setPhotosStatus:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "Unexpected value set for photos tcc access: %@", (uint8_t *)&v2, 0xCu);
}

@end