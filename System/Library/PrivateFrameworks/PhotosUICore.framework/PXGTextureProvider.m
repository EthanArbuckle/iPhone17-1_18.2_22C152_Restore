@interface PXGTextureProvider
- ($1A6826BF57289069BF3D0425E726B057)imageDataSpecAtIndex:(SEL)a3;
- ($EDEBC7EA21717A15148E9A8A98906629)interactionState;
- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode;
- (BOOL)canDeliverThumbnailData;
- (BOOL)isRequestActive:(int)a3;
- (BOOL)lowMemoryMode;
- (BOOL)preferBGRA;
- (BOOL)preferMipmaps;
- (NSIndexSet)requestIDsInTargetRect;
- (OS_dispatch_queue)layoutQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)requestQueue;
- (OS_dispatch_queue)workQueue;
- (PXGTextureProvider)init;
- (PXGTextureProviderDelegate)delegate;
- (PXGViewEnvironment)viewEnvironment;
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (id)requestRenderSnapshot:(id *)a3 offscreenEffect:(id)a4;
- (id)textureAtlasManagerAtSpecIndex:(int64_t)a3;
- (int64_t)registerImageDataSpec:(id *)a3;
- (int64_t)requestQueue_indexForImageDataSpec:(id *)a3;
- (unint64_t)preferredColorSpaceName;
- (void)cancelTextureRequestDeferred:(int)a3;
- (void)cancelTextureRequests:(id)a3;
- (void)clearTextureAtlasManagerCache;
- (void)dealloc;
- (void)performDeferredCancellations;
- (void)prepareImageDataSpecs;
- (void)provideCGImage:(CGImage *)a3 forRequestID:(int)a4;
- (void)provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 forRequestID:(int)a6;
- (void)provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 forRequestID:(int)a7;
- (void)provideCGImage:(CGImage *)a3 options:(id)a4 forRequestID:(int)a5;
- (void)provideCGImage:(CGImage *)a3 options:(id)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6;
- (void)provideFailureWithError:(id)a3 forRequestID:(int)a4;
- (void)provideImageData:(id)a3 withSpecAtIndex:(int64_t)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7 forRequestID:(int)a8;
- (void)provideNothingForRequestID:(int)a3;
- (void)providePayload:(id)a3 forRequestID:(int)a4;
- (void)providePixelBuffer:(__CVBuffer *)a3 options:(id)a4 adjustment:(id)a5 forRequestID:(int)a6;
- (void)providePixelBuffer:(__CVBuffer *)a3 options:(id)a4 forRequestID:(int)a5;
- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3;
- (void)setCanDeliverThumbnailData:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInteractionState:(id *)a3;
- (void)setLayoutQueue:(id)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setNeedsRegisterToDisplayLinkUpdates;
- (void)setNeedsUnregisterFromDisplayLinkUpdates;
- (void)setPreferBGRA:(BOOL)a3;
- (void)setPreferMipmaps:(BOOL)a3;
- (void)setPreferredColorSpaceName:(unint64_t)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setRequestIDsInTargetRect:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setTextureAtlasManager:(id)a3 atSpecIndex:(int64_t)a4;
- (void)setViewEnvironment:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation PXGTextureProvider

- (void)provideNothingForRequestID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(PXGTextureProvider *)self requestQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PXGTextureProvider *)self delegate];
  [v6 textureProvider:self didProvideNothingForRequestID:v3];
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (PXGTextureProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGTextureProviderDelegate *)WeakRetained;
}

- (BOOL)isRequestActive:(int)a3
{
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  LOBYTE(a3) = [(NSMutableIndexSet *)self->_lookupLock_activeRequests containsIndex:a3];
  os_unfair_lock_unlock(p_lookupLock);
  return a3;
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  NSUInteger length = a3.length;
  NSUInteger add = (int)atomic_fetch_add(PXMakeNextTextureRequestIDRange_lastRequestID, a3.length);
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  -[NSMutableIndexSet addIndexesInRange:](self->_lookupLock_activeRequests, "addIndexesInRange:", add, length);
  os_unfair_lock_unlock(p_lookupLock);
  NSUInteger v11 = add;
  NSUInteger v12 = length;
  result.NSUInteger length = v12;
  result.location = v11;
  return result;
}

- (void)cancelTextureRequestDeferred:(int)a3
{
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (void)provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 forRequestID:(int)a7
{
  BOOL v7 = a6;
  v9 = *(_OWORD **)&a4.var0;
  id v13 = *(id *)&a4.var2;
  if (!a3)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXGTextureProvider.m", 144, @"Invalid parameter not satisfying: %@", @"imageRef != nil" object file lineNumber description];
  }
  v14 = [(PXGTextureProvider *)self requestQueue];
  dispatch_assert_queue_V2(v14);

  v15 = [(PXGTextureProvider *)self delegate];
  long long v16 = v9[1];
  v18[0] = *v9;
  v18[1] = v16;
  [v15 textureProvider:self didProvideCGImage:a3 options:v18 adjustment:v13 isDegraded:a5 forRequestID:v7];
}

- (int64_t)requestQueue_indexForImageDataSpec:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  var1 = a3->var1;
  int var2 = a3->var2;
  int var3 = a3->var3;
  if (self->_lastImageDataSpec.pixelFormat == a3->var0
    && self->_lastImageDataSpec.colorSpaceName == var1
    && self->_lastImageDataSpec.width == var2
    && self->_lastImageDataSpec.height == var3)
  {
    return self->_lastImageDataSpecIndex;
  }
  int64_t imageDataSpecsCount = self->_imageDataSpecsCount;
  if (imageDataSpecsCount < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t result = 0;
  for (i = &self->_imageDataSpecs->var2; ; i += 10)
  {
    BOOL v14 = *((void *)i - 2) == a3->var0 && *((void *)i - 1) == (void)var1;
    BOOL v15 = v14 && *i == var2;
    if (v15 && i[1] == var3) {
      break;
    }
    if (imageDataSpecsCount == ++result) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  long long v17 = *(_OWORD *)&a3->var0;
  *(_DWORD *)&self->_lastImageDataSpec.width = *(_DWORD *)&a3->var2;
  *(_OWORD *)&self->_lastImageDataSpec.pixelFormat = v17;
  self->_lastImageDataSpecIndex = result;
  return result;
}

- (void)provideImageData:(id)a3 withSpecAtIndex:(int64_t)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7 forRequestID:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v14 = a5.height;
  double v15 = a5.width;
  id v21 = a3;
  if (!v21)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXGTextureProvider.m", 166, @"Invalid parameter not satisfying: %@", @"imageData != nil" object file lineNumber description];
  }
  v19 = [(PXGTextureProvider *)self delegate];
  objc_msgSend(v19, "textureProvider:didProvideImageData:withSpecAtIndex:size:bytesPerRow:contentsRect:forRequestID:", self, v21, a4, a6, v8, v15, v14, x, y, width, height);
}

- (id)textureAtlasManagerAtSpecIndex:(int64_t)a3
{
  return self->_textureAtlasManagers[a3];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)preferMipmaps
{
  return self->_preferMipmaps;
}

- (void)setTextureAtlasManager:(id)a3 atSpecIndex:(int64_t)a4
{
  self->_textureAtlasManagers[a4] = a3;
}

- ($1A6826BF57289069BF3D0425E726B057)imageDataSpecAtIndex:(SEL)a3
{
  *retstr = *($1A6826BF57289069BF3D0425E726B057 *)(self[1].var0 + 20 * a4);
  return self;
}

- (void)setViewEnvironment:(id)a3
{
  NSUInteger v11 = (PXGViewEnvironment *)a3;
  v4 = self->_viewEnvironment;
  v5 = v11;
  if (v4 != v11)
  {
    id v6 = v4;
    BOOL v7 = [(PXGViewEnvironment *)v4 isEqual:v11];

    if (v7) {
      goto LABEL_5;
    }
    viewEnvironment = self->_viewEnvironment;
    v9 = v11;
    v10 = self->_viewEnvironment;
    self->_viewEnvironment = v9;
    v5 = viewEnvironment;

    [(PXGTextureProvider *)self viewEnvironmentDidChange:v5];
  }

LABEL_5:
}

- (void)setInteractionState:(id *)a3
{
  p_interactionState = &self->_interactionState;
  if (self->_interactionState.scrollRegime != a3->var0
    || self->_interactionState.isAnimatingScrollTowardsEdge != a3->var1
    || self->_interactionState.isScrubbing != a3->var2
    || self->_interactionState.isAnimatingContent != a3->var3
    || self->_interactionState.contentChangeTrend != a3->var4
    || self->_interactionState.isViewBoundsChanging != a3->var5
    || self->_interactionState.isInitialLoad != a3->var6
    || self->_interactionState.isVisible != a3->var7
    || !CGRectEqualToRect(self->_interactionState.targetRect, a3->var8))
  {
    long long v6 = *(_OWORD *)&p_interactionState->contentChangeTrend;
    v11[0] = *(_OWORD *)&p_interactionState->scrollRegime;
    v11[1] = v6;
    CGSize size = p_interactionState->targetRect.size;
    v11[2] = p_interactionState->targetRect.origin;
    v11[3] = size;
    CGSize v8 = a3->var8.size;
    long long v10 = *(_OWORD *)&a3->var0;
    long long v9 = *(_OWORD *)&a3->var4;
    p_interactionState->targetRect.origin = a3->var8.origin;
    p_interactionState->targetRect.CGSize size = v8;
    *(_OWORD *)&p_interactionState->scrollRegime = v10;
    *(_OWORD *)&p_interactionState->contentChangeTrend = v9;
    [(PXGTextureProvider *)self interactionStateDidChange:v11];
  }
}

- (void)setRequestIDsInTargetRect:(id)a3
{
}

- (void)performDeferredCancellations
{
  if ([(NSMutableIndexSet *)self->_requestIDsPendingCancellation count])
  {
    id v3 = (id)[(NSMutableIndexSet *)self->_requestIDsPendingCancellation copy];
    [(NSMutableIndexSet *)self->_requestIDsPendingCancellation removeAllIndexes];
    [(PXGTextureProvider *)self cancelTextureRequests:v3];
  }
}

- ($EDEBC7EA21717A15148E9A8A98906629)interactionState
{
  long long v3 = *(_OWORD *)&self[2].var8.size.height;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var8.origin.y;
  *(_OWORD *)&retstr->var4 = v3;
  CGSize v4 = *(CGSize *)&self[3].var5;
  retstr->var8.origin = *(CGPoint *)&self[3].var1;
  retstr->var8.CGSize size = v4;
  return self;
}

- (NSIndexSet)requestIDsInTargetRect
{
  return self->_requestIDsInTargetRect;
}

- (void)cancelTextureRequests:(id)a3
{
  p_lookupLock = &self->_lookupLock;
  id v5 = a3;
  os_unfair_lock_lock(p_lookupLock);
  [(NSMutableIndexSet *)self->_lookupLock_activeRequests removeIndexes:v5];

  os_unfair_lock_unlock(p_lookupLock);
}

- (void)setLayoutQueue:(id)a3
{
}

- (void)setPreferredColorSpaceName:(unint64_t)a3
{
  self->_preferredColorSpaceName = a3;
}

- (void)setPreferMipmaps:(BOOL)a3
{
  self->_preferMipmaps = a3;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  if (self->_lowMemoryMode != a3)
  {
    self->_lowMemoryMode = a3;
    [(PXGTextureProvider *)self lowMemoryModeDidChange];
  }
}

- (void)setCanDeliverThumbnailData:(BOOL)a3
{
  self->_canDeliverThumbnailData = a3;
}

- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3
{
  self->_allowLargerImagesDuringScrollingInLowMemoryMode = a3;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setRequestQueue:(id)a3
{
}

- (void)setProcessingQueue:(id)a3
{
}

- (void)setPreferBGRA:(BOOL)a3
{
  self->_preferBGRA = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)prepareImageDataSpecs
{
}

- (BOOL)canDeliverThumbnailData
{
  return self->_canDeliverThumbnailData;
}

- (PXGTextureProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXGTextureProvider;
  v2 = [(PXGTextureProvider *)&v9 init];
  long long v3 = v2;
  if (v2)
  {
    v2->_lookupLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E60] indexSet];
    lookupLock_activeRequests = v3->_lookupLock_activeRequests;
    v3->_lookupLock_activeRequests = (NSMutableIndexSet *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
    requestIDsPendingCancellation = v3->_requestIDsPendingCancellation;
    v3->_requestIDsPendingCancellation = (NSMutableIndexSet *)v6;

    v3->_canDeliverThumbnailData = 1;
    v3->_preferredColorSpaceName = 12;
  }
  return v3;
}

- (int64_t)registerImageDataSpec:(id *)a3
{
  id v5 = [(PXGTextureProvider *)self layoutQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t imageDataSpecsCount = self->_imageDataSpecsCount;
  if (imageDataSpecsCount < 1)
  {
LABEL_14:
    self->_uint64_t imageDataSpecsCount = imageDataSpecsCount + 1;
    imageDataSpecsCapacitdouble y = self->_imageDataSpecsCapacity;
    if (imageDataSpecsCount >= imageDataSpecsCapacity)
    {
      if (!imageDataSpecsCapacity)
      {
        imageDataSpecsCapacitdouble y = 10;
        self->_imageDataSpecsCapacitdouble y = 10;
      }
      if (imageDataSpecsCapacity <= imageDataSpecsCount)
      {
        do
          imageDataSpecsCapacity *= 2;
        while (imageDataSpecsCapacity <= imageDataSpecsCount);
        self->_imageDataSpecsCapacitdouble y = imageDataSpecsCapacity;
      }
      _PXGArrayResize();
    }
    id v13 = (char *)self->_imageDataSpecs + 20 * imageDataSpecsCount;
    long long v14 = *(_OWORD *)&a3->var0;
    *((_DWORD *)v13 + 4) = *(_DWORD *)&a3->var2;
    *(_OWORD *)id v13 = v14;
    self->_textureAtlasManagers[imageDataSpecsCount] = 0;
  }
  else
  {
    int64_t v7 = 0;
    p_int var2 = &self->_imageDataSpecs->var2;
    while (1)
    {
      BOOL v9 = *((void *)p_var2 - 2) == a3->var0 && (__CFString *)*((void *)p_var2 - 1) == a3->var1;
      BOOL v10 = v9 && *p_var2 == a3->var2;
      if (v10 && p_var2[1] == a3->var3) {
        return v7;
      }
      p_var2 += 10;
      if (imageDataSpecsCount == ++v7) {
        goto LABEL_14;
      }
    }
  }
  return imageDataSpecsCount;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)provideCGImage:(CGImage *)a3 forRequestID:(int)a4
{
  long long v4 = *((_OWORD *)off_1E5DAAFA8 + 1);
  v5[0] = *(_OWORD *)off_1E5DAAFA8;
  v5[1] = v4;
  [(PXGTextureProvider *)self provideCGImage:a3 options:v5 forRequestID:*(void *)&a4];
}

- (void)provideCGImage:(CGImage *)a3 options:(id)a4 forRequestID:(int)a5
{
  long long v5 = *(_OWORD *)(*(void *)&a4.var0 + 16);
  v6[0] = *(_OWORD *)*(void *)&a4.var0;
  v6[1] = v5;
  [(PXGTextureProvider *)self provideCGImage:a3 options:v6 isDegraded:0 forRequestID:*(void *)&a4.var2];
}

- (void)provideCGImage:(CGImage *)a3 options:(id)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6
{
  long long v6 = *(_OWORD *)(*(void *)&a4.var0 + 16);
  v7[0] = *(_OWORD *)*(void *)&a4.var0;
  v7[1] = v6;
  [(PXGTextureProvider *)self provideCGImage:a3 options:v7 adjustment:0 isDegraded:0 forRequestID:a5];
}

- (void)providePayload:(id)a3 forRequestID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int64_t v7 = [(PXGTextureProvider *)self requestQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(PXGTextureProvider *)self delegate];
  [v8 textureProvider:self didProvidePayload:v6 forRequestID:v4];
}

- (BOOL)preferBGRA
{
  return self->_preferBGRA;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_requestIDsInTargetRect, 0);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong((id *)&self->_requestIDsPendingCancellation, 0);
  objc_storeStrong((id *)&self->_lookupLock_activeRequests, 0);
}

- (unint64_t)preferredColorSpaceName
{
  return self->_preferredColorSpaceName;
}

- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode
{
  return self->_allowLargerImagesDuringScrollingInLowMemoryMode;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)clearTextureAtlasManagerCache
{
  imageDataSpecsCapacitdouble y = self->_imageDataSpecsCapacity;
  if (imageDataSpecsCapacity >= 1)
  {
    for (uint64_t i = 0; i != imageDataSpecsCapacity; ++i)
      self->_textureAtlasManagers[i] = 0;
  }
}

- (id)requestRenderSnapshot:(id *)a3 offscreenEffect:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(PXGTextureProvider *)self delegate];
  long long v8 = *(_OWORD *)&a3->var1.origin.y;
  v11[0] = *(_OWORD *)&a3->var0;
  v11[1] = v8;
  CGFloat height = a3->var1.size.height;
  BOOL v9 = [v7 textureProvider:self requestRenderSnapshot:v11 offscreenEffect:v6];

  return v9;
}

- (void)setNeedsUnregisterFromDisplayLinkUpdates
{
  long long v3 = [(PXGTextureProvider *)self requestQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PXGTextureProvider *)self delegate];
  [v4 textureProviderNeedsToUnregisterFromDisplayLinkUpdates:self];
}

- (void)setNeedsRegisterToDisplayLinkUpdates
{
  long long v3 = [(PXGTextureProvider *)self requestQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PXGTextureProvider *)self delegate];
  [v4 textureProviderNeedsToRegisterToDisplayLinkUpdates:self];
}

- (void)provideFailureWithError:(id)a3 forRequestID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int64_t v7 = [(PXGTextureProvider *)self requestQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(PXGTextureProvider *)self delegate];
  [v8 textureProvider:self didProvideFailureWithError:v6 forRequestID:v4];
}

- (void)providePixelBuffer:(__CVBuffer *)a3 options:(id)a4 forRequestID:(int)a5
{
  long long v5 = *(_OWORD *)(*(void *)&a4.var0 + 16);
  v6[0] = *(_OWORD *)*(void *)&a4.var0;
  v6[1] = v5;
  [(PXGTextureProvider *)self providePixelBuffer:a3 options:v6 adjustment:0 forRequestID:*(void *)&a4.var2];
}

- (void)providePixelBuffer:(__CVBuffer *)a3 options:(id)a4 adjustment:(id)a5 forRequestID:(int)a6
{
  int64_t v7 = *(_OWORD **)&a4.var0;
  id v11 = *(id *)&a4.var2;
  NSUInteger v12 = [(PXGTextureProvider *)self requestQueue];
  dispatch_assert_queue_V2(v12);

  if (!a3)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXGTextureProvider.m", 172, @"Invalid parameter not satisfying: %@", @"pixelBufferRef != nil" object file lineNumber description];
  }
  id v13 = [(PXGTextureProvider *)self delegate];
  long long v14 = v7[1];
  v16[0] = *v7;
  v16[1] = v14;
  [v13 textureProvider:self didProvidePixelBuffer:a3 options:v16 adjustment:v11 forRequestID:a5];
}

- (void)provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 forRequestID:(int)a6
{
  long long v6 = *(_OWORD *)(*(void *)&a4.var0 + 16);
  v7[0] = *(_OWORD *)*(void *)&a4.var0;
  v7[1] = v6;
  [(PXGTextureProvider *)self provideCGImage:a3 options:v7 adjustment:*(void *)&a4.var2 isDegraded:0 forRequestID:a5];
}

- (void)dealloc
{
  free(self->_imageDataSpecs);
  free(self->_textureAtlasManagers);
  v3.receiver = self;
  v3.super_class = (Class)PXGTextureProvider;
  [(PXGTextureProvider *)&v3 dealloc];
}

@end