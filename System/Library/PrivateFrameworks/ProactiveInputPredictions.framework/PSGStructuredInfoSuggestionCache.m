@interface PSGStructuredInfoSuggestionCache
+ (BOOL)_matchesPredictedValue:(id)a3 prefixValue:(id)a4;
+ (PSGStructuredInfoSuggestionCache)sharedInstance;
+ (id)emptySuggestionsPlaceholder;
- (BOOL)_isCacheEmpty;
- (BOOL)_maybeClearCache;
- (PSGStructuredInfoSuggestionCache)initWithTTLSeconds:(double)a3;
- (id)searchWithContext:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5;
- (id)searchWithTrigger:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5;
- (void)addEmptyPlaceholderForTrigger:(id)a3 localeIdentifier:(id)a4;
- (void)addStructuredInfoSuggestions:(id)a3 localeIdentifier:(id)a4;
- (void)invalidate;
@end

@implementation PSGStructuredInfoSuggestionCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSuggestions, 0);
}

- (BOOL)_maybeClearCache
{
  [(NSDate *)self->_startTime timeIntervalSinceNow];
  double v4 = -v3;
  double ttlSeconds = self->_ttlSeconds;
  if (ttlSeconds < -v3) {
    [(PSGStructuredInfoSuggestionCache *)self invalidate];
  }
  return ttlSeconds < v4;
}

- (BOOL)_isCacheEmpty
{
  cachedSuggestions = self->_cachedSuggestions;
  if (!cachedSuggestions) {
    return 1;
  }
  double v4 = [(_PASTuple2 *)cachedSuggestions first];
  if (v4)
  {
    v5 = [(_PASTuple2 *)self->_cachedSuggestions second];
    if (v5)
    {
      v6 = [(_PASTuple2 *)self->_cachedSuggestions second];
      v7 = [(id)objc_opt_class() emptySuggestionsPlaceholder];
      if (v6 == v7)
      {
        BOOL v9 = 0;
      }
      else
      {
        v8 = [(_PASTuple2 *)self->_cachedSuggestions second];
        BOOL v9 = [v8 count] == 0;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)invalidate
{
  self->_cachedSuggestions = 0;
  MEMORY[0x270F9A758]();
}

- (id)searchWithContext:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([(PSGStructuredInfoSuggestionCache *)self _isCacheEmpty]
    || ![v8 isEqualToString:self->_localeIdentifier])
  {
    v11 = 0;
  }
  else
  {
    BOOL v9 = [v7 componentsSeparatedByString:@" "];
    v10 = [v9 lastObject];

    if ([v10 length] && !-[PSGStructuredInfoSuggestionCache _maybeClearCache](self, "_maybeClearCache"))
    {
      id v21 = v8;
      id v22 = v7;
      v11 = objc_opt_new();
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v12 = [(_PASTuple2 *)self->_cachedSuggestions second];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
LABEL_9:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v24 + 1) + 8 * v16);
          v18 = objc_opt_class();
          v19 = [v17 predictedValue];
          LODWORD(v18) = [v18 _matchesPredictedValue:v19 prefixValue:v10];

          if (v18)
          {
            [v11 addObject:v17];
            if ([v11 count] == a5) {
              break;
            }
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v14) {
              goto LABEL_9;
            }
            break;
          }
        }
      }

      if (![v11 count]) {
        [(PSGStructuredInfoSuggestionCache *)self invalidate];
      }
      id v8 = v21;
      id v7 = v22;
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

- (id)searchWithTrigger:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([(PSGStructuredInfoSuggestionCache *)self _isCacheEmpty]
    || ![v9 isEqualToString:self->_localeIdentifier]
    || [(PSGStructuredInfoSuggestionCache *)self _maybeClearCache])
  {
    v10 = 0;
    goto LABEL_5;
  }
  v12 = [(_PASTuple2 *)self->_cachedSuggestions first];
  uint64_t v13 = [v12 triggerAttributes];

  uint64_t v14 = [v8 triggerAttributes];
  int v15 = [v13 isEqualToDictionary:v14];

  if (v15)
  {
    uint64_t v16 = psg_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_20A02A000, v16, OS_LOG_TYPE_DEBUG, "[StructuredInfoCache] Exact trigger match", buf, 2u);
    }

    v17 = [(_PASTuple2 *)self->_cachedSuggestions second];
    goto LABEL_16;
  }
  v18 = [v8 triggerCategory];
  if (v18 != @"TaggedTextFieldContactsAutocomplete")
  {

LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  v19 = [(_PASTuple2 *)self->_cachedSuggestions first];
  v20 = [v19 triggerCategory];

  if (v20 != @"TaggedTextFieldContactsAutocomplete") {
    goto LABEL_15;
  }
  id v22 = [v8 triggerAttributes];
  v23 = +[PSGProactiveTrigger getSearchTerm:v22];

  long long v24 = +[PSGProactiveTrigger getSearchTerm:v13];
  if (![v23 length]
    || ![v24 length]
    || ![v23 hasPrefix:v24])
  {
    v17 = 0;
LABEL_41:

LABEL_16:
    if ([v17 count])
    {
      if ([v17 count] <= a5)
      {
        id v21 = v17;
        v17 = v21;
      }
      else
      {
        objc_msgSend(v17, "subarrayWithRange:", 0, a5);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v21;
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_22;
  }
  long long v25 = psg_default_log_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20A02A000, v25, OS_LOG_TYPE_DEBUG, "[StructuredInfoCache] Partial trigger match for Contacts Autocomplete", buf, 2u);
  }

  long long v26 = [(_PASTuple2 *)self->_cachedSuggestions second];
  long long v27 = [(id)objc_opt_class() emptySuggestionsPlaceholder];

  if (v26 != v27)
  {
    v38 = v24;
    v17 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = [(_PASTuple2 *)self->_cachedSuggestions second];
    uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v44;
      v39 = v23;
      while (2)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v30 = [v29 portraitItem];
          v31 = [v30 name];

          if ([v31 length])
          {
            if (_PASInsensitiveStringContainsString())
            {
              v32 = [PSGStructuredInfoSuggestion alloc];
              v33 = [v29 portraitItem];
              v34 = [v29 operationalItem];
              v35 = [(PSGStructuredInfoSuggestion *)v32 initWithProactiveTrigger:v8 portraitItem:v33 operationalItem:v34];

              [v17 addObject:v35];
              uint64_t v36 = [v17 count];

              BOOL v37 = v36 == a5;
              v23 = v39;
              if (v37)
              {

                goto LABEL_44;
              }
            }
          }
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }
LABEL_44:

    long long v24 = v38;
    goto LABEL_41;
  }
  v10 = [(_PASTuple2 *)self->_cachedSuggestions second];

  v17 = 0;
LABEL_22:

LABEL_5:
  return v10;
}

- (void)addEmptyPlaceholderForTrigger:(id)a3 localeIdentifier:(id)a4
{
  v6 = (NSString *)a4;
  id v7 = (void *)MEMORY[0x263F61EA8];
  id v8 = a3;
  id v9 = [(id)objc_opt_class() emptySuggestionsPlaceholder];
  v10 = [v7 tupleWithFirst:v8 second:v9];

  cachedSuggestions = self->_cachedSuggestions;
  self->_cachedSuggestions = v10;

  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = v6;
  int v15 = v6;

  uint64_t v13 = [MEMORY[0x263EFF910] date];
  startTime = self->_startTime;
  self->_startTime = v13;
}

- (void)addStructuredInfoSuggestions:(id)a3 localeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    v23 = psg_default_log_handle();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      goto LABEL_11;
    }
    __int16 v29 = 0;
    long long v24 = "Trying to add empty structured info array to cache.";
    long long v25 = (uint8_t *)&v29;
LABEL_13:
    _os_log_error_impl(&dword_20A02A000, v23, OS_LOG_TYPE_ERROR, v24, v25, 2u);
    goto LABEL_10;
  }
  id obj = a4;
  id v27 = v7;
  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v8 = 1;
    while (1)
    {
      id v9 = [v6 objectAtIndexedSubscript:v8];
      v10 = [v9 proactiveTrigger];
      v11 = [v10 triggerAttributes];
      v12 = [v6 firstObject];
      uint64_t v13 = [v12 proactiveTrigger];
      uint64_t v14 = [v13 triggerAttributes];
      char v15 = [v11 isEqualToDictionary:v14];

      if ((v15 & 1) == 0) {
        break;
      }
      if (++v8 >= (unint64_t)[v6 count]) {
        goto LABEL_6;
      }
    }
    v23 = psg_default_log_handle();
    id v7 = v27;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    long long v24 = "Trigger is inconsistent for the structured info array.";
    long long v25 = buf;
    goto LABEL_13;
  }
LABEL_6:
  uint64_t v16 = (void *)MEMORY[0x263F61EA8];
  v17 = [v6 firstObject];
  v18 = [v17 proactiveTrigger];
  v19 = [v16 tupleWithFirst:v18 second:v6];
  cachedSuggestions = self->_cachedSuggestions;
  self->_cachedSuggestions = v19;

  objc_storeStrong((id *)&self->_localeIdentifier, obj);
  id v21 = [MEMORY[0x263EFF910] date];
  startTime = self->_startTime;
  self->_startTime = v21;

  id v7 = v27;
LABEL_11:
}

- (PSGStructuredInfoSuggestionCache)initWithTTLSeconds:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSGStructuredInfoSuggestionCache;
  result = [(PSGStructuredInfoSuggestionCache *)&v5 init];
  if (result) {
    result->_double ttlSeconds = a3;
  }
  return result;
}

+ (BOOL)_matchesPredictedValue:(id)a3 prefixValue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (([v5 hasPrefix:v6] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    int v9 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0));

    if (!v9
      || (long long v19 = 0u,
          long long v20 = 0u,
          long long v17 = 0u,
          long long v18 = 0u,
          (uint64_t v10 = [&unk_26BE13368 countByEnumeratingWithState:&v17 objects:v21 count:16]) == 0))
    {
      BOOL v7 = 0;
      goto LABEL_14;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_6:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(&unk_26BE13368);
      }
      uint64_t v14 = [NSString stringWithString:*(void *)(*((void *)&v17 + 1) + 8 * v13)];
      char v15 = [(id)v14 stringByAppendingString:v6];

      LOBYTE(v14) = [v5 hasPrefix:v15];
      if (v14) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [&unk_26BE13368 countByEnumeratingWithState:&v17 objects:v21 count:16];
        BOOL v7 = 0;
        if (v11) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }
  }
  BOOL v7 = 1;
LABEL_14:

  return v7;
}

+ (id)emptySuggestionsPlaceholder
{
  if (emptySuggestionsPlaceholder__pasOnceToken3 != -1) {
    dispatch_once(&emptySuggestionsPlaceholder__pasOnceToken3, &__block_literal_global_915);
  }
  v2 = (void *)emptySuggestionsPlaceholder__pasExprOnceResult;
  return v2;
}

void __63__PSGStructuredInfoSuggestionCache_emptySuggestionsPlaceholder__block_invoke()
{
  v0 = (void *)MEMORY[0x2105116B0]();
  v1 = (void *)emptySuggestionsPlaceholder__pasExprOnceResult;
  emptySuggestionsPlaceholder__pasExprOnceResult = MEMORY[0x263EFFA68];
}

+ (PSGStructuredInfoSuggestionCache)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__PSGStructuredInfoSuggestionCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_917 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_917, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_918;
  return (PSGStructuredInfoSuggestionCache *)v2;
}

void __50__PSGStructuredInfoSuggestionCache_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x2105116B0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithTTLSeconds:180.0];
  double v4 = (void *)sharedInstance__pasExprOnceResult_918;
  sharedInstance__pasExprOnceResult_918 = v3;
}

@end