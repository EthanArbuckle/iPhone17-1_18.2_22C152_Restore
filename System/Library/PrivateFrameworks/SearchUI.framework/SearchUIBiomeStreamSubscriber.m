@interface SearchUIBiomeStreamSubscriber
- (BMStreamBase)stream;
- (BOOL)finished;
- (BOOL)isFinished;
- (BPSSink)biomeSink;
- (NSNotificationCenter)center;
- (NSString)streamIdentifier;
- (OS_dispatch_queue)queue;
- (SearchUIBiomeStreamSubscriber)initWithStreamIdentifier:(id)a3;
- (id)latestEvent;
- (id)notificationName;
- (id)queueLabel;
- (id)schedulerIdentifier;
- (unint64_t)observerCount;
- (void)addObserver:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)getLatestEventWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setBiomeSink:(id)a3;
- (void)setCenter:(id)a3;
- (void)setObserverCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setStream:(id)a3;
- (void)setupSink;
- (void)updateWithEvent:(id)a3;
@end

@implementation SearchUIBiomeStreamSubscriber

- (id)notificationName
{
  v2 = NSString;
  v3 = [(SearchUIBiomeStreamSubscriber *)self streamIdentifier];
  v4 = [v2 stringWithFormat:@"searchui_biomeObserver_%@", v3];

  return v4;
}

- (id)queueLabel
{
  v2 = NSString;
  v3 = [(SearchUIBiomeStreamSubscriber *)self streamIdentifier];
  v4 = [v2 stringWithFormat:@"com.apple.SearchUI.SearchUIBiomeObserver.%@.queue", v3];

  return v4;
}

- (id)schedulerIdentifier
{
  v2 = NSString;
  v3 = [(SearchUIBiomeStreamSubscriber *)self streamIdentifier];
  v4 = [v2 stringWithFormat:@"com.apple.SearchUI.SearchUIBiomeObserver.%@.scheduler", v3];

  return v4;
}

- (SearchUIBiomeStreamSubscriber)initWithStreamIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [(SearchUIBiomeStreamSubscriber *)self init];
  v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_streamIdentifier, a3);
  v8 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x1E4F28EB8]);
  center = v7->_center;
  v7->_center = v8;

  v7->_observerCount = 0;
  id v10 = [(SearchUIBiomeStreamSubscriber *)v7 queueLabel];
  v11 = (const char *)[v10 UTF8String];

  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v13;

  v15 = BiomeLibrary();
  v16 = [(SearchUIBiomeStreamSubscriber *)v7 streamIdentifier];
  id v23 = 0;
  uint64_t v17 = [v15 streamWithIdentifier:v16 error:&v23];
  id v18 = v23;
  stream = v7->_stream;
  v7->_stream = (BMStreamBase *)v17;

  if (!v18)
  {
    [(SearchUIBiomeStreamSubscriber *)v7 setupSink];
LABEL_7:
    v21 = v7;
    goto LABEL_8;
  }
  v20 = SearchUIBiomeLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[SearchUIBiomeStreamSubscriber initWithStreamIdentifier:]((uint64_t)v18, v20);
  }

  v21 = 0;
LABEL_8:

  return v21;
}

- (void)getLatestEventWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIBiomeStreamSubscriber *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SearchUIBiomeStreamSubscriber_getLatestEventWithCompletion___block_invoke;
  v7[3] = &unk_1E6E73D18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__SearchUIBiomeStreamSubscriber_getLatestEventWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) latestEvent];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)latestEvent
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v3 = [(SearchUIBiomeStreamSubscriber *)self stream];
  id v4 = [v3 publisher];
  id v5 = [v4 last];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke;
  v10[3] = &unk_1E6E73E20;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke_13;
  v9[3] = &unk_1E6E73E48;
  v9[4] = self;
  v9[5] = &v11;
  id v6 = (id)[v5 sinkWithCompletion:v10 receiveInput:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  id v5 = SearchUIBiomeLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke_cold_1(a1, v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) streamIdentifier];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1E45B5000, v6, OS_LOG_TYPE_DEFAULT, "Fetching last event from BiomeStream (%@) finished without error.", (uint8_t *)&v8, 0xCu);
  }
}

void __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SearchUIBiomeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) streamIdentifier];
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1E45B5000, v4, OS_LOG_TYPE_DEFAULT, "Received last event from BiomeStream (%@).", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = [v3 eventBody];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (BOOL)isFinished
{
  id v2 = [(SearchUIBiomeStreamSubscriber *)self biomeSink];
  id v3 = [v2 status];
  BOOL v4 = [v3 state] == 2;

  return v4;
}

- (void)dealloc
{
  id v3 = [(SearchUIBiomeStreamSubscriber *)self biomeSink];
  BOOL v4 = [(SearchUIBiomeStreamSubscriber *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SearchUIBiomeStreamSubscriber_dealloc__block_invoke;
  block[3] = &unk_1E6E72730;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)SearchUIBiomeStreamSubscriber;
  [(SearchUIBiomeStreamSubscriber *)&v6 dealloc];
}

uint64_t __40__SearchUIBiomeStreamSubscriber_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)addObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v8 = [(SearchUIBiomeStreamSubscriber *)self center];
  uint64_t v7 = [(SearchUIBiomeStreamSubscriber *)self notificationName];
  [v8 addObserver:v6 selector:a4 name:v7 object:self];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIBiomeStreamSubscriber *)self center];
  [v5 removeObserver:v4];
}

- (void)setupSink
{
  id v3 = objc_alloc(MEMORY[0x1E4F502E8]);
  id v4 = [(SearchUIBiomeStreamSubscriber *)self schedulerIdentifier];
  id v5 = [(SearchUIBiomeStreamSubscriber *)self queue];
  id v6 = (void *)[v3 initWithIdentifier:v4 targetQueue:v5 waking:0];

  objc_initWeak(&location, self);
  uint64_t v7 = [(SearchUIBiomeStreamSubscriber *)self stream];
  id v8 = [v7 DSLPublisher];
  int v9 = [v8 subscribeOn:v6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke;
  v13[3] = &unk_1E6E73E70;
  objc_copyWeak(&v14, &location);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke_16;
  v11[3] = &unk_1E6E73E98;
  objc_copyWeak(&v12, &location);
  uint64_t v10 = [v9 sinkWithCompletion:v13 receiveInput:v11];
  [(SearchUIBiomeStreamSubscriber *)self setBiomeSink:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v3 error];

  id v6 = SearchUIBiomeLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke_cold_1(WeakRetained, v3);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [WeakRetained streamIdentifier];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1E45B5000, v7, OS_LOG_TYPE_DEFAULT, "Subscription to BiomeStream (%@) closed without error.", (uint8_t *)&v9, 0xCu);
  }
}

void __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = SearchUIBiomeLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [WeakRetained streamIdentifier];
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Received event from BiomeStream (%@)", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [v3 eventBody];

  [WeakRetained updateWithEvent:v7];
}

- (void)updateWithEvent:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SearchUIBiomeStreamSubscriber *)self center];
  id v6 = [(SearchUIBiomeStreamSubscriber *)self notificationName];
  int v8 = @"event";
  v9[0] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v5 postNotificationName:v6 object:self userInfo:v7];
}

- (NSString)streamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)finished
{
  return self->_finished;
}

- (BMStreamBase)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (BPSSink)biomeSink
{
  return self->_biomeSink;
}

- (void)setBiomeSink:(id)a3
{
}

- (NSNotificationCenter)center
{
  return self->_center;
}

- (void)setCenter:(id)a3
{
}

- (unint64_t)observerCount
{
  return self->_observerCount;
}

- (void)setObserverCount:(unint64_t)a3
{
  self->_observerCount = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_biomeSink, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

- (void)initWithStreamIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Unable to subscribe to BiomeStream due to error: %@", (uint8_t *)&v2, 0xCu);
}

void __44__SearchUIBiomeStreamSubscriber_latestEvent__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) streamIdentifier];
  uint64_t v4 = [a2 error];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1E45B5000, v5, v6, "Fetching last event from BiomeStream (%@) failed with error: %@", v7, v8, v9, v10, v11);
}

void __42__SearchUIBiomeStreamSubscriber_setupSink__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v3 = [a1 streamIdentifier];
  uint64_t v4 = [a2 error];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1E45B5000, v5, v6, "Subscription to BiomeStream (%@) failed with error: %@", v7, v8, v9, v10, v11);
}

@end