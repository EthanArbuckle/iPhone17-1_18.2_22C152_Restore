@interface VKMarkerFeatureHandle
- (VKMarkerFeatureHandle)initWithMarkerHandle:(const void *)a3 featureType:(int)a4;
- (const)actualHandle;
- (id).cxx_construct;
- (id)styleAttributes;
- (int)featureType;
- (int)tileStyle;
- (int)tileX;
- (int)tileY;
- (int)tileZ;
- (int64_t)featureIndex;
- (unsigned)tileVersion;
@end

@implementation VKMarkerFeatureHandle

- (id).cxx_construct
{
  *((_WORD *)self + 12) = 255;
  *((_DWORD *)self + 7) = 0;
  *((_DWORD *)self + 8) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  cntrl = self->_actualHandle.styleAttributes.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id)styleAttributes
{
  return self->_styleAttributes;
}

- (unsigned)tileVersion
{
  return self->_actualHandle.tileVersion;
}

- (int)tileStyle
{
  return self->_actualHandle.tileStyle;
}

- (int)tileZ
{
  return self->_actualHandle.key._level;
}

- (int)tileY
{
  return self->_actualHandle.key._yIdx;
}

- (int)tileX
{
  return self->_actualHandle.key._xIdx;
}

- (int64_t)featureIndex
{
  return self->_actualHandle.featureIndex;
}

- (int)featureType
{
  return self->_featureType;
}

- (const)actualHandle
{
  return &self->_actualHandle;
}

- (VKMarkerFeatureHandle)initWithMarkerHandle:(const void *)a3 featureType:(int)a4
{
  v17.receiver = self;
  v17.super_class = (Class)VKMarkerFeatureHandle;
  v6 = [(VKMarkerFeatureHandle *)&v17 init];
  v7 = v6;
  v8 = (VKMarkerFeatureHandle *)v6;
  if (v6)
  {
    long long v9 = *(_OWORD *)a3;
    long long v10 = *((_OWORD *)a3 + 1);
    *(_OWORD *)(v6 + 40) = *((_OWORD *)a3 + 2);
    *(_OWORD *)(v6 + 24) = v10;
    *(_OWORD *)(v6 + 8) = v9;
    uint64_t v12 = *((void *)a3 + 6);
    uint64_t v11 = *((void *)a3 + 7);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    v13 = (std::__shared_weak_count *)*((void *)v6 + 8);
    *((void *)v6 + 7) = v12;
    *((void *)v6 + 8) = v11;
    if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F645A0]) initWithFeatureStyleAttributesConstPtr:v7 + 56];
    styleAttributes = v8->_styleAttributes;
    v8->_styleAttributes = (GEOFeatureStyleAttributes *)v14;

    v8->_featureType = a4;
  }
  return v8;
}

@end