@interface TLVibrationManager
+ (TLVibrationManager)sharedVibrationManager;
+ (void)_handleVibrateOnRingOrSilentDidChangeNotification;
+ (void)_handleVibrationPreferencesDidChangeNotificationForPreferencesKinds:(unint64_t)a3 atInitiativeOfVibrationManager:(id)a4;
- (BOOL)_BOOLeanPreferenceForKey:(__CFString *)a3 defaultValue:(BOOL)a4;
- (BOOL)_areSynchronizedVibrationsAllowedForAlertType:(int64_t)a3 topic:(id)a4;
- (BOOL)_isUnitTestingModeEnabled;
- (BOOL)_migrateLegacySettings;
- (BOOL)_removeAllUserGeneratedVibrationPatternsUsingServiceWithError:(id *)a3;
- (BOOL)_removeAllUserGeneratedVibrationsWithError:(id *)a3;
- (BOOL)_saveUserGeneratedVibrationPatterns:(id)a3 error:(id *)a4;
- (BOOL)_setUserGeneratedVibrationPatternsUsingService:(id)a3 error:(id *)a4;
- (BOOL)_vibrationIsSettableForAlertType:(int64_t)a3;
- (BOOL)allowsAutoRefresh;
- (BOOL)deleteUserGeneratedVibrationPatternWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)hasSpecificDefaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (BOOL)needsRefresh;
- (BOOL)refresh;
- (BOOL)setName:(id)a3 forUserGeneratedVibrationWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)shouldVibrateForCurrentRingerSwitchState;
- (BOOL)shouldVibrateOnRing;
- (BOOL)shouldVibrateOnSilent;
- (BOOL)vibrationWithIdentifierIsValid:(id)a3;
- (TLVibrationManager)init;
- (id)_completeSystemVibrationsSubdirectoryForSubdirectory:(id)a3;
- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:(BOOL)a5;
- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5;
- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5 allowsNoneDefaultToAnyActualVibrationSubstitution:(BOOL)a6;
- (id)_currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4;
- (id)_defaultPreferablyNonSilentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5;
- (id)_defaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5;
- (id)_initWithSpecialBehaviors:(unint64_t)a3;
- (id)_localizedNameForVibrationWithIdentifier:(id)a3;
- (id)_nameOfVibrationWithIdentifier:(id)a3;
- (id)_newServiceConnection;
- (id)_patternForSystemVibrationWithIdentifier:(id)a3 correspondingToneIdentifier:(id)a4 targetDevice:(int64_t)a5 shouldLogAssetPath:(BOOL)a6;
- (id)_retrieveUserGeneratedVibrationPatternsUsingService;
- (id)_sanitizeVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5 targetDevice:(int64_t)a6 correspondingToneIdentifier:(id)a7 didFallbackToCurrentVibrationIdentifier:(BOOL *)a8;
- (id)_sanitizeVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5 targetDevice:(int64_t)a6 correspondingToneIdentifier:(id)a7 useDefaultVibrationAsFallback:(BOOL)a8 allowsNoneDefaultToAnyActualVibrationSubstitution:(BOOL)a9 didFallback:(BOOL *)a10;
- (id)_synchronizedVibrationIdentifierForToneIdentifier:(id)a3 targetDevice:(int64_t)a4;
- (id)_systemVibrationIdentifiersForSubdirectory:(id)a3;
- (id)_systemWideVibrationPatternPreferenceKeyForAlertType:(int64_t)a3;
- (id)_userGeneratedVibrationPatterns;
- (id)addUserGeneratedVibrationPattern:(id)a3 name:(id)a4 error:(id *)a5;
- (id)allUserGeneratedVibrationIdentifiers;
- (id)allUserSelectableSystemVibrationIdentifiers;
- (id)currentVibrationIdentifierForAlertType:(int64_t)a3;
- (id)currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)currentVibrationNameForAlertType:(int64_t)a3;
- (id)currentVibrationPatternForAlertType:(int64_t)a3;
- (id)defaultVibrationIdentifierForAlertType:(int64_t)a3;
- (id)defaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4;
- (id)defaultVibrationNameForAlertType:(int64_t)a3;
- (id)defaultVibrationPatternForAlertType:(int64_t)a3;
- (id)nameOfVibrationWithIdentifier:(id)a3;
- (id)noneVibrationName;
- (id)noneVibrationPattern;
- (id)patternForVibrationWithIdentifier:(id)a3;
- (id)patternForVibrationWithIdentifier:(id)a3 repeating:(BOOL)a4;
- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3;
- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4;
- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchAlertPolicy:(BOOL *)a5;
- (unint64_t)_numberOfUserGeneratedVibrations;
- (unint64_t)_storedSystemVibrationDataMigrationVersion;
- (void)_didChangeUserGeneratedVibrationPatterns;
- (void)_didSetVibrationPreferenceSuccessfullyWithKey:(id)a3 inDomain:(id)a4 usingPreferencesOfKind:(unint64_t)a5;
- (void)_handleUserGeneratedVibrationsDidChangeNotification;
- (void)_makeSystemVibrationDataMigrationVersionCurrentIfNecessary;
- (void)_performBlockInAccessQueue:(id)a3;
- (void)_setCurrentVibrationWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4;
- (void)_setCurrentVibrationWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4 topic:(id)a5;
- (void)dealloc;
- (void)setAllowsAutoRefresh:(BOOL)a3;
- (void)setCurrentVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4;
- (void)setCurrentVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5;
@end

@implementation TLVibrationManager

+ (TLVibrationManager)sharedVibrationManager
{
  if (sharedVibrationManager__TLVibrationManagerSharedInstanceOnceToken != -1) {
    dispatch_once(&sharedVibrationManager__TLVibrationManagerSharedInstanceOnceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedVibrationManager__TLVibrationManagerSharedInstance;

  return (TLVibrationManager *)v2;
}

uint64_t __44__TLVibrationManager_sharedVibrationManager__block_invoke()
{
  sharedVibrationManager__TLVibrationManagerSharedInstance = [[TLVibrationManager alloc] _initWithSpecialBehaviors:1];

  return MEMORY[0x1F41817F8]();
}

- (TLVibrationManager)init
{
  return (TLVibrationManager *)[(TLVibrationManager *)self _initWithSpecialBehaviors:0];
}

- (id)_initWithSpecialBehaviors:(unint64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)TLVibrationManager;
  v4 = [(TLVibrationManager *)&v20 init];
  if (v4)
  {
    v5 = [[TLAccessQueue alloc] initWithLabel:@"_TLVibrationManagerAccessQueue" appendUUIDToLabel:1];
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:@"Chord" forKey:@"texttone:Calendar Alert"];
    [v7 setObject:@"Ding" forKey:@"texttone:New Mail"];
    [v7 setObject:@"Pulse" forKey:@"texttone:Air Drop Invitation"];
    [v7 setObject:@"Swish" forKey:@"texttone:Sharing Post"];
    [v7 setObject:@"Swoosh" forKey:@"texttone:Sent Mail"];
    [v7 setObject:@"Tweet" forKey:@"texttone:Sent Tweet"];
    v8 = +[TLCapabilitiesManager sharedCapabilitiesManager];
    int v9 = [v8 wantsModernDefaultRingtone];

    if (v9) {
      [v7 setObject:@"Reflection" forKey:@"<default>"];
    }
    v10 = [v7 objectForKey:@"<default>"];

    if (!v10) {
      [v7 setObject:@"Opening" forKey:@"<default>"];
    }
    uint64_t v11 = [v7 copy];
    synchronizedVibrationPatternFromToneIdentifierMapping = v4->_synchronizedVibrationPatternFromToneIdentifierMapping;
    v4->_synchronizedVibrationPatternFromToneIdentifierMapping = (NSDictionary *)v11;

    v4->_specialBehaviors = a3;
    v4->_allowsAutoRefresh = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if ((a3 & 2) != 0) {
      DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
    }
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)_TLVibrationManagerHandleUserGeneratedVibrationsDidChangeNotification, @"TLVibrationManagerUserGeneratedVibrationsDidChange", 0, (CFNotificationSuspensionBehavior)1026);
    id v14 = (id)objc_opt_class();
    objc_sync_enter(v14);
    uint64_t v15 = _TLVibrationManagerInstancesCount;
    if (!_TLVibrationManagerInstancesCount)
    {
      v16 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v16, v14, (CFNotificationCallback)_TLVibrationManagerHandleVibrationPreferencesDidChangeNotification, @"_TLVibrationPreferencesDidChangeNotification", 0, (CFNotificationSuspensionBehavior)1026);
      [v14 _handleVibrationPreferencesDidChangeNotificationForPreferencesKinds:3 atInitiativeOfVibrationManager:0];
      v17 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v17, v14, (CFNotificationCallback)_TLVibrationManagerHandleVibrateOnRingOrSilentDidChangeNotification, @"com.apple.springboard.ring-vibrate.changed", 0, (CFNotificationSuspensionBehavior)1026);
      v18 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v18, v14, (CFNotificationCallback)_TLVibrationManagerHandleVibrateOnRingOrSilentDidChangeNotification, @"com.apple.springboard.silent-vibrate.changed", 0, (CFNotificationSuspensionBehavior)1026);
      uint64_t v15 = _TLVibrationManagerInstancesCount;
    }
    _TLVibrationManagerInstancesCount = v15 + 1;
    objc_sync_exit(v14);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DB936000, v0, OS_LOG_TYPE_ERROR, "Found no living vibration managers while deallocating %p.", v1, 0xCu);
}

void __29__TLVibrationManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = 0;
}

- (void)setAllowsAutoRefresh:(BOOL)a3
{
  if (self->_specialBehaviors)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3A8];
    uint64_t v8 = NSStringFromSelector(a2);
    [v6 raise:v7, @"*** -[%@ %@] Attempted to mutate the shared vibration manager: %@. Create your own instance of %@ manually if you need to mutate it.", v9, v8, self, v9 format];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__TLVibrationManager_setAllowsAutoRefresh___block_invoke;
    v10[3] = &unk_1E6C210A0;
    v10[4] = self;
    BOOL v11 = a3;
    [(TLVibrationManager *)self _performBlockInAccessQueue:v10];
  }
}

unsigned char *__43__TLVibrationManager_setAllowsAutoRefresh___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[65] != *(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 40))
    {
      char v3 = 1;
    }
    else
    {
      char v3 = result[64];
      if (v3)
      {
        [result refresh];
        char v3 = *(unsigned char *)(a1 + 40);
        result = *(unsigned char **)(a1 + 32);
      }
    }
    result[65] = v3;
  }
  return result;
}

- (BOOL)refresh
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__TLVibrationManager_refresh__block_invoke;
  v4[3] = &unk_1E6C20E78;
  v4[4] = self;
  v4[5] = &v5;
  [(TLVibrationManager *)self _performBlockInAccessQueue:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__TLVibrationManager_refresh__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 40))
  {
    char v3 = *(unsigned char *)(v1 + 65);
    *(unsigned char *)(v1 + 65) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
    uint64_t v4 = [*(id *)(a1 + 32) _userGeneratedVibrationPatterns];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 != 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 65) = v3;
  }
}

- (id)currentVibrationIdentifierForAlertType:(int64_t)a3
{
  return [(TLVibrationManager *)self currentVibrationIdentifierForAlertType:a3 topic:0];
}

- (void)setCurrentVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4
{
}

- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  return [(TLVibrationManager *)self _currentVibrationIdentifierForAlertType:a3 topic:a4 allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:1];
}

- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = TLLogVibrationManagement();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138544130;
    v48 = self;
    __int16 v49 = 2114;
    v50 = v10;
    __int16 v51 = 2114;
    uint64_t v52 = (uint64_t)v8;
    __int16 v53 = 1024;
    *(_DWORD *)v54 = v5;
    _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:(%{BOOL}u).", buf, 0x26u);
  }
  uint64_t v11 = [v8 length];
  v12 = [(TLVibrationManager *)self _systemWideVibrationPatternPreferenceKeyForAlertType:a3];
  v13 = v12;
  if (v12 && v11)
  {
    uint64_t v14 = [(__CFString *)v12 stringByAppendingString:@"PerAccount"];

    v13 = (__CFString *)v14;
  }
  uint64_t v15 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
  v16 = v15;
  if (v13 && v15)
  {
    BOOL v46 = v5;
    v17 = (void *)CFPreferencesCopyValue(v13, v15, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    v18 = TLLogVibrationManagement();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = NSStringFromTLAlertType(a3);
      *(_DWORD *)buf = 138544386;
      v48 = self;
      __int16 v49 = 2114;
      v50 = v19;
      __int16 v51 = 2114;
      uint64_t v52 = (uint64_t)v13;
      __int16 v53 = 2114;
      *(void *)v54 = v16;
      *(_WORD *)&v54[8] = 2114;
      *(void *)&v54[10] = v17;
      _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Read Preferences value for key '%{public}@' from domain '%{public}@': %{public}@.", buf, 0x34u);
    }
    if (!v17)
    {
      int v28 = 0;
      v24 = 0;
LABEL_35:
      BOOL v5 = v46;
      goto LABEL_36;
    }
    if (v11)
    {
      id v20 = [v17 objectForKey:v8];
      v21 = TLLogVibrationManagement();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = 138543874;
        v48 = self;
        __int16 v49 = 2114;
        v50 = v22;
        __int16 v51 = 2114;
        uint64_t v52 = (uint64_t)v20;
        v23 = "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Per-topic: persistedVibrationIdenti"
              "fier = %{public}@.";
LABEL_24:
        _os_log_impl(&dword_1DB936000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x20u);
      }
    }
    else
    {
      id v20 = v17;
      v21 = TLLogVibrationManagement();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = 138543874;
        v48 = self;
        __int16 v49 = 2114;
        v50 = v22;
        __int16 v51 = 2114;
        uint64_t v52 = (uint64_t)v20;
        v23 = "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. persistedVibrationIdentifier = %{public}@.";
        goto LABEL_24;
      }
    }

    v45 = v20;
    if ([v20 length])
    {
      BOOL v44 = [(TLVibrationManager *)self vibrationWithIdentifierIsValid:v20];
      if (v44)
      {
        v24 = [NSString stringWithString:v20];
        v29 = TLLogVibrationManagement();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = NSStringFromTLAlertType(a3);
          *(_DWORD *)buf = 138543874;
          v48 = self;
          __int16 v49 = 2114;
          v50 = v30;
          __int16 v51 = 2114;
          uint64_t v52 = (uint64_t)v24;
          _os_log_impl(&dword_1DB936000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. currentVibrationIdentifier = %{public}@.", buf, 0x20u);
        }
      }
      else
      {
        v29 = TLLogVibrationManagement();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v31 = NSStringFromTLAlertType(a3);
          *(_DWORD *)buf = 138543618;
          v48 = self;
          __int16 v49 = 2114;
          v50 = v31;
          _os_log_impl(&dword_1DB936000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. persistedVibrationIdentifierWasInvalid = YES.", buf, 0x16u);
        }
        v24 = 0;
      }
      int v28 = !v44;
    }
    else
    {
      v24 = 0;
      int v28 = 0;
    }
    CFRelease(v17);

    goto LABEL_35;
  }
  v24 = [(TLVibrationManager *)self _defaultVibrationIdentifierForAlertType:a3 topic:v8 correspondingToneIdentifier:0];
  v25 = TLLogVibrationManagement();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v27 = BOOL v26 = v5;
    *(_DWORD *)buf = 138543874;
    v48 = self;
    __int16 v49 = 2114;
    v50 = v27;
    __int16 v51 = 2114;
    uint64_t v52 = (uint64_t)v24;
    _os_log_impl(&dword_1DB936000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Vibration is not settable for this alert type. Returning corresponding default vibration. currentVibrationIdentifier = %{public}@.", buf, 0x20u);

    BOOL v5 = v26;
  }

  if (!v16)
  {
    if ([v24 length] || !v11) {
      goto LABEL_54;
    }
    int v28 = 0;
    goto LABEL_38;
  }
  int v28 = 0;
LABEL_36:
  CFRelease(v16);
  if ([v24 length] || !v11)
  {
    if (!v28) {
      goto LABEL_54;
    }
    goto LABEL_46;
  }
LABEL_38:
  v32 = v24;
  v24 = [(TLVibrationManager *)self _currentVibrationIdentifierForAlertType:a3 topic:0 allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:0];

  v33 = TLLogVibrationManagement();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138543874;
    v48 = self;
    __int16 v49 = 2114;
    v50 = v34;
    __int16 v51 = 2114;
    uint64_t v52 = (uint64_t)v24;
    _os_log_impl(&dword_1DB936000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Falling back to current vibration without topic. currentVibrationIdentifier = %{public}@.", buf, 0x20u);
  }
  if (v28)
  {
    if ([v24 isEqualToString:@"<none>"])
    {

      v35 = TLLogVibrationManagement();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = 138543874;
        v48 = self;
        __int16 v49 = 2114;
        v50 = v36;
        __int16 v51 = 2114;
        uint64_t v52 = 0;
        _os_log_impl(&dword_1DB936000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid, and fallback value is none. Ignoring fallback value. currentVibrationIdentifier = %{public}@.", buf, 0x20u);
      }
      v24 = 0;
    }
LABEL_46:
    if (![v24 length])
    {
      if (v5)
      {
        uint64_t v37 = [(TLVibrationManager *)self _defaultPreferablyNonSilentVibrationIdentifierForAlertType:a3 topic:v8 correspondingToneIdentifier:0];

        v38 = TLLogVibrationManagement();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = NSStringFromTLAlertType(a3);
          *(_DWORD *)buf = 138543874;
          v48 = self;
          __int16 v49 = 2114;
          v50 = v39;
          __int16 v51 = 2114;
          uint64_t v52 = v37;
          _os_log_impl(&dword_1DB936000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid; falling "
            "back to non-silent default vibration. currentVibrationIdentifier = %{public}@.",
            buf,
            0x20u);
        }
      }
      else
      {
        v38 = TLLogVibrationManagement();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v40 = NSStringFromTLAlertType(a3);
          *(_DWORD *)buf = 138543874;
          v48 = self;
          __int16 v49 = 2114;
          v50 = v40;
          __int16 v51 = 2114;
          uint64_t v52 = (uint64_t)v24;
          _os_log_impl(&dword_1DB936000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid, but falling back to non-silent default vibration is disallowed. currentVibrationIdentifier = %{public}@.", buf, 0x20u);
        }
        uint64_t v37 = (uint64_t)v24;
      }

      v24 = (void *)v37;
    }
  }
LABEL_54:
  v41 = TLLogVibrationManagement();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138544386;
    v48 = self;
    __int16 v49 = 2114;
    v50 = v42;
    __int16 v51 = 2114;
    uint64_t v52 = (uint64_t)v8;
    __int16 v53 = 1024;
    *(_DWORD *)v54 = v5;
    *(_WORD *)&v54[4] = 2114;
    *(void *)&v54[6] = v24;
    _os_log_impl(&dword_1DB936000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) allowsFallbackToDefaultPreferablyNonSilentVibrationForInvalidPersistedValue:(%{BOOL}u). Returning: %{public}@.", buf, 0x30u);
  }

  return v24;
}

- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5
{
  return [(TLVibrationManager *)self _currentVibrationIdentifierForAlertType:a3 topic:a4 correspondingToneIdentifier:a5 allowsNoneDefaultToAnyActualVibrationSubstitution:1];
}

- (id)_currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5 allowsNoneDefaultToAnyActualVibrationSubstitution:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a4;
  id v11 = a5;
  v12 = TLLogVibrationManagement();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138544386;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v13;
    __int16 v41 = 2114;
    v42 = v10;
    __int16 v43 = 2114;
    id v44 = v11;
    __int16 v45 = 1024;
    BOOL v46 = v6;
    _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@) allowsNoneDefaultToAnyActualVibrationSubstitution:(%{BOOL}u).", buf, 0x30u);
  }
  if (+[TLAlert _currentOverridePolicyForType:a3] != 1) {
    goto LABEL_7;
  }
  uint64_t v14 = @"<none>";
  uint64_t v15 = TLLogVibrationManagement();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138543874;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v16;
    __int16 v41 = 2114;
    v42 = v14;
    _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Falling back to none due to alert override policy. vibrationIdentifier = %{public}@.", buf, 0x20u);
  }
  if (!v14)
  {
LABEL_7:
    if (v10)
    {
      if (a3 == 13)
      {
        if ([(__CFString *)v10 isEqualToString:@"TLAlertTopicAlarmGoToSleep"])
        {
          TLLogVibrationManagement();
          uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
          {
LABEL_34:

LABEL_35:
            uint64_t v14 = [(TLVibrationManager *)self _defaultVibrationIdentifierForAlertType:a3 topic:v10 correspondingToneIdentifier:v11];
            v25 = TLLogVibrationManagement();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v26 = NSStringFromTLAlertType(a3);
              *(_DWORD *)buf = 138543874;
              v38 = self;
              __int16 v39 = 2114;
              v40 = v26;
              __int16 v41 = 2114;
              v42 = v14;
              _os_log_impl(&dword_1DB936000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Falling back to default due missing setting in Preferences. vibrationIdentifier = %{public}@.", buf, 0x20u);
            }
            goto LABEL_38;
          }
          v18 = NSStringFromTLAlertType(0xDuLL);
          *(_DWORD *)buf = 138543874;
          v38 = self;
          __int16 v39 = 2114;
          v40 = v18;
          __int16 v41 = 2114;
          v42 = v10;
          _os_log_impl(&dword_1DB936000, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Skipping Preferences lookup for topic %{public}@.", buf, 0x20u);
LABEL_33:

          goto LABEL_34;
        }
      }
      else if (a3 == 2)
      {
        if ([(__CFString *)v10 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHeart"] & 1) != 0|| ([(__CFString *)v10 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsUp"] & 1) != 0|| ([(__CFString *)v10 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsDown"] & 1) != 0|| ([(__CFString *)v10 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHaHa"] & 1) != 0|| ([(__CFString *)v10 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentExclamation"])
        {
          int v17 = 1;
        }
        else
        {
          int v17 = [(__CFString *)v10 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentQuestionMark"];
        }
        goto LABEL_20;
      }
    }
    int v17 = 0;
LABEL_20:
    v19 = [(TLVibrationManager *)self _currentVibrationIdentifierForAlertType:a3 topic:v10];
    id v20 = TLLogVibrationManagement();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromTLAlertType(a3);
      *(_DWORD *)buf = 138543874;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v21;
      __int16 v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_1DB936000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method: vibrationIdentifier = %{public}@.", buf, 0x20u);
    }
    if (v19)
    {
      LOBYTE(v36) = v6;
      uint64_t v14 = [(TLVibrationManager *)self _sanitizeVibrationIdentifier:v19 forAlertType:a3 topic:v10 targetDevice:0 correspondingToneIdentifier:v11 useDefaultVibrationAsFallback:1 allowsNoneDefaultToAnyActualVibrationSubstitution:v36 didFallback:0];

      v22 = TLLogVibrationManagement();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = 138543874;
        v38 = self;
        __int16 v39 = 2114;
        v40 = v23;
        __int16 v41 = 2114;
        v42 = v14;
        _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Sanitized: vibrationIdentifier = %{public}@.", buf, 0x20u);
      }
      if (!v17)
      {
LABEL_29:
        if (v14) {
          goto LABEL_38;
        }
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v14 = 0;
      if (!v17) {
        goto LABEL_29;
      }
    }
    if ([(__CFString *)v14 isEqualToString:@"<none>"]) {
      goto LABEL_29;
    }
    v18 = TLLogVibrationManagement();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v24 = NSStringFromTLAlertType(a3);
      *(_DWORD *)buf = 138543874;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v24;
      __int16 v41 = 2114;
      v42 = @"<none>";
      _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method was not %{public}@; ignoring it.",
        buf,
        0x20u);
    }
    goto LABEL_33;
  }
LABEL_38:
  if (a3 == 18)
  {
    v27 = [(TLVibrationManager *)self currentVibrationIdentifierForAlertType:1 topic:v10];

    v30 = TLLogVibrationManagement();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = NSStringFromTLAlertType(0x12uLL);
      *(_DWORD *)buf = 138543874;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v31;
      __int16 v41 = 2114;
      v42 = (__CFString *)v27;
      _os_log_impl(&dword_1DB936000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Detected alert type for emergency alert. Resolving to current vibration identifier for incoming call: vibrationIdentifier = %{public}@.", buf, 0x20u);
    }
    int v28 = (__CFString *)v27;
    goto LABEL_53;
  }
  if (a3 == 3)
  {
    v27 = [(TLVibrationManager *)self currentVibrationIdentifierForAlertType:2 topic:v10];
    if (![v27 isEqualToString:@"<none>"])
    {
      int v28 = v14;
      goto LABEL_53;
    }
    int v28 = @"<none>";

    v29 = TLLogVibrationManagement();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v32 = NSStringFromTLAlertType(3uLL);
      *(_DWORD *)buf = 138543874;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v32;
      __int16 v41 = 2114;
      v42 = v28;
      _os_log_impl(&dword_1DB936000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Detected alert type for text message in conversation. vibrationIdentifier = %{public}@.", buf, 0x20u);
    }
    goto LABEL_51;
  }
  if (a3 == 2
    && [(__CFString *)v10 isEqualToString:@"TLAlertTopicTextMessageInConversation"]&& ([(__CFString *)v14 isEqualToString:@"<none>"] & 1) == 0)
  {

    v27 = TLLogVibrationManagement();
    int v28 = @"Text-Message-Alert-In-Conversation";
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
LABEL_53:

      uint64_t v14 = v28;
      goto LABEL_54;
    }
    v29 = NSStringFromTLAlertType(2uLL);
    *(_DWORD *)buf = 138543874;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v29;
    __int16 v41 = 2114;
    v42 = @"Text-Message-Alert-In-Conversation";
    _os_log_impl(&dword_1DB936000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) […]: Detected topic for text message in conversation. vibrationIdentifier = %{public}@.", buf, 0x20u);
LABEL_51:

    goto LABEL_53;
  }
LABEL_54:
  v33 = TLLogVibrationManagement();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138544642;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v34;
    __int16 v41 = 2114;
    v42 = v10;
    __int16 v43 = 2114;
    id v44 = v11;
    __int16 v45 = 1024;
    BOOL v46 = v6;
    __int16 v47 = 2114;
    v48 = v14;
    _os_log_impl(&dword_1DB936000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@) allowsNoneDefaultToAnyActualVibrationSubstitution:(%{BOOL}u). Returning: %{public}@.", buf, 0x3Au);
  }

  return v14;
}

- (id)currentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  return [(TLVibrationManager *)self _currentVibrationIdentifierForAlertType:a3 topic:a4 correspondingToneIdentifier:0];
}

- (void)setCurrentVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  id value = a3;
  id v8 = a5;
  uint64_t v9 = [v8 length];
  uint64_t v10 = [(TLVibrationManager *)self _systemWideVibrationPatternPreferenceKeyForAlertType:a4];
  id v11 = v10;
  if (v10 && v9)
  {
    uint64_t v12 = [(__CFString *)v10 stringByAppendingString:@"PerAccount"];

    id v11 = (__CFString *)v12;
  }
  v13 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
  CFStringRef v14 = v13;
  if (v11 && v13)
  {
    CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    if (v9)
    {
      int v17 = (void *)CFPreferencesCopyValue(v11, v13, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
      if (v17)
      {
        v18 = v17;
        id v19 = (id)[v17 mutableCopy];
        CFRelease(v18);
      }
      else if ([value length])
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      else
      {
        id v19 = 0;
      }
      if ([value length])
      {
        [v19 setObject:value forKey:v8];
      }
      else
      {
        [v19 removeObjectForKey:v8];
        if (![v19 count])
        {

          id v19 = 0;
        }
      }
      CFPreferencesSetValue(v11, v19, v14, v15, v16);
    }
    else
    {
      CFPreferencesSetValue(v11, value, v13, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    }
    [(TLVibrationManager *)self _didSetVibrationPreferenceSuccessfullyWithKey:v11 inDomain:+[TLPreferencesUtilities preferencesDomain] usingPreferencesOfKind:1];
    if ((!value || ([value isEqualToString:@"<none>"] & 1) == 0)
      && +[TLAlert _currentOverridePolicyForType:a4] == 1)
    {
      +[TLAlert _setCurrentOverridePolicy:0 forType:a4];
    }
    goto LABEL_24;
  }
  if (v13) {
LABEL_24:
  }
    CFRelease(v14);
}

- (id)currentVibrationNameForAlertType:(int64_t)a3
{
  uint64_t v4 = [(TLVibrationManager *)self currentVibrationIdentifierForAlertType:a3];
  BOOL v5 = [(TLVibrationManager *)self nameOfVibrationWithIdentifier:v4];

  return v5;
}

- (id)currentVibrationPatternForAlertType:(int64_t)a3
{
  BOOL v5 = a3 == 1 || a3 == 28;
  BOOL v6 = -[TLVibrationManager currentVibrationIdentifierForAlertType:](self, "currentVibrationIdentifierForAlertType:");
  uint64_t v7 = [(TLVibrationManager *)self patternForVibrationWithIdentifier:v6 repeating:v5];

  return v7;
}

- (id)defaultVibrationIdentifierForAlertType:(int64_t)a3
{
  return [(TLVibrationManager *)self defaultVibrationIdentifierForAlertType:a3 topic:0];
}

- (id)defaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  return [(TLVibrationManager *)self _defaultVibrationIdentifierForAlertType:a3 topic:a4 correspondingToneIdentifier:0];
}

- (id)_defaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (__CFString *)a5;
  BOOL v10 = [(TLVibrationManager *)self _areSynchronizedVibrationsAllowedForAlertType:a3 topic:v8];
  id v11 = TLLogVibrationManagement();
  uint64_t v12 = &off_1DB982000;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromTLAlertType(a3);
    *(_DWORD *)buf = 138544386;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v13;
    __int16 v41 = 2114;
    id v42 = v8;
    __int16 v43 = 2114;
    id v44 = v9;
    __int16 v45 = 1024;
    LODWORD(v46) = v10;
    _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_defaultVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@). areSynchronizedVibrationsAllowed = %{BOOL}u.", buf, 0x30u);
  }
  if (v10)
  {
    CFStringRef v14 = v9;
    if (![(__CFString *)v9 length])
    {
      CFStringRef v15 = +[TLToneManager sharedToneManager];
      CFStringRef v14 = [v15 currentToneIdentifierForAlertType:a3 topic:v8];
    }
    CFStringRef v16 = [(TLVibrationManager *)self _synchronizedVibrationIdentifierForToneIdentifier:v14 targetDevice:0];
    int v17 = TLLogVibrationManagement();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSStringFromTLAlertType(a3);
      *(_DWORD *)buf = 138544642;
      v38 = self;
      __int16 v39 = 2114;
      v40 = v18;
      __int16 v41 = 2114;
      id v42 = v8;
      __int16 v43 = 2114;
      id v44 = v9;
      __int16 v45 = 2114;
      BOOL v46 = v14;
      __int16 v47 = 2114;
      v48 = v16;
      _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_defaultVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@). resolvedCorrespondingToneIdentifier = \"%{public}@\"; synchronizedVibrationIdentifier = \"%{public}@\".",
        buf,
        0x3Eu);
    }
  }
  else
  {
    CFStringRef v16 = 0;
    CFStringRef v14 = v9;
  }
  uint64_t v19 = [0 length];
  id v20 = 0;
  if (a3 && !v19)
  {
    if ((unint64_t)a3 > 0x1D)
    {
      id v20 = 0;
    }
    else
    {
      id v20 = _TLVibrationManagerDefaultIdentifiers[a3 - 1];
      if (([(__CFString *)v20 isEqualToString:@"Built-In-System-Sound-ID-Vibration"] & 1) == 0
        && ([(__CFString *)v20 isEqualToString:@"Corresponding-Synchronized-Vibration"] & 1) == 0)
      {
        v21 = [(TLVibrationManager *)self _patternForSystemVibrationWithIdentifier:v20 correspondingToneIdentifier:v14 targetDevice:0 shouldLogAssetPath:0];
        if (!v21)
        {
          v35 = [@"UserSelectable" stringByAppendingPathComponent:@"Classic"];
          v22 = [(TLVibrationManager *)self _systemVibrationIdentifiersForSubdirectory:v35];

          uint64_t v36 = v22;
          if ([v22 containsObject:v20])
          {
            uint64_t v12 = &off_1DB982000;
            v23 = v36;
          }
          else
          {
            v24 = *(&_TLVibrationManagerClassicFallbackDefaultIdentifiers + a3 - 1);
            if ([(__CFString *)v24 length])
            {
              v25 = v24;

              id v20 = v25;
            }
            v23 = v36;

            uint64_t v12 = &off_1DB982000;
          }

          v21 = 0;
        }
      }
      if (![(__CFString *)v20 length])
      {
        BOOL v26 = @"<none>";

        id v20 = v26;
      }
    }
  }
  if (![(__CFString *)v20 length])
  {
    v27 = @"<none>";

    id v20 = v27;
  }
  if ([v16 length]
    && ([(__CFString *)v20 isEqualToString:@"<none>"] & 1) == 0)
  {
    int v28 = v16;

    id v20 = v28;
  }
  switch(a3)
  {
    case 1:
      if ([v8 isEqualToString:@"TLAlertTopicIncomingCallFaceTimeGroupInvitation"]) {
        goto LABEL_63;
      }
      v29 = TLAlertTopicIncomingCallFaceTimeParticipantJoined;
      goto LABEL_58;
    case 2:
      if (([v8 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHeart"] & 1) == 0
        && ([v8 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsUp"] & 1) == 0
        && ([v8 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentThumbsDown"] & 1) == 0
        && ([v8 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentHaHa"] & 1) == 0
        && ([v8 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentExclamation"] & 1) == 0
        && ([v8 isEqualToString:@"TLAlertTopicTextMessageAcknowledgmentQuestionMark"] & 1) == 0)
      {
        goto LABEL_65;
      }
      v30 = @"Text-Message-Acknowledgement";
      goto LABEL_64;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 21:
      goto LABEL_65;
    case 5:
      if (([v8 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.VIP"] & 1) == 0
        && ([v8 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.ThreadNotify"] & 1) == 0)
      {
        goto LABEL_65;
      }
      v30 = @"Quick";
      goto LABEL_64;
    case 9:
      if ([v8 isEqualToString:@"TLAlertTopicPhotosNotificationSharingPost"]) {
        goto LABEL_52;
      }
      if (([v8 isEqualToString:@"TLAlertTopicPhotosNotificationMemory"] & 1) == 0) {
        goto LABEL_65;
      }
      v30 = @"PhotosMemoriesNotification";
      goto LABEL_64;
    case 13:
      if ([v8 isEqualToString:@"TLAlertTopicAlarmGoToSleep"]) {
        goto LABEL_63;
      }
      if (([v8 isEqualToString:@"TLAlertTopicAlarmWakeUp"] & 1) == 0) {
        goto LABEL_65;
      }
LABEL_52:
      v30 = @"<none>";
      goto LABEL_64;
    case 16:
      if ([v8 isEqualToString:@"TLAlertTopicSystemNotificationBackgroundMicUsage"])
      {
        v30 = @"Background-Mic-Usage";
        goto LABEL_64;
      }
      if (([v8 isEqualToString:@"TLAlertTopicSystemNotificationElevationAlert"] & 1) == 0)
      {
        v29 = TLAlertTopicSystemNotificationHeadphoneAudioExposure;
LABEL_58:
        if (([v8 isEqualToString:*v29] & 1) == 0) {
          goto LABEL_65;
        }
      }
LABEL_63:
      v30 = @"Built-In-System-Sound-ID-Vibration";
      goto LABEL_64;
    case 17:
      if (([v8 isEqualToString:@"TLAlertTopicAppNotificationCriticalAlert"] & 1) == 0) {
        goto LABEL_65;
      }
      v30 = @"App-Notification-Critical-Alert";
      goto LABEL_64;
    case 20:
      v29 = TLAlertTopicPassbookNFCScanComplete;
      goto LABEL_58;
    case 22:
      if ([v8 isEqualToString:@"TLAlertTopicSOSCountdownTick"])
      {
        v30 = @"SOS-Countdown-Tick";
        goto LABEL_64;
      }
      if ([v8 isEqualToString:@"TLAlertTopicSOSDialStart"])
      {
        v30 = @"SOS-Dial-Start";
        goto LABEL_64;
      }
      if ([v8 isEqualToString:@"TLAlertTopicSOSButtonChordingTimeout"])
      {
        v30 = @"SOS-Button-Chording-Timeout";
        goto LABEL_64;
      }
      if (([v8 isEqualToString:@"TLAlertTopicSOSCountdownPreannounce"] & 1) == 0) {
        goto LABEL_65;
      }
      v30 = @"SOS-Countdown-Preannounce";
      goto LABEL_64;
    default:
      if (a3 != 27) {
        goto LABEL_65;
      }
      if ([v8 isEqualToString:@"TLAlertTopicHandwashingReminder"])
      {
        v30 = @"Handwashing-Reminder";
LABEL_64:

        id v20 = v30;
        goto LABEL_65;
      }
      if ([v8 isEqualToString:@"TLAlertTopicHandwashingSessionStart"])
      {
        v30 = @"Handwashing-Session-Start";
        goto LABEL_64;
      }
      if ([v8 isEqualToString:@"TLAlertTopicHandwashingSessionProgressTapHaptics"])
      {
        v30 = @"Handwashing-Session-Progress-Tap-Haptics";
        goto LABEL_64;
      }
      if ([v8 isEqualToString:@"TLAlertTopicHandwashingSessionProgressVibeHaptics"])
      {
        v30 = @"Handwashing-Session-Progress-Vibe-Haptics";
        goto LABEL_64;
      }
      if ([v8 isEqualToString:@"TLAlertTopicHandwashingSessionEnd"])
      {
        v30 = @"Handwashing-Session-End";
        goto LABEL_64;
      }
LABEL_65:
      v31 = TLLogVibrationManagement();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = NSStringFromTLAlertType(a3);
        *(_DWORD *)buf = *((void *)v12 + 227);
        v38 = self;
        __int16 v39 = 2114;
        v40 = v32;
        __int16 v41 = 2114;
        id v42 = v8;
        __int16 v43 = 2114;
        id v44 = v9;
        __int16 v45 = 2114;
        BOOL v46 = v20;
        _os_log_impl(&dword_1DB936000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: -_defaultVibrationIdentifierForAlertType:(%{public}@) topic:(%{public}@) correspondingToneIdentifier:(%{public}@). Returning: %{public}@.", buf, 0x34u);
      }
      v33 = v20;

      return v33;
  }
}

- (id)defaultVibrationNameForAlertType:(int64_t)a3
{
  uint64_t v4 = [(TLVibrationManager *)self defaultVibrationIdentifierForAlertType:a3];
  BOOL v5 = [(TLVibrationManager *)self nameOfVibrationWithIdentifier:v4];

  return v5;
}

- (id)defaultVibrationPatternForAlertType:(int64_t)a3
{
  uint64_t v4 = [(TLVibrationManager *)self defaultVibrationIdentifierForAlertType:a3];
  BOOL v5 = [(TLVibrationManager *)self _patternForSystemVibrationWithIdentifier:v4 correspondingToneIdentifier:0 targetDevice:0 shouldLogAssetPath:1];

  return v5;
}

- (id)_defaultPreferablyNonSilentVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4 correspondingToneIdentifier:(id)a5
{
  uint64_t v7 = [(TLVibrationManager *)self _defaultVibrationIdentifierForAlertType:a3 topic:a4 correspondingToneIdentifier:a5];
  int v8 = [v7 isEqualToString:@"<none>"];
  if (a3 == 5 && v8)
  {
    uint64_t v9 = [(TLVibrationManager *)self defaultVibrationIdentifierForAlertType:5 topic:@"com.apple.mobilemail.bulletin-subsection.VIP"];

    uint64_t v7 = (void *)v9;
  }

  return v7;
}

- (BOOL)hasSpecificDefaultVibrationIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6 = a4;
  if ([v6 length])
  {
    uint64_t v7 = [(TLVibrationManager *)self defaultVibrationIdentifierForAlertType:a3];
    int v8 = [(TLVibrationManager *)self defaultVibrationIdentifierForAlertType:a3 topic:v6];
    if ([v8 isEqualToString:v7])
    {
      LOBYTE(v9) = 0;
    }
    else if ([v7 hasPrefix:@"synchronizedvibration:"])
    {
      int v9 = [v8 hasPrefix:@"synchronizedvibration:"] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)noneVibrationName
{
  return [(TLVibrationManager *)self nameOfVibrationWithIdentifier:@"<none>"];
}

- (id)noneVibrationPattern
{
  char v2 = +[TLVibrationPattern noneVibrationPattern];
  char v3 = [v2 propertyListRepresentation];

  return v3;
}

- (BOOL)_isUnitTestingModeEnabled
{
  return (LOBYTE(self->_specialBehaviors) >> 1) & 1;
}

- (id)_completeSystemVibrationsSubdirectoryForSubdirectory:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  CFStringRef v14 = __Block_byref_object_copy__1;
  CFStringRef v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__TLVibrationManager__completeSystemVibrationsSubdirectoryForSubdirectory___block_invoke;
  v8[3] = &unk_1E6C20D88;
  BOOL v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(TLVibrationManager *)self _performBlockInAccessQueue:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __75__TLVibrationManager__completeSystemVibrationsSubdirectoryForSubdirectory___block_invoke(void *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v5 = [@"Vibrations" stringByAppendingPathComponent:a1[5]];
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = +[TLCapabilitiesManager sharedCapabilitiesManager];
    int v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = [v8 resourcePath];

    BOOL v10 = [v7 deviceCodeName];
    uint64_t v11 = v10;
    if (!*(void *)(*(void *)(a1[6] + 8) + 40) && [v10 length])
    {
      uint64_t v12 = [v5 stringByAppendingPathComponent:v11];
      LOBYTE(v36) = 0;
      uint64_t v13 = [v9 stringByAppendingPathComponent:v12];
      int v14 = [v6 fileExistsAtPath:v13 isDirectory:&v36];

      if (v14 && (_BYTE)v36)
      {
        uint64_t v15 = [v12 copy];
        uint64_t v16 = *(void *)(a1[6] + 8);
        int v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
    }
    uint64_t v18 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (v18) {
      goto LABEL_17;
    }
    uint64_t v19 = [v7 simplifiedDeviceCodeName];
    if ([v19 length] && (objc_msgSend(v11, "isEqualToString:", v19) & 1) == 0)
    {
      id v20 = [v5 stringByAppendingPathComponent:v19];
      LOBYTE(v36) = 0;
      v21 = [v9 stringByAppendingPathComponent:v20];
      int v22 = [v6 fileExistsAtPath:v21 isDirectory:&v36];

      if (v22 && (_BYTE)v36)
      {
        uint64_t v23 = [v20 copy];
        uint64_t v24 = *(void *)(a1[6] + 8);
        v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;
      }
    }

    uint64_t v18 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (v18
      || (uint64_t v26 = [v5 copy],
          uint64_t v27 = *(void *)(a1[6] + 8),
          int v28 = *(void **)(v27 + 40),
          *(void *)(v27 + 40) = v26,
          v28,
          (uint64_t v18 = *(void *)(*(void *)(a1[6] + 8) + 40)) != 0))
    {
LABEL_17:
      v29 = *(void **)(a1[4] + 32);
      if (!v29)
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v31 = a1[4];
        v32 = *(void **)(v31 + 32);
        *(void *)(v31 + 32) = v30;

        v29 = *(void **)(a1[4] + 32);
        uint64_t v18 = *(void *)(*(void *)(a1[6] + 8) + 40);
      }
      [v29 setObject:v18 forKey:a1[5]];
      v33 = TLLogVibrationManagement();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = a1[5];
        v35 = [v9 stringByAppendingPathComponent:*(void *)(*(void *)(a1[6] + 8) + 40)];
        int v36 = 138543618;
        uint64_t v37 = v34;
        __int16 v38 = 2114;
        __int16 v39 = v35;
        _os_log_impl(&dword_1DB936000, v33, OS_LOG_TYPE_DEFAULT, "Looking up system vibrations for subdirectory %{public}@ at absolute path: %{public}@.", (uint8_t *)&v36, 0x16u);
      }
    }
  }
}

- (id)_systemVibrationIdentifiersForSubdirectory:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__TLVibrationManager__systemVibrationIdentifiersForSubdirectory___block_invoke;
  v8[3] = &unk_1E6C20D88;
  BOOL v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(TLVibrationManager *)self _performBlockInAccessQueue:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __65__TLVibrationManager__systemVibrationIdentifiersForSubdirectory___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [*(id *)(a1 + 32) _completeSystemVibrationsSubdirectoryForSubdirectory:*(void *)(a1 + 40)];
    uint64_t v7 = [v5 pathsForResourcesOfType:@"plist" inDirectory:v6];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v22 = v5;
      id v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) lastPathComponent];
          int v14 = [v13 stringByDeletingPathExtension];

          if ([v14 length])
          {
            if (!v10) {
              id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [v10 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
      if (v10)
      {
        uint64_t v15 = [v10 copy];
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        int v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 24);
        id v5 = v22;
        if (!v18)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v20 = *(void *)(a1 + 32);
          v21 = *(void **)(v20 + 24);
          *(void *)(v20 + 24) = v19;

          uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 24);
        }
        [v18 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
      }
      else
      {
        id v5 = v22;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
}

- (id)_patternForSystemVibrationWithIdentifier:(id)a3 correspondingToneIdentifier:(id)a4 targetDevice:(int64_t)a5 shouldLogAssetPath:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (![v10 isEqualToString:@"<none>"])
  {
    int v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    __int16 v38 = __123__TLVibrationManager__patternForSystemVibrationWithIdentifier_correspondingToneIdentifier_targetDevice_shouldLogAssetPath___block_invoke;
    __int16 v39 = &unk_1E6C218F8;
    uint64_t v13 = v14;
    uint64_t v40 = v13;
    __int16 v41 = self;
    BOOL v43 = v6;
    id v15 = v10;
    id v42 = v15;
    uint64_t v16 = (void (**)(void, void, void))MEMORY[0x1E0195470](&v36);
    int v17 = +[TLCapabilitiesManager sharedCapabilitiesManager];
    int v18 = [v17 hasSynchronizedVibrationsCapability];

    if (!v18) {
      goto LABEL_21;
    }
    if (![v15 hasPrefix:@"synchronizedvibration:"]) {
      goto LABEL_36;
    }
    id v19 = [v15 substringFromIndex:objc_msgSend(@"synchronizedvibration:", "length")];
    uint64_t v20 = [v19 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

    uint64_t v21 = ((void (**)(void, void *, __CFString *))v16)[2](v16, v20, @"Synchronized");
    uint64_t v12 = (void *)v21;
    if (a5 == 1 && !v21)
    {
      int v22 = TLLogVibrationManagement();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = _TLAlertTargetDeviceGetHumanReadableDescription(1uLL);
        *(_DWORD *)buf = 138543618;
        id v45 = v15;
        __int16 v46 = 2114;
        __int16 v47 = v23;
        _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "Making assumption that \"%{public}@\" is a valid synchronized vibration for target device: %{public}@.", buf, 0x16u);
      }
      long long v24 = +[TLVibrationPattern simpleVibrationPatternWithVibrationDuration:0.1 pauseDuration:0.1];
      uint64_t v12 = [v24 propertyListRepresentation];
    }
    if (_os_feature_enabled_impl())
    {
      if (v12)
      {
LABEL_26:

        goto LABEL_27;
      }
      long long v25 = [v20 stringByAppendingString:@"-EncoreInfinitum"];

      uint64_t v26 = ((void (**)(void, void *, __CFString *))v16)[2](v16, v25, @"Synchronized");
      uint64_t v12 = (void *)v26;
      if (v11 && !v26)
      {
        uint64_t v27 = +[TLToneManager sharedToneManager];
        uint64_t v28 = [v27 filePathForToneIdentifier:v11];

        v29 = [v28 lastPathComponent];
        int v30 = [v29 containsString:@"-EncoreInfinitum"];

        if (v30)
        {
          uint64_t v31 = +[TLVibrationPattern simpleVibrationPatternWithVibrationDuration:0.1 pauseDuration:0.1];
          uint64_t v12 = [v31 propertyListRepresentation];
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
    }
    else
    {
      long long v25 = v20;
    }

    if (!v12)
    {
LABEL_36:
      v32 = [@"UserSelectable" stringByAppendingPathComponent:@"Modern"];
      uint64_t v12 = ((void (**)(void, id, void *))v16)[2](v16, v15, v32);

      if (!v12)
      {
LABEL_21:
        v33 = [@"UserSelectable" stringByAppendingPathComponent:@"Classic"];
        uint64_t v12 = ((void (**)(void, id, void *))v16)[2](v16, v15, v33);

        if (!v12)
        {
          if (v18) {
            uint64_t v34 = @"Modern";
          }
          else {
            uint64_t v34 = @"Classic";
          }
          uint64_t v20 = [@"Other" stringByAppendingPathComponent:v34];
          uint64_t v12 = ((void (**)(void, id, void *))v16)[2](v16, v15, v20);
          goto LABEL_26;
        }
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v12 = [(TLVibrationManager *)self noneVibrationPattern];
  if (!v6) {
    goto LABEL_29;
  }
  uint64_t v13 = TLLogVibrationManagement();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v45 = v10;
    _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "Using \"none\" vibration pattern for vibration identifier \"%{public}@\"", buf, 0xCu);
  }
LABEL_28:

LABEL_29:

  return v12;
}

id __123__TLVibrationManager__patternForSystemVibrationWithIdentifier_correspondingToneIdentifier_targetDevice_shouldLogAssetPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  id v7 = a2;
  uint64_t v8 = [v6 _completeSystemVibrationsSubdirectoryForSubdirectory:a3];
  uint64_t v9 = [v5 URLForResource:v7 withExtension:@"plist" subdirectory:v8];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v9];
    if (v10 && *(unsigned char *)(a1 + 56))
    {
      id v11 = TLLogVibrationManagement();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v13 = [v9 path];
        int v15 = 138543618;
        uint64_t v16 = v12;
        __int16 v17 = 2114;
        int v18 = v13;
        _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "Vibration pattern for identifier \"%{public}@\" found at path: %{public}@.", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_localizedNameForVibrationWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"<none>"])
  {
    id v4 = @"VIBRATION_PICKER_NONE";
  }
  else if ([v3 hasPrefix:@"synchronizedvibration:"])
  {
    id v4 = @"SYNCHRONIZED_VIBRATION_NAME";
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"%@%@", @"vibration:", v3];
  }
  id v5 = TLLocalizedString(v4);
  if ([v5 isEqualToString:v4])
  {

    id v5 = 0;
  }

  return v5;
}

- (id)_nameOfVibrationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__TLVibrationManager__nameOfVibrationWithIdentifier___block_invoke;
  v8[3] = &unk_1E6C20EA0;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  id v11 = &v12;
  [(TLVibrationManager *)self _performBlockInAccessQueue:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

void __53__TLVibrationManager__nameOfVibrationWithIdentifier___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasPrefix:@"usergeneratedvibration:"];
  id v3 = *(void **)(a1 + 40);
  if (!v2)
  {
    id v5 = [v3 _localizedNameForVibrationWithIdentifier:*(void *)(a1 + 32)];
    uint64_t v11 = [v5 copy];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
    goto LABEL_5;
  }
  id v4 = [v3 _userGeneratedVibrationPatterns];
  id v5 = [v4 objectForKey:*(void *)(a1 + 32)];

  id v6 = [v5 objectForKey:@"Pattern"];

  if (v6)
  {
    id v7 = [v5 objectForKey:@"Name"];
    uint64_t v8 = [v7 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

LABEL_5:
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if ([*(id *)(a1 + 32) length])
    {
      uint64_t v13 = [*(id *)(a1 + 40) patternForVibrationWithIdentifier:*(void *)(a1 + 32)];

      if (v13)
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) copy];
        MEMORY[0x1F41817F8]();
      }
    }
  }
}

- (id)nameOfVibrationWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(TLVibrationManager *)self _nameOfVibrationWithIdentifier:v4];
    if (!v5)
    {
      id v5 = TLLocalizedString(@"VIBRATION_UNKNOWN_NAME");
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)patternForVibrationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__TLVibrationManager_patternForVibrationWithIdentifier___block_invoke;
  v8[3] = &unk_1E6C21920;
  id v5 = v4;
  id v10 = self;
  uint64_t v11 = &v12;
  id v9 = v5;
  [(TLVibrationManager *)self _performBlockInAccessQueue:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

uint64_t __56__TLVibrationManager_patternForVibrationWithIdentifier___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasPrefix:@"usergeneratedvibration:"];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 _userGeneratedVibrationPatterns];
    id v4 = [(id)objc_claimAutoreleasedReturnValue() objectForKey:*(void *)(a1 + 32)];
    uint64_t v5 = [v4 objectForKey:@"Pattern"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [v3 _patternForSystemVibrationWithIdentifier:*(void *)(a1 + 32) correspondingToneIdentifier:0 targetDevice:0 shouldLogAssetPath:1];
  }

  return MEMORY[0x1F41817F8]();
}

- (id)patternForVibrationWithIdentifier:(id)a3 repeating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TLVibrationManager *)self patternForVibrationWithIdentifier:v6];
  if (v4 && ([v6 isEqualToString:@"<none>"] & 1) == 0)
  {
    uint64_t v8 = [[TLVibrationPattern alloc] initWithPropertyListRepresentation:v7];
    uint64_t v9 = [(TLVibrationPattern *)v8 _artificiallyRepeatingPropertyListRepresentation];

    id v7 = (void *)v9;
  }

  return v7;
}

- (id)allUserSelectableSystemVibrationIdentifiers
{
  id v3 = [@"UserSelectable" stringByAppendingPathComponent:@"Classic"];
  BOOL v4 = [(TLVibrationManager *)self _systemVibrationIdentifiersForSubdirectory:v3];
  uint64_t v5 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  int v6 = [v5 hasSynchronizedVibrationsCapability];

  if (v6)
  {
    id v7 = [@"UserSelectable" stringByAppendingPathComponent:@"Modern"];
    uint64_t v8 = [(TLVibrationManager *)self _systemVibrationIdentifiersForSubdirectory:v7];
    if (v8)
    {
      uint64_t v9 = [v4 setByAddingObjectsFromSet:v8];

      BOOL v4 = (void *)v9;
    }
  }
  id v10 = [v4 allObjects];

  return v10;
}

- (id)allUserGeneratedVibrationIdentifiers
{
  int v2 = [(TLVibrationManager *)self _userGeneratedVibrationPatterns];
  id v3 = [v2 allKeys];

  return v3;
}

- (BOOL)vibrationWithIdentifierIsValid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [(TLVibrationManager *)self _nameOfVibrationWithIdentifier:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_systemWideVibrationPatternPreferenceKeyForAlertType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x1C)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = _TLVibrationManagerSystemWideVibrationPatternPreferenceKeys[a3 - 1];
  }
  return v4;
}

- (BOOL)_vibrationIsSettableForAlertType:(int64_t)a3
{
  uint64_t v3 = [(TLVibrationManager *)self _systemWideVibrationPatternPreferenceKeyForAlertType:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)_handleVibrationPreferencesDidChangeNotificationForPreferencesKinds:(unint64_t)a3 atInitiativeOfVibrationManager:(id)a4
{
  char v4 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (_TLVibrationManagerShouldIgnoreNextVibrationPreferencesDidChangeNotification == 1)
  {
    _TLVibrationManagerShouldIgnoreNextVibrationPreferencesDidChangeNotification = 0;
    id v7 = TLLogVibrationManagement();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = a1;
      _os_log_impl(&dword_1DB936000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Ignoring notification.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = TLLogVibrationManagement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = a1;
      _os_log_impl(&dword_1DB936000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…", buf, 0xCu);
    }

    if (v4)
    {
      uint64_t v9 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
      id v10 = v9;
      if (v9)
      {
        CFPreferencesSynchronize(v9, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
        uint64_t v11 = TLLogVibrationManagement();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_1DB936000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Synchronized CFPreferences domain %{public}@.", buf, 0x16u);
        }

        CFRelease(v10);
      }
    }
    if ((v4 & 2) != 0)
    {
      if (+[TLPreferencesUtilities canAccessNanoRegistry]&& (NPSDomainAccessorClass_0 = (objc_class *)getNPSDomainAccessorClass_0()) != 0)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v36 = __Block_byref_object_copy__1;
        uint64_t v37 = __Block_byref_object_dispose__1;
        id v38 = 0;
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        uint64_t v27 = __121__TLVibrationManager__handleVibrationPreferencesDidChangeNotificationForPreferencesKinds_atInitiativeOfVibrationManager___block_invoke;
        uint64_t v28 = &unk_1E6C20D10;
        int v30 = buf;
        id v29 = v6;
        [v29 _performBlockInAccessQueue:&v25];
        uint64_t v13 = *(void **)(*(void *)&buf[8] + 40);
        if (!v13)
        {
          id v14 = [NPSDomainAccessorClass_0 alloc];
          int v15 = +[TLPreferencesUtilities perWatchPreferencesDomain];
          uint64_t v16 = [v14 initWithDomain:v15];
          id v17 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v16;

          int v18 = TLLogVibrationManagement();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v31 = 138543618;
            id v32 = a1;
            __int16 v33 = 2114;
            uint64_t v34 = v19;
            _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Instantiated domain accessor %{public}@.", v31, 0x16u);
          }

          uint64_t v13 = *(void **)(*(void *)&buf[8] + 40);
        }
        id v20 = (id)objc_msgSend(v13, "synchronize", v25, v26, v27, v28);
        uint64_t v21 = TLLogVibrationManagement();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)uint64_t v31 = 138543618;
          id v32 = a1;
          __int16 v33 = 2114;
          uint64_t v34 = v22;
          _os_log_impl(&dword_1DB936000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Synchronized domain accessor %{public}@.", v31, 0x16u);
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        long long v23 = TLLogVibrationManagement();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v24 = +[TLPreferencesUtilities canAccessNanoRegistry];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v24;
          _os_log_impl(&dword_1DB936000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleVibrationPreferencesDidChangeNotification…: Skipping synchronizing the domain accessor. canAccessNanoRegistry = %{BOOL}u.", buf, 0x12u);
        }
      }
    }
    id v7 = dispatch_get_global_queue(0, 0);
    dispatch_async(v7, &__block_literal_global_246);
  }
}

void __121__TLVibrationManager__handleVibrationPreferencesDidChangeNotificationForPreferencesKinds_atInitiativeOfVibrationManager___block_invoke(uint64_t a1)
{
}

void __121__TLVibrationManager__handleVibrationPreferencesDidChangeNotificationForPreferencesKinds_atInitiativeOfVibrationManager___block_invoke_244()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"TLVibrationPreferencesDidChangeNotification" object:0];
}

+ (void)_handleVibrateOnRingOrSilentDidChangeNotification
{
  int v2 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
  if (v2)
  {
    uint64_t v3 = v2;
    CFPreferencesSynchronize(v2, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFRelease(v3);
  }
}

- (void)_didSetVibrationPreferenceSuccessfullyWithKey:(id)a3 inDomain:(id)a4 usingPreferencesOfKind:(unint64_t)a5
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = TLLogVibrationManagement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    BOOL v24 = v9;
    _os_log_impl(&dword_1DB936000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetVibrationPreferenceSuccessfullyWithKey:(%{public}@) inDomain:(%{public}@)…", buf, 0x20u);
  }

  [(id)objc_opt_class() _handleVibrationPreferencesDidChangeNotificationForPreferencesKinds:a5 atInitiativeOfVibrationManager:self];
  _TLVibrationManagerShouldIgnoreNextVibrationPreferencesDidChangeNotification = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"_TLVibrationPreferencesDidChangeNotification", 0, 0, 1u);
  if (a5)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2050000000;
    uint64_t v12 = (void *)getNPSManagerClass_softClass_0;
    uint64_t v22 = getNPSManagerClass_softClass_0;
    if (!getNPSManagerClass_softClass_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getNPSManagerClass_block_invoke_0;
      BOOL v24 = &unk_1E6C210C8;
      v25[0] = &v19;
      __getNPSManagerClass_block_invoke_0((uint64_t)buf);
      uint64_t v12 = (void *)v20[3];
    }
    uint64_t v13 = v12;
    _Block_object_dispose(&v19, 8);
    if (v13)
    {
      id v14 = objc_alloc_init(v13);
      int v15 = TLLogVibrationManagement();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_1DB936000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetVibrationPreferenceSuccessfully…: Instantiated preferences sync manager %{public}@.", buf, 0x16u);
      }

      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v8, 0);
      if (a5)
      {
        [v14 synchronizeUserDefaultsDomain:v9 keys:v16];
        id v17 = TLLogVibrationManagement();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          BOOL v24 = v14;
          LOWORD(v25[0]) = 2114;
          *(void *)((char *)v25 + 2) = v16;
          _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetVibrationPreferenceSuccessfully…: Did synchronize user defaults domain %{public}@ with %{public}@ for keys %{public}@.", buf, 0x2Au);
        }
      }
      if ((a5 & 2) != 0)
      {
        [v14 synchronizeNanoDomain:v9 keys:v16];
        int v18 = TLLogVibrationManagement();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          BOOL v24 = v14;
          LOWORD(v25[0]) = 2114;
          *(void *)((char *)v25 + 2) = v16;
          _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetVibrationPreferenceSuccessfully…: Did synchronize nano domain %{public}@ with %{public}@ for keys %{public}@.", buf, 0x2Au);
        }
      }
    }
  }
}

- (BOOL)_areSynchronizedVibrationsAllowedForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  id v6 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  if (![v6 hasSynchronizedVibrationsCapability]) {
    goto LABEL_6;
  }
  int64_t v7 = +[TLAlertController _playbackBackEndForAlertType:a3 topic:v5];
  if ((unint64_t)(v7 - 1) >= 2)
  {
    if (!v7)
    {
      char v8 = [v6 hasSynchronizedEmbeddedVibrationsCapability];
      goto LABEL_7;
    }
LABEL_6:
    char v8 = 0;
    goto LABEL_7;
  }
  char v8 = 1;
LABEL_7:

  return v8;
}

- (id)_synchronizedVibrationIdentifierForToneIdentifier:(id)a3 targetDevice:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = +[TLToneManager sharedToneManager];
  char v8 = [v7 _aliasForToneIdentifier:v6];

  char v9 = [v8 isEqualToString:@"<default>"];
  int v10 = [v8 hasPrefix:@"system:"];
  int v11 = [v8 hasPrefix:@"texttone:"];
  int v12 = [v8 hasPrefix:@"alarmWakeUp:"];
  int v13 = v12;
  if ((v9 & 1) == 0 && (v10 & 1) == 0 && (v11 & 1) == 0 && !v12) {
    goto LABEL_17;
  }
  uint64_t v25 = self;
  int64_t v14 = a4;
  int v15 = +[TLCapabilitiesManager sharedCapabilitiesManager];
  int v16 = [v15 hasSynchronizedVibrationsCapability];

  if (!v16) {
    goto LABEL_17;
  }
  id v17 = v25;
  int v18 = [(NSDictionary *)v25->_synchronizedVibrationPatternFromToneIdentifierMapping objectForKey:v8];
  if (v18
    || (v10 | v11 | v13) == 1
    && (!v11 ? (uint64_t v22 = @"alarmWakeUp:") : (uint64_t v22 = @"texttone:"),
        !v10 ? (long long v23 = v22) : (long long v23 = @"system:"),
        objc_msgSend(v8, "substringFromIndex:", -[__CFString length](v23, "length")),
        int v18 = objc_claimAutoreleasedReturnValue(),
        id v17 = v25,
        v18))
  {
    uint64_t v19 = [@"synchronizedvibration:" stringByAppendingString:v18];
    id v20 = [(TLVibrationManager *)v17 _patternForSystemVibrationWithIdentifier:v19 correspondingToneIdentifier:v6 targetDevice:v14 shouldLogAssetPath:0];
    if ([v20 count]) {
      id v21 = v19;
    }
    else {
      id v21 = 0;
    }
  }
  else
  {
LABEL_17:
    id v21 = 0;
  }

  return v21;
}

- (id)_sanitizeVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5 targetDevice:(int64_t)a6 correspondingToneIdentifier:(id)a7 didFallbackToCurrentVibrationIdentifier:(BOOL *)a8
{
  LOBYTE(v9) = 1;
  return [(TLVibrationManager *)self _sanitizeVibrationIdentifier:a3 forAlertType:a4 topic:a5 targetDevice:a6 correspondingToneIdentifier:a7 useDefaultVibrationAsFallback:0 allowsNoneDefaultToAnyActualVibrationSubstitution:v9 didFallback:a8];
}

- (id)_sanitizeVibrationIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5 targetDevice:(int64_t)a6 correspondingToneIdentifier:(id)a7 useDefaultVibrationAsFallback:(BOOL)a8 allowsNoneDefaultToAnyActualVibrationSubstitution:(BOOL)a9 didFallback:(BOOL *)a10
{
  BOOL v10 = a8;
  BOOL v16 = a9;
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  if (![v17 length])
  {
    uint64_t v22 = 0;
LABEL_8:
    int v23 = 1;
    goto LABEL_9;
  }
  if (![v17 hasPrefix:@"synchronizedvibration:"])
  {
    uint64_t v22 = (__CFString *)v17;
    goto LABEL_8;
  }
  id v20 = v19;
  if (![v20 length])
  {
    id v21 = +[TLToneManager sharedToneManager];
    uint64_t v27 = [v21 currentToneIdentifierForAlertType:a4 topic:v18];

    BOOL v16 = a9;
    id v20 = (id)v27;
  }
  -[TLVibrationManager _synchronizedVibrationIdentifierForToneIdentifier:targetDevice:](self, "_synchronizedVibrationIdentifierForToneIdentifier:targetDevice:", v20, a6, v27);
  uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  int v23 = 0;
LABEL_9:
  if ([(__CFString *)v22 length])
  {
    BOOL v24 = 0;
  }
  else
  {
    if (v10) {
      [(TLVibrationManager *)self _defaultVibrationIdentifierForAlertType:a4 topic:v18 correspondingToneIdentifier:v19];
    }
    else {
    uint64_t v25 = [(TLVibrationManager *)self _currentVibrationIdentifierForAlertType:a4 topic:v18 correspondingToneIdentifier:v19 allowsNoneDefaultToAnyActualVibrationSubstitution:0];
    }

    if (((v23 | !v16) & 1) != 0
      || ![(__CFString *)v25 isEqualToString:@"<none>"])
    {
      BOOL v24 = 1;
      uint64_t v22 = v25;
    }
    else
    {

      BOOL v24 = 0;
      uint64_t v22 = @"Quick";
    }
  }
  if (a10) {
    *a10 = v24;
  }

  return v22;
}

- (void)_handleUserGeneratedVibrationsDidChangeNotification
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __73__TLVibrationManager__handleUserGeneratedVibrationsDidChangeNotification__block_invoke;
  v2[3] = &unk_1E6C20D60;
  v2[4] = self;
  [(TLVibrationManager *)self _performBlockInAccessQueue:v2];
}

uint64_t __73__TLVibrationManager__handleUserGeneratedVibrationsDidChangeNotification__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = 1;
  return result;
}

- (id)_userGeneratedVibrationPatterns
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__TLVibrationManager__userGeneratedVibrationPatterns__block_invoke;
  v4[3] = &unk_1E6C20E78;
  v4[4] = self;
  v4[5] = &v5;
  [(TLVibrationManager *)self _performBlockInAccessQueue:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __53__TLVibrationManager__userGeneratedVibrationPatterns__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v3[65]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (v4)
  {
    if (v3[65] && v3[64])
    {

      *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
      uint64_t v3 = *(unsigned char **)(a1 + 32);
    }
    else if (v2)
    {
      goto LABEL_14;
    }
    if ([v3 _isUnitTestingModeEnabled])
    {
      id v2 = [*(id *)(a1 + 32) _retrieveUserGeneratedVibrationPatternsUsingService];
    }
    else
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
      id v6 = +[TLVibrationPersistenceUtilities userGeneratedVibrationStoreFileURL];
      id v2 = [v5 dictionaryWithContentsOfURL:v6];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v2);
  }
LABEL_14:
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v2;
}

- (void)_didChangeUserGeneratedVibrationPatterns
{
  if ([(TLVibrationManager *)self _isUnitTestingModeEnabled])
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, @"TLVibrationManagerUserGeneratedVibrationsDidChange", 0, 0, 1u);
  }
  else
  {
    [(TLVibrationManager *)self _handleUserGeneratedVibrationsDidChangeNotification];
  }
}

- (BOOL)_saveUserGeneratedVibrationPatterns:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(TLVibrationManager *)self _setUserGeneratedVibrationPatternsUsingService:v6 error:a4])
  {
    [(TLVibrationManager *)self _didChangeUserGeneratedVibrationPatterns];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)addUserGeneratedVibrationPattern:(id)a3 name:(id)a4 error:(id *)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  int v11 = 0;
  if (v8 && v9)
  {
    int v12 = [MEMORY[0x1E4F29128] UUID];
    int v13 = [v12 UUIDString];

    if (v13)
    {
      int v11 = [NSString stringWithFormat:@"%@%@", @"usergeneratedvibration:", v13];
      if (v11)
      {
        int64_t v14 = [(TLVibrationManager *)self _userGeneratedVibrationPatterns];
        int v15 = [v8 objectForKey:v11];

        if (v15)
        {

          int v11 = 0;
        }
        else
        {
          id v16 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v14];
          if (!v16) {
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          v19[0] = @"Name";
          v19[1] = @"Pattern";
          v20[0] = v10;
          v20[1] = v8;
          id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
          [v16 setObject:v17 forKey:v11];
          if (![(TLVibrationManager *)self _saveUserGeneratedVibrationPatterns:v16 error:a5])
          {

            int v11 = 0;
          }
        }
      }
    }
    else
    {
      int v11 = 0;
    }
  }

  return v11;
}

- (BOOL)setName:(id)a3 forUserGeneratedVibrationWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(TLVibrationManager *)self _userGeneratedVibrationPatterns];
  int v11 = v10;
  if (v10)
  {
    int v12 = [v10 objectForKey:v9];
    if (v12)
    {
      int v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v12];
      [v13 setObject:v8 forKey:@"Name"];
      int64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v11];
      [v14 setObject:v13 forKey:v9];
      BOOL v15 = [(TLVibrationManager *)self _saveUserGeneratedVibrationPatterns:v14 error:a5];
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)deleteUserGeneratedVibrationPatternWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(TLVibrationManager *)self _userGeneratedVibrationPatterns];
  id v8 = [v7 objectForKey:v6];

  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v7];
    [v9 removeObjectForKey:v6];
    BOOL v10 = [(TLVibrationManager *)self _saveUserGeneratedVibrationPatterns:v9 error:a4];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)_numberOfUserGeneratedVibrations
{
  id v2 = [(TLVibrationManager *)self _userGeneratedVibrationPatterns];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)_removeAllUserGeneratedVibrationsWithError:(id *)a3
{
  BOOL v4 = [(TLVibrationManager *)self _removeAllUserGeneratedVibrationPatternsUsingServiceWithError:a3];
  if (v4) {
    [(TLVibrationManager *)self _didChangeUserGeneratedVibrationPatterns];
  }
  return v4;
}

- (id)_newServiceConnection
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.tonelibraryd"];
  unint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F360AFD8];
  [v2 setRemoteObjectInterface:v3];
  [v2 resume];

  return v2;
}

- (id)_retrieveUserGeneratedVibrationPatternsUsingService
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  id v2 = [(TLVibrationManager *)self _newServiceConnection];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke;
  v12[3] = &unk_1E6C20EC8;
  BOOL v4 = v3;
  int v13 = v4;
  uint64_t v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_321;
  v9[3] = &unk_1E6C20EF0;
  int v11 = &v14;
  id v6 = v4;
  BOOL v10 = v6;
  [v5 retrieveUserGeneratedVibrationPatternsWithCompletionHandler:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  [v2 invalidate];
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v7;
}

void __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = TLLogVibrationManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_cold_1(v3);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_321(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else if (v7)
  {
    id v9 = TLLogVibrationManagement();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_321_cold_1(v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_setUserGeneratedVibrationPatternsUsingService:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__1;
  uint64_t v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  id v7 = [(TLVibrationManager *)self _newServiceConnection];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke;
  v18[3] = &unk_1E6C21948;
  id v20 = &v21;
  id v9 = v8;
  id v19 = v9;
  BOOL v10 = [v7 remoteObjectProxyWithErrorHandler:v18];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_323;
  v14[3] = &unk_1E6C21970;
  uint64_t v16 = &v27;
  id v17 = &v21;
  int v11 = v9;
  BOOL v15 = v11;
  [v10 setUserGeneratedVibrationPatterns:v6 withCompletionHandler:v14];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  [v7 invalidate];
  if (a4) {
    *a4 = (id) v22[5];
  }
  char v12 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

void __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = TLLogVibrationManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_323(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    id v7 = TLLogVibrationManagement();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_323_cold_1(v6);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_removeAllUserGeneratedVibrationPatternsUsingServiceWithError:(id *)a3
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  uint64_t v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  id v4 = [(TLVibrationManager *)self _newServiceConnection];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke;
  v15[3] = &unk_1E6C21948;
  id v17 = &v18;
  id v6 = v5;
  uint64_t v16 = v6;
  id v7 = [v4 remoteObjectProxyWithErrorHandler:v15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_325;
  v11[3] = &unk_1E6C21970;
  int v13 = &v24;
  uint64_t v14 = &v18;
  dispatch_semaphore_t v8 = v6;
  char v12 = v8;
  [v7 removeAllUserGeneratedVibrationPatternsWithCompletionHandler:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  [v4 invalidate];
  if (a3) {
    *a3 = (id) v19[5];
  }
  char v9 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v9;
}

void __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TLLogVibrationManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_325(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    id v7 = TLLogVibrationManagement();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_325_cold_1(v6);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_BOOLeanPreferenceForKey:(__CFString *)a3 defaultValue:(BOOL)a4
{
  id v6 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
  if (v6)
  {
    id v7 = v6;
    CFBooleanRef v8 = (const __CFBoolean *)CFPreferencesCopyValue(a3, v6, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    if (v8)
    {
      CFBooleanRef v9 = v8;
      CFTypeID v10 = CFGetTypeID(v8);
      if (v10 == CFBooleanGetTypeID()) {
        a4 = CFBooleanGetValue(v9) != 0;
      }
      CFRelease(v9);
    }
    CFRelease(v7);
  }
  return a4;
}

- (BOOL)shouldVibrateForCurrentRingerSwitchState
{
  id v3 = +[TLSilentModeController sharedSilentModeController];
  uint64_t v4 = [v3 silentModeStatus];

  if (v4 == 1)
  {
    return [(TLVibrationManager *)self shouldVibrateOnSilent];
  }
  else
  {
    return [(TLVibrationManager *)self shouldVibrateOnRing];
  }
}

- (BOOL)shouldVibrateOnRing
{
  return [(TLVibrationManager *)self _BOOLeanPreferenceForKey:@"ring-vibrate" defaultValue:1];
}

- (BOOL)shouldVibrateOnSilent
{
  return [(TLVibrationManager *)self _BOOLeanPreferenceForKey:@"silent-vibrate" defaultValue:1];
}

- (BOOL)_migrateLegacySettings
{
  unint64_t v3 = [(TLVibrationManager *)self _storedSystemVibrationDataMigrationVersion];
  if (!v3)
  {
    uint64_t v4 = objc_alloc_init(TLToneManager);
    for (uint64_t i = 0; i != 10; ++i)
    {
      uint64_t v6 = qword_1DB9827A0[i];
      id v7 = [(TLToneManager *)v4 currentToneIdentifierForAlertType:v6];
      if ([v7 isEqualToString:@"<none>"])
      {
        CFBooleanRef v8 = [(TLVibrationManager *)self _currentVibrationIdentifierForAlertType:v6 topic:0];
        if (v8)
        {
        }
        else
        {
          CFBooleanRef v9 = [(TLVibrationManager *)self defaultVibrationIdentifierForAlertType:v6];
          char v10 = [v9 isEqualToString:@"<none>"];

          if ((v10 & 1) == 0) {
            [(TLVibrationManager *)self setCurrentVibrationIdentifier:@"<none>" forAlertType:v6];
          }
        }
      }
    }
    unint64_t v3 = 0;
  }
  if (v3 > 1)
  {
    if (v3 != 2) {
      goto LABEL_17;
    }
  }
  else
  {
    int v11 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
    if (v11)
    {
      char v12 = v11;
      +[TLPreferencesUtilities migratePerTopicPreferencesInDomain:v11 withRegularPreferenceKeys:_TLVibrationManagerSystemWideVibrationPatternPreferenceKeys regularPreferenceKeysCount:29 intoSinglePerTopicPreferenceWithSuffix:@"PerAccount" usingPreferencesScope:1];
      CFRelease(v12);
    }
  }
  int v13 = [(TLVibrationManager *)self _currentVibrationIdentifierForAlertType:5 topic:0];
  if ([v13 isEqualToString:@"<none>"]) {
    [(TLVibrationManager *)self setCurrentVibrationIdentifier:0 forAlertType:5];
  }

LABEL_17:
  [(TLVibrationManager *)self _makeSystemVibrationDataMigrationVersionCurrentIfNecessary];
  return 1;
}

- (unint64_t)_storedSystemVibrationDataMigrationVersion
{
  id v2 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
  if (v2)
  {
    unint64_t v3 = (void *)CFPreferencesCopyValue(@"SystemVibrationDataMigrationVersion", v2, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFRelease(v2);
    if (v3)
    {
      CFTypeID v4 = CFGetTypeID(v3);
      if (v4 == CFNumberGetTypeID()) {
        id v2 = (__CFString *)[v3 unsignedIntegerValue];
      }
      else {
        id v2 = 0;
      }
      CFRelease(v3);
    }
    else
    {
      return 0;
    }
  }
  return (unint64_t)v2;
}

- (void)_makeSystemVibrationDataMigrationVersionCurrentIfNecessary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TLVibrationManager__makeSystemVibrationDataMigrationVersionCurrentIfNecessary__block_invoke;
  block[3] = &unk_1E6C20D60;
  block[4] = self;
  if (_makeSystemVibrationDataMigrationVersionCurrentIfNecessary__TLVibrationManagerMakeSystemVibrationDataMigrationVersionCurrentOnceToken != -1) {
    dispatch_once(&_makeSystemVibrationDataMigrationVersionCurrentIfNecessary__TLVibrationManagerMakeSystemVibrationDataMigrationVersionCurrentOnceToken, block);
  }
}

void __80__TLVibrationManager__makeSystemVibrationDataMigrationVersionCurrentIfNecessary__block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) _storedSystemVibrationDataMigrationVersion] <= 2)
  {
    uint64_t v1 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain];
    if (v1)
    {
      CFStringRef v2 = v1;
      CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
      CFPreferencesSetValue(@"SystemVibrationDataMigrationVersion", &unk_1F35FF718, v1, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
      CFPreferencesSynchronize(v2, v3, v4);
      CFRelease(v2);
    }
  }
}

- (id)_currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6 = a4;
  id v7 = [(TLVibrationManager *)self _systemWideVibrationPatternPreferenceKeyForAlertType:a3];
  CFBooleanRef v8 = [v7 stringByReplacingOccurrencesOfString:@"VibrationIdentifier" withString:@"Vibration"];

  CFBooleanRef v9 = [v8 stringByAppendingString:@"WatchAlertPolicy"];

  uint64_t v10 = [v6 length];
  if (v10)
  {
    uint64_t v11 = [v9 stringByAppendingString:@"PerAccount"];

    CFBooleanRef v9 = (void *)v11;
  }

  return v9;
}

- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3
{
  return [(TLVibrationManager *)self _currentVibrationWatchAlertPolicyForAlertType:a3 topic:0];
}

- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4
{
  return [(TLVibrationManager *)self _currentVibrationWatchAlertPolicyForAlertType:a3 topic:a4 didFindPersistedWatchAlertPolicy:0];
}

- (int64_t)_currentVibrationWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchAlertPolicy:(BOOL *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ((unint64_t)(a3 - 13) >= 2)
  {
    if (a3 == 17)
    {
      uint64_t v10 = +[TLCapabilitiesManager sharedCapabilitiesManager];
      int v11 = [v10 supportsNanoEncore];

      int64_t v9 = v11 ^ 1u;
    }
    else
    {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 1;
  }
  uint64_t v12 = [v8 length];
  int v13 = +[TLPreferencesUtilities perWatchPreferencesDomain];
  uint64_t v14 = [(TLVibrationManager *)self _currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:a3 topic:v8];
  if (!v14 || (NPSDomainAccessorClass_0 = (objc_class *)getNPSDomainAccessorClass_0()) == 0)
  {
    char isKindOfClass = 0;
LABEL_21:
    if (v12) {
      int64_t v9 = [(TLVibrationManager *)self _currentVibrationWatchAlertPolicyForAlertType:a3 topic:0 didFindPersistedWatchAlertPolicy:0];
    }
    goto LABEL_23;
  }
  id v23 = a5;
  uint64_t v16 = (void *)[[NPSDomainAccessorClass_0 alloc] initWithDomain:v13];
  id v17 = TLLogVibrationManagement();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    char v27 = v16;
    _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationWatchAlertPolicy…: Instantiated domain accessor %{public}@.", buf, 0x16u);
  }

  uint64_t v18 = [v16 objectForKey:v14];
  id v19 = TLLogVibrationManagement();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    char v27 = v14;
    __int16 v28 = 2114;
    uint64_t v29 = v16;
    __int16 v30 = 2114;
    uint64_t v31 = v18;
    _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentVibrationWatchAlertPolicy…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", buf, 0x2Au);
  }

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [v18 objectForKey:v8];
    }
    else
    {
      uint64_t v20 = 0;
    }

    uint64_t v18 = (void *)v20;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    int64_t v9 = TLWatchAlertPolicyFromString(v18);
  }

  a5 = v23;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_21;
  }
LABEL_23:
  if (a5) {
    *a5 = isKindOfClass & 1;
  }

  return v9;
}

- (void)_setCurrentVibrationWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4
{
}

- (void)_setCurrentVibrationWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  id v8 = a5;
  if (a3 == 3)
  {
    int64_t v9 = [(TLVibrationManager *)self currentVibrationIdentifierForAlertType:a4 topic:v8];
    if ([v9 isEqualToString:@"<none>"]) {
      a3 = 2;
    }
    else {
      a3 = 1;
    }
  }
  char v21 = 0;
  int64_t v10 = [(TLVibrationManager *)self _currentVibrationWatchAlertPolicyForAlertType:a4 topic:v8 didFindPersistedWatchAlertPolicy:&v21];
  if (v21) {
    BOOL v11 = v10 == a3;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    uint64_t v12 = +[TLPreferencesUtilities perWatchPreferencesDomain];
    int v13 = [(TLVibrationManager *)self _currentVibrationWatchAlertPolicyPreferenceKeyForAlertType:a4 topic:v8];
    if (v13)
    {
      uint64_t v14 = NSStringFromTLWatchAlertPolicy(a3);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __78__TLVibrationManager__setCurrentVibrationWatchAlertPolicy_forAlertType_topic___block_invoke;
      v16[3] = &unk_1E6C21008;
      v16[4] = self;
      id v17 = v12;
      id v18 = v8;
      id v19 = v13;
      id v20 = v14;
      BOOL v15 = v14;
      [(TLVibrationManager *)self _performBlockInAccessQueue:v16];
    }
    else
    {
      BOOL v15 = TLLogVibrationManagement();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[TLToneManager _setCurrentToneWatchAlertPolicy:forAlertType:topic:](a4);
      }
    }
  }
}

void __78__TLVibrationManager__setCurrentVibrationWatchAlertPolicy_forAlertType_topic___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    CFStringRef v3 = v2;
LABEL_3:
    int v4 = 0;
    goto LABEL_8;
  }
  NPSDomainAccessorClass_0 = (objc_class *)getNPSDomainAccessorClass_0();
  if (!NPSDomainAccessorClass_0)
  {
    CFStringRef v3 = 0;
    goto LABEL_3;
  }
  CFStringRef v3 = (void *)[[NPSDomainAccessorClass_0 alloc] initWithDomain:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v3);
  id v6 = TLLogVibrationManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v25 = 138543618;
    uint64_t v26 = v7;
    __int16 v27 = 2114;
    __int16 v28 = v3;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentVibrationWatchAlertPolicy…: Instantiated domain accessor %{public}@ and set it to be the transient one.", (uint8_t *)&v25, 0x16u);
  }

  int v4 = 1;
LABEL_8:
  if ([*(id *)(a1 + 48) length])
  {
    id v8 = [v3 objectForKey:*(void *)(a1 + 56)];
    int64_t v9 = TLLogVibrationManagement();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      BOOL v11 = *(void **)(a1 + 56);
      int v25 = 138544130;
      uint64_t v26 = v10;
      __int16 v27 = 2114;
      __int16 v28 = v11;
      __int16 v29 = 2114;
      __int16 v30 = v3;
      __int16 v31 = 2114;
      uint64_t v32 = v8;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentVibrationWatchAlertPolicy…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", (uint8_t *)&v25, 0x2Au);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = [v8 mutableCopy];
    }
    else {
      uint64_t v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    int v13 = v12;
    [v12 setObject:*(void *)(a1 + 64) forKey:*(void *)(a1 + 48)];
    [v3 setObject:v13 forKey:*(void *)(a1 + 56)];
    id v17 = TLLogVibrationManagement();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = *(void **)(a1 + 56);
      int v25 = 138544130;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      __int16 v28 = v19;
      __int16 v29 = 2114;
      __int16 v30 = v3;
      __int16 v31 = 2114;
      uint64_t v32 = v13;
      _os_log_impl(&dword_1DB936000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentVibrationWatchAlertPolicy…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v25, 0x2Au);
    }
  }
  else
  {
    [v3 setObject:*(void *)(a1 + 64) forKey:*(void *)(a1 + 56)];
    int v13 = TLLogVibrationManagement();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      BOOL v15 = *(void **)(a1 + 56);
      uint64_t v16 = *(NSObject **)(a1 + 64);
      int v25 = 138544130;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      __int16 v28 = v15;
      __int16 v29 = 2114;
      __int16 v30 = v3;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      _os_log_impl(&dword_1DB936000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentVibrationWatchAlertPolicy…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v25, 0x2Au);
    }
  }

  id v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = +[TLPreferencesUtilities perWatchPreferencesDomain];
  [v20 _didSetVibrationPreferenceSuccessfullyWithKey:v21 inDomain:v22 usingPreferencesOfKind:2];

  if (v4)
  {
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void **)(v23 + 56);
    *(void *)(v23 + 56) = 0;
  }
}

- (void)_performBlockInAccessQueue:(id)a3
{
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (BOOL)allowsAutoRefresh
{
  return self->_allowsAutoRefresh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientNanoPreferencesDomainAccessor, 0);
  objc_storeStrong((id *)&self->_synchronizedVibrationPatternFromToneIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_cachedUserGeneratedVibrationPatterns, 0);
  objc_storeStrong((id *)&self->_cachedSystemVibrationCompleteSubdirectories, 0);
  objc_storeStrong((id *)&self->_cachedSystemVibrationIdentifiers, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Unexpected error while retrieving user generated vibration patterns: %{public}@.", v4, v5, v6, v7, v8);
}

void __73__TLVibrationManager__retrieveUserGeneratedVibrationPatternsUsingService__block_invoke_321_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed retrieving user generated vibration patterns: %{public}@.", v4, v5, v6, v7, v8);
}

void __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Unexpected error while setting user generated vibration patterns: %{public}@.", v4, v5, v6, v7, v8);
}

void __75__TLVibrationManager__setUserGeneratedVibrationPatternsUsingService_error___block_invoke_323_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed setting user generated vibration patterns with error: %{public}@.", v4, v5, v6, v7, v8);
}

void __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Unexpected error while removing user generated vibration patterns: %{public}@.", v4, v5, v6, v7, v8);
}

void __84__TLVibrationManager__removeAllUserGeneratedVibrationPatternsUsingServiceWithError___block_invoke_325_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed removing user generated vibration patterns with error: %{public}@.", v4, v5, v6, v7, v8);
}

@end