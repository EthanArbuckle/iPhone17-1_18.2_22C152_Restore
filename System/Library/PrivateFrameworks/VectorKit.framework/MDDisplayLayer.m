@interface MDDisplayLayer
- (BOOL)hasRenderTarget;
- (BOOL)insertDisplayLayer:(id)a3;
- (BOOL)isDelayedRenderQueueConsumptionSupported;
- (BOOL)multiSample;
- (BOOL)shouldRasterize;
- (BOOL)supportsFramebufferFetch;
- (CALayer)layer;
- (CGPoint)convertPoint:(CGPoint)a3 toLayer:(id)a4;
- (CGRect)bounds;
- (CGSize)size;
- (CGSize)sizeInPixels;
- (GGLRenderQueueSource)renderSource;
- (MDDisplayLayer)initWithContentScale:(double)a3 useMultisampling:(BOOL)a4 extraColorFormats:(const void *)a5 shouldRasterize:(BOOL)a6 allowBlitToDrawable:(BOOL)a7 taskContext:(const void *)a8 device:(void *)a9 sharedResources:(id)a10 services:(void *)a11 signpostId:(unint64_t)a12;
- (Swapchain)swapchain;
- (__IOSurface)flipImage;
- (const)format;
- (const)linearFormat;
- (double)contentScale;
- (float)averageFPS;
- (id).cxx_construct;
- (id)drawInContext:registry:;
- (intptr_t)drawInContext:registry:;
- (shared_ptr<ggl::BitmapDataBase>)bitmapData;
- (uint64_t)drawInContext:registry:;
- (unint64_t)signpost;
- (void)_didReadPixels:(void *)a3;
- (void)_notifyObserversSizeChanged:(CGSize)a3;
- (void)_prepareTexture:(const void *)a3 isDrawable:(BOOL)a4;
- (void)addSizeObserver:(id)a3;
- (void)blitRenderTarget;
- (void)createRenderTarget;
- (void)dealloc;
- (void)debugConsoleForId:(int)a3;
- (void)destroyRenderTarget;
- (void)didUpdateFrameTexture;
- (void)disablePerformanceHUD:(id)a3;
- (void)drawInContext:(CGContext *)a3 registry:(void *)a4;
- (void)drawInContext:registry:;
- (void)enablePerformanceHUD:(id)a3;
- (void)expandedPerformanceHUD:(id)a3;
- (void)finalRenderTarget;
- (void)linearRenderTarget;
- (void)prepareTargetsForPlatormsWithFramebufferFetch:(const void *)a3;
- (void)prepareTargetsForPlatormsWithoutFramebufferFetch:(const void *)a3 isDrawable:(BOOL)a4;
- (void)prepareTexture:(const void *)a3;
- (void)removeSizeObserver:(id)a3;
- (void)renderer;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentScale:(double)a3;
- (void)setContentsGravity:(id)a3;
- (void)setNeedsDisplayOnBoundsChange:(BOOL)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setRenderSource:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)willPresent;
- (void)willUpdateFrameTexture;
@end

@implementation MDDisplayLayer

- (CGSize)size
{
  double v2 = *((double *)self + 66);
  double v3 = *((double *)self + 67);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)hasRenderTarget
{
  double v2 = [(MDDisplayLayer *)self layer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CALayer)layer
{
  uint64_t v2 = *((void *)self + 1);
  if (v2) {
    return (CALayer *)*(id *)(v2 + 8);
  }
  else {
    return (CALayer *)0;
  }
}

- (double)contentScale
{
  return *((double *)self + 68);
}

- (CGSize)sizeInPixels
{
  double v2 = *((double *)self + 68);
  double v3 = v2 * *((double *)self + 66);
  double v4 = *((double *)self + 67) * v2;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)addSizeObserver:(id)a3
{
}

- (unint64_t)signpost
{
  return *((void *)self + 69);
}

- (void)renderer
{
  return (void *)*((void *)self + 19);
}

- (BOOL)supportsFramebufferFetch
{
  return *((unsigned char *)self + 489);
}

- (void)finalRenderTarget
{
  return (void *)*((void *)self + 29);
}

- (void)prepareTexture:(const void *)a3
{
}

- (void)prepareTargetsForPlatormsWithFramebufferFetch:(const void *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)self + 489))
  {
    double v4 = *(_DWORD **)a3;
    if (*(_DWORD *)(*(void *)a3 + 56) > 1u)
    {
      int v21 = 0;
      int v5 = 0;
    }
    else
    {
      int v5 = v4[20];
      int v21 = v4[21];
    }
    unsigned __int8 v6 = *((unsigned char *)self + 488);
    uint64_t v7 = *((void *)self + 29);
    if (v6)
    {
      *(void *)(v7 + 192) = 0;
      *(void *)(v7 + 200) = 0;
      *(void *)(v7 + 184) = v4;
      uint64_t v8 = *((void *)self + 31);
      if (!v8 || *(_DWORD *)(v8 + 80) != v5 || *(_DWORD *)(v8 + 84) != v21) {
        operator new();
      }
      unsigned __int8 v6 = 0;
      uint64_t v7 = *((void *)self + 29);
      double v4 = (_DWORD *)*((void *)self + 31);
    }
    *(void *)(v7 + 96) = 0;
    *(void *)(v7 + 104) = 0;
    *(void *)(v7 + 88) = v4;
    *(_DWORD *)(v7 + 80) = v4[18];
    unint64_t v9 = *(void *)(v7 + 72);
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    *(void *)(v7 + 72) = v9;
    *(_DWORD *)(v7 + 56) = v4[17];
    if (*((void *)self + 16) >= 2uLL)
    {
      int v10 = 1;
      uint64_t v11 = 1;
      do
      {
        v16 = (uint64_t *)((char *)self + 16 * v11 + 264);
        uint64_t v17 = *v16;
        if (!*v16 || *(_DWORD *)(v17 + 80) != v5 || *(_DWORD *)(v17 + 84) != v21) {
          operator new();
        }
        uint64_t v12 = *((void *)self + 29);
        uint64_t v13 = *v16;
        v14 = (void *)(v12 + 24 * v11);
        v14[12] = 0;
        v14[13] = 0;
        v14[11] = v13;
        *(_DWORD *)(v12 + 80) = *(_DWORD *)(v13 + 72);
        if (*(void *)(v12 + 72) <= (unint64_t)(v11 + 1)) {
          uint64_t v15 = v11 + 1;
        }
        else {
          uint64_t v15 = *(void *)(v12 + 72);
        }
        *(void *)(v12 + 72) = v15;
        *(_DWORD *)(v12 + 4 * v11 + 56) = *(_DWORD *)(v13 + 68);
        uint64_t v11 = ++v10;
      }
      while (*((void *)self + 16) > (unint64_t)v10);
    }
    v18 = (_DWORD *)*((void *)self + 30);
    if (!v18 || v18[20] != v5 || v18[21] != v21) {
      operator new();
    }
    uint64_t v19 = *((void *)self + 29);
    *(void *)(v19 + 288) = 0;
    *(void *)(v19 + 296) = 0;
    *(void *)(v19 + 280) = v18;
    *(_DWORD *)(v19 + 84) = v18[17];
    if (!*(_DWORD *)(v19 + 80)) {
      *(_DWORD *)(v19 + 80) = v18[18];
    }
    if (((*((void *)self + 10) != 0) & v6) == 1)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
      }
      v20 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "!(_activeRenderQueue && didResize)";
        __int16 v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/VectorKit/src/MDDisplayLayer.mm";
        __int16 v26 = 1024;
        int v27 = 489;
        _os_log_impl(&dword_1A1780000, v20, OS_LOG_TYPE_ERROR, "Processing a dropped frame while resizing: Assertion with expression - %s : Failed in file - %s line - %i", buf, 0x1Cu);
      }
    }
  }
}

- (void)blitRenderTarget
{
  return (void *)*((void *)self + 41);
}

- (void)_prepareTexture:(const void *)a3 isDrawable:(BOOL)a4
{
  if (!*((void *)self + 29)) {
    operator new();
  }
  if (*((unsigned char *)self + 489))
  {
    [(MDDisplayLayer *)self prepareTargetsForPlatormsWithFramebufferFetch:a3];
  }
  else
  {
    [(MDDisplayLayer *)self prepareTargetsForPlatormsWithoutFramebufferFetch:a3 isDrawable:a4];
  }
}

- (GGLRenderQueueSource)renderSource
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 7);
  return (GGLRenderQueueSource *)WeakRetained;
}

- (Swapchain)swapchain
{
  return (Swapchain *)*((void *)self + 3);
}

- (void)setRenderSource:(id)a3
{
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = *((double *)self + 66);
  double v9 = *((double *)self + 67);
  *((double *)self + 64) = x;
  *((double *)self + 65) = y;
  *((void *)self + 66) = *(void *)&a3.size.width;
  *((void *)self + 67) = *(void *)&a3.size.height;
  if (v8 != a3.size.width || v9 != a3.size.height)
  {
    -[MDDisplayLayer _notifyObserversSizeChanged:](self, "_notifyObserversSizeChanged:", a3.size.width, a3.size.height);
    double x = *((double *)self + 64);
    double y = *((double *)self + 65);
    double width = *((double *)self + 66);
    double height = *((double *)self + 67);
  }
  id v13 = [(MDDisplayLayer *)self layer];
  objc_msgSend(v13, "setFrame:", x, y, width, height);

  double MidX = CGRectGetMidX(*((CGRect *)self + 16));
  double MidY = CGRectGetMidY(*((CGRect *)self + 16));
  id v14 = [(MDDisplayLayer *)self layer];
  objc_msgSend(v14, "setPosition:", MidX, MidY);
}

- (void)setContentScale:(double)a3
{
  *((double *)self + 68) = a3;
  int v5 = [(MDDisplayLayer *)self layer];
  [v5 setContentsScale:a3];

  v6.n128_u64[0] = *((void *)self + 68);
  v6.n128_f32[0] = v6.n128_f64[0];
  uint64_t v7 = *(void (**)(__n128))(**((void **)self + 19) + 40);
  v7(v6);
}

- (BOOL)insertDisplayLayer:(id)a3
{
  id v4 = a3;
  int v5 = [(MDDisplayLayer *)self layer];

  if (v5)
  {
    __n128 v6 = [v4 sublayers];
    uint64_t v7 = [(MDDisplayLayer *)self layer];
    char v8 = [v6 containsObject:v7];

    if ((v8 & 1) == 0)
    {
      double v9 = [(MDDisplayLayer *)self layer];
      [v4 insertSublayer:v9 atIndex:0];
    }
    char v10 = v8 ^ 1;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)createRenderTarget
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v3 = [(MDDisplayLayer *)self layer];

  if (!v3)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    id v4 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "MDDisplayLayer creating new render layer", buf, 2u);
    }

    long long v5 = 0uLL;
    if (!**((_DWORD **)self + 18))
    {
      __n128 v6 = operator new(0x30uLL);
      v6[1] = 0;
      v6[2] = 0;
      *__n128 v6 = &unk_1EF583820;
      id v7 = objc_alloc_init(MEMORY[0x1E4F39C20]);
      v6[3] = &unk_1EF55AD48;
      v6[4] = v7;
      v6[5] = v7;
      *(void *)&long long v5 = v6 + 3;
      *((void *)&v5 + 1) = v6;
    }
    char v8 = (std::__shared_weak_count *)*((void *)self + 2);
    *(_OWORD *)((char *)self + 8) = v5;
    if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    uint64_t v9 = *((void *)self + 18);
    long long v10 = 0uLL;
    if (!*(_DWORD *)v9)
    {
      uint64_t v11 = *(std::__shared_weak_count **)(v9 + 16);
      int v41 = *(_DWORD *)(*(void *)(v9 + 8) + 60);
      uint64_t v40 = *(void *)(v9 + 8);
      v42 = v11;
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v13 = *((void *)self + 1);
      uint64_t v12 = (std::__shared_weak_count *)*((void *)self + 2);
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v14 = +[VKPlatform sharedPlatform];
      int v36 = [v14 explicitDefaultRefreshRate];

      uint64_t v15 = operator new(0x88uLL);
      v16 = v15;
      v15[1] = 0;
      v15[2] = 0;
      *uint64_t v15 = &unk_1EF583DD0;
      v38 = v15 + 3;
      v15[3] = &unk_1EF55B710;
      v15[4] = v40;
      v15[5] = v11;
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v15[6] = v13;
      v15[7] = v12;
      uint64_t v17 = v13;
      if (v12)
      {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v17 = v15[6];
      }
      v15[8] = 0;
      v15[9] = 0;
      v15[10] = 0;
      *((_DWORD *)v15 + 22) = v41;
      v15[12] = 0;
      v15[13] = 0;
      *((_DWORD *)v15 + 28) = 3;
      v15[15] = 0;
      v15[16] = 0;
      id v39 = *(id *)(v17 + 16);
      v43[0] = @"bounds";
      v37 = [MEMORY[0x1E4F1CA98] null];
      *(void *)buf = v37;
      v43[1] = @"position";
      v18 = [MEMORY[0x1E4F1CA98] null];
      v45 = v18;
      v43[2] = @"contentsScale";
      uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
      v46 = v19;
      v43[3] = @"hidden";
      v20 = [MEMORY[0x1E4F1CA98] null];
      v47 = v20;
      v43[4] = @"contents";
      int v21 = [MEMORY[0x1E4F1CA98] null];
      v48 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v43 count:5];
      [v39 setActions:v22];

      [*(id *)(v16[6] + 16) setOpaque:1];
      [*(id *)(v16[6] + 16) setHidden:0];
      [*(id *)(v16[6] + 16) setContentsGravity:*MEMORY[0x1E4F3A3C0]];
      [*(id *)(v16[6] + 16) setPresentsWithTransaction:1];
      [*(id *)(v16[6] + 16) setFramebufferOnly:0];
      if ((v41 - 1) > 0x2A) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = qword_1A29CAEB8[v41 - 1];
      }
      [*(id *)(v16[6] + 16) setPixelFormat:v23];
      [*(id *)(v16[6] + 16) setFenceEnabled:1];
      __int16 v24 = *(void **)(v16[6] + 16);
      id v25 = *(id *)(v40 + 104);
      [v24 setDevice:v25];

      [*(id *)(v16[6] + 16) setMaximumDrawableCount:3];
      if (v36) {
        [*(id *)(v16[6] + 16) setValue:MEMORY[0x1E4F1CC38] forKey:@"disableProMotionCompatibility"];
      }
      [*(id *)(v13 + 16) contentsScale];
      double v27 = v26;
      [*(id *)(v13 + 16) bounds];
      ggl::MetalSwapchain::resize(v38, (v28 * v27), (v29 * v27));
      v16[15] = 6;
      uint64_t v30 = v16[8];
      uint64_t v31 = v16[9];
      uint64_t v32 = v31 - v30;
      if ((unint64_t)(v31 - v30) > 0x5F)
      {
        if (v32 != 96)
        {
          for (uint64_t i = v30 + 96; v31 != i; v31 -= 16)
          {
            v34 = *(std::__shared_weak_count **)(v31 - 8);
            if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
              std::__shared_weak_count::__release_weak(v34);
            }
          }
          v16[9] = i;
        }
      }
      else
      {
        std::vector<std::shared_ptr<ggl::Data>>::__append((uint64_t)(v16 + 8), 6 - (v32 >> 4));
      }
      if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
      *(void *)&long long v10 = v38;
      if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
        *(void *)&long long v10 = v38;
      }
      *((void *)&v10 + 1) = v16;
    }
    v35 = (std::__shared_weak_count *)*((void *)self + 4);
    *(_OWORD *)((char *)self + 24) = v10;
    if (v35)
    {
      if (!atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }
}

- (void)_notifyObserversSizeChanged:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)self + 73);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (v9) {
          objc_msgSend(v9, "sizeDidChange:", width, height, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (const)format
{
  return (const RenderTargetFormat *)((char *)self + 112);
}

- (MDDisplayLayer)initWithContentScale:(double)a3 useMultisampling:(BOOL)a4 extraColorFormats:(const void *)a5 shouldRasterize:(BOOL)a6 allowBlitToDrawable:(BOOL)a7 taskContext:(const void *)a8 device:(void *)a9 sharedResources:(id)a10 services:(void *)a11 signpostId:(unint64_t)a12
{
  id v50 = a10;
  v63.receiver = self;
  v63.super_class = (Class)MDDisplayLayer;
  v20 = [(MDDisplayLayer *)&v63 init];
  int v21 = v20;
  if (v20)
  {
    *((void *)v20 + 60) = a11;
    *((void *)v20 + 69) = a12;
    *((unsigned char *)v20 + 489) = *(unsigned char *)(*((void *)a9 + 1) + 20);
    *((unsigned char *)v20 + 488) = a4;
    *((unsigned char *)v20 + 505) = a6;
    *((double *)v20 + 68) = a3;
    *((void *)v20 + 18) = a9;
    uint64_t v22 = (*(uint64_t (**)(void, void, void))(**((void **)a9 + 1) + 16))(*((void *)a9 + 1), *(void *)(*(void *)a8 + 16), *((void *)a9 + 3));
    *((void *)v21 + 19) = v22;
    uint64_t v23 = +[VKDebugSettings sharedSettings];
    (*(void (**)(uint64_t, uint64_t))(*(void *)v22 + 32))(v22, [v23 drawPerformanceHUD]);

    *((unsigned char *)v21 + 506) = a7;
    if (*((unsigned char *)v21 + 488)) {
      unsigned int v24 = 4;
    }
    else {
      unsigned int v24 = 1;
    }
    int v25 = *(_DWORD *)(*(void *)(*((void *)v21 + 18) + 8) + 60);
    double v26 = (char *)operator new(4uLL);
    v60 = v26;
    *(_DWORD *)double v26 = v25;
    v61 = v26 + 4;
    v62 = v26 + 4;
    std::vector<ggl::PixelFormat>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ggl::PixelFormat const*>,std::__wrap_iter<ggl::PixelFormat const*>>(&v60, v26 + 4, *(char **)a5, *((char **)a5 + 1), (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 2);
    long long __dst = 0uLL;
    *((void *)&v59 + 1) = v24 | 0x1A00000000;
    unint64_t v27 = v61 - v60;
    *(void *)&long long v59 = (v61 - v60) >> 2;
    if (v61 == v60 || (memcpy(&__dst, v60, v27 & 0xFFFFFFFFFFFFFFFCLL), v27 <= 0xF)) {
      bzero((char *)&__dst + v27, 16 - v27);
    }
    long long v28 = v59;
    *((_OWORD *)v21 + 7) = __dst;
    *((_OWORD *)v21 + 8) = v28;
    if (!*((unsigned char *)v21 + 489))
    {
      int v29 = *(_DWORD *)(*(void *)(*((void *)v21 + 18) + 8) + 56);
      uint64_t v30 = (char *)operator new(4uLL);
      v55 = v30;
      *(_DWORD *)uint64_t v30 = v29;
      v56 = v30 + 4;
      v57 = v30 + 4;
      std::vector<ggl::PixelFormat>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ggl::PixelFormat const*>,std::__wrap_iter<ggl::PixelFormat const*>>(&v55, v30 + 4, *(char **)a5, *((char **)a5 + 1), (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 2);
      uint64_t v31 = v55;
      long long __dst = 0uLL;
      *((void *)&v59 + 1) = v24 | 0x1A00000000;
      unint64_t v32 = v56 - v55;
      *(void *)&long long v59 = (v56 - v55) >> 2;
      if (v56 == v55 || (memcpy(&__dst, v55, v32 & 0xFFFFFFFFFFFFFFFCLL), v32 <= 0xF)) {
        bzero((char *)&__dst + v32, 16 - v32);
      }
      long long v33 = v59;
      *((_OWORD *)v21 + 23) = __dst;
      *((_OWORD *)v21 + 24) = v33;
      if (!*((unsigned char *)v21 + 488))
      {
        *((_DWORD *)v21 + 84) = *(_DWORD *)(*(void *)(*((void *)v21 + 18) + 8) + 60);
        *((_DWORD *)v21 + 85) = 0;
        *((void *)v21 + 43) = 0;
        *((void *)v21 + 44) = 1;
        *((_DWORD *)v21 + 90) = v24;
        *((_DWORD *)v21 + 91) = 0;
      }
      if (v31) {
        operator delete(v31);
      }
    }
    id v34 = v50;
    v35 = v34;
    if (v34) {
      id v36 = v34;
    }
    v37 = (void *)*((void *)v21 + 12);
    *((void *)v21 + 12) = v35;

    objc_initWeak(&location, v21);
    id v38 = **(id **)a8;
    v52[1] = (id)MEMORY[0x1E4F143A8];
    v52[2] = (id)3221225472;
    v52[3] = __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke;
    v52[4] = &unk_1E5A94E08;
    objc_copyWeak(&v53, &location);
    uint64_t v39 = _GEOConfigAddBlockListenerForKey();
    uint64_t v40 = (void *)*((void *)v21 + 70);
    *((void *)v21 + 70) = v39;

    uint64_t v41 = *((void *)v21 + 19);
    uint64_t BOOL = GEOConfigGetBOOL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)v41 + 48))(v41, BOOL);
    id v43 = **(id **)a8;
    v51[1] = (id)MEMORY[0x1E4F143A8];
    v51[2] = (id)3221225472;
    v51[3] = __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke_2;
    v51[4] = &unk_1E5A94E08;
    objc_copyWeak(v52, &location);
    uint64_t v44 = _GEOConfigAddBlockListenerForKey();
    v45 = (void *)*((void *)v21 + 71);
    *((void *)v21 + 71) = v44;

    id v46 = **(id **)a8;
    objc_copyWeak(v51, &location);
    uint64_t v47 = _GEOConfigAddBlockListenerForKey();
    v48 = (void *)*((void *)v21 + 72);
    *((void *)v21 + 72) = v47;

    operator new();
  }

  return 0;
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((void *)self + 11) = &unk_1EF559798;
  *((void *)self + 12) = 0;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((void *)self + 20) = 850045863;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((void *)self + 59) = 0;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 73, 0);
  objc_storeStrong((id *)self + 72, 0);
  objc_storeStrong((id *)self + 71, 0);
  objc_storeStrong((id *)self + 70, 0);
  uint64_t v3 = *((void *)self + 59);
  *((void *)self + 59) = 0;
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 8);
    *(void *)(v3 + 8) = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    id v5 = *(ggl::RenderQueue **)v3;
    *(void *)uint64_t v3 = 0;
    if (v5)
    {
      ggl::RenderQueue::~RenderQueue(v5);
      MEMORY[0x1A6239270]();
    }
    MEMORY[0x1A6239270](v3, 0x20C40A4A59CD2);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)self + 58);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    uint64_t v7 = (std::__shared_weak_count *)*((void *)self + 56);
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = (std::__shared_weak_count *)*((void *)self + 56);
    if (!v7) {
      goto LABEL_13;
    }
  }
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
LABEL_13:
  uint64_t v8 = (std::__shared_weak_count *)*((void *)self + 54);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    uint64_t v9 = (std::__shared_weak_count *)*((void *)self + 52);
    if (!v9) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v9 = (std::__shared_weak_count *)*((void *)self + 52);
    if (!v9) {
      goto LABEL_19;
    }
  }
  if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_19:
  uint64_t v10 = *((void *)self + 50);
  *((void *)self + 50) = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  uint64_t v11 = *((void *)self + 41);
  *((void *)self + 41) = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  long long v12 = (std::__shared_weak_count *)*((void *)self + 40);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    long long v13 = (std::__shared_weak_count *)*((void *)self + 38);
    if (!v13) {
      goto LABEL_29;
    }
  }
  else
  {
    long long v13 = (std::__shared_weak_count *)*((void *)self + 38);
    if (!v13) {
      goto LABEL_29;
    }
  }
  if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
LABEL_29:
  id v14 = (std::__shared_weak_count *)*((void *)self + 36);
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    uint64_t v15 = (std::__shared_weak_count *)*((void *)self + 34);
    if (!v15) {
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v15 = (std::__shared_weak_count *)*((void *)self + 34);
    if (!v15) {
      goto LABEL_35;
    }
  }
  if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
LABEL_35:
  v16 = (std::__shared_weak_count *)*((void *)self + 32);
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  uint64_t v17 = *((void *)self + 30);
  *((void *)self + 30) = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  uint64_t v18 = *((void *)self + 29);
  *((void *)self + 29) = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  uint64_t v19 = (md::DebugConsoleManager *)*((void *)self + 28);
  *((void *)self + 28) = 0;
  if (v19)
  {
    md::DebugConsoleManager::~DebugConsoleManager(v19);
    MEMORY[0x1A6239270]();
  }
  std::mutex::~mutex((std::mutex *)((char *)self + 160));
  *((void *)self + 11) = &unk_1EF559798;

  v20 = (std::__shared_weak_count *)*((void *)self + 9);
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  objc_destroyWeak((id *)self + 7);
  int v21 = (std::__shared_weak_count *)*((void *)self + 6);
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
    uint64_t v22 = (std::__shared_weak_count *)*((void *)self + 4);
    if (!v22) {
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v22 = (std::__shared_weak_count *)*((void *)self + 4);
    if (!v22) {
      goto LABEL_53;
    }
  }
  if (!atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
LABEL_53:
  uint64_t v23 = (std::__shared_weak_count *)*((void *)self + 2);
  if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
}

- (BOOL)shouldRasterize
{
  return *((unsigned char *)self + 505);
}

- (BOOL)multiSample
{
  return *((unsigned char *)self + 488);
}

- (__IOSurface)flipImage
{
  return 0;
}

- (void)debugConsoleForId:(int)a3
{
  id v5 = (std::mutex *)((char *)self + 160);
  std::mutex::lock((std::mutex *)((char *)self + 160));
  uint64_t v6 = *((void *)self + 28);
  if (!v6) {
    operator new();
  }
  uint64_t v7 = (void *)md::DebugConsoleManager::console(v6, a3);
  std::mutex::unlock(v5);
  return v7;
}

- (CGPoint)convertPoint:(CGPoint)a3 toLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(MDDisplayLayer *)self layer];
  objc_msgSend(v8, "convertPoint:toLayer:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (float)averageFPS
{
  (*(void (**)(void))(**((void **)self + 19) + 56))();
  return result;
}

- (void)destroyRenderTarget
{
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  uint64_t v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "MDDisplayLayer destroying render layer", v7, 2u);
  }

  uint64_t v4 = (std::__shared_weak_count *)*((void *)self + 4);
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  id v5 = [(MDDisplayLayer *)self layer];
  [v5 removeFromSuperlayer];

  uint64_t v6 = (std::__shared_weak_count *)*((void *)self + 2);
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)linearRenderTarget
{
  return (void *)*((void *)self + 50);
}

- (const)linearFormat
{
  return (const RenderTargetFormat *)((char *)self + 368);
}

- (CGRect)bounds
{
  double v2 = *((double *)self + 64);
  double v3 = *((double *)self + 65);
  double v4 = *((double *)self + 66);
  double v5 = *((double *)self + 67);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  *((void *)self + 66) = *(void *)&a3.width;
  *((void *)self + 67) = *(void *)&a3.height;
  -[MDDisplayLayer setBounds:](self, "setBounds:", *((double *)self + 64), *((double *)self + 65), a3.width, a3.height);
}

- (shared_ptr<ggl::BitmapDataBase>)bitmapData
{
  double v4 = v2;
  [(MDDisplayLayer *)self multiSample];
  [(MDDisplayLayer *)self finalRenderTarget];
  double v5 = (BitmapDataBase *)(*(void *(**)(long long *__return_ptr))(**((void **)self + 19) + 24))(&v7);
  *double v4 = v7;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)_didReadPixels:(void *)a3
{
  if (*((void *)self + 62))
  {
    double v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    uint64_t v6 = (const void *)(*(uint64_t (**)(void))(**(void **)a3 + 16))();
    long long v7 = CGDataProviderCreateWithData(0, v6, 4 * *(void *)(*(void *)a3 + 24) * *(void *)(*(void *)a3 + 32), 0);
    uint64_t v8 = CGImageCreate(*(void *)(*(void *)a3 + 24), *(void *)(*(void *)a3 + 32), 8uLL, 0x20uLL, 4 * *(void *)(*(void *)a3 + 24), v5, 0x4001u, v7, 0, 0, kCGRenderingIntentDefault);
    CGContextSaveGState(*((CGContextRef *)self + 62));
    CGContextSetBlendMode(*((CGContextRef *)self + 62), kCGBlendModeCopy);
    v10.origin.double x = *((CGFloat *)self + 64);
    v10.origin.double y = *((CGFloat *)self + 65);
    v10.size.double width = *((CGFloat *)self + 66);
    v10.size.double height = *((CGFloat *)self + 67);
    CGContextDrawImage(*((CGContextRef *)self + 62), v10, v8);
    CGContextRestoreGState(*((CGContextRef *)self + 62));
    CGColorSpaceRelease(v5);
    CGImageRelease(v8);
    CGDataProviderRelease(v7);
  }
}

- (void)drawInContext:(CGContext *)a3 registry:(void *)a4
{
  if (a3)
  {
    uint64_t v6 = (CGContext *)*((void *)self + 62);
    if (v6) {
      CGContextRelease(v6);
    }
    *((void *)self + 62) = CGContextRetain(a3);
    long long v7 = [(MDDisplayLayer *)self layer];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;

    double v12 = [(MDDisplayLayer *)self layer];
    [v12 contentsScale];
    double v14 = v13;

    double v15 = v14 * v11;
    if (v14 * v9 >= 1.0 && v15 >= 1.0) {
      operator new();
    }
    CGContextRelease(*((CGContextRef *)self + 62));
    *((void *)self + 62) = 0;
  }
}

- (intptr_t)drawInContext:registry:
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 8));
}

- (void)drawInContext:registry:
{
  JUMPOUT(0x1A6239270);
}

- (id)drawInContext:registry:
{
  double v3 = *(void **)(a1 + 8);
  *a2 = &unk_1EF56C5A0;
  id result = v3;
  a2[1] = result;
  return result;
}

- (uint64_t)drawInContext:registry:
{
  return a1;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  id v4 = [(MDDisplayLayer *)self layer];
  [v4 setBackgroundColor:a3];
}

- (void)setContentsGravity:(id)a3
{
  id v5 = a3;
  id v4 = [(MDDisplayLayer *)self layer];
  [v4 setContentsGravity:v5];
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MDDisplayLayer *)self layer];
  [v4 setOpaque:v3];
}

- (void)setNeedsDisplayOnBoundsChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MDDisplayLayer *)self layer];
  [v4 setNeedsDisplayOnBoundsChange:v3];
}

- (void)expandedPerformanceHUD:(id)a3
{
  id v5 = [a3 name];
  int v3 = [v5 isEqualToString:@"VKExtendedPeformanceHUD"];
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  if (v3) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 1u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 2u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 3u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 4u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 5u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 6u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 7u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 8u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x13u, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x14u, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 9u, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xAu, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xBu, 2);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xCu, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xDu, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xEu, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0xFu, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x10u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x11u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x12u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x15u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x16u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x17u, v4);
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  ggl::Performance::Counters::setDisplayMode(ggl::Performance::Counters::instance(void)::counters, 0x18u, v4);
}

- (void)disablePerformanceHUD:(id)a3
{
}

- (void)enablePerformanceHUD:(id)a3
{
}

- (void)willPresent
{
  if (GEOGetVectorKitPerformanceLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitPerformanceLog_onceToken, &__block_literal_global_17);
  }
  int v3 = (id)GEOGetVectorKitPerformanceLog_log;
  int v4 = v3;
  os_signpost_id_t v5 = *((void *)self + 69);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Present", "", v6, 2u);
  }
}

- (void)didUpdateFrameTexture
{
  if (GEOGetVectorKitPerformanceLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitPerformanceLog_onceToken, &__block_literal_global_17);
  }
  int v3 = (id)GEOGetVectorKitPerformanceLog_log;
  int v4 = v3;
  os_signpost_id_t v5 = *((void *)self + 69);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v4, OS_SIGNPOST_INTERVAL_END, v5, "UpdateFrameTexture", "", v6, 2u);
  }
}

- (void)willUpdateFrameTexture
{
  if (GEOGetVectorKitPerformanceLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitPerformanceLog_onceToken, &__block_literal_global_17);
  }
  int v3 = (id)GEOGetVectorKitPerformanceLog_log;
  int v4 = v3;
  os_signpost_id_t v5 = *((void *)self + 69);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "UpdateFrameTexture", "", v6, 2u);
  }
}

- (BOOL)isDelayedRenderQueueConsumptionSupported
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 7);
  char v3 = [WeakRetained isDelayedRenderQueueConsumptionSupported];

  return v3;
}

- (void)prepareTargetsForPlatormsWithoutFramebufferFetch:(const void *)a3 isDrawable:(BOOL)a4
{
  if (*((unsigned char *)self + 489)) {
    return;
  }
  uint64_t v6 = *(void *)a3;
  if (*(_DWORD *)(*(void *)a3 + 56) > 1u)
  {
    uint64_t v41 = 0;
    if (!*((void *)self + 50)) {
      goto LABEL_7;
    }
  }
  else
  {
    LODWORD(v41) = *(_DWORD *)(v6 + 84);
    HIDWORD(v41) = *(_DWORD *)(v6 + 80);
    if (!*((void *)self + 50)) {
LABEL_7:
    }
      operator new();
  }
  if (*((unsigned char *)self + 506) && !*((unsigned char *)self + 488) && a4)
  {
    if (!*((void *)self + 41)) {
      operator new();
    }
    int v7 = 1;
  }
  else
  {
    uint64_t v8 = *((void *)self + 59);
    *((void *)self + 59) = 0;
    if (v8)
    {
      uint64_t v9 = *(void *)(v8 + 8);
      *(void *)(v8 + 8) = 0;
      if (v9) {
        (*(void (**)(uint64_t, SEL))(*(void *)v9 + 8))(v9, a2);
      }
      double v10 = *(ggl::RenderQueue **)v8;
      *(void *)uint64_t v8 = 0;
      if (v10)
      {
        ggl::RenderQueue::~RenderQueue(v10);
        MEMORY[0x1A6239270]();
      }
      MEMORY[0x1A6239270](v8, 0x20C40A4A59CD2);
    }
    uint64_t v11 = *((void *)self + 41);
    *((void *)self + 41) = 0;
    if (!v11)
    {
      if (!*((unsigned char *)self + 488))
      {
LABEL_43:
        uint64_t v26 = *(void *)a3;
        int v25 = (std::__shared_weak_count *)*((void *)a3 + 1);
        if (v25) {
          atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v42 = v26;
        id v43 = v25;
        uint64_t v19 = (_DWORD *)*((void *)self + 30);
        if (v19) {
          goto LABEL_41;
        }
        goto LABEL_46;
      }
LABEL_33:
      v20 = (void *)*((void *)self + 29);
      uint64_t v21 = *(void *)a3;
      if (v20[23] != *(void *)a3)
      {
        v20[24] = 0;
        v20[25] = 0;
        v20[23] = v21;
      }
      uint64_t v22 = *((void *)self + 31);
      if (!v22 || __PAIR64__(*(_DWORD *)(v22 + 80), *(_DWORD *)(v22 + 84)) != v41) {
        operator new();
      }
      uint64_t v24 = *((void *)self + 31);
      uint64_t v23 = (std::__shared_weak_count *)*((void *)self + 32);
      if (v23) {
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v42 = v24;
      id v43 = v23;
      uint64_t v19 = (_DWORD *)*((void *)self + 30);
      if (v19) {
        goto LABEL_41;
      }
LABEL_46:
      operator new();
    }
    int v7 = 0;
    (*(void (**)(uint64_t, SEL))(*(void *)v11 + 8))(v11, a2);
  }
  if (*((unsigned char *)self + 488)) {
    goto LABEL_33;
  }
  if (!v7) {
    goto LABEL_43;
  }
  uint64_t v12 = *((void *)self + 33);
  if (!v12 || __PAIR64__(*(_DWORD *)(v12 + 80), *(_DWORD *)(v12 + 84)) != v41)
  {
    double v13 = (char *)operator new(0x58uLL);
    *((void *)v13 + 1) = 0;
    *((void *)v13 + 2) = 0;
    *(void *)double v13 = &unk_1EF583858;
    *((void *)v13 + 5) = 0;
    *((void *)v13 + 6) = 0;
    *((_DWORD *)v13 + 14) = 0;
    *((void *)v13 + 3) = &unk_1EF55AE58;
    *((void *)v13 + 4) = 0;
    *(void *)&long long v14 = 0x100000001;
    *((void *)&v14 + 1) = 0x100000001;
    *(_OWORD *)(v13 + 60) = v14;
    *(void *)(v13 + 76) = 0x100000001;
    *((_DWORD *)v13 + 21) = 0;
    operator new();
  }
  double v15 = (std::__shared_weak_count *)*((void *)self + 34);
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v42 = v12;
  id v43 = v15;
  uint64_t v16 = *((void *)self + 41);
  uint64_t v17 = *(void *)a3;
  *(void *)(v16 + 96) = 0;
  *(void *)(v16 + 104) = 0;
  *(void *)(v16 + 88) = v17;
  *(_DWORD *)(v16 + 80) = *(_DWORD *)(v17 + 72);
  unint64_t v18 = *(void *)(v16 + 72);
  if (v18 <= 1) {
    unint64_t v18 = 1;
  }
  *(void *)(v16 + 72) = v18;
  *(_DWORD *)(v16 + 56) = *(_DWORD *)(v17 + 68);
  uint64_t v19 = (_DWORD *)*((void *)self + 30);
  if (!v19) {
    goto LABEL_46;
  }
LABEL_41:
  if (__PAIR64__(v19[20], v19[21]) != v41) {
    goto LABEL_46;
  }
  uint64_t v27 = *((void *)self + 29);
  *(void *)(v27 + 288) = 0;
  *(void *)(v27 + 296) = 0;
  *(void *)(v27 + 280) = v19;
  *(_DWORD *)(v27 + 84) = v19[17];
  if (!*(_DWORD *)(v27 + 80)) {
    *(_DWORD *)(v27 + 80) = v19[18];
  }
  uint64_t v28 = *((void *)self + 50);
  uint64_t v29 = *((void *)self + 30);
  *(void *)(v28 + 288) = 0;
  *(void *)(v28 + 296) = 0;
  *(void *)(v28 + 280) = v29;
  *(_DWORD *)(v28 + 84) = *(_DWORD *)(v29 + 68);
  if (!*(_DWORD *)(v28 + 80)) {
    *(_DWORD *)(v28 + 80) = *(_DWORD *)(v29 + 72);
  }
  uint64_t v30 = *((void *)self + 29);
  *(void *)(v30 + 96) = 0;
  *(void *)(v30 + 104) = 0;
  *(void *)(v30 + 88) = v42;
  *(_DWORD *)(v30 + 80) = *(_DWORD *)(v42 + 72);
  unint64_t v31 = *(void *)(v30 + 72);
  if (v31 <= 1) {
    unint64_t v31 = 1;
  }
  *(void *)(v30 + 72) = v31;
  *(_DWORD *)(v30 + 56) = *(_DWORD *)(v42 + 68);
  uint64_t v32 = *(void *)(*((void *)self + 50) + 88);
  if (!v32 || *(void *)(v32 + 88) != v42) {
    operator new();
  }
  unint64_t v33 = *((void *)self + 16);
  if (v33 >= 2)
  {
    id v34 = (char *)self + 280;
    uint64_t v35 = 1;
    int v36 = 1;
    do
    {
      uint64_t v37 = *(void *)&v34[16 * v35 - 16];
      if (!v37 || __PAIR64__(*(_DWORD *)(v37 + 80), *(_DWORD *)(v37 + 84)) != v41) {
        operator new();
      }
      uint64_t v35 = ++v36;
    }
    while (v33 > v36);
    int v38 = 1;
    uint64_t v39 = 1;
    do
    {
      uint64_t v40 = *(void *)(*((void *)self + 50) + 24 * v39 + 88);
      if (!v40 || *(void *)(v40 + 88) != *(void *)&v34[16 * v39 - 16]) {
        operator new();
      }
      uint64_t v39 = ++v38;
    }
    while (v33 > v38);
  }
  if (v43)
  {
    if (!atomic_fetch_add(&v43->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
}

- (void)dealloc
{
  char v3 = dispatch_get_global_queue(0, 0);
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  uint64_t v4 = *((void *)self + 19);
  *((void *)self + 19) = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__35668;
  v11[4] = __Block_byref_object_dispose__35669;
  id v12 = *((id *)self + 12);
  os_signpost_id_t v5 = (md::DebugConsoleManager *)*((void *)self + 28);
  *((void *)self + 28) = 0;
  if (v5)
  {
    md::DebugConsoleManager::~DebugConsoleManager(v5);
    MEMORY[0x1A6239270]();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MDDisplayLayer_dealloc__block_invoke;
  block[3] = &unk_1E5A94E50;
  block[4] = v11;
  block[5] = v4;
  dispatch_async(v3, block);
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  int v7 = (const void *)*((void *)self + 62);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = [(MDDisplayLayer *)self layer];
  [v8 removeFromSuperlayer];

  _Block_object_dispose(v11, 8);
  v9.receiver = self;
  v9.super_class = (Class)MDDisplayLayer;
  [(MDDisplayLayer *)&v9 dealloc];
}

void __25__MDDisplayLayer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)removeSizeObserver:(id)a3
{
}

void __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = WeakRetained[19];
    uint64_t BOOL = GEOConfigGetBOOL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)v1 + 48))(v1, BOOL);
  }
}

void __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (ggl::MetalRenderer *)WeakRetained[19];
    if (!*(_DWORD *)(*((void *)v2 + 1) + 96))
    {
      uint64_t v4 = WeakRetained;
      int BOOL = GEOConfigGetBOOL();
      ggl::MetalRenderer::enableCommandQueueResetOnError(v2, BOOL);
      id WeakRetained = v4;
    }
  }
}

void __165__MDDisplayLayer_initWithContentScale_useMultisampling_extraColorFormats_shouldRasterize_allowBlitToDrawable_taskContext_device_sharedResources_services_signpostId___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (ggl::MetalRenderer *)WeakRetained[19];
    if (!*(_DWORD *)(*((void *)v2 + 1) + 96))
    {
      uint64_t v4 = WeakRetained;
      int UInteger = GEOConfigGetUInteger();
      ggl::MetalRenderer::setCommandQueueResetAttempts(v2, UInteger);
      id WeakRetained = v4;
    }
  }
}

@end