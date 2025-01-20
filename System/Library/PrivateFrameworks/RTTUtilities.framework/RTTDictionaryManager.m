@interface RTTDictionaryManager
+ (id)_availableDictionaryAssetsUsingRemoteInfo:(BOOL)a3;
- (NSArray)availableDictionaries;
- (RTTDictionaryManager)init;
- (id)_ttyDictionaryAsset;
- (void)_downloadAsset:(id)a3;
- (void)dealloc;
- (void)deleteIfNeeded;
- (void)downloadIfNeeded;
- (void)setAvailableDictionaries:(id)a3;
@end

@implementation RTTDictionaryManager

- (RTTDictionaryManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTTDictionaryManager;
  v2 = [(RTTDictionaryManager *)&v5 init];
  if (v2)
  {
    v3 = +[RTTDictionaryManager _availableDictionaryAssetsUsingRemoteInfo:1];
    [(RTTDictionaryManager *)v2 setAvailableDictionaries:v3];
  }
  return v2;
}

- (void)dealloc
{
  [(RTTDictionaryManager *)self setAvailableDictionaries:0];
  v3.receiver = self;
  v3.super_class = (Class)RTTDictionaryManager;
  [(RTTDictionaryManager *)&v3 dealloc];
}

- (void)downloadIfNeeded
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = [(RTTDictionaryManager *)self _ttyDictionaryAsset];
  v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Downloading dictionary: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3 && [v3 state] == 1)
  {
    objc_super v5 = AXLogRTT();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Asset not present - downloading", (uint8_t *)&v6, 2u);
    }

    [(RTTDictionaryManager *)self _downloadAsset:v3];
  }
}

- (void)deleteIfNeeded
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [(RTTDictionaryManager *)self _ttyDictionaryAsset];
  if (v2)
  {
    objc_super v3 = AXLogRTT();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v2;
      _os_log_impl(&dword_21FEA9000, v3, OS_LOG_TYPE_INFO, "Deleting dictionary %@", buf, 0xCu);
    }

    if ([v2 state] == 4)
    {
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __38__RTTDictionaryManager_deleteIfNeeded__block_invoke;
      v4[3] = &unk_264540408;
      id v5 = v2;
      [v5 cancelDownload:v4];
    }
    else if ([v2 state] == 2)
    {
      [v2 purgeWithError:&__block_literal_global_272];
    }
  }
}

uint64_t __38__RTTDictionaryManager_deleteIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Cancelled asset download with result %li", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(a1 + 32) purgeWithError:&__block_literal_global_1];
}

void __38__RTTDictionaryManager_deleteIfNeeded__block_invoke_267(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Purged asset with result %li, error? %@", (uint8_t *)&v6, 0x16u);
  }
}

void __38__RTTDictionaryManager_deleteIfNeeded__block_invoke_270(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Purged asset with result %li, error? %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_downloadAsset:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v5 = 0;
  if ([v3 spaceCheck:&v5])
  {
    id v4 = objc_opt_new();
    [v4 setAllowsCellularAccess:1];
    [v4 setDiscretionary:0];
    [v3 startDownload:v4 completionWithError:&__block_literal_global_274];
  }
  else
  {
    id v4 = AXLogRTT();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "Space not available to download asset %lli", buf, 0xCu);
    }
  }
}

void __39__RTTDictionaryManager__downloadAsset___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Downloaded asset with result %li, error? %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)_ttyDictionaryAsset
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_availableDictionaries;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        __int16 v8 = objc_msgSend(v7, "attributes", (void)v12);
        id v9 = [v8 objectForKey:@"DictionaryPackageName"];

        if ([v9 isEqualToString:@"TTY Abbreviations Dictionary.dictionary"])
        {
          id v10 = v7;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (id)_availableDictionaryAssetsUsingRemoteInfo:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.DictionaryServices.dictionary2"];
  uint64_t v4 = [v3 queryMetaDataSync];
  uint64_t v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    uint64_t v9 = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Queried asset metadata with result: %ld", (uint8_t *)&v8, 0xCu);
  }

  int v6 = [v3 results];

  return v6;
}

- (NSArray)availableDictionaries
{
  return self->_availableDictionaries;
}

- (void)setAvailableDictionaries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end