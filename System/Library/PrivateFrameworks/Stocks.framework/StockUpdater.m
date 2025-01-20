@interface StockUpdater
- (BOOL)_updateStocks:(id)a3 comprehensive:(BOOL)a4 forceUpdate:(BOOL)a5;
- (BOOL)forceUpdate;
- (BOOL)hadError;
- (BOOL)isComprehensive;
- (NSArray)pendingStocks;
- (NSArray)requestStocks;
- (StockUpdaterDelegate)delegate;
- (id)updateCompletionHandler;
- (void)_parseExchangeDictionaries:(id)a3;
- (void)_parseQuoteDictionaries:(id)a3 withDataSourceDictionaries:(id)a4;
- (void)didParseData;
- (void)failWithError:(id)a3;
- (void)parseData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingStocks:(id)a3;
- (void)setRequestStocks:(id)a3;
- (void)setUpdateCompletionHandler:(id)a3;
@end

@implementation StockUpdater

- (BOOL)_updateStocks:(id)a3 comprehensive:(BOOL)a4 forceUpdate:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  char v9 = [(id)objc_opt_class() shouldGenerateOfflineData];
  self->_isComprehensive = v6;
  self->_forceUpdate = a5;
  lastError = self->_lastError;
  self->_lastError = 0;

  if (!self->_forceUpdate && (v9 & 1) == 0)
  {
    v11 = [MEMORY[0x263EFF980] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v52;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if (!v6)
        {
          if (![v17 isQuoteStale]) {
            continue;
          }
LABEL_12:
          [v11 addObject:v17];
          continue;
        }
        if ([v17 isMetadataStale]) {
          goto LABEL_12;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (!v14)
      {
LABEL_15:

        goto LABEL_17;
      }
    }
  }
  v11 = v8;
LABEL_17:
  uint64_t v18 = [v11 count];
  if (v18)
  {
    if ((unint64_t)[v11 count] >= 0x65)
    {
      v19 = objc_msgSend(v11, "subarrayWithRange:", 100, objc_msgSend(v11, "count") - 100);
      [(StockUpdater *)self setPendingStocks:v19];

      uint64_t v20 = objc_msgSend(v11, "subarrayWithRange:", 0, 100);

      v21 = StocksLogForCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        NSUInteger v22 = [(NSArray *)self->_pendingStocks count];
        *(_DWORD *)buf = 134217984;
        NSUInteger v58 = v22;
        _os_log_impl(&dword_222ED9000, v21, OS_LOG_TYPE_DEFAULT, "#StockUpdater Splitting stocks update into multiple requests, %lu pending", buf, 0xCu);
      }

      v11 = (void *)v20;
    }
    v23 = StocksLogForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isComprehensive) {
        v24 = "comprehensive";
      }
      else {
        v24 = "basic";
      }
      *(_DWORD *)buf = 136315394;
      NSUInteger v58 = (NSUInteger)v24;
      __int16 v59 = 2112;
      v60 = v11;
      _os_log_impl(&dword_222ED9000, v23, OS_LOG_TYPE_DEFAULT, "#StockUpdater Performing %s update for stocks: %@", buf, 0x16u);
    }

    [(StockUpdater *)self setRequestStocks:v11];
    v25 = [(NSArray *)self->_requestStocks valueForKey:@"symbol"];
    v26 = [v25 componentsJoinedByString:@","];

    v27 = +[NetPreferences sharedPreferences];
    v28 = [(YQLRequest *)self YQLLanguageCode];
    uint64_t v29 = [(YQLRequest *)self YQLCountryCode];
    v55[0] = @"format";
    v55[1] = @"crossProduct";
    v56[0] = @"json";
    v56[1] = @"optimized";
    v30 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
    v31 = (void *)[v30 mutableCopy];

    objc_msgSend(v31, "na_safeSetObject:forKey:", v26, @"tickers");
    objc_msgSend(v31, "na_safeSetObject:forKey:", v28, @"lang");
    v50 = (void *)v29;
    objc_msgSend(v31, "na_safeSetObject:forKey:", v29, @"region");
    v32 = [v27 stocksYQLBaseURL];
    v33 = v32;
    v34 = YQLMetadataPath;
    if (!v6) {
      v34 = YQLBasicDataPath;
    }
    v35 = [v32 URLByAppendingPathComponent:*v34];

    v36 = [v27 signedRequestForURL:v35 parameters:v31];
    if ([v27 serviceDebugging])
    {
      [v36 URL];
      v37 = v49 = v26;
      [v37 absoluteString];
      v38 = v35;
      v39 = v27;
      v40 = v28;
      v42 = uint64_t v41 = v18;
      +[YQLRequest appendDebugString:v42];

      uint64_t v18 = v41;
      v28 = v40;
      v27 = v39;
      v35 = v38;

      v43 = [NSString stringWithFormat:@"%@", v31];
      +[YQLRequest appendDebugString:v43];

      v26 = v49;
    }
    [(YQLRequest *)self loadRequest:v36];
    v44 = [MEMORY[0x263F08A00] defaultCenter];
    [v44 postNotificationName:@"StocksUpdateLoadingStatusNotification" object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stockUpdater:self didRequestUpdateForStocks:v11 isComprehensive:self->_isComprehensive];
  }
  else
  {
    v46 = StocksLogForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v58) = v6;
      _os_log_impl(&dword_222ED9000, v46, OS_LOG_TYPE_DEFAULT, "#StockUpdater hit cache, comprehensive: %d", buf, 8u);
    }

    updateCompletionHandler = (void (**)(id, uint64_t, void))self->_updateCompletionHandler;
    if (updateCompletionHandler)
    {
      updateCompletionHandler[2](updateCompletionHandler, 1, 0);
      [(StockUpdater *)self setUpdateCompletionHandler:0];
    }
  }

  return v18 != 0;
}

- (void)parseData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__StockUpdater_parseData___block_invoke;
  v6[3] = &unk_26467D2F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[YahooResponseParser parseData:v5 resultsHandler:v6];
}

void __26__StockUpdater_parseData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  if (v9)
  {
    [v8 _parseExchangeDictionaries:a2];
    [*(id *)(a1 + 32) _parseQuoteDictionaries:v9 withDataSourceDictionaries:v7];
  }
  else
  {
    [v8 failToParseWithData:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) didParseData];
}

- (void)_parseQuoteDictionaries:(id)a3 withDataSourceDictionaries:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v23 = v7;
  uint64_t v9 = +[YahooResponseParser parseDataSourceMapFromDataSourceDictionaries:v7];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __67__StockUpdater__parseQuoteDictionaries_withDataSourceDictionaries___block_invoke;
  v29[3] = &unk_26467D320;
  id v10 = v8;
  id v30 = v10;
  v24 = v6;
  NSUInteger v22 = (void *)v9;
  +[YahooResponseParser parseStockQuoteDictionaries:v6 withDataSources:v9 parsedStockResult:v29];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = self->_requestStocks;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v17 = [v16 symbol];
        uint64_t v18 = [v10 objectForKeyedSubscript:v17];

        if (v18)
        {
          BOOL isComprehensive = self->_isComprehensive;
          uint64_t v20 = [v10 objectForKeyedSubscript:v17];
          double Current = CFAbsoluteTimeGetCurrent();
          if (isComprehensive) {
            [v16 updateMetadataWithDictionary:v20 forTime:Current];
          }
          else {
            [v16 updateQuoteWithDictionary:v20 forTime:Current];
          }
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v13);
  }
}

uint64_t __67__StockUpdater__parseQuoteDictionaries_withDataSourceDictionaries___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (void)_parseExchangeDictionaries:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(StockUpdater *)self requestStocks];
  uint64_t v6 = [v5 count];
  id v7 = +[StockManager sharedManager];
  id v8 = [v7 stocksList];
  if (v6 == [v8 count])
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    id v10 = [(StockUpdater *)self requestStocks];
    v11 = [v9 setWithArray:v10];
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = +[StockManager sharedManager];
    uint64_t v14 = [v13 stocksList];
    uint64_t v15 = [v12 setWithArray:v14];
    int v16 = [v11 isEqualToSet:v15];

    if (v16)
    {
      v17 = [MEMORY[0x263EFF9C0] set];
      int v18 = 1;
      goto LABEL_6;
    }
  }
  else
  {
  }
  v17 = 0;
  int v18 = 0;
LABEL_6:
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __43__StockUpdater__parseExchangeDictionaries___block_invoke;
  v36[3] = &unk_26467D320;
  id v19 = v17;
  id v37 = v19;
  +[YahooResponseParser parseExchangeDictionaries:v4 parsedExchangeResult:v36];
  if (v18)
  {
    uint64_t v20 = +[ExchangeManager sharedManager];
    v21 = [v20 exchangeList];
    NSUInteger v22 = (void *)[v21 copy];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v29 = objc_msgSend(v28, "name", (void)v32);
          char v30 = [v19 containsObject:v29];

          if ((v30 & 1) == 0)
          {
            v31 = +[ExchangeManager sharedManager];
            [v31 removeExchange:v28];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v25);
    }
  }
}

void __43__StockUpdater__parseExchangeDictionaries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[ExchangeManager sharedManager];
  id v8 = [v7 exchangeWithName:v5];

  if (v8)
  {
    uint64_t v9 = StocksLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __43__StockUpdater__parseExchangeDictionaries___block_invoke_cold_1(v8, (uint64_t)v6, v9);
    }

    [(Exchange *)v8 updateWithDictionary:v6];
  }
  else
  {
    id v8 = [[Exchange alloc] initWithDictionary:v6];
    id v10 = +[ExchangeManager sharedManager];
    [v10 addExchange:v8];
  }
  [*(id *)(a1 + 32) addObject:v5];
}

- (BOOL)hadError
{
  return self->_lastError != 0;
}

- (void)didParseData
{
  v3 = +[StockManager sharedManager];
  [v3 saveDataChanges];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained stockUpdater:self didUpdateStocks:self->_requestStocks isComprehensive:self->_isComprehensive];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"StocksUpdateLoadingStatusNotification" object:0];

  requestStocks = self->_requestStocks;
  self->_requestStocks = 0;

  if ([(NSArray *)self->_pendingStocks count])
  {
    pendingStocks = self->_pendingStocks;
    self->_pendingStocks = 0;
    uint64_t v9 = pendingStocks;

    [(StockUpdater *)self _updateStocks:v9 comprehensive:self->_isComprehensive forceUpdate:self->_forceUpdate];
  }
  else
  {
    updateCompletionHandler = (void (**)(id, uint64_t, void))self->_updateCompletionHandler;
    if (updateCompletionHandler)
    {
      updateCompletionHandler[2](updateCompletionHandler, 1, 0);
      [(StockUpdater *)self setUpdateCompletionHandler:0];
    }
  }
}

- (void)failWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)StockUpdater;
  [(YQLRequest *)&v10 failWithError:v5];
  objc_storeStrong((id *)&self->_lastError, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained stockUpdater:self didFailWithError:v5 whileUpdatingStocks:self->_requestStocks comprehensive:self->_isComprehensive];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"StocksUpdateLoadingStatusNotification" object:0];

  requestStocks = self->_requestStocks;
  self->_requestStocks = 0;

  updateCompletionHandler = (void (**)(id, void, id))self->_updateCompletionHandler;
  if (updateCompletionHandler)
  {
    updateCompletionHandler[2](updateCompletionHandler, 0, v5);
    [(StockUpdater *)self setUpdateCompletionHandler:0];
  }
}

- (StockUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StockUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isComprehensive
{
  return self->_isComprehensive;
}

- (BOOL)forceUpdate
{
  return self->_forceUpdate;
}

- (NSArray)requestStocks
{
  return self->_requestStocks;
}

- (void)setRequestStocks:(id)a3
{
}

- (NSArray)pendingStocks
{
  return self->_pendingStocks;
}

- (void)setPendingStocks:(id)a3
{
}

- (id)updateCompletionHandler
{
  return self->_updateCompletionHandler;
}

- (void)setUpdateCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pendingStocks, 0);
  objc_storeStrong((id *)&self->_requestStocks, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_lastError, 0);
}

void __43__StockUpdater__parseExchangeDictionaries___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 name];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_222ED9000, a3, OS_LOG_TYPE_DEBUG, "#StockUpdater Updating #exchange %@ with dictionary %@", (uint8_t *)&v6, 0x16u);
}

@end