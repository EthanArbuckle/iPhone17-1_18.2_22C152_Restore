@interface NRURLResolutionManager
+ (id)sharedManager;
- (BOOL)userHasBundleSubscription;
- (NRBloomFilterInfoService)bloomFilterInfoService;
- (NRURLResolutionManager)init;
- (id)createResolutionOperationForNewsURL:(id)a3;
- (id)createResolutionOperationForWebURL:(id)a3;
@end

@implementation NRURLResolutionManager

- (NRURLResolutionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)NRURLResolutionManager;
  v2 = [(NRURLResolutionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    bloomFilterInfoService = v2->_bloomFilterInfoService;
    v2->_bloomFilterInfoService = (NRBloomFilterInfoService *)v3;
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NRURLResolutionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_result;
  return v2;
}

uint64_t __39__NRURLResolutionManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_result = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)createResolutionOperationForWebURL:(id)a3
{
  id v4 = a3;
  v5 = [NRWebURLResolutionOperation alloc];
  objc_super v6 = [(NRURLResolutionManager *)self bloomFilterInfoService];
  v7 = [(NRWebURLResolutionOperation *)v5 initWithWebURL:v4 bloomFilterInfoService:v6];

  return v7;
}

- (id)createResolutionOperationForNewsURL:(id)a3
{
  id v3 = a3;
  id v4 = [[NRNewsURLResolutionOperation alloc] initWithNewsURL:v3];

  return v4;
}

- (BOOL)userHasBundleSubscription
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.newscore"];
  char v3 = [v2 BOOLForKey:@"news_url_resolution_subscription_status"];

  return v3;
}

- (NRBloomFilterInfoService)bloomFilterInfoService
{
  return self->_bloomFilterInfoService;
}

- (void).cxx_destruct
{
}

@end