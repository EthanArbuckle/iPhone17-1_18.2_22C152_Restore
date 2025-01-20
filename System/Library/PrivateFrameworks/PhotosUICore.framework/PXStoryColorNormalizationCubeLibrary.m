@interface PXStoryColorNormalizationCubeLibrary
+ (PXStoryColorNormalizationCubeLibrary)sharedInstance;
- (BOOL)_isRequestActive:(int64_t)a3;
- (PXStoryColorNormalizationCubeLibrary)init;
- (PXStoryColorNormalizationCubeLibrary)initWithColorSpace:(CGColorSpace *)a3;
- (int64_t)requestColorCubeForAssetNormalization:(id)a3 completionHandler:(id)a4;
- (void)_cacheColorCube:(id)a3 forAssetNormalization:(id)a4;
- (void)_queue_performRequestWithID:(int64_t)a3 forAssetNormalization:(id)a4 completionHandler:(id)a5;
- (void)cancelRequest:(int64_t)a3;
- (void)dealloc;
@end

@implementation PXStoryColorNormalizationCubeLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_aliveCubesByAssetNormalization, 0);
  objc_storeStrong((id *)&self->_lock_cubeByAssetNormalization, 0);
  objc_storeStrong((id *)&self->_lock_activeRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_performRequestWithID:(int64_t)a3 forAssetNormalization:(id)a4 completionHandler:(id)a5
{
  id v15 = a4;
  v9 = (void (**)(id, void *, uint64_t, int64_t))a5;
  if ([(PXStoryColorNormalizationCubeLibrary *)self _isRequestActive:a3])
  {
    v10 = +[PXStoryColorNormalizationAdjustment colorCubeForNormalization:v15 targetColorSpace:self->_colorspace];
    if (!v10)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXStoryColorNormalizationCubeLibrary.m", 150, @"Unable to create colorCubeData for assetNormalization:%@", v15 object file lineNumber description];
    }
    v11 = (void *)[objc_alloc((Class)off_1E5DA6BC0) initWithData:v10 edgeSize:self->_cubeEdgeSize pixelFormat:70];
    if (!v11)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[PXStoryColorNormalizationCubeLibrary _queue_performRequestWithID:forAssetNormalization:completionHandler:]"];
      [v13 handleFailureInFunction:v14, @"PXStoryColorNormalizationCubeLibrary.m", 153, @"Unable to create cube for %@ data:%@", v15, v10 file lineNumber description];
    }
    [(PXStoryColorNormalizationCubeLibrary *)self _cacheColorCube:v11 forAssetNormalization:v15];
    v9[2](v9, v11, 2, a3);
  }
}

- (void)_cacheColorCube:(id)a3 forAssetNormalization:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->_lock_aliveCubesByAssetNormalization setObject:v8 forKey:v7];
  [(NSCache *)self->_lock_cubeByAssetNormalization setObject:v8 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_isRequestActive:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a3) = [(NSMutableIndexSet *)self->_lock_activeRequests containsIndex:a3];
  os_unfair_lock_unlock(p_lock);
  return a3;
}

- (int64_t)requestColorCubeForAssetNormalization:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, uint64_t, int64_t))a4;
  os_unfair_lock_lock(&self->_lock);
  int64_t add = (int)atomic_fetch_add(_makeNextTextureRequestID_lastRequestID, 1u);
  [(NSMutableIndexSet *)self->_lock_activeRequests addIndex:add];
  if (v6)
  {
    v9 = [(NSCache *)self->_lock_cubeByAssetNormalization objectForKey:v6];
    if (!v9)
    {
      v9 = [(NSMapTable *)self->_lock_aliveCubesByAssetNormalization objectForKey:v6];
      if (v9) {
        [(NSCache *)self->_lock_cubeByAssetNormalization setObject:v9 forKey:v6];
      }
    }
  }
  else
  {
    v9 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v6) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t v11 = !v10;
  v7[2](v7, v9, v11, add);
  if ((v11 & 1) == 0)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__PXStoryColorNormalizationCubeLibrary_requestColorCubeForAssetNormalization_completionHandler___block_invoke;
    block[3] = &unk_1E5DC9D68;
    objc_copyWeak(v17, &location);
    v17[1] = (id)add;
    id v15 = v6;
    v16 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

  return add;
}

void __96__PXStoryColorNormalizationCubeLibrary_requestColorCubeForAssetNormalization_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_performRequestWithID:forAssetNormalization:completionHandler:", *(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)cancelRequest:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableIndexSet *)self->_lock_activeRequests removeIndex:a3];
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_colorspace);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryColorNormalizationCubeLibrary;
  [(PXStoryColorNormalizationCubeLibrary *)&v3 dealloc];
}

- (PXStoryColorNormalizationCubeLibrary)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryColorNormalizationCubeLibrary.m", 78, @"%s is not available as initializer", "-[PXStoryColorNormalizationCubeLibrary init]");

  abort();
}

- (PXStoryColorNormalizationCubeLibrary)initWithColorSpace:(CGColorSpace *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PXStoryColorNormalizationCubeLibrary;
  v4 = [(PXStoryColorNormalizationCubeLibrary *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.photos.color-normalization-cube-library", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    BOOL v10 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    lock_activeRequests = v5->_lock_activeRequests;
    v5->_lock_activeRequests = v10;

    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    lock_cubeByAssetNormalization = v5->_lock_cubeByAssetNormalization;
    v5->_lock_cubeByAssetNormalization = v12;

    [(NSCache *)v5->_lock_cubeByAssetNormalization setCountLimit:150];
    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    lock_aliveCubesByAssetNormalization = v5->_lock_aliveCubesByAssetNormalization;
    v5->_lock_aliveCubesByAssetNormalization = (NSMapTable *)v14;

    v16 = +[PXStorySettings sharedInstance];
    v5->_cubeEdgeSize = [v16 colorNormalizationCubeEdgeSize];

    v5->_colorspace = CGColorSpaceRetain(a3);
  }
  return v5;
}

+ (PXStoryColorNormalizationCubeLibrary)sharedInstance
{
  if (sharedInstance_onceToken_242813 != -1) {
    dispatch_once(&sharedInstance_onceToken_242813, &__block_literal_global_242814);
  }
  v2 = (void *)sharedInstance_sharedInstance_242815;
  return (PXStoryColorNormalizationCubeLibrary *)v2;
}

void __54__PXStoryColorNormalizationCubeLibrary_sharedInstance__block_invoke()
{
}

@end