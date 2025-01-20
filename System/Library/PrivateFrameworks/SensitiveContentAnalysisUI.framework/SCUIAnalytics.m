@interface SCUIAnalytics
+ (id)sharedInstance;
- (BMSource)biomeSCUISource;
- (BMStream)biomeSCUIStream;
- (NSString)clientBundleID;
- (OS_dispatch_queue)queue;
- (SCUIAnalytics)init;
- (int)ageGroup;
- (int)biomeAgeGroup;
- (void)collectUIInteractionEvent:(int)a3 :(int)a4 :(int)a5 :(int)a6 :(int)a7;
- (void)setAgeGroup:(int)a3;
- (void)setBiomeSCUISource:(id)a3;
- (void)setBiomeSCUIStream:(id)a3;
- (void)setClientBundleID:(id)a3;
@end

@implementation SCUIAnalytics

- (SCUIAnalytics)init
{
  v16.receiver = self;
  v16.super_class = (Class)SCUIAnalytics;
  v2 = [(SCUIAnalytics *)&v16 init];
  if (v2)
  {
    v3 = BiomeLibrary();
    v4 = [v3 SensitiveContentAnalysis];
    uint64_t v5 = [v4 UIInteraction];
    biomeSCUIStream = v2->_biomeSCUIStream;
    v2->_biomeSCUIStream = (BMStream *)v5;

    uint64_t v7 = [(BMStream *)v2->_biomeSCUIStream source];
    biomeSCUISource = v2->_biomeSCUISource;
    v2->_biomeSCUISource = (BMSource *)v7;

    v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = [v9 bundleIdentifier];
    uint64_t v11 = [v10 copy];
    clientBundleID = v2->_clientBundleID;
    v2->_clientBundleID = (NSString *)v11;

    v2->_ageGroup = [(SCUIAnalytics *)v2 biomeAgeGroup];
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.SensitiveContentAnalysis.SCUIAnalytics", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1) {
    dispatch_once(&sharedInstance_creation, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sInstance;

  return v2;
}

uint64_t __31__SCUIAnalytics_sharedInstance__block_invoke()
{
  sharedInstance_sInstance = objc_alloc_init(SCUIAnalytics);

  return MEMORY[0x270F9A758]();
}

- (void)collectUIInteractionEvent:(int)a3 :(int)a4 :(int)a5 :(int)a6 :(int)a7
{
  dispatch_queue_t v13 = [(SCUIAnalytics *)self clientBundleID];
  int v14 = [(SCUIAnalytics *)self ageGroup];
  v15 = [(SCUIAnalytics *)self biomeSCUISource];
  objc_super v16 = [(SCUIAnalytics *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SCUIAnalytics_collectUIInteractionEvent___::__block_invoke;
  block[3] = &unk_2654AB5C0;
  int v22 = a3;
  int v23 = v14;
  int v24 = a4;
  int v25 = a5;
  int v26 = a6;
  int v27 = a7;
  id v20 = v13;
  id v21 = v15;
  id v17 = v15;
  id v18 = v13;
  dispatch_async(v16, block);
}

void __47__SCUIAnalytics_collectUIInteractionEvent___::__block_invoke(uint64_t a1)
{
  if (SCIsAnalyticsEnabled())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x263F2A390]) initWithInteractionType:*(unsigned int *)(a1 + 48) ageGroup:*(unsigned int *)(a1 + 52) eventDirection:*(unsigned int *)(a1 + 56) screen:*(unsigned int *)(a1 + 60) action:*(unsigned int *)(a1 + 64) contentType:*(unsigned int *)(a1 + 68) clientBundleID:*(void *)(a1 + 32) trackingVersion:@"1"];
    [*(id *)(a1 + 40) sendEvent:v3];
  }
  else
  {
    v2 = [MEMORY[0x263F17660] clientUI];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __47__SCUIAnalytics_collectUIInteractionEvent___::__block_invoke_cold_1(v2);
    }
  }
}

- (int)biomeAgeGroup
{
  v2 = [MEMORY[0x263F17668] currentScanningPolicy];
  unint64_t v3 = [v2 policy];

  if (v3 < 2) {
    return 3;
  }
  uint64_t v5 = [MEMORY[0x263F17668] currentInterventionType];
  if ([v5 isEqualToString:*MEMORY[0x263F53E88]]) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }

  return v4;
}

- (BMStream)biomeSCUIStream
{
  return self->_biomeSCUIStream;
}

- (void)setBiomeSCUIStream:(id)a3
{
}

- (BMSource)biomeSCUISource
{
  return self->_biomeSCUISource;
}

- (void)setBiomeSCUISource:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (int)ageGroup
{
  return self->_ageGroup;
}

- (void)setAgeGroup:(int)a3
{
  self->_ageGroup = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_biomeSCUISource, 0);

  objc_storeStrong((id *)&self->_biomeSCUIStream, 0);
}

void __47__SCUIAnalytics_collectUIInteractionEvent___::__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_25C01A000, log, OS_LOG_TYPE_DEBUG, "SCAnalytics: No consent for analytics: UIInteraction", v1, 2u);
}

@end