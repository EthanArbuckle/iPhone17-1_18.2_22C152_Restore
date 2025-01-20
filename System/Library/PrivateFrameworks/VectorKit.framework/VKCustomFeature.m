@interface VKCustomFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isGlobalFeature;
- (BOOL)isInjectedFeature;
- (BOOL)isLineFeature;
- (BOOL)isPointFeature;
- (VKCustomFeature)init;
- (VKCustomFeature)initWithCoder:(id)a3;
- (VKCustomFeature)initWithCoordinate3D:(id)a3;
- (VKCustomFeature)initWithCoordinate:(id)a3;
- (id).cxx_construct;
- (id)_initInternalFeatureWithCoordinate:(id)a3;
- (id)_initWithCoordinate:(id)a3 isInjected:(BOOL)a4;
- (id)customImageKey;
- (id)dataSource;
- (id)imageProvider;
- (id)initLineWithCoordinates:(id *)a3 count:(unint64_t)a4;
- (id)setImageProvider:withKey:;
- (id)styleAttributes;
- (signed)venueFloorOrdinal;
- (uint64_t)setImageProvider:withKey:;
- (unint64_t)businessID;
- (unint64_t)clientFeatureID;
- (unint64_t)featureID;
- (unint64_t)venueBuildingID;
- (unint64_t)venueComponentID;
- (unint64_t)venueID;
- (unint64_t)venueLevelID;
- (unsigned)clusteringMode;
- (void)encodeWithCoder:(id)a3;
- (void)feature;
- (void)lineFeature;
- (void)pointFeature;
- (void)setAnnotationText:(id)a3 locale:(id)a4;
- (void)setBuildingFaceAzimuth:(float)a3;
- (void)setBuildingHeight:(float)a3;
- (void)setBusinessID:(unint64_t)a3;
- (void)setClientFeatureID:(unint64_t)a3;
- (void)setClusteringMode:(unsigned __int8)a3;
- (void)setDataSource:(id)a3;
- (void)setElevationOffset:(double)a3;
- (void)setFeatureID:(unint64_t)a3;
- (void)setFeatureRegion:(id)a3;
- (void)setImageProvider:(id)a3 withKey:(id)a4;
- (void)setImageProvider:withKey:;
- (void)setMaxZoom:(float)a3;
- (void)setMinZoom:(float)a3;
- (void)setPlaceholderIconWithSize:(CGSize)a3 anchorPoint:(CGPoint)a4 isRound:(BOOL)a5;
- (void)setSortKey:(int)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setText:(id)a3 locale:(id)a4;
- (void)setTextDisplayMode:(unsigned __int8)a3;
- (void)setVenueBuildingID:(unint64_t)a3;
- (void)setVenueComponentID:(unint64_t)a3;
- (void)setVenueFloorOrdinal:(signed __int16)a3;
- (void)setVenueID:(unint64_t)a3;
- (void)setVenueLevelID:(unint64_t)a3;
@end

@implementation VKCustomFeature

- (BOOL)isGlobalFeature
{
  return self->_isGlobalFeature;
}

- (void)setSortKey:(int)a3
{
  *((_DWORD *)self->_feature.__ptr_ + 21) = a3;
}

- (void)setFeatureID:(unint64_t)a3
{
  *((void *)self->_feature.__ptr_ + 2) = a3;
}

- (void)setClientFeatureID:(unint64_t)a3
{
  *((void *)self->_feature.__ptr_ + 3) = a3;
}

- (VKCustomFeature)initWithCoordinate:(id)a3
{
  return (VKCustomFeature *)-[VKCustomFeature _initWithCoordinate:isInjected:](self, "_initWithCoordinate:isInjected:", 1, a3.var0, a3.var1, 1.79769313e308);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 7) = &unk_1EF559BB8;
  *((void *)self + 8) = 0;
  return self;
}

- (void)setAnnotationText:(id)a3 locale:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([(VKCustomFeature *)self pointFeature])
  {
    id v7 = v13;
    if ((unint64_t)[v7 length] >= 0xC9)
    {
      uint64_t v8 = [v7 rangeOfComposedCharacterSequenceAtIndex:199];
      uint64_t v10 = [v7 substringToIndex:v8 + v9];

      id v7 = (id)v10;
    }
    v11 = [(VKCustomFeature *)self pointFeature];
    id v12 = v7;
    md::LabelExternalFeature::addTextForZoom(v11, 0, 2, (const char *)[v12 UTF8String], (const char *)objc_msgSend(v6, "UTF8String"));
  }
}

- (void)setText:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = v6;
  uint64_t v8 = v15;
  if ((unint64_t)[v15 length] >= 0xC9)
  {
    uint64_t v9 = [v15 rangeOfComposedCharacterSequenceAtIndex:199];
    uint64_t v8 = [v15 substringToIndex:v9 + v10];
  }
  ptr = self->_feature.__ptr_;
  id v12 = v8;
  id v13 = (const char *)[v12 UTF8String];
  id v14 = v7;
  md::LabelExternalFeature::addTextForZoom((int64x2_t *)ptr, 0, 0, v13, (const char *)[v14 UTF8String]);
}

- (void)setVenueID:(unint64_t)a3
{
  if ([(VKCustomFeature *)self pointFeature]) {
    *(void *)([(VKCustomFeature *)self pointFeature] + 248) = a3;
  }
}

- (void)setVenueFloorOrdinal:(signed __int16)a3
{
  if ([(VKCustomFeature *)self pointFeature]) {
    *(_WORD *)([(VKCustomFeature *)self pointFeature] + 280) = a3;
  }
}

- (void)setVenueBuildingID:(unint64_t)a3
{
  if ([(VKCustomFeature *)self pointFeature]) {
    *(void *)([(VKCustomFeature *)self pointFeature] + 256) = a3;
  }
}

- (void)setBusinessID:(unint64_t)a3
{
  if ([(VKCustomFeature *)self pointFeature]) {
    *(void *)([(VKCustomFeature *)self pointFeature] + 184) = a3;
  }
}

- (void)setVenueLevelID:(unint64_t)a3
{
  if ([(VKCustomFeature *)self pointFeature]) {
    *(void *)([(VKCustomFeature *)self pointFeature] + 264) = a3;
  }
}

- (id)_initWithCoordinate:(id)a3 isInjected:(BOOL)a4
{
  BOOL v4 = a4;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v30.receiver = self;
  v30.super_class = (Class)VKCustomFeature;
  id v7 = [(VKCustomFeature *)&v30 init];
  uint64_t v8 = v7;
  if (fabs(var1 + 180.0) >= 0.00000001 || fabs(var0 + 180.0) >= 0.00000001)
  {
    if (v7)
    {
      uint64_t v10 = operator new(0x1D8uLL);
      v10[1] = 0;
      v10[2] = 0;
      *uint64_t v10 = &unk_1EF581CC8;
      v11 = md::LabelExternalPointFeature::LabelExternalPointFeature((md::LabelExternalPointFeature *)(v10 + 3));
      cntrl = (std::__shared_weak_count *)v8->_feature.__cntrl_;
      v8->_feature.__ptr_ = (LabelExternalFeature *)v11;
      v8->_feature.__cntrl_ = (__shared_weak_count *)v10;
      if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
      uint64_t v13 = [(VKCustomFeature *)v8 pointFeature];
      uint64_t v14 = *(void *)(v13 + 192);
      double v15 = fabs(var0);
      if (*(void *)(v13 + 200) != v14)
      {
        if (v15 <= 85.0511169)
        {
          long double v19 = tan(var0 * 0.00872664626 + 0.785398163);
          long double v20 = log(v19);
          v21.f64[0] = var1;
          v21.f64[1] = v20;
          __asm { FMOV            V1.2D, #0.5 }
          *(float64x2_t *)(v14 + 24) = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v21);
          *(_WORD *)(v14 + 45) = 257;
        }
        else
        {
          __double2 v16 = __sincos_stret(var0 * 0.0174532925);
          double v17 = 6378137.0 / sqrt(v16.__sinval * v16.__sinval * -0.00669437999 + 1.0);
          __double2 v18 = __sincos_stret(var1 * 0.0174532925);
          *(double *)uint64_t v14 = v17 * v16.__cosval * v18.__cosval;
          *(double *)(v14 + 8) = v17 * v16.__cosval * v18.__sinval;
          *(double *)(v14 + 16) = v16.__sinval * 0.99330562 * v17;
          *(unsigned char *)(v14 + 44) = 1;
        }
        if (var2 != 1.79769313e308)
        {
          float v27 = var2;
          *(float *)(v14 + 40) = v27;
        }
      }
      *(unsigned char *)([(VKCustomFeature *)v8 pointFeature] + 176) = 2;
      if (v4) {
        *((unsigned char *)v8->_feature.__ptr_ + 9) = 1;
      }
      v8->_isGlobalFeature = v15 > 85.0511169;
    }
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)setVenueComponentID:(unint64_t)a3
{
  if ([(VKCustomFeature *)self pointFeature]) {
    *(void *)([(VKCustomFeature *)self pointFeature] + 272) = a3;
  }
}

- (void)pointFeature
{
  if (*((unsigned char *)self->_feature.__ptr_ + 8)) {
    return 0;
  }
  else {
    return self->_feature.__ptr_;
  }
}

- (void)feature
{
  return &self->_feature;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isPointFeature
{
  return *((unsigned char *)self->_feature.__ptr_ + 8) == 0;
}

- (void).cxx_destruct
{
  self->_featureStyleAttributesPtr._vptr$_retain_ptr = (void **)&unk_1EF559BB8;

  objc_storeStrong((id *)&self->_imageKey, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  cntrl = self->_feature.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)setStyleAttributes:(id)a3
{
  BOOL v4 = (GEOFeatureStyleAttributes *)a3;
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  obj = self->_featureStyleAttributesPtr._obj;
  self->_featureStyleAttributesPtr._obj = v5;

  ptr = self->_feature.__ptr_;
  if (!v5)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  [(GEOFeatureStyleAttributes *)v5 featureStyleAttributesPtr];
  uint64_t v9 = v13;
  uint64_t v10 = v14;
  if (!v14)
  {
LABEL_7:
    char v11 = 1;
    goto LABEL_8;
  }
  char v11 = 0;
  atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_8:
  id v12 = (std::__shared_weak_count *)*((void *)ptr + 5);
  *((void *)ptr + 4) = v9;
  *((void *)ptr + 5) = v10;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (v11) {
      goto LABEL_14;
    }
  }
  else if (v11)
  {
    goto LABEL_14;
  }
  if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
LABEL_14:
}

- (VKCustomFeature)initWithCoder:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 decodeInt32ForKey:@"featureType"];
  if (v5 == 1)
  {
    unint64_t v49 = 0;
    uint64_t v12 = [v4 decodeBytesForKey:@"coordinates" returnedLength:&v49];
    uint64_t v13 = [(VKCustomFeature *)self initLineWithCoordinates:v12 count:v49 / 0x18];
  }
  else
  {
    if (v5)
    {
      uint64_t v14 = 0;
      goto LABEL_34;
    }
    [v4 decodeDoubleForKey:@"latitude"];
    double v7 = v6;
    [v4 decodeDoubleForKey:@"longitude"];
    double v9 = v8;
    if ([v4 containsValueForKey:@"altitude"])
    {
      [v4 decodeDoubleForKey:@"altitude"];
      double v11 = v10;
    }
    else
    {
      double v11 = 1.79769313e308;
    }
    uint64_t v13 = -[VKCustomFeature initWithCoordinate3D:](self, "initWithCoordinate3D:", v7, v9, v11);
    double v15 = [(VKCustomFeature *)v13 pointFeature];
    [v4 decodeFloatForKey:@"elevationOffset"];
    [(VKCustomFeature *)v13 setElevationOffset:v16];
    if ([v4 containsValueForKey:@"buildingHeight"])
    {
      [v4 decodeFloatForKey:@"buildingHeight"];
      -[VKCustomFeature setBuildingHeight:](v13, "setBuildingHeight:");
    }
    if ([v4 containsValueForKey:@"buildingFaceAzimuth"])
    {
      [v4 decodeFloatForKey:@"buildingFaceAzimuth"];
      -[VKCustomFeature setBuildingFaceAzimuth:](v13, "setBuildingFaceAzimuth:");
    }
    -[VKCustomFeature setBusinessID:](v13, "setBusinessID:", [v4 decodeInt64ForKey:@"businessId"]);
    -[VKCustomFeature setVenueID:](v13, "setVenueID:", [v4 decodeInt64ForKey:@"venueId"]);
    -[VKCustomFeature setVenueLevelID:](v13, "setVenueLevelID:", [v4 decodeInt64ForKey:@"venueLevelId"]);
    -[VKCustomFeature setVenueComponentID:](v13, "setVenueComponentID:", [v4 decodeInt64ForKey:@"venueComponentId"]);
    -[VKCustomFeature setVenueFloorOrdinal:](v13, "setVenueFloorOrdinal:", (__int16)[v4 decodeInt64ForKey:@"venueFloorOrdinal"]);
    double v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    long double v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    long double v20 = [v4 decodeObjectOfClasses:v19 forKey:@"iconElements"];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = [*(id *)(*((void *)&v50 + 1) + 8 * i) element];
          md::LabelExternalPointFeature::setPlaceholderIcon(v15, (void *)v25, (void *)(v25 + 8), *(unsigned char *)(v25 + 16));
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v22);
    }
  }
  -[VKCustomFeature setFeatureID:](v13, "setFeatureID:", [v4 decodeInt64ForKey:@"featureId"]);
  [v4 decodeFloatForKey:@"minZoom"];
  -[VKCustomFeature setMinZoom:](v13, "setMinZoom:");
  [v4 decodeFloatForKey:@"maxZoom"];
  -[VKCustomFeature setMaxZoom:](v13, "setMaxZoom:");
  -[VKCustomFeature setSortKey:](v13, "setSortKey:", [v4 decodeInt32ForKey:@"sortKey"]);
  -[VKCustomFeature setTextDisplayMode:](v13, "setTextDisplayMode:", [v4 decodeInt32ForKey:@"textDisplayMode"]);
  v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"styleAttributes"];
  [(VKCustomFeature *)v13 setStyleAttributes:v26];
  float v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  objc_super v30 = [v4 decodeObjectOfClasses:v29 forKey:@"textElements"];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = [*(id *)(*((void *)&v45 + 1) + 8 * j) element];
        char v36 = *(unsigned char *)v35;
        char v37 = *(unsigned char *)(v35 + 1);
        if (*(char *)(v35 + 31) >= 0) {
          v38 = (const char *)(v35 + 8);
        }
        else {
          v38 = *(const char **)(v35 + 8);
        }
        int v39 = *(char *)(v35 + 55);
        v42 = *(const char **)(v35 + 32);
        v40 = (const char *)(v35 + 32);
        v41 = v42;
        if (v39 >= 0) {
          v43 = v40;
        }
        else {
          v43 = v41;
        }
        md::LabelExternalFeature::addTextForZoom((int64x2_t *)v13->_feature.__ptr_, v36, v37, v38, v43);
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v32);
  }

  self = v13;
  uint64_t v14 = self;
LABEL_34:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  ptr = self->_feature.__ptr_;
  if (ptr)
  {
    id v30 = v4;
    [v4 encodeInt32:*((unsigned __int8 *)ptr + 8) forKey:@"featureType"];
    double v7 = self->_feature.__ptr_;
    uint64_t v8 = 76;
    if (!*((unsigned char *)v7 + 112)) {
      uint64_t v8 = 72;
    }
    LODWORD(v6) = *(_DWORD *)((char *)v7 + v8);
    [v30 encodeFloat:@"minZoom" forKey:v6];
    LODWORD(v9) = *((_DWORD *)self->_feature.__ptr_ + 20);
    [v30 encodeFloat:@"maxZoom" forKey:v9];
    [v30 encodeInt32:*((unsigned int *)self->_feature.__ptr_ + 21) forKey:@"sortKey"];
    if (*((unsigned __int8 *)self->_feature.__ptr_ + 88) - 1 < 3) {
      uint64_t v10 = (*((unsigned char *)self->_feature.__ptr_ + 88) - 1) + 1;
    }
    else {
      uint64_t v10 = 0;
    }
    [v30 encodeInt32:v10 forKey:@"textDisplayMode"];
    [v30 encodeInt64:*((void *)self->_feature.__ptr_ + 2) forKey:@"featureId"];
    double v11 = [(VKCustomFeature *)self styleAttributes];
    [v30 encodeObject:v11 forKey:@"styleAttributes"];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = self->_feature.__ptr_;
    uint64_t v14 = *((void *)v13 + 6);
    for (uint64_t i = *((void *)v13 + 7); v14 != i; v14 += 104)
    {
      float v16 = [[VKLabelExternalTextElement alloc] initWithTextElement:v14];
      [v12 addObject:v16];
    }
    [v30 encodeObject:v12 forKey:@"textElements"];
    double v17 = [(VKCustomFeature *)self pointFeature];
    uint64_t v18 = v17;
    if (v17)
    {
      long double v19 = (long long *)v17[24];
      if ((long long *)v17[25] == v19)
      {
        long double v19 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
      }
      while (1)
      {
        md::LabelPoint::coordinate((md::LabelPoint *)v31, (uint64_t)v19);
        [v30 encodeDouble:@"latitude" forKey:v31[0]];
        [v30 encodeDouble:@"longitude" forKey:v31[1]];
        id v21 = (long long *)v18[24];
        if ((long long *)v18[25] == v21)
        {
          {
            id v21 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
          }
          else
          {
            id v21 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
            {
              qword_1EB317748 = 0;
              md::LabelPoint::NullPoint(void)::kNullLabelPoint = 0u;
              *(_OWORD *)&qword_1EB317738 = 0u;
              dword_1EB317750 = 2139095039;
              word_1EB317754 = 256;
              byte_1EB317756 = 1;
            }
          }
        }
        if (*((float *)v21 + 10) == 3.4028e38) {
          break;
        }
        uint64_t v22 = (long long *)v18[24];
        if ((long long *)v18[25] == v22)
        {
          {
            uint64_t v22 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
          }
          else
          {
            uint64_t v22 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
            {
              qword_1EB317748 = 0;
              md::LabelPoint::NullPoint(void)::kNullLabelPoint = 0u;
              *(_OWORD *)&qword_1EB317738 = 0u;
              dword_1EB317750 = 2139095039;
              word_1EB317754 = 256;
              byte_1EB317756 = 1;
            }
          }
        }
        float v23 = *((float *)v22 + 10);
        if (v23 != 3.4028e38)
        {
          [v30 encodeDouble:@"altitude" forKey:v23];
          break;
        }
        std::__throw_bad_optional_access[abi:nn180100]();
        __break(1u);
LABEL_36:
        long double v19 = &md::LabelPoint::NullPoint(void)::kNullLabelPoint;
        {
          qword_1EB317748 = 0;
          md::LabelPoint::NullPoint(void)::kNullLabelPoint = 0u;
          *(_OWORD *)&qword_1EB317738 = 0u;
          dword_1EB317750 = 2139095039;
          word_1EB317754 = 256;
          byte_1EB317756 = 1;
        }
      }
      LODWORD(v20) = *((_DWORD *)v18 + 58);
      [v30 encodeFloat:@"elevationOffset" forKey:v20];
      if (*((unsigned char *)v18 + 220))
      {
        LODWORD(v24) = *((_DWORD *)v18 + 54);
        [v30 encodeFloat:@"buildingHeight" forKey:v24];
      }
      if (*((unsigned char *)v18 + 228))
      {
        LODWORD(v24) = *((_DWORD *)v18 + 56);
        [v30 encodeFloat:@"buildingFaceAzimuth" forKey:v24];
      }
      [v30 encodeInt64:v18[23] forKey:@"businessId"];
      [v30 encodeInt64:v18[31] forKey:@"venueId"];
      [v30 encodeInt64:v18[33] forKey:@"venueLevelId"];
      [v30 encodeInt64:v18[34] forKey:@"venueComponentId"];
      [v30 encodeInt64:*((__int16 *)v18 + 140) forKey:@"venueFloorOrdinal"];
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v26 = v18[44];
      for (uint64_t j = v18[45]; v26 != j; v26 += 20)
      {
        uint64_t v28 = [[VKLabelExternalIconElement alloc] initWithIconElement:v26];
        [v25 addObject:v28];
      }
      [v30 encodeObject:v25 forKey:@"iconElements"];
    }
    v29 = [(VKCustomFeature *)self lineFeature];
    if (v29) {
      [v30 encodeBytes:v29[23] length:v29[24] - v29[23] forKey:@"coordinates"];
    }

    id v4 = v30;
  }
}

- (unsigned)clusteringMode
{
  if (![(VKCustomFeature *)self pointFeature]) {
    return 0;
  }
  v3 = [(VKCustomFeature *)self pointFeature];
  unsigned __int8 v4 = v3[239];
  if (v4)
  {
    if (v3[238]) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return v4;
}

- (void)setClusteringMode:(unsigned __int8)a3
{
  int v3 = a3;
  if ([(VKCustomFeature *)self pointFeature])
  {
    int v5 = [(VKCustomFeature *)self pointFeature];
    __int16 v6 = (v3 == 1) | 0x100;
    if (!v3) {
      __int16 v6 = 0;
    }
    v5[119] = v6;
  }
}

- (void)setElevationOffset:(double)a3
{
  if ([(VKCustomFeature *)self pointFeature])
  {
    int v5 = [(VKCustomFeature *)self pointFeature];
    float v6 = a3;
    v5[58] = v6;
  }
}

- (void)setBuildingFaceAzimuth:(float)a3
{
  if ([(VKCustomFeature *)self pointFeature])
  {
    int v5 = [(VKCustomFeature *)self pointFeature];
    v5[56] = a3;
    *((unsigned char *)v5 + 228) = 1;
  }
}

- (void)setBuildingHeight:(float)a3
{
  if ([(VKCustomFeature *)self pointFeature])
  {
    int v5 = [(VKCustomFeature *)self pointFeature];
    v5[54] = a3;
    *((unsigned char *)v5 + 220) = 1;
  }
}

- (void)setPlaceholderIconWithSize:(CGSize)a3 anchorPoint:(CGPoint)a4 isRound:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.height;
  double width = a3.width;
  if ([(VKCustomFeature *)self pointFeature])
  {
    double v11 = [(VKCustomFeature *)self pointFeature];
    *(float *)&unsigned int v12 = width;
    *(float *)&unsigned int v13 = height;
    unint64_t v17 = __PAIR64__(v13, v12);
    *(float *)&unsigned int v14 = x;
    *(float *)&unsigned int v15 = height - y;
    unint64_t v16 = __PAIR64__(v15, v14);
    md::LabelExternalPointFeature::setPlaceholderIcon(v11, &v17, &v16, a5);
  }
}

- (signed)venueFloorOrdinal
{
  if ([(VKCustomFeature *)self pointFeature]) {
    return *(_WORD *)([(VKCustomFeature *)self pointFeature] + 280);
  }
  else {
    return 0;
  }
}

- (unint64_t)venueComponentID
{
  unint64_t result = [(VKCustomFeature *)self pointFeature];
  if (result) {
    return *(void *)([(VKCustomFeature *)self pointFeature] + 272);
  }
  return result;
}

- (unint64_t)venueLevelID
{
  unint64_t result = [(VKCustomFeature *)self pointFeature];
  if (result) {
    return *(void *)([(VKCustomFeature *)self pointFeature] + 264);
  }
  return result;
}

- (unint64_t)venueBuildingID
{
  unint64_t result = [(VKCustomFeature *)self pointFeature];
  if (result) {
    return *(void *)([(VKCustomFeature *)self pointFeature] + 256);
  }
  return result;
}

- (unint64_t)venueID
{
  unint64_t result = [(VKCustomFeature *)self pointFeature];
  if (result) {
    return *(void *)([(VKCustomFeature *)self pointFeature] + 248);
  }
  return result;
}

- (unint64_t)businessID
{
  unint64_t result = [(VKCustomFeature *)self pointFeature];
  if (result) {
    return *(void *)([(VKCustomFeature *)self pointFeature] + 184);
  }
  return result;
}

- (void)setFeatureRegion:(id)a3
{
  id v5 = a3;
  if ([(VKCustomFeature *)self pointFeature]) {
    objc_storeStrong((id *)([(VKCustomFeature *)self pointFeature] + 240), a3);
  }
}

- (BOOL)isInjectedFeature
{
  return *((unsigned char *)self->_feature.__ptr_ + 9) == 1;
}

- (void)setTextDisplayMode:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  *((unsigned char *)self->_feature.__ptr_ + 88) = v3;
}

- (void)setMaxZoom:(float)a3
{
  *((float *)self->_feature.__ptr_ + 20) = a3;
}

- (void)setMinZoom:(float)a3
{
  *((float *)self->_feature.__ptr_ + 18) = a3;
}

- (id)styleAttributes
{
  return self->_featureStyleAttributesPtr._obj;
}

- (unint64_t)clientFeatureID
{
  return *((void *)self->_feature.__ptr_ + 3);
}

- (unint64_t)featureID
{
  return *((void *)self->_feature.__ptr_ + 2);
}

- (id)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return WeakRetained;
}

- (id)customImageKey
{
  return self->_imageKey;
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3 withKey:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v7 = (VKCustomImageProvider *)a3;
  id v8 = a4;
  if (self->_imageProvider == v7 && [(NSString *)self->_imageKey isEqualToString:v8]) {
    goto LABEL_38;
  }
  objc_storeStrong((id *)&self->_imageProvider, a3);
  p_imageKedouble y = (id *)&self->_imageKey;
  objc_storeStrong((id *)&self->_imageKey, a4);
  if (!self->_imageProvider || (id v10 = *p_imageKey) == 0)
  {
    ptr = self->_feature.__ptr_;
    v17[0] = 0;
    v17[1] = 0;
    uint64_t v18 = 0;
    double v20 = 0;
    md::CustomImageData::operator=((uint64_t)ptr + 120, v17);
    if (v20 == v19)
    {
      (*(void (**)(void *))(v19[0] + 32))(v19);
      if ((SHIBYTE(v18) & 0x80000000) == 0) {
        goto LABEL_38;
      }
    }
    else
    {
      if (v20) {
        (*(void (**)(void))(*v20 + 40))();
      }
      if ((SHIBYTE(v18) & 0x80000000) == 0) {
        goto LABEL_38;
      }
    }
    unsigned int v14 = (void *)v17[0];
LABEL_37:
    operator delete(v14);
    goto LABEL_38;
  }
  memset(&v24, 0, sizeof(v24));
  uint64_t v26 = 0;
  std::string::__assign_external(&v24, (const std::string::value_type *)[v10 UTF8String]);
  double v11 = self->_imageProvider;
  id v12 = *p_imageKey;
  v27[0] = &unk_1EF56C678;
  v27[1] = v11;
  v27[2] = v12;
  uint64_t v28 = v27;
  std::__function::__value_func<CGImage * ()(gm::Matrix<unsigned int,2,1>,float)>::swap[abi:nn180100](v27, v25);
  if (v28 == v27)
  {
    (*(void (**)(void *))(v27[0] + 32))(v27);
  }
  else if (v28)
  {
    (*(void (**)(void *))(*v28 + 40))(v28);
  }
  unsigned int v15 = self->_feature.__ptr_;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v21, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  }
  else {
    std::string v21 = v24;
  }
  uint64_t v16 = (uint64_t)v26;
  if (!v26) {
    goto LABEL_22;
  }
  if (v26 != v25)
  {
    uint64_t v16 = (*(uint64_t (**)(void))(*v26 + 16))();
LABEL_22:
    float v23 = (void *)v16;
    goto LABEL_24;
  }
  float v23 = v22;
  (*(void (**)(void *, void *))(v25[0] + 24))(v25, v22);
LABEL_24:
  md::CustomImageData::operator=((uint64_t)v15 + 120, &v21);
  if (v23 == v22)
  {
    (*(void (**)(void *))(v22[0] + 32))(v22);
    if ((SHIBYTE(v21.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_34;
  }
  if (v23) {
    (*(void (**)(void))(*v23 + 40))();
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
LABEL_34:
  }
    operator delete(v21.__r_.__value_.__l.__data_);
LABEL_28:
  if (v26 == v25)
  {
    (*(void (**)(void *))(v25[0] + 32))(v25);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    {
LABEL_36:
      unsigned int v14 = (void *)v24.__r_.__value_.__r.__words[0];
      goto LABEL_37;
    }
  }
  else
  {
    if (v26) {
      (*(void (**)(void))(*v26 + 40))();
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_36;
    }
  }
LABEL_38:
}

- (uint64_t)setImageProvider:withKey:
{
  return a1;
}

- (void)setImageProvider:withKey:
{
  JUMPOUT(0x1A6239270);
}

- (id)setImageProvider:withKey:
{
  *a2 = &unk_1EF56C678;
  a2[1] = *(id *)(a1 + 8);
  id result = *(id *)(a1 + 16);
  a2[2] = result;
  return result;
}

- (id)initLineWithCoordinates:(id *)a3 count:(unint64_t)a4
{
  v26.receiver = self;
  v26.super_class = (Class)VKCustomFeature;
  float v6 = [(VKCustomFeature *)&v26 init];
  if (!v6) {
    return v6;
  }
  double v7 = (char *)operator new(0xE8uLL);
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)double v7 = &unk_1EF581A98;
  *((_WORD *)v7 + 16) = 1;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 88) = 0u;
  *((void *)v7 + 13) = 0x7FFFFFFF437C0000;
  v7[112] = 0;
  *((void *)v7 + 19) = 0;
  *((void *)v7 + 20) = 0;
  *((void *)v7 + 18) = 0;
  *((void *)v7 + 24) = 0;
  *((void *)v7 + 15) = 0;
  *((void *)v7 + 16) = 0;
  v7[136] = 0;
  *((void *)v7 + 3) = &unk_1EF5451D0;
  *((_WORD *)v7 + 100) = 256;
  *((void *)v7 + 27) = 0;
  *((void *)v7 + 28) = 0;
  *((void *)v7 + 26) = 0;
  cntrl = (std::__shared_weak_count *)v6->_feature.__cntrl_;
  v6->_feature.__ptr_ = (LabelExternalFeature *)(v7 + 24);
  v6->_feature.__cntrl_ = (__shared_weak_count *)v7;
  if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
    std::__shared_weak_count::__release_weak(cntrl);
  }
  uint64_t v9 = [(VKCustomFeature *)v6 lineFeature];
  uint64_t v10 = v9;
  id v12 = (void *)(v9 + 184);
  double v11 = *(char **)(v9 + 184);
  uint64_t v13 = *(void *)(v9 + 200);
  if (0xAAAAAAAAAAAAAAABLL * ((v13 - (uint64_t)v11) >> 3) < a4)
  {
    if (v11)
    {
      *(void *)(v9 + 192) = v11;
      operator delete(v11);
      uint64_t v13 = 0;
      *id v12 = 0;
      v12[1] = 0;
      v12[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_31;
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (v13 >> 3);
    unint64_t v15 = 2 * v14;
    if (2 * v14 <= a4) {
      unint64_t v15 = a4;
    }
    unint64_t v16 = v14 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v15;
    if (v16 > 0xAAAAAAAAAAAAAAALL) {
LABEL_31:
    }
      abort();
    double v11 = (char *)operator new(24 * v16);
    *(void *)(v10 + 184) = v11;
    *(void *)(v10 + 192) = v11;
    *(void *)(v10 + 200) = &v11[24 * v16];
    size_t v17 = 24 * a4;
    memcpy(v11, a3, 24 * a4);
    goto LABEL_24;
  }
  uint64_t v18 = *(unsigned char **)(v9 + 192);
  unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((v18 - v11) >> 3);
  if (v19 < a4)
  {
    if (v18 != v11)
    {
      memmove(*(void **)(v9 + 184), a3, v18 - v11);
      double v11 = *(char **)(v10 + 192);
    }
    size_t v17 = 24 * a4 - 24 * v19;
    if (v19 == a4) {
      goto LABEL_24;
    }
    double v20 = v11;
    std::string v21 = a3 + v19;
    goto LABEL_23;
  }
  size_t v17 = 24 * a4;
  if (a4)
  {
    double v20 = *(void **)(v9 + 184);
    std::string v21 = a3;
LABEL_23:
    memmove(v20, v21, v17);
  }
LABEL_24:
  *(void *)(v10 + 192) = &v11[v17];
  *(unsigned char *)(v10 + 177) = 1;
  uint64_t v22 = *(double **)(v10 + 184);
  if (v22 != (double *)&v11[v17])
  {
    while (fabs(*v22) <= 85.0511169)
    {
      v22 += 3;
      if (v22 == (double *)&v11[v17]) {
        goto LABEL_29;
      }
    }
    *(unsigned char *)(v10 + 177) = 0;
  }
LABEL_29:
  *((unsigned char *)v6->_feature.__ptr_ + 9) = 1;
  imageKedouble y = v6->_imageKey;
  v6->_imageKedouble y = 0;

  imageProvider = v6->_imageProvider;
  v6->_imageProvider = 0;

  v6->_isGlobalFeature = 1;
  return v6;
}

- (id)_initInternalFeatureWithCoordinate:(id)a3
{
  return -[VKCustomFeature _initWithCoordinate:isInjected:](self, "_initWithCoordinate:isInjected:", 0, a3.var0, a3.var1, a3.var2);
}

- (VKCustomFeature)init
{
  return (VKCustomFeature *)-[VKCustomFeature _initWithCoordinate:isInjected:](self, "_initWithCoordinate:isInjected:", 1, -180.0, -180.0, 1.79769313e308);
}

- (VKCustomFeature)initWithCoordinate3D:(id)a3
{
  return (VKCustomFeature *)-[VKCustomFeature _initWithCoordinate:isInjected:](self, "_initWithCoordinate:isInjected:", 1, a3.var0, a3.var1, a3.var2);
}

- (void)lineFeature
{
  if (*((unsigned char *)self->_feature.__ptr_ + 8) == 1) {
    return self->_feature.__ptr_;
  }
  else {
    return 0;
  }
}

- (BOOL)isLineFeature
{
  return *((unsigned char *)self->_feature.__ptr_ + 8) == 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end