@interface TRIPersistentUserSettings
+ (id)settingsWithKeyValueStore:(id)a3;
- (TRIKVStore)keyValueStore;
- (TRIPersistentUserSettings)initWithKeyValueStore:(id)a3;
- (id)persistedSiriLocale;
- (unsigned)persistedDiagnosticsUsageEnabled;
- (unsigned)persistedIsSiriEnabled;
- (unsigned)persistedOptOutStatus;
- (void)persistDiagnosticsUsageEnabled:(unsigned __int8)a3;
- (void)persistIsSiriEnabled:(unsigned __int8)a3;
- (void)persistOptOutStatus:(unsigned __int8)a3;
- (void)persistSiriLocale:(id)a3;
- (void)setKeyValueStore:(id)a3;
@end

@implementation TRIPersistentUserSettings

- (TRIPersistentUserSettings)initWithKeyValueStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIPersistentUserSettings;
  v6 = [(TRIPersistentUserSettings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyValueStore, a3);
  }

  return v7;
}

+ (id)settingsWithKeyValueStore:(id)a3
{
  id v3 = a3;
  v4 = [[TRIPersistentUserSettings alloc] initWithKeyValueStore:v3];

  return v4;
}

- (unsigned)persistedOptOutStatus
{
  id v3 = [(TRIPersistentUserSettings *)self keyValueStore];

  if (!v3)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
    goto LABEL_9;
  }
  v4 = [(TRIPersistentUserSettings *)self keyValueStore];
  id v5 = [v4 blobForKey:@"com.apple.triald.optout.experiment" usingTransaction:0];

  if (![v5 length])
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "No persisted opt-out state found", v9, 2u);
    }

LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  id v5 = v5;
  unsigned __int8 v6 = *(unsigned char *)[v5 bytes];
LABEL_10:

  return v6;
}

- (void)persistOptOutStatus:(unsigned __int8)a3
{
  unsigned __int8 v10 = a3;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v10 length:1];
  id v5 = [(TRIPersistentUserSettings *)self keyValueStore];

  if (v5)
  {
    if (v4)
    {
LABEL_3:
      unsigned __int8 v6 = [(TRIPersistentUserSettings *)self keyValueStore];
      [v6 setBlob:v4 forKey:@"com.apple.triald.optout.experiment" usingTransaction:0];
      goto LABEL_9;
    }
  }
  else
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }

    if (v4) {
      goto LABEL_3;
    }
  }
  unsigned __int8 v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Data to be persisted for opt-out status was nil", v8, 2u);
  }
LABEL_9:
}

- (unsigned)persistedIsSiriEnabled
{
  id v3 = [(TRIPersistentUserSettings *)self keyValueStore];

  if (!v3)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
    goto LABEL_9;
  }
  v4 = [(TRIPersistentUserSettings *)self keyValueStore];
  id v5 = [v4 blobForKey:@"com.apple.triald.persisted.userSettingsIsSiriEnabled" usingTransaction:0];

  if (![v5 length])
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "No persisted siri enablement state found", v9, 2u);
    }

LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  id v5 = v5;
  unsigned __int8 v6 = *(unsigned char *)[v5 bytes];
LABEL_10:

  return v6;
}

- (void)persistIsSiriEnabled:(unsigned __int8)a3
{
  unsigned __int8 v10 = a3;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v10 length:1];
  id v5 = [(TRIPersistentUserSettings *)self keyValueStore];

  if (v5)
  {
    if (v4)
    {
LABEL_3:
      unsigned __int8 v6 = [(TRIPersistentUserSettings *)self keyValueStore];
      [v6 setBlob:v4 forKey:@"com.apple.triald.persisted.userSettingsIsSiriEnabled" usingTransaction:0];
      goto LABEL_9;
    }
  }
  else
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }

    if (v4) {
      goto LABEL_3;
    }
  }
  unsigned __int8 v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Data to be persisted for siri enablement was nil", v8, 2u);
  }
LABEL_9:
}

- (id)persistedSiriLocale
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(TRIPersistentUserSettings *)self keyValueStore];

  if (v3)
  {
    v4 = [(TRIPersistentUserSettings *)self keyValueStore];
    id v5 = [v4 blobForKey:@"com.apple.triald.persisted.userSettingsSiriLocale" usingTransaction:0];

    if (v5 && [v5 length])
    {
      unsigned __int8 v6 = (void *)MEMORY[0x1E4F28DC0];
      v7 = (void *)MEMORY[0x1E016E7F0]();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
      id v15 = 0;
      objc_super v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v5 error:&v15];
      unsigned __int8 v10 = v15;

      if (v10)
      {
        v11 = TRILogCategory_Server();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Unable to unarchive siri locale from Trial persisted storage, encountered: %@", buf, 0xCu);
        }

        v12 = &stru_1F3455898;
      }
      else
      {
        v13 = &stru_1F3455898;
        if (v9) {
          v13 = v9;
        }
        v12 = v13;
      }
    }
    else
    {
      unsigned __int8 v10 = TRILogCategory_Server();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "No persisted siri locale found", buf, 2u);
      }
      v12 = &stru_1F3455898;
    }
  }
  else
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
    v12 = &stru_1F3455898;
  }

  return v12;
}

- (void)persistSiriLocale:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIPersistentUserSettings.m", 116, @"Invalid parameter not satisfying: %@", @"siriLocale" object file lineNumber description];
  }
  unsigned __int8 v6 = [(TRIPersistentUserSettings *)self keyValueStore];

  if (!v6)
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
  }
  id v15 = 0;
  v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:0 error:&v15];
  id v9 = v15;
  if (!v9)
  {
    if (v8)
    {
      unsigned __int8 v10 = [(TRIPersistentUserSettings *)self keyValueStore];
      [v10 setBlob:v8 forKey:@"com.apple.triald.persisted.userSettingsSiriLocale" usingTransaction:0];
      goto LABEL_14;
    }
    unsigned __int8 v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v11 = "Data to be persisted for siri locale was nil";
    v12 = v10;
    uint32_t v13 = 2;
    goto LABEL_10;
  }
  unsigned __int8 v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    v11 = "Unable to archive siri locale from Trial persisted storage, encountered: %@";
    v12 = v10;
    uint32_t v13 = 12;
LABEL_10:
    _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
  }
LABEL_14:
}

- (unsigned)persistedDiagnosticsUsageEnabled
{
  id v3 = [(TRIPersistentUserSettings *)self keyValueStore];

  if (!v3)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }
    goto LABEL_9;
  }
  v4 = [(TRIPersistentUserSettings *)self keyValueStore];
  id v5 = [v4 blobForKey:@"com.apple.triald.persisted.diagnosticsUsageEnabled" usingTransaction:0];

  if (![v5 length])
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "No persisted diagnostics and usage state found", v9, 2u);
    }

LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  id v5 = v5;
  unsigned __int8 v6 = *(unsigned char *)[v5 bytes];
LABEL_10:

  return v6;
}

- (void)persistDiagnosticsUsageEnabled:(unsigned __int8)a3
{
  unsigned __int8 v10 = a3;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v10 length:1];
  id v5 = [(TRIPersistentUserSettings *)self keyValueStore];

  if (v5)
  {
    if (v4)
    {
LABEL_3:
      unsigned __int8 v6 = [(TRIPersistentUserSettings *)self keyValueStore];
      [v6 setBlob:v4 forKey:@"com.apple.triald.persisted.diagnosticsUsageEnabled" usingTransaction:0];
      goto LABEL_9;
    }
  }
  else
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "No key-value store present", buf, 2u);
    }

    if (v4) {
      goto LABEL_3;
    }
  }
  unsigned __int8 v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Data to be persisted for diagnostics and usage was nil", v8, 2u);
  }
LABEL_9:
}

- (TRIKVStore)keyValueStore
{
  return self->_keyValueStore;
}

- (void)setKeyValueStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end