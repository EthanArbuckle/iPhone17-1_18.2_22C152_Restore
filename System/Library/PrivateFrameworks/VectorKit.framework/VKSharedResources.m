@interface VKSharedResources
- (BOOL)_hasResourceUsers;
- (BOOL)snapshotterIsInService;
- (CMPhotoDecompressionSession)defaultDecompressionSession;
- (VKInternalIconManager)iconManager;
- (VKResourceManager)resourceManager;
- (const)dataOverrideManager;
- (const)shaderLibrary;
- (id).cxx_construct;
- (id)_initWithDevice:(void *)a3 standardLibrary:(const void *)a4;
- (shared_ptr<md::MaterialTextureManager>)materialTextureManager;
- (shared_ptr<md::RealisticCommandBufferSelector>)realisticCommandBufferSelector;
- (shared_ptr<md::StandardCommandBufferSelector>)standardCommandBufferSelector;
- (shared_ptr<md::StylesheetVendor>)stylesheetVendor;
- (shared_ptr<md::TextureManager>)textureManager;
- (unint64_t)globalFrameStamp;
- (void)_addResourceUser;
- (void)_removeResourceUser;
- (void)alphaAtlas;
- (void)dealloc;
- (void)device;
- (void)distanceAtlas;
- (void)frameDidComplete:(unint64_t)a3;
- (void)gglDevice;
- (void)grlFontManager;
- (void)grlIconManager;
- (void)highInflationAlphaAtlas;
- (void)isoAlphaAtlas;
- (void)prune:(unsigned __int8)a3;
- (void)purgeDecompressSessionCachedBuffers;
- (void)setSnapshotterIsInService:(BOOL)a3;
- (void)startDecompressionSession;
- (void)undulationModel;
@end

@implementation VKSharedResources

- (void)gglDevice
{
  return (void *)*((void *)self->_device.__ptr_.__value_ + 1);
}

- (void)grlIconManager
{
  return self->_grlIconManager.__ptr_;
}

- (void)grlFontManager
{
  return &self->_grlFontManager;
}

- (void)alphaAtlas
{
  return self->_alphaAtlas.__ptr_.__value_;
}

- (shared_ptr<md::TextureManager>)textureManager
{
  cntrl = self->_textureManager.__cntrl_;
  *v2 = self->_textureManager.__ptr_;
  v2[1] = (TextureManager *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (TextureManager *)self;
  return result;
}

- (shared_ptr<md::StandardCommandBufferSelector>)standardCommandBufferSelector
{
  cntrl = self->_standardCommandBufferSelector.__cntrl_;
  *v2 = self->_standardCommandBufferSelector.__ptr_;
  v2[1] = (StandardCommandBufferSelector *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (StandardCommandBufferSelector *)self;
  return result;
}

- (shared_ptr<md::MaterialTextureManager>)materialTextureManager
{
  cntrl = self->_materialTextureManager.__cntrl_;
  *v2 = self->_materialTextureManager.__ptr_;
  v2[1] = (MaterialTextureManager *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (MaterialTextureManager *)self;
  return result;
}

- (void)purgeDecompressSessionCachedBuffers
{
  MEMORY[0x1A6237E70](self, a2);
  CMPhotoDecompressionSessionFlushCachedBuffers();
}

- (void)frameDidComplete:(unint64_t)a3
{
  value = self->_sharedResourceManager.__ptr_.__value_;
  md::SharedResourcesManager::getReferencesForFrameStamp((md::SharedResourcesManager *)&v5, (std::__shared_mutex_base *)value, a3, 0);
  if (v6) {
    md::SharedResourcesManager::FrameReferences::clear((std::__shared_mutex_base *)((char *)value + 208 * v5 + 304));
  }
  if (v8)
  {
    v4 = v7;
    std::__shared_mutex_base::unlock_shared(v4);
  }
}

- (void)_addResourceUser
{
}

- (unint64_t)globalFrameStamp
{
  return atomic_fetch_add((atomic_ullong *volatile)&self->_globalFrameStamp, 1uLL) + 1;
}

- (VKInternalIconManager)iconManager
{
  return self->_iconManager._obj;
}

- (const)shaderLibrary
{
  return self->_shaderLibrary.__ptr_;
}

- (void)distanceAtlas
{
  return self->_distanceAtlas.__ptr_.__value_;
}

- (void)isoAlphaAtlas
{
  return self->_isoAlphaAtlas.__ptr_.__value_;
}

- (VKResourceManager)resourceManager
{
  return self->_resourceManager._obj;
}

- (shared_ptr<md::RealisticCommandBufferSelector>)realisticCommandBufferSelector
{
  cntrl = self->_realisticCommandBufferSelector.__cntrl_;
  *v2 = self->_realisticCommandBufferSelector.__ptr_;
  v2[1] = (RealisticCommandBufferSelector *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (RealisticCommandBufferSelector *)self;
  return result;
}

- (void)device
{
  return self->_device.__ptr_.__value_;
}

- (void)highInflationAlphaAtlas
{
  return self->_highInflationAlphaAtlas.__ptr_.__value_;
}

- (shared_ptr<md::StylesheetVendor>)stylesheetVendor
{
  cntrl = self->_stylesheetVendor.__cntrl_;
  *v2 = self->_stylesheetVendor.__ptr_;
  v2[1] = (StylesheetVendor *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (StylesheetVendor *)self;
  return result;
}

- (id).cxx_construct
{
  *(_OWORD *)&self->_figCreationLock._lock.__sig = 0u;
  p_figCreationLock = &self->_figCreationLock;
  *(void *)&p_figCreationLock[-2]._lock.__opaque[168] = &unk_1EF5599D8;
  *(void *)&p_figCreationLock[-2]._lock.__opaque[176] = 0;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__sig = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[8] = 0u;
  *(void *)&p_figCreationLock[-1]._lock.__opaque[24] = 0;
  *(void *)&p_figCreationLock[-1]._lock.__opaque[32] = &unk_1EF559758;
  *(void *)&p_figCreationLock[-1]._lock.__opaque[40] = 0;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[8] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[24] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[40] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[56] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[72] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[88] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[104] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[120] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[136] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[152] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[168] = 0u;
  *(void *)&p_figCreationLock->_lock.__opaque[184] = 0;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[168] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[152] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[136] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[120] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[104] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[88] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[72] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[56] = 0u;
  v4 = (geo::read_write_lock *)pthread_rwlock_init(&p_figCreationLock->_lock, 0);
  if (v4) {
    geo::read_write_lock::logFailure(v4, (uint64_t)"initialization", v5);
  }
  self->_grlIconManager = 0u;
  self->_grlFontManager = 0u;
  self->_resourceProvider = 0u;
  self->_globalFrameStamp.__a_.__a_value = 0;
  self->_undulationModelCreationFlag.__state_ = 0;
  return self;
}

- (const)dataOverrideManager
{
  return &self->_dataOverrideManager;
}

- (id)_initWithDevice:(void *)a3 standardLibrary:(const void *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VKSharedResources;
  v13 = [(VKSharedResources *)&v14 init];

  if (a3)
  {
    uint64_t v5 = v13;
    if (v13)
    {
      value = v13->_device.__ptr_.__value_;
      v13->_device.__ptr_.__value_ = (Device *)a3;
      if (value)
      {
        v7 = (md::SharedDeviceResources *)*((void *)value + 3);
        *((void *)value + 3) = 0;
        if (v7)
        {
          md::SharedDeviceResources::~SharedDeviceResources(v7);
          MEMORY[0x1A6239270]();
        }
        char v8 = (std::__shared_weak_count *)*((void *)value + 2);
        if (v8)
        {
          if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
        MEMORY[0x1A6239270](value, 0x1020C40E72D6CFBLL);
      }
      v9 = objc_alloc_init(VKResourceManager);
      v10 = v9;
      v15.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1EF559758;
      v15.__r_.__value_.__l.__size_ = (std::string::size_type)v10;
      objc_storeStrong((id *)&v13->_resourceManager._obj, v9);
      size = (void *)v15.__r_.__value_.__l.__size_;
      v15.__r_.__value_.__l.__size_ = 0;

      v15.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1EF559758;
      operator new();
    }
  }
  else
  {
    uint64_t v5 = v13;
  }

  return 0;
}

- (void).cxx_destruct
{
  cntrl = self->_grlFontManager.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v4 = self->_grlIconManager.__cntrl_;
    if (!v4) {
      goto LABEL_7;
    }
  }
  else
  {
    v4 = self->_grlIconManager.__cntrl_;
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v4 + 16))(v4, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
LABEL_7:
  uint64_t v5 = self->_resourceProvider.__cntrl_;
  if (v5 && !atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v5 + 16))(v5, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  char v6 = (geo::read_write_lock *)pthread_rwlock_destroy(&self->_figCreationLock._lock);
  if (v6) {
    geo::read_write_lock::logFailure(v6, (uint64_t)"destruction", v7);
  }
  char v8 = self->_shaderLibrary.__cntrl_;
  if (v8 && !atomic_fetch_add((atomic_ullong *volatile)v8 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v8 + 16))(v8);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v8);
  }
  value = self->_distanceAtlas.__ptr_.__value_;
  self->_distanceAtlas.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v10 = *((void *)value + 2);
    *((void *)value + 2) = 0;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
    MEMORY[0x1A6239270](value, 0x1020C406E52F545);
  }
  v11 = self->_isoAlphaAtlas.__ptr_.__value_;
  self->_isoAlphaAtlas.__ptr_.__value_ = 0;
  if (v11)
  {
    v12 = (std::__shared_weak_count *)*((void *)v11 + 4);
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v13 = *((void *)v11 + 2);
    *((void *)v11 + 2) = 0;
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
    MEMORY[0x1A6239270](v11, 0x1020C4081634310);
  }
  objc_super v14 = self->_highInflationAlphaAtlas.__ptr_.__value_;
  self->_highInflationAlphaAtlas.__ptr_.__value_ = 0;
  if (v14)
  {
    std::string v15 = (std::__shared_weak_count *)*((void *)v14 + 4);
    if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    uint64_t v16 = *((void *)v14 + 2);
    *((void *)v14 + 2) = 0;
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    }
    MEMORY[0x1A6239270](v14, 0x1020C4081634310);
  }
  v17 = self->_alphaAtlas.__ptr_.__value_;
  self->_alphaAtlas.__ptr_.__value_ = 0;
  if (v17)
  {
    uint64_t v18 = *((void *)v17 + 3);
    *((void *)v17 + 3) = 0;
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
    }
    MEMORY[0x1A6239270](v17, 0x1020C40764CE0E8);
  }
  v19 = self->_undulationModel.__ptr_.__value_;
  self->_undulationModel.__ptr_.__value_ = 0;
  if (v19)
  {
    v20 = *(void **)v19;
    if (*(void *)v19)
    {
      *((void *)v19 + 1) = v20;
      operator delete(v20);
    }
    MEMORY[0x1A6239270](v19, 0x1010C4028866157);
  }
  v21 = self->_device.__ptr_.__value_;
  self->_device.__ptr_.__value_ = 0;
  if (v21)
  {
    v22 = (md::SharedDeviceResources *)*((void *)v21 + 3);
    *((void *)v21 + 3) = 0;
    if (v22)
    {
      md::SharedDeviceResources::~SharedDeviceResources(v22);
      MEMORY[0x1A6239270]();
    }
    v23 = (std::__shared_weak_count *)*((void *)v21 + 2);
    if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
    MEMORY[0x1A6239270](v21, 0x1020C40E72D6CFBLL);
  }
  v24 = self->_realisticCommandBufferSelector.__cntrl_;
  if (v24 && !atomic_fetch_add((atomic_ullong *volatile)v24 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v24 + 16))(v24);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v24);
    v25 = self->_standardCommandBufferSelector.__cntrl_;
    if (!v25) {
      goto LABEL_54;
    }
  }
  else
  {
    v25 = self->_standardCommandBufferSelector.__cntrl_;
    if (!v25) {
      goto LABEL_54;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v25 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v25 + 16))(v25);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v25);
  }
LABEL_54:
  v26 = self->_dataOverrideManager.__cntrl_;
  if (v26 && !atomic_fetch_add((atomic_ullong *volatile)v26 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v26 + 16))(v26);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v26);
    v27 = self->_stylesheetVendor.__cntrl_;
    if (!v27) {
      goto LABEL_60;
    }
  }
  else
  {
    v27 = self->_stylesheetVendor.__cntrl_;
    if (!v27) {
      goto LABEL_60;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v27 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v27 + 16))(v27);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v27);
  }
LABEL_60:
  self->_resourceManager._vptr$_retain_ptr = (void **)&unk_1EF559758;

  v28 = self->_sharedResourceManager.__ptr_.__value_;
  self->_sharedResourceManager.__ptr_.__value_ = 0;
  if (v28)
  {
    md::SharedResourcesManager::~SharedResourcesManager((md::SharedResourcesManager *)v28);
    MEMORY[0x1A6239270]();
  }
  v29 = self->_materialTextureManager.__cntrl_;
  if (v29 && !atomic_fetch_add((atomic_ullong *volatile)v29 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v29 + 16))(v29);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v29);
    v30 = self->_textureManager.__cntrl_;
    if (!v30) {
      goto LABEL_68;
    }
  }
  else
  {
    v30 = self->_textureManager.__cntrl_;
    if (!v30) {
      goto LABEL_68;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v30 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v30 + 16))(v30);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v30);
  }
LABEL_68:
  self->_iconManager._vptr$_retain_ptr = (void **)&unk_1EF5599D8;
  obj = self->_iconManager._obj;
}

- (void)setSnapshotterIsInService:(BOOL)a3
{
  self->_snapshotterIsInService = a3;
}

- (BOOL)snapshotterIsInService
{
  return self->_snapshotterIsInService;
}

- (void)startDecompressionSession
{
  p_figCreationLock = &self->_figCreationLock;
  v4 = (geo::read_write_lock *)pthread_rwlock_wrlock(&self->_figCreationLock._lock);
  if (v4) {
    geo::read_write_lock::logFailure(v4, (uint64_t)"write lock", v5);
  }
  if (!self->_defaultDecompressionSession) {
    CMPhotoDecompressionSessionCreate();
  }
  char v6 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_figCreationLock->_lock);
  if (v6)
  {
    geo::read_write_lock::logFailure(v6, (uint64_t)"unlock", v7);
  }
}

- (void)prune:(unsigned __int8)a3
{
  int v3 = a3;
  md::TextureManager::purge((md::TextureManager *)self->_textureManager.__ptr_);
  md::MaterialTextureManager::purge((pthread_rwlock_t *)self->_materialTextureManager.__ptr_);
  if ((v3 - 1) <= 1)
  {
    [(VKInternalIconManager *)self->_iconManager._obj purge];
    [(VKSharedResources *)self purgeDecompressSessionCachedBuffers];
  }
}

- (BOOL)_hasResourceUsers
{
  return self->_referenceCount != 0;
}

- (void)_removeResourceUser
{
  unsigned int referenceCount = self->_referenceCount;
  if (referenceCount) {
    self->_unsigned int referenceCount = referenceCount - 1;
  }
}

- (void)dealloc
{
  cntrl = self->_grlIconManager.__cntrl_;
  self->_grlIconManager.__ptr_ = 0;
  self->_grlIconManager.__cntrl_ = 0;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_grlFontManager.__cntrl_;
  self->_grlFontManager.__ptr_ = 0;
  self->_grlFontManager.__cntrl_ = 0;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v4 + 16))(v4, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  uint64_t v5 = self->_resourceProvider.__cntrl_;
  self->_resourceProvider.__ptr_ = 0;
  self->_resourceProvider.__cntrl_ = 0;
  if (v5 && !atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v5 + 16))(v5, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  char v6 = self->_stylesheetVendor.__cntrl_;
  self->_stylesheetVendor.__ptr_ = 0;
  self->_stylesheetVendor.__cntrl_ = 0;
  if (v6 && !atomic_fetch_add((atomic_ullong *volatile)v6 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v6 + 16))(v6, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
  obj = self->_iconManager._obj;
  if (obj)
  {
    self->_iconManager._obj = 0;
  }
  char v8 = self->_textureManager.__cntrl_;
  self->_textureManager.__ptr_ = 0;
  self->_textureManager.__cntrl_ = 0;
  if (v8 && !atomic_fetch_add((atomic_ullong *volatile)v8 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v8 + 16))(v8, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v8);
  }
  v9 = self->_materialTextureManager.__cntrl_;
  self->_materialTextureManager.__ptr_ = 0;
  self->_materialTextureManager.__cntrl_ = 0;
  if (v9 && !atomic_fetch_add((atomic_ullong *volatile)v9 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v9 + 16))(v9, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
  }
  uint64_t v10 = self->_resourceManager._obj;
  if (v10)
  {
    self->_resourceManager._obj = 0;
  }
  value = self->_alphaAtlas.__ptr_.__value_;
  self->_alphaAtlas.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v12 = *((void *)value + 3);
    *((void *)value + 3) = 0;
    if (v12) {
      (*(void (**)(uint64_t, SEL))(*(void *)v12 + 8))(v12, a2);
    }
    MEMORY[0x1A6239270](value, 0x1020C40764CE0E8);
  }
  uint64_t v13 = self->_highInflationAlphaAtlas.__ptr_.__value_;
  self->_highInflationAlphaAtlas.__ptr_.__value_ = 0;
  if (v13)
  {
    objc_super v14 = (std::__shared_weak_count *)*((void *)v13 + 4);
    if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, SEL))v14->__on_zero_shared)(v14, a2);
      std::__shared_weak_count::__release_weak(v14);
    }
    uint64_t v15 = *((void *)v13 + 2);
    *((void *)v13 + 2) = 0;
    if (v15) {
      (*(void (**)(uint64_t, SEL))(*(void *)v15 + 8))(v15, a2);
    }
    MEMORY[0x1A6239270](v13, 0x1020C4081634310);
  }
  uint64_t v16 = self->_isoAlphaAtlas.__ptr_.__value_;
  self->_isoAlphaAtlas.__ptr_.__value_ = 0;
  if (v16)
  {
    v17 = (std::__shared_weak_count *)*((void *)v16 + 4);
    if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, SEL))v17->__on_zero_shared)(v17, a2);
      std::__shared_weak_count::__release_weak(v17);
    }
    uint64_t v18 = *((void *)v16 + 2);
    *((void *)v16 + 2) = 0;
    if (v18) {
      (*(void (**)(uint64_t, SEL))(*(void *)v18 + 8))(v18, a2);
    }
    MEMORY[0x1A6239270](v16, 0x1020C4081634310);
  }
  v19 = self->_distanceAtlas.__ptr_.__value_;
  self->_distanceAtlas.__ptr_.__value_ = 0;
  if (v19)
  {
    uint64_t v20 = *((void *)v19 + 2);
    *((void *)v19 + 2) = 0;
    if (v20) {
      (*(void (**)(uint64_t, SEL))(*(void *)v20 + 8))(v20, a2);
    }
    MEMORY[0x1A6239270](v19, 0x1020C406E52F545);
  }
  v21 = self->_shaderLibrary.__cntrl_;
  self->_shaderLibrary.__ptr_ = 0;
  self->_shaderLibrary.__cntrl_ = 0;
  if (v21 && !atomic_fetch_add((atomic_ullong *volatile)v21 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v21 + 16))(v21, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v21);
  }
  v22 = self->_device.__ptr_.__value_;
  self->_device.__ptr_.__value_ = 0;
  if (v22)
  {
    v23 = (md::SharedDeviceResources *)*((void *)v22 + 3);
    *((void *)v22 + 3) = 0;
    if (v23)
    {
      md::SharedDeviceResources::~SharedDeviceResources(v23);
      MEMORY[0x1A6239270]();
    }
    v24 = (std::__shared_weak_count *)*((void *)v22 + 2);
    if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, SEL))v24->__on_zero_shared)(v24, a2);
      std::__shared_weak_count::__release_weak(v24);
    }
    MEMORY[0x1A6239270](v22, 0x1020C40E72D6CFBLL);
  }
  if (self->_snapshotterIsInService)
  {
    CTFontRemoveFromCaches();
    CGFontDBGetLocal();
    CGFontDBPurgeAllFonts();
    CGFontCacheGetLocalCache();
    CGFontCacheReset();
  }
  if (self->_defaultDecompressionSession)
  {
    CMPhotoDecompressionSessionReleaseHardwareResources();
    CMPhotoDecompressionSessionFlushCachedBuffers();
    CFRelease(self->_defaultDecompressionSession);
    self->_defaultDecompressionSession = 0;
  }
  if (GEOConfigGetBOOL())
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    v25 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1780000, v25, OS_LOG_TYPE_INFO, "Resetting memory allocators", buf, 2u);
    }

    uint64_t v27 = gss::Allocator::instance(v26);
    (*(void (**)(uint64_t))(*(void *)v27 + 48))(v27);
    {
      operator new();
    }
    (*(void (**)(uint64_t))(*(void *)ggl::Allocator::instance(void)::alloc + 48))(ggl::Allocator::instance(void)::alloc);
    {
      operator new();
    }
    v28 = (grl::Allocator *)(*(uint64_t (**)(uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 48))(mdm::Allocator::instance(void)::alloc);
    uint64_t v29 = grl::Allocator::instance(v28);
    v30 = (geo::codec::Allocator *)(*(uint64_t (**)(uint64_t))(*(void *)v29 + 48))(v29);
    uint64_t v31 = geo::codec::Allocator::instance(v30);
    (*(void (**)(uint64_t))(*(void *)v31 + 48))(v31);
    GEOResetGeoCodecsAllocator();
  }
  v32.receiver = self;
  v32.super_class = (Class)VKSharedResources;
  [(VKSharedResources *)&v32 dealloc];
}

- (CMPhotoDecompressionSession)defaultDecompressionSession
{
  p_figCreationLock = &self->_figCreationLock;
  v4 = (geo::read_write_lock *)pthread_rwlock_rdlock(&self->_figCreationLock._lock);
  if (v4) {
    geo::read_write_lock::logFailure(v4, (uint64_t)"read lock", v5);
  }
  defaultDecompressionSession = self->_defaultDecompressionSession;
  v7 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_figCreationLock->_lock);
  if (defaultDecompressionSession)
  {
    if (v7) {
      geo::read_write_lock::logFailure(v7, (uint64_t)"unlock", v8);
    }
  }
  else
  {
    if (v7) {
      geo::read_write_lock::logFailure(v7, (uint64_t)"unlock", v8);
    }
    [(VKSharedResources *)self startDecompressionSession];
  }
  return self->_defaultDecompressionSession;
}

- (void)undulationModel
{
  uint64_t v5 = self;
  p_undulationModelCreationFlag = &self->_undulationModelCreationFlag;
  v4 = &v5;
  if (atomic_load_explicit((atomic_ullong *volatile)p_undulationModelCreationFlag, memory_order_acquire) != -1)
  {
    v7 = &v4;
    char v6 = &v7;
    std::__call_once(&p_undulationModelCreationFlag->__state_, &v6, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<-[VKSharedResources undulationModel]::$_0 &&>>);
  }
  return v5->_undulationModel.__ptr_.__value_;
}

@end