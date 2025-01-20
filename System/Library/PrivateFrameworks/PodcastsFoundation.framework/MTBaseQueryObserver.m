@interface MTBaseQueryObserver
+ (Class)fetchedResultsControllerClass;
- (BOOL)isObserving;
- (BOOL)stopCalled;
- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4;
- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 background:(BOOL)a5;
- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 managedObjectContext:(id)a5;
- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6;
- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 batchSize:(int64_t)a7 propertiesToFetch:(id)a8;
- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 batchSize:(int64_t)a7 propertiesToFetch:(id)a8 managedObjectContext:(id)a9;
- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 returnObjectsAsFaults:(BOOL)a7;
- (MTBaseQueryObserver)initWithFetchRequest:(id)a3;
- (MTBaseQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4;
- (NSDictionary)userInfo;
- (NSMutableDictionary)handlers;
- (NSString)identifier;
- (id)_frc;
- (id)addResultsChangedHandler:(id)a3;
- (id)managedObjectContext;
- (id)predicate;
- (id)sortDescriptors;
- (id)uuids;
- (void)dealloc;
- (void)refetch:(id)a3;
- (void)removeAllResultsChangedHandlers;
- (void)removeResultsChangedHandler:(id)a3;
- (void)results:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setStopCalled:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)startObserving;
- (void)stop;
@end

@implementation MTBaseQueryObserver

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6
{
  return [(MTBaseQueryObserver *)self initWithEntityName:a3 predicate:a4 sortDescriptors:a5 limit:a6 returnObjectsAsFaults:1];
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4
{
  return [(MTBaseQueryObserver *)self initWithEntityName:a3 predicate:a4 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:0];
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 returnObjectsAsFaults:(BOOL)a7
{
  BOOL v7 = a7;
  v12 = (void *)MEMORY[0x1E4F1C0D0];
  id v13 = a5;
  id v14 = a4;
  v15 = [v12 fetchRequestWithEntityName:a3];
  [v15 setPredicate:v14];

  [v15 setSortDescriptors:v13];
  [v15 setFetchLimit:a6];
  [v15 setReturnsObjectsAsFaults:v7];
  v16 = [(MTBaseQueryObserver *)self initWithFetchRequest:v15];

  return v16;
}

- (MTBaseQueryObserver)initWithFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = +[MTDB sharedInstance];
  v6 = [v5 mainOrPrivateContext];

  BOOL v7 = [(MTBaseQueryObserver *)self initWithFetchRequest:v4 managedObjectContext:v6];
  return v7;
}

- (id)uuids
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__MTBaseQueryObserver_uuids__block_invoke;
  v4[3] = &unk_1E5E615F8;
  v4[4] = &v5;
  [(MTBaseQueryObserver *)self results:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)startObserving
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  id v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v3 = [(NSFetchedResultsController *)self->_frc managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__MTBaseQueryObserver_startObserving__block_invoke;
  v4[3] = &unk_1E5E615D0;
  v4[4] = self;
  void v4[5] = &v5;
  v4[6] = &v9;
  [v3 performBlockAndWait:v4];

  if (!*((unsigned char *)v6 + 24)) {
    [(id)v10[5] logAndThrow:1];
  }
  self->_isObserving = 1;
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

- (void)results:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSFetchedResultsController *)self->_frc managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__MTBaseQueryObserver_results___block_invoke;
  v7[3] = &unk_1E5E61518;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __31__MTBaseQueryObserver_results___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) _frc];
  id v2 = [v4 fetchedObjects];
  v3 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (id)_frc
{
  return self->_frc;
}

void __28__MTBaseQueryObserver_uuids__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [a2 valueForKey:@"uuid"];
  uint64_t v4 = [v3 setWithArray:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __37__MTBaseQueryObserver_startObserving__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _frc];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 performFetch:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (MTBaseQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MTBaseQueryObserver;
  id v8 = [(MTBaseQueryObserver *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_isObserving = 0;
    uint64_t v10 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "fetchedResultsControllerClass")), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v6, v7, 0, 0);
    frc = v9->_frc;
    v9->_frc = (NSFetchedResultsController *)v10;

    [(NSFetchedResultsController *)v9->_frc setDelegate:v9];
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    handlers = v9->_handlers;
    v9->_handlers = v12;
  }
  return v9;
}

+ (Class)fetchedResultsControllerClass
{
  return (Class)objc_opt_class();
}

- (id)addResultsChangedHandler:(id)a3
{
  id v4 = a3;
  CFUUIDRef v5 = CFUUIDCreate(0);
  id v6 = (__CFString *)CFUUIDCreateString(0, v5);
  CFRelease(v5);
  id v7 = self->_handlers;
  objc_sync_enter(v7);
  handlers = self->_handlers;
  uint64_t v9 = (void *)[v4 copy];
  [(NSMutableDictionary *)handlers setObject:v9 forKey:v6];

  objc_sync_exit(v7);
  return v6;
}

- (NSMutableDictionary)handlers
{
  uint64_t v3 = self->_handlers;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableDictionary *)self->_handlers copy];
  objc_sync_exit(v3);

  return (NSMutableDictionary *)v4;
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 background:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[MTDB sharedInstance];
  uint64_t v11 = v10;
  if (a5) {
    [v10 privateQueueContext];
  }
  else {
  v12 = [v10 mainQueueContext];
  }

  id v13 = [(MTBaseQueryObserver *)self initWithEntityName:v9 predicate:v8 managedObjectContext:v12];
  return v13;
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 managedObjectContext:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 fetchRequestWithEntityName:a3];
  [v11 setPredicate:v10];

  [v11 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
  v12 = [(MTBaseQueryObserver *)self initWithFetchRequest:v11 managedObjectContext:v9];

  return v12;
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return [(MTBaseQueryObserver *)self initWithEntityName:a3 predicate:a4 sortDescriptors:a5 limit:0];
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 batchSize:(int64_t)a7 propertiesToFetch:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = +[MTDB sharedInstance];
  v19 = [v18 mainOrPrivateContext];
  v20 = [(MTBaseQueryObserver *)self initWithEntityName:v17 predicate:v16 sortDescriptors:v15 limit:a6 batchSize:a7 propertiesToFetch:v14 managedObjectContext:v19];

  return v20;
}

- (MTBaseQueryObserver)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 batchSize:(int64_t)a7 propertiesToFetch:(id)a8 managedObjectContext:(id)a9
{
  id v15 = a8;
  id v16 = (void *)MEMORY[0x1E4F1C0D0];
  id v17 = a9;
  id v18 = a5;
  id v19 = a4;
  v20 = [v16 fetchRequestWithEntityName:a3];
  [v20 setPredicate:v19];

  [v20 setFetchBatchSize:a7];
  [v20 setSortDescriptors:v18];

  [v20 setFetchLimit:a6];
  if ([v15 count])
  {
    [v20 setReturnsObjectsAsFaults:1];
    [v20 setPropertiesToFetch:v15];
  }
  else
  {
    [v20 setReturnsObjectsAsFaults:0];
  }
  v21 = [(MTBaseQueryObserver *)self initWithFetchRequest:v20 managedObjectContext:v17];

  return v21;
}

- (void)dealloc
{
  if (!self->_stopCalled
    || self->_isObserving
    || (+[IMLogger sharedLogger],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 shouldOverrideCondition:@"!assertCondition" file:@"/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Query/MTBaseQueryObserver.m"], v3, v4))
  {
    CFUUIDRef v5 = +[IMLogger sharedLogger];
    [v5 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Query/MTBaseQueryObserver.m", 161, @"%@", @"The observer's -[stop] must be called before deallocating. This is a programmer error." lineNumber format];
  }
  v6.receiver = self;
  v6.super_class = (Class)MTBaseQueryObserver;
  [(MTBaseQueryObserver *)&v6 dealloc];
}

- (id)managedObjectContext
{
  return [(NSFetchedResultsController *)self->_frc managedObjectContext];
}

- (void)setPredicate:(id)a3
{
  id v4 = a3;
  CFUUIDRef v5 = [(NSFetchedResultsController *)self->_frc managedObjectContext];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __36__MTBaseQueryObserver_setPredicate___block_invoke;
  id v10 = &unk_1E5E615A8;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:&v7];
  if (self->_isObserving) {
    [(MTBaseQueryObserver *)self startObserving];
  }
}

void __36__MTBaseQueryObserver_setPredicate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _frc];
  id v2 = [v3 fetchRequest];
  [v2 setPredicate:v1];
}

- (id)predicate
{
  id v2 = [(NSFetchedResultsController *)self->_frc fetchRequest];
  id v3 = [v2 predicate];

  return v3;
}

- (void)setSortDescriptors:(id)a3
{
  frc = self->_frc;
  id v4 = a3;
  id v5 = [(NSFetchedResultsController *)frc fetchRequest];
  [v5 setSortDescriptors:v4];
}

- (id)sortDescriptors
{
  id v2 = [(NSFetchedResultsController *)self->_frc fetchRequest];
  id v3 = [v2 sortDescriptors];

  return v3;
}

- (void)refetch:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(NSFetchedResultsController *)self->_frc managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__MTBaseQueryObserver_refetch___block_invoke;
  v6[3] = &unk_1E5E615D0;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v11;
  [v5 performBlockAndWait:v6];

  if (!*((unsigned char *)v8 + 24)) {
    [(id)v12[5] logAndThrow:1];
  }
  [(MTBaseQueryObserver *)self results:v4];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

void __31__MTBaseQueryObserver_refetch___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _frc];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 performFetch:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (void)removeResultsChangedHandler:(id)a3
{
  id v5 = a3;
  char v4 = self->_handlers;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_handlers removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (void)stop
{
  [(MTBaseQueryObserver *)self removeAllResultsChangedHandlers];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_frc name:0 object:0];

  self->_isObserving = 0;
  char v4 = [(NSFetchedResultsController *)self->_frc managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__MTBaseQueryObserver_stop__block_invoke;
  v5[3] = &unk_1E5E611F0;
  v5[4] = self;
  [v4 performBlock:v5];

  [(MTBaseQueryObserver *)self setStopCalled:1];
}

void __27__MTBaseQueryObserver_stop__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _frc];
  [v1 setDelegate:0];
}

- (void)removeAllResultsChangedHandlers
{
  id obj = self->_handlers;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_handlers removeAllObjects];
  objc_sync_exit(obj);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void)setHandlers:(id)a3
{
}

- (BOOL)stopCalled
{
  return self->_stopCalled;
}

- (void)setStopCalled:(BOOL)a3
{
  self->_stopCalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_frc, 0);
}

@end