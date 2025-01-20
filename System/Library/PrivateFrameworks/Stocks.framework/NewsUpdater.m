@interface NewsUpdater
+ (id)_newsItemCollectionCache;
+ (id)sharedNewsUpdater;
- (BOOL)shouldReloadOnResume;
- (NewsUpdater)init;
- (NewsUpdaterDelegate)delegate;
- (void)clearNewsCacheOnDisk;
- (void)didParseData;
- (void)failWithError:(id)a3;
- (void)fetchNewsForStock:(id)a3;
- (void)fetchNewsForStock:(id)a3 withCompletion:(id)a4;
- (void)loadNewsCacheFromDiskForSymbol:(id)a3;
- (void)parseData:(id)a3;
- (void)resetLocale;
- (void)saveLastResponse;
- (void)setDelegate:(id)a3;
@end

@implementation NewsUpdater

+ (id)sharedNewsUpdater
{
  v2 = (void *)sharedNewsUpdater_sharedNewsUpdater;
  if (!sharedNewsUpdater_sharedNewsUpdater)
  {
    v3 = objc_alloc_init(NewsUpdater);
    v4 = (void *)sharedNewsUpdater_sharedNewsUpdater;
    sharedNewsUpdater_sharedNewsUpdater = (uint64_t)v3;

    v2 = (void *)sharedNewsUpdater_sharedNewsUpdater;
  }

  return v2;
}

+ (id)_newsItemCollectionCache
{
  v2 = (void *)_cache;
  if (!_cache)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:20];
    v4 = (void *)_cache;
    _cache = v3;

    v2 = (void *)_cache;
  }

  return v2;
}

- (NewsUpdater)init
{
  v3.receiver = self;
  v3.super_class = (Class)NewsUpdater;
  result = [(YQLRequest *)&v3 init];
  if (result) {
    result->_firstLoad = 1;
  }
  return result;
}

- (BOOL)shouldReloadOnResume
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"nidtk"];
  BOOL v4 = CFAbsoluteTimeGetCurrent() - v3 > 1800.0;

  return v4;
}

- (void)clearNewsCacheOnDisk
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 removeObjectForKey:@"nidtk"];
  [v2 removeObjectForKey:@"nidak"];
}

- (void)loadNewsCacheFromDiskForSymbol:(id)a3
{
  id v12 = a3;
  if ([v12 length])
  {
    BOOL v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 doubleForKey:@"nidtk"];
    double v6 = v5;
    if (CFAbsoluteTimeGetCurrent() - v5 <= 345600.0)
    {
      v7 = [v4 arrayForKey:@"nidak"];
      if (v7)
      {
        v8 = [[StockNewsItemCollection alloc] initWithArchiveArray:v7];
        v9 = [(StockNewsItemCollection *)v8 newsItems];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          [(StockNewsItemCollection *)v8 setExpirationTime:v6 + 60.0];
          v11 = +[NewsUpdater _newsItemCollectionCache];
          [v11 setObject:v8 forKey:v12];
        }
      }
    }
    else
    {
      [(NewsUpdater *)self clearNewsCacheOnDisk];
    }
  }
}

- (void)fetchNewsForStock:(id)a3 withCompletion:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  v8 = (Stock *)a3;
  id v9 = a4;
  uint64_t v10 = StocksLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(Stock *)v8 symbol];
    id v12 = +[NetPreferences sharedPreferences];
    int v13 = [v12 isNetworkReachable];
    v14 = "NO";
    if (v13) {
      v14 = "YES";
    }
    *(_DWORD *)buf = 138412546;
    v64 = v11;
    __int16 v65 = 2080;
    v66 = v14;
    _os_log_impl(&dword_222ED9000, v10, OS_LOG_TYPE_DEFAULT, "#NewsUpdater fetchNewsForStock: %@ (reachable: %s)", buf, 0x16u);
  }
  if (!v8)
  {
    v52 = [MEMORY[0x263F08690] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"NewsUpdater.m", 261, @"Invalid parameter not satisfying: %@", @"stock != nil" object file lineNumber description];
  }
  char v15 = [(id)objc_opt_class() shouldGenerateOfflineData];
  v16 = +[NetPreferences sharedPreferences];
  char v17 = [v16 isNetworkReachable];

  if (v17)
  {
    if (!v8)
    {
      [(YQLRequest *)self cancel];
      id stock = self->_stock;
      self->_id stock = 0;
      goto LABEL_38;
    }
    if (self->_stock == v8)
    {
      v27 = StocksLogForCategory(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [(Stock *)self->_stock symbol];
        *(_DWORD *)buf = 138412290;
        v64 = v28;
        _os_log_impl(&dword_222ED9000, v27, OS_LOG_TYPE_DEFAULT, "#NewsUpdater Skipping duplicate news update request for %@", buf, 0xCu);
      }
      id updateCompletionHandler = self->_updateCompletionHandler;
      if (updateCompletionHandler)
      {
        v30 = (void *)[updateCompletionHandler copy];
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke;
        v58[3] = &unk_26467D288;
        id v59 = v30;
        id v60 = v9;
        id stock = v30;
        v31 = (void *)MEMORY[0x223CABDA0](v58);
        id v32 = self->_updateCompletionHandler;
        self->_id updateCompletionHandler = v31;
      }
      else
      {
        v33 = (void *)[v9 copy];
        id stock = self->_updateCompletionHandler;
        self->_id updateCompletionHandler = v33;
      }
    }
    else
    {
      v18 = (void *)[v9 copy];
      id v19 = self->_updateCompletionHandler;
      self->_id updateCompletionHandler = v18;

      [(YQLRequest *)self cancel];
      if (self->_firstLoad) {
        char v20 = v15;
      }
      else {
        char v20 = 1;
      }
      if ((v20 & 1) == 0)
      {
        self->_firstLoad = 0;
        id stock = [MEMORY[0x263EFFA40] standardUserDefaults];
        [stock doubleForKey:@"nidtk"];
        double v23 = v22;
        [stock removeObjectForKey:@"nidtk"];
        if (CFAbsoluteTimeGetCurrent() - v23 <= 1800.0)
        {
          v24 = [stock objectForKey:@"nidak"];
          [stock removeObjectForKey:@"nidak"];
          [stock synchronize];
          if ([v24 count])
          {
            self->_lastResponseTimestamp = v23;
            v25 = [[StockNewsItemCollection alloc] initWithArchiveArray:v24];
            lastNewsItemCollection = self->_lastNewsItemCollection;
            self->_lastNewsItemCollection = v25;

            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke_2;
            block[3] = &unk_26467D130;
            block[4] = self;
            dispatch_async(MEMORY[0x263EF83A0], block);

            goto LABEL_38;
          }
        }
      }
      v34 = +[NewsUpdater _newsItemCollectionCache];
      v35 = [(Stock *)v8 symbol];
      id stock = [v34 objectForKey:v35];

      if (stock) {
        char v36 = v15;
      }
      else {
        char v36 = 1;
      }
      if ((v36 & 1) != 0
        || (double Current = CFAbsoluteTimeGetCurrent(), [stock expirationTime], Current >= v38)
        || ([stock newsItems],
            v39 = objc_claimAutoreleasedReturnValue(),
            uint64_t v40 = [v39 count],
            v39,
            !v40))
      {
        id v55 = v9;
        objc_storeStrong((id *)&self->_stock, a3);
        v41 = +[NetPreferences sharedPreferences];
        v42 = [(YQLRequest *)self YQLLanguageCode];
        v43 = [(YQLRequest *)self YQLCountryCode];
        v62[0] = @"json";
        v61[0] = @"format";
        v61[1] = @"tickers";
        v44 = [(Stock *)v8 symbol];
        v62[1] = v44;
        v62[2] = v42;
        v61[2] = @"lang";
        v61[3] = @"region";
        v62[3] = v43;
        v45 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:4];

        v46 = [v41 stocksYQLBaseURL];
        v47 = [v46 URLByAppendingPathComponent:@"applewf/news"];

        v48 = [v41 signedRequestForURL:v47 parameters:v45];
        if ([v41 serviceDebugging])
        {
          v53 = v43;
          v49 = [v48 URL];
          [v49 absoluteString];
          v50 = v54 = v42;
          +[YQLRequest appendDebugString:v50];

          v51 = [NSString stringWithFormat:@"%@", v45];
          v42 = v54;
          +[YQLRequest appendDebugString:v51];

          v43 = v53;
        }
        [(YQLRequest *)self loadRequest:v48];

        id v9 = v55;
      }
      else
      {
        objc_storeStrong((id *)&self->_lastNewsItemCollection, stock);
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke_3;
        v56[3] = &unk_26467D130;
        v56[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], v56);
      }
    }
  }
  else
  {
    if (!self->_stock) {
      objc_storeStrong((id *)&self->_stock, a3);
    }
    id stock = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.stocks" code:3 userInfo:0];
    [(NewsUpdater *)self failWithError:stock];
  }
LABEL_38:
}

uint64_t __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v9);
  }

  return MEMORY[0x270F9A790]();
}

uint64_t __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didParseData];
}

uint64_t __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didParseData];
}

- (void)fetchNewsForStock:(id)a3
{
}

- (void)saveLastResponse
{
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 setDouble:@"nidtk" forKey:self->_lastResponseTimestamp];
  double v3 = [(StockNewsItemCollection *)self->_lastNewsItemCollection archiveArray];
  [v4 setObject:v3 forKey:@"nidak"];
}

- (void)parseData:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  uint64_t v82 = 0;
  id v68 = a3;
  uint64_t v3 = objc_msgSend(MEMORY[0x263F08900], "JSONObjectWithData:options:error:");
  id v66 = 0;
  uint64_t v67 = (void *)v3;
  v69 = +[YahooResponseParser arrayWithDictionaryKeyPath:&unk_26D5E9810 inJSONObject:v3 wrapResultIfDictionary:1];
  if (!v69)
  {
    [(YQLRequest *)self failToParseWithData:v68];
    goto LABEL_53;
  }
  id v71 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = v69;
  uint64_t v4 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
  if (v4)
  {
    uint64_t v73 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v79 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v7 = [v6 objectForKeyedSubscript:@"headline"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v8 = objc_alloc_init(StockNewsItem);
            uint64_t v9 = objc_opt_class();
            v89 = @"title";
            uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
            uint64_t v11 = +[YahooResponseParser objectOfClass:v9 withDictionaryKeyPath:v10 inJSONObject:v7];
            [(StockNewsItem *)v8 setHeadline:v11];

            id v12 = [(StockNewsItem *)v8 headline];
            LOBYTE(v11) = [v12 length] == 0;

            if ((v11 & 1) == 0)
            {
              uint64_t v13 = objc_opt_class();
              v88 = @"shortSummary";
              v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
              char v15 = +[YahooResponseParser objectOfClass:v13 withDictionaryKeyPath:v14 inJSONObject:v7];
              [(StockNewsItem *)v8 setSummary:v15];

              v16 = StocksLogForCategory(0);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                char v17 = [(StockNewsItem *)v8 headline];
                *(_DWORD *)buf = 138412290;
                v87 = v17;
                _os_log_impl(&dword_222ED9000, v16, OS_LOG_TYPE_INFO, "#NewsUpdater headline: %@", buf, 0xCu);
              }
              v18 = StocksLogForCategory(0);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                id v19 = [(StockNewsItem *)v8 summary];
                *(_DWORD *)buf = 138412290;
                v87 = v19;
                _os_log_impl(&dword_222ED9000, v18, OS_LOG_TYPE_INFO, "#NewsUpdater summary: %@", buf, 0xCu);
              }
              uint64_t v20 = objc_opt_class();
              v85 = @"url";
              v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
              double v22 = +[YahooResponseParser objectOfClass:v20 withDictionaryKeyPath:v21 inJSONObject:v7];

              double v23 = objc_msgSend(NSURL, "stocks_sanitizedURLFromString:", v22);
              if (v23)
              {
                [(StockNewsItem *)v8 setLink:v23];
                v24 = StocksLogForCategory(0);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  v25 = [(StockNewsItem *)v8 link];
                  *(_DWORD *)buf = 138412290;
                  v87 = v25;
                  _os_log_impl(&dword_222ED9000, v24, OS_LOG_TYPE_INFO, "#NewsUpdater URL: %@", buf, 0xCu);
                }
                v26 = [v6 objectForKeyedSubscript:@"meta"];
                uint64_t v27 = objc_opt_class();
                v84[0] = @"provider";
                v84[1] = @"name";
                v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
                v29 = +[YahooResponseParser objectOfClass:v27 withDictionaryKeyPath:v28 inJSONObject:v26];
                [(StockNewsItem *)v8 setSource:v29];

                v30 = [v26 objectForKeyedSubscript:@"publishTime"];
                if (v30)
                {
                  v31 = (void *)parseData__formatter;
                  if (!parseData__formatter)
                  {
                    id v32 = objc_alloc_init(MEMORY[0x263F08790]);
                    v33 = (void *)parseData__formatter;
                    parseData__formatter = (uint64_t)v32;

                    [(id)parseData__formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z"];
                    v34 = (void *)parseData__formatter;
                    v35 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
                    [v34 setTimeZone:v35];

                    char v36 = (void *)parseData__formatter;
                    v37 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
                    [v36 setLocale:v37];

                    v31 = (void *)parseData__formatter;
                  }
                  uint64_t v38 = [v31 dateFromString:v30];
                  [(StockNewsItem *)v8 setDate:v38];

                  v39 = [(StockNewsItem *)v8 date];
                  LOBYTE(v38) = v39 == 0;

                  if ((v38 & 1) == 0)
                  {
                    uint64_t v40 = StocksLogForCategory(0);
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                    {
                      v41 = [(StockNewsItem *)v8 date];
                      *(_DWORD *)buf = 138412290;
                      v87 = v41;
                      _os_log_impl(&dword_222ED9000, v40, OS_LOG_TYPE_INFO, "#NewsUpdater date: %@", buf, 0xCu);
                    }
                    [v71 addObject:v8];
                  }
                }
              }
              else
              {
                v26 = StocksLogForCategory(0);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v87 = v22;
                  _os_log_impl(&dword_222ED9000, v26, OS_LOG_TYPE_DEFAULT, "#NewsUpdater Skipping news item with unparsable URL %@", buf, 0xCu);
                }
              }
            }
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
    }
    while (v4);
  }

  [v71 sortUsingSelector:sel_chronologicalComparisonWithNewsItem_];
  v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v71, "count"));
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v43 = v71;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v44)
  {
    v45 = 0;
    v46 = 0;
    uint64_t v47 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v75 != v47) {
          objc_enumerationMutation(v43);
        }
        v49 = *(void **)(*((void *)&v74 + 1) + 8 * j);
        uint64_t v50 = [v49 headline];

        v45 = (void *)v50;
        if ([v42 containsObject:v50])
        {
          if (v46) {
            [v46 addObject:v49];
          }
          else {
            v46 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v49, 0);
          }
        }
        else
        {
          [v42 addObject:v50];
        }
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v44);

    if (v46) {
      [v43 removeObjectsInArray:v46];
    }
  }
  else
  {

    v46 = 0;
    v45 = 0;
  }
  v51 = [(Stock *)self->_stock symbol];
  v52 = +[NewsUpdater _newsItemCollectionCache];
  v53 = [v52 objectForKey:v51];

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (![v43 count])
  {
    id v59 = [v53 newsItems];
    if ([v59 count])
    {
      [v53 expirationTime];
      BOOL v61 = v60 + -60.0 > Current + -345600.0;

      if (v61)
      {
        v62 = (void *)MEMORY[0x263EFF8C0];
        v63 = [v53 newsItems];
        v64 = [v62 arrayWithArray:v63];
        [v53 setNewsItems:v64];

        objc_storeStrong((id *)&self->_lastNewsItemCollection, v53);
        [(StockNewsItemCollection *)self->_lastNewsItemCollection expirationTime];
        self->_lastResponseTimestamp = v65 + -60.0;
        goto LABEL_50;
      }
    }
    else
    {
    }
  }
  self->_lastResponseTimestamp = Current;
  id v55 = objc_alloc_init(StockNewsItemCollection);
  lastNewsItemCollection = self->_lastNewsItemCollection;
  self->_lastNewsItemCollection = v55;

  [(StockNewsItemCollection *)self->_lastNewsItemCollection setNewsItems:v43];
  [(StockNewsItemCollection *)self->_lastNewsItemCollection setExpirationTime:self->_lastResponseTimestamp + 60.0];
LABEL_50:
  if ([v51 length])
  {
    v57 = +[NewsUpdater _newsItemCollectionCache];
    [v57 setObject:self->_lastNewsItemCollection forKey:v51];
  }
  id stock = self->_stock;
  self->_id stock = 0;

  [(NewsUpdater *)self didParseData];
LABEL_53:
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NewsUpdater;
  [(YQLRequest *)&v21 failWithError:v4];
  id updateCompletionHandler = (void (**)(id, void, id))self->_updateCompletionHandler;
  if (updateCompletionHandler)
  {
    updateCompletionHandler[2](updateCompletionHandler, 0, v4);
    id v6 = self->_updateCompletionHandler;
    self->_id updateCompletionHandler = 0;
  }
  uint64_t v7 = [(Stock *)self->_stock symbol];
  v8 = +[NewsUpdater _newsItemCollectionCache];
  uint64_t v9 = [v8 objectForKey:v7];

  uint64_t v10 = [v9 newsItems];
  if (![v10 count])
  {

    goto LABEL_7;
  }
  [v9 expirationTime];
  CFAbsoluteTime v12 = v11 + -60.0;
  CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent() + -345600.0;

  if (v12 <= v13)
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained newsUpdater:self didFailWithError:v4];
    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x263EFF8C0];
  char v15 = [v9 newsItems];
  v16 = [v14 arrayWithArray:v15];
  [v9 setNewsItems:v16];

  objc_storeStrong((id *)&self->_lastNewsItemCollection, v9);
  [(StockNewsItemCollection *)self->_lastNewsItemCollection expirationTime];
  self->_lastResponseTimestamp = v17 + -60.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v19 = [(StockNewsItemCollection *)self->_lastNewsItemCollection newsItems];
  [WeakRetained newsUpdater:self didReceiveNewsItems:v19];

LABEL_8:
  id stock = self->_stock;
  self->_id stock = 0;
}

- (void)didParseData
{
  id updateCompletionHandler = (void (**)(id, uint64_t, void))self->_updateCompletionHandler;
  if (updateCompletionHandler)
  {
    updateCompletionHandler[2](updateCompletionHandler, 1, 0);
    id v4 = self->_updateCompletionHandler;
    self->_id updateCompletionHandler = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [(StockNewsItemCollection *)self->_lastNewsItemCollection newsItems];
  [WeakRetained newsUpdater:self didReceiveNewsItems:v5];
}

- (void)resetLocale
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (_cache)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = objc_msgSend((id)_cache, "allValues", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [v7 setExpirationTime:0.0];
          v8 = [v7 newsItems];
          [v8 makeObjectsPerformSelector:sel_resetLocale];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
}

- (NewsUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NewsUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_lastNewsItemCollection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)parseData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[NewsUpdater parseData:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_222ED9000, a2, OS_LOG_TYPE_ERROR, "#NewsUpdater *** [%s] Caught exception: %@", (uint8_t *)&v2, 0x16u);
}

@end