@interface QPQueryParserManager
+ (QPQueryParserManager)defaultManager;
+ (id)availableLanguages;
+ (id)notesManager;
+ (id)photosParserManager;
+ (id)remindersParserManager;
+ (id)spotlightManager;
+ (id)visualGenerationManager;
- (BOOL)available;
- (QPQueryParserManager)initWithOptions:(id)a3;
- (id)dateFromParseAttributes:(id)a3;
- (id)embeddingForString:(id)a3 extendedContextLength:(BOOL)a4;
- (id)locale;
- (void)available;
- (void)cooldown;
- (void)dealloc;
- (void)enumerateDateParseResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5;
- (void)enumerateParseResultsForStartDateString:(id)a3 startDateContext:(id)a4 endDateString:(id)a5 endDateContext:(id)a6 options:(id)a7 withBlock:(id)a8;
- (void)enumerateParseResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5;
- (void)enumerateSpotlightResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5;
- (void)preheat;
- (void)reset;
- (void)setOptions:(id)a3;
- (void)updateWithOptions:(id)a3;
@end

@implementation QPQueryParserManager

+ (QPQueryParserManager)defaultManager
{
  if (+[QPQueryParserManager defaultManager]::defaultOnceToken != -1) {
    dispatch_once(&+[QPQueryParserManager defaultManager]::defaultOnceToken, &__block_literal_global_15);
  }
  v2 = (void *)+[QPQueryParserManager defaultManager]::__DefaultManager;
  return (QPQueryParserManager *)v2;
}

void __38__QPQueryParserManager_defaultManager__block_invoke()
{
  v2 = QPQueryParserCopyDefaultOptionsForContext(@"com.apple.QueryParser");
  v0 = [[QPQueryParserManager alloc] initWithOptions:v2];
  v1 = (void *)+[QPQueryParserManager defaultManager]::__DefaultManager;
  +[QPQueryParserManager defaultManager]::__DefaultManager = (uint64_t)v0;
}

+ (id)spotlightManager
{
  if (+[QPQueryParserManager spotlightManager]::spotlightOnceToken != -1) {
    dispatch_once(&+[QPQueryParserManager spotlightManager]::spotlightOnceToken, &__block_literal_global_48);
  }
  v2 = (void *)+[QPQueryParserManager spotlightManager]::__SpotlightManager;
  return v2;
}

void __40__QPQueryParserManager_spotlightManager__block_invoke()
{
  v2 = QPQueryParserCopyDefaultOptionsForContext(@"com.apple.Spotlight");
  v0 = [[QPQueryParserManager alloc] initWithOptions:v2];
  v1 = (void *)+[QPQueryParserManager spotlightManager]::__SpotlightManager;
  +[QPQueryParserManager spotlightManager]::__SpotlightManager = (uint64_t)v0;
}

+ (id)remindersParserManager
{
  if (+[QPQueryParserManager remindersParserManager]::reminderParserOnceToken != -1) {
    dispatch_once(&+[QPQueryParserManager remindersParserManager]::reminderParserOnceToken, &__block_literal_global_53);
  }
  v2 = (void *)+[QPQueryParserManager remindersParserManager]::__RemindersParserManager;
  return v2;
}

void __46__QPQueryParserManager_remindersParserManager__block_invoke()
{
  v2 = QPQueryParserCopyDefaultOptionsForContext(@"com.apple.Reminders.Parser");
  v0 = [[QPQueryParserManager alloc] initWithOptions:v2];
  v1 = (void *)+[QPQueryParserManager remindersParserManager]::__RemindersParserManager;
  +[QPQueryParserManager remindersParserManager]::__RemindersParserManager = (uint64_t)v0;
}

+ (id)photosParserManager
{
  if (+[QPQueryParserManager photosParserManager]::photosOnceToken != -1) {
    dispatch_once(&+[QPQueryParserManager photosParserManager]::photosOnceToken, &__block_literal_global_58);
  }
  v2 = (void *)+[QPQueryParserManager photosParserManager]::__PhotosParserManager;
  return v2;
}

void __43__QPQueryParserManager_photosParserManager__block_invoke()
{
  v2 = QPQueryParserCopyDefaultOptionsForContext(@"com.apple.Photos.Parser");
  v0 = [[QPQueryParserManager alloc] initWithOptions:v2];
  v1 = (void *)+[QPQueryParserManager photosParserManager]::__PhotosParserManager;
  +[QPQueryParserManager photosParserManager]::__PhotosParserManager = (uint64_t)v0;
}

+ (id)notesManager
{
  if (+[QPQueryParserManager notesManager]::notesOnceToken != -1) {
    dispatch_once(&+[QPQueryParserManager notesManager]::notesOnceToken, &__block_literal_global_63);
  }
  v2 = (void *)+[QPQueryParserManager notesManager]::__NotesManager;
  return v2;
}

void __36__QPQueryParserManager_notesManager__block_invoke()
{
  v2 = QPQueryParserCopyDefaultOptionsForContext(@"com.apple.Notes");
  v0 = [[QPQueryParserManager alloc] initWithOptions:v2];
  v1 = (void *)+[QPQueryParserManager notesManager]::__NotesManager;
  +[QPQueryParserManager notesManager]::__NotesManager = (uint64_t)v0;
}

+ (id)visualGenerationManager
{
  if (+[QPQueryParserManager visualGenerationManager]::visualGenerationOnceToken != -1) {
    dispatch_once(&+[QPQueryParserManager visualGenerationManager]::visualGenerationOnceToken, &__block_literal_global_68);
  }
  v2 = (void *)+[QPQueryParserManager visualGenerationManager]::__VisualGenerationManager;
  return v2;
}

void __47__QPQueryParserManager_visualGenerationManager__block_invoke()
{
  if (queryParserManagerLogger(void)::token != -1) {
    dispatch_once(&queryParserManagerLogger(void)::token, &__block_literal_global_234);
  }
  v0 = queryParserManagerLogger(void)::log;
  if (os_log_type_enabled((os_log_t)queryParserManagerLogger(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_224D85000, v0, OS_LOG_TYPE_DEFAULT, "QueryParserManager: initializing a visualGenerationManager", v4, 2u);
  }
  v1 = QPQueryParserCopyDefaultOptionsForContext(@"com.apple.visual-generation");
  v2 = [[QPQueryParserManager alloc] initWithOptions:v1];
  v3 = (void *)+[QPQueryParserManager visualGenerationManager]::__VisualGenerationManager;
  +[QPQueryParserManager visualGenerationManager]::__VisualGenerationManager = (uint64_t)v2;
}

+ (id)availableLanguages
{
  return &unk_26D83ECB0;
}

- (QPQueryParserManager)initWithOptions:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QPQueryParserManager;
  v5 = [(QPQueryParserManager *)&v7 init];
  if (v5)
  {
    v5->_modelIsLoaded = 0;
    QPQueryParserCreate();
  }

  return 0;
}

void __40__QPQueryParserManager_initWithOptions___block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  queue = self->_queue;
  if (!queue
    || (dispatch_get_current_queue(),
        id v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(),
        v4,
        queue == v4))
  {
    parser = self->_parser;
    if (parser) {
      CFRelease(parser);
    }
  }
  else
  {
    v5 = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__QPQueryParserManager_dealloc__block_invoke;
    block[3] = &unk_264705098;
    block[4] = self;
    dispatch_sync(v5, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)QPQueryParserManager;
  [(QPQueryParserManager *)&v7 dealloc];
}

void __31__QPQueryParserManager_dealloc__block_invoke(uint64_t a1)
{
  v1 = *(const void **)(*(void *)(a1 + 32) + 8);
  if (v1) {
    CFRelease(v1);
  }
}

- (void)setOptions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__QPQueryParserManager_setOptions___block_invoke;
    v7[3] = &unk_2647060D8;
    v7[4] = self;
    id v8 = v5;
    dispatch_sync(queue, v7);
  }
}

uint64_t __35__QPQueryParserManager_setOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithOptions:*(void *)(a1 + 40)];
}

- (id)locale
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__QPQueryParserManager_locale__block_invoke;
  v5[3] = &unk_264704FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__QPQueryParserManager_locale__block_invoke(uint64_t a1)
{
  uint64_t Locale = QPQueryParserGetLocale(*(void *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = Locale;
}

- (BOOL)available
{
  if (!self->_modelIsLoaded)
  {
    id v4 = self->_currentLocale;
    v5 = [(NSLocale *)v4 languageCode];
    if (v5
      && ([(id)objc_opt_class() availableLanguages],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 containsObject:v5],
          v6,
          (v7 & 1) != 0))
    {
      if (QPQueryParserAvailableForLocale((BOOL)v4))
      {
        BOOL v2 = 1;
        self->_modelIsLoaded = 1;
LABEL_10:

        return v2;
      }
      if (QPQueryParserIsAvailable((QP::QueryParserEngine *)self->_parser)
        && QPQueryParserIsParsingAvailable((QP::QueryParserEngine *)self->_parser))
      {
        BOOL v2 = 1;
        goto LABEL_10;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        -[QPQueryParserManager available]((uint64_t)v5);
      }
    }
    else
    {
      BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v8) {
        [(QPQueryParserManager *)v8 available];
      }
    }
    BOOL v2 = 0;
    goto LABEL_10;
  }
  return 1;
}

- (void)updateWithOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFURLRef v5 = [v4 objectForKeyedSubscript:@"locale"];
  if (v5)
  {
    QPQueryParserGetLocale((uint64_t)self->_parser);
    uint64_t v6 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    originaluint64_t Locale = self->_originalLocale;
    self->_originaluint64_t Locale = v6;

    QPQueryParserGetPreferredLanguages((uint64_t)self->_parser);
    BOOL v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    originalPreferredLocales = self->_originalPreferredLocales;
    self->_originalPreferredLocales = v8;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v20 = v5;
      _os_log_impl(&dword_224D85000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "QueryParserManager: updating locale %@", buf, 0xCu);
    }
    parser = self->_parser;
    uint64_t v11 = [(__CFURL *)v5 languageCode];
    v18 = v11;
    QPQueryParserSetLocale((uint64_t)parser, v5, (const __CFArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1]);

    objc_storeStrong((id *)&self->_currentLocale, v5);
    self->_modelIsLoaded = 0;
  }
  CFURLRef v12 = [v4 objectForKeyedSubscript:kQPQueryParserOptionCustomResourceDirectoryKey];
  if (v12)
  {
    QPQueryParserGetCustomResourceDirectory((uint64_t)self->_parser);
    uint64_t v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    originalCustomResourceDirectory = self->_originalCustomResourceDirectory;
    self->_originalCustomResourceDirectory = v13;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v20 = v12;
      _os_log_impl(&dword_224D85000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "QueryParserManager: updating resource directory %@", buf, 0xCu);
    }
    QPQueryParserSetCustomResourceDirectory((QP::ParserConfiguration *)self->_parser, v12);
  }
  CFDateRef v15 = [v4 objectForKeyedSubscript:@"referenceDate"];
  if (v15)
  {
    QPQueryParserGetReferenceDate((uint64_t)self->_parser);
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    originalDate = self->_originalDate;
    self->_originalDate = v16;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v20 = v15;
      _os_log_impl(&dword_224D85000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "QueryParserManager: updating date %@", buf, 0xCu);
    }
    QPQueryParserSetReferenceDate((uint64_t)self->_parser, v15);
  }
  QPQueryParserSetOptions((uint64_t)self->_parser, (CFDictionaryRef)v4);
}

- (void)reset
{
  originaluint64_t Locale = self->_originalLocale;
  if (originalLocale)
  {
    objc_storeStrong((id *)&self->_currentLocale, originalLocale);
    self->_modelIsLoaded = 0;
    QPQueryParserSetLocale((uint64_t)self->_parser, (const __CFLocale *)self->_originalLocale, (const __CFArray *)self->_originalPreferredLocales);
    QPQueryParserSetUseSystemLocale((QP::QueryParserEngine *)self->_parser, (const __CFBoolean *)*MEMORY[0x263EFFB40]);
    id v4 = self->_originalLocale;
    self->_originaluint64_t Locale = 0;

    self->_modelIsLoaded = [(QPQueryParserManager *)self available];
  }
  originalDate = self->_originalDate;
  if (originalDate)
  {
    QPQueryParserSetReferenceDate((uint64_t)self->_parser, (const __CFDate *)originalDate);
    uint64_t v6 = self->_originalDate;
    self->_originalDate = 0;
  }
  originalCustomResourceDirectory = self->_originalCustomResourceDirectory;
  if (originalCustomResourceDirectory)
  {
    QPQueryParserSetCustomResourceDirectory((QP::ParserConfiguration *)self->_parser, (const __CFURL *)originalCustomResourceDirectory);
    BOOL v8 = self->_originalCustomResourceDirectory;
    self->_originalCustomResourceDirectory = 0;
  }
}

- (id)dateFromParseAttributes:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (v3)
  {
    CFURLRef v5 = [v3 objectForKeyedSubscript:@"kQPDateDisplay"];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"kQPDateType"];
    char v7 = [v3 objectForKeyedSubscript:@"kQPDateModifier"];
    BOOL v8 = [v3 objectForKeyedSubscript:@"kQPDateComponents"];
    uint64_t v9 = [v3 objectForKeyedSubscript:@"kQPStartDateComponents"];
    uint64_t v10 = [v3 objectForKeyedSubscript:@"kQPEndDateComponents"];
    uint64_t v11 = [v3 objectForKeyedSubscript:@"kQPFrequencyDateComponents"];
    if (v5) {
      [v4 setObject:v5 forKey:@"kQPDateDisplay"];
    }
    if (v6) {
      [v4 setObject:v6 forKey:@"kQPDateType"];
    }
    if (v7) {
      [v4 setObject:v7 forKey:@"kQPDateModifier"];
    }
    if (v8)
    {
      CFURLRef v12 = dateComponentsForDate(v8);
      [v4 setObject:v12 forKey:@"kQPDateComponents"];
    }
    if (v9)
    {
      uint64_t v13 = dateComponentsForDate(v9);
      [v4 setObject:v13 forKey:@"kQPStartDateComponents"];
    }
    if (v10)
    {
      uint64_t v14 = dateComponentsForDate(v10);
      [v4 setObject:v14 forKey:@"kQPEndDateComponents"];
    }
    if (v11)
    {
      CFDateRef v15 = dateComponentsForDate(v11);
      [v4 setObject:v15 forKey:@"kQPFrequencyDateComponents"];
    }
  }

  return v4;
}

- (void)enumerateDateParseResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void, char *))a5;
  uint64_t v14 = 0;
  CFDateRef v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  id v19 = (id)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v8];
  dateParser = self->_dateParser;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__QPQueryParserManager_enumerateDateParseResultsForString_options_withBlock___block_invoke;
  v13[3] = &unk_264706100;
  v13[4] = self;
  v13[5] = &v14;
  [(QPDataDetectorsParser *)dateParser enumerateDatesInString:v8 options:v9 withBlock:v13];
  char v12 = 0;
  v10[2](v10, v15[5], MEMORY[0x263EFFA78], &v12);
  _Block_object_dispose(&v14, 8);
}

void __77__QPQueryParserManager_enumerateDateParseResultsForString_options_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) dateFromParseAttributes:v7];
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v11 = @"kQPDate";
  v12[0] = v8;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  objc_msgSend(v9, "setAttributes:range:", v10, a3, a4);
}

- (void)enumerateParseResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && self->_parser && [v8 length])
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__12;
    v40 = __Block_byref_object_dispose__12;
    id v41 = (id)objc_opt_new();
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__12;
    v34 = __Block_byref_object_dispose__12;
    id v35 = (id)objc_opt_new();
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke;
    block[3] = &unk_264706150;
    id v19 = v9;
    CFURLRef v20 = self;
    v23 = &v26;
    id v21 = v8;
    id v12 = v10;
    id v22 = v12;
    v24 = &v36;
    v25 = &v30;
    dispatch_sync(queue, block);
    if (*((unsigned char *)v27 + 24))
    {
      unint64_t v13 = 0;
      unsigned __int8 v17 = 0;
      do
      {
        if (v13 >= [(id)v37[5] count]) {
          break;
        }
        uint64_t v14 = [(id)v37[5] objectAtIndexedSubscript:v13];
        CFDateRef v15 = [(id)v31[5] objectAtIndexedSubscript:v13];
        (*((void (**)(id, void *, void *, unsigned __int8 *))v12 + 2))(v12, v14, v15, &v17);
        int v16 = v17;

        ++v13;
      }
      while (!v16);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forTesting"];
  int v3 = [v2 BOOLValue];

  if (v3) {
    [*(id *)(a1 + 40) updateWithOptions:*(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) available];
  int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v5) {
      __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    CFStringRef v13 = *(const __CFString **)(a1 + 48);
    uint64_t v15 = *(void *)(v14 + 8);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_169;
    v17[3] = &unk_264706128;
    v17[4] = v14;
    long long v18 = *(_OWORD *)(a1 + 72);
    QPQueryParserEnumerateParses(v15, v13, (uint64_t)v17);
    if (v3) {
LABEL_7:
    }
      [*(id *)(a1 + 40) reset];
  }
  else
  {
    if (v5) {
      __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    int v16 = QPQueryParserCopyOptions(*(void *)(*(void *)(a1 + 40) + 8));
    [*(id *)(a1 + 40) enumerateDateParseResultsForString:*(void *)(a1 + 48) options:v16 withBlock:*(void *)(a1 + 56)];

    if (v3) {
      goto LABEL_7;
    }
  }
}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_169(void *a1, void *a2)
{
  int v3 = [a2 objectForKey:kQPParseResultAttributedParseKey];
  uint64_t v4 = [v3 length];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__12;
  uint64_t v12 = __Block_byref_object_dispose__12;
  id v5 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v6 = [v3 string];
  id v13 = (id)[v5 initWithString:v6];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_2;
  v7[3] = &unk_264706100;
  v7[4] = a1[4];
  void v7[5] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  if ([(id)v9[5] length])
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v9[5]];
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:MEMORY[0x263EFFA78]];
  }
  _Block_object_dispose(&v8, 8);
}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"kQPDate"];

  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v7 objectForKeyedSubscript:@"kQPDate"];
    uint64_t v11 = [v9 dateFromParseAttributes:v10];

    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v14 = @"kQPDate";
    v15[0] = v11;
    id v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v12, "setAttributes:range:", v13, a3, a4);
  }
  else if ([v7 count])
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setAttributes:range:", v7, a3, a4);
  }
}

- (void)enumerateSpotlightResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && self->_parser && [v8 length])
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    char v19 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__QPQueryParserManager_enumerateSpotlightResultsForString_options_withBlock___block_invoke;
    block[3] = &unk_2647061A0;
    id v13 = v9;
    uint64_t v14 = self;
    unsigned __int8 v17 = v18;
    id v15 = v8;
    id v16 = v10;
    dispatch_sync(queue, block);

    _Block_object_dispose(v18, 8);
  }
}

void __77__QPQueryParserManager_enumerateSpotlightResultsForString_options_withBlock___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forTesting"];
  int v3 = [v2 BOOLValue];

  if (v3) {
    [*(id *)(a1 + 40) updateWithOptions:*(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) available];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    char v15 = 0;
    CFStringRef v4 = *(const __CFString **)(a1 + 48);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __77__QPQueryParserManager_enumerateSpotlightResultsForString_options_withBlock___block_invoke_2;
    uint64_t v11 = &unk_264706178;
    id v12 = *(id *)(a1 + 56);
    id v13 = v14;
    QPQueryParserEnumerateParses(v5, v4, (uint64_t)&v8);

    _Block_object_dispose(v14, 8);
  }
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"forTesting", v8, v9, v10, v11);
  int v7 = [v6 BOOLValue];

  if (v7) {
    [*(id *)(a1 + 40) reset];
  }
}

uint64_t __77__QPQueryParserManager_enumerateSpotlightResultsForString_options_withBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)enumerateParseResultsForStartDateString:(id)a3 startDateContext:(id)a4 endDateString:(id)a5 endDateContext:(id)a6 options:(id)a7 withBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  char v19 = (void (**)(id, void *, void *, unsigned char *))a8;
  if (v14)
  {
    if (self->_parser)
    {
      uint64_t v20 = [v14 length];
      if (v16)
      {
        if (v20 && [v16 length])
        {
          uint64_t v48 = 0;
          v49 = &v48;
          uint64_t v50 = 0x3032000000;
          v51 = __Block_byref_object_copy__12;
          v52 = __Block_byref_object_dispose__12;
          id v53 = (id)objc_opt_new();
          uint64_t v42 = 0;
          v43 = &v42;
          uint64_t v44 = 0x3032000000;
          v45 = __Block_byref_object_copy__12;
          v46 = __Block_byref_object_dispose__12;
          id v47 = (id)objc_opt_new();
          uint64_t v38 = 0;
          v39 = &v38;
          uint64_t v40 = 0x2020000000;
          char v41 = 0;
          queue = self->_queue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke;
          block[3] = &unk_2647061C8;
          id v29 = v18;
          uint64_t v30 = self;
          id v35 = &v38;
          id v31 = v14;
          id v32 = v15;
          id v33 = v16;
          id v34 = v17;
          uint64_t v36 = &v48;
          v37 = &v42;
          dispatch_sync(queue, block);
          if (*((unsigned char *)v39 + 24))
          {
            id v26 = v17;
            unint64_t v22 = 0;
            unsigned __int8 v27 = 0;
            do
            {
              if (v22 >= [(id)v49[5] count]) {
                break;
              }
              v23 = [(id)v49[5] objectAtIndexedSubscript:v22];
              v24 = [(id)v43[5] objectAtIndexedSubscript:v22];
              v19[2](v19, v23, v24, &v27);
              int v25 = v27;

              ++v22;
            }
            while (!v25);
            id v17 = v26;
          }

          _Block_object_dispose(&v38, 8);
          _Block_object_dispose(&v42, 8);

          _Block_object_dispose(&v48, 8);
        }
      }
    }
  }
}

void __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forTesting"];
  int v3 = [v2 BOOLValue];

  if (v3) {
    [*(id *)(a1 + 40) updateWithOptions:*(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 40) available];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    CFStringRef v4 = *(const __CFString **)(a1 + 48);
    uint64_t v6 = *(void *)(v5 + 8);
    CFDictionaryRef v7 = *(const __CFDictionary **)(a1 + 56);
    CFStringRef v8 = *(const __CFString **)(a1 + 64);
    CFDictionaryRef v9 = *(const __CFDictionary **)(a1 + 72);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke_2;
    v12[3] = &unk_264706128;
    v12[4] = v5;
    long long v13 = *(_OWORD *)(a1 + 88);
    QPQueryParserEnumerateParsesForStartAndEndDates(v6, v4, v7, v8, v9, (uint64_t)v12);
  }
  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forTesting"];
  int v11 = [v10 BOOLValue];

  if (v11) {
    [*(id *)(a1 + 40) reset];
  }
}

void __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke_2(void *a1, void *a2)
{
  int v3 = [a2 objectForKey:kQPParseResultAttributedParseKey];
  uint64_t v4 = [v3 length];
  uint64_t v8 = 0;
  CFDictionaryRef v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__12;
  id v12 = __Block_byref_object_dispose__12;
  id v5 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v6 = [v3 string];
  id v13 = (id)[v5 initWithString:v6];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke_3;
  v7[3] = &unk_264706100;
  v7[4] = a1[4];
  void v7[5] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  if ([(id)v9[5] length])
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v9[5]];
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:MEMORY[0x263EFFA78]];
  }
  _Block_object_dispose(&v8, 8);
}

void __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"kQPDate"];

  if (v8)
  {
    CFDictionaryRef v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v7 objectForKeyedSubscript:@"kQPDate"];
    int v11 = [v9 dateFromParseAttributes:v10];

    id v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v14 = @"kQPDate";
    v15[0] = v11;
    id v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v12, "setAttributes:range:", v13, a3, a4);
  }
  else if ([v7 count])
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setAttributes:range:", v7, a3, a4);
  }
}

- (id)embeddingForString:(id)a3 extendedContextLength:(BOOL)a4
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a3;
  BOOL valuePtr = a4;
  if (![(__CFString *)v6 length]) {
    goto LABEL_9;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCharType, &valuePtr);
  values = v8;
  keys[0] = @"extendedContext";
  CFDictionaryRef v9 = CFDictionaryCreate(v7, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v10 = QPQueryParserCopyInputAttributes((uint64_t)self->_parser, v6, v9);
  CFRelease(v8);
  CFRelease(v9);
  if (v10)
  {
    int v11 = [(__CFDictionary *)v10 objectForKeyedSubscript:@"embeddingResultKey"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v12 = (void *)MEMORY[0x263F08928];
      id v13 = (void *)MEMORY[0x263EFFA08];
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      id v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
      id v21 = 0;
      id v17 = [v12 unarchivedObjectOfClasses:v16 fromData:v11 error:&v21];
      id v18 = v21;

      if (v18)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[QPQueryParserManager embeddingForString:extendedContextLength:]((uint64_t)v18);
        }

        char v19 = 0;
      }
      else
      {
        char v19 = [v17 objectForKeyedSubscript:@"_kMDItemPrimaryTextEmbedding"];
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
LABEL_9:
    char v19 = 0;
  }

  return v19;
}

- (void)preheat
{
  parser = self->_parser;
  if (parser) {
    QPQueryParserPreheat((uint64_t)parser);
  }
}

- (void)cooldown
{
  parser = self->_parser;
  if (parser) {
    QPQueryParserCooldown((uint64_t)parser);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCustomResourceDirectory, 0);
  objc_storeStrong((id *)&self->_originalPreferredLocales, 0);
  objc_storeStrong((id *)&self->_originalLocale, 0);
  objc_storeStrong((id *)&self->_originalDate, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dateParser, 0);
}

- (void)available
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_224D85000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "QueryParserManager: resources unavailable for %@", (uint8_t *)&v1, 0xCu);
}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)embeddingForString:(uint64_t)a1 extendedContextLength:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_224D85000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to deserialize the embedding data dictionary with error: %@", (uint8_t *)&v1, 0xCu);
}

@end