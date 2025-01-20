@interface WLKURLSessionManager
+ (id)sharedInstance;
- (AMSURLSession)urlSession;
- (WLKURLSessionManager)init;
- (void)setUrlSession:(id)a3;
@end

@implementation WLKURLSessionManager

- (AMSURLSession)urlSession
{
  return self->_urlSession;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

void __38__WLKURLSessionManager_sharedInstance__block_invoke()
{
  v0 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SessionManager.Init", "", buf, 2u);
  }

  v1 = objc_alloc_init(WLKURLSessionManager);
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

  v3 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SessionManager.Init", "", v4, 2u);
  }
}

- (WLKURLSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WLKURLSessionManager;
  v2 = [(WLKURLSessionManager *)&v8 init];
  if (v2)
  {
    v3 = +[WLKNetworkRequestUtilities defaultSessionConfiguration];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F4DE88]) initWithConfiguration:v3];
    v5 = objc_alloc_init(WLKURLResponseDecoder);
    [v4 setResponseDecoder:v5];

    urlSession = v2->_urlSession;
    v2->_urlSession = (AMSURLSession *)v4;
  }
  return v2;
}

- (void)setUrlSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end