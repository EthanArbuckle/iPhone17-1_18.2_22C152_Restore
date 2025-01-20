@interface VKMapSnapshotCreator
+ (BOOL)supportsSharingThumbnails;
- (BOOL)_daVinciDataAvailable;
- (BOOL)_elevatedGroundIsEnabled;
- (BOOL)_globeIsEnabled;
- (BOOL)_hillshadeIsAvailable;
- (BOOL)canChangeVenueFocus;
- (BOOL)localizeLabels;
- (BOOL)showsBuildings;
- (BOOL)showsContourLabels;
- (BOOL)showsGlobe;
- (BOOL)showsHiking;
- (BOOL)showsHillshade;
- (BOOL)showsLabels;
- (BOOL)showsPhysicalFeatureLabels;
- (BOOL)showsPointLabels;
- (BOOL)showsPointsOfInterest;
- (BOOL)showsRoadLabels;
- (BOOL)showsRoadShields;
- (BOOL)showsTintBands;
- (BOOL)showsTopographicFeatures;
- (BOOL)showsTraffic;
- (BOOL)showsVenues;
- (BOOL)wantsTimerTick;
- (CGSize)size;
- (GEOPOICategoryFilter)pointsOfInterestFilter;
- (VKEdgeInsets)edgeInsets;
- (VKMapSnapshotCreator)initWithSize:(CGSize)a3 scale:(double)a4 homeQueue:(id)a5 signpostId:(unint64_t)a6 mapType:(int)a7 mapDisplayStyles:(id *)a8 mapDisplayStylesCount:(unint64_t)a9 auditToken:(id)a10;
- (VKMapSnapshotCreator)initWithSize:(CGSize)a3 scale:(double)a4 homeQueue:(id)a5 signpostId:(unint64_t)a6 mapType:(int)a7 mapDisplayStyles:(id *)a8 mapDisplayStylesCount:(unint64_t)a9 auditToken:(id)a10 useMultisampling:(BOOL)a11 withError:(id *)a12;
- (VKRouteContext)routeContext;
- (VKRouteOverlay)routeOverlay;
- (id).cxx_construct;
- (id)activeCanvas;
- (id)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:;
- (int)mapType;
- (int64_t)labelScaleFactor;
- (int64_t)terrainMode;
- (uint64_t)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:;
- (unsigned)emphasis;
- (unsigned)mapKitClientMode;
- (unsigned)mapKitUsage;
- (void)_labelSettings;
- (void)_transferSettingsFrom:(id)a3 to:(id)a4;
- (void)addCustomFeatureDataSource:(id)a3;
- (void)addOverlay:(id)a3;
- (void)cancel;
- (void)cancelFlushingTileDecodes:;
- (void)cancelFlushingTileDecodes:(BOOL)a3;
- (void)clearResources;
- (void)dealloc;
- (void)didPresent;
- (void)didReceiveMemoryWarning;
- (void)didUpdateSceneStatus:(unsigned __int8)a3;
- (void)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:;
- (void)removeCustomFeatureDataSource:(id)a3;
- (void)renderNextSnapshot;
- (void)renderSnapshot:(id)a3;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6;
- (void)setClearFontCache:(BOOL)a3;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)setEmphasis:(unsigned __int8)a3;
- (void)setLabelExclusionRegions:(id)a3;
- (void)setLabelScaleFactor:(int64_t)a3;
- (void)setLocalizeLabels:(BOOL)a3;
- (void)setMapKitClientMode:(unsigned __int8)a3;
- (void)setMapKitUsage:(unsigned __int8)a3;
- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5;
- (void)setMapType:(int)a3;
- (void)setPointsOfInterestFilter:(id)a3;
- (void)setRouteContext:(id)a3;
- (void)setRouteOverlay:(id)a3;
- (void)setSelectedTrailId:(unint64_t)a3;
- (void)setSelectedTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5;
- (void)setShowsBuildings:(BOOL)a3;
- (void)setShowsContourLabels:(BOOL)a3;
- (void)setShowsGlobe:(BOOL)a3;
- (void)setShowsHiking:(BOOL)a3;
- (void)setShowsHiking:(BOOL)a3 withTopographicFeatures:(BOOL)a4;
- (void)setShowsHillshade:(BOOL)a3;
- (void)setShowsLabels:(BOOL)a3;
- (void)setShowsPhysicalFeatureLabels:(BOOL)a3;
- (void)setShowsPointLabels:(BOOL)a3;
- (void)setShowsPointsOfInterest:(BOOL)a3;
- (void)setShowsRoadLabels:(BOOL)a3;
- (void)setShowsRoadShields:(BOOL)a3;
- (void)setShowsTintBands:(BOOL)a3;
- (void)setShowsTraffic:(BOOL)a3;
- (void)setShowsVenues:(BOOL)a3;
- (void)setTerrainMode:(int64_t)a3;
- (void)softDealloc;
- (void)tileGroupDidChange;
- (void)tileGroupWillChange;
- (void)timeout;
- (void)willBecomeFullyDrawn;
- (void)willLayoutWithTimestamp:(double)a3 withContext:(void *)a4;
@end

@implementation VKMapSnapshotCreator

- (id).cxx_construct
{
  self->_mapEngine.__ptr_.__value_ = 0;
  self->_taskContext.__ptr_ = 0;
  self->_taskContext.__cntrl_ = 0;
  *(_OWORD *)&self->_images.__begin_ = 0u;
  *(_OWORD *)&self->_images.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_ioSurfaces.__end_ = 0u;
  self->_timer._startTime.__d_.__rep_ = 0;
  self->_timer._startTime.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  self->_expirationTimer.__ptr_.__value_ = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeContext, 0);
  objc_storeStrong((id *)&self->_routeOverlay, 0);
  objc_storeStrong((id *)&self->_manifestTileGroupObserverProxy, 0);
  value = self->_expirationTimer.__ptr_.__value_;
  self->_expirationTimer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Timer *))(*(void *)value + 8))(value);
  }
  begin = self->_ioSurfaces.__begin_;
  if (begin)
  {
    self->_ioSurfaces.__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_images.__begin_;
  if (v5)
  {
    self->_images.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  cntrl = self->_taskContext.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  v7 = self->_mapEngine.__ptr_.__value_;
  self->_mapEngine.__ptr_.__value_ = 0;
  if (v7) {
    md::MapEngineDeleter::operator()((uint64_t)v7);
  }
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_pointsOfInterestFilter, 0);
  objc_storeStrong((id *)&self->_globeCanvas, 0);
  objc_storeStrong((id *)&self->_mapCanvas, 0);
}

- (unsigned)mapKitClientMode
{
  return self->_mapKitClientMode;
}

- (unsigned)mapKitUsage
{
  return self->_mapKitUsage;
}

- (VKRouteContext)routeContext
{
  return self->_routeContext;
}

- (VKRouteOverlay)routeOverlay
{
  return self->_routeOverlay;
}

- (VKEdgeInsets)edgeInsets
{
  float top = self->_edgeInsets.top;
  float left = self->_edgeInsets.left;
  float bottom = self->_edgeInsets.bottom;
  float right = self->_edgeInsets.right;
  result.float right = right;
  result.float bottom = bottom;
  result.float left = left;
  result.float top = top;
  return result;
}

- (GEOPOICategoryFilter)pointsOfInterestFilter
{
  return self->_pointsOfInterestFilter;
}

- (BOOL)_hillshadeIsAvailable
{
  int v2 = *((unsigned __int8 *)self->_mapEngine.__ptr_.__value_ + 4584);
  BOOL result = MapsFeature_IsEnabled_HikingiOS();
  if (!v2) {
    return 0;
  }
  return result;
}

- (BOOL)_elevatedGroundIsEnabled
{
  if (!MapsFeature_IsEnabled_ShelbyvilleTerrain()) {
    return 0;
  }
  if (GEOConfigGetBOOL()) {
    return 1;
  }
  v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v2 = [v3 supportsAdvancedMap];

  return v2;
}

- (BOOL)_globeIsEnabled
{
  if (!MapsFeature_IsEnabled_ShelbyvilleGlobe()) {
    return 0;
  }
  if (GEOConfigGetBOOL()) {
    return 1;
  }
  v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  char v2 = [v3 supportsAdvancedMap];

  return v2;
}

- (BOOL)_daVinciDataAvailable
{
  uint64_t v2 = *(void *)(*(void *)(*((void *)self->_mapEngine.__ptr_.__value_ + 112) + 24) + 56);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v3 != v4)
  {
    while (*(_WORD *)v3 != 29)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  if (v3 == v4) {
    return 0;
  }
  (*(void (**)(uint64_t *__return_ptr))(**(void **)(v3 + 8) + 64))(&v6);
  return (_BYTE)v6 != 0;
}

- (void)setRouteContext:(id)a3
{
  v7 = (VKRouteContext *)a3;
  if (self->_routeContext != v7)
  {
    v43 = v7;
    objc_storeStrong((id *)&self->_routeContext, a3);
    v8 = (int8x8_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 140);
    if (!v8) {
      goto LABEL_79;
    }
    int8x8_t v9 = v8[2];
    if (v9)
    {
      uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
      v10.i16[0] = vaddlv_u8(v10);
      if (v10.u32[0] > 1uLL)
      {
        uint64_t v11 = 0x1BCA10CB9934FB1BLL;
        if (*(void *)&v9 <= 0x1BCA10CB9934FB1BuLL) {
          uint64_t v11 = 0x1BCA10CB9934FB1BuLL % *(void *)&v9;
        }
      }
      else
      {
        uint64_t v11 = (*(void *)&v9 - 1) & 0x1BCA10CB9934FB1BLL;
      }
      v12 = *(void **)(*(void *)&v8[1] + 8 * v11);
      if (v12)
      {
        v13 = (void *)*v12;
        if (v13)
        {
          if (v10.u32[0] < 2uLL)
          {
            uint64_t v14 = *(void *)&v9 - 1;
            while (1)
            {
              uint64_t v16 = v13[1];
              if (v16 == 0x1BCA10CB9934FB1BLL)
              {
                if (v13[2] == 0x1BCA10CB9934FB1BLL) {
                  goto LABEL_66;
                }
              }
              else if ((v16 & v14) != v11)
              {
                goto LABEL_23;
              }
              v13 = (void *)*v13;
              if (!v13) {
                goto LABEL_23;
              }
            }
          }
          do
          {
            unint64_t v15 = v13[1];
            if (v15 == 0x1BCA10CB9934FB1BLL)
            {
              if (v13[2] == 0x1BCA10CB9934FB1BLL)
              {
LABEL_66:
                v17 = (md::TransitLogic *)v13[5];
                goto LABEL_24;
              }
            }
            else
            {
              if (v15 >= *(void *)&v9) {
                v15 %= *(void *)&v9;
              }
              if (v15 != v11) {
                break;
              }
            }
            v13 = (void *)*v13;
          }
          while (v13);
        }
      }
    }
LABEL_23:
    v17 = 0;
LABEL_24:
    md::TransitLogic::setRouteContext(v17, v43);
    int8x8_t v18 = v8[2];
    if (v18)
    {
      uint8x8_t v19 = (uint8x8_t)vcnt_s8(v18);
      v19.i16[0] = vaddlv_u8(v19);
      if (v19.u32[0] > 1uLL)
      {
        unint64_t v20 = 0xBEC1A12372CEEC00;
        if (*(void *)&v18 <= 0xBEC1A12372CEEC00) {
          unint64_t v20 = 0xBEC1A12372CEEC00 % *(void *)&v18;
        }
      }
      else
      {
        unint64_t v20 = (*(void *)&v18 - 1) & 0xBEC1A12372CEEC00;
      }
      v21 = *(void **)(*(void *)&v8[1] + 8 * v20);
      if (v21)
      {
        v22 = (void *)*v21;
        if (v22)
        {
          if (v19.u32[0] < 2uLL)
          {
            uint64_t v23 = *(void *)&v18 - 1;
            while (1)
            {
              uint64_t v25 = v22[1];
              if (v25 == 0xBEC1A12372CEEC00)
              {
                if (v22[2] == 0xBEC1A12372CEEC00) {
                  goto LABEL_67;
                }
              }
              else if ((v25 & v23) != v20)
              {
                goto LABEL_44;
              }
              v22 = (void *)*v22;
              if (!v22) {
                goto LABEL_44;
              }
            }
          }
          do
          {
            unint64_t v24 = v22[1];
            if (v24 == 0xBEC1A12372CEEC00)
            {
              if (v22[2] == 0xBEC1A12372CEEC00)
              {
LABEL_67:
                v26 = (md::NavigationLogic *)v22[5];
                goto LABEL_45;
              }
            }
            else
            {
              if (v24 >= *(void *)&v18) {
                v24 %= *(void *)&v18;
              }
              if (v24 != v20) {
                break;
              }
            }
            v22 = (void *)*v22;
          }
          while (v22);
        }
      }
    }
LABEL_44:
    v26 = 0;
LABEL_45:
    md::NavigationLogic::setRouteContext(v26, v43);
    int8x8_t v27 = v8[2];
    if (v27)
    {
      uint8x8_t v28 = (uint8x8_t)vcnt_s8(v27);
      v28.i16[0] = vaddlv_u8(v28);
      if (v28.u32[0] > 1uLL)
      {
        uint64_t v29 = 0x2FED70A4459DFCA1;
        if (*(void *)&v27 <= 0x2FED70A4459DFCA1uLL) {
          uint64_t v29 = 0x2FED70A4459DFCA1uLL % *(void *)&v27;
        }
      }
      else
      {
        uint64_t v29 = (*(void *)&v27 - 1) & 0x2FED70A4459DFCA1;
      }
      v30 = *(void **)(*(void *)&v8[1] + 8 * v29);
      if (v30)
      {
        v31 = (void *)*v30;
        if (v31)
        {
          if (v28.u32[0] < 2uLL)
          {
            uint64_t v32 = *(void *)&v27 - 1;
            while (1)
            {
              uint64_t v34 = v31[1];
              if (v34 == 0x2FED70A4459DFCA1)
              {
                if (v31[2] == 0x2FED70A4459DFCA1) {
                  goto LABEL_68;
                }
              }
              else if ((v34 & v32) != v29)
              {
                goto LABEL_79;
              }
              v31 = (void *)*v31;
              if (!v31) {
                goto LABEL_79;
              }
            }
          }
          do
          {
            unint64_t v33 = v31[1];
            if (v33 == 0x2FED70A4459DFCA1)
            {
              if (v31[2] == 0x2FED70A4459DFCA1)
              {
LABEL_68:
                uint64_t v35 = v31[5];
                if (v35)
                {
                  if (v43)
                  {
                    v36 = [(VKRouteContext *)v43 routeInfo];
                    v37 = [v36 route];
                    unsigned int v38 = [v37 transportType];

                    if (v38 >= 7) {
                      unsigned __int8 v3 = 4;
                    }
                    else {
                      unsigned __int8 v3 = 0x50403020100uLL >> (8 * v38);
                    }
                    v39 = [(VKRouteContext *)v43 routeInfo];
                    v40 = [v39 route];
                    unint64_t v41 = [v40 source];

                    if (v41 >= 6) {
                      unsigned __int8 v4 = 0;
                    }
                    else {
                      unsigned __int8 v4 = 0x40003020100uLL >> (8 * v41);
                    }
                    char v42 = 1;
                  }
                  else
                  {
                    char v42 = 0;
                  }
                  md::StyleLogic::setRouteTransportType(v35, v42, v3);
                  md::StyleLogic::setRouteSource(v35, v42, v4);
                }
                break;
              }
            }
            else
            {
              if (v33 >= *(void *)&v27) {
                v33 %= *(void *)&v27;
              }
              if (v33 != v29) {
                break;
              }
            }
            v31 = (void *)*v31;
          }
          while (v31);
        }
      }
    }
LABEL_79:
    md::LabelSettings_Navigation::setRouteContext((md::LabelSettings_Navigation *)([(VKMapSnapshotCreator *)self _labelSettings] + 8), v43);
    v7 = v43;
  }
}

- (void)setRouteOverlay:(id)a3
{
  v5 = (VKRouteOverlay *)a3;
  if (self->_routeOverlay != v5)
  {
    objc_storeStrong((id *)&self->_routeOverlay, a3);
    value = self->_mapEngine.__ptr_.__value_;
    md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)value + 567), "-[VKMapSnapshotCreator setRouteOverlay:]");
    uint64_t v7 = *(void *)(*((void *)value + 112) + 16);
    std::mutex::lock((std::mutex *)(v7 + 96));
    v14[0] = 0;
    v14[1] = 0;
    v13 = v14;
    std::set<objc_object  {objcproto14VKRouteOverlay}*>::insert[abi:nn180100]<std::__tree_const_iterator<objc_object  {objcproto14VKRouteOverlay}*,std::__tree_node<objc_object  {objcproto14VKRouteOverlay}*,void *> *,long>>(&v13, *(void **)(v7 + 48), (void *)(v7 + 56));
    std::mutex::unlock((std::mutex *)(v7 + 96));
    v8 = v13;
    if (v13 != v14)
    {
      do
      {
        int8x8_t v9 = v8[4];
        if (v9 != v5) {
          md::RouteOverlayContainer::removeOverlay(*(void *)(*((void *)value + 112) + 16), v5, 1);
        }

        uint8x8_t v10 = v8[1];
        if (v10)
        {
          do
          {
            uint64_t v11 = (void **)v10;
            uint8x8_t v10 = (void *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            uint64_t v11 = (void **)v8[2];
            BOOL v12 = *v11 == v8;
            v8 = v11;
          }
          while (!v12);
        }
        v8 = v11;
      }
      while (v11 != v14);
    }
    if (v5) {
      md::RouteOverlayContainer::addOverlay(*(void *)(*((void *)value + 112) + 16), v5, 1);
    }
    std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v14[0]);
  }
}

- (BOOL)canChangeVenueFocus
{
  return 1;
}

- (BOOL)wantsTimerTick
{
  return !self->_didBecomeFullyDrawn;
}

- (void)didPresent
{
  id v2 = [(VKMapSnapshotCreator *)self activeCanvas];
  [v2 didLayout];
}

- (void)willLayoutWithTimestamp:(double)a3 withContext:(void *)a4
{
  id v6 = [(VKMapSnapshotCreator *)self activeCanvas];
  [v6 updateWithTimestamp:a4 withContext:a3];
}

- (void)didReceiveMemoryWarning
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  unsigned __int8 v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    uint8x8_t v10 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator didReceiveMemoryWarning: %p", (uint8_t *)&v9, 0xCu);
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
    }
  }
  unsigned __int8 v4 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DidReceiveMemoryWarning", "", (uint8_t *)&v9, 2u);
  }
  value = self->_mapEngine.__ptr_.__value_;
  md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)value + 567), "-[VKMapSnapshotCreator didReceiveMemoryWarning]");
  globeCanvas = self->_globeCanvas;
  if (globeCanvas) {
    [(VKImageCanvas *)globeCanvas didReceiveMemoryWarning:0];
  }
  mapCanvas = self->_mapCanvas;
  if (mapCanvas) {
    [(VKImageCanvas *)mapCanvas didReceiveMemoryWarning:0];
  }
  md::MapEngine::prune((uint64_t)value, 2u);
  v8 = +[VKSharedResourcesManager sharedResources];
  [v8 prune:1];
}

- (void)didUpdateSceneStatus:(unsigned __int8)a3
{
  if ((a3 - 2) <= 2)
  {
    self->_didBecomeFullyDrawn = 1;
    self->_hasFailedTiles = (a3 - 3) < 2;
  }
}

- (void)willBecomeFullyDrawn
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  unsigned __int8 v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p willBecomeFullyDrawn", buf, 0xCu);
  }
  unsigned __int8 v4 = *(NSObject **)self->_taskContext.__ptr_;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VKMapSnapshotCreator_willBecomeFullyDrawn__block_invoke;
  block[3] = &unk_1E5A960A0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __44__VKMapSnapshotCreator_willBecomeFullyDrawn__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = *(id *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  if (v2[9])
  {
    unsigned __int8 v3 = objc_msgSend(v2, "activeCanvas", &unk_1EF559958, v6);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 72);
    uint64_t v8 = 0;
    [v3 renderSceneWithEngine:v4 completion:v7];
    if (v8 == v7)
    {
      (*(void (**)(void *))(v7[0] + 32))(v7);
    }
    else if (v8)
    {
      (*(void (**)(void))(*v8 + 40))();
    }

    v5 = *(void **)(a1 + 32);
    if (v5[8]) {
      [v5 renderNextSnapshot];
    }
  }
}

- (void)renderNextSnapshot
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = (void *)*((void *)self->_mapEngine.__ptr_.__value_ + 105);
  if (!v3)
  {
    uint64_t v4 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    goto LABEL_9;
  }
  [v3 bitmapData];
  if (*(void *)buf)
  {
    uint64_t v4 = (*(uint64_t (**)(void))(**(void **)buf + 24))(*(void *)buf);
    v5 = *(std::__shared_weak_count **)&buf[8];
    if (!*(void *)&buf[8]) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    v5 = *(std::__shared_weak_count **)&buf[8];
    if (!*(void *)&buf[8]) {
      goto LABEL_9;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_9:
  end = self->_images.__end_;
  value = self->_images.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_images.__begin_;
    uint64_t v10 = end - begin;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 61) {
      abort();
    }
    uint64_t v12 = (char *)value - (char *)begin;
    if (v12 >> 2 > v11) {
      unint64_t v11 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      if (v13 >> 61) {
        goto LABEL_95;
      }
      uint64_t v14 = operator new(8 * v13);
    }
    else
    {
      uint64_t v14 = 0;
    }
    unint64_t v15 = (CGImage **)&v14[8 * v10];
    uint64_t v16 = (CGImage **)&v14[8 * v13];
    *unint64_t v15 = (CGImage *)v4;
    uint64_t v8 = v15 + 1;
    if (end == begin)
    {
      begin = end;
    }
    else
    {
      unint64_t v17 = (char *)end - (char *)begin - 8;
      if (v17 < 0x58) {
        goto LABEL_99;
      }
      if ((unint64_t)((char *)begin - v14) < 0x20) {
        goto LABEL_99;
      }
      uint64_t v18 = (v17 >> 3) + 1;
      uint8x8_t v19 = &v14[8 * v10 - 16];
      unint64_t v20 = end - 2;
      uint64_t v21 = v18 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v22 = *(_OWORD *)v20;
        *(v19 - 1) = *((_OWORD *)v20 - 1);
        *uint8x8_t v19 = v22;
        v19 -= 2;
        v20 -= 4;
        v21 -= 4;
      }
      while (v21);
      v15 -= v18 & 0x3FFFFFFFFFFFFFFCLL;
      end -= v18 & 0x3FFFFFFFFFFFFFFCLL;
      if (v18 != (v18 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_99:
        do
        {
          uint64_t v23 = *--end;
          *--unint64_t v15 = v23;
        }
        while (end != begin);
        begin = self->_images.__begin_;
      }
    }
    self->_images.__begin_ = v15;
    self->_images.__end_ = v8;
    self->_images.__end_cap_.__value_ = v16;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    *end = (CGImage *)v4;
    uint64_t v8 = end + 1;
  }
  self->_images.__end_ = v8;
  if (!self->_displayStyles || self->_nextDisplayStyleIndex >= self->_displayStylesCount)
  {
    unint64_t v33 = *(NSObject **)self->_taskContext.__ptr_;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__VKMapSnapshotCreator_renderNextSnapshot__block_invoke;
    block[3] = &unk_1E5A960A0;
    block[4] = self;
    dispatch_async(v33, block);
    return;
  }
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  unint64_t v24 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    unint64_t displayStylesCount = self->_displayStylesCount;
    unint64_t nextDisplayStyleIndex = self->_nextDisplayStyleIndex;
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = nextDisplayStyleIndex;
    __int16 v75 = 2048;
    unint64_t v76 = displayStylesCount;
    _os_log_impl(&dword_1A1780000, v24, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p rendering next display style (%llu / %llu)", buf, 0x20u);
  }
  id v27 = *((id *)self->_mapEngine.__ptr_.__value_ + 105);
  uint64_t v28 = [v27 flipImage];
  uint64_t v29 = (__IOSurface *)v28;
  v31 = self->_ioSurfaces.__end_;
  v30 = self->_ioSurfaces.__end_cap_.__value_;
  if (v31 >= v30)
  {
    uint64_t v34 = self->_ioSurfaces.__begin_;
    uint64_t v35 = v31 - v34;
    unint64_t v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 61) {
      abort();
    }
    uint64_t v37 = (char *)v30 - (char *)v34;
    if (v37 >> 2 > v36) {
      unint64_t v36 = v37 >> 2;
    }
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v38 = v36;
    }
    if (!v38)
    {
      v39 = 0;
      goto LABEL_51;
    }
    if (!(v38 >> 61))
    {
      v39 = operator new(8 * v38);
LABEL_51:
      v40 = (__IOSurface **)&v39[8 * v35];
      unint64_t v41 = (__IOSurface **)&v39[8 * v38];
      void *v40 = v29;
      uint64_t v32 = v40 + 1;
      if (v31 == v34)
      {
        uint64_t v34 = v31;
      }
      else
      {
        unint64_t v42 = (char *)v31 - (char *)v34 - 8;
        if (v42 < 0x58) {
          goto LABEL_100;
        }
        if ((unint64_t)((char *)v34 - v39) < 0x20) {
          goto LABEL_100;
        }
        uint64_t v43 = (v42 >> 3) + 1;
        v44 = &v39[8 * v35 - 16];
        v45 = v31 - 2;
        uint64_t v46 = v43 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v47 = *(_OWORD *)v45;
          *(v44 - 1) = *((_OWORD *)v45 - 1);
          _OWORD *v44 = v47;
          v44 -= 2;
          v45 -= 4;
          v46 -= 4;
        }
        while (v46);
        v40 -= v43 & 0x3FFFFFFFFFFFFFFCLL;
        v31 -= v43 & 0x3FFFFFFFFFFFFFFCLL;
        if (v43 != (v43 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_100:
          do
          {
            v48 = *--v31;
            *--v40 = v48;
          }
          while (v31 != v34);
          uint64_t v34 = self->_ioSurfaces.__begin_;
        }
      }
      self->_ioSurfaces.__begin_ = v40;
      self->_ioSurfaces.__end_ = v32;
      self->_ioSurfaces.__end_cap_.__value_ = v41;
      if (v34) {
        operator delete(v34);
      }
      goto LABEL_62;
    }
LABEL_95:
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  void *v31 = (__IOSurface *)v28;
  uint64_t v32 = v31 + 1;
LABEL_62:
  self->_ioSurfaces.__end_ = v32;

  v49 = &self->_displayStyles[self->_nextDisplayStyleIndex];
  uint64_t var0 = v49->var0;
  uint64_t var1 = v49->var1;
  int var2 = v49->var2;
  uint64_t var3 = v49->var3;
  uint64_t var4 = v49->var4;
  uint64_t var5 = v49->var5;
  unsigned int v56 = var2 - 1;
  if (v56 > 8) {
    uint64_t v57 = 0;
  }
  else {
    uint64_t v57 = qword_1A29C3060[v56];
  }
  uint64_t v58 = v57 + 0x1000000000000 + (var0 | (var1 << 8) | (var3 << 24) | (var4 << 32) | (var5 << 40));
  v59 = (int8x8_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 140);
  int8x8_t v60 = v59[2];
  if (!*(void *)&v60) {
    goto LABEL_85;
  }
  uint8x8_t v61 = (uint8x8_t)vcnt_s8(v60);
  v61.i16[0] = vaddlv_u8(v61);
  if (v61.u32[0] > 1uLL)
  {
    uint64_t v62 = 0x2FED70A4459DFCA1;
    if (*(void *)&v60 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v62 = 0x2FED70A4459DFCA1uLL % *(void *)&v60;
    }
  }
  else
  {
    uint64_t v62 = (*(void *)&v60 - 1) & 0x2FED70A4459DFCA1;
  }
  v63 = *(void **)(*(void *)&v59[1] + 8 * v62);
  if (!v63 || (v64 = (void *)*v63) == 0)
  {
LABEL_85:
    uint64_t v68 = 0;
    goto LABEL_86;
  }
  if (v61.u32[0] < 2uLL)
  {
    uint64_t v65 = *(void *)&v60 - 1;
    while (1)
    {
      uint64_t v67 = v64[1];
      if (v67 == 0x2FED70A4459DFCA1)
      {
        if (v64[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_93;
        }
      }
      else if ((v67 & v65) != v62)
      {
        goto LABEL_85;
      }
      v64 = (void *)*v64;
      if (!v64) {
        goto LABEL_85;
      }
    }
  }
  while (1)
  {
    unint64_t v66 = v64[1];
    if (v66 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v66 >= *(void *)&v60) {
      v66 %= *(void *)&v60;
    }
    if (v66 != v62) {
      goto LABEL_85;
    }
LABEL_75:
    v64 = (void *)*v64;
    if (!v64) {
      goto LABEL_85;
    }
  }
  if (v64[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_75;
  }
LABEL_93:
  uint64_t v68 = v64[5];
LABEL_86:
  md::StyleLogic::setDisplayStyle(v68, v58);
  v69 = [(VKMapSnapshotCreator *)self activeCanvas];
  v70 = self->_mapEngine.__ptr_.__value_;
  v73 = 0;
  [v69 renderSceneWithEngine:v70 completion:v72];
  if (v73 == v72)
  {
    (*(void (**)(void *))(v72[0] + 32))(v72);
  }
  else if (v73)
  {
    (*(void (**)(void))(*v73 + 40))();
  }

  ++self->_nextDisplayStyleIndex;
  if (self->_completion) {
    [(VKMapSnapshotCreator *)self renderNextSnapshot];
  }
}

void __42__VKMapSnapshotCreator_renderNextSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    v96 = (void (**)(void, void, void))MEMORY[0x1A6239EB0]();
    uint64_t v2 = *(void *)(a1 + 32);
    unsigned __int8 v3 = *(void **)(v2 + 64);
    *(void *)(v2 + 64) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(v4 + 56);
    int v6 = *(unsigned __int8 *)(v4 + 57);
    if (v5)
    {
      if (!v6)
      {
        if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
          dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
        }
        uint64_t v7 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
        if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          LODWORD(buf[0]) = 134217984;
          *(void *)((char *)buf + 4) = v8;
          _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p finished rendering snapshot!", (uint8_t *)buf, 0xCu);
        }
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v12 = v10[19];
        uint64_t v11 = v10[20];
        if (v12 != v11)
        {
          do
          {
            unint64_t v13 = [MEMORY[0x1E4F29238] valueWithBytes:v12 objCType:"^{CGImage=}"];
            [v9 addObject:v13];

            v12 += 8;
          }
          while (v12 != v11);
          uint64_t v10 = *(void **)(a1 + 32);
        }
        uint64_t v14 = [v10 activeCanvas];
        unint64_t v15 = [v14 vkCamera];
        [v15 pitch];
        if (v16 > 0.0 && [*(id *)(a1 + 32) _elevatedGroundIsEnabled])
        {
          BOOL v17 = [*(id *)(a1 + 32) terrainMode] == 1;

          float v18 = 0.0;
          if (v17)
          {
            id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint8x8_t v19 = *(void **)(a1 + 32);
            uint64_t v20 = gdc::Context::get<md::SceneContext>(*(void **)(v19[9] + 920));
            if ([v19 showsGlobe])
            {
              int v21 = 1;
            }
            else if ([*(id *)(a1 + 32) _elevatedGroundIsEnabled])
            {
              int v21 = 4;
            }
            else
            {
              int v21 = 0;
            }
            v59 = *(unsigned __int16 **)(*(void *)v20 + 112);
            int8x8_t v60 = *(unsigned __int16 **)(*(void *)v20 + 120);
            if (v59 != v60)
            {
              while (*v59 != v21)
              {
                v59 += 56;
                if (v59 == v60)
                {
                  v59 = *(unsigned __int16 **)(*(void *)v20 + 120);
                  break;
                }
              }
            }
            uint64_t v61 = *((void *)v59 + 13);
            uint64_t v62 = *(void *)(v61 + 24);
            uint64_t v63 = *(void *)(v61 + 32);
            if (v62 != v63)
            {
              while (*(_WORD *)v62 != 43)
              {
                v62 += 32;
                if (v62 == v63) {
                  goto LABEL_65;
                }
              }
            }
            if (v62 == v63)
            {
LABEL_65:
              uint64_t v64 = 0;
              uint64_t v65 = 0;
            }
            else
            {
              uint64_t v64 = *(void *)(v62 + 8);
              uint64_t v65 = *(void *)(v62 + 16);
            }
            unint64_t v66 = [*(id *)(a1 + 32) activeCanvas];
            [v66 camera];
            long long v93 = *(_OWORD *)(*(void *)&buf[0] + 16);
            long double v67 = tan(*(double *)(*(void *)&buf[0] + 8) * 0.5 + 0.785398163);
            long double v92 = log(v67);
            std::shared_ptr<md::MapTileData>::~shared_ptr[abi:nn180100]((uint64_t)buf);

            if (v64 != v65)
            {
              *(void *)&v72.f64[0] = v93;
              v72.f64[1] = v92;
              __asm { FMOV            V1.2D, #0.5 }
              float64x2_t v94 = vmlaq_f64(_Q1, (float64x2_t)vdupq_n_s64(0x3FC45F306DC9C883uLL), v72);
              float v18 = 0.0;
              do
              {
                uint64_t v77 = *(void *)(v64 + 112);
                *(void *)&buf[0] = v77;
                v78 = *(std::__shared_weak_count **)(v64 + 120);
                *((void *)&buf[0] + 1) = v78;
                if (v78) {
                  atomic_fetch_add_explicit(&v78->__shared_owners_, 1uLL, memory_order_relaxed);
                }
                if (v77)
                {
                  uint64_t v79 = *(void *)(v77 + 720);
                  v80 = *(std::__shared_weak_count **)(v77 + 728);
                  *(void *)&stats.blocks_in_use = v79;
                  stats.size_in_use = (size_t)v80;
                  if (v80) {
                    atomic_fetch_add_explicit(&v80->__shared_owners_, 1uLL, memory_order_relaxed);
                  }
                  if (v79)
                  {
                    int v81 = 1 << *(unsigned char *)(v79 + 57);
                    v82.i64[0] = *(int *)(v79 + 64);
                    v82.i64[1] = v81 + ~*(_DWORD *)(v79 + 60);
                    float64x2_t v83 = vmlsq_lane_f64(v94, vcvtq_f64_s64(v82), 1.0 / (double)v81, 0);
                    float64x2_t v84 = vmulq_n_f64(v83, (double)v81);
                    float32x4_t v85 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v84), v84);
                    LODWORD(v84.f64[0]) = vmovn_s32(vcgeq_f32((float32x4_t)xmmword_1A28FD160, v85)).u32[0];
                    HIDWORD(v84.f64[0]) = vmovn_s32(vcgeq_f32(v85, (float32x4_t)xmmword_1A28FD160)).i32[1];
                    if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(*(int16x4_t *)&v84.f64[0], 0xFuLL))))
                    {
                      unint64_t v86 = md::ElevationRaster::elevationInMetersAtWorldPoint(v79, 1u, v94.f64[0], v94.f64[1], 0.00781250185, v83.f64[0], v68, v69, v70, v71);
                      if (HIDWORD(v86)) {
                        float v18 = *(float *)&v86;
                      }
                      else {
                        float v18 = 0.0;
                      }
                    }
                  }
                  v87 = [VKSnapshotElevationRaster alloc];
                  v101[0] = *(_WORD *)(v79 + 56);
                  uint64_t v102 = *(void *)(v79 + 60);
                  HIDWORD(v88) = HIDWORD(v102);
                  LODWORD(v88) = *(_DWORD *)(v79 + 48);
                  LODWORD(v89) = *(_DWORD *)(v77 + 736);
                  v90 = [(VKSnapshotElevationRaster *)v87 initWithQuadTile:v101 width:*(unsigned int *)(v79 + 32) height:*(unsigned int *)(v79 + 40) scale:*(__int16 *)(v79 + 52) tileSizeInMeters:v88 minElevationInMeters:v89];
                  v91 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)v79 length:2 * *(void *)(v79 + 32) * *(void *)(v79 + 40)];
                  [(VKSnapshotElevationRaster *)v90 setRasterData:v91];

                  [v95 addObject:v90];
                  if (v80 && !atomic_fetch_add(&v80->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
                    std::__shared_weak_count::__release_weak(v80);
                  }
                  v78 = (std::__shared_weak_count *)*((void *)&buf[0] + 1);
                }
                if (v78 && !atomic_fetch_add(&v78->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
                  std::__shared_weak_count::__release_weak(v78);
                }
                v64 += 144;
              }
              while (v64 != v65);
            }
          }
          else
          {
            id v95 = 0;
          }
        }
        else
        {

          id v95 = 0;
          float v18 = 0.0;
        }
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 72);
        v26 = *(void **)(v25 + 920);
        unint64_t v27 = v26[1];
        if ((v27 & (v27 - 1)) != 0)
        {
          unint64_t v30 = 0x8BD499FBD96FBB9ELL;
          if (v27 <= 0x8BD499FBD96FBB9ELL) {
            unint64_t v30 = 0x8BD499FBD96FBB9ELL % v27;
          }
          uint64_t v28 = *(void **)(*v26 + 8 * v30);
          do
          {
            do
              uint64_t v28 = (void *)*v28;
            while (v28[1] != 0x8BD499FBD96FBB9ELL);
          }
          while (v28[2] != 0x8BD499FBD96FBB9ELL);
        }
        else
        {
          uint64_t v28 = *(void **)(*v26 + 8 * ((v27 - 1) & 0x8BD499FBD96FBB9ELL));
          do
          {
            do
              uint64_t v28 = (void *)*v28;
            while (v28[1] != 0x8BD499FBD96FBB9ELL);
          }
          while (v28[2] != 0x8BD499FBD96FBB9ELL);
        }
        uint64_t v31 = *(void *)(v28[5] + 32);
        float v32 = *(float *)(v31 + 16);
        float v33 = *(float *)(v31 + 20);
        unsigned int v34 = *(_DWORD *)[*(id *)(v25 + 840) format];
        if (v34 - 44 >= 0xE && ((BOOL v56 = v34 > 0xF, v57 = (1 << v34) & 0xA800, !v56) ? (_ZF = v57 == 0) : (_ZF = 1), _ZF)) {
          uint64_t v35 = (uint64_t *)MEMORY[0x1E4F1DC88];
        }
        else {
          uint64_t v35 = (uint64_t *)MEMORY[0x1E4F1DC98];
        }
        uint64_t v36 = *v35;
        uint64_t v37 = [VKMapSnapshot alloc];
        unint64_t v38 = *(void **)(a1 + 32);
        uint64_t v39 = v38[16];
        uint64_t v40 = v38[17];
        id v41 = *(id *)(v38[9] + 840);
        [v41 contentScale];
        double v43 = v42;
        v44 = [*(id *)(a1 + 32) activeCanvas];
        v45 = [v44 vkCamera];
        *(float *)&double v46 = v33 * v32;
        *(float *)&double v47 = v18;
        id v48 = [(VKMapSnapshot *)v37 _initWithImages:v9 displayStyles:v39 displayStylesCount:v40 scale:v45 camera:v36 elevationScale:v43 targetPointElevation:v46 colorSpace:v47];

        [v48 setElevationRasters:v95];
        id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        mach_msg_type_number_t task_info_outCnt = 93;
        if (!task_info(*MEMORY[0x1E4F14960], 0x16u, (task_info_t)buf, &task_info_outCnt))
        {
          LODWORD(v50) = v104;
          v51 = [NSNumber numberWithDouble:(double)v50];
          [v49 setValue:v51 forKey:@"MemoryUsage:Footprint"];

          LODWORD(v52) = v105;
          v53 = [NSNumber numberWithDouble:(double)v52];
          [v49 setValue:v53 forKey:@"MemoryUsage:Footprint_Peak"];
        }
        uint64_t v99 = 0;
        int v98 = 0;
        malloc_get_all_zones();
        v54 = [NSNumber numberWithDouble:(double)((std::chrono::steady_clock::now().__d_.__rep_ - *(void *)(*(void *)(a1 + 32) + 200)) / 1000)* 0.001];
        v55 = [NSString stringWithFormat:@"TimeForSnapshot"];
        [v49 setValue:v54 forKey:v55];

        [v48 setMemoryStats:v49];
        [*(id *)(a1 + 32) softDealloc];
        ((void (**)(void, id, void))v96)[2](v96, v48, 0);
        [*(id *)(a1 + 32) clearResources];

        goto LABEL_43;
      }
    }
    else if (!v6)
    {
      if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
      }
      long long v22 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
      if (!os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      uint64_t v29 = *(void *)(a1 + 32);
      LODWORD(buf[0]) = 134217984;
      *(void *)((char *)buf + 4) = v29;
      unint64_t v24 = "VKMapSnapshotCreator: %p failed to fully render";
      goto LABEL_21;
    }
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
    }
    long long v22 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (!os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    uint64_t v23 = *(void *)(a1 + 32);
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v23;
    unint64_t v24 = "VKMapSnapshotCreator: %p failed to render - failed tiles!";
LABEL_21:
    _os_log_impl(&dword_1A1780000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)buf, 0xCu);
LABEL_22:
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.maps.snapshot.failedtiles" code:-5 userInfo:0];
    [*(id *)(a1 + 32) softDealloc];
    ((void (**)(void, void, id))v96)[2](v96, 0, v9);
    [*(id *)(a1 + 32) clearResources];
LABEL_43:
  }
}

- (void)cancelFlushingTileDecodes:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id completion = self->_completion;
  if (completion)
  {
    BOOL v4 = a3;
    self->_id completion = 0;

    int v6 = [(VKMapSnapshotCreator *)self activeCanvas];
    [v6 cancelLoad];

    value = self->_mapEngine.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 11);
    if (v8)
    {
      (*(void (**)(uint64_t))(*(void *)v8 + 32))(v8);
      if (*((void *)value + 11) == *((void *)value + 8))
      {
        uint64_t v10 = (std::__shared_weak_count *)*((void *)value + 9);
        *((void *)value + 8) = 0;
        *((void *)value + 9) = 0;
        if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      else
      {
        uint64_t v9 = *((void *)value + 10);
        *((void *)value + 10) = 0;
        if (v9) {
          (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
        }
      }
      *((void *)value + 11) = 0;
    }
    uint64_t v11 = *((void *)self->_taskContext.__ptr_ + 1);
    v13[0] = &unk_1EF56C798;
    uint64_t v14 = v13;
    geo::TaskQueue::barrierSync(v11, v13);
    if (v14 == v13)
    {
      (*(void (**)(void *))(v13[0] + 32))(v13);
    }
    else if (v14)
    {
      (*(void (**)(void))(*v14 + 40))();
    }
    uint64_t v12 = [(VKMapSnapshotCreator *)self activeCanvas];
    [v12 cancelTileRequests];

    [(VKMapSnapshotCreator *)self clearResources];
    if (v4) {
      md::TaskContext::flushTileDecodeQueues((md::TaskContext *)self->_taskContext.__ptr_);
    }
  }
}

- (void)cancelFlushingTileDecodes:
{
}

- (void)timeout
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  unsigned __int8 v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p snapshot request timed out", (uint8_t *)&v7, 0xCu);
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
    }
  }
  BOOL v4 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cancel", "", (uint8_t *)&v7, 2u);
  }
  if (self->_completion)
  {
    int v5 = (void (**)(void, void, void))MEMORY[0x1A6239EB0]();
    [(VKMapSnapshotCreator *)self cancelFlushingTileDecodes:1];
    int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.maps.snapshot.timeout" code:-6 userInfo:0];
    [(VKMapSnapshotCreator *)self softDealloc];
    ((void (**)(void, void, void *))v5)[2](v5, 0, v6);
    [(VKMapSnapshotCreator *)self clearResources];
  }
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  unsigned __int8 v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    int v6 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p cancel snapshot", (uint8_t *)&v5, 0xCu);
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
    }
  }
  BOOL v4 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log))
  {
    LOWORD(v5) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cancel", "", (uint8_t *)&v5, 2u);
  }
  (*(void (**)(Timer *))(*(void *)self->_expirationTimer.__ptr_.__value_ + 40))(self->_expirationTimer.__ptr_.__value_);
  [(VKMapSnapshotCreator *)self cancelFlushingTileDecodes:1];
}

- (void)renderSnapshot:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    (*(void (**)(Timer *, void, double))(*(void *)self->_expirationTimer.__ptr_.__value_ + 24))(self->_expirationTimer.__ptr_.__value_, 0, 70.0);
    BOOL v4 = (void *)[v7 copy];
    id completion = self->_completion;
    self->_id completion = v4;

    int v6 = [(VKMapSnapshotCreator *)self activeCanvas];
    [v6 loadScene];

    md::MapEngine::updateRunLoopStatus((md::MapEngine *)self->_mapEngine.__ptr_.__value_);
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = [(VKMapSnapshotCreator *)self activeCanvas];
  objc_msgSend(v11, "setCenterCoordinate:altitude:yaw:pitch:", var0, var1, a4, a5, a6);
}

- (void)setClearFontCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[VKSharedResourcesManager sharedResources];
  [v4 setSnapshotterIsInService:v3];
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5
{
  id v9 = a3;
  uint64_t v8 = [(VKMapSnapshotCreator *)self activeCanvas];
  [v8 setMapRegion:v9 pitch:a4 yaw:a5];
}

- (void)removeCustomFeatureDataSource:(id)a3
{
  id v4 = a3;
  md::LabelSettings::removeCustomFeatureDataSource((uint64_t)[(VKMapSnapshotCreator *)self _labelSettings], v4);
}

- (void)addCustomFeatureDataSource:(id)a3
{
  id v4 = a3;
  md::LabelSettings::addCustomFeatureDataSource((uint64_t)[(VKMapSnapshotCreator *)self _labelSettings], v4);
}

- (void)setLabelScaleFactor:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  int v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218240;
    id v9 = self;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setLabelScaleFactor: %ld", (uint8_t *)&v8, 0x16u);
  }
  int v6 = [(VKMapSnapshotCreator *)self _labelSettings];
  if ((unint64_t)a3 >= 6) {
    unsigned __int8 v7 = 1;
  }
  else {
    unsigned __int8 v7 = a3;
  }
  md::LabelSettings_Presentation::setLabelScaleFactor(*(md::LabelManager **)(*(void *)v6 + 24), *(void *)(*(void *)v6 + 40), v7);
}

- (int64_t)labelScaleFactor
{
  unsigned int v2 = *(unsigned __int8 *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40)
                          + 48);
  if (v2 >= 6) {
    return 1;
  }
  else {
    return v2;
  }
}

- (void)setTerrainMode:(int64_t)a3
{
  if ([(VKMapSnapshotCreator *)self _daVinciDataAvailable]
    && [(VKMapSnapshotCreator *)self _elevatedGroundIsEnabled])
  {
    uint64_t v5 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
    char v13 = 29;
    md::MapEngineSettings::set(v5, &v13, (void *)a3);
    uint64_t v6 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
    char v12 = 21;
    BOOL v7 = (unint64_t)(a3 - 1) < 3;
    int v8 = &v12;
  }
  else
  {
    uint64_t v9 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
    char v11 = 29;
    md::MapEngineSettings::set(v9, &v11, 0);
    uint64_t v6 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
    char v10 = 21;
    int v8 = &v10;
    BOOL v7 = 0;
  }
  md::MapEngineSettings::set(v6, v8, (void *)v7);
}

- (int64_t)terrainMode
{
  value = self->_mapEngine.__ptr_.__value_;
  if (!value) {
    return 0;
  }
  BOOL v3 = (uint64_t *)*((void *)value + 141);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4 != v5)
  {
    while (*(unsigned char *)v4 != 29)
    {
      v4 += 16;
      if (v4 == v5) {
        return 0;
      }
    }
  }
  if (v4 == v5) {
    return 0;
  }
  else {
    return *(void *)(v4 + 8);
  }
}

- (void)setMapKitClientMode:(unsigned __int8)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_mapKitClientMode == a3) {
    return;
  }
  int v3 = a3;
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  uint64_t v5 = (id)GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218242;
    BOOL v17 = self;
    __int16 v18 = 2080;
    uint8x8_t v19 = gss::to_string(v3);
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapSnapshotCreator:%p] Set mapKitClientMode: %s", (uint8_t *)&v16, 0x16u);
  }

  self->_mapKitClientMode = v3;
  uint64_t v6 = (int8x8_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 140);
  int8x8_t v7 = v6[2];
  if (!*(void *)&v7) {
    goto LABEL_26;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    uint64_t v9 = 0x2FED70A4459DFCA1;
    if (*(void *)&v7 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v9 = 0x2FED70A4459DFCA1uLL % *(void *)&v7;
    }
  }
  else
  {
    uint64_t v9 = (*(void *)&v7 - 1) & 0x2FED70A4459DFCA1;
  }
  char v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
  if (!v10 || (char v11 = (void *)*v10) == 0)
  {
LABEL_26:
    uint64_t v15 = 0;
    goto LABEL_27;
  }
  if (v8.u32[0] < 2uLL)
  {
    uint64_t v12 = *(void *)&v7 - 1;
    while (1)
    {
      uint64_t v14 = v11[1];
      if (v14 == 0x2FED70A4459DFCA1)
      {
        if (v11[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_29;
        }
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_26;
      }
      char v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v13 = v11[1];
    if (v13 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v13 >= *(void *)&v7) {
      v13 %= *(void *)&v7;
    }
    if (v13 != v9) {
      goto LABEL_26;
    }
LABEL_16:
    char v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_26;
    }
  }
  if (v11[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_16;
  }
LABEL_29:
  uint64_t v15 = v11[5];
LABEL_27:
  md::StyleLogic::setMapKitClientMode(v15, v3);
}

- (void)setMapKitUsage:(unsigned __int8)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_mapKitUsage == a3) {
    return;
  }
  unsigned int v3 = a3;
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  uint64_t v5 = (id)GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v17 = 134218242;
    __int16 v18 = self;
    __int16 v19 = 2080;
    uint64_t v20 = gss::to_string(v3);
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[VKMapSnapshotCreator:%p] Set mapKitUsage: %s", (uint8_t *)&v17, 0x16u);
  }

  self->_mapKitUsage = v3;
  BOOL v6 = v3 != 0;
  self->_usage = v6;
  int8x8_t v7 = (int8x8_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 140);
  int8x8_t v8 = v7[2];
  if (!*(void *)&v8) {
    goto LABEL_26;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    uint64_t v10 = 0x2FED70A4459DFCA1;
    if (*(void *)&v8 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v10 = 0x2FED70A4459DFCA1uLL % *(void *)&v8;
    }
  }
  else
  {
    uint64_t v10 = (*(void *)&v8 - 1) & 0x2FED70A4459DFCA1;
  }
  char v11 = *(void **)(*(void *)&v7[1] + 8 * v10);
  if (!v11 || (uint64_t v12 = (void *)*v11) == 0)
  {
LABEL_26:
    uint64_t v16 = 0;
    goto LABEL_27;
  }
  if (v9.u32[0] < 2uLL)
  {
    uint64_t v13 = *(void *)&v8 - 1;
    while (1)
    {
      uint64_t v15 = v12[1];
      if (v15 == 0x2FED70A4459DFCA1)
      {
        if (v12[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_29;
        }
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_26;
      }
      uint64_t v12 = (void *)*v12;
      if (!v12) {
        goto LABEL_26;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v12[1];
    if (v14 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v14 >= *(void *)&v8) {
      v14 %= *(void *)&v8;
    }
    if (v14 != v10) {
      goto LABEL_26;
    }
LABEL_16:
    uint64_t v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_26;
    }
  }
  if (v12[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_16;
  }
LABEL_29:
  uint64_t v16 = v12[5];
LABEL_27:
  md::StyleLogic::setUsage(v16, v6, v3);
}

- (void)setShowsTraffic:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  uint64_t v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    uint8x8_t v9 = self;
    __int16 v10 = 2080;
    char v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsTraffic: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v8) = 2;
  md::MapEngineSettings::set(v7, &v8, (void *)v3);
}

- (BOOL)showsTraffic
{
  unsigned int v2 = (uint64_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 141);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 2)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setShowsGlobe:(BOOL)a3
{
  uint64_t v3 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  char v4 = 22;
  md::MapEngineSettings::set(v3, &v4, (void *)([(VKMapSnapshotCreator *)self _globeIsEnabled] & a3));
}

- (BOOL)showsGlobe
{
  value = self->_mapEngine.__ptr_.__value_;
  if (!value) {
    return 0;
  }
  uint64_t v3 = (uint64_t *)*((void *)value + 141);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4 != v5)
  {
    while (*(unsigned char *)v4 != 22)
    {
      v4 += 16;
      if (v4 == v5) {
        return 0;
      }
    }
  }
  return v4 != v5 && *(void *)(v4 + 8) != 0;
}

- (void)setShowsVenues:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  uint64_t v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v9 = 134218242;
    __int16 v10 = self;
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsVenues: %s", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v9) = 0;
  md::MapEngineSettings::set(v7, &v9, (void *)v3);
  int v8 = [(VKMapSnapshotCreator *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsVenues(*(md::LabelSettings_Presentation **)(*(void *)v8 + 24), *(void *)(*(void *)v8 + 40), v3);
}

- (BOOL)showsVenues
{
  unsigned int v2 = (uint64_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 141);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setSelectedTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  __int16 v10 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v22 = 134218240;
    uint64_t v23 = self;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    _os_log_impl(&dword_1A1780000, v10, OS_LOG_TYPE_INFO, "[VKMapSnapshotCreator:%p] Select trail id: %llu", (uint8_t *)&v22, 0x16u);
  }
  __int16 v11 = (int8x8_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 140);
  int8x8_t v12 = v11[2];
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v14 = 0xC74495586E0C32F6;
      if (*(void *)&v12 <= 0xC74495586E0C32F6) {
        unint64_t v14 = 0xC74495586E0C32F6 % *(void *)&v12;
      }
    }
    else
    {
      unint64_t v14 = (*(void *)&v12 - 1) & 0xC74495586E0C32F6;
    }
    uint64_t v15 = *(void **)(*(void *)&v11[1] + 8 * v14);
    if (v15)
    {
      uint64_t v16 = (void *)*v15;
      if (v16)
      {
        if (v13.u32[0] < 2uLL)
        {
          uint64_t v17 = *(void *)&v12 - 1;
          while (1)
          {
            uint64_t v19 = v16[1];
            if (v19 == 0xC74495586E0C32F6)
            {
              if (v16[2] == 0xC74495586E0C32F6) {
                goto LABEL_26;
              }
            }
            else if ((v19 & v17) != v14)
            {
              goto LABEL_28;
            }
            uint64_t v16 = (void *)*v16;
            if (!v16) {
              goto LABEL_28;
            }
          }
        }
        do
        {
          unint64_t v18 = v16[1];
          if (v18 == 0xC74495586E0C32F6)
          {
            if (v16[2] == 0xC74495586E0C32F6)
            {
LABEL_26:
              uint64_t v20 = (md::HikingLogic *)v16[5];
              if (v20)
              {
                md::HikingLogic::setSelectedTrail(v20, a3, (const char *)[v8 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
                value = self->_mapEngine.__ptr_.__value_;
                LOBYTE(v22) = 1;
                md::MapEngine::setNeedsTick((uint64_t)value, &v22);
              }
              break;
            }
          }
          else
          {
            if (v18 >= *(void *)&v12) {
              v18 %= *(void *)&v12;
            }
            if (v18 != v14) {
              break;
            }
          }
          uint64_t v16 = (void *)*v16;
        }
        while (v16);
      }
    }
  }
LABEL_28:
}

- (void)setSelectedTrailId:(unint64_t)a3
{
}

- (void)setShowsHillshade:(BOOL)a3
{
  uint64_t v3 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  char v5 = 32;
  if (a3) {
    unint64_t v4 = [(VKMapSnapshotCreator *)self _hillshadeIsAvailable];
  }
  else {
    unint64_t v4 = 0;
  }
  md::MapEngineSettings::set(v3, &v5, (void *)v4);
}

- (BOOL)showsHillshade
{
  unsigned int v2 = (uint64_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 141);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 32)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setShowsHiking:(BOOL)a3 withTopographicFeatures:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  uint64_t v7 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    id v8 = "NO";
    if (v5) {
      id v9 = "YES";
    }
    else {
      id v9 = "NO";
    }
    int v14 = 134218498;
    uint64_t v15 = self;
    uint64_t v17 = v9;
    __int16 v16 = 2080;
    if (v4) {
      id v8 = "YES";
    }
    __int16 v18 = 2080;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1A1780000, v7, OS_LOG_TYPE_INFO, "KMapSnapshotCreator: %p Set shows hiking: %s with topograpic features: %s", (uint8_t *)&v14, 0x20u);
  }
  BOOL v10 = v5 && [(VKMapSnapshotCreator *)self _hikingIsAvailable];
  __int16 v11 = (void *)(v10 & v4);
  uint64_t v12 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v14) = 33;
  md::MapEngineSettings::set(v12, &v14, (void *)v10);
  uint64_t v13 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v14) = 34;
  md::MapEngineSettings::set(v13, &v14, v11);
}

- (BOOL)showsTopographicFeatures
{
  unsigned int v2 = (uint64_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 141);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 34)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setShowsHiking:(BOOL)a3
{
}

- (BOOL)showsHiking
{
  unsigned int v2 = (uint64_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 141);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 33)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setShowsTintBands:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    id v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsTintBands: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v8) = 11;
  md::MapEngineSettings::set(v7, &v8, (void *)v3);
}

- (BOOL)showsTintBands
{
  unsigned int v2 = (uint64_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 141);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 11)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setShowsBuildings:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v10 = 134218242;
    __int16 v11 = self;
    __int16 v12 = 2080;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsBuildings: %s", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v10) = 1;
  md::MapEngineSettings::set(v7, &v10, (void *)v3);
  if (v3)
  {
    value = self->_mapEngine.__ptr_.__value_;
    if (*((unsigned char *)value + 1240))
    {
      uint64_t v9 = *((void *)value + 141);
      LOBYTE(v10) = 24;
      md::MapEngineSettings::set(v9, &v10, (void *)1);
    }
  }
}

- (BOOL)showsBuildings
{
  unsigned int v2 = (uint64_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 141);
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  if (v3 != v4)
  {
    while (*(unsigned char *)v3 != 1)
    {
      v3 += 16;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return v3 != v4 && *(void *)(v3 + 8) != 0;
}

- (void)setLabelExclusionRegions:(id)a3
{
  id v4 = a3;
  md::LabelSettings::setLabelExclusionRegions((uint64_t)[(VKMapSnapshotCreator *)self _labelSettings], v4);
}

- (void)setShowsLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsLabels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapSnapshotCreator *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40) + 23);
}

- (void)setShowsPhysicalFeatureLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowPhysicalFeatureLabels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapSnapshotCreator *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsPhysicalFeatureLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsPhysicalFeatureLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40) + 22);
}

- (void)setShowsContourLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsContourLabels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapSnapshotCreator *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsContourLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsContourLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40) + 21);
}

- (void)setShowsPointLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsPointLabels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapSnapshotCreator *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsPointLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsPointLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40) + 18);
}

- (void)setShowsRoadShields:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsRoadShields: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapSnapshotCreator *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsRoadShields(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsRoadShields
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40) + 20);
}

- (void)setShowsRoadLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsRoadLabels: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapSnapshotCreator *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsRoadLabels(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsRoadLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40) + 19);
}

- (void)setPointsOfInterestFilter:(id)a3
{
  BOOL v5 = (GEOPOICategoryFilter *)a3;
  if (self->_pointsOfInterestFilter != v5)
  {
    int v8 = v5;
    objc_storeStrong((id *)&self->_pointsOfInterestFilter, a3);
    if (v8)
    {
      BOOL v6 = (std::__shared_weak_count *)operator new(0x30uLL);
      v6->__shared_owners_ = 0;
      v6->__shared_weak_owners_ = 0;
      v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF580C98;
      uint64_t v7 = v8;
      v6[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF5598D8;
      v6[1].__shared_owners_ = (uint64_t)v7;
      uint64_t v9 = v6 + 1;
      __int16 v10 = v6;
    }
    else
    {
      BOOL v6 = 0;
      uint64_t v9 = 0;
      __int16 v10 = 0;
    }
    md::LabelSettings_Presentation::setPointsOfInterestFilter((uint64_t)[(VKMapSnapshotCreator *)self _labelSettings], (uint64_t *)&v9);
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    BOOL v5 = v8;
  }
}

- (void)setShowsPointsOfInterest:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  BOOL v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "false";
    if (v3) {
      BOOL v6 = "true";
    }
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsPointsOfInterest: %s", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(VKMapSnapshotCreator *)self _labelSettings];
  md::LabelSettings_Presentation::setShowsPOIs(*(md::LabelSettings_Presentation **)(*(void *)v7 + 24), *(void *)(*(void *)v7 + 40), v3);
}

- (BOOL)showsPointsOfInterest
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40) + 17);
}

- (void)setLocalizeLabels:(BOOL)a3
{
  unsigned int v3 = a3;
  id v4 = [(VKMapSnapshotCreator *)self _labelSettings];
  uint64_t v5 = *v4;
  BOOL v6 = *(md::LabelSettings_Presentation **)(*v4 + 24);
  uint64_t v7 = *(void *)(v5 + 40);
  md::LabelSettings_Presentation::setLocalizeLabels(v6, v7, v3);
}

- (BOOL)localizeLabels
{
  return *(unsigned char *)(*(void *)(*(void *)[(VKMapSnapshotCreator *)self _labelSettings] + 40) + 24);
}

- (void)_labelSettings
{
  uint64_t v2 = *((void *)self->_mapEngine.__ptr_.__value_ + 140);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x20A1ED17D78F322BLL;
    if (v3 <= 0x20A1ED17D78F322BLL) {
      unint64_t v5 = 0x20A1ED17D78F322BLL % v3;
    }
    id v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        id v4 = (void *)*v4;
      while (v4[1] != 0x20A1ED17D78F322BLL);
    }
    while (v4[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    id v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        id v4 = (void *)*v4;
      while (v4[1] != 0x20A1ED17D78F322BLL);
    }
    while (v4[2] != 0x20A1ED17D78F322BLL);
  }
  return *(void **)(v4[5] + 144);
}

- (void)_transferSettingsFrom:(id)a3 to:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  [v10 edgeInsets];
  objc_msgSend(v5, "setEdgeInsets:");
  BOOL v6 = [v10 mapRegion];
  [v10 pitch];
  double v8 = v7;
  [v10 yaw];
  [v5 setMapRegion:v6 pitch:v8 yaw:v9];
}

- (unsigned)emphasis
{
  uint64_t v2 = *((void *)self->_mapEngine.__ptr_.__value_ + 140);
  unint64_t v3 = *(void *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    unint64_t v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1) {
      unint64_t v5 = 0x2FED70A4459DFCA1 % v3;
    }
    id v4 = *(void **)(*(void *)(v2 + 8) + 8 * v5);
    do
    {
      do
        id v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    id v4 = *(void **)(*(void *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        id v4 = (void *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  return *(unsigned char *)(v4[5] + 164);
}

- (void)setEmphasis:(unsigned __int8)a3
{
  unint64_t v3 = (int8x8_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 140);
  int8x8_t v4 = v3[2];
  if (!*(void *)&v4) {
    goto LABEL_21;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = 0x2FED70A4459DFCA1;
    if (*(void *)&v4 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v6 = 0x2FED70A4459DFCA1uLL % *(void *)&v4;
    }
  }
  else
  {
    uint64_t v6 = (*(void *)&v4 - 1) & 0x2FED70A4459DFCA1;
  }
  double v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
  if (!v7 || (double v8 = (void *)*v7) == 0)
  {
LABEL_21:
    uint64_t v12 = 0;
    goto LABEL_22;
  }
  if (v5.u32[0] < 2uLL)
  {
    uint64_t v9 = *(void *)&v4 - 1;
    while (1)
    {
      uint64_t v11 = v8[1];
      if (v11 == 0x2FED70A4459DFCA1)
      {
        if (v8[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_26;
        }
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_21;
      }
      double v8 = (void *)*v8;
      if (!v8) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = v8[1];
    if (v10 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v10 >= *(void *)&v4) {
      v10 %= *(void *)&v4;
    }
    if (v10 != v6) {
      goto LABEL_21;
    }
LABEL_11:
    double v8 = (void *)*v8;
    if (!v8) {
      goto LABEL_21;
    }
  }
  if (v8[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_11;
  }
LABEL_26:
  uint64_t v12 = v8[5];
LABEL_22:
  if (a3 == 2) {
    int v13 = 2;
  }
  else {
    int v13 = a3 == 1;
  }
  md::StyleLogic::setEmphasis(v12, v13, 0.0);
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  self->_edgeInsets = a3;
  double v8 = [(VKMapSnapshotCreator *)self activeCanvas];
  *(float *)&double v9 = top;
  *(float *)&double v10 = left;
  *(float *)&double v11 = bottom;
  *(float *)&double v12 = right;
  objc_msgSend(v8, "setEdgeInsets:", v9, v10, v11, v12);

  value = self->_mapEngine.__ptr_.__value_;
  uint64_t v14 = (float *)*((void *)value + 133);
  uint64_t v15 = (std::__shared_weak_count *)*((void *)value + 134);
  if (v15)
  {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    v14[108] = top;
    v14[109] = left;
    v14[110] = bottom;
    v14[111] = right;
    if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  else
  {
    v14[108] = top;
    v14[109] = left;
    v14[110] = bottom;
    v14[111] = right;
  }
}

- (void)setMapType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  uint8x8_t v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v26 = 134218240;
    unint64_t v27 = self;
    __int16 v28 = 2048;
    uint64_t v29 = v3;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator %p setMapType: %ld", (uint8_t *)&v26, 0x16u);
  }
  uint64_t v6 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v26) = 20;
  md::MapEngineSettings::set(v6, &v26, (void *)v3);
  if ((v3 - 3) <= 1 && !self->_globeCanvas && !*((unsigned char *)self->_mapEngine.__ptr_.__value_ + 1241))
  {
    double v7 = [[VKGlobeImageCanvas alloc] initWithMapEngine:self->_mapEngine.__ptr_.__value_];
    globeCanvas = self->_globeCanvas;
    self->_globeCanvas = v7;
  }
  double v9 = [(VKMapSnapshotCreator *)self activeCanvas];
  self->_mapType = v3;
  double v10 = [(VKMapSnapshotCreator *)self activeCanvas];
  if (v10 != v9) {
    [(VKMapSnapshotCreator *)self _transferSettingsFrom:v9 to:v10];
  }
  double v11 = (int8x8_t *)*((void *)self->_mapEngine.__ptr_.__value_ + 140);
  int8x8_t v12 = v11[2];
  if (!*(void *)&v12) {
    goto LABEL_31;
  }
  uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    uint64_t v14 = 0x2FED70A4459DFCA1;
    if (*(void *)&v12 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v14 = 0x2FED70A4459DFCA1uLL % *(void *)&v12;
    }
  }
  else
  {
    uint64_t v14 = (*(void *)&v12 - 1) & 0x2FED70A4459DFCA1;
  }
  uint64_t v15 = *(void **)(*(void *)&v11[1] + 8 * v14);
  if (!v15 || (__int16 v16 = (void *)*v15) == 0)
  {
LABEL_31:
    uint64_t v20 = 0;
    goto LABEL_32;
  }
  if (v13.u32[0] < 2uLL)
  {
    uint64_t v17 = *(void *)&v12 - 1;
    while (1)
    {
      uint64_t v19 = v16[1];
      if (v19 == 0x2FED70A4459DFCA1)
      {
        if (v16[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_43;
        }
      }
      else if ((v19 & v17) != v14)
      {
        goto LABEL_31;
      }
      __int16 v16 = (void *)*v16;
      if (!v16) {
        goto LABEL_31;
      }
    }
  }
  while (1)
  {
    unint64_t v18 = v16[1];
    if (v18 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v18 >= *(void *)&v12) {
      v18 %= *(void *)&v12;
    }
    if (v18 != v14) {
      goto LABEL_31;
    }
LABEL_21:
    __int16 v16 = (void *)*v16;
    if (!v16) {
      goto LABEL_31;
    }
  }
  if (v16[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_21;
  }
LABEL_43:
  uint64_t v20 = (md::StyleLogic *)v16[5];
LABEL_32:
  md::StyleLogic::updateConfiguration(v20, self->_mapType);
  uint64_t v21 = *((void *)self->_mapEngine.__ptr_.__value_ + 140);
  unint64_t v22 = *(void *)(v21 + 16);
  if ((v22 & (v22 - 1)) != 0)
  {
    unint64_t v24 = 0x20A1ED17D78F322BLL;
    if (v22 <= 0x20A1ED17D78F322BLL) {
      unint64_t v24 = 0x20A1ED17D78F322BLL % v22;
    }
    uint64_t v23 = *(void **)(*(void *)(v21 + 8) + 8 * v24);
    do
    {
      do
        uint64_t v23 = (void *)*v23;
      while (v23[1] != 0x20A1ED17D78F322BLL);
    }
    while (v23[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    uint64_t v23 = *(void **)(*(void *)(v21 + 8) + 8 * ((v22 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        uint64_t v23 = (void *)*v23;
      while (v23[1] != 0x20A1ED17D78F322BLL);
    }
    while (v23[2] != 0x20A1ED17D78F322BLL);
  }
  *(_DWORD *)(v23[5] + 220) = self->_mapType;
  unint64_t v25 = [(VKMapSnapshotCreator *)self activeCanvas];
  [v25 setMapType:v3];
}

- (int)mapType
{
  return self->_mapType;
}

- (CGSize)size
{
  [*((id *)self->_mapEngine.__ptr_.__value_ + 105) size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)addOverlay:(id)a3
{
  [(VKMapImageCanvas *)self->_mapCanvas addOverlay:a3];
  uint64_t v4 = *((void *)self->_mapEngine.__ptr_.__value_ + 141);
  char v6 = 5;
  uint8x8_t v5 = [(VKMapImageCanvas *)self->_mapCanvas overlays];
  md::MapEngineSettings::set(v4, &v6, (void *)([v5 count] != 0));
}

- (id)activeCanvas
{
  if (*((unsigned char *)self->_mapEngine.__ptr_.__value_ + 1241)) {
    return self->_mapCanvas;
  }
  uint64_t v2 = 8;
  if ((self->_mapType - 3) < 2) {
    uint64_t v2 = 16;
  }
  return *(id *)((char *)&self->super.isa + v2);
}

- (void)clearResources
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_images.__begin_ != self->_images.__end_ || self->_ioSurfaces.__begin_ != self->_ioSurfaces.__end_)
  {
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
    }
    double v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      double v11 = self;
      _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Clear VKMapSnapshotCreator %p resources", (uint8_t *)&v10, 0xCu);
    }
    begin = self->_images.__begin_;
    end = self->_images.__end_;
    if (begin != end)
    {
      do
      {
        char v6 = *begin++;
        CGImageRelease(v6);
      }
      while (begin != end);
      begin = self->_images.__begin_;
    }
    self->_images.__end_ = begin;
    double v7 = self->_ioSurfaces.__begin_;
    double v8 = self->_ioSurfaces.__end_;
    if (v7 != v8)
    {
      do
      {
        double v9 = *v7++;
        CFRelease(v9);
      }
      while (v7 != v8);
      double v7 = self->_ioSurfaces.__begin_;
    }
    self->_ioSurfaces.__end_ = v7;
  }
}

- (void)tileGroupDidChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  double v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    double v7 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKSnapshotCreator:%p] tileGroupDidChange", (uint8_t *)&v6, 0xCu);
  }
  value = self->_mapEngine.__ptr_.__value_;
  if (value) {
    md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)value + 567), "-[VKMapSnapshotCreator tileGroupDidChange]");
  }
  uint8x8_t v5 = +[VKSharedResourcesManager sharedResources];
  [v5 prune:0];
}

- (void)tileGroupWillChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  double v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint8x8_t v5 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "[VKSnapshotCreator:%p] tileGroupWillChange", (uint8_t *)&v4, 0xCu);
  }
}

- (void)softDealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  double v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v15 = 134217984;
    __int16 v16 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Deleting VKMapSnapshotCreator memory: %p", (uint8_t *)&v15, 0xCu);
  }
  notificationObserver = self->_notificationObserver;
  self->_notificationObserver = 0;

  uint8x8_t v5 = [MEMORY[0x1E4F64918] modernManager];
  [v5 closeServerConnection:1];

  uint64_t v6 = [MEMORY[0x1E4F64AC8] modernLoader];
  double v7 = GEOTileLoaderClientIdentifier();
  [v6 closeForClient:v7];

  id completion = self->_completion;
  self->_id completion = 0;

  mapCanvas = self->_mapCanvas;
  self->_mapCanvas = 0;

  [(VKGlobeImageCanvas *)self->_globeCanvas willDealloc];
  globeCanvas = self->_globeCanvas;
  self->_globeCanvas = 0;

  routeContext = self->_routeContext;
  self->_routeContext = 0;

  routeOverlay = self->_routeOverlay;
  self->_routeOverlay = 0;

  pointsOfInterestFilter = self->_pointsOfInterestFilter;
  self->_pointsOfInterestFilter = 0;

  value = self->_mapEngine.__ptr_.__value_;
  self->_mapEngine.__ptr_.__value_ = 0;
  if (value) {
    md::MapEngineDeleter::operator()((uint64_t)value);
  }
  self->_didSoftDealloc = 1;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  double v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = self;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Deallocating VKMapSnapshotCreator: %p", buf, 0xCu);
  }
  if (!self->_didSoftDealloc) {
    [(VKMapSnapshotCreator *)self softDealloc];
  }
  pointsOfInterestFilter = self->_pointsOfInterestFilter;
  self->_pointsOfInterestFilter = 0;

  displayStyles = self->_displayStyles;
  if (displayStyles) {
    free(displayStyles);
  }
  [(VKMapSnapshotCreator *)self clearResources];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  uint64_t v6 = (id)GEOGetVectorKitVKMapSnapshotLog(void)::log;
  double v7 = v6;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1780000, v7, OS_SIGNPOST_INTERVAL_END, signpostId, "MapSnapshotCreator", "", buf, 2u);
  }

  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
  }
  double v9 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1780000, v9, OS_LOG_TYPE_INFO, "Dealloc VKMapSnapshotCreator end", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)VKMapSnapshotCreator;
  [(VKMapSnapshotCreator *)&v10 dealloc];
}

- (VKMapSnapshotCreator)initWithSize:(CGSize)a3 scale:(double)a4 homeQueue:(id)a5 signpostId:(unint64_t)a6 mapType:(int)a7 mapDisplayStyles:(id *)a8 mapDisplayStylesCount:(unint64_t)a9 auditToken:(id)a10 useMultisampling:(BOOL)a11 withError:(id *)a12
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v19 = a10;
  if (a12) {
    *a12 = 0;
  }
  uint64_t v20 = +[VKSharedResourcesManager sharedResources];
  uint64_t v21 = [[VKManifestTileGroupObserverProxy alloc] initWithQueue:v18];
  manifestTileGroupObserverProxy = self->_manifestTileGroupObserverProxy;
  self->_manifestTileGroupObserverProxy = v21;

  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  uint64_t v23 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    unint64_t v24 = self->_manifestTileGroupObserverProxy;
    int buf = 134218240;
    buf_4 = self;
    __int16 v46 = 2048;
    double v47 = *(double *)&v24;
    _os_log_impl(&dword_1A1780000, v23, OS_LOG_TYPE_INFO, "[VKSnapshotCreator:%p] Manifest observer - %p", (uint8_t *)&buf, 0x16u);
  }

  objc_initWeak(&location, self);
  unint64_t v25 = self->_manifestTileGroupObserverProxy;
  objc_copyWeak(&to, &location);
  int v57 = 0;
  v55 = (void (**)(void **))&unk_1EF56BE98;
  objc_moveWeak(&v56, &to);
  int v57 = (void **)&v55;
  objc_destroyWeak(&to);
  [(VKManifestTileGroupObserverProxy *)v25 setDidChangeActiveTileGroup:&v55];
  if (v57 == (void **)&v55)
  {
    v55[4]((void **)&v55);
  }
  else if (v57)
  {
    (*((void (**)(void **))*v57 + 5))(v57);
  }
  int v26 = self->_manifestTileGroupObserverProxy;
  objc_copyWeak(&from, &location);
  v54 = 0;
  unint64_t v52 = (void (**)(void **))&unk_1EF56BEE0;
  objc_moveWeak(&v53, &from);
  v54 = (void **)&v52;
  objc_destroyWeak(&from);
  [(VKManifestTileGroupObserverProxy *)v26 setWillChangeActiveTileGroup:&v52];
  if (v54 == (void **)&v52)
  {
    v52[4]((void **)&v52);
  }
  else if (v54)
  {
    (*((void (**)(void))*v54 + 5))();
  }
  if (![v20 device]
    || (uint64_t v27 = *(void *)([v20 device] + 8)) == 0
    || ((*(uint64_t (**)(uint64_t))(*(void *)v27 + 32))(v27) & 1) == 0)
  {
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
    }
    uint64_t v30 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A1780000, v30, OS_LOG_TYPE_ERROR, "Not able to take a snapshot without valid metal device", (uint8_t *)&buf, 2u);
    }
    if (a12)
    {
      id v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.maps.snapshot" code:-3 userInfo:0];
      goto LABEL_31;
    }
LABEL_32:
    uint64_t v31 = 0;
    goto LABEL_33;
  }
  if (width * a4 < 1.0
    || !v18
    || height * a4 < 1.0
    || a4 < 1.0
    || *(_DWORD *)(*(void *)(objc_msgSend(v20, "device", 1.0, height * a4) + 8) + 24) < (int)(fmax(width, height) * a4))
  {
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
    }
    __int16 v28 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      int buf = 134218496;
      buf_4 = *(VKMapSnapshotCreator **)&height;
      __int16 v46 = 2048;
      double v47 = width;
      __int16 v48 = 2048;
      double v49 = a4;
      _os_log_impl(&dword_1A1780000, v28, OS_LOG_TYPE_ERROR, "Image size or content scale too small to produce an image: height:%f, width:%f, contentScale:%f", (uint8_t *)&buf, 0x20u);
    }
    if (a12)
    {
      id v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.maps.snapshot" code:-2 userInfo:0];
LABEL_31:
      uint64_t v31 = 0;
      *a12 = v29;
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  v39.receiver = self;
  v39.super_class = (Class)VKMapSnapshotCreator;
  float v33 = [(VKMapSnapshotCreator *)&v39 init];
  unsigned int v34 = (std::chrono::steady_clock::time_point *)v33;
  if (v33)
  {
    v33->_os_signpost_id_t signpostId = a6;
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
    }
    uint64_t v35 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
    {
      int buf = 134218752;
      buf_4 = (VKMapSnapshotCreator *)v34;
      __int16 v46 = 2048;
      double v47 = height;
      __int16 v48 = 2048;
      double v49 = width;
      __int16 v50 = 2048;
      double v51 = a4;
      _os_log_impl(&dword_1A1780000, v35, OS_LOG_TYPE_INFO, "Creating VKMapSnapshotCreator: %p with height:%f width:%f contenteScale:%f", (uint8_t *)&buf, 0x2Au);
      if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_22154);
      }
    }
    uint64_t v36 = (id)GEOGetVectorKitVKMapSnapshotLog(void)::log;
    uint64_t v37 = v36;
    os_signpost_id_t rep = v34[14].__d_.__rep_;
    if (rep - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      int buf = 134218496;
      buf_4 = *(VKMapSnapshotCreator **)&height;
      __int16 v46 = 2048;
      double v47 = width;
      __int16 v48 = 2048;
      double v49 = a4;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v37, OS_SIGNPOST_INTERVAL_BEGIN, rep, "MapSnapshotCreator", "height:%f width:%f contenteScale:%f", (uint8_t *)&buf, 0x20u);
    }

    v34[25].__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    objc_copyWeak(&v43, &location);
    operator new();
  }
  self = (VKMapSnapshotCreator *)0;
  uint64_t v31 = self;
LABEL_33:
  objc_destroyWeak(&location);

  return v31;
}

- (void)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x1A6239270);
}

- (id)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:
{
  v1 = (id *)(a1 + 8);
  uint64_t v2 = (id *)operator new(0x10uLL);
  *uint64_t v2 = &unk_1EF56BE98;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:
{
  return a1;
}

- (VKMapSnapshotCreator)initWithSize:(CGSize)a3 scale:(double)a4 homeQueue:(id)a5 signpostId:(unint64_t)a6 mapType:(int)a7 mapDisplayStyles:(id *)a8 mapDisplayStylesCount:(unint64_t)a9 auditToken:(id)a10
{
  LOBYTE(v11) = 1;
  return -[VKMapSnapshotCreator initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:](self, "initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:", a5, a6, *(void *)&a7, a8, a9, a10, a3.width, a3.height, a4, v11, 0);
}

+ (BOOL)supportsSharingThumbnails
{
  uint64_t v2 = +[VKPlatform sharedPlatform];
  char v3 = [v2 canMakeSharingThumbnails];

  return v3;
}

@end