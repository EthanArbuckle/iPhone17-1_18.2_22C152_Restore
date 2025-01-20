@interface VKImageCanvas
- (GEOMapRegion)mapRegion;
- (VKCamera)vkCamera;
- (VKEdgeInsets)edgeInsets;
- (VKImageCanvas)initWithMapEngine:(void *)a3;
- (double)pitch;
- (double)yaw;
- (id).cxx_construct;
- (int)mapType;
- (shared_ptr<gdc::Camera>)camera;
- (shared_ptr<md::TaskContext>)taskContext;
- (void)cancelLoad;
- (void)loadScene;
- (void)renderSceneWithEngine:(void *)a3 completion:(function<void)(;
- (void)renderSceneWithEngine:completion:;
- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5;
- (void)setMapType:(int)a3;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
@end

@implementation VKImageCanvas

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_1EF5597F8;
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = &unk_1EF559F38;
  *((void *)self + 7) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTarget, 0);
  cntrl = self->_camera.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  self->_vkCamera._vptr$_retain_ptr = (void **)&unk_1EF559F38;

  v4 = self->_taskContext.__cntrl_;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  self->_cameraController._vptr$_retain_ptr = (void **)&unk_1EF5597F8;
  obj = self->_cameraController._obj;
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

- (void)setMapType:(int)a3
{
  self->_mapType = a3;
}

- (int)mapType
{
  return self->_mapType;
}

- (void)renderSceneWithEngine:(void *)a3 completion:(function<void)(
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a4->__f_.__f_)
  {
    uint64_t v7 = *((void *)a3 + 11);
    if (v7)
    {
      (*(void (**)(uint64_t, SEL))(*(void *)v7 + 32))(v7, a2);
      if (*((void *)a3 + 11) == *((void *)a3 + 8))
      {
        v9 = (std::__shared_weak_count *)*((void *)a3 + 9);
        *((void *)a3 + 8) = 0;
        *((void *)a3 + 9) = 0;
        if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      else
      {
        uint64_t v8 = *((void *)a3 + 10);
        *((void *)a3 + 10) = 0;
        if (v8) {
          (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
        }
      }
      *((void *)a3 + 11) = 0;
    }
    uint64_t v10 = *((void *)self->_taskContext.__ptr_ + 1);
    v13[0] = &unk_1EF56C750;
    v14 = v13;
    geo::TaskQueue::barrierSync(v10, v13);
    if (v14 == v13)
    {
      (*(void (**)(void *))(v13[0] + 32))(v13);
    }
    else if (v14)
    {
      (*(void (**)(void))(*v14 + 40))();
    }
  }
  md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)a3 + 567), "-[VKImageCanvas renderSceneWithEngine:completion:]");
  double v11 = CACurrentMediaTime();
  if (md::MapEngine::renderSceneSync((md::MapEngine *)a3, v11))
  {
    f = a4->__f_.__f_;
    if (f) {
      (*(void (**)(void *))(*(void *)f + 48))(f);
    }
  }
}

- (void)renderSceneWithEngine:completion:
{
}

- (void)cancelLoad
{
  var0 = self->_runLoopController->var0;
  if (var0)
  {
    uint64_t v3 = *((void *)var0 + 11);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)v3 + 16))(v3, 1);
    }
  }
}

- (void)loadScene
{
  var0 = self->_runLoopController->var0;
  if (var0)
  {
    char v3 = 5;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v3);
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
    -[VKCameraController setEdgeInsets:](self->_cameraController._obj, "setEdgeInsets:", v4, *(double *)&a3.left, *(double *)&a3.bottom, *(double *)&a3.right);
  }
}

- (VKCamera)vkCamera
{
  return self->_vkCamera._obj;
}

- (double)pitch
{
  [(VKCameraController *)self->_cameraController._obj pitch];
  return result;
}

- (double)yaw
{
  [(VKCameraController *)self->_cameraController._obj heading];
  return result;
}

- (GEOMapRegion)mapRegion
{
  v2 = [(VKCameraController *)self->_cameraController._obj mapRegion];
  return (GEOMapRegion *)v2;
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (objc_opt_respondsToSelector())
  {
    obj = self->_cameraController._obj;
    -[VKCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:](obj, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:", 2, 0, 0, var0, var1, a4, a5, a6, 0.0);
  }
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5
{
  id v10 = a3;
  uint64_t v8 = self->_cameraController._obj;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(VKCameraController *)self->_cameraController._obj setMapRegion:v10 pitch:0 yaw:0 duration:a4 timingCurve:a5 completion:0.0];
  }
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
}

- (shared_ptr<md::TaskContext>)taskContext
{
  cntrl = self->_taskContext.__cntrl_;
  void *v2 = self->_taskContext.__ptr_;
  v2[1] = (TaskContext *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (TaskContext *)self;
  return result;
}

- (VKImageCanvas)initWithMapEngine:(void *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)VKImageCanvas;
  double v4 = [(VKImageCanvas *)&v34 init];
  VKEdgeInsets v5 = v4;
  if (v4)
  {
    v4->_runLoopController = (RunLoopController *)*((void *)a3 + 15);
    objc_storeStrong((id *)&v4->_displayTarget, *((id *)a3 + 105));
    uint64_t v7 = (TaskContext *)*((void *)a3 + 1);
    uint64_t v6 = *((void *)a3 + 2);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v5->_taskContext.__cntrl_;
    v5->_taskContext.__ptr_ = v7;
    v5->_taskContext.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    *(void *)&v5->_edgeInsets.float top = 0;
    *(void *)&v5->_edgeInsets.float bottom = 0;
    *((unsigned char *)a3 + 976) = 1;
    v9 = (Camera *)*((void *)a3 + 133);
    uint64_t v10 = *((void *)a3 + 134);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    double v11 = (std::__shared_weak_count *)v5->_camera.__cntrl_;
    v5->_camera.__ptr_ = v9;
    v5->_camera.__cntrl_ = (__shared_weak_count *)v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    *(void *)&v32.f64[1] = [[VKCamera alloc] initWithRunLoopController:v5->_runLoopController];
    objc_storeStrong((id *)&v5->_vkCamera._obj, *(id *)&v32.f64[1]);
    id v12 = *(id *)&v32.f64[1];
    float64_t v13 = v32.f64[1];
    v32.f64[1] = 0.0;

    *(void *)&v32.f64[0] = &unk_1EF559F38;
    [(VKCamera *)v5->_vkCamera._obj setNdcZNear:*(double *)(*(void *)(*((void *)a3 + 3) + 8) + 64)];
    memset(v31, 0, 24);
    v31[3] = 0x3FF0000000000000;
    [(VKCamera *)v5->_vkCamera._obj setOrientation:v31];
    ptr = v5->_camera.__ptr_;
    long long v30 = *((_OWORD *)ptr + 1);
    long double v15 = tan(*((double *)ptr + 1) * 0.5 + 0.785398163);
    long double v16 = log(v15);
    *(void *)&v17.f64[0] = v30;
    v17.f64[1] = v16;
    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v32 = vmlaq_f64(_Q2, (float64x2_t)vdupq_n_s64(0x3FC45F306DC9C883uLL), v17);
    uint64_t v33 = *((void *)&v30 + 1);
    [(VKCamera *)v5->_vkCamera._obj setMercatorPosition:&v32];
    id v23 = *((id *)a3 + 105);
    [v23 size];
    if (v24 > 0.0)
    {
      [v23 size];
      if (v25 > 0.0)
      {
        [v23 size];
        double v27 = v26;
        [v23 size];
        [(VKCamera *)v5->_vkCamera._obj setAspectRatio:v27 / v28];
      }
    }
  }
  return v5;
}

@end