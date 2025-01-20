@interface VKLabelNavJunction
- (BOOL)hasSharedRouteDirection;
- (BOOL)isAwayFromRoute;
- (BOOL)isEtaFeature;
- (BOOL)isGuidanceStepStart;
- (BOOL)isInGuidance;
- (BOOL)isIntersection;
- (BOOL)isIntraRamp;
- (BOOL)isMultiRoadIntersection;
- (BOOL)isOffRouteGraph;
- (BOOL)isOnDualCarriageway;
- (BOOL)isOnRoute;
- (BOOL)isOverpass;
- (BOOL)isPicked;
- (BOOL)isRamp;
- (BOOL)isRoadTerminus;
- (BOOL)isRouteOverpass;
- (BOOL)isRouteRefineJunction;
- (BOOL)isStartOfRoadName;
- (BOOL)isTileEdgeJunction;
- (BOOL)isTrafficCameraFeature;
- (BOOL)isValid;
- (BOOL)isVisible;
- (BOOL)matchesLocationForJunction:(id)a3;
- (Matrix<float,)sharedRouteDirection;
- (Matrix<float,)tileCoordinate;
- (Mercator3<double>)_anchorCoordinateForSignOrientation:(unsigned __int8)a3;
- (NSArray)roads;
- (NSString)name;
- (NSString)shieldDisplayGroup;
- (PolylineCoordinate)routeOffset;
- (VKLabelNavJunction)initWithGEOJunction:(GeoCodecsConnectivityJunction *)a3 routeOffset:(PolylineCoordinate)a4 tile:(const void *)a5;
- (VKLabelNavJunction)initWithRoadEdge:(const GeoCodecsRoadEdge *)a3 atA:(BOOL)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6;
- (VKLabelNavJunction)overpassJunction;
- (VKLabelNavRoad)incomingRoad;
- (VKLabelNavRoad)outgoingRoad;
- (VKLabelNavRoadLabel)junctionSign;
- (const)geoJunction;
- (const)mercatorCoordinate;
- (const)tile;
- (double)worldUnitsPerMeter;
- (float)distanceFromPreviousShieldLabel;
- (id).cxx_construct;
- (id)description;
- (int)preferredLabelPlacement;
- (int)requiredLabelPlacement;
- (int64_t)intraRoadPriorityForRoadLabel;
- (int64_t)intraRoadPriorityForShieldLabel;
- (uint64_t)findRoads;
- (unint64_t)depthFromRoute;
- (unsigned)_signOrientationWithDrivingSide:(BOOL)a3;
- (unsigned)largestRoadClass;
- (void)_updateWithNavContext:(NavContext *)a3;
- (void)_updateWithNavContext:(NavContext *)a3 threshold:(double)a4;
- (void)addRouteEdge:(const VKLabelNavRouteRoadEdge *)a3 atA:(BOOL)a4;
- (void)createLabelWithNavContext:(NavContext *)a3 isDrivingSideRight:(BOOL)a4 artworkCache:(void *)a5;
- (void)dealloc;
- (void)evaluateCrossStreets;
- (void)evaluateCrossStreetsUsingRouteJunction:(id)a3;
- (void)findRoads;
- (void)layoutWithNavContext:(NavContext *)a3;
- (void)prepareStyleVarsWithContext:(NavContext *)a3;
- (void)setDepthFromRoute:(unint64_t)a3;
- (void)setDistanceFromPreviousShieldLabel:(float)a3;
- (void)setIsOnDualCarriageway:(BOOL)a3;
- (void)setIsPicked:(BOOL)a3;
- (void)setIsRouteOverpass:(BOOL)a3;
- (void)setIsRouteRefineJunction:(BOOL)a3;
- (void)setOverpassJunction:(id)a3;
- (void)setPreferredLabelPlacement:(int)a3;
- (void)setRouteOffset:(PolylineCoordinate)a3;
- (void)setSharedRouteDirection:()Matrix<float;
@end

@implementation VKLabelNavJunction

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 5) = 0xBF80000000000000;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 22) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overpassJunction);
  objc_storeStrong((id *)&self->_junctionSign, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_outgoingRoad);
  objc_destroyWeak((id *)&self->_incomingRoad);
  objc_storeStrong((id *)&self->_roads, 0);
  cntrl = self->_tile.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (const)tile
{
  return &self->_tile;
}

- (const)mercatorCoordinate
{
  return &self->_mercatorCoordinate;
}

- (void)setIsPicked:(BOOL)a3
{
  self->_isPicked = a3;
}

- (BOOL)isPicked
{
  return self->_isPicked;
}

- (VKLabelNavRoadLabel)junctionSign
{
  return self->_junctionSign;
}

- (NSString)name
{
  return self->_name;
}

- (void)setIsRouteRefineJunction:(BOOL)a3
{
  self->_isRouteRefineJunction = a3;
}

- (BOOL)isRouteRefineJunction
{
  return self->_isRouteRefineJunction;
}

- (void)setIsRouteOverpass:(BOOL)a3
{
  self->_isRouteOverpass = a3;
}

- (BOOL)isRouteOverpass
{
  return self->_isRouteOverpass;
}

- (BOOL)isOverpass
{
  return self->_isOverpass;
}

- (void)setOverpassJunction:(id)a3
{
}

- (VKLabelNavJunction)overpassJunction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overpassJunction);
  return (VKLabelNavJunction *)WeakRetained;
}

- (void)setDepthFromRoute:(unint64_t)a3
{
  self->_depthFromRoute = a3;
}

- (unint64_t)depthFromRoute
{
  return self->_depthFromRoute;
}

- (Matrix<float,)sharedRouteDirection
{
  float v2 = self->_sharedRouteDirection._e[0];
  float v3 = self->_sharedRouteDirection._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (BOOL)hasSharedRouteDirection
{
  return self->_hasSharedRouteDirection;
}

- (void)setIsOnDualCarriageway:(BOOL)a3
{
  self->_isOnDualCarriageway = a3;
}

- (BOOL)isOnDualCarriageway
{
  return self->_isOnDualCarriageway;
}

- (void)setDistanceFromPreviousShieldLabel:(float)a3
{
  self->_distanceFromPreviousShieldLabel = a3;
}

- (float)distanceFromPreviousShieldLabel
{
  return self->_distanceFromPreviousShieldLabel;
}

- (int)preferredLabelPlacement
{
  return self->_preferredLabelPlacement;
}

- (VKLabelNavRoad)incomingRoad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incomingRoad);
  return (VKLabelNavRoad *)WeakRetained;
}

- (VKLabelNavRoad)outgoingRoad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outgoingRoad);
  return (VKLabelNavRoad *)WeakRetained;
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (Matrix<float,)tileCoordinate
{
  float v2 = self->_tileCoordinate._e[0];
  float v3 = self->_tileCoordinate._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (const)geoJunction
{
  return self->_geoJunction;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isTrafficCameraFeature
{
  return 0;
}

- (BOOL)isEtaFeature
{
  return 0;
}

- (void)setSharedRouteDirection:()Matrix<float
{
  self->_hasSharedRouteDirection = 1;
  self->_sharedRouteDirection = a3;
}

- (BOOL)isGuidanceStepStart
{
  return 0;
}

- (NSString)shieldDisplayGroup
{
  return 0;
}

- (BOOL)isInGuidance
{
  return 0;
}

- (BOOL)isStartOfRoadName
{
  return 0;
}

- (void)createLabelWithNavContext:(NavContext *)a3 isDrivingSideRight:(BOOL)a4 artworkCache:(void *)a5
{
  labelFeature = (uint64_t *)self->_labelFeature;
  if (labelFeature && !self->_areLabelsDisabled && !self->_junctionSign && *((unsigned char *)labelFeature + 73))
  {
    BOOL v8 = a4;
    (*(void (**)(unsigned char *__return_ptr))(**(void **)(*((void *)a3->var1 + 21) + 32) + 88))(v51);
    if ([(VKLabelNavJunction *)self isOnRoute]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (self->_depthFromRoute == 0);
    }
    v48[0] = 0;
    v47[0] = 0;
    if (v51[0])
    {
      v47[1] = v51[1];
      v47[0] = 1;
      GetLabelNavStyleAttributes(&v49, 1u, v10, v48, v47);
      v47[0] = 0;
    }
    else
    {
      GetLabelNavStyleAttributes(&v49, 1u, v10, v48, v47);
    }
    var1 = a3->var1;
    v12 = *(std::__shared_weak_count **)&v50;
    *(void *)&v44._hasFillColor = v49;
    v44._fillColor._backing._e[0] = v50;
    if (v50 != 0.0) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v50 + 8), 1uLL, memory_order_relaxed);
    }
    md::LabelManager::styleQueryForFeatureAttributes((uint64_t)&v45, *((void *)var1 + 42), (uint64_t *)&v44._hasFillColor);
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    if (v45)
    {
      unsigned __int8 v13 = atomic_load((unsigned __int8 *)a3->var1 + 3392);
      VKLabelCopyText(labelFeature, v13 & 1);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        uint64_t v15 = [(VKLabelNavJunction *)self _signOrientationWithDrivingSide:v8];
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)v44._fillColor._backing._e = _Q0;
        *(_OWORD *)&v44._fillColor._backing._e[2] = _Q0;
        *(void *)&v44._hasFillColor = 0x1010000000001;
        memset(&v44._shadowColor, 0, 24);
        v44._shadowColor._backing._e[3] = 0.200000003;
        memset(&v44._textColor, 0, 24);
        v44._gradientFillAngle = 0.0;
        v44._textColor._backing._e[3] = 1.0;
        v43._orientation = 0;
        *(_OWORD *)&v43._scale = _Q0;
        *(_OWORD *)&v43._arrowWeight = xmmword_1A28FE8E0;
        v43._arrowTipCornerRadius = 0.0;
        v43._arrowJoinCornerRadius = 0.0;
        v43._shadowOffset = (CGSize)*MEMORY[0x1E4F1DB30];
        v43._strokeWeight = 0.0;
        v43._innerStrokeWeight = 0.0;
        v43._shadowRadius = 20.0;
        *(_OWORD *)&v43._signHeight = xmmword_1A28FE8F0;
        v43._horizontalMargin = 0.0;
        v43._verticalMargin = 0.0;
        v43._glyphSize = v43._shadowOffset;
        v43._cornerRadius = 6.5;
        v43._glyphVerticalOffset = 0.0;
        __asm { FMOV            V1.2D, #6.0 }
        v30[0] = _Q0;
        v30[1] = _Q1;
        v30[2] = xmmword_1A28FF260;
        uint64_t v31 = 0x4031000000000000;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        {
          operator new();
        }
        uint64_t v35 = mdm::Allocator::instance(void)::alloc;
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        {
          operator new();
        }
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        uint64_t v39 = mdm::Allocator::instance(void)::alloc;
        __int16 v42 = 1;
        v43._orientation = v15;
        v22 = a3->var1;
        double v23 = *((float *)v22 + 44);
        v43._scale = *(float *)(*((void *)v22 + 42) + 172);
        v43._contentScale = v23;
        *(double *)v30 = v43._scale;
        *((double *)v30 + 1) = v23;
        memset(&v51[2], 0, 32);
        if (GetRoadSignMetadataForStyleQuery(v45, v46, (uint64_t *)&v51[2], (uint64_t)&v44, (uint64_t)&v43, (uint64_t)v30))
        {
          [(VKLabelNavJunction *)self _anchorCoordinateForSignOrientation:v15];
          VKLabelNavArtworkCache::getRoadSignArtwork((VKLabelNavArtworkCache *)a5, v14, &v43, &v44, (const md::RoadSignTextMetrics *)v30);
          if (objc_claimAutoreleasedReturnValue()) {
            operator new();
          }
        }
        if (SHIBYTE(v38) < 0) {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v39 + 40))(v39, v36, v38 & 0x7FFFFFFFFFFFFFFFLL);
        }
        if (SHIBYTE(v34) < 0) {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v35 + 40))(v35, v32, v34 & 0x7FFFFFFFFFFFFFFFLL);
        }
      }
      junctionSign = self->_junctionSign;
      if (junctionSign)
      {
        uint64_t v25 = *(void *)[(VKLabelNavRoadLabel *)junctionSign label];
        BOOL v26 = [(VKLabelNavJunction *)self isOnRoute];
        *(unsigned char *)(v25 + 24) = !v26;
        if (v26) {
          char v27 = 2;
        }
        else {
          char v27 = 0;
        }
        *(unsigned char *)(v25 + 27) = v27;
      }
      [(VKLabelNavJunction *)self _updateWithNavContext:a3];
    }
    v28 = v46;
    if (v46 && !atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
    v29 = *(std::__shared_weak_count **)&v50;
    if (v50 != 0.0 && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v50 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
}

- (void)prepareStyleVarsWithContext:(NavContext *)a3
{
  (*(void (**)(uint64_t *__return_ptr))(**(void **)(*((void *)a3->var1 + 21) + 32) + 88))(&v34);
  unsigned int v5 = (***(uint64_t (****)(void))(*((void *)a3->var1 + 21) + 32))();
  if ((_BYTE)v34) {
    unint64_t v6 = BYTE1(v34) + 4 * v5;
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
  if (self->_cachedSignVisibility[v7])
  {
    self->_isVisible = 1;
    return;
  }
  if ([(VKLabelNavJunction *)self isOnRoute]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2 * (self->_depthFromRoute == 0);
  }
  v31[0] = 0;
  v30[0] = 0;
  if ((_BYTE)v34)
  {
    v30[1] = BYTE1(v34);
    v30[0] = 1;
    GetLabelNavStyleAttributes(&v32, 1u, v8, v31, v30);
    v30[0] = 0;
  }
  else
  {
    GetLabelNavStyleAttributes(&v32, 1u, v8, v31, v30);
  }
  var1 = a3->var1;
  uint64_t v10 = (std::__shared_weak_count *)v33;
  v26[0] = v32;
  v26[1] = v33;
  if (v33) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v33 + 8), 1uLL, memory_order_relaxed);
  }
  md::LabelManager::styleQueryForFeatureAttributes((uint64_t)&v28, *((void *)var1 + 42), v26);
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  uint64_t v11 = v28;
  v12 = v29;
  v25[0] = v28;
  v25[1] = v29;
  if (v29) {
    atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  gss::QueryableLocker<gss::PropertyID>::QueryableLocker(v26, v11, (uint64_t)v12);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (v27)
    {
LABEL_26:
      unint64_t v13 = *(void *)(v26[0] + 24);
      v14 = *(float **)v13;
      if (*(void *)v13
        && (float v15 = *v14, LODWORD(v14) = *v14 == 1.0, *(unsigned char *)(v13 + 10))
        && (v15 != 0.0 ? (BOOL v16 = v15 == 1.0) : (BOOL v16 = 1), !v16)
        || (v17 = *(unsigned __int8 *)(v13 + v14 + 11), float v15 = 0.0, v17 == 2))
      {
        LOBYTE(v25[0]) = 1;
        BYTE2(v34) = 1;
        unint64_t v18 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v13, 0xDDu, 0, v25);
        unint64_t v19 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v13, 0xDDu, 1u, (unsigned char *)&v34 + 2);
        if (v15 >= 1.0) {
          v20 = (char *)v19;
        }
        else {
          v20 = (char *)v18;
        }
        char v21 = *v20;
      }
      else
      {
        char v21 = *(unsigned char *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(*(void *)(v26[0] + 24), 0xDDu, v17, 0);
      }
      BOOL v22 = v21 != 0;
      goto LABEL_42;
    }
  }
  else if (v27)
  {
    goto LABEL_26;
  }
  BOOL v22 = 1;
LABEL_42:
  self->_cachedSignVisibility[v7] = v22;
  self->_isVisible = v22;
  [(VKLabelNavJunction *)self _updateWithNavContext:a3];
  gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)v26);
  double v23 = v29;
  if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  v24 = (std::__shared_weak_count *)v33;
  if (v33)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v33 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)layoutWithNavContext:(NavContext *)a3
{
  -[VKLabelNavJunction _updateWithNavContext:threshold:](self, "_updateWithNavContext:threshold:", 20.0);
  junctionSign = self->_junctionSign;
  if (junctionSign && *(void *)[(VKLabelNavRoadLabel *)junctionSign label])
  {
    unint64_t v6 = self->_junctionSign;
    [(VKLabelNavRoadLabel *)v6 layoutWithNavContext:a3];
  }
}

- (void)_updateWithNavContext:(NavContext *)a3
{
}

- (void)_updateWithNavContext:(NavContext *)a3 threshold:(double)a4
{
  BOOL v5 = DetermineJunctionVisibility(self, (md::NavContext *)a3, a4);
  BOOL v6 = self->_isVisible && v5;
  self->_isVisible = v6;
  junctionSign = self->_junctionSign;
  if (junctionSign && *(void *)[(VKLabelNavRoadLabel *)junctionSign label])
  {
    uint64_t v8 = *(unsigned char **)[(VKLabelNavRoadLabel *)self->_junctionSign label];
    BOOL v9 = [(VKLabelNavJunction *)self isVisible];
    v8[297] = v9;
    if (v8[296]) {
      v8[298] = v9;
    }
  }
}

- (Mercator3<double>)_anchorCoordinateForSignOrientation:(unsigned __int8)a3
{
  int v3 = a3;
  double v5 = self->_mercatorCoordinate._e[0];
  double v6 = self->_mercatorCoordinate._e[1];
  double v7 = self->_mercatorCoordinate._e[2];
  p_incomingRoad = &self->_incomingRoad;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incomingRoad);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)p_incomingRoad);
    [v10 direction2D];
    float v12 = v11;
    float v14 = v13;

    float v15 = -v12;
    float v16 = -v14;
  }
  else
  {
    id v17 = objc_loadWeakRetained((id *)&self->_outgoingRoad);

    if (!v17) {
      goto LABEL_11;
    }
    id v18 = objc_loadWeakRetained((id *)&self->_outgoingRoad);
    [v18 direction2D];
    float v15 = v19;
    float v16 = v20;
  }
  if (v3 == 6) {
    float v21 = -v15;
  }
  else {
    float v21 = v15;
  }
  if (v3 != 6) {
    float v16 = -v16;
  }
  long double v22 = exp(self->_mercatorCoordinate._e[1] * 6.28318531 + -3.14159265);
  long double v23 = atan(v22) * 114.591559 + -90.0;
  long double v24 = cos(v23 * 0.034906585) * -559.82 + 111132.92;
  long double v25 = v24 + cos(v23 * 0.0698131701) * 1.175;
  long double v26 = v25 + cos(v23 * 0.104719755) * -0.0023;
  long double v27 = v23 * 0.00872664626;
  long double v28 = tan(v23 * 0.00872664626 + 0.78103484);
  double v29 = log(v28);
  long double v30 = tan(v27 + 0.789761487);
  long double v31 = fabs((log(v30) - v29) * 0.159154943) * 3.5 / v26;
  double v5 = v5 + v31 * v16;
  double v6 = v6 + v31 * v21;
LABEL_11:
  double v32 = v5;
  double v33 = v6;
  double v34 = v7;
  result._e[2] = v34;
  result._e[1] = v33;
  result._e[0] = v32;
  return result;
}

- (unsigned)_signOrientationWithDrivingSide:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a3) {
    unsigned __int8 v4 = 7;
  }
  else {
    unsigned __int8 v4 = 6;
  }
  p_incomingRoad = &self->_incomingRoad;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incomingRoad);
  if (!WeakRetained) {
    goto LABEL_10;
  }
  double v7 = WeakRetained;
  id v8 = objc_loadWeakRetained((id *)&self->_outgoingRoad);

  if (!v8) {
    goto LABEL_10;
  }
  id v9 = objc_loadWeakRetained((id *)p_incomingRoad);
  [v9 direction2D];
  float v11 = v10;
  float v13 = v12;

  id v14 = objc_loadWeakRetained((id *)&self->_outgoingRoad);
  [v14 direction2D];
  float v16 = v15;
  float v18 = v17;

  float v19 = -(float)((float)(v18 * v11) - (float)(v16 * v13));
  float v20 = fabsf(v19);
  unsigned __int8 v21 = v19 >= 0.0 ? 6 : 7;
  if (v20 <= 0.2)
  {
LABEL_10:
    id v22 = objc_loadWeakRetained((id *)p_incomingRoad);

    if (v22)
    {
      id v23 = objc_loadWeakRetained((id *)p_incomingRoad);
      [v23 direction2D];
      float v25 = v24;
      float v27 = v26;

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long double v28 = self->_roads;
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
      unsigned __int8 v43 = v4;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      if (v29)
      {
        uint64_t v32 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v45 != v32) {
              objc_enumerationMutation(v28);
            }
            id v34 = *(id *)(*((void *)&v44 + 1) + 8 * i);
            id v35 = objc_loadWeakRetained((id *)p_incomingRoad);
            BOOL v36 = v34 == v35;

            if (!v36)
            {
              [v34 direction2D];
              float v39 = -(float)((float)(v37 * v25) - (float)(v38 * v27));
              if (fabsf(v39) > 0.2)
              {
                if (v39 >= 0.0) {
                  ++v30;
                }
                else {
                  ++v31;
                }
              }
            }
          }
          uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v29);
      }

      if (v30) {
        BOOL v40 = 1;
      }
      else {
        BOOL v40 = v31 == 0;
      }
      if (v40) {
        unsigned __int8 v21 = v43;
      }
      else {
        unsigned __int8 v21 = 7;
      }
      if (v31) {
        BOOL v41 = 1;
      }
      else {
        BOOL v41 = v30 == 0;
      }
      if (!v41) {
        return 6;
      }
    }
    else
    {
      return v4;
    }
  }
  return v21;
}

- (double)worldUnitsPerMeter
{
  double result = self->_worldUnitsPerMeter;
  if (result == 0.0)
  {
    long double v4 = exp(self->_mercatorCoordinate._e[1] * 6.28318531 + -3.14159265);
    long double v5 = atan(v4) * 114.591559 + -90.0;
    long double v6 = cos(v5 * 0.034906585) * -559.82 + 111132.92;
    long double v7 = v6 + cos(v5 * 0.0698131701) * 1.175;
    long double v8 = v7 + cos(v5 * 0.104719755) * -0.0023;
    long double v9 = v5 * 0.00872664626;
    long double v10 = tan(v5 * 0.00872664626 + 0.78103484);
    double v11 = log(v10);
    long double v12 = tan(v9 + 0.789761487);
    double result = fabs((log(v12) - v11) * 0.159154943) / v8;
    self->_worldUnitsPerMeter = result;
  }
  return result;
}

- (void)setPreferredLabelPlacement:(int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self->_preferredLabelPlacement = a3;
  if ((a3 - 1) > 1) {
    return;
  }
  if (a3 == 2)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long double v4 = self->_roads;
    uint64_t v11 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (!v11) {
      goto LABEL_32;
    }
    uint64_t v12 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v4);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isOnRoute", (void)v16) & 1) == 0)
        {
          [v14 routeCrossProduct];
          if (v15 > 0.0)
          {
            objc_msgSend(v14, "setIntraRoadPriorityForRoadLabel:", objc_msgSend(v14, "intraRoadPriorityForRoadLabel") | 2);
            if (![v14 hasShield]) {
              continue;
            }
LABEL_28:
            [v14 intraRoadPriorityForShieldLabel];
            objc_msgSend(v14, "setIntraRoadPriorityForShieldLabel:");
            continue;
          }
          objc_msgSend(v14, "setIntraRoadPriorityForRoadLabel:", objc_msgSend(v14, "intraRoadPriorityForRoadLabel") & 0xFFFFFFFFFFFFFFFDLL);
          if ([v14 hasShield]) {
            goto LABEL_28;
          }
        }
      }
      uint64_t v11 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (!v11) {
        goto LABEL_32;
      }
    }
  }
  if (a3 != 1) {
    goto LABEL_33;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long double v4 = self->_roads;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (!v5) {
    goto LABEL_32;
  }
  uint64_t v6 = *(void *)v21;
  do
  {
    for (uint64_t j = 0; j != v5; ++j)
    {
      if (*(void *)v21 != v6) {
        objc_enumerationMutation(v4);
      }
      long double v8 = *(void **)(*((void *)&v20 + 1) + 8 * j);
      if (([v8 isOnRoute] & 1) == 0)
      {
        [v8 routeCrossProduct];
        if (v9 >= 0.0)
        {
          objc_msgSend(v8, "setIntraRoadPriorityForRoadLabel:", objc_msgSend(v8, "intraRoadPriorityForRoadLabel") & 0xFFFFFFFFFFFFFFFDLL);
          if ([v8 hasShield])
          {
            unint64_t v10 = [v8 intraRoadPriorityForShieldLabel] & 0xFFFFFFFFFFFFFFFDLL;
            goto LABEL_7;
          }
        }
        else
        {
          objc_msgSend(v8, "setIntraRoadPriorityForRoadLabel:", objc_msgSend(v8, "intraRoadPriorityForRoadLabel") | 2);
          if ([v8 hasShield])
          {
            unint64_t v10 = [v8 intraRoadPriorityForShieldLabel] | 2;
LABEL_7:
            [v8 setIntraRoadPriorityForShieldLabel:v10];
            continue;
          }
        }
      }
    }
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  }
  while (v5);
LABEL_32:

LABEL_33:
  -[NSMutableArray sortUsingComparator:](self->_roads, "sortUsingComparator:", &__block_literal_global_12_34813, (void)v16);
}

uint64_t __49__VKLabelNavJunction_setPreferredLabelPlacement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 intraRoadPriorityForRoadLabel];
  uint64_t v7 = [v4 intraRoadPriorityForRoadLabel];
  if (v6 < v7) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = v6 > v7;
  }

  return v8;
}

- (int)requiredLabelPlacement
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isOnDualCarriageway) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_roads;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isOnRoute", (void)v15) & 1) == 0)
        {
          [v10 routeCrossProduct];
          if (v11 < -0.1)
          {
            uint64_t v12 = [v10 name];
            [v5 addObject:v12];
LABEL_6:

            continue;
          }
          [v10 routeCrossProduct];
          if (v13 > 0.1)
          {
            uint64_t v12 = [v10 name];
            [v4 addObject:v12];
            goto LABEL_6;
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count] || objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v4, "count", (void)v15) && !objc_msgSend(v5, "count"))
    {
      int v2 = 2;
    }
    else if ([v4 count] || !objc_msgSend(v5, "count"))
    {
      if ([v4 count] == 1 && objc_msgSend(v4, "isEqualToSet:", v5))
      {
        if (self->_isOverpass) {
          int v2 = 5;
        }
        else {
          int v2 = 3;
        }
      }
      else
      {
        int v2 = 4;
      }
    }
    else
    {
      int v2 = 1;
    }
  }
  else
  {
    int v2 = 0;
  }

  return v2;
}

- (void)evaluateCrossStreetsUsingRouteJunction:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(VKLabelNavJunction *)self findRoads];
  uint64_t v7 = [v6 incomingRoad];
  uint64_t v8 = [v6 outgoingRoad];
  float v9 = v8;
  if (v7)
  {
    [v7 direction2D];
    float v3 = v10;
    float v4 = v11;
    [v7 direction2D];
    float v13 = -v12;
    float v15 = -v14;
  }
  else
  {
    if (!v8) {
      goto LABEL_36;
    }
    [v8 direction2D];
    float v13 = v16;
    float v15 = v17;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v18 = self->_roads;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v19)
  {
    BOOL v21 = v9 == v7 || v9 == 0 || v7 == 0;
    uint64_t v22 = *(void *)v42;
    if (v21)
    {
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v18);
          }
          float v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          objc_msgSend(v24, "direction2D", (void)v41);
          float v26 = v25;
          float v28 = v27;
          char v29 = [v24 isOnRoute];
          *(float *)&double v30 = v26 * v15;
          if (v29)
          {
            *(float *)&double v30 = -(float)(*(float *)&v30 - (float)(v28 * v13));
          }
          else
          {
            float v31 = -(float)(*(float *)&v30 - (float)(v28 * v13));
            LODWORD(v30) = -1.0;
            if (v31 >= 0.0)
            {
              *(float *)&double v30 = v31;
              if (v31 > 0.0) {
                LODWORD(v30) = 1.0;
              }
            }
          }
          [v24 setRouteCrossProduct:v30];
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v19);
    }
    else
    {
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v18);
          }
          double v33 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          objc_msgSend(v33, "direction2D", (void)v41);
          float v35 = v34;
          float v37 = v36;
          if ([v33 isOnRoute])
          {
            *(float *)&double v38 = -(float)((float)(v35 * v15) - (float)(v37 * v13));
          }
          else
          {
            [v9 direction2D];
            float v40 = (float)((float)(v4 - v39) * (float)(v35 - v3))
                + (float)((float)(*(float *)&v38 - v3) * (float)(v37 - v4));
            LODWORD(v38) = -1.0;
            if (v40 >= 0.0)
            {
              *(float *)&double v38 = v40;
              if (v40 > 0.0) {
                LODWORD(v38) = 1.0;
              }
            }
          }
          [v33 setRouteCrossProduct:v38];
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v19);
    }
  }

LABEL_36:
}

- (void)evaluateCrossStreets
{
}

- (void)addRouteEdge:(const VKLabelNavRouteRoadEdge *)a3 atA:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_roads;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    if (a4)
    {
      p_outgoingRoad = &self->_outgoingRoad;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          float v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "matchesRoadEdge:", &a3->var2, (void)v16))
          {
            [v12 setIsOnRoute:1];
            [v12 setLabelVertexIndexA:a3->var3];
            [v12 setLabelVertexIndexB:a3->var4];
            objc_storeWeak((id *)p_outgoingRoad, v12);
          }
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    else
    {
      p_incomingRoad = &self->_incomingRoad;
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          float v15 = *(void **)(*((void *)&v16 + 1) + 8 * j);
          if (objc_msgSend(v15, "matchesRoadEdge:", &a3->var2, (void)v16))
          {
            [v15 setIsOnRoute:1];
            [v15 setLabelVertexIndexA:a3->var3];
            [v15 setLabelVertexIndexB:a3->var4];
            objc_storeWeak((id *)p_incomingRoad, v15);
            [v15 setAreLabelsDisabled:1];
          }
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
}

- (void)findRoads
{
}

uint64_t __31__VKLabelNavJunction_findRoads__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  unsigned int v8 = [v6 roadClass];
  unsigned int v9 = [v7 roadClass];
  if (v8 < v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = v8 > v9;
  }

  return v10;
}

- (uint64_t)findRoads
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF56C168;
  a2[1] = v2;
  return result;
}

- (unsigned)largestRoadClass
{
  if (!self->_foundRoads) {
    [(VKLabelNavJunction *)self findRoads];
  }
  return self->_largestRoadClass;
}

- (NSArray)roads
{
  if (!self->_foundRoads) {
    [(VKLabelNavJunction *)self findRoads];
  }
  roads = self->_roads;
  return (NSArray *)roads;
}

- (BOOL)isMultiRoadIntersection
{
  if (self->_isOverpass) {
    return 1;
  }
  if (![(VKLabelNavJunction *)self isIntersection]) {
    return 0;
  }
  id v4 = [(NSMutableArray *)self->_roads objectAtIndexedSubscript:0];
  id v5 = [v4 name];

  for (unint64_t i = 1; ; ++i)
  {
    unint64_t v7 = [(NSMutableArray *)self->_roads count];
    BOOL v2 = i < v7;
    if (i >= v7) {
      break;
    }
    unsigned int v8 = [(NSMutableArray *)self->_roads objectAtIndexedSubscript:i];
    unsigned int v9 = [v8 name];

    if (v5 != v9 && ([v5 isEqualToString:v9] & 1) == 0)
    {

      break;
    }
  }
  return v2;
}

- (BOOL)isIntraRamp
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v2 = [(VKLabelNavJunction *)self roads];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if (([*(id *)(*((void *)&v8 + 1) + 8 * i) isRamp] & 1) == 0)
        {
          BOOL v6 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)isOffRouteGraph
{
  return self->_depthFromRoute == -1;
}

- (BOOL)isAwayFromRoute
{
  return self->_depthFromRoute != 0;
}

- (BOOL)isRamp
{
  return 0;
}

- (int64_t)intraRoadPriorityForShieldLabel
{
  return 0;
}

- (int64_t)intraRoadPriorityForRoadLabel
{
  return 0;
}

- (BOOL)isIntersection
{
  if (self->_foundRoads)
  {
    if (self->_isOverpass) {
      return 1;
    }
  }
  else
  {
    [(VKLabelNavJunction *)self findRoads];
    if (self->_isOverpass) {
      return 1;
    }
  }
  return (unint64_t)[(NSMutableArray *)self->_roads count] > 2;
}

- (BOOL)isOnRoute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incomingRoad);
  if (WeakRetained)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)&self->_outgoingRoad);
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)isRoadTerminus
{
  if (self->_foundRoads)
  {
    if (self->_geoJunction) {
      return [(NSMutableArray *)self->_roads count] == 1;
    }
  }
  else
  {
    [(VKLabelNavJunction *)self findRoads];
    if (self->_geoJunction) {
      return [(NSMutableArray *)self->_roads count] == 1;
    }
  }
  return 0;
}

- (BOOL)isTileEdgeJunction
{
  if (self->_isRouteRefineJunction) {
    return 0;
  }
  if (self->_geoJunction) {
    return 0;
  }
  v3.i64[0] = (uint64_t)self->_tileCoordinate;
  v3.i64[1] = v3.i64[0];
  v4.i32[0] = vmovn_s32(vcgtq_f32(v3, (float32x4_t)xmmword_1A28FF640)).u32[0];
  v4.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_1A28FF640, v3)).i32[1];
  return vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v4, 0xFuLL))) & 1;
}

- (void)setRouteOffset:(PolylineCoordinate)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_routeOffset.index != a3.index || vabds_f32(a3.offset, self->_routeOffset.offset) >= 0.00000011921)
  {
    self->_routeOffset = a3;
    self->_sortValue = a3.offset + (double)a3.index;
    roads = self->_roads;
    if (roads)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      id v5 = roads;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v10;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "setRouteOffset:", a3, (void)v9);
          }
          uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

- (BOOL)matchesLocationForJunction:(id)a3
{
  int16x4_t v4 = (VKLabelNavJunction *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (self->_tile.__ptr_ == *(LabelTile **)[(VKLabelNavJunction *)v4 tile])
  {
    [(VKLabelNavJunction *)v5 tileCoordinate];
    BOOL v6 = *(void *)&self->_tileCoordinate == __PAIR64__(v8, v7);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  float32x4_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"VKLabelNavJunction "];
  int16x4_t v4 = [(VKLabelNavJunction *)self roads];
  [v3 appendFormat:@"roads:%@", v4];

  return v3;
}

- (void)dealloc
{
  [(VKLabelNavRoadLabel *)self->_junctionSign setNavFeature:0];
  v3.receiver = self;
  v3.super_class = (Class)VKLabelNavJunction;
  [(VKLabelNavJunction *)&v3 dealloc];
}

- (VKLabelNavJunction)initWithRoadEdge:(const GeoCodecsRoadEdge *)a3 atA:(BOOL)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6
{
  BOOL v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VKLabelNavJunction;
  long long v10 = [(VKLabelNavJunction *)&v30 init];
  long long v11 = v10;
  if (v10)
  {
    uint64_t v13 = *(LabelTile **)a6;
    uint64_t v12 = *((void *)a6 + 1);
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v10->_tile.__cntrl_;
    v10->_tile.__ptr_ = v13;
    v10->_tile.__cntrl_ = (__shared_weak_count *)v12;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v11->_routeOffset = a5;
    float v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    roads = v11->_roads;
    v11->_roads = v15;

    v11->_sortValue = a5.offset + (double)a5.index;
    v11->_preferredLabelPlacement = 0;
    v11->_foundRoads = 1;
    long long v17 = *(_OWORD *)&a3->var2;
    *(_OWORD *)char v29 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v29[16] = v17;
    *(_OWORD *)&v29[32] = *(_OWORD *)&a3->var4;
    *(void *)&v29[48] = a3->var6;
    if (*(void *)v29)
    {
      if (!v8)
      {
        *(int8x16_t *)&v29[8] = vextq_s8(*(int8x16_t *)&v29[8], *(int8x16_t *)&v29[8], 8uLL);
        *(int8x16_t *)&v29[24] = vextq_s8(*(int8x16_t *)&v29[24], *(int8x16_t *)&v29[24], 8uLL);
        *(int8x16_t *)&v29[40] = vextq_s8(*(int8x16_t *)&v29[40], *(int8x16_t *)&v29[40], 8uLL);
      }
      long long v18 = [[VKLabelNavRoad alloc] initWithRoadEdge:v29 navJunctionA:v11 routeOffset:a5 tile:a6];
      if (v18) {
        [(NSMutableArray *)v11->_roads addObject:v18];
      }
    }
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    long long v19 = geo::codec::multiSectionFeaturePointsWithElevation(a3->var0, 0, &v27, &v28);
    uint64_t v20 = 16;
    if (v8) {
      uint64_t v20 = 8;
    }
    uint64_t v21 = *(uint64_t *)((char *)&a3->var0 + v20);
    uint64_t v22 = (float *)&v19[v21];
    v11->_tileCoordinate._e[0] = *v22;
    v11->_tileCoordinate._e[1] = v22[1];
    float64x2_t v23 = vmlaq_f64(*(float64x2_t *)((char *)v11->_tile.__ptr_ + 312), vcvtq_f64_f32((float32x2_t)v11->_tileCoordinate), vsubq_f64(*(float64x2_t *)((char *)v11->_tile.__ptr_ + 328), *(float64x2_t *)((char *)v11->_tile.__ptr_ + 312)));
    if (v27) {
      double v24 = *(float *)(v27 + 4 * v21);
    }
    else {
      double v24 = 0.0;
    }
    *(float64x2_t *)v11->_mercatorCoordinate._e = v23;
    v11->_mercatorCoordinate._e[2] = v24;
    float v25 = v11;
  }

  return v11;
}

- (VKLabelNavJunction)initWithGEOJunction:(GeoCodecsConnectivityJunction *)a3 routeOffset:(PolylineCoordinate)a4 tile:(const void *)a5
{
  v36.receiver = self;
  v36.super_class = (Class)VKLabelNavJunction;
  BOOL v8 = [(VKLabelNavJunction *)&v36 init];
  long long v9 = v8;
  if (v8)
  {
    long long v10 = *(LabelTile **)a5;
    uint64_t v11 = *((void *)a5 + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v8->_tile.__cntrl_;
    v8->_tile.__ptr_ = v10;
    v8->_tile.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v9->_geoJunction = a3;
    v9->_routeOffset = a4;
    v9->_sortValue = a4.offset + (double)a4.index;
    v9->_preferredLabelPlacement = 0;
    v9->_depthFromRoute = -1;
    v9->_largestRoadClass = 8;
    uint64_t v13 = *((void *)v9->_tile.__ptr_ + 3);
    float v15 = *(geo::codec::VectorTile **)v13;
    uint64_t v14 = *(std::__shared_weak_count **)(v13 + 8);
    v35[1] = *(void *)v13;
    v35[2] = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v16 = geo::codec::VectorTile::junctions(v15);
    uint64_t v17 = geo::codec::VectorTile::overpasses(v15);
    geoJunction = v9->_geoJunction;
    if (v16) {
      BOOL v19 = v17 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19) {
      v9->_isOverpass = *(_WORD *)(v17 + (((uint64_t)geoJunction - v16) >> 4)) != 0;
    }
    if (geoJunction)
    {
      if (!geoJunction->var0) {
        goto LABEL_20;
      }
      uint64_t v20 = geo::codec::VectorTile::pointsOnRoad(v15);
      uint64_t var1 = v9->_geoJunction->var1;
      uint64_t v22 = geo::codec::VectorTile::lines(v15);
      float64x2_t v23 = (unsigned int *)(v20 + 16 * var1);
      double v24 = (void *)(v22 + 168 * v23[1]);
      uint64_t v34 = 0;
      v35[0] = 0;
      float v25 = geo::codec::multiSectionFeaturePointsWithElevation(v24, v23[2], &v34, v35);
      uint64_t v26 = v23[3];
      uint64_t v27 = (float *)&v25[v26];
      v9->_tileCoordinate._e[0] = *v27;
      v9->_tileCoordinate._e[1] = v27[1];
      float64x2_t v28 = vmlaq_f64(*(float64x2_t *)((char *)v9->_tile.__ptr_ + 312), vcvtq_f64_f32((float32x2_t)v9->_tileCoordinate), vsubq_f64(*(float64x2_t *)((char *)v9->_tile.__ptr_ + 328), *(float64x2_t *)((char *)v9->_tile.__ptr_ + 312)));
      double v29 = v34 ? *(float *)(v34 + 4 * v26) : 0.0;
      *(float64x2_t *)v9->_mercatorCoordinate._e = v28;
      v9->_mercatorCoordinate._e[2] = v29;
      geoJunction = v9->_geoJunction;
      if (geoJunction)
      {
LABEL_20:
        var2 = geoJunction->var2;
        if (var2 && *((unsigned char *)var2 + 73))
        {
          v9->_labelFeature = var2;
          uint64_t v31 = [[NSString alloc] initWithUTF8String:*((void *)v9->_labelFeature + 2)];
          name = v9->_name;
          v9->_name = (NSString *)v31;
        }
      }
    }
    if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return v9;
}

@end