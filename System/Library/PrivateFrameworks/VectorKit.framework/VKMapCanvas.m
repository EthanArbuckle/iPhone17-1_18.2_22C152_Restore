@interface VKMapCanvas
+ (BOOL)supportsMapType:(int)a3 scale:(int)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinate:(CGPoint)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToMapPoint:(CGPoint)a3;
- (BOOL)_isGlobeActive;
- (BOOL)forceRasterizationForGlobe;
- (BOOL)isPointValidForGesturing:(CGPoint)a3;
- (BOOL)trafficEnabled;
- (CGPoint)convertCoordinateToPoint:(id)a3;
- (CGPoint)convertMapPointToPoint:(id)a3;
- (NSArray)overlays;
- (NSArray)visibleTileSets;
- (VKInteractiveMapDelegate)delegate;
- (VKMapCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4;
- (VKPuckAnimator)puckAnimator;
- (__n128)visibleTileSets;
- (double)canonicalSkyHeight;
- (id).cxx_construct;
- (id)annotationCoordinateTest;
- (id)annotationRectTest;
- (id)attributionsForCurrentRegion;
- (id)consoleString:(BOOL)a3;
- (id)detailedDescription;
- (id)globeAnnotationCoordinateTest;
- (id)globeAnnotationRectTest;
- (id)markerAtScreenPoint:(CGPoint)a3 enableExtendedFeatureMarkers:(BOOL)a4;
- (int64_t)tileSize;
- (optional<float>)_zoomLevelForCanvasSize:(CGSize)a3;
- (uint64_t)observeValueForKeyPath:ofObject:change:context:;
- (void)addOverlay:(id)a3;
- (void)dealloc;
- (void)debugHighlightObjectAtPoint:(CGPoint)a3 highlightTarget:(unsigned __int8)a4;
- (void)didBecomeActive;
- (void)didBecomeInActive;
- (void)goToTileX:(int)a3 Y:(int)a4 Z:(int)a5 tileSize:(int)a6;
- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4;
- (void)insertOverlay:(id)a3 belowOverlay:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observeValueForKeyPath:ofObject:change:context:;
- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4;
- (void)removeOverlay:(id)a3;
- (void)setCameraHorizontalOffset:(double)a3 duration:(double)a4 timingFunction:(id)a5;
- (void)setCanonicalSkyHeight:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setForceRasterizationForGlobe:(BOOL)a3;
- (void)setMapType:(int)a3;
- (void)setMapType:(int)a3 animated:(BOOL)a4;
- (void)setPuckAnimator:(id)a3;
- (void)setTrafficEnabled:(BOOL)a3;
- (void)transferStateFromCanvas:(id)a3;
- (void)transitionToTracking:(BOOL)a3 mapMode:(int64_t)a4 startLocation:(id)a5 startCourse:(double)a6 cameraController:(id)a7 pounceCompletionHandler:(id)a8;
- (void)updateCameraForFrameResize;
- (void)updateOverlays;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)visibleTileSets;
@end

@implementation VKMapCanvas

+ (BOOL)supportsMapType:(int)a3 scale:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = [MEMORY[0x1E4F64918] modernManager];
  v7 = [v6 activeTileGroup];

  BOOL v8 = 1;
  switch(a3)
  {
    case 0:
    case 5:
    case 6:
    case 7:
    case 8:
      break;
    case 1:
      v9 = [v7 activeTileSetForTileType:7 scale:v4];
      goto LABEL_13;
    case 2:
      v10 = [v7 activeTileSetForTileType:7 scale:v4];

      v11 = [v7 activeTileSetForTileType:20 scale:0];

      v12 = [v7 activeTileSetForTileType:6 scale:v4];

      if (v10) {
        BOOL v13 = v11 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      BOOL v8 = !v13 || v12 != 0;
      break;
    case 3:
    case 10:
      v9 = [v7 activeTileSetForTileType:92 scale:1];
LABEL_13:
      BOOL v8 = v9 != 0;

      break;
    case 4:
      v15 = [v7 activeTileSetForTileType:92 scale:1];

      v16 = [v7 activeTileSetForTileType:66 scale:0];

      if (v15) {
        BOOL v17 = v16 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      BOOL v8 = !v17;
      break;
    default:
      BOOL v8 = 0;
      break;
  }

  return v8;
}

uint64_t __38__VKMapCanvas_globeAnnotationRectTest__block_invoke()
{
  return 2;
}

- (CGPoint)convertCoordinateToPoint:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(VKCameraController *)self->super._cameraController usesVKCamera])
  {
    long double v5 = tan(var0 * 0.00872664626 + 0.785398163);
    long double v6 = log(v5);
    v7.f64[0] = var1;
    v7.f64[1] = v6;
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v36 = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v7);
    uint64_t v37 = 0;
    [(VKCamera *)self->super._vkCamera._obj screenPointFromGroundPoint:&v36];
    double v14 = v13;
    double v16 = v15 * 0.5 + 0.5;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v18 = v17 * v16;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v20 = v19 * (0.5 - v14 * 0.5);
  }
  else
  {
    [(MDRenderTarget *)self->super._displayTarget size];
    double v22 = v21;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v24 = v23 * v22;
    double v18 = 0.0;
    double v20 = 0.0;
    if (v24 > 0.0)
    {
      v36.f64[0] = var0 * 0.0174532925;
      v36.f64[1] = var1 * 0.0174532925;
      uint64_t v37 = 0;
      uint64_t v25 = *(void *)([(VKScreenCanvas *)self mapEngine] + 904);
      v26 = [(VKScreenCanvas *)self mapEngine];
      uint64_t v27 = v26[133];
      v28 = (std::__shared_weak_count *)v26[134];
      if (v28)
      {
        atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v25 + 16), v36.f64, (uint64_t *)(v27 + 8));
        double v18 = v29;
        double v20 = v30;
        if (!atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      else
      {
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v25 + 16), v36.f64, (uint64_t *)(v27 + 8));
        double v18 = v31;
        double v20 = v32;
      }
    }
  }
  double v33 = v18;
  double v34 = v20;
  result.y = v34;
  result.x = v33;
  return result;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consoleFpsUpdateTicker);
  [WeakRetained processLocationUpdates];

  v20.receiver = self;
  v20.super_class = (Class)VKMapCanvas;
  [(VKScreenCanvas *)&v20 updateWithTimestamp:a4 withContext:a3];
  if (![(VKCameraController *)self->super._cameraController usesVKCamera]) {
    return;
  }
  BOOL v8 = self->super._vkCamera._obj;
  v26 = 0;
  mapEngine = self->super._mapEngine;
  if (mapEngine)
  {
    uint64_t v10 = mapEngine[149];
    if (v10)
    {
      if (*(unsigned char *)(v10 + 488) && (uint64_t v11 = *(void *)(v10 + 480)) != 0)
      {
        if (v11 == v10 + 456)
        {
          double v24 = v23;
          (*(void (**)(uint64_t, void *))(*(void *)(v10 + 456) + 24))(v10 + 456, v23);
LABEL_10:
          double v13 = v26;
          v26 = 0;
          if (v13 == v25)
          {
            (*(void (**)(void *))(v25[0] + 32))(v25);
            double v14 = v24;
            if (v24)
            {
LABEL_14:
              if (v14 == v23)
              {
                v26 = v25;
                (*(void (**)(void *, void *))(v23[0] + 24))(v23, v25);
                if (v24 == v23)
                {
                  (*(void (**)(void *))(v23[0] + 32))(v23);
                }
                else if (v24)
                {
                  (*(void (**)(void))(*v24 + 40))();
                }
              }
              else
              {
                v26 = v14;
              }
              goto LABEL_18;
            }
          }
          else
          {
            if (v13) {
              (*(void (**)(void *))(*v13 + 40))(v13);
            }
            double v14 = v24;
            if (v24) {
              goto LABEL_14;
            }
          }
          v26 = 0;
          goto LABEL_18;
        }
        uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 16))(v11);
      }
      else
      {
        uint64_t v12 = 0;
      }
      double v24 = (void *)v12;
      goto LABEL_10;
    }
  }
LABEL_18:
  cntrl = self->super._camera.__cntrl_;
  ptr = self->super._camera.__ptr_;
  double v19 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v16 = (uint64_t)v26;
  if (!v26) {
    goto LABEL_23;
  }
  if (v26 != v25)
  {
    uint64_t v16 = (*(uint64_t (**)(void *))(*v26 + 16))(v26);
LABEL_23:
    double v22 = (void *)v16;
    goto LABEL_25;
  }
  double v22 = v21;
  (*(void (**)(void *, void *))(v25[0] + 24))(v25, v21);
LABEL_25:
  [(VKCamera *)v8 updateCamera:&ptr withAdjustment:v21];
  if (v22 != v21)
  {
    if (v22) {
      (*(void (**)(void))(*v22 + 40))();
    }
    double v17 = (std::__shared_weak_count *)v19;
    if (!v19) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  (*(void (**)(void *))(v21[0] + 32))(v21);
  double v17 = (std::__shared_weak_count *)v19;
  if (v19)
  {
LABEL_31:
    if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
LABEL_33:
  if (v26 == v25)
  {
    (*(void (**)(void *))(v25[0] + 32))(v25);
  }
  else if (v26)
  {
    (*(void (**)(void *))(*v26 + 40))(v26);
  }
}

- (id)annotationCoordinateTest
{
  if ([(VKMapCanvas *)self _isGlobeActive]) {
    [(VKMapCanvas *)self globeAnnotationCoordinateTest];
  }
  else {
  v3 = [(VKCamera *)self->super._vkCamera._obj annotationCoordinateTest];
  }
  return v3;
}

- (id)globeAnnotationCoordinateTest
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__VKMapCanvas_globeAnnotationCoordinateTest__block_invoke;
  v4[3] = &unk_1E5A930F0;
  v4[4] = self;
  v2 = (void *)[v4 copy];
  return v2;
}

- (id)annotationRectTest
{
  if ([(VKMapCanvas *)self _isGlobeActive]) {
    [(VKMapCanvas *)self globeAnnotationRectTest];
  }
  else {
  v3 = [(VKCamera *)self->super._vkCamera._obj annotationRectTest];
  }
  return v3;
}

- (BOOL)_isGlobeActive
{
  mapEngine = self->super._mapEngine;
  if (!mapEngine) {
    return 0;
  }
  int v3 = *((unsigned __int8 *)mapEngine + 1241);
  uint64_t v4 = (uint64_t *)mapEngine[141];
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  if (!v3) {
    goto LABEL_14;
  }
  uint64_t v7 = v5;
  if (v5 != v6)
  {
    uint64_t v7 = v5;
    while (*(unsigned char *)v7 != 20)
    {
      v7 += 16;
      if (v7 == v6) {
        goto LABEL_14;
      }
    }
  }
  if (v7 == v6
    || ((unsigned int v8 = *(_DWORD *)(v7 + 8), result = 1, v10 = v8 > 0xA, v11 = (1 << v8) & 0x418, !v10)
      ? (BOOL v12 = v11 == 0)
      : (BOOL v12 = 1),
        v12))
  {
LABEL_14:
    if (v5 != v6)
    {
      while (*(unsigned char *)v5 != 22)
      {
        v5 += 16;
        if (v5 == v6) {
          return 0;
        }
      }
      if (v5 != v6) {
        return *(void *)(v5 + 8) != 0;
      }
    }
    return 0;
  }
  return result;
}

- (id)globeAnnotationRectTest
{
  v2 = (void *)[&__block_literal_global_1341 copy];
  return v2;
}

- (void)setForceRasterizationForGlobe:(BOOL)a3
{
  if (LOBYTE(self->_puckAnimator) == a3) {
    return;
  }
  LOBYTE(self->_puckAnimator) = a3;
  double canonicalSkyHeight = self->_canonicalSkyHeight;
  std::mutex::lock((std::mutex *)(*(void *)&canonicalSkyHeight + 232));
  uint64_t v25 = 0;
  v26 = 0;
  uint64_t v27 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v25, *(void *)(*(void *)&canonicalSkyHeight + 160), *(void *)(*(void *)&canonicalSkyHeight + 168), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(void *)(*(void *)&canonicalSkyHeight + 168) - *(void *)(*(void *)&canonicalSkyHeight + 160)) >> 3));
  std::mutex::unlock((std::mutex *)(*(void *)&canonicalSkyHeight + 232));
  uint64_t v5 = v25;
  uint64_t v6 = v26;
  if (v25 != v26)
  {
    uint64_t v7 = v25;
    do
    {
      id v8 = v7[1];
      [v8 setForceRasterizationForGlobe:LOBYTE(self->_puckAnimator)];

      id v9 = v7[1];
      [v9 setNeedsDisplayForReason:2];

      v7 += 3;
    }
    while (v7 != v6);
    if (!v5) {
      goto LABEL_13;
    }
    if (v5 != v6)
    {
      BOOL v10 = (char *)(v6 - 3);
      int v11 = v10;
      BOOL v12 = v10;
      do
      {
        double v13 = *(void (***)(char *))v12;
        v12 -= 24;
        (*v13)(v11);
        v10 -= 24;
        BOOL v14 = v11 == (char *)v5;
        int v11 = v12;
      }
      while (!v14);
    }
    goto LABEL_12;
  }
  if (v25) {
LABEL_12:
  }
    operator delete(v5);
LABEL_13:
  double v15 = self->_canonicalSkyHeight;
  std::mutex::lock((std::mutex *)(*(void *)&v15 + 232));
  uint64_t v25 = 0;
  v26 = 0;
  uint64_t v27 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v25, *(void *)(*(void *)&v15 + 184), *(void *)(*(void *)&v15 + 192), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(*(void *)&v15 + 192) - *(void *)(*(void *)&v15 + 184)) >> 3));
  std::mutex::unlock((std::mutex *)(*(void *)&v15 + 232));
  uint64_t v16 = (char *)v25;
  double v17 = v26;
  if (v25 == v26)
  {
    if (!v25) {
      return;
    }
    goto LABEL_23;
  }
  double v18 = v25;
  do
  {
    id v19 = v18[1];
    [v19 setForceRasterizationForGlobe:LOBYTE(self->_puckAnimator)];

    id v20 = v18[1];
    [v20 setNeedsDisplayForReason:2];

    v18 += 3;
  }
  while (v18 != v17);
  if (v16)
  {
    if (v16 != (char *)v17)
    {
      double v21 = (char *)(v17 - 3);
      double v22 = (char *)(v17 - 3);
      double v23 = (char *)(v17 - 3);
      do
      {
        double v24 = *(void (***)(char *))v23;
        v23 -= 24;
        (*v24)(v22);
        v21 -= 24;
        BOOL v14 = v22 == v16;
        double v22 = v23;
      }
      while (!v14);
    }
LABEL_23:
    operator delete(v16);
  }
}

- (void)updateCameraForFrameResize
{
  [(MDRenderTarget *)self->super._displayTarget size];
  double v4 = v3;
  double v6 = v5;
  double width = self->_lastCanvasSize.width;
  double height = self->_lastCanvasSize.height;
  if (width != v4 || height != v6)
  {
    BOOL v10 = v4 > 0.0;
    if (v6 <= 0.0) {
      BOOL v10 = 0;
    }
    if (width <= 0.0)
    {
      if (!v10) {
        goto LABEL_28;
      }
    }
    else
    {
      if (!v10)
      {
        if (height > 0.0)
        {
          -[VKMapCanvas _zoomLevelForCanvasSize:](self, "_zoomLevelForCanvasSize:");
          p_lastValidCanvasSizeZoomLevel = &self->_lastValidCanvasSizeZoomLevel;
          if (LOBYTE(v33[0].f64[0]))
          {
            int v23 = HIDWORD(v33[0].f64[0]);
            if (!self->_lastValidCanvasSizeZoomLevel._hasValue) {
              p_lastValidCanvasSizeZoomLevel->_hasValue = 1;
            }
            *((_DWORD *)&self->_lastValidCanvasSizeZoomLevel._hasValue + 1) = v23;
          }
          else if (self->_lastValidCanvasSizeZoomLevel._hasValue)
          {
            p_lastValidCanvasSizeZoomLevel->_hasValue = 0;
          }
        }
        goto LABEL_28;
      }
      if (height > 0.0)
      {
        -[VKMapCanvas _zoomLevelForCanvasSize:](self, "_zoomLevelForCanvasSize:");
        if (LOBYTE(v33[0].f64[0]))
        {
          float v11 = *((float *)v33[0].f64 + 1);
LABEL_15:
          [(VKCameraController *)self->super._cameraController beginRegionChange:0];
          float v12 = v4 * 0.001953125;
          float v13 = log2f(v12);
          [(VKCamera *)self->super._vkCamera._obj depthForViewWidth:(double)exp2((float)(v13 - v11))];
          double v15 = v14;
          uint64_t v16 = self->super._vkCamera._obj;
          double v17 = [(VKCamera *)v16 footprint];
          [v17 maxDepth];
          double v19 = v18;

          id v20 = self->super._vkCamera._obj;
          double v21 = v20;
          if (v20) {
            -[VKCamera groundPointFromScreenPoint:](v20, "groundPointFromScreenPoint:", 0.5, 0.5);
          }
          else {
            memset(v33, 0, sizeof(v33));
          }

          if (LOBYTE(v33[0].f64[0]))
          {
            double v24 = self->super._vkCamera._obj;
            uint64_t v25 = [(VKCamera *)v24 position];
            *(double *)&long long v26 = 1.0 - v15 / v19;
            long long v29 = v26;
            double v27 = *(double *)(v25 + 16);
            float64x2_t v28 = *(float64x2_t *)v25;

            float64x2_t v31 = vmlaq_n_f64(v28, vsubq_f64(*(float64x2_t *)((char *)v33 + 8), v28), *(double *)&v29);
            double v32 = v27 + (v33[1].f64[1] - v27) * *(double *)&v29;
            [(VKCamera *)self->super._vkCamera._obj setPosition:&v31];
          }
          [(VKCameraController *)self->super._cameraController updateCameraToPositionOrientationLimits];
          [(VKCameraController *)self->super._cameraController endRegionChange];
          if (!self->_lastValidCanvasSizeZoomLevel._hasValue) {
            self->_lastValidCanvasSizeZoomLevel._hasValue = 1;
          }
          *((float *)&self->_lastValidCanvasSizeZoomLevel._hasValue + 1) = v11;
          goto LABEL_28;
        }
        goto LABEL_28;
      }
    }
    if (self->_lastValidCanvasSizeZoomLevel._hasValue)
    {
      float v11 = *((float *)&self->_lastValidCanvasSizeZoomLevel._hasValue + 1);
      goto LABEL_15;
    }
LABEL_28:
    self->_lastCanvasSize.double width = v4;
    self->_lastCanvasSize.double height = v6;
    v30.receiver = self;
    v30.super_class = (Class)VKMapCanvas;
    [(VKScreenCanvas *)&v30 updateCameraForFrameResize];
    [(VKMapCanvas *)self setCanonicalSkyHeight:*(double *)&self->_horizontalOffsetAnimation];
  }
}

- (void)setCanonicalSkyHeight:(double)a3
{
  *(double *)&self->_horizontalOffsetAnimation = a3;
  [(MDRenderTarget *)self->super._displayTarget size];
  if (v4 > 0.0)
  {
    double v5 = v4;
    horizontalOffsetAnimation = self->_horizontalOffsetAnimation;
    id v8 = [(VKScreenCanvas *)self cameraController];
    uint64_t v7 = [v8 vkCamera];
    [v7 setFractionOfScreenAboveFarClipPlaneAtCanonicalPitch:*(double *)&horizontalOffsetAnimation / v5];
  }
}

- (void)setPuckAnimator:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 688) = 0;
  *((void *)self + 89) = 0;
  *((void *)self + 90) = 0;
  return self;
}

BOOL __44__VKMapCanvas_globeAnnotationCoordinateTest__block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 72);
  double v6 = *(double *)(v5 + 32);
  long double v7 = 6371008.77 / (v6 / cos(*(long double *)(v5 + 40)) + 6371008.77);
  __double2 v8 = __sincos_stret(*(double *)(v5 + 8));
  __double2 v9 = __sincos_stret(a2 * 0.0174532925);
  return v8.__sinval * v9.__sinval + v8.__cosval * v9.__cosval * cos(-(*(double *)(v5 + 16) - a3 * 0.0174532925)) > v7;
}

- (VKMapCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4
{
  v22.receiver = self;
  v22.super_class = (Class)VKMapCanvas;
  double v4 = [(VKScreenCanvas *)&v22 initWithMapEngine:a3 inBackground:a4];
  uint64_t v5 = v4;
  double v6 = v4;
  if (v4)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    v4->_lastCanvasSize = _Q0;
    [(MDRenderTarget *)v4->super._displayTarget size];
    if (v12 > 0.0)
    {
      [(MDRenderTarget *)v6->super._displayTarget size];
      if (v13 > 0.0) {
        [(VKMapCanvas *)v6 updateCameraForFrameResize];
      }
    }
    v6->_horizontalOffsetAnimation = 0;
    uint64_t v14 = *((void *)v6->super._mapEngine + 112);
    p_double canonicalSkyHeight = (VKMapCanvas *)&v5->_canonicalSkyHeight;
    double v17 = *(objc_class **)(v14 + 272);
    uint64_t v16 = *(atomic_ullong **)(v14 + 280);
    if (v16) {
      atomic_fetch_add_explicit(v16 + 1, 1uLL, memory_order_relaxed);
    }
    ptr = (std::__shared_weak_count *)v5->_overlayContainer.__ptr_;
    p_canonicalSkyHeight->super.super.isa = v17;
    p_canonicalSkyHeight->super._mapEngine = v16;
    if (ptr && !atomic_fetch_add(&ptr->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))ptr->__on_zero_shared)(ptr);
      std::__shared_weak_count::__release_weak(ptr);
    }
    double v19 = +[VKDebugSettings sharedSettings];
    [v19 addObserver:v6 forKeyPath:@"preserveModelTile" options:0 context:_PreserveModelTileKVOContext];

    id v20 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_forceRasterizationForGlobe);
  objc_destroyWeak((id *)&self->_consoleFpsUpdateTicker);
  ptr = self->_overlayContainer.__ptr_;
  if (ptr && !atomic_fetch_add((atomic_ullong *volatile)ptr + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(OverlayContainer *))(*(void *)ptr + 16))(ptr);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)ptr);
  }
  objc_storeStrong((id *)&self->_lastValidCanvasSizeZoomLevel._value, 0);
  if (self->_lastValidCanvasSizeZoomLevel._hasValue) {
    self->_lastValidCanvasSizeZoomLevel._hasValue = 0;
  }
}

- (void)setTrafficEnabled:(BOOL)a3
{
  BYTE1(self->_puckAnimator) = a3;
}

- (BOOL)trafficEnabled
{
  return BYTE1(self->_puckAnimator);
}

- (BOOL)forceRasterizationForGlobe
{
  return (BOOL)self->_puckAnimator;
}

- (VKPuckAnimator)puckAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consoleFpsUpdateTicker);
  return (VKPuckAnimator *)WeakRetained;
}

- (double)canonicalSkyHeight
{
  return *(double *)&self->_horizontalOffsetAnimation;
}

- (VKInteractiveMapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forceRasterizationForGlobe);
  return (VKInteractiveMapDelegate *)WeakRetained;
}

- (void)didBecomeInActive
{
  cameraController = self->super._cameraController;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  [(VKCameraController *)cameraController setCamera:&v4];
  double v3 = v5;
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
  long double v7 = ptr;
  __double2 v8 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  [(VKCameraController *)cameraController setCamera:&v7];
  double v6 = (std::__shared_weak_count *)v8;
  if (v8)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)v8 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4
{
  BYTE7(v27[1]) = 16;
  strcpy((char *)v27, "Last Canvas Size");
  CGFloat width = self->_lastCanvasSize.width;
  CGFloat height = self->_lastCanvasSize.height;
  __double2 v8 = (char *)operator new(0x80uLL);
  *((CGFloat *)v8 + 2) = width;
  *((void *)v8 + 4) = 0;
  *((void *)v8 + 5) = 0;
  *((void *)v8 + 6) = 0;
  *((_DWORD *)v8 + 14) = 2;
  *((CGFloat *)v8 + 10) = height;
  *((void *)v8 + 12) = 0;
  __double2 v9 = (void **)(v8 + 96);
  *((void *)v8 + 13) = 0;
  *((void *)v8 + 14) = 0;
  unint64_t v10 = *((void *)a3 + 10);
  unint64_t v11 = *((void *)a3 + 11);
  *((_DWORD *)v8 + 30) = 2;
  if (v10 >= v11)
  {
    double v12 = std::vector<gdc::DebugTreeProperty>::__emplace_back_slow_path<std::string const&,gdc::DebugTreeProperty::VisualizerType>((char **)a3 + 9, (uint64_t)v27, 0);
  }
  else
  {
    *(_OWORD *)unint64_t v10 = v27[0];
    *(void *)(v10 + 16) = *(void *)&v27[1];
    *(_DWORD *)(v10 + 24) = 0;
    *(_OWORD *)(v10 + 32) = 0u;
    *(_OWORD *)(v10 + 48) = 0u;
    *(_OWORD *)(v10 + 64) = 0u;
    double v12 = (char *)(v10 + 80);
  }
  *((void *)a3 + 10) = v12;
  *(_OWORD *)float64x2_t v31 = *(_OWORD *)v8;
  *(_OWORD *)&v31[9] = *(_OWORD *)(v8 + 9);
  if (v8[55] < 0) {
    std::string::__init_copy_ctor_external(&v32, *((const std::string::value_type **)v8 + 4), *((void *)v8 + 5));
  }
  else {
    std::string v32 = *(std::string *)(v8 + 32);
  }
  int v13 = *((_DWORD *)v8 + 14);
  int v33 = v13;
  *(_OWORD *)float64x2_t v28 = *(_OWORD *)v31;
  *(_OWORD *)&v28[9] = *(_OWORD *)&v31[9];
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v29, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
    int v13 = v33;
  }
  else
  {
    std::string v29 = v32;
  }
  int v30 = v13;
  gdc::DebugTreeProperty::addValue((gdc::DebugTreeProperty *)(v12 - 80), (DebugTreeValue *)v28);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_12;
    }
  }
  else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_12;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
LABEL_12:
  *(_OWORD *)float64x2_t v31 = *((_OWORD *)v8 + 4);
  *(_OWORD *)&v31[9] = *(_OWORD *)(v8 + 73);
  if (v8[119] < 0)
  {
    std::string::__init_copy_ctor_external(&v32, *((const std::string::value_type **)v8 + 12), *((void *)v8 + 13));
  }
  else
  {
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = *(_OWORD *)v9;
    v32.__r_.__value_.__r.__words[2] = *((void *)v8 + 14);
  }
  int v14 = *((_DWORD *)v8 + 30);
  int v33 = v14;
  *(_OWORD *)float64x2_t v28 = *(_OWORD *)v31;
  *(_OWORD *)&v28[9] = *(_OWORD *)&v31[9];
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v29, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
    int v14 = v33;
  }
  else
  {
    std::string v29 = v32;
  }
  int v30 = v14;
  gdc::DebugTreeProperty::addValue((gdc::DebugTreeProperty *)(v12 - 80), (DebugTreeValue *)v28);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_22;
    }
  }
  else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_22;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
LABEL_22:
  *(void *)float64x2_t v31 = 1702521171;
  v31[23] = 4;
  unint64_t v15 = *((void *)v12 - 2);
  if (v15 >= *((void *)v12 - 1))
  {
    uint64_t v16 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t)(v12 - 24), (uint64_t)v31);
  }
  else
  {
    *(_OWORD *)unint64_t v15 = *(_OWORD *)v31;
    *(void *)(v15 + 16) = *(void *)&v31[16];
    uint64_t v16 = (std::string *)(v15 + 24);
  }
  *((void *)v12 - 2) = v16;
  if ((v31[23] & 0x80000000) == 0)
  {
    if ((v8[119] & 0x80000000) == 0) {
      goto LABEL_27;
    }
LABEL_34:
    operator delete(*v9);
    if ((v8[55] & 0x80000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_35;
  }
  operator delete(*(void **)v31);
  if (v8[119] < 0) {
    goto LABEL_34;
  }
LABEL_27:
  if ((v8[55] & 0x80000000) == 0) {
    goto LABEL_28;
  }
LABEL_35:
  operator delete(*((void **)v8 + 4));
LABEL_28:
  operator delete(v8);
  if (SBYTE7(v27[1]) < 0) {
    operator delete(*(void **)&v27[0]);
  }
  v31[23] = 11;
  strcpy(v31, "Canvas Zoom");
  [(VKScreenCanvas *)self vkCamera];
  id v17 = *(id *)&v28[8];
  [v17 displayZoomLevel];
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  int v26 = 2;
  uint64_t v22 = v18;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v31, (uint64_t)v21);

  *(void *)float64x2_t v28 = &unk_1EF559F38;
  v31[23] = 15;
  strcpy(v31, "Traffic Enabled");
  int v20 = 0;
  memset(&v19[4], 0, 24);
  v19[0] = [(VKMapCanvas *)self trafficEnabled];
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v31, (uint64_t)v19);
}

- (int64_t)tileSize
{
  return *(void *)(*((void *)self->super._mapEngine + 112) + 312);
}

- (void)setCameraHorizontalOffset:(double)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8 = a5;
  [*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type stop];
  if (a4 <= 0.0 || v8 == 0)
  {
    [(MDRenderTarget *)self->super._displayTarget size];
    double v10 = 0.0;
    if (v11 > 0.0)
    {
      [(MDRenderTarget *)self->super._displayTarget size];
      double v10 = a3 / v12;
    }
    [(VKCamera *)self->super._vkCamera._obj setHorizontalOffset:v10];
    float v13 = v10;
    *((float *)self->super._camera.__ptr_ + 122) = v13;
  }
  else
  {
    objc_initWeak(&location, self);
    int v14 = [[VKTimedAnimation alloc] initWithDuration:a4];
    double type = self->_lastValidCanvasSizeZoomLevel._value.type;
    *(void *)&self->_lastValidCanvasSizeZoomLevel._value.double type = v14;

    [*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type setTimingFunction:VKAnimationCurveLinear];
    uint64_t v16 = self->super._vkCamera._obj;
    [(VKCamera *)v16 horizontalOffset];
    double v18 = v17;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v20 = v19 * v18;

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__VKMapCanvas_setCameraHorizontalOffset_duration_timingFunction___block_invoke;
    v22[3] = &unk_1E5A8C478;
    objc_copyWeak(v24, &location);
    id v23 = v8;
    v24[1] = *(id *)&v20;
    v24[2] = *(id *)&a3;
    [*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type setStepHandler:v22];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__VKMapCanvas_setCameraHorizontalOffset_duration_timingFunction___block_invoke_2;
    void v21[3] = &unk_1E5A93728;
    v21[4] = self;
    [*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type setCompletionHandler:v21];
    [(VKScreenCanvas *)self runAnimation:*(void *)&self->_lastValidCanvasSizeZoomLevel._value.type];

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
}

void __65__VKMapCanvas_setCameraHorizontalOffset_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    float v13 = WeakRetained;
    *(float *)&double v5 = a2;
    [*(id *)(a1 + 32) _solveForInput:v5];
    float v7 = v6;
    double v8 = *(double *)(a1 + 48);
    double v9 = *(double *)(a1 + 56);
    [v13[13] size];
    double v11 = (v8 + (v9 - v8) * v7) / v10;
    [v13[7] setHorizontalOffset:v11];
    id WeakRetained = v13;
    float v12 = v11;
    *((float *)v13[9] + 122) = v12;
  }
}

void __65__VKMapCanvas_setCameraHorizontalOffset_duration_timingFunction___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 696);
  *(void *)(v1 + 696) = 0;
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
    double v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
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
  v19[2] = __111__VKMapCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke;
  v19[3] = &unk_1E5A93150;
  id v18 = v16;
  id v20 = v18;
  int64_t v21 = a4;
  v19[4] = self;
  objc_msgSend(v15, "startWithPounce:startLocation:startCourse:pounceCompletionHandler:", v13, v19, var0, var1, a6);
}

void __111__VKMapCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (a1[6] == 1)
  {
    dispatch_time_t v3 = dispatch_time(0, 4000000000);
    uint64_t v4 = a1[4];
    double v5 = **(NSObject ***)(v4 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__VKMapCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5A960A0;
    block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

void __111__VKMapCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VKPounceDidEndNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (id)markerAtScreenPoint:(CGPoint)a3 enableExtendedFeatureMarkers:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(MDRenderTarget *)self->super._displayTarget size];
  double v9 = v8;
  [(MDRenderTarget *)self->super._displayTarget size];
  double v11 = v10;
  [(MDRenderTarget *)self->super._displayTarget size];
  double v13 = v12;
  [(VKScreenCanvas *)self vkCamera];
  int v14 = v48;
  id v15 = v14;
  if (v14)
  {
    -[atomic_ullong groundPointFromScreenPoint:](v14, "groundPointFromScreenPoint:", x / v9, (-1.0 - y + v11) / v13);
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
  }

  v47 = &unk_1EF559F38;
  if (!(_BYTE)v49)
  {
    uint64_t mapEngine = 0;
    goto LABEL_21;
  }
  uint64_t v16 = *((void *)self->super._mapEngine + 140);
  unint64_t v17 = *(void *)(v16 + 16);
  if ((v17 & (v17 - 1)) != 0)
  {
    unint64_t v20 = 0x20A1ED17D78F322BLL;
    if (v17 <= 0x20A1ED17D78F322BLL) {
      unint64_t v20 = 0x20A1ED17D78F322BLL % v17;
    }
    id v18 = *(void **)(*(void *)(v16 + 8) + 8 * v20);
    do
    {
      do
        id v18 = (void *)*v18;
      while (v18[1] != 0x20A1ED17D78F322BLL);
    }
    while (v18[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    id v18 = *(void **)(*(void *)(v16 + 8) + 8 * ((v17 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        id v18 = (void *)*v18;
      while (v18[1] != 0x20A1ED17D78F322BLL);
    }
    while (v18[2] != 0x20A1ED17D78F322BLL);
  }
  v52.double x = x;
  v52.double y = y;
  md::LabelSettings_Markers::labelMarkerForSelectionAtPoint((md::LabelSettings_Markers *)&v47, v52, *(void *)(*(void *)(*(void *)(v18[5] + 144) + 16) + 24), 0);
  if (!v47)
  {
    unint64_t v23 = *(void *)(v16 + 16);
    if ((v23 & (v23 - 1)) != 0)
    {
      unint64_t v25 = 0x20A1ED17D78F322BLL;
      if (v23 <= 0x20A1ED17D78F322BLL) {
        unint64_t v25 = 0x20A1ED17D78F322BLL % v23;
      }
      uint64_t v24 = *(void **)(*(void *)(v16 + 8) + 8 * v25);
      do
      {
        do
          uint64_t v24 = (void *)*v24;
        while (v24[1] != 0x20A1ED17D78F322BLL);
      }
      while (v24[2] != 0x20A1ED17D78F322BLL);
    }
    else
    {
      uint64_t v24 = *(void **)(*(void *)(v16 + 8) + 8 * ((v23 - 1) & 0x20A1ED17D78F322BLL));
      do
      {
        do
          uint64_t v24 = (void *)*v24;
        while (v24[1] != 0x20A1ED17D78F322BLL);
      }
      while (v24[2] != 0x20A1ED17D78F322BLL);
    }
    uint64_t v26 = *(void *)(*(void *)(*(void *)(v24[5] + 144) + 16) + 24);
    double v27 = *(float *)(v26 + 480);
    *(float *)&unsigned int v28 = x * v27;
    *(float *)&double v27 = *(float *)(v26 + 1508) - y * v27;
    unint64_t v43 = __PAIR64__(LODWORD(v27), v28);
    std::string v29 = *(id *)(v26 + 216);
    dispatch_time_t v30 = dispatch_time(0, 500000000);
    intptr_t v31 = dispatch_semaphore_wait(v29, v30);

    if (v31)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
      }
      std::string v32 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v41) = 0;
        _os_log_impl(&dword_1A1780000, v32, OS_LOG_TYPE_ERROR, "Timeout waiting for bkgd layout to complete for selection", (uint8_t *)&v41, 2u);
      }

      uint64_t v45 = 0;
      v46 = 0;
    }
    else
    {
      (*(void (**)(uint64_t *__return_ptr))(**(void **)(v26 + 240) + 232))(&v45);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v26 + 216));
      if (v45)
      {
        uint64_t mapEngine = +[VKLineMarker markerWithLabelFeatureMarker:&v45];
        v40 = v46;
        if (!v46) {
          goto LABEL_18;
        }
LABEL_58:
        if (!atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
        goto LABEL_18;
      }
    }
    if (!v4
      || (uint64_t mapEngine = (uint64_t)self->super._mapEngine,
          md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(mapEngine + 4536), "-[VKMapCanvas markerAtScreenPoint:enableExtendedFeatureMarkers:]"), uint64_t v33 = *(void *)(mapEngine + 856), v34 = *(unsigned char ***)(v33 + 40), v35 = *(unsigned char ***)(v33 + 48), v34 == v35))
    {
LABEL_56:
      uint64_t mapEngine = 0;
    }
    else
    {
      while (1)
      {
        float64x2_t v36 = *v34;
        if (*v34 && v36[32])
        {
          (*(void (**)(unint64_t *__return_ptr))(*(void *)v36 + 88))(&v43);
          unint64_t v37 = v43;
          if (v43)
          {
            unint64_t v41 = v43;
            v42 = v44;
            if (v44) {
              atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            uint64_t mapEngine = +[VKMarker markerWithFeatureMarker:&v41];
            v38 = v42;
            if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
              std::__shared_weak_count::__release_weak(v38);
            }
          }
          v39 = v44;
          if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
            std::__shared_weak_count::__release_weak(v39);
          }
          if (v37) {
            break;
          }
        }
        if (++v34 == v35) {
          goto LABEL_56;
        }
      }
    }
    v40 = v46;
    if (!v46) {
      goto LABEL_18;
    }
    goto LABEL_58;
  }
  uint64_t mapEngine = +[VKLabelMarker markerWithLabelMarker:&v47];
LABEL_18:
  int64_t v21 = (std::__shared_weak_count *)v48;
  if (v48 && !atomic_fetch_add(v48 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
LABEL_21:
  return (id)mapEngine;
}

- (void)debugHighlightObjectAtPoint:(CGPoint)a3 highlightTarget:(unsigned __int8)a4
{
  if (a4 == 1)
  {
    double y = a3.y;
    double x = a3.x;
    uint64_t mapEngine = (md::HomeQueueScheduler **)self->super._mapEngine;
    md::HomeQueueScheduler::waitForSynchronization(mapEngine[567], "-[VKMapCanvas debugHighlightObjectAtPoint:highlightTarget:]");
    uint64_t v7 = *((void *)mapEngine[107] + 5);
    if ((unint64_t)(*((void *)mapEngine[107] + 6) - v7) >= 0xA0) {
      double v8 = *(void **)(v7 + 152);
    }
    else {
      double v8 = 0;
    }
    if (*(unsigned char *)(v8[47] + 296))
    {
      [*(id *)(v8[5] + 104) contentScale];
      double v10 = v9;
      uint64_t v11 = *(void *)(v8[5] + 96);
      double v12 = *(unsigned __int8 **)(v11 + 1064);
      double v13 = *(std::__shared_weak_count **)(v11 + 1072);
      if (v13)
      {
        atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
        int v14 = *v12;
        if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      else
      {
        int v14 = *v12;
      }
      float v15 = *(float *)(v8[47] + 292);
      v105 = 0;
      v106 = 0;
      uint64_t v16 = (uint64_t *)v8[34];
      unint64_t v17 = (uint64_t *)v8[35];
      if (v16 != v17)
      {
        float v18 = v10;
        float v19 = x;
        float v20 = v19 * v18;
        float v21 = y;
        float v22 = v15 - (float)(v21 * v18);
        float v23 = v18 * 22.0;
        BOOL v24 = (v14 - 4) < 0xFFFFFFFD;
        float v25 = 3.4028e38;
        v96 = (uint64_t *)v8[35];
        v97 = v8;
        BOOL v95 = v24;
        while (1)
        {
          uint64_t v26 = *v16;
          uint64_t v27 = *(void *)(*v16 + 384);
          uint64_t v28 = v8[47] + 160;
          v107[0] = v27;
          v107[1] = v28;
          BOOL v108 = v24;
          __p = 0;
          v110 = 0;
          uint64_t v111 = 0;
          v113 = 0;
          uint64_t v114 = 0;
          uint64_t v115 = 0;
          md::HighlightHelper::tileToMercatorPoints(v27, (uint64_t)&md::HighlightHelper::hitTestTile(gm::Matrix<float,2,1>,float)const::tileCorners, 4, (uint64_t)&v113);
          md::HighlightHelper::mercatorToScreenPoints((uint64_t)v107, (double **)&v113, (uint64_t)&__p);
          if (v113) {
            operator delete(v113);
          }
          v29.i64[0] = *(void *)__p;
          v30.i64[0] = *((void *)__p + 1);
          v29.i64[1] = *(void *)__p;
          v31.i64[0] = v30.i64[0];
          v31.i64[1] = v30.i64[0];
          v32.i64[0] = *((void *)__p + 2);
          v33.i64[0] = *((void *)__p + 3);
          v34.i64[0] = v32.i64[0];
          v34.i64[1] = v32.i64[0];
          v35.i64[0] = v33.i64[0];
          v35.i64[1] = v33.i64[0];
          v36.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_1A28FC750, v29)).u32[0];
          v36.i32[1] = vmovn_s32(vcgtq_f32(v29, (float32x4_t)xmmword_1A28FC750)).i32[1];
          int8x16_t v37 = vbslq_s8((int8x16_t)vmovl_s16(v36), (int8x16_t)v29, (int8x16_t)xmmword_1A28FC750);
          v38.i64[0] = v37.i64[0];
          v38.i64[1] = v30.i64[0];
          v30.i64[1] = vextq_s8(v37, v37, 8uLL).u64[0];
          int8x16_t v39 = vbslq_s8((int8x16_t)vcgtq_f32(v38, v30), v31, v37);
          v30.i64[0] = v39.i64[0];
          v30.i64[1] = v32.i64[0];
          v32.i64[1] = vextq_s8(v39, v39, 8uLL).u64[0];
          int8x16_t v40 = vbslq_s8((int8x16_t)vcgtq_f32(v30, v32), v34, v39);
          v31.i64[0] = v40.i64[0];
          v31.i64[1] = v33.i64[0];
          v33.i64[1] = vextq_s8(v40, v40, 8uLL).u64[0];
          int8x16_t v41 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)v31, v33), v35, v40);
          BOOL v42 = *(float *)&v41.i32[2] < *(float *)v41.i32 || *(float *)&v41.i32[3] < *(float *)&v41.i32[1];
          if (v42
            || v23 == 0.0
            || ((*(float *)v41.i32 = fmaxf(v20 - *(float *)&v41.i32[2], *(float *)v41.i32 - v20),
                 float v43 = fmaxf(v22 - *(float *)&v41.i32[3], *(float *)&v41.i32[1] - v22),
                 *(float *)v41.i32 < v23)
              ? (BOOL v44 = v43 < v23)
              : (BOOL v44 = 0),
                !v44))
          {
            operator delete(__p);
            goto LABEL_14;
          }
          if (*(float *)v41.i32 <= 0.0 || v43 <= 0.0) {
            break;
          }
          float v45 = (float)(*(float *)v41.i32 * *(float *)v41.i32) + (float)(v43 * v43);
          operator delete(__p);
          if (v45 < (float)(v23 * v23)) {
            goto LABEL_32;
          }
LABEL_14:
          if (++v16 == v17) {
            goto LABEL_135;
          }
        }
        operator delete(__p);
LABEL_32:
        v98 = v16;
        uint64_t v99 = v27;
        uint64_t v102 = v26 + 384;
        uint64_t v46 = *(void *)(v27 + 888);
        uint64_t v104 = *(void *)(v27 + 896);
        if (v46 != v104)
        {
          v103 = 0;
          v47 = 0;
          uint64_t v48 = 0;
          float v49 = 3.4028e38;
          while (1)
          {
            uint64_t v53 = *(void *)v46;
            if (!*(_DWORD *)(*(void *)v46 + 20)) {
              goto LABEL_34;
            }
            unint64_t v54 = 0;
            char v55 = 0;
            uint64_t v56 = v107[0];
            float v51 = v23 * v23;
            do
            {
              uint64_t v112 = 0;
              uint64_t v57 = geo::codec::transitLinkPoints(v53, v54, &v112);
              if (v112)
              {
                __p = 0;
                v110 = 0;
                uint64_t v111 = 0;
                v113 = 0;
                uint64_t v114 = 0;
                uint64_t v115 = 0;
                md::HighlightHelper::tileToMercatorPoints(v56, v57, v112, (uint64_t)&v113);
                md::HighlightHelper::mercatorToScreenPoints((uint64_t)v107, (double **)&v113, (uint64_t)&__p);
                if (v113) {
                  operator delete(v113);
                }
                LODWORD(v113) = 2139095039;
                v60 = __p;
                *(float *)&double v58 = v20;
                *(float *)&double v59 = v22;
                int v61 = md::HighlightHelper::hitTest((float *)__p, v110, (float *)&v113, v58, v59, v51);
                if (v61) {
                  float v51 = *(float *)&v113;
                }
                if (v60) {
                  operator delete(v60);
                }
                v55 |= v61;
              }
              ++v54;
              uint64_t v53 = *(void *)v46;
            }
            while (v54 < *(unsigned int *)(*(void *)v46 + 20));
            if ((v55 & 1) == 0) {
              goto LABEL_34;
            }
            uint64_t v63 = *(void *)(v46 + 56);
            uint64_t v62 = *(void *)(v46 + 64);
            if (v63 == v62) {
              break;
            }
            unsigned int v100 = v48;
            v101 = v47;
            uint64_t v64 = 0;
            int v65 = 0;
            float v66 = v23 * v23;
            do
            {
              uint64_t v67 = *(void *)(v63 + 24);
              if (v67 && *(unsigned char *)(v67 + 82))
              {
                __p = 0;
                v110 = 0;
                uint64_t v111 = 0;
                v113 = 0;
                uint64_t v114 = 0;
                uint64_t v115 = 0;
                md::HighlightHelper::tileToMercatorPoints(v56, v67 + 16, 1, (uint64_t)&v113);
                md::HighlightHelper::mercatorToScreenPoints((uint64_t)v107, (double **)&v113, (uint64_t)&__p);
                if (v113) {
                  operator delete(v113);
                }
                LODWORD(v113) = 2139095039;
                v70 = __p;
                *(float *)&double v68 = v20;
                *(float *)&double v69 = v22;
                int v71 = md::HighlightHelper::hitTest((float *)__p, v110, (float *)&v113, v68, v69, v66);
                if (v71)
                {
                  uint64_t v64 = v67;
                  float v66 = *(float *)&v113;
                }
                if (v70) {
                  operator delete(v70);
                }
                v65 |= v71;
              }
              uint64_t v72 = *(void *)(v63 + 64);
              if (v72 && *(unsigned char *)(v72 + 82))
              {
                __p = 0;
                v110 = 0;
                uint64_t v111 = 0;
                v113 = 0;
                uint64_t v114 = 0;
                uint64_t v115 = 0;
                md::HighlightHelper::tileToMercatorPoints(v56, v72 + 16, 1, (uint64_t)&v113);
                md::HighlightHelper::mercatorToScreenPoints((uint64_t)v107, (double **)&v113, (uint64_t)&__p);
                if (v113) {
                  operator delete(v113);
                }
                LODWORD(v113) = 2139095039;
                v75 = __p;
                *(float *)&double v73 = v20;
                *(float *)&double v74 = v22;
                int v76 = md::HighlightHelper::hitTest((float *)__p, v110, (float *)&v113, v73, v74, v66);
                if (v76)
                {
                  uint64_t v64 = v72;
                  float v66 = *(float *)&v113;
                }
                if (v75) {
                  operator delete(v75);
                }
                v65 |= v76;
              }
              v63 += 96;
            }
            while (v63 != v62);
            BOOL v77 = *(unsigned char *)(v46 + 244) == 0;
            if ((v65 & 1) == 0)
            {
              v47 = v101;
              uint64_t v48 = v100;
LABEL_82:
              if (v77) {
                uint64_t v52 = 3;
              }
              else {
                uint64_t v52 = 2;
              }
              if (v52 > v48
                || (v52 == v48 ? (BOOL v79 = v51 < v49) : (BOOL v79 = 0), v79))
              {
                long long v50 = (std::__shared_weak_count *)operator new(0x30uLL);
                v50->__shared_owners_ = 0;
                v50->__shared_weak_owners_ = 0;
                v50->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF581398;
                v103 = v50 + 1;
                v50[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF5408A8;
                v50[1].__shared_owners_ = v102;
                v50[1].__shared_weak_owners_ = v46;
                if (!v47 || atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
                  goto LABEL_35;
                }
LABEL_96:
                ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
                std::__shared_weak_count::__release_weak(v47);
                goto LABEL_35;
              }
LABEL_34:
              long long v50 = v47;
              float v51 = v49;
              uint64_t v52 = v48;
              goto LABEL_35;
            }
            if (*(unsigned char *)(v46 + 244)) {
              uint64_t v52 = 5;
            }
            else {
              uint64_t v52 = 4;
            }
            if (v52 <= v100
              && (v52 == v100 ? (BOOL v78 = v49 <= 3.4028e38) : (BOOL v78 = 1), v78))
            {
              long long v50 = v101;
              float v51 = v49;
              uint64_t v52 = v100;
            }
            else
            {
              v47 = v101;
              long long v50 = (std::__shared_weak_count *)operator new(0x30uLL);
              v50->__shared_owners_ = 0;
              v50->__shared_weak_owners_ = 0;
              v50->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF5813D0;
              v103 = v50 + 1;
              v50[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF5408E8;
              v50[1].__shared_owners_ = v102;
              v50[1].__shared_weak_owners_ = v64;
              if (!v101)
              {
                float v51 = 3.4028e38;
                goto LABEL_35;
              }
              float v51 = 3.4028e38;
              if (!atomic_fetch_add(&v101->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
                goto LABEL_96;
              }
            }
LABEL_35:
            v46 += 248;
            v47 = v50;
            uint64_t v48 = v52;
            float v49 = v51;
            if (v46 == v104) {
              goto LABEL_99;
            }
          }
          BOOL v77 = *(unsigned char *)(v46 + 244) == 0;
          goto LABEL_82;
        }
        v103 = 0;
        long long v50 = 0;
        LOBYTE(v52) = 0;
        float v51 = 3.4028e38;
LABEL_99:
        uint64_t v80 = *(void *)(v99 + 920);
        if (v80 == v99 + 912)
        {
LABEL_100:
          if (v103)
          {
            BOOL v24 = v95;
            if ((float)-v52 < v25)
            {
              if (v50) {
                atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              v81 = v106;
              v105 = v103;
              v106 = v50;
              if (v81 && !atomic_fetch_add(&v81->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
                std::__shared_weak_count::__release_weak(v81);
              }
              float v25 = (float)-v52;
            }
          }
          else
          {
            BOOL v24 = v95;
          }
          if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
            std::__shared_weak_count::__release_weak(v50);
          }
          double v8 = v97;
          uint64_t v16 = v98;
          unint64_t v17 = v96;
          goto LABEL_14;
        }
        while (1)
        {
          uint64_t v83 = v80 + 16;
          v82 = *(void **)(v80 + 16);
          if (!v82[11]) {
            goto LABEL_109;
          }
          char v84 = 0;
          unint64_t v85 = 0;
          uint64_t v86 = v107[0];
          float v87 = v23 * v23;
          do
          {
            uint64_t v112 = 0;
            uint64_t Points = geo::codec::pBTransitStationTransferGetPoints(v82, v85, &v112);
            if (Points && v112)
            {
              __p = 0;
              v110 = 0;
              uint64_t v111 = 0;
              v113 = 0;
              uint64_t v114 = 0;
              uint64_t v115 = 0;
              md::HighlightHelper::tileToMercatorPoints(v86, Points, v112, (uint64_t)&v113);
              md::HighlightHelper::mercatorToScreenPoints((uint64_t)v107, (double **)&v113, (uint64_t)&__p);
              if (v113) {
                operator delete(v113);
              }
              LODWORD(v113) = 2139095039;
              v91 = __p;
              *(float *)&double v89 = v20;
              *(float *)&double v90 = v22;
              int v92 = md::HighlightHelper::hitTest((float *)__p, v110, (float *)&v113, v89, v90, v87);
              if (v92) {
                float v87 = *(float *)&v113;
              }
              if (v91) {
                operator delete(v91);
              }
              v84 |= v92;
            }
            ++v85;
            v82 = *(void **)v83;
          }
          while (v85 < *(void *)(*(void *)v83 + 88));
          if ((v84 & 1) == 0) {
            goto LABEL_109;
          }
          if (!(_BYTE)v52) {
            break;
          }
          if (v52 == 1)
          {
            if (v87 < v51) {
              break;
            }
            LOBYTE(v52) = 1;
          }
LABEL_109:
          uint64_t v80 = *(void *)(v80 + 8);
          if (v80 == v99 + 912) {
            goto LABEL_100;
          }
        }
        v93 = (std::__shared_weak_count *)operator new(0x30uLL);
        v93->__shared_owners_ = 0;
        v93->__shared_weak_owners_ = 0;
        v93->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF581408;
        v93[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF540928;
        v93[1].__shared_owners_ = v102;
        v93[1].__shared_weak_owners_ = v83;
        v103 = v93 + 1;
        if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
          std::__shared_weak_count::__release_weak(v50);
        }
        LOBYTE(v52) = 1;
        long long v50 = v93;
        float v51 = v87;
        goto LABEL_109;
      }
    }
    else
    {
      v105 = 0;
      v106 = 0;
    }
LABEL_135:
    md::TransitRenderLayer::setDebugHighlightedItem((uint64_t)v8, &v105);
    v94 = v106;
    if (v106)
    {
      if (!atomic_fetch_add(&v106->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
        std::__shared_weak_count::__release_weak(v94);
      }
    }
  }
}

- (void)goToTileX:(int)a3 Y:(int)a4 Z:(int)a5 tileSize:(int)a6
{
  double v11 = (double)(1 << a5);
  [(MDRenderTarget *)self->super._displayTarget size];
  double v13 = v12;
  double v14 = 1.0 / v11 * 0.5;
  v19[0] = v14 + (double)a3 * (1.0 / v11);
  v19[1] = v14 + (-1.0 - (double)a4 + v11) * (1.0 / v11);
  [(VKCamera *)self->super._vkCamera._obj tanHalfHorizFOV];
  double v16 = v15;
  float v17 = log2(v13 / (double)a6);
  v19[2] = 0.5 / (v16 * exp2((float)((float)a5 - v17)));
  memset(v18, 0, 24);
  v18[3] = 0x3FF0000000000000;
  [(VKCamera *)self->super._vkCamera._obj setOrientation:v18];
  [(VKCamera *)self->super._vkCamera._obj setPosition:v19];
}

- (BOOL)isPointValidForGesturing:(CGPoint)a3
{
  -[VKMapCanvas convertPointToCoordinate:](self, "convertPointToCoordinate:", a3.x, a3.y);
  BOOL v5 = v4 <= 90.0;
  if (v4 < -90.0) {
    BOOL v5 = 0;
  }
  if (v3 > 180.0) {
    BOOL v5 = 0;
  }
  return v3 >= -180.0 && v5;
}

- (NSArray)overlays
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double canonicalSkyHeight = self->_canonicalSkyHeight;
  std::mutex::lock((std::mutex *)(*(void *)&canonicalSkyHeight + 232));
  BOOL v24 = 0;
  float v25 = 0;
  uint64_t v26 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v24, *(void *)(*(void *)&canonicalSkyHeight + 160), *(void *)(*(void *)&canonicalSkyHeight + 168), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(void *)(*(void *)&canonicalSkyHeight + 168) - *(void *)(*(void *)&canonicalSkyHeight + 160)) >> 3));
  std::mutex::unlock((std::mutex *)(*(void *)&canonicalSkyHeight + 232));
  BOOL v5 = v24;
  float v6 = v25;
  if (v24 == v25)
  {
    if (!v24) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v7 = v24;
  do
  {
    id v8 = v7[1];
    [v3 addObject:v8];

    v7 += 3;
  }
  while (v7 != v6);
  if (v5)
  {
    if (v5 != v6)
    {
      double v9 = (char *)(v6 - 3);
      double v10 = v9;
      double v11 = v9;
      do
      {
        double v12 = *(void (***)(char *))v11;
        v11 -= 24;
        (*v12)(v10);
        v9 -= 24;
        BOOL v13 = v10 == (char *)v5;
        double v10 = v11;
      }
      while (!v13);
    }
LABEL_11:
    operator delete(v5);
  }
LABEL_12:
  double v14 = self->_canonicalSkyHeight;
  std::mutex::lock((std::mutex *)(*(void *)&v14 + 232));
  BOOL v24 = 0;
  float v25 = 0;
  uint64_t v26 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v24, *(void *)(*(void *)&v14 + 184), *(void *)(*(void *)&v14 + 192), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(*(void *)&v14 + 192) - *(void *)(*(void *)&v14 + 184)) >> 3));
  std::mutex::unlock((std::mutex *)(*(void *)&v14 + 232));
  double v15 = v24;
  double v16 = v25;
  if (v24 == v25)
  {
    if (!v24) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  float v17 = v24;
  do
  {
    id v18 = v17[1];
    [v3 addObject:v18];

    v17 += 3;
  }
  while (v17 != v16);
  if (v15)
  {
    if (v15 != v16)
    {
      float v19 = (char *)(v16 - 3);
      float v20 = v19;
      float v21 = v19;
      do
      {
        float v22 = *(void (***)(char *))v21;
        v21 -= 24;
        (*v22)(v20);
        v19 -= 24;
        BOOL v13 = v20 == (char *)v15;
        float v20 = v21;
      }
      while (!v13);
    }
LABEL_22:
    operator delete(v15);
  }
LABEL_23:
  return (NSArray *)v3;
}

- (void)insertOverlay:(id)a3 belowOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)&self->_canonicalSkyHeight;
  id v9 = v6;
  id v10 = v7;
  id v18 = v10;
  std::mutex::lock((std::mutex *)(v8 + 232));
  uint64_t v11 = v8 + 24 * [v9 level];
  double v12 = *(id **)(v11 + 160);
  BOOL v13 = *(id **)(v11 + 168);
  if (v12 != v13)
  {
    while ((geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(v12[1], &v18) & 1) == 0)
    {
      v12 += 3;
      if (v12 == v13)
      {
        double v12 = v13;
        break;
      }
    }
  }
  md::OverlayContainer::_insertOverlay(v8, v9, v12);
  std::mutex::unlock((std::mutex *)(v8 + 232));

  ptr = self->_overlayContainer.__ptr_;
  double canonicalSkyHeight = self->_canonicalSkyHeight;
  float v17 = (std::__shared_weak_count *)ptr;
  if (ptr) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)ptr + 2, 1uLL, memory_order_relaxed);
  }
  [v9 setStandardContainer:&canonicalSkyHeight];
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
  [v9 setRunLoopController:self->super._runLoopController];
  [v9 setForceRasterizationForGlobe:LOBYTE(self->_puckAnimator)];
  [(VKMapCanvas *)self updateOverlays];
  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    LOBYTE(v18) = 1;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v18);
  }
}

- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)&self->_canonicalSkyHeight;
  id v9 = v6;
  id v10 = v7;
  float v22 = v10;
  std::mutex::lock((std::mutex *)(v8 + 232));
  uint64_t v11 = v8 + 24 * [v9 level];
  double v14 = *(id **)(v11 + 168);
  double v12 = (id **)(v11 + 168);
  BOOL v13 = v14;
  double v15 = *(v12 - 1);
  if (v15 == v14)
  {
    double v16 = *(v12 - 1);
  }
  else
  {
    while ((geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(v15[1], &v22) & 1) == 0)
    {
      v15 += 3;
      if (v15 == v13)
      {
        double v15 = v13;
        break;
      }
    }
    double v16 = v15;
    double v15 = *v12;
  }
  if (v16 == v15) {
    float v17 = v15;
  }
  else {
    float v17 = v16 + 3;
  }
  md::OverlayContainer::_insertOverlay(v8, v9, v17);
  std::mutex::unlock((std::mutex *)(v8 + 232));

  ptr = self->_overlayContainer.__ptr_;
  double canonicalSkyHeight = self->_canonicalSkyHeight;
  float v21 = (std::__shared_weak_count *)ptr;
  if (ptr) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)ptr + 2, 1uLL, memory_order_relaxed);
  }
  [v9 setStandardContainer:&canonicalSkyHeight];
  if (v21) {
    std::__shared_weak_count::__release_weak(v21);
  }
  [v9 setRunLoopController:self->super._runLoopController];
  [v9 setForceRasterizationForGlobe:LOBYTE(self->_puckAnimator)];
  [(VKMapCanvas *)self updateOverlays];
  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    LOBYTE(v22) = 1;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v22);
  }
}

- (void)removeOverlay:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(void *)&self->_canonicalSkyHeight;
  id v6 = v4;
  std::mutex::lock((std::mutex *)(v5 + 232));
  unint64_t v7 = objc_msgSend(v6, "level", v6);
  unint64_t v8 = v5 + 24 * v7;
  uint64_t v10 = *(void *)(v8 + 160);
  v8 += 160;
  uint64_t v9 = v10;
  uint64_t v13 = *(void *)(v8 + 8);
  uint64_t v11 = (void *)(v8 + 8);
  uint64_t v12 = v13;
  if (v9 != v13)
  {
    while ((geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*(void **)(v9 + 8), &v48) & 1) == 0)
    {
      v9 += 24;
      if (v9 == v12)
      {
        uint64_t v9 = v12;
        break;
      }
    }
    double v14 = (void (***)(void))v9;
    double v15 = (void (***)(void))*v11;
    if (v14 != (void (***)(void))*v11)
    {
      double v16 = v14 + 3;
      if (v14 + 3 != v15)
      {
        do
        {
          double v14 = v16;
          float v17 = (void **)(v16 + 1);
          objc_storeStrong((id *)v16 - 2, v16[1]);
          id v18 = *v17;
          *float v17 = 0;

          double v16 = v14 + 3;
        }
        while (v14 + 3 != v15);
        double v15 = (void (***)(void))*v11;
      }
      if (v15 != v14)
      {
        float v19 = v15 - 3;
        float v20 = v19;
        float v21 = v19;
        do
        {
          float v22 = *v21;
          v21 -= 3;
          (*v22)(v20);
          v19 -= 3;
          BOOL v23 = v20 == v14;
          float v20 = v21;
        }
        while (!v23);
      }
      void *v11 = v14;
    }
  }
  uint64_t v24 = *(void *)(v5 + 208);
  uint64_t v25 = *(void *)(v5 + 216);
  if (v24 != v25)
  {
    while ((geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*(void **)(v24 + 8), &v48) & 1) == 0)
    {
      v24 += 24;
      if (v24 == v25)
      {
        uint64_t v24 = v25;
        break;
      }
    }
    uint64_t v26 = (void (***)(void))v24;
    uint64_t v27 = *(void (****)(void))(v5 + 216);
    if (v26 != v27)
    {
      uint64_t v28 = v26 + 3;
      if (v26 + 3 != v27)
      {
        do
        {
          uint64_t v26 = v28;
          float32x4_t v29 = (void **)(v28 + 1);
          objc_storeStrong((id *)v28 - 2, v28[1]);
          float32x4_t v30 = *v29;
          *float32x4_t v29 = 0;

          uint64_t v28 = v26 + 3;
        }
        while (v26 + 3 != v27);
        uint64_t v27 = *(void (****)(void))(v5 + 216);
      }
      if (v27 != v26)
      {
        int8x16_t v31 = v27 - 3;
        float32x4_t v32 = v31;
        float32x4_t v33 = v31;
        do
        {
          int8x16_t v34 = *v33;
          v33 -= 3;
          (*v34)(v32);
          v31 -= 3;
          BOOL v23 = v32 == v26;
          float32x4_t v32 = v33;
        }
        while (!v23);
      }
      *(void *)(v5 + 216) = v26;
      *(unsigned char *)(v5 + 344) = v26 != *(void (****)(void))(v5 + 208);
    }
  }
  unsigned int v35 = [v6 areResourcesRequired];
  if (v7 <= 1)
  {
    uint64_t v36 = *(void *)(v5 + 16 * v7 + 8 * v35);
    if (v36)
    {
      id v37 = v6;
      if ([v37 canProvideVectorData])
      {
        char v38 = 2;
      }
      else
      {
        int8x16_t v39 = [v37 rasterTileProvider];

        if (v39)
        {
          char v38 = 3;
        }
        else
        {
          int8x16_t v40 = [v37 customTileProvider];

          if (v40) {
            char v38 = 4;
          }
          else {
            char v38 = 1;
          }
        }
      }

      int v41 = [v37 identifier];
      BOOL v42 = [v37 rasterTileProvider];
      if (v42)
      {
        BOOL v43 = 0;
      }
      else
      {
        BOOL v44 = [v37 customTileProvider];
        BOOL v43 = v44 == 0;
      }
      float v51 = 0;
      float v45 = operator new(0x30uLL);
      *float v45 = &unk_1EF5722B8;
      v45[1] = v5;
      *((_DWORD *)v45 + 4) = v41;
      v45[3] = v36;
      *((unsigned char *)v45 + 32) = v43;
      *((unsigned char *)v45 + 33) = v38;
      v45[5] = v7;
      float v51 = v45;
      md::OverlayContainer::queueCommand(v5, 1, &v49);
      if (v51 == &v49)
      {
        (*(void (**)(uint64_t *))(v49 + 32))(&v49);
      }
      else if (v51)
      {
        (*(void (**)(void))(*v51 + 40))();
      }
    }
  }
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__erase_unique<unsigned int>((void *)(v5 + 296), [v6 identifier]);
  *(unsigned char *)(v5 + 345) = 1;
  ++*(_DWORD *)(v5 + 348);
  std::mutex::unlock((std::mutex *)(v5 + 232));

  if (v6)
  {
    [v6 standardContainer];
    uint64_t v46 = v50;
    uint64_t v49 = 0;
    long long v50 = 0;
    if (v46)
    {
      std::__shared_weak_count::__release_weak(v46);
      if (v50) {
        std::__shared_weak_count::__release_weak(v50);
      }
    }
  }
  [v6 setRunLoopController:0];
  [(VKMapCanvas *)self updateOverlays];
  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    LOBYTE(v49) = 1;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v49);
  }
}

- (void)addOverlay:(id)a3
{
  id v4 = (VKOverlay *)a3;
  md::OverlayContainer::addOverlay(*(md::OverlayContainer **)&self->_canonicalSkyHeight, v4);
  ptr = self->_overlayContainer.__ptr_;
  double canonicalSkyHeight = self->_canonicalSkyHeight;
  unint64_t v8 = (std::__shared_weak_count *)ptr;
  if (ptr) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)ptr + 2, 1uLL, memory_order_relaxed);
  }
  [(VKOverlay *)v4 setStandardContainer:&canonicalSkyHeight];
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  [(VKOverlay *)v4 setRunLoopController:self->super._runLoopController];
  [(VKOverlay *)v4 setForceRasterizationForGlobe:LOBYTE(self->_puckAnimator)];
  [(VKMapCanvas *)self updateOverlays];
  double var0 = self->super._runLoopController->var0;
  if (var0)
  {
    char v9 = 1;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v9);
  }
}

- (void)updateOverlays
{
  __p = 0;
  float v19 = 0;
  uint64_t v20 = 0;
  md::OverlayContainer::computeTileExclusionAreas(*(void **)&self->_canonicalSkyHeight, &__p);
  id v3 = *(int8x8_t **)([(VKScreenCanvas *)self mapEngine] + 1120);
  int8x8_t v4 = v3[2];
  if (!*(void *)&v4) {
    goto LABEL_21;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v6 = 0x87BA2765F9E38E05;
    if (*(void *)&v4 <= 0x87BA2765F9E38E05) {
      unint64_t v6 = 0x87BA2765F9E38E05 % *(void *)&v4;
    }
  }
  else
  {
    unint64_t v6 = (*(void *)&v4 - 1) & 0x87BA2765F9E38E05;
  }
  unint64_t v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
  if (!v7 || (unint64_t v8 = (void *)*v7) == 0)
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
      if (v11 == 0x87BA2765F9E38E05)
      {
        if (v8[2] == 0x87BA2765F9E38E05) {
          goto LABEL_37;
        }
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_21;
      }
      unint64_t v8 = (void *)*v8;
      if (!v8) {
        goto LABEL_21;
      }
    }
  }
  while (1)
  {
    unint64_t v10 = v8[1];
    if (v10 == 0x87BA2765F9E38E05) {
      break;
    }
    if (v10 >= *(void *)&v4) {
      v10 %= *(void *)&v4;
    }
    if (v10 != v6) {
      goto LABEL_21;
    }
LABEL_11:
    unint64_t v8 = (void *)*v8;
    if (!v8) {
      goto LABEL_21;
    }
  }
  if (v8[2] != 0x87BA2765F9E38E05) {
    goto LABEL_11;
  }
LABEL_37:
  uint64_t v12 = v8[5];
LABEL_22:
  std::vector<md::TileExclusionArea>::__assign_with_size[abi:nn180100]<md::TileExclusionArea*,md::TileExclusionArea*>((void *)(v12 + 144), (char *)__p, v19, (v19 - (unsigned char *)__p) >> 6);
  uint64_t v13 = *(void *)([(VKScreenCanvas *)self mapEngine] + 1120);
  unint64_t v14 = *(void *)(v13 + 16);
  if ((v14 & (v14 - 1)) != 0)
  {
    unint64_t v16 = 0x87668FB4D087F775;
    if (v14 <= 0x87668FB4D087F775) {
      unint64_t v16 = 0x87668FB4D087F775 % v14;
    }
    double v15 = *(void **)(*(void *)(v13 + 8) + 8 * v16);
    do
    {
      do
        double v15 = (void *)*v15;
      while (v15[1] != 0x87668FB4D087F775);
    }
    while (v15[2] != 0x87668FB4D087F775);
  }
  else
  {
    double v15 = *(void **)(*(void *)(v13 + 8) + 8 * ((v14 - 1) & 0x87668FB4D087F775));
    do
    {
      do
        double v15 = (void *)*v15;
      while (v15[1] != 0x87668FB4D087F775);
    }
    while (v15[2] != 0x87668FB4D087F775);
  }
  *(unsigned char *)(v15[5] + 923) = 1;
  float v17 = __p;
  if (__p)
  {
    operator delete(v17);
  }
}

- (CGPoint)convertMapPointToPoint:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(VKCameraController *)self->super._cameraController usesVKCamera])
  {
    double v6 = *MEMORY[0x1E4F63F10];
    double v7 = *(double *)(MEMORY[0x1E4F63F10] + 8);
    unint64_t v8 = [(VKCamera *)self->super._vkCamera._obj scaledViewProjectionMatrix];
    double v9 = 1.0 - var1 / v7;
    double v10 = v8[13] + v8[1] * (var0 / v6) + v8[5] * v9;
    double v11 = 0.5 / (v8[15] + v8[3] * (var0 / v6) + v8[7] * v9);
    double v12 = v11 * (v8[12] + *v8 * (var0 / v6) + v8[4] * v9) + 0.5;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v14 = v12 * v13;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v16 = (0.5 - v11 * v10) * v15;
  }
  else
  {
    [(MDRenderTarget *)self->super._displayTarget size];
    double v18 = v17;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v20 = v19 * v18;
    double v14 = 0.0;
    double v16 = 0.0;
    if (v20 > 0.0)
    {
      long double v21 = var0 * 6.28318531 / *MEMORY[0x1E4F63F10];
      long double v22 = exp(3.14159265 - var1 * 6.28318531 / *(double *)(MEMORY[0x1E4F63F10] + 8));
      long double v23 = atan(v22) * 2.0 + -1.57079633;
      long double v24 = fmod(v21, 6.28318531);
      v35[0] = v23;
      v35[1] = fmod(v24 + 6.28318531, 6.28318531) + -3.14159265;
      v35[2] = 0.0;
      uint64_t v25 = *(void *)([(VKScreenCanvas *)self mapEngine] + 904);
      uint64_t v26 = [(VKScreenCanvas *)self mapEngine];
      uint64_t v27 = v26[133];
      uint64_t v28 = (std::__shared_weak_count *)v26[134];
      if (v28)
      {
        atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v25 + 16), v35, (uint64_t *)(v27 + 8));
        double v14 = v29;
        double v16 = v30;
        if (!atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      else
      {
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v25 + 16), v35, (uint64_t *)(v27 + 8));
        double v14 = v31;
        double v16 = v32;
      }
    }
  }
  double v33 = v14;
  double v34 = v16;
  result.double y = v34;
  result.double x = v33;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinate:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v4 = [(VKCameraController *)self->super._cameraController usesVKCamera];
  [(MDRenderTarget *)self->super._displayTarget size];
  if (v4)
  {
    if (v5 <= 0.0) {
      goto LABEL_20;
    }
    [(MDRenderTarget *)self->super._displayTarget size];
    if (v6 <= 0.0) {
      goto LABEL_20;
    }
    [(MDRenderTarget *)self->super._displayTarget size];
    double v8 = v7;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v10 = v9;
    double v11 = (int8x8_t *)*((void *)self->super._mapEngine + 140);
    int8x8_t v12 = v11[2];
    double v13 = 0.0;
    if (v12)
    {
      uint8x8_t v14 = (uint8x8_t)vcnt_s8(v12);
      v14.i16[0] = vaddlv_u8(v14);
      if (v14.u32[0] > 1uLL)
      {
        uint64_t v15 = 0x17767EADC5B287BuLL % *(void *)&v12;
        if (*(void *)&v12 > 0x17767EADC5B287BuLL) {
          uint64_t v15 = 0x17767EADC5B287BLL;
        }
      }
      else
      {
        uint64_t v15 = (*(void *)&v12 - 1) & 0x17767EADC5B287BLL;
      }
      int8x16_t v39 = *(void **)(*(void *)&v11[1] + 8 * v15);
      if (v39)
      {
        int8x16_t v40 = (void *)*v39;
        if (v40)
        {
          if (v14.u32[0] < 2uLL)
          {
            uint64_t v41 = *(void *)&v12 - 1;
            while (1)
            {
              uint64_t v43 = v40[1];
              if (v43 == 0x17767EADC5B287BLL)
              {
                if (v40[2] == 0x17767EADC5B287BLL) {
                  goto LABEL_43;
                }
              }
              else if ((v43 & v41) != v15)
              {
                goto LABEL_53;
              }
              int8x16_t v40 = (void *)*v40;
              if (!v40) {
                goto LABEL_53;
              }
            }
          }
          do
          {
            unint64_t v42 = v40[1];
            if (v42 == 0x17767EADC5B287BLL)
            {
              if (v40[2] == 0x17767EADC5B287BLL)
              {
LABEL_43:
                uint64_t v44 = v40[5];
                if (v44)
                {
                  cameraController = self->super._cameraController;
                  if (cameraController)
                  {
                    [(VKCameraController *)cameraController camera];
                    if (*(void *)&v64.f64[1]
                      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v64.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
                    {
                      (*(void (**)(void))(**(void **)&v64.f64[1] + 16))(*(void *)&v64.f64[1]);
                      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v64.f64[1]);
                    }
                    if (*(void *)&v64.f64[0])
                    {
                      double v46 = *(double *)(v44 + 248);
                      [(VKCameraController *)self->super._cameraController camera];
                      double v47 = *(double *)(*(void *)&v64.f64[0] + 8);
                      long double v48 = cos(v47 + v47) * -559.82 + 111132.92;
                      long double v49 = v48 + cos(v47 * 4.0) * 1.175;
                      double v50 = v49 + cos(v47 * 6.0) * -0.0023;
                      double v51 = v47 * 0.5;
                      long double v52 = tan(v47 * 0.5 + 0.78103484);
                      double v53 = log(v52);
                      long double v54 = tan(v51 + 0.789761487);
                      double v55 = fabs((log(v54) - v53) * 0.159154943) * v46;
                      if (*(void *)&v64.f64[1]
                        && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v64.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
                      {
                        (*(void (**)(void))(**(void **)&v64.f64[1] + 16))(*(void *)&v64.f64[1]);
                        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v64.f64[1]);
                      }
                      double v13 = v55 / v50;
                    }
                  }
                }
                break;
              }
            }
            else
            {
              if (v42 >= *(void *)&v12) {
                v42 %= *(void *)&v12;
              }
              if (v42 != v15) {
                break;
              }
            }
            int8x16_t v40 = (void *)*v40;
          }
          while (v40);
        }
      }
    }
LABEL_53:
    uint64_t v56 = self->super._vkCamera._obj;
    uint64_t v57 = v56;
    if (v56)
    {
      -[VKCamera groundPointFromScreenPoint:atGroundLevel:](v56, "groundPointFromScreenPoint:atGroundLevel:", x / v8, 1.0 - y / v10, -v13);
    }
    else
    {
      float64x2_t v64 = 0u;
      long long v65 = 0u;
    }

    if (LOBYTE(v64.f64[0]))
    {
      double v31 = v64.f64[1];
      double v32 = *(double *)&v65;
    }
    else
    {
LABEL_20:
      uint64_t v27 = self->super._vkCamera._obj;
      uint64_t v28 = [(VKCamera *)v27 position];
      double v29 = self->super._vkCamera._obj;
      uint64_t v30 = [(VKCamera *)v29 position];
      [(VKCamera *)self->super._vkCamera._obj position];
      double v31 = *v28;
      double v32 = *(double *)(v30 + 8);
    }
    long double v33 = exp(v32 * 6.28318531 + -3.14159265);
    long double v63 = atan(v33);
    long double v34 = fmod(v31 * 6.28318531, 6.28318531);
    long double v35 = fmod(v34 + 6.28318531, 6.28318531);
    v36.f64[0] = v63;
    v36.f64[1] = v35;
    float64x2_t v37 = vmlaq_f64((float64x2_t)xmmword_1A28FCC00, (float64x2_t)xmmword_1A28FCBF0, v36);
  }
  else
  {
    if (v5 <= 0.0) {
      goto LABEL_17;
    }
    [(MDRenderTarget *)self->super._displayTarget size];
    if (v16 <= 0.0) {
      goto LABEL_17;
    }
    uint64_t v17 = *(void *)([(VKScreenCanvas *)self mapEngine] + 904);
    v18.f64[0] = x;
    v18.f64[1] = y;
    float64x2_t v60 = v18;
    double v19 = [(VKScreenCanvas *)self mapEngine];
    uint64_t v20 = v19[133];
    long double v21 = (std::__shared_weak_count *)v19[134];
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v64, v17, v20 + 8, 0, v60);
    float64x2_t v22 = v64;
    double v23 = *(double *)&v65;
    if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      float64x2_t v61 = v22;
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
      float64x2_t v22 = v61;
    }
    if (v22.f64[0] == -3.14159265 && v22.f64[1] == -3.14159265 && v23 == 0.0)
    {
LABEL_17:
      long double v24 = [(VKScreenCanvas *)self mapEngine];
      uint64_t v25 = v24[133];
      uint64_t v26 = (std::__shared_weak_count *)v24[134];
      if (v26)
      {
        atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
        float64x2_t v22 = *(float64x2_t *)(v25 + 8);
        if (!atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          float64x2_t v62 = v22;
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
          float64x2_t v22 = v62;
        }
      }
      else
      {
        float64x2_t v22 = *(float64x2_t *)(v25 + 8);
      }
    }
    float64x2_t v37 = vmulq_f64(v22, (float64x2_t)vdupq_n_s64(0x404CA5DC1A63C1F8uLL));
  }
  double v38 = v37.f64[1];
  result.double var0 = v37.f64[0];
  result.double var1 = v38;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToMapPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(VKCameraController *)self->super._cameraController usesVKCamera])
  {
    [(MDRenderTarget *)self->super._displayTarget size];
    double v5 = v4;
    [(MDRenderTarget *)self->super._displayTarget size];
    double v7 = v6;
    double v8 = self->super._vkCamera._obj;
    double v9 = v8;
    if (v8)
    {
      -[VKCamera groundPointFromScreenPoint:](v8, "groundPointFromScreenPoint:", x / v5, 1.0 - y / v7);
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
    }

    if ((_BYTE)v25)
    {
      double v20 = *MEMORY[0x1E4F63F10] * *((double *)&v25 + 1);
      double v21 = *(double *)(MEMORY[0x1E4F63F10] + 8) - *(double *)&v26 * *(double *)(MEMORY[0x1E4F63F10] + 8);
      goto LABEL_17;
    }
LABEL_16:
    double v20 = *MEMORY[0x1E4F63EF8];
    double v21 = *(double *)(MEMORY[0x1E4F63EF8] + 8);
    goto LABEL_17;
  }
  uint64_t v10 = *(void *)([(VKScreenCanvas *)self mapEngine] + 904);
  v11.f64[0] = x;
  v11.f64[1] = y;
  float64x2_t v24 = v11;
  int8x8_t v12 = [(VKScreenCanvas *)self mapEngine];
  uint64_t v13 = v12[133];
  uint8x8_t v14 = (std::__shared_weak_count *)v12[134];
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v25, v10, v13 + 8, 0, v24);
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  long long v15 = v25;
  if (*(double *)&v25 == -3.14159265 && *((double *)&v25 + 1) == -3.14159265 && *(double *)&v26 == 0.0) {
    goto LABEL_16;
  }
  long double v16 = tan(*(double *)&v25 * 0.5 + 0.785398163);
  long double v17 = log(v16);
  float v18 = *((double *)&v15 + 1) * 0.159154943 + 0.5;
  float v19 = v17 * 0.159154943 + 0.5;
  double v20 = *MEMORY[0x1E4F63F10] * v18;
  double v21 = *(double *)(MEMORY[0x1E4F63F10] + 8) * (float)(1.0 - v19);
LABEL_17:
  result.double var1 = v21;
  result.double var0 = v20;
  return result;
}

- (optional<float>)_zoomLevelForCanvasSize:(CGSize)a3
{
  double v4 = v3;
  if (a3.width <= 0.0 || (double height = a3.height, a3.height <= 0.0))
  {
    *(unsigned char *)id v3 = 0;
  }
  else
  {
    double width = a3.width;
    double v8 = [(VKCamera *)self->super._vkCamera._obj footprint];
    [v8 maxDepth];
    double v10 = v9;

    [(VKCamera *)self->super._vkCamera._obj tanHalfVerticalFOV];
    double v12 = log2(width * v11 * (v10 + v10) / height);
    float v13 = width * 0.001953125;
    float v14 = log2f(v13) - v12;
    *(unsigned char *)double v4 = 1;
    v4[1] = v14;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (id)consoleString:(BOOL)a3
{
  char v4 = objc_opt_respondsToSelector();
  int v5 = 0;
  if (v4) {
    [(MDRenderTarget *)self->super._displayTarget averageFPS];
  }
  int cntrl = (int)self->_overlayContainer.__cntrl_;
  LODWORD(self->_overlayContainer.__cntrl_) = cntrl - 1;
  if (cntrl <= 0)
  {
    HIDWORD(self->_overlayContainer.__cntrl_) = v5;
    LODWORD(self->_overlayContainer.__cntrl_) = 10;
  }
  uint64_t mapEngine = self->super._mapEngine;
  double v8 = (void *)*((void *)mapEngine + 115);
  int8x8_t v9 = (int8x8_t)v8[1];
  if (!*(void *)&v9) {
    goto LABEL_28;
  }
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    uint64_t v11 = 0x1AF456233693CD46;
    if (*(void *)&v9 <= 0x1AF456233693CD46uLL) {
      uint64_t v11 = 0x1AF456233693CD46uLL % *(void *)&v9;
    }
  }
  else
  {
    uint64_t v11 = (*(void *)&v9 - 1) & 0x1AF456233693CD46;
  }
  double v12 = *(void **)(*v8 + 8 * v11);
  if (!v12) {
    goto LABEL_28;
  }
  float v13 = (void *)*v12;
  if (!v13) {
    goto LABEL_28;
  }
  if (v10.u32[0] < 2uLL)
  {
    uint64_t v14 = *(void *)&v9 - 1;
    while (1)
    {
      uint64_t v16 = v13[1];
      if (v16 == 0x1AF456233693CD46)
      {
        if (v13[2] == 0x1AF456233693CD46) {
          goto LABEL_26;
        }
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_28;
      }
      float v13 = (void *)*v13;
      if (!v13) {
        goto LABEL_28;
      }
    }
  }
  while (1)
  {
    unint64_t v15 = v13[1];
    if (v15 == 0x1AF456233693CD46) {
      break;
    }
    if (v15 >= *(void *)&v9) {
      v15 %= *(void *)&v9;
    }
    if (v15 != v11) {
      goto LABEL_28;
    }
LABEL_15:
    float v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_28;
    }
  }
  if (v13[2] != 0x1AF456233693CD46) {
    goto LABEL_15;
  }
LABEL_26:
  uint64_t v17 = v13[5];
  if (*(void *)(v17 + 8) == 0x1AF456233693CD46)
  {
    uint64_t v18 = *(void *)(v17 + 32);
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v18 = 0;
LABEL_29:
  id v19 = *((id *)mapEngine + 105);
  [v19 size];
  double v22 = v21;
  double v23 = self->super._mapEngine;
  uint64_t v24 = v23[140];
  unint64_t v25 = *(void *)(v24 + 16);
  if ((v25 & (v25 - 1)) != 0)
  {
    unint64_t v27 = 0x20A1ED17D78F322BLL;
    if (v25 <= 0x20A1ED17D78F322BLL) {
      unint64_t v27 = 0x20A1ED17D78F322BLL % v25;
    }
    uint64_t v28 = *(void **)(*(void *)(v24 + 8) + 8 * v27);
    do
    {
      do
        uint64_t v28 = (void *)*v28;
      while (v28[1] != 0x20A1ED17D78F322BLL);
    }
    while (v28[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    long long v26 = *(void **)(*(void *)(v24 + 8) + 8 * ((v25 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        long long v26 = (void *)*v26;
      while (v26[1] != 0x20A1ED17D78F322BLL);
    }
    while (v26[2] != 0x20A1ED17D78F322BLL);
  }
  if (v18)
  {
    unint64_t v29 = *(void *)(v23[112] + 312);
    float v30 = *((float *)&self->_overlayContainer.__cntrl_ + 1);
    float v31 = gdc::DisplayZoomLevel::centerZoomLevel((gdc::DisplayZoomLevel *)v18, v20);
    float v32 = 0.0;
    if (v22 > 0.0)
    {
      float v33 = v22;
      float v34 = (float)v29;
      float v32 = log2f(v33 / v34);
    }
    float v35 = fminf(fmaxf(v31 + v32, 1.0), 25.0);
    if (v29)
    {
      if ((int)v29 < 513)
      {
        int v36 = 0;
        int v37 = 512;
      }
      else
      {
        int v36 = 0;
        int v37 = 512;
        do
        {
          ++v36;
          v37 *= 2;
        }
        while (v37 < (int)v29);
      }
      while (v37 > (int)v29)
      {
        --v36;
        LODWORD(v29) = 2 * v29;
      }
    }
    else
    {
      int v36 = 0;
    }
    float v39 = fmaxf(v35 + (float)v36, 1.0);
    float v40 = v39 * 10.0;
    if (v39 > 25.0) {
      float v40 = 250.0;
    }
    double v38 = [NSString stringWithFormat:@"%.2f fps | Pitch: %.0f˚ | s: %.1f | n: %.1f\nlat: %f lon: %f alt: %f", v30, *(double *)(v18 + 40) * 57.2957795, (float)(floorf(v40) * 0.1), (float)(floorf(v35 * 10.0) * 0.1), *(double *)(v18 + 8) * 57.2957795, *(double *)(v18 + 16) * 57.2957795, *(void *)(v18 + 32)];
  }
  else
  {
    double v38 = @"Error";
  }

  return v38;
}

- (id)detailedDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  char v4 = [(VKMapCanvas *)self description];
  int v5 = (void *)[v3 initWithFormat:@"%@\n\n", v4];

  [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
  uint64_t v7 = v6;
  [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
  [v5 appendFormat:@"Canvas size: (%f, %f)\n", v7, v8];
  int8x8_t v9 = [(VKCameraController *)self->super._cameraController detailedDescription];
  [v5 appendFormat:@"Camera Controller:\n%@\n\n", v9];

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)_PreserveModelTileKVOContext == a6)
  {
    float v13 = +[VKDebugSettings sharedSettings];
    int v14 = [v13 preserveModelTile];

    if (v14)
    {
      uint64_t v15 = *((void *)self->super._mapEngine + 112);
      uint64_t v16 = *(void *)(v15 + 24);
      v25[0] = &unk_1EF56C900;
      v25[1] = v15;
      long long v26 = v25;
      uint64_t v17 = *(__int16 **)(v16 + 8);
      uint64_t v18 = *(__int16 **)(v16 + 16);
      if (v17 == v18) {
        goto LABEL_10;
      }
      do
      {
        uint64_t v19 = *((void *)v17 + 1);
        uint64_t v20 = *((void *)v17 + 2);
        __int16 v24 = *v17;
        uint64_t v22 = v20;
        uint64_t v23 = v19;
        if (!v26) {
          std::__throw_bad_function_call[abi:nn180100]();
        }
        (*(void (**)(void *, __int16 *, uint64_t *, uint64_t *))(*v26 + 48))(v26, &v24, &v23, &v22);
        v17 += 12;
      }
      while (v17 != v18);
      if (v26 == v25)
      {
LABEL_10:
        (*(void (**)(void *))(v25[0] + 32))(v25);
      }
      else if (v26)
      {
        (*(void (**)(void))(*v26 + 40))();
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)VKMapCanvas;
    [(VKMapCanvas *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)observeValueForKeyPath:ofObject:change:context:
{
}

- (uint64_t)observeValueForKeyPath:ofObject:change:context:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF56C900;
  a2[1] = v2;
  return result;
}

- (void)dealloc
{
  id v3 = +[VKDebugSettings sharedSettings];
  [v3 removeObserver:self forKeyPath:@"preserveModelTile"];

  [*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type stop];
  double type = self->_lastValidCanvasSizeZoomLevel._value.type;
  self->_lastValidCanvasSizeZoomLevel._value.double type = 0.0;

  v5.receiver = self;
  v5.super_class = (Class)VKMapCanvas;
  [(VKScreenCanvas *)&v5 dealloc];
}

- (void)transferStateFromCanvas:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKMapCanvas;
  [(VKScreenCanvas *)&v5 transferStateFromCanvas:v4];
  [(VKCameraController *)self->super._cameraController beginRegionChange:0];
  [(VKCameraController *)self->super._cameraController updateCameraToPositionOrientationLimits];
  [(VKCameraController *)self->super._cameraController endRegionChange];
}

- (void)setMapType:(int)a3 animated:(BOOL)a4
{
  [(MDRenderTarget *)self->super._displayTarget size];
  double v6 = v5;
  [(MDRenderTarget *)self->super._displayTarget size];
  if (v7 * v6 > 0.0)
  {
    cameraController = self->super._cameraController;
    [(VKCameraController *)cameraController updateCameraToPositionOrientationLimits];
  }
}

- (void)setMapType:(int)a3
{
}

- (id)attributionsForCurrentRegion
{
  uint64_t mapEngine = self->super._mapEngine;
  if (mapEngine)
  {
    id v3 = (int8x8_t *)mapEngine[140];
    int8x8_t v4 = v3[2];
    if (v4)
    {
      uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
      v5.i16[0] = vaddlv_u8(v5);
      if (v5.u32[0] > 1uLL)
      {
        uint64_t v6 = 0x2B7C4502BD3C99C6;
        if (*(void *)&v4 <= 0x2B7C4502BD3C99C6uLL) {
          uint64_t v6 = 0x2B7C4502BD3C99C6uLL % *(void *)&v4;
        }
      }
      else
      {
        uint64_t v6 = (*(void *)&v4 - 1) & 0x2B7C4502BD3C99C6;
      }
      double v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
      if (v7)
      {
        uint64_t v8 = (void *)*v7;
        if (v8)
        {
          if (v5.u32[0] < 2uLL)
          {
            uint64_t v9 = *(void *)&v4 - 1;
            while (1)
            {
              uint64_t v11 = v8[1];
              if (v11 == 0x2B7C4502BD3C99C6)
              {
                if (v8[2] == 0x2B7C4502BD3C99C6) {
                  goto LABEL_23;
                }
              }
              else if ((v11 & v9) != v6)
              {
                goto LABEL_27;
              }
              uint64_t v8 = (void *)*v8;
              if (!v8) {
                goto LABEL_27;
              }
            }
          }
          while (1)
          {
            unint64_t v10 = v8[1];
            if (v10 == 0x2B7C4502BD3C99C6) {
              break;
            }
            if (v10 >= *(void *)&v4) {
              v10 %= *(void *)&v4;
            }
            if (v10 != v6) {
              goto LABEL_27;
            }
LABEL_12:
            uint64_t v8 = (void *)*v8;
            if (!v8) {
              goto LABEL_27;
            }
          }
          if (v8[2] != 0x2B7C4502BD3C99C6) {
            goto LABEL_12;
          }
LABEL_23:
          uint64_t v12 = v8[5];
          if (v12)
          {
            float v13 = *(md::SceneContext **)(v12 + 120);
            if (v13)
            {
              int v14 = md::SceneContext::layerDataInView(v13, 27);
              uint64_t v15 = v14 + 1;
              uint64_t v16 = (void *)*v14;
              if ((uint64_t *)*v14 != v14 + 1)
              {
                uint64_t v17 = 0;
                while (1)
                {
                  uint64_t v20 = v16[4];
                  uint64_t v19 = (std::__shared_weak_count *)v16[5];
                  float v31 = v19;
                  if (v19) {
                    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
                  }
                  if (v20)
                  {
                    uint64_t v21 = *(void *)(v20 + 720);
                    if (v21)
                    {
                      uint64_t v22 = *(void *)(v21 + 24);
                      uint64_t v23 = *(void *)(v21 + 32);
                      if (v22 != v23)
                      {
                        if (v17)
                        {
                          if (v22 == v23) {
                            goto LABEL_46;
                          }
                        }
                        else
                        {
                          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v20);
                          uint64_t v24 = *(void *)(v20 + 720);
                          uint64_t v22 = *(void *)(v24 + 24);
                          uint64_t v23 = *(void *)(v24 + 32);
                          if (v22 == v23) {
                            goto LABEL_46;
                          }
                        }
                        do
                        {
                          id v25 = *(id *)(v22 + 8);
                          char v26 = [v17 containsObject:v25];

                          if ((v26 & 1) == 0)
                          {
                            id v27 = *(id *)(v22 + 8);
                            [v17 addObject:v27];
                          }
                          v22 += 24;
                        }
                        while (v22 != v23);
                        uint64_t v19 = v31;
                      }
                    }
                  }
LABEL_46:
                  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
                    std::__shared_weak_count::__release_weak(v19);
                    uint64_t v28 = (uint64_t *)v16[1];
                    if (!v28)
                    {
                      do
                      {
LABEL_52:
                        unint64_t v29 = (uint64_t *)v16[2];
                        BOOL v30 = *v29 == (void)v16;
                        uint64_t v16 = v29;
                      }
                      while (!v30);
                      goto LABEL_31;
                    }
                  }
                  else
                  {
                    uint64_t v28 = (uint64_t *)v16[1];
                    if (!v28) {
                      goto LABEL_52;
                    }
                  }
                  do
                  {
                    unint64_t v29 = v28;
                    uint64_t v28 = (uint64_t *)*v28;
                  }
                  while (v28);
LABEL_31:
                  uint64_t v16 = v29;
                  if (v29 == v15) {
                    goto LABEL_28;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_27:
  uint64_t v17 = 0;
LABEL_28:
  return v17;
}

- (NSArray)visibleTileSets
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v48 = v3;
  uint64_t mapEngine = self->super._mapEngine;
  if (!mapEngine) {
    goto LABEL_31;
  }
  uint8x8_t v5 = (int8x8_t *)mapEngine[140];
  int8x8_t v6 = v5[2];
  if (!*(void *)&v6) {
    goto LABEL_31;
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    uint64_t v8 = 0x2B7C4502BD3C99C6;
    if (*(void *)&v6 <= 0x2B7C4502BD3C99C6uLL) {
      uint64_t v8 = 0x2B7C4502BD3C99C6uLL % *(void *)&v6;
    }
  }
  else
  {
    uint64_t v8 = (*(void *)&v6 - 1) & 0x2B7C4502BD3C99C6;
  }
  uint64_t v9 = *(void **)(*(void *)&v5[1] + 8 * v8);
  if (!v9) {
    goto LABEL_31;
  }
  unint64_t v10 = (void *)*v9;
  if (!v10) {
    goto LABEL_31;
  }
  if (v7.u32[0] < 2uLL)
  {
    uint64_t v11 = *(void *)&v6 - 1;
    while (1)
    {
      uint64_t v13 = v10[1];
      if (v13 == 0x2B7C4502BD3C99C6)
      {
        if (v10[2] == 0x2B7C4502BD3C99C6) {
          goto LABEL_23;
        }
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_31;
      }
      unint64_t v10 = (void *)*v10;
      if (!v10) {
        goto LABEL_31;
      }
    }
  }
  while (1)
  {
    unint64_t v12 = v10[1];
    if (v12 == 0x2B7C4502BD3C99C6) {
      break;
    }
    if (v12 >= *(void *)&v6) {
      v12 %= *(void *)&v6;
    }
    if (v12 != v8) {
      goto LABEL_31;
    }
LABEL_12:
    unint64_t v10 = (void *)*v10;
    if (!v10) {
      goto LABEL_31;
    }
  }
  if (v10[2] != 0x2B7C4502BD3C99C6) {
    goto LABEL_12;
  }
LABEL_23:
  uint64_t v14 = v10[5];
  if (!v14 || (uint64_t v15 = *(uint64_t **)(mapEngine[112] + 24), v47 = v15[7], (v16 = *(uint64_t **)(v14 + 120)) == 0))
  {
LABEL_31:
    id v24 = v3;
    id v25 = v24;
    goto LABEL_32;
  }
  uint64_t v17 = *v16;
  uint64_t v18 = *(void *)(*v16 + 112);
  uint64_t v19 = *(void *)(v17 + 120);
  if (v18 != v19)
  {
    while (*(_WORD *)v18)
    {
      v18 += 112;
      if (v18 == v19)
      {
        uint64_t v18 = v19;
        break;
      }
    }
  }
  uint64_t v20 = *(void *)(v18 + 104);
  uint64_t v45 = 0;
  uint64_t v46 = v20;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)float v39 = 0u;
  int v40 = 1065353216;
  v42[0] = 0;
  v42[1] = 0;
  uint64_t v41 = v42;
  v36[0] = &v47;
  v36[1] = &v48;
  int v37 = &unk_1EF558EA0;
  uint64_t v21 = operator new(0x28uLL);
  *uint64_t v21 = &unk_1EF56C120;
  v21[1] = &v46;
  v21[2] = &v43;
  void v21[3] = &v37;
  v21[4] = v36;
  double v50 = v21;
  gdc::LayerDataManager::forEachLayer(v15[1], v15[2], (uint64_t)v49);
  (*(void (**)(void *))(*v21 + 40))(v21);
  uint64_t v22 = (char *)v43;
  uint64_t v23 = v44;
  if (v44 != v43)
  {
    do
    {
      id v27 = (std::__shared_weak_count *)*((void *)v23 - 1);
      if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
      v23 -= 16;
    }
    while (v23 != v22);
  }
  uint64_t v44 = v22;
  id v25 = v48;
  std::__tree<gdc::ResourceKey,gdc::ResourceKeyLessThan,std::allocator<gdc::ResourceKey>>::destroy(v42[0]);
  uint64_t v28 = v39[0];
  if (v39[0])
  {
    do
    {
      float v33 = (void *)*v28;
      float v34 = (void *)v28[3];
      if (v34 != (void *)v28[5]) {
        free(v34);
      }
      operator delete(v28);
      uint64_t v28 = v33;
    }
    while (v33);
  }
  unint64_t v29 = __p[0];
  __p[0] = 0;
  if (v29) {
    operator delete(v29);
  }
  BOOL v30 = (char *)v43;
  if (v43)
  {
    float v31 = v44;
    float v32 = v43;
    if (v44 != v43)
    {
      do
      {
        float v35 = (std::__shared_weak_count *)*((void *)v31 - 1);
        if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
        v31 -= 16;
      }
      while (v31 != v30);
      float v32 = v43;
    }
    uint64_t v44 = v30;
    operator delete(v32);
  }
  id v24 = v48;
LABEL_32:

  return (NSArray *)v25;
}

- (void)visibleTileSets
{
}

- (__n128)visibleTileSets
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_1EF56C120;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

@end