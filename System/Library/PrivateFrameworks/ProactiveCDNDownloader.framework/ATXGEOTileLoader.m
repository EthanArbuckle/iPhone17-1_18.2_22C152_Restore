@interface ATXGEOTileLoader
- (ATXGEOTileLoader)init;
- (id)tileKeyListForLocation:(id)a3;
- (void)requestGEOTileDataForLocation:(id)a3 tileDataHandler:(id)a4;
- (void)requestGEOTileDataForLocation:(id)a3 tileLoader:(id)a4 tileDataHandler:(id)a5;
@end

@implementation ATXGEOTileLoader

- (ATXGEOTileLoader)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXGEOTileLoader;
  v2 = [(ATXGEOTileLoader *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)requestGEOTileDataForLocation:(id)a3 tileDataHandler:(id)a4
{
  uint64_t v6 = requestGEOTileDataForLocation_tileDataHandler__onceToken;
  id v7 = a4;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&requestGEOTileDataForLocation_tileDataHandler__onceToken, &__block_literal_global_0);
  }
  id v9 = [MEMORY[0x263F41C40] modernLoader];
  [(ATXGEOTileLoader *)self requestGEOTileDataForLocation:v8 tileLoader:v9 tileDataHandler:v7];
}

uint64_t __66__ATXGEOTileLoader_requestGEOTileDataForLocation_tileDataHandler___block_invoke()
{
  [MEMORY[0x263F41C40] setMemoryCacheCountLimit:0];
  v0 = (void *)MEMORY[0x263F41C40];

  return [v0 setMemoryCacheTotalCostLimit:0];
}

- (void)requestGEOTileDataForLocation:(id)a3 tileLoader:(id)a4 tileDataHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v19 = a4;
  id v18 = a5;
  id v8 = [(ATXGEOTileLoader *)self tileKeyListForLocation:a3];
  id v9 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
        dispatch_group_enter(v9);
        v15 = GEOTileLoaderClientIdentifier();
        callbackQueue = self->_callbackQueue;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke;
        v20[3] = &unk_264548018;
        id v22 = v18;
        v21 = v9;
        [v19 loadKey:v14 priority:2147483646 forClient:v15 options:3 reason:4 callbackQ:callbackQueue beginNetwork:0 callback:v20];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  [MEMORY[0x263F61E38] waitForGroup:v9 timeoutSeconds:&__block_literal_global_15 onGroupComplete:&__block_literal_global_18 onTimeout:1.0];
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v10)
  {
    uint64_t v12 = __atxlog_handle_hero();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_cold_2((uint64_t)v10, v12);
    }
  }
  uint64_t v13 = __atxlog_handle_hero();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_cold_1(v13);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_13()
{
  v0 = __atxlog_handle_hero();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21FF54000, v0, OS_LOG_TYPE_DEFAULT, "GEO: tile download finished", v1, 2u);
  }
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_16()
{
  v0 = __atxlog_handle_hero();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_16_cold_1(v0);
  }
}

- (id)tileKeyListForLocation:(id)a3
{
  id v3 = a3;
  [v3 coordinate];
  unint64_t v5 = v4;
  [v3 coordinate];
  unint64_t v7 = v6;

  v8.n128_u64[0] = v5;
  v9.n128_u64[0] = v7;

  return (id)MEMORY[0x270F301C0](v8, v9);
}

- (void).cxx_destruct
{
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21FF54000, log, OS_LOG_TYPE_DEBUG, "GEO: Processing tile...", v1, 2u);
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FF54000, a2, OS_LOG_TYPE_ERROR, "GEO: Encountered error %@", (uint8_t *)&v2, 0xCu);
}

void __77__ATXGEOTileLoader_requestGEOTileDataForLocation_tileLoader_tileDataHandler___block_invoke_16_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FF54000, log, OS_LOG_TYPE_ERROR, "GEO: tile download timed out", v1, 2u);
}

@end