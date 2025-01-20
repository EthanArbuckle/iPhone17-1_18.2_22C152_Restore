@interface TSURLRequestFactory
+ (id)_jsonBodyWithPostdata:(id)a3;
+ (id)_urlEncodedBodyWithCarrierPostRawData:(id)a3;
+ (id)_urlEncodedBodyWithPostdata:(id)a3;
+ (id)requestWithType:(unint64_t)a3 URL:(id)a4 postdata:(id)a5;
@end

@implementation TSURLRequestFactory

+ (id)requestWithType:(unint64_t)a3 URL:(id)a4 postdata:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if (v7
    && ([v7 absoluteString],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v10))
  {
    if (v8
      && ([v8 allKeys],
          v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v11 count],
          v11,
          v12))
    {
      switch(a3)
      {
        case 0uLL:
          v26 = _TSLogDomain();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            +[TSURLRequestFactory requestWithType:URL:postdata:].cold.6(v26, v27, v28, v29, v30, v31, v32, v33);
          }

          goto LABEL_27;
        case 1uLL:
        case 6uLL:
          uint64_t v13 = +[TSURLRequestFactory _urlEncodedBodyWithPostdata:v8];
          goto LABEL_19;
        case 2uLL:
        case 5uLL:
          v24 = +[TSURLRequestFactory _jsonBodyWithPostdata:v8];
          v25 = @"application/json";
          if (!v24) {
            goto LABEL_27;
          }
          goto LABEL_20;
        case 3uLL:
          uint64_t v13 = +[TSURLRequestFactory _urlEncodedBodyWithCarrierPostRawData:v8];
LABEL_19:
          v24 = v13;
          v25 = @"application/x-www-form-urlencoded";
          if (!v13) {
            goto LABEL_27;
          }
LABEL_20:
          v22 = [MEMORY[0x263F089E0] requestWithURL:v7];
          [v22 _setNonAppInitiated:1];
          [v22 setValue:v25 forHTTPHeaderField:@"content-type"];
          [v22 setHTTPMethod:@"POST"];
          [v22 setHTTPBody:v24];
          v34 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NSObject length](v24, "length"));
          [v22 setValue:v34 forHTTPHeaderField:@"content-length"];

          v35 = _TSLogDomain();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            +[TSURLRequestFactory requestWithType:URL:postdata:].cold.5((uint64_t)v7, v22);
          }

          v36 = _TSLogDomain();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            +[TSURLRequestFactory requestWithType:URL:postdata:].cold.4((uint64_t)v25, v22);
          }

          v37 = _TSLogDomain();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
            +[TSURLRequestFactory requestWithType:URL:postdata:]();
          }

          break;
        default:
LABEL_27:
          v24 = _TSLogDomain();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            +[TSURLRequestFactory requestWithType:URL:postdata:](v24, v38, v39, v40, v41, v42, v43, v44);
          }
          v22 = 0;
          break;
      }
    }
    else
    {
      v23 = _TSLogDomain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v47 = v7;
        __int16 v48 = 2080;
        v49 = "+[TSURLRequestFactory requestWithType:URL:postdata:]";
        _os_log_impl(&dword_227A17000, v23, OS_LOG_TYPE_INFO, "[I] No postdata for: %@ @%s", buf, 0x16u);
      }

      v22 = [MEMORY[0x263F089E0] requestWithURL:v7];
      [v22 _setNonAppInitiated:1];
    }
  }
  else
  {
    v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[TSURLRequestFactory requestWithType:URL:postdata:](v14, v15, v16, v17, v18, v19, v20, v21);
    }

    v22 = 0;
  }

  return v22;
}

+ (id)_urlEncodedBodyWithPostdata:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  v5 = [v3 array];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__TSURLRequestFactory__urlEncodedBodyWithPostdata___block_invoke;
  v11[3] = &unk_2648282D8;
  id v12 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];

  id v7 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v7 setQueryItems:v6];
  id v8 = [v7 query];
  v9 = [v8 dataUsingEncoding:1];

  return v9;
}

void __51__TSURLRequestFactory__urlEncodedBodyWithPostdata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x263F08BD0];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithName:v7 value:v6];

  [*(id *)(a1 + 32) addObject:v8];
}

+ (id)_urlEncodedBodyWithCarrierPostRawData:(id)a3
{
  id v4 = (id)*MEMORY[0x263F31940];
  v5 = [a3 objectForKeyedSubscript:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[TSURLRequestFactory _urlEncodedBodyWithCarrierPostRawData:v6];
    }
  }
  id v7 = [v5 dataUsingEncoding:4];

  return v7;
}

+ (id)_jsonBodyWithPostdata:(id)a3
{
  id v7 = 0;
  v3 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:0 error:&v7];
  id v4 = v7;
  if (v4)
  {
    v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[TSURLRequestFactory _jsonBodyWithPostdata:]();
    }
  }
  return v3;
}

+ (void)requestWithType:(uint64_t)a3 URL:(uint64_t)a4 postdata:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestWithType:(uint64_t)a3 URL:(uint64_t)a4 postdata:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestWithType:URL:postdata:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "+[TSURLRequestFactory requestWithType:URL:postdata:]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db] postdata: %@ @%s", v1, 0x16u);
}

+ (void)requestWithType:(uint64_t)a1 URL:(void *)a2 postdata:.cold.4(uint64_t a1, void *a2)
{
  v2 = [a2 HTTPBody];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_227A17000, v3, v4, "[Db] contentType %@, body: %@ @%s", v5, v6, v7, v8, v9);
}

+ (void)requestWithType:(uint64_t)a1 URL:(void *)a2 postdata:.cold.5(uint64_t a1, void *a2)
{
  v2 = [a2 allHTTPHeaderFields];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_227A17000, v3, v4, "[Db] http request %@ headers: %@ @%s", v5, v6, v7, v8, v9);
}

+ (void)requestWithType:(uint64_t)a3 URL:(uint64_t)a4 postdata:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_urlEncodedBodyWithCarrierPostRawData:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v6 = 138412802;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  __int16 v10 = 2080;
  v11 = "+[TSURLRequestFactory _urlEncodedBodyWithCarrierPostRawData:]";
  id v5 = v7;
  _os_log_error_impl(&dword_227A17000, a3, OS_LOG_TYPE_ERROR, "[E]value type (%@) is unexpected for key (%@) @%s", (uint8_t *)&v6, 0x20u);
}

+ (void)_jsonBodyWithPostdata:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "+[TSURLRequestFactory _jsonBodyWithPostdata:]";
  _os_log_error_impl(&dword_227A17000, v0, OS_LOG_TYPE_ERROR, "[E]Failed to create request body: %@ @%s", v1, 0x16u);
}

@end