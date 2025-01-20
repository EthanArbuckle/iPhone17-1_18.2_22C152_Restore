@interface PLTiledLayer
- (BOOL)visibleTileRegionHasChanged:(CGRect)a3 level:(int)a4;
- (CGSize)jpegImageSize;
- (PLTiledLayer)initWithJPEGData:(id)a3 placeholderImage:(CGImage *)a4 screenSize:(CGSize)a5;
- (double)zoomStartScaleForImage:(CGSize)a3 placeholderImageSize:(CGSize)a4;
- (void)dealloc;
- (void)decodeImageRectangle:(CGRect)a3 forLevel:(int)a4 requestId:(unsigned int)a5 completionHandler:(id)a6;
- (void)flushCache;
- (void)prepareForDecoding;
- (void)removeAllTiles;
- (void)runMetalConversionOnSurface:(__IOSurface *)a3 completionHandler:(id)a4;
- (void)runVImageConversionOnSurface:(__IOSurface *)a3 completionHandler:(id)a4;
- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4;
- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4 completionHandler:(id)a5;
- (void)setupConverterForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4;
- (void)updateSubLayers:(id)a3;
@end

@implementation PLTiledLayer

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4
{
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4 completionHandler:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  unsigned int shouldTile = self->_shouldTile;
  if (self->_shouldTile)
  {
    double v13 = *(double *)&sZoomLevelScaleFactor;
    unsigned int shouldTile = -1;
    do
    {
      double v13 = v13 * 0.5;
      ++shouldTile;
    }
    while (v13 > a4);
  }
  if (shouldTile >= 3) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = shouldTile;
  }
  BOOL v15 = -[PLTiledLayer visibleTileRegionHasChanged:level:](self, "visibleTileRegionHasChanged:level:", v14, x, a3.origin.y, a3.size.width, a3.size.height);
  self->_lastVisibleRect.origin.double x = x;
  self->_lastVisibleRect.origin.CGFloat y = y;
  self->_lastVisibleRect.size.CGFloat width = width;
  self->_lastVisibleRect.size.CGFloat height = height;
  self->_lastZoomScale = a4;
  if (!v15)
  {
    if (!a5) {
      return;
    }
    goto LABEL_14;
  }
  atomic_fetch_add((atomic_uint *volatile)&self->_requestId, 1u);
  if (self->_zoomStartScale >= a4 || !self->_err) {
LABEL_14:
  }
    pl_dispatch_async();
}

uint64_t __64__PLTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllTiles];
}

uint64_t __64__PLTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeImageRectangle:forLevel:requestId:completionHandler:", *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (BOOL)visibleTileRegionHasChanged:(CGRect)a3 level:(int)a4
{
  unsigned int shouldTile = self->_shouldTile;
  if (self->_shouldTile)
  {
    double v5 = *(double *)&sZoomLevelScaleFactor;
    unsigned int shouldTile = -1;
    do
    {
      double v5 = v5 * 0.5;
      ++shouldTile;
    }
    while (v5 > self->_lastZoomScale);
  }
  if (shouldTile >= 3) {
    unsigned int shouldTile = 3;
  }
  BOOL result = shouldTile != a4
        || (double x = self->_lastVisibleRect.origin.x, v7 = self->_tilePixelSize << a4, (int)a3.origin.x / v7 != (int)x / v7)
        || (double y = self->_lastVisibleRect.origin.y, (int)a3.origin.y / v7 != (int)y / v7)
        || (int)(a3.origin.x + a3.size.width + -1.0) / v7 != (int)(x + self->_lastVisibleRect.size.width + -1.0) / v7
        || (int)(a3.origin.y + a3.size.height + -1.0) / v7 != (int)(y + self->_lastVisibleRect.size.height + -1.0) / v7;
  return result;
}

- (void)removeAllTiles
{
  self->_visibleTileIds = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
  pl_dispatch_async();
}

void __30__PLTiledLayer_removeAllTiles__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        v8 = (void *)[*(id *)(*(void *)(a1 + 40) + 168) objectForKey:v7];
        [v8 removeFromSuperlayer];
        [v8 setContents:0];
        [*(id *)(*(void *)(a1 + 40) + 168) removeObjectForKey:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)decodeImageRectangle:(CGRect)a3 forLevel:(int)a4 requestId:(unsigned int)a5 completionHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!self->_err)
  {
    int v35 = self->_tilePixelSize << a4;
    int v8 = (int)(a3.origin.x / (double)v35);
    int v38 = (int)(a3.origin.y / (double)v35);
    int v39 = (int)((a3.origin.x + a3.size.width + -1.0) / (double)v35);
    int v37 = (int)((a3.origin.y + a3.size.height + -1.0) / (double)v35);
    v36 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    long long v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    visibleTileIds = self->_visibleTileIds;
    uint64_t v11 = [(NSMutableSet *)visibleTileIds countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v51;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v51 != v13) {
            objc_enumerationMutation(visibleTileIds);
          }
          BOOL v15 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
          v16 = (int *)[v15 bytes];
          if (v16[2] == a4
            && (*v16 >= v8 ? (BOOL v17 = *v16 <= v39) : (BOOL v17 = 0),
                v17 && ((int v18 = v16[1], v18 >= v38) ? (v19 = v18 <= v37) : (v19 = 0), v19)))
          {
            [(NSMutableSet *)v36 addObject:v15];
          }
          else
          {
            v20 = objc_alloc_init(PLTile);
            [(PLTile *)v20 setVisible:0];
            [(PLTile *)v20 setTileId:v15];
            [v9 addObject:v20];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v21 = [(NSMutableSet *)visibleTileIds countByEnumeratingWithState:&v50 objects:v54 count:16];
        uint64_t v12 = v21;
      }
      while (v21);
    }
    v22 = self;
    unsigned int v23 = a5;
    if (v8 <= v39)
    {
      int v34 = 0;
      do
      {
        if (v22->_requestId != v23) {
          break;
        }
        int v24 = v38;
        if (v38 <= v37)
        {
          int v25 = v38 * v35;
          do
          {
            if (v22->_requestId != v23) {
              break;
            }
            v49[2] = a4;
            v49[0] = v8;
            v49[1] = v24;
            uint64_t v26 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v49 length:12];
            id v27 = [(PLCache *)v22->_tileCache objectForKey:v26];
            if (([(NSMutableSet *)v22->_visibleTileIds containsObject:v26] & 1) == 0)
            {
              if (v27)
              {
                [v27 setVisible:1];
                os_unfair_lock_lock(&v22->_lock);
                [v9 addObject:v27];
                [(NSMutableSet *)v36 addObject:v26];
                os_unfair_lock_unlock(&v22->_lock);
              }
              else
              {
                v56.origin.double y = (double)v25;
                v58.size.CGFloat width = v22->_fullSize.width;
                v58.size.CGFloat height = v22->_fullSize.height;
                v58.origin.double x = 0.0;
                v58.origin.double y = 0.0;
                v56.origin.double x = (double)(v8 * v35);
                v56.size.CGFloat width = (double)v35;
                v56.size.CGFloat height = (double)v35;
                CGRect v57 = CGRectIntersection(v56, v58);
                if ((int)v57.size.width) {
                  BOOL v28 = (int)v57.size.height == 0;
                }
                else {
                  BOOL v28 = 1;
                }
                if (!v28)
                {
                  v47[0] = MEMORY[0x1E4F143A8];
                  v47[1] = 3221225472;
                  v47[2] = __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke;
                  v47[3] = &unk_1E63D23B0;
                  CGRect v48 = v57;
                  v47[4] = v26;
                  v47[5] = v22;
                  v47[6] = v9;
                  v47[7] = v36;
                  if (v22->_metalConverter)
                  {
                    v29 = v45;
                    v45[0] = MEMORY[0x1E4F143A8];
                    v45[1] = 3221225472;
                    v45[2] = __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_2;
                    v45[3] = &unk_1E63D23D8;
                    v45[4] = v22;
                    v30 = &v46;
                  }
                  else if (v22->_vimageConverter)
                  {
                    v29 = v43;
                    v43[0] = MEMORY[0x1E4F143A8];
                    v43[1] = 3221225472;
                    v43[2] = __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_3;
                    v43[3] = &unk_1E63D23D8;
                    v43[4] = v22;
                    v30 = &v44;
                  }
                  else
                  {
                    v29 = v41;
                    v41[0] = MEMORY[0x1E4F143A8];
                    v41[1] = 3221225472;
                    v41[2] = __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_4;
                    v41[3] = &unk_1E63D2400;
                    v30 = &v42;
                  }
                  ++v34;
                  uint64_t *v30 = (uint64_t)v47;
                  v40 = (void *)[v29 copy];
                  unsigned int v23 = a5;
                  pl_dispatch_async();
                }
              }
            }
            ++v24;
            v25 += v35;
          }
          while (v37 + 1 != v24);
        }
        BOOL v28 = v8++ == v39;
      }
      while (!v28);
    }
    if (v22->_decoderCount >= 1)
    {
      uint64_t v31 = 0;
      uint64_t v32 = 8;
      do
      {
        pl_dispatch_sync();
        ++v31;
        v32 += 16;
      }
      while (v31 < v22->_decoderCount);
    }
    pl_dispatch_sync();
    if (v22->_requestId == a5)
    {

      v22->_visibleTileIds = v36;
      v22->_zoomLevel = a4;
      pl_dispatch_async();
    }
    else
    {
    }
  }
}

void __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_alloc_init(PLTile);
  [(PLTile *)v4 setDecodedSurface:a2];
  [(PLTile *)v4 setVisible:1];
  [(PLTile *)v4 setTileId:*(void *)(a1 + 32)];
  -[PLTile setImageRect:](v4, "setImageRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(*(void *)(a1 + 40) + 144) setObject:v4 forKey:*(void *)(a1 + 32)];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 224));
  [*(id *)(a1 + 48) addObject:v4];
  [*(id *)(a1 + 56) addObject:*(void *)(a1 + 32)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 224));
}

uint64_t __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) runMetalConversionOnSurface:a2 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) runVImageConversionOnSurface:a2 completionHandler:*(void *)(a1 + 40)];
}

void __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_4(uint64_t a1, const void *a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFRelease(a2);
}

void __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 88) == *(_DWORD *)(v1 + 192))
  {
    uint64_t v3 = *(void *)(v1 + 152);
    int v4 = *(_DWORD *)(a1 + 92);
    int v5 = *(_DWORD *)(v1 + 96);
    double v6 = *(double *)(a1 + 72);
    double v7 = *(double *)(a1 + 80);
    applejpeg_decode_options_init();
    DecodeSurfaceFromPool = createDecodeSurfaceFromPool(v3, v5, (int)v6 / (1 << v4), (int)v7 / (1 << v4));
    if (DecodeSurfaceFromPool)
    {
      long long v9 = DecodeSurfaceFromPool;
      if (v5 == 875704422)
      {
        IOSurfaceGetBytesPerRowOfPlane(DecodeSurfaceFromPool, 0);
        IOSurfaceGetBytesPerRowOfPlane(v9, 1uLL);
      }
      else
      {
        if (v5 != 1111970369)
        {
          if (gPLTiledLayerTrace)
          {
            uint64_t v12 = (FILE **)MEMORY[0x1E4F143C8];
            fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "createDecodedTileSurface");
            fwrite("Unsupported format", 0x12uLL, 1uLL, *v12);
            goto LABEL_20;
          }
LABEL_21:
          IOSurfaceDecrementUseCount(v9);
          CFRelease(v9);
          return;
        }
        IOSurfaceGetBytesPerRow(DecodeSurfaceFromPool);
      }
      if (!applejpeg_decode_set_options())
      {
        int PlaneCount = IOSurfaceGetPlaneCount(v9);
        IOSurfaceLock(v9, 0, 0);
        if (PlaneCount < 2)
        {
          IOSurfaceGetBaseAddress(v9);
        }
        else
        {
          IOSurfaceGetBaseAddressOfPlane(v9, 0);
          IOSurfaceGetBaseAddressOfPlane(v9, 1uLL);
        }
        int v14 = applejpeg_decode_image_all();
        IOSurfaceUnlock(v9, 0, 0);
        if (!v14 || !gPLTiledLayerTrace)
        {
          if (!v14)
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
            return;
          }
          goto LABEL_21;
        }
        BOOL v15 = (FILE **)MEMORY[0x1E4F143C8];
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "createDecodedTileSurface");
        fprintf(*v15, "ffjpeg_decode_image_all: error: %d");
        goto LABEL_20;
      }
      if (gPLTiledLayerTrace)
      {
        uint64_t v11 = (FILE **)MEMORY[0x1E4F143C8];
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "createDecodedTileSurface");
        fprintf(*v11, "ffjpeg_decode_set_options: error: %d");
LABEL_20:
        fputc(10, (FILE *)*MEMORY[0x1E4F143C8]);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if (gPLTiledLayerTrace)
    {
      long long v10 = (FILE **)MEMORY[0x1E4F143C8];
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "createDecodedTileSurface");
      fwrite("createDecodeSurfaceFromPool failed", 0x22uLL, 1uLL, *v10);
      fputc(10, *v10);
    }
  }
}

uint64_t __74__PLTiledLayer_decodeImageRectangle_forLevel_requestId_completionHandler___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSubLayers:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)runVImageConversionOnSurface:(__IOSurface *)a3 completionHandler:(id)a4
{
  size_t Width = IOSurfaceGetWidth(a3);
  size_t Height = IOSurfaceGetHeight(a3);
  IOSurfaceRef DecodeSurfaceFromPool = createDecodeSurfaceFromPool((uint64_t)self->_surfacePool, self->_conversionPixelFormat, Width, Height);
  if (!DecodeSurfaceFromPool)
  {
    (*((void (**)(id, __IOSurface *))a4 + 2))(a4, a3);
LABEL_12:
    CFRelease(a3);
    return;
  }
  long long v10 = DecodeSurfaceFromPool;
  IOSurfaceLock(a3, 0, 0);
  IOSurfaceLock(v10, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(a3);
  size_t v22 = Height;
  size_t v23 = Width;
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a3);
  BOOL v17 = IOSurfaceGetBaseAddress(v10);
  size_t v18 = Height;
  size_t v19 = Width;
  size_t v20 = IOSurfaceGetBytesPerRow(v10);
  vimageConverter = self->_vimageConverter;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v12 = (uint64_t (*)(vImageConverter *, void **, void **, void, uint64_t))getvImageConvert_AnyToAnySymbolLoc_ptr;
  v33 = getvImageConvert_AnyToAnySymbolLoc_ptr;
  if (!getvImageConvert_AnyToAnySymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __getvImageConvert_AnyToAnySymbolLoc_block_invoke;
    BOOL v28 = &unk_1E63D24C8;
    v29 = &v30;
    uint64_t v13 = AccelerateLibrary();
    v31[3] = (uint64_t)dlsym(v13, "vImageConvert_AnyToAny");
    getvImageConvert_AnyToAnySymbolLoc_ptr = *(_UNKNOWN **)(v29[1] + 24);
    uint64_t v12 = (uint64_t (*)(vImageConverter *, void **, void **, void, uint64_t))v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (v12)
  {
    uint64_t v14 = v12(vimageConverter, &BaseAddress, &v17, 0, 16);
    IOSurfaceUnlock(a3, 0, 0);
    IOSurfaceUnlock(v10, 0, 0);
    if (v14)
    {
      if (gPLTiledLayerTrace)
      {
        BOOL v15 = (FILE **)MEMORY[0x1E4F143C8];
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "-[PLTiledLayer runVImageConversionOnSurface:completionHandler:]");
        fprintf(*v15, "Color conversion failed with error %zd", v14);
        fputc(10, *v15);
      }
      IOSurfaceDecrementUseCount(v10);
      (*((void (**)(id, __IOSurface *))a4 + 2))(a4, a3);
    }
    else
    {
      IOSurfaceDecrementUseCount(a3);
      (*((void (**)(id, __IOSurface *))a4 + 2))(a4, v10);
    }
    CFRelease(v10);
    goto LABEL_12;
  }
  v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "vImage_Error PL_vImageConvert_AnyToAny(const vImageConverterRef, const vImage_Buffer *, const vImage_Buffer *, void *, vImage_Flags)"), @"PLTiledLayer.m", 79, @"%s", dlerror(), v17, v18, v19, v20, BaseAddress, v22, v23, BytesPerRow);
  __break(1u);
}

- (void)runMetalConversionOnSurface:(__IOSurface *)a3 completionHandler:(id)a4
{
  double v7 = (void *)MEMORY[0x1C189F780](self, a2);
  size_t Width = IOSurfaceGetWidth(a3);
  size_t Height = IOSurfaceGetHeight(a3);
  IOSurfaceRef DecodeSurfaceFromPool = createDecodeSurfaceFromPool((uint64_t)self->_surfacePool, self->_conversionPixelFormat, Width, Height);
  if (DecodeSurfaceFromPool)
  {
    IOSurfaceRef v11 = DecodeSurfaceFromPool;
    uint64_t v12 = (void *)[(MTLCommandQueue *)self->_metalCmdQueue commandBuffer];
    if (self->_hasExtendedColorDisplay) {
      uint64_t v13 = 554;
    }
    else {
      uint64_t v13 = 80;
    }
    uint64_t v14 = [(id)getMTLTextureDescriptorClass() texture2DDescriptorWithPixelFormat:80 width:Width height:Height mipmapped:0];
    BOOL v15 = (void *)[(id)getMTLTextureDescriptorClass() texture2DDescriptorWithPixelFormat:v13 width:Width height:Height mipmapped:0];
    [v15 setUsage:6];
    v16 = (void *)[(MTLDevice *)self->_metalDevice newTextureWithDescriptor:v14 iosurface:a3 plane:0];
    BOOL v17 = (void *)[(MTLDevice *)self->_metalDevice newTextureWithDescriptor:v15 iosurface:v11 plane:0];
    [(MPSImageConversion *)self->_metalConverter encodeToCommandBuffer:v12 sourceTexture:v16 destinationTexture:v17];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke;
    v20[3] = &unk_1E63D2368;
    v20[4] = a4;
    v20[5] = v11;
    [v12 addScheduledHandler:v20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke_2;
    v19[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    v19[4] = a3;
    [v12 addCompletedHandler:v19];
    [v12 commit];
    id v18 = v12;
    pl_dispatch_async();
  }
  else
  {
    (*((void (**)(id, __IOSurface *))a4 + 2))(a4, a3);
    CFRelease(a3);
  }
}

void __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

void __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke_2(uint64_t a1)
{
  IOSurfaceDecrementUseCount(*(IOSurfaceRef *)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

void __62__PLTiledLayer_runMetalConversionOnSurface_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) waitUntilScheduled];
  v2 = *(void **)(a1 + 32);
}

- (void)updateSubLayers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(a3);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 visible])
        {
          long long v10 = (void *)[MEMORY[0x1E4F39BE8] layer];
          if (self->_showTileBorders)
          {
            DeviceRGB = CGColorSpaceCreateDeviceRGB();
            uint64_t v12 = CGColorCreate(DeviceRGB, updateSubLayers__orange);
            [v10 setBorderColor:v12];
            CGColorRelease(v12);
            CGColorSpaceRelease(DeviceRGB);
            [v10 setBorderWidth:4.0];
          }
          objc_msgSend(v10, "setContents:", objc_msgSend(v9, "decodedSurface"));
          [v10 setAllowsDisplayCompositing:0];
          [v9 imageRect];
          objc_msgSend(v10, "setFrame:");
          [v10 setHidden:0];
          [(PLTiledLayer *)self addSublayer:v10];
          -[NSMutableDictionary setObject:forKey:](self->_subLayers, "setObject:forKey:", v10, [v9 tileId]);
        }
        else
        {
          uint64_t v13 = (void *)-[NSMutableDictionary objectForKey:](self->_subLayers, "objectForKey:", [v9 tileId]);
          [v13 removeFromSuperlayer];
          [v13 setContents:0];
          -[NSMutableDictionary removeObjectForKey:](self->_subLayers, "removeObjectForKey:", [v9 tileId]);
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)flushCache
{
  [(PLCache *)self->_tileCache removeAllObjects];
  surfacePool = self->_surfacePool;
  FigJPEGIOSurfacePoolFlush((uint64_t)surfacePool);
}

- (CGSize)jpegImageSize
{
  double width = self->_fullSize.width;
  double height = self->_fullSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)dealloc
{
  if (self->_decodeQueue)
  {
    uint64_t v3 = (void *)PLTiledLayerDecodeQueueSpecific;
    if (dispatch_get_specific((const void *)PLTiledLayerDecodeQueueSpecific) != v3) {
      pl_dispatch_sync();
    }
  }
  if (self->_conversionQueue)
  {
    int v4 = (void *)PLTiledLayerConversionQueueSpecific;
    if (dispatch_get_specific((const void *)PLTiledLayerConversionQueueSpecific) != v4) {
      pl_dispatch_sync();
    }
  }

  surfacePool = self->_surfacePool;
  if (surfacePool) {
    CFRelease(surfacePool);
  }
  decodeQueue = self->_decodeQueue;
  if (decodeQueue) {
    dispatch_release(decodeQueue);
  }
  conversionQueue = self->_conversionQueue;
  if (conversionQueue) {
    dispatch_release(conversionQueue);
  }
  if (self->_decoderCount >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      decoders = self->_decoders;
      if (decoders[v8].var0)
      {
        applejpeg_decode_destroy();
        decoders = self->_decoders;
      }
      var1 = decoders[v8].var1;
      if (var1) {
        dispatch_release(var1);
      }
      ++v9;
      ++v8;
    }
    while (v9 < self->_decoderCount);
  }
  free(self->_decoders);
  CGImageRelease(self->_placeholderImage);
  colorspace = self->_colorspace;
  if (colorspace) {
    CFRelease(colorspace);
  }
  vimageConverter = self->_vimageConverter;
  if (vimageConverter) {
    CFRelease(vimageConverter);
  }

  v14.receiver = self;
  v14.super_class = (Class)PLTiledLayer;
  [(PLTiledLayer *)&v14 dealloc];
}

- (PLTiledLayer)initWithJPEGData:(id)a3 placeholderImage:(CGImage *)a4 screenSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v78[1] = *MEMORY[0x1E4F143B8];
  v76.receiver = self;
  v76.super_class = (Class)PLTiledLayer;
  uint64_t v9 = [(PLTiledLayer *)&v76 init];
  if (!v9) {
    return (PLTiledLayer *)v9;
  }
  CFStringRef v10 = (const __CFString *)CFPreferencesCopyAppValue(@"ajtiledlayer_trace", @"com.apple.coremedia");
  if (!v10)
  {
    BOOL v14 = 0;
    goto LABEL_12;
  }
  CFStringRef v11 = v10;
  CFTypeID v12 = CFGetTypeID(v10);
  if (v12 == CFStringGetTypeID())
  {
    BOOL v13 = CFStringGetIntValue(v11) == 0;
  }
  else
  {
    CFTypeID v15 = CFGetTypeID(v11);
    if (v15 != CFNumberGetTypeID())
    {
      CFTypeID v37 = CFGetTypeID(v11);
      BOOL v14 = v37 == CFBooleanGetTypeID() && v11 == (const __CFString *)*MEMORY[0x1E4F1CFD0];
      goto LABEL_11;
    }
    LODWORD(valuePtr[0]) = 0;
    CFNumberGetValue((CFNumberRef)v11, kCFNumberIntType, valuePtr);
    BOOL v13 = LODWORD(valuePtr[0]) == 0;
  }
  BOOL v14 = !v13;
LABEL_11:
  CFRelease(v11);
LABEL_12:
  gPLTiledLayerTrace = v14;
  if (!a3) {
    goto LABEL_102;
  }
  v9[80] = MGGetBoolAnswer();
  *((void *)v9 + 4) = a3;
  if (width * height >= 1000000.0) {
    unsigned int v16 = 512;
  }
  else {
    unsigned int v16 = 256;
  }
  int v17 = gPLTiledLayerTrace;
  id v18 = (FILE **)MEMORY[0x1E4F143D8];
  if (gPLTiledLayerTrace)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "using tile size: %d x %d\n", v16, v16);
    int v17 = gPLTiledLayerTrace;
  }
  *((_DWORD *)v9 + 13) = v16;
  int v19 = (int)width / (int)(v16 >> 1) + 1 + ((int)width / (int)(v16 >> 1) + 1) * ((int)height / (int)(v16 >> 1));
  int v20 = v19 + v19 / 4;
  int v21 = v20 / 10 + v20;
  if (v17) {
    fprintf(*v18, "Maximum number of cached tiles: %d\n", v20 / 10 + v20);
  }
  *((_DWORD *)v9 + 14) = v21;
  LODWORD(valuePtr[0]) = 0;
  CFStringRef v22 = (const __CFString *)CFPreferencesCopyAppValue(@"ajtiledlayer_decoder_count", @"com.apple.coremedia");
  if (!v22)
  {
    uint64_t v25 = v9 + 48;
    *((_DWORD *)v9 + 12) = 0;
LABEL_27:
    LODWORD(v27) = FigThreadGetMaxLogicalCoreCount();
    goto LABEL_28;
  }
  CFStringRef v23 = v22;
  CFTypeID v24 = CFGetTypeID(v22);
  if (v24 == CFStringGetTypeID())
  {
    LODWORD(valuePtr[0]) = CFStringGetIntValue(v23);
  }
  else
  {
    CFTypeID v26 = CFGetTypeID(v23);
    if (v26 == CFNumberGetTypeID()) {
      CFNumberGetValue((CFNumberRef)v23, kCFNumberIntType, valuePtr);
    }
  }
  CFRelease(v23);
  LODWORD(v27) = valuePtr[0];
  uint64_t v25 = v9 + 48;
  *((_DWORD *)v9 + 12) = valuePtr[0];
  id v18 = (FILE **)MEMORY[0x1E4F143D8];
  if ((int)v27 <= 0) {
    goto LABEL_27;
  }
LABEL_28:
  if ((int)v27 <= 1) {
    size_t v27 = 1;
  }
  else {
    size_t v27 = v27;
  }
  *uint64_t v25 = v27;
  *((void *)v9 + 5) = malloc_type_calloc(v27, 0x10uLL, 0xA0040AFF93C70uLL);
  if (gPLTiledLayerTrace) {
    fprintf(*v18, "creating %d decoders\n", *v25);
  }
  *(void *)&valuePtr[0] = 0;
  CFStringRef v28 = (const __CFString *)CFPreferencesCopyAppValue(@"ajtiledlayer_zoomlevel_scale_factor", @"com.apple.coremedia");
  if (v28)
  {
    CFStringRef v29 = v28;
    CFTypeID v30 = CFGetTypeID(v28);
    if (v30 == CFStringGetTypeID())
    {
      *(void *)&valuePtr[0] = CFStringGetDoubleValue(v29);
    }
    else
    {
      CFTypeID v32 = CFGetTypeID(v29);
      if (v32 == CFNumberGetTypeID()) {
        CFNumberGetValue((CFNumberRef)v29, kCFNumberCGFloatType, valuePtr);
      }
    }
    CFRelease(v29);
    double v31 = *(double *)valuePtr;
    id v18 = (FILE **)MEMORY[0x1E4F143D8];
  }
  else
  {
    double v31 = 0.0;
  }
  if (v31 <= 0.0) {
    double v31 = 1.0;
  }
  sZoomLevelScaleFactor = *(void *)&v31;
  if (gPLTiledLayerTrace) {
    fprintf(*v18, "using zoom-level scale factor %f\n", v31);
  }
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v73 = 0;
  memset(valuePtr, 0, sizeof(valuePtr));
  uint64_t v74 = [*((id *)v9 + 4) bytes];
  uint64_t v75 = [*((id *)v9 + 4) length];
  v33 = dispatch_queue_create("com.apple.coremedia.ajtiledecoder", 0);
  *((void *)v9 + 22) = v33;
  dispatch_queue_set_specific(v33, (const void *)PLTiledLayerDecodeQueueSpecific, (void *)PLTiledLayerDecodeQueueSpecific, 0);
  int v34 = dispatch_queue_create("com.apple.coremedia.ajconversionqueue", 0);
  *((void *)v9 + 23) = v34;
  dispatch_queue_set_specific(v34, (const void *)PLTiledLayerConversionQueueSpecific, (void *)PLTiledLayerConversionQueueSpecific, 0);
  pl_dispatch_sync();
  if (!**((void **)v9 + 5))
  {
    if (gPLTiledLayerTrace)
    {
      v36 = (FILE **)MEMORY[0x1E4F143C8];
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "-[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]");
      fwrite("ffjpeg_decode_create failed", 0x1BuLL, 1uLL, *v36);
      goto LABEL_101;
    }
LABEL_102:

    return 0;
  }
  if (applejpeg_decode_open_mem())
  {
    if (gPLTiledLayerTrace)
    {
      int v35 = (FILE **)MEMORY[0x1E4F143C8];
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "-[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]");
      fprintf(*v35, "ffjpeg_decode_open_mem: error: %d");
LABEL_101:
      fputc(10, (FILE *)*MEMORY[0x1E4F143C8]);
      goto LABEL_102;
    }
    goto LABEL_102;
  }
  if (applejpeg_decode_get_image_info())
  {
    if (gPLTiledLayerTrace)
    {
      int v38 = (FILE **)MEMORY[0x1E4F143C8];
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "-[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]");
      fprintf(*v38, "ffjpeg_decode_get_image_info: error: %d");
      goto LABEL_101;
    }
    goto LABEL_102;
  }
  v39.i64[0] = SDWORD2(valuePtr[0]);
  v39.i64[1] = SHIDWORD(valuePtr[0]);
  *((float64x2_t *)v9 + 4) = vcvtq_f64_s64(v39);
  v40 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  *((_DWORD *)v9 + 24) = 875704422;
  v77 = @"kCGImageSourceKeepOriginalProfile";
  v78[0] = *MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v41 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
  uint64_t v42 = CGImageSourceCreateWithData((CFDataRef)a3, v41);
  if (v42)
  {
    v43 = v42;
    ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v42, 0, v41);
    if (ImageAtIndex)
    {
      v45 = ImageAtIndex;
      ColorSpace = CGImageGetColorSpace(ImageAtIndex);
      *((void *)v9 + 11) = CGColorSpaceRetain(ColorSpace);
      CFRelease(v45);
    }
    CFRelease(v43);
  }
  if (!*((void *)v9 + 11))
  {
    int v52 = 0;
    CGRect v48 = (FILE **)MEMORY[0x1E4F143D8];
    long long v51 = (double *)(v9 + 64);
    goto LABEL_72;
  }
  v47 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  CGRect v48 = (FILE **)MEMORY[0x1E4F143D8];
  if (v47 && (CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    if (!v9[80])
    {
      if (gPLTiledLayerTrace) {
        fwrite("Baking in color matching", 0x18uLL, 1uLL, *v48);
      }
      [v9 setupConverterForSourceColorSpace:*((void *)v9 + 11) destinationColorSpace:v47];
      if (*((void *)v9 + 15) || *((void *)v9 + 16))
      {
        *((_DWORD *)v9 + 24) = 1111970369;
        if (v9[80]) {
          int v71 = 1999843442;
        }
        else {
          int v71 = 1111970369;
        }
        *((_DWORD *)v9 + 25) = v71;
        int v52 = 1;
        goto LABEL_69;
      }
    }
    CFPropertyListRef v49 = CGColorSpaceCopyPropertyList(*((CGColorSpaceRef *)v9 + 11));
    if (v49)
    {
      long long v50 = v49;
      long long v51 = (double *)(v9 + 64);
      if (gPLTiledLayerTrace) {
        fwrite("Doing color conversion at render time", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143D8]);
      }
      [v40 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F2F068]];
      CFRelease(v50);
      int v52 = 0;
      CGRect v48 = (FILE **)MEMORY[0x1E4F143D8];
      goto LABEL_70;
    }
  }
  int v52 = 0;
LABEL_69:
  long long v51 = (double *)(v9 + 64);
LABEL_70:
  CGColorSpaceRelease(v47);
LABEL_72:
  double v53 = *v51;
  double v54 = v51[1];
  int v55 = *((_DWORD *)v9 + 13) * *((_DWORD *)v9 + 13);
  if (*((_DWORD *)v9 + 24) == 875704422)
  {
    unsigned int v56 = (3 * v55) >> 1;
    int v57 = (int)v54 * (int)v53;
    int v58 = 3 * v57 / 2;
  }
  else
  {
    unsigned int v56 = 4 * v55;
    int v57 = (int)v54 * (int)v53;
    int v58 = 4 * v57;
  }
  int v59 = v56 * *((_DWORD *)v9 + 14);
  if (v53 < v54) {
    double v53 = v51[1];
  }
  BOOL v60 = v53 >= 4096.0 || v59 < v58;
  char v61 = v60;
  if (v60) {
    BOOL v62 = 1;
  }
  else {
    BOOL v62 = v52;
  }
  if (v52 && (v61 & 1) == 0)
  {
    if (*((_DWORD *)v9 + 25) == 875704422) {
      int v63 = 3 * v57 / 2;
    }
    else {
      int v63 = 4 * v57;
    }
    BOOL v62 = v59 < v63 + v58;
  }
  if (gPLTiledLayerTrace) {
    fprintf(*v48, "shouldTileImage: %d", v62);
  }
  v9[81] = v62;
  if (!v62)
  {
    *((_DWORD *)v9 + 14) = 1;
    double v64 = *v51;
    if (*v51 < v51[1]) {
      double v64 = v51[1];
    }
    *((_DWORD *)v9 + 13) = (int)v64;
  }
  [v40 setObject:&unk_1F1A1C738 forKeyedSubscript:@"HighWaterBytes"];
  [v40 setObject:&unk_1F1A1C738 forKeyedSubscript:@"LowWaterBytes"];
  objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", 2 * *((int *)v9 + 14) + 50), @"HighWaterBufferCount");
  objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", 2 * *((int *)v9 + 14)), @"LowWaterBufferCount");
  if (FigJPEGIOSurfaceImagePoolCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (const __CFDictionary *)v40, (uint64_t *)v9 + 19))
  {
    if (gPLTiledLayerTrace)
    {
      v65 = (FILE **)MEMORY[0x1E4F143C8];
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "-[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]");
      fprintf(*v65, "FigJPEGIOSurfaceImagePoolCreate: error: %d");
      goto LABEL_101;
    }
    goto LABEL_102;
  }
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, (double)SDWORD2(valuePtr[0]), (double)SHIDWORD(valuePtr[0]));
  *((void *)v9 + 18) = [[PLCache alloc] initWithCountLimit:*((int *)v9 + 14) totalCostLimit:0];
  *((void *)v9 + 20) = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
  *((void *)v9 + 21) = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  *((_DWORD *)v9 + 49) = -1;
  *((_DWORD *)v9 + 56) = 0;
  *((void *)v9 + 26) = a4;
  if (a4)
  {
    CGImageRetain(a4);
    v67 = (void *)[MEMORY[0x1E4F39BE8] layer];
    *((void *)v9 + 25) = v67;
    [v67 setContents:*((void *)v9 + 26)];
    [*((id *)v9 + 25) setAllowsDisplayCompositing:0];
    [v9 frame];
    objc_msgSend(*((id *)v9 + 25), "setFrame:");
    [*((id *)v9 + 25) setHidden:0];
    [v9 addSublayer:*((void *)v9 + 25)];
    double v68 = (double)CGImageGetWidth(*((CGImageRef *)v9 + 26));
    objc_msgSend(v9, "zoomStartScaleForImage:placeholderImageSize:", *v51, v51[1], v68, (double)CGImageGetHeight(*((CGImageRef *)v9 + 26)));
    *((void *)v9 + 27) = v69;
  }
  if (gPLTiledLayerTrace) {
    fprintf(*v48, "zoomStartScale: %f\n", *((double *)v9 + 27));
  }
  long long v70 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v9 + 232) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v9 + 248) = v70;
  v9[272] = getShowTilePreferences();
  pl_dispatch_async();
  return (PLTiledLayer *)v9;
}

dispatch_queue_t __61__PLTiledLayer_initWithJPEGData_placeholderImage_screenSize___block_invoke(uint64_t a1)
{
  **(void **)(*(void *)(a1 + 32) + 40) = applejpeg_decode_create();
  dispatch_queue_t result = dispatch_queue_create("com.apple.coremedia.ajdecodesession", 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8) = result;
  return result;
}

uint64_t __61__PLTiledLayer_initWithJPEGData_placeholderImage_screenSize___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareForDecoding];
}

- (void)setupConverterForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4
{
  v81[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1C189F780](self, a2);
  uint64_t v62 = 0;
  uint64_t v63 = (uint64_t)&v62;
  *(void *)double v64 = 0x2020000000;
  uint64_t v8 = (uint64_t (*)(void))getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
  *(void *)&v64[8] = getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
  if (!getMTLCreateSystemDefaultDeviceSymbolLoc_ptr)
  {
    uint64_t v65 = MEMORY[0x1E4F143A8];
    uint64_t v66 = 3221225472;
    uint64_t v67 = (uint64_t)__getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke;
    double v68 = (void (*)(uint64_t, uint64_t))&unk_1E63D24C8;
    uint64_t v69 = (void (*)(uint64_t))&v62;
    uint64_t v9 = MetalLibrary();
    CFStringRef v10 = dlsym(v9, "MTLCreateSystemDefaultDevice");
    *(void *)(*((void *)v69 + 1) + 24) = v10;
    getMTLCreateSystemDefaultDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v69 + 1) + 24);
    uint64_t v8 = *(uint64_t (**)(void))(v63 + 24);
  }
  _Block_object_dispose(&v62, 8);
  if (!v8)
  {
    long long v50 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "id PL_MTLCreateSystemDefaultDevice(void)"), @"PLTiledLayer.m", 72, @"%s", dlerror());
    goto LABEL_40;
  }
  CFStringRef v11 = (MTLDevice *)v8();
  self->_metalDevice = v11;
  if (v11)
  {
    uint64_t v80 = *MEMORY[0x1E4F1DCB0];
    v81[0] = MEMORY[0x1E4F1CC38];
    CGColorConversionInfoRef v12 = CGColorConversionInfoCreateFromList((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1], a3, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, a4, 1, 0, 0);
    if (v12)
    {
      uint64_t v65 = 0;
      uint64_t v66 = (uint64_t)&v65;
      uint64_t v67 = 0x3052000000;
      double v68 = __Block_byref_object_copy__3051;
      uint64_t v69 = __Block_byref_object_dispose__3052;
      BOOL v13 = (objc_class *)getMPSImageConversionClass_softClass;
      uint64_t v70 = getMPSImageConversionClass_softClass;
      if (!getMPSImageConversionClass_softClass)
      {
        uint64_t v62 = MEMORY[0x1E4F143A8];
        uint64_t v63 = 3221225472;
        *(void *)double v64 = __getMPSImageConversionClass_block_invoke;
        *(void *)&v64[8] = &unk_1E63D24C8;
        *(void *)&v64[16] = &v65;
        __getMPSImageConversionClass_block_invoke((uint64_t)&v62);
        BOOL v13 = *(objc_class **)(v66 + 40);
      }
      _Block_object_dispose(&v65, 8);
      self->_metalConverter = (MPSImageConversion *)[[v13 alloc] initWithDevice:self->_metalDevice srcAlpha:1 destAlpha:1 backgroundColor:0 conversionInfo:v12];
      self->_metalCmdQueue = (MTLCommandQueue *)[(MTLDevice *)self->_metalDevice newCommandQueue];
      BOOL v14 = v12;
    }
    metalDevice = self->_metalDevice;
    if (metalDevice && self->_metalConverter && self->_metalCmdQueue) {
      goto LABEL_38;
    }

    self->_metalDevice = 0;
    self->_metalCmdQueue = 0;

    self->_metalConverter = 0;
  }
  uint64_t v62 = 0x2000000008;
  uint64_t v63 = (uint64_t)a3;
  *(_DWORD *)double v64 = 8198;
  memset(&v64[4], 0, 20);
  int v61 = 0;
  v57[0] = 0x2000000008;
  v57[1] = a4;
  int v58 = 8198;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  CFDataRef v16 = CGColorSpaceCopyICCData(a3);
  CFDataRef v17 = CGColorSpaceCopyICCData(a4);
  CFDataRef v18 = v16;
  CFDataRef v19 = v17;
  if (v16)
  {
    if (v17)
    {
      int v20 = (void *)PL_ColorSyncProfileCreate((uint64_t)v16);
      int v21 = (void *)PL_ColorSyncProfileCreate((uint64_t)v17);
      id v22 = v20;
      id v23 = v21;
      if (v20)
      {
        if (v21)
        {
          v78[0] = getkColorSyncProfile();
          v79[0] = v20;
          v78[1] = getkColorSyncRenderingIntent();
          v79[1] = getkColorSyncRenderingIntentPerceptual();
          v78[2] = getkColorSyncTransformTag();
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2020000000;
          CFTypeID v24 = (void *)getkColorSyncTransformDeviceToPCSSymbolLoc_ptr;
          uint64_t v74 = (void *)getkColorSyncTransformDeviceToPCSSymbolLoc_ptr;
          if (!getkColorSyncTransformDeviceToPCSSymbolLoc_ptr)
          {
            uint64_t v65 = MEMORY[0x1E4F143A8];
            uint64_t v66 = 3221225472;
            uint64_t v67 = (uint64_t)__getkColorSyncTransformDeviceToPCSSymbolLoc_block_invoke;
            double v68 = (void (*)(uint64_t, uint64_t))&unk_1E63D24C8;
            uint64_t v69 = (void (*)(uint64_t))&v71;
            uint64_t v25 = ColorSyncLibrary();
            CFTypeID v26 = dlsym(v25, "kColorSyncTransformDeviceToPCS");
            *(void *)(*((void *)v69 + 1) + 24) = v26;
            getkColorSyncTransformDeviceToPCSSymbolLoc_ptr = *(void *)(*((void *)v69 + 1) + 24);
            CFTypeID v24 = (void *)v72[3];
          }
          _Block_object_dispose(&v71, 8);
          if (!v24) {
            goto LABEL_41;
          }
          v79[2] = *v24;
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:3];
          v76[0] = getkColorSyncProfile();
          v77[0] = v21;
          v76[1] = getkColorSyncRenderingIntent();
          v77[1] = getkColorSyncRenderingIntentPerceptual();
          v76[2] = getkColorSyncTransformTag();
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2020000000;
          CFStringRef v28 = (void *)getkColorSyncTransformPCSToDeviceSymbolLoc_ptr;
          uint64_t v74 = (void *)getkColorSyncTransformPCSToDeviceSymbolLoc_ptr;
          if (!getkColorSyncTransformPCSToDeviceSymbolLoc_ptr)
          {
            uint64_t v65 = MEMORY[0x1E4F143A8];
            uint64_t v66 = 3221225472;
            uint64_t v67 = (uint64_t)__getkColorSyncTransformPCSToDeviceSymbolLoc_block_invoke;
            double v68 = (void (*)(uint64_t, uint64_t))&unk_1E63D24C8;
            uint64_t v69 = (void (*)(uint64_t))&v71;
            CFStringRef v29 = ColorSyncLibrary();
            CFTypeID v30 = dlsym(v29, "kColorSyncTransformPCSToDevice");
            *(void *)(*((void *)v69 + 1) + 24) = v30;
            getkColorSyncTransformPCSToDeviceSymbolLoc_ptr = *(void *)(*((void *)v69 + 1) + 24);
            CFStringRef v28 = (void *)v72[3];
          }
          _Block_object_dispose(&v71, 8);
          if (!v28)
          {
            int v52 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getkColorSyncTransformPCSToDevice(void)"), @"PLTiledLayer.m", 87, @"%s", dlerror());
            goto LABEL_40;
          }
          v77[2] = *v28;
          uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:3];
          v75[0] = v27;
          v75[1] = v31;
          uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2020000000;
          v33 = (uint64_t (*)(uint64_t, void))getColorSyncTransformCreateSymbolLoc_ptr;
          uint64_t v74 = getColorSyncTransformCreateSymbolLoc_ptr;
          if (!getColorSyncTransformCreateSymbolLoc_ptr)
          {
            uint64_t v65 = MEMORY[0x1E4F143A8];
            uint64_t v66 = 3221225472;
            uint64_t v67 = (uint64_t)__getColorSyncTransformCreateSymbolLoc_block_invoke;
            double v68 = (void (*)(uint64_t, uint64_t))&unk_1E63D24C8;
            uint64_t v69 = (void (*)(uint64_t))&v71;
            int v34 = ColorSyncLibrary();
            int v35 = dlsym(v34, "ColorSyncTransformCreate");
            *(void *)(*((void *)v69 + 1) + 24) = v35;
            getColorSyncTransformCreateSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v69 + 1) + 24);
            v33 = (uint64_t (*)(uint64_t, void))v72[3];
          }
          _Block_object_dispose(&v71, 8);
          if (!v33)
          {
            double v53 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "ColorSyncTransformRef PL_ColorSyncTransformCreate(CFArrayRef, CFDictionaryRef)"), @"PLTiledLayer.m", 82, @"%s", dlerror());
            goto LABEL_40;
          }
          v36 = (void *)v33(v32, 0);
          id v37 = v36;
          if (v36)
          {
            uint64_t v71 = 0;
            v72 = &v71;
            uint64_t v73 = 0x2020000000;
            int v38 = (uint64_t *)getkColorSyncTransformFullConversionDataSymbolLoc_ptr;
            uint64_t v74 = (void *)getkColorSyncTransformFullConversionDataSymbolLoc_ptr;
            if (!getkColorSyncTransformFullConversionDataSymbolLoc_ptr)
            {
              uint64_t v65 = MEMORY[0x1E4F143A8];
              uint64_t v66 = 3221225472;
              uint64_t v67 = (uint64_t)__getkColorSyncTransformFullConversionDataSymbolLoc_block_invoke;
              double v68 = (void (*)(uint64_t, uint64_t))&unk_1E63D24C8;
              uint64_t v69 = (void (*)(uint64_t))&v71;
              int64x2_t v39 = ColorSyncLibrary();
              v40 = dlsym(v39, "kColorSyncTransformFullConversionData");
              *(void *)(*((void *)v69 + 1) + 24) = v40;
              getkColorSyncTransformFullConversionDataSymbolLoc_ptr = *(void *)(*((void *)v69 + 1) + 24);
              int v38 = (uint64_t *)v72[3];
            }
            _Block_object_dispose(&v71, 8);
            if (!v38)
            {
              double v54 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getkColorSyncTransformFullConversionData(void)"), @"PLTiledLayer.m", 88, @"%s", dlerror());
              goto LABEL_40;
            }
            uint64_t v41 = *v38;
            uint64_t v71 = 0;
            v72 = &v71;
            uint64_t v73 = 0x2020000000;
            uint64_t v42 = (uint64_t (*)(void *, uint64_t, void))getColorSyncTransformCopyPropertySymbolLoc_ptr;
            uint64_t v74 = getColorSyncTransformCopyPropertySymbolLoc_ptr;
            if (!getColorSyncTransformCopyPropertySymbolLoc_ptr)
            {
              uint64_t v65 = MEMORY[0x1E4F143A8];
              uint64_t v66 = 3221225472;
              uint64_t v67 = (uint64_t)__getColorSyncTransformCopyPropertySymbolLoc_block_invoke;
              double v68 = (void (*)(uint64_t, uint64_t))&unk_1E63D24C8;
              uint64_t v69 = (void (*)(uint64_t))&v71;
              v43 = ColorSyncLibrary();
              uint64_t v44 = dlsym(v43, "ColorSyncTransformCopyProperty");
              *(void *)(*((void *)v69 + 1) + 24) = v44;
              getColorSyncTransformCopyPropertySymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v69 + 1) + 24);
              uint64_t v42 = (uint64_t (*)(void *, uint64_t, void))v72[3];
            }
            _Block_object_dispose(&v71, 8);
            if (!v42)
            {
              int v55 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef PL_ColorSyncTransformCopyProperty(ColorSyncTransformRef, CFTypeRef, CFDictionaryRef)"), @"PLTiledLayer.m", 84, @"%s", dlerror());
              goto LABEL_40;
            }
            v45 = (void *)v42(v36, v41, 0);
            id v46 = v45;
            if (v45)
            {
              uint64_t v71 = 0;
              v72 = &v71;
              uint64_t v73 = 0x2020000000;
              v47 = getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_ptr;
              uint64_t v74 = getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_ptr;
              if (!getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_ptr)
              {
                uint64_t v65 = MEMORY[0x1E4F143A8];
                uint64_t v66 = 3221225472;
                uint64_t v67 = (uint64_t)__getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_block_invoke;
                double v68 = (void (*)(uint64_t, uint64_t))&unk_1E63D24C8;
                uint64_t v69 = (void (*)(uint64_t))&v71;
                CGRect v48 = AccelerateLibrary();
                CFPropertyListRef v49 = dlsym(v48, "vImageConverter_CreateWithColorSyncCodeFragment");
                *(void *)(*((void *)v69 + 1) + 24) = v49;
                getvImageConverter_CreateWithColorSyncCodeFragmentSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v69 + 1)
                                                                                               + 24);
                v47 = (void *)v72[3];
              }
              _Block_object_dispose(&v71, 8);
              if (v47)
              {
                self->_vimageConverter = (vImageConverter *)((uint64_t (*)(void *, uint64_t *, void *, void, void, void))v47)(v45, &v62, v57, 0, 0, 0);
                goto LABEL_38;
              }
              unsigned int v56 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "vImageConverterRef PL_vImageConverter_CreateWithColorSyncCodeFragment(CFTypeRef, const vImage_CGImageFormat *, const vImage_CGImageFormat *, const CGFloat *, vImage_Flags, vImage_Error *)"), @"PLTiledLayer.m", 78, @"%s", dlerror());
              while (1)
              {
LABEL_40:
                __break(1u);
LABEL_41:
                long long v51 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getkColorSyncTransformDeviceToPCS(void)"), @"PLTiledLayer.m", 86, @"%s", dlerror());
              }
            }
          }
        }
      }
    }
  }
LABEL_38:
}

- (double)zoomStartScaleForImage:(CGSize)a3 placeholderImageSize:(CGSize)a4
{
  double v4 = a4.width / a3.width;
  double v5 = a4.height / a3.height;
  if (v4 >= v5) {
    double v5 = v4;
  }
  double v6 = 1.0;
  do
  {
    double result = v6;
    double v6 = v6 * 0.5;
  }
  while (v6 > v5);
  return result;
}

- (void)prepareForDecoding
{
  applejpeg_decode_options_init();
  int v3 = applejpeg_decode_build_index_table();
  self->_err = v3;
  if (v3)
  {
    if (gPLTiledLayerTrace)
    {
      double v4 = (FILE **)MEMORY[0x1E4F143C8];
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "-[PLTiledLayer prepareForDecoding]");
      fprintf(*v4, "ffjpeg_decode_build_index_table: error: %d", self->_err);
      fputc(10, *v4);
    }
  }
  else if (self->_decoderCount >= 2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 1;
    do
    {
      self->_decoders[v5 + 1].var0 = (ajdec *)applejpeg_decode_clone_session();
      self->_decoders[v5 + 1].var1 = dispatch_queue_create("com.apple.coremedia.ajdecodesession", 0);
      ++v6;
      ++v5;
    }
    while (v6 < self->_decoderCount);
  }
}

@end