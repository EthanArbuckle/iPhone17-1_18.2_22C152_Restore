@interface VKStylesheetVendorResourceManifestTileGroupObserverProxy
- (VKStylesheetVendorResourceManifestTileGroupObserverProxy)initWithStylesheetVendor:(shared_ptr<md::StylesheetVendor>)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)resourceManifestManagerWillChangeActiveTileGroup:(id)a3;
@end

@implementation VKStylesheetVendorResourceManifestTileGroupObserverProxy

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (VKStylesheetVendorResourceManifestTileGroupObserverProxy)initWithStylesheetVendor:(shared_ptr<md::StylesheetVendor>)a3
{
  ptr = a3.__ptr_;
  v11.receiver = self;
  v11.super_class = (Class)VKStylesheetVendorResourceManifestTileGroupObserverProxy;
  v4 = [(VKStylesheetVendorResourceManifestTileGroupObserverProxy *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(StylesheetVendor **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_vendor.__cntrl_;
    v5->_vendor.__ptr_ = v7;
    v5->_vendor.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v9 = [MEMORY[0x1E4F64918] modernManager];
    [v9 addTileGroupObserver:v5 queue:MEMORY[0x1E4F14428]];
  }
  return v5;
}

- (void).cxx_destruct
{
  cntrl = self->_vendor.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v4 = a3;
  cntrl = self->_vendor.__cntrl_;
  if (cntrl)
  {
    id v8 = v4;
    uint64_t v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    id v4 = v8;
    if (v6)
    {
      v7 = v6;
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, id))v6->__on_zero_shared)(v6, v8);
        std::__shared_weak_count::__release_weak(v7);
        id v4 = v8;
      }
    }
  }
}

- (void)resourceManifestManagerWillChangeActiveTileGroup:(id)a3
{
  id v8 = a3;
  cntrl = self->_vendor.__cntrl_;
  if (cntrl)
  {
    v5 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v5)
    {
      uint64_t v6 = v5;
      ptr = self->_vendor.__ptr_;
      if (ptr) {
        md::StylesheetVendor::resetStylesheetCache((os_unfair_lock_s *)ptr);
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F64918] modernManager];
  [v3 removeTileGroupObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VKStylesheetVendorResourceManifestTileGroupObserverProxy;
  [(VKStylesheetVendorResourceManifestTileGroupObserverProxy *)&v4 dealloc];
}

@end