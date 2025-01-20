@interface VKGlobeImageCanvas
- (VKGlobeImageCanvas)initWithMapEngine:(void *)a3;
- (id).cxx_construct;
- (void)_updateViewport;
- (void)cancelTileRequests;
- (void)dealloc;
- (void)didLayout;
- (void)setMapType:(int)a3;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)willDealloc;
@end

@implementation VKGlobeImageCanvas

- (id).cxx_construct
{
  *((void *)self + 18) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_globeAdapter.__ptr_.__value_;
  self->_globeAdapter.__ptr_.__value_ = 0;
  if (value)
  {
    md::GlobeAdapter::~GlobeAdapter((md::GlobeAdapter *)value);
    MEMORY[0x1A6239270]();
  }
  objc_storeStrong((id *)&self->_vkCamera, 0);
}

- (void)cancelTileRequests
{
  v2 = *(karo::JobManager ***)(*(void *)(*((void *)self->_globeView + 107) + 136) + 72);
  v3 = *v2;
  v4 = v2[1];
  *((unsigned char *)*v2 + 64) = 1;
  *((unsigned char *)v2[2] + 64) = 1;
  if (v4) {
    *((unsigned char *)v4 + 64) = 1;
  }
  karo::JobManager::cancelAll(v3);
  karo::JobManager::cancelAll(v2[2]);
  v5 = v2[1];
  if (!v5)
  {
    *((unsigned char *)*v2 + 64) = 0;
    v6 = v2[2];
    goto LABEL_7;
  }
  karo::JobManager::cancelAll(v5);
  v6 = v2[1];
  *((unsigned char *)*v2 + 64) = 0;
  *((unsigned char *)v2[2] + 64) = 0;
  if (v6) {
LABEL_7:
  }
    *((unsigned char *)v6 + 64) = 0;
}

- (void)_updateViewport
{
  [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
  int v4 = (int)v3;
  [(MDRenderTarget *)self->super._displayTarget sizeInPixels];
  int v6 = (int)v5;
  if (v4 >= 1 && v6 >= 1)
  {
    if (v4 <= v6) {
      int v8 = (int)v5;
    }
    else {
      int v8 = v4;
    }
    long double v9 = atan((float)((float)v6 / (float)v8) * 0.267949192);
    *(float *)&long double v9 = v9 + v9;
    double v10 = fminf(fmaxf(*(float *)&v9, 0.31416), 0.5236);
    globeView = self->_globeView;
    *((double *)globeView + 35) = v10;
    double v12 = tan(v10 * 0.5);
    *((double *)globeView + 36) = v12;
    v13 = (double *)*((void *)globeView + 9);
    double v15 = v13[46];
    double v14 = v13[47];
    if (v14 < v15)
    {
      double v16 = v14 * v15;
      double v17 = v15 / v14;
      if (v16 <= 0.0) {
        double v17 = 1.0;
      }
      long double v18 = atan(v17 * v12);
      double v10 = v18 + v18;
    }
    v13[57] = v10;
    uint64_t v19 = **(void **)(*((void *)globeView + 107) + 88);
    if (v19)
    {
      char v28 = 7;
      md::MapEngine::setNeedsTick(v19, &v28);
    }
    v20 = (char *)self->_globeView;
    *(void *)(v20 + 636) = 0;
    *((_DWORD *)v20 + 161) = v4;
    *((_DWORD *)v20 + 162) = v6;
    uint64_t v21 = **(void **)(*((void *)v20 + 107) + 88);
    if (v21)
    {
      char v29 = 7;
      md::MapEngine::setNeedsTick(v21, &v29);
    }
    uint64_t v22 = *((void *)v20 + 99);
    *(void *)(v22 + 40) = 0;
    *(_DWORD *)(v22 + 48) = v4;
    *(_DWORD *)(v22 + 52) = v6;
    [(MDRenderTarget *)self->super._displayTarget contentScale];
    if (v23 != 0.0)
    {
      if (v6 >= v4) {
        int v24 = v4;
      }
      else {
        int v24 = v6;
      }
      v25 = (double *)self->_globeView;
      double v26 = (double)v24;
      [(MDRenderTarget *)self->super._displayTarget contentScale];
      v25[48] = v26 * 0.001953125 / v27;
    }
  }
}

- (void)didLayout
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)self->_globeView + 832);
  if ((v3 & 1) != 0 || altitude::GlobeView::needsUpdate((altitude::GlobeView *)self->_globeView))
  {
    var0 = self->super._runLoopController->var0;
    if (var0)
    {
      char v6 = 5;
      md::MapEngine::setNeedsTick((uint64_t)var0, &v6);
    }
  }
  else
  {
    loadingStatusTracker = self->_loadingStatusTracker;
    gdc::LoadingStatusTracker::setSceneStatus((uint64_t)loadingStatusTracker, 2);
  }
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VKGlobeImageCanvas;
  [(VKImageCanvas *)&v9 updateWithTimestamp:a4 withContext:a3];
  uint64_t v7 = 0x40F86A0000000000;
  uint64_t v8 = 0x4024000000000000;
  (*(void (**)(void *, uint64_t *, uint64_t *))(*(void *)self->_globeView + 64))(self->_globeView, &v8, &v7);
  ptr = self->super._camera.__ptr_;
  uint64_t v6 = v7;
  *((void *)ptr + 58) = v8;
  *((void *)ptr + 59) = v6;
  [(VKCameraController *)self->super._cameraController._obj updateCameraManager];
}

- (void)setMapType:(int)a3
{
  globeView = self->_globeView;
  if (a3 == 4)
  {
    globeView[432] = 1;
    uint64_t v6 = *((void *)globeView + 107);
    uint64_t v7 = **(void **)(v6 + 88);
    if (v7)
    {
      char v15 = 7;
      md::MapEngine::setNeedsTick(v7, &v15);
      globeView = self->_globeView;
      uint64_t v6 = *((void *)globeView + 107);
    }
    globeView[433] = 1;
    (*(void (**)(void, uint64_t, void))(**(void **)(*(void *)(v6 + 40) + 40) + 40))(*(void *)(*(void *)(v6 + 40) + 40), 1, 0);
    uint64_t v8 = *(void **)(*(void *)(*((void *)globeView + 107) + 40) + 40);
    uint64_t v9 = v8[12];
    if (v9) {
      atomic_store(1u, (unsigned __int8 *)(v9 + 224));
    }
    uint64_t v10 = v8[10];
    if (v10) {
      atomic_store(1u, (unsigned __int8 *)(v10 + 224));
    }
    uint64_t v11 = v8[11];
    if (v11) {
      atomic_store(1u, (unsigned __int8 *)(v11 + 224));
    }
    uint64_t v12 = *(void *)(*(void *)(*(void *)(*((void *)globeView + 107) + 40) + 40) + 56);
    if (v12) {
      *(unsigned char *)(v12 + 136) = 1;
    }
  }
  else
  {
    altitude::GlobeView::disableLabelData((altitude::GlobeView *)self->_globeView);
    v13 = self->_globeView;
    v13[432] = 0;
    uint64_t v14 = **(void **)(*((void *)v13 + 107) + 88);
    if (v14)
    {
      char v16 = 7;
      md::MapEngine::setNeedsTick(v14, &v16);
    }
  }
  self->super._mapType = a3;
}

- (void)dealloc
{
  [(VKGlobeImageCanvas *)self willDealloc];
  [(VKCameraController *)self->super._cameraController._obj setCanvas:0];
  v3.receiver = self;
  v3.super_class = (Class)VKGlobeImageCanvas;
  [(VKGlobeImageCanvas *)&v3 dealloc];
}

- (void)willDealloc
{
  globeView = self->_globeView;
  if (globeView)
  {
    int v4 = (altitude::GlobeCleanupLoader *)globeView[56];
    if (v4) {
      altitude::GlobeCleanupLoader::pruneNodesAndGeometry(v4);
    }
    double v5 = (altitude::ObjectTreeLoader *)globeView[87];
    if (v5) {
      altitude::ObjectTreeLoader::pruneModels(v5);
    }
    uint64_t v6 = globeView[105];
    if (v6) {
      *(unsigned char *)(v6 + 376) = 1;
    }
    if (md::HardwareFigDecoder::instance(void)::once != -1) {
      dispatch_once(&md::HardwareFigDecoder::instance(void)::once, &__block_literal_global_25645);
    }
    md::HardwareFigDecoder::discardCaches(*(std::mutex **)md::HardwareFigDecoder::instance(void)::_singleton);
    md::GlobeAdapter::setGlobeView((md::GlobeAdapter *)self->_globeAdapter.__ptr_.__value_, 0);
    [(VKCameraController *)self->super._cameraController._obj setGlobeView:0];
    self->_globeView = 0;
  }
}

- (VKGlobeImageCanvas)initWithMapEngine:(void *)a3
{
  v39.receiver = self;
  v39.super_class = (Class)VKGlobeImageCanvas;
  int v4 = -[VKImageCanvas initWithMapEngine:](&v39, sel_initWithMapEngine_);
  if (v4)
  {
    md::MapEngine::createFlyoverRenderer((uint64_t)a3);
    md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)a3 + 567), "-[VKGlobeImageCanvas initWithMapEngine:]");
    double v5 = *(void **)(*((void *)a3 + 108) + 128);
    v4->_globeView = v5;
    uint64_t v6 = *(void *)(v5[107] + 136);
    *(unsigned char *)(v6 + 42) = 1;
    *(_WORD *)(v6 + 40) = 1;
    uint64_t v7 = +[VKPlatform sharedPlatform];
    *(unsigned char *)(*(void *)(v5[107] + 136) + 49) = [v7 proceduralRoadAlpha];

    globeView = (altitude::GlobeView *)v4->_globeView;
    uint64_t v9 = *(void *)(*((void *)globeView + 107) + 136);
    *(unsigned char *)(v9 + 64) = *(unsigned char *)(*(void *)(*((void *)a3 + 3) + 8) + 16);
    *(unsigned char *)(v9 + 68) = 0;
    [(MDRenderTarget *)v4->super._displayTarget contentScale];
    *(void *)(*(void *)(*((void *)globeView + 107) + 136) + 32) = v10;
    altitude::GlobeView::updateLodScale(globeView);
    uint64_t v11 = (altitude::GlobeView *)v4->_globeView;
    *(unsigned char *)(*(void *)(*((void *)v11 + 107) + 136) + 48) = 1;
    altitude::GlobeView::updateNightLightRedrawRequest(v11);
    uint64_t v12 = v4->_globeView;
    *(_DWORD *)(v12[86] + 200) = 1065353216;
    *(_DWORD *)(v12[87] + 216) = 1065353216;
    uint64_t v13 = **(void **)(v12[107] + 88);
    if (v13)
    {
      LOBYTE(v35) = 7;
      md::MapEngine::setNeedsTick(v13, &v35);
    }
    uint64_t v14 = [VKGlobeCameraController alloc];
    cntrl = v4->super._taskContext.__cntrl_;
    ptr = v4->super._taskContext.__ptr_;
    v38 = (std::__shared_weak_count *)cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    uint64_t v16 = *((void *)a3 + 113);
    uint64_t v17 = *((void *)a3 + 14);
    uint64_t v18 = *((void *)a3 + 15);
    id v19 = *((id *)a3 + 138);
    v20 = [(VKGlobeCameraController *)v14 initWithTaskContext:&ptr mapDataAccess:v16 animationRunner:v17 runLoopController:v18 cameraDelegate:v19];

    uint64_t v21 = v38;
    if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
    [(VKGlobeCameraController *)v20 setGlobeView:v4->_globeView];
    [(VKCameraController *)v20 setCanvas:v4->super._displayTarget];
    -[VKGlobeCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:](v20, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:", 2, 0, 0, 58.412323, 15.569748, 2000.0, 0.0, 0.0, 0.0);
    uint64_t v22 = v20;
    v35 = &unk_1EF5597F8;
    v36 = v22;
    objc_storeStrong((id *)&v4->super._cameraController._obj, v20);
    double v23 = v36;
    v36 = 0;

    v35 = &unk_1EF5597F8;
    [(VKGlobeImageCanvas *)v4 _updateViewport];
    int v24 = (int8x8_t *)*((void *)a3 + 140);
    int8x8_t v25 = v24[2];
    if (v25)
    {
      uint8x8_t v26 = (uint8x8_t)vcnt_s8(v25);
      v26.i16[0] = vaddlv_u8(v26);
      if (v26.u32[0] > 1uLL)
      {
        uint64_t v27 = 0x2FED70A4459DFCA1;
        if (*(void *)&v25 <= 0x2FED70A4459DFCA1uLL) {
          uint64_t v27 = 0x2FED70A4459DFCA1uLL % *(void *)&v25;
        }
      }
      else
      {
        uint64_t v27 = (*(void *)&v25 - 1) & 0x2FED70A4459DFCA1;
      }
      char v28 = *(void **)(*(void *)&v24[1] + 8 * v27);
      if (v28)
      {
        char v29 = (void *)*v28;
        if (v29)
        {
          if (v26.u32[0] < 2uLL)
          {
            uint64_t v30 = *(void *)&v25 - 1;
            while (1)
            {
              uint64_t v32 = v29[1];
              if (v32 == 0x2FED70A4459DFCA1)
              {
                if (v29[2] == 0x2FED70A4459DFCA1) {
                  goto LABEL_32;
                }
              }
              else if ((v32 & v30) != v27)
              {
                goto LABEL_29;
              }
              char v29 = (void *)*v29;
              if (!v29) {
                goto LABEL_29;
              }
            }
          }
          do
          {
            unint64_t v31 = v29[1];
            if (v31 == 0x2FED70A4459DFCA1)
            {
              if (v29[2] == 0x2FED70A4459DFCA1)
              {
LABEL_32:
                v33 = (md::StyleLogic *)v29[5];
LABEL_30:
                md::StyleLogic::globeContext(v33);
                operator new();
              }
            }
            else
            {
              if (v31 >= *(void *)&v25) {
                v31 %= *(void *)&v25;
              }
              if (v31 != v27) {
                break;
              }
            }
            char v29 = (void *)*v29;
          }
          while (v29);
        }
      }
    }
LABEL_29:
    v33 = 0;
    goto LABEL_30;
  }
  return 0;
}

@end