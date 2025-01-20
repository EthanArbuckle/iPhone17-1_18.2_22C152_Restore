@interface TIKeyboardInputManagerLoaderSyncHelper
+ (void)deleteCloudKitBackup;
- (BOOL)shouldCacheObject:(id)a3;
- (TIKeyboardInputManagerLoaderSyncHelper)init;
- (id)languageUpdated;
- (void)dealloc;
- (void)languagePulled:(id)a3;
- (void)languagesChanged:(id)a3;
- (void)noteObject:(id)a3 forLanguage:(id)a4;
- (void)setLanguageUpdated:(id)a3;
- (void)willLoadLanguage:(id)a3;
@end

@implementation TIKeyboardInputManagerLoaderSyncHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_languageUpdated, 0);
  objc_storeStrong((id *)&self->_pendingSaves, 0);

  objc_storeStrong((id *)&self->_languages, 0);
}

- (void)setLanguageUpdated:(id)a3
{
}

- (id)languageUpdated
{
  return self->_languageUpdated;
}

- (BOOL)shouldCacheObject:(id)a3
{
  v3 = objc_getAssociatedObject(a3, &kTidyObject);
  char v4 = [v3 valid] ^ 1;

  return v4;
}

- (void)noteObject:(id)a3 forLanguage:(id)a4
{
  id v10 = a4;
  languages = self->_languages;
  id v7 = a3;
  v8 = [(NSMutableDictionary *)languages objectForKey:v10];
  if (v8)
  {
    v9 = v8;
    [v8 compact];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [(NSMutableDictionary *)self->_languages setObject:v9 forKey:v10];
  }
  [v9 addPointer:v7];
}

- (void)willLoadLanguage:(id)a3
{
  v3 = [(NSMapTable *)self->_pendingSaves objectForKey:a3];
  [v3 execute];

  id v4 = [get_KSUserWordsSynchroniserClass() sharedInstance];
  [v4 keyboardUsed];
}

- (void)languagePulled:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TIKeyboardInputManagerLoaderSyncHelper *)self languageUpdated];

  if (v5)
  {
    v6 = [v4 userInfo];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    id v7 = (id *)get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_ptr;
    uint64_t v29 = get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_ptr;
    if (!get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v31 = __get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_block_invoke;
      v32 = &unk_1E6E2E248;
      v33 = &v26;
      v8 = (void *)KeyboardServicesLibrary();
      v9 = dlsym(v8, "_KSUserWordsWereDownloadedLanguageKey");
      *(void *)(v33[1] + 24) = v9;
      get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_ptr = *(void *)(v33[1] + 24);
      id v7 = (id *)v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (v7)
    {
      id v10 = *v7;
      v11 = [v6 objectForKey:v10];

      v12 = [v4 userInfo];
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      v13 = (id *)get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr;
      uint64_t v29 = get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr;
      if (!get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v31 = __get_KSUserWordsWereDownloadedFilesKeySymbolLoc_block_invoke;
        v32 = &unk_1E6E2E248;
        v33 = &v26;
        v14 = (void *)KeyboardServicesLibrary();
        v15 = dlsym(v14, "_KSUserWordsWereDownloadedFilesKey");
        *(void *)(v33[1] + 24) = v15;
        get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr = *(void *)(v33[1] + 24);
        v13 = (id *)v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (v13)
      {
        id v16 = *v13;
        v17 = [v12 objectForKey:v16];

        v23 = v11;
        id v18 = v17;
        id v19 = v11;
        TIDispatchAsync();

        goto LABEL_13;
      }
    }
    dlerror();
    abort_report_np();
    goto LABEL_15;
  }
  if (TICanLogMessageAtLevel_onceToken != -1) {
LABEL_15:
  }
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  v20 = TIOSLogFacility();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s Got notification before block configured! Delaying...", "-[TIKeyboardInputManagerLoaderSyncHelper languagePulled:]");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_debug_impl(&dword_1E3F0E000, v20, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }
  dispatch_time_t v21 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__TIKeyboardInputManagerLoaderSyncHelper_languagePulled___block_invoke;
  block[3] = &unk_1E6E2E220;
  block[4] = self;
  id v25 = v4;
  dispatch_after(v21, MEMORY[0x1E4F14428], block);

LABEL_13:
}

uint64_t __57__TIKeyboardInputManagerLoaderSyncHelper_languagePulled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) languagePulled:*(void *)(a1 + 40)];
}

void __57__TIKeyboardInputManagerLoaderSyncHelper_languagePulled___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  [v2 invalidate];

  v3 = [[_TIKeyboardSyncFileInstaller alloc] initWithEntry:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v3 forKey:*(void *)(a1 + 40)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  v5 = v4;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          if (v10) {
            objc_setAssociatedObject(v10, &kTidyObject, v3, (void *)0x301);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  v11 = [*(id *)(a1 + 32) languageUpdated];
  v11[2](v11, *(void *)(a1 + 40));
}

- (void)languagesChanged:(id)a3
{
}

void __59__TIKeyboardInputManagerLoaderSyncHelper_languagesChanged___block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v1 = +[TIAssetManager sharedAssetManager];
  v2 = [v1 enabledInputModes];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = TIInputModeGetLanguageWithRegion();
        [v0 addObject:v7];
        id v8 = v7;
        [v8 UTF8String];
        if (_os_feature_enabled_impl()) {
          [v0 addObject:@"mul"];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  get_KSUserWordsSynchroniserClass();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [get_KSUserWordsSynchroniserClass() sharedAcrossLanguagesNegativeLearningValue];
    [v0 addObject:v9];
  }
  get_KSUserWordsSynchroniserClass();
  if (objc_opt_respondsToSelector())
  {
    id v10 = [get_KSUserWordsSynchroniserClass() sharedAcrossLanguagesVulgarWordUsageValue];
    [v0 addObject:v10];
  }
  v11 = [get_KSUserWordsSynchroniserClass() sharedInstance];
  long long v12 = [v0 allObjects];
  [v11 setRequiredLanguages:v12];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLoaderSyncHelper;
  [(TIKeyboardInputManagerLoaderSyncHelper *)&v4 dealloc];
}

- (TIKeyboardInputManagerLoaderSyncHelper)init
{
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManagerLoaderSyncHelper;
  v2 = [(TIKeyboardInputManagerLoaderSyncHelper *)&v14 init];
  if (!v2) {
    return v2;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  languages = v2->_languages;
  v2->_languages = (NSMutableDictionary *)v3;

  uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  pendingSaves = v2->_pendingSaves;
  v2->_pendingSaves = (NSMapTable *)v5;

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:v2 selector:sel_languagesChanged_ name:@"AppleKeyboardsPreferencesChangedNotification_Private" object:0];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v20 = 0;
  dispatch_time_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v9 = (void *)get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr;
  uint64_t v23 = get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr;
  if (!get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __get_KSUserWordsWereDownloadedNotificationSymbolLoc_block_invoke;
    uint64_t v18 = &unk_1E6E2E248;
    id v19 = &v20;
    id v10 = (void *)KeyboardServicesLibrary();
    v11 = dlsym(v10, "_KSUserWordsWereDownloadedNotification");
    *(void *)(v19[1] + 24) = v11;
    get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr = *(void *)(v19[1] + 24);
    uint64_t v9 = (void *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (v9)
  {
    [v8 addObserver:v2 selector:sel_languagePulled_ name:*v9 object:0];

    [(TIKeyboardInputManagerLoaderSyncHelper *)v2 languagesChanged:0];
    return v2;
  }
  dlerror();
  uint64_t v13 = abort_report_np();
  return (TIKeyboardInputManagerLoaderSyncHelper *)__get_KSUserWordsWereDownloadedNotificationSymbolLoc_block_invoke(v13);
}

+ (void)deleteCloudKitBackup
{
  id v2 = [get_KSUserWordsSynchroniserClass() sharedInstance];
  [v2 deleteZoneWithCompletionHandler:&__block_literal_global_27];
}

void __62__TIKeyboardInputManagerLoaderSyncHelper_deleteCloudKitBackup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    uint64_t v3 = TIOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_super v4 = @"Success";
      if (v2) {
        objc_super v4 = v2;
      }
      uint64_t v5 = [NSString stringWithFormat:@"%s User word zone delete result: %@", "+[TIKeyboardInputManagerLoaderSyncHelper deleteCloudKitBackup]_block_invoke", v4];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v7 = v5;
      _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

@end