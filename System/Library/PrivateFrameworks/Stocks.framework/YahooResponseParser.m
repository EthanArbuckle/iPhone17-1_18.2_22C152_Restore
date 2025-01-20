@interface YahooResponseParser
+ (id)arrayWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4 wrapResultIfDictionary:(BOOL)a5;
+ (id)dictionaryWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4;
+ (id)objectOfClass:(Class)a3 withDictionaryKeyPath:(id)a4 inJSONObject:(id)a5;
+ (id)objectWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4;
+ (id)parseDataSourceMapFromDataSourceDictionaries:(id)a3;
+ (void)parseData:(id)a3 resultsHandler:(id)a4;
+ (void)parseExchangeDictionaries:(id)a3 parsedExchangeResult:(id)a4;
+ (void)parseStockQuoteDictionaries:(id)a3 withDataSources:(id)a4 parsedStockResult:(id)a5;
@end

@implementation YahooResponseParser

+ (id)objectWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4
{
  return (id)[a1 objectOfClass:0 withDictionaryKeyPath:a3 inJSONObject:a4];
}

+ (id)dictionaryWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 objectOfClass:objc_opt_class() withDictionaryKeyPath:v7 inJSONObject:v6];

  return v8;
}

+ (id)arrayWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4 wrapResultIfDictionary:(BOOL)a5
{
  BOOL v5 = a5;
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [a1 objectWithDictionaryKeyPath:v8 inJSONObject:a4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18[0] = v9;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
LABEL_6:
      v11 = v10;
      goto LABEL_10;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    goto LABEL_6;
  }
  v12 = StocksLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_222ED9000, v12, OS_LOG_TYPE_DEFAULT, "#YQLRequest Unexpected object %@ in key path %@; expected array or dictionary",
      (uint8_t *)&v14,
      0x16u);
  }

  v11 = 0;
LABEL_10:

  return v11;
}

+ (id)objectOfClass:(Class)a3 withDictionaryKeyPath:(id)a4 inJSONObject:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__0;
    v16[4] = __Block_byref_object_dispose__0;
    id v17 = v8;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__YahooResponseParser_objectOfClass_withDictionaryKeyPath_inJSONObject___block_invoke;
    v11[3] = &unk_26467DD90;
    v13 = v16;
    id v12 = v7;
    int v14 = &v18;
    Class v15 = a3;
    [v12 enumerateObjectsUsingBlock:v11];

    _Block_object_dispose(v16, 8);
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __72__YahooResponseParser_objectOfClass_withDictionaryKeyPath_inJSONObject___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:a2];
  if ([*(id *)(a1 + 32) count] - 1 <= a3)
  {
    if (!*(void *)(a1 + 56) || (objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v8 = *(void *)(a1 + 48);
      goto LABEL_7;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
      objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), v7);
      goto LABEL_13;
    }
    if (v7)
    {
      id v9 = StocksLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3 + 1);
        int v11 = 138412546;
        id v12 = v7;
        __int16 v13 = 2112;
        int v14 = v10;
        _os_log_impl(&dword_222ED9000, v9, OS_LOG_TYPE_DEFAULT, "#YQLRequest Unexpected object %@ in key path %@; expected dictionary",
          (uint8_t *)&v11,
          0x16u);
      }
    }
    *a4 = 1;
  }
LABEL_13:
}

+ (void)parseData:(id)a3 resultsHandler:(id)a4
{
  v22[6] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, void *))a4;
  id v18 = 0;
  uint64_t v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v18];
  id v9 = v18;
  v22[0] = @"query";
  v22[1] = @"results";
  v22[2] = @"item";
  v22[3] = @"response";
  v22[4] = @"finance";
  v22[5] = @"quote_service";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:6];
  int v11 = [a1 dictionaryWithDictionaryKeyPath:v10 inJSONObject:v8];

  if (!v11)
  {
    id v17 = 0;
    __int16 v13 = 0;
LABEL_6:
    uint64_t v15 = 0;
    goto LABEL_7;
  }
  v21[0] = @"quotes";
  v21[1] = @"quote";
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  __int16 v13 = [a1 arrayWithDictionaryKeyPath:v12 inJSONObject:v11 wrapResultIfDictionary:1];

  if (!v13)
  {
    id v17 = 0;
    goto LABEL_6;
  }
  v20[0] = @"exchanges";
  v20[1] = @"exchange";
  int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  uint64_t v15 = [a1 arrayWithDictionaryKeyPath:v14 inJSONObject:v11 wrapResultIfDictionary:1];

  v19[0] = @"data_sources";
  v19[1] = @"data_source";
  __int16 v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  id v17 = [a1 arrayWithDictionaryKeyPath:v16 inJSONObject:v11 wrapResultIfDictionary:1];

LABEL_7:
  v7[2](v7, v15, v13, v17);
}

+ (id)parseDataSourceMapFromDataSourceDictionaries:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  BOOL v5 = [v3 dictionary];
  id v6 = +[YQLConstants YQLDataSourceToStocksKeyMap];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__YahooResponseParser_parseDataSourceMapFromDataSourceDictionaries___block_invoke;
  v12[3] = &unk_26467DDE0;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  id v8 = v6;
  [v4 enumerateObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __68__YahooResponseParser_parseDataSourceMapFromDataSourceDictionaries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __68__YahooResponseParser_parseDataSourceMapFromDataSourceDictionaries___block_invoke_18;
    id v13 = &unk_26467DDB8;
    id v14 = v3;
    id v6 = v4;
    uint64_t v15 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:&v10];
    id v7 = [v6 objectForKeyedSubscript:@"id", v10, v11, v12, v13];
    id v8 = v7;
    if (v7)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue"));
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v9];
    }
  }
  else
  {
    id v6 = StocksLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v3;
      _os_log_impl(&dword_222ED9000, v6, OS_LOG_TYPE_DEFAULT, "#StockUpdater Invalid data source dictionary %@", buf, 0xCu);
    }
  }
}

void __68__YahooResponseParser_parseDataSourceMapFromDataSourceDictionaries___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  BOOL v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

+ (void)parseExchangeDictionaries:(id)a3 parsedExchangeResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[YQLConstants YQLExchangeToStocksKeyMap];
  if (parseExchangeDictionaries_parsedExchangeResult__onceToken != -1) {
    dispatch_once(&parseExchangeDictionaries_parsedExchangeResult__onceToken, &__block_literal_global_12);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2;
  v10[3] = &unk_26467DE08;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:v10];
}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"name";
  v3[0] = @"name";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)parseExchangeDictionaries_parsedExchangeResult__exchangeKeyMap;
  parseExchangeDictionaries_parsedExchangeResult__exchangeKeyMap = v0;
}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v5 = (void *)parseExchangeDictionaries_parsedExchangeResult__exchangeKeyMap;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_23;
    id v23 = &unk_26467DDB8;
    id v6 = v3;
    id v24 = v6;
    id v7 = v4;
    v25 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:&v20];
    id v8 = [v7 yql_objectForKey:@"name", objc_opt_class(), v20, v21, v22, v23 ofClass];
    if (v8)
    {
      if (YQLRegionKey_block_invoke_onceToken != -1) {
        dispatch_once(&YQLRegionKey_block_invoke_onceToken, &__block_literal_global_27);
      }
      id v9 = objc_msgSend(v6, "yql_objectForKey:ofClass:", @"next_open", objc_opt_class());
      uint64_t v10 = [(id)YQLRegionKey_block_invoke_dateFormatter dateFromString:v9];
      if (v10) {
        [v7 setObject:v10 forKeyedSubscript:@"nextOpenDate"];
      }
      id v11 = objc_msgSend(v6, "yql_objectForKey:ofClass:", @"status", objc_opt_class());
      if (!v11
        || ([*(id *)(a1 + 32) objectForKeyedSubscript:v11],
            (id v12 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v13 = StocksLogForCategory(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2_cold_2((uint64_t)v11, (uint64_t)v6, v13);
        }

        id v12 = &unk_26D5E9030;
      }
      uint64_t v14 = a1;
      [v7 setObject:v12 forKeyedSubscript:@"status"];
      uint64_t v15 = objc_msgSend(v6, "yql_objectForKey:ofClass:", @"stream_interval", objc_opt_class());
      __int16 v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 integerValue];
        double v18 = (double)v17;
        if (!v17) {
          double v18 = *MEMORY[0x263EFFAF0];
        }
        v19 = [NSNumber numberWithDouble:v18];
        [v7 setObject:v19 forKeyedSubscript:@"streamInterval"];
      }
      (*(void (**)(void))(*(void *)(v14 + 40) + 16))();
    }
    else
    {
      id v9 = StocksLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2_cold_1((uint64_t)v6, v9);
      }
    }
  }
  else
  {
    id v7 = StocksLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v3;
      _os_log_impl(&dword_222ED9000, v7, OS_LOG_TYPE_DEFAULT, "#StockUpdater Invalid exchange dictionary %@", buf, 0xCu);
    }
  }
}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_25()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)YQLRegionKey_block_invoke_dateFormatter;
  YQLRegionKey_block_invoke_dateFormatter = (uint64_t)v0;

  [(id)YQLRegionKey_block_invoke_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  v2 = (void *)YQLRegionKey_block_invoke_dateFormatter;
  id v3 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];

  id v4 = (void *)YQLRegionKey_block_invoke_dateFormatter;
  id v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];
}

+ (void)parseStockQuoteDictionaries:(id)a3 withDataSources:(id)a4 parsedStockResult:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v33 = a4;
  v34 = (void (**)(id, void *, void *))a5;
  id v8 = +[YQLConstants YQLQuoteToStocksKeyMap];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v44;
    v32 = @"dataSource";
    uint64_t v35 = *(void *)v44;
    do
    {
      uint64_t v12 = 0;
      uint64_t v36 = v10;
      do
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
          uint64_t v17 = v15;
          if (!v16) {
            goto LABEL_23;
          }
          uint64_t v18 = v16;
          uint64_t v38 = v12;
          uint64_t v19 = *(void *)v40;
          uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v40 != v19) {
                objc_enumerationMutation(v15);
              }
              v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v23 = objc_msgSend(v8, "objectForKeyedSubscript:", v22, v32);

              if (v23)
              {
                id v24 = [v15 objectForKeyedSubscript:v22];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if ([v22 isEqualToString:@"price"])
                  {
                    v25 = [v24 objectForKey:@"data_source"];
                    uint64_t v20 = [v25 integerValue];
                  }
                  uint64_t v26 = [v24 objectForKey:@"raw"];

                  id v24 = (void *)v26;
                }
                id v27 = [v8 objectForKeyedSubscript:v22];
                [v14 setObject:v24 forKey:v27];
              }
            }
            uint64_t v18 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v18);

          uint64_t v11 = v35;
          uint64_t v10 = v36;
          uint64_t v12 = v38;
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v28 = [NSNumber numberWithInteger:v20];
            uint64_t v17 = [v33 objectForKeyedSubscript:v28];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v14 setObject:v17 forKey:v32];
            }
LABEL_23:
          }
          v29 = objc_msgSend(v15, "objectForKeyedSubscript:", @"id_symbol", v32);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v31 = [v15 objectForKeyedSubscript:@"id_symbol"];
            v34[2](v34, v31, v14);
          }
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v10);
  }
}

+ (void)parseData:(uint64_t)a1 resultsHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "+[YahooResponseParser parseData:resultsHandler:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_222ED9000, a2, OS_LOG_TYPE_ERROR, "*** [%s] Caught exception: %@", (uint8_t *)&v2, 0x16u);
}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222ED9000, a2, OS_LOG_TYPE_ERROR, "#StockUpdater Received exchange with missing ID! This is bad. Exchange dictionary: %@", (uint8_t *)&v2, 0xCu);
}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_222ED9000, log, OS_LOG_TYPE_ERROR, "#StockUpdater Unknown or missing market status %@ for #exchange %@", (uint8_t *)&v3, 0x16u);
}

@end