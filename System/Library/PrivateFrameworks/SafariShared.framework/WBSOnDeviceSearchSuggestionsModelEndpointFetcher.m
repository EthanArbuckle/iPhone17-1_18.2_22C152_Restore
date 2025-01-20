@interface WBSOnDeviceSearchSuggestionsModelEndpointFetcher
- (WBSOnDeviceSearchSuggestionsModelEndpointFetcher)init;
- (id)_parseEndpointsFromString:(id)a3;
- (void)fetchModelEndpointURLsWithCompletionHandler:(id)a3;
@end

@implementation WBSOnDeviceSearchSuggestionsModelEndpointFetcher

- (WBSOnDeviceSearchSuggestionsModelEndpointFetcher)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBSOnDeviceSearchSuggestionsModelEndpointFetcher;
  v2 = [(WBSOnDeviceSearchSuggestionsModelEndpointFetcher *)&v8 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F18DD0], "safari_ephemeralSessionConfiguration");
    [v3 setURLCache:0];
    uint64_t v4 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v3];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)fetchModelEndpointURLsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  modelEndpointInfos = self->_modelEndpointInfos;
  if (modelEndpointInfos)
  {
    (*((void (**)(id, NSDictionary *, void))v4 + 2))(v4, modelEndpointInfos, 0);
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://ssl.gstatic.com/suggest-dev/external/head-suggest/model_config.txt"];
    objc_super v8 = [MEMORY[0x1E4F18D50] requestWithURL:v7 cachePolicy:1 timeoutInterval:2.0];
    objc_initWeak(&location, self);
    urlSession = self->_urlSession;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __96__WBSOnDeviceSearchSuggestionsModelEndpointFetcher_fetchModelEndpointURLsWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E5C9DFE0;
    objc_copyWeak(&v14, &location);
    id v13 = v5;
    v10 = [(NSURLSession *)urlSession dataTaskWithRequest:v8 completionHandler:v12];
    dataTask = self->_dataTask;
    self->_dataTask = v10;

    [(NSURLSessionDataTask *)self->_dataTask resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __96__WBSOnDeviceSearchSuggestionsModelEndpointFetcher_fetchModelEndpointURLsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v17 = a2;
  id v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v8 = WeakRetained;
  if (v6 || !WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
    v10 = [v8 _parseEndpointsFromString:v9];
    uint64_t v11 = [v10 count];
    uint64_t v12 = *(void *)(a1 + 32);
    if (v11)
    {
      (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v10, 0);
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSOnDeviceSearchSuggestionsModelEndpointFetcherErrorDomain" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
    id v14 = (void *)v8[2];
    v8[2] = v10;
    id v15 = v10;

    v16 = (void *)v8[1];
    v8[1] = 0;
  }
}

- (id)_parseEndpointsFromString:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v39 = [MEMORY[0x1E4F1CA60] dictionary];
  v37 = v3;
  [v3 componentsSeparatedByString:@"\n"];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v48;
    uint64_t v38 = *(void *)v48;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v40 = v6;
      do
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "safari_stringByTrimmingWhitespace");
        if ([v10 length] && objc_msgSend(v10, "characterAtIndex:", 0) != 35)
        {
          uint64_t v11 = objc_msgSend(v9, "safari_stringByRemovingWrappingParenthesis");
          uint64_t v12 = objc_msgSend(v11, "safari_indexOfFirstAppearanceOfCharacter:", 44);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_22;
          }
          uint64_t v13 = v12;
          id v14 = [v11 substringToIndex:v12];
          v43 = objc_msgSend(v14, "safari_stringByRemovingWrappingSingleQuotes");

          v44 = v11;
          id v15 = [v11 substringFromIndex:v13 + 1];
          v16 = objc_msgSend(v15, "safari_stringByTrimmingWhitespace");

          v42 = v16;
          id v17 = objc_msgSend(v16, "safari_stringByRemovingWrappingParenthesis");
          v18 = [v17 componentsSeparatedByString:@","];
          v19 = objc_msgSend(v18, "safari_mapObjectsUsingBlock:", &__block_literal_global_82);

          if ([v19 count] != 3)
          {
            v35 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[WBSOnDeviceSearchSuggestionsModelEndpointFetcher _parseEndpointsFromString:]((uint64_t)v9, v35);
            }

            uint64_t v11 = v44;
LABEL_22:

LABEL_23:
            v34 = 0;
            v33 = v39;
            goto LABEL_24;
          }
          v20 = (void *)MEMORY[0x1E4F1CB10];
          v21 = [v19 objectAtIndexedSubscript:0];
          v22 = objc_msgSend(v21, "safari_stringByRemovingWrappingSingleQuotes");
          v23 = [v20 URLWithString:v22];

          if (v23)
          {
            v24 = [WBSOnDeviceModelEndpointInfo alloc];
            v25 = [v19 objectAtIndexedSubscript:1];
            uint64_t v26 = [v25 integerValue];
            v27 = [v19 objectAtIndexedSubscript:2];
            objc_msgSend(v27, "safari_stringByRemovingWrappingSingleQuotes");
            v41 = v17;
            v29 = id v28 = v4;
            v30 = [(WBSOnDeviceModelEndpointInfo *)v24 initWithEndpointURL:v23 sizeInBytes:v26 checksumString:v29];
            v31 = v43;
            [v39 setObject:v30 forKeyedSubscript:v43];

            id v4 = v28;
            id v17 = v41;

            uint64_t v7 = v38;
            uint64_t v6 = v40;
          }
          else
          {
            v32 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
            uint64_t v6 = v40;
            v31 = v43;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              [(WBSOnDeviceSearchSuggestionsModelEndpointFetcher *)&buf _parseEndpointsFromString:v32];
            }
          }

          if (!v23) {
            goto LABEL_23;
          }
        }
        else
        {
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v33 = v39;
  v34 = (void *)[v39 copy];
LABEL_24:

  return v34;
}

id __78__WBSOnDeviceSearchSuggestionsModelEndpointFetcher__parseEndpointsFromString___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "safari_stringByTrimmingWhitespace");
  id v3 = objc_msgSend(v2, "safari_stringByRemovingWrappingSingleQuotes");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_modelEndpointInfos, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

- (void)_parseEndpointsFromString:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to parse a valid endpoint URL.", buf, 2u);
}

- (void)_parseEndpointsFromString:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Unexpected model endpoint configuration file format: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end