@interface TITypologyPreferencesEnabledForTesting
- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting;
- (BOOL)typologyLoggingEnabled;
- (NSString)outpath;
- (TITypologyPreferencesEnabledForTesting)initWithOutputPath:(id)a3;
- (id)typologyDirectoryURL;
- (int64_t)maxBytesPersistedTypologyRecords;
- (int64_t)maxBytesPersistedTypologyTraceLogs;
- (void)setOutpath:(id)a3;
@end

@implementation TITypologyPreferencesEnabledForTesting

- (void).cxx_destruct
{
}

- (void)setOutpath:(id)a3
{
}

- (NSString)outpath
{
  return self->_outpath;
}

- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  return TI_IS_INTERNAL_INSTALL::is_internal_install;
}

- (int64_t)maxBytesPersistedTypologyTraceLogs
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)maxBytesPersistedTypologyRecords
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)typologyDirectoryURL
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    v4 = [(TITypologyPreferencesEnabledForTesting *)self outpath];
    v5 = [v3 fileURLWithPath:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)typologyLoggingEnabled
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  return TI_IS_INTERNAL_INSTALL::is_internal_install;
}

- (TITypologyPreferencesEnabledForTesting)initWithOutputPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITypologyPreferencesEnabledForTesting;
  v6 = [(TITypologyPreferencesEnabledForTesting *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_outpath, a3);
  }

  return v7;
}

@end