@interface MetalLayer
- (BOOL)sRGB;
- (CGSize)backingSize;
- (GGLLayerDelegate)renderDelegate;
- (MetalLayer)initWithDevice:(shared_ptr<ggl:(BOOL)a4 :MetalDevice>)a3 sRGB:;
- (id).cxx_construct;
- (id)_updateDrawable;
- (int)backingFormat;
- (void)_createTexture;
- (void)_onTimerFired:(double)a3 withPresent:(id)a4;
- (void)onTimerFired:(double)a3;
- (void)onTimerFired:(double)a3 presentAfterMinimumDuration:(double)a4;
- (void)onTimerFired:(double)a3 presentAtTime:(double)a4;
- (void)setRenderDelegate:(id)a3;
@end

@implementation MetalLayer

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevDrawable, 0);
  cntrl = self->_samplerState.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_texture.__cntrl_;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  v5 = self->_device.__cntrl_;
  if (v5 && !atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v5 + 16))(v5);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)sRGB
{
  return self->_sRGB;
}

- (CGSize)backingSize
{
  double width = self->_backingSize.width;
  double height = self->_backingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRenderDelegate:(id)a3
{
}

- (GGLLayerDelegate)renderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (GGLLayerDelegate *)WeakRetained;
}

- (void)onTimerFired:(double)a3 presentAfterMinimumDuration:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__MetalLayer_onTimerFired_presentAfterMinimumDuration___block_invoke;
  v4[3] = &__block_descriptor_40_e27_v16__0___CAMetalDrawable__8l;
  *(double *)&v4[4] = a4;
  [(MetalLayer *)self _onTimerFired:v4 withPresent:a3];
}

uint64_t __55__MetalLayer_onTimerFired_presentAfterMinimumDuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentAfterMinimumDuration:*(double *)(a1 + 32)];
}

- (void)onTimerFired:(double)a3 presentAtTime:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__MetalLayer_onTimerFired_presentAtTime___block_invoke;
  v4[3] = &__block_descriptor_40_e27_v16__0___CAMetalDrawable__8l;
  *(double *)&v4[4] = a4;
  [(MetalLayer *)self _onTimerFired:v4 withPresent:a3];
}

uint64_t __41__MetalLayer_onTimerFired_presentAtTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentAtTime:*(double *)(a1 + 32)];
}

- (void)onTimerFired:(double)a3
{
}

uint64_t __27__MetalLayer_onTimerFired___block_invoke(uint64_t a1, void *a2)
{
  return [a2 present];
}

- (void)_onTimerFired:(double)a3 withPresent:(id)a4
{
  v6 = (void (**)(id, id))a4;
  uint64_t v7 = mach_absolute_time();
  v8 = (void *)MEMORY[0x1A6239C40]();
  [(MetalLayer *)self _createTexture];
  p_texture = (const Texture **)&self->_texture;
  if (self->_texture.__ptr_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = WeakRetained;
    cntrl = self->_texture.__cntrl_;
    v32 = *p_texture;
    v33 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    [WeakRetained prepareTexture:&v32];
    v13 = (std::__shared_weak_count *)v33;
    if (v33 && !atomic_fetch_add((atomic_ullong *volatile)v33 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  p_delegate = &self->_delegate;
  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  int v16 = [v15 isDelayedRenderQueueConsumptionSupported];

  if (v16)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v18 = [v17 renderQueueForTimestamp:a3];
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = objc_loadWeakRetained((id *)p_delegate);
  [v19 willUpdateFrameTexture];

  v20 = [(MetalLayer *)self _updateDrawable];
  id v21 = objc_loadWeakRetained((id *)p_delegate);
  [v21 didUpdateFrameTexture];

  if (v20)
  {
    uint64_t v29 = v7;
    if ((v16 & 1) == 0)
    {
      id v22 = objc_loadWeakRetained((id *)p_delegate);
      uint64_t v18 = [v22 renderQueueForTimestamp:a3];
    }
    id v23 = objc_loadWeakRetained((id *)p_delegate);
    v24 = *p_texture;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __40__MetalLayer__onTimerFired_withPresent___block_invoke;
    v30[3] = &unk_1E5A99EC0;
    v30[4] = self;
    id v25 = v20;
    id v31 = v25;
    [v23 drawToTexture:v24 withRenderQueue:v18 completionHandler:v30];

    id v26 = objc_loadWeakRetained((id *)p_delegate);
    [v26 willPresent];

    uint64_t v7 = v29;
    v6[2](v6, v25);
    ggl::MetalResourceManager::updateTextureWithResource(*((ggl::MetalResourceManager **)self->_device.__ptr_ + 10), *p_texture, 0);
    id v27 = objc_loadWeakRetained((id *)p_delegate);
    [v27 didPresent];
  }
  uint64_t v28 = mach_absolute_time();
  if (ggl::Performance::Counters::instance(void)::onceToken[0] != -1) {
    dispatch_once(ggl::Performance::Counters::instance(void)::onceToken, &__block_literal_global_53878);
  }
  atomic_fetch_add(*(atomic_ullong *volatile *)(ggl::Performance::Counters::instance(void)::counters + 32), v28 - v7);
}

void __40__MetalLayer__onTimerFired_withPresent___block_invoke(uint64_t a1)
{
}

- (id)_updateDrawable
{
  if (![(CAMetalLayer *)self isDrawableAvailable])
  {
    NSLog((NSString *)@"No drawable available at time of request for layer %@", self);
    id v6 = 0;
    goto LABEL_9;
  }
  v3 = [(CAMetalLayer *)self nextDrawable];
  v4 = v3;
  if (!v3)
  {
    NSLog((NSString *)@"Nil drawable for layer %@", self);
    goto LABEL_7;
  }
  ptr = self->_texture.__ptr_;
  if (!ptr)
  {
LABEL_7:
    id v6 = 0;
    goto LABEL_8;
  }
  ggl::MetalResourceManager::updateTextureWithResource(*((ggl::MetalResourceManager **)self->_device.__ptr_ + 10), (const Texture *)ptr, (void *)[v3 texture]);
  id v6 = v4;
LABEL_8:

LABEL_9:
  return v6;
}

- (void)_createTexture
{
  [(MetalLayer *)self contentsScale];
  double v4 = v3;
  [(MetalLayer *)self bounds];
  unsigned int v6 = (v5 * v4);
  unsigned int v8 = (v7 * v4);
  p_texture = &self->_texture;
  if (v6 * v8)
  {
    ptr = p_texture->__ptr_;
    if (!p_texture->__ptr_ || *((_DWORD *)ptr + 20) != v6 || *((_DWORD *)ptr + 21) != v8)
    {
      self->_backingSize.double width = (double)v6;
      self->_backingSize.double height = (double)v8;
      -[CAMetalLayer setDrawableSize:](self, "setDrawableSize:");
      operator new();
    }
  }
  else
  {
    cntrl = self->_texture.__cntrl_;
    p_texture->__ptr_ = 0;
    p_texture->__cntrl_ = 0;
    if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (MetalLayer)initWithDevice:(shared_ptr<ggl:(BOOL)a4 :MetalDevice>)a3 sRGB:
{
  char cntrl = (char)a3.__cntrl_;
  ptr = a3.__ptr_;
  v21[5] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)MetalLayer;
  unsigned int v6 = [(CAMetalLayer *)&v19 init];
  double v7 = v6;
  if (v6)
  {
    v9 = *(MetalDevice **)ptr;
    uint64_t v8 = *((void *)ptr + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    v10 = (std::__shared_weak_count *)v6->_device.__cntrl_;
    v6->_device.__ptr_ = v9;
    v6->_device.__cntrl_ = (__shared_weak_count *)v8;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    v7->_sRGB = cntrl;
    v20[0] = @"bounds";
    v11 = [MEMORY[0x1E4F1CA98] null];
    v21[0] = v11;
    v20[1] = @"position";
    v12 = [MEMORY[0x1E4F1CA98] null];
    v21[1] = v12;
    v20[2] = @"contentsScale";
    v13 = [MEMORY[0x1E4F1CA98] null];
    v21[2] = v13;
    v20[3] = @"hidden";
    v14 = [MEMORY[0x1E4F1CA98] null];
    v21[3] = v14;
    v20[4] = @"contents";
    id v15 = [MEMORY[0x1E4F1CA98] null];
    v21[4] = v15;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
    [(MetalLayer *)v7 setActions:v16];

    [(MetalLayer *)v7 setOpaque:1];
    [(MetalLayer *)v7 setHidden:0];
    [(MetalLayer *)v7 setContentsGravity:*MEMORY[0x1E4F3A3C0]];
    [(CAMetalLayer *)v7 setPresentsWithTransaction:1];
    [(MetalLayer *)v7 setValue:MEMORY[0x1E4F1CC38] forKey:@"disablePromotionCompatibility"];
    [(CAMetalLayer *)v7 setFramebufferOnly:0];
    if (v7->_sRGB) {
      uint64_t v17 = 81;
    }
    else {
      uint64_t v17 = 80;
    }
    [(CAMetalLayer *)v7 setPixelFormat:v17];
    [(CAMetalLayer *)v7 setFenceEnabled:1];
    [(CAMetalLayer *)v7 setDevice:*(void *)(*(void *)ptr + 104)];
  }
  return v7;
}

- (int)backingFormat
{
  if (self->_sRGB) {
    return 15;
  }
  else {
    return 14;
  }
}

@end