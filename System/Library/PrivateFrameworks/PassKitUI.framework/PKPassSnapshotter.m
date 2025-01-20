@interface PKPassSnapshotter
+ (PKPassSnapshotter)sharedInstance;
+ (void)purgeCache;
+ (void)purgeCacheOfPassSnapshotsWithUinqueID:(id)a3;
- (BOOL)_cachedImageWithKey:(id)a3 completion:(id)a4;
- (BOOL)runsInBackgroundProcess;
- (PKPassSnapshotter)init;
- (id)passLibrary;
- (void)_cacheItem:(id)a3 withKey:(id)a4;
- (void)_performSnapshot:(id)a3 size:(CGSize)a4 cacheKey:(id)a5 completion:(id)a6;
- (void)_prepareSnapshotViewWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 cacheKey:(id)a6 completion:(id)a7;
- (void)_snapshotWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 withCache:(BOOL)a6 completion:(id)a7;
- (void)dealloc;
- (void)setRunsInBackgroundProcess:(BOOL)a3;
- (void)snapshotWithPass:(id)a3 completion:(id)a4;
- (void)snapshotWithPass:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)snapshotWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 completion:(id)a6;
- (void)snapshotWithUniqueID:(id)a3 completion:(id)a4;
- (void)snapshotWithUniqueID:(id)a3 manifestHash:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (void)snapshotWithUniqueID:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)snapshotWithUniqueID:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 completion:(id)a6;
@end

@implementation PKPassSnapshotter

+ (PKPassSnapshotter)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PKPassSnapshotter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_687 != -1) {
    dispatch_once(&_MergedGlobals_687, block);
  }
  v2 = (void *)qword_1EB545CA8;

  return (PKPassSnapshotter *)v2;
}

void __35__PKPassSnapshotter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB545CA8;
  qword_1EB545CA8 = (uint64_t)v1;
}

- (PKPassSnapshotter)init
{
  v15.receiver = self;
  v15.super_class = (Class)PKPassSnapshotter;
  v2 = [(PKPassSnapshotter *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.passkit.snapshotter", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(1);
    snapshotSem = v2->_snapshotSem;
    v2->_snapshotSem = (OS_dispatch_semaphore *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentSnapshotKeys = v2->_currentSnapshotKeys;
    v2->_currentSnapshotKeys = v9;

    v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 bounds];

    v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 scale];
    v2->_scale = v13;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Pass snapshotter deallocating", buf, 2u);
  }

  v4 = self->_queue;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = self;
  dispatch_queue_t v5 = (void *)[(NSMutableArray *)self->_currentSnapshotKeys copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        v11 = _SnapshotCacheQueue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __28__PKPassSnapshotter_dealloc__block_invoke;
        block[3] = &unk_1E59CA870;
        block[4] = v10;
        objc_super v15 = v4;
        dispatch_sync(v11, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  v13.receiver = v12;
  v13.super_class = (Class)PKPassSnapshotter;
  [(PKPassSnapshotter *)&v13 dealloc];
}

void __28__PKPassSnapshotter_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = _SnapshotCompletionsByCacheKey();
  v3 = [v2 objectForKey:*(void *)(a1 + 32)];
  v4 = (void *)[v3 copy];

  if (v4)
  {
    dispatch_queue_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Calling completion blocks without an image for %{public}@", buf, 0xCu);
    }

    uint64_t v7 = _SnapshotCompletionsByCacheKey();
    [v7 removeObjectForKey:*(void *)(a1 + 32)];

    if ([v4 count])
    {
      uint64_t v8 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__PKPassSnapshotter_dealloc__block_invoke_39;
      block[3] = &unk_1E59CA7D0;
      id v10 = v4;
      dispatch_async(v8, block);
    }
  }
}

void __28__PKPassSnapshotter_dealloc__block_invoke_39(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)passLibrary
{
  passLibrary = self->_passLibrary;
  if (!passLibrary)
  {
    uint64_t v4 = [MEMORY[0x1E4F84898] sharedInstance];
    uint64_t v5 = self->_passLibrary;
    self->_passLibrary = v4;

    passLibrary = self->_passLibrary;
  }

  return passLibrary;
}

- (void)snapshotWithPass:(id)a3 completion:(id)a4
{
}

- (void)snapshotWithPass:(id)a3 size:(CGSize)a4 completion:(id)a5
{
}

- (void)snapshotWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 completion:(id)a6
{
}

- (void)snapshotWithUniqueID:(id)a3 completion:(id)a4
{
}

- (void)snapshotWithUniqueID:(id)a3 size:(CGSize)a4 completion:(id)a5
{
}

- (void)snapshotWithUniqueID:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 completion:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  id v12 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PKPassSnapshotter_snapshotWithUniqueID_size_suppressedContent_completion___block_invoke;
  v16[3] = &unk_1E59DA850;
  v16[4] = self;
  id v17 = v11;
  CGFloat v19 = width;
  CGFloat v20 = height;
  unint64_t v21 = a5;
  id v18 = v12;
  id v14 = v12;
  id v15 = v11;
  dispatch_async(queue, v16);
}

void __76__PKPassSnapshotter_snapshotWithUniqueID_size_suppressedContent_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) passLibrary];
  id v3 = [v2 passWithUniqueID:*(void *)(a1 + 40)];

  objc_msgSend(*(id *)(a1 + 32), "_snapshotWithPass:size:suppressedContent:withCache:completion:", v3, *(void *)(a1 + 72), 1, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)snapshotWithUniqueID:(id)a3 manifestHash:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = _CacheKey(v11, a4, 1911, width, height);
  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v13;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Snapshot request for %{public}@", buf, 0xCu);
  }

  if (![(PKPassSnapshotter *)self _cachedImageWithKey:v13 completion:v12])
  {
    queue = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__PKPassSnapshotter_snapshotWithUniqueID_manifestHash_size_completion___block_invoke;
    v16[3] = &unk_1E59DA850;
    v16[4] = self;
    id v17 = v11;
    CGFloat v19 = width;
    CGFloat v20 = height;
    uint64_t v21 = 1911;
    id v18 = v12;
    dispatch_async(queue, v16);
  }
}

void __71__PKPassSnapshotter_snapshotWithUniqueID_manifestHash_size_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) passLibrary];
  id v3 = [v2 passWithUniqueID:*(void *)(a1 + 40)];

  objc_msgSend(*(id *)(a1 + 32), "_snapshotWithPass:size:suppressedContent:withCache:completion:", v3, *(void *)(a1 + 72), 0, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

+ (void)purgeCache
{
  uint64_t v2 = _SnapshotCacheQueue();
  dispatch_sync(v2, &__block_literal_global_170);
}

void __31__PKPassSnapshotter_purgeCache__block_invoke()
{
  _SnapshotCache();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 removeAllObjects];
}

+ (void)purgeCacheOfPassSnapshotsWithUinqueID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _SnapshotCacheQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKPassSnapshotter_purgeCacheOfPassSnapshotsWithUinqueID___block_invoke;
  block[3] = &unk_1E59CA7D0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

void __59__PKPassSnapshotter_purgeCacheOfPassSnapshotsWithUinqueID___block_invoke(uint64_t a1)
{
  uint64_t v2 = _SnapshotCache();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKPassSnapshotter_purgeCacheOfPassSnapshotsWithUinqueID___block_invoke_2;
  v6[3] = &unk_1E59DA878;
  id v7 = *(id *)(a1 + 32);
  id v3 = [v2 keysOfEntriesPassingTest:v6];

  uint64_t v4 = _SnapshotCache();
  id v5 = [v3 allObjects];
  [v4 removeObjectsForKeys:v5];
}

uint64_t __59__PKPassSnapshotter_purgeCacheOfPassSnapshotsWithUinqueID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(a1 + 32)];
}

- (void)_snapshotWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 withCache:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  id v15 = [v13 uniqueID];
  long long v16 = [v13 manifestHash];
  id v17 = _CacheKey(v15, v16, a5, width, height);

  if (!v8 || ![(PKPassSnapshotter *)self _cachedImageWithKey:v17 completion:v14])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke;
    v18[3] = &unk_1E59DA8A0;
    id v19 = v13;
    CGFloat v20 = self;
    id v21 = v17;
    CGFloat v23 = width;
    CGFloat v24 = height;
    unint64_t v25 = a5;
    id v22 = v14;
    [v19 loadContentAsyncWithCompletion:v18];
  }
}

void __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_2;
  v4[3] = &unk_1E59DA8A0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 80);
  id v7 = *(id *)(a1 + 56);
  [v2 loadImageSetAsync:0 preheat:1 withCompletion:v4];
}

void __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = PKLogFacilityTypeGetObject();
  PKTimeProfileBegin();

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_3;
  block[3] = &unk_1E59DA8A0;
  void block[4] = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_4;
  v6[3] = &unk_1E59CE618;
  void v6[4] = v2;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_prepareSnapshotViewWithPass:size:suppressedContent:cacheKey:completion:", v3, v4, v5, v6, *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_prepareSnapshotViewWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 cacheKey:(id)a6 completion:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  long long v16 = [[PKPassView alloc] initWithPass:v15 content:5];

  [(PKPassView *)v16 setSuppressedContent:a5];
  id v17 = [MEMORY[0x1E4FB1618] clearColor];
  [(PKPassView *)v16 setBackgroundColor:v17];

  [(PKPassView *)v16 setOpaque:0];
  [(PKPassView *)v16 setModallyPresented:1];
  [(PKPassView *)v16 layoutIfNeeded];
  id v18 = [MEMORY[0x1E4FB1438] sharedApplication];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93__PKPassSnapshotter__prepareSnapshotViewWithPass_size_suppressedContent_cacheKey_completion___block_invoke;
  v22[3] = &unk_1E59DA8C8;
  v22[4] = self;
  CGFloat v23 = v16;
  CGFloat v26 = width;
  CGFloat v27 = height;
  id v24 = v13;
  id v25 = v14;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  [v18 _performBlockAfterCATransactionCommits:v22];
}

uint64_t __93__PKPassSnapshotter__prepareSnapshotViewWithPass_size_suppressedContent_cacheKey_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSnapshot:size:cacheKey:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)_performSnapshot:(id)a3 size:(CGSize)a4 cacheKey:(id)a5 completion:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1A6224460]();
  id v15 = [v11 snapshotOfPassView];
  CGImageRef v16 = CGImageRetain((CGImageRef)[v15 CGImage]);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_snapshotSem);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPassSnapshotter__performSnapshot_size_cacheKey_completion___block_invoke;
  block[3] = &unk_1E59DA8A0;
  CGFloat v26 = width;
  CGFloat v27 = height;
  CGImageRef v28 = v16;
  id v22 = v15;
  CGFloat v23 = self;
  id v18 = v12;
  id v24 = v18;
  id v19 = v13;
  id v25 = v19;
  id v20 = v15;
  dispatch_async(queue, block);
}

void __63__PKPassSnapshotter__performSnapshot_size_cacheKey_completion___block_invoke(uint64_t a1)
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*(double *)(a1 + 64) == *MEMORY[0x1E4F1DB30] && *(double *)(a1 + 72) == v3)
  {
    Image = CGImageRetain(*(CGImageRef *)(a1 + 80));
    id v24 = *(id *)(a1 + 32);
  }
  else
  {
    Image = 0;
    id v6 = *(CGImage **)(a1 + 80);
    if (v6)
    {
      double v7 = *(double *)(*(void *)(a1 + 40) + 32);
      if (v7 > 0.0)
      {
        double v8 = (double)CGImageGetWidth(*(CGImageRef *)(a1 + 80)) / v7;
        double v9 = (double)CGImageGetHeight(v6) / v7;
        if (v8 == v2 && v9 == v3)
        {
          Image = 0;
        }
        else
        {
          PKSizeScaleAspectFit();
          if (v8 == v11 && v9 == v12)
          {
            Image = CGImageRetain(v6);
          }
          else
          {
            CGFloat v14 = v11;
            CGFloat v15 = v12;
            float v16 = v7 * v11;
            size_t v17 = vcvtps_u32_f32(v16);
            float v18 = v7 * v12;
            size_t v19 = vcvtps_u32_f32(v18);
            size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
            uint32_t BitmapInfo = CGImageGetBitmapInfo(v6);
            ColorSpace = CGImageGetColorSpace(v6);
            CGFloat v23 = CGBitmapContextCreate(0, v17, v19, 8uLL, AlignedBytesPerRow, ColorSpace, BitmapInfo);
            v32.size.CGFloat width = (double)v17;
            v32.size.CGFloat height = (double)v19;
            v32.origin.x = 0.0;
            v32.origin.y = 0.0;
            CGContextClearRect(v23, v32);
            CGContextScaleCTM(v23, v7, v7);
            CGContextGetCTM(&v31, v23);
            CGContextSetBaseCTM();
            v33.origin.x = 0.0;
            v33.origin.y = 0.0;
            v33.size.CGFloat width = v14;
            v33.size.CGFloat height = v15;
            CGContextDrawImage(v23, v33, v6);
            Image = CGBitmapContextCreateImage(v23);
            CGContextRelease(v23);
          }
        }
      }
    }
    id v24 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image scale:0 orientation:*(double *)(*(void *)(a1 + 40) + 32)];
  }
  id v25 = v24;
  if (Image)
  {
    CGFloat v26 = [PKPassSnapshotCacheItem alloc];
    [v25 scale];
    CGFloat v27 = -[PKPassSnapshotCacheItem initWithCGImage:scale:](v26, "initWithCGImage:scale:", Image);
    [*(id *)(a1 + 40) _cacheItem:v27 withKey:*(void *)(a1 + 48)];
  }
  CGImageRelease(Image);
  CGImageRelease(*(CGImageRef *)(a1 + 80));
  CGImageRef v28 = PKLogFacilityTypeGetObject();
  id v29 = (id)PKTimeProfileEnd();

  uint64_t v30 = *(void *)(a1 + 56);
  if (v30) {
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v25);
  }
}

- (void)_cacheItem:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = _SnapshotCacheQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PKPassSnapshotter__cacheItem_withKey___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v12 = v6;
  id v13 = v7;
  CGFloat v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __40__PKPassSnapshotter__cacheItem_withKey___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v2 = _SnapshotCache();
  [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

  double v3 = _SnapshotCompletionsByCacheKey();
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = (void *)[v4 copy];

  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v7;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Calling completion blocks for %{public}@", buf, 0xCu);
    }

    double v8 = _SnapshotCompletionsByCacheKey();
    [v8 removeObjectForKey:*(void *)(a1 + 40)];

    if ([v5 count])
    {
      id v9 = [*(id *)(a1 + 32) UIImageFromCache];
      id v10 = *(NSObject **)(*(void *)(a1 + 48) + 8);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      CGFloat v14 = __40__PKPassSnapshotter__cacheItem_withKey___block_invoke_50;
      CGFloat v15 = &unk_1E59CA870;
      id v16 = v5;
      id v17 = v9;
      id v11 = v9;
      dispatch_async(v10, &v12);
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 40), "removeObject:", *(void *)(a1 + 40), v12, v13, v14, v15);
  }
}

void __40__PKPassSnapshotter__cacheItem_withKey___block_invoke_50(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)_cachedImageWithKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  long long v8 = (void *)[v7 copy];

  long long v9 = _SnapshotCacheQueue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__PKPassSnapshotter__cachedImageWithKey_completion___block_invoke;
  v13[3] = &unk_1E59CECD8;
  id v14 = v6;
  CGFloat v15 = self;
  id v16 = v8;
  id v17 = &v18;
  id v10 = v8;
  id v11 = v6;
  dispatch_sync(v9, v13);

  LOBYTE(v8) = *((unsigned char *)v19 + 24) == 0;
  _Block_object_dispose(&v18, 8);
  return (char)v8;
}

void __52__PKPassSnapshotter__cachedImageWithKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _SnapshotCache();
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 32)];

  if (v3)
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Image in cache, calling completion for %{public}@", buf, 0xCu);
    }

    id v6 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__PKPassSnapshotter__cachedImageWithKey_completion___block_invoke_51;
    v12[3] = &unk_1E59CAD68;
    id v14 = *(id *)(a1 + 48);
    id v13 = v3;
    dispatch_async(v6, v12);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    id v7 = _SnapshotCompletionsByCacheKey();
    id v8 = [v7 objectForKey:*(void *)(a1 + 32)];

    if (v8)
    {
      long long v9 = _Block_copy(*(const void **)(a1 + 48));
      [v8 addObject:v9];

      char v10 = 0;
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v11 = _SnapshotCompletionsByCacheKey();
      [v11 setObject:v8 forKey:*(void *)(a1 + 32)];

      if (([*(id *)(*(void *)(a1 + 40) + 40) containsObject:*(void *)(a1 + 32)] & 1) == 0) {
        [*(id *)(*(void *)(a1 + 40) + 40) addObject:*(void *)(a1 + 32)];
      }
      char v10 = 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
  }
}

void __52__PKPassSnapshotter__cachedImageWithKey_completion___block_invoke_51(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) UIImageFromCache];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)runsInBackgroundProcess
{
  return self->_runsInBackgroundProcess;
}

- (void)setRunsInBackgroundProcess:(BOOL)a3
{
  self->_runsInBackgroundProcess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSnapshotKeys, 0);
  objc_storeStrong((id *)&self->_snapshotSem, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end