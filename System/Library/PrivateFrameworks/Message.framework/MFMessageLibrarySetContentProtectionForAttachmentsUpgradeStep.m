@interface MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep
+ (id)log;
- (BOOL)performMigrationStep;
- (MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep)initWithBaseAttachmentsDirectory:(id)a3;
- (NSURL)baseAttachmentsDirectory;
@end

@implementation MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_22 != -1) {
    dispatch_once(&log_onceToken_22, block);
  }
  v2 = (void *)log_log_22;
  return v2;
}

void __68__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_22;
  log_log_22 = (uint64_t)v1;
}

- (MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep)initWithBaseAttachmentsDirectory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep;
  v6 = [(MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseAttachmentsDirectory, a3);
  }

  return v7;
}

- (BOOL)performMigrationStep
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Starting", buf, 2u);
  }

  id obja = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep *)self baseAttachmentsDirectory];
  uint64_t v32 = *MEMORY[0x1E4F1C628];
  v44[0] = *MEMORY[0x1E4F1C628];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v6 = [obja enumeratorAtURL:v4 includingPropertiesForKeys:v5 options:0 errorHandler:&__block_literal_global_48];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v7)
  {
    uint64_t v31 = *(void *)v36;
    uint64_t v28 = *MEMORY[0x1E4F28370];
    v27 = (void *)*MEMORY[0x1E4F28348];
    *(void *)&long long v8 = 138412546;
    long long v26 = v8;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
        id v34 = 0;
        int v11 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v34, v32, 0, v26);
        id v12 = v34;
        v13 = v12;
        if (v11 && ([v12 BOOLValue] & 1) == 0)
        {
          v14 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v10 options:0 error:0];
          v15 = [v14 fileAttributes];
          v16 = [v15 objectForKey:v28];

          if (([v27 isEqualToString:v16] & 1) == 0)
          {
            v17 = [MEMORY[0x1E4F28CB8] defaultManager];
            v18 = [v10 path];
            id v33 = 0;
            char v19 = objc_msgSend(v17, "mf_protectFileAtPath:withClass:error:", v18, 2, &v33);
            id v20 = v33;

            if ((v19 & 1) == 0)
            {
              v21 = +[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep log];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = [v10 path];
                v23 = objc_msgSend(v20, "ef_publicDescription");
                *(_DWORD *)buf = v26;
                v40 = v22;
                __int16 v41 = 2114;
                v42 = v23;
                _os_log_error_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_ERROR, "Error setting the protection class on \"%@\": %{public}@", buf, 0x16u);
              }
            }
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v7);
  }

  v24 = +[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "Finished", buf, 2u);
  }

  return 1;
}

uint64_t __85__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_performMigrationStep__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = +[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_msgSend(v5, "ef_publicDescription");
    __85__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_performMigrationStep__block_invoke_cold_1((uint64_t)v4, v7, v9, v6);
  }

  return 1;
}

- (NSURL)baseAttachmentsDirectory
{
  return self->_baseAttachmentsDirectory;
}

- (void).cxx_destruct
{
}

void __85__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_performMigrationStep__block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Compression: Failed to enumerate URL [%@] due to error [%{public}@]", buf, 0x16u);
}

@end