@interface WLKURLResponseDecoder
+ (void)logNetworkHeaders:(id)a3 identifier:(id)a4;
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation WLKURLResponseDecoder

void __54__WLKURLResponseDecoder_logNetworkHeaders_identifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [v7 lowercaseString];
  if ([(id)logNetworkHeaders_identifier__headersToLog containsObject:v6]) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v7];
  }
}

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 responseHeaders];
  v8 = objc_opt_class();
  v9 = [v6 logUUID];
  [v8 logNetworkHeaders:v7 identifier:v9];

  v12.receiver = self;
  v12.super_class = (Class)WLKURLResponseDecoder;
  v10 = [(AMSURLResponseDecoder *)&v12 resultFromResult:v6 error:a4];

  return v10;
}

+ (void)logNetworkHeaders:(id)a3 identifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (logNetworkHeaders_identifier__onceToken != -1) {
    dispatch_once(&logNetworkHeaders_identifier__onceToken, &__block_literal_global_45);
  }
  if (logNetworkHeaders_identifier__isInternalBuild)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__WLKURLResponseDecoder_logNetworkHeaders_identifier___block_invoke_2;
    v10[3] = &unk_1E620AB90;
    id v8 = v7;
    id v11 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];
    v9 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKURLResponseDecoder - id: %@ response headers: %@", buf, 0x16u);
    }
  }
}

void __54__WLKURLResponseDecoder_logNetworkHeaders_identifier___block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  logNetworkHeaders_identifier__isInternalBuild = os_variant_has_internal_content();
  v2[0] = @"x-apple-response-time";
  v2[1] = @"x-apple-jingle-correlation-key";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)logNetworkHeaders_identifier__headersToLog;
  logNetworkHeaders_identifier__headersToLog = v0;
}

@end