@interface NMAPIAnyResponseParser
- (id)resultsWithDictionary:(id)a3 error:(id *)a4;
@end

@implementation NMAPIAnyResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  v28[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  v28[4] = objc_opt_class();
  v28[5] = objc_opt_class();
  v28[6] = objc_opt_class();
  [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_alloc_init(*(Class *)(*((void *)&v19 + 1) + 8 * i));
        id v18 = 0;
        v11 = [v10 resultsWithDictionary:v4 error:&v18];
        id v12 = v18;
        v13 = NMLogForCategory(9);
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if (!v12)
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v10;
            _os_log_impl(&dword_2269EF000, v13, OS_LOG_TYPE_INFO, "[NMAPIResponseParser] Successfully parsed response with response parser: %@", buf, 0xCu);
          }

          goto LABEL_18;
        }
        if (v14)
        {
          *(_DWORD *)buf = 138412546;
          id v24 = v10;
          __int16 v25 = 2112;
          id v26 = v12;
          _os_log_impl(&dword_2269EF000, v13, OS_LOG_TYPE_INFO, "[NMAPIResponseParser] Unable to parse response with response parser: %@, error: %@", buf, 0x16u);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v15 = NMLogForCategory(9);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[NMAPIAnyResponseParser resultsWithDictionary:error:](v15);
  }

  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7102 userInfo:0];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (void)resultsWithDictionary:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIResponseParser] Unable to parse response with any response parser.", v1, 2u);
}

@end