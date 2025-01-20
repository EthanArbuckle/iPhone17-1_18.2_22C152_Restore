@interface ICManagedObjectContextChangeController
- (ICManagedObjectContextChangeController)initWithDelegate:(id)a3;
- (ICManagedObjectContextChangeController)initWithManagedObjectContexts:(id)a3 delegate:(id)a4;
- (ICManagedObjectContextChangeControllerDelegate)delegate;
- (ICSelectorDelayer)updateSelectorDelayer;
- (NSMutableSet)needsUpdateManagedObjectIDs;
- (NSSet)managedObjectContexts;
- (NSSet)objectTypeKeys;
- (OS_dispatch_queue)needsUpdateManagedObjectIDsSerialQueue;
- (double)updateInterval;
- (unint64_t)objectTypes;
- (void)_performUpdatesIfNeeded;
- (void)addObservers;
- (void)dealloc;
- (void)managedObjectContextObjectsDidChange:(id)a3;
- (void)performUpdatesIfNeeded;
- (void)performUpdatesIfNeededAndWait;
- (void)removeObservers;
- (void)setDelegate:(id)a3;
- (void)setManagedObjectContexts:(id)a3;
- (void)setNeedsUpdateManagedObjectIDs:(id)a3;
- (void)setNeedsUpdateManagedObjectIDsSerialQueue:(id)a3;
- (void)setObjectTypes:(unint64_t)a3;
- (void)setUpdateInterval:(double)a3;
- (void)setUpdateSelectorDelayer:(id)a3;
@end

@implementation ICManagedObjectContextChangeController

- (ICManagedObjectContextChangeController)initWithManagedObjectContexts:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICManagedObjectContextChangeController;
  v9 = [(ICManagedObjectContextChangeController *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managedObjectContexts, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    needsUpdateManagedObjectIDs = v10->_needsUpdateManagedObjectIDs;
    v10->_needsUpdateManagedObjectIDs = (NSMutableSet *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_objectTypes = 15;
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.notes.moc-change-controller-object-ids-serial-queue", v13);
    needsUpdateManagedObjectIDsSerialQueue = v10->_needsUpdateManagedObjectIDsSerialQueue;
    v10->_needsUpdateManagedObjectIDsSerialQueue = (OS_dispatch_queue *)v14;

    v10->_updateInterval = 0.1;
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:v10 selector:sel_performUpdatesIfNeeded delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:v10->_updateInterval];
    updateSelectorDelayer = v10->_updateSelectorDelayer;
    v10->_updateSelectorDelayer = (ICSelectorDelayer *)v16;

    [(ICManagedObjectContextChangeController *)v10 addObservers];
  }

  return v10;
}

- (void)addObservers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(ICManagedObjectContextChangeController *)self managedObjectContexts];

  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = [(ICManagedObjectContextChangeController *)self managedObjectContexts];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      uint64_t v8 = *MEMORY[0x1E4F1BE30];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v11 addObserver:self selector:sel_managedObjectContextObjectsDidChange_ name:v8 object:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:self selector:sel_managedObjectContextObjectsDidChange_ name:*MEMORY[0x1E4F1BE30] object:0];
  }
}

- (NSSet)managedObjectContexts
{
  return self->_managedObjectContexts;
}

BOOL __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 changedValues];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)managedObjectContextObjectsDidChange:(id)a3
{
  val = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(ICManagedObjectContextChangeController *)val objectTypeKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    uint64_t v8 = *MEMORY[0x1E4F1BFA8];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v3, "userInfo", val);
        id v12 = [v11 objectForKeyedSubscript:v10];

        if ([v10 isEqualToString:v8])
        {
          uint64_t v13 = [v12 objectsPassingTest:&__block_literal_global_49];

          id v12 = (void *)v13;
        }
        [v4 unionSet:v12];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  long long v14 = [(ICManagedObjectContextChangeController *)val delegate];
  long long v15 = [v14 managedObjectContextChangeController:val managedObjectIDsToUpdateForUpdatedManagedObjects:v4];

  if ([v15 count])
  {
    objc_initWeak(&location, val);
    long long v16 = [(ICManagedObjectContextChangeController *)val needsUpdateManagedObjectIDsSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke_2;
    block[3] = &unk_1E5FDA4E0;
    objc_copyWeak(&v20, &location);
    id v19 = v15;
    dispatch_async(v16, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (NSSet)objectTypeKeys
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (([(ICManagedObjectContextChangeController *)self objectTypes] & 2) != 0) {
    [v3 addObject:*MEMORY[0x1E4F1BDF8]];
  }
  if (([(ICManagedObjectContextChangeController *)self objectTypes] & 8) != 0) {
    [v3 addObject:*MEMORY[0x1E4F1BF30]];
  }
  if ([(ICManagedObjectContextChangeController *)self objectTypes]) {
    [v3 addObject:*MEMORY[0x1E4F1BFA8]];
  }
  if (([(ICManagedObjectContextChangeController *)self objectTypes] & 4) != 0) {
    [v3 addObject:*MEMORY[0x1E4F1BDC0]];
  }
  if (([(ICManagedObjectContextChangeController *)self objectTypes] & 0x10) != 0) {
    [v3 addObject:*MEMORY[0x1E4F1BE10]];
  }
  v4 = (void *)[v3 copy];

  return (NSSet *)v4;
}

- (unint64_t)objectTypes
{
  return self->_objectTypes;
}

- (ICManagedObjectContextChangeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICManagedObjectContextChangeControllerDelegate *)WeakRetained;
}

- (void)setObjectTypes:(unint64_t)a3
{
  self->_objectTypes = a3;
}

- (ICManagedObjectContextChangeController)initWithDelegate:(id)a3
{
  return [(ICManagedObjectContextChangeController *)self initWithManagedObjectContexts:0 delegate:a3];
}

- (void)dealloc
{
  [(ICManagedObjectContextChangeController *)self removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)ICManagedObjectContextChangeController;
  [(ICManagedObjectContextChangeController *)&v3 dealloc];
}

- (void)performUpdatesIfNeeded
{
  objc_initWeak(&location, self);
  objc_super v3 = [(ICManagedObjectContextChangeController *)self needsUpdateManagedObjectIDsSerialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__ICManagedObjectContextChangeController_performUpdatesIfNeeded__block_invoke;
  v4[3] = &unk_1E5FDAAE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__ICManagedObjectContextChangeController_performUpdatesIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performUpdatesIfNeeded];
}

- (void)performUpdatesIfNeededAndWait
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICManagedObjectContextChangeController performUpdatesIfNeededAndWait]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  [(ICManagedObjectContextChangeController *)self _performUpdatesIfNeeded];
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
  id v4 = [(ICManagedObjectContextChangeController *)self updateSelectorDelayer];
  [v4 setDelay:a3];
}

void __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained needsUpdateManagedObjectIDs];
    [v5 unionSet:*(void *)(a1 + 32)];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke_3;
    block[3] = &unk_1E5FDAAE0;
    objc_copyWeak(&v7, v2);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v7);
  }
}

void __79__ICManagedObjectContextChangeController_managedObjectContextObjectsDidChange___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained delegate];
    int v3 = [v2 managedObjectContextChangeControllerShouldUpdateImmediately:v5];

    id WeakRetained = v5;
    if (v3)
    {
      id v4 = [v5 updateSelectorDelayer];
      [v4 requestFire];

      id WeakRetained = v5;
    }
  }
}

- (void)_performUpdatesIfNeeded
{
  int v3 = [(ICManagedObjectContextChangeController *)self needsUpdateManagedObjectIDs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = [(ICManagedObjectContextChangeController *)self updateSelectorDelayer];
    [v5 cancelPreviousFireRequests];

    uint64_t v7 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v8, &location);
    performBlockOnMainThreadAndWait();
    uint64_t v6 = [(ICManagedObjectContextChangeController *)self needsUpdateManagedObjectIDs];
    [v6 removeAllObjects];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __65__ICManagedObjectContextChangeController__performUpdatesIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  v2 = [WeakRetained needsUpdateManagedObjectIDs];
  [v1 managedObjectContextChangeController:WeakRetained performUpdatesForManagedObjectIDs:v2];
}

- (void)removeObservers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(ICManagedObjectContextChangeController *)self managedObjectContexts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    uint64_t v8 = *MEMORY[0x1E4F1BE30];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:self name:v8 object:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setManagedObjectContexts:(id)a3
{
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (NSMutableSet)needsUpdateManagedObjectIDs
{
  return self->_needsUpdateManagedObjectIDs;
}

- (void)setNeedsUpdateManagedObjectIDs:(id)a3
{
}

- (OS_dispatch_queue)needsUpdateManagedObjectIDsSerialQueue
{
  return self->_needsUpdateManagedObjectIDsSerialQueue;
}

- (void)setNeedsUpdateManagedObjectIDsSerialQueue:(id)a3
{
}

- (ICSelectorDelayer)updateSelectorDelayer
{
  return self->_updateSelectorDelayer;
}

- (void)setUpdateSelectorDelayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_needsUpdateManagedObjectIDsSerialQueue, 0);
  objc_storeStrong((id *)&self->_needsUpdateManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_managedObjectContexts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end