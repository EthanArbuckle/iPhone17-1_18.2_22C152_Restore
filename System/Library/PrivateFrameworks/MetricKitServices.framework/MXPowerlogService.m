@interface MXPowerlogService
+ (id)sharedPowerlogService;
- (BOOL)_updateService;
- (BOOL)metricsAvailable;
- (BOOL)metricsSupported;
- (BOOL)startService;
- (BOOL)stopService;
- (MXPowerlogService)init;
- (NSMutableArray)powerlogDataPaths;
- (NSMutableArray)unarchivedPowerlogData;
- (OS_dispatch_queue)requestQueue;
- (OS_os_log)MXPowerLogServiceLogHandle;
- (id)getMetricsForClient:(id)a3;
- (void)setMXPowerLogServiceLogHandle:(id)a3;
- (void)setPowerlogDataPaths:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setUnarchivedPowerlogData:(id)a3;
- (void)startService;
- (void)unarchivePowerlogData;
@end

@implementation MXPowerlogService

+ (id)sharedPowerlogService
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__MXPowerlogService_sharedPowerlogService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPowerlogService_onceToken != -1) {
    dispatch_once(&sharedPowerlogService_onceToken, block);
  }
  v2 = (void *)sharedPowerlogService_sharedPowerlogService;
  return v2;
}

uint64_t __42__MXPowerlogService_sharedPowerlogService__block_invoke(uint64_t a1)
{
  sharedPowerlogService_sharedPowerlogService = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (MXPowerlogService)init
{
  v11.receiver = self;
  v11.super_class = (Class)MXPowerlogService;
  v2 = [(MXService *)&v11 initWithSourceID:2];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.metrickit.service.powerlog", (const char *)&unk_238876085);
    MXPowerLogServiceLogHandle = v2->_MXPowerLogServiceLogHandle;
    v2->_MXPowerLogServiceLogHandle = (OS_os_log *)v3;

    if (!v2->_MXPowerLogServiceLogHandle) {
      objc_storeStrong((id *)&v2->_MXPowerLogServiceLogHandle, &_os_log_internal);
    }
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.metrickitd.service.powerlog.requestqueue", v5);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    powerlogDataPaths = v2->_powerlogDataPaths;
    v2->_powerlogDataPaths = v8;
  }
  return v2;
}

- (BOOL)startService
{
  v8.receiver = self;
  v8.super_class = (Class)MXPowerlogService;
  if (![(MXService *)&v8 startService]) {
    return [(MXService *)self isStarted];
  }
  MXPowerLogServiceLogHandle = self->_MXPowerLogServiceLogHandle;
  if (os_log_type_enabled(MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23886F000, MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Starting powerlog service.", buf, 2u);
  }
  if ([(MXPowerlogService *)self _updateService]) {
    return 1;
  }
  v5 = self->_MXPowerLogServiceLogHandle;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MXPowerlogService startService](v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)MXPowerlogService;
  [(MXService *)&v6 stopService];
  return 0;
}

- (BOOL)stopService
{
  unarchivedPowerlogData = self->_unarchivedPowerlogData;
  self->_unarchivedPowerlogData = 0;

  v7.receiver = self;
  v7.super_class = (Class)MXPowerlogService;
  if ([(MXService *)&v7 stopService])
  {
    MXPowerLogServiceLogHandle = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_23886F000, MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Stopping powerlog service.", v6, 2u);
    }
  }
  return ![(MXService *)self isStarted];
}

- (BOOL)_updateService
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_powerlogDataPaths removeAllObjects];
  os_log_t v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = +[MXUtilities containerPath];
  v5 = [&unk_26EB8AAF0 objectAtIndexedSubscript:2];
  objc_super v6 = [v4 stringByAppendingPathComponent:v5];
  id v17 = 0;
  objc_super v7 = [v3 contentsOfDirectoryAtPath:v6 error:&v17];
  id v8 = v17;

  if (v8)
  {
    MXPowerLogServiceLogHandle = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(MXPowerLogServiceLogHandle, OS_LOG_TYPE_ERROR)) {
      [(MXSpinTracerService *)(uint64_t)v8 _updateService];
    }
  }
  else
  {
    v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF BEGINSWITH[cd] 'log-'"];
    objc_super v11 = [v7 filteredArrayUsingPredicate:v10];
    v12 = (NSMutableArray *)[v11 mutableCopy];
    powerlogDataPaths = self->_powerlogDataPaths;
    self->_powerlogDataPaths = v12;

    v14 = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_powerlogDataPaths;
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_23886F000, v14, OS_LOG_TYPE_DEFAULT, "Found log files: %@", buf, 0xCu);
    }
  }
  return v8 == 0;
}

- (id)getMetricsForClient:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!self->_unarchivedPowerlogData)
  {
    MXPowerLogServiceLogHandle = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23886F000, MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Unarchived powerlog data not yet set, running unarchive.", buf, 2u);
    }
    [(MXPowerlogService *)self unarchivePowerlogData];
  }
  id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  v24 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  objc_msgSend(v6, "setLocale:");
  v25 = v6;
  [v6 setDateFormat:@"yyyy-MM-dd"];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  objc_super v7 = self->_unarchivedPowerlogData;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v13 = [v12 metrics];
        v14 = [v13 objectForKey:v4];

        if (v14)
        {
          v15 = [v12 datestamp];
          v16 = [v25 stringFromDate:v15];

          id v17 = [v12 metrics];
          v18 = [v17 objectForKey:v4];
          [(MXService *)self pruneSourceData:v18];
          uint64_t v20 = v19 = self;
          [v26 setObject:v20 forKeyedSubscript:v16];

          self = v19;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v9);
  }

  if ([v26 count])
  {
    id v21 = v26;
  }
  else
  {
    v22 = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v4;
      _os_log_impl(&dword_23886F000, v22, OS_LOG_TYPE_DEFAULT, "No data for client: %@", buf, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

- (void)unarchivePowerlogData
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_23886F000, log, OS_LOG_TYPE_DEBUG, "Log file consistent, assigning client data.", buf, 2u);
}

- (BOOL)metricsAvailable
{
  return [(MXService *)self isStarted] && [(NSMutableArray *)self->_powerlogDataPaths count];
}

- (BOOL)metricsSupported
{
  return 1;
}

- (NSMutableArray)powerlogDataPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPowerlogDataPaths:(id)a3
{
}

- (NSMutableArray)unarchivedPowerlogData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnarchivedPowerlogData:(id)a3
{
}

- (OS_os_log)MXPowerLogServiceLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMXPowerLogServiceLogHandle:(id)a3
{
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_MXPowerLogServiceLogHandle, 0);
  objc_storeStrong((id *)&self->_unarchivedPowerlogData, 0);
  objc_storeStrong((id *)&self->_powerlogDataPaths, 0);
}

- (void)startService
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23886F000, log, OS_LOG_TYPE_ERROR, "Failed to start powerlog service.", v1, 2u);
}

@end