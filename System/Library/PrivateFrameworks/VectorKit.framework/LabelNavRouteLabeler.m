@interface LabelNavRouteLabeler
- (BOOL)_addJunctionsForTile:(const void *)a3;
- (BOOL)_collideLabel:(id)a3 activeLabel:(id)a4 labelsToRemove:(id)a5;
- (BOOL)_findRouteOverlappingJunctionFrom:(int64_t)a3 routeJunctions:(void *)a4 lookBackward:(BOOL)a5 firstOverlap:(int64_t *)a6 secondOverlap:(int64_t *)a7;
- (BOOL)_updateActiveRouteRange;
- (BOOL)debugDisableRoadSignLimit;
- (BOOL)debugEnableShieldsOnRouteLine;
- (BOOL)drawRoadSigns;
- (BOOL)isNavMode;
- (BOOL)needsDebugDraw;
- (BOOL)needsLayout;
- (LabelNavRouteLabeler)init;
- (NSString)currentLocationText;
- (NSString)currentRoadName;
- (NSString)currentShieldGroup;
- (PolylineCoordinate)routeUserOffset;
- (RoadSignOrientationResolver)createRoadSignOrientationResolver:(id)a3 navContext:(NavContext *)a4;
- (VKPolylineOverlay)route;
- (__n128)_addJunctionsForTile:;
- (const)activeSigns;
- (const)visibleSigns;
- (float)currentRoadSignPixelHeight;
- (id).cxx_construct;
- (unsigned)computeRoutePositionForPOIAtPixel:(const void *)a3 currentPosition:(unsigned __int8)a4 context:(NavContext *)a5;
- (unsigned)orientationForRoadSign:(id)a3 roadLabel:(id)a4 navContext:(NavContext *)a5;
- (unsigned)resolveOrientation:(NavContext *)a3 road:(id)a4 currentOrientation:(unsigned __int8)a5;
- (void)_addJunctionsForTile:;
- (void)_addLabelsAtJunctions:(id)a3 withContext:(NavContext *)a4 maxLabelsToAdd:(unint64_t)a5;
- (void)_addLabelsForJunctions:(id)a3 withContext:(NavContext *)a4 maxLabelsToAdd:(unint64_t)a5 useAllJunctions:(BOOL)a6 placeShieldsFrontToBack:(BOOL)a7;
- (void)_addVisibleSigns;
- (void)_createOrUpdateLabelForRoad:(id)a3 isShield:(BOOL)a4 navContext:(NavContext *)a5 hopOffsetDistance:(float)a6;
- (void)_dedupOffRouteRoads;
- (void)_generateCurrentRoadSignWithContext:(NavContext *)a3;
- (void)_initalizeCurrentRoadInfo;
- (void)_refreshGuidanceRoadNames;
- (void)_reloadRouteJunctions;
- (void)_tryAddLabel:(id)a3 navContext:(NavContext *)a4 labelCollisionEnabled:(BOOL)a5;
- (void)_tryAddRoadSignForJunction:(id)a3 navContext:(NavContext *)a4 labelCollisionEnabled:(BOOL)a5;
- (void)_tryAddRoadSignForRoad:(id)a3 isShield:(BOOL)a4 navContext:(NavContext *)a5 labelCollisionEnabled:(BOOL)a6;
- (void)_updateCurrentRoadInfo;
- (void)_updatePreferredLabelPlacements;
- (void)_updateRoadStarts;
- (void)_updateRoadsInGuidance;
- (void)_updateUniqueOffRouteRoads;
- (void)artworkCache;
- (void)clearSceneIsMemoryWarning:(BOOL)a3;
- (void)currentRoadSign;
- (void)debugDraw:(id)a3 overlayConsole:(void *)a4 navContext:(NavContext *)a5;
- (void)drawNavOverlayDebugView:(void *)a3 navContext:(NavContext *)a4;
- (void)drawRoadSignOrientationDebugView:(void *)a3 navContext:(NavContext *)a4;
- (void)grabTilesFromScene:(const void *)a3;
- (void)layoutWithNavContext:(NavContext *)a3 avoidanceRects:(const void *)a4;
- (void)setArtworkCache:(void *)a3;
- (void)setCurrentLocationText:(id)a3;
- (void)setCurrentRoadName:(id)a3;
- (void)setCurrentShieldGroup:(id)a3;
- (void)setDebugDisableRoadSignLimit:(BOOL)a3;
- (void)setDebugEnableShieldsOnRouteLine:(BOOL)a3;
- (void)setDrawRoadSigns:(BOOL)a3;
- (void)setMaxVisibleRoadsigns:(unsigned int)a3;
- (void)setRoute:(id)a3;
- (void)setRouteUserOffset:(PolylineCoordinate)a3;
- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3;
- (void)styleManagerDidChange:(BOOL)a3;
- (void)styleManagerDidFinishAnimating;
- (void)styleManagerDidStartAnimating;
@end

@implementation LabelNavRouteLabeler

- (void)setDebugDisableRoadSignLimit:(BOOL)a3
{
  if (self->_debugDisableRoadSignLimit != a3)
  {
    self->_debugDisableRoadSignLimit = a3;
    if (a3)
    {
      unint64_t debugCachedMaxVisibleOnRouteRoadSigns = 100;
      unint64_t debugCachedMaxVisibleOffRouteRoadSigns = 100;
    }
    else
    {
      unint64_t debugCachedMaxVisibleOffRouteRoadSigns = self->_debugCachedMaxVisibleOffRouteRoadSigns;
      unint64_t debugCachedMaxVisibleOnRouteRoadSigns = self->_debugCachedMaxVisibleOnRouteRoadSigns;
    }
    self->_maxVisibleOnRouteRoadSigns = debugCachedMaxVisibleOnRouteRoadSigns;
    self->_maxVisibleOffRouteRoadSigns = debugCachedMaxVisibleOffRouteRoadSigns;
    self->_maxVisibleRoadSigns = debugCachedMaxVisibleOnRouteRoadSigns + debugCachedMaxVisibleOffRouteRoadSigns;
    [(NSMutableDictionary *)self->_visibleLabelsByName removeAllObjects];
    [(NSMutableArray *)self->_visibleLabels removeAllObjects];
    [(NSMutableSet *)self->_visibleShieldGroups removeAllObjects];
    fadingLabels = self->_fadingLabels;
    [(NSMutableArray *)fadingLabels removeAllObjects];
  }
}

- (void)setCurrentLocationText:(id)a3
{
  v5 = (NSString *)a3;
  v6 = v5;
  if (self->_currentLocationText != v5)
  {
    v9 = v5;
    BOOL v7 = -[NSString isEqualToString:](v5, "isEqualToString:");
    v6 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLocationText, a3);
      v6 = v9;
      cntrl = self->_currentRoadSign.__cntrl_;
      self->_currentRoadSign.__ptr_ = 0;
      self->_currentRoadSign.__cntrl_ = 0;
      if (cntrl)
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          (*(void (**)(__shared_weak_count *, NSString *))(*(void *)cntrl + 16))(cntrl, v9);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
          v6 = v9;
        }
      }
    }
  }
}

- (void)styleManagerDidStartAnimating
{
  *(_WORD *)&self->_regenerateRoadSigns = 257;
}

- (void)styleManagerDidFinishAnimating
{
  self->_isStylesheetAnimating = 0;
}

- (void)styleManagerDidChange:(BOOL)a3
{
  if (!a3) {
    self->_regenerateRoadSigns = 1;
  }
  self->_isStylesheetAnimating = a3;
}

- (void)clearSceneIsMemoryWarning:(BOOL)a3
{
  self->_disableTileParseForOneLayout = 1;
  if (!a3)
  {
    if (self->_tiles.__table_.__p2_.__value_)
    {
      next = self->_tiles.__table_.__p1_.__value_.__next_;
      while (next)
      {
        v5 = next;
        next = (void *)*next;
        v6 = (std::__shared_weak_count *)v5[3];
        if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v6->__on_zero_shared)(v6, a2);
          std::__shared_weak_count::__release_weak(v6);
        }
        (*(void (**)(Allocator *, void *, uint64_t))(*(void *)self->_tiles.__table_.__p1_.__value__2._allocator
                                                               + 40))(self->_tiles.__table_.__p1_.__value__2._allocator, v5, 32);
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
    if (self->_pendingTiles.__table_.__p2_.__value_)
    {
      v9 = self->_pendingTiles.__table_.__p1_.__value_.__next_;
      while (v9)
      {
        v10 = v9;
        v9 = (void *)*v9;
        v11 = (std::__shared_weak_count *)v10[3];
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v11->__on_zero_shared)(v11, a2);
          std::__shared_weak_count::__release_weak(v11);
        }
        (*(void (**)(Allocator *, void *, uint64_t))(*(void *)self->_pendingTiles.__table_.__p1_.__value__2._allocator
                                                               + 40))(self->_pendingTiles.__table_.__p1_.__value__2._allocator, v10, 32);
      }
      self->_pendingTiles.__table_.__p1_.__value_.__next_ = 0;
      unint64_t v12 = self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (v12)
      {
        for (uint64_t j = 0; j != v12; ++j)
          self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
      }
      self->_pendingTiles.__table_.__p2_.__value_ = 0;
    }
    self->_hasPendingTilesInSnappingRegion = 0;
    [(NSMutableArray *)self->_junctions removeAllObjects];
    begin = (char *)self->_activeSigns.__begin_;
    for (k = (char *)self->_activeSigns.__end_; k != begin; k -= 16)
    {
      v16 = (std::__shared_weak_count *)*((void *)k - 1);
      if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    self->_activeSigns.__end_ = begin;
    v17 = (char *)self->_visibleSigns.__begin_;
    for (m = (char *)self->_visibleSigns.__end_; m != v17; m -= 16)
    {
      v19 = (std::__shared_weak_count *)*((void *)m - 1);
      if (v19)
      {
        if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
    }
    self->_visibleSigns.__end_ = v17;
    [(NSMutableDictionary *)self->_visibleLabelsByName removeAllObjects];
    [(NSMutableArray *)self->_visibleLabels removeAllObjects];
    [(NSMutableSet *)self->_visibleShieldGroups removeAllObjects];
    [(NSMutableArray *)self->_fadingLabels removeAllObjects];
    [(VKLabelNavRoadGraph *)self->_roadGraph reset];
    self->_useRouteSubrange = 0;
  }
}

- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3
{
  ptr = *(std::__shared_weak_count ***)a3.__ptr_;
  uint64_t v5 = *((void *)a3.__ptr_ + 1);
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_styleManager.__cntrl_;
  self->_styleManager.__ptr_ = ptr;
  self->_styleManager.__cntrl_ = (__shared_weak_count *)v5;
  if (cntrl)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    ptr = (std::__shared_weak_count **)self->_styleManager.__ptr_;
  }
  if (ptr)
  {
    shared_owners = ptr[2];
    if (!shared_owners)
    {
      ptr = 0;
      v9 = self->_styleManager.__ptr_;
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)&shared_owners[116]);
    if ((v8 & 1) == 0) {
      std::__assoc_sub_state::wait((std::__assoc_sub_state *)shared_owners[117].__vftable);
    }
    ptr = (std::__shared_weak_count **)shared_owners[5].__vftable;
    shared_owners = (std::__shared_weak_count *)shared_owners[5].__shared_owners_;
    if (shared_owners)
    {
      atomic_fetch_add_explicit(&shared_owners->__shared_owners_, 1uLL, memory_order_relaxed);
      v9 = self->_styleManager.__ptr_;
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }
  else
  {
    shared_owners = 0;
  }
  v9 = self->_styleManager.__ptr_;
  if (!v9) {
    goto LABEL_20;
  }
LABEL_16:
  if (*(unsigned char *)(v9[2] + 60) == 1)
  {
    self->_maxOnRoadGraphRoadSigns = 0;
    self->_minVisibleOffRoadGraphRoadSigns = 0;
    self->_minVisibleProceedToRouteRoadSigns = 2;
    self->_preferRightSideLabelPlacement = 1;
    if (!ptr) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_20:
  unint64_t maxVisibleRoadSigns = self->_maxVisibleRoadSigns;
  if (maxVisibleRoadSigns >= 5) {
    unint64_t maxVisibleRoadSigns = 5;
  }
  self->_maxOnRoadGraphRoadSigns = maxVisibleRoadSigns;
  self->_minVisibleOffRoadGraphRoadSigns = 3;
  self->_minVisibleProceedToRouteRoadSigns = 6;
  self->_preferRightSideLabelPlacement = 0;
  if (ptr) {
LABEL_23:
  }
    LOBYTE(ptr) = *((unsigned char *)ptr + 257) != 0;
LABEL_24:
  self->_shouldLabelOppositeCarriageways = (char)ptr;
  if (shared_owners && !atomic_fetch_add(&shared_owners->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, SEL))shared_owners->__on_zero_shared)(shared_owners, a2);
    std::__shared_weak_count::__release_weak(shared_owners);
  }
}

- (void)setArtworkCache:(void *)a3
{
  self->_artworkCache = a3;
}

- (LabelNavRouteLabeler)init
{
  v37.receiver = self;
  v37.super_class = (Class)LabelNavRouteLabeler;
  v2 = [(LabelNavRouteLabeler *)&v37 init];
  v3 = (LabelNavRouteLabeler *)v2;
  if (v2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = (void *)*((void *)v2 + 48);
    *((void *)v2 + 48) = v4;

    *((void *)v2 + 50) = -1;
    unint64_t prime = vcvtps_u32_f32(32.0 / *((float *)v2 + 28));
    if (prime == 1)
    {
      unint64_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      unint64_t prime = std::__next_prime(prime);
    }
    int8x8_t v7 = *(int8x8_t *)(v2 + 72);
    if (prime > *(void *)&v7) {
      goto LABEL_7;
    }
    if (prime < *(void *)&v7)
    {
      unint64_t v8 = vcvtps_u32_f32((float)*((unint64_t *)v2 + 13) / *((float *)v2 + 28));
      if (*(void *)&v7 < 3uLL || (uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7), v9.i16[0] = vaddlv_u8(v9), v9.u32[0] > 1uLL))
      {
        unint64_t v8 = std::__next_prime(v8);
      }
      else
      {
        uint64_t v10 = 1 << -(char)__clz(v8 - 1);
        if (v8 >= 2) {
          unint64_t v8 = v10;
        }
      }
      if (prime <= v8) {
        unint64_t prime = v8;
      }
      if (prime < *(void *)&v7) {
LABEL_7:
      }
        std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)(v2 + 64), prime);
    }
    unint64_t v11 = vcvtps_u32_f32(32.0 / *((float *)v2 + 42));
    if (v11 == 1)
    {
      unint64_t v11 = 2;
    }
    else if ((v11 & (v11 - 1)) != 0)
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    int8x8_t v12 = *(int8x8_t *)(v2 + 128);
    if (v11 > *(void *)&v12) {
      goto LABEL_23;
    }
    if (v11 < *(void *)&v12)
    {
      unint64_t v13 = vcvtps_u32_f32((float)*((unint64_t *)v2 + 20) / *((float *)v2 + 42));
      if (*(void *)&v12 < 3uLL || (uint8x8_t v14 = (uint8x8_t)vcnt_s8(v12), v14.i16[0] = vaddlv_u8(v14), v14.u32[0] > 1uLL))
      {
        unint64_t v13 = std::__next_prime(v13);
      }
      else
      {
        uint64_t v15 = 1 << -(char)__clz(v13 - 1);
        if (v13 >= 2) {
          unint64_t v13 = v15;
        }
      }
      if (v11 <= v13) {
        unint64_t v11 = v13;
      }
      if (v11 < *(void *)&v12) {
LABEL_23:
      }
        std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)(v2 + 120), v11);
    }
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
    v17 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v16;

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = (void *)*((void *)v2 + 33);
    *((void *)v2 + 33) = v18;

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v21 = (void *)*((void *)v2 + 34);
    *((void *)v2 + 34) = v20;

    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v23 = (void *)*((void *)v2 + 35);
    *((void *)v2 + 35) = v22;

    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25 = (void *)*((void *)v2 + 32);
    *((void *)v2 + 32) = v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:16];
    v27 = (void *)*((void *)v2 + 46);
    *((void *)v2 + 46) = v26;

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:16];
    v29 = (void *)*((void *)v2 + 47);
    *((void *)v2 + 47) = v28;

    v30 = [[VKLabelNavRoadGraph alloc] initWithJunctions:*((void *)v2 + 22)];
    v31 = (void *)*((void *)v2 + 23);
    *((void *)v2 + 23) = v30;

    *((void *)v2 + 39) = 2;
    *((_OWORD *)v2 + 20) = xmmword_1A28FF3D0;
    *((_OWORD *)v2 + 21) = xmmword_1A28FD1E0;
    *((void *)v2 + 44) = 6;
    v2[465] = 0;
    v32 = (std::__shared_weak_count *)*((void *)v2 + 63);
    *((void *)v2 + 62) = 0;
    *((void *)v2 + 63) = 0;
    if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
    v2[512] = 1;
    v2[552] = 0;
    v2[419] = 0;
    uint64_t v35 = 0x3FC90FDB00000000;
    char v36 = 1;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert((uint64_t *)v2 + 73, (uint64_t)&v35);
    uint64_t v35 = 0x40490FDB3FC90FDBLL;
    char v36 = 1;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert((uint64_t *)v2 + 73, (uint64_t)&v35);
    uint64_t v35 = 0x4096CBE440490FDBLL;
    char v36 = 0;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert((uint64_t *)v2 + 73, (uint64_t)&v35);
    uint64_t v35 = 0x40C90FDB4096CBE4;
    char v36 = 0;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert((uint64_t *)v2 + 73, (uint64_t)&v35);
    v33 = (uint64_t *)(v2 + 560);
    uint64_t v35 = 0x3FC90FDB00000000;
    char v36 = 0;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert(v33, (uint64_t)&v35);
    uint64_t v35 = 0x40490FDB3FC90FDBLL;
    char v36 = 0;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert(v33, (uint64_t)&v35);
    uint64_t v35 = 0x4096CBE440490FDBLL;
    char v36 = 1;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert(v33, (uint64_t)&v35);
    uint64_t v35 = 0x40C90FDB4096CBE4;
    char v36 = 1;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert(v33, (uint64_t)&v35);
  }
  return v3;
}

- (id).cxx_construct
{
  *(void *)((char *)self + 36) = 0xBF80000000000000;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  v2 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
  {
    id v17 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v4 = v3;
    self = v17;
    if (v4) {
      operator new();
    }
  }
  *((void *)self + 10) = *((void *)v2 + 91);
  *((void *)self + 11) = 0;
  {
    id v18 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v6 = v5;
    self = v18;
    if (v6) {
      operator new();
    }
  }
  *((void *)self + 12) = *((void *)v2 + 91);
  *((void *)self + 13) = 0;
  *((_DWORD *)self + 28) = 1065353216;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  {
    id v19 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v8 = v7;
    self = v19;
    if (v8) {
      operator new();
    }
  }
  *((void *)self + 17) = *((void *)v2 + 91);
  *((void *)self + 18) = 0;
  {
    id v20 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v10 = v9;
    self = v20;
    if (v10) {
      operator new();
    }
  }
  *((void *)self + 19) = *((void *)v2 + 91);
  *((void *)self + 20) = 0;
  *((_DWORD *)self + 42) = 1065353216;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 24) = 0;
  {
    id v21 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v12 = v11;
    self = v21;
    if (v12) {
      operator new();
    }
  }
  *((void *)self + 27) = *((void *)v2 + 91);
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 30) = 0;
  {
    id v22 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v14 = v13;
    self = v22;
    if (v14) {
      operator new();
    }
  }
  *((void *)self + 31) = *((void *)v2 + 91);
  *(void *)((char *)self + 420) = 0xBF80000000000000;
  *(void *)((char *)self + 428) = 0xBF80000000000000;
  *((void *)self + 56) = 0;
  *((void *)self + 57) = 0;
  *((void *)self + 62) = 0;
  *((void *)self + 63) = 0;
  *((void *)self + 65) = 0;
  *((void *)self + 67) = 0;
  *((void *)self + 66) = 0;
  {
    id v23 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v16 = v15;
    self = v23;
    if (v16) {
      operator new();
    }
  }
  *((void *)self + 68) = *((void *)v2 + 91);
  *(_OWORD *)((char *)self + 568) = 0u;
  *((void *)self + 70) = (char *)self + 568;
  *((_OWORD *)self + 37) = 0u;
  *((void *)self + 73) = (char *)self + 592;
  return self;
}

- (void)setRoute:(id)a3
{
  int v11 = (VKPolylineOverlay *)a3;
  if (self->_route != v11)
  {
    objc_storeStrong((id *)&self->_route, a3);
    self->_pendingTiles.__table_.__p3_.__value_ = self->_tiles.__table_.__p3_.__value_;
    std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::shared_ptr<md::LabelTile>,void *> *>>(&self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, (void *)self->_tiles.__table_.__p1_.__value_.__next_);
    [(NSMutableArray *)self->_junctions removeAllObjects];
    begin = (char *)self->_activeSigns.__begin_;
    for (uint64_t i = (char *)self->_activeSigns.__end_; i != begin; i -= 16)
    {
      int v7 = (std::__shared_weak_count *)*((void *)i - 1);
      if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    self->_activeSigns.__end_ = begin;
    int v8 = (char *)self->_visibleSigns.__begin_;
    for (uint64_t j = (char *)self->_visibleSigns.__end_; j != v8; j -= 16)
    {
      int v10 = (std::__shared_weak_count *)*((void *)j - 1);
      if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    self->_visibleSigns.__end_ = v8;
    [(NSMutableDictionary *)self->_visibleLabelsByName removeAllObjects];
    [(NSMutableArray *)self->_visibleLabels removeAllObjects];
    [(NSMutableSet *)self->_visibleShieldGroups removeAllObjects];
    [(NSMutableArray *)self->_fadingLabels removeAllObjects];
    [(VKLabelNavRoadGraph *)self->_roadGraph reset];
    [(VKLabelNavRoadGraph *)self->_roadGraph setTiles:&self->_tiles];
    self->_stepIndex = 0;
    [(LabelNavRouteLabeler *)self _refreshGuidanceRoadNames];
    self->_disableTileParseForOneLayout = 1;
    *(_WORD *)&self->_checkIfRouteSubrangeChanged = 1;
    self->_isOnRoute = 0;
    self->_regenerateRoadSigns = 0;
    self->_routeUserOffset = (PolylineCoordinate)0xBF80000000000000;
    self->_currentRoadNameIndex = -1;
    [(LabelNavRouteLabeler *)self setCurrentRoadName:0];
    [(LabelNavRouteLabeler *)self setCurrentShieldGroup:0];
    [(NSMutableArray *)self->_routeRoadInfos removeAllObjects];
  }
}

- (void)drawNavOverlayDebugView:(void *)a3 navContext:(NavContext *)a4
{
  uint64_t v344 = *MEMORY[0x1E4F143B8];
  int v334 = -16776961;
  var3 = a4->var3;
  var4 = a4->var4;
  int v7 = *((_DWORD *)var3 + 266);
  float v8 = *((float *)var3 + 267);
  float v254 = *((float *)a4->var1 + 44);
  long double v9 = *((double *)var4 + 13);
  double v256 = *((double *)var4 + 12);
  if (!*((unsigned char *)var3 + 8))
  {
    long double v10 = *((double *)var4 + 14);
    double v11 = sqrt(v256 * v256 + v9 * v9);
    double v12 = atan2(v10, v11 * 0.996647189);
    double v13 = atan2(v9, v256);
    __double2 v14 = __sincos_stret(v12);
    long double v15 = atan2(v10 + v14.__sinval * v14.__sinval * 42841.3115 * v14.__sinval, v11 + v14.__cosval * v14.__cosval * -42697.6727 * v14.__cosval);
    long double v16 = tan(v15 * 0.5 + 0.785398163);
    double v256 = v13 * 0.159154943 + 0.5;
    long double v9 = log(v16) * 0.159154943 + 0.5;
  }
  id v17 = (char *)*((void *)var3 + 144);
  id v18 = (char *)*((void *)var3 + 145);
  if (v17 == v18)
  {
    double v22 = 1.79769313e308;
    double v23 = -1.79769313e308;
    double v20 = 1.79769313e308;
    double v21 = -1.79769313e308;
    goto LABEL_12;
  }
  unint64_t v19 = v18 - v17 - 16;
  if (v19 < 0x30)
  {
    double v20 = 1.79769313e308;
    double v21 = -1.79769313e308;
    double v22 = 1.79769313e308;
    double v23 = -1.79769313e308;
    goto LABEL_11;
  }
  uint64_t v24 = (v19 >> 4) + 1;
  float64x2_t v25 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  float64x2_t v26 = (float64x2_t)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v27 = (const double *)(v17 + 32);
  uint64_t v28 = v24 & 0x1FFFFFFFFFFFFFFCLL;
  float64x2_t v29 = v26;
  float64x2_t v30 = v25;
  float64x2_t v31 = v25;
  float64x2_t v32 = v25;
  float64x2_t v33 = v26;
  float64x2_t v34 = v26;
  do
  {
    uint64_t v35 = v27 - 4;
    float64x2x2_t v345 = vld2q_f64(v35);
    float64x2x2_t v346 = vld2q_f64(v27);
    float64x2_t v25 = vminnmq_f64(v345.val[0], v25);
    float64x2_t v30 = vminnmq_f64(v346.val[0], v30);
    float64x2_t v33 = vmaxnmq_f64(v33, v345.val[0]);
    float64x2_t v34 = vmaxnmq_f64(v34, v346.val[0]);
    float64x2_t v31 = vminnmq_f64(v345.val[1], v31);
    float64x2_t v32 = vminnmq_f64(v346.val[1], v32);
    float64x2_t v26 = vmaxnmq_f64(v26, v345.val[1]);
    float64x2_t v29 = vmaxnmq_f64(v29, v346.val[1]);
    v27 += 8;
    v28 -= 4;
  }
  while (v28);
  double v23 = vmaxnmvq_f64(vmaxnmq_f64(v33, v34));
  double v22 = vminnmvq_f64(vminnmq_f64(v31, v32));
  double v20 = vminnmvq_f64(vminnmq_f64(v25, v30));
  double v21 = vmaxnmvq_f64(vmaxnmq_f64(v26, v29));
  if (v24 != (v24 & 0x1FFFFFFFFFFFFFFCLL))
  {
    v17 += 16 * (v24 & 0x1FFFFFFFFFFFFFFCLL);
    do
    {
LABEL_11:
      double v36 = *(double *)v17;
      double v37 = *((double *)v17 + 1);
      v17 += 16;
      double v20 = fmin(v36, v20);
      double v23 = fmax(v23, v36);
      double v22 = fmin(v37, v22);
      double v21 = fmax(v21, v37);
    }
    while (v17 != v18);
  }
LABEL_12:
  route = self->_route;
  if (route)
  {
    v39 = [(VKPolylineOverlay *)route routeRibbon];
    v40 = [v39 renderRegion];

    if (v40)
    {
      v41 = [(VKPolylineOverlay *)self->_route routeRibbon];
      v42 = [v41 renderRegion];
      v43 = (void *)[v42 snappingRegion];

      v46 = (void *)*v43;
      v45 = v43 + 1;
      v44 = v46;
      if (v46 != v45)
      {
        do
        {
          v78 = (void *)v44[1];
          v79 = v44;
          if (v78)
          {
            do
            {
              v80 = v78;
              v78 = (void *)*v78;
            }
            while (v78);
          }
          else
          {
            do
            {
              v80 = (void *)v79[2];
              BOOL v81 = *v80 == (void)v79;
              v79 = v80;
            }
            while (!v81);
          }
          double v20 = fmin(*((double *)v44 + 4), v20);
          double v23 = fmax(v23, *((double *)v44 + 6));
          double v22 = fmin(*((double *)v44 + 5), v22);
          double v21 = fmax(v21, *((double *)v44 + 7));
          v44 = v80;
        }
        while (v80 != v45);
      }
    }
  }
  for (uint64_t i = self->_tiles.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    v48 = (double *)i[2];
    double v20 = fmin(v48[39], v20);
    double v23 = fmax(v23, v48[41]);
    double v22 = fmin(v48[40], v22);
    double v21 = fmax(v21, v48[42]);
  }
  double v49 = fmax(v23 - v20, v21 - v22) * 1.25;
  v333[0] = 0;
  *(float *)&v333[1] = v8 * 0.25;
  v333[2] = v7;
  *(float *)&v333[3] = v8 * 0.75;
  long double v50 = exp(v9 * 6.28318531 + -3.14159265);
  *(double *)&v265 = v9;
  long double v51 = atan(v50) * 114.591559 + -90.0;
  long double v52 = cos(v51 * 0.034906585) * -559.82 + 111132.92;
  long double v53 = v52 + cos(v51 * 0.0698131701) * 1.175;
  long double v54 = v53 + cos(v51 * 0.104719755) * -0.0023;
  long double v55 = v51 * 0.00872664626;
  long double v56 = tan(v55 + 0.78103484);
  double v57 = log(v56);
  long double v58 = v55 + 0.789761487;
  double v59 = *(double *)&v265;
  long double v60 = tan(v58);
  double v335 = v256;
  double v336 = *(double *)&v265;
  double v307 = v49 * v54 / fabs((log(v60) - v57) * 0.159154943);
  double v306 = v307;
  md::DebugConsoleMapRect::DebugConsoleMapRect((uint64_t)&v308, (uint64_t)a3, (uint64_t)v333, &v335, &v307, &v306);
  *((_DWORD *)a3 + 24) = 0x80000000;
  float32_t v61 = *(float *)&v309;
  *((void *)a3 + 1) = v309;
  *(float *)&double v62 = ggl::DebugConsole::drawRectangleWithFill((float32x2_t *)a3, &v310, v61);
  v63 = self->_route;
  if (v63)
  {
    v64 = [(VKPolylineOverlay *)v63 routeRibbon];
    v65 = [v64 renderRegion];
    BOOL v66 = v65 == 0;

    if (!v66)
    {
      int v305 = -16711936;
      int v304 = -16777216;
      int v303 = -1;
      v67 = a4->var3;
      v68 = (double *)*((void *)v67 + 144);
      double v70 = *v68;
      double v69 = v68[1];
      if (*((void *)v67 + 145) - (void)v68 < 0x11uLL)
      {
        double v77 = *v68;
      }
      else
      {
        uint64_t v71 = 0;
        unint64_t v72 = 1;
        do
        {
          v73 = &v68[v71];
          double v74 = v73[2] - v70;
          double v75 = v73[3] - v69;
          double v335 = v70;
          double v336 = v69;
          double v337 = v74;
          double v338 = v75;
          md::DebugConsoleMapRect::drawWorldSegment((uint64_t)&v308, &v335, &v305);
          v76 = a4->var3;
          v68 = (double *)*((void *)v76 + 144);
          ++v72;
          double v70 = v68[v71 + 2];
          double v69 = v68[v71 + 3];
          v71 += 2;
        }
        while (v72 < (uint64_t)(*((void *)v76 + 145) - (void)v68) >> 4);
        double v77 = *v68;
      }
      double v82 = v68[1] - v69;
      double v335 = v70;
      double v336 = v69;
      double v337 = v77 - v70;
      double v338 = v82;
      md::DebugConsoleMapRect::drawWorldSegment((uint64_t)&v308, &v335, &v305);
      v83 = [(VKPolylineOverlay *)self->_route routeRibbon];
      v84 = [v83 renderRegion];
      v85 = (void *)[v84 snappingRegion];

      v88 = (double *)*v85;
      v87 = (double *)(v85 + 1);
      v86 = v88;
      if (v88 != v87)
      {
        do
        {
          LODWORD(v335) = 1073742079;
          md::DebugConsoleMapRect::drawWorldRect((uint64_t)&v308, v86 + 4, (__int8 *)&v335, 1);
          v89 = (double *)*((void *)v86 + 1);
          if (v89)
          {
            do
            {
              v90 = v89;
              v89 = *(double **)v89;
            }
            while (v89);
          }
          else
          {
            do
            {
              v90 = (double *)*((void *)v86 + 2);
              BOOL v81 = *(void *)v90 == (void)v86;
              v86 = v90;
            }
            while (!v81);
          }
          v86 = v90;
        }
        while (v90 != v87);
      }
      v302[1] = 0;
      v302[0] = 0;
      v301[2] = v302;
      v301[1] = 0;
      v301[0] = 0;
      v300 = v301;
      __p = 0;
      v298 = 0;
      v299 = 0;
      long long v293 = 0u;
      long long v294 = 0u;
      long long v295 = 0u;
      long long v296 = 0u;
      v91 = [(VKPolylineOverlay *)self->_route routeRibbon];
      obuint64_t j = [v91 matchedSegments];

      uint64_t v92 = [obj countByEnumeratingWithState:&v293 objects:v343 count:16];
      if (v92)
      {
        v93 = 0;
        v94 = 0;
        v95 = 0;
        uint64_t v258 = *(void *)v294;
        do
        {
          for (uint64_t j = 0; j != v92; ++j)
          {
            if (*(void *)v294 != v258) {
              objc_enumerationMutation(obj);
            }
            v97 = *(void **)(*((void *)&v293 + 1) + 8 * j);
            unsigned int v98 = [v97 startRouteCoordinate];
            unsigned int v99 = [v97 endRouteCoordinate];
            unsigned int v100 = v99;
            if (v95 >= v94)
            {
              uint64_t v101 = v95 - v93;
              unint64_t v102 = v101 + 1;
              if ((unint64_t)(v101 + 1) >> 60)
              {
                __p = v93;
                abort();
              }
              if (((char *)v94 - (char *)v93) >> 3 > v102) {
                unint64_t v102 = ((char *)v94 - (char *)v93) >> 3;
              }
              if ((unint64_t)((char *)v94 - (char *)v93) >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v103 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v103 = v102;
              }
              if (v103 >> 60) {
                std::__throw_bad_array_new_length[abi:nn180100]();
              }
              v104 = (char *)operator new(16 * v103);
              v105 = (double *)&v104[16 * v101];
              double *v105 = (double)v98;
              v105[1] = (double)v100;
              if (v95 == v93)
              {
                v107 = (__n128 *)&v104[16 * v101];
              }
              else
              {
                v106 = (__n128 *)&v104[16 * v101];
                do
                {
                  v107 = v106 - 1;
                  v106[-1] = v95[-1];
                  --v95;
                  --v106;
                }
                while (v95 != v93);
              }
              v94 = (__n128 *)&v104[16 * v103];
              v95 = (__n128 *)(v105 + 2);
              if (v93) {
                operator delete(v93);
              }
              v93 = v107;
            }
            else
            {
              v95->n128_f64[0] = (double)v98;
              v95->n128_f64[1] = (double)v99;
              ++v95;
            }
            v108 = [v97 road];
            unint64_t v109 = [v97 roadRange] + 1;
            for (uint64_t k = 24 * v109; ; k += 24)
            {
              [v97 roadRange];
              if (v109 >= v111) {
                break;
              }
              uint64_t v112 = [v108 coordinates3d];
              double v113 = *(double *)(v112 + k - 24);
              double v114 = *(double *)(v112 + k - 16);
              uint64_t v115 = [v108 coordinates3d];
              double v267 = *(double *)(v115 + k);
              double v269 = *(double *)(v115 + k + 8);
              long double v116 = tan(v113 * 0.00872664626 + 0.785398163);
              long double v117 = log(v116) * 0.159154943;
              long double v118 = tan(v267 * 0.00872664626 + 0.785398163);
              long double v119 = log(v118);
              double v335 = v114 * 0.00277777778 + 0.5;
              double v336 = v117 + 0.5;
              double v337 = -(v114 * 0.00277777778 - v269 * 0.00277777778);
              double v338 = -(v117 - v119 * 0.159154943);
              md::DebugConsoleMapRect::drawWorldSegment((uint64_t)&v308, &v335, &v304);
              ++v109;
              double v59 = *(double *)&v265;
            }
          }
          v298 = v95;
          v299 = v94;
          __p = v93;
          uint64_t v92 = [obj countByEnumeratingWithState:&v293 objects:v343 count:16];
        }
        while (v92);
      }
      else
      {
        v95 = 0;
        v93 = 0;
      }

      unint64_t v121 = 126 - 2 * __clz(v95 - v93);
      if (v95 == v93) {
        uint64_t v122 = 0;
      }
      else {
        uint64_t v122 = v121;
      }
      std::__introsort<std::_ClassicAlgPolicy,-[LabelNavRouteLabeler(Debug) drawNavOverlayDebugView:navContext:]::$_0 &,gm::Range<double> *,false>(v93, v95, v122, 1, v120);
      long long v291 = 0u;
      long long v292 = 0u;
      long long v289 = 0u;
      long long v290 = 0u;
      v123 = [(VKPolylineOverlay *)self->_route composedRoute];
      v124 = [v123 sections];

      uint64_t v125 = [v124 countByEnumeratingWithState:&v289 objects:v342 count:16];
      if (v125)
      {
        uint64_t v126 = *(void *)v290;
        do
        {
          for (uint64_t m = 0; m != v125; ++m)
          {
            if (*(void *)v290 != v126) {
              objc_enumerationMutation(v124);
            }
            v128 = *(void **)(*((void *)&v289 + 1) + 8 * m);
            if ([v128 pointCount] >= 2)
            {
              unsigned int v129 = [v128 startPointIndex];
              unsigned int v130 = [v128 endPointIndex];
              double v131 = (double)v129;
              *(double *)&long long v288 = (double)v129;
              *((double *)&v288 + 1) = (double)v130;
              double v285 = COERCE_DOUBLE(&v285);
              v286 = &v285;
              uint64_t v287 = 0;
              md::MuninLabelingUtils::clipRange(&v335, &v288, (uint64_t *)&__p);
              if (v287)
              {
                double v133 = v285;
                v132 = v286;
                uint64_t v134 = *(void *)v286;
                *(void *)(v134 + 8) = *(void *)(*(void *)&v285 + 8);
                **(void **)(*(void *)&v133 + 8) = v134;
                uint64_t v287 = 0;
                if (v132 != &v285)
                {
                  do
                  {
                    v135 = (double *)*((void *)v132 + 1);
                    operator delete(v132);
                    v132 = v135;
                  }
                  while (v135 != &v285);
                }
              }
              double v136 = v337;
              if (v337 != 0.0)
              {
                double v137 = v336;
                double v138 = v335;
                uint64_t v139 = **(void **)&v336;
                *(void *)(v139 + 8) = *(void *)(*(void *)&v335 + 8);
                **(void **)(*(void *)&v138 + 8) = v139;
                double v140 = v285;
                *(double *)(*(void *)&v285 + 8) = v137;
                **(double **)&double v137 = v140;
                *(void *)(*(void *)&v138 + 8) = &v285;
                double v285 = v138;
                v287 += *(void *)&v136;
              }
              for (n = v286; n != &v285; n = (double *)*((void *)n + 1))
              {
                double v142 = n[2];
                unint64_t v143 = (unint64_t)(n[3] - v142);
                if (v143 >= 2)
                {
                  [v128 vkBounds];
                  double v145 = v144;
                  double v147 = v146;
                  double v149 = v148 - v144;
                  double v151 = v150 - v146;
                  unint64_t v152 = v143 - 1;
                  v153 = (float *)([v128 points] + 12 * (unint64_t)(v142 - v131) + 16);
                  do
                  {
                    double v154 = *v153;
                    double v155 = v149 * *(v153 - 4);
                    double v156 = v151 * *(v153 - 3);
                    double v157 = -(v155 - v149 * *(v153 - 1));
                    double v335 = v155 + v145;
                    double v336 = v156 + v147;
                    double v337 = v157;
                    double v338 = -(v156 - v151 * v154);
                    md::DebugConsoleMapRect::drawWorldSegment((uint64_t)&v308, &v335, &v303);
                    v153 += 3;
                    --v152;
                  }
                  while (v152);
                }
              }
              if (v287)
              {
                double v159 = v285;
                v158 = v286;
                uint64_t v160 = *(void *)v286;
                *(void *)(v160 + 8) = *(void *)(*(void *)&v285 + 8);
                **(void **)(*(void *)&v159 + 8) = v160;
                uint64_t v287 = 0;
                if (v158 != &v285)
                {
                  do
                  {
                    v161 = (double *)*((void *)v158 + 1);
                    operator delete(v158);
                    v158 = v161;
                  }
                  while (v161 != &v285);
                }
              }
            }
          }
          uint64_t v125 = [v124 countByEnumeratingWithState:&v289 objects:v342 count:16];
        }
        while (v125);
      }

      for (iuint64_t i = self->_tiles.__table_.__p1_.__value_.__next_; ii; iuint64_t i = (void *)*ii)
      {
        unint64_t v163 = ii[2];
        if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, v163))md::DebugConsoleMapRect::drawWorldRect((uint64_t)&v308, (double *)(v163 + 312), (__int8 *)&v304, 0); {
      }
        }
      for (juint64_t j = self->_pendingTiles.__table_.__p1_.__value_.__next_; jj; juint64_t j = (void *)*jj)
        md::DebugConsoleMapRect::drawWorldRect((uint64_t)&v308, (double *)(jj[2] + 312), (__int8 *)&v303, 0);
      double v336 = 0.0;
      {
        operator new();
      }
      double v338 = 0.0;
      double v337 = *(double *)&mdm::Allocator::instance(void)::alloc;
      double v335 = COERCE_DOUBLE(&v336);
      long long v281 = 0u;
      long long v282 = 0u;
      long long v283 = 0u;
      long long v284 = 0u;
      v165 = self->_visibleLabels;
      uint64_t v166 = [(NSMutableArray *)v165 countByEnumeratingWithState:&v281 objects:v341 count:16];
      if (v166)
      {
        uint64_t v167 = *(void *)v282;
        v270 = v165;
        do
        {
          for (kuint64_t k = 0; kk != v166; ++kk)
          {
            if (*(void *)v282 != v167) {
              objc_enumerationMutation(v165);
            }
            v169 = *(void **)(*((void *)&v281 + 1) + 8 * kk);
            v170 = [v169 navFeature];
            uint64_t v171 = [v170 routeOffset];
            unsigned int index = self->_routeUserOffset.index;
            if (index <= v171
              && (index != v171 || self->_routeUserOffset.offset <= *((float *)&v171 + 1)))
            {
              if ([v169 isJunctionLabel])
              {
                id v173 = v170;
                v174 = v173;
                double v175 = v336;
                v176 = &v336;
                v177 = &v336;
                if (v336 == 0.0)
                {
LABEL_120:
                  v179 = (uint64_t *)(*(uint64_t (**)(double, uint64_t, uint64_t))(**(void **)&v337 + 16))(COERCE_DOUBLE(*(void *)&v337), 40, 8);
                  v179[4] = (uint64_t)v174;
                  uint64_t *v179 = 0;
                  v179[1] = 0;
                  v179[2] = (uint64_t)v177;
                  *(void *)v176 = v179;
                  if (**(void **)&v335)
                  {
                    double v335 = **(double **)&v335;
                    v179 = *(uint64_t **)v176;
                  }
                  std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&v336, v179);
                  ++*(void *)&v338;
                }
                else
                {
                  while (1)
                  {
                    while (1)
                    {
                      v177 = *(double **)&v175;
                      unint64_t v178 = *(void *)(*(void *)&v175 + 32);
                      if ((unint64_t)v173 >= v178) {
                        break;
                      }
                      double v175 = *v177;
                      v176 = v177;
                      if (!*(void *)v177) {
                        goto LABEL_120;
                      }
                    }
                    if (v178 >= (unint64_t)v173) {
                      break;
                    }
                    double v175 = v177[1];
                    if (v175 == 0.0)
                    {
                      v176 = v177 + 1;
                      goto LABEL_120;
                    }
                  }
                }
                double v180 = *(double *)[v174 mercatorCoordinate];
                uint64_t v181 = [v174 mercatorCoordinate];
                if (v180 >= v311)
                {
                  double v182 = *(double *)(v181 + 8);
                  BOOL v183 = v180 >= v313 || v182 < v312;
                  if (!v183 && v182 < v314)
                  {
                    v185 = v308;
                    v308[12].i32[0] = -16776961;
                    double v186 = v321 + v315 * v180 + v318 * v182;
                    double v187 = v322 + v316 * v180 + v319 * v182;
                    double v188 = 1.0 / (v323 + v317 * v180 + v320 * v182);
                    *(float *)&double v186 = v188 * v186;
                    *(float *)&double v188 = v188 * v187;
                    *(float *)&double v187 = (float)(v330 + (float)(v324 * *(float *)&v186)) + (float)(v327 * *(float *)&v188);
                    float v189 = (float)(v331 + (float)(v325 * *(float *)&v186)) + (float)(v328 * *(float *)&v188);
                    *(float *)&double v188 = 1.0
                                    / (float)((float)(v332 + (float)(v326 * *(float *)&v186))
                                            + (float)(v329 * *(float *)&v188));
                    v185[1].f32[0] = *(float *)&v188 * *(float *)&v187;
                    v185[1].f32[1] = *(float *)&v188 * v189;
                    ggl::DebugConsole::drawSymbol(v185, 2);
                  }
                }
              }
              else
              {
                if (![v169 isRoadLabel]) {
                  goto LABEL_157;
                }
                unint64_t v190 = [v170 navJunctionA];
                v191 = (void *)v190;
                if (v190)
                {
                  double v192 = v336;
                  v193 = &v336;
                  v194 = &v336;
                  if (v336 == 0.0)
                  {
LABEL_142:
                    v196 = (uint64_t *)(*(uint64_t (**)(double, uint64_t, uint64_t))(**(void **)&v337 + 16))(COERCE_DOUBLE(*(void *)&v337), 40, 8);
                    v196[4] = (uint64_t)v191;
                    uint64_t *v196 = 0;
                    v196[1] = 0;
                    v196[2] = (uint64_t)v194;
                    *(void *)v193 = v196;
                    if (**(void **)&v335)
                    {
                      double v335 = **(double **)&v335;
                      v196 = *(uint64_t **)v193;
                    }
                    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&v336, v196);
                    ++*(void *)&v338;
                  }
                  else
                  {
                    while (1)
                    {
                      while (1)
                      {
                        v194 = *(double **)&v192;
                        unint64_t v195 = *(void *)(*(void *)&v192 + 32);
                        if (v190 >= v195) {
                          break;
                        }
                        double v192 = *v194;
                        v193 = v194;
                        if (!*(void *)v194) {
                          goto LABEL_142;
                        }
                      }
                      if (v195 >= v190) {
                        break;
                      }
                      double v192 = v194[1];
                      if (v192 == 0.0)
                      {
                        v193 = v194 + 1;
                        goto LABEL_142;
                      }
                    }
                  }
                  double v197 = *(double *)[v191 mercatorCoordinate];
                  uint64_t v198 = [v191 mercatorCoordinate];
                  v165 = v270;
                  if (v197 >= v311)
                  {
                    double v199 = *(double *)(v198 + 8);
                    BOOL v200 = v197 >= v313 || v199 < v312;
                    if (!v200 && v199 < v314)
                    {
                      v202 = v308;
                      v308[12].i32[0] = -16776961;
                      double v203 = v321 + v315 * v197 + v318 * v199;
                      double v204 = v322 + v316 * v197 + v319 * v199;
                      double v205 = 1.0 / (v323 + v317 * v197 + v320 * v199);
                      *(float *)&double v203 = v205 * v203;
                      *(float *)&double v205 = v205 * v204;
                      *(float *)&double v204 = (float)(v330 + (float)(v324 * *(float *)&v203))
                                      + (float)(v327 * *(float *)&v205);
                      float v206 = (float)(v331 + (float)(v325 * *(float *)&v203)) + (float)(v328 * *(float *)&v205);
                      *(float *)&double v205 = 1.0
                                      / (float)((float)(v332 + (float)(v326 * *(float *)&v203))
                                              + (float)(v329 * *(float *)&v205));
                      v202[1].f32[0] = *(float *)&v205 * *(float *)&v204;
                      v202[1].f32[1] = *(float *)&v205 * v206;
                      ggl::DebugConsole::drawSymbol(v202, 2);
                    }
                  }
                }
              }
            }
LABEL_157:
          }
          uint64_t v166 = [(NSMutableArray *)v165 countByEnumeratingWithState:&v281 objects:v341 count:16];
        }
        while (v166);
      }

      long long v279 = 0u;
      long long v280 = 0u;
      long long v277 = 0u;
      long long v278 = 0u;
      v207 = self->_junctions;
      uint64_t v208 = [(NSMutableArray *)v207 countByEnumeratingWithState:&v277 objects:v340 count:16];
      char v209 = v304;
      char v271 = BYTE1(v304);
      char v268 = BYTE2(v304);
      char v266 = HIBYTE(v304);
      if (v208)
      {
        uint64_t v210 = *(void *)v278;
        do
        {
          for (muint64_t m = 0; mm != v208; ++mm)
          {
            if (*(void *)v278 != v210) {
              objc_enumerationMutation(v207);
            }
            id v212 = *(id *)(*((void *)&v277 + 1) + 8 * mm);
            v213 = v212;
            double v214 = v336;
            v215 = &v336;
            v216 = &v336;
            if (v336 == 0.0)
            {
LABEL_175:
              v220 = (uint64_t *)(*(uint64_t (**)(double, uint64_t, uint64_t))(**(void **)&v337 + 16))(COERCE_DOUBLE(*(void *)&v337), 40, 8);
              v220[4] = (uint64_t)v213;
              uint64_t *v220 = 0;
              v220[1] = 0;
              v220[2] = (uint64_t)v216;
              *(void *)v215 = v220;
              if (**(void **)&v335)
              {
                double v335 = **(double **)&v335;
                v220 = *(uint64_t **)v215;
              }
              std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&v336, v220);
              ++*(void *)&v338;
            }
            else
            {
              double v217 = v336;
              do
              {
                unint64_t v218 = *(void *)(*(void *)&v217 + 32);
                if ((unint64_t)v212 >= v218)
                {
                  if (v218 >= (unint64_t)v212) {
                    goto LABEL_186;
                  }
                  *(void *)&v217 += 8;
                }
                double v217 = **(double **)&v217;
              }
              while (v217 != 0.0);
              while (1)
              {
                while (1)
                {
                  v216 = *(double **)&v214;
                  unint64_t v219 = *(void *)(*(void *)&v214 + 32);
                  if ((unint64_t)v212 >= v219) {
                    break;
                  }
                  double v214 = *v216;
                  v215 = v216;
                  if (!*(void *)v216) {
                    goto LABEL_175;
                  }
                }
                if (v219 >= (unint64_t)v212) {
                  break;
                }
                double v214 = v216[1];
                if (v214 == 0.0)
                {
                  v215 = v216 + 1;
                  goto LABEL_175;
                }
              }
            }
            uint64_t v221 = [v213 routeOffset];
            unsigned int v222 = self->_routeUserOffset.index;
            if (v222 <= v221
              && (v222 != v221 || self->_routeUserOffset.offset <= *((float *)&v221 + 1)))
            {
              double v223 = *(double *)[v213 mercatorCoordinate];
              uint64_t v224 = [v213 mercatorCoordinate];
              if (v223 >= v311 && v223 < v313)
              {
                double v225 = *(double *)(v224 + 8);
                if (v225 >= v312 && v225 < v314)
                {
                  v226 = v308;
                  v308[12].i8[0] = v209;
                  v226[12].i8[1] = v271;
                  v226[12].i8[2] = v268;
                  v226[12].i8[3] = v266;
                  double v227 = v321 + v315 * v223 + v318 * v225;
                  double v228 = v322 + v316 * v223 + v319 * v225;
                  double v229 = 1.0 / (v323 + v317 * v223 + v320 * v225);
                  *(float *)&double v227 = v229 * v227;
                  *(float *)&double v229 = v229 * v228;
                  *(float *)&double v228 = (float)(v330 + (float)(v324 * *(float *)&v227)) + (float)(v327 * *(float *)&v229);
                  float v230 = (float)(v331 + (float)(v325 * *(float *)&v227)) + (float)(v328 * *(float *)&v229);
                  *(float *)&double v229 = 1.0
                                  / (float)((float)(v332 + (float)(v326 * *(float *)&v227))
                                          + (float)(v329 * *(float *)&v229));
                  v226[1].f32[0] = *(float *)&v229 * *(float *)&v228;
                  v226[1].f32[1] = *(float *)&v229 * v230;
                  ggl::DebugConsole::drawSymbol(v226, 2);
                }
              }
            }
LABEL_186:
          }
          uint64_t v208 = [(NSMutableArray *)v207 countByEnumeratingWithState:&v277 objects:v340 count:16];
        }
        while (v208);
      }

      uint64_t v231 = 0;
      char v263 = v303;
      char v262 = BYTE1(v303);
      char v261 = BYTE2(v303);
      char v259 = HIBYTE(v303);
      char v264 = v209;
      do
      {
        char v232 = v209;
        char v233 = v271;
        char v234 = v268;
        char v235 = v266;
        if (v231)
        {
          if (v231 == 2)
          {
            char v232 = 0;
            char v233 = -1;
            char v234 = -1;
            char v235 = -1;
          }
          else if (v231 == 1)
          {
            char v234 = 0;
            char v232 = -1;
            char v233 = -1;
            char v235 = -1;
          }
          else
          {
            char v232 = v263;
            char v233 = v262;
            char v234 = v261;
            char v235 = v259;
          }
        }
        v236 = [(VKLabelNavRoadGraph *)self->_roadGraph junctionListForDepth:v231];
        long long v275 = 0u;
        long long v276 = 0u;
        long long v273 = 0u;
        long long v274 = 0u;
        id v237 = v236;
        uint64_t v238 = [v237 countByEnumeratingWithState:&v273 objects:v339 count:16];
        if (v238)
        {
          uint64_t v240 = *(void *)v274;
          do
          {
            for (uint64_t nn = 0; nn != v238; ++nn)
            {
              if (*(void *)v274 != v240) {
                objc_enumerationMutation(v237);
              }
              v242 = *(void **)(*((void *)&v273 + 1) + 8 * nn);
              for (double i1 = v336; i1 != 0.0; double i1 = **(double **)&i1)
              {
                unint64_t v253 = *(void *)(*(void *)&i1 + 32);
                if ((unint64_t)v242 >= v253)
                {
                  if (v253 >= (unint64_t)v242) {
                    goto LABEL_198;
                  }
                  *(void *)&i1 += 8;
                }
              }
              double v244 = *(double *)[*(id *)(*((void *)&v273 + 1) + 8 * nn) mercatorCoordinate];
              uint64_t v245 = [v242 mercatorCoordinate];
              double v239 = v311;
              if (v244 >= v311)
              {
                double v239 = *(double *)(v245 + 8);
                BOOL v246 = v244 >= v313 || v239 < v312;
                if (!v246 && v239 < v314)
                {
                  v248 = v308;
                  v308[12].i8[0] = v232;
                  v248[12].i8[1] = v233;
                  v248[12].i8[2] = v234;
                  v248[12].i8[3] = v235;
                  double v249 = v321 + v315 * v244 + v318 * v239;
                  double v250 = v322 + v316 * v244 + v319 * v239;
                  double v251 = 1.0 / (v323 + v317 * v244 + v320 * v239);
                  *(float *)&double v249 = v251 * v249;
                  *(float *)&double v251 = v251 * v250;
                  *(float *)&double v250 = (float)(v330 + (float)(v324 * *(float *)&v249)) + (float)(v327 * *(float *)&v251);
                  float v252 = (float)(v331 + (float)(v325 * *(float *)&v249)) + (float)(v328 * *(float *)&v251);
                  *(float *)&double v251 = 1.0
                                  / (float)((float)(v332 + (float)(v326 * *(float *)&v249))
                                          + (float)(v329 * *(float *)&v251));
                  v248[1].f32[0] = *(float *)&v251 * *(float *)&v250;
                  v248[1].f32[1] = *(float *)&v251 * v252;
                  ggl::DebugConsole::drawSymbol(v248, 0);
                }
              }
LABEL_198:
              ;
            }
            uint64_t v238 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v273, v339, 16, v239);
          }
          while (v238);
        }

        char v209 = v264;
        ++v231;
      }
      while (v231 != 3);
      std::__tree<VKTrafficIncidentFeature * {__strong},VKTrafficIncidentFeatureSetLessThan,geo::StdAllocator<VKTrafficIncidentFeature * {__strong},mdm::Allocator>>::destroy((uint64_t)&v335, *(uint64_t *)&v336);
      if (__p) {
        operator delete(__p);
      }
      std::__tree<VKPolylineGroupOverlay * {__strong}>::destroy(v301[0]);
      std::__tree<std::__value_type<GEOComposedRouteSection * {__strong},std::vector<std::pair<int,int>>>,std::__map_value_compare<GEOComposedRouteSection * {__strong},std::__value_type<GEOComposedRouteSection * {__strong},std::vector<std::pair<int,int>>>,std::less<GEOComposedRouteSection * {__strong}>,true>,std::allocator<std::__value_type<GEOComposedRouteSection * {__strong},std::vector<std::pair<int,int>>>>>::destroy(v302[0]);
    }
  }
  double v272 = *((float *)a4->var3 + 105);
  md::DebugConsoleMapRect::drawWorldArrow((uint64_t)&v308, &v272, &v334, v256, v59, v254 * 22.0, v254 * 12.0);
}

- (void)drawRoadSignOrientationDebugView:(void *)a3 navContext:(NavContext *)a4
{
  uint64_t v259 = *MEMORY[0x1E4F143B8];
  var3 = a4->var3;
  uint64_t v7 = *((void *)var3 + 112);
  v236 = (void *)*((void *)var3 + 108);
  uint64_t v237 = v7;
  uint64_t v8 = *((void *)var3 + 120);
  uint64_t v238 = *((void *)var3 + 116);
  uint64_t v239 = v8;
  uint64_t v9 = *((void *)var3 + 113);
  uint64_t v240 = *((void *)var3 + 109);
  uint64_t v241 = v9;
  uint64_t v10 = *((void *)var3 + 121);
  uint64_t v242 = *((void *)var3 + 117);
  uint64_t v243 = v10;
  uint64_t v11 = *((void *)var3 + 114);
  uint64_t v244 = *((void *)var3 + 110);
  uint64_t v245 = v11;
  uint64_t v12 = *((void *)var3 + 122);
  uint64_t v246 = *((void *)var3 + 118);
  uint64_t v247 = v12;
  uint64_t v13 = *((void *)var3 + 115);
  uint64_t v248 = *((void *)var3 + 111);
  uint64_t v249 = v13;
  uint64_t v14 = *((void *)var3 + 123);
  uint64_t v250 = *((void *)var3 + 119);
  uint64_t v251 = v14;
  [(VKLabelNavRoadGraph *)self->_roadGraph unitHeading];
  float v16 = v15;
  float v18 = v17;
  float64x2_t v19 = v252;
  float64x2_t v20 = v256;
  float64x2_t v21 = v254;
  double v175 = v255;
  double v176 = v253;
  double v174 = v257;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  obint j = self->_visibleLabels;
  uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v232 objects:v258 count:16];
  if (v22)
  {
    int v23 = 0;
    double v24 = 1.0 / (v174 + v176 * v16 + v175 * v18);
    float v25 = v24 * (v20.f64[0] + v19.f64[0] * v16 + v21.f64[0] * v18);
    *(float *)&double v24 = v24 * (v20.f64[1] + v19.f64[1] * v16 + v21.f64[1] * v18);
    uint64_t v220 = *(void *)v233;
    float v26 = 40.0 / sqrtf((float)(v25 * v25) + (float)(*(float *)&v24 * *(float *)&v24));
    float v172 = v26 * *(float *)&v24;
    float v173 = v26 * v25;
    do
    {
      uint64_t v221 = v22;
      for (uint64_t i = 0; i != v221; ++i)
      {
        if (*(void *)v233 != v220) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v232 + 1) + 8 * i);
        float64x2_t v29 = [v28 navFeature];
        uint64_t v30 = [v29 routeOffset];
        unsigned int index = self->_routeUserOffset.index;
        if (index <= v30
          && (index != v30 || self->_routeUserOffset.offset <= *((float *)&v30 + 1))
          && *(void *)[v28 label])
        {
          uint64_t v32 = [v28 label];
          float64x2_t v33 = *(double **)v32;
          uint64_t v34 = *(void *)(*(void *)v32 + 160);
          if (v34)
          {
            (*(void (**)(uint64_t))(*(void *)v34 + 56))(v34);
          }
          else
          {
            double v35 = v33[14];
            double v36 = v33[15];
            double v37 = v33[16];
          }
          v38 = a4->var3;
          double v39 = *((float *)v38 + 12);
          if (*((unsigned char *)v38 + 8))
          {
            double v226 = v35;
            double v228 = v36;
            double v40 = v39 * (0.0000000249532021 * v37);
          }
          else
          {
            double v41 = v37 * v39;
            long double v42 = v35 * 6.28318531;
            long double v43 = exp(v36 * 6.28318531 + -3.14159265);
            double v44 = atan(v43) * 2.0 + -1.57079633;
            long double v45 = fmod(v42, 6.28318531);
            double v46 = fmod(v45 + 6.28318531, 6.28318531) + -3.14159265;
            __double2 v47 = __sincos_stret(v44);
            double v48 = 6378137.0 / sqrt(v47.__sinval * v47.__sinval * -0.00669437999 + 1.0);
            double v49 = (v48 + v41) * v47.__cosval;
            __double2 v50 = __sincos_stret(v46);
            double v226 = v49 * v50.__cosval;
            double v228 = v49 * v50.__sinval;
            double v40 = (v41 + v48 * 0.99330562) * v47.__sinval;
          }
          double v224 = v40;
          double v212 = *((double *)v38 + 115);
          double v213 = *((double *)v38 + 111);
          double v210 = *((double *)v38 + 123);
          double v211 = *((double *)v38 + 119);
          float64x2_t v214 = *((float64x2_t *)v38 + 54);
          float64x2_t v215 = *((float64x2_t *)v38 + 56);
          float64x2_t v222 = *((float64x2_t *)v38 + 60);
          float64x2_t v216 = *((float64x2_t *)v38 + 58);
          id v51 = v29;
          if ([v28 isRoadLabel])
          {
            if (([v51 isAwayFromRoute] & 1) == 0)
            {
              long double v52 = [v51 navJunctionA];
              long double v53 = [v52 outgoingRoad];
              BOOL v54 = v53 == 0;

              if (!v54)
              {
                [v51 direction2D];
                float v205 = v55;
                float v204 = v56;
                float64x2_t v201 = v252;
                float64x2_t v202 = v254;
                float64x2_t v203 = v256;
                double v57 = [v51 navJunctionA];
                uint64_t v58 = [v57 mercatorCoordinate];
                float64x2_t v208 = *(float64x2_t *)v58;
                double v206 = *(double *)(v58 + 16);

                double v59 = a4->var3;
                double v60 = *((float *)v59 + 12);
                if (*((unsigned char *)v59 + 8))
                {
                  double v200 = v60 * 0.0000000249532021 * v206;
                  long double v61 = exp(v208.f64[1] * 6.28318531 + -3.14159265);
                  double v62 = atan(v61);
                  double v199 = v208.f64[1];
                  double v198 = v208.f64[0];
                }
                else
                {
                  double v63 = v206 * v60;
                  long double v64 = exp(v208.f64[1] * 6.28318531 + -3.14159265);
                  double v62 = atan(v64);
                  long double v65 = fmod(v208.f64[0] * 6.28318531, 6.28318531);
                  double v66 = fmod(v65 + 6.28318531, 6.28318531) + -3.14159265;
                  __double2 v67 = __sincos_stret(v62 * 2.0 + -1.57079633);
                  double v68 = 6378137.0 / sqrt(v67.__sinval * v67.__sinval * -0.00669437999 + 1.0);
                  double v69 = (v68 + v63) * v67.__cosval;
                  __double2 v70 = __sincos_stret(v66);
                  double v198 = v69 * v70.__cosval;
                  double v199 = v69 * v70.__sinval;
                  double v200 = (v63 + v68 * 0.99330562) * v67.__sinval;
                }
                double v192 = *((double *)v59 + 115);
                double v193 = *((double *)v59 + 111);
                double v190 = *((double *)v59 + 123);
                double v191 = *((double *)v59 + 119);
                float64x2_t v194 = *((float64x2_t *)v59 + 54);
                float64x2_t v195 = *((float64x2_t *)v59 + 56);
                float64x2_t v196 = *((float64x2_t *)v59 + 58);
                float64x2_t v197 = *((float64x2_t *)v59 + 60);
                double v71 = v62 * 114.591559 + -90.0;
                double v187 = cos(v71 * 0.034906585);
                double v185 = cos(v71 * 0.0698131701);
                double v183 = cos(v71 * 0.104719755);
                double v72 = v71 * 0.00872664626;
                long double v73 = tan(v72 + 0.78103484);
                double v181 = log(v73);
                long double v74 = tan(v72 + 0.789761487);
                double v75 = log(v74);
                v76 = [v51 navJunctionA];
                double v77 = [v76 outgoingRoad];
                [v77 direction3D];
                float v79 = v78;
                float v81 = v80;
                float v83 = v82;

                v84 = [v51 navJunctionA];
                v85 = [v84 incomingRoad];
                [v85 direction3D];
                unsigned int v179 = v86;
                unsigned int v178 = v87;
                float v177 = v88;

                float v89 = fabs((v75 - v181) * 0.159154943) / (v187 * -559.82 + 111132.92 + v185 * 1.175 + v183 * -0.0023);
                float v90 = v89 * 10.0;
                double v91 = (float)((float)(v89 * 10.0) * v83);
                float64x2_t v92 = v208;
                double v93 = v208.f64[0] + (float)((float)(v89 * 10.0) * v79);
                double v94 = v208.f64[1] + (float)((float)(v89 * 10.0) * v81);
                double v95 = v206 + v91;
                v96 = a4->var3;
                double v97 = *((float *)v96 + 12);
                int v98 = *((unsigned __int8 *)v96 + 8);
                if (*((unsigned char *)v96 + 8))
                {
                  double v99 = v97 * 0.0000000249532021 * v95;
                  double v100 = 1.0;
                }
                else
                {
                  double v101 = v95 * v97;
                  long double v102 = v93 * 6.28318531;
                  float v188 = v90;
                  long double v103 = exp(v94 * 6.28318531 + -3.14159265);
                  double v104 = atan(v103) * 2.0 + -1.57079633;
                  long double v105 = fmod(v102, 6.28318531);
                  double v106 = fmod(v105 + 6.28318531, 6.28318531) + -3.14159265;
                  __double2 v107 = __sincos_stret(v104);
                  double v100 = 1.0;
                  double v108 = 6378137.0 / sqrt(v107.__sinval * v107.__sinval * -0.00669437999 + 1.0);
                  double v109 = (v108 + v101) * v107.__cosval;
                  __double2 v110 = __sincos_stret(v106);
                  float v90 = v188;
                  float64x2_t v92 = v208;
                  double v93 = v109 * v110.__cosval;
                  double v94 = v109 * v110.__sinval;
                  double v99 = (v101 + v108 * 0.99330562) * v107.__sinval;
                }
                double v111 = v206 + (float)(v90 * v177);
                float64x2_t v112 = vaddq_f64(v92, vcvtq_f64_f32(vmul_n_f32((float32x2_t)__PAIR64__(v178, v179), v90)));
                double v113 = *((double *)v96 + 111);
                double v114 = *((double *)v96 + 115);
                double v115 = *((double *)v96 + 123);
                double v116 = *((double *)v96 + 119);
                float64x2_t v117 = *((float64x2_t *)v96 + 54);
                float64x2_t v118 = *((float64x2_t *)v96 + 56);
                float64x2_t v119 = *((float64x2_t *)v96 + 60);
                float64x2_t v120 = *((float64x2_t *)v96 + 58);
                v236 = (void *)vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v119, v117, v93), v118, v94), v120, v99), v100 / (v115 + v113 * v93 + v114 * v94 + v116 * v99)));
                double v121 = v112.f64[1];
                if (v98)
                {
                  double v122 = v97 * 0.0000000249532021 * v111;
                }
                else
                {
                  double v123 = v111 * v97;
                  long double v124 = v112.f64[0] * 6.28318531;
                  float64x2_t v209 = v119;
                  double v207 = v113;
                  float64x2_t v186 = v117;
                  float64x2_t v189 = v118;
                  float64x2_t v184 = v120;
                  double v182 = v114;
                  long double v125 = exp(v112.f64[1] * 6.28318531 + -3.14159265);
                  double v126 = atan(v125) * 2.0 + -1.57079633;
                  long double v127 = fmod(v124, 6.28318531);
                  double v180 = fmod(v127 + 6.28318531, 6.28318531) + -3.14159265;
                  __double2 v128 = __sincos_stret(v126);
                  double v129 = 6378137.0 / sqrt(v100 + v128.__sinval * v128.__sinval * -0.00669437999);
                  double v130 = (v129 + v123) * v128.__cosval;
                  __double2 v131 = __sincos_stret(v180);
                  double v114 = v182;
                  float64x2_t v120 = v184;
                  float64x2_t v117 = v186;
                  float64x2_t v118 = v189;
                  double v113 = v207;
                  float64x2_t v119 = v209;
                  v112.f64[0] = v130 * v131.__cosval;
                  double v121 = v130 * v131.__sinval;
                  double v122 = (v123 + v129 * 0.99330562) * v128.__sinval;
                }
                float32x2_t v132 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v197, v194, v198), v195, v199), v196, v200), v100 / (v190 + v193 * v198 + v192 * v199 + v191 * v200)));
                float32x2_t v230 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v119, v117, v112.f64[0]), v118, v121), v120, v122), v100 / (v115 + v113 * v112.f64[0] + v114 * v121 + v116 * v122)));
                *((float32x2_t *)a3 + 1) = v132;
                ggl::DebugConsole::drawSymbol((float32x2_t *)a3, 2);
                *((float32x2_t *)a3 + 1) = v132;
                ggl::DebugConsole::drawLine((uint64_t)a3, (float *)&v236);
                *((float32x2_t *)a3 + 1) = v132;
                *(float *)&double v133 = ggl::DebugConsole::drawLine((uint64_t)a3, (float *)&v230);
                -[LabelNavRouteLabeler createRoadSignOrientationResolver:navContext:](self, "createRoadSignOrientationResolver:navContext:", v51, a4, v133);
                float32x2_t v134 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v222, v214, v226), v215, v228), v216, v224), 1.0 / (v210 + v213 * v226 + v212 * v228 + v211 * v224)));
                float32x2_t v135 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v203, v201, v205), v202, v204), 1.0 / (v174 + v176 * v205 + v175 * v204)));
                float v229 = v134.f32[1] + -40.0;
                float v225 = v134.f32[0];
                float v223 = v134.f32[0] + -40.0;
                float v227 = v134.f32[1] + -80.0;
                float32x2_t v217 = vmul_n_f32(v135, 1.0 / sqrtf(vaddv_f32(vmul_f32(v135, v135))));
                float v136 = atan2f(v217.f32[1], v217.f32[0]);
                for (int j = 0; j != 20; ++j)
                {
                  int v138 = 0;
                  float v139 = v223 + (float)(4 * j);
                  float v140 = v139 - v225;
                  float v141 = v139 + -2.0;
                  float v142 = v139 + 2.0;
                  do
                  {
                    float v146 = v227 + (float)(4 * v138);
                    float v147 = 1.0 / sqrtf((float)(v140 * v140) + (float)((float)(v146 - v229) * (float)(v146 - v229)));
                    float v148 = atan2f(v147 * (float)(v146 - v229), v147 * v140);
                    long double v149 = fmod((float)(v148 - v136) + 6.28318531, 6.28318531);
                    float v150 = fmod(v149 + 6.28318531, 6.28318531);
                    float v151 = fmodf(v150, 6.2832);
                    float v152 = fmodf(v151 + 6.2832, 6.2832);
                    double v154 = (float *)(v236 + 1);
                    v153 = (float *)*v236;
                    if ((void *)*v236 != v236 + 1)
                    {
                      unint64_t v155 = 0;
                      double v156 = (float *)*v236;
                      do
                      {
                        double v157 = (float *)*((void *)v156 + 1);
                        if (v157)
                        {
                          do
                          {
                            v158 = v157;
                            double v157 = *(float **)v157;
                          }
                          while (v157);
                        }
                        else
                        {
                          do
                          {
                            v158 = (float *)*((void *)v156 + 2);
                            BOOL v159 = *(void *)v158 == (void)v156;
                            double v156 = v158;
                          }
                          while (!v159);
                        }
                        ++v155;
                        double v156 = v158;
                      }
                      while (v158 != v154);
                      do
                      {
                        unint64_t v160 = v155 >> 1;
                        v161 = v153;
                        if (v155 != 1)
                        {
                          uint64_t v163 = v155 >> 1;
                          v164 = v153;
                          do
                          {
                            uint64_t v166 = (float *)*((void *)v164 + 1);
                            if (v166)
                            {
                              do
                              {
                                v161 = v166;
                                uint64_t v166 = *(float **)v166;
                              }
                              while (v166);
                            }
                            else
                            {
                              do
                              {
                                v161 = (float *)*((void *)v164 + 2);
                                BOOL v159 = *(void *)v161 == (void)v164;
                                v164 = v161;
                              }
                              while (!v159);
                            }
                            v164 = v161;
                          }
                          while (v163-- > 1);
                        }
                        if (v152 >= v161[8])
                        {
                          v162 = (float *)*((void *)v161 + 1);
                          if (v162)
                          {
                            do
                            {
                              v153 = v162;
                              v162 = *(float **)v162;
                            }
                            while (v162);
                          }
                          else
                          {
                            do
                            {
                              v153 = (float *)*((void *)v161 + 2);
                              BOOL v159 = *(void *)v153 == (void)v161;
                              v161 = v153;
                            }
                            while (!v159);
                          }
                          unint64_t v160 = v155 + ~v160;
                        }
                        unint64_t v155 = v160;
                      }
                      while (v160);
                    }
                    if (v153 == v154
                      || ((float v167 = v153[7], v168 = v153[8], v152 >= v167) ? (v169 = v152 < v168) : (v169 = 0),
                          !v169
                       || ((float v170 = v168 - *(float *)&v237, (float)(*(float *)&v237 + v167) <= v152)
                         ? (BOOL v171 = v170 < v152)
                         : (BOOL v171 = 1),
                           v171)))
                    {
                      int v143 = 0;
                    }
                    else
                    {
                      int v23 = *((unsigned __int8 *)v153 + 36);
                      int v143 = 1;
                    }
                    if (v23) {
                      int v144 = 0;
                    }
                    else {
                      int v144 = v143;
                    }
                    int v145 = v144 << 31 >> 31;
                    if (!v23) {
                      int v143 = 0;
                    }
                    *((unsigned char *)a3 + 96) = v145;
                    *((unsigned char *)a3 + 97) = 0;
                    *((unsigned char *)a3 + 98) = v143 << 31 >> 31;
                    *((unsigned char *)a3 + 99) = -1;
                    v230.f32[0] = v141;
                    v230.f32[1] = v146 + -2.0;
                    v231.f32[0] = v142;
                    v231.f32[1] = v146 + 2.0;
                    *((float *)a3 + 2) = v141;
                    *((float *)a3 + 3) = v146 + -2.0;
                    ggl::DebugConsole::drawRectangleWithFill((float32x2_t *)a3, &v231, v146 + -2.0);
                    ++v138;
                  }
                  while (v138 != 20);
                }
                *((_DWORD *)a3 + 24) = -1;
                v230.f32[0] = v225 + v173;
                v230.f32[1] = v229 + v172;
                *((float *)a3 + 2) = v225;
                *((float *)a3 + 3) = v229;
                ggl::DebugConsole::drawLine((uint64_t)a3, (float *)&v230);
                *((_DWORD *)a3 + 24) = -16711681;
                float32x2_t v230 = vmla_f32((float32x2_t)__PAIR64__(LODWORD(v229), LODWORD(v225)), (float32x2_t)vdup_n_s32(0x42200000u), v217);
                *((float *)a3 + 2) = v225;
                *((float *)a3 + 3) = v229;
                ggl::DebugConsole::drawLine((uint64_t)a3, (float *)&v230);
              }
            }
          }
        }
      }
      uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v232 objects:v258 count:16];
    }
    while (v22);
  }
}

- (void)debugDraw:(id)a3 overlayConsole:(void *)a4 navContext:(NavContext *)a5
{
  id v14 = a3;
  uint64_t v8 = +[VKDebugSettings sharedSettings];
  int v9 = [v8 showNavLabelOverlay];

  if (v9) {
    [(LabelNavRouteLabeler *)self drawNavOverlayDebugView:a4 navContext:a5];
  }
  uint64_t v10 = +[VKDebugSettings sharedSettings];
  int v11 = [v10 enableNavRoadSignOrientationDebugging];

  if (v11) {
    [(LabelNavRouteLabeler *)self drawRoadSignOrientationDebugView:a4 navContext:a5];
  }
  uint64_t v12 = +[VKDebugSettings sharedSettings];
  int v13 = [v12 showNavLabelRouteAvoidanceOverlay];

  if (v13) {
    [(VKLabelNavRoadGraph *)self->_roadGraph debugDraw:v14 overlayConsole:a4 navContext:a5];
  }
}

- (BOOL)needsDebugDraw
{
  v2 = +[VKDebugSettings sharedSettings];
  if ([v2 showNavLabelOverlay])
  {
    char v3 = 1;
  }
  else
  {
    int v4 = +[VKDebugSettings sharedSettings];
    if ([v4 enableNavRoadSignOrientationDebugging])
    {
      char v3 = 1;
    }
    else
    {
      int v5 = +[VKDebugSettings sharedSettings];
      char v3 = [v5 showNavLabelRouteAvoidanceOverlay];
    }
  }

  return v3;
}

- (void).cxx_destruct
{
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((void *)self->_rightTurnOrientations._storage.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((void *)self->_leftTurnOrientations._storage.__tree_.__pair1_.__value_.__left_);
  begin = self->_avoidanceRects.__begin_;
  if (begin)
  {
    self->_avoidanceRects.__end_ = begin;
    (*(void (**)(Allocator *, AvoidanceRectWithPriority *, int64_t))(*(void *)self->_avoidanceRects.__end_cap_.__value__2._allocator
                                                                                     + 40))(self->_avoidanceRects.__end_cap_.__value__2._allocator, begin, self->_avoidanceRects.__end_cap_.__value_ - begin);
  }
  cntrl = self->_styleManager.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    int v5 = self->_currentRoadSign.__cntrl_;
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    int v5 = self->_currentRoadSign.__cntrl_;
    if (!v5) {
      goto LABEL_9;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v5 + 16))(v5);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
LABEL_9:
  objc_storeStrong((id *)&self->_currentShieldGroup, 0);
  objc_storeStrong((id *)&self->_currentRoadName, 0);
  objc_storeStrong((id *)&self->_routeRoadInfos, 0);
  objc_storeStrong((id *)&self->_guidanceStepInfos, 0);
  objc_storeStrong((id *)&self->_roadNamesInGuidance, 0);
  objc_storeStrong((id *)&self->_visibleShieldGroups, 0);
  objc_storeStrong((id *)&self->_visibleLabels, 0);
  objc_storeStrong((id *)&self->_visibleLabelsByName, 0);
  objc_storeStrong((id *)&self->_fadingLabels, 0);
  int v6 = (char *)self->_visibleSigns.__begin_;
  if (v6)
  {
    end = (char *)self->_visibleSigns.__end_;
    uint64_t v8 = self->_visibleSigns.__begin_;
    if (end != v6)
    {
      do
      {
        int v9 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, void *))v9->__on_zero_shared)(v9, v8);
          std::__shared_weak_count::__release_weak(v9);
        }
        end -= 16;
      }
      while (end != v6);
      uint64_t v8 = self->_visibleSigns.__begin_;
    }
    self->_visibleSigns.__end_ = v6;
    (*(void (**)(Allocator *, void *, int64_t))(*(void *)self->_visibleSigns.__end_cap_.__value__2._allocator
                                                                + 40))(self->_visibleSigns.__end_cap_.__value__2._allocator, v8, (char *)self->_visibleSigns.__end_cap_.__value_ - (char *)v8);
  }
  uint64_t v10 = (char *)self->_activeSigns.__begin_;
  if (v10)
  {
    int v11 = (char *)self->_activeSigns.__end_;
    uint64_t v12 = self->_activeSigns.__begin_;
    if (v11 != v10)
    {
      do
      {
        int v13 = (std::__shared_weak_count *)*((void *)v11 - 1);
        if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, void *))v13->__on_zero_shared)(v13, v12);
          std::__shared_weak_count::__release_weak(v13);
        }
        v11 -= 16;
      }
      while (v11 != v10);
      uint64_t v12 = self->_activeSigns.__begin_;
    }
    self->_activeSigns.__end_ = v10;
    (*(void (**)(Allocator *, void *, int64_t))(*(void *)self->_activeSigns.__end_cap_.__value__2._allocator
                                                                + 40))(self->_activeSigns.__end_cap_.__value__2._allocator, v12, (char *)self->_activeSigns.__end_cap_.__value_ - (char *)v12);
  }
  objc_storeStrong((id *)&self->_roadGraph, 0);
  objc_storeStrong((id *)&self->_junctions, 0);
  next = self->_pendingTiles.__table_.__p1_.__value_.__next_;
  while (next)
  {
    float v15 = next;
    next = (void *)*next;
    float v16 = (std::__shared_weak_count *)v15[3];
    if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
    (*(void (**)(Allocator *, void *, uint64_t))(*(void *)self->_pendingTiles.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_pendingTiles.__table_.__p1_.__value__2._allocator, v15, 32);
  }
  unint64_t value = self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_;
  self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Allocator *, void **, unint64_t))(*(void *)self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
  }
                                                                   + 40))(self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, value, 8 * self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  float v18 = self->_tiles.__table_.__p1_.__value_.__next_;
  while (v18)
  {
    float64x2_t v19 = v18;
    float v18 = (void *)*v18;
    float64x2_t v20 = (std::__shared_weak_count *)v19[3];
    if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
    (*(void (**)(Allocator *, void *, uint64_t))(*(void *)self->_tiles.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_tiles.__table_.__p1_.__value__2._allocator, v19, 32);
  }
  float64x2_t v21 = self->_tiles.__table_.__bucket_list_.__ptr_.__value_;
  self->_tiles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v21) {
    (*(void (**)(Allocator *, void **, unint64_t))(*(void *)self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
  }
                                                                   + 40))(self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, v21, 8 * self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  objc_storeStrong((id *)&self->_currentLocationText, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

- (void)setDebugEnableShieldsOnRouteLine:(BOOL)a3
{
  self->_debugEnableShieldsOnRouteLine = a3;
}

- (BOOL)debugEnableShieldsOnRouteLine
{
  return self->_debugEnableShieldsOnRouteLine;
}

- (const)visibleSigns
{
  return &self->_visibleSigns;
}

- (void)artworkCache
{
  return self->_artworkCache;
}

- (BOOL)debugDisableRoadSignLimit
{
  return self->_debugDisableRoadSignLimit;
}

- (void)setCurrentShieldGroup:(id)a3
{
}

- (NSString)currentShieldGroup
{
  return self->_currentShieldGroup;
}

- (void)setCurrentRoadName:(id)a3
{
}

- (NSString)currentRoadName
{
  return self->_currentRoadName;
}

- (const)activeSigns
{
  return &self->_activeSigns;
}

- (NSString)currentLocationText
{
  return self->_currentLocationText;
}

- (PolylineCoordinate)routeUserOffset
{
  return self->_routeUserOffset;
}

- (void)setDrawRoadSigns:(BOOL)a3
{
  self->_drawRoadSigns = a3;
}

- (BOOL)drawRoadSigns
{
  return self->_drawRoadSigns;
}

- (VKPolylineOverlay)route
{
  return self->_route;
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (unsigned)computeRoutePositionForPOIAtPixel:(const void *)a3 currentPosition:(unsigned __int8)a4 context:(NavContext *)a5
{
  if (self->_isOnRoute) {
    return [(VKLabelNavRoadGraph *)self->_roadGraph computeRoutePositionForPOIAtPixel:a3 currentPosition:a4 context:a5];
  }
  else {
    return 9;
  }
}

- (BOOL)_updateActiveRouteRange
{
  uint64_t v52 = 0;
  long double v53 = &v52;
  uint64_t v54 = 0x5012000000;
  float v55 = __Block_byref_object_copy__28391;
  float v56 = __Block_byref_object_dispose__28392;
  double v57 = "";
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v58 = 0;
  {
    operator new();
  }
  uint64_t v61 = mdm::Allocator::instance(void)::alloc;
  v51[0] = 0;
  v51[1] = v51;
  v2.n128_u64[0] = 0x4012000000;
  v51[2] = 0x4012000000;
  v51[3] = __Block_byref_object_copy__17;
  v51[4] = __Block_byref_object_dispose__18;
  v51[5] = "";
  v51[6] = 0xBF80000000000000;
  int v4 = self;
  for (uint64_t i = self->_tiles.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    int v6 = *(void **)(i[2] + 24);
    uint64_t v7 = (std::__shared_weak_count *)v6[1];
    v50[0] = *v6;
    v50[1] = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = [(VKPolylineOverlay *)v4->_route composedRoute];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __47__LabelNavRouteLabeler__updateActiveRouteRange__block_invoke;
    v49[3] = &unk_1E5A93750;
    v49[5] = &v52;
    v49[6] = i + 2;
    v49[4] = v51;
    [v8 forEachSnappedPath:v49];

    if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  unint64_t v9 = v53[6];
  unint64_t v10 = v53[7];
  unint64_t v11 = 126 - 2 * __clz((uint64_t)(v10 - v9) >> 4);
  if (v10 == v9) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11;
  }
  *(double *)&long long v13 = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RouteJunctionInfo *,false>(v9, v10, v12, 1, v2);
  float v15 = v53;
  float v16 = (long long *)v53[6];
  float v17 = (long long *)v53[7];
  float v18 = v16;
  if (v16 == v17)
  {
LABEL_23:
    int v23 = (long long *)v53[6];
    float v17 = v18;
  }
  else
  {
    float64x2_t v19 = v16 - 1;
    do
    {
      if (v19 + 2 == v17)
      {
        float v18 = (long long *)v53[7];
        goto LABEL_23;
      }
      uint64_t v20 = *((void *)v19 + 3);
      uint64_t v21 = *((void *)v19++ + 5);
    }
    while (v20 != v21);
    uint64_t v22 = v19 + 2;
    if (v19 + 2 != v17)
    {
      do
      {
        if (*((void *)v19 + 1) != *((void *)v22 + 1))
        {
          long long v13 = *v22;
          v19[1] = *v22;
          ++v19;
        }
        ++v22;
      }
      while (v22 != v17);
      float v16 = (long long *)v15[6];
      float v17 = (long long *)v15[7];
    }
    double v24 = v19 + 1;
    if (v19 + 1 == v17)
    {
      int v23 = v16;
    }
    else
    {
      int v23 = v16;
      v15[7] = (uint64_t)v24;
      float v17 = (long long *)v15[7];
    }
  }
  if ((unint64_t)((char *)v17 - (char *)v23) < 0x11)
  {
    if (v4->_useRouteSubrange) {
      goto LABEL_43;
    }
    goto LABEL_72;
  }
  if (!v4->_isOnRoute)
  {
    unint64_t v36 = 0;
    goto LABEL_51;
  }
  uint64_t v25 = v17 - v23;
  float v26 = v23;
  if (v17 == v16) {
    goto LABEL_45;
  }
  unsigned int index = v4->_routeUserOffset.index;
  *(float *)&long long v13 = v4->_routeUserOffset.offset;
  double v14 = 3.18618444e-58;
  unint64_t v28 = v25;
  do
  {
    unint64_t v29 = v28 >> 1;
    uint64_t v30 = &v16[v28 >> 1];
    if (*(_DWORD *)v30 == index)
    {
      float v31 = *((float *)v30 + 1);
      if (vabds_f32(v31, *(float *)&v13) >= 0.00000011921 && v31 < *(float *)&v13)
      {
LABEL_32:
        float v16 = v30 + 1;
        unint64_t v29 = v28 + ~v29;
      }
    }
    else if (*(_DWORD *)v30 < index)
    {
      goto LABEL_32;
    }
    unint64_t v28 = v29;
  }
  while (v29);
  float v26 = v16;
LABEL_45:
  uint64_t v34 = v26 - v23;
  if (v34 <= 1) {
    uint64_t v34 = 1;
  }
  unint64_t v35 = v34 - 1;
  if (v35 >= v25 - 1) {
    unint64_t v36 = v25 - 1;
  }
  else {
    unint64_t v36 = v35;
  }
LABEL_51:
  v50[0] = 0;
  uint64_t v48 = 0;
  BOOL v37 = -[LabelNavRouteLabeler _findRouteOverlappingJunctionFrom:routeJunctions:lookBackward:firstOverlap:secondOverlap:](v4, "_findRouteOverlappingJunctionFrom:routeJunctions:lookBackward:firstOverlap:secondOverlap:", v36, v15 + 6, 1, v50, &v48, *(double *)&v13, v14);
  if (v37)
  {
    if (v50[0] + 1 < v48) {
      uint64_t v38 = v50[0] + 1;
    }
    else {
      uint64_t v38 = v48;
    }
    double v39 = (float *)(v53[6] + 16 * v38);
    float v40 = *v39;
    float v41 = v39[1];
  }
  else
  {
    float v40 = 0.0;
    float v41 = 0.0;
  }
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  if (![(LabelNavRouteLabeler *)v4 _findRouteOverlappingJunctionFrom:v36 routeJunctions:v53 + 6 lookBackward:0 firstOverlap:&v47 secondOverlap:&v46])
  {
    if (v4->_useRouteSubrange)
    {
      if (v37)
      {
        float v44 = 0.0;
        int v43 = -1;
        goto LABEL_63;
      }
LABEL_43:
      v4->_useRouteSubrange = 0;
      BOOL v33 = 1;
      goto LABEL_73;
    }
    if (v37)
    {
      float v44 = 0.0;
      int v43 = -1;
      goto LABEL_70;
    }
LABEL_72:
    BOOL v33 = 0;
    goto LABEL_73;
  }
  long double v42 = (_DWORD *)(v53[6] + 16 * v47);
  int v43 = *v42;
  float v44 = *((float *)v42 + 1);
  if (v4->_useRouteSubrange)
  {
LABEL_63:
    if (v4->_routeSubrangeEnd.index != v43
      || vabds_f32(v4->_routeSubrangeEnd.offset, v44) >= 0.00000011921
      || v4->_routeSubrangeStart.index != LODWORD(v40)
      || vabds_f32(v4->_routeSubrangeStart.offset, v41) >= 0.00000011921)
    {
      v4->_routeSubrangeEnd.unsigned int index = v43;
      v4->_routeSubrangeEnd.offset = v44;
      *(float *)&v4->_routeSubrangeStart.unsigned int index = v40;
      BOOL v33 = 1;
      goto LABEL_71;
    }
    goto LABEL_72;
  }
LABEL_70:
  BOOL v33 = 1;
  v4->_useRouteSubrange = 1;
  v4->_routeSubrangeEnd.unsigned int index = v43;
  v4->_routeSubrangeEnd.offset = v44;
  *(float *)&v4->_routeSubrangeStart.unsigned int index = v40;
LABEL_71:
  v4->_routeSubrangeStart.offset = v41;
LABEL_73:
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v52, 8);
  if (v58)
  {
    uint64_t v59 = v58;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v61 + 40))(v61, v58, v60 - v58);
  }
  return v33;
}

void __47__LabelNavRouteLabeler__updateActiveRouteRange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v58 = a2;
  char v3 = [v58 edges];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v4)
  {
    uint64_t v59 = *(void *)v66;
    do
    {
      uint64_t v60 = v4;
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(void *)v66 != v59) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [v7 mapEdge];
        uint64_t v8 = (std::__shared_weak_count *)v61[2];
        double v63 = (geo::MapNode *)v61[1];
        long double v64 = v8;
        if (v8) {
          atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        unint64_t v9 = *(uint64_t **)(**(void **)(a1 + 48) + 24);
        uint64_t v10 = *v9;
        unint64_t v11 = (std::__shared_weak_count *)v9[1];
        if (v11) {
          atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v12 = VectorTileMapper::mapNodeJunctionToTile(&v63, v10);
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
          long long v13 = v64;
          if (!v64) {
            goto LABEL_19;
          }
        }
        else
        {
          long long v13 = v64;
          if (!v64) {
            goto LABEL_19;
          }
        }
        if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
LABEL_19:
        double v14 = v3;
        if (v62 && !atomic_fetch_add(&v62->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)())v62->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v62);
        }
        char v15 = [v7 clippedFront];
        if (v12) {
          char v16 = v15;
        }
        else {
          char v16 = 1;
        }
        if ((v16 & 1) == 0)
        {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = v12;
          if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56))
          {
            *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = [v7 routeOffsetA];
            uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
            float v18 = (_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
            float64x2_t v19 = *(_OWORD **)(v17 + 56);
            unint64_t v20 = *(void *)(v17 + 64);
            if ((unint64_t)v19 >= v20)
            {
              uint64_t v22 = *(void *)(v17 + 48);
              uint64_t v23 = ((uint64_t)v19 - v22) >> 4;
              unint64_t v24 = v23 + 1;
              if ((unint64_t)(v23 + 1) >> 60) {
                abort();
              }
              uint64_t v25 = v20 - v22;
              if (v25 >> 3 > v24) {
                unint64_t v24 = v25 >> 3;
              }
              if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
                uint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v26 = v24;
              }
              if (v26)
              {
                uint64_t v27 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(v17 + 72) + 16))(*(void *)(v17 + 72), 16 * v26, 8);
                unint64_t v28 = (_OWORD *)(v27 + 16 * v23);
                uint64_t v29 = v27 + 16 * v26;
                if (v27) {
                  *unint64_t v28 = *v18;
                }
              }
              else
              {
                uint64_t v29 = 0;
                unint64_t v28 = (_OWORD *)(16 * v23);
              }
              char v3 = v14;
              uint64_t v31 = *(void *)(v17 + 48);
              uint64_t v30 = *(void *)(v17 + 56);
              uint64_t v32 = v28;
              if (v30 != v31)
              {
                do
                {
                  *--uint64_t v32 = *(_OWORD *)(v30 - 16);
                  v30 -= 16;
                }
                while (v30 != v31);
                uint64_t v30 = *(void *)(v17 + 48);
              }
              uint64_t v21 = v28 + 1;
              *(void *)(v17 + 48) = v32;
              *(void *)(v17 + 56) = v28 + 1;
              uint64_t v33 = *(void *)(v17 + 64);
              *(void *)(v17 + 64) = v29;
              if (v30) {
                (*(void (**)(void, uint64_t, uint64_t))(**(void **)(v17 + 72) + 40))(*(void *)(v17 + 72), v30, v33 - v30);
              }
            }
            else
            {
              if (v19) {
                _OWORD *v19 = *v18;
              }
              uint64_t v21 = v19 + 1;
            }
            *(void *)(v17 + 56) = v21;
          }
        }
        [v7 mapEdge];
        uint64_t v34 = (std::__shared_weak_count *)v61[4];
        double v63 = (geo::MapNode *)v61[3];
        long double v64 = v34;
        if (v34) {
          atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        unint64_t v35 = *(uint64_t **)(**(void **)(a1 + 48) + 24);
        uint64_t v36 = *v35;
        BOOL v37 = (std::__shared_weak_count *)v35[1];
        if (v37) {
          atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v38 = VectorTileMapper::mapNodeJunctionToTile(&v63, v36);
        if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
          double v39 = v64;
          if (!v64) {
            goto LABEL_57;
          }
        }
        else
        {
          double v39 = v64;
          if (!v64) {
            goto LABEL_57;
          }
        }
        if (!atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
LABEL_57:
        if (v62 && !atomic_fetch_add(&v62->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)())v62->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v62);
        }
        char v40 = [v7 clippedBack];
        if (v38) {
          char v41 = v40;
        }
        else {
          char v41 = 1;
        }
        if ((v41 & 1) == 0)
        {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = v38;
          if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56))
          {
            *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = [v7 routeOffsetB];
            uint64_t v42 = *(void *)(*(void *)(a1 + 40) + 8);
            int v43 = (_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
            float v44 = *(_OWORD **)(v42 + 56);
            unint64_t v45 = *(void *)(v42 + 64);
            if ((unint64_t)v44 >= v45)
            {
              uint64_t v46 = *(void *)(v42 + 48);
              uint64_t v47 = ((uint64_t)v44 - v46) >> 4;
              unint64_t v48 = v47 + 1;
              if ((unint64_t)(v47 + 1) >> 60) {
                abort();
              }
              uint64_t v49 = v45 - v46;
              if (v49 >> 3 > v48) {
                unint64_t v48 = v49 >> 3;
              }
              if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0) {
                uint64_t v50 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v50 = v48;
              }
              if (v50)
              {
                uint64_t v51 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(v42 + 72) + 16))(*(void *)(v42 + 72), 16 * v50, 8);
                uint64_t v52 = (_OWORD *)(v51 + 16 * v47);
                uint64_t v53 = v51 + 16 * v50;
                if (v51) {
                  *uint64_t v52 = *v43;
                }
              }
              else
              {
                uint64_t v53 = 0;
                uint64_t v52 = (_OWORD *)(16 * v47);
              }
              uint64_t v55 = *(void *)(v42 + 48);
              uint64_t v54 = *(void *)(v42 + 56);
              float v56 = v52;
              if (v54 != v55)
              {
                do
                {
                  *--float v56 = *(_OWORD *)(v54 - 16);
                  v54 -= 16;
                }
                while (v54 != v55);
                uint64_t v54 = *(void *)(v42 + 48);
              }
              int v6 = v52 + 1;
              *(void *)(v42 + 48) = v56;
              *(void *)(v42 + 56) = v52 + 1;
              uint64_t v57 = *(void *)(v42 + 64);
              *(void *)(v42 + 64) = v53;
              if (v54) {
                (*(void (**)(void, uint64_t, uint64_t))(**(void **)(v42 + 72) + 40))(*(void *)(v42 + 72), v54, v57 - v54);
              }
            }
            else
            {
              if (v44) {
                _OWORD *v44 = *v43;
              }
              int v6 = v44 + 1;
            }
            *(void *)(v42 + 56) = v6;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v4);
  }
}

- (BOOL)_findRouteOverlappingJunctionFrom:(int64_t)a3 routeJunctions:(void *)a4 lookBackward:(BOOL)a5 firstOverlap:(int64_t *)a6 secondOverlap:(int64_t *)a7
{
  uint64_t v44 = 0;
  int8x8_t v45 = 0;
  {
    BOOL v42 = a5;
    a5 = v42;
    if (v39) {
      operator new();
    }
  }
  uint64_t v46 = mdm::Allocator::instance(void)::alloc;
  uint64_t v47 = 0;
  {
    BOOL v40 = a5;
    a5 = v40;
    if (v41) {
      operator new();
    }
  }
  uint64_t v48 = mdm::Allocator::instance(void)::alloc;
  uint64_t v49 = 0;
  int v50 = 1065353216;
  if (a5)
  {
    if ((a3 & 0x8000000000000000) == 0)
    {
      do
      {
        unint64_t v43 = 0;
        unint64_t v11 = *(void *)(*(void *)a4 + 16 * a3 + 8);
        unint64_t v43 = v11;
        if (v45)
        {
          unint64_t v12 = 0x9DDFEA08EB382D69 * (((8 * v11) + 8) ^ HIDWORD(v11));
          unint64_t v13 = 0x9DDFEA08EB382D69 * (HIDWORD(v11) ^ (v12 >> 47) ^ v12);
          unint64_t v14 = 0x9DDFEA08EB382D69 * (v13 ^ (v13 >> 47));
          uint8x8_t v15 = (uint8x8_t)vcnt_s8(v45);
          v15.i16[0] = vaddlv_u8(v15);
          if (v15.u32[0] > 1uLL)
          {
            unint64_t v16 = v14;
            if (v14 >= *(void *)&v45) {
              unint64_t v16 = v14 % *(void *)&v45;
            }
          }
          else
          {
            unint64_t v16 = v14 & (*(void *)&v45 - 1);
          }
          uint64_t v17 = *(void **)(v44 + 8 * v16);
          if (v17)
          {
            float v18 = (void *)*v17;
            if (v18)
            {
              if (v15.u32[0] < 2uLL)
              {
                while (1)
                {
                  uint64_t v20 = v18[1];
                  if (v20 == v14)
                  {
                    if (v18[2] == v11) {
                      goto LABEL_55;
                    }
                  }
                  else if ((v20 & (*(void *)&v45 - 1)) != v16)
                  {
                    goto LABEL_25;
                  }
                  float v18 = (void *)*v18;
                  if (!v18) {
                    goto LABEL_25;
                  }
                }
              }
              do
              {
                unint64_t v19 = v18[1];
                if (v19 == v14)
                {
                  if (v18[2] == v11)
                  {
LABEL_55:
                    *a6 = a3;
                    *a7 = v18[3];
                    goto LABEL_57;
                  }
                }
                else
                {
                  if (v19 >= *(void *)&v45) {
                    v19 %= *(void *)&v45;
                  }
                  if (v19 != v16) {
                    break;
                  }
                }
                float v18 = (void *)*v18;
              }
              while (v18);
            }
          }
        }
LABEL_25:
        uint64_t v51 = &v43;
        std::__hash_table<std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::__unordered_map_hasher<GeoCodecsConnectivityJunction *,std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::hash<GeoCodecsConnectivityJunction *>,std::equal_to<GeoCodecsConnectivityJunction *>,true>,std::__unordered_map_equal<GeoCodecsConnectivityJunction *,std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::equal_to<GeoCodecsConnectivityJunction *>,std::hash<GeoCodecsConnectivityJunction *>,true>,geo::StdAllocator<std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,mdm::Allocator>>::__emplace_unique_key_args<GeoCodecsConnectivityJunction *,std::piecewise_construct_t const&,std::tuple<GeoCodecsConnectivityJunction * const&>,std::tuple<>>((float *)&v44, v11, &v51)[3] = a3;
      }
      while (a3-- >= 1);
    }
LABEL_50:
    BOOL v34 = 0;
    unint64_t v35 = v47;
    if (!v47) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  unint64_t v22 = a3 + 1;
  uint64_t v23 = *(void *)a4;
  if (v22 >= (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4) {
    goto LABEL_50;
  }
  while (1)
  {
    unint64_t v43 = 0;
    unint64_t v24 = *(void *)(v23 + 16 * v22 + 8);
    unint64_t v43 = v24;
    if (v45)
    {
      unint64_t v25 = 0x9DDFEA08EB382D69 * (((8 * v24) + 8) ^ HIDWORD(v24));
      unint64_t v26 = 0x9DDFEA08EB382D69 * (HIDWORD(v24) ^ (v25 >> 47) ^ v25);
      unint64_t v27 = 0x9DDFEA08EB382D69 * (v26 ^ (v26 >> 47));
      uint8x8_t v28 = (uint8x8_t)vcnt_s8(v45);
      v28.i16[0] = vaddlv_u8(v28);
      if (v28.u32[0] > 1uLL)
      {
        unint64_t v29 = v27;
        if (v27 >= *(void *)&v45) {
          unint64_t v29 = v27 % *(void *)&v45;
        }
      }
      else
      {
        unint64_t v29 = v27 & (*(void *)&v45 - 1);
      }
      uint64_t v30 = *(void **)(v44 + 8 * v29);
      if (v30)
      {
        uint64_t v31 = (void *)*v30;
        if (v31) {
          break;
        }
      }
    }
LABEL_49:
    uint64_t v51 = &v43;
    std::__hash_table<std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::__unordered_map_hasher<GeoCodecsConnectivityJunction *,std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::hash<GeoCodecsConnectivityJunction *>,std::equal_to<GeoCodecsConnectivityJunction *>,true>,std::__unordered_map_equal<GeoCodecsConnectivityJunction *,std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::equal_to<GeoCodecsConnectivityJunction *>,std::hash<GeoCodecsConnectivityJunction *>,true>,geo::StdAllocator<std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,mdm::Allocator>>::__emplace_unique_key_args<GeoCodecsConnectivityJunction *,std::piecewise_construct_t const&,std::tuple<GeoCodecsConnectivityJunction * const&>,std::tuple<>>((float *)&v44, v24, &v51)[3] = v22++;
    uint64_t v23 = *(void *)a4;
    if (v22 >= (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4) {
      goto LABEL_50;
    }
  }
  if (v28.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v33 = v31[1];
      if (v33 == v27)
      {
        if (v31[2] == v24) {
          goto LABEL_56;
        }
      }
      else if ((v33 & (*(void *)&v45 - 1)) != v29)
      {
        goto LABEL_49;
      }
      uint64_t v31 = (void *)*v31;
      if (!v31) {
        goto LABEL_49;
      }
    }
  }
  while (1)
  {
    unint64_t v32 = v31[1];
    if (v32 == v27) {
      break;
    }
    if (v32 >= *(void *)&v45) {
      v32 %= *(void *)&v45;
    }
    if (v32 != v29) {
      goto LABEL_49;
    }
LABEL_39:
    uint64_t v31 = (void *)*v31;
    if (!v31) {
      goto LABEL_49;
    }
  }
  if (v31[2] != v24) {
    goto LABEL_39;
  }
LABEL_56:
  *a6 = v31[3];
  *a7 = v22;
LABEL_57:
  BOOL v34 = 1;
  unint64_t v35 = v47;
  if (v47)
  {
    do
    {
LABEL_51:
      uint64_t v36 = (void *)*v35;
      (*(void (**)(uint64_t))(*(void *)v48 + 40))(v48);
      unint64_t v35 = v36;
    }
    while (v36);
  }
LABEL_52:
  uint64_t v37 = v44;
  uint64_t v44 = 0;
  if (v37) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v46 + 40))(v46, v37, 8 * *(void *)&v45);
  }
  return v34;
}

- (void)_updateCurrentRoadInfo
{
  if (self->_isOnRoute)
  {
    uint64_t currentRoadNameIndex = self->_currentRoadNameIndex;
    if (currentRoadNameIndex < [(NSMutableArray *)self->_routeRoadInfos count] - 1)
    {
      while (1)
      {
        uint64_t v4 = currentRoadNameIndex + 1;
        id v16 = [(NSMutableArray *)self->_routeRoadInfos objectAtIndexedSubscript:currentRoadNameIndex + 1];
        uint64_t v5 = [v16 routeOffset];
        unsigned int index = self->_routeUserOffset.index;
        if (index < v5) {
          break;
        }
        if (index == v5)
        {
          float v7 = *((float *)&v5 + 1);
          float offset = self->_routeUserOffset.offset;

          if (offset < v7) {
            goto LABEL_16;
          }
        }
        else
        {
        }
        ++currentRoadNameIndex;
        if (v4 >= [(NSMutableArray *)self->_routeRoadInfos count] - 1) {
          goto LABEL_16;
        }
      }
    }
LABEL_16:
    if (currentRoadNameIndex != self->_currentRoadNameIndex)
    {
      self->_uint64_t currentRoadNameIndex = currentRoadNameIndex;
      uint64_t v10 = [(NSMutableArray *)self->_routeRoadInfos objectAtIndexedSubscript:currentRoadNameIndex];
      uint64_t v17 = [v10 name];

      currentRoadName = self->_currentRoadName;
      unint64_t v12 = v17;
      if (currentRoadName != v17)
      {
        BOOL v13 = -[NSString isEqualToString:](currentRoadName, "isEqualToString:");
        unint64_t v12 = v17;
        if (!v13)
        {
          [(LabelNavRouteLabeler *)self setCurrentRoadName:v17];
          unint64_t v14 = [(NSMutableArray *)self->_routeRoadInfos objectAtIndexedSubscript:self->_currentRoadNameIndex];
          uint8x8_t v15 = [v14 shieldGroup];
          [(LabelNavRouteLabeler *)self setCurrentShieldGroup:v15];

          unint64_t v12 = v17;
        }
      }
    }
  }
  else
  {
    cntrl = self->_currentRoadSign.__cntrl_;
    self->_currentRoadSign.__ptr_ = 0;
    self->_currentRoadSign.__cntrl_ = 0;
    if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (void)_initalizeCurrentRoadInfo
{
  self->_uint64_t currentRoadNameIndex = -1;
  [(LabelNavRouteLabeler *)self _updateCurrentRoadInfo];
}

- (void)_dedupOffRouteRoads
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  __p = 0;
  double v97 = 0;
  unint64_t v98 = 0;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = self->_junctions;
  uint64_t v2 = [(NSMutableArray *)obj countByEnumeratingWithState:&v92 objects:v107 count:16];
  if (v2)
  {
    uint64_t v81 = *(void *)v93;
    do
    {
      uint64_t v82 = v2;
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v93 != v81) {
          objc_enumerationMutation(obj);
        }
        char v3 = *(char **)(*((void *)&v92 + 1) + 8 * i);
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        std::string::pointer v86 = v3;
        uint64_t v4 = [v3 roads];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v88 objects:v106 count:16];
        if (v5)
        {
          uint64_t v6 = *(void *)v89;
          v85 = v4;
          do
          {
            for (uint64_t j = 0; j != v5; ++j)
            {
              if (*(void *)v89 != v6) {
                objc_enumerationMutation(v4);
              }
              uint64_t v8 = *(void **)(*((void *)&v88 + 1) + 8 * j);
              if (([v8 isOnRoute] & 1) == 0
                && [v8 roadHasName]
                && ([v8 areLabelsDisabled] & 1) == 0)
              {
                [v8 setSuppressRoadSignIfDeduped:0];
                id v9 = [v8 name];
                uint64_t v10 = (const char *)[v9 UTF8String];
                size_t v11 = strlen(v10);
                if (v11 >= 0x7FFFFFFFFFFFFFF8) {
                  abort();
                }
                std::string::size_type v12 = v11;
                if (v11 >= 0x17)
                {
                  uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v11 | 7) != 0x17) {
                    uint64_t v14 = v11 | 7;
                  }
                  uint64_t v15 = v14 + 1;
                  p_dst = (std::string *)operator new(v14 + 1);
                  __dst.__r_.__value_.__l.__size_ = v12;
                  __dst.__r_.__value_.__r.__words[2] = v15 | 0x8000000000000000;
                  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
                }
                else
                {
                  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v11;
                  p_dst = &__dst;
                  if (!v11)
                  {
LABEL_24:
                    p_dst->__r_.__value_.__s.__data_[v12] = 0;

                    id v16 = (std::string *)__p;
                    uint64_t v17 = v97;
                    float v18 = (std::string *)__p;
                    if (__p == v97) {
                      goto LABEL_56;
                    }
                    size_t size = __dst.__r_.__value_.__l.__size_;
                    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                      std::string::size_type v20 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
                    }
                    else {
                      std::string::size_type v20 = __dst.__r_.__value_.__l.__size_;
                    }
                    if ((*((unsigned char *)&__dst.__r_.__value_.__s + 23) & 0x80) == 0)
                    {
                      float v18 = (std::string *)__p;
                      if (!*((unsigned char *)&__dst.__r_.__value_.__s + 23))
                      {
                        float v18 = (std::string *)__p;
                        while (1)
                        {
                          std::string::size_type v21 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
                          if ((v21 & 0x80u) != 0) {
                            std::string::size_type v21 = v18->__r_.__value_.__l.__size_;
                          }
                          if (v20 == v21) {
                            goto LABEL_56;
                          }
                          float v18 = (std::string *)((char *)v18 + 32);
                          if (v18 == v97) {
                            goto LABEL_61;
                          }
                        }
                      }
                      do
                      {
                        std::string::size_type v22 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
                        int v23 = (char)v22;
                        if ((v22 & 0x80u) != 0) {
                          std::string::size_type v22 = v18->__r_.__value_.__l.__size_;
                        }
                        if (v20 == v22)
                        {
                          if (v23 >= 0) {
                            unint64_t v24 = v18;
                          }
                          else {
                            unint64_t v24 = (std::string *)v18->__r_.__value_.__r.__words[0];
                          }
                          unint64_t v25 = &__dst;
                          uint64_t v26 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
                          while (v25->__r_.__value_.__s.__data_[0] == v24->__r_.__value_.__s.__data_[0])
                          {
                            unint64_t v25 = (std::string *)((char *)v25 + 1);
                            unint64_t v24 = (std::string *)((char *)v24 + 1);
                            if (!--v26) {
                              goto LABEL_56;
                            }
                          }
                        }
                        float v18 = (std::string *)((char *)v18 + 32);
                      }
                      while (v18 != v97);
LABEL_61:
                      uint64_t v36 = v16;
                      if (v16 != v17)
                      {
                        size_t v37 = __dst.__r_.__value_.__l.__size_;
                        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                          std::string::size_type v38 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
                        }
                        else {
                          std::string::size_type v38 = __dst.__r_.__value_.__l.__size_;
                        }
                        if ((*((unsigned char *)&__dst.__r_.__value_.__s + 23) & 0x80) == 0)
                        {
                          uint64_t v36 = v16;
                          if (!*((unsigned char *)&__dst.__r_.__value_.__s + 23))
                          {
                            uint64_t v36 = v16;
                            while (1)
                            {
                              std::string::size_type v39 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                              if ((v39 & 0x80u) != 0) {
                                std::string::size_type v39 = v36->__r_.__value_.__l.__size_;
                              }
                              if (v38 == v39) {
                                goto LABEL_94;
                              }
                              uint64_t v36 = (std::string *)((char *)v36 + 32);
                              if (v36 == v17) {
                                goto LABEL_95;
                              }
                            }
                          }
                          do
                          {
                            std::string::size_type v40 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                            int v41 = (char)v40;
                            if ((v40 & 0x80u) != 0) {
                              std::string::size_type v40 = v36->__r_.__value_.__l.__size_;
                            }
                            if (v38 == v40)
                            {
                              if (v41 >= 0) {
                                BOOL v42 = v36;
                              }
                              else {
                                BOOL v42 = (std::string *)v36->__r_.__value_.__r.__words[0];
                              }
                              unint64_t v43 = &__dst;
                              uint64_t v44 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
                              while (v43->__r_.__value_.__s.__data_[0] == v42->__r_.__value_.__s.__data_[0])
                              {
                                unint64_t v43 = (std::string *)((char *)v43 + 1);
                                BOOL v42 = (std::string *)((char *)v42 + 1);
                                if (!--v44) {
                                  goto LABEL_94;
                                }
                              }
                            }
                            uint64_t v36 = (std::string *)((char *)v36 + 32);
                          }
                          while (v36 != v17);
LABEL_95:
                          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                          {
                            std::string::__init_copy_ctor_external(&v99, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                            id v16 = (std::string *)__p;
                            uint64_t v17 = v97;
                          }
                          else
                          {
                            std::string v99 = __dst;
                          }
                          id v100 = 0;
                          uint64_t v36 = v16;
                          if (v16 != v17)
                          {
                            size_t v49 = v99.__r_.__value_.__l.__size_;
                            if ((v99.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                              std::string::size_type v50 = HIBYTE(v99.__r_.__value_.__r.__words[2]);
                            }
                            else {
                              std::string::size_type v50 = v99.__r_.__value_.__l.__size_;
                            }
                            if ((*((unsigned char *)&v99.__r_.__value_.__s + 23) & 0x80) == 0)
                            {
                              uint64_t v36 = v16;
                              if (!*((unsigned char *)&v99.__r_.__value_.__s + 23))
                              {
                                uint64_t v36 = v16;
                                while (1)
                                {
                                  std::string::size_type v51 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                                  if ((v51 & 0x80u) != 0) {
                                    std::string::size_type v51 = v36->__r_.__value_.__l.__size_;
                                  }
                                  if (v50 == v51) {
                                    goto LABEL_130;
                                  }
                                  uint64_t v36 = (std::string *)((char *)v36 + 32);
                                  if (v36 == v17) {
                                    goto LABEL_132;
                                  }
                                }
                              }
                              do
                              {
                                std::string::size_type v52 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                                int v53 = (char)v52;
                                if ((v52 & 0x80u) != 0) {
                                  std::string::size_type v52 = v36->__r_.__value_.__l.__size_;
                                }
                                if (v50 == v52)
                                {
                                  if (v53 >= 0) {
                                    uint64_t v54 = v36;
                                  }
                                  else {
                                    uint64_t v54 = (std::string *)v36->__r_.__value_.__r.__words[0];
                                  }
                                  uint64_t v55 = &v99;
                                  uint64_t v56 = HIBYTE(v99.__r_.__value_.__r.__words[2]);
                                  while (v55->__r_.__value_.__s.__data_[0] == v54->__r_.__value_.__s.__data_[0])
                                  {
                                    uint64_t v55 = (std::string *)((char *)v55 + 1);
                                    uint64_t v54 = (std::string *)((char *)v54 + 1);
                                    if (!--v56) {
                                      goto LABEL_130;
                                    }
                                  }
                                }
                                uint64_t v36 = (std::string *)((char *)v36 + 32);
                              }
                              while (v36 != v17);
LABEL_132:
                              if (v98 <= (unint64_t)v17)
                              {
                                uint64_t v63 = ((char *)v17 - (char *)v16) >> 5;
                                unint64_t v64 = v63 + 1;
                                if ((unint64_t)(v63 + 1) >> 59) {
                                  abort();
                                }
                                uint64_t v65 = v98 - (void)v16;
                                if ((uint64_t)(v98 - (void)v16) >> 4 > v64) {
                                  unint64_t v64 = v65 >> 4;
                                }
                                if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFE0) {
                                  unint64_t v66 = 0x7FFFFFFFFFFFFFFLL;
                                }
                                else {
                                  unint64_t v66 = v64;
                                }
                                long double v105 = &v98;
                                if (v66)
                                {
                                  if (v66 >> 59) {
                                    std::__throw_bad_array_new_length[abi:nn180100]();
                                  }
                                  long long v67 = operator new(32 * v66);
                                }
                                else
                                {
                                  long long v67 = 0;
                                }
                                double v69 = (std::string *)&v67[4 * v63];
                                double v101 = v67;
                                long double v102 = v69;
                                long double v103 = v69;
                                double v104 = (char *)&v67[4 * v66];
                                if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
                                {
                                  std::string::__init_copy_ctor_external((std::string *)&v67[4 * v63], v99.__r_.__value_.__l.__data_, v99.__r_.__value_.__l.__size_);
                                  double v69 = v102;
                                  double v71 = v103;
                                  id v70 = v100;
                                }
                                else
                                {
                                  id v70 = 0;
                                  *double v69 = v99;
                                  double v71 = (std::string *)&v67[4 * v63];
                                }
                                v67[4 * v63 + 3] = v70;
                                long long v68 = (std::string *)((char *)v71 + 32);
                                double v72 = (std::string *)__p;
                                long double v73 = v97;
                                if (v97 == __p)
                                {
                                  __p = v69;
                                  double v97 = (std::string *)((char *)v71 + 32);
                                  unint64_t v98 = (unint64_t)v104;
                                }
                                else
                                {
                                  do
                                  {
                                    long long v74 = *(_OWORD *)&v73[-2].__r_.__value_.__r.__words[2];
                                    v69[-1].__r_.__value_.__l.__size_ = v73[-1].__r_.__value_.__l.__size_;
                                    *(_OWORD *)&v69[-2].__r_.__value_.__r.__words[2] = v74;
                                    v73[-2].__r_.__value_.__r.__words[2] = 0;
                                    v73[-1].__r_.__value_.__r.__words[0] = 0;
                                    std::string::size_type v75 = v73[-1].__r_.__value_.__r.__words[2];
                                    v73[-1].__r_.__value_.__l.__size_ = 0;
                                    v73[-1].__r_.__value_.__r.__words[2] = 0;
                                    v69[-1].__r_.__value_.__r.__words[2] = v75;
                                    double v69 = (std::string *)((char *)v69 - 32);
                                    long double v73 = (std::string *)((char *)v73 - 32);
                                  }
                                  while (v73 != v72);
                                  long double v73 = (std::string *)__p;
                                  v76 = v97;
                                  __p = v69;
                                  double v97 = v68;
                                  unint64_t v98 = (unint64_t)v104;
                                  while (v76 != v73)
                                  {

                                    if (v76[-1].__r_.__value_.__s.__data_[15] < 0) {
                                      operator delete((void *)v76[-2].__r_.__value_.__r.__words[2]);
                                    }
                                    v76 = (std::string *)((char *)v76 - 32);
                                  }
                                }
                                if (v73) {
                                  operator delete(v73);
                                }
                              }
                              else
                              {
                                if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
                                {
                                  std::string::__init_copy_ctor_external(v17, v99.__r_.__value_.__l.__data_, v99.__r_.__value_.__l.__size_);
                                }
                                else
                                {
                                  long long v62 = *(_OWORD *)&v99.__r_.__value_.__l.__data_;
                                  v17->__r_.__value_.__r.__words[2] = v99.__r_.__value_.__r.__words[2];
                                  *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v62;
                                }
                                v17[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v100;
                                long long v68 = (std::string *)((char *)v17 + 32);
                              }
                              double v97 = v68;
                              uint64_t v36 = (std::string *)((char *)v68 - 32);
                              id v61 = v100;
                              goto LABEL_161;
                            }
                            uint64_t v57 = (const void *)v99.__r_.__value_.__r.__words[0];
                            uint64_t v36 = v16;
                            while (1)
                            {
                              std::string::size_type v58 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                              int v59 = (char)v58;
                              if ((v58 & 0x80u) != 0) {
                                std::string::size_type v58 = v36->__r_.__value_.__l.__size_;
                              }
                              if (v50 == v58)
                              {
                                uint64_t v60 = v59 >= 0
                                    ? (unsigned __int8 *)v36
                                    : (unsigned __int8 *)v36->__r_.__value_.__r.__words[0];
                                if (!memcmp(v57, v60, v49)) {
                                  break;
                                }
                              }
                              uint64_t v36 = (std::string *)((char *)v36 + 32);
                              if (v36 == v17) {
                                goto LABEL_132;
                              }
                            }
                          }
LABEL_130:
                          if (v17 == v36) {
                            goto LABEL_132;
                          }
                          id v61 = 0;
LABEL_161:

                          if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0) {
                            operator delete(v99.__r_.__value_.__l.__data_);
                          }
LABEL_163:
                          objc_storeStrong((id *)&v36[1].__r_.__value_.__l.__data_, v86);
LABEL_164:
                          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
                            operator delete(__dst.__r_.__value_.__l.__data_);
                          }
                          uint64_t v4 = v85;
                          continue;
                        }
                        int8x8_t v45 = (const void *)__dst.__r_.__value_.__r.__words[0];
                        uint64_t v36 = v16;
                        while (1)
                        {
                          std::string::size_type v46 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                          int v47 = (char)v46;
                          if ((v46 & 0x80u) != 0) {
                            std::string::size_type v46 = v36->__r_.__value_.__l.__size_;
                          }
                          if (v38 == v46)
                          {
                            uint64_t v48 = v47 >= 0
                                ? (unsigned __int8 *)v36
                                : (unsigned __int8 *)v36->__r_.__value_.__r.__words[0];
                            if (!memcmp(v45, v48, v37)) {
                              break;
                            }
                          }
                          uint64_t v36 = (std::string *)((char *)v36 + 32);
                          if (v36 == v17) {
                            goto LABEL_95;
                          }
                        }
                      }
LABEL_94:
                      if (v17 == v36) {
                        goto LABEL_95;
                      }
                      goto LABEL_163;
                    }
                    unint64_t v27 = (const void *)__dst.__r_.__value_.__r.__words[0];
                    float v18 = (std::string *)__p;
                    while (1)
                    {
                      std::string::size_type v28 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
                      int v29 = (char)v28;
                      if ((v28 & 0x80u) != 0) {
                        std::string::size_type v28 = v18->__r_.__value_.__l.__size_;
                      }
                      if (v20 == v28)
                      {
                        uint64_t v30 = v29 >= 0 ? v18 : (std::string *)v18->__r_.__value_.__r.__words[0];
                        if (!memcmp(v27, v30, size)) {
                          break;
                        }
                      }
                      float v18 = (std::string *)((char *)v18 + 32);
                      if (v18 == v17) {
                        goto LABEL_61;
                      }
                    }
LABEL_56:
                    if (v18 == v17) {
                      goto LABEL_61;
                    }
                    std::string::pointer data = v18[1].__r_.__value_.__l.__data_;
                    p_std::string::pointer data = (id *)&v18[1].__r_.__value_.__l.__data_;
                    if (data == v86)
                    {
                      [v8 setSuppressRoadSignIfDeduped:0];
                    }
                    else
                    {
                      uint64_t v33 = [(VKPolylineOverlay *)self->_route composedRoute];
                      objc_msgSend(v33, "distanceFromPoint:toPoint:", objc_msgSend(*p_data, "routeOffset"), objc_msgSend(v86, "routeOffset"));
                      double v35 = v34;

                      if (v35 >= 300.0) {
                        objc_storeStrong(p_data, v86);
                      }
                      [v8 setSuppressRoadSignIfDeduped:v35 < 300.0];
                    }
                    goto LABEL_164;
                  }
                }
                memmove(p_dst, v10, v12);
                goto LABEL_24;
              }
            }
            uint64_t v5 = [v4 countByEnumeratingWithState:&v88 objects:v106 count:16];
          }
          while (v5);
        }
      }
      uint64_t v2 = [(NSMutableArray *)obj countByEnumeratingWithState:&v92 objects:v107 count:16];
    }
    while (v2);
  }

  double v77 = (std::string *)__p;
  if (__p)
  {
    float v78 = v97;
    float v79 = __p;
    if (v97 != __p)
    {
      do
      {

        if (v78[-1].__r_.__value_.__s.__data_[15] < 0) {
          operator delete((void *)v78[-2].__r_.__value_.__r.__words[2]);
        }
        float v78 = (std::string *)((char *)v78 - 32);
      }
      while (v78 != v77);
      float v79 = __p;
    }
    double v97 = v77;
    operator delete(v79);
  }
}

- (void)_updatePreferredLabelPlacements
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v3 = self->_junctions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v9 = v6;
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "requiredLabelPlacement", (void)v15);
        uint64_t v6 = v11;
        if ((v11 - 1) >= 2)
        {
          if (v11 == 3)
          {
            if (v9 == 1 && !self->_preferRightSideLabelPlacement) {
              uint64_t v6 = 2;
            }
            else {
              uint64_t v6 = 1;
            }
            goto LABEL_10;
          }
          uint64_t v6 = v9;
          if (v11 == 5)
          {
            if (self->_preferRightSideLabelPlacement)
            {
              uint64_t v6 = 1;
            }
            else
            {
              std::string::size_type v12 = [(VKPolylineOverlay *)self->_route composedRoute];
              BOOL v13 = [v12 steps];
              uint64_t v14 = [v13 objectAtIndexedSubscript:self->_stepIndex];

              if ([v14 drivingSide]) {
                uint64_t v6 = 2;
              }
              else {
                uint64_t v6 = 1;
              }
            }
LABEL_10:
            [v10 setPreferredLabelPlacement:v6];
            continue;
          }
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (void)_updateRoadsInGuidance
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_junctions;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    unint64_t v4 = 0;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        float v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v8 = [v7 outgoingRoad];
        roadNamesInGuidance = self->_roadNamesInGuidance;
        uint64_t v10 = [v8 name];
        objc_msgSend(v8, "setIsInGuidance:", -[NSMutableSet containsObject:](roadNamesInGuidance, "containsObject:", v10));

        [v8 setIsGuidanceStepStart:0];
        if ([v8 isInGuidance])
        {
          unsigned int v11 = [v7 routeOffset];
          double v12 = COERCE_FLOAT((unint64_t)[v7 routeOffset] >> 32) + (double)v11;
          while (v4 < [(NSMutableArray *)self->_guidanceStepInfos count])
          {
            BOOL v13 = [(NSMutableArray *)self->_guidanceStepInfos objectAtIndexedSubscript:v4];
            BOOL v14 = v12 + -0.1 > (double)(int)[v13 routePoint];

            if (!v14) {
              break;
            }
            ++v4;
          }
          if (v4 < [(NSMutableArray *)self->_guidanceStepInfos count])
          {
            long long v15 = [(NSMutableArray *)self->_guidanceStepInfos objectAtIndexedSubscript:v4];
            long long v16 = [v15 roadName];
            long long v17 = [v8 name];
            if ([v16 isEqualToString:v17])
            {
              BOOL v18 = vabdd_f64(v12, (double)(int)[v15 routePoint]) < 0.1;

              if (v18)
              {
                [v8 setIsGuidanceStepStart:1];
                ++v4;
              }
            }
            else
            {
            }
          }
        }
      }
      uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }
}

- (void)_updateRoadStarts
{
  [(NSMutableArray *)self->_routeRoadInfos removeAllObjects];
  id v24 = [(LabelNavRouteLabeler *)self currentRoadName];
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  float v5 = 0.0;
  while (v3 < [(NSMutableArray *)self->_junctions count])
  {
    uint64_t v6 = [(NSMutableArray *)self->_junctions objectAtIndexedSubscript:v3];
    float v7 = [v6 outgoingRoad];
    uint64_t v8 = v7;
    if (!v7) {
      goto LABEL_18;
    }
    id v9 = [v7 name];
    if (v24 == v9)
    {

LABEL_18:
      [v8 setIsStartOfRoadName:0];
      [v8 length];
      double v15 = v23 + v5;
      goto LABEL_2;
    }
    uint64_t v10 = [v8 name];
    char v11 = [v24 isEqualToString:v10];

    if (v11) {
      goto LABEL_18;
    }
    if (v3 && v5 < 30.0)
    {
      char v12 = [(NSMutableSet *)self->_roadNamesInGuidance containsObject:v24];
      char v13 = v4 >= v3 ? 1 : v12;
      if ((v13 & 1) == 0)
      {
        do
        {
          long long v21 = [(NSMutableArray *)self->_junctions objectAtIndexedSubscript:v4];
          long long v22 = [v21 outgoingRoad];

          if (([v22 areLabelsDisabled] & 1) == 0) {
            [v22 setAreLabelsDisabled:1];
          }

          ++v4;
        }
        while (v3 != v4);
      }
    }
    [v8 length];
    double v15 = v14;
    [v8 setIsStartOfRoadName:1];
    uint64_t v16 = [v8 name];

    long long v17 = [VKRouteRoadInfo alloc];
    BOOL v18 = [v8 name];
    unint64_t v19 = [v8 shieldGroup];
    long long v20 = -[VKRouteRoadInfo initWithName:shieldGroup:offset:](v17, "initWithName:shieldGroup:offset:", v18, v19, [v6 routeOffset]);

    [(NSMutableArray *)self->_routeRoadInfos addObject:v20];
    unint64_t v4 = v3;
    id v24 = (id)v16;
LABEL_2:
    float v5 = v15;

    ++v3;
  }
}

- (void)_updateUniqueOffRouteRoads
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = self->_junctions;
  uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (([v21 isOnDualCarriageway] & 1) == 0)
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v23 = [v21 roads];
          uint64_t v2 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (!v2) {
            goto LABEL_4;
          }
          uint64_t v3 = *(void *)v31;
          uint64_t v20 = *(void *)v31;
          while (1)
          {
            uint64_t v4 = 0;
            uint64_t v22 = v2;
            do
            {
              if (*(void *)v31 != v3) {
                objc_enumerationMutation(v23);
              }
              uint64_t v6 = *(void **)(*((void *)&v30 + 1) + 8 * v4);
              if (([v6 isOnRoute] & 1) == 0)
              {
                long long v28 = 0u;
                long long v29 = 0u;
                long long v26 = 0u;
                long long v27 = 0u;
                id v25 = [v21 roads];
                uint64_t v7 = [v25 countByEnumeratingWithState:&v26 objects:v38 count:16];
                uint64_t v24 = v4;
                if (v7)
                {
                  int v8 = 0;
                  uint64_t v9 = *(void *)v27;
                  uint64_t v10 = 1;
                  do
                  {
                    for (uint64_t j = 0; j != v7; ++j)
                    {
                      if (*(void *)v27 != v9) {
                        objc_enumerationMutation(v25);
                      }
                      char v12 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                      if (v12 != v6)
                      {
                        char v13 = [v6 name];
                        double v14 = [v12 name];
                        int v15 = [v13 isEqualToString:v14];

                        if (v15)
                        {
                          v8 |= [v12 isOnRoute];
                          ++v10;
                        }
                      }
                    }
                    uint64_t v7 = [v25 countByEnumeratingWithState:&v26 objects:v38 count:16];
                  }
                  while (v7);

                  if (v10 == 2)
                  {
                    char v5 = 0;
                    goto LABEL_14;
                  }
                  if (v10 != 1)
                  {
                    char v5 = v8 ^ 1;
                    goto LABEL_14;
                  }
                }
                else
                {
                }
                char v5 = 1;
LABEL_14:
                uint64_t v3 = v20;
                uint64_t v2 = v22;
                uint64_t v4 = v24;
                [v6 setIsRoadLabelUnique:v5 & 1];
              }
              ++v4;
            }
            while (v4 != v2);
            uint64_t v2 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
            if (!v2)
            {
LABEL_4:

              break;
            }
          }
        }
      }
      uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v17);
  }
}

- (BOOL)_addJunctionsForTile:(const void *)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  std::string::pointer v86 = self;
  uint64_t v3 = *(uint64_t **)(*(void *)a3 + 24);
  uint64_t v5 = *v3;
  uint64_t v4 = (std::__shared_weak_count *)v3[1];
  uint64_t v84 = v5;
  v85 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v82 = *MEMORY[0x1E4F64198];
  uint64_t v6 = [(VKPolylineOverlay *)v86->_route routeRibbon];
  uint64_t v7 = [v6 matchedSegments];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v77 objects:v93 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v78 != v10) {
          objc_enumerationMutation(v8);
        }
        id v81 = *(id *)(*((void *)&v77 + 1) + 8 * i);
        char v12 = [v81 road];
        char v13 = [v12 feature];
        double v14 = (uint64_t *)[v13 getRoad];

        if (v14)
        {
          uint64_t v76 = 0;
          int v15 = [v81 road];
          uint64_t v16 = [v15 startJunction];
          uint64_t v17 = [v16 connectivityJunction];

          uint64_t v75 = 0;
          uint64_t v76 = v17;
          uint64_t v18 = [v81 road];
          unint64_t v19 = [v18 endJunction];
          uint64_t v20 = [v19 connectivityJunction];

          uint64_t v75 = v20;
          long long v21 = [v81 road];
          uint64_t v22 = [v21 feature];
          id v23 = [v22 feature];
          uint64_t v24 = [v23 containingTile];
          id v25 = v24;
          if (v24)
          {
            [v24 vectorTilePtr];
          }
          else
          {
            uint64_t v73 = 0;
            long long v74 = 0;
          }

          if (!geo::codec::TileKeyEquals((void *)(v84 + 4), (void *)(v73 + 4)) || *(_DWORD *)v84 != *(_DWORD *)v73) {
            goto LABEL_25;
          }
          uint64_t v71 = 0;
          double v72 = 0;
          long long v26 = (std::__shared_weak_count *)v14[1];
          if (v26)
          {
            double v72 = std::__shared_weak_count::lock(v26);
            if (v72) {
              uint64_t v71 = *v14;
            }
          }
          long long v92 = 0;
          long long v27 = operator new(0x48uLL);
          void *v27 = &unk_1EF56C6C0;
          v27[1] = &v76;
          v27[2] = &v75;
          v27[3] = &v81;
          v27[4] = &v84;
          v27[5] = &v82;
          v27[6] = &v86;
          v27[7] = a3;
          v27[8] = &v83;
          long long v92 = v27;
          geo::codec::forEachEdgeInRoad(&v71, (uint64_t)v14, 1, (uint64_t)v91);
          if (v92 != v91)
          {
            if (v92) {
              (*(void (**)(void *))(*v92 + 40))(v92);
            }
            long long v28 = v72;
            if (!v72) {
              goto LABEL_25;
            }
LABEL_24:
            if (atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
LABEL_25:
              long long v29 = v74;
              if (!v74) {
                continue;
              }
            }
            else
            {
              ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
              std::__shared_weak_count::__release_weak(v28);
              long long v29 = v74;
              if (!v74) {
                continue;
              }
            }
            if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
              std::__shared_weak_count::__release_weak(v29);
            }
            continue;
          }
          (*(void (**)(void *))(v91[0] + 32))(v91);
          long long v28 = v72;
          if (v72) {
            goto LABEL_24;
          }
          goto LABEL_25;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v77 objects:v93 count:16];
    }
    while (v9);
  }

  if ([v83 count])
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v30 = v83;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v90 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v68 != v32) {
            objc_enumerationMutation(v30);
          }
          long long v34 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          [v34 evaluateCrossStreets];
          [v34 setDepthFromRoute:0];
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v90 count:16];
      }
      while (v31);
    }

    [(NSMutableArray *)v86->_junctions removeObjectsInArray:v83];
    [(NSMutableArray *)v86->_junctions addObjectsFromArray:v83];
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v36 = v83;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v89 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v64 != v38) {
            objc_enumerationMutation(v36);
          }
          std::string::size_type v40 = *(void **)(*((void *)&v63 + 1) + 8 * k);
          if ([v40 isOverpass])
          {
            uint64_t v41 = [(VKLabelNavRoadGraph *)v86->_roadGraph overpassJunctionForJunction:v40];
            BOOL v42 = v41;
            if (v41 && ([v41 isOnRoute] & 1) == 0 && (objc_msgSend(v42, "isIntraRamp") & 1) == 0)
            {
              [v42 setDepthFromRoute:0];
              objc_msgSend(v42, "setRouteOffset:", objc_msgSend(v40, "routeOffset"));
              [v42 setIsRouteOverpass:1];
              [v42 evaluateCrossStreetsUsingRouteJunction:v40];
              [v35 addObject:v42];
            }
          }
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v89 count:16];
      }
      while (v37);
    }

    [v83 removeObjectsInArray:v35];
    [v83 addObjectsFromArray:v35];
    [v35 removeObjectsInArray:v86->_junctions];
    [(NSMutableArray *)v86->_junctions addObjectsFromArray:v35];
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v44 = v83;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v59 objects:v88 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v60;
      do
      {
        for (uint64_t m = 0; m != v45; ++m)
        {
          if (*(void *)v60 != v46) {
            objc_enumerationMutation(v44);
          }
          [(VKLabelNavRoadGraph *)v86->_roadGraph evaluateDualCarriagewayForJunction:*(void *)(*((void *)&v59 + 1) + 8 * m) outputJunctionList:v43];
        }
        uint64_t v45 = [v44 countByEnumeratingWithState:&v59 objects:v88 count:16];
      }
      while (v45);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v48 = v43;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v55 objects:v87 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v56;
      do
      {
        for (uint64_t n = 0; n != v49; ++n)
        {
          if (*(void *)v56 != v50) {
            objc_enumerationMutation(v48);
          }
          [*(id *)(*((void *)&v55 + 1) + 8 * n) setDepthFromRoute:0];
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v55 objects:v87 count:16];
      }
      while (v49);
    }

    [v48 removeObjectsInArray:v86->_junctions];
    [(NSMutableArray *)v86->_junctions addObjectsFromArray:v48];
    [(NSMutableArray *)v86->_junctions sortUsingComparator:&__block_literal_global_28413];
    [(LabelNavRouteLabeler *)v86 _updateRoadStarts];
    [(LabelNavRouteLabeler *)v86 _updateRoadsInGuidance];
    [(LabelNavRouteLabeler *)v86 _updatePreferredLabelPlacements];
    [(LabelNavRouteLabeler *)v86 _initalizeCurrentRoadInfo];
    [(LabelNavRouteLabeler *)v86 _updateUniqueOffRouteRoads];
    [(LabelNavRouteLabeler *)v86 _dedupOffRouteRoads];
  }
  std::string::size_type v52 = v85;
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
    std::__shared_weak_count::__release_weak(v52);
  }
  return 1;
}

uint64_t __45__LabelNavRouteLabeler__addJunctionsForTile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (double *)v4;
  uint64_t v7 = (double *)v5;
  float v8 = v6[25];
  float v9 = v7[25];
  if (v8 < v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = v8 > v9;
  }
  if (!v10)
  {
    char v11 = [v6 incomingRoad];
    if (v11
      && ([v7 incomingRoad],
          char v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      uint64_t v10 = -1;
    }
    else
    {
      char v13 = [v6 incomingRoad];
      if (v13)
      {

        uint64_t v10 = 0;
      }
      else
      {
        double v14 = [v7 incomingRoad];
        uint64_t v10 = v14 != 0;
      }
    }
  }

  return v10;
}

- (void)_addJunctionsForTile:
{
}

- (__n128)_addJunctionsForTile:
{
  uint64_t v2 = (char *)operator new(0x48uLL);
  *(void *)uint64_t v2 = &unk_1EF56C6C0;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 40);
  __n128 result = *(__n128 *)(a1 + 56);
  *(__n128 *)(v2 + 56) = result;
  return result;
}

- (void)_addLabelsForJunctions:(id)a3 withContext:(NavContext *)a4 maxLabelsToAdd:(unint64_t)a5 useAllJunctions:(BOOL)a6 placeShieldsFrontToBack:(BOOL)a7
{
  BOOL v101 = a7;
  BOOL v7 = a6;
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v103 = a3;
  if (a5)
  {
    unint64_t countVisibleRoadSigns = self->_countVisibleRoadSigns;
    unint64_t maxVisibleRoadSigns = self->_maxVisibleRoadSigns;
    BOOL v13 = maxVisibleRoadSigns >= countVisibleRoadSigns;
    int64_t v14 = maxVisibleRoadSigns - countVisibleRoadSigns;
    if (v14 != 0 && v13)
    {
      if (v14 >= (uint64_t)a5) {
        int64_t v14 = a5;
      }
      int64_t v102 = v14;
      int v15 = +[VKDebugSettings sharedSettings];
      int v16 = [v15 labelCollisionDisabled];

      id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v7)
      {
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v17 = v103;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v117 objects:v124 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v118;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v118 != v19) {
                objc_enumerationMutation(v17);
              }
              long long v21 = [*(id *)(*((void *)&v117 + 1) + 8 * i) roads];
              [v104 addObjectsFromArray:v21];
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v117 objects:v124 count:16];
          }
          while (v18);
        }
      }
      else if ([v103 count])
      {
        for (unint64_t j = 0; j < [v103 count]; ++j)
        {
          id v23 = [v103 objectAtIndexedSubscript:j];
          if ((*(unsigned int (**)(MapNavLabeler *))(*(void *)a4->var2 + 408))(a4->var2))
          {
            uint64_t v24 = (double *)[v23 mercatorCoordinate];
            var3 = a4->var3;
            double v26 = *((float *)var3 + 12);
            double v28 = *v24;
            double v27 = v24[1];
            double v29 = v24[2];
            if (*((unsigned char *)var3 + 8))
            {
              double v30 = v26 * (0.0000000249532021 * v29);
            }
            else
            {
              double v33 = v29 * v26;
              long double v34 = v28 * 6.28318531;
              long double v35 = exp(v27 * 6.28318531 + -3.14159265);
              double v36 = atan(v35) * 2.0 + -1.57079633;
              long double v37 = fmod(v34, 6.28318531);
              double v38 = fmod(v37 + 6.28318531, 6.28318531) + -3.14159265;
              __double2 v39 = __sincos_stret(v36);
              double v40 = 6378137.0 / sqrt(v39.__sinval * v39.__sinval * -0.00669437999 + 1.0);
              double v41 = (v40 + v33) * v39.__cosval;
              __double2 v42 = __sincos_stret(v38);
              double v28 = v41 * v42.__cosval;
              double v27 = v41 * v42.__sinval;
              double v30 = (v33 + v40 * 0.99330562) * v39.__sinval;
            }
            float32x2_t v43 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)var3 + 60), *((float64x2_t *)var3 + 54), v28), *((float64x2_t *)var3 + 56), v27), *((float64x2_t *)var3 + 58), v30), 1.0/ (*((double *)var3 + 123)+ *((double *)var3 + 111) * v28+ *((double *)var3 + 115) * v27+ *((double *)var3 + 119) * v30)));
            var4 = a4->var4;
            if (v43.f32[0] >= *((float *)var4 + 12)
              && v43.f32[0] < *((float *)var4 + 14)
              && v43.f32[1] >= *((float *)var4 + 13)
              && v43.f32[1] < *((float *)var4 + 15))
            {
LABEL_31:

              break;
            }
          }
          else
          {
            uint64_t v31 = [v23 routeOffset];
            unsigned int index = self->_routeUserOffset.index;
            if (index <= v31
              && (index != v31 || self->_routeUserOffset.offset < *((float *)&v31 + 1)))
            {
              goto LABEL_31;
            }
          }
        }
        uint64_t v45 = [v103 count];
        if ((uint64_t)j >= v45) {
          uint64_t v46 = v45;
        }
        else {
          uint64_t v46 = j;
        }
        if (v46 <= 1) {
          unint64_t v47 = 1;
        }
        else {
          unint64_t v47 = v46;
        }
        id v48 = [v103 objectAtIndexedSubscript:v47 - 1];
        uint64_t v49 = [v48 routeOffset];

        if (v47 > 1)
        {
          uint64_t v50 = 0;
          float v51 = *((float *)&v49 + 1);
          do
          {
            std::string::size_type v52 = [v103 objectAtIndexedSubscript:v47 - 2];
            uint64_t v53 = [v52 routeOffset];
            --v47;
            *(float *)&double v54 = vabds_f32(*((float *)&v53 + 1), v51);
            if (v49 != v53 || *(float *)&v54 >= 0.00000011921)
            {
              if (v50)
              {

                goto LABEL_49;
              }
              uint64_t v56 = objc_msgSend(v52, "routeOffset", v54);
              float v51 = *((float *)&v56 + 1);
              LODWORD(v49) = v56;
              uint64_t v50 = 1;
            }
          }
          while (v47 > 1);
        }
        unint64_t v47 = 0;
LABEL_49:
        for (unint64_t k = 0; v47 + k < [v103 count]; ++k)
        {
          long long v58 = objc_msgSend(v103, "objectAtIndexedSubscript:");
          long long v59 = (double *)[v58 mercatorCoordinate];
          long long v60 = a4->var3;
          double v61 = *((float *)v60 + 12);
          double v63 = *v59;
          double v62 = v59[1];
          double v64 = v59[2];
          if (*((unsigned char *)v60 + 8))
          {
            double v65 = v61 * (0.0000000249532021 * v64);
          }
          else
          {
            double v66 = v64 * v61;
            long double v67 = v63 * 6.28318531;
            long double v68 = exp(v62 * 6.28318531 + -3.14159265);
            double v69 = atan(v68) * 2.0 + -1.57079633;
            long double v70 = fmod(v67, 6.28318531);
            double v71 = fmod(v70 + 6.28318531, 6.28318531) + -3.14159265;
            __double2 v72 = __sincos_stret(v69);
            double v73 = 6378137.0 / sqrt(v72.__sinval * v72.__sinval * -0.00669437999 + 1.0);
            double v74 = (v73 + v66) * v72.__cosval;
            __double2 v75 = __sincos_stret(v71);
            double v63 = v74 * v75.__cosval;
            double v62 = v74 * v75.__sinval;
            double v65 = (v66 + v73 * 0.99330562) * v72.__sinval;
          }
          double v76 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v60 + 60), *((float64x2_t *)v60 + 54), v63), *((float64x2_t *)v60 + 56), v62), *((float64x2_t *)v60 + 58), v65), 1.0/ (*((double *)v60 + 123)+ *((double *)v60 + 111) * v63+ *((double *)v60 + 115) * v62+ *((double *)v60 + 119) * v65))));
          long long v77 = a4->var4;
          if (*(float *)&v76 < *((float *)v77 + 12)
            || *(float *)&v76 >= *((float *)v77 + 14)
            || (LODWORD(v76) = HIDWORD(v76), *((float *)&v76 + 1) < *((float *)v77 + 13))
            || *((float *)&v76 + 1) >= *((float *)v77 + 15))
          {
            if (k >= 0x14)
            {

              break;
            }
          }
          else
          {
            long long v78 = objc_msgSend(v58, "roads", v76);
            [v104 addObjectsFromArray:v78];
          }
        }
      }
      unint64_t v79 = self->_countVisibleRoadSigns;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      id v80 = v104;
      uint64_t v81 = [v80 countByEnumeratingWithState:&v113 objects:v123 count:16];
      uint64_t v82 = v16 ^ 1u;
      if (v81)
      {
        uint64_t v83 = *(void *)v114;
LABEL_64:
        uint64_t v84 = 0;
        while (1)
        {
          if (*(void *)v114 != v83) {
            objc_enumerationMutation(v80);
          }
          if (self->_countVisibleRoadSigns >= self->_maxVisibleRoadSigns || v102 == 0) {
            break;
          }
          std::string::pointer v86 = *(void **)(*((void *)&v113 + 1) + 8 * v84);
          if ((([v86 isOnRoute] & 1) != 0
             || self->_countVisibleOffRouteRoadSigns < self->_maxVisibleOffRouteRoadSigns)
            && (![v86 isOnRoute]
             || self->_countVisibleOnRouteRoadSigns < self->_maxVisibleOnRouteRoadSigns)
            && ([v86 areLabelsDisabled] & 1) == 0)
          {
            [v86 prepareStyleVarsWithContext:a4];
            if ([v86 hasVisibleSigns]) {
              [(LabelNavRouteLabeler *)self _tryAddRoadSignForRoad:v86 isShield:0 navContext:a4 labelCollisionEnabled:v82];
            }
            if (v101 && [v86 hasVisibleShields]) {
              [(LabelNavRouteLabeler *)self _tryAddRoadSignForRoad:v86 isShield:1 navContext:a4 labelCollisionEnabled:v82];
            }
            v102 -= self->_countVisibleRoadSigns - v79 == 1;
            unint64_t v79 = self->_countVisibleRoadSigns;
          }
          if (v81 == ++v84)
          {
            uint64_t v81 = [v80 countByEnumeratingWithState:&v113 objects:v123 count:16];
            if (v81) {
              goto LABEL_64;
            }
            break;
          }
        }
      }

      if (!v101)
      {
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        unsigned int v87 = [v80 reverseObjectEnumerator];
        uint64_t v88 = [v87 countByEnumeratingWithState:&v109 objects:v122 count:16];
        if (v88)
        {
          uint64_t v89 = *(void *)v110;
          do
          {
            for (uint64_t m = 0; m != v88; ++m)
            {
              if (*(void *)v110 != v89) {
                objc_enumerationMutation(v87);
              }
              long long v91 = *(void **)(*((void *)&v109 + 1) + 8 * m);
              if (([v91 areLabelsDisabled] & 1) == 0)
              {
                [v91 prepareStyleVarsWithContext:a4];
                if ([v91 hasVisibleShields]) {
                  [(LabelNavRouteLabeler *)self _tryAddRoadSignForRoad:v91 isShield:1 navContext:a4 labelCollisionEnabled:v82];
                }
              }
            }
            uint64_t v88 = [v87 countByEnumeratingWithState:&v109 objects:v122 count:16];
          }
          while (v88);
        }
      }
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v92 = v80;
      uint64_t v93 = [v92 countByEnumeratingWithState:&v105 objects:v121 count:16];
      if (v93)
      {
        uint64_t v94 = *(void *)v106;
        do
        {
          for (uint64_t n = 0; n != v93; ++n)
          {
            if (*(void *)v106 != v94) {
              objc_enumerationMutation(v92);
            }
            v96 = *(void **)(*((void *)&v105 + 1) + 8 * n);
            if (([v96 areLabelsDisabled] & 1) == 0 && (objc_msgSend(v96, "isOnRoute") & 1) == 0)
            {
              visibleLabelsByName = self->_visibleLabelsByName;
              unint64_t v98 = [v96 name];
              std::string v99 = [(NSMutableDictionary *)visibleLabelsByName objectForKey:v98];
              LOBYTE(visibleLabelsByName) = v99 == 0;

              if ((visibleLabelsByName & 1) == 0)
              {
                id v100 = [v96 labelWithType:0];
                if (!v100
                  || ([(NSMutableArray *)self->_visibleLabels containsObject:v100] & 1) == 0)
                {
                  [v96 prepareStyleVarsWithContext:a4];
                  if ([v96 hasVisibleSigns]) {
                    [(LabelNavRouteLabeler *)self _tryAddRoadSignForRoad:v96 isShield:0 navContext:a4 labelCollisionEnabled:v82];
                  }
                }
              }
            }
          }
          uint64_t v93 = [v92 countByEnumeratingWithState:&v105 objects:v121 count:16];
        }
        while (v93);
      }
    }
  }
}

- (void)_addLabelsAtJunctions:(id)a3 withContext:(NavContext *)a4 maxLabelsToAdd:(unint64_t)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5) {
    goto LABEL_62;
  }
  unint64_t countVisibleRoadSigns = self->_countVisibleRoadSigns;
  unint64_t maxVisibleRoadSigns = self->_maxVisibleRoadSigns;
  BOOL v11 = maxVisibleRoadSigns >= countVisibleRoadSigns;
  int64_t v12 = maxVisibleRoadSigns - countVisibleRoadSigns;
  if (v12 == 0 || !v11) {
    goto LABEL_62;
  }
  if (v12 >= (uint64_t)a5) {
    int64_t v13 = a5;
  }
  else {
    int64_t v13 = v12;
  }
  int64_t v14 = +[VKDebugSettings sharedSettings];
  int v15 = [v14 labelCollisionDisabled];

  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = 0;
  BOOL v17 = 0;
  uint64_t v18 = 0;
  unsigned int v71 = v15 ^ 1;
  while (v18 < (unint64_t)[v8 count])
  {
    uint64_t v19 = [v8 objectAtIndexedSubscript:v18];
    if (([v19 isOnRoute] & 1) == 0) {
      goto LABEL_9;
    }
    if (v17)
    {
      uint64_t v20 = (double *)[v19 mercatorCoordinate];
      var3 = a4->var3;
      double v22 = *((float *)var3 + 12);
      double v24 = *v20;
      double v23 = v20[1];
      double v25 = v20[2];
      if (*((unsigned char *)var3 + 8))
      {
        double v26 = v22 * (0.0000000249532021 * v25);
      }
      else
      {
        double v38 = v25 * v22;
        long double v39 = v24 * 6.28318531;
        long double v40 = exp(v23 * 6.28318531 + -3.14159265);
        double v41 = atan(v40) * 2.0 + -1.57079633;
        long double v42 = fmod(v39, 6.28318531);
        double v43 = fmod(v42 + 6.28318531, 6.28318531) + -3.14159265;
        __double2 v44 = __sincos_stret(v41);
        double v45 = 6378137.0 / sqrt(v44.__sinval * v44.__sinval * -0.00669437999 + 1.0);
        double v46 = (v45 + v38) * v44.__cosval;
        __double2 v47 = __sincos_stret(v43);
        double v24 = v46 * v47.__cosval;
        double v23 = v46 * v47.__sinval;
        double v26 = (v38 + v45 * 0.99330562) * v44.__sinval;
      }
      double v48 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)var3 + 60), *((float64x2_t *)var3 + 54), v24), *((float64x2_t *)var3 + 56), v23), *((float64x2_t *)var3 + 58), v26), 1.0/ (*((double *)var3 + 123)+ *((double *)var3 + 111) * v24+ *((double *)var3 + 115) * v23+ *((double *)var3 + 119) * v26))));
      var4 = a4->var4;
      if (*(float *)&v48 >= *((float *)var4 + 12) && *(float *)&v48 < *((float *)var4 + 14))
      {
        LODWORD(v48) = HIDWORD(v48);
        if (*((float *)&v48 + 1) >= *((float *)var4 + 13) && *((float *)&v48 + 1) < *((float *)var4 + 15)) {
          objc_msgSend(v70, "addObject:", v19, v48);
        }
      }
      if ((unint64_t)++v16 >= 0x14)
      {

        break;
      }
      goto LABEL_32;
    }
    if ((*(unsigned int (**)(MapNavLabeler *))(*(void *)a4->var2 + 408))(a4->var2))
    {
      double v27 = (double *)[v19 mercatorCoordinate];
      double v28 = a4->var3;
      double v29 = *((float *)v28 + 12);
      double v31 = *v27;
      double v30 = v27[1];
      double v32 = v27[2];
      if (*((unsigned char *)v28 + 8))
      {
        double v33 = v29 * (0.0000000249532021 * v32);
      }
      else
      {
        double v50 = v32 * v29;
        long double v51 = v31 * 6.28318531;
        long double v52 = exp(v30 * 6.28318531 + -3.14159265);
        double v53 = atan(v52) * 2.0 + -1.57079633;
        long double v54 = fmod(v51, 6.28318531);
        double v55 = fmod(v54 + 6.28318531, 6.28318531) + -3.14159265;
        __double2 v56 = __sincos_stret(v53);
        double v57 = 6378137.0 / sqrt(v56.__sinval * v56.__sinval * -0.00669437999 + 1.0);
        double v58 = (v57 + v50) * v56.__cosval;
        __double2 v59 = __sincos_stret(v55);
        double v31 = v58 * v59.__cosval;
        double v30 = v58 * v59.__sinval;
        double v33 = (v50 + v57 * 0.99330562) * v56.__sinval;
      }
      float32x2_t v60 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v28 + 60), *((float64x2_t *)v28 + 54), v31), *((float64x2_t *)v28 + 56), v30), *((float64x2_t *)v28 + 58), v33), 1.0/ (*((double *)v28 + 123)+ *((double *)v28 + 111) * v31+ *((double *)v28 + 115) * v30+ *((double *)v28 + 119) * v33)));
      double v61 = a4->var4;
      if (v60.f32[0] < *((float *)v61 + 12)
        || v60.f32[0] >= *((float *)v61 + 14)
        || v60.f32[1] < *((float *)v61 + 13)
        || v60.f32[1] >= *((float *)v61 + 15))
      {
LABEL_8:
        BOOL v17 = 0;
        goto LABEL_9;
      }
LABEL_38:
      if (v18 <= 2) {
        uint64_t v62 = 2;
      }
      else {
        uint64_t v62 = v18;
      }
      uint64_t v18 = v62 - 2;
LABEL_32:
      BOOL v17 = 1;
      goto LABEL_9;
    }
    uint64_t v34 = [v19 routeOffset];
    unsigned int index = self->_routeUserOffset.index;
    if (index > v34) {
      goto LABEL_8;
    }
    if (index != v34) {
      goto LABEL_38;
    }
    float offset = self->_routeUserOffset.offset;
    if (v18 <= 2) {
      uint64_t v37 = 2;
    }
    else {
      uint64_t v37 = v18;
    }
    BOOL v17 = offset < *((float *)&v34 + 1);
    if (offset < *((float *)&v34 + 1)) {
      uint64_t v18 = v37 - 2;
    }
LABEL_9:

    ++v18;
  }
  unint64_t v63 = self->_countVisibleRoadSigns;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v64 = v70;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v73;
LABEL_45:
    uint64_t v67 = 0;
    while (1)
    {
      if (*(void *)v73 != v66) {
        objc_enumerationMutation(v64);
      }
      if (self->_countVisibleRoadSigns >= self->_maxVisibleRoadSigns || v13 < 1) {
        break;
      }
      double v69 = *(void **)(*((void *)&v72 + 1) + 8 * v67);
      if ((([v69 isOnRoute] & 1) != 0
         || self->_countVisibleOffRouteRoadSigns < self->_maxVisibleOffRouteRoadSigns)
        && (![v69 isOnRoute]
         || self->_countVisibleOnRouteRoadSigns < self->_maxVisibleOnRouteRoadSigns))
      {
        [v69 prepareStyleVarsWithContext:a4];
        if ([v69 isVisible]) {
          [(LabelNavRouteLabeler *)self _tryAddRoadSignForJunction:v69 navContext:a4 labelCollisionEnabled:v71];
        }
        v13 -= self->_countVisibleRoadSigns - v63 == 1;
        unint64_t v63 = self->_countVisibleRoadSigns;
      }
      if (v65 == ++v67)
      {
        uint64_t v65 = [v64 countByEnumeratingWithState:&v72 objects:v76 count:16];
        if (v65) {
          goto LABEL_45;
        }
        break;
      }
    }
  }

LABEL_62:
}

- (void)_addVisibleSigns
{
  begiuint64_t n = (long long *)self->_activeSigns.__begin_;
  end = (long long *)self->_activeSigns.__end_;
  if (begin != end)
  {
    p_visibleSigns = &self->_visibleSigns;
    do
    {
      uint64_t v7 = *(void *)begin;
      if (*(unsigned char *)(*(void *)begin + 26))
      {
        unsigned __int8 v8 = atomic_load((unsigned __int8 *)(*(void *)(v7 + 8) + 286));
        uint64_t v7 = *(void *)begin;
        if (v8)
        {
          int v9 = *(unsigned __int8 *)(*(void *)(v7 + 8) + 280);
          *(unsigned char *)(v7 + 27) = v9;
          if (v9 == 2)
          {
            char v10 = 0;
          }
          else
          {
            *(unsigned char *)(v7 + 26) = 0;
            char v10 = 1;
          }
          *(unsigned char *)(v7 + 24) = v10;
        }
      }
      if (*(unsigned char *)(v7 + 27) == 2)
      {
        BOOL v11 = self->_visibleSigns.__end_;
        if (v11 >= self->_visibleSigns.__end_cap_.__value_)
        {
          uint64_t v6 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>((uint64_t)p_visibleSigns, begin);
        }
        else
        {
          if (v11)
          {
            uint64_t v12 = *((void *)begin + 1);
            void *v11 = v7;
            v11[1] = v12;
            if (v12) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
            }
          }
          uint64_t v6 = v11 + 2;
        }
        self->_visibleSigns.__end_ = v6;
      }
      ++begin;
    }
    while (begin != end);
  }
}

- (void)layoutWithNavContext:(NavContext *)a3 avoidanceRects:(const void *)a4
{
  uint64_t v287 = *MEMORY[0x1E4F143B8];
  begiuint64_t n = (char *)self->_activeSigns.__begin_;
  p_activeSigns = &self->_activeSigns;
  uint64_t v6 = begin;
  LOBYTE(p_activeSigns[-6].__end_) = 0;
  uint64_t v223 = (uint64_t)p_activeSigns;
  end = (char *)p_activeSigns->__end_;
  if (end != begin)
  {
    do
    {
      int v9 = (std::__shared_weak_count *)*((void *)end - 1);
      if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *, SEL))v9->__on_zero_shared)(v9, a2);
        std::__shared_weak_count::__release_weak(v9);
      }
      end -= 16;
    }
    while (end != v6);
  }
  p_visibleSigns = &self->_visibleSigns;
  BOOL v11 = (char *)self->_visibleSigns.__begin_;
  self->_activeSigns.__end_ = v6;
  for (uint64_t i = (char *)self->_visibleSigns.__end_; i != v11; i -= 16)
  {
    int64_t v13 = (std::__shared_weak_count *)*((void *)i - 1);
    if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, SEL))v13->__on_zero_shared)(v13, a2);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  int64_t v14 = self;
  self->_visibleSigns.__end_ = v11;
  if (self->_isOnRoute
    || (var2 = a3->var2,
        (unint64_t)*(unsigned __int8 *)(*(void *)(*((void *)var2 + 3) + 336) + 163) << 16 == 393216)
    || (*(unsigned int (**)(MapNavLabeler *, SEL))(*(void *)var2 + 376))(var2, a2))
  {
    [(LabelNavRouteLabeler *)self _generateCurrentRoadSignWithContext:a3];
    ptr = self->_currentRoadSign.__ptr_;
    if (!ptr || !self->_isCurrentRoadSignVisible) {
      goto LABEL_33;
    }
    md::NavLabel::layoutForStagingWithNavContext((md::NavLabel *)self->_currentRoadSign.__ptr_, (md::NavContext *)a3);
    *((_DWORD *)ptr + 81) = *((_DWORD *)ptr + 74);
    *((void *)ptr + 41) = *(void *)((char *)ptr + 300);
    if (*((unsigned char *)ptr + 280))
    {
      *((_DWORD *)ptr + 67) = *((_DWORD *)ptr + 69);
      *((unsigned char *)ptr + 280) = 0;
    }
    uint64_t v17 = *((void *)ptr + 36);
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 968))(v17);
    }
    md::NavLabel::layoutForDisplayWithNavContext((float32x2_t *)ptr, (float64x2_t **)a3);
    uint64_t v18 = self->_currentRoadSign.__ptr_;
    cntrl = self->_currentRoadSign.__cntrl_;
    v276.i64[0] = (uint64_t)v18;
    v276.i64[1] = (uint64_t)cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    uint64_t v20 = self->_visibleSigns.__end_;
    if (v20 >= self->_visibleSigns.__end_cap_.__value_)
    {
      long long v21 = std::vector<std::shared_ptr<md::RouteAnnotationLabelFeature>,geo::StdAllocator<std::shared_ptr<md::RouteAnnotationLabelFeature>,mdm::Allocator>>::__emplace_back_slow_path<std::shared_ptr<md::RouteAnnotationLabelFeature>>((uint64_t)p_visibleSigns, (uint64_t)&v276);
      cntrl = (__shared_weak_count *)v276.i64[1];
    }
    else
    {
      if (v20)
      {
        *uint64_t v20 = v18;
        v20[1] = cntrl;
        int64x2_t v276 = 0uLL;
        cntrl = 0;
      }
      long long v21 = v20 + 2;
    }
    self->_visibleSigns.__end_ = v21;
    if (!cntrl)
    {
LABEL_33:
      if (self->_tiles.__table_.__p2_.__value_) {
        goto LABEL_34;
      }
      goto LABEL_293;
    }
  }
  else
  {
    cntrl = self->_currentRoadSign.__cntrl_;
    self->_currentRoadSign.__ptr_ = 0;
    self->_currentRoadSign.__cntrl_ = 0;
    if (!cntrl) {
      goto LABEL_33;
    }
  }
  if (atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_33;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  if (self->_tiles.__table_.__p2_.__value_)
  {
LABEL_34:
    if (&self->_avoidanceRects != a4) {
      std::vector<md::AvoidanceRectWithPriority,geo::StdAllocator<md::AvoidanceRectWithPriority,mdm::Allocator>>::__assign_with_size[abi:nn180100]<md::AvoidanceRectWithPriority*,md::AvoidanceRectWithPriority*>((uint64_t)&self->_avoidanceRects, *(long long **)a4, *((long long **)a4 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3));
    }
    if (self->_disableTileParseForOneLayout
      || [(VKPolylineOverlay *)self->_route isSnappingForSceneTiles])
    {
      char v22 = 1;
    }
    else
    {
      if (self->_checkIfRouteSubrangeChanged)
      {
        if ([(LabelNavRouteLabeler *)self _updateActiveRouteRange]) {
          [(LabelNavRouteLabeler *)self _reloadRouteJunctions];
        }
        self->_checkIfRouteSubrangeChanged = 0;
      }
      if (self->_useRouteSubrange && self->_isOnRoute)
      {
        unsigned int index = self->_routeUserOffset.index;
        unsigned int v160 = self->_routeSubrangeEnd.index;
        if (index >= v160 && (index != v160 || self->_routeUserOffset.offset > self->_routeSubrangeEnd.offset))
        {
          [(LabelNavRouteLabeler *)self _updateActiveRouteRange];
          [(LabelNavRouteLabeler *)self _reloadRouteJunctions];
        }
      }
      self->_hasPendingTilesInSnappingRegiouint64_t n = 0;
      v161 = [(VKPolylineOverlay *)self->_route routeRibbon];
      v162 = [v161 renderRegion];

      if (v162)
      {
        uint64_t v163 = [v162 snappingRegion];
        p_p1 = &self->_pendingTiles.__table_.__p1_;
        v165 = (double *)(v163 + 8);
        __asm { FMOV            V6.2D, #0.5 }
        float64x2_t v236 = _Q6;
        do
        {
LABEL_246:
          p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::shared_ptr<md::LabelTile>, void *> *>, geo::StdAllocator<std::__hash_node<std::shared_ptr<md::LabelTile>, void *>, mdm::Allocator>> *)p_p1->__value_.__next_;
          if (!p_p1)
          {
            self->_hasPendingTilesInSnappingRegiouint64_t n = 0;
            goto LABEL_363;
          }
          float64x2_t v167 = vmlaq_f64(*(float64x2_t *)((char *)p_p1[1].__value_.__next_ + 312), _Q6, vsubq_f64(*(float64x2_t *)((char *)p_p1[1].__value_.__next_ + 328), *(float64x2_t *)((char *)p_p1[1].__value_.__next_ + 312)));
        }
        while (v167.f64[0] < *(double *)(v163 + 24)
             || v167.f64[0] >= *(double *)(v163 + 40)
             || v167.f64[1] < *(double *)(v163 + 32)
             || v167.f64[1] >= *(double *)(v163 + 48)
             || *(void *)v163 == (void)v165);
        float v172 = *(double **)v163;
        while (v167.f64[0] < v172[4] || v167.f64[0] >= v172[6] || v167.f64[1] < v172[5] || v167.f64[1] >= v172[7])
        {
          float v173 = (double *)*((void *)v172 + 1);
          if (v173)
          {
            do
            {
              double v174 = v173;
              float v173 = *(double **)v173;
            }
            while (v173);
          }
          else
          {
            do
            {
              double v174 = (double *)*((void *)v172 + 2);
              _ZF = *(void *)v174 == (void)v172;
              float v172 = v174;
            }
            while (!_ZF);
          }
          float v172 = v174;
          if (v174 == v165)
          {
            _Q6 = v236;
            goto LABEL_246;
          }
        }
        allocator = p_p1[1].__value__2._allocator;
        *(void *)&long long v274 = p_p1[1].__value_.__next_;
        *((void *)&v274 + 1) = allocator;
        if (allocator) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)allocator + 1, 1uLL, memory_order_relaxed);
        }
        [(LabelNavRouteLabeler *)self _addJunctionsForTile:&v274];
        [(VKLabelNavRoadGraph *)self->_roadGraph routeJunctionsHaveChanged];
        next = p_p1->__value_.__next_;
        std::__hash_table<std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,std::__unordered_map_hasher<geo::QuadTile,std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,geo::QuadTileHash,std::equal_to<geo::QuadTile>,true>,std::__unordered_map_equal<geo::QuadTile,std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,std::equal_to<geo::QuadTile>,geo::QuadTileHash,true>,geo::StdAllocator<std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,mdm::Allocator>>::remove((uint64_t)&v276, &self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, p_p1);
        uint64_t v200 = v276.i64[0];
        v276.i64[0] = 0;
        if (v200)
        {
          if (v277)
          {
            float64x2_t v201 = *(std::__shared_weak_count **)(v200 + 24);
            if (v201)
            {
              if (!atomic_fetch_add(&v201->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v201->__on_zero_shared)(v201);
                std::__shared_weak_count::__release_weak(v201);
              }
            }
          }
          (*(void (**)(void, uint64_t, uint64_t))(**(void **)v276.i64[1] + 40))(*(void *)v276.i64[1], v200, 32);
        }
        float64x2_t v202 = (std::__shared_weak_count *)*((void *)&v274 + 1);
        if (*((void *)&v274 + 1)
          && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v274 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v202->__on_zero_shared)(v202);
          std::__shared_weak_count::__release_weak(v202);
        }
        self->_hasPendingTilesInSnappingRegiouint64_t n = 0;
        if (next)
        {
          while (1)
          {
            float64x2_t v203 = vmlaq_f64(*(float64x2_t *)(next[2] + 312), v236, vsubq_f64(*(float64x2_t *)(next[2] + 328), *(float64x2_t *)(next[2] + 312)));
            BOOL v204 = v203.f64[0] >= *(double *)(v163 + 24) && v203.f64[0] < *(double *)(v163 + 40);
            BOOL v205 = !v204 || v203.f64[1] < *(double *)(v163 + 32);
            BOOL v206 = !v205 && v203.f64[1] < *(double *)(v163 + 48);
            if (v206 && *(void *)v163 != (void)v165) {
              break;
            }
LABEL_335:
            next = (void *)*next;
            if (!next) {
              goto LABEL_363;
            }
          }
          float64x2_t v208 = *(double **)v163;
          while (v203.f64[0] < v208[4] || v203.f64[0] >= v208[6] || v203.f64[1] < v208[5] || v203.f64[1] >= v208[7])
          {
            float64x2_t v209 = (double *)*((void *)v208 + 1);
            if (v209)
            {
              do
              {
                double v210 = v209;
                float64x2_t v209 = *(double **)v209;
              }
              while (v209);
            }
            else
            {
              do
              {
                double v210 = (double *)*((void *)v208 + 2);
                _ZF = *(void *)v210 == (void)v208;
                float64x2_t v208 = v210;
              }
              while (!_ZF);
            }
            float64x2_t v208 = v210;
            if (v210 == v165) {
              goto LABEL_335;
            }
          }
          self->_hasPendingTilesInSnappingRegiouint64_t n = 1;
        }
      }
LABEL_363:

      char v22 = 0;
      int64_t v14 = self;
    }
    if (v14->_hasPendingTilesInSnappingRegion) {
      char v22 = 1;
    }
    v14->_needsLayout |= v22;
    v14->_disableTileParseForOneLayout = 0;
    double v23 = a3;
    var4 = a3->var4;
    long long v274 = *((_OWORD *)var4 + 6);
    double v25 = *((double *)var4 + 14);
    double v275 = v25;
    int64x2_t v26 = vdupq_n_s64(0x7FF8000000000000uLL);
    int64x2_t v276 = v26;
    _ZF = (void)v274 == v26.i64[0] && *((void *)&v274 + 1) == v26.i64[1];
    BOOL v28 = _ZF && *(void *)&v25 == 0x7FF8000000000000;
    double v29 = 0.0;
    if (!v28)
    {
      var3 = a3->var3;
      if (*((unsigned char *)var3 + 8))
      {
        double v31 = *((double *)var3 + 19);
        if (v31 > 0.0)
        {
          float32x2_t v32 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)var3 + 60), *((float64x2_t *)var3 + 54), *(double *)&v274), *((float64x2_t *)var3 + 56), *((double *)&v274 + 1)), *((float64x2_t *)var3 + 58), v275), 1.0/ (*((double *)var3 + 123)+ *((double *)var3 + 111) * *(double *)&v274+ *((double *)var3 + 115) * *((double *)&v274 + 1)+ *((double *)var3 + 119) * v275)));
          float v33 = v32.f32[0] + -100.0;
          float v34 = *((float *)var3 + 266);
          float v35 = *((float *)var3 + 267);
          float v36 = (float)(v32.f32[1] / v35) + -0.5;
          double v37 = *((double *)var3 + 35);
          float v38 = *((double *)var3 + 33) * v37;
          double v39 = (float)((float)((float)((float)(v33 / v34) + -0.5) - *((float *)var3 + 104)) * v38);
          double v40 = (float)((float)(v36 * (float)(v35 * v38)) / v34);
          double v41 = *((double *)var3 + 22) * v37 + *((double *)var3 + 25) * v39 + *((double *)var3 + 28) * v40;
          if (v41 <= 0.0)
          {
            float64x2_t v234 = vmlaq_n_f64(*(float64x2_t *)((char *)var3 + 136), vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*((float64x2_t *)var3 + 13), v40), *(float64x2_t *)((char *)var3 + 184), v39), *((float64x2_t *)var3 + 10), v37), v31 / -v41);
            _D8 = 0x401921FB54442D18;
            long double v43 = *(double *)&v274 * 6.28318531;
            long double v44 = exp(*((double *)&v274 + 1) * 6.28318531 + -3.14159265);
            atan(v44);
            long double v45 = fmod(v43, 6.28318531);
            fmod(v45 + 6.28318531, 6.28318531);
            _V0.D[1] = v234.f64[1];
            __asm { FMLA            D10, D8, V0.D[1] }
            long double v51 = exp(_D10);
            atan(v51);
            long double v52 = fmod(6.28318531 * v234.f64[0], 6.28318531);
            fmod(v52 + 6.28318531, 6.28318531);
            GEOCalculateDistanceHighPrecision();
            double v29 = v53 * 0.01;
            double v23 = a3;
            int64_t v14 = self;
          }
        }
      }
    }
    BOOL v54 = v14->_regenerateRoadSigns && !v14->_isStylesheetAnimating;
    int v55 = v54;
    if (!v14->_isStylesheetAnimating && v29 > 0.0)
    {
      double v29 = v29
          * (float)((float)((float)((float)(*(float *)(*((void *)v23->var1 + 42) + 172) * 13.0) + 7.0)
                          + (float)(*((float *)v23->var4 + 30) * 0.5))
                  * *((float *)v23->var1 + 44));
      *(float *)&double v29 = v29;
      if (*(float *)&v29 < 100.0)
      {
        float minSignOffsetDistance = v14->_minSignOffsetDistance;
        if (minSignOffsetDistance < *(float *)&v29
          || (*(float *)&double v29 = *(float *)&v29 + 2.0, minSignOffsetDistance > *(float *)&v29))
        {
          v14->_float minSignOffsetDistance = *(float *)&v29;
          int v55 = 1;
        }
      }
    }
    v14->_countVisibleOnRouteRoadSigns = 0;
    v14->_countVisibleOffRouteRoadSigns = 0;
    v14->_unint64_t countVisibleRoadSigns = 0;
    -[VKLabelNavRoadGraph startingLabelLayoutWithContext:routeUserOffset:](v14->_roadGraph, "startingLabelLayoutWithContext:routeUserOffset:", a3, *(void *)&v14->_routeUserOffset, v29);
    uint64_t v220 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_fadingLabels];
    int v221 = v55;
    [(NSMutableArray *)self->_fadingLabels removeAllObjects];
    long long v272 = 0u;
    long long v273 = 0u;
    long long v270 = 0u;
    long long v271 = 0u;
    obuint64_t j = v220;
    uint64_t v57 = [obj countByEnumeratingWithState:&v270 objects:v286 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v271;
      do
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v271 != v58) {
            objc_enumerationMutation(obj);
          }
          double v61 = *(void **)(*((void *)&v270 + 1) + 8 * j);
          if (*(float *)(*(void *)[v61 label] + 268) != 0.0)
          {
            if (*(unsigned char *)(*(void *)[v61 label] + 264))
            {
              [v61 layoutWithNavContext:a3];
              if (*(unsigned char *)(*(void *)[v61 label] + 327))
              {
                [(NSMutableArray *)self->_fadingLabels addObject:v61];
                uint64_t v62 = [v61 label];
                unint64_t v63 = self->_activeSigns.__end_;
                if (v63 >= self->_activeSigns.__end_cap_.__value_)
                {
                  float32x2_t v60 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v223, (long long *)v62);
                }
                else
                {
                  if (v63)
                  {
                    void *v63 = *(void *)v62;
                    uint64_t v64 = *(void *)(v62 + 8);
                    v63[1] = v64;
                    if (v64) {
                      atomic_fetch_add_explicit((atomic_ullong *volatile)(v64 + 8), 1uLL, memory_order_relaxed);
                    }
                  }
                  float32x2_t v60 = v63 + 2;
                }
                self->_activeSigns.__end_ = v60;
              }
            }
          }
        }
        uint64_t v57 = [obj countByEnumeratingWithState:&v270 objects:v286 count:16];
      }
      while (v57);
    }

    double v224 = self->_visibleLabels;
    uint64_t v65 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](v224, "count"));
    visibleLabels = self->_visibleLabels;
    self->_visibleLabels = v65;

    [(NSMutableDictionary *)self->_visibleLabelsByName removeAllObjects];
    [(NSMutableSet *)self->_visibleShieldGroups removeAllObjects];
    id v222 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v67 = v221;
    id v68 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v268 = 0u;
    long long v269 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    float v225 = v224;
    uint64_t v69 = [(NSMutableArray *)v225 countByEnumeratingWithState:&v266 objects:v285 count:16];
    if (v69)
    {
      uint64_t v227 = *(void *)v267;
      do
      {
        id v228 = (id)v69;
        for (unint64_t k = 0; k != v228; unint64_t k = (char *)k + 1)
        {
          if (*(void *)v267 != v227) {
            objc_enumerationMutation(v225);
          }
          id v71 = *(id *)(*((void *)&v266 + 1) + 8 * (void)k);
          long long v72 = [v71 navFeature];
          int v235 = *(unsigned __int8 *)(*(void *)[v71 label] + 27);
          long long v73 = [v71 navFeature];
          if (([v73 isValid] & 1) == 0)
          {

            goto LABEL_191;
          }
          if (*(float *)(*(void *)[v71 label] + 268) == 0.0)
          {
            BOOL v81 = *(unsigned char *)(*(void *)[v71 label] + 264) == 0;

            if (!v81) {
              goto LABEL_191;
            }
          }
          else
          {
          }
          long long v74 = self;
          if (self->_regenerateRoadSigns)
          {
            if ([v71 isRoadLabel])
            {
              long long v75 = [v71 navFeature];
              uint64_t v76 = *(void *)[v71 label];
              *(unsigned char *)(v76 + 264) = 1;
              *(unsigned char *)(v76 + 265) = *(float *)(v76 + 268) != 0.0;
              [(NSMutableArray *)self->_fadingLabels addObject:v71];
              uint64_t v77 = [v71 label];
              long long v78 = self->_activeSigns.__end_;
              if (v78 >= self->_activeSigns.__end_cap_.__value_)
              {
                id v80 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v223, (long long *)v77);
              }
              else
              {
                if (v78)
                {
                  void *v78 = *(void *)v77;
                  uint64_t v79 = *(void *)(v77 + 8);
                  v78[1] = v79;
                  if (v79) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v79 + 8), 1uLL, memory_order_relaxed);
                  }
                }
                id v80 = v78 + 2;
              }
              self->_activeSigns.__end_ = v80;
              objc_msgSend(v75, "recreateRoadSignWithAlignment:navContext:artworkCache:", objc_msgSend(v71, "alignment"), a3, self->_artworkCache);
              unsigned int v87 = [v75 labelWithType:0];

              uint64_t v88 = [v87 navFeature];
LABEL_110:
              uint64_t v89 = (void *)v88;

              long long v72 = v89;
              id v71 = v87;
              long long v74 = self;
              goto LABEL_111;
            }
            if (self->_regenerateRoadSigns && [v71 isShieldLabel])
            {
              long long v75 = [v71 navFeature];
              uint64_t v82 = *(void *)[v71 label];
              *(unsigned char *)(v82 + 264) = 1;
              *(unsigned char *)(v82 + 265) = *(float *)(v82 + 268) != 0.0;
              [(NSMutableArray *)self->_fadingLabels addObject:v71];
              uint64_t v83 = [v71 label];
              uint64_t v84 = self->_activeSigns.__end_;
              if (v84 >= self->_activeSigns.__end_cap_.__value_)
              {
                std::string::pointer v86 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v223, (long long *)v83);
              }
              else
              {
                if (v84)
                {
                  void *v84 = *(void *)v83;
                  uint64_t v85 = *(void *)(v83 + 8);
                  v84[1] = v85;
                  if (v85) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v85 + 8), 1uLL, memory_order_relaxed);
                  }
                }
                std::string::pointer v86 = v84 + 2;
              }
              self->_activeSigns.__end_ = v86;
              [v75 recreateRoadShieldWithNavContext:a3 artworkCache:self->_artworkCache];
              unsigned int v87 = [v75 labelWithType:1];

              uint64_t v88 = [v87 navFeature];
              goto LABEL_110;
            }
          }
LABEL_111:
          if (v67 && (([v71 isRoadLabel] & 1) != 0 || objc_msgSend(v71, "isShieldLabel")))
          {
            uint64_t v90 = [v71 isShieldLabel];
            [v71 desiredOffsetDistance];
            -[LabelNavRouteLabeler _createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:](v74, "_createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:", v72, v90, a3);
          }
          [v72 layoutWithNavContext:a3];
          if (*(unsigned char *)(*(void *)[v71 label] + 327))
          {
            if ([v71 isRoadLabel])
            {
              currentRoadName = v74->_currentRoadName;
              id v92 = [v72 name];
              if ([(NSString *)currentRoadName isEqualToString:v92])
              {
                char v93 = [v72 isGuidanceStepStart];

                long long v74 = self;
                if ((v93 & 1) == 0)
                {
LABEL_123:
                  if (!*(unsigned char *)(*(void *)[v71 label] + 264))
                  {
                    uint64_t v95 = *(void *)[v71 label];
                    *(unsigned char *)(v95 + 264) = 1;
                    *(unsigned char *)(v95 + 265) = *(float *)(v95 + 268) != 0.0;
                  }
                  goto LABEL_125;
                }
              }
              else
              {

                long long v74 = self;
              }
            }
            uint64_t v94 = [v71 label];
            if (!*(unsigned char *)(*(void *)v94 + 325) || !*(unsigned char *)(*(void *)v94 + 326)) {
              goto LABEL_123;
            }
LABEL_125:
            if (!*(unsigned char *)(*(void *)[v71 label] + 264))
            {
              if ([(LabelNavRouteLabeler *)v74 _collideLabel:v71 activeLabel:0 labelsToRemove:v222])
              {
                uint64_t v96 = *(void *)[v71 label];
                *(unsigned char *)(v96 + 264) = 1;
                *(unsigned char *)(v96 + 265) = *(float *)(v96 + 268) != 0.0;
              }
              else
              {
                long long v264 = 0u;
                long long v265 = 0u;
                long long v262 = 0u;
                long long v263 = 0u;
                id v97 = v222;
                uint64_t v98 = [v97 countByEnumeratingWithState:&v262 objects:v284 count:16];
                if (v98)
                {
                  uint64_t v99 = *(void *)v263;
                  do
                  {
                    for (uint64_t m = 0; m != v98; ++m)
                    {
                      if (*(void *)v263 != v99) {
                        objc_enumerationMutation(v97);
                      }
                      BOOL v101 = *(void **)(*((void *)&v262 + 1) + 8 * m);
                      if (!*(unsigned char *)(*(void *)[v101 label] + 264))
                      {
                        uint64_t v102 = *(void *)[v101 label];
                        *(unsigned char *)(v102 + 264) = 1;
                        *(unsigned char *)(v102 + 265) = *(float *)(v102 + 268) != 0.0;
                      }
                    }
                    uint64_t v98 = [v97 countByEnumeratingWithState:&v262 objects:v284 count:16];
                  }
                  while (v98);
                }

                int v67 = v221;
                long long v74 = self;
              }
              [v222 removeAllObjects];
            }
            if ([v71 isRoadLabel]
              && !*(unsigned char *)(*(void *)[v71 label] + 264))
            {
              long long v105 = [v71 navFeature];
              uint64_t v106 = [(LabelNavRouteLabeler *)v74 orientationForRoadSign:v105 roadLabel:v71 navContext:a3];
              if (v106 != [v71 alignment] || v74->_regenerateRoadSigns)
              {
                uint64_t v107 = *(void *)[v71 label];
                *(unsigned char *)(v107 + 264) = 1;
                *(unsigned char *)(v107 + 265) = *(float *)(v107 + 268) != 0.0;
                [(NSMutableArray *)v74->_fadingLabels addObject:v71];
                uint64_t v108 = [v71 label];
                long long v109 = v74->_activeSigns.__end_;
                if (v109 >= v74->_activeSigns.__end_cap_.__value_)
                {
                  long long v111 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v223, (long long *)v108);
                }
                else
                {
                  if (v109)
                  {
                    *long long v109 = *(void *)v108;
                    uint64_t v110 = *(void *)(v108 + 8);
                    v109[1] = v110;
                    if (v110) {
                      atomic_fetch_add_explicit((atomic_ullong *volatile)(v110 + 8), 1uLL, memory_order_relaxed);
                    }
                  }
                  long long v111 = v109 + 2;
                }
                v74->_activeSigns.__end_ = v111;
                [v105 recreateRoadSignWithAlignment:v106 navContext:a3 artworkCache:v74->_artworkCache];
                uint64_t v117 = [v105 labelWithType:0];

                id v71 = (id)v117;
              }

              long long v74 = self;
              if (self->_checkOnRouteLabelsAlignment)
              {
LABEL_142:
                if ([v71 isRoadLabel])
                {
                  id v103 = [v71 navFeature];
                  if (([v103 isAwayFromRoute] & 1) != 0
                    || (int v112 = [v71 alignment],
                        v112 == [v103 roadSignAlignment])
                    && !v74->_regenerateRoadSigns)
                  {
                    uint64_t v104 = (uint64_t)v71;
                  }
                  else
                  {
                    if (*(unsigned char *)(*(void *)[v71 label] + 264))
                    {
                      [(NSMutableArray *)v74->_fadingLabels addObject:v71];
                      uint64_t v113 = [v71 label];
                      long long v114 = v74->_activeSigns.__end_;
                      if (v114 >= v74->_activeSigns.__end_cap_.__value_)
                      {
                        long long v116 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v223, (long long *)v113);
                      }
                      else
                      {
                        if (v114)
                        {
                          *long long v114 = *(void *)v113;
                          uint64_t v115 = *(void *)(v113 + 8);
                          v114[1] = v115;
                          if (v115) {
                            atomic_fetch_add_explicit((atomic_ullong *volatile)(v115 + 8), 1uLL, memory_order_relaxed);
                          }
                        }
                        long long v116 = v114 + 2;
                      }
                      v74->_activeSigns.__end_ = v116;
                      [v103 clearRoadSign];
                      uint64_t v104 = 0;
                    }
                    else
                    {
                      uint64_t v118 = *(void *)[v71 label];
                      *(unsigned char *)(v118 + 264) = 1;
                      *(unsigned char *)(v118 + 265) = *(float *)(v118 + 268) != 0.0;
                      [(NSMutableArray *)v74->_fadingLabels addObject:v71];
                      uint64_t v119 = [v71 label];
                      long long v120 = v74->_activeSigns.__end_;
                      if (v120 >= v74->_activeSigns.__end_cap_.__value_)
                      {
                        double v122 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v223, (long long *)v119);
                      }
                      else
                      {
                        if (v120)
                        {
                          *long long v120 = *(void *)v119;
                          uint64_t v121 = *(void *)(v119 + 8);
                          v120[1] = v121;
                          if (v121) {
                            atomic_fetch_add_explicit((atomic_ullong *volatile)(v121 + 8), 1uLL, memory_order_relaxed);
                          }
                        }
                        double v122 = v120 + 2;
                      }
                      v74->_activeSigns.__end_ = v122;
                      objc_msgSend(v103, "recreateRoadSignWithAlignment:navContext:artworkCache:", objc_msgSend(v103, "roadSignAlignment"), a3, v74->_artworkCache);
                      uint64_t v104 = [v103 labelWithType:0];
                    }
                  }
                  id v71 = (id)v104;
                  long long v74 = self;
                }
              }
            }
            else if (v74->_checkOnRouteLabelsAlignment)
            {
              goto LABEL_142;
            }
            if (v71)
            {
              visibleLabelsByName = v74->_visibleLabelsByName;
              long double v124 = [v71 displayGroup];
              [(NSMutableDictionary *)visibleLabelsByName setObject:v71 forKey:v124];

              uint64_t v125 = self;
              [(NSMutableArray *)self->_visibleLabels addObject:v71];
              uint64_t v126 = [v71 label];
              long double v127 = self->_activeSigns.__end_;
              if (v127 >= self->_activeSigns.__end_cap_.__value_)
              {
                double v129 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v223, (long long *)v126);
              }
              else
              {
                if (v127)
                {
                  *long double v127 = *(void *)v126;
                  uint64_t v128 = *(void *)(v126 + 8);
                  v127[1] = v128;
                  if (v128) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v128 + 8), 1uLL, memory_order_relaxed);
                  }
                }
                double v129 = v127 + 2;
              }
              self->_activeSigns.__end_ = v129;
              [v68 addObject:v72];
              if ([v71 isShieldLabel])
              {
                double v130 = [v71 navFeature];
                visibleShieldGroups = self->_visibleShieldGroups;
                float32x2_t v132 = [v130 shieldGroup];
                [(NSMutableSet *)visibleShieldGroups addObject:v132];

                uint64_t v125 = self;
              }
              if (([v71 isShieldLabel] & 1) == 0)
              {
                ++v125->_countVisibleRoadSigns;
                int v133 = [v72 isOnRoute];
                p_countVisibleOffRouteRoadSigns = &self->_countVisibleOffRouteRoadSigns;
                if (v133) {
                  p_countVisibleOffRouteRoadSigns = &self->_countVisibleOnRouteRoadSigns;
                }
                ++*p_countVisibleOffRouteRoadSigns;
              }
              if (*(void *)[v71 label] && v235 == 2)
              {
                uint64_t v135 = *(void *)[v71 label];
                *(unsigned char *)(v135 + 24) = 0;
                *(unsigned char *)(v135 + 27) = 2;
              }
            }
          }
LABEL_191:
        }
        uint64_t v69 = [(NSMutableArray *)v225 countByEnumeratingWithState:&v266 objects:v285 count:16];
      }
      while (v69);
    }

    float v136 = self;
    self->_checkOnRouteLabelsAlignment = 0;
    if (self->_isStylesheetAnimating
      || ([(LabelNavRouteLabeler *)self _addLabelsAtJunctions:self->_junctions withContext:a3 maxLabelsToAdd:self->_maxVisibleRoadSigns], [(LabelNavRouteLabeler *)self _addLabelsForJunctions:self->_junctions withContext:a3 maxLabelsToAdd:self->_maxVisibleRoadSigns useAllJunctions:0 placeShieldsFrontToBack:0], self->_hasPendingTilesInSnappingRegion))
    {
LABEL_195:
      v136->_avoidanceRects.__end_ = v136->_avoidanceRects.__begin_;
      if (!v136->_regenerateRoadSigns)
      {
LABEL_232:
        v136->_regenerateRoadSigns = 0;
        [(LabelNavRouteLabeler *)v136 _addVisibleSigns];

        return;
      }
      long long v260 = 0u;
      long long v261 = 0u;
      long long v258 = 0u;
      long long v259 = 0u;
      double v137 = v136->_junctions;
      uint64_t v138 = [(NSMutableArray *)v137 countByEnumeratingWithState:&v258 objects:v283 count:16];
      if (v138)
      {
        uint64_t v139 = *(void *)v259;
        do
        {
          for (uint64_t n = 0; n != v138; ++n)
          {
            if (*(void *)v259 != v139) {
              objc_enumerationMutation(v137);
            }
            float v141 = *(void **)(*((void *)&v258 + 1) + 8 * n);
            long long v254 = 0u;
            long long v255 = 0u;
            long long v256 = 0u;
            long long v257 = 0u;
            float v142 = [v141 roads];
            uint64_t v143 = [v142 countByEnumeratingWithState:&v254 objects:v282 count:16];
            if (v143)
            {
              uint64_t v144 = *(void *)v255;
              do
              {
                for (iuint64_t i = 0; ii != v143; ++ii)
                {
                  if (*(void *)v255 != v144) {
                    objc_enumerationMutation(v142);
                  }
                  float v146 = *(void **)(*((void *)&v254 + 1) + 8 * ii);
                  if (([v68 containsObject:v146] & 1) == 0)
                  {
                    [v146 clearRoadSign];
                    [v146 clearRoadShield];
                  }
                }
                uint64_t v143 = [v142 countByEnumeratingWithState:&v254 objects:v282 count:16];
              }
              while (v143);
            }
          }
          uint64_t v138 = [(NSMutableArray *)v137 countByEnumeratingWithState:&v258 objects:v283 count:16];
        }
        while (v138);
      }

      float v147 = self;
      if ([(VKLabelNavRoadGraph *)self->_roadGraph countReadyJunctionLists] > 1)
      {
        unint64_t v148 = 2;
      }
      else
      {
        unint64_t v148 = [(VKLabelNavRoadGraph *)self->_roadGraph countReadyJunctionLists];
        if (!v148)
        {
          id v229 = 0;
LABEL_215:
          long double v149 = [(VKLabelNavRoadGraph *)v147->_roadGraph offRouteJunctionList];

          long long v244 = 0u;
          long long v245 = 0u;
          long long v242 = 0u;
          long long v243 = 0u;
          id v230 = v149;
          uint64_t v150 = [v230 countByEnumeratingWithState:&v242 objects:v279 count:16];
          if (v150)
          {
            uint64_t v151 = *(void *)v243;
            do
            {
              for (juint64_t j = 0; jj != v150; ++jj)
              {
                if (*(void *)v243 != v151) {
                  objc_enumerationMutation(v230);
                }
                id v153 = *(id *)(*((void *)&v242 + 1) + 8 * jj);
                long long v238 = 0u;
                long long v239 = 0u;
                long long v240 = 0u;
                long long v241 = 0u;
                double v154 = [v153 roads];
                uint64_t v155 = [v154 countByEnumeratingWithState:&v238 objects:v278 count:16];
                if (v155)
                {
                  uint64_t v156 = *(void *)v239;
                  do
                  {
                    for (kunint64_t k = 0; kk != v155; ++kk)
                    {
                      if (*(void *)v239 != v156) {
                        objc_enumerationMutation(v154);
                      }
                      v158 = *(void **)(*((void *)&v238 + 1) + 8 * kk);
                      if (([v68 containsObject:v158] & 1) == 0)
                      {
                        [v158 clearRoadSign];
                        [v158 clearRoadShield];
                      }
                    }
                    uint64_t v155 = [v154 countByEnumeratingWithState:&v238 objects:v278 count:16];
                  }
                  while (v155);
                }
              }
              uint64_t v150 = [v230 countByEnumeratingWithState:&v242 objects:v279 count:16];
            }
            while (v150);
          }

          float v136 = self;
          goto LABEL_232;
        }
      }
      id v229 = 0;
      for (muint64_t m = 1; mm <= v148; ++mm)
      {
        double v176 = [(VKLabelNavRoadGraph *)v147->_roadGraph junctionListForDepth:mm];

        long long v252 = 0u;
        long long v253 = 0u;
        long long v250 = 0u;
        long long v251 = 0u;
        id v229 = v176;
        uint64_t v177 = [v229 countByEnumeratingWithState:&v250 objects:v281 count:16];
        if (v177)
        {
          long long v232 = *(md::NavContext **)v251;
          do
          {
            for (uint64_t nn = 0; nn != v177; ++nn)
            {
              if (*(md::NavContext **)v251 != v232) {
                objc_enumerationMutation(v229);
              }
              id v179 = *(id *)(*((void *)&v250 + 1) + 8 * nn);
              long long v246 = 0u;
              long long v247 = 0u;
              long long v248 = 0u;
              long long v249 = 0u;
              id v237 = v179;
              double v180 = [v179 roads];
              unint64_t v181 = v148;
              uint64_t v182 = [v180 countByEnumeratingWithState:&v246 objects:v280 count:16];
              if (v182)
              {
                uint64_t v183 = *(void *)v247;
                do
                {
                  for (uint64_t i1 = 0; i1 != v182; ++i1)
                  {
                    if (*(void *)v247 != v183) {
                      objc_enumerationMutation(v180);
                    }
                    double v185 = *(void **)(*((void *)&v246 + 1) + 8 * i1);
                    if (([v68 containsObject:v185] & 1) == 0)
                    {
                      [v185 clearRoadSign];
                      [v185 clearRoadShield];
                    }
                  }
                  uint64_t v182 = [v180 countByEnumeratingWithState:&v246 objects:v280 count:16];
                }
                while (v182);
              }

              unint64_t v148 = v181;
            }
            uint64_t v177 = [v229 countByEnumeratingWithState:&v250 objects:v281 count:16];
          }
          while (v177);
        }

        float v147 = self;
      }
      goto LABEL_215;
    }
    if (self->_shouldLabelOppositeCarriageways)
    {
      if (![(VKLabelNavRoadGraph *)self->_roadGraph prepareOppositeCarriagewayJunctions])
      {
        self->_needsLayout = 1;
        goto LABEL_195;
      }
      double v193 = [(VKLabelNavRoadGraph *)self->_roadGraph oppositeCarriagewayJunctions];
      [(LabelNavRouteLabeler *)self _addLabelsForJunctions:v193 withContext:a3 maxLabelsToAdd:self->_maxVisibleRoadSigns useAllJunctions:0 placeShieldsFrontToBack:0];

      float v136 = self;
    }
    if (!(*(unsigned int (**)(MapNavLabeler *))(*(void *)a3->var2 + 408))(a3->var2)) {
      goto LABEL_195;
    }
    unint64_t v194 = [(VKLabelNavRoadGraph *)v136->_roadGraph countReadyJunctionLists];
    BOOL v195 = v194 > 2;
    unint64_t countVisibleRoadSigns = v136->_countVisibleRoadSigns;
    if (countVisibleRoadSigns >= v136->_maxOnRoadGraphRoadSigns) {
      goto LABEL_376;
    }
    if ([(VKLabelNavRoadGraph *)v136->_roadGraph countReadyJunctionLists] > 1)
    {
      unint64_t v197 = 2;
    }
    else
    {
      unint64_t v197 = [(VKLabelNavRoadGraph *)v136->_roadGraph countReadyJunctionLists];
      if (!v197)
      {
LABEL_372:
        float v136 = self;
        unint64_t countVisibleRoadSigns = self->_countVisibleRoadSigns;
        if (countVisibleRoadSigns < self->_maxOnRoadGraphRoadSigns && v194 <= 2)
        {
          float64x2_t v216 = 0;
          self->_needsLayout = 1;
LABEL_384:

          float v136 = self;
          goto LABEL_195;
        }
LABEL_376:
        uint64_t v217 = 344;
        if (!v136->_isOnRoute) {
          uint64_t v217 = 352;
        }
        unint64_t v218 = *(unint64_t *)((char *)&v136->super.isa + v217);
        if (countVisibleRoadSigns >= v218 || !v195)
        {
          float64x2_t v216 = 0;
        }
        else
        {
          float64x2_t v216 = [(VKLabelNavRoadGraph *)v136->_roadGraph offRouteGraphJunctionsWithNavContext:a3 maxJunctions:25 isOnRoute:v136->_isOnRoute];
          [(LabelNavRouteLabeler *)v136 _addLabelsForJunctions:v216 withContext:a3 maxLabelsToAdd:v218 useAllJunctions:1 placeShieldsFrontToBack:1];
        }
        goto LABEL_384;
      }
    }
    unint64_t v211 = 2;
    while (1)
    {
      double v212 = [(VKLabelNavRoadGraph *)self->_roadGraph junctionListForDepth:v211 - 1];
      double v213 = v212;
      if (!v212 || ![v212 count]) {
        break;
      }
      [(LabelNavRouteLabeler *)self _addLabelsForJunctions:v213 withContext:a3 maxLabelsToAdd:self->_maxOnRoadGraphRoadSigns useAllJunctions:0 placeShieldsFrontToBack:1];
      BOOL v214 = self->_countVisibleRoadSigns >= self->_maxOnRoadGraphRoadSigns;

      int v215 = v211++ > v197 || v214;
      if (v215 == 1) {
        goto LABEL_372;
      }
    }

    float v136 = self;
    unint64_t countVisibleRoadSigns = self->_countVisibleRoadSigns;
    BOOL v195 = 1;
    goto LABEL_376;
  }
LABEL_293:
  [(NSMutableDictionary *)self->_visibleLabelsByName removeAllObjects];
  [(NSMutableArray *)self->_visibleLabels removeAllObjects];
  [(NSMutableSet *)self->_visibleShieldGroups removeAllObjects];
  [(NSMutableArray *)self->_fadingLabels removeAllObjects];
  float64x2_t v186 = self->_visibleSigns.__begin_;
  for (i2 = self->_visibleSigns.__end_; i2 != v186; i2 -= 2)
  {
    float v188 = (std::__shared_weak_count *)*(i2 - 1);
    if (v188 && !atomic_fetch_add(&v188->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v188->__on_zero_shared)(v188);
      std::__shared_weak_count::__release_weak(v188);
    }
  }
  float64x2_t v189 = self;
  self->_visibleSigns.__end_ = v186;
  double v190 = self->_currentRoadSign.__ptr_;
  if (v190 && self->_isCurrentRoadSignVisible)
  {
    double v191 = self->_currentRoadSign.__cntrl_;
    v276.i64[0] = (uint64_t)self->_currentRoadSign.__ptr_;
    v276.i64[1] = (uint64_t)v191;
    if (v191)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v191 + 1, 1uLL, memory_order_relaxed);
      float64x2_t v186 = self->_visibleSigns.__end_;
    }
    if (v186 >= self->_visibleSigns.__end_cap_.__value_)
    {
      double v192 = std::vector<std::shared_ptr<md::RouteAnnotationLabelFeature>,geo::StdAllocator<std::shared_ptr<md::RouteAnnotationLabelFeature>,mdm::Allocator>>::__emplace_back_slow_path<std::shared_ptr<md::RouteAnnotationLabelFeature>>((uint64_t)p_visibleSigns, (uint64_t)&v276);
      double v191 = (__shared_weak_count *)v276.i64[1];
    }
    else
    {
      if (v186)
      {
        *float64x2_t v186 = v190;
        v186[1] = v191;
        int64x2_t v276 = 0uLL;
        double v191 = 0;
      }
      double v192 = v186 + 2;
    }
    self->_visibleSigns.__end_ = v192;
    if (v191 && !atomic_fetch_add((atomic_ullong *volatile)v191 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)v191 + 16))(v191);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v191);
    }
    float64x2_t v189 = self;
  }
  v189->_regenerateRoadSigns = 0;
}

- (unsigned)orientationForRoadSign:(id)a3 roadLabel:(id)a4 navContext:(NavContext *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isAwayFromRoute] || objc_msgSend(v8, "roadSignAlignment") == 3)
  {
    if (([v8 isAwayFromRoute] & 1) == 0 && objc_msgSend(v8, "roadSignAlignment") != 3)
    {
      unsigned __int8 v10 = -[LabelNavRouteLabeler resolveOrientation:road:currentOrientation:](self, "resolveOrientation:road:currentOrientation:", a5, v8, [v9 alignment]);
LABEL_11:
      unsigned __int8 v12 = v10;
      goto LABEL_12;
    }
LABEL_10:
    unsigned __int8 v10 = [v9 alignment];
    goto LABEL_11;
  }
  float v15 = 0.0;
  if (![(VKLabelNavRoadGraph *)self->_roadGraph collideRouteWithLabel:v9 routeCrossProduct:&v15 context:a5])goto LABEL_10; {
  double v11 = v15;
  }
  if (v15 >= 0.1 && v11 <= -0.1)
  {
    unsigned __int8 v10 = [v8 roadSignAlignment];
    goto LABEL_11;
  }
  unsigned int v14 = objc_msgSend(v8, "roadSignAlignment", v11) - 1;
  if (v14 > 0xC) {
    unsigned __int8 v12 = 0;
  }
  else {
    unsigned __int8 v12 = byte_1A2900534[v14];
  }
LABEL_12:

  return v12;
}

- (unsigned)resolveOrientation:(NavContext *)a3 road:(id)a4 currentOrientation:(unsigned __int8)a5
{
  id v7 = a4;
  [(LabelNavRouteLabeler *)self createRoadSignOrientationResolver:v7 navContext:a3];
  [v7 direction2D];
  float v9 = v8;
  float v11 = v10;
  unint64_t v40 = __PAIR64__(LODWORD(v10), LODWORD(v8));
  __float2 v12 = __sincosf_stret(*((float *)a3->var3 + 105));
  if (v40 && *(void *)&v12)
  {
    float v13 = atan2f(v11, v9);
    float v14 = atan2f(v12.__sinval, v12.__cosval);
    float v15 = fmodf((float)(3.1416 - v13) + v14, 6.2832);
    float v16 = fmodf(v15 + 6.2832, 6.2832) + -3.1416;
    if (v16 < 0.0) {
      float v16 = v16 + 6.28318531;
    }
  }
  else
  {
    float v16 = 0.0;
  }
  unsigned __int8 v17 = v43;
  float v18 = fmodf(v16, 6.2832);
  float v19 = fmodf(v18 + 6.2832, 6.2832);
  uint64_t v20 = (float *)(v41 + 1);
  long long v21 = (float *)*v41;
  if ((void *)*v41 != v41 + 1)
  {
    unint64_t v22 = 0;
    double v23 = (float *)*v41;
    do
    {
      double v24 = (float *)*((void *)v23 + 1);
      if (v24)
      {
        do
        {
          double v25 = v24;
          double v24 = *(float **)v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          double v25 = (float *)*((void *)v23 + 2);
          BOOL v26 = *(void *)v25 == (void)v23;
          double v23 = v25;
        }
        while (!v26);
      }
      ++v22;
      double v23 = v25;
    }
    while (v25 != v20);
    do
    {
      unint64_t v27 = v22 >> 1;
      BOOL v28 = v21;
      if (v22 != 1)
      {
        uint64_t v30 = v22 >> 1;
        double v31 = v21;
        do
        {
          float v33 = (float *)*((void *)v31 + 1);
          if (v33)
          {
            do
            {
              BOOL v28 = v33;
              float v33 = *(float **)v33;
            }
            while (v33);
          }
          else
          {
            do
            {
              BOOL v28 = (float *)*((void *)v31 + 2);
              BOOL v26 = *(void *)v28 == (void)v31;
              double v31 = v28;
            }
            while (!v26);
          }
          double v31 = v28;
        }
        while (v30-- > 1);
      }
      if (v19 >= v28[8])
      {
        double v29 = (float *)*((void *)v28 + 1);
        if (v29)
        {
          do
          {
            long long v21 = v29;
            double v29 = *(float **)v29;
          }
          while (v29);
        }
        else
        {
          do
          {
            long long v21 = (float *)*((void *)v28 + 2);
            BOOL v26 = *(void *)v21 == (void)v28;
            BOOL v28 = v21;
          }
          while (!v26);
        }
        unint64_t v27 = v22 + ~v27;
      }
      unint64_t v22 = v27;
    }
    while (v27);
  }
  if (v21 != v20)
  {
    float v34 = v21[7];
    float v35 = v21[8];
    BOOL v36 = v19 >= v34 && v19 < v35;
    if (v36 && !*((unsigned char *)v21 + 36))
    {
      float v37 = v35 - v42;
      if ((float)(v42 + v34) <= v19 && v37 >= v19)
      {
        if (v43 - 1 > 0xC) {
          unsigned __int8 v17 = 0;
        }
        else {
          unsigned __int8 v17 = byte_1A2900534[(v43 - 1)];
        }
      }
    }
  }

  return v17;
}

- (RoadSignOrientationResolver)createRoadSignOrientationResolver:(id)a3 navContext:(NavContext *)a4
{
  uint64_t v6 = v4;
  id v12 = a3;
  int v7 = [v12 roadSignAlignment];
  char v8 = [v12 roadSignAlignment];
  uint64_t v9 = 584;
  if (v7 == 7) {
    uint64_t v9 = 560;
  }
  *(void *)uint64_t v6 = (char *)self + v9;
  *(_DWORD *)(v6 + 8) = 1035122883;
  *(unsigned char *)(v6 + 12) = v8;

  result.var1 = (Unit<geo::RadianUnitDescription, float>)v11;
  result.var2 = BYTE4(v11);
  result.var0 = v10;
  return result;
}

- (void)_generateCurrentRoadSignWithContext:(NavContext *)a3
{
  __int16 v98 = 0;
  var1 = a3->var1;
  uint64_t v8 = *((void *)var1 + 43);
  int v7 = (std::__shared_weak_count *)*((void *)var1 + 44);
  if (v7
    && (atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *, SEL))v7->__on_zero_shared)(v7, a2);
    std::__shared_weak_count::__release_weak(v7);
    if (!v8) {
      goto LABEL_62;
    }
  }
  else if (!v8)
  {
    goto LABEL_62;
  }
  uint64_t v9 = a3->var1;
  uint64_t v11 = *((void *)v9 + 43);
  float v10 = (std::__shared_weak_count *)*((void *)v9 + 44);
  *(void *)&long long v100 = v11;
  *((void *)&v100 + 1) = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  memset(&v91, 0, 24);
  *(void *)&v91._fillColor._backing._e[2] = gss::Allocator::instance((gss::Allocator *)self);
  *(void *)(&v90._orientation + 7) = 0;
  *(void *)&v90._orientatiouint64_t n = 0;
  HIBYTE(v90._scale) = 1;
  gss::StylesheetManager<gss::ScenePropertyID>::styleQueryForFeatureAttributes((uint64_t *)&v75, v11, (gss::FeatureAttributeSet *)&v91, (gss::QueryOverrides *)&v90);
  if (*(void *)&v91._hasFillColor)
  {
    v91._fillColor._backing._e[0] = *(double *)&v91._hasFillColor;
    (*(void (**)(void, void, void))(**(void **)&v91._fillColor._backing._e[2] + 40))(*(void *)&v91._fillColor._backing._e[2], *(void *)&v91._hasFillColor, *(void *)&v91._fillColor._backing._e[1] - *(void *)&v91._hasFillColor);
  }
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  long long v12 = v75;
  *(_OWORD *)&v90._orientatiouint64_t n = v75;
  if (*((void *)&v75 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v75 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  gss::QueryableLocker<gss::ScenePropertyID>::QueryableLocker((uint64_t *)&v91._hasFillColor, v12, *((uint64_t *)&v12 + 1));
  if (*((void *)&v12 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v12 + 1) + 16))(*((void *)&v12 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v12 + 1));
    if (!LOBYTE(v91._fillColor._backing._e[3])) {
      goto LABEL_60;
    }
  }
  else if (!LOBYTE(v91._fillColor._backing._e[3]))
  {
    goto LABEL_60;
  }
  unsigned int v13 = (int)*((float *)a3->var3 + 8);
  LOBYTE(v99[0]) = 1;
  float v14 = *(unsigned __int8 **)(*(void *)&v91._hasFillColor + 24);
  if (v13 >= 0x17) {
    unsigned int v15 = 23;
  }
  else {
    unsigned int v15 = v13;
  }
  float v16 = *(float **)v14;
  if (*(void *)v14
    && (float v17 = *v16, LODWORD(v16) = *v16 == 1.0, v14[10])
    && (v17 != 0.0 ? (_ZF = v17 == 1.0) : (_ZF = 1), !_ZF)
    || (v19 = v14[v16 + 11], float v17 = 0.0, v19 == 2))
  {
    v90._orientatiouint64_t n = 1;
    LOBYTE(v100) = 1;
    unsigned __int8 v20 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<BOOL>(v14, v15, 0, &v90);
    unsigned __int8 v21 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<BOOL>(v14, v15, 1, &v100);
    int v22 = (v90._orientation | v100) != 0;
    if (v17 < 1.0) {
      unsigned __int8 v21 = v20;
    }
  }
  else
  {
    unsigned __int8 v21 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<BOOL>(*(unsigned __int8 **)(*(void *)&v91._hasFillColor + 24), v15, v19, v99);
    int v22 = LOBYTE(v99[0]);
  }
  if (v21) {
    BOOL v23 = v22 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  BOOL v24 = !v23;
  self->_isCurrentRoadSignVisible = v24;
  unsigned int v25 = (int)*((float *)a3->var3 + 8);
  LOBYTE(v99[0]) = 1;
  uint64_t v26 = *(void *)(*(void *)&v91._hasFillColor + 24);
  if (v25 >= 0x17) {
    unsigned int v27 = 23;
  }
  else {
    unsigned int v27 = v25;
  }
  BOOL v28 = *(float **)v26;
  if (*(void *)v26
    && (float v29 = *v28, LODWORD(v28) = *v28 == 1.0, *(unsigned char *)(v26 + 10))
    && (v29 != 0.0 ? (BOOL v30 = v29 == 1.0) : (BOOL v30 = 1), !v30)
    || (v31 = *(unsigned __int8 *)(v26 + v28 + 11), float v29 = 0.0, v31 == 2))
  {
    v90._orientatiouint64_t n = 1;
    LOBYTE(v100) = 1;
    int v32 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<int>(v26, v27, 0, &v90);
    int v33 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<int>(v26, v27, 1u, &v100);
    int v34 = (v90._orientation | v100) != 0;
    if (v29 < 1.0) {
      LOWORD(v33) = v32;
    }
  }
  else
  {
    int v33 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<int>(*(void *)(*(void *)&v91._hasFillColor + 24), v27, v31, v99);
    int v34 = LOBYTE(v99[0]);
  }
  if (v34) {
    __int16 v35 = v33;
  }
  else {
    __int16 v35 = v98;
  }
  __int16 v98 = v35;
LABEL_60:
  gss::QueryableLocker<gss::ScenePropertyID>::~QueryableLocker((uint64_t)&v91);
  BOOL v36 = (std::__shared_weak_count *)*((void *)&v75 + 1);
  if (!*((void *)&v75 + 1)
    || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v75 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
LABEL_62:
    if (self->_regenerateRoadSigns) {
      goto LABEL_63;
    }
    goto LABEL_67;
  }
  ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
  std::__shared_weak_count::__release_weak(v36);
  if (self->_regenerateRoadSigns) {
    goto LABEL_63;
  }
LABEL_67:
  p_currentRoadSiguint64_t n = &self->_currentRoadSign;
  ptr = self->_currentRoadSign.__ptr_;
  if (ptr)
  {
    float v40 = *((float *)ptr + 86) - *((float *)ptr + 84);
    var4 = a3->var4;
    float v42 = *((float *)var4 + 8);
    float v43 = *((float *)var4 + 10);
    if (v40 <= (float)(v43 - v42))
    {
      v3.i32[0] = *((_DWORD *)var4 + 31);
      int v44 = *((_DWORD *)var4 + 32);
      float v45 = v40 * 0.5;
      if ((float)(*(float *)v3.i32 - v45) >= v42)
      {
        if ((float)(*(float *)v3.i32 + v45) > v43) {
          *(float *)v3.i32 = v43 - v45;
        }
      }
      else
      {
        *(float *)v3.i32 = v42 + v45;
      }
      *((_DWORD *)ptr + 75) = v3.i32[0];
      *((_DWORD *)ptr + 76) = v44;
      v3.i32[0] = *((_DWORD *)ptr + 87);
      float v69 = *(float *)v3.i32 - *((float *)ptr + 85);
      v3.i16[0] = v98;
      float v70 = *((float *)a3->var1 + 44) * (float)vmovl_s16(v3).i32[0];
      *((_DWORD *)ptr + 64) = 0;
      *((float *)ptr + 65) = v70 + (float)(v69 * 0.5);
      *((float *)ptr + 88) = v69 + v70;
      return;
    }
LABEL_63:
    cntrl = self->_currentRoadSign.__cntrl_;
    self->_currentRoadSign.__ptr_ = 0;
    self->_currentRoadSign.__cntrl_ = 0;
    if (!cntrl) {
      return;
    }
    goto LABEL_64;
  }
  if (![(NSString *)self->_currentLocationText length]) {
    goto LABEL_63;
  }
  v95[0] = 0;
  v94[0] = 0;
  GetLabelNavStyleAttributes(&v96, 3u, 1, v95, v94);
  double v46 = a3->var1;
  __double2 v47 = *(std::__shared_weak_count **)&v97;
  *(void *)&v91._hasFillColor = v96;
  v91._fillColor._backing._e[0] = v97;
  if (v97 != 0.0) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v97 + 8), 1uLL, memory_order_relaxed);
  }
  md::LabelManager::styleQueryForFeatureAttributes((uint64_t)&v92, *((void *)v46 + 42), (uint64_t *)&v91._hasFillColor);
  if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
  }
  if (v92)
  {
    v91._gradientFillAngle = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)v91._fillColor._backing._e = _Q0;
    *(_OWORD *)&v91._fillColor._backing._e[2] = _Q0;
    memset(&v91._shadowColor, 0, 24);
    v91._shadowColor._backing._e[3] = 0.200000003;
    memset(&v91._textColor, 0, 24);
    v91._textColor._backing._e[3] = 1.0;
    v90._orientatiouint64_t n = 0;
    *(_OWORD *)&v90._scale = _Q0;
    *(_OWORD *)&v90._arrowWeight = xmmword_1A28FE8E0;
    v90._arrowTipCornerRadius = 0.0;
    v90._arrowJoinCornerRadius = 0.0;
    v90._shadowOffset = (CGSize)*MEMORY[0x1E4F1DB30];
    v90._strokeWeight = 0.0;
    v90._innerStrokeWeight = 0.0;
    v90._shadowRadius = 20.0;
    *(_OWORD *)&v90._signHeight = xmmword_1A28FE8F0;
    v90._horizontalMargiuint64_t n = 0.0;
    v90._verticalMargiuint64_t n = 0.0;
    v90._cornerRadius = 6.5;
    v90._glyphSize = v90._shadowOffset;
    v90._glyphVerticalOffset = 0.0;
    *(void *)&v91._hasFillColor = 0x1010000000001;
    __asm { FMOV            V1.2D, #6.0 }
    long long v75 = _Q0;
    long long v76 = _Q1;
    long long v77 = xmmword_1A28FF260;
    uint64_t v78 = 0x4031000000000000;
    uint64_t v79 = 0;
    uint64_t v80 = 0;
    uint64_t v81 = 0;
    {
      operator new();
    }
    uint64_t v82 = mdm::Allocator::instance(void)::alloc;
    uint64_t v83 = 0;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    {
      operator new();
    }
    double v88 = 0.0;
    uint64_t v86 = mdm::Allocator::instance(void)::alloc;
    uint64_t v87 = 0;
    v90._orientatiouint64_t n = 13;
    double v53 = a3->var1;
    double v54 = *((float *)v53 + 44);
    v90._scale = *(float *)(*((void *)v53 + 42) + 172);
    v90._contentScale = v54;
    *(double *)&long long v75 = v90._scale;
    *((double *)&v75 + 1) = v54;
    __int16 v89 = 1;
    long long v100 = 0uLL;
    v99[0] = 0;
    v99[1] = 0;
    if (GetRoadSignMetadataForStyleQuery(v92, v93, (uint64_t *)v99, (uint64_t)&v91, (uint64_t)&v90, (uint64_t)&v75))
    {
      int v55 = a3->var4;
      float v56 = *((float *)a3->var1 + 44);
      float v57 = (float)((float)((float)(*((float *)v55 + 10) - *((float *)v55 + 8)) / v56) + -32.0)
          + round(*(double *)&v75 * *(double *)&v76 * *((double *)&v75 + 1)) * -2.0;
      double v58 = v57;
      double v59 = round(*(double *)&v75 * *((double *)&v77 + 1) * *((double *)&v75 + 1));
      double v60 = v59 + v59;
      if (v60 <= v58)
      {
        LOWORD(v60) = v98;
        float v61 = round(v90._scale * v90._signHeight * v90._contentScale) / v56;
        if ((float)(v61 + (float)((float)vmovl_s16(*(int16x4_t *)&v60).i32[0] * 2.0)) < (float)((float)(*((float *)v55 + 11) - *((float *)v55 + 9))
                                                                                               / v56))
        {
          double v88 = v58;
          uint64_t v62 = [(LabelNavRouteLabeler *)self currentLocationText];

          if (v62)
          {
            artworkCache = (VKLabelNavArtworkCache *)self->_artworkCache;
            uint64_t v64 = [(LabelNavRouteLabeler *)self currentLocationText];
            uint64_t v65 = VKLabelNavArtworkCache::getRoadSignArtwork(artworkCache, v64, &v90, &v91, (const md::RoadSignTextMetrics *)&v75);
            v99[0] = v65;

            if (v65)
            {
              uint64_t v66 = [(LabelNavRouteLabeler *)self currentLocationText];
              int v67 = (uint64_t *)((char *)a3->var4 + 124);
              int v74 = *((_DWORD *)a3->var1 + 44);
              std::make_shared[abi:nn180100]<md::NavCurrentRoadSign,NSString * {__strong},std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>> &,gm::Matrix<float,2,1> const&,float,VKRoadSignArtwork * {__strong}&,short &,void>((uint64_t)&v100, v66, v92, v93, v67, (float *)&v74, v99, &v98);
              std::shared_ptr<md::LabelFeature>::operator=[abi:nn180100]((uint64_t)p_currentRoadSign, &v100);
              std::shared_ptr<md::MapTileData>::~shared_ptr[abi:nn180100]((uint64_t)&v100);

              id v68 = p_currentRoadSign->__ptr_;
              *((unsigned char *)v68 + 264) = 0;
              *((unsigned char *)v68 + 265) = *((float *)v68 + 67) != 1.0;
            }
          }
        }
      }
    }
    else
    {
      long long v72 = self->_currentRoadSign.__cntrl_;
      self->_currentRoadSign.__ptr_ = 0;
      self->_currentRoadSign.__cntrl_ = 0;
      if (v72 && !atomic_fetch_add((atomic_ullong *volatile)v72 + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(__shared_weak_count *))(*(void *)v72 + 16))(v72);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v72);
      }
    }
    if (SHIBYTE(v85) < 0) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v86 + 40))(v86, v83, v85 & 0x7FFFFFFFFFFFFFFFLL);
    }
    if (SHIBYTE(v81) < 0) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v82 + 40))(v82, v79, v81 & 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    id v71 = self->_currentRoadSign.__cntrl_;
    self->_currentRoadSign.__ptr_ = 0;
    self->_currentRoadSign.__cntrl_ = 0;
    if (v71 && !atomic_fetch_add((atomic_ullong *volatile)v71 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)v71 + 16))(v71);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v71);
    }
  }
  long long v73 = v93;
  if (v93 && !atomic_fetch_add(&v93->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
    std::__shared_weak_count::__release_weak(v73);
  }
  cntrl = *(__shared_weak_count **)&v97;
  if (v97 != 0.0)
  {
LABEL_64:
    if (!atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (BOOL)_collideLabel:(id)a3 activeLabel:(id)a4 labelsToRemove:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v44 = a5;
  __double2 v47 = v8;
  uint64_t v10 = [v8 label];
  begiuint64_t n = self->_avoidanceRects.__begin_;
  end = self->_avoidanceRects.__end_;
  while (begin != end)
  {
    char v13 = [v47 isJunctionLabel];
    if (*((unsigned char *)begin + 20)) {
      char v14 = 0;
    }
    else {
      char v14 = v13;
    }
    if ((v14 & 1) == 0)
    {
      unsigned int v15 = *(float **)v10;
      if (*(float *)(*(void *)v10 + 344) > *(float *)begin
        && v15[84] < *((float *)begin + 2)
        && v15[87] > *((float *)begin + 1)
        && v15[85] < *((float *)begin + 3))
      {
        BOOL v16 = 1;
        goto LABEL_77;
      }
    }
    begiuint64_t n = (AvoidanceRectWithPriority *)((char *)begin + 24);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  float v17 = self->_visibleLabels;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v51;
LABEL_15:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v51 != v19) {
        objc_enumerationMutation(v17);
      }
      id v21 = *(id *)(*((void *)&v50 + 1) + 8 * v20);
      if (v21 != v9)
      {
        int v22 = *(float **)v10;
        uint64_t v23 = [*(id *)(*((void *)&v50 + 1) + 8 * v20) label];
        BOOL v24 = *(float **)v23;
        if (v22[86] > *(float *)(*(void *)v23 + 336) && v22[84] < v24[86] && v22[87] > v24[85] && v22[85] < v24[87]) {
          break;
        }
      }
LABEL_16:
      if (v18 == ++v20)
      {
        uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v18) {
          goto LABEL_15;
        }
        goto LABEL_74;
      }
    }
    id v48 = v47;
    id v49 = v21;
    unsigned int v25 = (uint64_t *)[v48 label];
    uint64_t v26 = (std::__shared_weak_count *)v25[1];
    uint64_t v54 = *v25;
    int v55 = v26;
    if (v26) {
      atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned int v27 = [v48 navFeature];
    BOOL v28 = [v49 navFeature];
    if (![v27 isOnRoute])
    {
      char v30 = [v27 isAwayFromRoute];
      unsigned int v31 = v49;
      if ((v30 & 1) == 0)
      {
        char v32 = [v28 isAwayFromRoute];
        unsigned int v31 = v49;
        if ((v32 & 1) == 0)
        {
          char v33 = [v48 isShieldLabel];
          unsigned int v31 = v49;
          if ((v33 & 1) == 0)
          {
            [v49 isShieldLabel];
            unsigned int v31 = v49;
          }
        }
      }
      goto LABEL_68;
    }
    if (![v28 isOnRoute])
    {
      if ([v48 isShieldLabel])
      {
        char v34 = [v49 isShieldLabel];
        unsigned int v31 = v49;
        if ((v34 & 1) == 0) {
          goto LABEL_68;
        }
      }
LABEL_67:
      unsigned int v31 = v48;
LABEL_68:
      id v46 = v31;

      if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }

      if (v46 == v49)
      {

        BOOL v16 = 1;
        goto LABEL_76;
      }
      objc_msgSend(v44, "addObject:");

      goto LABEL_16;
    }
    if (([v48 isShieldLabel] & 1) != 0 || (objc_msgSend(v49, "isShieldLabel") & 1) == 0)
    {
      if ([v48 isShieldLabel])
      {
        int v29 = [v49 isShieldLabel] ^ 1;
        int v45 = v29;
      }
      else
      {
        int v45 = 0;
        int v29 = 0;
      }
    }
    else
    {
      int v45 = 0;
      int v29 = 1;
    }
    if (![v27 isInGuidance] || objc_msgSend(v28, "isInGuidance"))
    {
      if ([v27 isInGuidance])
      {
        if (v29) {
          goto LABEL_66;
        }
      }
      else
      {
        int v35 = [v28 isInGuidance];
        int v36 = v45;
        if (v35) {
          int v36 = 1;
        }
        int v45 = v36;
        if ((v35 | v29)) {
          goto LABEL_66;
        }
      }
      if (![v48 isJunctionLabel] || objc_msgSend(v49, "isJunctionLabel"))
      {
        if (([v48 isJunctionLabel] & 1) == 0)
        {
          char v37 = [v49 isJunctionLabel];
          unsigned int v31 = v49;
          if (v37) {
            goto LABEL_68;
          }
        }
        if (![v27 isStartOfRoadName]
          || [v28 isStartOfRoadName])
        {
          if (([v27 isStartOfRoadName] & 1) == 0)
          {
            char v38 = [v28 isStartOfRoadName];
            unsigned int v31 = v49;
            if (v38) {
              goto LABEL_68;
            }
          }
          uint64_t v39 = [v28 routeOffset];
          uint64_t v40 = [v27 routeOffset];
          BOOL v41 = v39 < v40
             || *((float *)&v39 + 1) <= *((float *)&v40 + 1) && v39 == v40;
          int v45 = v41;
        }
      }
    }
LABEL_66:
    unsigned int v31 = v49;
    if (v45) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_74:
  BOOL v16 = 0;
LABEL_76:

LABEL_77:
  return v16;
}

- (void)_tryAddLabel:(id)a3 navContext:(NavContext *)a4 labelCollisionEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    uint64_t v85 = v8;
    id v9 = v8;
    if (*(void *)[v8 label])
    {
      obuint64_t j = v5;
      uint64_t v86 = [v85 navFeature];
      visibleLabelsByName = self->_visibleLabelsByName;
      uint64_t v11 = [v9 displayGroup];
      long long v12 = [(NSMutableDictionary *)visibleLabelsByName objectForKey:v11];

      uint64_t v80 = [v12 navFeature];
      if (self->_regenerateRoadSigns)
      {

        long long v12 = 0;
      }
      uint64_t v87 = v12;
      if (objc_msgSend(v85, "isShieldLabel", v80))
      {
        id v13 = v86;
        visibleShieldGroups = self->_visibleShieldGroups;
        unsigned int v15 = [v13 shieldGroup];
        LOBYTE(visibleShieldGroups) = [(NSMutableSet *)visibleShieldGroups containsObject:v15];

        if (visibleShieldGroups)
        {

LABEL_111:
          id v9 = v85;
          goto LABEL_112;
        }
        BOOL v16 = self->_visibleShieldGroups;
        float v17 = [v13 shieldGroup];
        [(NSMutableSet *)v16 addObject:v17];
      }
      if (([v86 isAwayFromRoute] & 1) != 0 || objc_msgSend(v81, "isOnRoute"))
      {
        char v18 = [v86 isRamp];
        if (v12) {
          char v19 = 1;
        }
        else {
          char v19 = v18;
        }
        if ((v19 & 1) == 0)
        {
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          uint64_t v20 = self->_visibleLabels;
          uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v98 objects:v104 count:16];
          if (!v21) {
            goto LABEL_23;
          }
          uint64_t v22 = *(void *)v99;
LABEL_17:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v99 != v22) {
              objc_enumerationMutation(v20);
            }
            BOOL v24 = [*(id *)(*((void *)&v98 + 1) + 8 * v23) navFeature];
            unsigned int v25 = [v24 name];
            uint64_t v26 = [v86 name];
            char v27 = [v25 isEqualToString:v26];

            if (v27) {
              break;
            }
            if (v21 == ++v23)
            {
              uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v98 objects:v104 count:16];
              if (!v21)
              {
LABEL_23:

                long long v12 = v87;
                goto LABEL_24;
              }
              goto LABEL_17;
            }
          }
        }
        goto LABEL_111;
      }
LABEL_24:
      if (v12)
      {
        if (v12 == v85) {
          goto LABEL_111;
        }
        if (([v86 isOnRoute] & 1) == 0 && (objc_msgSend(v81, "isAwayFromRoute") & 1) == 0)
        {
          if ([v81 isOnRoute]) {
            goto LABEL_111;
          }
          if ([v85 isRoadLabel])
          {
            uint64_t v30 = [v81 intraRoadPriorityForRoadLabel];
            uint64_t v31 = [v86 intraRoadPriorityForRoadLabel];
          }
          else
          {
            uint64_t v30 = [v81 intraRoadPriorityForShieldLabel];
            uint64_t v31 = [v86 intraRoadPriorityForShieldLabel];
          }
          if (v30 > v31) {
            goto LABEL_111;
          }
          if (v30 == v31)
          {
            [v12 desiredOffsetDistance];
            float v75 = v74;
            [v85 desiredOffsetDistance];
            if ((float)(v75 - v76) <= 10.0) {
              goto LABEL_111;
            }
          }
          if (*(float *)(*(void *)[v12 label] + 340) < *((float *)a4->var4 + 21))
          {
            long long v77 = [v85 navFeature];
            uint64_t v78 = [v12 navFeature];
            BOOL v79 = v77 == v78;

            long long v12 = v87;
            if (v79) {
              goto LABEL_111;
            }
          }
        }
        if ([v81 isOnRoute])
        {
          if ([v81 isStartOfRoadName])
          {
            if (![v86 isStartOfRoadName]) {
              goto LABEL_111;
            }
            uint64_t v28 = [v81 routeOffset];
            uint64_t v29 = [v86 routeOffset];
            if (v28 < v29
              || v28 == v29 && *((float *)&v28 + 1) <= *((float *)&v29 + 1))
            {
              goto LABEL_111;
            }
          }
          else if (([v86 isStartOfRoadName] & 1) == 0)
          {
            uint64_t v72 = [v81 routeOffset];
            uint64_t v73 = [v86 routeOffset];
            if (v72 < v73
              || v72 == v73 && *((float *)&v72 + 1) <= *((float *)&v73 + 1))
            {
              goto LABEL_111;
            }
            if (*(float *)(*(void *)[v12 label] + 268) != 0.0) {
              goto LABEL_111;
            }
          }
        }
      }
      char v32 = (uint64_t *)[v85 label];
      uint64_t v33 = *v32;
      char v34 = (std::__shared_weak_count *)v32[1];
      uint64_t v96 = *v32;
      double v97 = v34;
      if (v34) {
        atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [v85 layoutWithNavContext:a4];
      if (*(unsigned char *)(v33 + 327))
      {
        if (*(unsigned char *)(v33 + 325) && *(unsigned char *)(v33 + 326))
        {
          id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (v12) {
            [v82 addObject:v12];
          }
          if (!obj
            || ![(LabelNavRouteLabeler *)self _collideLabel:v85 activeLabel:v12 labelsToRemove:v82])
          {
            if (([v86 isAwayFromRoute] & 1) == 0)
            {
              long long v94 = 0u;
              long long v95 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              obja = self->_visibleLabels;
              uint64_t v35 = [(NSMutableArray *)obja countByEnumeratingWithState:&v92 objects:v103 count:16];
              if (v35)
              {
                uint64_t v36 = *(void *)v93;
                do
                {
                  for (uint64_t i = 0; i != v35; ++i)
                  {
                    if (*(void *)v93 != v36) {
                      objc_enumerationMutation(obja);
                    }
                    char v38 = *(void **)(*((void *)&v92 + 1) + 8 * i);
                    uint64_t v39 = [v38 navFeature];
                    if ([v39 isAwayFromRoute])
                    {
                      uint64_t v40 = [v38 navFeature];
                      BOOL v41 = [v40 name];
                      float v42 = [v86 name];
                      int v43 = [v41 isEqualToString:v42];

                      if (v43 && ([v82 containsObject:v38] & 1) == 0) {
                        [v82 addObject:v38];
                      }
                    }
                    else
                    {
                    }
                  }
                  uint64_t v35 = [(NSMutableArray *)obja countByEnumeratingWithState:&v92 objects:v103 count:16];
                }
                while (v35);
              }
            }
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            id v44 = v82;
            uint64_t v45 = [v44 countByEnumeratingWithState:&v88 objects:v102 count:16];
            if (v45)
            {
              uint64_t v46 = *(void *)v89;
              do
              {
                for (uint64_t j = 0; j != v45; ++j)
                {
                  if (*(void *)v89 != v46) {
                    objc_enumerationMutation(v44);
                  }
                  id v48 = *(void **)(*((void *)&v88 + 1) + 8 * j);
                  if (*(float *)(*(void *)[v48 label] + 268) == 0.0)
                  {
                    begiuint64_t n = self->_activeSigns.__begin_;
                    end = self->_activeSigns.__end_;
                    long long v51 = (void *)[v48 label];
                    if (begin != end)
                    {
                      while (*begin != *v51)
                      {
                        begin += 2;
                        if (begin == end)
                        {
                          begiuint64_t n = end;
                          break;
                        }
                      }
                    }
                    long long v52 = self->_activeSigns.__end_;
                    if (begin != v52)
                    {
                      long long v53 = begin + 2;
                      if (begin + 2 != v52)
                      {
                        do
                        {
                          begiuint64_t n = v53;
                          long long v54 = *(_OWORD *)v53;
                          *long long v53 = 0;
                          v53[1] = 0;
                          int v55 = (std::__shared_weak_count *)*(v53 - 1);
                          *((_OWORD *)v53 - 1) = v54;
                          if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                          {
                            ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
                            std::__shared_weak_count::__release_weak(v55);
                          }
                          long long v53 = begin + 2;
                        }
                        while (begin + 2 != v52);
                        long long v52 = self->_activeSigns.__end_;
                      }
                      while (v52 != begin)
                      {
                        uint64_t v62 = (std::__shared_weak_count *)*(v52 - 1);
                        if (v62 && !atomic_fetch_add(&v62->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                        {
                          ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
                          std::__shared_weak_count::__release_weak(v62);
                        }
                        v52 -= 2;
                      }
                      self->_activeSigns.__end_ = begin;
                    }
                    unint64_t v63 = self->_visibleLabelsByName;
                    uint64_t v64 = [v48 displayGroup];
                    [(NSMutableDictionary *)v63 removeObjectForKey:v64];

                    [(NSMutableArray *)self->_visibleLabels removeObject:v48];
                    if ([v48 isShieldLabel])
                    {
                      double v59 = [v48 navFeature];
                      uint64_t v65 = self->_visibleShieldGroups;
                      float v61 = [v59 shieldGroup];
                      [(NSMutableSet *)v65 removeObject:v61];
                      goto LABEL_95;
                    }
                  }
                  else
                  {
                    if (!*(unsigned char *)(*(void *)[v48 label] + 264))
                    {
                      uint64_t v56 = *(void *)[v48 label];
                      *(unsigned char *)(v56 + 264) = 1;
                      *(unsigned char *)(v56 + 265) = *(float *)(v56 + 268) != 0.0;
                    }
                    if (v48 == v87)
                    {
                      [(NSMutableArray *)self->_fadingLabels addObject:v87];
                      uint64_t v57 = self->_visibleLabelsByName;
                      double v58 = [v87 displayGroup];
                      [(NSMutableDictionary *)v57 removeObjectForKey:v58];

                      [(NSMutableArray *)self->_visibleLabels removeObject:v87];
                      if ([v87 isShieldLabel])
                      {
                        double v59 = [v87 navFeature];
                        double v60 = self->_visibleShieldGroups;
                        float v61 = [v59 shieldGroup];
                        [(NSMutableSet *)v60 removeObject:v61];
LABEL_95:

                        continue;
                      }
                    }
                  }
                }
                uint64_t v45 = [v44 countByEnumeratingWithState:&v88 objects:v102 count:16];
              }
              while (v45);
            }

            uint64_t v66 = self->_visibleLabelsByName;
            int v67 = [v85 displayGroup];
            [(NSMutableDictionary *)v66 setObject:v85 forKey:v67];

            [(NSMutableArray *)self->_visibleLabels addObject:v85];
            if (([v85 isShieldLabel] & 1) == 0)
            {
              ++self->_countVisibleRoadSigns;
              int v68 = [v86 isOnRoute];
              uint64_t v69 = 296;
              if (v68) {
                uint64_t v69 = 288;
              }
              ++*(Class *)((char *)&self->super.isa + v69);
            }
            if ([(NSMutableArray *)self->_fadingLabels containsObject:v85])
            {
              [(NSMutableArray *)self->_fadingLabels removeObject:v85];
              uint64_t v70 = v96;
              BOOL v71 = *(float *)(v96 + 268) != 1.0;
            }
            else
            {
              std::vector<std::shared_ptr<md::NavLabel>,geo::StdAllocator<std::shared_ptr<md::NavLabel>,mdm::Allocator>>::push_back[abi:nn180100]((uint64_t)&self->_activeSigns, (uint64_t)&v96);
              uint64_t v70 = v96;
              *(_DWORD *)(v96 + 268) = 0;
              BOOL v71 = 1;
            }
            *(unsigned char *)(v70 + 264) = 0;
            *(unsigned char *)(v70 + 265) = v71;
            char v34 = v97;
          }
        }
        else if (!*(unsigned char *)(v33 + 264))
        {
          *(unsigned char *)(v33 + 264) = 1;
          *(unsigned char *)(v33 + 265) = *(float *)(v33 + 268) != 0.0;
        }
      }
      if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
      goto LABEL_111;
    }
  }
LABEL_112:
}

- (void)_tryAddRoadSignForRoad:(id)a3 isShield:(BOOL)a4 navContext:(NavContext *)a5 labelCollisionEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v45 = a3;
  if (v8) {
    goto LABEL_6;
  }
  currentRoadName = self->_currentRoadName;
  uint64_t v11 = [v45 name];
  if (![(NSString *)currentRoadName isEqualToString:v11])
  {

LABEL_6:
    if ([v45 isRamp] && (objc_msgSend(v45, "isOnewayToJunction") & 1) != 0
      || [v45 isOnRoute] & v8
      || !v8
      && ([v45 hasVisibleShields]
       && ([v45 suppressRoadSignIfShieldPresent] & 1) != 0
       || ([v45 suppressRoadSignIfDeduped] & 1) != 0))
    {
      goto LABEL_66;
    }
    id v13 = [v45 labelWithType:v8];
    if (v13 && ([(NSMutableArray *)self->_visibleLabels containsObject:v13] & 1) != 0) {
      goto LABEL_65;
    }
    if (v8)
    {
      [(LabelNavRouteLabeler *)self _createOrUpdateLabelForRoad:v45 isShield:1 navContext:a5 hopOffsetDistance:0.0];
      char v14 = [v45 labelWithType:1];

      if (v14)
      {
        visibleLabelsByName = self->_visibleLabelsByName;
        BOOL v16 = [v14 displayGroup];
        float v17 = [(NSMutableDictionary *)visibleLabelsByName objectForKey:v16];

        [v14 layoutWithNavContext:a5];
        if (![(LabelNavRouteLabeler *)self _collideLabel:v14 activeLabel:v17 labelsToRemove:0])goto LABEL_63; {
        [v14 desiredOffsetDistance];
        }
        float v19 = v18 + 10.0;

        *(float *)&double v20 = v19;
        [(LabelNavRouteLabeler *)self _createOrUpdateLabelForRoad:v45 isShield:1 navContext:a5 hopOffsetDistance:v20];
        uint64_t v21 = [v45 labelWithType:1];

        if (v21)
        {
          uint64_t v22 = self->_visibleLabelsByName;
          uint64_t v23 = [v21 displayGroup];
          float v17 = [(NSMutableDictionary *)v22 objectForKey:v23];

          [v21 layoutWithNavContext:a5];
          if (![(LabelNavRouteLabeler *)self _collideLabel:v21 activeLabel:v17 labelsToRemove:0])
          {
            char v14 = v21;
            goto LABEL_63;
          }
          [v21 desiredOffsetDistance];
          float v25 = v24 + 10.0;

          *(float *)&double v26 = v25;
          [(LabelNavRouteLabeler *)self _createOrUpdateLabelForRoad:v45 isShield:1 navContext:a5 hopOffsetDistance:v26];
          char v14 = [v45 labelWithType:1];

          if (v14)
          {
            char v27 = self->_visibleLabelsByName;
            uint64_t v28 = [v14 displayGroup];
            float v17 = [(NSMutableDictionary *)v27 objectForKey:v28];

            [v14 layoutWithNavContext:a5];
            if ([(LabelNavRouteLabeler *)self _collideLabel:v14 activeLabel:v17 labelsToRemove:0])
            {
LABEL_22:
              [v14 desiredOffsetDistance];
LABEL_64:

              id v13 = v14;
              goto LABEL_65;
            }
LABEL_63:
            [(LabelNavRouteLabeler *)self _tryAddLabel:v14 navContext:a5 labelCollisionEnabled:v6];
            goto LABEL_64;
          }
        }
      }
      goto LABEL_60;
    }
    [(LabelNavRouteLabeler *)self _createOrUpdateLabelForRoad:v45 isShield:0 navContext:a5 hopOffsetDistance:0.0];
    uint64_t v29 = [v45 labelWithType:0];

    if (v29)
    {
      if (([v45 isAwayFromRoute] & 1) != 0
        || !self->_isOnRoute
        && ([v45 isOnRoute] & 1) == 0
        && [v45 roadSignAlignment] != 3)
      {
        [v29 layoutWithNavContext:a5];
        if (!*(unsigned char *)(*(void *)[v29 label] + 327)) {
          goto LABEL_26;
        }
      }
      uint64_t v30 = [(LabelNavRouteLabeler *)self orientationForRoadSign:v45 roadLabel:v29 navContext:a5];
      if (v30 == [v29 alignment] && !self->_regenerateRoadSigns)
      {
        char v14 = v29;
      }
      else
      {
        [v45 recreateRoadSignWithAlignment:v30 navContext:a5 artworkCache:self->_artworkCache];
        char v14 = [v45 labelWithType:0];

        if (!v14) {
          goto LABEL_60;
        }
      }
      uint64_t v31 = self->_visibleLabelsByName;
      char v32 = [v14 displayGroup];
      float v17 = [(NSMutableDictionary *)v31 objectForKey:v32];

      [v14 layoutWithNavContext:a5];
      if (![(LabelNavRouteLabeler *)self _collideLabel:v14 activeLabel:v17 labelsToRemove:0])goto LABEL_63; {
      [v14 desiredOffsetDistance];
      }
      float v34 = v33 + 10.0;

      *(float *)&double v35 = v34;
      [(LabelNavRouteLabeler *)self _createOrUpdateLabelForRoad:v45 isShield:0 navContext:a5 hopOffsetDistance:v35];
      uint64_t v29 = [v45 labelWithType:0];

      if (!v29) {
        goto LABEL_60;
      }
      if (([v45 isAwayFromRoute] & 1) != 0
        || !self->_isOnRoute
        && ([v45 isOnRoute] & 1) == 0
        && [v45 roadSignAlignment] != 3)
      {
        [v29 layoutWithNavContext:a5];
        if (!*(unsigned char *)(*(void *)[v29 label] + 327)) {
          goto LABEL_26;
        }
      }
      uint64_t v36 = [(LabelNavRouteLabeler *)self orientationForRoadSign:v45 roadLabel:v29 navContext:a5];
      if (v36 == [v29 alignment] && !self->_regenerateRoadSigns)
      {
        char v14 = v29;
      }
      else
      {
        [v45 recreateRoadSignWithAlignment:v36 navContext:a5 artworkCache:self->_artworkCache];
        char v14 = [v45 labelWithType:0];

        if (!v14) {
          goto LABEL_60;
        }
      }
      char v37 = self->_visibleLabelsByName;
      char v38 = [v14 displayGroup];
      float v17 = [(NSMutableDictionary *)v37 objectForKey:v38];

      [v14 layoutWithNavContext:a5];
      if (![(LabelNavRouteLabeler *)self _collideLabel:v14 activeLabel:v17 labelsToRemove:0])goto LABEL_63; {
      [v14 desiredOffsetDistance];
      }
      float v40 = v39 + 10.0;

      *(float *)&double v41 = v40;
      [(LabelNavRouteLabeler *)self _createOrUpdateLabelForRoad:v45 isShield:0 navContext:a5 hopOffsetDistance:v41];
      uint64_t v29 = [v45 labelWithType:0];

      if (!v29) {
        goto LABEL_60;
      }
      if (([v45 isAwayFromRoute] & 1) != 0
        || !self->_isOnRoute
        && ([v45 isOnRoute] & 1) == 0
        && [v45 roadSignAlignment] != 3)
      {
        [v29 layoutWithNavContext:a5];
        if (!*(unsigned char *)(*(void *)[v29 label] + 327))
        {
LABEL_26:
          id v13 = v29;
LABEL_65:

          goto LABEL_66;
        }
      }
      uint64_t v42 = [(LabelNavRouteLabeler *)self orientationForRoadSign:v45 roadLabel:v29 navContext:a5];
      if (v42 == [v29 alignment] && !self->_regenerateRoadSigns)
      {
        char v14 = v29;
      }
      else
      {
        [v45 recreateRoadSignWithAlignment:v42 navContext:a5 artworkCache:self->_artworkCache];
        char v14 = [v45 labelWithType:0];

        if (!v14) {
          goto LABEL_60;
        }
      }
      int v43 = self->_visibleLabelsByName;
      id v44 = [v14 displayGroup];
      float v17 = [(NSMutableDictionary *)v43 objectForKey:v44];

      [v14 layoutWithNavContext:a5];
      if ([(LabelNavRouteLabeler *)self _collideLabel:v14 activeLabel:v17 labelsToRemove:0])
      {
        goto LABEL_22;
      }
      goto LABEL_63;
    }
LABEL_60:
    id v13 = 0;
    goto LABEL_65;
  }
  char v12 = [v45 isGuidanceStepStart];

  if (v12) {
    goto LABEL_6;
  }
LABEL_66:
}

- (void)_createOrUpdateLabelForRoad:(id)a3 isShield:(BOOL)a4 navContext:(NavContext *)a5 hopOffsetDistance:(float)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v18 = v10;
  if (v8)
  {
    float v15 = 20.0;
    float v16 = 40.0;
    LODWORD(v12) = 1120403456;
  }
  else
  {
    float v16 = 13.0;
    float v15 = 12.0;
    if ([v10 isOnRoute] && objc_msgSend(v18, "isStartOfRoadName"))
    {
      LODWORD(v11) = 1128792064;
      BOOL v17 = [(VKLabelNavRoadGraph *)self->_roadGraph isPriorRouteCollinearWithRoad:v18 distance:v11];
      if (v17) {
        float v15 = 20.0;
      }
      else {
        float v15 = 12.0;
      }
      if (v17) {
        *(float *)&double v12 = 150.0;
      }
      else {
        *(float *)&double v12 = 100.0;
      }
      if (v17) {
        float v16 = 90.0;
      }
      else {
        float v16 = 13.0;
      }
    }
    else
    {
      LODWORD(v12) = 1120403456;
    }
    id v10 = v18;
  }
  *(float *)&double v11 = fmaxf(fmaxf(self->_minSignOffsetDistance, v16), a6);
  LODWORD(v14) = 13.0;
  *(float *)&double v13 = v15;
  [v10 createLabelWithNavContext:a5 isShieldLabel:v8 desiredOffsetDistance:self->_roadGraph maxOffsetDistance:self->_artworkCache minJunctionDistance:v11 minRouteDistance:v12 roadGraph:v13 artworkCache:v14];
}

- (void)_tryAddRoadSignForJunction:(id)a3 navContext:(NavContext *)a4 labelCollisionEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  BOOL v8 = [(VKPolylineOverlay *)self->_route composedRoute];
  id v9 = [v8 steps];
  id v10 = [v9 objectAtIndexedSubscript:self->_stepIndex];

  objc_msgSend(v12, "createLabelWithNavContext:isDrivingSideRight:artworkCache:", a4, objc_msgSend(v10, "drivingSide") == 0, self->_artworkCache);
  double v11 = [v12 junctionSign];
  if (v11) {
    [(LabelNavRouteLabeler *)self _tryAddLabel:v11 navContext:a4 labelCollisionEnabled:v5];
  }
}

- (void)grabTilesFromScene:(const void *)a3
{
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  {
    operator new();
  }
  uint64_t v44 = mdm::Allocator::instance(void)::alloc;
  id v45 = 0;
  {
    operator new();
  }
  uint64_t v46 = mdm::Allocator::instance(void)::alloc;
  uint64_t v47 = 0;
  float v48 = 1.0;
  uint64_t v5 = *(void *)a3;
  {
    qword_1EB3176C0 = 0;
    qword_1EB3176B8 = 0;
    md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet = (uint64_t)&qword_1EB3176B8;
    __cxa_atexit((void (*)(void *))std::set<gdc::LayerDataWithWorld>::~set[abi:nn180100], &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet, &dword_1A1780000);
  }
  BOOL v6 = *(_WORD **)(v5 + 48);
  int v7 = *(_WORD **)(v5 + 56);
  BOOL v8 = &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet;
  if (v6 != v7)
  {
    id v9 = v6;
    while (*v9 != 13)
    {
      v9 += 16;
      if (v9 == v7) {
        goto LABEL_15;
      }
    }
    if (v9 == v7)
    {
      BOOL v8 = &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet;
    }
    else
    {
      while (*v6 != 13)
      {
        v6 += 16;
        if (v6 == v7)
        {
          BOOL v6 = v7;
          break;
        }
      }
      BOOL v8 = (uint64_t *)(v6 + 4);
    }
  }
LABEL_15:
  id v12 = (uint64_t *)*v8;
  id v10 = v8 + 1;
  double v11 = v12;
  if (v12 != v10)
  {
    do
    {
      uint64_t v18 = v11[4];
      if (v18)
      {
        if (*(unsigned char *)(v18 + 169) == 15)
        {
          float v19 = *(unsigned char **)(v18 + 720);
          if (*v19 == 1) {
            std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__emplace_unique_key_args<std::shared_ptr<md::LabelTile>,std::shared_ptr<md::LabelTile> const&>((unint64_t)&v42, (unint64_t)v19, (void *)(v18 + 720));
          }
        }
      }
      double v20 = (uint64_t *)v11[1];
      if (v20)
      {
        do
        {
          uint64_t v21 = v20;
          double v20 = (uint64_t *)*v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          uint64_t v21 = (uint64_t *)v11[2];
          BOOL v22 = *v21 == (void)v11;
          double v11 = v21;
        }
        while (!v22);
      }
      double v11 = v21;
    }
    while (v21 != v10);
  }
  uint64_t v13 = [(NSMutableArray *)self->_junctions count];
  junctions = self->_junctions;
  float v15 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3321888768;
  uint64_t v36 = __43__LabelNavRouteLabeler_grabTilesFromScene___block_invoke;
  char v37 = &__block_descriptor_88_ea8_32c135_ZTSNSt3__113unordered_setINS_10shared_ptrIN2md9LabelTileEEENS_4hashIS4_EENS_8equal_toIS4_EEN3geo12StdAllocatorIS4_N3mdm9AllocatorEEEEE_e25_B24__0_8__NSDictionary_16l;
  std::unordered_set<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::unordered_set((unint64_t)v38, (uint64_t)&v42);
  float v16 = [v15 predicateWithBlock:&v34];
  -[NSMutableArray filterUsingPredicate:](junctions, "filterUsingPredicate:", v16, v34, v35, v36, v37);

  if ([(NSMutableArray *)self->_junctions count] != v13) {
    [(VKLabelNavRoadGraph *)self->_roadGraph routeJunctionsHaveChanged];
  }
  for (uint64_t i = self->_tiles.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    unint64_t v23 = i[2];
    if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&v42, v23))
    {
      std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__erase_unique<std::shared_ptr<md::LabelTile>>(&self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, v23);
      self->_checkIfRouteSubrangeChanged = 1;
    }
  }
  for (uint64_t j = v45; j; uint64_t j = (void *)*j)
  {
    unint64_t v25 = j[2];
    if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&self->_tiles.__table_.__bucket_list_.__ptr_.__value_, v25))
    {
      self->_disableTileParseForOneLayout = 1;
      std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__emplace_unique_key_args<std::shared_ptr<md::LabelTile>,std::shared_ptr<md::LabelTile> const&>((unint64_t)&self->_pendingTiles, v25, j + 2);
      self->_checkIfRouteSubrangeChanged = 1;
    }
  }
  if (&self->_tiles != (unordered_set<std::shared_ptr<md::LabelTile>, std::hash<std::shared_ptr<md::LabelTile>>, std::equal_to<std::shared_ptr<md::LabelTile>>, geo::StdAllocator<std::shared_ptr<md::LabelTile>, mdm::Allocator>> *)&v42)
  {
    self->_tiles.__table_.__p3_.__value_ = v48;
    std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::shared_ptr<md::LabelTile>,void *> *>>(&self->_tiles.__table_.__bucket_list_.__ptr_.__value_, v45);
  }
  [(VKLabelNavRoadGraph *)self->_roadGraph setTiles:&v42];
  double v26 = v40;
  while (v26)
  {
    char v27 = v26;
    double v26 = (void *)*v26;
    uint64_t v28 = (std::__shared_weak_count *)v27[3];
    if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
    (*(void (**)(uint64_t, void *, uint64_t))(*(void *)v41 + 40))(v41, v27, 32);
  }
  uint64_t v29 = v38[0];
  v38[0] = 0;
  if (v29) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v39 + 40))(v39, v29, 8 * v38[1]);
  }
  uint64_t v30 = v45;
  while (v30)
  {
    uint64_t v31 = v30;
    uint64_t v30 = (void *)*v30;
    char v32 = (std::__shared_weak_count *)v31[3];
    if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
    (*(void (**)(uint64_t, void *, uint64_t))(*(void *)v46 + 40))(v46, v31, 32);
  }
  uint64_t v33 = v42;
  uint64_t v42 = 0;
  if (v33) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v44 + 40))(v44, v33, 8 * v43);
  }
}

BOOL __43__LabelNavRouteLabeler_grabTilesFromScene___block_invoke(uint64_t a1, void *a2)
{
  return std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>((void *)(a1 + 32), *(void *)[a2 tile]) != 0;
}

- (void)_refreshGuidanceRoadNames
{
  [(NSMutableSet *)self->_roadNamesInGuidance removeAllObjects];
  [(NSMutableArray *)self->_guidanceStepInfos removeAllObjects];
  route = self->_route;
  if (route)
  {
    uint64_t v4 = [(VKPolylineOverlay *)route composedRoute];
    uint64_t v5 = [v4 steps];
    unint64_t v6 = [v5 count];

    unint64_t stepIndex = self->_stepIndex;
    if (stepIndex < v6)
    {
      do
      {
        BOOL v8 = [(VKPolylineOverlay *)self->_route composedRoute];
        id v9 = [v8 steps];
        id v10 = [v9 objectAtIndexedSubscript:stepIndex];

        double v11 = [v10 maneuverRoadOrExitName];
        if ([v11 length])
        {
          [(NSMutableSet *)self->_roadNamesInGuidance addObject:v11];
          if (stepIndex < v6 - 1)
          {
            id v12 = -[VKGuidanceStepInfo initWithRoadName:point:]([VKGuidanceStepInfo alloc], "initWithRoadName:point:", v11, [v10 endRouteCoordinate]);
            [(NSMutableArray *)self->_guidanceStepInfos addObject:v12];
          }
        }

        ++stepIndex;
      }
      while (v6 != stepIndex);
    }
  }
}

- (void)_reloadRouteJunctions
{
  self->_pendingTiles.__table_.__p3_.__value_ = self->_tiles.__table_.__p3_.__value_;
  std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::shared_ptr<md::LabelTile>,void *> *>>(&self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, (void *)self->_tiles.__table_.__p1_.__value_.__next_);
  [(NSMutableArray *)self->_junctions removeAllObjects];
  begiuint64_t n = (char *)self->_activeSigns.__begin_;
  for (uint64_t i = (char *)self->_activeSigns.__end_; i != begin; i -= 16)
  {
    uint64_t v5 = (std::__shared_weak_count *)*((void *)i - 1);
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  self->_activeSigns.__end_ = begin;
  unint64_t v6 = (char *)self->_visibleSigns.__begin_;
  for (uint64_t j = (char *)self->_visibleSigns.__end_; j != v6; j -= 16)
  {
    BOOL v8 = (std::__shared_weak_count *)*((void *)j - 1);
    if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  self->_visibleSigns.__end_ = v6;
  [(NSMutableDictionary *)self->_visibleLabelsByName removeAllObjects];
  [(NSMutableArray *)self->_visibleLabels removeAllObjects];
  [(NSMutableSet *)self->_visibleShieldGroups removeAllObjects];
  [(NSMutableArray *)self->_fadingLabels removeAllObjects];
  [(VKLabelNavRoadGraph *)self->_roadGraph reset];
  roadGraph = self->_roadGraph;
  [(VKLabelNavRoadGraph *)roadGraph setTiles:&self->_tiles];
}

- (BOOL)isNavMode
{
  return self->_route && self->_drawRoadSigns;
}

- (void)setRouteUserOffset:(PolylineCoordinate)a3
{
  float offset = a3.offset;
  self->_routeUserOffset = a3;
  BOOL isOnRoute = self->_isOnRoute;
  if (a3.offset < 0.0)
  {
    BOOL v9 = 0;
    unint64_t v8 = 0;
  }
  else
  {
    unsigned int index = a3.index;
    int v7 = [(VKPolylineOverlay *)self->_route composedRoute];
    unint64_t v8 = [v7 stepIndexForPointIndex:index];

    BOOL v9 = 1;
  }
  self->_BOOL isOnRoute = v9;
  if (isOnRoute != offset >= 0.0)
  {
    self->_checkIfRouteSubrangeChanged = 1;
    self->_checkOnRouteLabelsAlignment = v9;
  }
  if (v8 != self->_stepIndex)
  {
    self->_unint64_t stepIndex = v8;
    [(LabelNavRouteLabeler *)self _refreshGuidanceRoadNames];
    [(LabelNavRouteLabeler *)self _updateRoadsInGuidance];
    BOOL v9 = self->_isOnRoute;
  }
  if (v9)
  {
    [(LabelNavRouteLabeler *)self _updateCurrentRoadInfo];
  }
  else
  {
    self->_uint64_t currentRoadNameIndex = -1;
    [(LabelNavRouteLabeler *)self setCurrentRoadName:0];
    [(LabelNavRouteLabeler *)self setCurrentShieldGroup:0];
  }
}

- (void)setMaxVisibleRoadsigns:(unsigned int)a3
{
  if (self->_maxVisibleRoadSigns != a3 && !self->_debugDisableRoadSignLimit)
  {
    unint64_t maxVisibleOnRouteRoadSigns = self->_maxVisibleOnRouteRoadSigns;
    unint64_t v4 = a3 - maxVisibleOnRouteRoadSigns;
    if (a3 < maxVisibleOnRouteRoadSigns) {
      unint64_t v4 = 0;
    }
    self->_maxVisibleOffRouteRoadSigns = v4;
    self->_unint64_t maxVisibleRoadSigns = a3;
    self->_unint64_t debugCachedMaxVisibleOffRouteRoadSigns = v4;
    self->_unint64_t debugCachedMaxVisibleOnRouteRoadSigns = maxVisibleOnRouteRoadSigns;
  }
}

- (float)currentRoadSignPixelHeight
{
  ptr = self->_currentRoadSign.__ptr_;
  if (ptr) {
    return *((float *)ptr + 88);
  }
  else {
    return 0.0;
  }
}

- (void)currentRoadSign
{
  return self->_currentRoadSign.__ptr_;
}

@end