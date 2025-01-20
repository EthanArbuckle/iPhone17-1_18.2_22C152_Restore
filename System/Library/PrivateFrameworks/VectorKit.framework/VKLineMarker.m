@interface VKLineMarker
+ (id)markerWithLabelFeatureMarker:(const void *)a3;
- (NSString)localizedName;
- (VKLineMarker)initWithLabelFeatureMarkerPtr:(const void *)a3;
- (const)labelFeatureMarkerImpl;
- (id).cxx_construct;
- (id)featureHandles;
@end

@implementation VKLineMarker

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_labelFeatureMarker.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id)featureHandles
{
  v2 = (long long *)*((void *)self->_labelFeatureMarker.__ptr_ + 8);
  long long v26 = *v2;
  char v3 = *((unsigned char *)v2 + 17);
  int v4 = *((_DWORD *)v2 + 5);
  int v5 = *((_DWORD *)v2 + 6);
  char v6 = *((unsigned char *)v2 + 16);
  uint64_t v7 = *((void *)v2 + 5);
  uint64_t v8 = *((void *)v2 + 6);
  v9 = (std::__shared_weak_count *)*((void *)v2 + 7);
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v10 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
  {
    v10 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    if (v20) {
      operator new();
    }
  }
  uint64_t v25 = *((void *)v10 + 91);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v25 + 16))(v25, 64, 8);
  uint64_t v21 = v11;
  uint64_t v24 = v11 + 64;
  if (v11)
  {
    *(_OWORD *)uint64_t v11 = v26;
    *(unsigned char *)(v11 + 16) = v6;
    *(unsigned char *)(v11 + 17) = v3;
    *(_DWORD *)(v11 + 20) = v4;
    *(_DWORD *)(v11 + 24) = v5;
    *(void *)(v11 + 40) = v7;
    *(void *)(v11 + 48) = v8;
    *(void *)(v11 + 56) = v9;
    if (!v9)
    {
      uint64_t v23 = v11 + 64;
      goto LABEL_11;
    }
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v23 = v11 + 64;
  }
  else
  {
    uint64_t v23 = 64;
    if (!v9) {
      goto LABEL_11;
    }
  }
  if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_11:
  uint64_t v13 = v21;
  uint64_t v12 = v23;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(v23 - v21) >> 6];
  if (v21 != v23)
  {
    uint64_t v15 = v21;
    do
    {
      v16 = [[VKMarkerFeatureHandle alloc] initWithMarkerHandle:v15 featureType:1];
      if (v16) {
        [v14 addObject:v16];
      }

      v15 += 64;
    }
    while (v15 != v23);
  }
  v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v14, v21);

  if (v13)
  {
    if (v13 != v23)
    {
      do
      {
        v18 = *(std::__shared_weak_count **)(v12 - 8);
        if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
        v12 -= 64;
      }
      while (v12 != v13);
      uint64_t v12 = v22;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v25 + 40))(v25, v12, v24 - v12);
  }
  return v17;
}

- (NSString)localizedName
{
  v2 = NSString;
  (*(void (**)(void *__return_ptr))(*(void *)self->_labelFeatureMarker.__ptr_ + 16))(v6);
  if (v7 >= 0) {
    char v3 = v6;
  }
  else {
    char v3 = (void *)v6[0];
  }
  int v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v7) < 0) {
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  }
  return (NSString *)v4;
}

- (const)labelFeatureMarkerImpl
{
  return &self->_labelFeatureMarker;
}

- (VKLineMarker)initWithLabelFeatureMarkerPtr:(const void *)a3
{
  int v4 = (std::__shared_weak_count *)*((void *)a3 + 1);
  uint64_t v12 = *(LabelFeatureMarker **)a3;
  uint64_t v13 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v11.receiver = self;
  v11.super_class = (Class)VKLineMarker;
  int v5 = [(VKMarker *)&v11 initWithFeatureMarkerPtr:&v12 markerType:4];
  char v6 = v13;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  if (v5)
  {
    uint64_t v8 = *(LabelFeatureMarker **)a3;
    uint64_t v7 = *((void *)a3 + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v5->_labelFeatureMarker.__cntrl_;
    v5->_labelFeatureMarker.__ptr_ = v8;
    v5->_labelFeatureMarker.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  return v5;
}

+ (id)markerWithLabelFeatureMarker:(const void *)a3
{
  if (*(void *)a3)
  {
    id v4 = *(id *)(*(void *)a3 + 24);
    int v5 = v4;
    if (v4) {
      char v6 = (VKLineMarker *)v4;
    }
    else {
      char v6 = [[VKLineMarker alloc] initWithLabelFeatureMarkerPtr:a3];
    }
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

@end