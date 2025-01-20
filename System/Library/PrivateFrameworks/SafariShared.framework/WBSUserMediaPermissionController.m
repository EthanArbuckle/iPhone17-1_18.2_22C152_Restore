@interface WBSUserMediaPermissionController
+ (id)localizedStringForPerSitePreferenceValue:(id)a3;
+ (id)sharedController;
- (BOOL)_captureDevicesAreAllDefaultsGivenPermission:(unint64_t)a3;
- (BOOL)_isPreferenceValid:(id)a3;
- (BOOL)_removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4;
- (BOOL)_setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5;
- (WBSPerSitePreference)cameraMediaCapturePreference;
- (WBSPerSitePreference)microphoneMediaCapturePreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (WBSUserMediaPermissionController)init;
- (WBSUserMediaPermissionController)initWithUserMediaPermissionsFileURL:(id)a3 perSitePreferencesStore:(id)a4;
- (id).cxx_construct;
- (id)_dictionaryRepresentation;
- (id)_init;
- (id)_policyForOrigin:(id)a3 topLevelOrigin:(id)a4;
- (id)_saltForOrigin:(id)a3 topLevelOrigin:(id)a4 frameIdentifier:(unint64_t)a5;
- (id)_saltWithPolicyEntry:(id)a3 computedPermission:(unint64_t)a4 frameIdentifier:(unint64_t)a5;
- (id)_standardizedURLForDomain:(id)a3;
- (id)_validPolicyForDomainWithOrigin:(id)a3 topLevelOrigin:(id)a4;
- (id)_validPolicyForOrigin:(id)a3 topLevelOrigin:(id)a4;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)saltForOrigin:(id)a3 topLevelOrigin:(id)a4 frameIdentifier:(unint64_t)a5;
- (id)valuesForPreference:(id)a3;
- (int64_t)_mediaCaptureSettingForMediaCaptureType:(int64_t)a3 userMediaPermission:(unint64_t)a4;
- (int64_t)_mediaCaptureTypeForPreference:(id)a3;
- (unint64_t)_permissionByApplyingDefaultsForMissingValuesInPermission:(unint64_t)a3;
- (unint64_t)_permissionByRemovingDefaultPermissionFlagsInPermission:(unint64_t)a3;
- (unint64_t)_permissionForOrigin:(id)a3 topLevelOrigin:(id)a4;
- (unint64_t)_permissionMaskForMediaCaptureType:(int64_t)a3;
- (unint64_t)_userMediaPermissionForMediaCaptureType:(int64_t)a3 mediaCaptureSetting:(int64_t)a4;
- (unint64_t)permissionForDomain:(id)a3;
- (unint64_t)permissionForNonHTTPSOriginFromPermission:(unint64_t)a3;
- (unint64_t)permissionForOrigin:(id)a3 topLevelOrigin:(id)a4;
- (unint64_t)userMediaPermissionForDefaultPreferenceValues;
- (void)_cachedSettingsDidChange;
- (void)_cachedSettingsDidChangeAndWriteImmediately:(BOOL)a3 completionHandler:(id)a4;
- (void)_dispatchAsyncOnInternalQueue:(id)a3;
- (void)_dispatchSyncOnInternalQueue:(id)a3;
- (void)_invalidateAllPermissionsForDomain:(id)a3;
- (void)_invalidateCachedSettingsForOriginHash:(id)a3;
- (void)_loadSavedPermissions;
- (void)_setPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6;
- (void)checkUserMediaPermissionForURL:(id)a3 mainFrameURL:(id)a4 frameIdentifier:(unint64_t)a5 decisionHandler:(id)a6;
- (void)didCommitLoadForFrameWithIdentifier:(unint64_t)a3;
- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4;
- (void)getPermissionForOrigin:(id)a3 topLevelOrigin:(id)a4 completionHandler:(id)a5;
- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6;
- (void)performDelayedLaunchOperations;
- (void)reloadPreferences;
- (void)removeAllOriginsAddedAfterDate:(id)a3;
- (void)removeAllPermissionsWithCompletionHandler:(id)a3;
- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5;
- (void)resetOriginPermissions;
- (void)resetOriginPermissionsWithCompletionHandler:(id)a3;
- (void)savePendingChangesBeforeTermination;
- (void)savePendingChangesWithCompletionHandler:(id)a3;
- (void)setPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6;
- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSUserMediaPermissionController

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__WBSUserMediaPermissionController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSUserMediaPermissionController sharedController]::onceToken != -1) {
    dispatch_once(&+[WBSUserMediaPermissionController sharedController]::onceToken, block);
  }
  v2 = (void *)+[WBSUserMediaPermissionController sharedController]::controller;
  return v2;
}

void __52__WBSUserMediaPermissionController_sharedController__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)+[WBSUserMediaPermissionController sharedController]::controller;
  +[WBSUserMediaPermissionController sharedController]::controller = v1;
}

- (WBSUserMediaPermissionController)init
{
  return 0;
}

- (WBSUserMediaPermissionController)initWithUserMediaPermissionsFileURL:(id)a3 perSitePreferencesStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSUserMediaPermissionController;
  id v9 = [(WBSUserMediaPermissionController *)&v25 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.Safari.UserMediaPermissionsController", v10);
    v12 = (void *)*((void *)v9 + 6);
    *((void *)v9 + 6) = v11;

    dispatch_suspend(*((dispatch_object_t *)v9 + 6));
    atomic_store(0, (unint64_t *)v9 + 7);
    objc_storeStrong((id *)v9 + 8, a3);
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v14 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = v13;

    v15 = *((void *)v9 + 6);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__WBSUserMediaPermissionController_initWithUserMediaPermissionsFileURL_perSitePreferencesStore___block_invoke;
    block[3] = &unk_1E5C8CA70;
    v16 = (id *)v9;
    v24 = v16;
    dispatch_async(v15, block);
    [v16 setDefaultsDelegate:v16];
    objc_storeStrong(v16 + 9, a4);
    v17 = [[WBSPerSitePreference alloc] initWithIdentifier:@"CameraPreference"];
    id v18 = v16[10];
    v16[10] = v17;

    v19 = [[WBSPerSitePreference alloc] initWithIdentifier:@"MicrophonePreference"];
    id v20 = v16[11];
    v16[11] = v19;

    v21 = v16;
  }

  return (WBSUserMediaPermissionController *)v9;
}

uint64_t __96__WBSUserMediaPermissionController_initWithUserMediaPermissionsFileURL_perSitePreferencesStore___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadSavedPermissions];
}

- (id)_init
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = objc_msgSend(v3, "safari_settingsDirectoryURL");
  v5 = [v4 URLByAppendingPathComponent:@"UserMediaPermissions.plist" isDirectory:0];

  v6 = +[WBSPerSitePreferencesSQLiteStore sharedStore];
  id v7 = [(WBSUserMediaPermissionController *)self initWithUserMediaPermissionsFileURL:v5 perSitePreferencesStore:v6];

  return v7;
}

- (void)performDelayedLaunchOperations
{
}

- (void)reloadPreferences
{
  unint64_t v2 = atomic_load((unint64_t *)&self->_savedStateLoadStatus);
  if (v2 == 2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__WBSUserMediaPermissionController_reloadPreferences__block_invoke;
    v3[3] = &unk_1E5C8CA70;
    v3[4] = self;
    [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v3];
  }
}

uint64_t __53__WBSUserMediaPermissionController_reloadPreferences__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  atomic_store(1uLL, (unint64_t *)(*(void *)(a1 + 32) + 56));
  v5 = *(void **)(a1 + 32);
  return [v5 _loadSavedPermissions];
}

- (void)savePendingChangesBeforeTermination
{
  if (atomic_load((unint64_t *)&self->_savedStateLoadStatus))
  {
    if (self->_userMediaPermissionsFileURL)
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __71__WBSUserMediaPermissionController_savePendingChangesBeforeTermination__block_invoke;
      v3[3] = &unk_1E5C8CA70;
      v3[4] = self;
      [(WBSUserMediaPermissionController *)self _dispatchSyncOnInternalQueue:v3];
    }
  }
}

uint64_t __71__WBSUserMediaPermissionController_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) completePendingWriteSynchronously];
}

- (void)savePendingChangesWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = v4;
  unint64_t v6 = atomic_load((unint64_t *)&self->_savedStateLoadStatus);
  if (v6 && self->_userMediaPermissionsFileURL && self->_saveUserMediaPermissionsWriter)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__WBSUserMediaPermissionController_savePendingChangesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E5C8C9F8;
    v7[4] = self;
    id v8 = v4;
    [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v7];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __76__WBSUserMediaPermissionController_savePendingChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) startScheduledWriteNowWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_invalidateCachedSettingsForOriginHash:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_cachedSettings objectForKeyedSubscript:a3];
  if (v4)
  {
    [v4 setPersistentSalt:0];
    [v4 setPermission:0];
    [(WBSUserMediaPermissionController *)self _cachedSettingsDidChange];
  }
}

- (unint64_t)permissionForOrigin:(id)a3 topLevelOrigin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__WBSUserMediaPermissionController_permissionForOrigin_topLevelOrigin___block_invoke;
  v12[3] = &unk_1E5CA0968;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v15 = &v16;
  id v8 = v7;
  id v9 = v6;
  [(WBSUserMediaPermissionController *)self _dispatchSyncOnInternalQueue:v12];
  unint64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __71__WBSUserMediaPermissionController_permissionForOrigin_topLevelOrigin___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _permissionForOrigin:*(void *)(a1 + 40) topLevelOrigin:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)getPermissionForOrigin:(id)a3 topLevelOrigin:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__38;
  v16[4] = __Block_byref_object_dispose__38;
  id v17 = (id)MEMORY[0x1AD0C4F80](a5);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__WBSUserMediaPermissionController_getPermissionForOrigin_topLevelOrigin_completionHandler___block_invoke;
  v12[3] = &unk_1E5C9EB00;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  v15 = v16;
  id v10 = v9;
  id v11 = v8;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v12];

  _Block_object_dispose(v16, 8);
}

void __92__WBSUserMediaPermissionController_getPermissionForOrigin_topLevelOrigin_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _permissionForOrigin:*(void *)(a1 + 40) topLevelOrigin:*(void *)(a1 + 48)];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__WBSUserMediaPermissionController_getPermissionForOrigin_topLevelOrigin_completionHandler___block_invoke_2;
  v3[3] = &unk_1E5CA0990;
  v3[4] = *(void *)(a1 + 56);
  void v3[5] = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __92__WBSUserMediaPermissionController_getPermissionForOrigin_topLevelOrigin_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (unint64_t)_permissionForOrigin:(id)a3 topLevelOrigin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSUserMediaPermissionController *)self _validPolicyForDomainWithOrigin:v6 topLevelOrigin:v7];
  uint64_t v9 = [v8 permission];

  unint64_t v10 = [(WBSUserMediaPermissionController *)self _permissionByApplyingDefaultsForMissingValuesInPermission:v9];
  return v10;
}

- (id)_validPolicyForDomainWithOrigin:(id)a3 topLevelOrigin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSUserMediaPermissionController *)self _standardizedURLForDomain:v7];
  if (![v8 length]
    || ((-[WBSUserMediaPermissionController _validPolicyForOrigin:topLevelOrigin:](self, "_validPolicyForOrigin:topLevelOrigin:", v8, v8), uint64_t v9 = objc_claimAutoreleasedReturnValue(), v10 = -[WBSUserMediaPermissionController _captureDevicesAreAllDefaultsGivenPermission:](self, "_captureDevicesAreAllDefaultsGivenPermission:", [v9 permission]), v11 = v10, !v10)? (v12 = 0): (v12 = v9), v12, v11))
  {
    uint64_t v9 = [(WBSUserMediaPermissionController *)self _validPolicyForOrigin:v6 topLevelOrigin:v7];
  }

  return v9;
}

- (id)_validPolicyForOrigin:(id)a3 topLevelOrigin:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = (NSString *)a4;
  id v8 = [(WBSUserMediaPermissionController *)self _policyForOrigin:v6 topLevelOrigin:v7];
  uint64_t v9 = v8;
  if (v8 && ([v8 isValid] & 1) == 0)
  {
    BOOL v10 = originHash(v6, v7);
    [(WBSUserMediaPermissionController *)self _invalidateCachedSettingsForOriginHash:v10];

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_policyForOrigin:(id)a3 topLevelOrigin:(id)a4
{
  cachedSettings = self->_cachedSettings;
  v5 = originHash((NSString *)a3, (NSString *)a4);
  id v6 = [(NSMutableDictionary *)cachedSettings objectForKeyedSubscript:v5];

  return v6;
}

- (unint64_t)permissionForNonHTTPSOriginFromPermission:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xFFFFFFFFFFFFFFFALL | 1;
  if ((a3 & 4) == 0) {
    unint64_t v3 = a3;
  }
  if ((v3 & 0x20) != 0) {
    return v3 & 0xFFFFFFFFFFFFFFD7 | 8;
  }
  else {
    return v3;
  }
}

- (void)setPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__WBSUserMediaPermissionController_setPermission_expirationPolicy_forOrigin_topLevelOrigin___block_invoke;
  v14[3] = &unk_1E5CA09B8;
  unint64_t v17 = a3;
  unint64_t v18 = a4;
  v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v14];
}

uint64_t __92__WBSUserMediaPermissionController_setPermission_expirationPolicy_forOrigin_topLevelOrigin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPermission:*(void *)(a1 + 56) expirationPolicy:*(void *)(a1 + 64) forOrigin:*(void *)(a1 + 40) topLevelOrigin:*(void *)(a1 + 48)];
}

- (void)_setPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6
{
  id v15 = (NSString *)a5;
  id v10 = (NSString *)a6;
  unint64_t v11 = [(WBSUserMediaPermissionController *)self _permissionByRemovingDefaultPermissionFlagsInPermission:a3];
  id v12 = originHash(v15, v10);
  id v13 = [(NSMutableDictionary *)self->_cachedSettings objectForKeyedSubscript:v12];
  id v14 = v13;
  if (v13)
  {
    [(WBSUserMediaCapturePolicyEntry *)v13 updatePermission:v11 expirationPolicy:a4];
  }
  else
  {
    id v14 = [[WBSUserMediaCapturePolicyEntry alloc] initWithPermission:v11 expirationPolicy:a4 forOrigin:v15 topLevelOrigin:v10];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSettings, "setObject:forKeyedSubscript:");
  }
  [(WBSUserMediaPermissionController *)self _cachedSettingsDidChange];
}

- (unint64_t)_permissionByRemovingDefaultPermissionFlagsInPermission:(unint64_t)a3
{
  unsigned __int8 v4 = [(WBSUserMediaPermissionController *)self _permissionByApplyingDefaultsForMissingValuesInPermission:0];
  if (((v4 ^ a3) & 7) != 0) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = a3 & 0xFFFFFFFFFFFFFFF8;
  }
  if (((v5 ^ v4) & 0x38) == 0) {
    v5 &= 0xFFFFFFFFFFFFFFC7;
  }
  if (((v5 ^ v4) & 0xC0) != 0) {
    return v5;
  }
  else {
    return v5 & 0xFFFFFFFFFFFFFF3FLL;
  }
}

- (id)saltForOrigin:(id)a3 topLevelOrigin:(id)a4 frameIdentifier:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__WBSUserMediaPermissionController_saltForOrigin_topLevelOrigin_frameIdentifier___block_invoke;
  v14[3] = &unk_1E5CA09E0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = &v19;
  unint64_t v18 = a5;
  id v10 = v9;
  id v11 = v8;
  [(WBSUserMediaPermissionController *)self _dispatchSyncOnInternalQueue:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __81__WBSUserMediaPermissionController_saltForOrigin_topLevelOrigin_frameIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _saltForOrigin:*(void *)(a1 + 40) topLevelOrigin:*(void *)(a1 + 48) frameIdentifier:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  unsigned __int8 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_saltForOrigin:(id)a3 topLevelOrigin:(id)a4 frameIdentifier:(unint64_t)a5
{
  id v8 = (NSString *)a3;
  id v9 = (NSString *)a4;
  id v10 = originHash(v8, v9);
  if (v10)
  {
    id v11 = [(NSMutableDictionary *)self->_cachedSettings objectForKeyedSubscript:v10];
    id v12 = v11;
    if (v11)
    {
      if (![(WBSUserMediaCapturePolicyEntry *)v11 isValid]) {
        [(WBSUserMediaPermissionController *)self _invalidateCachedSettingsForOriginHash:v10];
      }
    }
    else
    {
      id v12 = [[WBSUserMediaCapturePolicyEntry alloc] initWithPermission:0 expirationPolicy:1 forOrigin:v8 topLevelOrigin:v9];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSettings, "setObject:forKeyedSubscript:");
    }
    id v14 = [(WBSUserMediaPermissionController *)self _saltWithPolicyEntry:v12 computedPermission:[(WBSUserMediaPermissionController *)self _permissionByApplyingDefaultsForMissingValuesInPermission:[(WBSUserMediaCapturePolicyEntry *)v12 permission]] frameIdentifier:a5];
  }
  else
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXUserMediaCapture();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WBSUserMediaPermissionController _saltForOrigin:topLevelOrigin:frameIdentifier:](v13);
    }
    id v14 = &stru_1EFBE3CF8;
  }

  return v14;
}

- (id)_saltWithPolicyEntry:(id)a3 computedPermission:(unint64_t)a4 frameIdentifier:(unint64_t)a5
{
  char v6 = a4;
  char v8 = ~(_BYTE)a4;
  id v9 = a3;
  id v10 = v9;
  if ((v8 & 0x12) == 0)
  {
    id v11 = &stru_1EFBE3CF8;
    goto LABEL_13;
  }
  id v12 = [v9 ephemeralSalts];
  id v13 = [NSNumber numberWithUnsignedInteger:a5];
  id v11 = [v12 objectForKeyedSubscript:v13];

  if ((v6 & 0x24) != 0)
  {
    if (!v11)
    {
      id v14 = [v10 persistentSalt];

      if (!v14)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F29128]);
        id v16 = [v15 UUIDString];
        [v10 setPersistentSalt:v16];

        [(WBSUserMediaPermissionController *)self _cachedSettingsDidChange];
      }
      id v11 = [v10 persistentSalt];
    }
  }
  else
  {
    unint64_t v17 = [v10 ephemeralSalts];

    if (v17)
    {
      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
      [v10 setEphemeralSalts:v18];

      if (v11) {
        goto LABEL_13;
      }
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F29128]);
    id v11 = [v19 UUIDString];

    id v20 = [v10 ephemeralSalts];
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:a5];
    [v20 setObject:v11 forKeyedSubscript:v21];
  }
LABEL_13:

  return v11;
}

- (void)removeAllOriginsAddedAfterDate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__WBSUserMediaPermissionController_removeAllOriginsAddedAfterDate___block_invoke;
  v6[3] = &unk_1E5C8D980;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v6];
}

void __67__WBSUserMediaPermissionController_removeAllOriginsAddedAfterDate___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__WBSUserMediaPermissionController_removeAllOriginsAddedAfterDate___block_invoke_2;
  v13[3] = &unk_1E5CA0A08;
  id v14 = *(id *)(a1 + 40);
  id v4 = v2;
  id v15 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v13];
  if ([v4 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v16 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 32) _cachedSettingsDidChange];
  }
}

void __67__WBSUserMediaPermissionController_removeAllOriginsAddedAfterDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 permissionGrantDate];
  uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  if ([v7 compare:*(void *)(a1 + 32)] == 1) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)resetOriginPermissions
{
}

- (void)resetOriginPermissionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__WBSUserMediaPermissionController_resetOriginPermissionsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5C8C9F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v6];
}

void __80__WBSUserMediaPermissionController_resetOriginPermissionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__WBSUserMediaPermissionController_resetOriginPermissionsWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5C9B720;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 _cachedSettingsDidChangeAndWriteImmediately:1 completionHandler:v3];
}

uint64_t __80__WBSUserMediaPermissionController_resetOriginPermissionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_loadSavedPermissions
{
  if (self->_userMediaPermissionsFileURL)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:");
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__WBSUserMediaPermissionController__loadSavedPermissions__block_invoke;
    v4[3] = &unk_1E5C9B380;
    v4[4] = self;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
    atomic_store(2uLL, (unint64_t *)&self->_savedStateLoadStatus);
  }
  else
  {
    atomic_store(2uLL, (unint64_t *)&self->_savedStateLoadStatus);
  }
}

void __57__WBSUserMediaPermissionController__loadSavedPermissions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v7 length])
      {
        uint64_t v6 = [[WBSUserMediaCapturePolicyEntry alloc] initWithDictionaryRepresentation:v5];
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v6 forKeyedSubscript:v7];
      }
    }
  }
}

- (void)didCommitLoadForFrameWithIdentifier:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__WBSUserMediaPermissionController_didCommitLoadForFrameWithIdentifier___block_invoke;
  v3[3] = &unk_1E5C8D080;
  void v3[4] = self;
  void v3[5] = a3;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v3];
}

void __72__WBSUserMediaPermissionController_didCommitLoadForFrameWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__5;
  long long v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__WBSUserMediaPermissionController_didCommitLoadForFrameWithIdentifier___block_invoke_2;
  v7[3] = &unk_1E5CA0A30;
  uint64_t v3 = *(void *)(a1 + 40);
  v7[4] = &v8;
  void v7[5] = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];
  if (v9[5])
  {
    id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:");
    if (objc_msgSend(*(id *)(a1 + 32), "_captureDevicesAreAllDefaultsGivenPermission:", objc_msgSend(v4, "permission")))
    {
      id v5 = [v4 ephemeralSalts];
      if ([v5 count])
      {
      }
      else
      {
        uint64_t v6 = [v4 persistentSalt];

        if (!v6) {
          [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v9[5]];
        }
      }
    }
  }
  _Block_object_dispose(&v8, 8);
}

void __72__WBSUserMediaPermissionController_didCommitLoadForFrameWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v8 = a3;
  long long v9 = [v8 ephemeralSalts];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  long long v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    long long v12 = [v8 ephemeralSalts];
    id v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v12 removeObjectForKey:v13];

    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)_dictionaryRepresentation
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_cachedSettings, "count"));
  cachedSettings = self->_cachedSettings;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WBSUserMediaPermissionController__dictionaryRepresentation__block_invoke;
  v7[3] = &unk_1E5CA0A08;
  v7[4] = self;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)cachedSettings enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __61__WBSUserMediaPermissionController__dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (([v5 isValid] & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "_captureDevicesAreAllDefaultsGivenPermission:", objc_msgSend(v5, "permission")) & 1) == 0)
  {
    uint64_t v6 = [v5 dictionaryRepresentation];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

- (BOOL)_captureDevicesAreAllDefaultsGivenPermission:(unint64_t)a3
{
  return a3 == 0;
}

- (void)_cachedSettingsDidChange
{
}

- (void)_cachedSettingsDidChangeAndWriteImmediately:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_userMediaPermissionsFileURL)
  {
    saveUserMediaPermissionsWriter = self->_saveUserMediaPermissionsWriter;
    if (!saveUserMediaPermissionsWriter)
    {
      objc_initWeak(&location, self);
      id v8 = objc_alloc(MEMORY[0x1E4F97E70]);
      userMediaPermissionsFileURL = self->_userMediaPermissionsFileURL;
      internalQueue = self->_internalQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __98__WBSUserMediaPermissionController__cachedSettingsDidChangeAndWriteImmediately_completionHandler___block_invoke;
      v16[3] = &unk_1E5C9F098;
      objc_copyWeak(&v17, &location);
      long long v11 = (WBSCoalescedAsynchronousWriter *)[v8 initWithName:@"UserMediaPermissions" fileURL:userMediaPermissionsFileURL dataSourceQueue:internalQueue dataSourceBlock:v16];
      long long v12 = self->_saveUserMediaPermissionsWriter;
      self->_saveUserMediaPermissionsWriter = v11;

      [(WBSCoalescedAsynchronousWriter *)self->_saveUserMediaPermissionsWriter setDelegate:self];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      saveUserMediaPermissionsWriter = self->_saveUserMediaPermissionsWriter;
    }
    [(WBSCoalescedAsynchronousWriter *)saveUserMediaPermissionsWriter scheduleWrite];
    if (v4)
    {
      id v13 = self->_saveUserMediaPermissionsWriter;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __98__WBSUserMediaPermissionController__cachedSettingsDidChangeAndWriteImmediately_completionHandler___block_invoke_2;
      v14[3] = &unk_1E5C8D5F0;
      id v15 = v6;
      [(WBSCoalescedAsynchronousWriter *)v13 startScheduledWriteNowWithCompletionHandler:v14];
    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
}

id __98__WBSUserMediaPermissionController__cachedSettingsDidChangeAndWriteImmediately_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1E4F28F98];
  uint64_t v3 = [WeakRetained _dictionaryRepresentation];
  BOOL v4 = [v2 dataWithPropertyList:v3 format:200 options:0 error:0];

  return v4;
}

uint64_t __98__WBSUserMediaPermissionController__cachedSettingsDidChangeAndWriteImmediately_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)checkUserMediaPermissionForURL:(id)a3 mainFrameURL:(id)a4 frameIdentifier:(unint64_t)a5 decisionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __112__WBSUserMediaPermissionController_checkUserMediaPermissionForURL_mainFrameURL_frameIdentifier_decisionHandler___block_invoke;
  v16[3] = &unk_1E5C9AF40;
  id v17 = v10;
  id v18 = v11;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = self;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v16];
}

void __112__WBSUserMediaPermissionController_checkUserMediaPermissionForURL_mainFrameURL_frameIdentifier_decisionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) absoluteString];
  uint64_t v3 = [*(id *)(a1 + 40) absoluteString];
  BOOL v4 = [*(id *)(a1 + 48) _validPolicyForDomainWithOrigin:v2 topLevelOrigin:v3];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 48), "_permissionByApplyingDefaultsForMissingValuesInPermission:", objc_msgSend(v4, "permission"));
  id v6 = [*(id *)(a1 + 48) _saltWithPolicyEntry:v4 computedPermission:v5 frameIdentifier:*(void *)(a1 + 64)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__WBSUserMediaPermissionController_checkUserMediaPermissionForURL_mainFrameURL_frameIdentifier_decisionHandler___block_invoke_2;
  block[3] = &unk_1E5C9C8E8;
  id v7 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = v7;
  uint64_t v12 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __112__WBSUserMediaPermissionController_checkUserMediaPermissionForURL_mainFrameURL_frameIdentifier_decisionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], (a1[6] & 0x24) != 0);
}

- (int64_t)_mediaCaptureTypeForPreference:(id)a3
{
  return self->_microphoneMediaCapturePreference == a3 || self->_cameraMediaCapturePreference != a3;
}

- (unint64_t)_permissionMaskForMediaCaptureType:(int64_t)a3
{
  if (a3 == 1) {
    return 7;
  }
  else {
    return 56;
  }
}

- (id)preferences
{
  v5[2] = *MEMORY[0x1E4F143B8];
  microphoneMediaCapturePreference = self->_microphoneMediaCapturePreference;
  v5[0] = self->_cameraMediaCapturePreference;
  v5[1] = microphoneMediaCapturePreference;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (id)valuesForPreference:(id)a3
{
  if ((unint64_t)[(WBSUserMediaPermissionController *)self _mediaCaptureTypeForPreference:a3] >= 2)return 0; {
  else
  }
    return &unk_1EFC222F8;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() localizedStringForPerSitePreferenceValue:v4];

  return v5;
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__WBSUserMediaPermissionController_setValue_ofPreference_forDomain_completionHandler___block_invoke;
  v18[3] = &unk_1E5CA0A58;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v18];
}

void __86__WBSUserMediaPermissionController_setValue_ofPreference_forDomain_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _setValue:*(void *)(a1 + 40) ofPreference:*(void *)(a1 + 48) forDomain:*(void *)(a1 + 56)];
  if (*(void *)(a1 + 64))
  {
    char v3 = v2;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __86__WBSUserMediaPermissionController_setValue_ofPreference_forDomain_completionHandler___block_invoke_2;
    v4[3] = &unk_1E5C9AF18;
    id v5 = *(id *)(a1 + 64);
    char v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __86__WBSUserMediaPermissionController_setValue_ofPreference_forDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WBSUserMediaPermissionController *)self _standardizedURLForDomain:v10];
  id v12 = [(WBSUserMediaPermissionController *)self _validPolicyForDomainWithOrigin:v11 topLevelOrigin:v11];
  uint64_t v13 = [v12 permission];

  int64_t v14 = [(WBSUserMediaPermissionController *)self _mediaCaptureTypeForPreference:v9];
  unint64_t v15 = [(WBSUserMediaPermissionController *)self _permissionMaskForMediaCaptureType:v14];
  uint64_t v16 = [v8 integerValue];
  uint64_t v17 = v13 & ~v15;
  if (v16)
  {
    if (v16 == 1)
    {
      if (v14)
      {
        if (v14 == 1) {
          v17 |= 2uLL;
        }
      }
      else
      {
        v17 |= 0x10uLL;
      }
    }
    else if (v16 == 2)
    {
      if (v14)
      {
        if (v14 == 1) {
          v17 |= 4uLL;
        }
      }
      else
      {
        v17 |= 0x20uLL;
      }
    }
  }
  else
  {
    uint64_t v18 = v17 | 1;
    if (v14 != 1) {
      uint64_t v18 = v17;
    }
    if (v14) {
      uint64_t v17 = v18;
    }
    else {
      v17 |= 8uLL;
    }
  }
  if (v17 != v13)
  {
    [(WBSUserMediaPermissionController *)self _invalidateAllPermissionsForDomain:v10];
    [(WBSUserMediaPermissionController *)self _setPermission:v17 expirationPolicy:2 forOrigin:v11 topLevelOrigin:v11];
    id v19 = [(WBSPerSitePreferenceManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v19 perSitePreferenceManager:self didUpdateValueForPreference:v9 onDomain:v10 toValue:v8];
    }
  }
  return 1;
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
  v15[3] = &unk_1E5C9B058;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v15];
}

void __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _mediaCaptureTypeForPreference:*(void *)(a1 + 40)];
  char v3 = [*(id *)(a1 + 32) _standardizedURLForDomain:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) _validPolicyForDomainWithOrigin:v3 topLevelOrigin:v3];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_mediaCaptureSettingForMediaCaptureType:userMediaPermission:", v2, objc_msgSend(v4, "permission"));
  int v6 = [v4 isValid];
  if (v5 == -1) {
    int v7 = 0;
  }
  else {
    int v7 = v6;
  }
  if (v7 == 1 && ![v4 permissionExpiresWithinOneDay])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_3;
    block[3] = &unk_1E5C9AF68;
    id v10 = (id *)v12;
    v12[0] = *(id *)(a1 + 56);
    v12[1] = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2;
    v13[3] = &unk_1E5C8C6B0;
    id v14 = *(id *)(a1 + 56);
    [v8 getDefaultPreferenceValueForPreference:v9 completionHandler:v13];
    id v10 = &v14;
  }
}

uint64_t __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (int64_t)_mediaCaptureSettingForMediaCaptureType:(int64_t)a3 userMediaPermission:(unint64_t)a4
{
  int64_t v4 = 1;
  unint64_t v5 = 2;
  if ((a4 & 4) == 0) {
    unint64_t v5 = (a4 & 1) - 1;
  }
  if ((a4 & 2) == 0) {
    int64_t v4 = v5;
  }
  int64_t v6 = 1;
  unint64_t v7 = 2;
  if ((a4 & 0x20) == 0) {
    unint64_t v7 = ((a4 >> 3) & 1) - 1;
  }
  if ((a4 & 0x10) == 0) {
    int64_t v6 = v7;
  }
  if (a3) {
    int64_t v6 = v4;
  }
  if (a3 == 1) {
    return v4;
  }
  else {
    return v6;
  }
}

- (unint64_t)_userMediaPermissionForMediaCaptureType:(int64_t)a3 mediaCaptureSetting:(int64_t)a4
{
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      if (!a3) {
        return 16;
      }
      if (a3 == 1) {
        return 2;
      }
    }
    else
    {
      if (a4) {
        return self;
      }
      if (!a3) {
        return 8;
      }
      if (a3 == 1) {
        return 1;
      }
    }
  }
  if (a3) {
    return 4;
  }
  else {
    return 32;
  }
}

- (unint64_t)userMediaPermissionForDefaultPreferenceValues
{
  return [(WBSUserMediaPermissionController *)self _permissionByApplyingDefaultsForMissingValuesInPermission:0];
}

- (unint64_t)_permissionByApplyingDefaultsForMissingValuesInPermission:(unint64_t)a3
{
  unint64_t v5 = dispatch_group_create();
  int64_t v6 = v5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  if ((a3 & 0x38) == 0)
  {
    dispatch_group_enter(v5);
    cameraMediaCapturePreference = self->_cameraMediaCapturePreference;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __94__WBSUserMediaPermissionController__permissionByApplyingDefaultsForMissingValuesInPermission___block_invoke;
    v18[3] = &unk_1E5CA0A80;
    id v20 = &v21;
    v18[4] = self;
    id v19 = v6;
    [(WBSPerSitePreferenceManager *)self getDefaultPreferenceValueForPreference:cameraMediaCapturePreference completionHandler:v18];
  }
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  if ((a3 & 7) == 0)
  {
    dispatch_group_enter(v6);
    microphoneMediaCapturePreference = self->_microphoneMediaCapturePreference;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__WBSUserMediaPermissionController__permissionByApplyingDefaultsForMissingValuesInPermission___block_invoke_2;
    v11[3] = &unk_1E5CA0A80;
    id v13 = &v14;
    v11[4] = self;
    id v12 = v6;
    [(WBSPerSitePreferenceManager *)self getDefaultPreferenceValueForPreference:microphoneMediaCapturePreference completionHandler:v11];
  }
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v9 = v22[3] | v15[3] | a3;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __94__WBSUserMediaPermissionController__permissionByApplyingDefaultsForMissingValuesInPermission___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_userMediaPermissionForMediaCaptureType:mediaCaptureSetting:", 0, objc_msgSend(v3, "integerValue"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __94__WBSUserMediaPermissionController__permissionByApplyingDefaultsForMissingValuesInPermission___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_userMediaPermissionForMediaCaptureType:mediaCaptureSetting:", 1, objc_msgSend(v3, "integerValue"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (unint64_t)permissionForDomain:(id)a3
{
  int64_t v4 = [(WBSUserMediaPermissionController *)self _standardizedURLForDomain:a3];
  unint64_t v5 = [(WBSUserMediaPermissionController *)self permissionForOrigin:v4 topLevelOrigin:v4];

  return v5;
}

- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke;
  v10[3] = &unk_1E5CA0AA8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WBSPerSitePreferenceManager *)self getDefaultPreferenceValueForPreference:v9 completionHandler:v10];
}

void __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2;
  v6[3] = &unk_1E5C9B058;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  [v4 _dispatchAsyncOnInternalQueue:v6];
}

void __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) _mediaCaptureTypeForPreference:*(void *)(a1 + 40)];
  uint64_t v4 = [v2[2] integerValue];
  id v18 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [*((id *)*v2 + 4) allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v9 permissionExpiresWithinOneDay] & 1) == 0)
        {
          uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_mediaCaptureSettingForMediaCaptureType:userMediaPermission:", v3, objc_msgSend(v9, "permission"));
          if (v10 != -1 && v10 != v4)
          {
            id v12 = (void *)MEMORY[0x1E4F1CB10];
            id v13 = [v9 topLevelOrigin];
            uint64_t v14 = [v12 URLWithString:v13];
            unint64_t v15 = objc_msgSend(v14, "safari_userVisibleHostWithoutWWWSubdomain");
            [v18 addObject:v15];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_3;
  block[3] = &unk_1E5C8C660;
  id v16 = *(id *)(a1 + 56);
  id v20 = v18;
  id v21 = v16;
  id v17 = v18;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__WBSUserMediaPermissionController_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke;
  v14[3] = &unk_1E5C9B058;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(WBSUserMediaPermissionController *)self _dispatchAsyncOnInternalQueue:v14];
}

void __102__WBSUserMediaPermissionController_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _removePreferenceValuesForDomains:*(void *)(a1 + 40) fromPreference:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 56))
  {
    char v3 = v2;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __102__WBSUserMediaPermissionController_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2;
    v4[3] = &unk_1E5C9AF18;
    id v5 = *(id *)(a1 + 56);
    char v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __102__WBSUserMediaPermissionController_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v24 = a4;
  unint64_t v6 = -[WBSUserMediaPermissionController _permissionMaskForMediaCaptureType:](self, "_permissionMaskForMediaCaptureType:", -[WBSUserMediaPermissionController _mediaCaptureTypeForPreference:](self, "_mediaCaptureTypeForPreference:"));
  v26 = [MEMORY[0x1E4F1CA80] set];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v25;
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v34;
    unint64_t v9 = ~v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = [(WBSUserMediaPermissionController *)self _standardizedURLForDomain:*(void *)(*((void *)&v33 + 1) + 8 * v10)];
        id v12 = [(WBSUserMediaPermissionController *)self _policyForOrigin:v11 topLevelOrigin:v11];
        id v13 = v12;
        if (v12)
        {
          uint64_t v14 = [v12 permission] & v9;
          if (v14) {
            [v13 setPermission:v14];
          }
          else {
            [v26 addObject:v13];
          }
        }

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v7);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v27 = v26;
  uint64_t v15 = [v27 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v27);
        }
        cachedSettings = self->_cachedSettings;
        id v19 = *(id *)(*((void *)&v29 + 1) + 8 * v17);
        id v20 = [v19 origin];
        id v21 = [v19 topLevelOrigin];
        long long v22 = originHash(v20, v21);

        [(NSMutableDictionary *)cachedSettings removeObjectForKey:v22];
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v27 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v15);
  }

  [(WBSUserMediaPermissionController *)self _cachedSettingsDidChange];
  return 1;
}

- (id)preferenceNameForPreference:(id)a3
{
  char v3 = [(WBSUserMediaPermissionController *)self _mediaCaptureTypeForPreference:a3];
  if (v3 == (__CFString *)1)
  {
    uint64_t v4 = WBSPerSitePreferenceNameMicrophone;
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    uint64_t v4 = WBSPerSitePreferenceNameCamera;
  }
  char v3 = *v4;
LABEL_6:
  return v3;
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return &unk_1EFC22960;
}

- (BOOL)_isPreferenceValid:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_cameraMediaCapturePreference]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqual:self->_microphoneMediaCapturePreference];
  }

  return v5;
}

+ (id)localizedStringForPerSitePreferenceValue:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 integerValue] <= 2)
  {
    char v3 = _WBSLocalizedString();
  }

  return v3;
}

- (id)_standardizedURLForDomain:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  char v5 = objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");

  unint64_t v6 = NSString;
  if ([v5 length]) {
    id v7 = v5;
  }
  else {
    id v7 = v3;
  }
  uint64_t v8 = [v6 stringWithFormat:@"mediacapture://%@", v7];

  return v8;
}

- (void)_invalidateAllPermissionsForDomain:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(NSMutableDictionary *)self->_cachedSettings allValues];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v10 = [v8 topLevelOrigin];
        id v11 = [v9 URLWithString:v10];
        id v12 = objc_msgSend(v11, "safari_userVisibleHostWithoutWWWSubdomain");
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          uint64_t v14 = [v8 origin];
          uint64_t v15 = [v8 topLevelOrigin];
          uint64_t v16 = originHash(v14, v15);
          [(WBSUserMediaPermissionController *)self _invalidateCachedSettingsForOriginHash:v16];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (void)_dispatchAsyncOnInternalQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  unint64_t v6 = atomic_load((unint64_t *)&self->_savedStateLoadStatus);
  dispatch_block_t block = v4;
  if (v6)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  atomic_store(1uLL, (unint64_t *)&self->_savedStateLoadStatus);
  dispatch_resume((dispatch_object_t)self->_internalQueue);
  uint64_t v5 = block;
  if (block)
  {
LABEL_3:
    dispatch_async((dispatch_queue_t)self->_internalQueue, block);
    uint64_t v5 = block;
  }
LABEL_4:
}

- (void)_dispatchSyncOnInternalQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  unint64_t v6 = atomic_load((unint64_t *)&self->_savedStateLoadStatus);
  dispatch_block_t block = v4;
  if (v6)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  atomic_store(1uLL, (unint64_t *)&self->_savedStateLoadStatus);
  dispatch_resume((dispatch_object_t)self->_internalQueue);
  uint64_t v5 = block;
  if (block)
  {
LABEL_3:
    dispatch_sync((dispatch_queue_t)self->_internalQueue, block);
    uint64_t v5 = block;
  }
LABEL_4:
}

- (void)removeAllPermissionsWithCompletionHandler:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  microphoneMediaCapturePreference = self->_microphoneMediaCapturePreference;
  v12[0] = self->_cameraMediaCapturePreference;
  v12[1] = microphoneMediaCapturePreference;
  v13[0] = &unk_1EFC22960;
  v13[1] = &unk_1EFC22960;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__WBSUserMediaPermissionController_removeAllPermissionsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5CA0AD0;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [(WBSPerSitePreferenceManager *)self setDefaultPreferenceValues:v6 completionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __78__WBSUserMediaPermissionController_removeAllPermissionsWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __78__WBSUserMediaPermissionController_removeAllPermissionsWithCompletionHandler___block_invoke_2;
    void v5[3] = &unk_1E5C8C610;
    id v6 = *(id *)(a1 + 32);
    char v7 = a2;
    [WeakRetained resetOriginPermissionsWithCompletionHandler:v5];
  }
}

uint64_t __78__WBSUserMediaPermissionController_removeAllPermissionsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (*(unsigned char *)(a1 + 40)) {
      a2 = a2;
    }
    else {
      a2 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (WBSPerSitePreference)cameraMediaCapturePreference
{
  return self->_cameraMediaCapturePreference;
}

- (WBSPerSitePreference)microphoneMediaCapturePreference
{
  return self->_microphoneMediaCapturePreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microphoneMediaCapturePreference, 0);
  objc_storeStrong((id *)&self->_cameraMediaCapturePreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
  objc_storeStrong((id *)&self->_userMediaPermissionsFileURL, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_saveUserMediaPermissionsWriter, 0);
  objc_storeStrong((id *)&self->_cachedSettings, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

- (void)_saltForOrigin:(os_log_t)log topLevelOrigin:frameIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Attempting to check media capture permission without an origin and top level origin", v1, 2u);
}

@end