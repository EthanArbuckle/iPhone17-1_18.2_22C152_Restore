@interface TabSnapshotCacheStressTestRunner
- (BOOL)tabSnapshotCacheShouldDeferNextSnapshotRequest:(id)a3;
- (NSMutableOrderedSet)currentUUIDs;
- (TabSnapshotCache)cache;
- (TabSnapshotCacheStressTestRunnerDelegate)delegate;
- (id)_mutableOrderedSetOfUUIDsWithCount:(unint64_t)a3;
- (id)_mutatedUUIDsFromUUIDs:(id)a3;
- (id)snapshotsToPersistOnDiskForTabSnapshotCache:(id)a3;
- (unint64_t)cachesUntilNextIteration;
- (unint64_t)capacityForTabSnapshotCache:(id)a3;
- (unint64_t)iterations;
- (unint64_t)maxIterations;
- (void)_runIteration;
- (void)setCache:(id)a3;
- (void)setCachesUntilNextIteration:(unint64_t)a3;
- (void)setCurrentUUIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIterations:(unint64_t)a3;
- (void)setMaxIterations:(unint64_t)a3;
- (void)start;
- (void)tabSnapshotCache:(id)a3 didCacheSnapshotWithIdentifier:(id)a4;
- (void)tabSnapshotCache:(id)a3 requestSnapshotWithIdentifier:(id)a4 completion:(id)a5;
@end

@implementation TabSnapshotCacheStressTestRunner

- (id)_mutableOrderedSetOfUUIDsWithCount:(unint64_t)a3
{
  for (i = [MEMORY[0x1E4F1CA70] orderedSet];
  {
    v5 = [MEMORY[0x1E4F29128] UUID];
    [i addObject:v5];
  }
  return i;
}

- (void)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!start_temporaryCacheDirectoryURL)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [v3 temporaryDirectory];
    v5 = [MEMORY[0x1E4F28F80] processInfo];
    v6 = [v5 globallyUniqueString];
    uint64_t v7 = [v4 URLByAppendingPathComponent:v6 isDirectory:1];
    v8 = (void *)start_temporaryCacheDirectoryURL;
    start_temporaryCacheDirectoryURL = v7;
  }
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [(id)start_temporaryCacheDirectoryURL absoluteString];
  objc_msgSend(v9, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v10, 0);

  v11 = [TabSnapshotCache alloc];
  v12 = [(TabSnapshotCache *)v11 initWithThumbnailCacheDirectoryURL:start_temporaryCacheDirectoryURL];
  cache = self->_cache;
  self->_cache = v12;

  srand(1u);
  v14 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unint64_t iterations = self->_iterations;
    int v16 = 134217984;
    unint64_t v17 = iterations;
    _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_INFO, "TabSnapshotCacheStressTest starting with %lu iterations", (uint8_t *)&v16, 0xCu);
  }
  [(TabSnapshotCacheStressTestRunner *)self _runIteration];
}

- (id)_mutatedUUIDsFromUUIDs:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v5 count];
    uint64_t v7 = rand() % v6;
    uint64_t v8 = rand() % (v6 - v7);
    v9 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithOrderedSet:range:copyItems:", v5, v7, v8, 0);
    v10 = [(TabSnapshotCacheStressTestRunner *)self _mutableOrderedSetOfUUIDsWithCount:rand() % (501 - v8)];
    [v9 unionOrderedSet:v10];
  }
  else
  {
    v9 = [(TabSnapshotCacheStressTestRunner *)self _mutableOrderedSetOfUUIDsWithCount:rand() % 501];
  }

  return v9;
}

- (void)_runIteration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->_iterations + 1;
  self->_unint64_t iterations = v3;
  unint64_t maxIterations = self->_maxIterations;
  v5 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3 <= maxIterations)
  {
    if (v6)
    {
      unint64_t iterations = self->_iterations;
      int v12 = 134217984;
      unint64_t v13 = iterations;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "TabSnapshotCacheStressTest iteration %lu", (uint8_t *)&v12, 0xCu);
    }
    v9 = [(TabSnapshotCacheStressTestRunner *)self _mutatedUUIDsFromUUIDs:self->_currentUUIDs];
    currentUUIDs = self->_currentUUIDs;
    self->_currentUUIDs = v9;

    [(TabSnapshotCache *)self->_cache setIdentifiersToCache:self->_currentUUIDs forDelegate:self];
    [(TabSnapshotCache *)self->_cache setUpdating:1 forDelegate:self];
    uint64_t v11 = [(NSMutableOrderedSet *)self->_currentUUIDs count];
    self->_cachesUntilNextIteration = rand() % v11 + 1;
  }
  else
  {
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "TabSnapshotCacheStressTest finished", (uint8_t *)&v12, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tabSnapshotCacheStressTestRunnerDidFinish:self];
  }
}

- (void)tabSnapshotCache:(id)a3 didCacheSnapshotWithIdentifier:(id)a4
{
  unint64_t cachesUntilNextIteration = self->_cachesUntilNextIteration;
  if (cachesUntilNextIteration) {
    self->_unint64_t cachesUntilNextIteration = cachesUntilNextIteration - 1;
  }
  else {
    [(TabSnapshotCacheStressTestRunner *)self _runIteration];
  }
}

- (void)tabSnapshotCache:(id)a3 requestSnapshotWithIdentifier:(id)a4 completion:(id)a5
{
  id v5 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__TabSnapshotCacheStressTestRunner_tabSnapshotCache_requestSnapshotWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E6D77E70;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __94__TabSnapshotCacheStressTestRunner_tabSnapshotCache_requestSnapshotWithIdentifier_completion___block_invoke(uint64_t a1)
{
  v6.width = 1024.0;
  v6.height = 768.0;
  UIGraphicsBeginImageContext(v6);
  v2 = [MEMORY[0x1E4FB1618] purpleColor];
  [v2 set];

  CurrentContext = UIGraphicsGetCurrentContext();
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1024.0;
  v7.size.height = 768.0;
  CGContextFillRect(CurrentContext, v7);
  UIGraphicsGetImageFromCurrentImageContext();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)snapshotsToPersistOnDiskForTabSnapshotCache:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

- (BOOL)tabSnapshotCacheShouldDeferNextSnapshotRequest:(id)a3
{
  return 0;
}

- (unint64_t)capacityForTabSnapshotCache:(id)a3
{
  return 0x8000000;
}

- (unint64_t)maxIterations
{
  return self->_maxIterations;
}

- (void)setMaxIterations:(unint64_t)a3
{
  self->_unint64_t maxIterations = a3;
}

- (TabSnapshotCacheStressTestRunnerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabSnapshotCacheStressTestRunnerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TabSnapshotCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSMutableOrderedSet)currentUUIDs
{
  return self->_currentUUIDs;
}

- (void)setCurrentUUIDs:(id)a3
{
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_unint64_t iterations = a3;
}

- (unint64_t)cachesUntilNextIteration
{
  return self->_cachesUntilNextIteration;
}

- (void)setCachesUntilNextIteration:(unint64_t)a3
{
  self->_unint64_t cachesUntilNextIteration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUUIDs, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end