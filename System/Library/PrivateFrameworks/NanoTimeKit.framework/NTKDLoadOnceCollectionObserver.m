@interface NTKDLoadOnceCollectionObserver
- (NTKDLoadOnceCollectionObserver)initWithCollection:(id)a3;
- (void)faceCollectionDidLoad:(id)a3;
- (void)performOnLoad:(id)a3;
@end

@implementation NTKDLoadOnceCollectionObserver

- (NTKDLoadOnceCollectionObserver)initWithCollection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKDLoadOnceCollectionObserver;
  v6 = [(NTKDLoadOnceCollectionObserver *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.nanotimekit.collections.loadonce", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v6->_hasLoaded = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    handlers = v6->_handlers;
    v6->_handlers = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v6->_collection, a3);
    [(NTKFaceCollection *)v6->_collection addObserver:v6];
  }

  return v6;
}

- (void)performOnLoad:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    collection = self->_collection;
    *(_DWORD *)buf = 138412290;
    objc_super v13 = collection;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "LoadOnce: Collection %@ got work to do…", buf, 0xCu);
  }

  if (v4)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__NTKDLoadOnceCollectionObserver_performOnLoad___block_invoke;
    v10[3] = &unk_1E62C2290;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(queue, v10);
  }
  else
  {
    dispatch_queue_t v8 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_collection;
      *(_DWORD *)buf = 138412290;
      objc_super v13 = v9;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "LoadOnce: No work provided for %@.", buf, 0xCu);
    }
  }
}

void __48__NTKDLoadOnceCollectionObserver_performOnLoad___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
  v3 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "LoadOnce: Already loaded %@.", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "LoadOnce: Load pending for %@.", (uint8_t *)&v10, 0xCu);
    }

    v7 = *(const void **)(a1 + 40);
    dispatch_queue_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
    v9 = _Block_copy(v7);
    [v8 addObject:v9];
  }
}

- (void)faceCollectionDidLoad:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "LoadOnce: Collection loaded %@!", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NTKDLoadOnceCollectionObserver_faceCollectionDidLoad___block_invoke;
  v8[3] = &unk_1E62C09C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __56__NTKDLoadOnceCollectionObserver_faceCollectionDidLoad___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  v3 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = [v2 count];
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "LoadOnce: Collection %@ invoking %lu handlers!", buf, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end