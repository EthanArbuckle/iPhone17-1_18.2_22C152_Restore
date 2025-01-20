@interface WBSChromeExtensionsImporter
- (BOOL)_checkNotAtRootLevel;
- (BOOL)_isParsingExtension;
- (BOOL)_isParsingExtensionsArray;
- (BOOL)_openBrowserExtensionMappingJSONFile;
- (BOOL)jsonReader:(id)a3 appendKey:(id)a4;
- (BOOL)jsonReader:(id)a3 error:(id)a4;
- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4;
- (BOOL)jsonReaderBeginArray:(id)a3;
- (BOOL)jsonReaderBeginObject:(id)a3;
- (BOOL)jsonReaderEndArray:(id)a3;
- (BOOL)jsonReaderEndObject:(id)a3;
- (WBSChromeExtensionsImporter)init;
- (WBSExtensionsImporterDelegate)delegate;
- (id)_popKeyFromStackIfPossible;
- (void)_openBrowserExtensionMappingJSONFile;
- (void)parseFileHandle:(id)a3 completionHandler:(id)a4;
- (void)parseURL:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation WBSChromeExtensionsImporter

- (WBSChromeExtensionsImporter)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSChromeExtensionsImporter;
  v2 = [(WBSChromeExtensionsImporter *)&v7 init];
  if (v2
    && ([MEMORY[0x1E4F1CA60] dictionary],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        browserExtensionMapping = v2->_browserExtensionMapping,
        v2->_browserExtensionMapping = (NSMutableDictionary *)v3,
        browserExtensionMapping,
        [(WBSChromeExtensionsImporter *)v2 _openBrowserExtensionMappingJSONFile]))
  {
    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_openBrowserExtensionMappingJSONFile
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 URLForResource:@"cross-browser-extension-mapping" withExtension:@"json"];

  if (v4)
  {
    id v35 = 0;
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v35];
    id v6 = v35;
    if (!v5)
    {
      v22 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        [(WBSChromeExtensionsImporter *)v22 _openBrowserExtensionMappingJSONFile];
      }
      BOOL v21 = 0;
      id v8 = v6;
      goto LABEL_26;
    }
    id v34 = v6;
    objc_super v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v34];
    id v8 = v34;

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v8;
        v28 = v5;
        v29 = v4;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v26 = v7;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              uint64_t v15 = objc_msgSend(v14, "objectForKeyedSubscript:", @"safari_ios", v26, v27, v28, v29, (void)v30);
              if (v15)
              {
                v16 = (void *)v15;
                v17 = [v14 objectForKeyedSubscript:@"chrome"];

                if (v17)
                {
                  browserExtensionMapping = self->_browserExtensionMapping;
                  v19 = [v14 objectForKeyedSubscript:@"safari_ios"];
                  v20 = [v14 objectForKeyedSubscript:@"chrome"];
                  [(NSMutableDictionary *)browserExtensionMapping setObject:v19 forKey:v20];
                }
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
          }
          while (v11);
        }

        BOOL v21 = 1;
        v5 = v28;
        v4 = v29;
        objc_super v7 = v26;
        id v8 = v27;
        goto LABEL_25;
      }
      v24 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[WBSChromeExtensionsImporter _openBrowserExtensionMappingJSONFile](v24);
      }
    }
    else
    {
      v23 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        [(WBSChromeExtensionsImporter *)v23 _openBrowserExtensionMappingJSONFile];
      }
    }
    BOOL v21 = 0;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  BOOL v21 = 0;
LABEL_27:

  return v21;
}

- (void)parseURL:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28CB0];
  id v11 = 0;
  objc_super v7 = (void (**)(id, id))a4;
  id v8 = objc_msgSend(v6, "safari_fileHandleWithURL:options:createMode:error:", a3, 0, 0, &v11);
  id v9 = v11;
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10) {
    v7[2](v7, v9);
  }
  else {
    [(WBSChromeExtensionsImporter *)self parseFileHandle:v8 completionHandler:v7];
  }
}

- (void)parseFileHandle:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = objc_alloc_init(WBSJSONReader);
  [(WBSJSONReader *)v8 setDelegate:self];
  lastError = self->_lastError;
  self->_lastError = 0;

  BOOL v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  stack = self->_stack;
  self->_stack = v10;

  id v18 = 0;
  [(WBSJSONReader *)v8 parseFileHandle:v7 error:&v18];

  id v12 = v18;
  if (v12)
  {
    v6[2](v6, v12);
  }
  else
  {
    v13 = self->_lastError;
    if (!self->_foundExtensionsArray && !v13)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = @"Could not find extensions array in JSON file";
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      v16 = [v14 errorWithDomain:@"com.apple.SafariShared.WBSChromeExtensionsImporterErrorDomain" code:2 userInfo:v15];
      v17 = self->_lastError;
      self->_lastError = v16;

      v13 = self->_lastError;
    }
    v6[2](v6, v13);
  }
}

- (BOOL)_checkNotAtRootLevel
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_stack count];
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Root node is expected to be a dictionary";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = [v4 errorWithDomain:@"com.apple.SafariShared.WBSChromeExtensionsImporterErrorDomain" code:1 userInfo:v5];
    lastError = self->_lastError;
    self->_lastError = v6;
  }
  return v3 != 0;
}

- (BOOL)_isParsingExtensionsArray
{
  v5[3] = *MEMORY[0x1E4F143B8];
  stack = self->_stack;
  v5[0] = &unk_1F1086278;
  v5[1] = @"Extensions";
  v5[2] = &unk_1F1086290;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  LOBYTE(stack) = [(NSMutableArray *)stack isEqual:v3];

  return (char)stack;
}

- (BOOL)_isParsingExtension
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  stack = self->_stack;
  v5[0] = &unk_1F1086278;
  v5[1] = @"Extensions";
  v5[2] = &unk_1F1086290;
  v5[3] = &unk_1F1086278;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  LOBYTE(stack) = [(NSMutableArray *)stack isEqual:v3];

  return (char)stack;
}

- (id)_popKeyFromStackIfPossible
{
  uint64_t v3 = [(NSMutableArray *)self->_stack lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(NSMutableArray *)self->_stack lastObject];
    [(NSMutableArray *)self->_stack removeLastObject];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(WBSChromeExtensionsImporter *)self _checkNotAtRootLevel];
  if (v7)
  {
    id v8 = [(WBSChromeExtensionsImporter *)self _popKeyFromStackIfPossible];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 isEqualToString:@"id"]) {
      objc_storeStrong((id *)&self->_chromeExtensionIdentifier, a4);
    }
  }
  return v7;
}

- (BOOL)jsonReaderBeginObject:(id)a3
{
  [(NSMutableArray *)self->_stack addObject:&unk_1F1086278];
  if ([(WBSChromeExtensionsImporter *)self _isParsingExtension])
  {
    chromeExtensionIdentifier = self->_chromeExtensionIdentifier;
    self->_chromeExtensionIdentifier = 0;
  }
  return 1;
}

- (BOOL)jsonReader:(id)a3 appendKey:(id)a4
{
  return 1;
}

- (BOOL)jsonReaderEndObject:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [(NSMutableDictionary *)self->_browserExtensionMapping objectForKeyedSubscript:self->_chromeExtensionIdentifier];
  if ([(WBSChromeExtensionsImporter *)self _isParsingExtension] && v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [v4 objectForKeyedSubscript:@"store_identifier"];
    BOOL v7 = [v4 objectForKeyedSubscript:@"extension_identifiers"];

    if (v7)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = objc_msgSend(v4, "objectForKeyedSubscript:", @"extension_identifiers", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            [WeakRetained enableExtensionWithComposedIdentifier:*(void *)(*((void *)&v15 + 1) + 8 * v12++) adamIdentifier:v6 alternatePlatformAppBundleIdentifier:0 alternatePlatformExtensionBundleIdentifier:0];
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
    else
    {
      [WeakRetained enableExtensionWithComposedIdentifier:0 adamIdentifier:v6 alternatePlatformAppBundleIdentifier:0 alternatePlatformExtensionBundleIdentifier:0];
    }
  }
  [(NSMutableArray *)self->_stack removeLastObject];
  id v13 = [(WBSChromeExtensionsImporter *)self _popKeyFromStackIfPossible];

  return 1;
}

- (BOOL)jsonReaderBeginArray:(id)a3
{
  BOOL v4 = [(WBSChromeExtensionsImporter *)self _checkNotAtRootLevel];
  if (v4)
  {
    [(NSMutableArray *)self->_stack addObject:&unk_1F1086290];
    if ([(WBSChromeExtensionsImporter *)self _isParsingExtensionsArray]) {
      self->_foundExtensionsArray = 1;
    }
  }
  return v4;
}

- (BOOL)jsonReaderEndArray:(id)a3
{
  [(NSMutableArray *)self->_stack removeLastObject];
  id v4 = [(WBSChromeExtensionsImporter *)self _popKeyFromStackIfPossible];
  return 1;
}

- (BOOL)jsonReader:(id)a3 error:(id)a4
{
  return 0;
}

- (WBSExtensionsImporterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSExtensionsImporterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_chromeExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_browserExtensionMapping, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
}

- (void)_openBrowserExtensionMappingJSONFile
{
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v2, v3, "The browser extension mapping JSON data does not have an array as its top-level object (found %{public}@)", v4, v5, v6, v7, 2u);
}

@end