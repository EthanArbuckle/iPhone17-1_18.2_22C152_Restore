uint64_t HgcShapeGradientBlend::Bind(HgcShapeGradientBlend *this, HGHandler *a2)
{
  (*(void (**)(HgcShapeGradientBlend *, HGHandler *))(*(void *)this + 192))(this, a2);
  return 0;
}

uint64_t HgcShapeGradientBlend::RenderTile(HgcShapeGradientBlend *this, HGTile *a2)
{
  int v2 = *((_DWORD *)a2 + 3) - *((_DWORD *)a2 + 1);
  if (v2 >= 1)
  {
    int v3 = 0;
    int v4 = *((_DWORD *)a2 + 2) - *(_DWORD *)a2;
    uint64_t v5 = *((void *)a2 + 2);
    uint64_t v6 = *((void *)a2 + 12);
    uint64_t v7 = 16 * *((int *)a2 + 22);
    uint64_t v8 = *((void *)a2 + 10);
    uint64_t v9 = 16 * *((int *)a2 + 26);
    uint64_t v10 = 16 * *((int *)a2 + 6);
    do
    {
      if (v4 < 4)
      {
        LODWORD(v17) = 0;
      }
      else
      {
        int v11 = 0;
        uint64_t v12 = 32;
        do
        {
          float32x4_t v13 = vmulq_f32(*(float32x4_t *)(v8 + v12 - 16), *(float32x4_t *)(v6 + v12 - 16));
          float32x4_t v14 = vmulq_f32(*(float32x4_t *)(v8 + v12), *(float32x4_t *)(v6 + v12));
          float32x4_t v15 = vmulq_f32(*(float32x4_t *)(v8 + v12 + 16), *(float32x4_t *)(v6 + v12 + 16));
          v16 = (float32x4_t *)(v5 + v12);
          v16[-2] = vmulq_f32(*(float32x4_t *)(v8 + v12 - 32), *(float32x4_t *)(v6 + v12 - 32));
          v16[-1] = v13;
          float32x4_t *v16 = v14;
          v16[1] = v15;
          v11 -= 4;
          v12 += 64;
        }
        while (v4 + v11 > 3);
        LODWORD(v17) = -v11;
      }
      if ((int)v17 < v4)
      {
        uint64_t v17 = v17;
        do
        {
          *(float32x4_t *)(v5 + 16 * v17) = vmulq_f32(*(float32x4_t *)(v8 + 16 * v17), *(float32x4_t *)(v6 + 16 * v17));
          ++v17;
        }
        while (v17 < v4);
      }
      ++v3;
      v8 += v7;
      v6 += v9;
      v5 += v10;
    }
    while (v3 != v2);
  }
  return 0;
}

uint64_t HgcShapeGradientBlend::GetDOD(HgcShapeGradientBlend *this, HGRenderer *a2, unsigned int a3, HGRect a4)
{
  if (a3 >= 2) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

uint64_t HgcShapeGradientBlend::GetROI(HgcShapeGradientBlend *this, HGRenderer *a2, unsigned int a3, HGRect a4)
{
  if (a3 >= 2) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

void HgcShapeGradientBlend::HgcShapeGradientBlend(HgcShapeGradientBlend *this)
{
  HGNode::HGNode((HGNode *)this);
  void *v1 = &unk_1F119A728;
  operator new();
}

void sub_1B7E4497C(_Unwind_Exception *a1)
{
  HGNode::~HGNode(v1);
  _Unwind_Resume(a1);
}

void HgcShapeGradientBlend::~HgcShapeGradientBlend(HGNode *this)
{
  *(void *)this = &unk_1F119A728;
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    MEMORY[0x1BA9BFBA0](v2, 0xC400A2AC0F1);
  }

  HGNode::~HGNode(this);
}

{
  void *v1;
  uint64_t vars8;

  HgcShapeGradientBlend::~HgcShapeGradientBlend(this);

  HGObject::operator delete(v1);
}

uint64_t HgcShapeGradientBlend::SetParameter(HgcShapeGradientBlend *this, float a2, float a3, float a4, float a5)
{
  return 0xFFFFFFFFLL;
}

uint64_t HgcShapeGradientBlend::GetParameter(HgcShapeGradientBlend *this, int a2, float *a3)
{
  return 0xFFFFFFFFLL;
}

PGContext *PGContextHelper::destroyPGContext(PGContext *this, const PGContext *a2)
{
  if (this)
  {
    PGContext::~PGContext(this);
    JUMPOUT(0x1BA9BFBA0);
  }
  return this;
}

uint64_t (*createPGContextPtr@<X0>(const ProGL::ContextHandle *a1@<X0>, void *a2@<X8>))(ProGL::ContextHandle *this)
{
  result = ProGL::ContextHandle::operator void (ProGL::ContextHandle::*)(void)const(a1);
  if (v4) {
    BOOL v5 = (v4 & 1 | (unint64_t)result) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = v5;
  if (result || !v6) {
    operator new();
  }
  *a2 = 0;
  a2[1] = 0;
  return result;
}

void PGInitPGContext(void)
{
}

void sub_1B7E44B74(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x1000C4000313F17);
  _Unwind_Resume(a1);
}

uint64_t PGGetPerThreadContext(void)
{
  {
    NSLog(&cfstr_Sperthreadcont.isa);
  }
  uint64_t v1 = pthread_getspecific(*v0);
  if (!v1) {
    operator new();
  }
  return *(void *)v1;
}

void sub_1B7E44C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void PGFindContext(EAGLContext *a1@<X0>, EAGLContext *a2@<X1>, void *a3@<X8>)
{
  if (a1)
  {
    ProGL::findContext((_anonymous_namespace_ *)a1, a2, v4);
    createPGContextPtr((const ProGL::ContextHandle *)v4, a3);
    ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)v4);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_1B7E44CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void PGFindContext(const ProGL::GL *a1@<X0>, void *a2@<X8>)
{
  ProGL::GL::getPGLContextHandle(a1, v3);
  createPGContextPtr((const ProGL::ContextHandle *)v3, a2);
  ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)v3);
}

void sub_1B7E44D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void PGContext::~PGContext(PGContext *this)
{
  ProGL::ContextHandle::~ContextHandle((PGContext *)((char *)this + 16));
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

uint64_t PGContext::getVirtualScreen(PGContext *this)
{
  return ProGL::ContextHandle::getVirtualScreen((PGContext *)((char *)this + 16));
}

uint64_t PGContext::setVirtualScreen(PGContext *this)
{
  return ProGL::ContextHandle::setVirtualScreen((PGContext *)((char *)this + 16));
}

void PGSetCurrentContextSentry::PGSetCurrentContextSentry(PGSetCurrentContextSentry *this)
{
  uint64_t v1 = ProGL::CurrentContextSentry::CurrentContextSentry(this);
  *((void *)v1 + 2) = 0;
  *((void *)v1 + 3) = 0;
}

void PGSetCurrentContextSentry::PGSetCurrentContextSentry(PGSetCurrentContextSentry *this, const PGContext *a2)
{
  if (a2)
  {
    uint64_t v4 = *((void *)a2 + 3);
    uint64_t v6 = *((void *)a2 + 2);
    uint64_t v7 = v4;
    if (v4) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  ProGL::CurrentContextSentry::CurrentContextSentry(this, (const ProGL::ContextHandle *)&v6);
  ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)&v6);
  BOOL v5 = (void *)((char *)this + 16);
  if (a2)
  {
    std::shared_ptr<OZStyle>::shared_ptr[abi:ne180100]<OZStyle,void>(v5, a2);
  }
  else
  {
    *BOOL v5 = 0;
    *((void *)this + 3) = 0;
  }
}

void sub_1B7E44DF8(_Unwind_Exception *a1)
{
  ProGL::CurrentContextSentry::~CurrentContextSentry(v1);
  _Unwind_Resume(a1);
}

void PGSetCurrentContextSentry::PGSetCurrentContextSentry(PGSetCurrentContextSentry *this, void *a2)
{
  uint64_t v4 = *(void *)(*a2 + 24);
  v6[0] = *(void *)(*a2 + 16);
  v6[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  ProGL::CurrentContextSentry::CurrentContextSentry(this, (const ProGL::ContextHandle *)v6);
  ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)v6);
  *((void *)this + 2) = *a2;
  uint64_t v5 = a2[1];
  *((void *)this + 3) = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
}

void sub_1B7E44EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void PGSetCurrentContextSentry::~PGSetCurrentContextSentry(PGSetCurrentContextSentry *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  ProGL::CurrentContextSentry::~CurrentContextSentry(this);
}

void PGPerThreadSetCurrentContextSentry::PGPerThreadSetCurrentContextSentry(PGPerThreadSetCurrentContextSentry *this)
{
  uint64_t v2 = (void *)PGGetPerThreadContext();
  int v3 = std::shared_ptr<OZStyle>::shared_ptr[abi:ne180100]<OZStyle,void>(this, v2);
  uint64_t v5 = *v3;
  uint64_t v4 = (ProGL::CurrentContextSentry *)(v3 + 2);
  uint64_t v6 = *(void *)(v5 + 24);
  v7[0] = *(void *)(v5 + 16);
  v7[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  ProGL::CurrentContextSentry::CurrentContextSentry(v4, (const ProGL::ContextHandle *)v7);
  ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)v7);
}

void sub_1B7E44F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)&a9);
  int v11 = *(std::__shared_weak_count **)(v9 + 8);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  _Unwind_Resume(a1);
}

void PGPerThreadSetCurrentContextSentry::~PGPerThreadSetCurrentContextSentry(PGPerThreadSetCurrentContextSentry *this)
{
  ProGL::CurrentContextSentry::~CurrentContextSentry((PGPerThreadSetCurrentContextSentry *)((char *)this + 16));
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void PGGetCurrentPGContext(void *a1@<X8>)
{
  uint64_t v2 = (EAGLContext *)[MEMORY[0x1E4F38D58] currentContext];

  PGFindContext(v2, v3, a1);
}

void std::shared_ptr<PGContext>::shared_ptr[abi:ne180100]<PGContext,PGContextDeleter,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B7E4507C(void *a1)
{
  __cxa_begin_catch(a1);
  PGContextHelper::destroyPGContext(v1, v2);
  __cxa_rethrow();
}

void sub_1B7E45090(_Unwind_Exception *a1)
{
}

PGContext *std::__shared_ptr_pointer<PGContext *,PGContextDeleter,std::allocator<PGContext>>::__on_zero_shared(uint64_t a1, const PGContext *a2)
{
  return PGContextHelper::destroyPGContext(*(PGContext **)(a1 + 24), a2);
}

uint64_t std::__shared_ptr_pointer<PGContext *,PGContextDeleter,std::allocator<PGContext>>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

uint64_t PCThreadSpecific<std::shared_ptr<PGContext>>::destroy(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    }
    JUMPOUT(0x1BA9BFBA0);
  }
  return result;
}

void PGTextureHelper::new2DTexture(PGTextureHelper *this, ProGL::GL *a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, unsigned int a8, unsigned int a9, const PCColorSpaceHandle *a10, void *a11)
{
}

void sub_1B7E45208(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x10A1C401276B8E6);
  _Unwind_Resume(a1);
}

void PGTextureHelper::new2DTexture(PGTextureHelper *this, const ProGL::TextureHandle *a2)
{
}

void sub_1B7E45294(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x10A1C401276B8E6);
  _Unwind_Resume(a1);
}

ProGL::Private::TextureImpl *PGCreateTextureFromPGLTexture@<X0>(void (**a1)(_anonymous_namespace_ **this)@<X0>, void *a2@<X8>)
{
  result = (ProGL::Private::TextureImpl *)ProGL::TextureHandle::operator void (ProGL::TextureHandle::*)(void)(a1);
  if (v5) {
    BOOL v6 = (v5 & 1 | (unint64_t)result) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  char v7 = v6;
  *a2 = 0;
  a2[1] = 0;
  if (result || (v7 & 1) == 0)
  {
    result = ProGL::TextureHandle::getTarget((ProGL::Private::TextureImpl **)a1);
    if (result == 3553) {
      PGTextureHelper::new2DTexture((PGTextureHelper *)a1, v8);
    }
  }
  return result;
}

void PGTexture::PGTexture(PGTexture *this, ProGL::GL *a2, int a3, int a4, CGColorSpace **a5, int a6, _anonymous_namespace_ *a7, _anonymous_namespace_ *a8)
{
  if (a3 >= 4096) {
    int v12 = 4096;
  }
  else {
    int v12 = a3;
  }
  if (v12 <= 1) {
    int v13 = 1;
  }
  else {
    int v13 = v12;
  }
  if (a4 >= 4096) {
    int v14 = 4096;
  }
  else {
    int v14 = a4;
  }
  if (v14 <= 1) {
    int v15 = 1;
  }
  else {
    int v15 = v14;
  }
  PCImage::PCImage((uint64_t)this, v13, v15, v16, v17, a5);
  *(void *)this = &unk_1F119A9F0;
  ProGL::createTexture(a2, v18);
}

void sub_1B7E45494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CGColorSpace *a9)
{
  PCCFRef<CGColorSpace *>::~PCCFRef(&a9);
  int v11 = *(std::__shared_weak_count **)(v9 + 72);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  PCImage::~PCImage((CGColorSpace **)v9);
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::glTypeToDepth(_anonymous_namespace_ *this)
{
  if ((this - 34234) >= 2) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 8;
  }
  if (((1 << (char)this) & 3) != 0) {
    unsigned int v2 = 8;
  }
  else {
    unsigned int v2 = 16;
  }
  if (((1 << (char)this) & 0x70) != 0) {
    unsigned int v2 = 32;
  }
  if ((this - 5120) <= 6) {
    return v2;
  }
  else {
    return v1;
  }
}

uint64_t anonymous namespace'::glFormatToNumberOfChannels(_anonymous_namespace_ *this)
{
  int v1 = this - 6406;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 3:
      return result;
    case 1:
      uint64_t result = 3;
      break;
    case 4:
      uint64_t result = 2;
      break;
    default:
      uint64_t result = 4;
      break;
  }
  return result;
}

void PGTexture::PGTexture(PGTexture *this, ProGL::Private::TextureImpl **a2)
{
  int Width = ProGL::TextureHandle::getWidth(a2);
  int Height = ProGL::TextureHandle::getHeight(a2);
  ActualInternalFormat = ProGL::TextureHandle::getActualInternalFormat(a2);
  ProGL::TextureHandle::getColorSpace(a2, v12);
  PCImage::PCImage((uint64_t)this, Width, Height, 32, v7, v12);
  PCCFRef<CGColorSpace *>::~PCCFRef(v12);
  uint64_t v8 = (uint64_t (**)(PGTexture *))&unk_1F119A9F0;
  *(void *)this = &unk_1F119A9F0;
  *((void *)this + 8) = *a2;
  uint64_t v9 = a2[1];
  *((void *)this + 9) = v9;
  if (v9)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v9 + 1, 1uLL, memory_order_relaxed);
    uint64_t v8 = *(uint64_t (***)(PGTexture *))this;
  }
  *((_DWORD *)this + 6) = 2;
  unsigned int v10 = v8[2](this);
  unsigned int v11 = (*(uint64_t (**)(PGTexture *))(*(void *)this + 24))(this);
  v12[0] = 0;
  v12[1] = 0;
  *(double *)&v12[2] = (double)v10;
  *(double *)&v12[3] = (double)v11;
  ProGL::TextureHandle::setTextureCoords((uint64_t *)this + 8, (uint64_t)v12);
  PCImage::getColorSpace(this, v12);
  ProGL::TextureHandle::setColorSpace((CGColorSpace **)this + 8, v12);
  PCCFRef<CGColorSpace *>::~PCCFRef(v12);
}

void sub_1B7E456F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CGColorSpace *a9)
{
  PCCFRef<CGColorSpace *>::~PCCFRef(&a9);
  unsigned int v11 = *(std::__shared_weak_count **)(v9 + 72);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  PCImage::~PCImage((CGColorSpace **)v9);
  _Unwind_Resume(a1);
}

void PGTexture::~PGTexture(PGTexture *this)
{
  *(void *)this = &unk_1F119A9F0;
  unsigned int v2 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  PCImage::~PCImage((CGColorSpace **)this);
}

ProGL::Private::TextureImpl *PGTexture::getSize(PGTexture *this)
{
  int v1 = (std::__shared_weak_count *)*((void *)this + 9);
  uint64_t v4 = (ProGL::Private::TextureImpl *)*((void *)this + 8);
  uint64_t v5 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Size = ProGL::TextureHandle::getSize(&v4);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return Size;
}

void sub_1B7E457EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t PGTexture::getPGLTexture@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 72);
  *a2 = *(void *)(this + 64);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

uint64_t PGTexture::bind(ProGL::Private::TextureImpl **this)
{
  ProGL::GL::GL((ProGL::GL *)v4);
  this += 8;
  GLenum Target = ProGL::TextureHandle::getTarget(this);
  ProGL::TextureHandle::bind((OZChannelBase **)this, (ProGL::GL *)v4, Target);
  ProGL::GL::~GL((ProGL::GL *)v4);
  return 1;
}

void sub_1B7E45878(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ProGL::GL::~GL((ProGL::GL *)va);
  _Unwind_Resume(a1);
}

uint64_t PGTexture::unbind(OZChannelBase **this)
{
  ProGL::GL::GL((ProGL::GL *)v3);
  ProGL::TextureHandle::unbind(this + 8, (ProGL::GL *)v3);
  ProGL::GL::~GL((ProGL::GL *)v3);
  return 1;
}

void sub_1B7E458D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ProGL::GL::~GL((ProGL::GL *)va);
  _Unwind_Resume(a1);
}

uint64_t PGTexture::enable(ProGL::Private::TextureImpl **this)
{
  GLenum Target = ProGL::TextureHandle::getTarget(this + 8);
  glEnable(Target);
  return 1;
}

uint64_t PGTexture::disable(ProGL::Private::TextureImpl **this)
{
  ProGL::GL::GL((ProGL::GL *)v3);
  PGTexture::disable(this, (ProGL::GL *)v3);
  ProGL::GL::~GL((ProGL::GL *)v3);
  return 1;
}

void sub_1B7E45954(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ProGL::GL::~GL((ProGL::GL *)va);
  _Unwind_Resume(a1);
}

uint64_t PGTexture::disable(ProGL::Private::TextureImpl **this, ProGL::GL *a2)
{
  int v3 = (OZChannelBase **)(this + 8);
  if (ProGL::TextureHandle::isBound(this + 8))
  {
    ProGL::TextureHandle::unbind(v3, a2);
  }
  else
  {
    GLenum Target = ProGL::TextureHandle::getTarget((ProGL::Private::TextureImpl **)v3);
    glBindTexture(Target, 0);
  }
  return 1;
}

void PGTexture::setParameteri(OZChannelBase **this, GLenum a2, GLint a3)
{
  ProGL::GL::GL((ProGL::GL *)v6);
  ProGL::TextureHandle::texParameter(this + 8, (ProGL::GL *)v6, a2, a3);
  ProGL::GL::~GL((ProGL::GL *)v6);
}

void sub_1B7E45A18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ProGL::GL::~GL((ProGL::GL *)va);
  _Unwind_Resume(a1);
}

double PGTexture::setTexCoords(uint64_t a1, float32x2_t *a2)
{
  float64x2_t v2 = vcvtq_f64_f32(a2[1]);
  v4[0] = vcvtq_f64_f32(*a2);
  v4[1] = v2;
  *(void *)&double result = ProGL::TextureHandle::setTextureCoords((uint64_t *)(a1 + 64), (uint64_t)v4).n128_u64[0];
  return result;
}

float64_t PGTexture::getTexCoords(uint64_t a1, float32x4_t *a2)
{
  ProGL::TextureHandle::getTextureCoords((ProGL::TextureHandle *)(a1 + 64), (__n128 *)&v4);
  float64_t result = v5.f64[0];
  *a2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v4), v5);
  return result;
}

double PGTexture::getTexCoords(PGTexture *this, double *a2, double *a3, double *a4, double *a5)
{
  ProGL::TextureHandle::getTextureCoords((PGTexture *)((char *)this + 64), &v13);
  __n128 v9 = v13;
  double v10 = v14;
  double v11 = v15;
  *a2 = v13.n128_f64[0];
  *a3 = v9.n128_f64[0] + v10;
  *a4 = v9.n128_f64[1];
  double result = v9.n128_f64[1] + v11;
  *a5 = v9.n128_f64[1] + v11;
  return result;
}

void PGTexture::getContext(PGTexture *this@<X0>, void *a2@<X8>)
{
  ProGL::TextureHandle::getContext((PGTexture *)((char *)this + 64), v3);
  ProGL::GL::GL((ProGL::GL *)v4, (const ProGL::ContextHandle *)v3);
  PGFindContext((const ProGL::GL *)v4, a2);
  ProGL::GL::~GL((ProGL::GL *)v4);
  ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)v3);
}

void sub_1B7E45B6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  ProGL::GL::~GL((ProGL::GL *)va1);
  ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)va);
  _Unwind_Resume(a1);
}

ProGL::Private::TextureImpl *PGTexture::getFormat(ProGL::Private::TextureImpl **this)
{
  return ProGL::TextureHandle::getActualInternalFormat(this + 8);
}

uint64_t PGTexture::getAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (ProGL::Private::TextureImpl **)a1;
  PCImage::getAttributes(a1, a2);
  v3 += 8;
  *(_DWORD *)(a2 + 32) = ProGL::TextureHandle::getTarget(v3);
  ActualInternalFormat = ProGL::TextureHandle::getActualInternalFormat(v3);
  uint64_t result = PCPixelFormat::getPixelFormat(ActualInternalFormat, 5125);
  *(_DWORD *)(a2 + 20) = result;
  return result;
}

void PGTexture::toBitmap(PGTexture *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1B7E45C28()
{
  void *v0 = 0;
  v0[1] = 0;
}

CGColorSpace **PGTexture::setColorSpace(CGColorSpace **this, CGColorSpace **a2)
{
  PCImage::setColorSpace((uint64_t)this, a2);
  PCImage::getColorSpace((PCImage *)this, &v4);
  ProGL::TextureHandle::setColorSpace(this + 8, &v4);
  return PCCFRef<CGColorSpace *>::~PCCFRef(&v4);
}

void sub_1B7E45C8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  _Unwind_Resume(a1);
}

void PGTexture2D::PGTexture2D(PGTexture2D *this, ProGL::GL *a2, int a3, int a4, CGColorSpace **a5, int a6, int a7, int a8, unsigned int a9, unsigned int a10, void *a11)
{
}

void sub_1B7E45E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  PGTexture::~PGTexture(v12);
  _Unwind_Resume(a1);
}

void PGTexture2D::PGTexture2D(PGTexture2D *this, ProGL::Private::TextureImpl **a2)
{
  PGTexture::PGTexture(this, a2);
  *(void *)float64x2_t v4 = &unk_1F119AA50;
  int Width = PCImage::getWidth(v4);
  *((_DWORD *)this + 20) = Width + 2 * ProGL::TextureHandle::getBorder(a2);
  int v6 = (*(uint64_t (**)(PGTexture2D *))(*(void *)this + 24))(this);
  *((_DWORD *)this + 21) = v6 + 2 * ProGL::TextureHandle::getBorder(a2);
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  ProGL::GL::GL((ProGL::GL *)v10);
  int v7 = (std::__shared_weak_count *)*((void *)this + 9);
  uint64_t v8 = (OZChannelBase *)*((void *)this + 8);
  __n128 v9 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ProGL::TextureHandle::bind(&v8, (ProGL::GL *)v10, 0xDE1u);
  PGTexture::disable((ProGL::Private::TextureImpl **)this, (ProGL::GL *)v10);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  ProGL::GL::~GL((ProGL::GL *)v10);
}

void sub_1B7E45F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  double v14 = (std::__shared_weak_count *)*((void *)v12 + 12);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  PGTexture::~PGTexture(v12);
  _Unwind_Resume(a1);
}

void PGTexture2D::~PGTexture2D(PGTexture2D *this)
{
  *(void *)this = &unk_1F119AA50;
  float64x2_t v2 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  PGTexture::~PGTexture(this);
}

{
  uint64_t vars8;

  PGTexture2D::~PGTexture2D(this);

  JUMPOUT(0x1BA9BFBA0);
}

CGColorSpace **PGTexture2D::setBitmapRef(ProGL::Private::TextureImpl **a1, PCImage **a2)
{
  PGTexture::bind(a1);
  GLenum Target = ProGL::TextureHandle::getTarget(a1 + 8);
  GLint Border = ProGL::TextureHandle::getBorder(a1 + 8);
  GLint v6 = ProGL::TextureHandle::getBorder(a1 + 8);
  GLsizei v7 = (*((uint64_t (**)(ProGL::Private::TextureImpl **))*a1 + 2))(a1);
  GLsizei v8 = (*((uint64_t (**)(ProGL::Private::TextureImpl **))*a1 + 3))(a1);
  GLenum ActualInternalFormat = ProGL::TextureHandle::getActualInternalFormat(a1 + 8);
  pixels = (const GLvoid *)(*(uint64_t (**)(void))(**((void **)*a2 + 8) + 16))(*((void *)*a2 + 8));
  glTexSubImage2D(Target, 0, Border, v6, v7, v8, ActualInternalFormat, 0x1405u, pixels);
  glFlush();
  PGTexture::unbind((OZChannelBase **)a1);
  PCImage::getColorSpace(*a2, &v12);
  (*((void (**)(ProGL::Private::TextureImpl **, CGColorSpace **))*a1 + 7))(a1, &v12);
  return PCCFRef<CGColorSpace *>::~PCCFRef(&v12);
}

void sub_1B7E46198(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  _Unwind_Resume(a1);
}

void PGTexture2D::setDataPtr(ProGL::Private::TextureImpl **this, const void *a2, GLenum a3, GLenum a4)
{
  PGTexture::bind(this);
  GLenum Target = ProGL::TextureHandle::getTarget(this + 8);
  GLint Border = ProGL::TextureHandle::getBorder(this + 8);
  GLint v10 = ProGL::TextureHandle::getBorder(this + 8);
  GLsizei v11 = (*((uint64_t (**)(ProGL::Private::TextureImpl **))*this + 2))(this);
  GLsizei v12 = (*((uint64_t (**)(ProGL::Private::TextureImpl **))*this + 3))(this);
  glTexSubImage2D(Target, 0, Border, v10, v11, v12, a3, a4, a2);
  glFlush();
  PGTexture::unbind((OZChannelBase **)this);
  __n128 v13 = (std::__shared_weak_count *)this[12];
  this[11] = 0;
  this[12] = 0;
  if (v13)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

void PGTexture2D::setDataPtr(ProGL::Private::TextureImpl **this, const void *a2, int a3, int a4, GLsizei a5, GLsizei a6, GLenum a7, GLenum a8)
{
  PGTexture::bind(this);
  GLenum Target = ProGL::TextureHandle::getTarget(this + 8);
  GLint v17 = ProGL::TextureHandle::getBorder(this + 8) + a3;
  unsigned int Border = ProGL::TextureHandle::getBorder(this + 8);
  glTexSubImage2D(Target, 0, v17, Border + a4, a5, a6, a7, a8, a2);
  glFlush();
  PGTexture::unbind((OZChannelBase **)this);
  v19 = (std::__shared_weak_count *)this[12];
  this[11] = 0;
  this[12] = 0;
  if (v19)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
}

CGColorSpace **PGTexture2D::dumpImage(ProGL::Private::TextureImpl **this)
{
  float64x2_t v2 = this + 8;
  ProGL::TextureHandle::getTarget(this + 8);
  ProGL::TextureHandle::getName(v2);
  (*((void (**)(ProGL::Private::TextureImpl **))*this + 2))(this);
  (*((void (**)(ProGL::Private::TextureImpl **))*this + 3))(this);
  (*((void (**)(ProGL::Private::TextureImpl **))*this + 6))(this);
  PCImage::getColorSpace((PCImage *)this, &v6);
  PGTexture::getContext((PGTexture *)this, &v4);
  PCColorSpaceHandle::getCGColorSpace((PCColorSpaceHandle *)&v6);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return PCCFRef<CGColorSpace *>::~PCCFRef(&v6);
}

void sub_1B7E464C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__shared_weak_count *a4, ...)
{
  va_start(va, a4);
  if (a4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a4);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  _Unwind_Resume(a1);
}

void PGTexture2D::toTexture(PCImage **a1@<X0>, void *a2@<X8>)
{
  PCDynamicCast<PGTexture2D,PCImage>((uint64_t)a1, &v15);
  if (v15)
  {
    uint64_t v4 = v16;
    *a2 = v15;
    a2[1] = v4;
  }
  else
  {
    PCDynamicCast<PCBitmap,PCImage>((uint64_t)a1, &v13);
    if (v13)
    {
      unsigned int v5 = (*(uint64_t (**)(void))(**(void **)(v13 + 64) + 48))(*(void *)(v13 + 64));
      int GLDataFormat = PCPixelFormat::getGLDataFormat(v5);
      unsigned int GLDataType = PCPixelFormat::getGLDataType(v5);
      PGPerThreadSetCurrentContextSentry::PGPerThreadSetCurrentContextSentry((PGPerThreadSetCurrentContextSentry *)v12);
      unsigned int v8 = (*(uint64_t (**)(void))(*(void *)*a1 + 16))();
      unsigned int v9 = (*(uint64_t (**)(void))(*(void *)*a1 + 24))();
      PCImage::getColorSpace(*a1, &v11);
      GLint v10 = (const PCColorSpaceHandle *)(*(uint64_t (**)(void))(**(void **)(v13 + 64) + 16))(*(void *)(v13 + 64));
      PGMake2DTexture((ProGL::GL *)v8, v9, (const PCColorSpaceHandle *)&v11, 0, GLDataFormat, GLDataType, v10);
    }
    *a2 = 0;
    a2[1] = 0;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
}

void sub_1B7E46688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(a1);
}

void PGMake2DTexture(ProGL::GL *a1, uint64_t a2, const PCColorSpaceHandle *a3, uint64_t a4, int a5, unsigned int a6, const PCColorSpaceHandle *a7)
{
  unsigned int v11 = a3;
  ProGL::GL::GL((ProGL::GL *)v15);
  PGTextureHelper::new2DTexture((PGTextureHelper *)v15, a1, a2, a4, a5, 0, a5, a6, v11, a7, v14);
}

void sub_1B7E46774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ProGL::GL::~GL((ProGL::GL *)va);
  _Unwind_Resume(a1);
}

void PGInitTextures(void)
{
}

void sub_1B7E467F8(_Unwind_Exception *a1)
{
  PCSingleton::~PCSingleton(v1);
  MEMORY[0x1BA9BFBA0](v1, 0x81C40B8603338);
  _Unwind_Resume(a1);
}

uint64_t PGCreateImage@<X0>(const PCImageAttributes *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  if (*(_DWORD *)a1 == 2)
  {
    uint64_t v3 = (const PGContext *)*((void *)a1 + 8);
    if (!v3) {
      uint64_t v3 = (const PGContext *)PGGetPerThreadContext();
    }
    PGSetCurrentContextSentry::PGSetCurrentContextSentry((PGSetCurrentContextSentry *)v7, v3);
    int GLDataFormat = PCPixelFormat::getGLDataFormat(*((_DWORD *)a1 + 5));
    unsigned int GLDataType = PCPixelFormat::getGLDataType(*((_DWORD *)a1 + 5));
    if (*((_DWORD *)a1 + 8) == 3553) {
      PGMake2DTexture((ProGL::GL *)*((unsigned int *)a1 + 1), *((unsigned int *)a1 + 2), (const PCImageAttributes *)((char *)a1 + 24), 0, GLDataFormat, GLDataType, *((const PCColorSpaceHandle **)a1 + 6));
    }
    PGSetCurrentContextSentry::~PGSetCurrentContextSentry((PGSetCurrentContextSentry *)v7);
  }
  else if (*(_DWORD *)a1 == 1)
  {
    operator new();
  }
  return PCImage::setIsPremultiplied(0, *((unsigned char *)a1 + 40));
}

void sub_1B7E469BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PGSetCurrentContextSentry::~PGSetCurrentContextSentry((PGSetCurrentContextSentry *)va);
  _Unwind_Resume(a1);
}

void PGCreatePooledImage(const PCImageAttributes *a1@<X0>, void *a2@<X8>)
{
  if (*(_DWORD *)a1 == 1)
  {
    PGCreateImage(a1, a2);
  }
  else
  {
    unsigned int v4 = *((_DWORD *)a1 + 8);
    int v5 = *((_DWORD *)a1 + 1);
    int v6 = *((_DWORD *)a1 + 2);
    int GLInternalFormat = PCPixelFormat::getGLInternalFormat(*((_DWORD *)a1 + 5));
    ProGL::getCurrentContext(&v12);
    ProGL::TextureDescription::TextureDescription((ProGL::TextureDescription *)v14, v4, v5, v6, GLInternalFormat, (const ProGL::ContextHandle *)&v12);
    ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)&v12);
    ProGL::findTextureInPool((ProGL *)v14, &v12);
    unsigned int v8 = ProGL::TextureHandle::operator void (ProGL::TextureHandle::*)(void)(&v12);
    if (v9) {
      BOOL v10 = (v9 & 1 | (unint64_t)v8) == 0;
    }
    else {
      BOOL v10 = 1;
    }
    int v11 = !v10;
    if (v8 || v11)
    {
      if (v15 == 3553) {
        PGTextureHelper::new2DTexture((PGTextureHelper *)&v12, v9);
      }
      if (operator!=((void *)a1 + 3)) {
        (*(void (**)(void, char *))(MEMORY[0] + 56))(0, (char *)a1 + 24);
      }
      PCImage::setIsPremultiplied(0, *((unsigned char *)a1 + 40));
      *a2 = 0;
      a2[1] = 0;
    }
    else
    {
      PGCreateImage(a1, a2);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)v14);
  }
}

void sub_1B7E46BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, std::__shared_weak_count *a5, ...)
{
  va_start(va, a5);
  if (a5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a5);
  }
  ProGL::ContextHandle::~ContextHandle((ProGL::ContextHandle *)va);
  _Unwind_Resume(a1);
}

void anonymous namespace'::TextureSingleton::~TextureSingleton(_anonymous_namespace_::TextureSingleton *this)
{
  *(void *)this = &unk_1F119AAE0;
  PGLCleanup(this);

  PCSingleton::~PCSingleton(this);
}

{
  uint64_t vars8;

  JUMPOUT(0x1BA9BFBA0);
}

void std::shared_ptr<PGTexture2D>::shared_ptr[abi:ne180100]<PGTexture2D,PGTextureHelper,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B7E46D1C(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    std::shared_ptr<PCBitmap>::shared_ptr[abi:ne180100]<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)10>>>,void>(v1);
  }
  __cxa_rethrow();
}

void sub_1B7E46D34(_Unwind_Exception *a1)
{
}

uint64_t std::__shared_ptr_pointer<PGTexture2D *,PGTextureHelper,std::allocator<PGTexture2D>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<PGTexture2D *,PGTextureHelper,std::allocator<PGTexture2D>>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

float64x2_t PGImaging::gaussianBlurRect(char a1, float64x2_t *a2, float64x2_t *a3, float64x2_t result)
{
  float64x2_t v4 = a2[1];
  *a3 = *a2;
  a3[1] = v4;
  if ((a1 & 1) == 0)
  {
    int v5 = vcvtpd_s64_f64(result.f64[0] + result.f64[0]);
    uint64_t result = vsubq_f64(a3[1], (float64x2_t)vdupq_lane_s64(COERCE__INT64(-(double)v5 - (double)v5), 0));
    *a3 = vsubq_f64(*a3, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v5), 0));
    a3[1] = result;
  }
  return result;
}

float64x2_t PGImaging::outlineRect(float64x2_t *a1, float64x2_t *a2, double a3)
{
  *(double *)&uint64_t v3 = a3 + a3;
  float64x2_t result = vsubq_f64(*a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  float64x2_t v5 = vaddq_f64((float64x2_t)vdupq_lane_s64(v3, 0), a1[1]);
  *a2 = result;
  a2[1] = v5;
  return result;
}

void PGProgram::PGProgram(PGProgram *this, int a2, const char *a3)
{
  *(void *)this = &unk_1F119AB78;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((unsigned char *)this + 16) = 1;
}

void PGProgram::~PGProgram(PGProgram *this)
{
  *(void *)this = &unk_1F119AB78;
  if (*((void *)this + 3))
  {
    float64x2_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
    uint64_t v4 = *((void *)this + 3);
    float64x2_t v5 = v2;
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    PGSetCurrentContextSentry::PGSetCurrentContextSentry(v6, &v4);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    glDeleteProgram(*((_DWORD *)this + 3));
    PGSetCurrentContextSentry::~PGSetCurrentContextSentry((PGSetCurrentContextSentry *)v6);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  uint64_t vars8;

  PGProgram::~PGProgram(this);

  JUMPOUT(0x1BA9BFBA0);
}

void PGProgram::enable(PGProgram *this)
{
}

void PGProgram::disable(PGProgram *this)
{
}

void PGProgram::setLocalParameter(PGProgram *this, float a2, float a3, float a4, float a5)
{
}

uint64_t anonymous namespace'::PGInfoImpl::instance(_anonymous_namespace_::PGInfoImpl *this)
{
  {
    uint64_t v4 = &v2;
    uint64_t v3 = &v4;
  }
}

uint64_t PGInfo::getMaxTextureSize(PGInfo *this, int a2)
{
  int v3 = (int)this;
  uint64_t v5 = 1;
  if (a2 != 16) {
    uint64_t v5 = 2;
  }
  if (a2 == 8) {
    uint64_t v5 = 0;
  }
  return *(void *)(*(void *)(v4 + 8) + 48 * v3 + 8 * v5 + 24);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<anonymous namespace'::PGInfoImpl::instance(void)::$_0 &&>>()
{
}

void sub_1B7E471B8(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *((void *)v1 + 2) = v4;
    operator delete(v4);
  }
  PCSingleton::~PCSingleton(v1);
  MEMORY[0x1BA9BFBA0](v1, 0xA1C4030951706);
  _Unwind_Resume(a1);
}

void anonymous namespace'::PGInfoImpl::~PGInfoImpl(_anonymous_namespace_::PGInfoImpl *this)
{
  *(void *)this = &unk_1F119ABD8;
  PGLCleanup(this);
  char v2 = (void *)*((void *)this + 1);
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }

  PCSingleton::~PCSingleton(this);
}

{
  uint64_t vars8;

  JUMPOUT(0x1BA9BFBA0);
}

uint64_t PGHelium::Instance(PGHelium *this)
{
  if (PGHelium::Instance(void)::once != -1) {
    dispatch_once(&PGHelium::Instance(void)::once, &__block_literal_global_87);
  }
  return PGHelium::_instance;
}

void ___ZN8PGHelium8InstanceEv_block_invoke()
{
}

void sub_1B7E47344(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x10A1C4047070A01);
  _Unwind_Resume(a1);
}

uint64_t PGHelium::purge(PGHelium *this)
{
  if (PGHelium::_instance) {
    return PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::clear(*(void *)(PGHelium::_instance + 8));
  }
  return result;
}

void PGHelium::PGHelium(PGHelium *this)
{
  PCSingleton::PCSingleton(this, 0);
  OZChannelBase::setRangeName(v2, v3);
  *(void *)this = &unk_1F119AC30;
  PCCache<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::PCCache();
}

void sub_1B7E47420(_Unwind_Exception *a1)
{
  PCCache<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::~PCCache(v2);
  PCSingleton::~PCSingleton(v1);
  _Unwind_Resume(a1);
}

void PGHelium::~PGHelium(PGHelium *this)
{
  *(void *)this = &unk_1F119AC30;
  PGHelium::_instance = 0;
  PCCache<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::~PCCache((uint64_t *)this + 1);

  PCSingleton::~PCSingleton(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F119AC30;
  PGHelium::_instance = 0;
  PCCache<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::~PCCache((uint64_t *)this + 1);
  PCSingleton::~PCSingleton(this);

  JUMPOUT(0x1BA9BFBA0);
}

const void *PGHelium::acquireRenderer@<X0>(void *a1@<X1>, void *a2@<X8>)
{
  uint64_t result = (const void *)*a1;
  if (*(_DWORD *)(*a1 + 8))
  {
    {
      uint64_t v11 = a1[1];
      if (v11) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
      }
    }
    PCPrint("File %s, line %d should not have been reached:\n\t", v4, v5, v6, v7, v8, v9, v10, (char)"/Library/Caches/com.apple.xbs/Sources/MotioniOS/ProGraphics/PGHelium.cpp");
    pcAbortImpl();
  }
  *a2 = 0;
  a2[1] = 0;
  return result;
}

void sub_1B7E47610(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t PGHelium::convertPCMatrix44@<X0>(long long *a1@<X0>, HGTransform **a2@<X8>)
{
  uint64_t v4 = (HGTransform *)HGObject::operator new(0x90uLL);
  HGTransform::HGTransform(v4);
  long long v5 = a1[5];
  long long v19 = a1[4];
  long long v20 = v5;
  long long v6 = a1[7];
  long long v21 = a1[6];
  long long v22 = v6;
  long long v7 = a1[1];
  long long v14 = *a1;
  long long v15 = v7;
  long long v8 = a1[3];
  long long v16 = a1[2];
  uint64_t v9 = *((void *)&v14 + 1);
  long long v10 = v15;
  uint64_t v11 = *((void *)&v19 + 1);
  *((void *)&v14 + 1) = v16;
  *(void *)&long long v15 = v19;
  uint64_t v12 = *((void *)&v20 + 1);
  *((void *)&v15 + 1) = v21;
  *(void *)&long long v16 = v9;
  *(void *)&long long v19 = v10;
  *((void *)&v19 + 1) = v8;
  uint64_t v17 = v11;
  uint64_t v18 = *((void *)&v21 + 1);
  *((void *)&v20 + 1) = v22;
  *(void *)&long long v21 = *((void *)&v10 + 1);
  *a2 = v4;
  *((void *)&v21 + 1) = *((void *)&v8 + 1);
  *(void *)&long long v22 = v12;
  return (*(uint64_t (**)(HGTransform *, long long *))(*(void *)v4 + 72))(v4, &v14);
}

void sub_1B7E476EC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

double PGHelium::convertHGTransform@<D0>(PGHelium *this@<X0>, const HGTransform *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (*(uint64_t (**)(PGHelium *, const HGTransform *))(*(void *)this + 272))(this, a2);
  uint64_t v5 = 0;
  *(void *)(a3 + 120) = 0x3FF0000000000000;
  *(void *)(a3 + 80) = 0x3FF0000000000000;
  *(void *)(a3 + 40) = 0x3FF0000000000000;
  *(void *)a3 = 0x3FF0000000000000;
  *(_OWORD *)(a3 + 8) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  do
  {
    double result = *(double *)(v4 + 8 * v5);
    *(double *)(a3 + 32 * (v5 & 3) + 8 * (v5 >> 2)) = result;
    ++v5;
  }
  while (v5 != 16);
  return result;
}

uint64_t PGHelium::convertBitsPerChannel(PGHelium *this, int a2, int a3)
{
  return PGHelium::makeFormat(this, a2, a3, a2 > 8);
}

uint64_t PGHelium::makeFormat(PGHelium *this, int a2, int a3, int a4)
{
  if (a2 < 16 && a4)
  {
    exception = (PCException *)__cxa_allocate_exception(0x40uLL);
    PCString::PCString(&v13, "floating-point format must be at least 16 bits");
    PCException::PCException(exception, &v13);
    *(void *)exception = &unk_1F1199218;
  }
  if (a2 > 16 && (a4 & 1) == 0)
  {
    uint64_t v11 = (PCException *)__cxa_allocate_exception(0x40uLL);
    PCString::PCString(&v13, "integer format must be no more than 16 bits");
    PCException::PCException(v11, &v13);
    *(void *)uint64_t v11 = &unk_1F1199218;
  }
  switch((int)this)
  {
    case 1:
      if (a2 == 8) {
        return 1;
      }
      if (a2 == 32) {
        return 7;
      }
      if (a2 != 16) {
        goto LABEL_39;
      }
      BOOL v4 = a4 == 0;
      unsigned int v5 = 3;
      unsigned int v6 = 5;
      goto LABEL_28;
    case 2:
      if (a2 == 8) {
        return 10;
      }
      if (a2 == 32) {
        return 13;
      }
      if (a2 != 16) {
        goto LABEL_39;
      }
      BOOL v7 = a4 == 0;
      unsigned int v8 = 11;
LABEL_22:
      if (v7) {
        uint64_t result = v8;
      }
      else {
        uint64_t result = v8 + 1;
      }
      break;
    case 3:
      if (a2 == 8) {
        return 17;
      }
      if (a2 == 32) {
        return 21;
      }
      if (a2 != 16) {
        goto LABEL_39;
      }
      BOOL v7 = a4 == 0;
      unsigned int v8 = 19;
      goto LABEL_22;
    case 4:
      switch(a2)
      {
        case 32:
          return 28;
        case 16:
          BOOL v4 = a4 == 0;
          unsigned int v5 = 25;
          unsigned int v6 = 27;
          break;
        case 8:
          BOOL v4 = a3 == 0;
          unsigned int v5 = 24;
          unsigned int v6 = 22;
          break;
        default:
LABEL_39:
          uint64_t v12 = (PCException *)__cxa_allocate_exception(0x40uLL);
          PCString::PCString(&v13, "format not supported");
          PCException::PCException(v12, &v13);
          *(void *)uint64_t v12 = &unk_1F1199218;
      }
LABEL_28:
      if (v4) {
        uint64_t result = v5;
      }
      else {
        uint64_t result = v6;
      }
      break;
    default:
      goto LABEL_39;
  }
  return result;
}

void sub_1B7E47A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCString a10)
{
}

uint64_t PGHelium::makeFormat(int a1)
{
  if ((a1 - 1) > 0x10) {
    return 0;
  }
  else {
    return dword_1B8388B54[a1 - 1];
  }
}

uint64_t PGHelium::createBitmapNode@<X0>(uint64_t a1@<X0>, unsigned int *a2@<X1>, int a3@<W2>, unsigned int *a4@<X3>, HGBitmapLoader **a5@<X8>)
{
  if (!*(void *)a1)
  {
    exception = (PCException *)__cxa_allocate_exception(0x40uLL);
    PCString::PCString(v46, "null img");
    PCException::PCException(exception, v46);
    *(void *)exception = &unk_1F1199218;
  }
  PCDynamicCast<PCBitmap,PCImage>(a1, v46);
  PCDynamicCast<PGTexture,PCImage>(a1, &v44);
  int v10 = (*(uint64_t (**)(void))(**(void **)a1 + 16))();
  int v11 = (*(uint64_t (**)(void))(**(void **)a1 + 24))();
  int v13 = *(_DWORD *)(*(void *)a1 + 36);
  uint64_t v12 = (PGHelium *)*(unsigned int *)(*(void *)a1 + 40);
  if (v46[0].var0)
  {
    unsigned int v14 = (*(uint64_t (**)(void *))(*(void *)v46[0].var0[2].isa + 48))(v46[0].var0[2].isa);
    if (v14 >= 0x12) {
      unsigned int v15 = 0;
    }
    else {
      unsigned int v15 = (0x20018u >> v14) & 1;
    }
  }
  else
  {
    unsigned int v15 = 0;
    if (v44) {
      goto LABEL_10;
    }
  }
  if (v46[0].var0)
  {
    int v16 = (*(uint64_t (**)(void *))(*(void *)v46[0].var0[2].isa + 48))(v46[0].var0[2].isa);
    uint64_t Format = PGHelium::makeFormat(v16);
    goto LABEL_11;
  }
LABEL_10:
  uint64_t Format = PGHelium::makeFormat(v12, v13, v15, v13 > 8);
LABEL_11:
  uint64_t v18 = Format;
  unsigned int v19 = *a2;
  if (a3)
  {
    unsigned int v20 = a2[1];
    if (!a4) {
      goto LABEL_22;
    }
LABEL_21:
    *a4 = v19;
    a4[1] = v20;
    a4[2] = v10;
    a4[3] = v11;
    goto LABEL_22;
  }
  if (v10 >= 0) {
    int v21 = v10;
  }
  else {
    int v21 = v10 + 1;
  }
  v19 -= v21 >> 1;
  if (v11 >= 0) {
    int v22 = v11;
  }
  else {
    int v22 = v11 + 1;
  }
  unsigned int v20 = a2[1] - (v22 >> 1);
  if (a4) {
    goto LABEL_21;
  }
LABEL_22:
  uint64_t v23 = HGRectMake4i(v19, v20, v19 + v10, v20 + v11);
  uint64_t v25 = v24;
  var0 = v46[0].var0;
  if (!v46[0].var0)
  {
    (*(void (**)(long long *__return_ptr))(**(void **)a1 + 72))(&v43);
    long long v27 = v43;
    long long v43 = 0uLL;
    v28 = v46[1].var0;
    *(_OWORD *)&v46[0].var0 = v27;
    if (v28)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28);
      if (*((void *)&v43 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v43 + 1));
      }
    }
    var0 = v46[0].var0;
  }
  Representation = (const void *)PCBitmap::getRepresentation((PCBitmap *)var0);
  if (Representation
  {
    uint64_t FactoryForSerialization = OZFactoryBase::getFactoryForSerialization((uint64_t)v30);
    v32 = (HGBitmap *)FactoryForSerialization;
    if (FactoryForSerialization) {
      (*(void (**)(uint64_t))(*(void *)FactoryForSerialization + 16))(FactoryForSerialization);
    }
    *(void *)((char *)v32 + 20) = v23;
    *(void *)((char *)v32 + 28) = v25;
    *(void *)((char *)v32 + 36) = v23;
    *(void *)((char *)v32 + 44) = v25;
    (*(void (**)(HGBitmap *))(*(void *)v32 + 16))(v32);
    (*(void (**)(HGBitmap *))(*(void *)v32 + 24))(v32);
  }
  else
  {
    uint64_t v33 = (*(uint64_t (**)(void *))(*(void *)v46[0].var0[2].isa + 16))(v46[0].var0[2].isa);
    unsigned int BytesPerRow = PCBitmap::getBytesPerRow((PCBitmap *)v46[0].var0);
    v35 = (HGObject *)HGObject::operator new(0x20uLL);
    v36 = v35;
    v38 = v46[0].var0;
    v37 = (std::__shared_weak_count *)v46[1].var0;
    if (v46[1].var0) {
      atomic_fetch_add_explicit(&v46[1].var0->info, 1uLL, memory_order_relaxed);
    }
    HGObject::HGObject(v35);
    *(void *)v36 = &unk_1F1151608;
    *((void *)v36 + 2) = v38;
    *((void *)v36 + 3) = v37;
    if (v37)
    {
      atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v37);
    }
    v32 = (HGBitmap *)HGObject::operator new(0x80uLL);
    HGBitmap::HGBitmap(v32, v23, v25, v18, v33, BytesPerRow);
    HGBitmap::SetStorage(v32, v36);
    *((void *)v32 + 9) = PCBitmap::getAllocationSize((PCBitmap *)v46[0].var0);
    (*(void (**)(HGBitmap *))(*(void *)v32 + 16))(v32);
    (*(void (**)(HGBitmap *))(*(void *)v32 + 24))(v32);
    (*(void (**)(HGObject *))(*(void *)v36 + 24))(v36);
  }
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  }
  if (v46[1].var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v46[1].var0);
  }
  v39 = (HGTexture *)HGObject::operator new(0x80uLL);
  *(void *)&v47.var0 = v23;
  *(void *)&v47.var2 = v25;
  HGTexture::HGTexture(v39, v47, v32);
  v40 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v40, (HGBitmap *)v39);
  *a5 = v40;
  if (v39) {
    (*(void (**)(HGTexture *))(*(void *)v39 + 24))(v39);
  }
  return (*(uint64_t (**)(HGBitmap *))(*(void *)v32 + 24))(v32);
}

void sub_1B7E48054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, PCString a13, std::__shared_weak_count *a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B7E481D8()
{
  if (v0) {
    JUMPOUT(0x1B7E481E8);
  }
  JUMPOUT(0x1B7E48208);
}

void PGHelium::createTextureNode(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int *a3@<X2>, int a4@<W3>, unsigned int *a5@<X4>, HGBitmapLoader **a6@<X8>)
{
  PCDynamicCast<PGTexture,PCImage>(a1, &v34);
  if (v34)
  {
    unsigned int Name = ProGL::TextureHandle::getName((HGGLBlendingInfo **)(v34 + 64));
    int Format = PGHelium::makeFormat((PGHelium *)*(unsigned int *)(v34 + 40), *(_DWORD *)(v34 + 36), 0, *(_DWORD *)(v34 + 36) > 8);
    unsigned int v14 = (*(uint64_t (**)(void))(**(void **)a1 + 16))();
    unsigned int v15 = (*(uint64_t (**)(void))(**(void **)a1 + 24))();
    unsigned int v16 = *a3;
    if (a4)
    {
      unsigned int v17 = a3[1];
      if (!a5)
      {
LABEL_5:
        uint64_t v18 = HGRectMake4i(v16, v17, v16 + v14, v17 + v15);
        uint64_t v20 = v19;
        int v21 = (HGBitmap *)HGObject::operator new(0xC8uLL);
        HGGLTexture::HGGLTexture((uint64_t)v21, v18, v20, Format, a2, Name, 1);
        int v22 = (HGObject *)HGObject::operator new(0x20uLL);
        uint64_t v23 = v22;
        uint64_t v25 = v34;
        uint64_t v24 = v35;
        if (v35) {
          atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        HGObject::HGObject(v22);
        *(void *)uint64_t v23 = &unk_1F1151608;
        *((void *)v23 + 2) = v25;
        *((void *)v23 + 3) = v24;
        if (v24)
        {
          atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        }
        HGBitmap::SetStorage(v21, v23);
        v26 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
        HGBitmapLoader::HGBitmapLoader(v26, v21);
        *a6 = v26;
        (*(void (**)(HGObject *))(*(void *)v23 + 24))(v23);
        if (v21) {
          (*(void (**)(HGBitmap *))(*(void *)v21 + 24))(v21);
        }
        goto LABEL_14;
      }
    }
    else
    {
      unsigned int v27 = (*(uint64_t (**)(uint64_t))(*(void *)v34 + 16))(v34);
      unsigned int v28 = a3[1];
      v16 -= v27 >> 1;
      unsigned int v17 = v28 - ((*(unsigned int (**)(uint64_t))(*(void *)v34 + 24))(v34) >> 1);
      if (!a5) {
        goto LABEL_5;
      }
    }
    *a5 = v16;
    a5[1] = v17;
    a5[2] = v14;
    a5[3] = v15;
    goto LABEL_5;
  }
  PCDynamicCast<PCBitmap,PCImage>(a1, &v32);
  if (v32)
  {
    exception = (PCException *)__cxa_allocate_exception(0x40uLL);
    PCString::PCString(&v31, "not implemented yet");
    PCString::PCString(&v30, "/Library/Caches/com.apple.xbs/Sources/MotioniOS/ProGraphics/PGHelium.cpp");
    PCException::PCException(exception, &v31, &v30, 758);
    *(void *)exception = &unk_1F10B1208;
  }
  *a6 = 0;
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
LABEL_14:
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
}

void sub_1B7E48580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCString a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14)
{
  PCString::~PCString((PCString *)&a9);
  PCString::~PCString(&a10);
  if (v15) {
    __cxa_free_exception(v14);
  }
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(a1);
}

void PGHelium::renderNodeToBitmap(uint64_t a1, uint64_t *a2, unsigned int *a3, int a4)
{
  HGRectMake4i(*a3, a3[1], a3[2] + *a3, a3[3] + a3[1]);
  PGHelium::makeFormat(a4);
  if ((int)a3[2] >= 1 && (int)a3[3] > 0)
  {
    uint64_t v8 = *a2;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
    }
    operator new();
  }
  operator new();
}

void sub_1B7E48B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  RendererMutexLocker::~RendererMutexLocker((PCMutex **)va);
  (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
  (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
  }
  uint64_t v9 = *(std::__shared_weak_count **)(v5 + 8);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (a3) {
    (*(void (**)(uint64_t))(*(void *)a3 + 24))(a3);
  }
  _Unwind_Resume(a1);
}

BOOL LockAndRenderSoftware(HGRenderer *lpsrc, uint64_t a2, uint64_t a3, void *a4)
{
  RendererMutexLocker::RendererMutexLocker((RendererMutexLocker *)v10, lpsrc);
  (*(void (**)(HGRenderer *, uint64_t, uint64_t))(*(void *)lpsrc + 120))(lpsrc, 19, a3);
  (*(void (**)(HGRenderer *, uint64_t, void))(*(void *)lpsrc + 64))(lpsrc, a2, *a4);
  BOOL v8 = (*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)lpsrc + 128))(lpsrc, 13) == 0;
  RendererMutexLocker::~RendererMutexLocker(v10);
  return v8;
}

void sub_1B7E48DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, PCMutex *a9)
{
}

void PGHelium::renderNodeToMetalTexture(const void *a1@<X0>, uint64_t *a2@<X1>, unsigned int *a3@<X2>, unsigned int a4@<W3>, HGGLBlendingInfo *a5@<X5>, void *a6@<X8>)
{
  uint64_t v11 = *a2;
  uint64_t v20 = v11;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 16))(v11);
  }
  uint64_t v12 = HGRectMake4i(*a3, a3[1], a3[2] + *a3, a3[3] + a3[1]);
  uint64_t v14 = v13;
  int BitsPerChannel = PCPixelFormat::getBitsPerChannel(a4);
  int Format = PGHelium::makeFormat((PGHelium *)4, BitsPerChannel, a4 == 3, BitsPerChannel > 8);
  int DstAlphaFactor = HGGLBlendingInfo::GetDstAlphaFactor(a5);
  int v18 = PCBitDepth::getBitsPerChannel(DstAlphaFactor);
  PGHelium::makeFormat((PGHelium *)4, v18, 0, v18 > 8);
  if (a1) {
  else
  }
    uint64_t v19 = 0;
  LockAndRenderMetal(v19, v12, v14, Format, &v20, a6);
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 24))(v11);
  }
}

void sub_1B7E48F84(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  }
  _Unwind_Resume(exception_object);
}

void LockAndRenderMetal(HGRenderer *lpsrc@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t *a5@<X4>, void *a6@<X8>)
{
  RendererMutexLocker::RendererMutexLocker((RendererMutexLocker *)v18, lpsrc);
  uint64_t v12 = *a5;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 16))(v12);
  }
  HGRendererOutput::HGRendererOutput((uint64_t)v17, v12, a2, a3, a4, 5);
  HGRenderer::RenderNode(lpsrc, (const HGRendererOutput *)v17, (char *)1, &lpsrca);
  *a6 = 0;
  uint64_t v13 = lpsrca;
  if (lpsrca)
  {
    if (!v14
      || (v15 = v14, (*(void (**)(void *))(*(void *)v14 + 16))(v14), *a6 = v15, (uint64_t v13 = lpsrca) != 0))
    {
      (*(void (**)(void *))(*(void *)v13 + 24))(v13);
    }
  }
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 24))(v12);
  }
  RendererMutexLocker::~RendererMutexLocker(v18);
}

void sub_1B7E49170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 24))(a2);
  }
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
  }
  RendererMutexLocker::~RendererMutexLocker((PCMutex **)va);
  _Unwind_Resume(a1);
}

void PGHelium::renderNodeToTexture(const void *a1@<X0>, uint64_t *a2@<X1>, unsigned int *a3@<X2>, unsigned int a4@<W3>, HGGLBlendingInfo *a5@<X5>, int a6@<W6>, void *a7@<X8>)
{
  uint64_t v12 = *a2;
  uint64_t v29 = v12;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 16))(v12);
  }
  uint64_t v13 = HGRectMake4i(*a3, a3[1], a3[2] + *a3, a3[3] + a3[1]);
  uint64_t v15 = v14;
  int BitsPerChannel = PCPixelFormat::getBitsPerChannel(a4);
  int Format = PGHelium::makeFormat((PGHelium *)4, BitsPerChannel, a4 == 3, BitsPerChannel > 8);
  int DstAlphaFactor = HGGLBlendingInfo::GetDstAlphaFactor(a5);
  int v19 = PCBitDepth::getBitsPerChannel(DstAlphaFactor);
  uint64_t v20 = PGHelium::makeFormat((PGHelium *)4, v19, 0, v19 > 8);
  if (!a1
  {
    operator new();
  }
  int v22 = v21;
  LockAndRenderHardware(v21, v13, v15, Format, &v29, v20, (uint64_t *)&v28);
  if (v28)
  {
    if (a6 && (*((unsigned char *)v28 + 12) & 1) != 0)
    {
      RawGLTexture = (HGBitmap *)HGGPURenderer::GetRawGLTexture(v22, v28, v23);
      if (v28 == RawGLTexture)
      {
        if (RawGLTexture) {
          (*(void (**)(HGBitmap *))(*(void *)RawGLTexture + 24))(RawGLTexture);
        }
      }
      else
      {
        if (v28) {
          (*(void (**)(void))(*(void *)v28 + 24))();
        }
        unsigned int v28 = RawGLTexture;
      }
    }
    HGGPURenderer::GetCurrentContext(v22, (uint64_t *)v30);
    CGColorSpace = (ProGL *)PCColorSpaceHandle::getCGColorSpace((PCColorSpaceHandle *)v30);
    PCSharedCount::PCSharedCount(v30);
    uint64_t OwningRenderQueue = HGRenderer::GetOwningRenderQueue(v22);
    if (OwningRenderQueue) {
      LiRenderQueueTextureOwner::create((uint64_t *)&v28, OwningRenderQueue, (uint64_t)v30);
    }
    LiHelium::createExternallyOwnedTexture((uint64_t)&v28, (EAGLContext *)a3[2], a3[3], CGColorSpace);
  }
  *a7 = 0;
  a7[1] = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 24))(v12);
  }
}

void sub_1B7E49674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, PCSharedCount a17, uint64_t a18)
{
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 24))(v18);
  }
  if (a15) {
    (*(void (**)(uint64_t))(*(void *)a15 + 24))(a15);
  }
  if (a16) {
    (*(void (**)(uint64_t))(*(void *)a16 + 24))(a16);
  }
  _Unwind_Resume(exception_object);
}

void LockAndRenderHardware(HGRenderer *lpsrc@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  RendererMutexLocker::RendererMutexLocker((RendererMutexLocker *)v18, lpsrc);
  uint64_t v14 = *a5;
  uint64_t v17 = v14;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
  }
  LiHelium::setUpGLRenderer(lpsrc, a6);
  HGRendererOutput::HGRendererOutput((uint64_t)v16, v17, a2, a3, a4, 4);
  HGRenderer::RenderNode(lpsrc, (const HGRendererOutput *)v16, (char *)1, &v15);
  LiHelium::bitmapToTexture(&v15, (uint64_t)lpsrc, a7);
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
  }
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 24))(v17);
  }
  RendererMutexLocker::~RendererMutexLocker(v18);
}

void sub_1B7E49978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  RendererMutexLocker::~RendererMutexLocker((PCMutex **)va);
  _Unwind_Resume(a1);
}

void RendererMutexLocker::RendererMutexLocker(RendererMutexLocker *this, HGRenderer *lpsrc)
{
  {
  }
  {
  }
  if (lpsrc
  {
  }
  else
  {
  }
  *(void *)this = v4;
  *((unsigned char *)this + 8) = 0;
  PCMutex::lock(v4);
  *((unsigned char *)this + 8) = 1;
}

void sub_1B7E49B70(_Unwind_Exception *a1)
{
}

void RendererMutexLocker::~RendererMutexLocker(PCMutex **this)
{
  char v2 = *this;
  if (v2)
  {
    if (*((unsigned char *)this + 8))
    {
      PCMutex::unlock(v2);
      *((unsigned char *)this + 8) = 0;
    }
  }
}

uint64_t PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::clear(uint64_t a1)
{
  uint64_t v1 = (void *)a1;
  char v2 = (PCMutex *)(a1 + 16);
  PCMutex::lock((PCMutex *)(a1 + 16));
  int v3 = (void *)v1[12];
  v1 += 12;
  std::__tree<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::__map_value_compare<std::pair<HGMTLDeviceType,PCHash128>,std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::less<std::pair<HGMTLDeviceType,PCHash128>>,true>,std::allocator<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>>>::destroy((uint64_t)(v1 - 1), v3);
  *(v1 - 1) = v1;
  void *v1 = 0;
  v1[1] = 0;
  v1[3] = v1[2];
  v1[6] = 0;
  return PCMutex::unlock(v2);
}

void std::__tree<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::__map_value_compare<std::pair<HGMTLDeviceType,PCHash128>,std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::less<std::pair<HGMTLDeviceType,PCHash128>>,true>,std::allocator<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::__map_value_compare<std::pair<HGMTLDeviceType,PCHash128>,std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::less<std::pair<HGMTLDeviceType,PCHash128>>,true>,std::allocator<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::__map_value_compare<std::pair<HGMTLDeviceType,PCHash128>,std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::less<std::pair<HGMTLDeviceType,PCHash128>>,true>,std::allocator<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>>>::destroy(a1, a2[1]);
    PGHelium::MetalTextureCacheEntry::~MetalTextureCacheEntry((PGHelium::MetalTextureCacheEntry *)(a2 + 7));
    operator delete(a2);
  }
}

void PCCache<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::PCCache()
{
}

void sub_1B7E49CE4(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x10A0C407F3B7D27);
  _Unwind_Resume(a1);
}

uint64_t PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::PCCacheImpl(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  PCMutex::PCMutex((PCMutex *)(a1 + 16));
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 88) = a1 + 96;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = -1;
  *(void *)(a1 + 160) = a2;
  *(void *)(a1 + 168) = 0;
  return a1;
}

void sub_1B7E49D5C(_Unwind_Exception *exception_object)
{
  int v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *PCCache<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::~PCCache(uint64_t *a1)
{
  return a1;
}

uint64_t std::unique_ptr<PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::~PCCacheImpl(result);
    JUMPOUT(0x1BA9BFBA0);
  }
  return result;
}

uint64_t PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::~PCCacheImpl(uint64_t a1)
{
  char v2 = *(void **)(a1 + 112);
  if (v2)
  {
    *(void *)(a1 + 120) = v2;
    operator delete(v2);
  }
  std::__tree<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::__map_value_compare<std::pair<HGMTLDeviceType,PCHash128>,std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::less<std::pair<HGMTLDeviceType,PCHash128>>,true>,std::allocator<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>>>::destroy(a1 + 88, *(void **)(a1 + 96));
  PCMutex::~PCMutex((PCMutex *)(a1 + 16));
  int v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  return a1;
}

uint64_t PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::setMaxCost(uint64_t a1, unint64_t a2)
{
  BOOL v4 = (PCMutex *)(a1 + 16);
  PCMutex::lock((PCMutex *)(a1 + 16));
  *(void *)(a1 + 152) = a2;
  if (!*(void *)(a1 + 168))
  {
    while (*(void *)(a1 + 144) > a2 || *(void *)(a1 + 104) > *(void *)(a1 + 160))
    {
      uint64_t v6 = *(uint64_t ***)(a1 + 112);
      if (v6 == *(uint64_t ***)(a1 + 120)) {
        break;
      }
      uint64_t v9 = *v6;
      PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,std::__tree_node<std::__value_type<std::pair<HGMTLDeviceType,PCHash128>,PCCacheImpl<std::pair<HGMTLDeviceType,PCHash128>,PGHelium::MetalTextureCacheEntry,PCMutex,std::less<std::pair<HGMTLDeviceType,PCHash128>>>::Data>,void *> *,long>>>::remove((uint64_t *)(a1 + 112), (uint64_t)&v9);
      uint64_t v7 = v9;
      BOOL v8 = (PGHelium::MetalTextureCacheEntry *)(v9 + 7);
      *(void *)(a1 + 144) -= v9[28];
      std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__remove_node_pointer((uint64_t **)(a1 + 88), v7);
      PGHelium::MetalTextureCacheEntry::~MetalTextureCacheEntry(v8);
      operator delete(v7);
      a2 = *(void *)(a1 + 152);
    }
  }
  return PCMutex::unlock(v4);
}

void sub_1B7E49F40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PGTextureCache::instance(PGTextureCache *this)
{
  if (PGTextureCache::instance(void)::once != -1) {
    dispatch_once(&PGTextureCache::instance(void)::once, &__block_literal_global_88);
  }
  return _instance;
}

void ___ZN14PGTextureCache8instanceEv_block_invoke()
{
}

void sub_1B7E49FDC(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x10A1C4093209011);
  _Unwind_Resume(a1);
}

void PGTextureCache::PGTextureCache(PGTextureCache *this)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  PCSingleton::PCSingleton(this, 100);
  *char v2 = &unk_1F119ACB8;
  ProGL::Init::Init((ProGL::Init *)(v2 + 1));
  *((void *)this + 2) = 0;
  *((unsigned char *)this + 40) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  operator new();
}

void sub_1B7E4A1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v12 = v11;
  MEMORY[0x1BA9BFBA0](v12, 0x20C4093837F09);
  std::vector<std::shared_ptr<HGGPUComputeDevice const>>::__destroy_vector::operator()[abi:ne180100](&a9);
  ProGL::Init::~Init(v10);
  PCSingleton::~PCSingleton(v9);
  _Unwind_Resume(a1);
}

void **std::vector<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>::push_back[abi:ne180100](uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v18[4] = result;
    uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<HGGPUComputeDevice const>>>((uint64_t)result, v13);
    uint64_t v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)uint64_t v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    std::vector<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>::__swap_out_circular_buffer(a1, v18);
    uint64_t v9 = (void *)a1[1];
    uint64_t result = std::__split_buffer<std::shared_ptr<TXTextObject>>::~__split_buffer(v18);
  }
  else
  {
    *uint64_t v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_1B7E4A33C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::shared_ptr<TXTextObject>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void PGTextureCache::disableLimits(PGTextureCache *this)
{
  uint64_t v1 = (uint64_t **)*((void *)this + 2);
  char v2 = (uint64_t **)*((void *)this + 3);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    v1 += 2;
    PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::disableLimits(*v3);
  }
}

void PGTextureCache::enableLimits(PGTextureCache *this)
{
  uint64_t v1 = (uint64_t **)*((void *)this + 2);
  char v2 = (uint64_t **)*((void *)this + 3);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    v1 += 2;
    PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::enableLimits(*v3);
  }
}

BOOL PGTextureCache::add(PGTextureCache *this, uint64_t *a2, long long *a3, int a4, PCHash128 *a5)
{
  int v5 = *((unsigned __int8 *)this + 40);
  if (!*((unsigned char *)this + 40))
  {
    if (!*a2) {
      goto LABEL_15;
    }
    PGTexture::getPGLTexture(*a2, &v25);
    unint64_t v11 = ProGL::TextureHandle::operator void (ProGL::TextureHandle::*)(void)(&v25);
    if (v12) {
      BOOL v13 = (v12 & 1 | (unint64_t)v11) == 0;
    }
    else {
      BOOL v13 = 1;
    }
    int v15 = v13 && v11 == 0;
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
    if (!v15)
    {
      uint64_t v16 = *a2;
      long long v17 = (std::__shared_weak_count *)a2[1];
      uint64_t v25 = (void (*)(_anonymous_namespace_ **))*a2;
      v26 = v17;
      if (v17)
      {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v16 = *a2;
      }
      long long v18 = a3[3];
      long long v29 = a3[2];
      long long v30 = v18;
      long long v19 = a3[1];
      long long v27 = *a3;
      long long v28 = v19;
      long long v20 = a3[7];
      long long v33 = a3[6];
      long long v34 = v20;
      long long v21 = a3[5];
      long long v31 = a3[4];
      long long v32 = v21;
      int v22 = *(uint64_t **)(*((void *)this + 2) + 16 * a4);
      unint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16);
      PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::addValue(*v22, a5, (uint64_t *)&v25, v23);
      if (v26) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v26);
      }
    }
    else
    {
LABEL_15:
      PGTextureCache::remove(this, a5);
    }
  }
  return v5 == 0;
}

void sub_1B7E4A4FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void PGTextureCache::remove(PGTextureCache *this, const PCHash128 *a2)
{
  if (!*((unsigned char *)this + 40))
  {
    char v2 = (uint64_t **)*((void *)this + 2);
    uint64_t v3 = (uint64_t **)*((void *)this + 3);
    while (v2 != v3)
    {
      int v5 = *v2;
      v2 += 2;
      PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::removeKey(*v5, a2);
    }
  }
}

void PGTextureCache::find(uint64_t a1@<X0>, int a2@<W1>, const PCHash128 *a3@<X2>, unsigned char *a4@<X3>, void *a5@<X8>)
{
  uint64_t v7 = **(void **)(*(void *)(a1 + 16) + 16 * a2);
  char v16 = 0;
  PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::findValue(v7, a3, &v16, (uint64_t)&v13);
  uint64_t v8 = v13;
  if (v13)
  {
    if (a4 && v15 != a4)
    {
      for (uint64_t i = 0; i != 128; i += 32)
      {
        uint64_t v10 = &a4[i];
        long long v11 = *(_OWORD *)&v15[i + 16];
        *uint64_t v10 = *(_OWORD *)&v15[i];
        v10[1] = v11;
      }
    }
    uint64_t v12 = v14;
    *a5 = v8;
    a5[1] = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *a5 = 0;
    a5[1] = 0;
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

BOOL PGTextureCache::add(PGTextureCache *a1, uint64_t *a2, HGGPUComputeDevice **a3, PCHash128 *a4)
{
  int GLVirtualScreen = HGGPUComputeDevice::GetGLVirtualScreen(*a3);
  uint64_t v18 = 0x3FF0000000000000;
  uint64_t v15 = 0x3FF0000000000000;
  uint64_t v12 = 0x3FF0000000000000;
  uint64_t v9 = 0x3FF0000000000000;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  return PGTextureCache::add(a1, a2, (long long *)&v9, GLVirtualScreen, a4);
}

void PGTextureCache::find(uint64_t a1@<X0>, HGGPUComputeDevice **a2@<X1>, const PCHash128 *a3@<X2>, unsigned char *a4@<X3>, void *a5@<X8>)
{
  int GLVirtualScreen = HGGPUComputeDevice::GetGLVirtualScreen(*a2);

  PGTextureCache::find(a1, GLVirtualScreen, a3, a4, a5);
}

void PGTextureCache::clear(PGTextureCache *this)
{
  uint64_t v1 = (os_unfair_lock_s ***)*((void *)this + 2);
  char v2 = (os_unfair_lock_s ***)*((void *)this + 3);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    v1 += 2;
    PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::clear(*v3);
  }
}

void PGTextureCache::~PGTextureCache(PGTextureCache *this)
{
  PGTextureCache::~PGTextureCache(this);

  JUMPOUT(0x1BA9BFBA0);
}

{
  ProGL::Init *v2;
  void **v3;

  *(void *)this = &unk_1F119ACB8;
  char v2 = (PGTextureCache *)((char *)this + 8);
  uint64_t v3 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<HGGPUComputeDevice const>>::__destroy_vector::operator()[abi:ne180100](&v3);
  ProGL::Init::~Init(v2);
  PCSingleton::~PCSingleton(this);
}

void std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>::shared_ptr[abi:ne180100]<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B7E4A804(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>::reset[abi:ne180100]((os_unfair_lock_s ***)va, 0);
  _Unwind_Resume(a1);
}

os_unfair_lock_s **std::__shared_ptr_pointer<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>> *,std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>::__shared_ptr_default_delete<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>,PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>,std::allocator<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(os_unfair_lock_s ***)(a1 + 24);
  if (result)
  {
    PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::~PCCache(result);
    JUMPOUT(0x1BA9BFBA0);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>> *,std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>::__shared_ptr_default_delete<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>,PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>,std::allocator<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

os_unfair_lock_s **PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::~PCCache(os_unfair_lock_s **a1)
{
  return a1;
}

void PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::clear(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1;
  char v2 = a1 + 4;
  PCSpinLock::lock(a1 + 4);
  uint64_t v3 = *(void **)&v1[8]._os_unfair_lock_opaque;
  v1 += 8;
  std::__tree<std::__value_type<PCHash128,LiTextureStoreToken>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,LiTextureStoreToken>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,LiTextureStoreToken>>>::destroy((uint64_t)&v1[-2], v3);
  *(void *)&v1[-2]._os_unfair_lock_opaque = v1;
  *(void *)&v1->_os_unfair_lock_opaque = 0;
  *(void *)&v1[2]._os_unfair_lock_opaque = 0;
  *(void *)&v1[6]._os_unfair_lock_opaque = *(void *)&v1[4]._os_unfair_lock_opaque;
  *(void *)&v1[12]._os_unfair_lock_opaque = 0;
  PCSpinLock::unlock(v2);
}

uint64_t std::unique_ptr<PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::~PCCacheImpl(result);
    JUMPOUT(0x1BA9BFBA0);
  }
  return result;
}

uint64_t PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::~PCCacheImpl(uint64_t a1)
{
  char v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  std::__tree<std::__value_type<PCHash128,LiTextureStoreToken>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,LiTextureStoreToken>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,LiTextureStoreToken>>>::destroy(a1 + 24, *(void **)(a1 + 32));
  PCSpinLock::~PCSpinLock((PCSpinLock *)(a1 + 16));
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  return a1;
}

os_unfair_lock_s **std::unique_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>::reset[abi:ne180100](os_unfair_lock_s ***a1, os_unfair_lock_s **a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::~PCCache(result);
    JUMPOUT(0x1BA9BFBA0);
  }
  return result;
}

uint64_t std::vector<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>,std::reverse_iterator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>*>,std::reverse_iterator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>*>,std::reverse_iterator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>,std::reverse_iterator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>*>,std::reverse_iterator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>*>,std::reverse_iterator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>,std::reverse_iterator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>>,std::reverse_iterator<std::shared_ptr<PCCache<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TXTextObject>>,std::reverse_iterator<std::shared_ptr<TXTextObject>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::setMaxCost(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (os_unfair_lock_s *)(a1 + 16);
  PCSpinLock::lock((os_unfair_lock_t)(a1 + 16));
  *(void *)(a1 + 88) = a2;
  if (!*(void *)(a1 + 104))
  {
    while (*(void *)(a1 + 80) > *(void *)(a1 + 88) || *(void *)(a1 + 40) > *(void *)(a1 + 96))
    {
      uint64_t v5 = *(uint64_t ***)(a1 + 48);
      if (v5 == *(uint64_t ***)(a1 + 56)) {
        break;
      }
      uint64_t v7 = *v5;
      PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::remove((uint64_t *)(a1 + 48), (uint64_t)&v7);
      uint64_t v6 = v7;
      *(void *)(a1 + 80) -= v7[24];
      std::__tree<std::__value_type<PCHash128,PCMutexRef>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCMutexRef>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCMutexRef>>>::erase((uint64_t **)(a1 + 24), v6);
    }
  }
  PCSpinLock::unlock(v4);
}

void sub_1B7E4AC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_unfair_lock_s *a9)
{
}

void PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::remove(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(*(void *)a2 + 208);
  unint64_t v4 = ((a1[1] - *a1) >> 3) - 1;
  if (v3 == v4)
  {
    std::vector<std::__map_iterator<std::__tree_iterator<std::__value_type<ColorConversionKey,PCCacheImpl<ColorConversionKey,std::shared_ptr<PCWorkingColor>,PCNoLock,std::less<ColorConversionKey>>::Data>,std::__tree_node<std::__value_type<ColorConversionKey,PCCacheImpl<ColorConversionKey,std::shared_ptr<PCWorkingColor>,PCNoLock,std::less<ColorConversionKey>>::Data>,void *> *,long>>>::resize((uint64_t)a1, v3);
  }
  else
  {
    *(void *)(*a1 + 8 * v3) = *(void *)(*a1 + 8 * v4);
    *(void *)(*(void *)(*a1 + 8 * v3) + 208) = v3;
    std::vector<std::__map_iterator<std::__tree_iterator<std::__value_type<ColorConversionKey,PCCacheImpl<ColorConversionKey,std::shared_ptr<PCWorkingColor>,PCNoLock,std::less<ColorConversionKey>>::Data>,std::__tree_node<std::__value_type<ColorConversionKey,PCCacheImpl<ColorConversionKey,std::shared_ptr<PCWorkingColor>,PCNoLock,std::less<ColorConversionKey>>::Data>,void *> *,long>>>::resize((uint64_t)a1, v4);
    uint64_t v5 = *a1 + 8 * v3;
    PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::bubble(a1, v5);
  }
}

uint64_t *PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::bubble(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1] - *result;
  unint64_t v4 = *(void *)(*(void *)a2 + 208);
  unint64_t v5 = (2 * v4) | 1;
  if (v5 >= v3 >> 3)
  {
LABEL_24:
    if (v4)
    {
      uint64_t v17 = *(void *)(v2 + 8 * v4);
      do
      {
        unint64_t v18 = v4 - 1;
        unint64_t v19 = (v4 - 1) >> 1;
        uint64_t v20 = *(void *)(v2 + 8 * v19);
        if (*(void *)(v20 + 200) <= *(void *)(v17 + 200)) {
          break;
        }
        *(void *)(v2 + 8 * v4) = v20;
        *(void *)(v2 + 8 * v19) = v17;
        uint64_t v2 = *result;
        *(void *)(*(void *)(*result + 8 * v4) + 208) = v4;
        uint64_t v17 = *(void *)(v2 + 8 * v19);
        *(void *)(v17 + 208) = v19;
        unint64_t v4 = (v4 - 1) >> 1;
      }
      while (v18 > 1);
    }
    return result;
  }
  char v6 = 0;
  unint64_t v7 = v3 >> 3;
  uint64_t v8 = 2 * v4;
  uint64_t v9 = *(void *)(v2 + 8 * v4);
  while (1)
  {
    unint64_t v10 = v8 + 2;
    unint64_t v11 = *(void *)(v9 + 200);
    BOOL v12 = v10 < v7 && v11 > *(void *)(*(void *)(v2 + 8 * v10) + 200);
    unint64_t v13 = *(void *)(*(void *)(v2 + 8 * v5) + 200);
    if (v11 <= v13 && !v12) {
      break;
    }
    BOOL v15 = v11 > v13 && v12;
    if (v12) {
      unint64_t v16 = v10;
    }
    else {
      unint64_t v16 = v5;
    }
    if (v15)
    {
      if (v13 <= *(void *)(*(void *)(v2 + 8 * v10) + 200)) {
        unint64_t v16 = v5;
      }
      else {
        unint64_t v16 = v10;
      }
    }
    *(void *)(v2 + 8 * v4) = *(void *)(v2 + 8 * v16);
    *(void *)(v2 + 8 * v16) = v9;
    uint64_t v2 = *result;
    *(void *)(*(void *)(*result + 8 * v4) + 208) = v4;
    uint64_t v9 = *(void *)(v2 + 8 * v16);
    *(void *)(v9 + 208) = v16;
    uint64_t v8 = 2 * v16;
    char v6 = 1;
    unint64_t v5 = (2 * v16) | 1;
    unint64_t v4 = v16;
    if (v5 >= v7) {
      return result;
    }
  }
  if ((v6 & 1) == 0)
  {
    unint64_t v4 = *(void *)(*(void *)a2 + 208);
    goto LABEL_24;
  }
  return result;
}

void PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::setMaxSize(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (os_unfair_lock_s *)(a1 + 16);
  PCSpinLock::lock((os_unfair_lock_t)(a1 + 16));
  *(void *)(a1 + 96) = a2;
  if (!*(void *)(a1 + 104))
  {
    while (*(void *)(a1 + 80) > *(void *)(a1 + 88) || *(void *)(a1 + 40) > *(void *)(a1 + 96))
    {
      unint64_t v5 = *(uint64_t ***)(a1 + 48);
      if (v5 == *(uint64_t ***)(a1 + 56)) {
        break;
      }
      unint64_t v7 = *v5;
      PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::remove((uint64_t *)(a1 + 48), (uint64_t)&v7);
      char v6 = v7;
      *(void *)(a1 + 80) -= v7[24];
      std::__tree<std::__value_type<PCHash128,PCMutexRef>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCMutexRef>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCMutexRef>>>::erase((uint64_t **)(a1 + 24), v6);
    }
  }
  PCSpinLock::unlock(v4);
}

void sub_1B7E4AED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_unfair_lock_s *a9)
{
}

void PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::disableLimits(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  PCSpinLock::lock((os_unfair_lock_t)(a1 + 16));
  ++*(void *)(a1 + 104);
  PCSpinLock::unlock(v2);
}

void PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::enableLimits(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  PCSpinLock::lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v3 = *(void *)(a1 + 104) - 1;
  *(void *)(a1 + 104) = v3;
  if (!v3)
  {
    while (*(void *)(a1 + 80) > *(void *)(a1 + 88) || *(void *)(a1 + 40) > *(void *)(a1 + 96))
    {
      unint64_t v4 = *(uint64_t ***)(a1 + 48);
      if (v4 == *(uint64_t ***)(a1 + 56)) {
        break;
      }
      char v6 = *v4;
      PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::remove((uint64_t *)(a1 + 48), (uint64_t)&v6);
      unint64_t v5 = v6;
      *(void *)(a1 + 80) -= v6[24];
      std::__tree<std::__value_type<PCHash128,PCMutexRef>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCMutexRef>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCMutexRef>>>::erase((uint64_t **)(a1 + 24), v5);
    }
  }
  PCSpinLock::unlock(v2);
}

void sub_1B7E4AFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_unfair_lock_s *a9)
{
}

void PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::addValue(uint64_t a1, const PCHash128 *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (os_unfair_lock_s *)(a1 + 16);
  v50[1] = a1 + 16;
  PCSpinLock::lock((os_unfair_lock_t)(a1 + 16));
  if (*(void *)(a1 + 88) >= a4 || *(void *)(a1 + 104))
  {
    uint64_t v9 = std::__tree<std::__value_type<PCHash128,PCRect<double>>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCRect<double>>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCRect<double>>>>::find<PCHash128>(a1 + 24, a2);
    unint64_t v10 = v9;
    v50[0] = v9;
    if ((void *)(a1 + 32) == v9)
    {
      uint64_t v25 = *(void *)(a1 + 72) + 1;
      *(void *)(a1 + 72) = v25;
      uint64_t v26 = *a3;
      long long v27 = (std::__shared_weak_count *)a3[1];
      if (v27) {
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v28 = *((_OWORD *)a3 + 6);
      long long v55 = *((_OWORD *)a3 + 5);
      long long v56 = v28;
      long long v29 = *((_OWORD *)a3 + 8);
      long long v57 = *((_OWORD *)a3 + 7);
      long long v58 = v29;
      long long v30 = *((_OWORD *)a3 + 2);
      long long v51 = *((_OWORD *)a3 + 1);
      long long v52 = v30;
      long long v31 = *((_OWORD *)a3 + 4);
      long long v53 = *((_OWORD *)a3 + 3);
      long long v54 = v31;
      long long v35 = *(_OWORD *)a2;
      uint64_t v36 = v26;
      v37 = v27;
      if (v27) {
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v42 = v55;
      long long v43 = v56;
      long long v44 = v57;
      long long v45 = v58;
      long long v38 = v51;
      long long v39 = v52;
      long long v40 = v53;
      long long v41 = v54;
      unint64_t v46 = a4;
      uint64_t v47 = v25;
      uint64_t v48 = 0;
      v49[0] = (uint64_t)std::__tree<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>>>::__emplace_unique_key_args<PCHash128,std::pair<PCHash128 const,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>>((uint64_t **)(a1 + 24), (const PCHash128 *)&v35, (uint64_t)&v35);
      v49[1] = v32;
      if (v37) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v37);
      }
      PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::add((void **)(a1 + 48), v49);
      *(void *)(a1 + 80) += a4;
      if (!*(void *)(a1 + 104))
      {
        while (*(void *)(a1 + 80) > *(void *)(a1 + 88) || *(void *)(a1 + 40) > *(void *)(a1 + 96))
        {
          long long v34 = *(void **)(a1 + 48);
          if (v34 == *(void **)(a1 + 56)) {
            break;
          }
          *(void *)&long long v35 = *v34;
          PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::remove((uint64_t *)(a1 + 48), (uint64_t)&v35);
          long long v33 = (uint64_t *)v35;
          *(void *)(a1 + 80) -= *(void *)(v35 + 192);
          std::__tree<std::__value_type<PCHash128,PCMutexRef>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCMutexRef>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCMutexRef>>>::erase((uint64_t **)(a1 + 24), v33);
        }
      }
      if (v27) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      }
    }
    else
    {
      uint64_t v11 = *a3;
      uint64_t v12 = a3[1];
      if (v12) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
      }
      unint64_t v13 = v9 + 6;
      long long v14 = (std::__shared_weak_count *)v9[7];
      v10[6] = v11;
      v10[7] = v12;
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      if (v13 != a3)
      {
        uint64_t v15 = 0;
        unint64_t v16 = v10 + 8;
        uint64_t v17 = a3 + 2;
        do
        {
          for (uint64_t i = 0; i != 4; ++i)
            v16[i] = v17[i];
          ++v15;
          v16 += 4;
          v17 += 4;
        }
        while (v15 != 4);
      }
      uint64_t v19 = *(void *)(a1 + 72) + 1;
      *(void *)(a1 + 72) = v19;
      v10[25] = v19;
      PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::bubble((uint64_t *)(a1 + 48), (uint64_t)v50);
      uint64_t v20 = v50[0];
      unint64_t v21 = a4 - *(void *)(v50[0] + 192);
      if (v21)
      {
        unint64_t v22 = *(void *)(a1 + 80) + v21;
        *(void *)(a1 + 80) = v22;
        *(void *)(v20 + 192) = a4;
        if (!*(void *)(a1 + 104))
        {
          while (v22 > *(void *)(a1 + 88) || *(void *)(a1 + 40) > *(void *)(a1 + 96))
          {
            uint64_t v24 = *(void **)(a1 + 48);
            if (v24 == *(void **)(a1 + 56)) {
              break;
            }
            *(void *)&long long v35 = *v24;
            PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::remove((uint64_t *)(a1 + 48), (uint64_t)&v35);
            unint64_t v23 = (uint64_t *)v35;
            *(void *)(a1 + 80) -= *(void *)(v35 + 192);
            std::__tree<std::__value_type<PCHash128,PCMutexRef>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCMutexRef>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCMutexRef>>>::erase((uint64_t **)(a1 + 24), v23);
            unint64_t v22 = *(void *)(a1 + 80);
          }
        }
      }
    }
  }
  PCSpinLock::unlock(v8);
}

void sub_1B7E4B310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,os_unfair_lock_s *a36)
{
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  PCLockSentry<PCSpinLock>::~PCLockSentry(&a36);
  _Unwind_Resume(a1);
}

void PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::add(void **a1, uint64_t *a2)
{
  unint64_t v4 = (char *)*a1;
  unint64_t v5 = a1[1];
  uint64_t v6 = ((char *)v5 - (unsigned char *)*a1) >> 3;
  uint64_t v7 = *a2;
  *(void *)(*a2 + 208) = v6;
  unint64_t v10 = (unint64_t)a1[2];
  uint64_t v8 = (uint64_t)(a1 + 2);
  unint64_t v9 = v10;
  if ((unint64_t)v5 >= v10)
  {
    if ((unint64_t)(v6 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v9 - (void)v4;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v6 + 1)) {
      uint64_t v13 = v6 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14)
    {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v8, v14);
      uint64_t v7 = *a2;
    }
    else
    {
      uint64_t v15 = 0;
    }
    unint64_t v16 = &v15[8 * v6];
    uint64_t v17 = &v15[8 * v14];
    *(void *)unint64_t v16 = v7;
    uint64_t v11 = v16 + 8;
    uint64_t v19 = (char *)*a1;
    unint64_t v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      unint64_t v18 = (char *)*a1;
    }
    *a1 = v16;
    a1[1] = v11;
    a1[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    *unint64_t v5 = v7;
    uint64_t v11 = v5 + 1;
  }
  a1[1] = v11;
  unint64_t v21 = *(void *)(*a2 + 208);
  if (v21)
  {
    unint64_t v22 = (char *)*a1;
    uint64_t v23 = *((void *)*a1 + v21);
    do
    {
      unint64_t v24 = v21 - 1;
      unint64_t v25 = (v21 - 1) >> 1;
      uint64_t v26 = *(void *)&v22[8 * v25];
      if (*(void *)(v26 + 200) <= *(void *)(v23 + 200)) {
        break;
      }
      *(void *)&v22[8 * v21] = v26;
      *(void *)&v22[8 * v25] = v23;
      unint64_t v22 = (char *)*a1;
      *(void *)(*((void *)*a1 + v21) + 208) = v21;
      uint64_t v23 = *(void *)&v22[8 * v25];
      *(void *)(v23 + 208) = v25;
      unint64_t v21 = (v21 - 1) >> 1;
    }
    while (v24 > 1);
  }
}

uint64_t *std::__tree<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>>>::__emplace_unique_key_args<PCHash128,std::pair<PCHash128 const,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>>(uint64_t **a1, const PCHash128 *a2, uint64_t a3)
{
  unint64_t v5 = (uint64_t **)std::__tree<std::__value_type<PCHash128,PCRect<double>>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCRect<double>>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCRect<double>>>>::__find_equal<PCHash128>((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    std::__tree<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>>>::__construct_node<std::pair<PCHash128 const,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>,std::__map_value_compare<PVIGHGNodeCacheKey,std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>,std::less<PVIGHGNodeCacheKey>,true>,std::allocator<std::__value_type<PVIGHGNodeCacheKey,HGRef<HGNode>>>>::__insert_node_at(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

__n128 std::__tree<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>>>::__construct_node<std::pair<PCHash128 const,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = operator new(0xD8uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  void v6[2] = *(_OWORD *)a2;
  uint64_t v7 = *(void *)(a2 + 24);
  *((void *)v6 + 6) = *(void *)(a2 + 16);
  *((void *)v6 + 7) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  long long v8 = *(_OWORD *)(a2 + 112);
  v6[8] = *(_OWORD *)(a2 + 96);
  v6[9] = v8;
  long long v9 = *(_OWORD *)(a2 + 144);
  v6[10] = *(_OWORD *)(a2 + 128);
  v6[11] = v9;
  long long v10 = *(_OWORD *)(a2 + 48);
  v6[4] = *(_OWORD *)(a2 + 32);
  v6[5] = v10;
  long long v11 = *(_OWORD *)(a2 + 80);
  v6[6] = *(_OWORD *)(a2 + 64);
  v6[7] = v11;
  __n128 result = *(__n128 *)(a2 + 160);
  *((void *)v6 + 26) = *(void *)(a2 + 176);
  v6[12] = result;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::findValue(uint64_t a1@<X0>, const PCHash128 *a2@<X1>, unsigned char *a3@<X2>, uint64_t a4@<X8>)
{
  long long v8 = (os_unfair_lock_s *)(a1 + 16);
  v16[1] = a1 + 16;
  PCSpinLock::lock((os_unfair_lock_t)(a1 + 16));
  long long v9 = std::__tree<std::__value_type<PCHash128,PCRect<double>>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCRect<double>>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCRect<double>>>>::find<PCHash128>(a1 + 24, a2);
  v16[0] = v9;
  if ((void *)(a1 + 32) == v9)
  {
    *a3 = 0;
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 136) = 0x3FF0000000000000;
    *(void *)(a4 + 96) = 0x3FF0000000000000;
    *(void *)(a4 + 56) = 0x3FF0000000000000;
    *(void *)(a4 + 16) = 0x3FF0000000000000;
    *(_OWORD *)(a4 + 24) = 0u;
    *(_OWORD *)(a4 + 40) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 104) = 0u;
    *(_OWORD *)(a4 + 120) = 0u;
  }
  else
  {
    uint64_t v10 = v9[7];
    *(void *)a4 = v9[6];
    *(void *)(a4 + 8) = v10;
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    long long v11 = *((_OWORD *)v9 + 9);
    *(_OWORD *)(a4 + 80) = *((_OWORD *)v9 + 8);
    *(_OWORD *)(a4 + 96) = v11;
    long long v12 = *((_OWORD *)v9 + 11);
    *(_OWORD *)(a4 + 112) = *((_OWORD *)v9 + 10);
    *(_OWORD *)(a4 + 128) = v12;
    long long v13 = *((_OWORD *)v9 + 5);
    *(_OWORD *)(a4 + 16) = *((_OWORD *)v9 + 4);
    *(_OWORD *)(a4 + 32) = v13;
    long long v14 = *((_OWORD *)v9 + 7);
    *(_OWORD *)(a4 + 48) = *((_OWORD *)v9 + 6);
    *(_OWORD *)(a4 + 64) = v14;
    uint64_t v15 = *(void *)(a1 + 72) + 1;
    *(void *)(a1 + 72) = v15;
    v9[25] = v15;
    PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::bubble((uint64_t *)(a1 + 48), (uint64_t)v16);
    *a3 = 1;
  }
  PCSpinLock::unlock(v8);
}

void sub_1B7E4B6C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  PCLockSentry<PCSpinLock>::~PCLockSentry((os_unfair_lock_s **)va);
  _Unwind_Resume(a1);
}

void PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::removeKey(uint64_t a1, const PCHash128 *a2)
{
  unint64_t v4 = (os_unfair_lock_s *)(a1 + 16);
  v6[1] = (uint64_t *)(a1 + 16);
  PCSpinLock::lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v5 = std::__tree<std::__value_type<PCHash128,PCRect<double>>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCRect<double>>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCRect<double>>>>::find<PCHash128>(a1 + 24, a2);
  v6[0] = v5;
  if ((uint64_t *)(a1 + 32) != v5)
  {
    *(void *)(a1 + 80) -= v5[24];
    PCEvictionHeap<std::__map_iterator<std::__tree_iterator<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,std::__tree_node<std::__value_type<PCHash128,PCCacheImpl<PCHash128,PGTextureCache::CacheData,PCSpinLock,std::less<PCHash128>>::Data>,void *> *,long>>>::remove((uint64_t *)(a1 + 48), (uint64_t)v6);
    std::__tree<std::__value_type<PCHash128,PCMutexRef>,std::__map_value_compare<PCHash128,std::__value_type<PCHash128,PCMutexRef>,std::less<PCHash128>,true>,std::allocator<std::__value_type<PCHash128,PCMutexRef>>>::erase((uint64_t **)(a1 + 24), v6[0]);
  }
  PCSpinLock::unlock(v4);
}

void sub_1B7E4B784(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  PCLockSentry<PCSpinLock>::~PCLockSentry((os_unfair_lock_s **)va);
  _Unwind_Resume(a1);
}

void PMLayerDescription::PMLayerDescription(PMLayerDescription *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0x500000000;
  *((void *)this + 3) = 0x3FF0000000000000;
  *((_DWORD *)this + 8) = 0;
  PCSharedCount::PCSharedCount((PCSharedCount *)this + 5);
}

void PMLayerDescription::PMLayerDescription(PMLayerDescription *this, const PCString *a2)
{
  *(_OWORD *)this = *(_OWORD *)&a2->var0;
  *((PCString *)this + 2) = a2[2];
  *((PCString *)this + 3) = a2[3];
  *((_DWORD *)this + 8) = a2[4].var0;
  PCString::PCString((PCString *)this + 5, a2 + 5);
}

uint64_t PMLayerDescription::operator=(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  PCString::set((PCString *)(a1 + 40), (const PCString *)(a2 + 40));
  return a1;
}

void PMClip::PMClip(PMClip *this, const PCURL *a2, const PMFormatDescription *a3)
{
  uint64_t v6 = PMFormatDescription::PMFormatDescription(this);
  *((void *)v6 + 151) = 0;
  *(_OWORD *)((char *)v6 + 1176) = 0u;
  *(_OWORD *)((char *)v6 + 1192) = 0u;
  *(_OWORD *)((char *)v6 + 1144) = 0u;
  *(_OWORD *)((char *)v6 + 1160) = 0u;
  PCURL::PCURL((PMFormatDescription *)((char *)v6 + 1224), a2);
  PCURL::getAsFileSystemString((const __CFURL **)a2, (PCString *)this + 154);
  *((_WORD *)this + 620) = 0;
  *((_DWORD *)this + 311) = 0;
  *((_WORD *)this + 624) = 0;
  PCMutex::PCMutex((PCMutex *)((char *)this + 1256), 1);
  *(void *)this = *(void *)a3;
  memcpy((char *)this + 8, (char *)a3 + 8, 0x1C0uLL);
  PCString::set((PCString *)this + 57, (const PCString *)a3 + 57);
  uint64_t v7 = *((void *)a3 + 58);
  *((_DWORD *)this + 118) = *((_DWORD *)a3 + 118);
  *((void *)this + 58) = v7;
  PCCFRef<CGColorSpace *>::operator=((CGColorSpace **)this + 60, (CGColorSpace **)a3 + 60);
  *(_OWORD *)((char *)this + 488) = *(_OWORD *)((char *)a3 + 488);
  *((void *)this + 63) = 0;
  *((_DWORD *)this + 128) = 0;
  *((_DWORD *)this + 129) = *((_DWORD *)a3 + 129);
  PMAudioDescription::operator=((uint64_t)this + 520, (uint64_t)a3 + 520);
  *((void *)this + 79) = 0;
  *((_DWORD *)this + 160) = 0;
  memcpy((char *)this + 648, (char *)a3 + 648, 0x1C0uLL);
  PCString::set((PCString *)this + 137, (const PCString *)a3 + 137);
  uint64_t v8 = *((void *)a3 + 138);
  *((_DWORD *)this + 278) = *((_DWORD *)a3 + 278);
  *((void *)this + 138) = v8;
  PCCFRef<CGColorSpace *>::operator=((CGColorSpace **)this + 140, (CGColorSpace **)a3 + 140);
  *(_OWORD *)((char *)this + 1128) = *(_OWORD *)((char *)a3 + 1128);
  if (*((void *)a3 + 63))
  {
    long long v9 = malloc_type_malloc(*((unsigned int *)a3 + 128), 0x69CF949EuLL);
    *((void *)this + 63) = v9;
    memcpy(v9, *((const void **)a3 + 63), *((unsigned int *)a3 + 128));
    *((_DWORD *)this + 128) = *((_DWORD *)a3 + 128);
  }
  if (*((void *)a3 + 79))
  {
    uint64_t v10 = malloc_type_malloc(*((unsigned int *)a3 + 160), 0x21C6B60uLL);
    *((void *)this + 79) = v10;
    memcpy(v10, *((const void **)a3 + 79), *((unsigned int *)a3 + 160));
    *((_DWORD *)this + 160) = *((_DWORD *)a3 + 160);
  }
  memcpy((char *)this + 648, (char *)a3 + 648, 0x1C0uLL);
  PCString::set((PCString *)this + 137, (const PCString *)a3 + 137);
  uint64_t v11 = *((void *)a3 + 138);
  *((_DWORD *)this + 278) = *((_DWORD *)a3 + 278);
  *((void *)this + 138) = v11;
  PCCFRef<CGColorSpace *>::operator=((CGColorSpace **)this + 140, (CGColorSpace **)a3 + 140);
  *(_OWORD *)((char *)this + 1128) = *(_OWORD *)((char *)a3 + 1128);
}

void sub_1B7E4BB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCMutex *a10, PCString *a11, PCURL *a12, void *a13, void *a14)
{
  PCString::~PCString(a11);
  PCURL::~PCURL(a12);
  unint64_t v16 = (void *)*((void *)v14 + 149);
  if (v16) {
    operator delete(v16);
  }
  a14 = (void *)((char *)v14 + 1168);
  std::vector<PMAudioDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)&a14);
  a14 = a13;
  std::vector<PMLayerDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)&a14);
  PMFormatDescription::~PMFormatDescription(v14);
  _Unwind_Resume(a1);
}

void PMClip::PMClip(PMClip *this, const PMClip *a2)
{
  unint64_t v4 = PMFormatDescription::PMFormatDescription(this, a2);
  *((void *)v4 + 145) = 0;
  *(_OWORD *)((char *)v4 + 1144) = 0u;
  std::vector<PMLayerDescription>::__init_with_size[abi:ne180100]<PMLayerDescription*,PMLayerDescription*>((void *)v4 + 143, *((void *)a2 + 143), *((void *)a2 + 144), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 144) - *((void *)a2 + 143)) >> 4));
  *((void *)this + 148) = 0;
  *((_OWORD *)this + 73) = 0u;
  std::vector<PMAudioDescription>::__init_with_size[abi:ne180100]<PMAudioDescription*,PMAudioDescription*>((void *)this + 146, *((void *)a2 + 146), *((void *)a2 + 147), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a2 + 147) - *((void *)a2 + 146)) >> 4));
  std::vector<BOOL>::vector((void *)this + 149, (uint64_t)a2 + 1192);
  *((void *)this + 152) = 0;
  PCURL::PCURL((PMClip *)((char *)this + 1224), (const PMClip *)((char *)a2 + 1224));
  PCString::PCString((PCString *)this + 154, (const PCString *)a2 + 154);
  *((_WORD *)this + 620) = *((_WORD *)a2 + 620);
  *((_DWORD *)this + 311) = 0;
  *((_WORD *)this + 624) = 0;
  PCMutex::PCMutex((PCMutex *)((char *)this + 1256), 1);
}

void sub_1B7E4BC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  PCString::~PCString(v13);
  PCURL::~PCURL(v12);
  if (*v11) {
    operator delete(*v11);
  }
  std::vector<PMAudioDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  std::vector<PMLayerDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  PMFormatDescription::~PMFormatDescription(v10);
  _Unwind_Resume(a1);
}

void sub_1B7E4BCF4()
{
}

void PMClip::~PMClip(PMClip *this)
{
  uint64_t v2 = (void *)*((void *)this + 63);
  if (v2) {
    free(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 79);
  if (v3) {
    free(v3);
  }
  PMClip::close(this);
  PCMutex::~PCMutex((PCMutex *)((char *)this + 1256));
  PCString::~PCString((PCString *)this + 154);
  PCURL::~PCURL((PMClip *)((char *)this + 1224));
  unint64_t v4 = (void *)*((void *)this + 149);
  if (v4) {
    operator delete(v4);
  }
  uint64_t v5 = (void **)((char *)this + 1168);
  std::vector<PMAudioDescription>::__destroy_vector::operator()[abi:ne180100](&v5);
  uint64_t v5 = (void **)((char *)this + 1144);
  std::vector<PMLayerDescription>::__destroy_vector::operator()[abi:ne180100](&v5);
  PMFormatDescription::~PMFormatDescription(this);
}

uint64_t PMClip::close(PMClip *this)
{
  uint64_t v2 = (PCMutex *)((char *)this + 1256);
  PCMutex::lock((PCMutex *)((char *)this + 1256));
  int v3 = *((_DWORD *)this + 311);
  if (v3)
  {
    int v4 = v3 - 1;
    *((_DWORD *)this + 311) = v4;
    if (!v4)
    {
      if (*(void *)this)
      {
        uint64_t v6 = *(void (**)(PMClip *, void))(*(void *)this + 16);
        if (v6)
        {
          v6(this, *((void *)this + 152));
          *((void *)this + 152) = 0;
        }
      }
    }
  }
  PCMutex::unlock(v2);
  return 0;
}

void sub_1B7E4BE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PMClip::open(PMClip *this)
{
  uint64_t v2 = (PCMutex *)((char *)this + 1256);
  long long v27 = (char *)this + 1256;
  PCMutex::lock((PCMutex *)((char *)this + 1256));
  char v28 = 1;
  int v3 = *((_DWORD *)this + 311);
  if (!v3)
  {
    if (!*(void *)this)
    {
      uint64_t v4 = 1;
      goto LABEL_48;
    }
    uint64_t v5 = (const __CFURL **)((char *)this + 1224);
    int isSequence = PCURL::isSequence((const __CFURL **)this + 153);
    *((unsigned char *)this + 1240) = isSequence;
    URLforIndex = (PMClip *)((char *)this + 1224);
    if (isSequence) {
      URLforIndex = (PCURL *)PCURL::getURLforIndex((const __CFURL **)this + 153, 0);
    }
    uint64_t v4 = (**(uint64_t (***)(PMClip *, PCURL *, char *))this)(this, URLforIndex, (char *)this + 1216);
    if (v4)
    {
      if (!isSequence) {
        goto LABEL_47;
      }
      goto LABEL_44;
    }
    ++*((_DWORD *)this + 311);
    *(_OWORD *)((char *)this + 24) = 0u;
    *(_OWORD *)((char *)this + 40) = 0u;
    *(_OWORD *)((char *)this + 56) = 0u;
    *(_OWORD *)((char *)this + 72) = 0u;
    *(_OWORD *)((char *)this + 88) = 0u;
    *(_OWORD *)((char *)this + 104) = 0u;
    *(_OWORD *)((char *)this + 120) = 0u;
    *(_OWORD *)((char *)this + 136) = 0u;
    *(_OWORD *)((char *)this + 152) = 0u;
    *(_OWORD *)((char *)this + 168) = 0u;
    *(_OWORD *)((char *)this + 184) = 0u;
    *(_OWORD *)((char *)this + 200) = 0u;
    *(_OWORD *)((char *)this + 216) = 0u;
    *(_OWORD *)((char *)this + 232) = 0u;
    *(_OWORD *)((char *)this + 248) = 0u;
    *(_OWORD *)((char *)this + 8) = 0u;
    *(_OWORD *)((char *)this + 264) = 0u;
    *(_OWORD *)((char *)this + 280) = 0u;
    *(_OWORD *)((char *)this + 296) = 0u;
    *(_OWORD *)((char *)this + 312) = 0u;
    *(_OWORD *)((char *)this + 328) = 0u;
    *(_OWORD *)((char *)this + 344) = 0u;
    *(_OWORD *)((char *)this + 360) = 0u;
    *(_OWORD *)((char *)this + 376) = 0u;
    *(_OWORD *)((char *)this + 392) = 0u;
    *(_OWORD *)((char *)this + 408) = 0u;
    *(_OWORD *)((char *)this + 424) = 0u;
    *(_OWORD *)((char *)this + 440) = 0u;
    *(_OWORD *)((char *)this + 456) = 0u;
    *(_OWORD *)((char *)this + 472) = 0u;
    *(_OWORD *)((char *)this + 488) = 0u;
    *(_OWORD *)((char *)this + 1112) = 0u;
    *(_OWORD *)((char *)this + 1128) = 0u;
    *(_OWORD *)((char *)this + 1080) = 0u;
    *(_OWORD *)((char *)this + 1096) = 0u;
    *(_OWORD *)((char *)this + 1048) = 0u;
    *(_OWORD *)((char *)this + 1064) = 0u;
    *(_OWORD *)((char *)this + 1016) = 0u;
    *(_OWORD *)((char *)this + 1032) = 0u;
    *(_OWORD *)((char *)this + 984) = 0u;
    *(_OWORD *)((char *)this + 1000) = 0u;
    *(_OWORD *)((char *)this + 952) = 0u;
    *(_OWORD *)((char *)this + 968) = 0u;
    *(_OWORD *)((char *)this + 920) = 0u;
    *(_OWORD *)((char *)this + 936) = 0u;
    *(_OWORD *)((char *)this + 888) = 0u;
    *(_OWORD *)((char *)this + 904) = 0u;
    *(_OWORD *)((char *)this + 856) = 0u;
    *(_OWORD *)((char *)this + 872) = 0u;
    *(_OWORD *)((char *)this + 824) = 0u;
    *(_OWORD *)((char *)this + 840) = 0u;
    *(_OWORD *)((char *)this + 792) = 0u;
    *(_OWORD *)((char *)this + 808) = 0u;
    *(_OWORD *)((char *)this + 760) = 0u;
    *(_OWORD *)((char *)this + 776) = 0u;
    *(_OWORD *)((char *)this + 728) = 0u;
    *(_OWORD *)((char *)this + 744) = 0u;
    *(_OWORD *)((char *)this + 696) = 0u;
    *(_OWORD *)((char *)this + 712) = 0u;
    *(_OWORD *)((char *)this + 664) = 0u;
    *(_OWORD *)((char *)this + 680) = 0u;
    *(_OWORD *)((char *)this + 648) = 0u;
    uint64_t v4 = (*(uint64_t (**)(PMClip *, PCURL *, void))(*(void *)this + 24))(this, URLforIndex, *((void *)this + 152));
    if (!*((_DWORD *)this + 108)) {
      *((_DWORD *)this + 108) = *((_DWORD *)this + 72);
    }
    if (!*((_DWORD *)this + 109)) {
      *((_DWORD *)this + 109) = *((_DWORD *)this + 73);
    }
    PMClip::getFormatName(this, &v26);
    if (PCString::empty(&v26))
    {
      *((unsigned char *)this + 1241) = 0;
      if (v4) {
        goto LABEL_43;
      }
    }
    else
    {
      PCString::PCString((PCString *)&v22, "OpenEXR");
      *((unsigned char *)this + 1241) = PCString::compare(&v26, (const PCString *)&v22) == kCFCompareEqualTo;
      PCString::~PCString((PCString *)&v22);
      if (v4) {
        goto LABEL_43;
      }
    }
    int v21 = isSequence;
    unsigned int v8 = *((_DWORD *)this + 98);
    if (v8)
    {
      unsigned int v9 = 1;
      do
      {
        v22.value = 0;
        *(void *)&v22.timescale = 0;
        v22.epoch = 0x500000000;
        uint64_t v23 = 0x3FF0000000000000;
        int v24 = 0;
        PCSharedCount::PCSharedCount((PCSharedCount *)v25);
        uint64_t v10 = *(uint64_t (**)(PMClip *, CMTime *, void, PCURL *, void))(*(void *)this + 32);
        if (v10) {
          uint64_t v4 = v10(this, &v22, v9 - 1, URLforIndex, *((void *)this + 152));
        }
        else {
          uint64_t v4 = 0;
        }
        unint64_t v11 = *((void *)this + 144);
        if (v11 >= *((void *)this + 145))
        {
          uint64_t v12 = std::vector<PMLayerDescription>::__push_back_slow_path<PMLayerDescription const&>((uint64_t *)this + 143, (const PCString *)&v22);
        }
        else
        {
          PMLayerDescription::PMLayerDescription(*((PMLayerDescription **)this + 144), (const PCString *)&v22);
          uint64_t v12 = v11 + 48;
          *((void *)this + 144) = v11 + 48;
        }
        *((void *)this + 144) = v12;
        PCString::~PCString(v25);
        if (v9 > v8) {
          break;
        }
        ++v9;
      }
      while (!v4);
    }
    else
    {
      uint64_t v4 = 0;
    }
    unsigned int v13 = *((_DWORD *)this + 129);
    if (v13)
    {
      uint64_t v5 = (const __CFURL **)((char *)this + 1224);
      int isSequence = v21;
      if (!v4)
      {
        unsigned int v14 = 1;
        do
        {
          PMAudioDescription::PMAudioDescription((PMAudioDescription *)&v22);
          uint64_t v15 = *(uint64_t (**)(PMClip *, CMTime *, void, PCURL *, void))(*(void *)this + 96);
          if (v15) {
            uint64_t v4 = v15(this, &v22, v14 - 1, URLforIndex, *((void *)this + 152));
          }
          else {
            uint64_t v4 = 0;
          }
          unint64_t v16 = *((void *)this + 147);
          if (v16 >= *((void *)this + 148))
          {
            uint64_t v17 = std::vector<PMAudioDescription>::__push_back_slow_path<PMAudioDescription const&>((uint64_t *)this + 146, (const PMAudioDescription *)&v22);
          }
          else
          {
            PMAudioDescription::PMAudioDescription(*((PMAudioDescription **)this + 147), (const PMAudioDescription *)&v22);
            uint64_t v17 = v16 + 112;
            *((void *)this + 147) = v16 + 112;
          }
          *((void *)this + 147) = v17;
          PMAudioDescription::~PMAudioDescription((PCString *)&v22);
          if (v14 >= v13) {
            break;
          }
          ++v14;
        }
        while (!v4);
      }
    }
    else
    {
      uint64_t v5 = (const __CFURL **)((char *)this + 1224);
      int isSequence = v21;
    }
LABEL_43:
    PCString::~PCString(&v26);
    if (!isSequence)
    {
LABEL_47:
      *((unsigned char *)this + 1249) = 0;
      goto LABEL_48;
    }
LABEL_44:
    if (URLforIndex)
    {
      PCURL::~PCURL(URLforIndex);
      MEMORY[0x1BA9BFBA0]();
    }
    int SequenceEnd = PCURL::getSequenceEnd(v5);
    int64_t v19 = SequenceEnd - PCURL::getSequenceStart(v5) + 1;
    *((_DWORD *)this + 86) = v19;
    CMTimeMake(&v22, v19, (int)*((double *)this + 45));
    *(CMTime *)((char *)this + 296) = v22;
    goto LABEL_47;
  }
  uint64_t v4 = 0;
  *((_DWORD *)this + 311) = v3 + 1;
LABEL_48:
  PCMutex::unlock(v2);
  return v4;
}

void sub_1B7E4C254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PCString::~PCString((PCString *)va);
  PCString::~PCString((PCString *)(v3 - 112));
  PCLockSentry<PCMutex>::~PCLockSentry(v3 - 104);
  _Unwind_Resume(a1);
}

void PMClip::getFormatName(PMClip *this@<X0>, PCString *a2@<X8>)
{
  uint64_t v3 = *(void *)this;
  if (v3)
  {
    uint64_t v4 = (const char *)(*(uint64_t (**)(void))(v3 + 240))();
    PCString::PCString(a2, v4);
  }
  else
  {
    PCSharedCount::PCSharedCount((PCSharedCount *)a2);
  }
}

uint64_t PMClip::reloadResources(PMClip *this)
{
  uint64_t v2 = (PCMutex *)((char *)this + 1256);
  uint64_t v12 = (char *)this + 1256;
  PCMutex::lock((PCMutex *)((char *)this + 1256));
  char v13 = 1;
  if (*((_DWORD *)this + 311))
  {
    CFURLRef v3 = *(const __CFURL **)this;
    if (*(void *)this && !*((unsigned char *)this + 1249))
    {
      int v4 = *((unsigned __int8 *)this + 1240);
      if (*((unsigned char *)this + 1240))
      {
        URLforIndex = (PCURL *)PCURL::getURLforIndex((const __CFURL **)this + 153, 0);
        CFURLRef v3 = *(const __CFURL **)this;
      }
      else
      {
        URLforIndex = (PMClip *)((char *)this + 1224);
      }
      uint64_t v6 = (void (*)(PMClip *, void))*((void *)v3 + 2);
      if (v6)
      {
        v6(this, *((void *)this + 152));
        *((void *)this + 152) = 0;
        CFURLRef v3 = *(const __CFURL **)this;
      }
      uint64_t v7 = *(unsigned int (**)(PMClip *, PCURL *, char *))v3;
      if (v7 && !v7(this, URLforIndex, (char *)this + 1216)) {
        (*(void (**)(PMClip *, PCURL *, void))(*(void *)this + 24))(this, URLforIndex, *((void *)this + 152));
      }
      if (v4)
      {
        if (URLforIndex)
        {
          PCURL::~PCURL(URLforIndex);
          MEMORY[0x1BA9BFBA0]();
        }
        int SequenceEnd = PCURL::getSequenceEnd((const __CFURL **)this + 153);
        int64_t v9 = SequenceEnd - PCURL::getSequenceStart((const __CFURL **)this + 153) + 1;
        *((_DWORD *)this + 86) = v9;
        CMTimeMake(&v11, v9, (int)*((double *)this + 45));
        *(CMTime *)((char *)this + 296) = v11;
      }
    }
    *((unsigned char *)this + 1249) = 1;
  }
  PCMutex::unlock(v2);
  return 0;
}

void sub_1B7E4C498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)va);
  _Unwind_Resume(a1);
}

void PMClip::getFilename(const __CFURL **this@<X0>, PCString *a2@<X8>)
{
}

void PMClip::getShortFilename(CFURLRef *this@<X0>, PCString *a2@<X8>)
{
}

void PMClip::getExtension(const __CFURL **this@<X0>, PCURL *a2@<X8>)
{
}

void PMClip::getAsFileSystemString(const PCString *this@<X0>, PCString *a2@<X8>)
{
}

void PMClip::getAsURLString(const __CFURL **this@<X0>, PCURL *a2@<X8>)
{
}

void PMClip::getCodecName(PMClip *this@<X0>, PCURL *a2@<X8>)
{
  if (*(void *)this)
  {
    CFStringRef v3 = CFStringCreateWithCString(0, (const char *)this + 8, 0);
    PCURL::PCURL(a2, v3);
    if (v3) {
      CFRelease(v3);
    }
  }
  else
  {
    PCSharedCount::PCSharedCount((PCSharedCount *)a2);
  }
}

void sub_1B7E4C554(_Unwind_Exception *a1)
{
  PCString::~PCString(v1);
  _Unwind_Resume(a1);
}

uint64_t PMClip::getDuration@<X0>(uint64_t this@<X0>, CMTime *a2@<X8>)
{
  uint64_t v2 = this;
  if (*(_DWORD *)(this + 392))
  {
    a2->epoch = *(void *)(this + 312);
    *(_OWORD *)&a2->value = *(_OWORD *)(this + 296);
  }
  else
  {
    int v4 = *(_DWORD *)(this + 516);
    uint64_t v5 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&a2->value = *MEMORY[0x1E4F1FA48];
    a2->epoch = *(void *)(v5 + 16);
    if (v4)
    {
      unint64_t v6 = 0;
      uint64_t v7 = 24;
      do
      {
        uint64_t v8 = *(void *)(v2 + 1168) + v7;
        long long v9 = *(_OWORD *)v8;
        CMTimeEpoch v10 = *(void *)(v8 + 16);
        *(_OWORD *)&time1.value = *(_OWORD *)v8;
        time1.epoch = v10;
        CMTime time2 = *a2;
        this = CMTimeCompare(&time1, &time2);
        if ((int)this >= 1)
        {
          *(_OWORD *)&a2->value = v9;
          a2->epoch = v10;
        }
        ++v6;
        v7 += 112;
      }
      while (v6 < *(unsigned int *)(v2 + 516));
    }
  }
  return this;
}

double PMClip::getSeconds(PMClip *this, double a2)
{
  if (*((_DWORD *)this + 98))
  {
    LODWORD(a2) = *((_DWORD *)this + 86);
    return (double)*(unint64_t *)&a2 / *((double *)this + 45);
  }
  else
  {
    uint64_t v3 = *((unsigned int *)this + 129);
    if (v3)
    {
      int v4 = (double *)(*((void *)this + 146) + 64);
      double result = 0.0;
      do
      {
        double v5 = (double)*((unint64_t *)v4 - 6);
        double v6 = *v4;
        v4 += 14;
        double v7 = v5 / v6;
        if (v7 > result) {
          double result = v7;
        }
        --v3;
      }
      while (v3);
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

__darwin_time_t PMClip::getModificationDate(PMClip *this)
{
  if (*((unsigned char *)this + 1240))
  {
    uint64_t v1 = (const __CFURL **)((char *)this + 1224);
    int SequenceLength = PCURL::getSequenceLength((const __CFURL **)this + 153);
    if (SequenceLength < 1)
    {
      return 0;
    }
    else
    {
      int v3 = SequenceLength;
      __darwin_time_t tv_sec = 0;
      for (int i = 0; i != v3; ++i)
      {
        URLforIndex = (const __CFURL **)PCURL::getURLforIndex(v1, i);
        if (URLforIndex)
        {
          double v7 = (PCURL *)URLforIndex;
          PCURL::getAsFileSystemString(URLforIndex, &v13);
          uint64_t v8 = PCString::createUTF8Str(&v13);
          PCString::~PCString(&v13);
          int v9 = stat(v8, &v14);
          free(v8);
          PCURL::~PCURL(v7);
          MEMORY[0x1BA9BFBA0]();
          if (!v9 && v14.st_mtimespec.tv_sec > tv_sec) {
            __darwin_time_t tv_sec = v14.st_mtimespec.tv_sec;
          }
        }
      }
    }
  }
  else
  {
    UTF8Str = PCString::createUTF8Str((PCString *)this + 154);
    int v11 = stat(UTF8Str, &v14);
    free(UTF8Str);
    if (v11) {
      return 0;
    }
    else {
      return v14.st_mtimespec.tv_sec;
    }
  }
  return tv_sec;
}

void sub_1B7E4C7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCString a10)
{
}

uint64_t PMClip::getVideoDescription(uint64_t a1, void *__dst)
{
  uint64_t v4 = a1 + 8;
  memcpy(__dst, (const void *)(a1 + 8), 0x1C0uLL);
  PCString::set((PCString *)__dst + 56, (const PCString *)(a1 + 456));
  uint64_t v5 = *(void *)(a1 + 464);
  *((_DWORD *)__dst + 116) = *(_DWORD *)(a1 + 472);
  *((void *)__dst + 57) = v5;
  PCCFRef<CGColorSpace *>::operator=((CGColorSpace **)__dst + 59, (CGColorSpace **)(a1 + 480));
  *((_OWORD *)__dst + 30) = *(_OWORD *)(v4 + 480);
  if (*(_DWORD *)(a1 + 392)) {
    return 0;
  }
  else {
    return 7;
  }
}

uint64_t PMClip::getLayerDescription(PMClip *this, PMLayerDescription *a2, unsigned int a3)
{
  unsigned int v3 = *((_DWORD *)this + 98);
  if (v3) {
    BOOL v4 = v3 >= a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4) {
    return 7;
  }
  PMLayerDescription::operator=((uint64_t)a2, *((void *)this + 143) + 48 * a3);
  return 0;
}

uint64_t PMClip::getMediaID@<X0>(PMClip *this@<X0>, PCSharedCount *a2@<X8>)
{
  PCSharedCount::PCSharedCount(a2);
  PCMutex::lock((PCMutex *)((char *)this + 1256));
  if (*(void *)this)
  {
    BOOL v4 = *(void (**)(PMClip *, char *, PCSharedCount *, void))(*(void *)this + 56);
    if (v4) {
      v4(this, (char *)this + 1224, a2, *((void *)this + 152));
    }
  }
  return PCMutex::unlock((PCMutex *)((char *)this + 1256));
}

void sub_1B7E4C924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)&a9);
  PCString::~PCString(v9);
  _Unwind_Resume(a1);
}

uint64_t PMClip::prerollBegin(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, double a5)
{
  CMTimeEpoch v10 = (PCMutex *)(a1 + 1256);
  uint64_t v16 = a1 + 1256;
  PCMutex::lock((PCMutex *)(a1 + 1256));
  char v17 = 1;
  if (*(void *)a1 && *(_DWORD *)(a1 + 1244))
  {
    int v11 = *(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t, uint64_t, void, double))(*(void *)a1 + 120);
    if (v11)
    {
      long long v14 = *a2;
      uint64_t v15 = *((void *)a2 + 2);
      uint64_t v12 = v11(a1, a1 + 1224, &v14, a3, a4, *(void *)(a1 + 1216), a5);
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 6;
  }
  PCMutex::unlock(v10);
  return v12;
}

void sub_1B7E4CA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PMClip::prerollEnd(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (PCMutex *)(a1 + 1256);
  PCMutex::lock((PCMutex *)(a1 + 1256));
  if (*(void *)a1 && *(_DWORD *)(a1 + 1244))
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 128);
    if (v5) {
      uint64_t v6 = v5(a1, a1 + 1224, a2, *(void *)(a1 + 1216));
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 6;
  }
  PCMutex::unlock(v4);
  return v6;
}

void sub_1B7E4CACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PMClip::setRate(uint64_t a1, double a2, uint64_t a3, uint64_t a4)
{
  double v7 = (PCMutex *)(a1 + 1256);
  PCMutex::lock((PCMutex *)(a1 + 1256));
  if (*(void *)a1 && *(_DWORD *)(a1 + 1244))
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, double))(*(void *)a1 + 136);
    if (v8) {
      uint64_t v9 = v8(a1, a1 + 1224, a4, *(void *)(a1 + 1216), a2);
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 6;
  }
  PCMutex::unlock(v7);
  return v9;
}

void sub_1B7E4CB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PMClip::scheduleTokens(uint64_t a1, long long **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (PCMutex *)(a1 + 1256);
  v13[3] = a1 + 1256;
  PCMutex::lock((PCMutex *)(a1 + 1256));
  char v14 = 1;
  if (*(void *)a1 && *(_DWORD *)(a1 + 1244))
  {
    memset(v13, 0, 24);
    CMTime v12 = *(CMTime *)(a1 + 320);
    transformTokenTimes(a2, v13, &v12);
    if (*(void *)a1
      && (uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, void))(*(void *)a1 + 144)) != 0)
    {
      uint64_t v10 = v9(a1, a1 + 1224, v13, a3, a4, *(void *)(a1 + 1216));
    }
    else
    {
      uint64_t v10 = 0;
    }
    v12.value = (CMTimeValue)v13;
    std::vector<std::pair<CMTime,std::vector<CMTime>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  }
  else
  {
    uint64_t v10 = 6;
  }
  PCMutex::unlock(v8);
  return v10;
}

void sub_1B7E4CC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  a9 = (void **)&a12;
  std::vector<std::pair<CMTime,std::vector<CMTime>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void transformTokenTimes(long long **a1, uint64_t *a2, CMTime *a3)
{
  unsigned int v3 = *a1;
  long long v29 = a1[1];
  if (*a1 != v29)
  {
    do
    {
      std::vector<std::pair<CMTime,std::vector<CMTime>>>::resize(a2, 1 - 0x5555555555555555 * ((a2[1] - *a2) >> 4));
      uint64_t v5 = *a2;
      uint64_t v6 = -1 - 0x5555555555555555 * ((a2[1] - *a2) >> 4);
      uint64_t v7 = *a2 + 48 * v6;
      long long v8 = *v3;
      *(void *)(v7 + 16) = *((void *)v3 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      uint64_t v10 = (long long *)*((void *)v3 + 3);
      uint64_t v9 = (long long *)*((void *)v3 + 4);
      if (v10 != v9)
      {
        int v11 = (void *)(v5 + 48 * v6);
        CMTime v12 = (void **)(v11 + 3);
        PCString v13 = (void **)(v11 + 4);
        char v14 = v11 + 5;
        do
        {
          long long v15 = *v10;
          v34.epoch = *((void *)v10 + 2);
          *(_OWORD *)&v34.value = v15;
          CMTime v33 = *a3;
          PC_CMTimeFloorToSampleDuration(&v34, &v33, (uint64_t)&v31);
          uint64_t v16 = (char *)*v13;
          if ((unint64_t)*v13 >= *v14)
          {
            unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((v16 - (unsigned char *)*v12) >> 3);
            unint64_t v20 = v19 + 1;
            if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((uint64_t)(*v14 - (void)*v12) >> 3) > v20) {
              unint64_t v20 = 0x5555555555555556 * ((uint64_t)(*v14 - (void)*v12) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v14 - (void)*v12) >> 3) >= 0x555555555555555) {
              unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v21 = v20;
            }
            if (v21) {
              CMTime v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cc::point_t<double,false,false>>>((uint64_t)v14, v21);
            }
            else {
              CMTime v22 = 0;
            }
            uint64_t v23 = &v22[24 * v19];
            long long v24 = v31;
            *((void *)v23 + 2) = v32;
            *(_OWORD *)uint64_t v23 = v24;
            unint64_t v25 = (char *)*v13;
            PCString v26 = (char *)*v12;
            long long v27 = v23;
            if (*v13 != *v12)
            {
              do
              {
                long long v28 = *(_OWORD *)(v25 - 24);
                *((void *)v27 - 1) = *((void *)v25 - 1);
                *(_OWORD *)(v27 - 24) = v28;
                v27 -= 24;
                v25 -= 24;
              }
              while (v25 != v26);
              unint64_t v25 = (char *)*v12;
            }
            *CMTime v12 = v27;
            unint64_t v18 = v23 + 24;
            *PCString v13 = v23 + 24;
            *char v14 = &v22[24 * v21];
            if (v25) {
              operator delete(v25);
            }
          }
          else
          {
            long long v17 = v31;
            *((void *)v16 + 2) = v32;
            *(_OWORD *)uint64_t v16 = v17;
            unint64_t v18 = v16 + 24;
          }
          *PCString v13 = v18;
          uint64_t v10 = (long long *)((char *)v10 + 24);
        }
        while (v10 != v9);
      }
      v3 += 3;
    }
    while (v3 != v29);
  }
}

uint64_t PMClip::hintTokensWillImage(uint64_t a1, long long **a2, uint64_t a3)
{
  uint64_t v6 = (PCMutex *)(a1 + 1256);
  v11[3] = a1 + 1256;
  PCMutex::lock((PCMutex *)(a1 + 1256));
  char v12 = 1;
  if (*(void *)a1 && *(_DWORD *)(a1 + 1244))
  {
    memset(v11, 0, 24);
    CMTime v10 = *(CMTime *)(a1 + 320);
    transformTokenTimes(a2, v11, &v10);
    if (*(void *)a1
      && (uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void))(*(void *)a1 + 152)) != 0)
    {
      uint64_t v8 = v7(a1, a1 + 1224, v11, a3, *(void *)(a1 + 1216));
    }
    else
    {
      uint64_t v8 = 0;
    }
    v10.value = (CMTimeValue)v11;
    std::vector<std::pair<CMTime,std::vector<CMTime>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
  }
  else
  {
    uint64_t v8 = 6;
  }
  PCMutex::unlock(v6);
  return v8;
}

void sub_1B7E4CFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  a9 = (void **)&a12;
  std::vector<std::pair<CMTime,std::vector<CMTime>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t PMClip::getTokensImage(uint64_t a1, long long **a2, uint64_t a3)
{
  uint64_t v6 = (PCMutex *)(a1 + 1256);
  v11[3] = a1 + 1256;
  PCMutex::lock((PCMutex *)(a1 + 1256));
  char v12 = 1;
  if (*(void *)a1 && *(_DWORD *)(a1 + 1244))
  {
    memset(v11, 0, 24);
    CMTime v10 = *(CMTime *)(a1 + 320);
    transformTokenTimes(a2, v11, &v10);
    if (*(void *)a1
      && (uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void))(*(void *)a1 + 160)) != 0)
    {
      uint64_t v8 = v7(a1, a1 + 1224, v11, a3, *(void *)(a1 + 1216));
    }
    else
    {
      uint64_t v8 = 0;
    }
    v10.value = (CMTimeValue)v11;
    std::vector<std::pair<CMTime,std::vector<CMTime>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
  }
  else
  {
    uint64_t v8 = 6;
  }
  PCMutex::unlock(v6);
  return v8;
}

void sub_1B7E4D0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  a9 = (void **)&a12;
  std::vector<std::pair<CMTime,std::vector<CMTime>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t PMClip::pruneTokensAtTime(PMClip *this, const CMTime *a2, const char *a3)
{
  uint64_t v6 = (PCMutex *)((char *)this + 1256);
  char v12 = (char *)this + 1256;
  PCMutex::lock((PCMutex *)((char *)this + 1256));
  char v13 = 1;
  if (*(void *)this && *((_DWORD *)this + 311))
  {
    uint64_t v7 = *(uint64_t (**)(PMClip *, char *, long long *, const char *, void))(*(void *)this + 168);
    if (v7)
    {
      long long v10 = *(_OWORD *)&a2->value;
      CMTimeEpoch epoch = a2->epoch;
      uint64_t v8 = v7(this, (char *)this + 1224, &v10, a3, *((void *)this + 152));
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 6;
  }
  PCMutex::unlock(v6);
  return v8;
}

void sub_1B7E4D1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PMClip::pruneTokensExceptAtTime(PMClip *this, const CMTime *a2, const char *a3)
{
  uint64_t v6 = (PCMutex *)((char *)this + 1256);
  char v12 = (char *)this + 1256;
  PCMutex::lock((PCMutex *)((char *)this + 1256));
  char v13 = 1;
  if (*(void *)this && *((_DWORD *)this + 311))
  {
    uint64_t v7 = *(uint64_t (**)(PMClip *, char *, long long *, const char *, void))(*(void *)this + 176);
    if (v7)
    {
      long long v10 = *(_OWORD *)&a2->value;
      CMTimeEpoch epoch = a2->epoch;
      uint64_t v8 = v7(this, (char *)this + 1224, &v10, a3, *((void *)this + 152));
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 6;
  }
  PCMutex::unlock(v6);
  return v8;
}

void sub_1B7E4D27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  PCLockSentry<PCMutex>::~PCLockSentry((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PMClip::pruneAllTokens(PMClip *this, const char *a2)
{
  BOOL v4 = (PCMutex *)((char *)this + 1256);
  PCMutex::lock((PCMutex *)((char *)this + 1256));
  if (*(void *)this && *((_DWORD *)this + 311))
  {
    uint64_t v5 = *(uint64_t (**)(PMClip *, char *, const char *, void))(*(void *)this + 184);
    if (v5) {
      uint64_t v6 = v5(this, (char *)this + 1224, a2, *((void *)this + 152));
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 6;
  }
  PCMutex::unlock(v4);
  return v6;
}

void sub_1B7E4D32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PMClip::getDynamicRangeType(PMClip *this)
{
  int v1 = *((_DWORD *)this + 117);
  if (v1 == 8 || v1 == 18) {
    return 1;
  }
  if (v1 == 16) {
    return 2;
  }
  uint64_t v5 = (CGColorSpace *)*((void *)this + 60);
  if (v5)
  {
    if (!CGColorSpaceIsHLGBased(v5))
    {
      if (CGColorSpaceIsPQBased(*((CGColorSpaceRef *)this + 60))) {
        return 2;
      }
      return 0;
    }
    return 1;
  }
  return 0;
}

uint64_t PMClip::getFrame(uint64_t a1, CMTime *a2, uint64_t a3, PMFrameRequest *a4, uint64_t a5, HGNode **a6, uint64_t a7)
{
  char v13 = (PCMutex *)(a1 + 1256);
  PCMutex::lock((PCMutex *)(a1 + 1256));
  if (*(void *)a1 && *(_DWORD *)(a1 + 1244))
  {
    if (*(void *)(*(void *)a1 + 80))
    {
      double v15 = FigTimeToFrameWithRate(a2, ceil(*(double *)(a1 + 360) + -0.01));
      URLforIndex = (PCURL *)(a1 + 1224);
      if (*(unsigned char *)(a1 + 1240)
        && ((float v17 = v15, *(_DWORD *)(a1 + 344) - 1 >= ((int)v17 & ~((int)v17 >> 31)))
          ? (int v18 = (int)v17 & ~((int)v17 >> 31))
          : (int v18 = *(_DWORD *)(a1 + 344) - 1),
            (URLforIndex = (PCURL *)PCURL::getURLforIndex((const __CFURL **)(a1 + 1224), v18)) == 0))
      {
        uint64_t FrameNonCached = 11;
      }
      else
      {
        uint64_t FrameNonCached = PMClip::getFrameNonCached((void *)a1, (long long *)&a2->value, v14, a4, (uint64_t)URLforIndex, a5, a6, a7);
        if (*(unsigned char *)(a1 + 1240))
        {
          PCURL::~PCURL(URLforIndex);
          MEMORY[0x1BA9BFBA0](v20, 0x60C4044C4A2DFLL);
        }
      }
    }
    else
    {
      uint64_t FrameNonCached = 1;
    }
  }
  else
  {
    uint64_t FrameNonCached = 6;
  }
  PCMutex::unlock(v13);
  return FrameNonCached;
}

void sub_1B7E4D4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PMClip::getFrameNonCached(void *a1, long long *a2, uint64_t a3, PMFrameRequest *a4, uint64_t a5, uint64_t a6, HGNode **a7, uint64_t a8)
{
  CMTime v44 = *(CMTime *)(a1 + 40);
  memset(&v43, 0, sizeof(v43));
  CMTime v42 = *(CMTime *)(a1 + 40);
  PC_CMTimeHalve(&v42, (uint64_t)&v43);
  memset(&v41, 0, sizeof(v41));
  v37[0] = *(CMTime *)a2;
  CMTime time1 = v44;
  PC_CMTimeFloorToSampleDuration(v37, &time1, (uint64_t)&v41);
  PMFrameRequest::PMFrameRequest((uint64_t)v37, (uint64_t)a4);
  if ((int)PMFrameRequest::getResolutionMode(a4) > 0)
  {
    int v15 = 0;
LABEL_3:
    int v38 = v15;
    goto LABEL_4;
  }
  if (v38 == 2)
  {
    memset(&v36, 0, sizeof(v36));
    operator/(a2, (uint64_t)&v44, (uint64_t)&v36);
    CMTimeMake(&v45, 1, 1);
    CMTime time1 = v36;
    CMTime time2 = v45;
    PC_CMTimeFloorToSampleDuration(&time1, &time2, (uint64_t)&v46);
    CMTime time1 = v36;
    CMTime time2 = v46;
    PC_CMTimeSaferSubtract(&time1, &time2, (uint64_t)&v47);
    operator*((long long *)&v47.value, (uint64_t)&v44, (uint64_t)&time1);
    CMTime v36 = time1;
    CMTime time2 = v43;
    if (CMTimeCompare(&time1, &time2) < 0) {
      goto LABEL_4;
    }
    int v15 = 1;
    goto LABEL_3;
  }
  if (v38 == 1)
  {
    memset(&v36, 0, sizeof(v36));
    operator/(a2, (uint64_t)&v44, (uint64_t)&v36);
    CMTimeMake(&v45, 1, 1);
    CMTime time1 = v36;
    CMTime time2 = v45;
    PC_CMTimeFloorToSampleDuration(&time1, &time2, (uint64_t)&v46);
    CMTime time1 = v36;
    CMTime time2 = v46;
    PC_CMTimeSaferSubtract(&time1, &time2, (uint64_t)&v47);
    operator*((long long *)&v47.value, (uint64_t)&v44, (uint64_t)&time1);
    CMTime v36 = time1;
    CMTime time2 = v43;
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    {
      int v15 = 2;
      goto LABEL_3;
    }
  }
LABEL_4:
  if (!*((_DWORD *)a1 + 100) || (int)PMFrameRequest::getResolutionMode(a4) >= 1)
  {
    uint64_t v16 = (*(uint64_t (**)(void *, uint64_t, CMTime *, CMTime *, uint64_t, HGNode **, uint64_t, void))(*a1 + 80))(a1, a5, &v41, v37, a6, a7, a8, a1[152]);
    if (v16)
    {
      float v17 = (HGNode *)HGObject::operator new(0x1A0uLL);
      HGNode::HGNode(v17);
      int v18 = *a7;
      if (*a7 != v17)
      {
        if (!v18)
        {
LABEL_10:
          *a7 = v17;
          goto LABEL_60;
        }
LABEL_9:
        (*(void (**)(HGNode *))(*(void *)v18 + 24))(v18);
        goto LABEL_10;
      }
      if (!v17) {
        goto LABEL_60;
      }
      goto LABEL_31;
    }
    int v19 = v38;
    if (v38)
    {
      uint64_t v20 = (HGNode *)HGObject::operator new(0x1B0uLL);
      PMStripField::PMStripField(v20, v19 == 1);
      (*(void (**)(HGNode *, void, HGNode *))(*(void *)v20 + 120))(v20, 0, *a7);
      unint64_t v21 = *a7;
      if (*a7 != v20)
      {
        if (v21) {
          (*(void (**)(HGNode *))(*(void *)v21 + 24))(v21);
        }
        *a7 = v20;
        (*(void (**)(HGNode *))(*(void *)v20 + 16))(v20);
      }
      (*(void (**)(HGNode *))(*(void *)v20 + 24))(v20);
    }
    uint64_t v16 = 0;
    goto LABEL_22;
  }
  if (v38)
  {
    CMTime v46 = v41;
    if (*((_DWORD *)a1 + 100) != v38)
    {
      CMTime time2 = v41;
      CMTime v47 = v43;
      PC_CMTimeSaferAdd(&time2, &v47, (uint64_t)&time1);
      CMTime v46 = time1;
    }
    uint64_t v16 = (*(uint64_t (**)(void *, uint64_t, CMTime *, CMTime *, uint64_t, HGNode **, uint64_t, void))(*a1 + 80))(a1, a5, &v46, v37, a6, a7, a8, a1[152]);
    if (v16)
    {
      float v17 = (HGNode *)HGObject::operator new(0x1A0uLL);
      HGNode::HGNode(v17);
      int v18 = *a7;
      if (*a7 != v17)
      {
        if (!v18) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      if (!v17) {
        goto LABEL_60;
      }
LABEL_31:
      (*(void (**)(HGNode *))(*(void *)v17 + 24))(v17);
      goto LABEL_60;
    }
LABEL_22:
    *((unsigned char *)a1 + 1249) = 0;
    goto LABEL_60;
  }
  v46.value = 0;
  v45.value = 0;
  if (*((_DWORD *)a1 + 100) == 2) {
    int v22 = 2;
  }
  else {
    int v22 = 1;
  }
  if (*((_DWORD *)a1 + 100) == 2) {
    int v23 = 1;
  }
  else {
    int v23 = 2;
  }
  int v38 = v22;
  uint64_t v16 = (*(uint64_t (**)(void *, uint64_t, CMTime *, CMTime *, uint64_t, CMTime *, uint64_t, void))(*a1 + 80))(a1, a5, &v41, v37, a6, &v46, a8, a1[152]);
  if (v16)
  {
    long long v24 = (HGNode *)HGObject::operator new(0x1A0uLL);
    HGNode::HGNode(v24);
    unint64_t v25 = *a7;
    if (*a7 != v24)
    {
      if (v25) {
        goto LABEL_49;
      }
      goto LABEL_50;
    }
    if (!v24) {
      goto LABEL_56;
    }
LABEL_55:
    (*(void (**)(HGNode *))(*(void *)v24 + 24))(v24);
    goto LABEL_56;
  }
  int v38 = v23;
  PCString v26 = *(uint64_t (**)(void *, uint64_t, CMTime *, CMTime *, uint64_t, CMTime *, uint64_t, void, double))(*a1 + 80);
  CMTime time1 = v41;
  CMTime time2 = v43;
  double v27 = PC_CMTimeSaferAdd(&time1, &time2, (uint64_t)&v47);
  uint64_t v16 = v26(a1, a5, &v47, v37, a6, &v45, a8, a1[152], v27);
  if (!v16)
  {
    PCPrint("File %s, line %d should not have been reached:\n\t", v28, v29, v30, v31, v32, v33, v34, (char)"/Library/Caches/com.apple.xbs/Sources/MotioniOS/ProMedia/PMClip.mm");
    pcAbortImpl();
  }
  long long v24 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v24);
  unint64_t v25 = *a7;
  if (*a7 == v24)
  {
    if (!v24) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  if (v25) {
LABEL_49:
  }
    (*(void (**)(HGNode *))(*(void *)v25 + 24))(v25);
LABEL_50:
  *a7 = v24;
LABEL_56:
  if (v45.value) {
    (*(void (**)(CMTimeValue))(*(void *)v45.value + 24))(v45.value);
  }
  if (v46.value) {
    (*(void (**)(CMTimeValue))(*(void *)v46.value + 24))(v46.value);
  }
LABEL_60:
  PCCFRef<CGColorSpace *>::~PCCFRef(&v40);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v39);
  return v16;
}

void sub_1B7E4DD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,CGColorSpace *a39,CGColorSpace *a40)
{
  if (v40) {
    (*(void (**)(uint64_t))(*(void *)v40 + 24))(v40);
  }
  uint64_t v43 = *(void *)(v41 - 232);
  if (v43) {
    (*(void (**)(uint64_t))(*(void *)v43 + 24))(v43);
  }
  uint64_t v44 = *(void *)(v41 - 208);
  if (v44) {
    (*(void (**)(uint64_t))(*(void *)v44 + 24))(v44);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef(&a40);
  PCCFRef<CGColorSpace *>::~PCCFRef(&a39);
  _Unwind_Resume(a1);
}

double PMClip::setFrameRate(PMClip *this, double a2)
{
  double v4 = a2 + 0.5 + 0.0000001;
  *((double *)this + 45) = a2;
  int32_t v5 = 10000 * vcvtmd_s64_f64(v4);
  LODWORD(v4) = *((_DWORD *)this + 86);
  PC_CMTimeMakeWithSecondsRoundToNearest(v5, &v7, (double)*(unint64_t *)&v4 / a2);
  *(CMTime *)((char *)this + 296) = v7;
  PC_CMTimeMakeWithSecondsRoundToNearest(v5, &v7, 1.0 / a2);
  double result = *(double *)&v7.value;
  *(CMTime *)((char *)this + 320) = v7;
  return result;
}

CGColorSpace **PMClip::guessAlphaFormat(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, unsigned char *a5)
{
  *a3 = 0;
  PCColor::PCColor(&v17);
  long long v10 = *(_OWORD *)&v17.var0.var1[1];
  *(_OWORD *)a4 = *(_OWORD *)&v17.var0.var0;
  *(_OWORD *)(a4 + 16) = v10;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)&v17.var0.var1[3];
  int v11 = *(CGColorSpace **)(a4 + 48);
  obj = v17.var1._obj;
  if (v11 && v11 != v17.var1._obj)
  {
    PCCFRefTraits<CGColorSpace *>::release(v11);
    obj = v17.var1._obj;
  }
  *(void *)(a4 + 48) = obj;
  v17.var1._obj = 0;
  double result = PCCFRef<CGColorSpace *>::~PCCFRef(&v17.var1._obj);
  *a5 = 0;
  if (*(_DWORD *)(a1 + 392) && *(void *)(*(void *)a1 + 40))
  {
    URLforIndex = (PCURL *)(a1 + 1224);
    int isSequence = PCURL::isSequence((const __CFURL **)(a1 + 1224));
    if (isSequence) {
      URLforIndex = (PCURL *)PCURL::getURLforIndex((const __CFURL **)(a1 + 1224), 0);
    }
    double result = (CGColorSpace **)(*(uint64_t (**)(uint64_t, PCURL *, uint64_t, _DWORD *, unsigned char *, void))(*(void *)a1 + 40))(a1, URLforIndex, a2, a3, a5, *(void *)(a1 + 1216));
    if (!result) {
      *(unsigned char *)(a1 + 453) = *a3 == 2;
    }
    char v16 = isSequence ^ 1;
    if (!URLforIndex) {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      PCURL::~PCURL(URLforIndex);
      return (CGColorSpace **)MEMORY[0x1BA9BFBA0]();
    }
  }
  return result;
}

void sub_1B7E4E0F0(_Unwind_Exception *a1)
{
  PCCFRef<CGColorSpace *>::~PCCFRef(v1);
  _Unwind_Resume(a1);
}

uint64_t PMClip::setAlphaFormat(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(_DWORD *)(result + 392))
  {
    uint64_t v5 = result;
    if (*(void *)(*(void *)result + 48))
    {
      URLforIndex = (PCURL *)(result + 1224);
      int isSequence = PCURL::isSequence((const __CFURL **)(result + 1224));
      if (isSequence) {
        URLforIndex = (PCURL *)PCURL::getURLforIndex((const __CFURL **)(v5 + 1224), 0);
      }
      double result = (*(uint64_t (**)(uint64_t, PCURL *, uint64_t, uint64_t, uint64_t, void))(*(void *)v5 + 48))(v5, URLforIndex, a2, a3, a5, *(void *)(v5 + 1216));
      char v11 = isSequence ^ 1;
      if (!URLforIndex) {
        char v11 = 1;
      }
      if ((v11 & 1) == 0)
      {
        PCURL::~PCURL(URLforIndex);
        JUMPOUT(0x1BA9BFBA0);
      }
    }
  }
  return result;
}

void PMFormatDescription::~PMFormatDescription(PMFormatDescription *this)
{
}

void PMAudioDescription::~PMAudioDescription(PCString *this)
{
  uint64_t v2 = this + 11;
  std::vector<PMAudioChannelDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)&v2);
  PCString::~PCString(this + 7);
  PCString::~PCString(this);
}

void std::vector<PMAudioChannelDescription>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  int v1 = *a1;
  uint64_t v2 = (PCString *)**a1;
  if (v2)
  {
    double v4 = (PCString *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        PCString::~PCString(v4 - 2);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::pair<CMTime,std::vector<CMTime>>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 4);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::pair<CMTime,std::vector<CMTime>>>::__append(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 48 * a2;
    while (v3 != v7)
    {
      uint64_t v8 = *(void **)(v3 - 24);
      if (v8)
      {
        *(void *)(v3 - 16) = v8;
        operator delete(v8);
      }
      v3 -= 48;
    }
    a1[1] = v7;
  }
}

void std::vector<std::pair<CMTime,std::vector<CMTime>>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 4) >= a2)
  {
    if (a2)
    {
      size_t v13 = 48 * ((48 * a2 - 48) / 0x30) + 48;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 4);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x555555555555555) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 4);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v11 = 0x555555555555555;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      char v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HGBinding>>(v4, v11);
    }
    else {
      char v12 = 0;
    }
    int v15 = v12;
    char v16 = &v12[48 * v8];
    int v18 = &v12[48 * v11];
    size_t v14 = 48 * ((48 * a2 - 48) / 0x30) + 48;
    bzero(v16, v14);
    PCColor v17 = &v16[v14];
    std::vector<std::pair<CMTime,std::vector<CMTime>>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::pair<CMTime,std::vector<CMTime>>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_1B7E4E4F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::pair<CMTime,std::vector<CMTime>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<CMTime,std::vector<CMTime>>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<CMTime,std::vector<CMTime>>>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<CMTime,std::vector<CMTime>>>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      uint64_t v8 = *(void *)(a3 - 32);
      *(_OWORD *)(v7 - 48) = *(_OWORD *)(a3 - 48);
      *(void *)(v7 - 32) = v8;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 48;
      *((void *)&v14 + 1) -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<CMTime,std::vector<CMTime>>>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<CMTime,std::vector<CMTime>>>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<CMTime,std::vector<CMTime>>>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<CMTime,std::vector<CMTime>>>,std::reverse_iterator<std::pair<CMTime,std::vector<CMTime>>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)(v1 + 24);
    if (v3)
    {
      *(void *)(v1 + 32) = v3;
      operator delete(v3);
    }
    v1 += 48;
  }
}

uint64_t std::__split_buffer<std::pair<CMTime,std::vector<CMTime>>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::pair<CMTime,std::vector<CMTime>>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 48;
    uint64_t v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 48;
    }
  }
}

void std::vector<PMLayerDescription>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (PCString *)**a1;
  if (v2)
  {
    uint64_t v4 = (PCString *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 6;
        PCString::~PCString(v4 - 1);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<PMAudioDescription>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (PCString *)**a1;
  if (v2)
  {
    uint64_t v4 = (PCString *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        PMAudioDescription::~PMAudioDescription(v4 - 14);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::vector<PMLayerDescription>::__init_with_size[abi:ne180100]<PMLayerDescription*,PMLayerDescription*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::pair<CMTime,std::vector<CMTime>>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<PMLayerDescription>,PMLayerDescription*,PMLayerDescription*,PMLayerDescription*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1B7E4E8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<PMLayerDescription>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<PMLayerDescription>,PMLayerDescription*,PMLayerDescription*,PMLayerDescription*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      PMLayerDescription::PMLayerDescription((PMLayerDescription *)(a4 + v7), (const PCString *)(a2 + v7));
      v7 += 48;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_1B7E4E940(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    uint64_t v4 = v1 - 8;
    do
    {
      PCString::~PCString((PCString *)(v4 + v2));
      v2 -= 48;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<PMAudioDescription>::__init_with_size[abi:ne180100]<PMAudioDescription*,PMAudioDescription*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<PMAudioDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<PMAudioDescription>,PMAudioDescription*,PMAudioDescription*,PMAudioDescription*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1B7E4E9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<PMAudioDescription>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<PMAudioDescription>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PSHeliumNode::TextureSpriteBatcher::Vertex>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[112 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<PMAudioDescription>,PMAudioDescription*,PMAudioDescription*,PMAudioDescription*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      PMAudioDescription::PMAudioDescription((PMAudioDescription *)(a4 + v7), (const PMAudioDescription *)(a2 + v7));
      v7 += 112;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_1B7E4EAA4(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    uint64_t v4 = v1 - 112;
    do
    {
      PMAudioDescription::~PMAudioDescription((PCString *)(v4 + v2));
      v2 -= 112;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<PMLayerDescription>::__push_back_slow_path<PMLayerDescription const&>(uint64_t *a1, const PCString *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  PCColor v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HGBinding>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  long long v13 = v10;
  long long v14 = (PMLayerDescription *)&v10[48 * v4];
  char v16 = &v10[48 * v9];
  PMLayerDescription::PMLayerDescription(v14, a2);
  int v15 = (char *)v14 + 48;
  std::vector<PMLayerDescription>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<PMLayerDescription>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1B7E4EBBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<PMLayerDescription>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<PMLayerDescription>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PMLayerDescription>,std::reverse_iterator<PMLayerDescription*>,std::reverse_iterator<PMLayerDescription*>,std::reverse_iterator<PMLayerDescription*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PMLayerDescription>,std::reverse_iterator<PMLayerDescription*>,std::reverse_iterator<PMLayerDescription*>,std::reverse_iterator<PMLayerDescription*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = 0;
  uint64_t v11 = a7 - 48;
  while (a3 + v10 != a5)
  {
    char v12 = (PMLayerDescription *)(v11 + v10);
    v10 -= 48;
    PMLayerDescription::PMLayerDescription(v12, (const PCString *)(v10 + a3));
  }
  return a6;
}

uint64_t std::__split_buffer<PMLayerDescription>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    PCString::~PCString((PCString *)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::vector<PMAudioDescription>::__push_back_slow_path<PMAudioDescription const&>(uint64_t *a1, const PMAudioDescription *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x124924924924924) {
    unint64_t v9 = 0x249249249249249;
  }
  else {
    unint64_t v9 = v5;
  }
  PCColor v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PSHeliumNode::TextureSpriteBatcher::Vertex>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  long long v13 = v10;
  long long v14 = (PMAudioDescription *)&v10[112 * v4];
  char v16 = &v10[112 * v9];
  PMAudioDescription::PMAudioDescription(v14, a2);
  int v15 = (char *)v14 + 112;
  std::vector<PMAudioDescription>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<PMAudioDescription>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1B7E4EE40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<PMAudioDescription>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<PMAudioDescription>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PMAudioDescription>,std::reverse_iterator<PMAudioDescription*>,std::reverse_iterator<PMAudioDescription*>,std::reverse_iterator<PMAudioDescription*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PMAudioDescription>,std::reverse_iterator<PMAudioDescription*>,std::reverse_iterator<PMAudioDescription*>,std::reverse_iterator<PMAudioDescription*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = 0;
  uint64_t v11 = a7 - 112;
  while (a3 + v10 != a5)
  {
    char v12 = (PMAudioDescription *)(v11 + v10);
    v10 -= 112;
    PMAudioDescription::PMAudioDescription(v12, (const PMAudioDescription *)(v10 + a3));
  }
  return a6;
}

uint64_t std::__split_buffer<PMAudioDescription>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 112;
    PMAudioDescription::~PMAudioDescription((PCString *)(i - 112));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void PMMediaManager::PMMediaManager(PMMediaManager *this)
{
  PCSingleton::PCSingleton(this, 0);
  *(void *)uint64_t v1 = &unk_1F119AD68;
  *((void *)v1 + 1) = (char *)v1 + 8;
  *((void *)v1 + 2) = (char *)v1 + 8;
  *((void *)v1 + 3) = 0;
  initMyCoreGraphicsPlugin(v1);
}

void sub_1B7E4F01C(_Unwind_Exception *a1)
{
  std::__list_imp<unsigned int>::clear(v2);
  PCSingleton::~PCSingleton(v1);
  _Unwind_Resume(a1);
}

void PMMediaManager::~PMMediaManager(PMMediaManager *this)
{
  *(void *)this = &unk_1F119AD68;
  uint64_t v2 = (void *)((char *)this + 8);
  for (uint64_t i = (void *)*((void *)this + 2); i != v2; uint64_t i = (void *)i[1])
  {
    uint64_t v4 = i[2];
    uint64_t v5 = *(void (**)(void))(v4 + 272);
    if (v5) {
      v5(i[2]);
    }
    MEMORY[0x1BA9BFBA0](v4, 0x80C40B3C365DALL);
  }
  std::__list_imp<unsigned int>::clear(v2);
  std::__list_imp<unsigned int>::clear(v2);

  PCSingleton::~PCSingleton(this);
}

{
  uint64_t vars8;

  PMMediaManager::~PMMediaManager(this);

  JUMPOUT(0x1BA9BFBA0);
}

uint64_t PMMediaManager::getInstance(PMMediaManager *this)
{
  if (PMMediaManager::getInstance(void)::once != -1) {
    dispatch_once(&PMMediaManager::getInstance(void)::once, &__block_literal_global_89);
  }
  return PMMediaManager::_instance;
}

void ___ZN14PMMediaManager11getInstanceEv_block_invoke()
{
}

void sub_1B7E4F1AC(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x10A1C40D109E33BLL);
  _Unwind_Resume(a1);
}

void *PMMediaManager::addPlugin(void *a1, uint64_t a2)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v5 = a1[1];
  result[1] = ++a1;
  result[2] = a2;
  void *result = v5;
  *(void *)(v5 + 8) = result;
  *a1 = result;
  ++a1[2];
  return result;
}

uint64_t PMMediaManager::findReader(PMMediaManager *this, const __CFURL **a2)
{
  PCURL::getExtension(a2, (PCURL *)&v10);
  for (uint64_t i = 0; i != 13; ++i)
  {
    PCString::PCString(&v9, dissallowExtensions[i]);
    int v4 = PCString::caseInsensitiveCompare(&v10, &v9);
    PCString::~PCString(&v9);
    if (!v4)
    {
      uint64_t v6 = 0;
      goto LABEL_10;
    }
  }
  if ([@"public.jpeg" isEqualToString:@"com.adobe.photoshop-image"])
  {
    uint64_t v5 = (char *)this + 64;
  }
  else
  {
    int v7 = [@"public.jpeg" isEqualToString:@"com.ilm.openexr-image"];
    uint64_t v5 = (char *)this + 80;
    if (v7) {
      uint64_t v5 = (char *)this + 56;
    }
  }
  uint64_t v6 = *(void *)v5;
LABEL_10:
  PCString::~PCString(&v10);
  return v6;
}

void sub_1B7E4F2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCString a10)
{
}

uint64_t PMMediaManager::open(PMMediaManager *this, const __CFURL **a2, PMClip **a3, PMPluginInterface *a4)
{
  v13[143] = *MEMORY[0x1E4F143B8];
  PMFormatDescription::PMFormatDescription((PMFormatDescription *)v13);
  *a3 = 0;
  bzero(v13, 0x478uLL);
  if (a4)
  {
    v13[0] = a4;
    goto LABEL_3;
  }
  int isSequence = PCURL::isSequence(a2);
  URLforIndex = a2;
  if (isSequence) {
    URLforIndex = (const __CFURL **)PCURL::getURLforIndex(a2, 0);
  }
  v13[0] = PMMediaManager::findReader(this, URLforIndex);
  if (v13[0])
  {
    if (isSequence)
    {
      PCURL::~PCURL((PCURL *)URLforIndex);
      MEMORY[0x1BA9BFBA0](v11);
    }
LABEL_3:
    operator new();
  }
  if (isSequence)
  {
    PCURL::~PCURL((PCURL *)URLforIndex);
    MEMORY[0x1BA9BFBA0](v12);
  }
  PMFormatDescription::~PMFormatDescription((PMFormatDescription *)v13);
  return 1;
}

void sub_1B7E4F49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PMFrameRequest::getAlphaType(PMFrameRequest *this)
{
  if (*((_DWORD *)this + 23)) {
    return 1;
  }
  else {
    return *((unsigned int *)this + 42);
  }
}

BOOL PMFrameRequest::getAlphaInvert(PMFrameRequest *this)
{
  return !*((_DWORD *)this + 23) && *((unsigned char *)this + 172) != 0;
}

uint64_t PMFrameRequest::setResolutionMode(uint64_t result, int a2)
{
  *(_DWORD *)(result + 164) = a2;
  return result;
}

uint64_t PMFrameRequest::getResolutionMode(PMFrameRequest *this)
{
  return *((unsigned int *)this + 41);
}

double PMFrameRequest::getResolutionModeScale(PMFrameRequest *this)
{
  int v1 = *((_DWORD *)this + 41);
  double result = 1.0;
  if (v1 == 1) {
    double result = 0.5;
  }
  if (v1 == 2) {
    return 0.25;
  }
  return result;
}

CGColorSpace **PMFrameRequest::setWorkingColorSpace(CGColorSpace **this, CGColorSpace *a2)
{
  return PCColorSpaceHandle::setColorSpace(this + 22, a2);
}

CGColorSpace **PMFrameRequest::setOverrideColorSpace(CGColorSpace **this, CGColorSpace *a2)
{
  return PCColorSpaceHandle::setColorSpace(this + 23, a2);
}

uint64_t PMFrameRequest::getOverrideColorSpace(PMFrameRequest *this)
{
  return PCColorSpaceHandle::getCGColorSpace((PMFrameRequest *)((char *)this + 184));
}

uint64_t PMFrameRequest::setConversionMethod(uint64_t result, char a2)
{
  *(unsigned char *)(result + 193) = a2;
  return result;
}

uint64_t PMFrameRequest::setPQPeakNits(uint64_t this, double a2)
{
  *(double *)(this + 200) = a2;
  return this;
}

void PMFrameRequest::getColorDescriptionOverrideToneMapMethod(PMFrameRequest *this, FxColorDescription *a2)
{
  if (*((unsigned char *)this + 192)) {
    PMGetToneMapMethodForConversion(*((unsigned __int8 *)this + 193), a2);
  }
}

uint64_t PMFrameRequest::isDynamicRangeTrackingRender(PMFrameRequest *this)
{
  return *((unsigned __int8 *)this + 192);
}

double PMGetToneMapMethodForConversion(int a1, FxColorDescription *this)
{
  *(void *)&double result = 4;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      *(void *)&double result = 3;
      break;
    case 2:
    case 4:
      goto LABEL_2;
    default:
      if (this) {
        double result = *(double *)FxColorDescription::getToneMapMethod(this);
      }
      else {
LABEL_2:
      }
        double result = 0.0;
      break;
  }
  return result;
}

uint64_t PMFrameRequest::isRenderForHDR_Deprecated(PMFrameRequest *this)
{
  return *((unsigned __int8 *)this + 208);
}

uint64_t PMFrameRequest::setRenderIsForHDR_Deprecated(uint64_t this, char a2)
{
  *(unsigned char *)(this + 208) = a2;
  return this;
}

uint64_t PMFrameRequest::setIsDynamicRangeTrackingRender(uint64_t this, char a2)
{
  *(unsigned char *)(this + 192) = a2;
  return this;
}

uint64_t PMFrameRequest::getStillImageInverseToneMapOperator_Deprecated(PMFrameRequest *this)
{
  return *((unsigned int *)this + 53);
}

uint64_t PMFrameRequest::setStillImageInverseToneMapOperator_Deprecated(uint64_t result, int a2)
{
  *(_DWORD *)(result + 212) = a2;
  return result;
}

__n128 PMFrameRequest::setCinematography(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 16);
  *(__n128 *)(a1 + 216) = result;
  return result;
}

void PMAudioDescription::PMAudioDescription(PMAudioDescription *this)
{
  PCSharedCount::PCSharedCount((PCSharedCount *)this);
  *(void *)(v2 + 8) = 0;
  *(void *)(v2 + 16) = 0;
  uint64_t v3 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)(v2 + 24) = *MEMORY[0x1E4F1FA48];
  *(void *)(v2 + 40) = *(void *)(v3 + 16);
  *(_DWORD *)(v2 + 48) = 0;
  PCSharedCount::PCSharedCount((PCSharedCount *)(v2 + 56));
  *((_OWORD *)this + 4) = xmmword_1B8388D60;
  *((_DWORD *)this + 20) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 11) = 0;
}

void sub_1B7E4F6CC(_Unwind_Exception *a1)
{
  PCString::~PCString(v1);
  _Unwind_Resume(a1);
}

void PMAudioDescription::PMAudioDescription(PMAudioDescription *this, const PMAudioDescription *a2)
{
  PCString::PCString((PCString *)this, (const PCString *)a2);
  *(void *)(v4 + 8) = *((void *)a2 + 1);
  *(void *)(v4 + 16) = *((void *)a2 + 2);
  long long v5 = *(_OWORD *)((char *)a2 + 24);
  *(void *)(v4 + 40) = *((void *)a2 + 5);
  *(_OWORD *)(v4 + 24) = v5;
  *(_DWORD *)(v4 + 48) = *((_DWORD *)a2 + 12);
  PCString::PCString((PCString *)(v4 + 56), (const PCString *)a2 + 7);
  long long v6 = *((_OWORD *)a2 + 4);
  int v7 = *((_DWORD *)a2 + 20);
  *((void *)this + 11) = 0;
  *((_OWORD *)this + 4) = v6;
  *((_DWORD *)this + 20) = v7;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  std::vector<PMAudioChannelDescription>::__init_with_size[abi:ne180100]<PMAudioChannelDescription*,PMAudioChannelDescription*>((void *)this + 11, *((void *)a2 + 11), *((void *)a2 + 12), (uint64_t)(*((void *)a2 + 12) - *((void *)a2 + 11)) >> 4);
}

void sub_1B7E4F77C(_Unwind_Exception *a1)
{
  PCString::~PCString(v2);
  PCString::~PCString(v1);
  _Unwind_Resume(a1);
}

uint64_t PMAudioDescription::operator=(uint64_t a1, uint64_t a2)
{
  PCString::set((PCString *)a1, (const PCString *)a2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  PCString::set((PCString *)(a1 + 56), (const PCString *)(a2 + 56));
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  if (a1 != a2) {
    std::vector<PMAudioChannelDescription>::__assign_with_size[abi:ne180100]<PMAudioChannelDescription*,PMAudioChannelDescription*>(a1 + 88, *(PCString **)(a2 + 88), *(PCString **)(a2 + 96), (uint64_t)(*(void *)(a2 + 96) - *(void *)(a2 + 88)) >> 4);
  }
  return a1;
}

void PMFormatDescription::PMFormatDescription(PMFormatDescription *this)
{
  *(void *)this = 0;
  PCSharedCount::PCSharedCount((PCSharedCount *)this + 57);
  *((void *)this + PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 60) = 0;
  *((void *)this + 63) = 0;
  *((void *)this + 64) = 0;
  PMAudioDescription::PMAudioDescription((PMFormatDescription *)((char *)this + 520));
  *((void *)this + 79) = 0;
  *((_DWORD *)this + 1PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 60) = 0;
  PCSharedCount::PCSharedCount((PCSharedCount *)this + 137);
  *(_OWORD *)((char *)this + 248) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 472) = 0u;
  *(_OWORD *)((char *)this + 488) = 0u;
  *(_OWORD *)((char *)this + 440) = 0u;
  *(_OWORD *)((char *)this + 456) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
  *(_OWORD *)((char *)this + 3PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 60) = 0u;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *((unsigned char *)this + 644) = 0;
  *(_OWORD *)((char *)this + 648) = 0u;
  *(_OWORD *)((char *)this + 664) = 0u;
  *(_OWORD *)((char *)this + 680) = 0u;
  *(_OWORD *)((char *)this + 696) = 0u;
  *(_OWORD *)((char *)this + 712) = 0u;
  *(_OWORD *)((char *)this + 728) = 0u;
  *(_OWORD *)((char *)this + 744) = 0u;
  *(_OWORD *)((char *)this + 7PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 60) = 0u;
  *(_OWORD *)((char *)this + 776) = 0u;
  *(_OWORD *)((char *)this + 792) = 0u;
  *(_OWORD *)((char *)this + 808) = 0u;
  *(_OWORD *)((char *)this + 824) = 0u;
  *(_OWORD *)((char *)this + 840) = 0u;
  *(_OWORD *)((char *)this + 856) = 0u;
  *(_OWORD *)((char *)this + 872) = 0u;
  *(_OWORD *)((char *)this + 888) = 0u;
  *(_OWORD *)((char *)this + 904) = 0u;
  *(_OWORD *)((char *)this + 920) = 0u;
  *(_OWORD *)((char *)this + 936) = 0u;
  *(_OWORD *)((char *)this + 952) = 0u;
  *(_OWORD *)((char *)this + 968) = 0u;
  *(_OWORD *)((char *)this + 984) = 0u;
  *(_OWORD *)((char *)this + 1000) = 0u;
  *(_OWORD *)((char *)this + 1016) = 0u;
  *(_OWORD *)((char *)this + 1032) = 0u;
  *(_OWORD *)((char *)this + 1048) = 0u;
  *(_OWORD *)((char *)this + 1064) = 0u;
  *(_OWORD *)((char *)this + 1080) = 0u;
  *(_OWORD *)((char *)this + 1096) = 0u;
  *(_OWORD *)((char *)this + 1112) = 0u;
  *(_OWORD *)((char *)this + 1128) = 0u;
}

void sub_1B7E4F940(_Unwind_Exception *a1)
{
  PMAudioDescription::~PMAudioDescription(v3);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)(v1 + 480));
  PCString::~PCString(v2);
  _Unwind_Resume(a1);
}

void PMFormatDescription::PMFormatDescription(PMFormatDescription *this, const PMFormatDescription *a2)
{
  *(void *)this = *(void *)a2;
  memcpy((char *)this + 8, (char *)a2 + 8, 0x1C0uLL);
  PCString::PCString((PCString *)this + 57, (const PCString *)a2 + 57);
  uint64_t v4 = *((void *)a2 + 58);
  *((_DWORD *)this + 118) = *((_DWORD *)a2 + 118);
  *((void *)this + 58) = v4;
  long long v5 = (CGColorSpace *)*((void *)a2 + 60);
  *((void *)this + PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 60) = v5;
  if (v5) {
    PCCFRefTraits<CGColorSpace *>::retain(v5);
  }
  *(_OWORD *)((char *)this + 488) = *(_OWORD *)((char *)a2 + 488);
  *((void *)this + 63) = 0;
  *((_DWORD *)this + 128) = 0;
  *((_DWORD *)this + 129) = *((_DWORD *)a2 + 129);
  PMAudioDescription::PMAudioDescription((PMFormatDescription *)((char *)this + 520), (const PMFormatDescription *)((char *)a2 + 520));
  *((void *)this + 79) = 0;
  *((_DWORD *)this + 1PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 60) = 0;
  *((unsigned char *)this + 644) = *((unsigned char *)a2 + 644);
  memcpy((char *)this + 648, (char *)a2 + 648, 0x1C0uLL);
  PCString::PCString((PCString *)this + 137, (const PCString *)a2 + 137);
  uint64_t v6 = *((void *)a2 + 138);
  *((_DWORD *)this + 278) = *((_DWORD *)a2 + 278);
  *((void *)this + 138) = v6;
  int v7 = (CGColorSpace *)*((void *)a2 + 140);
  *((void *)this + PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 140) = v7;
  if (v7) {
    PCCFRefTraits<CGColorSpace *>::retain(v7);
  }
  *(_OWORD *)((char *)this + 1128) = *(_OWORD *)((char *)a2 + 1128);
  if (*((void *)a2 + 63))
  {
    uint64_t v8 = malloc_type_malloc(*((unsigned int *)a2 + 128), 0x390D2E3EuLL);
    *((void *)this + 63) = v8;
    memcpy(v8, *((const void **)a2 + 63), *((unsigned int *)a2 + 128));
    *((_DWORD *)this + 128) = *((_DWORD *)a2 + 128);
  }
  if (*((void *)a2 + 79))
  {
    PCString v9 = malloc_type_malloc(*((unsigned int *)a2 + 160), 0xEAAFB5A8uLL);
    *((void *)this + 79) = v9;
    memcpy(v9, *((const void **)a2 + 79), *((unsigned int *)a2 + 160));
    *((_DWORD *)this + 1PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 60) = *((_DWORD *)a2 + 160);
  }
}

void sub_1B7E4FADC(_Unwind_Exception *a1)
{
  PCString::~PCString(v4);
  PMAudioDescription::~PMAudioDescription(v3);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)(v1 + 480));
  PCString::~PCString(v2);
  _Unwind_Resume(a1);
}

void *std::vector<PMAudioChannelDescription>::__init_with_size[abi:ne180100]<PMAudioChannelDescription*,PMAudioChannelDescription*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::shared_ptr<HGGPUComputeDevice const>>::__vallocate[abi:ne180100](result, a4);
    __n128 result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<PMAudioChannelDescription>,PMAudioChannelDescription*,PMAudioChannelDescription*,PMAudioChannelDescription*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1B7E4FB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<PMAudioChannelDescription>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<PMAudioChannelDescription>,PMAudioChannelDescription*,PMAudioChannelDescription*,PMAudioChannelDescription*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      PCString::PCString((PCString *)(a4 + v7), (const PCString *)(a2 + v7));
      *(_DWORD *)(v8 + 8) = *(_DWORD *)(a2 + v7 + 8);
      v7 += 16;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_1B7E4FC30(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    uint64_t v4 = v1 - 16;
    do
    {
      PCString::~PCString((PCString *)(v4 + v2));
      v2 -= 16;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<PMAudioChannelDescription>::__assign_with_size[abi:ne180100]<PMAudioChannelDescription*,PMAudioChannelDescription*>(uint64_t a1, PCString *a2, PCString *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  uint64_t v9 = *(PCString **)a1;
  if (a4 > (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)
  {
    std::vector<PMAudioChannelDescription>::__vdeallocate((void **)a1);
    if (a4 >> 60) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = *(void *)(a1 + 16) - *(void *)a1;
    uint64_t v11 = v10 >> 3;
    if (v10 >> 3 <= a4) {
      uint64_t v11 = a4;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    std::vector<std::shared_ptr<HGGPUComputeDevice const>>::__vallocate[abi:ne180100]((void *)a1, v12);
    uint64_t v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<PMAudioChannelDescription>,PMAudioChannelDescription*,PMAudioChannelDescription*,PMAudioChannelDescription*>(v8, (uint64_t)a2, (uint64_t)a3, *(void *)(a1 + 8));
    goto LABEL_11;
  }
  unint64_t v14 = (uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4;
  if (v14 < a4)
  {
    int v15 = &a2[2 * v14];
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,PMAudioChannelDescription *,PMAudioChannelDescription *,PMAudioChannelDescription *,0>(a2, v15, v9);
    uint64_t v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<PMAudioChannelDescription>,PMAudioChannelDescription*,PMAudioChannelDescription*,PMAudioChannelDescription*>(v8, (uint64_t)v15, (uint64_t)a3, *(void *)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v13;
    return;
  }
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,PMAudioChannelDescription *,PMAudioChannelDescription *,PMAudioChannelDescription *,0>(a2, a3, v9);
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)(a1 + 8);
  if (v18 != v16)
  {
    do
      PCString::~PCString((PCString *)(v18 - 16));
    while (v18 != v17);
  }
  *(void *)(a1 + 8) = v17;
}

void sub_1B7E4FD80(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1B7E4FD88(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<PMAudioChannelDescription>::__vdeallocate(void **a1)
{
  uint64_t v1 = (PCString *)*a1;
  if (*a1)
  {
    uint64_t v3 = (PCString *)a1[1];
    uint64_t v4 = v1;
    if (v3 != v1)
    {
      do
        PCString::~PCString(v3 - 2);
      while (v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

PCString *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,PMAudioChannelDescription *,PMAudioChannelDescription *,PMAudioChannelDescription *,0>(PCString *a1, PCString *a2, PCString *this)
{
  uint64_t v4 = a1;
  if (a1 == a2) {
    return a1;
  }
  long long v5 = a2;
  do
  {
    PCString::set(this, v4);
    LODWORD(this[1].var0) = v4[1].var0;
    this += 2;
    v4 += 2;
  }
  while (v4 != v5);
  return v5;
}

HGBitmapLoader *PMBitmapToHeliumNode@<X0>(PCBitmap **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = 0;
  return LiHelium::createBitmapNode(a1, (unsigned int *)&v3, a2);
}

void PMStripField::PMStripField(HGNode *a1, int a2)
{
  HGNode::HGNode(a1);
  *(void *)uint64_t v3 = &unk_1F119ADC0;
  *(_DWORD *)(v3 + 408) = a2;
  *(void *)(v3 + 416) = 0;
}

void PMStripField::~PMStripField(HGNode *this)
{
  *(void *)this = &unk_1F119ADC0;
  uint64_t v2 = *((void *)this + 52);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }

  HGNode::~HGNode(this);
}

{
  void *v1;
  uint64_t vars8;

  PMStripField::~PMStripField(this);

  HGObject::operator delete(v1);
}

uint64_t PMStripField::GetOutput(PMStripField *this, HGRenderer *a2)
{
  int v4 = *((_DWORD *)this + 102);
  long long v5 = (HgcPMStripEvenField *)HGObject::operator new(0x1A0uLL);
  uint64_t v6 = v5;
  if (v4)
  {
    HgcPMStripEvenField::HgcPMStripEvenField(v5);
    uint64_t v7 = (HgcPMStripEvenField *)*((void *)this + 52);
    if (v7 != v6)
    {
      uint64_t v8 = (HgcPMStripEvenField **)((char *)this + 416);
      if (v7) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }
    if (!v6) {
      goto LABEL_9;
    }
LABEL_11:
    (*(void (**)(HgcPMStripEvenField *))(*(void *)v6 + 24))(v6);
    goto LABEL_9;
  }
  HgcPMStripOddField::HgcPMStripOddField(v5);
  uint64_t v7 = (HgcPMStripEvenField *)*((void *)this + 52);
  if (v7 == v6)
  {
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }
  uint64_t v8 = (HgcPMStripEvenField **)((char *)this + 416);
  if (v7) {
LABEL_7:
  }
    (*(void (**)(HgcPMStripEvenField *))(*(void *)v7 + 24))(v7);
LABEL_8:
  *uint64_t v8 = v6;
LABEL_9:
  uint64_t v9 = *((void *)this + 52);
  Input = HGRenderer::GetInput(a2, (HGNode *)this, 0);
  (*(void (**)(uint64_t, void, HGNode *))(*(void *)v9 + 120))(v9, 0, Input);
  return *((void *)this + 52);
}

void sub_1B7E500F0(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  }
  _Unwind_Resume(exception_object);
}

void MyCGInstanceData::MyCGInstanceData(MyCGInstanceData *this)
{
  PMStillInstance::PMStillInstance(this);
  *(void *)uint64_t v2 = &unk_1F119B028;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 112) = 0;
  *(void *)(v2 + 96) = 0;
  *(_DWORD *)(v2 + 120) = 1;
  uint64_t v3 = MEMORY[0x1E4F1FA48];
  long long v4 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)(v2 + 128) = xmmword_1B8388D80;
  *(_OWORD *)(v2 + 144) = v4;
  *(void *)(v2 + 1PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 60) = *(void *)(v3 + 16);
  *(_DWORD *)(v2 + 168) = 0;
  *(unsigned char *)(v2 + 172) = 0;
  *(void *)(v2 + 176) = 0;
  *(void *)(v2 + 184) = 0;
  PCColorDescription::PCColorDescription((PCColorDescription *)(v2 + 192));
  *((unsigned char *)this + 216) = 1;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((void *)this + 32) = 0;
}

void sub_1B7E50210(_Unwind_Exception *a1)
{
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v1 + 23);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  PMStillInstance::~PMStillInstance(v1);
  _Unwind_Resume(a1);
}

void MyCGInstanceData::~MyCGInstanceData(MyCGInstanceData *this)
{
  *(void *)this = &unk_1F119B028;
  uint64_t v2 = (__CVPixelBufferPool *)*((void *)this + 32);
  if (v2)
  {
    CVPixelBufferPoolRelease(v2);
    *((void *)this + 32) = 0;
  }
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 29);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 28);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)this + 24);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 23);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }

  PMStillInstance::~PMStillInstance(this);
}

{
  uint64_t vars8;

  MyCGInstanceData::~MyCGInstanceData(this);

  JUMPOUT(0x1BA9BFBA0);
}

uint64_t MyCGInstanceData::open(FxColorDescription *this, const __CFURL **a2)
{
  uint64_t result = PMStillInstance::open((PMStillInstance *)this, a2);
  if (!result)
  {
    long long v5 = (void *)MEMORY[0x1E4F42A80];
    PCURL::getAsFileSystemString(a2, (PCString *)&v19);
    uint64_t v6 = (void *)[v5 imageWithContentsOfFile:PCString::ns_str((PCString *)&v19)];
    PCString::~PCString((PCString *)&v19);
    uint64_t v7 = (CGImage *)[v6 CGImage];
    if (v7)
    {
      uint64_t v8 = v7;
      ColorSpace = CGImageGetColorSpace(v7);
      if (ColorSpace)
      {
        uint64_t v10 = ColorSpace;
        PCCFRefTraits<CGColorSpace *>::retain(ColorSpace);
        CGColorSpaceRef space = v10;
      }
      else
      {
        CGColorSpaceRef space = 0;
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v19._pcColorDesc._colorSpaceRef._obj = DeviceRGB;
        if (space && space != DeviceRGB)
        {
          PCCFRefTraits<CGColorSpace *>::release(space);
          DeviceRGB = v19._pcColorDesc._colorSpaceRef._obj;
        }
        CGColorSpaceRef space = DeviceRGB;
        v19._pcColorDesc._colorSpaceRef._obj = 0;
        PCCFRef<CGColorSpace *>::~PCCFRef(&v19._pcColorDesc._colorSpaceRef._obj);
        uint64_t v10 = space;
      }
      FxColorDescription::FxColorDescription(&v19, v10, (PCToneMapMethod *)&kPCNoToneMapMethod, 1);
      obj = this[6]._pcColorDesc._colorSpaceRef._obj;
      uint64_t v13 = v19._pcColorDesc._colorSpaceRef._obj;
      if (obj && obj != v19._pcColorDesc._colorSpaceRef._obj)
      {
        PCCFRefTraits<CGColorSpace *>::release(obj);
        uint64_t v13 = v19._pcColorDesc._colorSpaceRef._obj;
      }
      this[6]._pcColorDesc._colorSpaceRef._obj = v13;
      v19._pcColorDesc._colorSpaceRef._obj = 0;
      this[6]._pcColorDesc._dynamicRange = v19._pcColorDesc._dynamicRange;
      this[6]._pcColorDesc._toneMapMethod = v19._pcColorDesc._toneMapMethod;
      this[6]._isPremultiplied = v19._isPremultiplied;
      PCCFRef<CGColorSpace *>::~PCCFRef(&v19._pcColorDesc._colorSpaceRef._obj);
      CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(this + 6);
      PCColorSpaceHandle::PCColorSpaceHandle((PCColorSpaceHandle *)&v19, CGColorSpace);
      int v15 = this[7]._pcColorDesc._colorSpaceRef._obj;
      uint64_t v16 = v19._pcColorDesc._colorSpaceRef._obj;
      if (v15 && v15 != v19._pcColorDesc._colorSpaceRef._obj)
      {
        PCCFRefTraits<CGColorSpace *>::release(v15);
        uint64_t v16 = v19._pcColorDesc._colorSpaceRef._obj;
      }
      this[7]._pcColorDesc._colorSpaceRef._obj = v16;
      v19._pcColorDesc._colorSpaceRef._obj = 0;
      PCCFRef<CGColorSpace *>::~PCCFRef(&v19._pcColorDesc._colorSpaceRef._obj);
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9B8];
      PCURL::getAsFileSystemString(a2, (PCString *)&v19);
      CFDataRef v18 = (const __CFData *)[v17 dataWithContentsOfFile:PCString::ns_str((PCString *)&v19)];
      PCString::~PCString((PCString *)&v19);
      if (v18) {
        *(void *)&this[3]._pcColorDesc._toneMapMethod._gain = CGImageSourceCreateWithData(v18, 0);
      }
      LODWORD(this[7]._pcColorDesc._toneMapMethod._gain) = CGImageGetWidth(v8);
      *((_DWORD *)&this[7]._pcColorDesc._toneMapMethod + 2) = CGImageGetHeight(v8);
      LOBYTE(this[5]._pcColorDesc._toneMapMethod._type) = 1;
      PCCFRef<CGColorSpace *>::~PCCFRef(&space);
      return 0;
    }
    else
    {
      PMStillInstance::close((PMStillInstance *)this);
      return 3;
    }
  }
  return result;
}

void sub_1B7E504EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCString a10, uint64_t a11, uint64_t a12, uint64_t a13, CGColorSpace *a14)
{
}

uint64_t MyCGInstanceData::isOpen(MyCGInstanceData *this)
{
  return *((unsigned __int8 *)this + 172);
}

void MyCGInstanceData::close(__CVBuffer **this)
{
  PMStillInstance::close((PMStillInstance *)this);
  uint64_t v2 = this[31];
  if (v2)
  {
    CVPixelBufferRelease(v2);
    this[31] = 0;
  }
  uint64_t v3 = this[14];
  if (v3)
  {
    CFRelease(v3);
    this[14] = 0;
  }
  *((_DWORD *)this + 42) = 0;
  *((unsigned char *)this + 172) = 0;
}

CGColorSpace *MyCGInstanceData::getNativeColorDescription@<X0>(MyCGInstanceData *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (CGColorSpace *)*((void *)this + 24);
  *(void *)a2 = result;
  if (result) {
    uint64_t result = PCCFRefTraits<CGColorSpace *>::retain(result);
  }
  *(void *)(a2 + 8) = *((void *)this + 25);
  *(_DWORD *)(a2 + 16) = *((_DWORD *)this + 52);
  *(unsigned char *)(a2 + 24) = *((unsigned char *)this + 216);
  return result;
}

uint64_t MyCGInstanceData::getAnimationInfo(MyCGInstanceData *this, const PCURL *a2)
{
  uint64_t v3 = (CGImageSource *)*((void *)this + 14);
  if (!v3) {
    return 1;
  }
  unsigned int Count = CGImageSourceGetCount(v3);
  *((_DWORD *)this + 30) = Count;
  if (Count < 2)
  {
    *((void *)this + 17) = 0x403E000000000000;
    memset(&v36, 0, sizeof(v36));
    CMTimeMakeWithSeconds(&v36, 0.0333333333, 0x40000);
    CMTime v33 = v36;
    int32_t v29 = (int)*((double *)this + 17);
    p_CMTime time = &v33;
  }
  else
  {
    size_t v5 = 0;
    uint64_t v6 = (const void *)*MEMORY[0x1E4F2F990];
    uint64_t v7 = *MEMORY[0x1E4F2F9A8];
    uint64_t v8 = *MEMORY[0x1E4F2F988];
    uint64_t v9 = (const void *)*MEMORY[0x1E4F2FCD8];
    uint64_t v10 = *MEMORY[0x1E4F2F4D0];
    float v11 = 0.1;
    uint64_t v12 = *MEMORY[0x1E4F2F4C0];
    while (1)
    {
      CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(*((CGImageSourceRef *)this + 14), v5, 0);
      if (!v13) {
        break;
      }
      CFDictionaryRef v14 = v13;
      Value = (void *)CFDictionaryGetValue(v13, v6);
      if (Value)
      {
        uint64_t v16 = Value;
        uint64_t v17 = (void *)[Value objectForKeyedSubscript:v7];
        if (!v17 || ([v17 floatValue], float v11 = v18, v18 == 0.0))
        {
          FxColorDescription v19 = (void *)[v16 objectForKeyedSubscript:v8];
          if (v19)
          {
            [v19 floatValue];
            float v11 = v20;
          }
        }
      }
      unint64_t v21 = (void *)CFDictionaryGetValue(v14, v9);
      if (v21)
      {
        int v22 = v21;
        int v23 = (void *)[v21 objectForKeyedSubscript:v10];
        if (!v23 || ([v23 floatValue], float v11 = v24, v24 == 0.0))
        {
          unint64_t v25 = (void *)[v22 objectForKeyedSubscript:v12];
          if (v25)
          {
            [v25 floatValue];
            float v11 = v26;
          }
        }
      }
      if (v11 < 0.011) {
        float v11 = 0.1;
      }
      *((double *)this + 16) = *((double *)this + 16) + v11;
      CFRelease(v14);
      ++v5;
      size_t v27 = *((unsigned int *)this + 30);
      if (v5 >= v27) {
        goto LABEL_22;
      }
    }
    LODWORD(v27) = *((_DWORD *)this + 30);
LABEL_22:
    Float64 v31 = *((double *)this + 16) / (double)v27;
    *((double *)this + 17) = ceil(1.0 / v31 + -0.01);
    memset(&v36, 0, sizeof(v36));
    CMTimeMakeWithSeconds(&v36, v31, 0x40000);
    CMTime time = v36;
    int32_t v29 = (int)*((double *)this + 17);
    p_CMTime time = &time;
  }
  CMTimeConvertScale(&v35, p_time, v29, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  uint64_t result = 0;
  CMTimeEpoch epoch = v35.epoch;
  *((_OWORD *)this + 9) = *(_OWORD *)&v35.value;
  *((void *)this + 20) = epoch;
  return result;
}

CGImage *MyCGInstanceData::newPixelBufferFromImage(MyCGInstanceData *this, CGImageRef image, CGColorSpace **a3)
{
  uint64_t v3 = image;
  CVPixelBufferRef pixelBufferOut = 0;
  if (image)
  {
    size_t Width = CGImageGetWidth(image);
    size_t Height = CGImageGetHeight(v3);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v3);
    ColorSpace = CGImageGetColorSpace(v3);
    PCColorSpaceHandle::PCColorSpaceHandle((PCColorSpaceHandle *)&v34, ColorSpace);
    CGColorSpace = (CGColorSpace *)PCColorSpaceHandle::getCGColorSpace((PCColorSpaceHandle *)&v34);
    if (CGColorSpaceGetNumberOfComponents(CGColorSpace) == 1)
    {
      PCColorSpaceHandle::PCColorSpaceHandle((PCColorSpaceHandle *)&v33, (CFStringRef)*MEMORY[0x1E4F1DC98]);
      float v11 = v33;
      if (v34 && v34 != v33)
      {
        PCCFRefTraits<CGColorSpace *>::release(v34);
        float v11 = v33;
      }
      CMTime v33 = 0;
      uint64_t v34 = v11;
      PCCFRef<CGColorSpace *>::~PCCFRef(&v33);
    }
    uint64_t v12 = (CGColorSpace *)PCColorSpaceHandle::getCGColorSpace((PCColorSpaceHandle *)&v34);
    PCColorSpaceHandle::setColorSpace(a3, v12);
    int valuePtr = 1111970369;
    BOOL v13 = CGColorSpaceUsesExtendedRange(v12);
    int v14 = BitsPerComponent > 8 || v13;
    if (v14) {
      size_t v15 = 16;
    }
    else {
      size_t v15 = 8;
    }
    if (v14 == 1)
    {
      int valuePtr = 1380411457;
      uint32_t v16 = 4353;
    }
    else
    {
      uint32_t v16 = 8194;
    }
    uint64_t v17 = (__CVPixelBufferPool *)*((void *)this + 32);
    if (!v17)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      size_t v30 = v15;
      CFDictionaryRef v22 = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F24D20], v22);
      CFRelease(v22);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F24D58], (const void *)*MEMORY[0x1E4F1CFD0]);
      size_t v29 = Width;
      CMTime v33 = (CGColorSpace *)(Width + 2);
      size_t v31 = Height + 2;
      CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFNumberRef v24 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
      CFNumberRef v25 = CFNumberCreate(v23, kCFNumberLongType, &v33);
      CFNumberRef v26 = CFNumberCreate(v23, kCFNumberLongType, &v31);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F24D70], v24);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F24E10], v25);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F24D08], v26);
      size_t v27 = (CVPixelBufferPoolRef *)((char *)this + 256);
      LODWORD(v23) = CVPixelBufferPoolCreate(v23, 0, Mutable, v27);
      CFRelease(v24);
      CFRelease(v25);
      CFRelease(v26);
      CFRelease(Mutable);
      if (v23) {
        goto LABEL_20;
      }
      uint64_t v17 = *v27;
      size_t Width = v29;
      size_t v15 = v30;
    }
    if (!CVPixelBufferPoolCreatePixelBuffer(0, v17, &pixelBufferOut))
    {
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
      float v20 = CGBitmapContextCreate(BaseAddress, Width + 2, Height + 2, v15, BytesPerRow, v12, v16);
      v36.size.width = (double)(Width + 2);
      v36.size.height = (double)(Height + 2);
      v36.origin.x = 0.0;
      v36.origin.y = 0.0;
      CGContextClearRect(v20, v36);
      v37.size.width = (double)Width;
      v37.size.height = (double)Height;
      v37.origin.x = 1.0;
      v37.origin.y = 1.0;
      CGContextDrawImage(v20, v37, v3);
      CGContextRelease(v20);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      uint64_t v3 = pixelBufferOut;
LABEL_21:
      PCCFRef<CGColorSpace *>::~PCCFRef(&v34);
      return v3;
    }
LABEL_20:
    uint64_t v3 = 0;
    goto LABEL_21;
  }
  return v3;
}

void sub_1B7E50BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v7 = va_arg(va1, CGColorSpace *);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

uint64_t MyCGInstanceData::getPixelBuffer(MyCGInstanceData *this, const PMFrameRequest *a2, FxColorDescription *a3)
{
  size_t v5 = *((unsigned int *)a2 + 25);
  OverrideColorSpace = (CGColorSpace *)PMFrameRequest::getOverrideColorSpace(a2);
  PCColorSpaceHandle::PCColorSpaceHandle((PCColorSpaceHandle *)&v20, OverrideColorSpace);
  uint64_t v7 = (__CVBuffer *)*((void *)this + 31);
  if (!v7) {
    goto LABEL_6;
  }
  if (v5 != *((_DWORD *)this + 42))
  {
LABEL_5:
    CVPixelBufferRelease(v7);
LABEL_6:
    ImageAtIndex = CGImageSourceCreateImageAtIndex(*((CGImageSourceRef *)this + 14), v5, 0);
    FxColorDescription v19 = 0;
    *((void *)this + 31) = MyCGInstanceData::newPixelBufferFromImage(this, ImageAtIndex, &v19);
    CGImageRelease(ImageAtIndex);
    *((_DWORD *)this + 42) = v5;
    PCCFRef<CGColorSpace *>::operator=((CGColorSpace **)this + 28, &v20);
    PCCFRef<CGColorSpace *>::operator=((CGColorSpace **)this + 29, &v19);
    CGColorSpace = (CGColorSpace *)PCColorSpaceHandle::getCGColorSpace((PCColorSpaceHandle *)&v19);
    FxColorDescription::FxColorDescription(&v18, (const FxColorDescription *)this + 6, CGColorSpace);
    obj = a3->_pcColorDesc._colorSpaceRef._obj;
    float v11 = v18._pcColorDesc._colorSpaceRef._obj;
    if (a3->_pcColorDesc._colorSpaceRef._obj && obj != v18._pcColorDesc._colorSpaceRef._obj)
    {
      PCCFRefTraits<CGColorSpace *>::release(obj);
      float v11 = v18._pcColorDesc._colorSpaceRef._obj;
    }
    a3->_pcColorDesc._colorSpaceRef._obj = v11;
    v18._pcColorDesc._colorSpaceRef._obj = 0;
    a3->_pcColorDesc._dynamicRange = v18._pcColorDesc._dynamicRange;
    a3->_pcColorDesc._toneMapMethod = v18._pcColorDesc._toneMapMethod;
    a3->_isPremultiplied = v18._isPremultiplied;
    PCCFRef<CGColorSpace *>::~PCCFRef(&v18._pcColorDesc._colorSpaceRef._obj);
    uint64_t v12 = (FxColorDescription *)&v19;
    goto LABEL_10;
  }
  if (operator!=(&v20, (void *)this + 28))
  {
    uint64_t v7 = (__CVBuffer *)*((void *)this + 31);
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  size_t v15 = (CGColorSpace *)PCColorSpaceHandle::getCGColorSpace((MyCGInstanceData *)((char *)this + 232));
  FxColorDescription::FxColorDescription(&v18, (const FxColorDescription *)this + 6, v15);
  uint32_t v16 = a3->_pcColorDesc._colorSpaceRef._obj;
  uint64_t v17 = v18._pcColorDesc._colorSpaceRef._obj;
  if (a3->_pcColorDesc._colorSpaceRef._obj && v16 != v18._pcColorDesc._colorSpaceRef._obj)
  {
    PCCFRefTraits<CGColorSpace *>::release(v16);
    uint64_t v17 = v18._pcColorDesc._colorSpaceRef._obj;
  }
  a3->_pcColorDesc._colorSpaceRef._obj = v17;
  v18._pcColorDesc._colorSpaceRef._obj = 0;
  a3->_pcColorDesc._dynamicRange = v18._pcColorDesc._dynamicRange;
  a3->_pcColorDesc._toneMapMethod = v18._pcColorDesc._toneMapMethod;
  a3->_isPremultiplied = v18._isPremultiplied;
  uint64_t v12 = &v18;
LABEL_10:
  PCCFRef<CGColorSpace *>::~PCCFRef(&v12->_pcColorDesc._colorSpaceRef._obj);
  uint64_t v13 = *((void *)this + 31);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v20);
  return v13;
}

void sub_1B7E50DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CGColorSpace *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, CGColorSpace *a14)
{
}

uint64_t MyCGInstanceData::readRawBitmap@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(this + 176);
  if (v3)
  {
    uint64_t v4 = *(void *)(this + 184);
    *a2 = v3;
    a2[1] = v4;
    if (v4) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return this;
}

void MyCG_Open(const PMFormatDescription *a1, const PCURL *a2, void **a3)
{
}

void sub_1B7E50F18(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x60C4044C4A2DFLL);
  _Unwind_Resume(a1);
}

uint64_t MyCG_Create()
{
  return 10;
}

uint64_t MyCG_Close(const PMFormatDescription *a1, void *a2)
{
  uint64_t v3 = (PCURL *)a2[13];
  if (v3)
  {
    PCURL::~PCURL(v3);
    MEMORY[0x1BA9BFBA0]();
  }
  a2[13] = 0;
  (*(void (**)(void *))(*a2 + 24))(a2);
  (*(void (**)(void *))(*a2 + 8))(a2);
  return 0;
}

__n128 MyCG_GetInfo(PMFormatDescription *a1, const PCURL *a2, void *a3)
{
  if (a3)
  {
    size_t v5 = (CMTime *)((char *)a1 + 8);
    *((void *)a1 + 36) = *((void *)a3 + 30);
    *((void *)a1 + 52) = 0x3FF0000000000000;
    *((double *)a1 + 53) = PCInfo::getWorkingGamma(a1);
    *((void *)a1 + 49) = 1;
    *((_DWORD *)a1 + 86) = 1;
    *((void *)a1 + 45) = 0x403E000000000000;
    CMTimeMake(&v25, 1, 30);
    v5[12] = v25;
    CMTimeMake(&v25, 1, (int)*((double *)a1 + 45));
    *(CMTime *)((char *)a1 + 320) = v25;
    *((void *)a1 + 47) = 0;
    strcpy((char *)a1 + 8, "Adobe Photoshop");
    *(_OWORD *)&v5[10].CMTimeEpoch epoch = xmmword_1B8388D90;
    *((_DWORD *)a1 + 111) = 3;
    *((unsigned char *)a1 + 450) = 1;
    *((_WORD *)a1 + 227) = 0;
    uint64_t v7 = (CGImageSource *)*((void *)a3 + 14);
    if (v7)
    {
      CFStringRef Type = CGImageSourceGetType(v7);
      PCURL::PCURL((PCURL *)&v25, Type);
      CStr = PCString::createCStr((PCString *)&v25);
      if (CStr)
      {
        strcpy((char *)v5, CStr);
        free(CStr);
      }
      CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(*((CGImageSourceRef *)a3 + 14), 0, 0);
      int v11 = objc_msgSend((id)-[__CFDictionary objectForKey:](v10, "objectForKey:", *MEMORY[0x1E4F2F6B8]), "intValue");
      int v12 = objc_msgSend((id)-[__CFDictionary objectForKey:](v10, "objectForKey:", *MEMORY[0x1E4F2FB40]), "BOOLValue");
      uint64_t v13 = objc_msgSend((id)-[__CFDictionary objectForKey:](v10, "objectForKey:", *MEMORY[0x1E4F2F578]), "caseInsensitiveCompare:", @"Gray");
      if (v11 <= 8) {
        int v14 = 0;
      }
      else {
        int v14 = 3;
      }
      if (v11 <= 8) {
        int v15 = 3;
      }
      else {
        int v15 = 16;
      }
      if (v13)
      {
        if (v12)
        {
          if (v11 == 16) {
            int v16 = 64;
          }
          else {
            int v16 = 32;
          }
          char v17 = 1;
        }
        else
        {
          char v17 = 0;
          if (v11 == 16) {
            int v16 = 48;
          }
          else {
            int v16 = 24;
          }
        }
      }
      else
      {
        char v17 = 0;
        if (v11 == 16) {
          int v16 = 41;
        }
        else {
          int v16 = 40;
        }
      }
      *((_DWORD *)a1 + 69) = v16;
      *((_DWORD *)a1 + 68) = v14;
      *((_DWORD *)a1 + 111) = v15;
      *((unsigned char *)a1 + 450) = v17;
      CFRelease(v10);
      PCString::~PCString((PCString *)&v25);
    }
    if (!MyCGInstanceData::getAnimationInfo((MyCGInstanceData *)a3, v6))
    {
      FxColorDescription v19 = (char *)&v5[12];
      memset(&v25, 0, sizeof(v25));
      CMTimeMakeWithSeconds(&v25, *((Float64 *)a3 + 16), 1000000000);
      CMTime v23 = v25;
      CMTimeConvertScale(&v24, &v23, (int)*((double *)a3 + 17), kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      *((_DWORD *)a1 + 86) = *((_DWORD *)a3 + 30);
      CMTimeEpoch epoch = v24.epoch;
      CMTime v25 = v24;
      long long v21 = *(_OWORD *)&v24.value;
      *((void *)a1 + 45) = *((void *)a3 + 17);
      *((void *)v19 + 2) = epoch;
      *(_OWORD *)FxColorDescription v19 = v21;
      uint64_t v22 = *((void *)a3 + 20);
      __n128 result = *((__n128 *)a3 + 9);
      *((__n128 *)a1 + 20) = result;
      *((void *)a1 + 42) = v22;
    }
  }
  return result;
}

void sub_1B7E512AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, PCString a15)
{
}

uint64_t MyCG_GetLayerDescription(const PMFormatDescription *a1, PMLayerDescription *a2, unsigned int a3, const PCURL *a4, void *a5)
{
  if (!a5) {
    return 10;
  }
  uint64_t result = 0;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = a5[30];
  *((_DWORD *)a2 + 5) = *((_DWORD *)a1 + 111);
  return result;
}

uint64_t MyCG_GetFrame(const PMFormatDescription *a1, CFTypeRef *a2, CMTime *a3, uint64_t a4, FxColorDescription *a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  double v15 = FigTimeToFrameWithRate(a3, *(double *)(a8 + 136));
  int v16 = *(_DWORD *)(a8 + 120) - 1;
  if (v16 >= ((int)v15 & ~((int)v15 >> 31))) {
    int v16 = (int)v15 & ~((int)v15 >> 31);
  }
  *(_DWORD *)(a4 + 100) = v16;

  return PMStillInstance::getFrame((PMStillInstance *)a8, a1, a2, a4, a5, a6, a7);
}

uint64_t MyCG_GetAlphaFormat(PMFormatDescription *a1, int a2, int a3, unsigned int *a4, char *a5, uint64_t **this)
{
  long long v22 = xmmword_1B7E74760;
  uint64_t v23 = 0x3FF0000000000000;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0x3FF0000000000000;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  int v35 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = 0x3FF0000000000000;
  char v34 = 0;
  uint64_t v8 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v36 = *MEMORY[0x1E4F1FA48];
  uint64_t v37 = v8;
  uint64_t v38 = 0;
  __int16 v39 = 0;
  uint64_t v40 = 0;
  __int16 v41 = 0;
  uint64_t v42 = 0x100000000;
  char v43 = 0;
  uint64_t v44 = 0;
  CMTime v45 = 0;
  __int16 v46 = 768;
  uint64_t v47 = 0x408F400000000000;
  char v48 = 0;
  int v49 = 0;
  char v50 = 0;
  uint64_t v51 = -1;
  __asm { FMOV            V0.2D, #1.0 }
  long long v52 = _Q0;
  HIDWORD(v32) = a3;
  PMStillInstance::getRawBitmap(this, a1, (const PMFrameRequest *)&v22, &v20);
  if (v20)
  {
    unsigned int v19 = 0;
    char v18 = 0;
    unsigned int v14 = (*(uint64_t (**)(void))(**((void **)v20 + 8) + 48))(*((void *)v20 + 8));
    if (!PCPixelFormat::is8Bit(v14))
    {
      (*(void (**)(PCBitmap *))(*(void *)v20 + 16))(v20);
      (*(void (**)(PCBitmap *))(*(void *)v20 + 24))(v20);
      PCImage::getColorSpace((PCImage *)v20, &v17);
      PCCreateBitmap();
    }
    switch((*(unsigned int (**)(void))(**((void **)v20 + 8) + 48))(*((void *)v20 + 8)))
    {
      case 3u:
        PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)3>>>>((uint64_t)v20, (int *)&v19, a5, &v18);
        break;
      case 4u:
        PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)4>>>>((uint64_t)v20, (int *)&v19, a5, &v18);
        break;
      case 5u:
        PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)5>>>>((uint64_t)v20, (int *)&v19, a5, &v18);
        break;
      case 6u:
        PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)6>>>>((uint64_t)v20, (int *)&v19, a5, &v18);
        break;
      case 0xAu:
        PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)10>>>>((uint64_t)v20, (int *)&v19, a5, &v18);
        break;
      case 0xDu:
        PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)13>>>>((uint64_t)v20, (int *)&v19, a5, &v18);
        break;
      case 0x10u:
        PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)16>>>>((uint64_t)v20, (int *)&v19, a5, &v18);
        break;
      case 0x11u:
        PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)17>>>>((uint64_t)v20, (int *)&v19, a5, &v18);
        break;
      default:
        break;
    }
    if (v19 <= 3) {
      *a4 = v19;
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef(&v45);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v44);
  return v15;
}

void sub_1B7E5172C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CGColorSpace *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,CGColorSpace *a38)
{
  PCCFRef<CGColorSpace *>::~PCCFRef(&a9);
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef(&a38);
  PCCFRef<CGColorSpace *>::~PCCFRef(v38);
  _Unwind_Resume(a1);
}

CGColorSpace **PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)3>>>>(uint64_t a1, int *a2, char *a3, unsigned char *a4)
{
  uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  unsigned int v10 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
  if (v10)
  {
    unsigned int v11 = 0;
    unsigned __int8 v12 = 0;
    unsigned __int8 v13 = 0;
    unsigned __int8 v14 = 0;
    int v15 = 0;
    unsigned int v16 = 0;
    unsigned __int8 v17 = 0;
    unsigned __int8 v18 = 0;
    unsigned __int8 v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = *(unsigned __int8 *)result;
    char v23 = 1;
    int v24 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
    do
    {
      int v25 = *(unsigned __int8 *)result;
      uint64_t v9 = *((unsigned __int8 *)result + 1);
      uint64_t v8 = *((unsigned __int8 *)result + 2);
      unsigned int v26 = *((unsigned __int8 *)result + 3);
      if (v25 == 255)
      {
        BOOL v30 = v9 == v17 && v8 == v18 && v26 == v19;
        v20 &= v30;
        if (!v16)
        {
          int v20 = 1;
          unsigned __int8 v19 = *((unsigned char *)result + 3);
          unsigned __int8 v18 = *((unsigned char *)result + 2);
          unsigned __int8 v17 = *((unsigned char *)result + 1);
        }
        ++v16;
      }
      else if (!*(unsigned char *)result)
      {
        if (v11)
        {
          uint64_t v9 = v9 - v12;
          if (v9 || __PAIR64__(v26, v8) != __PAIR64__(v14, v13))
          {
            int v15 = 0;
            if ((int)v9 >= 0) {
              uint64_t v9 = v9;
            }
            else {
              uint64_t v9 = -(int)v9;
            }
            if ((int)v9 > v21) {
              int v21 = v9;
            }
            LODWORD(v8) = v8 - v13;
            if ((int)v8 >= 0) {
              uint64_t v8 = v8;
            }
            else {
              uint64_t v8 = -(int)v8;
            }
            if (v8 > v21) {
              int v21 = v8;
            }
            int v27 = v26 - v14;
            if (v27 < 0) {
              int v27 = -v27;
            }
            if (v27 > v21) {
              int v21 = v27;
            }
          }
        }
        else
        {
          int v15 = 1;
          unsigned __int8 v14 = *((unsigned char *)result + 3);
          unsigned __int8 v13 = *((unsigned char *)result + 2);
          unsigned __int8 v12 = *((unsigned char *)result + 1);
        }
        ++v11;
      }
      v23 &= v25 == v22;
      uint64_t result = (CGColorSpace **)((char *)result + 4);
      --v24;
    }
    while (v24);
  }
  else
  {
    int v21 = 0;
    int v20 = 0;
    unsigned __int8 v19 = 0;
    unsigned __int8 v18 = 0;
    unsigned __int8 v17 = 0;
    unsigned int v16 = 0;
    int v15 = 0;
    unsigned __int8 v14 = 0;
    unsigned __int8 v13 = 0;
    unsigned __int8 v12 = 0;
    unsigned int v11 = 0;
    char v23 = 1;
  }
  LOBYTE(v77) = v14;
  BYTE4(v77) = v13;
  BOOL v32 = v11 == v10 || v16 == v10;
  int v33 = (v11 > v10 / 0x64) & v15;
  if (v16 > v10 / 0x64) {
    int v34 = v20 & (v33 ^ 1);
  }
  else {
    int v34 = 0;
  }
  v76 = (PCImage *)a1;
  if (!v32 && ((v15 | v20) & 1) == 0 && v21 < 3)
  {
    v74 = a3;
    v75 = a4;
    unsigned __int8 v35 = 0;
    unsigned __int8 v36 = 0;
    unsigned __int8 v37 = 0;
    float v38 = 2.0;
LABEL_56:
    char v72 = 1;
    BOOL v73 = v32;
    LOBYTE(v77) = v36;
    BYTE4(v77) = v35;
    unsigned __int8 v71 = v35;
    unsigned __int8 v12 = v37;
    goto LABEL_60;
  }
  if (((v33 | v34) & 1) == 0)
  {
    int v39 = 0;
    char v40 = 1;
    BOOL v41 = 1;
    unsigned __int8 v42 = v12;
    if (!v32) {
      goto LABEL_78;
    }
    goto LABEL_58;
  }
  float v38 = 0.0;
  v74 = a3;
  v75 = a4;
  if (v33)
  {
    unsigned __int8 v37 = v12;
    unsigned __int8 v36 = v14;
    unsigned __int8 v35 = v13;
    goto LABEL_56;
  }
  char v72 = 0;
  BOOL v73 = v32;
  unsigned __int8 v71 = v18;
  unsigned __int8 v37 = v17;
  unsigned __int8 v36 = v19;
LABEL_60:
  uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64), v8, v9);
  BOOL v41 = v10 == 0;
  if (v10)
  {
    v43.n128_f32[0] = (float)v37;
    v44.n128_f32[0] = (float)v71;
    v45.n128_f32[0] = (float)v36;
    int v48 = v34 << 31 >> 31;
    int v49 = (char *)result + 3;
    v46.n128_u32[0] = 1.0;
    v47.n128_u64[0] = 0;
    unsigned int v50 = v10;
    a3 = v74;
    a4 = v75;
    unsigned __int8 v42 = v12;
    BOOL v51 = v73;
    do
    {
      if (*(v49 - 3) != v48)
      {
        unsigned int v52 = (*(v49 - 3) ^ v48);
        unsigned int v53 = 1132396544;
        float v54 = 255.0 / (float)v52;
        float v55 = 1.0 - (float)((float)v52 / 255.0);
        LOBYTE(v53) = *(v49 - 2);
        *(float *)&unsigned int v56 = v55 * v43.n128_f32[0];
        float v57 = (float)((float)v53 - (float)(v55 * v43.n128_f32[0])) - v38;
        LOBYTE(v56) = *(v49 - 1);
        *(float *)&unsigned int v58 = v55 * v44.n128_f32[0];
        float v59 = (float)((float)v56 - (float)(v55 * v44.n128_f32[0])) - v38;
        LOBYTE(v58) = *v49;
        float v60 = (float)((float)v58 - (float)(v55 * v45.n128_f32[0])) - v38;
        if (v57 >= 0.0) {
          float v61 = v57;
        }
        else {
          float v61 = 0.0;
        }
        if (v59 >= 0.0) {
          float v62 = v59;
        }
        else {
          float v62 = 0.0;
        }
        if (v60 < 0.0) {
          float v60 = 0.0;
        }
        if ((int)(float)(v54 * v61) > 255 || (int)(float)(v54 * v62) > 255 || (int)(float)(v54 * v60) > 255) {
          break;
        }
      }
      --v50;
      v49 += 4;
      BOOL v41 = v50 == 0;
    }
    while (v50);
    if (v72) {
      goto LABEL_76;
    }
LABEL_84:
    if (v17 || v18 || v19)
    {
      BOOL v64 = v51;
      uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void, __n128, __n128, __n128, __n128, __n128))(**((void **)v76 + 8) + 16))(*((void *)v76 + 8), v43, v44, v45, v46, v47);
      if (!v10)
      {
        char v40 = 0;
        uint64_t v77 = 0;
        unsigned __int8 v42 = 0;
        int v39 = 1;
        if (!v64) {
          goto LABEL_78;
        }
LABEL_58:
        *a2 = 0;
LABEL_80:
        *a3 = 0;
        goto LABEL_102;
      }
      v65 = (char *)result + 3;
      BOOL v51 = v64;
      while (1)
      {
        if (*(v65 - 3))
        {
          unsigned int v66 = 1132396544;
          float v67 = 255.0 / (float)*(v65 - 3);
          LOBYTE(v66) = *(v65 - 2);
          float v68 = v67 * (float)v66;
          if ((int)v68 > 255) {
            break;
          }
          LOBYTE(v68) = *(v65 - 1);
          float v69 = v67 * (float)LODWORD(v68);
          if ((int)v69 > 255) {
            break;
          }
          LOBYTE(v69) = *v65;
          if ((int)(float)(v67 * (float)LODWORD(v69)) > 255) {
            break;
          }
        }
        v65 += 4;
        if (!--v10)
        {
          char v40 = 0;
          uint64_t v77 = 0;
          unsigned __int8 v42 = 0;
          goto LABEL_77;
        }
      }
    }
    char v40 = 0;
    int v39 = 0;
    if (!v51) {
      goto LABEL_78;
    }
    goto LABEL_58;
  }
  a3 = v74;
  a4 = v75;
  unsigned __int8 v42 = v12;
  BOOL v51 = v73;
  if ((v72 & 1) == 0) {
    goto LABEL_84;
  }
LABEL_76:
  char v40 = 0;
LABEL_77:
  int v39 = 1;
  if (v51) {
    goto LABEL_58;
  }
LABEL_78:
  if (v40 & 1 | !v41)
  {
    *a2 = 1;
    goto LABEL_80;
  }
  PCColor::PCColor((PCColor *)&v81.var1);
  PCImage::getColorSpace(v76, (CGColorSpace **)&v81);
  if (v39)
  {
    PCColor::setRGB((PCColor *)&v81.var1, (float)v42 / 255.0, (float)BYTE4(v77) / 255.0, (float)v77 / 255.0, &v81);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v81);
    char v63 = 0;
  }
  else
  {
    PCColor::setRGB((PCColor *)&v81.var1, (float)v17 / 255.0, (float)v18 / 255.0, (float)v19 / 255.0, &v81);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v81);
    char v63 = 1;
  }
  *a3 = v63;
  uint64_t v80 = 0;
  float v79 = 0.0;
  PCColorSpaceCache::rec709Linear((CGColorSpace **)&v81);
  PCColor::getRGB((PCColor *)&v81.var1, (float *)&v80 + 1, (float *)&v80, &v79, (const PCColorSpaceHandle *)&v81);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v81);
  if (*((float *)&v80 + 1) * 0.2126 + *(float *)&v80 * 0.7152 + v79 * 0.0722 >= 0.5) {
    int v70 = 3;
  }
  else {
    int v70 = 2;
  }
  *a2 = v70;
  uint64_t result = PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v81.var7);
LABEL_102:
  *a4 = v23 ^ 1;
  return result;
}

void sub_1B7E51E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  unsigned int v11 = va_arg(va1, CGColorSpace *);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

CGColorSpace **PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)4>>>>(uint64_t a1, int *a2, char *a3, unsigned char *a4)
{
  uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  unsigned int v10 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
  if (v10)
  {
    unsigned int v11 = 0;
    unsigned __int8 v12 = 0;
    unsigned __int8 v13 = 0;
    unsigned __int8 v14 = 0;
    int v15 = 0;
    unsigned int v16 = 0;
    unsigned __int8 v17 = 0;
    unsigned __int8 v18 = 0;
    unsigned __int8 v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = *(unsigned __int8 *)result;
    char v23 = 1;
    int v24 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
    do
    {
      int v25 = *(unsigned __int8 *)result;
      uint64_t v9 = *((unsigned __int8 *)result + 3);
      uint64_t v8 = *((unsigned __int8 *)result + 2);
      unsigned int v26 = *((unsigned __int8 *)result + 1);
      if (v25 == 255)
      {
        BOOL v30 = v9 == v17 && v8 == v18 && v26 == v19;
        v20 &= v30;
        if (!v16)
        {
          int v20 = 1;
          unsigned __int8 v19 = *((unsigned char *)result + 1);
          unsigned __int8 v18 = *((unsigned char *)result + 2);
          unsigned __int8 v17 = *((unsigned char *)result + 3);
        }
        ++v16;
      }
      else if (!*(unsigned char *)result)
      {
        if (v11)
        {
          uint64_t v9 = v9 - v12;
          if (v9 || __PAIR64__(v8, v26) != __PAIR64__(v13, v14))
          {
            int v15 = 0;
            if ((int)v9 >= 0) {
              uint64_t v9 = v9;
            }
            else {
              uint64_t v9 = -(int)v9;
            }
            if ((int)v9 > v21) {
              int v21 = v9;
            }
            LODWORD(v8) = v8 - v13;
            if ((int)v8 >= 0) {
              uint64_t v8 = v8;
            }
            else {
              uint64_t v8 = -(int)v8;
            }
            if (v8 > v21) {
              int v21 = v8;
            }
            int v27 = v26 - v14;
            if (v27 < 0) {
              int v27 = -v27;
            }
            if (v27 > v21) {
              int v21 = v27;
            }
          }
        }
        else
        {
          int v15 = 1;
          unsigned __int8 v14 = *((unsigned char *)result + 1);
          unsigned __int8 v13 = *((unsigned char *)result + 2);
          unsigned __int8 v12 = *((unsigned char *)result + 3);
        }
        ++v11;
      }
      v23 &= v25 == v22;
      uint64_t result = (CGColorSpace **)((char *)result + 4);
      --v24;
    }
    while (v24);
  }
  else
  {
    int v21 = 0;
    int v20 = 0;
    unsigned __int8 v19 = 0;
    unsigned __int8 v18 = 0;
    unsigned __int8 v17 = 0;
    unsigned int v16 = 0;
    int v15 = 0;
    unsigned __int8 v14 = 0;
    unsigned __int8 v13 = 0;
    unsigned __int8 v12 = 0;
    unsigned int v11 = 0;
    char v23 = 1;
  }
  LOBYTE(v77) = v14;
  BYTE4(v77) = v13;
  BOOL v32 = v11 == v10 || v16 == v10;
  int v33 = (v11 > v10 / 0x64) & v15;
  if (v16 > v10 / 0x64) {
    int v34 = v20 & (v33 ^ 1);
  }
  else {
    int v34 = 0;
  }
  v76 = (PCImage *)a1;
  if (!v32 && ((v15 | v20) & 1) == 0 && v21 < 3)
  {
    v74 = a3;
    v75 = a4;
    unsigned __int8 v35 = 0;
    unsigned __int8 v36 = 0;
    unsigned __int8 v37 = 0;
    float v38 = 2.0;
LABEL_56:
    char v72 = 1;
    BOOL v73 = v32;
    LOBYTE(v77) = v36;
    BYTE4(v77) = v35;
    unsigned __int8 v71 = v35;
    unsigned __int8 v12 = v37;
    goto LABEL_60;
  }
  if (((v33 | v34) & 1) == 0)
  {
    int v39 = 0;
    char v40 = 1;
    BOOL v41 = 1;
    unsigned __int8 v42 = v12;
    if (!v32) {
      goto LABEL_78;
    }
    goto LABEL_58;
  }
  float v38 = 0.0;
  v74 = a3;
  v75 = a4;
  if (v33)
  {
    unsigned __int8 v37 = v12;
    unsigned __int8 v36 = v14;
    unsigned __int8 v35 = v13;
    goto LABEL_56;
  }
  char v72 = 0;
  BOOL v73 = v32;
  unsigned __int8 v71 = v18;
  unsigned __int8 v37 = v17;
  unsigned __int8 v36 = v19;
LABEL_60:
  uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64), v8, v9);
  BOOL v41 = v10 == 0;
  if (v10)
  {
    v43.n128_f32[0] = (float)v37;
    v44.n128_f32[0] = (float)v71;
    v45.n128_f32[0] = (float)v36;
    int v48 = v34 << 31 >> 31;
    int v49 = (char *)result + 3;
    v46.n128_u32[0] = 1.0;
    v47.n128_u64[0] = 0;
    unsigned int v50 = v10;
    a3 = v74;
    a4 = v75;
    unsigned __int8 v42 = v12;
    BOOL v51 = v73;
    do
    {
      if (*(v49 - 3) != v48)
      {
        unsigned int v52 = (*(v49 - 3) ^ v48);
        unsigned int v53 = 1132396544;
        float v54 = 255.0 / (float)v52;
        float v55 = 1.0 - (float)((float)v52 / 255.0);
        LOBYTE(v53) = *v49;
        *(float *)&unsigned int v56 = v55 * v43.n128_f32[0];
        float v57 = (float)((float)v53 - (float)(v55 * v43.n128_f32[0])) - v38;
        LOBYTE(v56) = *(v49 - 1);
        *(float *)&unsigned int v58 = v55 * v44.n128_f32[0];
        float v59 = (float)((float)v56 - (float)(v55 * v44.n128_f32[0])) - v38;
        LOBYTE(v58) = *(v49 - 2);
        float v60 = (float)((float)v58 - (float)(v55 * v45.n128_f32[0])) - v38;
        if (v57 >= 0.0) {
          float v61 = v57;
        }
        else {
          float v61 = 0.0;
        }
        if (v59 >= 0.0) {
          float v62 = v59;
        }
        else {
          float v62 = 0.0;
        }
        if (v60 < 0.0) {
          float v60 = 0.0;
        }
        if ((int)(float)(v54 * v61) > 255 || (int)(float)(v54 * v62) > 255 || (int)(float)(v54 * v60) > 255) {
          break;
        }
      }
      --v50;
      v49 += 4;
      BOOL v41 = v50 == 0;
    }
    while (v50);
    if (v72) {
      goto LABEL_76;
    }
LABEL_84:
    if (v17 || v18 || v19)
    {
      BOOL v64 = v51;
      uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void, __n128, __n128, __n128, __n128, __n128))(**((void **)v76 + 8) + 16))(*((void *)v76 + 8), v43, v44, v45, v46, v47);
      if (!v10)
      {
        char v40 = 0;
        uint64_t v77 = 0;
        unsigned __int8 v42 = 0;
        int v39 = 1;
        if (!v64) {
          goto LABEL_78;
        }
LABEL_58:
        *a2 = 0;
LABEL_80:
        *a3 = 0;
        goto LABEL_102;
      }
      v65 = (char *)result + 3;
      BOOL v51 = v64;
      while (1)
      {
        if (*(v65 - 3))
        {
          unsigned int v66 = 1132396544;
          float v67 = 255.0 / (float)*(v65 - 3);
          LOBYTE(v66) = *v65;
          float v68 = v67 * (float)v66;
          if ((int)v68 > 255) {
            break;
          }
          LOBYTE(v68) = *(v65 - 1);
          float v69 = v67 * (float)LODWORD(v68);
          if ((int)v69 > 255) {
            break;
          }
          LOBYTE(v69) = *(v65 - 2);
          if ((int)(float)(v67 * (float)LODWORD(v69)) > 255) {
            break;
          }
        }
        v65 += 4;
        if (!--v10)
        {
          char v40 = 0;
          uint64_t v77 = 0;
          unsigned __int8 v42 = 0;
          goto LABEL_77;
        }
      }
    }
    char v40 = 0;
    int v39 = 0;
    if (!v51) {
      goto LABEL_78;
    }
    goto LABEL_58;
  }
  a3 = v74;
  a4 = v75;
  unsigned __int8 v42 = v12;
  BOOL v51 = v73;
  if ((v72 & 1) == 0) {
    goto LABEL_84;
  }
LABEL_76:
  char v40 = 0;
LABEL_77:
  int v39 = 1;
  if (v51) {
    goto LABEL_58;
  }
LABEL_78:
  if (v40 & 1 | !v41)
  {
    *a2 = 1;
    goto LABEL_80;
  }
  PCColor::PCColor((PCColor *)&v81.var1);
  PCImage::getColorSpace(v76, (CGColorSpace **)&v81);
  if (v39)
  {
    PCColor::setRGB((PCColor *)&v81.var1, (float)v42 / 255.0, (float)BYTE4(v77) / 255.0, (float)v77 / 255.0, &v81);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v81);
    char v63 = 0;
  }
  else
  {
    PCColor::setRGB((PCColor *)&v81.var1, (float)v17 / 255.0, (float)v18 / 255.0, (float)v19 / 255.0, &v81);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v81);
    char v63 = 1;
  }
  *a3 = v63;
  uint64_t v80 = 0;
  float v79 = 0.0;
  PCColorSpaceCache::rec709Linear((CGColorSpace **)&v81);
  PCColor::getRGB((PCColor *)&v81.var1, (float *)&v80 + 1, (float *)&v80, &v79, (const PCColorSpaceHandle *)&v81);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v81);
  if (*((float *)&v80 + 1) * 0.2126 + *(float *)&v80 * 0.7152 + v79 * 0.0722 >= 0.5) {
    int v70 = 3;
  }
  else {
    int v70 = 2;
  }
  *a2 = v70;
  uint64_t result = PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v81.var7);
LABEL_102:
  *a4 = v23 ^ 1;
  return result;
}

void sub_1B7E524E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  unsigned int v11 = va_arg(va1, CGColorSpace *);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

uint64_t PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)5>>>>(uint64_t a1, int *a2, char *a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  unsigned int v10 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
  if (v10)
  {
    unsigned int v11 = 0;
    unsigned __int8 v12 = 0;
    unsigned __int8 v13 = 0;
    unsigned __int8 v14 = 0;
    int v15 = 0;
    unsigned int v16 = 0;
    unsigned __int8 v17 = 0;
    unsigned __int8 v18 = 0;
    unsigned __int8 v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = *(unsigned __int8 *)(result + 3);
    char v23 = (unsigned char *)(result + 3);
    char v24 = 1;
    int v25 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
    do
    {
      int v26 = *v23;
      uint64_t v9 = *(v23 - 3);
      uint64_t v8 = *(v23 - 2);
      uint64_t result = *(v23 - 1);
      if (v26 == 255)
      {
        BOOL v29 = v9 == v17 && v8 == v18 && result == v19;
        v20 &= v29;
        if (!v16)
        {
          int v20 = 1;
          unsigned __int8 v19 = *(v23 - 1);
          unsigned __int8 v18 = *(v23 - 2);
          unsigned __int8 v17 = *(v23 - 3);
        }
        ++v16;
      }
      else if (!*v23)
      {
        if (v11)
        {
          uint64_t v9 = v9 - v12;
          if (v9 || __PAIR64__(result, v8) != __PAIR64__(v14, v13))
          {
            int v15 = 0;
            if ((int)v9 >= 0) {
              uint64_t v9 = v9;
            }
            else {
              uint64_t v9 = -(int)v9;
            }
            if ((int)v9 > v21) {
              int v21 = v9;
            }
            LODWORD(v8) = v8 - v13;
            if ((int)v8 >= 0) {
              uint64_t v8 = v8;
            }
            else {
              uint64_t v8 = -(int)v8;
            }
            if (v8 > v21) {
              int v21 = v8;
            }
            LODWORD(result) = result - v14;
            if ((int)result >= 0) {
              uint64_t result = result;
            }
            else {
              uint64_t result = -(int)result;
            }
            if (result > v21) {
              int v21 = result;
            }
          }
        }
        else
        {
          int v15 = 1;
          unsigned __int8 v14 = *(v23 - 1);
          unsigned __int8 v13 = *(v23 - 2);
          unsigned __int8 v12 = *(v23 - 3);
        }
        ++v11;
      }
      v23 += 4;
      v24 &= v26 == v22;
      --v25;
    }
    while (v25);
  }
  else
  {
    int v21 = 0;
    int v20 = 0;
    unsigned __int8 v19 = 0;
    unsigned __int8 v18 = 0;
    unsigned __int8 v17 = 0;
    unsigned int v16 = 0;
    int v15 = 0;
    unsigned __int8 v14 = 0;
    unsigned __int8 v13 = 0;
    unsigned __int8 v12 = 0;
    unsigned int v11 = 0;
    char v24 = 1;
  }
  LOBYTE(v81) = v14;
  BYTE4(v81) = v13;
  BOOL v31 = v11 == v10 || v16 == v10;
  int v32 = (v11 > v10 / 0x64) & v15;
  if (v16 > v10 / 0x64) {
    int v33 = v20 & (v32 ^ 1);
  }
  else {
    int v33 = 0;
  }
  uint64_t v80 = (PCImage *)a1;
  if (!v31 && ((v15 | v20) & 1) == 0 && v21 < 3)
  {
    v78 = a3;
    float v79 = a4;
    unsigned __int8 v34 = 0;
    unsigned __int8 v35 = 0;
    unsigned __int8 v36 = 0;
    float v37 = 2.0;
LABEL_57:
    char v76 = 1;
    BOOL v77 = v31;
    LOBYTE(v81) = v35;
    BYTE4(v81) = v34;
    unsigned __int8 v75 = v34;
    unsigned __int8 v12 = v36;
    goto LABEL_61;
  }
  if (((v32 | v33) & 1) == 0)
  {
    int v38 = 0;
    char v39 = 1;
    BOOL v40 = 1;
    unsigned __int8 v41 = v12;
    if (!v31) {
      goto LABEL_79;
    }
    goto LABEL_59;
  }
  float v37 = 0.0;
  v78 = a3;
  float v79 = a4;
  if (v32)
  {
    unsigned __int8 v36 = v12;
    unsigned __int8 v35 = v14;
    unsigned __int8 v34 = v13;
    goto LABEL_57;
  }
  char v76 = 0;
  BOOL v77 = v31;
  unsigned __int8 v75 = v18;
  unsigned __int8 v36 = v17;
  unsigned __int8 v35 = v19;
LABEL_61:
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64), v8, v9);
  BOOL v40 = v10 == 0;
  if (v10)
  {
    int v47 = v33 << 31 >> 31;
    v42.n128_f32[0] = (float)v36;
    v43.n128_f32[0] = (float)v75;
    v44.n128_f32[0] = (float)v35;
    int v48 = (unsigned __int8 *)(result + 3);
    v45.n128_u32[0] = 1.0;
    v46.n128_u64[0] = 0;
    unsigned int v49 = v10;
    unsigned int v50 = (unsigned __int8 *)(result + 3);
    a3 = v78;
    a4 = v79;
    unsigned __int8 v41 = v12;
    BOOL v51 = v77;
    do
    {
      unsigned __int8 v52 = *v50;
      v50 += 4;
      unsigned __int8 v53 = v52 ^ v47;
      if (v52 != v47)
      {
        unsigned int v54 = 1132396544;
        float v55 = 255.0 / (float)v53;
        float v56 = 1.0 - (float)((float)v53 / 255.0);
        LOBYTE(v54) = *(v48 - 3);
        *(float *)&unsigned int v57 = v56 * v42.n128_f32[0];
        float v58 = (float)((float)v54 - (float)(v56 * v42.n128_f32[0])) - v37;
        LOBYTE(vPCString::~PCString((PCString *)this + 57) = *(v48 - 2);
        *(float *)&unsigned int v59 = v56 * v43.n128_f32[0];
        float v60 = (float)((float)v57 - (float)(v56 * v43.n128_f32[0])) - v37;
        LOBYTE(v59) = *(v48 - 1);
        float v61 = (float)((float)v59 - (float)(v56 * v44.n128_f32[0])) - v37;
        if (v58 >= 0.0) {
          float v62 = v58;
        }
        else {
          float v62 = 0.0;
        }
        if (v60 >= 0.0) {
          float v63 = v60;
        }
        else {
          float v63 = 0.0;
        }
        if (v61 < 0.0) {
          float v61 = 0.0;
        }
        if ((int)(float)(v55 * v62) > 255 || (int)(float)(v55 * v63) > 255 || (int)(float)(v55 * v61) > 255) {
          break;
        }
      }
      BOOL v40 = --v49 == 0;
      int v48 = v50;
    }
    while (v49);
    if (v76) {
      goto LABEL_77;
    }
LABEL_85:
    if (v17 || v18 || v19)
    {
      BOOL v65 = v51;
      uint64_t result = (*(uint64_t (**)(void, __n128, __n128, __n128, __n128, __n128))(**((void **)v80 + 8) + 16))(*((void *)v80 + 8), v42, v43, v44, v45, v46);
      if (!v10)
      {
        char v39 = 0;
        uint64_t v81 = 0;
        unsigned __int8 v41 = 0;
        int v38 = 1;
        if (!v65) {
          goto LABEL_79;
        }
LABEL_59:
        *a2 = 0;
LABEL_81:
        *a3 = 0;
        goto LABEL_103;
      }
      unsigned int v66 = (unsigned __int8 *)(result + 3);
      float v67 = (unsigned __int8 *)(result + 3);
      BOOL v51 = v65;
      while (1)
      {
        unsigned int v69 = *v67;
        v67 += 4;
        unsigned int v68 = v69;
        if (v69)
        {
          unsigned int v70 = 1132396544;
          float v71 = 255.0 / (float)v68;
          LOBYTE(v70) = *(v66 - 3);
          float v72 = v71 * (float)v70;
          if ((int)v72 > 255) {
            break;
          }
          LOBYTE(v72) = *(v66 - 2);
          float v73 = v71 * (float)LODWORD(v72);
          if ((int)v73 > 255) {
            break;
          }
          LOBYTE(v73) = *(v66 - 1);
          if ((int)(float)(v71 * (float)LODWORD(v73)) > 255) {
            break;
          }
        }
        unsigned int v66 = v67;
        if (!--v10)
        {
          char v39 = 0;
          uint64_t v81 = 0;
          unsigned __int8 v41 = 0;
          goto LABEL_78;
        }
      }
    }
    char v39 = 0;
    int v38 = 0;
    if (!v51) {
      goto LABEL_79;
    }
    goto LABEL_59;
  }
  a3 = v78;
  a4 = v79;
  unsigned __int8 v41 = v12;
  BOOL v51 = v77;
  if ((v76 & 1) == 0) {
    goto LABEL_85;
  }
LABEL_77:
  char v39 = 0;
LABEL_78:
  int v38 = 1;
  if (v51) {
    goto LABEL_59;
  }
LABEL_79:
  if (v39 & 1 | !v40)
  {
    *a2 = 1;
    goto LABEL_81;
  }
  PCColor::PCColor((PCColor *)&v85.var1);
  PCImage::getColorSpace(v80, (CGColorSpace **)&v85);
  if (v38)
  {
    PCColor::setRGB((PCColor *)&v85.var1, (float)v41 / 255.0, (float)BYTE4(v81) / 255.0, (float)v81 / 255.0, &v85);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v85);
    char v64 = 0;
  }
  else
  {
    PCColor::setRGB((PCColor *)&v85.var1, (float)v17 / 255.0, (float)v18 / 255.0, (float)v19 / 255.0, &v85);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v85);
    char v64 = 1;
  }
  *a3 = v64;
  uint64_t v84 = 0;
  float v83 = 0.0;
  PCColorSpaceCache::rec709Linear((CGColorSpace **)&v85);
  PCColor::getRGB((PCColor *)&v85.var1, (float *)&v84 + 1, (float *)&v84, &v83, (const PCColorSpaceHandle *)&v85);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v85);
  if (*((float *)&v84 + 1) * 0.2126 + *(float *)&v84 * 0.7152 + v83 * 0.0722 >= 0.5) {
    int v74 = 3;
  }
  else {
    int v74 = 2;
  }
  *a2 = v74;
  uint64_t result = (uint64_t)PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v85.var7);
LABEL_103:
  *a4 = v24 ^ 1;
  return result;
}

void sub_1B7E52BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  unsigned int v11 = va_arg(va1, CGColorSpace *);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

uint64_t PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)6>>>>(uint64_t a1, int *a2, char *a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  unsigned int v10 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
  if (v10)
  {
    unsigned int v11 = 0;
    unsigned __int8 v12 = 0;
    unsigned __int8 v13 = 0;
    unsigned __int8 v14 = 0;
    int v15 = 0;
    unsigned int v16 = 0;
    unsigned __int8 v17 = 0;
    unsigned __int8 v18 = 0;
    unsigned __int8 v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = *(unsigned __int8 *)(result + 3);
    char v23 = (unsigned char *)(result + 3);
    char v24 = 1;
    int v25 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
    do
    {
      int v26 = *v23;
      uint64_t v9 = *(v23 - 1);
      uint64_t v8 = *(v23 - 2);
      uint64_t result = *(v23 - 3);
      if (v26 == 255)
      {
        BOOL v29 = v9 == v17 && v8 == v18 && result == v19;
        v20 &= v29;
        if (!v16)
        {
          int v20 = 1;
          unsigned __int8 v19 = *(v23 - 3);
          unsigned __int8 v18 = *(v23 - 2);
          unsigned __int8 v17 = *(v23 - 1);
        }
        ++v16;
      }
      else if (!*v23)
      {
        if (v11)
        {
          uint64_t v9 = v9 - v12;
          if (v9 || __PAIR64__(v8, result) != __PAIR64__(v13, v14))
          {
            int v15 = 0;
            if ((int)v9 >= 0) {
              uint64_t v9 = v9;
            }
            else {
              uint64_t v9 = -(int)v9;
            }
            if ((int)v9 > v21) {
              int v21 = v9;
            }
            LODWORD(v8) = v8 - v13;
            if ((int)v8 >= 0) {
              uint64_t v8 = v8;
            }
            else {
              uint64_t v8 = -(int)v8;
            }
            if (v8 > v21) {
              int v21 = v8;
            }
            LODWORD(result) = result - v14;
            if ((int)result >= 0) {
              uint64_t result = result;
            }
            else {
              uint64_t result = -(int)result;
            }
            if (result > v21) {
              int v21 = result;
            }
          }
        }
        else
        {
          int v15 = 1;
          unsigned __int8 v14 = *(v23 - 3);
          unsigned __int8 v13 = *(v23 - 2);
          unsigned __int8 v12 = *(v23 - 1);
        }
        ++v11;
      }
      v23 += 4;
      v24 &= v26 == v22;
      --v25;
    }
    while (v25);
  }
  else
  {
    int v21 = 0;
    int v20 = 0;
    unsigned __int8 v19 = 0;
    unsigned __int8 v18 = 0;
    unsigned __int8 v17 = 0;
    unsigned int v16 = 0;
    int v15 = 0;
    unsigned __int8 v14 = 0;
    unsigned __int8 v13 = 0;
    unsigned __int8 v12 = 0;
    unsigned int v11 = 0;
    char v24 = 1;
  }
  LOBYTE(v81) = v14;
  BYTE4(v81) = v13;
  BOOL v31 = v11 == v10 || v16 == v10;
  int v32 = (v11 > v10 / 0x64) & v15;
  if (v16 > v10 / 0x64) {
    int v33 = v20 & (v32 ^ 1);
  }
  else {
    int v33 = 0;
  }
  uint64_t v80 = (PCImage *)a1;
  if (!v31 && ((v15 | v20) & 1) == 0 && v21 < 3)
  {
    v78 = a3;
    float v79 = a4;
    unsigned __int8 v34 = 0;
    unsigned __int8 v35 = 0;
    unsigned __int8 v36 = 0;
    float v37 = 2.0;
LABEL_57:
    char v76 = 1;
    BOOL v77 = v31;
    LOBYTE(v81) = v35;
    BYTE4(v81) = v34;
    unsigned __int8 v75 = v34;
    unsigned __int8 v12 = v36;
    goto LABEL_61;
  }
  if (((v32 | v33) & 1) == 0)
  {
    int v38 = 0;
    char v39 = 1;
    BOOL v40 = 1;
    unsigned __int8 v41 = v12;
    if (!v31) {
      goto LABEL_79;
    }
    goto LABEL_59;
  }
  float v37 = 0.0;
  v78 = a3;
  float v79 = a4;
  if (v32)
  {
    unsigned __int8 v36 = v12;
    unsigned __int8 v35 = v14;
    unsigned __int8 v34 = v13;
    goto LABEL_57;
  }
  char v76 = 0;
  BOOL v77 = v31;
  unsigned __int8 v75 = v18;
  unsigned __int8 v36 = v17;
  unsigned __int8 v35 = v19;
LABEL_61:
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64), v8, v9);
  BOOL v40 = v10 == 0;
  if (v10)
  {
    int v47 = v33 << 31 >> 31;
    v42.n128_f32[0] = (float)v36;
    v43.n128_f32[0] = (float)v75;
    v44.n128_f32[0] = (float)v35;
    int v48 = (unsigned __int8 *)(result + 3);
    v45.n128_u32[0] = 1.0;
    v46.n128_u64[0] = 0;
    unsigned int v49 = v10;
    unsigned int v50 = (unsigned __int8 *)(result + 3);
    a3 = v78;
    a4 = v79;
    unsigned __int8 v41 = v12;
    BOOL v51 = v77;
    do
    {
      unsigned __int8 v52 = *v50;
      v50 += 4;
      unsigned __int8 v53 = v52 ^ v47;
      if (v52 != v47)
      {
        unsigned int v54 = 1132396544;
        float v55 = 255.0 / (float)v53;
        float v56 = 1.0 - (float)((float)v53 / 255.0);
        LOBYTE(v54) = *(v48 - 1);
        *(float *)&unsigned int v57 = v56 * v42.n128_f32[0];
        float v58 = (float)((float)v54 - (float)(v56 * v42.n128_f32[0])) - v37;
        LOBYTE(vPCString::~PCString((PCString *)this + 57) = *(v48 - 2);
        *(float *)&unsigned int v59 = v56 * v43.n128_f32[0];
        float v60 = (float)((float)v57 - (float)(v56 * v43.n128_f32[0])) - v37;
        LOBYTE(v59) = *(v48 - 3);
        float v61 = (float)((float)v59 - (float)(v56 * v44.n128_f32[0])) - v37;
        if (v58 >= 0.0) {
          float v62 = v58;
        }
        else {
          float v62 = 0.0;
        }
        if (v60 >= 0.0) {
          float v63 = v60;
        }
        else {
          float v63 = 0.0;
        }
        if (v61 < 0.0) {
          float v61 = 0.0;
        }
        if ((int)(float)(v55 * v62) > 255 || (int)(float)(v55 * v63) > 255 || (int)(float)(v55 * v61) > 255) {
          break;
        }
      }
      BOOL v40 = --v49 == 0;
      int v48 = v50;
    }
    while (v49);
    if (v76) {
      goto LABEL_77;
    }
LABEL_85:
    if (v17 || v18 || v19)
    {
      BOOL v65 = v51;
      uint64_t result = (*(uint64_t (**)(void, __n128, __n128, __n128, __n128, __n128))(**((void **)v80 + 8) + 16))(*((void *)v80 + 8), v42, v43, v44, v45, v46);
      if (!v10)
      {
        char v39 = 0;
        uint64_t v81 = 0;
        unsigned __int8 v41 = 0;
        int v38 = 1;
        if (!v65) {
          goto LABEL_79;
        }
LABEL_59:
        *a2 = 0;
LABEL_81:
        *a3 = 0;
        goto LABEL_103;
      }
      unsigned int v66 = (unsigned __int8 *)(result + 3);
      float v67 = (unsigned __int8 *)(result + 3);
      BOOL v51 = v65;
      while (1)
      {
        unsigned int v69 = *v67;
        v67 += 4;
        unsigned int v68 = v69;
        if (v69)
        {
          unsigned int v70 = 1132396544;
          float v71 = 255.0 / (float)v68;
          LOBYTE(v70) = *(v66 - 1);
          float v72 = v71 * (float)v70;
          if ((int)v72 > 255) {
            break;
          }
          LOBYTE(v72) = *(v66 - 2);
          float v73 = v71 * (float)LODWORD(v72);
          if ((int)v73 > 255) {
            break;
          }
          LOBYTE(v73) = *(v66 - 3);
          if ((int)(float)(v71 * (float)LODWORD(v73)) > 255) {
            break;
          }
        }
        unsigned int v66 = v67;
        if (!--v10)
        {
          char v39 = 0;
          uint64_t v81 = 0;
          unsigned __int8 v41 = 0;
          goto LABEL_78;
        }
      }
    }
    char v39 = 0;
    int v38 = 0;
    if (!v51) {
      goto LABEL_79;
    }
    goto LABEL_59;
  }
  a3 = v78;
  a4 = v79;
  unsigned __int8 v41 = v12;
  BOOL v51 = v77;
  if ((v76 & 1) == 0) {
    goto LABEL_85;
  }
LABEL_77:
  char v39 = 0;
LABEL_78:
  int v38 = 1;
  if (v51) {
    goto LABEL_59;
  }
LABEL_79:
  if (v39 & 1 | !v40)
  {
    *a2 = 1;
    goto LABEL_81;
  }
  PCColor::PCColor((PCColor *)&v85.var1);
  PCImage::getColorSpace(v80, (CGColorSpace **)&v85);
  if (v38)
  {
    PCColor::setRGB((PCColor *)&v85.var1, (float)v41 / 255.0, (float)BYTE4(v81) / 255.0, (float)v81 / 255.0, &v85);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v85);
    char v64 = 0;
  }
  else
  {
    PCColor::setRGB((PCColor *)&v85.var1, (float)v17 / 255.0, (float)v18 / 255.0, (float)v19 / 255.0, &v85);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v85);
    char v64 = 1;
  }
  *a3 = v64;
  uint64_t v84 = 0;
  float v83 = 0.0;
  PCColorSpaceCache::rec709Linear((CGColorSpace **)&v85);
  PCColor::getRGB((PCColor *)&v85.var1, (float *)&v84 + 1, (float *)&v84, &v83, (const PCColorSpaceHandle *)&v85);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v85);
  if (*((float *)&v84 + 1) * 0.2126 + *(float *)&v84 * 0.7152 + v83 * 0.0722 >= 0.5) {
    int v74 = 3;
  }
  else {
    int v74 = 2;
  }
  *a2 = v74;
  uint64_t result = (uint64_t)PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v85.var7);
LABEL_103:
  *a4 = v24 ^ 1;
  return result;
}

void sub_1B7E53258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  unsigned int v11 = va_arg(va1, CGColorSpace *);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

uint64_t PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)10>>>>(uint64_t a1, int *a2, char *a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  unsigned int v11 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
  if (v11)
  {
    unsigned int v12 = 0;
    unsigned __int16 v13 = 0;
    unsigned __int16 v14 = 0;
    unsigned __int16 v15 = 0;
    int v16 = 0;
    unsigned int v17 = 0;
    unsigned __int16 v18 = 0;
    unsigned __int16 v19 = 0;
    unsigned __int16 v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = *(unsigned __int16 *)(result + 6);
    char v24 = (unsigned __int16 *)(result + 4);
    char v25 = 1;
    int v26 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
    do
    {
      int v27 = v24[1];
      uint64_t v10 = *(v24 - 2);
      uint64_t v9 = *(v24 - 1);
      uint64_t v8 = *v24;
      if (v27 == 0xFFFF)
      {
        BOOL v30 = v10 == v18 && v9 == v19 && v8 == v20;
        v21 &= v30;
        if (!v17)
        {
          int v21 = 1;
          unsigned __int16 v20 = *v24;
          unsigned __int16 v19 = *(v24 - 1);
          unsigned __int16 v18 = *(v24 - 2);
        }
        ++v17;
      }
      else if (!v24[1])
      {
        if (v12)
        {
          uint64_t v10 = v10 - v13;
          if (v10 || __PAIR64__(v8, v9) != __PAIR64__(v15, v14))
          {
            int v16 = 0;
            if ((int)v10 >= 0) {
              uint64_t v10 = v10;
            }
            else {
              uint64_t v10 = -(int)v10;
            }
            if ((int)v10 > v22) {
              int v22 = v10;
            }
            LODWORD(v9) = v9 - v14;
            if ((int)v9 >= 0) {
              uint64_t v9 = v9;
            }
            else {
              uint64_t v9 = -(int)v9;
            }
            if (v9 > v22) {
              int v22 = v9;
            }
            LODWORD(v8) = v8 - v15;
            if ((int)v8 >= 0) {
              uint64_t v8 = v8;
            }
            else {
              uint64_t v8 = -(int)v8;
            }
            if (v8 > v22) {
              int v22 = v8;
            }
          }
        }
        else
        {
          int v16 = 1;
          unsigned __int16 v15 = *v24;
          unsigned __int16 v14 = *(v24 - 1);
          unsigned __int16 v13 = *(v24 - 2);
        }
        ++v12;
      }
      v24 += 4;
      uint64_t result = v27 == v23;
      v25 &= result;
      --v26;
    }
    while (v26);
  }
  else
  {
    int v22 = 0;
    int v21 = 0;
    unsigned __int16 v20 = 0;
    unsigned __int16 v19 = 0;
    unsigned __int16 v18 = 0;
    unsigned int v17 = 0;
    int v16 = 0;
    unsigned __int16 v15 = 0;
    unsigned __int16 v14 = 0;
    unsigned __int16 v13 = 0;
    unsigned int v12 = 0;
    char v25 = 1;
  }
  LOWORD(v78) = v15;
  WORD2(v78) = v14;
  BOOL v32 = v12 == v11 || v17 == v11;
  int v33 = (v12 > v11 / 0x64) & v16;
  if (v17 > v11 / 0x64) {
    int v34 = v21 & (v33 ^ 1);
  }
  else {
    int v34 = 0;
  }
  BOOL v77 = (PCImage *)a1;
  if (!v32 && ((v16 | v21) & 1) == 0 && v22 < 3)
  {
    unsigned __int8 v75 = a3;
    char v76 = a4;
    unsigned __int16 v35 = 0;
    unsigned __int16 v36 = 0;
    unsigned __int16 v37 = 0;
    float v38 = 2.0;
LABEL_57:
    char v73 = 1;
    BOOL v74 = v32;
    LOWORD(v78) = v36;
    WORD2(v78) = v35;
    unsigned __int16 v72 = v35;
    unsigned __int16 v13 = v37;
    goto LABEL_61;
  }
  if (((v33 | v34) & 1) == 0)
  {
    int v39 = 0;
    char v40 = 1;
    BOOL v41 = 1;
    unsigned __int16 v42 = v13;
    if (!v32) {
      goto LABEL_79;
    }
    goto LABEL_59;
  }
  float v38 = 0.0;
  unsigned __int8 v75 = a3;
  char v76 = a4;
  if (v33)
  {
    unsigned __int16 v37 = v13;
    unsigned __int16 v36 = v15;
    unsigned __int16 v35 = v14;
    goto LABEL_57;
  }
  char v73 = 0;
  BOOL v74 = v32;
  unsigned __int16 v72 = v19;
  unsigned __int16 v37 = v18;
  unsigned __int16 v36 = v20;
LABEL_61:
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64), v8, v9, v10);
  BOOL v41 = v11 == 0;
  if (v11)
  {
    int v50 = v34 << 31 >> 31;
    v43.n128_f32[0] = (float)v37;
    v44.n128_f32[0] = (float)v72;
    v45.n128_f32[0] = (float)v36;
    BOOL v51 = (_WORD *)(result + 4);
    v46.n128_u32[0] = 1199570688;
    v47.n128_u32[0] = 1.0;
    v48.n128_u64[0] = 0;
    unsigned int v52 = v11;
    a3 = v75;
    a4 = v76;
    unsigned __int16 v42 = v13;
    BOOL v53 = v74;
    do
    {
      if (v51[1] != (unsigned __int16)v50)
      {
        unsigned int v54 = (unsigned __int16)(v51[1] ^ v50);
        float v55 = 65535.0 / (float)v54;
        float v56 = 1.0 - (float)((float)v54 / 65535.0);
        LOWORD(v49) = *(v51 - 2);
        *(float *)&unsigned int v57 = v56 * v43.n128_f32[0];
        float v58 = (float)((float)LODWORD(v49) - (float)(v56 * v43.n128_f32[0])) - v38;
        LOWORD(vPCString::~PCString((PCString *)this + 57) = *(v51 - 1);
        *(float *)&unsigned int v59 = v56 * v44.n128_f32[0];
        float v60 = (float)((float)v57 - (float)(v56 * v44.n128_f32[0])) - v38;
        LOWORD(v59) = *v51;
        float v61 = (float)((float)v59 - (float)(v56 * v45.n128_f32[0])) - v38;
        if (v58 >= 0.0) {
          float v62 = v58;
        }
        else {
          float v62 = 0.0;
        }
        if (v60 >= 0.0) {
          float v63 = v60;
        }
        else {
          float v63 = 0.0;
        }
        if (v61 < 0.0) {
          float v61 = 0.0;
        }
        if ((int)(float)(v55 * v62) >= 0x10000) {
          break;
        }
        float v49 = v55 * v63;
        if ((int)v49 >= 0x10000 || (int)(float)(v55 * v61) >= 0x10000) {
          break;
        }
      }
      v51 += 4;
      BOOL v41 = --v52 == 0;
    }
    while (v52);
    if (v73) {
      goto LABEL_77;
    }
LABEL_85:
    if (v18 || v19 || v20)
    {
      BOOL v65 = v53;
      uint64_t result = (*(uint64_t (**)(void, __n128, __n128, __n128, __n128, __n128, __n128))(**((void **)v77 + 8)
                                                                                                 + 16))(*((void *)v77 + 8), v43, v44, v45, v46, v47, v48);
      if (!v11)
      {
        char v40 = 0;
        uint64_t v78 = 0;
        unsigned __int16 v42 = 0;
        int v39 = 1;
        if (!v65) {
          goto LABEL_79;
        }
LABEL_59:
        *a2 = 0;
LABEL_81:
        *a3 = 0;
        goto LABEL_103;
      }
      float v67 = (_WORD *)(result + 4);
      BOOL v53 = v65;
      while (1)
      {
        if (v67[1])
        {
          float v68 = 65535.0 / (float)(unsigned __int16)v67[1];
          LOWORD(v66) = *(v67 - 2);
          float v69 = v68 * (float)LODWORD(v66);
          if ((int)v69 >= 0x10000) {
            break;
          }
          LOWORD(v69) = *(v67 - 1);
          float v70 = v68 * (float)LODWORD(v69);
          if ((int)v70 >= 0x10000) {
            break;
          }
          LOWORD(v70) = *v67;
          float v66 = (float)LODWORD(v70);
          if ((int)(float)(v68 * v66) >= 0x10000) {
            break;
          }
        }
        v67 += 4;
        if (!--v11)
        {
          char v40 = 0;
          uint64_t v78 = 0;
          unsigned __int16 v42 = 0;
          goto LABEL_78;
        }
      }
    }
    char v40 = 0;
    int v39 = 0;
    if (!v53) {
      goto LABEL_79;
    }
    goto LABEL_59;
  }
  a3 = v75;
  a4 = v76;
  unsigned __int16 v42 = v13;
  BOOL v53 = v74;
  if ((v73 & 1) == 0) {
    goto LABEL_85;
  }
LABEL_77:
  char v40 = 0;
LABEL_78:
  int v39 = 1;
  if (v53) {
    goto LABEL_59;
  }
LABEL_79:
  if (v40 & 1 | !v41)
  {
    *a2 = 1;
    goto LABEL_81;
  }
  PCColor::PCColor((PCColor *)&v82.var1);
  PCImage::getColorSpace(v77, (CGColorSpace **)&v82);
  if (v39)
  {
    PCColor::setRGB((PCColor *)&v82.var1, (float)v42 / 255.0, (float)WORD2(v78) / 255.0, (float)(unsigned __int16)v78 / 255.0, &v82);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v82);
    char v64 = 0;
  }
  else
  {
    PCColor::setRGB((PCColor *)&v82.var1, (float)v18 / 255.0, (float)v19 / 255.0, (float)v20 / 255.0, &v82);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v82);
    char v64 = 1;
  }
  *a3 = v64;
  uint64_t v81 = 0;
  float v80 = 0.0;
  PCColorSpaceCache::rec709Linear((CGColorSpace **)&v82);
  PCColor::getRGB((PCColor *)&v82.var1, (float *)&v81 + 1, (float *)&v81, &v80, (const PCColorSpaceHandle *)&v82);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v82);
  if (*((float *)&v81 + 1) * 0.2126 + *(float *)&v81 * 0.7152 + v80 * 0.0722 >= 0.5) {
    int v71 = 3;
  }
  else {
    int v71 = 2;
  }
  *a2 = v71;
  uint64_t result = (uint64_t)PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v82.var7);
LABEL_103:
  *a4 = v25 ^ 1;
  return result;
}

void sub_1B7E5390C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  unsigned int v11 = va_arg(va1, CGColorSpace *);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

uint64_t PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)13>>>>(uint64_t a1, int *a2, char *a3, unsigned char *a4)
{
  uint64_t v8 = (*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  v99 = (PCImage *)a1;
  unsigned int v9 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
  uint64_t result = 15360;
  if (v9)
  {
    unsigned int v11 = 0;
    int v12 = 0;
    unsigned int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v103 = 0;
    float v20 = half::_toFloat[*(unsigned __int16 *)(v8 + 6)];
    int v21 = (unsigned __int16 *)(v8 + 4);
    uint64_t v22 = 0;
    char v23 = 1;
    unsigned int v24 = v9;
    while (1)
    {
      uint64_t v25 = *(v21 - 2);
      uint64_t v26 = *(v21 - 1);
      uint64_t v27 = *v21;
      float v28 = half::_toFloat[v21[1]];
      if (v28 != 0.0)
      {
        if (v28 == 1.0)
        {
          if (v13)
          {
            if (half::_toFloat[v18] != half::_toFloat[v25]
              || half::_toFloat[v19] != half::_toFloat[v26]
              || half::_toFloat[v103] != half::_toFloat[v27])
            {
              int v14 = 0;
            }
          }
          else
          {
            int v14 = 1;
            uint64_t v103 = *v21;
            uint64_t v19 = *(v21 - 1);
            uint64_t v18 = *(v21 - 2);
          }
          ++v13;
        }
        goto LABEL_25;
      }
      if (v11)
      {
        float v29 = half::_toFloat[v16];
        float v30 = half::_toFloat[v25];
        if (v29 != v30)
        {
          float v31 = half::_toFloat[v26];
          float v32 = half::_toFloat[v17];
LABEL_16:
          int v12 = 0;
          int v33 = (int)vabds_f32(v30, v29);
          if (v15 <= v33) {
            int v15 = v33;
          }
          float v34 = half::_toFloat[v27];
          int v35 = (int)vabds_f32(v31, v32);
          if (v15 <= v35) {
            int v15 = v35;
          }
          int v36 = (int)vabds_f32(v34, half::_toFloat[v22]);
          if (v15 <= v36) {
            int v15 = v36;
          }
          goto LABEL_22;
        }
        float v32 = half::_toFloat[v17];
        float v31 = half::_toFloat[v26];
        if (v32 != v31 || half::_toFloat[v22] != half::_toFloat[v27]) {
          goto LABEL_16;
        }
      }
      else
      {
        int v12 = 1;
        uint64_t v22 = *v21;
        uint64_t v17 = *(v21 - 1);
        uint64_t v16 = *(v21 - 2);
      }
LABEL_22:
      ++v11;
LABEL_25:
      v21 += 4;
      v23 &= v28 == v20;
      if (!--v24) {
        goto LABEL_28;
      }
    }
  }
  uint64_t v103 = 0;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  uint64_t v22 = 0;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  int v15 = 0;
  int v14 = 0;
  unsigned int v13 = 0;
  int v12 = 0;
  unsigned int v11 = 0;
  char v23 = 1;
LABEL_28:
  uint64_t v97 = v16;
  uint64_t v100 = v17;
  BOOL v38 = v11 == v9 || v13 == v9;
  int v39 = (v11 > v9 / 0x64) & v12;
  if (v13 > v9 / 0x64) {
    int v40 = v14 & (v39 ^ 1);
  }
  else {
    int v40 = 0;
  }
  BOOL v98 = v38;
  if (((v38 | v12 | v14) & 1) != 0 || v15 >= 3)
  {
    if ((v39 | v40) != 1)
    {
      int v42 = 0;
      int v43 = 1;
      int v44 = 1;
      uint64_t v45 = v17;
      goto LABEL_133;
    }
    float v41 = 0.0;
    if (v39)
    {
      char v96 = 1;
      uint64_t v105 = v17;
      uint64_t v107 = v22;
      uint64_t v104 = v16;
    }
    else
    {
      char v96 = 0;
      uint64_t v105 = v19;
      uint64_t v107 = v103;
      uint64_t v104 = v18;
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v100 = 0;
    uint64_t v97 = 0;
    uint64_t v105 = 0;
    uint64_t v107 = 0;
    uint64_t v104 = 0;
    float v41 = 2.0;
    char v96 = 1;
  }
  uint64_t result = (*(uint64_t (**)(void))(**((void **)v99 + 8) + 16))(*((void *)v99 + 8));
  uint64_t v101 = v18;
  uint64_t v102 = v19;
  v94 = a3;
  v95 = a2;
  uint64_t v93 = v22;
  if (v9)
  {
    v92 = a4;
    __n128 v46 = (unsigned __int16 *)(result + 4);
    unsigned int v47 = v9;
    while (1)
    {
      uint64_t result = v46[1];
      uint64_t v48 = *(v46 - 2);
      uint64_t v49 = *(v46 - 1);
      uint64_t v50 = *v46;
      if (v40)
      {
        float v51 = 1.0 - half::_toFloat[result];
        if (v51 == 0.0)
        {
          uint64_t result = 0;
        }
        else
        {
          float v62 = 1.0 - half::_toFloat[result];
          if (half::_eLut[LODWORD(v51) >> 23]) {
            uint64_t result = half::_eLut[LODWORD(v51) >> 23] + (((LODWORD(v62) & 0x7FF000u) + 4096) >> 13);
          }
          else {
            uint64_t result = half::convert((half *)LODWORD(v51));
          }
        }
      }
      float v52 = half::_toFloat[(unsigned __int16)result];
      if (v52 > 0.0)
      {
        float v53 = 1.0 / v52;
        float v54 = 1.0 - (float)(v52 / 1.0);
        float v55 = (float)(half::_toFloat[v48] - (float)(half::_toFloat[v104] * v54)) - v41;
        float v56 = (float)(half::_toFloat[v49] - (float)(v54 * half::_toFloat[v105])) - v41;
        float v57 = (float)(half::_toFloat[v50] - (float)(v54 * half::_toFloat[v107])) - v41;
        if (v55 < 0.0) {
          float v55 = 0.0;
        }
        float v58 = v56 >= 0.0 ? v56 : 0.0;
        float v59 = v57 >= 0.0 ? v57 : 0.0;
        float v60 = v53 * v55;
        if ((float)(v53 * v55) == 0.0)
        {
          LOWORD(v61) = 0;
        }
        else if (half::_eLut[LODWORD(v60) >> 23])
        {
          unsigned int v61 = half::_eLut[LODWORD(v60) >> 23] + (((COERCE_UNSIGNED_INT(v53 * v55) & 0x7FF000) + 4096) >> 13);
        }
        else
        {
          LOWORD(v61) = half::convert((half *)LODWORD(v60));
        }
        float v63 = v53 * v58;
        if ((float)(v53 * v58) == 0.0)
        {
          LOWORD(v64) = 0;
        }
        else if (half::_eLut[LODWORD(v63) >> 23])
        {
          unsigned int v64 = half::_eLut[LODWORD(v63) >> 23] + (((COERCE_UNSIGNED_INT(v53 * v58) & 0x7FF000) + 4096) >> 13);
        }
        else
        {
          LOWORD(v64) = half::convert((half *)LODWORD(v63));
        }
        float v65 = v53 * v59;
        if ((float)(v53 * v59) == 0.0) {
          uint64_t result = 0;
        }
        else {
          uint64_t result = half::_eLut[LODWORD(v65) >> 23]
        }
                 ? half::_eLut[LODWORD(v65) >> 23] + (((COERCE_UNSIGNED_INT(v53 * v59) & 0x7FF000) + 4096) >> 13)
                 : half::convert((half *)LODWORD(v65));
        if (half::_toFloat[(unsigned __int16)v61] > 1.0
          || half::_toFloat[(unsigned __int16)v64] > 1.0
          || half::_toFloat[(unsigned __int16)result] > 1.0)
        {
          break;
        }
      }
      v46 += 4;
      if (!--v47)
      {
        int v44 = 1;
        goto LABEL_83;
      }
    }
    int v44 = 0;
LABEL_83:
    a4 = v92;
    uint64_t v22 = v93;
    a2 = v95;
    uint64_t v18 = v101;
    uint64_t v19 = v102;
  }
  else
  {
    int v44 = 1;
  }
  uint64_t v45 = v100;
  if (v96)
  {
    int v43 = 0;
    int v42 = 1;
  }
  else if (half::_toFloat[v18] == 0.0 && half::_toFloat[v19] == 0.0 && half::_toFloat[v103] == 0.0)
  {
    int v43 = 0;
    int v42 = 0;
  }
  else
  {
    int v106 = v44;
    uint64_t result = (*(uint64_t (**)(void))(**((void **)v99 + 8) + 16))(*((void *)v99 + 8));
    if (v9)
    {
      float v66 = (unsigned __int16 *)(result + 4);
      while (1)
      {
        uint64_t v67 = v66[1];
        uint64_t v68 = *(v66 - 1);
        uint64_t v69 = *v66;
        float v70 = half::_toFloat[*(v66 - 2)] - 0.0;
        if (v70 == 0.0)
        {
          LOWORD(v71) = 0;
        }
        else
        {
          uint64_t result = LODWORD(v70);
          if (half::_eLut[LODWORD(v70) >> 23])
          {
            unsigned int v71 = half::_eLut[LODWORD(v70) >> 23] + (((LODWORD(v70) & 0x7FF000u) + 4096) >> 13);
          }
          else
          {
            uint64_t result = half::convert((half *)LODWORD(v70));
            LOWORD(v71) = result;
          }
        }
        float v72 = half::_toFloat[v68] - 0.0;
        if (v72 == 0.0)
        {
          LOWORD(v73) = 0;
        }
        else
        {
          uint64_t result = LODWORD(v72);
          if (half::_eLut[LODWORD(v72) >> 23])
          {
            unsigned int v73 = half::_eLut[LODWORD(v72) >> 23] + (((LODWORD(v72) & 0x7FF000u) + 4096) >> 13);
          }
          else
          {
            uint64_t result = half::convert((half *)LODWORD(v72));
            LOWORD(v73) = result;
          }
        }
        float v74 = half::_toFloat[v69] - 0.0;
        if (v74 == 0.0)
        {
          LOWORD(v75) = 0;
        }
        else
        {
          uint64_t result = LODWORD(v74);
          if (half::_eLut[LODWORD(v74) >> 23])
          {
            unsigned int v75 = half::_eLut[LODWORD(v74) >> 23] + (((LODWORD(v74) & 0x7FF000u) + 4096) >> 13);
          }
          else
          {
            uint64_t result = half::convert((half *)LODWORD(v74));
            LOWORD(v75) = result;
          }
        }
        float v76 = half::_toFloat[v67];
        if (v76 > 0.0)
        {
          float v77 = 1.0 / v76;
          float v78 = half::_toFloat[(unsigned __int16)v71] * (float)(1.0 / v76);
          if (v78 == 0.0)
          {
            LOWORD(v79) = 0;
          }
          else if (half::_eLut[LODWORD(v78) >> 23])
          {
            unsigned int v79 = half::_eLut[LODWORD(v78) >> 23]
                + (((COERCE_UNSIGNED_INT(half::_toFloat[(unsigned __int16)v71] * v77) & 0x7FF000) + 4096) >> 13);
          }
          else
          {
            LOWORD(v79) = half::convert((half *)LODWORD(v78));
          }
          float v80 = v77 * half::_toFloat[(unsigned __int16)v73];
          if (v80 == 0.0)
          {
            LOWORD(v81) = 0;
          }
          else if (half::_eLut[LODWORD(v80) >> 23])
          {
            unsigned int v81 = half::_eLut[LODWORD(v80) >> 23]
                + (((COERCE_UNSIGNED_INT(v77 * half::_toFloat[(unsigned __int16)v73]) & 0x7FF000) + 4096) >> 13);
          }
          else
          {
            LOWORD(v81) = half::convert((half *)LODWORD(v80));
          }
          float v82 = v77 * half::_toFloat[(unsigned __int16)v75];
          if (v82 == 0.0)
          {
            uint64_t result = 0;
            uint64_t v18 = v101;
            uint64_t v19 = v102;
          }
          else
          {
            float v83 = v77 * half::_toFloat[(unsigned __int16)v75];
            uint64_t v18 = v101;
            uint64_t v19 = v102;
            if (half::_eLut[LODWORD(v82) >> 23]) {
              uint64_t result = half::_eLut[LODWORD(v82) >> 23] + (((LODWORD(v83) & 0x7FF000u) + 4096) >> 13);
            }
            else {
              uint64_t result = half::convert((half *)LODWORD(v82));
            }
          }
          if (half::_toFloat[(unsigned __int16)v79] > 1.0 || half::_toFloat[(unsigned __int16)v81] > 1.0)
          {
            int v43 = 0;
            int v42 = 0;
            a3 = v94;
            a2 = v95;
            goto LABEL_131;
          }
          if (half::_toFloat[(unsigned __int16)result] > 1.0) {
            break;
          }
        }
        v66 += 4;
        if (!--v9)
        {
          int v43 = 0;
          uint64_t v22 = 0;
          uint64_t v45 = 0;
          uint64_t v97 = 0;
          int v42 = 1;
          a3 = v94;
          a2 = v95;
          uint64_t v18 = v101;
          uint64_t v19 = v102;
          goto LABEL_132;
        }
      }
      int v43 = 0;
      int v42 = 0;
      a3 = v94;
      a2 = v95;
      uint64_t v18 = v101;
      uint64_t v19 = v102;
LABEL_131:
      uint64_t v22 = v93;
      uint64_t v45 = v100;
    }
    else
    {
      int v43 = 0;
      uint64_t v22 = 0;
      uint64_t v45 = 0;
      uint64_t v97 = 0;
      int v42 = 1;
    }
LABEL_132:
    int v44 = v106;
  }
LABEL_133:
  if (v98)
  {
    *a2 = 0;
LABEL_137:
    *a3 = 0;
    goto LABEL_145;
  }
  if ((v43 | v44 ^ 1))
  {
    *a2 = 1;
    goto LABEL_137;
  }
  PCColor::PCColor((PCColor *)&v110.var1);
  if (v42)
  {
    float v84 = half::_toFloat[v97];
    float v85 = half::_toFloat[v45];
    float v86 = half::_toFloat[v22];
    PCImage::getColorSpace(v99, (CGColorSpace **)&v110);
    PCColor::setRGB((PCColor *)&v110.var1, v84 / 255.0, v85 / 255.0, v86 / 255.0, &v110);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v110);
    char v87 = 0;
  }
  else
  {
    float v88 = half::_toFloat[v18];
    float v89 = half::_toFloat[v19];
    float v90 = half::_toFloat[v103];
    PCImage::getColorSpace(v99, (CGColorSpace **)&v110);
    PCColor::setRGB((PCColor *)&v110.var1, v88 / 255.0, v89 / 255.0, v90 / 255.0, &v110);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v110);
    char v87 = 1;
  }
  *a3 = v87;
  uint64_t v109 = 0;
  float v108 = 0.0;
  PCColorSpaceCache::rec709Linear((CGColorSpace **)&v110);
  PCColor::getRGB((PCColor *)&v110.var1, (float *)&v109 + 1, (float *)&v109, &v108, (const PCColorSpaceHandle *)&v110);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v110);
  if (*((float *)&v109 + 1) * 0.2126 + *(float *)&v109 * 0.7152 + v108 * 0.0722 >= 0.5) {
    int v91 = 3;
  }
  else {
    int v91 = 2;
  }
  *a2 = v91;
  uint64_t result = (uint64_t)PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v110.var7);
LABEL_145:
  *a4 = v23 ^ 1;
  return result;
}

void sub_1B7E543A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,CGColorSpace *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,CGColorSpace *a35)
{
}

CGColorSpace **PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)16>>>>(uint64_t a1, int *a2, char *a3, unsigned char *a4)
{
  uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  unsigned int v9 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
  if (v9)
  {
    unsigned int v10 = 0;
    int v11 = 0;
    unsigned int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    float v15 = 0.0;
    uint64_t v16 = (float *)(result + 1);
    char v17 = 1;
    float v18 = 0.0;
    float v19 = 0.0;
    float v20 = 0.0;
    float v21 = 0.0;
    float v22 = 0.0;
    int v23 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
    do
    {
      float v25 = *(v16 - 2);
      float v24 = *(v16 - 1);
      float v27 = *v16;
      float v26 = v16[1];
      if (v26 == 0.0)
      {
        if (v10)
        {
          if (v15 != v25 || v18 != v24 || v19 != v27)
          {
            int v11 = 0;
            int v30 = (int)vabds_f32(v25, v15);
            if (v14 <= v30) {
              int v14 = v30;
            }
            int v31 = (int)vabds_f32(v24, v18);
            int v32 = (int)vabds_f32(v27, v19);
            if (v14 <= v31) {
              int v14 = v31;
            }
            if (v14 <= v32) {
              int v14 = v32;
            }
          }
          float v27 = v19;
          float v24 = v18;
          float v25 = v15;
        }
        else
        {
          int v11 = 1;
        }
        ++v10;
        float v19 = v27;
        float v18 = v24;
        float v15 = v25;
      }
      else if (v26 == 1.0)
      {
        if (v12)
        {
          BOOL v33 = v20 == v25;
          if (v21 != v24) {
            BOOL v33 = 0;
          }
          if (v22 != v27) {
            BOOL v33 = 0;
          }
          v13 &= v33;
        }
        else
        {
          int v13 = 1;
          float v22 = *v16;
          float v21 = *(v16 - 1);
          float v20 = *(v16 - 2);
        }
        ++v12;
      }
      v17 &= v26 == *((float *)result + 3);
      v16 += 4;
      --v23;
    }
    while (v23);
  }
  else
  {
    int v14 = 0;
    int v13 = 0;
    unsigned int v12 = 0;
    int v11 = 0;
    unsigned int v10 = 0;
    float v22 = 0.0;
    float v21 = 0.0;
    char v17 = 1;
    float v20 = 0.0;
    float v19 = 0.0;
    float v18 = 0.0;
    float v15 = 0.0;
  }
  BOOL v35 = v10 == v9 || v12 == v9;
  int v36 = (v10 > v9 / 0x64) & v11;
  if (v12 > v9 / 0x64) {
    int v37 = v13 & (v36 ^ 1);
  }
  else {
    int v37 = 0;
  }
  if (!v35 && ((v11 | v13) & 1) == 0 && v14 < 3)
  {
    float v68 = v21;
    float v69 = v22;
    float v38 = 2.0;
    float v18 = 0.0;
    float v19 = 0.0;
    float v15 = 0.0;
LABEL_48:
    char v39 = 1;
    float v40 = v18;
    float v41 = v15;
    float v22 = v19;
    goto LABEL_52;
  }
  if (((v36 | v37) & 1) == 0)
  {
    int v42 = 0;
    char v43 = 1;
    BOOL v44 = 1;
    if (!v35) {
      goto LABEL_75;
    }
    goto LABEL_50;
  }
  float v38 = 0.0;
  float v68 = v21;
  float v69 = v22;
  if (v36) {
    goto LABEL_48;
  }
  char v39 = 0;
  float v40 = v21;
  float v41 = v20;
LABEL_52:
  uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  BOOL v44 = v9 == 0;
  if (v9)
  {
    uint64_t v45 = (float *)(result + 1);
    unsigned int v46 = v9;
    do
    {
      float v47 = v45[1];
      if (v37) {
        float v47 = 1.0 - v47;
      }
      if (v47 > 0.0)
      {
        float v48 = 1.0 / v47;
        float v49 = 1.0 - v47;
        float v50 = (float)(*(v45 - 2) - (float)(v41 * v49)) - v38;
        float v51 = (float)(*(v45 - 1) - (float)(v40 * v49)) - v38;
        float v52 = (float)(*v45 - (float)(v22 * v49)) - v38;
        if (v50 >= 0.0) {
          float v53 = v50;
        }
        else {
          float v53 = 0.0;
        }
        if (v51 < 0.0) {
          float v51 = 0.0;
        }
        if (v52 < 0.0) {
          float v52 = 0.0;
        }
        float v54 = v48 * v51;
        float v55 = v48 * v52;
        BOOL v56 = (float)(v48 * v53) <= 1.0 && v54 <= 1.0;
        if (!v56 || v55 > 1.0) {
          break;
        }
      }
      --v46;
      v45 += 4;
      BOOL v44 = v46 == 0;
    }
    while (v46);
  }
  if (v39)
  {
    char v43 = 0;
    int v42 = 1;
    float v21 = v68;
    float v22 = v69;
    if (!v35) {
      goto LABEL_75;
    }
LABEL_50:
    *a2 = 0;
LABEL_77:
    *a3 = 0;
    goto LABEL_104;
  }
  float v21 = v68;
  float v22 = v69;
  if (v20 == 0.0 && v68 == 0.0 && v69 == 0.0) {
    goto LABEL_81;
  }
  uint64_t result = (CGColorSpace **)(*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  if (v9)
  {
    float v59 = (float *)(result + 1);
    while (1)
    {
      float v60 = v59[1];
      if (v60 > 0.0)
      {
        float v61 = 1.0 / v60;
        float v62 = v61 * *(v59 - 2);
        float v63 = v61 * *(v59 - 1);
        float v64 = v61 * *v59;
        BOOL v65 = v62 <= 1.0 && v63 <= 1.0;
        if (!v65 || v64 > 1.0) {
          break;
        }
      }
      v59 += 4;
      if (!--v9) {
        goto LABEL_97;
      }
    }
LABEL_81:
    char v43 = 0;
    int v42 = 0;
    if (v35) {
      goto LABEL_50;
    }
    goto LABEL_75;
  }
LABEL_97:
  char v43 = 0;
  int v42 = 1;
  float v19 = 0.0;
  float v18 = 0.0;
  float v15 = 0.0;
  if (v35) {
    goto LABEL_50;
  }
LABEL_75:
  if (v43 & 1 | !v44)
  {
    *a2 = 1;
    goto LABEL_77;
  }
  PCColor::PCColor((PCColor *)&v72.var1);
  PCImage::getColorSpace((PCImage *)a1, (CGColorSpace **)&v72);
  if (v42)
  {
    PCColor::setRGB((PCColor *)&v72.var1, v15 / 255.0, v18 / 255.0, v19 / 255.0, &v72);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v72);
    char v58 = 0;
  }
  else
  {
    PCColor::setRGB((PCColor *)&v72.var1, v20 / 255.0, v21 / 255.0, v22 / 255.0, &v72);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v72);
    char v58 = 1;
  }
  *a3 = v58;
  uint64_t v71 = 0;
  float v70 = 0.0;
  PCColorSpaceCache::rec709Linear((CGColorSpace **)&v72);
  PCColor::getRGB((PCColor *)&v72.var1, (float *)&v71 + 1, (float *)&v71, &v70, (const PCColorSpaceHandle *)&v72);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v72);
  if (*((float *)&v71 + 1) * 0.2126 + *(float *)&v71 * 0.7152 + v70 * 0.0722 >= 0.5) {
    int v67 = 3;
  }
  else {
    int v67 = 2;
  }
  *a2 = v67;
  uint64_t result = PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v72.var7);
LABEL_104:
  *a4 = v17 ^ 1;
  return result;
}

void sub_1B7E5495C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  size_t v5 = va_arg(va1, CGColorSpace *);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

float *PCGuessAlphaType<PCBitmap_t<PCPixel4<ProCore::Private::PixelInfoTemplate<(PCPixelFormat::ChannelOrder)17>>>>(uint64_t a1, int *a2, char *a3, unsigned char *a4)
{
  uint64_t result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  unsigned int v9 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
  if (v9)
  {
    unsigned int v10 = 0;
    int v11 = 0;
    unsigned int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    float v15 = 0.0;
    float v16 = *result;
    char v17 = 1;
    float v18 = 0.0;
    float v19 = 0.0;
    float v20 = 0.0;
    float v21 = 0.0;
    float v22 = 0.0;
    int v23 = *(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 28);
    do
    {
      float v24 = *result;
      float v25 = result[1];
      float v27 = result[2];
      float v26 = result[3];
      if (*result == 0.0)
      {
        if (v10)
        {
          if (v15 != v25 || v18 != v27 || v19 != v26)
          {
            int v11 = 0;
            int v30 = (int)vabds_f32(v25, v15);
            if (v14 <= v30) {
              int v14 = v30;
            }
            int v31 = (int)vabds_f32(v27, v18);
            int v32 = (int)vabds_f32(v26, v19);
            if (v14 <= v31) {
              int v14 = v31;
            }
            if (v14 <= v32) {
              int v14 = v32;
            }
          }
          float v26 = v19;
          float v27 = v18;
          float v25 = v15;
        }
        else
        {
          int v11 = 1;
        }
        ++v10;
        float v19 = v26;
        float v18 = v27;
        float v15 = v25;
      }
      else if (v24 == 1.0)
      {
        if (v12)
        {
          BOOL v33 = v20 == v25;
          if (v21 != v27) {
            BOOL v33 = 0;
          }
          if (v22 != v26) {
            BOOL v33 = 0;
          }
          v13 &= v33;
        }
        else
        {
          int v13 = 1;
          float v22 = result[3];
          float v21 = result[2];
          float v20 = result[1];
        }
        ++v12;
      }
      v17 &= v24 == v16;
      result += 4;
      --v23;
    }
    while (v23);
  }
  else
  {
    int v14 = 0;
    int v13 = 0;
    unsigned int v12 = 0;
    int v11 = 0;
    unsigned int v10 = 0;
    float v22 = 0.0;
    float v21 = 0.0;
    char v17 = 1;
    float v20 = 0.0;
    float v19 = 0.0;
    float v18 = 0.0;
    float v15 = 0.0;
  }
  BOOL v35 = v10 == v9 || v12 == v9;
  int v36 = (v10 > v9 / 0x64) & v11;
  if (v12 > v9 / 0x64) {
    int v37 = v13 & (v36 ^ 1);
  }
  else {
    int v37 = 0;
  }
  if (!v35 && ((v11 | v13) & 1) == 0 && v14 < 3)
  {
    float v68 = v21;
    float v69 = v22;
    float v38 = 2.0;
    float v18 = 0.0;
    float v19 = 0.0;
    float v15 = 0.0;
LABEL_48:
    char v39 = 1;
    float v40 = v18;
    float v41 = v15;
    float v22 = v19;
    goto LABEL_52;
  }
  if (((v36 | v37) & 1) == 0)
  {
    int v42 = 0;
    char v43 = 1;
    BOOL v44 = 1;
    if (!v35) {
      goto LABEL_75;
    }
    goto LABEL_50;
  }
  float v38 = 0.0;
  float v68 = v21;
  float v69 = v22;
  if (v36) {
    goto LABEL_48;
  }
  char v39 = 0;
  float v40 = v21;
  float v41 = v20;
LABEL_52:
  uint64_t result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  BOOL v44 = v9 == 0;
  if (v9)
  {
    uint64_t v45 = result + 2;
    unsigned int v46 = v9;
    do
    {
      float v47 = *(v45 - 2);
      if (v37) {
        float v47 = 1.0 - v47;
      }
      if (v47 > 0.0)
      {
        float v48 = 1.0 / v47;
        float v49 = 1.0 - v47;
        float v50 = (float)(*(v45 - 1) - (float)(v41 * v49)) - v38;
        float v51 = (float)(*v45 - (float)(v40 * v49)) - v38;
        float v52 = (float)(v45[1] - (float)(v22 * v49)) - v38;
        if (v50 >= 0.0) {
          float v53 = v50;
        }
        else {
          float v53 = 0.0;
        }
        if (v51 < 0.0) {
          float v51 = 0.0;
        }
        if (v52 < 0.0) {
          float v52 = 0.0;
        }
        float v54 = v48 * v51;
        float v55 = v48 * v52;
        BOOL v56 = (float)(v48 * v53) <= 1.0 && v54 <= 1.0;
        if (!v56 || v55 > 1.0) {
          break;
        }
      }
      --v46;
      v45 += 4;
      BOOL v44 = v46 == 0;
    }
    while (v46);
  }
  if (v39)
  {
    char v43 = 0;
    int v42 = 1;
    float v21 = v68;
    float v22 = v69;
    if (!v35) {
      goto LABEL_75;
    }
LABEL_50:
    *a2 = 0;
LABEL_77:
    *a3 = 0;
    goto LABEL_104;
  }
  float v21 = v68;
  float v22 = v69;
  if (v20 == 0.0 && v68 == 0.0 && v69 == 0.0) {
    goto LABEL_81;
  }
  uint64_t result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 64) + 16))(*(void *)(a1 + 64));
  if (v9)
  {
    float v59 = result + 2;
    while (1)
    {
      float v60 = *(v59 - 2);
      if (v60 > 0.0)
      {
        float v61 = 1.0 / v60;
        float v62 = v61 * *(v59 - 1);
        float v63 = v61 * *v59;
        float v64 = v61 * v59[1];
        BOOL v65 = v62 <= 1.0 && v63 <= 1.0;
        if (!v65 || v64 > 1.0) {
          break;
        }
      }
      v59 += 4;
      if (!--v9) {
        goto LABEL_97;
      }
    }
LABEL_81:
    char v43 = 0;
    int v42 = 0;
    if (v35) {
      goto LABEL_50;
    }
    goto LABEL_75;
  }
LABEL_97:
  char v43 = 0;
  int v42 = 1;
  float v19 = 0.0;
  float v18 = 0.0;
  float v15 = 0.0;
  if (v35) {
    goto LABEL_50;
  }
LABEL_75:
  if (v43 & 1 | !v44)
  {
    *a2 = 1;
    goto LABEL_77;
  }
  PCColor::PCColor((PCColor *)&v72.var1);
  PCImage::getColorSpace((PCImage *)a1, (CGColorSpace **)&v72);
  if (v42)
  {
    PCColor::setRGB((PCColor *)&v72.var1, v15 / 255.0, v18 / 255.0, v19 / 255.0, &v72);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v72);
    char v58 = 0;
  }
  else
  {
    PCColor::setRGB((PCColor *)&v72.var1, v20 / 255.0, v21 / 255.0, v22 / 255.0, &v72);
    PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v72);
    char v58 = 1;
  }
  *a3 = v58;
  uint64_t v71 = 0;
  float v70 = 0.0;
  PCColorSpaceCache::rec709Linear((CGColorSpace **)&v72);
  PCColor::getRGB((PCColor *)&v72.var1, (float *)&v71 + 1, (float *)&v71, &v70, (const PCColorSpaceHandle *)&v72);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v72);
  if (*((float *)&v71 + 1) * 0.2126 + *(float *)&v71 * 0.7152 + v70 * 0.0722 >= 0.5) {
    int v67 = 3;
  }
  else {
    int v67 = 2;
  }
  *a2 = v67;
  uint64_t result = (float *)PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v72.var7);
LABEL_104:
  *a4 = v17 ^ 1;
  return result;
}

void sub_1B7E54F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  size_t v5 = va_arg(va1, CGColorSpace *);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

uint64_t MyCG_AddFrame(const PMFormatDescription *a1, const PCURL *a2, PCBitmap *a3, void *a4)
{
  return 10;
}

uint64_t MyCG_CanRead()
{
  return 0;
}

uint64_t MyCG_CanWrite()
{
  return 0;
}

uint64_t MyCG_SupportsMultipleFrames()
{
  return 0;
}

const char *MyCG_GetName()
{
  return "MyCoreGraphics";
}

uint64_t MyCG_GetComponentType()
{
  return 1246775072;
}

const char *MyCG_GetExtension()
{
  return "jpg";
}

uint64_t MyCG_GetVersion()
{
  return 0x10000;
}

uint64_t MyCG_SupportsVideoOptions()
{
  return 0;
}

uint64_t MyCG_IsStill(void)
{
  return 1;
}

void initMyCoreGraphicsPlugin(PMMediaManager *a1)
{
}

void sub_1B7E5514C(_Unwind_Exception *a1)
{
  MEMORY[0x1BA9BFBA0](v1, 0x80C40B3C365DALL);
  _Unwind_Resume(a1);
}

void PMStillInstance::PMStillInstance(PMStillInstance *this)
{
  *((void *)this + 7) = 0;
  *(void *)this = &unk_1F119B0B8;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 6) = (char *)this + 56;
  *((void *)this + 11) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = (char *)this + 80;
}

void PMStillInstance::~PMStillInstance(PMStillInstance *this)
{
  *(void *)this = &unk_1F119B0B8;
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)this + 72, *((void **)this + 10));
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::__map_value_compare<std::pair<unsigned int,unsigned long long>,std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::less<std::pair<unsigned int,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>>>::destroy((uint64_t)this + 48, *((void **)this + 7));
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

uint64_t PMStillInstance::open(PMStillInstance *this, const __CFURL **a2)
{
  CFURLRef v2 = *a2;
  CFErrorRef error = 0;
  PCURL::getAsFileSystemString(a2, &v7);
  if (!PCString::empty(&v7))
  {
    CFStringRef v3 = CFURLCopyScheme(v2);
    CFStringRef v4 = v3;
    if (v3)
    {
      CFIndex Length = CFStringGetLength(v3);
      CFRelease(v4);
      if (Length)
      {
        if (CFURLResourceIsReachable(v2, &error)) {
          operator new();
        }
        if (error) {
          CFRelease(error);
        }
      }
    }
  }
  PCString::~PCString(&v7);
  return 3;
}

void sub_1B7E553A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, PCString a11)
{
  MEMORY[0x1BA9BFBA0](v11, 0x60C4044C4A2DFLL);
  PCString::~PCString(&a11);
  _Unwind_Resume(a1);
}

BOOL PMStillInstance::isOpen(PMStillInstance *this)
{
  uint64_t v1 = (const __CFURL **)*((void *)this + 1);
  if (!v1) {
    return 0;
  }
  CFURLRef v2 = *v1;
  CFErrorRef error = 0;
  int IsReachable = CFURLResourceIsReachable(v2, &error);
  BOOL v4 = IsReachable != 0;
  if (!IsReachable) {
    CFRelease(error);
  }
  return v4;
}

void PMStillInstance::close(PMStillInstance *this)
{
  if (*((void *)this + 1))
  {
    CFURLRef v2 = (std::__shared_weak_count *)*((void *)this + 2);
    *((void *)this + 1) = 0;
    *((void *)this + 2) = 0;
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    CFStringRef v3 = (void *)*((void *)this + 9);
    BOOL v4 = (char *)this + 80;
    if (v3 != (void *)((char *)this + 80))
    {
      do
      {
        PMRemoveBitmapFromCache((const PCHash128 *)((char *)v3 + 28));
        size_t v5 = (char *)v3[1];
        if (v5)
        {
          do
          {
            uint64_t v6 = v5;
            size_t v5 = *(char **)v5;
          }
          while (v5);
        }
        else
        {
          do
          {
            uint64_t v6 = (char *)v3[2];
            BOOL v7 = *(void *)v6 == (void)v3;
            CFStringRef v3 = v6;
          }
          while (!v7);
        }
        CFStringRef v3 = v6;
      }
      while (v6 != v4);
    }
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)this + 72, *((void **)this + 10));
    uint64_t v8 = (void *)*((void *)this + 7);
    *((void *)this + 9) = v4;
    *((void *)this + 10) = 0;
    *((void *)this + 11) = 0;
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::__map_value_compare<std::pair<unsigned int,unsigned long long>,std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::less<std::pair<unsigned int,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>>>::destroy((uint64_t)this + 48, v8);
    *((void *)this + 6) = (char *)this + 56;
    *((void *)this + 7) = 0;
    *((void *)this + 8) = 0;
  }
  if (*((void *)this + 3))
  {
    uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 4);
    *((void *)this + 3) = 0;
    *((void *)this + 4) = 0;
    if (v9)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
}

uint64_t PMStillInstance::computeRawBitmapCacheKey(const void **this, int8x8_t *a2, const PMFormatDescription *a3, const PMFrameRequest *a4)
{
  PCHashWriteStream::writeValue(a2, this[3]);
  (*(void (**)(int8x8_t *, void))(*(void *)a2 + 56))(a2, *((unsigned int *)a4 + 23));
  BOOL v7 = this[5];
  uint64_t v8 = *(uint64_t (**)(int8x8_t *, const void *))(*(void *)a2 + 64);

  return v8(a2, v7);
}

void PMStillInstance::getCacheKey(PMStillInstance *this, const PMFormatDescription *a2, const PMFrameRequest *a3, const FxColorDescription *a4)
{
  MEMORY[0x1F4188790](this);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  int v13 = v12;
  v14[520] = *(int8x8_t *)MEMORY[0x1E4F143B8];
  PCHashWriteStream::PCHashWriteStream((PCHashWriteStream *)v14);
  (*(void (**)(uint64_t, int8x8_t *, uint64_t, uint64_t, uint64_t))(*(void *)v11 + 40))(v11, v14, v9, v7, v5);
  *int v13 = *(_OWORD *)PCHashWriteStream::getHash(v14)->i8;
  PCHashWriteStream::~PCHashWriteStream((PCHashWriteStream *)v14);
}

void sub_1B7E556D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

void PMStillInstance::getRawBitmapCacheKey(PMStillInstance *this, const PMFormatDescription *a2, const PMFrameRequest *a3)
{
  MEMORY[0x1F4188790](this);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v11[520] = *(int8x8_t *)MEMORY[0x1E4F143B8];
  PCHashWriteStream::PCHashWriteStream((PCHashWriteStream *)v11);
  (*(void (**)(uint64_t, int8x8_t *, uint64_t, uint64_t))(*(void *)v8 + 48))(v8, v11, v6, v4);
  *uint64_t v10 = *(_OWORD *)PCHashWriteStream::getHash(v11)->i8;
  PCHashWriteStream::~PCHashWriteStream((PCHashWriteStream *)v11);
}

void sub_1B7E557D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

void PMStillInstance::getRawBitmap(uint64_t **this@<X0>, const PMFormatDescription *a2@<X1>, const PMFrameRequest *a3@<X2>, void *a4@<X8>)
{
  PMStillInstance::getRawBitmapCacheKey((PMStillInstance *)this, a2, a3);
  PMGetCachedBitmap((const PCHash128 *)_40, a4);
  if (!*a4)
  {
    PCTimer::PCTimer((PCTimer *)v13);
    PCTimer::start((PCTimer *)v13);
    ((void (*)(long long *__return_ptr, uint64_t **, const PMFrameRequest *))(*this)[9])(&v12, this, a3);
    long long v7 = v12;
    long long v12 = 0uLL;
    uint64_t v8 = (std::__shared_weak_count *)a4[1];
    *(_OWORD *)a4 = v7;
    if (v8)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      if (*((void *)&v12 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
      }
    }
    PCTimer::stop((PCTimer *)v13);
    if (*a4)
    {
      double Seconds = PCTimer::getSeconds((PCTimer *)v13);
      PMCacheBitmap((PCHash128 *)_40, a4, &v11, Seconds);
      ProCore_Impl::PCNSRefImpl::release(&v11);
      std::__tree<PCHash128>::__emplace_unique_key_args<PCHash128,PCHash128 const&>(this + 9, (const PCHash128 *)_40, _40);
    }
    OZChannelBase::setRangeName((OZChannelBase *)v13, v9);
  }
}

void sub_1B7E558F0(_Unwind_Exception *a1, const PCString *a2, uint64_t a3, uint64_t a4, OZChannelBase *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  OZChannelBase::setRangeName((OZChannelBase *)&a13, a2);
  float v15 = *(std::__shared_weak_count **)(v13 + 8);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  _Unwind_Resume(a1);
}

CGColorSpace **PMStillInstance::getColorConformDescriptions(PMStillInstance *this, const PMFrameRequest *a2, FxColorDescription *a3, FxColorDescription *a4, FxColorDescription *a5)
{
  (*(void (**)(FxColorDescription *__return_ptr))(*(void *)this + 64))(&v30);
  OverrideColorSpace = (CGColorSpace *)PMFrameRequest::getOverrideColorSpace(a2);
  CGColorSpace = OverrideColorSpace;
  if (OverrideColorSpace)
  {
    int DynamicRange = PCIsHDRColorSpace(OverrideColorSpace);
  }
  else
  {
    CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v30);
    int DynamicRange = FxColorDescription::getDynamicRange(&v30);
  }
  int v12 = DynamicRange;
  PMFrameRequest::getColorDescriptionOverrideToneMapMethod(a2, a3);
  uint64_t v29 = v13;
  char isPremultiplied = FxColorDescription::isPremultiplied(&v30);
  FxColorDescription::FxColorDescription((uint64_t)&v25, CGColorSpace, v12, &v29, isPremultiplied);
  obj = a4->_pcColorDesc._colorSpaceRef._obj;
  float v16 = v25;
  if (a4->_pcColorDesc._colorSpaceRef._obj && obj != v25)
  {
    PCCFRefTraits<CGColorSpace *>::release(obj);
    float v16 = v25;
  }
  a4->_pcColorDesc._colorSpaceRef._obj = v16;
  float v25 = 0;
  a4->_pcColorDesc._dynamicRange = v26;
  a4->_pcColorDesc._toneMapMethod = v27;
  a4->_char isPremultiplied = v28;
  PCCFRef<CGColorSpace *>::~PCCFRef(&v25);
  uint64_t v17 = FxColorDescription::getCGColorSpace(a3);
  if (v17) {
    float v18 = (CGColorSpace *)v17;
  }
  else {
    float v18 = CGColorSpace;
  }
  if (PMFrameRequest::isDynamicRangeTrackingRender(a2)) {
    ToneMapMethod = (uint64_t *)FxColorDescription::getToneMapMethod(a3);
  }
  else {
    ToneMapMethod = &kPCNoToneMapMethod;
  }
  uint64_t v24 = *ToneMapMethod;
  int v20 = FxColorDescription::getDynamicRange(a3);
  FxColorDescription::FxColorDescription((uint64_t)&v25, v18, v20, &v24, 1);
  float v21 = a5->_pcColorDesc._colorSpaceRef._obj;
  float v22 = v25;
  if (a5->_pcColorDesc._colorSpaceRef._obj && v21 != v25)
  {
    PCCFRefTraits<CGColorSpace *>::release(v21);
    float v22 = v25;
  }
  a5->_pcColorDesc._colorSpaceRef._obj = v22;
  float v25 = 0;
  a5->_pcColorDesc._dynamicRange = v26;
  a5->_pcColorDesc._toneMapMethod = v27;
  a5->_char isPremultiplied = v28;
  PCCFRef<CGColorSpace *>::~PCCFRef(&v25);
  return PCCFRef<CGColorSpace *>::~PCCFRef(&v30._pcColorDesc._colorSpaceRef._obj);
}

void sub_1B7E55AD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, CGColorSpace *);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  _Unwind_Resume(a1);
}

double PMStillInstance::getEffectiveResolutionModeScale(PMStillInstance *this, const PMFrameRequest *a2)
{
  return PMFrameRequest::getResolutionModeScale(a2);
}

uint64_t PMStillInstance::wantsColorClamping(PMStillInstance *this)
{
  return 0;
}

uint64_t PMStillInstance::getCachedBitmap@<X0>(uint64_t **this@<X0>, const PMFormatDescription *a2@<X1>, const PMFrameRequest *a3@<X2>, const PCHash128 *a4@<X4>, void *a5@<X8>)
{
  *a5 = 0;
  a5[1] = 0;
  PCTimer::PCTimer((PCTimer *)_30);
  PCTimer::start((PCTimer *)_30);
  PMStillInstance::getRawBitmap(this, a2, a3, &v16);
  uint64_t v14 = v16;
  *(_OWORD *)a5 = v16;
  PCTimer::stop((PCTimer *)_30);
  if (v14)
  {
    double Seconds = PCTimer::getSeconds((PCTimer *)_30);
    PMCacheBitmap(a4, a5, &v15, Seconds);
    ProCore_Impl::PCNSRefImpl::release(&v15);
  }
  return OZChannelBase::setRangeName((OZChannelBase *)_30, v11);
}

void sub_1B7E55BE0(_Unwind_Exception *a1, const PCString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, OZChannelBase *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  OZChannelBase::setRangeName((OZChannelBase *)&a15, a2);
  uint64_t v17 = *(std::__shared_weak_count **)(v15 + 8);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  _Unwind_Resume(a1);
}

double PMStillInstance::computePixelTransform(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  *(void *)(a6 + 120) = 0x3FF0000000000000;
  *(void *)(a6 + 80) = 0x3FF0000000000000;
  *(void *)(a6 + 40) = 0x3FF0000000000000;
  *(void *)a6 = 0x3FF0000000000000;
  *(_OWORD *)(a6 + 8) = 0u;
  *(_OWORD *)(a6 + 24) = 0u;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  double v10 = (double)a4;
  double v11 = (double)a5;
  float64x2_t v12 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)a6, (double)(a4 - 2) / (double)a4, (double)(a5 - 2) / (double)a5, 1.0);
  double v13 = (*(double (**)(uint64_t, uint64_t, float64x2_t))(*(void *)a1 + 80))(a1, a3, v12);
  float64x2_t v14 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)a6, v13 / *(double *)(a2 + 416), -v13, 1.0);

  v14.f64[0] = v10 * 0.5;
  *(void *)&double result = *(_OWORD *)&PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)a6, v14, v11 * 0.5, 0.0);
  return result;
}

uint64_t PMStillInstance::getBitmapNode(uint64_t a1, uint64_t a2, uint64_t a3, PCBitmap **a4, uint64_t *a5, uint64_t a6)
{
  PMBitmapToHeliumNode(a4, &v17);
  uint64_t v12 = *a5;
  uint64_t v13 = v17;
  if (*a5 == v17)
  {
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 24))(v12);
    }
  }
  else
  {
    if (v12)
    {
      (*(void (**)(uint64_t))(*(void *)v12 + 24))(v12);
      uint64_t v13 = v17;
    }
    *a5 = v13;
  }
  uint64_t v14 = (*(uint64_t (**)(void))(*(void *)*a4 + 16))();
  uint64_t v15 = (*(uint64_t (**)(void))(*(void *)*a4 + 24))();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 56))(a1, a2, a3, v14, v15, a6);
  return 0;
}

void sub_1B7E55E5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 24))(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t PMStillInstance::getFrameCPU(uint64_t **a1, const PMFormatDescription *a2, const PMFrameRequest *a3, uint64_t a4, const PCHash128 *a5, uint64_t *a6, uint64_t a7)
{
  PMStillInstance::getCachedBitmap(a1, a2, a3, a5, &v16);
  if (v16)
  {
    PMStillInstance::getBitmapNode((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &v16, a6, a7);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v13 = (HGNode *)HGObject::operator new(0x1A0uLL);
    HGNode::HGNode(v13);
    uint64_t v14 = *a6;
    if ((HGNode *)*a6 == v13)
    {
      if (v13) {
        (*(void (**)(HGNode *))(*(void *)v13 + 24))(v13);
      }
    }
    else
    {
      if (v14) {
        (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
      }
      *a6 = (uint64_t)v13;
    }
    *(void *)(a7 + 120) = 0x3FF0000000000000;
    *(void *)(a7 + 80) = 0x3FF0000000000000;
    *(void *)(a7 + 40) = 0x3FF0000000000000;
    *(void *)a7 = 0x3FF0000000000000;
    *(_OWORD *)(a7 + 8) = 0u;
    *(_OWORD *)(a7 + 24) = 0u;
    *(_OWORD *)(a7 + 48) = 0u;
    *(_OWORD *)(a7 + 64) = 0u;
    *(_OWORD *)(a7 + 88) = 0u;
    uint64_t v12 = 10;
    *(_OWORD *)(a7 + 104) = 0u;
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  return v12;
}

void sub_1B7E55FD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 24))(v10);
  }
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t PMStillInstance::getFramePixelBuffer(PMStillInstance *a1, uint64_t a2, const PMFrameRequest *a3, FxColorDescription *a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  PCColorDescription::PCColorDescription(&v36);
  char v37 = 1;
  uint64_t v13 = (__CVBuffer *)(*(uint64_t (**)(PMStillInstance *, const PMFrameRequest *, PCColorDescription *))(*(void *)a1 + 96))(a1, a3, &v36);
  uint64_t v14 = (HGCVPixelBuffer *)v13;
  if (!v13)
  {
    uint64_t v23 = 10;
    goto LABEL_26;
  }
  PixelFormatCFStringRef Type = (HGCV *)CVPixelBufferGetPixelFormatType(v13);
  int v17 = HGCV::HGFormatForCVPixelFormat(PixelFormatType, 0, v16);
  HGCVBitmap::create(v14, v17, 0, &v35);
  float v18 = v35;
  float v19 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v19, v18);
  *((_DWORD *)v19 + 109) = 1;
  uint64_t v20 = *a6;
  if ((HGBitmapLoader *)*a6 != v19)
  {
    if (v20) {
      (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
    }
    *a6 = (uint64_t)v19;
    (*(void (**)(HGBitmapLoader *))(*(void *)v19 + 16))(v19);
  }
  PCColorDescription::PCColorDescription(&v34._pcColorDesc);
  v34._char isPremultiplied = 1;
  PCColorDescription::PCColorDescription(&v33._pcColorDesc);
  v33._char isPremultiplied = 1;
  PMStillInstance::getColorConformDescriptions(a1, a3, a4, &v34, &v33);
  FxApplyColorConform(a6, &v34, &v33, &v32);
  uint64_t v21 = *a6;
  uint64_t v22 = v32;
  if (*a6 == v32)
  {
    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
    }
  }
  else
  {
    if (v21)
    {
      (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
      uint64_t v22 = v32;
    }
    *a6 = v22;
  }
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)v14);
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)v14);
  (*(void (**)(PMStillInstance *, uint64_t, const PMFrameRequest *, size_t, size_t, uint64_t))(*(void *)a1 + 56))(a1, a2, a3, Width, Height, a7);
  if (PMFrameRequest::isRenderForHDR_Deprecated(a3))
  {
    int StillImageInverseToneMapOperator_Deprecated = PMFrameRequest::getStillImageInverseToneMapOperator_Deprecated(a3);
    if (StillImageInverseToneMapOperator_Deprecated == 1)
    {
      CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v33);
      FxApplySDRToHDR((uint64_t)a6, CGColorSpace, 0, &v32);
      uint64_t v28 = *a6;
      uint64_t v29 = v32;
      if (*a6 != v32)
      {
        if (v28)
        {
LABEL_21:
          (*(void (**)(uint64_t))(*(void *)v28 + 24))(v28);
          uint64_t v29 = v32;
        }
LABEL_22:
        *a6 = v29;
        goto LABEL_23;
      }
      if (!v28) {
        goto LABEL_23;
      }
LABEL_28:
      (*(void (**)(uint64_t))(*(void *)v28 + 24))(v28);
      goto LABEL_23;
    }
    if (StillImageInverseToneMapOperator_Deprecated == 2)
    {
      PCToneMapMethod v27 = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v33);
      FxApplySDRToHDR((uint64_t)a6, v27, 1, &v32);
      uint64_t v28 = *a6;
      uint64_t v29 = v32;
      if (*a6 != v32)
      {
        if (v28) {
          goto LABEL_21;
        }
        goto LABEL_22;
      }
      if (!v28) {
        goto LABEL_23;
      }
      goto LABEL_28;
    }
  }
LABEL_23:
  PCCFRef<CGColorSpace *>::~PCCFRef(&v33._pcColorDesc._colorSpaceRef._obj);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v34._pcColorDesc._colorSpaceRef._obj);
  (*(void (**)(HGBitmapLoader *))(*(void *)v19 + 24))(v19);
  if (v35) {
    (*(void (**)(HGBitmap *))(*(void *)v35 + 24))(v35);
  }
  uint64_t v23 = 0;
LABEL_26:
  PCCFRef<CGColorSpace *>::~PCCFRef(&v36._colorSpaceRef._obj);
  return v23;
}

void sub_1B7E56434(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, CGColorSpace *);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v9 = va_arg(va2, CGColorSpace *);
  uint64_t v11 = va_arg(va2, void);
  uint64_t v12 = va_arg(va2, void);
  uint64_t v13 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 24))(a2);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va1);
  (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)va2);
  _Unwind_Resume(a1);
}

uint64_t PMStillInstance::getFrame(PMStillInstance *a1, const PMFormatDescription *a2, CFTypeRef *a3, uint64_t a4, FxColorDescription *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v14 = (CFTypeRef *)*((void *)a1 + 1);
  if (v14 && CFEqual(*v14, *a3))
  {
    if (((*(uint64_t (**)(PMStillInstance *))(*(void *)a1 + 32))(a1) & 1) == 0)
    {
      uint64_t v15 = (HGNode *)HGObject::operator new(0x1A0uLL);
      HGNode::HGNode(v15);
      uint64_t v16 = *a6;
      if ((HGNode *)*a6 == v15)
      {
        if (v15) {
          (*(void (**)(HGNode *))(*(void *)v15 + 24))(v15);
        }
      }
      else
      {
        if (v16) {
          (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
        }
        *a6 = (uint64_t)v15;
      }
      *(void *)(a7 + 120) = 0x3FF0000000000000;
      *(void *)(a7 + 80) = 0x3FF0000000000000;
      *(void *)(a7 + 40) = 0x3FF0000000000000;
      *(void *)a7 = 0x3FF0000000000000;
      long long v29 = 0uLL;
      *(_OWORD *)(a7 + 8) = 0u;
      *(_OWORD *)(a7 + 24) = 0u;
      *(_OWORD *)(a7 + 48) = 0u;
      *(_OWORD *)(a7 + 64) = 0u;
      *(_OWORD *)(a7 + 88) = 0u;
      uint64_t FramePixelBuffer = 10;
LABEL_36:
      *(_OWORD *)(a7 + 104) = v29;
      return FramePixelBuffer;
    }
  }
  else
  {
    (*(void (**)(PMStillInstance *))(*(void *)a1 + 24))(a1);
    uint64_t v17 = (*(uint64_t (**)(PMStillInstance *, CFTypeRef *))(*(void *)a1 + 16))(a1, a3);
    if (v17)
    {
      uint64_t FramePixelBuffer = v17;
      float v19 = (HGNode *)HGObject::operator new(0x1A0uLL);
      HGNode::HGNode(v19);
      uint64_t v20 = *a6;
      if ((HGNode *)*a6 == v19)
      {
        if (v19) {
          (*(void (**)(HGNode *))(*(void *)v19 + 24))(v19);
        }
      }
      else
      {
        if (v20) {
          (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
        }
        *a6 = (uint64_t)v19;
      }
      *(void *)(a7 + 120) = 0x3FF0000000000000;
      *(void *)(a7 + 80) = 0x3FF0000000000000;
      *(void *)(a7 + 40) = 0x3FF0000000000000;
      *(void *)a7 = 0x3FF0000000000000;
      long long v29 = 0uLL;
      *(_OWORD *)(a7 + 8) = 0u;
      *(_OWORD *)(a7 + 24) = 0u;
      *(_OWORD *)(a7 + 48) = 0u;
      *(_OWORD *)(a7 + 64) = 0u;
      *(_OWORD *)(a7 + 88) = 0u;
      goto LABEL_36;
    }
  }
  PMStillInstance::getCacheKey(a1, a2, (const PMFrameRequest *)a4, a5);
  CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(a5);
  (*(void (**)(FxColorDescription *__return_ptr, PMStillInstance *))(*(void *)a1 + 64))(&lpsrc, a1);
  uint64_t v22 = FxColorDescription::getCGColorSpace(&lpsrc);
  PCCFRef<CGColorSpace *>::~PCCFRef(&lpsrc._pcColorDesc._colorSpaceRef._obj);
  if (!CGColorSpace)
  {
    uint64_t OverrideColorSpace = PMFrameRequest::getOverrideColorSpace((PMFrameRequest *)a4);
    if (OverrideColorSpace) {
      CGColorSpace = (CGColorSpace *)OverrideColorSpace;
    }
    else {
      CGColorSpace = (CGColorSpace *)v22;
    }
  }
  FxColorDescription::setCGColorSpace(a5, CGColorSpace);
  float v25 = *(const void **)(a4 + 152);
  if (!v25) {
    return PMStillInstance::getFrameCPU((uint64_t **)a1, a2, (const PMFrameRequest *)a4, v24, (const PCHash128 *)v32, a6, a7);
  }
  if (*(unsigned char *)(a4 + 145) || !v26) {
    return PMStillInstance::getFrameCPU((uint64_t **)a1, a2, (const PMFrameRequest *)a4, v24, (const PCHash128 *)v32, a6, a7);
  }
  FxDeviceGetComputeDeviceForRenderer(v26, &lpsrc);
  if (lpsrc._pcColorDesc._colorSpaceRef._obj
  {
    uint64_t v28 = *(std::__shared_weak_count **)&lpsrc._pcColorDesc._dynamicRange;
    if (*(void *)&lpsrc._pcColorDesc._dynamicRange) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&lpsrc._pcColorDesc._dynamicRange + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v28 = 0;
  }
  if (*(void *)&lpsrc._pcColorDesc._dynamicRange) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&lpsrc._pcColorDesc._dynamicRange);
  }
  uint64_t FramePixelBuffer = PMStillInstance::getFramePixelBuffer(a1, (uint64_t)a2, (const PMFrameRequest *)a4, a5, v27, a6, a7);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  return FramePixelBuffer;
}

void sub_1B7E569B0(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::__map_value_compare<std::pair<unsigned int,unsigned long long>,std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::less<std::pair<unsigned int,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::__map_value_compare<std::pair<unsigned int,unsigned long long>,std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::less<std::pair<unsigned int,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::__map_value_compare<std::pair<unsigned int,unsigned long long>,std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>,std::less<std::pair<unsigned int,unsigned long long>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned long long>,std::pair<PCHash128,HGRef<HGMetalTexture>>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::pair<unsigned int,unsigned long long> const,std::pair<PCHash128,HGRef<HGMetalTexture>>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t std::__destroy_at[abi:ne180100]<std::pair<std::pair<unsigned int,unsigned long long> const,std::pair<PCHash128,HGRef<HGMetalTexture>>>,0>(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
  }
  return result;
}

void std::shared_ptr<PCURL>::shared_ptr[abi:ne180100]<PCURL,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B7E56B74(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<PCURL>::reset[abi:ne180100]((PCURL **)va, 0);
  _Unwind_Resume(a1);
}

PCURL *std::__shared_ptr_pointer<PCURL *,std::shared_ptr<PCURL>::__shared_ptr_default_delete<PCURL,PCURL>,std::allocator<PCURL>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(PCURL **)(a1 + 24);
  if (result)
  {
    PCURL::~PCURL(result);
    JUMPOUT(0x1BA9BFBA0);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<PCURL *,std::shared_ptr<PCURL>::__shared_ptr_default_delete<PCURL,PCURL>,std::allocator<PCURL>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::shared_ptr<PCString>::shared_ptr[abi:ne180100]<PCString,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B7E56C8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<PCString>::reset[abi:ne180100]((PCString **)va, 0);
  _Unwind_Resume(a1);
}

PCString *std::__shared_ptr_pointer<PCString *,std::shared_ptr<PCString>::__shared_ptr_default_delete<PCString,PCString>,std::allocator<PCString>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(PCString **)(a1 + 24);
  if (result)
  {
    PCString::~PCString(result);
    JUMPOUT(0x1BA9BFBA0);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<PCString *,std::shared_ptr<PCString>::__shared_ptr_default_delete<PCString,PCString>,std::allocator<PCString>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

PCString *std::unique_ptr<PCString>::reset[abi:ne180100](PCString **a1, PCString *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    PCString::~PCString(result);
    JUMPOUT(0x1BA9BFBA0);
  }
  return result;
}

void PMPluginInterface::PMPluginInterface(PMPluginInterface *this)
{
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
}

void PMCacheBitmap(PCHash128 *a1@<X0>, void *a2@<X1>, void *a3@<X8>, double a4@<D0>)
{
  if (*a2)
  {
    int v8 = (*(uint64_t (**)(void))(*(void *)*a2 + 40))(*a2);
    PCHash128::getString(a1, &v11);
    uint64_t v9 = PCString::ns_str(&v11);
    PCString::~PCString(&v11);
    v11.var0 = (__CFString *)[[PMCachedBitmapObject alloc] initWithBitmap:a2];
    uint64_t v10 = +[PMObjectCache sharedInstance];
    [(PMObjectCache *)v10 addObject:v11.var0 cacheKey:v9 size:(v8 + 88) cost:a4];
    *a3 = 0;
    ProCore_Impl::PCNSRefImpl::release((id *)&v11.var0);
  }
  else
  {
    *a3 = 0;
  }
}

void sub_1B7E56FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCString a10)
{
}

uint64_t PMRemoveBitmapFromCache(const PCHash128 *a1)
{
  PCHash128::getString(a1, &v3);
  uint64_t v1 = PCString::ns_str(&v3);
  PCString::~PCString(&v3);
  return [+[PMObjectCache sharedInstance] removeObjectForKey:v1];
}

void sub_1B7E5703C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCString a10)
{
}

void PMGetCachedBitmap(const PCHash128 *a1@<X0>, void *a2@<X8>)
{
  PCHash128::getString(a1, &v5);
  PCString v3 = PCString::ns_str(&v5);
  PCString::~PCString(&v5);
  uint64_t v4 = [+[PMObjectCache sharedInstance] copyObjectForKey:v3 cost:0];
  v5.var0 = v4;
  if (v4)
  {
    [(__CFString *)v4 bitmap];
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  ProCore_Impl::PCNSRefImpl::release((id *)&v5.var0);
}

void sub_1B7E570CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, PCString a10)
{
}

HGNode *PVHGApplyAuxiliaryMap::GetOutput(HGNode *this, HGRenderer *a2)
{
  Input = HGRenderer::GetInput(a2, this, 0);
  PCString v5 = HGRenderer::GetInput(a2, this, 1u);
  unint64_t v6 = *((void *)this + 55);
  if (v6 <= 0xFFF)
  {
    if (v6)
    {
      unint64_t v7 = *((void *)this + 56);
      if (v7 - 4096 >= 0xFFFFFFFFFFFFF001)
      {
        int v8 = v5;
        unint64_t v9 = *((void *)this + 53);
        unint64_t v10 = *((void *)this + 54);
        PCString v11 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v11);
        HGTransform::HGTransform((HGTransform *)v15);
        HGTransform::Scale((HGTransform *)v15, (float)((float)v9 / (float)v6), (float)((float)v10 / (float)v7), 1.0);
        (*(void (**)(HGXForm *, void, HGNode *))(*(void *)v11 + 120))(v11, 0, v8);
        (*(void (**)(HGXForm *, unsigned char *))(*(void *)v11 + 576))(v11, v15);
        uint64_t v12 = (HgcApplyAuxiliaryMap *)HGObject::operator new(0x1A0uLL);
        HgcApplyAuxiliaryMap::HgcApplyAuxiliaryMap(v12);
        (*(void (**)(HgcApplyAuxiliaryMap *, void, HGNode *))(*(void *)v12 + 120))(v12, 0, Input);
        (*(void (**)(HgcApplyAuxiliaryMap *, uint64_t, HGXForm *))(*(void *)v12 + 120))(v12, 1, v11);
        (*(void (**)(HgcApplyAuxiliaryMap *, void, float, double, double, double))(*(void *)v12 + 96))(v12, 0, *((float *)this + 104), 0.0, 0.0, 0.0);
        uint64_t v13 = (HgcApplyAuxiliaryMap *)*((void *)this + 51);
        Input = (HGNode *)v12;
        if (v13 != v12)
        {
          if (v13) {
            (*(void (**)(HgcApplyAuxiliaryMap *))(*(void *)v13 + 24))(v13);
          }
          *((void *)this + 51) = v12;
          (*(void (**)(HgcApplyAuxiliaryMap *))(*(void *)v12 + 16))(v12);
          Input = (HGNode *)*((void *)this + 51);
        }
        (*(void (**)(HgcApplyAuxiliaryMap *))(*(void *)v12 + 24))(v12);
        HGTransform::~HGTransform((HGTransform *)v15);
        (*(void (**)(HGXForm *))(*(void *)v11 + 24))(v11);
      }
    }
  }
  return Input;
}

void sub_1B7E57B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  HGObject::operator delete(v10);
  HGTransform::~HGTransform((HGTransform *)&a9);
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
  _Unwind_Resume(a1);
}

uint64_t PVHGApplyAuxiliaryMap::SetParameter(PVHGApplyAuxiliaryMap *this, int a2, float a3, float a4, float a5, float a6)
{
  if (a2 == 2)
  {
    if ((float)*((unint64_t *)this + 55) != a3 || (float)*((unint64_t *)this + 56) != a4)
    {
      *((void *)this + 55) = (unint64_t)a3;
      *((void *)this + 56) = (unint64_t)a4;
      return 1;
    }
  }
  else if (a2 == 1)
  {
    if ((float)*((unint64_t *)this + 53) != a3 || (float)*((unint64_t *)this + 54) != a4)
    {
      *((void *)this + 53) = (unint64_t)a3;
      *((void *)this + 54) = (unint64_t)a4;
      return 1;
    }
  }
  else
  {
    if (a2) {
      return 0xFFFFFFFFLL;
    }
    if (*((float *)this + 104) != a3)
    {
      *((float *)this + 104) = a3;
      return 1;
    }
  }
  return 0;
}

void PVHGApplyAuxiliaryMap::~PVHGApplyAuxiliaryMap(HGNode *this)
{
  PVHGApplyAuxiliaryMap::~PVHGApplyAuxiliaryMap(this);

  HGObject::operator delete(v1);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_1F119B230;
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }

  HGNode::~HGNode(this);
}

void HGColorCorrect::HGColorCorrect(HGColorCorrect *this)
{
  HGNode::HGNode((HGNode *)this);
  *uint64_t v2 = &unk_1F119B498;
  v2[51] = 0;
  PCString v3 = (HgcColorCorrect *)HGObject::operator new(0x200uLL);
  HgcColorCorrect::HgcColorCorrect(v3);
  uint64_t v4 = (HgcColorCorrect *)*((void *)this + 51);
  if (v4 == v3)
  {
    if (v3) {
      (*(void (**)(HgcColorCorrect *))(*(void *)v3 + 24))(v3);
    }
  }
  else
  {
    if (v4) {
      (*(void (**)(HgcColorCorrect *))(*(void *)v4 + 24))(v4);
    }
    *((void *)this + 51) = v3;
  }
}

void sub_1B7E57DC0(_Unwind_Exception *a1)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  uint64_t v4 = *(void *)(v1 + 408);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
  }
  HGNode::~HGNode((HGNode *)v1);
  _Unwind_Resume(a1);
}

void HGColorCorrect::~HGColorCorrect(HGNode *this)
{
  *(void *)this = &unk_1F119B498;
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }

  HGNode::~HGNode(this);
}

{
  void *v1;
  uint64_t vars8;

  HGColorCorrect::~HGColorCorrect(this);

  HGObject::operator delete(v1);
}

uint64_t HGColorCorrect::SetParameter(HGColorCorrect *this, float a2, float a3, float a4, float a5)
{
  return (*(uint64_t (**)(float, float, float, float))(**((void **)this + 51) + 96))(a2, a3, a4, a5);
}

uint64_t HGColorCorrect::GetOutput(HGNode *this, HGRenderer *a2)
{
  uint64_t v3 = *((void *)this + 51);
  Input = HGRenderer::GetInput(a2, this, 0);
  (*(void (**)(uint64_t, void, HGNode *))(*(void *)v3 + 120))(v3, 0, Input);
  return *((void *)this + 51);
}

const char *HgcApplyAuxiliaryMap::GetProgram(HgcApplyAuxiliaryMap *this, HGRenderer *a2)
{
  unsigned int Target = HGRenderer::GetTarget(a2, 393216);
  if (Target == 396048)
  {
    if ((*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 20) == 27) {
      return "//Metal1.0     \n"
    }
             "//LEN=00000003a0\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< half > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]], \n"
             "    texture2d< half > hg_Texture1 [[ texture(1) ]], \n"
             "    sampler hg_Sampler1 [[ sampler(1) ]])\n"
             "{\n"
             "    const half4 c0 = half4(1.000000000, 0.000000000, 0.000000000, 0.000000000);\n"
             "    half4 r0, r1;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0.xyz = (half3) hg_Texture1.sample(hg_Sampler1, frag._texCoord1.xy).xyz;\n"
             "    r0.xyz = mix(c0.xxx, half3(hg_Params[0].xyz), r0.xyz);\n"
             "    r1 = (half4) hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy);\n"
             "    output.color0.xyz = float3(r1.xyz)*float3(r0.xyz);\n"
             "    output.color0.w = float(r1.w);\n"
             "    return output;\n"
             "}\n"
             "//MD5=be9d6af0:6016dd49:77d08db8:bcc61458\n"
             "//SIG=00400000:00000003:00000003:00000003:0001:0001:0002:0000:0000:0000:0006:0000:0002:02:0:1:0\n";
    else {
      return "//Metal1.0     \n"
    }
             "//LEN=0000000377\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< float > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]], \n"
             "    texture2d< float > hg_Texture1 [[ texture(1) ]], \n"
             "    sampler hg_Sampler1 [[ sampler(1) ]])\n"
             "{\n"
             "    const float4 c0 = float4(1.000000000, 0.000000000, 0.000000000, 0.000000000);\n"
             "    float4 r0, r1;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0.xyz = hg_Texture1.sample(hg_Sampler1, frag._texCoord1.xy).xyz;\n"
             "    r0.xyz = mix(c0.xxx, hg_Params[0].xyz, r0.xyz);\n"
             "    r1 = hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy);\n"
             "    output.color0.xyz = r1.xyz*r0.xyz;\n"
             "    output.color0.w = r1.w;\n"
             "    return output;\n"
             "}\n"
             "//MD5=5a708099:c9ffe141:8e47c2fe:6139bb5a\n"
             "//SIG=00000000:00000003:00000003:00000000:0001:0001:0002:0000:0000:0000:0006:0000:0002:02:0:1:0\n";
  }
  else if (Target <= 0x6060F {
         || (*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 46))
  }
  {
    return 0;
  }
  else
  {
    return "//GLfs2.0      \n"
           "//LEN=0000000325\n"
           "#ifndef GL_ES\n"
           "#define lowp\n"
           "#define mediump\n"
           "#define highp\n"
           "#endif\n"
           "#define defaultp mediump\n"
           "uniform defaultp sampler2D hg_Texture1;\n"
           "uniform defaultp sampler2D hg_Texture0;\n"
           "uniform defaultp vec4 hg_ProgramLocal0;\n"
           "varying highp vec4 hg_TexCoord0;\n"
           "varying highp vec4 hg_TexCoord1;\n"
           "void main()\n"
           "{\n"
           "    const defaultp vec4 c0 = vec4(1.000000000, 0.000000000, 0.000000000, 0.000000000);\n"
           "    defaultp vec4 r0, r1;\n"
           "\n"
           "    r0.xyz = texture2D(hg_Texture1, hg_TexCoord1.xy).xyz;\n"
           "    r0.xyz = mix(c0.xxx, hg_ProgramLocal0.xyz, r0.xyz);\n"
           "    r1 = texture2D(hg_Texture0, hg_TexCoord0.xy);\n"
           "    gl_FragColor.xyz = r1.xyz*r0.xyz;\n"
           "    gl_FragColor.w = r1.w;\n"
           "}\n"
           "//MD5=184406a1:5249f001:2c7367ac:8a4d1966\n"
           "//SIG=00000000:00000003:00000003:00000000:0001:0001:0002:0000:0000:0000:0000:0000:0002:02:0:1:0\n";
  }
}

void HgcApplyAuxiliaryMap::InitProgramDescriptor(HgcApplyAuxiliaryMap *this, HGProgramDescriptor *a2)
{
  HGProgramDescriptor::SetVisibleShaderWithSource(a2, "HgcApplyAuxiliaryMap_hgc_visible", "//Metal1.0     \n//LEN=00000001da\n[[ visible ]] FragmentOut HgcApplyAuxiliaryMap_hgc_visible(const constant float4* hg_Params,\n    float4 color0,\n    float4 color1)\n{\n    const float4 c0 = float4(1.000000000, 0.000000000, 0.000000000, 0.000000000);\n"
    "    float4 r0, r1;\n"
    "    FragmentOut output;\n"
    "\n"
    "    r0.xyz = color1.xyz;\n"
    "    r0.xyz = mix(c0.xxx, hg_Params[0].xyz, r0.xyz);\n"
    "    r1 = color0;\n"
    "    output.color0.xyz = r1.xyz*r0.xyz;\n"
    "    output.color0.w = r1.w;\n"
    "    return output;\n"
    "}\n");
  HGProgramDescriptor::SetFragmentFunctionName(a2, "HgcApplyAuxiliaryMap");
}

void sub_1B7E5809C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, long long a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  *(_DWORD *)(v32 - 64) = 4;
  std::string::basic_string[abi:ne180100]<0>((void *)(v32 - 56), "FragmentOut");
  *(_OWORD *)(v32 - 32) = xmmword_1B7E75170;
  HGProgramDescriptor::SetReturnBinding(v31, v32 - 64);
  if (*(char *)(v32 - 33) < 0) {
    operator delete(*(void **)(v32 - 56));
  }
  memset(v37, 0, 24);
  LODWORD(v33) = 2;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75770;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  LODWORD(v33) = 10;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75170;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  LODWORD(v33) = 10;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75170;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  HGProgramDescriptor::SetArgumentBindings(v31, v37);
  FxColorDescription v33 = (void **)v37;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100](&v33);
}

void sub_1B7E581DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,char a21)
{
  a12 = &a21;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

void sub_1B7E58224()
{
  if (*(char *)(v0 - 33) < 0) {
    operator delete(*(void **)(v0 - 56));
  }
  JUMPOUT(0x1B7E5821CLL);
}

void *HgcApplyAuxiliaryMap::shaderDescription@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "HgcApplyAuxiliaryMap [hgc1]");
}

uint64_t HgcApplyAuxiliaryMap::BindTexture(HgcApplyAuxiliaryMap *this, HGHandler *a2, int a3)
{
  if (a3)
  {
    if (a3 != 1) {
      return 0xFFFFFFFFLL;
    }
    (*(void (**)(HGHandler *, uint64_t, void))(*(void *)a2 + 72))(a2, 1, 0);
    (*(void (**)(HGHandler *, void, void))(*(void *)a2 + 48))(a2, 0, 0);
    uint64_t v4 = a2;
    int v5 = 1;
  }
  else
  {
    (*(void (**)(HGHandler *, void))(*(void *)a2 + 72))(a2, 0);
    (*(void (**)(HGHandler *, void, void))(*(void *)a2 + 48))(a2, 0, 0);
    uint64_t v4 = a2;
    int v5 = 0;
  }
  HGHandler::TexCoord(v4, v5, 0, 0, 0);
  int v6 = (*(uint64_t (**)(void, uint64_t))(**((void **)a2 + 18) + 128))(*((void *)a2 + 18), 46);
  uint64_t result = 0;
  if (!v6)
  {
    (*(void (**)(HGHandler *))(*(void *)a2 + 168))(a2);
    return 0;
  }
  return result;
}

uint64_t HgcApplyAuxiliaryMap::Bind(HgcApplyAuxiliaryMap *this, HGHandler *a2)
{
  return 0;
}

uint64_t HgcApplyAuxiliaryMap::RenderTile(HgcApplyAuxiliaryMap *this, HGTile *a2)
{
  int v2 = *((_DWORD *)a2 + 3) - *((_DWORD *)a2 + 1);
  if (v2 >= 1)
  {
    int v3 = 0;
    int v4 = *((_DWORD *)a2 + 2) - *(_DWORD *)a2;
    uint64_t v5 = *((void *)a2 + 2);
    uint64_t v6 = *((void *)a2 + 10);
    uint64_t v7 = 16 * *((int *)a2 + 26);
    uint64_t v8 = *((void *)a2 + 12);
    uint64_t v9 = 16 * *((int *)a2 + 22);
    uint64_t v10 = 16 * *((int *)a2 + 6);
    do
    {
      if (v4 < 4)
      {
        LODWORD(v21) = 0;
      }
      else
      {
        int v11 = 0;
        uint64_t v12 = 32;
        do
        {
          uint64_t v13 = *((void *)this + 51);
          float32x4_t v14 = *(float32x4_t *)(v13 + 16);
          float32x4_t v15 = vsubq_f32(*(float32x4_t *)v13, v14);
          int8x16_t v16 = *(int8x16_t *)(v13 + 32);
          int8x16_t v17 = vbslq_s8(v16, *(int8x16_t *)(v6 + v12 - 16), (int8x16_t)vmulq_f32(*(float32x4_t *)(v6 + v12 - 16), vmlaq_f32(v14, v15, *(float32x4_t *)(v8 + v12 - 16))));
          int8x16_t v18 = vbslq_s8(v16, *(int8x16_t *)(v6 + v12), (int8x16_t)vmulq_f32(vmlaq_f32(v14, v15, *(float32x4_t *)(v8 + v12)), *(float32x4_t *)(v6 + v12)));
          int8x16_t v19 = vbslq_s8(v16, *(int8x16_t *)(v6 + v12 + 16), (int8x16_t)vmulq_f32(vmlaq_f32(v14, v15, *(float32x4_t *)(v8 + v12 + 16)), *(float32x4_t *)(v6 + v12 + 16)));
          uint64_t v20 = (int8x16_t *)(v5 + v12);
          v20[-2] = vbslq_s8(v16, *(int8x16_t *)(v6 + v12 - 32), (int8x16_t)vmulq_f32(*(float32x4_t *)(v6 + v12 - 32), vmlaq_f32(v14, v15, *(float32x4_t *)(v8 + v12 - 32))));
          v20[-1] = v17;
          *uint64_t v20 = v18;
          v20[1] = v19;
          v11 -= 4;
          v12 += 64;
        }
        while (v4 + v11 > 3);
        LODWORD(v21) = -v11;
      }
      if ((int)v21 < v4)
      {
        uint64_t v21 = v21;
        do
        {
          *(int8x16_t *)(v5 + 16 * v21) = vbslq_s8(*(int8x16_t *)(*((void *)this + 51) + 32), *(int8x16_t *)(v6 + 16 * v21), (int8x16_t)vmulq_f32(*(float32x4_t *)(v6 + 16 * v21), vmlaq_f32(*(float32x4_t *)(*((void *)this + 51) + 16), vsubq_f32(*(float32x4_t *)*((void *)this + 51), *(float32x4_t *)(*((void *)this + 51) + 16)), *(float32x4_t *)(v8 + 16 * v21))));
          ++v21;
        }
        while (v21 < v4);
      }
      ++v3;
      v8 += v7;
      v6 += v9;
      v5 += v10;
    }
    while (v3 != v2);
  }
  return 0;
}

uint64_t HgcApplyAuxiliaryMap::GetDOD(HgcApplyAuxiliaryMap *this, HGRenderer *a2, unsigned int a3, HGRect a4)
{
  if (a3 >= 2) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

uint64_t HgcApplyAuxiliaryMap::GetROI(HgcApplyAuxiliaryMap *this, HGRenderer *a2, unsigned int a3, HGRect a4)
{
  if (a3 >= 2) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

void HgcApplyAuxiliaryMap::HgcApplyAuxiliaryMap(HgcApplyAuxiliaryMap *this)
{
  HGNode::HGNode((HGNode *)this);
  void *v1 = &unk_1F119B700;
  operator new();
}

void sub_1B7E5865C(_Unwind_Exception *a1)
{
  HGNode::~HGNode(v1);
  _Unwind_Resume(a1);
}

void HgcApplyAuxiliaryMap::~HgcApplyAuxiliaryMap(HGNode *this)
{
  *(void *)this = &unk_1F119B700;
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    MEMORY[0x1BA9BFBA0](v2, 0x1000C40FA0F61DDLL);
  }

  HGNode::~HGNode(this);
}

{
  void *v1;
  uint64_t vars8;

  HgcApplyAuxiliaryMap::~HgcApplyAuxiliaryMap(this);

  HGObject::operator delete(v1);
}

uint64_t HgcApplyAuxiliaryMap::SetParameter(HgcApplyAuxiliaryMap *this, uint64_t a2, __n128 a3, float a4, float a5, float a6, char *a7)
{
  if (a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = (__n128 *)*((void *)this + 51);
  if (v8->n128_f32[0] == a3.n128_f32[0]
    && v8->n128_f32[1] == a3.n128_f32[0]
    && v8->n128_f32[2] == a3.n128_f32[0]
    && v8->n128_f32[3] == 0.0)
  {
    return 0;
  }
  int32x4_t v9 = vzip1q_s32((int32x4_t)a3.n128_u32[0], (int32x4_t)a3.n128_u32[0]);
  v9.i32[2] = a3.n128_u32[0];
  a3.n128_f32[1] = a4;
  *uint64_t v8 = (__n128)v9;
  a3.n128_u64[1] = __PAIR64__(LODWORD(a6), LODWORD(a5));
  v8[3] = a3;
  HGNode::ClearBits((HGNode *)this, a2, a7);
  return 1;
}

float HgcApplyAuxiliaryMap::GetParameter(HgcApplyAuxiliaryMap *this, int a2, float *a3)
{
  if (!a2)
  {
    int v3 = (float *)*((void *)this + 51);
    *a3 = v3[12];
    a3[1] = v3[13];
    a3[2] = v3[14];
    float result = v3[15];
    a3[3] = result;
  }
  return result;
}

uint64_t HgcColorCorrect::Setup(HgcColorCorrect *this, void *a2)
{
  uint64_t v2 = *((void *)this + 62);
  float32x4_t v3 = *(float32x4_t *)(v2 + 176);
  int8x16_t v5 = *(int8x16_t *)v2;
  float32x4_t v4 = *(float32x4_t *)(v2 + 16);
  float32x4_t v6 = (float32x4_t)vextq_s8((int8x16_t)v4, (int8x16_t)v4, 8uLL);
  float32x4_t v7 = vmulq_laneq_f32(v6, v4, 2);
  float32x4_t v8 = *(float32x4_t *)(v2 + 208);
  float32x4_t v9 = *(float32x4_t *)(v2 + 224);
  float32x4_t v10 = vminq_f32(vmaxq_f32(vmulq_laneq_f32(v7, v4, 2), v8), v9);
  float32x4_t v11 = vminq_f32(vmaxq_f32(vrecpeq_f32(v10), v8), v9);
  float32x4_t v12 = vminq_f32(vmaxq_f32(vmulq_f32(v11, vrecpsq_f32(v10, v11)), v8), v9);
  float32x4_t v13 = vmulq_f32(v12, vrecpsq_f32(v10, v12));
  float32x4_t v14 = vminq_f32(vmaxq_f32(v7, v8), v9);
  float32x4_t v15 = vminq_f32(vmaxq_f32(vrecpeq_f32(v14), v8), v9);
  float32x4_t v16 = vminq_f32(vmaxq_f32(vmulq_f32(v15, vrecpsq_f32(v14, v15)), v8), v9);
  float32x4_t v17 = vmulq_f32(v16, vrecpsq_f32(v14, v16));
  float32x4_t v220 = *(float32x4_t *)(v2 + 864);
  float32x4_t v18 = vminq_f32(vmaxq_f32(v6, v8), v9);
  float32x4_t v19 = vminq_f32(vmaxq_f32(vrecpeq_f32(v18), v8), v9);
  float32x4_t v20 = vminq_f32(vmaxq_f32(vmulq_f32(v19, vrecpsq_f32(v18, v19)), v8), v9);
  float32x4_t v21 = vmulq_f32(v20, vrecpsq_f32(v18, v20));
  int8x16_t v22 = (int8x16_t)vaddq_f32(*(float32x4_t *)(v2 + 256), vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_f32(v13, *(float32x4_t *)(v2 + 240)), v17, v220, 2), v21, v220, 3));
  float32x4_t v23 = *(float32x4_t *)(v2 + 832);
  float32x4_t v218 = *(float32x4_t *)(v2 + 848);
  float32x4_t v219 = v23;
  int8x16_t v24 = (int8x16_t)vaddq_f32(*(float32x4_t *)(v2 + 288), vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_f32(v13, *(float32x4_t *)(v2 + 272)), v17, v218, 2), v21, v218, 3));
  int8x16_t v25 = (int8x16_t)vcgtq_f32(v3, vsubq_f32(v6, *(float32x4_t *)(v2 + 192)));
  float32x4_t v26 = (float32x4_t)vbslq_s8(v25, v22, v24);
  float32x4_t v28 = *(float32x4_t *)(v2 + 800);
  float32x4_t v27 = *(float32x4_t *)(v2 + 816);
  int8x16_t v29 = vbslq_s8(v25, (int8x16_t)vsubq_f32(vmlaq_laneq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(vmulq_f32(*(float32x4_t *)(v2 + 304), v26), v26), v26), v26, vmulq_f32(vnegq_f32(*(float32x4_t *)(v2 + 320)), v26)), v26, v23, 3), *(float32x4_t *)(v2 + 336)), (int8x16_t)vsubq_f32(vmlaq_laneq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(vmulq_f32(*(float32x4_t *)(v2 + 352), v26), v26), v26), v26, vmulq_f32(vnegq_f32(*(float32x4_t *)(v2 + 368)), v26)), v26, v27,
                         3),
                       *(float32x4_t *)(v2 + 384)));
  float32x4_t v30 = *(float32x4_t *)(v2 + 464);
  float32x4_t v31 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v3, vsubq_f32(v6, *(float32x4_t *)(v2 + 400))), (int8x16_t)vsubq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(vmulq_f32(*(float32x4_t *)(v2 + 416), v26), v26), v26), v26, vmulq_f32(v26, vnegq_f32(*(float32x4_t *)(v2 + 432)))), *(float32x4_t *)(v2 + 448), v26), v30), v29);
  float32x4_t v32 = vminq_f32(vmaxq_f32(v31, v8), v9);
  float32x4_t v33 = vminq_f32(vmaxq_f32(vrecpeq_f32(v32), v8), v9);
  float32x4_t v34 = vminq_f32(vmaxq_f32(vmulq_f32(v33, vrecpsq_f32(v32, v33)), v8), v9);
  float32x4_t v35 = *(float32x4_t *)(v2 + 480);
  float32x4_t v36 = vmulq_f32(vmulq_f32(v34, vrecpsq_f32(v32, v34)), v35);
  v37.i32[0] = vmulq_f32(v36, v26).u32[0];
  v37.i32[1] = *(_DWORD *)"q=\n?";
  v37.i64[1] = vmulq_n_f32((float32x4_t)vdupq_lane_s64((uint64_t)vsubq_f32(vsubq_f32(v27, v26), v31), 0), *(float *)&v36).i64[1];
  float32x4_t v38 = vmulq_f32(*(float32x4_t *)(v2 + 496), v37);
  int8x16_t v39 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_laneq_s64((int64x2_t)v38, 1), vaddq_f32(v38, (float32x4_t)vrev64q_s32((int32x4_t)v38)));
  int8x16_t v40 = *(int8x16_t *)(v2 + 528);
  float32x4_t v41 = vmulq_f32(*(float32x4_t *)(v2 + 512), v37);
  float32x4_t v42 = vmulq_f32(*(float32x4_t *)(v2 + 544), v37);
  float32x4_t v43 = (float32x4_t)vbslq_s8(v40, v39, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v41, (int8x16_t)v23, 4uLL), vaddq_f32(v41, (float32x4_t)vrev64q_s32((int32x4_t)v41))));
  v43.i32[2] = vaddq_f32(v42, vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v42, 0), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v42, 1))).i32[2];
  float32x4_t v44 = vmulq_f32(*(float32x4_t *)(v2 + 560), v43);
  v23.i32[0] = 1.0;
  v44.i32[3] = 1.0;
  float32x4_t v45 = vmulq_f32(*(float32x4_t *)(v2 + 128), v44);
  float32x4_t v46 = vmulq_f32(*(float32x4_t *)(v2 + 144), v44);
  float32x4_t v47 = vmulq_f32(*(float32x4_t *)(v2 + 160), v44);
  float32x4_t v48 = vmulq_f32(v3, v44);
  float32x4_t v49 = *(float32x4_t *)(v2 + 16);
  float32x4_t v50 = (float32x4_t)vrev64q_s32((int32x4_t)v49);
  float32x4_t v51 = vmulq_n_f32(*(float32x4_t *)v2, vsubq_f32(v27, v50).f32[0]);
  float32x4_t v52 = vaddq_f32(v51, (float32x4_t)vandq_s8(v40, (int8x16_t)v50));
  float32x4_t v53 = vmulq_f32(v52, v45);
  int8x16_t v54 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_laneq_s64((int64x2_t)v53, 1), vaddq_f32(v53, (float32x4_t)vrev64q_s32((int32x4_t)v53)));
  float32x4_t v55 = vmulq_f32(v52, v46);
  int8x16_t v56 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_laneq_s64((int64x2_t)v55, 1), vaddq_f32(v55, (float32x4_t)vrev64q_s32((int32x4_t)v55)));
  float32x4_t v57 = vmulq_f32(v52, v47);
  int8x16_t v58 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_laneq_s64((int64x2_t)v57, 1), vaddq_f32(v57, (float32x4_t)vrev64q_s32((int32x4_t)v57)));
  float32x4_t v59 = vmulq_f32(v52, v48);
  int8x16_t v60 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_laneq_s64((int64x2_t)v59, 1), vaddq_f32(v59, (float32x4_t)vrev64q_s32((int32x4_t)v59)));
  int8x16_t v62 = *(int8x16_t *)(v2 + 576);
  int8x16_t v61 = *(int8x16_t *)(v2 + 592);
  float32x4_t v63 = vaddq_f32(v51, (float32x4_t)vandq_s8(v62, (int8x16_t)v49));
  float32x4_t v64 = vmulq_f32(v63, v45);
  v54.i64[0] = vbslq_s8(v40, v54, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v64, (int8x16_t)v23, 4uLL), vaddq_f32(v64, (float32x4_t)vrev64q_s32((int32x4_t)v64)))).u64[0];
  float32x4_t v65 = vmulq_f32(v63, v46);
  v56.i64[0] = vbslq_s8(v40, v56, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v65, (int8x16_t)v23, 4uLL), vaddq_f32(v65, (float32x4_t)vrev64q_s32((int32x4_t)v65)))).u64[0];
  float32x4_t v66 = vmulq_f32(v63, v47);
  v58.i64[0] = vbslq_s8(v40, v58, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v66, (int8x16_t)v23, 4uLL), vaddq_f32(v66, (float32x4_t)vrev64q_s32((int32x4_t)v66)))).u64[0];
  float32x4_t v67 = vmulq_f32(v63, v48);
  float32x4_t v68 = vaddq_f32(v51, (float32x4_t)vandq_s8(v61, vextq_s8((int8x16_t)v49, (int8x16_t)v49, 0xCuLL)));
  float32x4_t v69 = vmulq_f32(v68, v45);
  v54.i64[1] = vaddq_f32(v69, vaddq_f32((float32x4_t)vdupq_lane_s64(*(uint64_t *)&v69, 0), (float32x4_t)vextq_s8(*(int8x16_t *)&v23, *(int8x16_t *)&v69, 0xCuLL))).i64[1];
  float32x4_t v70 = vmulq_f32(v68, v46);
  v56.i64[1] = vaddq_f32(v70, vaddq_f32((float32x4_t)vdupq_lane_s64(*(uint64_t *)&v70, 0), (float32x4_t)vextq_s8(*(int8x16_t *)&v23, *(int8x16_t *)&v70, 0xCuLL))).i64[1];
  float32x4_t v71 = vmulq_f32(v68, v47);
  v58.i64[1] = vaddq_f32(v71, vaddq_f32((float32x4_t)vdupq_lane_s64(*(uint64_t *)&v71, 0), (float32x4_t)vextq_s8(*(int8x16_t *)&v23, *(int8x16_t *)&v71, 0xCuLL))).i64[1];
  v60.i64[0] = vbslq_s8(v40, v60, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v67, (int8x16_t)v23, 4uLL), vaddq_f32(v67, (float32x4_t)vrev64q_s32((int32x4_t)v67)))).u64[0];
  float32x4_t v72 = vmulq_f32(v68, v48);
  v60.i64[1] = vaddq_f32(v72, vaddq_f32((float32x4_t)vdupq_lane_s64(*(uint64_t *)&v72, 0), (float32x4_t)vextq_s8(*(int8x16_t *)&v23, *(int8x16_t *)&v72, 0xCuLL))).i64[1];
  int8x16_t v73 = *(int8x16_t *)(v2 + 608);
  float32x4_t v74 = *(float32x4_t *)(v2 + 624);
  float32x4_t v75 = (float32x4_t)vbslq_s8(v73, (int8x16_t)v45, v54);
  float32x4_t v76 = (float32x4_t)vbslq_s8(v73, (int8x16_t)v46, v56);
  float32x4_t v77 = *(float32x4_t *)(v2 + 32);
  float32x4_t v78 = *(float32x4_t *)(v2 + 48);
  float32x4_t v79 = vmulq_f32(v77, v75);
  float32x4_t v80 = vmulq_f32(v77, v76);
  float32x4_t v81 = vmulq_f32(v77, (float32x4_t)vbslq_s8(v73, (int8x16_t)v47, v58));
  float32x4_t v82 = vmulq_f32(v77, (float32x4_t)vbslq_s8(v73, (int8x16_t)v48, v60));
  float32x4_t v83 = vmulq_laneq_f32(v74, v79, 3);
  float32x4_t v84 = vmulq_laneq_f32(v74, v80, 3);
  float32x4_t v85 = vmulq_laneq_f32(v74, v81, 3);
  float32x4_t v86 = vmulq_laneq_f32(v74, v82, 3);
  int8x16_t v87 = (int8x16_t)vmlaq_f32(v83, vsubq_f32(v79, v83), v78);
  int8x16_t v88 = (int8x16_t)vmlaq_f32(v84, vsubq_f32(v80, v84), v78);
  int8x16_t v89 = (int8x16_t)vmlaq_f32(v85, vsubq_f32(v81, v85), v78);
  int8x16_t v90 = (int8x16_t)vmlaq_f32(v86, vsubq_f32(v82, v86), v78);
  float32x4_t v91 = (float32x4_t)vextq_s8(v87, v87, 4uLL);
  float32x4_t v93 = *(float32x4_t *)(v2 + 640);
  float32x4_t v92 = *(float32x4_t *)(v2 + 656);
  float32x4_t v94 = vmulq_f32(v93, v91);
  int8x16_t v95 = vbslq_s8(v62, (int8x16_t)vaddq_f32(v94, (float32x4_t)vrev64q_s32((int32x4_t)v94)), v87);
  float32x4_t v96 = (float32x4_t)vextq_s8(v88, v88, 4uLL);
  float32x4_t v97 = vmulq_f32(v93, v96);
  int8x16_t v98 = vbslq_s8(v62, (int8x16_t)vaddq_f32(v97, (float32x4_t)vrev64q_s32((int32x4_t)v97)), v88);
  float32x4_t v99 = (float32x4_t)vextq_s8(v89, v89, 4uLL);
  float32x4_t v100 = vmulq_f32(v93, v99);
  int8x16_t v101 = vbslq_s8(v62, (int8x16_t)vaddq_f32(v100, (float32x4_t)vrev64q_s32((int32x4_t)v100)), v89);
  float32x4_t v102 = (float32x4_t)vextq_s8(v90, v90, 4uLL);
  float32x4_t v103 = vmulq_f32(v93, v102);
  float32x4_t v104 = (float32x4_t)vbslq_s8(v62, (int8x16_t)vaddq_f32(v103, (float32x4_t)vrev64q_s32((int32x4_t)v103)), v90);
  int8x16_t v105 = (int8x16_t)vmulq_f32(v92, v91);
  int8x16_t v106 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v105, v105, 8uLL), (float32x4_t)vextq_s8(v105, v105, 0xCuLL)), v95);
  int8x16_t v107 = (int8x16_t)vmulq_f32(v92, v96);
  int8x16_t v108 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v107, v107, 8uLL), (float32x4_t)vextq_s8(v107, v107, 0xCuLL)), v98);
  int8x16_t v109 = (int8x16_t)vmulq_f32(v92, v99);
  int8x16_t v110 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v109, v109, 8uLL), (float32x4_t)vextq_s8(v109, v109, 0xCuLL)), v101);
  int8x16_t v111 = (int8x16_t)vmulq_f32(v92, v102);
  int8x16_t v112 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v111, v111, 8uLL), (float32x4_t)vextq_s8(v111, v111, 0xCuLL)), (int8x16_t)v104);
  float32x4_t v113 = (float32x4_t)vextq_s8(v5, v5, 4uLL);
  int8x16_t v114 = (int8x16_t)vmulq_f32(v113, v92);
  int8x16_t v115 = vextq_s8((int8x16_t)v23, v114, 0xCuLL);
  *(float32x2_t *)v104.f32 = vadd_f32(*(float32x2_t *)v114.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v115, v115, 8uLL));
  int8x16_t v117 = *(int8x16_t *)(v2 + 672);
  float32x4_t v116 = *(float32x4_t *)(v2 + 688);
  *(int8x8_t *)v118.f32 = vqtbl1_s8(v106, *(int8x8_t *)v117.i8);
  v115.i64[0] = vextq_s8(v117, v117, 8uLL).u64[0];
  *(int8x8_t *)&v118.u32[2] = vqtbl1_s8(v106, *(int8x8_t *)v115.i8);
  float32x4_t v119 = vmulq_f32(v116, v118);
  *(int8x8_t *)v120.f32 = vqtbl1_s8(v108, *(int8x8_t *)v117.i8);
  *(int8x8_t *)&v120.u32[2] = vqtbl1_s8(v108, *(int8x8_t *)v115.i8);
  float32x4_t v121 = vmulq_f32(v116, v120);
  *(int8x8_t *)v122.f32 = vqtbl1_s8(v110, *(int8x8_t *)v117.i8);
  *(int8x8_t *)&v122.u32[2] = vqtbl1_s8(v110, *(int8x8_t *)v115.i8);
  float32x4_t v123 = vmulq_f32(v116, v122);
  int8x16_t v124 = (int8x16_t)vaddq_f32(v123, (float32x4_t)vrev64q_s32((int32x4_t)v123));
  *(int8x8_t *)v123.f32 = vqtbl1_s8(v112, *(int8x8_t *)v117.i8);
  *(int8x8_t *)&v123.u32[2] = vqtbl1_s8(v112, *(int8x8_t *)v115.i8);
  float32x4_t v125 = vmulq_f32(v116, v123);
  int8x16_t v126 = (int8x16_t)vaddq_f32(v125, (float32x4_t)vrev64q_s32((int32x4_t)v125));
  int8x16_t v127 = vbslq_s8(v40, (int8x16_t)vaddq_f32(v119, (float32x4_t)vrev64q_s32((int32x4_t)v119)), v106);
  int8x16_t v128 = vbslq_s8(v40, (int8x16_t)vaddq_f32(v121, (float32x4_t)vrev64q_s32((int32x4_t)v121)), v108);
  int8x16_t v129 = vbslq_s8(v40, v124, v110);
  int8x16_t v130 = vbslq_s8(v40, v126, v112);
  float32x4_t v131 = *(float32x4_t *)(v2 + 704);
  float32x4_t v132 = *(float32x4_t *)(v2 + 720);
  int8x16_t v133 = (int8x16_t)vmulq_f32(v118, v131);
  int8x16_t v134 = (int8x16_t)vmulq_f32(v120, v131);
  int8x16_t v135 = (int8x16_t)vmulq_f32(v122, v131);
  v5.i64[1] = v104.i64[0];
  *(int8x8_t *)v104.f32 = vqtbl1_s8(v5, *(int8x8_t *)v117.i8);
  *(int8x8_t *)&v104.u32[2] = vqtbl1_s8(v5, *(int8x8_t *)v115.i8);
  int8x16_t v136 = (int8x16_t)vmulq_f32(v131, v123);
  float32x4_t v137 = vmulq_f32(v116, v104);
  float32x4_t v138 = vmulq_f32(v113, v93);
  v137.i64[0] = vbslq_s8(v40, (int8x16_t)vaddq_f32(v137, (float32x4_t)vrev64q_s32((int32x4_t)v137)), (int8x16_t)vaddq_f32(v138, (float32x4_t)vrev64q_s32((int32x4_t)v138))).u64[0];
  int8x16_t v139 = (int8x16_t)vmulq_f32(v131, v104);
  int32x4_t v140 = (int32x4_t)vaddq_f32((float32x4_t)vdupq_lane_s64(v139.i64[0], 0), (float32x4_t)vextq_s8(v130, v139, 0xCuLL));
  v137.i64[1] = v140.i64[1];
  float32x4_t v141 = vminq_f32(vmaxq_f32((float32x4_t)vdupq_laneq_s32(v140, 2), v8), v9);
  float32x4_t v142 = vminq_f32(vmaxq_f32(vrecpeq_f32(v141), v8), v9);
  float32x4_t v143 = vminq_f32(vmaxq_f32(vmulq_f32(v142, vrecpsq_f32(v141, v142)), v8), v9);
  float32x4_t v144 = vmulq_f32(vmulq_f32(v143, vrecpsq_f32(v141, v143)), v137);
  float32x4_t v145 = v144;
  v145.i32[2] = 1.0;
  float32x4_t v146 = vmulq_f32(v145, (float32x4_t)vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v133, v133, 8uLL), (float32x4_t)vextq_s8(v133, v133, 0xCuLL)), v127));
  float32x4_t v147 = (float32x4_t)vbslq_s8(v61, (int8x16_t)vaddq_f32(v146, vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v146, (int8x16_t)v146, 8uLL), (float32x4_t)vextq_s8((int8x16_t)v146, (int8x16_t)v146, 0xCuLL))), v127);
  float32x4_t v148 = vmulq_f32(v145, (float32x4_t)vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v134, v134, 8uLL), (float32x4_t)vextq_s8(v134, v134, 0xCuLL)), v128));
  float32x4_t v149 = (float32x4_t)vbslq_s8(v61, (int8x16_t)vaddq_f32(v148, vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v148, (int8x16_t)v148, 8uLL), (float32x4_t)vextq_s8((int8x16_t)v148, (int8x16_t)v148, 0xCuLL))), v128);
  float32x4_t v150 = vmulq_f32(v145, (float32x4_t)vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v135, v135, 8uLL), (float32x4_t)vextq_s8(v135, v135, 0xCuLL)), v129));
  float32x4_t v151 = (float32x4_t)vbslq_s8(v61, (int8x16_t)vaddq_f32(v150, vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v150, (int8x16_t)v150, 8uLL), (float32x4_t)vextq_s8((int8x16_t)v150, (int8x16_t)v150, 0xCuLL))), v129);
  float32x4_t v152 = vmulq_f32(v145, (float32x4_t)vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v136, v136, 8uLL), (float32x4_t)vextq_s8(v136, v136, 0xCuLL)), v130));
  float32x4_t v153 = vmulq_f32(v49, v132);
  float32x4_t v154 = *(float32x4_t *)(v2 + 736);
  float32x4_t v155 = *(float32x4_t *)(v2 + 752);
  float32x4_t v156 = vmulq_f32(v153, v154);
  float32x4_t v157 = vcvtq_f32_s32(vcvtq_s32_f32(v156));
  float32x4_t v158 = vsubq_f32(vabdq_f32(vsubq_f32(v156, vsubq_f32(v157, (float32x4_t)vandq_s8((int8x16_t)v27, (int8x16_t)vcgtq_f32(v157, v156)))), v74), v155);
  float32x4_t v159 = vmulq_f32(v158, v158);
  float32x4_t v161 = *(float32x4_t *)(v2 + 768);
  float32x4_t v160 = *(float32x4_t *)(v2 + 784);
  float32x4_t v162 = vmlaq_f32(v28, v160, (float32x4_t)vrev64q_s32((int32x4_t)v153));
  float32x4_t v163 = vcvtq_f32_s32(vcvtq_s32_f32(v162));
  float32x4_t v164 = vaddq_f32(v28, vabdq_f32(vsubq_f32(v162, vsubq_f32(v163, (float32x4_t)vandq_s8((int8x16_t)v161, (int8x16_t)vcgtq_f32(v163, v162)))), v155));
  float32x4_t v165 = vmulq_f32(v164, v164);
  float32x4_t v166 = (float32x4_t)vbslq_s8(v61, (int8x16_t)vaddq_f32(v152, vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v152, (int8x16_t)v152, 8uLL), (float32x4_t)vextq_s8((int8x16_t)v152, (int8x16_t)v152, 0xCuLL))), v130);
  float32x4_t v167 = (float32x4_t)vbslq_s8(v40, (int8x16_t)vmulq_f32(v158, vmlaq_f32(v132, v159, vmlaq_f32(v28, v159, vmlaq_f32(v161, v160, v159)))), (int8x16_t)vmulq_f32(v164, vmlaq_f32(v30, v165, vmlaq_f32(v35, v165, vmlaq_f32(v154, v132, v165)))));
  float32x4_t v168 = vmulq_f32(v27, v167);
  float32x4_t v169 = vmulq_f32(v168, v147);
  float32x4_t v170 = vmulq_f32(v168, v149);
  float32x4_t v171 = vmulq_f32(v168, v151);
  float32x4_t v172 = vmulq_f32(v168, v166);
  float32x4_t v173 = (float32x4_t)vrev64q_s32((int32x4_t)v167);
  float32x4_t v174 = vmulq_f32(v173, v147);
  v169.i64[0] = vbslq_s8(v40, (int8x16_t)vaddq_f32(v169, (float32x4_t)vrev64q_s32((int32x4_t)v169)), (int8x16_t)vaddq_f32(v174, (float32x4_t)vrev64q_s32((int32x4_t)v174))).u64[0];
  float32x4_t v175 = vmulq_f32(v173, v149);
  v170.i64[0] = vbslq_s8(v40, (int8x16_t)vaddq_f32(v170, (float32x4_t)vrev64q_s32((int32x4_t)v170)), (int8x16_t)vaddq_f32(v175, (float32x4_t)vrev64q_s32((int32x4_t)v175))).u64[0];
  float32x4_t v176 = vmulq_f32(v173, v151);
  v171.i64[0] = vbslq_s8(v40, (int8x16_t)vaddq_f32(v171, (float32x4_t)vrev64q_s32((int32x4_t)v171)), (int8x16_t)vaddq_f32(v176, (float32x4_t)vrev64q_s32((int32x4_t)v176))).u64[0];
  float32x4_t v177 = vmulq_f32(v173, v166);
  float32x4_t v178 = vnegq_f32(v144);
  v172.i64[0] = vbslq_s8(v40, (int8x16_t)vaddq_f32(v172, (float32x4_t)vrev64q_s32((int32x4_t)v172)), (int8x16_t)vaddq_f32(v177, (float32x4_t)vrev64q_s32((int32x4_t)v177))).u64[0];
  v169.i64[1] = v147.i64[1];
  v170.i64[1] = v149.i64[1];
  v171.i64[1] = v151.i64[1];
  v172.i64[1] = v166.i64[1];
  v178.i32[2] = 1.0;
  float32x4_t v179 = vmulq_f32(v178, v169);
  int8x16_t v180 = vbslq_s8(v61, (int8x16_t)vaddq_f32(v179, vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v179, (int8x16_t)v179, 8uLL), (float32x4_t)vextq_s8((int8x16_t)v179, (int8x16_t)v179, 0xCuLL))), (int8x16_t)v169);
  float32x4_t v181 = vmulq_f32(v178, v170);
  int8x16_t v182 = vbslq_s8(v61, (int8x16_t)vaddq_f32(v181, vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v181, (int8x16_t)v181, 8uLL), (float32x4_t)vextq_s8((int8x16_t)v181, (int8x16_t)v181, 0xCuLL))), (int8x16_t)v170);
  float32x4_t v183 = vmulq_f32(v178, v171);
  int8x16_t v184 = vbslq_s8(v61, (int8x16_t)vaddq_f32(v183, vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v183, (int8x16_t)v183, 8uLL), (float32x4_t)vextq_s8((int8x16_t)v183, (int8x16_t)v183, 0xCuLL))), (int8x16_t)v171);
  float32x4_t v185 = vmulq_f32(v178, v172);
  int8x16_t v186 = vbslq_s8(v61, (int8x16_t)vaddq_f32(v185, vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v185, (int8x16_t)v185, 8uLL), (float32x4_t)vextq_s8((int8x16_t)v185, (int8x16_t)v185, 0xCuLL))), (int8x16_t)v172);
  *(int8x8_t *)v185.f32 = vqtbl1_s8(v180, *(int8x8_t *)v117.i8);
  *(int8x8_t *)&v185.u32[2] = vqtbl1_s8(v180, *(int8x8_t *)v115.i8);
  float32x4_t v187 = vmulq_f32(v219, v185);
  *(int8x8_t *)v170.f32 = vqtbl1_s8(v182, *(int8x8_t *)v117.i8);
  *(int8x8_t *)&v170.u32[2] = vqtbl1_s8(v182, *(int8x8_t *)v115.i8);
  float32x4_t v188 = vmulq_f32(v219, v170);
  *(int8x8_t *)v149.f32 = vqtbl1_s8(v184, *(int8x8_t *)v117.i8);
  *(int8x8_t *)&v149.u32[2] = vqtbl1_s8(v184, *(int8x8_t *)v115.i8);
  float32x4_t v189 = vmulq_f32(v219, v149);
  *(int8x8_t *)v176.f32 = vqtbl1_s8(v186, *(int8x8_t *)v117.i8);
  *(int8x8_t *)&v176.u32[2] = vqtbl1_s8(v186, *(int8x8_t *)v115.i8);
  float32x4_t v190 = vmulq_f32(v219, v176);
  int8x16_t v191 = (int8x16_t)vmulq_f32(v218, v185);
  int8x16_t v192 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v191, v191, 8uLL), (float32x4_t)vextq_s8(v191, v191, 0xCuLL)), vbslq_s8(v40, (int8x16_t)vaddq_f32(v187, (float32x4_t)vrev64q_s32((int32x4_t)v187)), v180));
  int8x16_t v193 = (int8x16_t)vmulq_f32(v218, v170);
  int8x16_t v194 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v193, v193, 8uLL), (float32x4_t)vextq_s8(v193, v193, 0xCuLL)), vbslq_s8(v40, (int8x16_t)vaddq_f32(v188, (float32x4_t)vrev64q_s32((int32x4_t)v188)), v182));
  int8x16_t v195 = (int8x16_t)vmulq_f32(v218, v149);
  int8x16_t v196 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v195, v195, 8uLL), (float32x4_t)vextq_s8(v195, v195, 0xCuLL)), vbslq_s8(v40, (int8x16_t)vaddq_f32(v189, (float32x4_t)vrev64q_s32((int32x4_t)v189)), v184));
  int8x16_t v197 = (int8x16_t)vmulq_f32(v218, v176);
  int8x16_t v198 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v197, v197, 8uLL), (float32x4_t)vextq_s8(v197, v197, 0xCuLL)), vbslq_s8(v40, (int8x16_t)vaddq_f32(v190, (float32x4_t)vrev64q_s32((int32x4_t)v190)), v186));
  float32x4_t v199 = (float32x4_t)vextq_s8(v192, v192, 4uLL);
  float32x4_t v200 = vmulq_f32(v92, v199);
  int8x16_t v201 = vbslq_s8(v62, (int8x16_t)vaddq_f32(v200, (float32x4_t)vrev64q_s32((int32x4_t)v200)), v192);
  float32x4_t v202 = (float32x4_t)vextq_s8(v194, v194, 4uLL);
  float32x4_t v203 = vmulq_f32(v92, v202);
  int8x16_t v204 = vbslq_s8(v62, (int8x16_t)vaddq_f32(v203, (float32x4_t)vrev64q_s32((int32x4_t)v203)), v194);
  float32x4_t v205 = (float32x4_t)vextq_s8(v196, v196, 4uLL);
  float32x4_t v206 = vmulq_f32(v92, v205);
  int8x16_t v207 = vbslq_s8(v62, (int8x16_t)vaddq_f32(v206, (float32x4_t)vrev64q_s32((int32x4_t)v206)), v196);
  float32x4_t v208 = (float32x4_t)vextq_s8(v198, v198, 4uLL);
  float32x4_t v209 = vmulq_f32(v92, v208);
  int8x16_t v210 = (int8x16_t)vmulq_f32(v220, v199);
  int8x16_t v211 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v210, v210, 8uLL), (float32x4_t)vextq_s8(v210, v210, 0xCuLL)), v201);
  int8x16_t v212 = (int8x16_t)vmulq_f32(v220, v202);
  int8x16_t v213 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v212, v212, 8uLL), (float32x4_t)vextq_s8(v212, v212, 0xCuLL)), v204);
  int8x16_t v214 = (int8x16_t)vmulq_f32(v220, v205);
  int8x16_t v215 = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v214, v214, 8uLL), (float32x4_t)vextq_s8(v214, v214, 0xCuLL)), v207);
  int8x16_t v216 = (int8x16_t)vmulq_f32(v220, v208);
  *(int8x16_t *)(v2 + 64) = v211;
  *(int8x16_t *)(*((void *)this + 62) + 80) = v213;
  *(int8x16_t *)(*((void *)this + 62) + 96) = v215;
  *(int8x16_t *)(*((void *)this + 62) + 112) = vbslq_s8(v61, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8(v216, v216, 8uLL), (float32x4_t)vextq_s8(v216, v216, 0xCuLL)), vbslq_s8(v62, (int8x16_t)vaddq_f32(v209, (float32x4_t)vrev64q_s32((int32x4_t)v209)), v198));
  return 0;
}

uint64_t HgcColorCorrect::BindTexture(HgcColorCorrect *this, HGHandler *a2, int a3)
{
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(HGHandler *, void))(*(void *)a2 + 72))(a2, 0);
  (*(void (**)(HGHandler *, void, void))(*(void *)a2 + 48))(a2, 0, 0);
  HGHandler::TexCoord(a2, 0, 0, 0, 0);
  int v5 = (*(uint64_t (**)(void, uint64_t))(**((void **)a2 + 18) + 128))(*((void *)a2 + 18), 46);
  uint64_t result = 0;
  if (!v5)
  {
    (*(void (**)(HGHandler *))(*(void *)a2 + 168))(a2);
    return 0;
  }
  return result;
}

uint64_t HgcColorCorrect::GetDOD(HgcColorCorrect *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

uint64_t HgcColorCorrect::GetROI(HgcColorCorrect *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

void HgcColorCorrect::HgcColorCorrect(HgcColorCorrect *this)
{
}

void sub_1B7E59324(_Unwind_Exception *a1)
{
  HGColorMatrix::~HGColorMatrix(v1);
  _Unwind_Resume(a1);
}

void HgcColorCorrect::~HgcColorCorrect(HgcColorCorrect *this)
{
  *(void *)this = &unk_1F119B968;
  uint64_t v2 = *((void *)this + 62);
  if (v2) {
    MEMORY[0x1BA9BFBA0](v2, 0x1000C402C08F58ALL);
  }

  HGColorMatrix::~HGColorMatrix(this);
}

{
  void *v1;
  uint64_t vars8;

  HgcColorCorrect::~HgcColorCorrect(this);

  HGObject::operator delete(v1);
}

uint64_t HgcColorCorrect::SetParameter(HgcColorCorrect *this, uint64_t a2, float a3, float a4, float a5, float a6, char *a7)
{
  if (a2 > 3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *((void *)this + 62);
  float32x4_t v8 = (float *)(v7 + 16 * a2);
  if (*v8 == a3)
  {
    uint64_t v9 = v7 + 16 * a2;
    if (*(float *)(v9 + 4) == a4 && *(float *)(v9 + 8) == a5 && *(float *)(v7 + 16 * a2 + 12) == a6) {
      return 0;
    }
  }
  *float32x4_t v8 = a3;
  float32x4_t v10 = (float *)(v7 + 16 * a2);
  v10[1] = a4;
  v10[2] = a5;
  v10[3] = a6;
  uint64_t v11 = 1;
  *((_DWORD *)this + 126) = 1;
  HGNode::ClearBits((HGNode *)this, a2, a7);
  return v11;
}

uint64_t HgcColorCorrect::GetParameter(HgcColorCorrect *this, unsigned int a2, float *a3)
{
  if (a2 > 3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  int v5 = (float *)(*((void *)this + 62) + 16 * a2);
  *a3 = *v5;
  a3[1] = v5[1];
  a3[2] = v5[2];
  a3[3] = v5[3];
  return result;
}

HGNode *HgcColorCorrect::GetOutput(HgcColorCorrect *this, HGRenderer *a2, __n128 a3, double a4, int32x2_t a5)
{
  if (*((_DWORD *)this + 126))
  {
    HgcColorCorrect::Setup(this, a2);
    uint64_t v7 = *((void *)this + 62);
    *((_OWORD *)this + 27) = *(_OWORD *)(v7 + 64);
    *((_OWORD *)this + 28) = *(_OWORD *)(v7 + 80);
    *((_OWORD *)this + 29) = *(_OWORD *)(v7 + 96);
    a3 = *(__n128 *)(v7 + 112);
    *((__n128 *)this + 30) = a3;
    *((_DWORD *)this + 126) = 0;
  }

  return HGColorMatrix::GetOutput(this, a2, a3.n128_f64[0], a4, a5);
}

double HgcColorCorrect::State::State(HgcColorCorrect::State *this)
{
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 4) = xmmword_1B7E736B0;
  *((_OWORD *)this + 5) = xmmword_1B7E736C0;
  *((_OWORD *)this + 6) = xmmword_1B7E736D0;
  *((_OWORD *)this + 7) = xmmword_1B7E734D0;
  *((_OWORD *)this + 8) = xmmword_1B7E736B0;
  *((_OWORD *)this + 9) = xmmword_1B7E736C0;
  *((_OWORD *)this + 10) = xmmword_1B7E736D0;
  *((_OWORD *)this + 11) = xmmword_1B7E734D0;
  *((_OWORD *)this + 12) = *(_OWORD *)"";
  *((_OWORD *)this + 13) = xmmword_1B7E76920;
  *((int32x4_t *)this + 14) = vdupq_n_s32(0x7F7FFFFFu);
  *((_OWORD *)this + 15) = xmmword_1B8388FF0;
  *((_OWORD *)this + 16) = xmmword_1B8389000;
  *((_OWORD *)this + 17) = xmmword_1B8389010;
  *((_OWORD *)this + 18) = xmmword_1B8389020;
  *((_OWORD *)this + 19) = xmmword_1B8389030;
  *((_OWORD *)this + 20) = xmmword_1B8389040;
  *((_OWORD *)this + 21) = xmmword_1B8389050;
  *((_OWORD *)this + 22) = xmmword_1B8389060;
  *((_OWORD *)this + 23) = xmmword_1B8389070;
  *((_OWORD *)this + 24) = xmmword_1B8389080;
  *((_OWORD *)this + 25) = xmmword_1B8389090;
  *((_OWORD *)this + 26) = xmmword_1B83890A0;
  *((_OWORD *)this + 27) = xmmword_1B83890B0;
  *((_OWORD *)this + 28) = xmmword_1B83890C0;
  *((_OWORD *)this + 29) = xmmword_1B83890D0;
  *((_OWORD *)this + 30) = xmmword_1B83890E0;
  *((_OWORD *)this + 31) = xmmword_1B83890F0;
  *((_OWORD *)this + 32) = xmmword_1B8389100;
  *((_OWORD *)this + 33) = xmmword_1B7E751A0;
  *((_OWORD *)this + 34) = xmmword_1B8389110;
  *((_OWORD *)this + 35) = xmmword_1B8389120;
  *((_OWORD *)this + 36) = xmmword_1B7E75360;
  *((_OWORD *)this + 37) = xmmword_1B7E75350;
  *(void *)&long long v1 = 0x3F0000003F000000;
  *((void *)&v1 + 1) = 0x3F0000003F000000;
  *((_OWORD *)this + 38) = xmmword_1B7E752F0;
  *((_OWORD *)this + 39) = v1;
  *((_OWORD *)this + 40) = xmmword_1B8389130;
  *((_OWORD *)this + 41) = xmmword_1B8389140;
  *((_OWORD *)this + 42) = xmmword_1B7E75430;
  *((_OWORD *)this + 43) = xmmword_1B8389150;
  *((_OWORD *)this + 44) = xmmword_1B8389160;
  *((_OWORD *)this + 45) = xmmword_1B8389170;
  *((_OWORD *)this + 46) = xmmword_1B8389180;
  *((_OWORD *)this + 47) = xmmword_1B7E75F30;
  *((_OWORD *)this + 48) = xmmword_1B7E75F20;
  *((_OWORD *)this + 49) = xmmword_1B7E75F10;
  *((_OWORD *)this + 50) = xmmword_1B7E75F00;
  *((_OWORD *)this + 51) = xmmword_1B8389190;
  *((_OWORD *)this + 52) = xmmword_1B83891A0;
  *((_OWORD *)this + 53) = xmmword_1B83891B0;
  double result = 0.000320729741;
  *((_OWORD *)this + 54) = xmmword_1B83891C0;
  *((_OWORD *)this + 55) = xmmword_1B83891D0;
  return result;
}

const char *HgcHighlightHDRRegion::GetProgram(HgcHighlightHDRRegion *this, HGRenderer *a2)
{
  unsigned int Target = HGRenderer::GetTarget(a2, 393216);
  if (Target == 396048)
  {
    if ((*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 20) == 27) {
      return "//Metal1.0     \n"
    }
             "//LEN=0000000345\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< half > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]])\n"
             "{\n"
             "    const half4 c0 = half4(0.06666667014, 1.000000000, 0.07843137532, 0.5764706135);\n"
             "    half4 r0, r1;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0 = (half4) hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy);\n"
             "    r1 = clamp(r0, 0.00000h, 1.00000h);\n"
             "    r0.xyz = r0.xyz - r1.xyz;\n"
             "    r0.xyz = r0.xyz*c0.xxx;\n"
             "    r0.x = fmax(r0.x, r0.y);\n"
             "    r0.x = fmax(r0.x, r0.z);\n"
             "    output.color0 = mix(float4(r1), float4(c0.yzwy), float4(r0.xxxx));\n"
             "    return output;\n"
             "}\n"
             "//MD5=0f491771:8c56129f:a38de618:e328132d\n"
             "//SIG=00400000:00000001:00000001:00000001:0001:0000:0002:0000:0000:0000:0002:0000:0001:01:0:1:0\n";
    else {
      return "//Metal1.0     \n"
    }
             "//LEN=0000000329\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< float > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]])\n"
             "{\n"
             "    const float4 c0 = float4(0.06666667014, 1.000000000, 0.07843137532, 0.5764706135);\n"
             "    float4 r0, r1;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0 = hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy);\n"
             "    r1 = clamp(r0, 0.00000f, 1.00000f);\n"
             "    r0.xyz = r0.xyz - r1.xyz;\n"
             "    r0.xyz = r0.xyz*c0.xxx;\n"
             "    r0.x = fmax(r0.x, r0.y);\n"
             "    r0.x = fmax(r0.x, r0.z);\n"
             "    output.color0 = mix(r1, c0.yzwy, r0.xxxx);\n"
             "    return output;\n"
             "}\n"
             "//MD5=ff467f12:4ce00e31:ad026719:065f9887\n"
             "//SIG=00000000:00000001:00000001:00000000:0001:0000:0002:0000:0000:0000:0002:0000:0001:01:0:1:0\n";
  }
  else if (Target <= 0x6060F {
         || (*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 46))
  }
  {
    return 0;
  }
  else
  {
    return "//GLfs2.0      \n"
           "//LEN=00000002d8\n"
           "#ifndef GL_ES\n"
           "#define lowp\n"
           "#define mediump\n"
           "#define highp\n"
           "#endif\n"
           "#define defaultp mediump\n"
           "uniform defaultp sampler2D hg_Texture0;\n"
           "varying highp vec4 hg_TexCoord0;\n"
           "void main()\n"
           "{\n"
           "    const defaultp vec4 c0 = vec4(0.06666667014, 1.000000000, 0.07843137532, 0.5764706135);\n"
           "    defaultp vec4 r0, r1;\n"
           "\n"
           "    r0 = texture2D(hg_Texture0, hg_TexCoord0.xy);\n"
           "    r1 = clamp(r0, vec4(0.00000), vec4(1.00000));\n"
           "    r0.xyz = r0.xyz - r1.xyz;\n"
           "    r0.xyz = r0.xyz*c0.xxx;\n"
           "    r0.x = max(r0.x, r0.y);\n"
           "    r0.x = max(r0.x, r0.z);\n"
           "    gl_FragColor = mix(r1, c0.yzwy, r0.xxxx);\n"
           "}\n"
           "//MD5=0ddea595:fd350b7b:a63b0c18:7d31ed17\n"
           "//SIG=00000000:00000001:00000001:00000000:0001:0000:0002:0000:0000:0000:0000:0000:0001:01:0:1:0\n";
  }
}

void HgcHighlightHDRRegion::InitProgramDescriptor(HgcHighlightHDRRegion *this, HGProgramDescriptor *a2)
{
  HGProgramDescriptor::SetVisibleShaderWithSource(a2, "HgcHighlightHDRRegion_hgc_visible", "//Metal1.0     \n//LEN=0000000208\n[[ visible ]] FragmentOut HgcHighlightHDRRegion_hgc_visible(const constant float4* hg_Params,\n    float4 color0)\n{\n    const float4 c0 = float4(0.06666667014, 1.000000000, 0.07843137532, 0.5764706135);\n"
    "    float4 r0, r1;\n"
    "    FragmentOut output;\n"
    "\n"
    "    r0 = color0;\n"
    "    r1 = clamp(r0, 0.00000f, 1.00000f);\n"
    "    r0.xyz = r0.xyz - r1.xyz;\n"
    "    r0.xyz = r0.xyz*c0.xxx;\n"
    "    r0.x = fmax(r0.x, r0.y);\n"
    "    r0.x = fmax(r0.x, r0.z);\n"
    "    output.color0 = mix(r1, c0.yzwy, r0.xxxx);\n"
    "    return output;\n"
    "}\n");
  HGProgramDescriptor::SetFragmentFunctionName(a2, "HgcHighlightHDRRegion");
}

void sub_1B7E59828(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, long long a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  *(_DWORD *)(v32 - 64) = 4;
  std::string::basic_string[abi:ne180100]<0>((void *)(v32 - 56), "FragmentOut");
  *(_OWORD *)(v32 - 32) = xmmword_1B7E75170;
  HGProgramDescriptor::SetReturnBinding(v31, v32 - 64);
  if (*(char *)(v32 - 33) < 0) {
    operator delete(*(void **)(v32 - 56));
  }
  memset(v37, 0, 24);
  LODWORD(v33) = 2;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E757E0;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  LODWORD(v33) = 10;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75170;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  HGProgramDescriptor::SetArgumentBindings(v31, v37);
  float32x4_t v33 = (void **)v37;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100](&v33);
}

void sub_1B7E59928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,char a21)
{
  a12 = &a21;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

void sub_1B7E59968()
{
  if (*(char *)(v0 - 33) < 0) {
    operator delete(*(void **)(v0 - 56));
  }
  JUMPOUT(0x1B7E59960);
}

void *HgcHighlightHDRRegion::shaderDescription@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "HgcHighlightHDRRegion [hgc1]");
}

uint64_t HgcHighlightHDRRegion::BindTexture(HgcHighlightHDRRegion *this, HGHandler *a2, int a3)
{
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(HGHandler *, void))(*(void *)a2 + 72))(a2, 0);
  (*(void (**)(HGHandler *, void, void))(*(void *)a2 + 48))(a2, 0, 0);
  HGHandler::TexCoord(a2, 0, 0, 0, 0);
  int v5 = (*(uint64_t (**)(void, uint64_t))(**((void **)a2 + 18) + 128))(*((void *)a2 + 18), 46);
  uint64_t result = 0;
  if (!v5)
  {
    (*(void (**)(HGHandler *))(*(void *)a2 + 168))(a2);
    return 0;
  }
  return result;
}

uint64_t HgcHighlightHDRRegion::Bind(HgcHighlightHDRRegion *this, HGHandler *a2)
{
  return 0;
}

uint64_t HgcHighlightHDRRegion::RenderTile(HgcHighlightHDRRegion *this, HGTile *a2)
{
  int v2 = *((_DWORD *)a2 + 3) - *((_DWORD *)a2 + 1);
  if (v2 >= 1)
  {
    int v3 = 0;
    int v4 = *((_DWORD *)a2 + 2) - *(_DWORD *)a2;
    uint64_t v5 = *((void *)a2 + 2);
    uint64_t v6 = *((void *)a2 + 10);
    uint64_t v7 = 16 * *((int *)a2 + 22);
    uint64_t v8 = 16 * *((int *)a2 + 6);
    do
    {
      if (v4 < 4)
      {
        LODWORD(v36) = 0;
      }
      else
      {
        int v9 = 0;
        uint64_t v10 = 32;
        do
        {
          float32x4_t v11 = *(float32x4_t *)(v6 + v10 - 32);
          float32x4_t v12 = *(float32x4_t *)(v6 + v10 - 16);
          float32x4_t v13 = *(float32x4_t *)(v6 + v10);
          float32x4_t v14 = *(float32x4_t *)(v6 + v10 + 16);
          float32x4_t v15 = (float32x4_t *)*((void *)this + 51);
          float32x4_t v16 = v15[1];
          float32x4_t v17 = vminq_f32(vmaxq_f32(v11, *v15), v16);
          float32x4_t v18 = vminq_f32(vmaxq_f32(v12, *v15), v16);
          float32x4_t v19 = vminq_f32(vmaxq_f32(v13, *v15), v16);
          float32x4_t v20 = vminq_f32(vmaxq_f32(v14, *v15), v16);
          float32x4_t v21 = v15[2];
          float32x4_t v22 = v15[3];
          float32x4_t v23 = vmulq_f32(vsubq_f32(v11, v17), v21);
          float32x4_t v24 = vmulq_f32(vsubq_f32(v12, v18), v21);
          float32x4_t v25 = vmulq_f32(vsubq_f32(v13, v19), v21);
          float32x4_t v26 = vmulq_f32(vsubq_f32(v14, v20), v21);
          float32x4_t v27 = vmaxq_f32(v23, (float32x4_t)vrev64q_s32((int32x4_t)v23));
          float32x4_t v28 = vmaxq_f32(v24, (float32x4_t)vrev64q_s32((int32x4_t)v24));
          float32x4_t v29 = vmaxq_f32(v25, (float32x4_t)vrev64q_s32((int32x4_t)v25));
          float32x4_t v30 = (float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v27, 8uLL);
          v27.i64[1] = v23.i64[1];
          float32x4_t v31 = (float32x4_t)vextq_s8((int8x16_t)v24, (int8x16_t)v28, 8uLL);
          v28.i64[1] = v24.i64[1];
          float32x4_t v32 = vmaxq_f32(v26, (float32x4_t)vrev64q_s32((int32x4_t)v26));
          float32x4_t v33 = (float32x4_t)vextq_s8((int8x16_t)v25, (int8x16_t)v29, 8uLL);
          float32x4_t v34 = (float32x4_t)vextq_s8((int8x16_t)v26, (int8x16_t)v32, 8uLL);
          v29.i64[1] = v25.i64[1];
          v32.i64[1] = v26.i64[1];
          char v35 = (float32x4_t *)(v5 + v10);
          v35[-2] = vmlaq_n_f32(v17, vsubq_f32(v22, v17), vmaxq_f32(v27, v30).f32[0]);
          v35[-1] = vmlaq_n_f32(v18, vsubq_f32(v22, v18), vmaxq_f32(v28, v31).f32[0]);
          float32x4_t *v35 = vmlaq_n_f32(v19, vsubq_f32(v22, v19), vmaxq_f32(v29, v33).f32[0]);
          v35[1] = vmlaq_n_f32(v20, vsubq_f32(v22, v20), vmaxq_f32(v32, v34).f32[0]);
          v9 -= 4;
          v10 += 64;
        }
        while (v4 + v9 > 3);
        LODWORD(v36) = -v9;
      }
      if ((int)v36 < v4)
      {
        uint64_t v36 = v36;
        do
        {
          float32x4_t v37 = *(float32x4_t *)(v6 + 16 * v36);
          float32x4_t v38 = (float32x4_t *)*((void *)this + 51);
          float32x4_t v39 = vminq_f32(vmaxq_f32(v37, *v38), v38[1]);
          float32x4_t v40 = vmulq_f32(vsubq_f32(v37, v39), v38[2]);
          float32x4_t v41 = vmaxq_f32(v40, (float32x4_t)vrev64q_s32((int32x4_t)v40));
          float32x4_t v42 = (float32x4_t)vextq_s8((int8x16_t)v40, (int8x16_t)v41, 8uLL);
          v41.i64[1] = v40.i64[1];
          *(float32x4_t *)(v5 + 16 * v36++) = vmlaq_n_f32(v39, vsubq_f32(v38[3], v39), vmaxq_f32(v41, v42).f32[0]);
        }
        while (v36 < v4);
      }
      ++v3;
      v6 += v7;
      v5 += v8;
    }
    while (v3 != v2);
  }
  return 0;
}

uint64_t HgcHighlightHDRRegion::GetDOD(HgcHighlightHDRRegion *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

uint64_t HgcHighlightHDRRegion::GetROI(HgcHighlightHDRRegion *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

void HgcHighlightHDRRegion::HgcHighlightHDRRegion(HgcHighlightHDRRegion *this)
{
  HGNode::HGNode((HGNode *)this);
  void *v1 = &unk_1F119BBE0;
  operator new();
}

void sub_1B7E59D50(_Unwind_Exception *a1)
{
  HGNode::~HGNode(v1);
  _Unwind_Resume(a1);
}

void HgcHighlightHDRRegion::~HgcHighlightHDRRegion(HGNode *this)
{
  *(void *)this = &unk_1F119BBE0;
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    MEMORY[0x1BA9BFBA0](v2, 0x1000C40FA0F61DDLL);
  }

  HGNode::~HGNode(this);
}

{
  void *v1;
  uint64_t vars8;

  HgcHighlightHDRRegion::~HgcHighlightHDRRegion(this);

  HGObject::operator delete(v1);
}

uint64_t HgcHighlightHDRRegion::SetParameter(HgcHighlightHDRRegion *this, float a2, float a3, float a4, float a5)
{
  return 0xFFFFFFFFLL;
}

uint64_t HgcHighlightHDRRegion::GetParameter(HgcHighlightHDRRegion *this, int a2, float *a3)
{
  return 0xFFFFFFFFLL;
}

const char *HgcOverexposureCheck::GetProgram(HgcOverexposureCheck *this, HGRenderer *a2)
{
  unsigned int Target = HGRenderer::GetTarget(a2, 393216);
  if (Target == 396048)
  {
    if ((*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 20) == 27) {
      return "//Metal1.0     \n"
    }
             "//LEN=00000002e9\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< half > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]])\n"
             "{\n"
             "    const half4 c0 = half4(0.000000000, 1.000000000, 0.000000000, 0.000000000);\n"
             "    half4 r0;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0.xyz = (half3) hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy).xyz;\n"
             "    r0.xyz = fmax(r0.xyz, c0.xxx);\n"
             "    output.color0.x = dot(float3(r0.xyz), hg_Params[0].xyz);\n"
             "    output.color0.yzw = float3(c0.xxy);\n"
             "    return output;\n"
             "}\n"
             "//MD5=753e7e49:4673b5e4:9999ef5b:0a25a395\n"
             "//SIG=00400000:00000001:00000001:00000001:0001:0001:0001:0000:0000:0000:0002:0000:0001:01:0:1:0\n";
    else {
      return "//Metal1.0     \n"
    }
             "//LEN=00000002d5\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< float > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]])\n"
             "{\n"
             "    const float4 c0 = float4(0.000000000, 1.000000000, 0.000000000, 0.000000000);\n"
             "    float4 r0;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0.xyz = hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy).xyz;\n"
             "    r0.xyz = fmax(r0.xyz, c0.xxx);\n"
             "    output.color0.x = dot(r0.xyz, hg_Params[0].xyz);\n"
             "    output.color0.yzw = c0.xxy;\n"
             "    return output;\n"
             "}\n"
             "//MD5=08055fc8:a19b68f0:107c0018:aa18a62e\n"
             "//SIG=00000000:00000001:00000001:00000000:0001:0001:0001:0000:0000:0000:0002:0000:0001:01:0:1:0\n";
  }
  else if (Target <= 0x6060F {
         || (*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 46))
  }
  {
    return 0;
  }
  else
  {
    return "//GLfs2.0      \n"
           "//LEN=00000002a6\n"
           "#ifndef GL_ES\n"
           "#define lowp\n"
           "#define mediump\n"
           "#define highp\n"
           "#endif\n"
           "#define defaultp mediump\n"
           "uniform defaultp sampler2D hg_Texture0;\n"
           "uniform defaultp vec4 hg_ProgramLocal0;\n"
           "varying highp vec4 hg_TexCoord0;\n"
           "void main()\n"
           "{\n"
           "    const defaultp vec4 c0 = vec4(0.000000000, 1.000000000, 0.000000000, 0.000000000);\n"
           "    defaultp vec4 r0;\n"
           "\n"
           "    r0.xyz = texture2D(hg_Texture0, hg_TexCoord0.xy).xyz;\n"
           "    r0.xyz = max(r0.xyz, c0.xxx);\n"
           "    gl_FragColor.x = dot(r0.xyz, hg_ProgramLocal0.xyz);\n"
           "    gl_FragColor.yzw = c0.xxy;\n"
           "}\n"
           "//MD5=d59f6280:a2ae589f:7caf7a89:92a20f17\n"
           "//SIG=00000000:00000001:00000001:00000000:0001:0001:0001:0000:0000:0000:0000:0000:0001:01:0:1:0\n";
  }
}

void HgcOverexposureCheck::InitProgramDescriptor(HgcOverexposureCheck *this, HGProgramDescriptor *a2)
{
  HGProgramDescriptor::SetVisibleShaderWithSource(a2, "HgcOverexposureCheck_hgc_visible", "//Metal1.0     \n//LEN=00000001b3\n[[ visible ]] FragmentOut HgcOverexposureCheck_hgc_visible(const constant float4* hg_Params,\n    float4 color0)\n{\n    const float4 c0 = float4(0.000000000, 1.000000000, 0.000000000, 0.000000000);\n"
    "    float4 r0;\n"
    "    FragmentOut output;\n"
    "\n"
    "    r0.xyz = color0.xyz;\n"
    "    r0.xyz = fmax(r0.xyz, c0.xxx);\n"
    "    output.color0.x = dot(r0.xyz, hg_Params[0].xyz);\n"
    "    output.color0.yzw = c0.xxy;\n"
    "    return output;\n"
    "}\n");
  HGProgramDescriptor::SetFragmentFunctionName(a2, "HgcOverexposureCheck");
}

void sub_1B7E59F24(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, long long a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  *(_DWORD *)(v32 - 64) = 4;
  std::string::basic_string[abi:ne180100]<0>((void *)(v32 - 56), "FragmentOut");
  *(_OWORD *)(v32 - 32) = xmmword_1B7E75170;
  HGProgramDescriptor::SetReturnBinding(v31, v32 - 64);
  if (*(char *)(v32 - 33) < 0) {
    operator delete(*(void **)(v32 - 56));
  }
  memset(v37, 0, 24);
  LODWORD(v33) = 2;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75770;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  LODWORD(v33) = 10;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75170;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  HGProgramDescriptor::SetArgumentBindings(v31, v37);
  float32x4_t v33 = (void **)v37;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100](&v33);
}

void sub_1B7E5A024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,char a21)
{
  a12 = &a21;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

void sub_1B7E5A064()
{
  if (*(char *)(v0 - 33) < 0) {
    operator delete(*(void **)(v0 - 56));
  }
  JUMPOUT(0x1B7E5A05CLL);
}

void *HgcOverexposureCheck::shaderDescription@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "HgcOverexposureCheck [hgc1]");
}

uint64_t HgcOverexposureCheck::BindTexture(HgcOverexposureCheck *this, HGHandler *a2, int a3)
{
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(HGHandler *, void))(*(void *)a2 + 72))(a2, 0);
  (*(void (**)(HGHandler *, void, void))(*(void *)a2 + 48))(a2, 0, 0);
  HGHandler::TexCoord(a2, 0, 0, 0, 0);
  int v5 = (*(uint64_t (**)(void, uint64_t))(**((void **)a2 + 18) + 128))(*((void *)a2 + 18), 46);
  uint64_t result = 0;
  if (!v5)
  {
    (*(void (**)(HGHandler *))(*(void *)a2 + 168))(a2);
    return 0;
  }
  return result;
}

uint64_t HgcOverexposureCheck::Bind(HgcOverexposureCheck *this, HGHandler *a2)
{
  return 0;
}

uint64_t HgcOverexposureCheck::RenderTile(HgcOverexposureCheck *this, HGTile *a2)
{
  int v2 = *((_DWORD *)a2 + 3) - *((_DWORD *)a2 + 1);
  if (v2 >= 1)
  {
    int v3 = 0;
    int v4 = *((_DWORD *)a2 + 2) - *(_DWORD *)a2;
    uint64_t v5 = *((void *)a2 + 2);
    uint64_t v6 = *((void *)a2 + 10);
    uint64_t v7 = 16 * *((int *)a2 + 22);
    uint64_t v8 = 16 * *((int *)a2 + 6);
    do
    {
      if (v4 < 4)
      {
        LODWORD(v19) = 0;
      }
      else
      {
        int v9 = 0;
        uint64_t v10 = 32;
        do
        {
          uint64_t v11 = *((void *)this + 51);
          float32x4_t v12 = *(float32x4_t *)(v11 + 16);
          float32x4_t v13 = vmulq_f32(vmaxq_f32(*(float32x4_t *)(v6 + v10 - 32), v12), *(float32x4_t *)v11);
          float32x4_t v14 = vmulq_f32(vmaxq_f32(*(float32x4_t *)(v6 + v10 - 16), v12), *(float32x4_t *)v11);
          float32x4_t v15 = vmulq_f32(vmaxq_f32(*(float32x4_t *)(v6 + v10), v12), *(float32x4_t *)v11);
          float32x4_t v16 = vmulq_f32(vmaxq_f32(*(float32x4_t *)(v6 + v10 + 16), v12), *(float32x4_t *)v11);
          int8x16_t v17 = *(int8x16_t *)(v11 + 32);
          float32x4_t v18 = (int8x16_t *)(v5 + v10);
          v18[-2] = vbslq_s8(v17, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v13, (int8x16_t)v13, 8uLL), vaddq_f32(v13, (float32x4_t)vrev64q_s32((int32x4_t)v13))), (int8x16_t)v12);
          v18[-1] = vbslq_s8(v17, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v14, (int8x16_t)v14, 8uLL), vaddq_f32(v14, (float32x4_t)vrev64q_s32((int32x4_t)v14))), (int8x16_t)v12);
          int8x16_t *v18 = vbslq_s8(v17, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v15, 8uLL), vaddq_f32(v15, (float32x4_t)vrev64q_s32((int32x4_t)v15))), (int8x16_t)v12);
          v18[1] = vbslq_s8(v17, (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL), vaddq_f32(v16, (float32x4_t)vrev64q_s32((int32x4_t)v16))), (int8x16_t)v12);
          v9 -= 4;
          v10 += 64;
        }
        while (v4 + v9 > 3);
        LODWORD(v19) = -v9;
      }
      if ((int)v19 < v4)
      {
        uint64_t v19 = v19;
        do
        {
          uint64_t v20 = *((void *)this + 51);
          float32x4_t v21 = *(float32x4_t *)(v20 + 16);
          float32x4_t v22 = vmulq_f32(vmaxq_f32(*(float32x4_t *)(v6 + 16 * v19), v21), *(float32x4_t *)v20);
          *(int8x16_t *)(v5 + 16 * v19++) = vbslq_s8(*(int8x16_t *)(v20 + 32), (int8x16_t)vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v22, (int8x16_t)v22, 8uLL), vaddq_f32(v22, (float32x4_t)vrev64q_s32((int32x4_t)v22))), (int8x16_t)v21);
        }
        while (v19 < v4);
      }
      ++v3;
      v6 += v7;
      v5 += v8;
    }
    while (v3 != v2);
  }
  return 0;
}

uint64_t HgcOverexposureCheck::GetDOD(HgcOverexposureCheck *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

uint64_t HgcOverexposureCheck::GetROI(HgcOverexposureCheck *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

void HgcOverexposureCheck::HgcOverexposureCheck(HgcOverexposureCheck *this)
{
  HGNode::HGNode((HGNode *)this);
  void *v1 = &unk_1F119BE48;
  operator new();
}

void sub_1B7E5A440(_Unwind_Exception *a1)
{
  HGNode::~HGNode(v1);
  _Unwind_Resume(a1);
}

void HgcOverexposureCheck::~HgcOverexposureCheck(HGNode *this)
{
  *(void *)this = &unk_1F119BE48;
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    MEMORY[0x1BA9BFBA0](v2, 0x1000C40EED21634);
  }

  HGNode::~HGNode(this);
}

{
  void *v1;
  uint64_t vars8;

  HgcOverexposureCheck::~HgcOverexposureCheck(this);

  HGObject::operator delete(v1);
}

uint64_t HgcOverexposureCheck::SetParameter(HgcOverexposureCheck *this, uint64_t a2, float a3, float a4, float a5, float a6, char *a7)
{
  if (a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = (float *)*((void *)this + 51);
  if (*v8 == a3 && v8[1] == a4 && v8[2] == a5 && v8[3] == a6) {
    return 0;
  }
  *uint64_t v8 = a3;
  v8[1] = a4;
  v8[2] = a5;
  v8[3] = a6;
  HGNode::ClearBits((HGNode *)this, a2, a7);
  return 1;
}

float HgcOverexposureCheck::GetParameter(HgcOverexposureCheck *this, int a2, float *a3)
{
  if (!a2)
  {
    int v3 = (float *)*((void *)this + 51);
    *a3 = *v3;
    a3[1] = v3[1];
    a3[2] = v3[2];
    float result = v3[3];
    a3[3] = result;
  }
  return result;
}

const char *HgcHighlightOutOfGamut::GetProgram(HgcHighlightOutOfGamut *this, HGRenderer *a2)
{
  unsigned int Target = HGRenderer::GetTarget(a2, 393216);
  if (Target == 396048)
  {
    if ((*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 20) == 27) {
      return "//Metal1.0     \n"
    }
             "//LEN=000000048f\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< half > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]])\n"
             "{\n"
             "    const half4 c0 = half4(0.000000000, 1.000000000, -0.5500000119, 0.000000000);\n"
             "    half4 r0, r1;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0 = (half4) hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy);\n"
             "    r1.y = half(c0.y < r0.x);\n"
             "    r1.x = half(r0.x < c0.x);\n"
             "    r1.z = fmax(r1.x, r1.y);\n"
             "    r1.x = half(r0.y < c0.x);\n"
             "    r1.y = half(c0.y < r0.y);\n"
             "    r1.x = fmax(r1.z, r1.x);\n"
             "    r1.z = fmax(r1.x, r1.y);\n"
             "    r1.x = half(r0.z < c0.x);\n"
             "    r1.y = half(c0.y < r0.z);\n"
             "    r1.x = fmax(r1.z, r1.x);\n"
             "    r1.x = fmax(r1.x, r1.y);\n"
             "    r1 = select(r0, c0.yyyy, -r1.xxxx < 0.00000h);\n"
             "    r0.xyz = half3(r0.xyz < c0.zzz);\n"
             "    r0.x = clamp(dot(r0.xyz, 1.00000h), 0.00000h, 1.00000h);\n"
             "    output.color0 = select(float4(r1), float4(c0.yxxy), -float4(r0.xxxx) < 0.00000h);\n"
             "    return output;\n"
             "}\n"
             "//MD5=4c1f3fc4:fa2dabe7:592aa5f7:1ffd7108\n"
             "//SIG=00400000:00000001:00000001:00000001:0001:0000:0002:0000:0000:0000:0002:0000:0001:01:0:1:0\n";
    else {
      return "//Metal1.0     \n"
    }
             "//LEN=000000047a\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< float > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]])\n"
             "{\n"
             "    const float4 c0 = float4(0.000000000, 1.000000000, -0.5500000119, 0.000000000);\n"
             "    float4 r0, r1;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0 = hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy);\n"
             "    r1.y = float(c0.y < r0.x);\n"
             "    r1.x = float(r0.x < c0.x);\n"
             "    r1.z = fmax(r1.x, r1.y);\n"
             "    r1.x = float(r0.y < c0.x);\n"
             "    r1.y = float(c0.y < r0.y);\n"
             "    r1.x = fmax(r1.z, r1.x);\n"
             "    r1.z = fmax(r1.x, r1.y);\n"
             "    r1.x = float(r0.z < c0.x);\n"
             "    r1.y = float(c0.y < r0.z);\n"
             "    r1.x = fmax(r1.z, r1.x);\n"
             "    r1.x = fmax(r1.x, r1.y);\n"
             "    r1 = select(r0, c0.yyyy, -r1.xxxx < 0.00000f);\n"
             "    r0.xyz = float3(r0.xyz < c0.zzz);\n"
             "    r0.x = clamp(dot(r0.xyz, 1.00000f), 0.00000f, 1.00000f);\n"
             "    output.color0 = select(r1, c0.yxxy, -r0.xxxx < 0.00000f);\n"
             "    return output;\n"
             "}\n"
             "//MD5=e76d530a:353c1e57:61a46793:02f7204a\n"
             "//SIG=00000000:00000001:00000001:00000000:0001:0000:0002:0000:0000:0000:0002:0000:0001:01:0:1:0\n";
  }
  else if (Target <= 0x6060F {
         || (*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 46))
  }
  {
    return 0;
  }
  else
  {
    return "//GLfs2.0      \n"
           "//LEN=00000004d6\n"
           "#ifndef GL_ES\n"
           "#define lowp\n"
           "#define mediump\n"
           "#define highp\n"
           "#endif\n"
           "#define defaultp mediump\n"
           "uniform defaultp sampler2D hg_Texture0;\n"
           "varying highp vec4 hg_TexCoord0;\n"
           "void main()\n"
           "{\n"
           "    const defaultp vec4 c0 = vec4(0.000000000, 1.000000000, -0.5500000119, 0.000000000);\n"
           "    defaultp vec4 r0, r1;\n"
           "\n"
           "    r0 = texture2D(hg_Texture0, hg_TexCoord0.xy);\n"
           "    r1.y = float(c0.y < r0.x);\n"
           "    r1.x = float(r0.x < c0.x);\n"
           "    r1.z = max(r1.x, r1.y);\n"
           "    r1.x = float(r0.y < c0.x);\n"
           "    r1.y = float(c0.y < r0.y);\n"
           "    r1.x = max(r1.z, r1.x);\n"
           "    r1.z = max(r1.x, r1.y);\n"
           "    r1.x = float(r0.z < c0.x);\n"
           "    r1.y = float(c0.y < r0.z);\n"
           "    r1.x = max(r1.z, r1.x);\n"
           "    r1.x = max(r1.x, r1.y);\n"
           "    r1 = vec4(-r1.x < 0.00000 ? c0.y : r0.x, -r1.x < 0.00000 ? c0.y : r0.y, -r1.x < 0.00000 ? c0.y : r0.z, -r"
           "1.x < 0.00000 ? c0.y : r0.w);\n"
           "    r0.xyz = vec3(lessThan(r0.xyz, c0.zzz));\n"
           "    r0.x = clamp(dot(r0.xyz, vec3(1.00000)), 0.00000, 1.00000);\n"
           "    gl_FragColor = vec4(-r0.x < 0.00000 ? c0.y : r1.x, -r0.x < 0.00000 ? c0.x : r1.y, -r0.x < 0.00000 ? c0.x "
           ": r1.z, -r0.x < 0.00000 ? c0.y : r1.w);\n"
           "}\n"
           "//MD5=60e8fc88:1fb00940:828ef5e9:c741a039\n"
           "//SIG=00000000:00000001:00000001:00000000:0001:0000:0002:0000:0000:0000:0000:0000:0001:01:0:1:0\n";
  }
}

void HgcHighlightOutOfGamut::InitProgramDescriptor(HgcHighlightOutOfGamut *this, HGProgramDescriptor *a2)
{
  HGProgramDescriptor::SetVisibleShaderWithSource(a2, "HgcHighlightOutOfGamut_hgc_visible", "//Metal1.0     \n//LEN=000000035a\n[[ visible ]] FragmentOut HgcHighlightOutOfGamut_hgc_visible(const constant float4* hg_Params,\n    float4 color0)\n{\n    const float4 c0 = float4(0.000000000, 1.000000000, -0.5500000119, 0.000000000);\n"
    "    float4 r0, r1;\n"
    "    FragmentOut output;\n"
    "\n"
    "    r0 = color0;\n"
    "    r1.y = float(c0.y < r0.x);\n"
    "    r1.x = float(r0.x < c0.x);\n"
    "    r1.z = fmax(r1.x, r1.y);\n"
    "    r1.x = float(r0.y < c0.x);\n"
    "    r1.y = float(c0.y < r0.y);\n"
    "    r1.x = fmax(r1.z, r1.x);\n"
    "    r1.z = fmax(r1.x, r1.y);\n"
    "    r1.x = float(r0.z < c0.x);\n"
    "    r1.y = float(c0.y < r0.z);\n"
    "    r1.x = fmax(r1.z, r1.x);\n"
    "    r1.x = fmax(r1.x, r1.y);\n"
    "    r1 = select(r0, c0.yyyy, -r1.xxxx < 0.00000f);\n"
    "    r0.xyz = float3(r0.xyz < c0.zzz);\n"
    "    r0.x = clamp(dot(r0.xyz, 1.00000f), 0.00000f, 1.00000f);\n"
    "    output.color0 = select(r1, c0.yxxy, -r0.xxxx < 0.00000f);\n"
    "    return output;\n"
    "}\n");
  HGProgramDescriptor::SetFragmentFunctionName(a2, "HgcHighlightOutOfGamut");
}

void sub_1B7E5A6B0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, long long a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  *(_DWORD *)(v32 - 64) = 4;
  std::string::basic_string[abi:ne180100]<0>((void *)(v32 - 56), "FragmentOut");
  *(_OWORD *)(v32 - 32) = xmmword_1B7E75170;
  HGProgramDescriptor::SetReturnBinding(v31, v32 - 64);
  if (*(char *)(v32 - 33) < 0) {
    operator delete(*(void **)(v32 - 56));
  }
  memset(v37, 0, 24);
  LODWORD(v33) = 2;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E757E0;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  LODWORD(v33) = 10;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75170;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  HGProgramDescriptor::SetArgumentBindings(v31, v37);
  float32x4_t v33 = (void **)v37;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100](&v33);
}

void sub_1B7E5A7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,char a21)
{
  a12 = &a21;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

void sub_1B7E5A7F0()
{
  if (*(char *)(v0 - 33) < 0) {
    operator delete(*(void **)(v0 - 56));
  }
  JUMPOUT(0x1B7E5A7E8);
}

void *HgcHighlightOutOfGamut::shaderDescription@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "HgcHighlightOutOfGamut [hgc1]");
}

uint64_t HgcHighlightOutOfGamut::BindTexture(HgcHighlightOutOfGamut *this, HGHandler *a2, int a3)
{
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(HGHandler *, void))(*(void *)a2 + 72))(a2, 0);
  (*(void (**)(HGHandler *, void, void))(*(void *)a2 + 48))(a2, 0, 0);
  HGHandler::TexCoord(a2, 0, 0, 0, 0);
  int v5 = (*(uint64_t (**)(void, uint64_t))(**((void **)a2 + 18) + 128))(*((void *)a2 + 18), 46);
  uint64_t result = 0;
  if (!v5)
  {
    (*(void (**)(HGHandler *))(*(void *)a2 + 168))(a2);
    return 0;
  }
  return result;
}

uint64_t HgcHighlightOutOfGamut::Bind(HgcHighlightOutOfGamut *this, HGHandler *a2)
{
  return 0;
}

uint64_t HgcHighlightOutOfGamut::RenderTile(HgcHighlightOutOfGamut *this, HGTile *a2)
{
  int v2 = *((_DWORD *)a2 + 3) - *((_DWORD *)a2 + 1);
  if (v2 >= 1)
  {
    int v3 = 0;
    int v4 = *((_DWORD *)a2 + 2) - *(_DWORD *)a2;
    uint64_t v5 = *((void *)a2 + 2);
    uint64_t v6 = *((void *)a2 + 10);
    uint64_t v7 = 16 * *((int *)a2 + 22);
    uint64_t v8 = 16 * *((int *)a2 + 6);
    do
    {
      if (v4 < 4)
      {
        LODWORD(v52) = 0;
      }
      else
      {
        int v9 = 0;
        uint64_t v10 = 32;
        do
        {
          float32x4_t v12 = *(float32x4_t *)(v6 + v10 - 32);
          float32x4_t v11 = *(float32x4_t *)(v6 + v10 - 16);
          float32x4_t v13 = *(float32x4_t *)(v6 + v10);
          float32x4_t v14 = *(float32x4_t *)(v6 + v10 + 16);
          float32x4_t v15 = (float32x4_t)vrev64q_s32((int32x4_t)v12);
          float32x4_t v16 = (float32x4_t)vrev64q_s32((int32x4_t)v11);
          float32x4_t v17 = (float32x4_t)vrev64q_s32((int32x4_t)v13);
          uint64_t v18 = *((void *)this + 51);
          float32x4_t v19 = *(float32x4_t *)(v18 + 16);
          float32x4_t v20 = (float32x4_t)vrev64q_s32((int32x4_t)v14);
          int8x16_t v21 = *(int8x16_t *)(v18 + 32);
          int8x16_t v22 = *(int8x16_t *)(v18 + 48);
          int8x16_t v23 = vbslq_s8(v21, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(*(float32x4_t *)v18, v12)), vandq_s8(*(int8x16_t *)v18, (int8x16_t)vcgtq_f32(v15, *(float32x4_t *)v18)));
          int8x16_t v24 = vbslq_s8(v21, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(*(float32x4_t *)v18, v11)), vandq_s8(*(int8x16_t *)v18, (int8x16_t)vcgtq_f32(v16, *(float32x4_t *)v18)));
          int8x16_t v25 = vbslq_s8(v21, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(*(float32x4_t *)v18, v13)), vandq_s8(*(int8x16_t *)v18, (int8x16_t)vcgtq_f32(v17, *(float32x4_t *)v18)));
          int8x16_t v26 = vbslq_s8(v21, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(*(float32x4_t *)v18, v14)), vandq_s8(*(int8x16_t *)v18, (int8x16_t)vcgtq_f32(v20, *(float32x4_t *)v18)));
          v15.i64[0] = vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(*(float32x4_t *)v18, v15)).u64[0];
          v16.i64[0] = vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(*(float32x4_t *)v18, v16)).u64[0];
          v17.i64[0] = vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(*(float32x4_t *)v18, v17)).u64[0];
          v15.i64[1] = vmaxq_f32((float32x4_t)vextq_s8(v23, v23, 8uLL), (float32x4_t)vextq_s8(v23, v23, 0xCuLL)).i64[1];
          v16.i64[1] = vmaxq_f32((float32x4_t)vextq_s8(v24, v24, 8uLL), (float32x4_t)vextq_s8(v24, v24, 0xCuLL)).i64[1];
          v17.i64[1] = vmaxq_f32((float32x4_t)vextq_s8(v25, v25, 8uLL), (float32x4_t)vextq_s8(v25, v25, 0xCuLL)).i64[1];
          v20.i64[0] = vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(*(float32x4_t *)v18, v20)).u64[0];
          v20.i64[1] = vmaxq_f32((float32x4_t)vextq_s8(v26, v26, 8uLL), (float32x4_t)vextq_s8(v26, v26, 0xCuLL)).i64[1];
          float32x4_t v27 = (float32x4_t)vbslq_s8(v22, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(v12, v19)), (int8x16_t)v15);
          float32x4_t v28 = (float32x4_t)vbslq_s8(v22, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(v11, v19)), (int8x16_t)v16);
          float32x4_t v29 = (float32x4_t)vbslq_s8(v22, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(v13, v19)), (int8x16_t)v17);
          float32x4_t v30 = (float32x4_t)vbslq_s8(v22, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32(v14, v19)), (int8x16_t)v20);
          int8x16_t v31 = vbslq_s8(v21, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL), v27), (int8x16_t)v27);
          int8x16_t v32 = vbslq_s8(v21, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL), v28), (int8x16_t)v28);
          int8x16_t v33 = vbslq_s8(v21, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v29, (int8x16_t)v29, 8uLL), v29), (int8x16_t)v29);
          int8x16_t v34 = vbslq_s8(v21, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)v30, 8uLL), v30), (int8x16_t)v30);
          float32x4_t v35 = (float32x4_t)vbslq_s8(v22, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32((float32x4_t)vextq_s8((int8x16_t)v12, (int8x16_t)v12, 4uLL), v19)), (int8x16_t)vzip2q_s64((int64x2_t)vandq_s8(*(int8x16_t *)v18, (int8x16_t)vcgtq_f32(v19, v12)), (int64x2_t)vmaxq_f32((float32x4_t)vextq_s8(v31, v31, 8uLL), (float32x4_t)vextq_s8(v31, v31, 0xCuLL))));
          float32x4_t v36 = (float32x4_t)vbslq_s8(v22, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32((float32x4_t)vextq_s8((int8x16_t)v11, (int8x16_t)v11, 4uLL), v19)), (int8x16_t)vzip2q_s64((int64x2_t)vandq_s8(*(int8x16_t *)v18, (int8x16_t)vcgtq_f32(v19, v11)), (int64x2_t)vmaxq_f32((float32x4_t)vextq_s8(v32, v32, 8uLL), (float32x4_t)vextq_s8(v32, v32, 0xCuLL))));
          float32x4_t v37 = (float32x4_t)vbslq_s8(v22, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32((float32x4_t)vextq_s8((int8x16_t)v13, (int8x16_t)v13, 4uLL), v19)), (int8x16_t)vzip2q_s64((int64x2_t)vandq_s8(*(int8x16_t *)v18, (int8x16_t)vcgtq_f32(v19, v13)), (int64x2_t)vmaxq_f32((float32x4_t)vextq_s8(v33, v33, 8uLL), (float32x4_t)vextq_s8(v33, v33, 0xCuLL))));
          float32x4_t v38 = (float32x4_t)vbslq_s8(v22, vandq_s8((int8x16_t)v19, (int8x16_t)vcgtq_f32((float32x4_t)vextq_s8((int8x16_t)v14, (int8x16_t)v14, 4uLL), v19)), (int8x16_t)vzip2q_s64((int64x2_t)vandq_s8(*(int8x16_t *)v18, (int8x16_t)vcgtq_f32(v19, v14)), (int64x2_t)vmaxq_f32((float32x4_t)vextq_s8(v34, v34, 8uLL), (float32x4_t)vextq_s8(v34, v34, 0xCuLL))));
          int32x2_t v39 = (int32x2_t)vbslq_s8(v21, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v35, (int8x16_t)v35, 8uLL), v35), (int8x16_t)v35).u64[0];
          v35.i64[0] = vbslq_s8(v21, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v36, (int8x16_t)v36, 8uLL), v36), (int8x16_t)v36).u64[0];
          v36.i64[0] = vbslq_s8(v21, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL), v37), (int8x16_t)v37).u64[0];
          v21.i64[0] = vbslq_s8(v21, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v38, 8uLL), v38), (int8x16_t)v38).u64[0];
          float32x4_t v40 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.i8, 1);
          float32x4_t v41 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.i8, 0);
          float32x4_t v43 = *(float32x4_t *)(v18 + 64);
          float32x4_t v42 = *(float32x4_t *)(v18 + 80);
          float32x4_t v44 = *(float32x4_t *)(v18 + 96);
          int8x16_t v45 = *(int8x16_t *)(v18 + 112);
          float32x4_t v46 = (float32x4_t)vandq_s8((int8x16_t)v43, (int8x16_t)vcgtq_f32(v44, v12));
          float32x4_t v47 = vmaxq_f32(v41, v40);
          float32x4_t v48 = (float32x4_t)vandq_s8((int8x16_t)v43, (int8x16_t)vcgtq_f32(v44, v11));
          float32x4_t v49 = (float32x4_t)vandq_s8((int8x16_t)v43, (int8x16_t)vcgtq_f32(v44, v13));
          float32x4_t v50 = (float32x4_t)vandq_s8((int8x16_t)v43, (int8x16_t)vcgtq_f32(v44, v14));
          float32x4_t v51 = (int8x16_t *)(v5 + v10);
          v51[-2] = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vminq_f32(vmaxq_f32(vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v46, (int8x16_t)v46, 8uLL), vaddq_f32((float32x4_t)vrev64q_s32((int32x4_t)v46), v46)), v42), v43), 0), v42), v45, vbslq_s8((int8x16_t)vcgtq_f32(
                                     vmaxq_f32((float32x4_t)vdupq_lane_s32(v39, 0), (float32x4_t)vdupq_lane_s32(v39, 1)),
                                     v42),
                        (int8x16_t)v43,
                        (int8x16_t)v12));
          v51[-1] = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vminq_f32(vmaxq_f32(vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v48, (int8x16_t)v48, 8uLL), vaddq_f32((float32x4_t)vrev64q_s32((int32x4_t)v48), v48)), v42), v43), 0), v42), v45, vbslq_s8((int8x16_t)vcgtq_f32(
                                     vmaxq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 0), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1)), v42), (int8x16_t)v43, (int8x16_t)v11));
          *float32x4_t v51 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vminq_f32(vmaxq_f32(vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v49, (int8x16_t)v49, 8uLL), vaddq_f32((float32x4_t)vrev64q_s32((int32x4_t)v49), v49)), v42), v43), 0), v42), v45, vbslq_s8((int8x16_t)vcgtq_f32(
                                  vmaxq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 0), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1)), v42), (int8x16_t)v43, (int8x16_t)v13));
          v51[1] = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vminq_f32(vmaxq_f32(vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v50, (int8x16_t)v50, 8uLL), vaddq_f32((float32x4_t)vrev64q_s32((int32x4_t)v50), v50)), v42), v43), 0), v42), v45, vbslq_s8((int8x16_t)vcgtq_f32(v47, v42), (int8x16_t)v43, (int8x16_t)v14));
          v9 -= 4;
          v10 += 64;
        }
        while (v4 + v9 > 3);
        LODWORD(v52) = -v9;
      }
      if ((int)v52 < v4)
      {
        uint64_t v52 = v52;
        do
        {
          float32x4_t v53 = *(float32x4_t *)(v6 + 16 * v52);
          float32x4_t v54 = (float32x4_t)vrev64q_s32((int32x4_t)v53);
          uint64_t v55 = *((void *)this + 51);
          float32x4_t v56 = *(float32x4_t *)(v55 + 16);
          int8x16_t v57 = *(int8x16_t *)(v55 + 32);
          int8x16_t v58 = *(int8x16_t *)(v55 + 48);
          int8x16_t v59 = vbslq_s8(v57, vandq_s8((int8x16_t)v56, (int8x16_t)vcgtq_f32(*(float32x4_t *)v55, v53)), vandq_s8(*(int8x16_t *)v55, (int8x16_t)vcgtq_f32(v54, *(float32x4_t *)v55)));
          v54.i64[0] = vandq_s8((int8x16_t)v56, (int8x16_t)vcgtq_f32(*(float32x4_t *)v55, v54)).u64[0];
          v54.i64[1] = vmaxq_f32((float32x4_t)vextq_s8(v59, v59, 8uLL), (float32x4_t)vextq_s8(v59, v59, 0xCuLL)).i64[1];
          float32x4_t v60 = (float32x4_t)vbslq_s8(v58, vandq_s8((int8x16_t)v56, (int8x16_t)vcgtq_f32(v53, v56)), (int8x16_t)v54);
          int8x16_t v61 = vbslq_s8(v57, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v60, (int8x16_t)v60, 8uLL), v60), (int8x16_t)v60);
          float32x4_t v62 = (float32x4_t)vbslq_s8(v58, vandq_s8((int8x16_t)v56, (int8x16_t)vcgtq_f32((float32x4_t)vextq_s8((int8x16_t)v53, (int8x16_t)v53, 4uLL), v56)), (int8x16_t)vzip2q_s64((int64x2_t)vandq_s8(*(int8x16_t *)v55, (int8x16_t)vcgtq_f32(v56, v53)), (int64x2_t)vmaxq_f32((float32x4_t)vextq_s8(v61, v61, 8uLL), (float32x4_t)vextq_s8(v61, v61, 0xCuLL))));
          v62.i64[0] = vbslq_s8(v57, (int8x16_t)vmaxq_f32((float32x4_t)vextq_s8((int8x16_t)v62, (int8x16_t)v62, 8uLL), v62), (int8x16_t)v62).u64[0];
          float32x4_t v64 = *(float32x4_t *)(v55 + 64);
          float32x4_t v63 = *(float32x4_t *)(v55 + 80);
          int8x16_t v65 = vbslq_s8((int8x16_t)vcgtq_f32(vmaxq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v62.f32, 0), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v62.f32, 1)), v63), (int8x16_t)v64, (int8x16_t)v53);
          float32x4_t v66 = (float32x4_t)vandq_s8((int8x16_t)v64, (int8x16_t)vcgtq_f32(*(float32x4_t *)(v55 + 96), v53));
          *(int8x16_t *)(v5 + 16 * v52++) = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vminq_f32(vmaxq_f32(vaddq_f32((float32x4_t)vextq_s8((int8x16_t)v66, (int8x16_t)v66, 8uLL), vaddq_f32((float32x4_t)vrev64q_s32((int32x4_t)v66), v66)), v63), v64), 0), v63), *(int8x16_t *)(v55 + 112), v65);
        }
        while (v52 < v4);
      }
      ++v3;
      v6 += v7;
      v5 += v8;
    }
    while (v3 != v2);
  }
  return 0;
}

uint64_t HgcHighlightOutOfGamut::GetDOD(HgcHighlightOutOfGamut *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

uint64_t HgcHighlightOutOfGamut::GetROI(HgcHighlightOutOfGamut *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

void HgcHighlightOutOfGamut::HgcHighlightOutOfGamut(HgcHighlightOutOfGamut *this)
{
  HGNode::HGNode((HGNode *)this);
  void *v1 = &unk_1F119C0B0;
  operator new();
}

void sub_1B7E5AEE8(_Unwind_Exception *a1)
{
  HGNode::~HGNode(v1);
  _Unwind_Resume(a1);
}

void HgcHighlightOutOfGamut::~HgcHighlightOutOfGamut(HGNode *this)
{
  *(void *)this = &unk_1F119C0B0;
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    MEMORY[0x1BA9BFBA0](v2, 0x1000C40AE2C30F4);
  }

  HGNode::~HGNode(this);
}

{
  void *v1;
  uint64_t vars8;

  HgcHighlightOutOfGamut::~HgcHighlightOutOfGamut(this);

  HGObject::operator delete(v1);
}

uint64_t HgcHighlightOutOfGamut::SetParameter(HgcHighlightOutOfGamut *this, float a2, float a3, float a4, float a5)
{
  return 0xFFFFFFFFLL;
}

uint64_t HgcHighlightOutOfGamut::GetParameter(HgcHighlightOutOfGamut *this, int a2, float *a3)
{
  return 0xFFFFFFFFLL;
}

const char *HgcExposureAdjust::GetProgram(HgcExposureAdjust *this, HGRenderer *a2)
{
  unsigned int Target = HGRenderer::GetTarget(a2, 393216);
  if (Target == 396048)
  {
    if ((*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 20) == 27) {
      return "//Metal1.0     \n"
    }
             "//LEN=00000002b3\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< half > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]])\n"
             "{\n"
             "    const half4 c0 = half4(1.000000000, 0.000000000, 0.000000000, 0.000000000);\n"
             "    half4 r0;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0 = (half4) hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy);\n"
             "    r0 = r0 + half4(hg_Params[0]);\n"
             "    output.color0 = fmin(float4(r0), float4(c0.xxxx));\n"
             "    return output;\n"
             "}\n"
             "//MD5=eb9df7c6:30dd8f51:acaefc17:02e6ae8c\n"
             "//SIG=00400000:00000001:00000001:00000001:0001:0001:0001:0000:0000:0000:0002:0000:0001:01:0:1:0\n";
    else {
      return "//Metal1.0     \n"
    }
             "//LEN=0000000298\n"
             "fragment FragmentOut fragmentFunc(VertexInOut frag [[ stage_in ]], \n"
             "    const constant float4* hg_Params [[ buffer(0) ]], \n"
             "    texture2d< float > hg_Texture0 [[ texture(0) ]], \n"
             "    sampler hg_Sampler0 [[ sampler(0) ]])\n"
             "{\n"
             "    const float4 c0 = float4(1.000000000, 0.000000000, 0.000000000, 0.000000000);\n"
             "    float4 r0;\n"
             "    FragmentOut output;\n"
             "\n"
             "    r0 = hg_Texture0.sample(hg_Sampler0, frag._texCoord0.xy);\n"
             "    r0 = r0 + hg_Params[0];\n"
             "    output.color0 = fmin(r0, c0.xxxx);\n"
             "    return output;\n"
             "}\n"
             "//MD5=9f403330:a5ffee84:f6c5632e:85d2d683\n"
             "//SIG=00000000:00000001:00000001:00000000:0001:0001:0001:0000:0000:0000:0002:0000:0001:01:0:1:0\n";
  }
  else if (Target <= 0x6060F {
         || (*(unsigned int (**)(HGRenderer *, uint64_t))(*(void *)a2 + 128))(a2, 46))
  }
  {
    return 0;
  }
  else
  {
    return "//GLfs2.0      \n"
           "//LEN=000000026a\n"
           "#ifndef GL_ES\n"
           "#define lowp\n"
           "#define mediump\n"
           "#define highp\n"
           "#endif\n"
           "#define defaultp mediump\n"
           "uniform defaultp sampler2D hg_Texture0;\n"
           "uniform defaultp vec4 hg_ProgramLocal0;\n"
           "varying highp vec4 hg_TexCoord0;\n"
           "void main()\n"
           "{\n"
           "    const defaultp vec4 c0 = vec4(1.000000000, 0.000000000, 0.000000000, 0.000000000);\n"
           "    defaultp vec4 r0;\n"
           "\n"
           "    r0 = texture2D(hg_Texture0, hg_TexCoord0.xy);\n"
           "    r0 = r0 + hg_ProgramLocal0;\n"
           "    gl_FragColor = min(r0, c0.xxxx);\n"
           "}\n"
           "//MD5=388f355f:a6d62e01:ca926981:5f521d43\n"
           "//SIG=00000000:00000001:00000001:00000000:0001:0001:0001:0000:0000:0000:0000:0000:0001:01:0:1:0\n";
  }
}

void HgcExposureAdjust::InitProgramDescriptor(HgcExposureAdjust *this, HGProgramDescriptor *a2)
{
  HGProgramDescriptor::SetVisibleShaderWithSource(a2, "HgcExposureAdjust_hgc_visible", "//Metal1.0     \n//LEN=0000000173\n[[ visible ]] FragmentOut HgcExposureAdjust_hgc_visible(const constant float4* hg_Params,\n    float4 color0)\n{\n    const float4 c0 = float4(1.000000000, 0.000000000, 0.000000000, 0.000000000);\n"
    "    float4 r0;\n"
    "    FragmentOut output;\n"
    "\n"
    "    r0 = color0;\n"
    "    r0 = r0 + hg_Params[0];\n"
    "    output.color0 = fmin(r0, c0.xxxx);\n"
    "    return output;\n"
    "}\n");
  HGProgramDescriptor::SetFragmentFunctionName(a2, "HgcExposureAdjust");
}

void sub_1B7E5B0BC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, long long a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  *(_DWORD *)(v32 - 64) = 4;
  std::string::basic_string[abi:ne180100]<0>((void *)(v32 - 56), "FragmentOut");
  *(_OWORD *)(v32 - 32) = xmmword_1B7E75170;
  HGProgramDescriptor::SetReturnBinding(v31, v32 - 64);
  if (*(char *)(v32 - 33) < 0) {
    operator delete(*(void **)(v32 - 56));
  }
  memset(v37, 0, 24);
  LODWORD(v33) = 2;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75770;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  LODWORD(v33) = 10;
  std::string::basic_string[abi:ne180100]<0>(v34, "float4");
  long long v36 = xmmword_1B7E75170;
  std::vector<HGBinding>::push_back[abi:ne180100](v37, (uint64_t)&v33);
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  HGProgramDescriptor::SetArgumentBindings(v31, v37);
  int8x16_t v33 = (void **)v37;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100](&v33);
}

void sub_1B7E5B1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,char a21)
{
  a12 = &a21;
  std::vector<HGBinding>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

void sub_1B7E5B1FC()
{
  if (*(char *)(v0 - 33) < 0) {
    operator delete(*(void **)(v0 - 56));
  }
  JUMPOUT(0x1B7E5B1F4);
}

void *HgcExposureAdjust::shaderDescription@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "HgcExposureAdjust [hgc1]");
}

uint64_t HgcExposureAdjust::BindTexture(HgcExposureAdjust *this, HGHandler *a2, int a3)
{
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(HGHandler *, void))(*(void *)a2 + 72))(a2, 0);
  (*(void (**)(HGHandler *, void, void))(*(void *)a2 + 48))(a2, 0, 0);
  HGHandler::TexCoord(a2, 0, 0, 0, 0);
  int v5 = (*(uint64_t (**)(void, uint64_t))(**((void **)a2 + 18) + 128))(*((void *)a2 + 18), 46);
  uint64_t result = 0;
  if (!v5)
  {
    (*(void (**)(HGHandler *))(*(void *)a2 + 168))(a2);
    return 0;
  }
  return result;
}

uint64_t HgcExposureAdjust::Bind(HgcExposureAdjust *this, HGHandler *a2)
{
  return 0;
}

uint64_t HgcExposureAdjust::RenderTile(HgcExposureAdjust *this, HGTile *a2)
{
  int v2 = *((_DWORD *)a2 + 3) - *((_DWORD *)a2 + 1);
  if (v2 >= 1)
  {
    int v3 = 0;
    int v4 = *((_DWORD *)a2 + 2) - *(_DWORD *)a2;
    uint64_t v5 = *((void *)a2 + 2);
    uint64_t v6 = *((void *)a2 + 10);
    uint64_t v7 = 16 * *((int *)a2 + 22);
    uint64_t v8 = 16 * *((int *)a2 + 6);
    do
    {
      if (v4 < 4)
      {
        LODWORD(v18) = 0;
      }
      else
      {
        int v9 = 0;
        uint64_t v10 = 32;
        do
        {
          float32x4_t v11 = (float32x4_t *)*((void *)this + 51);
          float32x4_t v12 = v11[1];
          float32x4_t v13 = vminq_f32(vaddq_f32(*(float32x4_t *)(v6 + v10 - 32), *v11), v12);
          float32x4_t v14 = vminq_f32(vaddq_f32(*(float32x4_t *)(v6 + v10 - 16), *v11), v12);
          float32x4_t v15 = vminq_f32(vaddq_f32(*(float32x4_t *)(v6 + v10), *v11), v12);
          float32x4_t v16 = vminq_f32(vaddq_f32(*(float32x4_t *)(v6 + v10 + 16), *v11), v12);
          float32x4_t v17 = (float32x4_t *)(v5 + v10);
          v17[-2] = v13;
          v17[-1] = v14;
          *float32x4_t v17 = v15;
          v17[1] = v16;
          v9 -= 4;
          v10 += 64;
        }
        while (v4 + v9 > 3);
        LODWORD(v18) = -v9;
      }
      if ((int)v18 < v4)
      {
        uint64_t v18 = v18;
        do
        {
          *(float32x4_t *)(v5 + 16 * v18) = vminq_f32(vaddq_f32(*(float32x4_t *)(v6 + 16 * v18), *(float32x4_t *)*((void *)this + 51)), *(float32x4_t *)(*((void *)this + 51) + 16));
          ++v18;
        }
        while (v18 < v4);
      }
      ++v3;
      v6 += v7;
      v5 += v8;
    }
    while (v3 != v2);
  }
  return 0;
}

uint64_t HgcExposureAdjust::GetDOD(HgcExposureAdjust *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

uint64_t HgcExposureAdjust::GetROI(HgcExposureAdjust *this, HGRenderer *a2, int a3, HGRect a4)
{
  if (a3) {
    return 0;
  }
  else {
    return *(void *)&a4.var0;
  }
}

void HgcExposureAdjust::HgcExposureAdjust(HgcExposureAdjust *this)
{
  HGNode::HGNode((HGNode *)this);
  void *v1 = &unk_1F119C318;
  operator new();
}

void sub_1B7E5B564(_Unwind_Exception *a1)
{
  HGNode::~HGNode(v1);
  _Unwind_Resume(a1);
}

void HgcExposureAdjust::~HgcExposureAdjust(HGNode *this)
{
  *(void *)this = &unk_1F119C318;
  uint64_t v2 = *((void *)this + 51);
  if (v2) {
    MEMORY[0x1BA9BFBA0](v2, 0x1000C40EED21634);
  }

  HGNode::~HGNode(this);
}

{
  void *v1;
  uint64_t vars8;

  HgcExposureAdjust::~HgcExposureAdjust(this);

  HGObject::operator delete(v1);
}

uint64_t HgcExposureAdjust::SetParameter(HgcExposureAdjust *this, uint64_t a2, __n128 a3, float a4, float a5, float a6, char *a7)
{
  if (a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = (__n128 *)*((void *)this + 51);
  if (v8->n128_f32[0] == a3.n128_f32[0]
    && v8->n128_f32[1] == a3.n128_f32[0]
    && v8->n128_f32[2] == a3.n128_f32[0]
    && v8->n128_f32[3] == a3.n128_f32[0])
  {
    return 0;
  }
  int32x4_t v9 = vdupq_lane_s32((int32x2_t)a3.n128_u64[0], 0);
  a3.n128_f32[1] = a4;
  *uint64_t v8 = (__n128)v9;
  a3.n128_u64[1] = __PAIR64__(LODWORD(a6), LODWORD(a5));
  v8[2] = a3;
  HGNode::ClearBits((HGNode *)this, a2, a7);
  return 1;
}

float HgcExposureAdjust::GetParameter(HgcExposureAdjust *this, int a2, float *a3)
{
  if (!a2)
  {
    int v3 = (float *)*((void *)this + 51);
    *a3 = v3[8];
    a3[1] = v3[9];
    a3[2] = v3[10];
    float result = v3[11];
    a3[3] = result;
  }
  return result;
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFAttributedStringBeginEditing(CFMutableAttributedStringRef aStr)
{
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1F40D7250](alloc, maxLength);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFAttributedStringRef aStr)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1F40D7258](alloc, maxLength, aStr);
}

void CFAttributedStringEndEditing(CFMutableAttributedStringRef aStr)
{
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x1F40D7270](aStr, loc, attrName, effectiveRange);
}

CFTypeRef CFAttributedStringGetAttributeAndLongestEffectiveRange(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange inRange, CFRange *longestEffectiveRange)
{
  return (CFTypeRef)MEMORY[0x1F40D7278](aStr, loc, attrName, inRange.location, inRange.length, longestEffectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1F40D7298](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x1F40D72A0](aStr);
}

void CFAttributedStringRemoveAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName)
{
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
}

void CFAttributedStringSetAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName, CFTypeRef value)
{
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

UInt32 CFBundleGetVersionNumber(CFBundleRef bundle)
{
  return MEMORY[0x1F40D75D8](bundle);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A80](err);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1F40D7D78](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFPreferencesAddSuitePreferencesToApp(CFStringRef applicationID, CFStringRef suiteID)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80D8](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8390](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1F40D83E0](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2 = MEMORY[0x1F40D85D8](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1F40D86B0](tokenizer, index);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8770](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8798](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D87C0](anURL);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8808](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8810](allocator, url);
}

CFURLRef CFURLCreateFileReferenceURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x1F40D8838](allocator, url, error);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8878](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88A8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1F40D8948](url, error);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1F40D89D0](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformFromString(CGAffineTransform *__return_ptr retstr, NSString *string)
{
  return (CGAffineTransform *)MEMORY[0x1F4102AC8](retstr, string);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGContextRef CGBitmapContextCreateWithData(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo, CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9830](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo, releaseCallback);
}

CGColorConversionInfoRef CGColorConversionInfoCreate(CGColorSpaceRef src, CGColorSpaceRef dst)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9940](src, dst);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9A98](space);
}

CFDataRef CGColorSpaceCopyICCProfile(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9AA0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateExtended(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B00](space);
}

CGColorSpaceRef CGColorSpaceCreateWithColorSyncProfile(ColorSyncProfileRef a1, CFDictionaryRef options)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B40](a1, options);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithICCProfile(CFDataRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B50](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B90](space);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C20](s);
}

BOOL CGColorSpaceIsPQBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C30](s);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C68](a1);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x1F40DA090](c);
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetGrayStrokeColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGDataProviderRef CGDataProviderRetain(CGDataProviderRef provider)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA358](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1F40DB008](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x1F40DB038](path, transform, *(void *)&lineCap, *(void *)&lineJoin, lineWidth, miterLimit);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB070](path);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x1F4102AD0](string);
  result.y = v2;
  result.x = v1;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC80](allocator, *(void *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD70](allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC170](retstr, time, *(void *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC178](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC308](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x1F40DF2E8](font);
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1F40DF338](font, matrix, attributes, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF378](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF390](name, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithNameAndSize(CFStringRef name, CGFloat size)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF418](name, size);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x1F40DF4A8](font);
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x1F40DF4C0](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  MEMORY[0x1F40DF4C8](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x1F40DF4E0](font);
  return result;
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  MEMORY[0x1F40DF528](font);
  return result;
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x1F40DF558](font);
  return result;
}

void CTFontGetVerticalTranslationsForGlyphs(CTFontRef font, const CGGlyph *glyphs, CGSize *translations, CFIndex count)
{
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  MEMORY[0x1F40DF5D8](font);
  return result;
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x1F40DF650](fontURL, *(void *)&scope, error);
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x1F40DF768](line, justificationFactor, justificationWidth);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineEnumerateCaretOffsets(CTLineRef line, void *block)
{
}

CFIndex CTLineGetGlyphCount(CTLineRef line)
{
  return MEMORY[0x1F40DF7D8](line);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1F40DF7E0](line);
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  MEMORY[0x1F40DF7F8](line, flushFactor, flushWidth);
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1 = MEMORY[0x1F40DF810](line);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  MEMORY[0x1F40DF818](line);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return (CTParagraphStyleRef)MEMORY[0x1F40DF868](settings, settingCount);
}

BOOL CTParagraphStyleGetValueForSpecifier(CTParagraphStyleRef paragraphStyle, CTParagraphStyleSpecifier spec, size_t valueBufferSize, void *valueBuffer)
{
  return MEMORY[0x1F40DF878](paragraphStyle, *(void *)&spec, valueBufferSize, valueBuffer);
}

void CTRunGetAdvances(CTRunRef run, CFRange range, CGSize *buffer)
{
}

const CGSize *__cdecl CTRunGetAdvancesPtr(CTRunRef run)
{
  return (const CGSize *)MEMORY[0x1F40DF8B0](run);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF8B8](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1F40DF8D8](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

const CGGlyph *__cdecl CTRunGetGlyphsPtr(CTRunRef run)
{
  return (const CGGlyph *)MEMORY[0x1F40DF8F0](run);
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

const CGPoint *__cdecl CTRunGetPositionsPtr(CTRunRef run)
{
  return (const CGPoint *)MEMORY[0x1F40DF918](run);
}

CTRunStatus CTRunGetStatus(CTRunRef run)
{
  return MEMORY[0x1F40DF928](run);
}

void CTRunGetStringIndices(CTRunRef run, CFRange range, CFIndex *buffer)
{
}

const CFIndex *__cdecl CTRunGetStringIndicesPtr(CTRunRef run)
{
  return (const CFIndex *)MEMORY[0x1F40DF938](run);
}

CFRange CTRunGetStringRange(CTRunRef run)
{
  CFIndex v1 = MEMORY[0x1F40DF940](run);
  result.length = v2;
  result.location = v1;
  return result;
}

CGAffineTransform *__cdecl CTRunGetTextMatrix(CGAffineTransform *__return_ptr retstr, CTRunRef run)
{
  return (CGAffineTransform *)MEMORY[0x1F40DF948](retstr, run);
}

double CTRunGetTypographicBounds(CTRunRef run, CFRange range, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF950](run, range.location, range.length, ascent, descent, leading);
  return result;
}

CTTextTabRef CTTextTabCreate(CTTextAlignment alignment, double location, CFDictionaryRef options)
{
  return (CTTextTabRef)MEMORY[0x1F40DF978](alignment, options, location);
}

CTTextAlignment CTTextTabGetAlignment(CTTextTabRef tab)
{
  return MEMORY[0x1F40DF980](tab);
}

double CTTextTabGetLocation(CTTextTabRef tab)
{
  MEMORY[0x1F40DF988](tab);
  return result;
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x1F40DF990](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedString(CFAttributedStringRef string)
{
  return (CTTypesetterRef)MEMORY[0x1F40DF998](string);
}

CFIndex CTTypesetterSuggestLineBreak(CTTypesetterRef typesetter, CFIndex startIndex, double width)
{
  return MEMORY[0x1F40DF9C8](typesetter, startIndex, width);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC18](attachments);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

CVReturn CVOpenGLESTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, CVEAGLContext eaglContext, CFDictionaryRef textureAttributes, CVOpenGLESTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFCA8](allocator, cacheAttributes, eaglContext, textureAttributes, cacheOut);
}

CVReturn CVOpenGLESTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVOpenGLESTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLenum format, GLenum type, size_t planeIndex, CVOpenGLESTextureRef *textureOut)
{
  return MEMORY[0x1F40DFCB0](allocator, textureCache, sourceImage, textureAttributes, *(void *)&target, *(void *)&internalFormat, *(void *)&width, *(void *)&height);
}

void CVOpenGLESTextureCacheFlush(CVOpenGLESTextureCacheRef textureCache, CVOptionFlags options)
{
}

GLuint CVOpenGLESTextureGetName(CVOpenGLESTextureRef image)
{
  return MEMORY[0x1F40DFCC0](image);
}

GLenum CVOpenGLESTextureGetTarget(CVOpenGLESTextureRef image)
{
  return MEMORY[0x1F40DFCC8](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD50](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolFlush(CVPixelBufferPoolRef pool, CVPixelBufferPoolFlushFlags options)
{
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

CFDataRef ColorSyncProfileCopyHeader(ColorSyncProfileRef prof)
{
  return (CFDataRef)MEMORY[0x1F40D6570](prof);
}

ColorSyncProfileRef ColorSyncProfileCreate(CFDataRef data, CFErrorRef *error)
{
  return (ColorSyncProfileRef)MEMORY[0x1F40D6578](data, error);
}

ColorSyncMutableProfileRef ColorSyncProfileCreateMutableCopy(ColorSyncProfileRef prof)
{
  return (ColorSyncMutableProfileRef)MEMORY[0x1F40D6590](prof);
}

ColorSyncMD5 ColorSyncProfileGetMD5(ColorSyncProfileRef prof)
{
  uint64_t v1 = MEMORY[0x1F40D65A8](prof);
  *(void *)&result.digest[8] = v2;
  *(void *)result.digest = v1;
  return result;
}

void ColorSyncProfileSetHeader(ColorSyncMutableProfileRef prof, CFDataRef header)
{
}

void ColorSyncProfileSetTag(ColorSyncMutableProfileRef prof, CFStringRef signature, CFDataRef data)
{
}

CFTypeRef ColorSyncTransformCopyProperty(ColorSyncTransformRef transform, CFTypeRef key, CFDictionaryRef options)
{
  return (CFTypeRef)MEMORY[0x1F40D65D0](transform, key, options);
}

ColorSyncTransformRef ColorSyncTransformCreate(CFArrayRef profileSequence, CFDictionaryRef options)
{
  return (ColorSyncTransformRef)MEMORY[0x1F40D65D8](profileSequence, options);
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E92E0](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1F40E6FF0](aClass, extraBytes, zone);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

void NSLogv(NSString *format, va_list args)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1F4102AE8](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4102AF0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void SCNExportJavaScriptModule(JSContext *context)
{
}

SCNMatrix4 *__cdecl SCNMatrix4Mult(SCNMatrix4 *__return_ptr retstr, SCNMatrix4 *a, SCNMatrix4 *b)
{
  return (SCNMatrix4 *)MEMORY[0x1F40F67E8](retstr, a, b);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

{
  return MEMORY[0x1F417E998]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1F417E400](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1F417E550](this, *(void *)&__ecode);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C8](this, __str, __pos, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E678](this, __c);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x1F417E6D0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1F417E728]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1F417E730]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1F417E740]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1F417E748]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E868]();
}

{
  return MEMORY[0x1F417E878]();
}

{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E890]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8A8]();
}

{
  return MEMORY[0x1F417E8B0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

{
  return MEMORY[0x1F417E8D0]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x1F417E948]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1F417E960](__s, __icase);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x1F417E968](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x1F417E9B0]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x1F417E9D0](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::__assoc_sub_state::wait(std::__assoc_sub_state *this)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x1F417EAA0]();
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1F417EAA8](retstr, __s);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x1F417EC38]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1F417EC90]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1F417ECA0]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1F417ECE0](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1F417ECE8](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::thread::detach(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x1F417EE58](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1F417EE98](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1F417EF08]();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
}

void __cxa_bad_typeid(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_call_unexpected(void *a1)
{
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1F417EF70](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __invert_d3()
{
  return MEMORY[0x1F40C9BE0]();
}

uint64_t __invert_d4()
{
  return MEMORY[0x1F40C9BE8]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x1F40C9C00]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_exp2_f4(simd_float4 x)
{
  MEMORY[0x1F40CA158]((__n128)x);
  return result;
}

simd_float4 _simd_log_f4(simd_float4 x)
{
  MEMORY[0x1F40CA178]((__n128)x);
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x1F40CA188]((__n128)x, (__n128)y);
  return result;
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x1F40CA3D0](__x);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x1F40CA470](a1);
  return result;
}

double atof(const char *a1)
{
  MEMORY[0x1F40CA498](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

long double cbrt(long double __x)
{
  MEMORY[0x1F40CA688](__x);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

int dgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1730](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply_f(size_t iterations, dispatch_queue_t queue, void *context, void (__cdecl *work)(void *, size_t))
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double erfc(long double __x)
{
  MEMORY[0x1F40CBF58](__x);
  return result;
}

float erff(float a1)
{
  MEMORY[0x1F40CBF60](a1);
  return result;
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fegetround(void)
{
  return MEMORY[0x1F40CC090]();
}

int fesetround(int a1)
{
  return MEMORY[0x1F40CC0B0](*(void *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1F40CC1B0](a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1F40CC400](a1, a2);
}

int getpagesize(void)
{
  return MEMORY[0x1F40CC480]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1F40CC500](*(void *)&a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

void glActiveTexture(GLenum texture)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
}

void glBindBuffer(GLenum target, GLuint buffer)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
}

void glBindTexture(GLenum target, GLuint texture)
{
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x1F40F43A8]();
}

void glBlendColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
}

void glBlendEquation(GLenum mode)
{
}

void glBlendEquationSeparate(GLenum modeRGB, GLenum modeAlpha)
{
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
}

void glBlendFuncSeparate(GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)
{
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x1F40F43E8](*(void *)&target);
}

void glClear(GLbitfield mask)
{
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
}

void glClearDepthf(GLclampf depth)
{
}

uint64_t glClientWaitSyncAPPLE()
{
  return MEMORY[0x1F40F4408]();
}

void glColorMask(GLBOOLean red, GLBOOLean green, GLBOOLean blue, GLBOOLean alpha)
{
}

void glCompileShader(GLuint shader)
{
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x1F40F4420]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x1F40F4428](*(void *)&type);
}

void glCullFace(GLenum mode)
{
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteProgram(GLuint program)
{
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
}

void glDeleteShader(GLuint shader)
{
}

uint64_t glDeleteSyncAPPLE()
{
  return MEMORY[0x1F40F4460]();
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
}

uint64_t glDeleteVertexArraysOES()
{
  return MEMORY[0x1F40F4470]();
}

void glDepthFunc(GLenum func)
{
}

void glDepthMask(GLBOOLean flag)
{
}

void glDetachShader(GLuint program, GLuint shader)
{
}

void glDisable(GLenum cap)
{
}

void glDisableVertexAttribArray(GLuint index)
{
}

uint64_t glDiscardFramebufferEXT()
{
  return MEMORY[0x1F40F44A0]();
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
}

void glEnable(GLenum cap)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

uint64_t glFenceSyncAPPLE()
{
  return MEMORY[0x1F40F44D0]();
}

void glFinish(void)
{
}

void glFlush(void)
{
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
}

void glFrontFace(GLenum mode)
{
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
}

void glGenTextures(GLsizei n, GLuint *textures)
{
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x1F40F4520]();
}

void glGetAttachedShaders(GLuint program, GLsizei maxcount, GLsizei *count, GLuint *shaders)
{
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x1F40F4530](*(void *)&program, name);
}

void glGetBooleanv(GLenum pname, GLBOOLean *params)
{
}

GLenum glGetError(void)
{
  return MEMORY[0x1F40F4540]();
}

void glGetIntegerv(GLenum pname, GLint *params)
{
}

void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetShaderSource(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *source)
{
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
}

const GLubyte *__cdecl glGetString(GLenum name)
{
  return (const GLubyte *)MEMORY[0x1F40F4580](*(void *)&name);
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x1F40F4588](*(void *)&program, name);
}

void glGetVertexAttribiv(GLuint index, GLenum pname, GLint *params)
{
}

GLBOOLean glIsTexture(GLuint texture)
{
  return MEMORY[0x1F40F4598](*(void *)&texture);
}

void glLinkProgram(GLuint program)
{
}

void glPixelStorei(GLenum pname, GLint param)
{
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
}

uint64_t glRenderbufferStorageMultisampleAPPLE()
{
  return MEMORY[0x1F40F45C0]();
}

uint64_t glResolveMultisampleFramebufferAPPLE()
{
  return MEMORY[0x1F40F45C8]();
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glStencilMask(GLuint mask)
{
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
{
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
}

void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glUniform1f(GLint location, GLfloat x)
{
}

void glUniform1i(GLint location, GLint x)
{
}

void glUniform2f(GLint location, GLfloat x, GLfloat y)
{
}

void glUniform2i(GLint location, GLint x, GLint y)
{
}

void glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)
{
}

void glUniform3i(GLint location, GLint x, GLint y, GLint z)
{
}

void glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
}

void glUniform4i(GLint location, GLint x, GLint y, GLint z, GLint w)
{
}

void glUniformMatrix3fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUseProgram(GLuint program)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x1F40CC610](*(void *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC620](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x1F40CC808](*(void *)&a2, a1);
  return result;
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC868](a1);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

void longjmp(jmp_buf a1, int a2)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

const char *__cdecl macho_arch_name_for_mach_header(const mach_header *mh)
{
  return (const char *)MEMORY[0x1F40CCAE0](mh);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB0](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

float nanf(const char *a1)
{
  MEMORY[0x1F40CCE98](a1);
  return result;
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1F40CCEA0](__rqtp, __rmtp);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  return MEMORY[0x1F40CD928](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x1F40CD968](a1, a2);
}

int pthread_cancel(pthread_t a1)
{
  return MEMORY[0x1F40CD970](a1);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1F40CD998](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x1F40CD9D8](a1);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x1F40CD9E0](a1, a2);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1F40CDAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

void pthread_testcancel(void)
{
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x1F40CDF80](a1);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x1F40CDF90](*(void *)&a1, a2);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1F40CDFB8](*(void *)&a1, a2);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int ssyevd_(char *__jobz, char *__uplo, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__w, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__iwork, __CLPK_integer *__liwork, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1918](__jobz, __uplo, __n, __a, __lda, __w, __work, __lwork);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE148](__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

float strtof(const char *a1, char **a2)
{
  MEMORY[0x1F40CE270](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x1F40CE428](a1);
  return result;
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t thread_policy_get(thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return MEMORY[0x1F40CE538](*(void *)&thread, *(void *)&flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x1F40CE5C8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1F40D22B8](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2578](converter, srcs, dests, tempBuffer, *(void *)&flags);
}

vImageConverterRef vImageConverter_CreateWithCGColorConversionInfo(CGColorConversionInfoRef colorConversionInfoRef, const vImage_CGImageFormat *sFormat, const vImage_CGImageFormat *dFormat, const CGFloat *bg, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27A0](colorConversionInfoRef, sFormat, dFormat, bg, *(void *)&flags, error);
}

vImageConverterRef vImageConverter_CreateWithCGImageFormat(const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27A8](srcFormat, destFormat, backgroundColor, *(void *)&flags, error);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2B60](src, dest, permuteMap, *(void *)&flags);
}

vImage_Error vImagePermuteChannels_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2B70](src, dest, permuteMap, *(void *)&flags);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

kern_return_t vm_region_recurse_64(vm_map_read_t target_task, vm_address_t *address, vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x1F40CE6F8](*(void *)&target_task, address, size, nesting_depth, info, infoCnt);
}

int vprintf(const char *a1, va_list a2)
{
  return MEMORY[0x1F40CE778](a1, a2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1F40CE8B0](__s, *(void *)&__c, __n);
}

void xmlFreeTextReader(xmlTextReaderPtr reader)
{
}

xmlTextReaderPtr xmlReaderForFile(const char *filename, const char *encoding, int options)
{
  return (xmlTextReaderPtr)MEMORY[0x1F4182828](filename, encoding, *(void *)&options);
}

xmlTextReaderPtr xmlReaderForMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlTextReaderPtr)MEMORY[0x1F4182830](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

const xmlChar *__cdecl xmlTextReaderConstName(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x1F4182970](reader);
}

const xmlChar *__cdecl xmlTextReaderConstValue(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x1F4182978](reader);
}

int xmlTextReaderHasAttributes(xmlTextReaderPtr reader)
{
  return MEMORY[0x1F4182990](reader);
}

int xmlTextReaderIsEmptyElement(xmlTextReaderPtr reader)
{
  return MEMORY[0x1F4182998](reader);
}

int xmlTextReaderMoveToNextAttribute(xmlTextReaderPtr reader)
{
  return MEMORY[0x1F41829B8](reader);
}

int xmlTextReaderNext(xmlTextReaderPtr reader)
{
  return MEMORY[0x1F41829C0](reader);
}

int xmlTextReaderNodeType(xmlTextReaderPtr reader)
{
  return MEMORY[0x1F41829C8](reader);
}

int xmlTextReaderRead(xmlTextReaderPtr reader)
{
  return MEMORY[0x1F41829D0](reader);
}

xmlChar *__cdecl xmlTextReaderReadString(xmlTextReaderPtr reader)
{
  return (xmlChar *)MEMORY[0x1F41829E8](reader);
}