@interface PSCalendarPolicyController
+ (id)loadPrivacySettingsBundle;
+ (unint64_t)authorizationRightforAccessLevel:(int)a3;
+ (void)setCalendarAccessForApp:(id)a3 toValue:(int)a4 shouldPrompt:(BOOL)a5;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4;
- (id)calendarStatus:(id)a3;
- (void)setCalendarStatus:(id)a3 specifier:(id)a4;
@end

@implementation PSCalendarPolicyController

+ (id)loadPrivacySettingsBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  v3 = SFRuntimeAbsoluteFilePathForPath();
  v4 = [v2 bundleWithPath:v3];

  [v4 load];
  return v4;
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = 0;
  id v18 = 0;
  id v16 = 0;
  PSCalendarAuthorizationStates(&v18, &v17, &v16);
  id v8 = v18;
  id v9 = v17;
  id v10 = v16;
  if (([v8 containsObject:v7] & 1) != 0
    || ([v9 containsObject:v7] & 1) != 0
    || [v10 containsObject:v7])
  {
    v11 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:sel_setCalendarStatus_specifier_ get:sel_calendarStatus_ detail:objc_opt_class() cell:2 edit:0];
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    [v11 setProperty:MEMORY[0x1E4F1CC38] forKey:@"useLazyIcons"];
    [v11 setProperty:v7 forKey:@"BUNDLE_ID"];
    [v11 setProperty:v7 forKey:@"APP_NAME"];
    [v11 setObject:v12 forKeyedSubscript:@"enabled"];
    [v11 setProperty:v7 forKey:@"id"];
    [v11 setObject:@"com.apple.mobilecal" forKeyedSubscript:@"appIDForLazyIcon"];
    v13 = [MEMORY[0x1E4F1CA48] array];
    v14 = [MEMORY[0x1E4F1CA48] array];
    if (appSpecifierWithName_bundleID__onceToken != -1) {
      dispatch_once(&appSpecifierWithName_bundleID__onceToken, &__block_literal_global_1);
    }
    [v13 addObject:appSpecifierWithName_bundleID__noAccessStr];
    [v14 addObject:&unk_1EFB73E20];
    [v13 addObject:appSpecifierWithName_bundleID__writeAccessStr];
    [v14 addObject:&unk_1EFB73DF0];
    [v13 addObject:appSpecifierWithName_bundleID__fullAccessStr];
    [v14 addObject:&unk_1EFB73E08];
    [v11 setValues:v14 titles:v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __60__PSCalendarPolicyController_appSpecifierWithName_bundleID___block_invoke()
{
  id v6 = +[PSCalendarPolicyController loadPrivacySettingsBundle];
  uint64_t v0 = [v6 localizedStringForKey:@"CALENDARS_FULL_ACCESS_AUTHORIZATION" value:&stru_1EFB51FD0 table:@"Privacy"];
  v1 = (void *)appSpecifierWithName_bundleID__fullAccessStr;
  appSpecifierWithName_bundleID__fullAccessStr = v0;

  uint64_t v2 = [v6 localizedStringForKey:@"CALENDARS_WRITE_ONLY_ACCESS_AUTHORIZATION" value:&stru_1EFB51FD0 table:@"Privacy"];
  v3 = (void *)appSpecifierWithName_bundleID__writeAccessStr;
  appSpecifierWithName_bundleID__writeAccessStr = v2;

  uint64_t v4 = [v6 localizedStringForKey:@"CALENDARS_NO_ACCESS_AUTHORIZATION" value:&stru_1EFB51FD0 table:@"Privacy"];
  v5 = (void *)appSpecifierWithName_bundleID__noAccessStr;
  appSpecifierWithName_bundleID__noAccessStr = v4;
}

- (id)calendarStatus:(id)a3
{
  v3 = [a3 propertyForKey:@"BUNDLE_ID"];
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  PSCalendarAuthorizationStates(&v12, &v11, &v10);
  id v4 = v12;
  id v5 = v11;
  id v6 = v10;
  if ([v4 containsObject:v3])
  {
    id v7 = &unk_1EFB73E08;
  }
  else if ([v5 containsObject:v3])
  {
    id v7 = &unk_1EFB73DF0;
  }
  else
  {
    if (([v6 containsObject:v3] & 1) == 0)
    {
      id v8 = _PSLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PSCalendarPolicyController calendarStatus:]((uint64_t)v3, v8);
      }
    }
    id v7 = &unk_1EFB73E20;
  }

  return v7;
}

- (void)setCalendarStatus:(id)a3 specifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"BUNDLE_ID"];
  if ([v5 intValue] == 2)
  {
    id v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "Requesting to set calendar auth for app %@ to full", (uint8_t *)&v15, 0xCu);
    }

    id v8 = v6;
    uint64_t v9 = 2;
    uint64_t v10 = 1;
  }
  else
  {
    if ([v5 intValue] == 1)
    {
      id v11 = _PSLoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_1A6597000, v11, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to write-only", (uint8_t *)&v15, 0xCu);
      }

      id v8 = v6;
      uint64_t v9 = 1;
    }
    else
    {
      int v12 = [v5 intValue];
      v13 = _PSLoggingFacility();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          int v15 = 138412290;
          id v16 = v5;
          _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected value set for calendar tcc access: %@", (uint8_t *)&v15, 0xCu);
        }

        id v8 = v6;
        uint64_t v9 = 3;
      }
      else
      {
        if (v14)
        {
          int v15 = 138412290;
          id v16 = v6;
          _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to denied", (uint8_t *)&v15, 0xCu);
        }

        id v8 = v6;
        uint64_t v9 = 0;
      }
    }
    uint64_t v10 = 0;
  }
  +[PSCalendarPolicyController setCalendarAccessForApp:v8 toValue:v9 shouldPrompt:v10];
}

+ (unint64_t)authorizationRightforAccessLevel:(int)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1A667F370[a3 - 1];
  }
}

+ (void)setCalendarAccessForApp:(id)a3 toValue:(int)a4 shouldPrompt:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (setCalendarAccessForApp_toValue_shouldPrompt__onceToken != -1) {
    dispatch_once(&setCalendarAccessForApp_toValue_shouldPrompt__onceToken, &__block_literal_global_79);
  }
  uint64_t v9 = _PSLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)*MEMORY[0x1E4FA9A30];
    *(_DWORD *)buf = 138412802;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 1024;
    int v25 = v6;
    _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
  }

  id v11 = v8;
  [v11 cStringUsingEncoding:4];
  int v12 = (void *)tcc_identity_create();
  v13 = tcc_service_singleton_for_CF_name();
  +[PSCalendarPolicyController authorizationRightforAccessLevel:v6];
  if (v5)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__PSCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke_80;
    v17[3] = &unk_1E5C5D6A8;
    id v19 = a1;
    id v14 = v11;
    id v18 = v14;
    int v15 = (void *)MEMORY[0x1AD0BE2A0](v17);
    id v16 = _PSLoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl(&dword_1A6597000, v16, OS_LOG_TYPE_DEFAULT, "Setting calendar auth for app %@ to full, after prompt", buf, 0xCu);
    }

    tcc_server_message_prompt_authorization_value();
  }
  else
  {
    tcc_server_message_set_authorization_value();
  }
}

uint64_t __75__PSCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke()
{
  uint64_t v0 = tcc_server_create();
  uint64_t v1 = setCalendarAccessForApp_toValue_shouldPrompt__tccServer;
  setCalendarAccessForApp_toValue_shouldPrompt__tccServer = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __75__PSCalendarPolicyController_setCalendarAccessForApp_toValue_shouldPrompt___block_invoke_80(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = @"PSCalendarPrivacyUpgradePromptAppIdentifierKey";
  v7[0] = v3;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"PSCalendarPrivacyUpgradePromptCompletedNotification" object:v4 userInfo:v5];
}

- (void)calendarStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "unknown state for %@, treating as denied", (uint8_t *)&v2, 0xCu);
}

@end