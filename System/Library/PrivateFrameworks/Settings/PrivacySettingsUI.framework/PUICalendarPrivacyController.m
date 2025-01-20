@interface PUICalendarPrivacyController
+ (BOOL)isServiceRestricted:(id)a3;
- (NSArray)calendarAppSpecifiers;
- (NSSet)calendarAllAppIDs;
- (NSSet)calendarFullAccessAllowedAppIDs;
- (NSSet)calendarNoAccessAppIDs;
- (NSSet)calendarSomeAccessAppIDs;
- (NSSet)calendarWriteOnlyAppIDs;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4;
- (id)calendarStatus:(id)a3;
- (id)specifiers;
- (void)_setCalendarStatus:(id)a3 specifier:(id)a4;
- (void)provideNavigationDonations;
- (void)setCalendarAllAppIDs:(id)a3;
- (void)setCalendarAppSpecifiers:(id)a3;
- (void)setCalendarFullAccessAllowedAppIDs:(id)a3;
- (void)setCalendarNoAccessAppIDs:(id)a3;
- (void)setCalendarSomeAccessAppIDs:(id)a3;
- (void)setCalendarWriteOnlyAppIDs:(id)a3;
- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5;
- (void)updateCalendarAuthorizationStates;
- (void)updateSpecifiersForImposedSettings;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUICalendarPrivacyController

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

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUICalendarPrivacyController;
  [(PUICalendarPrivacyController *)&v4 viewDidAppear:a3];
  [(PUICalendarPrivacyController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  char v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"CALENDARS" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/CALENDARS"];
  [(PUICalendarPrivacyController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.privacy" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = _PUILoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v19 = a3;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 1024;
    int v23 = a5;
    _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
  }

  if (setTCCForService_appIdentifier_value__onceToken != -1) {
    dispatch_once(&setTCCForService_appIdentifier_value__onceToken, &__block_literal_global_5);
  }
  id v10 = v8;
  [v10 cStringUsingEncoding:4];
  v11 = (void *)tcc_identity_create();
  v12 = tcc_service_singleton_for_CF_name();
  if (a5 == 2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke_2;
    v16[3] = &unk_1E6E9D390;
    v16[4] = self;
    v13 = (__CFString *)v10;
    v17 = v13;
    v14 = _Block_copy(v16);
    v15 = _PUILoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_1E4AD5000, v15, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to full, after prompt", buf, 0xCu);
    }

    tcc_server_message_prompt_authorization_value();
  }
  else
  {
    tcc_server_message_set_authorization_value();
  }
}

uint64_t __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke()
{
  setTCCForService_appIdentifier_value__tccServer = tcc_server_create();
  return MEMORY[0x1F41817F8]();
}

void __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) updateCalendarAuthorizationStates];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = @"PUICalendarPrivacyUpgradePromptAppIdentifierKey";
  v9[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v2 postNotificationName:@"PUICalendarPrivacyUpgradePromptCompletedNotification" object:v4 userInfo:v5];

  dispatch_time_t v6 = dispatch_time(0, 100000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke_3;
  v7[3] = &unk_1E6E9C758;
  v7[4] = *(void *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
}

uint64_t __69__PUICalendarPrivacyController_setTCCForService_appIdentifier_value___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v44 = (int)*MEMORY[0x1E4F92F08];
    val = self;
    [(PUICalendarPrivacyController *)self updateCalendarAuthorizationStates];
    id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = (void *)MEMORY[0x1E4FA9A30];
    id v5 = (void *)TCCAccessCopyInformation();
    dispatch_time_t v6 = objc_opt_new();
    BOOL v46 = +[PUICalendarPrivacyController isServiceRestricted:*v4];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v65;
      id v52 = (id)*MEMORY[0x1E4F931C0];
      uint64_t v50 = *MEMORY[0x1E4F931D0];
      uint64_t v9 = *MEMORY[0x1E4F93130];
      id v10 = (void *)MEMORY[0x1E4FA99D8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v65 != v8) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          v13 = (__CFBundle *)[v12 objectForKey:*v10];
          v14 = v13;
          if (v13)
          {
            v15 = CFBundleGetIdentifier(v13);
            if (([v6 containsObject:v15] & 1) == 0)
            {
              [v6 addObject:v15];
              v16 = PUIDisplayNameForApp(v14);
              v17 = [(PUICalendarPrivacyController *)val appSpecifierWithName:v16 bundleID:v15];
              [v17 setProperty:v15 forKey:v52];
              [v17 setProperty:MEMORY[0x1E4F1CC38] forKey:v50];
              v18 = [MEMORY[0x1E4F28ED0] numberWithInt:!v46];
              [v17 setObject:v18 forKeyedSubscript:v9];

              [v54 addObject:v17];
            }
          }
          else
          {
            v15 = _PUILoggingFacility();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v12;
              _os_log_impl(&dword_1E4AD5000, v15, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v7);
    }

    v45 = PUIGetActivePairedDevice();
    if (v45 && objc_opt_class())
    {
      v51 = [MEMORY[0x1E4F79F08] sharedInstance];
      ScreenScale();
      if ((int)v19 == 2) {
        int v20 = 47;
      }
      else {
        int v20 = 48;
      }
      unsigned int v49 = v20;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v53 = [(PUICalendarPrivacyController *)val calendarAllAppIDs];
      uint64_t v21 = [v53 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v61;
        unsigned int v48 = !v46;
        uint64_t v47 = *MEMORY[0x1E4F93130];
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v61 != v22) {
              objc_enumerationMutation(v53);
            }
            uint64_t v24 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            if (([v6 containsObject:v24] & 1) == 0)
            {
              [v6 addObject:v24];
              v25 = PUIDisplayNameForWatchApp(v24);
              if (v25)
              {
                id v26 = v24;
              }
              else
              {
                PUIWatchBundleIDForBundleID(v24);
                id v26 = (id)objc_claimAutoreleasedReturnValue();
                v25 = PUIDisplayNameForWatchApp(v26);
              }
              if (v25) {
                v27 = v25;
              }
              else {
                v27 = v24;
              }
              v28 = [(PUICalendarPrivacyController *)val appSpecifierWithName:v27 bundleID:v24];
              v29 = [MEMORY[0x1E4F28ED0] numberWithInt:v48];
              [v28 setObject:v29 forKeyedSubscript:v47];

              objc_initWeak((id *)buf, val);
              v57[0] = MEMORY[0x1E4F143A8];
              v57[1] = 3221225472;
              v57[2] = __42__PUICalendarPrivacyController_specifiers__block_invoke;
              v57[3] = &unk_1E6E9D3E0;
              id v30 = v28;
              id v58 = v30;
              objc_copyWeak(&v59, (id *)buf);
              [v51 getIconForBundleID:v26 iconVariant:v49 block:v57 timeout:-1.0];
              [v54 addObject:v30];
              objc_destroyWeak(&v59);

              objc_destroyWeak((id *)buf);
            }
          }
          uint64_t v21 = [v53 countByEnumeratingWithState:&v60 objects:v68 count:16];
        }
        while (v21);
      }
    }
    [v54 sortUsingComparator:&__block_literal_global_107];
    v31 = (void *)[v54 copy];
    [(PUICalendarPrivacyController *)val setCalendarAppSpecifiers:v31];

    v32 = objc_opt_new();
    v33 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    [v33 setIdentifier:@"CALENDAR_PRIVACY_DESCRIPTION"];
    v34 = PUI_LocalizedStringForPrivacy(@"CALENDARS_PRIVACY_DESCRIPTION");
    uint64_t v35 = *MEMORY[0x1E4F93170];
    [v33 setProperty:v34 forKey:*MEMORY[0x1E4F93170]];
    [v32 addObject:v33];
    v36 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:val set:0 get:0 detail:0 cell:-1 edit:0];
    [v36 setProperty:@"CALENDAR_PICKER_INFO_CELL" forKey:*MEMORY[0x1E4F93188]];
    v37 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
    [v36 setProperty:v37 forKey:*MEMORY[0x1E4F93218]];

    [v36 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
    [v36 setIdentifier:@"CALENDAR_PREVIEW_GROUP"];
    [v32 addObject:v36];
    BOOL v38 = [v54 count] == 0;
    v39 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    v40 = v39;
    if (v38)
    {
      [v39 setIdentifier:@"NO_APP_GROUP"];
      v41 = PUI_LocalizedStringForPrivacy(@"CALENDARS_NO_APP_FOOTER");
      [v40 setProperty:v41 forKey:v35];
      [v32 addObject:v40];
    }
    else
    {
      [v39 setIdentifier:@"CALENDAR_FOOTER_SPACING"];
      [v32 addObject:v40];
      [v32 addObjectsFromArray:v54];
    }

    v42 = *(Class *)((char *)&val->super.super.super.super.super.isa + v44);
    *(Class *)((char *)&val->super.super.super.super.super.isa + v44) = (Class)v32;

    [(PUICalendarPrivacyController *)val updateSpecifiersForImposedSettings];
    uint64_t v3 = *(Class *)((char *)&val->super.super.super.super.super.isa + v44);
  }
  return v3;
}

void __42__PUICalendarPrivacyController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PUICalendarPrivacyController_specifiers__block_invoke_2;
  block[3] = &unk_1E6E9D3B8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __42__PUICalendarPrivacyController_specifiers__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93190]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

uint64_t __42__PUICalendarPrivacyController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F92E70];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 preferenceSpecifierNamed:v8 target:self set:sel__setCalendarStatus_specifier_ get:sel_calendarStatus_ detail:objc_opt_class() cell:2 edit:0];

  [v9 setIdentifier:v7];
  [v9 setProperty:v7 forKey:@"appBundleID"];

  id v10 = PUI_LocalizedStringForPrivacy(@"CALENDARS_AUTH_HEADER");
  [v9 setProperty:v10 forKey:*MEMORY[0x1E4F93200]];

  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = PUI_LocalizedStringForPrivacy(@"CALENDARS_NO_ACCESS_AUTHORIZATION");
  [v11 addObject:v13];

  [v12 addObject:&unk_1F40803C8];
  v14 = PUI_LocalizedStringForPrivacy(@"CALENDARS_WRITE_ONLY_ACCESS_AUTHORIZATION");
  [v11 addObject:v14];

  [v12 addObject:&unk_1F4080398];
  v15 = PUI_LocalizedStringForPrivacy(@"CALENDARS_FULL_ACCESS_AUTHORIZATION");
  [v11 addObject:v15];

  [v12 addObject:&unk_1F40803B0];
  [v9 setValues:v12 titles:v11];

  return v9;
}

- (void)_setCalendarStatus:(id)a3 specifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a4 propertyForKey:@"appBundleID"];
  id v8 = _PUILoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    double v19 = v7;
    __int16 v20 = 1024;
    int v21 = [v6 intValue];
    _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "Selected entry for app %@: %d", (uint8_t *)&v18, 0x12u);
  }

  if ([v6 intValue] == 2)
  {
    uint64_t v9 = _PUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      double v19 = v7;
      _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to full", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v10 = *MEMORY[0x1E4FA9A30];
    v11 = self;
    v12 = v7;
    uint64_t v13 = 2;
LABEL_18:
    [(PUICalendarPrivacyController *)v11 setTCCForService:v10 appIdentifier:v12 value:v13];
    goto LABEL_19;
  }
  if ([v6 intValue] == 1)
  {
    v14 = _PUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      double v19 = v7;
      _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to write-only", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v10 = *MEMORY[0x1E4FA9A30];
    v11 = self;
    v12 = v7;
    uint64_t v13 = 1;
    goto LABEL_18;
  }
  int v15 = [v6 intValue];
  v16 = _PUILoggingFacility();
  v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      double v19 = v7;
      _os_log_impl(&dword_1E4AD5000, v17, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to denied", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v10 = *MEMORY[0x1E4FA9A30];
    v11 = self;
    v12 = v7;
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[PUICalendarPrivacyController _setCalendarStatus:specifier:]((uint64_t)v6, v17);
  }

LABEL_19:
  [(PUICalendarPrivacyController *)self updateCalendarAuthorizationStates];
  [(PUICalendarPrivacyController *)self reloadSpecifiers];
}

- (id)calendarStatus:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 propertyForKey:@"appBundleID"];
  id v5 = [(PUICalendarPrivacyController *)self calendarFullAccessAllowedAppIDs];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has full calendar access", (uint8_t *)&v15, 0xCu);
    }
    id v8 = &unk_1F40803B0;
  }
  else
  {
    uint64_t v9 = [(PUICalendarPrivacyController *)self calendarWriteOnlyAppIDs];
    int v10 = [v9 containsObject:v4];

    if (v10)
    {
      id v7 = _PUILoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has write-only calendar access", (uint8_t *)&v15, 0xCu);
      }
      id v8 = &unk_1F4080398;
    }
    else
    {
      v11 = [(PUICalendarPrivacyController *)self calendarNoAccessAppIDs];
      int v12 = [v11 containsObject:v4];

      uint64_t v13 = _PUILoggingFacility();
      id v7 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          v16 = v4;
          _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has no calendar access", (uint8_t *)&v15, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[PUICalendarPrivacyController calendarStatus:]((uint64_t)v4, v7);
      }
      id v8 = &unk_1F40803C8;
    }
  }

  return v8;
}

- (void)updateCalendarAuthorizationStates
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FA9A30];
  id v4 = (void *)tcc_server_create();
  id v5 = tcc_service_singleton_for_CF_name();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = _PUILoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v25) = 138412290;
    *(void *)((char *)&v25 + 4) = v3;
    _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", (uint8_t *)&v25, 0xCu);
  }

  *(void *)&long long v25 = MEMORY[0x1E4F143A8];
  *((void *)&v25 + 1) = 3221225472;
  id v26 = __PUICalendarAuthorizationStatesForService_block_invoke;
  v27 = &unk_1E6E9D428;
  id v28 = v6;
  id v29 = v7;
  id v30 = v8;
  uint64_t v31 = v3;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  tcc_server_message_get_authorization_records_by_service();
  id v13 = (id)[v12 copy];
  id v14 = (id)[v11 copy];
  id v15 = (id)[v10 copy];

  id v16 = v13;
  id v17 = v14;
  id v18 = v15;
  [(PUICalendarPrivacyController *)self setCalendarFullAccessAllowedAppIDs:v16];
  [(PUICalendarPrivacyController *)self setCalendarWriteOnlyAppIDs:v17];

  [(PUICalendarPrivacyController *)self setCalendarNoAccessAppIDs:v18];
  double v19 = [(PUICalendarPrivacyController *)self calendarWriteOnlyAppIDs];
  __int16 v20 = [(PUICalendarPrivacyController *)self calendarFullAccessAllowedAppIDs];
  int v21 = [v19 setByAddingObjectsFromSet:v20];
  [(PUICalendarPrivacyController *)self setCalendarSomeAccessAppIDs:v21];

  uint64_t v22 = [(PUICalendarPrivacyController *)self calendarSomeAccessAppIDs];
  int v23 = [(PUICalendarPrivacyController *)self calendarNoAccessAppIDs];
  uint64_t v24 = [v22 setByAddingObjectsFromSet:v23];
  [(PUICalendarPrivacyController *)self setCalendarAllAppIDs:v24];
}

- (void)updateSpecifiersForImposedSettings
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", +[PUICalendarPrivacyController isServiceRestricted:](PUICalendarPrivacyController, "isServiceRestricted:", *MEMORY[0x1E4FA9A30]) ^ 1);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = [(PUICalendarPrivacyController *)self calendarAppSpecifiers];
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
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = [v9 propertyForKey:v7];
        if (v10)
        {
          id v11 = (void *)v10;
          id v12 = [v9 objectForKeyedSubscript:v7];
          int v13 = [v12 BOOLValue];
          int v14 = [v3 BOOLValue];

          if (v13 == v14) {
            continue;
          }
        }
        [v9 setProperty:v3 forKey:v7];
        id v15 = [v9 propertyForKey:v18];
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

- (NSSet)calendarFullAccessAllowedAppIDs
{
  return self->_calendarFullAccessAllowedAppIDs;
}

- (void)setCalendarFullAccessAllowedAppIDs:(id)a3
{
}

- (NSSet)calendarWriteOnlyAppIDs
{
  return self->_calendarWriteOnlyAppIDs;
}

- (void)setCalendarWriteOnlyAppIDs:(id)a3
{
}

- (NSSet)calendarNoAccessAppIDs
{
  return self->_calendarNoAccessAppIDs;
}

- (void)setCalendarNoAccessAppIDs:(id)a3
{
}

- (NSSet)calendarSomeAccessAppIDs
{
  return self->_calendarSomeAccessAppIDs;
}

- (void)setCalendarSomeAccessAppIDs:(id)a3
{
}

- (NSSet)calendarAllAppIDs
{
  return self->_calendarAllAppIDs;
}

- (void)setCalendarAllAppIDs:(id)a3
{
}

- (NSArray)calendarAppSpecifiers
{
  return self->_calendarAppSpecifiers;
}

- (void)setCalendarAppSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_calendarAllAppIDs, 0);
  objc_storeStrong((id *)&self->_calendarSomeAccessAppIDs, 0);
  objc_storeStrong((id *)&self->_calendarNoAccessAppIDs, 0);
  objc_storeStrong((id *)&self->_calendarWriteOnlyAppIDs, 0);
  objc_storeStrong((id *)&self->_calendarFullAccessAllowedAppIDs, 0);
}

- (void)_setCalendarStatus:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "Unexpected value set for calendar tcc access: %@", (uint8_t *)&v2, 0xCu);
}

- (void)calendarStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "Unexpected status for calendar access, not in any array: %@", (uint8_t *)&v2, 0xCu);
}

@end