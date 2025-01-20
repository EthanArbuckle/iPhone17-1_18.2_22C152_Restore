@interface WLKSettingsRequestOperation
+ (id)_requestURL:(id *)a3;
- (NSDictionary)response;
- (WLKSettingsRequestOperation)init;
- (void)prepareURLRequest:(id)a3;
- (void)processResponse;
@end

@implementation WLKSettingsRequestOperation

- (WLKSettingsRequestOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKSettingsRequestOperation;
  return [(WLKNetworkRequestOperation *)&v3 initWithURLRequest:0 options:0];
}

- (void)prepareURLRequest:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v13 = 0;
  v5 = [(id)objc_opt_class() _requestURL:&v13];
  id v6 = v13;
  if (v5)
  {
    v7 = WLKNetworkSignpostLogObject();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

    v9 = WLKNetworkSignpostLogObject();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      __int16 v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Settings.URLRequest", "", (uint8_t *)&v12, 2u);
    }

    v11 = [MEMORY[0x1E4F18D50] requestWithURL:v5];
    [v11 setTimeoutInterval:5.0];
    v4[2](v4, v11, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v6);
  }
}

- (void)processResponse
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = WLKNetworkSignpostLogObject();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  v5 = WLKNetworkSignpostLogObject();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v6, OS_SIGNPOST_INTERVAL_END, v4, "Settings.URLRequest", "", (uint8_t *)&v13, 2u);
  }

  v7 = objc_alloc_init(WLKDictionaryResponseProcessor);
  os_signpost_id_t v8 = [(WLKNetworkRequestOperation *)self data];
  v9 = [(WLKDictionaryResponseProcessor *)v7 processResponseData:v8 error:0];

  p_response = &self->_response;
  objc_storeStrong((id *)&self->_response, v9);
  v11 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = *p_response;
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKSettingsRequestOperation - response: %@", (uint8_t *)&v13, 0xCu);
  }
}

+ (id)_requestURL:(id *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4FA9C70], "app", a3);
  os_signpost_id_t v4 = [v3 cachedURLForKey:kBagKeyGetWatchListSettings];

  return v4;
}

- (NSDictionary)response
{
  return self->_response;
}

- (void).cxx_destruct
{
}

@end