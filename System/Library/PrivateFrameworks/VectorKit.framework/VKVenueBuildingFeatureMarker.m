@interface VKVenueBuildingFeatureMarker
- ($F24F406B2B787EFB06265DBA3D28CBD5)nearestFramingPositionToLocation:(id)a3;
- (NSArray)floorOrdinals;
- (NSDictionary)floorNames;
- (NSDictionary)shortFloorNames;
- (VKVenueBuildingFeatureMarker)initWithVenueBuilding:(const void *)a3 localize:(BOOL)a4;
- (unint64_t)buildingId;
- (unint64_t)businessId;
@end

@implementation VKVenueBuildingFeatureMarker

- ($F24F406B2B787EFB06265DBA3D28CBD5)nearestFramingPositionToLocation:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v5 = *(void *)[(VKVenueBuildingFeatureMarker *)self venueBuildingFeatureMarker];
  long double v6 = tan(var0 * 0.00872664626 + 0.785398163);
  double v7 = log(v6);
  v8 = *(double **)(v5 + 112);
  v9 = *(double **)(v5 + 120);
  uint64_t v10 = ((char *)v9 - (char *)v8) >> 4;
  if (v10)
  {
    if (v10 == 1)
    {
      double v12 = *v8;
      double v11 = v8[1];
    }
    else
    {
      double v12 = var1 * 0.00277777778 + 0.5;
      double v11 = v7 * 0.159154943 + 0.5;
      if (v9 != v8)
      {
        uint64_t v13 = 0;
        v14 = v8 + 1;
        double v15 = v8[1];
        double v16 = *v8;
        char v17 = 1;
        double v18 = 1.79769313e308;
        do
        {
          double v20 = *(v14 - 1);
          double v19 = *v14;
          if (v10 - 1 == v13) {
            uint64_t v21 = 0;
          }
          else {
            uint64_t v21 = v13 + 1;
          }
          v22 = &v8[2 * v21];
          double v23 = *v22;
          double v24 = v22[1];
          double v25 = *v22 - v20;
          double v26 = v24 - v19;
          if (-((v24 - v19) * (v12 - v20) - v25 * (v11 - v19)) < 0.0)
          {
            double v27 = (v25 * (v12 - v20) + v26 * (v11 - v19)) / (v25 * v25 + v26 * v26);
            if (v27 >= 0.0)
            {
              if (v27 <= 1.0)
              {
                double v23 = v20 + v27 * v25;
                double v24 = v19 + v27 * v26;
              }
            }
            else
            {
              double v23 = *(v14 - 1);
              double v24 = *v14;
            }
            char v17 = 0;
            if ((v12 - v23) * (v12 - v23) + (v11 - v24) * (v11 - v24) < v18)
            {
              double v16 = v23;
              double v15 = v24;
              double v18 = (v12 - v23) * (v12 - v23) + (v11 - v24) * (v11 - v24);
            }
          }
          ++v13;
          v14 += 2;
        }
        while (v10 != v13);
        if ((v17 & 1) == 0)
        {
          double v12 = v16;
          double v11 = v15;
        }
      }
    }
    long double v28 = v12 * 6.28318531;
    long double v29 = exp(v11 * 6.28318531 + -3.14159265);
    double v30 = atan(v29);
    long double v31 = fmod(v28, 6.28318531);
    double var1 = fmod(v31 + 6.28318531, 6.28318531) * 57.2957795 + -180.0;
    double var0 = v30 * 114.591559 + -90.0;
  }
  double v32 = var0;
  double v33 = var1;
  result.double var1 = v33;
  result.double var0 = v32;
  return result;
}

- (NSDictionary)floorNames
{
  uint64_t v3 = *(void *)[(VKVenueBuildingFeatureMarker *)self venueBuildingFeatureMarker];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0xD37A6F4DE9BD37A7 * ((uint64_t)(*(void *)(v3 + 40) - *(void *)(v3 + 32)) >> 3)];
  uint64_t v5 = *(unsigned char **)(v3 + 32);
  long double v6 = *(unsigned char **)(v3 + 40);
  if (v5 != v6)
  {
    double v7 = v5 + 112;
    do
    {
      if (*(v7 - 64))
      {
        if (!*((unsigned char *)&self->super._markerType + 4) || (v9 = v7, !*v7)) {
          v9 = v5 + 48;
        }
        double v12 = (unsigned char *)*((void *)v9 + 1);
        uint64_t v10 = v9 + 8;
        double v11 = v12;
        if ((char)v10[23] >= 0) {
          uint64_t v13 = v10;
        }
        else {
          uint64_t v13 = v11;
        }
        v14 = [NSString stringWithUTF8String:v13];
        double v15 = [NSNumber numberWithShort:*((__int16 *)v7 - 52)];
        [v4 setObject:v14 forKeyedSubscript:v15];
      }
      v5 += 184;
      v8 = v7 + 72;
      v7 += 184;
    }
    while (v8 != v6);
  }
  return (NSDictionary *)v4;
}

- (NSDictionary)shortFloorNames
{
  uint64_t v3 = *(void *)[(VKVenueBuildingFeatureMarker *)self venueBuildingFeatureMarker];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0xD37A6F4DE9BD37A7 * ((uint64_t)(*(void *)(v3 + 40) - *(void *)(v3 + 32)) >> 3)];
  uint64_t v5 = *(unsigned char **)(v3 + 32);
  long double v6 = *(unsigned char **)(v3 + 40);
  if (v5 != v6)
  {
    double v7 = v5 + 80;
    do
    {
      if (*(v7 - 64))
      {
        if (!*((unsigned char *)&self->super._markerType + 4) || (v9 = v7, !*v7)) {
          v9 = v5 + 16;
        }
        double v12 = (unsigned char *)*((void *)v9 + 1);
        uint64_t v10 = v9 + 8;
        double v11 = v12;
        if ((char)v10[23] >= 0) {
          uint64_t v13 = v10;
        }
        else {
          uint64_t v13 = v11;
        }
        v14 = [NSString stringWithUTF8String:v13];
        double v15 = [NSNumber numberWithShort:*((__int16 *)v7 - 36)];
        [v4 setObject:v14 forKeyedSubscript:v15];
      }
      v5 += 184;
      v8 = v7 + 104;
      v7 += 184;
    }
    while (v8 != v6);
  }
  return (NSDictionary *)v4;
}

- (NSArray)floorOrdinals
{
  uint64_t v2 = *(void *)[(VKVenueBuildingFeatureMarker *)self venueBuildingFeatureMarker];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xD37A6F4DE9BD37A7 * ((uint64_t)(*(void *)(v2 + 40) - *(void *)(v2 + 32)) >> 3)];
  uint64_t v4 = *(void *)(v2 + 32);
  for (uint64_t i = *(void *)(v2 + 40); v4 != i; v4 += 184)
  {
    long double v6 = [NSNumber numberWithShort:*(__int16 *)(v4 + 8)];
    [v3 addObject:v6];
  }
  return (NSArray *)v3;
}

- (unint64_t)businessId
{
  return *(void *)(*(void *)[(VKVenueBuildingFeatureMarker *)self venueBuildingFeatureMarker]+ 80);
}

- (unint64_t)buildingId
{
  uint64_t v2 = *(uint64_t (**)(void))(**(void **)[(VKVenueBuildingFeatureMarker *)self venueBuildingFeatureMarker]+ 48);
  return v2();
}

- (VKVenueBuildingFeatureMarker)initWithVenueBuilding:(const void *)a3 localize:(BOOL)a4
{
  *((unsigned char *)&self->super._markerType + 4) = a4;
  long double v6 = (std::__shared_weak_count *)operator new(0xB0uLL);
  v6->__shared_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF582048;
  double v7 = v6 + 1;
  v6[1].__shared_weak_owners_ = 0;
  v6[2].__vftable = 0;
  v6[1].__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF5481D8;
  md::VenueBuilding::VenueBuilding(&v6[2].__shared_owners_, (uint64_t *)a3);
  *(void *)&long long v14 = v6 + 1;
  *((void *)&v14 + 1) = v6;
  shared_weak_owners = (std::__shared_weak_count *)v6[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1) {
      goto LABEL_7;
    }
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v6[1].__shared_owners_ = (uint64_t)v7;
    v6[1].__shared_weak_owners_ = (uint64_t)v6;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
  }
  else
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v6[1].__shared_owners_ = (uint64_t)v7;
    v6[1].__shared_weak_owners_ = (uint64_t)v6;
  }
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
LABEL_7:
  long long v15 = v14;
  long long v14 = 0uLL;
  v13.receiver = self;
  v13.super_class = (Class)VKVenueBuildingFeatureMarker;
  v9 = [(VKMarker *)&v13 initWithFeatureMarkerPtr:&v15 markerType:3];
  uint64_t v10 = (std::__shared_weak_count *)*((void *)&v15 + 1);
  if (*((void *)&v15 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v15 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  double v11 = (std::__shared_weak_count *)*((void *)&v14 + 1);
  if (*((void *)&v14 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v14 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }

  return v9;
}

@end