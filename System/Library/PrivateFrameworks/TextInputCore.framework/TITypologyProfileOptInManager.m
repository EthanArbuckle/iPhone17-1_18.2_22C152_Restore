@interface TITypologyProfileOptInManager
+ (id)localizedStringForKey:(id)a3;
- (BOOL)_isProfileInstalledAndUserEnabled;
- (BOOL)devicePasscodeSet;
- (BOOL)iCloudAccountAvailable;
- (BOOL)isTypologyProfileInstalled;
- (TITypologyProfileOptInManager)init;
- (TITypologyProfileState)typologyProfileState;
- (id)notificationDetailsForType:(int64_t)a3;
- (void)_askUserToAllow;
- (void)_launchVPNAndDeviceManagementSettings;
- (void)dismissDialogWithCompletionHandler:(id)a3;
- (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)setTypologyProfileState:(id)a3;
@end

@implementation TITypologyProfileOptInManager

- (void).cxx_destruct
{
}

- (void)setTypologyProfileState:(id)a3
{
}

- (TITypologyProfileState)typologyProfileState
{
  return self->_typologyProfileState;
}

- (void)dismissDialogWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

uint64_t __68__TITypologyProfileOptInManager_dismissDialogWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (sNotification)
  {
    CFUserNotificationCancel((CFUserNotificationRef)sNotification);
    CFRelease((CFTypeRef)sNotification);
    sNotification = 0;
    (*(void (**)(uint64_t, void))(sCompletionHandler + 16))(sCompletionHandler, 0);
    v2 = (void *)sCompletionHandler;
    sCompletionHandler = 0;
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (id)notificationDetailsForType:(int64_t)a3
{
  if (a3)
  {
    id v3 = 0;
    id v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  else
  {
    v7 = [(id)objc_opt_class() localizedStringForKey:@"TYPOLOGY_PROFILE_OPT_IN_TITLE"];
    id v3 = [(id)objc_opt_class() localizedStringForKey:@"TYPOLOGY_PROFILE_OPT_IN_MESSAGE"];
    id v4 = [(id)objc_opt_class() localizedStringForKey:@"TYPOLOGY_PROFILE_OPT_IN_ENABLE"];
    v5 = [(id)objc_opt_class() localizedStringForKey:@"TYPOLOGY_PROFILE_OPT_IN_NOT_NOW"];
    v6 = [(id)objc_opt_class() localizedStringForKey:@"TYPOLOGY_PROFILE_OPT_IN_REMOVE_PROFILE"];
  }
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:v7 forKey:*MEMORY[0x1E4F1D990]];
  [v8 setObject:v3 forKey:*MEMORY[0x1E4F1D9A8]];
  [v8 setObject:v6 forKey:*MEMORY[0x1E4F1D9E0]];
  v9 = [NSNumber numberWithBool:1];
  [v8 setObject:v9 forKey:@"DismissOnLock"];

  if (v5) {
    [v8 setObject:v5 forKey:*MEMORY[0x1E4F1DA10]];
  }
  if (v4) {
    [v8 setObject:v4 forKey:*MEMORY[0x1E4F1D9D0]];
  }
  v10 = [NSNumber numberWithBool:1];
  [v8 setObject:v10 forKey:@"SBUserNotificationAllowMenuButtonDismissal"];

  v11 = [NSNumber numberWithBool:1];
  [v8 setObject:v11 forKey:@"SBUserNotificationForcesModalAlertAppearance"];

  v12 = [NSNumber numberWithBool:1];
  [v8 setObject:v12 forKey:@"SBUserNotificationDisplayActionButtonOnLockScreen"];

  v13 = [NSNumber numberWithBool:1];
  [v8 setObject:v13 forKey:*MEMORY[0x1E4F1D9B8]];

  return v8;
}

- (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  TIDispatchAsync();
}

void __76__TITypologyProfileOptInManager_presentDialogForType_withCompletionHandler___block_invoke(uint64_t a1)
{
  if (sNotification)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    SInt32 error = 0;
    CFDictionaryRef v3 = [*(id *)(a1 + 32) notificationDetailsForType:*(void *)(a1 + 48)];
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    sNotification = (uint64_t)CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, &error, v3);
    id v5 = *(void (***)(void, void))(a1 + 40);
    if (error)
    {
      v5[2](v5, 0);
    }
    else
    {
      uint64_t v6 = [v5 copy];
      v7 = (void *)sCompletionHandler;
      sCompletionHandler = v6;

      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v4, (CFUserNotificationRef)sNotification, (CFUserNotificationCallBack)_HandleUserNotificationCallBack, 0);
      if (RunLoopSource)
      {
        v9 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v9, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        CFRelease(v9);
      }
      else
      {
        (*(void (**)(uint64_t, void))(sCompletionHandler + 16))(sCompletionHandler, 0);
        if (sNotification)
        {
          CFUserNotificationCancel((CFUserNotificationRef)sNotification);
          CFRelease((CFTypeRef)sNotification);
          sNotification = 0;
        }
      }
    }
  }
}

- (void)_launchVPNAndDeviceManagementSettings
{
  v2 = [NSClassFromString(&cfstr_Lsapplicationw.isa) defaultWorkspace];
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=ManagedConfigurationList"];
  uint64_t v4 = 0;
  [v2 openSensitiveURL:v3 withOptions:0 error:&v4];
}

- (TITypologyProfileOptInManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TITypologyProfileOptInManager;
  v2 = [(TITypologyProfileOptInManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[TITypologyProfileState typologyProfileStateFromPersistedState];
    typologyProfileState = v2->_typologyProfileState;
    v2->_typologyProfileState = (TITypologyProfileState *)v3;
  }
  return v2;
}

- (void)_askUserToAllow
{
  uint64_t v3 = TITypologyProfileStateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEFAULT, "Prompting user to opt-in.", buf, 2u);
  }

  uint64_t v4 = [TITypologyProfileState alloc];
  id v5 = [(TITypologyProfileOptInManager *)self typologyProfileState];
  objc_super v6 = [v5 profileInstallationDate];
  v7 = [MEMORY[0x1E4F1C9C8] now];
  v8 = [(TITypologyProfileState *)v4 initWithProfileInstallationDate:v6 userNotificationDate:v7 userResponse:@"None"];
  [(TITypologyProfileOptInManager *)self setTypologyProfileState:v8];

  v9 = [(TITypologyProfileOptInManager *)self typologyProfileState];
  [v9 persistState];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__TITypologyProfileOptInManager__askUserToAllow__block_invoke;
  v10[3] = &unk_1E6E2B3E8;
  v10[4] = self;
  [(TITypologyProfileOptInManager *)self presentDialogForType:0 withCompletionHandler:v10];
}

void __48__TITypologyProfileOptInManager__askUserToAllow__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a2)
  {
    case 0:
      objc_super v6 = TITypologyProfileStateLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      __int16 v20 = 0;
      v7 = "Opt-in response: cancel opt-in dialogue.";
      v8 = (uint8_t *)&v20;
      goto LABEL_16;
    case 1:
      v9 = TITypologyProfileStateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEFAULT, "Opt-in response: opt-in.", buf, 2u);
      }

      v10 = [TITypologyProfileState alloc];
      v11 = [*(id *)(a1 + 32) typologyProfileState];
      v12 = [v11 profileInstallationDate];
      v13 = [*(id *)(a1 + 32) typologyProfileState];
      v14 = [v13 userNotificationDate];
      v15 = @"Enable";
      goto LABEL_13;
    case 2:
      v16 = TITypologyProfileStateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEFAULT, "Opt-in response: go to remove profile.", v21, 2u);
      }

      [*(id *)(a1 + 32) _launchVPNAndDeviceManagementSettings];
      return;
    case 3:
      v17 = TITypologyProfileStateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1E3F0E000, v17, OS_LOG_TYPE_DEFAULT, "Opt-in response: not now.", v22, 2u);
      }

      v10 = [TITypologyProfileState alloc];
      v11 = [*(id *)(a1 + 32) typologyProfileState];
      v12 = [v11 profileInstallationDate];
      v13 = [*(id *)(a1 + 32) typologyProfileState];
      v14 = [v13 userNotificationDate];
      v15 = @"NotNow";
LABEL_13:
      v18 = [(TITypologyProfileState *)v10 initWithProfileInstallationDate:v12 userNotificationDate:v14 userResponse:v15];
      [*(id *)(a1 + 32) setTypologyProfileState:v18];

      objc_super v6 = [*(id *)(a1 + 32) typologyProfileState];
      [v6 persistState];
      goto LABEL_17;
    case 4:
      objc_super v6 = TITypologyProfileStateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        v7 = "Opt-in response: unspecified.";
        v8 = (uint8_t *)&v19;
LABEL_16:
        _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
LABEL_17:

      break;
    default:
      return;
  }
}

- (BOOL)_isProfileInstalledAndUserEnabled
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  int v4 = [v3 BOOLForKey:54];

  id v5 = TITypologyDiagnosticExtensionOSLogFacility();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!v4)
  {
    if (v6)
    {
      v31 = [NSString stringWithFormat:@"%s %@", "-[TITypologyProfileOptInManager _isProfileInstalledAndUserEnabled]", @"CustomerTypologyEnabledByDiagnosticExtension is false"];
      *(_DWORD *)buf = 138412290;
      v49 = v31;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    if ([(TITypologyProfileOptInManager *)self isTypologyProfileInstalled])
    {
      v7 = TITypologyProfileStateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEFAULT, "Profile installed. Checking for elgibility and opt-in.", buf, 2u);
      }

      if ([(TITypologyProfileOptInManager *)self devicePasscodeSet])
      {
        v8 = TITypologyProfileStateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "Not eligible for profile (passcode)";
LABEL_18:
          _os_log_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if ([(TITypologyProfileOptInManager *)self iCloudAccountAvailable])
      {
        v8 = TITypologyProfileStateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "Not eligible for profile (icloud)";
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      v11 = [(TITypologyProfileOptInManager *)self typologyProfileState];

      if (!v11)
      {
        v12 = +[TITypologyProfileState typologyProfileStateFromPersistedState];
        [(TITypologyProfileOptInManager *)self setTypologyProfileState:v12];
      }
      v13 = [(TITypologyProfileOptInManager *)self typologyProfileState];

      if (!v13)
      {
        v14 = [TITypologyProfileState alloc];
        v15 = [MEMORY[0x1E4F1C9C8] now];
        v16 = [(TITypologyProfileState *)v14 initWithProfileInstallationDate:v15];
        [(TITypologyProfileOptInManager *)self setTypologyProfileState:v16];

        v17 = [(TITypologyProfileOptInManager *)self typologyProfileState];
        [v17 persistState];
      }
      v18 = [(TITypologyProfileOptInManager *)self typologyProfileState];

      if (!v18)
      {
        v8 = TITypologyProfileStateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_ERROR, "Failed to instantiate typology profile state.", buf, 2u);
        }
        goto LABEL_19;
      }
      __int16 v19 = [(TITypologyProfileOptInManager *)self typologyProfileState];
      __int16 v20 = [v19 userResponse];
      int v21 = [v20 isEqualToString:@"Enable"];

      v22 = [(TITypologyProfileOptInManager *)self typologyProfileState];
      v23 = v22;
      if (v21)
      {
        uint64_t v24 = [v22 userNotificationDate];
        uint64_t v25 = [v24 dateByAddingTimeInterval:259200.0];

        id v5 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v26 = [v25 laterDate:v5];

        v27 = TITypologyProfileStateLog();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        LOBYTE(v5) = v26 == v25;
        if (v26 == v25)
        {
          if (v28)
          {
            *(_WORD *)buf = 0;
            v29 = "User opted-in.";
            goto LABEL_44;
          }
        }
        else if (v28)
        {
          *(_WORD *)buf = 0;
          v29 = "User opted-in, but opt-in has expired.";
LABEL_44:
          _os_log_impl(&dword_1E3F0E000, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
        }

        return (char)v5;
      }
      v32 = [v22 userResponse];
      int v33 = [v32 isEqualToString:@"NotNow"];

      v34 = [(TITypologyProfileOptInManager *)self typologyProfileState];
      v35 = v34;
      if (v33)
      {
        v36 = [v34 userNotificationDate];
        v37 = [v36 dateByAddingTimeInterval:600.0];

        v38 = [MEMORY[0x1E4F1C9C8] now];
        v39 = [v37 earlierDate:v38];

        v40 = TITypologyProfileStateLog();
        BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        if (v39 == v37)
        {
          if (v41)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E3F0E000, v40, OS_LOG_TYPE_DEFAULT, "User deferred opt-in. Time to ask again.", buf, 2u);
          }

          [(TITypologyProfileOptInManager *)self _askUserToAllow];
        }
        else
        {
          if (v41)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E3F0E000, v40, OS_LOG_TYPE_DEFAULT, "User deferred opt-in. Not time to ask again.", buf, 2u);
          }
        }
        goto LABEL_20;
      }
      v42 = [v34 userResponse];
      int v43 = [v42 isEqualToString:@"None"];

      if (v43)
      {
        v44 = TITypologyProfileStateLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E3F0E000, v44, OS_LOG_TYPE_DEFAULT, "User has not been asked to opt-in. Asking now.", buf, 2u);
        }

        [(TITypologyProfileOptInManager *)self _askUserToAllow];
        goto LABEL_20;
      }
      v45 = [(TITypologyProfileOptInManager *)self typologyProfileState];
      v46 = [v45 userResponse];
      int v47 = [v46 isEqualToString:@"Disabled"];

      if (v47)
      {
        v8 = TITypologyProfileStateLog();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        v9 = "User opted-out.";
        goto LABEL_18;
      }
    }
    else
    {
      id v5 = [(TITypologyProfileOptInManager *)self typologyProfileState];

      if (!v5) {
        return (char)v5;
      }
      [(TITypologyProfileOptInManager *)self setTypologyProfileState:0];
      +[TITypologyProfileState removePersistedState];
    }
LABEL_20:
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if (v6)
  {
    v30 = [NSString stringWithFormat:@"%s %@", "-[TITypologyProfileOptInManager _isProfileInstalledAndUserEnabled]", @"CustomerTypologyEnabledByDiagnosticExtension is true"];
    *(_DWORD *)buf = 138412290;
    v49 = v30;
    _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  LOBYTE(v5) = 1;
  return (char)v5;
}

- (BOOL)iCloudAccountAvailable
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v2 ubiquityIdentityToken];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)devicePasscodeSet
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (unsigned int (*)(void))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v9 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v5[3] = &unk_1E6E2E248;
    v5[4] = &v6;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v5);
    uint64_t v2 = (unsigned int (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2) {
    return v2(0) != 3;
  }
  dlerror();
  uint64_t v4 = abort_report_np();
  return __getMKBGetDeviceLockStateSymbolLoc_block_invoke(v4);
}

- (BOOL)isTypologyProfileInstalled
{
  if (TIGetTypologyEnabledByProfileValue_onceToken != -1) {
    dispatch_once(&TIGetTypologyEnabledByProfileValue_onceToken, &__block_literal_global_8634);
  }
  uint64_t v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  uint64_t v3 = [v2 valueForPreferenceKey:@"TypologyEnabledByProfile"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

+ (id)localizedStringForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString(&cfstr_Tiassistantset.isa)];
  id v5 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v6 = [v4 localizations];
  v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v8 = [v5 preferredLocalizationsFromArray:v6 forPreferences:v7];

  if (![v8 count]) {
    goto LABEL_3;
  }
  v9 = [v8 objectAtIndexedSubscript:0];
  v10 = [v4 pathForResource:@"TypologyProfileOptIn" ofType:@"strings" inDirectory:0 forLocalization:v9];

  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v10];
  v12 = [v11 objectForKey:v3];

  if (!v12)
  {
LABEL_3:
    v12 = [v4 localizedStringForKey:v3 value:&stru_1F3F7A998 table:@"TypologyProfileOptIn"];
  }

  return v12;
}

@end