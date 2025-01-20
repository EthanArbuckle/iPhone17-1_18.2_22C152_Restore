@interface SKGSystemListener
+ (id)sharedClientListener;
+ (id)sharedProcessorListener;
- (BOOL)currentLocaleIsCJK;
- (BOOL)enableEmbeddingsHigherQoS;
- (BOOL)enableLanguageCheckForEmbedding;
- (BOOL)enableV2LanguageID;
- (BOOL)force;
- (BOOL)hasDiskCapacity;
- (BOOL)hasUpdatedLocale;
- (BOOL)hasUpdatedResources;
- (BOOL)isCJK;
- (BOOL)semanticSearchEnabled;
- (NSArray)currentPreferredLanguages;
- (NSArray)currentPreferredLocaleIdentifiers;
- (NSArray)currentPreferredLocales;
- (NSArray)doNotUpdateList;
- (NSArray)supportedSemanticLanguages;
- (NSLocale)currentLocale;
- (NSString)currentLanguage;
- (NSTimeZone)currentTimezone;
- (NSURL)geoIndexResourcesURL;
- (SKGSystemListener)init;
- (SKGSystemListener)initWithPreferredLanguages:(id)a3 locale:(id)a4;
- (id)currentRegion;
- (id)pathsForContentType:(id)a3 locale:(id)a4;
- (id)rootLocale;
- (unint64_t)currentFirstWeekDay;
- (void)dealloc;
- (void)setAutoUpdatingLocale:(BOOL)a3;
- (void)setAutoUpdatingTimezone:(BOOL)a3;
- (void)setForce:(BOOL)a3;
- (void)updateLocale;
- (void)updateLocaleWithLocale:(id)a3 preferredLanguages:(id)a4 force:(BOOL)a5;
- (void)updateResources;
- (void)updateTimezone;
@end

@implementation SKGSystemListener

+ (id)sharedClientListener
{
  if (sharedClientListener_defaultOnceToken != -1) {
    dispatch_once(&sharedClientListener_defaultOnceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedClientListener___DefaultListener;
  return v2;
}

uint64_t __41__SKGSystemListener_sharedClientListener__block_invoke()
{
  v0 = [SKGSystemListener alloc];
  CFArrayRef v1 = copyCurrentPreferredLanguages();
  CFLocaleRef v2 = copyCurrentLocale();
  uint64_t v3 = [(SKGSystemListener *)v0 initWithPreferredLanguages:v1 locale:v2];
  v4 = (void *)sharedClientListener___DefaultListener;
  sharedClientListener___DefaultListener = v3;

  v5 = (void *)sharedClientListener___DefaultListener;
  return [v5 setAutoUpdatingLocale:1];
}

+ (id)sharedProcessorListener
{
  if (sharedProcessorListener_defaultOnceToken != -1) {
    dispatch_once(&sharedProcessorListener_defaultOnceToken, &__block_literal_global_12);
  }
  CFLocaleRef v2 = (void *)sharedProcessorListener___DefaultListener;
  return v2;
}

uint64_t __44__SKGSystemListener_sharedProcessorListener__block_invoke()
{
  v0 = objc_alloc_init(SKGSystemListener);
  CFArrayRef v1 = (void *)sharedProcessorListener___DefaultListener;
  sharedProcessorListener___DefaultListener = (uint64_t)v0;

  CFLocaleRef v2 = (void *)sharedProcessorListener___DefaultListener;
  return [v2 setAutoUpdatingLocale:1];
}

- (SKGSystemListener)init
{
  CFArrayRef v3 = copyCurrentPreferredLanguages();
  CFLocaleRef v4 = copyCurrentLocale();
  v18.receiver = self;
  v18.super_class = (Class)SKGSystemListener;
  v5 = [(SKGSystemListener *)&v18 init];
  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__SKGSystemListener_init__block_invoke;
    block[3] = &unk_265520F88;
    CFLocaleRef v6 = v4;
    CFLocaleRef v17 = v6;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
    v5->_force = 1;
    v5->_locked_hasDiskCapacity = 0;
    v5->_locked_lastDiskFlushDate = 0.0;
    v5->_autoUpdatingLocale = 0;
    v5->_locked_hasUpdatedLocale = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.SpotlightKnowledge.SystemListener.locale", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    locked_currentResources = v5->_locked_currentResources;
    v5->_locked_currentResources = v9;

    *(_WORD *)&v5->_locked_semanticSearchEnabled = 0;
    v5->_locked_enableV2LanguageID = 0;
    locked_supportedSemanticLanguages = v5->_locked_supportedSemanticLanguages;
    v12 = (NSArray *)MEMORY[0x263EFFA68];
    v5->_locked_supportedSemanticLanguages = (NSArray *)MEMORY[0x263EFFA68];

    locked_doNotUpdateList = v5->_locked_doNotUpdateList;
    v5->_locked_doNotUpdateList = v12;

    locked_geoIndexPath = v5->_locked_geoIndexPath;
    v5->_locked_geoIndexPath = 0;

    [(SKGSystemListener *)v5 setAutoUpdatingTimezone:1];
    [(SKGSystemListener *)v5 updateTimezone];
    [(SKGSystemListener *)v5 updateLocaleWithLocale:v6 preferredLanguages:v3 force:1];
    [(SKGSystemListener *)v5 hasDiskCapacity];
  }
  return v5;
}

void __25__SKGSystemListener_init__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v2 loadAllParametersForClient:@"SpotlightKnowledge" locale:*(void *)(a1 + 32) options:&unk_270B14E10];
}

- (SKGSystemListener)initWithPreferredLanguages:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SKGSystemListener;
  v8 = [(SKGSystemListener *)&v21 init];
  if (v8)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SKGSystemListener_initWithPreferredLanguages_locale___block_invoke;
    block[3] = &unk_265520F88;
    id v9 = v7;
    id v20 = v9;
    if (initWithPreferredLanguages_locale__onceToken != -1) {
      dispatch_once(&initWithPreferredLanguages_locale__onceToken, block);
    }
    v8->_force = 0;
    v8->_locked_hasDiskCapacity = 0;
    v8->_locked_lastDiskFlushDate = 0.0;
    v8->_autoUpdatingLocale = 0;
    v8->_locked_hasUpdatedLocale = 0;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.SpotlightKnowledge.SystemListener.locale", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    locked_currentResources = v8->_locked_currentResources;
    v8->_locked_currentResources = v12;

    *(_WORD *)&v8->_locked_semanticSearchEnabled = 0;
    v8->_locked_enableV2LanguageID = 0;
    locked_supportedSemanticLanguages = v8->_locked_supportedSemanticLanguages;
    v15 = (NSArray *)MEMORY[0x263EFFA68];
    v8->_locked_supportedSemanticLanguages = (NSArray *)MEMORY[0x263EFFA68];

    locked_doNotUpdateList = v8->_locked_doNotUpdateList;
    v8->_locked_doNotUpdateList = v15;

    locked_geoIndexPath = v8->_locked_geoIndexPath;
    v8->_locked_geoIndexPath = 0;

    [(SKGSystemListener *)v8 setAutoUpdatingTimezone:1];
    [(SKGSystemListener *)v8 updateTimezone];
    [(SKGSystemListener *)v8 updateLocaleWithLocale:v9 preferredLanguages:v6 force:1];
    [(SKGSystemListener *)v8 hasDiskCapacity];
  }
  return v8;
}

void __55__SKGSystemListener_initWithPreferredLanguages_locale___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F78D00] sharedResourcesManager];
  [v2 loadAllParametersForClient:@"SpotlightKnowledge" locale:*(void *)(a1 + 32) options:&unk_270B14E38];
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

- (void)setAutoUpdatingTimezone:(BOOL)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObserver:self selector:sel_updateTimezone name:*MEMORY[0x263EFF5D0] object:0];
}

- (BOOL)hasDiskCapacity
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SKGSystemListener_hasDiskCapacity__block_invoke;
  v5[3] = &unk_265521058;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __36__SKGSystemListener_hasDiskCapacity__block_invoke(uint64_t a1)
{
  if (*(double *)(*(void *)(a1 + 32) + 16) == 0.0
    || (Current = CFAbsoluteTimeGetCurrent(), uint64_t v3 = *(void *)(a1 + 32), Current - *(double *)(v3 + 16) > 3600.0))
  {
    id v4 = NSURL;
    v5 = NSString;
    uint64_t v6 = NSHomeDirectory();
    id v7 = [v5 stringWithFormat:@"%@", v6];
    uint64_t v8 = [v4 fileURLWithPath:v7 isDirectory:1];

    char v9 = [MEMORY[0x263F08850] defaultManager];
    dispatch_queue_t v10 = [v8 path];
    int v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      objc_super v18 = 0;
      uint64_t v12 = *MEMORY[0x263EFF848];
      id v17 = 0;
      [v8 getResourceValue:&v18 forKey:v12 error:&v17];
      v13 = v18;
      id v14 = v17;
      if (!v14)
      {
        id v15 = v13;
        [v15 doubleValue];
        *(unsigned char *)(*(void *)(a1 + 32) + 8) = v16 * 0.05 > 40000000.0;
      }
    }
    else
    {
      id v14 = 0;
    }
    *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 16) = CFAbsoluteTimeGetCurrent();

    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(v3 + 8);
}

- (BOOL)isCJK
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__SKGSystemListener_isCJK__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__SKGSystemListener_isCJK__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 25);
  return result;
}

- (BOOL)hasUpdatedLocale
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SKGSystemListener_hasUpdatedLocale__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SKGSystemListener_hasUpdatedLocale__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  *(unsigned char *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

- (BOOL)hasUpdatedResources
{
  char v3 = [(SKGSystemListener *)self currentLocale];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SKGSystemListener_hasUpdatedResources__block_invoke;
  block[3] = &unk_2655210A8;
  id v5 = v3;
  id v9 = v5;
  dispatch_queue_t v10 = self;
  int v11 = &v12;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v13 + 24))
  {
    [(SKGSystemListener *)self updateResources];
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __40__SKGSystemListener_hasUpdatedResources__block_invoke(uint64_t a1)
{
  uint64_t v2 = localeKeyForLocale(*(void **)(a1 + 32));
  id v5 = (id)v2;
  if (v2)
  {
    char v3 = [*(id *)(*(void *)(a1 + 40) + 128) objectForKeyedSubscript:v2];
    id v4 = v3;
    if (v3 && [v3 hasUpdates]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    id v4 = 0;
  }
}

- (id)rootLocale
{
  return (id)[MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"root"];
}

- (NSTimeZone)currentTimezone
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SKGSystemListener_currentTimezone__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSTimeZone *)v3;
}

void __36__SKGSystemListener_currentTimezone__block_invoke(uint64_t a1)
{
}

- (NSLocale)currentLocale
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SKGSystemListener_currentLocale__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSLocale *)v3;
}

uint64_t __34__SKGSystemListener_currentLocale__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  return MEMORY[0x270F9A758]();
}

- (NSString)currentLanguage
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SKGSystemListener_currentLanguage__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

uint64_t __36__SKGSystemListener_currentLanguage__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  return MEMORY[0x270F9A758]();
}

- (id)currentRegion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SKGSystemListener_currentRegion__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __34__SKGSystemListener_currentRegion__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  return MEMORY[0x270F9A758]();
}

- (unint64_t)currentFirstWeekDay
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SKGSystemListener_currentFirstWeekDay__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__SKGSystemListener_currentFirstWeekDay__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

- (NSArray)currentPreferredLocales
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SKGSystemListener_currentPreferredLocales__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __44__SKGSystemListener_currentPreferredLocales__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  return MEMORY[0x270F9A758]();
}

- (NSArray)currentPreferredLocaleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SKGSystemListener_currentPreferredLocaleIdentifiers__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __54__SKGSystemListener_currentPreferredLocaleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  return MEMORY[0x270F9A758]();
}

- (NSArray)currentPreferredLanguages
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__SKGSystemListener_currentPreferredLanguages__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __46__SKGSystemListener_currentPreferredLanguages__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  return MEMORY[0x270F9A758]();
}

- (NSURL)geoIndexResourcesURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__SKGSystemListener_geoIndexResourcesURL__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

uint64_t __41__SKGSystemListener_geoIndexResourcesURL__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 120) copy];
  return MEMORY[0x270F9A758]();
}

- (NSArray)doNotUpdateList
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SKGSystemListener_doNotUpdateList__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __36__SKGSystemListener_doNotUpdateList__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 112) copy];
  return MEMORY[0x270F9A758]();
}

- (NSArray)supportedSemanticLanguages
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SKGSystemListener_supportedSemanticLanguages__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __47__SKGSystemListener_supportedSemanticLanguages__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  return MEMORY[0x270F9A758]();
}

- (BOOL)semanticSearchEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SKGSystemListener_semanticSearchEnabled__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SKGSystemListener_semanticSearchEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 96);
  return result;
}

- (BOOL)enableEmbeddingsHigherQoS
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__SKGSystemListener_enableEmbeddingsHigherQoS__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __46__SKGSystemListener_enableEmbeddingsHigherQoS__block_invoke(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"SKGSystemListener"];
  uint64_t v2 = [v3 objectForKey:@"enableEmbeddingsHigherQoS"];

  if (v2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLForKey:@"enableEmbeddingsHigherQoS"];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 97);
  }
}

- (BOOL)enableV2LanguageID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__SKGSystemListener_enableV2LanguageID__block_invoke;
  v5[3] = &unk_265521080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__SKGSystemListener_enableV2LanguageID__block_invoke(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"SKGSystemListener"];
  uint64_t v2 = [v3 objectForKey:@"enableV2LanguageID"];

  if (v2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLForKey:@"enableV2LanguageID"];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 98);
  }
}

- (BOOL)enableLanguageCheckForEmbedding
{
  return _os_feature_enabled_impl() ^ 1;
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
    id v9 = [(SKGSystemListener *)self currentLocale];
  }
  dispatch_queue_t v10 = v9;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__SKGSystemListener_pathsForContentType_locale___block_invoke;
  v16[3] = &unk_2655210D0;
  id v17 = v9;
  objc_super v18 = self;
  id v19 = v6;
  id v20 = &v21;
  id v12 = v6;
  id v13 = v10;
  dispatch_sync(queue, v16);
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __48__SKGSystemListener_pathsForContentType_locale___block_invoke(uint64_t a1)
{
  uint64_t v2 = localeKeyForLocale(*(void **)(a1 + 32));
  id v7 = (id)v2;
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 128) objectForKeyedSubscript:v2];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 filePathArrayForKey:*(void *)(a1 + 48)];
      char v6 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = 0;
  char v6 = 1;
LABEL_6:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
  if ((v6 & 1) == 0) {
}
  }

- (void)updateLocaleWithLocale:(id)a3 preferredLanguages:(id)a4 force:(BOOL)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  CFArrayRef v9 = (const __CFArray *)a4;
  if (v8)
  {
    if ([(SKGSystemListener *)self force]) {
      goto LABEL_6;
    }
    if (a5) {
      goto LABEL_6;
    }
    uint64_t v10 = [(SKGSystemListener *)self currentLocale];
    if (!v10) {
      goto LABEL_6;
    }
    id v11 = (void *)v10;
    id v12 = [v8 localeIdentifier];
    id v13 = [v11 localeIdentifier];
    char v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
LABEL_6:
      v38 = self;
      CFArrayRef v15 = copyNormalizedLanguagesForIdentifiers(v9);
      id v16 = objc_alloc(MEMORY[0x263EFF960]);
      id v39 = v8;
      id v17 = [v8 localeIdentifier];
      uint64_t v18 = [v16 initWithLocaleIdentifier:v17];

      id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v20 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v21 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      v37 = (void *)v18;
      SILanguagesGetLanguageID();
      v36 = SILanguagesGetLanguage();
      char IsCJK = languageIsCJK(v36);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      CFArrayRef v22 = v15;
      uint64_t v23 = [(__CFArray *)v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            v28 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v27];
            if (SILanguagesGetLanguageID() - 2 <= 0x38)
            {
              [v21 addObject:SILanguagesGetLanguage()];
              [v19 addObject:v28];
              [v20 addObject:v27];
            }
          }
          uint64_t v24 = [(__CFArray *)v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v24);
      }

      queue = v38->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__SKGSystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke;
      block[3] = &unk_2655210F8;
      char v46 = IsCJK;
      void block[4] = v38;
      id v41 = v37;
      id v42 = v36;
      id v43 = v19;
      id v44 = v20;
      id v45 = v21;
      id v30 = v21;
      id v31 = v20;
      id v32 = v19;
      id v33 = v36;
      id v34 = v37;
      dispatch_sync(queue, block);
      [(SKGSystemListener *)v38 updateResources];

      id v8 = v39;
    }
  }
}

void __69__SKGSystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke(uint64_t a1)
{
  v33[2] = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = *(unsigned char *)(a1 + 80);
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(a1 + 40) regionCode];
  uint64_t v9 = [v8 copy];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v9;

  id v12 = [*(id *)(a1 + 56) allObjects];
  uint64_t v13 = [v12 copy];
  uint64_t v14 = *(void *)(a1 + 32);
  CFArrayRef v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = v13;

  id v16 = [*(id *)(a1 + 64) allObjects];
  uint64_t v17 = [v16 copy];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 80);
  *(void *)(v18 + 80) = v17;

  id v20 = [*(id *)(a1 + 72) allObjects];
  uint64_t v21 = [v20 copy];
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(void **)(v22 + 88);
  *(void *)(v22 + 88) = v21;

  uint64_t v24 = localeKeyForLocale(*(void **)(a1 + 40));
  if (!v24)
  {
    uint64_t v25 = 0;
LABEL_6:
    uint64_t v27 = [MEMORY[0x263F78D00] sharedResourcesManager];
    v28 = *(void **)(a1 + 32);
    uint64_t v29 = v28[4];
    v32[0] = @"SRResourcesOwner";
    v32[1] = @"forceLoad";
    v33[0] = @"SpotlightKnowledge";
    id v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v28, "force"));
    v33[1] = v30;
    id v31 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    id v26 = [v27 resourcesForClient:@"SpotlightKnowledge" locale:v29 options:v31];

    [*(id *)(*(void *)(a1 + 32) + 128) setObject:v26 forKey:v24];
    goto LABEL_7;
  }
  uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKeyedSubscript:v24];
  if (!v25) {
    goto LABEL_6;
  }
  id v26 = v25;
  if ([*(id *)(a1 + 32) force]) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)updateResources
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SKGSystemListener_updateResources__block_invoke;
  block[3] = &unk_265520F88;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __36__SKGSystemListener_updateResources__block_invoke(uint64_t a1)
{
  v71[2] = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = localeKeyForLocale(v2);
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_6;
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKeyedSubscript:v3];
  if (!v4 || (uint64_t v5 = v4, [*(id *)(a1 + 32) force]))
  {
LABEL_6:
    uint64_t v6 = [MEMORY[0x263F78D00] sharedResourcesManager];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = v7[4];
    v70[0] = @"SRResourcesOwner";
    v70[1] = @"forceLoad";
    v71[0] = @"SpotlightKnowledge";
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "force"));
    v71[1] = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
    uint64_t v5 = [v6 resourcesForClient:@"SpotlightKnowledge" locale:v8 options:v10];

    [*(id *)(*(void *)(a1 + 32) + 128) setObject:v5 forKey:v3];
    if (!v5) {
      goto LABEL_55;
    }
  }
  id v53 = v2;
  [v5 filePathArrayForKey:@"Embedding"];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (!v11) {
    goto LABEL_33;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v64;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v64 != v13) {
        objc_enumerationMutation(obj);
      }
      CFArrayRef v15 = [NSURL fileURLWithPath:*(void *)(*((void *)&v63 + 1) + 8 * i)];
      id v16 = [v15 lastPathComponent];
      int v17 = [v16 isEqualToString:@"defaults.plist"];

      if (v17)
      {
        uint64_t v18 = [NSDictionary dictionaryWithContentsOfURL:v15];
        id v19 = [v18 valueForKey:@"SupportedLanguages"];
        if (v19)
        {
          id v20 = objc_alloc(MEMORY[0x263EFF8C0]);
          id v16 = [v18 objectForKeyedSubscript:@"SupportedLanguages"];
          uint64_t v21 = (void *)[v20 initWithArray:v16];
        }
        else
        {
          uint64_t v21 = (void *)MEMORY[0x263EFFA68];
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v21);
        if (v19)
        {
        }
        uint64_t v22 = [v18 valueForKey:@"Defaults"];
        uint64_t v23 = v22;
        if (!v22) {
          goto LABEL_58;
        }
        uint64_t v24 = [v22 objectForKeyedSubscript:@"EnableSemanticSearch"];

        if (v24)
        {
          uint64_t v25 = [v23 objectForKeyedSubscript:@"EnableSemanticSearch"];
          *(unsigned char *)(*(void *)(a1 + 32) + 96) = [v25 BOOLValue];
        }
        id v26 = [v23 objectForKeyedSubscript:@"EnableEmbeddingsHigherQoS"];

        if (v26)
        {
          uint64_t v27 = [v23 objectForKeyedSubscript:@"EnableEmbeddingsHigherQoS"];
          *(unsigned char *)(*(void *)(a1 + 32) + 97) = [v27 BOOLValue];
        }
        else
        {
LABEL_58:
          if (v18)
          {
            v28 = [v18 objectForKeyedSubscript:@"EnableEmbeddingsHigherQoS"];

            if (v28)
            {
              uint64_t v29 = [v18 objectForKeyedSubscript:@"EnableEmbeddingsHigherQoS"];
              *(unsigned char *)(*(void *)(a1 + 32) + 97) = [v29 BOOLValue];
            }
          }
          if (!v23) {
            goto LABEL_32;
          }
        }
        id v30 = [v23 objectForKeyedSubscript:@"EnableV2LanguageID"];

        if (v30)
        {
          id v31 = [v23 objectForKeyedSubscript:@"EnableV2LanguageID"];
          *(unsigned char *)(*(void *)(a1 + 32) + 98) = [v31 BOOLValue];
        }
LABEL_32:

        goto LABEL_33;
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_33:
  uint64_t v52 = v3;

  v51 = v5;
  id v32 = [v5 filePathArrayForKey:@"Processor"];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v60 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = [NSDictionary dictionaryWithContentsOfFile:*(void *)(*((void *)&v59 + 1) + 8 * j)];
        v38 = v37;
        if (v37)
        {
          id v39 = [v37 objectForKeyedSubscript:@"doNotUpdate"];
          if (v39)
          {
            id v40 = objc_alloc(MEMORY[0x263EFF8C0]);
            uint64_t v3 = [v38 objectForKeyedSubscript:@"doNotUpdate"];
            uint64_t v5 = (void *)[v40 initWithArray:v3];
            id v41 = v5;
          }
          else
          {
            id v41 = (void *)MEMORY[0x263EFFA68];
          }
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v41);
          if (v39)
          {
          }
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v34);
  }
  id v42 = [v51 filePathArrayForKey:@"Geo"];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v55 objects:v67 count:16];
  uint64_t v3 = v52;
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v56 != v45) {
          objc_enumerationMutation(v42);
        }
        long long v47 = [NSURL fileURLWithPath:*(void *)(*((void *)&v55 + 1) + 8 * k)];
        uint64_t v48 = [v47 URLByDeletingLastPathComponent];
        uint64_t v49 = *(void *)(a1 + 32);
        long long v50 = *(void **)(v49 + 120);
        *(void *)(v49 + 120) = v48;
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v44);
  }

  id v2 = v53;
LABEL_55:
}

- (void)updateLocale
{
  CFArrayRef v4 = copyCurrentPreferredLanguages();
  CFLocaleRef v3 = copyCurrentLocale();
  [(SKGSystemListener *)self updateLocaleWithLocale:v3 preferredLanguages:v4 force:0];
}

- (void)updateTimezone
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SKGSystemListener_updateTimezone__block_invoke;
  block[3] = &unk_265520F88;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __35__SKGSystemListener_updateTimezone__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = [MEMORY[0x263EFFA18] systemTimeZone];
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  CFLocaleRef v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if (self->_autoUpdatingLocale)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x263EFFCC8], 0);
  }
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_92);
  v5.receiver = self;
  v5.super_class = (Class)SKGSystemListener;
  [(SKGSystemListener *)&v5 dealloc];
}

- (BOOL)currentLocaleIsCJK
{
  return self->_currentLocaleIsCJK;
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
  objc_storeStrong((id *)&self->_locked_geoIndexPath, 0);
  objc_storeStrong((id *)&self->_locked_doNotUpdateList, 0);
  objc_storeStrong((id *)&self->_locked_supportedSemanticLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLocales, 0);
  objc_storeStrong((id *)&self->_locked_currentTimezone, 0);
  objc_storeStrong((id *)&self->_locked_currentRegion, 0);
  objc_storeStrong((id *)&self->_locked_currentLanguage, 0);
  objc_storeStrong((id *)&self->_locked_currentLocale, 0);
}

@end