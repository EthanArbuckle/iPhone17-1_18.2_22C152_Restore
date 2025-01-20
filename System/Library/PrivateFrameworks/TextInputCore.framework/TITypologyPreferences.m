@interface TITypologyPreferences
- (BOOL)_typologyLoggingEnabledByInternalPreference;
- (BOOL)_typologyLoggingEnabledByProfile;
- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting;
- (BOOL)typologyLoggingEnabled;
- (BOOL)typologyLoggingEnabledByProfile;
- (NSURL)typologyDirectoryURL;
- (TITypologyProfileOptInManaging)typologyProfileOptInManager;
- (double)maxLifetimeInterval;
- (int64_t)maxBytesPersistedTypologyRecords;
- (int64_t)maxBytesPersistedTypologyTraceLogs;
- (unint64_t)persistenceStrategy;
- (void)setTypologyProfileOptInManager:(id)a3;
@end

@implementation TITypologyPreferences

- (void).cxx_destruct
{
}

- (void)setTypologyProfileOptInManager:(id)a3
{
}

- (TITypologyProfileOptInManaging)typologyProfileOptInManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_typologyProfileOptInManager);

  return (TITypologyProfileOptInManaging *)WeakRetained;
}

- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting
{
  return 0;
}

- (unint64_t)persistenceStrategy
{
  return [(TITypologyPreferences *)self _typologyLoggingEnabledByProfile];
}

- (double)maxLifetimeInterval
{
  return 259200.0;
}

- (int64_t)maxBytesPersistedTypologyTraceLogs
{
  if ([(TITypologyPreferences *)self _typologyLoggingEnabledByProfile]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return 0x200000;
  }
}

- (int64_t)maxBytesPersistedTypologyRecords
{
  if ([(TITypologyPreferences *)self _typologyLoggingEnabledByProfile]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return 0x80000;
  }
}

- (NSURL)typologyDirectoryURL
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = TI_KB_USER_DIRECTORY();
  BOOL v4 = [(TITypologyPreferences *)self _typologyLoggingEnabledByProfile];
  v5 = (void *)MEMORY[0x1E4F1CB10];
  if (v4)
  {
    v12[0] = v3;
    v6 = @"TypologyVault";
    v7 = (void **)v12;
  }
  else
  {
    v11 = v3;
    v6 = @"Typology";
    v7 = &v11;
  }
  v7[1] = v6;
  v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  v9 = [v5 fileURLWithPathComponents:v8];

  return (NSURL *)v9;
}

- (BOOL)typologyLoggingEnabledByProfile
{
  unsigned int v3 = TI_DEVICE_UNLOCKED_SINCE_BOOT();
  if (v3)
  {
    LOBYTE(v3) = [(TITypologyPreferences *)self _typologyLoggingEnabledByProfile];
  }
  return v3;
}

- (BOOL)typologyLoggingEnabled
{
  return TI_DEVICE_UNLOCKED_SINCE_BOOT()
      && ([(TITypologyPreferences *)self _typologyLoggingEnabledByProfile]
       || [(TITypologyPreferences *)self _typologyLoggingEnabledByInternalPreference]);
}

- (BOOL)_typologyLoggingEnabledByProfile
{
  v2 = [(TITypologyPreferences *)self typologyProfileOptInManager];
  unsigned int v3 = v2;
  if (v2) {
    char v4 = [v2 isProfileInstalledAndUserEnabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_typologyLoggingEnabledByInternalPreference
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (!TI_IS_INTERNAL_INSTALL::is_internal_install) {
    return 0;
  }
  v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  char v3 = [v2 BOOLForKey:53];

  return v3;
}

@end