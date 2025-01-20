@interface PLBackgroundJobLibraryCoordinator
- (BOOL)shouldDeferActivity;
- (PLBackgroundJobLibraryCoordinator)initWithStatusCenter:(id)a3;
- (PLBackgroundJobLibraryCoordinator)initWithWorkerCoordinator:(id)a3;
- (PLBackgroundJobLibraryCoordinator)initWithWorkerCoordinator:(id)a3 statusCenter:(id)a4;
- (PLBackgroundJobLibraryCoordinatorDelegate)delegate;
- (id)pendingJobsOnBundles:(id)a3;
- (void)_handleAllBundlesCompleted;
- (void)_handleBundleComplete:(id)a3;
- (void)_submitNextQueuedBundle;
- (void)setDelegate:(id)a3;
- (void)startBackgroundJobsOnBundles:(id)a3 withCriteria:(id)a4;
- (void)stopBackgroundJobsOnAllBundles;
- (void)workerCoordinatorDidFinishAllSubmittedJobsOnBundle:(id)a3;
@end

@implementation PLBackgroundJobLibraryCoordinator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workerCoordinator, 0);
  objc_storeStrong((id *)&self->_currentPhotoLibraryBundle, 0);
  objc_storeStrong((id *)&self->_pendingPhotoLibraryBundles, 0);
  objc_destroyWeak((id *)&self->_statusCenter);
}

- (void)setDelegate:(id)a3
{
}

- (PLBackgroundJobLibraryCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLBackgroundJobLibraryCoordinatorDelegate *)WeakRetained;
}

- (void)workerCoordinatorDidFinishAllSubmittedJobsOnBundle:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PLBackgroundJobLibraryCoordinator *)self _handleBundleComplete:self->_currentPhotoLibraryBundle];
  [(NSMutableArray *)self->_pendingPhotoLibraryBundles removeObject:self->_currentPhotoLibraryBundle];
  uint64_t v5 = [(NSMutableArray *)self->_pendingPhotoLibraryBundles count];
  v6 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    pendingPhotoLibraryBundles = self->_pendingPhotoLibraryBundles;
    currentPhotoLibraryBundle = self->_currentPhotoLibraryBundle;
    int v10 = 138412546;
    v11 = currentPhotoLibraryBundle;
    __int16 v12 = 2112;
    v13 = pendingPhotoLibraryBundles;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Removed bundle:%@ from pending bundles queue: %@", (uint8_t *)&v10, 0x16u);
  }

  v9 = self->_currentPhotoLibraryBundle;
  self->_currentPhotoLibraryBundle = 0;

  os_unfair_lock_unlock(p_lock);
  if (v5) {
    [(PLBackgroundJobLibraryCoordinator *)self _submitNextQueuedBundle];
  }
  else {
    [(PLBackgroundJobLibraryCoordinator *)self _handleAllBundlesCompleted];
  }
}

- (void)stopBackgroundJobsOnAllBundles
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(NSMutableArray *)self->_pendingPhotoLibraryBundles count];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Clearing %tu bundles from _pendingPhotoLibraryBundles queue", buf, 0xCu);
  }

  uint64_t v6 = [(NSMutableArray *)self->_pendingPhotoLibraryBundles count];
  v7 = (void *)[(NSMutableArray *)self->_pendingPhotoLibraryBundles copy];
  [(NSMutableArray *)self->_pendingPhotoLibraryBundles removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqual:", self->_currentPhotoLibraryBundle, (void)v14) & 1) == 0) {
          [(PLBackgroundJobLibraryCoordinator *)self _handleBundleComplete:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  if (v6) {
    [(PLBackgroundJobWorkerCoordinator *)self->_workerCoordinator stopAllBackgorundJobs];
  }
}

- (void)_handleAllBundlesCompleted
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 libraryCoordinatorFinishedJobsOnAllSubmittedBundles];
  }
}

- (void)_handleBundleComplete:(id)a3
{
  id v10 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [v10 bundle];
    uint64_t v9 = [v10 criteria];
    [v7 libraryCoordinatorFinishedJobsOnSubmittedBundle:v8 withCriteria:v9];
  }
}

- (void)_submitNextQueuedBundle
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v4 = [(NSMutableArray *)self->_pendingPhotoLibraryBundles firstObject];
  currentPhotoLibraryBundle = self->_currentPhotoLibraryBundle;
  self->_currentPhotoLibraryBundle = v4;

  char v6 = self->_currentPhotoLibraryBundle;
  os_unfair_lock_unlock(p_lock);
  id v7 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(PLPhotoLibraryBundleCriteriaTuple *)v6 bundle];
    uint64_t v9 = [v8 libraryURL];
    id v10 = [(PLPhotoLibraryBundleCriteriaTuple *)v6 criteria];
    uint64_t v11 = [v10 name];
    int v15 = 138412546;
    long long v16 = v9;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Submitted bundle %@ for criteria %@ processing", (uint8_t *)&v15, 0x16u);
  }
  workerCoordinator = self->_workerCoordinator;
  v13 = [(PLPhotoLibraryBundleCriteriaTuple *)v6 bundle];
  long long v14 = [(PLPhotoLibraryBundleCriteriaTuple *)v6 criteria];
  [(PLBackgroundJobWorkerCoordinator *)workerCoordinator submitBundleForProcessing:v13 withCriteria:v14];
}

- (void)startBackgroundJobsOnBundles:(id)a3 withCriteria:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __79__PLBackgroundJobLibraryCoordinator_startBackgroundJobsOnBundles_withCriteria___block_invoke;
  __int16 v17 = &unk_1E586D348;
  id v8 = v7;
  id v18 = v8;
  uint64_t v19 = self;
  [v6 enumerateObjectsUsingBlock:&v14];
  uint64_t v9 = self->_currentPhotoLibraryBundle;
  uint64_t v10 = [(NSMutableArray *)self->_pendingPhotoLibraryBundles count];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v11 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Added %tu bundles to the pending bundles queue", buf, 0xCu);
  }

  if (![v6 count])
  {
    v13 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_FAULT, "LibraryCoordinator asked to add 0 bundles to pending bundles queue!", buf, 2u);
    }
  }
  if (!v9 && v10) {
    [(PLBackgroundJobLibraryCoordinator *)self _submitNextQueuedBundle];
  }
}

void __79__PLBackgroundJobLibraryCoordinator_startBackgroundJobsOnBundles_withCriteria___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [[PLPhotoLibraryBundleCriteriaTuple alloc] initWithBundle:v3 withCriteria:*(void *)(a1 + 32)];

  [*(id *)(*(void *)(a1 + 40) + 16) addObject:v4];
  id v5 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16);
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Adding bundle %@ to pending bundles queue: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)pendingJobsOnBundles:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Checking all library bundles for pending jobs", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __58__PLBackgroundJobLibraryCoordinator_pendingJobsOnBundles___block_invoke;
  long long v16 = &unk_1E586D348;
  __int16 v17 = self;
  id v7 = v6;
  id v18 = v7;
  [v4 enumerateObjectsUsingBlock:&v13];

  id v8 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend(v7, "count", v13, v14, v15, v16, v17);
    uint64_t v10 = @"YES";
    if (!v9) {
      uint64_t v10 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v10;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Checked all submitted library bundles. Result: %@", buf, 0xCu);
  }

  if ([v7 count]) {
    uint64_t v11 = (void *)[v7 copy];
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

void __58__PLBackgroundJobLibraryCoordinator_pendingJobsOnBundles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 libraryURL];
  id v5 = [v4 absoluteString];

  id v6 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Checking library %@ for pending jobs", (uint8_t *)&v12, 0xCu);
  }

  id v7 = [*(id *)(*(void *)(a1 + 32) + 32) pendingJobsForBundle:v3];

  uint64_t v8 = [v7 count];
  uint64_t v9 = PLBackgroundJobServiceGetLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      int v12 = 138412290;
      uint64_t v13 = v5;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Library %@ has pending jobs", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v9 = [v7 allObjects];
    [v11 addObjectsFromArray:v9];
  }
  else if (v10)
  {
    int v12 = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Library %@ does not have pending jobs", (uint8_t *)&v12, 0xCu);
  }
}

- (BOOL)shouldDeferActivity
{
  return [(PLBackgroundJobWorkerCoordinator *)self->_workerCoordinator shouldDeferActivity];
}

- (PLBackgroundJobLibraryCoordinator)initWithWorkerCoordinator:(id)a3 statusCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLBackgroundJobLibraryCoordinator;
  uint64_t v9 = [(PLBackgroundJobLibraryCoordinator *)&v14 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_statusCenter, v8);
    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingPhotoLibraryBundles = v10->_pendingPhotoLibraryBundles;
    v10->_pendingPhotoLibraryBundles = v11;

    objc_storeStrong((id *)&v10->_workerCoordinator, a3);
    [(PLBackgroundJobWorkerCoordinator *)v10->_workerCoordinator setDelegate:v10];
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (PLBackgroundJobLibraryCoordinator)initWithWorkerCoordinator:(id)a3
{
  return [(PLBackgroundJobLibraryCoordinator *)self initWithWorkerCoordinator:a3 statusCenter:0];
}

- (PLBackgroundJobLibraryCoordinator)initWithStatusCenter:(id)a3
{
  id v4 = a3;
  id v5 = [[PLBackgroundJobWorkerCoordinator alloc] initWithWorkerCoordinatorWorkerMode:0 statusCenter:v4];
  id v6 = [(PLBackgroundJobLibraryCoordinator *)self initWithWorkerCoordinator:v5 statusCenter:v4];

  return v6;
}

@end