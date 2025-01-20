@interface VKLabelNavRoad
- (BOOL)_findLabelAnchorPoint:(void *)a3 isShieldLabel:(BOOL)a4 desiredOffsetDistance:(float)a5 maxOffsetDistance:(float)a6 minJunctionDistance:(float)a7 roadGraph:(id)a8;
- (BOOL)_worldPointForRoadOffset:(float)a3 worldPoint:(void *)a4;
- (BOOL)areLabelsDisabled;
- (BOOL)hasShield;
- (BOOL)hasVisibleShields;
- (BOOL)hasVisibleSigns;
- (BOOL)isAwayFromRoute;
- (BOOL)isEtaFeature;
- (BOOL)isGuidanceStepStart;
- (BOOL)isInGuidance;
- (BOOL)isOnRoute;
- (BOOL)isOnewayToJunction;
- (BOOL)isPicked;
- (BOOL)isRamp;
- (BOOL)isRoadLabelUnique;
- (BOOL)isStartOfRoadName;
- (BOOL)isTrafficCameraFeature;
- (BOOL)isValid;
- (BOOL)matchesRoad:(id)a3;
- (BOOL)matchesRoadEdge:(const GeoCodecsRoadEdge *)a3;
- (BOOL)roadHasName;
- (BOOL)suppressRoadSignIfDeduped;
- (BOOL)suppressRoadSignIfShieldPresent;
- (GeoCodecsConnectivityJunction)junctionB;
- (Matrix<float,)direction2D;
- (Matrix<float,)direction3D;
- (NSString)name;
- (NSString)shieldDisplayGroup;
- (NSString)shieldGroup;
- (PolylineCoordinate)routeOffset;
- (VKLabelNavJunction)navJunctionA;
- (VKLabelNavRoad)initWithRoadEdge:(const GeoCodecsRoadEdge *)a3 navJunctionA:(id)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6;
- (const)cstrName;
- (const)tile;
- (double)length;
- (float)_findRoadOffsetForDistanceToRay:(float)a3 rayStart:()Matrix<double rayVector:()3 roadGraph:(1>)a4;
- (float)routeCrossProduct;
- (id).cxx_construct;
- (id)_newLabelWithNavContext:(NavContext *)a3 isShieldLabel:(BOOL)a4 worldPoint:(Mercator3<double>)a5 alignment:(unsigned __int8)a6 artworkCache:(void *)a7;
- (id)description;
- (id)labelWithType:(BOOL)a3;
- (int64_t)intraRoadPriorityForRoadLabel;
- (int64_t)intraRoadPriorityForShieldLabel;
- (unint64_t)labelVertexIndexA;
- (unint64_t)labelVertexIndexB;
- (unsigned)roadClass;
- (unsigned)roadSignAlignment;
- (void)_updateWithNavContext:(NavContext *)a3;
- (void)_updateWithNavContext:(NavContext *)a3 threshold:(double)a4;
- (void)_worldRoadPoints:(void *)a3 elevations:(void *)a4;
- (void)appendSimplifiedWorldRoadPoints:(void *)a3 pointElevations:(void *)a4;
- (void)clearRoadShield;
- (void)clearRoadSign;
- (void)createLabelWithNavContext:(NavContext *)a3 isShieldLabel:(BOOL)a4 desiredOffsetDistance:(float)a5 maxOffsetDistance:(float)a6 minJunctionDistance:(float)a7 minRouteDistance:(float)a8 roadGraph:(id)a9 artworkCache:(void *)a10;
- (void)dealloc;
- (void)getRoadEdge:(GeoCodecsRoadEdge *)a3;
- (void)layoutWithNavContext:(NavContext *)a3;
- (void)prepareStyleVarsWithContext:(NavContext *)a3;
- (void)recreateRoadShieldWithNavContext:(NavContext *)a3 artworkCache:(void *)a4;
- (void)recreateRoadSignWithAlignment:(unsigned __int8)a3 navContext:(NavContext *)a4 artworkCache:(void *)a5;
- (void)setAreLabelsDisabled:(BOOL)a3;
- (void)setIntraRoadPriorityForRoadLabel:(int64_t)a3;
- (void)setIntraRoadPriorityForShieldLabel:(int64_t)a3;
- (void)setIsGuidanceStepStart:(BOOL)a3;
- (void)setIsInGuidance:(BOOL)a3;
- (void)setIsOnRoute:(BOOL)a3;
- (void)setIsPicked:(BOOL)a3;
- (void)setIsRoadLabelUnique:(BOOL)a3;
- (void)setIsStartOfRoadName:(BOOL)a3;
- (void)setLabelVertexIndexA:(unint64_t)a3;
- (void)setLabelVertexIndexB:(unint64_t)a3;
- (void)setRouteCrossProduct:(float)a3;
- (void)setRouteOffset:(PolylineCoordinate)a3;
- (void)setSuppressRoadSignIfDeduped:(BOOL)a3;
@end

@implementation VKLabelNavRoad

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((unsigned char *)self + 32) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  v2 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
  {
    id v7 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v4 = v3;
    self = v7;
    if (v4) {
      operator new();
    }
  }
  *((void *)self + 15) = *((void *)v2 + 91);
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  {
    id v8 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v6 = v5;
    self = v8;
    if (v6) {
      operator new();
    }
  }
  *((void *)self + 19) = *((void *)v2 + 91);
  *(void *)((char *)self + 188) = 0xBF80000000000000;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadSign, 0);
  objc_storeStrong((id *)&self->_shieldGroup, 0);
  objc_storeStrong((id *)&self->_shieldDisplayGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_length, 0);
  allocator = (float *)self->_simplifiedPoints.__end_cap_.__value__2._allocator;
  if (allocator)
  {
    self->_simplifiedPointElevations.__begin_ = allocator;
    (*(void (**)(float *, float *, int64_t))(*(void *)self->_simplifiedPointElevations.__end_cap_.__value_
                                                             + 40))(self->_simplifiedPointElevations.__end_cap_.__value_, allocator, (char *)self->_simplifiedPointElevations.__end_ - (char *)allocator);
  }
  navJunctionA = self->_navJunctionA;
  if (navJunctionA)
  {
    self->_simplifiedPoints.__begin_ = navJunctionA;
    (*(void (**)(void *, VKLabelNavJunction *, int64_t))(*(void *)self->_simplifiedPoints.__end_cap_.__value_
                                                                         + 40))(self->_simplifiedPoints.__end_cap_.__value_, navJunctionA, (char *)self->_simplifiedPoints.__end_ - (char *)navJunctionA);
  }
  objc_destroyWeak((id *)&self->_junctionB);
  if (self->_lineType._hasValue) {
    self->_lineType._hasValue = 0;
  }
  cntrl = self->_tile.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)setLabelVertexIndexB:(unint64_t)a3
{
  self->_labelVertexIndexA = a3;
}

- (unint64_t)labelVertexIndexB
{
  return self->_labelVertexIndexA;
}

- (void)setLabelVertexIndexA:(unint64_t)a3
{
  self->_vertexIndexB = a3;
}

- (unint64_t)labelVertexIndexA
{
  return self->_vertexIndexB;
}

- (const)tile
{
  return &self->_tile;
}

- (void)setIsPicked:(BOOL)a3
{
  self->_cachedShieldVisibility[4] = a3;
}

- (BOOL)isPicked
{
  return self->_cachedShieldVisibility[4];
}

- (void)setSuppressRoadSignIfDeduped:(BOOL)a3
{
  self->_cachedShieldVisibility[3] = a3;
}

- (BOOL)suppressRoadSignIfDeduped
{
  return self->_cachedShieldVisibility[3];
}

- (BOOL)suppressRoadSignIfShieldPresent
{
  return self->_cachedShieldVisibility[2];
}

- (VKLabelNavJunction)navJunctionA
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  return (VKLabelNavJunction *)WeakRetained;
}

- (void)setIsRoadLabelUnique:(BOOL)a3
{
  LOBYTE(self->_direction3D._e[1]) = a3;
}

- (BOOL)isRoadLabelUnique
{
  return LOBYTE(self->_direction3D._e[1]);
}

- (void)setAreLabelsDisabled:(BOOL)a3
{
  BYTE1(self->_direction3D._e[2]) = a3;
}

- (BOOL)areLabelsDisabled
{
  return BYTE1(self->_direction3D._e[2]);
}

- (void)setIntraRoadPriorityForShieldLabel:(int64_t)a3
{
  self->_intraRoadPriorityForRoadLabel = a3;
}

- (int64_t)intraRoadPriorityForShieldLabel
{
  return self->_intraRoadPriorityForRoadLabel;
}

- (void)setIntraRoadPriorityForRoadLabel:(int64_t)a3
{
  *(void *)&self->_routeOffset.offset = a3;
}

- (int64_t)intraRoadPriorityForRoadLabel
{
  return *(void *)&self->_routeOffset.offset;
}

- (GeoCodecsConnectivityJunction)junctionB
{
  return self->_junctionA;
}

- (void)setRouteOffset:(PolylineCoordinate)a3
{
  *(PolylineCoordinate *)&self->_isRoadLabelUnique = a3;
}

- (PolylineCoordinate)routeOffset
{
  return *(PolylineCoordinate *)&self->_isRoadLabelUnique;
}

- (void)setRouteCrossProduct:(float)a3
{
  *(float *)&self->_routeOffset.index = a3;
}

- (float)routeCrossProduct
{
  return *(float *)&self->_routeOffset.index;
}

- (void)setIsGuidanceStepStart:(BOOL)a3
{
  LOBYTE(self->_direction3D._e[2]) = a3;
}

- (BOOL)isGuidanceStepStart
{
  return LOBYTE(self->_direction3D._e[2]);
}

- (void)setIsInGuidance:(BOOL)a3
{
  HIBYTE(self->_direction3D._e[1]) = a3;
}

- (BOOL)isInGuidance
{
  return HIBYTE(self->_direction3D._e[1]);
}

- (void)setIsStartOfRoadName:(BOOL)a3
{
  BYTE2(self->_direction3D._e[1]) = a3;
}

- (BOOL)isStartOfRoadName
{
  return BYTE2(self->_direction3D._e[1]);
}

- (void)setIsOnRoute:(BOOL)a3
{
  BYTE1(self->_direction3D._e[1]) = a3;
}

- (BOOL)isOnRoute
{
  return BYTE1(self->_direction3D._e[1]);
}

- (NSString)name
{
  return *(NSString **)&self->_length;
}

- (Matrix<float,)direction2D
{
  float v2 = *(float *)&self->_simplifiedPointElevations.__end_cap_.__value__2._allocator;
  float v3 = *((float *)&self->_simplifiedPointElevations.__end_cap_.__value__2._allocator + 1);
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (Matrix<float,)direction3D
{
  float v2 = self->_direction2D._e[0];
  float v3 = self->_direction2D._e[1];
  float v4 = self->_direction3D._e[0];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (BOOL)isValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)roadHasName
{
  return *((unsigned char *)self->_data + 73) != 0;
}

- (BOOL)isTrafficCameraFeature
{
  return 0;
}

- (BOOL)isEtaFeature
{
  return 0;
}

- (double)length
{
  double result = *(double *)&self->_intraRoadPriorityForShieldLabel;
  if (result == 0.0)
  {
    unint64_t v39 = 0;
    float v4 = geo::codec::multiSectionFeaturePoints((void *)self->_data, 0, &v39);
    if (v39 > 1)
    {
      unint64_t vertexIndexB = self->_vertexIndexB;
      unint64_t labelVertexIndexA = self->_labelVertexIndexA;
      if (vertexIndexB <= labelVertexIndexA) {
        unint64_t v8 = self->_labelVertexIndexA;
      }
      else {
        unint64_t v8 = self->_vertexIndexB;
      }
      if (vertexIndexB >= labelVertexIndexA) {
        unint64_t vertexIndexB = self->_labelVertexIndexA;
      }
      double v9 = 0.0;
      unint64_t v10 = v8 - vertexIndexB;
      if (v8 <= vertexIndexB) {
        goto LABEL_16;
      }
      float32x2_t v11 = (float32x2_t)v4[vertexIndexB];
      if (v10 > 7)
      {
        unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFF8;
        v5.i64[1] = v4[vertexIndexB];
        int8x16_t v13 = (int8x16_t)vdupq_lane_s32((int32x2_t)v11, 0);
        v14 = &v4[vertexIndexB + 5];
        float64x2_t v15 = 0uLL;
        unint64_t v16 = v10 & 0xFFFFFFFFFFFFFFF8;
        float64x2_t v17 = 0uLL;
        float64x2_t v18 = 0uLL;
        float64x2_t v19 = 0uLL;
        do
        {
          v20 = (const float *)(v14 - 2);
          float32x4x2_t v40 = vld2q_f32(v20);
          int32x4_t v22 = *(int32x4_t *)v14;
          int8x16_t v21 = *((int8x16_t *)v14 + 1);
          v14 += 4;
          float32x4_t v23 = (float32x4_t)vuzp1q_s32(v22, (int32x4_t)v21);
          float32x4_t v24 = (float32x4_t)vuzp2q_s32(v22, (int32x4_t)v21);
          float32x4_t v25 = vsubq_f32(v40.val[0], (float32x4_t)vextq_s8(v13, (int8x16_t)v40.val[0], 0xCuLL));
          float32x4_t v26 = vsubq_f32(v23, (float32x4_t)vextq_s8((int8x16_t)v40.val[0], (int8x16_t)v23, 0xCuLL));
          float32x4_t v27 = vsubq_f32(v40.val[1], (float32x4_t)vextq_s8(v5, (int8x16_t)v40.val[1], 0xCuLL));
          v40.val[0] = vsubq_f32(v24, (float32x4_t)vextq_s8((int8x16_t)v40.val[1], (int8x16_t)v24, 0xCuLL));
          float32x4_t v28 = vsqrtq_f32(vmlaq_f32(vmulq_f32(v25, v25), v27, v27));
          float32x4_t v29 = vsqrtq_f32(vmlaq_f32(vmulq_f32(v26, v26), v40.val[0], v40.val[0]));
          float64x2_t v17 = vaddq_f64(v17, vcvt_hight_f64_f32(v28));
          float64x2_t v15 = vaddq_f64(v15, vcvtq_f64_f32(*(float32x2_t *)v28.f32));
          float64x2_t v19 = vaddq_f64(v19, vcvt_hight_f64_f32(v29));
          float64x2_t v18 = vaddq_f64(v18, vcvtq_f64_f32(*(float32x2_t *)v29.f32));
          int8x16_t v5 = (int8x16_t)v24;
          int8x16_t v13 = (int8x16_t)v23;
          v16 -= 8;
        }
        while (v16);
        double v9 = vaddvq_f64(vaddq_f64(vaddq_f64(v18, v15), vaddq_f64(v19, v17)));
        if (v10 == v12) {
          goto LABEL_16;
        }
        vertexIndexB += v12;
        float32x2_t v11 = (float32x2_t)vextq_s8(v21, v21, 8uLL).u64[0];
      }
      unint64_t v30 = v8 - vertexIndexB;
      v31 = (float32x2_t *)&v4[vertexIndexB + 1];
      do
      {
        float32x2_t v32 = *v31++;
        float32x2_t v33 = vsub_f32(v32, v11);
        double v9 = v9 + sqrtf(vaddv_f32(vmul_f32(v33, v33)));
        float32x2_t v11 = v32;
        --v30;
      }
      while (v30);
LABEL_16:
      ptr = self->_tile.__ptr_;
      double v35 = *((double *)ptr + 41);
      double v36 = *((double *)ptr + 39);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
      [WeakRetained worldUnitsPerMeter];
      *(double *)&self->_intraRoadPriorityForShieldLabel = (v35 - v36) * v9 / v38;

      return *(double *)&self->_intraRoadPriorityForShieldLabel;
    }
    return 0.0;
  }
  return result;
}

- (id)_newLabelWithNavContext:(NavContext *)a3 isShieldLabel:(BOOL)a4 worldPoint:(Mercator3<double>)a5 alignment:(unsigned __int8)a6 artworkCache:(void *)a7
{
  BOOL v9 = a4;
  (*(void (**)(uint64_t *__return_ptr))(**(void **)(*((void *)a3->var1 + 21) + 32) + 88))(&v89);
  int v12 = BYTE1(self->_direction3D._e[1]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  unsigned int v14 = 2 * ([WeakRetained depthFromRoute] == 0);
  if (v12) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v14;
  }
  v86[0] = 0;
  if (self->_lineType._hasValue)
  {
    v86[1] = *(&self->_lineType._hasValue + 1);
    v86[0] = 1;
  }
  v85[0] = 0;
  if ((_BYTE)v89)
  {
    v85[1] = BYTE1(v89);
    v85[0] = 1;
  }
  GetLabelNavStyleAttributes(&v87, 0, v15, v86, v85);
  v85[0] = 0;
  v86[0] = 0;

  var1 = a3->var1;
  float64x2_t v17 = *(std::__shared_weak_count **)&v88;
  *(void *)&v79._hasFillColor = v87;
  v79._fillColor._backing._e[0] = v88;
  if (v88 != 0.0) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v88 + 8), 1uLL, memory_order_relaxed);
  }
  md::LabelManager::styleQueryForFeatureAttributes((uint64_t)&v83, *((void *)var1 + 42), (uint64_t *)&v79._hasFillColor);
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    if (v83)
    {
LABEL_13:
      uint64_t v18 = v87;
      float64x2_t v19 = *(std::__shared_weak_count **)&v88;
      if (v88 != 0.0) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v88 + 8), 1uLL, memory_order_relaxed);
      }
      if (v18)
      {
        unint64_t v20 = *(unsigned __int8 *)(v18 + 33);
        if (*(unsigned char *)(v18 + 33))
        {
          int8x16_t v21 = *(_DWORD **)v18;
          if (*v21 == 4)
          {
LABEL_18:
            if (!v19) {
              goto LABEL_30;
            }
            goto LABEL_28;
          }
          unint64_t v24 = 0;
          float32x4_t v25 = v21 + 2;
          while (v20 - 1 != v24)
          {
            int v26 = *v25;
            v25 += 2;
            ++v24;
            if (v26 == 4)
            {
              if (v24 < v20) {
                goto LABEL_18;
              }
              break;
            }
          }
        }
      }
      if (!v19) {
        goto LABEL_30;
      }
LABEL_28:
      if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
LABEL_30:
      data = (uint64_t *)self->_data;
      unsigned __int8 v28 = atomic_load((unsigned __int8 *)a3->var1 + 3392);
      int v29 = v28 & 1;
      if (v9)
      {
        uint64_t v82 = 0;
        VKLabelCopyShield(data, v29, &v82);
        if (objc_claimAutoreleasedReturnValue())
        {
          uint64_t v30 = v83;
          v31 = v84;
          *(void *)&v79._hasFillColor = v83;
          *(void *)&v79._fillColor._backing._e[0] = v84;
          if (v84) {
            atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          gss::QueryableLocker<gss::PropertyID>::QueryableLocker((uint64_t *)&v78, v30, (uint64_t)v31);
          if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
            std::__shared_weak_count::__release_weak(v31);
          }
          if (!LOBYTE(v78._arrowLength))
          {
LABEL_92:
            uint64_t v60 = *((void *)a3->var1 + 42);
            uint64_t v62 = *(void *)(v60 + 184);
            uint64_t v61 = *(void *)(v60 + 192);
            uint64_t v80 = v62;
            uint64_t v81 = v61;
            if (v61) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v61 + 8), 1uLL, memory_order_relaxed);
            }
            operator new();
          }
          uint64_t v32 = *(void *)(*(void *)&v78._orientation + 24);
          float32x2_t v33 = *(float **)v32;
          if (*(void *)v32)
          {
            float v34 = *v33;
            BOOL v35 = *v33 == 1.0;
            if (*(unsigned char *)(v32 + 10))
            {
              if (v34 != 0.0 && v34 != 1.0)
              {
LABEL_63:
                if (gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtEnd(*(void *)(*(void *)&v78._orientation + 24), 0x13Cu, 0))goto LABEL_66; {
                unsigned int v46 = 1;
                }
LABEL_65:
                if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtEnd(v32, 0x13Cu, v46)) {
                  goto LABEL_79;
                }
LABEL_66:
                if (v33)
                {
                  float v47 = *v33;
                  BOOL v48 = *v33 == 1.0;
                  if (*(unsigned char *)(v32 + 10))
                  {
                    if (v47 != 0.0 && v47 != 1.0) {
                      goto LABEL_76;
                    }
                  }
                }
                else
                {
                  BOOL v48 = 0;
                }
                unsigned int v50 = *(unsigned __int8 *)(v32 + v48 + 11);
                if (v50 != 2)
                {
                  v51 = (grl *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v32, 0x13Cu, v50, 0);
                  goto LABEL_78;
                }
LABEL_76:
                v79._hasFillColor = 1;
                LOBYTE(__dst[0]) = 1;
                gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v32, 0x13Cu, 0, &v79);
                v51 = (grl *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v32, 0x13Cu, 1u, __dst);
LABEL_78:
                v52 = (grl *)grl::SizeGroupMin(v51);
                grl::SizeGroupMax(v52);
                uint64_t v32 = *(void *)(*(void *)&v78._orientation + 24);
LABEL_79:
                unsigned int v53 = *(unsigned __int8 *)(v32 + 12);
                if (v53 == 2)
                {
                  v79._hasFillColor = 1;
                  LOBYTE(__dst[0]) = 1;
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v32, 0x16Cu, 0, &v79);
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v32, 0x16Cu, 1u, __dst);
                }
                else
                {
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v32, 0x16Cu, v53, 0);
                }
                uint64_t v54 = *(void *)(*(void *)&v78._orientation + 24);
                unsigned int v55 = *(unsigned __int8 *)(v54 + 12);
                if (v55 == 2)
                {
                  v79._hasFillColor = 1;
                  LOBYTE(__dst[0]) = 1;
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v54, 0x174u, 0, &v79);
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(v54, 0x174u, 1u, __dst);
                }
                else
                {
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<unsigned int>(*(void *)(*(void *)&v78._orientation + 24), 0x174u, v55, 0);
                }
                uint64_t v56 = *(void *)(*(void *)&v78._orientation + 24);
                v57 = *(float **)v56;
                if (*(void *)v56
                  && (float v58 = *v57, LODWORD(v57) = *v57 == 1.0, *(unsigned char *)(v56 + 10))
                  && v58 != 0.0
                  && v58 != 1.0
                  || (unsigned int v59 = *(unsigned __int8 *)(v56 + v57 + 11), v59 == 2))
                {
                  v79._hasFillColor = 1;
                  LOBYTE(__dst[0]) = 1;
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<float>(v56, 0xDAu, 0, &v79);
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<float>(v56, 0xDAu, 1u, __dst);
                }
                else
                {
                  gss::RenderStyle<gss::PropertyID>::styleValueForKey<float>(*(void *)(*(void *)&v78._orientation + 24), 0xDAu, v59, 0);
                }
                goto LABEL_92;
              }
            }
          }
          else
          {
            BOOL v35 = 0;
          }
          unsigned int v46 = *(unsigned __int8 *)(v32 + v35 + 11);
          if (v46 != 2) {
            goto LABEL_65;
          }
          goto LABEL_63;
        }

LABEL_95:
        [(VKLabelNavRoad *)self _updateWithNavContext:a3];
        id v22 = 0;
        float32x4_t v23 = v84;
        if (!v84) {
          goto LABEL_98;
        }
        goto LABEL_96;
      }
      VKLabelCopyText(data, v29);
      v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      double v38 = v37;
      if (!v37 || ![(NSString *)v37 length])
      {
LABEL_60:

        goto LABEL_95;
      }
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)v79._fillColor._backing._e = _Q0;
      *(_OWORD *)&v79._fillColor._backing._e[2] = _Q0;
      *(void *)&v79._hasFillColor = 0x1010000000001;
      memset(&v79._shadowColor, 0, 24);
      v79._shadowColor._backing._e[3] = 0.200000003;
      memset(&v79._textColor, 0, 24);
      v79._gradientFillAngle = 0.0;
      v79._textColor._backing._e[3] = 1.0;
      v78._orientation = 0;
      *(_OWORD *)&v78._scale = _Q0;
      *(_OWORD *)&v78._arrowWeight = xmmword_1A28FE8E0;
      v78._arrowTipCornerRadius = 0.0;
      v78._arrowJoinCornerRadius = 0.0;
      v78._shadowOffset = (CGSize)*MEMORY[0x1E4F1DB30];
      v78._strokeWeight = 0.0;
      v78._innerStrokeWeight = 0.0;
      v78._shadowRadius = 20.0;
      *(_OWORD *)&v78._signHeight = xmmword_1A28FE8F0;
      v78._horizontalMargin = 0.0;
      v78._verticalMargin = 0.0;
      v78._glyphSize = v78._shadowOffset;
      v78._cornerRadius = 6.5;
      v78._glyphVerticalOffset = 0.0;
      __asm { FMOV            V1.2D, #6.0 }
      __dst[0] = _Q0;
      __dst[1] = _Q1;
      __dst[2] = xmmword_1A28FF260;
      uint64_t v66 = 0x4031000000000000;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      {
        operator new();
      }
      uint64_t v70 = mdm::Allocator::instance(void)::alloc;
      uint64_t v71 = 0;
      uint64_t v72 = 0;
      uint64_t v73 = 0;
      {
        operator new();
      }
      uint64_t v75 = 0;
      uint64_t v76 = 0;
      uint64_t v74 = mdm::Allocator::instance(void)::alloc;
      __int16 v77 = 1;
      v78._orientation = a6;
      v44 = a3->var1;
      double v45 = *((float *)v44 + 44);
      v78._scale = *(float *)(*((void *)v44 + 42) + 172);
      v78._contentScale = v45;
      *(double *)__dst = v78._scale;
      *((double *)__dst + 1) = v45;
      memset(v90, 0, 32);
      if (GetRoadSignMetadataForStyleQuery(v83, v84, v90, (uint64_t)&v79, (uint64_t)&v78, (uint64_t)__dst))
      {
        VKLabelNavArtworkCache::getRoadSignArtwork((VKLabelNavArtworkCache *)a7, v38, &v78, &v79, (const md::RoadSignTextMetrics *)__dst);
        if (objc_claimAutoreleasedReturnValue()) {
          operator new();
        }

        if ((SHIBYTE(v73) & 0x80000000) == 0) {
          goto LABEL_58;
        }
      }
      else if ((SHIBYTE(v73) & 0x80000000) == 0)
      {
        goto LABEL_58;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v74 + 40))(v74, v71, v73 & 0x7FFFFFFFFFFFFFFFLL);
LABEL_58:
      if (SHIBYTE(v69) < 0) {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v70 + 40))(v70, v67, v69 & 0x7FFFFFFFFFFFFFFFLL);
      }
      goto LABEL_60;
    }
  }
  else if (v83)
  {
    goto LABEL_13;
  }
  id v22 = 0;
  float32x4_t v23 = v84;
  if (!v84) {
    goto LABEL_98;
  }
LABEL_96:
  if (!atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
LABEL_98:
  v63 = *(std::__shared_weak_count **)&v88;
  if (v88 != 0.0 && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v88 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
    std::__shared_weak_count::__release_weak(v63);
  }

  return v22;
}

- (unsigned)roadSignAlignment
{
  double v2 = *(float *)&self->_routeOffset.index;
  if (v2 < -0.2) {
    return 6;
  }
  if (v2 <= 0.2) {
    return 3;
  }
  return 7;
}

- (BOOL)_worldPointForRoadOffset:(float)a3 worldPoint:(void *)a4
{
  uint64_t v36 = 0;
  unint64_t v37 = 0;
  id v7 = geo::codec::multiSectionFeaturePointsWithElevation((void *)self->_data, 0, &v36, &v37);
  unint64_t v8 = v37;
  if (v37 >= 2)
  {
    BOOL v9 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
    [WeakRetained worldUnitsPerMeter];
    double v12 = v11;
    ptr = self->_tile.__ptr_;
    double v14 = *((double *)ptr + 41);
    double v15 = *((double *)ptr + 39);

    unint64_t vertexIndexB = self->_vertexIndexB;
    if (v36) {
      float v17 = *(float *)(v36 + 4 * vertexIndexB);
    }
    else {
      float v17 = 0.0;
    }
    float32x2_t v18 = (float32x2_t)v9[vertexIndexB];
    unint64_t labelVertexIndexA = self->_labelVertexIndexA;
    uint64_t v20 = vertexIndexB - labelVertexIndexA;
    if (vertexIndexB != labelVertexIndexA)
    {
      double v21 = v12 * a3 / (v14 - v15);
      uint64_t v22 = 1;
      if (vertexIndexB >= labelVertexIndexA) {
        uint64_t v22 = -1;
      }
      if (v20 < 0) {
        uint64_t v20 = labelVertexIndexA - vertexIndexB;
      }
      if ((unint64_t)v20 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v20;
      }
      float32x2_t v24 = (float32x2_t)v9[v22 + vertexIndexB];
      float32x2_t v25 = vsub_f32(v24, v18);
      float v26 = sqrtf(vaddv_f32(vmul_f32(v25, v25)));
      uint64_t v27 = 0;
      if (v21 >= v26)
      {
        int v29 = (float32x2_t *)&v9[2 * v22 + vertexIndexB];
        uint64_t v30 = v23 - 1;
        while (v30 != v27)
        {
          float32x2_t v31 = v24;
          float v28 = v26;
          float32x2_t v24 = *v29;
          float32x2_t v32 = vsub_f32(*v29, v18);
          float v26 = sqrtf(vaddv_f32(vmul_f32(v32, v32)));
          v29 += v22;
          ++v27;
          if (v21 < v26)
          {
            float32x2_t v25 = vsub_f32(v24, v31);
            float32x2_t v18 = v31;
            goto LABEL_19;
          }
        }
        float32x2_t v18 = (float32x2_t)v9[labelVertexIndexA];
        if (v36) {
          float v17 = *(float *)(v36 + 4 * labelVertexIndexA);
        }
        else {
          float v17 = 0.0;
        }
      }
      else
      {
        float v28 = 0.0;
LABEL_19:
        float v33 = v21;
        float v34 = fminf(fmaxf((float)(v33 - v28) / (float)(v26 - v28), 0.0), 1.0);
        float32x2_t v18 = vmla_n_f32(v18, v25, v34);
        if (v36) {
          float v17 = *(float *)(v36 + 4 * (vertexIndexB + v27 * v22))
        }
              + (float)((float)(*(float *)(v36 + 4 * (vertexIndexB + v27 * v22 + v22))
                              - *(float *)(v36 + 4 * (vertexIndexB + v27 * v22)))
                      * v34);
      }
    }
    *(float64x2_t *)a4 = vmlaq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 312), vcvtq_f64_f32(v18), vsubq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 328), *(float64x2_t *)((char *)self->_tile.__ptr_ + 312)));
    *((double *)a4 + 2) = v17;
  }
  return v8 > 1;
}

- (void)_worldRoadPoints:(void *)a3 elevations:(void *)a4
{
  __src = 0;
  uint64_t v100 = 0;
  id v7 = geo::codec::multiSectionFeaturePointsWithElevation((void *)self->_data, 0, &__src, &v100);
  if (!v100) {
    return;
  }
  unint64_t v8 = v7;
  v96 = a4;
  unint64_t vertexIndexB = self->_vertexIndexB;
  unint64_t labelVertexIndexA = self->_labelVertexIndexA;
  BOOL v11 = vertexIndexB >= labelVertexIndexA;
  uint64_t v12 = vertexIndexB - labelVertexIndexA;
  if (v11) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v12 >= 0) {
    unint64_t v14 = v12;
  }
  else {
    unint64_t v14 = -v12;
  }
  unint64_t v15 = v14 + 1;
  if (v14 >= (uint64_t)(*((void *)a3 + 2) - *(void *)a3) >> 4)
  {
    if (v14 >= 0xFFFFFFFFFFFFFFFLL) {
      goto LABEL_112;
    }
    uint64_t v16 = *((void *)a3 + 1) - *(void *)a3;
    uint64_t v17 = (*(uint64_t (**)(void, unint64_t, uint64_t))(**((void **)a3 + 3) + 16))(*((void *)a3 + 3), 16 * v15, 8);
    uint64_t v19 = *(void *)a3;
    uint64_t v18 = *((void *)a3 + 1);
    unint64_t v20 = v17 + (v16 & 0xFFFFFFFFFFFFFFF0);
    if (v18 != *(void *)a3)
    {
      do
      {
        *(_OWORD *)(v20 - 16) = *(_OWORD *)(v18 - 16);
        v20 -= 16;
        v18 -= 16;
      }
      while (v18 != v19);
      uint64_t v18 = *(void *)a3;
    }
    *(void *)a3 = v20;
    *((void *)a3 + 1) = v17 + (v16 & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = *((void *)a3 + 2);
    *((void *)a3 + 2) = v17 + 16 * v15;
    if (v18) {
      (*(void (**)(void, uint64_t, uint64_t))(**((void **)a3 + 3) + 40))(*((void *)a3 + 3), v18, v21 - v18);
    }
  }
  uint64_t v95 = v14 + 1;
  unint64_t v22 = 0;
  uint64_t v23 = (float32x2_t *)&v8[self->_vertexIndexB];
  float32x2_t v24 = (float64x2_t *)*((void *)a3 + 1);
  do
  {
    float64x2_t v25 = vmlaq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 312), vcvtq_f64_f32(*v23), vsubq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 328), *(float64x2_t *)((char *)self->_tile.__ptr_ + 312)));
    unint64_t v26 = *((void *)a3 + 2);
    if ((unint64_t)v24 >= v26)
    {
      uint64_t v27 = ((uint64_t)v24 - *(void *)a3) >> 4;
      if ((unint64_t)(v27 + 1) >> 60) {
        goto LABEL_112;
      }
      uint64_t v28 = v26 - *(void *)a3;
      uint64_t v29 = v28 >> 3;
      if (v28 >> 3 <= (unint64_t)(v27 + 1)) {
        uint64_t v29 = v27 + 1;
      }
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
        uint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v30 = v29;
      }
      if (v30)
      {
        float64x2_t v97 = v25;
        uint64_t v31 = 16 * v30;
        uint64_t v32 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)a3 + 3) + 16))(*((void *)a3 + 3), 16 * v30, 8);
        float v33 = (float64x2_t *)(v32 + 16 * v27);
        uint64_t v30 = v32 + v31;
        if (v32) {
          *float v33 = v97;
        }
      }
      else
      {
        float v33 = (float64x2_t *)(16 * v27);
      }
      uint64_t v35 = *(void *)a3;
      uint64_t v34 = *((void *)a3 + 1);
      uint64_t v36 = v33;
      if (v34 != *(void *)a3)
      {
        do
        {
          v36[-1] = *(float64x2_t *)(v34 - 16);
          --v36;
          v34 -= 16;
        }
        while (v34 != v35);
        uint64_t v34 = *(void *)a3;
      }
      float32x2_t v24 = v33 + 1;
      *(void *)a3 = v36;
      *((void *)a3 + 1) = v33 + 1;
      uint64_t v37 = *((void *)a3 + 2);
      *((void *)a3 + 2) = v30;
      if (v34) {
        (*(void (**)(void, uint64_t, uint64_t))(**((void **)a3 + 3) + 40))(*((void *)a3 + 3), v34, v37 - v34);
      }
    }
    else
    {
      if (v24) {
        *float32x2_t v24 = v25;
      }
      ++v24;
    }
    *((void *)a3 + 1) = v24;
    ++v22;
    v23 += v13;
  }
  while (v22 <= v14);
  if (!v96) {
    return;
  }
  double v38 = (char *)*((void *)v96 + 1);
  if (__src)
  {
    std::vector<float>::__insert_with_size[abi:nn180100]<float const*,float const*>((unint64_t *)v96, *((void **)v96 + 1), (char *)__src, (char *)__src + 4 * v95, v95);
    return;
  }
  int v98 = 0;
  unint64_t v39 = *(void *)v96;
  uint64_t v40 = (uint64_t)&v38[-*(void *)v96];
  uint64_t v41 = v40 >> 2;
  v42 = (char *)(*(void *)v96 + (v40 & 0xFFFFFFFFFFFFFFFCLL));
  uint64_t v43 = *((void *)v96 + 2);
  if (v14 >= (v43 - (uint64_t)v38) >> 2)
  {
    unint64_t v47 = v41 + v95;
    if (!((unint64_t)(v41 + v95) >> 62))
    {
      uint64_t v48 = v43 - v39;
      if (v48 >> 1 > v47) {
        unint64_t v47 = v48 >> 1;
      }
      if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v49 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v49 = v47;
      }
      if (v49)
      {
        if (v49 >> 62) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        unsigned int v50 = (char *)operator new(4 * v49);
      }
      else
      {
        unsigned int v50 = 0;
      }
      unsigned int v53 = (void **)&v50[4 * v41];
      uint64_t v54 = (char *)v53 + 4 * v95;
      uint64_t v55 = v14 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v56 = (char *)v53;
      if ((v14 & 0x3FFFFFFFFFFFFFFFLL) >= 0x13)
      {
        if (v53 >= &__src || (uint64_t v56 = (char *)v53, &v50[4 * v95 + (v40 & 0xFFFFFFFFFFFFFFFCLL)] <= (char *)&v98))
        {
          uint64_t v57 = (v55 + 1) & 0x7FFFFFFFFFFFFFF8;
          float v58 = v53;
          uint64_t v59 = v57;
          do
          {
            *(_OWORD *)float v58 = 0uLL;
            *((_OWORD *)v58 + 1) = 0uLL;
            v58 += 4;
            v59 -= 8;
          }
          while (v59);
          if (v55 + 1 == v57)
          {
LABEL_63:
            if ((char *)v39 != v38)
            {
              if ((unint64_t)(v40 - 4) >= 0x3C)
              {
                uint64_t v60 = v42;
                if ((v40 & 0xFFFFFFFFFFFFFFFCLL) + v39 - (unint64_t)&v50[v40 & 0xFFFFFFFFFFFFFFFCLL] >= 0x20)
                {
                  unint64_t v61 = ((unint64_t)(v40 - 4) >> 2) + 1;
                  uint64_t v60 = &v42[-4 * (v61 & 0x7FFFFFFFFFFFFFF8)];
                  uint64_t v62 = 4 * (v40 >> 2) - 16;
                  v63 = (long long *)(v39 + v62);
                  v64 = &v50[v62];
                  uint64_t v65 = v61 & 0x7FFFFFFFFFFFFFF8;
                  do
                  {
                    long long v66 = *v63;
                    *((_OWORD *)v64 - 1) = *(v63 - 1);
                    *(_OWORD *)v64 = v66;
                    v63 -= 2;
                    v64 -= 32;
                    v65 -= 8;
                  }
                  while (v65);
                  unsigned int v53 = (void **)((char *)v53 - 4 * (v61 & 0x7FFFFFFFFFFFFFF8));
                  if (v61 == (v61 & 0x7FFFFFFFFFFFFFF8)) {
                    goto LABEL_71;
                  }
                }
              }
              else
              {
                uint64_t v60 = v42;
              }
              do
              {
                int v67 = *((_DWORD *)v60 - 1);
                v60 -= 4;
                *((_DWORD *)v53 - 1) = v67;
                unsigned int v53 = (void **)((char *)v53 - 4);
              }
              while (v60 != (char *)v39);
            }
LABEL_71:
            uint64_t v68 = &v50[4 * v49];
            if (v38 != v42) {
              memmove(v54, v42, v38 - v42);
            }
            *(void *)v96 = v53;
            *((void *)v96 + 1) = &v54[v38 - v42];
            *((void *)v96 + 2) = v68;
            if (v39) {
              operator delete((void *)v39);
            }
            return;
          }
          uint64_t v56 = (char *)v53 + 4 * v57;
        }
      }
      do
      {
        *(_DWORD *)uint64_t v56 = v98;
        v56 += 4;
      }
      while (v56 != v54);
      goto LABEL_63;
    }
LABEL_112:
    abort();
  }
  unint64_t v44 = (v38 - v42) >> 2;
  uint64_t v45 = 4 * v95;
  if (v44 <= v14)
  {
    unsigned int v46 = &v38[4 * (v95 - v44)];
    unint64_t v51 = v45 - (v38 - v42) - 4;
    if (v51 >= 0x4C)
    {
      if (v38 >= (char *)&__src || &v38[(v51 & 0xFFFFFFFFFFFFFFFCLL) + 4] <= (char *)&v98)
      {
        uint64_t v69 = (v51 >> 2) + 1;
        uint64_t v70 = v38;
        uint64_t v71 = v69 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          *(_OWORD *)uint64_t v70 = 0uLL;
          *((_OWORD *)v70 + 1) = 0uLL;
          v70 += 32;
          v71 -= 8;
        }
        while (v71);
        if (v69 == (v69 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_83:
          *((void *)v96 + 1) = v46;
          if (v38 == v42) {
            return;
          }
          goto LABEL_84;
        }
        v52 = &v38[4 * (v69 & 0x7FFFFFFFFFFFFFF8)];
      }
      else
      {
        v52 = v38;
      }
    }
    else
    {
      v52 = v38;
    }
    do
    {
      *(_DWORD *)v52 = v98;
      v52 += 4;
    }
    while (v52 != v46);
    goto LABEL_83;
  }
  unsigned int v46 = v38;
  unint64_t v44 = v14 + 1;
LABEL_84:
  uint64_t v72 = &v42[v45];
  int64_t v73 = v46 - &v42[v45];
  uint64_t v74 = v73 >> 2;
  uint64_t v75 = &v46[-v45];
  uint64_t v76 = v46;
  if (v75 < v38)
  {
    unint64_t v77 = (v40 & 0xFFFFFFFFFFFFFFFCLL) + v73;
    unint64_t v78 = v77 + v39;
    unint64_t v79 = v77 + v39 + 4;
    if ((unint64_t)v38 > v79) {
      unint64_t v79 = (unint64_t)v38;
    }
    unint64_t v80 = v79 + ~v39 - v77;
    unint64_t v81 = (unint64_t)&v46[-v78];
    BOOL v82 = v80 >= 0x2C && v81 > 0x1F;
    uint64_t v76 = v46;
    if (!v82) {
      goto LABEL_116;
    }
    uint64_t v83 = (v80 >> 2) + 1;
    uint64_t v84 = 4 * (v83 & 0x7FFFFFFFFFFFFFF8);
    v75 += v84;
    v85 = v46 + 16;
    v86 = (long long *)(4 * v74 + 4 * v41 + v39 + 16);
    uint64_t v87 = v83 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      long long v88 = *v86;
      *(v85 - 1) = *(v86 - 1);
      _OWORD *v85 = v88;
      v85 += 2;
      v86 += 2;
      v87 -= 8;
    }
    while (v87);
    uint64_t v76 = &v46[v84];
    if (v83 != (v83 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_116:
      do
      {
        int v89 = *(_DWORD *)v75;
        v75 += 4;
        *(_DWORD *)uint64_t v76 = v89;
        v76 += 4;
      }
      while (v75 < v38);
    }
  }
  *((void *)v96 + 1) = v76;
  if (v46 != v72) {
    memmove(&v46[-4 * v74], v42, v73);
  }
  v90 = (const float *)&v98;
  if (v42 <= (char *)&v98)
  {
    if (*((void *)v96 + 1) <= (unint64_t)&v98) {
      unint64_t v91 = 0;
    }
    else {
      unint64_t v91 = v14 + 1;
    }
    v90 = (const float *)(&v98 + v91);
  }
  if (v44 < 0xC || v42 < (char *)v90 + 4 && (unint64_t)v90 < v39 + (v40 & 0xFFFFFFFFFFFFFFFCLL) + 4 * v44) {
    goto LABEL_110;
  }
  v42 += 4 * (v44 & 0xFFFFFFFFFFFFFFF8);
  float32x4_t v92 = vld1q_dup_f32(v90);
  v93 = (float32x4_t *)(v39 + 4 * v41 + 16);
  unint64_t v94 = v44 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v93[-1] = v92;
    float32x4_t *v93 = v92;
    v93 += 2;
    v94 -= 8;
  }
  while (v94);
  if (v44 != (v44 & 0xFFFFFFFFFFFFFFF8))
  {
    v44 &= 7u;
    do
    {
LABEL_110:
      *(float *)v42 = *v90;
      v42 += 4;
      --v44;
    }
    while (v44);
  }
}

- (void)appendSimplifiedWorldRoadPoints:(void *)a3 pointElevations:(void *)a4
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  navJunctionA = self->_navJunctionA;
  begin = (VKLabelNavJunction *)self->_simplifiedPoints.__begin_;
  if (navJunctionA != begin) {
    goto LABEL_45;
  }
  uint64_t v147 = 0;
  uint64_t v148 = 0;
  uint64_t v149 = 0;
  {
    operator new();
  }
  uint64_t v150 = mdm::Allocator::instance(void)::alloc;
  v144 = 0;
  v145 = 0;
  uint64_t v146 = 0;
  uint64_t v9 = [(VKLabelNavRoad *)self _worldRoadPoints:&v147 elevations:&v144];
  uint64_t v10 = v148 - v147;
  if (v148 != v147)
  {
    if ((unint64_t)v10 <= 0x4001)
    {
      MEMORY[0x1F4188790](v9);
      uint64_t v12 = (uint64_t *)((char *)&v142 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v12, v11);
      goto LABEL_7;
    }
    uint64_t v12 = malloc_type_malloc(v10 >> 1, 0x100004000313F17uLL);
    if (v12)
    {
LABEL_7:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
      [WeakRetained worldUnitsPerMeter];
      double v15 = v14;

      uint64_t v16 = v147;
      unint64_t v17 = (v148 - v147) >> 4;
      if ((unint64_t)(v148 - v147) > 0x2F)
      {
        uint64_t v143 = 1;
        *uint64_t v12 = 0;
        unint64_t v19 = v17 - 1;
        geo::dpSimplifyViaIndexes<gm::Matrix<double,2,1>,unsigned long>(v16, 0, v17 - 1, (uint64_t)v12, &v143, v15 * 8.0);
        uint64_t v20 = v143;
        unint64_t v17 = ++v143;
        v12[v20] = v19;
        if (v20 == -1) {
          goto LABEL_38;
        }
      }
      else
      {
        if (v148 != v147)
        {
          uint64_t v18 = 0;
          do
          {
            v12[v18] = v18;
            ++v18;
          }
          while (v17 != v18);
        }
        uint64_t v143 = v17;
        if (!v17) {
          goto LABEL_38;
        }
      }
      uint64_t v21 = self->_navJunctionA;
      unint64_t v22 = self->_simplifiedPoints.__begin_;
      unint64_t v23 = (v22 - (unsigned char *)v21) >> 4;
      unint64_t v24 = v17 - v23;
      if (v17 <= v23)
      {
        if (v17 >= v23)
        {
LABEL_31:
          allocator = self->_simplifiedPoints.__end_cap_.__value__2._allocator;
          unint64_t v37 = ((char *)self->_simplifiedPointElevations.__begin_ - (char *)allocator) >> 2;
          if (v17 <= v37)
          {
            if (v17 < v37) {
              self->_simplifiedPointElevations.__begin_ = (float *)((char *)allocator + 4 * v17);
            }
            if (!v17) {
              goto LABEL_38;
            }
          }
          else
          {
            std::vector<float,geo::StdAllocator<float,mdm::Allocator>>::__append((uint64_t)&self->_simplifiedPoints.__end_cap_.__value__2, v17 - v37);
          }
          uint64_t v38 = v147;
          unint64_t v39 = v144;
          uint64_t v40 = self->_simplifiedPoints.__end_cap_.__value__2._allocator;
          p_tile = &self->_navJunctionA->_tile;
          v42 = v12;
          do
          {
            uint64_t v43 = *v42++;
            unint64_t v44 = (__shared_weak_count **)(v38 + 16 * v43);
            p_tile[-1].__cntrl_ = *v44;
            p_tile->__ptr_ = (LabelTile *)v44[1];
            ++p_tile;
            *(_DWORD *)uint64_t v40 = v39[v43];
            uint64_t v40 = (Allocator *)((char *)v40 + 4);
            --v17;
          }
          while (v17);
LABEL_38:
          if ((unint64_t)v10 >= 0x4002) {
            free(v12);
          }
          goto LABEL_40;
        }
        uint64_t v35 = (char *)v21 + 16 * v17;
      }
      else
      {
        end = self->_simplifiedPoints.__end_;
        if (v24 > (end - v22) >> 4)
        {
          if (v17 >> 60) {
            abort();
          }
          uint64_t v26 = end - (unsigned char *)v21;
          uint64_t v27 = v26 >> 3;
          if (v26 >> 3 <= v17) {
            uint64_t v27 = v17;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
            uint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v28 = v27;
          }
          uint64_t v29 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)self->_simplifiedPoints.__end_cap_.__value_
                                                                    + 16))(self->_simplifiedPoints.__end_cap_.__value_, 16 * v28, 8);
          uint64_t v30 = self->_navJunctionA;
          uint64_t v31 = (VKLabelNavJunction *)self->_simplifiedPoints.__begin_;
          uint64_t v32 = (VKLabelNavJunction *)(v29 + 16 * v23);
          float v33 = (char *)v32 + 16 * v24;
          if (v31 != v30)
          {
            do
            {
              *(_OWORD *)&v32[-1]._sortValue = *(_OWORD *)&v31[-1]._sortValue;
              uint64_t v32 = (VKLabelNavJunction *)((char *)v32 - 16);
              uint64_t v31 = (VKLabelNavJunction *)((char *)v31 - 16);
            }
            while (v31 != v30);
            uint64_t v30 = self->_navJunctionA;
          }
          self->_navJunctionA = v32;
          self->_simplifiedPoints.__begin_ = v33;
          uint64_t v34 = self->_simplifiedPoints.__end_;
          self->_simplifiedPoints.__end_ = (void *)(v29 + 16 * v28);
          if (v30)
          {
            (*(void (**)(void *, VKLabelNavJunction *, int64_t))(*(void *)self->_simplifiedPoints.__end_cap_.__value_
                                                                                 + 40))(self->_simplifiedPoints.__end_cap_.__value_, v30, v34 - (unsigned char *)v30);
            unint64_t v17 = v143;
          }
          goto LABEL_31;
        }
        uint64_t v35 = &v22[16 * v24];
      }
      self->_simplifiedPoints.__begin_ = v35;
      goto LABEL_31;
    }
  }
LABEL_40:
  if (v144)
  {
    v145 = v144;
    operator delete(v144);
  }
  if (v147)
  {
    uint64_t v148 = v147;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v150 + 40))(v150, v147, v149 - v147);
  }
  navJunctionA = self->_navJunctionA;
  begin = (VKLabelNavJunction *)self->_simplifiedPoints.__begin_;
LABEL_45:
  if ((char *)begin - (char *)navJunctionA < 1) {
    goto LABEL_99;
  }
  uint64_t v45 = ((char *)begin - (char *)navJunctionA) >> 4;
  uint64_t v46 = *(void *)a3;
  unint64_t v47 = *((void *)a3 + 1);
  uint64_t v48 = v47 - *(void *)a3;
  uint64_t v49 = v48 >> 4;
  unint64_t v50 = *(void *)a3 + (v48 & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = *((void *)a3 + 2);
  if (v45 > (uint64_t)(v51 - v47) >> 4)
  {
    if ((unint64_t)(v49 + v45) >> 60) {
      abort();
    }
    uint64_t v52 = v51 - v46;
    uint64_t v53 = v52 >> 3;
    if (v52 >> 3 <= (unint64_t)(v49 + v45)) {
      uint64_t v53 = v49 + v45;
    }
    if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFF0) {
      uint64_t v54 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v54 = v53;
    }
    if (v54) {
      uint64_t v55 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)a3 + 3) + 16))(*((void *)a3 + 3), 16 * v54, 8);
    }
    else {
      uint64_t v55 = 0;
    }
    uint64_t v60 = (_OWORD *)(v55 + 16 * v49);
    uint64_t v61 = 16 * v45;
    uint64_t v62 = &v60[v45];
    v63 = v60;
    do
    {
      if (v63) {
        _OWORD *v63 = *(_OWORD *)&navJunctionA->super.isa;
      }
      ++v63;
      navJunctionA = (VKLabelNavJunction *)((char *)navJunctionA + 16);
      v61 -= 16;
    }
    while (v61);
    uint64_t v64 = *(void *)a3;
    if (*(void *)a3 == v50)
    {
      uint64_t v66 = v55 + 16 * v49;
    }
    else
    {
      unint64_t v65 = v50;
      do
      {
        uint64_t v66 = (uint64_t)(v60 - 1);
        *(v60 - 1) = *(_OWORD *)(v65 - 16);
        v65 -= 16;
        --v60;
      }
      while (v65 != v64);
    }
    for (uint64_t i = *((void *)a3 + 1); v50 != i; ++v62)
    {
      long long v68 = *(_OWORD *)v50;
      v50 += 16;
      *uint64_t v62 = v68;
    }
    uint64_t v69 = *(void *)a3;
    *(void *)a3 = v66;
    *((void *)a3 + 1) = v62;
    uint64_t v70 = *((void *)a3 + 2);
    *((void *)a3 + 2) = v55 + 16 * v54;
    if (v69) {
      (*(void (**)(void, uint64_t, uint64_t))(**((void **)a3 + 3) + 40))(*((void *)a3 + 3), v69, v70 - v69);
    }
    goto LABEL_99;
  }
  uint64_t v56 = (uint64_t)(v47 - v50) >> 4;
  if (v56 >= v45)
  {
    uint64_t v57 = (VKLabelNavJunction *)((char *)navJunctionA + 16 * v45);
    uint64_t v59 = (char *)*((void *)a3 + 1);
    goto LABEL_78;
  }
  uint64_t v57 = (VKLabelNavJunction *)((char *)navJunctionA + 16 * v56);
  if (v57 == begin)
  {
    uint64_t v59 = (char *)*((void *)a3 + 1);
  }
  else
  {
    float v58 = v57;
    uint64_t v59 = (char *)*((void *)a3 + 1);
    do
    {
      if (v59) {
        *(_OWORD *)uint64_t v59 = *(_OWORD *)&v58->super.isa;
      }
      float v58 = (VKLabelNavJunction *)((char *)v58 + 16);
      v59 += 16;
    }
    while (v58 != begin);
  }
  *((void *)a3 + 1) = v59;
  if ((uint64_t)(v47 - v50) >= 1)
  {
LABEL_78:
    uint64_t v71 = (char *)(v50 + 16 * v45);
    uint64_t v72 = &v59[-16 * v45];
    int64_t v73 = v59;
    if ((unint64_t)v72 < v47)
    {
      uint64_t v74 = &v59[-16 * v45];
      int64_t v73 = v59;
      do
      {
        if (v73) {
          *(_OWORD *)int64_t v73 = *(_OWORD *)v74;
        }
        v74 += 16;
        v73 += 16;
      }
      while ((unint64_t)v74 < v47);
    }
    *((void *)a3 + 1) = v73;
    if (v59 != v71)
    {
      int64_t v75 = v59 - v71;
      if ((unint64_t)(v75 - 16) < 0xD0
        || &v59[-(v75 & 0xFFFFFFFFFFFFFFF0)] < v72
        && v46 + v75 + (v48 & 0xFFFFFFFFFFFFFFF0) - (v75 & 0xFFFFFFFFFFFFFFF0) < (unint64_t)v59)
      {
        uint64_t v76 = v59;
        goto LABEL_88;
      }
      unint64_t v133 = ((unint64_t)(v75 - 16) >> 4) + 1;
      uint64_t v76 = &v59[-16 * (v133 & 0x1FFFFFFFFFFFFFFCLL)];
      v134 = (const double *)(v72 - 32);
      v135 = (double *)(v59 - 32);
      uint64_t v136 = v133 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        float64x2x2_t v152 = vld2q_f64(v134);
        v137 = v134 - 4;
        float64x2x2_t v153 = vld2q_f64(v137);
        vst2q_f64(v135, v152);
        v138 = v135 - 4;
        vst2q_f64(v138, v153);
        v135 -= 8;
        v134 -= 8;
        v136 -= 4;
      }
      while (v136);
      if (v133 != (v133 & 0x1FFFFFFFFFFFFFFCLL))
      {
        v72 -= 16 * (v133 & 0x1FFFFFFFFFFFFFFCLL);
LABEL_88:
        unint64_t v77 = v76 - 8;
        do
        {
          uint64_t v78 = *((void *)v72 - 2);
          v72 -= 16;
          *((void *)v77 - 1) = v78;
          *(void *)unint64_t v77 = *((void *)v72 + 1);
          v77 -= 16;
        }
        while (v72 != (char *)v50);
      }
    }
    if (v57 == navJunctionA) {
      goto LABEL_99;
    }
    unint64_t v79 = (char *)v57 - (char *)navJunctionA - 16;
    if (v79 >= 0xD0
      && (v50 >= (unint64_t)&navJunctionA->_tile.__cntrl_ + (v79 & 0xFFFFFFFFFFFFFFF0)
       || (v48 & 0xFFFFFFFFFFFFFFF0) + v46 + (v79 & 0xFFFFFFFFFFFFFFF0) + 16 <= (unint64_t)navJunctionA))
    {
      uint64_t v80 = (v79 >> 4) + 1;
      uint64_t v81 = 16 * (v80 & 0x1FFFFFFFFFFFFFFCLL);
      v50 += v81;
      p_geoJunction = &navJunctionA->_geoJunction;
      uint64_t v83 = (_OWORD *)(v46 + 16 * v49 + 32);
      uint64_t v84 = v80 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        long long v86 = *((_OWORD *)p_geoJunction - 2);
        long long v85 = *((_OWORD *)p_geoJunction - 1);
        long long v88 = *(_OWORD *)p_geoJunction;
        long long v87 = *((_OWORD *)p_geoJunction + 1);
        p_geoJunction += 8;
        *(v83 - 2) = v86;
        *(v83 - 1) = v85;
        *uint64_t v83 = v88;
        v83[1] = v87;
        v83 += 4;
        v84 -= 4;
      }
      while (v84);
      if (v80 == (v80 & 0x1FFFFFFFFFFFFFFCLL)) {
        goto LABEL_99;
      }
      navJunctionA = (VKLabelNavJunction *)((char *)navJunctionA + v81);
    }
    do
    {
      *(void *)unint64_t v50 = navJunctionA->super.isa;
      *(void *)(v50 + 8) = navJunctionA->_tile.__ptr_;
      navJunctionA = (VKLabelNavJunction *)((char *)navJunctionA + 16);
      v50 += 16;
    }
    while (navJunctionA != v57);
  }
LABEL_99:
  if (!a4) {
    return;
  }
  v90 = self->_simplifiedPoints.__end_cap_.__value__2._allocator;
  int v89 = self->_simplifiedPointElevations.__begin_;
  uint64_t v91 = (char *)v89 - (char *)v90;
  if ((char *)v89 - (char *)v90 < 1) {
    return;
  }
  uint64_t v92 = v91 >> 2;
  unint64_t v94 = *(int **)a4;
  unint64_t v93 = *((void *)a4 + 1);
  uint64_t v95 = v93 - *(void *)a4;
  v96 = (int *)(*(void *)a4 + (v95 & 0xFFFFFFFFFFFFFFFCLL));
  uint64_t v97 = *((void *)a4 + 2);
  if (v91 >> 2 > (uint64_t)(v97 - v93) >> 2)
  {
    uint64_t v98 = v95 >> 2;
    unint64_t v99 = (v95 >> 2) + v92;
    if (v99 >> 62) {
      abort();
    }
    uint64_t v100 = v97 - (void)v94;
    if (v100 >> 1 > v99) {
      unint64_t v99 = v100 >> 1;
    }
    if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFFCLL) {
      uint64_t v101 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v101 = v99;
    }
    if (v101) {
      uint64_t v102 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)a4 + 3) + 16))(*((void *)a4 + 3), 4 * v101, 4);
    }
    else {
      uint64_t v102 = 0;
    }
    v107 = (_DWORD *)(v102 + 4 * v98);
    uint64_t v108 = 4 * v92;
    v109 = &v107[v92];
    v110 = v107;
    do
    {
      if (v110) {
        _DWORD *v110 = *(_DWORD *)v90;
      }
      ++v110;
      v90 = (Allocator *)((char *)v90 + 4);
      v108 -= 4;
    }
    while (v108);
    v111 = *(int **)a4;
    if (*(int **)a4 == v96) {
      goto LABEL_130;
    }
    uint64_t v112 = (uint64_t)v94 + (v95 & 0xFFFFFFFFFFFFFFFCLL);
    unint64_t v113 = v112 - (void)v111 - 4;
    if (v113 >= 0x3C)
    {
      v114 = v96;
      if (v112 - ((v95 & 0xFFFFFFFFFFFFFFFCLL) + v102) >= 0x20)
      {
        uint64_t v115 = (v113 >> 2) + 1;
        v114 = &v96[-(v115 & 0x7FFFFFFFFFFFFFF8)];
        uint64_t v116 = 4 * v98 - 16;
        v117 = (long long *)((char *)v94 + v116);
        v118 = (_OWORD *)(v102 + v116);
        uint64_t v119 = v115 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v120 = *v117;
          *(v118 - 1) = *(v117 - 1);
          _OWORD *v118 = v120;
          v117 -= 2;
          v118 -= 2;
          v119 -= 8;
        }
        while (v119);
        v107 -= v115 & 0x7FFFFFFFFFFFFFF8;
        if (v115 == (v115 & 0x7FFFFFFFFFFFFFF8)) {
          goto LABEL_130;
        }
      }
    }
    else
    {
      v114 = v96;
    }
    do
    {
      int v121 = *--v114;
      *--v107 = v121;
    }
    while (v114 != v111);
LABEL_130:
    v122 = (int *)*((void *)a4 + 1);
    if (v122 != v96)
    {
      uint64_t v123 = (uint64_t)v94 + (v95 & 0xFFFFFFFFFFFFFFFCLL);
      unint64_t v124 = (unint64_t)v122 - v123 - 4;
      if (v124 < 0x3C) {
        goto LABEL_162;
      }
      if ((v95 & 0xFFFFFFFFFFFFFFFCLL) + v102 + v91 - v123 < 0x20) {
        goto LABEL_162;
      }
      uint64_t v125 = (v124 >> 2) + 1;
      uint64_t v126 = 4 * (v125 & 0x7FFFFFFFFFFFFFF8);
      v96 = (int *)((char *)v96 + v126);
      v127 = (_OWORD *)(4 * v98 + 4 * v92 + v102 + 16);
      v128 = (long long *)&v94[v98 + 4];
      uint64_t v129 = v125 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v130 = *v128;
        *(v127 - 1) = *(v128 - 1);
        _OWORD *v127 = v130;
        v127 += 2;
        v128 += 2;
        v129 -= 8;
      }
      while (v129);
      v109 = (_DWORD *)((char *)v109 + v126);
      if (v125 != (v125 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_162:
        do
        {
          int v131 = *v96++;
          *v109++ = v131;
        }
        while (v96 != v122);
      }
    }
    *(void *)a4 = v107;
    *((void *)a4 + 1) = v109;
    uint64_t v132 = *((void *)a4 + 2);
    *((void *)a4 + 2) = v102 + 4 * v101;
    if (v111) {
      (*(void (**)(void, int *, uint64_t))(**((void **)a4 + 3) + 40))(*((void *)a4 + 3), v111, v132 - (void)v111);
    }
    return;
  }
  uint64_t v103 = (uint64_t)(v93 - (void)v96) >> 2;
  if (v103 >= v92)
  {
    v104 = (Allocator *)((char *)v90 + 4 * v92);
    v106 = (char *)*((void *)a4 + 1);
LABEL_145:
    v139 = (char *)&v96[v92];
    v140 = &v106[-4 * v92];
    v141 = v106;
    if ((unint64_t)v140 < v93)
    {
      v141 = v106;
      do
      {
        if (v141) {
          *(_DWORD *)v141 = *(_DWORD *)v140;
        }
        v140 += 4;
        v141 += 4;
      }
      while ((unint64_t)v140 < v93);
    }
    *((void *)a4 + 1) = v141;
    if (v106 != v139) {
      memmove(&v106[-4 * ((v106 - v139) >> 2)], v96, v106 - v139);
    }
    if (v104 != v90) {
      memmove(v96, v90, v104 - v90);
    }
    return;
  }
  v104 = (Allocator *)((char *)v90 + 4 * v103);
  if (v104 == (Allocator *)v89)
  {
    v106 = (char *)*((void *)a4 + 1);
  }
  else
  {
    v105 = (float *)((char *)v90 + 4 * v103);
    v106 = (char *)*((void *)a4 + 1);
    do
    {
      if (v106) {
        *(float *)v106 = *v105;
      }
      ++v105;
      v106 += 4;
    }
    while (v105 != v89);
  }
  *((void *)a4 + 1) = v106;
  if ((uint64_t)(v93 - (void)v96) >= 1) {
    goto LABEL_145;
  }
}

- (void)recreateRoadShieldWithNavContext:(NavContext *)a3 artworkCache:(void *)a4
{
  id v7 = [(VKLabelNavRoadLabel *)self->_roadSign label];
  unint64_t v8 = *v7;
  uint64_t v9 = *((void *)*v7 + 20);
  if (v9)
  {
    double v10 = (*(double (**)(uint64_t))(*(void *)v9 + 56))(v9);
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v10 = v8[14];
    double v12 = v8[15];
    double v14 = v8[16];
  }
  [(VKLabelNavRoad *)self clearRoadShield];
  double v15 = -[VKLabelNavRoad _newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:](self, "_newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:", a3, 1, 0, a4, v10, v12, v14);
  uint64_t v16 = v15;
  if (v15 && LOBYTE(self->_direction3D._e[1]))
  {
    if ((nextUniqueDisplayID + 1) > 1) {
      int v17 = nextUniqueDisplayID + 1;
    }
    else {
      int v17 = 1;
    }
    nextUniqueDisplayID = v17;
    -[VKLabelNavRoadLabel setDisplayID:](v15, "setDisplayID:");
  }
  roadSign = self->_roadSign;
  self->_roadSign = v16;
}

- (void)recreateRoadSignWithAlignment:(unsigned __int8)a3 navContext:(NavContext *)a4 artworkCache:(void *)a5
{
  uint64_t v7 = a3;
  uint64_t v9 = [(NSString *)self->_shieldGroup label];
  double v10 = *(double **)v9;
  uint64_t v11 = *(void *)(*(void *)v9 + 160);
  if (v11)
  {
    double v12 = (*(double (**)(uint64_t))(*(void *)v11 + 56))(v11);
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v12 = v10[14];
    double v14 = v10[15];
    double v16 = v10[16];
  }
  [(VKLabelNavRoad *)self clearRoadSign];
  int v17 = -[VKLabelNavRoad _newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:](self, "_newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:", a4, 0, v7, a5, v12, v14, v16);
  uint64_t v18 = v17;
  if (v17 && LOBYTE(self->_direction3D._e[1]))
  {
    if ((nextUniqueDisplayID + 1) > 1) {
      int v19 = nextUniqueDisplayID + 1;
    }
    else {
      int v19 = 1;
    }
    nextUniqueDisplayID = v19;
    -[NSString setDisplayID:](v17, "setDisplayID:");
  }
  shieldGroup = self->_shieldGroup;
  self->_shieldGroup = v18;
}

- (void)createLabelWithNavContext:(NavContext *)a3 isShieldLabel:(BOOL)a4 desiredOffsetDistance:(float)a5 maxOffsetDistance:(float)a6 minJunctionDistance:(float)a7 minRouteDistance:(float)a8 roadGraph:(id)a9 artworkCache:(void *)a10
{
  BOOL v15 = a4;
  id v18 = a9;
  if (!BYTE1(self->_direction3D._e[2]))
  {
    [(VKLabelNavRoad *)self _updateWithNavContext:a3];
    int v19 = [(VKLabelNavRoad *)self labelWithType:v15];
    unint64_t v23 = v19;
    if (v19)
    {
      [v19 desiredOffsetDistance];
      if (vabds_f32(a5, *(float *)&v20) < 0.01) {
        goto LABEL_31;
      }
    }
    if (v15)
    {
      if (!self->_cachedShieldVisibility[1]) {
        goto LABEL_31;
      }
    }
    else if (![(VKLabelNavRoad *)self roadHasName])
    {
LABEL_31:

      goto LABEL_32;
    }
    if (*((unsigned char *)self->_data + 153) != 6)
    {
      float v24 = a5;
      if (!BYTE1(self->_direction3D._e[1]))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
        float v24 = a5;
        if (WeakRetained)
        {
          uint64_t v30 = WeakRetained;
          id v31 = objc_loadWeakRetained((id *)&self->_junctionB);
          int v32 = [v31 isOnRoute];

          float v24 = a5;
          if (v32)
          {
            id v33 = objc_loadWeakRetained((id *)&self->_junctionB);
            uint64_t v34 = [v33 outgoingRoad];

            float v24 = a5;
            if (v34)
            {
              id v35 = objc_loadWeakRetained((id *)&self->_junctionB);
              uint64_t v36 = (double *)[v35 mercatorCoordinate];
              double v37 = *v36;
              double v38 = v36[1];
              double v39 = v36[2];
              id v40 = objc_loadWeakRetained((id *)&self->_junctionB);
              uint64_t v41 = [v40 outgoingRoad];
              [v41 direction2D];
              LODWORD(v43) = v42;
              LODWORD(v45) = v44;
              *(float *)&double v46 = a8;
              -[VKLabelNavRoad _findRoadOffsetForDistanceToRay:rayStart:rayVector:roadGraph:](self, "_findRoadOffsetForDistanceToRay:rayStart:rayVector:roadGraph:", v18, v46, v37, v38, v39, v43, v45);
              LODWORD(v37) = v47;

              float v24 = fmaxf(*(float *)&v37, a5);
            }
            id v48 = objc_loadWeakRetained((id *)&self->_junctionB);
            uint64_t v49 = [v48 incomingRoad];

            if (v49)
            {
              id v50 = objc_loadWeakRetained((id *)&self->_junctionB);
              uint64_t v51 = (double *)[v50 mercatorCoordinate];
              double v52 = *v51;
              double v53 = v51[1];
              double v54 = v51[2];
              id v55 = objc_loadWeakRetained((id *)&self->_junctionB);
              uint64_t v56 = [v55 incomingRoad];
              [v56 direction2D];
              LODWORD(v58) = v57;
              LODWORD(v60) = v59;
              *(float *)&double v61 = a8;
              -[VKLabelNavRoad _findRoadOffsetForDistanceToRay:rayStart:rayVector:roadGraph:](self, "_findRoadOffsetForDistanceToRay:rayStart:rayVector:roadGraph:", v18, v61, v52, v53, v54, v58, v60);
              float v63 = v62;

              float v24 = fmaxf(v24, v63);
            }
          }
        }
      }
      long long v71 = 0uLL;
      double v72 = 0.0;
      *(float *)&double v20 = v24;
      *(float *)&double v21 = a6;
      *(float *)&double v22 = a7;
      if ([(VKLabelNavRoad *)self _findLabelAnchorPoint:&v71 isShieldLabel:v15 desiredOffsetDistance:v18 maxOffsetDistance:v20 minJunctionDistance:v21 roadGraph:v22])
      {
        if (v23)
        {
          *(float *)&double v25 = a5;
          [v23 setDesiredOffsetDistance:v25];
          uint64_t v26 = [v23 label];
          uint64_t v27 = *(void *)v26;
          uint64_t v28 = *(void *)(*(void *)v26 + 160);
          if (v28)
          {
            (*(void (**)(uint64_t, double, double, double))(*(void *)v28 + 80))(v28, *(double *)&v71, *((double *)&v71 + 1), v72);
          }
          else
          {
            *(_OWORD *)(v27 + 112) = v71;
            *(double *)(v27 + 128) = v72;
          }
          uint64_t v69 = *(void *)[v23 label];
          char v70 = BYTE1(self->_direction3D._e[1]);
          *(unsigned char *)(v69 + 24) = v70 ^ 1;
          *(unsigned char *)(v69 + 27) = 2 * v70;
        }
        else
        {
          id v64 = -[VKLabelNavRoad _newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:](self, "_newLabelWithNavContext:isShieldLabel:worldPoint:alignment:artworkCache:", a3, v15, [(VKLabelNavRoad *)self roadSignAlignment], a10, v71, v72);
          *(float *)&double v65 = a5;
          [v64 setDesiredOffsetDistance:v65];
          if (v64 && LOBYTE(self->_direction3D._e[1]))
          {
            if ((nextUniqueDisplayID + 1) > 1) {
              int v66 = nextUniqueDisplayID + 1;
            }
            else {
              int v66 = 1;
            }
            nextUniqueDisplayID = v66;
            objc_msgSend(v64, "setDisplayID:");
          }
          uint64_t v67 = 248;
          if (v15) {
            uint64_t v67 = 256;
          }
          long long v68 = *(Class *)((char *)&self->super.isa + v67);
          *(Class *)((char *)&self->super.isa + v67) = (Class)v64;
        }
      }
    }
    goto LABEL_31;
  }
LABEL_32:
}

- (BOOL)_findLabelAnchorPoint:(void *)a3 isShieldLabel:(BOOL)a4 desiredOffsetDistance:(float)a5 maxOffsetDistance:(float)a6 minJunctionDistance:(float)a7 roadGraph:(id)a8
{
  BOOL v10 = a4;
  id v13 = a8;
  double v14 = self;
  [(VKLabelNavRoad *)v14 length];
  float v16 = v15;
  float v17 = a7 + a7;
  BOOL v18 = (float)(a7 + a7) > v16 || v16 <= a5;
  float v67 = a7;
  float v19 = 0.0;
  if (v10)
  {
    if (v18)
    {
      unint64_t v20 = 0;
      float v21 = 0.0;
      double v22 = v14;
      float v23 = 0.0;
      float v24 = v16;
      float v25 = v16;
      while (v23 <= a6 && v20 <= 7)
      {
        uint64_t v27 = [v13 junctionForRoad:v22 nearJunction:0 crossTileEdge:0];
        int v28 = [v27 isMultiRoadIntersection];
        if ((v28 & (v16 > v25)) != 0)
        {
          float v19 = v21;
          float v25 = v16;
        }
        if (v28) {
          float v21 = v24;
        }
        uint64_t v29 = [v13 nextRoadSegmentForRoad:v22];

        if (!v29) {
          goto LABEL_46;
        }
        [v29 length];
        float v31 = v30 + v24;

        float v16 = v31 - v21;
        ++v20;
        BOOL v32 = v31 <= a5 || v16 < v17;
        double v22 = v29;
        float v23 = v24;
        float v24 = v31;
        if (!v32) {
          goto LABEL_40;
        }
      }
      goto LABEL_48;
    }
  }
  else if (v18)
  {
    unint64_t v33 = 0;
    float v21 = 0.0;
    double v22 = v14;
    float v34 = 0.0;
    float v24 = v16;
    float v25 = v16;
    while (v34 <= a6 && v33 <= 7)
    {
      uint64_t v27 = [v13 junctionForRoad:v22 nearJunction:0 crossTileEdge:0];
      int v36 = [v27 isMultiRoadIntersection];
      if ((v36 & (v16 > v25)) != 0)
      {
        float v19 = v21;
        float v25 = v16;
      }
      if (v36) {
        float v21 = v24;
      }
      uint64_t v29 = [v13 nextRoadSegmentForRoad:v22];

      if (!v29 || BYTE1(v14->_direction3D._e[1]) && ![v29 isOnRoute])
      {
LABEL_46:

        goto LABEL_47;
      }
      [v29 length];
      float v31 = v37 + v24;

      float v16 = v31 - v21;
      ++v33;
      BOOL v38 = v31 <= a5 || v16 < v17;
      double v22 = v29;
      float v34 = v24;
      float v24 = v31;
      if (!v38) {
        goto LABEL_40;
      }
    }
    goto LABEL_48;
  }
  float v25 = v15;
  float v31 = v15;
  float v21 = 0.0;
  uint64_t v29 = v14;
LABEL_40:
  float v39 = fminf(fmaxf(v21 + v67, a5), v31 - v67);
  if (v39 != 0.0)
  {
    uint64_t v40 = 200;
    if (v10) {
      uint64_t v40 = 208;
    }
    uint64_t v41 = (unint64_t *)((char *)v14 + v40);
    if (v39 < (float)(a5 + (float)((float)(a6 - a5) * 0.5)))
    {
      unint64_t v42 = *v41 | 1;
      goto LABEL_56;
    }
LABEL_55:
    unint64_t v42 = *v41 & 0xFFFFFFFFFFFFFFFELL;
LABEL_56:
    *uint64_t v41 = v42;
    double v45 = v14;

    double v46 = v45;
    [(VKLabelNavRoad *)v46 length];
    double v22 = v46;
    if (v47 >= v39) {
      goto LABEL_76;
    }
    [(VKLabelNavRoad *)v46 length];
    double v49 = v48;
    double v22 = [v13 nextRoadSegmentForRoad:v46];

    if (!v22)
    {
LABEL_74:
      [(VKLabelNavRoad *)v46 length];
      float v39 = v65;
      double v52 = v46;

      goto LABEL_75;
    }
    [v22 length];
    float v39 = v39 - v49;
    if (v47 >= v39) {
      goto LABEL_76;
    }
    [v22 length];
    double v51 = v50;
    double v52 = [v13 nextRoadSegmentForRoad:v22];

    if (v52)
    {
      [(VKLabelNavRoad *)v52 length];
      float v39 = v39 - v51;
      if (v47 >= v39) {
        goto LABEL_75;
      }
      [(VKLabelNavRoad *)v52 length];
      double v54 = v53;
      double v22 = [v13 nextRoadSegmentForRoad:v52];

      if (!v22) {
        goto LABEL_74;
      }
      [v22 length];
      float v39 = v39 - v54;
      if (v47 >= v39) {
        goto LABEL_76;
      }
      [v22 length];
      double v56 = v55;
      double v52 = [v13 nextRoadSegmentForRoad:v22];

      if (v52)
      {
        [(VKLabelNavRoad *)v52 length];
        float v39 = v39 - v56;
        if (v47 >= v39) {
          goto LABEL_75;
        }
        [(VKLabelNavRoad *)v52 length];
        double v58 = v57;
        double v22 = [v13 nextRoadSegmentForRoad:v52];

        if (!v22) {
          goto LABEL_74;
        }
        [v22 length];
        float v39 = v39 - v58;
        if (v47 >= v39) {
          goto LABEL_76;
        }
        [v22 length];
        double v60 = v59;
        double v52 = [v13 nextRoadSegmentForRoad:v22];

        if (v52)
        {
          [(VKLabelNavRoad *)v52 length];
          float v39 = v39 - v60;
          if (v47 < v39)
          {
            [(VKLabelNavRoad *)v52 length];
            double v62 = v61;
            double v22 = [v13 nextRoadSegmentForRoad:v52];

            if (v22)
            {
              [v22 length];
              float v39 = v39 - v62;
              if (v47 < v39)
              {
                [v22 length];
                uint64_t v63 = [v13 nextRoadSegmentForRoad:v22];

                double v22 = (void *)v63;
                goto LABEL_74;
              }
LABEL_76:
              *(float *)&double v47 = v39;
              char v64 = [v22 _worldPointForRoadOffset:a3 worldPoint:v47];

              goto LABEL_77;
            }
            goto LABEL_74;
          }
LABEL_75:
          double v22 = v52;
          goto LABEL_76;
        }
      }
    }
    double v22 = 0;
    goto LABEL_74;
  }
  float v24 = v31;
LABEL_47:
  double v22 = v29;
LABEL_48:
  if (BYTE1(v14->_direction3D._e[1])) {
    BOOL v43 = 0;
  }
  else {
    BOOL v43 = v24 < 30.0;
  }
  if (!v43)
  {
    float v39 = v19 + (float)(v25 * 0.5);
    uint64_t v44 = 200;
    if (v10) {
      uint64_t v44 = 208;
    }
    uint64_t v41 = (unint64_t *)((char *)v14 + v44);
    uint64_t v29 = v22;
    goto LABEL_55;
  }
  char v64 = 0;
LABEL_77:

  return v64;
}

- (float)_findRoadOffsetForDistanceToRay:(float)a3 rayStart:()Matrix<double rayVector:()3 roadGraph:(1>)a4
{
  float v6 = a5._e[1];
  float v7 = a5._e[0];
  double v8 = a4._e[1];
  double v9 = a4._e[0];
  id v12 = a6;
  p_junctionB = &self->_junctionB;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  [WeakRetained worldUnitsPerMeter];
  double v16 = v15;

  uint64_t v41 = 0;
  unint64_t v42 = 0;
  uint64_t v43 = 0;
  {
    operator new();
  }
  uint64_t v44 = mdm::Allocator::instance(void)::alloc;
  float v17 = self;
  if (v17)
  {
    BOOL v18 = v17;
    uint64_t v19 = 0;
    double v20 = v16 * a3;
    double v21 = v7;
    double v22 = v6;
    double v23 = 0.0;
    double v24 = 0.0;
    while (1)
    {
      unint64_t v42 = v41;
      [v18 _worldRoadPoints:&v41 elevations:0];
      if ((unint64_t)((char *)v42 - (char *)v41) >= 0x11) {
        break;
      }
LABEL_11:
      if (v19 != 7)
      {
        uint64_t v35 = [v12 nextRoadSegmentForRoad:v18];
        ++v19;

        BOOL v18 = (void *)v35;
        if (v35) {
          continue;
        }
      }
      goto LABEL_16;
    }
    unint64_t v25 = ((char *)v42 - (char *)v41) >> 4;
    if (v25 <= 2) {
      unint64_t v25 = 2;
    }
    double v28 = *v41;
    double v27 = v41[1];
    uint64_t v26 = v41 + 3;
    unint64_t v29 = v25 - 1;
    double v30 = v23;
    while (1)
    {
      double v31 = *(v26 - 1);
      double v32 = *v26;
      double v33 = *v26 - v8;
      if ((v31 - v9) * v21 + v33 * v22 < 0.0) {
        break;
      }
      double v34 = sqrt((v31 - v28) * (v31 - v28) + (v32 - v27) * (v32 - v27));
      double v23 = fabs(-((v31 - v9) * v22 - v33 * v21));
      if (v23 >= v20)
      {
        double v24 = v24 + fmin(fmax((v20 - v30) / (v23 - v30), 0.0), 1.0) * v34;
        break;
      }
      v26 += 2;
      double v24 = v34 + v24;
      double v27 = v32;
      double v28 = v31;
      double v30 = v23;
      if (!--v29) {
        goto LABEL_11;
      }
    }
LABEL_16:
  }
  else
  {
    double v24 = 0.0;
  }
  id v36 = objc_loadWeakRetained((id *)p_junctionB);
  [v36 worldUnitsPerMeter];
  double v38 = v37;

  if (v41)
  {
    unint64_t v42 = v41;
    (*(void (**)(uint64_t, double *, uint64_t))(*(void *)v44 + 40))(v44, v41, v43 - (void)v41);
  }

  return v24 / v38;
}

- (id)labelWithType:(BOOL)a3
{
  uint64_t v3 = 248;
  if (a3) {
    uint64_t v3 = 256;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (NSString)shieldDisplayGroup
{
  name = self->_name;
  if (!name)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    geo::codec::featureGetNativeShield((uint64_t)self->_data, 0, &v11, &v10, 0);
    if (v11)
    {
      id v4 = [NSString alloc];
      int8x16_t v5 = (void *)[v4 initWithUTF8String:v11];
    }
    else
    {
      int8x16_t v5 = 0;
    }
    id v6 = [NSString alloc];
    float v7 = (NSString *)[v6 initWithFormat:@"%@_%llX_%@", v5, v10, *(void *)&self->_length];
    double v8 = self->_name;
    self->_name = v7;

    name = self->_name;
  }
  return name;
}

- (NSString)shieldGroup
{
  if (!self->_shieldDisplayGroup && [(VKLabelNavRoad *)self hasShield])
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    geo::codec::featureGetNativeShield((uint64_t)self->_data, 0, &v11, &v10, 0);
    if (v11)
    {
      id v3 = [NSString alloc];
      id v4 = (void *)[v3 initWithUTF8String:v11];
    }
    else
    {
      id v4 = 0;
    }
    id v5 = [NSString alloc];
    id v6 = (NSString *)[v5 initWithFormat:@"%@_%llX", v4, v10];
    shieldDisplayGroup = self->_shieldDisplayGroup;
    self->_shieldDisplayGroup = v6;
  }
  double v8 = self->_shieldDisplayGroup;
  return v8;
}

- (BOOL)hasShield
{
  return *((unsigned char *)self->_data + 72) != 0;
}

- (BOOL)hasVisibleShields
{
  return self->_cachedShieldVisibility[1];
}

- (BOOL)hasVisibleSigns
{
  return self->_cachedShieldVisibility[0];
}

- (BOOL)matchesRoad:(id)a3
{
  if (self->_data != (const void *)*((void *)a3 + 3)) {
    return 0;
  }
  unint64_t v4 = *((void *)a3 + 5);
  unint64_t v5 = *((void *)a3 + 6);
  if (__PAIR128__(v5, v4) == *(_OWORD *)self->_lineType._value.data) {
    return 1;
  }
  if (v5 != *(void *)&self->_lineType._value.type) {
    return 0;
  }
  return v4 == self->_vertexIndexA;
}

- (BOOL)matchesRoadEdge:(const GeoCodecsRoadEdge *)a3
{
  if (self->_data != a3->var0) {
    return 0;
  }
  unint64_t var1 = a3->var1;
  unint64_t var2 = a3->var2;
  if (__PAIR128__(var2, var1) == *(_OWORD *)self->_lineType._value.data) {
    return 1;
  }
  if (var2 != *(void *)&self->_lineType._value.type) {
    return 0;
  }
  return var1 == self->_vertexIndexA;
}

- (void)getRoadEdge:(GeoCodecsRoadEdge *)a3
{
  a3->var6 = 0;
  *(_OWORD *)&a3->unint64_t var2 = 0u;
  *(_OWORD *)&a3->var4 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  double type = self->_lineType._value.type;
  a3->var5 = (GeoCodecsConnectivityJunction *)self->_labelVertexIndexB;
  a3->var6 = self->_junctionA;
  data = (GeoCodecsRoadFeature *)self->_data;
  *(double *)&a3->unint64_t var1 = type;
  a3->unint64_t var2 = self->_vertexIndexA;
  a3->var0 = data;
}

- (BOOL)isOnewayToJunction
{
  int v2 = *((unsigned __int8 *)self->_data + 153);
  if (v2 == 2) {
    return *(void *)&self->_lineType._value.type < self->_vertexIndexA;
  }
  if (v2 == 1) {
    return *(void *)&self->_lineType._value.type > self->_vertexIndexA;
  }
  return 0;
}

- (BOOL)isRamp
{
  uint64_t v2 = *((void *)self->_data + 3);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 33);
  if (!*(unsigned char *)(v2 + 33)) {
    return 0;
  }
  uint64_t v4 = 0;
  unint64_t v5 = *(int **)v2;
  id v6 = v5;
  while (1)
  {
    int v7 = *v6;
    v6 += 2;
    if (v7 == 21) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return v5[2 * v4 + 1] > 0;
}

- (BOOL)isAwayFromRoute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  char v3 = [WeakRetained isAwayFromRoute];

  return v3;
}

- (unsigned)roadClass
{
  return *((unsigned char *)self->_data + 151);
}

- (id)description
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"VKLabelNavRoad (%@)", *(void *)&self->_length];
  return v2;
}

- (void)prepareStyleVarsWithContext:(NavContext *)a3
{
  (*(void (**)(uint64_t *__return_ptr))(**(void **)(*((void *)a3->var1 + 21) + 32) + 88))(&v64);
  unsigned int v5 = (***(uint64_t (****)(void))(*((void *)a3->var1 + 21) + 32))();
  if ((_BYTE)v64) {
    unint64_t v6 = BYTE1(v64) + 4 * v5;
  }
  else {
    unint64_t v6 = (4 * v5) | 3;
  }
  if (v6 >= 7) {
    uint64_t v7 = 7;
  }
  else {
    uint64_t v7 = v6;
  }
  if (*((unsigned char *)&self->_roadShield + v7))
  {
    self->_cachedShieldVisibility[0] = self->_isVisibilityCached[v7];
    self->_cachedShieldVisibility[1] = self->_cachedSignVisibility[v7];
    return;
  }
  *((unsigned char *)&self->_roadShield + v7) = 1;
  int v8 = BYTE1(self->_direction3D._e[1]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_junctionB);
  unsigned int v10 = 2 * ([WeakRetained depthFromRoute] == 0);
  if (v8) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }
  v61[0] = 0;
  if (self->_lineType._hasValue)
  {
    v61[1] = *(&self->_lineType._hasValue + 1);
    v61[0] = 1;
  }
  v60[0] = 0;
  if ((_BYTE)v64)
  {
    v60[1] = BYTE1(v64);
    v60[0] = 1;
  }
  GetLabelNavStyleAttributes(&v62, 0, v11, v61, v60);
  v60[0] = 0;
  v61[0] = 0;

  unint64_t var1 = a3->var1;
  id v13 = (std::__shared_weak_count *)v63;
  v56[0] = v62;
  v56[1] = v63;
  if (v63) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v63 + 8), 1uLL, memory_order_relaxed);
  }
  md::LabelManager::styleQueryForFeatureAttributes((uint64_t)&v58, *((void *)var1 + 42), v56);
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  uint64_t v14 = v58;
  double v15 = v59;
  uint64_t v54 = v58;
  double v55 = v59;
  if (v59) {
    atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  gss::QueryableLocker<gss::PropertyID>::QueryableLocker(v56, v14, (uint64_t)v15);
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
    if (v57)
    {
LABEL_27:
      unint64_t v16 = *(void *)(v56[0] + 24);
      float v17 = *(float **)v16;
      if (*(void *)v16
        && (float v18 = *v17, LODWORD(v17) = *v17 == 1.0, *(unsigned char *)(v16 + 10))
        && (v18 != 0.0 ? (BOOL v19 = v18 == 1.0) : (BOOL v19 = 1), !v19)
        || (v20 = *(unsigned __int8 *)(v16 + v17 + 11), float v18 = 0.0, v20 == 2))
      {
        LOBYTE(v54) = 1;
        LOBYTE(v53) = 1;
        unint64_t v21 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v16, 0xDDu, 0, &v54);
        unint64_t v22 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v16, 0xDDu, 1u, &v53);
        if (v18 >= 1.0) {
          double v23 = (char *)v22;
        }
        else {
          double v23 = (char *)v21;
        }
        char v24 = *v23;
      }
      else
      {
        char v24 = *(unsigned char *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(*(void *)(v56[0] + 24), 0xDDu, v20, 0);
      }
      self->_isVisibilityCached[v7] = v24 != 0;
      BOOL v25 = [(VKLabelNavRoad *)self hasShield];
      if (v25)
      {
        unint64_t v26 = *(void *)(v56[0] + 24);
        double v27 = *(float **)v26;
        if (*(void *)v26
          && (float v28 = *v27, LODWORD(v27) = *v27 == 1.0, *(unsigned char *)(v26 + 10))
          && v28 != 0.0
          && v28 != 1.0
          || (v29 = *(unsigned __int8 *)(v26 + v27 + 11), float v28 = 0.0, v29 == 2))
        {
          LOBYTE(v54) = 1;
          LOBYTE(v53) = 1;
          unint64_t v30 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v26, 0xDCu, 0, &v54);
          unint64_t v31 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v26, 0xDCu, 1u, &v53);
          if (v28 >= 1.0) {
            double v32 = (char *)v31;
          }
          else {
            double v32 = (char *)v30;
          }
          char v33 = *v32;
        }
        else
        {
          char v33 = *(unsigned char *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(*(void *)(v56[0] + 24), 0xDCu, v29, 0);
        }
        LOBYTE(v25) = v33 != 0;
      }
      self->_cachedSignVisibility[v7] = v25;
      goto LABEL_55;
    }
  }
  else if (v57)
  {
    goto LABEL_27;
  }
  self->_isVisibilityCached[v7] = 1;
  LOBYTE(v25) = [(VKLabelNavRoad *)self hasShield];
  self->_cachedSignVisibility[v7] = v25;
LABEL_55:
  self->_cachedShieldVisibility[0] = self->_isVisibilityCached[v7];
  self->_cachedShieldVisibility[1] = v25;
  [(VKLabelNavRoad *)self _updateWithNavContext:a3];
  uint64_t v34 = *((void *)self->_data + 3);
  uint64_t v35 = *(unsigned __int8 *)(v34 + 33);
  if (*(unsigned char *)(v34 + 33))
  {
    uint64_t v36 = 0;
    double v37 = *(int **)v34;
    double v38 = v37;
    float v39 = v37;
    while (1)
    {
      int v40 = *v39;
      v39 += 2;
      if (v40 == 1) {
        break;
      }
      if (v35 == ++v36) {
        goto LABEL_61;
      }
    }
    if (v37[2 * v36 + 1] == 9) {
      goto LABEL_66;
    }
LABEL_61:
    uint64_t v41 = 0;
    unint64_t v42 = v37;
    while (1)
    {
      int v43 = *v42;
      v42 += 2;
      if (v43 == 1) {
        break;
      }
      if (v35 == ++v41) {
        goto LABEL_70;
      }
    }
    if (v37[2 * v41 + 1] != 10) {
      goto LABEL_70;
    }
LABEL_66:
    uint64_t v44 = 0;
    while (1)
    {
      int v45 = *v38;
      v38 += 2;
      if (v45 == 21) {
        break;
      }
      if (v35 == ++v44)
      {
        self->_cachedShieldVisibility[2] = 1;
        goto LABEL_80;
      }
    }
    int v50 = v37[2 * v44 + 1];
    self->_cachedShieldVisibility[2] = v50 < 1;
    if (v50 >= 1)
    {
      double v46 = &self->_cachedShieldVisibility[2];
      goto LABEL_71;
    }
  }
  else
  {
LABEL_70:
    double v46 = &self->_cachedShieldVisibility[2];
    self->_cachedShieldVisibility[2] = 0;
LABEL_71:
    if (![(VKLabelNavRoad *)self isRamp])
    {
      if ([(VKLabelNavRoad *)self roadHasName])
      {
        data = self->_data;
        if (data[72])
        {
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          geo::codec::featureGetNativeShield((uint64_t)data, 0, &v54, &v53, 0);
          if (v54)
          {
            id v48 = [NSString alloc];
            double v49 = (void *)[v48 initWithUTF8String:v54];
          }
          else
          {
            double v49 = 0;
          }
          *double v46 = [*(id *)&self->_length isEqualToString:v49];
        }
      }
    }
  }
LABEL_80:
  gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)v56);
  double v51 = v59;
  if (v59 && !atomic_fetch_add(&v59->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
    std::__shared_weak_count::__release_weak(v51);
  }
  double v52 = (std::__shared_weak_count *)v63;
  if (v63)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v63 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
}

- (void)layoutWithNavContext:(NavContext *)a3
{
  -[VKLabelNavRoad _updateWithNavContext:threshold:](self, "_updateWithNavContext:threshold:", 20.0);
  shieldGroup = self->_shieldGroup;
  if (shieldGroup && *(void *)[(NSString *)shieldGroup label]) {
    [(NSString *)self->_shieldGroup layoutWithNavContext:a3];
  }
  roadSign = self->_roadSign;
  if (roadSign && *(void *)[(VKLabelNavRoadLabel *)roadSign label])
  {
    uint64_t v7 = self->_roadSign;
    [(VKLabelNavRoadLabel *)v7 layoutWithNavContext:a3];
  }
}

- (void)_updateWithNavContext:(NavContext *)a3
{
}

- (void)_updateWithNavContext:(NavContext *)a3 threshold:(double)a4
{
  id WeakRetained = (VKLabelNavJunction *)objc_loadWeakRetained((id *)&self->_junctionB);
  BOOL v8 = DetermineJunctionVisibility(WeakRetained, (md::NavContext *)a3, a4);
  BOOL v9 = self->_cachedShieldVisibility[0] && v8;
  self->_cachedShieldVisibility[0] = v9;

  shieldGroup = self->_shieldGroup;
  if (shieldGroup)
  {
    if (*(void *)[(NSString *)shieldGroup label])
    {
      uint64_t v11 = *(unsigned char **)[(NSString *)self->_shieldGroup label];
      BOOL v12 = [(VKLabelNavRoad *)self hasVisibleSigns];
      v11[297] = v12;
      if (v11[296]) {
        v11[298] = v12;
      }
    }
  }
  roadSign = self->_roadSign;
  if (roadSign && *(void *)[(VKLabelNavRoadLabel *)roadSign label])
  {
    uint64_t v14 = *(unsigned char **)[(VKLabelNavRoadLabel *)self->_roadSign label];
    BOOL v15 = [(VKLabelNavRoad *)self hasVisibleShields];
    v14[297] = v15;
    if (v14[296]) {
      v14[298] = v15;
    }
  }
}

- (void)clearRoadShield
{
  [(VKLabelNavRoadLabel *)self->_roadSign setNavFeature:0];
  roadSign = self->_roadSign;
  self->_roadSign = 0;
}

- (void)clearRoadSign
{
  [(NSString *)self->_shieldGroup setNavFeature:0];
  shieldGroup = self->_shieldGroup;
  self->_shieldGroup = 0;
}

- (const)cstrName
{
  return (const char *)*((void *)self->_data + 2);
}

- (void)dealloc
{
  [(NSString *)self->_shieldGroup setNavFeature:0];
  [(VKLabelNavRoadLabel *)self->_roadSign setNavFeature:0];
  v3.receiver = self;
  v3.super_class = (Class)VKLabelNavRoad;
  [(VKLabelNavRoad *)&v3 dealloc];
}

- (VKLabelNavRoad)initWithRoadEdge:(const GeoCodecsRoadEdge *)a3 navJunctionA:(id)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6
{
  id v10 = a4;
  v53.receiver = self;
  v53.super_class = (Class)VKLabelNavRoad;
  uint64_t v11 = [(VKLabelNavRoad *)&v53 init];
  BOOL v12 = v11;
  id v13 = v11;
  if (!v11)
  {
LABEL_41:
    unint64_t v42 = v13;
    goto LABEL_42;
  }
  BOOL v15 = *(LabelTile **)a6;
  uint64_t v14 = *((void *)a6 + 1);
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v11->_tile.__cntrl_;
  v11->_tile.__ptr_ = v15;
  v11->_tile.__cntrl_ = (__shared_weak_count *)v14;
  if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
    std::__shared_weak_count::__release_weak(cntrl);
  }
  *(void *)&v13->_lineType._value.double type = a3->var1;
  v13->_unint64_t vertexIndexA = a3->var2;
  v13->_unint64_t vertexIndexB = a3->var1;
  v13->_unint64_t labelVertexIndexA = a3->var2;
  objc_storeWeak((id *)&v12->_junctionB, v10);
  v13->_labelVertexIndexB = (unint64_t)a3->var5;
  v13->_junctionA = a3->var6;
  var0 = a3->var0;
  v13->_data = a3->var0;
  if (!var0) {
    goto LABEL_16;
  }
  uint64_t v18 = *((void *)var0 + 3);
  uint64_t v19 = *(unsigned __int8 *)(v18 + 33);
  if (!*(unsigned char *)(v18 + 33)) {
    goto LABEL_16;
  }
  uint64_t v20 = 0;
  unint64_t v21 = *(int **)v18;
  unint64_t v22 = v21;
  while (1)
  {
    int v23 = *v22;
    v22 += 2;
    if (v23 == 1) {
      break;
    }
    if (v19 == ++v20) {
      goto LABEL_16;
    }
  }
  int v24 = v21[2 * v20 + 1];
  if (v24 >= 1)
  {
    BOOL hasValue = v13->_lineType._hasValue;
    *(&v13->_lineType._hasValue + 1) = v24;
    if (!hasValue) {
      v13->_lineType._BOOL hasValue = 1;
    }
  }
  else
  {
LABEL_16:
    if (v13->_lineType._hasValue) {
      v13->_lineType._BOOL hasValue = 0;
    }
  }
  id v26 = [NSString alloc];
  if (*((void *)v13->_data + 2)) {
    double v27 = (const char *)*((void *)v13->_data + 2);
  }
  else {
    double v27 = "";
  }
  uint64_t v28 = [v26 initWithUTF8String:v27];
  double length = v13->_length;
  *(void *)&v13->_double length = v28;

  BOOL v30 = [(VKLabelNavRoad *)v13 roadHasName];
  data = v13->_data;
  BOOL v32 = !v30 && data[72] == 0;
  BYTE1(v13->_direction3D._e[2]) = v32;
  *(PolylineCoordinate *)&v13->_isRoadLabelUnique = a5;
  *(int64x2_t *)&v13->_routeOffset.offset = vdupq_n_s64(1uLL);
  uint64_t v51 = 0;
  unint64_t v52 = 0;
  char v33 = geo::codec::multiSectionFeaturePointsWithElevation(data, 0, &v51, &v52);
  if (v52 > 1)
  {
    double type = v13->_lineType._value.type;
    unint64_t vertexIndexA = v13->_vertexIndexA;
    uint64_t v37 = *(void *)&type - vertexIndexA;
    BOOL v36 = *(void *)&type == vertexIndexA;
    if (*(void *)&type < vertexIndexA) {
      uint64_t v38 = 1;
    }
    else {
      uint64_t v38 = -1;
    }
    if (!v36)
    {
      uint64_t v39 = 0;
      uint64_t v40 = v33[*(void *)&type];
      uint64_t v41 = (float *)&v33[v38 + *(void *)&type];
      if (v37 < 0) {
        uint64_t v37 = -v37;
      }
      if ((unint64_t)v37 <= 1) {
        uint64_t v37 = 1;
      }
      while (v33[*(void *)&type] == *(void *)v41)
      {
        ++v39;
        v41 += 2 * v38;
        if (v37 == v39) {
          goto LABEL_41;
        }
      }
      float v43 = *v41 - *(float *)&v40;
      float v44 = v41[1] - *((float *)&v40 + 1);
      float v45 = 1.0 / sqrtf((float)(v43 * v43) + (float)(v44 * v44));
      *(float *)&v13->_simplifiedPointElevations.__end_cap_.__value__2._allocator = v45 * v43;
      *((float *)&v13->_simplifiedPointElevations.__end_cap_.__value__2._allocator + 1) = v45 * v44;
      if (v51) {
        float v46 = *(float *)(v51 + 4 * (*(void *)&type + v39 * v38 + v38))
      }
            - *(float *)(v51 + 4 * (*(void *)&type + v39 * v38));
      else {
        float v46 = 0.0;
      }
      float v47 = *v41 - *(float *)&v40;
      float v48 = v41[1] - *((float *)&v40 + 1);
      float v49 = 1.0 / sqrtf((float)((float)(v47 * v47) + (float)(v48 * v48)) + (float)(v46 * v46));
      v13->_direction2D._e[0] = v49 * v47;
      v13->_direction2D._e[1] = v49 * v48;
      v13->_direction3D._e[0] = v49 * v46;
    }
    goto LABEL_41;
  }
  unint64_t v42 = 0;
LABEL_42:

  return v42;
}

@end