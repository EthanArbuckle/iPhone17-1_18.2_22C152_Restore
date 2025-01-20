@interface VKOverlay
- ($47F18235E17FF75F5C17F39635350F8F)replaceMapContentInRect;
- (BOOL)areResourcesRequired;
- (BOOL)canDrawKey:(id *)a3;
- (BOOL)canDrawKey:(id *)a3 withData:(id)a4;
- (BOOL)canPossiblyDrawKey:(id *)a3;
- (BOOL)canProvideVectorData;
- (BOOL)forceRasterizationForGlobe;
- (BOOL)shouldUseMetalTexture;
- (RunLoopController)runLoopController;
- (VKOverlay)init;
- (VKOverlayDelegate)delegate;
- (id).cxx_construct;
- (id)customTileProvider;
- (id)rasterTileProvider;
- (id)vectorData;
- (int64_t)blendMode;
- (shared_ptr<md::RasterTileOverlayStyle>)customStyle;
- (shared_ptr<md::RasterTileOverlayStyle>)rasterStyle;
- (unint64_t)estimatedCostForCustomTileData:(id)a3;
- (unint64_t)fallbackable;
- (unint64_t)level;
- (unsigned)anisotropy;
- (unsigned)identifier;
- (void)_updateCustomTileProvider;
- (void)_updateRasterTileProvider;
- (void)_updateVectorData;
- (void)clearDelegate;
- (void)customTileOverlayDidChangeAlpha:(id)a3;
- (void)customTileOverlayDidChangeDisplayRate:(id)a3;
- (void)customTileOverlayNeedsDisplay:(id)a3;
- (void)customTileOverlayNeedsInvalidate:(id)a3;
- (void)dealloc;
- (void)didEnterKey:(id *)a3 withFallback:(BOOL)a4;
- (void)didExitKey:(id *)a3;
- (void)drawKey:(id *)a3 inContext:(CGContext *)a4;
- (void)drawKey:(id *)a3 withData:(id)a4 inIOSurface:(__IOSurface *)a5 withTimestamp:(double)a6;
- (void)drawKey:(id *)a3 withData:(id)a4 inIOSurface:(__IOSurface *)a5 withTimestamp:(double)a6 withTileScale:(float)a7;
- (void)drawKey:(id *)a3 withData:(id)a4 inTexture:(id)a5 withTimestamp:(double)a6 withTileScale:(float)a7;
- (void)onVisibleTiles:(id)a3;
- (void)rasterTileOverlayDidChangeAlpha:(id)a3;
- (void)rasterTileOverlayNeedsDisplay:(id)a3;
- (void)rasterTileOverlayNeedsInvalidate:(id)a3;
- (void)setBlendMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFallbackable:(unint64_t)a3;
- (void)setFlyoverContainer:(weak_ptr<md::GlobeOverlayContainer>)a3;
- (void)setForceRasterizationForGlobe:(BOOL)a3;
- (void)setLevel:(unint64_t)a3;
- (void)setNeedsDisplayForReason:(unint64_t)a3;
- (void)setNeedsDisplayInRect:(id *)a3 level:(int64_t)a4 reason:(unint64_t)a5;
- (void)setReplaceMapContentInRect:(id)a3;
- (void)setRunLoopController:(RunLoopController *)a3;
- (void)setStandardContainer:(weak_ptr<md::OverlayContainer>)a3;
- (void)vectorOverlayNeedsDisplay:(id)a3 needsFullInvalidate:(BOOL)a4;
- (weak_ptr<md::GlobeOverlayContainer>)flyoverContainer;
- (weak_ptr<md::OverlayContainer>)standardContainer;
@end

@implementation VKOverlay

- (id).cxx_construct
{
  *((_DWORD *)self + 32) = 0;
  *((_DWORD *)self + 36) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((_DWORD *)self + 44) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_customStyle.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_customTileProvider, 0);
  v4 = self->_rasterStyle.__cntrl_;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_rasterTileProvider, 0);
  objc_storeStrong((id *)&self->_vectorData, 0);
  v5 = self->_standardContainer.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  v6 = self->_flyoverContainer.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)forceRasterizationForGlobe
{
  return self->_forceRasterizationForGlobe;
}

- (int64_t)blendMode
{
  return self->_blendMode;
}

- (shared_ptr<md::RasterTileOverlayStyle>)customStyle
{
  cntrl = self->_customStyle.__cntrl_;
  *v2 = self->_customStyle.__ptr_;
  v2[1] = (RasterTileOverlayStyle *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (RasterTileOverlayStyle *)self;
  return result;
}

- (shared_ptr<md::RasterTileOverlayStyle>)rasterStyle
{
  cntrl = self->_rasterStyle.__cntrl_;
  *v2 = self->_rasterStyle.__ptr_;
  v2[1] = (RasterTileOverlayStyle *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (RasterTileOverlayStyle *)self;
  return result;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (RunLoopController)runLoopController
{
  return self->_runLoopController;
}

- (void)setFallbackable:(unint64_t)a3
{
  self->_fallbackable = a3;
}

- (unint64_t)fallbackable
{
  return self->_fallbackable;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setReplaceMapContentInRect:(id)a3
{
  self->_replaceMapContentInRect = ($CD0F68918BFFAFA9094E1732C32F8ECF)a3;
}

- ($47F18235E17FF75F5C17F39635350F8F)replaceMapContentInRect
{
  double x = self->_replaceMapContentInRect.origin.x;
  double y = self->_replaceMapContentInRect.origin.y;
  double width = self->_replaceMapContentInRect.size.width;
  double height = self->_replaceMapContentInRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (BOOL)canProvideVectorData
{
  return self->_canProvideVectorData;
}

- (void)customTileOverlayDidChangeDisplayRate:(id)a3
{
  v18 = (VKCustomTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&self->_customTileProviderLock._lock);
  if (self->_customTileProvider == v18 && self->_runLoopController)
  {
    uint64_t v4 = [(VKCustomTileOverlayProviderData *)v18 desiredDisplayRate];
    if (v4
      || [(VKCustomTileOverlayProviderData *)v18 forceContinuousLayout]
      || [(VKCustomTileOverlayProviderData *)v18 forceNativeDisplayRate])
    {
      BOOL v5 = [(VKCustomTileOverlayProviderData *)v18 forceNativeDisplayRate];
      uint64_t v6 = 60;
      if ((unint64_t)(v4 - 20) < 0xA) {
        uint64_t v6 = 20;
      }
      if ((unint64_t)(v4 - 15) >= 5) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 15;
      }
      if ((unint64_t)(v4 - 5) >= 0xA) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 5;
      }
      if ((unint64_t)(v4 - 1) >= 4) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 1;
      }
      if (v5) {
        unint64_t v10 = -1;
      }
      else {
        unint64_t v10 = v9;
      }
      runLoopController = (uint64_t *)self->_runLoopController;
      unint64_t v12 = runLoopController[1];
      BOOL v13 = [(VKCustomTileOverlayProviderData *)v18 forceNativeDisplayRate];
      uint64_t v14 = *runLoopController;
      if (*runLoopController)
      {
        unint64_t v15 = v12 >= v10 ? v10 : v12;
        uint64_t v16 = v12 == -1 ? v10 : v15;
        *(void *)(v14 + 1168) = v16;
        *(unsigned char *)(v14 + 1242) = v13;
        runLoopController[1] = v16;
        if (!**(unsigned char **)(v14 + 1056)) {
          md::MapEngine::setDisplayRate(v14, v16);
        }
      }
      md::RunLoopController::setNeedsLayoutContinously((md::RunLoopController *)self->_runLoopController->var0, 1);
      var0 = self->_runLoopController->var0;
      if (var0)
      {
        char v19 = 1;
        md::MapEngine::setNeedsTick((uint64_t)var0, &v19);
      }
    }
    else
    {
      md::RunLoopController::setNeedsLayoutContinously((md::RunLoopController *)self->_runLoopController->var0, 0);
    }
  }
  os_unfair_lock_unlock(&self->_customTileProviderLock._lock);
}

- (void)customTileOverlayNeedsInvalidate:(id)a3
{
  id v8 = a3;
  p_standardContainer = (md::OverlayContainer **)&self->_standardContainer;
  cntrl = self->_standardContainer.__cntrl_;
  if (!cntrl)
  {
    *p_standardContainer = 0;
    self->_standardContainer.__cntrl_ = 0;
    goto LABEL_11;
  }
  uint64_t v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (v6 && *p_standardContainer)
  {
    md::OverlayContainer::invalidate(*p_standardContainer, self, 1, 0);
LABEL_8:
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    goto LABEL_11;
  }
  uint64_t v7 = self->_standardContainer.__cntrl_;
  *p_standardContainer = 0;
  self->_standardContainer.__cntrl_ = 0;
  if (v7) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  }
  if (v6) {
    goto LABEL_8;
  }
LABEL_11:
}

- (void)customTileOverlayDidChangeAlpha:(id)a3
{
  id v8 = (VKCustomTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&self->_customTileProviderLock._lock);
  if (self->_customTileProvider == v8)
  {
    ptr = self->_customStyle.__ptr_;
    [(VKCustomTileOverlayProviderData *)v8 alpha];
    *(float *)&double v5 = v5;
    *(_DWORD *)ptr = LODWORD(v5);
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      uint64_t var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        char v9 = 1;
        md::MapEngine::setNeedsTick(var0, &v9);
      }
    }
  }
  os_unfair_lock_unlock(&self->_customTileProviderLock._lock);
}

- (void)customTileOverlayNeedsDisplay:(id)a3
{
  p_customTileProviderLock = &self->_customTileProviderLock;
  double v5 = (VKCustomTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&p_customTileProviderLock->_lock);
  customTileProvider = self->_customTileProvider;

  if (customTileProvider == v5)
  {
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      uint64_t var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        char v9 = 1;
        md::MapEngine::setNeedsTick(var0, &v9);
      }
    }
  }
  os_unfair_lock_unlock(&p_customTileProviderLock->_lock);
}

- (void)rasterTileOverlayNeedsInvalidate:(id)a3
{
  id v8 = a3;
  p_standardContainer = (md::OverlayContainer **)&self->_standardContainer;
  cntrl = self->_standardContainer.__cntrl_;
  if (!cntrl)
  {
    *p_standardContainer = 0;
    self->_standardContainer.__cntrl_ = 0;
    goto LABEL_11;
  }
  uint64_t v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (v6 && *p_standardContainer)
  {
    md::OverlayContainer::invalidate(*p_standardContainer, self, 1, 0);
LABEL_8:
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    goto LABEL_11;
  }
  uint64_t v7 = self->_standardContainer.__cntrl_;
  *p_standardContainer = 0;
  self->_standardContainer.__cntrl_ = 0;
  if (v7) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  }
  if (v6) {
    goto LABEL_8;
  }
LABEL_11:
}

- (void)rasterTileOverlayDidChangeAlpha:(id)a3
{
  id v8 = (VKRasterTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&self->_rasterTileProviderLock._lock);
  if (self->_rasterTileProvider == v8)
  {
    ptr = self->_rasterStyle.__ptr_;
    [(VKRasterTileOverlayProviderData *)v8 alpha];
    *(float *)&double v5 = v5;
    *(_DWORD *)ptr = LODWORD(v5);
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      uint64_t var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        char v9 = 1;
        md::MapEngine::setNeedsTick(var0, &v9);
      }
    }
  }
  os_unfair_lock_unlock(&self->_rasterTileProviderLock._lock);
}

- (void)rasterTileOverlayNeedsDisplay:(id)a3
{
  p_rasterTileProviderLock = &self->_rasterTileProviderLock;
  double v5 = (VKRasterTileOverlayProviderData *)a3;
  os_unfair_lock_lock(&p_rasterTileProviderLock->_lock);
  rasterTileProvider = self->_rasterTileProvider;

  if (rasterTileProvider == v5)
  {
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      uint64_t var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        char v9 = 1;
        md::MapEngine::setNeedsTick(var0, &v9);
      }
    }
  }
  os_unfair_lock_unlock(&p_rasterTileProviderLock->_lock);
}

- (void)vectorOverlayNeedsDisplay:(id)a3 needsFullInvalidate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v13 = (VKVectorOverlayData *)a3;
  os_unfair_lock_lock(&self->_vectorDataLock._lock);
  if (self->_vectorData != v13) {
    goto LABEL_2;
  }
  if (v4)
  {
    p_standardContainer = &self->_standardContainer;
    v14[0] = 0;
    cntrl = self->_standardContainer.__cntrl_;
    if (!cntrl)
    {
      p_standardContainer->__ptr_ = 0;
      self->_standardContainer.__cntrl_ = 0;
      goto LABEL_2;
    }
    id v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    v14[1] = v8;
    if (v8)
    {
      ptr = (md::OverlayContainer *)p_standardContainer->__ptr_;
      v14[0] = ptr;
      if (ptr)
      {
        md::OverlayContainer::invalidate(ptr, self, 1, 0);
LABEL_16:
        if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
        goto LABEL_2;
      }
    }
    unint64_t v12 = self->_standardContainer.__cntrl_;
    p_standardContainer->__ptr_ = 0;
    self->_standardContainer.__cntrl_ = 0;
    if (v12) {
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
    }
    if (v8) {
      goto LABEL_16;
    }
  }
  else
  {
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      uint64_t var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        LOBYTE(v14[0]) = 1;
        md::MapEngine::setNeedsTick(var0, v14);
      }
    }
  }
LABEL_2:
  os_unfair_lock_unlock(&self->_vectorDataLock._lock);
}

- (void)setStandardContainer:(weak_ptr<md::OverlayContainer>)a3
{
  BOOL v4 = *(OverlayContainer **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_standardContainer.__cntrl_;
  self->_standardContainer.__ptr_ = v4;
  self->_standardContainer.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (weak_ptr<md::OverlayContainer>)standardContainer
{
  cntrl = self->_standardContainer.__cntrl_;
  *v2 = self->_standardContainer.__ptr_;
  v2[1] = (OverlayContainer *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (OverlayContainer *)self;
  return result;
}

- (void)setFlyoverContainer:(weak_ptr<md::GlobeOverlayContainer>)a3
{
  BOOL v4 = *(GlobeOverlayContainer **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_flyoverContainer.__cntrl_;
  self->_flyoverContainer.__ptr_ = v4;
  self->_flyoverContainer.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (weak_ptr<md::GlobeOverlayContainer>)flyoverContainer
{
  cntrl = self->_flyoverContainer.__cntrl_;
  *v2 = self->_flyoverContainer.__ptr_;
  v2[1] = (GlobeOverlayContainer *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (GlobeOverlayContainer *)self;
  return result;
}

- (void)setNeedsDisplayForReason:(unint64_t)a3
{
  id v33 = [(VKOverlay *)self vectorData];
  v32 = [(VKOverlay *)self rasterTileProvider];
  v31 = [(VKOverlay *)self customTileProvider];
  int canProvideVectorData = self->_canProvideVectorData;
  [(VKOverlay *)self _updateVectorData];
  int v6 = self->_canProvideVectorData;
  [(VKOverlay *)self _updateRasterTileProvider];
  [(VKOverlay *)self _updateCustomTileProvider];
  id v7 = [(VKOverlay *)self vectorData];
  id v8 = [(VKOverlay *)self rasterTileProvider];
  char v9 = [(VKOverlay *)self customTileProvider];
  p_flyoverContainer = &self->_flyoverContainer;
  v35 = 0;
  v36 = 0;
  cntrl = self->_flyoverContainer.__cntrl_;
  if (!cntrl)
  {
    p_flyoverContainer->__ptr_ = 0;
    self->_flyoverContainer.__cntrl_ = 0;
    goto LABEL_15;
  }
  v36 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v36 || (ptr = p_flyoverContainer->__ptr_, (v35 = ptr) == 0))
  {
    char v19 = self->_flyoverContainer.__cntrl_;
    p_flyoverContainer->__ptr_ = 0;
    self->_flyoverContainer.__cntrl_ = 0;
    if (v19)
    {
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v19);
      if (a3 == 2) {
        goto LABEL_16;
      }
      goto LABEL_31;
    }
LABEL_15:
    if (a3 == 2) {
      goto LABEL_16;
    }
LABEL_31:
    int v20 = 0;
    goto LABEL_32;
  }
  BOOL v13 = self;
  uint64_t v14 = v13;
  if (*(void *)ptr)
  {
    uint64_t v15 = *(void *)(*(void *)(*(void *)(*(void *)ptr + 856) + 40) + 48);
    if (v15)
    {
      uint64_t v16 = v13;
      md::realistic::OverlayRenderLayer::invalidateTiles((md::realistic::OverlayRenderLayer *)v15, v16);
      uint64_t v17 = *(void *)(v15 + 80);
      uint64_t v18 = *(void *)(v15 + 88);
      while (v17 != v18)
      {
        if (*(VKOverlay **)v17 == v16) {
          *(_DWORD *)(v17 + 8) = *(_DWORD *)(v15 + 72) + 1;
        }
        v17 += 16;
      }
      uint64_t v22 = **(void **)(*(void *)(v15 + 40) + 88);
      if (v22)
      {
        LOBYTE(v34[0]) = 7;
        md::MapEngine::setNeedsTick(v22, v34);
      }
    }
  }

  if (a3 != 2) {
    goto LABEL_31;
  }
LABEL_16:
  if (v7 && v7 == v33 || v8 && v8 == v32)
  {
    int v20 = 1;
  }
  else
  {
    if (v9) {
      BOOL v21 = v9 == v31;
    }
    else {
      BOOL v21 = 0;
    }
    int v20 = v21;
  }
LABEL_32:
  p_standardContainer = &self->_standardContainer;
  v34[0] = 0;
  v24 = self->_standardContainer.__cntrl_;
  if (!v24)
  {
    p_standardContainer->__ptr_ = 0;
    self->_standardContainer.__cntrl_ = 0;
    goto LABEL_47;
  }
  v25 = std::__shared_weak_count::lock((std::__shared_weak_count *)v24);
  v34[1] = v25;
  if (v25)
  {
    v26 = (md::OverlayContainer *)p_standardContainer->__ptr_;
    v34[0] = v26;
    if (v26)
    {
      if (v20 && (runLoopController = self->_runLoopController) != 0)
      {
        uint64_t var0 = (uint64_t)runLoopController->var0;
        if (runLoopController->var0)
        {
          char v37 = 1;
          md::MapEngine::setNeedsTick(var0, &v37);
        }
      }
      else
      {
        md::OverlayContainer::invalidate(v26, self, a3 != 3, canProvideVectorData != v6);
      }
LABEL_45:
      if (!atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
      goto LABEL_47;
    }
  }
  v29 = self->_standardContainer.__cntrl_;
  p_standardContainer->__ptr_ = 0;
  self->_standardContainer.__cntrl_ = 0;
  if (v29) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v29);
  }
  if (v25) {
    goto LABEL_45;
  }
LABEL_47:
  v30 = v36;
  if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
}

- (void)_updateCustomTileProvider
{
  p_customTileProviderLock = &self->_customTileProviderLock;
  os_unfair_lock_lock(&self->_customTileProviderLock._lock);
  [(VKCustomTileOverlayProviderData *)self->_customTileProvider setDelegate:0];
  customTileProvider = self->_customTileProvider;
  self->_customTileProvider = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v6 = [WeakRetained overlayCanProvideCustomTileData:self];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [v7 customTileProviderForOverlay:self];
    char v9 = self->_customTileProvider;
    self->_customTileProvider = v8;

    [(VKCustomTileOverlayProviderData *)self->_customTileProvider setDelegate:self];
  }
  unint64_t v10 = self->_customTileProvider;
  ptr = self->_customStyle.__ptr_;
  if (v10)
  {
    [(VKCustomTileOverlayProviderData *)v10 alpha];
    float v13 = v12;
  }
  else
  {
    float v13 = 1.0;
  }
  *(float *)ptr = v13;
  os_unfair_lock_unlock(&p_customTileProviderLock->_lock);
}

- (id)customTileProvider
{
  p_customTileProviderLock = &self->_customTileProviderLock;
  os_unfair_lock_lock(&self->_customTileProviderLock._lock);
  BOOL v4 = self->_customTileProvider;
  os_unfair_lock_unlock(&p_customTileProviderLock->_lock);
  return v4;
}

- (void)_updateRasterTileProvider
{
  p_rasterTileProviderLock = &self->_rasterTileProviderLock;
  os_unfair_lock_lock(&self->_rasterTileProviderLock._lock);
  [(VKRasterTileOverlayProviderData *)self->_rasterTileProvider setDelegate:0];
  rasterTileProvider = self->_rasterTileProvider;
  self->_rasterTileProvider = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v6 = [WeakRetained overlayCanProvideRasterTileData:self];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [v7 rasterTileProviderForOverlay:self];
    char v9 = self->_rasterTileProvider;
    self->_rasterTileProvider = v8;

    [(VKRasterTileOverlayProviderData *)self->_rasterTileProvider setDelegate:self];
  }
  unint64_t v10 = self->_rasterTileProvider;
  ptr = self->_rasterStyle.__ptr_;
  if (v10)
  {
    [(VKRasterTileOverlayProviderData *)v10 alpha];
    float v13 = v12;
  }
  else
  {
    float v13 = 1.0;
  }
  *(float *)ptr = v13;
  os_unfair_lock_unlock(&p_rasterTileProviderLock->_lock);
}

- (id)rasterTileProvider
{
  p_rasterTileProviderLock = &self->_rasterTileProviderLock;
  os_unfair_lock_lock(&self->_rasterTileProviderLock._lock);
  BOOL v4 = self->_rasterTileProvider;
  os_unfair_lock_unlock(&p_rasterTileProviderLock->_lock);
  return v4;
}

- (void)_updateVectorData
{
  p_vectorDataLock = &self->_vectorDataLock;
  os_unfair_lock_lock(&self->_vectorDataLock._lock);
  BOOL v4 = [(VKOverlay *)self delegate];
  if ([v4 overlayCanProvideVectorData:self]) {
    BOOL v5 = !self->_forceRasterizationForGlobe;
  }
  else {
    BOOL v5 = 0;
  }
  self->_int canProvideVectorData = v5;
  [(VKVectorOverlayData *)self->_vectorData _setDelegate:0];
  vectorData = self->_vectorData;
  self->_vectorData = 0;

  if (self->_canProvideVectorData)
  {
    id v7 = [v4 vectorDataForOverlay:self];
    id v8 = self->_vectorData;
    self->_vectorData = v7;

    [(VKVectorOverlayData *)self->_vectorData _setDelegate:self];
    [(VKVectorOverlayData *)self->_vectorData setBlendMode:self->_blendMode];
  }

  os_unfair_lock_unlock(&p_vectorDataLock->_lock);
}

- (id)vectorData
{
  p_vectorDataLock = &self->_vectorDataLock;
  os_unfair_lock_lock(&self->_vectorDataLock._lock);
  BOOL v4 = self->_vectorData;
  os_unfair_lock_unlock(&p_vectorDataLock->_lock);
  return v4;
}

- (void)drawKey:(id *)a3 withData:(id)a4 inTexture:(id)a5 withTimestamp:(double)a6 withTileScale:(float)a7
{
  id v15 = a4;
  id v12 = a5;
  float v13 = [(VKOverlay *)self delegate];
  *(float *)&double v14 = a7;
  [v13 overlay:self drawKey:a3 withData:v15 inTexture:v12 withTimestamp:a6 withTileScale:v14];
}

- (void)drawKey:(id *)a3 withData:(id)a4 inIOSurface:(__IOSurface *)a5 withTimestamp:(double)a6 withTileScale:(float)a7
{
  id v14 = a4;
  id v12 = [(VKOverlay *)self delegate];
  *(float *)&double v13 = a7;
  [v12 overlay:self drawKey:a3 withData:v14 inIOSurface:a5 withTimestamp:a6 withTileScale:v13];
}

- (void)drawKey:(id *)a3 withData:(id)a4 inIOSurface:(__IOSurface *)a5 withTimestamp:(double)a6
{
  id v11 = a4;
  unint64_t v10 = [(VKOverlay *)self delegate];
  [v10 overlay:self drawKey:a3 withData:v11 inIOSurface:a5 withTimestamp:a6];
}

- (void)drawKey:(id *)a3 inContext:(CGContext *)a4
{
  id v7 = [(VKOverlay *)self delegate];
  [v7 overlay:self drawKey:a3 inContext:a4];
}

- (void)onVisibleTiles:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(VKOverlay *)self delegate];
  [v4 overlay:self onVisibleTiles:v5];
}

- (void)didEnterKey:(id *)a3 withFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(VKOverlay *)self delegate];
  [v7 overlay:self didEnterKey:a3 withFallback:v4];
}

- (void)didExitKey:(id *)a3
{
  id v5 = [(VKOverlay *)self delegate];
  [v5 overlay:self didExitKey:a3];
}

- (BOOL)canDrawKey:(id *)a3 withData:(id)a4
{
  id v6 = a4;
  id v7 = [(VKOverlay *)self delegate];
  LOBYTE(a3) = [v7 overlay:self canDrawKey:a3 withData:v6];

  return (char)a3;
}

- (unint64_t)estimatedCostForCustomTileData:(id)a3
{
  id v4 = a3;
  id v5 = [(VKOverlay *)self delegate];
  unint64_t v6 = [v5 overlay:self estimatedCostForCustomTileData:v4];

  return v6;
}

- (unsigned)anisotropy
{
  uint64_t v3 = [(VKOverlay *)self delegate];
  unsigned int v4 = [v3 anisotropy:self];

  if (v4 <= 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = v4;
  }
  if (v5 >= 0x10) {
    return 16;
  }
  else {
    return v5;
  }
}

- (BOOL)shouldUseMetalTexture
{
  v2 = self;
  uint64_t v3 = [(VKOverlay *)self delegate];
  LOBYTE(v2) = [v3 shouldUseMetalTexture:v2];

  return (char)v2;
}

- (BOOL)areResourcesRequired
{
  v2 = self;
  uint64_t v3 = [(VKOverlay *)self delegate];
  LOBYTE(v2) = [v3 areOverlayResourcesRequired:v2];

  return (char)v2;
}

- (BOOL)canDrawKey:(id *)a3
{
  unsigned int v5 = [(VKOverlay *)self delegate];
  LOBYTE(a3) = [v5 overlay:self canDrawKey:a3];

  return (char)a3;
}

- (BOOL)canPossiblyDrawKey:(id *)a3
{
  unsigned int v5 = [(VKOverlay *)self delegate];
  LOBYTE(a3) = [v5 overlay:self canPossiblyDrawKey:a3];

  return (char)a3;
}

- (void)setNeedsDisplayInRect:(id *)a3 level:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v53 = 0;
  cntrl = self->_flyoverContainer.__cntrl_;
  if (cntrl && (v53 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl)) != 0) {
    ptr = self->_flyoverContainer.__ptr_;
  }
  else {
    ptr = 0;
  }
  double var1 = a3->var0.var1;
  double v12 = *(double *)(MEMORY[0x1E4F63F08] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F63F08] + 24);
  double v14 = a3->var0.var0 / v12;
  double v15 = 1.0 - (a3->var1.var1 + var1) / v13;
  double v16 = 1.0 - var1 / v13;
  double v17 = (a3->var1.var0 + a3->var0.var0) / v12;
  if (ptr)
  {
    uint64_t v18 = self;
    char v19 = v18;
    if (*(void *)ptr)
    {
      uint64_t v20 = *(void *)(*(void *)(*(void *)(*(void *)ptr + 856) + 40) + 48);
      if (v20)
      {
        unint64_t v52 = a5;
        BOOL v21 = v18;
        int v22 = *(_DWORD *)(v20 + 72) + 1;
        *(_DWORD *)(v20 + 76) = v22;
        uint64_t v24 = *(void *)(v20 + 104);
        uint64_t v23 = *(void *)(v20 + 112);
        if (v23 != v24)
        {
          uint64_t v25 = 0;
          do
          {
            uint64_t v26 = *(void *)(v24 + 8 * v25);
            uint64_t v27 = *(void *)(v26 + 360);
            if (v27)
            {
              unsigned int v28 = *(_DWORD *)(v26 + 392);
              if (v28 >= 0x1F) {
                char v29 = 31;
              }
              else {
                char v29 = *(_DWORD *)(v26 + 392);
              }
              uint64_t v30 = (~(-1 << v29) - *(_DWORD *)(v26 + 396));
              uint64_t v31 = *(unsigned int *)(v26 + 400);
              double v32 = 1.0 / (double)(1 << v28);
              double v33 = v32 * (double)(int)v31;
              double v34 = v32 * (double)((1 << v28) + ~v30);
              double v35 = v34 + v32;
              double v36 = v33 + v32;
              if (v17 > v33 && v14 < v36 && v16 > v34 && v15 < v35)
              {
                v54[0] = v31 | (v30 << 32);
                v54[1] = v28 | 0x200000000;
                if ([(VKOverlay *)v21 canDrawKey:v54])
                {
                  if ([(VKOverlay *)v21 level]) {
                    uint64_t v40 = v27 + 1;
                  }
                  else {
                    uint64_t v40 = v27;
                  }
                  *(unsigned char *)(v40 + 168) = 1;
                }
                int v22 = *(_DWORD *)(v20 + 76);
                uint64_t v24 = *(void *)(v20 + 104);
                uint64_t v23 = *(void *)(v20 + 112);
              }
              *(_DWORD *)(v27 + 84) = v22;
            }
            ++v25;
          }
          while (v25 != (v23 - v24) >> 3);
        }

        a5 = v52;
        uint64_t v42 = *(void *)(v20 + 80);
        uint64_t v43 = *(void *)(v20 + 88);
        while (v42 != v43)
        {
          if (*(VKOverlay **)v42 == v21) {
            *(_DWORD *)(v42 + 8) = *(_DWORD *)(v20 + 72) + 1;
          }
          v42 += 16;
        }
        uint64_t v44 = **(void **)(*(void *)(v20 + 40) + 88);
        if (v44)
        {
          LOBYTE(v54[0]) = 7;
          md::MapEngine::setNeedsTick(v44, v54);
        }
      }
    }
  }
  else
  {
    v41 = self->_flyoverContainer.__cntrl_;
    self->_flyoverContainer.__ptr_ = 0;
    self->_flyoverContainer.__cntrl_ = 0;
    if (v41) {
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v41);
    }
  }
  p_standardContainer = &self->_standardContainer;
  v46 = self->_standardContainer.__cntrl_;
  if (!v46)
  {
    p_standardContainer->__ptr_ = 0;
    self->_standardContainer.__cntrl_ = 0;
    goto LABEL_61;
  }
  v47 = std::__shared_weak_count::lock((std::__shared_weak_count *)v46);
  if (v47)
  {
    uint64_t v48 = (uint64_t)p_standardContainer->__ptr_;
    if (p_standardContainer->__ptr_)
    {
      v49 = self;
      v55 = 0;
      v50 = (double *)operator new(0x40uLL);
      *(void *)v50 = &unk_1EF572348;
      *((void *)v50 + 1) = v48;
      *((void *)v50 + 2) = v49;
      v50[3] = v14;
      v50[4] = v15;
      v50[5] = v17;
      v50[6] = v16;
      *((unsigned char *)v50 + 56) = 0;
      if ((a4 & 0x8000000000000000) == 0)
      {
        *((unsigned char *)v50 + 57) = a4;
        *((unsigned char *)v50 + 56) = 1;
      }
      *((unsigned char *)v50 + 58) = a5 != 3;
      v55 = v50;
      md::OverlayContainer::queueCommand(v48, 4, v54);
      if (v55 == (double *)v54)
      {
        (*(void (**)(void *))(v54[0] + 32))(v54);
      }
      else if (v55)
      {
        (*(void (**)(void))(*(void *)v55 + 40))();
      }

LABEL_59:
      if (!atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
      goto LABEL_61;
    }
  }
  v51 = self->_standardContainer.__cntrl_;
  p_standardContainer->__ptr_ = 0;
  self->_standardContainer.__cntrl_ = 0;
  if (v51) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v51);
  }
  if (v47) {
    goto LABEL_59;
  }
LABEL_61:
  if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
    std::__shared_weak_count::__release_weak(v53);
  }
}

- (void)setRunLoopController:(RunLoopController *)a3
{
  self->_runLoopController = a3;
  [(VKOverlay *)self customTileOverlayDidChangeDisplayRate:self->_customTileProvider];
}

- (void)setForceRasterizationForGlobe:(BOOL)a3
{
  if (self->_forceRasterizationForGlobe != a3)
  {
    self->_forceRasterizationForGlobe = a3;
    if (a3 && self->_canProvideVectorData) {
      [(VKOverlay *)self _updateVectorData];
    }
  }
}

- (void)setBlendMode:(int64_t)a3
{
  int64_t blendMode = self->_blendMode;
  if (blendMode == a3) {
    return;
  }
  self->_int64_t blendMode = a3;
  if ((unint64_t)(a3 - 1) < 0x11) {
    int v5 = a3;
  }
  else {
    int v5 = 0;
  }
  *((_DWORD *)self->_rasterStyle.__ptr_ + 1) = v5;
  *((_DWORD *)self->_customStyle.__ptr_ + 1) = v5;
  -[VKVectorOverlayData setBlendMode:](self->_vectorData, "setBlendMode:");
  if (blendMode)
  {
    runLoopController = self->_runLoopController;
    if (runLoopController)
    {
      uint64_t var0 = (uint64_t)runLoopController->var0;
      if (runLoopController->var0)
      {
        LOBYTE(v13[0]) = 1;
        md::MapEngine::setNeedsTick(var0, v13);
      }
    }
    return;
  }
  [(VKOverlay *)self _updateVectorData];
  p_standardContainer = &self->_standardContainer;
  v13[0] = 0;
  cntrl = self->_standardContainer.__cntrl_;
  if (!cntrl)
  {
    p_standardContainer->__ptr_ = 0;
    self->_standardContainer.__cntrl_ = 0;
    return;
  }
  unint64_t v10 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  v13[1] = v10;
  if (v10)
  {
    ptr = (md::OverlayContainer *)p_standardContainer->__ptr_;
    v13[0] = ptr;
    if (ptr)
    {
      md::OverlayContainer::invalidate(ptr, self, 1, 0);
LABEL_17:
      if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      return;
    }
  }
  double v12 = self->_standardContainer.__cntrl_;
  p_standardContainer->__ptr_ = 0;
  self->_standardContainer.__cntrl_ = 0;
  if (v12) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
  }
  if (v10) {
    goto LABEL_17;
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(VKOverlay *)self _updateVectorData];
  [(VKOverlay *)self _updateRasterTileProvider];
  [(VKOverlay *)self _updateCustomTileProvider];
}

- (void)clearDelegate
{
}

- (VKOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKOverlayDelegate *)WeakRetained;
}

- (void)dealloc
{
  [(VKVectorOverlayData *)self->_vectorData _setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)VKOverlay;
  [(VKOverlay *)&v3 dealloc];
}

- (VKOverlay)init
{
  v10.receiver = self;
  v10.super_class = (Class)VKOverlay;
  v2 = [(VKOverlay *)&v10 init];
  objc_super v3 = (VKOverlay *)v2;
  if (v2)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F63F00] + 16);
    *(_OWORD *)(v2 + 24) = *MEMORY[0x1E4F63F00];
    *(_OWORD *)(v2 + 40) = v4;
    *((_DWORD *)v2 + 53) = atomic_fetch_add(_overlaysCounter, 1u);
    int v5 = operator new(0x20uLL);
    v5[1] = 0;
    v5[2] = 0;
    void *v5 = &unk_1EF581670;
    v5[3] = 1065353216;
    cntrl = (std::__shared_weak_count *)v3->_rasterStyle.__cntrl_;
    v3->_rasterStyle.__ptr_ = (RasterTileOverlayStyle *)(v5 + 3);
    v3->_rasterStyle.__cntrl_ = (__shared_weak_count *)v5;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    id v7 = operator new(0x20uLL);
    v7[1] = 0;
    v7[2] = 0;
    *id v7 = &unk_1EF581670;
    v7[3] = 1065353216;
    id v8 = (std::__shared_weak_count *)v3->_customStyle.__cntrl_;
    v3->_customStyle.__ptr_ = (RasterTileOverlayStyle *)(v7 + 3);
    v3->_customStyle.__cntrl_ = (__shared_weak_count *)v7;
    if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    v3->_int64_t blendMode = 0;
    v3->_forceRasterizationForGlobe = 0;
  }
  return v3;
}

@end