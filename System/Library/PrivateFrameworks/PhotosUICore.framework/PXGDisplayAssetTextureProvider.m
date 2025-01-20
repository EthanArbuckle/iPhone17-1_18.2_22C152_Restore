@interface PXGDisplayAssetTextureProvider
+ (id)defaultMediaVersionHandlerWithDataSourceBeforeChanges:(id)a3 dataSourceAfterChanges:(id)a4;
- ($CD50236D32D92DEB4B82C0BF1F758B74)_defaultStillImageTextureProcessingOptionsForAsset:(id)a3 orientation:(unsigned int)a4 applyCleanAperture:(BOOL)a5;
- (BOOL)_hasDeliveredThumbnailForTextureRequestID:(int)a3;
- (BOOL)_imageSizeSatisfiedByThumbnail:(CGSize)a3;
- (BOOL)_noteThumbnailAsDeliveredForRequestID:(int)a3;
- (BOOL)videoRequestsAllowed;
- (CGImage)placeholderImage;
- (PXGDisplayAssetTextureProvider)init;
- (PXGDisplayAssetTextureProvider)initWithDefaultMediaProvider:(id)a3 layoutQueue:(id)a4;
- (PXMediaProvider)defaultMediaProvider;
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (__CVBuffer)_workQueue_renderCrossfadeIfNeededWithPixelBuffer:(__CVBuffer *)a3 forVideoSession:(id)a4 textureRequestID:(id)a5 useLowMemoryMode:(BOOL)a6;
- (double)displayLinkLastTargetTimestamp;
- (id)_requestOptionsForUseCase:(unint64_t)a3 forDrawing:(BOOL)a4 intent:(unint64_t)a5 useLowMemoryDecode:(BOOL)a6;
- (void)_cancelationQueue_cancelImageRequests:(id)a3;
- (void)_handlePixelBufferChangedForTextureStreamingSession:(id)a3 useLowMemoryMode:(BOOL)a4;
- (void)_handleProvidePlaceholderForTextureRequestID:(int)a3;
- (void)_processThumbnailRequestsOnRequestQueue:(BOOL)a3;
- (void)_providePlaceholdersForRequestIDs:(_NSRange)a3 placeholderStyle:(unint64_t)a4;
- (void)_requestQueue_handleThumbnailData:(id)a3 spec:(PXMediaProviderThumbnailDataSpec *)a4 forTextureRequestID:(int)a5;
- (void)_requestQueue_requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 observer:(id)a4 textureRequestIDs:(_NSRange)a5 displayAssetFetchResult:(id)a6 presentationStyles:(unint64_t)a7 targetSize:(CGSize)a8 screenScale:(double)a9 screenMaxHeadroom:(double)a10 adjustment:(id)a11 intent:(unint64_t)a12 cannotBeSatisfiedWithThumbnail:(BOOL)a13 useLowMemoryDecode:(BOOL)a14 applyCleanApertureCrop:(BOOL)a15 mediaProvider:(id)a16;
- (void)_setupRequestOptions;
- (void)_workQueue_cancelTextureRequests:(id)a3;
- (void)_workQueue_cleanupTextureStreamingSession:(id)a3 textureRequestIDs:(id)a4;
- (void)_workQueue_didDeliverVideoContentForRequestID:(int)a3;
- (void)_workQueue_handleCGImageResult:(CGImage *)a3 orientation:(unsigned int)a4 forAsset:(id)a5 info:(id)a6 targetSize:(CGSize)a7 adjustment:(id)a8 shouldCache:(BOOL)a9 textureRequestID:(int)a10 sharedState:(id)a11;
- (void)_workQueue_handleResult:(CGImage *)a3 orientation:(int64_t)a4 info:(id)a5 targetSize:(CGSize)a6 screenScale:(double)a7 mediaRequest:(id)a8 textureRequestID:(int)a9 sharedState:(id)a10;
- (void)_workQueue_performDeferredImageRequest:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7 textureRequestID:(int)a8 mediaProvider:(id)a9;
- (void)_workQueue_performRequestForDisplayAsset:(id)a3 textureRequestID:(int)a4 sharedState:(id)a5;
- (void)_workQueue_processDeferredImageRequests;
- (void)_workQueue_processImageRequestsWithAllowedIDs:(id)a3;
- (void)_workQueue_provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 forRequestID:(int)a7;
- (void)_workQueue_provideVideoFrameForTextureStreamingSession:(id)a3 useLowMemoryMode:(BOOL)a4;
- (void)_workQueue_requestVideoTexturesForSpriteAtIndex:(unsigned int)a3 spriteReference:(id)a4 displayAsset:(id)a5 presentationController:(id)a6 adjustment:(id)a7 presentationType:(unsigned __int8)a8 textureRequestID:(int)a9 mediaProvider:(id)a10 pixelBufferSourcesProvider:(id)a11 useLowMemoryMode:(BOOL)a12;
- (void)_workQueue_startRequestingVideoTexturesForDisplayAsset:(id)a3 presentationController:(id)a4 pixelBufferSource:(id)a5 pixelBufferSourcesProvider:(id)a6 adjustment:(id)a7 textureRequestID:(int)a8 useLowMemoryMode:(BOOL)a9;
- (void)_workQueue_updateTextureStreamingVisibility:(BOOL)a3;
- (void)cancelTextureRequests:(id)a3;
- (void)dealloc;
- (void)didFinishRequestingTextures;
- (void)interactionStateDidChange:(id *)a3;
- (void)performRequestForSpriteIndex:(unsigned int)a3 textureRequestID:(int)a4 sharedState:(id)a5;
- (void)registerImageDataSpecs:(id)a3;
- (void)releaseCachedResources;
- (void)setDisplayLinkLastTargetTimestamp:(double)a3;
- (void)setPreferBGRA:(BOOL)a3;
- (void)setVideoRequestsAllowed:(BOOL)a3;
- (void)viewEnvironmentDidChange:(id)a3;
@end

@implementation PXGDisplayAssetTextureProvider

void __75__PXGDisplayAssetTextureProvider_initWithDefaultMediaProvider_layoutQueue___block_invoke(uint64_t a1)
{
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v81.receiver = self;
  v81.super_class = (Class)PXGDisplayAssetTextureProvider;
  id v54 = a7;
  v8 = (char *)-[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v81, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, a3, a4, a5, a6);
  NSUInteger v35 = v9;
  v36 = v8;
  v53 = [v54 displayAssetSource];
  uint64_t v55 = [v54 displayAssetSourceRespondsTo];
  __int16 v11 = v10;
  if (v55) {
    unint64_t v45 = [v53 supportedDisplayAssetPresentationStylesInLayout:v54];
  }
  else {
    unint64_t v45 = 1;
  }
  v52 = [v53 displayAssetFetchResultForSpritesInRange:a3 inLayout:v54];
  if ((v55 & 0x10000) != 0)
  {
    v42 = [v53 displayAssetRequestObserverForSpritesInRange:a3 inLayout:v54];
  }
  else
  {
    v42 = 0;
  }
  if (v52)
  {
    if ((v55 & 0x1000000000000) != 0) {
      [v53 customMediaProviderForDisplayAssetsInLayout:v54];
    }
    else {
    v44 = [(PXGDisplayAssetTextureProvider *)self defaultMediaProvider];
    }
    if ((v55 & 0x100000000000000) != 0)
    {
      v33 = [v53 customPixelBufferSourcesProviderForDisplayAssetsInLayout:v54];
    }
    else
    {
      v33 = 0;
    }
    if (v11) {
      char v38 = [v53 useLowMemoryDecodeInLayout:v54];
    }
    else {
      char v38 = 0;
    }
    if ((v11 & 0x100) != 0) {
      LOBYTE(v37) = [v53 shouldApplyCleanApertureCropToStillImagesInLayout:v54];
    }
    else {
      uint64_t v37 = (v45 >> 1) & 1;
    }
    [v54 displayScale];
    v14 = v13;
    [v54 displayMaximumHeadroom];
    v16 = v15;
    objc_initWeak(&location, self);
    queue = [(PXGTextureProvider *)self requestQueue];
    v34 = [(PXGTextureProvider *)self workQueue];
    id v56 = 0;
    if ((v45 & 1) != 0 && HIDWORD(*(unint64_t *)&a3))
    {
      id v56 = 0;
      v17 = 0;
      v49 = 0;
      uint64_t v18 = 0;
      unsigned int v50 = 0;
      int v19 = 0;
      float32x4_t v41 = *(float32x4_t *)off_1E5DAAF40;
      v20 = 0;
      uint64_t v40 = 1;
      _PXGSpriteIndexRange v21 = a3;
      v22 = v36;
      unint64_t v23 = HIDWORD(*(unint64_t *)&a3);
      do
      {
        v24 = &a6->var0 + 40 * v21.location;
        float32x2_t v25 = *(float32x2_t *)(v24 + 8);
        float32x2_t v57 = v25;
        if ((vceq_f32(v25, (float32x2_t)vdup_lane_s32((int32x2_t)v25, 1)).u32[0] & 1) != 0
          && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*((float32x4_t *)&a5->var1 + 10 * v21.location), v41)), 0xFuLL))) & 1) == 0)
        {
          v25.f32[0] = v25.f32[0] + 1.0;
          float32x2_t v57 = v25;
        }
        int v26 = *v24;
        if ((v55 & 0x100000000) != 0)
        {
          v28 = [v52 objectAtIndex:v21.location];
          id v27 = [v53 adjustmentForDisplayAsset:v28 spriteIndex:v21 inLayout:v54];
        }
        else
        {
          id v27 = 0;
        }
        int32x2_t v29 = vceq_f32(v57, (float32x2_t)v20);
        if ((v29.i8[0] & 1) == 0 || (v29.i8[4] & 1) == 0 || v27 != v56 || v26 != v19)
        {
          if (v18)
          {
            if ((v55 & 0x10000000000) != 0) {
              uint64_t v40 = [v53 presentationIntentForSpritesInRange:v50 | (unint64_t)(v18 << 32) inLayout:v54];
            }
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
            block[3] = &unk_1E5DBCF48;
            objc_copyWeak(v74, &location);
            unsigned int v75 = v50;
            int v76 = v18;
            id v70 = v42;
            v74[1] = v49;
            v74[2] = v17;
            id v71 = v52;
            v74[3] = (id)v45;
            v74[4] = v20;
            v74[5] = v14;
            v74[6] = v16;
            id v72 = v56;
            v74[7] = (id)v40;
            BOOL v77 = v26 == 1;
            char v78 = v38;
            char v79 = v37;
            id v73 = v44;
            dispatch_async(queue, block);

            objc_destroyWeak(v74);
          }
          id v30 = v27;

          LODWORD(v18) = 0;
          v17 = 0;
          v20 = (void *)v57;
          int v19 = v26;
          unsigned int v50 = v21.location;
          v49 = v22;
          id v56 = v30;
        }

        uint64_t v18 = (v18 + 1);
        ++v17;
        ++v22;
        _PXGSpriteIndexRange v21 = (_PXGSpriteIndexRange)(v21.location + 1);
        --v23;
      }
      while (v23);
      if (v18)
      {
        if ((v55 & 0x10000000000) != 0) {
          uint64_t v40 = [v53 presentationIntentForSpritesInRange:v50 | (unint64_t)(v18 << 32) inLayout:v54];
        }
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2;
        v58[3] = &unk_1E5DBCF48;
        objc_copyWeak(v63, &location);
        unsigned int v64 = v50;
        int v65 = v18;
        id v59 = v42;
        v63[1] = v49;
        v63[2] = v17;
        id v60 = v52;
        v63[3] = (id)v45;
        v63[4] = v20;
        v63[5] = v14;
        v63[6] = v16;
        id v56 = v56;
        id v61 = v56;
        v63[7] = (id)v40;
        BOOL v66 = v19 == 1;
        char v67 = v38;
        char v68 = v37;
        id v62 = v44;
        dispatch_async(queue, v58);

        objc_destroyWeak(v63);
      }
    }
    if ((v45 & 2) != 0)
    {
      if ((v55 & 0x100) != 0) {
        [v53 minSpriteSizeForPresentationStyle:2];
      }
      to = [v54 rootLayout];
      objc_opt_respondsToSelector();
      if (HIDWORD(*(unint64_t *)&a3)) {
        PXRectWithCenterAndSize();
      }
    }
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v12 = [v53 desiredPlaceholderStyleInLayout:v54];
    if (v12 == 1)
    {
      os_unfair_lock_lock(&self->_lookupLock);
      -[NSMutableIndexSet addIndexesInRange:](self->_lookupLock_requestIDsWithDeliveredPlaceholders, "addIndexesInRange:", v36, v35);
      os_unfair_lock_unlock(&self->_lookupLock);
    }
    -[PXGDisplayAssetTextureProvider _providePlaceholdersForRequestIDs:placeholderStyle:](self, "_providePlaceholdersForRequestIDs:placeholderStyle:", v36, v35, v12);
  }

  NSUInteger v32 = v35;
  NSUInteger v31 = (NSUInteger)v36;
  result.length = v32;
  result.id location = v31;
  return result;
}

- (PXMediaProvider)defaultMediaProvider
{
  return self->_defaultMediaProvider;
}

- (CGImage)placeholderImage
{
  v3 = [(PXGTextureProvider *)self viewEnvironment];
  uint64_t v4 = [v3 userInterfaceStyle];
  v5 = &OBJC_IVAR___PXGDisplayAssetTextureProvider__lightPlaceholderImage;
  if (v4 == 2) {
    v5 = &OBJC_IVAR___PXGDisplayAssetTextureProvider__darkPlaceholderImage;
  }
  v6 = *(Class *)((char *)&self->super.super.isa + *v5);

  return v6;
}

void __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v7 = (id *)(a1 + 48);
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_workQueue_handleResult:orientation:info:targetSize:screenScale:mediaRequest:textureRequestID:sharedState:", a2, a3, v8, *(void *)(a1 + 32), *(unsigned int *)(a1 + 80), *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  if (*(unsigned char *)(a1 + 84))
  {
    MEMORY[0x1F4140820]();
  }
}

- (void)_processThumbnailRequestsOnRequestQueue:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    v5 = [(PXGTextureProvider *)self requestQueue];
    dispatch_assert_queue_V2(v5);

    v6 = self->_requestQueue_thumbnailRequestQueue;
    uint64_t v7 = self->_workQueue_thumbnailRequestQueue != 0;
  }
  else
  {
    id v8 = [(PXGTextureProvider *)self workQueue];
    dispatch_assert_queue_V2(v8);

    v6 = self->_workQueue_thumbnailRequestQueue;
    uint64_t v7 = 0;
  }
  [(PXGThumbnailRequestQueue *)v6 sortRequests];
  uint64_t v9 = [(PXGThumbnailRequestQueue *)v6 count];
  NSUInteger v32 = v6;
  uint64_t v10 = [(PXGThumbnailRequestQueue *)v32 requests];
  __int16 v11 = [off_1E5DA9658 sharedInstance];
  uint64_t v12 = [v11 simulateSomeAssetsInCloud];

  uint64_t v36 = v9;
  if (v9 >= -99)
  {
    uint64_t v13 = 0;
    uint64_t v35 = v9 / 100;
    long long v33 = *(_OWORD *)off_1E5DAAFA0;
    uint64_t v14 = v9;
    unsigned int v34 = v7;
    while (1)
    {
      uint64_t v38 = v14 - 100;
      if (v14 >= 100) {
        uint64_t v14 = 100;
      }
      uint64_t v15 = v14 <= 1 ? 1 : v14;
      context = (void *)MEMORY[0x1AD10CB00]();
      uint64_t v39 = v13;
      if (v36 - 100 * v13 >= 1) {
        break;
      }
LABEL_32:
      uint64_t v14 = v38;
      uint64_t v13 = v39 + 1;
      if (v39 == v35) {
        goto LABEL_33;
      }
    }
    while (1)
    {
      uint64_t v16 = *(unsigned int *)(v10 + 24);
      if (![(PXGTextureProvider *)self isRequestActive:v16]
        || [(PXGDisplayAssetTextureProvider *)self _hasDeliveredThumbnailForTextureRequestID:v16])
      {
        goto LABEL_31;
      }
      id v17 = *(id *)(v10 + 8);
      id v18 = *(id *)v10;
      LOWORD(v19) = *(_WORD *)(v10 + 28);
      LOWORD(v20) = *(_WORD *)(v10 + 30);
      uint64_t v51 = 0;
      long long v49 = 0u;
      long long v50 = 0u;
      objc_msgSend(v17, "thumbnailDataForAsset:targetSize:onlyFromCache:outDataSpec:", v18, v7, &v49, (double)v19, (double)v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      float v24 = *(float *)(v10 + 32);
      if (v24 > 0.0)
      {
        LOWORD(v22) = WORD6(v50);
        float v25 = (float)v22;
        LOWORD(v23) = WORD4(v50);
        *(double *)&unint64_t v26 = (double)v23;
        double v27 = *(double *)&v26 + (float)((float)(1.0 - v24) * v25) * 0.5;
        WORD4(v50) = (int)v27;
        LOWORD(v27) = HIWORD(v50);
        *(float *)&double v27 = (float)LODWORD(v27);
        LOWORD(v26) = WORD5(v50);
        WORD5(v50) = (int)((double)v26 + (float)((float)(1.0 - v24) * *(float *)&v27) * 0.5);
        WORD6(v50) = (int)(float)(v24 * v25);
        HIWORD(v50) = (int)(float)(v24 * *(float *)&v27);
      }
      if (v12 && 0xCCCCCCCCCCCCCCCDLL * [v18 thumbnailIndex] <= 0x3333333333333333)
      {
      }
      else if (v21)
      {
        if ([(PXGDisplayAssetTextureProvider *)self _noteThumbnailAsDeliveredForRequestID:v16])
        {
          if (v3)
          {
            long long v46 = v49;
            long long v47 = v50;
            uint64_t v48 = v51;
            [(PXGDisplayAssetTextureProvider *)self _requestQueue_handleThumbnailData:v21 spec:&v46 forTextureRequestID:v16];
          }
          else
          {
            [(PXGTextureProvider *)self requestQueue];
            uint64_t v28 = v12;
            v30 = BOOL v29 = v3;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __74__PXGDisplayAssetTextureProvider__processThumbnailRequestsOnRequestQueue___block_invoke;
            block[3] = &unk_1E5DBCFE8;
            void block[4] = self;
            id v21 = v21;
            id v41 = v21;
            long long v42 = v49;
            long long v43 = v50;
            uint64_t v44 = v51;
            int v45 = v16;
            dispatch_async(v30, block);

            BOOL v3 = v29;
            uint64_t v12 = v28;
            uint64_t v7 = v34;
          }
        }
        goto LABEL_30;
      }
      if ((v7 & 1) == 0
        && [(PXGDisplayAssetTextureProvider *)self _noteThumbnailAsDeliveredForRequestID:v16])
      {
        NSUInteger v31 = [(PXGDisplayAssetTextureProvider *)self placeholderImage];
        long long v46 = v33;
        long long v47 = 0x3F80000000000000uLL;
        if (v3) {
          [(PXGTextureProvider *)self provideCGImage:v31 options:&v46 isDegraded:1 forRequestID:v16];
        }
        else {
          [(PXGDisplayAssetTextureProvider *)self _workQueue_provideCGImage:v31 options:&v46 adjustment:0 isDegraded:1 forRequestID:v16];
        }
      }
      id v21 = 0;
LABEL_30:

LABEL_31:
      v10 += 40;
      if (!--v15) {
        goto LABEL_32;
      }
    }
  }
LABEL_33:
  [(PXGThumbnailRequestQueue *)v32 removeAllRequests];
}

- (void)_requestQueue_handleThumbnailData:(id)a3 spec:(PXMediaProviderThumbnailDataSpec *)a4 forTextureRequestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  var1 = a4->var0.var1;
  unsigned __int16 var2 = a4->var0.var2;
  unsigned __int16 var3 = a4->var0.var3;
  v19[0] = a4->var0.var0;
  v19[1] = var1;
  unsigned __int16 v20 = var2;
  unsigned __int16 v21 = var3;
  int64_t v12 = [(PXGTextureProvider *)self requestQueue_indexForImageDataSpec:v19];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    PXGTungstenGetLog();
  }
  LOWORD(v13) = a4->var5;
  LOWORD(v14) = a4->var6;
  LOWORD(v15) = a4->var1;
  LOWORD(v16) = a4->var2;
  LOWORD(v17) = a4->var3;
  LOWORD(v18) = a4->var4;
  -[PXGTextureProvider provideImageData:withSpecAtIndex:size:bytesPerRow:contentsRect:forRequestID:](self, "provideImageData:withSpecAtIndex:size:bytesPerRow:contentsRect:forRequestID:", v8, v12, a4->var7, v5, (double)v13, (double)v14, (double)v15, (double)v16, (double)v17, (double)v18);
}

- (BOOL)_noteThumbnailAsDeliveredForRequestID:(int)a3
{
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  char v6 = [(NSMutableIndexSet *)self->_lookupLock_requestIDsWithDeliveredThumbnails containsIndex:a3] ^ 1;
  [(NSMutableIndexSet *)self->_lookupLock_requestIDsWithDeliveredThumbnails addIndex:a3];
  os_unfair_lock_unlock(p_lookupLock);
  return v6;
}

- (BOOL)_hasDeliveredThumbnailForTextureRequestID:(int)a3
{
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  LOBYTE(a3) = [(NSMutableIndexSet *)self->_lookupLock_requestIDsWithDeliveredThumbnails containsIndex:a3];
  os_unfair_lock_unlock(p_lookupLock);
  return a3;
}

- (void)_workQueue_handleResult:(CGImage *)a3 orientation:(int64_t)a4 info:(id)a5 targetSize:(CGSize)a6 screenScale:(double)a7 mediaRequest:(id)a8 textureRequestID:(int)a9 sharedState:(id)a10
{
  uint64_t v11 = *(void *)&a9;
  id v14 = a5;
  id v15 = a8;
  id v16 = a10;
  if ([(PXGTextureProvider *)self isRequestActive:v11])
  {
    unint64_t v17 = [(PXGTextureProvider *)self workQueue];
    dispatch_assert_queue_V2(v17);

    CGImagePropertyOrientationFromPXImageOrientation();
  }
}

- (id)_requestOptionsForUseCase:(unint64_t)a3 forDrawing:(BOOL)a4 intent:(unint64_t)a5 useLowMemoryDecode:(BOOL)a6
{
  BOOL v6 = a6;
  if (a3 <= 3 && a4) {
    a3 = qword_1AB35AE98[a3];
  }
  uint64_t v9 = [(NSArray *)self->_requestOptions objectAtIndexedSubscript:a3];
  uint64_t v10 = [(PXGTextureProvider *)self workQueue];
  [v9 setResultHandlerQueue:v10];

  objc_msgSend(v9, "setUseLowMemoryMode:", -[PXGTextureProvider lowMemoryMode](self, "lowMemoryMode") | v6);
  unint64_t v11 = [v9 loadingMode] & 0xFFFFFFFFFF9FFFFFLL;
  uint64_t v12 = 6291456;
  if (!v6) {
    uint64_t v12 = 0;
  }
  [v9 setLoadingMode:v11 | v12];
  if (a5 >= 6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"PXImageRequestOptionsDownloadIntent PXGPHRequestOptionsDownloadIntentFromPresentationIntent(PXGDisplayAssetPresentationIntent)"];
    [v14 handleFailureInFunction:v15 file:@"PXGDisplayAssetSource_Internal.h" lineNumber:55 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [v9 setDownloadIntent:qword_1AB35AEB8[a5]];
  return v9;
}

- (void)performRequestForSpriteIndex:(unsigned int)a3 textureRequestID:(int)a4 sharedState:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v13 = a5;
  uint64_t v9 = [(PXGTextureProvider *)self workQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [v13 displayAssetFetchResult];
  unint64_t v11 = [v10 objectAtIndex:a3];

  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXGDisplayAssetTextureProvider.m", 895, @"Invalid parameter not satisfying: %@", @"displayAsset != nil" object file lineNumber description];
  }
  [(PXGDisplayAssetTextureProvider *)self _workQueue_performRequestForDisplayAsset:v11 textureRequestID:v5 sharedState:v13];
}

- (void)_workQueue_performRequestForDisplayAsset:(id)a3 textureRequestID:(int)a4 sharedState:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ([(PXGTextureProvider *)self isRequestActive:v6])
  {
    uint64_t v10 = [(PXGTextureProvider *)self workQueue];
    dispatch_assert_queue_V2(v10);

    [v9 targetSize];
    double v12 = v11;
    double v14 = v13;
    [v9 screenScale];
    id v16 = v15;
    [v9 screenMaxHeadroom];
    double v62 = v17;
    unsigned int v71 = [v9 useLowMemoryDecode];
    unint64_t v18 = [v9 adjustment];
    char v19 = [v9 presentationStyles];
    unsigned int v75 = [v9 observer];
    unsigned __int16 v20 = [v9 mediaProvider];
    unsigned __int16 v21 = [off_1E5DA9658 sharedInstance];
    id v73 = v20;
    [v20 masterThumbnailSize];
    if (v22 >= v23) {
      double v24 = v23;
    }
    else {
      double v24 = v22;
    }
    if ([(PXGTextureProvider *)self lowMemoryMode]) {
      double v25 = 1.5;
    }
    else {
      double v25 = 1.2;
    }
    if ([v21 simulateSomeAssetsInCloud]
      && 0xCCCCCCCCCCCCCCCDLL * [v8 thumbnailIndex] <= 0x3333333333333333)
    {
      [v75 observeIsInCloud:1 forDisplayAsset:v8];
LABEL_67:

      goto LABEL_68;
    }
    double v68 = v25;
    if (v18)
    {
      objc_msgSend(v18, "requestSizeForProposedTargetSize:", v12, v14);
      double v27 = v26;
      double v29 = v28;
      int v30 = [v18 wantsSingleHighQualityDelivery];
    }
    else
    {
      int v30 = 0;
      double v29 = v14;
      double v27 = v12;
    }
    if (v27 >= v29) {
      double v31 = v29;
    }
    else {
      double v31 = v27;
    }
    double v32 = fmax(v31, 1.0);
    if ([v21 requestMasterThumbsOnly] && v24 != 0.0 && v32 > v24) {
      PXSizeScale();
    }
    if (v18) {
      uint64_t v33 = [v18 contentModeForProposedContentMode:1];
    }
    else {
      uint64_t v33 = 1;
    }
    id v70 = v21;
    if ((v19 & 4) != 0)
    {
      unsigned int v34 = [v8 representsBurst];
      uint64_t v35 = v34;
    }
    else
    {
      unsigned int v34 = 0;
      uint64_t v35 = 0;
    }
    BOOL v36 = [(PXGTextureProvider *)self preferMipmaps];
    v74 = [[_PXGMediaRequest alloc] initWithAsset:v8 observer:v75 postProcessOptions:v35];
    [(_PXGMediaRequest *)v74 setAdjustment:v18];
    v99[0] = 0;
    unsigned __int8 v98 = 0;
    unsigned int v97 = 0;
    double v63 = v12;
    double v66 = v14;
    if (-[PXGAssetImageCache getCachedImage:withOrientation:outIsDegraded:forAsset:targetSize:contentMode:forRequestID:](self->_imageCache, "getCachedImage:withOrientation:outIsDegraded:forAsset:targetSize:contentMode:forRequestID:", v99, &v97, &v98, v8, v33, v6, v27, v29))
    {
      if (v34)
      {
        -[PXGDisplayAssetTextureProvider _workQueue_handleResult:orientation:info:targetSize:screenScale:mediaRequest:textureRequestID:sharedState:](self, "_workQueue_handleResult:orientation:info:targetSize:screenScale:mediaRequest:textureRequestID:sharedState:", v99[0], v97, 0, v74, v6, v9, v27, v29, *(double *)&v16);
      }
      else
      {
        long long location = 0u;
        long long v96 = 0u;
        uint64_t v40 = v97;
        if (v9) {
          uint64_t v41 = [v9 applyCleanApertureCrop];
        }
        else {
          uint64_t v41 = 1;
        }
        [(PXGDisplayAssetTextureProvider *)self _defaultStillImageTextureProcessingOptionsForAsset:v8 orientation:v40 applyCleanAperture:v41];
        v94[0] = location;
        v94[1] = v96;
        [(PXGDisplayAssetTextureProvider *)self _workQueue_provideCGImage:v99[0] options:v94 adjustment:v18 isDegraded:v98 forRequestID:v6];
      }
      PXCGImageGetSizeWithOrientation();
    }
    double v37 = v68;
    double v38 = *MEMORY[0x1E4F1DB30];
    double v39 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    -[_PXGMediaRequest setBestReceivedSize:](v74, "setBestReceivedSize:", *MEMORY[0x1E4F1DB30], v39);
    if (v38 >= v27 && v39 >= v29)
    {
LABEL_66:

      unsigned __int16 v21 = v70;
      goto LABEL_67;
    }
    uint64_t v60 = v33;
    objc_initWeak((id *)&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke;
    aBlock[3] = &unk_1E5DBD010;
    objc_copyWeak(v91, (id *)&location);
    v91[1] = *(id *)&v63;
    v91[2] = *(id *)&v66;
    v91[3] = v16;
    char v67 = v74;
    v89 = v67;
    int v92 = v6;
    id v42 = v9;
    id v90 = v42;
    char v93 = v71;
    v69 = _Block_copy(aBlock);
    if (v32 < v37 * v24) {
      int v43 = (v32 > v24) & ~v30;
    }
    else {
      int v43 = 0;
    }
    BOOL v44 = v43 == 1
       && [(PXGTextureProvider *)self lowMemoryMode]
       && [v70 inLowMemoryModePreferMasterThumb]
       && ![(PXGTextureProvider *)self allowLargerImagesDuringScrollingInLowMemoryMode]|| v32 < v24;
    BOOL v64 = v44;
    uint64_t v45 = v34 | v36;
    if ([(PXGTextureProvider *)self lowMemoryMode]
      && ([(PXGTextureProvider *)self interactionState], v87))
    {
      long long v46 = -[PXGDisplayAssetTextureProvider _requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:](self, "_requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:", 2, v45, [v42 intent], v71);
      if (v64)
      {
        double v27 = v24;
        double v29 = v24;
      }
      long long v47 = (id *)v84;
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_2;
      v84[3] = &unk_1E5DBD038;
      id v72 = v85;
      objc_copyWeak(v85, (id *)&location);
      v84[4] = v8;
      v85[1] = *(id *)&v27;
      v85[2] = *(id *)&v29;
      v85[3] = v61;
      id v48 = v46;
      v84[5] = v48;
      v84[7] = v69;
      int v86 = v6;
      v84[6] = v73;
      long long v49 = _Block_copy(v84);
      workQueue_deferredImageRequestBlocksByTextureID = self->_workQueue_deferredImageRequestBlocksByTextureID;
      uint64_t v51 = [NSNumber numberWithInt:v6];
      [(NSMutableDictionary *)workQueue_deferredImageRequestBlocksByTextureID setObject:v49 forKeyedSubscript:v51];
      v52 = v49;
      uint64_t v65 = 0;
    }
    else
    {
      if (!v43)
      {
        uint64_t v57 = [v42 intent];
        if (v30) {
          uint64_t v58 = 2;
        }
        else {
          uint64_t v58 = 0;
        }
        id v48 = [(PXGDisplayAssetTextureProvider *)self _requestOptionsForUseCase:v58 forDrawing:v45 intent:v57 useLowMemoryDecode:v71];
        [v48 setPreferHDR:v62 > 1.0];
        [v48 setTargetHDRHeadroom:v62];
        uint64_t v54 = objc_msgSend(v73, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v8, v61, v48, v69, v27, v29);
        goto LABEL_59;
      }
      -[PXGDisplayAssetTextureProvider _requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:](self, "_requestOptionsForUseCase:forDrawing:intent:useLowMemoryDecode:", 2, v45, [v42 intent], v71);
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v53 = objc_msgSend(v73, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v8, v61, v48, v69, v24, v24);
      uint64_t v54 = v53;
      if (v64)
      {
LABEL_59:

        if (![(_PXGMediaRequest *)v67 gotAnyResult]
          && [v8 thumbnailIndex] == 0x7FFFFFFFFFFFFFFFLL
          && [v8 isInCloud])
        {
          [v75 observeIsInCloud:1 forDisplayAsset:v8];
        }
        if (v54)
        {
          cancelationQueue = self->_cancelationQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_4;
          block[3] = &unk_1E5DBD060;
          char v78 = self;
          uint64_t v79 = v54;
          id v77 = v73;
          int v80 = v6;
          dispatch_async(cancelationQueue, block);
        }
        objc_destroyWeak(v91);
        objc_destroyWeak((id *)&location);
        goto LABEL_66;
      }
      uint64_t v65 = v53;
      long long v47 = (id *)v81;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_3;
      v81[3] = &unk_1E5DBD038;
      id v72 = v82;
      objc_copyWeak(v82, (id *)&location);
      v81[4] = v8;
      v82[1] = *(id *)&v27;
      v82[2] = *(id *)&v29;
      v82[3] = v61;
      id v48 = v48;
      v81[5] = v48;
      v81[7] = v69;
      int v83 = v6;
      v81[6] = v73;
      uint64_t v55 = _Block_copy(v81);
      id v56 = self->_workQueue_deferredImageRequestBlocksByTextureID;
      uint64_t v51 = [NSNumber numberWithInt:v6];
      [(NSMutableDictionary *)v56 setObject:v55 forKeyedSubscript:v51];
      v52 = v55;
    }

    objc_destroyWeak(v72);
    uint64_t v54 = v65;
    goto LABEL_59;
  }
LABEL_68:
}

- (BOOL)_imageSizeSatisfiedByThumbnail:(CGSize)a3
{
  return self->_largestImageDataSpecSize.width >= a3.width
      && self->_largestImageDataSpecSize.height >= a3.height
      && [(PXGTextureProvider *)self canDeliverThumbnailData];
}

- (void)_workQueue_handleCGImageResult:(CGImage *)a3 orientation:(unsigned int)a4 forAsset:(id)a5 info:(id)a6 targetSize:(CGSize)a7 adjustment:(id)a8 shouldCache:(BOOL)a9 textureRequestID:(int)a10 sharedState:(id)a11
{
  BOOL v11 = a9;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a11;
  unsigned __int16 v21 = [(PXGTextureProvider *)self workQueue];
  dispatch_assert_queue_V2(v21);

  if (a3 && [(PXGTextureProvider *)self isRequestActive:a10])
  {
    unsigned int v25 = a4;
    double v22 = [v18 objectForKeyedSubscript:*(void *)off_1E5DAAFC8];
    uint64_t v23 = [v22 BOOLValue];

    if (v11)
    {
      uint64_t v24 = v25;
      a3 = [(PXGAssetImageCache *)self->_imageCache cacheCGImage:a3 orientation:v25 isDegraded:v23 forRequestID:a10];
    }
    else
    {
      uint64_t v24 = v25;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    -[PXGDisplayAssetTextureProvider _defaultStillImageTextureProcessingOptionsForAsset:orientation:applyCleanAperture:](self, "_defaultStillImageTextureProcessingOptionsForAsset:orientation:applyCleanAperture:", v17, v24, [v20 applyCleanApertureCrop]);
    v26[0] = v27;
    v26[1] = v28;
    [(PXGDisplayAssetTextureProvider *)self _workQueue_provideCGImage:a3 options:v26 adjustment:v19 isDegraded:v23 forRequestID:a10];
  }
}

- (void)_workQueue_provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 forRequestID:(int)a7
{
  BOOL v7 = a6;
  char v8 = (char)a5;
  id v9 = *(long long **)&a4.var0;
  id v12 = *(id *)&a4.var2;
  CGImageRetain(a3);
  double v13 = [(PXGTextureProvider *)self requestQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__PXGDisplayAssetTextureProvider__workQueue_provideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke;
  v16[3] = &unk_1E5DBD0D8;
  id v20 = v12;
  unsigned __int16 v21 = a3;
  long long v14 = v9[1];
  long long v17 = *v9;
  long long v18 = v14;
  id v19 = self;
  char v23 = v8;
  BOOL v22 = v7;
  id v15 = v12;
  dispatch_async(v13, v16);
}

- ($CD50236D32D92DEB4B82C0BF1F758B74)_defaultStillImageTextureProcessingOptionsForAsset:(id)a3 orientation:(unsigned int)a4 applyCleanAperture:(BOOL)a5
{
  id v5 = a3;
  PXGSpriteTextureInfoOrientationFromCGOrientation();
}

void __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_4(uint64_t a1)
{
  uint64_t v4 = [[_PXGMediaRequestToken alloc] initWithMediaProvider:*(void *)(a1 + 32) mediaRequestID:*(void *)(a1 + 48)];
  v2 = *(void **)(*(void *)(a1 + 40) + 320);
  BOOL v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v2 setObject:v4 forKeyedSubscript:v3];
}

- (void)didFinishRequestingTextures
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  [(PXGTextureProvider *)self interactionState];
  BOOL v3 = 1;
  uint64_t v4 = [(PXGTextureProvider *)self requestIDsInTargetRect];
  char v5 = 1;
  if ([(PXGTextureProvider *)self lowMemoryMode])
  {
    BOOL v6 = [(PXGTextureProvider *)self allowLargerImagesDuringScrollingInLowMemoryMode];
    uint64_t v7 = 1;
    if (v6) {
      uint64_t v7 = 2;
    }
    if ((uint64_t)v15 > v7) {
      char v5 = 0;
    }
    BOOL v3 = BYTE10(v15) == 0;
  }
  BOOL v8 = v5 != 0;
  id v9 = [(PXGTextureProvider *)self requestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXGDisplayAssetTextureProvider_didFinishRequestingTextures__block_invoke;
  block[3] = &unk_1E5DBF070;
  BOOL v13 = v8;
  void block[4] = self;
  id v12 = v4;
  BOOL v14 = v3;
  id v10 = v4;
  dispatch_async(v9, block);
}

- (void)viewEnvironmentDidChange:(id)a3
{
  id v4 = a3;
  char v5 = [(PXGTextureProvider *)self viewEnvironment];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    os_unfair_lock_lock(&self->_lookupLock);
    BOOL v8 = (void *)[(NSMutableIndexSet *)self->_lookupLock_requestIDsWithDeliveredPlaceholders copy];
    os_unfair_lock_unlock(&self->_lookupLock);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__PXGDisplayAssetTextureProvider_viewEnvironmentDidChange___block_invoke;
    v9[3] = &unk_1E5DCD248;
    v9[4] = self;
    [v8 enumerateRangesUsingBlock:v9];
  }
}

- (void)setPreferBGRA:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXGTextureProvider *)self preferBGRA] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXGDisplayAssetTextureProvider;
    [(PXGTextureProvider *)&v5 setPreferBGRA:v3];
    [(PXGDisplayAssetTextureProvider *)self _setupRequestOptions];
  }
}

- (void)registerImageDataSpecs:(id)a3
{
  id v4 = a3;
  objc_super v5 = [off_1E5DA9658 sharedInstance];
  char v6 = [v5 disableLowResThumbnails];

  uint64_t v7 = [(PXGDisplayAssetTextureProvider *)self defaultMediaProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PXGDisplayAssetTextureProvider_registerImageDataSpecs___block_invoke;
  v9[3] = &unk_1E5DBCF20;
  char v12 = v6;
  id v10 = v4;
  BOOL v11 = self;
  id v8 = v4;
  [v7 enumerateAvailableThumbnailDataFormats:v9];
}

void __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  *(_WORD *)((char *)&v2 + 1) = *(_WORD *)(a1 + 137);
  LOBYTE(v2) = *(unsigned char *)(a1 + 136);
  objc_msgSend(WeakRetained, "_requestQueue_requestTexturesForSpritesInRange:observer:textureRequestIDs:displayAssetFetchResult:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:cannotBeSatisfiedWithThumbnail:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:", *(void *)(a1 + 128), *(void *)(a1 + 32), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 40), *(void *)(a1 + 88), vcvtq_f64_f32(*(float32x2_t *)(a1 + 96)), *(double *)(a1 + 104), *(double *)(a1 + 112), *(void *)(a1 + 48), *(void *)(a1 + 120), v2, *(void *)(a1 + 56));
}

- (void)_requestQueue_requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 observer:(id)a4 textureRequestIDs:(_NSRange)a5 displayAssetFetchResult:(id)a6 presentationStyles:(unint64_t)a7 targetSize:(CGSize)a8 screenScale:(double)a9 screenMaxHeadroom:(double)a10 adjustment:(id)a11 intent:(unint64_t)a12 cannotBeSatisfiedWithThumbnail:(BOOL)a13 useLowMemoryDecode:(BOOL)a14 applyCleanApertureCrop:(BOOL)a15 mediaProvider:(id)a16
{
  double height = a8.height;
  double width = a8.width;
  id v23 = a4;
  id v24 = a6;
  id v25 = a11;
  id v26 = a16;
  long long v27 = [off_1E5DA9658 sharedInstance];
  double v28 = width;
  double v29 = height;
  if (v25
    && (int v30 = [v25 allowsUnadjustedOpportunisticDelivery],
        objc_msgSend(v25, "requestSizeForProposedTargetSize:", width, height),
        double v28 = v31,
        double v29 = v32,
        !v30))
  {
    char v33 = 0;
  }
  else
  {
    if ([(PXGTextureProvider *)self canDeliverThumbnailData]
      && ([v27 disableLowResThumbnails] & 1) == 0)
    {
      -[PXGThumbnailRequestQueue enqueueRequestsWithItemRange:textureRequestIDs:displayAssetFetchResult:targetSize:applyCleanApertureCrop:mediaProvider:](self->_requestQueue_thumbnailRequestQueue, "enqueueRequestsWithItemRange:textureRequestIDs:displayAssetFetchResult:targetSize:applyCleanApertureCrop:mediaProvider:", a3.location, HIDWORD(*(unint64_t *)&a3), a5.location, a5.length, v24, a15, v28, v29, v26);
    }
    char v33 = 1;
  }
  unsigned int v34 = [(PXGTextureProvider *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __297__PXGDisplayAssetTextureProvider__requestQueue_requestTexturesForSpritesInRange_observer_textureRequestIDs_displayAssetFetchResult_presentationStyles_targetSize_screenScale_screenMaxHeadroom_adjustment_intent_cannotBeSatisfiedWithThumbnail_useLowMemoryDecode_applyCleanApertureCrop_mediaProvider___block_invoke;
  block[3] = &unk_1E5DBCFC0;
  BOOL v58 = a13;
  _NSRange v48 = a5;
  char v59 = v33;
  void block[4] = self;
  id v43 = v27;
  double v49 = v28;
  double v50 = v29;
  BOOL v60 = a15;
  id v44 = v24;
  id v45 = v26;
  double v51 = width;
  double v52 = height;
  id v46 = v25;
  id v47 = v23;
  unint64_t v53 = a7;
  double v54 = a9;
  double v55 = a10;
  unint64_t v56 = a12;
  _PXGSpriteIndexRange v57 = a3;
  BOOL v61 = a14;
  id v35 = v23;
  id v36 = v25;
  id v37 = v26;
  id v38 = v24;
  id v39 = v27;
  dispatch_async(v34, block);
}

uint64_t __297__PXGDisplayAssetTextureProvider__requestQueue_requestTexturesForSpritesInRange_observer_textureRequestIDs_displayAssetFetchResult_presentationStyles_targetSize_screenScale_screenMaxHeadroom_adjustment_intent_cannotBeSatisfiedWithThumbnail_useLowMemoryDecode_applyCleanApertureCrop_mediaProvider___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 168)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "addIndexesInRange:", *(void *)(a1 + 80), *(void *)(a1 + 88));
  }
  if (*(unsigned char *)(a1 + 169)
    && [*(id *)(a1 + 32) canDeliverThumbnailData]
    && ([*(id *)(a1 + 40) disableLowResThumbnails] & 1) == 0)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 280), "enqueueRequestsWithItemRange:textureRequestIDs:displayAssetFetchResult:targetSize:applyCleanApertureCrop:mediaProvider:", *(void *)(a1 + 160), HIDWORD(*(void *)(a1 + 160)), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 170), *(double *)(a1 + 96), *(double *)(a1 + 104), *(void *)(a1 + 56));
  }
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 168))
  {
    uint64_t v2 = 0;
LABEL_10:
    BYTE1(v4) = *(unsigned char *)(a1 + 170);
    LOBYTE(v4) = *(unsigned char *)(a1 + 171);
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 288), "enqueueRequestsWithSpriteIndexRange:textureRequestIDs:displayAssetFetchResult:observer:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:", *(void *)(a1 + 160), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 48), *(void *)(a1 + 72), *(void *)(a1 + 128), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 136), *(double *)(a1 + 144), v2, *(void *)(a1 + 152), v4, *(void *)(a1 + 56));
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_imageSizeSatisfiedByThumbnail:", *(double *)(a1 + 112), *(double *)(a1 + 120));
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 40) requestThumbnailsOnly];
    if ((result & 1) == 0)
    {
      uint64_t v2 = *(void *)(a1 + 64);
      goto LABEL_10;
    }
  }
  return result;
}

void __61__PXGDisplayAssetTextureProvider_didFinishRequestingTextures__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _processThumbnailRequestsOnRequestQueue:1];
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXGDisplayAssetTextureProvider_didFinishRequestingTextures__block_invoke_2;
  block[3] = &unk_1E5DBF070;
  BOOL v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 48);
  id v5 = v3;
  char v7 = *(unsigned char *)(a1 + 49);
  dispatch_async(v2, block);
}

uint64_t __61__PXGDisplayAssetTextureProvider_didFinishRequestingTextures__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _processThumbnailRequestsOnRequestQueue:0];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_workQueue_processImageRequestsWithAllowedIDs:", *(void *)(a1 + 40));
    if (*(unsigned char *)(a1 + 48))
    {
      if (*(unsigned char *)(a1 + 49))
      {
        BOOL v3 = *(void **)(a1 + 32);
        return objc_msgSend(v3, "_workQueue_processDeferredImageRequests");
      }
    }
  }
  return result;
}

- (void)_workQueue_processImageRequestsWithAllowedIDs:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PXGTextureProvider *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(PXGImageRequestQueue *)self->_workQueue_imageRequestQueue performRequestsWithAllowedIDs:v5];
}

- (void)_workQueue_processDeferredImageRequests
{
  BOOL v3 = [(PXGTextureProvider *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(NSMutableDictionary *)self->_workQueue_deferredImageRequestBlocksByTextureID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_110];
  workQueue_deferredImageRequestBlocksByTextureID = self->_workQueue_deferredImageRequestBlocksByTextureID;
  [(NSMutableDictionary *)workQueue_deferredImageRequestBlocksByTextureID removeAllObjects];
}

uint64_t __75__PXGDisplayAssetTextureProvider_initWithDefaultMediaProvider_layoutQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40D9D30](a2);
}

uint64_t __57__PXGDisplayAssetTextureProvider_registerImageDataSpecs___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  int v5 = *(_DWORD *)(a2 + 16);
  char v6 = *(void **)(a1 + 32);
  v12[0] = *(void *)a2;
  v12[1] = v4;
  int v13 = v5;
  uint64_t result = [v6 registerImageDataSpec:v12];
  if (!*(unsigned char *)(a1 + 48))
  {
    LOWORD(v8) = *(_WORD *)(a2 + 16);
    double v9 = (double)v8;
    LOWORD(v8) = *(_WORD *)(a2 + 18);
    double v10 = (double)v8;
    uint64_t result = MEMORY[0x1AD10BB40](result, v9, (double)v8, *(double *)(*(void *)(a1 + 40) + 408), *(double *)(*(void *)(a1 + 40) + 416));
    if (result)
    {
      BOOL v11 = (double *)(*(void *)(a1 + 40) + 408);
      *BOOL v11 = v9;
      v11[1] = v10;
    }
  }
  return result;
}

+ (id)defaultMediaVersionHandlerWithDataSourceBeforeChanges:(id)a3 dataSourceAfterChanges:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __111__PXGDisplayAssetTextureProvider_defaultMediaVersionHandlerWithDataSourceBeforeChanges_dataSourceAfterChanges___block_invoke;
  v11[3] = &unk_1E5DC9578;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  double v9 = _Block_copy(v11);

  return v9;
}

- (void)interactionStateDidChange:(id *)a3
{
  id v5 = [off_1E5DA9658 sharedInstance];
  id v6 = v5;
  if (self->_isLowSpec) {
    uint64_t v7 = [v5 videoAllowedAtOrBelowSpeedForLowSpec];
  }
  else {
    uint64_t v7 = [v5 videoAllowedAtOrBelowSpeed];
  }
  uint64_t v8 = v7;
  [(PXGTextureProvider *)self interactionState];
  [(PXGDisplayAssetTextureProvider *)self setVideoRequestsAllowed:v14 <= v8];
  [(PXGTextureProvider *)self interactionState];
  char v9 = v13;
  if (v13 != a3->var7)
  {
    double v10 = [(PXGTextureProvider *)self workQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PXGDisplayAssetTextureProvider_interactionStateDidChange___block_invoke;
    v11[3] = &unk_1E5DCFE98;
    void v11[4] = self;
    char v12 = v9;
    dispatch_async(v10, v11);
  }
}

- (void)setVideoRequestsAllowed:(BOOL)a3
{
  if (self->_videoRequestsAllowed != a3)
  {
    self->_videoRequestsAllowed = a3;
    videoSessionsRequestQueue = self->_videoSessionsRequestQueue;
    if (a3) {
      dispatch_resume(videoSessionsRequestQueue);
    }
    else {
      dispatch_suspend(videoSessionsRequestQueue);
    }
  }
}

uint64_t __60__PXGDisplayAssetTextureProvider_interactionStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_updateTextureStreamingVisibility:", *(unsigned __int8 *)(a1 + 40));
}

void __103__PXGDisplayAssetTextureProvider__workQueue_provideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  BOOL v3 = *(void **)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 92);
  uint64_t v6 = *(unsigned int *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 48);
  v8[0] = *(_OWORD *)(a1 + 32);
  v8[1] = v7;
  [v3 provideCGImage:v2 options:v8 adjustment:v4 isDegraded:v5 forRequestID:v6];
  CGImageRelease(*(CGImageRef *)(a1 + 80));
}

- (PXGDisplayAssetTextureProvider)initWithDefaultMediaProvider:(id)a3 layoutQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PXGDisplayAssetTextureProvider;
  id v9 = [(PXGTextureProvider *)&v46 init];
  if (v9)
  {
    double v10 = [off_1E5DA9658 sharedInstance];
    objc_storeStrong((id *)v9 + 54, a3);
    BOOL v11 = dispatch_queue_attr_make_initially_inactive(0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.photos.texture-provider.video-requests", v11);
    char v13 = (void *)*((void *)v9 + 30);
    *((void *)v9 + 30) = v12;

    *((unsigned char *)v9 + 424) = 1;
    [v9 setLayoutQueue:v8];
    if (v8 == (id)MEMORY[0x1E4F14428])
    {
      uint64_t v14 = +[PXPreloadScheduler sharedScheduler];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __75__PXGDisplayAssetTextureProvider_initWithDefaultMediaProvider_layoutQueue___block_invoke;
      v44[3] = &unk_1E5DD36F8;
      id v45 = v9;
      [v14 scheduleMainQueueTask:v44];
    }
    else
    {
      dispatch_activate(*((dispatch_object_t *)v9 + 30));
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v16 = (void *)*((void *)v9 + 40);
    *((void *)v9 + 40) = v15;

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = (void *)*((void *)v9 + 41);
    *((void *)v9 + 41) = v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.photos.texture-provider.cancel", 0);
    id v20 = (void *)*((void *)v9 + 39);
    *((void *)v9 + 39) = v19;

    unsigned __int16 v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.photos.texture-provider.drawing", v22);
    id v24 = (void *)*((void *)v9 + 29);
    *((void *)v9 + 29) = v23;

    id v25 = objc_alloc_init(PXGThumbnailRequestQueue);
    id v26 = (void *)*((void *)v9 + 31);
    *((void *)v9 + 31) = v25;

    if ([v10 loadThumbnailsAsync])
    {
      long long v27 = objc_alloc_init(PXGThumbnailRequestQueue);
      double v28 = (void *)*((void *)v9 + 35);
      *((void *)v9 + 35) = v27;
    }
    double v29 = objc_alloc_init(PXGImageRequestQueue);
    int v30 = (void *)*((void *)v9 + 36);
    *((void *)v9 + 36) = v29;

    [*((id *)v9 + 36) setImageRequestPerformer:v9];
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v32 = (void *)*((void *)v9 + 37);
    *((void *)v9 + 37) = v31;

    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unsigned int v34 = (void *)*((void *)v9 + 32);
    *((void *)v9 + 32) = v33;

    id v35 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v36 = (void *)*((void *)v9 + 33);
    *((void *)v9 + 33) = v35;

    id v37 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v38 = (void *)*((void *)v9 + 34);
    *((void *)v9 + 34) = v37;

    *((_DWORD *)v9 + 84) = 0;
    id v39 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v40 = (void *)*((void *)v9 + 43);
    *((void *)v9 + 43) = v39;

    id v41 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v42 = (void *)*((void *)v9 + 44);
    *((void *)v9 + 44) = v41;

    PXGLightPlaceholderImage();
  }

  return 0;
}

- (void)_setupRequestOptions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init((Class)off_1E5DA6E70);
  [v3 setNetworkAccessAllowed:1];
  uint64_t v4 = (void *)[v3 copy];
  [v4 setDeliveryMode:0];
  [v4 setOpportunisticDegradedImagesToReturn:2];
  if ([(PXGTextureProvider *)self preferBGRA]) {
    objc_msgSend(v4, "setLoadingMode:", objc_msgSend(v4, "loadingMode") | 0x40000);
  }
  uint64_t v5 = (void *)[v4 copy];
  objc_msgSend(v5, "setLoadingMode:", objc_msgSend(v5, "loadingMode") | 0x40000);
  uint64_t v6 = (void *)[v3 copy];
  [v6 setDeliveryMode:1];
  if ([(PXGTextureProvider *)self preferBGRA]) {
    objc_msgSend(v6, "setLoadingMode:", objc_msgSend(v6, "loadingMode") | 0x40000);
  }
  id v7 = (void *)[v6 copy];
  objc_msgSend(v7, "setLoadingMode:", objc_msgSend(v7, "loadingMode") | 0x40000);
  v10[0] = v4;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  requestOptions = self->_requestOptions;
  self->_requestOptions = v8;
}

- (void)_workQueue_updateTextureStreamingVisibility:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_workQueue_textureStreamingSessionsMap objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * v8) presentationController];
        double v10 = v9;
        if (v9)
        {
          BOOL v11 = [v9 accessQueue];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          void v12[2] = __78__PXGDisplayAssetTextureProvider__workQueue_updateTextureStreamingVisibility___block_invoke;
          v12[3] = &unk_1E5DCFE98;
          id v13 = v10;
          BOOL v14 = a3;
          dispatch_async(v11, v12);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMediaProvider, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_lookupLock_requestIDsWithDeliveredPlaceholders, 0);
  objc_storeStrong((id *)&self->_lookupLock_requestIDsWithDeliveredThumbnails, 0);
  objc_storeStrong((id *)&self->_cancelationQueue_deferredMediaRequestIDByTextureID, 0);
  objc_storeStrong((id *)&self->_cancelationQueue_mediaRequestIDByTextureID, 0);
  objc_storeStrong((id *)&self->_cancelationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue_crossfadeRenderContext, 0);
  objc_storeStrong((id *)&self->_workQueue_deferredImageRequestBlocksByTextureID, 0);
  objc_storeStrong((id *)&self->_workQueue_imageRequestQueue, 0);
  objc_storeStrong((id *)&self->_workQueue_thumbnailRequestQueue, 0);
  objc_storeStrong((id *)&self->_workQueue_textureRequestIDsThatCannotBeSatisfiedWithThumbnails, 0);
  objc_storeStrong((id *)&self->_workQueue_textureRequestIDsWithDeliveredVideoFrames, 0);
  objc_storeStrong((id *)&self->_workQueue_textureStreamingSessionsMap, 0);
  objc_storeStrong((id *)&self->_requestQueue_thumbnailRequestQueue, 0);
  objc_storeStrong((id *)&self->_videoSessionsRequestQueue, 0);
  objc_storeStrong((id *)&self->_drawingQueue, 0);
}

- (BOOL)videoRequestsAllowed
{
  return self->_videoRequestsAllowed;
}

- (void)setDisplayLinkLastTargetTimestamp:(double)a3
{
  self->_displayLinkLastTargetTimestamp = a3;
}

- (double)displayLinkLastTargetTimestamp
{
  return self->_displayLinkLastTargetTimestamp;
}

- (void)_workQueue_cancelTextureRequests:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PXGImageRequestQueue *)self->_workQueue_imageRequestQueue cancelTextureRequests:v4];
  if ([(NSMutableDictionary *)self->_workQueue_deferredImageRequestBlocksByTextureID count])
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __67__PXGDisplayAssetTextureProvider__workQueue_cancelTextureRequests___block_invoke;
    v46[3] = &unk_1E5DD3010;
    v46[4] = self;
    [v4 enumerateIndexesUsingBlock:v46];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_workQueue_textureStreamingSessionsMap allKeys];
  uint64_t v34 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v34)
  {
    double v32 = v40;
    uint64_t v33 = *(void *)v43;
    id v31 = self;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(v6);
        }
        uint64_t v8 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_workQueue_textureStreamingSessionsMap, "objectForKeyedSubscript:", v8, v31, v32);
        [v9 removeTextureRequestIDs:v4];
        double v10 = [v9 textureRequestIDs];
        uint64_t v11 = [v10 count];

        if (!v11)
        {
          uint64_t v12 = [v9 pixelBufferSource];
          if (v12)
          {
            id v13 = (void *)v12;
            BOOL v14 = [v9 displayAsset];

            if (v14)
            {
              long long v15 = [v9 pixelBufferSourcesProvider];
              long long v16 = [v9 displayAsset];
              _NSRange v48 = v16;
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
              long long v17 = v6;
              id v18 = v5;
              v20 = id v19 = v4;
              [v15 recyclePixelBufferSourceForDisplayAssets:v20];

              id v4 = v19;
              id v5 = v18;
              uint64_t v6 = v17;
              self = v31;
            }
          }
          [v5 addObject:v8];
          unsigned __int16 v21 = [v9 presentationController];
          BOOL v22 = v21;
          if (v21)
          {
            dispatch_queue_t v23 = [v21 accessQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            v40[0] = __67__PXGDisplayAssetTextureProvider__workQueue_cancelTextureRequests___block_invoke_2;
            v40[1] = &unk_1E5DD36F8;
            id v41 = v22;
            dispatch_async(v23, block);
          }
        }
      }
      uint64_t v34 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v34);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v24 = v5;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        int v30 = [(NSMutableDictionary *)self->_workQueue_textureStreamingSessionsMap objectForKeyedSubscript:v29];
        [v30 setPixelBufferPool:0];
        [(NSMutableDictionary *)self->_workQueue_textureStreamingSessionsMap setObject:0 forKeyedSubscript:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v26);
  }

  [(NSMutableIndexSet *)self->_workQueue_textureRequestIDsWithDeliveredVideoFrames removeIndexes:v4];
  [(NSMutableIndexSet *)self->_workQueue_textureRequestIDsThatCannotBeSatisfiedWithThumbnails removeIndexes:v4];
  os_unfair_lock_lock(&self->_lookupLock);
  [(NSMutableIndexSet *)self->_lookupLock_requestIDsWithDeliveredThumbnails removeIndexes:v4];
  os_unfair_lock_unlock(&self->_lookupLock);
  [(PXGAssetImageCache *)self->_imageCache clearCachedImagesForRequestIDs:v4];
}

void __67__PXGDisplayAssetTextureProvider__workQueue_cancelTextureRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 296);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 removeObjectForKey:v3];
}

uint64_t __67__PXGDisplayAssetTextureProvider__workQueue_cancelTextureRequests___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) recyclePixelBufferSource];
}

- (void)_cancelationQueue_cancelImageRequests:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PXGDisplayAssetTextureProvider__cancelationQueue_cancelImageRequests___block_invoke;
  v5[3] = &unk_1E5DD3010;
  v5[4] = self;
  id v4 = a3;
  [v4 enumerateIndexesUsingBlock:v5];
  os_unfair_lock_lock(&self->_lookupLock);
  [(NSMutableIndexSet *)self->_lookupLock_requestIDsWithDeliveredPlaceholders removeIndexes:v4];

  os_unfair_lock_unlock(&self->_lookupLock);
}

void __72__PXGDisplayAssetTextureProvider__cancelationQueue_cancelImageRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  [NSNumber numberWithUnsignedInteger:a2];
  objc_claimAutoreleasedReturnValue();
  PXGTungstenGetLog();
}

- (void)cancelTextureRequests:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXGDisplayAssetTextureProvider;
  [(PXGTextureProvider *)&v15 cancelTextureRequests:v4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke;
  aBlock[3] = &unk_1E5DD32A8;
  void aBlock[4] = self;
  id v5 = v4;
  id v14 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  BOOL v7 = [(PXGTextureProvider *)self lowMemoryMode];
  cancelationQueue = self->_cancelationQueue;
  if (v7) {
    dispatch_sync(cancelationQueue, v6);
  }
  else {
    dispatch_async(cancelationQueue, v6);
  }
  id v9 = [(PXGTextureProvider *)self requestQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_2;
  v11[3] = &unk_1E5DD32A8;
  void v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(v9, v11);
}

uint64_t __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelationQueue_cancelImageRequests:", *(void *)(a1 + 40));
}

void __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_3;
  v4[3] = &unk_1E5DD32A8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 312);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_4;
  BOOL v7 = &unk_1E5DD32A8;
  uint64_t v8 = v2;
  id v9 = *(id *)(a1 + 40);
  dispatch_async(v3, &v4);
  objc_msgSend(*(id *)(a1 + 32), "_workQueue_cancelTextureRequests:", *(void *)(a1 + 40), v4, v5, v6, v7, v8);
}

uint64_t __56__PXGDisplayAssetTextureProvider_cancelTextureRequests___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelationQueue_cancelImageRequests:", *(void *)(a1 + 40));
}

- (__CVBuffer)_workQueue_renderCrossfadeIfNeededWithPixelBuffer:(__CVBuffer *)a3 forVideoSession:(id)a4 textureRequestID:(id)a5 useLowMemoryMode:(BOOL)a6
{
  v95[5] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = [(PXGTextureProvider *)self workQueue];
  dispatch_assert_queue_V2(v12);

  CVPixelBufferRef pixelBufferOut = 0;
  id v13 = [v10 displayAsset];
  id v14 = [v10 presentationController];
  objc_super v15 = v14;
  if (v14)
  {
    if (([v14 isCrossfadingFromStillToVideoEnabled] & 1) == 0) {
      goto LABEL_30;
    }
  }
  else if (a6)
  {
LABEL_30:
    [v10 setPixelBufferPool:0];
    unsigned int v71 = pixelBufferOut;
    goto LABEL_31;
  }
  long long v16 = [off_1E5DA9658 sharedInstance];
  [v16 livePhotoInitialCrossfadeDuration];
  double v18 = v17;

  if (v18 <= 0.0 || [v13 playbackStyle] != 3) {
    goto LABEL_30;
  }
  id v19 = [off_1E5DA9658 sharedInstance];
  [v19 livePhotoInitialCrossfadeDuration];
  double v21 = v20;

  id v22 = [v10 firstPixelBufferDisplayDate];
  dispatch_queue_t v23 = [MEMORY[0x1E4F1C9C8] date];
  if (!v22)
  {
    id v24 = [v10 presentationController];

    if (v24
      && ([v10 presentationController],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          uint64_t v26 = [v25 desiredPlayState],
          v25,
          v26 != 1))
    {
      id v22 = 0;
    }
    else
    {
      id v22 = v23;
      [v10 setFirstPixelBufferDisplayDate:v22];
    }
  }
  [v23 timeIntervalSinceDate:v22];
  if (v27 < v21)
  {
    double v28 = v27;
    unsigned int v92 = 1;
    char v91 = 1;
    uint64_t v90 = 0;
    imageCache = self->_imageCache;
    uint64_t v30 = [v11 firstIndex];
    if (-[PXGAssetImageCache getCachedImage:withOrientation:outIsDegraded:forAsset:targetSize:contentMode:forRequestID:](imageCache, "getCachedImage:withOrientation:outIsDegraded:forAsset:targetSize:contentMode:forRequestID:", &v90, &v92, &v91, v13, 0, v30, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8)))
    {
      if (v90)
      {
        id v31 = objc_alloc(MEMORY[0x1E4F1E050]);
        double v32 = (void *)[v31 initWithCGImage:v90];
        uint64_t v82 = [v32 imageByApplyingCGOrientation:v92];

        uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:a3];
        uint64_t v34 = [v10 pixelBufferSource];
        long long v35 = v34;
        int v76 = v23;
        if (v34)
        {
          [v34 preferredTransform];
        }
        else
        {
          long long v88 = 0u;
          long long v89 = 0u;
          long long v87 = 0u;
        }
        objc_super v81 = v33;
        long long v36 = _PXGRotatedImageWithTransform(v33);

        long long v37 = [v10 displayAsset];
        if ([v37 playbackStyle] == 3) {
          double v38 = 0.9;
        }
        else {
          double v38 = 1.0;
        }

        [v36 extent];
        double v40 = v39;
        [v82 extent];
        long long v42 = objc_msgSend(v82, "px_imageByApplyingScale:", v40 / v41 / v38);
        [v42 extent];
        double v44 = v43;
        double v46 = v45;
        [v36 extent];
        char v78 = v42;
        double v49 = objc_msgSend(v42, "imageByCroppingToRect:", (v44 - v47) * 0.5, (v46 - v48) * 0.5);
        [v49 extent];
        CGFloat v51 = -v50;
        [v49 extent];
        CGAffineTransformMakeTranslation(&v86, v51, -v52);
        unint64_t v53 = [v49 imageByApplyingTransform:&v86];

        id v77 = v53;
        double v54 = objc_msgSend(v53, "px_imageByApplyingAlpha:", 1.0 - v28 / v21);
        uint64_t v79 = v36;
        double v55 = [v54 imageByCompositingOverImage:v36];
        unint64_t v56 = [v10 pixelBufferSource];
        _PXGSpriteIndexRange v57 = v56;
        unsigned int v75 = v54;
        if (v56) {
          [v56 preferredTransform];
        }
        else {
          memset(&v84, 0, sizeof(v84));
        }
        CGAffineTransformInvert(&v85, &v84);
        int v80 = _PXGRotatedImageWithTransform(v55);

        dispatch_queue_t v23 = v76;
        if (!self->_workQueue_crossfadeRenderContext)
        {
          BOOL v58 = (CIContext *)objc_alloc_init(MEMORY[0x1E4F1E018]);
          workQueue_crossfadeRenderContext = self->_workQueue_crossfadeRenderContext;
          self->_workQueue_crossfadeRenderContext = v58;
        }
        BOOL v60 = (__CVPixelBufferPool *)[v10 pixelBufferPool];
        CVPixelBufferPoolRef poolOut = v60;
        BOOL v61 = v81;
        if (!v60)
        {
          uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
          unsigned int v73 = MEMORY[0x1AD10B480](PixelFormatType);
          uint64_t v63 = *MEMORY[0x1E4F24D20];
          v94[0] = *MEMORY[0x1E4F24D40];
          v94[1] = v63;
          v95[0] = MEMORY[0x1E4F1CC38];
          v95[1] = MEMORY[0x1E4F1CC08];
          _OWORD v94[2] = *MEMORY[0x1E4F24E10];
          BOOL v64 = NSNumber;
          [v80 extent];
          v74 = [v64 numberWithDouble:v65];
          v95[2] = v74;
          v94[3] = *MEMORY[0x1E4F24D08];
          double v66 = NSNumber;
          [v80 extent];
          double v68 = [v66 numberWithDouble:v67];
          v95[3] = v68;
          v94[4] = *MEMORY[0x1E4F24D70];
          v69 = [NSNumber numberWithUnsignedInt:v73];
          v95[4] = v69;
          CFDictionaryRef v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:5];

          BOOL v61 = v81;
          CVPixelBufferPoolCreate(0, 0, v70, &poolOut);
          [v10 setPixelBufferPool:poolOut];

          BOOL v60 = poolOut;
        }
        CVPixelBufferPoolCreatePixelBuffer(0, v60, &pixelBufferOut);
        [(CIContext *)self->_workQueue_crossfadeRenderContext render:v80 toCVPixelBuffer:pixelBufferOut];
      }
    }
  }

  unsigned int v71 = pixelBufferOut;
  if (!pixelBufferOut) {
    goto LABEL_30;
  }
LABEL_31:

  return v71;
}

- (void)_workQueue_cleanupTextureStreamingSession:(id)a3 textureRequestIDs:(id)a4
{
  id v6 = a3;
  workQueue_textureRequestIDsWithDeliveredVideoFrames = self->_workQueue_textureRequestIDsWithDeliveredVideoFrames;
  id v8 = a4;
  [(NSMutableIndexSet *)workQueue_textureRequestIDsWithDeliveredVideoFrames removeIndexes:v8];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __94__PXGDisplayAssetTextureProvider__workQueue_cleanupTextureStreamingSession_textureRequestIDs___block_invoke;
  id v13 = &unk_1E5DD1558;
  id v14 = self;
  id v15 = v6;
  id v9 = v6;
  [v8 enumerateIndexesUsingBlock:&v10];

  objc_msgSend(v9, "setFirstPixelBufferDisplayDate:", 0, v10, v11, v12, v13, v14);
}

void __94__PXGDisplayAssetTextureProvider__workQueue_cleanupTextureStreamingSession_textureRequestIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) displayAsset];
  objc_msgSend(v3, "_workQueue_performRequestForDisplayAsset:textureRequestID:sharedState:", v4, a2, 0);
}

- (void)_workQueue_didDeliverVideoContentForRequestID:(int)a3
{
}

- (void)_workQueue_provideVideoFrameForTextureStreamingSession:(id)a3 useLowMemoryMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [v6 textureRequestIDs];
  id v8 = [v6 pixelBufferSource];
  id v9 = CVPixelBufferRetain((CVPixelBufferRef)[v8 currentPixelBuffer]);

  kdebug_trace();
  if (v9)
  {
    uint64_t v10 = [(PXGDisplayAssetTextureProvider *)self _workQueue_renderCrossfadeIfNeededWithPixelBuffer:v9 forVideoSession:v6 textureRequestID:v7 useLowMemoryMode:v4];
    if (v10)
    {
      uint64_t v11 = v10;
      CVPixelBufferRelease(v9);
      id v9 = v11;
    }
    id v12 = [v6 displayAdjustment];
    long long v36 = 0u;
    long long v37 = 0u;
    long long location = 0u;
    id v13 = [v6 pixelBufferSource];
    id v14 = v13;
    if (v13)
    {
      [v13 preferredTransform];
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long location = 0u;
    }

    [(NSMutableIndexSet *)self->_workQueue_textureRequestIDsWithDeliveredVideoFrames addIndexes:v7];
    id v19 = [(PXGTextureProvider *)self requestQueue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __106__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession_useLowMemoryMode___block_invoke;
    v27[3] = &unk_1E5DBD218;
    id v20 = v7;
    long long v31 = location;
    long long v32 = v36;
    long long v33 = v37;
    id v28 = v20;
    uint64_t v29 = self;
    uint64_t v34 = v9;
    id v30 = v12;
    id v15 = v12;
    dispatch_async(v19, v27);
  }
  else
  {
    id v15 = [v6 presentationController];
    if (v15)
    {
      objc_initWeak((id *)&location, self);
      long long v16 = [(PXGTextureProvider *)self workQueue];
      double v17 = [v15 accessQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __106__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession_useLowMemoryMode___block_invoke_3;
      block[3] = &unk_1E5DBDF50;
      id v22 = v15;
      id v23 = v16;
      id v18 = v16;
      objc_copyWeak(&v26, (id *)&location);
      id v24 = v6;
      id v25 = v7;
      dispatch_async(v17, block);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)&location);
    }
    else
    {
      [(PXGDisplayAssetTextureProvider *)self _workQueue_cleanupTextureStreamingSession:v6 textureRequestIDs:v7];
    }
  }

  kdebug_trace();
}

void __106__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession_useLowMemoryMode___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession_useLowMemoryMode___block_invoke_2;
  v5[3] = &unk_1E5DBD1F0;
  long long v2 = *(_OWORD *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  long long v8 = v2;
  long long v9 = *(_OWORD *)(a1 + 88);
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 104);
  id v6 = v4;
  [v3 enumerateIndexesUsingBlock:v5];
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 104));
}

void __106__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession_useLowMemoryMode___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldDisplayPreviousNonNullPixelBuffer] & 1) == 0)
  {
    long long v2 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __106__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession_useLowMemoryMode___block_invoke_4;
    block[3] = &unk_1E5DD2548;
    objc_copyWeak(&v6, (id *)(a1 + 64));
    id v4 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 56);
    dispatch_async(v2, block);

    objc_destroyWeak(&v6);
  }
}

void __106__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession_useLowMemoryMode___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_workQueue_cleanupTextureStreamingSession:textureRequestIDs:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __106__PXGDisplayAssetTextureProvider__workQueue_provideVideoFrameForTextureStreamingSession_useLowMemoryMode___block_invoke_2(_OWORD *a1)
{
  long long v1 = a1[4];
  long long v2 = a1[3];
  long long v3 = v1;
  long long v4 = a1[5];
  PXGSpriteTextureInfoOrientationFromCGAffineTransform();
}

- (void)_handleProvidePlaceholderForTextureRequestID:(int)a3
{
  char v11 = 0;
  __int16 v10 = 0;
  memset(v14, 0, sizeof(v14));
  long long v6 = *(_OWORD *)off_1E5DAAFA0;
  id v5 = [(PXGTextureProvider *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __79__PXGDisplayAssetTextureProvider__handleProvidePlaceholderForTextureRequestID___block_invoke;
  block[3] = &unk_1E5DBD1C8;
  id v15 = self;
  long long v8 = v6;
  char v9 = 0;
  int v12 = 0;
  char v13 = 0;
  int v16 = a3;
  dispatch_async(v5, block);
}

uint64_t __79__PXGDisplayAssetTextureProvider__handleProvidePlaceholderForTextureRequestID___block_invoke(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 64);
  uint64_t v2 = v1[48];
  uint64_t v3 = *(unsigned int *)(a1 + 72);
  long long v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  return objc_msgSend(v1, "_workQueue_provideCGImage:options:adjustment:isDegraded:forRequestID:", v2, v6, 0, 0, v3);
}

- (void)_handlePixelBufferChangedForTextureStreamingSession:(id)a3 useLowMemoryMode:(BOOL)a4
{
  id v6 = a3;
  long long v7 = [(PXGTextureProvider *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __103__PXGDisplayAssetTextureProvider__handlePixelBufferChangedForTextureStreamingSession_useLowMemoryMode___block_invoke;
  block[3] = &unk_1E5DD21E8;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __103__PXGDisplayAssetTextureProvider__handlePixelBufferChangedForTextureStreamingSession_useLowMemoryMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_provideVideoFrameForTextureStreamingSession:useLowMemoryMode:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_workQueue_startRequestingVideoTexturesForDisplayAsset:(id)a3 presentationController:(id)a4 pixelBufferSource:(id)a5 pixelBufferSourcesProvider:(id)a6 adjustment:(id)a7 textureRequestID:(int)a8 useLowMemoryMode:(BOOL)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if ([(PXGTextureProvider *)self isRequestActive:v9])
  {
    if (v16) {
      [v16 identifier];
    }
    else {
    id v20 = [v15 uuid];
    }
    double v21 = [(NSMutableDictionary *)self->_workQueue_textureStreamingSessionsMap objectForKeyedSubscript:v20];
    if (!v21)
    {
      double v21 = [[_PXGTextureStreamingSession alloc] initWithDisplayAsset:v15 presentationController:v16 pixelBufferSource:v17 pixelBufferSourcesProvider:v18 adjustment:v19];
      [(NSMutableDictionary *)self->_workQueue_textureStreamingSessionsMap setObject:v21 forKeyedSubscript:v20];
    }
    [(_PXGTextureStreamingSession *)v21 addTextureRequestID:v9];
    objc_initWeak(location, self);
    objc_initWeak(&from, v21);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __202__PXGDisplayAssetTextureProvider__workQueue_startRequestingVideoTexturesForDisplayAsset_presentationController_pixelBufferSource_pixelBufferSourcesProvider_adjustment_textureRequestID_useLowMemoryMode___block_invoke;
    v25[3] = &unk_1E5DCD2E8;
    objc_copyWeak(&v26, location);
    objc_copyWeak(&v27, &from);
    BOOL v28 = a9;
    [v17 setPixelBufferDidChangeHandler:v25];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __202__PXGDisplayAssetTextureProvider__workQueue_startRequestingVideoTexturesForDisplayAsset_presentationController_pixelBufferSource_pixelBufferSourcesProvider_adjustment_textureRequestID_useLowMemoryMode___block_invoke_2;
    v22[3] = &unk_1E5DC0B68;
    objc_copyWeak(&v23, location);
    int v24 = v9;
    [v17 setProvidePlaceholderHandler:v22];
    [(PXGDisplayAssetTextureProvider *)self _workQueue_provideVideoFrameForTextureStreamingSession:v21 useLowMemoryMode:a9];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

void __202__PXGDisplayAssetTextureProvider__workQueue_startRequestingVideoTexturesForDisplayAsset_presentationController_pixelBufferSource_pixelBufferSourcesProvider_adjustment_textureRequestID_useLowMemoryMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handlePixelBufferChangedForTextureStreamingSession:v2 useLowMemoryMode:*(unsigned __int8 *)(a1 + 48)];
}

void __202__PXGDisplayAssetTextureProvider__workQueue_startRequestingVideoTexturesForDisplayAsset_presentationController_pixelBufferSource_pixelBufferSourcesProvider_adjustment_textureRequestID_useLowMemoryMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleProvidePlaceholderForTextureRequestID:*(unsigned int *)(a1 + 40)];
}

- (void)_workQueue_requestVideoTexturesForSpriteAtIndex:(unsigned int)a3 spriteReference:(id)a4 displayAsset:(id)a5 presentationController:(id)a6 adjustment:(id)a7 presentationType:(unsigned __int8)a8 textureRequestID:(int)a9 mediaProvider:(id)a10 pixelBufferSourcesProvider:(id)a11 useLowMemoryMode:(BOOL)a12
{
  id v45 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  id v20 = a11;
  double v21 = [(PXGTextureProvider *)self workQueue];
  id v22 = [(PXGTextureProvider *)self requestQueue];
  objc_initWeak(location, self);
  double v46 = v17;
  if (v17)
  {
    double v40 = v21;
    id v41 = v20;
    [(PXGTextureProvider *)self interactionState];
    char v23 = v69;
    int v24 = [v17 accessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke;
    block[3] = &unk_1E5DBD178;
    id v25 = &v64;
    objc_copyWeak(&v64, location);
    int v65 = a9;
    double v44 = &v58;
    id v26 = v17;
    char v66 = v23;
    unsigned __int8 v67 = a8;
    id v27 = &v59;
    id v58 = v26;
    id v59 = v19;
    BOOL v28 = (id *)v60;
    v60[0] = v40;
    v60[1] = self;
    id v61 = v16;
    id v62 = v18;
    id v63 = v22;
    BOOL v68 = a12;
    id v29 = v18;
    id v30 = v16;
    id v31 = v40;
    id v32 = v19;
    dispatch_async(v24, block);

    double v21 = v40;
    long long v33 = v45;
    uint64_t v34 = v41;
  }
  else
  {
    queuea = self->_videoSessionsRequestQueue;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_7;
    v47[3] = &unk_1E5DBD1A0;
    id v25 = &v54;
    objc_copyWeak(&v54, location);
    int v55 = a9;
    double v44 = &v48;
    id v35 = v20;
    uint64_t v34 = v20;
    id v27 = &v49;
    id v48 = v35;
    id v49 = v16;
    BOOL v28 = &v50;
    id v50 = v19;
    long long v33 = v45;
    id v51 = v45;
    id v52 = v21;
    id v53 = v18;
    BOOL v56 = a12;
    id v36 = v18;
    id v37 = v16;
    id v38 = v21;
    id v39 = v19;
    dispatch_async(queuea, v47);
  }
  objc_destroyWeak(v25);
  objc_destroyWeak(location);
}

void __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 88);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  int v4 = [WeakRetained isRequestActive:*(unsigned int *)(a1 + 96)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) accessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_2;
    block[3] = &unk_1E5DCFE98;
    id v35 = *(id *)(a1 + 32);
    char v36 = *(unsigned char *)(a1 + 100);
    dispatch_async(v5, block);

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 101) == 1)
    {
      id v8 = [v6 videoSessionWithMediaProvider:v7];
      uint64_t v9 = [[PXGVideoPlayerViewConfiguration alloc] initWithVideoSession:v8 toneMapToStandardDynamicRange:1];
      id v10 = [[PXGViewPayload alloc] initWithViewClass:objc_opt_class() userData:v9];
      BOOL v11 = *(NSObject **)(a1 + 48);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_4;
      v25[3] = &unk_1E5DBD128;
      objc_copyWeak(&v32, v2);
      int v33 = *(_DWORD *)(a1 + 96);
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 56);
      id v14 = *(void **)(a1 + 64);
      id v26 = v12;
      uint64_t v27 = v13;
      id v28 = v14;
      id v29 = *(id *)(a1 + 72);
      id v30 = *(id *)(a1 + 80);
      id v31 = v10;
      id v15 = v10;
      dispatch_async(v11, v25);

      objc_destroyWeak(&v32);
    }
    else
    {
      id v8 = [v6 pixelBufferSourceWithMediaProvider:v7];
      if (v8)
      {
        id v16 = *(NSObject **)(a1 + 48);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_6;
        v17[3] = &unk_1E5DBD150;
        objc_copyWeak(&v22, v2);
        id v18 = *(id *)(a1 + 64);
        id v19 = *(id *)(a1 + 32);
        id v8 = v8;
        id v20 = v8;
        id v21 = *(id *)(a1 + 72);
        int v23 = *(_DWORD *)(a1 + 96);
        char v24 = *(unsigned char *)(a1 + 102);
        dispatch_async(v16, v17);

        objc_destroyWeak(&v22);
      }
    }
  }
}

void __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_7(uint64_t a1)
{
  id v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  int v4 = [WeakRetained isRequestActive:*(unsigned int *)(a1 + 88)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) pixelBufferSourceForDisplayAsset:*(void *)(a1 + 40) mediaProvider:*(void *)(a1 + 48) spriteReference:*(void *)(a1 + 56)];
    if (v5)
    {
      id v6 = *(NSObject **)(a1 + 64);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_8;
      v7[3] = &unk_1E5DBD150;
      objc_copyWeak(&v12, v2);
      id v8 = *(id *)(a1 + 40);
      id v9 = v5;
      id v10 = *(id *)(a1 + 32);
      id v11 = *(id *)(a1 + 72);
      int v13 = *(_DWORD *)(a1 + 88);
      char v14 = *(unsigned char *)(a1 + 92);
      dispatch_async(v6, v7);

      objc_destroyWeak(&v12);
    }
  }
}

void __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  LOBYTE(v2) = *(unsigned char *)(a1 + 76);
  objc_msgSend(WeakRetained, "_workQueue_startRequestingVideoTexturesForDisplayAsset:presentationController:pixelBufferSource:pixelBufferSourcesProvider:adjustment:textureRequestID:useLowMemoryMode:", *(void *)(a1 + 32), 0, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned int *)(a1 + 72), v2);
}

uint64_t __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_2(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_3;
  v3[3] = &__block_descriptor_33_e61_v16__0___PXGMutableDisplayAssetVideoPresentationController__8l;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 performChanges:v3];
}

void __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  int v4 = [WeakRetained isRequestActive:*(unsigned int *)(a1 + 88)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    id v6 = [*(id *)(*(void *)(a1 + 40) + 256) objectForKeyedSubscript:v5];
    if (!v6)
    {
      id v6 = [[_PXGTextureStreamingSession alloc] initWithDisplayAsset:*(void *)(a1 + 48) presentationController:*(void *)(a1 + 32) pixelBufferSource:0 pixelBufferSourcesProvider:0 adjustment:*(void *)(a1 + 56)];
      [*(id *)(*(void *)(a1 + 40) + 256) setObject:v6 forKeyedSubscript:v5];
    }
    [(_PXGTextureStreamingSession *)v6 addTextureRequestID:*(unsigned int *)(a1 + 88)];
    id v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "_workQueue_didDeliverVideoContentForRequestID:", *(unsigned int *)(a1 + 88));

    id v8 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_5;
    block[3] = &unk_1E5DBD100;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 72);
    int v12 = *(_DWORD *)(a1 + 88);
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
  }
}

void __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  LOBYTE(v2) = *(unsigned char *)(a1 + 76);
  objc_msgSend(WeakRetained, "_workQueue_startRequestingVideoTexturesForDisplayAsset:presentationController:pixelBufferSource:pixelBufferSourcesProvider:adjustment:textureRequestID:useLowMemoryMode:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), 0, *(void *)(a1 + 56), *(unsigned int *)(a1 + 72), v2);
}

void __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained providePayload:*(void *)(a1 + 32) forRequestID:*(unsigned int *)(a1 + 48)];
}

uint64_t __237__PXGDisplayAssetTextureProvider__workQueue_requestVideoTexturesForSpriteAtIndex_spriteReference_displayAsset_presentationController_adjustment_presentationType_textureRequestID_mediaProvider_pixelBufferSourcesProvider_useLowMemoryMode___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setIsVisible:*(unsigned __int8 *)(a1 + 32)];
}

void __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)off_1E5DAAFC0];
  [v2 provideFailureWithError:v3 forRequestID:*(unsigned int *)(a1 + 48)];
}

void __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRequestActive:*(unsigned int *)(a1 + 104)]
    && ([*(id *)(a1 + 40) postProcessOptions] & 1) != 0)
  {
    [*(id *)(a1 + 32) viewEnvironment];
    [(id)objc_claimAutoreleasedReturnValue() backgroundColor];
    [ objc_claimAutoreleasedReturnValue() CGColor];
    PXGCreateBurstImageStackFromImage();
  }
  CGImageRelease(*(CGImageRef *)(a1 + 72));
}

void __140__PXGDisplayAssetTextureProvider__workQueue_handleResult_orientation_info_targetSize_screenScale_mediaRequest_textureRequestID_sharedState___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(unsigned int *)(a1 + 88);
  id v5 = [*(id *)(a1 + 32) asset];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) adjustment];
  LODWORD(v9) = *(_DWORD *)(a1 + 92);
  objc_msgSend(WeakRetained, "_workQueue_handleCGImageResult:orientation:forAsset:info:targetSize:adjustment:shouldCache:textureRequestID:sharedState:", v3, v4, v5, v6, v7, 0, *(double *)(a1 + 72), *(double *)(a1 + 80), v9, *(void *)(a1 + 48));

  id v8 = *(CGImage **)(a1 + 64);
  CGImageRelease(v8);
}

- (void)_workQueue_performDeferredImageRequest:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7 textureRequestID:(int)a8 mediaProvider:(id)a9
{
  uint64_t v10 = *(void *)&a8;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if ([(PXGTextureProvider *)self isRequestActive:v10])
  {
    uint64_t v21 = objc_msgSend(v20, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v17, a5, v18, v19, width, height);
    if (v21)
    {
      cancelationQueue = self->_cancelationQueue;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __149__PXGDisplayAssetTextureProvider__workQueue_performDeferredImageRequest_targetSize_contentMode_options_resultHandler_textureRequestID_mediaProvider___block_invoke;
      v23[3] = &unk_1E5DBD060;
      id v25 = self;
      uint64_t v26 = v21;
      id v24 = v20;
      int v27 = v10;
      dispatch_async(cancelationQueue, v23);
    }
  }
}

void __149__PXGDisplayAssetTextureProvider__workQueue_performDeferredImageRequest_targetSize_contentMode_options_resultHandler_textureRequestID_mediaProvider___block_invoke(uint64_t a1)
{
  uint64_t v4 = [[_PXGMediaRequestToken alloc] initWithMediaProvider:*(void *)(a1 + 32) mediaRequestID:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 328);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v2 setObject:v4 forKeyedSubscript:v3];
}

void __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_workQueue_performDeferredImageRequest:targetSize:contentMode:options:resultHandler:textureRequestID:mediaProvider:", *(void *)(a1 + 32), *(void *)(a1 + 88), *(void *)(a1 + 40), *(void *)(a1 + 56), *(unsigned int *)(a1 + 96), *(void *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __104__PXGDisplayAssetTextureProvider__workQueue_performRequestForDisplayAsset_textureRequestID_sharedState___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_workQueue_performDeferredImageRequest:targetSize:contentMode:options:resultHandler:textureRequestID:mediaProvider:", *(void *)(a1 + 32), *(void *)(a1 + 88), *(void *)(a1 + 40), *(void *)(a1 + 56), *(unsigned int *)(a1 + 96), *(void *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __73__PXGDisplayAssetTextureProvider__workQueue_processDeferredImageRequests__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t __74__PXGDisplayAssetTextureProvider__processThumbnailRequestsOnRequestQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 88);
  long long v4 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v4;
  uint64_t v7 = *(void *)(a1 + 80);
  return objc_msgSend(v2, "_requestQueue_handleThumbnailData:spec:forTextureRequestID:", v1, v6, v3);
}

- (void)_providePlaceholdersForRequestIDs:(_NSRange)a3 placeholderStyle:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a4 == 2)
  {
    transparentPlaceholderImage = self->_transparentPlaceholderImage;
LABEL_7:
    CGImageRetain(transparentPlaceholderImage);
    uint64_t v7 = [(PXGTextureProvider *)self requestQueue];
    id v8 = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_3;
    block[3] = &unk_1E5DD01C8;
    void block[4] = self;
    void block[5] = location;
    block[6] = length;
    block[7] = transparentPlaceholderImage;
    uint64_t v9 = block;
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    transparentPlaceholderImage = [(PXGDisplayAssetTextureProvider *)self placeholderImage];
    goto LABEL_7;
  }
  if (a4) {
    return;
  }
  uint64_t v7 = [(PXGTextureProvider *)self requestQueue];
  id v8 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke;
  v12[3] = &unk_1E5DD35E0;
  v12[5] = location;
  v12[6] = length;
  void v12[4] = self;
  uint64_t v9 = v12;
LABEL_8:
  dispatch_async(v7, v9);
}

void *__85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke(void *result)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_2;
  uint64_t v10 = &unk_1E5DD3010;
  unint64_t v1 = result[5];
  uint64_t v11 = result[4];
  uint64_t v2 = result[6];
  unint64_t v3 = v2 + v1;
  char v12 = 0;
  if (v1 == 0x7FFFFFFFFFFFFFFFLL || v2 == 0) {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v5 = v1;
  }
  if (v5 < v3)
  {
    unint64_t v6 = v3 - 1;
    do
    {
      uint64_t result = (void *)((uint64_t (*)(void *, unint64_t, char *))v9)(v8, v5, &v12);
      if (v12) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v6 == v5;
      }
      ++v5;
    }
    while (!v7);
  }
  return result;
}

void __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_3(void *a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  char v12 = __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_4;
  int v13 = &unk_1E5DC9550;
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];
  long long v4 = (CGImage *)a1[7];
  uint64_t v5 = a1[6];
  uint64_t v14 = v2;
  id v15 = v4;
  unint64_t v6 = v5 + v3;
  char v16 = 0;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0) {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v8 = v3;
  }
  if (v8 < v6)
  {
    unint64_t v9 = v6 - 1;
    do
    {
      ((void (*)(void *, unint64_t, char *))v12)(v11, v8, &v16);
      if (v16) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v9 == v8;
      }
      ++v8;
    }
    while (!v10);
    long long v4 = (CGImage *)a1[7];
  }
  CGImageRelease(v4);
}

uint64_t __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) provideCGImage:*(void *)(a1 + 40) forRequestID:a2];
}

uint64_t __85__PXGDisplayAssetTextureProvider__providePlaceholdersForRequestIDs_placeholderStyle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) provideNothingForRequestID:a2];
}

void __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  *(_WORD *)((char *)&v2 + 1) = *(_WORD *)(a1 + 137);
  LOBYTE(v2) = *(unsigned char *)(a1 + 136);
  objc_msgSend(WeakRetained, "_requestQueue_requestTexturesForSpritesInRange:observer:textureRequestIDs:displayAssetFetchResult:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:cannotBeSatisfiedWithThumbnail:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:", *(void *)(a1 + 128), *(void *)(a1 + 32), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 40), *(void *)(a1 + 88), vcvtq_f64_f32(*(float32x2_t *)(a1 + 96)), *(double *)(a1 + 104), *(double *)(a1 + 112), *(void *)(a1 + 48), *(void *)(a1 + 120), v2, *(void *)(a1 + 56));
}

void __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_4;
  block[3] = &unk_1E5DBCF70;
  objc_copyWeak(&v10, (id *)(a1 + 88));
  int v11 = *(_DWORD *)(a1 + 96);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  char v13 = *(unsigned char *)(a1 + 104);
  int v12 = *(_DWORD *)(a1 + 100);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  char v14 = *(unsigned char *)(a1 + 105);
  dispatch_async(v2, block);

  objc_destroyWeak(&v10);
}

void __100__PXGDisplayAssetTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  LOBYTE(v3) = *(unsigned char *)(a1 + 97);
  LODWORD(v2) = *(_DWORD *)(a1 + 92);
  objc_msgSend(WeakRetained, "_workQueue_requestVideoTexturesForSpriteAtIndex:spriteReference:displayAsset:presentationController:adjustment:presentationType:textureRequestID:mediaProvider:pixelBufferSourcesProvider:useLowMemoryMode:", *(unsigned int *)(a1 + 88), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 96), v2, *(void *)(a1 + 64), *(void *)(a1 + 72), v3);
}

uint64_t __59__PXGDisplayAssetTextureProvider_viewEnvironmentDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_providePlaceholdersForRequestIDs:placeholderStyle:", a2, a3, 1);
}

- (void)releaseCachedResources
{
  v3.receiver = self;
  v3.super_class = (Class)PXGDisplayAssetTextureProvider;
  [(PXGTextureProvider *)&v3 releaseCachedResources];
  [(PXGAssetImageCache *)self->_imageCache clearAllCachedImages];
}

uint64_t __78__PXGDisplayAssetTextureProvider__workQueue_updateTextureStreamingVisibility___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__PXGDisplayAssetTextureProvider__workQueue_updateTextureStreamingVisibility___block_invoke_2;
  v3[3] = &__block_descriptor_33_e61_v16__0___PXGMutableDisplayAssetVideoPresentationController__8l;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 performChanges:v3];
}

uint64_t __78__PXGDisplayAssetTextureProvider__workQueue_updateTextureStreamingVisibility___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsVisible:*(unsigned __int8 *)(a1 + 32)];
}

- (void)dealloc
{
  CGImageRelease(self->_lightPlaceholderImage);
  CGImageRelease(self->_darkPlaceholderImage);
  CGImageRelease(self->_transparentPlaceholderImage);
  if (!self->_videoRequestsAllowed)
  {
    self->_videoRequestsAllowed = 1;
    dispatch_resume((dispatch_object_t)self->_videoSessionsRequestQueue);
  }
  v3.receiver = self;
  v3.super_class = (Class)PXGDisplayAssetTextureProvider;
  [(PXGTextureProvider *)&v3 dealloc];
}

- (PXGDisplayAssetTextureProvider)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGDisplayAssetTextureProvider.m", 244, @"%s is not available as initializer", "-[PXGDisplayAssetTextureProvider init]");

  abort();
}

BOOL __111__PXGDisplayAssetTextureProvider_defaultMediaVersionHandlerWithDataSourceBeforeChanges_dataSourceAfterChanges___block_invoke(uint64_t a1, long long *a2, long long *a3)
{
  id v5 = *(void **)(a1 + 32);
  long long v6 = a2[1];
  long long v17 = *a2;
  long long v18 = v6;
  id v7 = [v5 assetAtItemIndexPath:&v17];
  id v8 = *(void **)(a1 + 40);
  long long v9 = a3[1];
  long long v17 = *a3;
  long long v18 = v9;
  id v10 = [v8 assetAtItemIndexPath:&v17];
  id v11 = v7;
  int v12 = v11;
  if (v10 == v11)
  {
    BOOL v14 = 0;
  }
  else
  {
    if (v11) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      BOOL v14 = 1;
    }
    else
    {
      uint64_t v15 = [v10 isContentEqualTo:v11];
      if (!v15) {
        uint64_t v15 = [v12 isContentEqualTo:v10];
      }
      BOOL v14 = v15 != 2;
    }
  }

  return v14;
}

@end