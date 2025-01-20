@interface VKScreenCanvas
- (BOOL)isGesturing;
- (BOOL)wantsTimerTick;
- (MDMapControllerDelegate)mapDelegate;
- (VKEdgeInsets)edgeInsets;
- (VKEdgeInsets)fullyOccludedEdgeInsets;
- (VKScreenCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4;
- (_retain_ptr<VKCamera)vkCamera;
- (id).cxx_construct;
- (id)cameraController;
- (id)markerAtScreenPoint:(CGPoint)a3 enableExtendedFeatureMarkers:(BOOL)a4;
- (int64_t)baseDisplayRate;
- (int64_t)maxDisplayRate;
- (int64_t)tileSize;
- (shared_ptr<gdc::Camera>)camera;
- (void)cameraController:(id)a3 requestsDisplayRate:(int64_t)a4;
- (void)dealloc;
- (void)mapEngine;
- (void)runAnimation:(id)a3;
- (void)setBaseDisplayRate:(int64_t)a3;
- (void)setCamera:(shared_ptr<gdc::Camera>)a3;
- (void)setCameraController:(id)a3;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)setFullyOccludedEdgeInsets:(VKEdgeInsets)a3;
- (void)setGesturing:(BOOL)a3;
- (void)setMapDelegate:(id)a3;
- (void)setMaxDisplayRate:(int64_t)a3;
- (void)setVkCamera:(_retain_ptr<VKCamera *);
- (void)transferStateFromCanvas:(id)a3;
- (void)updateCameraForFrameResize;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
@end

@implementation VKScreenCanvas

- (id)cameraController
{
  return self->_cameraController;
}

- (BOOL)wantsTimerTick
{
  return [(VKCameraController *)self->_cameraController wantsTimerTick];
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

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
}

- (void)updateCameraForFrameResize
{
  uint64_t v3 = 0x2FED70A4459DFCA1;
  [(VKCameraController *)self->_cameraController canvasDidLayout];
  [(MDRenderTarget *)self->_displayTarget size];
  v6 = (int8x8_t *)*((void *)self->_mapEngine + 140);
  int8x8_t v7 = v6[2];
  if (v7)
  {
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
    v10 = *(void **)(*(void *)&v6[1] + 8 * v9);
    if (v10)
    {
      v11 = (void *)*v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          uint64_t v12 = *(void *)&v7 - 1;
          while (1)
          {
            uint64_t v14 = v11[1];
            if (v14 == 0x2FED70A4459DFCA1)
            {
              if (v11[2] == 0x2FED70A4459DFCA1) {
                goto LABEL_67;
              }
            }
            else if ((v14 & v12) != v9)
            {
              goto LABEL_21;
            }
            v11 = (void *)*v11;
            if (!v11) {
              goto LABEL_21;
            }
          }
        }
        do
        {
          unint64_t v13 = v11[1];
          if (v13 == 0x2FED70A4459DFCA1)
          {
            if (v11[2] == 0x2FED70A4459DFCA1)
            {
LABEL_67:
              uint64_t v15 = v11[5];
              goto LABEL_22;
            }
          }
          else
          {
            if (v13 >= *(void *)&v7) {
              v13 %= *(void *)&v7;
            }
            if (v13 != v9) {
              break;
            }
          }
          v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_21:
  uint64_t v15 = 0;
LABEL_22:
  uint64_t v16 = *(void *)(v15 + 208);
  double v17 = fmin(v5, v4);
  if (v17 <= 250.0)
  {
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v16, 0x10018u, 0);
    int v22 = 0;
    uint64_t v21 = *(void *)(v15 + 224);
  }
  else
  {
    if (v17 <= 850.0) {
      int v18 = 2;
    }
    else {
      int v18 = 3;
    }
    if (v17 <= 450.0) {
      int v19 = 1;
    }
    else {
      int v19 = v18;
    }
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v16, 0x10018u, v19);
    if (v17 <= 850.0) {
      int v20 = 2;
    }
    else {
      int v20 = 3;
    }
    uint64_t v21 = *(void *)(v15 + 224);
    if (v17 <= 450.0) {
      int v22 = 1;
    }
    else {
      int v22 = v20;
    }
  }
  gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(v21, 0x10018u, v22);
  v23 = (int8x8_t *)*((void *)self->_mapEngine + 140);
  int8x8_t v24 = v23[2];
  if (!*(void *)&v24) {
    goto LABEL_56;
  }
  uint8x8_t v25 = (uint8x8_t)vcnt_s8(v24);
  v25.i16[0] = vaddlv_u8(v25);
  if (v25.u32[0] > 1uLL)
  {
    if (*(void *)&v24 <= 0x2FED70A4459DFCA1uLL) {
      uint64_t v3 = 0x2FED70A4459DFCA1uLL % *(void *)&v24;
    }
  }
  else
  {
    uint64_t v3 = (*(void *)&v24 - 1) & 0x2FED70A4459DFCA1;
  }
  v26 = *(void **)(*(void *)&v23[1] + 8 * v3);
  if (!v26 || (v27 = (void *)*v26) == 0)
  {
LABEL_56:
    uint64_t v31 = 0;
    goto LABEL_57;
  }
  if (v25.u32[0] < 2uLL)
  {
    uint64_t v28 = *(void *)&v24 - 1;
    while (1)
    {
      uint64_t v30 = v27[1];
      if (v30 == 0x2FED70A4459DFCA1)
      {
        if (v27[2] == 0x2FED70A4459DFCA1) {
          goto LABEL_68;
        }
      }
      else if ((v30 & v28) != v3)
      {
        goto LABEL_56;
      }
      v27 = (void *)*v27;
      if (!v27) {
        goto LABEL_56;
      }
    }
  }
  while (1)
  {
    unint64_t v29 = v27[1];
    if (v29 == 0x2FED70A4459DFCA1) {
      break;
    }
    if (v29 >= *(void *)&v24) {
      v29 %= *(void *)&v24;
    }
    if (v29 != v3) {
      goto LABEL_56;
    }
LABEL_46:
    v27 = (void *)*v27;
    if (!v27) {
      goto LABEL_56;
    }
  }
  if (v27[2] != 0x2FED70A4459DFCA1) {
    goto LABEL_46;
  }
LABEL_68:
  uint64_t v31 = v27[5];
LABEL_57:
  char v35 = 4;
  v32 = *(char **)(v31 + 1128);
  v33 = *(char **)(v31 + 1136);
  if (v32 != v33)
  {
    while (*v32 <= 3u)
    {
      if (++v32 == v33) {
        goto LABEL_63;
      }
    }
  }
  if (v32 == v33 || (v33 = v32, *v32 != 4)) {
LABEL_63:
  }
    std::vector<md::StyleManagerEvent>::insert(v31 + 1128, v33, &v35);
  uint64_t v34 = **(void **)(v31 + 1240);
  if (v34)
  {
    char v36 = 12;
    md::MapEngine::setNeedsTick(v34, &v36);
  }
}

- (void)setCameraController:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v5 = (VKCameraController *)a3;
  if (self->_cameraController != v5)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_2079);
    }
    v6 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int8x8_t v7 = (objc_class *)objc_opt_class();
      uint8x8_t v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138412546;
      int v22 = v8;
      __int16 v23 = 2048;
      int8x8_t v24 = v5;
      _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "Camera controller did change:%@ %p", buf, 0x16u);
    }
    uint64_t v9 = self->_cameraController;
    [(VKCameraController *)v5 setVkCamera:self->_vkCamera._obj];
    cntrl = self->_camera.__cntrl_;
    ptr = self->_camera.__ptr_;
    int v20 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    [(VKCameraController *)v5 setCamera:&ptr];
    v11 = (std::__shared_weak_count *)v20;
    if (v20 && !atomic_fetch_add((atomic_ullong *volatile)v20 + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    [(VKCameraController *)v5 setCanvas:self->_displayTarget];
    *(float *)&double v12 = self->_edgeInsets.top;
    *(float *)&double v13 = self->_edgeInsets.left;
    *(float *)&double v14 = self->_edgeInsets.bottom;
    *(float *)&double v15 = self->_edgeInsets.right;
    -[VKCameraController setEdgeInsets:](v5, "setEdgeInsets:", v12, v13, v14, v15);
    [(VKCameraController *)v5 setBaseDisplayRate:self->_baseDisplayRate];
    [(VKCameraController *)v5 setMaxDisplayRate:self->_maxDisplayRate];
    objc_storeStrong((id *)&self->_cameraController, a3);
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
      [(VKCameraController *)v9 transferGestureState:self->_cameraController];
    }
    [(VKCameraController *)v9 setVkCamera:0];
    uint64_t v17 = 0;
    int v18 = 0;
    [(VKCameraController *)v9 setCamera:&v17];
    uint64_t v16 = v18;
    if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
    [(VKCameraController *)v9 setCanvas:0];
  }
}

- (void)setVkCamera:(_retain_ptr<VKCamera *)
{
  double v4 = a3._vptr$_retain_ptr[1];
  obj = self->_vkCamera._obj;
  self->_vkCamera._obj = v4;
}

- (void)setMapDelegate:(id)a3
{
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  double v4 = *(Camera **)a3.__ptr_;
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

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  *(void *)&v5.float bottom = *(void *)&a3.bottom;
  if (*(void *)&v5.top != *(void *)&self->_edgeInsets.top
    || *(void *)&a3.bottom != *(void *)&self->_edgeInsets.bottom)
  {
    HIDWORD(v4) = LODWORD(v5.left);
    self->_edgeInsets = v5;
    *(float *)&double v4 = self->_edgeInsets.top;
    a3.float left = self->_edgeInsets.left;
    a3.float bottom = self->_edgeInsets.bottom;
    a3.float right = self->_edgeInsets.right;
    -[VKCameraController setEdgeInsets:](self->_cameraController, "setEdgeInsets:", v4, *(double *)&a3.left, *(double *)&a3.bottom, *(double *)&a3.right);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = &unk_1EF559F38;
  *((void *)self + 7) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((void *)self + 28) = 0x3FF0000000000000;
  *((void *)self + 77) = 0xBFF0000000000000;
  *((void *)self + 78) = 0x3FF0000000000000;
  *((_DWORD *)self + 159) = 2;
  return self;
}

- (VKScreenCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VKScreenCanvas;
  VKEdgeInsets v5 = [(VKScreenCanvas *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_mapEngine = a3;
    v5->_runLoopController = (RunLoopController *)*((void *)a3 + 15);
    v5->_animationRunner = (AnimationRunner *)*((void *)a3 + 14);
    objc_storeStrong((id *)&v5->_displayTarget, *((id *)a3 + 105));
    uint8x8_t v8 = (TaskContext *)*((void *)a3 + 1);
    uint64_t v7 = *((void *)a3 + 2);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v6->_taskContext.__cntrl_;
    v6->_taskContext.__ptr_ = v8;
    v6->_taskContext.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v10 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arSession, 0);
  objc_destroyWeak((id *)&self->_mapDelegate);
  objc_storeStrong((id *)&self->_cameraController, 0);
  objc_storeStrong((id *)&self->_displayTarget, 0);
  cntrl = self->_camera.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  self->_vkCamera._vptr$_retain_ptr = (void **)&unk_1EF559F38;

  double v4 = self->_taskContext.__cntrl_;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
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

- (void)mapEngine
{
  return self->_mapEngine;
}

- (MDMapControllerDelegate)mapDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapDelegate);
  return (MDMapControllerDelegate *)WeakRetained;
}

- (void)setFullyOccludedEdgeInsets:(VKEdgeInsets)a3
{
  self->_fullyOccludedEdgeInsets = a3;
}

- (VKEdgeInsets)fullyOccludedEdgeInsets
{
  float top = self->_fullyOccludedEdgeInsets.top;
  float left = self->_fullyOccludedEdgeInsets.left;
  float bottom = self->_fullyOccludedEdgeInsets.bottom;
  float right = self->_fullyOccludedEdgeInsets.right;
  result.float right = right;
  result.float bottom = bottom;
  result.float left = left;
  result.float top = top;
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

- (_retain_ptr<VKCamera)vkCamera
{
  uint64_t v3 = v2;
  void *v2 = &unk_1EF559F38;
  v2[1] = 0;
  double v4 = self->_vkCamera._obj;
  VKEdgeInsets v5 = (void *)v3[1];
  v3[1] = v4;

  result._obj = v7;
  result._vptr$_retain_ptr = v6;
  return result;
}

- (int64_t)tileSize
{
  return 256;
}

- (void)transferStateFromCanvas:(id)a3
{
  double v4 = [a3 cameraController];
  -[VKCameraController setStaysCenteredDuringRotation:](self->_cameraController, "setStaysCenteredDuringRotation:", [v4 staysCenteredDuringRotation]);
  -[VKCameraController setStaysCenteredDuringPinch:](self->_cameraController, "setStaysCenteredDuringPinch:", [v4 staysCenteredDuringPinch]);
  -[VKCameraController setGesturing:](self->_cameraController, "setGesturing:", [v4 isGesturing]);
  -[VKCameraController setIsPitchEnabled:](self->_cameraController, "setIsPitchEnabled:", [v4 isPitchEnabled]);
  -[VKCameraController setEdgeInsetsAnimating:](self->_cameraController, "setEdgeInsetsAnimating:", [v4 edgeInsetsAnimating]);
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v5 = v4;
    v6 = self->_cameraController;
    uint64_t v7 = [v5 trackingAnnotation];
    if (v7)
    {
      uint64_t v8 = [v5 isTrackingHeading];
      [v5 stopTrackingAnnotation];
      if (v5) {
        [v5 annotationTrackingBehavior];
      }
      else {
        memset(v9, 0, sizeof(v9));
      }
      [(VKCameraController *)v6 setAnnotationTrackingBehavior:v9];
      [(VKCameraController *)v6 startTrackingAnnotation:v7 trackHeading:v8 animated:0 duration:0 timingFunction:-1.0];
    }
  }
}

- (id)markerAtScreenPoint:(CGPoint)a3 enableExtendedFeatureMarkers:(BOOL)a4
{
  return 0;
}

- (void)setMaxDisplayRate:(int64_t)a3
{
  self->_maxDisplayRate = a3;
  cameraController = self->_cameraController;
  if (cameraController) {
    -[VKCameraController setMaxDisplayRate:](cameraController, "setMaxDisplayRate:");
  }
}

- (void)setBaseDisplayRate:(int64_t)a3
{
  self->_baseDisplayRate = a3;
  cameraController = self->_cameraController;
  if (cameraController) {
    -[VKCameraController setBaseDisplayRate:](cameraController, "setBaseDisplayRate:");
  }
}

- (void)cameraController:(id)a3 requestsDisplayRate:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapDelegate);
  [WeakRetained mapController:self requestsDisplayRate:a4];
}

- (void)setGesturing:(BOOL)a3
{
  if (self->_userIsGesturing != a3)
  {
    self->_userIsGesturing = a3;
    -[VKCameraController setGesturing:](self->_cameraController, "setGesturing:");
    var0 = self->_runLoopController->var0;
    if (var0)
    {
      char v5 = 1;
      md::MapEngine::setNeedsTick((uint64_t)var0, &v5);
    }
  }
}

- (BOOL)isGesturing
{
  return self->_userIsGesturing;
}

- (void)runAnimation:(id)a3
{
}

- (void)dealloc
{
  self->_deallocing = 1;
  cameraController = self->_cameraController;
  self->_cameraController = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKScreenCanvas;
  [(VKScreenCanvas *)&v4 dealloc];
}

@end