@interface NMAPIRequestOperation
- (NMAPIRequestOperation)initWithRequest:(id)a3;
- (NMAPIRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4;
- (id)_adjustedPayload:(id)a3 path:(id)a4;
- (id)_readResponseDictionaryFromDisk;
- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)_personalizeResponse:(id)a3 completion:(id)a4;
- (void)_readResponseDictionaryFromDisk;
- (void)_writeResponseDictionaryToDisk:(id)a3;
- (void)execute;
- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4;
@end

@implementation NMAPIRequestOperation

- (NMAPIRequestOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPIRequestOperation;
  v5 = [(MPStoreModelRequestOperation *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MPStoreModelRequestOperation *)v5 setRequest:v4];
  }

  return v6;
}

- (NMAPIRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NMAPIRequestOperation;
  return [(MPStoreModelRequestOperation *)&v5 initWithRequest:a3 responseHandler:a4];
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_storeStrong((id *)&self->_storeURLBag, a3);
  objc_super v8 = [(MPStoreModelRequestOperation *)self request];
  v9 = [v8 urlComponentsWithStoreURLBag:v7 error:a4];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F089E0];
    v11 = [v9 URL];
    v12 = [v10 requestWithURL:v11];

    [v12 setHTTPMethod:@"GET"];
    [(MPStoreModelRequestOperation *)self remainingTimeInterval];
    objc_msgSend(v12, "setTimeoutInterval:");
    id v13 = objc_alloc(MEMORY[0x263F122E8]);
    v17[0] = v12;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    v15 = (void *)[v13 initWithURLRequests:v14];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7101 userInfo:0];
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  objc_super v8 = NMLogForCategory(10);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:].cold.4();
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = objc_alloc(MEMORY[0x263F12220]);
    v10 = [(NMAPIRequestOperation *)self _adjustedPayload:v6 path:&stru_26DA87658];
    v11 = (void *)[v9 initWithPayload:v10];

    v12 = [(MPAsyncOperation *)self userIdentity];
    [v11 setUserIdentity:v12];

    id v13 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
    id v37 = 0;
    v14 = [v13 importObjectsFromRequest:v11 options:1 error:&v37];
    id v15 = v37;

    if (v15)
    {
      v16 = NMLogForCategory(9);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:]();
      }

      v7[2](v7, 0, v15);
    }
    else
    {
      v18 = [(MPStoreModelRequestOperation *)self request];
      id v19 = objc_alloc_init((Class)[v18 responseParserClass]);

      v20 = [v14 annotatedPayload];
      id v36 = 0;
      v21 = [v19 resultsWithDictionary:v20 error:&v36];
      id v22 = v36;

      if (v22)
      {
        v23 = NMLogForCategory(9);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:]();
        }

        v7[2](v7, 0, v22);
      }
      else
      {
        id v35 = v19;
        v24 = v21;
        v25 = [(MPStoreModelRequestOperation *)self request];
        uint64_t v26 = [v25 cachePolicy];

        if ((v26 & 0xFFFFFFFFFFFFFFFELL) == 2) {
          [(NMAPIRequestOperation *)self _writeResponseDictionaryToDisk:v6];
        }
        v27 = [NMAPIDefaultSectionedCollectionDataSource alloc];
        v28 = [(MPStoreModelRequestOperation *)self request];
        v34 = v24;
        v29 = [(NMAPIDefaultSectionedCollectionDataSource *)v27 initWithRequest:v28 results:v24 storeURLBag:self->_storeURLBag];

        id v30 = objc_alloc(MEMORY[0x263F12000]);
        v31 = [(MPStoreModelRequestOperation *)self request];
        v32 = (void *)[v30 initWithRequest:v31];

        v33 = (void *)[objc_alloc(MEMORY[0x263F11DC0]) initWithDataSource:v29];
        [v32 setResults:v33];

        v21 = v34;
        [(NMAPIRequestOperation *)self _personalizeResponse:v32 completion:v7];

        id v19 = v35;
      }
    }
  }
  else
  {
    v17 = NMLogForCategory(9);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:]();
    }

    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7102 userInfo:0];
    v7[2](v7, 0, v15);
  }
}

- (void)execute
{
  v3 = [(MPStoreModelRequestOperation *)self request];
  uint64_t v4 = [v3 cachePolicy];

  int v5 = 1;
  switch(v4)
  {
    case 0:
    case 3:
      goto LABEL_2;
    case 1:
      goto LABEL_5;
    case 2:
      id v6 = [(NMAPIRequestOperation *)self _readResponseDictionaryFromDisk];

      if (!v6)
      {
LABEL_2:
        v8.receiver = self;
        v8.super_class = (Class)NMAPIRequestOperation;
        [(MPStoreModelRequestOperation *)&v8 execute];
        return;
      }
      int v5 = 0;
LABEL_5:
      id v7 = [(NMAPIRequestOperation *)self _readResponseDictionaryFromDisk];
      if (v7)
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __32__NMAPIRequestOperation_execute__block_invoke;
        v9[3] = &unk_2647C1218;
        v9[4] = self;
        [(NMAPIRequestOperation *)self produceResponseWithLoadedOutput:v7 completion:v9];
      }
      else
      {
        if (!v5) {
          return;
        }
        [(MPStoreModelRequestOperation *)self _finishWithResponse:0 error:0];
      }

      return;
    default:
      return;
  }
}

uint64_t __32__NMAPIRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishWithResponse:a2 error:a3];
}

- (void)_writeResponseDictionaryToDisk:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(MPStoreModelRequestOperation *)self request];
  id v6 = [v5 cacheURL];

  if (v6)
  {
    if (v4)
    {
      id v19 = 0;
      id v7 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:&v19];
      objc_super v8 = v19;
      if (v8)
      {
        id v9 = NMLogForCategory(9);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[NMAPIRequestOperation _writeResponseDictionaryToDisk:].cold.4();
        }
      }
      else
      {
        v10 = [(MPStoreModelRequestOperation *)self request];
        v11 = [v10 cacheURL];
        id v18 = 0;
        int v12 = [v7 writeToURL:v11 options:1 error:&v18];
        id v9 = v18;

        id v13 = NMLogForCategory(9);
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [(MPStoreModelRequestOperation *)self request];
            v16 = [(MPStoreModelRequestOperation *)self request];
            v17 = [v16 cacheURL];
            *(_DWORD *)buf = 138412546;
            v21 = v15;
            __int16 v22 = 2112;
            v23 = v17;
            _os_log_impl(&dword_2269EF000, v14, OS_LOG_TYPE_DEFAULT, "[NMAPIRequestOperation] Cached new response for %@ at cacheURL %@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          -[NMAPIRequestOperation _writeResponseDictionaryToDisk:]();
        }
      }
    }
    else
    {
      objc_super v8 = NMLogForCategory(9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[NMAPIRequestOperation _writeResponseDictionaryToDisk:](v8);
      }
    }
  }
  else
  {
    objc_super v8 = NMLogForCategory(9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRequestOperation _writeResponseDictionaryToDisk:](self, v8);
    }
  }
}

- (id)_readResponseDictionaryFromDisk
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [(MPStoreModelRequestOperation *)self request];
  id v4 = [v3 cacheURL];

  if (v4)
  {
    int v5 = (void *)MEMORY[0x263EFF8F8];
    id v6 = [(MPStoreModelRequestOperation *)self request];
    id v7 = [v6 cacheURL];
    id v18 = 0;
    objc_super v8 = [v5 dataWithContentsOfURL:v7 options:0 error:&v18];
    id v9 = v18;

    if (v9)
    {
      v10 = NMLogForCategory(9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[NMAPIRequestOperation _readResponseDictionaryFromDisk]();
      }
      v11 = 0;
    }
    else
    {
      id v17 = 0;
      v11 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v17];
      v10 = v17;
      int v12 = NMLogForCategory(9);
      id v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[NMAPIRequestOperation _readResponseDictionaryFromDisk]();
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(MPStoreModelRequestOperation *)self request];
        id v15 = [v14 cacheURL];
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_2269EF000, v13, OS_LOG_TYPE_DEFAULT, "[NMAPIRequestOperation] Found file at cacheURL (%@)", buf, 0xCu);
      }
    }
  }
  else
  {
    id v9 = NMLogForCategory(9);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRequestOperation _writeResponseDictionaryToDisk:](self, v9);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_adjustedPayload:(id)a3 path:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v6 mutableCopy];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __47__NMAPIRequestOperation__adjustedPayload_path___block_invoke;
    v23[3] = &unk_2647C1240;
    id v24 = v8;
    v25 = self;
    id v26 = v7;
    id v9 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v23];
    v10 = (void *)[v9 copy];

LABEL_12:
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = -[NMAPIRequestOperation _adjustedPayload:path:](self, "_adjustedPayload:path:", *(void *)(*((void *)&v19 + 1) + 8 * i), v7, (void)v19);
          [v9 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v13);
    }

    v10 = (void *)[v9 copy];
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v7 hasSuffix:@"/data/attributes/artwork/url"])
  {
    id v17 = [v6 stringByReplacingOccurrencesOfString:@"{w}x{h}{c}.{f}" withString:@"{w}x{h}cc.{f}"];
  }
  else
  {
    id v17 = v6;
  }
  v10 = v17;
LABEL_18:

  return v10;
}

void __47__NMAPIRequestOperation__adjustedPayload_path___block_invoke(void *a1, void *a2, void *a3)
{
  id v4 = (void *)a1[4];
  int v5 = (void *)a1[5];
  id v6 = (void *)a1[6];
  id v7 = a3;
  id v8 = a2;
  id v10 = [v6 stringByAppendingFormat:@"/%@", v8];
  id v9 = [v5 _adjustedPayload:v7 path:v10];

  [v4 setObject:v9 forKey:v8];
}

- (void)_personalizeResponse:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 results];
  id v8 = objc_alloc_init(MEMORY[0x263F120D8]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke;
  v17[3] = &unk_2647C1290;
  id v18 = v8;
  id v19 = v7;
  id v9 = v7;
  id v10 = v8;
  [v9 enumerateSectionsUsingBlock:v17];
  id v11 = objc_alloc(MEMORY[0x263F122B0]);
  uint64_t v12 = [(MPStoreModelRequestOperation *)self request];
  uint64_t v13 = (void *)[v11 initWithUnpersonalizedRequest:v12 unpersonalizedContentDescriptors:v10];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke_3;
  v15[3] = &unk_2647C12B8;
  id v16 = v6;
  id v14 = v6;
  [v13 performWithResponseHandler:v15];
}

void __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = (objc_class *)MEMORY[0x263F122A8];
  id v7 = a2;
  id v8 = (void *)[[v6 alloc] initWithModel:v7 personalizationStyle:1];

  [v5 appendSection:v8];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke_2;
  v10[3] = &unk_2647C1268;
  id v9 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  [v9 enumerateItemsInSectionAtIndex:a3 usingBlock:v10];
}

void __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x263F122A8];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithModel:v4 personalizationStyle:1];

  [v2 appendItem:v5];
}

uint64_t __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

- (void)produceResponseWithLoadedOutput:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2269EF000, v0, v1, "[NMAPIRequestOperation] Parsing failed with error: %@", v2);
}

- (void)produceResponseWithLoadedOutput:completion:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2269EF000, v0, v1, "[NMAPIRequestOperation] Server Object Database import failed with error: %@", v2);
}

- (void)produceResponseWithLoadedOutput:completion:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2269EF000, v0, v1, "[NMAPIRequestOperation] Expected dictionary for loaded output: %@", v2);
}

- (void)produceResponseWithLoadedOutput:completion:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_2269EF000, v0, OS_LOG_TYPE_DEBUG, "[NMAPIRequestOperation] Loaded output: %@", v1, 0xCu);
}

- (void)_writeResponseDictionaryToDisk:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 request];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2269EF000, a2, v4, "[NMAPIRequestOperation] Missing cacheURL property: %@", v5);
}

- (void)_writeResponseDictionaryToDisk:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequestOperation] Cannot cache an empty response dictionary", v1, 2u);
}

- (void)_writeResponseDictionaryToDisk:.cold.3()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [v0 request];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2269EF000, v2, v3, "[NMAPIRequestOperation] Failed to write response for %@ to disk due to write error: %@", v4, v5, v6, v7, v8);
}

- (void)_writeResponseDictionaryToDisk:.cold.4()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [v0 request];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2269EF000, v2, v3, "[NMAPIRequestOperation] Failed to write response for %@ to disk due to serialization error: %@", v4, v5, v6, v7, v8);
}

- (void)_readResponseDictionaryFromDisk
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [v0 request];
  uint64_t v2 = [v1 cacheURL];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2269EF000, v3, v4, "[NMAPIRequestOperation] Failed to read from cacheURL %@ due to read error: %@", v5, v6, v7, v8, v9);
}

@end