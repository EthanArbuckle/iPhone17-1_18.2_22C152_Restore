@interface CHCachedRecognizerManager
+ (void)configureRecognizer:(id)a3 forRequest:(id)a4 locale:(id)a5;
+ (void)configureRecognizer:(id)a3 forRequest:(id)a4 locale:(id)a5 transientLexicon:(_LXLexicon *)a6 transientPhraseLexicon:(_LXLexicon *)a7 vocabulary:(void *)a8 textReplacements:(id)a9 addressBookLexicon:(id)a10;
- (BOOL)_hasCachedRecognizers;
- (CHCachedRecognizerManager)init;
- (id)_recognizerConfigurationKeyForRequest:(id)a3 locale:(id)a4;
- (id)_recognizerWrapperForRequest:(id)a3 locale:(id)a4;
- (id)checkOutRecognizerForMathRequest:(id)a3;
- (id)checkOutRecognizerForSketchRequest:(id)a3;
- (id)checkOutRecognizerForTextRequest:(id)a3 locale:(id)a4;
- (id)writingStatsForRequest:(id)a3 locale:(id)a4;
- (void)_cleanupCachedRecognizersTargetLifetime:(id)a3;
- (void)checkInRecognizerForRequest:(id)a3 locale:(id)a4 onQueue:(id)a5 idleCallbackBlock:(id)a6;
- (void)optimizeResourceUsageWithTimeout:(double)a3 onQueue:(id)a4 idleCallbackBlock:(id)a5;
@end

@implementation CHCachedRecognizerManager

- (CHCachedRecognizerManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CHCachedRecognizerManager;
  v2 = [(CHCachedRecognizerManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedRecognizersByConfigurationKey = v2->_cachedRecognizersByConfigurationKey;
    v2->_cachedRecognizersByConfigurationKey = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    writingStatsByConfigurationKey = v2->_writingStatsByConfigurationKey;
    v2->_writingStatsByConfigurationKey = v5;

    uint64_t v7 = objc_opt_new();
    powerLogger = v2->_powerLogger;
    v2->_powerLogger = (CHPowerLogger *)v7;
  }
  return v2;
}

- (id)checkOutRecognizerForTextRequest:(id)a3 locale:(id)a4
{
  v4 = [(CHCachedRecognizerManager *)self _recognizerWrapperForRequest:a3 locale:a4];
  v5 = [v4 checkOutRecognizer];

  return v5;
}

- (id)checkOutRecognizerForMathRequest:(id)a3
{
  v3 = [(CHCachedRecognizerManager *)self _recognizerWrapperForRequest:a3 locale:0];
  v4 = [v3 checkOutRecognizer];

  return v4;
}

- (id)checkOutRecognizerForSketchRequest:(id)a3
{
  v3 = [(CHCachedRecognizerManager *)self _recognizerWrapperForRequest:a3 locale:0];
  v4 = [v3 checkOutRecognizer];

  return v4;
}

- (void)checkInRecognizerForRequest:(id)a3 locale:(id)a4 onQueue:(id)a5 idleCallbackBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  id v13 = a6;
  v14 = [(CHCachedRecognizerManager *)self _recognizerWrapperForRequest:v10 locale:v11];
  [v14 checkInRecognizer];
  [v14 targetIdleLifetime];
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_100006A40;
  v24 = &unk_1000249F0;
  v25 = self;
  id v17 = v13;
  id v26 = v17;
  dispatch_after(v16, v12, &v21);
  v18 = -[CHCachedRecognizerManager _recognizerConfigurationKeyForRequest:locale:](self, "_recognizerConfigurationKeyForRequest:locale:", v10, v11, v21, v22, v23, v24, v25);
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v19 = (id)qword_10002B138;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    id v20 = [v14 activeRequestCount];
    *(_DWORD *)buf = 138412546;
    v28 = v18;
    __int16 v29 = 2048;
    id v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Finished request for recognizer %@. Remaining processing requests: %li", buf, 0x16u);
  }
}

- (id)writingStatsForRequest:(id)a3 locale:(id)a4
{
  v5 = [(CHCachedRecognizerManager *)self _recognizerConfigurationKeyForRequest:a3 locale:a4];
  v6 = [(NSMutableDictionary *)self->_writingStatsByConfigurationKey objectForKey:v5];
  if (!v6)
  {
    v6 = objc_alloc_init(CHWritingStatistics);
    [(NSMutableDictionary *)self->_writingStatsByConfigurationKey setObject:v6 forKey:v5];
  }

  return v6;
}

- (id)_recognizerConfigurationKeyForRequest:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 recognizerConfigurationKeyWithLocale:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = @"Math";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = @"Sketch";
      }
      else
      {
        if (qword_10002B188 != -1) {
          dispatch_once(&qword_10002B188, &stru_100024A60);
        }
        v8 = (id)qword_10002B118;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Invalid recognition request class", v10, 2u);
        }

        uint64_t v7 = 0;
      }
    }
  }

  return v7;
}

- (id)_recognizerWrapperForRequest:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CHCachedRecognizerManager *)self _recognizerConfigurationKeyForRequest:v6 locale:v7];
  uint64_t v9 = [(NSMutableDictionary *)self->_cachedRecognizersByConfigurationKey objectForKey:v8];
  if (v9)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v10 = (id)qword_10002B138;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    int v22 = 138412290;
    v23 = v8;
    id v11 = "Loaded recognizer with configuration key %@";
    v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    uint32_t v14 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v22, v14);
LABEL_7:

    double v15 = (CHCachedRecognizerWrapper *)v9;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v6;
    id v17 = objc_alloc_init((Class)CHRecognizerOptions);
    [v17 setEnableCachingIfAvailable:[v16 enableCachingIfAvailable]];
    [v17 setEnableGen2ModelIfAvailable:[v16 enableGen2ModelIfAvailable]];
    [v17 setEnableGen2CharacterLMIfAvailable:[v16 enableGen2CharacterLMIfAvailable]];
    id v18 = [objc_alloc((Class)CHRecognizer) initWithMode:[v16 recognitionMode] locale:v7 recognizerOptions:v17];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = objc_alloc_init((Class)CHMathRecognizer);
      [(CHPowerLogger *)self->_powerLogger logModelLoaded:2];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = objc_alloc_init((Class)CHSketchRecognizer);
        [(CHPowerLogger *)self->_powerLogger logModelLoaded:12];
      }
      else
      {
        if (qword_10002B188 != -1) {
          dispatch_once(&qword_10002B188, &stru_100024A60);
        }
        v19 = (id)qword_10002B118;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v22) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Invalid recognition request class", (uint8_t *)&v22, 2u);
        }

        id v18 = 0;
      }
    }
  }
  double v15 = [[CHCachedRecognizerWrapper alloc] initWithRecognizer:v18];
  [(NSMutableDictionary *)self->_cachedRecognizersByConfigurationKey setObject:v15 forKey:v8];
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v20 = (id)qword_10002B138;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 138412546;
    v23 = v8;
    __int16 v24 = 1024;
    int v25 = dword_10002B0E0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Created recognizer with configuration key %@, recognizer index = %d", (uint8_t *)&v22, 0x12u);
  }

  ++dword_10002B0E0;
  if (!v15)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v10 = (id)qword_10002B118;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    LOWORD(v22) = 0;
    id v11 = "A valid recognizer wrapper is required to serve a request";
    v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_FAULT;
    uint32_t v14 = 2;
    goto LABEL_6;
  }
LABEL_24:

  return v15;
}

- (void)_cleanupCachedRecognizersTargetLifetime:(id)a3
{
  id v20 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  id v5 = v4;
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v6 = (id)qword_10002B138;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Starting scheduled recognizer cleanup at %f", buf, 0xCu);
  }

  id v7 = +[NSMutableArray array];
  cachedRecognizersByConfigurationKey = self->_cachedRecognizersByConfigurationKey;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000075B4;
  v25[3] = &unk_100024A18;
  id v19 = v20;
  id v26 = v19;
  v28 = v5;
  id v9 = v7;
  id v27 = v9;
  [(NSMutableDictionary *)cachedRecognizersByConfigurationKey enumerateKeysAndObjectsUsingBlock:v25];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (qword_10002B188 == -1)
        {
          id v16 = (id)qword_10002B138;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
LABEL_15:
          *(_DWORD *)buf = 138412290;
          id v31 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Evicting recognizer with config key: %@", buf, 0xCu);
          goto LABEL_16;
        }
        dispatch_once(&qword_10002B188, &stru_100024A60);
        id v16 = (id)qword_10002B138;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
LABEL_16:

        [(NSMutableDictionary *)self->_cachedRecognizersByConfigurationKey removeObjectForKey:v15];
        if ([v15 isEqualToString:@"Math"])
        {
          uint64_t v14 = 2;
LABEL_9:
          [(CHPowerLogger *)self->_powerLogger logModelUnloaded:v14];
          continue;
        }
        if ([v15 isEqualToString:@"Sketch"])
        {
          uint64_t v14 = 12;
          goto LABEL_9;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v11);
  }

  if (qword_10002B188 != -1)
  {
    dispatch_once(&qword_10002B188, &stru_100024A60);
    id v17 = (id)qword_10002B138;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  id v17 = (id)qword_10002B138;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
LABEL_24:
    id v18 = [(NSMutableDictionary *)self->_cachedRecognizersByConfigurationKey count];
    *(_DWORD *)buf = 134217984;
    id v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Number of recognizers after clean-up: %lu", buf, 0xCu);
  }
LABEL_25:
}

- (BOOL)_hasCachedRecognizers
{
  return [(NSMutableDictionary *)self->_cachedRecognizersByConfigurationKey count] != 0;
}

- (void)optimizeResourceUsageWithTimeout:(double)a3 onQueue:(id)a4 idleCallbackBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007848;
  block[3] = &unk_100024A40;
  double v14 = a3;
  block[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_after(v10, v9, block);
}

+ (void)configureRecognizer:(id)a3 forRequest:(id)a4 locale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if (v8) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  dispatch_time_t v10 = (id)qword_10002B118;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "A valid recognizer is required", buf, 2u);
  }

  if (!v8)
  {
LABEL_9:
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v11 = (id)qword_10002B118;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "A valid recognition request is required", v14, 2u);
    }
  }
LABEL_14:
  [v7 setMaxRecognitionResultCount:[v8 maxRecognitionResultCount]];
  [v8 minimumDrawingSize];
  [v7 setMinimumDrawingSize:];
  uint64_t v12 = [v8 activeCharacterSetPerLocale];
  id v13 = [v12 objectForKeyedSubscript:v9];
  [v7 setActiveCharacterSet:v13];

  [v7 setContentType:[v8 contentType]];
  [v7 setAutoCapitalizationMode:[v8 autoCapitalizationMode]];
  [v7 setAutoCorrectionMode:[v8 autoCorrectionMode]];
  [v7 setBaseWritingDirection:[v8 baseWritingDirection]];
  [v7 setEnableCachingIfAvailable:[v8 enableCachingIfAvailable]];
  [v7 setEnableGen2ModelIfAvailable:[v8 enableGen2ModelIfAvailable]];
  [v7 setEnableGen2CharacterLMIfAvailable:[v8 enableGen2CharacterLMIfAvailable]];
}

+ (void)configureRecognizer:(id)a3 forRequest:(id)a4 locale:(id)a5 transientLexicon:(_LXLexicon *)a6 transientPhraseLexicon:(_LXLexicon *)a7 vocabulary:(void *)a8 textReplacements:(id)a9 addressBookLexicon:(id)a10
{
  id v20 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  id v18 = a10;
  [(id)objc_opt_class() configureRecognizer:v20 forRequest:v15 locale:v16];
  if ([v15 shouldUseTextReplacements]) {
    id v19 = v17;
  }
  else {
    id v19 = 0;
  }
  [v20 setTextReplacements:v19];
  [v20 setCustomLexicon:a6 customVocabulary:a8];
  [v20 updateAddressBookLexicon:v18];
  [v20 setCustomPhraseLexicon:a7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogger, 0);
  objc_storeStrong((id *)&self->_writingStatsByConfigurationKey, 0);

  objc_storeStrong((id *)&self->_cachedRecognizersByConfigurationKey, 0);
}

@end