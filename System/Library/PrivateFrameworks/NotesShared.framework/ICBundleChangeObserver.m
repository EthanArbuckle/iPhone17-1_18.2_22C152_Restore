@interface ICBundleChangeObserver
- (BOOL)didAddForExistingPaperAttachments;
- (BOOL)isObserving;
- (ICBundleChangeObserver)init;
- (ICBundleChangeObserver)initWithPersistentStoreCoordinator:(id)a3 managedObjectContext:(id)a4;
- (NSManagedObjectContext)managedObjectContext;
- (NSMutableDictionary)mutableFilePresenters;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (OS_dispatch_queue)processingQueue;
- (id)attachmentDidChange;
- (id)didChangeFilePresenters;
- (id)filePresenters;
- (void)addManagedObjectContextDidSaveObserver;
- (void)addObserverForBundleWithObjectID:(id)a3 url:(id)a4;
- (void)addObserversForExistingPaperAttachments;
- (void)addObserversForObjects:(id)a3;
- (void)contextDidSave:(id)a3;
- (void)processObjectIDs:(id)a3 completion:(id)a4;
- (void)removeManagedObjectContextDidSaveObserver;
- (void)removeObserverForBundleWithURL:(id)a3;
- (void)setAttachmentDidChange:(id)a3;
- (void)setDidAddForExistingPaperAttachments:(BOOL)a3;
- (void)setDidChangeFilePresenters:(id)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setMutableFilePresenters:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)start;
- (void)stop;
- (void)stopAndNotifyObservers:(BOOL)a3;
@end

@implementation ICBundleChangeObserver

- (ICBundleChangeObserver)initWithPersistentStoreCoordinator:(id)a3 managedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICBundleChangeObserver;
  v9 = [(ICBundleChangeObserver *)&v19 init];
  v10 = v9;
  if (v9)
  {
    v9->_isObserving = 0;
    objc_storeStrong((id *)&v9->_persistentStoreCoordinator, a3);
    objc_storeStrong((id *)&v10->_managedObjectContext, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableFilePresenters = v10->_mutableFilePresenters;
    v10->_mutableFilePresenters = (NSMutableDictionary *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.notes.bundle-change-observer-processing-queue", v13);
    processingQueue = v10->_processingQueue;
    v10->_processingQueue = (OS_dispatch_queue *)v14;

    id didChangeFilePresenters = v10->_didChangeFilePresenters;
    v10->_id didChangeFilePresenters = 0;

    id attachmentDidChange = v10->_attachmentDidChange;
    v10->_id attachmentDidChange = 0;
  }
  return v10;
}

- (ICBundleChangeObserver)init
{
  v3 = +[ICNoteContext sharedContext];
  v4 = [v3 persistentStoreCoordinator];
  v5 = [v3 workerManagedObjectContext];
  v6 = [(ICBundleChangeObserver *)self initWithPersistentStoreCoordinator:v4 managedObjectContext:v5];

  return v6;
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(ICBundleChangeObserver *)self isObserving])
  {
    [(ICBundleChangeObserver *)self addManagedObjectContextDidSaveObserver];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = [(ICBundleChangeObserver *)self mutableFilePresenters];
    v4 = [v3 allValues];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [MEMORY[0x1E4F28CA0] addFilePresenter:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
          v9 = [(ICBundleChangeObserver *)self didChangeFilePresenters];

          if (v9)
          {
            v10 = [(ICBundleChangeObserver *)self didChangeFilePresenters];
            v10[2]();
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [(ICBundleChangeObserver *)self setIsObserving:1];
    if (![(ICBundleChangeObserver *)self didAddForExistingPaperAttachments])
    {
      [(ICBundleChangeObserver *)self setDidAddForExistingPaperAttachments:1];
      [(ICBundleChangeObserver *)self addObserversForExistingPaperAttachments];
    }
  }
}

- (void)stop
{
}

- (void)stopAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(ICBundleChangeObserver *)self isObserving])
  {
    [(ICBundleChangeObserver *)self removeManagedObjectContextDidSaveObserver];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(ICBundleChangeObserver *)self mutableFilePresenters];
    uint64_t v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [MEMORY[0x1E4F28CA0] removeFilePresenter:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
          if (v3)
          {
            long long v11 = [(ICBundleChangeObserver *)self didChangeFilePresenters];

            if (v11)
            {
              long long v12 = [(ICBundleChangeObserver *)self didChangeFilePresenters];
              v12[2]();
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(ICBundleChangeObserver *)self setIsObserving:0];
  }
}

- (void)contextDidSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1C877DB80]();
  uint64_t v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BDF0]];

  if ([v7 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__ICBundleChangeObserver_contextDidSave___block_invoke;
    v8[3] = &unk_1E64A71D0;
    v8[4] = self;
    [(ICBundleChangeObserver *)self processObjectIDs:v7 completion:v8];
  }
}

uint64_t __41__ICBundleChangeObserver_contextDidSave___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObserversForObjects:a2];
}

- (void)addObserversForExistingPaperAttachments
{
  BOOL v3 = [(ICBundleChangeObserver *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke;
  block[3] = &unk_1E64A4240;
  block[4] = self;
  dispatch_async(v3, block);
}

void __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke_2;
  v5[3] = &unk_1E64A4218;
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = v2;
  uint64_t v7 = v3;
  id v4 = v2;
  [v4 performBlockAndWait:v5];
}

void __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke_2(uint64_t a1)
{
  v2 = +[ICAttachment predicateForVisibleAttachmentsWithTypeUTI:@"com.apple.paper" inContext:*(void *)(a1 + 32)];
  uint64_t v3 = +[ICAttachment ic_objectIDsMatchingPredicate:v2 context:*(void *)(a1 + 32)];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke_3;
  v6[3] = &unk_1E64A71D0;
  v6[4] = *(void *)(a1 + 40);
  [v4 processObjectIDs:v5 completion:v6];
}

uint64_t __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObserversForObjects:a2];
}

- (void)addObserversForObjects:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = v3;
    performBlockOnMainThread();
  }
}

void __49__ICBundleChangeObserver_addObserversForObjects___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = *(void **)(a1 + 40);
        uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        [v8 addObserverForBundleWithObjectID:v7 url:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)addObserverForBundleWithObjectID:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICBundleChangeObserver addObserverForBundleWithObjectID:url:]" simulateCrash:1 showAlert:0 format:@"Must be on main thread here"];
  }
  uint64_t v8 = [(ICBundleChangeObserver *)self filePresenters];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    long long v10 = [ICBundleChangeFilePresenter alloc];
    long long v11 = [(ICBundleChangeObserver *)self managedObjectContext];
    long long v12 = [(ICBundleChangeFilePresenter *)v10 initWithObjectID:v6 url:v7 managedObjectContext:v11];

    long long v13 = [(ICBundleChangeObserver *)self mutableFilePresenters];
    [v13 setObject:v12 forKeyedSubscript:v7];

    if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
    {
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__ICBundleChangeObserver_addObserverForBundleWithObjectID_url___block_invoke;
      v16[3] = &unk_1E64A71F8;
      objc_copyWeak(&v18, &location);
      id v17 = v6;
      [(ICBundleChangeFilePresenter *)v12 setPresentedItemDidApplyChanges:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    if ([(ICBundleChangeObserver *)self isObserving])
    {
      [MEMORY[0x1E4F28CA0] addFilePresenter:v12];
      long long v14 = [(ICBundleChangeObserver *)self didChangeFilePresenters];

      if (v14)
      {
        uint64_t v15 = [(ICBundleChangeObserver *)self didChangeFilePresenters];
        v15[2]();
      }
    }
  }
}

void __63__ICBundleChangeObserver_addObserverForBundleWithObjectID_url___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained attachmentDidChange];

    id WeakRetained = v5;
    if (v3)
    {
      uint64_t v4 = [v5 attachmentDidChange];
      v4[2](v4, *(void *)(a1 + 32));

      id WeakRetained = v5;
    }
  }
}

- (void)removeObserverForBundleWithURL:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(ICBundleChangeObserver *)self mutableFilePresenters];
  id v5 = [v4 objectForKeyedSubscript:v9];

  if (v5)
  {
    id v6 = [(ICBundleChangeObserver *)self mutableFilePresenters];
    [v6 setObject:0 forKeyedSubscript:v9];

    [MEMORY[0x1E4F28CA0] removeFilePresenter:v5];
    id v7 = [(ICBundleChangeObserver *)self didChangeFilePresenters];

    if (v7)
    {
      uint64_t v8 = [(ICBundleChangeObserver *)self didChangeFilePresenters];
      v8[2]();
    }
  }
}

- (void)addManagedObjectContextDidSaveObserver
{
  id v4 = [(ICBundleChangeObserver *)self persistentStoreCoordinator];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_contextDidSave_ name:*MEMORY[0x1E4F1BE28] object:v4];
}

- (void)removeManagedObjectContextDidSaveObserver
{
  id v4 = [(ICBundleChangeObserver *)self persistentStoreCoordinator];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1BE28] object:v4];
}

- (id)filePresenters
{
  v2 = [(ICBundleChangeObserver *)self mutableFilePresenters];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (void)processObjectIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICBundleChangeObserver *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ICBundleChangeObserver_processObjectIDs_completion___block_invoke;
  block[3] = &unk_1E64A4578;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__ICBundleChangeObserver_processObjectIDs_completion___block_invoke(id *a1)
{
  v2 = [a1[4] managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__ICBundleChangeObserver_processObjectIDs_completion___block_invoke_2;
  v4[3] = &unk_1E64A4578;
  id v5 = a1[5];
  id v6 = v2;
  id v7 = a1[6];
  id v3 = v2;
  [v3 performBlockAndWait:v4];
}

void __54__ICBundleChangeObserver_processObjectIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(v1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v27;
    id v5 = &off_1E64A3000;
    id v6 = &off_1E64A3000;
    do
    {
      uint64_t v7 = 0;
      uint64_t v23 = v3;
      do
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        if (objc_msgSend(v8, "ic_isEntityOfClass:", objc_opt_class()))
        {
          uint64_t v9 = v4;
          id v10 = v6;
          long long v11 = v5;
          uint64_t v12 = v1;
          id v13 = [*(id *)(v1 + 40) objectWithID:v8];
          long long v14 = [v13 identifier];
          objc_opt_class();
          uint64_t v15 = [v13 attachmentModel];
          long long v16 = ICDynamicCast();

          if (v16) {
            BOOL v17 = v14 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            id v18 = [v16 paperBundleURL];
            [v25 setObject:v18 forKeyedSubscript:v8];
          }
          id v5 = v11;
          id v6 = v10;
          uint64_t v1 = v12;
          uint64_t v4 = v9;
          uint64_t v3 = v23;
        }
        if (objc_msgSend(v8, "ic_isEntityOfClass:", objc_opt_class()))
        {
          objc_super v19 = [*(id *)(v1 + 40) objectWithID:v8];
          v20 = [v19 mediaURL];
          [v25 setObject:v20 forKeyedSubscript:v8];
        }
        ++v7;
      }
      while (v3 != v7);
      uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v3);
  }

  uint64_t v21 = *(void *)(v1 + 48);
  v22 = (void *)[v25 copy];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (BOOL)didAddForExistingPaperAttachments
{
  return self->_didAddForExistingPaperAttachments;
}

- (void)setDidAddForExistingPaperAttachments:(BOOL)a3
{
  self->_didAddForExistingPaperAttachments = a3;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (NSMutableDictionary)mutableFilePresenters
{
  return self->_mutableFilePresenters;
}

- (void)setMutableFilePresenters:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (id)didChangeFilePresenters
{
  return self->_didChangeFilePresenters;
}

- (void)setDidChangeFilePresenters:(id)a3
{
}

- (id)attachmentDidChange
{
  return self->_attachmentDidChange;
}

- (void)setAttachmentDidChange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attachmentDidChange, 0);
  objc_storeStrong(&self->_didChangeFilePresenters, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_mutableFilePresenters, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end