@interface VKTransitLineMarker
+ (id)markerWithFeature:(void *)a3 transitLink:(const void *)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)shieldColor;
- (GEOMapItemIdentifier)identifier;
- (NSString)labelLocale;
- (NSString)labelText;
- (NSString)shieldLocale;
- (NSString)shieldText;
- (VKTransitLineMarker)initWithFeature:(void *)a3 transitLink:(const void *)a4;
- (VKTransitLineMarker)initWithIdentifier:(id)a3;
- (id)description;
- (int64_t)shieldType;
- (unint64_t)featureID;
- (void)transitLinkID;
@end

@implementation VKTransitLineMarker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLocale, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_shieldLocale, 0);
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)transitLinkID
{
  return self->_transitLinkID;
}

- (NSString)labelLocale
{
  return self->_labelLocale;
}

- (NSString)labelText
{
  return self->_labelText;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)shieldColor
{
  float r = self->_shieldColor.r;
  float g = self->_shieldColor.g;
  float b = self->_shieldColor.b;
  float a = self->_shieldColor.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (NSString)shieldLocale
{
  return self->_shieldLocale;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (unint64_t)featureID
{
  return [(GEOMapItemIdentifier *)self->_identifier muid];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu", -[GEOMapItemIdentifier muid](self->_identifier, "muid"));
}

- (VKTransitLineMarker)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receivefloat r = self;
  v9.super_class = (Class)VKTransitLineMarker;
  v6 = [(VKTransitLineMarker *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (VKTransitLineMarker)initWithFeature:(void *)a3 transitLink:(const void *)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v31.receivefloat r = self;
  v31.super_class = (Class)VKTransitLineMarker;
  v6 = [(VKTransitLineMarker *)&v31 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F646B8]);
    uint64_t v8 = *((void *)a3 + 5);
    if (a4 && geo::codec::transitLinkFirstPoint((uint64_t)a4))
    {
      v32 = 0;
      v33 = 0;
      objc_super v9 = (std::__shared_weak_count *)*((void *)a4 + 1);
      if (v9)
      {
        objc_super v9 = std::__shared_weak_count::lock(v9);
        v10 = v9;
        v33 = v9;
        if (v9)
        {
          objc_super v9 = *(std::__shared_weak_count **)a4;
          v32 = *(std::__shared_weak_count **)a4;
        }
      }
      else
      {
        v10 = 0;
      }
      geo::codec::VectorTile::key((geo::codec::VectorTile *)v9);
      v34[0] = GEOTileKeyMake();
      v34[1] = v13;
      if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      GEOMapRectForGEOTileKey();
      GEOCoordinate2DForMapPoint();
    }
    else
    {
      double v11 = -180.0;
      double v12 = -180.0;
    }
    uint64_t v14 = objc_msgSend(v7, "initWithMUID:resultProviderID:coordinate:", v8, 0, v11, v12);
    v15 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v14;

    *((void *)v6 + 9) = a4;
    if (geo::codec::featureGetNativeShieldCount((uint64_t)a3))
    {
      v34[0] = 0;
      v32 = 0;
      geo::codec::featureGetNativeShield((uint64_t)a3, 0, v34, (void *)v6 + 4, &v32);
      if (v34[0])
      {
        id v16 = [NSString alloc];
        uint64_t v17 = [v16 initWithUTF8String:v34[0]];
        v18 = (void *)*((void *)v6 + 2);
        *((void *)v6 + 2) = v17;
      }
      if (v32)
      {
        id v19 = [NSString alloc];
        uint64_t v20 = [v19 initWithUTF8String:v32];
        v21 = (void *)*((void *)v6 + 3);
        *((void *)v6 + 3) = v20;
      }
    }
    if (geo::codec::featureGetNativeLabelCount((uint64_t)a3))
    {
      v34[0] = 0;
      v32 = 0;
      geo::codec::featureGetNativeLabel((uint64_t)a3, 0, v34, &v32);
      if (v34[0])
      {
        id v23 = [NSString alloc];
        uint64_t v24 = [v23 initWithUTF8String:v34[0]];
        v25 = (void *)*((void *)v6 + 7);
        *((void *)v6 + 7) = v24;
      }
      if (v32)
      {
        id v26 = [NSString alloc];
        uint64_t v27 = [v26 initWithUTF8String:v32];
        v28 = (void *)*((void *)v6 + 8);
        *((void *)v6 + 8) = v27;
      }
    }
    v22.i32[0] = *((_DWORD *)a3 + 20);
    *(float32x4_t *)(v6 + 40) = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v22))), (float32x4_t)vdupq_n_s32(0x3B808081u));
    v29 = v6;
  }

  return (VKTransitLineMarker *)v6;
}

+ (id)markerWithFeature:(void *)a3 transitLink:(const void *)a4
{
  v4 = [[VKTransitLineMarker alloc] initWithFeature:a3 transitLink:a4];
  return v4;
}

@end