@interface WBSOnDeviceSearchSuggestionsModelManager
+ (WBSOnDeviceSearchSuggestionsModelManager)sharedManager;
- (BOOL)haveModelForLocale:(id)a3;
- (BOOL)isLocaleSupported:(id)a3;
- (BOOL)needsSupportedLocaleUpdate;
- (WBSOnDeviceSearchSuggestionsModelManager)init;
- (id)_dictionaryToSave;
- (id)currentChecksumForModelWithLocale:(id)a3;
- (id)fileURLForModelWithLocale:(id)a3;
- (id)fileURLForModelWithLocaleIfDownloaded:(id)a3;
- (void)_updateModelFileOnDisk;
- (void)addOrUpdateModelForLocale:(id)a3 withChecksum:(id)a4;
- (void)clearModels;
- (void)updateSupportedModelLocales:(id)a3;
@end

@implementation WBSOnDeviceSearchSuggestionsModelManager

+ (WBSOnDeviceSearchSuggestionsModelManager)sharedManager
{
  if (sharedManager_onceToken_4 != -1) {
    dispatch_once(&sharedManager_onceToken_4, &__block_literal_global_83);
  }
  v2 = (void *)sharedManager_sharedManager_2;
  return (WBSOnDeviceSearchSuggestionsModelManager *)v2;
}

void __57__WBSOnDeviceSearchSuggestionsModelManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSOnDeviceSearchSuggestionsModelManager);
  v1 = (void *)sharedManager_sharedManager_2;
  sharedManager_sharedManager_2 = (uint64_t)v0;
}

- (WBSOnDeviceSearchSuggestionsModelManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)WBSOnDeviceSearchSuggestionsModelManager;
  v2 = [(WBSOnDeviceSearchSuggestionsModelManager *)&v18 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = urlForOfflineSearchDirectory();
    id v5 = (id)objc_msgSend(v3, "safari_ensureDirectoryExists:", v4);

    v6 = urlForOfflineSearchModelPlist();
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [v6 path];
    char v9 = [v7 fileExistsAtPath:v8];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfURL:v6];
      v11 = [v10 objectForKeyedSubscript:@"SupportedLocales"];
      [(WBSOnDeviceSearchSuggestionsModelManager *)v2 updateSupportedModelLocales:v11];

      v12 = [v10 objectForKeyedSubscript:@"DownloadedModels"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v13 = (NSMutableDictionary *)[v12 mutableCopy];
      }
      else {
        v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      localeIdentifiersToChecksums = v2->_localeIdentifiersToChecksums;
      v2->_localeIdentifiersToChecksums = v13;
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
      v10 = v2->_localeIdentifiersToChecksums;
      v2->_localeIdentifiersToChecksums = (NSMutableDictionary *)v14;
    }

    v16 = v2;
  }

  return v2;
}

- (BOOL)needsSupportedLocaleUpdate
{
  return [(NSSet *)self->_supportedLocaleIdentifiers count] == 0;
}

- (void)addOrUpdateModelForLocale:(id)a3 withChecksum:(id)a4
{
  localeIdentifiersToChecksums = self->_localeIdentifiersToChecksums;
  id v7 = a4;
  v8 = objc_msgSend(a3, "safari_localeStringInOfflineSearchModelFormat");
  [(NSMutableDictionary *)localeIdentifiersToChecksums setObject:v7 forKeyedSubscript:v8];

  [(WBSOnDeviceSearchSuggestionsModelManager *)self _updateModelFileOnDisk];
}

- (void)updateSupportedModelLocales:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    supportedLocaleIdentifiers = self->_supportedLocaleIdentifiers;
    self->_supportedLocaleIdentifiers = v4;

    [(WBSOnDeviceSearchSuggestionsModelManager *)self _updateModelFileOnDisk];
  }
}

- (void)clearModels
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = urlForOfflineSearchDirectory();
  objc_msgSend(v3, "safari_removeContentsOfDirectory:", v4);

  [(NSMutableDictionary *)self->_localeIdentifiersToChecksums removeAllObjects];
  supportedLocaleIdentifiers = self->_supportedLocaleIdentifiers;
  self->_supportedLocaleIdentifiers = 0;
}

- (id)fileURLForModelWithLocale:(id)a3
{
  id v3 = a3;
  v4 = urlForOfflineSearchDirectory();
  id v5 = NSString;
  id v6 = objc_msgSend(v3, "safari_localeStringInOfflineSearchModelFormat");

  id v7 = [v5 stringWithFormat:@"%@.bin", v6];
  v8 = [v4 URLByAppendingPathComponent:v7];

  return v8;
}

- (id)fileURLForModelWithLocaleIfDownloaded:(id)a3
{
  id v4 = a3;
  if ([(WBSOnDeviceSearchSuggestionsModelManager *)self haveModelForLocale:v4])
  {
    id v5 = [(WBSOnDeviceSearchSuggestionsModelManager *)self fileURLForModelWithLocale:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)haveModelForLocale:(id)a3
{
  localeIdentifiersToChecksums = self->_localeIdentifiersToChecksums;
  id v4 = objc_msgSend(a3, "safari_localeStringInOfflineSearchModelFormat");
  id v5 = [(NSMutableDictionary *)localeIdentifiersToChecksums objectForKeyedSubscript:v4];
  LOBYTE(localeIdentifiersToChecksums) = v5 != 0;

  return (char)localeIdentifiersToChecksums;
}

- (BOOL)isLocaleSupported:(id)a3
{
  supportedLocaleIdentifiers = self->_supportedLocaleIdentifiers;
  id v4 = objc_msgSend(a3, "safari_localeStringInOfflineSearchModelFormat");
  LOBYTE(supportedLocaleIdentifiers) = [(NSSet *)supportedLocaleIdentifiers containsObject:v4];

  return (char)supportedLocaleIdentifiers;
}

- (id)currentChecksumForModelWithLocale:(id)a3
{
  localeIdentifiersToChecksums = self->_localeIdentifiersToChecksums;
  id v4 = objc_msgSend(a3, "safari_localeStringInOfflineSearchModelFormat");
  id v5 = [(NSMutableDictionary *)localeIdentifiersToChecksums objectForKeyedSubscript:v4];

  return v5;
}

- (void)_updateModelFileOnDisk
{
  asyncWriter = self->_asyncWriter;
  if (!asyncWriter)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F97E70]);
    id v5 = urlForOfflineSearchModelPlist();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__WBSOnDeviceSearchSuggestionsModelManager__updateModelFileOnDisk__block_invoke;
    v8[3] = &unk_1E5C9E008;
    v8[4] = self;
    id v6 = (WBSCoalescedAsynchronousWriter *)[v4 initWithName:@"OfflineModelPlist" fileURL:v5 dataSourceBlock:v8];
    id v7 = self->_asyncWriter;
    self->_asyncWriter = v6;

    asyncWriter = self->_asyncWriter;
  }
  [(WBSCoalescedAsynchronousWriter *)asyncWriter scheduleWrite];
}

id __66__WBSOnDeviceSearchSuggestionsModelManager__updateModelFileOnDisk__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F28F98];
  v2 = [*(id *)(a1 + 32) _dictionaryToSave];
  id v7 = 0;
  id v3 = [v1 dataWithPropertyList:v2 format:200 options:0 error:&v7];
  id v4 = v7;

  if (v4)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __66__WBSOnDeviceSearchSuggestionsModelManager__updateModelFileOnDisk__block_invoke_cold_1(v5, v4);
    }
  }

  return v3;
}

- (id)_dictionaryToSave
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"SupportedLocales";
  uint64_t v3 = [(NSSet *)self->_supportedLocaleIdentifiers allObjects];
  id v4 = (void *)v3;
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  if (v3) {
    uint64_t v5 = v3;
  }
  v9[1] = @"DownloadedModels";
  localeIdentifiersToChecksums = self->_localeIdentifiersToChecksums;
  if (!localeIdentifiersToChecksums) {
    localeIdentifiersToChecksums = (NSMutableDictionary *)MEMORY[0x1E4F1CC08];
  }
  v10[0] = v5;
  v10[1] = localeIdentifiersToChecksums;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_asyncWriter, 0);
  objc_storeStrong((id *)&self->_localeIdentifiersToChecksums, 0);
}

void __66__WBSOnDeviceSearchSuggestionsModelManager__updateModelFileOnDisk__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Failed to serialize OfflineSearch plist: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end