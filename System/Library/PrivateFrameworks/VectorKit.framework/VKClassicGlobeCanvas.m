@interface VKClassicGlobeCanvas
+ (BOOL)supportsMapType:(int)a3 scale:(int)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinate:(CGPoint)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinateOnSphere:(CGPoint)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToMapPoint:(CGPoint)a3;
- (BOOL)disableLabels;
- (BOOL)disableRoads;
- (BOOL)flyoverAvailable;
- (BOOL)isPointValidForGesturing:(CGPoint)a3;
- (BOOL)shouldHideOffscreenSelectedAnnotation;
- (BOOL)trafficEnabled;
- (BOOL)useNewRenderPath;
- (CGPoint)_centerScreenPoint;
- (CGPoint)convertCoordinateToCameraModelPoint:(id)a3;
- (CGPoint)convertCoordinateToPoint:(id)a3;
- (CGPoint)convertMapPointToPoint:(id)a3;
- (GlobeOverlayContainer)overlayContainer;
- (NSArray)overlays;
- (NSArray)visibleTileSets;
- (VKARCameraController)arCameraController;
- (VKClassicGlobeCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4;
- (VKGlobeCameraController)globeCameraController;
- (VKInteractiveMapDelegate)delegate;
- (const)_clientStyleState;
- (const)_styleManager;
- (id).cxx_construct;
- (id)annotationCoordinateTest;
- (id)annotationRectTest;
- (id)attributionsForCurrentRegion;
- (id)consoleString:(BOOL)a3;
- (id)createFlyoverPreTourAnimation:(id)a3 duration:(double)a4;
- (id)detailedDescription;
- (id)flyoverStatistics;
- (id)initWithMapEngine:inBackground:;
- (id)sceneDidLoadCallback;
- (int)flyoverMode;
- (int)mapType;
- (uint64_t)initWithMapEngine:inBackground:;
- (uint64_t)startFlyoverTourAnimation:(uint64_t)a1 animateToStart:labelChanged:stateChange:;
- (uint64_t)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (void)_reloadStylesheet;
- (void)_setDefaultFov:(float)a3;
- (void)_update;
- (void)_updateDebugSettings;
- (void)addOverlay:(id)a3;
- (void)dealloc;
- (void)didBecomeActive;
- (void)didBecomeInActive;
- (void)didPresent;
- (void)didReceiveMemoryWarning:(BOOL)a3 beAggressive:(BOOL)a4;
- (void)disableFlyoverStatistics;
- (void)disableTileAnalytics;
- (void)enableFlyoverStatistics;
- (void)enableTileAnalytics;
- (void)enterARSessionAtCoordinate:(id)a3;
- (void)exitARSession;
- (void)initWithMapEngine:inBackground:;
- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4;
- (void)insertOverlay:(id)a3 belowOverlay:(id)a4;
- (void)pauseFlyoverTourAnimation;
- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4;
- (void)removeOverlay:(id)a3;
- (void)resetFlyoverStatistics;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)resumeFlyoverTourAnimation;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setContentsScale:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableLabels:(BOOL)a3;
- (void)setDisableRoads:(BOOL)a3;
- (void)setMapType:(int)a3;
- (void)setMapType:(int)a3 animated:(BOOL)a4;
- (void)setSceneDidLoadCallback:(id)a3;
- (void)setTrafficEnabled:(BOOL)a3;
- (void)setupMapScene;
- (void)startFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6;
- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6;
- (void)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:;
- (void)stopAnimations;
- (void)stopFlyoverAnimation;
- (void)stopLoading;
- (void)transferStateFromCanvas:(id)a3;
- (void)transitionToTracking:(BOOL)a3 mapMode:(int64_t)a4 startLocation:(id)a5 startCourse:(double)a6 cameraController:(id)a7 pounceCompletionHandler:(id)a8;
- (void)updateCameraForFrameResize;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)waitForLoading;
- (void)willDealloc;
@end

@implementation VKClassicGlobeCanvas

- (id).cxx_construct
{
  *(void *)((char *)self + 700) = 0x100010000010000;
  *((unsigned char *)self + 708) = 1;
  *(_OWORD *)((char *)self + 712) = xmmword_1A28FF110;
  *((unsigned char *)self + 728) = 0;
  *((_DWORD *)self + 183) = 0x40000000;
  *((void *)self + 92) = 0;
  *((void *)self + 95) = 0;
  *((void *)self + 96) = 0;
  *((void *)self + 97) = 0;
  *((void *)self + 98) = 0;
  *((void *)self + 100) = 0;
  *((void *)self + 101) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_arCameraController, 0);
  objc_storeStrong(&self->_sceneDidLoadCallback, 0);
  cntrl = self->_isDead.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_flyoverLibrary.__cntrl_;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  v5 = self->_overlayContainer.__cntrl_;
  if (v5 && !atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v5 + 16))(v5);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  value = self->_globeAdapter.__ptr_.__value_;
  self->_globeAdapter.__ptr_.__value_ = 0;
  if (value)
  {
    md::GlobeAdapter::~GlobeAdapter((md::GlobeAdapter *)value);
    MEMORY[0x1A6239270]();
  }
  objc_storeStrong((id *)&self->_globeCameraController, 0);
}

- (int)flyoverMode
{
  return self->_flyoverMode;
}

- (void)setTrafficEnabled:(BOOL)a3
{
  self->_trafficEnabled = a3;
}

- (BOOL)trafficEnabled
{
  return self->_trafficEnabled;
}

- (int)mapType
{
  return self->_mapType;
}

- (BOOL)disableLabels
{
  return self->_disableLabels;
}

- (BOOL)disableRoads
{
  return self->_disableRoads;
}

- (VKGlobeCameraController)globeCameraController
{
  return self->_globeCameraController;
}

- (void)setSceneDidLoadCallback:(id)a3
{
}

- (id)sceneDidLoadCallback
{
  return self->_sceneDidLoadCallback;
}

- (BOOL)flyoverAvailable
{
  return self->_canShowFlyover;
}

- (void)setDelegate:(id)a3
{
}

- (VKInteractiveMapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKInteractiveMapDelegate *)WeakRetained;
}

- (void)didBecomeInActive
{
  cameraController = self->super._cameraController;
  uint64_t v4 = 0;
  v5 = 0;
  [(VKCameraController *)cameraController setCamera:&v4];
  v3 = v5;
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (void)didBecomeActive
{
  cameraController = self->super._cameraController;
  ptr = self->super._camera.__ptr_;
  cntrl = self->super._camera.__cntrl_;
  v7 = ptr;
  v8 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  [(VKCameraController *)cameraController setCamera:&v7];
  v6 = (std::__shared_weak_count *)v8;
  if (v8)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)v8 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)transitionToTracking:(BOOL)a3 mapMode:(int64_t)a4 startLocation:(id)a5 startCourse:(double)a6 cameraController:(id)a7 pounceCompletionHandler:(id)a8
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  BOOL v13 = a3;
  id v15 = a7;
  id v16 = a8;
  if (a4 == 1)
  {
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:@"VKPounceWillStartNotification" object:self userInfo:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(VKCameraController *)self->super._cameraController stopRegionAnimation];
  }
  [(VKScreenCanvas *)self setCameraController:v15];
  [v15 setScreenCanvas:self];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__VKClassicGlobeCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke;
  v19[3] = &unk_1E5A93150;
  id v18 = v16;
  id v20 = v18;
  int64_t v21 = a4;
  v19[4] = self;
  objc_msgSend(v15, "startWithPounce:startLocation:startCourse:pounceCompletionHandler:", v13, v19, var0, var1, a6);
}

void __120__VKClassicGlobeCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (a1[6] == 1)
  {
    dispatch_time_t v3 = dispatch_time(0, 4000000000);
    uint64_t v4 = a1[4];
    v5 = **(NSObject ***)(v4 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__VKClassicGlobeCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5A960A0;
    block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

void __120__VKClassicGlobeCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VKPounceDidEndNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (GlobeOverlayContainer)overlayContainer
{
  return self->_overlayContainer.__ptr_;
}

- (void)_setDefaultFov:(float)a3
{
  globe = self->_globe;
  double v5 = a3;
  double v15 = a3;
  (*(void (**)(void *, double *))(*(void *)globe + 56))(globe, &v15);
  v6 = self->_globe;
  *((double *)v6 + 35) = v5;
  double v7 = tan(v5 * 0.5);
  *((double *)v6 + 36) = v7;
  v8 = (double *)*((void *)v6 + 9);
  double v10 = v8[46];
  double v9 = v8[47];
  if (v9 < v10)
  {
    double v11 = v9 * v10;
    double v12 = v10 / v9;
    if (v11 <= 0.0) {
      double v12 = 1.0;
    }
    long double v13 = atan(v12 * v7);
    double v5 = v13 + v13;
  }
  v8[57] = v5;
  uint64_t v14 = **(void **)(*((void *)v6 + 107) + 88);
  if (v14)
  {
    char v16 = 7;
    md::MapEngine::setNeedsTick(v14, &v16);
  }
}

- (void)disableTileAnalytics
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  globe = self->_globe;
  v8 = 0;
  altitude::GlobeView::setTileSetGridFractionChangedCallback(globe[58], v7);
  if (v8 == v7)
  {
    (*(void (**)(void *))(v7[0] + 32))(v7);
  }
  else if (v8)
  {
    (*(void (**)(void))(*v8 + 40))();
  }
  uint64_t v4 = self->_globe;
  v6 = 0;
  altitude::GlobeView::setTileSetLoadedFractionChangedCallback(v4[58], v5);
  if (v6 == v5)
  {
    (*(void (**)(void *))(v5[0] + 32))(v5);
  }
  else if (v6)
  {
    (*(void (**)(void))(*v6 + 40))();
  }
}

- (void)enableTileAnalytics
{
}

- (id)flyoverStatistics
{
  uint64_t v2 = *((void *)self->_globe + 103);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  gdc::Statistics::getAllSamplers((gdc::Statistics *)v31, v2);
  gdc::Statistics::dumpSamplerValues((uint64_t)&__p, (uint64_t *)v31);
  uint64_t v4 = (char *)v30;
  if (v30)
  {
    do
    {
      double v5 = v4 + 16;
      if (v4[39] < 0) {
        double v5 = (void *)*v5;
      }
      v6 = [NSString stringWithUTF8String:v5];
      double v7 = [NSNumber numberWithDouble:*((double *)v4 + 5)];
      [v3 setValue:v7 forKey:v6];

      uint64_t v4 = *(char **)v4;
    }
    while (v4);
  }
  gdc::Statistics::getAllHistograms((gdc::Statistics *)&v27, v2);
  v8 = v27;
  v23 = v28;
  if (v27 != v28)
  {
    while (1)
    {
      gdc::Histogram::getHistogramData((gdc::Histogram *)v24, v8[1]);
      uint64_t v9 = v25;
      if (v26 != v25) {
        break;
      }
      uint64_t v9 = v26;
      if (v26) {
        goto LABEL_8;
      }
LABEL_9:
      v8 += 2;
      if (v8 == v23)
      {
        v8 = v27;
        goto LABEL_16;
      }
    }
    unint64_t v10 = 0;
    double v11 = *(double *)&v24[2];
    double v12 = *(double *)v24;
    unint64_t v13 = v26 - v25;
    do
    {
      unint64_t v14 = v10 + 1;
      unint64_t v15 = v9[v10];
      if (v15)
      {
        char v16 = [NSString stringWithFormat:@"%s (count) [%2.1f, %2.1f]ms", *v8, v12 + v11 * (double)v10, v12 + v11 * (double)v14];
        v17 = [NSNumber numberWithDouble:(double)v15];
        [v3 setValue:v17 forKey:v16];
      }
      unint64_t v10 = v14;
    }
    while (v14 < v13);
LABEL_8:
    v26 = v9;
    operator delete(v9);
    goto LABEL_9;
  }
LABEL_16:
  id v18 = v3;
  if (v8) {
    operator delete(v8);
  }
  v19 = (void **)v30;
  if (v30)
  {
    do
    {
      v22 = (void **)*v19;
      if (*((char *)v19 + 39) < 0) {
        operator delete(v19[2]);
      }
      operator delete(v19);
      v19 = v22;
    }
    while (v22);
  }
  id v20 = __p;
  __p = 0;
  if (v20) {
    operator delete(v20);
  }
  if (v31[0]) {
    operator delete(v31[0]);
  }

  return v18;
}

- (void)resetFlyoverStatistics
{
  uint64_t v3 = *((void *)self->_globe + 58);
  if (*(void *)(v3 + 912))
  {
    uint64_t v4 = *(void **)(v3 + 904);
    if (v4)
    {
      do
      {
        double v5 = (void *)*v4;
        operator delete(v4);
        uint64_t v4 = v5;
      }
      while (v5);
    }
    *(void *)(v3 + 904) = 0;
    uint64_t v6 = *(void *)(v3 + 896);
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
        *(void *)(*(void *)(v3 + 888) + 8 * i) = 0;
    }
    *(void *)(v3 + 912) = 0;
  }
  v8 = *(std::chrono::steady_clock::time_point **)(v3 + 944);
  v8->__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  if (*(unsigned char *)(v3 + 928)) {
    *(unsigned char *)(v3 + 928) = 0;
  }
  uint64_t v9 = (gdc::Statistics *)*((void *)self->_globe + 103);
  gdc::Statistics::reset(v9);
}

- (void)disableFlyoverStatistics
{
}

- (void)enableFlyoverStatistics
{
}

- (void)setupMapScene
{
  engine = (md::HomeQueueScheduler **)self->_engine;
  md::HomeQueueScheduler::waitForSynchronization(engine[567], "-[VKClassicGlobeCanvas setupMapScene]");
  *(void *)(*(void *)(*((void *)engine[108] + 5) + 40) + 48) = self->_globeAdapter.__ptr_.__value_;
}

- (void)waitForLoading
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  ptr = self->super._camera.__ptr_;
  if (*((double *)ptr + 47) * *((double *)ptr + 46) <= 0.0)
  {
    *((int64x2_t *)ptr + 23) = vdupq_n_s64(0x4080000000000000uLL);
    double v4 = fmax(*((float *)ptr + 112) * 512.0, 0.0);
    *((double *)ptr + 48) = v4;
    *((double *)ptr + 49) = v4;
  }
  globe = self->_globe;
  engine = self->_engine;
  md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)engine + 567), "-[VKClassicGlobeCanvas waitForLoading]");
  double v7 = (altitude::GlobeView ***)*((void *)engine + 108);
  *(unsigned char *)(globe[88] + 64) = 1;
  [(VKClassicGlobeCanvas *)self _update];
  v29[0] = 0;
  v29[1] = 0;
  v28 = v29;
  long long v30 = 0u;
  long long __p = 0u;
  int v32 = 1065353216;
  v33 = v34;
  v34[0] = 0;
  v35[0] = 0;
  v35[1] = 0;
  v34[1] = 0;
  v34[2] = v35;
  v37 = 0;
  char v38 = 0;
  v25[0] = 0x2FED70A4459DFCA1;
  v25[1] = (unint64_t)"md::StyleLogic]";
  v25[2] = 14;
  *(void *)&long long v22 = 0xE42D19AFCA302E68;
  *((void *)&v22 + 1) = "md::StyleLogicContext]";
  uint64_t v23 = 21;
  char v24 = 1;
  v21[0] = &v22;
  v21[1] = 0;
  v20[0] = v21;
  v20[1] = 0;
  gdc::LogicExecutionGraphBuilder::addLogic((uint64_t)&v28, v25, &v22, 0, (uint64_t)v21, (uint64_t)v20);
  v8 = (int8x8_t *)*((void *)self->super._mapEngine + 140);
  v27 = 0;
  gdc::LogicExecutionGraphBuilder::build(&v22, (uint64_t)&v28, v26);
  md::LogicManager::setLogicExecutionGraph(v8, (unint64_t ***)&v22);
  uint64_t v9 = v22;
  if ((void)v22)
  {
    unint64_t v10 = *(void **)v22;
    if (*(void *)v22)
    {
      *(void *)(v22 + 8) = v10;
      operator delete(v10);
    }
    MEMORY[0x1A6239270](v9, 0x20C40960023A9);
  }
  if (v27 == v26)
  {
    (*(void (**)(void *))(v26[0] + 32))(v26);
  }
  else if (v27)
  {
    (*(void (**)(void))(*v27 + 40))();
  }
  double v11 = CACurrentMediaTime();
  md::realistic::RealisticRenderer::warmUp(v7, v11);
  *(void *)&long long v22 = 0;
  *((void *)&v22 + 1) = &v22;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  dispatch_time_t v12 = dispatch_time(0, 1500000000);
  unint64_t v13 = dispatch_get_global_queue(-32768, 0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__VKClassicGlobeCanvas_waitForLoading__block_invoke;
  v19[3] = &unk_1E5A93118;
  v19[4] = &v22;
  dispatch_after(v12, v13, v19);

  while (1)
  {
    uint64_t v14 = globe[88];
    if (!*(unsigned char *)(v14 + 64)
      || *(void *)(v14 + 104) != *(void *)(v14 + 112) && *(void *)(v14 + 80) == *(void *)(v14 + 88))
    {
      break;
    }
    if (*(unsigned char *)(*((void *)&v22 + 1) + 24)) {
      break;
    }
    [(VKClassicGlobeCanvas *)self _update];
    double v15 = CACurrentMediaTime();
    md::realistic::RealisticRenderer::warmUp(v7, v15);
    usleep(0x2710u);
  }
  _Block_object_dispose(&v22, 8);
  if (v37 == v36)
  {
    (*(void (**)(void *))(v36[0] + 32))(v36);
  }
  else if (v37)
  {
    (*(void (**)(void))(*v37 + 40))();
  }
  std::__tree<std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>,std::__map_value_compare<gdc::ContextTypeWrapper,std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>,gdc::ContextTypeWrapperCompare,true>,std::allocator<std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>>>::destroy(v35[0]);
  std::__tree<std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>,std::__map_value_compare<gdc::ContextTypeWrapper,std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>,gdc::ContextTypeWrapperCompare,true>,std::allocator<std::__value_type<gdc::ContextTypeWrapper,std::vector<std::pair<gdc::LogicExecutionNode,gdc::LogicExecutionGraphRequirement>>>>>::destroy(v34[0]);
  char v16 = (void *)__p;
  if ((void)__p)
  {
    do
    {
      v17 = (void *)*v16;
      operator delete(v16);
      char v16 = v17;
    }
    while (v17);
  }
  id v18 = (void *)v30;
  *(void *)&long long v30 = 0;
  if (v18) {
    operator delete(v18);
  }
  std::__tree<std::__value_type<gdc::LogicExecutionNode,geo::linear_set<gdc::LogicExecutionNode,gdc::LogicExecutionNodeCompare,std::allocator<gdc::LogicExecutionNode>,std::vector<gdc::LogicExecutionNode>>>,std::__map_value_compare<gdc::LogicExecutionNode,std::__value_type<gdc::LogicExecutionNode,geo::linear_set<gdc::LogicExecutionNode,gdc::LogicExecutionNodeCompare,std::allocator<gdc::LogicExecutionNode>,std::vector<gdc::LogicExecutionNode>>>,gdc::LogicExecutionNodeCompare,true>,std::allocator<std::__value_type<gdc::LogicExecutionNode,geo::linear_set<gdc::LogicExecutionNode,gdc::LogicExecutionNodeCompare,std::allocator<gdc::LogicExecutionNode>,std::vector<gdc::LogicExecutionNode>>>>>::destroy(v29[0]);
}

uint64_t __38__VKClassicGlobeCanvas_waitForLoading__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_updateDebugSettings
{
  p_debugSettings = &self->_debugSettings;
  int altitudePauseLoading = self->_debugSettings.altitudePauseLoading;
  id v77 = +[VKDebugSettings sharedSettings];
  int v5 = [v77 altitudePauseLoading];

  if (altitudePauseLoading != v5)
  {
    id v78 = +[VKDebugSettings sharedSettings];
    p_debugSettings->int altitudePauseLoading = [v78 altitudePauseLoading];

    (*(void (**)(void *, BOOL))(*(void *)self->_globe + 24))(self->_globe, p_debugSettings->altitudePauseLoading);
  }
  int altitudeFreezeViewNode = p_debugSettings->altitudeFreezeViewNode;
  id v79 = +[VKDebugSettings sharedSettings];
  int v7 = [v79 altitudeFreezeViewNode];

  if (altitudeFreezeViewNode != v7)
  {
    id v80 = +[VKDebugSettings sharedSettings];
    p_debugSettings->int altitudeFreezeViewNode = [v80 altitudeFreezeViewNode];

    globe = self->_globe;
    BOOL v9 = p_debugSettings->altitudeFreezeViewNode;
    unint64_t v10 = (unsigned char *)globe[8];
    v10[56] = v9;
    v10[57] = 1;
    double v11 = (void *)globe[46];
    if (v11)
    {
      dispatch_time_t v12 = (void *)v11[6];
      unint64_t v13 = (void *)v11[7];
      if (v12 != v13)
      {
        uint64_t v14 = *(void *)(globe[107] + 40);
        do
        {
          uint64_t v18 = *(void *)(v14 + 8);
          uint64_t v19 = *(void *)(v18 + 224);
          uint64_t v20 = *(void *)(v18 + 232);
          uint64_t v21 = v20 - v19;
          if (v20 != v19)
          {
            uint64_t v22 = 0;
            unint64_t v23 = v21 >> 4;
            if (v23 <= 1) {
              uint64_t v24 = 1;
            }
            else {
              uint64_t v24 = v23;
            }
            v25 = *(void **)(v18 + 224);
            while (*v25 != *v12)
            {
              ++v22;
              v25 += 2;
              if (v24 == v22) {
                goto LABEL_8;
              }
            }
            uint64_t v15 = v19 + 16 * v22;
            uint64_t v16 = v19 + 16 * v23;
            uint64_t v17 = *(void *)(v16 - 16);
            v16 -= 16;
            *(void *)uint64_t v15 = v17;
            *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
            *(void *)(v18 + 232) = v16;
          }
LABEL_8:
          ++v12;
        }
        while (v12 != v13);
      }
      (*(void (**)(void *))(*v11 + 8))(v11);
    }
    globe[46] = 0;
    if (v9)
    {
      uint64_t v26 = (*(uint64_t (**)(unsigned char *, void, uint64_t))(*(void *)v10 + 24))(v10, 0, 0xFFFFFFFFLL);
      uint64_t v27 = *(void *)(globe[107] + 136);
      long long v107 = xmmword_1A28FC6C0;
      altitude::createDebugFrustumElement(v27, v26);
    }
  }
  int altitudeTexturePaging = p_debugSettings->altitudeTexturePaging;
  id v81 = +[VKDebugSettings sharedSettings];
  int v29 = [v81 altitudeTexturePaging];

  if (altitudeTexturePaging != v29)
  {
    id v82 = +[VKDebugSettings sharedSettings];
    p_debugSettings->int altitudeTexturePaging = [v82 altitudeTexturePaging];

    long long v30 = (altitude::GlobeView *)self->_globe;
    *(unsigned char *)(*(void *)(*((void *)v30 + 107) + 136) + 68) = p_debugSettings->altitudeTexturePaging;
    altitude::GlobeView::reload(v30);
  }
  int altitudeShowTileBounds = p_debugSettings->altitudeShowTileBounds;
  id v83 = +[VKDebugSettings sharedSettings];
  int v32 = [v83 altitudeShowTileBounds];

  if (altitudeShowTileBounds != v32)
  {
    id v84 = +[VKDebugSettings sharedSettings];
    p_debugSettings->int altitudeShowTileBounds = [v84 altitudeShowTileBounds];

    BOOL v33 = p_debugSettings->altitudeShowTileBounds;
    v34 = self->_globe;
    uint64_t v35 = v34[86];
    ++*(_DWORD *)(v35 + 196);
    *(unsigned char *)(v35 + 205) = v33;
    uint64_t v36 = **(void **)(v34[107] + 88);
    if (v36)
    {
      LOBYTE(v107) = 7;
      md::MapEngine::setNeedsTick(v36, &v107);
    }
  }
  v37 = self->_globe;
  id v85 = +[VKDebugSettings sharedSettings];
  v37[632] = [v85 altitudeShowTriggerBounds];

  int altitudeMipmapSatellite = p_debugSettings->altitudeMipmapSatellite;
  id v86 = +[VKDebugSettings sharedSettings];
  LODWORD(v37) = [v86 altitudeMipmapSatellite];

  if (altitudeMipmapSatellite != v37)
  {
    id v87 = +[VKDebugSettings sharedSettings];
    p_debugSettings->int altitudeMipmapSatellite = [v87 altitudeMipmapSatellite];

    uint64_t v39 = (altitude::GlobeView *)self->_globe;
    *(unsigned char *)(*(void *)(*((void *)v39 + 107) + 136) + 40) = p_debugSettings->altitudeMipmapSatellite;
    altitude::GlobeView::reload(v39);
  }
  int altitudeMipmapFlyover = p_debugSettings->altitudeMipmapFlyover;
  id v88 = +[VKDebugSettings sharedSettings];
  int v41 = [v88 altitudeMipmapFlyover];

  if (altitudeMipmapFlyover != v41)
  {
    id v89 = +[VKDebugSettings sharedSettings];
    p_debugSettings->int altitudeMipmapFlyover = [v89 altitudeMipmapFlyover];

    v42 = (altitude::GlobeView *)self->_globe;
    *(unsigned char *)(*(void *)(*((void *)v42 + 107) + 136) + 41) = p_debugSettings->altitudeMipmapFlyover;
    altitude::GlobeView::reload(v42);
  }
  int altitudeMipmapObjectTree = p_debugSettings->altitudeMipmapObjectTree;
  id v90 = +[VKDebugSettings sharedSettings];
  int v44 = [v90 altitudeMipmapObjectTree];

  if (altitudeMipmapObjectTree != v44)
  {
    id v91 = +[VKDebugSettings sharedSettings];
    p_debugSettings->int altitudeMipmapObjectTree = [v91 altitudeMipmapObjectTree];

    v45 = (altitude::GlobeView *)self->_globe;
    *(unsigned char *)(*(void *)(*((void *)v45 + 107) + 136) + 42) = p_debugSettings->altitudeMipmapObjectTree;
    altitude::GlobeView::reload(v45);
  }
  int altitudeShowNightLight = p_debugSettings->altitudeShowNightLight;
  id v92 = +[VKDebugSettings sharedSettings];
  int v47 = [v92 altitudeShowNightLight];

  if (altitudeShowNightLight != v47)
  {
    id v93 = +[VKDebugSettings sharedSettings];
    p_debugSettings->int altitudeShowNightLight = [v93 altitudeShowNightLight];

    v48 = (altitude::GlobeView *)self->_globe;
    uint64_t v49 = *(void *)(*((void *)v48 + 107) + 136);
    if (p_debugSettings->altitudeShowNightLight)
    {
      *(unsigned char *)(v49 + 48) = 1;
      altitude::GlobeView::updateNightLightRedrawRequest(v48);
      v48 = (altitude::GlobeView *)self->_globe;
    }
    else
    {
      *(unsigned char *)(v49 + 48) = 0;
    }
    altitude::GlobeView::reload(v48);
  }
  float lodScale = p_debugSettings->lodScale;
  id v94 = +[VKDebugSettings sharedSettings];
  [v94 altitudeLodScale];
  float v52 = v51;

  if (lodScale != v52)
  {
    id v95 = +[VKDebugSettings sharedSettings];
    [v95 altitudeLodScale];
    p_debugSettings->float lodScale = v53;

    v54 = self->_globe;
    float v55 = p_debugSettings->lodScale;
    *(float *)(v54[86] + 200) = v55;
    *(float *)(v54[87] + 216) = v55;
    uint64_t v56 = **(void **)(v54[107] + 88);
    if (v56)
    {
      LOBYTE(v107) = 7;
      md::MapEngine::setNeedsTick(v56, &v107);
    }
  }
  float tileQualityThreshold = p_debugSettings->tileQualityThreshold;
  id v96 = +[VKDebugSettings sharedSettings];
  [v96 altitudeTileQualityThreshold];
  float v59 = v58;

  if (tileQualityThreshold != v59)
  {
    id v97 = +[VKDebugSettings sharedSettings];
    [v97 altitudeTileQualityThreshold];
    p_debugSettings->float tileQualityThreshold = v60;

    *(float *)(*(void *)(*((void *)self->_globe + 107) + 136) + 52) = p_debugSettings->tileQualityThreshold;
  }
  float hideMeshTime = p_debugSettings->hideMeshTime;
  id v98 = +[VKDebugSettings sharedSettings];
  [v98 altitudeHideMeshTime];
  float v63 = v62;

  if (hideMeshTime != v63)
  {
    id v99 = +[VKDebugSettings sharedSettings];
    [v99 altitudeHideMeshTime];
    p_debugSettings->float hideMeshTime = v64;

    *(float *)(*(void *)(*((void *)self->_globe + 107) + 136) + 56) = p_debugSettings->hideMeshTime;
  }
  float fadeSpeed = p_debugSettings->fadeSpeed;
  id v100 = +[VKDebugSettings sharedSettings];
  [v100 altitudeFadeSpeed];
  float v67 = v66;

  if (fadeSpeed != v67)
  {
    id v101 = +[VKDebugSettings sharedSettings];
    [v101 altitudeFadeSpeed];
    p_debugSettings->float fadeSpeed = v68;

    *(float *)(*(void *)(*((void *)self->_globe + 107) + 136) + 60) = p_debugSettings->fadeSpeed;
  }
  int tourSpeedup = p_debugSettings->tourSpeedup;
  id v102 = +[VKDebugSettings sharedSettings];
  if (tourSpeedup == [v102 altitudeTourSpeedup])
  {
    float tourSpeedupFactor = p_debugSettings->tourSpeedupFactor;
    v71 = +[VKDebugSettings sharedSettings];
    [v71 altitudeTourSpeedupFactor];
    float v73 = v72;

    if (tourSpeedupFactor == v73) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  id v103 = +[VKDebugSettings sharedSettings];
  [v103 altitudeTourSpeedupFactor];
  p_debugSettings->float tourSpeedupFactor = v74;

  id v104 = +[VKDebugSettings sharedSettings];
  p_debugSettings->int tourSpeedup = [v104 altitudeTourSpeedup];

  if (p_debugSettings->tourSpeedup) {
    float v75 = p_debugSettings->tourSpeedupFactor;
  }
  else {
    float v75 = 1.0;
  }
  *(float *)(*((void *)self->_globe + 78) + 112) = fmaxf(fminf(v75, 10.0), -5.0);
LABEL_56:
  id v105 = +[VKDebugSettings sharedSettings];
  *(unsigned char *)(*(void *)(*((void *)self->_globe + 107) + 136) + 66) = [v105 altitudeDisableC3mTextureLoading];

  v76 = self->_globe;
  id v106 = +[VKDebugSettings sharedSettings];
  v76[544] = [v106 altitudePrintRenderedTilesStat];
}

- (void)didReceiveMemoryWarning:(BOOL)a3 beAggressive:(BOOL)a4
{
  BOOL v4 = a4;
  v22.receiver = self;
  v22.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas didReceiveMemoryWarning:beAggressive:](&v22, sel_didReceiveMemoryWarning_beAggressive_, a3);
  value = self->_globeAdapter.__ptr_.__value_;
  v8 = *(void **)value;
  int v7 = (std::__shared_weak_count *)*((void *)value + 1);
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v9 = (uint64_t *)v8[3];
  if (v9 != v8 + 4)
  {
    do
    {
      uint64_t v10 = *(void *)(v9[6] + 504);
      if (!v10 || *(void *)(v10 + 8) == -1)
      {
        uint64_t v14 = (uint64_t *)v9[1];
        uint64_t v15 = v14;
        uint64_t v16 = v9;
        if (v14)
        {
          do
          {
            dispatch_time_t v12 = v15;
            uint64_t v15 = (uint64_t *)*v15;
          }
          while (v15);
        }
        else
        {
          do
          {
            dispatch_time_t v12 = (uint64_t *)v16[2];
            BOOL v13 = *v12 == (void)v16;
            uint64_t v16 = v12;
          }
          while (!v13);
        }
        uint64_t v17 = v9;
        if (v14)
        {
          do
          {
            uint64_t v18 = v14;
            uint64_t v14 = (uint64_t *)*v14;
          }
          while (v14);
        }
        else
        {
          do
          {
            uint64_t v18 = (uint64_t *)v17[2];
            BOOL v13 = *v18 == (void)v17;
            uint64_t v17 = v18;
          }
          while (!v13);
        }
        if ((uint64_t *)v8[3] == v9) {
          v8[3] = v18;
        }
        uint64_t v19 = (uint64_t *)v8[4];
        --v8[5];
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v19, v9);
        uint64_t v20 = (std::__shared_weak_count *)v9[7];
        if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
        operator delete(v9);
      }
      else
      {
        double v11 = (uint64_t *)v9[1];
        if (v11)
        {
          do
          {
            dispatch_time_t v12 = v11;
            double v11 = (uint64_t *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            dispatch_time_t v12 = (uint64_t *)v9[2];
            BOOL v13 = *v12 == (void)v9;
            BOOL v9 = v12;
          }
          while (!v13);
        }
      }
      BOOL v9 = v12;
    }
    while (v12 != v8 + 4);
  }
  uint64_t v21 = (md::FontTrackingCache **)*((void *)value + 10);
  if (v21) {
    md::LabelManager::didReceiveMemoryWarning(v21, v4);
  }
  if (v7)
  {
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (NSArray)overlays
{
  ptr = self->_overlayContainer.__ptr_;
  uint64_t v3 = (std::mutex *)((char *)ptr + 16);
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  id v4 = *((id *)ptr + 1);
  std::mutex::unlock(v3);
  return (NSArray *)v4;
}

- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ptr = self->_overlayContainer.__ptr_;
  BOOL v9 = (VKOverlay *)v6;
  id v10 = v7;
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  uint64_t v11 = [*((id *)ptr + 1) indexOfObjectIdenticalTo:v10];
  dispatch_time_t v12 = (void *)*((void *)ptr + 1);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    [v12 addObject:v9];
  }
  else {
    [v12 insertObject:v9 atIndex:v11 + 1];
  }
  if (*(void *)ptr)
  {
    BOOL v13 = *(md::realistic::OverlayRenderLayer **)(*(void *)(*(void *)(*(void *)ptr + 856) + 40) + 48);
    if (v13) {
      md::realistic::OverlayRenderLayer::addOverlay(v13, v9);
    }
  }
  std::mutex::unlock((std::mutex *)((char *)ptr + 16));

  cntrl = self->_overlayContainer.__cntrl_;
  uint64_t v16 = self->_overlayContainer.__ptr_;
  uint64_t v17 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  [(VKOverlay *)v9 setFlyoverContainer:&v16];
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    char v18 = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v18);
  }
}

- (void)insertOverlay:(id)a3 belowOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ptr = self->_overlayContainer.__ptr_;
  BOOL v9 = (VKOverlay *)v6;
  id v10 = v7;
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  uint64_t v11 = [*((id *)ptr + 1) indexOfObjectIdenticalTo:v10];
  dispatch_time_t v12 = (void *)*((void *)ptr + 1);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    [v12 addObject:v9];
  }
  else {
    objc_msgSend(v12, "insertObject:atIndex:", v9);
  }
  if (*(void *)ptr)
  {
    BOOL v13 = *(md::realistic::OverlayRenderLayer **)(*(void *)(*(void *)(*(void *)ptr + 856) + 40) + 48);
    if (v13) {
      md::realistic::OverlayRenderLayer::addOverlay(v13, v9);
    }
  }
  std::mutex::unlock((std::mutex *)((char *)ptr + 16));

  cntrl = self->_overlayContainer.__cntrl_;
  uint64_t v16 = self->_overlayContainer.__ptr_;
  uint64_t v17 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  [(VKOverlay *)v9 setFlyoverContainer:&v16];
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    char v18 = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v18);
  }
}

- (void)removeOverlay:(id)a3
{
  id v4 = a3;
  ptr = self->_overlayContainer.__ptr_;
  id v38 = v4;
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  [*((id *)ptr + 1) removeObject:v38];
  if (*(void *)ptr)
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(*(void *)ptr + 856) + 40) + 48);
    if (v6)
    {
      id v7 = (VKOverlay *)v38;
      md::realistic::OverlayRenderLayer::invalidateTiles((md::realistic::OverlayRenderLayer *)v6, v7);
      uint64_t v8 = *(void *)(v6 + 80);
      uint64_t v9 = *(void *)(v6 + 88);
      uint64_t v10 = v9 - v8;
      if (v9 != v8)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v10 >> 4;
        BOOL v13 = *(VKOverlay ***)(v6 + 80);
        while (*v13 != v7)
        {
          ++v11;
          v13 += 2;
          if (v12 == v11) {
            goto LABEL_31;
          }
        }
        uint64_t v14 = v8 + 16 * v11;
        unint64_t v15 = v12 - 1;
        uint64_t v16 = v8 + 16 * (v12 - 1);
        objc_storeStrong((id *)v14, *(id *)v16);
        *(_DWORD *)(v14 + 8) = *(_DWORD *)(v16 + 8);
        char v18 = *(char **)(v6 + 80);
        uint64_t v17 = *(char **)(v6 + 88);
        unint64_t v19 = (v17 - v18) >> 4;
        unint64_t v20 = v15 - v19;
        if (v15 <= v19)
        {
          if (v15 < v19)
          {
            BOOL v33 = &v18[16 * v15];
            while (v17 != v33)
            {
              v34 = (void *)*((void *)v17 - 2);
              v17 -= 16;
            }
            *(void *)(v6 + 88) = v33;
          }
        }
        else
        {
          uint64_t v21 = *(void *)(v6 + 96);
          if (v20 <= (v21 - (uint64_t)v17) >> 4)
          {
            bzero(*(void **)(v6 + 88), 16 * v20);
            *(void *)(v6 + 88) = &v17[16 * v20];
          }
          else
          {
            if (v15 >> 60) {
              abort();
            }
            uint64_t v22 = v21 - (void)v18;
            uint64_t v23 = v22 >> 3;
            if (v22 >> 3 <= v15) {
              uint64_t v23 = v15;
            }
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v24 = v23;
            }
            if (v24 >> 60) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            v25 = (char *)operator new(16 * v24);
            uint64_t v26 = &v25[16 * v19];
            size_t v27 = 16 * v20;
            v28 = &v25[16 * v24];
            bzero(v26, v27);
            int v29 = &v26[v27];
            if (v17 == v18)
            {
              *(void *)(v6 + 80) = v26;
              *(void *)(v6 + 88) = v29;
              *(void *)(v6 + 96) = v28;
            }
            else
            {
              long long v30 = v17;
              do
              {
                uint64_t v31 = *((void *)v30 - 2);
                v30 -= 16;
                *(void *)long long v30 = 0;
                *((void *)v26 - 2) = v31;
                v26 -= 16;
                *((_DWORD *)v26 + 2) = *((_DWORD *)v30 + 2);
              }
              while (v30 != v18);
              *(void *)(v6 + 80) = v26;
              *(void *)(v6 + 88) = v29;
              *(void *)(v6 + 96) = v28;
              do
              {
                int v32 = (void *)*((void *)v17 - 2);
                v17 -= 16;
              }
              while (v17 != v18);
              uint64_t v17 = v18;
            }
            if (v17) {
              operator delete(v17);
            }
          }
        }
      }
LABEL_31:
    }
    uint64_t v39 = 0;
    v40 = 0;
    [v38 setFlyoverContainer:&v39];
    if (v40) {
      std::__shared_weak_count::__release_weak(v40);
    }
    if (![*((id *)ptr + 1) count])
    {
      uint64_t v35 = *(void *)ptr;
      *(unsigned char *)(v35 + 435) = 0;
      uint64_t v36 = *(md::realistic::OverlayRenderLayer **)(*(void *)(*(void *)(v35 + 856) + 40) + 48);
      if (v36)
      {
        (*(void (**)(md::realistic::OverlayRenderLayer *, void, void))(*(void *)v36 + 40))(v36, 0, 0);
        uint64_t v36 = *(md::realistic::OverlayRenderLayer **)(*(void *)(*(void *)(v35 + 856) + 40) + 48);
      }
      md::realistic::OverlayRenderLayer::clearOverlays(v36);
    }
  }
  std::mutex::unlock((std::mutex *)((char *)ptr + 16));

  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    LOBYTE(v39) = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v39);
  }
}

- (void)addOverlay:(id)a3
{
  id v4 = a3;
  ptr = self->_overlayContainer.__ptr_;
  uint64_t v6 = (VKOverlay *)v4;
  std::mutex::lock((std::mutex *)((char *)ptr + 16));
  [*((id *)ptr + 1) addObject:v6];
  uint64_t v7 = *(void *)ptr;
  if (*(void *)ptr)
  {
    *(unsigned char *)(v7 + 435) = 1;
    uint64_t v8 = *(void *)(*(void *)(*(void *)(v7 + 856) + 40) + 48);
    if (!v8
      || ((*(void (**)(uint64_t, uint64_t, void))(*(void *)v8 + 40))(v8, 1, 0),
          (uint64_t v7 = *(void *)ptr) != 0))
    {
      uint64_t v9 = *(md::realistic::OverlayRenderLayer **)(*(void *)(*(void *)(v7 + 856) + 40) + 48);
      if (v9) {
        md::realistic::OverlayRenderLayer::addOverlay(v9, v6);
      }
    }
  }
  std::mutex::unlock((std::mutex *)((char *)ptr + 16));

  cntrl = self->_overlayContainer.__cntrl_;
  uint64_t v12 = self->_overlayContainer.__ptr_;
  BOOL v13 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  [(VKOverlay *)v6 setFlyoverContainer:&v12];
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    char v14 = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v14);
  }
}

- (void)setDisableRoads:(BOOL)a3
{
  self->_disableRoads = a3;
  if (self->_mapType == 4)
  {
    globe = self->_globe;
    if (a3)
    {
      globe[432] = 0;
      uint64_t v4 = **(void **)(*((void *)globe + 107) + 88);
      if (!v4) {
        return;
      }
      char v6 = 7;
      int v5 = &v6;
    }
    else
    {
      globe[432] = 1;
      uint64_t v4 = **(void **)(*((void *)globe + 107) + 88);
      if (!v4) {
        return;
      }
      char v7 = 7;
      int v5 = &v7;
    }
    md::MapEngine::setNeedsTick(v4, v5);
  }
}

- (void)setDisableLabels:(BOOL)a3
{
  self->_disableLabels = a3;
  if (self->_mapType == 4)
  {
    globe = self->_globe;
    if (a3)
    {
      uint64_t v4 = (altitude::GlobeView *)self->_globe;
      altitude::GlobeView::disableLabelData(v4);
    }
    else
    {
      globe[433] = 1;
      uint64_t v5 = *(void *)(*(void *)(*((void *)globe + 107) + 40) + 40);
      (*(void (**)(uint64_t, uint64_t))(*(void *)v5 + 40))(v5, 1);
      char v6 = *(void **)(*(void *)(*((void *)globe + 107) + 40) + 40);
      uint64_t v7 = v6[12];
      if (v7) {
        atomic_store(1u, (unsigned __int8 *)(v7 + 224));
      }
      uint64_t v8 = v6[10];
      if (v8) {
        atomic_store(1u, (unsigned __int8 *)(v8 + 224));
      }
      uint64_t v9 = v6[11];
      if (v9) {
        atomic_store(1u, (unsigned __int8 *)(v9 + 224));
      }
      uint64_t v10 = *(void *)(*(void *)(*(void *)(*((void *)globe + 107) + 40) + 40) + 56);
      if (v10) {
        *(unsigned char *)(v10 + 136) = 1;
      }
    }
  }
}

- (BOOL)shouldHideOffscreenSelectedAnnotation
{
  return 1;
}

- (id)annotationCoordinateTest
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__VKClassicGlobeCanvas_annotationCoordinateTest__block_invoke;
  v4[3] = &unk_1E5A930F0;
  v4[4] = self;
  uint64_t v2 = (void *)[v4 copy];
  return v2;
}

BOOL __48__VKClassicGlobeCanvas_annotationCoordinateTest__block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 744);
  double v5 = *(double *)(*(void *)(v4 + 784) + 1448);
  uint64_t v6 = *(void *)(v4 + 72);
  if (v6)
  {
    double v7 = *(double *)(v6 + 8);
    double v8 = *(double *)(v6 + 16);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }
  long double v9 = 6371008.77 / (v5 + 6371008.77);
  double v10 = a2 * 0.0174532925;
  __double2 v11 = __sincos_stret(v7);
  __double2 v12 = __sincos_stret(v10);
  return v11.__sinval * v12.__sinval + v11.__cosval * v12.__cosval * cos(-(v8 - a3 * 0.0174532925)) > v9;
}

- (id)annotationRectTest
{
  uint64_t v2 = (void *)[&__block_literal_global_57_24876 copy];
  return v2;
}

uint64_t __42__VKClassicGlobeCanvas_annotationRectTest__block_invoke()
{
  return 2;
}

- (id)attributionsForCurrentRegion
{
  return 0;
}

- (NSArray)visibleTileSets
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v106 = [MEMORY[0x1E4F1CA48] array];
  globe = self->_globe;
  v113 = 0;
  uint64_t v114 = 0;
  v112 = &v113;
  uint64_t v4 = globe[57];
  if (v4)
  {
    double v5 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)v4 + 56))(v4);
    uint64_t v6 = *v5;
    if (v5[1] != *v5)
    {
      unint64_t v7 = 0;
      int v8 = 0;
      id v104 = v5;
      while (1)
      {
        int v105 = v8;
        long double v9 = *(void **)(v6 + 8 * v7);
        v116[0] = 0;
        v116[1] = 0;
        v115 = v116;
        uint64_t v10 = v9[41];
        if (v10)
        {
          v118 = 0;
          uint64_t v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(void **)(v10 + 24), (void *)(v10 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        uint64_t v11 = v9[42];
        if (v11)
        {
          v118 = 0;
          uint64_t v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(void **)(v11 + 24), (void *)(v11 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        uint64_t v12 = v9[43];
        if (v12)
        {
          v118 = 0;
          uint64_t v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(void **)(v12 + 24), (void *)(v12 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        uint64_t v13 = v9[44];
        if (v13)
        {
          v118 = 0;
          uint64_t v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(void **)(v13 + 24), (void *)(v13 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        uint64_t v14 = v9[45];
        if (v14)
        {
          v118 = 0;
          uint64_t v119 = 0;
          v117 = &v118;
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v117, *(void **)(v14 + 24), (void *)(v14 + 32));
          std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v115, v117, &v118);
          std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v118);
        }
        uint64_t v15 = (uint64_t)v115;
        if (v115 != v116) {
          break;
        }
LABEL_4:
        std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v116[0]);
        unint64_t v7 = (v105 + 1);
        self = (VKClassicGlobeCanvas *)&v118;
        uint64_t v6 = *v104;
        int v8 = v105 + 1;
        if (v7 >= (v104[1] - *v104) >> 3) {
          goto LABEL_148;
        }
      }
LABEL_18:
      unsigned int v16 = *(_DWORD *)(v15 + 28);
      unsigned int v17 = *(_DWORD *)(v15 + 40);
      int v107 = *(_DWORD *)(v15 + 44);
      uint64_t v18 = *(unsigned int *)(v15 + 48);
      uint64_t v19 = *(unsigned int *)(v15 + 52);
      unint64_t v20 = &v113;
      uint64_t v21 = &v113;
      uint64_t v22 = v113;
      if (v113)
      {
        while (1)
        {
          while (1)
          {
            unint64_t v20 = (void **)v22;
            unsigned int v23 = *((_DWORD *)v22 + 8);
            if (v16 >= v23) {
              break;
            }
            uint64_t v22 = *v20;
            uint64_t v21 = v20;
            if (!*v20) {
              goto LABEL_25;
            }
          }
          if (v23 >= v16) {
            break;
          }
          uint64_t v22 = v20[1];
          if (!v22)
          {
            uint64_t v21 = v20 + 1;
            goto LABEL_25;
          }
        }
        unint64_t v24 = (char *)v20;
      }
      else
      {
LABEL_25:
        unint64_t v24 = (char *)operator new(0x40uLL);
        *((_DWORD *)v24 + 8) = v16;
        *((void *)v24 + 7) = 0;
        *((void *)v24 + 6) = 0;
        *((void *)v24 + 5) = v24 + 48;
        *(void *)unint64_t v24 = 0;
        *((void *)v24 + 1) = 0;
        *((void *)v24 + 2) = v20;
        *uint64_t v21 = v24;
        v25 = v24;
        if (*v112)
        {
          v112 = (void **)*v112;
          v25 = (void *)*v21;
        }
        uint64_t v26 = v113;
        BOOL v27 = v25 == v113;
        *((unsigned char *)v25 + 24) = v25 == v113;
        if (!v27)
        {
          do
          {
            uint64_t v28 = v25[2];
            if (*(unsigned char *)(v28 + 24)) {
              break;
            }
            int v29 = *(void **)(v28 + 16);
            uint64_t v30 = *v29;
            if (*v29 == v28)
            {
              uint64_t v33 = v29[1];
              if (!v33 || (v34 = *(unsigned __int8 *)(v33 + 24), uint64_t v31 = (unsigned char *)(v33 + 24), v34))
              {
                if (*(void **)v28 == v25)
                {
                  uint64_t v35 = (uint64_t *)v25[2];
                }
                else
                {
                  uint64_t v35 = *(uint64_t **)(v28 + 8);
                  uint64_t v36 = *v35;
                  *(void *)(v28 + 8) = *v35;
                  if (v36)
                  {
                    *(void *)(v36 + 16) = v28;
                    int v29 = *(void **)(v28 + 16);
                  }
                  v35[2] = (uint64_t)v29;
                  *(void *)(*(void *)(v28 + 16) + 8 * (**(void **)(v28 + 16) != v28)) = v35;
                  *uint64_t v35 = v28;
                  *(void *)(v28 + 16) = v35;
                  int v29 = (void *)v35[2];
                  uint64_t v28 = *v29;
                }
                *((unsigned char *)v35 + 24) = 1;
                *((unsigned char *)v29 + 24) = 0;
                uint64_t v39 = *(void *)(v28 + 8);
                *int v29 = v39;
                if (v39) {
                  *(void *)(v39 + 16) = v29;
                }
                *(void *)(v28 + 16) = v29[2];
                *(void *)(v29[2] + 8 * (*(void *)v29[2] != (void)v29)) = v28;
                *(void *)(v28 + 8) = v29;
                goto LABEL_55;
              }
            }
            else if (!v30 || (int v32 = *(unsigned __int8 *)(v30 + 24), v31 = (unsigned char *)(v30 + 24), v32))
            {
              if (*(void **)v28 == v25)
              {
                uint64_t v37 = v25[1];
                *(void *)uint64_t v28 = v37;
                if (v37)
                {
                  *(void *)(v37 + 16) = v28;
                  int v29 = *(void **)(v28 + 16);
                }
                v25[2] = v29;
                *(void *)(*(void *)(v28 + 16) + 8 * (**(void **)(v28 + 16) != v28)) = v25;
                v25[1] = v28;
                *(void *)(v28 + 16) = v25;
                int v29 = (void *)v25[2];
              }
              else
              {
                v25 = (void *)v25[2];
              }
              *((unsigned char *)v25 + 24) = 1;
              *((unsigned char *)v29 + 24) = 0;
              uint64_t v28 = v29[1];
              id v38 = *(void **)v28;
              v29[1] = *(void *)v28;
              if (v38) {
                v38[2] = v29;
              }
              *(void *)(v28 + 16) = v29[2];
              *(void *)(v29[2] + 8 * (*(void *)v29[2] != (void)v29)) = v28;
              *(void *)uint64_t v28 = v29;
LABEL_55:
              v29[2] = v28;
              break;
            }
            *(unsigned char *)(v28 + 24) = 1;
            v25 = v29;
            *((unsigned char *)v29 + 24) = v29 == v26;
            *uint64_t v31 = 1;
          }
          while (v29 != v26);
        }
        ++v114;
      }
      int v41 = (char **)(v24 + 48);
      v40 = (char *)*((void *)v24 + 6);
      v42 = (char **)(v24 + 48);
      v43 = (char **)(v24 + 48);
      if (v40)
      {
        while (1)
        {
          while (1)
          {
            v43 = (char **)v40;
            unsigned int v44 = *((_DWORD *)v40 + 8);
            if (v17 >= v44) {
              break;
            }
            v40 = *v43;
            v42 = v43;
            if (!*v43) {
              goto LABEL_64;
            }
          }
          if (v44 >= v17) {
            break;
          }
          v40 = v43[1];
          if (!v40)
          {
            v42 = v43 + 1;
            goto LABEL_64;
          }
        }
        v45 = (char *)v43;
        int v49 = v107;
      }
      else
      {
LABEL_64:
        v45 = (char *)operator new(0x40uLL);
        *((_DWORD *)v45 + 8) = v17;
        *((void *)v45 + 7) = 0;
        *((void *)v45 + 6) = 0;
        *((void *)v45 + 5) = v45 + 48;
        *(void *)v45 = 0;
        *((void *)v45 + 1) = 0;
        *((void *)v45 + 2) = v43;
        altitude::GlobeView *v42 = v45;
        uint64_t v46 = **((void **)v24 + 5);
        int v47 = v45;
        if (v46)
        {
          *((void *)v24 + 5) = v46;
          int v47 = *v42;
        }
        v48 = *v41;
        BOOL v27 = v47 == *v41;
        v47[24] = v27;
        int v49 = v107;
        if (!v27)
        {
          do
          {
            uint64_t v50 = *((void *)v47 + 2);
            if (*(unsigned char *)(v50 + 24)) {
              break;
            }
            float v51 = *(char **)(v50 + 16);
            uint64_t v52 = *(void *)v51;
            if (*(void *)v51 == v50)
            {
              uint64_t v55 = *((void *)v51 + 1);
              if (!v55 || (v56 = *(unsigned __int8 *)(v55 + 24), float v53 = (unsigned char *)(v55 + 24), v56))
              {
                if (*(char **)v50 == v47)
                {
                  v57 = (uint64_t *)*((void *)v47 + 2);
                }
                else
                {
                  v57 = *(uint64_t **)(v50 + 8);
                  uint64_t v58 = *v57;
                  *(void *)(v50 + 8) = *v57;
                  if (v58)
                  {
                    *(void *)(v58 + 16) = v50;
                    float v51 = *(char **)(v50 + 16);
                  }
                  v57[2] = (uint64_t)v51;
                  *(void *)(*(void *)(v50 + 16) + 8 * (**(void **)(v50 + 16) != v50)) = v57;
                  uint64_t *v57 = v50;
                  *(void *)(v50 + 16) = v57;
                  float v51 = (char *)v57[2];
                  uint64_t v50 = *(void *)v51;
                }
                *((unsigned char *)v57 + 24) = 1;
                v51[24] = 0;
                uint64_t v61 = *(void *)(v50 + 8);
                *(void *)float v51 = v61;
                if (v61) {
                  *(void *)(v61 + 16) = v51;
                }
                *(void *)(v50 + 16) = *((void *)v51 + 2);
                *(void *)(*((void *)v51 + 2) + 8 * (**((void **)v51 + 2) != (void)v51)) = v50;
                *(void *)(v50 + 8) = v51;
                goto LABEL_94;
              }
            }
            else if (!v52 || (v54 = *(unsigned __int8 *)(v52 + 24), float v53 = (unsigned char *)(v52 + 24), v54))
            {
              if (*(char **)v50 == v47)
              {
                uint64_t v59 = *((void *)v47 + 1);
                *(void *)uint64_t v50 = v59;
                if (v59)
                {
                  *(void *)(v59 + 16) = v50;
                  float v51 = *(char **)(v50 + 16);
                }
                *((void *)v47 + 2) = v51;
                *(void *)(*(void *)(v50 + 16) + 8 * (**(void **)(v50 + 16) != v50)) = v47;
                *((void *)v47 + 1) = v50;
                *(void *)(v50 + 16) = v47;
                float v51 = (char *)*((void *)v47 + 2);
              }
              else
              {
                int v47 = (char *)*((void *)v47 + 2);
              }
              v47[24] = 1;
              v51[24] = 0;
              uint64_t v50 = *((void *)v51 + 1);
              float v60 = *(char **)v50;
              *((void *)v51 + 1) = *(void *)v50;
              if (v60) {
                *((void *)v60 + 2) = v51;
              }
              *(void *)(v50 + 16) = *((void *)v51 + 2);
              *(void *)(*((void *)v51 + 2) + 8 * (**((void **)v51 + 2) != (void)v51)) = v50;
              *(void *)uint64_t v50 = v51;
LABEL_94:
              *((void *)v51 + 2) = v50;
              break;
            }
            *(unsigned char *)(v50 + 24) = 1;
            int v47 = v51;
            v51[24] = v51 == v48;
            *float v53 = 1;
          }
          while (v51 != v48);
        }
        ++*((void *)v24 + 7);
      }
      float v63 = (void **)(v45 + 48);
      float v62 = (char *)*((void *)v45 + 6);
      float v64 = (char **)(v45 + 48);
      v65 = v45 + 48;
      if (!v62) {
        goto LABEL_111;
      }
      while (1)
      {
        while (1)
        {
          v65 = v62;
          int v66 = *((_DWORD *)v62 + 7);
          if (v19 == v66) {
            break;
          }
          if ((int)v19 >= v66)
          {
            if (v66 >= (int)v19) {
              goto LABEL_142;
            }
            goto LABEL_109;
          }
LABEL_98:
          float v62 = *(char **)v65;
          float v64 = (char **)v65;
          if (!*(void *)v65) {
            goto LABEL_111;
          }
        }
        int v67 = *((_DWORD *)v65 + 8);
        if (v18 != v67)
        {
          if ((int)v18 >= v67)
          {
            if (v67 >= (int)v18) {
              goto LABEL_142;
            }
            goto LABEL_109;
          }
          goto LABEL_98;
        }
        int v68 = *((_DWORD *)v65 + 9);
        if (v49 < v68) {
          goto LABEL_98;
        }
        if (v68 >= v49) {
          goto LABEL_142;
        }
LABEL_109:
        float v62 = (char *)*((void *)v65 + 1);
        if (!v62)
        {
          float v64 = (char **)(v65 + 8);
LABEL_111:
          v69 = (char *)operator new(0x28uLL);
          *(void *)(v69 + 28) = (v18 << 32) | v19;
          *((_DWORD *)v69 + 9) = v49;
          *(void *)v69 = 0;
          *((void *)v69 + 1) = 0;
          *((void *)v69 + 2) = v65;
          *float v64 = v69;
          uint64_t v70 = **((void **)v45 + 5);
          if (v70)
          {
            *((void *)v45 + 5) = v70;
            v69 = *v64;
          }
          v71 = (char *)*v63;
          BOOL v27 = v69 == *v63;
          v69[24] = v27;
          if (!v27)
          {
            do
            {
              uint64_t v72 = *((void *)v69 + 2);
              if (*(unsigned char *)(v72 + 24)) {
                break;
              }
              float v73 = *(char **)(v72 + 16);
              uint64_t v74 = *(void *)v73;
              if (*(void *)v73 == v72)
              {
                uint64_t v77 = *((void *)v73 + 1);
                if (!v77 || (v78 = *(unsigned __int8 *)(v77 + 24), float v75 = (unsigned char *)(v77 + 24), v78))
                {
                  if (*(char **)v72 == v69)
                  {
                    id v79 = (uint64_t *)*((void *)v69 + 2);
                  }
                  else
                  {
                    id v79 = *(uint64_t **)(v72 + 8);
                    uint64_t v80 = *v79;
                    *(void *)(v72 + 8) = *v79;
                    if (v80)
                    {
                      *(void *)(v80 + 16) = v72;
                      float v73 = *(char **)(v72 + 16);
                    }
                    v79[2] = (uint64_t)v73;
                    *(void *)(*(void *)(v72 + 16) + 8 * (**(void **)(v72 + 16) != v72)) = v79;
                    *id v79 = v72;
                    *(void *)(v72 + 16) = v79;
                    float v73 = (char *)v79[2];
                    uint64_t v72 = *(void *)v73;
                  }
                  *((unsigned char *)v79 + 24) = 1;
                  v73[24] = 0;
                  uint64_t v83 = *(void *)(v72 + 8);
                  *(void *)float v73 = v83;
                  if (v83) {
                    *(void *)(v83 + 16) = v73;
                  }
                  *(void *)(v72 + 16) = *((void *)v73 + 2);
                  *(void *)(*((void *)v73 + 2) + 8 * (**((void **)v73 + 2) != (void)v73)) = v72;
                  *(void *)(v72 + 8) = v73;
                  goto LABEL_140;
                }
              }
              else if (!v74 || (v76 = *(unsigned __int8 *)(v74 + 24), float v75 = (unsigned char *)(v74 + 24), v76))
              {
                if (*(char **)v72 == v69)
                {
                  uint64_t v81 = *((void *)v69 + 1);
                  *(void *)uint64_t v72 = v81;
                  if (v81)
                  {
                    *(void *)(v81 + 16) = v72;
                    float v73 = *(char **)(v72 + 16);
                  }
                  *((void *)v69 + 2) = v73;
                  *(void *)(*(void *)(v72 + 16) + 8 * (**(void **)(v72 + 16) != v72)) = v69;
                  *((void *)v69 + 1) = v72;
                  *(void *)(v72 + 16) = v69;
                  float v73 = (char *)*((void *)v69 + 2);
                }
                else
                {
                  v69 = (char *)*((void *)v69 + 2);
                }
                v69[24] = 1;
                v73[24] = 0;
                uint64_t v72 = *((void *)v73 + 1);
                id v82 = *(char **)v72;
                *((void *)v73 + 1) = *(void *)v72;
                if (v82) {
                  *((void *)v82 + 2) = v73;
                }
                *(void *)(v72 + 16) = *((void *)v73 + 2);
                *(void *)(*((void *)v73 + 2) + 8 * (**((void **)v73 + 2) != (void)v73)) = v72;
                *(void *)uint64_t v72 = v73;
LABEL_140:
                *((void *)v73 + 2) = v72;
                break;
              }
              *(unsigned char *)(v72 + 24) = 1;
              v69 = v73;
              v73[24] = v73 == v71;
              *float v75 = 1;
            }
            while (v73 != v71);
          }
          ++*((void *)v45 + 7);
LABEL_142:
          id v84 = *(void **)(v15 + 8);
          if (v84)
          {
            do
            {
              id v85 = (void **)v84;
              id v84 = (void *)*v84;
            }
            while (v84);
          }
          else
          {
            do
            {
              id v85 = *(void ***)(v15 + 16);
              BOOL v27 = *v85 == (void *)v15;
              uint64_t v15 = (uint64_t)v85;
            }
            while (!v27);
          }
          uint64_t v15 = (uint64_t)v85;
          if (v85 == v116) {
            goto LABEL_4;
          }
          goto LABEL_18;
        }
      }
    }
  }
LABEL_148:
  id v86 = v112;
  if (v112 != &v113)
  {
    while (1)
    {
      id v87 = v86[5];
      if (v87 != v86 + 6) {
        break;
      }
LABEL_152:
      id v88 = v86[1];
      if (v88)
      {
        do
        {
          id v89 = (void **)v88;
          id v88 = (void *)*v88;
        }
        while (v88);
      }
      else
      {
        do
        {
          id v89 = (void **)v86[2];
          BOOL v27 = *v89 == v86;
          id v86 = v89;
        }
        while (!v27);
      }
      id v86 = v89;
      if (v89 == &v113) {
        goto LABEL_187;
      }
    }
    while (1)
    {
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v90 = v106;
      uint64_t v91 = [v90 countByEnumeratingWithState:&v108 objects:v120 count:16];
      if (v91)
      {
        id v92 = 0;
        uint64_t v93 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v91; ++i)
          {
            if (*(void *)v109 != v93) {
              objc_enumerationMutation(v90);
            }
            id v95 = *(void **)(*((void *)&v108 + 1) + 8 * i);
            if ([v95 style] == *((_DWORD *)v86 + 8)
              && [v95 identifier] == *((_DWORD *)v87 + 8))
            {
              id v96 = v95;

              id v92 = v96;
            }
          }
          uint64_t v91 = [v90 countByEnumeratingWithState:&v108 objects:v120 count:16];
        }
        while (v91);

        if (v92) {
          goto LABEL_170;
        }
      }
      else
      {
      }
      id v92 = objc_alloc_init(MEMORY[0x1E4F648D8]);
      [v92 setStyle:*((unsigned int *)v86 + 8)];
      [v92 setIdentifier:*((unsigned int *)v87 + 8)];
      [v90 addObject:v92];
LABEL_170:
      id v97 = (void *)v87[5];
      if (v97 != v87 + 6)
      {
        do
        {
          uint64_t v100 = *((unsigned int *)v97 + 9);
          self = (VKClassicGlobeCanvas *)((unint64_t)self & 0xFFFFFFF800000000 | v100 | 0x700000000);
          objc_msgSend(v92, "addTileKey:", *((unsigned int *)v97 + 7) | ((unint64_t)((1 << v100) + ~*((_DWORD *)v97 + 8)) << 32), self);
          id v101 = (void *)v97[1];
          if (v101)
          {
            do
            {
              id v102 = v101;
              id v101 = (void *)*v101;
            }
            while (v101);
          }
          else
          {
            do
            {
              id v102 = (void *)v97[2];
              BOOL v27 = *v102 == (void)v97;
              id v97 = v102;
            }
            while (!v27);
          }
          id v97 = v102;
        }
        while (v102 != v87 + 6);
      }

      id v98 = (void *)v87[1];
      if (v98)
      {
        do
        {
          id v99 = v98;
          id v98 = (void *)*v98;
        }
        while (v98);
      }
      else
      {
        do
        {
          id v99 = (void *)v87[2];
          BOOL v27 = *v99 == (void)v87;
          id v87 = v99;
        }
        while (!v27);
      }
      id v87 = v99;
      if (v99 == v86 + 6) {
        goto LABEL_152;
      }
    }
  }
LABEL_187:
  std::__tree<std::__value_type<unsigned int,std::map<unsigned int,std::set<altitude::SimpleTileKey>>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::map<unsigned int,std::set<altitude::SimpleTileKey>>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::map<unsigned int,std::set<altitude::SimpleTileKey>>>>>::destroy(v113);
  return (NSArray *)v106;
}

- (void)didPresent
{
  engine = (md::HomeQueueScheduler **)self->_engine;
  md::HomeQueueScheduler::waitForSynchronization(engine[567], "-[VKClassicGlobeCanvas didPresent]");
  uint64_t v4 = engine[108];
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)v4 + 28), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_signal(*((dispatch_semaphore_t *)v4 + 28));
  uint64_t v5 = (*(uint64_t (**)(void, void, uint64_t))(**((void **)self->_globe + 96) + 24))(*((void *)self->_globe + 96), 0, 0xFFFFFFFFLL);
  if (!v5) {
    goto LABEL_27;
  }
  uint64_t v6 = v5;
  unint64_t v7 = (void *)*((void *)self->_engine + 115);
  int8x8_t v8 = (int8x8_t)v7[1];
  if (!*(void *)&v8) {
    goto LABEL_25;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = 0xE42D19AFCA302E68;
    if (*(void *)&v8 <= 0xE42D19AFCA302E68) {
      unint64_t v10 = 0xE42D19AFCA302E68 % *(void *)&v8;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v8 - 1) & 0xE42D19AFCA302E68;
  }
  uint64_t v11 = *(void **)(*v7 + 8 * v10);
  if (!v11) {
    goto LABEL_25;
  }
  uint64_t v12 = (void *)*v11;
  if (!v12) {
    goto LABEL_25;
  }
  if (v9.u32[0] < 2uLL)
  {
    uint64_t v13 = *(void *)&v8 - 1;
    while (1)
    {
      uint64_t v15 = v12[1];
      if (v15 == 0xE42D19AFCA302E68)
      {
        if (v12[2] == 0xE42D19AFCA302E68) {
          goto LABEL_23;
        }
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_25;
      }
      uint64_t v12 = (void *)*v12;
      if (!v12) {
        goto LABEL_25;
      }
    }
  }
  while (1)
  {
    unint64_t v14 = v12[1];
    if (v14 == 0xE42D19AFCA302E68) {
      break;
    }
    if (v14 >= *(void *)&v8) {
      v14 %= *(void *)&v8;
    }
    if (v14 != v10) {
      goto LABEL_25;
    }
LABEL_12:
    uint64_t v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_25;
    }
  }
  if (v12[2] != 0xE42D19AFCA302E68) {
    goto LABEL_12;
  }
LABEL_23:
  uint64_t v16 = v12[5];
  if (*(void *)(v16 + 8) == 0xE42D19AFCA302E68)
  {
    uint64_t v17 = *(void *)(v16 + 32);
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v17 = 0;
LABEL_26:
  self->_currentZoomLevel = (float)(*(float *)(v17 + 100) + *(float *)(v5 + 1352));
  -[VKGlobeCameraController setCurrentZoomLevel:](self->_globeCameraController, "setCurrentZoomLevel:");
  [(VKARCameraController *)self->_arCameraController setCurrentZoomLevel:self->_currentZoomLevel];
  [(VKGlobeCameraController *)self->_globeCameraController setMaxZoomLevel:(float)(*(float *)(v17 + 100) + *(float *)(v6 + 1368))];
  [(VKGlobeCameraController *)self->_globeCameraController setMinZoomLevel:(float)(*(float *)(v17 + 100) + *(float *)(v6 + 1372))];
  [(VKARCameraController *)self->_arCameraController setMaxZoomLevel:(float)(*(float *)(v17 + 100) + *(float *)(v6 + 1368))];
LABEL_27:
  int isFlyoverTileAtTarget = altitude::GlobeView::isFlyoverTileAtTarget((altitude::GlobeView *)self->_globe);
  if (self->_canShowFlyover != isFlyoverTileAtTarget)
  {
    self->_canShowFlyover = isFlyoverTileAtTarget;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained map:self canShowFlyoverDidChange:self->_canShowFlyover];
  }
}

- (void)updateCameraForFrameResize
{
  [(MDRenderTarget *)self->super._displayTarget size];
  if (self->_lastCanvasSize.width != v3 || self->_lastCanvasSize.height != v4)
  {
    self->_lastCanvasSize.width = v3;
    self->_lastCanvasSize.height = v4;
    [(VKCameraController *)self->_globeCameraController beginRegionChange:0];
    [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
    int v7 = (int)v6;
    [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
    int v9 = (int)v8;
    if (v7 >= 1 && v9 >= 1)
    {
      globe = self->_globe;
      int v12 = globe[162];
      (*(void (**)(double *__return_ptr))(*(void *)globe + 32))(&v38);
      (*(void (**)(double *__return_ptr))(*(void *)self->_globe + 48))(&v37);
      if (self->_initialized) {
        int v13 = v12;
      }
      else {
        int v13 = v9;
      }
      double v14 = (float)((float)v9 / (float)v13);
      long double v15 = tan(v38 * 0.5);
      long double v16 = atan(v15 * v14);
      *(float *)&long double v16 = v16 + v16;
      float v17 = v37;
      double v18 = fminf(fmaxf(*(float *)&v16, 0.31416), v17);
      double v38 = v18;
      uint64_t v19 = self->_globe;
      *((double *)v19 + 35) = v18;
      double v20 = tan(v18 * 0.5);
      *((double *)v19 + 36) = v20;
      uint64_t v21 = (double *)*((void *)v19 + 9);
      double v23 = v21[46];
      double v22 = v21[47];
      if (v22 < v23)
      {
        double v24 = v22 * v23;
        double v25 = v23 / v22;
        if (v24 <= 0.0) {
          double v25 = 1.0;
        }
        long double v26 = atan(v25 * v20);
        double v18 = v26 + v26;
      }
      v21[57] = v18;
      uint64_t v27 = **(void **)(*((void *)v19 + 107) + 88);
      if (v27)
      {
        char v39 = 7;
        md::MapEngine::setNeedsTick(v27, &v39);
      }
      uint64_t v28 = (char *)self->_globe;
      *(void *)(v28 + 636) = 0;
      *((_DWORD *)v28 + 161) = v7;
      *((_DWORD *)v28 + 162) = v9;
      uint64_t v29 = **(void **)(*((void *)v28 + 107) + 88);
      if (v29)
      {
        char v39 = 7;
        md::MapEngine::setNeedsTick(v29, &v39);
      }
      uint64_t v30 = *((void *)v28 + 99);
      *(void *)(v30 + 40) = 0;
      *(_DWORD *)(v30 + 48) = v7;
      *(_DWORD *)(v30 + 52) = v9;
      [(MDRenderTarget *)self->super._displayTarget contentScale];
      if (v31 != 0.0)
      {
        if (v9 >= v7) {
          int v32 = v7;
        }
        else {
          int v32 = v9;
        }
        uint64_t v33 = (double *)self->_globe;
        double v34 = (double)v32;
        [(MDRenderTarget *)self->super._displayTarget contentScale];
        v33[48] = v34 * 0.001953125 / v35;
      }
    }
    v36.receiver = self;
    v36.super_class = (Class)VKClassicGlobeCanvas;
    [(VKScreenCanvas *)&v36 updateCameraForFrameResize];
    [(VKCameraController *)self->_globeCameraController endRegionChange];
  }
}

- (void)_update
{
  globe = self->_globe;
  if (*((unsigned char *)globe + 160))
  {
    double v20 = 0.0;
    uint64_t v4 = globe[89];
    *(_OWORD *)uint64_t v19 = *(_OWORD *)(globe[9] + 8);
    if (altitude::IntersectorHeight::heightAtLatLon(v4, v19, &v20, 0xEu) == 2)
    {
      uint64_t v5 = **(void **)(globe[107] + 88);
      if (v5)
      {
        LOBYTE(v19[0]) = 7;
        md::MapEngine::setNeedsTick(v5, v19);
      }
    }
    else
    {
      *((unsigned char *)globe + 160) = 0;
      *(double *)(globe[9] + 24) = v20 + *(double *)(globe[9] + 24);
    }
  }
  [(VKGlobeCameraController *)self->_globeCameraController updateCameraManager];
  if (altitude::GlobeView::needsUpdate((altitude::GlobeView *)self->_globe)
    || (+[VKDebugSettings sharedSettings],
        double v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 layoutContinuously],
        v6,
        v7))
  {
    double var0 = self->super._runLoopController->var0;
    if (var0)
    {
      LOBYTE(v19[0]) = 2;
      md::MapEngine::setNeedsTick((uint64_t)var0, v19);
    }
  }
  int v9 = (unsigned __int8 *)self->_globe;
  unsigned __int8 v10 = atomic_load(v9 + 832);
  BOOL v11 = v10 & 1;
  uint64_t v12 = *((void *)v9 + 78);
  if (v12 && *(_DWORD *)(v12 + 116) != 2)
  {
    char v14 = *(unsigned char *)(v12 + 252);
    if (v14)
    {
      if (!self->_tourIsDownloading) {
        (*(void (**)(void *))(*(void *)self->_loadingStatusTracker + 16))(self->_loadingStatusTracker);
      }
    }
    else if (self->_tourIsDownloading)
    {
      (*(void (**)(void *, void))(*(void *)self->_loadingStatusTracker + 24))(self->_loadingStatusTracker, 0);
    }
    self->_tourIsDownloading = v14;
    p_isDownloading = &self->_isDownloading;
    self->_isDownloading = v11;
    if (v11) {
      goto LABEL_32;
    }
  }
  else
  {
    if (self->_tourIsDownloading && !self->_isDownloading) {
      (*(void (**)(void *, void))(*(void *)self->_loadingStatusTracker + 24))(self->_loadingStatusTracker, 0);
    }
    self->_tourIsDownloading = 0;
    p_isDownloading = &self->_isDownloading;
    if (v11)
    {
      if (!self->_isDownloading) {
        (*(void (**)(void *))(*(void *)self->_loadingStatusTracker + 16))(self->_loadingStatusTracker);
      }
      BOOL *p_isDownloading = v11;
      goto LABEL_32;
    }
    if (self->_isDownloading) {
      (*(void (**)(void *, void))(*(void *)self->_loadingStatusTracker + 24))(self->_loadingStatusTracker, 0);
    }
    BOOL *p_isDownloading = 0;
  }
  if (!altitude::GlobeView::needsUpdate((altitude::GlobeView *)self->_globe))
  {
    long double v15 = [(VKClassicGlobeCanvas *)self sceneDidLoadCallback];

    if (v15)
    {
      long double v16 = [(VKClassicGlobeCanvas *)self sceneDidLoadCallback];
      v16[2](v16, 1);

      [(VKClassicGlobeCanvas *)self setSceneDidLoadCallback:0];
    }
  }
  if (*p_isDownloading)
  {
LABEL_32:
    int v17 = 0;
    self->_isLoading = 1;
    goto LABEL_33;
  }
  if (!self->_isLoading) {
    goto LABEL_34;
  }
  self->_isLoading = 0;
  int v17 = 2;
LABEL_33:
  gdc::LoadingStatusTracker::setSceneStatus((uint64_t)self->_loadingStatusTracker, v17);
LABEL_34:
  char v18 = *((unsigned char *)self->_globe + 272);
  if (!v18 && self->_coarseLoading) {
    gdc::LoadingStatusTracker::setSceneStatus((uint64_t)self->_loadingStatusTracker, 0);
  }
  self->_coarseLoading = v18;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VKClassicGlobeCanvas;
  [(VKScreenCanvas *)&v9 updateWithTimestamp:a4 withContext:a3];
  uint64_t v7 = 0x40F86A0000000000;
  uint64_t v8 = 0x4024000000000000;
  (*(void (**)(void *, uint64_t *, uint64_t *))(*(void *)self->_globe + 64))(self->_globe, &v8, &v7);
  ptr = self->super._camera.__ptr_;
  uint64_t v6 = v7;
  *((void *)ptr + 58) = v8;
  *((void *)ptr + 59) = v6;
  [(VKClassicGlobeCanvas *)self _update];
  [(VKClassicGlobeCanvas *)self _updateDebugSettings];
}

- (CGPoint)convertCoordinateToCameraModelPoint:(id)a3
{
  uint64_t v14 = 0;
  v13[0] = a3.var0 * 0.0174532925;
  v13[1] = a3.var1 * 0.0174532925;
  altitude::IntersectorHeight::heightAtLatLon(*((void *)self->_globe + 89), v13, (double *)&v14, 0xEu);
  long long v11 = *(_OWORD *)v13;
  uint64_t v12 = v14;
  if (altitude::GlobeView::getViewPositionAtLatLongHeight((void *)self->_globe, (double *)&v11, v10))
  {
    [(MDRenderTarget *)self->super._displayTarget contentScale];
    double v5 = (double)v10[0] / v4;
    [(MDRenderTarget *)self->super._displayTarget contentScale];
    double v7 = (double)v10[1] / v6;
    double v8 = trunc(v5);
    double v9 = trunc(v7);
  }
  else
  {
    double v8 = 9.22337204e18;
    double v9 = 9.22337204e18;
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)convertCoordinateToPoint:(id)a3
{
  globe = self->_globe;
  double v5 = a3.var1 * 0.0174532925;
  v40 = globe;
  __double2 v6 = __sincos_stret(a3.var0 * 0.0174532925);
  double v7 = 6378137.0 / sqrt(v6.__sinval * v6.__sinval * -0.00669437999 + 1.0);
  __double2 v8 = __sincos_stret(v5);
  v36.f64[0] = v7 * v6.__cosval * v8.__cosval;
  v36.f64[1] = v7 * v6.__cosval * v8.__sinval;
  double v37 = v7 * (0.99330562 * v6.__sinval);
  if (!altitude::Intersector::intersectAtPosition((uint64_t)&v40, &v36, &v38)) {
    goto LABEL_5;
  }
  uint64_t v9 = globe[66];
  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void, void))(*(void *)v9 + 24))(v9, 0, 0);
  long long v11 = (int32x2_t *)globe[99];
  double v12 = *(double *)(v10 + 144);
  double v13 = *(double *)(v10 + 176);
  double v14 = *(double *)(v10 + 208);
  float64x2_t v31 = *(float64x2_t *)(v10 + 120);
  float64x2_t v32 = *(float64x2_t *)(v10 + 152);
  float64x2_t v33 = *(float64x2_t *)(v10 + 184);
  float64x2_t v34 = *(float64x2_t *)(v10 + 216);
  double v15 = *(double *)(v10 + 240);
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v36.f64, (double *)(globe[9] + 8));
  if ((v38.f64[1] * v36.f64[1] + v39 * v37 + v38.f64[0] * v36.f64[0])
     / sqrt(v36.f64[0] * v36.f64[0] + v36.f64[1] * v36.f64[1] + v37 * v37) >= 0.0)
  {
    int32x2_t v16 = vsub_s32(v11[6], v11[5]);
    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v22 = vmulq_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v34, v31, v38.f64[0]), v32, v38.f64[1]), v33, v39), 1.0 / (v15 + v38.f64[0] * v12 + v38.f64[1] * v13 + v39 * v14)), _Q2);
    v23.i64[0] = v16.i32[0];
    v23.i64[1] = v16.i32[1];
    *(void *)&v24.f64[0] = *(_OWORD *)&vaddq_f64(v22, _Q2);
    v24.f64[1] = vsubq_f64(_Q2, v22).f64[1];
    *(int32x2_t *)&v35.f64[0] = vmovn_s64(vcvtq_s64_f64(vmulq_f64(v24, vcvtq_f64_s64(v23))));
    [(MDRenderTarget *)self->super._displayTarget contentScale];
    double v26 = (double)SLODWORD(v35.f64[0]) / v25;
    [(MDRenderTarget *)self->super._displayTarget contentScale];
    double v28 = (double)SHIDWORD(v35.f64[0]) / v27;
    double v29 = trunc(v26);
    double v30 = trunc(v28);
  }
  else
  {
LABEL_5:
    double v29 = 9.22337204e18;
    double v30 = 9.22337204e18;
  }
  result.y = v30;
  result.x = v29;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinateOnSphere:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MDRenderTarget *)self->super._displayTarget contentScale];
  v19[0] = (int)(v6 * x);
  [(MDRenderTarget *)self->super._displayTarget contentScale];
  v19[1] = (int)(v7 * y);
  double v16 = 0.0;
  double v17 = 0.0;
  uint64_t v18 = 0;
  globe = self->_globe;
  uint64_t v9 = globe[9];
  if (v9)
  {
    long long v10 = *(_OWORD *)(v9 + 8);
    uint64_t v15 = *(void *)(v9 + 24);
    long long v14 = v10;
  }
  else
  {
    long long v14 = 0uLL;
    uint64_t v15 = 0;
  }
  BOOL CoordAtScreenPosition = altitude::GlobeView::getCoordAtScreenPosition((uint64_t)globe, v19, (double *)&v14, (uint64_t)&v16, 0);
  if (CoordAtScreenPosition) {
    double v12 = v16 * 57.2957795;
  }
  else {
    double v12 = -180.0;
  }
  if (CoordAtScreenPosition) {
    double v13 = v17 * 57.2957795;
  }
  else {
    double v13 = -180.0;
  }
  result.double var1 = v13;
  result.double var0 = v12;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinate:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MDRenderTarget *)self->super._displayTarget contentScale];
  v13[0] = (int)(v6 * x);
  [(MDRenderTarget *)self->super._displayTarget contentScale];
  v13[1] = (int)(v7 * y);
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  BOOL LatLongAtViewPosition = altitude::GlobeView::getLatLongAtViewPosition((uint64_t)self->_globe, v13, &v11);
  if (LatLongAtViewPosition) {
    double v9 = *(double *)&v11 * 57.2957795;
  }
  else {
    double v9 = -180.0;
  }
  if (LatLongAtViewPosition) {
    double v10 = *((double *)&v11 + 1) * 57.2957795;
  }
  else {
    double v10 = -180.0;
  }
  result.double var1 = v10;
  result.double var0 = v9;
  return result;
}

- (CGPoint)convertMapPointToPoint:(id)a3
{
  GEOCoordinate2DForMapPoint();
  -[VKClassicGlobeCanvas convertCoordinateToPoint:](self, "convertCoordinateToPoint:");
  result.double y = v5;
  result.double x = v4;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToMapPoint:(CGPoint)a3
{
  -[VKClassicGlobeCanvas convertPointToCoordinate:](self, "convertPointToCoordinate:", a3.x, a3.y);
  GEOMapPointForCoordinate();
  result.double var1 = v4;
  result.double var0 = v3;
  return result;
}

- (void)stopAnimations
{
}

- (void)resumeFlyoverTourAnimation
{
  [(VKGlobeCameraController *)self->_globeCameraController resumeFlyoverTourAnimation];
  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    char v4 = 2;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v4);
  }
}

- (void)pauseFlyoverTourAnimation
{
}

- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v41 = a5;
  id v39 = a6;
  uint64_t v50 = &unk_1EF55A058;
  v40 = (void *)[v39 copy];
  uint64_t v51 = MEMORY[0x1A6239EB0]();

  double v10 = (void *)[v41 copy];
  v48 = &unk_1EF55A078;
  uint64_t v49 = MEMORY[0x1A6239EB0]();

  globe = self->_globe;
  v42 = self;
  geo::_retain_ptr<void({block_pointer} {__strong})(VKFlyoverTourState),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(&v43, (uint64_t)&v50);
  BOOL v45 = a4;
  geo::_retain_ptr<void({block_pointer} {__strong})(NSString *),geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(&v46, (uint64_t)&v48);
  uint64_t v58 = 0;
  uint64_t v12 = operator new(0x48uLL);
  *uint64_t v12 = &unk_1EF56CBD0;
  double v13 = v42;
  v12[3] = 0;
  v12[1] = v13;
  v12[2] = &unk_1EF55A058;
  uint64_t v14 = MEMORY[0x1A6239EB0](v44);
  uint64_t v15 = (void *)v12[3];
  v12[3] = v14;

  double v16 = v44;
  unsigned int v44 = 0;

  BOOL v17 = v45;
  v12[7] = 0;
  *((unsigned char *)v12 + 40) = v17;
  v12[6] = &unk_1EF55A078;
  uint64_t v18 = MEMORY[0x1A6239EB0](v47);
  uint64_t v19 = (void *)v12[7];
  v12[7] = v18;

  double v20 = v47;
  int v47 = 0;

  uint64_t v58 = v12;
  uint64_t v21 = globe[78];
  if (v21)
  {
    float64x2_t v22 = (void *)(*(uint64_t (**)(void *))(*v12 + 16))(v12);
    float v60 = v22;
    uint64_t v23 = *(void *)(v21 + 48);
    double v26 = *(void **)(v23 + 8);
    float64x2_t v24 = (void *)(v23 + 8);
    double v25 = v26;
    if (!v26) {
      goto LABEL_13;
    }
    double v27 = v24;
    do
    {
      unint64_t v28 = v25[4];
      BOOL v29 = v28 >= a3;
      if (v28 >= a3) {
        double v30 = v25;
      }
      else {
        double v30 = v25 + 1;
      }
      if (v29) {
        double v27 = v25;
      }
      double v25 = (void *)*v30;
    }
    while (*v30);
    if (v27 != v24 && v27[4] <= a3)
    {
      float64x2_t v32 = (void *)v27[5];
      if (!v32) {
        goto LABEL_39;
      }
      *(void *)&long long v61 = v32;
      if (v60)
      {
        (*(void (**)(void *, long long *))(*v60 + 48))(v60, &v61);

        goto LABEL_39;
      }
    }
    else
    {
LABEL_13:
      int v31 = *(_DWORD *)(v21 + 72);
      if ((v31 & 0x80000000) == 0)
      {
        if (*(void *)(v21 + 64))
        {
          LODWORD(v52) = 15;
          DWORD1(v52) = v31;
          *((void *)&v52 + 1) = 0;
          int v53 = 0;
          int v54 = -(int)a3;
          int v55 = HIDWORD(a3);
          int v56 = 0;
          *(void *)&long long v61 = v21;
          *((void *)&v61 + 1) = a3;
          if (v22)
          {
            if (v22 == v59)
            {
              float v63 = v62;
              (*(void (**)(void *, void *))(v59[0] + 24))(v59, v62);
              goto LABEL_26;
            }
            float64x2_t v22 = (void *)(*(uint64_t (**)(void *))(*v22 + 16))(v22);
          }
          float v63 = v22;
LABEL_26:
          v65 = 0;
          float64x2_t v33 = (char *)operator new(0x38uLL);
          float64x2_t v34 = v33;
          *(void *)float64x2_t v33 = &unk_1EF57DFC8;
          *(_OWORD *)(v33 + 8) = v61;
          if (v63)
          {
            if (v63 == v62)
            {
              *((void *)v33 + 6) = v33 + 24;
              (*(void (**)(void *))(v62[0] + 24))(v62);
            }
            else
            {
              *((void *)v33 + 6) = v63;
              float v63 = 0;
            }
          }
          else
          {
            *((void *)v33 + 6) = 0;
          }
          v65 = v34;
          altitude::FlyoverTour::checkLoading(v21, &v52, v64);
          if (v65 == v64)
          {
            (*(void (**)(void *))(v64[0] + 32))(v64);
          }
          else if (v65)
          {
            (*(void (**)(void))(*v65 + 40))();
          }
          if (v63 == v62)
          {
            (*(void (**)(void *))(v62[0] + 32))(v62);
          }
          else if (v63)
          {
            (*(void (**)(void))(*v63 + 40))();
          }
        }
LABEL_39:
        if (v60 == v59)
        {
          (*(void (**)(void *))(v59[0] + 32))(v59);
        }
        else if (v60)
        {
          (*(void (**)(void))(*v60 + 40))();
        }
        goto LABEL_43;
      }
      *(void *)&long long v61 = 0;
      if (v22)
      {
        (*(void (**)(void *, long long *))(*v22 + 48))(v22, &v61);

        goto LABEL_39;
      }
    }
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
    return;
  }
  *(void *)&long long v61 = 0;
  (*(void (**)(void *, long long *))(*v12 + 48))(v12, &v61);

LABEL_43:
  if (v58 == v57)
  {
    (*(void (**)(void *))(v57[0] + 32))(v57);
  }
  else if (v58)
  {
    (*(void (**)(void))(*v58 + 40))();
  }
  uint64_t v46 = &unk_1EF55A078;
  if (v47)
  {

    float64x2_t v35 = v47;
  }
  else
  {
    float64x2_t v35 = 0;
  }

  v43 = &unk_1EF55A058;
  if (v44)
  {

    float64x2_t v36 = v44;
  }
  else
  {
    float64x2_t v36 = 0;
  }

  v48 = &unk_1EF55A078;
  if (v49)
  {

    double v37 = (void *)v49;
  }
  else
  {
    double v37 = 0;
  }

  uint64_t v50 = &unk_1EF55A058;
  if (v51)
  {

    float64x2_t v38 = (void *)v51;
  }
  else
  {
    float64x2_t v38 = 0;
  }
}

- (uint64_t)startFlyoverTourAnimation:(uint64_t)a1 animateToStart:labelChanged:stateChange:
{
  *(void *)(a1 + 40) = &unk_1EF55A078;
  if (*(void *)(a1 + 48))
  {

    uint64_t v2 = *(void **)(a1 + 48);
  }
  else
  {
    uint64_t v2 = 0;
  }

  *(void *)(a1 + 8) = &unk_1EF55A058;
  if (*(void *)(a1 + 16))
  {

    double v3 = *(void **)(a1 + 16);
  }
  else
  {
    double v3 = 0;
  }

  return a1;
}

- (void)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  *(void *)a1 = &unk_1EF56CBD0;
  *(void *)(a1 + 48) = &unk_1EF55A078;
  if (*(void *)(a1 + 56))
  {

    uint64_t v2 = *(void **)(a1 + 56);
  }
  else
  {
    uint64_t v2 = 0;
  }

  *(void *)(a1 + 16) = &unk_1EF55A058;
  if (*(void *)(a1 + 24))
  {

    double v3 = *(void **)(a1 + 24);
  }
  else
  {
    double v3 = 0;
  }

  JUMPOUT(0x1A6239270);
}

- (uint64_t)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  *(void *)a1 = &unk_1EF56CBD0;
  *(void *)(a1 + 48) = &unk_1EF55A078;
  if (*(void *)(a1 + 56))
  {

    uint64_t v2 = *(void **)(a1 + 56);
  }
  else
  {
    uint64_t v2 = 0;
  }

  *(void *)(a1 + 16) = &unk_1EF55A058;
  if (*(void *)(a1 + 24))
  {

    double v3 = *(void **)(a1 + 24);
  }
  else
  {
    double v3 = 0;
  }

  return a1;
}

- (void)stopFlyoverAnimation
{
}

- (void)startFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
}

- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = 0uLL;
  memset(v23, 0, 24);
  if (v6)
  {
    objc_msgSend(v6, "cameraPathAtIndex:", 0, (unsigned __int128)0);
    long long v8 = *(_OWORD *)((char *)v23 + 8);
    uint64_t v9 = *(void *)&v23[0];
  }
  else
  {
    uint64_t v9 = 0;
  }
  globe = self->_globe;
  globe[160] = 0;
  uint64_t v11 = *((void *)globe + 9);
  *(_OWORD *)(v11 + 8) = v8;
  *(void *)(v11 + 24) = v9;
  ++*((_DWORD *)globe + 94);
  uint64_t v12 = **(void **)(*((void *)globe + 107) + 88);
  if (v12)
  {
    char v24 = 7;
    md::MapEngine::setNeedsTick(v12, &v24);
  }
  double v13 = (unsigned __int8 *)self->_globe;
  if (v13[184])
  {
    double v14 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)self->_globe);
    int v15 = v13[184];
    uint64_t v16 = *((void *)v13 + 9);
    *(double *)(v16 + 32) = fmin(0.0, fmax(fmin(*((double *)v13 + 50), 60592301.5), v14));
    if (v15) {
      *(double *)(v16 + 40) = fmax(*(double *)(v16 + 40), 0.0);
    }
  }
  else
  {
    *(void *)(*((void *)v13 + 9) + 32) = 0;
  }
  ++*((_DWORD *)v13 + 94);
  BOOL v17 = self->_globe;
  double v18 = 0.0;
  uint64_t v19 = v17[9];
  double v20 = fmax(0.0, 0.0);
  if (*((unsigned char *)v17 + 184)) {
    double v18 = v20;
  }
  *(double *)(v19 + 40) = v18;
  int v21 = *((_DWORD *)v17 + 94);
  long double v22 = fmod(0.0 + 3.14159265, 6.28318531);
  *(long double *)(v19 + 48) = fmod(v22 + 6.28318531, 6.28318531) + -3.14159265;
  *(void *)(v19 + 56) = 0;
  *((_DWORD *)v17 + 94) = v21 + 3;
  [(VKClassicGlobeCanvas *)self setSceneDidLoadCallback:v7];
}

- (id)createFlyoverPreTourAnimation:(id)a3 duration:(double)a4
{
  void (**v19)(void *__return_ptr, void, float);
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  float v24;
  float v25;
  BOOL v26;
  double v27;
  double v28;
  float v29;
  int8x16_t v30;
  id v31;
  long long v33;
  uint64_t v34;
  int8x16_t v35;
  int8x16_t v36;
  long long v37;
  uint64_t v38;
  int8x16_t v39;
  int8x16_t v40;
  _OWORD v41[3];
  uint64_t v42;
  long long v43;
  _OWORD v44[3];
  int8x16_t v45;
  uint64_t v46;
  unsigned char v47[40];
  void v48[11007];
  uint64_t vars8;

  uint64_t v4 = MEMORY[0x1F4188790](self);
  double v6 = v5;
  uint64_t v7 = v4;
  v48[11006] = *MEMORY[0x1E4F143B8];
  id v9 = v8;
  double v10 = v9;
  uint64_t v46 = 0;
  int8x16_t v11 = 0uLL;
  BOOL v45 = 0u;
  memset(v44, 0, sizeof(v44));
  v43 = 0u;
  if (v9)
  {
    [v9 cameraPathAtIndex:0];
    uint64_t v12 = *(void *)&v44[0];
    long long v13 = *(_OWORD *)((char *)v44 + 8);
    int8x16_t v14 = v45;
    int8x16_t v11 = *(int8x16_t *)((char *)&v44[1] + 8);
  }
  else
  {
    uint64_t v12 = 0;
    int8x16_t v14 = 0uLL;
    long long v13 = 0uLL;
  }
  uint64_t v15 = *(void *)(*(void *)(v7 + 744) + 72);
  uint64_t v16 = *(void *)(v15 + 56);
  BOOL v17 = *(void **)(v7 + 672);
  long long v18 = *(_OWORD *)(v15 + 24);
  v41[0] = *(_OWORD *)(v15 + 8);
  v41[1] = v18;
  v41[2] = *(_OWORD *)(v15 + 40);
  v42 = v16;
  double v37 = v13;
  float64x2_t v38 = v12;
  id v39 = vextq_s8(v14, v14, 8uLL);
  v40 = vextq_s8(v11, v11, 8uLL);
  uint64_t v19 = [v17 createMoveToZoomOutZoomInFrameFunction:v41 toLatLon:&v37];
  double v20 = v6 * 0.001;
  int v21 = v48;
  long double v22 = 0.0;
  uint64_t v23 = 1001;
  do
  {
    char v24 = v22;
    double v25 = v24 + v24;
    double v26 = v25 < 1.0;
    double v27 = (float)((float)((float)(v25 + -2.0) * (float)(v25 + -2.0)) * (float)(v25 + -2.0)) * 0.5 + 1.0;
    unint64_t v28 = v25 * v25 * (0.5 * v25);
    if (!v26) {
      unint64_t v28 = v27;
    }
    BOOL v29 = v28;
    ((void (**)(long long *__return_ptr, void, float))v19)[2](&v33, v19, v29);
    *(v21 - 3) = v34;
    double v30 = vextq_s8(v36, v36, 8uLL);
    *((_OWORD *)v21 - 1) = v33;
    *(int8x16_t *)int v21 = v30;
    *(int8x16_t *)(v21 + 3) = vextq_s8(v35, v35, 8uLL);
    *((double *)v21 + 2) = v20;
    *(v21 - 5) = 0x3F80000000000000;
    long double v22 = v22 + 0.001;
    v21 += 11;
    --v23;
  }
  while (v23);
  int v31 = objc_alloc_init(MEMORY[0x1E4F647D0]);
  [v31 setCameraPaths:v47 count:1001];

  return v31;
}

- (void)transferStateFromCanvas:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKClassicGlobeCanvas;
  [(VKScreenCanvas *)&v11 transferStateFromCanvas:v4];
  double v5 = [(VKScreenCanvas *)self cameraController];
  globeCameraController = self->_globeCameraController;

  if (v5 == globeCameraController)
  {
    [(VKScreenCanvas *)self camera];
    float v8 = gdc::DisplayZoomLevel::centerZoomLevel(v9, v7);
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
    self->_currentZoomLevel = v8;
    -[VKGlobeCameraController setCurrentZoomLevel:](self->_globeCameraController, "setCurrentZoomLevel:");
  }
}

- (CGPoint)_centerScreenPoint
{
  [(MDRenderTarget *)self->super._displayTarget size];
  double v3 = 0.0;
  BOOL v5 = v4 == 0.0;
  double v6 = 0.0;
  if (!v5)
  {
    [(MDRenderTarget *)self->super._displayTarget size];
    double v8 = v7;
    double v3 = 0.0;
    BOOL v5 = v8 == 0.0;
    double v6 = 0.0;
    if (!v5)
    {
      double top = self->super._edgeInsets.top;
      [(MDRenderTarget *)self->super._displayTarget size];
      double left = self->super._edgeInsets.left;
      double v12 = top / (v10 + v10);
      [(MDRenderTarget *)self->super._displayTarget size];
      double bottom = self->super._edgeInsets.bottom;
      double v15 = left / (v13 + v13);
      [(MDRenderTarget *)self->super._displayTarget size];
      double right = self->super._edgeInsets.right;
      double v18 = bottom / (v16 + v16);
      [(MDRenderTarget *)self->super._displayTarget size];
      float v20 = v12;
      float v21 = v15;
      float v22 = v18;
      *(float *)&double v19 = right / (v19 + v19);
      double v3 = v21 + 0.5 - *(float *)&v19;
      double v6 = 0.5 - v20 + v22;
    }
  }
  result.double y = v6;
  result.double x = v3;
  return result;
}

- (id)detailedDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  double v4 = [(VKClassicGlobeCanvas *)self description];
  BOOL v5 = (void *)[v3 initWithFormat:@"%@\n\n", v4];

  return v5;
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
}

- (void)setContentsScale:(double)a3
{
  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    ptr = self->_overlayContainer.__ptr_;
    if (ptr) {
      *((double *)ptr + 10) = a3;
    }
    [(VKClassicGlobeCanvas *)self _reloadStylesheet];
    globe = (altitude::GlobeView *)self->_globe;
    *(double *)(*(void *)(*((void *)globe + 107) + 136) + 32) = a3;
    altitude::GlobeView::updateLodScale(globe);
    [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
    if (v7 > 0.0)
    {
      [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
      if (v8 > 0.0)
      {
        id v9 = (char *)self->_globe;
        [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
        unsigned int v11 = v10;
        [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
        unsigned int v13 = v12;
        *(void *)(v9 + 636) = 0;
        *((_DWORD *)v9 + 161) = v11;
        *((_DWORD *)v9 + 162) = v12;
        uint64_t v14 = **(void **)(*((void *)v9 + 107) + 88);
        if (v14)
        {
          char v17 = 7;
          md::MapEngine::setNeedsTick(v14, &v17);
        }
        uint64_t v15 = *((void *)v9 + 99);
        *(void *)(v15 + 40) = 0;
        *(_DWORD *)(v15 + 48) = v11;
        *(_DWORD *)(v15 + 52) = v13;
      }
    }
    double var0 = self->super._runLoopController->var0;
    if (var0)
    {
      char v18 = 2;
      md::MapEngine::setNeedsTick((uint64_t)var0, &v18);
    }
  }
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  ptr = a3.__ptr_;
  BOOL v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v13 = *(void *)a3.__ptr_;
  uint64_t v14 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12.receiver = self;
  v12.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas setCamera:](&v12, sel_setCamera_, &v13, a3.__cntrl_);
  double v6 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  globeCameraController = self->_globeCameraController;
  double v8 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v10 = *(void *)ptr;
  unsigned int v11 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(VKGlobeCameraController *)globeCameraController setCamera:&v10];
  id v9 = v11;
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

- (const)_clientStyleState
{
  uint64_t v2 = (int8x8_t *)*((void *)self->super._mapEngine + 140);
  int8x8_t v3 = v2[2];
  if (!*(void *)&v3) {
    return (const void *)208;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    uint64_t v5 = 0x2FED70A4459DFCA1;
    if (*(void *)&v3 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v3;
    }
  }
  else
  {
    uint64_t v5 = (*(void *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  double v6 = *(void **)(*(void *)&v2[1] + 8 * v5);
  if (!v6) {
    return (const void *)208;
  }
  double v7 = (void *)*v6;
  if (!v7) {
    return (const void *)208;
  }
  if (v4.u32[0] < 2uLL)
  {
    uint64_t v8 = *(void *)&v3 - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1) {
          return (const void *)(v7[5] + 208);
        }
      }
      else if ((v10 & v8) != v5)
      {
        return (const void *)208;
      }
      double v7 = (void *)*v7;
      if (!v7) {
        return (const void *)208;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v9 >= *(void *)&v3) {
      v9 %= *(void *)&v3;
    }
    if (v9 != v5) {
      return (const void *)208;
    }
LABEL_11:
    double v7 = (void *)*v7;
    if (!v7) {
      return (const void *)208;
    }
  }
  if (v7[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_11;
  }
  return (const void *)(v7[5] + 208);
}

- (const)_styleManager
{
  uint64_t v2 = (int8x8_t *)*((void *)self->super._mapEngine + 140);
  int8x8_t v3 = v2[2];
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8(v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      uint64_t v5 = 0x2FED70A4459DFCA1;
      if (*(void *)&v3 <= 0x2FED70A4459DFCA1uLL) {
        uint64_t v5 = 0x2FED70A4459DFCA1uLL % *(void *)&v3;
      }
    }
    else
    {
      uint64_t v5 = (*(void *)&v3 - 1) & 0x2FED70A4459DFCA1;
    }
    double v6 = *(uint64_t ****)(*(void *)&v2[1] + 8 * v5);
    if (v6)
    {
      double v7 = *v6;
      if (v7)
      {
        if (v4.u32[0] < 2uLL)
        {
          uint64_t v8 = *(void *)&v3 - 1;
          while (1)
          {
            uint64_t v10 = v7[1];
            if (v10 == (uint64_t *)0x2FED70A4459DFCA1)
            {
              if (v7[2] == (uint64_t *)0x2FED70A4459DFCA1) {
                return md::StyleLogic::globeContext((md::StyleLogic *)v7[5]);
              }
            }
            else if (((unint64_t)v10 & v8) != v5)
            {
              return md::StyleLogic::globeContext(0);
            }
            double v7 = (uint64_t **)*v7;
            if (!v7) {
              return md::StyleLogic::globeContext(0);
            }
          }
        }
        do
        {
          unint64_t v9 = (unint64_t)v7[1];
          if (v9 == 0x2FED70A4459DFCA1)
          {
            if (v7[2] == (uint64_t *)0x2FED70A4459DFCA1) {
              return md::StyleLogic::globeContext((md::StyleLogic *)v7[5]);
            }
          }
          else
          {
            if (v9 >= *(void *)&v3) {
              v9 %= *(void *)&v3;
            }
            if (v9 != v5) {
              return md::StyleLogic::globeContext(0);
            }
          }
          double v7 = (uint64_t **)*v7;
        }
        while (v7);
      }
    }
  }
  return md::StyleLogic::globeContext(0);
}

- (void)_reloadStylesheet
{
  int8x8_t v3 = [(VKClassicGlobeCanvas *)self _styleManager];
  if (*v3)
  {
    value = self->_globeAdapter.__ptr_.__value_;
    if (value) {
      md::LabelManager::setStyleManager(*((md::LabelManager **)value + 10), *v3, v3[1]);
    }
    engine = (md::HomeQueueScheduler **)self->_engine;
    md::HomeQueueScheduler::waitForSynchronization(engine[567], "-[VKClassicGlobeCanvas _reloadStylesheet]");
    if (engine[108])
    {
      globe = (altitude::GlobeView *)self->_globe;
      uint64_t v7 = *(void *)(*(void *)(*((void *)globe + 107) + 40) + 16);
      uint64_t v8 = *(void *)(v7 + 240);
      if (v8)
      {
        int v9 = *(unsigned __int8 *)(v8 + 136);
        altitude::RoadRequestManager::disable(*(pthread_mutex_t ***)(v7 + 240));
        (*(void (**)(void))(**(void **)(v8 + 104) + 120))(*(void *)(v8 + 104));
        if (v9) {
          *(unsigned char *)(v8 + 136) = 1;
        }
      }
      uint64_t v10 = *(void **)(*(void *)(*(void *)(*((void *)globe + 107) + 40) + 24) + 152);
      if (v10) {
        altitude::SkeletonRequestManager::setStyleManager(v10, *((void *)globe + 76), *((void *)globe + 77));
      }
      altitude::GlobeView::updateLodScale(globe);
      unsigned int v11 = (altitude::GlobeCleanupLoader *)*((void *)globe + 56);
      if (v11)
      {
        unsigned int v12 = *(_DWORD *)(*((void *)v11 + 4) + 88) + 1;
        altitude::GlobeCleanupLoader::pruneTrafficComponents(v11, v12, v12);
        uint64_t v13 = (altitude::GlobeCleanupLoader *)*((void *)globe + 56);
        unsigned int v14 = *(_DWORD *)(*((void *)v13 + 4) + 88) + 1;
        altitude::GlobeCleanupLoader::pruneRoadComponents(v13, v14, v14);
      }
    }
  }
}

- (id)consoleString:(BOOL)a3
{
  engine = (md::HomeQueueScheduler **)self->_engine;
  md::HomeQueueScheduler::waitForSynchronization(engine[567], "-[VKClassicGlobeCanvas consoleString:]");
  if (!engine[108])
  {
    double v19 = &stru_1EF593218;
    goto LABEL_48;
  }
  globe = self->_globe;
  uint64_t v6 = (*(uint64_t (**)(void))(**((void **)globe + 57) + 56))(*((void *)globe + 57));
  uint64_t v8 = *(const void **)v6;
  uint64_t v7 = *(void *)(v6 + 8);
  int64_t v9 = v7 - *(void *)v6;
  if (v7 == *(void *)v6)
  {
    __int16 v22 = 0;
    __int16 v23 = 0;
    __int16 v24 = 0;
    uint64_t v20 = 0xFFFFFFFFLL;
    uint64_t v21 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (v9 < 0) {
    abort();
  }
  uint64_t v10 = (char *)operator new(v7 - *(void *)v6);
  unsigned int v11 = &v10[8 * (v9 >> 3)];
  memcpy(v10, v8, v9);
  unsigned int v12 = v10;
  while (1)
  {
    uint64_t v13 = *(void *)(*(void *)v12 + 328);
    if (*(unsigned char *)(v13 + 296)) {
      goto LABEL_6;
    }
    v71[0] = 0;
    v71[1] = 0;
    uint64_t v70 = v71;
    std::set<altitude::TileKey>::insert[abi:nn180100]<std::__tree_const_iterator<altitude::TileKey,std::__tree_node<altitude::TileKey,void *> *,long>>((uint64_t *)&v70, *(void **)(v13 + 24), (void *)(v13 + 32));
    uint64_t v14 = (uint64_t)v70;
    if (v70 != v71) {
      break;
    }
LABEL_5:
    std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v71[0]);
LABEL_6:
    v12 += 8;
    if (v12 == v11)
    {
      LOWORD(v9) = 0;
      __int16 v22 = 0;
      __int16 v23 = 0;
      __int16 v24 = 0;
      uint64_t v20 = 0xFFFFFFFFLL;
      uint64_t v21 = 0xFFFFFFFFLL;
      goto LABEL_21;
    }
  }
  while (1)
  {
    int v15 = *(_DWORD *)(v14 + 28);
    if (v15 == 15 || v15 == 42) {
      break;
    }
    double v16 = *(void **)(v14 + 8);
    if (v16)
    {
      do
      {
        char v17 = (void **)v16;
        double v16 = (void *)*v16;
      }
      while (v16);
    }
    else
    {
      do
      {
        char v17 = *(void ***)(v14 + 16);
        BOOL v18 = *v17 == (void *)v14;
        uint64_t v14 = (uint64_t)v17;
      }
      while (!v18);
    }
    uint64_t v14 = (uint64_t)v17;
    if (v17 == v71) {
      goto LABEL_5;
    }
  }
  uint64_t v20 = *(unsigned int *)(v14 + 32);
  uint64_t v21 = *(unsigned int *)(v14 + 40);
  LOWORD(v9) = *(_WORD *)(v13 + 298);
  __int16 v22 = *(_WORD *)(v13 + 300);
  __int16 v23 = *(_WORD *)(v13 + 302);
  __int16 v24 = *(_WORD *)(v13 + 304);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v71[0]);
LABEL_21:
  operator delete(v10);
LABEL_23:
  double v25 = objc_msgSend(NSString, "stringWithFormat:", @"Flyover region: %d version: %d C3M version: %d.%d C3MM version: %d.%d\n", v20, v21, (__int16)v9, v22, v23, v24);
  double v26 = [&stru_1EF593218 stringByAppendingString:v25];
  double v27 = (unsigned int *)*((void *)globe + 56);
  if (v27)
  {
    uint64_t v28 = v27[88];
    uint64_t v29 = v27[82];
    unsigned int v30 = v27[97];
    uint64_t v31 = v27[46];
    unsigned int v32 = v27[95];
    LODWORD(v27) = v32 / v31;
    unsigned int v33 = v30 / v29;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    unsigned int v30 = 0;
    unsigned int v32 = 0;
    uint64_t v31 = 0;
    unsigned int v33 = 0;
  }
  float64x2_t v34 = [NSString stringWithFormat:@"Tiles: %d BaseSurface: %d (%d kB, avg: %d kB) Geometry: %d (%d kB, avg: %d kB)\n", v28, v29, v30 >> 10, v33 >> 10, v31, v32 >> 10, v27 >> 10];
  float64x2_t v35 = [v26 stringByAppendingString:v34];

  uint64_t v36 = (*(uint64_t (**)(void, void, uint64_t))(**((void **)globe + 66) + 24))(*((void *)globe + 66), 0, 0xFFFFFFFFLL);
  double v37 = (double *)(*(uint64_t (**)(void))(*(void *)(v36 + 40) + 24))();
  long double v39 = v37[1];
  long double v38 = v37[2];
  long double v40 = *v37;
  double v41 = sqrt(v40 * v40 + v39 * v39);
  double v42 = atan2(v38, v41 * 0.996647189);
  __double2 v43 = __sincos_stret(v42);
  long double v44 = atan2(v38 + v43.__sinval * v43.__sinval * 42841.3115 * v43.__sinval, v41 + v43.__cosval * v43.__cosval * -42697.6727 * v43.__cosval);
  long double v45 = tan(v44 * 0.5 + 0.785398163);
  log(v45);
  atan2(v39, v40);
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)&v70);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v70, (uint64_t)"level: ", 7);
  uint64_t v46 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v46, (uint64_t)"  lat: ", 7);
  int v47 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v47, (uint64_t)"  lon: ", 7);
  v48 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v48, (uint64_t)"  height: ", 10);
  std::ostream::operator<<();
  uint64_t v49 = NSString;
  if ((v78 & 0x10) != 0)
  {
    unint64_t v52 = v77;
    if (v77 < v74)
    {
      unint64_t v77 = v74;
      unint64_t v52 = v74;
    }
    int v53 = (const void **)&v73;
  }
  else
  {
    if ((v78 & 8) == 0)
    {
      size_t v50 = 0;
      HIBYTE(v69) = 0;
      uint64_t v51 = __dst;
      goto LABEL_41;
    }
    int v53 = (const void **)v72;
    unint64_t v52 = v72[2];
  }
  int v54 = *v53;
  size_t v50 = v52 - (void)*v53;
  if (v50 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (v50 >= 0x17)
  {
    uint64_t v55 = (v50 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v50 | 7) != 0x17) {
      uint64_t v55 = v50 | 7;
    }
    uint64_t v56 = v55 + 1;
    uint64_t v51 = (void **)operator new(v55 + 1);
    __dst[1] = (void *)v50;
    int64_t v69 = v56 | 0x8000000000000000;
    __dst[0] = v51;
    goto LABEL_40;
  }
  HIBYTE(v69) = v52 - *(unsigned char *)v53;
  uint64_t v51 = __dst;
  if (v50) {
LABEL_40:
  }
    memmove(v51, v54, v50);
LABEL_41:
  *((unsigned char *)v51 + v50) = 0;
  v57 = __dst;
  if (v69 < 0) {
    v57 = (void **)__dst[0];
  }
  uint64_t v58 = objc_msgSend(v49, "stringWithFormat:", @"Tile id at camera position: %s\n", v57);
  if (SHIBYTE(v69) < 0) {
    operator delete(__dst[0]);
  }
  double v19 = [v35 stringByAppendingString:v58];

  uint64_t v70 = (void **)*MEMORY[0x1E4FBA418];
  *(void **)((char *)&v71[-1] + (void)*(v70 - 3)) = *(void **)(MEMORY[0x1E4FBA418] + 24);
  v71[0] = (void *)(MEMORY[0x1E4FBA470] + 16);
  if (v76 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A62391A0](&v79);

LABEL_48:
  if (self->_globeAdapter.__ptr_.__value_)
  {
    uint64_t v59 = *((void *)self->super._mapEngine + 140);
    unint64_t v60 = *(void *)(v59 + 16);
    if ((v60 & (v60 - 1)) != 0)
    {
      unint64_t v62 = 0x20A1ED17D78F322BLL;
      if (v60 <= 0x20A1ED17D78F322BLL) {
        unint64_t v62 = 0x20A1ED17D78F322BLL % v60;
      }
      long long v61 = *(void **)(*(void *)(v59 + 8) + 8 * v62);
      do
      {
        do
          long long v61 = (void *)*v61;
        while (v61[1] != 0x20A1ED17D78F322BLL);
      }
      while (v61[2] != 0x20A1ED17D78F322BLL);
    }
    else
    {
      long long v61 = *(void **)(*(void *)(v59 + 8) + 8 * ((v60 - 1) & 0x20A1ED17D78F322BLL));
      do
      {
        do
          long long v61 = (void *)*v61;
        while (v61[1] != 0x20A1ED17D78F322BLL);
      }
      while (v61[2] != 0x20A1ED17D78F322BLL);
    }
    float v63 = NSString;
    float v64 = md::LabelSettings::debugLabelString(*(md::LabelSettings **)(*(void *)(v61[5] + 144) + 24), 0);
    v65 = [v63 stringWithFormat:@"%@", v64];
    uint64_t v66 = [(__CFString *)v19 stringByAppendingString:v65];

    double v19 = (__CFString *)v66;
  }
  return v19;
}

- (void)dealloc
{
  [(VKClassicGlobeCanvas *)self willDealloc];
  int8x8_t v3 = [MEMORY[0x1E4F64918] modernManager];
  [v3 removeTileGroupObserver:self];

  *self->_isDead.__ptr_ = 1;
  uint8x8_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)VKClassicGlobeCanvas;
  [(VKScreenCanvas *)&v5 dealloc];
}

- (void)willDealloc
{
  value = self->_globeAdapter.__ptr_.__value_;
  if (value)
  {
    md::GlobeAdapter::setGlobeView((md::GlobeAdapter *)value, 0);
    uint8x8_t v4 = self->_globeAdapter.__ptr_.__value_;
    self->_globeAdapter.__ptr_.__value_ = 0;
    if (v4)
    {
      md::GlobeAdapter::~GlobeAdapter((md::GlobeAdapter *)v4);
      MEMORY[0x1A6239270]();
    }
  }
  arCameraController = self->_arCameraController;
  self->_arCameraController = 0;

  globeCameraController = self->_globeCameraController;
  if (globeCameraController)
  {
    [(VKScreenCameraController *)globeCameraController stopAnimations];
    [(VKCameraController *)self->_globeCameraController setCameraDelegate:0];
    [(VKGlobeCameraController *)self->_globeCameraController setGlobeView:0];
    uint64_t v7 = self->_globeCameraController;
    self->_globeCameraController = 0;
  }
}

- (VKClassicGlobeCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VKClassicGlobeCanvas;
  objc_super v5 = [(VKScreenCanvas *)&v16 initWithMapEngine:a3 inBackground:a4];

  if (v5)
  {
    v5->_engine = a3;
    md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)a3 + 567), "-[VKClassicGlobeCanvas initWithMapEngine:inBackground:]");
    md::MapEngine::createFlyoverRenderer((uint64_t)v5->_engine);
    __asm { FMOV            V0.2D, #-1.0 }
    v5->_lastCanvasSize = _Q0;
    uint64_t v11 = *(void *)(*((void *)a3 + 3) + 24);
    uint64_t v13 = *(FlyoverLibrary **)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 40);
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v5->_flyoverLibrary.__cntrl_;
    v5->_flyoverLibrary.__ptr_ = v13;
    v5->_flyoverLibrary.__cntrl_ = (__shared_weak_count *)v12;
    if (cntrl)
    {
      if (!atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    operator new();
  }

  return 0;
}

uint64_t __55__VKClassicGlobeCanvas_initWithMapEngine_inBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCameraController:*(void *)(*(void *)(a1 + 32) + 672)];
}

- (void)initWithMapEngine:inBackground:
{
  JUMPOUT(0x1A6239270);
}

- (id)initWithMapEngine:inBackground:
{
  int8x8_t v3 = *(void **)(a1 + 8);
  *a2 = &unk_1EF56C828;
  id result = v3;
  a2[1] = result;
  return result;
}

- (uint64_t)initWithMapEngine:inBackground:
{
  return a1;
}

- (void)stopLoading
{
  if (self->_isDownloading)
  {
    self->_isDownloading = 0;
    (*(void (**)(void *, void))(*(void *)self->_loadingStatusTracker + 24))(self->_loadingStatusTracker, 0);
  }
}

- (void)setMapType:(int)a3 animated:(BOOL)a4
{
  if (a3 == 3) {
    goto LABEL_11;
  }
  if (a3 != 4)
  {
    if (a3 == 10)
    {
      globe = self->_globe;
      globe[432] = 0;
      uint64_t v7 = **(void **)(*((void *)globe + 107) + 88);
      if (!v7) {
        goto LABEL_16;
      }
      char v23 = 7;
      uint64_t v8 = &v23;
      goto LABEL_15;
    }
    uint64_t v10 = *(void *)self->_overlayContainer.__ptr_;
    if (v10) {
      md::realistic::OverlayRenderLayer::clearOverlays(*(md::realistic::OverlayRenderLayer **)(*(void *)(*(void *)(v10 + 856) + 40)
    }
                                                                                             + 48));
LABEL_11:
    uint64_t v11 = self->_globe;
    v11[432] = 0;
    uint64_t v12 = **(void **)(*((void *)v11 + 107) + 88);
    if (v12)
    {
      char v22 = 7;
      md::MapEngine::setNeedsTick(v12, &v22);
    }
    goto LABEL_17;
  }
  int64_t v9 = self->_globe;
  if (self->_disableRoads)
  {
    v9[432] = 0;
    uint64_t v7 = **(void **)(*((void *)v9 + 107) + 88);
    if (!v7) {
      goto LABEL_16;
    }
    char v20 = 7;
    uint64_t v8 = &v20;
  }
  else
  {
    v9[432] = 1;
    uint64_t v7 = **(void **)(*((void *)v9 + 107) + 88);
    if (!v7) {
      goto LABEL_16;
    }
    char v21 = 7;
    uint64_t v8 = &v21;
  }
LABEL_15:
  md::MapEngine::setNeedsTick(v7, v8);
LABEL_16:
  if (self->_disableLabels)
  {
LABEL_17:
    altitude::GlobeView::disableLabelData((altitude::GlobeView *)self->_globe);
    goto LABEL_18;
  }
  uint64_t v13 = self->_globe;
  v13[433] = 1;
  uint64_t v14 = *(void *)(*(void *)(*((void *)v13 + 107) + 40) + 40);
  (*(void (**)(uint64_t, uint64_t, void, BOOL))(*(void *)v14 + 40))(v14, 1, 0, a4);
  int v15 = *(void **)(*(void *)(*((void *)v13 + 107) + 40) + 40);
  uint64_t v16 = v15[12];
  if (v16) {
    atomic_store(1u, (unsigned __int8 *)(v16 + 224));
  }
  uint64_t v17 = v15[10];
  if (v17) {
    atomic_store(1u, (unsigned __int8 *)(v17 + 224));
  }
  uint64_t v18 = v15[11];
  if (v18) {
    atomic_store(1u, (unsigned __int8 *)(v18 + 224));
  }
  uint64_t v19 = *(void *)(*(void *)(*(void *)(*((void *)v13 + 107) + 40) + 40) + 56);
  if (v19) {
    *(unsigned char *)(v19 + 136) = 1;
  }
LABEL_18:
  self->_mapType = a3;
  [(VKClassicGlobeCanvas *)self setupMapScene];
}

- (void)setMapType:(int)a3
{
}

- (BOOL)isPointValidForGesturing:(CGPoint)a3
{
  return 1;
}

- (void)exitARSession
{
  [(VKClassicGlobeCanvas *)self setDisableRoads:self->_arRoadDisabledState];
  globe = self->_globe;
  uint64_t v4 = globe[65];
  if (v4)
  {
    *(_DWORD *)((*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v4 + 24))(v4, 0, 0xFFFFFFFFLL)
              + 1296) = 0;
    globe = self->_globe;
  }
  *(_DWORD *)(*(void *)(globe[107] + 136) + 52) = 1036831949;
  uint64_t v5 = *(void *)[(VKClassicGlobeCanvas *)self _clientStyleState];
  if (v5) {
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v5, 0x10046u, 0);
  }
  uint64_t v6 = *((void *)self->super._mapEngine + 140);
  unint64_t v7 = *(void *)(v6 + 16);
  if ((v7 & (v7 - 1)) != 0)
  {
    unint64_t v9 = 0x20A1ED17D78F322BLL;
    if (v7 <= 0x20A1ED17D78F322BLL) {
      unint64_t v9 = 0x20A1ED17D78F322BLL % v7;
    }
    uint64_t v8 = *(void **)(*(void *)(v6 + 8) + 8 * v9);
    do
    {
      do
        uint64_t v8 = (void *)*v8;
      while (v8[1] != 0x20A1ED17D78F322BLL);
    }
    while (v8[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    uint64_t v8 = *(void **)(*(void *)(v6 + 8) + 8 * ((v7 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        uint64_t v8 = (void *)*v8;
      while (v8[1] != 0x20A1ED17D78F322BLL);
    }
    while (v8[2] != 0x20A1ED17D78F322BLL);
  }
  md::LabelSettings_Presentation::setInARMode(*(md::LabelSettings_Presentation **)(**(void **)(v8[5] + 144) + 24), 0);
  [(VKScreenCanvas *)self setCameraController:self->_globeCameraController];
  arCameraController = self->_arCameraController;
  self->_arCameraController = 0;

  uint64_t v11 = self->_globe;
  (*(void (**)(double *__return_ptr, void *))(*(void *)v11 + 48))(&v22, v11);
  double v12 = v22;
  *((double *)v11 + 35) = v22;
  double v13 = tan(v12 * 0.5);
  *((double *)v11 + 36) = v13;
  uint64_t v14 = (double *)*((void *)v11 + 9);
  double v16 = v14[46];
  double v15 = v14[47];
  if (v15 < v16)
  {
    double v17 = v15 * v16;
    double v18 = v16 / v15;
    if (v17 <= 0.0) {
      double v18 = 1.0;
    }
    long double v19 = atan(v18 * v13);
    double v12 = v19 + v19;
  }
  v14[57] = v12;
  uint64_t v20 = **(void **)(*((void *)v11 + 107) + 88);
  if (v20)
  {
    char v23 = 7;
    md::MapEngine::setNeedsTick(v20, &v23);
  }
  v21.receiver = self;
  v21.super_class = (Class)VKClassicGlobeCanvas;
  [(VKScreenCanvas *)&v21 exitARSession];
}

- (void)enterARSessionAtCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v24.receiver = self;
  v24.super_class = (Class)VKClassicGlobeCanvas;
  -[VKScreenCanvas enterARSessionAtCoordinate:](&v24, sel_enterARSessionAtCoordinate_);
  if (+[MDARController isSupported])
  {
    uint64_t v6 = [(VKClassicGlobeCanvas *)self arCameraController];
    [(VKScreenCanvas *)self setCameraController:v6];

    arCameraController = self->_arCameraController;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    _OWORD v23[2] = __51__VKClassicGlobeCanvas_enterARSessionAtCoordinate___block_invoke;
    v23[3] = &unk_1E5A93728;
    v23[4] = self;
    -[VKARCameraController trasitionToARModeAtCoordinate:withDuration:completion:](arCameraController, "trasitionToARModeAtCoordinate:withDuration:completion:", v23, var0, var1, 1.5);
  }
  else
  {
    uint64_t v8 = [(VKClassicGlobeCanvas *)self globeCameraController];
    [(VKScreenCanvas *)self setCameraController:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 map:self didEnterARMode:1];
    }
  }
  uint64_t v12 = *(void *)[(VKClassicGlobeCanvas *)self _clientStyleState];
  if (v12) {
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v12, 0x10046u, 1);
  }
  uint64_t v13 = *((void *)self->super._mapEngine + 140);
  unint64_t v14 = *(void *)(v13 + 16);
  if ((v14 & (v14 - 1)) != 0)
  {
    unint64_t v16 = 0x20A1ED17D78F322BLL;
    if (v14 <= 0x20A1ED17D78F322BLL) {
      unint64_t v16 = 0x20A1ED17D78F322BLL % v14;
    }
    double v15 = *(void **)(*(void *)(v13 + 8) + 8 * v16);
    do
    {
      do
        double v15 = (void *)*v15;
      while (v15[1] != 0x20A1ED17D78F322BLL);
    }
    while (v15[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    double v15 = *(void **)(*(void *)(v13 + 8) + 8 * ((v14 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        double v15 = (void *)*v15;
      while (v15[1] != 0x20A1ED17D78F322BLL);
    }
    while (v15[2] != 0x20A1ED17D78F322BLL);
  }
  md::LabelSettings_Presentation::setInARMode(*(md::LabelSettings_Presentation **)(**(void **)(v15[5] + 144) + 24), 1u);
  self->_arRoadDisabledState = [(VKClassicGlobeCanvas *)self disableRoads];
  [(VKClassicGlobeCanvas *)self setDisableRoads:1];
  globe = self->_globe;
  double v18 = +[VKDebugSettings sharedSettings];
  int v19 = [v18 enableAROmniTileLoader];
  uint64_t v20 = globe[65];
  if (v20)
  {
    uint64_t v21 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v20 + 24))(v20, 0, 0xFFFFFFFFLL);
    if (v19) {
      int v22 = 3;
    }
    else {
      int v22 = 0;
    }
    *(_DWORD *)(v21 + 1296) = v22;
  }

  *(_DWORD *)(*(void *)(*((void *)self->_globe + 107) + 136) + 52) = 1008981770;
}

void __51__VKClassicGlobeCanvas_enterARSessionAtCoordinate___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 888));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 888));
    [v6 map:*(void *)(a1 + 32) didEnterARMode:a2];
  }
}

- (VKARCameraController)arCameraController
{
  if (!self->_arCameraController)
  {
    uint64_t v5 = [VKARCameraController alloc];
    cntrl = self->super._taskContext.__cntrl_;
    ptr = self->super._taskContext.__ptr_;
    uint64_t v21 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    mapEngine = self->super._mapEngine;
    uint64_t v8 = *((void *)mapEngine + 113);
    uint64_t v9 = *((void *)mapEngine + 14);
    uint64_t v10 = *((void *)mapEngine + 15);
    id v11 = *((id *)mapEngine + 138);
    uint64_t v12 = [(VKARCameraController *)v5 initWithTaskContext:&ptr mapDataAccess:v8 animationRunner:v9 runLoopController:v10 cameraDelegate:v11];
    arCameraController = self->_arCameraController;
    self->_arCameraController = v12;

    unint64_t v14 = (std::__shared_weak_count *)v21;
    if (v21 && !atomic_fetch_add((atomic_ullong *volatile)v21 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    [(VKARCameraController *)self->_arCameraController setGlobeView:self->_globe];
    [(VKARCameraController *)self->_arCameraController setMapEngine:self->_engine];
    double v15 = self->_arCameraController;
    unint64_t v16 = self->super._camera.__cntrl_;
    double v18 = self->super._camera.__ptr_;
    int v19 = v16;
    if (v16) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v16 + 1, 1uLL, memory_order_relaxed);
    }
    [(VKARCameraController *)v15 setCamera:&v18];
    double v17 = (std::__shared_weak_count *)v19;
    if (v19 && !atomic_fetch_add((atomic_ullong *volatile)v19 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  int8x8_t v3 = self->_arCameraController;
  return v3;
}

- (BOOL)useNewRenderPath
{
  return 1;
}

+ (BOOL)supportsMapType:(int)a3 scale:(int)a4
{
  if (a3 == 10)
  {
LABEL_4:
    char v4 = [MEMORY[0x1E4F64918] modernManager];
    uint64_t v5 = [v4 activeTileGroup];
    id v6 = [v5 activeTileSetForTileType:15 scale:0];
    BOOL v7 = v6 != 0;

    return v7;
  }
  if (a3 != 4)
  {
    if (a3 != 3) {
      return 0;
    }
    goto LABEL_4;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F64918], "modernManager", *(void *)&a3, *(void *)&a4);
  uint64_t v9 = [v8 activeTileGroup];
  uint64_t v10 = [v9 activeTileSetForTileType:15 scale:0];

  id v11 = [MEMORY[0x1E4F64918] modernManager];
  uint64_t v12 = [v11 activeTileGroup];
  uint64_t v13 = [v12 activeTileSetForTileType:20 scale:0];

  if (v10) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  return !v14;
}

@end