@interface VKRouteContext
- ($F24F406B2B787EFB06265DBA3D28CBD5)puckLocation;
- (BOOL)snappingToTransitLines;
- (GEOComposedWaypoint)currentWaypoint;
- (NSArray)alternateRoutes;
- (NSString)accessPointEntryName;
- (NSString)accessPointExitName;
- (NSString)locale;
- (PolylineCoordinate)routeOffset;
- (VKRouteContext)initWithAnchorPoint:(id)a3 useType:(unsigned __int8)a4;
- (VKRouteContext)initWithComposedRoute:(id)a3 useType:(unsigned __int8)a4;
- (VKRouteContext)initWithRouteInfo:(id)a3 useType:(unsigned __int8)a4;
- (VKRouteInfo)routeInfo;
- (float)puckRadius;
- (id).cxx_construct;
- (id)_hashTableForObserverType:(unsigned __int8)a3;
- (id)description;
- (int64_t)currentSegmentIndex;
- (int64_t)currentStepIndex;
- (int64_t)inspectedSegmentIndex;
- (int64_t)inspectedStepIndex;
- (unint64_t)puckSnappedStopID;
- (unint64_t)totalRouteCount;
- (unsigned)currentWaypointProximity;
- (unsigned)useType;
- (void)_setHasContextChangedForObserverType:(unsigned __int8)a3 withValue:(BOOL)a4;
- (void)addObserver:(id)a3 withType:(unsigned __int8)a4;
- (void)addShareSections:(id *)a3 shareCount:(unsigned int)a4;
- (void)forEachRouteInfo:(id)a3;
- (void)forEachSectionWithShareCount:(unsigned int)a3 dothis:(id)a4;
- (void)removeObserver:(id)a3 withType:(unsigned __int8)a4;
- (void)resetNotificationsForObserverType:(unsigned __int8)a3;
- (void)setAccessPointEntryName:(id)a3;
- (void)setAccessPointExitName:(id)a3;
- (void)setAlternateRoutes:(id)a3;
- (void)setCurrentSegmentIndex:(int64_t)a3;
- (void)setCurrentStepIndex:(int64_t)a3;
- (void)setCurrentWaypoint:(id)a3 withProximity:(unsigned __int8)a4;
- (void)setInspectedSegmentIndex:(int64_t)a3;
- (void)setInspectedStepIndex:(int64_t)a3;
- (void)setLocale:(id)a3;
- (void)setPuckLocation:(id)a3;
- (void)setPuckRadius:(float)a3;
- (void)setPuckSnappedStopID:(unint64_t)a3;
- (void)setRouteOffset:(PolylineCoordinate)a3;
- (void)setSnappingToTransitLines:(BOOL)a3;
@end

@implementation VKRouteContext

- (id).cxx_construct
{
  *((void *)self + 5) = 0xBF80000000000000;
  *((void *)self + 27) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 25) = (char *)self + 208;
  return self;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<md::FrameGraphPass *,geo::linear_set<md::FrameGraphPass *,md::FrameGraphPassLessThan,std::allocator<md::FrameGraphPass *>,std::vector<md::FrameGraphPass *>>>,std::__map_value_compare<md::FrameGraphPass *,std::__value_type<md::FrameGraphPass *,geo::linear_set<md::FrameGraphPass *,md::FrameGraphPassLessThan,std::allocator<md::FrameGraphPass *>,std::vector<md::FrameGraphPass *>>>,md::FrameGraphPassLessThan,true>,std::allocator<std::__value_type<md::FrameGraphPass *,geo::linear_set<md::FrameGraphPass *,md::FrameGraphPassLessThan,std::allocator<md::FrameGraphPass *>,std::vector<md::FrameGraphPass *>>>>>::destroy((void *)self->_shareSections.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_alternateRouteLineObservers, 0);
  objc_storeStrong((id *)&self->_routeLineObservers, 0);
  objc_storeStrong((id *)&self->_labelObservers, 0);
  objc_storeStrong((id *)&self->_accessPointExitName, 0);
  objc_storeStrong((id *)&self->_accessPointEntryName, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_currentWaypoint, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
}

- (NSArray)alternateRoutes
{
  return self->_alternateRoutes;
}

- (void)setAccessPointExitName:(id)a3
{
}

- (NSString)accessPointExitName
{
  return self->_accessPointExitName;
}

- (void)setAccessPointEntryName:(id)a3
{
}

- (NSString)accessPointEntryName
{
  return self->_accessPointEntryName;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (unint64_t)puckSnappedStopID
{
  return self->_puckSnappedStopID;
}

- (float)puckRadius
{
  return self->_puckRadius;
}

- (void)setPuckLocation:(id)a3
{
  self->_puckLocation = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)puckLocation
{
  double latitude = self->_puckLocation.latitude;
  double longitude = self->_puckLocation.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (unsigned)currentWaypointProximity
{
  return self->_currentWaypointProximity;
}

- (GEOComposedWaypoint)currentWaypoint
{
  return self->_currentWaypoint;
}

- (int64_t)inspectedStepIndex
{
  return self->_inspectedStepIndex;
}

- (int64_t)inspectedSegmentIndex
{
  return self->_inspectedSegmentIndex;
}

- (void)setSnappingToTransitLines:(BOOL)a3
{
  self->_snappingToTransitLines = a3;
}

- (BOOL)snappingToTransitLines
{
  return self->_snappingToTransitLines;
}

- (int64_t)currentStepIndex
{
  return self->_currentStepIndex;
}

- (void)setCurrentSegmentIndex:(int64_t)a3
{
  self->_currentSegmentIndex = a3;
}

- (int64_t)currentSegmentIndex
{
  return self->_currentSegmentIndex;
}

- (void)setRouteOffset:(PolylineCoordinate)a3
{
  self->_routeOffset = a3;
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (unsigned)useType
{
  return self->_useType;
}

- (VKRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"VKRouteContext: useType:%d routeInfo:%@ alternateRoutes:%@", self->_useType, self->_routeInfo, self->_alternateRoutes];
}

- (void)forEachRouteInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(VKRouteContext *)self routeInfo];
  v4[2](v4, v5, 0);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v6 = [(VKRouteContext *)self alternateRoutes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void **)(*((void *)&v10 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)forEachSectionWithShareCount:(unsigned int)a3 dothis:(id)a4
{
  v22 = (void (**)(id, void))a4;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)self->_shareSections.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_shareSections.__tree_.__pair1_;
  v6 = left;
  if (!left) {
    goto LABEL_2;
  }
  while (1)
  {
    unsigned int v9 = v6[4].__value_.__left_;
    if (v9 <= a3) {
      break;
    }
    p_pair1 = v6;
LABEL_6:
    v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v6->__value_.__left_;
    if (!v6) {
      goto LABEL_2;
    }
  }
  if (v9 < a3)
  {
    ++v6;
    goto LABEL_6;
  }
  v10.__value_.__left_ = v6->__value_.__left_;
  long long v11 = v6;
  if (v6->__value_.__left_)
  {
    long long v11 = v6;
    do
    {
      unsigned int v12 = *((_DWORD *)v10.__value_.__left_ + 8);
      BOOL v13 = v12 >= a3;
      if (v12 >= a3) {
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v10.__value_.__left_;
      }
      else {
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)((char *)v10.__value_.__left_ + 8);
      }
      if (v13) {
        long long v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v10.__value_.__left_;
      }
      v10.__value_.__left_ = v14->__value_.__left_;
    }
    while (v14->__value_.__left_);
  }
  uint64_t v15 = (char *)v6[1].__value_.__left_;
  if (v15)
  {
    do
    {
      unsigned int v16 = *((_DWORD *)v15 + 8);
      BOOL v17 = v16 > a3;
      if (v16 <= a3) {
        v18 = (void **)(v15 + 8);
      }
      else {
        v18 = (void **)v15;
      }
      if (v17) {
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v15;
      }
      uint64_t v15 = (char *)*v18;
    }
    while (*v18);
  }
  if (v11 != p_pair1)
  {
    do
    {
      ((void (**)(id, void *))v22)[2](v22, v11[5].__value_.__left_);
      v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v11[1].__value_.__left_;
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v19->__value_.__left_;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v11[2].__value_.__left_;
          BOOL v21 = v20->__value_.__left_ == v11;
          long long v11 = v20;
        }
        while (!v21);
      }
      long long v11 = v20;
    }
    while (v20 != p_pair1);
  }
LABEL_2:
}

- (void)addShareSections:(id *)a3 shareCount:(unsigned int)a4
{
  uint64_t v7 = (char *)operator new(0x40uLL);
  *((_DWORD *)v7 + 8) = a4;
  *((void *)v7 + 5) = 0;
  uint64_t v8 = v7 + 40;
  *((void *)v7 + 6) = 0;
  *((void *)v7 + 7) = 0;
  if (a4)
  {
    unsigned int v9 = (char *)operator new(24 * a4);
    *((void *)v7 + 5) = v9;
    __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> v10 = &v9[24 * a4];
    *((void *)v7 + 7) = v10;
    do
    {
      *(void *)unsigned int v9 = 0;
      *((void *)v9 + 1) = 0;
      *((_DWORD *)v9 + 3) = -1082130432;
      *((void *)v9 + 2) = 0xBF80000000000000;
      v9 += 24;
    }
    while (v9 != v10);
    *((void *)v7 + 6) = v10;
  }
  p_pair1 = &self->_shareSections.__tree_.__pair1_;
  while (1)
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)p_pair1->__value_.__left_;
    BOOL v13 = p_pair1;
    if (!p_pair1->__value_.__left_) {
      break;
    }
    while (1)
    {
      p_pair1 = left;
      if (LODWORD(left[4].__value_.__left_) > a4) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)left[1].__value_.__left_;
      if (!left)
      {
        BOOL v13 = p_pair1 + 1;
        goto LABEL_10;
      }
    }
  }
LABEL_10:
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = p_pair1;
  v13->__value_.__left_ = v7;
  v14 = *(void **)self->_shareSections.__tree_.__begin_node_;
  if (v14)
  {
    self->_shareSections.__tree_.__begin_node_ = v14;
    uint64_t v7 = (char *)v13->__value_.__left_;
  }
  std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_shareSections.__tree_.__pair1_.__value_.__left_, (uint64_t *)v7);
  ++self->_shareSections.__tree_.__pair3_.__value_;
  if (a4)
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = *v8 + v15 * 24;
      long long v17 = *(_OWORD *)&a3[v15].var0;
      *(PolylineCoordinate *)(v16 + 16) = a3[v15].var2;
      *(_OWORD *)uint64_t v16 = v17;
      ++v15;
    }
    while (a4 != v15);
  }
}

- (void)setAlternateRoutes:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_alternateRoutes != v5)
  {
    uint64_t v8 = v5;
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    if (([v6 isEqualToSet:v7] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alternateRoutes, a3);
      if (!self->_hasContextChangedForAlternateRouteLines) {
        [(VKRouteContext *)self _setHasContextChangedForObserverType:2 withValue:1];
      }
    }

    v5 = v8;
  }
}

- (void)setCurrentWaypoint:(id)a3 withProximity:(unsigned __int8)a4
{
  id v8 = a3;
  -[VKRouteInfo waypointForWaypoint:](self->_routeInfo, "waypointForWaypoint:");
  v6 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
  currentWaypoint = self->_currentWaypoint;
  self->_currentWaypoint = v6;

  self->_currentWaypointProximity = a4;
}

- (void)setPuckSnappedStopID:(unint64_t)a3
{
  if (self->_puckSnappedStopID != a3)
  {
    self->_puckSnappedStopID = a3;
    if (!self->_hasContextChangedForLabels) {
      [(VKRouteContext *)self _setHasContextChangedForObserverType:0 withValue:1];
    }
  }
}

- (void)setPuckRadius:(float)a3
{
  if (vabds_f32(self->_puckRadius, a3) >= 0.000001)
  {
    self->_puckRadius = a3;
    if (!self->_hasContextChangedForLabels) {
      [(VKRouteContext *)self _setHasContextChangedForObserverType:0 withValue:1];
    }
  }
}

- (void)setCurrentStepIndex:(int64_t)a3
{
  if (self->_currentStepIndex != a3)
  {
    self->_currentStepIndex = a3;
    if (!self->_hasContextChangedForRouteLine) {
      [(VKRouteContext *)self _setHasContextChangedForObserverType:1 withValue:1];
    }
  }
}

- (void)setInspectedStepIndex:(int64_t)a3
{
  if (self->_inspectedStepIndex != a3)
  {
    self->_inspectedStepIndex = a3;
    if (!self->_hasContextChangedForLabels) {
      [(VKRouteContext *)self _setHasContextChangedForObserverType:0 withValue:1];
    }
  }
}

- (void)setInspectedSegmentIndex:(int64_t)a3
{
  if (self->_inspectedSegmentIndex != a3)
  {
    self->_inspectedSegmentIndex = a3;
    if (!self->_hasContextChangedForLabels) {
      [(VKRouteContext *)self _setHasContextChangedForObserverType:0 withValue:1];
    }
  }
}

- (void)resetNotificationsForObserverType:(unsigned __int8)a3
{
}

- (void)removeObserver:(id)a3 withType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  v6 = [(VKRouteContext *)self _hashTableForObserverType:v4];
  [v6 removeObject:v7];
}

- (void)addObserver:(id)a3 withType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  v6 = [(VKRouteContext *)self _hashTableForObserverType:v4];
  [v6 addObject:v7];
}

- (void)_setHasContextChangedForObserverType:(unsigned __int8)a3 withValue:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 <= 2u) {
    *(&self->_hasContextChangedForLabels + 16 * a3) = a4;
  }
  if (a4)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v5 = [(VKRouteContext *)self _hashTableForObserverType:0];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) routeContextStateDidChange:self];
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)_hashTableForObserverType:(unsigned __int8)a3
{
  if (a3 > 2u)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = (&self->_labelObservers)[2 * a3];
  }
  return v4;
}

- (VKRouteContext)initWithAnchorPoint:(id)a3 useType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = [[VKRouteInfo alloc] initWithAnchorPoint:v6];
  uint64_t v8 = [(VKRouteContext *)self initWithRouteInfo:v7 useType:v4];

  return v8;
}

- (VKRouteContext)initWithRouteInfo:(id)a3 useType:(unsigned __int8)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKRouteContext;
  uint64_t v8 = [(VKRouteContext *)&v18 init];
  long long v9 = v8;
  if (v8)
  {
    v8->_useType = a4;
    objc_storeStrong((id *)&v8->_routeInfo, a3);
    v9->_currentSegmentIndex = -1;
    v9->_currentStepIndex = -1;
    v9->_snappingToTransitLines = 0;
    v9->_routeOffset = (PolylineCoordinate)0xBF80000000000000;
    v9->_inspectedSegmentIndex = -1;
    v9->_inspectedStepIndex = -1;
    v9->_hasContextChangedForLabels = 1;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    labelObservers = v9->_labelObservers;
    v9->_labelObservers = (NSHashTable *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    routeLineObservers = v9->_routeLineObservers;
    v9->_routeLineObservers = (NSHashTable *)v12;

    v9->_hasContextChangedForAlternateRouteLines = 0;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    alternateRouteLineObservers = v9->_alternateRouteLineObservers;
    v9->_alternateRouteLineObservers = (NSHashTable *)v14;

    uint64_t v16 = v9;
  }

  return v9;
}

- (VKRouteContext)initWithComposedRoute:(id)a3 useType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [[VKRouteInfo alloc] initWithComposedRoute:v6 etaDescription:0];
  uint64_t v8 = [(VKRouteContext *)self initWithRouteInfo:v7 useType:v4];

  return v8;
}

- (unint64_t)totalRouteCount
{
  unint64_t result = [(NSArray *)self->_alternateRoutes count];
  if (self->_routeInfo) {
    ++result;
  }
  return result;
}

@end