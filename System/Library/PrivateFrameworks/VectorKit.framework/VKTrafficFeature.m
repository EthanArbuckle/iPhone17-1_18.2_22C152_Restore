@interface VKTrafficFeature
+ (id)newTrafficFeatureForEnrouteNotice:(id)a3 onRoute:(id)a4;
+ (id)stringForFeatureType:(int64_t)a3;
+ (id)stringForNavState:(int64_t)a3;
- ($1AB5FA073B851C12C2339EC22442E995)position;
- (BOOL)isAheadButNotApproaching;
- (BOOL)isApproaching;
- (BOOL)isBehind;
- (BOOL)isCamera;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGrouped;
- (BOOL)isIncident;
- (BOOL)isRouteAnnotation;
- (BOOL)isSignal;
- (BOOL)isUserReportedIncident;
- (BOOL)shouldUpdateStyle;
- (GEOFeatureStyleAttributes)styleAttributes;
- (Mercator3<double>)mercatorPoint;
- (NSString)uniqueIdentifier;
- (PolylineCoordinate)approachingRouteOffset;
- (PolylineCoordinate)routeOffset;
- (VKTrafficFeature)initWithEnrouteNotice:(id)a3 onRoute:(id)a4;
- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 direction:(double)a6 routeOffset:(PolylineCoordinate)a7 routeOffsetInMeters:(double)a8;
- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 onRoute:(id)a6;
- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6;
- (double)facingAzimuth;
- (double)routeOffsetInMeters;
- (float)maxZoom;
- (float)minZoom;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (int)groupIdentifier;
- (int64_t)navigationState;
- (int64_t)trafficFeatureType;
- (optional<gss::RouteLegWhen>)routeLegWhen;
- (unsigned)collisionPriority;
- (unsigned)groupItemHorizontalDisplayOrder;
- (unsigned)groupItemVerticalDisplayOrder;
- (vector<GeoCodecsFeatureStylePair,)attributes;
- (void)populateDebugNode:(void *)a3;
- (void)setNavigationState:(int64_t)a3;
- (void)setRouteLegWhen:(optional<gss::RouteLegWhen>)a3;
- (void)setShouldUpdateStyle:(BOOL)a3;
- (void)updateNavigationStateForRouteUserOffset:(const PolylineCoordinate *)a3;
@end

@implementation VKTrafficFeature

- (id).cxx_construct
{
  *((void *)self + 12) = 0xBF80000000000000;
  *((void *)self + 13) = 0xBF80000000000000;
  *((unsigned char *)self + 153) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (*(&self->_shouldUpdateStyle + 1)) {
    *(&self->_shouldUpdateStyle + 1) = 0;
  }
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (double)facingAzimuth
{
  return self->_facingAzimuth;
}

- (void)setRouteLegWhen:(optional<gss::RouteLegWhen>)a3
{
  int v3 = *((unsigned __int8 *)&self->_shouldUpdateStyle + 1);
  if (**(unsigned char **)&a3._hasValue)
  {
    *(&self->_shouldUpdateStyle + 2) = *(unsigned char *)(*(void *)&a3._hasValue + 1);
    if (!v3) {
      *(&self->_shouldUpdateStyle + 1) = 1;
    }
  }
  else if (*(&self->_shouldUpdateStyle + 1))
  {
    *(&self->_shouldUpdateStyle + 1) = 0;
  }
}

- (optional<gss::RouteLegWhen>)routeLegWhen
{
  unsigned char *v2 = 0;
  if (*(&self->_shouldUpdateStyle + 1))
  {
    v2[1] = *(&self->_shouldUpdateStyle + 2);
    unsigned char *v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (double)routeOffsetInMeters
{
  return self->_routeOffsetInMeters;
}

- (void)setShouldUpdateStyle:(BOOL)a3
{
  self->_shouldUpdateStyle = a3;
}

- (BOOL)shouldUpdateStyle
{
  return self->_shouldUpdateStyle;
}

- (unsigned)groupItemHorizontalDisplayOrder
{
  return self->_groupItemHorizontalDisplayOrder;
}

- (unsigned)groupItemVerticalDisplayOrder
{
  return self->_groupItemVerticalDisplayOrder;
}

- (int)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unsigned)collisionPriority
{
  return self->_collisionPriority;
}

- (PolylineCoordinate)approachingRouteOffset
{
  return self->_approachingRouteOffset;
}

- (void)setNavigationState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)navigationState
{
  return self->_state;
}

- (int64_t)trafficFeatureType
{
  return self->_trafficFeatureType;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- ($1AB5FA073B851C12C2339EC22442E995)position
{
  double latitude = self->_position.latitude;
  double longitude = self->_position.longitude;
  double altitude = self->_position.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (float)maxZoom
{
  return self->_maxZoom;
}

- (float)minZoom
{
  return self->_minZoom;
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (void)populateDebugNode:(void *)a3
{
  v64[23] = 9;
  strcpy(v64, "Identifer");
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v6 = [(NSString *)uniqueIdentifier UTF8String];
    memset(&v62, 0, sizeof(v62));
    int v63 = 4;
    if (v6)
    {
      std::string::__assign_external(&v62, v6);
    }
    else
    {
      *((unsigned char *)&v62.__r_.__value_.__s + 23) = 6;
      qmemcpy(&v62, "<null>", 6);
    }
  }
  else
  {
    memset(&v62, 0, sizeof(v62));
    int v63 = 4;
    std::string::__assign_external(&v62, "");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v61);
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v62.__r_.__value_.__l.__data_);
  }
  int64_t trafficFeatureType = self->_trafficFeatureType;
  v64[23] = 4;
  strcpy(v64, "Type");
  id v8 = +[VKTrafficFeature stringForFeatureType:trafficFeatureType];
  v9 = (const std::string::value_type *)[v8 UTF8String];
  memset(&v59, 0, sizeof(v59));
  int v60 = 4;
  if (v9)
  {
    std::string::__assign_external(&v59, v9);
  }
  else
  {
    *((unsigned char *)&v59.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v59, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v58);
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v59.__r_.__value_.__l.__data_);
  }

  uint64_t index = self->_routeOffset.index;
  float offset = self->_routeOffset.offset;
  v64[23] = 11;
  strcpy(v64, "RouteOffset");
  double v12 = offset;
  v13 = (char *)operator new(0x80uLL);
  v56 = v13 + 128;
  v57 = v13 + 128;
  *((void *)v13 + 1) = index;
  *((void *)v13 + 5) = 0;
  *((void *)v13 + 6) = 0;
  *((void *)v13 + 4) = 0;
  *((_DWORD *)v13 + 14) = 1;
  *((double *)v13 + 10) = v12;
  *((void *)v13 + 12) = 0;
  *((void *)v13 + 13) = 0;
  *((void *)v13 + 14) = 0;
  *((_DWORD *)v13 + 30) = 2;
  v55 = v13;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t *)&v55);
  if (v13[119] < 0)
  {
    operator delete(*((void **)v13 + 12));
    if ((v13[55] & 0x80000000) == 0) {
      goto LABEL_15;
    }
  }
  else if ((v13[55] & 0x80000000) == 0)
  {
    goto LABEL_15;
  }
  operator delete(*((void **)v13 + 4));
LABEL_15:
  operator delete(v13);
  double routeOffsetInMeters = self->_routeOffsetInMeters;
  v64[23] = 19;
  strcpy(v64, "RouteOffsetInMeters");
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v51 = 0;
  int v54 = 2;
  double v50 = routeOffsetInMeters;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v49);
  if ([(VKTrafficFeature *)self isGrouped])
  {
    v64[23] = 15;
    strcpy(v64, "GroupIdentifier");
    uint64_t groupIdentifier = self->_groupIdentifier;
    int v48 = 0;
    memset(&v47[4], 0, 24);
    v47[0] = groupIdentifier;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v47);
    v16 = (char *)operator new(0x20uLL);
    *(void *)v64 = v16;
    *(_OWORD *)&v64[8] = xmmword_1A28FCDC0;
    strcpy(v16, "GroupItemVerticalDisplayOrder");
    uint64_t groupItemVerticalDisplayOrder = self->_groupItemVerticalDisplayOrder;
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    int v46 = 1;
    uint64_t v43 = 0;
    uint64_t v42 = groupItemVerticalDisplayOrder;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v41);
    operator delete(v16);
    v18 = (char *)operator new(0x20uLL);
    *(void *)v64 = v18;
    *(_OWORD *)&v64[8] = xmmword_1A28FD670;
    strcpy(v18, "GroupItemHorizontalDisplayOrder");
    uint64_t groupItemHorizontalDisplayOrder = self->_groupItemHorizontalDisplayOrder;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    int v40 = 1;
    uint64_t v37 = 0;
    uint64_t v36 = groupItemHorizontalDisplayOrder;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v35);
    operator delete(v18);
  }
  v64[23] = 17;
  strcpy(v64, "CollisionPriority");
  uint64_t collisionPriority = self->_collisionPriority;
  int v34 = 0;
  memset(&v33[4], 0, 24);
  v33[0] = collisionPriority;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v33);
  int64_t state = self->_state;
  v64[23] = 15;
  strcpy(v64, "NavigationState");
  id v22 = +[VKTrafficFeature stringForNavState:state];
  v23 = (const std::string::value_type *)[v22 UTF8String];
  memset(&__p, 0, sizeof(__p));
  int v32 = 4;
  if (v23)
  {
    std::string::__assign_external(&__p, v23);
  }
  else
  {
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v30);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  double x = self->_worldPoint.x;
  double y = self->_worldPoint.y;
  v64[23] = 13;
  strcpy(v64, "WorldPosition");
  v56 = 0;
  v26 = (char *)operator new(0x80uLL);
  v56 = v26 + 128;
  v57 = v26 + 128;
  *((double *)v26 + 2) = x;
  *((void *)v26 + 5) = 0;
  *((void *)v26 + 6) = 0;
  *((void *)v26 + 4) = 0;
  *((_DWORD *)v26 + 14) = 2;
  *((void *)v26 + 12) = 0;
  *((double *)v26 + 10) = y;
  *((void *)v26 + 13) = 0;
  *((void *)v26 + 14) = 0;
  *((_DWORD *)v26 + 30) = 2;
  v55 = v26;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t *)&v55);
  if (v26[119] < 0)
  {
    operator delete(*((void **)v26 + 12));
    if ((v26[55] & 0x80000000) == 0) {
      goto LABEL_26;
    }
  }
  else if ((v26[55] & 0x80000000) == 0)
  {
    goto LABEL_26;
  }
  operator delete(*((void **)v26 + 4));
LABEL_26:
  operator delete(v26);
  double latitude = self->_position.latitude;
  double longitude = self->_position.longitude;
  v64[23] = 14;
  strcpy(v64, "LatLngPosition");
  v29 = (char *)operator new(0x80uLL);
  v56 = v29 + 128;
  v57 = v29 + 128;
  *((double *)v29 + 2) = latitude;
  *((void *)v29 + 5) = 0;
  *((void *)v29 + 6) = 0;
  *((void *)v29 + 4) = 0;
  *((_DWORD *)v29 + 14) = 2;
  *((void *)v29 + 12) = 0;
  *((double *)v29 + 10) = longitude;
  *((void *)v29 + 13) = 0;
  *((void *)v29 + 14) = 0;
  *((_DWORD *)v29 + 30) = 2;
  v55 = v29;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t *)&v55);
  if (v29[119] < 0)
  {
    operator delete(*((void **)v29 + 12));
    if ((v29[55] & 0x80000000) == 0) {
      goto LABEL_28;
    }
LABEL_32:
    operator delete(*((void **)v29 + 4));
    goto LABEL_28;
  }
  if (v29[55] < 0) {
    goto LABEL_32;
  }
LABEL_28:
  operator delete(v29);
}

- (void)updateNavigationStateForRouteUserOffset:(const PolylineCoordinate *)a3
{
  PolylineCoordinate v5 = [(VKTrafficFeature *)self routeOffset];
  unsigned int index = a3->index;
  if (a3->index < v5.index || (index == v5.index ? (BOOL v7 = a3->offset <= v5.offset) : (BOOL v7 = 0), v7))
  {
    unsigned int v9 = self->_approachingRouteOffset.index;
    if ((v9 != *MEMORY[0x1E4F64198]
       || vabds_f32(self->_approachingRouteOffset.offset, *(float *)(MEMORY[0x1E4F64198] + 4)) >= 0.00000011921)
      && (index > v9 || index == v9 && a3->offset > self->_approachingRouteOffset.offset))
    {
      int64_t v8 = 2;
    }
    else
    {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = 4;
  }
  self->_int64_t state = v8;
}

- (vector<GeoCodecsFeatureStylePair,)attributes
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  {
    operator new();
  }
  uint64_t v5 = mdm::Allocator::instance(void)::alloc;
  retstr->var2.var1.var0 = (Allocator *)mdm::Allocator::instance(void)::alloc;
  var1 = retstr->var1;
  var0 = retstr->var2.var0;
  if (var1 < var0)
  {
    if (var1) {
      GeoCodecsFeatureStylePair *var1 = (GeoCodecsFeatureStylePair)0x300000005;
    }
    int64_t v8 = var1 + 1;
    goto LABEL_29;
  }
  uint64_t v9 = var1 - retstr->var0;
  unint64_t v10 = v9 + 1;
  if ((unint64_t)(v9 + 1) >> 61) {
    abort();
  }
  uint64_t v11 = (char *)var0 - (char *)retstr->var0;
  if (v11 >> 2 > v10) {
    unint64_t v10 = v11 >> 2;
  }
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v5 + 16))(v5, 8 * v12, 4);
    v14 = (GeoCodecsFeatureStylePair *)(v13 + 8 * v9);
    v15 = (GeoCodecsFeatureStylePair *)(v13 + 8 * v12);
    if (v13) {
      GeoCodecsFeatureStylePair *v14 = (GeoCodecsFeatureStylePair)0x300000005;
    }
  }
  else
  {
    v15 = 0;
    v14 = (GeoCodecsFeatureStylePair *)(8 * v9);
  }
  int64_t v8 = v14 + 1;
  v17 = retstr->var0;
  v16 = retstr->var1;
  if (v16 != retstr->var0)
  {
    unint64_t v18 = (char *)v16 - (char *)retstr->var0 - 8;
    if (v18 < 0x38)
    {
      v20 = retstr->var1;
    }
    else if ((unint64_t)((char *)v16 - (char *)v14) < 0x20)
    {
      v20 = retstr->var1;
    }
    else
    {
      uint64_t v19 = (v18 >> 3) + 1;
      v20 = &v16[-(v19 & 0x3FFFFFFFFFFFFFFCLL)];
      v21 = v14 - 2;
      id v22 = v16 - 2;
      uint64_t v23 = v19 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v24 = *(_OWORD *)&v22->var0;
        *(_OWORD *)&v21[-2].var0 = *(_OWORD *)&v22[-2].var0;
        *(_OWORD *)&v21->var0 = v24;
        v21 -= 4;
        v22 -= 4;
        v23 -= 4;
      }
      while (v23);
      v14 -= v19 & 0x3FFFFFFFFFFFFFFCLL;
      if (v19 == (v19 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_26;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v25 = v20[-1];
      --v20;
      v14[-1] = v25;
      --v14;
    }
    while (v20 != v17);
LABEL_26:
    v16 = retstr->var0;
  }
  retstr->var0 = v14;
  retstr->var1 = v8;
  v26 = retstr->var2.var0;
  retstr->var2.var0 = v15;
  if (v16) {
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
  }
                                                                                     + 40))(retstr->var2.var1.var0, v16, (char *)v26 - (char *)v16);
LABEL_29:
  retstr->var1 = v8;
  if ([(VKTrafficFeature *)self navigationState])
  {
    unint64_t v27 = [(VKTrafficFeature *)self navigationState];
    if (v27 > 4) {
      uint64_t v28 = -4294901751;
    }
    else {
      uint64_t v28 = qword_1A29C65E0[v27];
    }
    v29 = retstr->var1;
    v30 = retstr->var2.var0;
    if (v29 < v30)
    {
      if (v29) {
        GeoCodecsFeatureStylePair *v29 = (GeoCodecsFeatureStylePair)v28;
      }
      v31 = v29 + 1;
LABEL_60:
      retstr->var1 = v31;
      goto LABEL_61;
    }
    uint64_t v32 = v29 - retstr->var0;
    unint64_t v33 = v32 + 1;
    if ((unint64_t)(v32 + 1) >> 61) {
      abort();
    }
    uint64_t v34 = (char *)v30 - (char *)retstr->var0;
    if (v34 >> 2 > v33) {
      unint64_t v33 = v34 >> 2;
    }
    if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
      uint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v35 = v33;
    }
    if (v35)
    {
      uint64_t v36 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v35, 4);
      uint64_t v37 = (GeoCodecsFeatureStylePair *)(v36 + 8 * v32);
      uint64_t v38 = (GeoCodecsFeatureStylePair *)(v36 + 8 * v35);
      if (v36) {
        *uint64_t v37 = (GeoCodecsFeatureStylePair)v28;
      }
    }
    else
    {
      uint64_t v38 = 0;
      uint64_t v37 = (GeoCodecsFeatureStylePair *)(8 * v32);
    }
    v31 = v37 + 1;
    int v40 = retstr->var0;
    uint64_t v39 = retstr->var1;
    if (v39 == retstr->var0)
    {
LABEL_58:
      retstr->var0 = v37;
      retstr->var1 = v31;
      v49 = retstr->var2.var0;
      retstr->var2.var0 = v38;
      if (v39) {
        (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
      }
                                                                                         + 40))(retstr->var2.var1.var0, v39, (char *)v49 - (char *)v39);
      goto LABEL_60;
    }
    unint64_t v41 = (char *)v39 - (char *)retstr->var0 - 8;
    if (v41 < 0x38)
    {
      uint64_t v43 = retstr->var1;
    }
    else if ((unint64_t)((char *)v39 - (char *)v37) < 0x20)
    {
      uint64_t v43 = retstr->var1;
    }
    else
    {
      uint64_t v42 = (v41 >> 3) + 1;
      uint64_t v43 = &v39[-(v42 & 0x3FFFFFFFFFFFFFFCLL)];
      uint64_t v44 = v37 - 2;
      uint64_t v45 = v39 - 2;
      uint64_t v46 = v42 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v47 = *(_OWORD *)&v45->var0;
        *(_OWORD *)&v44[-2].var0 = *(_OWORD *)&v45[-2].var0;
        *(_OWORD *)&v44->var0 = v47;
        v44 -= 4;
        v45 -= 4;
        v46 -= 4;
      }
      while (v46);
      v37 -= v42 & 0x3FFFFFFFFFFFFFFCLL;
      if (v42 == (v42 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_57;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v48 = v43[-1];
      --v43;
      v37[-1] = v48;
      --v37;
    }
    while (v43 != v40);
LABEL_57:
    uint64_t v39 = retstr->var0;
    goto LABEL_58;
  }
LABEL_61:
  switch(self->_trafficFeatureType)
  {
    case 1:
      double v50 = self;
      uint64_t v51 = retstr->var1;
      uint64_t v52 = retstr->var2.var0;
      if (v51 < v52)
      {
        if (v51) {
          *uint64_t v51 = (GeoCodecsFeatureStylePair)0xF800000006;
        }
        uint64_t v53 = v51 + 1;
        goto LABEL_186;
      }
      uint64_t v99 = v51 - retstr->var0;
      unint64_t v100 = v99 + 1;
      if ((unint64_t)(v99 + 1) >> 61) {
        abort();
      }
      uint64_t v101 = (char *)v52 - (char *)retstr->var0;
      if (v101 >> 2 > v100) {
        unint64_t v100 = v101 >> 2;
      }
      if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF8) {
        uint64_t v102 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v102 = v100;
      }
      if (v102)
      {
        uint64_t v103 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v102, 4);
        v104 = (GeoCodecsFeatureStylePair *)(v103 + 8 * v99);
        v105 = (GeoCodecsFeatureStylePair *)(v103 + 8 * v102);
        if (v103) {
          GeoCodecsFeatureStylePair *v104 = (GeoCodecsFeatureStylePair)0xF800000006;
        }
      }
      else
      {
        v105 = 0;
        v104 = (GeoCodecsFeatureStylePair *)(8 * v99);
      }
      uint64_t v53 = v104 + 1;
      v128 = retstr->var0;
      v127 = retstr->var1;
      if (v127 == retstr->var0) {
        goto LABEL_184;
      }
      unint64_t v129 = (char *)v127 - (char *)retstr->var0 - 8;
      if (v129 < 0x38)
      {
        v131 = retstr->var1;
      }
      else if ((unint64_t)((char *)v127 - (char *)v104) < 0x20)
      {
        v131 = retstr->var1;
      }
      else
      {
        uint64_t v130 = (v129 >> 3) + 1;
        v131 = &v127[-(v130 & 0x3FFFFFFFFFFFFFFCLL)];
        v132 = v104 - 2;
        v133 = v127 - 2;
        uint64_t v134 = v130 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v135 = *(_OWORD *)&v133->var0;
          *(_OWORD *)&v132[-2].var0 = *(_OWORD *)&v133[-2].var0;
          *(_OWORD *)&v132->var0 = v135;
          v132 -= 4;
          v133 -= 4;
          v134 -= 4;
        }
        while (v134);
        v104 -= v130 & 0x3FFFFFFFFFFFFFFCLL;
        if (v130 == (v130 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_183:
          v127 = retstr->var0;
LABEL_184:
          retstr->var0 = v104;
          retstr->var1 = v53;
          v165 = retstr->var2.var0;
          retstr->var2.var0 = v105;
          if (v127) {
            (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
          }
                                                                                             + 40))(retstr->var2.var1.var0, v127, (char *)v165 - (char *)v127);
LABEL_186:
          retstr->var1 = v53;
          uint64_t v166 = [(VKTrafficFeature *)v50 type];
          int v167 = [(VKTrafficFeature *)v50 isAboveSpeedThreshold];
          uint64_t v168 = 0;
          switch(v166)
          {
            case 0:
              break;
            case 1:
              if (v167) {
                uint64_t v168 = 1;
              }
              else {
                uint64_t v168 = 2;
              }
              break;
            case 2:
              uint64_t v168 = 3;
              break;
            case 3:
              uint64_t v168 = 4;
              break;
            case 4:
              uint64_t v168 = 5;
              break;
            case 5:
              uint64_t v168 = 6;
              break;
            case 6:
              uint64_t v168 = 7;
              break;
            default:
              uint64_t v168 = 0xFFFFFFFFLL;
              break;
          }
          v169 = retstr->var1;
          v170 = retstr->var2.var0;
          if (v169 < v170)
          {
            if (v169) {
              GeoCodecsFeatureStylePair *v169 = (GeoCodecsFeatureStylePair)(((v168 << 32) | 0x10008) + 58);
            }
            v171 = v169 + 1;
            goto LABEL_277;
          }
          uint64_t v172 = v169 - retstr->var0;
          unint64_t v173 = v172 + 1;
          if ((unint64_t)(v172 + 1) >> 61) {
            abort();
          }
          uint64_t v174 = (char *)v170 - (char *)retstr->var0;
          if (v174 >> 2 > v173) {
            unint64_t v173 = v174 >> 2;
          }
          if ((unint64_t)v174 >= 0x7FFFFFFFFFFFFFF8) {
            uint64_t v175 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v175 = v173;
          }
          if (v175)
          {
            uint64_t v176 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v175, 4);
            v177 = (GeoCodecsFeatureStylePair *)(v176 + 8 * v172);
            v178 = (GeoCodecsFeatureStylePair *)(v176 + 8 * v175);
            if (v176) {
              GeoCodecsFeatureStylePair *v177 = (GeoCodecsFeatureStylePair)(((v168 << 32) | 0x10008) + 58);
            }
          }
          else
          {
            v178 = 0;
            v177 = (GeoCodecsFeatureStylePair *)(8 * v172);
          }
          v171 = v177 + 1;
          v180 = retstr->var0;
          v179 = retstr->var1;
          if (v179 == retstr->var0)
          {
LABEL_275:
            retstr->var0 = v177;
            retstr->var1 = v171;
            v223 = retstr->var2.var0;
            retstr->var2.var0 = v178;
            if (v179) {
              (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
            }
                                                                                               + 40))(retstr->var2.var1.var0, v179, (char *)v223 - (char *)v179);
LABEL_277:
            retstr->var1 = v171;
            if (![(VKTrafficFeature *)v50 hasCountryCode]) {
              goto LABEL_315;
            }
            uint64_t v206 = [(VKTrafficFeature *)v50 countryCode];
            v96 = retstr->var1;
            v224 = retstr->var2.var0;
            if (v96 < v224)
            {
LABEL_279:
              if (v96)
              {
                uint64_t v98 = (v206 << 32) | 4;
                goto LABEL_281;
              }
              goto LABEL_282;
            }
            uint64_t v225 = v96 - retstr->var0;
            unint64_t v226 = v225 + 1;
            if ((unint64_t)(v225 + 1) >> 61) {
              abort();
            }
            uint64_t v227 = (char *)v224 - (char *)retstr->var0;
            if (v227 >> 2 > v226) {
              unint64_t v226 = v227 >> 2;
            }
            if ((unint64_t)v227 >= 0x7FFFFFFFFFFFFFF8) {
              uint64_t v228 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v228 = v226;
            }
            if (v228)
            {
              uint64_t v229 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v228, 4);
              v125 = (GeoCodecsFeatureStylePair *)(v229 + 8 * v225);
              v126 = (GeoCodecsFeatureStylePair *)(v229 + 8 * v228);
              if (v229) {
                GeoCodecsFeatureStylePair *v125 = (GeoCodecsFeatureStylePair)((v206 << 32) | 4);
              }
            }
            else
            {
              v126 = 0;
              v125 = (GeoCodecsFeatureStylePair *)(8 * v225);
            }
            v154 = v125 + 1;
            v230 = retstr->var0;
            v155 = retstr->var1;
            if (v155 != retstr->var0)
            {
              unint64_t v231 = (char *)v155 - (char *)retstr->var0 - 8;
              if (v231 < 0x38)
              {
                v233 = retstr->var1;
              }
              else if ((unint64_t)((char *)v155 - (char *)v125) < 0x20)
              {
                v233 = retstr->var1;
              }
              else
              {
                uint64_t v232 = (v231 >> 3) + 1;
                v233 = &v155[-(v232 & 0x3FFFFFFFFFFFFFFCLL)];
                v234 = v125 - 2;
                v235 = v155 - 2;
                uint64_t v236 = v232 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  long long v237 = *(_OWORD *)&v235->var0;
                  *(_OWORD *)&v234[-2].var0 = *(_OWORD *)&v235[-2].var0;
                  *(_OWORD *)&v234->var0 = v237;
                  v234 -= 4;
                  v235 -= 4;
                  v236 -= 4;
                }
                while (v236);
                v125 -= v232 & 0x3FFFFFFFFFFFFFFCLL;
                if (v232 == (v232 & 0x3FFFFFFFFFFFFFFCLL)) {
                  goto LABEL_311;
                }
              }
              do
              {
                GeoCodecsFeatureStylePair v240 = v233[-1];
                --v233;
                v125[-1] = v240;
                --v125;
              }
              while (v233 != v230);
              goto LABEL_311;
            }
LABEL_312:
            retstr->var0 = v125;
            retstr->var1 = v154;
            v241 = retstr->var2.var0;
            retstr->var2.var0 = v126;
            if (v155) {
              (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
            }
                                                                                               + 40))(retstr->var2.var1.var0, v155, (char *)v241 - (char *)v155);
            goto LABEL_314;
          }
          unint64_t v181 = (char *)v179 - (char *)retstr->var0 - 8;
          if (v181 < 0x38)
          {
            v183 = retstr->var1;
          }
          else if ((unint64_t)((char *)v179 - (char *)v177) < 0x20)
          {
            v183 = retstr->var1;
          }
          else
          {
            uint64_t v182 = (v181 >> 3) + 1;
            v183 = &v179[-(v182 & 0x3FFFFFFFFFFFFFFCLL)];
            v184 = v177 - 2;
            v185 = v179 - 2;
            uint64_t v186 = v182 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v187 = *(_OWORD *)&v185->var0;
              *(_OWORD *)&v184[-2].var0 = *(_OWORD *)&v185[-2].var0;
              *(_OWORD *)&v184->var0 = v187;
              v184 -= 4;
              v185 -= 4;
              v186 -= 4;
            }
            while (v186);
            v177 -= v182 & 0x3FFFFFFFFFFFFFFCLL;
            if (v182 == (v182 & 0x3FFFFFFFFFFFFFFCLL)) {
              goto LABEL_274;
            }
          }
          do
          {
            GeoCodecsFeatureStylePair v222 = v183[-1];
            --v183;
            v177[-1] = v222;
            --v177;
          }
          while (v183 != v180);
LABEL_274:
          v179 = retstr->var0;
          goto LABEL_275;
        }
      }
      do
      {
        GeoCodecsFeatureStylePair v164 = v131[-1];
        --v131;
        v104[-1] = v164;
        --v104;
      }
      while (v131 != v128);
      goto LABEL_183;
    case 2:
      v90 = self;
      unint64_t v91 = [(VKTrafficFeature *)v90 type];
      if (v91 >= 3) {
        uint64_t v92 = -4294901682;
      }
      else {
        uint64_t v92 = (v91 << 32) | 0x1004E;
      }
      v93 = retstr->var1;
      v94 = retstr->var2.var0;
      if (v93 < v94)
      {
        if (v93) {
          GeoCodecsFeatureStylePair *v93 = (GeoCodecsFeatureStylePair)v92;
        }
        v95 = v93 + 1;
        goto LABEL_248;
      }
      uint64_t v113 = v93 - retstr->var0;
      unint64_t v114 = v113 + 1;
      if ((unint64_t)(v113 + 1) >> 61) {
        abort();
      }
      uint64_t v115 = (char *)v94 - (char *)retstr->var0;
      if (v115 >> 2 > v114) {
        unint64_t v114 = v115 >> 2;
      }
      if ((unint64_t)v115 >= 0x7FFFFFFFFFFFFFF8) {
        uint64_t v116 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v116 = v114;
      }
      if (v116)
      {
        uint64_t v117 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v116, 4);
        v118 = (GeoCodecsFeatureStylePair *)(v117 + 8 * v113);
        v119 = (GeoCodecsFeatureStylePair *)(v117 + 8 * v116);
        if (v117) {
          GeoCodecsFeatureStylePair *v118 = (GeoCodecsFeatureStylePair)v92;
        }
      }
      else
      {
        v119 = 0;
        v118 = (GeoCodecsFeatureStylePair *)(8 * v113);
      }
      v95 = v118 + 1;
      v146 = retstr->var0;
      v145 = retstr->var1;
      if (v145 == retstr->var0) {
        goto LABEL_246;
      }
      unint64_t v147 = (char *)v145 - (char *)retstr->var0 - 8;
      if (v147 < 0x38)
      {
        v149 = retstr->var1;
        do
        {
LABEL_244:
          GeoCodecsFeatureStylePair v204 = v149[-1];
          --v149;
          v118[-1] = v204;
          --v118;
        }
        while (v149 != v146);
        goto LABEL_245;
      }
      if ((unint64_t)((char *)v145 - (char *)v118) < 0x20)
      {
        v149 = retstr->var1;
        goto LABEL_244;
      }
      uint64_t v148 = (v147 >> 3) + 1;
      v149 = &v145[-(v148 & 0x3FFFFFFFFFFFFFFCLL)];
      v150 = v118 - 2;
      v151 = v145 - 2;
      uint64_t v152 = v148 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v153 = *(_OWORD *)&v151->var0;
        *(_OWORD *)&v150[-2].var0 = *(_OWORD *)&v151[-2].var0;
        *(_OWORD *)&v150->var0 = v153;
        v150 -= 4;
        v151 -= 4;
        v152 -= 4;
      }
      while (v152);
      v118 -= v148 & 0x3FFFFFFFFFFFFFFCLL;
      if (v148 != (v148 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_244;
      }
LABEL_245:
      v145 = retstr->var0;
LABEL_246:
      retstr->var0 = v118;
      retstr->var1 = v95;
      v205 = retstr->var2.var0;
      retstr->var2.var0 = v119;
      if (v145) {
        (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
      }
                                                                                         + 40))(retstr->var2.var1.var0, v145, (char *)v205 - (char *)v145);
LABEL_248:
      retstr->var1 = v95;
      if ([(VKTrafficFeature *)v90 hasCountryCode])
      {
        uint64_t v206 = [(VKTrafficFeature *)v90 countryCode];
        v96 = retstr->var1;
        v207 = retstr->var2.var0;
        if (v96 < v207) {
          goto LABEL_279;
        }
        uint64_t v208 = v96 - retstr->var0;
        unint64_t v209 = v208 + 1;
        if ((unint64_t)(v208 + 1) >> 61) {
          abort();
        }
        uint64_t v210 = (char *)v207 - (char *)retstr->var0;
        if (v210 >> 2 > v209) {
          unint64_t v209 = v210 >> 2;
        }
        if ((unint64_t)v210 >= 0x7FFFFFFFFFFFFFF8) {
          uint64_t v211 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v211 = v209;
        }
        if (v211)
        {
          uint64_t v212 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v211, 4);
          v125 = (GeoCodecsFeatureStylePair *)(v212 + 8 * v208);
          v126 = (GeoCodecsFeatureStylePair *)(v212 + 8 * v211);
          if (v212) {
            GeoCodecsFeatureStylePair *v125 = (GeoCodecsFeatureStylePair)((v206 << 32) | 4);
          }
        }
        else
        {
          v126 = 0;
          v125 = (GeoCodecsFeatureStylePair *)(8 * v208);
        }
        v154 = v125 + 1;
        v213 = retstr->var0;
        v155 = retstr->var1;
        if (v155 == retstr->var0) {
          goto LABEL_312;
        }
        unint64_t v214 = (char *)v155 - (char *)retstr->var0 - 8;
        if (v214 < 0x38)
        {
          v216 = retstr->var1;
        }
        else if ((unint64_t)((char *)v155 - (char *)v125) < 0x20)
        {
          v216 = retstr->var1;
        }
        else
        {
          uint64_t v215 = (v214 >> 3) + 1;
          v216 = &v155[-(v215 & 0x3FFFFFFFFFFFFFFCLL)];
          v217 = v125 - 2;
          v218 = v155 - 2;
          uint64_t v219 = v215 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v220 = *(_OWORD *)&v218->var0;
            *(_OWORD *)&v217[-2].var0 = *(_OWORD *)&v218[-2].var0;
            *(_OWORD *)&v217->var0 = v220;
            v217 -= 4;
            v218 -= 4;
            v219 -= 4;
          }
          while (v219);
          v125 -= v215 & 0x3FFFFFFFFFFFFFFCLL;
          if (v215 == (v215 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_311;
          }
        }
        do
        {
          GeoCodecsFeatureStylePair v239 = v216[-1];
          --v216;
          v125[-1] = v239;
          --v125;
        }
        while (v216 != v213);
LABEL_311:
        v155 = retstr->var0;
        goto LABEL_312;
      }
LABEL_315:

LABEL_316:
      $1AB5FA073B851C12C2339EC22442E995 result = (vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *)[(VKTrafficFeature *)self routeLegWhen];
      if (v264)
      {
        $1AB5FA073B851C12C2339EC22442E995 result = (vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *)[(VKTrafficFeature *)self routeLegWhen];
        v243 = retstr->var1;
        v244 = retstr->var2.var0;
        if (v243 < v244)
        {
          if (v243) {
            GeoCodecsFeatureStylePair *v243 = (GeoCodecsFeatureStylePair)((((unint64_t)v263 << 32) | 0x10008) + 76);
          }
          v245 = v243 + 1;
LABEL_344:
          retstr->var1 = v245;
          return result;
        }
        uint64_t v246 = v243 - retstr->var0;
        unint64_t v247 = v246 + 1;
        if ((unint64_t)(v246 + 1) >> 61) {
          abort();
        }
        uint64_t v248 = (char *)v244 - (char *)retstr->var0;
        if (v248 >> 2 > v247) {
          unint64_t v247 = v248 >> 2;
        }
        if ((unint64_t)v248 >= 0x7FFFFFFFFFFFFFF8) {
          uint64_t v249 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v249 = v247;
        }
        if (v249)
        {
          $1AB5FA073B851C12C2339EC22442E995 result = (vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *)(*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v249, 4);
          v250 = (GeoCodecsFeatureStylePair *)&(&result->var0)[v246];
          v251 = (GeoCodecsFeatureStylePair *)&(&result->var0)[v249];
          if (result) {
            GeoCodecsFeatureStylePair *v250 = (GeoCodecsFeatureStylePair)((((unint64_t)v263 << 32) | 0x10008) + 76);
          }
        }
        else
        {
          v251 = 0;
          v250 = (GeoCodecsFeatureStylePair *)(8 * v246);
        }
        v245 = v250 + 1;
        v253 = retstr->var0;
        v252 = retstr->var1;
        if (v252 == retstr->var0)
        {
LABEL_342:
          retstr->var0 = v250;
          retstr->var1 = v245;
          v262 = retstr->var2.var0;
          retstr->var2.var0 = v251;
          if (v252) {
            $1AB5FA073B851C12C2339EC22442E995 result = (vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *)(*(uint64_t (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0 + 40))(retstr->var2.var1.var0, v252, (char *)v262 - (char *)v252);
          }
          goto LABEL_344;
        }
        unint64_t v254 = (char *)v252 - (char *)retstr->var0 - 8;
        if (v254 < 0x38)
        {
          v256 = retstr->var1;
        }
        else if ((unint64_t)((char *)v252 - (char *)v250) < 0x20)
        {
          v256 = retstr->var1;
        }
        else
        {
          uint64_t v255 = (v254 >> 3) + 1;
          v256 = &v252[-(v255 & 0x3FFFFFFFFFFFFFFCLL)];
          v257 = v250 - 2;
          v258 = v252 - 2;
          uint64_t v259 = v255 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v260 = *(_OWORD *)&v258->var0;
            *(_OWORD *)&v257[-2].var0 = *(_OWORD *)&v258[-2].var0;
            *(_OWORD *)&v257->var0 = v260;
            v257 -= 4;
            v258 -= 4;
            v259 -= 4;
          }
          while (v259);
          v250 -= v255 & 0x3FFFFFFFFFFFFFFCLL;
          if (v255 == (v255 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_341;
          }
        }
        do
        {
          GeoCodecsFeatureStylePair v261 = v256[-1];
          --v256;
          v250[-1] = v261;
          --v250;
        }
        while (v256 != v253);
LABEL_341:
        v252 = retstr->var0;
        goto LABEL_342;
      }
      return result;
    case 3:
      int v54 = self;
      unint64_t v55 = 0;
      while (2)
      {
        v57 = [(VKTrafficFeature *)v54 _originalStyleAttributes];
        unint64_t v58 = [v57 attributesCount];

        if (v55 >= v58)
        {
          v96 = retstr->var1;
          v97 = retstr->var2.var0;
          if (v96 < v97)
          {
            if (v96)
            {
              uint64_t v98 = 0x19C00000006;
LABEL_281:
              GeoCodecsFeatureStylePair *v96 = (GeoCodecsFeatureStylePair)v98;
            }
LABEL_282:
            v154 = v96 + 1;
            goto LABEL_314;
          }
          uint64_t v120 = v96 - retstr->var0;
          unint64_t v121 = v120 + 1;
          if ((unint64_t)(v120 + 1) >> 61) {
            abort();
          }
          uint64_t v122 = (char *)v97 - (char *)retstr->var0;
          if (v122 >> 2 > v121) {
            unint64_t v121 = v122 >> 2;
          }
          if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF8) {
            uint64_t v123 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v123 = v121;
          }
          if (v123)
          {
            uint64_t v124 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v123, 4);
            v125 = (GeoCodecsFeatureStylePair *)(v124 + 8 * v120);
            v126 = (GeoCodecsFeatureStylePair *)(v124 + 8 * v123);
            if (v124) {
              GeoCodecsFeatureStylePair *v125 = (GeoCodecsFeatureStylePair)0x19C00000006;
            }
          }
          else
          {
            v126 = 0;
            v125 = (GeoCodecsFeatureStylePair *)(8 * v120);
          }
          v154 = v125 + 1;
          v156 = retstr->var0;
          v155 = retstr->var1;
          if (v155 == retstr->var0) {
            goto LABEL_312;
          }
          unint64_t v157 = (char *)v155 - (char *)retstr->var0 - 8;
          if (v157 < 0x38)
          {
            v159 = retstr->var1;
          }
          else if ((unint64_t)((char *)v155 - (char *)v125) < 0x20)
          {
            v159 = retstr->var1;
          }
          else
          {
            uint64_t v158 = (v157 >> 3) + 1;
            v159 = &v155[-(v158 & 0x3FFFFFFFFFFFFFFCLL)];
            v160 = v125 - 2;
            v161 = v155 - 2;
            uint64_t v162 = v158 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v163 = *(_OWORD *)&v161->var0;
              *(_OWORD *)&v160[-2].var0 = *(_OWORD *)&v161[-2].var0;
              *(_OWORD *)&v160->var0 = v163;
              v160 -= 4;
              v161 -= 4;
              v162 -= 4;
            }
            while (v162);
            v125 -= v158 & 0x3FFFFFFFFFFFFFFCLL;
            if (v158 == (v158 & 0x3FFFFFFFFFFFFFFCLL)) {
              goto LABEL_311;
            }
          }
          do
          {
            GeoCodecsFeatureStylePair v238 = v159[-1];
            --v159;
            v125[-1] = v238;
            --v125;
          }
          while (v159 != v156);
          goto LABEL_311;
        }
        std::string v59 = [(VKTrafficFeature *)v54 _originalStyleAttributes];
        int v60 = [v59 attributeAtIndex:v55];

        unsigned int v61 = [v60 key];
        uint64_t v62 = [v60 value];
        uint64_t v63 = v62;
        v64 = retstr->var1;
        v65 = retstr->var2.var0;
        if (v64 < v65)
        {
          if (v64) {
            GeoCodecsFeatureStylePair *v64 = (GeoCodecsFeatureStylePair)(v61 | (unint64_t)(v62 << 32));
          }
          v56 = v64 + 1;
LABEL_68:
          retstr->var1 = v56;

          ++v55;
          continue;
        }
        break;
      }
      uint64_t v66 = v64 - retstr->var0;
      unint64_t v67 = v66 + 1;
      if ((unint64_t)(v66 + 1) >> 61) {
        abort();
      }
      uint64_t v68 = (char *)v65 - (char *)retstr->var0;
      if (v68 >> 2 > v67) {
        unint64_t v67 = v68 >> 2;
      }
      if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8) {
        uint64_t v69 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v69 = v67;
      }
      if (v69)
      {
        uint64_t v70 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v69, 4);
        uint64_t v71 = v70 + 8 * v66;
        v72 = (GeoCodecsFeatureStylePair *)(v70 + 8 * v69);
        if (v70) {
          *(void *)uint64_t v71 = v61 | (unint64_t)(v63 << 32);
        }
      }
      else
      {
        v72 = 0;
        uint64_t v71 = 8 * v66;
      }
      v74 = retstr->var0;
      v73 = retstr->var1;
      int64_t v75 = (char *)v73 - (char *)retstr->var0;
      if (v73 == retstr->var0)
      {
        v77 = (GeoCodecsFeatureStylePair *)v71;
        goto LABEL_94;
      }
      unint64_t v76 = v75 - 8;
      if ((unint64_t)(v75 - 8) < 0x38)
      {
        v77 = (GeoCodecsFeatureStylePair *)v71;
      }
      else
      {
        v77 = (GeoCodecsFeatureStylePair *)v71;
        if ((unint64_t)v73 - v71 >= 0x20)
        {
          uint64_t v78 = (v76 >> 3) + 1;
          v79 = (_OWORD *)(v71 - 16);
          v80 = v73 - 2;
          uint64_t v81 = v78 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v82 = *(_OWORD *)&v80->var0;
            *(v79 - 1) = *(_OWORD *)&v80[-2].var0;
            _OWORD *v79 = v82;
            v79 -= 2;
            v80 -= 4;
            v81 -= 4;
          }
          while (v81);
          v77 = (GeoCodecsFeatureStylePair *)(v71 - 8 * (v78 & 0x3FFFFFFFFFFFFFFCLL));
          v73 -= v78 & 0x3FFFFFFFFFFFFFFCLL;
          if (v78 == (v78 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_93;
          }
        }
      }
      do
      {
        GeoCodecsFeatureStylePair v83 = v73[-1];
        --v73;
        v77[-1] = v83;
        --v77;
      }
      while (v73 != v74);
LABEL_93:
      v73 = retstr->var0;
LABEL_94:
      v56 = (GeoCodecsFeatureStylePair *)(v71 + 8);
      retstr->var0 = v77;
      retstr->var1 = (GeoCodecsFeatureStylePair *)(v71 + 8);
      v84 = retstr->var2.var0;
      retstr->var2.var0 = v72;
      if (v73) {
        (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
      }
                                                                                         + 40))(retstr->var2.var1.var0, v73, (char *)v84 - (char *)v73);
      goto LABEL_68;
    case 4:
      unint64_t v85 = [(VKTrafficFeature *)self type];
      unint64_t v86 = v85;
      if (v85 < 0xF) {
        unint64_t v86 = dword_1A29C6608[v85];
      }
      v87 = retstr->var1;
      v88 = retstr->var2.var0;
      if (v87 < v88)
      {
        if (v87) {
          GeoCodecsFeatureStylePair *v87 = (GeoCodecsFeatureStylePair)((v86 << 32) | 0x10008);
        }
        v89 = v87 + 1;
        goto LABEL_224;
      }
      uint64_t v106 = v87 - retstr->var0;
      unint64_t v107 = v106 + 1;
      if ((unint64_t)(v106 + 1) >> 61) {
        abort();
      }
      uint64_t v108 = (char *)v88 - (char *)retstr->var0;
      if (v108 >> 2 > v107) {
        unint64_t v107 = v108 >> 2;
      }
      if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF8) {
        uint64_t v109 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v109 = v107;
      }
      if (v109)
      {
        uint64_t v110 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v109, 4);
        v111 = (GeoCodecsFeatureStylePair *)(v110 + 8 * v106);
        v112 = (GeoCodecsFeatureStylePair *)(v110 + 8 * v109);
        if (v110) {
          GeoCodecsFeatureStylePair *v111 = (GeoCodecsFeatureStylePair)((v86 << 32) | 0x10008);
        }
      }
      else
      {
        v112 = 0;
        v111 = (GeoCodecsFeatureStylePair *)(8 * v106);
      }
      v89 = v111 + 1;
      v137 = retstr->var0;
      v136 = retstr->var1;
      if (v136 == retstr->var0) {
        goto LABEL_222;
      }
      unint64_t v138 = (char *)v136 - (char *)retstr->var0 - 8;
      if (v138 < 0x38)
      {
        v140 = retstr->var1;
      }
      else if ((unint64_t)((char *)v136 - (char *)v111) < 0x20)
      {
        v140 = retstr->var1;
      }
      else
      {
        uint64_t v139 = (v138 >> 3) + 1;
        v140 = &v136[-(v139 & 0x3FFFFFFFFFFFFFFCLL)];
        v141 = v111 - 2;
        v142 = v136 - 2;
        uint64_t v143 = v139 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v144 = *(_OWORD *)&v142->var0;
          *(_OWORD *)&v141[-2].var0 = *(_OWORD *)&v142[-2].var0;
          *(_OWORD *)&v141->var0 = v144;
          v141 -= 4;
          v142 -= 4;
          v143 -= 4;
        }
        while (v143);
        v111 -= v139 & 0x3FFFFFFFFFFFFFFCLL;
        if (v139 == (v139 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_221:
          v136 = retstr->var0;
LABEL_222:
          retstr->var0 = v111;
          retstr->var1 = v89;
          v189 = retstr->var2.var0;
          retstr->var2.var0 = v112;
          if (v136) {
            (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
          }
                                                                                             + 40))(retstr->var2.var1.var0, v136, (char *)v189 - (char *)v136);
LABEL_224:
          retstr->var1 = v89;
          v190 = retstr->var2.var0;
          if (v89 < v190)
          {
            GeoCodecsFeatureStylePair *v89 = (GeoCodecsFeatureStylePair)0x30001005BLL;
            v154 = v89 + 1;
LABEL_314:
            retstr->var1 = v154;
            goto LABEL_315;
          }
          uint64_t v191 = v89 - retstr->var0;
          if ((unint64_t)(v191 + 1) >> 61) {
            abort();
          }
          uint64_t v192 = (char *)v190 - (char *)retstr->var0;
          uint64_t v193 = v192 >> 2;
          if (v192 >> 2 <= (unint64_t)(v191 + 1)) {
            uint64_t v193 = v191 + 1;
          }
          if ((unint64_t)v192 >= 0x7FFFFFFFFFFFFFF8) {
            uint64_t v194 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v194 = v193;
          }
          if (v194)
          {
            uint64_t v195 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v194, 4);
            v125 = (GeoCodecsFeatureStylePair *)(v195 + 8 * v191);
            v126 = (GeoCodecsFeatureStylePair *)(v195 + 8 * v194);
            if (v195) {
              GeoCodecsFeatureStylePair *v125 = (GeoCodecsFeatureStylePair)0x30001005BLL;
            }
          }
          else
          {
            v126 = 0;
            v125 = (GeoCodecsFeatureStylePair *)(8 * v191);
          }
          v154 = v125 + 1;
          v196 = retstr->var0;
          v155 = retstr->var1;
          if (v155 == retstr->var0) {
            goto LABEL_312;
          }
          unint64_t v197 = (char *)v155 - (char *)retstr->var0 - 8;
          if (v197 < 0x38)
          {
            v199 = retstr->var1;
          }
          else if ((unint64_t)((char *)v155 - (char *)v125) < 0x20)
          {
            v199 = retstr->var1;
          }
          else
          {
            uint64_t v198 = (v197 >> 3) + 1;
            v199 = &v155[-(v198 & 0x3FFFFFFFFFFFFFFCLL)];
            v200 = v125 - 2;
            v201 = v155 - 2;
            uint64_t v202 = v198 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v203 = *(_OWORD *)&v201->var0;
              *(_OWORD *)&v200[-2].var0 = *(_OWORD *)&v201[-2].var0;
              *(_OWORD *)&v200->var0 = v203;
              v200 -= 4;
              v201 -= 4;
              v202 -= 4;
            }
            while (v202);
            v125 -= v198 & 0x3FFFFFFFFFFFFFFCLL;
            if (v198 == (v198 & 0x3FFFFFFFFFFFFFFCLL)) {
              goto LABEL_311;
            }
          }
          do
          {
            GeoCodecsFeatureStylePair v221 = v199[-1];
            --v199;
            v125[-1] = v221;
            --v125;
          }
          while (v199 != v196);
          goto LABEL_311;
        }
      }
      do
      {
        GeoCodecsFeatureStylePair v188 = v140[-1];
        --v140;
        v111[-1] = v188;
        --v111;
      }
      while (v140 != v137);
      goto LABEL_221;
    default:
      goto LABEL_316;
  }
}

- (BOOL)isGrouped
{
  return self->_groupIdentifier != -1;
}

- (BOOL)isBehind
{
  return self->_state == 4;
}

- (BOOL)isApproaching
{
  return self->_state == 2;
}

- (BOOL)isAheadButNotApproaching
{
  return self->_state == 1;
}

- (BOOL)isUserReportedIncident
{
  return self->_trafficFeatureType == 4;
}

- (BOOL)isRouteAnnotation
{
  return self->_trafficFeatureType == 3;
}

- (BOOL)isIncident
{
  return self->_trafficFeatureType == 0;
}

- (BOOL)isCamera
{
  return self->_trafficFeatureType == 1;
}

- (BOOL)isSignal
{
  return self->_trafficFeatureType == 2;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  v2 = self;
  int v3 = v2;
  if (v2)
  {
    [(VKTrafficFeature *)v2 attributes];
  }
  else
  {
    uint64_t v6 = 0;
    long long v7 = 0u;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F645A0]);
  objc_msgSend(v4, "replaceAttributes:count:");
  if (v6) {
    (*(void (**)(void, uint64_t, void))(**((void **)&v7 + 1) + 40))(*((void *)&v7 + 1), v6, v7 - v6);
  }

  return (GEOFeatureStyleAttributes *)v4;
}

- (Mercator3<double>)mercatorPoint
{
  double x = self->_worldPoint.x;
  double y = self->_worldPoint.y;
  double z = self->_worldPoint.z;
  result._e[2] = z;
  result._e[1] = y;
  result._e[0] = x;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VKTrafficFeature *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      long long v7 = v4;
      uniqueIdentifier = self->_uniqueIdentifier;
      uint64_t v9 = [(VKTrafficFeature *)v7 uniqueIdentifier];
      LOBYTE(uniqueIdentifier) = [(NSString *)uniqueIdentifier isEqualToString:v9];

      BOOL v6 = 0;
      if (uniqueIdentifier)
      {
        int groupIdentifier = self->_groupIdentifier;
        if (groupIdentifier == [(VKTrafficFeature *)v7 groupIdentifier])
        {
          unsigned int groupItemVerticalDisplayOrder = self->_groupItemVerticalDisplayOrder;
          if (groupItemVerticalDisplayOrder == [(VKTrafficFeature *)v7 groupItemVerticalDisplayOrder])
          {
            unsigned int groupItemHorizontalDisplayOrder = self->_groupItemHorizontalDisplayOrder;
            if (groupItemHorizontalDisplayOrder == [(VKTrafficFeature *)v7 groupItemHorizontalDisplayOrder])
            {
              uint64_t v13 = [(VKTrafficFeature *)v7 routeOffset];
              if (self->_routeOffset.index == v13
                && vabds_f32(self->_routeOffset.offset, *((float *)&v13 + 1)) < 0.00000011921)
              {
                uint64_t v14 = [(VKTrafficFeature *)v7 approachingRouteOffset];
                if (self->_approachingRouteOffset.index == v14
                  && fabsf(self->_approachingRouteOffset.offset - *((float *)&v14 + 1)) < 0.00000011921)
                {
                  BOOL v6 = 1;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&self->_worldPoint.x;
    *((void *)v4 + 4) = *(void *)&self->_worldPoint.z;
    *((_OWORD *)v4 + 1) = v6;
    long long v7 = *(_OWORD *)&self->_position.latitude;
    *((void *)v4 + 11) = *(void *)&self->_position.altitude;
    *(_OWORD *)(v4 + 72) = v7;
    *((_DWORD *)v4 + 2) = LODWORD(self->_minZoom);
    *((_DWORD *)v4 + 3) = LODWORD(self->_maxZoom);
    *((void *)v4 + 13) = self->_routeOffset;
    *((void *)v4 + 18) = self->_trafficFeatureType;
    *((void *)v4 + 15) = self->_state;
    *((void *)v4 + 12) = self->_approachingRouteOffset;
    *((void *)v4 + 14) = *(void *)&self->_approachingDistanceInMeters;
    *((void *)v4 + 7) = *(void *)&self->_routeOffsetInMeters;
    objc_storeStrong((id *)v4 + 16, self->_uniqueIdentifier);
    v5[10] = self->_groupIdentifier;
    v5[12] = self->_groupItemHorizontalDisplayOrder;
    v5[11] = self->_groupItemVerticalDisplayOrder;
    *((unsigned char *)v5 + 152) = self->_shouldUpdateStyle;
  }
  return v5;
}

- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 direction:(double)a6 routeOffset:(PolylineCoordinate)a7 routeOffsetInMeters:(double)a8
{
  double var2 = a5.var2;
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VKTrafficFeature;
  v17 = [(VKTrafficFeature *)&v30 init];
  unint64_t v18 = v17;
  if (v17)
  {
    v17->_shouldUpdateStyle = 0;
    v17->_int64_t trafficFeatureType = a3;
    *(void *)&v17->_minZoom = 0x42C8000000000000;
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a4);
    v18->_uint64_t collisionPriority = 0;
    v18->_approachingDistanceInMeters = 0.0;
    v18->_approachingRouteOffset = (PolylineCoordinate)*MEMORY[0x1E4F64198];
    v18->_routeOffset = a7;
    v18->_double routeOffsetInMeters = a8;
    v18->_unsigned int groupItemHorizontalDisplayOrder = 0;
    *(void *)&v18->_int groupIdentifier = 0xFFFFFFFFLL;
    v18->_position.double latitude = var0;
    v18->_position.double longitude = var1;
    v18->_position.double altitude = var2;
    long double v19 = tan(var0 * 0.00872664626 + 0.785398163);
    long double v20 = log(v19);
    v21.f64[0] = var1;
    v21.f64[1] = v20;
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)&v18->_worldPoint.double x = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v21);
    v18->_worldPoint.double z = var2;
    v18->_facingAzimuth = a6;
    unint64_t v27 = v18;
  }

  return v18;
}

- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6
{
  PolylineCoordinate v24 = a5;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 pointWithAltitudeCorrectionAtRouteCoordinate:a5];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v12 distanceFromPoint:0 toPoint:a5];
    double v20 = v19;
    double v21 = VKTrafficFeatureDirection(&v24, v12);
  }
  else
  {
    double v20 = 0.0;
    double v21 = -1.0;
    double v16 = -180.0;
    double v18 = 1.79769313e308;
    double v14 = -180.0;
  }
  id v22 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:](self, "initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:", a3, v10, a5, v14, v16, v18, v21, v20);

  return v22;
}

- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 onRoute:(id)a6
{
  double var2 = a5.var2;
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v12 = a4;
  id v13 = a6;
  double v14 = v13;
  if (v13)
  {
    uint64_t v15 = objc_msgSend(v13, "closestPointOnRoute:", var0, var1);
    uint64_t v22 = v15;
    [v14 distanceFromPoint:0 toPoint:v15];
    double v17 = v16;
    double v18 = VKTrafficFeatureDirection(&v22, v14);
    if (var2 == 1.79769313e308)
    {
      [v14 pointWithAltitudeCorrectionAtRouteCoordinate:v15];
      double var2 = v19;
    }
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F64198];
    double v17 = 0.0;
    double v18 = -1.0;
  }
  double v20 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:](self, "initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:", a3, v12, v15, var0, var1, var2, v18, v17);

  return v20;
}

- (VKTrafficFeature)initWithEnrouteNotice:(id)a3 onRoute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)VKTrafficFeature;
  int64_t v8 = [(VKTrafficFeature *)&v42 init];
  if (v8)
  {
    uint64_t v9 = [v6 trafficSignal];
    if (v9 || ([v6 trafficCamera], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      id v12 = [v6 routeAnnotation];

      if (!v12) {
        goto LABEL_37;
      }
    }
    v8->_shouldUpdateStyle = 0;
    id v10 = [v6 trafficSignal];

    if (v10)
    {
      uint64_t v11 = 2;
    }
    else
    {
      id v13 = [v6 trafficCamera];

      if (v13) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 3;
      }
    }
    v8->_int64_t trafficFeatureType = v11;
    *(void *)&v8->_minZoom = 0x42C8000000000000;
    v8->_int64_t state = 0;
    uint64_t v14 = [v6 identifier];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v14;

    if ([v6 hasGroupIdentifier]) {
      int v16 = [v6 groupIdentifier];
    }
    else {
      int v16 = -1;
    }
    v8->_int groupIdentifier = v16;
    unsigned int v17 = [v6 hasGroupItemVerticalDisplayOrder];
    if (v17) {
      unsigned int v17 = [v6 groupItemVerticalDisplayOrder];
    }
    v8->_unsigned int groupItemVerticalDisplayOrder = v17;
    unsigned int v18 = [v6 hasGroupItemHorizontalDisplayOrder];
    if (v18) {
      unsigned int v18 = [v6 groupItemHorizontalDisplayOrder];
    }
    v8->_unsigned int groupItemHorizontalDisplayOrder = v18;
    unsigned int v19 = [v6 hasHighlightDistance];
    if (v19) {
      unsigned int v19 = [v6 highlightDistance];
    }
    v8->_approachingDistanceInMeters = (double)v19;
    v8->_approachingRouteOffset = (PolylineCoordinate)*MEMORY[0x1E4F64198];
    if (v7 && v19) {
      v8->_approachingRouteOffset = (PolylineCoordinate)objc_msgSend(v7, "routeCoordinateAtDistance:beforeRouteCoordinate:", objc_msgSend(v6, "routeCoordinate"), (double)v19);
    }
    if ([v6 hasPriority])
    {
      unsigned int v20 = [v6 priority];
      if (v20 >= 0xFF) {
        char v21 = -1;
      }
      else {
        char v21 = v20;
      }
    }
    else
    {
      char v21 = 0;
    }
    v8->_uint64_t collisionPriority = v21;
    uint64_t v22 = [v6 routeCoordinate];
    v8->_routeOffset = (PolylineCoordinate)v22;
    if (v7)
    {
      [v7 pointWithAltitudeCorrectionAtRouteCoordinate:v22];
      uint64_t v24 = v23;
    }
    else
    {
      uint64_t v24 = 0x7FEFFFFFFFFFFFFFLL;
    }
    GeoCodecsFeatureStylePair v25 = [v6 position];
    [v25 lat];
    double v27 = v26;
    uint64_t v28 = [v6 position];
    [v28 lng];
    v8->_position.double latitude = v27;
    v8->_position.float64_t longitude = v29;
    *(void *)&v8->_position.double altitude = v24;

    float64_t longitude = v8->_position.longitude;
    long double v30 = tan(v8->_position.latitude * 0.00872664626 + 0.785398163);
    long double v31 = log(v30);
    v32.f64[0] = longitude;
    v32.f64[1] = v31;
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)&v8->_worldPoint.double x = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v32);
    *(void *)&v8->_worldPoint.double z = v24;
    if (v7)
    {
      [v7 distanceFromPoint:0 toPoint:*(void *)&v8->_routeOffset];
      v8->_double routeOffsetInMeters = v38;
      double v39 = VKTrafficFeatureDirection(&v8->_routeOffset, v7);
    }
    else
    {
      v8->_double routeOffsetInMeters = 0.0;
      double v39 = -1.0;
    }
    v8->_facingAzimuth = v39;
    id v12 = v8;
  }
  else
  {
    id v12 = 0;
  }
LABEL_37:

  return v12;
}

+ (id)stringForNavState:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E5A98428 + a3);
  }
}

+ (id)stringForFeatureType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E5A98400 + a3);
  }
}

+ (id)newTrafficFeatureForEnrouteNotice:(id)a3 onRoute:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 trafficCamera];

  if (v7)
  {
    int64_t v8 = [VKTrafficCameraFeature alloc];
    uint64_t v9 = [v5 trafficCamera];
    uint64_t v10 = [(VKTrafficCameraFeature *)v8 initWithTrafficCamera:v9 onRoute:v6];
  }
  else
  {
    uint64_t v11 = [v5 trafficSignal];

    if (v11)
    {
      id v12 = [VKTrafficSignalFeature alloc];
      uint64_t v9 = [v5 trafficSignal];
      uint64_t v10 = [(VKTrafficSignalFeature *)v12 initWithTrafficSignal:v9 onRoute:v6];
    }
    else
    {
      id v13 = [v5 routeAnnotation];

      if (!v13)
      {
        uint64_t v15 = 0;
        goto LABEL_8;
      }
      uint64_t v14 = [VKRouteAnnotation alloc];
      uint64_t v9 = [v5 routeAnnotation];
      uint64_t v10 = [(VKRouteAnnotation *)v14 initWithRouteAnnotation:v9 onRoute:v6];
    }
  }
  uint64_t v15 = (void *)v10;

LABEL_8:
  return v15;
}

@end