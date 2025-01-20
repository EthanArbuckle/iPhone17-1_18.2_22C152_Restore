@interface SDNetworkQualityInquiry
+ (SDNetworkQualityInquiry)sharedInstance;
- (BOOL)areKnownNetworksReady;
- (NSMutableSet)knownNetworks;
- (NWNetworkOfInterestManager)manager;
- (OS_dispatch_queue)queue;
- (SDNetworkQualityInquiry)init;
- (unint64_t)getNetworkQuality;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
@end

@implementation SDNetworkQualityInquiry

+ (SDNetworkQualityInquiry)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_sharedSelf;

  return (SDNetworkQualityInquiry *)v2;
}

void __41__SDNetworkQualityInquiry_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SDNetworkQualityInquiry);
  v1 = (void *)sharedInstance_sharedSelf;
  sharedInstance_sharedSelf = (uint64_t)v0;

  if (!sharedInstance_sharedSelf)
  {
    v2 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __41__SDNetworkQualityInquiry_sharedInstance__block_invoke_cold_1(v2);
    }
  }
}

- (SDNetworkQualityInquiry)init
{
  v11.receiver = self;
  v11.super_class = (Class)SDNetworkQualityInquiry;
  v2 = [(SDNetworkQualityInquiry *)&v11 init];
  if (v2)
  {
    v3 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x263F7C1E0]);
    manager = v2->_manager;
    v2->_manager = v3;

    if (!v2->_manager)
    {
      v9 = 0;
      goto LABEL_6;
    }
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.searchd.networkqualityinquiry", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    [(NWNetworkOfInterestManager *)v2->_manager setQueue:v2->_queue];
    [(NWNetworkOfInterestManager *)v2->_manager setDelegate:v2];
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    knownNetworks = v2->_knownNetworks;
    v2->_knownNetworks = v7;

    [(NWNetworkOfInterestManager *)v2->_manager trackNOIAnyForInterfaceType:2 options:0];
    [(NWNetworkOfInterestManager *)v2->_manager trackNOIAnyForInterfaceType:1 options:0];
    [(NWNetworkOfInterestManager *)v2->_manager trackNOIAnyForInterfaceType:3 options:0];
  }
  v9 = v2;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  [(NWNetworkOfInterestManager *)self->_manager setDelegate:0];
  [(NWNetworkOfInterestManager *)self->_manager destroy];
  v3.receiver = self;
  v3.super_class = (Class)SDNetworkQualityInquiry;
  [(SDNetworkQualityInquiry *)&v3 dealloc];
}

- (BOOL)areKnownNetworksReady
{
  objc_super v3 = [(SDNetworkQualityInquiry *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(SDNetworkQualityInquiry *)self knownNetworks];
  LOBYTE(v3) = [v4 count] == 3;

  return (char)v3;
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = a3;
  id v5 = [(SDNetworkQualityInquiry *)self knownNetworks];
  [v5 addObject:v4];
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4 = a3;
  id v5 = [(SDNetworkQualityInquiry *)self knownNetworks];
  [v5 removeObject:v4];

  id v7 = [(SDNetworkQualityInquiry *)self manager];
  uint64_t v6 = [v4 interface];

  [v7 trackNOIAnyForInterfaceType:v6 options:0];
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SDNetworkQualityInquiry *)self didStopTrackingNOI:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)getNetworkQuality
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 3;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SDNetworkQualityInquiry_getNetworkQuality__block_invoke;
  v5[3] = &unk_2644B2F70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__SDNetworkQualityInquiry_getNetworkQuality__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) areKnownNetworksReady])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v2 = objc_msgSend(*(id *)(a1 + 32), "knownNetworks", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if ([v7 linkQuality] == 100)
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          }
          else
          {
            [v7 linkQuality];
            if ([v7 linkQuality] == 20)
            {
              uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
              if (!*(void *)(v8 + 24)) {
                *(void *)(v8 + 24) = 2;
              }
            }
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
}

- (NWNetworkOfInterestManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)knownNetworks
{
  return self->_knownNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

void __41__SDNetworkQualityInquiry_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E5D7000, log, OS_LOG_TYPE_ERROR, "The network quality inquiry couldnt be initialized", v1, 2u);
}

@end