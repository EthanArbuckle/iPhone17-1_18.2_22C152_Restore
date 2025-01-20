@interface PFMetadataStateHandler
+ (id)redactedDescriptionForFileURL:(id)a3;
+ (id)redactedDescriptionForPath:(id)a3;
- (PFMetadataStateHandler)initWithMetadata:(id)a3;
- (id)_stateInformation;
- (id)className;
- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3;
- (void)_addBreadcrumbWithTimeInterval:(double)a3 message:(id)a4;
- (void)addBreadcrumb:(id)a3;
- (void)dealloc;
@end

@implementation PFMetadataStateHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_addBreadcrumbWithTimeInterval:(double)a3 message:(id)a4
{
  id v6 = a4;
  v7 = [[PFMetadataStateBreadcrumb alloc] initWithTimeInterval:v6 message:a3];

  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PFMetadataStateHandler__addBreadcrumbWithTimeInterval_message___block_invoke;
  v10[3] = &unk_1E5B2F668;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_sync(queue, v10);
}

uint64_t __65__PFMetadataStateHandler__addBreadcrumbWithTimeInterval_message___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)addBreadcrumb:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v15];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[PFMetadataStateHandler _addBreadcrumbWithTimeInterval:message:](self, "_addBreadcrumbWithTimeInterval:message:", v6);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v7 = [(PFMetadataStateHandler *)self className];
    *(_DWORD *)buf = 138412802;
    v9 = v7;
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@ %p: Add breadcrumb: %@", buf, 0x20u);
  }
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3->var2 != 3) {
    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v18 = [(PFMetadataStateHandler *)self className];
    v19 = [(PFMetadataStateHandler *)self className];
    metadata = self->_metadata;
    *(_DWORD *)buf = 138413058;
    id v23 = v18;
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v19;
    __int16 v28 = 2048;
    v29 = metadata;
    _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@ %p: Generating state data for %@: %p", buf, 0x2Au);
  }
  v4 = (void *)MEMORY[0x1E4F28F98];
  id v5 = [(PFMetadataStateHandler *)self _stateInformation];
  id v21 = 0;
  id v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v21];
  id v7 = v21;

  if (v6)
  {
    unsigned int v8 = [v6 length];
    uint64_t v9 = v8;
    size_t v10 = v8 + 200;
    v11 = (os_state_data_s *)malloc_type_malloc(v10, 0x4FB9849BuLL);
    __int16 v12 = v11;
    if (v11)
    {
      bzero(v11, v10);
      v12->var0 = 1;
      v12->var1.var1 = v8;
      v13 = NSString;
      uint64_t v14 = [(PFMetadataStateHandler *)self className];
      uint64_t v15 = [v13 stringWithFormat:@"State for <%@: %p>", v14, self->_metadata];

      id v16 = v15;
      [v16 UTF8String];
      __strlcpy_chk();
      [v6 getBytes:v12->var4 length:v9];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v7;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to gather process state information: %@", buf, 0xCu);
    }
    __int16 v12 = 0;
  }

  return v12;
}

- (id)_stateInformation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_breadcrumbs;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "breadcrumbDescription", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  id v16 = @"breadcrumbs";
  v17 = v3;
  size_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  return v10;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v3 = [(PFMetadataStateHandler *)self className];
    unint64_t stateHandle = self->_stateHandle;
    *(_DWORD *)buf = 138412802;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = stateHandle;
    _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@ %p: Removing state handler: %llu", buf, 0x20u);
  }
  if (self->_stateHandle) {
    os_state_remove_handler();
  }
  v5.receiver = self;
  v5.super_class = (Class)PFMetadataStateHandler;
  [(PFMetadataStateHandler *)&v5 dealloc];
}

- (PFMetadataStateHandler)initWithMetadata:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = (PFMetadataMovie *)a3;
  v24.receiver = self;
  v24.super_class = (Class)PFMetadataStateHandler;
  objc_super v5 = [(PFMetadataStateHandler *)&v24 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_metadata = v4;
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photos.PFMetadata.stateHandleQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_initWeak(&location, v6);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v22, &location);
    v6->_unint64_t stateHandle = os_state_add_handler();
    __int16 v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    breadcrumbs = v6->_breadcrumbs;
    v6->_breadcrumbs = v10;

    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = [(PFMetadataStateHandler *)v6 className];
      unint64_t stateHandle = v6->_stateHandle;
      uint64_t v19 = [(PFMetadataStateHandler *)v6 className];
      metadata = v6->_metadata;
      *(_DWORD *)buf = 138413314;
      __int16 v26 = v17;
      __int16 v27 = 2048;
      __int16 v28 = v6;
      __int16 v29 = 2048;
      unint64_t v30 = stateHandle;
      __int16 v31 = 2112;
      v32 = v19;
      __int16 v33 = 2048;
      v34 = metadata;
      _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@ %p: Added state handler: %llu for %@: %p", buf, 0x34u);
    }
    long long v14 = [(PFMetadataStateHandler *)v6 className];
    [(PFMetadataStateHandler *)v6 addBreadcrumb:@"Created %@ %p", v14, v6, v21, 3221225472, __43__PFMetadataStateHandler_initWithMetadata___block_invoke, &unk_1E5B2E220];

    long long v15 = v6;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __43__PFMetadataStateHandler_initWithMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = [WeakRetained stateDataWithHints:a2];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)className
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PFMetadataStateHandler_className__block_invoke;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  if (className_onceToken != -1) {
    dispatch_once(&className_onceToken, block);
  }
  return (id)className_name;
}

uint64_t __35__PFMetadataStateHandler_className__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  className_name = NSStringFromClass(v0);

  return MEMORY[0x1F41817F8]();
}

+ (id)redactedDescriptionForPath:(id)a3
{
  id v3 = a3;
  if (![v3 fileSystemRepresentation]
    || (memset(&v6, 0, sizeof(v6)),
        lstat((const char *)[v3 fileSystemRepresentation], &v6))
    || (objc_msgSend(NSString, "stringWithFormat:", @"fs=%d/file=%llu", v6.st_dev, v6.st_ino), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"hash=%lu", objc_msgSend(v3, "hash"));
  }

  return v4;
}

+ (id)redactedDescriptionForFileURL:(id)a3
{
  v4 = [a3 path];
  uint64_t v5 = [a1 redactedDescriptionForPath:v4];

  return v5;
}

@end