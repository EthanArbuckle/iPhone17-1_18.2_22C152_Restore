@interface SymbolValidator
- (SymbolValidator)initWithDelegate:(id)a3;
- (id)delegate;
- (void)didParseData;
- (void)failWithError:(id)a3;
- (void)parseData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)validateSymbol:(id)a3 withMaxResults:(int)a4;
@end

@implementation SymbolValidator

- (SymbolValidator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SymbolValidator;
  v5 = [(YQLRequest *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_delegate, v4);
  }

  return v6;
}

- (void)validateSymbol:(id)a3 withMaxResults:(int)a4
{
  v22[4] = *MEMORY[0x263EF8340];
  v5 = (__CFString *)a3;
  v6 = +[NetPreferences sharedPreferences];
  char v7 = [v6 isNetworkReachable];

  if (v7)
  {
    if (!v5) {
      return;
    }
    objc_super v8 = (__CFString *)[(__CFString *)v5 mutableCopy];

    CFStringTransform(v8, 0, (CFStringRef)*MEMORY[0x263EFFF50], 0);
    v9 = +[NetPreferences sharedPreferences];
    v10 = [(YQLRequest *)self YQLLanguageCode];
    v11 = [(YQLRequest *)self YQLCountryCode];
    v21[0] = @"format";
    v21[1] = @"ticker";
    v22[0] = @"json";
    v22[1] = v8;
    v21[2] = @"lang";
    v21[3] = @"region";
    v22[2] = v10;
    v22[3] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    v13 = [v9 stocksYQLBaseURL];
    v14 = [v13 URLByAppendingPathComponent:@"/applewf/autocomplete"];

    v15 = [v9 signedRequestForURL:v14 parameters:v12];
    if ([v9 serviceDebugging])
    {
      v16 = [v15 URL];
      [v16 absoluteString];
      v17 = v20 = v10;
      +[YQLRequest appendDebugString:v17];

      v18 = [NSString stringWithFormat:@"%@", v12];
      v10 = v20;
      +[YQLRequest appendDebugString:v18];
    }
    [(YQLRequest *)self loadRequest:v15];

    v5 = v8;
  }
  else
  {
    v19 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.stocks" code:3 userInfo:0];
    [(SymbolValidator *)self failWithError:v19];
  }
}

- (void)parseData:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  symbols = self->_symbols;
  v21 = self;
  self->_symbols = 0;

  id v30 = 0;
  v23 = v4;
  v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v30];
  id v7 = v30;
  v22 = v6;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    [(YQLRequest *)v21 failToParseWithData:v23];
  }
  else
  {
    v20 = +[YahooResponseParser arrayWithDictionaryKeyPath:&unk_26D5E9798 inJSONObject:v6 wrapResultIfDictionary:1];
    if (v20)
    {
      v24 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = v20;
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "yql_objectForKey:ofClass:", @"name", objc_opt_class());
              uint64_t v14 = objc_msgSend(v12, "yql_objectForKey:ofClass:", @"symbol", objc_opt_class());
              v15 = (void *)v14;
              if (v13 && v14)
              {
                v33[0] = @"companyName";
                v33[1] = @"symbol";
                v34[0] = v13;
                v34[1] = v14;
                v16 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
                v17 = (void *)[v16 mutableCopy];

                v18 = objc_msgSend(v12, "yql_objectForKey:ofClass:", @"exchange", objc_opt_class());
                if (v18) {
                  [v17 setObject:v18 forKeyedSubscript:@"exchange"];
                }
                -[NSArray addObject:](v24, "addObject:", v17, v20);
              }
            }
            else
            {
              v13 = StocksLogForCategory(0);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v12;
                _os_log_impl(&dword_222ED9000, v13, OS_LOG_TYPE_DEFAULT, "#SymbolValidator Skipping validator result %@", buf, 0xCu);
              }
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v9);
      }

      v19 = v21->_symbols;
      v21->_symbols = v24;

      [(SymbolValidator *)v21 didParseData];
    }
    else
    {
      -[YQLRequest failToParseWithData:](v21, "failToParseWithData:", v23, 0);
    }
  }
}

- (void)didParseData
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained symbolValidator:self didValidateSymbols:self->_symbols];
}

- (void)failWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SymbolValidator;
  id v4 = a3;
  [(YQLRequest *)&v6 failWithError:v4];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "symbolValidator:didFailWithError:", self, v4, v6.receiver, v6.super_class);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);

  objc_storeStrong((id *)&self->_symbols, 0);
}

- (void)parseData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[SymbolValidator parseData:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_222ED9000, a2, OS_LOG_TYPE_ERROR, "*** [%s] Caught exception: %@", (uint8_t *)&v2, 0x16u);
}

@end