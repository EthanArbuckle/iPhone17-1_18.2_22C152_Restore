@interface VKMarker
+ (id)markerWithFeatureMarker:(const void *)a3;
- (GEOFeatureStyleAttributes)styleAttributes;
- (NSString)name;
- (NSString)shortName;
- (VKMarker)initWithFeatureMarkerPtr:(const void *)a3 markerType:(int)a4;
- (const)actualMarker;
- (id).cxx_construct;
- (id)featureHandles;
- (int)markerType;
- (unint64_t)featureID;
- (unint64_t)venueID;
- (void)dealloc;
@end

@implementation VKMarker

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  cntrl = self->_actualMarker.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (int)markerType
{
  return self->_markerType;
}

- (id)featureHandles
{
  return 0;
}

- (const)actualMarker
{
  return &self->_actualMarker;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  styleAttributes = self->_styleAttributes;
  if (styleAttributes) {
    styleAttributes = (GEOFeatureStyleAttributes *)[(GEOFeatureStyleAttributes *)styleAttributes copy];
  }
  return styleAttributes;
}

- (unint64_t)venueID
{
  return (*(uint64_t (**)(void))(*(void *)self->_actualMarker.__ptr_ + 40))();
}

- (unint64_t)featureID
{
  return (*(uint64_t (**)(void))(*(void *)self->_actualMarker.__ptr_ + 32))();
}

- (NSString)shortName
{
  v2 = NSString;
  (*(void (**)(void *__return_ptr))(*(void *)self->_actualMarker.__ptr_ + 24))(v6);
  if (v7 >= 0) {
    v3 = v6;
  }
  else {
    v3 = (void *)v6[0];
  }
  v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v7) < 0) {
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  }
  return (NSString *)v4;
}

- (NSString)name
{
  v2 = NSString;
  (*(void (**)(void *__return_ptr))(*(void *)self->_actualMarker.__ptr_ + 16))(v6);
  if (v7 >= 0) {
    v3 = v6;
  }
  else {
    v3 = (void *)v6[0];
  }
  v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v7) < 0) {
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  }
  return (NSString *)v4;
}

- (void)dealloc
{
  ptr = self->_actualMarker.__ptr_;
  if (ptr)
  {
    *(void *)&ptr->markerName[18] = 0;
    cntrl = self->_actualMarker.__cntrl_;
    self->_actualMarker.__ptr_ = 0;
    self->_actualMarker.__cntrl_ = 0;
    if (cntrl)
    {
      if (!atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VKMarker;
  [(VKMarker *)&v5 dealloc];
}

- (VKMarker)initWithFeatureMarkerPtr:(const void *)a3 markerType:(int)a4
{
  v27.receiver = self;
  v27.super_class = (Class)VKMarker;
  v6 = [(VKMarker *)&v27 init];
  uint64_t v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_markerType = a4;
  v9 = *(Marker **)a3;
  uint64_t v8 = *((void *)a3 + 1);
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v6->_actualMarker.__cntrl_;
  v6->_actualMarker.__ptr_ = v9;
  v6->_actualMarker.__cntrl_ = (__shared_weak_count *)v8;
  if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
    std::__shared_weak_count::__release_weak(cntrl);
  }
  ptr = v7->_actualMarker.__ptr_;
  *(void *)&ptr->markerName[18] = v7;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)&ptr->id + 96))(&v25);
  uint64_t v13 = v25;
  v12 = v26;
  if (!v26 || atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v13) {
      goto LABEL_10;
    }
LABEL_17:
    styleAttributes = v7->_styleAttributes;
    v7->_styleAttributes = 0;

    return v7;
  }
  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
  std::__shared_weak_count::__release_weak(v12);
  if (!v13) {
    goto LABEL_17;
  }
LABEL_10:
  (*(void (**)(const FeatureStyleAttributes **__return_ptr))(*(void *)v7->_actualMarker.__ptr_ + 96))(&v23);
  v14 = v23;
  v15 = (char *)operator new(0x40uLL);
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  *(void *)v15 = &unk_1EF57F680;
  FeatureStyleAttributes::FeatureStyleAttributes((FeatureStyleAttributes *)(v15 + 24), v14);
  uint64_t v25 = v16;
  v26 = (std::__shared_weak_count *)v15;
  v17 = v24;
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F645A0]) initWithFeatureStyleAttributesPtr:&v25];
  v19 = v7->_styleAttributes;
  v7->_styleAttributes = (GEOFeatureStyleAttributes *)v18;

  v20 = v26;
  if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  return v7;
}

+ (id)markerWithFeatureMarker:(const void *)a3
{
  if (*(void *)a3)
  {
    v4 = (VKMarker *)*(id *)(*(void *)a3 + 24);
    if (!v4) {
      v4 = [[VKMarker alloc] initWithFeatureMarkerPtr:a3 markerType:0];
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end