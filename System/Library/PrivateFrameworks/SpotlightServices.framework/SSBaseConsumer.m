@interface SSBaseConsumer
+ (id)sharedInstance;
- (BOOL)enabled;
- (BOOL)filterEvent:(id)a3;
- (SSBaseConsumer)init;
- (id)consumerLabel;
- (id)identifier;
- (id)queryWithString:(id)a3 bundleIDs:(id)a4 fetchAttributes:(id)a5;
- (id)stream;
- (void)handleEvent:(id)a3;
- (void)indexItems:(id)a3 protectionClass:(id)a4 bundleID:(id)a5;
- (void)start;
- (void)stop;
@end

@implementation SSBaseConsumer

void __23__SSBaseConsumer_start__block_invoke_100(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 eventBody];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v5 = [v6 eventBody];
      [WeakRetained handleEvent:v5];
    }
  }
}

- (id)identifier
{
  return self->_identifier;
}

- (void)indexItems:(id)a3 protectionClass:(id)a4 bundleID:(id)a5
{
  v7 = (void *)MEMORY[0x1E4FA5D60];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 sharedInstance];
  [v11 indexSearchableItems:v10 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v9 forBundleID:v8 options:0 completionHandler:0];
}

- (SSBaseConsumer)init
{
  v10.receiver = self;
  v10.super_class = (Class)SSBaseConsumer;
  v2 = [(SSBaseConsumer *)&v10 init];
  if (v2)
  {
    if ([(SSBaseConsumer *)v2 isMemberOfClass:objc_opt_class()]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"SSBaseConsumer is an abstract class and should not be instantiated directly."];
    }
    if (![(SSBaseConsumer *)v2 enabled])
    {
      id v8 = 0;
      goto LABEL_10;
    }
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_15);
    }
    v3 = NSString;
    uint64_t v4 = init_clientBundleIdentifier;
    v5 = [(SSBaseConsumer *)v2 consumerLabel];
    uint64_t v6 = [v3 stringWithFormat:@"%@.BiomeConsumer.%@", v4, v5];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v6;
  }
  id v8 = v2;
LABEL_10:

  return v8;
}

void __22__SSBaseConsumer_init__block_invoke()
{
  v0 = (void *)init_clientBundleIdentifier;
  init_clientBundleIdentifier = @"com.apple.searchd";
}

+ (id)sharedInstance
{
  return 0;
}

- (BOOL)enabled
{
  return +[SSBiomeConsumers enabled];
}

- (id)consumerLabel
{
  return 0;
}

- (id)stream
{
  return 0;
}

- (void)start
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id location = 0;
  objc_initWeak(&location, self);
  if (!self->_queue)
  {
    id v3 = [(SSBaseConsumer *)self identifier];
    uint64_t v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v7 = (OS_dispatch_queue *)dispatch_queue_create(v4, v6);
    queue = self->_queue;
    self->_queue = v7;
  }
  if (!self->_indexQueue)
  {
    id v9 = NSString;
    objc_super v10 = [(SSBaseConsumer *)self identifier];
    id v11 = [v9 stringWithFormat:@"%@.indexQueue", v10];
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    v15 = (OS_dispatch_queue *)dispatch_queue_create(v12, v14);
    indexQueue = self->_indexQueue;
    self->_indexQueue = v15;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F502E8]);
  v18 = [(SSBaseConsumer *)self identifier];
  v19 = (BMBiomeScheduler *)[v17 initWithIdentifier:v18 targetQueue:self->_queue waking:0];
  scheduler = self->_scheduler;
  self->_scheduler = v19;

  v21 = [(SSBaseConsumer *)self stream];
  v22 = [v21 DSLPublisherWithUseCase:@"SpotlightEngagementData"];

  v23 = [v22 subscribeOn:self->_scheduler];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __23__SSBaseConsumer_start__block_invoke;
  v30[3] = &unk_1E634C988;
  v30[4] = self;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __23__SSBaseConsumer_start__block_invoke_100;
  v28[3] = &unk_1E634C9B0;
  objc_copyWeak(&v29, &location);
  v24 = [v23 sinkWithCompletion:v30 receiveInput:v28];
  sink = self->_sink;
  self->_sink = v24;

  v26 = SSGeneralLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [(SSBaseConsumer *)self identifier];
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    _os_log_impl(&dword_1BDB2A000, v26, OS_LOG_TYPE_DEFAULT, "%@: start listening.", buf, 0xCu);
  }
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

void __23__SSBaseConsumer_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  v5 = SSGeneralLog();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __23__SSBaseConsumer_start__block_invoke_cold_1(a1, v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [*(id *)(a1 + 32) identifier];
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_1BDB2A000, v6, OS_LOG_TYPE_DEFAULT, "%@: done listening.", (uint8_t *)&v8, 0xCu);
  }
}

- (void)stop
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(BMBiomeScheduler *)self->_scheduler cancel];
  [(BPSSink *)self->_sink cancel];
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

  v5 = SSGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(SSBaseConsumer *)self identifier];
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_1BDB2A000, v5, OS_LOG_TYPE_DEFAULT, "%@: finished listening.", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)filterEvent:(id)a3
{
  return 0;
}

- (void)handleEvent:(id)a3
{
}

- (id)queryWithString:(id)a3 bundleIDs:(id)a4 fetchAttributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v10 setBundleIDs:v8];
  [v10 setInternal:1];
  [v10 setFetchAttributes:v9];
  dispatch_group_t v11 = dispatch_group_create();
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v7 queryContext:v10];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  id v29 = [MEMORY[0x1E4F1CA48] array];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__SSBaseConsumer_queryWithString_bundleIDs_fetchAttributes___block_invoke;
  v23[3] = &unk_1E634C740;
  v23[4] = &v24;
  [v12 setFoundItemsHandler:v23];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __60__SSBaseConsumer_queryWithString_bundleIDs_fetchAttributes___block_invoke_2;
  v21 = &unk_1E634C9D8;
  v13 = v11;
  v22 = v13;
  [v12 setCompletionHandler:&v18];
  dispatch_group_enter(v13);
  objc_msgSend(v12, "start", v18, v19, v20, v21);
  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v13, v14);
  id v15 = (id)v25[5];
  objc_sync_enter(v15);
  v16 = (void *)[(id)v25[5] copy];
  objc_sync_exit(v15);

  _Block_object_dispose(&v24, 8);
  return v16;
}

void __60__SSBaseConsumer_queryWithString_bundleIDs_fetchAttributes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        objc_sync_enter(v8);
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:", v7, (void)v9);
        objc_sync_exit(v8);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __60__SSBaseConsumer_queryWithString_bundleIDs_fetchAttributes___block_invoke_2(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_indexQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __23__SSBaseConsumer_start__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [a2 error];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  long long v10 = v6;
  _os_log_error_impl(&dword_1BDB2A000, a3, OS_LOG_TYPE_ERROR, "%@: error listening: %@", (uint8_t *)&v7, 0x16u);
}

@end