@interface RMDummyDataManager
- (BOOL)isReceivingRelatveData;
- (OS_dispatch_queue)queue;
- (RMConnectionClient)connectionClient;
- (RMDummyDataManager)initWithQueue:(id)a3;
- (id)dummyDataConfiguration;
- (id)relativeDataCallback;
- (void)invalidate;
- (void)setConnectionClient:(id)a3;
- (void)setIsReceivingRelatveData:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRelativeDataCallback:(id)a3;
- (void)startReceivingDummyDataUpdates:(id)a3;
- (void)stopReceivingDummyDataUpdates;
@end

@implementation RMDummyDataManager

- (RMDummyDataManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMDummyDataManager;
  v5 = [(RMDummyDataManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(RMDummyDataManager *)v5 setQueue:v4];
    v7 = -[RMConnectionClient initWithQueue:serviceName:messageHandler:]((id *)[RMConnectionClient alloc], v4, @"com.apple.relatived.tempest", &__block_literal_global_5);
    [(RMDummyDataManager *)v6 setConnectionClient:v7];
  }
  return v6;
}

- (void)invalidate
{
  v3 = [(RMDummyDataManager *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(RMDummyDataManager *)self isReceivingRelatveData]) {
    [(RMDummyDataManager *)self stopReceivingDummyDataUpdates];
  }
  id v4 = [(RMDummyDataManager *)self connectionClient];
  -[RMConnectionClient invalidate]((uint64_t)v4);

  [(RMDummyDataManager *)self setConnectionClient:0];
  [(RMDummyDataManager *)self setRelativeDataCallback:0];
}

- (id)dummyDataConfiguration
{
  id v7 = 0;
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:&unk_26E9B06D0 requiringSecureCoding:1 error:&v7];
  id v3 = v7;
  if (!v2)
  {
    if (onceToken_TempestDataManager_Default != -1) {
      dispatch_once(&onceToken_TempestDataManager_Default, &__block_literal_global_64);
    }
    id v4 = logObject_TempestDataManager_Default;
    if (os_log_type_enabled((os_log_t)logObject_TempestDataManager_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23673D000, v4, OS_LOG_TYPE_ERROR, "failed to archive configurations\n", v6, 2u);
    }
  }

  return v2;
}

- (void)startReceivingDummyDataUpdates:(id)a3
{
  id v4 = a3;
  v5 = [(RMDummyDataManager *)self queue];
  dispatch_assert_queue_V2(v5);

  [(RMDummyDataManager *)self setRelativeDataCallback:v4];
  v6 = [(RMDummyDataManager *)self connectionClient];
  -[RMConnectionClient connect]((uint64_t)v6);

  id v7 = [(RMDummyDataManager *)self connectionClient];
  v8 = [(RMDummyDataManager *)self dummyDataConfiguration];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke;
  v9[3] = &unk_264CACAC8;
  v9[4] = self;
  -[RMConnectionClient requestStreamingWithMessage:data:callback:]((uint64_t)v7, @"kRMStartStreamingDummyData", v8, v9);
}

void __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) relativeDataCallback];
    ((void (**)(void, void, id))v7)[2](v7, 0, v6);
  }
  else
  {
    v8 = (long long *)[v5 bytes];
    objc_super v9 = [RMDummyData alloc];
    long long v10 = *v8;
    long long v11 = v8[1];
    long long v12 = v8[3];
    v16[2] = v8[2];
    v16[3] = v12;
    v16[0] = v10;
    v16[1] = v11;
    v13 = [(RMDummyData *)v9 initWithPayload:v16];
    v14 = [*(id *)(a1 + 32) relativeDataCallback];

    if (!v14) {
      __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke_cold_1();
    }
    v15 = [*(id *)(a1 + 32) relativeDataCallback];
    ((void (**)(void, RMDummyData *, void))v15)[2](v15, v13, 0);
  }
}

- (void)stopReceivingDummyDataUpdates
{
  id v3 = [(RMDummyDataManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(RMDummyDataManager *)self connectionClient];
  -[RMConnectionClient stopStreaming]((uint64_t)v4);

  [(RMDummyDataManager *)self setIsReceivingRelatveData:0];
  [(RMDummyDataManager *)self setRelativeDataCallback:0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isReceivingRelatveData
{
  return self->_isReceivingRelatveData;
}

- (void)setIsReceivingRelatveData:(BOOL)a3
{
  self->_isReceivingRelatveData = a3;
}

- (id)relativeDataCallback
{
  return self->_relativeDataCallback;
}

- (void)setRelativeDataCallback:(id)a3
{
}

- (RMConnectionClient)connectionClient
{
  return self->_connectionClient;
}

- (void)setConnectionClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionClient, 0);
  objc_storeStrong(&self->_relativeDataCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = _CLLogObjectForCategory_ConnectionClient_Default_0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    _os_log_impl(&dword_23673D000, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Streamed data received while no callback was in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  v1 = _CLLogObjectForCategory_ConnectionClient_Default_0();
  if (os_signpost_enabled(v1))
  {
    OUTLINED_FUNCTION_0();
    _os_signpost_emit_with_name_impl(&dword_23673D000, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Streamed data received while no callback was in place", "{\"msg%{public}.0s\":\"Streamed data received while no callback was in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  v2 = _CLLogObjectForCategory_ConnectionClient_Default_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    _os_log_impl(&dword_23673D000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Streamed data received while no callback was in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  abort_report_np();
  return AnalyticsSendEventLazy();
}

@end