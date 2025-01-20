@interface VKMapImageCanvas
- (BOOL)forceRasterizationForGlobe;
- (NSArray)overlays;
- (VKMapImageCanvas)initWithMapEngine:(void *)a3;
- (id).cxx_construct;
- (id)initWithMapEngine:;
- (uint64_t)initWithMapEngine:;
- (void)addOverlay:(id)a3;
- (void)cancelTileRequests;
- (void)clearScene;
- (void)dealloc;
- (void)initWithMapEngine:;
- (void)resetCameraController;
- (void)setForceRasterizationForGlobe:(BOOL)a3;
- (void)setMapType:(int)a3;
- (void)tileGroupDidChange;
- (void)updateOverlays;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
@end

@implementation VKMapImageCanvas

- (id).cxx_construct
{
  *((void *)self + 17) = &unk_1EF559CF8;
  *((void *)self + 18) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_overlayContainer.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  self->_manifestTileGroupObserverProxy._vptr$_retain_ptr = (void **)&unk_1EF559CF8;
  obj = self->_manifestTileGroupObserverProxy._obj;
}

- (BOOL)forceRasterizationForGlobe
{
  return self->_forceRasterizationForGlobe;
}

- (void)setForceRasterizationForGlobe:(BOOL)a3
{
  if (self->_forceRasterizationForGlobe == a3) {
    return;
  }
  self->_forceRasterizationForGlobe = a3;
  ptr = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)ptr + 232));
  v25 = 0;
  v26 = 0;
  uint64_t v27 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v25, *((void *)ptr + 20), *((void *)ptr + 21), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)ptr + 21) - *((void *)ptr + 20)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)ptr + 232));
  v5 = v25;
  v6 = v26;
  if (v25 != v26)
  {
    v7 = v25;
    do
    {
      id v8 = v7[1];
      [v8 setForceRasterizationForGlobe:self->_forceRasterizationForGlobe];

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
      v10 = (char *)(v6 - 3);
      v11 = v10;
      v12 = v10;
      do
      {
        v13 = *(void (***)(char *))v12;
        v12 -= 24;
        (*v13)(v11);
        v10 -= 24;
        BOOL v14 = v11 == (char *)v5;
        v11 = v12;
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
  v15 = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)v15 + 232));
  v25 = 0;
  v26 = 0;
  uint64_t v27 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v25, *((void *)v15 + 23), *((void *)v15 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 + 24) - *((void *)v15 + 23)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)v15 + 232));
  v16 = (char *)v25;
  v17 = v26;
  if (v25 == v26)
  {
    if (!v25) {
      return;
    }
    goto LABEL_23;
  }
  v18 = v25;
  do
  {
    id v19 = v18[1];
    [v19 setForceRasterizationForGlobe:self->_forceRasterizationForGlobe];

    id v20 = v18[1];
    [v20 setNeedsDisplayForReason:2];

    v18 += 3;
  }
  while (v18 != v17);
  if (v16)
  {
    if (v16 != (char *)v17)
    {
      v21 = (char *)(v17 - 3);
      v22 = (char *)(v17 - 3);
      v23 = (char *)(v17 - 3);
      do
      {
        v24 = *(void (***)(char *))v23;
        v23 -= 24;
        (*v24)(v22);
        v21 -= 24;
        BOOL v14 = v22 == v16;
        v22 = v23;
      }
      while (!v14);
    }
LABEL_23:
    operator delete(v16);
  }
}

- (void)tileGroupDidChange
{
  mapEngine = (md::HomeQueueScheduler **)self->_mapEngine;
  md::HomeQueueScheduler::waitForSynchronization(mapEngine[567], "-[VKMapImageCanvas tileGroupDidChange]");
  md::MapEngineSyncAccessor::configurationDidChange((md::MapEngineSyncAccessor *)mapEngine);
}

- (void)cancelTileRequests
{
  v2 = *(void **)(*((void *)self->_mapEngine + 112) + 24);
  uint64_t v3 = v2[1];
  for (uint64_t i = v2[2]; v3 != i; v3 += 24)
    gdc::LayerDataSource::cancelAllLayerDataRequests(*(gdc::LayerDataSource **)(v3 + 8));
  v5 = (gdc::ResourceManager *)v2[7];
  gdc::ResourceManager::cleanupResources(v5);
}

- (void)clearScene
{
  mapEngine = (md::HomeQueueScheduler **)self->_mapEngine;
  md::HomeQueueScheduler::waitForSynchronization(mapEngine[567], "-[VKMapImageCanvas clearScene]");
  md::MapEngineSyncAccessor::clearScene((md::MapEngineSyncAccessor *)mapEngine);
}

- (void)addOverlay:(id)a3
{
  v4 = (VKOverlay *)a3;
  md::OverlayContainer::addOverlay((md::OverlayContainer *)self->_overlayContainer.__ptr_, v4);
  cntrl = self->_overlayContainer.__cntrl_;
  ptr = self->_overlayContainer.__ptr_;
  v7 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  [(VKOverlay *)v4 setStandardContainer:&ptr];
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  -[VKOverlay setRunLoopController:](v4, "setRunLoopController:", self->super._runLoopController, ptr);
  [(VKOverlay *)v4 setForceRasterizationForGlobe:self->_forceRasterizationForGlobe];
  [(VKMapImageCanvas *)self updateOverlays];
}

- (void)updateOverlays
{
  __p = 0;
  id v19 = 0;
  uint64_t v20 = 0;
  md::OverlayContainer::computeTileExclusionAreas(self->_overlayContainer.__ptr_, &__p);
  uint64_t v3 = (int8x8_t *)*((void *)self->_mapEngine + 140);
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
  v7 = *(void **)(*(void *)&v3[1] + 8 * v6);
  if (!v7 || (id v8 = (void *)*v7) == 0)
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
      id v8 = (void *)*v8;
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
    id v8 = (void *)*v8;
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
  uint64_t v13 = *((void *)self->_mapEngine + 140);
  unint64_t v14 = *(void *)(v13 + 16);
  if ((v14 & (v14 - 1)) != 0)
  {
    unint64_t v16 = 0x87668FB4D087F775;
    if (v14 <= 0x87668FB4D087F775) {
      unint64_t v16 = 0x87668FB4D087F775 % v14;
    }
    v15 = *(void **)(*(void *)(v13 + 8) + 8 * v16);
    do
    {
      do
        v15 = (void *)*v15;
      while (v15[1] != 0x87668FB4D087F775);
    }
    while (v15[2] != 0x87668FB4D087F775);
  }
  else
  {
    v15 = *(void **)(*(void *)(v13 + 8) + 8 * ((v14 - 1) & 0x87668FB4D087F775));
    do
    {
      do
        v15 = (void *)*v15;
      while (v15[1] != 0x87668FB4D087F775);
    }
    while (v15[2] != 0x87668FB4D087F775);
  }
  *(unsigned char *)(v15[5] + 923) = 1;
  v17 = __p;
  if (__p)
  {
    operator delete(v17);
  }
}

- (void)setMapType:(int)a3
{
  self->super._mapType = a3;
  [(VKMapImageCanvas *)self resetCameraController];
  if ((a3 - 3) >= 8) {
    char v5 = 0;
  }
  else {
    char v5 = 0x100000000000101uLL >> (8 * (a3 - 3));
  }
  self->_forceRasterizationForGlobe = v5;
}

- (void)resetCameraController
{
  if (self->super._mapType != 11)
  {
    unint64_t v14 = [VKMapCameraController alloc];
    mapEngine = self->_mapEngine;
    uint64_t v16 = *((void *)mapEngine + 113);
    uint64_t v17 = *((void *)mapEngine + 14);
    uint64_t v18 = *((void *)mapEngine + 15);
    id v19 = *((id *)mapEngine + 138);
    uint64_t v20 = [(VKMapCameraController *)v14 initWithMapDataAccess:v16 animationRunner:v17 runLoopController:v18 cameraDelegate:v19];

    [(VKCameraController *)v20 setCanvas:self->super._displayTarget];
    [(VKScreenCameraController *)v20 setVkCamera:self->super._vkCamera._obj];
    v21 = self->_mapEngine;
    uint64_t v22 = v21[133];
    v23 = (std::__shared_weak_count *)v21[134];
    uint64_t v43 = v22;
    v44 = v23;
    if (v23) {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(VKMapCameraController *)v20 setCamera:&v43];
    v24 = v44;
    if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
    [(VKMapCameraController *)v20 setMapEngine:self->_mapEngine];
    v47 = &unk_1EF5597F8;
    id v48 = v20;
    objc_storeStrong((id *)&self->super._cameraController._obj, v20);
    v25 = v20;
    id v26 = v48;
    id v48 = 0;

    v47 = &unk_1EF5597F8;
    return;
  }
  uint64_t v3 = [VKMuninCameraController alloc];
  int8x8_t v4 = self->_mapEngine;
  char v5 = (std::__shared_weak_count *)*((void *)v4 + 2);
  uint64_t v45 = *((void *)v4 + 1);
  v46 = v5;
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    int8x8_t v4 = self->_mapEngine;
  }
  uint64_t v6 = *((void *)v4 + 113);
  uint64_t v7 = *((void *)v4 + 14);
  uint64_t v8 = *((void *)v4 + 15);
  id v9 = *((id *)v4 + 138);
  unint64_t v10 = (int8x8_t *)*((void *)self->_mapEngine + 140);
  int8x8_t v11 = v10[2];
  if (!*(void *)&v11)
  {
    uint64_t v27 = 0;
    goto LABEL_52;
  }
  uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    uint64_t v13 = 0x669A8EDAC04FCBF1;
    if (*(void *)&v11 <= 0x669A8EDAC04FCBF1uLL) {
      uint64_t v13 = 0x669A8EDAC04FCBF1uLL % *(void *)&v11;
    }
  }
  else
  {
    uint64_t v13 = (*(void *)&v11 - 1) & 0x669A8EDAC04FCBF1;
  }
  int8x8_t v28 = v10[1];
  v29 = *(void **)(*(void *)&v28 + 8 * v13);
  if (!v29 || (v30 = (void *)*v29) == 0)
  {
LABEL_31:
    uint64_t v27 = 0;
    goto LABEL_32;
  }
  if (v12.u32[0] < 2uLL)
  {
    while (1)
    {
      uint64_t v32 = v30[1];
      if (v32 == 0x669A8EDAC04FCBF1)
      {
        if (v30[2] == 0x669A8EDAC04FCBF1) {
          goto LABEL_57;
        }
      }
      else if ((v32 & (*(void *)&v11 - 1)) != v13)
      {
        goto LABEL_31;
      }
      v30 = (void *)*v30;
      if (!v30) {
        goto LABEL_31;
      }
    }
  }
  while (1)
  {
    unint64_t v31 = v30[1];
    if (v31 == 0x669A8EDAC04FCBF1) {
      break;
    }
    if (v31 >= *(void *)&v11) {
      v31 %= *(void *)&v11;
    }
    if (v31 != v13) {
      goto LABEL_31;
    }
LABEL_21:
    v30 = (void *)*v30;
    if (!v30) {
      goto LABEL_31;
    }
  }
  if (v30[2] != 0x669A8EDAC04FCBF1) {
    goto LABEL_21;
  }
LABEL_57:
  uint64_t v27 = v30[5];
LABEL_32:
  if (v12.u32[0] > 1uLL)
  {
    uint64_t v33 = 0x17767EADC5B287BLL;
    if (*(void *)&v11 <= 0x17767EADC5B287BuLL) {
      uint64_t v33 = 0x17767EADC5B287BuLL % *(void *)&v11;
    }
  }
  else
  {
    uint64_t v33 = (*(void *)&v11 - 1) & 0x17767EADC5B287BLL;
  }
  v34 = *(void **)(*(void *)&v28 + 8 * v33);
  if (!v34 || (v35 = (void *)*v34) == 0)
  {
LABEL_51:
    int8x8_t v11 = 0;
    goto LABEL_52;
  }
  if (v12.u32[0] < 2uLL)
  {
    uint64_t v36 = *(void *)&v11 - 1;
    while (1)
    {
      uint64_t v38 = v35[1];
      if (v38 == 0x17767EADC5B287BLL)
      {
        if (v35[2] == 0x17767EADC5B287BLL) {
          goto LABEL_58;
        }
      }
      else if ((v38 & v36) != v33)
      {
        goto LABEL_51;
      }
      v35 = (void *)*v35;
      if (!v35) {
        goto LABEL_51;
      }
    }
  }
  while (2)
  {
    unint64_t v37 = v35[1];
    if (v37 != 0x17767EADC5B287BLL)
    {
      if (v37 >= *(void *)&v11) {
        v37 %= *(void *)&v11;
      }
      if (v37 != v33) {
        goto LABEL_51;
      }
      goto LABEL_41;
    }
    if (v35[2] != 0x17767EADC5B287BLL)
    {
LABEL_41:
      v35 = (void *)*v35;
      if (!v35) {
        goto LABEL_51;
      }
      continue;
    }
    break;
  }
LABEL_58:
  int8x8_t v11 = (int8x8_t)v35[5];
LABEL_52:
  v39 = [(VKMuninCameraController *)v3 initWithTaskContext:&v45 mapDataAccess:v6 animationRunner:v7 runLoopController:v8 cameraDelegate:v9 muninSceneLogic:v27 elevationLogic:*(void *)&v11];
  v47 = &unk_1EF5597F8;
  id v48 = v39;
  objc_storeStrong((id *)&self->super._cameraController._obj, v39);
  v40 = v39;
  id v41 = v48;
  id v48 = 0;

  v47 = &unk_1EF5597F8;
  v42 = v46;
  if (v46)
  {
    if (!atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  [(VKCameraController *)self->super._cameraController._obj setCanvas:self->super._displayTarget];
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VKMapImageCanvas;
  -[VKImageCanvas updateWithTimestamp:withContext:](&v19, sel_updateWithTimestamp_withContext_);
  [(VKCameraController *)self->super._cameraController._obj updateWithTimestamp:a4 withContext:a3];
  if (![(VKCameraController *)self->super._cameraController._obj usesVKCamera]) {
    return;
  }
  uint64_t v7 = self->super._vkCamera._obj;
  v25 = 0;
  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
    uint64_t v9 = mapEngine[149];
    if (v9)
    {
      if (*(unsigned char *)(v9 + 488) && (uint64_t v10 = *(void *)(v9 + 480)) != 0)
      {
        if (v10 == v9 + 456)
        {
          v23 = v22;
          (*(void (**)(uint64_t, void *))(*(void *)(v9 + 456) + 24))(v9 + 456, v22);
LABEL_10:
          uint8x8_t v12 = v25;
          v25 = 0;
          if (v12 == v24)
          {
            (*(void (**)(void *))(v24[0] + 32))(v24);
            uint64_t v13 = v23;
            if (v23)
            {
LABEL_14:
              if (v13 == v22)
              {
                v25 = v24;
                (*(void (**)(void *, void *))(v22[0] + 24))(v22, v24);
                if (v23 == v22)
                {
                  (*(void (**)(void *))(v22[0] + 32))(v22);
                }
                else if (v23)
                {
                  (*(void (**)(void))(*v23 + 40))();
                }
              }
              else
              {
                v25 = v13;
              }
              goto LABEL_18;
            }
          }
          else
          {
            if (v12) {
              (*(void (**)(void *))(*v12 + 40))(v12);
            }
            uint64_t v13 = v23;
            if (v23) {
              goto LABEL_14;
            }
          }
          v25 = 0;
          goto LABEL_18;
        }
        uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 16))(v10);
      }
      else
      {
        uint64_t v11 = 0;
      }
      v23 = (void *)v11;
      goto LABEL_10;
    }
  }
LABEL_18:
  cntrl = self->super._camera.__cntrl_;
  ptr = self->super._camera.__ptr_;
  uint64_t v18 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = (uint64_t)v25;
  if (!v25) {
    goto LABEL_23;
  }
  if (v25 != v24)
  {
    uint64_t v15 = (*(uint64_t (**)(void))(*v25 + 16))();
LABEL_23:
    v21 = (void *)v15;
    goto LABEL_25;
  }
  v21 = v20;
  (*(void (**)(void *, void *))(v24[0] + 24))(v24, v20);
LABEL_25:
  [(VKCamera *)v7 updateCamera:&ptr withAdjustment:v20];
  if (v21 != v20)
  {
    if (v21) {
      (*(void (**)(void))(*v21 + 40))();
    }
    uint64_t v16 = (std::__shared_weak_count *)v18;
    if (!v18) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  (*(void (**)(void *))(v20[0] + 32))(v20);
  uint64_t v16 = (std::__shared_weak_count *)v18;
  if (v18)
  {
LABEL_31:
    if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_33:
  if (v25 == v24)
  {
    (*(void (**)(void *))(v24[0] + 32))(v24);
  }
  else if (v25)
  {
    (*(void (**)(void))(*v25 + 40))();
  }
}

- (void)dealloc
{
  [(VKCameraController *)self->super._cameraController._obj setCanvas:0];
  v3.receiver = self;
  v3.super_class = (Class)VKMapImageCanvas;
  [(VKMapImageCanvas *)&v3 dealloc];
}

- (NSArray)overlays
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  ptr = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)ptr + 232));
  v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v42, *((void *)ptr + 20), *((void *)ptr + 21), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)ptr + 21) - *((void *)ptr + 20)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)ptr + 232));
  char v5 = v42;
  uint64_t v6 = v43;
  uint64_t v7 = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)v7 + 232));
  v39 = 0;
  v40 = 0;
  uint64_t v41 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v39, *((void *)v7 + 23), *((void *)v7 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v7 + 24) - *((void *)v7 + 23)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)v7 + 232));
  uint64_t v8 = v39;
  uint64_t v9 = v40;
  uint64_t v10 = (void *)[v3 initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v6 - v5) >> 3) - 0x5555555555555555 * ((v40 - v39) >> 3)];
  if (v8)
  {
    if (v9 == v8)
    {
      uint64_t v8 = v9;
    }
    else
    {
      uint64_t v11 = v9 - 24;
      uint8x8_t v12 = v11;
      uint64_t v13 = v11;
      do
      {
        unint64_t v14 = *(void (***)(char *))v13;
        v13 -= 24;
        (*v14)(v12);
        v11 -= 24;
        BOOL v15 = v12 == v8;
        uint8x8_t v12 = v13;
      }
      while (!v15);
    }
    operator delete(v8);
  }
  if (v5)
  {
    if (v6 == v5)
    {
      char v5 = v6;
    }
    else
    {
      uint64_t v16 = v6 - 24;
      uint64_t v17 = (void (***)(void))(v6 - 24);
      uint64_t v18 = (void (***)(void))(v6 - 24);
      do
      {
        objc_super v19 = *v18;
        v18 -= 3;
        (*v19)(v17);
        v16 -= 24;
        BOOL v15 = v17 == (void (***)(void))v5;
        uint64_t v17 = v18;
      }
      while (!v15);
    }
    operator delete(v5);
  }
  uint64_t v20 = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)v20 + 232));
  v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v42, *((void *)v20 + 20), *((void *)v20 + 21), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v20 + 21) - *((void *)v20 + 20)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)v20 + 232));
  v21 = (id *)v42;
  uint64_t v22 = (id *)v43;
  if (v42 == v43)
  {
    if (!v42) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  v23 = (id *)v42;
  do
  {
    id v24 = v23[1];
    [v10 addObject:v24];

    v23 += 3;
  }
  while (v23 != v22);
  if (v21)
  {
    if (v21 != v22)
    {
      v25 = (char *)(v22 - 3);
      uint64_t v26 = v25;
      uint64_t v27 = v25;
      do
      {
        int8x8_t v28 = *(void (***)(char *))v27;
        v27 -= 24;
        (*v28)(v26);
        v25 -= 24;
        BOOL v15 = v26 == (char *)v21;
        uint64_t v26 = v27;
      }
      while (!v15);
    }
LABEL_27:
    operator delete(v21);
  }
LABEL_28:
  v29 = self->_overlayContainer.__ptr_;
  std::mutex::lock((std::mutex *)((char *)v29 + 232));
  v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v42, *((void *)v29 + 23), *((void *)v29 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v29 + 24) - *((void *)v29 + 23)) >> 3));
  std::mutex::unlock((std::mutex *)((char *)v29 + 232));
  v30 = (id *)v42;
  unint64_t v31 = (id *)v43;
  if (v42 == v43)
  {
    if (!v42) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  uint64_t v32 = (id *)v42;
  do
  {
    id v33 = v32[1];
    [v10 addObject:v33];

    v32 += 3;
  }
  while (v32 != v31);
  if (v30)
  {
    if (v30 != v31)
    {
      v34 = (char *)(v31 - 3);
      v35 = v34;
      uint64_t v36 = v34;
      do
      {
        unint64_t v37 = *(void (***)(char *))v36;
        v36 -= 24;
        (*v37)(v35);
        v34 -= 24;
        BOOL v15 = v35 == (char *)v30;
        v35 = v36;
      }
      while (!v15);
    }
LABEL_38:
    operator delete(v30);
  }
LABEL_39:
  return (NSArray *)v10;
}

- (VKMapImageCanvas)initWithMapEngine:(void *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)VKMapImageCanvas;
  int8x8_t v4 = -[VKImageCanvas initWithMapEngine:](&v22, sel_initWithMapEngine_);
  char v5 = v4;
  uint64_t v6 = v4;
  if (v4)
  {
    v4->_mapEngine = a3;
    uint64_t v7 = *((void *)a3 + 112);
    uint64_t v9 = *(OverlayContainer **)(v7 + 272);
    uint64_t v8 = *(void *)(v7 + 280);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_overlayContainer.__cntrl_;
    v4->_overlayContainer.__ptr_ = v9;
    v4->_overlayContainer.__cntrl_ = (__shared_weak_count *)v8;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    [(VKMapImageCanvas *)v6 resetCameraController];
    uint64_t v11 = [VKManifestTileGroupObserverProxy alloc];
    mapEngine = v6->_mapEngine;
    uint64_t v13 = (void *)*((void *)mapEngine + 1);
    unint64_t v14 = (std::__shared_weak_count *)*((void *)mapEngine + 2);
    id location = v13;
    v21 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    BOOL v15 = [(VKManifestTileGroupObserverProxy *)v11 initWithQueue:*v13];
    if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    uint64_t v16 = v15;
    objc_storeStrong((id *)&v5->_manifestTileGroupObserverProxy._obj, v15);
    v21 = 0;

    id location = &unk_1EF559CF8;
    objc_initWeak(&location, v6);
    objc_copyWeak(&to, &location);
    int8x8_t v28 = 0;
    uint64_t v26 = (void (**)(void **))&unk_1EF56C3A8;
    objc_moveWeak(&v27, &to);
    int8x8_t v28 = (void **)&v26;
    objc_destroyWeak(&to);
    [(VKManifestTileGroupObserverProxy *)v16 setDidChangeActiveTileGroup:&v26];
    if (v28 == (void **)&v26)
    {
      v26[4]((void **)&v26);
    }
    else if (v28)
    {
      (*((void (**)(void))*v28 + 5))();
    }
    objc_copyWeak(&v18, &location);
    v25 = 0;
    v23 = (void (**)(void **))&unk_1EF56C3F0;
    objc_moveWeak(&v24, &v18);
    v25 = (void **)&v23;
    objc_destroyWeak(&v18);
    [(VKManifestTileGroupObserverProxy *)v16 setExperimentConfigurationDidChange:&v23];
    if (v25 == (void **)&v23)
    {
      v23[4]((void **)&v23);
    }
    else if (v25)
    {
      (*((void (**)(void))*v25 + 5))();
    }
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)initWithMapEngine:
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x1A6239270);
}

- (id)initWithMapEngine:
{
  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1EF56C3A8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)initWithMapEngine:
{
  return a1;
}

@end