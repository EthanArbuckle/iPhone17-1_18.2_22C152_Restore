@interface THReflowablePaginationController
- (BOOL)navigationPageNode;
- (BOOL)paginationComplete;
- (BOOL)paginationInProgress;
- (BOOL)presentationTypeMatchesPageSize:(CGSize)a3;
- (NSMutableArray)observers;
- (NSMutableDictionary)paginationResults;
- (NSOperationQueue)loadQueue;
- (NSOperationQueue)paginationQueue;
- (THDocumentRoot)documentRoot;
- (THPresentationType)presentationType;
- (THPresentationType)sourcePresentationType;
- (THReflowablePaginationController)initWithDocumentRoot:(id)a3 sourcePresentationType:(id)a4 targetPresentationType:(id)a5 loadCache:(BOOL)a6 observer:(id)a7;
- (TSUPointerKeyDictionary)loadCompletions;
- (TSUPointerKeyDictionary)paginationCompletions;
- (double)paginationProgress;
- (id)loadOperationForContentNode:(id)a3 loadOperationCompletionDelegate:(id)a4 priority:(int64_t)a5;
- (id)p_queuePaginationOperationForContentNode:(id)a3 nodeBody:(id)a4 priority:(int64_t)a5 isForeground:(BOOL)a6;
- (id)paginateContentNode:(id)a3 paginationCompletionDelegate:(id)a4 priority:(int64_t)a5 isForeground:(BOOL)a6 activity:(id)a7;
- (id)paginationResultForContentNode:(id)a3;
- (unint64_t)numberOfContentNodes;
- (unint64_t)paginationCount;
- (void)assignContentNodes;
- (void)contentLoadOperation:(id)a3 loadedContentBodies:(id)a4;
- (void)contentLoadOperationFailed:(id)a3;
- (void)contentPaginationOperation:(id)a3 paginatedNodeBody:(id)a4 forPresentationType:(id)a5;
- (void)dealloc;
- (void)loadPaginationCache;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_updatePageNumbers;
- (void)p_updatePaginationInProgress;
- (void)paginate;
- (void)registerObserver:(id)a3;
- (void)savePaginationCache;
- (void)setDocumentRoot:(id)a3;
- (void)setLoadCompletions:(id)a3;
- (void)setLoadQueue:(id)a3;
- (void)setNumberOfContentNodes:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setPaginationCompletions:(id)a3;
- (void)setPaginationInProgress:(BOOL)a3;
- (void)setPaginationQueue:(id)a3;
- (void)setPaginationResults:(id)a3;
- (void)setPresentationType:(id)a3;
- (void)setSourcePresentationType:(id)a3;
- (void)stopPagination;
- (void)teardown;
- (void)unregisterObserver:(id)a3;
- (void)updatePaginationResult:(id)a3;
- (void)updatePaginationResult:(id)a3 presentationType:(id)a4;
- (void)willClose;
@end

@implementation THReflowablePaginationController

- (THReflowablePaginationController)initWithDocumentRoot:(id)a3 sourcePresentationType:(id)a4 targetPresentationType:(id)a5 loadCache:(BOOL)a6 observer:(id)a7
{
  BOOL v8 = a6;
  v17.receiver = self;
  v17.super_class = (Class)THReflowablePaginationController;
  v12 = [(THReflowablePaginationController *)&v17 init];
  if (v12)
  {
    v12->_documentRoot = (THDocumentRoot *)a3;
    v12->_sourcePresentationType = (THPresentationType *)a4;
    v12->_presentationType = (THPresentationType *)[a5 copyFixingSize];
    v12->_paginationResults = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v12->_paginationCompletions = (TSUPointerKeyDictionary *)objc_alloc_init((Class)TSUPointerKeyDictionary);
    v12->_loadCompletions = (TSUPointerKeyDictionary *)objc_alloc_init((Class)TSUPointerKeyDictionary);
    v13 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v12->_paginationQueue = v13;
    [(NSOperationQueue *)v13 setMaxConcurrentOperationCount:1];
    v14 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v12->_loadQueue = v14;
    [(NSOperationQueue *)v14 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v12->_paginationQueue addObserver:v12 forKeyPath:@"operationCount" options:0 context:0];
    [(NSOperationQueue *)v12->_loadQueue addObserver:v12 forKeyPath:@"operationCount" options:0 context:0];
    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v12->_observers = v15;
    [(NSMutableArray *)v15 addObject:a7];
    if (v8) {
      [(THReflowablePaginationController *)v12 loadPaginationCache];
    }
  }
  return v12;
}

- (void)teardown
{
  objc_sync_enter(self);

  self->_observers = 0;
  self->_documentRoot = 0;

  self->_sourcePresentationType = 0;
  self->_presentationType = 0;

  self->_paginationResults = 0;
  self->_paginationCompletions = 0;

  self->_loadCompletions = 0;
  [(NSOperationQueue *)self->_paginationQueue removeObserver:self forKeyPath:@"operationCount"];
  [(NSOperationQueue *)self->_paginationQueue cancelAllOperations];

  self->_paginationQueue = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSOperationQueue *)self->_loadQueue operations];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 delegate] == self) {
          [v7 setDelegate:0];
        }
      }
      id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  [(NSOperationQueue *)self->_loadQueue removeObserver:self forKeyPath:@"operationCount"];
  [(NSOperationQueue *)self->_loadQueue cancelAllOperations];

  self->_loadQueue = 0;
  objc_sync_exit(self);
}

- (void)dealloc
{
  [(THReflowablePaginationController *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)THReflowablePaginationController;
  [(THReflowablePaginationController *)&v3 dealloc];
}

- (unint64_t)numberOfContentNodes
{
  if (!self->_numberOfContentNodes)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    objc_super v3 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THReflowablePaginationController *)self documentRoot] navigationModel] navigationUnits];
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          self->_numberOfContentNodes += (unint64_t)objc_msgSend(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "contentNodes"), "count");
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  return self->_numberOfContentNodes;
}

- (void)willClose
{
}

- (void)stopPagination
{
  objc_sync_enter(self);
  [(NSOperationQueue *)[(THReflowablePaginationController *)self loadQueue] cancelAllOperations];
  [(NSOperationQueue *)[(THReflowablePaginationController *)self paginationQueue] cancelAllOperations];

  objc_sync_exit(self);
}

- (void)setPresentationType:(id)a3
{
  objc_sync_enter(self);
  if (![(THPresentationType *)self->_presentationType isEqualIncludingSize:a3])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_EA284;
    v5[3] = &unk_456E38;
    v5[4] = self;
    v5[5] = a3;
    _os_activity_initiate(&dword_0, "RPC Set presentation Type", OS_ACTIVITY_FLAG_DEFAULT, v5);
  }
  objc_sync_exit(self);
}

- (BOOL)presentationTypeMatchesPageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_sync_enter(self);
  if ([(THReflowablePaginationController *)self presentationType])
  {
    [(THPresentationType *)self->_presentationType pageSize];
    BOOL v8 = v7 == height && v6 == width;
  }
  else
  {
    BOOL v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (void)assignContentNodes
{
  objc_sync_enter(self);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v3 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THReflowablePaginationController *)self documentRoot] navigationModel] navigationUnits];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v6);
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        [v7 contentNodes];
        id v9 = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v13;
          do
          {
            long long v11 = 0;
            do
            {
              if (*(void *)v13 != v10) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) setReflowablePaginationController:self];
              long long v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
          }
          while (v9);
        }
        double v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }
  objc_sync_exit(self);
}

- (void)paginate
{
  objc_sync_enter(self);
  [(THReflowablePaginationController *)self setPaginationInProgress:1];
  objc_super v3 = _os_activity_create(&dword_0, "RPC Pagination", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_EA748;
  v4[3] = &unk_456E38;
  v4[4] = self;
  v4[5] = v3;
  os_activity_apply(v3, v4);

  objc_sync_exit(self);
}

- (void)setPaginationInProgress:(BOOL)a3
{
  if (self->_paginationInProgress != a3)
  {
    self->_paginationInProgress = a3;
    BOOL v4 = !a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_EA9A4;
    block[3] = &unk_458E48;
    block[4] = [(THPresentationType *)[(THReflowablePaginationController *)self presentationType] copyFixingSize];
    block[5] = self;
    BOOL v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)p_updatePaginationInProgress
{
  uint64_t v3 = [(THReflowablePaginationController *)self paginationComplete] ^ 1;

  [(THReflowablePaginationController *)self setPaginationInProgress:v3];
}

- (void)p_updatePageNumbers
{
  objc_sync_enter(self);
  if ([(THReflowablePaginationController *)self paginationComplete])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v3 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THReflowablePaginationController *)self documentRoot] navigationModel] navigationUnits];
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v4)
    {
      obj = v3;
      uint64_t v15 = *(void *)v22;
      uint64_t v5 = 1;
      do
      {
        BOOL v6 = 0;
        id v16 = v4;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(obj);
          }
          double v7 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v6);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v8 = [v7 contentNodes];
          id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v18;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(void *)v18 != v10) {
                  objc_enumerationMutation(v8);
                }
                long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
                id v13 = [(THReflowablePaginationController *)self paginationResultForContentNode:v12];
                [v12 setDisplayStartingPageNumber:v5 presentationType:[self presentationType]];
                [v13 setFirstPageIndex:v5 - 1];
                if (v13)
                {
                  objc_msgSend(v12, "setPageCount:forPresentationType:", objc_msgSend(v13, "pageCount"), objc_msgSend(v13, "presentationType"));
                  v5 += (uint64_t)[v13 pageCount];
                }
              }
              id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v9);
          }
          BOOL v6 = (char *)v6 + 1;
        }
        while (v6 != v16);
        id v4 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v4);
    }
  }
  objc_sync_exit(self);
}

- (id)p_queuePaginationOperationForContentNode:(id)a3 nodeBody:(id)a4 priority:(int64_t)a5 isForeground:(BOOL)a6
{
  id v8 = -[THReflowableContentPaginationOperation initWithContentNode:paginationResults:flowModelContentNodeBody:presentationType:documentRoot:isForegroundPagination:delegate:]([THReflowableContentPaginationOperation alloc], "initWithContentNode:paginationResults:flowModelContentNodeBody:presentationType:documentRoot:isForegroundPagination:delegate:", a3, -[THReflowablePaginationController paginationResultForContentNode:](self, "paginationResultForContentNode:"), a4, [(THReflowablePaginationController *)self presentationType], [(THReflowablePaginationController *)self documentRoot], a6, self);
  [(THReflowableContentPaginationOperation *)v8 setQueuePriority:a5];
  [(NSOperationQueue *)[(THReflowablePaginationController *)self paginationQueue] addOperation:v8];

  return v8;
}

- (id)paginateContentNode:(id)a3 paginationCompletionDelegate:(id)a4 priority:(int64_t)a5 isForeground:(BOOL)a6 activity:(id)a7
{
  BOOL v7 = a6;
  objc_sync_enter(self);
  if (a4
    && ![(TSUPointerKeyDictionary *)[(THReflowablePaginationController *)self paginationCompletions] objectForKey:a3])
  {
    [(TSUPointerKeyDictionary *)[(THReflowablePaginationController *)self paginationCompletions] setObject:a4 forUncopiedKey:a3];
  }
  id v12 = [a3 nodeBodyForPresentationType:[self sourcePresentationType]];
  if (v12)
  {
    id v13 = [(THReflowablePaginationController *)self p_queuePaginationOperationForContentNode:a3 nodeBody:v12 priority:a5 isForeground:v7];
  }
  else
  {
    long long v14 = -[THModelContentLoadOperation initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:]([THModelContentLoadOperation alloc], "initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:", self, a3, -[THReflowablePaginationController documentRoot](self, "documentRoot"), -[THBookDescription bookBundleUrl](-[THDocumentRoot bookDescription](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "bookDescription"), "bookBundleUrl"), [a3 applePubRelativePath]);
    [(THModelContentLoadOperation *)v14 setQueuePriority:a5];
    [(NSOperationQueue *)[(THReflowablePaginationController *)self loadQueue] addOperation:v14];

    id v13 = 0;
  }
  [(THReflowablePaginationController *)self p_updatePaginationInProgress];
  objc_sync_exit(self);
  return v13;
}

- (unint64_t)paginationCount
{
  objc_sync_enter(self);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(THReflowablePaginationController *)self paginationResults];
  unint64_t v4 = 0;
  id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += objc_msgSend(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "presentationType"), "isEqualIncludingSize:", -[THReflowablePaginationController presentationType](self, "presentationType"));
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  objc_sync_exit(self);
  return v4;
}

- (double)paginationProgress
{
  if (![(THReflowablePaginationController *)self numberOfContentNodes]) {
    return 0.0;
  }
  double v3 = (double)[(THReflowablePaginationController *)self paginationCount];
  return v3 / (double)[(THReflowablePaginationController *)self numberOfContentNodes];
}

- (BOOL)paginationComplete
{
  unint64_t v3 = [(THReflowablePaginationController *)self paginationCount];
  return v3 == [(THReflowablePaginationController *)self numberOfContentNodes];
}

- (void)savePaginationCache
{
  objc_sync_enter(self);
  if ([(NSMutableDictionary *)[(THReflowablePaginationController *)self paginationResults] count])
  {
    unint64_t v3 = [(THDocumentRoot *)[(THReflowablePaginationController *)self documentRoot] bookDescription];
    unint64_t v4 = [[THReflowablePaginationCache alloc] initWithAssetID:[(THAsset *)[(THBookDescription *)v3 asset] assetID] bookVersionString:[(THBookDescription *)v3 bookVersionString] modificationDate:[(THDocumentProperties *)[(THDocumentRoot *)[(THReflowablePaginationController *)self documentRoot] properties] modificationDate]];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = [(THReflowablePaginationController *)self paginationResults];
    id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          [(THReflowablePaginationCache *)v4 cacheResult:[(NSMutableDictionary *)[(THReflowablePaginationController *)self paginationResults] objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)] forKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    [(THReflowablePaginationCache *)v4 archive];
  }
  objc_sync_exit(self);
}

- (void)loadPaginationCache
{
  unint64_t v3 = [(THDocumentRoot *)[(THReflowablePaginationController *)self documentRoot] bookDescription];
  id v4 = +[THReflowablePaginationCache loadFromArchiveWithAssetID:[(THAsset *)[(THBookDescription *)v3 asset] assetID] bookVersionString:[(THBookDescription *)v3 bookVersionString] modificationDate:[(THDocumentProperties *)[(THDocumentRoot *)[(THReflowablePaginationController *)self documentRoot] properties] modificationDate]];
  objc_sync_enter(self);
  id v5 = [v4 keyEnumerator];
  while (1)
  {
    id v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    id v7 = [v4 cachedResultsForKey:v6];
    if (-[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](-[THReflowablePaginationController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForGUID:", [v7 nodeGUID]))
    {
      -[THReflowablePaginationController updatePaginationResult:presentationType:](self, "updatePaginationResult:presentationType:", v7, [v6 presentationType]);
    }
  }

  objc_sync_exit(self);
}

- (id)paginationResultForContentNode:(id)a3
{
  objc_sync_enter(self);
  id v5 = [[THPaginationResultsKey alloc] initWithContentNode:a3 presentationType:[(THReflowablePaginationController *)self presentationType]];
  id v6 = [(NSMutableDictionary *)[(THReflowablePaginationController *)self paginationResults] objectForKey:v5];

  objc_sync_exit(self);
  return v6;
}

- (void)updatePaginationResult:(id)a3
{
  id v5 = [(THReflowablePaginationController *)self presentationType];

  [(THReflowablePaginationController *)self updatePaginationResult:a3 presentationType:v5];
}

- (void)updatePaginationResult:(id)a3 presentationType:(id)a4
{
  objc_sync_enter(self);
  id v7 = -[THPaginationResultsKey initWithContentNodeGUID:presentationType:]([THPaginationResultsKey alloc], "initWithContentNodeGUID:presentationType:", [a3 nodeGUID], a4);
  if ([(NSMutableDictionary *)[(THReflowablePaginationController *)self paginationResults] objectForKey:v7])
  {
    [(NSMutableDictionary *)[(THReflowablePaginationController *)self paginationResults] removeObjectForKey:v7];
  }
  if (a3) {
    [(NSMutableDictionary *)[(THReflowablePaginationController *)self paginationResults] setObject:a3 forKey:v7];
  }

  objc_sync_exit(self);
}

- (id)loadOperationForContentNode:(id)a3 loadOperationCompletionDelegate:(id)a4 priority:(int64_t)a5
{
  objc_sync_enter(self);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v9 = [(NSOperationQueue *)[(THReflowablePaginationController *)self loadQueue] operations];
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v13 contentNode] == a3)
        {
          [v13 setQueuePriority:a5];
          id v15 = v13;
          long long v14 = v15;
          if (a4
            && v15
            && ![(TSUPointerKeyDictionary *)[(THReflowablePaginationController *)self loadCompletions] objectForKey:a3])
          {
            [(TSUPointerKeyDictionary *)[(THReflowablePaginationController *)self loadCompletions] setObject:a4 forUncopiedKey:a3];
          }
          goto LABEL_14;
        }
      }
      id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  long long v14 = 0;
LABEL_14:
  objc_sync_exit(self);
  return v14;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"operationCount"]
    && ([(THReflowablePaginationController *)self paginationQueue] == a4
     || [(THReflowablePaginationController *)self loadQueue] == a4))
  {
    [(THReflowablePaginationController *)self paginationQueue];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THReflowablePaginationController;
    [(THReflowablePaginationController *)&v11 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (void)registerObserver:(id)a3
{
  objc_sync_enter(self);
  if (([(NSMutableArray *)[(THReflowablePaginationController *)self observers] tsu_containsObjectIdenticalTo:a3] & 1) == 0)[(NSMutableArray *)[(THReflowablePaginationController *)self observers] addObject:a3]; {

  }
  objc_sync_exit(self);
}

- (void)unregisterObserver:(id)a3
{
  objc_sync_enter(self);
  if ([(NSMutableArray *)[(THReflowablePaginationController *)self observers] tsu_containsObjectIdenticalTo:a3])[(NSMutableArray *)[(THReflowablePaginationController *)self observers] removeObjectIdenticalTo:a3]; {

  }
  objc_sync_exit(self);
}

- (void)contentPaginationOperation:(id)a3 paginatedNodeBody:(id)a4 forPresentationType:(id)a5
{
  objc_sync_enter(self);
  id v8 = [a3 paginationResults];
  if (!-[THReflowablePaginationController paginationResultForContentNode:](self, "paginationResultForContentNode:", [a3 contentNode]))
  {
    long long v9 = -[THPaginationResultsKey initWithContentNode:presentationType:]([THPaginationResultsKey alloc], "initWithContentNode:presentationType:", [a3 contentNode], -[THReflowablePaginationController presentationType](self, "presentationType"));
    if ([a3 paginationResults]) {
      -[NSMutableDictionary setObject:forKey:](-[THReflowablePaginationController paginationResults](self, "paginationResults"), "setObject:forKey:", [a3 paginationResults], v9);
    }
  }
  objc_msgSend(objc_msgSend(a3, "contentNode"), "setPageCount:forPresentationType:", objc_msgSend(v8, "pageCount"), objc_msgSend(v8, "presentationType"));
  id v10 = -[TSUPointerKeyDictionary objectForKey:](-[THReflowablePaginationController paginationCompletions](self, "paginationCompletions"), "objectForKey:", [a3 contentNode]);
  if (v10)
  {
    objc_msgSend(v10, "paginationController:paginatedBody:forPresentationType:", self, objc_msgSend(a3, "paginatedModelContentNodeBody"), a5);
    -[TSUPointerKeyDictionary removeObjectForKey:](-[THReflowablePaginationController paginationCompletions](self, "paginationCompletions"), "removeObjectForKey:", [a3 contentNode]);
  }
  id v11 = [a3 contentNode];
  [(THReflowablePaginationController *)self paginationProgress];
  uint64_t v13 = v12;
  unsigned int v14 = [(THReflowablePaginationController *)self paginationComplete];
  char v15 = v14;
  if (v14)
  {
    [(THReflowablePaginationController *)self p_updatePageNumbers];
    [(THReflowablePaginationController *)self p_updatePaginationInProgress];
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_EBB98;
  v16[3] = &unk_459398;
  v16[4] = self;
  v16[5] = v11;
  v16[6] = v13;
  char v17 = v15;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
  objc_sync_exit(self);
}

- (void)contentLoadOperation:(id)a3 loadedContentBodies:(id)a4
{
  objc_sync_enter(self);
  id v7 = -[TSUPointerKeyDictionary objectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "objectForKey:", [a3 contentNode]);
  if (v7)
  {
    [v7 contentLoadOperation:a3 loadedContentBodies:a4];
    -[TSUPointerKeyDictionary removeObjectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "removeObjectForKey:", [a3 contentNode]);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = (char *)[a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v16 = a3;
      id v9 = 0;
      char v10 = 0;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(a4);
          }
          objc_opt_class();
          uint64_t v13 = (void *)TSUDynamicCast();
          if (v13)
          {
            id v14 = [a4 objectForKey:v13];
            if (v10 & 1 | (([v13 isFlow] & 1) == 0))
            {
              unsigned int v15 = [v13 isPaginated];
              if (v15) {
                id v9 = 0;
              }
              v10 |= v15;
            }
            else
            {
              char v10 = 0;
              id v9 = v14;
            }
          }
        }
        id v8 = (char *)[a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
      if (!(v10 & 1 | (v9 == 0))) {
        -[THReflowablePaginationController p_queuePaginationOperationForContentNode:nodeBody:priority:isForeground:](self, "p_queuePaginationOperationForContentNode:nodeBody:priority:isForeground:", [v16 contentNode], v9, 0, 0);
      }
    }
  }
  objc_sync_exit(self);
}

- (void)contentLoadOperationFailed:(id)a3
{
  objc_sync_enter(self);
  id v5 = -[TSUPointerKeyDictionary objectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "objectForKey:", [a3 contentNode]);
  if (v5)
  {
    [v5 contentLoadOperationFailed:a3];
    -[TSUPointerKeyDictionary removeObjectForKey:](-[THReflowablePaginationController loadCompletions](self, "loadCompletions"), "removeObjectForKey:", [a3 contentNode]);
  }

  objc_sync_exit(self);
}

- (BOOL)navigationPageNode
{
  return 0;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
}

- (void)setNumberOfContentNodes:(unint64_t)a3
{
  self->_numberOfContentNodes = a3;
}

- (THPresentationType)sourcePresentationType
{
  return self->_sourcePresentationType;
}

- (void)setSourcePresentationType:(id)a3
{
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (NSMutableDictionary)paginationResults
{
  return self->_paginationResults;
}

- (void)setPaginationResults:(id)a3
{
}

- (NSOperationQueue)loadQueue
{
  return self->_loadQueue;
}

- (void)setLoadQueue:(id)a3
{
}

- (NSOperationQueue)paginationQueue
{
  return self->_paginationQueue;
}

- (void)setPaginationQueue:(id)a3
{
}

- (TSUPointerKeyDictionary)paginationCompletions
{
  return self->_paginationCompletions;
}

- (void)setPaginationCompletions:(id)a3
{
}

- (TSUPointerKeyDictionary)loadCompletions
{
  return self->_loadCompletions;
}

- (void)setLoadCompletions:(id)a3
{
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)paginationInProgress
{
  return self->_paginationInProgress;
}

@end