@interface VKMuninCameraController
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (BOOL)canZoomInForTileSize:(int64_t)a3;
- (BOOL)canZoomOutForTileSize:(int64_t)a3;
- (BOOL)cancelPendingMove;
- (BOOL)cancelPendingMoveExceptBump;
- (BOOL)isAnimationsRunning;
- (BOOL)isAnimationsRunningExceptBump;
- (BOOL)isBumpAnimationRunning;
- (BOOL)isPathAnimationRunning;
- (BOOL)moveToPoint:(const void *)a3 withHeading:()Unit<geo:(double>)a4 :()Unit<geo:(double>)a5 :(BOOL)a6 RadianUnitDescription RadianUnitDescription withPitch:(id)a7 animated:completionHandler:;
- (BOOL)tapAtPoint:(CGPoint)a3;
- (BOOL)usesVKCamera;
- (BOOL)virtualParallaxEnabled;
- (Matrix<float,)screenPointWithOffset:(CGPoint)a3;
- (Unit<geo::RadianUnitDescription,)_horizontalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription;
- (Unit<geo::RadianUnitDescription,)_pitchForScreenPoint:()Matrix<float;
- (Unit<geo::RadianUnitDescription,)_verticalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription;
- (VKMuninCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:(void *)a8 cameraDelegate:(void *)a9 muninSceneLogic:elevationLogic:;
- (char)tapAtPoint:;
- (const)currentPoint;
- (double)_zoomRubberBandFov:(double)a3;
- (double)altitude;
- (double)currentZoomLevelForTileSize:(int64_t)a3;
- (double)heading;
- (double)maximumZoomLevelForTileSize:(int64_t)a3;
- (double)minimumZoomLevelForTileSize:(int64_t)a3;
- (double)pitch;
- (double)tapAtPoint:;
- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3;
- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3;
- (id).cxx_construct;
- (id)animatePath:(id *)location animator:preloadedRequiredViews:prePruneData:completionHandler:;
- (id)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:;
- (id)runBumpAnimation:targetPoint:completionHandler:;
- (id)tapAtPoint:(id *)location;
- (uint64_t)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:;
- (uint64_t)moveToPoint:(uint64_t)a1 withHeading:(uint64_t)a2 withPitch:animated:completionHandler:;
- (uint64_t)moveToPoint:(uint64_t)a1 withHeading:withPitch:animated:completionHandler:;
- (uint64_t)moveToPoint:withHeading:withPitch:animated:completionHandler:;
- (uint64_t)runBumpAnimation:targetPoint:completionHandler:;
- (uint64_t)selectLabelMarker:completion:;
- (uint64_t)tapAtPoint:;
- (uint64_t)tapAtPoint:(uint64_t)a1;
- (void)_setHeading:()Unit<geo:(double>)a3 :RadianUnitDescription;
- (void)_updateDebugOverlay:(void *)a3;
- (void)animatePath:(void *)a3 animator:(const void *)a4 preloadedRequiredViews:(void *)a5 prePruneData:(BOOL)a6 completionHandler:(id)a7;
- (void)animatePath:(void *)a3 withTarget:(const void *)a4 lookAtTarget:(BOOL)a5 constantLod:(BOOL)a6 prePruneData:(BOOL)a7 completionHandler:(id)a8;
- (void)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:;
- (void)moveAlongPath:(PathAnimationDescription *)a3 tap:(TapDescription *)a4 preloadedViews:()unordered_map<gdc:()std:()gdc:()std:(std:(std:(BOOL)a6 :shared_ptr<gdc::LayerData>>>> *)a5 :allocator<std::pair<const)gdc::LayerDataRequestKey :equal_to<gdc::LayerDataRequestKey> :LayerDataRequestKeyHash :shared_ptr<gdc::LayerData> :LayerDataRequestKey continued:;
- (void)moveToPoint:withHeading:withPitch:animated:completionHandler:;
- (void)pathAnimationComplete:(unint64_t)a3;
- (void)pathAnimationPrepared:(PathAnimationDescription *)a3 tap:(TapDescription *)a4 preloadedViews:()unordered_map<gdc:()std:()gdc:()std:(std:(std::shared_ptr<gdc::LayerData>>>> *)a5 :allocator<std::pair<const)gdc::LayerDataRequestKey :equal_to<gdc::LayerDataRequestKey> :LayerDataRequestKeyHash :shared_ptr<gdc::LayerData> :LayerDataRequestKey;
- (void)resetPathAnimation;
- (void)runBumpAnimation:(const void *)a3 targetPoint:(const void *)a4 completionHandler:(id)a5;
- (void)runBumpAnimation:targetPoint:completionHandler:;
- (void)selectLabelMarker:(const void *)a3 completion:(id)a4;
- (void)selectLabelMarker:completion:;
- (void)setCameraFrame:()CameraFrame<geo:(double> *)a3 :Radians;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10;
- (void)setCurrentPoint:(const void *)a3;
- (void)setCurrentPoint:(const void *)a3 secondaryPoint:(optional<md::mun::CollectionPoint>)a4;
- (void)setCurrentSegment:(void *)a3;
- (void)setVirtualParallaxEnabled:(BOOL)a3;
- (void)setVkCamera:(id)a3;
- (void)setWidestFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription;
- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4;
- (void)startPinchingWithFocusPoint:(CGPoint)a3;
- (void)stopAnimations;
- (void)stopAnimationsExceptBump;
- (void)stopPanningAtPoint:(CGPoint)a3;
- (void)stopPinchingWithFocusPoint:(CGPoint)a3;
- (void)tapAtPoint:;
- (void)updateCurrentPointView:;
- (void)updateCurrentPointView:(BOOL)a3;
- (void)updatePanWithTranslation:(CGPoint)a3;
- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)willStopPanningAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4;
- (void)zoomAnimated:()Unit<geo:(double>)a3 :(id)a4 RadianUnitDescription completion:;
- (void)zoomAnimatedWithDuration:()Unit<geo:(double>)a3 :(float)a4 RadianUnitDescription duration:(id)a5 completion:;
@end

@implementation VKMuninCameraController

- (VKMuninCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:(void *)a8 cameraDelegate:(void *)a9 muninSceneLogic:elevationLogic:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VKMuninCameraController;
  v16 = [(VKCameraController *)&v24 initWithMapDataAccess:cntrl animationRunner:a4 runLoopController:a5 cameraDelegate:v15];
  v17 = v16;
  if (v16)
  {
    *((void *)v16 + 17) = a7;
    *((void *)v16 + 18) = a8;
    uint64_t v19 = *(void *)ptr;
    uint64_t v18 = *((void *)ptr + 1);
    if (v18) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
    }
    v20 = (std::__shared_weak_count *)*((void *)v16 + 20);
    *((void *)v16 + 19) = v19;
    *((void *)v16 + 20) = v18;
    if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
    v17[4248] = 0;
    v17[4249] = 0;
    v17[4296] = 0;
    *((_DWORD *)v17 + 1087) = 0;
    *((void *)v17 + 547) = 0;
    v17[4440] = 1;
    uint64_t v21 = *(void *)(*((void *)v17 + 17) + 720);
    *((void *)v17 + 556) = v21;
    *((void *)v17 + 539) = v21;
    v17[4344] = 1;
    *(void *)(v17 + 4260) = 0;
    *((void *)v17 + 567) = 0;
    v17[4576] = 7;
    v22 = v17;
  }

  return (VKMuninCameraController *)v17;
}

- (id).cxx_construct
{
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((unsigned char *)self + 168) = 0;
  *((void *)self + 520) = 0;
  *((void *)self + 521) = 0;
  *((void *)self + 522) = 850045863;
  *(_OWORD *)((char *)self + 4184) = 0u;
  *(_OWORD *)((char *)self + 4200) = 0u;
  *(_OWORD *)((char *)self + 4216) = 0u;
  *((void *)self + 529) = 0;
  *((void *)self + 530) = 0;
  *((void *)self + 534) = &unk_1EF5596D8;
  *((void *)self + 535) = 0;
  *((void *)self + 540) = &unk_1EF5596D8;
  *((void *)self + 541) = 0;
  *((void *)self + 544) = &unk_1EF5596D8;
  *((void *)self + 545) = 0;
  *((void *)self + 549) = 0;
  *((void *)self + 550) = 0;
  *((void *)self + 548) = 0;
  *(_OWORD *)((char *)self + 4408) = xmmword_1A28FE7F0;
  *((void *)self + 558) = 0;
  *((void *)self + 559) = 0;
  *((void *)self + 557) = 0;
  *((int64x2_t *)self + 280) = vdupq_n_s64(0xC00921FB54442D18);
  *((_OWORD *)self + 281) = 0u;
  *((_OWORD *)self + 282) = 0u;
  *((void *)self + 566) = 0;
  *((void *)self + 568) = 0;
  *((void *)self + 569) = 0;
  *((void *)self + 570) = 0;
  *((void *)self + 571) = 0;
  return self;
}

- (void).cxx_destruct
{
  v3 = (_anonymous_namespace_::PendingPathAnimation *)*((void *)self + 571);
  *((void *)self + 571) = 0;
  if (v3)
  {
    MEMORY[0x1A6239270]();
  }
  v4 = (std::__shared_weak_count *)*((void *)self + 569);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  *((void *)self + 544) = &unk_1EF5596D8;

  *((void *)self + 540) = &unk_1EF5596D8;
  *((void *)self + 534) = &unk_1EF5596D8;

  std::mutex::~mutex((std::mutex *)((char *)self + 4176));
  v5 = (std::__shared_weak_count *)*((void *)self + 521);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  if (*((unsigned char *)self + 168))
  {
    *((unsigned char *)self + 168) = 0;
  }
  v6 = (std::__shared_weak_count *)*((void *)self + 20);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

- (void)setVirtualParallaxEnabled:(BOOL)a3
{
  *((unsigned char *)self + 4344) = a3;
}

- (BOOL)virtualParallaxEnabled
{
  return *((unsigned char *)self + 4344);
}

- (BOOL)usesVKCamera
{
  return 0;
}

- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3
{
  return 0.0;
}

- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3
{
  return 17.17;
}

- (double)minimumZoomLevelForTileSize:(int64_t)a3
{
  return 17.17;
}

- (double)maximumZoomLevelForTileSize:(int64_t)a3
{
  return 17.17;
}

- (double)currentZoomLevelForTileSize:(int64_t)a3
{
  return 17.17;
}

- (BOOL)canZoomOutForTileSize:(int64_t)a3
{
  return 0;
}

- (BOOL)canZoomInForTileSize:(int64_t)a3
{
  return 0;
}

- (void)zoomAnimated:()Unit<geo:(double>)a3 :(id)a4 RadianUnitDescription completion:
{
  -[VKMuninCameraController zoomAnimatedWithDuration:duration:completion:](self, "zoomAnimatedWithDuration:duration:completion:", &v4, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(void *)a4), 0.25)));
}

- (void)zoomAnimatedWithDuration:()Unit<geo:(double>)a3 :(float)a4 RadianUnitDescription duration:(id)a5 completion:
{
  float v6 = *(float *)&a3._value;
  id v9 = v5;
  v10 = v9;
  double v11 = *((double *)self + 556);
  if (*(double *)a5 == v11)
  {
    if (v9) {
      (*((void (**)(id, uint64_t, double))v9 + 2))(v9, 1, *(double *)a5);
    }
  }
  else
  {
    v12 = [[VKTimedAnimation alloc] initWithDuration:v6];
    v13 = (void *)*((void *)self + 541);
    *((void *)self + 541) = v12;

    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3321888768;
    v19[2] = __72__VKMuninCameraController_zoomAnimatedWithDuration_duration_completion___block_invoke;
    v19[3] = &unk_1EF58E4A8;
    objc_copyWeak(v20, &location);
    v14 = *(void **)a5;
    v20[1] = *(id *)&v11;
    v20[2] = v14;
    [*((id *)self + 541) setStepHandler:v19];
    v15 = (void *)MEMORY[0x1A6239EB0](v10);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__VKMuninCameraController_zoomAnimatedWithDuration_duration_completion___block_invoke_34;
    v17[3] = &unk_1E5A98598;
    id v16 = v15;
    id v18 = v16;
    [*((id *)self + 541) setCompletionHandler:v17];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], *((VKAnimation **)self + 541));

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __72__VKMuninCameraController_zoomAnimatedWithDuration_duration_completion___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2;
    [WeakRetained setWidestFieldOfView:&v7];
    float v6 = [v5 cameraDelegate];
    [v6 mapLayerDidChangeVisibleRegion];
  }
}

uint64_t __72__VKMuninCameraController_zoomAnimatedWithDuration_duration_completion___block_invoke_34(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  if (!*((unsigned char *)self + 4296)) {
    return;
  }
  *((unsigned char *)self + 4296) = 0;
  uint64_t v4 = *((void *)self + 17);
  double v5 = *(double *)(v4 + 752);
  double v6 = *((double *)self + 556);
  if (v6 < v5) {
    goto LABEL_7;
  }
  double v7 = [(VKCameraController *)self canvas];
  [v7 size];
  *(float *)&double v8 = v8;
  *(float *)&double v9 = v9;
  uint64_t v10 = 728;
  if ((float)(*(float *)&v8 / fmaxf(*(float *)&v9, 0.01)) > 1.0) {
    uint64_t v10 = 744;
  }
  double v11 = *(double *)(v4 + v10);
  double v12 = *((double *)self + 556);

  if (v12 > v11)
  {
    double v6 = *((double *)self + 556);
    uint64_t v4 = *((void *)self + 17);
    double v5 = *(double *)(v4 + 752);
LABEL_7:
    v13 = [(VKCameraController *)self canvas];
    [v13 size];
    *(float *)&double v14 = v14;
    *(float *)&double v15 = v15;
    uint64_t v16 = 728;
    if ((float)(*(float *)&v14 / fmaxf(*(float *)&v15, 0.01)) > 1.0) {
      uint64_t v16 = 744;
    }
    double v17 = fmin(fmax(v6, v5), *(double *)(v4 + v16));

    double v19 = v17;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__VKMuninCameraController_stopPinchingWithFocusPoint___block_invoke;
    v18[3] = &unk_1E5A93728;
    v18[4] = self;
    [(VKMuninCameraController *)self zoomAnimated:&v19 completion:v18];
    return;
  }
  [(VKCameraController *)self endRegionChange];
}

uint64_t __54__VKMuninCameraController_stopPinchingWithFocusPoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endRegionChange];
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  if (*((unsigned char *)self + 4296))
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    [(VKMuninCameraController *)self _zoomRubberBandFov:*((double *)self + 539) / a4];
    double v10 = v9;
    [(VKMuninCameraController *)self _zoomRubberBandFov:*((double *)self + 539) / a5];
    double v12 = v11;
    double v13 = *((double *)self + 539);
    double v41 = v11;
    [(VKMuninCameraController *)self setWidestFieldOfView:&v41];
    [(VKCameraController *)self centerScreenPoint];
    double v15 = v14;
    double v17 = v16;
    id v18 = [(VKCameraController *)self canvas];
    [v18 size];
    double v38 = v19;
    v20 = [(VKCameraController *)self canvas];
    double v35 = v17;
    double v36 = y;
    double v21 = v10;
    double v37 = x;
    [v20 size];
    double v23 = v22;

    LODWORD(y) = *((_DWORD *)self + 1075);
    LODWORD(v10) = *((_DWORD *)self + 1076);
    objc_super v24 = [(VKCameraController *)self canvas];
    [v24 size];
    double v34 = v25;
    double v27 = v26;
    float v28 = v38 * v15;
    float v29 = v23 * (1.0 - v35);
    float v30 = v36;
    double v31 = fmax(1.0 - v21 / v13, 0.0);
    *(float *)&double v31 = (fmax(1.0 - v12 / v13, 0.0) - v31) / (1.0 - v31);
    *(float *)&double v12 = *(float *)&v10 + (float)((float)(v29 - (float)(*(float *)&v10 + v30)) * *(float *)&v31);
    *(float *)&double v25 = v37;
    *(float *)&double v23 = *(float *)&y + (float)((float)(v28 - (float)(*(float *)&y + *(float *)&v25)) * *(float *)&v31);

    *(float *)&double v27 = (float)(*(float *)&v23 - *((float *)self + 1075)) / v27;
    *(float *)&double v13 = (float)(*((float *)self + 1076) - *(float *)&v12) / v34;
    *((_DWORD *)self + 1075) = LODWORD(v23);
    *((_DWORD *)self + 1076) = LODWORD(v12);
    v40[0] = *((void *)self + 539);
    [(VKMuninCameraController *)self _horizontalFieldOfView:v40];
    v39[0] = *((void *)self + 539);
    [(VKMuninCameraController *)self _verticalFieldOfView:v39];
    *((double *)self + 553) = *((double *)self + 553) + *(double *)&v40[1] * *(float *)&v27;
    *((double *)self + 554) = fmin(fmax(*((double *)self + 554) + *(double *)&v39[1] * *(float *)&v13, -0.785398163), 0.785398163);
    v32 = [(VKCameraController *)self cameraDelegate];
    [v32 mapLayerDidChangeVisibleRegion];

    uint64_t v33 = *(void *)[(VKCameraController *)self runLoopController];
    if (v33)
    {
      char v42 = 4;
      md::MapEngine::setNeedsTick(v33, &v42);
    }
  }
}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  if (![(VKMuninCameraController *)self isAnimationsRunningExceptBump])
  {
    [(VKMuninCameraController *)self cancelPendingMoveExceptBump];
    [(VKCameraController *)self beginRegionChange:0];
    *((void *)self + 539) = *((void *)self + 556);
    *((unsigned char *)self + 4296) = 1;
    *(void *)((char *)self + 4300) = 0;
  }
}

- (void)setWidestFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  uint64_t v4 = v3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v6 = (double *)*((void *)self + 17);
  double v7 = v6[94];
  double v8 = v6[95];
  double v9 = [(VKCameraController *)self canvas];
  [v9 size];
  *(float *)&double v10 = v10;
  *(float *)&double v11 = v11;
  uint64_t v12 = 91;
  if ((float)(*(float *)&v10 / fmaxf(*(float *)&v11, 0.01)) > 1.0) {
    uint64_t v12 = 93;
  }
  double v13 = v6[v12];
  double v14 = v6[96];

  uint64_t v15 = *((void *)self + 17);
  double v16 = [(VKCameraController *)self canvas];
  [v16 size];
  *(float *)&double v17 = v17;
  *(float *)&double v18 = v18;
  uint64_t v19 = 720;
  if ((float)(*(float *)&v17 / fmaxf(*(float *)&v18, 0.01)) > 1.0) {
    uint64_t v19 = 736;
  }
  double v20 = *(double *)(v15 + v19);

  if (*v4 < v20 && *((double *)self + 556) >= v20)
  {
    uint64_t v24 = *((void *)self + 17);
    char v29 = 0;
    char v30 = 0;
    char v33 = 0;
    v28[0] = 7;
    md::MuninSceneLogic::addSceneEvent(v24, (uint64_t)v28);
    if (v33 && __p) {
      operator delete(__p);
    }
    if (v30)
    {
      double v22 = v31;
      if (v31)
      {
        for (i = v32; i != v22; std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(i))
          i -= 249;
LABEL_16:
        operator delete(v22);
      }
    }
  }
  else if (*v4 >= v20 && *((double *)self + 556) < v20)
  {
    uint64_t v21 = *((void *)self + 17);
    char v29 = 0;
    char v30 = 0;
    char v33 = 0;
    v28[0] = 8;
    md::MuninSceneLogic::addSceneEvent(v21, (uint64_t)v28);
    if (v33 && __p) {
      operator delete(__p);
    }
    if (v30)
    {
      double v22 = v31;
      if (v31)
      {
        double v23 = v32;
        if (v32 != v31)
        {
          do
          {
            v23 -= 249;
            std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v23);
          }
          while (v23 != v22);
        }
        goto LABEL_16;
      }
    }
  }
  double v26 = *v4;
  *((double *)self + 556) = *v4;
  if (*((unsigned char *)self + 4440)) {
    *((double *)self + 556) = fmin(fmax(fmax(v7 - v8, 0.00872664626), v26), v14 + v13);
  }
  *(void *)(*(void *)([(VKCameraController *)self mapDataAccess] + 16) + 456) = *((void *)self + 556);
  uint64_t v27 = *(void *)[(VKCameraController *)self runLoopController];
  if (v27)
  {
    v28[0] = 4;
    md::MapEngine::setNeedsTick(v27, v28);
  }
}

- (double)_zoomRubberBandFov:(double)a3
{
  uint64_t v5 = *((void *)self + 17);
  double v6 = [(VKCameraController *)self canvas];
  [v6 size];
  *(float *)&double v7 = v7;
  *(float *)&double v8 = v8;
  uint64_t v9 = 728;
  if ((float)(*(float *)&v7 / fmaxf(*(float *)&v8, 0.01)) > 1.0) {
    uint64_t v9 = 744;
  }
  double v10 = *(double *)(v5 + v9);
  double v11 = *(double *)(v5 + 768);

  uint64_t v12 = *((void *)self + 17);
  double v13 = [(VKCameraController *)self canvas];
  [v13 size];
  *(float *)&double v14 = v14;
  *(float *)&double v15 = v15;
  uint64_t v16 = 728;
  if ((float)(*(float *)&v14 / fmaxf(*(float *)&v15, 0.01)) > 1.0) {
    uint64_t v16 = 744;
  }
  double v17 = *(double *)(v12 + v16);

  uint64_t v18 = *((void *)self + 17);
  double v19 = *(double *)(v18 + 752);
  float v20 = a3;
  float v21 = fmax(v19 - *(double *)(v18 + 760), 0.00872664626);
  float v22 = v19;
  float v23 = v17;
  float v24 = logf(v20);
  float v25 = logf(v21);
  float v26 = logf(v22);
  float v27 = logf(v23);
  if (v24 > v27)
  {
    float v28 = v27;
    float v29 = v11 + v10;
    float v24 = (float)((float)((float)(logf(v29) - v28) * (float)(v24 - v28)) / (float)((float)(v24 - v28) + 1.0)) + v28;
  }
  if (v24 >= v26) {
    float v30 = -v24;
  }
  else {
    float v30 = (float)((float)((float)(v26 - v24) * (float)(v26 - v25)) / (float)((float)(v26 - v24) + 1.0)) - v26;
  }
  return expf(-v30);
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  if (*((unsigned char *)self + 4248))
  {
    *((unsigned char *)self + 4248) = 0;
    [(VKCameraController *)self endRegionChange];
  }
}

- (void)willStopPanningAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  if (*((unsigned char *)self + 4248))
  {
    double x = a4.x;
    int v6 = *((_DWORD *)self + 1087);
    double v7 = (char *)self + 4352;
    double v8 = (void *)*((void *)self + 545);
    if (v8) {
      objc_msgSend(v8, "stop", a3.x, a3.y, a4.x, a4.y);
    }
    *((unsigned char *)self + 4249) = 1;
    double v9 = fabs(fmax(x, 100.0));
    double v10 = 0.0;
    if (v9 * 0.001 > 0.0) {
      double v10 = log(10.0 / v9) * -11.9699749;
    }
    double v11 = ceil(v10);
    uint64_t v12 = [[VKTimedAnimation alloc] initWithDuration:v11 * 0.0166666667];
    double v13 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v12;

    double v14 = v11 * 16.6666667;
    double v15 = v9 * 0.0159494286;
    float v16 = v14;
    float v17 = -(v15 - exp2(v16 * -0.00723156923) * v15) * -12.476936;
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __dynamicValueAnimationTimingFunction_block_invoke;
    location[3] = &__block_descriptor_72_e8_f12__0f8l;
    *(double *)&location[4] = v17;
    location[5] = *(id *)&v14;
    location[6] = *(id *)&v15;
    long long v23 = xmmword_1A28FE800;
    uint64_t v18 = (void *)[location copy];
    [*((id *)v7 + 1) setTimingFunction:v18];

    objc_initWeak(location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__VKMuninCameraController_willStopPanningAtPoint_withVelocity___block_invoke;
    v19[3] = &unk_1E5A91410;
    objc_copyWeak(&v20, location);
    int v21 = v6;
    [*((id *)v7 + 1) setStepHandler:v19];
    [*((id *)v7 + 1) setCompletionHandler:&__block_literal_global_33_18587];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], *((VKAnimation **)v7 + 1));
    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
}

void __63__VKMuninCameraController_willStopPanningAtPoint_withVelocity___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1087] = *(float *)(a1 + 40) - (float)(*(float *)(a1 + 40) * a2);
    int v6 = WeakRetained;
    uint64_t v5 = [WeakRetained cameraDelegate];
    [v5 mapLayerDidChangeVisibleRegion];

    id WeakRetained = v6;
  }
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  if (*((unsigned char *)self + 4248))
  {
    double y = a3.y;
    CGFloat x = a3.x;
    int v6 = [(VKCameraController *)self canvas];
    [v6 size];
    double v8 = v7;
    double v10 = v9;

    float v11 = x / v8;
    float v12 = y / v10;
    *(float *)&CGFloat x = v11 - *((float *)self + 1065);
    *(float *)&double v10 = v12 - *((float *)self + 1066);
    *((float *)self + 1065) = v11;
    *((float *)self + 1066) = v12;
    float v13 = *((float *)self + 1064) + *(float *)&v10;
    *((float *)self + 1063) = *((float *)self + 1063) + *(float *)&x;
    *((float *)self + 1064) = v13;
    v26[0] = *((void *)self + 556);
    [(VKMuninCameraController *)self _horizontalFieldOfView:v26];
    v25[0] = *((void *)self + 556);
    [(VKMuninCameraController *)self _verticalFieldOfView:v25];
    double v14 = *((double *)self + 553);
    LODWORD(v15) = *((_DWORD *)self + 1063);
    LODWORD(v16) = *((_DWORD *)self + 1064);
    -[VKMuninCameraController _pitchForScreenPoint:](self, "_pitchForScreenPoint:", v15, v16);
    double v17 = *((double *)self + 553);
    double v18 = *(double *)&v26[1] * *(float *)&x;
    *((long double *)self + 553) = v18 / cos(__x) + v17;
    *((double *)self + 554) = fmin(fmax(*((double *)self + 554) - *(double *)&v25[1] * *(float *)&v10, -1.57079633), 0.785398163);
    double v19 = *((double *)self + 553);
    *((double *)self + 550) = v19;
    if (!*((unsigned char *)self + 4249))
    {
      long double v20 = fmod(3.14159265 - v14 + v19, 6.28318531);
      float v21 = fmin(*((float *)self + 1087) + fabs(fmod(v20 + 6.28318531, 6.28318531) + -3.14159265) * 3.81971863, 1.0);
      *((float *)self + 1087) = v21;
    }
    float v22 = [(VKCameraController *)self cameraDelegate];
    [v22 mapLayerDidChangeVisibleRegion];

    uint64_t v23 = *(void *)[(VKCameraController *)self runLoopController];
    if (v23)
    {
      char v27 = 4;
      md::MapEngine::setNeedsTick(v23, &v27);
    }
  }
}

- (Unit<geo::RadianUnitDescription,)_pitchForScreenPoint:()Matrix<float
{
  float v4 = a3._e[1];
  int v6 = v3;
  [(VKCameraController *)self centerScreenPoint];
  float v8 = v7;
  float v9 = v4 - v8;
  v11[0] = *((void *)self + 556);
  [(VKMuninCameraController *)self _verticalFieldOfView:v11];
  v10._value = *((double *)self + 554) + *(double *)&v11[1] * v9;
  double *v6 = v10._value;
  return v10;
}

- (Unit<geo::RadianUnitDescription,)_verticalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  uint64_t v5 = v3;
  double v7 = v4;
  float v8 = [(VKCameraController *)self canvas];
  [v8 size];
  double v10 = v9;
  float v11 = [(VKCameraController *)self canvas];
  [v11 size];
  double v13 = v10 / v12;

  v14._value = *v5 / fmax(v13, 1.0);
  *double v7 = v14._value;
  return v14;
}

- (Unit<geo::RadianUnitDescription,)_horizontalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  uint64_t v5 = v3;
  double v7 = v4;
  float v8 = [(VKCameraController *)self canvas];
  [v8 size];
  if (v9 <= 0.0)
  {

    goto LABEL_5;
  }
  double v10 = [(VKCameraController *)self canvas];
  [v10 size];
  double v12 = v11;
  double v13 = [(VKCameraController *)self canvas];
  [v13 size];
  double v15 = v12 / v14;

  if (v15 >= 1.0)
  {
LABEL_5:
    v16._value = *v5;
    goto LABEL_6;
  }
  v16._value = *v5 * v15;
LABEL_6:
  *double v7 = v16._value;
  return v16;
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  if (![(VKMuninCameraController *)self isAnimationsRunningExceptBump])
  {
    double v7 = (void *)*((void *)self + 545);
    if (v7) {
      [v7 stop];
    }
    [(VKMuninCameraController *)self cancelPendingMoveExceptBump];
    [(VKCameraController *)self beginRegionChange:0];
    *(void *)((char *)self + 4260) = 0;
    float v8 = [(VKCameraController *)self canvas];
    [v8 size];
    double v10 = v9;
    double v12 = v11;

    float v13 = x / v10;
    float v14 = y / v12;
    *((float *)self + 1063) = v13;
    *((float *)self + 1064) = v14;
    *((void *)self + 550) = *((void *)self + 553);
    *((unsigned char *)self + 4248) = 1;
    *((unsigned char *)self + 4249) = 0;
  }
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  uint64_t v3 = MEMORY[0x1F4188790](self);
  uint64_t v331 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = v3 + 168;
  if (!*(unsigned char *)(v3 + 168)) {
    return 0;
  }
  double v7 = v5;
  double v8 = v4;
  uint64_t v9 = v3;
  uint64_t v10 = *(void *)(v3 + 4160);
  if (v10)
  {
    if ([*(id *)(v10 + 600) running] && !*(void *)(v9 + 4560)) {
      return 0;
    }
  }
  ++*(void *)(v9 + 4536);
  long double v11 = *(double *)(v6 + 64) * 6.28318531;
  long double v12 = exp(*(double *)(v6 + 72) * 6.28318531 + -3.14159265);
  double v13 = atan(v12);
  long double v14 = fmod(v11, 6.28318531);
  double v15 = fmod(v14 + 6.28318531, 6.28318531);
  double v16 = *(double *)(v9 + 4424);
  double v17 = *(double *)(v9 + 4432);
  double v18 = +[VKDebugSettings sharedSettings];
  double v19 = v15 * 57.2957795 + -180.0;
  double v20 = v13 * 114.591559 + -90.0;
  float v21 = v8;
  float v22 = v7;
  float v23 = v16 * 57.2957795;
  float v24 = -v23;
  *(float *)v303 = v21;
  *(float *)&v303[1] = v22;
  double v304 = v20;
  double v305 = v19;
  float v25 = v17 * 57.2957795;
  float v306 = -v23;
  float v307 = v25;
  [v18 setMuninTapState:v303];

  if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
  }
  float v26 = (id)GEOGetVectorKitVKMuninLog_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v310 = 134219265;
    *(double *)&v310[4] = v21;
    *(_WORD *)&v310[12] = 2048;
    *(double *)&v310[14] = v22;
    *(_WORD *)&v310[22] = 2049;
    *(double *)v311 = v20;
    *(_WORD *)&v311[8] = 2049;
    *(double *)&v311[10] = v19;
    *(_WORD *)&v311[18] = 2048;
    *(double *)&v311[20] = v24;
    *(_WORD *)&v311[28] = 2048;
    *(double *)&v311[30] = v25;
    _os_log_impl(&dword_1A1780000, v26, OS_LOG_TYPE_INFO, "{\"tap_state\": {\"x\": %f, \"y\": %f, \"latitude\": %{private}f, \"longitude\": %{private}f, \"yaw\": %f, \"pitch\": %f } }", v310, 0x3Eu);
  }

  char v27 = *(std::chrono::steady_clock::time_point **)(*(void *)(v9 + 136) + 520);
  v27[13].__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  v27->__d_.__rep_ = 0x100000003;
  objc_msgSend((id)v9, "screenPointWithOffset:", v8, v7);
  unsigned int from = v28;
  unsigned int v215 = v29;
  [(id)v9 camera];
  float64x2_t v30 = vsubq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v215, from)), vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64(*(float64x2_t *)(*(void *)v310 + 368), vcvtq_f64_f32(*(float32x2_t *)(*(void *)v310 + 488))))));
  float64x2_t v31 = vdivq_f64(vaddq_f64(v30, v30), *(float64x2_t *)(*(void *)v310 + 368));
  double v32 = gdc::ViewDataAccess::worldRayFromScreenNormalizedPoint((uint64_t)&v300, *(uint64_t *)v310, (double *)(v9 + 4480), v31.f64[0] + -1.0, 1.0 - v31.f64[1]);
  char v33 = *(std::__shared_weak_count **)&v310[8];
  if (*(void *)&v310[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v310[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *, double))v33->__on_zero_shared)(v33, v32);
    std::__shared_weak_count::__release_weak(v33);
  }
  uint64_t v34 = *(void *)(*(void *)(v9 + 136) + 536);
  uint64_t v35 = *(unsigned __int8 **)(v34 + 24);
  if (!v35)
  {
LABEL_25:
    v296[0] = 0;
    goto LABEL_26;
  }
  while (1)
  {
    gdc::LayerDataStore::get((gdc::LayerDataStore *)v310, *(const gdc::LayerDataRequestKey **)v34, v35 + 16);
    uint64_t v36 = *(void *)v310;
    if (!*(void *)v310) {
      goto LABEL_21;
    }
    double v37 = *(std::__shared_weak_count **)&v310[8];
    if (*(void *)&v310[8]) {
      break;
    }
    if (v296[0]) {
      goto LABEL_38;
    }
LABEL_21:
    v40 = *(std::__shared_weak_count **)&v310[8];
    if (*(void *)&v310[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v310[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
    uint64_t v35 = *(unsigned __int8 **)v35;
    if (!v35) {
      goto LABEL_25;
    }
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v310[8] + 8), 1uLL, memory_order_relaxed);
  int v38 = v296[0];
  unint64_t add = atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL);
  if (!v38)
  {
    if (!add)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
    goto LABEL_21;
  }
  if (!add)
  {
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
  }
LABEL_38:
  v82 = *(std::__shared_weak_count **)&v310[8];
  if (*(void *)&v310[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v310[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
    std::__shared_weak_count::__release_weak(v82);
  }
LABEL_26:
  char v42 = +[VKDebugSettings sharedSettings];
  if (([v42 forceBumpNextTap] & 1) != 0
    || ((char v43 = [v42 forceBumpAll], !v296[0]) ? (v44 = 1) : (v44 = v43), (v44 & 1) != 0))
  {
    double v45 = *(double *)(v9 + 4464);
    double v46 = *(double *)(v9 + 4472);
    __double2 v47 = __sincos_stret(*(double *)(v9 + 4456));
    double v48 = 6378137.0 / sqrt(v47.__sinval * v47.__sinval * -0.00669437999 + 1.0);
    double v49 = (v48 + v46) * v47.__cosval;
    __double2 v50 = __sincos_stret(v45);
    *(double *)v310 = v49 * v50.__cosval;
    *(double *)&v310[8] = v49 * v50.__sinval;
    *(double *)&v310[16] = (v46 + v48 * 0.99330562) * v47.__sinval;
    *(double *)&long long v270 = *((double *)&v301 + 1) + v49 * v50.__cosval;
    *((double *)&v270 + 1) = *(double *)&v302 + v49 * v50.__sinval;
    *(double *)&long long v271 = *((double *)&v302 + 1) + *(double *)&v310[16];
    [(id)v9 runBumpAnimation:v310 targetPoint:&v270 completionHandler:&__block_literal_global_31_18591];
    [v42 setForceBumpNextTap:0];
    uint64_t v51 = *(void *)[(id)v9 runLoopController];
    if (v51)
    {
      LOBYTE(v268) = 4;
      md::MapEngine::setNeedsTick(v51, &v268);
    }
    BOOL v41 = 0;
    goto LABEL_173;
  }
  float v52 = *(float *)(v6 + 40);
  float v53 = *(float *)(v6 + 44);
  float v54 = *(float *)(v6 + 48);
  float v55 = *(float *)(v6 + 52);
  float v56 = -(float)((float)((float)(v54 + v54) * v55) - (float)((float)(v52 + v52) * v53));
  double v57 = (float)(1.0 - (float)((float)((float)(v52 + v52) * v52) + (float)((float)(v54 + v54) * v54)));
  double v58 = (float)((float)((float)(v54 + v54) * v53) + (float)(v55 * (float)(v52 + v52)));
  double v59 = *(double *)(v6 + 16) - *(double *)&v297;
  double v60 = *(double *)(v6 + 24) - *((double *)&v297 + 1);
  double v61 = *(double *)(v6 + 32) - *(double *)&v298;
  double v62 = 1.0 / sqrt(v59 * v59 + v60 * v60 + v61 * v61);
  double v63 = v62 * v59;
  double v64 = v62 * v60;
  double v65 = v62 * v61;
  double v66 = -(v62 * v60 * v58 - v65 * v57);
  double v67 = -(v65 * v56 - v63 * v58);
  double v68 = -(v63 * v57 - v64 * v56);
  double v69 = 1.0 / sqrt(v66 * v66 + v67 * v67 + v68 * v68);
  double v70 = v69 * v66;
  double v71 = v69 * v67;
  double v72 = v69 * v68;
  double v73 = -(v69 * v68 * v64 - v69 * v67 * v65);
  double v74 = -(v70 * v65 - v69 * v68 * v63);
  double v75 = -(v71 * v63 - v70 * v64);
  double v76 = v70 + v64 - (v71 * v63 - v70 * v64);
  if (v76 <= 0.0)
  {
    if (v70 <= v64 || v70 <= v75)
    {
      BOOL v85 = v64 <= v75;
      double v86 = sqrt(1.0 - (v70 + v64) - (v71 * v63 - v70 * v64));
      double v87 = 1.0 / (v86 + v86);
      double v88 = (v73 + v72) * v87;
      double v89 = v74 + v65;
      double v90 = v89 * v87;
      double v91 = v86 * 0.5;
      double v92 = (v71 - v63) * v87;
      double v93 = sqrt(v64 + 1.0 - (v70 - (v71 * v63 - v70 * v64)));
      double v94 = v71 + v63;
      double v95 = 1.0 / (v93 + v93);
      double v96 = v94 * v95;
      double v97 = v93 * 0.5;
      double v98 = v89 * v95;
      double v99 = (v73 - v72) * v95;
      if (v85) {
        double v78 = v88;
      }
      else {
        double v78 = v96;
      }
      if (v85) {
        *(double *)&long long v79 = v90;
      }
      else {
        *(double *)&long long v79 = v97;
      }
      if (v85) {
        double v80 = v91;
      }
      else {
        double v80 = v98;
      }
      if (v85) {
        double v81 = v92;
      }
      else {
        double v81 = v99;
      }
    }
    else
    {
      double v83 = sqrt(v70 + 1.0 - (v64 - (v71 * v63 - v70 * v64)));
      double v84 = v83 + v83;
      double v78 = v83 * 0.5;
      *(double *)&long long v79 = (v71 + v63) * (1.0 / v84);
      double v80 = (v73 + v72) * (1.0 / v84);
      double v81 = (v65 - v74) * (1.0 / v84);
    }
  }
  else
  {
    double v77 = 0.5 / sqrt(v76 + 1.0);
    double v78 = v77 * (v65 - v74);
    *(double *)&long long v79 = v77 * (v73 - v72);
    double v80 = v77 * (v71 - v63);
    double v81 = 0.25 / v77;
  }
  *(void *)&long long v100 = v298;
  *((double *)&v100 + 1) = v78;
  long long v212 = v100;
  long long v213 = v297;
  *((double *)&v79 + 1) = v80;
  long long v210 = v79;
  uint64_t v211 = v298;
  uint64_t v101 = *(void *)(v9 + 136);
  double v102 = *(double *)(v9 + 4464);
  double v103 = *(double *)(v9 + 4472);
  __double2 v104 = __sincos_stret(*(double *)(v9 + 4456));
  double v105 = 6378137.0 / sqrt(v104.__sinval * v104.__sinval * -0.00669437999 + 1.0);
  __double2 v107 = __sincos_stret(v102);
  v106.f64[0] = v107.__cosval;
  v106.f64[1] = v107.__sinval;
  LOBYTE(v314) = 0;
  BYTE8(v317) = 0;
  v310[0] = 0;
  v310[16] = 0;
  *(_OWORD *)v311 = v213;
  *(_OWORD *)&v311[16] = v212;
  *(_OWORD *)&v311[32] = v210;
  *(double *)v312 = v81;
  *(_OWORD *)&v312[8] = v213;
  *(float64x2_t *)v313 = vmulq_n_f64(v106, (v105 + v103) * v104.__cosval);
  *(void *)&v312[24] = v211;
  *(double *)&v313[16] = (v103 + v105 * 0.99330562) * v104.__sinval;
  v310[8] = 1;
  v216 = v42;
  md::MuninSceneLogic::addSceneEvent(v101, (uint64_t)v310);
  if (BYTE8(v317))
  {
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    BYTE8(v317) = 0;
  }
  if ((_BYTE)v314)
  {
    v108 = v315;
    if (v315)
    {
      v109 = (void *)v316[0];
      if ((void *)v316[0] != v315)
      {
        do
        {
          v109 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v109);
        }
        while (v109 != v108);
        v108 = v315;
      }
      operator delete(v108);
    }
  }
  long long v270 = v297;
  long long v271 = v298;
  long long v272 = v299;
  long long v273 = v300;
  long long v274 = v301;
  long long v275 = v302;
  long long v277 = *(_OWORD *)(v6 + 16);
  uint64_t v281 = *(void *)(v6 + 52);
  long long v110 = *(_OWORD *)(v6 + 64);
  long long v283 = *(_OWORD *)(v6 + 80);
  uint64_t v111 = *(void *)(v6 + 32);
  uint64_t v276 = *(void *)(v6 + 8);
  uint64_t v278 = v111;
  int v280 = *(_DWORD *)(v6 + 48);
  v279 = *(void **)(v6 + 40);
  long long v282 = v110;
  v284 = v288;
  v285 = (long long *)v288;
  v286 = (long long *)v288;
  uint64_t v287 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v284, *(long long **)(v6 + 96), *(long long **)(v6 + 104));
  *(void *)((char *)v289 + 5) = *(void *)(v6 + 1861);
  v289[0] = *(void *)(v6 + 1856);
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformEcefNoOffset((uint64_t)&v290, (double *)(v9 + 4480));
  uint64_t v295 = *(void *)(v9 + 4536);
  uint64_t v112 = *(void *)(v9 + 4560);
  if (v112)
  {
    uint64_t v113 = *(void *)(v112 + 8);
    if (*(void *)v112 != v113)
    {
      long long v292 = *(_OWORD *)(v112 + 72);
      uint64_t v293 = *(void *)(v112 + 88);
      uint64_t v294 = *(void *)(v112 + 96);
      long long v290 = *(_OWORD *)(v112 + 48);
      uint64_t v291 = *(void *)(v112 + 64);
      uint64_t v276 = *(void *)(v113 - 1864);
      v279 = *(void **)(v113 - 1832);
      int v280 = *(_DWORD *)(v113 - 1824);
      LODWORD(v281) = *(_DWORD *)(v113 - 1820);
      long long v277 = *(_OWORD *)(v113 - 1856);
      uint64_t v278 = *(void *)(v113 - 1840);
      HIDWORD(v281) = *(_DWORD *)(v113 - 1816);
      long long v282 = *(_OWORD *)(v113 - 1808);
      long long v283 = *(_OWORD *)(v113 - 1792);
      if (&v276 != (uint64_t *)(v113 - 1864))
      {
        v114 = (long long *)v284;
        v115 = v285;
        if (v284 != v285)
        {
          do
          {
            v116 = (void *)*((void *)v114 + 31);
            if (v116 != *((void **)v114 + 33)) {
              free(v116);
            }
            v114 += 18;
          }
          while (v114 != v115);
          v114 = (long long *)v284;
        }
        if (v114 != v286) {
          free(v114);
        }
        v284 = v288;
        v285 = (long long *)v288;
        v286 = (long long *)v288;
        uint64_t v287 = 6;
        geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v284, *(long long **)(v113 - 1776), *(long long **)(v113 - 1768));
      }
      uint64_t v117 = *(void *)(v113 - 16);
      *(void *)((char *)v289 + 5) = *(void *)(v113 - 11);
      v289[0] = v117;
    }
  }
  objc_initWeak(&v269, (id)v9);
  objc_copyWeak((id *)v310, &v269);
  *(_OWORD *)&v311[16] = v272;
  *(_OWORD *)&v311[32] = v273;
  *(_OWORD *)v312 = v274;
  *(_OWORD *)&v312[16] = v275;
  *(_OWORD *)&v310[8] = v270;
  *(_OWORD *)v311 = v271;
  *(void *)v313 = v276;
  *(_OWORD *)&v313[8] = v277;
  LODWORD(v316[0]) = v280;
  uint64_t v314 = v278;
  v315 = v279;
  *(void *)((char *)v316 + 4) = v281;
  *(_OWORD *)__p = v283;
  long long v317 = v282;
  v319 = v323;
  v320 = (long long *)v323;
  v321 = (long long *)v323;
  uint64_t v322 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v319, (long long *)v284, v285);
  *(void *)((char *)v324 + 5) = *(void *)((char *)v289 + 5);
  v324[0] = v289[0];
  long long v325 = v290;
  uint64_t v326 = v291;
  long long v327 = v292;
  uint64_t v328 = v293;
  uint64_t v329 = v294;
  uint64_t v330 = v295;
  uint64_t v118 = *(void *)(v9 + 4544);
  if (v118) {
    atomic_store(1u, (unsigned __int8 *)(v118 + 32));
  }
  v119 = *(_anonymous_namespace_::PendingPathAnimation **)(v9 + 4568);
  *(void *)(v9 + 4568) = 0;
  if (v119)
  {
    MEMORY[0x1A6239270]();
  }
  uint64_t v214 = *(void *)(*(void *)(v9 + 152) + 72);
  long long v220 = v272;
  long long v221 = v273;
  long long v218 = v270;
  long long v219 = v271;
  long long v222 = v274;
  long long v223 = v275;
  long long v225 = v277;
  uint64_t v229 = v281;
  long long v231 = v283;
  uint64_t v224 = v276;
  int v228 = v280;
  uint64_t v226 = v278;
  v227 = v279;
  long long v230 = v282;
  *(void *)&long long v232 = v234;
  *((void *)&v232 + 1) = v234;
  *(void *)&long long v233 = v234;
  *((void *)&v233 + 1) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v232, (long long *)v284, v285);
  *(void *)((char *)v235 + 5) = *(void *)((char *)v289 + 5);
  v235[0] = v289[0];
  long long v236 = v290;
  uint64_t v237 = v291;
  long long v238 = v292;
  uint64_t v239 = v293;
  uint64_t v240 = v294;
  uint64_t v241 = v295;
  objc_copyWeak(&v242, (id *)v310);
  long long v245 = *(_OWORD *)&v311[16];
  long long v246 = *(_OWORD *)&v311[32];
  long long v247 = *(_OWORD *)v312;
  long long v248 = *(_OWORD *)&v312[16];
  long long v243 = *(_OWORD *)&v310[8];
  long long v244 = *(_OWORD *)v311;
  long long v250 = *(_OWORD *)&v313[8];
  uint64_t v254 = *(void *)((char *)v316 + 4);
  long long v256 = *(_OWORD *)__p;
  uint64_t v249 = *(void *)v313;
  uint64_t v251 = v314;
  int v253 = v316[0];
  v252 = v315;
  long long v255 = v317;
  *(void *)&long long v257 = v259;
  *((void *)&v257 + 1) = v259;
  *(void *)&long long v258 = v259;
  *((void *)&v258 + 1) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v257, (long long *)v319, v320);
  *(void *)((char *)v260 + 5) = *(void *)((char *)v324 + 5);
  v260[0] = v324[0];
  long long v261 = v325;
  uint64_t v262 = v326;
  long long v263 = v327;
  uint64_t v264 = v328;
  uint64_t v265 = v329;
  uint64_t v266 = v330;
  objc_copyWeak(&v267, &v269);
  v309 = 0;
  v120 = (char *)operator new(0xFE8uLL);
  v121 = v120;
  *(void *)v120 = &unk_1EF56C480;
  v122 = v120 + 520;
  *(_OWORD *)(v120 + 40) = v220;
  *(_OWORD *)(v120 + 56) = v221;
  *(_OWORD *)(v120 + 72) = v222;
  *(_OWORD *)(v120 + 88) = v223;
  *(_OWORD *)(v120 + 8) = v218;
  *(_OWORD *)(v120 + 24) = v219;
  v123 = (long long *)v232;
  *((void *)v120 + 13) = v224;
  *((_OWORD *)v120 + 7) = v225;
  *((_DWORD *)v120 + 36) = v228;
  *((void *)v120 + 16) = v226;
  *((void *)v120 + 17) = v227;
  *(void *)(v120 + 148) = v229;
  *((_OWORD *)v120 + 10) = v230;
  *((_OWORD *)v120 + 11) = v231;
  v124 = v120 + 224;
  *((void *)v120 + 24) = v120 + 224;
  *((void *)v120 + 25) = v120 + 224;
  long long v125 = v233;
  *((void *)v120 + 26) = v120 + 224;
  *((void *)v120 + 27) = *((void *)&v125 + 1);
  if (v123 != (long long *)v125)
  {
    uint64_t v126 = *((void *)&v232 + 1);
    *((void *)v120 + 24) = v123;
    *((void *)v120 + 25) = v126;
    long long v232 = 0u;
    long long v233 = 0u;
    goto LABEL_85;
  }
  v136 = (long long *)*((void *)&v232 + 1);
  BOOL v137 = *((void *)&v232 + 1) == (void)v123;
  *((void *)v120 + 25) = &v124[*((void *)&v232 + 1) - (void)v123];
  if (!v137)
  {
    uint64_t v138 = 0;
    v139 = v120 + 504;
    v140 = v120 + 520;
    do
    {
      long long v141 = *v123;
      *((void *)v124 + 2) = *((void *)v123 + 2);
      *(_OWORD *)v124 = v141;
      uint64_t v142 = *((void *)v123 + 3);
      *((_DWORD *)v124 + 8) = *((_DWORD *)v123 + 8);
      *((void *)v124 + 3) = v142;
      *(void *)(v124 + 36) = *(void *)((char *)v123 + 36);
      long long v143 = *(long long *)((char *)v123 + 44);
      long long v144 = *(long long *)((char *)v123 + 60);
      long long v145 = *(long long *)((char *)v123 + 76);
      *(_OWORD *)(v124 + 92) = *(long long *)((char *)v123 + 92);
      *(_OWORD *)(v124 + 76) = v145;
      *(_OWORD *)(v124 + 60) = v144;
      *(_OWORD *)(v124 + 44) = v143;
      long long v146 = *(long long *)((char *)v123 + 108);
      long long v147 = *(long long *)((char *)v123 + 124);
      long long v148 = *(long long *)((char *)v123 + 140);
      *(_OWORD *)(v124 + 156) = *(long long *)((char *)v123 + 156);
      *(_OWORD *)(v124 + 140) = v148;
      *(_OWORD *)(v124 + 124) = v147;
      *(_OWORD *)(v124 + 108) = v146;
      long long v149 = *(long long *)((char *)v123 + 172);
      long long v150 = *(long long *)((char *)v123 + 188);
      long long v151 = *(long long *)((char *)v123 + 204);
      *(_OWORD *)(v124 + 220) = *(long long *)((char *)v123 + 220);
      *(_OWORD *)(v124 + 204) = v151;
      *(_OWORD *)(v124 + 188) = v150;
      *(_OWORD *)(v124 + 172) = v149;
      v152 = v124 + 280;
      *((void *)v124 + 31) = v124 + 280;
      v153 = (char *)*((void *)v123 + 31);
      *((_DWORD *)v124 + 59) = *((_DWORD *)v123 + 59);
      v124[240] = *((unsigned char *)v123 + 240);
      *((void *)v124 + 32) = v124 + 280;
      *((void *)v124 + 33) = v124 + 280;
      *((void *)v124 + 34) = *((void *)v123 + 34);
      if (v153 == *((char **)v123 + 33))
      {
        *((void *)v124 + 32) = &v152[*((void *)v123 + 32) - (void)v153];
        v154 = (char *)*((void *)v123 + 32);
        if (v153 != v154)
        {
          unint64_t v155 = v154 - v153;
          if ((unint64_t)(v154 - v153) >= 8 && (unint64_t)(&v121[288 * v138 + 504] - v153) >= 0x20)
          {
            if (v155 < 0x20)
            {
              unint64_t v156 = 0;
              goto LABEL_110;
            }
            unint64_t v156 = v155 & 0xFFFFFFFFFFFFFFE0;
            v157 = (long long *)(v153 + 16);
            v158 = v140;
            unint64_t v159 = v155 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v160 = *v157;
              *(v158 - 1) = *(v157 - 1);
              _OWORD *v158 = v160;
              v157 += 2;
              v158 += 2;
              v159 -= 32;
            }
            while (v159);
            if (v155 == v156) {
              goto LABEL_99;
            }
            if ((v155 & 0x18) != 0)
            {
LABEL_110:
              unint64_t v161 = v155 & 0xFFFFFFFFFFFFFFF8;
              v152 += v155 & 0xFFFFFFFFFFFFFFF8;
              unint64_t v162 = v156 - (v155 & 0xFFFFFFFFFFFFFFF8);
              v163 = (uint64_t *)&v153[v156];
              v164 = &v139[v156];
              do
              {
                uint64_t v165 = *v163++;
                *(void *)v164 = v165;
                v164 += 8;
                v162 += 8;
              }
              while (v162);
              if (v155 == v161) {
                goto LABEL_99;
              }
              v153 += v161;
            }
            else
            {
              v153 += v156;
              v152 += v156;
            }
          }
          do
          {
            char v166 = *v153++;
            *v152++ = v166;
          }
          while (v153 != v154);
        }
      }
      else
      {
        *((void *)v124 + 31) = v153;
        *((void *)v124 + 32) = *((void *)v123 + 32);
        *(long long *)((char *)v123 + 248) = 0uLL;
        *(long long *)((char *)v123 + 264) = 0uLL;
      }
LABEL_99:
      v124 += 288;
      v123 += 18;
      ++v138;
      v140 += 18;
      v139 += 288;
    }
    while (v123 != v136);
  }
LABEL_85:
  *((void *)v121 + 244) = v235[0];
  *(void *)(v121 + 1957) = *(void *)((char *)v235 + 5);
  *((_OWORD *)v121 + 123) = v236;
  *((void *)v121 + 248) = v237;
  *(_OWORD *)(v121 + 1992) = v238;
  *((void *)v121 + 251) = v239;
  *((void *)v121 + 252) = v240;
  *((void *)v121 + 253) = v241;
  objc_moveWeak((id *)v121 + 254, &v242);
  long long v127 = v246;
  *(_OWORD *)(v121 + 2072) = v245;
  *(_OWORD *)(v121 + 2088) = v127;
  long long v128 = v248;
  *(_OWORD *)(v121 + 2104) = v247;
  *(_OWORD *)(v121 + 2120) = v128;
  long long v129 = v244;
  *(_OWORD *)(v121 + 2040) = v243;
  *(_OWORD *)(v121 + 2056) = v129;
  *((_OWORD *)v121 + 134) = v250;
  *(void *)(v122 + 1660) = v254;
  long long v130 = v255;
  *((_OWORD *)v121 + 138) = v256;
  *((void *)v121 + 267) = v249;
  *((void *)v121 + 270) = v251;
  *((_DWORD *)v121 + 544) = v253;
  *((void *)v121 + 271) = v252;
  *((_OWORD *)v121 + 137) = v130;
  v131 = v121 + 2256;
  *((void *)v121 + 278) = v121 + 2256;
  *((void *)v121 + 279) = v121 + 2256;
  *((void *)v121 + 280) = v121 + 2256;
  *((void *)v121 + 281) = *((void *)&v258 + 1);
  v132 = (long long *)v257;
  if ((void)v257 != (void)v258)
  {
    *((_OWORD *)v121 + 139) = v257;
    long long v257 = 0u;
    long long v258 = 0u;
    goto LABEL_87;
  }
  v167 = (long long *)*((void *)&v257 + 1);
  BOOL v137 = *((void *)&v257 + 1) == (void)v257;
  *((void *)v121 + 279) = &v131[*((void *)&v257 + 1) - v257];
  if (!v137)
  {
    uint64_t v168 = 0;
    v169 = v122 + 2032;
    v170 = v121 + 2536;
    do
    {
      long long v171 = *v132;
      *((void *)v131 + 2) = *((void *)v132 + 2);
      *(_OWORD *)v131 = v171;
      uint64_t v172 = *((void *)v132 + 3);
      *((_DWORD *)v131 + 8) = *((_DWORD *)v132 + 8);
      *((void *)v131 + 3) = v172;
      *(void *)(v131 + 36) = *(void *)((char *)v132 + 36);
      long long v173 = *(long long *)((char *)v132 + 44);
      long long v174 = *(long long *)((char *)v132 + 60);
      long long v175 = *(long long *)((char *)v132 + 76);
      *(_OWORD *)(v131 + 92) = *(long long *)((char *)v132 + 92);
      *(_OWORD *)(v131 + 76) = v175;
      *(_OWORD *)(v131 + 60) = v174;
      *(_OWORD *)(v131 + 44) = v173;
      long long v176 = *(long long *)((char *)v132 + 108);
      long long v177 = *(long long *)((char *)v132 + 124);
      long long v178 = *(long long *)((char *)v132 + 140);
      *(_OWORD *)(v131 + 156) = *(long long *)((char *)v132 + 156);
      *(_OWORD *)(v131 + 140) = v178;
      *(_OWORD *)(v131 + 124) = v177;
      *(_OWORD *)(v131 + 108) = v176;
      long long v179 = *(long long *)((char *)v132 + 172);
      long long v180 = *(long long *)((char *)v132 + 188);
      long long v181 = *(long long *)((char *)v132 + 204);
      *(_OWORD *)(v131 + 220) = *(long long *)((char *)v132 + 220);
      *(_OWORD *)(v131 + 204) = v181;
      *(_OWORD *)(v131 + 188) = v180;
      *(_OWORD *)(v131 + 172) = v179;
      v182 = v131 + 280;
      *((void *)v131 + 31) = v131 + 280;
      v183 = (char *)*((void *)v132 + 31);
      *((_DWORD *)v131 + 59) = *((_DWORD *)v132 + 59);
      v131[240] = *((unsigned char *)v132 + 240);
      *((void *)v131 + 32) = v131 + 280;
      *((void *)v131 + 33) = v131 + 280;
      *((void *)v131 + 34) = *((void *)v132 + 34);
      if (v183 == *((char **)v132 + 33))
      {
        *((void *)v131 + 32) = &v182[*((void *)v132 + 32) - (void)v183];
        v184 = (char *)*((void *)v132 + 32);
        if (v183 != v184)
        {
          unint64_t v185 = v184 - v183;
          if ((unint64_t)(v184 - v183) >= 8 && (unint64_t)(&v121[288 * v168 + 2536] - v183) >= 0x20)
          {
            if (v185 < 0x20)
            {
              unint64_t v186 = 0;
              goto LABEL_131;
            }
            unint64_t v186 = v185 & 0xFFFFFFFFFFFFFFE0;
            v187 = (long long *)(v183 + 16);
            v188 = v169;
            unint64_t v189 = v185 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v190 = *v187;
              *(v188 - 1) = *(v187 - 1);
              _OWORD *v188 = v190;
              v187 += 2;
              v188 += 2;
              v189 -= 32;
            }
            while (v189);
            if (v185 == v186) {
              goto LABEL_120;
            }
            if ((v185 & 0x18) != 0)
            {
LABEL_131:
              unint64_t v191 = v185 & 0xFFFFFFFFFFFFFFF8;
              v182 += v185 & 0xFFFFFFFFFFFFFFF8;
              unint64_t v192 = v186 - (v185 & 0xFFFFFFFFFFFFFFF8);
              v193 = (uint64_t *)&v183[v186];
              v194 = &v170[v186];
              do
              {
                uint64_t v195 = *v193++;
                *(void *)v194 = v195;
                v194 += 8;
                v192 += 8;
              }
              while (v192);
              if (v185 == v191) {
                goto LABEL_120;
              }
              v183 += v191;
            }
            else
            {
              v183 += v186;
              v182 += v186;
            }
          }
          do
          {
            char v196 = *v183++;
            *v182++ = v196;
          }
          while (v183 != v184);
        }
      }
      else
      {
        *((void *)v131 + 31) = v183;
        *((void *)v131 + 32) = *((void *)v132 + 32);
        *(long long *)((char *)v132 + 248) = 0uLL;
        *(long long *)((char *)v132 + 264) = 0uLL;
      }
LABEL_120:
      v131 += 288;
      v132 += 18;
      ++v168;
      v169 += 18;
      v170 += 288;
    }
    while (v132 != v167);
  }
LABEL_87:
  *((void *)v121 + 498) = v260[0];
  *(void *)(v121 + 3989) = *(void *)((char *)v260 + 5);
  *((_OWORD *)v121 + 250) = v261;
  *((void *)v121 + 502) = v262;
  *(_OWORD *)(v121 + 4024) = v263;
  *((void *)v121 + 505) = v264;
  *((void *)v121 + 506) = v265;
  *((void *)v121 + 507) = v266;
  objc_moveWeak((id *)v121 + 508, &v267);
  v309 = v121;
  geo::TaskQueue::async((std::__shared_weak_count_vtbl **)&v268, v214, v308);
  long long v133 = v268;
  long long v268 = 0uLL;
  v134 = *(std::__shared_weak_count **)(v9 + 4552);
  *(_OWORD *)(v9 + 4544) = v133;
  if (v134 && !atomic_fetch_add(&v134->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
    std::__shared_weak_count::__release_weak(v134);
  }
  v135 = (std::__shared_weak_count *)*((void *)&v268 + 1);
  if (*((void *)&v268 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v268 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
    std::__shared_weak_count::__release_weak(v135);
  }
  if (v309 == v308)
  {
    (*(void (**)(void *))(v308[0] + 32))(v308);
  }
  else if (v309)
  {
    (*(void (**)(void))(*v309 + 40))();
  }
  objc_destroyWeak(&v267);
  v197 = (void *)*((void *)&v257 + 1);
  v198 = (void *)v257;
  if ((void)v257 != *((void *)&v257 + 1))
  {
    do
    {
      v199 = (void *)v198[31];
      if (v199 != (void *)v198[33]) {
        free(v199);
      }
      v198 += 36;
    }
    while (v198 != v197);
    v198 = (void *)v257;
  }
  if (v198 != (void *)v258) {
    free(v198);
  }
  objc_destroyWeak(&v242);
  v200 = (void *)*((void *)&v232 + 1);
  v201 = (void *)v232;
  if ((void)v232 != *((void *)&v232 + 1))
  {
    do
    {
      v202 = (void *)v201[31];
      if (v202 != (void *)v201[33]) {
        free(v202);
      }
      v201 += 36;
    }
    while (v201 != v200);
    v201 = (void *)v232;
  }
  if (v201 != (void *)v233) {
    free(v201);
  }
  v203 = (long long *)v319;
  v204 = v320;
  if (v319 != v320)
  {
    do
    {
      v205 = (void *)*((void *)v203 + 31);
      if (v205 != *((void **)v203 + 33)) {
        free(v205);
      }
      v203 += 18;
    }
    while (v203 != v204);
    v203 = (long long *)v319;
  }
  if (v203 != v321) {
    free(v203);
  }
  objc_destroyWeak((id *)v310);
  objc_destroyWeak(&v269);
  v206 = (long long *)v284;
  v207 = v285;
  if (v284 == v285)
  {
    char v42 = v216;
  }
  else
  {
    char v42 = v216;
    do
    {
      v208 = (void *)*((void *)v206 + 31);
      if (v208 != *((void **)v206 + 33)) {
        free(v208);
      }
      v206 += 18;
    }
    while (v206 != v207);
    v206 = (long long *)v284;
  }
  if (v206 != v286) {
    free(v206);
  }
  BOOL v41 = 1;
LABEL_173:

  return v41;
}

- (uint64_t)tapAtPoint:(uint64_t)a1
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 32);
  long long v6 = *(_OWORD *)(a2 + 48);
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  long long v8 = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v8;
  uint64_t v9 = *(void *)(a2 + 128);
  *(_DWORD *)(a1 + 136) = *(_DWORD *)(a2 + 136);
  *(void *)(a1 + 128) = v9;
  *(void *)(a1 + 140) = *(void *)(a2 + 140);
  long long v10 = *(_OWORD *)(a2 + 152);
  long long v11 = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = a1 + 216;
  uint64_t v12 = a1 + 184;
  *(_OWORD *)(a1 + 152) = v10;
  *(_OWORD *)(a1 + 168) = v11;
  *(void *)(a1 + 192) = a1 + 216;
  *(void *)(a1 + 200) = a1 + 216;
  *(void *)(a1 + 208) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(a1 + 184, *(long long **)(a2 + 184), *(long long **)(a2 + 192));
  uint64_t v13 = *(void *)(a2 + 1944);
  *(void *)(v12 + 1765) = *(void *)(a2 + 1949);
  *(void *)(v12 + 1760) = v13;
  long long v14 = *(_OWORD *)(a2 + 1960);
  *(void *)(v12 + 1792) = *(void *)(a2 + 1976);
  *(_OWORD *)(v12 + 1776) = v14;
  long long v15 = *(_OWORD *)(a2 + 1984);
  *(void *)(v12 + 1816) = *(void *)(a2 + 2000);
  *(_OWORD *)(v12 + 1800) = v15;
  *(void *)(v12 + 1824) = *(void *)(a2 + 2008);
  *(void *)(v12 + 1832) = *(void *)(a2 + 2016);
  objc_copyWeak((id *)(v12 + 1840), (id *)(a2 + 2024));
  long long v16 = *(_OWORD *)(a2 + 2032);
  *(_OWORD *)(v12 + 1864) = *(_OWORD *)(a2 + 2048);
  *(_OWORD *)(v12 + 1848) = v16;
  long long v17 = *(_OWORD *)(a2 + 2064);
  long long v18 = *(_OWORD *)(a2 + 2080);
  long long v19 = *(_OWORD *)(a2 + 2096);
  *(_OWORD *)(v12 + 1928) = *(_OWORD *)(a2 + 2112);
  *(_OWORD *)(v12 + 1912) = v19;
  *(_OWORD *)(v12 + 1896) = v18;
  *(_OWORD *)(v12 + 1880) = v17;
  *(void *)(v12 + 1944) = *(void *)(a2 + 2128);
  long long v20 = *(_OWORD *)(a2 + 2136);
  *(void *)(v12 + 1968) = *(void *)(a2 + 2152);
  *(_OWORD *)(v12 + 1952) = v20;
  uint64_t v21 = *(void *)(a2 + 2160);
  *(_DWORD *)(v12 + 1984) = *(_DWORD *)(a2 + 2168);
  *(void *)(v12 + 1976) = v21;
  *(_DWORD *)(v12 + 1988) = *(_DWORD *)(a2 + 2172);
  *(_DWORD *)(v12 + 1992) = *(_DWORD *)(a2 + 2176);
  long long v22 = *(_OWORD *)(a2 + 2184);
  *(_OWORD *)(v12 + 2016) = *(_OWORD *)(a2 + 2200);
  *(_OWORD *)(v12 + 2000) = v22;
  *(void *)(v12 + 2032) = v12 + 2064;
  *(void *)(v12 + 2040) = v12 + 2064;
  *(void *)(v12 + 2048) = v12 + 2064;
  *(void *)(v12 + 2056) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(v12 + 2032, *(long long **)(a2 + 2216), *(long long **)(a2 + 2224));
  uint64_t v23 = *(void *)(a2 + 3976);
  *(void *)(a1 + 3981) = *(void *)(a2 + 3981);
  *(void *)(a1 + 3976) = v23;
  long long v24 = *(_OWORD *)(a2 + 3992);
  *(void *)(a1 + 4008) = *(void *)(a2 + 4008);
  *(_OWORD *)(a1 + 3992) = v24;
  long long v25 = *(_OWORD *)(a2 + 4016);
  *(void *)(a1 + 4032) = *(void *)(a2 + 4032);
  *(_OWORD *)(a1 + 4016) = v25;
  *(void *)(a1 + 4040) = *(void *)(a2 + 4040);
  *(void *)(a1 + 4048) = *(void *)(a2 + 4048);
  objc_copyWeak((id *)(a1 + 4056), (id *)(a2 + 4056));
  return a1;
}

- (id)tapAtPoint:(id *)location
{
  v2 = location[24];
  uint64_t v3 = location[25];
  if (v2 != v3)
  {
    do
    {
      long long v4 = (void *)v2[31];
      if (v4 != (void *)v2[33]) {
        free(v4);
      }
      v2 += 36;
    }
    while (v2 != v3);
    v2 = location[24];
  }
  if (v2 != location[26]) {
    free(v2);
  }
  objc_destroyWeak(location);
  return location;
}

- (void)tapAtPoint:
{
  std::__function::__func<-[VKMuninCameraController tapAtPoint:]::$_14,std::allocator<-[VKMuninCameraController tapAtPoint:]::$_14>,void ()(void)>::~__func(a1);
  JUMPOUT(0x1A6239270);
}

- (double)tapAtPoint:
{
  *(void *)a2 = &unk_1EF56C438;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  long long v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 80) = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 96) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  *(_OWORD *)(a2 + 64) = v6;
  *(void *)(a2 + 112) = *(void *)(a1 + 112);
  long long v8 = *(_OWORD *)(a1 + 120);
  *(void *)(a2 + 136) = *(void *)(a1 + 136);
  *(_OWORD *)(a2 + 120) = v8;
  uint64_t v9 = *(void *)(a1 + 144);
  *(_DWORD *)(a2 + 152) = *(_DWORD *)(a1 + 152);
  *(void *)(a2 + 144) = v9;
  *(void *)(a2 + 156) = *(void *)(a1 + 156);
  long long v10 = *(_OWORD *)(a1 + 168);
  long long v11 = *(_OWORD *)(a1 + 184);
  *(void *)(a2 + 200) = a2 + 232;
  *(_OWORD *)(a2 + 168) = v10;
  *(_OWORD *)(a2 + 184) = v11;
  *(void *)(a2 + 208) = a2 + 232;
  *(void *)(a2 + 216) = a2 + 232;
  *(void *)(a2 + 224) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(a2 + 200, *(long long **)(a1 + 200), *(long long **)(a1 + 208));
  uint64_t v12 = *(void *)(a1 + 1960);
  *(void *)(a2 + 1965) = *(void *)(a1 + 1965);
  *(void *)(a2 + 1960) = v12;
  long long v13 = *(_OWORD *)(a1 + 1976);
  *(void *)(a2 + 1992) = *(void *)(a1 + 1992);
  *(_OWORD *)(a2 + 1976) = v13;
  long long v14 = *(_OWORD *)(a1 + 2000);
  *(void *)(a2 + 2016) = *(void *)(a1 + 2016);
  *(_OWORD *)(a2 + 2000) = v14;
  double result = *(double *)(a1 + 2024);
  *(double *)(a2 + 2024) = result;
  *(void *)(a2 + 2032) = *(void *)(a1 + 2032);
  return result;
}

- (char)tapAtPoint:
{
  v2 = (id *)(a1 + 8);
  uint64_t v3 = (char *)operator new(0x7F8uLL);
  *(void *)uint64_t v3 = &unk_1EF56C438;
  objc_copyWeak((id *)v3 + 1, v2);
  long long v4 = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v3 + 3) = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v3 + 4) = v4;
  long long v5 = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v3 + 5) = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v3 + 6) = v5;
  long long v6 = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v3 + 1) = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v3 + 2) = v6;
  *((void *)v3 + 14) = *(void *)(a1 + 112);
  *(_OWORD *)(v3 + 120) = *(_OWORD *)(a1 + 120);
  *((_DWORD *)v3 + 38) = *(_DWORD *)(a1 + 152);
  uint64_t v7 = *(void *)(a1 + 144);
  *((void *)v3 + 17) = *(void *)(a1 + 136);
  *((void *)v3 + 18) = v7;
  *(void *)(v3 + 156) = *(void *)(a1 + 156);
  *(_OWORD *)(v3 + 184) = *(_OWORD *)(a1 + 184);
  *(_OWORD *)(v3 + 168) = *(_OWORD *)(a1 + 168);
  *((void *)v3 + 25) = v3 + 232;
  *((void *)v3 + 26) = v3 + 232;
  *((void *)v3 + 27) = v3 + 232;
  *((void *)v3 + 28) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)(v3 + 200), *(long long **)(a1 + 200), *(long long **)(a1 + 208));
  *((void *)v3 + 245) = *(void *)(a1 + 1960);
  *(void *)(v3 + 1965) = *(void *)(a1 + 1965);
  *((void *)v3 + 249) = *(void *)(a1 + 1992);
  *(_OWORD *)(v3 + 1976) = *(_OWORD *)(a1 + 1976);
  *((_OWORD *)v3 + 125) = *(_OWORD *)(a1 + 2000);
  *((void *)v3 + 252) = *(void *)(a1 + 2016);
  *((void *)v3 + 253) = *(void *)(a1 + 2024);
  *((void *)v3 + 254) = *(void *)(a1 + 2032);
  return v3;
}

- (uint64_t)tapAtPoint:
{
  *(void *)a1 = &unk_1EF56C480;
  objc_destroyWeak((id *)(a1 + 4064));
  v2 = *(void **)(a1 + 2224);
  uint64_t v3 = *(void **)(a1 + 2232);
  if (v2 != v3)
  {
    do
    {
      long long v4 = (void *)v2[31];
      if (v4 != (void *)v2[33]) {
        free(v4);
      }
      v2 += 36;
    }
    while (v2 != v3);
    v2 = *(void **)(a1 + 2224);
  }
  if (v2 != *(void **)(a1 + 2240)) {
    free(v2);
  }
  objc_destroyWeak((id *)(a1 + 2032));
  long long v5 = *(void **)(a1 + 192);
  long long v6 = *(void **)(a1 + 200);
  if (v5 != v6)
  {
    do
    {
      uint64_t v7 = (void *)v5[31];
      if (v7 != (void *)v5[33]) {
        free(v7);
      }
      v5 += 36;
    }
    while (v5 != v6);
    long long v5 = *(void **)(a1 + 192);
  }
  if (v5 != *(void **)(a1 + 208)) {
    free(v5);
  }
  return a1;
}

- (void)moveAlongPath:(PathAnimationDescription *)a3 tap:(TapDescription *)a4 preloadedViews:()unordered_map<gdc:()std:()gdc:()std:(std:(std:(BOOL)a6 :shared_ptr<gdc::LayerData>>>> *)a5 :allocator<std::pair<const)gdc::LayerDataRequestKey :equal_to<gdc::LayerDataRequestKey> :LayerDataRequestKeyHash :shared_ptr<gdc::LayerData> :LayerDataRequestKey continued:
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  operator new();
}

void __70__VKMuninCameraController_moveAlongPath_tap_preloadedViews_continued___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained pathAnimationComplete:*(void *)(a1 + 2056)];
  }
}

- (void)resetPathAnimation
{
  uint64_t v3 = (_anonymous_namespace_::PendingPathAnimation *)*((void *)self + 571);
  *((void *)self + 571) = 0;
  if (v3)
  {
    MEMORY[0x1A6239270]();
  }
  if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
  }
  long long v4 = (id)GEOGetVectorKitVKMuninLog_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v8 = 0;
    _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "reset path animator in resetPathAnimation", v8, 2u);
  }

  long long v5 = (std::mutex *)((char *)self + 4176);
  if (std::mutex::try_lock((std::mutex *)((char *)self + 4176)))
  {
    uint64_t v6 = (void *)((char *)self + 4160);
    uint64_t v7 = (std::__shared_weak_count *)*((void *)self + 521);
    void *v6 = 0;
    v6[1] = 0;
    if (v7)
    {
      if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    std::mutex::unlock(v5);
  }
}

- (void)pathAnimationComplete:(unint64_t)a3
{
  long long v4 = (uint64_t *)*((void *)self + 571);
  if (v4)
  {
    double v84 = 0;
    BOOL v85 = 0;
    double v86 = 0;
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1];
    int64_t v7 = v6 - *v4;
    if (v6 != *v4)
    {
      unint64_t v8 = 0x63FB9AEB1FDCD759 * (v7 >> 3);
      if (v8 >= 0x2328A701194539) {
        abort();
      }
      uint64_t v9 = (char *)operator new(v7);
      double v84 = v9;
      double v86 = &v9[1864 * v8];
      do
      {
        *(void *)uint64_t v9 = *(void *)v5;
        long long v10 = *(_OWORD *)(v5 + 8);
        *((void *)v9 + 3) = *(void *)(v5 + 24);
        *(_OWORD *)(v9 + 8) = v10;
        uint64_t v11 = *(void *)(v5 + 32);
        *((_DWORD *)v9 + 10) = *(_DWORD *)(v5 + 40);
        *((void *)v9 + 4) = v11;
        *(void *)(v9 + 44) = *(void *)(v5 + 44);
        long long v12 = *(_OWORD *)(v5 + 56);
        long long v13 = *(_OWORD *)(v5 + 72);
        long long v14 = v9 + 120;
        *((void *)v9 + 11) = v9 + 120;
        long long v15 = v9 + 88;
        *((_OWORD *)v15 - 2) = v12;
        *((_OWORD *)v15 - 1) = v13;
        v15[1] = v14;
        v15[2] = v14;
        v15[3] = 6;
        geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)v15, *(long long **)(v5 + 88), *(long long **)(v5 + 96));
        uint64_t v16 = *(void *)(v5 + 1848);
        *(void *)((char *)v15 + 1765) = *(void *)(v5 + 1853);
        v15[220] = v16;
        uint64_t v9 = (char *)(v15 + 222);
        v5 += 1864;
      }
      while (v5 != v6);
      BOOL v85 = v9;
    }
    uint64_t v17 = v4[5];
    long long v87 = *(_OWORD *)(v4 + 3);
    long long v18 = *((_OWORD *)v4 + 3);
    uint64_t v19 = v4[8];
    uint64_t v88 = v17;
    uint64_t v90 = v19;
    long long v89 = v18;
    long long v20 = *(_OWORD *)(v4 + 9);
    uint64_t v92 = v4[11];
    long long v91 = v20;
    uint64_t v93 = v4[12];
    uint64_t v21 = v4[14];
    long long v22 = (std::__shared_weak_count *)v4[15];
    uint64_t v94 = v4[13];
    uint64_t v95 = v21;
    double v96 = v22;
    if (v22) {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v23 = v4[16];
    uint64_t v24 = *((void *)self + 571);
    long long v25 = *(_OWORD *)(v24 + 184);
    v63[2] = *(_OWORD *)(v24 + 168);
    v63[3] = v25;
    long long v26 = *(_OWORD *)(v24 + 216);
    v63[4] = *(_OWORD *)(v24 + 200);
    v63[5] = v26;
    long long v27 = *(_OWORD *)(v24 + 152);
    v63[0] = *(_OWORD *)(v24 + 136);
    v63[1] = v27;
    long long v65 = *(_OWORD *)(v24 + 240);
    uint64_t v69 = *(void *)(v24 + 276);
    long long v28 = *(_OWORD *)(v24 + 288);
    long long v71 = *(_OWORD *)(v24 + 304);
    uint64_t v97 = v23;
    uint64_t v29 = *(void *)(v24 + 256);
    uint64_t v30 = *(void *)(v24 + 264);
    uint64_t v64 = *(void *)(v24 + 232);
    uint64_t v66 = v29;
    uint64_t v67 = v30;
    int v68 = *(_DWORD *)(v24 + 272);
    long long v70 = v28;
    double v72 = v76;
    double v73 = v76;
    double v74 = v76;
    uint64_t v75 = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v72, *(long long **)(v24 + 320), *(long long **)(v24 + 328));
    *(void *)((char *)v77 + 5) = *(void *)(v24 + 2085);
    v77[0] = *(void *)(v24 + 2080);
    long long v78 = *(_OWORD *)(v24 + 2096);
    uint64_t v79 = *(void *)(v24 + 2112);
    uint64_t v81 = *(void *)(v24 + 2136);
    long long v80 = *(_OWORD *)(v24 + 2120);
    uint64_t v82 = *(void *)(v24 + 2144);
    uint64_t v83 = *(void *)(v24 + 2152);
    uint64_t v31 = *((void *)self + 571);
    double v32 = *(void **)(v31 + 2160);
    *(void *)(v31 + 2160) = 0;
    unint64_t v33 = *(void *)(v31 + 2168);
    v60[0] = v32;
    v60[1] = (void *)v33;
    *(void *)(v31 + 2168) = 0;
    uint64_t v34 = *(void **)(v31 + 2176);
    uint64_t v35 = *(void **)(v31 + 2184);
    __p[0] = v34;
    __p[1] = v35;
    int v62 = *(_DWORD *)(v31 + 2192);
    if (v35)
    {
      uint64_t v36 = (void *)(v31 + 2176);
      unint64_t v37 = v34[1];
      if ((v33 & (v33 - 1)) != 0)
      {
        if (v37 >= v33) {
          v37 %= v33;
        }
      }
      else
      {
        v37 &= v33 - 1;
      }
      *((void *)v32 + v37) = __p;
      *uint64_t v36 = 0;
      v36[1] = 0;
    }
    [(VKMuninCameraController *)self moveAlongPath:&v84 tap:v63 preloadedViews:v60 continued:1];
    char v42 = __p[0];
    if (__p[0])
    {
      while (1)
      {
        char v43 = *(unsigned char **)v42;
        char v44 = (std::__shared_weak_count *)*((void *)v42 + 17);
        if (v44)
        {
          if (!atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
            break;
          }
        }
        if (v42[112]) {
          goto LABEL_30;
        }
LABEL_31:
        double v45 = (void *)*((void *)v42 + 4);
        if (v45 != *((void **)v42 + 6)) {
          free(v45);
        }
        operator delete(v42);
        char v42 = v43;
        if (!v43) {
          goto LABEL_35;
        }
      }
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
      if (!v42[112]) {
        goto LABEL_31;
      }
LABEL_30:
      v42[112] = 0;
      goto LABEL_31;
    }
LABEL_35:
    double v46 = v60[0];
    v60[0] = 0;
    if (v46) {
      operator delete(v46);
    }
    __double2 v47 = v72;
    double v48 = v73;
    if (v72 != v73)
    {
      do
      {
        double v49 = (void *)v47[31];
        if (v49 != (void *)v47[33]) {
          free(v49);
        }
        v47 += 36;
      }
      while (v47 != v48);
      __double2 v47 = v72;
    }
    if (v47 != (void *)v74) {
      free(v47);
    }
    __double2 v50 = v96;
    if (v96 && !atomic_fetch_add(&v96->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
    uint64_t v51 = v84;
    if (v84)
    {
      float v52 = v85;
      float v53 = v84;
      if (v85 != v84)
      {
        do
        {
          float v54 = v52 - 1864;
          float v55 = (void *)*((void *)v52 - 222);
          float v56 = (void *)*((void *)v52 - 221);
          if (v55 != v56)
          {
            do
            {
              double v57 = (void *)v55[31];
              if (v57 != (void *)v55[33]) {
                free(v57);
              }
              v55 += 36;
            }
            while (v55 != v56);
            float v55 = (void *)*((void *)v52 - 222);
          }
          if (v55 != *((void **)v52 - 220)) {
            free(v55);
          }
          v52 -= 1864;
        }
        while (v54 != v51);
        float v53 = v84;
      }
      BOOL v85 = v51;
      operator delete(v53);
    }
    double v58 = (_anonymous_namespace_::PendingPathAnimation *)*((void *)self + 571);
    *((void *)self + 571) = 0;
    if (v58)
    {
      MEMORY[0x1A6239270]();
    }
  }
  else
  {
    if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
    }
    int v38 = (id)GEOGetVectorKitVKMuninLog_log;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      __int16 v59 = 0;
      _os_log_impl(&dword_1A1780000, v38, OS_LOG_TYPE_INFO, "reset path animator in pathAnimationComplete", (uint8_t *)&v59, 2u);
    }

    v39 = (std::mutex *)((char *)self + 4176);
    if (std::mutex::try_lock((std::mutex *)((char *)self + 4176)))
    {
      v40 = (void *)((char *)self + 4160);
      BOOL v41 = (std::__shared_weak_count *)*((void *)self + 521);
      void *v40 = 0;
      v40[1] = 0;
      if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
      std::mutex::unlock(v39);
    }
  }
}

- (void)pathAnimationPrepared:(PathAnimationDescription *)a3 tap:(TapDescription *)a4 preloadedViews:()unordered_map<gdc:()std:()gdc:()std:(std:(std::shared_ptr<gdc::LayerData>>>> *)a5 :allocator<std::pair<const)gdc::LayerDataRequestKey :equal_to<gdc::LayerDataRequestKey> :LayerDataRequestKeyHash :shared_ptr<gdc::LayerData> :LayerDataRequestKey
{
  uint64_t v5 = MEMORY[0x1F4188790](self);
  int64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  long long v12 = (void *)v5;
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  long long v13 = *(std::__shared_weak_count **)(v5 + 4552);
  *(void *)(v5 + 4544) = 0;
  *(void *)(v5 + 4552) = 0;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  if (v12[567] != *((void *)v9 + 252)) {
    return;
  }
  uint64_t v14 = v12[570];
  if (v14)
  {
    objc_msgSend(v12, "camera", gdc::CameraFrame<geo::Radians,double>::fromRigidTransformEcefNoOffset((uint64_t)v141, (double *)(v14 + 48)));
    double v15 = gdc::ViewDataAccess::worldViewProjectionMatrix((uint64_t)v140, v142, v141);
    uint64_t v16 = v143;
    if (v143 && !atomic_fetch_add(&v143->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, double))v16->__on_zero_shared)(v16, v15);
      std::__shared_weak_count::__release_weak(v16);
    }
    double v17 = *((double *)v9 + 1);
    double v18 = *((double *)v9 + 2);
    double v19 = 1.0 / (v140[15] + v140[3] * *(double *)v9 + v140[7] * v17 + v140[11] * v18);
    double v20 = v19 * (v140[12] + *(double *)v9 * v140[0] + v17 * v140[4] + v18 * v140[8]);
    double v21 = v19 * (v140[13] + v140[1] * *(double *)v9 + v140[5] * v17 + v140[9] * v18);
    double v22 = v19 * (v140[14] + v140[2] * *(double *)v9 + v140[6] * v17 + v140[10] * v18);
    double v23 = fabs(v21);
    if (fabs(v20) <= 1.0 && v23 <= 1.0 && v22 <= 1.0)
    {
      long long v143 = 0;
      uint64_t v142 = 0;
      long long v144 = 0;
      uint64_t v58 = *v11;
      uint64_t v59 = v11[1];
      int64_t v60 = v59 - *v11;
      if (v59 != *v11)
      {
        unint64_t v61 = 0x63FB9AEB1FDCD759 * (v60 >> 3);
        if (v61 > 0x2328A701194538) {
          abort();
        }
        int v62 = (char *)operator new(v60);
        uint64_t v142 = (double *)v62;
        long long v143 = (std::__shared_weak_count *)v62;
        long long v144 = &v62[1864 * v61];
        do
        {
          double v63 = v62;
          *(void *)int v62 = *(void *)v58;
          long long v64 = *(_OWORD *)(v58 + 8);
          *((void *)v62 + 3) = *(void *)(v58 + 24);
          *(_OWORD *)(v62 + 8) = v64;
          uint64_t v65 = *(void *)(v58 + 32);
          *((_DWORD *)v62 + 10) = *(_DWORD *)(v58 + 40);
          *((void *)v62 + 4) = v65;
          *(void *)(v62 + 44) = *(void *)(v58 + 44);
          long long v66 = *(_OWORD *)(v58 + 56);
          long long v67 = *(_OWORD *)(v58 + 72);
          *((void *)v62 + 11) = v62 + 120;
          int v68 = v62 + 88;
          *(_OWORD *)(v62 + 56) = v66;
          *(_OWORD *)(v62 + 72) = v67;
          *((void *)v62 + 12) = v62 + 120;
          *((void *)v62 + 13) = v62 + 120;
          *((void *)v62 + 14) = 6;
          geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)(v62 + 88), *(long long **)(v58 + 88), *(long long **)(v58 + 96));
          uint64_t v69 = *(void *)(v58 + 1848);
          *(void *)((char *)v68 + 1765) = *(void *)(v58 + 1853);
          v68[220] = v69;
          v58 += 1864;
          int v62 = (char *)(v68 + 222);
        }
        while (v58 != v59);
        long long v143 = (std::__shared_weak_count *)(v63 + 1864);
      }
      long long v145 = *(_OWORD *)(v11 + 3);
      uint64_t v70 = v11[5];
      long long v147 = *((_OWORD *)v11 + 3);
      uint64_t v71 = v11[8];
      uint64_t v146 = v70;
      uint64_t v148 = v71;
      long long v149 = *(_OWORD *)(v11 + 9);
      uint64_t v150 = v11[11];
      uint64_t v151 = v11[12];
      uint64_t v72 = v11[14];
      uint64_t v73 = v11[15];
      uint64_t v152 = v11[13];
      uint64_t v153 = v72;
      uint64_t v154 = v73;
      if (v73) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v73 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v74 = v11[16];
      long long v75 = v9[3];
      long long v158 = v9[2];
      long long v159 = v75;
      long long v76 = v9[5];
      long long v160 = v9[4];
      long long v161 = v76;
      long long v77 = v9[1];
      long long v156 = *v9;
      long long v157 = v77;
      uint64_t v78 = *((void *)v9 + 12);
      uint64_t v155 = v74;
      uint64_t v162 = v78;
      long long v163 = *(long long *)((char *)v9 + 104);
      int v166 = *((_DWORD *)v9 + 34);
      uint64_t v79 = *((void *)v9 + 16);
      uint64_t v164 = *((void *)v9 + 15);
      uint64_t v165 = v79;
      uint64_t v167 = *(void *)((char *)v9 + 140);
      long long v80 = *(long long *)((char *)v9 + 168);
      long long v168 = *(long long *)((char *)v9 + 152);
      long long v169 = v80;
      v170[0] = v171;
      v170[1] = v171;
      v170[2] = v171;
      v170[3] = 6;
      geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)v170, *((long long **)v9 + 23), *((long long **)v9 + 24));
      *(void *)((char *)v172 + 5) = *(void *)((char *)v9 + 1949);
      v172[0] = *((void *)v9 + 243);
      uint64_t v174 = *((void *)v9 + 247);
      long long v173 = *(long long *)((char *)v9 + 1960);
      long long v175 = v9[124];
      uint64_t v176 = *((void *)v9 + 250);
      uint64_t v177 = *((void *)v9 + 251);
      uint64_t v178 = *((void *)v9 + 252);
      uint64_t v81 = (void *)*v7;
      unint64_t v82 = v7[1];
      long long v179 = (void *)*v7;
      unint64_t v180 = v82;
      *int64_t v7 = 0;
      v7[1] = 0;
      uint64_t v83 = v7[2];
      uint64_t v84 = v7[3];
      BOOL v85 = v7 + 2;
      v181[0] = v83;
      v181[1] = v84;
      int v182 = *((_DWORD *)v85 + 4);
      if (v84)
      {
        unint64_t v86 = *(void *)(v83 + 8);
        if ((v82 & (v82 - 1)) != 0)
        {
          if (v86 >= v82) {
            v86 %= v82;
          }
        }
        else
        {
          v86 &= v82 - 1;
        }
        v81[v86] = v181;
        *BOOL v85 = 0;
        v85[1] = 0;
      }
      operator new();
    }
    uint64_t v26 = v12[17];
    LOBYTE(v143) = 0;
    LOBYTE(v155) = 0;
    LOBYTE(v158) = 0;
    LOBYTE(v142) = 4;
    md::MuninSceneLogic::addSceneEvent(v26, (uint64_t)&v142);
    if ((_BYTE)v158)
    {
      if (*((void *)&v158 + 1))
      {
        *(void *)&long long v159 = *((void *)&v158 + 1);
        operator delete(*((void **)&v158 + 1));
      }
      LOBYTE(v158) = 0;
    }
    if ((_BYTE)v155)
    {
      long long v27 = (void *)v156;
      if ((void)v156)
      {
        long long v28 = (void *)*((void *)&v156 + 1);
        if (*((void *)&v156 + 1) != (void)v156)
        {
          do
          {
            v28 -= 249;
            std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v28);
          }
          while (v28 != v27);
          long long v27 = (void *)v156;
        }
        uint64_t v29 = v27;
LABEL_87:
        operator delete(v29);
        return;
      }
    }
    return;
  }
  long long v127 = 0;
  uint64_t v126 = 0;
  long long v128 = 0;
  uint64_t v30 = *v11;
  uint64_t v31 = v11[1];
  int64_t v32 = v31 - *v11;
  if (v31 != *v11)
  {
    unint64_t v33 = 0x63FB9AEB1FDCD759 * (v32 >> 3);
    if (v33 > 0x2328A701194538) {
      abort();
    }
    uint64_t v34 = operator new(v32);
    uint64_t v126 = v34;
    long long v128 = &v34[233 * v33];
    do
    {
      *uint64_t v34 = *(void *)v30;
      long long v35 = *(_OWORD *)(v30 + 8);
      v34[3] = *(void *)(v30 + 24);
      *(_OWORD *)(v34 + 1) = v35;
      uint64_t v36 = *(void *)(v30 + 32);
      *((_DWORD *)v34 + 10) = *(_DWORD *)(v30 + 40);
      v34[4] = v36;
      *(void *)((char *)v34 + 44) = *(void *)(v30 + 44);
      long long v37 = *(_OWORD *)(v30 + 56);
      long long v38 = *(_OWORD *)(v30 + 72);
      v39 = v34 + 15;
      v34[11] = v34 + 15;
      v40 = v34 + 11;
      *((_OWORD *)v40 - 2) = v37;
      *((_OWORD *)v40 - 1) = v38;
      v40[1] = v39;
      void v40[2] = v39;
      v40[3] = 6;
      geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)v40, *(long long **)(v30 + 88), *(long long **)(v30 + 96));
      uint64_t v41 = *(void *)(v30 + 1848);
      *(void *)((char *)v40 + 1765) = *(void *)(v30 + 1853);
      v40[220] = v41;
      uint64_t v34 = v40 + 222;
      v30 += 1864;
    }
    while (v30 != v31);
    long long v127 = (char *)v34;
  }
  long long v129 = *(_OWORD *)(v11 + 3);
  uint64_t v42 = v11[5];
  long long v131 = *((_OWORD *)v11 + 3);
  uint64_t v43 = v11[8];
  uint64_t v130 = v42;
  uint64_t v132 = v43;
  long long v133 = *(_OWORD *)(v11 + 9);
  uint64_t v134 = v11[11];
  uint64_t v135 = v11[12];
  uint64_t v44 = v11[14];
  double v45 = (std::__shared_weak_count *)v11[15];
  uint64_t v136 = v11[13];
  uint64_t v137 = v44;
  uint64_t v138 = v45;
  if (v45) {
    atomic_fetch_add_explicit(&v45->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v139 = v11[16];
  long long v46 = v9[3];
  v105[2] = v9[2];
  v105[3] = v46;
  long long v47 = v9[5];
  v105[4] = v9[4];
  v105[5] = v47;
  long long v48 = v9[1];
  v105[0] = *v9;
  v105[1] = v48;
  long long v49 = *(long long *)((char *)v9 + 104);
  uint64_t v50 = *((void *)v9 + 15);
  uint64_t v51 = *((void *)v9 + 16);
  uint64_t v106 = *((void *)v9 + 12);
  uint64_t v108 = v50;
  uint64_t v109 = v51;
  long long v107 = v49;
  int v110 = *((_DWORD *)v9 + 34);
  uint64_t v111 = *(void *)((char *)v9 + 140);
  long long v113 = *(long long *)((char *)v9 + 168);
  long long v112 = *(long long *)((char *)v9 + 152);
  v114 = v118;
  v115 = v118;
  v116 = v118;
  uint64_t v117 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v114, *((long long **)v9 + 23), *((long long **)v9 + 24));
  *(void *)((char *)v119 + 5) = *(void *)((char *)v9 + 1949);
  v119[0] = *((void *)v9 + 243);
  long long v120 = *(long long *)((char *)v9 + 1960);
  uint64_t v121 = *((void *)v9 + 247);
  long long v122 = v9[124];
  uint64_t v123 = *((void *)v9 + 250);
  uint64_t v124 = *((void *)v9 + 251);
  uint64_t v125 = *((void *)v9 + 252);
  float v52 = (void *)*v7;
  unint64_t v53 = v7[1];
  *int64_t v7 = 0;
  v7[1] = 0;
  float v55 = (void *)v7[2];
  float v54 = (void *)v7[3];
  float v56 = v7 + 2;
  v102[0] = v52;
  v102[1] = (void *)v53;
  v103[0] = v55;
  v103[1] = v54;
  int v104 = *((_DWORD *)v56 + 4);
  if (v54)
  {
    unint64_t v57 = v55[1];
    if ((v53 & (v53 - 1)) != 0)
    {
      if (v57 >= v53) {
        v57 %= v53;
      }
    }
    else
    {
      v57 &= v53 - 1;
    }
    v52[v57] = v103;
    *float v56 = 0;
    v56[1] = 0;
  }
  [v12 moveAlongPath:&v126 tap:v105 preloadedViews:v102 continued:0];
  long long v87 = v103[0];
  if (v103[0])
  {
    while (1)
    {
      uint64_t v88 = *(unsigned char **)v87;
      long long v89 = (std::__shared_weak_count *)*((void *)v87 + 17);
      if (v89)
      {
        if (!atomic_fetch_add(&v89->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      if (v87[112]) {
        goto LABEL_55;
      }
LABEL_56:
      uint64_t v90 = (void *)*((void *)v87 + 4);
      if (v90 != *((void **)v87 + 6)) {
        free(v90);
      }
      operator delete(v87);
      long long v87 = v88;
      if (!v88) {
        goto LABEL_60;
      }
    }
    ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
    std::__shared_weak_count::__release_weak(v89);
    if (!v87[112]) {
      goto LABEL_56;
    }
LABEL_55:
    v87[112] = 0;
    goto LABEL_56;
  }
LABEL_60:
  long long v91 = v102[0];
  v102[0] = 0;
  if (v91) {
    operator delete(v91);
  }
  uint64_t v92 = v114;
  uint64_t v93 = v115;
  if (v114 != v115)
  {
    do
    {
      uint64_t v94 = (void *)v92[31];
      if (v94 != (void *)v92[33]) {
        free(v94);
      }
      v92 += 36;
    }
    while (v92 != v93);
    uint64_t v92 = v114;
  }
  if (v92 != (void *)v116) {
    free(v92);
  }
  uint64_t v95 = v138;
  if (v138 && !atomic_fetch_add(&v138->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
    std::__shared_weak_count::__release_weak(v95);
  }
  double v96 = (char *)v126;
  if (v126)
  {
    uint64_t v97 = v127;
    uint64_t v29 = v126;
    if (v127 != v126)
    {
      do
      {
        double v98 = v97 - 1864;
        double v99 = (void *)*((void *)v97 - 222);
        long long v100 = (void *)*((void *)v97 - 221);
        if (v99 != v100)
        {
          do
          {
            uint64_t v101 = (void *)v99[31];
            if (v101 != (void *)v99[33]) {
              free(v101);
            }
            v99 += 36;
          }
          while (v99 != v100);
          double v99 = (void *)*((void *)v97 - 222);
        }
        if (v99 != *((void **)v97 - 220)) {
          free(v99);
        }
        v97 -= 1864;
      }
      while (v98 != v96);
      uint64_t v29 = v126;
    }
    long long v127 = v96;
    goto LABEL_87;
  }
}

- (void)runBumpAnimation:(const void *)a3 targetPoint:(const void *)a4 completionHandler:(id)a5
{
  location[32] = *(id *)MEMORY[0x1E4F143B8];
  id v25 = a5;
  objc_initWeak(location, self);
  long double v8 = *((double *)a3 + 2);
  double v9 = sqrt(*(double *)a3 * *(double *)a3 + *((double *)a3 + 1) * *((double *)a3 + 1));
  double v10 = atan2(v8, v9 * 0.996647189);
  __double2 v11 = __sincos_stret(v10);
  double v12 = atan2(v8 + v11.__sinval * v11.__sinval * 42841.3115 * v11.__sinval, v9 - v11.__cosval * v11.__cosval * 42697.6727 * v11.__cosval);
  __sincos_stret(v12);
  long double v13 = *(double *)a4;
  long double v14 = *((double *)a4 + 1);
  long double v15 = *((double *)a4 + 2);
  double v16 = sqrt(v13 * v13 + v14 * v14);
  double v17 = atan2(v15, v16 * 0.996647189);
  double v18 = atan2(v14, v13);
  __double2 v19 = __sincos_stret(v17);
  long double v20 = atan2(v15 + v19.__sinval * v19.__sinval * 42841.3115 * v19.__sinval, v16 - v19.__cosval * v19.__cosval * 42697.6727 * v19.__cosval);
  long double v21 = tan(v20 * 0.5 + 0.785398163);
  double v22 = atan(v21) * 2.0 + -1.57079633;
  long double v23 = fmod(v18 + 3.14159265, 6.28318531);
  double v24 = fmod(v23 + 6.28318531, 6.28318531) + -3.14159265;
  __sincos_stret(v22);
  __sincos_stret(v24);
  objc_copyWeak(&to, location);
  objc_copyWeak(&v28, location);
  uint64_t v26 = MEMORY[0x1A6239EB0](v25);
  objc_copyWeak(v27, location);
  v27[1] = (id)MEMORY[0x1A6239EB0](v26);
  +[VKDebugSettings sharedSettings];
  [(id)objc_claimAutoreleasedReturnValue() slowMotionBump];
  operator new();
}

- (void)runBumpAnimation:targetPoint:completionHandler:
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x1A6239270);
}

- (uint64_t)runBumpAnimation:targetPoint:completionHandler:
{
  return a1;
}

- (id)runBumpAnimation:targetPoint:completionHandler:
{
  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  id *v2 = off_1EF56C990;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (void)animatePath:(void *)a3 withTarget:(const void *)a4 lookAtTarget:(BOOL)a5 constantLod:(BOOL)a6 prePruneData:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a5;
  id v13 = a8;
  long double v14 = (void (**)(void, void))v13;
  if ((unint64_t)(0x63FB9AEB1FDCD759 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3)) < 2)
  {
    if (v13)
    {
      if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
      }
      long double v23 = (id)GEOGetVectorKitVKMuninLog_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1780000, v23, OS_LOG_TYPE_ERROR, "PointList size < 2. Cannot animate path.", buf, 2u);
      }

      v14[2](v14, 0);
    }
    goto LABEL_30;
  }
  long double v15 = (md::MuninSceneLogic *)*((void *)self + 17);
  id v31 = v13;
  double v16 = [(VKCameraController *)self canvas];
  [v16 sizeInPixels];
  uint64_t LodForCavasSize = md::MuninSceneLogic::getLodForCavasSize(v15, v37);

  double v18 = [(VKCameraController *)self mapDataAccess];
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformEcefNoOffset((uint64_t)buf, (double *)self + 560);
  uint64_t v19 = *((void *)self + 17);
  long double v20 = (std::__shared_weak_count *)operator new(0x2A8uLL);
  v20->__shared_owners_ = 0;
  v20->__shared_weak_owners_ = 0;
  v20->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF57F728;
  uint64_t v35 = v21;
  uint64_t v36 = v20;
  shared_owners = (std::__shared_weak_count *)v20[1].__shared_owners_;
  long double v14 = (void (**)(void, void))v31;
  if (!shared_owners)
  {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v20->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v20[1].__vftable = (std::__shared_weak_count_vtbl *)&v20[1];
    v20[1].__shared_owners_ = (uint64_t)v20;
LABEL_12:
    if (!atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
    goto LABEL_14;
  }
  if (shared_owners->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v20->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v20[1].__vftable = (std::__shared_weak_count_vtbl *)&v20[1];
    v20[1].__shared_owners_ = (uint64_t)v20;
    std::__shared_weak_count::__release_weak(shared_owners);
    goto LABEL_12;
  }
LABEL_14:
  *(_OWORD *)buf = 0u;
  *(_OWORD *)__p = 0u;
  int v34 = 1065353216;
  [(VKMuninCameraController *)self animatePath:a3 animator:&v35 preloadedRequiredViews:buf prePruneData:v30 completionHandler:v31];
  double v24 = __p[0];
  if (__p[0])
  {
    while (1)
    {
      id v25 = *(unsigned char **)v24;
      uint64_t v26 = (std::__shared_weak_count *)*((void *)v24 + 17);
      if (v26)
      {
        if (!atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      if (v24[112]) {
        goto LABEL_20;
      }
LABEL_21:
      long long v27 = (void *)*((void *)v24 + 4);
      if (v27 != *((void **)v24 + 6)) {
        free(v27);
      }
      operator delete(v24);
      double v24 = v25;
      if (!v25) {
        goto LABEL_25;
      }
    }
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
    if (!v24[112]) {
      goto LABEL_21;
    }
LABEL_20:
    v24[112] = 0;
    goto LABEL_21;
  }
LABEL_25:
  id v28 = *(void **)buf;
  *(void *)buf = 0;
  if (v28) {
    operator delete(v28);
  }
  uint64_t v29 = v36;
  if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
  }
LABEL_30:
}

- (void)animatePath:(void *)a3 animator:(const void *)a4 preloadedRequiredViews:(void *)a5 prePruneData:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v7 = MEMORY[0x1F4188790](self);
  char v9 = v8;
  uint64_t v11 = v10;
  uint64_t v117 = v12;
  long double v14 = v13;
  uint64_t v15 = v7;
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v116 = v16;
  uint64_t v17 = *v14;
  uint64_t v18 = v14[1] - *v14;
  if (v18 != 1864)
  {
    uint64_t v19 = *(void *)(*(void *)(v15 + 136) + 520);
    unint64_t v20 = 0x63FB9AEB1FDCD759 * (v18 >> 3) - 1;
    int v21 = *(_DWORD *)(v19 + 20);
    float64x2_t v22 = *(float64x2_t *)(v17 + 16);
    double v23 = *(double *)(v17 + 8);
    if (v20 <= 1) {
      unint64_t v20 = 1;
    }
    double v24 = (float64x2_t *)(v17 + 1880);
    do
    {
      double v25 = v24[-1].f64[1];
      float64x2_t v26 = *v24;
      float64x2_t v27 = vsubq_f64(*v24, v22);
      float64x2_t v28 = vmulq_f64(v27, v27);
      v21 += (unint64_t)sqrt(v28.f64[0] + (v25 - v23) * (v25 - v23) + v28.f64[1]);
      double v24 = (float64x2_t *)((char *)v24 + 1864);
      double v23 = v25;
      float64x2_t v22 = v26;
      --v20;
    }
    while (v20);
    *(_DWORD *)(v19 + 20) = v21;
  }
  long long v113 = (void *)(v15 + 4160);
  uint64_t v29 = *(void *)(v15 + 4160);
  if (v29)
  {
    uint64_t v30 = *v117;
    *(_OWORD *)(*v117 + 624) = *(_OWORD *)(v29 + 624);
    id v31 = *(id *)(v29 + 600);
    [v31 lastTimestamp];
    objc_msgSend(*(id *)(v30 + 600), "setLastTimestamp:");
  }
  char v114 = v9;
  objc_initWeak(&location, (id)v15);
  uint64_t v32 = *v117;
  objc_copyWeak(&to, &location);
  uint64_t v33 = v11;
  __p[0] = 0;
  __p[1] = 0;
  long long v128 = 0;
  uint64_t v34 = *v14;
  uint64_t v35 = v14[1];
  int64_t v36 = v35 - *v14;
  if (v35 != *v14)
  {
    unint64_t v37 = 0x63FB9AEB1FDCD759 * (v36 >> 3);
    if (v37 >= 0x2328A701194539) {
      abort();
    }
    long long v38 = (char *)operator new(v36);
    uint64_t v39 = 0;
    __p[0] = v38;
    __p[1] = v38;
    long long v128 = &v38[1864 * v37];
    do
    {
      uint64_t v40 = v34 + v39;
      uint64_t v41 = &v38[v39];
      *(void *)uint64_t v41 = *(void *)(v34 + v39);
      long long v42 = *(_OWORD *)(v34 + v39 + 8);
      *((void *)v41 + 3) = *(void *)(v34 + v39 + 24);
      *(_OWORD *)(v41 + 8) = v42;
      uint64_t v43 = *(void *)(v34 + v39 + 32);
      *((_DWORD *)v41 + 10) = *(_DWORD *)(v34 + v39 + 40);
      *((void *)v41 + 4) = v43;
      *(void *)(v41 + 44) = *(void *)(v34 + v39 + 44);
      long long v44 = *(_OWORD *)(v34 + v39 + 56);
      long long v45 = *(_OWORD *)(v34 + v39 + 72);
      uint64_t v46 = (uint64_t)&v38[v39 + 120];
      *((void *)v41 + 11) = v46;
      long long v47 = &v38[v39 + 88];
      *((_OWORD *)v47 - 2) = v44;
      *((_OWORD *)v47 - 1) = v45;
      *((void *)v47 + 1) = v46;
      *((void *)v47 + 2) = v46;
      *((void *)v47 + 3) = 6;
      geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)v47, *(long long **)(v34 + v39 + 88), *(long long **)(v34 + v39 + 96));
      uint64_t v48 = *(void *)(v34 + v39 + 1848);
      *(void *)&v38[v39 + 1853] = *(void *)(v34 + v39 + 1853);
      *(void *)&v38[v39 + 1848] = v48;
      v39 += 1864;
    }
    while (v40 + 1864 != v35);
    __p[1] = &v38[v39];
  }
  long long v143 = 0;
  long long v49 = (id *)operator new(0x28uLL);
  *long long v49 = &unk_1EF56BCA0;
  objc_moveWeak(v49 + 1, &to);
  uint64_t v50 = v33;
  *((_OWORD *)v49 + 1) = *(_OWORD *)__p;
  v49[4] = v128;
  __p[1] = 0;
  long long v128 = 0;
  __p[0] = 0;
  long long v143 = v49;
  uint64_t v51 = (uint8_t *)(*((uint64_t (**)(id *))*v49 + 2))(v49);
  float v52 = (uint8_t *)(v32 + 528);
  long long v147 = v51;
  if (buf == (uint8_t *)(v32 + 528))
  {
LABEL_21:
    if (v51 != buf) {
      goto LABEL_22;
    }
LABEL_25:
    (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
    goto LABEL_26;
  }
  unint64_t v53 = *(uint8_t **)(v32 + 552);
  if (v51 == buf)
  {
    if (v53 == v52)
    {
      (*(void (**)(uint8_t *, long long *))(*(void *)buf + 24))(buf, &v158);
      (*(void (**)(uint8_t *))(*(void *)v147 + 32))(v147);
      long long v147 = 0;
      (*(void (**)(void, uint8_t *))(**(void **)(v32 + 552) + 24))(*(void *)(v32 + 552), buf);
      (*(void (**)(void))(**(void **)(v32 + 552) + 32))(*(void *)(v32 + 552));
      *(void *)(v32 + 552) = 0;
      long long v147 = buf;
      (*(void (**)(long long *, uint64_t))(v158 + 24))(&v158, v32 + 528);
      (*(void (**)(long long *))(v158 + 32))(&v158);
      *(void *)(v32 + 552) = v52;
      uint64_t v51 = v147;
      if (v147 == buf) {
        goto LABEL_25;
      }
      goto LABEL_22;
    }
    (*(void (**)(uint8_t *, uint64_t))(*(void *)buf + 24))(buf, v32 + 528);
    (*(void (**)(uint8_t *))(*(void *)v147 + 32))(v147);
    uint64_t v51 = *(uint8_t **)(v32 + 552);
    long long v147 = v51;
    *(void *)(v32 + 552) = v52;
    goto LABEL_21;
  }
  if (v53 == v52)
  {
    (*(void (**)(uint64_t, uint8_t *))(*(void *)(v32 + 528) + 24))(v32 + 528, buf);
    (*(void (**)(void))(**(void **)(v32 + 552) + 32))(*(void *)(v32 + 552));
    *(void *)(v32 + 552) = v147;
    long long v147 = buf;
    goto LABEL_25;
  }
  long long v147 = *(uint8_t **)(v32 + 552);
  *(void *)(v32 + 552) = v51;
  uint64_t v51 = v53;
  if (v53 == buf) {
    goto LABEL_25;
  }
LABEL_22:
  if (v51) {
    (*(void (**)(uint8_t *))(*(void *)v51 + 40))(v51);
  }
LABEL_26:
  if (v143 == v142)
  {
    (*(void (**)(void *))(v142[0] + 32))(v142);
    float v54 = (char *)__p[0];
    if (!__p[0]) {
      goto LABEL_45;
    }
    goto LABEL_32;
  }
  if (v143) {
    (*((void (**)(void))*v143 + 5))();
  }
  float v54 = (char *)__p[0];
  if (__p[0])
  {
LABEL_32:
    float v55 = (char *)__p[1];
    float v56 = v54;
    if (__p[1] != v54)
    {
      do
      {
        unint64_t v57 = v55 - 1864;
        uint64_t v58 = (void *)*((void *)v55 - 222);
        uint64_t v59 = (void *)*((void *)v55 - 221);
        if (v58 != v59)
        {
          do
          {
            int64_t v60 = (void *)v58[31];
            if (v60 != (void *)v58[33]) {
              free(v60);
            }
            v58 += 36;
          }
          while (v58 != v59);
          uint64_t v58 = (void *)*((void *)v55 - 222);
        }
        if (v58 != *((void **)v55 - 220)) {
          free(v58);
        }
        v55 -= 1864;
      }
      while (v57 != v54);
      float v56 = (char *)__p[0];
    }
    __p[1] = v54;
    operator delete(v56);
  }
LABEL_45:
  objc_destroyWeak(&to);
  uint64_t v61 = *v117;
  objc_copyWeak(&from, &location);
  long long v141 = 0;
  uint64_t v139 = (void (**)(void **, uint8_t *))&unk_1EF56BCE8;
  objc_moveWeak(&v140, &from);
  long long v141 = (void **)&v139;
  objc_destroyWeak(&from);
  uint64_t v62 = (uint64_t)v141;
  if (!v141)
  {
LABEL_48:
    long long v147 = (uint8_t *)v62;
    goto LABEL_50;
  }
  if (v141 != (void **)&v139)
  {
    uint64_t v62 = (*((uint64_t (**)(void **))*v141 + 2))(v141);
    goto LABEL_48;
  }
  long long v147 = buf;
  v139[3]((void **)&v139, buf);
LABEL_50:
  uint64_t v63 = v61 + 560;
  if (buf != (uint8_t *)(v61 + 560))
  {
    long long v64 = v147;
    uint64_t v65 = *(void *)(v61 + 584);
    if (v147 == buf)
    {
      if (v65 == v63)
      {
        (*(void (**)(uint8_t *, long long *))(*(void *)buf + 24))(buf, &v158);
        (*(void (**)(uint8_t *))(*(void *)v147 + 32))(v147);
        long long v147 = 0;
        (*(void (**)(void, uint8_t *))(**(void **)(v61 + 584) + 24))(*(void *)(v61 + 584), buf);
        (*(void (**)(void))(**(void **)(v61 + 584) + 32))(*(void *)(v61 + 584));
        *(void *)(v61 + 584) = 0;
        long long v147 = buf;
        (*(void (**)(long long *, uint64_t))(v158 + 24))(&v158, v61 + 560);
        (*(void (**)(long long *))(v158 + 32))(&v158);
      }
      else
      {
        (*(void (**)(uint8_t *, uint64_t))(*(void *)buf + 24))(buf, v61 + 560);
        (*(void (**)(uint8_t *))(*(void *)v147 + 32))(v147);
        long long v147 = *(uint8_t **)(v61 + 584);
      }
      *(void *)(v61 + 584) = v63;
    }
    else if (v65 == v63)
    {
      (*(void (**)(uint64_t, uint8_t *))(*(void *)(v61 + 560) + 24))(v61 + 560, buf);
      (*(void (**)(void))(**(void **)(v61 + 584) + 32))(*(void *)(v61 + 584));
      *(void *)(v61 + 584) = v147;
      long long v147 = buf;
    }
    else
    {
      long long v147 = *(uint8_t **)(v61 + 584);
      *(void *)(v61 + 584) = v64;
    }
  }
  if (v147 == buf)
  {
    (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
  }
  else if (v147)
  {
    (*(void (**)(void))(*(void *)v147 + 40))();
  }
  if (v141 == (void **)&v139)
  {
    ((void (*)(void (***)(void **, uint8_t *)))v139[4])(&v139);
  }
  else if (v141)
  {
    (*((void (**)(void))*v141 + 5))();
  }
  v115 = (void *)MEMORY[0x1A6239EB0](v116);
  uint64_t v66 = *v117;
  objc_copyWeak(&v123, &location);
  uint64_t v124 = MEMORY[0x1A6239EB0](v115);
  uint64_t v138 = 0;
  uint64_t v136 = (void (**)(void **, void *))&unk_1EF56BD30;
  objc_moveWeak(v137, &v123);
  long long v67 = (void *)v124;
  uint64_t v124 = 0;
  v137[1] = v67;
  uint64_t v138 = (void **)&v136;
  objc_destroyWeak(&v123);
  *(void *)&long long v158 = 0;
  *((void *)&v158 + 1) = &v158;
  uint64_t v159 = 0x5012000000;
  long long v160 = __Block_byref_object_copy__18617;
  long long v161 = __Block_byref_object_dispose__18618;
  uint64_t v162 = "";
  uint64_t v68 = (uint64_t)v138;
  if (!v138) {
    goto LABEL_72;
  }
  if (v138 != (void **)&v136)
  {
    uint64_t v68 = (*((uint64_t (**)(void **))*v138 + 2))(v138);
LABEL_72:
    uint64_t v164 = (void *)v68;
    goto LABEL_74;
  }
  uint64_t v164 = v163;
  v136[3]((void **)&v136, v163);
LABEL_74:
  *(void *)buf = 0;
  long long v145 = buf;
  uint64_t i = 0xFC012000000;
  long long v147 = (uint8_t *)__Block_byref_object_copy__247;
  uint64_t v148 = __Block_byref_object_dispose__248;
  long long v149 = "";
  v130[0] = (id)MEMORY[0x1E4F143A8];
  v130[1] = (id)3221225472;
  v130[2] = ___ZN12_GLOBAL__N_112PathAnimator21setCompletionCallbackENSt3__18functionIFvPS0_bONS_12PointSegmentEEEE_block_invoke;
  v130[3] = &unk_1E5A91438;
  v130[5] = buf;
  v130[6] = (id)v66;
  v130[4] = &v158;
  [*(id *)(v66 + 600) setCompletionHandler:v130];
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v158, 8);
  if (v164 == v163)
  {
    (*(void (**)(void *))(v163[0] + 32))(v163);
  }
  else if (v164)
  {
    (*(void (**)(void))(*v164 + 40))();
  }
  if (v138 == (void **)&v136)
  {
    ((void (*)(void (***)(void **, void *)))v136[4])(&v136);
  }
  else if (v138)
  {
    (*((void (**)(void))*v138 + 5))();
  }
  if (std::mutex::try_lock((std::mutex *)(v15 + 4176)))
  {
    uint64_t v70 = *v117;
    uint64_t v69 = v117[1];
    if (v69) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v69 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v71 = *(std::__shared_weak_count **)(v15 + 4168);
    *long long v113 = v70;
    *(void *)(v15 + 4168) = v69;
    if (v71 && !atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
    std::mutex::unlock((std::mutex *)(v15 + 4176));
  }
  objc_copyWeak(v130, &location);
  if (*(void *)(v50 + 24))
  {
    if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
    }
    uint64_t v72 = (id)GEOGetVectorKitVKMuninLog_log;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1780000, v72, OS_LOG_TYPE_INFO, "Required view already loaded.", buf, 2u);
    }

    md::MuninSceneLogic::addActiveViews(*(void **)(v15 + 136), *(uint64_t **)(v50 + 16));
    -[VKMuninCameraController animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:]::$_7::operator()(v130);
  }
  else
  {
    uint64_t v74 = *(const md::mun::CollectionPoint **)(*v117 + 504);
    uint64_t v73 = *(const md::mun::CollectionPoint **)(*v117 + 512);
    if (v74 == v73)
    {
      *(void *)buf = 0;
      long long v145 = 0;
      uint64_t i = 0;
    }
    else
    {
      do
      {
        md::mun::MuninMetadataContainer::addActiveMetadataPoint(*(std::mutex **)(*(void *)(v15 + 136) + 168), v74);
        uint64_t v74 = (const md::mun::CollectionPoint *)((char *)v74 + 1992);
      }
      while (v74 != v73);
      uint64_t v75 = *(void *)(*v117 + 504);
      uint64_t v76 = *(void *)(*v117 + 512);
      *(void *)buf = 0;
      long long v145 = 0;
      for (uint64_t i = 0; v75 != v76; v75 += 1992)
      {
        long long v77 = *(long long **)(v75 + 1872);
        uint64_t v78 = *(uint64_t **)(v75 + 1864);
        if (v77 != (long long *)v78)
        {
          std::vector<std::pair<md::mun::ViewId,unsigned int>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<std::pair<md::mun::ViewId,unsigned int> const*>,std::__wrap_iter<std::pair<md::mun::ViewId,unsigned int> const*>>((void **)buf, (uint64_t)v145, v78, v77, 0xAAAAAAAAAAAAAAABLL * (((char *)v77 - (char *)v78) >> 3));
          ++*(_DWORD *)(*(void *)(*(void *)(v15 + 136) + 520) + 16);
        }
      }
    }
    uint64_t v79 = *(void *)(v15 + 4432);
    uint64_t v80 = *(void *)(v15 + 4424);
    if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
    }
    uint64_t v81 = (id)GEOGetVectorKitVKMuninLog_log;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      LODWORD(v158) = 134217984;
      *(void *)((char *)&v158 + 4) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v145[-*(void *)buf] >> 3);
      _os_log_impl(&dword_1A1780000, v81, OS_LOG_TYPE_INFO, "Preloading %zu initial views", (uint8_t *)&v158, 0xCu);
    }

    if (GEOGetVectorKitResourceLoadingLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitResourceLoadingLog_onceToken, &__block_literal_global_25);
    }
    unint64_t v82 = (id)GEOGetVectorKitResourceLoadingLog_log;
    if (os_signpost_enabled(v82))
    {
      LOWORD(v158) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A1780000, v82, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PathPreload", "", (uint8_t *)&v158, 2u);
    }

    uint64_t v83 = *(void *)(v15 + 136);
    objc_copyWeak(&v120, &location);
    *(void *)&long long v121 = v80;
    *((void *)&v121 + 1) = v79;
    objc_copyWeak(&v122, v130);
    uint64_t v135 = 0;
    uint64_t v84 = (id *)operator new(0x28uLL);
    *uint64_t v84 = &unk_1EF56BD78;
    objc_moveWeak(v84 + 1, &v120);
    *((_OWORD *)v84 + 1) = v121;
    objc_moveWeak(v84 + 4, &v122);
    uint64_t v135 = v84;
    md::MuninSceneLogic::addPreloadViews(v83, (const void **)buf, &v134);
    if (v135 == (id *)&v134)
    {
      (*(void (**)(uint64_t *))(v134 + 32))(&v134);
    }
    else if (v135)
    {
      (*((void (**)(void))*v135 + 5))();
    }
    objc_destroyWeak(&v122);
    objc_destroyWeak(&v120);
    if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
    }
    BOOL v85 = (id)GEOGetVectorKitVKMuninLog_log;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      uint64_t v86 = 0x367D6E020E64C149 * ((uint64_t)(*(void *)(*v117 + 512) - *(void *)(*v117 + 504)) >> 3);
      LODWORD(v158) = 134217984;
      *(void *)((char *)&v158 + 4) = v86;
      _os_log_impl(&dword_1A1780000, v85, OS_LOG_TYPE_INFO, "Preloading %zu optional points", (uint8_t *)&v158, 0xCu);
    }

    uint64_t v87 = *(void *)(*v117 + 504);
    uint64_t v88 = *(void *)(*v117 + 512);
    if (v87 != v88)
    {
      uint64_t v89 = v87 + 1888;
      do
      {
        if (*(void *)v89 != *(void *)(v89 + 8))
        {
          uint64_t v91 = *(void *)(v15 + 136);
          ++*(_DWORD *)(*(void *)(v91 + 520) + 16);
          objc_copyWeak(&v119, &location);
          long long v133 = 0;
          long long v131 = off_1EF56BDC0;
          objc_moveWeak(&v132, &v119);
          long long v133 = &v131;
          objc_destroyWeak(&v119);
          md::MuninSceneLogic::addPreloadViews(v91, (const void **)v89, &v131);
          if (v133 == &v131)
          {
            ((void (*)(uint64_t (***)()))v131[4])(&v131);
          }
          else if (v133)
          {
            (*v133)[5]();
          }
        }
        uint64_t v90 = v89 + 104;
        v89 += 1992;
      }
      while (v90 != v88);
    }
    if (*(void *)buf) {
      operator delete(*(void **)buf);
    }
  }
  uint64_t v92 = *objc_msgSend((id)v15, "runLoopController", v113);
  if (v92)
  {
    buf[0] = 4;
    md::MapEngine::setNeedsTick(v92, buf);
  }
  uint64_t v93 = *(void *)(v15 + 136);
  uint64_t v94 = [(id)v15 canvas];
  [v94 size];
  *(float *)&double v95 = v95;
  *(float *)&double v96 = v96;
  uint64_t v97 = 720;
  if ((float)(*(float *)&v95 / fmaxf(*(float *)&v96, 0.01)) > 1.0) {
    uint64_t v97 = 736;
  }
  uint64_t v98 = *(void *)(v93 + v97);

  uint64_t v118 = v98;
  [(id)v15 zoomAnimated:&v118 completion:0];
  objc_destroyWeak(v130);
  uint64_t v99 = *(void *)(v15 + 136);
  uint64_t v100 = *v117;
  LOBYTE(v145) = 0;
  char v151 = 0;
  char v155 = 0;
  buf[0] = 1;
  uint64_t v101 = *(void *)(v100 + 504);
  uint64_t v102 = *(void *)(v100 + 512);
  int64_t v103 = v102 - v101;
  if (v102 == v101)
  {
    long long v107 = 0;
    uint64_t v108 = 0;
    double v105 = 0;
  }
  else
  {
    unint64_t v104 = 0x367D6E020E64C149 * (v103 >> 3);
    if (v104 >= 0x20E64C148FEF8DLL) {
      abort();
    }
    double v105 = (char *)operator new(v103);
    uint64_t v106 = 0;
    long long v107 = &v105[1992 * v104];
    do
    {
      md::mun::PointView::PointView((md::mun::PointView *)&v105[v106], (const md::mun::PointView *)(v101 + v106));
      v106 += 1992;
    }
    while (v101 + v106 != v102);
    uint64_t v108 = &v105[v106];
  }
  *(void *)&long long v109 = v105;
  *((void *)&v109 + 1) = v108;
  long long v152 = v109;
  uint64_t v153 = v107;
  char v154 = v114;
  char v151 = 1;
  md::MuninSceneLogic::addSceneEvent(v99, (uint64_t)buf);
  if (v155)
  {
    if (v156)
    {
      long long v157 = v156;
      operator delete(v156);
    }
    char v155 = 0;
  }
  if (v151)
  {
    int v110 = (void *)v152;
    if ((void)v152)
    {
      uint64_t v111 = (void *)*((void *)&v152 + 1);
      long long v112 = (void *)v152;
      if (*((void *)&v152 + 1) != (void)v152)
      {
        do
        {
          v111 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v111);
        }
        while (v111 != v110);
        long long v112 = (void *)v152;
      }
      *((void *)&v152 + 1) = v110;
      operator delete(v112);
    }
  }

  objc_destroyWeak(&location);
}

- (id)animatePath:(id *)location animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  v2 = (char *)location[1];
  if (v2)
  {
    uint64_t v3 = (char *)location[2];
    id v4 = location[1];
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = v3 - 1864;
        uint64_t v6 = (void *)*((void *)v3 - 222);
        uint64_t v7 = (void *)*((void *)v3 - 221);
        if (v6 != v7)
        {
          do
          {
            char v8 = (void *)v6[31];
            if (v8 != (void *)v6[33]) {
              free(v8);
            }
            v6 += 36;
          }
          while (v6 != v7);
          uint64_t v6 = (void *)*((void *)v3 - 222);
        }
        if (v6 != *((void **)v3 - 220)) {
          free(v6);
        }
        v3 -= 1864;
      }
      while (v5 != v2);
      id v4 = location[1];
    }
    location[2] = v2;
    operator delete(v4);
  }
  objc_destroyWeak(location);
  return location;
}

- (void)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  *(void *)a1 = &unk_1EF56BCA0;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    id v4 = *(void **)(a1 + 16);
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = v3 - 1864;
        uint64_t v6 = *(void **)(v3 - 1776);
        uint64_t v7 = *(void **)(v3 - 1768);
        if (v6 != v7)
        {
          do
          {
            char v8 = (void *)v6[31];
            if (v8 != (void *)v6[33]) {
              free(v8);
            }
            v6 += 36;
          }
          while (v6 != v7);
          uint64_t v6 = *(void **)(v3 - 1776);
        }
        if (v6 != *(void **)(v3 - 1760)) {
          free(v6);
        }
        v3 -= 1864;
      }
      while (v5 != v2);
      id v4 = *(void **)(a1 + 16);
    }
    *(void *)(a1 + 24) = v2;
    operator delete(v4);
  }
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x1A6239270);
}

- (id)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  uint64_t v2 = (id *)(a1 + 8);
  uint64_t v3 = (id *)operator new(0x28uLL);
  id *v3 = &unk_1EF56BCA0;
  objc_copyWeak(v3 + 1, v2);
  std::vector<md::mun::CollectionPoint>::vector(v3 + 2, (uint64_t *)(a1 + 16));
  return v3;
}

- (uint64_t)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  *(void *)a1 = &unk_1EF56BCA0;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    id v4 = *(void **)(a1 + 16);
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = v3 - 1864;
        uint64_t v6 = *(void **)(v3 - 1776);
        uint64_t v7 = *(void **)(v3 - 1768);
        if (v6 != v7)
        {
          do
          {
            char v8 = (void *)v6[31];
            if (v8 != (void *)v6[33]) {
              free(v8);
            }
            v6 += 36;
          }
          while (v6 != v7);
          uint64_t v6 = *(void **)(v3 - 1776);
        }
        if (v6 != *(void **)(v3 - 1760)) {
          free(v6);
        }
        v3 -= 1864;
      }
      while (v5 != v2);
      id v4 = *(void **)(a1 + 16);
    }
    *(void *)(a1 + 24) = v2;
    operator delete(v4);
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (BOOL)isAnimationsRunning
{
  if ([(VKMuninCameraController *)self isAnimationsRunningExceptBump]) {
    return 1;
  }
  return [(VKMuninCameraController *)self isBumpAnimationRunning];
}

- (BOOL)isBumpAnimationRunning
{
  uint64_t v2 = *((void *)self + 530);
  if (v2) {
    return [*(id *)(v2 + 64) running];
  }
  else {
    return 0;
  }
}

- (BOOL)isPathAnimationRunning
{
  uint64_t v2 = *((void *)self + 520);
  if (v2) {
    return [*(id *)(v2 + 600) running];
  }
  else {
    return 0;
  }
}

- (BOOL)isAnimationsRunningExceptBump
{
  uint64_t v3 = (void *)*((void *)self + 535);
  if (v3 && ([v3 running] & 1) != 0
    || [(VKMuninCameraController *)self isPathAnimationRunning])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v4 = (void *)*((void *)self + 541);
    if (v4)
    {
      LOBYTE(v4) = [v4 running];
    }
  }
  return (char)v4;
}

- (BOOL)cancelPendingMoveExceptBump
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void ***)((char *)self + 4560);
  if (*v3) {
  ++*((void *)self + 567);
  }
  md::MuninSceneLogic::cancelAllViewPreloads(*((md::MuninSceneLogic **)self + 17));
  uint64_t v4 = *((void *)self + 17);
  v8[8] = 0;
  char v9 = 0;
  char v12 = 0;
  v8[0] = 4;
  md::MuninSceneLogic::addSceneEvent(v4, (uint64_t)v8);
  if (v12 && __p) {
    operator delete(__p);
  }
  if (v9)
  {
    uint64_t v5 = v10;
    if (v10)
    {
      uint64_t v6 = v11;
      if (v11 != v10)
      {
        do
        {
          v6 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v6);
        }
        while (v6 != v5);
      }
      operator delete(v5);
    }
  }
  [(VKMuninCameraController *)self stopAnimationsExceptBump];
  return 1;
}

- (BOOL)cancelPendingMove
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void ***)((char *)self + 4560);
  if (*v3) {
  ++*((void *)self + 567);
  }
  md::MuninSceneLogic::cancelAllViewPreloads(*((md::MuninSceneLogic **)self + 17));
  if ([(VKMuninCameraController *)self isPathAnimationRunning])
  {
    uint64_t v4 = *((void *)self + 17);
    v8[8] = 0;
    char v9 = 0;
    char v12 = 0;
    v8[0] = 4;
    md::MuninSceneLogic::addSceneEvent(v4, (uint64_t)v8);
    if (v12 && __p) {
      operator delete(__p);
    }
    if (v9)
    {
      uint64_t v5 = v10;
      if (v10)
      {
        uint64_t v6 = v11;
        if (v11 != v10)
        {
          do
          {
            v6 -= 249;
            std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v6);
          }
          while (v6 != v5);
        }
        operator delete(v5);
      }
    }
  }
  [(VKMuninCameraController *)self stopAnimations];
  return 1;
}

- (void)stopAnimations
{
  [(VKMuninCameraController *)self stopAnimationsExceptBump];
  uint64_t v3 = (uint64_t *)((char *)self + 4240);
  if (*v3)
  {
    if ([*(id *)(*v3 + 64) running])
    {
      uint64_t v4 = *(void **)(*v3 + 64);
      [v4 stop];
    }
    else
    {
    }
  }
}

- (void)stopAnimationsExceptBump
{
  uint64_t v3 = (void *)((char *)self + 4160);
  uint64_t v4 = *((void *)self + 520);
  if (v4)
  {
    if ([*(id *)(v4 + 600) running])
    {
      [*(id *)(*v3 + 600) stop];
    }
    else
    {
      if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v5 = (id)GEOGetVectorKitVKMuninLog_log;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "reset path animator in stopAnimationsExceptBump", v17, 2u);
      }

      if (std::mutex::try_lock((std::mutex *)((char *)self + 4176)))
      {
        uint64_t v6 = (std::__shared_weak_count *)v3[1];
        void *v3 = 0;
        v3[1] = 0;
        if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
        std::mutex::unlock((std::mutex *)((char *)self + 4176));
      }
    }
    uint64_t v7 = *(void *)(*((void *)self + 17) + 520);
    *(_DWORD *)uint64_t v7 = 3;
    *(void *)(v7 + 12) = 0;
    *(void *)(v7 + 4) = 0;
    if (*(void *)(v7 + 88))
    {
      char v8 = *(void **)(v7 + 80);
      if (v8)
      {
        do
        {
          char v9 = (void *)*v8;
          operator delete(v8);
          char v8 = v9;
        }
        while (v9);
      }
      *(void *)(v7 + 80) = 0;
      uint64_t v10 = *(void *)(v7 + 72);
      if (v10)
      {
        for (uint64_t i = 0; i != v10; ++i)
          *(void *)(*(void *)(v7 + 64) + 8 * i) = 0;
      }
      *(void *)(v7 + 88) = 0;
    }
    *(_OWORD *)(v7 + 48) = 0u;
    *(_OWORD *)(v7 + 36) = 0u;
    *(_OWORD *)(v7 + 20) = 0u;
  }
  char v12 = (void *)*((void *)self + 535);
  if (v12)
  {
    if ([v12 running]) {
      [*((id *)self + 535) stop];
    }
    id v13 = (void *)*((void *)self + 535);
    if (v13)
    {
      *((void *)self + 535) = 0;
    }
  }
  uint64_t v14 = (char *)self + 4320;
  uint64_t v15 = (void *)*((void *)v14 + 1);
  if (v15)
  {
    if ([v15 running]) {
      [*((id *)v14 + 1) stop];
    }
    id v16 = (void *)*((void *)v14 + 1);
    if (v16)
    {
      *((void *)v14 + 1) = 0;
    }
  }
}

- (void)setCurrentSegment:(void *)a3
{
  uint64_t v4 = (char *)self + 168;
  uint64_t v5 = (md::mun::PointView *)(v4 + 8);
  if (*v4)
  {
    md::mun::PointView::operator=((uint64_t)v5, (uint64_t)v6);
    md::mun::PointView::operator=((uint64_t)(v4 + 2000), (uint64_t)&v7);
  }
  else
  {
    unsigned char *v4 = 1;
  }
}

- (BOOL)moveToPoint:(const void *)a3 withHeading:()Unit<geo:(double>)a4 :()Unit<geo:(double>)a5 :(BOOL)a6 RadianUnitDescription RadianUnitDescription withPitch:(id)a7 animated:completionHandler:
{
  int v9 = v7;
  uint64_t v11 = (double *)a6;
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v14 = v8;
  if (*((unsigned char *)self + 168) && *((void *)self + 22) == *(void *)a3)
  {
    __double2 v15 = __sincos_stret(*((double *)self + 557));
    double v16 = 6378137.0 / sqrt(1.0 - v15.__sinval * v15.__sinval * 0.00669437999);
    double v17 = *((double *)self + 559);
    long double v18 = (v17 + v16 * 0.99330562) * v15.__sinval;
    double v19 = (v16 + v17) * v15.__cosval;
    __double2 v20 = __sincos_stret(*((double *)self + 558));
    long double v21 = v19 * v20.__sinval;
    long double v22 = v19 * v20.__cosval;
    double v23 = sqrt(v22 * v22 + v21 * v21);
    double v24 = atan2(v18, v23 * 0.996647189);
    __double2 v25 = __sincos_stret(v24);
    double v26 = atan2(v18 + v25.__sinval * v25.__sinval * 42841.3115 * v25.__sinval, v23 + v25.__cosval * v25.__cosval * -42697.6727 * v25.__cosval);
    double v27 = atan2(v21, v22) * 57.2957795;
    double v28 = *v11;
    double v29 = *(double *)a7 * 57.2957795;
    if (v9) {
      double v30 = 0.5;
    }
    else {
      double v30 = 0.0;
    }
    __double2 v31 = __sincos_stret(v26);
    -[VKMuninCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:", 0, VKAnimationCurveLinear, v14, v26 * 57.2957795, v27, v23 / v31.__cosval - 6378137.0 / sqrt(1.0 - v31.__sinval * v31.__sinval * 0.00669437999), v28 * -57.2957795, v29, v30);
    goto LABEL_64;
  }
  [(VKMuninCameraController *)self cancelPendingMove];
  long long v127 = 0u;
  long long v126 = 0u;
  long double v32 = *((double *)a3 + 7) * 6.28318531;
  long double v33 = exp(*((double *)a3 + 8) * 6.28318531 + -3.14159265);
  double v34 = atan(v33) * 2.0 + -1.57079633;
  long double v35 = fmod(v32, 6.28318531);
  long double v36 = fmod(v35 + 6.28318531, 6.28318531);
  uint64_t v37 = *((void *)a3 + 9);
  double v124 = v34;
  *(double *)&long long v125 = v36 + -3.14159265;
  double v38 = *v11;
  uint64_t v39 = *(void *)a7;
  *((void *)&v125 + 1) = v37;
  *((void *)&v126 + 1) = v39;
  *(double *)&long long v127 = v38;
  if (v9 && *((unsigned char *)self + 168))
  {
    id v122 = 0;
    *(double *)&id location = 0.0;
    unint64_t v123 = 0;
    uint64_t v40 = std::vector<md::mun::CollectionPoint>::__push_back_slow_path<md::mun::CollectionPoint const&>((uint64_t *)&location, (uint64_t)self + 176);
    uint64_t v41 = v40;
    id v122 = v40;
    if ((unint64_t)v40 >= v123)
    {
      long long v47 = std::vector<md::mun::CollectionPoint>::__push_back_slow_path<md::mun::CollectionPoint const&>((uint64_t *)&location, (uint64_t)a3);
    }
    else
    {
      *(void *)uint64_t v40 = *(void *)a3;
      long long v42 = *(_OWORD *)((char *)a3 + 8);
      *((void *)v40 + 3) = *((void *)a3 + 3);
      *(_OWORD *)(v40 + 8) = v42;
      uint64_t v43 = *((void *)a3 + 4);
      *((_DWORD *)v40 + 10) = *((_DWORD *)a3 + 10);
      *((void *)v40 + 4) = v43;
      *(void *)(v40 + 44) = *(void *)((char *)a3 + 44);
      long long v44 = *(_OWORD *)((char *)a3 + 56);
      long long v45 = *(_OWORD *)((char *)a3 + 72);
      *((void *)v40 + 11) = v40 + 120;
      *(_OWORD *)(v40 + 56) = v44;
      *(_OWORD *)(v40 + 72) = v45;
      *((void *)v40 + 12) = v40 + 120;
      *((void *)v40 + 13) = v40 + 120;
      *((void *)v40 + 14) = 6;
      geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)(v40 + 88), *((long long **)a3 + 11), *((long long **)a3 + 12));
      uint64_t v46 = *((void *)a3 + 231);
      *(void *)(v41 + 1853) = *(void *)((char *)a3 + 1853);
      *((void *)v41 + 231) = v46;
      long long v47 = v41 + 1864;
    }
    id v122 = v47;
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformEcefNoOffset((uint64_t)&v114, &v124);
    v113[0] = v114 - (v119 * (v117 * 200.0) - v120 * (v118 * -200.0));
    v113[1] = v115 + v118 * -200.0 * v119 + v120 * (v117 * 200.0);
    v113[2] = v116 - -(v117 * 200.0 * v117 + -100.0 - v118 * -200.0 * v118);
    [(VKMuninCameraController *)self animatePath:&location withTarget:v113 lookAtTarget:1 constantLod:1 prePruneData:0 completionHandler:v14];
    BOOL v85 = (char *)location;
    if (*(double *)&location != 0.0)
    {
      uint64_t v86 = v122;
      double v84 = *(double *)&location;
      if (v122 != location)
      {
        do
        {
          uint64_t v87 = v86 - 1864;
          uint64_t v88 = (void *)*((void *)v86 - 222);
          uint64_t v89 = (void *)*((void *)v86 - 221);
          if (v88 != v89)
          {
            do
            {
              uint64_t v90 = (void *)v88[31];
              if (v90 != (void *)v88[33]) {
                free(v90);
              }
              v88 += 36;
            }
            while (v88 != v89);
            uint64_t v88 = (void *)*((void *)v86 - 222);
          }
          if (v88 != *((void **)v86 - 220)) {
            free(v88);
          }
          v86 -= 1864;
        }
        while (v87 != v85);
        double v84 = *(double *)&location;
      }
      id v122 = v85;
      goto LABEL_63;
    }
  }
  else
  {
    uint64_t v48 = (md::MuninSceneLogic *)*((void *)self + 17);
    id v94 = v14;
    long long v49 = [(VKCameraController *)self canvas];
    uint64_t v92 = (long long *)((char *)a3 + 56);
    uint64_t v93 = self;
    [v49 sizeInPixels];
    uint64_t LodForCavasSize = md::MuninSceneLogic::getLodForCavasSize(v48, v131);

    double v115 = 0.0;
    double v114 = 0.0;
    double v116 = 0.0;
    uint64_t v52 = *((void *)a3 + 11);
    uint64_t v51 = *((void *)a3 + 12);
    if (v52 == v51)
    {
      double v54 = 0.0;
    }
    else
    {
      double v53 = 0.0;
      double v54 = 0.0;
      uint64_t v95 = *((void *)a3 + 12);
      do
      {
        uint64_t v55 = *(void *)a3;
        char v56 = *(unsigned char *)(v52 + 240);
        char v57 = *((unsigned char *)a3 + 1859);
        if (*(void *)&v53 < *(void *)&v116)
        {
          **(void **)&double v53 = v55;
          *(unsigned char *)(*(void *)&v53 + 8) = v56;
          *(unsigned char *)(*(void *)&v53 + 9) = LodForCavasSize;
          *(unsigned char *)(*(void *)&v53 + 10) = v57;
          *(_DWORD *)(*(void *)&v53 + 16) = -1073741827;
          *(void *)&v53 += 24;
        }
        else
        {
          double v58 = v54;
          uint64_t v59 = a3;
          uint64_t v60 = LodForCavasSize;
          unint64_t v61 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v53 - *(void *)&v58) >> 3);
          unint64_t v62 = v61 + 1;
          double v63 = v58;
          if (v61 + 1 > 0xAAAAAAAAAAAAAAALL)
          {
            double v114 = v58;
            abort();
          }
          if (0x5555555555555556 * ((uint64_t)(*(void *)&v116 - *(void *)&v58) >> 3) > v62) {
            unint64_t v62 = 0x5555555555555556 * ((uint64_t)(*(void *)&v116 - *(void *)&v58) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v116 - *(void *)&v58) >> 3) >= 0x555555555555555) {
            unint64_t v64 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v64 = v62;
          }
          if (v64 > 0xAAAAAAAAAAAAAAALL) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v65 = (char *)operator new(24 * v64);
          uint64_t v66 = &v65[24 * v61];
          *(void *)uint64_t v66 = v55;
          v66[8] = v56;
          uint64_t LodForCavasSize = v60;
          v66[9] = v60;
          v66[10] = v57;
          *((_DWORD *)v66 + 4) = -1073741827;
          if (*(void *)&v53 == *(void *)&v63)
          {
            double v68 = *(double *)&v66;
            a3 = v59;
          }
          else
          {
            long long v67 = v66;
            a3 = v59;
            do
            {
              *(void *)&double v68 = v67 - 24;
              long long v69 = *(_OWORD *)(*(void *)&v53 - 24);
              *((void *)v67 - 1) = *(void *)(*(void *)&v53 - 8);
              *(_OWORD *)(v67 - 24) = v69;
              *(void *)&v53 -= 24;
              v67 -= 24;
            }
            while (*(void *)&v53 != *(void *)&v63);
          }
          *(void *)&double v53 = v66 + 24;
          *(void *)&double v116 = &v65[24 * v64];
          if (v63 != 0.0) {
            operator delete(*(void **)&v63);
          }
          double v54 = v68;
          uint64_t v51 = v95;
        }
        double v115 = v53;
        v52 += 288;
      }
      while (v52 != v51);
    }
    double v114 = v54;
    md::mun::MuninMetadataContainer::addActiveMetadataPoint(*(std::mutex **)(*((void *)v93 + 17) + 168), (const md::mun::CollectionPoint *)a3);
    [(VKCameraController *)v93 beginRegionChange:1];
    id v14 = v94;
    uint64_t v70 = (void *)MEMORY[0x1A6239EB0](v94);
    objc_initWeak(&location, v93);
    uint64_t v71 = *((void *)v93 + 17);
    objc_copyWeak(&to, &location);
    uint64_t v97 = *(void *)a3;
    long long v98 = *(_OWORD *)((char *)a3 + 8);
    uint64_t v72 = *((void *)a3 + 4);
    uint64_t v99 = *((void *)a3 + 3);
    uint64_t v100 = v72;
    int v101 = *((_DWORD *)a3 + 10);
    uint64_t v102 = *(void *)((char *)a3 + 44);
    long long v73 = v92[1];
    long long v103 = *v92;
    long long v104 = v73;
    double v105 = (long long *)v109;
    uint64_t v106 = (long long *)v109;
    long long v107 = (long long *)v109;
    uint64_t v108 = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v105, *((long long **)a3 + 11), *((long long **)a3 + 12));
    *(void *)((char *)v110 + 5) = *(void *)((char *)a3 + 1853);
    v110[0] = *((void *)a3 + 231);
    *(double *)uint64_t v111 = v34;
    *(_OWORD *)&v111[8] = v125;
    *(_OWORD *)&v111[24] = v126;
    *(_OWORD *)&v111[40] = v127;
    id v112 = (id)MEMORY[0x1A6239EB0](v70);
    long long v129 = 0;
    uint64_t v74 = (char *)operator new(0x798uLL);
    *(void *)uint64_t v74 = &unk_1EF56CB88;
    objc_moveWeak((id *)v74 + 1, &to);
    uint64_t v75 = v97;
    *((void *)v74 + 13) = v74 + 136;
    *((void *)v74 + 2) = v75;
    *(_OWORD *)(v74 + 24) = v98;
    uint64_t v76 = v100;
    *((void *)v74 + 5) = v99;
    *((void *)v74 + 6) = v76;
    *((_DWORD *)v74 + 14) = v101;
    *(void *)(v74 + 60) = v102;
    long long v77 = v104;
    *(_OWORD *)(v74 + 72) = v103;
    *(_OWORD *)(v74 + 88) = v77;
    *((void *)v74 + 14) = v74 + 136;
    *((void *)v74 + 15) = v74 + 136;
    *((void *)v74 + 16) = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)(v74 + 104), v105, v106);
    *((void *)v74 + 233) = v110[0];
    *(void *)(v74 + 1869) = *(void *)((char *)v110 + 5);
    long long v78 = *(_OWORD *)&v111[16];
    *(_OWORD *)(v74 + 1880) = *(_OWORD *)v111;
    *(_OWORD *)(v74 + 1896) = v78;
    *(_OWORD *)(v74 + 1912) = *(_OWORD *)&v111[32];
    *((void *)v74 + 241) = *(void *)&v111[48];
    id v79 = v112;
    id v112 = 0;
    *((void *)v74 + 242) = v79;
    long long v129 = v74;
    md::MuninSceneLogic::addPreloadViews(v71, (const void **)&v114, v128);
    if (v129 == v128)
    {
      (*(void (**)(void *))(v128[0] + 32))(v128);
    }
    else if (v129)
    {
      (*(void (**)(void))(*v129 + 40))();
    }

    uint64_t v81 = v105;
    uint64_t v80 = v106;
    if (v105 != v106)
    {
      do
      {
        unint64_t v82 = (void *)*((void *)v81 + 31);
        if (v82 != *((void **)v81 + 33)) {
          free(v82);
        }
        v81 += 18;
      }
      while (v81 != v80);
      uint64_t v81 = v105;
    }
    if (v81 != v107) {
      free(v81);
    }
    objc_destroyWeak(&to);
    uint64_t v83 = *(void *)[(VKCameraController *)v93 runLoopController];
    if (v83)
    {
      LOBYTE(v113[0]) = 4;
      md::MapEngine::setNeedsTick(v83, v113);
    }
    objc_destroyWeak(&location);

    if (v54 != 0.0)
    {
      double v115 = v54;
      double v84 = v54;
LABEL_63:
      operator delete(*(void **)&v84);
    }
  }
LABEL_64:

  return 1;
}

- (uint64_t)moveToPoint:(uint64_t)a1 withHeading:withPitch:animated:completionHandler:
{
  uint64_t v2 = *(void **)(a1 + 96);
  uint64_t v3 = *(void **)(a1 + 104);
  if (v2 != v3)
  {
    do
    {
      uint64_t v4 = (void *)v2[31];
      if (v4 != (void *)v2[33]) {
        free(v4);
      }
      v2 += 36;
    }
    while (v2 != v3);
    uint64_t v2 = *(void **)(a1 + 96);
  }
  if (v2 != *(void **)(a1 + 112)) {
    free(v2);
  }
  objc_destroyWeak((id *)a1);
  return a1;
}

- (void)moveToPoint:withHeading:withPitch:animated:completionHandler:
{
  *(void *)a1 = &unk_1EF56CB88;

  uint64_t v2 = *(void **)(a1 + 104);
  uint64_t v3 = *(void **)(a1 + 112);
  if (v2 != v3)
  {
    do
    {
      uint64_t v4 = (void *)v2[31];
      if (v4 != (void *)v2[33]) {
        free(v4);
      }
      v2 += 36;
    }
    while (v2 != v3);
    uint64_t v2 = *(void **)(a1 + 104);
  }
  if (v2 != *(void **)(a1 + 120)) {
    free(v2);
  }
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x1A6239270);
}

- (uint64_t)moveToPoint:withHeading:withPitch:animated:completionHandler:
{
  *(void *)a1 = &unk_1EF56CB88;

  uint64_t v2 = *(void **)(a1 + 104);
  uint64_t v3 = *(void **)(a1 + 112);
  if (v2 != v3)
  {
    do
    {
      uint64_t v4 = (void *)v2[31];
      if (v4 != (void *)v2[33]) {
        free(v4);
      }
      v2 += 36;
    }
    while (v2 != v3);
    uint64_t v2 = *(void **)(a1 + 104);
  }
  if (v2 != *(void **)(a1 + 120)) {
    free(v2);
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (uint64_t)moveToPoint:(uint64_t)a1 withHeading:(uint64_t)a2 withPitch:animated:completionHandler:
{
  objc_copyWeak((id *)a1, (id *)a2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 52) = *(void *)(a2 + 52);
  long long v6 = *(_OWORD *)(a2 + 64);
  long long v7 = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = a1 + 128;
  *(_OWORD *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 80) = v7;
  *(void *)(a1 + 104) = a1 + 128;
  *(void *)(a1 + 112) = a1 + 128;
  *(void *)(a1 + 120) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(a1 + 96, *(long long **)(a2 + 96), *(long long **)(a2 + 104));
  uint64_t v8 = *(void *)(a2 + 1856);
  *(void *)(a1 + 1861) = *(void *)(a2 + 1861);
  *(void *)(a1 + 1856) = v8;
  *(void *)(a1 + 1872) = *(void *)(a2 + 1872);
  *(void *)(a1 + 1880) = *(void *)(a2 + 1880);
  *(void *)(a1 + 1888) = *(void *)(a2 + 1888);
  *(void *)(a1 + 1896) = *(void *)(a2 + 1896);
  *(void *)(a1 + 1904) = *(void *)(a2 + 1904);
  *(void *)(a1 + 1912) = *(void *)(a2 + 1912);
  *(void *)(a1 + 1920) = *(void *)(a2 + 1920);
  *(void *)(a1 + 1928) = MEMORY[0x1A6239EB0](*(void *)(a2 + 1928));
  return a1;
}

- (void)selectLabelMarker:(const void *)a3 completion:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  long long v6 = (void (**)(id, void))a4;
  uint64_t v7 = *((void *)self + 520);
  if (v7 && ([*(id *)(v7 + 600) running] & 1) != 0
    || (uint64_t v8 = *(void *)a3, *(unsigned char *)(*(void *)a3 + 224)))
  {
    v6[2](v6, 0);
    goto LABEL_5;
  }
  int v9 = (std::__shared_weak_count *)*((void *)a3 + 1);
  uint64_t v84 = *(void *)a3;
  BOOL v85 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *(void *)(v8 + 288);
  uint64_t v11 = *(std::__shared_weak_count **)(v8 + 296);
  uint64_t v82 = v10;
  uint64_t v83 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v12 = *(unsigned __int8 *)(v10 + 1211);
  if (v12 == 17)
  {
    uint64_t v25 = 1;
  }
  else
  {
    if (v12 == 18)
    {
      uint64_t v13 = *(void *)(v10 + 8);
      id v14 = *(std::__shared_weak_count **)(v10 + 16);
      uint64_t v80 = v13;
      uint64_t v81 = v14;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v15 = *(void *)(v13 + 464);
      if (!v15) {
        goto LABEL_33;
      }
      unsigned int v16 = *(_DWORD *)(v10 + 48);
      uint64_t v17 = v13 + 464;
      do
      {
        unsigned int v18 = *(_DWORD *)(v15 + 32);
        BOOL v19 = v18 >= v16;
        if (v18 >= v16) {
          __double2 v20 = (uint64_t *)v15;
        }
        else {
          __double2 v20 = (uint64_t *)(v15 + 8);
        }
        if (v19) {
          uint64_t v17 = v15;
        }
        uint64_t v15 = *v20;
      }
      while (*v20);
      if (v17 != v13 + 464
        && v16 >= *(_DWORD *)(v17 + 32)
        && (long double v21 = *(long long **)(*(void *)(v13 + 672) + 16 * *(unsigned __int8 *)(v17 + 121))) != 0)
      {
        [(VKMuninCameraController *)self cancelPendingMove];
        long long v22 = *v21;
        uint64_t v79 = *((void *)v21 + 2);
        long long v78 = v22;
        uint64_t v23 = *((void *)self + 17);
        double v24 = *(uint64_t **)(v23 + 528);
        v86[0] = &unk_1EF56C870;
        v86[1] = v23;
        uint64_t v87 = v86;
        md::mun::MuninNavigation::path(&__p, *v24, (char *)self + 176, (uint64_t)&v78, 1, v23 + 616, (uint64_t)v86);
        if (v87 == v86)
        {
          (*(void (**)(void *))(v86[0] + 32))(v86);
        }
        else if (v87)
        {
          (*(void (**)(void))(*v87 + 40))();
        }
        double v27 = +[VKDebugSettings sharedSettings];
        if (([v27 forceBumpNextTap] & 1) != 0 || objc_msgSend(v27, "forceBumpAll"))
        {
          double v28 = *((double *)self + 558);
          double v29 = *((double *)self + 559);
          __double2 v30 = __sincos_stret(*((double *)self + 557));
          double v31 = 6378137.0 / sqrt(v30.__sinval * v30.__sinval * -0.00669437999 + 1.0);
          double v32 = (v31 + v29) * v30.__cosval;
          __double2 v33 = __sincos_stret(v28);
          *(double *)id location = v32 * v33.__cosval;
          *(double *)&location[1] = v32 * v33.__sinval;
          double v64 = (v29 + v31 * 0.99330562) * v30.__sinval;
          [(VKMuninCameraController *)self runBumpAnimation:location targetPoint:&v78 completionHandler:&__block_literal_global_18632];
          [v27 setForceBumpNextTap:0];
        }
        else if ((unint64_t)(0x63FB9AEB1FDCD759 * ((v77 - (unsigned char *)__p) >> 3)) < 2)
        {
          geo::Geocentric<double>::Geocentric<geo::Radians,double>((double *)&v71, (double *)self + 557);
          md::mun::lookAtOrientation((double *)&v68, (double *)&v71, (double *)&v78);
          *(_OWORD *)id location = v71;
          double v64 = v72;
          long long v65 = v68;
          uint64_t v66 = v69;
          uint64_t v67 = v70;
          gdc::CameraFrame<geo::Radians,double>::fromRigidTransformEcefNoOffset((uint64_t)v60, (double *)location);
          double v44 = v61;
          double v43 = v62;
          long long v45 = (void *)*((void *)self + 553);
          uint64_t v46 = (void *)*((void *)self + 554);
          geo::_retain_ptr<VKTimedAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::reset((uint64_t)self + 4272, v47);

          objc_initWeak(&from, self);
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3321888768;
          v57[2] = __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_3;
          v57[3] = &unk_1EF58E868;
          objc_copyWeak(v58, &from);
          v58[1] = v46;
          v58[2] = *(id *)&v44;
          v58[3] = v45;
          v58[4] = *(id *)&v43;
          [*((id *)self + 535) setStepHandler:v57];
          uint64_t v48 = (void *)MEMORY[0x1A6239EB0](v6);
          uint64_t v50 = MEMORY[0x1E4F143A8];
          uint64_t v51 = 3221225472;
          uint64_t v52 = __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_28;
          double v53 = &unk_1E5A913E8;
          double v54 = self;
          id v49 = v48;
          id v55 = v49;
          objc_copyWeak(&v56, &from);
          [*((id *)self + 535) setCompletionHandler:&v50];
          -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v50, v51, v52, v53, v54);
          md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], *((VKAnimation **)self + 535));
          objc_destroyWeak(&v56);

          objc_destroyWeak(v58);
          objc_destroyWeak(&from);
        }
        else
        {
          objc_initWeak(location, self);
          uint64_t v41 = (void *)MEMORY[0x1A6239EB0](v6);
          v73[0] = MEMORY[0x1E4F143A8];
          v73[1] = 3221225472;
          v73[2] = __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_2;
          v73[3] = &unk_1E5A98E30;
          id v74 = v41;
          id v42 = v41;
          objc_copyWeak(&v75, location);
          [(VKMuninCameraController *)self animatePath:&__p withTarget:&v78 lookAtTarget:1 constantLod:0 prePruneData:1 completionHandler:v73];
          objc_destroyWeak(&v75);

          objc_destroyWeak(location);
        }

        double v34 = __p;
        if (__p)
        {
          long double v35 = v77;
          long double v36 = __p;
          if (v77 != __p)
          {
            do
            {
              uint64_t v37 = v35 - 1864;
              double v38 = (void *)*((void *)v35 - 222);
              uint64_t v39 = (void *)*((void *)v35 - 221);
              if (v38 != v39)
              {
                do
                {
                  uint64_t v40 = (void *)v38[31];
                  if (v40 != (void *)v38[33]) {
                    free(v40);
                  }
                  v38 += 36;
                }
                while (v38 != v39);
                double v38 = (void *)*((void *)v35 - 222);
              }
              if (v38 != *((void **)v35 - 220)) {
                free(v38);
              }
              v35 -= 1864;
            }
            while (v37 != v34);
            long double v36 = __p;
          }
          long long v77 = v34;
          operator delete(v36);
        }
      }
      else
      {
LABEL_33:
        v6[2](v6, 0);
      }
      if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
      uint64_t v11 = v83;
      if (!v83) {
        goto LABEL_40;
      }
      goto LABEL_38;
    }
    uint64_t v25 = 0;
  }
  v6[2](v6, v25);
  if (v11)
  {
LABEL_38:
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
LABEL_40:
  double v26 = v85;
  if (v85 && !atomic_fetch_add(&v85->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
LABEL_5:
}

void __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained pathAnimationComplete:0];
  }
}

void __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_3(uint64_t a1, float a2)
{
  id WeakRetained = (long double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 40);
    long double v6 = fmod(3.14159265 - v5 + *(double *)(a1 + 48), 6.28318531);
    long double v7 = fmod(v6 + 6.28318531, 6.28318531);
    long double v8 = fmod(v5 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    WeakRetained[554] = fmod(v8 + 6.28318531, 6.28318531) + -3.14159265;
    double v9 = *(double *)(a1 + 56);
    long double v10 = fmod(3.14159265 - v9 + *(double *)(a1 + 64), 6.28318531);
    long double v11 = fmod(v10 + 6.28318531, 6.28318531);
    long double v12 = fmod(v9 + 3.14159265 + (v11 + -3.14159265) * a2, 6.28318531);
    double v14 = fmod(v12 + 6.28318531, 6.28318531) + -3.14159265;
    [WeakRetained _setHeading:&v14];
    uint64_t v13 = [WeakRetained cameraDelegate];
    [v13 mapLayerDidChangeVisibleRegion];
  }
}

void __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_28(uint64_t a1)
{
  uint64_t v2 = **(void ***)(*(void *)(a1 + 32) + 152);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_2_29;
  v4[3] = &unk_1E5A913C0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = v2;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
}

void __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_2_29(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained endRegionChange];
  }
}

- (uint64_t)selectLabelMarker:completion:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF56C870;
  a2[1] = v2;
  return result;
}

- (void)selectLabelMarker:completion:
{
}

- (Matrix<float,)screenPointWithOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  [(VKCameraController *)self edgeInsets];
  double v7 = v6;
  [(VKCameraController *)self edgeInsets];
  *(float *)&CGFloat x = x + (v8 - v7) * 0.5;
  [(VKCameraController *)self edgeInsets];
  double v10 = v9;
  [(VKCameraController *)self edgeInsets];
  float v12 = y + (v11 - v10) * 0.5;
  float v13 = *(float *)&x;
  result._e[1] = v12;
  result._e[0] = v13;
  return result;
}

- (void)updateCurrentPointView:(BOOL)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)((char *)self + 168);
  if (!*((unsigned char *)self + 168))
  {
    if (GEOGetVectorKitVKMuninLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_13);
    }
    double v29 = (id)GEOGetVectorKitVKMuninLog_log;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1780000, v29, OS_LOG_TYPE_ERROR, "No current point segment.", buf, 2u);
    }

    return;
  }
  BOOL v4 = a3;
  char v119 = *(unsigned char *)(*((void *)self + 17) + 832);
  uint64_t v6 = *(void *)([(VKCameraController *)self mapDataAccess] + 16);
  uint64_t v85 = *((void *)self + 560);
  long long v7 = *(_OWORD *)((char *)self + 4504);
  long long v86 = *(_OWORD *)((char *)self + 4488);
  long long v87 = v7;
  long long v88 = *(_OWORD *)((char *)self + 4520);
  uint64_t v90 = 0;
  uint64_t v89 = 0;
  uint64_t v93 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  int64x2_t v94 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  int64x2_t v95 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  int64x2_t v96 = v94;
  int64x2_t v97 = v95;
  int64x2_t v98 = v94;
  int64x2_t v99 = v95;
  int64x2_t v100 = v94;
  int64x2_t v101 = v95;
  int64x2_t v102 = v94;
  int64x2_t v103 = v95;
  int64x2_t v104 = v94;
  int64x2_t v105 = v95;
  char v106 = 1;
  char v107 = 0;
  char v108 = 0;
  long long v8 = *(_OWORD *)(v6 + 384);
  long long v109 = *(_OWORD *)(v6 + 368);
  long long v110 = v8;
  long long v9 = *(_OWORD *)(v6 + 416);
  long long v111 = *(_OWORD *)(v6 + 400);
  long long v112 = v9;
  long long v113 = *(_OWORD *)(v6 + 432);
  int v114 = *(_DWORD *)(v6 + 448);
  uint64_t v10 = *(void *)(v6 + 456);
  long long v116 = *(_OWORD *)(v6 + 464);
  *(void *)&long long v9 = *(void *)(v6 + 480);
  uint64_t v11 = *(void *)(v6 + 488);
  uint64_t v115 = v10;
  uint64_t v117 = v9;
  uint64_t v118 = v11;
  gdc::CameraView::ecefCameraView((gdc::CameraView *)buf, (const Camera *)v84);
  float v12 = (md::MuninSceneLogic *)*((void *)self + 17);
  float v13 = [(VKCameraController *)self canvas];
  [v13 sizeInPixels];
  *((unsigned char *)self + 4576) = md::MuninSceneLogic::getLodForCavasSize(v12, v123);

  id v74 = self;
  BOOL v14 = *((double *)self + 556) < 0.698131701;
  uint64_t v15 = (unsigned __int8 *)v3[240];
  unsigned int v16 = (unsigned __int8 *)v3[241];
  id v75 = v3;
  BOOL v72 = v4;
  BOOL v71 = v14;
  if (v15 == v16)
  {
    int v21 = 0;
  }
  else
  {
    int v17 = *((unsigned __int8 *)self + 4576);
    int v18 = (v17 - v14) & ~((v17 - v14) >> 31);
    uint64_t v20 = v3[12];
    uint64_t v19 = v3[13];
    if (v20 == v19)
    {
      int v21 = 0;
      do
      {
        if (v15[1] != v18)
        {
          v15[1] = v18;
          int v21 = 1;
        }
        v15 += 8;
      }
      while (v15 != v16);
    }
    else
    {
      int v21 = 0;
      do
      {
        uint64_t v22 = v20;
        while (*(unsigned __int8 *)(v22 + 240) != *v15)
        {
          v22 += 288;
          if (v22 == v19)
          {
            BOOL v23 = 0;
            BOOL isPhotoVisible = 1;
            goto LABEL_17;
          }
        }
        float v25 = *(float *)(v22 + 56);
        float v26 = *(float *)(v22 + 72);
        BOOL v23 = fabsf(v26 + v25) >= 3960.0
           && (__PAIR64__(v25 > 0.0, LODWORD(v25)) - COERCE_UNSIGNED_INT(0.0)) >> 32 != (__PAIR64__(v26 < 0.0, 0.0)
                                                                                       - LODWORD(v26)) >> 32;
        BOOL isPhotoVisible = md::mun::isPhotoVisible(v83, v22);
LABEL_17:
        if (v23 || !isPhotoVisible) {
          unsigned __int8 v28 = v17;
        }
        else {
          unsigned __int8 v28 = v18;
        }
        if (v15[1] != v28)
        {
          v15[1] = v28;
          int v21 = 1;
        }
        v15 += 8;
      }
      while (v15 != v16);
    }
  }
  __double2 v30 = v75;
  uint64_t v31 = v75[250];
  uint64_t v32 = v75[1];
  if (v31 == v32)
  {
    if (((v21 | v72) & 1) == 0) {
      return;
    }
  }
  else
  {
    int v69 = v21 | v72;
    uint64_t v70 = v75[1];
    uint64_t v73 = v75[250];
    __double2 v33 = (unsigned __int8 *)v75[489];
    double v34 = (unsigned __int8 *)v75[490];
    if (v33 == v34)
    {
      int v39 = 0;
    }
    else
    {
      int v35 = *((unsigned __int8 *)v74 + 4576);
      int v36 = (v35 - v71) & ~((v35 - v71) >> 31);
      uint64_t v37 = v75[261];
      uint64_t v38 = v75[262];
      if (v37 == v38)
      {
        int v39 = 0;
        do
        {
          if (v33[1] != v36)
          {
            v33[1] = v36;
            int v39 = 1;
          }
          v33 += 8;
        }
        while (v33 != v34);
      }
      else
      {
        int v39 = 0;
        do
        {
          uint64_t v40 = v37;
          while (*(unsigned __int8 *)(v40 + 240) != *v33)
          {
            v40 += 288;
            if (v40 == v38)
            {
              BOOL v41 = 0;
              BOOL v42 = 1;
              goto LABEL_46;
            }
          }
          float v43 = *(float *)(v40 + 56);
          float v44 = *(float *)(v40 + 72);
          BOOL v41 = fabsf(v44 + v43) >= 3960.0
             && (__PAIR64__(v43 > 0.0, LODWORD(v43)) - COERCE_UNSIGNED_INT(0.0)) >> 32 != (__PAIR64__(v44 < 0.0, 0.0)
                                                                                         - LODWORD(v44)) >> 32;
          BOOL v42 = md::mun::isPhotoVisible(v83, v40);
LABEL_46:
          if (v41 || !v42) {
            unsigned __int8 v46 = v35;
          }
          else {
            unsigned __int8 v46 = (v35 - v71) & ~((v35 - v71) >> 31);
          }
          if (v33[1] != v46)
          {
            v33[1] = v46;
            int v39 = 1;
          }
          v33 += 8;
        }
        while (v33 != v34);
      }
    }
    __double2 v30 = v75;
    uint64_t v31 = v73;
    uint64_t v32 = v70;
    if (((v69 | v39) & 1) == 0) {
      return;
    }
  }
  uint64_t v80 = 0;
  uint64_t v81 = &v119;
  v79[0] = 0;
  v79[1] = 0;
  -[VKMuninCameraController updateCurrentPointView:]::$_1::operator()(&v81, v30 + 1, v83, v79);
  uint64_t v47 = *((void *)v74 + 17);
  uint64_t v48 = (geo::read_write_lock *)pthread_rwlock_wrlock((pthread_rwlock_t *)(v47 + 208));
  if (v48) {
    geo::read_write_lock::logFailure(v48, (uint64_t)"write lock", v49);
  }
  uint64_t v50 = *(void **)(v47 + 184);
  if (v50)
  {
    *(void *)(v47 + 192) = v50;
    operator delete(v50);
    *(void *)(v47 + 184) = 0;
    *(void *)(v47 + 192) = 0;
    *(void *)(v47 + 200) = 0;
  }
  *(_OWORD *)(v47 + 184) = *(_OWORD *)v79;
  *(void *)(v47 + 200) = v80;
  v79[1] = 0;
  uint64_t v80 = 0;
  v79[0] = 0;
  uint64_t v51 = (geo::read_write_lock *)pthread_rwlock_unlock((pthread_rwlock_t *)(v47 + 208));
  if (v51) {
    geo::read_write_lock::logFailure(v51, (uint64_t)"unlock", v52);
  }
  *(unsigned char *)(v47 + 472) = 1;
  if (v31 != v32)
  {
    __p = 0;
    long long v77 = 0;
    long long v78 = 0;
    v79[1] = 0;
    -[VKMuninCameraController updateCurrentPointView:]::$_1::operator()(&v81, v30 + 250, v83, v79);
    double v54 = v79[0];
    double v53 = v79[1];
    int64_t v55 = (char *)v79[1] - (char *)v79[0];
    if (v79[1] != v79[0])
    {
      if (v55 < 0) {
        abort();
      }
      uint64_t v56 = v55 >> 4;
      char v57 = (char *)operator new(24 * (v55 >> 4));
      __p = v57;
      long long v77 = v57;
      long long v78 = &v57[24 * v56];
      do
      {
        if (v57 < v78)
        {
          *(_OWORD *)char v57 = *v54;
          *((_DWORD *)v57 + 4) = 2147483646;
          v57 += 24;
        }
        else
        {
          double v58 = (char *)__p;
          unint64_t v59 = 0xAAAAAAAAAAAAAAABLL * ((v57 - (unsigned char *)__p) >> 3);
          unint64_t v60 = v59 + 1;
          if (v59 + 1 > 0xAAAAAAAAAAAAAAALL) {
            abort();
          }
          if (0x5555555555555556 * ((v78 - (unsigned char *)__p) >> 3) > v60) {
            unint64_t v60 = 0x5555555555555556 * ((v78 - (unsigned char *)__p) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v78 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
            unint64_t v61 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v61 = v60;
          }
          if (v61 > 0xAAAAAAAAAAAAAAALL) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          double v62 = (char *)operator new(24 * v61);
          double v63 = &v62[8 * ((v57 - (unsigned char *)__p) >> 3)];
          *(_OWORD *)double v63 = *v54;
          *((_DWORD *)v63 + 4) = 2147483646;
          if (v57 == v58)
          {
            long long v65 = &v62[24 * v59];
          }
          else
          {
            double v64 = &v62[24 * v59];
            do
            {
              long long v65 = v64 - 24;
              long long v66 = *(_OWORD *)(v57 - 24);
              *((void *)v64 - 1) = *((void *)v57 - 1);
              *(_OWORD *)(v64 - 24) = v66;
              v57 -= 24;
              v64 -= 24;
            }
            while (v57 != v58);
          }
          char v57 = v63 + 24;
          __p = v65;
          long long v78 = &v62[24 * v61];
          if (v58) {
            operator delete(v58);
          }
        }
        long long v77 = v57;
        ++v54;
      }
      while (v54 != v53);
    }
    uint64_t v67 = *((void *)v74 + 17);
    long long v121 = 0;
    md::MuninSceneLogic::addPreloadViews(v67, (const void **)&__p, v120);
    if (v121 == v120)
    {
      (*(void (**)(void *))(v120[0] + 32))(v120);
      long long v68 = __p;
      if (!__p)
      {
LABEL_89:
        if (v79[0]) {
          operator delete(v79[0]);
        }
        return;
      }
    }
    else
    {
      if (v121) {
        (*(void (**)(void))(*v121 + 40))();
      }
      long long v68 = __p;
      if (!__p) {
        goto LABEL_89;
      }
    }
    operator delete(v68);
    goto LABEL_89;
  }
}

- (void)updateCurrentPointView:
{
  uint64_t v4 = a2[240];
  uint64_t v5 = a2[239];
  if (v4 != v5 && a2[11] != a2[12])
  {
    long long v7 = a4;
    unint64_t v8 = 0;
    do
    {
      uint64_t v10 = a2[11];
      uint64_t v11 = a2[12];
      if (v10 != v11)
      {
        int v12 = *(unsigned __int8 *)(v5 + 8 * v8);
        while (*(unsigned __int8 *)(v10 + 240) != v12)
        {
          v10 += 288;
          if (v10 == v11) {
            goto LABEL_6;
          }
        }
        if (**a1 || md::mun::isPhotoVisible(a3, v10))
        {
          uint64_t v13 = *a2;
          char v14 = *(unsigned char *)(v5 + 8 * v8 + 1);
          char v15 = *((unsigned char *)a2 + 1859);
          int v17 = (char *)v7[1];
          unint64_t v16 = (unint64_t)v7[2];
          if ((unint64_t)v17 < v16)
          {
            *(void *)int v17 = v13;
            v17[8] = v12;
            v17[9] = v14;
            long long v9 = v17 + 16;
            v17[10] = v15;
          }
          else
          {
            int v18 = (char *)*v7;
            uint64_t v19 = (v17 - (unsigned char *)*v7) >> 4;
            unint64_t v20 = v19 + 1;
            if ((unint64_t)(v19 + 1) >> 60) {
              abort();
            }
            uint64_t v21 = v16 - (void)v18;
            if (v21 >> 3 > v20) {
              unint64_t v20 = v21 >> 3;
            }
            if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v22 = v20;
            }
            if (v22)
            {
              if (v22 >> 60) {
                std::__throw_bad_array_new_length[abi:nn180100]();
              }
              BOOL v23 = (char *)operator new(16 * v22);
            }
            else
            {
              BOOL v23 = 0;
            }
            double v24 = &v23[16 * v19];
            *(void *)double v24 = v13;
            v24[8] = v12;
            v24[9] = v14;
            v24[10] = v15;
            float v25 = v24;
            if (v17 == v18)
            {
              unsigned __int8 v28 = a4;
            }
            else
            {
              do
              {
                uint64_t v26 = *((void *)v17 - 2);
                v17 -= 16;
                int v27 = *(_DWORD *)(v17 + 7);
                *((void *)v25 - 2) = v26;
                v25 -= 16;
                *(_DWORD *)(v25 + 7) = v27;
              }
              while (v17 != v18);
              unsigned __int8 v28 = a4;
              int v17 = (char *)*a4;
            }
            long long v9 = v24 + 16;
            *unsigned __int8 v28 = v25;
            v28[1] = v24 + 16;
            v28[2] = &v23[16 * v22];
            long long v7 = v28;
            if (v17) {
              operator delete(v17);
            }
          }
          v7[1] = v9;
          uint64_t v4 = a2[240];
          uint64_t v5 = a2[239];
        }
      }
LABEL_6:
      ++v8;
    }
    while (v8 < (v4 - v5) >> 3);
  }
}

- (const)currentPoint
{
  if (*((unsigned char *)self + 168)) {
    return (char *)self + 176;
  }
  else {
    return 0;
  }
}

- (void)setCurrentPoint:(const void *)a3 secondaryPoint:(optional<md::mun::CollectionPoint>)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self);
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v9 = v4;
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  md::mun::MuninMetadataContainer::addActiveMetadataPoint(*(std::mutex **)(*(void *)(v4 + 136) + 168), v7);
  if (*(unsigned char *)v6) {
    md::mun::MuninMetadataContainer::addActiveMetadataPoint(*(std::mutex **)(*(void *)(v9 + 136) + 168), (const md::mun::CollectionPoint *)(v6 + 8));
  }
  uint64_t v10 = v121;
  uint64_t v117 = v121;
  uint64_t v118 = v121;
  char v119 = v121;
  uint64_t v120 = 6;
  uint64_t v11 = *((void *)v8 + 11);
  uint64_t v12 = *((void *)v8 + 12);
  uint64_t v74 = v9;
  if (v11 != v12)
  {
    unint64_t v13 = 6;
    char v14 = v121;
    while (1)
    {
      uint64_t v15 = (v14 - v10) >> 3;
      if (v13 < v15 + 1) {
        break;
      }
LABEL_6:
      char *v14 = *(unsigned char *)(v11 + 240);
      *(_WORD *)(v14 + 1) = 1;
      *((_DWORD *)v14 + 1) = 0;
      v14 += 8;
      uint64_t v118 = v14;
      v11 += 288;
      if (v11 == v12)
      {
        uint64_t v31 = (long long *)*((void *)v8 + 11);
        uint64_t v11 = *((void *)v8 + 12);
        uint64_t v9 = v74;
        goto LABEL_26;
      }
    }
    unint64_t v16 = v119;
    unint64_t v17 = (1 << -(char)__clz(v13 + 1));
    if (v13 >= 0xFFFFFFFFFFFFFFFELL) {
      unint64_t v17 = 1;
    }
    if (v17 <= v15 + 1) {
      unint64_t v13 = v15 + 1;
    }
    else {
      unint64_t v13 = v17;
    }
    int v18 = malloc_type_malloc(8 * v13, 0x100004087EB8081uLL);
    uint64_t v19 = (char *)v18;
    unint64_t v20 = (uint64_t *)v117;
    uint64_t v21 = v118;
    if (v117 != v118)
    {
      unint64_t v22 = v118 - (unsigned char *)v117 - 8;
      if (v22 < 0x18)
      {
        BOOL v23 = v18;
      }
      else
      {
        BOOL v23 = v18;
        if ((unint64_t)((char *)v18 - (unsigned char *)v117) >= 0x20)
        {
          uint64_t v24 = (v22 >> 3) + 1;
          uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
          BOOL v23 = (void *)((char *)v18 + v25);
          uint64_t v26 = (long long *)((char *)v117 + 16);
          int v27 = v18 + 1;
          uint64_t v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v29 = *v26;
            *(v27 - 1) = *(v26 - 1);
            *int v27 = v29;
            v26 += 2;
            v27 += 2;
            v28 -= 4;
          }
          while (v28);
          if (v24 == (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_22;
          }
          unint64_t v20 = (uint64_t *)((char *)v20 + v25);
        }
      }
      do
      {
        uint64_t v30 = *v20++;
        *v23++ = v30;
      }
      while (v20 != (uint64_t *)v21);
    }
LABEL_22:
    if (v10 != v16) {
      free(v117);
    }
    char v14 = &v19[8 * v15];
    uint64_t v117 = v19;
    uint64_t v120 = v13;
    uint64_t v10 = v19;
    goto LABEL_6;
  }
  uint64_t v31 = (long long *)*((void *)v8 + 11);
LABEL_26:
  uint64_t v32 = *(void *)v8;
  long long v104 = *(_OWORD *)((char *)v8 + 8);
  uint64_t v33 = *((void *)v8 + 3);
  uint64_t v34 = *((void *)v8 + 4);
  uint64_t v103 = v32;
  uint64_t v105 = v33;
  uint64_t v106 = v34;
  int v107 = *((_DWORD *)v8 + 10);
  uint64_t v108 = *(void *)((char *)v8 + 44);
  long long v109 = *(_OWORD *)((char *)v8 + 56);
  long long v110 = *(_OWORD *)((char *)v8 + 72);
  long long v111 = v115;
  long long v112 = v115;
  long long v113 = v115;
  uint64_t v114 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v111, v31, (long long *)v11);
  *(void *)((char *)v116 + 5) = *(void *)((char *)v8 + 1853);
  v116[0] = *((void *)v8 + 231);
  md::mun::PointView::PointView((uint64_t)v93, (uint64_t)&v103, (uint64_t **)&v117);
  if (*(unsigned char *)v6)
  {
    int v35 = v92;
    long long v88 = v92;
    uint64_t v89 = v92;
    uint64_t v90 = v92;
    uint64_t v91 = 6;
    uint64_t v36 = *(void *)(v6 + 96);
    uint64_t v37 = *(void *)(v6 + 104);
    if (v36 != v37)
    {
      unint64_t v38 = 6;
      int v39 = v92;
      while (1)
      {
        uint64_t v40 = (v39 - v35) >> 3;
        if (v38 < v40 + 1) {
          break;
        }
LABEL_30:
        char *v39 = *(unsigned char *)(v36 + 240);
        *(_WORD *)(v39 + 1) = 1;
        *((_DWORD *)v39 + 1) = 0;
        v39 += 8;
        uint64_t v89 = v39;
        v36 += 288;
        if (v36 == v37)
        {
          uint64_t v56 = *(long long **)(v6 + 96);
          uint64_t v36 = *(void *)(v6 + 104);
          uint64_t v9 = v74;
          goto LABEL_52;
        }
      }
      BOOL v41 = v90;
      unint64_t v42 = (1 << -(char)__clz(v38 + 1));
      if (v38 >= 0xFFFFFFFFFFFFFFFELL) {
        unint64_t v42 = 1;
      }
      if (v42 <= v40 + 1) {
        unint64_t v38 = v40 + 1;
      }
      else {
        unint64_t v38 = v42;
      }
      float v43 = malloc_type_malloc(8 * v38, 0x100004087EB8081uLL);
      float v44 = (char *)v43;
      long long v45 = (uint64_t *)v88;
      unsigned __int8 v46 = v89;
      if (v88 != v89)
      {
        unint64_t v47 = v89 - (unsigned char *)v88 - 8;
        if (v47 < 0x18)
        {
          uint64_t v48 = v43;
        }
        else
        {
          uint64_t v48 = v43;
          if ((unint64_t)((char *)v43 - (unsigned char *)v88) >= 0x20)
          {
            uint64_t v49 = (v47 >> 3) + 1;
            uint64_t v50 = 8 * (v49 & 0x3FFFFFFFFFFFFFFCLL);
            uint64_t v48 = (void *)((char *)v43 + v50);
            uint64_t v51 = (long long *)((char *)v88 + 16);
            uint64_t v52 = v43 + 1;
            uint64_t v53 = v49 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v54 = *v51;
              *(v52 - 1) = *(v51 - 1);
              *uint64_t v52 = v54;
              v51 += 2;
              v52 += 2;
              v53 -= 4;
            }
            while (v53);
            if (v49 == (v49 & 0x3FFFFFFFFFFFFFFCLL)) {
              goto LABEL_46;
            }
            long long v45 = (uint64_t *)((char *)v45 + v50);
          }
        }
        do
        {
          uint64_t v55 = *v45++;
          *v48++ = v55;
        }
        while (v45 != (uint64_t *)v46);
      }
LABEL_46:
      if (v35 != v41) {
        free(v88);
      }
      int v39 = &v44[8 * v40];
      long long v88 = v44;
      uint64_t v91 = v38;
      int v35 = v44;
      goto LABEL_30;
    }
    uint64_t v56 = *(long long **)(v6 + 96);
LABEL_52:
    long long v76 = *(_OWORD *)(v6 + 16);
    *(void *)((char *)&v79 + 4) = *(void *)(v6 + 52);
    long long v57 = *(_OWORD *)(v6 + 80);
    long long v80 = *(_OWORD *)(v6 + 64);
    uint64_t v75 = *(void *)(v6 + 8);
    uint64_t v58 = *(void *)(v6 + 40);
    uint64_t v77 = *(void *)(v6 + 32);
    uint64_t v78 = v58;
    LODWORD(v79) = *(_DWORD *)(v6 + 48);
    long long v81 = v57;
    uint64_t v82 = v86;
    uint64_t v83 = v86;
    uint64_t v84 = v86;
    uint64_t v85 = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v82, v56, (long long *)v36);
    *(void *)((char *)v87 + 5) = *(void *)(v6 + 1861);
    v87[0] = *(void *)(v6 + 1856);
    md::mun::PointView::PointView((uint64_t)v122, (uint64_t)&v75, (uint64_t **)&v117);
    if (*(unsigned char *)(v9 + 168)) {
    else
    }
      *(unsigned char *)(v9 + 168) = 1;
    if (v136 != v137) {
      free(v136);
    }
    if (__p)
    {
      uint64_t v135 = __p;
      operator delete(__p);
    }
    if (v132)
    {
      long long v133 = v132;
      operator delete(v132);
    }
    unint64_t v59 = v123;
    unint64_t v60 = v124;
    if (v123 != v124)
    {
      do
      {
        unint64_t v61 = (void *)v59[31];
        if (v61 != (void *)v59[33]) {
          free(v61);
        }
        v59 += 36;
      }
      while (v59 != v60);
      unint64_t v59 = v123;
    }
    if (v59 != v125) {
      free(v59);
    }
    double v63 = v82;
    double v62 = v83;
    if (v82 != v83)
    {
      do
      {
        double v64 = (void *)v63[31];
        if (v64 != (void *)v63[33]) {
          free(v64);
        }
        v63 += 36;
      }
      while (v63 != v62);
      double v63 = v82;
    }
    if (v63 != (void *)v84) {
      free(v63);
    }
    if (v88 != v90) {
      free(v88);
    }
  }
  else
  {
    if (*(unsigned char *)(v9 + 168)) {
    else
    }
      *(unsigned char *)(v9 + 168) = 1;
  }
  objc_msgSend((id)v9, "updateCurrentPointView:", 1, 136, v74, v75, v76, v77, v78, v79, v80, v81);
  uint64_t v65 = *(void *)(v9 + 136);
  v122[8] = 0;
  char v126 = 0;
  char v129 = 0;
  v122[0] = 6;
  md::MuninSceneLogic::addSceneEvent(v65, (uint64_t)v122);
  if (v129)
  {
    if (v130)
    {
      CGSize v131 = v130;
      operator delete(v130);
    }
    char v129 = 0;
  }
  if (v126)
  {
    long long v66 = v127;
    if (v127)
    {
      uint64_t v67 = v128;
      if (v128 != v127)
      {
        do
        {
          v67 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v67);
        }
        while (v67 != v66);
        long long v66 = v127;
      }
      operator delete(v66);
    }
  }
  if (v101 != v102) {
    free(v101);
  }
  if (v99)
  {
    int64x2_t v100 = v99;
    operator delete(v99);
  }
  if (v97)
  {
    int64x2_t v98 = v97;
    operator delete(v97);
  }
  long long v68 = v94;
  int v69 = v95;
  if (v94 != v95)
  {
    do
    {
      uint64_t v70 = (void *)v68[31];
      if (v70 != (void *)v68[33]) {
        free(v70);
      }
      v68 += 36;
    }
    while (v68 != v69);
    long long v68 = v94;
  }
  if (v68 != v96) {
    free(v68);
  }
  BOOL v71 = v111;
  BOOL v72 = v112;
  if (v111 != v112)
  {
    do
    {
      uint64_t v73 = (void *)v71[31];
      if (v73 != (void *)v71[33]) {
        free(v73);
      }
      v71 += 36;
    }
    while (v71 != v72);
    BOOL v71 = v111;
  }
  if (v71 != (void *)v113) {
    free(v71);
  }
  if (v117 != v119) {
    free(v117);
  }
}

- (void)setCurrentPoint:(const void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  [(VKMuninCameraController *)self setCurrentPoint:a3 secondaryPoint:v6];
  if (v6[0])
  {
    uint64_t v3 = v7;
    uint64_t v4 = v8;
    if (v7 != v8)
    {
      do
      {
        uint64_t v5 = (void *)v3[31];
        if (v5 != (void *)v3[33]) {
          free(v5);
        }
        v3 += 36;
      }
      while (v3 != v4);
      uint64_t v3 = v7;
    }
    if (v3 != v9) {
      free(v3);
    }
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unint64_t v17 = (void (**)(id, uint64_t))a10;
  [(VKMuninCameraController *)self cancelPendingMoveExceptBump];
  if (a7 <= 0.0)
  {
    [(VKCameraController *)self beginRegionChange:0];
    float v44 = [(VKCameraController *)self cameraDelegate];
    objc_msgSend(v44, "mapLayerWillAnimateToLocation:", var0, var1);

    *((double *)self + 557) = var0 * 0.0174532925;
    *((double *)self + 558) = var1 * 0.0174532925;
    *((double *)self + 559) = a4;
    *((double *)self + 554) = a6 * 0.0174532925;
    double v51 = a5 * -0.0174532925;
    [(VKMuninCameraController *)self _setHeading:&v51];
    [(VKCameraController *)self endRegionChange];
    uint64_t v45 = *(void *)[(VKCameraController *)self runLoopController];
    if (v45)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v45, &location);
    }
    if (v17) {
      v17[2](v17, 1);
    }
  }
  else
  {
    double v48 = a4;
    double v18 = *((double *)self + 558);
    double v46 = *((double *)self + 559);
    __double2 v19 = __sincos_stret(*((double *)self + 557));
    __double2 v20 = __sincos_stret(v18);
    double v21 = *((double *)self + 553);
    double v22 = *((double *)self + 554);
    __double2 v23 = __sincos_stret(var0 * 0.0174532925);
    __double2 v24 = __sincos_stret(var1 * 0.0174532925);
    double v25 = a6 * 0.0174532925;
    double v47 = a5 * -0.0174532925;
    double v50 = v21;
    long double v26 = fmod(3.14159265 - a5 * -0.0174532925 + v21, 6.28318531);
    double v27 = fmod(v26 + 6.28318531, 6.28318531);
    double v49 = v22;
    long double v28 = fmod(3.14159265 - v25 + v22, 6.28318531);
    double v29 = fmod(v28 + 6.28318531, 6.28318531);
    -[VKMuninCameraController stopPanningAtPoint:](self, "stopPanningAtPoint:", 0.5, 0.5);
    uint64_t v30 = [[VKTimedAnimation alloc] initWithDuration:fmax(fabs(v27 * 0.159154943 + -0.5), fabs(v29 * 0.318309886 + -1.0)) * 1.9 + 0.1];
    double v31 = 6378137.0 / sqrt(-(v19.__sinval * v19.__sinval * 0.00669437999 + -1.0));
    double v32 = (v31 + v46) * v19.__cosval;
    double v33 = v32 * v20.__cosval;
    double v34 = v32 * v20.__sinval;
    double v35 = (v46 + v31 * 0.99330562) * v19.__sinval;
    double v36 = 6378137.0 / sqrt(-(v23.__sinval * v23.__sinval * 0.00669437999 + -1.0));
    double v37 = (v36 + v48) * v23.__cosval;
    double v38 = v37 * v24.__cosval;
    double v39 = v37 * v24.__sinval;
    double v40 = (v48 + v36 * 0.99330562) * v23.__sinval;
    BOOL v41 = (void *)*((void *)self + 535);
    *((void *)self + 535) = v30;

    objc_initWeak(&location, self);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3321888768;
    v55[2] = __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke;
    v55[3] = &unk_1EF58DC68;
    objc_copyWeak(v56, &location);
    v56[1] = *(id *)&v49;
    v56[2] = *(id *)&v25;
    v56[3] = *(id *)&v50;
    v56[4] = *(id *)&v47;
    v56[5] = *(id *)&v33;
    v56[6] = *(id *)&v34;
    v56[7] = *(id *)&v35;
    v56[8] = *(id *)&v38;
    v56[9] = *(id *)&v39;
    v56[10] = *(id *)&v40;
    [*((id *)self + 535) setStepHandler:v55];
    unint64_t v42 = (void *)MEMORY[0x1A6239EB0](v17);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke_24;
    v52[3] = &unk_1E5A913E8;
    v52[4] = self;
    id v43 = v42;
    id v53 = v43;
    objc_copyWeak(&v54, &location);
    [*((id *)self + 535) setCompletionHandler:v52];
    [(VKCameraController *)self beginRegionChange:1];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], *((VKAnimation **)self + 535));
    objc_destroyWeak(&v54);

    objc_destroyWeak(v56);
    objc_destroyWeak(&location);
  }
}

void __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (long double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 40);
    double v6 = a2;
    long double v7 = fmod(3.14159265 - v5 + *(double *)(a1 + 48), 6.28318531);
    long double v8 = fmod(v7 + 6.28318531, 6.28318531);
    long double v9 = fmod(v5 + 3.14159265 + (v8 + -3.14159265) * a2, 6.28318531);
    WeakRetained[554] = fmod(v9 + 6.28318531, 6.28318531) + -3.14159265;
    double v10 = *(double *)(a1 + 56);
    long double v11 = fmod(3.14159265 - v10 + *(double *)(a1 + 64), 6.28318531);
    long double v12 = fmod(v11 + 6.28318531, 6.28318531);
    long double v13 = fmod(v10 + 3.14159265 + (v12 + -3.14159265) * a2, 6.28318531);
    double v24 = fmod(v13 + 6.28318531, 6.28318531) + -3.14159265;
    [WeakRetained _setHeading:&v24];
    long double v14 = *(double *)(a1 + 72) + (*(double *)(a1 + 96) - *(double *)(a1 + 72)) * a2;
    long double v15 = *(double *)(a1 + 80) + (*(double *)(a1 + 104) - *(double *)(a1 + 80)) * v6;
    long double v16 = *(double *)(a1 + 88) + (*(double *)(a1 + 112) - *(double *)(a1 + 88)) * v6;
    double v17 = sqrt(v14 * v14 + v15 * v15);
    double v18 = atan2(v16, v17 * 0.996647189);
    long double v19 = atan2(v15, v14);
    __double2 v20 = __sincos_stret(v18);
    double v21 = atan2(v16 + v20.__sinval * v20.__sinval * 42841.3115 * v20.__sinval, v17 + v20.__cosval * v20.__cosval * -42697.6727 * v20.__cosval);
    __double2 v22 = __sincos_stret(v21);
    WeakRetained[557] = v21;
    WeakRetained[558] = v19;
    WeakRetained[559] = v17 / v22.__cosval + -6378137.0 / sqrt(v22.__sinval * v22.__sinval * -0.00669437999 + 1.0);
    __double2 v23 = [WeakRetained cameraDelegate];
    [v23 mapLayerDidChangeVisibleRegion];
  }
}

void __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v2 = **(void ***)(*(void *)(a1 + 32) + 152);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke_2;
  v4[3] = &unk_1E5A913C0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = v2;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
}

void __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained endRegionChange];
  }
}

- (void)setCameraFrame:()CameraFrame<geo:(double> *)a3 :Radians
{
  double value = a3->_target.altitude._value;
  *(_OWORD *)((char *)self + 4456) = *(_OWORD *)&a3->_target.latitude._value;
  *((double *)self + 559) = value;
  *((void *)self + 554) = *(void *)&a3->_pitch._value;
  double v6 = a3->_heading._value;
  [(VKMuninCameraController *)self _setHeading:&v6];
  uint64_t v5 = *(void *)[(VKCameraController *)self runLoopController];
  if (v5)
  {
    char v7 = 4;
    md::MapEngine::setNeedsTick(v5, &v7);
  }
}

- (void)setVkCamera:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKMuninCameraController;
  [(VKCameraController *)&v10 setVkCamera:v4];
  if (v4)
  {
    [v4 cameraFrame:0];
  }
  else
  {
    uint64_t v9 = 0;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v6 = 0u;
  }
  *(_OWORD *)((char *)self + 4456) = v6;
  *((void *)self + 559) = v7;
  if (*((unsigned char *)self + 168))
  {
    *((unsigned char *)self + 168) = 0;
  }
  uint64_t v5 = *(void *)[(VKCameraController *)self runLoopController];
  if (v5)
  {
    char v11 = 4;
    md::MapEngine::setNeedsTick(v5, &v11);
  }
}

- (double)altitude
{
  return *((double *)self + 559);
}

- (double)pitch
{
  return *((double *)self + 554) * 57.2957795;
}

- (void)_setHeading:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  uint64_t v4 = *v3;
  *((void *)self + 553) = *v3;
  *((void *)self + 550) = v4;
  uint64_t v5 = *((void *)self + 553);
  *((void *)self + 550) = v5;
  *((void *)self + 548) = v5;
  *((void *)self + 549) = 0;
}

- (double)heading
{
  return *((double *)self + 553) * -57.2957795;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v2 = *((double *)self + 557) * 57.2957795;
  double v3 = *((double *)self + 558) * 57.2957795;
  result.double var1 = v3;
  result.double var0 = v2;
  return result;
}

- (void)_updateDebugOverlay:(void *)a3
{
  if (*(void *)a3)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [*(id *)a3 debugConsoleForId:18];
      if (v4)
      {
        uint64_t v5 = (ggl::DebugConsole *)v4;
        long long v6 = +[VKDebugSettings sharedSettings];
        int v7 = [v6 muninShowLODInfo];

        if (v7) {
          ggl::DebugConsole::begin(v5);
        }
      }
    }
  }
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  uint64_t v4 = (char *)MEMORY[0x1F4188790](self);
  long long v6 = v5;
  double v254 = v7;
  long long v8 = v4;
  uint64_t v291 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)(*(void *)([v4 mapDataAccess] + 16) + 464) = xmmword_1A28FE850;
  int v253 = v6;
  uint64_t v9 = (float32x2_t *)md::LayoutContext::frameState(v6);
  *(float32x2_t *)&v10.f64[0] = v9[63];
  float32x2_t v11 = (float32x2_t)0x3F0000003F000000;
  if (v10.f64[0] > 0.0 && *(double *)&v9[62] > 0.0)
  {
    *(float32x2_t *)&v10.f64[1] = v9[62];
    float64x2_t v12 = vaddq_f64(v10, v10);
    float32x2_t v13 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v9[70]), v12));
    float64x2_t v14 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v9[71]), v12)));
    float64x2_t v15 = vcvtq_f64_f32(v13);
    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v20 = vsubq_f64(_Q2, v15);
    float64x2_t v21 = vaddq_f64(v15, _Q2);
    *(void *)&_Q2.f64[0] = *(_OWORD *)&vaddq_f64(v20, v14);
    _Q2.f64[1] = vsubq_f64(v21, v14).f64[1];
    float32x2_t v11 = vcvt_f32_f64(_Q2);
  }
  float v22 = v11.f32[0] + -0.5;
  *(float *)(*(void *)([v8 mapDataAccess] + 16) + 488) = v11.f32[1] + -0.5;
  *(float *)(*(void *)([v8 mapDataAccess] + 16) + 492) = v22;
  uint64_t v23 = *((void *)v8 + 18);
  if (v23) {
    *(_DWORD *)(v23 + 288) = 0;
  }
  if (v8[168])
  {
    int v24 = 1;
  }
  else
  {
    uint64_t v56 = *((void *)v8 + 17);
    uint64_t v57 = *(void *)(v56 + 152);
    if (*(unsigned char *)(v57 + 88))
    {
      if (*(unsigned char *)(v57 + 89))
      {
        double v58 = *((double *)v8 + 558);
        uint64_t v251 = (double *)(v8 + 4456);
        long double v59 = tan(*((double *)v8 + 557) * 0.5 + 0.785398163);
        double v60 = log(v59);
        uint64_t v61 = *(void *)(v56 + 168);
        v259[1] = v61 + 96;
        double v62 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v61 + 96));
        if (v62) {
          geo::read_write_lock::logFailure(v62, (uint64_t)"read lock", v63);
        }
        LOBYTE(v274) = 0;
        double v64 = *(void **)(v61 + 48);
        if (v64 != (void *)(v61 + 56))
        {
          v65.f64[0] = v58 * 0.159154943 + 0.5;
          double v257 = v65.f64[0];
          v65.f64[1] = v60 * 0.159154943 + 0.5;
          float64x2_t v252 = v65;
          double v255 = v65.f64[1];
          long double v66 = exp(v65.f64[1] * 6.28318531 + -3.14159265);
          long double v67 = atan(v66) * 114.591559 + -90.0;
          long double v68 = cos(v67 * 0.034906585) * -559.82 + 111132.92;
          long double v69 = v68 + cos(v67 * 0.0698131701) * 1.175;
          long double v70 = v69 + cos(v67 * 0.104719755) * -0.0023;
          long double v71 = v67 * 0.00872664626;
          long double v72 = tan(v67 * 0.00872664626 + 0.78103484);
          double v73 = log(v72);
          long double v74 = tan(v71 + 0.789761487);
          long double v75 = fabs((log(v74) - v73) * 0.159154943) * 20.0 / v70;
          double v76 = v75 * v75;
          double v77 = 1.79769313e308;
          do
          {
            uint64_t v78 = v64[4];
            unint64_t v79 = md::mun::MuninMetadata::_searchBounds(v78, v257, v255, 20.0);
            unint64_t v81 = HIDWORD(v79);
            unint64_t v82 = HIDWORD(v80);
            BOOL v83 = SHIDWORD(v79) <= SHIDWORD(v80) && (int)v79 <= (int)v80;
            if (v83)
            {
              long long v86 = 0;
              uint64_t v87 = v78 + 344;
              uint64_t v88 = (int)v79;
              int v89 = v80 + 1;
              double v90 = 1.79769313e308;
              do
              {
                uint64_t v91 = 10 * (int)v81;
                uint64_t v92 = v88;
                uint64_t v93 = v88;
                if (v81 == 9)
                {
                  do
                  {
                    unint64_t v94 = *(unsigned __int16 *)(v87 + 2 * (v91 + v93));
                    if (v93 == 9)
                    {
                      uint64_t v95 = *(void *)(v78 + 320);
                      unint64_t v96 = (*(void *)(v78 + 328) - v95) >> 3;
                      BOOL v83 = v96 > v94;
                      unint64_t v97 = v96 - v94;
                      if (v83)
                      {
                        int64x2_t v98 = (uint64_t *)(v95 + 8 * v94);
                        do
                        {
                          int64x2_t v100 = (uint64_t *)*v98++;
                          int64x2_t v99 = v100;
                          float v101 = (*((double *)v100 + 7) - v257) * (*((double *)v100 + 7) - v257)
                               + (*((double *)v100 + 8) - v255) * (*((double *)v100 + 8) - v255);
                          double v102 = v101;
                          if (v76 >= v102 && v90 > v102)
                          {
                            double v90 = v102;
                            long long v86 = v99;
                          }
                          --v97;
                        }
                        while (v97);
                      }
                    }
                    else
                    {
                      uint64_t v103 = *(unsigned __int16 *)(v87 + 2 * (v91 + v93) + 2);
                      if (v94 < v103)
                      {
                        uint64_t v104 = *(void *)(v78 + 320);
                        unint64_t v105 = (*(void *)(v78 + 328) - v104) >> 3;
                        uint64_t v106 = v103 - v94;
                        int v107 = (uint64_t *)(v104 + 8 * v94);
                        _CF = v105 >= v94;
                        unint64_t v108 = v105 - v94;
                        if (!_CF) {
                          unint64_t v108 = 0;
                        }
                        do
                        {
                          if (!v108) {
                            break;
                          }
                          long long v110 = (uint64_t *)*v107++;
                          long long v109 = v110;
                          float v111 = (*((double *)v110 + 7) - v257) * (*((double *)v110 + 7) - v257)
                               + (*((double *)v110 + 8) - v255) * (*((double *)v110 + 8) - v255);
                          double v112 = v111;
                          if (v76 >= v112 && v90 > v112)
                          {
                            double v90 = v112;
                            long long v86 = v109;
                          }
                          --v108;
                          --v106;
                        }
                        while (v106);
                      }
                    }
                    ++v93;
                  }
                  while (v89 != v93);
                }
                else
                {
                  do
                  {
                    long long v113 = (unsigned __int16 *)(v87 + 2 * (v91 + v92));
                    unint64_t v114 = *v113;
                    uint64_t v115 = v113[1];
                    if (v114 < v115)
                    {
                      uint64_t v116 = *(void *)(v78 + 320);
                      unint64_t v117 = (*(void *)(v78 + 328) - v116) >> 3;
                      uint64_t v118 = v115 - v114;
                      char v119 = (uint64_t *)(v116 + 8 * v114);
                      _CF = v117 >= v114;
                      unint64_t v120 = v117 - v114;
                      if (!_CF) {
                        unint64_t v120 = 0;
                      }
                      do
                      {
                        if (!v120) {
                          break;
                        }
                        uint64_t v122 = (uint64_t *)*v119++;
                        long long v121 = v122;
                        float v123 = (*((double *)v122 + 7) - v257) * (*((double *)v122 + 7) - v257)
                             + (*((double *)v122 + 8) - v255) * (*((double *)v122 + 8) - v255);
                        double v124 = v123;
                        if (v76 >= v124 && v90 > v124)
                        {
                          double v90 = v124;
                          long long v86 = v121;
                        }
                        --v120;
                        --v118;
                      }
                      while (v118);
                    }
                    ++v92;
                  }
                  while (v89 != v92);
                }
                LODWORD(v81) = v81 + 1;
              }
              while ((int)v81 <= (int)v82);
              if (v86)
              {
                uint64_t v260 = *v86;
                long long v125 = *(_OWORD *)(v86 + 1);
                uint64_t v126 = v86[4];
                uint64_t v262 = v86[3];
                long long v261 = v125;
                int v264 = *((_DWORD *)v86 + 10);
                uint64_t v263 = v126;
                uint64_t v265 = *(uint64_t *)((char *)v86 + 44);
                long long v127 = *(_OWORD *)(v86 + 9);
                long long v266 = *(_OWORD *)(v86 + 7);
                long long v267 = v127;
                long long v268 = v272;
                id v269 = v272;
                long long v270 = v272;
                uint64_t v271 = 6;
                geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v268, (long long *)v86[11], (long long *)v86[12]);
                uint64_t v128 = v86[231];
                *(void *)((char *)v273 + 5) = *(uint64_t *)((char *)v86 + 1853);
                v273[0] = v128;
                geo::optional<md::mun::CollectionPoint>::optional((uint64_t)&v283, (uint64_t)&v260);
                char v129 = v268;
                uint64_t v130 = v269;
                if (v268 != v269)
                {
                  do
                  {
                    CGSize v131 = (void *)v129[31];
                    if (v131 != (void *)v129[33]) {
                      free(v131);
                    }
                    v129 += 36;
                  }
                  while (v129 != v130);
                  char v129 = v268;
                }
                if (v129 != (void *)v270) {
                  free(v129);
                }
                if ((_BYTE)v283)
                {
                  float64x2_t v132 = vsubq_f64(v287, v252);
                  double v133 = vaddvq_f64(vmulq_f64(v132, v132));
                  if (v133 >= v77
                    || (geo::optional<md::mun::CollectionPoint>::operator=((uint64_t)&v274, (uint64_t)&v283),
                        double v77 = v133,
                        (_BYTE)v283))
                  {
                    uint64_t v134 = v288;
                    uint64_t v135 = v289;
                    if (v288 != v289)
                    {
                      do
                      {
                        uint64_t v136 = (void *)v134[31];
                        if (v136 != (void *)v134[33]) {
                          free(v136);
                        }
                        v134 += 36;
                      }
                      while (v134 != v135);
                      uint64_t v134 = v288;
                    }
                    if (v134 != v290) {
                      free(v134);
                    }
                  }
                }
              }
            }
            uint64_t v84 = (void *)v64[1];
            if (v84)
            {
              do
              {
                uint64_t v85 = v84;
                uint64_t v84 = (void *)*v84;
              }
              while (v84);
            }
            else
            {
              do
              {
                uint64_t v85 = (void *)v64[2];
                _ZF = *v85 == (void)v64;
                double v64 = v85;
              }
              while (!_ZF);
            }
            double v64 = v85;
          }
          while (v85 != (void *)(v61 + 56));
        }
        uint64_t v137 = (geo::read_write_lock *)pthread_rwlock_unlock((pthread_rwlock_t *)(v61 + 96));
        if (v137) {
          geo::read_write_lock::logFailure(v137, (uint64_t)"unlock", v138);
        }
        if ((_BYTE)v274)
        {
          [v8 setCurrentPoint:&v275];
          long double v139 = *(double *)&v276;
          long double v140 = *(double *)&v277;
          double v141 = v278[0];
          double v142 = sqrt(v139 * v139 + v140 * v140);
          double v143 = atan2(v278[0], v142 * 0.996647189);
          long double v144 = atan2(v140, v139);
          __double2 v145 = __sincos_stret(v143);
          double v146 = atan2(v141 + v145.__sinval * v145.__sinval * 42841.3115 * v145.__sinval, v142 + v145.__cosval * v145.__cosval * -42697.6727 * v145.__cosval);
          __double2 v147 = __sincos_stret(v146);
          *uint64_t v251 = v146;
          *((long double *)v8 + 558) = v144;
          *((double *)v8 + 559) = v142 / v147.__cosval
                                + -6378137.0 / sqrt(v147.__sinval * v147.__sinval * -0.00669437999 + 1.0);
        }
        uint64_t v148 = *objc_msgSend(v8, "runLoopController", v251);
        if (v148)
        {
          LOBYTE(v283) = 4;
          md::MapEngine::setNeedsTick(v148, &v283);
        }
        if ((_BYTE)v274)
        {
          long long v149 = v280;
          uint64_t v150 = v281;
          if (v280 != v281)
          {
            do
            {
              char v151 = (void *)v149[31];
              if (v151 != (void *)v149[33]) {
                free(v151);
              }
              v149 += 36;
            }
            while (v149 != v150);
            long long v149 = v280;
          }
          if (v149 != v282) {
            free(v149);
          }
        }
        int v24 = v8[168];
      }
      else
      {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
  }
  double v25 = *((double *)v8 + 558);
  double v26 = *((double *)v8 + 559);
  __double2 v27 = __sincos_stret(*((double *)v8 + 557));
  double v28 = 6378137.0 / sqrt(v27.__sinval * v27.__sinval * -0.00669437999 + 1.0);
  double v29 = (v28 + v26) * v27.__cosval;
  __double2 v30 = __sincos_stret(v25);
  double v31 = v29 * v30.__cosval;
  double v32 = v29 * v30.__sinval;
  double v256 = (v26 + v28 * 0.99330562) * v27.__sinval;
  if (v24)
  {
    if (([v8 isAnimationsRunning] & 1) == 0) {
      [v8 updateCurrentPointView:0];
    }
    float v33 = *((double *)v8 + 553);
    float v34 = fmodf((float)(3.1416 - *((float *)v8 + 56)) + v33, 6.2832);
    float v35 = fmodf(v34 + 6.2832, 6.2832) + -3.1416;
    __float2 v36 = __sincosf_stret(v35 * 0.5);
    uint64_t v37 = *((void *)v8 + 17);
    double v38 = [v8 canvas];
    [v38 size];
    *(float *)&double v39 = v39;
    *(float *)&double v40 = v40;
    uint64_t v41 = 720;
    if ((float)(*(float *)&v39 / fmaxf(*(float *)&v40, 0.01)) > 1.0) {
      uint64_t v41 = 736;
    }
    double v42 = *(double *)(v37 + v41);
    double v43 = *((double *)v8 + 556);

    if (v43 < v42)
    {
      uint64_t v44 = *((void *)v8 + 553);
      *((void *)v8 + 550) = v44;
      *((void *)v8 + 548) = v44;
      *((void *)v8 + 549) = 0;
    }
    if (v8[4344])
    {
      _ZF = v43 < v42 || v8[2034] == 0;
      if (!_ZF)
      {
        double v46 = fmax(fabs(*((double *)v8 + 554)), 0.34906585);
        double v47 = v46 * 2.29183118 + -0.8;
        if (v46 > 0.785398163) {
          double v47 = 1.0;
        }
        float v48 = v47 * v47 * (v47 * 2.0 + -3.0) + 1.0;
        double v49 = (unsigned __int8 *)*((void *)v8 + 261);
        uint64_t v50 = *((void *)v8 + 17);
        if (*((unsigned __int8 **)v8 + 262) != v49)
        {
          uint64_t v51 = *v49;
          uint64_t v52 = v49[1];
          uint64_t v53 = *(void *)(v50 + 144);
          uint64_t v54 = *(void *)(v53 + 80);
          uint64_t v55 = *(void *)(v53 + 88);
          if (v54 != v55)
          {
            while (*(_WORD *)v54 != 36)
            {
              v54 += 16;
              if (v54 == v55) {
                goto LABEL_138;
              }
            }
          }
          if (v54 != v55)
          {
            long long v152 = *(const gdc::LayerDataRequestKey **)(v54 + 8);
            if (v152)
            {
              uint64_t v153 = *((void *)v8 + 22);
              uint64_t v154 = v8[2035];
              uint64_t v155 = *((unsigned __int16 *)v8 + 1016);
              uint64_t v156 = *((unsigned int *)v8 + 507);
              long long v274 = v278;
              long long v275 = v278;
              *(double *)&uint64_t v276 = COERCE_DOUBLE(v278);
              uint64_t v277 = 32;
              unint64_t v279 = 0;
              uint64_t v157 = (v51 << 16) | (v156 << 32) | v52;
              uint64_t v283 = v155;
              geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v274, (char *)v278, (char *)&v283, v284);
              uint64_t v283 = v153;
              geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v274, (char *)v275, (char *)&v283, v284);
              uint64_t v283 = v157;
              geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v274, (char *)v275, (char *)&v283, v284);
              uint64_t v283 = v154;
              geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v274, (char *)v275, (char *)&v283, v284);
              long long v158 = (unsigned __int8 *)v274;
              unint64_t v159 = (char *)v275 - (unsigned char *)v274;
              if (v275 == v274)
              {
                unint64_t v160 = 0;
              }
              else
              {
                unint64_t v160 = 0;
                if (v159 <= 1) {
                  unint64_t v159 = 1;
                }
                do
                {
                  unsigned int v161 = *v158++;
                  v160 ^= (v160 << 6) + (v160 >> 2) - 0x61C8864680B583EBLL + v161;
                  --v159;
                }
                while (v159);
              }
              unint64_t v279 = v160;
              gdc::LayerDataRequestKey::LayerDataRequestKey((unsigned __int8 *)&v283, 0, 0x24u, (uint64_t)&v274, 2147483646);
              if (v274 != v276) {
                free(v274);
              }
              gdc::LayerDataStore::get((gdc::LayerDataStore *)&v274, v152, (unsigned __int8 *)&v283);
              uint64_t v162 = v274;
              long long v163 = (std::__shared_weak_count *)v275;
              if (v275)
              {
                atomic_fetch_add_explicit((atomic_ullong *volatile)v275 + 1, 1uLL, memory_order_relaxed);
                if (!atomic_fetch_add(&v163->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
                  std::__shared_weak_count::__release_weak(v163);
                }
              }
              if ((_BYTE)v288) {
                LOBYTE(v288) = 0;
              }
              if (v285 != v286) {
                free(v285);
              }
              if (v162)
              {
                uint64_t v164 = v162[65];
                uint64_t v165 = v162[66] - v164;
                if (v165)
                {
                  unint64_t v166 = v165 >> 2;
                  float v167 = (float)((float)v166 * v35) * -0.159154943;
                  uint64_t v168 = ((int)(vcvtms_s32_f32(v167) + v166) % v166);
                  float v169 = *(float *)(v164 + 4 * (int)v168)
                       + (float)((float)(*(float *)(v164 + 4 * (int)((((v168 << 32) + 0x100000000) >> 32) % v166))
                                       - *(float *)(v164 + 4 * (int)v168))
                               * (float)(v167 - floorf(v167)));
                }
                else
                {
                  float v169 = 1.0;
                }
                float v48 = v169 * v48;
              }
              if (v163 && !atomic_fetch_add(&v163->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
                std::__shared_weak_count::__release_weak(v163);
              }
            }
          }
LABEL_138:
          uint64_t v50 = *((void *)v8 + 17);
        }
        float v170 = *((float *)v8 + 1087);
        if (v170 <= 0.0)
        {
LABEL_150:
          double v191 = *((double *)v8 + 547);
          unint64_t v192 = +[VKDebugSettings sharedSettings];
          if ([v192 muninOverrideParallax])
          {
            [v192 muninParallaxSpring];
            float v194 = v193;
          }
          else if (*(unsigned char *)(v50 + 600))
          {
            float v194 = *(float *)(v50 + 604);
          }
          else
          {
            float v194 = 25.0;
          }

          uint64_t v195 = *((void *)v8 + 17);
          char v196 = +[VKDebugSettings sharedSettings];
          if ([v196 muninOverrideParallax])
          {
            [v196 muninParallaxDamper];
            float v198 = v197;
          }
          else if (*(unsigned char *)(v195 + 608))
          {
            float v198 = *(float *)(v195 + 612);
          }
          else
          {
            float v198 = 0.75;
          }

          float v199 = fmax(fmin(v254 - v191, 0.0666666667), 0.0);
          *((double *)v8 + 551) = v194 * v194;
          *((double *)v8 + 552) = v194 * (v198 + v198);
          gdc::Spring<double,1,(gdc::SpringType)1>::update((double *)v8 + 548, v199);
          uint64_t v200 = *((void *)v8 + 17);
          v201 = +[VKDebugSettings sharedSettings];
          if ([v201 muninOverrideParallax])
          {
            [v201 muninParallaxScale];
            float v203 = v202;
            goto LABEL_165;
          }
          v204 = +[VKPlatform sharedPlatform];
          char v205 = [v204 isPad];

          if (v205)
          {
            float v203 = 0.04;
            if (!*(unsigned char *)(v200 + 592)) {
              goto LABEL_165;
            }
          }
          else
          {
            uint64_t v249 = +[VKPlatform sharedPlatform];
            int v250 = [v249 isMac];

            if (v250) {
              float v203 = 0.015;
            }
            else {
              float v203 = 0.08;
            }
            if (!*(unsigned char *)(v200 + 592)) {
              goto LABEL_165;
            }
          }
          float v203 = *(float *)(v200 + 596);
LABEL_165:

          float v206 = *((double *)v8 + 549);
          float v207 = 0.0;
          if (fabsf(v206) > 0.0001)
          {
            float v207 = (float)-(float)(v48 * v203) * v206;
            uint64_t v208 = *(void *)[v8 runLoopController];
            if (v208)
            {
              LOBYTE(v283) = 4;
              md::MapEngine::setNeedsTick(v208, &v283);
            }
          }
          float v209 = fabsf(v207);
          if (v209 <= 1.0) {
            float v210 = (float)(2.0 - v209) * v209;
          }
          else {
            float v210 = 1.0;
          }
          float v211 = v210 * (float)(int)((__PAIR64__(v207 > 0.0, LODWORD(v207)) - COERCE_UNSIGNED_INT(0.0)) >> 32);
          float v213 = *((float *)v8 + 54);
          float v212 = *((float *)v8 + 55);
          float v214 = *((float *)v8 + 52);
          float v215 = *((float *)v8 + 53);
          float v216 = v214 * v36.__sinval;
          float v217 = -(float)((float)(v213 * v36.__sinval) - (float)(v214 * v36.__cosval));
          float v218 = (float)(v212 * v36.__sinval) + (float)(v215 * v36.__cosval);
          float v219 = v216 + (float)(v213 * v36.__cosval);
          float v220 = -(float)((float)(v215 * v36.__sinval) - (float)(v212 * v36.__cosval));
          float v221 = v211 * (float)(v219 + v219);
          float v222 = v211 * (float)(-2.0 * v218);
          double v31 = v31 + (float)((float)(v211 + (float)(v222 * v218)) - (float)(v221 * v219));
          double v32 = v32 + (float)-(float)((float)(v222 * v217) - (float)(v221 * v220));
          double v256 = v256 + (float)((float)(v222 * v220) + (float)(v221 * v217));
          goto LABEL_172;
        }
        long long v171 = +[VKDebugSettings sharedSettings];
        if ([v171 muninOverrideParallax])
        {
          [v171 muninCameraPanOffset];
          float v173 = v172;
LABEL_149:

          float v178 = fminf(fmaxf(v170, 0.0), 1.0);
          float v179 = (float)((float)-(float)(v48 * (float)(v178 * v178)) * (float)((float)(v178 * -2.0) + 3.0)) * v173;
          float v181 = *((float *)v8 + 54);
          float v180 = *((float *)v8 + 55);
          float v182 = *((float *)v8 + 52);
          float v183 = *((float *)v8 + 53);
          float v184 = v182 * v36.__sinval;
          float v185 = -(float)((float)(v181 * v36.__sinval) - (float)(v182 * v36.__cosval));
          float v186 = (float)(v180 * v36.__sinval) + (float)(v183 * v36.__cosval);
          float v187 = v184 + (float)(v181 * v36.__cosval);
          float v188 = -(float)((float)(v183 * v36.__sinval) - (float)(v180 * v36.__cosval));
          float v189 = v179 * (float)(v186 + v186);
          float v190 = v179 * (float)(-2.0 * v185);
          double v31 = v31 + (float)-(float)((float)(v190 * v187) - (float)(v189 * v188));
          double v32 = v32 + (float)((float)(v189 * v187) + (float)(v190 * v188));
          double v256 = v256 + (float)((float)(v179 - (float)(v189 * v186)) + (float)(v190 * v185));
          uint64_t v50 = *((void *)v8 + 17);
          goto LABEL_150;
        }
        uint64_t v174 = +[VKPlatform sharedPlatform];
        if ([v174 isPad])
        {
        }
        else
        {
          long long v175 = +[VKPlatform sharedPlatform];
          int v176 = [v175 isMac];

          if (!v176)
          {
            *(float *)&int v177 = -0.1;
LABEL_147:
            float v173 = *(float *)&v177;
            if (*(unsigned char *)(v50 + 584)) {
              float v173 = *(float *)(v50 + 588);
            }
            goto LABEL_149;
          }
        }
        *(float *)&int v177 = -0.08;
        goto LABEL_147;
      }
    }
  }
LABEL_172:
  long long v223 = (double *)*((void *)v8 + 17);
  if (*((double *)v8 + 556) < fmax(v223[94] - v223[95], 0.00872664626)) {
    goto LABEL_176;
  }
  uint64_t v224 = [v8 canvas];
  [v224 size];
  *(float *)&double v225 = v225;
  *(float *)&double v226 = v226;
  uint64_t v227 = 91;
  if ((float)(*(float *)&v225 / fmaxf(*(float *)&v226, 0.01)) > 1.0) {
    uint64_t v227 = 93;
  }
  BOOL v228 = *((double *)v8 + 556) > v223[96] + v223[v227];

  if (v228)
  {
LABEL_176:
    if (([v8 isAnimationsRunning] & 1) == 0)
    {
      double v229 = *((double *)v8 + 556);
      long long v230 = (double *)*((void *)v8 + 17);
      double v231 = v230[94];
      double v232 = v230[95];
      long long v233 = [v8 canvas];
      [v233 size];
      *(float *)&double v234 = v234;
      *(float *)&double v235 = v235;
      uint64_t v236 = 91;
      if ((float)(*(float *)&v234 / fmaxf(*(float *)&v235, 0.01)) > 1.0) {
        uint64_t v236 = 93;
      }
      double v237 = v230[v236];
      double v238 = v230[96];

      v8[4440] = 0;
      v259[0] = fmin(fmax(v229, fmax(v231 - v232, 0.00872664626)), v238 + v237);
      v258[0] = MEMORY[0x1E4F143A8];
      v258[1] = 3221225472;
      v258[2] = __59__VKMuninCameraController_updateWithTimestamp_withContext___block_invoke;
      v258[3] = &unk_1E5A93728;
      v258[4] = v8;
      [v8 zoomAnimatedWithDuration:v259 duration:v258 completion:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(0.5))];
    }
  }
  uint64_t v239 = *((void *)v8 + 553);
  uint64_t v240 = *((void *)v8 + 554);
  double v241 = sqrt(v31 * v31 + v32 * v32);
  double v242 = atan2(v256, v241 * 0.996647189);
  long double v243 = atan2(v32, v31);
  __double2 v244 = __sincos_stret(v242);
  double v245 = atan2(v256 + v244.__sinval * v244.__sinval * 42841.3115 * v244.__sinval, v241 + v244.__cosval * v244.__cosval * -42697.6727 * v244.__cosval);
  __double2 v246 = __sincos_stret(v245);
  uint64_t v247 = *(void *)([v8 mapDataAccess] + 16);
  *(double *)(v247 + 8) = v245;
  *(long double *)(v247 + 16) = v243;
  double v248 = v241 / v246.__cosval + -6378137.0 / sqrt(v246.__sinval * v246.__sinval * -0.00669437999 + 1.0);
  *(double *)(v247 + 24) = v248;
  *(void *)(v247 + 32) = 0;
  *(void *)(v247 + 40) = v240;
  *(void *)(v247 + 48) = v239;
  *(void *)(v247 + 56) = 0;
  *((double *)v8 + 560) = v245;
  *((long double *)v8 + 561) = v243;
  *((double *)v8 + 562) = v248;
  *((void *)v8 + 563) = 0;
  *((void *)v8 + 564) = v240;
  *((void *)v8 + 565) = v239;
  *((void *)v8 + 566) = 0;
  *((double *)v8 + 547) = v254;
  [v8 _updateDebugOverlay:v253];
}

uint64_t __59__VKMuninCameraController_updateWithTimestamp_withContext___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 4440) = 1;
  return result;
}

@end