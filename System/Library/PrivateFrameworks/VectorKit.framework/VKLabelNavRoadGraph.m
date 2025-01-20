@interface VKLabelNavRoadGraph
- (BOOL)_checkIfDualCarriageWayConnectorRoad:(id)a3 fromJunction:(id)a4 toJunction:(id)a5 checkShields:(BOOL)a6;
- (BOOL)collideRouteWithLabel:(id)a3 routeCrossProduct:(float *)a4 context:(NavContext *)a5;
- (BOOL)isPriorRouteCollinearWithRoad:(id)a3 distance:(float)a4;
- (BOOL)prepareOppositeCarriagewayJunctions;
- (Matrix<float,)unitHeading;
- (NSMutableArray)junctions;
- (VKLabelNavRoadGraph)initWithJunctions:(id)a3;
- (id).cxx_construct;
- (id)_findInterTileJunctionForJunction:(id)a3;
- (id)_junctionForRoadEdge:(const GeoCodecsRoadEdge *)a3 atA:(BOOL)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6;
- (id)_nextIntersectionForRoad:(id)a3;
- (id)junctionForRoad:(id)a3 nearJunction:(BOOL)a4 crossTileEdge:(BOOL)a5;
- (id)junctionListForDepth:(unint64_t)a3;
- (id)nextRoadSegmentForRoad:(id)a3;
- (id)offRouteGraphJunctionsWithNavContext:(NavContext *)a3 maxJunctions:(unint64_t)a4 isOnRoute:(BOOL)a5;
- (id)offRouteJunctionList;
- (id)oppositeCarriagewayJunctions;
- (id)overpassJunctionForJunction:(id)a3;
- (unint64_t)countReadyJunctionLists;
- (unsigned)computeRoutePositionForPOIAtPixel:(const void *)a3 currentPosition:(unsigned __int8)a4 context:(NavContext *)a5;
- (void)_findOffRouteJunctions;
- (void)_transformRouteToScreenWithContext:(NavContext *)a3;
- (void)_updateIntersectionsForDepth:(unint64_t)a3;
- (void)_updateSimplifiedRoute;
- (void)addRouteRoadEdge:(const VKLabelNavRouteRoadEdge *)a3 atA:(BOOL)a4 isRouteRefineJunction:(BOOL)a5 tile:(const void *)a6 junctionList:(id)a7;
- (void)debugDraw:(id)a3 overlayConsole:(void *)a4 navContext:(NavContext *)a5;
- (void)evaluateDualCarriagewayForJunction:(id)a3 outputJunctionList:(id)a4;
- (void)reset;
- (void)routeJunctionsHaveChanged;
- (void)setJunctions:(id)a3;
- (void)setTiles:(const void *)a3;
- (void)startingLabelLayoutWithContext:(NavContext *)a3 routeUserOffset:(PolylineCoordinate)a4;
@end

@implementation VKLabelNavRoadGraph

- (void)reset
{
  if (self->_tiles.__table_.__p2_.__value_)
  {
    next = self->_tiles.__table_.__p1_.__value_.__next_;
    while (next)
    {
      v4 = next;
      next = (void *)*next;
      v5 = (std::__shared_weak_count *)v4[3];
      if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, SEL))v5->__on_zero_shared)(v5, a2);
        std::__shared_weak_count::__release_weak(v5);
      }
      (*(void (**)(Allocator *, void *, uint64_t))(*(void *)self->_tiles.__table_.__p1_.__value__2._allocator
                                                             + 40))(self->_tiles.__table_.__p1_.__value__2._allocator, v4, 32);
    }
    self->_tiles.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        self->_tiles.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_tiles.__table_.__p2_.__value_ = 0;
  }
  if (self->_duplicateTiles.__table_.__p2_.__value_)
  {
    v8 = self->_duplicateTiles.__table_.__p1_.__value_.__next_;
    while (v8)
    {
      v9 = v8;
      v8 = (void *)*v8;
      v10 = (std::__shared_weak_count *)v9[3];
      if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, SEL))v10->__on_zero_shared)(v10, a2);
        std::__shared_weak_count::__release_weak(v10);
      }
      (*(void (**)(Allocator *, void *, uint64_t))(*(void *)self->_duplicateTiles.__table_.__p1_.__value__2._allocator
                                                             + 40))(self->_duplicateTiles.__table_.__p1_.__value__2._allocator, v9, 32);
    }
    self->_duplicateTiles.__table_.__p1_.__value_.__next_ = 0;
    unint64_t v11 = self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v11)
    {
      for (uint64_t j = 0; j != v11; ++j)
        self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
    }
    self->_duplicateTiles.__table_.__p2_.__value_ = 0;
  }
  [(NSMutableDictionary *)self->_tileDatasByIndex removeAllObjects];
  [(NSMutableArray *)self->_intersections removeAllObjects];
  self->_offRouteJunctionsValid = 0;
  [(NSMutableArray *)self->_offRouteJunctions removeAllObjects];
  [(VKLabelNavRoadGraph *)self routeJunctionsHaveChanged];
}

- (void)routeJunctionsHaveChanged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_simplifiedRouteValid = 0;
  self->_simplifiedRoutePoints.__end_ = self->_simplifiedRoutePoints.__begin_;
  self->_routeFeatureMapValid = 0;
  std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,mdm::Allocator>>::clear((uint64_t)&self->_routeFeatureMap);
  self->_oppositeCarriagewayJunctionsValid = 0;
  [(NSMutableArray *)self->_oppositeCarriagewayJunctions removeAllObjects];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v3 = [(NSMutableDictionary *)self->_tileDatasByIndex objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setOppositeCarriagewayJunctionsValid:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (VKLabelNavRoadGraph)initWithJunctions:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VKLabelNavRoadGraph;
  uint64_t v6 = [(VKLabelNavRoadGraph *)&v29 init];
  long long v7 = v6;
  long long v8 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_junctions, a3);
    unint64_t prime = vcvtps_u32_f32(32.0 / v8->_tiles.__table_.__p3_.__value_);
    if (prime == 1)
    {
      unint64_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      unint64_t prime = std::__next_prime(prime);
    }
    int8x8_t value = (int8x8_t)v8->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (prime > *(void *)&value) {
      goto LABEL_7;
    }
    if (prime < *(void *)&value)
    {
      unint64_t v11 = vcvtps_u32_f32((float)v8->_tiles.__table_.__p2_.__value_ / v8->_tiles.__table_.__p3_.__value_);
      if (*(void *)&value < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(value), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
      {
        unint64_t v11 = std::__next_prime(v11);
      }
      else
      {
        uint64_t v13 = 1 << -(char)__clz(v11 - 1);
        if (v11 >= 2) {
          unint64_t v11 = v13;
        }
      }
      if (prime <= v11) {
        unint64_t prime = v11;
      }
      if (prime < *(void *)&value) {
LABEL_7:
      }
        std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)&v7->_tiles, prime);
    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tileDatasByIndex = v8->_tileDatasByIndex;
    v8->_tileDatasByIndex = v14;

    unint64_t v16 = vcvtps_u32_f32(32.0 / v8->_duplicateTiles.__table_.__p3_.__value_);
    if (v16 == 1)
    {
      unint64_t v16 = 2;
    }
    else if ((v16 & (v16 - 1)) != 0)
    {
      unint64_t v16 = std::__next_prime(v16);
    }
    int8x8_t v17 = (int8x8_t)v8->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v16 > *(void *)&v17) {
      goto LABEL_23;
    }
    if (v16 < *(void *)&v17)
    {
      unint64_t v18 = vcvtps_u32_f32((float)v8->_duplicateTiles.__table_.__p2_.__value_ / v8->_duplicateTiles.__table_.__p3_.__value_);
      if (*(void *)&v17 < 3uLL || (uint8x8_t v19 = (uint8x8_t)vcnt_s8(v17), v19.i16[0] = vaddlv_u8(v19), v19.u32[0] > 1uLL))
      {
        unint64_t v18 = std::__next_prime(v18);
      }
      else
      {
        uint64_t v20 = 1 << -(char)__clz(v18 - 1);
        if (v18 >= 2) {
          unint64_t v18 = v20;
        }
      }
      if (v16 <= v18) {
        unint64_t v16 = v18;
      }
      if (v16 < *(void *)&v17) {
LABEL_23:
      }
        std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)&v7->_duplicateTiles, v16);
    }
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    intersections = v8->_intersections;
    v8->_intersections = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    offRouteJunctions = v8->_offRouteJunctions;
    v8->_offRouteJunctions = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    oppositeCarriagewayJunctions = v8->_oppositeCarriagewayJunctions;
    v8->_oppositeCarriagewayJunctions = v25;

    v27 = v8;
  }

  return v8;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  v2 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
  {
    id v19 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v4 = v3;
    self = v19;
    if (v4) {
      operator new();
    }
  }
  *((void *)self + 3) = *((void *)v2 + 91);
  *((void *)self + 4) = 0;
  {
    id v20 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v6 = v5;
    self = v20;
    if (v6) {
      operator new();
    }
  }
  *((void *)self + 5) = *((void *)v2 + 91);
  *((void *)self + 6) = 0;
  *((_DWORD *)self + 14) = 1065353216;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  {
    id v21 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v8 = v7;
    self = v21;
    if (v8) {
      operator new();
    }
  }
  *((void *)self + 10) = *((void *)v2 + 91);
  *((void *)self + 11) = 0;
  {
    id v22 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v10 = v9;
    self = v22;
    if (v10) {
      operator new();
    }
  }
  *((void *)self + 12) = *((void *)v2 + 91);
  *((void *)self + 13) = 0;
  *((_DWORD *)self + 28) = 1065353216;
  *((void *)self + 27) = 0xBF80000000000000;
  *((void *)self + 29) = 0;
  *((void *)self + 30) = 0;
  {
    id v23 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v12 = v11;
    self = v23;
    if (v12) {
      operator new();
    }
  }
  *((void *)self + 31) = *((void *)v2 + 91);
  *((void *)self + 32) = 0;
  {
    id v24 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v14 = v13;
    self = v24;
    if (v14) {
      operator new();
    }
  }
  *((void *)self + 33) = *((void *)v2 + 91);
  *((void *)self + 34) = 0;
  *((_DWORD *)self + 70) = 1065353216;
  *((void *)self + 38) = 0;
  *((void *)self + 39) = 0;
  *((void *)self + 37) = 0;
  {
    id v25 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v16 = v15;
    self = v25;
    if (v16) {
      operator new();
    }
  }
  *((void *)self + 40) = *((void *)v2 + 91);
  *((void *)self + 44) = 0;
  *((void *)self + 45) = 0;
  *((void *)self + 43) = 0;
  {
    id v26 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v18 = v17;
    self = v26;
    if (v18) {
      operator new();
    }
  }
  *((void *)self + 46) = *((void *)v2 + 91);
  return self;
}

- (void).cxx_destruct
{
  begin = self->_screenRouteSegments.__begin_;
  if (begin)
  {
    self->_screenRouteSegments.__end_ = begin;
    (*(void (**)(Allocator *, RouteSegment *, int64_t))(*(void *)self->_screenRouteSegments.__end_cap_.__value__2._allocator
                                                                        + 40))(self->_screenRouteSegments.__end_cap_.__value__2._allocator, begin, self->_screenRouteSegments.__end_cap_.__value_ - begin);
  }
  int v4 = self->_simplifiedRoutePoints.__begin_;
  if (v4)
  {
    self->_simplifiedRoutePoints.__end_ = v4;
    (*(void (**)(Allocator *, LabelPoint *, int64_t))(*(void *)self->_simplifiedRoutePoints.__end_cap_.__value__2._allocator
                                                                      + 40))(self->_simplifiedRoutePoints.__end_cap_.__value__2._allocator, v4, self->_simplifiedRoutePoints.__end_cap_.__value_ - v4);
  }
  next = (char *)self->_routeFeatureMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      int v6 = *(char **)next;
      int v7 = (std::__shared_weak_count *)*((void *)next + 7);
      if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
      if (next[39] < 0) {
        (*(void (**)(void, void, uint64_t))(**((void **)next + 5) + 40))(*((void *)next + 5), *((void *)next + 2), *((void *)next + 4) & 0x7FFFFFFFFFFFFFFFLL);
      }
      (*(void (**)(Allocator *, char *, uint64_t))(*(void *)self->_routeFeatureMap.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_routeFeatureMap.__table_.__p1_.__value__2._allocator, next, 64);
      next = v6;
    }
    while (v6);
  }
  int8x8_t value = self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Allocator *, void **, unint64_t))(*(void *)self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
  }
                                                                   + 40))(self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, value, 8 * self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  objc_storeStrong((id *)&self->_offRouteJunctions, 0);
  objc_storeStrong((id *)&self->_oppositeCarriagewayJunctions, 0);
  objc_storeStrong((id *)&self->_intersections, 0);
  objc_storeStrong((id *)&self->_junctions, 0);
  objc_storeStrong((id *)&self->_tileDatasByIndex, 0);
  int v9 = self->_duplicateTiles.__table_.__p1_.__value_.__next_;
  while (v9)
  {
    int v10 = v9;
    int v9 = (void *)*v9;
    int v11 = (std::__shared_weak_count *)v10[3];
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    (*(void (**)(Allocator *, void *, uint64_t))(*(void *)self->_duplicateTiles.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_duplicateTiles.__table_.__p1_.__value__2._allocator, v10, 32);
  }
  int v12 = self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_;
  self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v12) {
    (*(void (**)(Allocator *, void **, unint64_t))(*(void *)self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
  }
                                                                   + 40))(self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, v12, 8 * self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  int v13 = self->_tiles.__table_.__p1_.__value_.__next_;
  while (v13)
  {
    int v14 = v13;
    int v13 = (void *)*v13;
    int v15 = (std::__shared_weak_count *)v14[3];
    if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    (*(void (**)(Allocator *, void *, uint64_t))(*(void *)self->_tiles.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_tiles.__table_.__p1_.__value__2._allocator, v14, 32);
  }
  int v16 = self->_tiles.__table_.__bucket_list_.__ptr_.__value_;
  self->_tiles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v16)
  {
    int v17 = *(void (**)(void))(*(void *)self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
                           + 40);
    v17();
  }
}

- (void)setJunctions:(id)a3
{
}

- (NSMutableArray)junctions
{
  return self->_junctions;
}

- (id)_nextIntersectionForRoad:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = 0;
  while (1)
  {
    int v6 = [(VKLabelNavRoadGraph *)self junctionForRoad:v4 nearJunction:0 crossTileEdge:1];
    int v7 = v6;
    if (!v6 || ([v6 isIntersection] & 1) != 0) {
      break;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v8 = objc_msgSend(v7, "roads", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v9)
    {
LABEL_16:

LABEL_17:
      int v7 = 0;
      break;
    }
    uint64_t v10 = *(void *)v16;
LABEL_6:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v8);
      }
      int v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
      if (([v12 matchesRoad:v4] & 1) == 0) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_6;
        }
        goto LABEL_16;
      }
    }
    id v13 = v12;

    if (!v13) {
      goto LABEL_17;
    }

    ++v5;
    id v4 = v13;
    if (v5 == 10)
    {
      int v7 = 0;
      id v4 = v13;
      break;
    }
  }

  return v7;
}

- (id)nextRoadSegmentForRoad:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(VKLabelNavRoadGraph *)self junctionForRoad:v4 nearJunction:0 crossTileEdge:1];
  v27 = v5;
  if (v5)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int v6 = [v5 roads];
    id v7 = 0;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (([v11 matchesRoad:v4] & 1) == 0)
          {
            int v12 = [v11 name];
            id v13 = [v4 name];
            int v14 = [v12 isEqualToString:v13];

            if (v14)
            {
              if (v7)
              {
                [v4 direction2D];
                float v16 = v15;
                float v18 = v17;
                [v11 direction2D];
                float v20 = v19;
                float v22 = v21;
                [v7 direction2D];
                if ((float)((float)(v20 * v16) + (float)(v22 * v18)) > (float)((float)(v23 * v16) + (float)(v24 * v18)))
                {
                  id v25 = v11;

                  id v7 = v25;
                }
              }
              else
              {
                id v7 = v11;
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_findInterTileJunctionForJunction:(id)a3
{
  id v4 = a3;
  [v4 tileCoordinate];
  int v7 = LODWORD(v5);
  float v8 = v6;
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  if (*(float *)&v5 <= 0.9995) {
    uint64_t v10 = 0;
  }
  if (*(float *)&v5 >= 0.0005) {
    uint64_t v9 = v10;
  }
  LODWORD(v5) = 973279855;
  uint64_t v11 = v9 | 4;
  if (v6 <= 0.9995) {
    uint64_t v11 = v9;
  }
  uint64_t v12 = v9 | 8;
  if (v6 < 0.0005) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = v11;
  }
  if ((v13 & 1) == 0) {
    goto LABEL_35;
  }
  tileDatasByIndex = self->_tileDatasByIndex;
  uint64_t v15 = objc_msgSend(v4, "tile", v5);
  float v16 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *(int *)(*(void *)v15 + 296) - 1, *(int *)(*(void *)v15 + 292));
  float v17 = [(NSMutableDictionary *)tileDatasByIndex objectForKey:v16];

  if (v17)
  {
    LODWORD(v18) = 1.0;
    *(float *)&double v19 = v8;
    float v20 = objc_msgSend(v17, "findTileEdgeJunctionAtCoordinate:", v18, v19);
    if (v20) {
      goto LABEL_17;
    }
  }

  if (v13 != 1)
  {
LABEL_35:
    if ((v13 & 2) == 0) {
      goto LABEL_23;
    }
    float v21 = self->_tileDatasByIndex;
    uint64_t v22 = objc_msgSend(v4, "tile", v5);
    float v23 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *(int *)(*(void *)v22 + 296) + 1, *(int *)(*(void *)v22 + 292));
    float v17 = [(NSMutableDictionary *)v21 objectForKey:v23];

    if (v17)
    {
      *(float *)&double v24 = v8;
      float v20 = objc_msgSend(v17, "findTileEdgeJunctionAtCoordinate:", 0.0, v24);
      if (v20)
      {
LABEL_17:

        goto LABEL_20;
      }
    }

    if (v13 != 2)
    {
LABEL_23:
      uint64_t v26 = 2;
      while (1)
      {
        while (1)
        {
          uint64_t v27 = *((void *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets + 4 * v26);
          if ((v27 & ~v13) == 0) {
            break;
          }
          if (++v26 == 8) {
            goto LABEL_19;
          }
        }
        long long v28 = self->_tileDatasByIndex;
        uint64_t v29 = objc_msgSend(v4, "tile", v5);
        long long v30 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *((void *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets + 4 * v26 + 1)+ *(int *)(*(void *)v29 + 296), *((void *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets + 4 * v26 + 2)+ *(int *)(*(void *)v29 + 292));
        float v17 = [(NSMutableDictionary *)v28 objectForKey:v30];

        if (v17)
        {
          LODWORD(v31) = v7;
          if ((v26 & 0x7FFFFFFFFFFFFFFELL) != 2) {
            LODWORD(v31) = *((_DWORD *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets
          }
                           + 8 * v26
                           + 6);
          LODWORD(v32) = *((_DWORD *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets
                         + 8 * v26
                         + 7);
          float v20 = objc_msgSend(v17, "findTileEdgeJunctionAtCoordinate:", v31, v32);
          if (v20) {
            goto LABEL_17;
          }
        }

        float v20 = 0;
        if (v13 != v27 && ++v26 != 8) {
          continue;
        }
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  float v20 = 0;
LABEL_20:

  return v20;
}

- (id)_junctionForRoadEdge:(const GeoCodecsRoadEdge *)a3 atA:(BOOL)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6
{
  BOOL v8 = a4;
  tileDatasByIndex = self->_tileDatasByIndex;
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *(int *)(*(void *)a6 + 296), *(int *)(*(void *)a6 + 292));
  uint64_t v12 = [(NSMutableDictionary *)tileDatasByIndex objectForKey:v11];

  uint64_t v13 = 48;
  if (v8) {
    uint64_t v13 = 40;
  }
  if (v12)
  {
    uint64_t v14 = *(uint64_t *)((char *)&a3->var0 + v13);
    if (v14)
    {
      uint64_t v15 = [v12 junctionForGeoJunction:*(GeoCodecsRoadFeature **)((char *)&a3->var0 + v13)];
      if (!v15)
      {
        uint64_t v15 = [[VKLabelNavJunction alloc] initWithGEOJunction:v14 routeOffset:a5 tile:a6];
        [v12 addJunction:v15];
      }
    }
    else
    {
      uint64_t v22 = 0;
      float v16 = geo::codec::multiSectionFeaturePoints(a3->var0, 0, &v22);
      uint64_t v19 = 16;
      if (v8) {
        uint64_t v19 = 8;
      }
      float v20 = &v16[*(uint64_t *)((char *)&a3->var0 + v19)];
      LODWORD(v17) = *v20;
      LODWORD(v18) = v20[1];
      objc_msgSend(v12, "junctionAtCoordinate:", v17, v18);
      uint64_t v15 = (VKLabelNavJunction *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        uint64_t v15 = [[VKLabelNavJunction alloc] initWithRoadEdge:a3 atA:v8 routeOffset:a5 tile:a6];
        [v12 addJunction:v15];
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (Matrix<float,)unitHeading
{
  float v2 = self->_unitHeading._e[0];
  float v3 = self->_unitHeading._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (id)junctionForRoad:(id)a3 nearJunction:(BOOL)a4 crossTileEdge:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  [v8 getRoadEdge:v13];
  uint64_t v9 = -[VKLabelNavRoadGraph _junctionForRoadEdge:atA:routeOffset:tile:](self, "_junctionForRoadEdge:atA:routeOffset:tile:", v13, v6, [v8 routeOffset], objc_msgSend(v8, "tile"));
  uint64_t v10 = v9;
  if (v5 && v9 && [v9 isTileEdgeJunction])
  {
    uint64_t v11 = [(VKLabelNavRoadGraph *)self _findInterTileJunctionForJunction:v10];

    uint64_t v10 = (void *)v11;
  }

  return v10;
}

- (void)setTiles:(const void *)a3
{
  next = self->_tiles.__table_.__p1_.__value_.__next_;
  if (next)
  {
    char v6 = 0;
    do
    {
      unint64_t v7 = next[2];
      if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(a3, v7))
      {
        if (std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_, v7))
        {
          std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__erase_unique<std::shared_ptr<md::LabelTile>>(&self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_, v7);
        }
        else
        {
          tileDatasByIndex = self->_tileDatasByIndex;
          uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *(int *)(v7 + 296), *(int *)(v7 + 292));
          [(NSMutableDictionary *)tileDatasByIndex removeObjectForKey:v9];

          char v6 = 1;
        }
      }
      next = (void *)*next;
    }
    while (next);
  }
  else
  {
    char v6 = 0;
  }
  for (uint64_t i = (void *)*((void *)a3 + 3); i; uint64_t i = (void *)*i)
  {
    uint64_t v12 = i + 2;
    unint64_t v11 = i[2];
    if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&self->_tiles.__table_.__bucket_list_.__ptr_.__value_, v11))
    {
      uint64_t v13 = self->_tileDatasByIndex;
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *(int *)(v11 + 296), *(int *)(v11 + 292));
      uint64_t v15 = [(NSMutableDictionary *)v13 objectForKey:v14];

      if (v15)
      {
        std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__emplace_unique_key_args<std::shared_ptr<md::LabelTile>,std::shared_ptr<md::LabelTile> const&>((unint64_t)&self->_duplicateTiles, *v12, i + 2);
      }
      else
      {
        float v16 = [[VKLabelNavTileData alloc] initWithTile:i + 2];
        double v17 = self->_tileDatasByIndex;
        double v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *(int *)(*v12 + 296), *(int *)(*v12 + 292));
        [(NSMutableDictionary *)v17 setObject:v16 forKey:v18];

        char v6 = 1;
      }
    }
  }
  if (&self->_tiles != a3)
  {
    self->_tiles.__table_.__p3_.__value_ = *((float *)a3 + 12);
    std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::shared_ptr<md::LabelTile>,void *> *>>(&self->_tiles.__table_.__bucket_list_.__ptr_.__value_, *((void **)a3 + 3));
  }
  if (v6)
  {
    [(NSMutableArray *)self->_intersections removeAllObjects];
    self->_offRouteJunctionsValid = 0;
    [(NSMutableArray *)self->_offRouteJunctions removeAllObjects];
    self->_oppositeCarriagewayJunctionsValid = 0;
    oppositeCarriagewayJunctions = self->_oppositeCarriagewayJunctions;
    [(NSMutableArray *)oppositeCarriagewayJunctions removeAllObjects];
  }
}

- (void)startingLabelLayoutWithContext:(NavContext *)a3 routeUserOffset:(PolylineCoordinate)a4
{
  self->_screenRouteValid = 0;
  __float2 v6 = __sincosf_stret(*((float *)a3->var3 + 105));
  self->_unitHeading._e[0] = v6.__cosval;
  self->_unitHeading._e[1] = v6.__sinval;
  self->_routeUserOffset = a4;
}

- (void)debugDraw:(id)a3 overlayConsole:(void *)a4 navContext:(NavContext *)a5
{
  id v10 = a3;
  if (!self->_screenRouteValid) {
    [(VKLabelNavRoadGraph *)self _transformRouteToScreenWithContext:a5];
  }
  *((float *)a4 + 26) = fabsf(*((float *)a5->var1 + 44) * 3.0) * 0.5;
  *((_DWORD *)a4 + 24) = 32512;
  begin = self->_screenRouteSegments.__begin_;
  for (uint64_t i = self->_screenRouteSegments.__end_; begin != i; begin = (RouteSegment *)((char *)begin + 20))
  {
    *((_DWORD *)a4 + 2) = *(_DWORD *)begin;
    *((_DWORD *)a4 + 3) = *((_DWORD *)begin + 1);
    ggl::DebugConsole::drawLine((uint64_t)a4, (float *)begin + 2);
  }
  *((float *)a4 + 26) = fabsf(*((float *)a5->var1 + 44)) * 0.5;
}

- (BOOL)prepareOppositeCarriagewayJunctions
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  if (self->_oppositeCarriagewayJunctionsValid) {
    return 1;
  }
  if ([(NSMutableArray *)self->_junctions count])
  {
    if (!self->_routeFeatureMapValid)
    {
      p_routeFeatureMap = &self->_routeFeatureMap;
      std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,mdm::Allocator>>::clear((uint64_t)&self->_routeFeatureMap);
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v4 = self->_junctions;
      unint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v92 objects:v98 count:16];
      if (v5)
      {
        uint64_t v6 = 0;
        uint64_t v7 = *(void *)v93;
        for (uint64_t i = *(void *)v93; ; uint64_t i = *(void *)v93)
        {
          if (i != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v92 + 1) + 8 * v6);
          if ([v9 isOnRoute])
          {
            id v10 = [v9 outgoingRoad];
            BOOL v11 = v10 == 0;

            if (!v11)
            {
              uint64_t v12 = [v9 outgoingRoad];
              unint64_t v13 = [v12 cstrName];

              uint64_t v14 = [v9 outgoingRoad];
              id v15 = [v14 shieldGroup];
              unint64_t v16 = [v15 UTF8String];

              if (v13 | v16) {
                break;
              }
            }
          }
LABEL_79:
          if (++v6 >= v5)
          {
            unint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v92 objects:v98 count:16];
            if (!v5) {
              goto LABEL_88;
            }
            uint64_t v6 = 0;
          }
        }
        v85 = 0;
        v86 = 0;
        uint64_t v87 = 0;
        {
          operator new();
        }
        uint64_t v88 = mdm::Allocator::instance(void)::alloc;
        id v89 = 0;
        id v90 = 0;
        double v17 = [v9 outgoingRoad];
        [v17 appendSimplifiedWorldRoadPoints:&v85 pointElevations:0];

        if ((unint64_t)(v86 - v85) < 0x20) {
          goto LABEL_77;
        }
        objc_storeStrong(&v89, v9);
        double v18 = [v9 outgoingRoad];
        uint64_t v19 = [(VKLabelNavRoadGraph *)self junctionForRoad:v18 nearJunction:0 crossTileEdge:0];
        id v20 = v90;
        id v90 = v19;

        if (!v90) {
          goto LABEL_77;
        }
        unsigned int v21 = [v89 largestRoadClass];
        unsigned int v22 = [v90 largestRoadClass];
        float v23 = &v89;
        if (v21 <= v22) {
          float v23 = &v90;
        }
        char v91 = [*v23 largestRoadClass];
        LODWORD(v24) = (unint64_t)[v89 routeOffset] >> 32;
        if (*(float *)&v24 < 0.0 && COERCE_FLOAT((unint64_t)objc_msgSend(v90, "routeOffset", v24) >> 32) < 0.0) {
          goto LABEL_77;
        }
        if (!v13 || !*(unsigned char *)v13)
        {
LABEL_49:
          if (v16 && *(unsigned char *)v16)
          {
            {
              operator new();
            }
            uint64_t v84 = mdm::Allocator::instance(void)::alloc;
            size_t v38 = strlen((const char *)v16);
            if (v38 > 0x7FFFFFFFFFFFFFF7) {
              abort();
            }
            size_t v39 = v38;
            if (v38 >= 0x17)
            {
              uint64_t v41 = (v38 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v38 | 7) != 0x17) {
                uint64_t v41 = v38 | 7;
              }
              uint64_t v42 = v41 + 1;
              p_dst = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                                     + 16))(mdm::Allocator::instance(void)::alloc, v41 + 1, 1);
              size_t v82 = v39;
              unint64_t v83 = v42 | 0x8000000000000000;
              __dst = p_dst;
            }
            else
            {
              HIBYTE(v83) = v38;
              p_dst = &__dst;
              if (!v38) {
                goto LABEL_60;
              }
            }
            memmove(p_dst, (const void *)v16, v39);
LABEL_60:
            *((unsigned char *)p_dst + v39) = 0;
            v43 = std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,mdm::Allocator>>::find<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>(p_routeFeatureMap, (uint64_t)&__dst);
            if (SHIBYTE(v83) < 0) {
              (*(void (**)(uint64_t, void *, unint64_t))(*(void *)v84 + 40))(v84, __dst, v83 & 0x7FFFFFFFFFFFFFFFLL);
            }
            if (!v43) {
              operator new();
            }
            v44 = (uint64_t *)v43[6];
            unint64_t v45 = v44[9];
            if (v45 >= v44[10])
            {
              v51 = std::vector<NavRoadSegment,geo::StdAllocator<NavRoadSegment,mdm::Allocator>>::__push_back_slow_path<NavRoadSegment const&>(v44 + 8, (uint64_t)&v85);
            }
            else
            {
              if (v45)
              {
                *(void *)unint64_t v45 = 0;
                *(void *)(v45 + 8) = 0;
                uint64_t v46 = v88;
                *(void *)(v45 + 16) = 0;
                *(void *)(v45 + 24) = v46;
                v47 = v85;
                v48 = v86;
                uint64_t v49 = v86 - v85;
                if (v86 != v85)
                {
                  if (v49 < 0) {
                    abort();
                  }
                  v50 = (_OWORD *)(*(uint64_t (**)(uint64_t, int64_t, uint64_t))(*(void *)v46 + 16))(v46, v86 - v85, 8);
                  *(void *)unint64_t v45 = v50;
                  *(void *)(v45 + 8) = v50;
                  *(void *)(v45 + 16) = &v50[v49 >> 4];
                  do
                  {
                    if (v50) {
                      _OWORD *v50 = *(_OWORD *)v47;
                    }
                    v47 += 16;
                    ++v50;
                  }
                  while (v47 != v48);
                  *(void *)(v45 + 8) = v50;
                }
                *(void *)(v45 + 32) = v89;
                *(void *)(v45 + 40) = v90;
                *(unsigned char *)(v45 + 48) = v91;
              }
              v51 = (void *)(v45 + 56);
              v44[9] = v45 + 56;
            }
            v44[9] = (uint64_t)v51;
          }
LABEL_77:

          if (v85)
          {
            v86 = v85;
            (*(void (**)(uint64_t, char *, uint64_t))(*(void *)v88 + 40))(v88, v85, v87 - (void)v85);
          }
          goto LABEL_79;
        }
        {
          operator new();
        }
        uint64_t v84 = mdm::Allocator::instance(void)::alloc;
        size_t v25 = strlen((const char *)v13);
        if (v25 > 0x7FFFFFFFFFFFFFF7) {
          abort();
        }
        size_t v26 = v25;
        if (v25 >= 0x17)
        {
          uint64_t v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v25 | 7) != 0x17) {
            uint64_t v28 = v25 | 7;
          }
          uint64_t v29 = v28 + 1;
          uint64_t v27 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                               + 16))(mdm::Allocator::instance(void)::alloc, v28 + 1, 1);
          size_t v82 = v26;
          unint64_t v83 = v29 | 0x8000000000000000;
          __dst = v27;
        }
        else
        {
          HIBYTE(v83) = v25;
          uint64_t v27 = &__dst;
          if (!v25) {
            goto LABEL_32;
          }
        }
        memmove(v27, (const void *)v13, v26);
LABEL_32:
        *((unsigned char *)v27 + v26) = 0;
        long long v30 = std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,mdm::Allocator>>::find<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>(p_routeFeatureMap, (uint64_t)&__dst);
        if (SHIBYTE(v83) < 0) {
          (*(void (**)(uint64_t, void *, unint64_t))(*(void *)v84 + 40))(v84, __dst, v83 & 0x7FFFFFFFFFFFFFFFLL);
        }
        if (!v30) {
          operator new();
        }
        double v31 = (uint64_t *)v30[6];
        unint64_t v32 = v31[9];
        if (v32 >= v31[10])
        {
          v37 = std::vector<NavRoadSegment,geo::StdAllocator<NavRoadSegment,mdm::Allocator>>::__push_back_slow_path<NavRoadSegment const&>(v31 + 8, (uint64_t)&v85);
        }
        else
        {
          if (v32)
          {
            *(void *)unint64_t v32 = 0;
            *(void *)(v32 + 8) = 0;
            uint64_t v33 = v88;
            *(void *)(v32 + 16) = 0;
            *(void *)(v32 + 24) = v33;
            v35 = v85;
            v34 = v86;
            if (v86 != v85)
            {
              if (v86 - v85 < 0) {
                abort();
              }
              uint64_t v71 = v86 - v85;
              v36 = (_OWORD *)(*(uint64_t (**)(uint64_t))(*(void *)v33 + 16))(v33);
              *(void *)unint64_t v32 = v36;
              *(void *)(v32 + 8) = v36;
              *(void *)(v32 + 16) = &v36[v71 >> 4];
              do
              {
                if (v36) {
                  _OWORD *v36 = *(_OWORD *)v35;
                }
                v35 += 16;
                ++v36;
              }
              while (v35 != v34);
              *(void *)(v32 + 8) = v36;
            }
            *(void *)(v32 + 32) = v89;
            *(void *)(v32 + 40) = v90;
            *(unsigned char *)(v32 + 48) = v91;
          }
          v37 = (void *)(v32 + 56);
          v31[9] = v32 + 56;
        }
        v31[9] = (uint64_t)v37;
        goto LABEL_49;
      }
LABEL_88:

      self->_routeFeatureMapValid = 1;
    }
    v52 = [(NSMutableArray *)self->_junctions objectAtIndexedSubscript:0];
    [v52 worldUnitsPerMeter];
    double v54 = v53;

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v55 = [(NSMutableDictionary *)self->_tileDatasByIndex objectEnumerator];
    uint64_t v56 = [v55 countByEnumeratingWithState:&v77 objects:v97 count:16];
    if (v56)
    {
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      double v59 = v54 * 50.0 * (v54 * 50.0);
      uint64_t v60 = *(void *)v78;
      while (2)
      {
        uint64_t v61 = 0;
        uint64_t v62 = v58 + 1;
        v58 += v56;
        do
        {
          if (*(void *)v78 != v60) {
            objc_enumerationMutation(v55);
          }
          v63 = *(void **)(*((void *)&v77 + 1) + 8 * v61);
          if (([v63 oppositeCarriagewayJunctionsValid] & 1) == 0)
          {
            [v63 findOppositeCarriagewayJunctionsWithRouteFeatures:&self->_routeFeatureMap distanceThreshold:v59];
            if (v57)
            {

              return 0;
            }
            uint64_t v57 = 1;
          }
          if ((unint64_t)(v62 + v61) > 0xB) {
            goto LABEL_100;
          }
          ++v61;
        }
        while (v56 != v61);
        uint64_t v56 = [v55 countByEnumeratingWithState:&v77 objects:v97 count:16];
        if (v56) {
          continue;
        }
        break;
      }
    }
LABEL_100:

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v64 = [(NSMutableDictionary *)self->_tileDatasByIndex objectEnumerator];
    uint64_t v65 = [v64 countByEnumeratingWithState:&v73 objects:v96 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v74 != v66) {
            objc_enumerationMutation(v64);
          }
          v68 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          if ([v68 oppositeCarriagewayJunctionsValid])
          {
            oppositeCarriagewayJunctions = self->_oppositeCarriagewayJunctions;
            v70 = [v68 oppositeCarriagewayJunctions];
            [(NSMutableArray *)oppositeCarriagewayJunctions addObjectsFromArray:v70];
          }
        }
        uint64_t v65 = [v64 countByEnumeratingWithState:&v73 objects:v96 count:16];
      }
      while (v65);
    }

    [(NSMutableArray *)self->_oppositeCarriagewayJunctions removeObjectsInArray:self->_junctions];
    [(NSMutableArray *)self->_oppositeCarriagewayJunctions sortUsingComparator:&__block_literal_global_108];
  }
  BOOL result = 1;
  self->_oppositeCarriagewayJunctionsValid = 1;
  return result;
}

uint64_t __72__VKLabelNavRoadGraph_junctionlist__prepareOppositeCarriagewayJunctions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3 = *(double *)(a2 + 200);
  double v4 = *(double *)(a3 + 200);
  if (v3 < v4) {
    return -1;
  }
  else {
    return v3 > v4;
  }
}

- (id)oppositeCarriagewayJunctions
{
  return self->_oppositeCarriagewayJunctions;
}

- (unsigned)computeRoutePositionForPOIAtPixel:(const void *)a3 currentPosition:(unsigned __int8)a4 context:(NavContext *)a5
{
  int v6 = a4;
  if (!self->_screenRouteValid) {
    [(VKLabelNavRoadGraph *)self _transformRouteToScreenWithContext:a5];
  }
  unint64_t firstPOIAligningRouteSegment = self->_firstPOIAligningRouteSegment;
  begin = self->_screenRouteSegments.__begin_;
  unint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((self->_screenRouteSegments.__end_ - begin) >> 2);
  if (firstPOIAligningRouteSegment >= v11) {
    goto LABEL_12;
  }
  float v12 = *((float *)a5->var1 + 44);
  float v13 = (float)(v12 * 140.0) * (float)(v12 * 140.0);
  float v14 = *(float *)a3;
  float v15 = *((float *)a3 + 1);
  unint64_t v16 = (float *)((char *)begin + 20 * firstPOIAligningRouteSegment);
  float v18 = *v16;
  float v17 = v16[1];
  float v19 = v16[2] - *v16;
  float v20 = v16[3] - v17;
  float v21 = (float)(v19 * v19) + (float)(v20 * v20);
  if (v21 > 1.0e-15)
  {
    float v22 = v14 - v18;
    float v23 = v15 - v17;
    float v24 = (float)((float)(v14 - v18) * v19) + (float)((float)(v15 - v17) * v20);
    if (v24 >= 0.0 && v24 <= v21)
    {
      float v26 = fminf(fmaxf(v24 / v21, 0.0), 1.0);
      float v27 = (float)((float)(v14 - (float)(v18 + (float)(v26 * v19))) * (float)(v14 - (float)(v18 + (float)(v26 * v19))))
          + (float)((float)(v15 - (float)(v17 + (float)(v26 * v20))) * (float)(v15 - (float)(v17 + (float)(v26 * v20))));
      if (v27 < v13) {
        goto LABEL_37;
      }
    }
  }
  if (firstPOIAligningRouteSegment + 1 == v11)
  {
LABEL_12:
    BOOL v28 = 0;
    int v29 = 9;
    goto LABEL_40;
  }
  long long v30 = (float *)((char *)begin + 20 * firstPOIAligningRouteSegment++ + 36);
  while (1)
  {
    float v34 = *(v30 - 2);
    float v35 = *(v30 - 1);
    float v37 = *(v30 - 4);
    float v36 = *(v30 - 3);
    float v19 = v34 - v37;
    float v20 = v35 - v36;
    float v22 = v14 - v37;
    float v23 = v15 - v36;
    float v38 = (float)(v19 * v19) + (float)(v20 * v20);
    float v39 = (float)((float)(v14 - v37) * (float)(v34 - v37)) + (float)((float)(v15 - v36) * (float)(v35 - v36));
    if (v38 <= 1.0e-15) {
      break;
    }
    if (v39 < 0.0 || v39 > v38) {
      break;
    }
    float v41 = fminf(fmaxf(v39 / v38, 0.0), 1.0);
    float v27 = (float)((float)(v14 - (float)(v37 + (float)(v41 * v19))) * (float)(v14 - (float)(v37 + (float)(v41 * v19))))
        + (float)((float)(v15 - (float)(v36 + (float)(v41 * v20))) * (float)(v15 - (float)(v36 + (float)(v41 * v20))));
    if (v27 < v13) {
      goto LABEL_37;
    }
LABEL_21:
    ++firstPOIAligningRouteSegment;
    v30 += 5;
    if (v11 == firstPOIAligningRouteSegment) {
      goto LABEL_12;
    }
  }
  int v31 = *(unsigned __int8 *)v30;
  BOOL v32 = v39 < 0.0;
  float v27 = (float)((float)(v14 - v34) * (float)(v14 - v34)) + (float)((float)(v15 - v35) * (float)(v15 - v35));
  if (*(unsigned char *)v30) {
    BOOL v32 = v39 > v38;
  }
  else {
    float v27 = (float)(v22 * v22) + (float)(v23 * v23);
  }
  if (!v32 || v27 >= v13) {
    goto LABEL_21;
  }
  uint64_t v42 = (char *)begin + 20 * firstPOIAligningRouteSegment - 20;
  int v43 = v42[16];
  uint64_t v44 = *(void *)v42;
  uint64_t v45 = *(void *)((char *)begin + 20 * firstPOIAligningRouteSegment - 12);
  if (v43) {
    uint64_t v46 = v44;
  }
  else {
    uint64_t v46 = *(void *)((char *)begin + 20 * firstPOIAligningRouteSegment - 12);
  }
  v47 = v30 - 4;
  v48 = v30 - 2;
  if (!v31) {
    v48 = v47;
  }
  float v49 = v14 - *(float *)&v44;
  float v50 = v15 - *((float *)&v44 + 1);
  if (v46 == *(void *)v48)
  {
    --firstPOIAligningRouteSegment;
    float v20 = *((float *)&v45 + 1) - *((float *)&v44 + 1);
    float v19 = *(float *)&v45 - *(float *)&v44;
    float v23 = v50;
    float v22 = v49;
  }
LABEL_37:
  BOOL v28 = v27 > (float)((float)(v12 * 130.0) * (float)(v12 * 130.0));
  float v51 = -(float)((float)(v22 * v20) - (float)(v23 * v19));
  float v52 = -(float)((float)(v23 * v19) - (float)(v22 * v20));
  if (*((unsigned char *)begin + 20 * firstPOIAligningRouteSegment + 17)) {
    float v51 = v52;
  }
  int v29 = 4 * (v51 > 0.0);
LABEL_40:
  if ((((v6 != 9) ^ (v29 != 9)) & v28) != 0) {
    unsigned __int8 v53 = v6;
  }
  else {
    unsigned __int8 v53 = v29;
  }
  if (v29 == v6) {
    return v6;
  }
  else {
    return v53;
  }
}

- (BOOL)collideRouteWithLabel:(id)a3 routeCrossProduct:(float *)a4 context:(NavContext *)a5
{
  id v8 = a3;
  if (!self->_screenRouteValid) {
    [(VKLabelNavRoadGraph *)self _transformRouteToScreenWithContext:a5];
  }
  uint64_t v9 = [v8 label];
  begin = self->_screenRouteSegments.__begin_;
  end = self->_screenRouteSegments.__end_;
  if (begin == end)
  {
LABEL_7:
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v12 = *(void *)v9;
    long long v19 = *(_OWORD *)(*(void *)v9 + 336);
    while (1)
    {
      long long v20 = v19;
      float v13 = *(float *)begin;
      float v14 = *((float *)begin + 1);
      float v15 = *((float *)begin + 2);
      float v16 = *((float *)begin + 3);
      if (lineSegmentIntersectsRectangle((float *)&v20, *(float *)begin, v14, v15, v16)) {
        break;
      }
      begin = (RouteSegment *)((char *)begin + 20);
      if (begin == end) {
        goto LABEL_7;
      }
    }
    *a4 = (float)((float)(v13 - *(float *)(v12 + 328)) * (float)(v16 - v14))
        + (float)((float)(*(float *)(v12 + 332) - v14) * (float)(v15 - v13));
    BOOL v17 = 1;
  }

  return v17;
}

- (void)_transformRouteToScreenWithContext:(NavContext *)a3
{
  if (!self->_screenRouteValid)
  {
    if (!self->_simplifiedRouteValid) {
      [(VKLabelNavRoadGraph *)self _updateSimplifiedRoute];
    }
    self->_screenRouteValid = 1;
    self->_screenRouteSegments.__end_ = self->_screenRouteSegments.__begin_;
    self->_unint64_t firstPOIAligningRouteSegment = 0;
    var3 = a3->var3;
    double v6 = *((double *)var3 + 35);
    double v80 = *((double *)var3 + 17);
    double v81 = *((double *)var3 + 34);
    double v7 = *((double *)var3 + 19);
    double v79 = *((double *)var3 + 18);
    double v8 = *((double *)var3 + 20);
    double v9 = *((double *)var3 + 21);
    double v10 = *((double *)var3 + 22);
    uint64_t v11 = *((void *)var3 + 133);
    v82[0] = 0;
    v82[1] = v11;
    begin = self->_simplifiedRoutePoints.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * ((self->_simplifiedRoutePoints.__end_ - begin) >> 4) >= 2)
    {
      unint64_t v13 = 1;
      do
      {
        if (self->_currentRoadStartSimplifiedPointIndex == v13 - 1) {
          self->_unint64_t firstPOIAligningRouteSegment = 0xCCCCCCCCCCCCCCCDLL
        }
                                              * ((self->_screenRouteSegments.__end_ - self->_screenRouteSegments.__begin_) >> 2);
        md::NavContext::worldPoint((md::NavContext *)*((unsigned __int8 *)a3->var3 + 8), (const md::LabelPoint *)((char *)begin + 48 * v13 - 48));
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        md::NavContext::worldPoint((md::NavContext *)*((unsigned __int8 *)a3->var3 + 8), (const md::LabelPoint *)((char *)self->_simplifiedRoutePoints.__begin_ + 48 * v13));
        double v24 = (v16 - v80) * v8 + (v18 - v79) * v9 + (v20 - v7) * v10;
        double v25 = (v21 - v80) * v8 + (v22 - v79) * v9 + (v23 - v7) * v10;
        if (v24 <= v25)
        {
          double v26 = (v16 - v80) * v8 + (v18 - v79) * v9 + (v20 - v7) * v10;
          double v27 = (v21 - v80) * v8 + (v22 - v79) * v9 + (v23 - v7) * v10;
          double v28 = v21;
          double v29 = v22;
          double v30 = v23;
          double v21 = v16;
          double v22 = v18;
          double v23 = v20;
        }
        else
        {
          double v26 = (v21 - v80) * v8 + (v22 - v79) * v9 + (v23 - v7) * v10;
          double v27 = (v16 - v80) * v8 + (v18 - v79) * v9 + (v20 - v7) * v10;
          double v28 = v16;
          double v29 = v18;
          double v30 = v20;
        }
        if (v27 >= v81 && v26 <= v6)
        {
          double v32 = v27 - v26;
          BOOL v33 = v26 >= v81 || v32 <= 2.22044605e-16;
          double v34 = v21;
          double v35 = v22;
          double v36 = v23;
          if (!v33)
          {
            double v37 = (v81 - v26) / v32;
            double v34 = v21 + (v28 - v21) * v37;
            double v35 = v22 + (v29 - v22) * v37;
            double v36 = v23 + (v30 - v23) * v37;
          }
          if (v27 > v6 && v32 > 2.22044605e-16)
          {
            double v39 = (v6 - v26) / v32;
            double v28 = v21 + (v28 - v21) * v39;
            double v29 = v22 + (v29 - v22) * v39;
            double v30 = v23 + (v30 - v23) * v39;
          }
          if (v24 <= v25)
          {
            double v40 = v36;
            double v41 = v35;
            double v42 = v34;
            double v36 = v30;
            double v35 = v29;
            double v34 = v28;
          }
          else
          {
            double v40 = v30;
            double v41 = v29;
            double v42 = v28;
          }
          int v43 = a3->var3;
          double v44 = *((double *)v43 + 111);
          double v45 = *((double *)v43 + 115);
          double v46 = *((double *)v43 + 123);
          double v47 = *((double *)v43 + 119);
          double v48 = 1.0 / (v46 + v44 * v42 + v45 * v41 + v47 * v40);
          float64x2_t v49 = *((float64x2_t *)v43 + 54);
          float64x2_t v50 = *((float64x2_t *)v43 + 56);
          float64x2_t v51 = vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v43 + 60), v49, v42), v50, v41);
          float64x2_t v52 = *((float64x2_t *)v43 + 58);
          float32x2_t v53 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(v51, v52, v40), v48));
          float32x2_t v54 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v43 + 60), v49, v34), v50, v35), v52, v36), 1.0 / (v46 + v44 * v34 + v45 * v35 + v47 * v36)));
          float v55 = v53.f32[1];
          float v56 = v54.f32[1];
          float32x2_t v76 = v54;
          float32x2_t v77 = v53;
          if (lineSegmentIntersectsRectangle((float *)v82, v53.f32[0], v53.f32[1], v54.f32[0], v54.f32[1]))
          {
            BOOL v57 = (float)(v56 - v55) < 0.0;
            if ((float)(v56 - v55) < 0.0)
            {
              float v58 = fabsf(vsub_f32(v76, v77).f32[0]);
              BOOL v59 = v58 > 1.0e-15 && (float)((float)(v56 - v55) / v58) > -0.08749;
              float32x2_t v60 = v77;
              float32x2_t v61 = v76;
            }
            else
            {
              BOOL v59 = 0;
              float32x2_t v60 = v76;
              float32x2_t v61 = v77;
            }
            end = self->_screenRouteSegments.__end_;
            int8x8_t value = self->_screenRouteSegments.__end_cap_.__value_;
            if (end >= value)
            {
              v64 = self->_screenRouteSegments.__begin_;
              unint64_t v65 = 0xCCCCCCCCCCCCCCCDLL * ((end - v64) >> 2);
              unint64_t v66 = v65 + 1;
              if (v65 + 1 > 0xCCCCCCCCCCCCCCCLL) {
                abort();
              }
              unint64_t v67 = 0xCCCCCCCCCCCCCCCDLL * ((value - v64) >> 2);
              if (2 * v67 > v66) {
                unint64_t v66 = 2 * v67;
              }
              if (v67 >= 0x666666666666666) {
                unint64_t v66 = 0xCCCCCCCCCCCCCCCLL;
              }
              if (v66)
              {
                float32x2_t v78 = v61;
                uint64_t v68 = 20 * v66;
                uint64_t v69 = (*(uint64_t (**)(Allocator *, unint64_t, uint64_t))(*(void *)self->_screenRouteSegments.__end_cap_.__value__2._allocator
                                                                                        + 16))(self->_screenRouteSegments.__end_cap_.__value__2._allocator, 20 * v66, 4);
                uint64_t v70 = v69 + 20 * v65;
                unint64_t v66 = v69 + v68;
                if (v69)
                {
                  *(float32x2_t *)uint64_t v70 = v78;
                  *(float32x2_t *)(v70 + 8) = v60;
                  *(unsigned char *)(v70 + 16) = v57;
                  *(unsigned char *)(v70 + 17) = v59;
                }
              }
              else
              {
                uint64_t v70 = 20 * v65;
              }
              v72 = self->_screenRouteSegments.__begin_;
              uint64_t v71 = self->_screenRouteSegments.__end_;
              long long v73 = (RouteSegment *)v70;
              if (v71 != v72)
              {
                do
                {
                  long long v74 = *(_OWORD *)((char *)v71 - 20);
                  *((_DWORD *)v73 - 1) = *((_DWORD *)v71 - 1);
                  *(_OWORD *)((char *)v73 - 20) = v74;
                  long long v73 = (RouteSegment *)((char *)v73 - 20);
                  uint64_t v71 = (RouteSegment *)((char *)v71 - 20);
                }
                while (v71 != v72);
                uint64_t v71 = self->_screenRouteSegments.__begin_;
              }
              float v14 = (RouteSegment *)(v70 + 20);
              self->_screenRouteSegments.__begin_ = v73;
              self->_screenRouteSegments.__end_ = (RouteSegment *)(v70 + 20);
              long long v75 = self->_screenRouteSegments.__end_cap_.__value_;
              self->_screenRouteSegments.__end_cap_.__value_ = (RouteSegment *)v66;
              if (v71) {
                (*(void (**)(Allocator *, RouteSegment *, int64_t))(*(void *)self->_screenRouteSegments.__end_cap_.__value__2._allocator
              }
                                                                                    + 40))(self->_screenRouteSegments.__end_cap_.__value__2._allocator, v71, v75 - v71);
            }
            else
            {
              if (end)
              {
                *(float32x2_t *)end = v61;
                *((float32x2_t *)end + 1) = v60;
                *((unsigned char *)end + 16) = v57;
                *((unsigned char *)end + 17) = v59;
              }
              float v14 = (RouteSegment *)((char *)end + 20);
            }
            self->_screenRouteSegments.__end_ = v14;
            if (0xCCCCCCCCCCCCCCCDLL * ((v14 - self->_screenRouteSegments.__begin_) >> 2) > 0x13) {
              break;
            }
          }
        }
        ++v13;
        begin = self->_simplifiedRoutePoints.__begin_;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((self->_simplifiedRoutePoints.__end_ - begin) >> 4) > v13);
    }
  }
}

- (void)_updateSimplifiedRoute
{
  v47[16] = *MEMORY[0x1E4F143B8];
  if (self->_simplifiedRouteValid) {
    return;
  }
  self->_simplifiedRouteValid = 1;
  self->_simplifiedRoutePoints.__end_ = self->_simplifiedRoutePoints.__begin_;
  self->_currentRoadStartSimplifiedPointIndex = 0;
  if (![(NSMutableArray *)self->_junctions count]) {
    return;
  }
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  {
    operator new();
  }
  uint64_t v46 = mdm::Allocator::instance(void)::alloc;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  {
    operator new();
  }
  uint64_t v42 = mdm::Allocator::instance(void)::alloc;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v3 = self->_junctions;
  unint64_t v4 = 0;
  uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v8 isOnRoute])
        {
          double v9 = [v8 outgoingRoad];
          BOOL v10 = v9 == 0;

          if (!v10)
          {
            uint64_t v11 = [v8 routeOffset];
            unsigned int index = self->_routeUserOffset.index;
            if (index > v11
              || index == v11 && self->_routeUserOffset.offset >= *((float *)&v11 + 1))
            {
              unint64_t v4 = (v44 - v43) >> 4;
            }
            unint64_t v13 = [v8 outgoingRoad];
            [v13 appendSimplifiedWorldRoadPoints:&v43 pointElevations:&v39];
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v5);
  }

  uint64_t v15 = v44 - v43;
  if ((unint64_t)(v44 - v43) <= 0x4001)
  {
    MEMORY[0x1F4188790](v14);
    double v17 = (uint64_t *)((char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v17, v16);
    goto LABEL_23;
  }
  double v17 = malloc_type_malloc(v15 >> 1, 0x100004000313F17uLL);
  if (v17)
  {
LABEL_23:
    double v18 = [(NSMutableArray *)self->_junctions objectAtIndexedSubscript:0];
    [v18 worldUnitsPerMeter];
    double v20 = v19;

    uint64_t v21 = v43;
    unint64_t v22 = (v44 - v43) >> 4;
    if ((unint64_t)(v44 - v43) > 0x2F)
    {
      uint64_t v34 = 1;
      *double v17 = 0;
      unint64_t v24 = v22 - 1;
      geo::dpSimplifyViaIndexes<gm::Matrix<double,2,1>,unsigned long>(v21, 0, v22 - 1, (uint64_t)v17, &v34, v20 * 8.0);
      uint64_t v25 = v34;
      unint64_t v22 = v34 + 1;
      v17[v34] = v24;
      if (v25 == -1)
      {
LABEL_38:
        if ((unint64_t)v15 >= 0x4002) {
          free(v17);
        }
        goto LABEL_40;
      }
    }
    else
    {
      if (v44 != v43)
      {
        uint64_t v23 = 0;
        do
        {
          v17[v23] = v23;
          ++v23;
        }
        while (v22 != v23);
      }
      if (!v22) {
        goto LABEL_38;
      }
    }
    begin = self->_simplifiedRoutePoints.__begin_;
    unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((self->_simplifiedRoutePoints.__end_ - begin) >> 4);
    if (v22 <= v27)
    {
      if (v22 < v27) {
        self->_simplifiedRoutePoints.__end_ = (LabelPoint *)((char *)begin + 48 * v22);
      }
    }
    else
    {
      std::vector<md::LabelPoint,geo::StdAllocator<md::LabelPoint,mdm::Allocator>>::__append((uint64_t)&self->_simplifiedRoutePoints, v22 - v27);
      begin = self->_simplifiedRoutePoints.__begin_;
    }
    unint64_t v28 = 0;
    uint64_t v29 = v43;
    uint64_t v30 = v39;
    int v31 = (char *)begin + 46;
    do
    {
      unint64_t v32 = v17[v28];
      if (v32 <= v4) {
        self->_currentRoadStartSimplifiedPointIndex = v28;
      }
      *(_OWORD *)(v31 - 22) = *(_OWORD *)(v29 + 16 * v32);
      *(_WORD *)(v31 - 1) = 257;
      *(_DWORD *)(v31 - 6) = *(_DWORD *)(v30 + 4 * v32);
      ++v28;
      v31 += 48;
    }
    while (v22 != v28);
    goto LABEL_38;
  }
LABEL_40:
  if (v39)
  {
    uint64_t v40 = v39;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v42 + 40))(v42, v39, v41 - v39);
  }
  if (v43)
  {
    uint64_t v44 = v43;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v46 + 40))(v46, v43, v45 - v43);
  }
}

- (BOOL)isPriorRouteCollinearWithRoad:(id)a3 distance:(float)a4
{
  id v7 = a3;
  [v7 routeCrossProduct];
  if (fabsf(v8) > 0.2
    || (junctions = self->_junctions,
        [v7 navJunctionA],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [(NSMutableArray *)junctions indexOfObject:v10],
        v10,
        v11 == 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v12 = 0;
  }
  else
  {
    [v7 direction2D];
    if (v11 - 1 < 0)
    {
LABEL_12:
      char v28 = 0;
    }
    else
    {
      float v15 = v13;
      float v16 = v14;
      double v17 = a4;
      double v18 = 0.0;
      while (1)
      {
        double v19 = [(NSMutableArray *)self->_junctions objectAtIndex:--v11];
        if ([v19 isOnRoute])
        {
          double v20 = [v19 outgoingRoad];

          if (v20)
          {
            uint64_t v21 = [v19 outgoingRoad];
            [v21 direction2D];
            float v24 = -(float)((float)(v22 * v15) - (float)(v23 * v16));

            float v25 = fabsf(v24);
            BOOL v4 = v25 <= 0.2;
            if (v25 > 0.2) {
              break;
            }
            double v26 = [v19 outgoingRoad];
            [v26 length];
            double v18 = v27 + v18;

            if (v18 >= v17) {
              break;
            }
          }
        }

        if (v11 <= 0) {
          goto LABEL_12;
        }
      }

      char v28 = 1;
    }
    BOOL v12 = v28 & v4;
  }

  return v12;
}

- (void)_findOffRouteJunctions
{
  [(NSMutableArray *)self->_offRouteJunctions removeAllObjects];
  signed int v3 = vcvtd_n_s64_f64(self->_offRouteJunctionSelectRect._minimum._e[0], 0xFuLL);
  signed int v4 = vcvtd_n_s64_f64(self->_offRouteJunctionSelectRect._maximum._e[1], 0xFuLL);
  signed int v5 = vcvtd_n_s64_f64(self->_offRouteJunctionSelectRect._maximum._e[0], 0xFuLL);
  signed int v6 = vcvtd_n_s64_f64(self->_offRouteJunctionSelectRect._minimum._e[1], 0xFuLL);
  int v7 = v5 - v3 + 1 + (v5 - v3 + 1) * (v4 - v6);
  if (v7 < 0) {
    int v7 = -v7;
  }
  if (v7 <= 0x19)
  {
    if (v5 >= v3 && v4 >= v6)
    {
      int v10 = 0x7FFF - v6;
      uint64_t v18 = 0x7FFF - v4;
      if (0x7FFF - v4 > v10) {
        int v10 = 0x7FFF - v4;
      }
      uint64_t v11 = v3;
      int v12 = v5 + 1;
      int v13 = v4 - 32766 + v10;
      do
      {
        int v14 = v13;
        uint64_t v15 = v18;
        do
        {
          tileDatasByIndex = self->_tileDatasByIndex;
          objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", v11, v15);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          double v17 = -[NSMutableDictionary objectForKey:](tileDatasByIndex, "objectForKey:");

          if (v17) {
            [v17 appendNavJunctionsInWorldRect:&self->_offRouteJunctionSelectRect junctions:self->_offRouteJunctions];
          }

          ++v15;
          --v14;
        }
        while (v14);
        ++v11;
      }
      while (v12 != v11);
    }
    offRouteJunctions = self->_offRouteJunctions;
    id v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_106];
    -[NSMutableArray filterUsingPredicate:](offRouteJunctions, "filterUsingPredicate:");
  }
}

uint64_t __59__VKLabelNavRoadGraph_junctionlist___findOffRouteJunctions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isOffRouteGraph])
  {
    if ([v2 isIntersection]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [v2 isRoadTerminus];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)offRouteGraphJunctionsWithNavContext:(NavContext *)a3 maxJunctions:(unint64_t)a4 isOnRoute:(BOOL)a5
{
  BOOL v91 = a5;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  var3 = a3->var3;
  long double v9 = exp(*((double *)var3 + 30) * 6.28318531 + -3.14159265);
  long double v10 = atan(v9) * 114.591559 + -90.0;
  double v11 = cos(v10 * 0.034906585);
  double v12 = cos(v10 * 0.0698131701);
  double v13 = cos(v10 * 0.104719755);
  long double v14 = v10 * 0.00872664626;
  long double v15 = tan(v10 * 0.00872664626 + 0.78103484);
  double v16 = log(v15);
  long double v17 = tan(v14 + 0.789761487);
  double v18 = log(v17);
  var4 = a3->var4;
  double v21 = *(double *)var4;
  double v20 = *((double *)var4 + 1);
  double v22 = *((double *)var4 + 2);
  double v23 = *((double *)var4 + 3);
  if (!self->_offRouteJunctionsValid
    || v21 < self->_offRouteJunctionSelectRect._minimum._e[0]
    || v22 > self->_offRouteJunctionSelectRect._maximum._e[0]
    || v20 < self->_offRouteJunctionSelectRect._minimum._e[1]
    || v23 > self->_offRouteJunctionSelectRect._maximum._e[1])
  {
    if (v22 >= v21 && v23 >= v20)
    {
      double v24 = fabs((v18 - v16) * 0.159154943) * -250.0 / (v11 * -559.82 + 111132.92 + v12 * 1.175 + v13 * -0.0023);
      double v21 = v21 + v24;
      double v22 = v22 - v24;
      double v20 = v20 + v24;
      double v23 = v23 - v24;
    }
    self->_offRouteJunctionSelectRect._minimum._e[0] = v21;
    self->_offRouteJunctionSelectRect._minimum._e[1] = v20;
    self->_offRouteJunctionSelectRect._maximum._e[0] = v22;
    self->_offRouteJunctionSelectRect._maximum._e[1] = v23;
    [(VKLabelNavRoadGraph *)self _findOffRouteJunctions];
    self->_offRouteJunctionsValid = 1;
    var3 = a3->var3;
  }
  float v25 = *((float *)var3 + 266);
  float v26 = *((float *)var3 + 267);
  if (v91) {
    float v27 = 0.7;
  }
  else {
    float v27 = 0.5;
  }
  v98 = 0;
  uint64_t v99 = 0;
  unint64_t v100 = 0;
  {
    operator new();
  }
  uint64_t v101 = mdm::Allocator::instance(void)::alloc;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  char v28 = self->_offRouteJunctions;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v94 objects:v102 count:16];
  unint64_t v89 = a4;
  uint64_t v30 = 0;
  if (v29)
  {
    float v90 = v25 * 0.5;
    uint64_t v31 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v95 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v34 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        long long v35 = (double *)[v34 mercatorCoordinate];
        long long v36 = a3->var3;
        double v37 = *((float *)v36 + 12);
        double v39 = *v35;
        double v38 = v35[1];
        double v40 = v35[2];
        if (*((unsigned char *)v36 + 8))
        {
          double v41 = v37 * 0.0000000249532021 * v40;
        }
        else
        {
          double v42 = v40 * v37;
          long double v43 = v39 * 6.28318531;
          long double v44 = exp(v38 * 6.28318531 + -3.14159265);
          double v45 = atan(v44) * 2.0 + -1.57079633;
          long double v46 = fmod(v43, 6.28318531);
          double v47 = fmod(v46 + 6.28318531, 6.28318531) + -3.14159265;
          __double2 v48 = __sincos_stret(v45);
          double v49 = 6378137.0 / sqrt(v48.__sinval * v48.__sinval * -0.00669437999 + 1.0);
          double v50 = (v49 + v42) * v48.__cosval;
          __double2 v51 = __sincos_stret(v47);
          double v39 = v50 * v51.__cosval;
          double v38 = v50 * v51.__sinval;
          double v41 = (v42 + v49 * 0.99330562) * v48.__sinval;
        }
        float32x2_t v52 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v36 + 60), *((float64x2_t *)v36 + 54), v39), *((float64x2_t *)v36 + 56), v38), *((float64x2_t *)v36 + 58), v41), 1.0/ (*((double *)v36 + 123)+ *((double *)v36 + 111) * v39+ *((double *)v36 + 115) * v38+ *((double *)v36 + 119) * v41)));
        float32x2_t v53 = a3->var4;
        if (v52.f32[0] >= *((float *)v53 + 12) && v52.f32[0] < *((float *)v53 + 14))
        {
          float32x2_t v54 = v52;
          if (v52.f32[1] >= *((float *)v53 + 13) && v52.f32[1] < *((float *)v53 + 15))
          {
            id v55 = v34;

            uint64_t v30 = v55;
            int v92 = v92 & 0xFFFFFF00 | [v55 largestRoadClass];
            float v56 = v54.f32[0] - v90;
            if (v91) {
              float v56 = v56 + v56;
            }
            float v57 = (float)((float)(v54.f32[1] - (float)(v26 * v27)) * (float)(v54.f32[1] - (float)(v26 * v27)))
                + (float)(v56 * v56);
            BOOL v59 = v99;
            unint64_t v58 = v100;
            if ((unint64_t)v99 < v100)
            {
              if (v99)
              {
                *(void *)BOOL v59 = v30;
                *((_DWORD *)v59 + 2) = v92;
                v59[3] = v57;
              }
              uint64_t v33 = v59 + 4;
              goto LABEL_18;
            }
            long long v93 = v30;
            float32x2_t v60 = v98;
            uint64_t v61 = ((char *)v99 - (char *)v98) >> 4;
            unint64_t v62 = v61 + 1;
            if ((unint64_t)(v61 + 1) >> 60) {
              abort();
            }
            if ((uint64_t)(v100 - (void)v98) >> 3 > v62) {
              unint64_t v62 = (uint64_t)(v100 - (void)v98) >> 3;
            }
            if (v100 - (unint64_t)v98 >= 0x7FFFFFFFFFFFFFF0) {
              uint64_t v63 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v63 = v62;
            }
            if (v63)
            {
              uint64_t v64 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v101 + 16))(v101, 16 * v63, 8);
              unint64_t v65 = (float *)(v64 + 16 * v61);
              unint64_t v66 = v64 + 16 * v63;
              if (v64)
              {
                uint64_t v67 = v64 + 16 * v63;
                id v68 = v93;
                unint64_t v66 = v67;
                *(void *)unint64_t v65 = v68;
                *((_DWORD *)v65 + 2) = v92;
                v65[3] = v57;
              }
            }
            else
            {
              unint64_t v66 = 0;
              unint64_t v65 = (float *)(16 * v61);
            }
            uint64_t v33 = v65 + 4;
            if (v59 == v60)
            {
              v98 = v65;
              uint64_t v99 = v65 + 4;
              unint64_t v100 = v66;
            }
            else
            {
              unint64_t v69 = (char *)v59 - (char *)v60 - 16;
              if (v69 > 0x6F
                && ((unint64_t v70 = ((char *)v60 - (char *)v59 + 15) & 0xFFFFFFFFFFFFFFF0, (float *)((char *)v59 + v70) >= v65)
                 || (float *)((char *)v65 + v70) >= v59))
              {
                uint64_t v74 = 0;
                uint64_t v75 = (v69 >> 4) + 1;
                uint64_t v71 = &v59[-4 * (v75 & 0x1FFFFFFFFFFFFFFELL)];
                uint64_t v76 = v75 & 0x1FFFFFFFFFFFFFFELL;
                do
                {
                  float32x2_t v77 = &v59[v74];
                  float32x2_t v78 = (const double *)&v59[v74 - 8];
                  float64x2x2_t v105 = vld2q_f64(v78);
                  *((void *)v77 - 2) = 0;
                  *((void *)v77 - 4) = 0;
                  double v79 = (double *)&v65[v74 - 8];
                  vst2q_f64(v79, v105);
                  v74 -= 8;
                  v76 -= 2;
                }
                while (v76);
                v65 -= 4 * (v75 & 0x1FFFFFFFFFFFFFFELL);
                if (v75 != (v75 & 0x1FFFFFFFFFFFFFFELL)) {
                  goto LABEL_49;
                }
              }
              else
              {
                uint64_t v71 = v59;
                do
                {
LABEL_49:
                  uint64_t v72 = *((void *)v71 - 2);
                  v71 -= 4;
                  *(void *)uint64_t v71 = 0;
                  *((void *)v65 - 2) = v72;
                  v65 -= 4;
                  *((void *)v65 + 1) = *((void *)v71 + 1);
                }
                while (v71 != v60);
                float32x2_t v60 = v98;
                BOOL v59 = v99;
                unint64_t v58 = v100;
              }
              v98 = v65;
              uint64_t v99 = v33;
              unint64_t v100 = v66;
              if (v59 != v60)
              {
                uint64_t v30 = v93;
                do
                {
                  long long v73 = (void *)*((void *)v59 - 2);
                  v59 -= 4;
                }
                while (v59 != v60);
                BOOL v59 = v60;
                if (!v60) {
                  goto LABEL_18;
                }
LABEL_58:
                (*(void (**)(uint64_t, float *, unint64_t))(*(void *)v101 + 40))(v101, v59, v58 - (void)v59);
LABEL_18:
                uint64_t v99 = v33;
                continue;
              }
            }
            uint64_t v30 = v93;
            if (v59) {
              goto LABEL_58;
            }
            goto LABEL_18;
          }
        }
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v94 objects:v102 count:16];
    }
    while (v29);
  }

  double v80 = v98;
  double v81 = v99;
  unint64_t v82 = 126 - 2 * __clz(((char *)v99 - (char *)v98) >> 4);
  if (v99 == v98) {
    uint64_t v83 = 0;
  }
  else {
    uint64_t v83 = v82;
  }
  std::__introsort<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *,false>((uint64_t)v98, v99, v83, 1);
  uint64_t v84 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v89];
  if (v81 == v80)
  {
    if (!v80) {
      goto LABEL_77;
    }
  }
  else
  {
    v85 = v80 + 4;
    do
    {
      [v84 addObject:*((void *)v85 - 2)];
      if ([v84 count] >= v89) {
        break;
      }
      BOOL v86 = v85 == v81;
      v85 += 4;
    }
    while (!v86);
    if (!v80) {
      goto LABEL_77;
    }
    while (v81 != v80)
    {
      uint64_t v87 = (void *)*((void *)v81 - 2);
      v81 -= 4;
    }
  }
  uint64_t v99 = v80;
  (*(void (**)(uint64_t, float *, unint64_t))(*(void *)v101 + 40))(v101, v80, v100 - (void)v80);
LABEL_77:

  return v84;
}

- (void)_updateIntersectionsForDepth:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3 - 1;
  if (a3 <= 1)
  {
    if ([(NSMutableArray *)self->_intersections count])
    {
      if (!a3) {
        return;
      }
    }
    else
    {
      [(NSMutableArray *)self->_intersections addObject:self->_junctions];
      if (!a3) {
        return;
      }
    }
  }
  if ([(NSMutableArray *)self->_intersections count] >= a3)
  {
    uint64_t v17 = [(NSMutableArray *)self->_intersections objectAtIndexedSubscript:v5];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = [(NSMutableArray *)self->_intersections count];
    intersections = self->_intersections;
    if (v7 <= a3) {
      -[NSMutableArray addObject:](intersections, "addObject:", v6, v17);
    }
    else {
      -[NSMutableArray setObject:atIndexedSubscript:](intersections, "setObject:atIndexedSubscript:", v6, a3, v17);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v18;
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = v9;
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(obj);
          }
          double v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          double v12 = [v11 roads];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v23 != v14) {
                  objc_enumerationMutation(v12);
                }
                double v16 = [(VKLabelNavRoadGraph *)self _nextIntersectionForRoad:*(void *)(*((void *)&v22 + 1) + 8 * j)];
                if (([v6 containsObject:v16] & 1) == 0 && objc_msgSend(v16, "depthFromRoute") >= a3)
                {
                  [v16 setDepthFromRoute:a3];
                  objc_msgSend(v16, "setRouteOffset:", objc_msgSend(v11, "routeOffset"));
                  [v6 addObject:v16];
                }
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v13);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    [v6 sortUsingComparator:&__block_literal_global_37998];
  }
}

uint64_t __66__VKLabelNavRoadGraph_junctionlist___updateIntersectionsForDepth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = (double *)v4;
  unint64_t v7 = (double *)v5;
  double v8 = v6[25];
  double v9 = v7[25];
  if (v8 < v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = v8 > v9;
  }
  if (!v10)
  {
    double v11 = [v6 incomingRoad];
    if (v11
      && ([v7 incomingRoad],
          double v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      uint64_t v10 = -1;
    }
    else
    {
      uint64_t v13 = [v6 incomingRoad];
      if (v13)
      {

        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v14 = [v7 incomingRoad];
        uint64_t v10 = v14 != 0;
      }
    }
  }

  return v10;
}

- (id)offRouteJunctionList
{
  return self->_offRouteJunctions;
}

- (id)junctionListForDepth:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_intersections count] <= a3
    && ([(VKLabelNavRoadGraph *)self _updateIntersectionsForDepth:a3],
        [(NSMutableArray *)self->_intersections count] <= a3))
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_intersections objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (unint64_t)countReadyJunctionLists
{
  if (![(NSMutableArray *)self->_intersections count]) {
    return 1;
  }
  intersections = self->_intersections;
  return [(NSMutableArray *)intersections count];
}

- (void)evaluateDualCarriagewayForJunction:(id)a3 outputJunctionList:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v45 = a4;
  double v47 = v5;
  if ([v5 isRouteOverpass])
  {
    id v62 = [v5 overpassJunction];
    id v6 = v5;
  }
  else
  {
    id v6 = v5;
    id v62 = v5;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = [v6 roads];
  uint64_t v50 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (!v50) {
    goto LABEL_101;
  }
  uint64_t v49 = *(void *)v68;
  do
  {
    uint64_t v52 = 0;
    while (2)
    {
      if (*(void *)v68 != v49) {
        objc_enumerationMutation(obj);
      }
      unint64_t v7 = *(void **)(*((void *)&v67 + 1) + 8 * v52);
      char v8 = [v7 isOnRoute];
      [v7 length];
      double v10 = v9;
      if (v9 > 70.0) {
        goto LABEL_7;
      }
      id v11 = v47;
      id v56 = v7;
      __double2 v51 = -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:");
      if (!v51)
      {
        uint64_t v14 = 0;
        goto LABEL_90;
      }
      if (-[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:"))
      {
        char v12 = 0;
        long double v46 = v56;
        id v13 = v11;
        goto LABEL_14;
      }
      if ([v11 isRouteOverpass] && objc_msgSend(v51, "isOverpass"))
      {
        long double v15 = [(VKLabelNavRoadGraph *)self overpassJunctionForJunction:v51];
        if (v15
          && -[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:"))
        {
          long double v46 = v56;
          id v13 = v11;
LABEL_25:
          char v12 = [v15 isOnRoute];

          goto LABEL_14;
        }
      }
      long double v15 = [v51 roads];
      if (![v51 isTileEdgeJunction]) {
        goto LABEL_31;
      }
      if ([v15 count] != 1) {
        goto LABEL_31;
      }
      double v16 = [v15 objectAtIndexedSubscript:0];
      uint64_t v17 = [v16 name];
      double v18 = [v56 name];
      int v19 = [v17 isEqualToString:v18];

      if (v19)
      {
        uint64_t v20 = [v15 objectAtIndexedSubscript:0];
      }
      else
      {
LABEL_31:
        if ([v15 count] != 2) {
          goto LABEL_86;
        }
        uint64_t v21 = [v15 objectAtIndexedSubscript:0];
        if (objc_msgSend(v21, "matchesRoad:")) {
          [v15 objectAtIndexedSubscript:1];
        }
        else {
        uint64_t v20 = [v15 objectAtIndexedSubscript:0];
        }
      }
      if (!v20) {
        goto LABEL_87;
      }
      [v20 length];
      double v23 = v22 + v10;
      if (v23 > 70.0) {
        goto LABEL_87;
      }
      id v24 = v51;

      __double2 v51 = [(VKLabelNavRoadGraph *)self junctionForRoad:v20 nearJunction:0 crossTileEdge:1];

      if (!v51)
      {
        uint64_t v14 = 0;
        id v11 = v24;
        id v56 = v20;
        goto LABEL_90;
      }
      if (-[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:", v56, v62))
      {
        char v12 = 0;
        long double v46 = v20;
        id v13 = v24;
      }
      else
      {
        if ([v11 isRouteOverpass] && objc_msgSend(v51, "isOverpass"))
        {
          long double v15 = [(VKLabelNavRoadGraph *)self overpassJunctionForJunction:v51];
          if (v15
            && [(VKLabelNavRoadGraph *)self _checkIfDualCarriageWayConnectorRoad:v56 fromJunction:v62 toJunction:v15 checkShields:1])
          {
            long double v46 = v20;
            id v13 = v24;
            goto LABEL_25;
          }
        }
        long double v15 = [v51 roads];
        if (![v51 isTileEdgeJunction]) {
          goto LABEL_77;
        }
        if ([v15 count] != 1) {
          goto LABEL_77;
        }
        double v39 = [v15 objectAtIndexedSubscript:0];
        double v40 = [v39 name];
        double v41 = [v20 name];
        char v42 = [v40 isEqualToString:v41];

        if (v42)
        {
          long double v46 = [v15 objectAtIndexedSubscript:0];
        }
        else
        {
LABEL_77:
          if ([v15 count] != 2) {
            goto LABEL_85;
          }
          long double v43 = [v15 objectAtIndexedSubscript:0];
          if ([v43 matchesRoad:v20]) {
            [v15 objectAtIndexedSubscript:1];
          }
          else {
          long double v46 = [v15 objectAtIndexedSubscript:0];
          }
        }
        if (!v46)
        {
LABEL_85:
          id v56 = v20;
          id v11 = v24;
LABEL_86:
          uint64_t v20 = 0;
LABEL_87:

LABEL_88:
          id v56 = v20;
          goto LABEL_89;
        }
        [v46 length];
        if (v44 + v23 > 70.0)
        {
          float v57 = v20;
          id v11 = v24;
          uint64_t v20 = v46;

          goto LABEL_88;
        }
        id v13 = v51;

        __double2 v51 = -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:");

        if (!v51)
        {
          uint64_t v14 = 0;
          id v11 = v13;
          id v56 = v46;
          goto LABEL_90;
        }
        if (!-[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:", v56, v62))
        {
          if (![v11 isRouteOverpass] || !objc_msgSend(v51, "isOverpass"))
          {
LABEL_17:
            id v11 = v13;
            goto LABEL_18;
          }
          long double v15 = [(VKLabelNavRoadGraph *)self overpassJunctionForJunction:v51];
          if (!v15
            || ![(VKLabelNavRoadGraph *)self _checkIfDualCarriageWayConnectorRoad:v56 fromJunction:v62 toJunction:v15 checkShields:1])
          {
LABEL_64:
            id v11 = v13;
            uint64_t v20 = v46;
            goto LABEL_88;
          }
          goto LABEL_25;
        }
        char v12 = 0;
      }
LABEL_14:
      [v11 setIsOnDualCarriageway:1];
      if (v8) {
        goto LABEL_17;
      }
      [v56 setAreLabelsDisabled:1];
      if ([v51 isOnRoute] & 1) != 0 || (v12) {
        goto LABEL_17;
      }
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v54 = v13;
      long long v25 = [v51 roads];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (!v26) {
        goto LABEL_62;
      }
      uint64_t v58 = *(void *)v64;
      id v53 = v25;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v64 != v58) {
            objc_enumerationMutation(v53);
          }
          long long v28 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          long long v29 = [v62 incomingRoad];
          if (v29
            && ([v28 name],
                uint64_t v61 = objc_claimAutoreleasedReturnValue(),
                [v62 incomingRoad],
                BOOL v59 = objc_claimAutoreleasedReturnValue(),
                [v59 name],
                float32x2_t v60 = objc_claimAutoreleasedReturnValue(),
                (objc_msgSend(v61, "isEqualToString:") & 1) != 0))
          {
            LOBYTE(v30) = 1;
          }
          else
          {
            uint64_t v31 = [v62 outgoingRoad];
            if (v31)
            {
              uint64_t v32 = [v28 name];
              uint64_t v33 = [v62 outgoingRoad];
              uint64_t v34 = [v33 name];
              int v30 = [v32 isEqualToString:v34];

              if (!v29)
              {
                if (v30) {
                  goto LABEL_44;
                }
                goto LABEL_58;
              }
            }
            else
            {
              if (!v29) {
                goto LABEL_58;
              }
              LOBYTE(v30) = 0;
            }
          }

          if (v30) {
            goto LABEL_44;
          }
LABEL_58:
          id v35 = [(VKLabelNavRoadGraph *)self junctionForRoad:v28 nearJunction:0 crossTileEdge:0];
          BOOL v36 = v54 == v35;

          if (v36)
          {
LABEL_44:
            [v28 setAreLabelsDisabled:1];
            continue;
          }
          [v56 routeCrossProduct];
          objc_msgSend(v28, "setRouteCrossProduct:");
          objc_msgSend(v28, "setRouteOffset:", objc_msgSend(v56, "routeOffset"));
        }
        long long v25 = v53;
        uint64_t v26 = [v53 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v26);
LABEL_62:

      objc_msgSend(v51, "setRouteOffset:", objc_msgSend(v56, "routeOffset"));
      [v51 setIsOnDualCarriageway:1];
      [v45 addObject:v51];
      double v37 = [v62 incomingRoad];
      BOOL v38 = v37 == 0;

      if (!v38)
      {
        id v13 = v54;
        long double v15 = [v62 incomingRoad];
        [v15 direction2D];
        objc_msgSend(v51, "setSharedRouteDirection:");
        goto LABEL_64;
      }
      id v11 = v54;
LABEL_18:
      id v56 = v46;
LABEL_89:
      uint64_t v14 = v51;
LABEL_90:

LABEL_7:
      if (++v52 != v50) {
        continue;
      }
      break;
    }
    uint64_t v50 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
  }
  while (v50);
LABEL_101:
}

- (BOOL)_checkIfDualCarriageWayConnectorRoad:(id)a3 fromJunction:(id)a4 toJunction:(id)a5 checkShields:(BOOL)a6
{
  BOOL v42 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v39 = a4;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = [a5 roads];
  uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v8)
  {
    uint64_t v37 = 0;
    BOOL v38 = 0;
    uint64_t v43 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v53 != v43) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v11 = [v10 name];
        if (v11)
        {
          char v12 = [v10 name];
          id v13 = [v41 name];
          char v14 = [v12 isEqualToString:v13];

          if ((v14 & 1) == 0)
          {
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long double v15 = [v39 roads];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v49;
LABEL_12:
              uint64_t v18 = 0;
              while (1)
              {
                if (*(void *)v49 != v17) {
                  objc_enumerationMutation(v15);
                }
                int v19 = *(void **)(*((void *)&v48 + 1) + 8 * v18);
                uint64_t v20 = [v10 name];
                uint64_t v21 = [v19 name];
                char v22 = [v20 isEqualToString:v21];

                if (v22) {
                  break;
                }
                if (v16 == ++v18)
                {
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v57 count:16];
                  if (v16) {
                    goto LABEL_12;
                  }
                  goto LABEL_18;
                }
              }
              BOOL v23 = v38;

              BOOL v38 = 1;
              if (v23) {
                goto LABEL_36;
              }
            }
            else
            {
LABEL_18:
            }
          }
        }
        if (v42)
        {
          if ([v10 hasShield])
          {
            id v24 = [v10 shieldGroup];
            long long v25 = [v41 shieldGroup];
            char v26 = [v24 isEqualToString:v25];

            if ((v26 & 1) == 0)
            {
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              long long v27 = [v39 roads];
              uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v56 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v45;
LABEL_25:
                uint64_t v30 = 0;
                while (1)
                {
                  if (*(void *)v45 != v29) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v31 = *(void **)(*((void *)&v44 + 1) + 8 * v30);
                  uint64_t v32 = [v10 shieldGroup];
                  uint64_t v33 = [v31 shieldGroup];
                  char v34 = [v32 isEqualToString:v33];

                  if (v34) {
                    break;
                  }
                  if (v28 == ++v30)
                  {
                    uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v56 count:16];
                    if (v28) {
                      goto LABEL_25;
                    }
                    goto LABEL_4;
                  }
                }
                BOOL v35 = v37 == 1;

                uint64_t v37 = 1;
                if (!v35) {
                  continue;
                }
                LOBYTE(v38) = 1;
                goto LABEL_36;
              }
LABEL_4:
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v38) = 0;
LABEL_36:

  return v38;
}

- (id)overpassJunctionForJunction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 overpassJunction];

  if (v5)
  {
    id v6 = [v4 overpassJunction];
  }
  else if ([v4 geoJunction] && objc_msgSend(v4, "isOverpass"))
  {
    uint64_t v7 = *(void *)(*(void *)[v4 tile] + 24);
    double v9 = *(geo::codec::VectorTile **)v7;
    uint64_t v8 = *(std::__shared_weak_count **)(v7 + 8);
    BOOL v23 = *(geo::codec::VectorTile **)v7;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    tileDatasByIndex = self->_tileDatasByIndex;
    uint64_t v11 = [v4 tile];
    char v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *(int *)(*(void *)v11 + 296), *(int *)(*(void *)v11 + 292), v23, v8);
    id v13 = [(NSMutableDictionary *)tileDatasByIndex objectForKey:v12];

    uint64_t v14 = geo::codec::VectorTile::junctionsCount(v9);
    uint64_t v15 = geo::codec::VectorTile::junctions(v9);
    uint64_t v16 = geo::codec::VectorTile::overpasses(v9);
    id v6 = 0;
    if (v15)
    {
      uint64_t v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v4 geoJunction];
        if (*(_WORD *)(v17 + ((v18 - v15) >> 4))) {
          BOOL v19 = v14 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
LABEL_14:
          id v6 = 0;
        }
        else
        {
          uint64_t v21 = 0;
          while ((v18 - v15) >> 5 == v21
               || *(unsigned __int16 *)(v17 + ((v18 - v15) >> 4)) != *(unsigned __int16 *)(v17 + 2 * v21))
          {
            if (v14 == ++v21) {
              goto LABEL_14;
            }
          }
          uint64_t v22 = v15 + 32 * v21;
          id v6 = [v13 junctionForGeoJunction:v22];
          if (!v6)
          {
            id v6 = -[VKLabelNavJunction initWithGEOJunction:routeOffset:tile:]([VKLabelNavJunction alloc], "initWithGEOJunction:routeOffset:tile:", v22, 0xBF80000000000000, [v4 tile]);
            [v13 addJunction:v6];
          }
          [(VKLabelNavJunction *)v6 setOverpassJunction:v4];
          [v4 setOverpassJunction:v6];
        }
      }
    }

    if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)addRouteRoadEdge:(const VKLabelNavRouteRoadEdge *)a3 atA:(BOOL)a4 isRouteRefineJunction:(BOOL)a5 tile:(const void *)a6 junctionList:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v16 = a7;
  uint64_t v12 = 8;
  if (v9) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(uint64_t *)((char *)&a3->var0 + v12);
  uint64_t v14 = [(VKLabelNavRoadGraph *)self _junctionForRoadEdge:&a3->var2 atA:v9 routeOffset:v13 tile:a6];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 setRouteOffset:v13];
    [v15 setIsRouteRefineJunction:v8];
    if (([v16 containsObject:v15] & 1) == 0) {
      [v16 addObject:v15];
    }
    [v15 findRoads];
    [v15 addRouteEdge:a3 atA:v9];
  }
}

@end