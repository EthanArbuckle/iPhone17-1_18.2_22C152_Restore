@interface PSPhotosPolicyController
- (id)_photosStatus:(id)a3;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6 showPickerUsage:(BOOL)a7;
- (void)_setPhotosStatus:(id)a3 specifier:(id)a4;
- (void)getAuthorizationStatesForService:(__CFString *)a3 allowedArray:(id *)a4 limitedArray:(id *)a5 deniedArray:(id *)a6;
- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5;
- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5 completion:(id)a6;
@end

@implementation PSPhotosPolicyController

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v8 = (void *)tcc_server_create();
  v9 = (void *)tcc_message_options_create();
  tcc_message_options_set_request_prompt_policy();
  tcc_message_options_set_reply_handler_policy();
  id v10 = v7;
  [v10 UTF8String];
  v11 = (void *)tcc_identity_create();
  uint64_t v19 = MEMORY[0x1E4F143A8];
  tcc_server_message_get_authorization_records_by_identity();
  v12 = PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
  uint64_t v13 = objc_msgSend(v12, "containsObject:", v10, v19, 3221225472, __58__PSPhotosPolicyController_appSpecifierWithName_bundleID___block_invoke, &unk_1E5C5D910, &v20, &v24);

  int v14 = *((unsigned __int8 *)v25 + 24);
  int v15 = *((unsigned __int8 *)v21 + 24);
  if (v14 | v15) {
    int v16 = 1;
  }
  else {
    int v16 = v13;
  }
  if (v16 == 1)
  {
    v17 = [(PSPhotosPolicyController *)self appSpecifierWithName:v6 bundleID:v10 showPhotosAccess:v15 != 0 showPhotosAddAccess:v14 != 0 showPickerUsage:v13];
  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v17;
}

void __58__PSPhotosPolicyController_appSpecifierWithName_bundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    v4 = tcc_authorization_record_get_service();
    CFStringRef CF_name = (const __CFString *)tcc_service_get_CF_name();
    if (CFStringCompare(CF_name, (CFStringRef)*MEMORY[0x1E4FA9AE0], 0))
    {
      if (CFStringCompare(CF_name, (CFStringRef)*MEMORY[0x1E4FA9AE8], 0))
      {
LABEL_7:

        id v3 = v9;
        goto LABEL_8;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      char has_prompted_for_allow = tcc_authorization_record_get_has_prompted_for_allow();
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      char v8 = *(unsigned char *)(v7 + 24) | has_prompted_for_allow;
    }
    else
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      char v8 = 1;
    }
    *(unsigned char *)(v7 + 24) = v8;
    goto LABEL_7;
  }
LABEL_8:
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6
{
  return [(PSPhotosPolicyController *)self appSpecifierWithName:a3 bundleID:a4 showPhotosAccess:a5 showPhotosAddAccess:a6 showPickerUsage:0];
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4 showPhotosAccess:(BOOL)a5 showPhotosAddAccess:(BOOL)a6 showPickerUsage:(BOOL)a7
{
  BOOL v23 = a7;
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:sel__setPhotosStatus_specifier_ get:sel__photosStatus_ detail:objc_opt_class() cell:2 edit:0];

  [v13 setIdentifier:v11];
  [v13 setProperty:v11 forKey:@"appBundleID"];

  int v14 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_AUTH_ONGOING_HEADER");
  [v13 setProperty:v14 forKey:@"staticHeaderText"];

  int v15 = [MEMORY[0x1E4F1CA48] array];
  int v16 = [MEMORY[0x1E4F1CA48] array];
  if (!v8 && !v7
    || (PS_LocalizedStringForSystemPolicy(@"PHOTOS_NO_ACCESS_AUTHORIZATION"),
        v21 = objc_claimAutoreleasedReturnValue(),
        [v15 addObject:v21],
        v21,
        [v16 addObject:&unk_1EFB73EE0],
        [v13 setProperty:MEMORY[0x1E4F1CC38] forKey:@"hasTCCOptions"],
        !v7))
  {
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v22 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_ADD_ONLY_AUTHORIZATION");
  [v15 addObject:v22];

  [v16 addObject:&unk_1EFB73EF8];
  if (v8)
  {
LABEL_4:
    v17 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_LIMITED_AUTHORIZATION");
    [v15 addObject:v17];

    [v16 addObject:&unk_1EFB73F10];
    v18 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_FULL_AUTHORIZATION");
    [v15 addObject:v18];

    [v16 addObject:&unk_1EFB73F28];
  }
LABEL_5:
  if (v23)
  {
    uint64_t v19 = PS_LocalizedStringForSystemPolicy(@"PHOTOS_PICKER_ONLY_AUTHORIZATION");
    [v15 addObject:v19];

    [v16 addObject:&unk_1EFB73F40];
    [v13 setProperty:MEMORY[0x1E4F1CC38] forKey:@"hasPickerInfo"];
  }
  [v13 setValues:v16 titles:v15];

  return v13;
}

- (void)_setPhotosStatus:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  BOOL v7 = [a4 propertyForKey:@"appBundleID"];
  BOOL v8 = (uint64_t *)MEMORY[0x1E4FA9AE8];
  uint64_t v9 = *MEMORY[0x1E4FA9AE8];
  id v23 = 0;
  [(PSPhotosPolicyController *)self getAuthorizationStatesForService:v9 allowedArray:&v23 limitedArray:0 deniedArray:0];
  id v10 = v23;
  id v11 = (uint64_t *)MEMORY[0x1E4FA9AE0];
  uint64_t v12 = *MEMORY[0x1E4FA9AE0];
  id v21 = 0;
  id v22 = 0;
  [(PSPhotosPolicyController *)self getAuthorizationStatesForService:v12 allowedArray:&v22 limitedArray:&v21 deniedArray:0];
  id v13 = v22;
  id v14 = v21;
  int v15 = [v13 arrayByAddingObjectsFromArray:v14];
  if ([v6 intValue] == 2)
  {
    uint64_t v16 = *v11;
    v17 = self;
    v18 = v7;
    uint64_t v19 = 2;
LABEL_15:
    [(PSPhotosPolicyController *)v17 setTCCForService:v16 appIdentifier:v18 value:v19];
    goto LABEL_16;
  }
  if ([v6 intValue] == 1)
  {
    if ([v15 containsObject:v7]) {
      [(PSPhotosPolicyController *)self setTCCForService:*v11 appIdentifier:v7 value:0];
    }
    uint64_t v16 = *v8;
    v17 = self;
    v18 = v7;
    uint64_t v19 = 1;
    goto LABEL_15;
  }
  if ([v6 intValue] == 3)
  {
    uint64_t v16 = *v11;
    v17 = self;
    v18 = v7;
    uint64_t v19 = 3;
    goto LABEL_15;
  }
  if ([v6 intValue] && objc_msgSend(v6, "intValue") != 4)
  {
    uint64_t v20 = _PSLoggingFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PSPhotosPolicyController _setPhotosStatus:specifier:]((uint64_t)v6, v20);
    }
  }
  else
  {
    if ([v15 containsObject:v7]) {
      [(PSPhotosPolicyController *)self setTCCForService:*v11 appIdentifier:v7 value:0];
    }
    if ([v10 containsObject:v7])
    {
      uint64_t v16 = *v8;
      v17 = self;
      v18 = v7;
      uint64_t v19 = 0;
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (id)_photosStatus:(id)a3
{
  v4 = [a3 propertyForKey:@"appBundleID"];
  uint64_t v5 = *MEMORY[0x1E4FA9AE8];
  id v16 = 0;
  [(PSPhotosPolicyController *)self getAuthorizationStatesForService:v5 allowedArray:&v16 limitedArray:0 deniedArray:0];
  id v6 = v16;
  uint64_t v7 = *MEMORY[0x1E4FA9AE0];
  id v14 = 0;
  id v15 = 0;
  [(PSPhotosPolicyController *)self getAuthorizationStatesForService:v7 allowedArray:&v15 limitedArray:&v14 deniedArray:0];
  id v8 = v15;
  id v9 = v14;
  if ([v8 containsObject:v4])
  {
    id v10 = &unk_1EFB73F28;
  }
  else if ([v9 containsObject:v4])
  {
    id v10 = &unk_1EFB73F10;
  }
  else if ([v6 containsObject:v4])
  {
    id v10 = &unk_1EFB73EF8;
  }
  else
  {
    id v11 = PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
    int v12 = [v11 containsObject:v4];

    if (v12) {
      id v10 = &unk_1EFB73F40;
    }
    else {
      id v10 = &unk_1EFB73EE0;
    }
  }

  return v10;
}

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5
{
}

- (void)setTCCForService:(__CFString *)a3 appIdentifier:(id)a4 value:(int)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = (void (**)(void))a6;
  if (setTCCForService_appIdentifier_value_completion__onceToken != -1) {
    dispatch_once(&setTCCForService_appIdentifier_value_completion__onceToken, &__block_literal_global_162);
  }
  int v12 = _PSLoggingFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = a3;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 1024;
    int v32 = a5;
    _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%d", buf, 0x1Cu);
  }

  id v13 = v10;
  [v13 cStringUsingEncoding:4];
  id v14 = (void *)tcc_identity_create();
  id v15 = tcc_service_singleton_for_CF_name();
  uint64_t v16 = 0;
  if ((a5 - 1) <= 2) {
    uint64_t v16 = qword_1A667F3B0[a5 - 1];
  }
  int v17 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4FA9AE0]);
  if (a5 == 2 && v17 && TCCLibraryCore() && gettcc_server_message_prompt_authorization_valueSymbolLoc())
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke_163;
    v24[3] = &unk_1E5C5D960;
    v24[4] = self;
    id v25 = v13;
    uint64_t v26 = v11;
    v18 = (void *)MEMORY[0x1AD0BE2A0](v24);
    id v19 = (id)setTCCForService_appIdentifier_value_completion__tccServer;
    id v20 = v14;
    id v21 = v15;
    id v22 = v18;
    id v23 = (void (*)(id, void, id, id, void, uint64_t, id))gettcc_server_message_prompt_authorization_valueSymbolLoc();
    if (!v23) {
      -[PSContactsAuthorizationLevelController dealloc]();
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

uint64_t __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke()
{
  uint64_t v0 = tcc_server_create();
  uint64_t v1 = setTCCForService_appIdentifier_value_completion__tccServer;
  setTCCForService_appIdentifier_value_completion__tccServer = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke_163(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = @"PUIPhotosPrivacyUpgradePromptAppIdentifierKey";
  v9[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v2 postNotificationName:@"PUIPhotosPrivacyUpgradePromptCompletedNotification" object:v4 userInfo:v5];

  if (*(void *)(a1 + 48))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke_2;
    v6[3] = &unk_1E5C5D938;
    id v7 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __76__PSPhotosPolicyController_setTCCForService_appIdentifier_value_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAuthorizationStatesForService:(__CFString *)a3 allowedArray:(id *)a4 limitedArray:(id *)a5 deniedArray:(id *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = (void *)tcc_server_create();
  id v11 = tcc_service_singleton_for_CF_name();
  int v12 = [MEMORY[0x1E4F1CA48] array];
  id v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = _PSLoggingFacility();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = a3;
    _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  tcc_server_message_get_authorization_records_by_service();
  if (a4) {
    *a4 = v16;
  }
  if (a5) {
    *a5 = v17;
  }
  if (a6) {
    *a6 = v18;
  }
}

void __99__PSPhotosPolicyController_getAuthorizationStatesForService_allowedArray_limitedArray_deniedArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    id v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          id v9 = (id *)(a1 + 48);
          goto LABEL_14;
        case 3:
          id v9 = (id *)(a1 + 40);
          goto LABEL_14;
        case 2:
          id v9 = (id *)(a1 + 32);
LABEL_14:
          [*v9 addObject:v8];
          break;
      }
    }

    goto LABEL_16;
  }
  id v10 = _PSLoggingFacility();
  id v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PSContactsAuthorizationStatesForService_block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:
}

- (void)_setPhotosStatus:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "Unexpected value set for photos tcc access: %@", (uint8_t *)&v2, 0xCu);
}

@end