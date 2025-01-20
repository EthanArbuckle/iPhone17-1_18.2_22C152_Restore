@interface SystemListener
+ (id)defaultListener;
- (BOOL)force;
- (BOOL)hasUpdatedFirstWeekDay;
- (BOOL)hasUpdatedLocale;
- (BOOL)hasUpdatedResources;
- (BOOL)semanticSearchEnabled;
- (SystemListener)init;
- (id)currentLocale;
- (id)currentPreferredLanguages;
- (id)currentRegion;
- (id)pathsForContentType:(id)a3 locale:(id)a4;
- (id)supportedSemanticLanguages;
- (unint64_t)currentFirstWeekDay;
- (void)dealloc;
- (void)setAutoUpdatingLocale:(BOOL)a3;
- (void)setForce:(BOOL)a3;
- (void)updateLocale;
- (void)updateLocaleWithLocale:(id)a3 preferredLanguages:(id)a4 force:(BOOL)a5;
- (void)updateResources;
@end

@implementation SystemListener

- (SystemListener)init
{
  v9.receiver = self;
  v9.super_class = (Class)SystemListener;
  v2 = [(SystemListener *)&v9 init];
  if (v2)
  {
    if (-[SystemListener init]::onceToken != -1) {
      dispatch_once(&-[SystemListener init]::onceToken, &__block_literal_global_2);
    }
    *(_WORD *)&v2->_autoUpdatingLocale = 0;
    *(_WORD *)&v2->_locked_hasUpdatedLocale = 0;
    v2->_locked_semanticSearchEnabled = 0;
    locked_supportedSemanticLanguages = v2->_locked_supportedSemanticLanguages;
    v2->_locked_supportedSemanticLanguages = (NSArray *)MEMORY[0x263EFFA68];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.QueryParser.AssetManager.locale", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    locked_currentResources = v2->_locked_currentResources;
    v2->_locked_currentResources = v6;

    [(SystemListener *)v2 updateLocale];
  }
  return v2;
}

void __22__SystemListener_init__block_invoke()
{
  id v1 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"root"];
  v0 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v0 loadAllParametersForClient:@"Parser" locale:v1 options:&unk_26D83FC40];
}

- (void)setAutoUpdatingLocale:(BOOL)a3
{
  BOOL v3 = a3;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  if (v3)
  {
    if (!self->_autoUpdatingLocale) {
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)localeChangeCallback, (CFStringRef)*MEMORY[0x263EFFCC8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  else if (self->_autoUpdatingLocale)
  {
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x263EFFCC8], 0);
  }
  self->_autoUpdatingLocale = v3;
}

- (BOOL)hasUpdatedLocale
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SystemListener_hasUpdatedLocale__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SystemListener_hasUpdatedLocale__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (BOOL)hasUpdatedFirstWeekDay
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SystemListener_hasUpdatedFirstWeekDay__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__SystemListener_hasUpdatedFirstWeekDay__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
  return result;
}

- (BOOL)hasUpdatedResources
{
  char v3 = [(SystemListener *)self currentLocale];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SystemListener_hasUpdatedResources__block_invoke;
  block[3] = &unk_264705020;
  id v8 = v3;
  char v9 = self;
  v10 = &v11;
  id v5 = v3;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __37__SystemListener_hasUpdatedResources__block_invoke(uint64_t a1)
{
  uint64_t v2 = localeKeyForLocale(*(NSLocale **)(a1 + 32));
  id v5 = (id)v2;
  if (v2)
  {
    char v3 = [*(id *)(*(void *)(a1 + 40) + 64) objectForKeyedSubscript:v2];
    dispatch_queue_t v4 = v3;
    if (v3 && [v3 hasUpdates]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    dispatch_queue_t v4 = 0;
  }
}

- (id)currentLocale
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SystemListener_currentLocale__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__SystemListener_currentLocale__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)currentRegion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SystemListener_currentRegion__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__SystemListener_currentRegion__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)currentFirstWeekDay
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SystemListener_currentFirstWeekDay__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SystemListener_currentFirstWeekDay__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (id)currentPreferredLanguages
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SystemListener_currentPreferredLanguages__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__SystemListener_currentPreferredLanguages__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)supportedSemanticLanguages
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SystemListener_supportedSemanticLanguages__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SystemListener_supportedSemanticLanguages__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)semanticSearchEnabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__SystemListener_semanticSearchEnabled__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SystemListener_semanticSearchEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (id)pathsForContentType:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(SystemListener *)self currentLocale];
  }
  v10 = v9;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__SystemListener_pathsForContentType_locale___block_invoke;
  v16[3] = &unk_264705048;
  id v17 = v9;
  v18 = self;
  id v19 = v6;
  v20 = &v21;
  id v12 = v6;
  id v13 = v10;
  dispatch_sync(queue, v16);
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __45__SystemListener_pathsForContentType_locale___block_invoke(uint64_t a1)
{
  uint64_t v2 = localeKeyForLocale(*(NSLocale **)(a1 + 32));
  if (v2)
  {
    uint64_t v8 = v2;
    char v3 = [*(id *)(*(void *)(a1 + 40) + 64) objectForKeyedSubscript:v2];
    dispatch_queue_t v4 = v3;
    uint64_t v2 = v8;
    if (v3)
    {
      uint64_t v5 = [v3 filePathArrayForKey:*(void *)(a1 + 48)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v2 = v8;
    }
  }
}

- (void)updateLocaleWithLocale:(id)a3 preferredLanguages:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_13;
  }
  BOOL v10 = [(SystemListener *)self force];
  BOOL v11 = [(SystemListener *)self force];
  if (v10 || v5)
  {
    int v12 = 1;
  }
  else
  {
    id v13 = [(SystemListener *)self currentLocale];
    if (v13)
    {
      id v14 = [v8 localeIdentifier];
      v15 = [v13 localeIdentifier];
      int v12 = [v14 isEqualToString:v15] ^ 1;
    }
    else
    {
      int v12 = 1;
    }
  }
  if (v11 || v5)
  {
    BOOL v16 = 1;
    if (!v12) {
      goto LABEL_11;
    }
  }
  else
  {
    id v19 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    unint64_t v20 = [(SystemListener *)self currentFirstWeekDay];
    BOOL v16 = !v20 || v19 && v20 != [v19 firstWeekday];

    if (!v12) {
      goto LABEL_11;
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke;
  block[3] = &unk_264705070;
  id v23 = v8;
  id v24 = v9;
  v25 = self;
  dispatch_sync(queue, block);

LABEL_11:
  if (v16)
  {
    v18 = self->_queue;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __66__SystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke_38;
    v21[3] = &unk_264705098;
    v21[4] = self;
    dispatch_sync(v18, v21);
  }
LABEL_13:
}

void __66__SystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke(id *a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (listenerLogger(void)::token != -1) {
    dispatch_once(&listenerLogger(void)::token, &__block_literal_global_97);
  }
  uint64_t v2 = (id)listenerLogger(void)::log;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [a1[4] localeIdentifier];
    uint64_t v4 = [v3 UTF8String];
    id v5 = a1[5];
    *(_DWORD *)buf = 136315394;
    uint64_t v45 = v4;
    __int16 v46 = 2112;
    id v47 = v5;
    _os_log_impl(&dword_224D85000, v2, OS_LOG_TYPE_INFO, "QueryParserListener: updating locale %s preferred languages %@", buf, 0x16u);
  }
  *((unsigned char *)a1[6] + 8) = 1;
  uint64_t v6 = [a1[4] copy];
  id v7 = (void *)*((void *)a1[6] + 2);
  *((void *)a1[6] + 2) = v6;

  id v8 = [a1[4] regionCode];
  uint64_t v9 = [v8 copy];
  BOOL v10 = a1[6];
  BOOL v11 = (void *)v10[3];
  v10[3] = v9;

  uint64_t v12 = [a1[5] copy];
  id v13 = (void *)*((void *)a1[6] + 5);
  *((void *)a1[6] + 5) = v12;

  v35 = localeKeyForLocale((NSLocale *)a1[4]);
  if (!v35
    || (objc_msgSend(*((id *)a1[6] + 8), "objectForKeyedSubscript:"),
        (v36 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v36 = 0;
LABEL_10:
    id v14 = objc_msgSend(MEMORY[0x263F78D00], "sharedResourcesManager", v35);
    v15 = a1[6];
    uint64_t v16 = v15[2];
    v42[0] = @"SRResourcesOwner";
    v42[1] = @"forceLoad";
    v43[0] = @"QueryParser";
    id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "force"));
    v43[1] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    uint64_t v19 = [v14 resourcesForClient:@"Parser" locale:v16 options:v18];

    [*((id *)a1[6] + 8) setObject:v19 forKey:v35];
    v36 = (void *)v19;
    if (!v19) {
      goto LABEL_33;
    }
    goto LABEL_11;
  }
  if ([a1[6] force]) {
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(v36, "filePathArrayForKey:", @"Embedding", v35);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = [NSURL fileURLWithPath:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        v25 = [v24 lastPathComponent];
        int v26 = [v25 isEqualToString:@"defaults.plist"];

        if (v26)
        {
          v27 = [NSDictionary dictionaryWithContentsOfURL:v24];
          v28 = [v27 valueForKey:@"SupportedLanguages"];
          if (v28)
          {
            id v29 = objc_alloc(MEMORY[0x263EFF8C0]);
            v25 = [v27 objectForKeyedSubscript:@"SupportedLanguages"];
            v30 = (void *)[v29 initWithArray:v25];
          }
          else
          {
            v30 = (void *)MEMORY[0x263EFFA68];
          }
          objc_storeStrong((id *)a1[6] + 7, v30);
          if (v28)
          {
          }
          v31 = [v27 valueForKey:@"Defaults"];
          v32 = v31;
          if (v31)
          {
            v33 = [v31 objectForKeyedSubscript:@"EnableSemanticSearch"];
            if (v33)
            {
              v34 = [v32 objectForKeyedSubscript:@"EnableSemanticSearch"];
              *((unsigned char *)a1[6] + 48) = [v34 BOOLValue];
            }
            else
            {
              *((unsigned char *)a1[6] + 48) = 0;
            }
          }
          else
          {
            *((unsigned char *)a1[6] + 48) = 0;
          }

          goto LABEL_32;
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_32:

LABEL_33:
}

void __66__SystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke_38(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  if (listenerLogger(void)::token != -1) {
    dispatch_once(&listenerLogger(void)::token, &__block_literal_global_97);
  }
  id v3 = (id)listenerLogger(void)::log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint64_t v5 = [v2 firstWeekday];
    _os_log_impl(&dword_224D85000, v3, OS_LOG_TYPE_INFO, "QueryParserListener: updating first week day %lu", (uint8_t *)&v4, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  *(void *)(*(void *)(a1 + 32) + 32) = [v2 firstWeekday];
}

- (void)updateResources
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SystemListener_updateResources__block_invoke;
  block[3] = &unk_264705098;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __33__SystemListener_updateResources__block_invoke(uint64_t a1)
{
  v35[2] = *MEMORY[0x263EF8340];
  if (listenerLogger(void)::token != -1) {
    dispatch_once(&listenerLogger(void)::token, &__block_literal_global_97);
  }
  uint64_t v2 = listenerLogger(void)::log;
  if (os_log_type_enabled((os_log_t)listenerLogger(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224D85000, v2, OS_LOG_TYPE_INFO, "QueryParserListener: updating resources", buf, 2u);
  }
  v25 = (NSLocale *)*(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = localeKeyForLocale(v25);
  int v26 = (void *)v3;
  if (!v3
    || ([*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v3],
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v27 = 0;
LABEL_10:
    int v4 = [MEMORY[0x263F78D00] sharedResourcesManager];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[2];
    v34[0] = @"SRResourcesOwner";
    v34[1] = @"forceLoad";
    v35[0] = @"QueryParser";
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "force"));
    v35[1] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v9 = [v4 resourcesForClient:@"Parser" locale:v6 options:v8];

    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v9 forKey:v3];
    v27 = (void *)v9;
    if (!v9) {
      goto LABEL_33;
    }
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) force]) {
    goto LABEL_10;
  }
LABEL_11:
  [v27 filePathArrayForKey:@"Embedding"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = [NSURL fileURLWithPath:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        v15 = [v14 lastPathComponent];
        int v16 = [v15 isEqualToString:@"defaults.plist"];

        if (v16)
        {
          id v17 = [NSDictionary dictionaryWithContentsOfURL:v14];
          v18 = [v17 valueForKey:@"SupportedLanguages"];
          if (v18)
          {
            id v19 = objc_alloc(MEMORY[0x263EFF8C0]);
            v15 = [v17 objectForKeyedSubscript:@"SupportedLanguages"];
            id v20 = (void *)[v19 initWithArray:v15];
          }
          else
          {
            id v20 = (void *)MEMORY[0x263EFFA68];
          }
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v20);
          if (v18)
          {
          }
          uint64_t v21 = [v17 valueForKey:@"Defaults"];
          uint64_t v22 = v21;
          if (v21)
          {
            id v23 = [v21 objectForKeyedSubscript:@"EnableSemanticSearch"];
            if (v23)
            {
              id v24 = [v22 objectForKeyedSubscript:@"EnableSemanticSearch"];
              *(unsigned char *)(*(void *)(a1 + 32) + 48) = [v24 BOOLValue];
            }
            else
            {
              *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
            }
          }
          else
          {
            *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
          }

          goto LABEL_32;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_32:

LABEL_33:
}

- (void)updateLocale
{
  CFArrayRef v4 = copyCurrentPreferredLanguages();
  CFLocaleRef v3 = copyCurrentLocale();
  [(SystemListener *)self updateLocaleWithLocale:v3 preferredLanguages:v4 force:0];
}

- (void)dealloc
{
  if (self->_autoUpdatingLocale)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x263EFFCC8], 0);
  }
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_40);
  v4.receiver = self;
  v4.super_class = (Class)SystemListener;
  [(SystemListener *)&v4 dealloc];
}

+ (id)defaultListener
{
  if (+[SystemListener defaultListener]::defaultOnceToken != -1) {
    dispatch_once(&+[SystemListener defaultListener]::defaultOnceToken, &__block_literal_global_44);
  }
  uint64_t v2 = (void *)+[SystemListener defaultListener]::__DefaultListener;
  return v2;
}

void __33__SystemListener_defaultListener__block_invoke()
{
  v0 = objc_alloc_init(SystemListener);
  id v1 = (void *)+[SystemListener defaultListener]::__DefaultListener;
  +[SystemListener defaultListener]::__DefaultListener = (uint64_t)v0;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locked_currentResources, 0);
  objc_storeStrong((id *)&self->_locked_supportedSemanticLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentRegion, 0);
  objc_storeStrong((id *)&self->_locked_currentLocale, 0);
}

@end