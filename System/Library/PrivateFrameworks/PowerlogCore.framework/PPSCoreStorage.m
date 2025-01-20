@interface PPSCoreStorage
+ (id)sharedFlatStorage;
+ (id)sharedSQLStorage;
+ (id)storageClassForKey:(id)a3;
+ (id)storageClassForType:(int)a3;
+ (void)setupEntryObjects;
+ (void)setupMetadataStorage;
+ (void)setupStorage;
+ (void)startAllStorage;
- (NSDictionary)storageMap;
- (PPSCoreStorage)init;
- (PPSFlatStorage)flatStorage;
- (PPSSQLStorage)sqlStorage;
- (void)mergePreUnlockDBFile;
- (void)setFlatStorage:(id)a3;
- (void)setSqlStorage:(id)a3;
- (void)setStorageMap:(id)a3;
- (void)startStorage;
@end

@implementation PPSCoreStorage

+ (id)sharedSQLStorage
{
  v2 = +[PowerlogCore sharedCore];
  v3 = [v2 coreStorage];

  v4 = [v3 sqlStorage];

  return v4;
}

- (PPSSQLStorage)sqlStorage
{
  return (PPSSQLStorage *)objc_getProperty(self, a2, 8, 1);
}

- (PPSCoreStorage)init
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities isPowerlogHelperd]) {
    goto LABEL_9;
  }
  BOOL v3 = +[PLUtilities PreUnlockTelemetryEnabled];
  v4 = PPSCoreStorageLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "PreUnlockTelemetry disabled", buf, 2u);
    }

    v6 = +[PowerlogCore sharedCore];
    v7 = [v6 storage];
    char v8 = [v7 storageLocked];

    if ((v8 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_18;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "PreUnlockTelemetry enabled", buf, 2u);
  }

LABEL_10:
  v23.receiver = self;
  v23.super_class = (Class)PPSCoreStorage;
  v10 = [(PPSCoreStorage *)&v23 init];
  if (v10)
  {
    v11 = PPSCoreStorageLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_DEFAULT, "Initializing", buf, 2u);
    }

    v12 = objc_alloc_init(PPSSQLStorage);
    [(PPSCoreStorage *)v10 setSqlStorage:v12];

    v13 = +[PowerlogCore sharedCore];
    v14 = [v13 storage];
    int v15 = [v14 storageLocked];

    sqlStorage = v10->_sqlStorage;
    if (v15)
    {
      v27 = &unk_1F15849E0;
      v28[0] = sqlStorage;
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = v28;
      v19 = &v27;
      uint64_t v20 = 1;
    }
    else
    {
      v25[0] = &unk_1F15849E0;
      v25[1] = &unk_1F15849F8;
      v26[0] = sqlStorage;
      v26[1] = sqlStorage;
      v25[2] = &unk_1F1584A10;
      v25[3] = &unk_1F1584A28;
      v26[2] = sqlStorage;
      v26[3] = sqlStorage;
      v25[4] = &unk_1F1584A40;
      v26[4] = sqlStorage;
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = v26;
      v19 = (void **)v25;
      uint64_t v20 = 5;
    }
    v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
    [(PPSCoreStorage *)v10 setStorageMap:v21];
  }
  self = v10;
  v9 = self;
LABEL_18:

  return v9;
}

- (void)startStorage
{
  v2 = PPSCoreStorageLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "Starting Storage", v3, 2u);
  }

  [MEMORY[0x1E4F89D08] buildDeviceMetadata];
  +[PPSCoreStorage setupEntryObjects];
  +[PPSCoreStorage setupMetadataStorage];
  +[PPSCoreStorage setupStorage];
  +[PPSCoreStorage startAllStorage];
}

+ (void)startAllStorage
{
  v2 = +[PowerlogCore sharedCore];
  id v5 = [v2 coreStorage];

  BOOL v3 = [v5 storageMap];
  v4 = [v3 allValues];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_50];
}

uint64_t __33__PPSCoreStorage_startAllStorage__block_invoke(uint64_t a1, void *a2)
{
  return [a2 startStorage];
}

+ (void)setupEntryObjects
{
  v2 = +[PPSCoreUtilities getAllowlist];
  id v3 = [v2 allKeys];

  [v3 enumerateObjectsUsingBlock:&__block_literal_global_31_1];
}

void __35__PPSCoreStorage_setupEntryObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F89D08] getMetadataByCategoryForSubsystem:v2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PPSCoreStorage_setupEntryObjects__block_invoke_2;
  v5[3] = &unk_1E6255668;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __35__PPSCoreStorage_setupEntryObjects__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (+[PLUtilities OverrideAllowlistEnabled]
    || (uint64_t v8 = *(void *)(a1 + 32),
        v7 = (uint64_t *)(a1 + 32),
        +[PPSCoreUtilities isAllowedSubsystem:v8 category:v5]))
  {
    [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_35_0];
  }
  else
  {
    v9 = PPSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __35__PPSCoreStorage_setupEntryObjects__block_invoke_2_cold_1(v7, (uint64_t)v5, v9);
    }
  }
}

uint64_t __35__PPSCoreStorage_setupEntryObjects__block_invoke_32()
{
  return +[PPSEntryKey setupEntryKeyForMetric:](PPSEntryKey, "setupEntryKeyForMetric:");
}

+ (void)setupMetadataStorage
{
  id v2 = +[PowerlogCore sharedCore];
  id v5 = [v2 coreStorage];

  id v3 = [v5 storageMap];
  id v4 = [v3 allValues];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_39];
}

uint64_t __38__PPSCoreStorage_setupMetadataStorage__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setupMetadataStorage];
}

+ (void)setupStorage
{
  id v2 = +[PPSEntryKey allEntryKeys];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_41];
}

void __30__PPSCoreStorage_setupStorage__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PPSCoreStorage storageClassForKey:v2];
  [v3 setupStorageForEntryKey:v2];
}

- (void)mergePreUnlockDBFile
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [MEMORY[0x1E4F89D10] containerPath];
  id v4 = [v3 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  id v5 = [v4 stringByAppendingString:@"PreUnlock/"];
  id v6 = [v5 stringByAppendingString:@"PreUnlockLog.EPSQL"];
  int v7 = [v2 fileExistsAtPath:v6];

  if (v7)
  {
    id v13 = +[PPSCoreStorage sharedSQLStorage];
    uint64_t v8 = [v13 EPSQLConnection];
    v9 = [MEMORY[0x1E4F89D10] containerPath];
    v10 = [v9 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
    v11 = [v10 stringByAppendingString:@"PreUnlock/"];
    v12 = [v11 stringByAppendingString:@"PreUnlockLog.EPSQL"];
    [v8 mergeDataFromOtherDBFile:v12];
  }
}

+ (id)storageClassForKey:(id)a3
{
  uint64_t v3 = +[PPSEntryKey storageForEntryKey:a3];
  return +[PPSCoreStorage storageClassForType:v3];
}

+ (id)storageClassForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[PowerlogCore sharedCore];
  id v5 = [v4 coreStorage];

  id v6 = [v5 storageMap];
  int v7 = [NSNumber numberWithInt:v3];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

+ (id)sharedFlatStorage
{
  id v2 = +[PowerlogCore sharedCore];
  uint64_t v3 = [v2 coreStorage];

  id v4 = [v3 flatStorage];

  return v4;
}

- (void)setSqlStorage:(id)a3
{
}

- (PPSFlatStorage)flatStorage
{
  return (PPSFlatStorage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFlatStorage:(id)a3
{
}

- (NSDictionary)storageMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStorageMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageMap, 0);
  objc_storeStrong((id *)&self->_flatStorage, 0);
  objc_storeStrong((id *)&self->_sqlStorage, 0);
}

void __35__PPSCoreStorage_setupEntryObjects__block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Subsystem %@ Category %@ not allowed", (uint8_t *)&v4, 0x16u);
}

@end