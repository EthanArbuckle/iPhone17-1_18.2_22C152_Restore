@interface PUIContactsPrivacyController
+ (BOOL)isServiceRestricted:(id)a3;
- (NSArray)contactsAppSpecifiers;
- (NSSet)contactsAllAppIDs;
- (NSSet)contactsDeniedAppIDs;
- (NSSet)contactsFullAccessAllowedAppIDs;
- (NSSet)contactsLimitedAccessAppIDs;
- (NSSet)pickerUsageAppIDs;
- (id)accesssForSpecifier:(id)a3;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showContactsAccess:(BOOL)a5 showPickerUsage:(BOOL)a6;
- (id)contactsStatus:(id)a3;
- (id)createSpecifiers;
- (id)createSpecifiersWithCombinedPickerUsage;
- (id)specifiers;
- (void)_setContactsTCCStatus:(id)a3 specifier:(id)a4;
- (void)provideNavigationDonations;
- (void)setAccess:(id)a3 forSpecifier:(id)a4;
- (void)setContactsAllAppIDs:(id)a3;
- (void)setContactsAppSpecifiers:(id)a3;
- (void)setContactsDeniedAppIDs:(id)a3;
- (void)setContactsFullAccessAllowedAppIDs:(id)a3;
- (void)setContactsLimitedAccessAppIDs:(id)a3;
- (void)setPickerUsageAppIDs:(id)a3;
- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5;
- (void)updateContactsAuthorizationStates;
- (void)updateSpecifiersForImposedSettings;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUIContactsPrivacyController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIContactsPrivacyController;
  [(PUIContactsPrivacyController *)&v4 viewDidAppear:a3];
  [(PUIContactsPrivacyController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = PUI_BundleForPrivacySettingsFramework();
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"CONTACTS" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/CONTACTS"];
  [(PUIContactsPrivacyController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.privacy" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  objc_super v4 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  id v5 = v4;
  if (v4) {
    char v6 = [v4 containsObject:v3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)updateSpecifiersForImposedSettings
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", +[PUIContactsPrivacyController isServiceRestricted:](PUIContactsPrivacyController, "isServiceRestricted:", *MEMORY[0x1E4FA9A10]) ^ 1);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(PUIContactsPrivacyController *)self contactsAppSpecifiers];
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
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = [v9 propertyForKey:v7];
        if (v10)
        {
          v11 = (void *)v10;
          v12 = [v9 objectForKeyedSubscript:v7];
          int v13 = [v12 BOOLValue];
          int v14 = [v3 BOOLValue];

          if (v13 == v14) {
            continue;
          }
        }
        [v9 setProperty:v3 forKey:v7];
        v15 = [v9 propertyForKey:v18];
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

- (void)updateContactsAuthorizationStates
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FA9A10];
  uint64_t v4 = (void *)tcc_server_create();
  uint64_t v5 = tcc_service_singleton_for_CF_name();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v9 = _PUILoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v25) = 138412290;
    *(void *)((char *)&v25 + 4) = v3;
    _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", (uint8_t *)&v25, 0xCu);
  }

  *(void *)&long long v25 = MEMORY[0x1E4F143A8];
  *((void *)&v25 + 1) = 3221225472;
  v26 = __PUIContactsAuthorizationStatesForService_block_invoke;
  v27 = &unk_1E6E9D428;
  id v10 = v6;
  id v28 = v10;
  id v11 = v7;
  id v29 = v11;
  id v12 = v8;
  id v30 = v12;
  uint64_t v31 = v3;
  tcc_server_message_get_authorization_records_by_service();
  id v13 = (id)[v10 copy];
  id v14 = (id)[v11 copy];
  if (v12) {
    id v15 = (id)[v12 copy];
  }
  else {
    id v15 = 0;
  }

  id v16 = v13;
  id v17 = v14;
  id v18 = v15;
  [(PUIContactsPrivacyController *)self setContactsFullAccessAllowedAppIDs:v16];
  [(PUIContactsPrivacyController *)self setContactsLimitedAccessAppIDs:v17];

  [(PUIContactsPrivacyController *)self setContactsDeniedAppIDs:v18];
  long long v19 = [(PUIContactsPrivacyController *)self contactsFullAccessAllowedAppIDs];
  long long v20 = [(PUIContactsPrivacyController *)self contactsLimitedAccessAppIDs];
  long long v21 = [v19 setByAddingObjectsFromSet:v20];

  long long v22 = [(PUIContactsPrivacyController *)self contactsDeniedAppIDs];
  v23 = [v21 setByAddingObjectsFromSet:v22];
  [(PUIContactsPrivacyController *)self setContactsAllAppIDs:v23];

  uint64_t v24 = bundleIdentifiersWithPickerAccess();
  [(PUIContactsPrivacyController *)self setPickerUsageAppIDs:v24];
}

- (void)_setContactsTCCStatus:(id)a3 specifier:(id)a4
{
  *(void *)&v16[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a4 propertyForKey:@"appBundleID"];
  uint64_t v8 = [v6 intValue];

  if (v8 > 4) {
    v9 = @"unsupported";
  }
  else {
    v9 = off_1E6E9D488[(int)v8];
  }
  id v10 = _PUILoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 1024;
    *(_DWORD *)id v16 = v8;
    v16[2] = 2112;
    *(void *)&v16[3] = v9;
    _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "Selected contacts auth for app %@: %d(%@)", (uint8_t *)&v13, 0x1Cu);
  }

  id v11 = _PUILoggingFacility();
  id v12 = v11;
  if (v8 > 2)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 1024;
      *(_DWORD *)id v16 = v8;
      v16[2] = 2112;
      *(void *)&v16[3] = v9;
      _os_log_fault_impl(&dword_1E4AD5000, v12, OS_LOG_TYPE_FAULT, "Unexpected value set for contacts tcc access for app %@: %d(%@)", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      *(void *)id v16 = v9;
      _os_log_impl(&dword_1E4AD5000, v12, OS_LOG_TYPE_DEFAULT, "Setting contacts auth for app %@ to %@", (uint8_t *)&v13, 0x16u);
    }

    [(PUIContactsPrivacyController *)self setTCCForService:*MEMORY[0x1E4FA9A10] appIdentifier:v7 value:v8];
  }
  [(PUIContactsPrivacyController *)self updateContactsAuthorizationStates];
  [(PUIContactsPrivacyController *)self reloadSpecifiers];
}

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (__CFString *)a4;
  v9 = _PUILoggingFacility();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a5 != 4)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412802;
      long long v25 = a3;
      __int16 v26 = 2112;
      v27 = v8;
      __int16 v28 = 1024;
      int v29 = a5;
      _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
    }

    if (setTCCForService_appIdentifier_value__onceToken_0 != -1) {
      dispatch_once(&setTCCForService_appIdentifier_value__onceToken_0, &__block_literal_global_252);
    }
    id v11 = v8;
    [(__CFString *)v11 cStringUsingEncoding:4];
    v9 = tcc_identity_create();
    id v12 = tcc_service_singleton_for_CF_name();
    if (a5 == 1)
    {
      id v18 = [(PUIContactsPrivacyController *)self contactsLimitedAccessAppIDs];
      char v19 = [v18 containsObject:v11];

      if (v19) {
        goto LABEL_21;
      }
    }
    else if (a5 != 3)
    {
      if (a5 == 2)
      {
        int v13 = [(PUIContactsPrivacyController *)self contactsFullAccessAllowedAppIDs];
        char v14 = [v13 containsObject:v11];

        if ((v14 & 1) == 0)
        {
          if (_os_feature_enabled_impl())
          {
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __69__PUIContactsPrivacyController_setTCCForService_appIdentifier_value___block_invoke_2;
            v22[3] = &unk_1E6E9D390;
            v22[4] = self;
            __int16 v15 = v11;
            v23 = v15;
            id v16 = _Block_copy(v22);
            id v17 = _PUILoggingFacility();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v25 = a3;
              __int16 v26 = 2112;
              v27 = v15;
              _os_log_impl(&dword_1E4AD5000, v17, OS_LOG_TYPE_DEFAULT, "Setting %@ auth for app %@ to full, after prompt", buf, 0x16u);
            }

            tcc_server_message_prompt_authorization_value();
            goto LABEL_21;
          }
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_22;
      }
      long long v20 = [(PUIContactsPrivacyController *)self contactsDeniedAppIDs];
      char v21 = [v20 containsObject:v11];

      if (v21) {
        goto LABEL_21;
      }
    }
LABEL_20:
    tcc_server_message_set_authorization_value();
    [(PUIContactsPrivacyController *)self updateContactsAuthorizationStates];
    goto LABEL_21;
  }
  if (v10)
  {
    *(_DWORD *)buf = 138412290;
    long long v25 = v8;
    _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "Access level is picker only; Skipping for app: %@",
      buf,
      0xCu);
  }
LABEL_22:
}

uint64_t __69__PUIContactsPrivacyController_setTCCForService_appIdentifier_value___block_invoke()
{
  setTCCForService_appIdentifier_value__tccServer_0 = tcc_server_create();
  return MEMORY[0x1F41817F8]();
}

void __69__PUIContactsPrivacyController_setTCCForService_appIdentifier_value___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) updateContactsAuthorizationStates];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v8 = @"PUIContactsPrivacyUpgradePromptAppIdentifierKey";
  v9[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v2 postNotificationName:@"PUIContactsPrivacyUpgradePromptCompletedNotification" object:v4 userInfo:v5];

  dispatch_time_t v6 = dispatch_time(0, 100000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PUIContactsPrivacyController_setTCCForService_appIdentifier_value___block_invoke_3;
  v7[3] = &unk_1E6E9C758;
  v7[4] = *(void *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
}

uint64_t __69__PUIContactsPrivacyController_setTCCForService_appIdentifier_value___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)contactsStatus:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 propertyForKey:@"appBundleID"];
  uint64_t v5 = [(PUIContactsPrivacyController *)self contactsFullAccessAllowedAppIDs];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has full contacts access", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v8 = &unk_1F40803F8;
    goto LABEL_19;
  }
  v9 = [(PUIContactsPrivacyController *)self contactsLimitedAccessAppIDs];
  int v10 = [v9 containsObject:v4];

  if (v10)
  {
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has limited contacts access", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v8 = &unk_1F40803E0;
    goto LABEL_19;
  }
  id v11 = [(PUIContactsPrivacyController *)self contactsDeniedAppIDs];
  int v12 = [v11 containsObject:v4];

  if (v12)
  {
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has no access to contacts", (uint8_t *)&v17, 0xCu);
    }
LABEL_18:
    uint64_t v8 = &unk_1F4080410;
    goto LABEL_19;
  }
  int v13 = [(PUIContactsPrivacyController *)self pickerUsageAppIDs];
  int v14 = [v13 containsObject:v4];

  __int16 v15 = _PUILoggingFacility();
  id v7 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PUIContactsPrivacyController contactsStatus:]((uint64_t)v4, v7);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has private access to contacts", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v8 = &unk_1F4080428;
LABEL_19:

  return v8;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showContactsAccess:(BOOL)a5 showPickerUsage:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  int v10 = (void *)MEMORY[0x1E4F92E70];
  id v11 = a4;
  id v12 = a3;
  int v13 = [v10 preferenceSpecifierNamed:v12 target:self set:sel__setContactsTCCStatus_specifier_ get:sel_contactsStatus_ detail:objc_opt_class() cell:2 edit:0];
  [v13 setIdentifier:v11];
  [v13 setProperty:v11 forKey:@"appBundleID"];

  [v13 setProperty:v12 forKey:@"appLocalizedDisplayName"];
  int v14 = PUI_LocalizedStringForPrivacy(@"CONTACTS_AUTH_HEADER");
  [v13 setProperty:v14 forKey:*MEMORY[0x1E4F93200]];

  __int16 v15 = [MEMORY[0x1E4F1CA48] array];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    int v17 = PUI_LocalizedStringForPrivacy(@"CONTACTS_NO_ACCESS_AUTHORIZATION");
    [v15 addObject:v17];

    [v16 addObject:&unk_1F4080410];
    [v13 setProperty:MEMORY[0x1E4F1CC38] forKey:@"hasTCCOptions"];
    id v18 = PUI_LocalizedStringForPrivacy(@"CONTACTS_LIMITED_ACCESS_AUTHORIZATION");
    [v15 addObject:v18];

    [v16 addObject:&unk_1F40803E0];
    uint64_t v19 = PUI_LocalizedStringForPrivacy(@"CONTACTS_FULL_ACCESS_AUTHORIZATION");
    [v15 addObject:v19];

    [v16 addObject:&unk_1F40803F8];
  }
  if (v6)
  {
    long long v20 = PUI_LocalizedStringForPrivacy(@"CONTACTS_PICKER_ONLY_AUTHORIZATION");
    [v15 addObject:v20];

    [v16 addObject:&unk_1F4080428];
    [v13 setProperty:MEMORY[0x1E4F1CC38] forKey:@"hasPickerInfo"];
  }
  [v13 setValues:v16 titles:v15];

  return v13;
}

- (id)createSpecifiersWithCombinedPickerUsage
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v60 = (int)*MEMORY[0x1E4F92F08];
    [(PUIContactsPrivacyController *)self updateContactsAuthorizationStates];
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v5 = (void *)MEMORY[0x1E4FA9A10];
    BOOL v6 = TCCAccessCopyInformation();
    BOOL v61 = +[PUIContactsPrivacyController isServiceRestricted:*v5];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v88 objects:v98 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v89;
      to = (id *)*MEMORY[0x1E4F931C0];
      id v66 = (id)*MEMORY[0x1E4F931D0];
      uint64_t v64 = *MEMORY[0x1E4F93130];
      v9 = (void *)MEMORY[0x1E4FA99D8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v89 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          id v12 = (__CFBundle *)[v11 objectForKey:*v9];
          int v13 = v12;
          if (v12)
          {
            int v14 = CFBundleGetIdentifier(v12);
            if (([v4 containsObject:v14] & 1) == 0)
            {
              [v4 addObject:v14];
              __int16 v15 = PUIDisplayNameForApp(v13);
              id v16 = [(PUIContactsPrivacyController *)self contactsAllAppIDs];
              uint64_t v17 = [v16 containsObject:v14];

              id v18 = [(PUIContactsPrivacyController *)self pickerUsageAppIDs];
              uint64_t v19 = [v18 containsObject:v14];

              if ((v17 | v19) == 1)
              {
                long long v20 = [(PUIContactsPrivacyController *)self appSpecifierWithName:v15 bundleID:v14 showContactsAccess:v17 showPickerUsage:v19];
                [v20 setProperty:v14 forKey:to];
                [v20 setProperty:MEMORY[0x1E4F1CC38] forKey:v66];
                char v21 = [MEMORY[0x1E4F28ED0] numberWithInt:!v61];
                [v20 setProperty:v21 forKey:v64];

                [v74 addObject:v20];
              }
            }
          }
          else
          {
            int v14 = _PUILoggingFacility();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v93 = v11;
              _os_log_impl(&dword_1E4AD5000, v14, OS_LOG_TYPE_DEFAULT, "Contacts: TCCAccess skipping app with nil bundle for %@", buf, 0xCu);
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v88 objects:v98 count:16];
      }
      while (v7);
    }

    v62 = PUIGetActivePairedDevice();
    if (v62 && objc_opt_class())
    {
      long long v22 = [MEMORY[0x1E4F79F08] sharedInstance];
      ScreenScale();
      long long v86 = 0u;
      long long v87 = 0u;
      if ((int)v23 == 2) {
        int v24 = 47;
      }
      else {
        int v24 = 48;
      }
      unsigned int v65 = v24;
      long long v85 = 0uLL;
      long long v84 = 0uLL;
      id v67 = [(PUIContactsPrivacyController *)self contactsAllAppIDs];
      uint64_t v25 = [v67 countByEnumeratingWithState:&v84 objects:v97 count:16];
      if (v25)
      {
        uint64_t v71 = *(void *)v85;
        uint64_t v63 = *MEMORY[0x1E4F93130];
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v85 != v71) {
              objc_enumerationMutation(v67);
            }
            v27 = *(void **)(*((void *)&v84 + 1) + 8 * j);
            if (([v4 containsObject:v27] & 1) == 0)
            {
              [v4 addObject:v27];
              __int16 v28 = PUIDisplayNameForWatchApp(v27);
              if (v28)
              {
                id v29 = v27;
              }
              else
              {
                PUIWatchBundleIDForBundleID(v27);
                id v29 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v28 = PUIDisplayNameForWatchApp(v29);
              }
              uint64_t v30 = [(PUIContactsPrivacyController *)self contactsAllAppIDs];
              uint64_t v31 = [v30 containsObject:v27];

              uint64_t v32 = [(PUIContactsPrivacyController *)self pickerUsageAppIDs];
              uint64_t v33 = [v32 containsObject:v27];

              if (v28) {
                v34 = v28;
              }
              else {
                v34 = v27;
              }
              v35 = [(PUIContactsPrivacyController *)self appSpecifierWithName:v34 bundleID:v27 showContactsAccess:v31 showPickerUsage:v33];
              v36 = [MEMORY[0x1E4F28ED0] numberWithInt:!v61];
              [v35 setObject:v36 forKeyedSubscript:v63];

              objc_initWeak((id *)buf, self);
              v81[0] = MEMORY[0x1E4F143A8];
              v81[1] = 3221225472;
              v81[2] = __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke;
              v81[3] = &unk_1E6E9D3E0;
              id v37 = v35;
              id v82 = v37;
              objc_copyWeak(&v83, (id *)buf);
              [v22 getIconForBundleID:v29 iconVariant:v65 block:v81 timeout:-1.0];
              [v74 addObject:v37];
              objc_destroyWeak(&v83);

              objc_destroyWeak((id *)buf);
            }
          }
          uint64_t v25 = [v67 countByEnumeratingWithState:&v84 objects:v97 count:16];
        }
        while (v25);
      }
    }
    v72 = bundleIdentifiersWithPickerAccess();
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v38 = [v72 countByEnumeratingWithState:&v77 objects:v96 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v78;
      toa = (id *)*MEMORY[0x1E4F931C0];
      id v68 = (id)*MEMORY[0x1E4F931D0];
      uint64_t v40 = *MEMORY[0x1E4F93130];
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v78 != v39) {
            objc_enumerationMutation(v72);
          }
          v42 = *(void **)(*((void *)&v77 + 1) + 8 * k);
          if ([v4 containsObject:v42])
          {
            v43 = _PUILoggingFacility();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v93 = v42;
              _os_log_impl(&dword_1E4AD5000, v43, OS_LOG_TYPE_DEFAULT, "Contacts: Skipping picker log: %@", buf, 0xCu);
            }
          }
          else
          {
            id v76 = 0;
            v44 = [MEMORY[0x1E4F223C8] bundleRecordWithApplicationIdentifier:v42 error:&v76];
            v43 = v76;
            if (v44)
            {
              v45 = [v44 localizedName];
              v46 = [(PUIContactsPrivacyController *)self appSpecifierWithName:v45 bundleID:v42 showContactsAccess:0 showPickerUsage:1];
              [v46 setProperty:v42 forKey:toa];
              [v46 setProperty:MEMORY[0x1E4F1CC38] forKey:v68];
              v47 = [MEMORY[0x1E4F28ED0] numberWithInt:!v61];
              [v46 setObject:v47 forKeyedSubscript:v40];

              [v74 addObject:v46];
            }
            else
            {
              v45 = _PUILoggingFacility();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v93 = v42;
                __int16 v94 = 2112;
                v95 = v43;
                _os_log_impl(&dword_1E4AD5000, v45, OS_LOG_TYPE_DEFAULT, "Contacts: Skipping picker log for app (%@) without bundle record with error: %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v38 = [v72 countByEnumeratingWithState:&v77 objects:v96 count:16];
      }
      while (v38);
    }
    [v74 sortUsingComparator:&__block_literal_global_280];
    v48 = (void *)[v74 copy];
    [(PUIContactsPrivacyController *)self setContactsAppSpecifiers:v48];

    v49 = objc_opt_new();
    v50 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    [v50 setIdentifier:@"CONTACTS_PRIVACY_FOOTER"];
    v51 = PUI_LocalizedStringForPrivacy(@"CONTACTS_PRIVACY_FOOTER");
    uint64_t v52 = *MEMORY[0x1E4F93170];
    [v50 setProperty:v51 forKey:*MEMORY[0x1E4F93170]];
    [v49 addObject:v50];
    v53 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v53 setProperty:@"CONTACTS_PICKER_INFO_CELL" forKey:*MEMORY[0x1E4F93188]];
    v54 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB2F28]];
    [v53 setProperty:v54 forKey:*MEMORY[0x1E4F93218]];

    [v53 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
    [v53 setIdentifier:@"CONTACTS_AVATAR_VIEW"];
    [v49 addObject:v53];
    if ([v74 count])
    {
      v55 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F4072988 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      [v55 setIdentifier:@"CONTACTS_APP_GROUP"];
      [v49 addObject:v55];
      [v49 addObjectsFromArray:v74];
    }
    else
    {
      v55 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      [v55 setIdentifier:@"NO_APP_GROUP"];
      v56 = PUI_LocalizedStringForPrivacy(@"CONTACTS_NO_APP_FOOTER");
      [v55 setProperty:v56 forKey:v52];
      [v49 addObject:v55];
    }
    v57 = *(Class *)((char *)&self->super.super.super.super.super.isa + v60);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v60) = (Class)v49;
    id v58 = v49;

    id v3 = *(id *)((char *)&self->super.super.super.super.super.isa + v60);
  }
  return v3;
}

void __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke_2;
  block[3] = &unk_1E6E9D3B8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93190]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

uint64_t __71__PUIContactsPrivacyController_createSpecifiersWithCombinedPickerUsage__block_invoke_277(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)accesssForSpecifier:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x1E4F93250]];
}

- (void)setAccess:(id)a3 forSpecifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F93250];
  id v8 = [v6 propertyForKey:*MEMORY[0x1E4F93250]];
  char v9 = [v5 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [v6 propertyForKey:@"appBundleID"];
    [v5 BOOLValue];
    TCCAccessSetForBundleId();
    [v6 setProperty:v5 forKey:v7];
    id v11 = _PUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1E4AD5000, v11, OS_LOG_TYPE_DEFAULT, "########### Quitting application (%@) in response to privacy settings change.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)createSpecifiers
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v56 = (int)*MEMORY[0x1E4F92F08];
    id v4 = (void *)TCCAccessCopyInformation();
    v72 = objc_opt_new();
    v70 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
    if (v5)
    {
      to = *(id **)v81;
      uint64_t v68 = *MEMORY[0x1E4F931C0];
      uint64_t v65 = *MEMORY[0x1E4F93250];
      uint64_t v67 = *MEMORY[0x1E4F931D0];
      uint64_t v61 = *MEMORY[0x1E4F930A8];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(id **)v81 != to) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          id v8 = (__CFBundle *)[v7 objectForKey:*MEMORY[0x1E4FA99D8]];
          char v9 = v8;
          if (v8)
          {
            uint64_t v10 = CFBundleGetIdentifier(v8);
            [v72 addObject:v10];
            id v11 = (void *)MEMORY[0x1E4F92E70];
            int v12 = PUIDisplayNameForApp(v9);
            uint64_t v13 = [v11 preferenceSpecifierNamed:v12 target:self set:sel_setAccess_forSpecifier_ get:sel_accesssForSpecifier_ detail:0 cell:6 edit:0];

            [v13 setIdentifier:v10];
            [v13 setProperty:v10 forKey:v68];
            [v13 setProperty:MEMORY[0x1E4F1CC38] forKey:v67];
            uint64_t v14 = [v7 objectForKey:*MEMORY[0x1E4FA99E8]];
            [v13 setProperty:v14 forKey:v65];

            [v13 setProperty:v10 forKey:@"appBundleID"];
            [v13 setProperty:v10 forKey:@"PUITCCAccessControllerBundleIDKey"];
            __int16 v15 = [(PUIContactsPrivacyController *)self specifier];
            id v16 = [v15 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];

            if (v16)
            {
              uint64_t v17 = [(PUIContactsPrivacyController *)self specifier];
              id v18 = [v17 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];
              [v13 setProperty:v18 forKey:v61];
            }
            uint64_t v19 = [(PUIContactsPrivacyController *)self specifier];
            long long v20 = [v19 objectForKeyedSubscript:@"PUITCCAccessControllerCellDelegateKey"];

            if (v20)
            {
              char v21 = [(PUIContactsPrivacyController *)self specifier];
              long long v22 = [v21 objectForKeyedSubscript:@"PUITCCAccessControllerCellDelegateKey"];
              [v13 setProperty:v22 forKey:@"PUITCCAccessControllerCellDelegateKey"];
            }
            [v70 addObject:v13];
          }
          else
          {
            uint64_t v10 = _PUILoggingFacility();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v86 = v7;
              _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "TCCAccess skipping app with nil bundle: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
      }
      while (v5);
    }

    v57 = PUIGetActivePairedDevice();
    if (v57 && objc_opt_class())
    {
      double v23 = (void *)MEMORY[0x1E4F1CAD0];
      int v24 = (void *)TCCAccessCopyBundleIdentifiersForService();
      id v66 = [v23 setWithArray:v24];

      uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v26 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
      v55 = [v25 setWithArray:v26];

      v27 = [v66 setByAddingObjectsFromSet:v55];
      uint64_t v64 = [MEMORY[0x1E4F79F08] sharedInstance];
      ScreenScale();
      if ((int)v28 == 2) {
        int v29 = 47;
      }
      else {
        int v29 = 48;
      }
      unsigned int v62 = v29;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v69 = v27;
      uint64_t v30 = [v69 countByEnumeratingWithState:&v76 objects:v84 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v77;
        uint64_t v59 = *MEMORY[0x1E4F93250];
        uint64_t v60 = *MEMORY[0x1E4F93190];
        uint64_t v58 = *MEMORY[0x1E4F930A8];
        do
        {
          uint64_t v32 = 0;
          do
          {
            if (*(void *)v77 != v31) {
              objc_enumerationMutation(v69);
            }
            uint64_t v33 = *(void **)(*((void *)&v76 + 1) + 8 * v32);
            if (([v72 containsObject:v33] & 1) == 0)
            {
              [v72 addObject:v33];
              uint64_t v34 = PUIDisplayNameForWatchApp(v33);
              if (v34)
              {
                uint64_t v35 = v33;
                v36 = (void *)MEMORY[0x1E4F92E70];
                goto LABEL_30;
              }
              uint64_t v35 = PUIWatchBundleIDForBundleID(v33);
              uint64_t v34 = PUIDisplayNameForWatchApp((void *)v35);
              if (!(v34 | v35)) {
                goto LABEL_36;
              }
              v36 = (void *)MEMORY[0x1E4F92E70];
              id v37 = v33;
              if (v34) {
LABEL_30:
              }
                id v37 = (void *)v34;
              uint64_t v38 = [v36 preferenceSpecifierNamed:v37 target:self set:sel__setContactsTCCStatus_specifier_ get:sel_contactsStatus_ detail:0 cell:6 edit:0];
              [v38 setIdentifier:v33];
              uint64_t v39 = PSBlankIconImage();
              [v38 setProperty:v39 forKey:v60];

              uint64_t v40 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v66, "containsObject:", v33));
              [v38 setProperty:v40 forKey:v59];

              [v38 setProperty:v33 forKey:@"appBundleID"];
              [v38 setProperty:v33 forKey:@"PUITCCAccessControllerBundleIDKey"];
              v41 = [(PUIContactsPrivacyController *)self specifier];
              v42 = [v41 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];

              if (v42)
              {
                v43 = [(PUIContactsPrivacyController *)self specifier];
                v44 = [v43 objectForKeyedSubscript:@"PUITCCAccessControllerCellClassKey"];
                [v38 setProperty:v44 forKey:v58];
              }
              v45 = [(PUIContactsPrivacyController *)self specifier];
              v46 = [v45 objectForKeyedSubscript:@"PUITCCAccessControllerCellDelegateKey"];

              if (v46)
              {
                v47 = [(PUIContactsPrivacyController *)self specifier];
                v48 = [v47 objectForKeyedSubscript:@"PUITCCAccessControllerCellDelegateKey"];
                [v38 setProperty:v48 forKey:@"PUITCCAccessControllerCellDelegateKey"];
              }
              objc_initWeak((id *)buf, self);
              v73[0] = MEMORY[0x1E4F143A8];
              v73[1] = 3221225472;
              v73[2] = __48__PUIContactsPrivacyController_createSpecifiers__block_invoke;
              v73[3] = &unk_1E6E9D3E0;
              id v49 = v38;
              id v74 = v49;
              objc_copyWeak(&v75, (id *)buf);
              [v64 getIconForBundleID:v35 iconVariant:v62 block:v73 timeout:-1.0];
              [v70 addObject:v49];
              objc_destroyWeak(&v75);

              objc_destroyWeak((id *)buf);
            }
LABEL_36:
            ++v32;
          }
          while (v30 != v32);
          uint64_t v50 = [v69 countByEnumeratingWithState:&v76 objects:v84 count:16];
          uint64_t v30 = v50;
        }
        while (v50);
      }
    }
    [v70 sortUsingComparator:&__block_literal_global_303];
    v51 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    uint64_t v52 = PUI_LocalizedStringForPrivacy(@"CONTACTS_FOOTER");
    [v51 setProperty:v52 forKey:*MEMORY[0x1E4F93170]];

    [v70 addObject:v51];
    v53 = *(Class *)((char *)&self->super.super.super.super.super.isa + v56);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v56) = (Class)v70;

    [(PUIContactsPrivacyController *)self updateSpecifiersForImposedSettings];
    id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v56);
  }
  return v3;
}

void __48__PUIContactsPrivacyController_createSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PUIContactsPrivacyController_createSpecifiers__block_invoke_2;
  block[3] = &unk_1E6E9D3B8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __48__PUIContactsPrivacyController_createSpecifiers__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F93190]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

uint64_t __48__PUIContactsPrivacyController_createSpecifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    if (_os_feature_enabled_impl()) {
      [(PUIContactsPrivacyController *)self createSpecifiersWithCombinedPickerUsage];
    }
    else {
    id v4 = [(PUIContactsPrivacyController *)self createSpecifiers];
    }
    uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v4;
  }
  id v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v6;
}

- (NSSet)contactsFullAccessAllowedAppIDs
{
  return self->_contactsFullAccessAllowedAppIDs;
}

- (void)setContactsFullAccessAllowedAppIDs:(id)a3
{
}

- (NSSet)contactsLimitedAccessAppIDs
{
  return self->_contactsLimitedAccessAppIDs;
}

- (void)setContactsLimitedAccessAppIDs:(id)a3
{
}

- (NSSet)contactsDeniedAppIDs
{
  return self->_contactsDeniedAppIDs;
}

- (void)setContactsDeniedAppIDs:(id)a3
{
}

- (NSSet)contactsAllAppIDs
{
  return self->_contactsAllAppIDs;
}

- (void)setContactsAllAppIDs:(id)a3
{
}

- (NSSet)pickerUsageAppIDs
{
  return self->_pickerUsageAppIDs;
}

- (void)setPickerUsageAppIDs:(id)a3
{
}

- (NSArray)contactsAppSpecifiers
{
  return self->_contactsAppSpecifiers;
}

- (void)setContactsAppSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_pickerUsageAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsAllAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsDeniedAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsLimitedAccessAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsFullAccessAllowedAppIDs, 0);
}

- (void)contactsStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "Unknown or unexpected status for contacts access, not in any array; Defaulting to denied: %@",
    (uint8_t *)&v2,
    0xCu);
}

@end