@interface PLCPLSettings
+ (BOOL)setPrefetchMode:(int64_t)a3 withLibraryBundle:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (PLCPLSettings)settingsWithLibraryBundle:(id)a3;
+ (PLCPLSettings)settingsWithPathManager:(id)a3;
- (BOOL)_writeSettingsPayload:(id)a3 notify:(BOOL)a4 error:(id *)a5 didWriteValueBlock:(id)a6;
- (BOOL)_writeSettingsValue:(id)a3 forKey:(id)a4 persist:(BOOL)a5 notify:(BOOL)a6 error:(id *)a7 didWriteValueBlock:(id)a8;
- (BOOL)clearRunOnceFlag:(unint64_t)a3 error:(id *)a4;
- (BOOL)isAppLibrary;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isICPLEnabled;
- (BOOL)isKeepOriginalsEnabled;
- (BOOL)migrateSettings:(id *)a3;
- (BOOL)runOnceFlagIsSet:(unint64_t)a3;
- (BOOL)setICPLEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4;
- (BOOL)setRunOnceFlag:(unint64_t)a3 error:(id *)a4;
- (PLCPLSettings)initWithCoder:(id)a3;
- (PLCPLSettings)initWithLibraryBundle:(id)a3;
- (PLPhotoLibraryBundle)libraryBundle;
- (id)_readLegacyBoolDefaultForKey:(id)a3;
- (id)_readSettingsPayload;
- (id)debugDescription;
- (id)deriveMainScopeIdentifier;
- (id)fingerprintContext;
- (int64_t)prefetchMode;
- (unint64_t)runOnceFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLCPLSettings

- (PLCPLSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLCPLSettings;
  v5 = [(PLCPLSettings *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_iCPLEnabled = [v4 decodeBoolForKey:@"iCPLEnabled"];
    v6->_prefetchMode = [v4 decodeIntegerForKey:@"PrefetchMode"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LibraryIdentifier"];
    libraryIdentifier = v6->_libraryIdentifier;
    v6->_libraryIdentifier = (PLPhotoLibraryIdentifier *)v7;
  }
  return v6;
}

uint64_t __29__PLCPLSettings_prefetchMode__block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 56);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  [v5 encodeBool:self->_iCPLEnabled forKey:@"iCPLEnabled"];
  [v5 encodeInteger:self->_prefetchMode forKey:@"PrefetchMode"];
  libraryIdentifier = self->_libraryIdentifier;
  if (libraryIdentifier) {
    [v5 encodeObject:libraryIdentifier forKey:@"LibraryIdentifier"];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isKeepOriginalsEnabled
{
  return [(PLCPLSettings *)self prefetchMode] == 1;
}

- (int64_t)prefetchMode
{
  return PLIntegerResultWithUnfairLock();
}

+ (PLCPLSettings)settingsWithLibraryBundle:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:a1 file:@"PLCPLSettings.m" lineNumber:71 description:@"Missing library bundle"];
  }
  uint64_t v7 = [v6 libraryServicesManager];

  if (v7)
  {
    v8 = [v6 libraryServicesManager];
    v9 = [v8 cplSettings];
  }
  else
  {
    objc_super v10 = [v6 assetsdClient];
    v8 = [v10 cloudInternalClient];

    if (!v8)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:a1 file:@"PLCPLSettings.m" lineNumber:76 description:@"No cloudInternalClient"];
    }
    uint64_t v11 = [v8 getCPLSettings];
    v9 = (void *)v11;
    if (v11) {
      objc_storeStrong((id *)(v11 + 16), a3);
    }
  }

  return (PLCPLSettings *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_appPrivateData, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
}

- (PLPhotoLibraryBundle)libraryBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 16, 1);
}

- (id)_readLegacyBoolDefaultForKey:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    id v4 = [NSNumber numberWithUnsignedChar:AppBooleanValue];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)migrateSettings:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  id v6 = PLReadCloudPhotoLibraryKeepOriginalsEnabled_Legacy();
  if (!v6)
  {
    id v6 = [(PLCPLSettings *)self _readLegacyBoolDefaultForKey:@"keepOriginals"];
  }
  uint64_t v7 = [(PLCPLSettings *)self _readLegacyBoolDefaultForKey:@"handleOptimizeModeChange"];
  unsigned int v8 = [v7 BOOLValue];

  uint64_t v9 = v8;
  objc_super v10 = [(PLCPLSettings *)self _readLegacyBoolDefaultForKey:@"sendOptimizeSettingFeedback"];
  int v11 = [v10 BOOLValue];

  if (v11) {
    v9 |= 2uLL;
  }
  v12 = [(PLCPLSettings *)self _readLegacyBoolDefaultForKey:@"markPurgeableResources"];
  int v13 = [v12 BOOLValue];

  if (v13) {
    v9 |= 4uLL;
  }
  v14 = [(PLCPLSettings *)self _readLegacyBoolDefaultForKey:@"clearPurgeableResources"];
  int v15 = [v14 BOOLValue];

  if (v15) {
    v9 |= 8uLL;
  }
  v16 = [(PLCPLSettings *)self _readLegacyBoolDefaultForKey:@"repushVideoAssetsMetadata"];
  int v17 = [v16 BOOLValue];

  if (v17) {
    v9 |= 0x10uLL;
  }
  v18 = [(PLCPLSettings *)self _readLegacyBoolDefaultForKey:@"repushMasterMissingMetadata"];
  int v19 = [v18 BOOLValue];

  if (v19) {
    v9 |= 0x20uLL;
  }
  v20 = [(PLCPLSettings *)self _readLegacyBoolDefaultForKey:@"repushAssetsWithImportedByBundleIdentifier"];
  int v21 = [v20 BOOLValue];

  if (v21) {
    uint64_t v22 = v9 | 0x40;
  }
  else {
    uint64_t v22 = v9;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v24 = [(PLCPLSettings *)self _readSettingsPayload];
  v25 = (void *)[v23 initWithDictionary:v24];

  if (!v6)
  {
    uint64_t v26 = 0;
    if (!v22) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v26 = [v6 BOOLValue];
  v27 = [NSNumber numberWithInteger:v26];
  [v25 setObject:v27 forKeyedSubscript:@"PrefetchMode"];

  if (v22)
  {
LABEL_18:
    [v25 objectForKeyedSubscript:@"RunOnceFlags"];
    v28 = p_lock;
    v30 = v29 = a3;
    uint64_t v31 = [v30 unsignedIntegerValue];

    v32 = [NSNumber numberWithUnsignedInteger:v31 | v22];
    [v25 setObject:v32 forKeyedSubscript:@"RunOnceFlags"];

    a3 = v29;
    p_lock = v28;
  }
LABEL_19:
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __33__PLCPLSettings_migrateSettings___block_invoke;
  v35[3] = &unk_1E5873348;
  v35[4] = self;
  v35[5] = v26;
  BOOL v33 = [(PLCPLSettings *)self _writeSettingsPayload:v25 notify:0 error:a3 didWriteValueBlock:v35];
  os_unfair_lock_unlock(p_lock);

  return v33;
}

uint64_t __33__PLCPLSettings_migrateSettings___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = *(void *)(result + 40);
  return result;
}

- (BOOL)_writeSettingsPayload:(id)a3 notify:(BOOL)a4 error:(id *)a5 didWriteValueBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  int v11 = (void (**)(void))a6;
  if (v10
    && ![(PLAppPrivateData *)self->_appPrivateData setValue:v10 forKeyPath:@"Library.CPL" error:a5])
  {
    BOOL v13 = 0;
  }
  else
  {
    if (v11) {
      v11[2](v11);
    }
    if (v8)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PLCPLSettingsDidChangeNotification", 0, 0, 0);
    }
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)_writeSettingsValue:(id)a3 forKey:(id)a4 persist:(BOOL)a5 notify:(BOOL)a6 error:(id *)a7 didWriteValueBlock:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a8;
  if (v10)
  {
    int v15 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v16 = a4;
    id v17 = a3;
    id v18 = [v15 alloc];
    int v19 = [(PLCPLSettings *)self _readSettingsPayload];
    v20 = (void *)[v18 initWithDictionary:v19];

    [v20 setObject:v17 forKeyedSubscript:v16];
  }
  else
  {
    v20 = 0;
  }
  BOOL v21 = [(PLCPLSettings *)self _writeSettingsPayload:v20 notify:v9 error:a7 didWriteValueBlock:v14];

  return v21;
}

- (id)_readSettingsPayload
{
  v2 = [(PLAppPrivateData *)self->_appPrivateData valueForKeyPath:@"Library.CPL"];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v5 = v4;

  return v5;
}

- (id)fingerprintContext
{
  return (id)[MEMORY[0x1E4F59890] sharedContext];
}

- (id)deriveMainScopeIdentifier
{
  if ([(PLCPLSettings *)self isAppLibrary])
  {
    v3 = [(PLPhotoLibraryIdentifier *)self->_libraryIdentifier containerIdentifier];
    id v4 = [(PLPhotoLibraryIdentifier *)self->_libraryIdentifier uuid];
    id v5 = CPLMainScopeIdentifierForApp();
  }
  else
  {
    id v5 = CPLPrimaryScopeIdentifierForCurrentUniverse();
  }
  return v5;
}

- (BOOL)clearRunOnceFlag:(unint64_t)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v8 = [(PLCPLSettings *)self runOnceFlags];
  BOOL v9 = [NSNumber numberWithUnsignedInteger:v8 & ~a3];
  LOBYTE(a4) = [(PLCPLSettings *)self _writeSettingsValue:v9 forKey:@"RunOnceFlags" persist:1 notify:0 error:a4 didWriteValueBlock:0];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)setRunOnceFlag:(unint64_t)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v8 = [(PLCPLSettings *)self runOnceFlags];
  BOOL v9 = [NSNumber numberWithUnsignedInteger:v8 | a3];
  LOBYTE(a4) = [(PLCPLSettings *)self _writeSettingsValue:v9 forKey:@"RunOnceFlags" persist:1 notify:0 error:a4 didWriteValueBlock:0];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)runOnceFlagIsSet:(unint64_t)a3
{
  return PLBoolResultWithUnfairLock();
}

BOOL __34__PLCPLSettings_runOnceFlagIsSet___block_invoke(uint64_t a1)
{
  return (*(void *)(a1 + 40) & [*(id *)(a1 + 32) runOnceFlags]) != 0;
}

- (unint64_t)runOnceFlags
{
  v2 = [(PLCPLSettings *)self _readSettingsPayload];
  v3 = [v2 objectForKeyedSubscript:@"RunOnceFlags"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  if ([(PLPhotoLibraryBundle *)self->_libraryBundle isSystemPhotoLibrary])
  {
    v3 = (__CFString *)*MEMORY[0x1E4F17570];
LABEL_5:
    LOBYTE(v4) = _PLIsCloudPhotoLibraryEnabledForCurrentUserWithDataclass(v3);
    return v4;
  }
  if ([(PLPhotoLibraryIdentifier *)self->_libraryIdentifier isImagePlaygroundDefaultLibraryIdentifier])
  {
    v3 = @"com.apple.Dataclass.ImagePlayground";
    goto LABEL_5;
  }
  int v4 = [(PLCPLSettings *)self isAppLibrary];
  if (v4)
  {
    LOBYTE(v4) = [(PLCPLSettings *)self isICPLEnabled];
  }
  return v4;
}

- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_appPrivateData && self->_prefetchMode != a3)
  {
    BOOL v9 = [NSNumber numberWithInteger:a3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__PLCPLSettings_setPrefetchMode_error___block_invoke;
    v11[3] = &unk_1E5873348;
    v11[4] = self;
    v11[5] = a3;
    BOOL v8 = [(PLCPLSettings *)self _writeSettingsValue:v9 forKey:@"PrefetchMode" persist:1 notify:1 error:a4 didWriteValueBlock:v11];
  }
  else
  {
    BOOL v8 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

void __39__PLCPLSettings_setPrefetchMode_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(a1 + 40);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.PLNotificationKeepOriginalsChanged", 0, 0, 1u);
}

- (BOOL)setICPLEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_appPrivateData && self->_iCPLEnabled != v5)
  {
    if ([(PLPhotoLibraryBundle *)self->_libraryBundle isSystemPhotoLibrary]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [(PLPhotoLibraryIdentifier *)self->_libraryIdentifier isImagePlaygroundDefaultLibraryIdentifier] ^ 1;
    }
    BOOL v10 = [NSNumber numberWithBool:v5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__PLCPLSettings_setICPLEnabled_error___block_invoke;
    v12[3] = &unk_1E58748B0;
    v12[4] = self;
    BOOL v13 = v5;
    BOOL v8 = [(PLCPLSettings *)self _writeSettingsValue:v10 forKey:@"iCPLEnabled" persist:v9 notify:1 error:a4 didWriteValueBlock:v12];
  }
  else
  {
    BOOL v8 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

uint64_t __38__PLCPLSettings_setICPLEnabled_error___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isICPLEnabled
{
  return PLBoolResultWithUnfairLock();
}

uint64_t __30__PLCPLSettings_isICPLEnabled__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
}

- (BOOL)isAppLibrary
{
  return [(PLPhotoLibraryIdentifier *)self->_libraryIdentifier domain] == 3;
}

- (id)debugDescription
{
  v9.receiver = self;
  v9.super_class = (Class)PLCPLSettings;
  v3 = [(PLCPLSettings *)&v9 description];
  int v4 = @"yes";
  if ([(PLCPLSettings *)self isICPLEnabled]) {
    BOOL v5 = @"yes";
  }
  else {
    BOOL v5 = @"no";
  }
  if (![(PLCPLSettings *)self isAppLibrary]) {
    int v4 = @"no";
  }
  id v6 = +[PLCloudResourcePrefetchManager descriptionForPrefetchMode:[(PLCPLSettings *)self prefetchMode]];
  uint64_t v7 = [v3 stringByAppendingFormat:@": isICPLEnabled: %@, isAppLibary: %@, prefetchMode: %@", v5, v4, v6];

  return v7;
}

- (PLCPLSettings)initWithLibraryBundle:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLCPLSettings;
  id v6 = [(PLCPLSettings *)&v20 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_libraryBundle, a3);
    BOOL v8 = (void *)MEMORY[0x1E4F8B858];
    objc_super v9 = [v5 libraryURL];
    uint64_t v10 = [v8 appPrivateDataForLibraryURL:v9];
    appPrivateData = v7->_appPrivateData;
    v7->_appPrivateData = (PLAppPrivateData *)v10;

    v12 = [v5 libraryURL];
    uint64_t v13 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v12 createIfMissing:0 error:0];
    libraryIdentifier = v7->_libraryIdentifier;
    v7->_libraryIdentifier = (PLPhotoLibraryIdentifier *)v13;

    int v15 = [(PLCPLSettings *)v7 _readSettingsPayload];
    if ([v5 isSystemPhotoLibrary])
    {
      id v16 = (__CFString *)*MEMORY[0x1E4F17570];
    }
    else
    {
      if (![(PLPhotoLibraryIdentifier *)v7->_libraryIdentifier isImagePlaygroundDefaultLibraryIdentifier])
      {
        id v17 = [v15 objectForKeyedSubscript:@"iCPLEnabled"];
        v7->_iCPLEnabled = [v17 BOOLValue];

        goto LABEL_8;
      }
      id v16 = @"com.apple.Dataclass.ImagePlayground";
    }
    v7->_iCPLEnabled = _PLIsCloudPhotoLibraryEnabledForCurrentUserWithDataclass(v16);
LABEL_8:
    id v18 = [v15 objectForKeyedSubscript:@"PrefetchMode"];
    v7->_prefetchMode = [v18 integerValue];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)setPrefetchMode:(int64_t)a3 withLibraryBundle:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = [v7 libraryServicesManager];

  if (v8)
  {
    objc_super v9 = [v7 libraryServicesManager];

    uint64_t v10 = [v9 cloudPhotoLibraryManager];

    if (!v10)
    {
      int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41022 userInfo:0];
      v12 = v11;
      if (a5) {
        *a5 = v11;
      }
LABEL_10:

      char v14 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v13 = [v7 assetsdClient];

    uint64_t v10 = [v13 cloudInternalClient];

    if (!v10)
    {
      int v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F8C500];
      uint64_t v20 = *MEMORY[0x1E4F28228];
      v21[0] = @"no cloud internal client";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v17 = [v15 errorWithDomain:v16 code:44001 userInfo:v12];
      id v18 = v17;
      if (a5) {
        *a5 = v17;
      }

      goto LABEL_10;
    }
  }
  char v14 = [v10 setPrefetchMode:a3 error:a5];
LABEL_11:

  return v14;
}

+ (PLCPLSettings)settingsWithPathManager:(id)a3
{
  id v4 = a3;
  id v5 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v6 = [v4 libraryURL];

  id v7 = [v5 openBundleAtLibraryURL:v6];

  BOOL v8 = [a1 settingsWithLibraryBundle:v7];

  return (PLCPLSettings *)v8;
}

@end