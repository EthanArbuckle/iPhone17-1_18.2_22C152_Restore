@interface VKVenueFeatureMarker
- (GEOMapItemIdentifier)mapIdentifier;
- (NSArray)buildings;
- (VKVenueFeatureMarker)initWithVenue:(const void *)a3 localize:(BOOL)a4;
- (id)name;
- (id)shortName;
- (unint64_t)businessID;
@end

@implementation VKVenueFeatureMarker

- (id)shortName
{
  v2 = NSString;
  (*(void (**)(void *__return_ptr))(**(void **)[(VKVenueFeatureMarker *)self venueFeatureMarker]+ 24))(v6);
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
  return v4;
}

- (id)name
{
  v2 = NSString;
  (*(void (**)(void *__return_ptr))(**(void **)[(VKVenueFeatureMarker *)self venueFeatureMarker]+ 16))(v6);
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
  return v4;
}

- (NSArray)buildings
{
  uint64_t v3 = *(void *)[(VKVenueFeatureMarker *)self venueFeatureMarker];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*(void *)(v3 + 56) - *(void *)(v3 + 48)) >> 3)];
  uint64_t v5 = *(void *)(v3 + 48);
  for (uint64_t i = *(void *)(v3 + 56); v5 != i; v5 += 120)
  {
    uint64_t v7 = [[VKVenueBuildingFeatureMarker alloc] initWithVenueBuilding:v5 localize:*((unsigned __int8 *)&self->super._markerType + 4)];
    [v4 addObject:v7];
  }
  return (NSArray *)v4;
}

- (GEOMapItemIdentifier)mapIdentifier
{
  uint64_t v3 = [(VKVenueFeatureMarker *)self venueFeatureMarker];
  long double v4 = *(double *)(*(void *)v3 + 120) * 6.28318531;
  long double v5 = exp(*(double *)(*(void *)v3 + 128) * 6.28318531 + -3.14159265);
  double v6 = atan(v5);
  long double v7 = fmod(v4, 6.28318531);
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F646B8]), "initWithMUID:coordinate:", -[VKVenueFeatureMarker businessID](self, "businessID"), v6 * 114.591559 + -90.0, (double)(fmod(v7 + 6.28318531, 6.28318531) * 57.2957795 + -180.0));
  return (GEOMapItemIdentifier *)v8;
}

- (unint64_t)businessID
{
  return *(void *)(*(void *)[(VKVenueFeatureMarker *)self venueFeatureMarker] + 40);
}

- (VKVenueFeatureMarker)initWithVenue:(const void *)a3 localize:(BOOL)a4
{
  *((unsigned char *)&self->super._markerType + 4) = a4;
  long double v5 = (std::__shared_weak_count *)operator new(0x110uLL);
  v5->__shared_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF5809F8;
  double v6 = v5 + 1;
  v5[1].__shared_weak_owners_ = 0;
  v5[2].__vftable = 0;
  v5[1].__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF53AF60;
  long long v7 = *(_OWORD *)a3;
  v5[3].__vftable = 0;
  *(_OWORD *)&v5[2].__shared_owners_ = v7;
  v5[3].__shared_owners_ = 0;
  v5[3].__shared_weak_owners_ = 0;
  uint64_t v8 = *((void *)a3 + 2);
  uint64_t v9 = *((void *)a3 + 3);
  int64_t v10 = v9 - v8;
  if (v9 != v8)
  {
    unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * (v10 >> 3);
    if (v11 >= 0x222222222222223) {
      abort();
    }
    v12 = (std::__shared_weak_count_vtbl *)operator new(v10);
    uint64_t v13 = 0;
    v5[3].__vftable = v12;
    v5[3].__shared_owners_ = (uint64_t)v12;
    v5[3].__shared_weak_owners_ = (uint64_t)(v12 + 3 * v11);
    do
    {
      md::VenueBuilding::VenueBuilding(&v12[v13].~__shared_weak_count, (uint64_t *)(v8 + v13 * 40));
      v13 += 3;
    }
    while (v8 + v13 * 40 != v9);
    v5[3].__shared_owners_ = (uint64_t)&v12[v13];
  }
  v5[4].__vftable = 0;
  v5[4].__shared_owners_ = 0;
  v5[4].__shared_weak_owners_ = 0;
  v15 = (unsigned char *)*((void *)a3 + 5);
  v14 = (unsigned char *)*((void *)a3 + 6);
  uint64_t v16 = v14 - v15;
  if (v14 != v15)
  {
    if (v16 < 0) {
      abort();
    }
    v17 = (std::__shared_weak_count_vtbl *)operator new(v14 - v15);
    v5[4].__vftable = v17;
    v5[4].__shared_owners_ = (uint64_t)v17;
    v5[4].__shared_weak_owners_ = (uint64_t)v17 + 16 * (v16 >> 4);
    size_t v18 = v16 & 0xFFFFFFFFFFFFFFF0;
    memcpy(v17, v15, v18);
    v5[4].__shared_owners_ = (uint64_t)v17 + v18;
  }
  v5[5].__vftable = 0;
  v5[5].__shared_owners_ = 0;
  v5[5].__shared_weak_owners_ = 0;
  if (&v5[2].__shared_owners_ != a3) {
    std::vector<gm::Matrix<double,2,1>>::__assign_with_size[abi:nn180100]<gm::Matrix<double,2,1>*,gm::Matrix<double,2,1>*>((uint64_t)&v5[5], *((void *)a3 + 8), *((char **)a3 + 9), (uint64_t)(*((void *)a3 + 9) - *((void *)a3 + 8)) >> 4);
  }
  v5[6].std::__shared_count = *(std::__shared_count *)((char *)a3 + 88);
  if (*((char *)a3 + 127) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v5[6].__shared_weak_owners_, *((const std::string::value_type **)a3 + 13), *((void *)a3 + 14));
  }
  else
  {
    *(_OWORD *)&v5[6].__shared_weak_owners_ = *(_OWORD *)((char *)a3 + 104);
    v5[7].__shared_owners_ = *((void *)a3 + 15);
  }
  if (*((char *)a3 + 151) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v5[7].__shared_weak_owners_, *((const std::string::value_type **)a3 + 16), *((void *)a3 + 17));
  }
  else
  {
    *(_OWORD *)&v5[7].__shared_weak_owners_ = *((_OWORD *)a3 + 8);
    v5[8].__shared_owners_ = *((void *)a3 + 18);
  }
  LOBYTE(v5[8].__shared_weak_owners_) = 0;
  if (*((unsigned char *)a3 + 152))
  {
    if (*((char *)a3 + 183) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v5[9], *((const std::string::value_type **)a3 + 20), *((void *)a3 + 21));
    }
    else
    {
      v5[9].std::__shared_count = (std::__shared_count)*((_OWORD *)a3 + 10);
      v5[9].__shared_weak_owners_ = *((void *)a3 + 22);
    }
    LOBYTE(v5[8].__shared_weak_owners_) = 1;
  }
  LOBYTE(v5[10].__vftable) = 0;
  if (*((unsigned char *)a3 + 184))
  {
    p_shared_owners = (std::string *)&v5[10].__shared_owners_;
    if (*((char *)a3 + 215) < 0)
    {
      std::string::__init_copy_ctor_external(p_shared_owners, *((const std::string::value_type **)a3 + 24), *((void *)a3 + 25));
    }
    else
    {
      *(_OWORD *)&p_shared_owners->__r_.__value_.__l.__data_ = *((_OWORD *)a3 + 12);
      v5[11].__vftable = (std::__shared_weak_count_vtbl *)*((void *)a3 + 26);
    }
    LOBYTE(v5[10].__vftable) = 1;
  }
  *(void *)&long long v27 = v5 + 1;
  *((void *)&v27 + 1) = v5;
  shared_weak_owners = (std::__shared_weak_count *)v5[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1) {
      goto LABEL_33;
    }
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v5[1].__shared_owners_ = (uint64_t)v6;
    v5[1].__shared_weak_owners_ = (uint64_t)v5;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
  }
  else
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v5[1].__shared_owners_ = (uint64_t)v6;
    v5[1].__shared_weak_owners_ = (uint64_t)v5;
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_33:
  long long v28 = v27;
  long long v27 = 0uLL;
  v26.receiver = self;
  v26.super_class = (Class)VKVenueFeatureMarker;
  v21 = [(VKMarker *)&v26 initWithFeatureMarkerPtr:&v28 markerType:2];
  v22 = (std::__shared_weak_count *)*((void *)&v28 + 1);
  if (*((void *)&v28 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v28 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  v23 = (std::__shared_weak_count *)*((void *)&v27 + 1);
  if (*((void *)&v27 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v27 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }

  return v21;
}

@end