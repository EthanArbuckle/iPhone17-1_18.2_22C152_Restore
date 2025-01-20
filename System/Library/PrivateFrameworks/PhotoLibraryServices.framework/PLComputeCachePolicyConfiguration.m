@interface PLComputeCachePolicyConfiguration
- (BOOL)isBackupEnabled;
- (BOOL)isRestoreEnabled;
- (PLComputeCachePolicyConfiguration)initWithConfigurationDictionary:(id)a3;
- (double)minSnapshotTimeInterval;
- (unint64_t)ambientSuggestionEntryLimit;
- (unint64_t)minAssetCount;
- (unint64_t)minCloudStorageTier;
- (unint64_t)minExpungedAssetCount;
- (void)configurationValueForKey:(id)a3 configurationDictionary:(id)a4 valueBlock:(id)a5;
@end

@implementation PLComputeCachePolicyConfiguration

- (unint64_t)ambientSuggestionEntryLimit
{
  return self->_ambientSuggestionEntryLimit;
}

- (unint64_t)minExpungedAssetCount
{
  return self->_minExpungedAssetCount;
}

- (double)minSnapshotTimeInterval
{
  return self->_minSnapshotTimeInterval;
}

- (unint64_t)minCloudStorageTier
{
  return self->_minCloudStorageTier;
}

- (unint64_t)minAssetCount
{
  return self->_minAssetCount;
}

- (BOOL)isRestoreEnabled
{
  return self->_isRestoreEnabled;
}

- (BOOL)isBackupEnabled
{
  return self->_isBackupEnabled;
}

- (void)configurationValueForKey:(id)a3 configurationDictionary:(id)a4 valueBlock:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = [a4 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v9)
    {
      v10 = PLMigrationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138543618;
        id v12 = v7;
        __int16 v13 = 2114;
        v14 = v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "ComputeCachePolicy: Configuration override for key %{public}@ with value %{public}@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {

    v9 = 0;
  }
  v8[2](v8, v9);
}

- (PLComputeCachePolicyConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PLComputeCachePolicyConfiguration;
  v5 = [(PLComputeCachePolicyConfiguration *)&v29 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v4;
    }
    else {
      v6 = 0;
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke;
    v27[3] = &unk_1E5870018;
    id v7 = v5;
    v28 = v7;
    id v8 = v6;
    [(PLComputeCachePolicyConfiguration *)v7 configurationValueForKey:@"backupFeatureVersion" configurationDictionary:v8 valueBlock:v27];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_2;
    v25[3] = &unk_1E5870018;
    v9 = v7;
    v26 = v9;
    [(PLComputeCachePolicyConfiguration *)v9 configurationValueForKey:@"restoreFeatureVersion" configurationDictionary:v8 valueBlock:v25];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_3;
    v23[3] = &unk_1E5870018;
    v10 = v9;
    v24 = v10;
    [(PLComputeCachePolicyConfiguration *)v10 configurationValueForKey:@"minAssetCount" configurationDictionary:v8 valueBlock:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_4;
    v21[3] = &unk_1E5870018;
    int v11 = v10;
    v22 = v11;
    [(PLComputeCachePolicyConfiguration *)v11 configurationValueForKey:@"minCloudStorageTier" configurationDictionary:v8 valueBlock:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_5;
    v19[3] = &unk_1E5870018;
    id v12 = v11;
    v20 = v12;
    [(PLComputeCachePolicyConfiguration *)v12 configurationValueForKey:@"minSnapshotTimeInterval" configurationDictionary:v8 valueBlock:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_6;
    v17[3] = &unk_1E5870018;
    __int16 v13 = v12;
    v18 = v13;
    [(PLComputeCachePolicyConfiguration *)v13 configurationValueForKey:@"minExpungedAssetCount" configurationDictionary:v8 valueBlock:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_7;
    v15[3] = &unk_1E5870018;
    v16 = v13;
    [(PLComputeCachePolicyConfiguration *)v16 configurationValueForKey:@"ambientSuggestionEntryLimit" configurationDictionary:v8 valueBlock:v15];
  }
  return v5;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = result;
  if (a2)
  {
    result = [a2 unsignedShortValue];
    BOOL v3 = result == 0;
  }
  else
  {
    BOOL v3 = 1;
  }
  *(unsigned char *)(*(void *)(v2 + 32) + 8) = v3;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2 = result;
  if (a2)
  {
    result = [a2 unsignedShortValue];
    BOOL v3 = result == 0;
  }
  else
  {
    BOOL v3 = 1;
  }
  *(unsigned char *)(*(void *)(v2 + 32) + 9) = v3;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t result = [a2 unsignedIntegerValue];
  }
  else {
    uint64_t result = 2000;
  }
  *(void *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t result = [a2 unsignedLongLongValue];
  }
  else {
    uint64_t result = 10000000000;
  }
  *(void *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

unint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_5(unint64_t result, void *a2)
{
  unint64_t v2 = result;
  if (a2)
  {
    uint64_t result = [a2 unsignedIntegerValue];
    double v3 = (double)result;
  }
  else
  {
    double v3 = 1209600.0;
  }
  *(double *)(*(void *)(v2 + 32) + 32) = v3;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_6(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t result = [a2 unsignedIntegerValue];
  }
  else {
    uint64_t result = 1;
  }
  *(void *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_7(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t result = [a2 unsignedIntegerValue];
  }
  else {
    uint64_t result = 100;
  }
  *(void *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

@end