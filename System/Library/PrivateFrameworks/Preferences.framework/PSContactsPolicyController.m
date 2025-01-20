@interface PSContactsPolicyController
- (NSSet)contactsDeniedAppIDs;
- (NSSet)contactsFullAccessAllowedAppIDs;
- (NSSet)contactsLimitedAccessAppIDs;
- (NSSet)pickerUsageAppIDs;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showContactsAccess:(BOOL)a5 showPickerUsage:(BOOL)a6;
- (id)contactsStatus:(id)a3;
- (void)_setContactsTCCStatus:(id)a3 specifier:(id)a4;
- (void)setContactsDeniedAppIDs:(id)a3;
- (void)setContactsFullAccessAllowedAppIDs:(id)a3;
- (void)setContactsLimitedAccessAppIDs:(id)a3;
- (void)setPickerUsageAppIDs:(id)a3;
- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5;
- (void)updateContactsAuthorizationStatus;
@end

@implementation PSContactsPolicyController

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a4;
  v9 = _PSLoggingFacility();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a5 != 4)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412802;
      v29 = a3;
      __int16 v30 = 2112;
      v31 = v8;
      __int16 v32 = 1024;
      int v33 = a5;
      _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
    }

    if (setTCCForService_appIdentifier_value__onceToken != -1) {
      dispatch_once(&setTCCForService_appIdentifier_value__onceToken, &__block_literal_global_218);
    }
    v11 = v8;
    [(__CFString *)v11 cStringUsingEncoding:4];
    v9 = tcc_identity_create();
    v12 = tcc_service_singleton_for_CF_name();
    switch(a5)
    {
      case 1:
        v18 = [(PSContactsPolicyController *)self contactsLimitedAccessAppIDs];
        char v19 = [v18 containsObject:v11];

        if ((v19 & 1) == 0) {
          goto LABEL_20;
        }
        break;
      case 3:
        goto LABEL_20;
      case 2:
        v13 = [(PSContactsPolicyController *)self contactsFullAccessAllowedAppIDs];
        char v14 = [v13 containsObject:v11];

        if ((v14 & 1) == 0)
        {
          if (_os_feature_enabled_impl())
          {
            uint64_t v22 = MEMORY[0x1E4F143A8];
            uint64_t v23 = 3221225472;
            v24 = __67__PSContactsPolicyController_setTCCForService_appIdentifier_value___block_invoke_2;
            v25 = &unk_1E5C5D720;
            v26 = self;
            v15 = v11;
            v27 = v15;
            v16 = (void *)MEMORY[0x1AD0BE2A0](&v22);
            v17 = _PSLoggingFacility();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v29 = a3;
              __int16 v30 = 2112;
              v31 = v15;
              _os_log_impl(&dword_1A6597000, v17, OS_LOG_TYPE_DEFAULT, "Setting %@ auth for app %@ to full, after prompt", buf, 0x16u);
            }

            tcc_server_message_prompt_authorization_value();
            goto LABEL_21;
          }
LABEL_20:
          tcc_server_message_set_authorization_value();
LABEL_21:
          [(PSContactsPolicyController *)self updateContactsAuthorizationStatus];
        }
        break;
      default:
        v20 = [(PSContactsPolicyController *)self contactsDeniedAppIDs];
        char v21 = [v20 containsObject:v11];

        if ((v21 & 1) == 0) {
          goto LABEL_20;
        }
        break;
    }

    goto LABEL_23;
  }
  if (v10)
  {
    *(_DWORD *)buf = 138412290;
    v29 = v8;
    _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_DEFAULT, "Access level is picker only; Skipping for app: %@",
      buf,
      0xCu);
  }
LABEL_23:
}

uint64_t __67__PSContactsPolicyController_setTCCForService_appIdentifier_value___block_invoke()
{
  uint64_t v0 = tcc_server_create();
  uint64_t v1 = setTCCForService_appIdentifier_value__tccServer;
  setTCCForService_appIdentifier_value__tccServer = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __67__PSContactsPolicyController_setTCCForService_appIdentifier_value___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7 = @"PSContactsPrivacyUpgradePromptAppIdentifierKey";
  v8[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 postNotificationName:@"PSContactsPrivacyUpgradePromptCompletedNotification" object:v4 userInfo:v5];

  dispatch_time_t v6 = dispatch_time(0, 100000000);
  dispatch_after(v6, MEMORY[0x1E4F14428], &__block_literal_global_223);
}

- (void)updateContactsAuthorizationStatus
{
  uint64_t v3 = *MEMORY[0x1E4FA9A10];
  id v9 = 0;
  id v10 = 0;
  id v8 = 0;
  PSContactsAuthorizationStatesForService(v3, &v10, &v9, &v8);
  id v4 = v10;
  id v5 = v9;
  id v6 = v8;
  [(PSContactsPolicyController *)self setContactsFullAccessAllowedAppIDs:v4];
  [(PSContactsPolicyController *)self setContactsLimitedAccessAppIDs:v5];
  [(PSContactsPolicyController *)self setContactsDeniedAppIDs:v6];

  v7 = bundleIdentifiersWithPickerAccess();
  [(PSContactsPolicyController *)self setPickerUsageAppIDs:v7];
}

- (id)contactsStatus:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 propertyForKey:@"appBundleID"];
  [(PSContactsPolicyController *)self updateContactsAuthorizationStatus];
  id v5 = [(PSContactsPolicyController *)self contactsFullAccessAllowedAppIDs];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has full contacts access", (uint8_t *)&v17, 0xCu);
    }
    id v8 = &unk_1EFB73E50;
    goto LABEL_19;
  }
  id v9 = [(PSContactsPolicyController *)self contactsLimitedAccessAppIDs];
  int v10 = [v9 containsObject:v4];

  if (v10)
  {
    v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has limited contacts access", (uint8_t *)&v17, 0xCu);
    }
    id v8 = &unk_1EFB73E38;
    goto LABEL_19;
  }
  v11 = [(PSContactsPolicyController *)self contactsDeniedAppIDs];
  int v12 = [v11 containsObject:v4];

  if (v12)
  {
    v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has no access to contacts", (uint8_t *)&v17, 0xCu);
    }
LABEL_18:
    id v8 = &unk_1EFB73E68;
    goto LABEL_19;
  }
  v13 = [(PSContactsPolicyController *)self pickerUsageAppIDs];
  int v14 = [v13 containsObject:v4];

  v15 = _PSLoggingFacility();
  v7 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PSContactsPolicyController contactsStatus:]((uint64_t)v4, v7);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "App %@ has private access to contacts", (uint8_t *)&v17, 0xCu);
  }
  id v8 = &unk_1EFB73E80;
LABEL_19:

  return v8;
}

- (void)_setContactsTCCStatus:(id)a3 specifier:(id)a4
{
  *(void *)&v16[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a4 propertyForKey:@"appBundleID"];
  uint64_t v8 = [v6 intValue];

  if (v8 > 4) {
    id v9 = @"unsupported";
  }
  else {
    id v9 = off_1E5C5D798[(int)v8];
  }
  int v10 = _PSLoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    int v14 = v7;
    __int16 v15 = 1024;
    *(_DWORD *)v16 = v8;
    v16[2] = 2112;
    *(void *)&v16[3] = v9;
    _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "Selected contacts auth for app %@: %d(%@)", (uint8_t *)&v13, 0x1Cu);
  }

  v11 = _PSLoggingFacility();
  int v12 = v11;
  if (v8 > 2)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 138412802;
      int v14 = v7;
      __int16 v15 = 1024;
      *(_DWORD *)v16 = v8;
      v16[2] = 2112;
      *(void *)&v16[3] = v9;
      _os_log_fault_impl(&dword_1A6597000, v12, OS_LOG_TYPE_FAULT, "Unexpected value set for contacts tcc access for app %@: %d(%@)", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      int v14 = v7;
      __int16 v15 = 2112;
      *(void *)v16 = v9;
      _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_DEFAULT, "Setting contacts auth for app %@ to %@", (uint8_t *)&v13, 0x16u);
    }

    [(PSContactsPolicyController *)self setTCCForService:*MEMORY[0x1E4FA9A10] appIdentifier:v7 value:v8];
  }
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4FA9A10];
  id v20 = 0;
  id v21 = 0;
  id v19 = 0;
  PSContactsAuthorizationStatesForService(v8, &v21, &v20, &v19);
  id v9 = v21;
  id v10 = v20;
  id v11 = v19;
  int v12 = [v9 setByAddingObjectsFromSet:v10];
  int v13 = [v12 setByAddingObjectsFromSet:v11];

  int v14 = bundleIdentifiersWithPickerAccess();
  uint64_t v15 = [v13 containsObject:v7];
  uint64_t v16 = [v14 containsObject:v7];
  if ((v15 & 1) != 0 || (int v17 = 0, v16))
  {
    int v17 = [(PSContactsPolicyController *)self appSpecifierWithName:v6 bundleID:v7 showContactsAccess:v15 showPickerUsage:v16];
  }

  return v17;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showContactsAccess:(BOOL)a5 showPickerUsage:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:sel__setContactsTCCStatus_specifier_ get:sel_contactsStatus_ detail:objc_opt_class() cell:2 edit:0];

  int v13 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v10 allowPlaceholder:1 error:0];
  [v12 setIdentifier:v10];
  [v12 setProperty:v10 forKey:@"appBundleID"];

  int v14 = [v13 localizedName];
  [v12 setProperty:v14 forKey:@"appLocalizedDisplayName"];

  uint64_t v15 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_AUTH_HEADER");
  [v12 setProperty:v15 forKey:@"staticHeaderText"];

  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  int v17 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    v18 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_NO_ACCESS_AUTHORIZATION");
    [v16 addObject:v18];

    [v17 addObject:&unk_1EFB73E68];
    [v12 setProperty:MEMORY[0x1E4F1CC38] forKey:@"hasTCCOptions"];
    id v19 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_LIMITED_ACCESS_AUTHORIZATION");
    [v16 addObject:v19];

    [v17 addObject:&unk_1EFB73E38];
    id v20 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_FULL_ACCESS_AUTHORIZATION");
    [v16 addObject:v20];

    [v17 addObject:&unk_1EFB73E50];
  }
  if (v6)
  {
    id v21 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_PICKER_ONLY_AUTHORIZATION");
    [v16 addObject:v21];

    [v17 addObject:&unk_1EFB73E80];
    [v12 setProperty:MEMORY[0x1E4F1CC38] forKey:@"hasPickerInfo"];
  }
  [v12 setValues:v17 titles:v16];

  return v12;
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

- (NSSet)pickerUsageAppIDs
{
  return self->_pickerUsageAppIDs;
}

- (void)setPickerUsageAppIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerUsageAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsDeniedAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsLimitedAccessAppIDs, 0);
  objc_storeStrong((id *)&self->_contactsFullAccessAllowedAppIDs, 0);
}

- (void)contactsStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "Unknown or unexpected status for contacts access, not in any array; Defaulting to denied: %@",
    (uint8_t *)&v2,
    0xCu);
}

@end