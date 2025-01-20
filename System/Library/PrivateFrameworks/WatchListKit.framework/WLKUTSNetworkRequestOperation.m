@interface WLKUTSNetworkRequestOperation
- (BOOL)didHandleInvalidConfig;
- (WLKURLRequestProperties)requestProperties;
- (WLKUTSNetworkRequestOperation)init;
- (WLKUTSNetworkRequestOperation)initWithRequestProperties:(id)a3;
- (id)responseDictionary;
- (id)shortDescription;
- (unint64_t)environmentHash;
- (void)configureSession;
- (void)handleResult:(id)a3 error:(id)a4;
- (void)prepareURLRequest:(id)a3;
- (void)setDidHandleInvalidConfig:(BOOL)a3;
- (void)setEnvironmentHash:(unint64_t)a3;
- (void)setRequestProperties:(id)a3;
@end

@implementation WLKUTSNetworkRequestOperation

- (WLKUTSNetworkRequestOperation)initWithRequestProperties:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLKUTSNetworkRequestOperation;
  v5 = -[WLKNetworkRequestOperation initWithURLRequest:options:](&v8, sel_initWithURLRequest_options_, 0, [v4 options]);
  v6 = v5;
  if (v5) {
    [(WLKUTSNetworkRequestOperation *)v5 setRequestProperties:v4];
  }

  return v6;
}

- (void)setRequestProperties:(id)a3
{
}

- (void)handleResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 response];
  v9 = [v8 allHeaderFields];
  v10 = objc_msgSend(v9, "wlk_caseInsensitiveValueForKey:", @"X-Apple-utsk-expired");

  if (v10)
  {
    v11 = +[WLKConfigurationManager sharedInstance];
    [v11 fetchConfigurationWithOptions:0 cachePolicy:3 queryParameters:0 completion:&__block_literal_global_47];

    v16.receiver = self;
    v16.super_class = (Class)WLKUTSNetworkRequestOperation;
    [(WLKNetworkRequestOperation *)&v16 handleResult:v6 error:v7];
  }
  else
  {
    v12 = [v8 allHeaderFields];
    v13 = objc_msgSend(v12, "wlk_caseInsensitiveValueForKey:", @"X-Apple-utsk");

    if ([v13 length])
    {
      v14 = +[WLKConfigurationManager sharedInstance];
      [v14 _setUtsk:v13];
    }
    v15.receiver = self;
    v15.super_class = (Class)WLKUTSNetworkRequestOperation;
    [(WLKNetworkRequestOperation *)&v15 handleResult:v6 error:v7];
  }
}

- (void)configureSession
{
  v2.receiver = self;
  v2.super_class = (Class)WLKUTSNetworkRequestOperation;
  [(WLKNetworkRequestOperation *)&v2 configureSession];
}

- (id)shortDescription
{
  uint64_t v3 = [(WLKNetworkRequestOperation *)self identifier];
  id v4 = (void *)v3;
  v5 = &stru_1F13BCF18;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  id v6 = v5;

  if ((unint64_t)[(__CFString *)v6 length] >= 7)
  {
    id v7 = [(WLKNetworkRequestOperation *)self identifier];
    uint64_t v8 = [v7 substringToIndex:7];

    id v6 = (__CFString *)v8;
  }
  v9 = NSString;
  v10 = [(WLKUTSNetworkRequestOperation *)self requestProperties];
  v11 = [v10 shortDescription];
  v12 = [v9 stringWithFormat:@"%@ %@", v6, v11];

  return v12;
}

- (WLKURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (void)prepareURLRequest:(id)a3
{
  id v4 = a3;
  v5 = WLKNetworkSignpostLogObject();
  unint64_t v6 = [(WLKNetworkRequestOperation *)self signpostIdentifier];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NetworkRequest.Config", "", buf, 2u);
    }
  }

  uint64_t v8 = +[WLKConfigurationManager sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__WLKUTSNetworkRequestOperation_prepareURLRequest___block_invoke;
  v10[3] = &unk_1E620B8F0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 fetchConfigurationWithOptions:0 cachePolicy:4 queryParameters:0 completion:v10];
}

void __51__WLKUTSNetworkRequestOperation_prepareURLRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = WLKNetworkSignpostLogObject();
  uint64_t v8 = [*(id *)(a1 + 32) signpostIdentifier];
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)id v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v7, OS_SIGNPOST_INTERVAL_END, v9, "NetworkRequest.Config", "", v11, 2u);
    }
  }

  if (v5)
  {
    v10 = [*(id *)(*(void *)(a1 + 32) + 408) URLRequestWithConfiguration:v5];
    *(void *)(*(void *)(a1 + 32) + 416) = [v5 environmentHash];
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestProperties, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (WLKUTSNetworkRequestOperation)init
{
  return 0;
}

void __52__WLKUTSNetworkRequestOperation_handleResult_error___block_invoke()
{
  v0 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKUTSNetworkRequestOperation - X-Apple-utsk-expired is set to true. Fetches init/config", v1, 2u);
  }
}

- (id)responseDictionary
{
  responseDictionary = self->_responseDictionary;
  if (!responseDictionary)
  {
    id v4 = objc_alloc_init(WLKDictionaryResponseProcessor);
    id v5 = [(WLKNetworkRequestOperation *)self data];
    id v6 = [(WLKDictionaryResponseProcessor *)v4 processResponseData:v5 error:0];

    uint64_t v7 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"data");
    uint64_t v8 = (void *)v7;
    if (v7) {
      os_signpost_id_t v9 = (void *)v7;
    }
    else {
      os_signpost_id_t v9 = v6;
    }
    v10 = v9;
    id v11 = self->_responseDictionary;
    self->_responseDictionary = v10;

    responseDictionary = self->_responseDictionary;
  }

  return responseDictionary;
}

- (unint64_t)environmentHash
{
  return self->_environmentHash;
}

- (void)setEnvironmentHash:(unint64_t)a3
{
  self->_environmentHash = a3;
}

- (BOOL)didHandleInvalidConfig
{
  return self->_didHandleInvalidConfig;
}

- (void)setDidHandleInvalidConfig:(BOOL)a3
{
  self->_didHandleInvalidConfig = a3;
}

@end