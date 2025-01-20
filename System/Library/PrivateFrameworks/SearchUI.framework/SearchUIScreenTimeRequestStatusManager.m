@interface SearchUIScreenTimeRequestStatusManager
+ (SearchUIScreenTimeRequestStatusManager)sharedManager;
- (BPSSink)biomeSink;
- (NSMutableDictionary)requestStatuses;
- (NSNotificationCenter)notificationCenter;
- (SearchUIScreenTimeRequestStatusManager)init;
- (id)addObserver:(id)a3;
- (int)statusForRequestID:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setBiomeSink:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setupSink;
- (void)updateWithEvent:(id)a3;
@end

@implementation SearchUIScreenTimeRequestStatusManager

+ (SearchUIScreenTimeRequestStatusManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedManager_sharedObserver;
  return (SearchUIScreenTimeRequestStatusManager *)v2;
}

uint64_t __55__SearchUIScreenTimeRequestStatusManager_sharedManager__block_invoke()
{
  sharedManager_sharedObserver = objc_alloc_init(SearchUIScreenTimeRequestStatusManager);
  return MEMORY[0x1F41817F8]();
}

- (SearchUIScreenTimeRequestStatusManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIScreenTimeRequestStatusManager;
  v2 = [(SearchUIScreenTimeRequestStatusManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestStatuses = v2->_requestStatuses;
    v2->_requestStatuses = v3;

    v5 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x1E4F28EB8]);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v5;

    [(SearchUIScreenTimeRequestStatusManager *)v2 setupSink];
  }
  return v2;
}

- (void)setupSink
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.SearchUI.SearchUIScreenTimeRequestStatusManager.queue", v3);

  dispatch_queue_t v13 = v4;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.SearchUI.SearchUIScreenTimeRequestStatusManager.queue" targetQueue:v4 waking:0];
  objc_initWeak(&location, self);
  v6 = BiomeLibrary();
  v7 = [v6 Family];
  objc_super v8 = [v7 ScreenTime];
  v9 = [v8 Request];
  v10 = [v9 DSLPublisher];
  v11 = [v10 subscribeOn:v5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__SearchUIScreenTimeRequestStatusManager_setupSink__block_invoke_2;
  v14[3] = &unk_1E6E725D0;
  objc_copyWeak(&v15, &location);
  v12 = [v11 sinkWithCompletion:&__block_literal_global_17 receiveInput:v14];
  [(SearchUIScreenTimeRequestStatusManager *)self setBiomeSink:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __51__SearchUIScreenTimeRequestStatusManager_setupSink__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  dispatch_queue_t v4 = [v3 eventBody];

  [WeakRetained updateWithEvent:v4];
}

- (int)statusForRequestID:(id)a3
{
  id v4 = a3;
  v5 = [(SearchUIScreenTimeRequestStatusManager *)self requestStatuses];
  v6 = [v5 objectForKeyedSubscript:v4];

  LODWORD(v4) = [v6 intValue];
  return (int)v4;
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  notificationCenter = self->_notificationCenter;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SearchUIScreenTimeRequestStatusManager_addObserver___block_invoke;
  v9[3] = &unk_1E6E725F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [(NSNotificationCenter *)notificationCenter addObserverForName:@"ScreentimeRequestStatusDidChangeNotification" object:0 queue:0 usingBlock:v9];

  return v7;
}

void __54__SearchUIScreenTimeRequestStatusManager_addObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v7 = [v3 userInfo];
  id v4 = [v7 objectForKeyedSubscript:@"requestID"];
  v5 = [v3 userInfo];

  id v6 = [v5 objectForKeyedSubscript:@"status"];
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v4, [v6 intValue]);
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:");
  }
}

- (void)updateWithEvent:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "status"));
  id v7 = [(SearchUIScreenTimeRequestStatusManager *)self requestStatuses];
  objc_super v8 = [v5 requestID];
  [v7 setObject:v6 forKeyedSubscript:v8];

  notificationCenter = self->_notificationCenter;
  v15[0] = @"requestID";
  id v10 = [v5 requestID];
  v15[1] = @"status";
  v16[0] = v10;
  v11 = NSNumber;
  uint64_t v12 = [v5 status];

  dispatch_queue_t v13 = [v11 numberWithInt:v12];
  v16[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [(NSNotificationCenter *)notificationCenter postNotificationName:@"ScreentimeRequestStatusDidChangeNotification" object:0 userInfo:v14];
}

- (void)dealloc
{
  id v3 = [(SearchUIScreenTimeRequestStatusManager *)self biomeSink];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)SearchUIScreenTimeRequestStatusManager;
  [(SearchUIScreenTimeRequestStatusManager *)&v4 dealloc];
}

- (BPSSink)biomeSink
{
  return self->_biomeSink;
}

- (void)setBiomeSink:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSMutableDictionary)requestStatuses
{
  return self->_requestStatuses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStatuses, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_biomeSink, 0);
}

@end