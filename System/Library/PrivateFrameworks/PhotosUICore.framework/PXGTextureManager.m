@interface PXGTextureManager
- (BOOL)_getRequestDetails:(id *)a3 forRequestID:(int)a4;
- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode;
- (BOOL)isInactive;
- (BOOL)lowMemoryMode;
- (BOOL)preferBGRA;
- (BOOL)preferMipmaps;
- (BOOL)streamUpdatedTexturesForDisplayLinkIfNeeded:(id)a3;
- (CGImage)textureSnapshotForSpriteIndex:(unsigned int)a3;
- (NSArray)textureAtlasManagers;
- (NSArray)textureConverters;
- (NSDictionary)texturesByPresentationType;
- (NSString)description;
- (OS_dispatch_queue)layoutQueue;
- (PXGEntityManager)entityManager;
- (PXGTextureManager)initWithEntityManager:(id)a3 layoutQueue:(id)a4;
- (PXGTextureManagerDelegate)delegate;
- (PXGTextureManagerPreheatingStrategy)preheatingStrategy;
- (PXGViewEnvironment)viewEnvironment;
- (id).cxx_construct;
- (id)_createTextureForCGImage:(CGImage *)a3 requestID:(int)a4 requestDetails:(id)a5 processingOptions:(id)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8;
- (id)_createTextureForCVPixelBuffer:(__CVBuffer *)a3 requestID:(int)a4 requestDetails:(id)a5 processingOptions:(id)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8;
- (id)_existingAdjustedTextureForSourceTexture:(id)a3 adjustment:(id)a4 wantsMipmaps:(BOOL)a5 presentationType:(unsigned __int8)a6;
- (id)_existingTextureForCGImage:(CGImage *)a3 processingOptions:(id)a4 presentationType:(unsigned __int8)a5;
- (id)_existingTextureForKey:(id)a3 presentationType:(unsigned __int8)a4;
- (id)_existingTextureForPayload:(id)a3 presentationType:(unsigned __int8)a4;
- (id)_existingTextureForPixelBuffer:(__CVBuffer *)a3 processingOptions:(id)a4 presentationType:(unsigned __int8)a5;
- (id)_storeAdjustedTexture:(id)a3 forSourceTexture:(id)a4 adjustment:(id)a5 mipmaps:(BOOL)a6;
- (id)_storeTexture:(id)a3 forKey:(id)a4;
- (id)_storeTexture:(id)a3 forKey:(id)a4 replaceExisting:(BOOL)a5;
- (id)_storeTexture:(id)a3 forPayload:(id)a4;
- (id)_textureAtlasManagerForImageDataSpec:(id *)a3;
- (id)_textureConverterForPresentationType:(unsigned __int8)a3 contentType:(unint64_t)a4;
- (id)textureProvider:(id)a3 requestRenderSnapshot:(id *)a4 offscreenEffect:(id)a5;
- (int64_t)_processTextureProviderResults;
- (int64_t)streamCount;
- (unint64_t)deferModifiedTextureRequestsDuringViewResizing;
- (unint64_t)preferredColorSpaceName;
- (void)_addTextureToTexturesInUse:(id)a3;
- (void)_applyAdjustment:(id)a3 withMipmaps:(BOOL)a4 toTexture:(id)a5 fromTextureProvider:(id)a6 withTextureConverter:(id)a7 forRequestID:(int)a8 deliveryOrder:(unsigned int)a9 requestDetails:(id)a10;
- (void)_configureAllTextureConverters;
- (void)_configureAllTextureProviders;
- (void)_configureTextureConverter:(id)a3;
- (void)_configureTextureProvider:(id)a3;
- (void)_enumerateSpriteTextures:(id)a3;
- (void)_enumerateTextureConverters:(id)a3;
- (void)_enumerateTextureProviders:(id)a3;
- (void)_handleProvidedSpriteTexture:(id)a3 fromTextureProvider:(id)a4 requestID:(int)a5 deliveryOrder:(unsigned int)a6;
- (void)_lookupLock_requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 textureProvider:(id)a4 mediaKind:(unsigned __int8)a5 presentationType:(unsigned __int8)a6 isAppearing:(BOOL)a7 layout:(id)a8 leafSpriteIndexRange:(_PXGSpriteIndexRange)a9 sprites:(id *)a10 textureStreamInfos:(id *)a11 loadingStatus:(id)a12;
- (void)_processCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8 requestID:(int)a9 requestDetails:(id)a10 deliveryOrder:(unsigned int)a11;
- (void)_processPixelBuffer:(__CVBuffer *)a3 options:(id)a4 adjustment:(id)a5 fromTextureProvider:(id)a6 withTextureConverter:(id)a7 forRequestID:(int)a8 requestDetails:(id)a9 deliveryOrder:(unsigned int)a10;
- (void)_pruneTextures:(id)a3;
- (void)_registerTextureConverter:(id)a3 forPresentationType:(unsigned __int8)a4;
- (void)_removeAllTexturesForPresentationType:(unsigned __int8)a3;
- (void)_requestQueue_scheduleUpdateIfAllowed;
- (void)_requestQueue_setNeedsUpdate;
- (void)_resizeStorageIfNeededForSpriteCount:(int64_t)a3;
- (void)_setNeedsUpdate;
- (void)_streamTexturesForSpritesInDataStore:(id)a3 presentationDataStore:(id)a4 changeDetails:(id)a5 layout:(id)a6 interactionState:(id *)a7 loadingStatus:(id)a8;
- (void)_updatePreheatingStrategy;
- (void)dealloc;
- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4;
- (void)releaseCachedResources;
- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3;
- (void)setDeferModifiedTextureRequestsDuringViewResizing:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInactive:(BOOL)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setPreferBGRA:(BOOL)a3;
- (void)setPreferMipmaps:(BOOL)a3;
- (void)setPreferredColorSpaceName:(unint64_t)a3;
- (void)setPreheatingStrategy:(id)a3;
- (void)setTextureAtlasManagers:(id)a3;
- (void)setTextureConverters:(id)a3;
- (void)setViewEnvironment:(id)a3;
- (void)streamTexturesForSpritesInDataStore:(id)a3 presentationDataStore:(id)a4 changeDetails:(id)a5 layout:(id)a6 interactionState:(id *)a7;
- (void)textureProvider:(id)a3 didProvideCGImage:(CGImage *)a4 options:(id)a5 adjustment:(id)a6 isDegraded:(BOOL)a7 forRequestID:(int)a8;
- (void)textureProvider:(id)a3 didProvideFailureWithError:(id)a4 forRequestID:(int)a5;
- (void)textureProvider:(id)a3 didProvideImageData:(id)a4 withSpecAtIndex:(int64_t)a5 size:(CGSize)a6 bytesPerRow:(unint64_t)a7 contentsRect:(CGRect)a8 forRequestID:(int)a9;
- (void)textureProvider:(id)a3 didProvideNothingForRequestID:(int)a4;
- (void)textureProvider:(id)a3 didProvidePayload:(id)a4 forRequestID:(int)a5;
- (void)textureProvider:(id)a3 didProvidePixelBuffer:(__CVBuffer *)a4 options:(id)a5 adjustment:(id)a6 forRequestID:(int)a7;
- (void)textureProviderNeedsToRegisterToDisplayLinkUpdates:(id)a3;
- (void)textureProviderNeedsToUnregisterFromDisplayLinkUpdates:(id)a3;
@end

@implementation PXGTextureManager

- (void)textureProvider:(id)a3 didProvideNothingForRequestID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  emptyTexture = self->_emptyTexture;
  atomic_fetch_add(PXGMakeNextTextureDeliveryOrderID::lastRequestID, 1u);
  -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", emptyTexture, v7, v4);
}

- (void)_handleProvidedSpriteTexture:(id)a3 fromTextureProvider:(id)a4 requestID:(int)a5 deliveryOrder:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  v23[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if ([v11 isRequestActive:v7])
  {
    [v10 addSpriteWithTextureRequestID:v7 deliveryOrder:v6];
    v12 = [NSNumber numberWithInt:v7];
    v23[0] = v12;
    v13 = [NSNumber numberWithUnsignedInt:v6];
    v23[1] = v13;
    v23[2] = v10;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];

    v15 = [(PXGTextureManager *)self layoutQueue];
    LODWORD(v12) = v15 == (void *)MEMORY[0x1E4F14428];

    if (v12)
    {
      [(PXGTextureManager *)self performSelectorOnMainThread:sel__addTextureToTexturesInUse_ withObject:v14 waitUntilDone:0];
    }
    else
    {
      v16 = [(PXGTextureManager *)self layoutQueue];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __94__PXGTextureManager__handleProvidedSpriteTexture_fromTextureProvider_requestID_deliveryOrder___block_invoke;
      v20 = &unk_1E5DD32A8;
      v21 = self;
      id v22 = v14;
      dispatch_async(v16, &v17);
    }
    [(PXGTextureManager *)self _requestQueue_setNeedsUpdate];
  }
}

- (void)_requestQueue_scheduleUpdateIfAllowed
{
  if (!atomic_fetch_or((atomic_uchar *volatile)&self->_isPerformingUpdateFromRequestQueue, 1u))
  {
    self->_requestQueue_pendingSetNeedsUpdate = 0;
    v3 = [(PXGTextureManager *)self layoutQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PXGTextureManager__requestQueue_scheduleUpdateIfAllowed__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)_requestQueue_setNeedsUpdate
{
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_48(uint64_t a1, unint64_t a2, void *a3)
{
  int v4 = a2;
  unint64_t v6 = HIDWORD(a2);
  id v11 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v7 = v11;
  if (v6 != 1)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[PXGTextureManager _streamTexturesForSpritesInDataStore:presentationDataStore:changeDetails:layout:interactionState:loadingStatus:]_block_invoke"];
    [v9 handleFailureInFunction:v10, @"PXGTextureManager.mm", 817, @"Invalid parameter not satisfying: %@", @"subrange.length == 1" file lineNumber description];

    uint64_t v7 = v11;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_DWORD *)(v8 + 48) = v4;
  *(_DWORD *)(v8 + 52) = v6;
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3_42(uint64_t a1, unint64_t a2, void *a3)
{
  id v23 = a3;
  unint64_t v5 = HIDWORD(a2);
  if (HIDWORD(a2) + (int)a2 <= a2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    unsigned __int8 v6 = 0;
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    uint64_t v11 = 0;
    v12 = (_OWORD *)(a1 + 64);
    unsigned __int8 v13 = -1;
    do
    {
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      unsigned int v16 = *(_DWORD *)(v15 + 24);
      uint64_t v17 = *(unsigned __int8 *)(v14 + 40 * v16 + 1);
      if (__PAIR64__(v17, *(unsigned __int8 *)(v14 + 40 * v16)) != __PAIR64__(v13, v6))
      {
        if (v9 && v7)
        {
          long long v18 = *(_OWORD *)(a1 + 80);
          v26[0] = *v12;
          v26[1] = v18;
          uint64_t v27 = *(void *)(a1 + 96);
          objc_msgSend(*(id *)(a1 + 32), "_lookupLock_requestTexturesForSpritesInRange:textureProvider:mediaKind:presentationType:isAppearing:layout:leafSpriteIndexRange:sprites:textureStreamInfos:loadingStatus:", v10 | (unint64_t)(v11 << 32), v7, v13, v6, 1, v23, v8 | (unint64_t)(v9 << 32), v26, *(void *)(a1 + 104), *(void *)(a1 + 40));
          uint64_t v14 = *(void *)(a1 + 56);
          unsigned int v16 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          uint64_t v17 = *(unsigned __int8 *)(v14 + 40 * v16 + 1);
        }
        unsigned __int8 v6 = *(unsigned char *)(v14 + 40 * v16);
        v19 = *(void **)(*(void *)(a1 + 32) + 144);
        v20 = [NSNumber numberWithUnsignedChar:v17];
        uint64_t v21 = [v19 objectForKeyedSubscript:v20];

        LODWORD(v11) = 0;
        LODWORD(v9) = 0;
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        unsigned int v16 = *(_DWORD *)(v15 + 24);
        unsigned int v10 = v16;
        unsigned int v8 = a2;
        uint64_t v7 = (void *)v21;
        unsigned __int8 v13 = v17;
      }
      uint64_t v9 = (v9 + 1);
      uint64_t v11 = (v11 + 1);
      *(_DWORD *)(v15 + 24) = v16 + 1;
      LODWORD(a2) = a2 + 1;
      LODWORD(v5) = v5 - 1;
    }
    while (v5);
    if (v9 && v7)
    {
      long long v22 = *(_OWORD *)(a1 + 80);
      v24[0] = *v12;
      v24[1] = v22;
      uint64_t v25 = *(void *)(a1 + 96);
      objc_msgSend(*(id *)(a1 + 32), "_lookupLock_requestTexturesForSpritesInRange:textureProvider:mediaKind:presentationType:isAppearing:layout:leafSpriteIndexRange:sprites:textureStreamInfos:loadingStatus:", v10 | (unint64_t)(v11 << 32), v7, v13, v6, 1, v23, v8 | (unint64_t)(v9 << 32), v24, *(void *)(a1 + 104), *(void *)(a1 + 40));
    }
  }
}

- (void)_addTextureToTexturesInUse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 integerValue];
  uint64_t v7 = [v4 objectAtIndexedSubscript:1];
  uint64_t v8 = [v7 unsignedIntValue];

  uint64_t v9 = [v4 objectAtIndexedSubscript:2];
  if (([v9 hasPendingTextureRequestID:v6 deliveryOrder:v8] & 1) == 0) {
    goto LABEL_12;
  }
  unsigned int v10 = [(NSMapTable *)self->_pendingSpriteTextureByRequestID objectForKey:v5];
  uint64_t v11 = v10;
  if (v10 && v10 != v9)
  {
    if (![v10 removePendingSpriteWithTextureRequestID:v6 ifDeliveredBefore:v8])
    {
      [v9 removePendingSpriteWithTextureRequestID:v6 ifDeliveredBefore:0xFFFFFFFFLL];
      goto LABEL_9;
    }
    if (([v11 hasSprites] & 1) == 0)
    {
      [(NSHashTable *)self->_spriteTexturesInUse removeObject:v11];
      deallocationsQueue = self->_deallocationsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__PXGTextureManager__addTextureToTexturesInUse___block_invoke;
      block[3] = &unk_1E5DD36F8;
      id v14 = v11;
      dispatch_async(deallocationsQueue, block);
    }
  }
  [(NSMapTable *)self->_pendingSpriteTextureByRequestID setObject:v9 forKey:v5];
LABEL_9:
  if ([v9 hasSprites]) {
    [(NSHashTable *)self->_spriteTexturesInUse addObject:v9];
  }

LABEL_12:
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 applyChangeDetails:*(void *)(a1 + 32)];
}

void __51__PXGTextureManager__processTextureProviderResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PXGTextureManager__processTextureProviderResults__block_invoke_3;
  v5[3] = &unk_1E5DC81F0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v4 = v3;
  [v4 processPendingTextureRequestIDsWithHandler:v5];
}

uint64_t __51__PXGTextureManager__processTextureProviderResults__block_invoke_4(uint64_t a1, int a2, __int32 a3, unsigned int a4, double a5)
{
  int v46 = a2;
  unsigned int v10 = (float *)(*(void *)(a1 + 32) + 160);
  if (std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::find<int>(v10, a2))
  {
    uint64_t v11 = *((unsigned int *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v10, a2, &v46)+ 5);
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 208);
    uint64_t v13 = v12 + 66 * v11;
    unsigned int v15 = *(_DWORD *)(v13 + 60);
    id v14 = (unsigned int *)(v13 + 60);
    if (v15 < a4)
    {
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = v12 + 66 * v11;
      v19 = *(void **)(v17 + 48);
      long long v18 = (void *)(v17 + 48);
      id v20 = v19;
      uint64_t v21 = v20;
      if (v20)
      {
        [v20 removeSpriteIndex:v11 atThumbnailIndex:*(unsigned int *)(v12 + 66 * v11 + 56)];
        *long long v18 = 0;
        uint64_t v22 = v12 + 66 * v11;
        *(_DWORD *)(v22 + 20) = 0;
        *(_DWORD *)(v22 + 24) = 0;
      }

      uint64_t v23 = v12 + 66 * v11;
      *(double *)(v23 + 20) = a5;
      v24 = (float32x2_t *)(v23 + 20);
      v24[4].i32[1] = a3;
      unsigned int *v14 = a4;
      *long long v18 = v16;

      if (!v24[3].i32[0])
      {
        uint64_t v25 = v12 + 66 * v11;
        v28 = *(void **)(v25 + 36);
        uint64_t v27 = (id *)(v25 + 36);
        v26 = v28;
        if (v28)
        {
          id v29 = v26;
          [v29 removeSpriteIndex:v11];

          uint64_t v30 = v12 + 66 * v11;
          *(unsigned char *)(v30 + 64) = 0;
          *(void *)(v30 + 36) = 0;
          *(void *)(v30 + 28) = 0;
        }
      }
      uint64_t v31 = v12 + 66 * v11;
      int v33 = *(unsigned __int8 *)(v31 + 64);
      v32 = (unsigned __int8 *)(v31 + 64);
      if (v33 == 3)
      {
        LOBYTE(v34) = 4;
LABEL_30:
        *(unsigned char *)(*(void *)(a1 + 56) + *(unsigned int *)(v12 + 66 * v11)) = v34;
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        return v11;
      }
      uint64_t v35 = v12 + 66 * v11;
      unsigned int v38 = *(unsigned __int8 *)(v35 + 9);
      uint64_t v37 = v35 + 9;
      char v36 = v38;
      if (v38 <= 0xD)
      {
        float32x2_t v39 = *v24;
        int v40 = 1 << v36;
        if ((v40 & 0x35D8) != 0) {
          PXFloatApproximatelyEqualToFloat();
        }
        if ((v40 & 0x807) != 0)
        {
          int32x2_t v41 = vcge_f32(v39, *(float32x2_t *)(v37 + 3));
          if (v41.i32[0] & v41.i32[1]) {
            goto LABEL_25;
          }
        }
        else if (v39.f32[0] > 0.0 && v39.f32[1] > 0.0)
        {
          goto LABEL_25;
        }
        if (v24[3].i32[0] && *(void *)(v12 + 66 * v11 + 36))
        {
          unsigned int v42 = *v32;
          if (v42 >= 2)
          {
            if (v42 != 2)
            {
              if (v42 == 3)
              {
                v44 = [MEMORY[0x1E4F28B00] currentHandler];
                v45 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXGUpdateLoadingStatusForStreamInfo(PXGSpriteIndex, const PXGStreamInfo *, PXGLoadingState *)");
                [v44 handleFailureInFunction:v45 file:@"PXGTextureManager.mm" lineNumber:201 description:@"Should be handled earlier"];

                abort();
              }
              LOBYTE(v34) = 0;
              goto LABEL_30;
            }
            goto LABEL_25;
          }
        }
        else if (COERCE_FLOAT(*v24) <= 0.0)
        {
          int v34 = *(_DWORD *)(v12 + 66 * v11 + 4);
          if (v34) {
            LOBYTE(v34) = *(unsigned char *)v37 != 0;
          }
          goto LABEL_30;
        }
        LOBYTE(v34) = 2;
        goto LABEL_30;
      }
LABEL_25:
      LOBYTE(v34) = 3;
      goto LABEL_30;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5_45(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = a2;
  if (a2 + a3 > (unint64_t)a2)
  {
    uint64_t v4 = a2;
    do
    {
      if (*(_DWORD *)(*(void *)(result + 72) + 66 * v4 + 4)) {
        PXGMediaKindGetSupportedResize();
      }
      uint64_t v4 = ++v3;
    }
    while (a2 + a3 > (unint64_t)v3);
  }
  return result;
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  id v7 = a4;
  unint64_t v8 = *(int *)(a2 + 4);
  if (v8)
  {
    id v42 = v7;
    uint64_t v9 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a2 + 9)];
    unsigned int v10 = [v42 objectForKeyedSubscript:v9];

    *(_DWORD *)(a2 + 4) = 0;
    *(unsigned char *)(a2 + 9) = 0;
    *(unsigned char *)(a2 + 64) = 0;
    int8x8_t v11 = (int8x8_t)a3[1];
    if (v11)
    {
      uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
      v12.i16[0] = vaddlv_u8(v12);
      if (v12.u32[0] > 1uLL)
      {
        unint64_t v13 = v8;
        if (*(void *)&v11 <= v8) {
          unint64_t v13 = v8 % *(void *)&v11;
        }
      }
      else
      {
        unint64_t v13 = (*(void *)&v11 - 1) & v8;
      }
      uint64_t v14 = *a3;
      unsigned int v15 = *(uint64_t ***)(*a3 + 8 * v13);
      if (v15)
      {
        id v16 = *v15;
        if (*v15)
        {
          uint64_t v17 = *(void *)&v11 - 1;
          do
          {
            unint64_t v18 = v16[1];
            if (v18 == v8)
            {
              if (*((_DWORD *)v16 + 4) == v8)
              {
                if (v12.u32[0] > 1uLL)
                {
                  unint64_t v19 = v8;
                  if (*(void *)&v11 <= v8) {
                    unint64_t v19 = v8 % *(void *)&v11;
                  }
                }
                else
                {
                  unint64_t v19 = v17 & v8;
                }
                id v20 = *(uint64_t **)(v14 + 8 * v19);
                do
                {
                  uint64_t v21 = v20;
                  id v20 = (uint64_t *)*v20;
                }
                while (v20 != v16);
                if (v21 == a3 + 2) {
                  goto LABEL_37;
                }
                unint64_t v22 = v21[1];
                if (v12.u32[0] > 1uLL)
                {
                  if (v22 >= *(void *)&v11) {
                    v22 %= *(void *)&v11;
                  }
                }
                else
                {
                  v22 &= v17;
                }
                if (v22 != v19)
                {
LABEL_37:
                  if (!*v16) {
                    goto LABEL_38;
                  }
                  unint64_t v23 = *(void *)(*v16 + 8);
                  if (v12.u32[0] > 1uLL)
                  {
                    if (v23 >= *(void *)&v11) {
                      v23 %= *(void *)&v11;
                    }
                  }
                  else
                  {
                    v23 &= v17;
                  }
                  if (v23 != v19) {
LABEL_38:
                  }
                    *(void *)(v14 + 8 * v19) = 0;
                }
                uint64_t v24 = *v16;
                if (*v16)
                {
                  unint64_t v25 = *(void *)(v24 + 8);
                  if (v12.u32[0] > 1uLL)
                  {
                    if (v25 >= *(void *)&v11) {
                      v25 %= *(void *)&v11;
                    }
                  }
                  else
                  {
                    v25 &= v17;
                  }
                  if (v25 != v19)
                  {
                    *(void *)(*a3 + 8 * v25) = v21;
                    uint64_t v24 = *v16;
                  }
                }
                uint64_t *v21 = v24;
                uint64_t *v16 = 0;
                --a3[3];
                operator delete(v16);
                break;
              }
            }
            else
            {
              if (v12.u32[0] > 1uLL)
              {
                if (v18 >= *(void *)&v11) {
                  v18 %= *(void *)&v11;
                }
              }
              else
              {
                v18 &= v17;
              }
              if (v18 != v13) {
                break;
              }
            }
            id v16 = (uint64_t *)*v16;
          }
          while (v16);
        }
      }
    }
    v26 = *(uint64_t **)(a1 + 48);
    int8x8_t v27 = (int8x8_t)v26[1];
    if (v27)
    {
      uint8x8_t v28 = (uint8x8_t)vcnt_s8(v27);
      v28.i16[0] = vaddlv_u8(v28);
      if (v28.u32[0] > 1uLL)
      {
        unint64_t v29 = v8;
        if (*(void *)&v27 <= v8) {
          unint64_t v29 = v8 % *(void *)&v27;
        }
      }
      else
      {
        unint64_t v29 = (*(void *)&v27 - 1) & v8;
      }
      uint64_t v30 = *v26;
      uint64_t v31 = *(uint64_t ***)(*v26 + 8 * v29);
      if (v31)
      {
        v32 = *v31;
        if (*v31)
        {
          uint64_t v33 = *(void *)&v27 - 1;
          do
          {
            unint64_t v34 = v32[1];
            if (v34 == v8)
            {
              if (*((_DWORD *)v32 + 4) == v8)
              {
                if (v28.u32[0] > 1uLL)
                {
                  unint64_t v35 = v8;
                  if (*(void *)&v27 <= v8) {
                    unint64_t v35 = v8 % *(void *)&v27;
                  }
                }
                else
                {
                  unint64_t v35 = v33 & v8;
                }
                char v36 = *(uint64_t **)(v30 + 8 * v35);
                do
                {
                  uint64_t v37 = v36;
                  char v36 = (uint64_t *)*v36;
                }
                while (v36 != v32);
                if (v37 == v26 + 2) {
                  goto LABEL_82;
                }
                unint64_t v38 = v37[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v38 >= *(void *)&v27) {
                    v38 %= *(void *)&v27;
                  }
                }
                else
                {
                  v38 &= v33;
                }
                if (v38 != v35)
                {
LABEL_82:
                  if (!*v32) {
                    goto LABEL_83;
                  }
                  unint64_t v39 = *(void *)(*v32 + 8);
                  if (v28.u32[0] > 1uLL)
                  {
                    if (v39 >= *(void *)&v27) {
                      v39 %= *(void *)&v27;
                    }
                  }
                  else
                  {
                    v39 &= v33;
                  }
                  if (v39 != v35) {
LABEL_83:
                  }
                    *(void *)(v30 + 8 * v35) = 0;
                }
                uint64_t v40 = *v32;
                if (*v32)
                {
                  unint64_t v41 = *(void *)(v40 + 8);
                  if (v28.u32[0] > 1uLL)
                  {
                    if (v41 >= *(void *)&v27) {
                      v41 %= *(void *)&v27;
                    }
                  }
                  else
                  {
                    v41 &= v33;
                  }
                  if (v41 != v35)
                  {
                    *(void *)(*v26 + 8 * v41) = v37;
                    uint64_t v40 = *v32;
                  }
                }
                *uint64_t v37 = v40;
                uint64_t *v32 = 0;
                --v26[3];
                operator delete(v32);
                break;
              }
            }
            else
            {
              if (v28.u32[0] > 1uLL)
              {
                if (v34 >= *(void *)&v27) {
                  v34 %= *(void *)&v27;
                }
              }
              else
              {
                v34 &= v33;
              }
              if (v34 != v29) {
                break;
              }
            }
            v32 = (uint64_t *)*v32;
          }
          while (v32);
        }
      }
    }
    [v10 cancelTextureRequestDeferred:v8];

    id v7 = v42;
  }
}

uint64_t __51__PXGTextureManager__processTextureProviderResults__block_invoke_3(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v41 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::find<int>((void *)(v6 + 160), a2))
  {
    uint64_t v7 = *((unsigned int *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)(v6 + 160), a2, &v41)+ 5);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v6 + 208);
    uint64_t v9 = v8 + 66 * v7;
    unsigned int v11 = *(_DWORD *)(v9 + 44);
    unsigned int v10 = (unsigned int *)(v9 + 44);
    if (v11 < a3)
    {
      uint8x8_t v12 = (unsigned int *)(v8 + 66 * v7);
      id v13 = *(id *)(a1 + 40);
      unsigned int v15 = (id *)(v12 + 9);
      uint64_t v14 = *(void **)(v12 + 9);
      if (v14)
      {
        id v16 = v14;
        [v16 removeSpriteIndex:v7];

        uint64_t v17 = v8 + 66 * v7;
        *(unsigned char *)(v17 + 64) = 0;
        *(void *)(v17 + 36) = 0;
        *(void *)(v17 + 28) = 0;
      }
      [v13 pixelSize];
      float64_t v39 = v19;
      float64_t v40 = v18;
      id v20 = v13;
      v21.f64[0] = v40;
      v21.f64[1] = v39;
      id *v15 = v20;
      *(float32x2_t *)(v8 + 66 * v7 + 28) = vcvt_f32_f64(v21);
      *unsigned int v10 = a3;
      if ([v20 isDegraded]) {
        char v22 = 1;
      }
      else {
        char v22 = 2;
      }
      uint64_t v23 = v8 + 66 * v7;
      *(unsigned char *)(v23 + 64) = v22;
      uint64_t v24 = (unsigned char *)(v23 + 64);

      uint64_t v25 = *(void *)(a1 + 56);
      if (*v24 == 3)
      {
        LOBYTE(v26) = 4;
LABEL_31:
        *(unsigned char *)(v25 + *v12) = v26;
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        uint64_t v6 = *(void *)(a1 + 32);
        goto LABEL_32;
      }
      uint64_t v27 = v8 + 66 * v7;
      float32x2_t v29 = *(float32x2_t *)(v27 + 20);
      uint8x8_t v28 = (void *)(v27 + 20);
      float32x2_t v30 = v29;
      unsigned int v31 = *((unsigned __int8 *)v28 - 11);
      if (v31 > 0xD)
      {
LABEL_30:
        LOBYTE(v26) = 3;
        goto LABEL_31;
      }
      int v32 = 1 << v31;
      if ((v32 & 0x35D8) != 0) {
        PXFloatApproximatelyEqualToFloat();
      }
      if ((v32 & 0x807) != 0)
      {
        float32x2_t v30 = (float32x2_t)vcge_f32(v30, (float32x2_t)*(v28 - 1));
        if ((v30.i32[0] & v30.i32[1] & 1) == 0) {
          goto LABEL_20;
        }
      }
      else if (v30.f32[0] <= 0.0 || (v30.i32[0] = v30.i32[1], v30.f32[1] <= 0.0))
      {
LABEL_20:
        if (*v10 && *v15)
        {
          unsigned int v33 = *v24;
          uint64_t v25 = *(void *)(a1 + 56);
          if (v33 >= 2)
          {
            if (v33 != 2)
            {
              if (v33 == 3)
              {
                uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(double *)&v30);
                unint64_t v38 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXGUpdateLoadingStatusForStreamInfo(PXGSpriteIndex, const PXGStreamInfo *, PXGLoadingState *)");
                [v37 handleFailureInFunction:v38 file:@"PXGTextureManager.mm" lineNumber:201 description:@"Should be handled earlier"];

                abort();
              }
              LOBYTE(v26) = 0;
              goto LABEL_31;
            }
            goto LABEL_30;
          }
        }
        else
        {
          uint64_t v25 = *(void *)(a1 + 56);
          if (COERCE_FLOAT(*v28) <= 0.0)
          {
            int v26 = *(_DWORD *)(v8 + 66 * v7 + 4);
            if (v26) {
              LOBYTE(v26) = *((unsigned char *)v28 - 11) != 0;
            }
            goto LABEL_31;
          }
        }
        LOBYTE(v26) = 2;
        goto LABEL_31;
      }
      LOBYTE(v26) = 3;
      uint64_t v25 = *(void *)(a1 + 56);
      goto LABEL_31;
    }
  }
  uint64_t v7 = 0xFFFFFFFFLL;
LABEL_32:
  unint64_t v34 = *(void **)(v6 + 112);
  unint64_t v35 = [NSNumber numberWithInt:a2];
  [v34 removeObjectForKey:v35];

  return v7;
}

- (void)_lookupLock_requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 textureProvider:(id)a4 mediaKind:(unsigned __int8)a5 presentationType:(unsigned __int8)a6 isAppearing:(BOOL)a7 layout:(id)a8 leafSpriteIndexRange:(_PXGSpriteIndexRange)a9 sprites:(id *)a10 textureStreamInfos:(id *)a11 loadingStatus:(id)a12
{
  BOOL v13 = a7;
  uint64_t v14 = a6;
  int v15 = a5;
  id v56 = a4;
  id v60 = a8;
  id v55 = a12;
  uint64_t v69 = [v55 mutableStates];
  var3 = a10->var3;
  var2 = a10->var2;
  var4 = a10->var4;
  id v20 = [(PXGTextureManager *)self entityManager];
  float64x2_t v21 = v56;
  [v20 effectComponent];
  v62 = var3;
  v64 = var4;
  id v22 = objc_claimAutoreleasedReturnValue();
  uint64_t v68 = [v22 effectIds];

  os_unfair_lock_assert_owner(&self->_lookupLock);
  id v23 = 0;
  if (v15 == 2 && v13)
  {
    uint64_t v24 = [(PXGTextureManager *)self _textureConverterForPresentationType:v14 contentType:1];
    if (v24)
    {
      uint64_t v25 = [v60 contentSource];
      uint64_t v26 = [v25 desiredPlaceholderStyleInLayout:v60];
      if (v26 == 1)
      {
        uint64_t v27 = [v56 placeholderImage];
        id v23 = [(PXGSpriteTextureStore *)self->_lookupLock_textureCache textureForKey:v27 presentationType:v14];
        if (!v23 && v27)
        {
          if (v14 == 1)
          {
            LODWORD(v28) = 1.0;
            float32x2_t v29 = [v24 createTextureFromCGImage:v27 transform:0 alpha:0 options:*(double *)off_1E5DAAFA0 error:v28];
            [(PXGSpriteTextureStore *)self->_lookupLock_textureCache storeTexture:v29 forKey:v27 presentationType:1];
            processQueue = self->_processQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __190__PXGTextureManager__lookupLock_requestTexturesForSpritesInRange_textureProvider_mediaKind_presentationType_isAppearing_layout_leafSpriteIndexRange_sprites_textureStreamInfos_loadingStatus___block_invoke;
            block[3] = &unk_1E5DD32A8;
            void block[4] = self;
            unsigned int v31 = &v76;
            id v23 = v29;
            id v76 = v23;
            dispatch_async(processQueue, block);
          }
          else
          {
            int v32 = self->_processQueue;
            v71[0] = MEMORY[0x1E4F143A8];
            v71[1] = 3221225472;
            v71[2] = __190__PXGTextureManager__lookupLock_requestTexturesForSpritesInRange_textureProvider_mediaKind_presentationType_isAppearing_layout_leafSpriteIndexRange_sprites_textureStreamInfos_loadingStatus___block_invoke_2;
            v71[3] = &unk_1E5DD1508;
            v71[4] = self;
            uint64_t v74 = v27;
            unsigned int v31 = &v72;
            id v72 = v56;
            id v73 = v24;
            dispatch_async(v32, v71);

            id v23 = 0;
          }
        }
      }
      else if (v26 == 2)
      {
        id v23 = [v24 transparentTexture];
      }
      else
      {
        id v23 = 0;
      }
    }
    else
    {
      id v23 = 0;
    }
  }
  int v33 = [v56 requestTexturesForSpritesInRange:a9 geometries:(char *)var2 + 32 * (a3.location - a9.location) styles:(char *)v62 + 160 * (a3.location - a9.location) infos:(char *)v64 + 40 * (a3.location - a9.location) inLayout:v60];
  unint64_t v34 = HIDWORD(*(unint64_t *)&a9);
  if (HIDWORD(*(unint64_t *)&a9))
  {
    int v35 = v33;
    uint64_t v61 = 0;
    p_lookupLock_requestDetailsByRequestID = (float *)&self->_lookupLock_requestDetailsByRequestID;
    p_spriteIndexByRequestID = (float *)&self->_spriteIndexByRequestID;
    uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
    v67 = v23;
    while (1)
    {
      int v70 = v35;
      char v36 = (char *)a10->var4 + 40 * a3.location;
      uint64_t v37 = (unsigned int *)((char *)&a11->var0.var0 + 66 * a3.location);
      *(unsigned char *)(v69 + *v37) = v36[1] != 0;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_spriteIndexByRequestID, v35, &v70)+ 5) = a3.location;
      char v38 = *v36;
      LODWORD(v37) = *(_DWORD *)(v68 + 4 * *v37);
      float64_t v39 = std::__hash_table<std::__hash_value_type<int,PXGRequestDetails>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PXGRequestDetails>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PXGRequestDetails>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PXGRequestDetails>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_lookupLock_requestDetailsByRequestID, v35, &v70);
      *((unsigned char *)v39 + 20) = v38;
      *(_DWORD *)((char *)v39 + 21) = v37;
      float64_t v40 = (char *)a11 + 66 * a3.location;
      *((_DWORD *)v40 + 1) = v35;
      v40[8] = *v36;
      v40[9] = v36[1];
      uint64_t v41 = *((void *)v36 + 1);
      *((_WORD *)v40 + 32) = 0;
      id v42 = v40 + 64;
      *(void *)(v42 - 52) = v41;
      *((_WORD *)v42 - 27) = *((_WORD *)v36 + 16);
      id v23 = v67;
      if (!v67) {
        goto LABEL_33;
      }
      v43 = (char *)a11 + 66 * a3.location;
      uint64_t v45 = *(void *)(v43 + 36);
      v44 = (id *)(v43 + 36);
      if (v45 || *(void *)(&a11->var10 + 66 * a3.location)) {
        goto LABEL_33;
      }
      id v46 = v67;
      if (*v44)
      {
        id v47 = *v44;
        [v47 removeSpriteIndex:a3];

        *id v42 = 0;
        v48 = (char *)a11 + 66 * a3.location;
        *(void *)(v48 + 36) = 0;
        *(void *)(v48 + 28) = 0;
      }
      [v46 pixelSize];
      float64_t v57 = v50;
      float64_t v58 = v49;
      id v51 = v46;
      id *v44 = v51;
      v52.f64[0] = v58;
      v52.f64[1] = v57;
      v53 = (char *)a11 + 66 * a3.location;
      *(float32x2_t *)(v53 + 28) = vcvt_f32_f64(v52);
      *((_DWORD *)v53 + 11) = 0;
      if ([v51 isDegraded]) {
        char v54 = 1;
      }
      else {
        char v54 = 2;
      }
      *id v42 = v54;

      if (!v61 || location == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_32;
      }
      if (v61 + location != a3.location) {
        break;
      }
      ++v61;
LABEL_33:
      ++v35;
      a3 = (_PXGSpriteIndexRange)(a3.location + 1);
      if (!--v34)
      {
        float64x2_t v21 = v56;
        if (v61) {
          [v67 addSpriteIndexRange:location];
        }
        goto LABEL_36;
      }
    }
    objc_msgSend(v51, "addSpriteIndexRange:");
LABEL_32:
    uint64_t location = a3.location;
    uint64_t v61 = 1;
    goto LABEL_33;
  }
LABEL_36:
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

void __98__PXGTextureManager_textureProvider_didProvideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v3 = *(void *)(a1 + 96);
  long long v4 = *(_OWORD *)(a1 + 48);
  v7[0] = *(_OWORD *)(a1 + 32);
  v7[1] = v4;
  LODWORD(v6) = *(_DWORD *)(a1 + 108);
  LODWORD(v5) = *(_DWORD *)(a1 + 104);
  [WeakRetained _processCGImage:v3 options:v7 adjustment:*(void *)(a1 + 64) isDegraded:*(unsigned __int8 *)(a1 + 112) fromTextureProvider:*(void *)(a1 + 72) withTextureConverter:*(void *)(a1 + 80) requestID:v5 requestDetails:*(unsigned int *)(a1 + 113) | ((unint64_t)*(unsigned __int8 *)(a1 + 117) << 32) deliveryOrder:v6];

  CGImageRelease(*(CGImageRef *)(a1 + 96));
}

- (void)_processCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8 requestID:(int)a9 requestDetails:(id)a10 deliveryOrder:(unsigned int)a11
{
  BOOL v12 = a6;
  uint64_t v14 = *(_OWORD **)&a4.var0;
  id v17 = *(id *)&a4.var2;
  id v18 = (id)v12;
  id v19 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  if ([v18 isRequestActive:a8])
  {
    long long v20 = v14[1];
    v46[0] = *v14;
    v46[1] = v20;
    float64x2_t v21 = [(PXGTextureManager *)self _createTextureForCGImage:a3 requestID:a8 requestDetails:*(void *)&a9 & 0xFFFFFFFFFFLL processingOptions:v46 fromTextureProvider:v18 withTextureConverter:v19];
    [v21 setIsDegraded:a5];
    if (v21)
    {
      if (v17 || *((unsigned char *)v14 + 16) && [v19 supportsMipmaps])
      {
        objc_initWeak(&location, self);
        adjustQueue = self->_adjustQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __147__PXGTextureManager__processCGImage_options_adjustment_isDegraded_fromTextureProvider_withTextureConverter_requestID_requestDetails_deliveryOrder___block_invoke;
        block[3] = &unk_1E5DC8358;
        id v23 = &v40;
        objc_copyWeak(&v40, &location);
        id v36 = v17;
        long long v24 = v14[1];
        long long v34 = *v14;
        long long v35 = v24;
        id v37 = v21;
        id v38 = v18;
        id v39 = v19;
        int v41 = (int)a8;
        int v42 = *(_DWORD *)&a10.var0;
        char v44 = v47;
        int v43 = a9;
        dispatch_async(adjustQueue, block);

        uint64_t v25 = v36;
      }
      else
      {
        objc_initWeak(&location, self);
        requestQueue = self->_requestQueue;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __147__PXGTextureManager__processCGImage_options_adjustment_isDegraded_fromTextureProvider_withTextureConverter_requestID_requestDetails_deliveryOrder___block_invoke_2;
        v27[3] = &unk_1E5DC8380;
        id v23 = &v30;
        objc_copyWeak(&v30, &location);
        id v28 = v21;
        id v29 = v18;
        int v31 = (int)a8;
        int v32 = *(_DWORD *)&a10.var0;
        dispatch_async(requestQueue, v27);

        uint64_t v25 = v28;
      }

      objc_destroyWeak(v23);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_createTextureForCGImage:(CGImage *)a3 requestID:(int)a4 requestDetails:(id)a5 processingOptions:(id)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8
{
  uint64_t v9 = *(long long **)&a6.var0;
  id v14 = *(id *)&a6.var2;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  long long v16 = v9[1];
  v31[0] = *v9;
  v31[1] = v16;
  id v17 = -[PXGTextureManager _existingTextureForCGImage:processingOptions:presentationType:](self, "_existingTextureForCGImage:processingOptions:presentationType:", a3, v31, [v15 presentationType]);
  if (!v17)
  {
    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    kdebug_trace();
    long long v18 = *v9;
    LODWORD(v19) = *((_DWORD *)v9 + 5);
    id v30 = 0;
    long long v20 = [v15 createTextureFromCGImage:a3 transform:(*(unint64_t *)&a5 >> 8) alpha:&v30 options:*(double *)&v18 error:v19];
    id v21 = v30;
    [v20 pixelSize];
    kdebug_trace();
    if (v20)
    {
      [v20 setSourceCGImage:a3];
      id v17 = [(PXGTextureManager *)self _storeTexture:v20 forKey:a3 replaceExisting:*((unsigned __int8 *)v9 + 24)];
    }
    else
    {
      objc_initWeak(&location, self);
      requestQueue = self->_requestQueue;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      _OWORD v24[2] = __130__PXGTextureManager__createTextureForCGImage_requestID_requestDetails_processingOptions_fromTextureProvider_withTextureConverter___block_invoke;
      v24[3] = &unk_1E5DC83A8;
      objc_copyWeak(&v27, &location);
      id v25 = v14;
      id v26 = v21;
      int v28 = a4;
      dispatch_async(requestQueue, v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
      id v17 = 0;
    }
  }
  return v17;
}

- (id)_existingTextureForCGImage:(CGImage *)a3 processingOptions:(id)a4 presentationType:(unsigned __int8)a5
{
  uint64_t v5 = *(float32x4_t **)&a4.var0;
  uint64_t v8 = [(PXGTextureManager *)self _existingTextureForKey:a3 presentationType:*(void *)&a4.var2];
  [v8 alpha];
  v9.i32[0] = v5[1].i32[1];
  if (v10 == *(float *)v9.i32)
  {
    [v8 orientationTransform];
    float32x4_t v13 = v12;
    float32x4_t v11 = *v5;
    uint16x4_t v9 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(v13, *v5)), 0xFuLL));
    if (vminv_u16(v9)) {
      goto LABEL_6;
    }
    v9.i32[0] = v5[1].i32[1];
  }
  else
  {
    float32x4_t v11 = *v5;
  }
  id v14 = (void *)[v8 copyWithOrientationTransform:*(double *)v11.i64 alpha:*(double *)&v9];
  uint64_t v15 = [(PXGTextureManager *)self _storeTexture:v14 forKey:a3 replaceExisting:v5[1].u8[8]];

  uint64_t v8 = (void *)v15;
LABEL_6:
  return v8;
}

- (id)_storeTexture:(id)a3 forKey:(id)a4 replaceExisting:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lookupLock);
  os_unfair_lock_lock(&self->_lookupLock);
  float v10 = -[PXGSpriteTextureStore storedTextureForTexture:key:presentationType:policy:](self->_lookupLock_textureCache, "storedTextureForTexture:key:presentationType:policy:", v8, v9, [v8 presentationType], v5);
  os_unfair_lock_unlock(&self->_lookupLock);

  return v10;
}

- (id)_existingTextureForKey:(id)a3 presentationType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lookupLock);
  os_unfair_lock_lock(&self->_lookupLock);
  uint64_t v7 = [(PXGSpriteTextureStore *)self->_lookupLock_textureCache textureForKey:v6 presentationType:v4];
  os_unfair_lock_unlock(&self->_lookupLock);

  return v7;
}

- (void)textureProvider:(id)a3 didProvideCGImage:(CGImage *)a4 options:(id)a5 adjustment:(id)a6 isDegraded:(BOOL)a7 forRequestID:(int)a8
{
  BOOL v8 = a7;
  char v9 = (char)a6;
  float v10 = *(void **)&a5.var2;
  float32x4_t v11 = *(_OWORD **)&a5.var0;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = v10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  long long v16 = [off_1E5DA9658 sharedInstance];
  char v17 = [v16 requestThumbnailsOnly];

  if ((v17 & 1) == 0
    && [v14 isRequestActive:v8]
    && [(PXGTextureManager *)self _getRequestDetails:&v55 forRequestID:v8])
  {
    uint64_t add = atomic_fetch_add(PXGMakeNextTextureDeliveryOrderID::lastRequestID, 1u);
    if (!a4) {
      PXGTungstenGetLog();
    }
    long long v19 = v11[1];
    v54[0] = *v11;
    v54[1] = v19;
    long long v20 = [(PXGTextureManager *)self _existingTextureForCGImage:a4 processingOptions:v54 presentationType:v55];
    if (v20)
    {
      int v21 = *((unsigned __int8 *)v11 + 16);
      if (v15)
      {
LABEL_9:
        id v22 = [(PXGTextureManager *)self _existingAdjustedTextureForSourceTexture:v20 adjustment:v15 wantsMipmaps:v21 != 0 presentationType:v55];
        if (v22)
        {
          [(PXGTextureManager *)self _handleProvidedSpriteTexture:v22 fromTextureProvider:v14 requestID:v8 deliveryOrder:add];
        }
        else
        {
          id v26 = [(PXGTextureManager *)self _textureConverterForPresentationType:v55 contentType:1];
          objc_initWeak(&buf, self);
          if (v15 || *((unsigned char *)v11 + 16) && [v26 supportsMipmaps])
          {
            adjustQueue = self->_adjustQueue;
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __98__PXGTextureManager_textureProvider_didProvideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke;
            v42[3] = &unk_1E5DC8358;
            objc_copyWeak(&v49, &buf);
            id v45 = v15;
            long long v28 = v11[1];
            long long v43 = *v11;
            long long v44 = v28;
            id v46 = v20;
            id v47 = v14;
            id v48 = v26;
            BOOL v50 = v8;
            int v51 = add;
            int v52 = v55;
            char v53 = v56;
            dispatch_async(adjustQueue, v42);

            objc_destroyWeak(&v49);
          }
          else
          {
            [(PXGTextureManager *)self _handleProvidedSpriteTexture:v20 fromTextureProvider:v14 requestID:v8 deliveryOrder:add];
          }
          objc_destroyWeak(&buf);
        }
        goto LABEL_21;
      }
      if (*((unsigned char *)v11 + 16))
      {
        int v21 = 1;
        goto LABEL_9;
      }
      [(PXGTextureManager *)self _handleProvidedSpriteTexture:v20 fromTextureProvider:v14 requestID:v8 deliveryOrder:add];
    }
    else
    {
      id v23 = [(PXGTextureManager *)self _textureConverterForPresentationType:v55 contentType:1];
      CGImageRetain(a4);
      objc_initWeak(&buf, self);
      queue = self->_processQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__PXGTextureManager_textureProvider_didProvideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke_2;
      block[3] = &unk_1E5DC83D0;
      objc_copyWeak(v36, &buf);
      v36[1] = a4;
      long long v24 = v11[1];
      long long v31 = *v11;
      long long v32 = v24;
      id v33 = v15;
      char v39 = v9;
      id v34 = v14;
      id v35 = v23;
      int v40 = v55;
      char v41 = v56;
      BOOL v37 = v8;
      int v38 = add;
      id v25 = v23;
      dispatch_async(queue, block);

      objc_destroyWeak(v36);
      objc_destroyWeak(&buf);
    }
LABEL_21:
  }
}

- (BOOL)_getRequestDetails:(id *)a3 forRequestID:(int)a4
{
  int v19 = a4;
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_assert_not_owner(&self->_lookupLock);
  os_unfair_lock_lock(p_lookupLock);
  unint64_t value = self->_lookupLock_requestDetailsByRequestID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value) {
    goto LABEL_17;
  }
  p_lookupLock_requestDetailsByRequestID = (float *)&self->_lookupLock_requestDetailsByRequestID;
  uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v11 = a4;
    if (value <= a4) {
      unint64_t v11 = a4 % value;
    }
  }
  else
  {
    unint64_t v11 = (value - 1) & a4;
  }
  float32x4_t v12 = *(uint64_t ***)(*(void *)p_lookupLock_requestDetailsByRequestID + 8 * v11);
  if (!v12 || (float32x4_t v13 = *v12) == 0)
  {
LABEL_17:
    BOOL v18 = 0;
    goto LABEL_18;
  }
  while (1)
  {
    unint64_t v14 = v13[1];
    if (v14 == a4) {
      break;
    }
    if (v10.u32[0] > 1uLL)
    {
      if (v14 >= value) {
        v14 %= value;
      }
    }
    else
    {
      v14 &= value - 1;
    }
    if (v14 != v11) {
      goto LABEL_17;
    }
LABEL_16:
    float32x4_t v13 = (uint64_t *)*v13;
    if (!v13) {
      goto LABEL_17;
    }
  }
  if (*((_DWORD *)v13 + 4) != a4) {
    goto LABEL_16;
  }
  long long v16 = std::__hash_table<std::__hash_value_type<int,PXGRequestDetails>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PXGRequestDetails>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PXGRequestDetails>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PXGRequestDetails>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_lookupLock_requestDetailsByRequestID, a4, &v19);
  char v17 = *((unsigned char *)v16 + 24);
  *(_DWORD *)&a3->var0 = *((_DWORD *)v16 + 5);
  LOBYTE(a3->var1) = v17;
  BOOL v18 = 1;
LABEL_18:
  os_unfair_lock_unlock(p_lookupLock);
  return v18;
}

- (id)_textureConverterForPresentationType:(unsigned __int8)a3 contentType:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  textureConverterByPresentationType = self->_textureConverterByPresentationType;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:");
  id v8 = [(NSDictionary *)textureConverterByPresentationType objectForKeyedSubscript:v7];

  if (!v8)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    char v9 = [(PXGTextureManager *)self textureConverters];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v10) {
      goto LABEL_10;
    }
    uint64_t v11 = *(void *)v16;
LABEL_4:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v9);
      }
      float32x4_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      if ((a4 & ~[v13 supportedContentTypes]) == 0) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (!v10)
        {
LABEL_10:

          goto LABEL_12;
        }
        goto LABEL_4;
      }
    }
    id v8 = v13;

    if (!v8) {
LABEL_12:
    }
      PXGTungstenGetLog();
  }
  return v8;
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4_64(void *a1, void *a2)
{
  id v7 = a2;
  if ([v7 spriteCount])
  {
    uint64_t v3 = v7;
    if ((id)a1[4] != v7)
    {
      (*(void (**)(void, id, uint64_t))(a1[8] + 16))(a1[8], v7, [v7 presentationType]);
      uint64_t v3 = v7;
    }
    uint64_t v4 = (void *)a1[5];
    BOOL v5 = [v3 spriteIndexes];
    [v4 addIndexes:v5];

    id v6 = (id *)(a1[6] + 104);
  }
  else
  {
    [*(id *)(a1[6] + 104) removeObject:v7];
    id v6 = (id *)(a1 + 7);
  }
  [*v6 addObject:v7];
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3_61(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithUnsignedChar:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    char v9 = *(void **)(a1 + 32);
    uint64_t v10 = [NSNumber numberWithUnsignedChar:a3];
    [v9 setObject:v8 forKeyedSubscript:v10];

    id v7 = (void *)v8;
  }
  [v7 addObject:v11];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)textureProvider:(id)a3 didProvideImageData:(id)a4 withSpecAtIndex:(int64_t)a5 size:(CGSize)a6 bytesPerRow:(unint64_t)a7 contentsRect:(CGRect)a8 forRequestID:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  double v15 = a6.height;
  double v16 = a6.width;
  id v20 = a3;
  id v21 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if ([v20 isRequestActive:v9])
  {
    id v22 = [v20 textureAtlasManagerAtSpecIndex:a5];
    if (!v22)
    {
      long long v25 = 0uLL;
      int v26 = 0;
      if (v20) {
        [v20 imageDataSpecAtIndex:a5];
      }
      long long v23 = v25;
      int v24 = v26;
      id v22 = [(PXGTextureManager *)self _textureAtlasManagerForImageDataSpec:&v23];
      [v20 setTextureAtlasManager:v22 atSpecIndex:a5];
    }
    objc_msgSend(v22, "addSpriteWithTextureRequestID:thumbnailData:size:bytesPerRow:contentsRect:", v9, v21, a7, v16, v15, x, y, width, height);
    [(PXGTextureManager *)self _requestQueue_setNeedsUpdate];
  }
}

uint64_t __58__PXGTextureManager__requestQueue_scheduleUpdateIfAllowed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNeedsUpdate];
}

void __147__PXGTextureManager__processCGImage_options_adjustment_isDegraded_fromTextureProvider_withTextureConverter_requestID_requestDetails_deliveryOrder___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleProvidedSpriteTexture:*(void *)(a1 + 32) fromTextureProvider:*(void *)(a1 + 40) requestID:*(unsigned int *)(a1 + 56) deliveryOrder:*(unsigned int *)(a1 + 60)];
}

void *__132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[30]) {
    return objc_msgSend(result, "_requestQueue_scheduleUpdateIfAllowed");
  }
  return result;
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_40()
{
  return kdebug_trace();
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2_60()
{
  return kdebug_trace();
}

- (void)setViewEnvironment:(id)a3
{
  id v5 = a3;
  id v6 = self->_viewEnvironment;
  id v7 = (PXGViewEnvironment *)v5;
  uint64_t v9 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    BOOL v8 = [(PXGViewEnvironment *)v6 isEqual:v7];

    if (!v8)
    {
      objc_storeStrong((id *)&self->_viewEnvironment, a3);
      [(PXGTextureManager *)self _setNeedsUpdate];
    }
  }
}

- (void)_setNeedsUpdate
{
  uint64_t v3 = [(PXGTextureManager *)self layoutQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PXGTextureManager *)self delegate];
  [v4 textureManagerNeedsUpdate:self];
}

- (PXGTextureManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGTextureManagerDelegate *)WeakRetained;
}

uint64_t __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_2;
  v5[3] = &unk_1E5DC81A0;
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v2;
  long long v8 = *(_OWORD *)(a1 + 72);
  v5[4] = &v9;
  [v1 enumerateRangesUsingBlock:v5];
  uint64_t v3 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v3;
}

uint64_t __117__PXGTextureManager_streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 88);
  v10[0] = *(_OWORD *)(a1 + 72);
  v10[1] = v7;
  long long v8 = *(_OWORD *)(a1 + 120);
  v10[2] = *(_OWORD *)(a1 + 104);
  v10[3] = v8;
  return [v3 _streamTexturesForSpritesInDataStore:v2 presentationDataStore:v4 changeDetails:v5 layout:v6 interactionState:v10 loadingStatus:a2];
}

- (void)_streamTexturesForSpritesInDataStore:(id)a3 presentationDataStore:(id)a4 changeDetails:(id)a5 layout:(id)a6 interactionState:(id *)a7 loadingStatus:(id)a8
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  id v124 = a3;
  id v117 = a4;
  id v122 = a5;
  id v14 = a6;
  id v15 = a8;
  int64_t v16 = self->_streamCount + 1;
  self->_streamCount = v16;
  v106 = v14;
  id v107 = v15;
  uint64_t v17 = [v107 mutableStates];
  if (atomic_exchange((atomic_uchar *volatile)&self->_isPerformingUpdateFromRequestQueue, 0))
  {
    requestQueue = self->_requestQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke;
    block[3] = &unk_1E5DD36F8;
    void block[4] = self;
    dispatch_async(requestQueue, block);
  }
  v114 = [v14 fences];
  [v14 removeAllFences];
  int v19 = [(PXGTextureManager *)self preheatingStrategy];
  long long v20 = *(_OWORD *)&a7->var4;
  v208[0] = *(_OWORD *)&a7->var0;
  v208[1] = v20;
  CGSize size = a7->var8.size;
  v208[2] = a7->var8.origin;
  v208[3] = size;
  [v19 preheatingRectForLayout:v14 interactionState:v208];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  kdebug_trace();
  -[PXGTextureManager _resizeStorageIfNeededForSpriteCount:](self, "_resizeStorageIfNeededForSpriteCount:", [v124 count]);
  self->_unint64_t streamInfoBySpriteIndexCount = [v124 count];
  streamInfoBySpriteIndedouble x = self->_streamInfoBySpriteIndex;
  v108 = self->_textureProviderByMediaKind;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2;
  aBlock[3] = &unk_1E5DC7FE8;
  aBlock[4] = self;
  aBlock[5] = a2;
  aBlock[6] = &self->_lookupLock_requestDetailsByRequestID;
  v109 = _Block_copy(aBlock);
  p_loadedSpriteIndexes = &self->_loadedSpriteIndexes;
  loadedSpriteIndexes = self->_loadedSpriteIndexes;
  long long v32 = [v122 removedSpriteIndexes];
  v116 = [(NSIndexSet *)loadedSpriteIndexes px_intersectionWithIndexSet:v32];

  v201[0] = MEMORY[0x1E4F143A8];
  v201[1] = 3221225472;
  v201[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3;
  v201[3] = &unk_1E5DC8010;
  v201[4] = self;
  v204 = streamInfoBySpriteIndex;
  id v112 = v109;
  id v203 = v112;
  p_spriteIndexByRequestID = &self->_spriteIndexByRequestID;
  v110 = v108;
  v202 = v110;
  uint64_t v206 = v17;
  v119 = _Block_copy(v201);
  os_unfair_lock_lock(&self->_lookupLock);
  [v116 enumerateRangesUsingBlock:v119];
  os_unfair_lock_unlock(&self->_lookupLock);
  if ([v122 hasAnyInsertionsRemovalsOrMoves])
  {
    uint64_t v33 = [v124 entities];
    id v34 = self->_streamInfoBySpriteIndex;
    unint64_t streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
    v200[0] = MEMORY[0x1E4F143A8];
    v200[1] = 3221225472;
    v200[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4;
    v200[3] = &unk_1E5DC8038;
    v200[5] = v33;
    v200[4] = self;
    v200[6] = a2;
    v200[7] = streamInfoBySpriteIndex;
    [v122 applyToArray:v34 elementSize:66 countAfterChanges:streamInfoBySpriteIndexCount insertionHandler:v200 modifiedHandler:0];
    id v36 = [v122 indexSetAfterApplyingChangeDetails:*p_loadedSpriteIndexes];
    BOOL v37 = self->_loadedSpriteIndexes;
    self->_loadedSpriteIndexes = v36;

    v198[0] = MEMORY[0x1E4F143A8];
    v198[1] = 3221225472;
    v198[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5;
    v198[3] = &unk_1E5DC8060;
    id v38 = v122;
    id v199 = v38;
    [(PXGTextureManager *)self _enumerateSpriteTextures:v198];
    long long v197 = 0u;
    long long v196 = 0u;
    long long v195 = 0u;
    long long v194 = 0u;
    char v39 = [(PXGTextureManager *)self textureAtlasManagers];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v194 objects:v218 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v195;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v195 != v41) {
            objc_enumerationMutation(v39);
          }
          [*(id *)(*((void *)&v194 + 1) + 8 * i) applyChangeDetails:v38];
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v194 objects:v218 count:16];
      }
      while (v40);
    }

    uint64_t v43 = [v38 spriteIndexAfterChangeBySpriteIndexBeforeChange];
    for (j = (unsigned int *)self->_spriteIndexByRequestID.__table_.__p1_.__value_.__next_; j; j = *(unsigned int **)j)
      j[5] = *(_DWORD *)(v43 + 4 * j[5]);
  }
  BOOL v45 = [(PXGTextureManager *)self isInactive];
  v131 = [(PXGTextureManager *)self viewEnvironment];
  long long v193 = 0u;
  long long v192 = 0u;
  long long v191 = 0u;
  long long v190 = 0u;
  id v46 = [(NSMutableDictionary *)self->_textureProviderByMediaKind objectEnumerator];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v190 objects:v217 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v191;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v191 != v48) {
          objc_enumerationMutation(v46);
        }
        BOOL v50 = *(void **)(*((void *)&v190 + 1) + 8 * k);
        [v50 setViewEnvironment:v131];
        long long v51 = *(_OWORD *)&a7->var4;
        v189[0] = *(_OWORD *)&a7->var0;
        v189[1] = v51;
        CGSize v52 = a7->var8.size;
        v189[2] = a7->var8.origin;
        v189[3] = v52;
        [v50 setInteractionState:v189];
      }
      uint64_t v47 = [v46 countByEnumeratingWithState:&v190 objects:v217 count:16];
    }
    while (v47);
  }

  [(PXGTextureManager *)self _processTextureProviderResults];
  v115 = *p_loadedSpriteIndexes;
  uint64_t v188 = 0;
  long long v187 = 0u;
  long long v186 = 0u;
  if (v124)
  {
    [v124 sprites];
    uint64_t v104 = v187;
    uint64_t v53 = v188;
  }
  else
  {
    uint64_t v53 = 0;
    uint64_t v104 = 0;
  }
  if (v45)
  {
    [MEMORY[0x1E4F28D60] indexSet];
    objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1E4F28D60] indexSet];
    objc_claimAutoreleasedReturnValue();
    PXGTungstenGetLog();
  }
  id v54 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int v55 = objc_msgSend(v124, "spriteIndexesInRect:", v23, v25, v27, v29);
  if (CGRectIsNull(a7->var8))
  {
    v118 = 0;
  }
  else
  {
    v118 = objc_msgSend(v124, "spriteIndexesInRect:", a7->var8.origin.x, a7->var8.origin.y, a7->var8.size.width, a7->var8.size.height);
  }
  char v56 = [v124 spriteIndexesWithSpriteInfoFlags:1];
  [v54 addIndexes:v55];
  [v54 addIndexes:v56];
  float64_t v57 = (void *)[v54 copy];

  v120 = (void *)[v57 mutableCopy];
  [v120 removeIndexes:v115];
  v123 = (void *)[(NSIndexSet *)v115 mutableCopy];
  [v123 removeIndexes:v57];
  if (self->_didSwitchTextureConverter)
  {
    v121 = (void *)[v57 mutableCopy];
  }
  else
  {
    uint64_t v58 = [v122 modifiedSpriteIndexes];
    v121 = (void *)[v58 mutableCopy];
  }
  [v121 removeIndexes:v123];
  [v121 removeIndexes:v120];
  if (v117 && [v123 count])
  {
    id v60 = objc_msgSend(v117, "spriteAtIndexes:inRect:", v123, v23, v25, v27, v29);
    if ([v60 count])
    {
      [v123 removeIndexes:v60];
      uint64_t v61 = (void *)[v57 mutableCopy];
      [v61 addIndexes:v60];
    }
    else
    {
      uint64_t v61 = v57;
    }

    v59 = v61;
  }
  else
  {
    v59 = v57;
  }
  v103 = v59;
  objc_storeStrong((id *)&self->_loadedSpriteIndexes, v59);
  v62 = self->_requestQueue;
  v185[0] = MEMORY[0x1E4F143A8];
  v185[1] = 3221225472;
  v185[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_40;
  v185[3] = &unk_1E5DD08D8;
  v185[4] = self;
  v185[5] = v16;
  dispatch_async(v62, v185);
  os_unfair_lock_lock(&self->_lookupLock);
  v176[0] = MEMORY[0x1E4F143A8];
  v176[1] = 3221225472;
  v176[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2_41;
  v176[3] = &unk_1E5DC80B0;
  id v63 = v106;
  uint64_t v180 = v53;
  id v177 = v63;
  v178 = self;
  long long v181 = v186;
  long long v182 = v187;
  uint64_t v183 = v188;
  v184 = streamInfoBySpriteIndex;
  id v64 = v107;
  id v179 = v64;
  [v120 enumerateRangesUsingBlock:v176];
  [v123 enumerateRangesUsingBlock:v119];
  if ([(PXGTextureManager *)self deferModifiedTextureRequestsDuringViewResizing]&& !a7->var5&& self->_hasDeferredRequests)
  {
    v65 = *p_loadedSpriteIndexes;
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4_44;
    v173[3] = &unk_1E5DC80D8;
    v175 = streamInfoBySpriteIndex;
    id v174 = v121;
    v66 = v65;
    [(NSIndexSet *)v66 enumerateRangesUsingBlock:v173];
    self->_hasDeferredRequests = 0;
  }
  if ([(PXGTextureManager *)self deferModifiedTextureRequestsDuringViewResizing])
  {
    BOOL var5 = a7->var5;
  }
  else
  {
    BOOL var5 = 0;
  }
  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5_45;
  v160[3] = &unk_1E5DC8128;
  uint64_t v166 = v53;
  BOOL v172 = var5;
  v165 = streamInfoBySpriteIndex;
  v160[4] = self;
  id v102 = v112;
  id v164 = v102;
  v167 = &self->_spriteIndexByRequestID;
  v101 = v110;
  v161 = v101;
  id v113 = v63;
  id v162 = v113;
  SEL v168 = a2;
  long long v169 = v186;
  long long v170 = v187;
  uint64_t v171 = v188;
  id v68 = v64;
  id v163 = v68;
  [v121 enumerateRangesUsingBlock:v160];
  p_lookupLocuint64_t k = &self->_lookupLock;
  v100 = v68;
  if (v118)
  {
    int v70 = [MEMORY[0x1E4F28E60] indexSet];
    v157[0] = MEMORY[0x1E4F143A8];
    v157[1] = 3221225472;
    v157[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_59;
    v157[3] = &unk_1E5DC80D8;
    v159 = streamInfoBySpriteIndex;
    id v71 = v70;
    id v158 = v71;
    [v118 enumerateRangesUsingBlock:v157];

    p_lookupLocuint64_t k = &self->_lookupLock;
  }
  else
  {
    id v71 = 0;
  }
  os_unfair_lock_unlock(p_lookupLock);
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v72 = [(NSMutableDictionary *)self->_textureProviderByMediaKind objectEnumerator];
  uint64_t v73 = [v72 countByEnumeratingWithState:&v153 objects:v216 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v154;
    do
    {
      for (uint64_t m = 0; m != v73; ++m)
      {
        if (*(void *)v154 != v74) {
          objc_enumerationMutation(v72);
        }
        id v76 = *(void **)(*((void *)&v153 + 1) + 8 * m);
        [v76 setRequestIDsInTargetRect:v71];
        [v76 performDeferredCancellations];
        [v76 didFinishRequestingTextures];
      }
      uint64_t v73 = [v72 countByEnumeratingWithState:&v153 objects:v216 count:16];
    }
    while (v73);
  }

  v77 = self->_requestQueue;
  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2_60;
  v152[3] = &unk_1E5DD08D8;
  v152[4] = self;
  v152[5] = v16;
  dispatch_async(v77, v152);
  [v113 visibleRect];
  long long v78 = *(_OWORD *)&a7->var4;
  v151[0] = *(_OWORD *)&a7->var0;
  v151[1] = v78;
  CGSize v79 = a7->var8.size;
  v151[2] = a7->var8.origin;
  v151[3] = v79;
  -[PXGTextureManager _blockOnThumbnailsIfNeededWithGeometries:visibleRect:interactionState:fences:](self, "_blockOnThumbnailsIfNeededWithGeometries:visibleRect:interactionState:fences:", v104, v151, v114);
  v80 = [MEMORY[0x1E4F1CA60] dictionary];
  *(void *)id buf = 0;
  v213 = buf;
  uint64_t v214 = 0x2020000000;
  uint64_t v215 = 0;
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3_61;
  v148[3] = &unk_1E5DC8150;
  id v98 = v80;
  id v99 = v80;
  id v149 = v99;
  v150 = buf;
  v105 = _Block_copy(v148);
  v95 = [MEMORY[0x1E4F28E60] indexSet];
  v96 = self->_emptyTexture;
  id v81 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4_64;
  v142[3] = &unk_1E5DC8178;
  v97 = v96;
  v143 = v97;
  id v82 = v105;
  id v147 = v82;
  id v130 = v95;
  id v144 = v130;
  v145 = self;
  id v83 = v81;
  id v146 = v83;
  v111 = v83;
  -[PXGTextureManager _enumerateSpriteTextures:](self, "_enumerateSpriteTextures:", v142, v95, v96);
  if ([v83 count])
  {
    v84 = [(PXGTextureManager *)self layoutQueue];
    BOOL v85 = v84 == (void *)MEMORY[0x1E4F14428];

    if (v85)
    {
      [(PXGTextureManager *)self performSelectorOnMainThread:sel__pruneTextures_ withObject:v111 waitUntilDone:0];
    }
    else
    {
      v86 = [(PXGTextureManager *)self layoutQueue];
      v140[0] = MEMORY[0x1E4F143A8];
      v140[1] = 3221225472;
      v140[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5_67;
      v140[3] = &unk_1E5DD32A8;
      v140[4] = self;
      id v141 = v111;
      dispatch_async(v86, v140);
    }
  }
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id obj = [(PXGTextureManager *)self textureAtlasManagers];
  uint64_t v87 = [obj countByEnumeratingWithState:&v136 objects:v211 count:16];
  if (v87)
  {
    id v127 = v71;
    locuint64_t k = *(os_unfair_lock_t *)v137;
    do
    {
      for (uint64_t n = 0; n != v87; ++n)
      {
        if (*(os_unfair_lock_t *)v137 != lock) {
          objc_enumerationMutation(obj);
        }
        v89 = *(void **)(*((void *)&v136 + 1) + 8 * n);
        [v89 setSkipRenderSpriteIndexes:v130];
        [v89 pruneUnusedTextures];
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        v90 = [v89 textures];
        uint64_t v91 = [v90 countByEnumeratingWithState:&v132 objects:v210 count:16];
        if (v91)
        {
          uint64_t v92 = *(void *)v133;
          do
          {
            for (iuint64_t i = 0; ii != v91; ++ii)
            {
              if (*(void *)v133 != v92) {
                objc_enumerationMutation(v90);
              }
              v94 = *(void **)(*((void *)&v132 + 1) + 8 * ii);
              if ([v94 spriteCount]) {
                (*((void (**)(id, void *, void))v82 + 2))(v82, v94, self->_atlasPresentationType);
              }
            }
            uint64_t v91 = [v90 countByEnumeratingWithState:&v132 objects:v210 count:16];
          }
          while (v91);
        }

        id v71 = v127;
      }
      uint64_t v87 = [obj countByEnumeratingWithState:&v136 objects:v211 count:16];
    }
    while (v87);
  }

  objc_storeStrong((id *)&self->_texturesByPresentationType, v98);
  self->_didSwitchTextureConverter = 0;
  [v120 count];
  [v123 count];
  kdebug_trace();

  _Block_object_dispose(buf, 8);
}

- (NSArray)textureAtlasManagers
{
  return (NSArray *)objc_getProperty(self, a2, 352, 1);
}

- (void)_enumerateSpriteTextures:(id)a3
{
  p_lookupLocuint64_t k = &self->_lookupLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lookupLock);
  os_unfair_lock_lock(p_lookupLock);
  [(PXGSpriteTextureStore *)self->_lookupLock_textureCache enumerateTexturesWithHandler:v5];

  os_unfair_lock_unlock(p_lookupLock);
}

- (unint64_t)deferModifiedTextureRequestsDuringViewResizing
{
  return self->_deferModifiedTextureRequestsDuringViewResizing;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (int64_t)_processTextureProviderResults
{
  uint64_t v3 = [(PXGTextureManager *)self layoutQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v4 = [(PXGTextureManager *)self entityManager];
  id v5 = [v4 loadingStatus];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PXGTextureManager__processTextureProviderResults__block_invoke;
  v8[3] = &unk_1E5DC8268;
  v8[4] = self;
  v8[5] = &v9;
  [v5 performChanges:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (PXGTextureManagerPreheatingStrategy)preheatingStrategy
{
  return self->_preheatingStrategy;
}

- (void)_resizeStorageIfNeededForSpriteCount:(int64_t)a3
{
  streamInfoBySpriteIndexCapacitdouble y = self->_streamInfoBySpriteIndexCapacity;
  if (streamInfoBySpriteIndexCapacity < a3)
  {
    if (!streamInfoBySpriteIndexCapacity)
    {
      streamInfoBySpriteIndexCapacitdouble y = 10;
      self->_streamInfoBySpriteIndexCapacitdouble y = 10;
    }
    if (streamInfoBySpriteIndexCapacity < a3)
    {
      do
        streamInfoBySpriteIndexCapacity *= 2;
      while (streamInfoBySpriteIndexCapacity < a3);
      self->_streamInfoBySpriteIndexCapacitdouble y = streamInfoBySpriteIndexCapacity;
    }
    _PXGArrayResize();
  }
}

- (void)streamTexturesForSpritesInDataStore:(id)a3 presentationDataStore:(id)a4 changeDetails:(id)a5 layout:(id)a6 interactionState:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v23 = a6;
  id v15 = [(PXGTextureManager *)self entityManager];
  int64_t v16 = [v15 loadingStatus];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  _OWORD v24[2] = __117__PXGTextureManager_streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState___block_invoke;
  v24[3] = &unk_1E5DC7FC0;
  void v24[4] = self;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  id v20 = v23;
  id v28 = v20;
  long long v21 = *(_OWORD *)&a7->var4;
  long long v29 = *(_OWORD *)&a7->var0;
  long long v30 = v21;
  CGSize size = a7->var8.size;
  origiuint64_t n = a7->var8.origin;
  CGSize v32 = size;
  [v16 performChanges:v24];
}

- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v9 = a3;
  textureProviderByMediaKind = self->_textureProviderByMediaKind;
  long long v7 = [NSNumber numberWithUnsignedChar:v4];
  [(NSMutableDictionary *)textureProviderByMediaKind setObject:v9 forKeyedSubscript:v7];

  [(NSMapTable *)self->_textureProvidersDisplayLinkRegistrationState setObject:MEMORY[0x1E4F1CC28] forKey:v9];
  [v9 setLayoutQueue:self->_layoutQueue];
  [v9 setRequestQueue:self->_requestQueue];
  [v9 setWorkQueue:self->_workQueue];
  [v9 setProcessingQueue:self->_processQueue];
  long long v8 = [(PXGTextureManager *)self viewEnvironment];
  [v9 setViewEnvironment:v8];

  [v9 setDelegate:self];
  [(PXGTextureManager *)self _configureTextureProvider:v9];
  [v9 prepareImageDataSpecs];
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (void)_configureTextureProvider:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setLowMemoryMode:", -[PXGTextureManager lowMemoryMode](self, "lowMemoryMode"));
  objc_msgSend(v4, "setAllowLargerImagesDuringScrollingInLowMemoryMode:", -[PXGTextureManager allowLargerImagesDuringScrollingInLowMemoryMode](self, "allowLargerImagesDuringScrollingInLowMemoryMode"));
  [v4 setCanDeliverThumbnailData:self->_atlasTextureConverter != 0];
  objc_msgSend(v4, "setPreferBGRA:", -[PXGTextureManager preferBGRA](self, "preferBGRA"));
  objc_msgSend(v4, "setPreferMipmaps:", -[PXGTextureManager preferMipmaps](self, "preferMipmaps"));
  objc_msgSend(v4, "setPreferredColorSpaceName:", -[PXGTextureManager preferredColorSpaceName](self, "preferredColorSpaceName"));
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)preferMipmaps
{
  return self->_preferMipmaps;
}

- (unint64_t)preferredColorSpaceName
{
  return self->_preferredColorSpaceName;
}

- (BOOL)preferBGRA
{
  return self->_preferBGRA;
}

- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode
{
  return self->_allowLargerImagesDuringScrollingInLowMemoryMode;
}

- (NSDictionary)texturesByPresentationType
{
  return self->_texturesByPresentationType;
}

- (BOOL)streamUpdatedTexturesForDisplayLinkIfNeeded:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXGTextureManager *)self layoutQueue];
  dispatch_assert_queue_V2(v5);

  kdebug_trace();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v6 = [(NSMutableDictionary *)self->_textureProviderByMediaKind objectEnumerator];
  char v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [(NSMapTable *)self->_textureProvidersDisplayLinkRegistrationState objectForKey:v11];
        if ([v12 BOOLValue])
        {
          [v11 requestUpdatedTexturesForDisplayLink:v4];
          char v7 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  kdebug_trace();
  return v7 & 1;
}

uint64_t __36__PXGTextureManager__pruneTextures___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hash];
}

void __51__PXGTextureManager__processTextureProviderResults__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 mutableStates];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__PXGTextureManager__processTextureProviderResults__block_invoke_2;
  v16[3] = &unk_1E5DC8218;
  uint64_t v18 = v4;
  long long v17 = *(_OWORD *)(a1 + 32);
  [(id)v17 _enumerateSpriteTextures:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [*(id *)(a1 + 32) textureAtlasManagers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __51__PXGTextureManager__processTextureProviderResults__block_invoke_4;
        v11[3] = &unk_1E5DC8240;
        uint64_t v10 = *(void *)(a1 + 40);
        v11[4] = *(void *)(a1 + 32);
        v11[5] = v9;
        v11[6] = v10;
        v11[7] = v4;
        [v9 processPendingThumbnailRequestIDsWithHandler:v11];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)_pruneTextures:(id)a3
{
  id v4 = a3;
  deallocationsQueue = self->_deallocationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PXGTextureManager__pruneTextures___block_invoke;
  block[3] = &unk_1E5DD36F8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(deallocationsQueue, block);
}

uint64_t __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_2(uint64_t result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2 < a2 + a3)
  {
    uint64_t v4 = 32 * a2;
    for (uint64_t i = *(void *)(result + 40) + 66 * a2 + 44; ; i += 66)
    {
      if (!*(void *)(i + 4) && !*(_DWORD *)i)
      {
        uint64_t v6 = *(void *)(i - 32);
        if (*(float *)&v6 > 0.0 && *((float *)&v6 + 1) > 0.0)
        {
          uint64_t v7 = *(void *)(result + 48) + v4;
          double v8 = *(double *)(result + 56);
          float32x2_t v9 = vmul_f32(*(float32x2_t *)(v7 + 24), (float32x2_t)0x3F0000003F000000);
          if (*(double *)v7 - v9.f32[0] <= v8 + *(double *)(result + 72) && *(double *)v7 + v9.f32[0] >= v8)
          {
            double v11 = *(double *)(result + 64);
            double v12 = *(double *)(v7 + 8);
            double v13 = v9.f32[1];
            double v14 = v12 - v13;
            double v15 = v12 + v13;
            if (v14 <= *(double *)(result + 80) + v11 && v15 >= v11) {
              break;
            }
          }
        }
      }
      v4 += 32;
      if (!--a3) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2_41(uint64_t a1, unsigned int a2, unsigned int a3)
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  unsigned int v18 = a2;
  unint64_t v3 = a2 | ((unint64_t)a3 << 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3_42;
  v9[3] = &unk_1E5DC8088;
  id v5 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  double v11 = v17;
  uint64_t v12 = v4;
  uint64_t v6 = *(void **)(a1 + 32);
  v9[4] = *(void *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 80);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v14 = v7;
  uint64_t v8 = *(void *)(a1 + 104);
  uint64_t v15 = *(void *)(a1 + 96);
  uint64_t v16 = v8;
  id v10 = v5;
  [v6 enumerateLayoutsForSpritesInRange:v3 options:1 usingBlock:v9];

  _Block_object_dispose(v17, 8);
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = (HIDWORD(a2) + a2);
  if (v2 > a2)
  {
    uint64_t v3 = a2;
    uint64_t v4 = 66 * a2;
    do
    {
      uint64_t v5 = *(void *)(result + 56) + v4;
      *(_DWORD *)uint64_t v5 = *(_DWORD *)(*(void *)(result + 40) + 4 * v3++);
      *(_OWORD *)(v5 + 4) = 0uLL;
      *(_OWORD *)(v5 + 20) = 0uLL;
      *(_OWORD *)(v5 + 36) = 0uLL;
      *(_OWORD *)(v5 + 50) = 0uLL;
      v4 += 66;
    }
    while (v2 != v3);
  }
  return result;
}

- (void)textureProvider:(id)a3 didProvidePayload:(id)a4 forRequestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  id v10 = [off_1E5DA9658 sharedInstance];
  char v11 = [v10 requestThumbnailsOnly];

  if ((v11 & 1) == 0
    && [v8 isRequestActive:v5]
    && [(PXGTextureManager *)self _getRequestDetails:v16 forRequestID:v5])
  {
    uint64_t add = atomic_fetch_add(PXGMakeNextTextureDeliveryOrderID::lastRequestID, 1u);
    long long v13 = [(PXGTextureManager *)self _existingTextureForPayload:v9 presentationType:v16[0]];
    if (v13)
    {
      [(PXGTextureManager *)self _handleProvidedSpriteTexture:v13 fromTextureProvider:v8 requestID:v5 deliveryOrder:add];
    }
    else
    {
      long long v14 = [(PXGTextureManager *)self _textureConverterForPresentationType:v16[0] contentType:4];
      uint64_t v15 = [v14 createPayloadTextureFromPayload:v9];
      if (v15)
      {
        long long v13 = [(PXGTextureManager *)self _storeTexture:v15 forPayload:v9];
        [(PXGTextureManager *)self _handleProvidedSpriteTexture:v13 fromTextureProvider:v8 requestID:v5 deliveryOrder:add];
      }
      else
      {
        long long v13 = 0;
      }
    }
  }
}

- (id)_existingTextureForPayload:(id)a3 presentationType:(unsigned __int8)a4
{
  uint64_t v4 = [(PXGTextureManager *)self _existingTextureForKey:a3 presentationType:a4];
  return v4;
}

- (void)setPreferredColorSpaceName:(unint64_t)a3
{
  if (self->_preferredColorSpaceName != a3)
  {
    self->_preferredColorSpaceName = a3;
    [(PXGTextureManager *)self _configureAllTextureProviders];
  }
}

- (void)setPreferMipmaps:(BOOL)a3
{
  if (self->_preferMipmaps != a3)
  {
    self->_preferMipmaps = a3;
    [(PXGTextureManager *)self _configureAllTextureProviders];
  }
}

- (void)setPreferBGRA:(BOOL)a3
{
  if (self->_preferBGRA != a3)
  {
    self->_preferBGRA = a3;
    [(PXGTextureManager *)self _configureAllTextureProviders];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)_configureAllTextureProviders
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__PXGTextureManager__configureAllTextureProviders__block_invoke;
  v2[3] = &unk_1E5DC82E0;
  v2[4] = self;
  [(PXGTextureManager *)self _enumerateTextureProviders:v2];
}

- (void)_enumerateTextureProviders:(id)a3
{
  id v4 = a3;
  textureProviderByMediaKind = self->_textureProviderByMediaKind;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __48__PXGTextureManager__enumerateTextureProviders___block_invoke;
  v7[3] = &unk_1E5DC8308;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)textureProviderByMediaKind enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)setTextureConverters:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_textureConverters;
  id v6 = (NSArray *)v4;
  long long v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    char v8 = [(NSArray *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      uint64_t v20 = v7;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v9 = self->_textureConverters;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v9);
            }
            long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __42__PXGTextureManager_setTextureConverters___block_invoke;
            v25[3] = &unk_1E5DC7F98;
            v25[4] = v13;
            if ([(NSArray *)v20 indexOfObjectPassingTest:v25] == 0x7FFFFFFFFFFFFFFFLL) {
              -[PXGTextureManager _registerTextureConverter:forPresentationType:](self, "_registerTextureConverter:forPresentationType:", 0, [v13 presentationType]);
            }
          }
          uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v10);
      }

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v14 = v20;
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v14);
            }
            -[PXGTextureManager _registerTextureConverter:forPresentationType:](self, "_registerTextureConverter:forPresentationType:", *(void *)(*((void *)&v21 + 1) + 8 * j), [*(id *)(*((void *)&v21 + 1) + 8 * j) presentationType]);
          }
          uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v30 count:16];
        }
        while (v15);
      }

      unsigned int v18 = (NSArray *)[(NSArray *)v14 copy];
      textureConverters = self->_textureConverters;
      self->_textureConverters = v18;

      long long v7 = v20;
    }
  }
}

- (void)_registerTextureConverter:(id)a3 forPresentationType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  char v8 = [NSNumber numberWithUnsignedChar:v4];
  uint64_t v9 = [(NSDictionary *)self->_textureConverterByPresentationType objectForKeyedSubscript:v8];
  uint64_t v10 = (void *)v9;
  if ((id)v9 != v7)
  {
    if (v9)
    {
      id v41 = a3;
      int v42 = (void *)v9;
      uint64_t v43 = v8;
      id v44 = v7;
      unint64_t streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
      if (streamInfoBySpriteIndexCount)
      {
        uint64_t v12 = 0;
        streamInfoBySpriteIndedouble x = self->_streamInfoBySpriteIndex;
        unsigned int v14 = 1;
        do
        {
          if (*(&streamInfoBySpriteIndex->var2 + 66 * v12) == v4)
          {
            uint64_t v15 = (char *)streamInfoBySpriteIndex + 66 * v12;
            long long v17 = (void *)*((void *)v15 + 6);
            uint64_t v16 = v15 + 48;
            id v18 = v17;
            uint64_t v19 = v18;
            if (v18)
            {
              [v18 removeSpriteIndex:v14 - 1 atThumbnailIndex:*(unsigned int *)((char *)&streamInfoBySpriteIndex[1].var0.var0 + 66 * v12)];
              void *v16 = 0;
              uint64_t v20 = (char *)streamInfoBySpriteIndex + 66 * v12;
              *((_DWORD *)v20 + 5) = 0;
              *((_DWORD *)v20 + 6) = 0;
            }

            long long v21 = (char *)streamInfoBySpriteIndex + 66 * v12;
            long long v24 = *(void **)(v21 + 36);
            long long v23 = (id *)(v21 + 36);
            long long v22 = v24;
            if (v24)
            {
              id v25 = v22;
              [v25 removeSpriteIndex:v14 - 1];

              long long v26 = (char *)streamInfoBySpriteIndex + 66 * v12;
              v26[64] = 0;
              *(void *)(v26 + 36) = 0;
              *(void *)(v26 + 28) = 0;
            }
            *(&streamInfoBySpriteIndex->var4 + 33 * v12) = -1;
            unint64_t streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
          }
          uint64_t v12 = v14;
        }
        while (streamInfoBySpriteIndexCount > v14++);
      }
      self->_didSwitchTextureConverter = 1;
      long long v28 = self->_textureAtlasManagers;
      textureAtlasManagers = self->_textureAtlasManagers;
      self->_textureAtlasManagers = (NSArray *)MEMORY[0x1E4F1CBF0];

      long long v30 = [(NSMutableDictionary *)self->_textureProviderByMediaKind allValues];
      requestQueue = self->_requestQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke;
      block[3] = &unk_1E5DD0F30;
      id v32 = v30;
      id v47 = v32;
      uint64_t v48 = self;
      uint64_t v33 = v28;
      id v49 = v33;
      dispatch_async(requestQueue, block);
      processQueue = self->_processQueue;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke_3;
      v45[3] = &unk_1E5DD36F8;
      v45[4] = self;
      dispatch_async(processQueue, v45);
      [(PXGTextureManager *)self _removeAllTexturesForPresentationType:v4];
      id v35 = [(PXGTextureManager *)self _storeTexture:self->_emptyTexture forKey:self->_emptyTexture];
      [(PXGTextureManager *)self _setNeedsUpdate];

      char v8 = v43;
      id v7 = v44;
      uint64_t v10 = v42;
    }
    id v36 = (void *)[(NSDictionary *)self->_textureConverterByPresentationType mutableCopy];
    [v36 setObject:v7 forKeyedSubscript:v8];
    BOOL v37 = (NSDictionary *)[v36 copy];
    textureConverterByPresentationType = self->_textureConverterByPresentationType;
    self->_textureConverterByPresentationType = v37;

    if (v7)
    {
      if (([v7 supportedContentTypes] & 8) != 0)
      {
        objc_storeStrong((id *)&self->_atlasTextureConverter, a3);
        self->_atlasPresentationType = v4;
      }
      [v7 setRequestQueue:self->_requestQueue];
      [v7 setProcessingQueue:self->_processQueue];
      [(PXGTextureManager *)self _configureTextureConverter:v7];
      char v39 = [v7 transparentTexture];
      if (v39) {
        id v40 = [(PXGTextureManager *)self _storeTexture:v39 forKey:v39];
      }
    }
  }
}

- (void)_configureTextureConverter:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setLowMemoryMode:", -[PXGTextureManager lowMemoryMode](self, "lowMemoryMode"));
}

- (id)_storeTexture:(id)a3 forPayload:(id)a4
{
  id v4 = [(PXGTextureManager *)self _storeTexture:a3 forKey:a4];
  return v4;
}

- (PXGTextureManager)initWithEntityManager:(id)a3 layoutQueue:(id)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v55.receiver = self;
  v55.super_class = (Class)PXGTextureManager;
  uint64_t v9 = [(PXGTextureManager *)&v55 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityManager, a3);
    uint64_t v11 = [v7 loadingStatus];
    v56[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    trackedComponents = v10->_trackedComponents;
    v10->_trackedComponents = (NSArray *)v12;

    objc_storeStrong((id *)&v10->_layoutQueue, a4);
    textureConverterByPresentationType = v10->_textureConverterByPresentationType;
    v10->_textureConverterByPresentationType = (NSDictionary *)MEMORY[0x1E4F1CC08];

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    textureProviderByMediaKind = v10->_textureProviderByMediaKind;
    v10->_textureProviderByMediaKind = v15;

    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    textureProvidersDisplayLinkRegistrationState = v10->_textureProvidersDisplayLinkRegistrationState;
    v10->_textureProvidersDisplayLinkRegistrationState = (NSMapTable *)v17;

    uint64_t v19 = (PXGSpriteTextureStore *)objc_alloc_init((Class)off_1E5DA6B80);
    lookupLock_textureCache = v10->_lookupLock_textureCache;
    v10->_lookupLock_textureCache = v19;

    long long v21 = (NSHashTable *)objc_alloc_init(MEMORY[0x1E4F28D30]);
    spriteTexturesInUse = v10->_spriteTexturesInUse;
    v10->_spriteTexturesInUse = v21;

    uint64_t v23 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    pendingSpriteTextureByRequestID = v10->_pendingSpriteTextureByRequestID;
    v10->_pendingSpriteTextureByRequestID = (NSMapTable *)v23;

    textureAtlasManagers = v10->_textureAtlasManagers;
    v10->_textureAtlasManagers = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v26 = [MEMORY[0x1E4F28D60] indexSet];
    loadedSpriteIndexes = v10->_loadedSpriteIndexes;
    v10->_loadedSpriteIndexes = (NSIndexSet *)v26;

    [(PXGTextureManager *)v10 _updatePreheatingStrategy];
    long long v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.photos.texture-manager-request", v29);
    requestQueue = v10->_requestQueue;
    v10->_requestQueue = (OS_dispatch_queue *)v30;

    id v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v33 = dispatch_queue_attr_make_with_qos_class(v32, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v34 = dispatch_queue_create("com.apple.photos.texture-manager-work", v33);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v34;

    id v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v37 = dispatch_queue_attr_make_with_qos_class(v36, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v38 = dispatch_queue_create("com.apple.photos.texture-manager-process", v37);
    processQueue = v10->_processQueue;
    v10->_processQueue = (OS_dispatch_queue *)v38;

    id v40 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v41 = dispatch_queue_attr_make_with_qos_class(v40, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v42 = dispatch_queue_create("com.apple.photos.texture-manager-adjust", v41);
    adjustQueue = v10->_adjustQueue;
    v10->_adjustQueue = (OS_dispatch_queue *)v42;

    id v44 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v45 = dispatch_queue_attr_make_with_qos_class(v44, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v46 = dispatch_queue_create("com.apple.photos.texture-manager-deallocations", v45);
    deallocationsQueue = v10->_deallocationsQueue;
    v10->_deallocationsQueue = (OS_dispatch_queue *)v46;

    v10->_lookupLock._os_unfair_lock_opaque = 0;
    uint64_t v48 = (PXGMutableSpriteTexture *)objc_alloc_init((Class)off_1E5DA67B8);
    emptyTexture = v10->_emptyTexture;
    v10->_emptyTexture = v48;

    id v50 = [(PXGTextureManager *)v10 _storeTexture:v10->_emptyTexture forKey:v10->_emptyTexture];
    long long v51 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    placeholderTextures = v10->_placeholderTextures;
    v10->_placeholderTextures = v51;

    uint64_t v53 = objc_alloc_init(PXGTextureProvider);
    [(PXGTextureManager *)v10 registerTextureProvider:v53 forMediaKind:0];
  }
  return v10;
}

- (id)_storeTexture:(id)a3 forKey:(id)a4
{
  id v4 = [(PXGTextureManager *)self _storeTexture:a3 forKey:a4 replaceExisting:0];
  return v4;
}

- (void)_updatePreheatingStrategy
{
  if ([(PXGTextureManager *)self lowMemoryMode]) {
    +[PXGTextureManagerPreheatingStrategy lowMemoryPreheatingStrategy];
  }
  else {
  uint64_t v3 = +[PXGTextureManagerPreheatingStrategy defaultPreheatingStrategy];
  }
  preheatingStrategdouble y = self->_preheatingStrategy;
  self->_preheatingStrategdouble y = v3;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_DWORD *)self + 48) = 1065353216;
  return self;
}

- (id)_textureAtlasManagerForImageDataSpec:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  [(PXGTextureManager *)self textureAtlasManagers];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
      [v9 thumbnailSize];
      LOWORD(v10) = a3->var2;
      if (v11 == (double)v10)
      {
        [v9 thumbnailSize];
        LOWORD(v12) = a3->var3;
        if (v13 == (double)v12 && [v9 pixelFormat] == a3->var0) {
          break;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    id atlasTextureConverter = v9;

    if (atlasTextureConverter) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
  id atlasTextureConverter = self->_atlasTextureConverter;
  if (atlasTextureConverter)
  {
    long long v17 = *(_OWORD *)&a3->var0;
    LODWORD(v18) = *(_DWORD *)&a3->var2;
    objc_msgSend(atlasTextureConverter, "createTextureAtlasManagerForImageDataSpec:mipmapped:", &v17, -[PXGTextureManager preferMipmaps](self, "preferMipmaps", v17, v18));
    id atlasTextureConverter = (id)objc_claimAutoreleasedReturnValue();
    [atlasTextureConverter setDelegate:self];
    uint64_t v15 = [v5 arrayByAddingObject:atlasTextureConverter];
    [(PXGTextureManager *)self setTextureAtlasManagers:v15];
  }
LABEL_15:

  return atlasTextureConverter;
}

- (void)setTextureAtlasManagers:(id)a3
{
}

void __48__PXGTextureManager__enumerateTextureProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 integerValue], v5);
}

uint64_t __50__PXGTextureManager__configureAllTextureProviders__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureTextureProvider:");
}

void __190__PXGTextureManager__lookupLock_requestTexturesForSpritesInRange_textureProvider_mediaKind_presentationType_isAppearing_layout_leafSpriteIndexRange_sprites_textureStreamInfos_loadingStatus___block_invoke_2(uint64_t a1)
{
  long long v2 = *((_OWORD *)off_1E5DAAFA8 + 1);
  v4[0] = *(_OWORD *)off_1E5DAAFA8;
  v4[1] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) _createTextureForCGImage:*(void *)(a1 + 56) requestID:0 requestDetails:0 processingOptions:v4 fromTextureProvider:*(void *)(a1 + 40) withTextureConverter:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 256) addObject:v3];
}

void __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    dispatch_sync(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 24), &__block_literal_global_73);
  }
}

void __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_3(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureAtlasManagers, 0);
  objc_storeStrong((id *)&self->_texturesByPresentationType, 0);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong((id *)&self->_preheatingStrategy, 0);
  objc_storeStrong((id *)&self->_textureConverters, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackedComponents, 0);
  objc_storeStrong((id *)&self->_placeholderTextures, 0);
  objc_storeStrong((id *)&self->_emptyTexture, 0);
  objc_storeStrong((id *)&self->_loadedSpriteIndexes, 0);
  next = self->_spriteIndexByRequestID.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      id v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  unint64_t value = self->_spriteIndexByRequestID.__table_.__bucket_list_.__ptr_.__value_;
  self->_spriteIndexByRequestID.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  objc_storeStrong((id *)&self->_textureProvidersDisplayLinkRegistrationState, 0);
  objc_storeStrong((id *)&self->_textureProviderByMediaKind, 0);
  objc_storeStrong((id *)&self->_atlasTextureConverter, 0);
  objc_storeStrong((id *)&self->_textureConverterByPresentationType, 0);
  objc_storeStrong((id *)&self->_pendingSpriteTextureByRequestID, 0);
  objc_storeStrong((id *)&self->_spriteTexturesInUse, 0);
  id v6 = self->_lookupLock_requestDetailsByRequestID.__table_.__p1_.__value_.__next_;
  if (v6)
  {
    do
    {
      uint64_t v7 = (void *)*v6;
      operator delete(v6);
      id v6 = v7;
    }
    while (v7);
  }
  uint64_t v8 = self->_lookupLock_requestDetailsByRequestID.__table_.__bucket_list_.__ptr_.__value_;
  self->_lookupLock_requestDetailsByRequestID.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8) {
    operator delete(v8);
  }
  objc_storeStrong((id *)&self->_lookupLock_textureCache, 0);
  objc_storeStrong((id *)&self->_deallocationsQueue, 0);
  objc_storeStrong((id *)&self->_adjustQueue, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

- (int64_t)streamCount
{
  return self->_streamCount;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (void)setDeferModifiedTextureRequestsDuringViewResizing:(unint64_t)a3
{
  self->_deferModifiedTextureRequestsDuringViewResizing = a3;
}

- (void)setPreheatingStrategy:(id)a3
{
}

- (NSArray)textureConverters
{
  return self->_textureConverters;
}

- (id)textureProvider:(id)a3 requestRenderSnapshot:(id *)a4 offscreenEffect:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(PXGTextureManager *)self delegate];
  long long v9 = *(_OWORD *)&a4->var1.origin.y;
  v12[0] = *(_OWORD *)&a4->var0;
  v12[1] = v9;
  CGFloat height = a4->var1.size.height;
  unint64_t v10 = [v8 textureManager:self requestRenderSnapshot:v12 offscreenEffect:v7];

  return v10;
}

- (void)textureProviderNeedsToUnregisterFromDisplayLinkUpdates:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGTextureManager *)self layoutQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __76__PXGTextureManager_textureProviderNeedsToUnregisterFromDisplayLinkUpdates___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __76__PXGTextureManager_textureProviderNeedsToUnregisterFromDisplayLinkUpdates___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) setObject:MEMORY[0x1E4F1CC28] forKey:*(void *)(a1 + 40)];
}

- (void)textureProviderNeedsToRegisterToDisplayLinkUpdates:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGTextureManager *)self layoutQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __72__PXGTextureManager_textureProviderNeedsToRegisterToDisplayLinkUpdates___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __72__PXGTextureManager_textureProviderNeedsToRegisterToDisplayLinkUpdates___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 152) setObject:MEMORY[0x1E4F1CC38] forKey:*(void *)(a1 + 40)];
  long long v2 = *(void **)(a1 + 32);
  return [v2 _setNeedsUpdate];
}

- (void)textureProvider:(id)a3 didProvideFailureWithError:(id)a4 forRequestID:(int)a5
{
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  layoutQueue = self->_layoutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PXGTextureManager_textureProvider_didProvideFailureWithError_forRequestID___block_invoke;
  block[3] = &unk_1E5DC8448;
  int v12 = a5;
  void block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(layoutQueue, block);
}

void __77__PXGTextureManager_textureProvider_didProvideFailureWithError_forRequestID___block_invoke(uint64_t a1)
{
  long long v2 = (_DWORD *)(a1 + 48);
  int v3 = *(_DWORD *)(a1 + 48);
  id v4 = (float *)(*(void *)(a1 + 32) + 160);
  if (std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::find<int>(v4, v3))
  {
    int v5 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v4, v3, v2)+ 5);
    id v6 = [*(id *)(a1 + 32) entityManager];
    id v7 = [v6 loadingStatus];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__PXGTextureManager_textureProvider_didProvideFailureWithError_forRequestID___block_invoke_2;
    v9[3] = &unk_1E5DC8420;
    id v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    int v11 = v5;
    id v10 = v8;
    [v7 performChanges:v9];
  }
}

void __77__PXGTextureManager_textureProvider_didProvideFailureWithError_forRequestID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 208);
  unsigned int v5 = *(_DWORD *)(a1 + 48);
  uint64_t v6 = v4 + 66 * v5;
  *(unsigned char *)(v6 + 64) = 3;
  id v7 = (unsigned char *)(v6 + 64);
  id v19 = v3;
  uint64_t v8 = [v19 mutableStates];
  if (*v7 == 3)
  {
    LOBYTE(v9) = 4;
    goto LABEL_22;
  }
  uint64_t v10 = v4 + 66 * v5;
  float32x2_t v12 = *(float32x2_t *)(v10 + 20);
  int v11 = (void *)(v10 + 20);
  float32x2_t v13 = v12;
  unsigned int v14 = *((unsigned __int8 *)v11 - 11);
  if (v14 > 0xD) {
    goto LABEL_17;
  }
  int v15 = 1 << v14;
  if ((v15 & 0x35D8) != 0) {
    PXFloatApproximatelyEqualToFloat();
  }
  if ((v15 & 0x807) != 0)
  {
    float32x2_t v13 = (float32x2_t)vcge_f32(v13, (float32x2_t)*(v11 - 1));
    if (v13.i32[0] & v13.i32[1]) {
      goto LABEL_17;
    }
  }
  else if (v13.f32[0] > 0.0)
  {
    v13.i32[0] = v13.i32[1];
    if (v13.f32[1] > 0.0) {
      goto LABEL_17;
    }
  }
  if (!*(_DWORD *)(v4 + 66 * v5 + 44) || !*(void *)(v4 + 66 * v5 + 36))
  {
    if (COERCE_FLOAT(*v11) <= 0.0)
    {
      int v9 = *(_DWORD *)(v4 + 66 * v5 + 4);
      if (v9) {
        LOBYTE(v9) = *((unsigned char *)v11 - 11) != 0;
      }
      goto LABEL_22;
    }
LABEL_19:
    LOBYTE(v9) = 2;
    goto LABEL_22;
  }
  unsigned int v16 = *v7;
  if (v16 < 2) {
    goto LABEL_19;
  }
  if (v16 == 2)
  {
LABEL_17:
    LOBYTE(v9) = 3;
    goto LABEL_22;
  }
  if (v16 == 3)
  {
    long long v17 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(double *)&v13);
    uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXGUpdateLoadingStatusForStreamInfo(PXGSpriteIndex, const PXGStreamInfo *, PXGLoadingState *)");
    [v17 handleFailureInFunction:v18 file:@"PXGTextureManager.mm" lineNumber:201 description:@"Should be handled earlier"];

    abort();
  }
  LOBYTE(v9) = 0;
LABEL_22:
  *(unsigned char *)(v8 + *(unsigned int *)(v4 + 66 * v5)) = v9;
  objc_msgSend(v19, "setError:forEntity:", *(void *)(a1 + 40));
}

- (void)textureProvider:(id)a3 didProvidePixelBuffer:(__CVBuffer *)a4 options:(id)a5 adjustment:(id)a6 forRequestID:(int)a7
{
  uint64_t v8 = *(void **)&a5.var2;
  int v9 = *(_OWORD **)&a5.var0;
  id v12 = a3;
  id v13 = v8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if (([v12 isRequestActive:a6] & 1) != 0
    && [(PXGTextureManager *)self _getRequestDetails:&v52 forRequestID:a6])
  {
    uint64_t add = atomic_fetch_add(PXGMakeNextTextureDeliveryOrderID::lastRequestID, 1u);
    long long v15 = v9[1];
    v51[0] = *v9;
    v51[1] = v15;
    unsigned int v16 = [(PXGTextureManager *)self _existingTextureForPixelBuffer:a4 processingOptions:v51 presentationType:v52];
    if (v16)
    {
      int v17 = *((unsigned __int8 *)v9 + 16);
      if (v13)
      {
LABEL_7:
        uint64_t v18 = [(PXGTextureManager *)self _existingAdjustedTextureForSourceTexture:v16 adjustment:v13 wantsMipmaps:v17 != 0 presentationType:v52];
        if (v18)
        {
          [(PXGTextureManager *)self _handleProvidedSpriteTexture:v18 fromTextureProvider:v12 requestID:a6 deliveryOrder:add];
        }
        else
        {
          uint64_t v23 = [(PXGTextureManager *)self _textureConverterForPresentationType:v52 contentType:1];
          uint64_t v24 = v23;
          if (v13 || *((unsigned char *)v9 + 16) && [v23 supportsMipmaps])
          {
            objc_initWeak(&location, self);
            adjustQueue = self->_adjustQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __91__PXGTextureManager_textureProvider_didProvidePixelBuffer_options_adjustment_forRequestID___block_invoke;
            block[3] = &unk_1E5DC8358;
            objc_copyWeak(&v45, &location);
            id v41 = v13;
            long long v26 = v9[1];
            long long v39 = *v9;
            long long v40 = v26;
            id v42 = v16;
            id v43 = v12;
            id v44 = v24;
            int v46 = (int)a6;
            int v47 = add;
            int v48 = v52;
            char v49 = v53;
            dispatch_async(adjustQueue, block);

            objc_destroyWeak(&v45);
            objc_destroyWeak(&location);
          }
          else
          {
            [(PXGTextureManager *)self _handleProvidedSpriteTexture:v16 fromTextureProvider:v12 requestID:a6 deliveryOrder:add];
          }
        }
        goto LABEL_18;
      }
      if (*((unsigned char *)v9 + 16))
      {
        int v17 = 1;
        goto LABEL_7;
      }
      [(PXGTextureManager *)self _handleProvidedSpriteTexture:v16 fromTextureProvider:v12 requestID:a6 deliveryOrder:add];
    }
    else
    {
      id v19 = [(PXGTextureManager *)self _textureConverterForPresentationType:v52 contentType:1];
      CVPixelBufferRetain(a4);
      objc_initWeak(&location, self);
      processQueue = self->_processQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __91__PXGTextureManager_textureProvider_didProvidePixelBuffer_options_adjustment_forRequestID___block_invoke_2;
      v27[3] = &unk_1E5DC83F8;
      objc_copyWeak(v33, &location);
      v33[1] = a4;
      long long v21 = v9[1];
      long long v28 = *v9;
      long long v29 = v21;
      id v30 = v13;
      id v31 = v12;
      id v32 = v19;
      int v35 = add;
      int v36 = v52;
      char v37 = v53;
      int v34 = (int)a6;
      id v22 = v19;
      dispatch_async(processQueue, v27);

      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
    }
LABEL_18:
  }
}

void __91__PXGTextureManager_textureProvider_didProvidePixelBuffer_options_adjustment_forRequestID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  LODWORD(v3) = *(_DWORD *)(a1 + 108);
  id v4 = WeakRetained;
  [WeakRetained _applyAdjustment:*(void *)(a1 + 64) withMipmaps:*(unsigned __int8 *)(a1 + 48) toTexture:*(void *)(a1 + 72) fromTextureProvider:*(void *)(a1 + 80) withTextureConverter:*(void *)(a1 + 88) forRequestID:*(unsigned int *)(a1 + 104) deliveryOrder:v3 requestDetails:*(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32)];
}

void __91__PXGTextureManager_textureProvider_didProvidePixelBuffer_options_adjustment_forRequestID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v3 = *(void *)(a1 + 96);
  long long v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  LODWORD(v5) = *(_DWORD *)(a1 + 108);
  [WeakRetained _processPixelBuffer:v3 options:v6 adjustment:*(void *)(a1 + 64) fromTextureProvider:*(void *)(a1 + 72) withTextureConverter:*(void *)(a1 + 80) forRequestID:*(unsigned int *)(a1 + 104) requestDetails:*(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32) deliveryOrder:v5];

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 96));
}

void __98__PXGTextureManager_textureProvider_didProvideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  LODWORD(v3) = *(_DWORD *)(a1 + 108);
  id v4 = WeakRetained;
  [WeakRetained _applyAdjustment:*(void *)(a1 + 64) withMipmaps:*(unsigned __int8 *)(a1 + 48) toTexture:*(void *)(a1 + 72) fromTextureProvider:*(void *)(a1 + 80) withTextureConverter:*(void *)(a1 + 88) forRequestID:*(unsigned int *)(a1 + 104) deliveryOrder:v3 requestDetails:*(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32)];
}

- (void)_applyAdjustment:(id)a3 withMipmaps:(BOOL)a4 toTexture:(id)a5 fromTextureProvider:(id)a6 withTextureConverter:(id)a7 forRequestID:(int)a8 deliveryOrder:(unsigned int)a9 requestDetails:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  BOOL v14 = a4;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_adjustQueue);
  if ([v18 isRequestActive:v10])
  {
    -[PXGTextureManager _existingAdjustedTextureForSourceTexture:adjustment:wantsMipmaps:presentationType:](self, "_existingAdjustedTextureForSourceTexture:adjustment:wantsMipmaps:presentationType:", v17, v16, v14, [v19 presentationType]);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      if (v14) {
        uint64_t v21 = 0x100000000;
      }
      else {
        uint64_t v21 = 0;
      }
      id v20 = [v19 applyAdjustment:v16 toTexture:v17 options:v21 & 0xFFFFFFFF00000000 | (*(unint64_t *)&a10 >> 8)];
      if (!v20)
      {
        id v23 = v17;
LABEL_11:
        objc_initWeak(&location, self);
        requestQueue = self->_requestQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __143__PXGTextureManager__applyAdjustment_withMipmaps_toTexture_fromTextureProvider_withTextureConverter_forRequestID_deliveryOrder_requestDetails___block_invoke;
        block[3] = &unk_1E5DC8380;
        objc_copyWeak(&v29, &location);
        id v27 = v23;
        id v28 = v18;
        int v30 = v10;
        unsigned int v31 = a9;
        id v25 = v23;
        dispatch_async(requestQueue, block);

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
      id v22 = [(PXGTextureManager *)self _storeAdjustedTexture:v20 forSourceTexture:v17 adjustment:v16 mipmaps:v14];
    }
    id v23 = v17;
    if (v20 != v17)
    {
      objc_msgSend(v20, "setSourceCGImage:", objc_msgSend(v17, "sourceCGImage"));
      objc_msgSend(v20, "setSourceCVPixelBuffer:", objc_msgSend(v17, "sourceCVPixelBuffer"));
      id v23 = v20;
    }
    goto LABEL_11;
  }
LABEL_12:
}

void __143__PXGTextureManager__applyAdjustment_withMipmaps_toTexture_fromTextureProvider_withTextureConverter_forRequestID_deliveryOrder_requestDetails___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleProvidedSpriteTexture:*(void *)(a1 + 32) fromTextureProvider:*(void *)(a1 + 40) requestID:*(unsigned int *)(a1 + 56) deliveryOrder:*(unsigned int *)(a1 + 60)];
}

- (id)_createTextureForCVPixelBuffer:(__CVBuffer *)a3 requestID:(int)a4 requestDetails:(id)a5 processingOptions:(id)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8
{
  int v9 = *(long long **)&a6.var0;
  id v14 = *(id *)&a6.var2;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  long long v16 = v9[1];
  v31[0] = *v9;
  v31[1] = v16;
  id v17 = -[PXGTextureManager _existingTextureForPixelBuffer:processingOptions:presentationType:](self, "_existingTextureForPixelBuffer:processingOptions:presentationType:", a3, v31, [v15 presentationType]);
  if (!v17)
  {
    CVPixelBufferGetWidth(a3);
    CVPixelBufferGetHeight(a3);
    kdebug_trace();
    long long v18 = *v9;
    LODWORD(v19) = *((_DWORD *)v9 + 5);
    id v30 = 0;
    id v20 = [v15 createTextureFromCVPixelBuffer:a3 transform:(*(unint64_t *)&a5 >> 8) alpha:&v30 options:*(double *)&v18 error:v19];
    id v21 = v30;
    [v20 pixelSize];
    kdebug_trace();
    if (v20)
    {
      id v17 = [(PXGTextureManager *)self _storeTexture:v20 forKey:a3 replaceExisting:*((unsigned __int8 *)v9 + 24)];
    }
    else
    {
      objc_initWeak(&location, self);
      requestQueue = self->_requestQueue;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      _OWORD v24[2] = __136__PXGTextureManager__createTextureForCVPixelBuffer_requestID_requestDetails_processingOptions_fromTextureProvider_withTextureConverter___block_invoke;
      v24[3] = &unk_1E5DC83A8;
      objc_copyWeak(&v27, &location);
      id v25 = v14;
      id v26 = v21;
      int v28 = a4;
      dispatch_async(requestQueue, v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
      id v17 = 0;
    }
  }
  return v17;
}

void __136__PXGTextureManager__createTextureForCVPixelBuffer_requestID_requestDetails_processingOptions_fromTextureProvider_withTextureConverter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained textureProvider:*(void *)(a1 + 32) didProvideFailureWithError:*(void *)(a1 + 40) forRequestID:*(unsigned int *)(a1 + 56)];
}

- (void)_processPixelBuffer:(__CVBuffer *)a3 options:(id)a4 adjustment:(id)a5 fromTextureProvider:(id)a6 withTextureConverter:(id)a7 forRequestID:(int)a8 requestDetails:(id)a9 deliveryOrder:(unsigned int)a10
{
  id v13 = *(_OWORD **)&a4.var0;
  id v16 = *(id *)&a4.var2;
  id v17 = a5;
  id v18 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  if ([v17 isRequestActive:a7])
  {
    long long v19 = v13[1];
    v45[0] = *v13;
    v45[1] = v19;
    id v20 = [(PXGTextureManager *)self _createTextureForCVPixelBuffer:a3 requestID:a7 requestDetails:*(void *)&a8 & 0xFFFFFFFFFFLL processingOptions:v45 fromTextureProvider:v17 withTextureConverter:v18];
    if (v20)
    {
      if (v16 || *((unsigned char *)v13 + 16) && [v18 supportsMipmaps])
      {
        objc_initWeak(&location, self);
        adjustQueue = self->_adjustQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __143__PXGTextureManager__processPixelBuffer_options_adjustment_fromTextureProvider_withTextureConverter_forRequestID_requestDetails_deliveryOrder___block_invoke;
        block[3] = &unk_1E5DC8358;
        id v22 = &v39;
        objc_copyWeak(&v39, &location);
        id v35 = v16;
        long long v23 = v13[1];
        long long v33 = *v13;
        long long v34 = v23;
        id v36 = v20;
        id v37 = v17;
        id v38 = v18;
        int v40 = (int)a7;
        int v41 = *(_DWORD *)&a9.var0;
        char v43 = v46;
        int v42 = a8;
        dispatch_async(adjustQueue, block);

        uint64_t v24 = v35;
      }
      else
      {
        objc_initWeak(&location, self);
        requestQueue = self->_requestQueue;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        _OWORD v26[2] = __143__PXGTextureManager__processPixelBuffer_options_adjustment_fromTextureProvider_withTextureConverter_forRequestID_requestDetails_deliveryOrder___block_invoke_2;
        v26[3] = &unk_1E5DC8380;
        id v22 = &v29;
        objc_copyWeak(&v29, &location);
        id v27 = v20;
        id v28 = v17;
        int v30 = (int)a7;
        int v31 = *(_DWORD *)&a9.var0;
        dispatch_async(requestQueue, v26);

        uint64_t v24 = v27;
      }

      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
    }
  }
}

void __143__PXGTextureManager__processPixelBuffer_options_adjustment_fromTextureProvider_withTextureConverter_forRequestID_requestDetails_deliveryOrder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  LODWORD(v3) = *(_DWORD *)(a1 + 108);
  id v4 = WeakRetained;
  [WeakRetained _applyAdjustment:*(void *)(a1 + 64) withMipmaps:*(unsigned __int8 *)(a1 + 48) toTexture:*(void *)(a1 + 72) fromTextureProvider:*(void *)(a1 + 80) withTextureConverter:*(void *)(a1 + 88) forRequestID:*(unsigned int *)(a1 + 104) deliveryOrder:v3 requestDetails:*(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32)];
}

void __143__PXGTextureManager__processPixelBuffer_options_adjustment_fromTextureProvider_withTextureConverter_forRequestID_requestDetails_deliveryOrder___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleProvidedSpriteTexture:*(void *)(a1 + 32) fromTextureProvider:*(void *)(a1 + 40) requestID:*(unsigned int *)(a1 + 56) deliveryOrder:*(unsigned int *)(a1 + 60)];
}

void __130__PXGTextureManager__createTextureForCGImage_requestID_requestDetails_processingOptions_fromTextureProvider_withTextureConverter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained textureProvider:*(void *)(a1 + 32) didProvideFailureWithError:*(void *)(a1 + 40) forRequestID:*(unsigned int *)(a1 + 56)];
}

void __147__PXGTextureManager__processCGImage_options_adjustment_isDegraded_fromTextureProvider_withTextureConverter_requestID_requestDetails_deliveryOrder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  LODWORD(v3) = *(_DWORD *)(a1 + 108);
  id v4 = WeakRetained;
  [WeakRetained _applyAdjustment:*(void *)(a1 + 64) withMipmaps:*(unsigned __int8 *)(a1 + 48) toTexture:*(void *)(a1 + 72) fromTextureProvider:*(void *)(a1 + 80) withTextureConverter:*(void *)(a1 + 88) forRequestID:*(unsigned int *)(a1 + 104) deliveryOrder:v3 requestDetails:*(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32)];
}

uint64_t __48__PXGTextureManager__addTextureToTexturesInUse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hash];
}

uint64_t __94__PXGTextureManager__handleProvidedSpriteTexture_fromTextureProvider_requestID_deliveryOrder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addTextureToTexturesInUse:*(void *)(a1 + 40)];
}

- (id)_storeAdjustedTexture:(id)a3 forSourceTexture:(id)a4 adjustment:(id)a5 mipmaps:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [[PXGAdjustedTexturePayload alloc] initWithTexture:v11 adjustment:v12 mipmaps:v6];
  [v10 setCacheKey:v13];
  id v14 = [(PXGTextureManager *)self _storeTexture:v10 forKey:v13];

  return v14;
}

- (id)_existingAdjustedTextureForSourceTexture:(id)a3 adjustment:(id)a4 wantsMipmaps:(BOOL)a5 presentationType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [[PXGAdjustedTexturePayload alloc] initWithTexture:v10 adjustment:v11 mipmaps:v7];
  id v13 = [(PXGTextureManager *)self _existingTextureForKey:v12 presentationType:v6];

  return v13;
}

- (id)_existingTextureForPixelBuffer:(__CVBuffer *)a3 processingOptions:(id)a4 presentationType:(unsigned __int8)a5
{
  uint64_t v5 = *(float32x4_t **)&a4.var0;
  uint64_t v8 = [(PXGTextureManager *)self _existingTextureForKey:a3 presentationType:*(void *)&a4.var2];
  [v8 alpha];
  v9.i32[0] = v5[1].i32[1];
  if (v10 == *(float *)v9.i32)
  {
    [v8 orientationTransform];
    float32x4_t v13 = v12;
    float32x4_t v11 = *v5;
    uint16x4_t v9 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(v13, *v5)), 0xFuLL));
    if (vminv_u16(v9)) {
      goto LABEL_6;
    }
    v9.i32[0] = v5[1].i32[1];
  }
  else
  {
    float32x4_t v11 = *v5;
  }
  uint64_t v14 = [v8 copyWithOrientationTransform:*(double *)v11.i64 alpha:*(double *)&v9];

  uint64_t v8 = (void *)v14;
  id v15 = [(PXGTextureManager *)self _storeTexture:v14 forKey:a3 replaceExisting:v5[1].u8[8]];
LABEL_6:
  return v8;
}

- (void)_removeAllTexturesForPresentationType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  p_lookupLocuint64_t k = &self->_lookupLock;
  os_unfair_lock_assert_not_owner(&self->_lookupLock);
  os_unfair_lock_lock(p_lookupLock);
  [(PXGSpriteTextureStore *)self->_lookupLock_textureCache removeAllTexturesForPresentationType:v3];
  os_unfair_lock_unlock(p_lookupLock);
}

- (void)_enumerateTextureConverters:(id)a3
{
  id v4 = a3;
  textureConverterByPresentationType = self->_textureConverterByPresentationType;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __49__PXGTextureManager__enumerateTextureConverters___block_invoke;
  v7[3] = &unk_1E5DC8330;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)textureConverterByPresentationType enumerateKeysAndObjectsUsingBlock:v7];
}

void __49__PXGTextureManager__enumerateTextureConverters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 integerValue], v5);
}

- (void)_configureAllTextureConverters
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__PXGTextureManager__configureAllTextureConverters__block_invoke;
  v2[3] = &unk_1E5DC82B8;
  v2[4] = self;
  [(PXGTextureManager *)self _enumerateTextureConverters:v2];
}

uint64_t __51__PXGTextureManager__configureAllTextureConverters__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureTextureConverter:");
}

- (void)setLowMemoryMode:(BOOL)a3
{
  if (self->_lowMemoryMode != a3)
  {
    self->_lowMemoryMode = a3;
    [(PXGTextureManager *)self _updatePreheatingStrategy];
    [(PXGTextureManager *)self _configureAllTextureProviders];
    [(PXGTextureManager *)self _configureAllTextureConverters];
  }
}

- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3
{
  if (self->_allowLargerImagesDuringScrollingInLowMemoryMode != a3)
  {
    self->_allowLargerImagesDuringScrollingInLowMemoryMode = a3;
    [(PXGTextureManager *)self _configureAllTextureProviders];
  }
}

- (void)releaseCachedResources
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXGTextureManager *)self layoutQueue];
  dispatch_assert_queue_V2(v3);

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = [(NSMutableDictionary *)self->_textureProviderByMediaKind objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) releaseCachedResources];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (CGImage)textureSnapshotForSpriteIndex:(unsigned int)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PXGTextureManager_textureSnapshotForSpriteIndex___block_invoke;
  v5[3] = &unk_1E5DC8290;
  unsigned int v6 = a3;
  v5[4] = &v7;
  [(PXGTextureManager *)self _enumerateSpriteTextures:v5];
  uint64_t v3 = (CGImage *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __51__PXGTextureManager_textureSnapshotForSpriteIndex___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 containsSpriteIndex:*(unsigned int *)(a1 + 40)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 imageRepresentation];
    *a3 = 1;
  }
}

uint64_t __190__PXGTextureManager__lookupLock_requestTexturesForSpritesInRange_textureProvider_mediaKind_presentationType_isAppearing_layout_leafSpriteIndexRange_sprites_textureStreamInfos_loadingStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) addObject:*(void *)(a1 + 40)];
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1[4] + 48));
  unint64_t v6 = a2 + a3;
  if (a2 + a3 > (unint64_t)a2)
  {
    unint64_t v7 = a2;
    do
    {
      uint64_t v8 = a1[7];
      uint64_t v9 = (unsigned int *)(v8 + 66 * v7);
      (*(void (**)(void))(a1[6] + 16))();
      uint64_t v10 = *(void **)(v9 + 9);
      if (v10)
      {
        id v11 = v10;
        [v11 removeSpriteIndex:a2];

        uint64_t v12 = v8 + 66 * v7;
        *(unsigned char *)(v12 + 64) = 0;
        *(void *)(v12 + 36) = 0;
        *(void *)(v12 + 28) = 0;
      }
      uint64_t v13 = v8 + 66 * v7;
      id v15 = *(void **)(v13 + 48);
      uint64_t v14 = (void *)(v13 + 48);
      id v16 = v15;
      id v17 = v16;
      if (v16)
      {
        [v16 removeSpriteIndex:a2 atThumbnailIndex:*(unsigned int *)(v8 + 66 * v7 + 56)];
        void *v14 = 0;
        uint64_t v18 = v8 + 66 * v7;
        *(_DWORD *)(v18 + 20) = 0;
        *(_DWORD *)(v18 + 24) = 0;
      }

      *(unsigned char *)(a1[9] + *v9) = 0;
      unint64_t v7 = (a2 + 1);
      a2 = v7;
    }
    while (v6 > v7);
  }
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4_44(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a2;
    uint64_t v5 = result;
    uint64_t v6 = 66 * a2 + 65;
    do
    {
      if (*(unsigned char *)(*(void *)(v5 + 40) + v6)) {
        result = [*(id *)(v5 + 32) addIndex:v4];
      }
      ++v4;
      v6 += 66;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_59(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 >= a2 + a3) {
    return result;
  }
  uint64_t v3 = a3;
  uint64_t v4 = result;
  uint64_t v5 = 0;
  uint64_t v6 = 66 * a2 + 4;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v8 = *(int *)(*(void *)(v4 + 40) + v6);
    if (!v8) {
      goto LABEL_10;
    }
    if (v5 && v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v5 + v7 == v8)
      {
        ++v5;
        goto LABEL_10;
      }
      result = objc_msgSend(*(id *)(v4 + 32), "addIndexesInRange:");
    }
    uint64_t v7 = v8;
    uint64_t v5 = 1;
LABEL_10:
    v6 += 66;
    --v3;
  }
  while (v3);
  if (v5)
  {
    uint64_t v9 = *(void **)(v4 + 32);
    return [v9 addIndexesInRange:v7];
  }
  return result;
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5_67(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pruneTextures:*(void *)(a1 + 40)];
}

void __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v5++) clearTextureAtlasManagerCache];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  uint64_t v6 = [a1[5] layoutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke_2;
  block[3] = &unk_1E5DD36F8;
  id v8 = a1[6];
  dispatch_async(v6, block);
}

uint64_t __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) removeAllObjects];
}

uint64_t __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) hash];
}

BOOL __42__PXGTextureManager_setTextureConverters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LODWORD(a1) = [*(id *)(a1 + 32) presentationType];
  BOOL v4 = a1 == [v3 presentationType];

  return v4;
}

- (NSString)description
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __32__PXGTextureManager_description__block_invoke;
  v32[3] = &unk_1E5DC7F70;
  v32[4] = &v37;
  v32[5] = &v33;
  [(PXGTextureManager *)self _enumerateSpriteTextures:v32];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [(PXGTextureManager *)self textureAtlasManagers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = [v7 textures];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = [*(id *)(*((void *)&v24 + 1) + 8 * j) estimatedByteSize];
              v38[3] += v12;
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v41 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v42 count:16];
    }
    while (v4);
  }

  uint64_t v13 = NSString;
  v23.receiver = self;
  v23.super_class = (Class)PXGTextureManager;
  uint64_t v14 = [(PXGTextureManager *)&v23 description];
  unint64_t v15 = v38[3];
  uint64_t v16 = v34[3];
  id v17 = [(PXGTextureManager *)self textureAtlasManagers];
  uint64_t v18 = [v13 stringWithFormat:@"<%@ totalMemory:%.2fMB imageTextures:%lu atlasManagers:%@>", v14, (double)v15 * 0.0009765625 * 0.0009765625, v16, v17];

  do
  {
    uint64_t v19 = [v18 length];
    id v20 = [v18 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

    id v21 = [v20 stringByReplacingOccurrencesOfString:@"\\\" withString:@"\"];

    uint64_t v18 = v21;
  }
  while ([v21 length] != v19);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return (NSString *)v21;
}

void __32__PXGTextureManager_description__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 estimatedByteSize];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)dealloc
{
  streamInfoBySpriteIndedouble x = self->_streamInfoBySpriteIndex;
  unint64_t streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
  if (streamInfoBySpriteIndexCount)
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      uint64_t v7 = (char *)streamInfoBySpriteIndex + 66 * v5;
      uint64_t v10 = *(void **)(v7 + 36);
      uint64_t v9 = (id *)(v7 + 36);
      id v8 = v10;
      if (v10)
      {
        id v11 = v8;
        [v11 removeSpriteIndex:v6 - 1];

        uint64_t v12 = (char *)streamInfoBySpriteIndex + 66 * v5;
        v12[64] = 0;
        *(void *)(v12 + 36) = 0;
        *(void *)(v12 + 28) = 0;

        unint64_t streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
      }
      uint64_t v5 = v6;
    }
    while (streamInfoBySpriteIndexCount > v6++);
    streamInfoBySpriteIndedouble x = self->_streamInfoBySpriteIndex;
  }
  free(streamInfoBySpriteIndex);
  v14.receiver = self;
  v14.super_class = (Class)PXGTextureManager;
  [(PXGTextureManager *)&v14 dealloc];
}

@end