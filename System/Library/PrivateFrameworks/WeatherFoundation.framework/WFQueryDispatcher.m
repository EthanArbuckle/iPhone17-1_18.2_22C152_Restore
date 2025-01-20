@interface WFQueryDispatcher
- (NSMutableDictionary)queriesPendingResponse;
- (OS_dispatch_queue)queue;
- (WFQueryDispatcher)init;
- (void)cancelTaskWithIdentifier:(id)a3;
- (void)dispatchQuery:(id)a3;
- (void)fetchFavoriteLocationsWithTaskIdentifier:(id)a3 results:(id)a4;
- (void)invalidateCacheWithIdentifier:(id)a3;
- (void)locationForCoordinate:(CLLocationCoordinate2D)a3 taskIdentifier:(id)a4 results:(id)a5;
- (void)locationForSearchCompletion:(id)a3 taskIdentifier:(id)a4 results:(id)a5;
- (void)locationForString:(id)a3 taskIdentifier:(id)a4 results:(id)a5;
- (void)removePendingQueryWithIdentifier:(id)a3;
- (void)setQueriesPendingResponse:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation WFQueryDispatcher

- (WFQueryDispatcher)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFQueryDispatcher;
  v2 = [(WFQueryDispatcher *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("LocationQueryDispatchQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    queriesPendingResponse = v2->_queriesPendingResponse;
    v2->_queriesPendingResponse = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dispatchQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];

  if (v5)
  {
    v6 = [(WFQueryDispatcher *)self queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__WFQueryDispatcher_dispatchQuery___block_invoke;
    v8[3] = &unk_264431680;
    v9 = v4;
    v10 = self;
    dispatch_async(v6, v8);

    v7 = v9;
  }
  else
  {
    v7 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WFQueryDispatcher dispatchQuery:](v7);
    }
  }
}

uint64_t __35__WFQueryDispatcher_dispatchQuery___block_invoke(uint64_t a1)
{
  v2 = WFLogForCategory(3uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __35__WFQueryDispatcher_dispatchQuery___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) queriesPendingResponse];
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  [v4 setObject:v3 forKeyedSubscript:v5];

  return [*(id *)(a1 + 32) start];
}

- (void)removePendingQueryWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(WFQueryDispatcher *)self queue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__WFQueryDispatcher_removePendingQueryWithIdentifier___block_invoke;
    v7[3] = &unk_264431680;
    objc_super v8 = v4;
    v9 = self;
    dispatch_async(v5, v7);

    v6 = v8;
  }
  else
  {
    v6 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WFQueryDispatcher removePendingQueryWithIdentifier:](v6);
    }
  }
}

void __54__WFQueryDispatcher_removePendingQueryWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = WFLogForCategory(3uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__WFQueryDispatcher_removePendingQueryWithIdentifier___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) queriesPendingResponse];
  [v3 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)locationForCoordinate:(CLLocationCoordinate2D)a3 taskIdentifier:(id)a4 results:(id)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__WFQueryDispatcher_locationForCoordinate_taskIdentifier_results___block_invoke;
  v14[3] = &unk_2644321E0;
  id v15 = v9;
  id v16 = v10;
  v14[4] = self;
  id v11 = v9;
  id v12 = v10;
  v13 = +[WFLocationQueryGeocode queryWithCoordinate:resultHandler:](WFLocationQueryGeocode, "queryWithCoordinate:resultHandler:", v14, latitude, longitude);
  [v13 setIdentifier:v11];
  [(WFQueryDispatcher *)self dispatchQuery:v13];
}

uint64_t __66__WFQueryDispatcher_locationForCoordinate_taskIdentifier_results___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  return [v3 removePendingQueryWithIdentifier:v4];
}

- (void)locationForString:(id)a3 taskIdentifier:(id)a4 results:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__WFQueryDispatcher_locationForString_taskIdentifier_results___block_invoke;
  v13[3] = &unk_2644321E0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  id v10 = v8;
  id v11 = v9;
  id v12 = +[WFLocationQueryGeocode queryWithSearchString:a3 resultHandler:v13];
  [v12 setIdentifier:v10];
  [(WFQueryDispatcher *)self dispatchQuery:v12];
}

uint64_t __62__WFQueryDispatcher_locationForString_taskIdentifier_results___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  return [v3 removePendingQueryWithIdentifier:v4];
}

- (void)locationForSearchCompletion:(id)a3 taskIdentifier:(id)a4 results:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__WFQueryDispatcher_locationForSearchCompletion_taskIdentifier_results___block_invoke;
  v13[3] = &unk_2644321E0;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  id v10 = v8;
  id v11 = v9;
  id v12 = +[WFLocationQueryGeocode queryWithSearchCompletion:a3 resultHandler:v13];
  [v12 setIdentifier:v10];
  [(WFQueryDispatcher *)self dispatchQuery:v12];
}

uint64_t __72__WFQueryDispatcher_locationForSearchCompletion_taskIdentifier_results___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  return [v3 removePendingQueryWithIdentifier:v4];
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFQueryDispatcher *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WFQueryDispatcher_cancelTaskWithIdentifier___block_invoke;
  v7[3] = &unk_264431680;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __46__WFQueryDispatcher_cancelTaskWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queriesPendingResponse];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  [v3 cancel];
}

- (void)invalidateCacheWithIdentifier:(id)a3
{
  id v3 = [(WFQueryDispatcher *)self queue];
  dispatch_sync(v3, &__block_literal_global_20);
}

uint64_t __51__WFQueryDispatcher_invalidateCacheWithIdentifier___block_invoke()
{
  return +[WFLocationQueryGeocode invalidateCaches];
}

- (void)fetchFavoriteLocationsWithTaskIdentifier:(id)a3 results:(id)a4
{
  id v10 = (void (**)(id, void *))a4;
  id v5 = a3;
  id v6 = [WFFavoriteLocationResponse alloc];
  v7 = [v5 UUID];

  id v8 = [(WFFavoriteLocationResponse *)v6 initWithIdentifier:v7 favorites:0];
  id v9 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 15);
  [(WFResponse *)v8 setError:v9];

  if (v10) {
    v10[2](v10, v8);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)queriesPendingResponse
{
  return self->_queriesPendingResponse;
}

- (void)setQueriesPendingResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queriesPendingResponse, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dispatchQuery:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Cannot dispatch query without identifier", v1, 2u);
}

void __35__WFQueryDispatcher_dispatchQuery___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [*(id *)(a1 + 32) identifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "Dispatching query %@", (uint8_t *)&v4, 0xCu);
}

- (void)removePendingQueryWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Received query response without identifier!", v1, 2u);
}

void __54__WFQueryDispatcher_removePendingQueryWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "Finishing completed query %@", (uint8_t *)&v3, 0xCu);
}

@end