@interface MXSpinTracerService
+ (id)sharedSpinTracerService;
- (BOOL)_updateService;
- (BOOL)diagnosticsAvailable;
- (BOOL)diagnosticsSupported;
- (BOOL)startService;
- (BOOL)stopService;
- (MXSpinTracerService)init;
- (NSMutableArray)spinTracerDataPaths;
- (NSMutableArray)unarchivedSpinTracerData;
- (OS_dispatch_queue)requestQueue;
- (OS_os_log)MXSpinTracerServiceLogHandle;
- (id)getDiagnosticsForClient:(id)a3 dateString:(id)a4;
- (void)_updateService;
- (void)setMXSpinTracerServiceLogHandle:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setSpinTracerDataPaths:(id)a3;
- (void)setUnarchivedSpinTracerData:(id)a3;
- (void)startService;
- (void)unarchiveSpinTracerDataForDateString:(id)a3;
@end

@implementation MXSpinTracerService

+ (id)sharedSpinTracerService
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__MXSpinTracerService_sharedSpinTracerService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSpinTracerService_onceToken != -1) {
    dispatch_once(&sharedSpinTracerService_onceToken, block);
  }
  v2 = (void *)sharedSpinTracerService_sharedSpinTracerService;
  return v2;
}

uint64_t __46__MXSpinTracerService_sharedSpinTracerService__block_invoke(uint64_t a1)
{
  sharedSpinTracerService_sharedSpinTracerService = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (MXSpinTracerService)init
{
  v11.receiver = self;
  v11.super_class = (Class)MXSpinTracerService;
  v2 = [(MXService *)&v11 initWithSourceID:4];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.metrickit.service.spintracer", (const char *)&unk_238876085);
    MXSpinTracerServiceLogHandle = v2->_MXSpinTracerServiceLogHandle;
    v2->_MXSpinTracerServiceLogHandle = (OS_os_log *)v3;

    if (!v2->_MXSpinTracerServiceLogHandle) {
      objc_storeStrong((id *)&v2->_MXSpinTracerServiceLogHandle, &_os_log_internal);
    }
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.metrickitd.service.spintracer.requestqueue", v5);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    spinTracerDataPaths = v2->_spinTracerDataPaths;
    v2->_spinTracerDataPaths = v8;
  }
  return v2;
}

- (BOOL)startService
{
  v8.receiver = self;
  v8.super_class = (Class)MXSpinTracerService;
  if (![(MXService *)&v8 startService]) {
    return [(MXService *)self isStarted];
  }
  MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
  if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23886F000, MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Starting spintracer service.", buf, 2u);
  }
  if ([(MXSpinTracerService *)self _updateService]) {
    return 1;
  }
  v5 = self->_MXSpinTracerServiceLogHandle;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MXSpinTracerService startService](v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)MXSpinTracerService;
  [(MXService *)&v6 stopService];
  return 0;
}

- (BOOL)stopService
{
  unarchivedSpinTracerData = self->_unarchivedSpinTracerData;
  self->_unarchivedSpinTracerData = 0;

  [(MXService *)self setCurrentClient:0];
  v7.receiver = self;
  v7.super_class = (Class)MXSpinTracerService;
  if ([(MXService *)&v7 stopService])
  {
    MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_23886F000, MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Stopping spintracer service.", v6, 2u);
    }
  }
  return ![(MXService *)self isStarted];
}

- (BOOL)_updateService
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_spinTracerDataPaths removeAllObjects];
  os_log_t v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = +[MXUtilities containerPath];
  v5 = [&unk_26EB8AA78 objectAtIndexedSubscript:4];
  objc_super v6 = [v4 stringByAppendingPathComponent:v5];
  objc_super v7 = [(MXService *)self currentClient];
  objc_super v8 = [v6 stringByAppendingPathComponent:v7];
  id v19 = 0;
  v9 = [v3 contentsOfDirectoryAtPath:v8 error:&v19];
  id v10 = v19;

  if (v10)
  {
    MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_ERROR)) {
      [(MXSpinTracerService *)(uint64_t)v10 _updateService];
    }
  }
  else
  {
    v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF BEGINSWITH[cd] 'diag-log-'"];
    v13 = [v9 filteredArrayUsingPredicate:v12];
    v14 = (NSMutableArray *)[v13 mutableCopy];
    spinTracerDataPaths = self->_spinTracerDataPaths;
    self->_spinTracerDataPaths = v14;

    v16 = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_spinTracerDataPaths;
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_23886F000, v16, OS_LOG_TYPE_DEFAULT, "Found log files: %@", buf, 0xCu);
    }
  }
  return v10 == 0;
}

- (void)unarchiveSpinTracerDataForDateString:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v40 = a3;
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF CONTAINS %@", v40];
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  unarchivedSpinTracerData = self->_unarchivedSpinTracerData;
  self->_unarchivedSpinTracerData = v5;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v37 = (void *)v4;
  id obj = [(NSMutableArray *)self->_spinTracerDataPaths filteredArrayUsingPredicate:v4];
  uint64_t v42 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v42; uint64_t i = v26 + 1)
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(obj);
        }
        objc_super v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v43 = i;
        MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
        if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v50 = (uint64_t)v8;
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v40;
          _os_log_impl(&dword_23886F000, MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Found log file: %@ for date: %@", buf, 0x16u);
        }
        id v10 = [MEMORY[0x263F08850] defaultManager];
        objc_super v11 = +[MXUtilities containerPath];
        v12 = [&unk_26EB8AA90 objectAtIndexedSubscript:4];
        v13 = [v11 stringByAppendingPathComponent:v12];
        v14 = [(MXService *)self currentClient];
        v15 = [v13 stringByAppendingPathComponent:v14];
        [v15 stringByAppendingPathComponent:v8];
        v17 = v16 = self;
        v18 = [v10 contentsAtPath:v17];

        if (v18)
        {
          id v19 = v16;
          v20 = (void *)MEMORY[0x263F08928];
          uint64_t v21 = objc_opt_class();
          id v44 = 0;
          uint64_t v22 = [v20 unarchivedObjectOfClass:v21 fromData:v18 error:&v44];
          id v23 = v44;
          if (v23)
          {
            self = v16;
            v24 = v16->_MXSpinTracerServiceLogHandle;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v50 = (uint64_t)v23;
              _os_log_error_impl(&dword_23886F000, v24, OS_LOG_TYPE_ERROR, "Failed to unarchive spin tracer data: %@", buf, 0xCu);
            }
          }
          else
          {
            v38 = v18;
            id v27 = objc_alloc_init(MEMORY[0x263F08790]);
            v28 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
            objc_msgSend(v27, "setLocale:");
            [v27 setDateFormat:@"yyyy-MM-dd"];
            v29 = [v22 datestamp];
            v30 = [v27 stringFromDate:v29];

            self = v19;
            if ([v40 isEqualToString:v30]
              && (uint64_t v31 = [v22 sourceID], v31 == -[MXService sourceID](v19, "sourceID")))
            {
              v32 = v19->_MXSpinTracerServiceLogHandle;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_23886F000, v32, OS_LOG_TYPE_DEFAULT, "Log file consistent, adding client data.", buf, 2u);
              }
              [(NSMutableArray *)v19->_unarchivedSpinTracerData addObject:v22];
            }
            else
            {
              v33 = v19->_MXSpinTracerServiceLogHandle;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v34 = v33;
                uint64_t v35 = [v22 sourceID];
                uint64_t v36 = [(MXService *)v19 sourceID];
                *(_DWORD *)buf = 134218754;
                uint64_t v50 = v35;
                self = v19;
                __int16 v51 = 2048;
                uint64_t v52 = v36;
                __int16 v53 = 2112;
                v54 = v30;
                __int16 v55 = 2112;
                id v56 = v40;
                _os_log_error_impl(&dword_23886F000, v34, OS_LOG_TYPE_ERROR, "Bad source type: (%ld, expected %ld) or date string: (%@, expected %@)", buf, 0x2Au);
              }
            }

            v18 = v38;
          }

          uint64_t v26 = v43;
        }
        else
        {
          v25 = v16->_MXSpinTracerServiceLogHandle;
          self = v16;
          uint64_t v26 = v43;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = (uint64_t)v8;
            _os_log_debug_impl(&dword_23886F000, v25, OS_LOG_TYPE_DEBUG, "Failed to read spin tracer data contents: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v42);
  }
}

- (id)getDiagnosticsForClient:(id)a3 dateString:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_unarchivedSpinTracerData)
  {
    MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23886F000, MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Unarchived spin tracer data not yet set, running unarchive.", buf, 2u);
    }
    [(MXSpinTracerService *)self unarchiveSpinTracerDataForDateString:v7];
  }
  v30 = v7;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = self->_unarchivedSpinTracerData;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v16 = [v15 metrics];
        v17 = [v16 objectForKey:v6];

        if (v17)
        {
          v18 = [v15 metrics];
          id v19 = [v18 objectForKey:v6];
          [v9 addObject:v19];
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    v20 = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v6;
      _os_log_impl(&dword_23886F000, v20, OS_LOG_TYPE_DEFAULT, "Found spin tracer diagnostics for client: %@", buf, 0xCu);
    }
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = [(MXService *)self pruneSourceData:*(void *)(*((void *)&v31 + 1) + 8 * j)];
          if (v27) {
            [v21 addObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v24);
    }

    v28 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v21];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)diagnosticsAvailable
{
  return 1;
}

- (BOOL)diagnosticsSupported
{
  return 1;
}

- (NSMutableArray)spinTracerDataPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSpinTracerDataPaths:(id)a3
{
}

- (NSMutableArray)unarchivedSpinTracerData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnarchivedSpinTracerData:(id)a3
{
}

- (OS_os_log)MXSpinTracerServiceLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMXSpinTracerServiceLogHandle:(id)a3
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
  objc_storeStrong((id *)&self->_MXSpinTracerServiceLogHandle, 0);
  objc_storeStrong((id *)&self->_unarchivedSpinTracerData, 0);
  objc_storeStrong((id *)&self->_spinTracerDataPaths, 0);
}

- (void)startService
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23886F000, log, OS_LOG_TYPE_ERROR, "Failed to start spintracer service.", v1, 2u);
}

- (void)_updateService
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23886F000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain log paths with error: %@", (uint8_t *)&v2, 0xCu);
}

@end