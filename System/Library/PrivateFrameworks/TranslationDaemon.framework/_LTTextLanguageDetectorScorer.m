@interface _LTTextLanguageDetectorScorer
- (BOOL)hasWeightedLocale;
- (NSLocale)weightedLocale;
- (_LTTextLanguageDetectorScorer)initWithSupportedLocales:(id)a3;
- (void)append:(id)a3 recognizer:(id)a4;
- (void)weightedLocale;
@end

@implementation _LTTextLanguageDetectorScorer

- (_LTTextLanguageDetectorScorer)initWithSupportedLocales:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_LTTextLanguageDetectorScorer;
  v6 = [(_LTTextLanguageDetectorScorer *)&v23 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    items = v6->_items;
    v6->_items = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_supportedLocales, a3);
    v9 = (id)_LTOSLogLID();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v6->_supportedLocales;
      v11 = [MEMORY[0x263EFF980] array];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v12 = v10;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:buf count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = [*(id *)(*((void *)&v24 + 1) + 8 * v16) localeIdentifier];
            [v11 addObject:v17];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:buf count:16];
        }
        while (v14);
      }

      v18 = NSString;
      v19 = [v11 componentsJoinedByString:@",\n"];
      v20 = [v18 stringWithFormat:@"[ %@ ]", v19];

      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "supported locales for scoring: %{public}@", buf, 0xCu);
    }
    v21 = v6;
  }

  return v6;
}

- (void)append:(id)a3 recognizer:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 dominantLanguage];
  if (v8)
  {
    v9 = _LTLanguageCodeToSupportedLocale();
    v10 = [v7 languageHypothesesWithMaximum:4];
    v11 = [v10 objectForKeyedSubscript:v8];
    unint64_t v12 = +[_LTTokenizer _wordCount:v6 inLocale:v9];
    uint64_t v13 = [_LTTextLanguageDetectorScorerItem alloc];
    [v11 doubleValue];
    uint64_t v14 = -[_LTTextLanguageDetectorScorerItem initWithLocale:confidence:wordCount:](v13, "initWithLocale:confidence:wordCount:", v9, v12);
    if (v14) {
      [(NSMutableArray *)self->_items addObject:v14];
    }
  }
  else
  {
    uint64_t v15 = _LTOSLogLID();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v15;
      int v17 = 134217984;
      uint64_t v18 = [v6 length];
      _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "no scorable dominant language for text length: %zu", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (BOOL)hasWeightedLocale
{
  return [(NSMutableArray *)self->_items count] != 0;
}

- (NSLocale)weightedLocale
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v3 = _LTOSLogLID();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(_LTTextLanguageDetectorScorer *)(uint64_t)self weightedLocale];
  }
  double v4 = _LTPreferencesTextLIDScorerConfidenceThreshold();
  id v5 = _LTOSLogLID();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v43 = v4;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "weightedLocale confidence threshold from preferences: %f", buf, 0xCu);
  }
  id v6 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = self->_items;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v39;
    double v14 = 0.0;
    *(void *)&long long v9 = 134218240;
    long long v37 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_msgSend(v16, "confidence", v37, (void)v38);
        if (v17 >= v4)
        {
          v21 = [v16 locale];
          v22 = [v6 objectForKeyedSubscript:v21];
          [v22 doubleValue];
          double v24 = v23;
          [v16 score];
          double v26 = v24 + v25;

          long long v27 = [NSNumber numberWithDouble:v26];
          v28 = [v16 locale];
          [v6 setObject:v27 forKeyedSubscript:v28];

          v12 += [v16 wordCount];
          if (v26 > v14)
          {
            uint64_t v29 = [v16 locale];

            v11 = (void *)v29;
            double v14 = v26;
          }
        }
        else
        {
          uint64_t v18 = _LTOSLogLID();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v19 = v18;
            [v16 confidence];
            *(_DWORD *)buf = v37;
            double v43 = v20;
            __int16 v44 = 2048;
            double v45 = v4;
            _os_log_debug_impl(&dword_2600DC000, v19, OS_LOG_TYPE_DEBUG, "weightedLocale item confidence %f < confidence threshold %f, skipping", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    unint64_t v12 = 0;
    double v14 = 0.0;
  }

  uint64_t v30 = _LTOSLogLID();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    if (v12 <= 1) {
      uint64_t v32 = 1;
    }
    else {
      uint64_t v32 = v12;
    }
    double v33 = v14 / (double)v32;
    v34 = v30;
    double v35 = [v11 localeIdentifier];
    uint64_t v36 = [v6 count];
    *(_DWORD *)buf = 138544130;
    double v43 = v35;
    __int16 v44 = 2048;
    double v45 = v33;
    __int16 v46 = 2048;
    unint64_t v47 = v12;
    __int16 v48 = 2048;
    uint64_t v49 = v36;
    _os_log_debug_impl(&dword_2600DC000, v34, OS_LOG_TYPE_DEBUG, "weightedLocale is %{public}@ with score %f on %zd words from %zu locales", buf, 0x2Au);
  }
  return (NSLocale *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLocales, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)weightedLocale
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 8);
  v3 = a2;
  int v4 = 134217984;
  uint64_t v5 = [v2 count];
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "weightedLocale for %zu items", (uint8_t *)&v4, 0xCu);
}

@end