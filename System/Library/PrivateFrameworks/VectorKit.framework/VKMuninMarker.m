@interface VKMuninMarker
- ($1AB5FA073B851C12C2339EC22442E995)coordinate;
- (BOOL)canMoveToMarker;
- (NSDate)collectionDate;
- (VKMuninMarker)initWithCollectionPoint:(const void *)a3;
- (VKMuninMarker)initWithCoordinate:(id)a3;
- (const)collectionPoint;
- (id).cxx_construct;
- (unint64_t)pointId;
- (unsigned)buildId;
@end

@implementation VKMuninMarker

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (self->_collectionPoint._hasValue)
  {
    v3 = *(void **)&self->_anon_18[80];
    v4 = *(void **)&self->_anon_18[88];
    if (v3 != v4)
    {
      do
      {
        v5 = (void *)v3[31];
        if (v5 != (void *)v3[33]) {
          free(v5);
        }
        v3 += 36;
      }
      while (v3 != v4);
      v3 = *(void **)&self->_anon_18[80];
    }
    if (v3 != *(void **)&self->_anon_18[96]) {
      free(v3);
    }
    self->_collectionPoint._hasValue = 0;
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  double altitude = self->_coordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (unsigned)buildId
{
  if (self->_collectionPoint._hasValue) {
    return *(_DWORD *)&self->_anon_18[1844];
  }
  else {
    return 0;
  }
}

- (unint64_t)pointId
{
  if (self->_collectionPoint._hasValue) {
    return *(void *)&self->_collectionPoint._value.type;
  }
  else {
    return 0;
  }
}

- (BOOL)canMoveToMarker
{
  return self->_collectionPoint._hasValue;
}

- (NSDate)collectionDate
{
  if (self->_collectionPoint._hasValue) {
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)*(unint64_t *)&self->_anon_18[72] * 0.001];
  }
  else {
  v2 = [MEMORY[0x1E4F1C9C8] date];
  }
  return (NSDate *)v2;
}

- (const)collectionPoint
{
  if (self->_collectionPoint._hasValue) {
    return &self->_collectionPoint._value;
  }
  else {
    return 0;
  }
}

- (VKMuninMarker)initWithCoordinate:(id)a3
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v10.receiver = self;
  v10.super_class = (Class)VKMuninMarker;
  v6 = [(VKMuninMarker *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_coordinate.double latitude = var0;
    v6->_coordinate.double longitude = var1;
    v6->_coordinate.double altitude = var2;
    v8 = v6;
  }

  return v7;
}

- (VKMuninMarker)initWithCollectionPoint:(const void *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)VKMuninMarker;
  v4 = [(VKMuninMarker *)&v20 init];
  if (v4)
  {
    uint64_t v21 = *(void *)a3;
    long long v22 = *(_OWORD *)((char *)a3 + 8);
    uint64_t v5 = *((void *)a3 + 4);
    uint64_t v23 = *((void *)a3 + 3);
    uint64_t v24 = v5;
    int v25 = *((_DWORD *)a3 + 10);
    uint64_t v26 = *(void *)((char *)a3 + 44);
    long long v27 = *(_OWORD *)((char *)a3 + 56);
    long long v28 = *(_OWORD *)((char *)a3 + 72);
    v29 = v33;
    v30 = v33;
    v31 = v33;
    uint64_t v32 = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v29, *((long long **)a3 + 11), *((long long **)a3 + 12));
    *(void *)((char *)v34 + 5) = *(void *)((char *)a3 + 1853);
    v34[0] = *((void *)a3 + 231);
    geo::optional<md::mun::CollectionPoint>::optional((uint64_t)v35, (uint64_t)&v21);
    v6 = v29;
    v7 = v30;
    if (v29 != v30)
    {
      do
      {
        v8 = (void *)v6[31];
        if (v8 != (void *)v6[33]) {
          free(v8);
        }
        v6 += 36;
      }
      while (v6 != v7);
      v6 = v29;
    }
    if (v6 != (void *)v31) {
      free(v6);
    }
    geo::optional<md::mun::CollectionPoint>::operator=((uint64_t)&v4->_collectionPoint, (uint64_t)v35);
    if (v35[0])
    {
      v9 = v36;
      objc_super v10 = v37;
      if (v36 != v37)
      {
        do
        {
          v11 = (void *)v9[31];
          if (v11 != (void *)v9[33]) {
            free(v11);
          }
          v9 += 36;
        }
        while (v9 != v10);
        v9 = v36;
      }
      if (v9 != v38) {
        free(v9);
      }
    }
    long double v12 = *((double *)a3 + 7) * 6.28318531;
    long double v13 = exp(*((double *)a3 + 8) * 6.28318531 + -3.14159265);
    double v14 = atan(v13);
    long double v15 = fmod(v12, 6.28318531);
    long double v16 = fmod(v15 + 6.28318531, 6.28318531);
    double v17 = *((double *)a3 + 9);
    v4->_coordinate.double latitude = v14 * 114.591559 + -90.0;
    v4->_coordinate.double longitude = v16 * 57.2957795 + -180.0;
    v4->_coordinate.double altitude = v17;
    v18 = v4;
  }

  return v4;
}

@end