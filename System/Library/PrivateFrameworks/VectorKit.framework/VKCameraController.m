@interface VKCameraController
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- (AnimationRunner)animationRunner;
- (BOOL)canPitch;
- (BOOL)canRotate;
- (BOOL)canZoomInForTileSize:(int64_t)a3;
- (BOOL)canZoomOutForTileSize:(int64_t)a3;
- (BOOL)centerCoordinate:(id *)a3 andDistanceFromCenter:(double *)a4 forMapRegion:(id)a5;
- (BOOL)edgeInsetsAnimating;
- (BOOL)isAnimating;
- (BOOL)isChangingRegion;
- (BOOL)isFullyPitched;
- (BOOL)isGesturing;
- (BOOL)isPitchEnabled;
- (BOOL)isPitched;
- (BOOL)isRotateEnabled;
- (BOOL)isRotated;
- (BOOL)staysCenteredDuringPinch;
- (BOOL)staysCenteredDuringRotation;
- (BOOL)usesVKCamera;
- (BOOL)wantsTimerTick;
- (CGPoint)centerScreenPoint;
- (CGPoint)scaledScreenPointForPoint:(CGPoint)a3;
- (GEOMapRegion)mapRegion;
- (GEOMapRegion)mapRegionIgnoringEdgeInsets;
- (Matrix<int,)cursorFromScreenPoint:(CGPoint)a3;
- (RunLoopController)runLoopController;
- (VKCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6;
- (VKEdgeInsets)edgeInsets;
- (double)altitude;
- (double)currentZoomLevel;
- (double)currentZoomLevelForTileSize:(int64_t)a3;
- (double)distanceFromCenterCoordinate;
- (double)heading;
- (double)maxPitch;
- (double)maximumZoomLevel;
- (double)maximumZoomLevelForTileSize:(int64_t)a3;
- (double)minPitch;
- (double)minimumZoomLevel;
- (double)minimumZoomLevelForTileSize:(int64_t)a3;
- (double)pitch;
- (double)presentationHeading;
- (double)topDownMinimumZoomLevel;
- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3;
- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3;
- (id).cxx_construct;
- (id)cameraDelegate;
- (id)canvas;
- (id)detailedDescription;
- (id)getCameraType:(unsigned __int8)a3;
- (id)getMapEngineModeType:(unsigned __int8)a3;
- (id)getWorldType:(unsigned __int8)a3;
- (id)vkCamera;
- (int64_t)baseDisplayRate;
- (int64_t)maxDisplayRate;
- (int64_t)tileSize;
- (shared_ptr<gdc::Camera>)camera;
- (unint64_t)regionChangeCount;
- (void)beginRegionChange:(BOOL)a3;
- (void)checkAndResetRegionChangeCount;
- (void)endRegionChange;
- (void)mapDataAccess;
- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4;
- (void)setBaseDisplayRate:(int64_t)a3;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCameraDelegate:(id)a3;
- (void)setCanvas:(id)a3;
- (void)setCenterCoordinate:(id)a3;
- (void)setDistanceFromCenterCoordinate:(double)a3;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)setEdgeInsetsAnimating:(BOOL)a3;
- (void)setGesturing:(BOOL)a3;
- (void)setHeading:(double)a3;
- (void)setIsPitchEnabled:(BOOL)a3;
- (void)setIsRotateEnabled:(BOOL)a3;
- (void)setMaxDisplayRate:(int64_t)a3;
- (void)setPitch:(double)a3;
- (void)setStaysCenteredDuringPinch:(BOOL)a3;
- (void)setStaysCenteredDuringRotation:(BOOL)a3;
- (void)setVkCamera:(id)a3;
@end

@implementation VKCameraController

- (GEOMapRegion)mapRegionIgnoringEdgeInsets
{
  v3 = [(VKCameraController *)self canvas];
  [v3 size];
  if (v4 == 0.0)
  {
  }
  else
  {
    v5 = [(VKCameraController *)self canvas];
    [v5 size];
    double v7 = v6;

    if (v7 != 0.0)
    {
      v8 = [(VKCameraController *)self vkCamera];
      id v11 = 0;
      VKCameraCalculateEnclosingRegion(v8, &v11, 0, 0.0, 0.0, 0.0, 0.0);
      id v9 = v11;

      goto LABEL_6;
    }
  }
  id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithCoordinateRegion:", 0.0, 0.0, 90.0, 180.0);
LABEL_6:
  return (GEOMapRegion *)v9;
}

- (double)maximumZoomLevelForTileSize:(int64_t)a3
{
  [(VKCameraController *)self maximumZoomLevel];
  double v6 = v5;
  [(VKCameraController *)self zoomLevelAdjustmentForTileSize:a3];
  return v7 + v6;
}

- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3
{
  [(VKCameraController *)self topDownMinimumZoomLevel];
  double v6 = v5;
  [(VKCameraController *)self zoomLevelAdjustmentForTileSize:a3];
  return v7 + v6;
}

- (double)currentZoomLevelForTileSize:(int64_t)a3
{
  [(VKCameraController *)self currentZoomLevel];
  double v6 = v5;
  [(VKCameraController *)self zoomLevelAdjustmentForTileSize:a3];
  return v7 + v6;
}

- (id)canvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  return WeakRetained;
}

- (CGPoint)centerScreenPoint
{
  [(VKCameraController *)self camera];
  if (!v19 || atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v18) {
      goto LABEL_4;
    }
LABEL_12:
    double v16 = 0.5;
    _Q1.f64[0] = 0.5;
    goto LABEL_13;
  }
  ((void (*)())v19->__on_zero_shared)();
  std::__shared_weak_count::__release_weak(v19);
  if (!v18) {
    goto LABEL_12;
  }
LABEL_4:
  [(VKCameraController *)self camera];
  *(float32x2_t *)&v3.f64[0] = v18[47];
  __asm { FMOV            V1.2D, #0.5 }
  if (v3.f64[0] > 0.0 && *(double *)&v18[46] > 0.0)
  {
    *(float32x2_t *)&v3.f64[1] = v18[46];
    float64x2_t v9 = vaddq_f64(v3, v3);
    float32x2_t v10 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v18[54]), v9));
    float64x2_t v11 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v18[55]), v9)));
    float64x2_t v12 = vcvtq_f64_f32(v10);
    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v14 = vsubq_f64(_Q2, v12);
    float64x2_t v15 = vaddq_f64(v12, _Q2);
    *(void *)&_Q2.f64[0] = *(_OWORD *)&vaddq_f64(v14, v11);
    _Q2.f64[1] = vsubq_f64(v15, v11).f64[1];
    _Q1 = vcvtq_f64_f32(vcvt_f32_f64(_Q2));
  }
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    float64x2_t v17 = _Q1;
    ((void (*)())v19->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v19);
    _Q1 = v17;
  }
  double v16 = _Q1.f64[1];
LABEL_13:
  result.y = _Q1.f64[0];
  result.x = v16;
  return result;
}

- (shared_ptr<gdc::Camera>)camera
{
  cntrl = self->_camera.__cntrl_;
  *v2 = self->_camera.__ptr_;
  v2[1] = (Camera *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Camera *)self;
  return result;
}

- (BOOL)wantsTimerTick
{
  return self->_gesturing;
}

- (id)vkCamera
{
  return self->_vkCamera;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (BOOL)isPitchEnabled
{
  return self->_isPitchEnabled;
}

- (BOOL)isGesturing
{
  return self->_gesturing;
}

- (GEOMapRegion)mapRegion
{
  float64x2_t v3 = [(VKCameraController *)self canvas];
  [v3 size];
  if (v4 == 0.0)
  {
  }
  else
  {
    double v5 = [(VKCameraController *)self canvas];
    [v5 size];
    double v7 = v6;

    if (v7 != 0.0)
    {
      [(VKCameraController *)self edgeInsets];
      float v9 = v8;
      float32x2_t v10 = [(VKCameraController *)self canvas];
      [v10 size];
      double v12 = v11;
      [(VKCameraController *)self edgeInsets];
      float v14 = v13;
      float64x2_t v15 = [(VKCameraController *)self canvas];
      [v15 size];
      double v17 = v16;
      [(VKCameraController *)self edgeInsets];
      float v19 = v18;
      v20 = [(VKCameraController *)self canvas];
      [v20 size];
      double v22 = v21;
      [(VKCameraController *)self edgeInsets];
      float v24 = v23;
      v25 = [(VKCameraController *)self canvas];
      [v25 size];
      double v27 = v26;

      v28 = [(VKCameraController *)self vkCamera];
      float v29 = (v24 + v24) / v27;
      float v30 = (v19 + v19) / v22;
      float v31 = (v14 + v14) / v17;
      float v32 = (v9 + v9) / v12;
      id v35 = 0;
      VKCameraCalculateEnclosingRegion(v28, &v35, 0, v32, v31, v30, v29);
      id v33 = v35;

      goto LABEL_6;
    }
  }
  id v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithCoordinateRegion:", 0.0, 0.0, 90.0, 180.0);
LABEL_6:
  return (GEOMapRegion *)v33;
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

- (BOOL)usesVKCamera
{
  return 1;
}

- (RunLoopController)runLoopController
{
  return self->_runLoopController;
}

- (void)endRegionChange
{
  unint64_t regionChangeCount = self->_regionChangeCount;
  if (regionChangeCount)
  {
    unint64_t v4 = regionChangeCount - 1;
    self->_unint64_t regionChangeCount = v4;
    if (!v4)
    {
      id v5 = [(VKCameraController *)self cameraDelegate];
      [v5 mapLayerDidChangeRegionAnimated:self->_inProgressRegionChangeIsAnimated];
    }
  }
}

- (void)beginRegionChange:(BOOL)a3
{
  unint64_t regionChangeCount = self->_regionChangeCount;
  self->_unint64_t regionChangeCount = regionChangeCount + 1;
  if (!regionChangeCount)
  {
    BOOL v4 = a3;
    self->_inProgressRegionChangeIsAnimated = a3;
    id v5 = [(VKCameraController *)self cameraDelegate];
    [v5 mapLayerWillChangeRegionAnimated:v4];
  }
}

- (id)cameraDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);
  return WeakRetained;
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  BOOL v4 = *(Camera **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_camera.__cntrl_;
  self->_camera.__ptr_ = v4;
  self->_camera.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)setVkCamera:(id)a3
{
  id v5 = (VKCamera *)a3;
  vkCamera = self->_vkCamera;
  p_vkCamera = &self->_vkCamera;
  if (vkCamera != v5)
  {
    float v8 = v5;
    objc_storeStrong((id *)p_vkCamera, a3);
    id v5 = v8;
  }
}

- (void)setMaxDisplayRate:(int64_t)a3
{
  self->_maxDisplayRate = a3;
}

- (void)setCanvas:(id)a3
{
  id obj = a3;
  p_canvas = &self->_canvas;
  id WeakRetained = objc_loadWeakRetained((id *)p_canvas);

  double v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_canvas, obj);
    double v6 = obj;
  }
}

- (void)setBaseDisplayRate:(int64_t)a3
{
  self->_baseDisplayRate = a3;
}

- (void)setIsPitchEnabled:(BOOL)a3
{
  self->_isPitchEnabled = a3;
}

- (VKCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)VKCameraController;
  double v11 = [(VKCameraController *)&v15 init];
  double v12 = v11;
  if (v11)
  {
    v11->_mapDataAccess = a3;
    v11->_animationRunner = a4;
    v11->_runLoopController = a5;
    objc_storeWeak((id *)&v11->_cameraDelegate, v10);
    v12->_baseDisplayRate = -1;
    v12->_maxDisplayRate = -1;
    float v13 = v12;
  }

  return v12;
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (unint64_t)regionChangeCount
{
  return self->_regionChangeCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraDelegate);
  objc_destroyWeak((id *)&self->_canvas);
  cntrl = self->_camera.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_vkCamera, 0);
}

- (AnimationRunner)animationRunner
{
  return self->_animationRunner;
}

- (void)mapDataAccess
{
  return self->_mapDataAccess;
}

- (void)setIsRotateEnabled:(BOOL)a3
{
  self->_isRotateEnabled = a3;
}

- (BOOL)isRotateEnabled
{
  return self->_isRotateEnabled;
}

- (void)setStaysCenteredDuringRotation:(BOOL)a3
{
  self->_staysCenteredDuringRotation = a3;
}

- (BOOL)staysCenteredDuringRotation
{
  return self->_staysCenteredDuringRotation;
}

- (void)setStaysCenteredDuringPinch:(BOOL)a3
{
  self->_staysCenteredDuringPinch = a3;
}

- (BOOL)staysCenteredDuringPinch
{
  return self->_staysCenteredDuringPinch;
}

- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4
{
  v10[23] = 20;
  strcpy(v10, "Detailed Description");
  id v5 = [(VKCameraController *)self detailedDescription];
  double v6 = (const std::string::value_type *)[v5 UTF8String];
  memset(&__p, 0, sizeof(__p));
  int v9 = 4;
  if (v6)
  {
    std::string::__assign_external(&__p, v6);
  }
  else
  {
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v10, (uint64_t)&v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (BOOL)centerCoordinate:(id *)a3 andDistanceFromCenter:(double *)a4 forMapRegion:(id)a5
{
  return 0;
}

- (double)altitude
{
  return 0.0;
}

- (double)maxPitch
{
  return 0.0;
}

- (double)minPitch
{
  return 0.0;
}

- (double)pitch
{
  return 0.0;
}

- (void)setPitch:(double)a3
{
}

- (double)presentationHeading
{
  return 0.0;
}

- (double)heading
{
  return 0.0;
}

- (void)setHeading:(double)a3
{
}

- (double)distanceFromCenterCoordinate
{
  return 0.0;
}

- (void)setDistanceFromCenterCoordinate:(double)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  [(VKCameraController *)self doesNotRecognizeSelector:a2];
  double v2 = 0.0;
  double v3 = 0.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setCenterCoordinate:(id)a3
{
}

- (BOOL)isRotated
{
  return 1;
}

- (BOOL)isFullyPitched
{
  return 0;
}

- (BOOL)isPitched
{
  return 1;
}

- (BOOL)canRotate
{
  return 1;
}

- (BOOL)canPitch
{
  return 1;
}

- (int64_t)tileSize
{
  return 0;
}

- (BOOL)canZoomOutForTileSize:(int64_t)a3
{
  -[VKCameraController minimumZoomLevelForTileSize:](self, "minimumZoomLevelForTileSize:");
  double v6 = v5;
  [(VKCameraController *)self currentZoomLevelForTileSize:a3];
  return vabdd_f64(v7, v6) >= 0.8;
}

- (BOOL)canZoomInForTileSize:(int64_t)a3
{
  -[VKCameraController maximumZoomLevelForTileSize:](self, "maximumZoomLevelForTileSize:");
  double v6 = v5;
  [(VKCameraController *)self currentZoomLevelForTileSize:a3];
  return vabdd_f64(v7, v6) >= 0.8;
}

- (double)minimumZoomLevelForTileSize:(int64_t)a3
{
  [(VKCameraController *)self minimumZoomLevel];
  double v6 = v5;
  [(VKCameraController *)self zoomLevelAdjustmentForTileSize:a3];
  return v7 + v6;
}

- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3
{
  int v3 = a3;
  int v4 = [(VKCameraController *)self tileSize];
  int v5 = 0;
  if (v4 && v3)
  {
    if (v3 >= v4)
    {
      int v5 = 0;
    }
    else
    {
      int v5 = 0;
      do
      {
        ++v5;
        v3 *= 2;
      }
      while (v3 < v4);
    }
    while (v3 > v4)
    {
      --v5;
      v4 *= 2;
    }
  }
  return (double)v5;
}

- (double)topDownMinimumZoomLevel
{
  return 21.0;
}

- (double)currentZoomLevel
{
  return 21.0;
}

- (double)maximumZoomLevel
{
  return 21.0;
}

- (double)minimumZoomLevel
{
  return 21.0;
}

- (BOOL)edgeInsetsAnimating
{
  return self->_edgeInsetsAnimating;
}

- (void)setEdgeInsetsAnimating:(BOOL)a3
{
  self->_edgeInsetsAnimating = a3;
}

- (Matrix<int,)cursorFromScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCameraController *)self canvas];
  [v6 contentScale];
  double v8 = v7;

  int v9 = [(VKCameraController *)self canvas];
  [v9 size];
  double v11 = v10;
  double v12 = [(VKCameraController *)self canvas];
  [v12 size];
  uint64_t v14 = (int)((v8 - y * v8) * v13);

  return (Matrix<int, 2, 1>)((int)(v8 * x * v11) | (unint64_t)(v14 << 32));
}

- (CGPoint)scaledScreenPointForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v5 = [(VKCameraController *)self canvas];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  float v10 = x / v7;
  float v11 = 1.0 - y / v9;
  double v12 = v10;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)detailedDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  int v4 = [(VKCameraController *)self description];
  int v5 = (void *)[v3 initWithFormat:@"%@\n\n", v4];

  [v5 appendFormat:@"_vkCamera: %@\n", self->_vkCamera];
  objc_msgSend(v5, "appendFormat:", @"_animating: %d\n", -[VKCameraController isAnimating](self, "isAnimating"));
  objc_msgSend(v5, "appendFormat:", @"_gesturing: %d\n", -[VKCameraController isGesturing](self, "isGesturing"));
  objc_msgSend(v5, "appendFormat:", @"_regionChangeCount: %lu\n", self->_regionChangeCount);
  return v5;
}

- (void)checkAndResetRegionChangeCount
{
  self->_unint64_t regionChangeCount = 0;
}

- (BOOL)isChangingRegion
{
  return self->_regionChangeCount != 0;
}

- (BOOL)isAnimating
{
  BOOL v3 = [(VKCameraController *)self isChangingRegion];
  if (v3) {
    LOBYTE(v3) = self->_inProgressRegionChangeIsAnimated;
  }
  return v3;
}

- (id)getMapEngineModeType:(unsigned __int8)a3
{
  if (a3 > 0x12u) {
    BOOL v3 = "<Invalid>";
  }
  else {
    BOOL v3 = off_1E5A92CE0[a3];
  }
  return (id)[NSString stringWithUTF8String:v3];
}

- (id)getCameraType:(unsigned __int8)a3
{
  if (a3 > 3u) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E5A8DA30 + a3);
  }
}

- (id)getWorldType:(unsigned __int8)a3
{
  if (a3 > 6u) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E5A8D9F8 + a3);
  }
}

- (void)setGesturing:(BOOL)a3
{
  self->_gesturing = a3;
}

- (void)setCameraDelegate:(id)a3
{
  id obj = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_cameraDelegate);

  double v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_cameraDelegate, obj);
    double v6 = obj;
  }
}

- (int64_t)maxDisplayRate
{
  return self->_maxDisplayRate;
}

- (int64_t)baseDisplayRate
{
  return self->_baseDisplayRate;
}

@end