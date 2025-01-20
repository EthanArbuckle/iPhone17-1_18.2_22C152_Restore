@interface WFFPItemResolver
- (FPItemCollection)collection;
- (NSMutableArray)mutableComponents;
- (OS_dispatch_queue)queue;
- (WFFPItemResolver)initWithDomainID:(id)a3 relativeSubpath:(id)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (void)collectionDidFinishGathering:(id)a3;
- (void)determineNextItemIfPossible;
- (void)setCollection:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setMutableComponents:(id)a3;
- (void)startObservingFolderItemCollection:(id)a3;
@end

@implementation WFFPItemResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mutableComponents, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setMutableComponents:(id)a3
{
}

- (NSMutableArray)mutableComponents
{
  return self->_mutableComponents;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCollection:(id)a3
{
}

- (FPItemCollection)collection
{
  return self->_collection;
}

- (void)startObservingFolderItemCollection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFFilesLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFFPItemResolver startObservingFolderItemCollection:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Observing new item: %@", buf, 0x16u);
  }

  v6 = [(WFFPItemResolver *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__WFFPItemResolver_startObservingFolderItemCollection___block_invoke;
  v8[3] = &unk_1E6558938;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __55__WFFPItemResolver_startObservingFolderItemCollection___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) collection];
  int v3 = [v2 observing];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) collection];
    [v4 stopObserving];
  }
  v5 = [MEMORY[0x1E4F25D38] defaultManager];
  v6 = [v5 collectionForFolderItem:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCollection:v6];

  id v7 = *(void **)(a1 + 32);
  v8 = [v7 collection];
  [v8 setDelegate:v7];

  id v9 = [*(id *)(a1 + 32) queue];
  v10 = [*(id *)(a1 + 32) collection];
  [v10 setWorkingQueue:v9];

  id v11 = [*(id *)(a1 + 32) collection];
  [v11 startObserving];
}

- (void)determineNextItemIfPossible
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v3 = getWFFilesLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(WFFPItemResolver *)self mutableComponents];
    *(_DWORD *)buf = 136315394;
    v20 = "-[WFFPItemResolver determineNextItemIfPossible]";
    __int16 v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s Determining next item with mutable components: %@", buf, 0x16u);
  }
  v5 = [(WFFPItemResolver *)self mutableComponents];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(WFFPItemResolver *)self mutableComponents];
    v8 = [v7 firstObject];

    id v9 = [(WFFPItemResolver *)self mutableComponents];
    [v9 removeObjectAtIndex:0];

    v10 = [(WFFPItemResolver *)self mutableComponents];
    uint64_t v11 = [v10 count];

    __int16 v12 = [(WFFPItemResolver *)self collection];
    id v13 = [v12 items];
    if (v11)
    {
      uint64_t v14 = v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v15 = __47__WFFPItemResolver_determineNextItemIfPossible__block_invoke_2;
    }
    else
    {
      uint64_t v14 = v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v15 = __47__WFFPItemResolver_determineNextItemIfPossible__block_invoke;
    }
    v14[2] = v15;
    v14[3] = &unk_1E654FA90;
    v14[4] = v8;
    v14[5] = self;
    id v16 = v8;
    [v13 enumerateObjectsUsingBlock:v14];
  }
  else
  {
    id v16 = [(WFFPItemResolver *)self completionHandler];
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
  }
}

void __47__WFFPItemResolver_determineNextItemIfPossible__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 filename];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    v8 = [*(id *)(a1 + 40) completionHandler];
    ((void (**)(void, id, void))v8)[2](v8, v9, 0);

    *a4 = 1;
  }
}

void __47__WFFPItemResolver_determineNextItemIfPossible__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 filename];
  if ([v6 isEqualToString:*(void *)(a1 + 32)])
  {
    int v7 = [v9 isFolder];

    v8 = v9;
    if (v7)
    {
      [*(id *)(a1 + 40) startObservingFolderItemCollection:v9];
      v8 = v9;
      *a4 = 1;
    }
  }
  else
  {

    v8 = v9;
  }
}

- (void)collectionDidFinishGathering:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFFilesLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 items];
    int v7 = 136315394;
    v8 = "-[WFFPItemResolver collectionDidFinishGathering:]";
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Collection Finished gathering with items: %@", (uint8_t *)&v7, 0x16u);
  }
  [(WFFPItemResolver *)self determineNextItemIfPossible];
}

- (WFFPItemResolver)initWithDomainID:(id)a3 relativeSubpath:(id)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"WFFPItemResolver.m", 27, @"Invalid parameter not satisfying: %@", @"domainID" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"WFFPItemResolver.m", 28, @"Invalid parameter not satisfying: %@", @"relativeSubpath" object file lineNumber description];

LABEL_3:
  __int16 v12 = [(WFFPItemResolver *)self init];
  if (v12)
  {
    id v36 = 0;
    id v13 = [MEMORY[0x1E4F25D68] providerDomainWithID:v9 error:&v36];
    id v14 = v36;
    if (v13)
    {
      v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);

      dispatch_queue_t v17 = dispatch_queue_create("com.apple.shortcuts.WFFPItemResolver", v16);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v17;

      v19 = [v10 componentsSeparatedByString:@"/"];
      v20 = (void *)[v19 mutableCopy];

      uint64_t v21 = [v11 copy];
      id completionHandler = v12->_completionHandler;
      v12->_id completionHandler = (id)v21;

      if (([v10 isEqualToString:@"/"] & 1) != 0
        || ([v10 isEqualToString:&stru_1F229A4D8] & 1) != 0
        || [v20 count] == 1)
      {
        uint64_t v23 = [MEMORY[0x1E4F25D38] defaultManager];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __71__WFFPItemResolver_initWithDomainID_relativeSubpath_completionHandler___block_invoke;
        v34[3] = &unk_1E654FA68;
        v24 = (id *)&v35;
        v35 = v12;
        [v23 fetchRootItemForProviderDomain:v13 completionHandler:v34];
      }
      else
      {
        [v20 removeObjectAtIndex:0];
        objc_storeStrong((id *)&v12->_mutableComponents, v20);
        v27 = [MEMORY[0x1E4F25D38] defaultManager];
        uint64_t v28 = [v27 rootCollectionForProviderDomain:v13];
        collection = v12->_collection;
        v12->_collection = (FPItemCollection *)v28;

        [(FPItemCollection *)v12->_collection setDelegate:v12];
        [(FPItemCollection *)v12->_collection setWorkingQueue:v12->_queue];
        uint64_t v23 = [(WFFPItemResolver *)v12 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__WFFPItemResolver_initWithDomainID_relativeSubpath_completionHandler___block_invoke_2;
        block[3] = &unk_1E6558B28;
        v24 = (id *)&v33;
        v33 = v12;
        dispatch_async(v23, block);
      }

      v25 = v12;
    }
    else
    {
      id v16 = getWFFilesLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[WFFPItemResolver initWithDomainID:relativeSubpath:completionHandler:]";
        __int16 v39 = 2112;
        id v40 = v14;
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s Could not get provider domain with error: %@", buf, 0x16u);
      }
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __71__WFFPItemResolver_initWithDomainID_relativeSubpath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  int v7 = [v4 completionHandler];
  v7[2](v7, v6, v5);
}

uint64_t __71__WFFPItemResolver_initWithDomainID_relativeSubpath_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) startObserving];
}

@end