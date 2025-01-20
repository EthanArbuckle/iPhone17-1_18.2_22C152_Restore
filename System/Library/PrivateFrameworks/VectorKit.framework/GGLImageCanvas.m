@interface GGLImageCanvas
- (BOOL)hasRenderTarget;
- (BOOL)multiSample;
- (BOOL)shouldRasterize;
- (BOOL)supportsFramebufferFetch;
- (CGRect)bounds;
- (CGSize)size;
- (CGSize)sizeInPixels;
- (GGLImageCanvas)initWithSize:(CGSize)a3 scale:(double)a4 useMultisampling:(BOOL)a5 extraColorFormats:(const void *)a6 taskContext:(const void *)a7 device:(void *)a8 services:(void *)a9 signpostId:(unint64_t)a10;
- (GGLRenderQueueSource)renderSource;
- (__IOSurface)flipImage;
- (const)format;
- (const)linearFormat;
- (double)contentScale;
- (id).cxx_construct;
- (id)prepareRenderTask:;
- (shared_ptr<ggl::BitmapDataBase>)bitmapData;
- (uint64_t)prepareRenderTask:;
- (unint64_t)signpost;
- (void)_internalRenderTarget;
- (void)createRenderTarget;
- (void)dealloc;
- (void)debugConsoleForId:(int)a3;
- (void)destroyRenderTarget;
- (void)didDrawView;
- (void)finalRenderTarget;
- (void)finalSurface;
- (void)flipPass;
- (void)flipTarget;
- (void)imageTexture;
- (void)linearRenderTarget;
- (void)prepareRenderTask:;
- (void)prepareRenderTask:(const void *)a3;
- (void)renderTarget;
- (void)renderer;
- (void)setBounds:(CGRect)a3;
- (void)setContentScale:(double)a3;
- (void)setRenderSource:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)willDealloc;
- (void)willDrawView;
@end

@implementation GGLImageCanvas

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 48) = 0;
  *((void *)self + 49) = 0;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((void *)self + 46) = 0;
  *((void *)self + 52) = 850045863;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  return self;
}

- (void).cxx_destruct
{
  v3 = (md::DebugConsoleManager *)*((void *)self + 60);
  *((void *)self + 60) = 0;
  if (v3)
  {
    md::DebugConsoleManager::~DebugConsoleManager(v3);
    MEMORY[0x1A6239270]();
  }
  std::mutex::~mutex((std::mutex *)((char *)self + 416));
  v4 = (std::__shared_weak_count *)*((void *)self + 49);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    v5 = (std::__shared_weak_count *)*((void *)self + 46);
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    v5 = (std::__shared_weak_count *)*((void *)self + 46);
    if (!v5) {
      goto LABEL_9;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_9:
  v6 = (std::__shared_weak_count *)*((void *)self + 44);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    v7 = (std::__shared_weak_count *)*((void *)self + 42);
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    v7 = (std::__shared_weak_count *)*((void *)self + 42);
    if (!v7) {
      goto LABEL_15;
    }
  }
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
LABEL_15:
  v8 = (std::__shared_weak_count *)*((void *)self + 40);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  uint64_t v9 = *((void *)self + 38);
  *((void *)self + 38) = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  v10 = (std::__shared_weak_count *)*((void *)self + 33);
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    v11 = (std::__shared_weak_count *)*((void *)self + 31);
    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
    v11 = (std::__shared_weak_count *)*((void *)self + 31);
    if (!v11) {
      goto LABEL_26;
    }
  }
  if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_26:
  v12 = (std::__shared_weak_count *)*((void *)self + 29);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  uint64_t v13 = *((void *)self + 27);
  *((void *)self + 27) = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  v14 = (std::__shared_weak_count *)*((void *)self + 26);
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  uint64_t v15 = *((void *)self + 24);
  *((void *)self + 24) = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  uint64_t v16 = *((void *)self + 23);
  *((void *)self + 23) = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  v17 = (md::YFlipPass *)*((void *)self + 14);
  *((void *)self + 14) = 0;
  if (v17)
  {
    md::YFlipPass::~YFlipPass(v17);
    MEMORY[0x1A6239270]();
  }
  uint64_t v18 = *((void *)self + 13);
  *((void *)self + 13) = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  uint64_t v19 = *((void *)self + 12);
  *((void *)self + 12) = 0;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  objc_destroyWeak((id *)self + 11);
  v20 = (std::__shared_weak_count *)*((void *)self + 2);
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
}

- (unint64_t)signpost
{
  return *((void *)self + 62);
}

- (BOOL)multiSample
{
  return *((unsigned char *)self + 376);
}

- (void)setRenderSource:(id)a3
{
}

- (GGLRenderQueueSource)renderSource
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 11);
  return (GGLRenderQueueSource *)WeakRetained;
}

- (void)setBounds:(CGRect)a3
{
  *((void *)self + 6) = *(void *)&a3.origin.x;
  *((void *)self + 7) = *(void *)&a3.origin.y;
  *((void *)self + 8) = *(void *)&a3.size.width;
  *((void *)self + 9) = *(void *)&a3.size.height;
}

- (CGRect)bounds
{
  double v2 = *((double *)self + 6);
  double v3 = *((double *)self + 7);
  double v4 = *((double *)self + 8);
  double v5 = *((double *)self + 9);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)size
{
  double v2 = *((double *)self + 3);
  double v3 = *((double *)self + 4);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)contentScale
{
  return *((double *)self + 5);
}

- (BOOL)supportsFramebufferFetch
{
  return *((unsigned char *)self + 82);
}

- (void)debugConsoleForId:(int)a3
{
  double v5 = (std::mutex *)((char *)self + 416);
  std::mutex::lock((std::mutex *)((char *)self + 416));
  uint64_t v6 = *((void *)self + 60);
  if (!v6) {
    operator new();
  }
  v7 = (void *)md::DebugConsoleManager::console(v6, a3);
  std::mutex::unlock(v5);
  return v7;
}

- (void)didDrawView
{
  *((unsigned char *)self + 80) = 1;
}

- (void)willDrawView
{
  if (!*((void *)self + 24)
    || !*(unsigned char *)(*((void *)self + 1) + 20) && !*((void *)self + 38)
    || *((unsigned char *)self + 81))
  {
    [(GGLImageCanvas *)self destroyRenderTarget];
    [(GGLImageCanvas *)self createRenderTarget];
    *((unsigned char *)self + 81) = 0;
  }
  *((unsigned char *)self + 80) = 0;
}

- (void)prepareRenderTask:(const void *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *((void *)self + 61);
  uint64_t v6 = *(void **)v5;
  v7 = *(void **)(v5 + 8);
  if (v6 != v7)
  {
    while (*v6 != 0x8C3843AC816FCBCLL)
    {
      v6 += 5;
      if (v6 == v7) {
        goto LABEL_9;
      }
    }
  }
  if (v6 == v7)
  {
LABEL_9:
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v6[3];
    uint64_t v9 = (std::__shared_weak_count *)v6[4];
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, SEL))v9->__on_zero_shared)(v9, a2);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  objc_initWeak(&location, self);
  uint64_t v10 = *(void *)a3;
  objc_copyWeak(&to, &location);
  uint64_t v15 = 0;
  uint64_t v13 = (void (**)(void **))&unk_1EF56C360;
  objc_moveWeak(&v14, &to);
  uint64_t v15 = (void **)&v13;
  objc_destroyWeak(&to);
  (*(void (**)(uint64_t, uint64_t, void, void (***)(void **)))(*(void *)v8 + 64))(v8, v10, 0, &v13);
  if (v15 == (void **)&v13)
  {
    v13[4]((void **)&v13);
  }
  else if (v15)
  {
    (*((void (**)(void))*v15 + 5))();
  }
  objc_destroyWeak(&location);
}

- (void)prepareRenderTask:
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x1A6239270);
}

- (id)prepareRenderTask:
{
  v1 = (id *)(a1 + 8);
  double v2 = (id *)operator new(0x10uLL);
  *double v2 = &unk_1EF56C360;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)prepareRenderTask:
{
  return a1;
}

- (BOOL)hasRenderTarget
{
  return *((void *)self + 24) != 0;
}

- (void)destroyRenderTarget
{
  if (*((void *)self + 17) >= 2uLL)
  {
    uint64_t v3 = 1;
    int v4 = 1;
    do
    {
      uint64_t v5 = (void *)((char *)self + 16 * v3 + 224);
      uint64_t v6 = (std::__shared_weak_count *)v5[1];
      void *v5 = 0;
      v5[1] = 0;
      if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, SEL))v6->__on_zero_shared)(v6, a2);
        std::__shared_weak_count::__release_weak(v6);
      }
      v7 = (void *)((char *)self + 16 * v3 + 328);
      uint64_t v8 = (std::__shared_weak_count *)v7[1];
      void *v7 = 0;
      v7[1] = 0;
      if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, SEL))v8->__on_zero_shared)(v8, a2);
        std::__shared_weak_count::__release_weak(v8);
      }
      uint64_t v3 = ++v4;
    }
    while (*((void *)self + 17) > (unint64_t)v4);
  }
  uint64_t v9 = *((void *)self + 13);
  *((void *)self + 13) = 0;
  if (v9) {
    (*(void (**)(uint64_t, SEL))(*(void *)v9 + 8))(v9, a2);
  }
  uint64_t v10 = *((void *)self + 12);
  *((void *)self + 12) = 0;
  if (v10) {
    (*(void (**)(uint64_t, SEL))(*(void *)v10 + 8))(v10, a2);
  }
  v11 = (std::__shared_weak_count *)*((void *)self + 26);
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, SEL))v11->__on_zero_shared)(v11, a2);
    std::__shared_weak_count::__release_weak(v11);
  }
  uint64_t v12 = *((void *)self + 24);
  *((void *)self + 24) = 0;
  if (v12) {
    (*(void (**)(uint64_t, SEL))(*(void *)v12 + 8))(v12, a2);
  }
  uint64_t v13 = *((void *)self + 27);
  *((void *)self + 27) = 0;
  if (v13) {
    (*(void (**)(uint64_t, SEL))(*(void *)v13 + 8))(v13, a2);
  }
  id v14 = (std::__shared_weak_count *)*((void *)self + 40);
  *((void *)self + 39) = 0;
  *((void *)self + 40) = 0;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, SEL))v14->__on_zero_shared)(v14, a2);
    std::__shared_weak_count::__release_weak(v14);
  }
  uint64_t v15 = *((void *)self + 38);
  *((void *)self + 38) = 0;
  if (v15) {
    (*(void (**)(uint64_t, SEL))(*(void *)v15 + 8))(v15, a2);
  }
  *((unsigned char *)self + 80) = 0;
}

- (void)createRenderTarget
{
}

- (__IOSurface)flipImage
{
  CFRetain(*(CFTypeRef *)(*((void *)self + 12) + 160));
  [(GGLImageCanvas *)self sizeInPixels];
  uint64_t v3 = (char *)operator new(0x58uLL);
  *((void *)v3 + 1) = 0;
  *(void *)uint64_t v3 = &unk_1EF583858;
  *((void *)v3 + 5) = 0;
  *((void *)v3 + 6) = 0;
  *((void *)v3 + 4) = 0;
  *((_DWORD *)v3 + 14) = 0;
  *((void *)v3 + 2) = 0;
  *((void *)v3 + 3) = &unk_1EF55AE58;
  *(_OWORD *)(v3 + 60) = xmmword_1A28FD570;
  *(void *)(v3 + 76) = 0x100000000;
  *((_DWORD *)v3 + 21) = 0;
  uint64_t v5 = v3 + 24;
  uint64_t v6 = v3;
  operator new();
}

- (void)renderer
{
  return (void *)*((void *)self + 23);
}

- (const)linearFormat
{
  return (const RenderTargetFormat *)((char *)self + 272);
}

- (void)linearRenderTarget
{
  return (void *)*((void *)self + 38);
}

- (const)format
{
  return (const RenderTargetFormat *)((char *)self + 120);
}

- (void)setContentScale:(double)a3
{
  if (*((double *)self + 5) != a3)
  {
    *((double *)self + 5) = a3;
    *((_WORD *)self + 40) = 256;
  }
}

- (void)setSize:(CGSize)a3
{
  if (*((double *)self + 3) != a3.width || *((double *)self + 4) != a3.height)
  {
    *((void *)self + 3) = *(void *)&a3.width;
    *((void *)self + 4) = *(void *)&a3.height;
    *((_WORD *)self + 40) = 256;
  }
}

- (shared_ptr<ggl::BitmapDataBase>)bitmapData
{
  uint64_t v3 = v2;
  if (*((unsigned char *)self + 80))
  {
    int v4 = [(GGLImageCanvas *)self finalSurface];
    unsigned int v5 = *((_DWORD *)v4 + 17);
    if (v5 - 44 >= 0xE && ((v17 = v5 > 0xF, int v18 = (1 << v5) & 0xA800, !v17) ? (v19 = v18 == 0) : (v19 = 1), v19)) {
      uint64_t v6 = (CFStringRef *)MEMORY[0x1E4F1DC88];
    }
    else {
      uint64_t v6 = (CFStringRef *)MEMORY[0x1E4F1DC98];
    }
    v7 = CGColorSpaceCreateWithName(*v6);
    uint64_t v8 = (__IOSurface *)*((void *)v4 + 20);
    uint64_t v9 = (std::__shared_weak_count *)operator new(0x80uLL);
    v9->__shared_owners_ = 0;
    v9->__shared_weak_owners_ = 0;
    v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF588280;
    uint64_t v10 = v9 + 1;
    size_t Width = IOSurfaceGetWidth(v8);
    size_t Height = IOSurfaceGetHeight(v8);
    size_t v13 = 8 * IOSurfaceGetBytesPerElement(v8);
    size_t BytesPerRow = IOSurfaceGetBytesPerRow(v8);
    v9[1].__shared_owners_ = 0;
    v9[1].__shared_weak_owners_ = 0;
    v9[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF55B3E0;
    v9[2].__vftable = (std::__shared_weak_count_vtbl *)Width;
    v9[2].__shared_owners_ = Height;
    v9[2].__shared_weak_owners_ = 8;
    v9[3].__vftable = (std::__shared_weak_count_vtbl *)v13;
    v9[3].__shared_owners_ = BytesPerRow;
    v9[3].__shared_weak_owners_ = (uint64_t)CGColorSpaceRetain(v7);
    LODWORD(v9[4].__vftable) = 8198;
    v9[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF55F3D0;
    v9[4].__shared_owners_ = (uint64_t)v8;
    v9[4].__shared_weak_owners_ = IOSurfaceGetAllocSize(v8);
    LOBYTE(v9[5].__vftable) = 0;
    if (v8) {
      CFRetain(v8);
    }
    *(void *)&long long v15 = v9 + 1;
    *((void *)&v15 + 1) = v9;
    shared_weak_owners = (std::__shared_weak_count *)v9[1].__shared_weak_owners_;
    if (shared_weak_owners)
    {
      if (shared_weak_owners->__shared_owners_ != -1)
      {
LABEL_13:
        _OWORD *v3 = v15;
        CGColorSpaceRelease(v7);
        goto LABEL_20;
      }
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      v9[1].__shared_owners_ = (uint64_t)v10;
      v9[1].__shared_weak_owners_ = (uint64_t)v9;
      long long v20 = v15;
      std::__shared_weak_count::__release_weak(shared_weak_owners);
      long long v15 = v20;
    }
    else
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      v9[1].__shared_owners_ = (uint64_t)v10;
      v9[1].__shared_weak_owners_ = (uint64_t)v9;
    }
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      long long v21 = v15;
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      long long v15 = v21;
    }
    goto LABEL_13;
  }
  *double v2 = 0;
  v2[1] = 0;
LABEL_20:
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (BitmapDataBase *)self;
  return result;
}

- (void)imageTexture
{
  int v2 = *((unsigned __int8 *)self + 376);
  uint64_t v3 = [(GGLImageCanvas *)self renderTarget];
  uint64_t v4 = 184;
  if (!v2) {
    uint64_t v4 = 88;
  }
  return *(void **)&v3[v4];
}

- (BOOL)shouldRasterize
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GGLImageCanvas;
  [(GGLImageCanvas *)&v2 dealloc];
}

- (GGLImageCanvas)initWithSize:(CGSize)a3 scale:(double)a4 useMultisampling:(BOOL)a5 extraColorFormats:(const void *)a6 taskContext:(const void *)a7 device:(void *)a8 services:(void *)a9 signpostId:(unint64_t)a10
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)GGLImageCanvas;
  BOOL v19 = [(GGLImageCanvas *)&v51 init];
  long long v20 = v19;
  long long v21 = v19;
  if (v19)
  {
    *((void *)v19 + 61) = a9;
    *((CGFloat *)v19 + 3) = width;
    *((CGFloat *)v19 + 4) = height;
    *((double *)v19 + 5) = a4;
    v19[376] = a5;
    *((void *)v19 + 50) = a10;
    *((void *)v19 + 51) = a8;
    uint64_t v23 = *((void *)a8 + 1);
    uint64_t v22 = *((void *)a8 + 2);
    if (v22) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
    }
    v24 = (std::__shared_weak_count *)*((void *)v19 + 2);
    *((void *)v19 + 1) = v23;
    *((void *)v19 + 2) = v22;
    if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
    uint64_t v25 = (*(uint64_t (**)(void, void, void, void))(**((void **)a8 + 1) + 16))(*((void *)a8 + 1), *(void *)(*(void *)a7 + 16), *((void *)a8 + 3), *((void *)v21 + 50));
    uint64_t v26 = *((void *)v21 + 23);
    *((void *)v21 + 23) = v25;
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
    }
    if (v21[376]) {
      unsigned int v27 = 4;
    }
    else {
      unsigned int v27 = 1;
    }
    int v28 = *(_DWORD *)(*((void *)v21 + 1) + 60);
    v29 = operator new(4uLL);
    __p = v29;
    *(_DWORD *)v29 = v28;
    v49 = v29 + 4;
    v50 = v29 + 4;
    std::vector<ggl::PixelFormat>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ggl::PixelFormat const*>,std::__wrap_iter<ggl::PixelFormat const*>>((char **)&__p, v29 + 4, *(char **)a6, *((char **)a6 + 1), (uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 2);
    long long __dst = 0uLL;
    *((void *)&v53 + 1) = v27 | 0x1A00000000;
    unint64_t v30 = v49 - (unsigned char *)__p;
    *(void *)&long long v53 = (v49 - (unsigned char *)__p) >> 2;
    if (v49 == __p || (memcpy(&__dst, __p, v30 & 0xFFFFFFFFFFFFFFFCLL), v30 <= 0xF)) {
      bzero((char *)&__dst + v30, 16 - v30);
    }
    long long v31 = v53;
    *(_OWORD *)(v21 + 120) = __dst;
    *(_OWORD *)(v21 + 136) = v31;
    uint64_t v32 = *((void *)v21 + 1);
    int v33 = *(unsigned __int8 *)(v32 + 20);
    v21[82] = v33;
    if (!v33)
    {
      int v34 = *(_DWORD *)(v32 + 56);
      v35 = (char *)operator new(4uLL);
      v45 = v35;
      *(_DWORD *)v35 = v34;
      v46 = v35 + 4;
      v47 = v35 + 4;
      std::vector<ggl::PixelFormat>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ggl::PixelFormat const*>,std::__wrap_iter<ggl::PixelFormat const*>>(&v45, v35 + 4, *(char **)a6, *((char **)a6 + 1), (uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 2);
      v36 = v45;
      long long __dst = 0uLL;
      *((void *)&v53 + 1) = v27 | 0x1A00000000;
      unint64_t v37 = v46 - v45;
      *(void *)&long long v53 = (v46 - v45) >> 2;
      if (v46 == v45)
      {
        bzero((char *)&__dst + v37, 16 - v37);
        long long v39 = v53;
        *((_OWORD *)v21 + 17) = __dst;
        *((_OWORD *)v21 + 18) = v39;
        if (!v36) {
          goto LABEL_22;
        }
      }
      else
      {
        memcpy(&__dst, v45, v37 & 0xFFFFFFFFFFFFFFFCLL);
        if (v37 <= 0xF) {
          bzero((char *)&__dst + v37, 16 - v37);
        }
        long long v38 = v53;
        *((_OWORD *)v21 + 17) = __dst;
        *((_OWORD *)v21 + 18) = v38;
      }
      operator delete(v36);
    }
LABEL_22:
    unint64_t v40 = *((void *)v21 + 17);
    long long __dst = 0uLL;
    *(void *)&long long v53 = v40;
    *((void *)&v53 + 1) = 1;
    if (v40)
    {
      v41 = v20 + 120;
      uint64_t v42 = 4 * v40;
      memcpy(&__dst, v41, 4 * v40);
      if (v40 > 3)
      {
LABEL_27:
        long long v43 = v53;
        *(_OWORD *)(v21 + 152) = __dst;
        *(_OWORD *)(v21 + 168) = v43;
        operator new();
      }
    }
    else
    {
      uint64_t v42 = 0;
    }
    bzero((char *)&__dst + v42, 16 - v42);
    goto LABEL_27;
  }
  return 0;
}

- (void)_internalRenderTarget
{
  return (void *)*((void *)self + 13);
}

- (void)finalRenderTarget
{
  return (void *)*((void *)self + 24);
}

- (CGSize)sizeInPixels
{
  double v2 = *((double *)self + 5);
  double v3 = v2 * *((double *)self + 3);
  double v4 = *((double *)self + 4) * v2;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)willDealloc
{
  double v3 = (std::__shared_weak_count *)*((void *)self + 2);
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, SEL))v3->__on_zero_shared)(v3, a2);
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = *((void *)self + 12);
  *((void *)self + 12) = 0;
  if (v4) {
    (*(void (**)(uint64_t, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  uint64_t v5 = *((void *)self + 13);
  *((void *)self + 13) = 0;
  if (v5) {
    (*(void (**)(uint64_t, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  uint64_t v6 = (md::YFlipPass *)*((void *)self + 14);
  *((void *)self + 14) = 0;
  if (v6)
  {
    md::YFlipPass::~YFlipPass(v6);
    MEMORY[0x1A6239270]();
  }
  std::mutex::lock((std::mutex *)((char *)self + 416));
  v7 = (md::DebugConsoleManager *)*((void *)self + 60);
  if (v7)
  {
    *((void *)self + 60) = 0;
    md::DebugConsoleManager::~DebugConsoleManager(v7);
    MEMORY[0x1A6239270]();
  }
  std::mutex::unlock((std::mutex *)((char *)self + 416));
  uint64_t v8 = *((void *)self + 23);
  *((void *)self + 23) = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  uint64_t v9 = *((void *)self + 24);
  *((void *)self + 24) = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  uint64_t v10 = (std::__shared_weak_count *)*((void *)self + 26);
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  uint64_t v11 = *((void *)self + 27);
  *((void *)self + 27) = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  uint64_t v12 = (std::__shared_weak_count *)*((void *)self + 29);
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  size_t v13 = (std::__shared_weak_count *)*((void *)self + 31);
  *((void *)self + 30) = 0;
  *((void *)self + 31) = 0;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  id v14 = (std::__shared_weak_count *)*((void *)self + 33);
  *((void *)self + 32) = 0;
  *((void *)self + 33) = 0;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  uint64_t v15 = *((void *)self + 38);
  *((void *)self + 38) = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  uint64_t v16 = (std::__shared_weak_count *)*((void *)self + 40);
  *((void *)self + 39) = 0;
  *((void *)self + 40) = 0;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  BOOL v17 = (std::__shared_weak_count *)*((void *)self + 42);
  *((void *)self + 41) = 0;
  *((void *)self + 42) = 0;
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  int v18 = (std::__shared_weak_count *)*((void *)self + 44);
  *((void *)self + 43) = 0;
  *((void *)self + 44) = 0;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  BOOL v19 = (std::__shared_weak_count *)*((void *)self + 46);
  *((void *)self + 45) = 0;
  *((void *)self + 46) = 0;
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  long long v20 = (std::__shared_weak_count *)*((void *)self + 49);
  *((void *)self + 48) = 0;
  *((void *)self + 49) = 0;
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
}

- (void)finalSurface
{
  return (void *)*((void *)self + 12);
}

- (void)flipPass
{
  return (void *)*((void *)self + 14);
}

- (void)flipTarget
{
  return (void *)*((void *)self + 13);
}

- (void)renderTarget
{
  return (void *)*((void *)self + 24);
}

@end